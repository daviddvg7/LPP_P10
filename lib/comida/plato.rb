# encoding: utf-8
# Author::    David Valverde

# Clase para representar un plato como un conjunto de alimentos y cantidades
# Incluye el módulo enumerable
class Plato

    include Comparable
    #Nombre del plato
    attr_reader :nombre
    #Lista de alimentos que componen el plato    
    attr_reader :alimentos
    #Lista de cantidades de los respectivos alimentos  
    attr_reader :cantidades 

    # Asigna los valores de la clase

    def initialize(nombre, alimentos, cantidades, &block)
        @nombre=nombre
        @alimentos = Lista.new()
        @cantidades= Lista.new()
        if block_given?
            if block.arity==1
                yield self 
            else    
                instance_eval(&block)
            end
        else
            @alimentos=alimentos
            @cantidades=cantidades
        end
    end

    # Devuelve las proteínas totales del plato
    def get_proteinas() 
        i=@alimentos.head
        f=@cantidades.head
        proteinas_total=0
        cantidad_total=0

        loop do
            aux=(i.value).proteinas*(f.value/100)
            proteinas_total+=aux
            cantidad_total += f.value
            i=i.next
            f=f.next
        break if i==nil
        end
        proteinas=((proteinas_total/cantidad_total)*100).round(1)
        return "#{proteinas}%"
    end

    # Devuelve los lípidos totales del plato
    def get_lipidos()
        i=@alimentos.head
        f=@cantidades.head
        lipidos_total=0
        cantidad_total=0

        loop do
            aux=(i.value).lipidos*(f.value/100)
            lipidos_total+=aux
            cantidad_total += f.value
            i=i.next
            f=f.next
        break if i==nil
        end
        lipidos=((lipidos_total/cantidad_total)*100).round(1)
        return "#{lipidos}%"
    end

    # Devuelve los carbohidratos totales del plato
    def get_carbos()
        i=@alimentos.head
        f=@cantidades.head
        carbos_total=0
        cantidad_total=0

        loop do
            aux=(i.value).carbos*(f.value/100)
            carbos_total+=aux
            cantidad_total += f.value
            i=i.next
            f=f.next
        break if i==nil
        end
        carbos=((carbos_total/cantidad_total)*100).round(1)
        return "#{carbos}%"
    end

    # Devuelve las kilocalorías totales del plato
    def get_kcal()
        i=@alimentos.head
        f=@cantidades.head
        kcal_total=0

        loop do
            aux=(i.value).kcal*(f.value/100)
            kcal_total+=aux            
            i=i.next
            f=f.next
        break if i==nil
        end
        return kcal_total.round(1)
    end

    # Devuelve el plato formateado con todos sus alimentos
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

    # Devuelve la huella energética del plato
    def get_huella_energetica
        
        if (self.get_kcal < 670)
            return 1
        elsif (self.get_kcal > 830)
            return 3
        else
            return 2
        end
    end

    # Compara los platos por su valor energético
    def <=>(other)
        get_kcal<=> other.get_kcal
    end

    def alimento(x) 
        @alimentos.insert_tail(x) 
    end

    def cantidad(x)
        @cantidades.insert_tail(x)
    end
end

# Clase hija que trata los datos ambientales de los alimentos
class Plato_hijo < Plato
    #Cantidad de gases generados por los alimentos del plato
    attr_reader :gases
    #Cantidad de terreno empleado por los alimentos del plato
    attr_reader :terreno

    # Asigna los valores y llama al initialize de la clase padre
    def initialize(x, y, z)
        super(x, y, z)
        @gases=self.get_gases
        @terreno=self.get_terreno
    end

    # Devuelve los gases totales del plato
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

    # Devuelve el uso de terreno total del plato
    def get_terreno()
        i=@alimentos.head
        f=@cantidades.head
        terreno_total=0

        loop do
            aux=(i.value).terreno*(f.value/1000)
            terreno_total+=aux            
            i=i.next
            f=f.next
        break if i==nil
        end
        return terreno_total.round(1)
    end

    # Devuelve el plato formateado con sus datos de gases y uso de terreno
    def to_s
        "El plato #{@nombre} genera #{@gases} kg de CO2 y requiere #{@terreno} m2 de terreno"
    end

    # Devuelve la huella ambiental del plato
    def get_huella_ambiental
        if (self.get_gases < 800)
            return 1
        elsif (self.get_gases > 1200)
            return 3
        else 
            return 2
        end
    end

    # Devuelve el impacto del plato
    def get_impacto
        impacto = (self.get_huella_energetica + self.get_huella_ambiental)/2
        return impacto.round(0)
    end

    # Compara los platos por su impacto
    def <=>(other)
        self.get_impacto <=> other.get_impacto
    end
end 