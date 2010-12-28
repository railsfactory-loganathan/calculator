class ProjectsController < ApplicationController
				@@arr=[]
				def index
									@projectmodel=Projectmodel.find(:all)											
				end						
				def new
									@projectmodel=Projectmodel.new
									flash[:notice]="New Project Should Not Be Created"
				end					
				def create									
									params[:projectmodel].store("user_id",current_user.id)
									@projectmodel=Projectmodel.new(params[:projectmodel])
									check=@projectmodel.save
									if check
									flash[:notice]="New Project Created Successfully"
									else
									flash[:notice]="New Project Should Not Be Created"
									end
									@projectmodel=Projectmodel.find(:all)	
									render :action=>'index'
				end			
				def destroy									
									check=Projectmodel.delete(params[:id])
									@projectmodel=Projectmodel.find(:all)
									if check
									flash[:notice]="The Project Details Deleted At id: "+params[:id] 
									else
									flash[:notice]="Your Record Should Not Be Deleted"
									end	
									render :action=>'index'
				end
				def edit
									@projectmodel=Projectmodel.find_by_id(params[:id])		
				end
				def show									
									@projectmodel=Projectmodel.find_by_id(params[:id])
				end		
				def update
									@projectmodel=Projectmodel.find_by_id(params[:id])
									@projectmodel.update_attributes(params[:projectmodel])
									check=@projectmodel.save
									if check
									flash[:notice]="The Project Details updated At id: "+params[:id] 
									else
									flash[:notice]="Your Record Should Not Be updated"
									end	
									@projectmodel=Projectmodel.find(:all)									
									render :action=>'index'
				end					
				def membershow
									@@arr<<params[:id]
									puts @@arr
									@member=Member.find(:all,:conditions=>["project_id=?",@@arr[0]])
				end		
				def membernew					
									@member=Member.new
				end		
				def membercreate									
									params[:member].store("createdid",current_user.id)	
									@member=Member.new(params[:member])
									@member.save
									@member=Member.find(:all)
									render :action=>'memberindex'
				end	
				def memberindex								
									@member=Member.find(:all)
				end
				def memberedit
									@member=Member.find_by_id(params[:id])
				end
				def memberupdate
									@member=Member.find_by_id(params[:id])
									@member.update_attributes(params[:member])
									@member=Member.find(:all)
									render :action=>'memberindex'
				end
				def memberdelete
									Member.delete(params[:id])
									@member=Member.find(:all)
									render :action=>'memberindex'
				end			
				def invitenewmember
									@idd=params[:id]
									@member=Member.find(:all)
				end		
				def membersendmail
									@body="Click Here To Join With Project With ID:#{params[:id]} <a heft="">"	
									Callmember.welcome(params[:member][:email]).deliver
									@member=Member.find(:all)
									render :action=>'invitenewmember'
				end					
end
