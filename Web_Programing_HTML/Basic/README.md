###HTML에 CSS 와 JavaScript 적용

```
<link>는 항상 문서의 head 부분에 위치

<link rel="stylesheet" href="my-css-file.css">

문서의 스타일 시트임을 나타냄과 동시에 스타일 시트 파일의 경로를 포함하는 href를 내포
```

```
<script> 는 head에 들어갈 필요가 없다. 
</body> 태그 바로 앞, 문서 본문의 맨 끝에 넣는 것이 좋으며 
JavaScript를 적용하기 전에 모든 HTML 내용을 브라우저에서 읽었는지 확인하는 것이 좋다

<script src="my-js-file.js"></script>

<script> 태그가 비어있다고 보일 수 도 있지만 그렇지 않으며, 반드시 태그를 닫아주어야 한다(</script>)
```

###문서의 기본 언어 설정

```
 lang attribute 을 여는 HTML 태그에 추가하여 수행
 
 <html lang="en-US">
```
