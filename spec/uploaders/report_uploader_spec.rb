# frozen_string_literal: true

require('rails_helper')

RSpec.describe(ReportUploader) do
  subject(:attacher) { ReportUploader::Attacher.new }

  # rubocop:disable RSpec/ExampleLength
  it 'validates mime type' do
    attacher.assign({
                      id: 'doc.pdf',
                      storage: 'cache',
                      metadata: { "mime_type": 'image/png', "extension": 'pdf' }
                    })
    expect(attacher.validate).not_to(be_truthy)
  end

  it 'accepts pdf mime type' do
    attacher.assign({
                      id: 'doc.pdf',
                      storage: 'cache',
                      metadata: { "mime_type": 'application/pdf', "extension": 'pdf' }
                    })
    expect(attacher.validate).to(be_truthy)
  end
  # rubocop:enable RSpec/ExampleLength
end
