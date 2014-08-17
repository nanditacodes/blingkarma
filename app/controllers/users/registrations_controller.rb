class Users::RegistrationsController < Devise::RegistrationsController
   def after_sign_up_path_for(resource)
     if resource.email == "admin@blingkarma.com"
       resource.admin = true
       resource.name = "Administrator"
       resource.save
       redirect_to admin_home_path
     else
       super
     end
  end



end
