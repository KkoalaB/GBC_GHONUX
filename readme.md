# GHONUX에 대하여 

이 글은 29기 GBC 프로젝트를 통해 만들어진 GHONUX 및 도커에 대한 사용 설명문입니다.

docker라는 가상머신을 통하여 어느 os에서든지 다른 os를 구동할 수 있으며 이 장점을 살려 고스터들이 linux OS에서 편하게 개발을 할 수 있도록 linux/ubuntu를 docker를 통해 구축했습니다. 

사용방법은 간단합니다.

## 1. Docker 설치

- 당연한 말이지만 docker를 사용하기 위해서는 docker를 설치해야 합니다.
- Window OS
    - Window OS에서 도커를 사용하려면 적어도 에듀케이션 에디션 이상을 사용하셔야 합니다. 만약 지금 사용하는 Window OS가 홈 에디션이라면 에듀케이션으로 업그레이드 해주세요. (프로는 상관 없습니다.)
        - 한동대학생이라면 IT Support를 통해 무료로 에듀케이션 에디션을 제공받을 수 있습니다.
    - [여기](https://hub.docker.com/editions/community/docker-ce-desktop-windows)를 클릭하여 다운 받아주세요.
    - 그 다음으로는 Hyper-v를 enable 해야 합니다. 
        - [여기](https://docs.microsoft.com/en-us/virtualization/hyper-v-on-windows/quick-start/enable-hyper-v)를 클릭한 후 메뉴얼을 따라하면서 Hyper-V 를 활성화 시켜주세요.
        - 그래도 도커 실행이 정상적으로 안된다면 BIOS 에서 Intel CPU 사용자의 경우 CPU Virtualization 을 enable 시키고, AMD CPU 사용자의 경우 SVM mode 를 enable 시켜주세요.
    - 위의 모든 것을 수행했음에도 안되시는 분들은 컴퓨터 메모리가 4GB이하인 경우일 것입니다.
        - 안타깝게도 이 경우는 Docker를 사용할 수 없습니다.ㅠㅠ (다른 가상머신을 사용하시길...)
- MAC OS
    - [여기](https://hub.docker.com/editions/community/docker-ce-desktop-mac)를 클릭하여 다운받으시면 됩니다.

## 2. Docker 실행 
- 설치를 완료했다면 Docker2라는 어플리케이션이 보일 것입니다. 
- 그 어플리케이션을 클릭하면 실행이 됩니다.
- 실행을 했다면 터미널을 열어 다음의 명령어를 실행해주세요.(처음에는 시간이 소요됩니다.)

    ```$ docker run -it ghonux/ghonux```

    - -it 옵션을 통해 터미널로 컨테이너에 접속할 수 있게되었습니다.
- 이제 여러분만의 linux/ubuntu가 생성 되었습니다!! 이곳에서 마음껏 편하게 개발을 하세요.

## 3. 그 외의 명령어들
- 사용을 마쳤다면 ```eixt``` 명령어로 docker로부터 나올 수 있습니다.
- 본인이 생성했던 환경에 재접속을 하려면 다음의 명령어를 실행하여 접속할 수 있습니다.

    ```$ docker start -ai <container ID>```

- Contanier ID는 다음과 같은 명령어를 통해 확인할 수 있습니다. 

    ```$ docker ps -a``` 

- 만약 Container ID가 3a1998563b0e 이고 다른 컨테이너와 구별이 된다면

    ```$ docker start -ai 3 ```

    만으로도 재접속을 할 수 있습니다.

- 만약 자신의 컨테이너에 이름을 부여하고 싶다면 (부여하지 않으면 무작위로 생성됨)

    ```$ docker run -it -name <name> ghonux/ghonux ```

    명령어를 통해 실행해주세요.

- Ghonux는 컨테이너의 tag에 따라 제공하는 툴들이 다릅니다.

1. basic tag의 경우, 말그대로 개발에 필요한 기본적인 툴들을 제공합니다.
    - vim, tmux, git, python, build-essential 등
    - basic tag의 linux 개발환경에서 개발을 하고 싶다면 다음의 명령어로 실행해주세요.

    ```$ docker run -it ghonux/ghonux:basic```

2. GBC_security tag의 경우, 보안에 필요한 툴들을 제공합니다.
    - gdb, gef, pwndbg, radare2 등
    - zsh에 적용되었으면 oh-my-zsh을 통해 깔끔한 개발 환경을 제공합니다.
    - GBC_security tag의 linux 개발환경에서 개발을 하고 싶다면 다음의 명령어로 실행해주세요.

    ```$ docker run -it ghonux/ghonux:GBC_security```

3. latest tag의 경우, basic과 GBC_security를 적절히 조합한 환경을 제공합니다.
    - 개발에 필요한 기본적인 툴들을 제공하나 보안에 필요한 툴들은 없습니다.
    - 하지만 추가로 zsh과 oh-my-zsh을 제공합니다.
    - latest tag의 linux 개발환경에서 개발을 하고 싶다면 다음의 명령어로 실행해주세요.

    ```$ docker run -it ghonux/ghonux```

    - latest는 default tag이므로 추가적으로 굳이 붙이지 않아도 됩낟,

- 컨테이너 삭젝하기 
    - 다음의 명령어를 통해 컨테이너를 삭제할 수 있습니다.
     
    ```$ docker rm <container ID>```

    - 마찬가지로 ID가 구별만 된다면 한자리나 두자리로 생략도 가능합니다.

- 이미지 삭제하기 
    - 다음의 명령어를 통해 이미지를 삭제할 수 있습니다.
    
    ```$ docker rmi ghonux/ghonux```

- 이미지 확인하기
    
    ```$ docker images```
   
- 파일 복사하기
    - 로컬 파일을 docker 환경에서, 또는 반대의 상황에서 작업하고 싶은 경우가 있을 것입니다.
    - 그런 경우, local -> docker 경우는
        
    ```$ docker cp <local_file_path> <docker_path> ```
    
    - 반대의 경우에는 local 파일의 주소와 복사하여 둘 docker의 위치 만 서로 바꿔 명령어를 실행하면 됩니다.

    ```$ docker cp <docekr_path> <local_file_path> ```
