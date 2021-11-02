package hnp.dev.appcomic.Common;

import android.content.Context;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;

import java.util.ArrayList;
import java.util.List;

import hnp.dev.appcomic.Model.Category;
import hnp.dev.appcomic.Model.Chapter;
import hnp.dev.appcomic.Model.Comic;
import hnp.dev.appcomic.Retrofit.IComicAPI;
import hnp.dev.appcomic.Retrofit.RetrofitClient;

public class Common {

    public static Comic selected_comic;
    public static Chapter selected_chapter;
    public static int chapter_index = -1;
    public static List<Chapter> chapterList = new ArrayList<>();
    public static List<Category> categories = new ArrayList<>();

    //Cái này để gọi Api fetch data từ server về
    public static IComicAPI getAPI() {
        return RetrofitClient.getInstance().create(IComicAPI.class);
    }

    public static String formatString(String name) {
        //Này có thể hiểu là nếu tên của chapter nhiều hơn 25 thì sau ký tự 25 là ... ngược lại thì in ra tên
        return (name.length() > 30 ? name.substring(0, 25) + "..." : name);
    }

    // Lớp này để kiểm tra có kết nối mạng hay không
    public static boolean isConnectedToInternet(Context context) {
        ConnectivityManager connectivityManager = (ConnectivityManager)context.getSystemService(Context.CONNECTIVITY_SERVICE);
        if (connectivityManager != null) {
            NetworkInfo[] info = connectivityManager.getAllNetworkInfo();
            if(info !=null){
                for (NetworkInfo networkInfo : info) {
                    if (networkInfo.getState() == NetworkInfo.State.CONNECTED)
                        return true;
                }
            }
        }
        return false;
    }
}
