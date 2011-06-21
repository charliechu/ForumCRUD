module ApplicationHelper
  def render_to_title(page_title)
    page_title.present? ? page_title : "Forum CRUD Homework"
  end
end
