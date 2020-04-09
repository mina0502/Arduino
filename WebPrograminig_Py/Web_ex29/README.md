```
		(ex29.py)
메시지 플래싱(Message Flashing) - 플라스크에서 제공하는 플래싱 시스템

요청의 끝에 메시지를 기록하고 그 다음 요청에서만 그 메시지를 접근할 수 있도록하는 기능

flash 함수==> template에서 사용
		
		(templates/flash_layout.html)
get_flashed_messages() ==>  뷰함수에서 넘겨온 메세지를 받아와서 리스트형식으로 뿌려줌


다른 값이 들어올 경우 Login Error  ==> (ex29.py)

```