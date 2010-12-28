class Callmember < ActionMailer::Base
              default :from => "mohanraj.ramanujam@sedin.co.in"
              def welcome(recipient,body)                          
                          mail(:to=>recipient,:body=>body,:subject=>"Join To Project Member")
              end                        
end
