
    BULK_TEST = 'THIS IS BULK TEST'
    module CrudHelpers
        def handle_raw_listing(model, where = {})
            dataset = CrudHelpers.scoped_dataset(model, where)
            objs = dataset.respond_to?(:all) ? dataset.all : dataset
            opts = {:calculate_linked_repositories => current_user.can?(:index_system)}

            jsons = model.sequel_to_jsonmodel(objs, opts).map {|json|
            if json.is_a?(JSONModelType)
                json.to_hash(:trusted)
            else
                json
            end
            }
            results = resolve_references(jsons, params[:resolve])
            Log.error("class: #{results.class.name}")
            results
        end
    end
    def have_env
        begin
            Log.error("env? #{env[:aspace_user].pretty_inspect}")
        rescue Exception => e
            Log.error("no env? #{e.message}")
        end
    end
    def have_current
        begin
            Log.error("current_user? #{current_user.pretty_inspect}")
        rescue Exception => e
            Log.error("no current_user? #{e.message}")
        end
    end
    def get_enums
        begin
            enums = handle_raw_listing(Enumeration, {:name => 'date_type'})
            enums.each do |enum|
                Log.error("for: #{enum['name']}")
                enum['enumeration_values'].each do |val|
                    Log.error("\t #{val.pretty_inspect}")
                end
            end
        rescue Exception => e
            Log.error("no enums #{e.message}")

    
        
        end
    end