AppConfig[:data_directory] = File.join(Dir.home, "ArchivesSpace")
AppConfig[:backup_directory] = proc { File.join(AppConfig[:data_directory], "demo_db_backups") }
AppConfig[:solr_index_directory] = proc { File.join(AppConfig[:data_directory], "solr_index") }
AppConfig[:solr_home_directory] = proc { File.join(AppConfig[:data_directory], "solr_home") }
AppConfig[:solr_indexing_frequency_seconds] = 30

AppConfig[:default_page_size] = 10
AppConfig[:max_page_size] = 250


# A prefix added to cookies used by the application.
#
# Change this if you're running more than one instance of ArchivesSpace on the
# same hostname (i.e. multiple instances on different ports)
AppConfig[:cookie_prefix] = "archivesspace"

# The periodic indexer can run using multiple threads to take advantage of
# multiple CPU cores.
#
# By setting the next two options, you can control how many CPU cores are used,
# and the amount of memory that will be consumed by the indexing process (more
# cores and/or more records per thread means more memory used).
AppConfig[:indexer_records_per_thread] = 25
AppConfig[:indexer_thread_count] = 4

AppConfig[:allow_other_unmapped] = false

AppConfig[:db_url] = proc { AppConfig.demo_db_url }
AppConfig[:db_max_connections] = 10
# Set to true if you have enabled MySQL binary logging
AppConfig[:mysql_binlog] = false

AppConfig[:allow_unsupported_database] = false
AppConfig[:allow_non_utf8_mysql_database] = false

AppConfig[:demo_db_backup_schedule] = "0 4 * * *"
AppConfig[:demo_db_backup_number_to_keep] = 7

AppConfig[:solr_backup_directory] = proc { File.join(AppConfig[:data_directory], "solr_backups") }
AppConfig[:solr_backup_schedule] = "0 * * * *"
AppConfig[:solr_backup_number_to_keep] = 1

AppConfig[:backend_url] = "http://localhost:8089"
AppConfig[:frontend_url] = "http://localhost:8080"
AppConfig[:solr_url] = "http://localhost:8090"
AppConfig[:public_url] = "http://localhost:8081"

# Setting any of the four keys below to false will prevent the associated
# applications from starting. Temporarily disabling the frontend and public
# UIs and/or the indexer may help users who are running into memory-related
# issues during migration.

AppConfig[:enable_backend] = true
AppConfig[:enable_frontend] = true
AppConfig[:enable_public] = true
AppConfig[:enable_indexer] = true

# If you have multiple instances of the backend running behind a load
# balancer, list the URL of each backend instance here.  This is used by the
# real-time indexing, which needs to connect directly to each running
# instance.
#
# By default we assume you're not using a load balancer, so we just connect
# to the regular backend URL.
#
AppConfig[:backend_instance_urls] = proc { [AppConfig[:backend_url]] }

AppConfig[:frontend_theme] = "default"
AppConfig[:public_theme] = "default"

AppConfig[:session_expire_after_seconds] = 3600

AppConfig[:search_username] = "search_indexer"

AppConfig[:public_username] = "public_anonymous"

AppConfig[:staff_username] = "staff_system"

AppConfig[:authentication_sources] = []

AppConfig[:realtime_index_backlog_ms] = 60000

AppConfig[:notifications_backlog_ms] = 60000
AppConfig[:notifications_poll_frequency_ms] = 1000

AppConfig[:max_usernames_per_source] = 50

AppConfig[:demodb_snapshot_flag] = proc { File.join(AppConfig[:data_directory], "create_demodb_snapshot.txt") }

AppConfig[:locale] = :en

# Report Configuration
# :report_page_layout uses valid values for the  CSS3 @page directive's
# size property: http://www.w3.org/TR/css3-page/#page-size-prop
AppConfig[:report_page_layout] = "letter landscape"

# Plug-ins to load. They will load in the order specified
AppConfig[:plugins] = ['local', 'aspace_feedback']

# Allow an unauthenticated user to create an account
AppConfig[:allow_user_registration] = true

# Help Configuration
AppConfig[:help_enabled] = true
AppConfig[:help_url] = "http://docs.archivesspace.org"
AppConfig[:help_topic_prefix] = "/Default_CSH.htm#"