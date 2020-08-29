/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javafxapplication1;

import javafx.scene.control.Button;
import javafx.scene.effect.DropShadow;
import javafx.scene.input.MouseEvent;
import javafx.scene.paint.Color;
import javafx.scene.text.Font;

/**
 *
 * @author C L
 */
public class button extends Button {

    public button(String text) {
        super(text);
        this.setLayoutX(200);
        this.setLayoutY(150);
        this.maxHeight(50);
        this.maxWidth(300);
        this.setPrefSize(200, 50);
        
        Font btnfont=new Font("Times New Roman",20);
        this.setFont(btnfont);
        
       this.setTextFill(Color.WHITE);
        
        
       this.setStyle("-fx-text-fill: #F5F5F5");
       this.setStyle("-fx-font-size: 8em; ");
       this.setStyle("-fx-background-color:#DEB887; ");
       
       DropShadow shadow=new DropShadow();
       this.addEventHandler(MouseEvent.MOUSE_ENTERED, (MouseEvent e)->{
        this.setEffect(shadow);
    });
       this.addEventHandler(MouseEvent.MOUSE_EXITED, (MouseEvent e)->{
       this.setEffect(null);
    });
    }
    void sety(int y){
        this.setLayoutY(y);
    }
    
    
}
