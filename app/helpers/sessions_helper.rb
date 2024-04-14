module SessionsHelper
    
    # 渡されたユーザでログインする
    def log_in(user)
        session[:user_id] = user.id
    end

    # ユーザがいなければ、ユーザを取得する
    def current_user
        if session[:user_id]
            @current_user ||= User.find_by(id: session[:user_id])
        end
    end

    # ログイン出来ているかチェック
    def logged_in?
        !current_user.nil?
    end

    # ログアウト
    def log_out
        reset_session
        @current_user = nil
    end
end
