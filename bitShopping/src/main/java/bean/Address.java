package bean;

public class Address {
    private int seq_add  ; //번호
    private String mid ; // 고객 아이디
    private String shippingname ; // 배송지 이름
    private String name ; // 고객 이름
    private String address1 ; // 주소지
    private String address2 ; // 상세 주소지
    private String phone ; // 고객 핸드폰 번호

    public Address(){}

    @Override
    public String toString() {
        return "Address{" +
                "seq_add=" + seq_add +
                ", mid='" + mid + '\'' +
                ", shippingname='" + shippingname + '\'' +
                ", name='" + name + '\'' +
                ", address1='" + address1 + '\'' +
                ", address2='" + address2 + '\'' +
                ", phone='" + phone + '\'' +
                '}';
    }

    public Address(int seq_add, String mid, String shippingname, String name, String address1, String address2, String phone) {
        this.seq_add = seq_add;
        this.mid = mid;
        this.shippingname = shippingname;
        this.name = name;
        this.address1 = address1;
        this.address2 = address2;
        this.phone = phone;
    }

    public int getSeq_add() {
        return seq_add;
    }

    public void setSeq_add(int seq_add) {
        this.seq_add = seq_add;
    }

    public String getMid() {
        return mid;
    }

    public void setMid(String mid) {
        this.mid = mid;
    }

    public String getShippingname() {
        return shippingname;
    }

    public void setShippingname(String shippingname) {
        this.shippingname = shippingname;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress1() {
        return address1;
    }

    public void setAddress1(String address1) {
        this.address1 = address1;
    }

    public String getAddress2() {
        return address2;
    }

    public void setAddress2(String address2) {
        this.address2 = address2;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}
