
class FeedbacksController < ApplicationController

  layout 'bucketlist_header'

  def new
    @feedback = Feedback.new
  end

  def create
    # byebug
    @feedback = Feedback.new(rating: params[:rating],
                             content: params[:content],
                             reviewer_id: params[:reviewer_id],
                             feedback_id: params[:feedback_id],
                             auction_id: params[:auction_id])
    if @feedback.save
      redirect_to auction_transaction_path(params[:auction_id])
    else
      redirect_to user_feedbacks_path(auctions_path)
    end
  end

  def show
  end

end
