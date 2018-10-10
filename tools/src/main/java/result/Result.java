package result;

public class Result<T> {
    public Result(){}
    public  Result(Integer code,String message,T data){
        this.code=code;
        this.message=message;
        this.data=data;
    }

    private Integer code;
    private String message;
    private T data;

    public static Result NotFound(){
        return  new Result<>(-1,"对象不存在",null);
    }
    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }
}