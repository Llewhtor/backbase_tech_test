# frozen_string_literal: true

def load_yaml(file)
  YAML.load_file(File.join(__dir__, "#{file}.yml"))
end

def load_computer
  load_yaml(COMPUTER)
end

COMPUTER = 'data/computers'
