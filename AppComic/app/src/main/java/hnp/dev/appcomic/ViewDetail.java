package hnp.dev.appcomic;

import androidx.appcompat.app.AppCompatActivity;
import androidx.viewpager.widget.ViewPager;

import android.graphics.Color;
import android.os.Bundle;
import android.os.Handler;
import android.view.View;
import android.widget.TextView;
import android.widget.Toast;

import com.kaopiz.kprogresshud.KProgressHUD;
import com.wajahatkarim3.easyflipviewpager.BookFlipPageTransformer;

import hnp.dev.appcomic.Adapter.MyViewPaperAdapter;
import hnp.dev.appcomic.Common.Common;
import hnp.dev.appcomic.Retrofit.IComicAPI;
import io.reactivex.android.schedulers.AndroidSchedulers;
import io.reactivex.disposables.CompositeDisposable;
import io.reactivex.schedulers.Schedulers;

public class ViewDetail extends AppCompatActivity {

    IComicAPI iComicAPI;
    ViewPager myViewPager;
    //Cái này chỉ là một lớp giúp dữ mấy cái mình thực thi trong đây lại để khi kết thúc chọn clear là xóa hết
    CompositeDisposable compositeDisposable = new CompositeDisposable();
    TextView txt_chapter_name;
    View back, next;
    String chapter_name;

    //Này là cái Dialog xoay tròn
    KProgressHUD dialog;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_view_detail);

        init();
        initListener();
    }

    private void initListener() {
        back.setOnClickListener(v -> {
            if (Common.chapter_index == 0) {
                // Người dùng đứng ở chapter 1
                Toast.makeText(ViewDetail.this, "Bạn đang ở chương đầu tiên!", Toast.LENGTH_SHORT).show();
            } else {
                Common.chapter_index--;
                fetchLinks(Common.chapterList.get(Common.chapter_index).getID());
                chapter_name = Common.chapterList.get(Common.chapter_index).getName();
            }
        });
        next.setOnClickListener(v -> {
            if (Common.chapter_index == Common.chapterList.size() - 1) {
                // Người dùng đang ở chapter cuối cùng
                Toast.makeText(ViewDetail.this, "Bạn đang ở chương cuối cùng!", Toast.LENGTH_SHORT).show();
            } else {
                Common.chapter_index++;
                fetchLinks(Common.chapterList.get(Common.chapter_index).getID());
                chapter_name = Common.chapterList.get(Common.chapter_index).getName();
            }
        });
        chapter_name = Common.chapterList.get(Common.chapter_index).getName();
        fetchLinks(Common.selected_chapter.getID());
    }

    //Fetch data từ server về để load mấy cái ảnh của chapter đó lên
    private void fetchLinks(int id) {
        dialog = KProgressHUD.create(this)
                .setStyle(KProgressHUD.Style.SPIN_INDETERMINATE)
                .setCancellable(false)
                .setAnimationSpeed(1)
                .setDimAmount(0.5f).setWindowColor(Color.TRANSPARENT);
        dialog.show();
        compositeDisposable.add(iComicAPI.getImageList(id)
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread())
                .subscribe(links -> {
                    MyViewPaperAdapter adapter = new MyViewPaperAdapter(getBaseContext(), links);
                    myViewPager.setAdapter(adapter);

                    txt_chapter_name.setText(Common.formatString(chapter_name));

                    //Create Book Flip Page
                    BookFlipPageTransformer bookFlipPageTransformer = new BookFlipPageTransformer();
                    bookFlipPageTransformer.setScaleAmountPercent(10f);
                    myViewPager.setPageTransformer(true, bookFlipPageTransformer);
                    scheduleDismiss();
                }, throwable -> {
                    Toast.makeText(ViewDetail.this, "Chương này đang được dịch", Toast.LENGTH_LONG).show();
                    scheduleDismiss();
                }));
    }

    private void scheduleDismiss() {
        Handler handler = new Handler();
        handler.postDelayed(() -> dialog.dismiss(), 500);
    }

    //Cái này khi mỗi khi start viewDetail thì nó làm
    private void init() {
        iComicAPI = Common.getAPI();
        myViewPager = findViewById(R.id.view_paper);
        txt_chapter_name = findViewById(R.id.txt_chapter_name);
        back = findViewById(R.id.chapter_back);
        next = findViewById(R.id.chapter_next);
    }

    // Khi dừng viewDetail
    @Override
    protected void onStop() {
        compositeDisposable.clear();
        super.onStop();
    }
}