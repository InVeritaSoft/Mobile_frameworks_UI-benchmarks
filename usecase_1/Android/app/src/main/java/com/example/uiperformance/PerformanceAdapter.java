package com.example.uiperformance;

import android.content.Context;
import android.graphics.Color;
import android.net.Uri;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.bumptech.glide.Glide;

import java.util.Random;


public class PerformanceAdapter extends RecyclerView.Adapter<RecyclerView.ViewHolder> {

    private Context context;



    final int ITEM_COUNTS = 1001;

    public final int TYPE_CONTAINER = R.layout.item_contaner;
    //public final int TYPE_OTHER = R.layout.item_other;

    public PerformanceAdapter(Context context) {
        this.context = context;
    }

    @NonNull
    @Override
    public RecyclerView.ViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        if (TYPE_CONTAINER == viewType){
            View v =  LayoutInflater.from(parent.getContext()).inflate(R.layout.item_contaner, parent, false);
            ViewHolder vh = new ViewHolder(v);
            return vh;
        }else{
            View v =  LayoutInflater.from(parent.getContext()).inflate(R.layout.item_other, parent, false);
            ViewHolder vh = new ViewHolder(v);
            return vh;
        }
    }

    @Override
    public void onBindViewHolder(@NonNull RecyclerView.ViewHolder holder, int position) {
        if (getItemViewType(position)==TYPE_CONTAINER){
            ((ViewHolder)holder).bind(position,context);
        }
    }

    @Override
    public int getItemViewType(int position) {
        return TYPE_CONTAINER;
    }

    @Override
    public int getItemCount() {
        return ITEM_COUNTS;
    }

    public static class ViewHolder extends RecyclerView.ViewHolder {

        static Random  rnd = new Random();

        View mContentContainer;
        TextView mItemText;
        ImageView mImageView;
        ImageView mRotareImageView;
        Animation mRotation;


        public ViewHolder(View v) {
            super(v);
            mContentContainer = v.findViewById(R.id.item_container);
            mItemText = v.findViewById(R.id.item_text);
            mImageView = v.findViewById(R.id.imageView);
            mRotareImageView = v.findViewById(R.id.rotareImageView);
            mRotation = AnimationUtils.loadAnimation(v.getContext(), R.anim.rotare);
            mRotation.setFillAfter(true);

        }

        public void bind(final int index,Context context) {
            Glide.with(context)
                    .load(Uri.parse("file:///android_asset/"+getImage(index)))
                    .into(mImageView);
            Glide.with(context)
                    .load(Uri.parse("file:///android_asset/"+getImage(index)))
                    .into(mRotareImageView);
            mRotareImageView.setAnimation(mRotation);
            mItemText.setText(String.valueOf(index));
            mContentContainer.setBackgroundColor(randomColor());
        }

        private int randomColor(){
            int color = Color.argb(255, rnd.nextInt(256), rnd.nextInt(256), rnd.nextInt(256));
            return  color;
        }

    }

    static String getImage(int index){
        return  (index % 20 )+".jpeg";

    }
}
