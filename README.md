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
```
