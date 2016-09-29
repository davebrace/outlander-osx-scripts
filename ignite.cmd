var mana %1

start:
  put prep ignite %1
  matchre cast You feel fully prepared|formation of a targeting pattern|target pattern has finished forming
  matchwait 32

cast:
  put cast $righthand
