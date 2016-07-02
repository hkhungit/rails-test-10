module ApplicationHelper

  def liked(comment, user)
    if comment.votes.where({user_id: user.id}).count > 0
      'dislike'
    else
      'like'
    end
  end

  def format_date(date)
    date.strftime('%b %d, %Y')
  end
end
