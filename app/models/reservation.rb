class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :reviser



  # def download_url(style_name=:original)
  #   document.s3_bucket.objects[document.s3_object(style_name).key].url_for(:read,
  #       :secure => true,
  #       :expires => 24*3600*3,  # 24 hours*3
  #       :response_content_disposition => "attachment; filename='#{document_file_name}'").to_s
  # end


end
