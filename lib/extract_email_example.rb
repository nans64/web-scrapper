# email_address = html_string.match(/[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}/i)[0]


def extract_emails_to_array(txt)

  reg = /[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}/i

  txt.scan(reg).uniq

end

input = IO.readlines("in.txt") 

result_array = extract_emails_to_array(input.join(" ")).sort

puts result_array  #optional

result_array.each{|s| output << s.to_s+"\n" }