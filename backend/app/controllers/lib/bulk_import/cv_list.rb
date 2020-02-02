Log.error("CVLIST Load")
require 'pp'
require_relative '../../../model/enumeration'
require_relative '../../../lib/crud_helpers'
require_relative 'bulk_import_mixins'
include CrudHelpers

class CvList
    
  @list = []
  @list_hash = {}
  @which = ''
  @current_user

  def initialize(which, current_user)
    @which = which
    @current_user = current_user
  #  renew
  end

  def value(label)
    if @list_hash[label]
      v =  @list_hash[label]
    elsif @list.index(label)
      v = label
    end
    raise Exception.new(I18n.t('plugins.aspace-import-excel.error.enum',:label =>label,:which => @which)) if !v
    v
  end

  def length
    @list.length
  end

  def renew(current_user)
    @list = []
    list_hash = {}
    enums = handle_raw_listing(Enumeration)
    Log.error("for #{@which}: #{enums}")
=begin
    enums =  AspaceImportClient::JSONModel(:enumeration).all
    enums_list = ASUtils.jsonmodels_to_hashes(enums)
    Log.error("for #{@which}: #{enums_list.pretty_inspect}")
    enums_list.each do |enum|
      if enum['name'] == @which
        enum['values'].each do |v|
          if v
            trans = I18n.t("enumerations.#{@which}.#{v}", default: v)
            if !list_hash[trans]
              list_hash[trans] = v
              @list.push v
            else
              Rails.logger.warn(I18n.t('plugins.aspace-import-excel.warn.dup', :which => @which, :trans => trans,  :used => list_hash[trans]))
            end
          end
        end
        break
      end
    end 
=end
    @list_hash = list_hash
  end
end
