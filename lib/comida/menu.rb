class Menu

    attr_accessor :nombre,:descripcion, :componentes, :precio, :valor_amb, :valor_nutr
    def initialize(nombre, &block)
        @nombre= nombre
        @componentes=[]

        if block_given?
            if block.arity == 1
                yield self
            else 
                instance_eval(&block)
            end
        end
    end

    def descripcion(x)
        @descripcion=x
    end

    def componente(nombre, options = {})
       ingrediente=nombre
       ingrediente << "(#{options[:precio]})" if options[:during]
       
       @componentes << ingrediente
    end

    def precio (x)
        @precio=x
    end

    def valor_nutr (x)
        @valor_nutr=x
    end

    def valor_amb(x)
        @valor_amb=x
    end

    def to_s
        output = "El menú #{@nombre} está compuesto por:\n"
        @componentes.each_with_index do |componente, index|
            output << " #{index + 1}) #{componente[:descripcion]} --> #{componente[:precio]} \n"
        end

        output << "Precio: #{@precio}\nValor nutricional: #{@valor_nutr} kcal\nValor ambiental: #{@valor_amb}"
        output
    end

end