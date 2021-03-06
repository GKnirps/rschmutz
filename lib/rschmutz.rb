#!/usr/bin/env ruby
#encoding=utf-8

#Copyright 2015 by Guido Knips
#This program is free software: you can redistribute it and/or modify
#it under the terms of the GNU Lesser General Public License as published by
#the Free Software Foundation, either version 3 of the License, or
#(at your option) any later version.
#
#This program is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#GNU Lesser General Public License for more details.
#
#You should have received a copy of the GNU Lesser General Public License
#along with this program.  If not, see <http://www.gnu.org/licenses/>.

require 'getoptlong'

$DIRT =
[
  ["\u0323", "\u0307", "\u0312"],
  ["\u0314", "\u031C", "\u0358", "\u0353", "\u0335"],
  ["\u0337", "\u0338", "\u0336", "\u0335","\u20d2", "\u20d3", "\u20e5", "\u20e6", "\u20eb"]
]

#param str string to be mangled
#param dirt array of dirt codepoints
#param prob (with which probability is each character compromised)
def mangle (str, dirt, prob)
  out = []
  str.each_codepoint do |c|
    out.push [c].pack("U*")
    if Random.rand(1.0) < prob then
      out.push dirt.sample
    end
  end
  out.join
end

#command line stuff; only run if this is executed as standalone script
opts = GetoptLong.new(
  ['--feinstaub', '-f', GetoptLong::NO_ARGUMENT],
  ['--grobe-mettwurst', '-g', GetoptLong::NO_ARGUMENT],
  ['--nein-nein-nein', '-n', GetoptLong::NO_ARGUMENT],
  ['--probability', '-p', GetoptLong::REQUIRED_ARGUMENT]
)

if  __FILE__ == $0 then
  dirt = []
  prob = 0.1
  #interpret command line options
  opts.each do |opt, arg|
    case opt
      when '--feinstaub'
        dirt = dirt.concat $DIRT[0]
      when '--grobe-mettwurst'
        dirt = dirt.concat $DIRT[1]
      when '--nein-nein-nein'
        dirt = dirt.concat $DIRT[2]
      when '--probability'
        prob = arg.to_f
        if prob<=0.0 then
          $stderr.puts "No valid probability: '%s'" % arg
          return;
        end
    end
  end
        puts prob
  #if no dirt set was specified, use [0]
  if dirt.empty? then
    dirt = $DIRT[0]
  end

  #read from stdin, mangle and write to stdout
  while not $stdin.eof? do
    input = gets
    print mangle(input, dirt, prob)
  end
end
