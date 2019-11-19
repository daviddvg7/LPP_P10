Nodo=Struct.new(:value, :next, :prev)

class Lista
    
    attr_reader :head, :tail

    def initialize()
        @head=nil
        @tail=nil
    end

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

    def pull_head()
        nodo=@head
        aux=@head.next
        aux.prev=nil
        @head=aux
        return nodo
    end
end