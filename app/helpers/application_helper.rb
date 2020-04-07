# frozen_string_literal: true

# Application helper navigation
module ApplicationHelper
  def header_redirect
    if user_signed_in?
      if current_user.has_role? :admin
        concat(render(partial: 'layouts/admin_navbar'))
      else
        concat(render(partial: 'layouts/user_navbar'))
      end
    elsif company_signed_in?
      concat(render(partial: 'layouts/company_navbar')) if current_company
    else
      concat(render(partial: 'layouts/dashboard_navbar'))
    end
  end
end
