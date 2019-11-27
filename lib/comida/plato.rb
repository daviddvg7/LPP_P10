class Plato
    attr_reader :nombre, :alimentos, :cantidades

    def initialize(x, y, z)
        @nombre=x
        @alimentos=y
        @cantidades=z
    end

    def get_proteinas()
        i=@alimentos.head
        f=@cantidades.head
        proteinas_total=0
        cantidad_total=0

        loop do
            aux=(i.value).proteinas*(f.value/1000)
            proteinas_total+=aux
            cantidad_total += f.value
            i=i.next
            f=f.next
        break if i==nil
        end
        @proteinas=((proteinas_total/cantidad_total)*100).round(1)
        return "#{@proteinas}%"
    end

    def get_lipidos()
        i=@alimentos.head
        f=@cantidades.head
        lipidos_total=0
        cantidad_total=0

        loop do
            aux=(i.value).lipidos*(f.value/1000)
            lipidos_total+=aux
            cantidad_total += f.value
            i=i.next
            f=f.next
        break if i==nil
        end
        @lipidos=((lipidos_total/cantidad_total)*100).round(1)
        return "#{@lipidos}%"
    end
end