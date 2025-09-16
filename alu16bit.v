module alu16bit (
  input clk,                 
  input reset,               
  input [2:0] operation,     
  input [15:0] operand_A,
  input [15:0] operand_B,
  output reg [31:0] result, 
  output reg carry_flag,
  output reg zero_flag
);

parameter [2:0] ADD  = 3'b000,
                SUB  = 3'b001,
                MUL  = 3'b010,
                AND  = 3'b011,
                OR   = 3'b100,
                NAND = 3'b101,
                NOR  = 3'b110,
                XOR  = 3'b111;
reg [31:0] alu_result;  
reg alu_carry;
reg alu_zero;

always @(*) begin
  alu_result = 32'b0;
  alu_carry  = 1'b0;
  alu_zero   = 1'b0;
  case (operation)

    ADD: begin
      {alu_carry, alu_result} = {1'b0, operand_A} + {1'b0, operand_B};
      alu_zero = (alu_result[15:0] == 16'b0);
    end

    SUB: begin
      {alu_carry, alu_result} = {1'b0, operand_A} - {1'b0, operand_B};
      alu_zero = (alu_result[15:0] == 16'b0);
    end

    MUL: begin
      alu_result = operand_A * operand_B;  // full 32-bit product
      alu_zero = (alu_result == 32'b0);
    end

    AND: begin
      alu_result = {16'b0, (operand_A & operand_B)};
      alu_zero = (alu_result[15:0] == 16'b0);
    end

    OR: begin
      alu_result = {16'b0, (operand_A | operand_B)};
      alu_zero = (alu_result[15:0] == 16'b0);
    end

    NAND: begin
      alu_result = {16'b0, ~(operand_A & operand_B)};
      alu_zero = (alu_result[15:0] == 16'b0);
    end

    NOR: begin
      alu_result = {16'b0, ~(operand_A | operand_B)};
      alu_zero = (alu_result[15:0] == 16'b0);
    end

    XOR: begin
      alu_result = {16'b0, (operand_A ^ operand_B)};
      alu_zero = (alu_result[15:0] == 16'b0);
    end

    default: begin
      alu_result = 32'b0;
      alu_carry  = 1'b0;
      alu_zero   = 1'b1;
    end
  endcase
end

// Sequential block: registers outputs
always @(posedge clk) begin
  if (reset) begin
    result     <= 32'b0;
    carry_flag <= 1'b0;
    zero_flag  <= 1'b0;
  end else begin
    result     <= alu_result;
    carry_flag <= alu_carry;
    zero_flag  <= alu_zero;
  end
end
endmodule
