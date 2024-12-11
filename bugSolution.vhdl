```vhdl
ENTITY my_entity IS
  PORT (
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    data_in : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    data_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
  );
END ENTITY;

ARCHITECTURE behavioral OF my_entity IS
  SIGNAL internal_reg : STD_LOGIC_VECTOR(7 DOWNTO 0) := "00000000";
BEGIN
  PROCESS (clk, rst)
  BEGIN
    IF rst = '1' THEN
      internal_reg <= "00000000";
      data_out <= "00000000";
    ELSIF rising_edge(clk) THEN
      internal_reg <= data_in;
      data_out <= internal_reg; 
    END IF;
  END PROCESS;
END ARCHITECTURE;
```