// Call an external URL using GUI

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Scanner;
import java.awt.*;    
import java.awt.event.*;    
   
class gui extends Frame implements ActionListener{ 
	 // creating objects of TextField, Label and Button class  
    TextField textField;   
    Label outputLabel, Entrylabel;   
    Button button; 
		  
  
    // constructor to instantiate the above objects  
    gui() 
	{
		Entrylabel = new Label();
		Entrylabel.setText("Enter city name: ");
		Entrylabel.setBounds(20, 60, 100, 20);
		
        textField = new TextField();    
        textField.setBounds(120, 60, 200, 30);   
  
        outputLabel = new Label();    
        outputLabel.setBounds(50,150,250,30);    
  
        button = new Button("Find Temperature");    
        button.setBounds(350, 60, 190, 30);    
        button.addActionListener(this);   
  
        add(button);  
		add(Entrylabel);
        add(textField);  
        add(outputLabel);

        setSize(600,400);    
        setLayout(null);    
        setVisible(true);    
    }    
  
    // defining actionPerformed method to generate an event  
    public void actionPerformed(ActionEvent e) 
	{    
        try 
		{   
			
			String city = textField.getText();
			URL urlWeather = new URL("https://api.openweathermap.org/data/2.5/weather?q=" + city + "&appid=3008aa81b09a80e673768dd0b143e0a1&units=metric");
			HttpURLConnection conn = (HttpURLConnection) urlWeather.openConnection();
			BufferedReader br = new BufferedReader(new InputStreamReader((conn.getInputStream())));
			String Temperature = "";
			String weatherData;
			while((weatherData = br.readLine()) != null) 
			{
				String find = "temp";
				int i = weatherData.indexOf(find);
				if(i>0)
					Temperature = weatherData.substring(i+find.length()+2, i+find.length()+7);
				   
			} 
			outputLabel.setText(city + " Temperature is: "+ Temperature);
		}
        catch (Exception ex) {  
            System.out.println(ex);  
        }    
    }  
	
	
  
    // main method  
    public static void main(String[] args) {  
		
        new gui();    
    }    
}  