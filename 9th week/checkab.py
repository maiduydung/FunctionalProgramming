q0 = 0
q1 = 1
q2 = 2

delta = (
    {'a':q1},
    {'a':q1, 'b':q2},
    {}
)

def checkab(s):
    q = q0
    for c in s:
        if c not in delta[q]:
            return False
        q = delta[q][c]
    
    if(q != q2):
        return False
    else:
        return True