def fibs(n)
  arr = [0, 1]
  arr << arr[-1] + arr[-2] until arr.length > n
  arr.last
end

def fibs_rec(n)
  n < 2 ? n : fibs_rec(n - 1) + fibs_rec(n - 2)
end
