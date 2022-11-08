// Generates "triangle" waves (counts from 0 to 2^N-1, then back down again)
// The triangle should increment/decrement only if the ena signal is high, and hold its value otherwise.
module triangle_generator(clk, rst, ena, out);

parameter N = 8;
input wire clk, rst, ena;
output logic [N-1:0] out;

typedef enum logic {COUNTING_UP, COUNTING_DOWN} state_t;
state_t state, next_state;

logic [N-1:0] cnt, next_cnt;

always_ff @(posedge clk) begin: ff2
    if(rst) begin
        state <= COUNTING_UP;
        cnt <= 0;
    end
    else if (ena) begin
        state <= next_state;
        cnt <= next_cnt;
    end
end

always_comb begin : triangle
    case(state)
        COUNTING_UP:
            if (cnt >= (2 ** (N-1))) begin
                next_state = COUNTING_DOWN;
                next_cnt = cnt - 1;
            end
            else begin
                next_state = COUNTING_UP;
                next_cnt = cnt + 1;
            end
        COUNTING_DOWN:
            if (cnt == 0) begin
                next_state = COUNTING_UP;
                next_cnt = cnt + 1;
            end
            else begin
                next_state = COUNTING_DOWN;
                next_cnt = cnt - 1;
            end
    endcase
end

always_comb out = cnt;

endmodule