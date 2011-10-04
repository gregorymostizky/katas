class WeatherSlurper

  def initialize(path, numbers_on_good_lines, ignore_first)
    # read file
    lines = []
    File.open(path) do |ff|
      lines = ff.readlines
    end

    # keep only lines that match the pattern
    @data = lines.map { |line| line.split(/\s+/) }.reject { |line| line.size <= numbers_on_good_lines }
    @data = @data[1..-1] if ignore_first
  end

  def dump
    p @data
  end

  def find_min_spread(name, value1, value2)
    @data.map { |day| [day[name], (day[value1].to_f - day[value2].to_f).abs] }.min {|a,b| a[1] <=> b[1]}
  end
end

if __FILE__ == $0

  #ws = WeatherSlurper.new(File.dirname(File.absolute_path(__FILE__)) + '/weather.dat',12, true)
  #ws.dump
  #p ws.find_min_spread(1, 2, 3)

  fb = WeatherSlurper.new(File.dirname(File.absolute_path(__FILE__)) + '/football.dat',10, false)
  fb.dump
  p fb.find_min_spread(2, 7, 9)


end