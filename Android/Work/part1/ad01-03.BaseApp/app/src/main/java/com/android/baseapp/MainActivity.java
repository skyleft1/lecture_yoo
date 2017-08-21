package com.android.baseapp;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {




    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);


        // 위젯(변수) 선언
        Button btn1 = null;


        // 위젯 찾기 : findViewById();
        btn1 = (Button) findViewById(R.id.button);


        // 위젯 리스너 설정
        btn1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                Toast.makeText(getApplicationContext(), "버튼을 눌럿네요..", Toast.LENGTH_SHORT).show();
            }
        });

    }
}
