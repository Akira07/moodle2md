require 'rubygems'
require 'bundler/setup'
require 'nokogiri'
require 'reverse_markdown'

files =  Dir.glob("submit_files/**/onlinetext.html")

c = ""
files.each do |file|
  html = File.read file
  name = file.match(/\/.+\/(.+)_\d+_assignsubmission_onlinetext_\/onlinetext\.html\z/)[1]
  page = Nokogiri::HTML.parse(html, nil, 'UTF-8')
  html_text = page.search('body').children.to_s
  
  md_text = '## ' + name + "\n"
  md_text += ReverseMarkdown.convert html_text

  md_text.gsub!(/&nbsp;/, '')
  c += md_text + "\n---\n\n"

end

f = File.open("output.md", 'w')
f.write(c)
f.close
