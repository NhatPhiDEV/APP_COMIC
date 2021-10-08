package hnp.dev.appcomic.Adapter;

import android.content.Context;
import android.content.Intent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import java.util.List;

import hnp.dev.appcomic.Common.Common;
import hnp.dev.appcomic.Interface.IRecyclerOnClick;
import hnp.dev.appcomic.Model.Chapter;
import hnp.dev.appcomic.R;
import hnp.dev.appcomic.ViewDetail;

public class MyChapterAdapter extends RecyclerView.Adapter<MyChapterAdapter.MyViewHolder> {

    Context context;
    List<Chapter> chapterList;

    public MyChapterAdapter(Context context, List<Chapter> chapterList) {
        this.context = context;
        this.chapterList = chapterList;
    }

    @NonNull
    @Override
    public MyViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View itemView = LayoutInflater.from(context).inflate(R.layout.chapter_item, parent, false);
        return new MyViewHolder(itemView);
    }

    @Override
    public void onBindViewHolder(@NonNull MyViewHolder holder,int position) {
        holder.txt_chapter_number.setText(new StringBuffer(chapterList.get(position).Name));

        Common.selected_chapter = chapterList.get(position);
        Common.chapter_index = position;

        holder.setiRecyclerOnClick((view, position1) -> {
            Common.selected_chapter =chapterList.get(position1);
            Common.chapter_index = position1;
            Intent intent = new Intent(context,ViewDetail.class);
            intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            context.startActivity(intent);
        });
    }

    @Override
    public int getItemCount() {
        return chapterList.size();
    }

    public static class MyViewHolder extends RecyclerView.ViewHolder implements View.OnClickListener {
        TextView txt_chapter_number;
        IRecyclerOnClick iRecyclerOnClick;

        public void setiRecyclerOnClick(IRecyclerOnClick iRecyclerOnClick) {
            this.iRecyclerOnClick = iRecyclerOnClick;
        }

        public MyViewHolder(@NonNull View itemView) {
            super(itemView);
            txt_chapter_number = itemView.findViewById(R.id.txt_chapter_number);
            itemView.setOnClickListener(this);
        }

        @Override
        public void onClick(View v) {
            iRecyclerOnClick.onClick(v, getAdapterPosition());
        }
    }
}
