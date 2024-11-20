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
