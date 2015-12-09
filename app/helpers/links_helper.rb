module LinksHelper
  def link_url(link)
    root_url + link.short_url
  end

  private

    def link_params
      params.require(:link).
        permit(:full_url, :short_url, :active)
    end

    def link_change_helper
      @link = Link.find(params[:id]).decorate
    end

    def not_authenticated
      flash[:success] = "Please login first"
      redirect_to login_path
    end
end
