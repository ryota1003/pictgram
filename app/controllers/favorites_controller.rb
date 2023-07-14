class FavoritesController < ApplicationController
  def index
    @favorite_topics = current_user.favorite_topics
  end

  def create
    favorite = Favorite.new
    favorite.user_id = current_user.id
    favorite.topic_id = params[:topic_id]

    if favorite.save
      redirect_to topics_path, success: 'お気に入りに登録しました'
    else
      redirect_to topics_path, danger: 'お気に入りに登録に失敗しました'
    end
  end
  
  def destroy
    favorite = Favorite.find_by(user_id: current_user.id , topic_id: params[:topic_id])
    #find_byにて検索をかけるときはだれが、どこに、という情報を記述しなければならない。
    #user_idとtopic_idはfavoriteテーブルにはいっている
    #paramsとは送られてきた値を受け取るためのメソッド。topicsのindex.html.erbの20行目のtopic_idから受け取っている。params[:カラム名]となる。
    favorite.destroy
    if favorite.destroyed?
    #削除するかどうか聞いている。過去形でかく。？がないと強制的に削除されてしまう。
      redirect_to topics_path, success: 'お気に入りを削除しました'
    else
      redirect_to topics_path, danger: 'お気に入り削除に失敗しました'
    end
  end
end
