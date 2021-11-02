package hnp.dev.appcomic;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.GridLayoutManager;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.annotation.SuppressLint;
import android.app.Dialog;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.os.Bundle;
import android.os.Handler;
import android.view.LayoutInflater;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import hnp.dev.appcomic.Adapter.MultipleChooseAdapter;
import hnp.dev.appcomic.Adapter.MyComicAdapter;
import hnp.dev.appcomic.Common.Common;
import hnp.dev.appcomic.Retrofit.IComicAPI;
import io.reactivex.android.schedulers.AndroidSchedulers;
import io.reactivex.disposables.CompositeDisposable;
import io.reactivex.schedulers.Schedulers;

public class CategoryFilter extends AppCompatActivity {

    Button btn_filter, btn_search;
    IComicAPI iComicAPI;
    CompositeDisposable compositeDisposable = new CompositeDisposable();
    RecyclerView recycler_filter;

    @Override
    protected void onStop() {
        compositeDisposable.clear();
        super.onStop();
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_category_filter);

        iComicAPI = Common.getAPI();

        //Load all category from server
        new Handler().post(this::fetchCategory);

        //View
        btn_filter = findViewById(R.id.btn_filter);
        btn_filter.setOnClickListener(v -> showOptionsDialog());

        btn_search = findViewById(R.id.btn_search);
        btn_search.setOnClickListener(v -> showSearchDialog());

        recycler_filter = findViewById(R.id.recycler_filter);
        recycler_filter.setHasFixedSize(true);
        recycler_filter.setLayoutManager(new GridLayoutManager(this, 2));
    }

    private void showSearchDialog() {
        final Dialog dialog = new Dialog(this);
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);
        dialog.setContentView(R.layout.dialog_search);

        Window window = dialog.getWindow();
        if(window == null){
            return;
        }
        window.setLayout(990, WindowManager.LayoutParams.WRAP_CONTENT);
        window.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));

        LayoutInflater inflater = this.getLayoutInflater();
        @SuppressLint("InflateParams")
        View search_layout = inflater.inflate(R.layout.dialog_search, null);

        Button btn_cancel = search_layout.findViewById(R.id.btn_cancel);
        Button btn_search = search_layout.findViewById(R.id.btn_search);
        EditText edt_search = search_layout.findViewById(R.id.edt_search);

        dialog.setContentView(search_layout);
        btn_cancel.setOnClickListener(view -> dialog.dismiss());

        btn_search.setOnClickListener(view -> {
            fetchSearchComic(edt_search.getText().toString());
            dialog.dismiss();
        });

        //Show dialog
        dialog.show();
    }

    private void fetchSearchComic(String search) {
        compositeDisposable.add(iComicAPI.getSearchComic(search)
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread())
                .subscribe(comics -> {
                    recycler_filter.setVisibility(View.VISIBLE);
                    recycler_filter.setAdapter(new MyComicAdapter(getBaseContext(), comics));
                }, throwable -> {
                    recycler_filter.setVisibility(View.INVISIBLE);
                    Toast.makeText(CategoryFilter.this, "Không tìm thấy truyện", Toast.LENGTH_SHORT).show();
                }));
    }

    private void showOptionsDialog() {
        final Dialog dialog = new Dialog(this);
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);
        dialog.setContentView(R.layout.dialog_options);

        Window window = dialog.getWindow();
        if(window == null){
            return;
        }
        window.setLayout(990, WindowManager.LayoutParams.WRAP_CONTENT);
        window.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));

        LayoutInflater inflater = this.getLayoutInflater();
        @SuppressLint("InflateParams")
        View filter_layout = inflater.inflate(R.layout.dialog_options, null);

        RecyclerView recycler_options = filter_layout.findViewById(R.id.recycler_options);
        recycler_options.setHasFixedSize(true);
        recycler_options.setLayoutManager(new LinearLayoutManager(this));
        MultipleChooseAdapter adapter = new MultipleChooseAdapter(getBaseContext(), Common.categories);
        recycler_options.setAdapter(adapter);
        dialog.setContentView(filter_layout);

        Button btn_cancel = filter_layout.findViewById(R.id.btn_cancel);
        Button btn_filter = filter_layout.findViewById(R.id.btn_filter);

        btn_cancel.setOnClickListener(view -> dialog.dismiss());

        btn_filter.setOnClickListener(view -> {
            fetchFilterCategory(adapter.getFilterArray());
            dialog.dismiss();
        });

        //Show dialog
        dialog.show();
    }

    private void fetchFilterCategory(String data) {
        compositeDisposable.add(iComicAPI.getFilteredComic(data)
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread())
                .subscribe(comics -> {
                    recycler_filter.setVisibility(View.VISIBLE);
                    recycler_filter.setAdapter(new MyComicAdapter(getBaseContext(), comics));
                }, throwable -> {
                    recycler_filter.setVisibility(View.INVISIBLE);
                    Toast.makeText(CategoryFilter.this, "Không tìm thấy truyện", Toast.LENGTH_SHORT).show();
                }));
    }

    private void fetchCategory() {
        compositeDisposable.add(iComicAPI.getCategoryList()
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread())
                .subscribe(categories -> Common.categories = categories
                        , throwable -> Toast.makeText(CategoryFilter.this, "Hiển thị loại truyện bị lỗi", Toast.LENGTH_SHORT).show()));
    }
}