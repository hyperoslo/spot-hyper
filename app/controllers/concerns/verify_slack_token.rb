module VerifySlackToken
  extend ActiveSupport::Concern
  included do
    skip_before_action :verify_authenticity_token
    before_filter :verify_slack_token, except: [:index, :show, :awesome]
  end

  private
  # Setup slack responder
  def responder
    @responder ||= Slack::Response.new(params[:text])
  end

  def slack_params
    params.permit(:user_id, :user_name, :text, :channel_name)
  end

  def verify_slack_token
    render nothing: true, status: :forbidden and return unless Slack::TOKENS.include?(params[:token])
  end
end
