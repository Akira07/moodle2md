require 'rubygems'
require 'bundler/setup'
require 'nokogiri'
require 'reverse_markdown'

arr =  Dir.glob("submit_files/**/onlinetext.html")

c = ""
arr.each do |i|
  f = File.open(i)
  html = f.read
  f.close
  page = Nokogiri::HTML.parse(html, nil, 'UTF-8')
  html_text = page.search('body').children.to_s
  
  md_text = ReverseMarkdown.convert html_text

  md_text.gsub!(/&nbsp;/, '')
  c += md_text + "\n---\n\n"

end

f = File.open("output.md", 'w')
f.write(c)
f.close
