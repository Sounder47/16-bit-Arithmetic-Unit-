`timescale 1ns/1ps
module alu16bit_tb;
  reg clk;
  reg reset;
  reg [2:0] operation;
  reg [15:0] operand_A;
  reg [15:0] operand_B;
  wire [31:0] result;
  wire carry_flag;
  wire zero_flag;

  alu16bit uut (
    .clk(clk),
    .reset(reset),
    .operation(operation),
    .operand_A(operand_A),
    .operand_B(operand_B),
    .result(result),
    .carry_flag(carry_flag),
    .zero_flag(zero_flag)
  );
  // Clock generation (10ns period)
  
  initial begin
    // Initialize
    clk = 0;
    reset = 1;
    operand_A = 0;
    operand_B = 0;
    operation = 3'b000;
    #10;
    reset = 0;

    //ADD
    operand_A = 16'h0005;
    operand_B = 16'h0003;
    operation = 3'b000; // ADD
    #10;

    //SUB
    operand_A = 16'h0009;
    operand_B = 16'h0004;
    operation = 3'b001; // SUB
    #10;

    //MUL
    operand_A = 16'h000A;
    operand_B = 16'h0002;
    operation = 3'b010; // MUL
    #10;

    //AND
    operand_A = 16'h00F0;
    operand_B = 16'h0F0F;
    operation = 3'b011; // AND
    #10;

    //OR
    operand_A = 16'h00F0;
    operand_B = 16'h0F0F;
    operation = 3'b100; // OR
    #10;

    //NAND
    operand_A = 16'h00F0;
    operand_B = 16'h0F0F;
    operation = 3'b101; // NAND
    #10;

    //NOR
    operand_A = 16'h00F0;
    operand_B = 16'h0F0F;
    operation = 3'b110; // NOR
    #10;

    //XOR
    operand_A = 16'h00F0;
    operand_B = 16'h0F0F;
    operation = 3'b111; // XOR
    #10;
    $finish;
  end

  // Monitor outputs
  initial begin
    $monitor("Time=%0t | Op=%b | A=%h | B=%h | Result=%h | Carry=%b | Zero=%b",
              $time, operation, operand_A, operand_B, result, carry_flag, zero_flag);
  end
endmodule