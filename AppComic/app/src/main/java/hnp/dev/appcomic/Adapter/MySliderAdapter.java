package hnp.dev.appcomic.Adapter;

import java.util.List;

import hnp.dev.appcomic.Model.Banner;
import ss.com.bannerslider.adapters.SliderAdapter;
import ss.com.bannerslider.viewholder.ImageSlideViewHolder;

public class MySliderAdapter extends SliderAdapter {
    private final List<Banner> bannerList;

    public MySliderAdapter(List<Banner> bannerList) {
        this.bannerList = bannerList;
    }

    @Override
    public int getItemCount() {
        return bannerList.size();
    }

    @Override
    public void onBindImageSlide(int position, ImageSlideViewHolder imageSlideViewHolder) {
        imageSlideViewHolder.bindImageSlide(bannerList.get(position).getLink());
    }
}
