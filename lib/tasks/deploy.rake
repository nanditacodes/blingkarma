namespace :deploy do
	desc "deploy to heroku"
	task :heroku => [:push, :on, :migrate, :restart, :off]

	task :push do
		puts "push to heroku"
		puts `git push -f git@heroku.com:blingkarma.git master`
	end
	task :migrate do
		puts "running migrations on heroku"
		puts `heroku run rake db:migrate --app=blingkarma`
	end
	task :on do
		puts "Maintenance mode on"
		puts `heroku maintenance:on --app=blingkarma`
	end
	task :restart do
		puts "restarting app servers"
		puts `heroku restart --app blingkarma`
	end
	task :off do
		puts "Maintenance mode off"
		puts `heroku maintenance:off --app=blingkarma`
	end
end
