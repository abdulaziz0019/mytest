class ApplicationController < ActionController::Base


      def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
      end

      def logged_in
        !!current_user
      end

      def require_user
        if !logged_in
          flash[:danger] = "you are not logged in, Sir/Madam"
          redirect_to root_path
        end
      end
      def is_admin
       if logged_in && current_user.admin?
       end

  end



      # don't forget this line too
      helper_method :current_user,:logged_in,:require_user,:is_admin
end
