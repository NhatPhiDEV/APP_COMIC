package hnp.dev.appcomic;

import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;
import androidx.recyclerview.widget.DividerItemDecoration;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.app.AlertDialog;
import android.os.Bundle;
import android.widget.TextView;
import android.widget.Toast;

import dmax.dialog.SpotsDialog;
import hnp.dev.appcomic.Adapter.MyChapterAdapter;
import hnp.dev.appcomic.Common.Common;
import hnp.dev.appcomic.Retrofit.IComicAPI;
import io.reactivex.android.schedulers.AndroidSchedulers;
import io.reactivex.disposables.CompositeDisposable;
import io.reactivex.schedulers.Schedulers;

public class ChapterActivity extends AppCompatActivity {

    IComicAPI iComicAPI;
    RecyclerView recycler_chapter;
    CompositeDisposable compositeDisposable = new CompositeDisposable();
    TextView txt_chapter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_chapter);

        //init API
        iComicAPI = Common.getAPI();

        //View
        Toolbar toolbar = findViewById(R.id.toolbar);
        toolbar.setTitle(Common.selected_comic.getName());
        //Set icon for toolbar
        toolbar.setNavigationIcon(R.drawable.ic_chevron_left);
        toolbar.setNavigationOnClickListener(v -> {
            finish(); //go back
        });

        recycler_chapter = findViewById(R.id.recycler_chapter);
        recycler_chapter.setHasFixedSize(true);
        LinearLayoutManager layoutManager = new LinearLayoutManager(this);
        recycler_chapter.setLayoutManager(layoutManager);
        recycler_chapter.addItemDecoration(new DividerItemDecoration(this,layoutManager.getOrientation()));

        txt_chapter = findViewById(R.id.txt_chapter);

        fetchChapter(Common.selected_comic.getID());
    }

    private void fetchChapter(int comicId) {
        AlertDialog dialog = new SpotsDialog.Builder().setContext(this).setMessage("Please wait...").setCancelable(false).build();
        dialog.show();

        compositeDisposable.add(iComicAPI.getChapterList(comicId)
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread())
                .subscribe(chapters -> {
                    Common.chapterList = chapters; //Save chapter to back, next
                    recycler_chapter.setAdapter(new MyChapterAdapter(getBaseContext(), chapters));
                    txt_chapter.setText(new StringBuilder("Chương (")
                    .append(chapters.size())
                    .append(")"));
                    dialog.dismiss();
                }, throwable -> {
                    Toast.makeText(ChapterActivity.this, "Chương này chưa được dịch", Toast.LENGTH_SHORT).show();
                    dialog.dismiss();
                }));
    }

    @Override
    protected void onStop() {
        compositeDisposable.clear();
        super.onStop();
    }
}