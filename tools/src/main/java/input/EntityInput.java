package input;


import java.io.Serializable;

public class EntityInput<T>  implements Serializable{
    private  T id;

    public T getId() {
        return id;
    }

    public void setId(T id) {
        this.id = id;
    }
}
