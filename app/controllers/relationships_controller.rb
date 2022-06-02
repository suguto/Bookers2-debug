class RelationshipsController < ApplicationController

  def following
    @user=User.find(params[:user_id])
    @users=@user.followings.page(params[:page]).per(5)
  end

  def follower
    @user=User.find(params[:user_id])
    @users=@user.follwers
  end

  def create
    @user=User.find(params[:user_id])
    current_user.follow(@user)
    redirect_to request.referer
  end

  def destroy
    @user=User.find(params[:user_id])
    current_user.unfollow(@user)
  end


  private

  def relationship_params
    params.require(:relationship).permit(:follower, :follewd)
  end

end
