let isprime n =
  let rec mid_num m =
    m * m > n || (n mod m <> 0 && mid_num (m + 1))
  in
    mid_num 2 && n >= 2;; 