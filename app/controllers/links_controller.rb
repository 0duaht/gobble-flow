class LinksController < ApplicationController
  include LinksHelper
  include ConstantsHelper

  def create
    return unless short_url_unique?
    return if reserved_word?

    @link = Link.new(link_params)

    if @link.save
      url_save_success
    else
      url_save_failure
    end
  end

  def process_url
    @link = Link.find_by(short_url: params[:short_url])
    return if no_link_yet?
    action_for_link_url
  end

  private

    def short_url_unique?
      return if short_link_taken?
      return if anon_passing_short_link?
      true
    end

    def short_link_taken?
      if current_user && Link.find_by(short_url: params[:link][:short_url])
        flash[:error] = URL_TAKEN
        redirect_back_or_to root_path
        true
      end
    end

    def anon_passing_short_link?
      if !current_user && params[:link][:short_url]
        flash[:error] = NO_PERMISSION
        redirect_back_or_to root_path
        true
      end
    end

    def reserved_word?
      reserved_words = %w(
        login logout home signup
        api edit links users
      )
      value_present = reserved_words.include?(params[:link][:short_url])
      return unless value_present

      flash[:error] = PATH_RESERVED
      redirect_back_or_to root_path
      true
    end

    def url_save_success
      flash[:url] = link_url(@link)
      flash[:success] = "#{LINK_SUCCESS} #{flash[:url]}"
      return if user_logged_in?
      redirect_back_or_to root_path
    end

    def user_logged_in?
      return unless current_user

      @link.update user_id: current_user.id
      link_count = current_user.link_count + 1
      current_user.update link_count: link_count
      redirect_back_or_to root_path
      true
    end

    def url_save_failure
      flash[:error] = ENTRY_INVALID
      redirect_back_or_to root_path
    end

    def no_link_yet?
      unless @link
        flash[:error] = LINK_NOT_CREATED
        redirect_to root_path
        true
      end
    end

    def action_for_link_url
      return if link_deleted?
      return if link_not_active?

      @link.count += 1
      @link.save
      redirect_to @link.full_url
    end

    def link_deleted?
      if @link.deleted
        flash[:error] = LINK_DELETED
        redirect_to root_path
        true
      end
    end

    def link_not_active?
      unless @link.active
        flash[:error] = LINK_DISABLED
        redirect_to root_path
        true
      end
    end
end
