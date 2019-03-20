package input;


import java.io.Serializable;

/**
 * @param <T>
 */
public class EntityInput<T>  implements Serializable{
    private  T id;

    public T getId() {
        return id;
    }

    public void setId(T id) {
        this.id = id;
    }
}
