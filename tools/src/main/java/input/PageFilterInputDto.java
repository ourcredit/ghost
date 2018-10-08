package input;

import java.util.Map;

public class PageFilterInputDto extends  FilterInputDto {
    private Map<String,Object> where;

    public Map<String, Object> getWhere() {
        return where;
    }

    public void setWhere(Map<String, Object> where) {
        this.where = where;
    }
}
