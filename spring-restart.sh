#!/bin/bash

SPRING_PID=$(pgrep -f stswebjpa-0.0.1-SNAPSHOT.jar)
SPRING_PATH="/home/dmsgo5866/stswebjpa/target/stswebjpa-0.0.1-SNAPSHOT.jar"

echo $SPRING_PID
echo $SPRING_PATH

# -z "$SPRING_PID": $SPRING_PID에 값이 없을때 true 반환 
if [ -z "$SPRING_PID" ]; then
  # 값이 없으면 종료된 상태임을 출력
  echo " 스프링이 종료된 상태..." 
  # 스프링 재시작시 log파일에 기록하겠다.(프롬프트에 안뜸)
  echo " 스프링 재시작 - $(date)" 1>> /home/dmsgo5866/stswebjpa/spring-restart.log
  # 값이 없으면 종료된 상태임을 출력 후 프로세스 실행
  echo "redsafe0914!" | nohup sudo -S java -jar $SPRING_PATH 1> /home/dmsgo5866/stswebjpa/log.out 2>/home/dmsgo5866/stswebjpa/err.out &
else
  # 값이 있으므로 스프링이 시작된 상태임을 출력
  echo "스프링이 시작된 상태..."
fi