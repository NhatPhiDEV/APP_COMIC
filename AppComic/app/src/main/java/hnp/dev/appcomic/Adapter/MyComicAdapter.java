package hnp.dev.appcomic.Adapter;

import android.content.Context;
import android.content.Intent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.squareup.picasso.Picasso;

import java.util.List;

import hnp.dev.appcomic.ChapterActivity;
import hnp.dev.appcomic.Common.Common;
import hnp.dev.appcomic.Interface.MyRecyclerOnClick;
import hnp.dev.appcomic.Model.Comic;
import hnp.dev.appcomic.R;

public class MyComicAdapter extends RecyclerView.Adapter<MyComicAdapter.MyViewHolder> {

    Context context;
    List<Comic> comicList;

    //Đối tượng để truyền data từ server vào
    public MyComicAdapter(Context context, List<Comic> comicList) {
        this.context = context;
        this.comicList = comicList;
    }

    @NonNull
    @Override
    public MyViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View itemView = LayoutInflater.from(context).inflate(R.layout.comic_item,parent,false);
        return new MyViewHolder(itemView);
    }

    // Hiển thị dữ liệu lên view
    @Override
    public void onBindViewHolder(@NonNull MyViewHolder holder, int position) {
        Picasso.get().load(comicList.get(position).getImage()).into(holder.imageView);
        holder.textView.setText(comicList.get(position).getName());

        //Remember implement it, if you not do that, your app when crash when you click to comic
        holder.setMyRecyclerOnClick((view, position1) -> {
            //start new activity
            Intent intent = new Intent(context, ChapterActivity.class);
            intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            context.startActivity(intent);
            Common.selected_comic = comicList.get(position1);
        });
    }

    // Trả về số lượng các item trong danh sách truyền vô ở trên
    @Override
    public int getItemCount() {
        return comicList.size();
    }

    //Lớp này để ánh xạ các thành phần trên layout về để truyền dữ liệu lên
    public static class MyViewHolder extends RecyclerView.ViewHolder implements View.OnClickListener {
        ImageView imageView;
        TextView textView;
        MyRecyclerOnClick iRecyclerOnClick;

        public void setMyRecyclerOnClick(MyRecyclerOnClick iRecyclerOnClick) {
            this.iRecyclerOnClick = iRecyclerOnClick;
        }

        public MyViewHolder(@NonNull View itemView) {
            super(itemView);
            imageView = itemView.findViewById(R.id.image_view);
            textView = itemView.findViewById(R.id.manga_name);
            itemView.setOnClickListener(this);
        }

        @Override
        public void onClick(View v) {
            iRecyclerOnClick.onClick(v,getAdapterPosition());
        }
    }
}
