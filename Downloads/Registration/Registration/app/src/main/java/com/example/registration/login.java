package com.example.registration;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

public class login extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);
        Button loginbutton = (Button) findViewById(R.id.login);
        final User user=new User(this);

        loginbutton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                EditText email = (EditText) findViewById(R.id.loginemail);
                EditText password = (EditText) findViewById(R.id.loginpassword);
                String emailtext = email.getText().toString();

                String passwordtext = password.getText().toString();
                if(emailtext.equals("")||passwordtext.equals("")){
                    Toast.makeText(getApplicationContext(),"Please Enter Your E-Mail & Password",Toast.LENGTH_LONG).show();
                }
                else if(user.checklogin(emailtext,passwordtext)){
                    Toast.makeText(getApplicationContext(),"Successfully logged in",Toast.LENGTH_LONG).show();
                    email.getText().clear();
                    password.getText().clear();
                    //here,we will move to the home page
                }
                else{
                    Toast.makeText(getApplicationContext(),"Invalid E-mail or Password!",Toast.LENGTH_LONG).show();

                }
            }
        });

    }
}