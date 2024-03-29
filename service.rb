require 'sinatra'
require 'sinatra/reloader' 
require 'json'
require_relative 'dbmanager'

set :bind, '0.0.0.0'
set :port, 5678

get '/' do
	"#{Time.now}"
end

get '/cake-list' do
	content_type 'application/json'
	return {:cupcakes=>[{:name=>"Vanilla",:images=>{:thumbnail=>"/images/vanilla-thumb.jpg",:small=>"/images/vanilla-small.png",:large=>"/images/vanilla-large.png"},:short_description=>"Plain old vanilla cupcake", :description=>"Not particularly adventurous but simple and elegant. Can't go wrong with this one."}, {:name=>"Chocolate",:images=>{:thumbnail=>"/images/chocolate-thumb.jpg",:small=>"/images/chocolate-small.png",:large=>"/images/chocolate-large.png"},:short_description=>"mmm Chocolate...", :description=>"Dark and handsome, also sinfully good."},{:name=>"Chocolate Peanut Butter",:images=>{:thumbnail=>"/images/choc-pb-thumb.jpg",:small=>"/images/choc-pb-small.png",:large=>"/images/choc-pb-large.png"},:short_description=>"Chocolate & PB", :description=>"Chocolately, nutty, creamy enough and chunky enough."},{:name=>"Chocolate Hazelnut",:images=>{:thumbnail=>"/images/choc-hazel-thumb.jpg",:small=>"/images/choc-hazel-small.png",:large=>"/images/choc-hazel-large.png"},:short_description=>"Chocolate & Hazelnut", :description=>"Chocolately with a hint of.. no hints just hazelnuts and chocolate."},{:name=>"Espresso",:images=>{:thumbnail=>"/images/espresso-thumb.jpg",:small=>"/images/espresso-small.png",:large=>"/images/espresso-large.png"},:short_description=>"Another shot, por favor!", :description=>"Rich, perfect roast. Now you can have your coffee and eat it too."},{:name=>"Mocha",:images=>{:thumbnail=>"/images/mocha-thumb.jpg",:small=>"/images/mocha-small.png",:large=>"/images/mocha-large.png"},:short_description=>"Chocolate & Coffee", :description=>"Perfect blend of coffee and chocolate."},{:name=>"Neapolitan",:images=>{:thumbnail=>"/images/neapolitan-thumb.jpg",:small=>"/images/neapolitan-small.png",:large=>"/images/neapolitan-large.png"},:short_description=>"3 Flavors in One", :description=>"Chocolate, vanilla and strawberry all together."},{:name=>"Toffee",:images=>{:thumbnail=>"/images/toffee-thumb.jpg",:small=>"/images/toffee-small.png",:large=>"/images/toffee-large.png"},:short_description=>"Caramelicious Toffee", :description=>"Caramel with hints of fresh milk. Only hints."},{:name=>"Cookies & Cream",:images=>{:thumbnail=>"/images/cookies-cream-thumb.jpg",:small=>"/images/cookie-cream-small.png",:large=>"/images/cookie-cream-large.png"},:short_description=>"Cookies & Cream", :description=>"Cookies. Cream. Cream. Cookies. Cookies. Cream."}]}.to_json
end

get '/Metrics' do
	content_type 'application/json'
	db_manager = DB_Manager.new()
	db_manager.get_target_blend()
end

