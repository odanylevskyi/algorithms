require 'date'
require 'time'

content = File.open('tests/wln_2.wln').read
content.gsub!(/\r\n?/, "\n")
new_content = ''
i = 0
start_day = nil
today = Date.today
content.each_line do |line|
  data = line.to_s.split(';')
  if start_day.nil?
    start_day = Time.at(data[1].to_i+2*60*60).day
  end
  date_time = Time.at(data[1].to_i+2*60*60)
  if start_day < date_time.day
    today = Time.new(today.year, today.month, today.day+1,0,0,0, "+03:00");
  end
  new_date = Time.new(today.year, today.month, today.day, date_time.hour, date_time.min, date_time.sec, "+03:00")
  data[1] = new_date.to_i
  new_content += data.join(';')
end

out_file = File.new("wln_out.csv", "w")
out_file.puts(new_content)
out_file.close