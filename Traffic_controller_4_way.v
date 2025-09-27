module Traffic_controller_4_way(
    input clk,rst,
    output reg west_green_straight,west_green_right,west_green_left,
	 output reg west_yellow,
	 output reg north_green_right,north_green_left,north_green_straight,
	 output reg north_yellow,
    output reg east_green_straight,east_green_left,east_green_right,
	 output reg east_yellow,
    output reg south_green_right,south_green_left,south_green_straight,
	 output reg south_yellow,
    output reg west_red,
	 output reg south_red,
	 output reg east_red,
	 output reg north_red
);
    parameter s0=3'b000,s1=3'b001,s2=3'b010,s3=3'b011,s4=3'b100,s5=3'b101,s6=3'b110,s7=3'b111;
    reg [2:0] state,next_state;
    reg [3:0] count;
    parameter green=4'b1000;
    parameter yellow=2'b10;

    always @(posedge clk or posedge rst) begin
        if(rst) begin
            state<=s0;
            count<=0;
				end
        else begin
				state<=next_state; 
            case(state)

                s0: begin
                    if(state!=next_state) begin
                        count<=0;
                    end
                    else begin
                        count<=count+1;
                    end
                end

                s1: begin
                    if(state!=next_state) begin
                        count<=0;
                    end
                    else begin
                        count<=count+1;
                    end
                end

                s2: begin
                    if(state!=next_state) begin
                        count<=0;
                    end
                    else begin
                        count<=count+1;
                    end
                end

                s3: begin
                    if(state!=next_state) begin
                        count<=0;
                    end
                    else begin
                        count<=count+1;
                    end
                end

                s4: begin
                    if(state!=next_state) begin
                        count<=0;
                    end
                    else begin
                        count<=count+1;
                    end
                end

                s5: begin
                    if(state!=next_state) begin
                        count<=0;
                    end
                    else begin
                        count<=count+1;
                    end
                end

                s6: begin
                    if(state!=next_state) begin
                        count<=0;
                    end
                    else begin
                        count<=count+1;
                    end
                end

                s7: begin
                    if(state!=next_state) begin
                        count<=0;
                    end
                    else begin
                        count<=count+1;
                    end
                end

                default begin
                    count=0;
						  
                end
            endcase
        end
    end

    always @(*) begin
        next_state=state;
        case(state)

            s0: begin
                if(count==green) begin
                    next_state=s1;
                end
                else
                    next_state=s0;
            end

            s1: begin
                if(count==yellow) begin
                    next_state=s2;
                end
                else
                    next_state=s1;
            end

            s2: begin
                if(count==green) begin
                    next_state=s3;
                end
                else
                    next_state=s2;
            end

            s3: begin
                if(count==yellow) begin
                    next_state=s4;
                end
                else
                    next_state=s3;
            end

            s4: begin
                if(count==green) begin
                    next_state=s5;
                end
                else
                    next_state=s4;
            end

            s5: begin
                if(count==yellow) begin
                    next_state=s6;
                end
                else
                    next_state=s5;
            end

            s6: begin
                if(count==green) begin
                    next_state=s7;
                end
                else
                    next_state=s6;
            end

            s7: begin
                if(count==yellow) begin
                    next_state=s0;
                end
                else
                    next_state=s7;
            end

            default begin
                next_state=s0;
            end
        endcase
    end

    always @(*) begin
        west_green_straight = 1'b0; west_green_right = 1'b0; west_red  = 1'b1; west_yellow  = 1'b0;west_green_left=1'b0;
        east_green_straight = 1'b0; east_green_left = 1'b0; east_red  = 1'b1; east_yellow  = 1'b0;east_green_right=1'b0;
        south_green_right = 1'b0; south_green_left = 1'b0; south_red  = 1'b1; south_yellow  = 1'b0;south_green_straight=1'b0;
		  north_green_straight = 1'b0; north_green_left = 1'b0;north_green_straight=1'b0;north_green_right=1'b0;north_red=1'b1;north_yellow=1'b0;
        case(state)
            s0: begin
                west_green_straight=1;
                west_green_right=1;
                west_green_left=1;
                west_red=0;
                south_green_left=1;
            end

            s1: begin
                west_yellow=1;
                west_green_left=1;
					 west_red=0;
            end

            s2: begin
                north_green_right=1;
                north_green_left=1;
                north_green_straight=1;
                north_red=0;
                west_green_left=1;
            end

            s3: begin
                north_yellow=1;
                north_green_left=1;
					 north_red=0;
            end

            s4: begin
                east_green_straight=1;
                east_green_left=1;
                east_green_right=1;
                east_red=0;
                north_green_left=1;
            end

            s5: begin
                east_yellow=1;
                east_green_left=1;
					 east_red=0;
            end

            s6: begin
                south_green_straight=1;
                south_green_left=1;
                south_green_right=1;
                east_green_left=1;
                south_red=0;
            end

            s7: begin
                south_yellow=1;
                south_green_left=1;
					 south_red=0;
            end

        endcase
    end
endmodule
