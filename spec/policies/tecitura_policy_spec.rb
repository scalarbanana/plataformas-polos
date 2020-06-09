# frozen_string_literal: true

require('policies/default_document_policy_spec')

RSpec.describe(TecituraPolicy, type: :policy) do
  it_behaves_like 'a default document policy'
end
