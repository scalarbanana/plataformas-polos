# frozen_string_literal: true

class DownloadsController < ApplicationController
  def report
    authorize(Tecitura, :show?)
    rack_response(ReportUploader.download_response(request.env))
  end

  private

  def rack_response((status, headers, body))
    self.status = status
    response.headers.merge!(headers)
    self.response_body = body
  end
end
