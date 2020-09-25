package com.example.registration;

import android.content.ContentValues;
import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.database.sqlite.SQLiteStatement;

import androidx.annotation.Nullable;

public class User extends SQLiteOpenHelper {
     private static String dbname="users";
    private SQLiteDatabase db;

    public User(@Nullable Context context) {
        super(context, dbname, null, 1);

    }

    @Override
    public void onCreate(SQLiteDatabase sqLiteDatabase) {
        sqLiteDatabase.execSQL("create table users (id INTEGER PRIMARY KEY AUTOINCREMENT ,fullname TEXT, email TEXT ,password TEXT)");

    }

    @Override
    public void onUpgrade(SQLiteDatabase sqLiteDatabase, int i, int i1) {
sqLiteDatabase.execSQL("DROP TABLE IF EXISTS users");
onCreate(sqLiteDatabase);
    }



    public void adduser( String name, String email, String password)
    {
db=getWritableDatabase();
        ContentValues row=new ContentValues();
        row.put("fullname",name);
        row.put("email",email);
        row.put("password",password);
        db.insert("users",null,row);
        db.close();


    }

    public void delete_user (String email)

    {
        db=getWritableDatabase();
        db.delete("users","email='"+email+"'",null);
                db.close();
    }
    public boolean checklogin(String mail,String password)
    {
        String command="Select count(*)from users where email='"+mail+"'and password='"+password+"'";
        SQLiteStatement commandstatment=getReadableDatabase().compileStatement(command);
        long l=commandstatment.simpleQueryForLong();
        commandstatment.close();
        if(l==1){
            return true;
        }
        else {
            return false;
        }
    }
}
