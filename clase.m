function c = clase(proys, proyt, row, V)
  dis = zeros(1, row);
  for i=1:row
    dis(i) = norm(proys(i, :)-proyt);
  endfor
  dis
  [~,c] = min(dis);
endfunction