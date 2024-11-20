# 도커 알아보기

+ 기본 명령어 (CLI) 연습하기
+ Dockerfile를 ```docker build``` 하기

1. 도커 `이미지` 확인
```
docker image list
docker image ls
docker images
```

2. 도커 컨테이너 `실행` 확인
```
docker ps
```

3. 도커 컨테이너 `전체` 확인
```
docker ps -a
```

4. 도커 컨테이너 `생성` 하기
```
docker create -i --name ubt ubuntu:24.04
```

5. 도커 컨테이너 `시작` 하기
```
docker start ubt
```

6. 도커 컨테이너 `삭제` 하기
```
docker rm ubt
docker rm -f ubt
```

7. 도커 컨테이너 `정지` 하기
```
docker stop ubt
```

8. 도커 컨테이너 `실행` 하기
```
docker run -d -it --name ubt ubuntu:24.04
```
---
9. `dockerfile` 만들어 보기
```
docker run -d -p 80:80 --name web httpd:2.4.62
```
+ dockerfile 파일 만들고 넣기
```
FROM ubuntu:24.04

RUN apt-get update
RUN apt-get install -y apache2

EXPOSE 80

CMD ["apache2ctl", "-D", "FOREGROUND"]
```

10. 도커 이미지 생성 (`build`) 하기
```
docker build -t web:1 .
```
+ 생성한 이미지 실행 하기
```
docker run -d -p 80:80 --name web web:1
```

## Dockerfile 
```
FROM        : 기본 대상 이미지를 정의 하는 속성

MAINTAINER  : 작성자의 정보를 기록하는 속성

RUN         : FROM의 기반 이미지 위에서 실행될 명령어 정의

COPY        : 도커 컨테이너의 경로로 파일을 복사 할때 사용하는 속성
COPY 로컬:컨테이너 
COPY c:\IDE\works\vscode\index.html:/var/www/html/index.html

ENV         : 도커 컨테이너의 환경변수를 정의 하는 속성

EXPOSE      : 연결할 포트 번호 정의

ENTRYPOINT  : 도커 컨테이너 생성 후 실행될 명령어 (1회 실행)

CMD         : 도커 컨테이너 시작 이후 실행될 명령어
```

## `docker run` 옵션
```
-i          : 컨터이너와 상호 입출력 활성화 정의
-t          : tty 활성화. 주로 -i 옵션과 함께 이용
-it         : -i와 -t를 한번에 정의하는 옵션

-p          : 포트포워딩 옵션   (ex 로컬포트:컨테이너포트)

-e          : 환경변수를 지정하거나 값을 변경 하는 옵션

-v          : 저장소 연경 또는 공유 하는 옵션
> 도커의 저장소 (도커 내부의 `Volumes` 영역 공간)
> 로컬의 저장소 (컴퓨터의 HDD 또는 SSD)
```
---
## 도커 `network` 알아보기

1. 도커 호스트에 있는 `network` 목록 확인
```
docker network ls
```

2. 도커 Network의 드라이버 중 `bridge`의 정보 확인
```
docker network inspect [NETWORK ID]
```

3. 도커 Network를 `생성` 하기
```
docker network create myNet
```

4. 도커 컨테이너 `실행` 할때 network 연결해주기
```
docker run -d -p 9090:80 --network=myNet --name web3 web:2
```
---
## `docker compose` 만들어 보기

1. 데이터베이스 컨테이너 `실행` 해보기
```
docker run -d -p 13306:3306 -e MARIADB_ROOT_PASSWORD=1234 mariadb:11.5.2
```
