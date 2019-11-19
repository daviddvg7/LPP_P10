Nodo=Struct.new(:value, :next, :prev)

class Lista
    def initialize(nodo)
        @head=nodo
        @tail=nodo
    end
end