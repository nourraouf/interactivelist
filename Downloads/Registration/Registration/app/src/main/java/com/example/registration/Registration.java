package com.example.registration;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;

public class Registration extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_registration);
        final TextView name= findViewById(R.id.FullName);
        final TextView email= findViewById(R.id.Email);
        final TextView password= findViewById(R.id.Password);
        final TextView password2= findViewById(R.id.password2);
        Button submit= findViewById(R.id.button);
        // Button delete= findViewById(R.id.delete_button);

        final User user=new User(this);

        submit.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                System.out.println((password.getText().toString()));
                System.out.println((password2.getText().toString()));
                //if any of the fields empty
if(name.getText().toString().equals("")||password.getText().toString().equals("")||email.getText().toString().equals("")||password2.getText().toString().equals("")){
    Toast.makeText(getApplicationContext(),"Please enter all required data!",Toast.LENGTH_LONG).show();

}
//not matched passwords
else if (!password.getText().toString().equals(password2.getText().toString())){
    Toast.makeText(getApplicationContext(),"Check your password ",Toast.LENGTH_LONG).show();
}
else {
                   user.adduser(name.getText().toString(),email.getText().toString(),password.getText().toString());
                   Toast.makeText(getApplicationContext(),"Successfully added",Toast.LENGTH_LONG).show();

                }
            }
        });







    }


}
