# frozen_string_literal: true

module ApplicationHelper
  def current_route_scope
    case request.env['PATH_INFO']
    when '/'
      'dashboard'
    when /^#{cartografias_path}/
      'cartografias'
    when /^#{tecituras_path}/
      'tecitura'
    when /^#{users_path}/
      'users'
    end
  end

  def notification_class(type)
    case type.to_sym
    when :success
      'is-success'
    when :notice
      'is-info'
    when :alert
      'is-warning'
    else
      'is-danger'
    end
  end
end
