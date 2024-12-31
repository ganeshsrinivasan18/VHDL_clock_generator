library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity confosc is
port(clk,clr:in std_logic;
conf:in std_logic_vector(1 downto 0);
yout:out std_logic);
end confosc;
architecture beh of confosc is
signal cnt:std_logic_vector(1 downto 0);
begin
oscillator:process(clk,clr)
begin
if clr='1' then
cnt<="00000000";
elsif rising_edge(clk) then
cnt<=cnt+1;
end if;
end process oscillator;
kk:process(conf,clk,clr)
begin
if clr='1' then
yout<='0';
elsif falling_edge(clk) then
if conf="00" then
yout<=cnt(0);
end if;
if conf="01" then
yout<=cnt(1);
end if;
if conf="10" then
yout<=cnt(2);
end if;
if conf="11" then
yout<=cnt(3);
end if;
end if;
end process kk;
end beh;
