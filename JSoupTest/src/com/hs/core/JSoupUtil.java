package com.hs.core;

import java.io.IOException;
import java.util.ArrayList;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class JSoupUtil {
	public ArrayList<String> getData() throws IOException{
		ArrayList<String> result
				= new ArrayList<String>();
		String url="https://dhlottery.co.kr/gameResult.do?method=byWin&wiselog=H_C_1_1";
		
		//전체 소스코드 읽어오기
		Document html = Jsoup.connect(url).get();
		
		//전체 소스코드에서 html tag 전체 삭제하고
		//글씨만 들고옴
		//Document doc = Jsoup.parseBodyFragment(html.text()); 
		
		Element body=html.body();
		Element head=html.head();
		String title = html.title();
		
		Elements win_result
			= body.select(".win_result");
		Element win_result_0
			= win_result.get(0);
		
		result.add(win_result_0.select("strong").get(0).text());
		result.add(win_result_0.select("strong").get(1).text());
		result.add(win_result_0.select(".ball_645").get(0).text());
		result.add(win_result_0.select(".ball_645").get(1).text());
		result.add(win_result_0.select(".ball_645").get(2).text());
		result.add(win_result_0.select(".ball_645").get(3).text());
		result.add(win_result_0.select(".ball_645").get(4).text());
		result.add(win_result_0.select(".ball_645").get(5).text());
		result.add(win_result_0.select("strong").get(2).text());
		result.add(win_result_0.select(".ball_645").get(6).text());
		
		return result;
	}
}







