class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
protect_from_forgery with: :exception

before_action  :configure_permitted_parameters, if: :devise_controller?

helper_method :mailbox
before_filter :autocomplete
before_action :user_number
before_action :view_count

private
def view_count
  viewCount = Viewcount.new
  viewCount.ip_address = request.remote_ip
  viewCount.save
  ip_address_set = Array.new

  Viewcount.all.each do |x|
    ip_address_set << x.ip_address
  end
  @total_view_count =ip_address_set.uniq.count - 1322

  # @total_view_count =Viewcount.count

end
def mailbox
    @mailbox ||= current_user.mailbox
end

def autocomplete


  @search = User.ransack(params[:q])
  # @user = current_user

  @user = @search.result.order("created_at DESC").to_a.uniq

  @results = @search.result
  @arrUsers = @results.to_a

end
def user_number
  @mentors = User.where(state: 'mentor').count
  @mentees = User.where(state: 'mentee').count + 559

end

protected
	def configure_permitted_parameters

		#devise_parameter_sanitizer.for(:account_update) << :fullname
		#devise_parameter_sanitizer.for(:sign_up) <<
		#devise_parameter_sanitizer.for(:account_update) << :username
		devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :fullname, :email, :password, :password_confirmation, :remember_me, :country, :city, :school, :major, :schoolemail, :admin, :state, :status) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :username, :fullname, :description, :password, :current_password, :avatar, :profile_img, :country, :city, :school, :major, :school_description, :nationality, :occupation, :country_id, :school_id, :company_name, :sharecontact, :occupation_details, :access, :kakao, :state,:schoolemail, :status, :contact, :institute, :admin, :languages_attributes => [:id, :_destroy, :language], :specialties_attributes => [:id, :specialty, :_destroy], :scholarships_attributes => [:id, :name, :amount, :_destroy], :educations_attributes => [:id, :education, :_destroy], :works_attributes => [:id, :work, :_destroy], :revisers_attributes => [:id, :price_per, :active, :paypal, :amount],:schools_attributes => [:id, :name, :school_id],:countries_attributes => [:id, :name, :country_id]) }
    # devise_parameter_sanitizer.permit(:account_update)
	end


#when you make a page that needs a fullname!!!

  # rescue_from ActiveRecord::RecordNotFound do
  #   flash[:warning] = 'Resource not found.'
  #   redirect_back_or root_path
  # end

  # def redirect_back_or(path)
  #   redirect_to request.referer || path
  # end
end
