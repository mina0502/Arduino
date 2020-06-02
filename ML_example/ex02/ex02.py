
import numpy as np
from scipy import sparse

b1 = np.eye(4,dtype=int)

print("Numpy 배열:\n{}".format(b1))
print()


sparse_matrix= sparse.csr_matrix(b1)

print("Scipy의 CSR 행렬:\n{}".format(sparse_matrix))
print()
b2= np.eye(5,k=-1,dtype=int)
print(b2)
print()
sparse_matrix= sparse.csr_matrix(b2)

print("SciPy의 CSR 행렬:\n{}".format(sparse_matrix))
print()
b3 = np.arange(16).reshape(4,4)
print(b3)
print()
x= np.diag(b3)
print(x)
print()
y=np.diag(np.diag(b3))
print(y)
print()
sparse_matrix = sparse.csr_matrix(y)
print(sparse_matrix)
print()

data = np.ones(4)
print(data)
print()

row_indices = np.arange(4)
col_indices = np.arange(4)

eye_coo= sparse.coo_matrix((data,(row_indices, col_indices)))
print(eye_coo)
print()
