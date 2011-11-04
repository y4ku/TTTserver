require 'java'
require './jkserve.jar'
load './getTTT.rb'
import 'HTTPServer'

s = HTTPServer.new(5000)
s.addApp("/game", GetTTT.new)
s.start();
