class CommentsController < ApplicationController
  def index
    @comments_topics = current_user.comments_topics
  end

  #newアクションはコメント吹き出しをクリックしたときに起動
  def new
    # puts "ここをみろ"
    # p params
    #これはコマンドに表示される。
    
    #@(インスタンス変数)はViewへ渡すときには必要。
    @comment = Comment.new
    #paramsは送られてきた値を受け取るメソッド。プレビューでみるとhidden(隠し)でtopic_idを表示していると思う。
    @comment.topic_id  = params[:topic_id]
    @comment.user_id = current_user.id
    #format.形式の後に特定の処理がない場合はrailsの仕組みとしてアクションに対応するviewファイルが呼び出される。
    respond_to do |format|
      #今回の場合はhtml形式でnewアクションに送信された場合は_new.html.erbがよびだされる。
      format.html
      #new.js.erbが呼びだされる。
      format.js
    end
  end
  
  #createアクションはYour commentをクリックしたときに起動
  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      #保存に成功したら/topicsにとび、以下を表示。
      redirect_to topics_path, success: 'コメントを登録しました'
    else
      #失敗したら/topicsにとび、以下を表示。
      redirect_to topics_path, danger: 'コメントの登録に失敗しました'
    end
  end
　
　#privateはクラス内で呼び出せる。クラス外ではエラーになる。
　#？？これはどこで呼び出している。なぜprivateじゃなくてはならないのか。？？
  private
  def comment_params
    #ｽﾄﾛﾝｸﾞﾊﾟﾗﾒｰﾀ。requireは必須という意味。permitは許可。
    #？？requireの後はﾓﾃﾞﾙ名のことらしいがｺﾒﾝﾄを入れないとｴﾗｰになるよ、と解釈していいのか？？
    #？？permitはどう使うのか。protectedでもいいのか。ユーザーIDとトピックIDと説明をいれないとｴﾗｰがでるよ、という意味？？
    params.require(:comment).permit(:user_id, :topic_id, :description)
  end
end


#paramsは勉強が必要。

#メンターにきくこと
#format
#private
#require
#permit