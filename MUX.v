module MUX
(
  input a,
  input b,
  input control,
  output out

);

if (control == 1'b0)
  out = a;
  
if (control == 1'b1)
  out = b;
  
endmodule