Nodo=Struct.new(:value, :next, :prev)

class Lista
    def initialize(nodo)
        @head=nodo
        @tail=nodo
        @head.next=nodo
        @tail.prev=nodo
    end

    def insert(nodo)
        @tail.next=nodo
        nodo.prev=@tail
        @tail=nodo
    end

    def inserts(vector)
        vector.each{|nodo|
            @tail.next=nodo
            nodo.prev=@tail
            @tail=nodo}
    end

    def pull_head()
        nodo=@head
        aux=@head.next
        aux.prev=nil
        @head=aux
        return nodo
    end
end