import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;

public class DownloadPage {

    // Make a URL to the web page
    private URL url; 
    private URLConnection con;
    private InputStream is;
    // Get the input stream through URL Connection


    // Once you have the Input Stream, it's just plain old Java IO stuff.
    public DownloadPage() {
    }

    public void setURL(String s) {
        try{
            url = new URL(s);
        }catch(Exception e){println("Mi sa che hai ciccato qualcosa con il formato dell'url");}
        
    }
    //grabs data from an URL
    public String connect(String p) {
        try{
        URLConnection con = url.openConnection();
        InputStream is =con.getInputStream();
        BufferedReader br = new BufferedReader(new InputStreamReader(is));
        String line = null;
        String first =p;
        String s="";
        
        while ((line = br.readLine()) != null) {
            //println(line);
            if(line.contains(first)) {
                int a=line.indexOf(first)+2+first.length(); //MAGIC NUMBER,DON'T ASK ME
                //println(line);
                for(int i=a;i<a+10;i++){                    
                    s+=line.charAt(i);
                }
                return s;       
            } 
        }
        }catch(Exception e){println("Errore gestione" + e);}
        return null;
    }       
}