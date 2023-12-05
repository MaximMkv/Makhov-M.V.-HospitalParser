require 'nokogiri'
require 'open-uri'
require 'csv'

url = 'https://www.hospitalsafetygrade.org/all-hospitals'
html = Nokogiri::HTML(URI.open(url))

hospital_links = html.css('#BlinkDBContent_849210 ul li a')

CSV.open('hospitals.csv', 'w') do |csv|
  csv << ['Hospital Name']

  hospital_links.each do |hospital_link|
    csv << [hospital_link.text.strip]
  end
end

# Перевірка, чи файл був створений
if File.exist?('hospitals.csv')
  puts 'Назви лікарень успішно збережено в hospitals.csv'
else
  puts 'Не вдалося створити hospitals.csv'
end
