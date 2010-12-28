require 'authenticated_system.rb'
class ApplicationController < ActionController::Base
  protect_from_forgery   
  include AuthenticatedSystem
          def checkauthentication
                  unless !logged_in?                          
                          flash[:notice]="Yor Must Login And Access The Required Page";
                          redirect_to(new_session_url,:notice=>flash[:error])                          
                  end
        end
          def logged_in?
                  !!current_user
          end
end
