class ApiController < ApplicationController
  include LinksHelper
  include ConstantsHelper

  def index
  end

  def create
    arg_complete = %w(key full_url).all? { |arg| params.include?(arg) }
    render plain: ENTRY_URL_INVALID && return unless arg_complete

    arg_success_process
  end

  private

    def arg_success_process
      @user = User.find_by(api_key: params[:key])
      render plain: API_INVALID && return unless @user

      process_api_call if short_url_unique?
    end

    def short_url_unique?
      render plain: URL_TAKEN &&
        return if Link.find_by(short_url: params[:short_url])
      true
    end

    def process_api_call
      @link = Link.new(api_params)
      render plain: ENTRY_INVALID && return unless @link.save

      update_user_and_render
    end

    def update_user_and_render
      @link.update user_id: @user.id
      link_count = @user.link_count + 1
      @user.update link_count: link_count

      message = LINK_SUCCESS + link_url(@link)
      render plain: message
    end

    def api_params
      params.permit(:full_url, :short_url)
    end
end
