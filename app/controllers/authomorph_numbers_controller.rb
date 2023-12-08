require 'http'

class AuthomorphNumbersController < ApplicationController
  def input
  end

  def view
    n = params[:n].to_i
    if params[:format] == 'html'
      @str_res = HTTP.get("http://localhost:3000/authomorph_numbers/view.html?n=#{n}").to_s
    else
      str_res = HTTP.get("http://localhost:3000/authomorph_numbers/view.xml?n=#{n}").to_s
      xml = Nokogiri::XML(str_res)
      xslt = Nokogiri::XSLT(File.read('C://Users/peter/BMSTU/YAIP/LAB/LAB10Second/app/controllers/transform.xslt'))
      @str_res = xslt.transform(xml).to_s.html_safe
    end
    respond_to do |format|
      format.html do
      end
    end 
  end
end
