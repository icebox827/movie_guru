class VotesController < ApplicationController
  def create
    @vote = current_user.votes.new(user_id: current_user.id, article_id: params[:article_id])

    if @vote.save
      redirect_to articles_path, notice: 'You liked an article.'
    else
      redirect_to articles_path, alert: 'You cannot like this article.'
    end
  end

  def destroy
    vote = Vote.find_by(id: params[:id], user: current_user, article_id: params[:article_id])
    if vote
      vote.destroy
      redirect_to articles_path, notice: 'You disliked an article.'
    else
      redirect_to articles_path, alert: 'You cannot dislike article that you did not like before.'
    end
  end

  private

  def vote_params_article
    params.permit(:article_id)
  end
end
