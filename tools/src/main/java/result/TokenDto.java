package result;

public class TokenDto {
    private  Integer  id;
    private  String tenantName;
    private  String token;
    private  String userName;

    public  TokenDto(){}
    public  TokenDto(Integer id,String token,String userName,String tenantName){
        this.id=id;
        this.token=token;
        this.userName=userName;
        this.tenantName=tenantName;
    }
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }



    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }



    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getTenantName() {
        return tenantName;
    }

    public void setTenantName(String tenantName) {
        this.tenantName = tenantName;
    }
}
