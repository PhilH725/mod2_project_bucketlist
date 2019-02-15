
class FeedbacksController < ApplicationController

  layout 'bucketlist_header'

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(rating: params[:rating],
                             content: params[:content],
                             reviewer_id: params[:reviewer_id],
                             feedback_id: params[:feedback_id],
                             auction_id: params[:auction_id])
    if @feedback.save
      redirect_to auction_transaction_path(params[:auction_id])
    else
      redirect_to auction_transaction_path(params[:auction_id])
    end
  end

  def show
  end

end
