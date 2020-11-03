import numpy as np
a=np.array([1,2,3])
b=np.array([4,5,6])
c=a+b #[5 7 9]
#print(c)

c=np.add(a,b)
#print(c)

c=a-b
#print(c)
c=np.subtract(a,b)
#print(c)

c=a*b
#print(c)
c=np.multiply(a,b)
#print(c)

c=a/b
#print(c)

c=np.divide(a,b)
#print(c)

list1=[
    [1,2],
    [3,4]
    ]
list2=[
    [5,6],
    [7,8]
    ]

a=np.array(list1)
b=np.array(list2)

product=np.dot(a,b)
#print(product)


a=np.array([[1,2],[3,4]])
s=np.sum(a,axis=0)
s1=np.sum(a,axis=1)
#print(s,"||",s1)


p=np.prod(a)
p1=np.prod(a,axis=0)
p2=np.prod(a,axis=1)
print(p,"||",p1,"||",p2)
