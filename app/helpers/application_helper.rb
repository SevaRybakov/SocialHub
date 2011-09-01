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

end

