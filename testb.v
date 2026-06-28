module or1(a,b,y,z);
input a,b;
output y,z;
reg y,z;
always@(*)
begin
	y=a|b;
	if(b)
		z=a;
	else
		z=0;
		
end
endmodule

