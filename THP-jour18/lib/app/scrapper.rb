require 'json'
require "nokogiri"
require "open-uri"
require "pp"
require "pry"
require "net/http"
require "google_drive"
require "csv"

class Scrapper
  attr_accessor :url

  def initialize(url)
    @url = url
  end
    
  def get_townhall_urls(main_url)
  
    page = Nokogiri::HTML(open(main_url))
    response_code = Net::HTTP.get_response(URI(main_url)).code
    puts response_code # print http status code
  
    all_townhall_urls = page.xpath("//a[@class='lientxt']/@href")
    all_townhall_names = page.xpath("//a[@class='lientxt']")
  
    all_townhall_urls = all_townhall_urls.map {|url| url.text }
    all_townhall_names = all_townhall_names.map {|name| name.text }
  
    return all_townhall_names, all_townhall_urls
  end
  
  def get_emails(all_townhalls_urls)
  
    emails = []
  
    all_townhalls_urls.each do |url|
      page = Nokogiri::HTML(open("https://www.annuaire-des-mairies.com/#{url.to_s.slice!(2..-1)}"))
      current_email = page.xpath('/html/body/div[1]/main/section[2]/div/table/tbody/tr[4]/td[2]')
      current_email = current_email.text
      emails << current_email
    end
  
    return emails
  
  end
  
  def perform
    all_townhall_names, all_townhalls_urls = get_townhall_urls(@url)
    emails = get_emails(all_townhalls_urls)
    data = Hash[all_townhall_names.zip(emails)]
    return data
  end

  def save_as_JSON(file_path, data)
    File.open(file_path,"w") do |f|
      f.write(data.to_json)
    end
  end

  def save_as_spreadsheet(sheet_key, data)

    session = GoogleDrive::Session.from_config("config.json")
    ws = session.spreadsheet_by_key(sheet_key).worksheets[0]
    
    row = 1
    data.map do |key,value| 
      ws[row, 1] = key
      ws[row, 2] = value
      row += 1
    end
    ws.save

  end

  def save_as_csv(file_path, data)
    CSV.open(file_path, "wb") {|row| data.to_a.each {|elem| row << elem} }
  end

end