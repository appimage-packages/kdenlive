#!/usr/bin/env ruby
# frozen_string_literal: true
#
# Copyright (C) 2016 Scarlett Clark <sgclark@kde.org>
# Copyright (C) 2015-2016 Harald Sitter <sitter@kde.org>
#
# This library is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) version 3, or any
# later version accepted by the membership of KDE e.V. (or its
# successor approved by the membership of KDE e.V.), which shall
# act as a proxy defined in Section 6 of version 3 of the license.
#
# This library is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License fo-r more details.
#
# You should have received a copy of the GNU Lesser General Public
# License along with this library.  If not, see <http://www.gnu.org/licenses/>.

require_relative 'appimage-template/libs/builddocker.rb'
require 'fileutils'
require 'pty'

if RUBY_VERSION =~ /1.9/ # assuming you're running Ruby ~1.9
  Encoding.default_external = Encoding::UTF_8
  Encoding.default_internal = Encoding::UTF_8
end
setup_path = `pwd`
p setup_path
project = 'kdenlive'
builder = CI.new
unless Dir.exist?('app')
  Dir.mkdir('app')
end
unless Dir.exist?('appimage')
  Dir.mkdir('appimage')
end
builder.run = [CI::Build.new(project)]
builder.cmd = %w[bash -c /in/setup.sh]
builder.create_container(project)
# begin
#   PTY.spawn( cmd ) do |stdout, stdin, pid|
#     begin
#       # Do stuff with the output here. Just printing to show it works
#       stdout.each { |line| print line }
#     rescue Errno::EIO
#       puts "Errno:EIO error, but this probably just means " +
#             "that the process has finished giving output"
#     end
#   end
# rescue PTY::ChildExited
#   puts "The child process exited!"
# end
