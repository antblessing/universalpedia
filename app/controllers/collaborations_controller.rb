class CollaborationsController < ApplicationController
  before_action :set_wiki
  
  def create
    @collaboration = @wiki.collaborations.new(user_id: params[:user_id])
    
    if @collaboration.save
      flash[:notice] = "Collaborator was added."
      redirect_to wiki_collaborations_path
    else
      flash[:error] = "Collaborator was not added."
      render wiki_collaborations_path
    end
  end

  def destroy
    @collaboration = @wiki.collaborations.find(params[:wiki_id])
    
    if @collaboration.destroy
      flash[:notice] = "Collaborator has been removed."
      redirect_to wiki_collaborations_path
    else
      flash[:error] = "Whoops!"
    end
  end
  
  def index
    @users = User.all
  end
  
  def set_wiki
    @wiki = Wiki.find(params[:wiki_id])
  end
end
