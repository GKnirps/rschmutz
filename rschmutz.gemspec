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

Gem:: Specification.new do |s|
  s.name        = 'rschmutz'
  s.version     = '0.0.1'
  s.date        = '2015-03-22'
  s.summary     = "Spill dirt on your text."
  s.description = "A simple gem that spills dirt (a.k.a. combining characters) on unicode text. Inspired by https://github.com/githubert/schmutz"
  s.authors     = ["Guido Knips"]
  s.email       = 'guido.knips@rub.de'
  s.files       = ['lib/rschmutz.rb', 'COPYING.LESSER']
  s.homepage    = 'https://github.com/GKnirps/rschmutz/'
  s.license     = 'LGPL'
end
