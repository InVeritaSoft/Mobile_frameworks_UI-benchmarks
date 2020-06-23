package com.example.myapplication;

import android.content.Context;
import android.net.Uri;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.ImageView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.bumptech.glide.Glide;
import com.bumptech.glide.request.RequestOptions;




public class PerformanceAdapter extends RecyclerView.Adapter<RecyclerView.ViewHolder> {

    private Context context;
    static int width = 100;
    static int height = 100;



    final int ITEM_COUNTS = 200;

    public final int TYPE_ROTARE = 1;
    public final int TYPE_SCALE = 2;
    public final int TYPE_FADE = 3;
    //public final int TYPE_OTHER = R.layout.item_other;

    public PerformanceAdapter(Context context) {
        this.context = context;
    }

    @NonNull
    @Override
    public RecyclerView.ViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        if (TYPE_ROTARE == viewType){
            View v =  LayoutInflater.from(parent.getContext()).inflate(R.layout.item, parent, false);
            RotareViewHolder vh = new RotareViewHolder(v);
            return vh;
        }
        if (TYPE_SCALE == viewType){
            View v =  LayoutInflater.from(parent.getContext()).inflate(R.layout.item, parent, false);
            ScaleViewHolder vh = new ScaleViewHolder(v);
            return vh;
        }
        if (TYPE_FADE == viewType){
            View v =  LayoutInflater.from(parent.getContext()).inflate(R.layout.item, parent, false);
            FadeViewHolder vh = new FadeViewHolder(v);
            return vh;
        }

         View v =  LayoutInflater.from(parent.getContext()).inflate(R.layout.item_other, parent, false);
         RotareViewHolder vh = new RotareViewHolder(v);
         return vh;

    }

    @Override
    public void onBindViewHolder(@NonNull RecyclerView.ViewHolder holder, int position) {
        if (getItemViewType(position)==TYPE_ROTARE){
            ((MyViewHolder)holder).bind(position,context);
        }
        if (getItemViewType(position)==TYPE_SCALE){
            ((MyViewHolder)holder).bind(position,context);
        }
        if (getItemViewType(position)==TYPE_FADE){
            ((MyViewHolder)holder).bind(position,context);
        }
    }

    @Override
    public int getItemViewType(int position) {
        int index = position % 3;
        if (index == 0){
            return  TYPE_FADE;
        }
        if (index == 1){
            return  TYPE_SCALE;
        }
        return TYPE_ROTARE;
    }

    @Override
    public int getItemCount() {
        return ITEM_COUNTS;
    }

    abstract static  class MyViewHolder extends RecyclerView.ViewHolder{

        public MyViewHolder(@NonNull View itemView) {
            super(itemView);
        }

        abstract  public void bind(final int index,Context context);
    }



    public static class RotareViewHolder extends MyViewHolder {

        ImageView mRotareImageView;
        Animation mRotation;


        public RotareViewHolder(View v) {
            super(v);
            mRotareImageView = v.findViewById(R.id.imageView);
            mRotation = AnimationUtils.loadAnimation(v.getContext(), R.anim.rotare);
            mRotation.setFillAfter(true);
        }

        public void bind(final int index,Context context) {
            Glide.with(context)
                    .load(Uri.parse("file:///android_asset/"+getImage(index)))
                    .apply(new RequestOptions().override(width, height))
                    .into(mRotareImageView);
            mRotareImageView.setAnimation(mRotation);
        }
    }

    public static class FadeViewHolder extends MyViewHolder {

        ImageView mFadeImageView;
        Animation mFade;


        public FadeViewHolder(View v) {
            super(v);
            mFadeImageView = v.findViewById(R.id.imageView);
            mFade = AnimationUtils.loadAnimation(v.getContext(), R.anim.fade);
            mFade.setFillAfter(true);
        }

        public void bind(final int index,Context context) {
            Glide.with(context)
                    .load(Uri.parse("file:///android_asset/"+getImage(index)))
                    .apply(new RequestOptions().override(width, height))
                    .into(mFadeImageView);
            mFadeImageView.setAnimation(mFade);
        }
    }
    public static class ScaleViewHolder extends MyViewHolder {

        ImageView mScaleImageView;
        Animation mScale;


        public ScaleViewHolder(View v) {
            super(v);
            mScaleImageView = v.findViewById(R.id.imageView);
            mScale = AnimationUtils.loadAnimation(v.getContext(), R.anim.scale);
            mScale.setFillAfter(true);
        }

        public void bind(final int index,Context context) {
            Glide.with(context)
                    .load(Uri.parse("file:///android_asset/"+getImage(index)))
                    .apply(new RequestOptions().override(width, height))
                    .into(mScaleImageView);
            mScaleImageView.setAnimation(mScale);
        }
    }


    static String getImage(int index){
        return  (index % 20 )+".jpeg";

    }


}
