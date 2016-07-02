module ApplicationHelper

  def liked(comment, user)
    if comment.votes.where({user_id: user.id}).count > 0
      'dislike'
    else
      'like'
    end
  end
end
