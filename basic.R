library(httr)

# 네이버 영화 증인 리뷰/평점 분석
base_url= "https://movie.naver.com/movie/bi/mi/pointWriteFormList.nhn?code=177374&type=after&isActualPointWriteExecute=false&isMileageSubscriptionAlready=false&isMileageSubscriptionReject=false&page="

allreviews=c() # base_url 값이 allreviews에 들어감

for (page in 1:100)
{
  print(page)
  url= paste(base_url, page, sep='') # sep는 설정값이라고 보면 됌
    
  r=GET(url)
  data = read_html(r)
  
  node_1 = html_nodes(data, '.star_score em') # rate가져옴
  # node_2 = html_nodes(node_1, 'p') 
 # node_2 = html_nodes(data, 'star_reple span') # reply가져옴 - fail
 # node_2 = html_nodes(data, '.score_result .star_reple span')
  #node_2 =  html_nodes(data, '.score_result .star_reple #_filtered_ment_0')  #//*[@id="_filtered_ment_0"]
  
  node_2 =  html_nodes(data, 'p')
  node_3 = html_nodes(data, '.score_reple em:nth-child(2)') #날짜 가져옴
  node_3 = gsub("\\.","-",node_3) #node_3의 값을 2019.02.13 -> 2019-02-13로 변환

  
  review= html_text(node_2)#node_2에서 텍스트만 가져와라 (웹문서에서 텍스트 내용만 추출)
  
#  if (length(review)==0) {break}  # 계속 수행되는걸 방지
#  allreviews=c(allreviews,reviwe)
}

            