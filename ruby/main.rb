require 'fileutils'
require 'net/http'

module Main
  def self.included(x)
    # Creats a directory for the advent day
    FileUtils.mkdir_p("resources/#{x::DAY}")

    # Downloads the input file for the advent day (it not already downloaded)
    # Gets user cookue from file resources/session_cookie.txt
    filename = "resources/#{x::DAY}/input.txt"
    if !File.file?(filename)
      puts "Downloading input for day #{x::DAY}..."
      uri = URI("https://adventofcode.com/2024/day/#{x::DAY}/input")
      req = Net::HTTP::Get.new(uri)
      req['Cookie'] = "session=#{File.read('resources/session_cookie.txt').strip}"
      File.write(
        "resources/#{x::DAY}/input.txt",
        Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
          http.request(req).body
        end
      )
    end
  end

  def load_file_as_list_of_lines
    File.readlines("resources/#{DAY}/input.txt").map(&:strip)
  end
end
