# frozen_string_literal: true

require 'net/http'
require 'uri'
require 'json'

def computer_details(name)
  comp = load_computer

  @test = {
    name: comp[name]['name'],
    introduced: comp[name]['introduced'],
    discontinued: comp[name]['discontinued'],
    company: comp[name]['company']
  }
end

def create_computer(name)
  uri = URI.parse('http://computer-database.herokuapp.com/computers')
  header = { 'Content-Type': 'text/json' }

  computer_details(name)

  http = Net::HTTP.new(uri.host, uri.port)
  request = Net::HTTP::Post.new(uri.request_uri, header)
  request.body = @test.to_json
  http.request(request)
end

def computer_id
  comp = load_computer
  name = (comp[@comp_name]['name'])
  @link = page.find('a', text: name, match: :first)['href']
  @link.split('/').last
end

def delete_computer
  id = computer_id
  ep = "http://computer-database.herokuapp.com/computers/#{id}/delete"
  uri = URI.parse(ep)
  http = Net::HTTP.new(uri.host, uri.port)
  request = Net::HTTP::Post.new(uri.request_uri)
  http.request(request)
end

def cleanup
  loop do
    delete_computer
    visit FigNewton.base_url
    break if Capybara::ElementNotFound
  end
end
