참조: 
https://tekton.dev/docs/getting-started/tasks/
https://nangman14.tistory.com/85



# Tekton 
1. install 
'''
$ kubectl apply --filename \
https://storage.googleapis.com/tekton-releases/pipeline/latest/release.yaml
'''

2. install tkn CLI
'''
$ brew install tektoncd-cli
'''

3. SSH 개인 키 파일이 ~/.ssh/id_rsa에 있다고 가정
'''
$ kubectl create secret generic ssh-key-secret --from-file=ssh-key=~/.ssh/id_rsa
'''

4. maven error 발생 
'''
에러 코드 
[ERROR] Unknown lifecycle phase "/root/.m2". You must specify a valid lifecycle phase or a goal in the format <plugin-prefix>:<goal>
'''
'''
git clone 후 소스코드 위치가 달라서 발생하는 원인 
해결 방법 
mvn -B "$(params.maven-goal)"
-B 추가 
mvnw 파일로 하면 안됨 이유 : 
에러 원인: maven-goal 대신 /root/.m2 경로가 잘못 전달되어 Maven이 goal이 아닌 경로를 빌드 phase로 인식함.

해결 방법: maven-build Task 정의에서 mvn 실행 시 $(params.maven-goal)만 전달되도록 수정하고, /root/.m2는 goal이 아닌 워크스페이스(volume mount) 로 관리해야 함.
'''
