# frozen_string_literal: true

def load_yaml(file)
  YAML.load_file(File.join(__dir__, "#{file}.yml"))
end

def load_computer
  load_yaml(COMPUTER)
end

def load_comp_table
  load_yaml(COMPUTER_TABLE)
end

COMPUTER = 'data/computers'
COMPUTER_TABLE = 'data/computer_table'
