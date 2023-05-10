package model;
public class TypeProduct {
    private int typeId;
    private String typeName;

    public TypeProduct(String typeName) {
        this.typeName = typeName;
    }

    public TypeProduct() {
    }

    public TypeProduct(int typeId, String typeName) {
        this.typeId = typeId;
        this.typeName = typeName;
    }

    public int getTypeId() {
        return this.typeId;
    }

    public void setTypeId(int typeId) {
        this.typeId = typeId;
    }

    public String getTypeName() {
        return this.typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }
}
