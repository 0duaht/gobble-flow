class LinkDecorator < Draper::Decorator
  delegate_all
  MAX_CHAR = 35

  def clicks_badge
    link.count.to_s <<
      (link.count == 1 ? " click" : " clicks")
  end

  def time_badge
    h.distance_of_time_in_words(link.created_at, Time.zone.now) << " ago"
  end

  def stats_link_url
    h.root_url + "links/#{id}"
  end

  def compact_full_url
    get_compact_form full_url
  end

  def full_short_url
    h.link_url link
  end

  def link_to_url
    short_link = full_short_url
    compact_short_url = get_compact_form(short_link)
    h.link_to compact_short_url, short_link
  end

  def get_compact_form(long_string)
    long_string[0..MAX_CHAR] <<
      (long_string.length <= MAX_CHAR ? "" : "...")
  end

  def compression_text
    return get_text if full_url.length > full_short_url.length
    "Link was not shortened. :("
  end

  def get_text
    full_length = link.full_url.length
    short_length = full_short_url.length
    length_diff = full_length - short_length
    compress_rate = ((length_diff.to_f / full_length).round(2) * 100).to_i
    compress_rate_text compress_rate, length_diff
  end

  def compress_rate_text(compress_rate, length_diff)
    "#{compress_rate}% (#{length_diff} characters) shorter. "\
    "Link was shortened from #{link.full_url.length} characters to "\
    "#{full_short_url.length}."
  end
end
