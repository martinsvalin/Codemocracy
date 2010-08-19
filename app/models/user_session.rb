# encoding: UTF-8
class UserSession < Authlogic::Session::Base
  # rpx_key CONFIG['rpx_api_key']
  # 
  # def map_rpx_data
  #   # map core profile data using authlogic indirect column names
  #   self.attempted_record.send("#{klass.login_field}=", @rpx_data['profile']['preferredUsername'] ) if attempted_record.send(klass.login_field).blank?
  #   self.attempted_record.send("#{klass.email_field}=", @rpx_data['profile']['email'] ) if attempted_record.send(klass.email_field).blank?
  # end
end