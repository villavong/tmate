class RegistrationsController < Devise::RegistrationsController
	skip_before_action :autocomplete
	#
	# def new
	# 	@user = User.new
	#
	# end
	# def create
	# 	@user = User.new(configure_permitted_parameters)
	# end




	protected
		def update_resource(resource, params)
			resource.update_without_password(params)
		end

    def after_update_path_for(resource)
      user_path(resource)
    end

		def after_sign_up_path_for(resource)
		    if resource.sign_in_count == 1
					resource.save
					edit_user_registration_path
		    else
		      root_path
		    end
		end

		private


end
