/*
This program is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.
 
 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.
 
 You should have received a copy of the GNU General Public License
 along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
import java.util.*;
import java.text.*;

String tmp, tmp1, tmp2,tmp3,tmp4;
String [] tempo;
void setup() {
    
    size(1280, 720);
    String[] dati = loadStrings("Data.txt");
    //Comparazione tra date e indici 
    tempo = split(dati[0],"|");
    tempo[1]=numberParser(tempo[1]);
    tempo[2]=numberParser(tempo[2]);
    tempo[3]=numberParser(tempo[3]);
    tempo[4]=numberParser(tempo[4]);
    /*
        Mappa:
        tempo[0] -> data / ora
        tempo[1] -> EUR/BTC
        tempo[2] -> EUR/USD
        tempo[3] -> EUR/GBP
        tempo[4] -> EUR/JPY
    */
    SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
    try{
        Date d = format.parse(tempo[0]);
    }catch(Exception e){}
    
    
    DownloadPage p = new DownloadPage();
    String URL1 = "http://www.xe.com/it/currencyconverter/convert/?Amount=1&From=EUR&To=XBT";
    String URL2 = "http://www.xe.com/it/currencyconverter/convert/?Amount=1&From=EUR&To=USD";
    String URL3 = "http://www.xe.com/it/currencyconverter/convert/?Amount=1&From=EUR&To=GBP";
    String URL4 = "http://www.xe.com/it/currencyconverter/convert/?Amount=1&From=EUR&To=JPY";
    String URL5 = "https://it.finance.yahoo.com/q?s=GCJ17.CMX";
    
    
    p.setURL(URL1);
    tmp = p.connect("uccResultAmount");
    p.setURL(URL2);
    tmp1 = p.connect("uccResultAmount");
    p.setURL(URL3);
    tmp2 = p.connect("uccResultAmount");
    p.setURL(URL4);
    tmp3 = p.connect("uccResultAmount");
    p.setURL(URL5);
    tmp4 = p.connect("yfs_l10_gcj17.cmx");
    tmp1 = tmp1.substring(0, 7);
    tmp2 = tmp2.substring(0, 8);  
    tmp3 = tmp3.substring(0, 7);
    tmp4 = tmp4.substring(0, 8);
    GregorianCalendar gc = new GregorianCalendar();
    dati = append( dati, format.format(gc.getTime())+"|"+tmp+"|"+tmp1+"|"+tmp2);   
    saveStrings("Data.txt", dati);
}

void draw() {  
    background(255);
    fill(0);
    textSize(40);
    //Primo Indicatore
    text("EUR/BTC : "+tmp, 0.75*width/5, 1.2*height/5);
    if(Float.parseFloat(tempo[1])>Float.parseFloat(numberParser(tmp))){
    //triangolo rosso
    fill(255,0,0);
    triangle(4*0.75*width/5,(1.2*height/5)+25,(4*0.75*width/5)-25,(1.2*height/5)-25,(4*0.75*width/5)+25,(1.2*height/5)-25);
    }else{
    //triangolo verde
    fill(0,255,0);
    triangle(4*0.75*width/5,(1.2*height/5)-25,(4*0.75*width/5)-25,(1.2*height/5)+25,(4*0.75*width/5)+25,(1.2*height/5)+25);

    }
    
    //Secondo Indicatore
    fill(0);
    text("EUR/USD : "+tmp1, 0.75*width/5, 1.8*height/5);
    if(Float.parseFloat(tempo[2])>Float.parseFloat(numberParser(tmp1))){
    //triangolo rosso
    fill(255,0,0);
    triangle(4*0.75*width/5,75+(1.2*height/5)+25,(4*0.75*width/5)-25,75+(1.2*height/5)-25,(4*0.75*width/5)+25,75+(1.2*height/5)-25);
    }else{
    //triangolo verde
    fill(0,255,0);
    triangle(4*0.75*width/5,75+(1.2*height/5)-25,(4*0.75*width/5)-25,75+(1.2*height/5)+25,(4*0.75*width/5)+25,75+(1.2*height/5)+25);

    }
    
    //Terzo Indicatore
    fill(0);
    text("EUR/GBP : "+tmp2, 0.75*width/5, 2.4*height/5);
    if(Float.parseFloat(tempo[3])>Float.parseFloat(numberParser(tmp2))){
    //triangolo rosso
    fill(255,0,0);
    triangle(4*0.75*width/5,150+(1.2*height/5)+25,(4*0.75*width/5)-25,150+(1.2*height/5)-25,(4*0.75*width/5)+25,150+(1.2*height/5)-25);
    }else{
    //triangolo verde
    fill(0,255,0);
    triangle(4*0.75*width/5,150+(1.2*height/5)-25,(4*0.75*width/5)-25,150+(1.2*height/5)+25,(4*0.75*width/5)+25,150+(1.2*height/5)+25);

    }
    
    //Quarto Indicatore
    fill(0);
    text("EUR/JPY : "+tmp3, 0.75*width/5, 3*height/5);
    if(Float.parseFloat(tempo[4])>Float.parseFloat(numberParser(tmp3))){
    //triangolo rosso
    fill(255,0,0);
    triangle(4*0.75*width/5,225+(1.2*height/5)+25,(4*0.75*width/5)-25,225+(1.2*height/5)-25,(4*0.75*width/5)+25,225+(1.2*height/5)-25);
    }else{
    //triangolo verde
    fill(0,255,0);
    triangle(4*0.75*width/5,225+(1.2*height/5)-25,(4*0.75*width/5)-25,225+(1.2*height/5)+25,(4*0.75*width/5)+25,225+(1.2*height/5)+25);

    }
    
    fill(0);
    text("ORO : "+tmp4, 0.75*width/5, 3.6*height/5);
    
    noLoop();
}

String numberParser(String a){
    char[]c = a.toCharArray();
    for(int i=0;i<c.length;i++){
        if(c[i]==',') c[i]='.';
    }
    return String.valueOf(c);
}