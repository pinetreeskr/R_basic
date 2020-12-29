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

getwd() #데이터 저장경로 확인하기 

df <- read.csv('/rstudio_files/r_basic/csv_exam.csv') #확인된 저장경로에 파일 저장 후 불러오기

#20개의 데이터를 불러오기
head(df, 20)


write.csv(df, file='mydf.csv')#데이터를 파일로 작성하고 싶은 경우 write함수 사용하면 된다
View(df)#데이터의 새로운 스크립트 창으로 한눈에 확인 가능

# 데이터프레임 만들기 (직접설정)
df2<- data.frame(v1= c(1,2,1), v2=c(2,3,2))
df2

# 데이터프레임 만들기
no <- c(1,2,3,4)
name <- c('apple', 'banana', 'cherry', 'peach')
price <- c(500, 300, 800, 400)
qty <- c(3,4,7,1)

sales <- data.frame(no, name, price, qty) # 행의 값이 각각 다른 자료형 가능
sales # 콘솔에서 확인 가능
View(sales) # 표로 확인 가능 (대문자 V)

# 각 값을 꺼낼때
# name값을 꺼내고 싶을 때
sales[ ,2]  #[1] "apple"  "banana" "cherry" "peach" 

#컬럼의 숫자를 외울필요없이 행의 값을 꺼내는 방법
sales$name #[1] "apple"  "banana" "cherry" "peach" 

# 첫번째 행과 두번째 행을 출력
sales[c(1,2),] # 합하고싶을 땐 combine =c 사용
sales[,c(2,3)]


#특정 조건에 맞는 행 추출 = 서브셋 subset
#subset(원본데이터, 조건) -- 참인 경우에만 해당하는 행 추출
subset(sales, qty>3)
subset(sales, name =="apple")
subset(sales, price >= 400)

# 특정 컬럼만 조회하고싶을 떄 (ex. 개인정보 보여주기 꺼려질 때)
sales$name #name을 열로 추출
subset(sales, price >= 400, select = name) # name 만 행으로 추출
subset(sales, qty >=4, select = -price) # price만 "제외"하고 행으로 추출, 특정컬럼 제외

#qty가 3개 이상인 행에서 name과 price만 추출
subset(sales, qty>=3, select = c(name, price))




            