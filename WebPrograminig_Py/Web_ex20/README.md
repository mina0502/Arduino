-------------------------------------------------


    [Shell]

    from werkzeug.datastructures import MultiDict

    
    MultiDict 데이터 타입: GET과 POST 메소드로 넘어온 데이터(키,값) 튜플 형태

    MultiDict 타입에서 제공하는 메소드

    - get : 데이터 값을 가져옴

    - getlist : 데이터 값을 리스트 형태로 가져옴

    - add : MultiDict에 키와 값을 추가하는 메소드

    - setdefault : add 메소드와 비슷하게 동작, 변수가 없을 경우에만 값 적용

    - setlist : 리스트 타입에 변수 설정

    -  setlistdefault : 리스트 타입에 변수가 없을 경우에만 값 적용

    - copy : MultDict 데이터의 변수값이 리스트 타입으로 있는 경우
            리스트 타입의 메모리 주소를 복사

    - deepcopy : 리스트 타입의 메모리 주소가 아니라, 데이터를 복사

    - clear : 데이터를 모두 지움

    - pop : get 메소드와 유사한 동작을 하지만 변수에서 그 값을 제거하고 가져옴

    - poplist : pop메소드와 같은 동작을 하지만 같은 이름의 변수 키로 여러 값이 들어올 때
                이 값을 꺼내올 때 사용. getlist와 차이점: 꺼내온 뒤 기존의 MultiDict 변수의 키 제거
            
    - update : 기존의 MultiDict 타입 변수에 다른 MultiDict 타입 변수의 내용을 삽입할 때 사

    - append : 오브젝트(객체) 추가  x=[1,2,3] | x.append[4,5]  ===> [1,2,3,[4,5]]

    - extend : (iterable 객체)구성요소 추가 x=[1,2,3] x.extend[4,5] ===> [1,2,3,4,5]
    
    iterable 객체 - 리스트, 튜플, 딕셔너리
    
-------------------------------------------------
