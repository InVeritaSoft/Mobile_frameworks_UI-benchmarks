package com.example.myapplication

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import androidx.recyclerview.widget.GridLayoutManager
import androidx.recyclerview.widget.RecyclerView

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        val adapter = PerformanceAdapter(this)
        val layoutManager = GridLayoutManager(this, 10)
        var recyclerView = findViewById<RecyclerView>(R.id.rvView)
        recyclerView.setLayoutManager(layoutManager)
        recyclerView.setHasFixedSize(false)
        recyclerView.setAdapter(adapter)
    }
}
