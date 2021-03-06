library ieee;
use ieee.std_logic_1164.all;

ENTITY traffic_light IS
  PORT(sensor : IN std_logic;
       clk : IN std_logic;
       r_light : OUT std_logic;
       g_light : OUT std_logic;
       y_light : OUT std_logic;
	   o_Reset, o_Enable, o_Complete : OUT std_logic;
       o_Counter : OUT integer range 0 to 3);
END traffic_light;

ARCHITECTURE behavior OF traffic_light IS
   TYPE mstate is (red, green, yellow);
   SIGNAL present_state, next_state : mstate;
   SIGNAL reset, enable, complete : std_logic := '0';
   SIGNAL counter : Integer range 0 to 3;
BEGIN
   PROCESS( present_state, sensor, reset, enable, complete )
   BEGIN
	  o_Reset <= reset;
	  o_Enable <= enable;
	  o_Complete <= complete;
	  o_Counter <= counter;
      CASE present_state IS
         WHEN green =>
			r_light <= '0';
			g_light <= '1';
			y_light <= '0';
			enable <= '1';
			reset <= '0';
			IF( complete = '1' ) THEN
				next_state <= yellow;
			ELSE
				next_state <= green;
			END IF;
			
          WHEN red =>
            r_light <= '1';
            g_light <= '0';
            y_light <= '0';
            reset <= '1';
            enable <= '0';
            complete <= '0';
            IF (sensor = '1') THEN
               next_state <= green;
            ELSE
               next_state <= red;
            END IF;
         WHEN yellow =>
            r_light <= '0';
            g_light <= '0';
            y_light <= '1';
            next_state <= red;
      END CASE;
      
	  IF( counter = 3 ) THEN
		complete <= '1';
	  END IF;
   END PROCESS;
   
   PROCESS
   BEGIN
      WAIT UNTIL clk'EVENT and clk = '1';
      present_state <= next_state;
      IF( enable = '1' ) THEN
		counter <= counter + 1;
	  END IF;
	  IF( reset = '1' ) THEN 
		counter <= 0;
	  END IF;
   END PROCESS;
END behavior;






