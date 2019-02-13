
class FeedbacksController < ApplicationController

  layout 'bucketlist_header'

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new
    if @feedback.save
      redirect_to user_feedbacks_path(logged_user)
    else
      redirect_to user_feedbacks_path(logged_user)
    end
  end

  def show
  end

end
