package com.test.java;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Ex02 {

    public static void main(String[] args) {
        // Ex02.java
        
        try {
            
            String url = "https://www.moviechart.co.kr/rank/boxoffice";
            //상세페이지 https://m.moviechart.co.kr/info/movieinfo/detail/20244821 + 나머지 20개
            ///info/movieinfo/detail/20244821 <= 크롤링 해서 가져왔음.
            
            Document doc = Jsoup.connect(url).get();
            
            System.out.println(doc.html());
            
            Elements list = doc.select(".listTable table tbody tr");
            
            System.out.println(list.size());
            
            for (Element tr : list) {
                
                //System.out.println(tr);
                //System.out.println();
                
                String title = tr.select(".title > a").text();
                System.out.println(title);
                
                System.out.printf("%s - %s, %s\n" 
                                    ,tr.select(".redAc").text()
                                    ,tr.select(".date").text()
                                    ,tr.select(".audience").text());
                
                System.out.println(tr.select(".title > a").attr("href"));
                
                System.out.println();
                
                //영화 상세 페이지
                ///info/movieinfo/detail/20247450
                //https://m.moviechart.co.kr 필요
                Document subdoc = Jsoup.connect("https://m.moviechart.co.kr" + tr.select(".title > a").attr("href")).get();
                
                //copy > copy selector
                //#content > div.info > div > div.movieIner > div.movieIner__text > div > ul > li:nth-child(2) > dl > dt
                
                String genre = subdoc.select("#content > div.info > div > div.movieIner > div.movieIner__text > div > ul > li:nth-child(2) > dl > dt").text();
                
                System.out.println(genre);
                System.out.println();
                System.out.println();
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
