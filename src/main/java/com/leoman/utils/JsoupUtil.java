package com.leoman.utils;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by Administrator on 2016/6/6.
 */
public class JsoupUtil {
    public static String getImg(String txt) {
        String str = replace(txt);
        String regxpForImgTag = "<img\\s[^>]+/>";
        Pattern pattern = Pattern.compile(regxpForImgTag);
        Matcher matcher = pattern.matcher(str);
        while (matcher.find()) {
            String temp = matcher.group();
            String tempUrl = temp.substring(temp.indexOf("src=") + 5);
            tempUrl = tempUrl.substring(0, tempUrl.indexOf("\""));
            if (tempUrl.trim().length()>0) {
                return tempUrl;
            }
        }
        return null;
    }

    public static String filterHtml(String txt) {
        String str = replace(txt);
        Document doc = Jsoup.parse(str);
        String text = doc.text();
        // remove extra white space
        StringBuilder builder = new StringBuilder(text);
        int index = 0;
        while (builder.length() > index) {
            char tmp = builder.charAt(index);
            if (Character.isSpaceChar(tmp) || Character.isWhitespace(tmp)) {
                builder.setCharAt(index, ' ');
            }
            index++;
        }
        text = builder.toString().replaceAll(" +", " ").trim();
        return text;
    }

    public static String replace(String txt) {
        return txt.replaceAll("&lt", "<").replaceAll("&gt", ">");
    }
}
