class Api::V1::UsersController < ApplicationController
  before_action only: [:update, :destroy, :profile] do 
    authorized_user?(request)
  end 

  def index
    @users = Api::V1::User.all 
    
    render json: @users 
  end

  def create
    @user = Api::V1::User.new(user_params)
    if @user.save
      render json: @user 
    else
      render status: 422
    end
  end

  def profile 
    if @user 
      if !@user.tutor
        render json: @user, :include => {
          :appointments => {
            :include => {
              :subjects => {},
              :tutors => {}
            }
          }
         
        }
      else
        render json: @user, :include => {
          :appointments => {
            :include => {
              :subjects => {},
              :tutors => {}  
            }
          },
          :student_appointments => {
            :include => {
              :students => {},
              :subjects => {}
            }
          },
          :tutor_subjects => {
            :include => {
              :subjects => {}
            }
          }
        }
      end
    else
      render status: 401
    end
  end

  def update
    if @user
      if @user.update(user_params)
        render json: @user 
      else
        render status: 418
      end
    else
      render status: 422
    end
  end

  def destroy 
    if @user 
      @user.destroy
      redirect_to "http://localhost:3000/api/v1/users"
    else
      render status: 422
    end
  end

  private

  def user_params 
    params.require(:user).permit([:name, :username, :email, :password, :phone, :tutor])
  end

  def authorized_user?(request)
    authorization_header = request.headers[:authorization]
    if !authorization_header
      render status: 401
    else
      secret_key = Rails.application.secrets.secret_key_base[0]
      token = request.headers[:authorization].split(" ")[1]
      decoded_token = JWT.decode(token, secret_key)
      @user = Api::V1::User.find(decoded_token[0]["user_id"])
    end
    @user 
  end

end
