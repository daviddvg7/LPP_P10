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

    def get_carbos()
        i=@alimentos.head
        f=@cantidades.head
        carbos_total=0
        cantidad_total=0

        loop do
            aux=(i.value).carbos*(f.value/1000)
            carbos_total+=aux
            cantidad_total += f.value
            i=i.next
            f=f.next
        break if i==nil
        end
        @carbos=((carbos_total/cantidad_total)*100).round(1)
        return "#{@carbos}%"
    end

    def get_kcal()
        i=@alimentos.head
        f=@cantidades.head
        kcal_total=0

        loop do
            aux=(i.value).kcal*(f.value/1000)
            kcal_total+=aux            
            i=i.next
            f=f.next
        break if i==nil
        end
        return kcal_total.round(1)
    end

    def to_s
        i=@alimentos.head
        f=@cantidades.head
        texto="El plato #{@nombre} está compuesto de "

        loop do

            if i.next==nil
                texto += "y " + (f.value).to_s + " g de " + (i.value).nombre + "."
            else
                texto += (f.value).to_s + " g de " + (i.value).nombre + ", "
            end
            
            i=i.next
            f=f.next
        break if i==nil
        end
        return texto
    end
end

class Plato_hijo < Plato

    def initialize(x, y, z)
        super(x, y, z)
    end

    def get_gases()
        i=@alimentos.head
        f=@cantidades.head
        gases_total=0

        loop do
            aux=(i.value).gases*(f.value/1000)
            gases_total+=aux            
            i=i.next
            f=f.next
        break if i==nil
        end
        return gases_total.round(1)
    end
end