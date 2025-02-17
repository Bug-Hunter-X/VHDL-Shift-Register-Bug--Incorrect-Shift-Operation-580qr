```vhdl
ENTITY shift_register IS
    GENERIC (n : INTEGER := 8);
    PORT (clk, rst : IN BIT;
          din : IN BIT_VECTOR(n-1 DOWNTO 0);
          dout : OUT BIT_VECTOR(n-1 DOWNTO 0));
END ENTITY;

ARCHITECTURE behavioral OF shift_register IS
    SIGNAL temp : BIT_VECTOR(n-1 DOWNTO 0) := (OTHERS => '0');
BEGIN
    PROCESS (clk, rst)
    BEGIN
        IF rst = '1' THEN
            temp <= (OTHERS => '0');
        ELSIF rising_edge(clk) THEN
            temp <= din;
            dout <= temp;
        END IF;
    END PROCESS;
END ARCHITECTURE;
```