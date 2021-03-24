# Computer-Aided-Design-for-VLSI-Design_Traffic-light

> Author : Ya Chen <br>
> Date : 2021 / 1 / 15

---

<br>

# Description

The goal of this homework is to design a traffic light control circuit as shown below. As shown in Figure 1, the circuit consists of a controller and a counter.

&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<img src = "https://i.imgur.com/jqtMU1o.png" width = "200">

The ASM chart of the controller is shown in Figure 2.

&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<img src = "https://i.imgur.com/Z4FktgY.png" width = "200">

The controller has three states: red, green and yellow. When the controller in red state, it turns on r_light ( r_light = 1 ), and resets the counter ( reset = 1 ). The controller stays in the red state until sensor input becomes 1. After that, the controller enters the green state, which turns on g_light ( g_light = 1 ) and enables the counter ( enable = 1 ). After the counting operation is completed ( complete = 1 ), the controller then enters yellow state. In the yellow state, the controller turns on y_light ( y_light = 1 ), and then returns to red state.<br>
<br>
The counter performs up counting operations. It will be reset as 0 when reset = 1. When reset = 0 and enable = 1, the counter will increase its counting value by 1 on the rising edge of the clock. When counting value reaches the maximum value, the complete = 1.<br>
<br>

### VHDL

Implement the traffic light controller by VHDL.<br>
<br>

### Verilog ( Optional )

Implement the traffic light controller by Verilog.

<br>

### P.S.

Your project report should include the <b>Quartus II</b> project file containing the codes of the system.
