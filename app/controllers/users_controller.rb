class UsersController < ApplicationController
  def new
  end

  def create
		u = User.new
		u.username = params[:username]
		if params[:password] == params[:retype_password]
			u.password = params[:password]
			if u.save
				flash[:alert] = "회원 가입이 정상적으로 완료되었습니다."
				redirect_to "/"
			else
				flash[:alert] = u.errors.values.flatten.join(' ')
				redirect_to :back
			end
		else
			flash[:alert] = "비밀번호가 맞지 않습니다."
			redirect_to :back
		end
  end

  def new_session
  end

  def create_session
		u = User.where(username: params[:username])[0]
		if u.nil?
			flash[:alert] = "아이디 또는 비밀번호를 잘못 입력하셨습니다."
			redirect_to :back
		else
			if u.password != params[:password]
				flash[:alert] = "아이디 또는 비밀번호를 잘못 입력하셨습니다."
				redirect_to :back
			else
				session[:user_id] = u.id
				flash[:alert] = "성공적으로 로그인하였습니다."
				redirect_to "/"
			end
		end
  end

  def destroy_session
		reset_session
		redirect_to :back
  end
end
