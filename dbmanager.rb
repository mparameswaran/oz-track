require 'mysql2'
require 'json'
require_relative 'config'
require 'iconv'

class DB_Manager

	def open_connection
		@@mysql_client = Mysql2::Client.new(:host => Db_config.db_server, :username => Db_config.username, :password => Db_config.password, :database => Db_config.db_name)
	end

	def get_target_blend 
		open_connection
		blends = Array.new
		blend_query = @@mysql_client.query("SELECT Letter_Grade,Grade_Level,Hourly_Tol,Daily_Tol from CLIENT_TARGET", :as=>:array)
		blend_query.each do |row|
			blends << {:grade=>row[0],:level=>row[1],:hourly=>row[2],:daily=>row[3]}
		end
		return {:blends=>blends}.to_json
		@@mysql_client.close()
	end
		
		
end
