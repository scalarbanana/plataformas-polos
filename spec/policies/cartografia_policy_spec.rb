# frozen_string_literal: true

require('policies/default_document_policy_spec')

RSpec.describe(CartografiaPolicy, type: :policy) do
  it_behaves_like 'a default document policy'
end
