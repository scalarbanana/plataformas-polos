# frozen_string_literal: true

module DefaultDocumentPolicy
  def self.included(base)
    model_role = base.name.delete_suffix('Policy').downcase
    define_method(:index?) do
      roles = user.roles
      roles.public_send("#{model_role}?") || roles.admin?
    end
    %w[show create update destroy].each do |action|
      alias_method "#{action}?", :index?
    end
  end
end
