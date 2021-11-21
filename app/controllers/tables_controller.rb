require 'csv'

class TablesController < ApplicationController
  # GET /tables
  def index
    @data = CSV.parse(file)

    @data
  end

  private

  def file
    File.read(path)
  end

  def path
    Rails.root.join('scrubber_data.csv')
  end
end
