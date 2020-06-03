# frozen_string_literal: true

module DefaultDocumentPolicy
  # Yes, :reek:TooManyStatements, I know
  def self.included(base)
    model_role = base.name.delete_suffix('Policy').downcase
    define_method(:index?) do
      permissions = user.permissions
      permissions.public_send("#{model_role}?") || permissions.admin?
    end
    %w[show create update destroy].each do |action|
      alias_method "#{action}?", :index?
    end
  end
end
