# encoding: utf-8
# Author::    David Valverde

# Se crea un struct para representar los nodos de una lista
Nodo=Struct.new(:value, :next, :prev)

# Clase que representa una lista doblemente enlazada
# Incluye el módulo Enumerable
class Lista

    include Enumerable
    #Primer elemento de la lista
    attr_reader :head   
    #Último elemento de la lista
    attr_reader :tail   
    
    # Inicializa la lista vacía
    def initialize()
        @head=nil
        @tail=nil
    end

    # Crea un nodo con el valor que se pasa por parámetro
    # Y lo inserta por la cola en la lista
    def insert_tail(valor)
        aux=Nodo.new(valor, nil, nil)
        if @head==nil
            @head=aux
            @tail=aux
        elsif @head==@tail
            @head.next=aux
            aux.prev=head
            @tail=aux
        else 
            @tail.next=aux
            aux.prev=@tail
            @tail=aux
        end
    end

    # Crea un nodo con el valor que se pasa por parámetro
    # Y lo inserta por la cabeza en la lista
    def insert_head(valor)
        aux=Nodo.new(valor, nil, nil)
        if @head==nil
            @head=aux
            @tail=aux
        elsif @head==@tail
            @head.prev=aux
            @tail.prev=head
            aux.next=head
            @head=aux
        else
            @head.prev=aux
            aux.next=@head
            @head=aux
        end
    end

    # Crea un nodo con cada valor del vector que se pasa por parámetro
    # Y lo inserta por la cola en la lista
    def inserts_tail(vector)
        vector.each{|valor|
            aux=Nodo.new(valor, nil, nil)
            if @head==nil
                @head=aux
                @tail=aux
            elsif @head==@tail
                @head.next=aux
                aux.prev=@head
                @tail=aux
            else
                @tail.next=aux
                aux.prev=@tail
                @tail=aux
            end
        }
    end

    # Crea un nodo con cada valor del vector que se pasa por parámetro
    # Y lo inserta por la cabeza en la lista
    def inserts_head(vector)
        vector.reverse_each{|valor|
            aux=Nodo.new(valor, nil, nil)
            if @head==nil
                @head=aux
                @tail=aux
            elsif @head==@tail
                @head.prev=aux
                @tail.prev=head
                aux.next=head
                @head=aux
            else
                @head.prev=aux
                aux.next=@head
                @head=aux
            end
        }
    end

    # Extrae el primer elemento de la lista
    def pop_head()
        nodo=@head
        aux=@head.next
        aux.prev=nil
        @head=aux
        return nodo
    end

    # Extrae el último elemento de la lista
    def pop_tail()
        nodo=@tail
        aux=@tail.prev
        aux.next=nil
        @tail=aux
        return nodo
    end

    # Calcula los gases totales de los elementos de la lista
    def gases()
        gas=0
        aux=@head

        loop do
            gas+=(aux.value).gases
            aux=aux.next
        break if aux==nil
        end
        return gas
    end
    
    # Calcula los gases anuales totales de los elementos de la lista
    def gases_anual()
        gas=0
        aux=@head

        loop do
            gas+=(aux.value).gases
            aux=aux.next
        break if aux==nil
        end
        gas=gas*365
        return gas
    end

    # Calcula el uso de terreno de todos los elementos de la lista
    def terreno()
        terreno=0
        aux=@head
        loop do
            terreno+=(aux.value).terreno
            aux=aux.next
        break if aux==nil
        end
        
        return terreno.round(1)
    end

    # Método each empleado para la enumeración
    def each()
        aux=@head

        loop do 
            yield aux.value
            aux=aux.next
        break if aux==nil
        end
    end

end