class RelationshpsController < ApplicationController
  def following
  end
  
  def follower
  end
  
  def create
  end
  
  def destroy
  end
  
  
  private
  
  def relationship_params
    params.require(:relationship).permit(:follower, :follewd)
  end
  
end
