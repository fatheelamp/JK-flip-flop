module jkff_tb;
reg j,k,clk;
wire q, qbar;
//sr srff(.q(q),.qbar(qbar),.s(s),.r(r),.clk(clk));
jkff jkff1(.q(q),.qbar(qbar),.clk(clk),.j(j),.k(k));
//jkff jkflipflop(q,qbar,clk,j,k); 
initial begin 
clk = 0;
forever #10 clk=~clk;
end

initial 
begin
j=0;   k=1;
#100 j=1;k=0;
#100 j=0;k=0;
#100 j=1;k=1;
#100 j=0;k=1;
#100 j=1;k=1;
#100 j=1;k=1;
#100 $finish;
end

initial begin
$monitor("simtime=%t | j=%d |k=%d |clk=%d|q=%d|qbar=%d",$time,j,k,clk,q,qbar);
$dumpfile("jkff.vcd");
$dumpvars();
end
endmodule
