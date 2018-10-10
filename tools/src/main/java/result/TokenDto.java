package result;

public class TokenDto {
    private  Integer  id;
    private  Integer tenantId;
    private  String token;
    private  String userName;

    public  TokenDto(){}
    public  TokenDto(Integer id,String token,String userName,Integer tenantId){
        this.id=id;
        this.token=token;
        this.userName=userName;
        this.tenantId=tenantId;
    }
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getTenantId() {
        return tenantId;
    }

    public void setTenantId(Integer tenantId) {
        this.tenantId = tenantId;
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
}
