library verilog;
use verilog.vl_types.all;
entity fsm is
    generic(
        A               : integer := 0;
        B               : integer := 1;
        C               : integer := 2;
        D               : integer := 3;
        E               : integer := 4;
        F               : integer := 5;
        G               : integer := 6;
        H               : integer := 7
    );
    port(
        clk             : in     vl_logic;
        x               : in     vl_logic;
        S               : out    vl_logic_vector(2 downto 0);
        z               : out    vl_logic
    );
end fsm;
