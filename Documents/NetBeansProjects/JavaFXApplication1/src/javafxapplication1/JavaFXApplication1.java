/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javafxapplication1;


import javafx.application.Application;
import javafx.scene.Group;
import javafx.scene.Scene;
import javafx.stage.Stage;

/**
 *
 * @author C L
 */
public class JavaFXApplication1 extends Application {
    
    @Override
    public void start(Stage primaryStage) {
//        Image img=new Image("back.jpg");
//        ImageView image=new ImageView(img);
        
        Group root=new Group();
        //root.getChildren().addAll(image);
        
        
        Scene scene = new Scene(root, 600, 600);
//        scene.setFill(Color.BURLYWOOD);
       
        primaryStage.setTitle("menu!");
        primaryStage.setScene(scene);
       
        
        
        button newgame = new button("NEW GAME");
        button options = new button("Options");
        options.sety(230);
        button how = new button("HOW TO PLAY");
        how.sety(310);
       button exit = new button("EXIT");
       exit.sety(440);
        
       root.getChildren().add(newgame);
       root.getChildren().add(options);
       root.getChildren().add(how);
       root.getChildren().add(exit);
      
//      Image cursor = new Image("cursortransparent.jpg");  //pass in the image path
//      scene.setCursor(new ImageCursor(cursor));
//        primaryStage.show();
    }

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        launch(args);
    }
    
}
