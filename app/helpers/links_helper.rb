module LinksHelper
  def link_url(link)
    root_url + link.short_url
  end

  private begin
    def link_params
      params.require(:link).
        permit(:full_url, :short_url, :active)
    end
  end
end
