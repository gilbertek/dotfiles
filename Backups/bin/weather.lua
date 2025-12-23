#!/usr/bin/env lua

-- load the http socket module
http = require("socket.http")
-- load the json module
json = require("json")

api_url = "http://api.openweathermap.org/data/2.5/weather?"

-- http://openweathermap.org/help/city_list.txt
city_id = 5128581
api_key = "987c669de11b7b5b824f3a4151148e1d"
cf = "imperial"
measure = '°' .. (cf == 'metric' and 'C' or 'F')
currenttime = os.date("!%Y%m%d%H%M%S")

-- Unicode weather symbols to use
icons = {
  ["01"] = "☀",
  ["02"] = "🌤",
  ["03"] = "🌥",
  ["04"] = "☁",
  ["09"] = "🌧",
  ["10"] = "🌦",
  ["11"] = "🌩",
  ["13"] = "🌨",
  ["50"] = "🌫",
}

file_exists = function (name)
  f=io.open(name, "r")
  if f~=nil then
    io.close(f)
    return true
  else
    return false
  end
end

if file_exists("weather.json") then
  cache = io.open("weather.json", "r+")
  data = json.decode(cache.read())
  timepassed = os.difftime(currenttime, date.timestamp)
else
  cache = io.open("weather.json", "w")
  timepassed = 6000
end

makecache = function (s)
  s.timestamp =  currenttime
  save = json.encode(s)
  cache:write(save)
end

if timepassed < 3600 then
  response = data
else
  weather = http.request(("%sid=%s&units=%s&APPID=%s"):format(api_url, city_id, cf, api_key))

  if weather then
    response = json.decode(weather)
    makecache(response)
  end
end

math.round = function (n)
  return math.floor(n + 0.5)
end

temp = response.main.temp
conditions = response.weather[1].main
icon = response.weather[1].icon:sub(1, 2)

io.write(("%s %s%s %s\n"):format(icons[icon], math.round(temp), measure, conditions))

cache:close()
