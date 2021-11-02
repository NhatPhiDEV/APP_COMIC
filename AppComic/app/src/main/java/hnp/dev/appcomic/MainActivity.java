package hnp.dev.appcomic;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.GridLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import androidx.swiperefreshlayout.widget.SwipeRefreshLayout;

import android.content.Intent;
import android.graphics.Color;
import android.os.Bundle;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import com.kaopiz.kprogresshud.KProgressHUD;

import hnp.dev.appcomic.Adapter.MyComicAdapter;
import hnp.dev.appcomic.Adapter.MySliderAdapter;
import hnp.dev.appcomic.Common.Common;
import hnp.dev.appcomic.Retrofit.IComicAPI;
import hnp.dev.appcomic.Service.PicassoImageLoadingService;
import io.reactivex.android.schedulers.AndroidSchedulers;
import io.reactivex.disposables.CompositeDisposable;
import io.reactivex.schedulers.Schedulers;
import ss.com.bannerslider.Slider;

public class MainActivity extends AppCompatActivity {
    Slider slider;
    IComicAPI iComicAPI;
    CompositeDisposable compositeDisposable = new CompositeDisposable();
    RecyclerView recycler_comic;
    TextView txt_comic;

    KProgressHUD dialog;

    SwipeRefreshLayout swipeRefreshLayout;

    ImageView btn_search;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        //init API
        iComicAPI = Common.getAPI();

        //View
        btn_search = findViewById(R.id.btn_filter);
        btn_search.setOnClickListener(v -> startActivity(new Intent(MainActivity.this, CategoryFilter.class)));

        //Dialog
        dialog = KProgressHUD.create(this)
                .setStyle(KProgressHUD.Style.SPIN_INDETERMINATE)
                .setCancellable(false)
                .setAnimationSpeed(1)
                .setDimAmount(0.5f).setWindowColor(Color.TRANSPARENT);

        swipeRefreshLayout = findViewById(R.id.swipe_refresh);
        swipeRefreshLayout.setColorSchemeResources(R.color.purple_200,
                android.R.color.holo_green_dark,
                android.R.color.holo_blue_dark,
                android.R.color.holo_orange_dark);
        swipeRefreshLayout.setOnRefreshListener(() -> {
            if (Common.isConnectedToInternet(getBaseContext())) {
                fetchBanner();
                fetchComic();
            } else {
                Toast.makeText(MainActivity.this, "Không có kết nối Internet", Toast.LENGTH_SHORT).show();
            }
        });
        //Default, load first time
        swipeRefreshLayout.post(() -> {
            if (Common.isConnectedToInternet(getBaseContext())) {
                fetchBanner();
                fetchComic();
            } else {
                Toast.makeText(MainActivity.this, "Không có kết nối Internet", Toast.LENGTH_SHORT).show();
            }
        });

        slider = findViewById(R.id.banner_slider);
        Slider.init(new PicassoImageLoadingService());

        txt_comic = findViewById(R.id.txt_comic);
        recycler_comic = findViewById(R.id.recycler_comic);
        recycler_comic.setHasFixedSize(true);
        recycler_comic.setLayoutManager(new GridLayoutManager(this, 2));

        fetchBanner();
        fetchComic();
    }

    @Override
    protected void onStop() {
        compositeDisposable.clear();
        super.onStop();
    }

    private void fetchBanner() {
        compositeDisposable.add(iComicAPI.getBannerList()
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread())
                .subscribe(banners -> slider.setAdapter(new MySliderAdapter(banners))
                        , throwable -> Toast.makeText(MainActivity.this, "Vui lòng mở Server!", Toast.LENGTH_SHORT).show()));
    }

    private void fetchComic() {
        if (!swipeRefreshLayout.isRefreshing())
            dialog.show();

        compositeDisposable.add(iComicAPI.getComicList()
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread())
                .subscribe(comics -> {
                    recycler_comic.setAdapter(new MyComicAdapter(getBaseContext(), comics));
                    txt_comic.setText(new StringBuffer("Danh sách truyện (")
                            .append(comics.size())
                            .append(")"));
                    if (!swipeRefreshLayout.isRefreshing())
                        dialog.dismiss();
                    swipeRefreshLayout.setRefreshing(false);
                }, throwable -> {
                    if (!swipeRefreshLayout.isRefreshing())
                        dialog.dismiss();
                    swipeRefreshLayout.setRefreshing(false);
                    Toast.makeText(MainActivity.this, "Vui lòng mở Server!", Toast.LENGTH_SHORT).show();
                }));
    }
}