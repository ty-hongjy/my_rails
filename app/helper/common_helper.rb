module CommonHelper

    def get_today()
		Date.today.strftime('%Y-%m-%d')
	end
    
	def get_yesterday()
		Date.yesterday.strftime('%Y-%m-%d')
	end

	#时间格式化                
	def dt_f(dt)             
    	if dt.blank?           
	       return ''            
    	else                   
	       return dt.strftime("%Y-%m-%d %H:%M:%S")
    	end
	end

	#时间格式化                
	def d_f(d)             
    	if d.blank?           
	       return ''            
    	else                   
	       return d.strftime("%Y-%m-%d")
    	end
	end

	#号码脱敏
	def number_desensitization(from_string,start_len,fill_string,end_len)
		a=from_string
		l=a.length
		fill_all=fill_string*(l - start_len - end_len)
#	a[0,start_len]+fill_all+a[-end_len..-1]
		a[start_len,l - start_len - end_len]=fill_all
		return a
	end

	#手机号码前三后四脱敏
	def phone_desensitization(from_string)
		number_desensitization(from_string,3,"*",4)
	end

	#ID前三后四脱敏
	def id_desensitization(from_string)
		number_desensitization(from_string,3,"*",4)
	end
	
	def name_desensitization
	end

    #格式化url两边的/符号
    def replace(text)
        text.gsub("\r\n", '</br>').gsub(" ", '&nbsp;&nbsp;')
    end

    def replace_text_area(text)
        text.gsub("&", '&amp;').gsub("<", '&lt;').gsub(">", '&gt;')
    end

    def post(url, params)
      uri =url
      http = Net::HTTP.new(uri.host, uri.port)
      # if uri.scheme == 'https'
      #   http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      #   http.use_ssl = true
      # end

      request = Net::HTTP::Post.new(uri.request_uri)
      # request['Content-Type'] = 'application/json;charset=utf-8'
      request.body = params.to_json
      response = http.start { |http| http.request(request) }
      return JSON.parse response.body
    end

    def format_url(purl=nil)
        purl = String(purl)

        if purl == nil or purl == "" then
            purl = "/"
        end if purl.strip!

        if purl[0, 1] != "/" then
            purl = "/" + purl
        end

        if purl[-1, 1] != "/" then
            purl = purl + "/"
        end

        return purl
    end
end

