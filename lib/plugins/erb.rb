# -*- coding: utf-8 -*-

require 'erb'

Termtter::Client.register_hook(
  :name => :erb,
  :point => :modify_arg_for_update,
  :exec_proc => lambda {|cmd, arg|
    ERB.new(arg).result(binding)
  }
)

# erb.rb
#   enable to <%= %> in the command update
# example:
#   > u erb test <%= 1+1 %>
#   => erb test 2
