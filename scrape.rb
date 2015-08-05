require 'nokogiri'
require 'open-uri'
require 'pry'
require 'csv'

page = Nokogiri::HTML(open("http://ecodb.net/ranking/imf_ngdpd.html"))
CSV.open('result.csv',"w") do |csv|
  csv << ["order","country","GDP","area"]

  page.css("table#table01").css('tr').each_with_index do |tr,index|
    next if index==0 || index==1
    order =  tr.css('td.rank').css('span.rank_area').text
    country = tr.css('td.name.tap').css('a').text
    gdp = tr.css('td.value').text
    areaname = tr.css('td.area').text
    csv << [order,country,gdp,areaname]
  end

end
