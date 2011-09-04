module ApplicationHelper
  def title(page_title)
    content_for(:title) { page_title }
  end

  def subtitle(page_subtitle)
    content_for(:subtitle) { page_subtitle }
  end

  def sidebar(page_sidebar)
    content_for(:sidebar) { page_sidebar }
  end

  #defines content style based on presence of sidebar
  def content_class(sidebar_absent)
    if sidebar_absent
      "span16 columns"
    else
      "span12 columns"
    end
  end

  def friends_link_text
    txt = 'Friends'
    unless current_user.friendship_requests.empty?
      txt += "( +#{current_user.friendship_requests.length.to_s} )"
    end
    txt
  end

  def get_date_in_text time
    return "less than a minute ago" if Time.now - time < 1.minutes
    return "#{pluralize(((Time.now - time)/60).to_i, 'minute')} ago" if Time.now - time < 1.hours
    return "#{pluralize(((Time.now - time)/60/60).to_i, 'hour')} ago" if Time.now - time < 1.days
    return "#{pluralize(((Time.now - time)/60/60/24).to_i, 'day')} ago" if Time.now - time < 1.month
    time.to_s(:long)
  end

end

