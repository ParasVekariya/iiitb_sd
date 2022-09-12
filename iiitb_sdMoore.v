module iiitb_sdMoore(input clk,input reset,input din,output reg dout);

  //dout   --> for storing the output
  //din    --> for giving the inputs to thed sequence Detector
  //reset  --> for resting the detector
  //clock  --> for providing the clock to the design
  
  //Defining different steps
  parameter S0 = 3'b000;  // state Zero
  parameter S1 = 3'b001;  // state One
  parameter S2 = 3'b010;  // state OneZero
  parameter S3 = 3'b011;  // state OneZeroZero
  parameter S4 = 3'b100;  // state OneZeroZeroOne

  reg [2:0] state;  //for storing current states and moving to the next state.

  //triggering happens only at posedge of the clock or when the reset button is hit.
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      dout <= 1'b0; 
      state <= S0;
    end
    else begin
      case(state)
        S0: begin
          dout <=1'b0;
          if(din)
            state <= S1;
        end
        S1: begin
          dout <= 1'b0;
          if(~din)
            state <= S2;
        end
        S2: begin
          dout <= 1'b0;
          if(~din)
            state <= S3;
          else
            state <= S1;
        end
        S3: begin
          dout <= 1'b0;
          if(din)
            state <= S4;
          else
            state <= S0;
        end
        S4: begin
          dout <= 1'b1;
          if(din)
            state <= S1;
          else
            state <= S2;
        end
      endcase
    end
  end


endmodule
