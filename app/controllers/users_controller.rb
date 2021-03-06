# frozen_string_literal: true

class UsersController < ProtectedController
  skip_before_action :authenticate, only: %i[signup signin]

  # POST '/sign-up'
  def signup
    user = User.create(user_creds)
    if user.valid?
      render json: user, status: :created
    else
      render json: user.errors, status: :bad_request
    end
  end

  # POST '/sign-in'
  def signin
    creds = user_creds
    if (user = User.authenticate creds[:email],
                                 creds[:password])
      render json: user, serializer: UserLoginSerializer, root: 'user'
    else
      head :unauthorized
    end
  end

  # DELETE '/sign-out/1'
  def signout
    if current_user == User.find(params[:id])
      current_user.logout
      head :no_content
    else
      head :unauthorized
    end
  end

  # PATCH '/change-password/:id'
  def changepw
    if !current_user.authenticate(pw_creds[:old]) ||
       (current_user.password = pw_creds[:new]).blank? ||
       !current_user.save
      head :bad_request
    else
      head :no_content
    end
  end

  def index
    render json: User.all
  end

  def show
    user = User.find(params[:id])
    render json: user
  end

  def update
    if current_user == User.find(params[:id])
      update_owner
      render json: current_user, status: :created
    else
      head :unauthorized
    end
  end

  # ===== private class methods follow =====
  private

  def owner_creds
    params.require(:credentials)
          .permit(:name, :organization)
  end

  def pw_creds
    params.require(:passwords)
          .permit(:old, :new)
  end

  def update_owner
    current_user.name = owner_creds[:name]
    current_user.organization = owner_creds[:organization]
  end

  def user_creds
    params.require(:credentials)
          .permit(:email, :password, :password_confirmation,
                  :name, :organization)
  end
end
