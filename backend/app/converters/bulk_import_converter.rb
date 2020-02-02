
require_relative 'converter'

#include JSONModel
#JSONModel::init(:allow_other_unmapped => AppConfig[:allow_other_unmapped],
#    :enum_source => BackendEnumSource)
#jm = JSONModel::JSONModel 

#raise "jm? #{jm.pretty_inspect}"




class BulkImportConverter < Converter
  
  def self.import_types(_show_hidden = false)
    [
      {
        name: 'bulk_import_excel',
        description: 'Import Import Archival and Digital Objects from an Excel Spreadsheet'
      }
    ]
  end

  def self.instance_for(type, input_file, opts = {})
    new(input_file, opts) if type == 'bulk_import_excel'
  end

  def run
    Log.error('RUN')
    #here's where we'd call "#{AppConfig[backend_url]/bulkimport"
  end

end
