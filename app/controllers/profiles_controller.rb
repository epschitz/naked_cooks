class ProfilesController < ApplicationController

  before_filter :authenticate_user!
  
  respond_to :html, :xml, :json
  
  def show
  end
  
  def edit
    @profile = Profile.find(params[:id])
    
    redirect_to current_user.profile unless current_user = @profile.user
    
    respond_with @profiles
    
  end
  
  def update
    @profile = Profile.find(params[:id])
    
    respond_to do |format|
      if @profile.user == current_user && @profile.update_attributes(params[:profile])
        format.html { redirect_to(@profile, :notice => 'Profile was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @profile.errors, :status => :unprocessable_entity }
      end
    end

  end
  
end
