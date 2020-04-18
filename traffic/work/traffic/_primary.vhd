library verilog;
use verilog.vl_types.all;
entity traffic is
    generic(
        S0              : integer := 0;
        S1              : integer := 1;
        S2              : integer := 2;
        S3              : integer := 3;
        S4              : integer := 4;
        S5              : integer := 5;
        S6              : integer := 6;
        S7              : integer := 7;
        S8              : integer := 8;
        S9              : integer := 9;
        S10             : integer := 10;
        S11             : integer := 11;
        S12             : integer := 12;
        S13             : integer := 13;
        S14             : integer := 14;
        S15             : integer := 15
    );
    port(
        clk             : in     vl_logic;
        Sa              : in     vl_logic;
        Sb              : in     vl_logic;
        Ga              : out    vl_logic;
        Ya              : out    vl_logic;
        Ra              : out    vl_logic;
        Gb              : out    vl_logic;
        Yb              : out    vl_logic;
        Rb              : out    vl_logic;
        PS              : out    vl_logic_vector(3 downto 0)
    );
end traffic;
