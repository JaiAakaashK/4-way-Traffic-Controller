module Traffic_controller_4_way_tb();
reg clk,rst;
wire west_green_straight, west_green_right, west_green_left;
wire west_yellow;
wire north_green_straight, north_green_right, north_green_left;
wire north_yellow;
wire east_green_straight, east_green_left, east_green_right;
wire east_yellow;
wire south_green_straight, south_green_right, south_green_left;
wire south_yellow;
wire west_red, north_red, east_red, south_red;

Traffic_controller_4_way dut(
		  .clk(clk),
        .rst(rst),
        .west_green_straight(west_green_straight),
        .west_green_right(west_green_right),
		  .west_green_left(west_green_left),
        .east_green_straight(east_green_straight),
        .east_green_left(east_green_left),
		  .east_green_right(east_green_right),
        .south_green_right(south_green_right),
        .south_green_left(south_green_left),
		  .south_green_straight(south_green_straight),
		  .north_green_right(north_green_right),
        .north_green_left(north_green_left),
		  .north_green_straight(north_green_straight),
        .west_yellow(west_yellow),
        .east_yellow(east_yellow),
		  .north_yellow(north_yellow),
        .south_yellow(south_yellow),
        .west_red(west_red),
        .south_red(south_red),
        .east_red(east_red),
		  .north_red(north_red)
    );
initial clk=0;
always #10 clk=~clk;
initial begin
clk=0;
rst=1;
#20;
rst=0;

#1100;
$finish;
end
endmodule 