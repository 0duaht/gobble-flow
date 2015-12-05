class LinkDecorator < Draper::Decorator
  delegate_all
  MAX_CHAR = 40

  def clicks_badge
    link.count.to_s <<
      (link.count == 1 ? " click" : " clicks")
  end

  def time_badge
    h.distance_of_time_in_words(link.created_at, Time.zone.now) << " ago"
  end

  def compact_full_url
    get_compact_form(full_url)
  end

  def link_to_url
    short_link = h.link_url(link)
    compact_short_url = get_compact_form(short_link)
    h.link_to compact_short_url, short_link
  end

  def get_compact_form(long_string)
    long_string[0..MAX_CHAR] <<
      (long_string.length <= MAX_CHAR ? "" : "...")
  end
end
