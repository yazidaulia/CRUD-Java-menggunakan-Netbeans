package Menu;


public class IDPPenjual {
    public static String kd;
    
    public static void setUserLogin(String kode){
        kd = kode;
    }
    
    public static String getUserLogin(){
        return kd;
    }
}
