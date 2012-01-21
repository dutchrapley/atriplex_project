class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private

    def require_admin
      unless is_admin?
        flash[:error] = "Only admins can do that."
        redirect_to root_path # halts request cycle
      end
    end

    def require_editor
      unless is_editor? || is_admin?
        flash[:error] = "Only Editors can do that."
        redirect_to new_user_session_path
      end
    end

    # The logged_in? method simply returns true if the user is logged
    # in and false otherwise. It does this by "booleanizing" the
    # current_user method we created previously using a double ! operator.
    # Note that this is not common in Ruby and is discouraged unless you
    # really mean to convert something into true or false.
    def is_admin?
      !!current_user.admin
    end

    def is_editor?
      !!current_user.editor
    end
    
end
