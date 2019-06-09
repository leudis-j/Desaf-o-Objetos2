class Table
  attr_accessor :mesa, :recaudaciones
  def initialize(mesa, *recaudaciones)
    @mesa = mesa
    @recaudaciones = *recaudaciones.map(&:to_i)
  end

  def mayor
    @recaudaciones.max
  end

  def dia
    @recaudaciones.index(self.mayor) + 1
  end

  def promedio
    @recaudaciones.inject(&:+) / @recaudaciones.size.to_f
  end
end

  promedios = []
  data = []
  File.open('casino.txt', 'r') { |file| data = file.readlines}
  data.each do |m|
    ln = m.split(', ')
    mesas = Table.new(*ln)
    puts "#{mesas.mesa} la recaudacion maxima fue #{mesas.mayor} el dia #{mesas.dia}"
    promedios << mesas.promedio
    end

promedio_total = promedios.inject(:+) / promedios.size

puts "el promedio total es: #{promedio_total}"
