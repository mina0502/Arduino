'''
sparse - 희소행렬
'''

'''
numpy에서 특수행렬을 만드는 함수
eye(N,M=,k=,dtype=)
M => 열의 수, k => 대각의 위치

eye==> 대각선이 1인 함수를 만듬 [항등행렬]
'''

import numpy as np
b1=np.ones(10)
b2=np.zeros((5,5))

b11=np.ones((5,5))

np.eye(2,dtype=int)

np.eye(4,M=5,k=1,dtype=int)

np.eye(4,M=5,k=-1,dtype=int)


'''
diag()함수 => 정방행렬에서 대각 요소만 추출하여 벡터를 만듬
diag(v,k=)
'''

x=np.arange(9).reshape(3,3)
print(x)

np.diag(x)

np.diag(x,k=1)

np.diag(x,k=-1)

'''
diag()함수는 반대로 벡터요소를 대각요소로 하는 정방행렬을 만들기도 한다
'''

np.diag(np.diag(x))


# ex02.py

'''

scipy에서 scikit-learn 알고리즘을 구현 할 때
많이 사용하는 모듈 scipy.sparse 모듈
희소 행렬기능은 주요 기능 중의 하나
희소 행렬(sparse matrix) : 0을 많이 포함한 2차원 배열

sparse.csr_matrix()메소드 : 0이 아닌 원소만 저장
0이 아닌 원소의 위치값 저장


희소행렬을 직접 만들 때 사용하는 포맷
COO 포맷 (coordinate 포맷)
CSR ->행의 인덱스를 압축해서 저장

'''


