package hnp.dev.appcomic;

import androidx.appcompat.app.AppCompatActivity;
import androidx.viewpager.widget.ViewPager;

import android.app.AlertDialog;
import android.os.Bundle;
import android.view.View;
import android.widget.TextView;
import android.widget.Toast;

import com.wajahatkarim3.easyflipviewpager.BookFlipPageTransformer;


import dmax.dialog.SpotsDialog;
import hnp.dev.appcomic.Adapter.MyViewPaperAdapter;
import hnp.dev.appcomic.Common.Common;
import hnp.dev.appcomic.Retrofit.IComicAPI;
import io.reactivex.android.schedulers.AndroidSchedulers;
import io.reactivex.disposables.CompositeDisposable;
import io.reactivex.schedulers.Schedulers;

public class ViewDetail extends AppCompatActivity {

    IComicAPI iComicAPI;
    ViewPager myViewPager;
    CompositeDisposable compositeDisposable = new CompositeDisposable();
    TextView txt_chapter_name;
    View back, next;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_view_detail);

        init();
        initListener();
    }

    private void initListener() {
        back.setOnClickListener(v -> {
            if (Common.chapter_index == 0) { //If user in first chapter but press back
                Toast.makeText(ViewDetail.this, "Bạn đang ở chương đầu tiên", Toast.LENGTH_SHORT).show();
            } else {
                Common.chapter_index--;
                fetchLinks(Common.chapterList.get(Common.chapter_index).getID());
            }
        });
        next.setOnClickListener(v -> {
            if (Common.chapter_index == Common.chapterList.size() - 1) { //If user in last chapter but press next
                Toast.makeText(ViewDetail.this, "Bạn đang ở chương cuối cùng", Toast.LENGTH_SHORT).show();
            } else {
                Common.chapter_index++;
                fetchLinks(Common.chapterList.get(Common.chapter_index).getID());
            }
        });

        fetchLinks(Common.selected_chapter.getID());
    }

    private void fetchLinks(int id) {
        AlertDialog dialog = new SpotsDialog.Builder().setContext(this).setMessage("Please wait...").setCancelable(false).build();
        dialog.show();

        compositeDisposable.add(iComicAPI.getImageList(id)
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread())
                .subscribe(links -> {
                    MyViewPaperAdapter adapter = new MyViewPaperAdapter(getBaseContext(), links);
                    myViewPager.setAdapter(adapter);

                    txt_chapter_name.setText(Common.formatString(Common.selected_chapter.getName()));

                    //Create Book Flip Page
                    BookFlipPageTransformer bookFlipPageTransformer = new BookFlipPageTransformer();
                    bookFlipPageTransformer.setScaleAmountPercent(10f);
                    myViewPager.setPageTransformer(true, bookFlipPageTransformer);
                    dialog.dismiss();
                }, throwable -> {
                    Toast.makeText(ViewDetail.this, "Chương này đang được dịch", Toast.LENGTH_LONG).show();
                    dialog.dismiss();
                }));
    }

    private void init() {
        iComicAPI = Common.getAPI();
        myViewPager = findViewById(R.id.view_paper);
        txt_chapter_name = findViewById(R.id.txt_chapter_name);
        back = findViewById(R.id.chapter_back);
        next = findViewById(R.id.chapter_next);
    }

    @Override
    protected void onStop() {
        compositeDisposable.clear();
        super.onStop();
    }
}