
class Roulette
  def initialize
    @r = (1..10).to_a
  end

  def random
    rand(0..@r.size)
  end

  def add(num, success)
    File.open('roulette_history.txt', 'a') { |file| file.puts(num) }
      if success
        File.open('winner.txt', 'a') { |file| file.puts num }
      end
  end

  def play(number)
    r = @r[random]
    result = @r[r]
    success = (number == result)
    add(result, success)
    success
  end

def more_generated
  file = File.open('roulette_history.txt', 'r')
  num = file.readlines.map(&:to_i)
  frequency = {}
  num.group_by { |i| i }.each { |k, v| frequency[k] = v.size }
  puts "El valor que más ha generado la ruleta históricamente es: #{frequency.max_by { |v| v }[0]}"
end

end

roulette = Roulette.new
puts roulette.play(5)
print roulette.more_generated
