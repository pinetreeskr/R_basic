# 텍스트마이닝 (TextMining) : 비정형 텍스트 기반으로 의미있는 명사를 추출하는 기술
# 워드클라우드 (WordCloud2) : 텍스트마이닝 결과를 보기쉽게 이쁘게 시각화 한 것, 문서의 단어들을 분류하여 그 빈도를 한누에 보기 쉽게 함

# KoNLP 패키지 : 쉽게 명사 추출가능한 패키지 (자바언어를 통해 만들어저있어서, 미리 설치되어있어야 함)

install.packages("KoNLP")
library(KoNLP) #설치하고 내 라이브러리 안에 포함시켜줘야 함.
# "설치 실패"

#KoNLP 를 위해 필요한 패키지는 아래와 같다.
installed.packages("rJava") 
installed.packages("memorise")
#KoNLP 를 위해 필요한 기타 의존선 패키지
installed.packages("mulitilinguer")
installed.packages(c('stringr', 'hash', 'tau', 'Sejong', 'RSQLite', 'devtools'), type="binary")
installed.packages("remotes")
#깃허브와 연동해서 설치하는 것이 유일하게 success를 얻어낼 수 있었습니다. 깃허브와 연동을 위해서 아래의 이미지 처럼 remotes 패키지를 설치하고 github에서 우리가 필요한 KoNLP 패키지를 설치해 보겠습니다.
remotes::intall_github('haven-jeon/KoNLP', update = "naver", INSTALL_opts=c(--no-muliarch))

# 위의 방법으로 다 실패 / java path 재설정해도 실패.. 
#아래 코드로 재설치해보니 아래 패키지만  성공 -- 위의 나머지 패키지 모두 실패
install.packages("rJava", dependencies = c("Depends", "Suggests"))
install.packages("remotes", dependencies = c("Depends", "Suggests"))
install.packages("mulitilinguer", dependencies = c("Depends", "Suggests"))
