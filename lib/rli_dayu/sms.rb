require 'digest'
require 'open-uri'

module RliDayu
  module Sms
    def self.send_sms(params)
      params = build_params params

      uri = URI.parse('https://eco.taobao.com/router/rest')
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      request = Net::HTTP::Post.new(uri.path)
      request.add_field('Content-Type', 'application/json')
      request.set_form_data(params)
      response = http.request(request)
      res_body = JSON.parse response.body
      res_body
    end

    def self.build_params(params = {})
      default_params =
        {
          app_key: RliDayu.app_key,
          method: 'alibaba.aliqin.fc.sms.num.send',
          timestamp: Time.now.strftime('%Y-%m-%d %H:%M:%S'),
          format: 'json',
          v: '2.0',
          sign_method: 'md5',
          sms_type: 'normal',
          sms_free_sign_name: params['sms_free_sign_name']
        }

      params = default_params.merge(params).with_indifferent_access

      check_required_params params

      puts params_str = params.sort.map { |k, v| "#{k}#{v}" }.join('')
      str_to_sign = "#{RliDayu.secret}#{params_str}#{RliDayu.secret}"
      sign = Digest::MD5.hexdigest(str_to_sign).upcase
      params[:sign] = sign

      params
    end

    def self.check_required_params(params)
      %w[app_key sms_param rec_num sms_template_code sms_free_sign_name].each do |param|
        raise "#{param} cannot be nil" if params[param].blank?
      end
    end
  end
end
