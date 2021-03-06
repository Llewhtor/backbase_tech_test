# frozen_string_literal: true

require 'net/http'
require 'uri'
require 'json'

def computer_details(name)
  comp = load_computer

  @body = {
    name: comp[name]['name'],
    introduced: comp[name]['introduced'],
    discontinued: comp[name]['discontinued'],
    company: comp[name]['comp_value']
  }
end

def create_computer(name)
  uri = URI.parse('http://computer-database.herokuapp.com/computers')
  header = { 'Content-Type': 'text/json' }

  computer_details(name)

  http = Net::HTTP.new(uri.host, uri.port)
  request = Net::HTTP::Post.new(uri.request_uri, header)
  request.body = @body.to_json
  @request = http.request(request)
end

def computer_id
  comp = load_computer
  name = (comp[@comp_name]['name'])
  check = portal.main.has_not_found? == true
  link = page.find('a', text: name, match: :first)['href'] unless check
  link.split('/').last unless check
end

def delete_computer
  id = computer_id
  ep = "http://computer-database.herokuapp.com/computers/#{id}/delete"
  uri = URI.parse(ep)
  http = Net::HTTP.new(uri.host, uri.port)
  request = Net::HTTP::Post.new(uri.request_uri)
  http.request(request)
end

def post_invalid_delete_request
  ep = 'http://computer-database.herokuapp.com/computers/not_valid/delete'
  uri = URI.parse(ep)
  http = Net::HTTP.new(uri.host, uri.port)
  request = Net::HTTP::Post.new(uri.request_uri)
  http.request(request)
  @request = http.request(request)
end

def cleanup
  visit FigNewton.base_url
  while portal.main.has_not_found? != true
    portal.main.search_computers(@comp_name)
    delete_computer
    portal.main.search_computers(@comp_name)
  end
end
