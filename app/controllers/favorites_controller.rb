class FavoritesController < ApplicationController
    def create
      #@micropostとはならないよ
      micropost = Feed.find(params[:feed_id])
      current_user.like(micropost)
      flash[:success] = 'お気に入り登録をしました。'
      redirect_back(fallback_location: root_path)
    end
  
    def destroy
      micropost = Feed.find(params[:feed_id])
      current_user.unlike(micropost)
      flash[:success] = 'お気に入り登録を解除しました。'
      redirect_back(fallback_location: root_path)
    end
  end