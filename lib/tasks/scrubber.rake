require_relative '../../app/services/scrubber/export_data_into_csv.rb'
require_relative '../../app/services/scrubber/get_data.rb'

desc "For create csv file of data from site."

task :scrubber do
  Scrubber::ExportDataIntoCsv.process
end
