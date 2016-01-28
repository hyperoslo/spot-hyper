class HangoutsController < ApplicationController
  include VerifySlackToken
  before_action :find_hangout, on: :create

  # POST /hangouts
  def create
    render plain: "Command not found", status: :ok unless params[:command] == "/myhangout"

    if @hangout.blank? and params[:text].present?
      @hangout = create_hangout
      if @hangout.save
        render plain: t(:create_hangout, user_name: params[:user_name], url: params[:text])
      else
        render plain: "Error: #{@hangout.errors.full_messages.to_sentence}"
      end
    elsif @hangout.present? and params[:text].present?
      @hangout.url = params[:text]
      if @hangout.save
        render plain: t(:update_hangout, user_name: params[:user_name], url: @hangout.url)
      else
        render plain: "Error: #{@hangout.errors.full_messages.to_sentence}"
      end
    elsif @hangout.present? and params[:text].empty?
      render plain: t(:your_hangout, user_name: params[:user_name], url: @hangout.url)
    end
  end

  # POST /hangouts/user
  def user
    render plain: 'Enter a username: `/hangoutwith [username]`' and return if params[:text].empty?

    @hangout = Hangout.find_by(user_name: params[:text].gsub('@', ''))
    if @hangout.blank? and params[:command] == "/hangoutwith"
      render plain: t(:no_user_hangout, name: params[:text])
    else
      render plain: t(:user_hangout, name: @hangout.user_name.capitalize, url: @hangout.url)
    end
  end

  private

  def create_hangout
    Hangout.create(url: params[:text], user_id: params[:user_id], user_name: params[:user_name])
  end

  def find_hangout
    @hangout = Hangout.find_by(user_id: params[:user_id])
    if @hangout.blank? and params[:text].empty?
      render plain: t(:no_hangout, user_name: params[:user_name], url: params[:text])
    end
  end
end
