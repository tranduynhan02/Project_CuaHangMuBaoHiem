package vn.edu.hcmuaf.fit.model;

public class Comment {
    private String id;
    private String idCus;
    private String comment;

    public Comment(String id, String idCus, String comment) {
        this.id = id;
        this.idCus =idCus;
        this.comment = comment;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getIdCus() {
        return idCus;
    }

    public void setIdCus(String idCus) {
        this.idCus = idCus;
    }
}
