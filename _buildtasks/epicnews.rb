require "rubygems"
require "google_drive"
filename = 'press.yaml'

# Should create a config file which stores filename, log-in info and spreadsheet key

# Logs in.
session = GoogleDrive.login("cuprojectepic@gmail.com", "CrisisInformatics2014")

# Loads Spreadsheet.
ws = session.spreadsheet_by_key("0Aiwzrc8lx93KdEpoYlZPa2tRU25FT1Fzb2s4Yi16UlE").worksheets[0]

# Loads Data into Array
p = Array.new
i = 2

while ws[i,1] != "" do
  p << [ws[i,1], ws[i,2]]
  i +=1
end

# Write to File
target = File.open(filename, 'w')
target.truncate(target.size)

p.each do |title, link|
  target.write('title: ' + title)
  target.write("\n")
  target.write('link: ' + link)
  target.write("\n")
end

target.close()