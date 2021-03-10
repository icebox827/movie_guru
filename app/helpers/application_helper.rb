module ApplicationHelper
  def vote_or_unvote_btn(post)
    vote = vote.find_by(article: article, user: current_user)
    if vote
      link_to('Unvote!', article_vote_path(id: like.id, post_id: post.id), method: :delete)
    else
      link_to('Vote!', article_vote_path(post_id: post.id), method: :post)
    end
  end
end
