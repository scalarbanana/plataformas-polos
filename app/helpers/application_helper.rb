# frozen_string_literal: true

module ApplicationHelper
  def current_route_scope
    case request.env['PATH_INFO']
    when /^#{users_path}/
      'users'
    when '/'
      'dashboard'
    else
      'dashboard'
    end
  end
end
