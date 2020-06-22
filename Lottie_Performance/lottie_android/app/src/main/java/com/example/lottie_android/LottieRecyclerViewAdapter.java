package com.example.lottie_android;

import android.animation.ValueAnimator;
import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;
import com.airbnb.lottie.LottieAnimationView;


import static com.example.lottie_android.AllFiles.files;

public class LottieRecyclerViewAdapter extends RecyclerView.Adapter<RecyclerView.ViewHolder> {

    private Context context;


    public final int TYPE_CONTAINER = R.layout.lottie_item;


    public LottieRecyclerViewAdapter(Context context) {
        this.context = context;
    }

    @NonNull
    @Override
    public RecyclerView.ViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View v =  LayoutInflater.from(parent.getContext()).inflate(R.layout.lottie_item, parent, false);
        ViewHolder vh = new ViewHolder(v);
        return vh;
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
        return files.length;
    }

    public static class ViewHolder extends RecyclerView.ViewHolder {

        final LottieAnimationView lottieAnimationView;

        public ViewHolder(View v) {
            super(v);
            lottieAnimationView = v.findViewById(R.id.lottieView);
        }

        public void bind(final int index,Context context) {
            String fileName = files[index];
            lottieAnimationView.setAnimation(fileName);
            lottieAnimationView.setRepeatCount(ValueAnimator.INFINITE);
            lottieAnimationView.setFrame(60);
            lottieAnimationView.playAnimation();
        }

    }


}
