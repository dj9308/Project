package service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Service;

import vo.NaverBlogVO;

@Service
public class NaverBlogService {
	private static String clientId = "kaxGTzgsUCl2h_M3dZkF";
	private static String clientSecret = "5tgHk5dOqs";
	
	public List<NaverBlogVO> selectNaverBlog(String keyword, int display, int start) {
		List<NaverBlogVO> list = new ArrayList<NaverBlogVO>();
        try {
            String text = URLEncoder.encode(keyword, "UTF-8");
            String apiURL = "https://openapi.naver.com/v1/search/blog?query="+ text
            		+ (display !=0 ? "&display=" + display :"") //display: 검색결과 출력건수, start: 검색 시작위치
        			+ (start !=0 ? "&start=" + start :""); //json 결과
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("X-Naver-Client-Id", clientId);
            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            br.close();
            
            //json 파싱
            JSONParser parser = new JSONParser();
            JSONObject obj = (JSONObject)parser.parse(response.toString());
            JSONArray item = (JSONArray)obj.get("items");
            NaverBlogVO vo = null;
            JSONObject tmp = null;
            
            for(int i=0; i<item.size(); i++) {
            	vo = new NaverBlogVO();
            	tmp = (JSONObject)item.get(i);
            	vo.setTitle((String)tmp.get("title"));
            	vo.setLink((String)tmp.get("link"));
            	vo.setDescription((String)tmp.get("description"));
            	vo.setPostdate((String)tmp.get("postdate"));
            	list.add(vo);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
}
