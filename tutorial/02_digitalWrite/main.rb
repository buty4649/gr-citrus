# 抵抗内蔵LEDをチカチカさせてみる

pinMode(17, OUTPUT)

100.times do
    digitalWrite(17, 1)
    delay(100)
    digitalWrite(17, 0)
    delay(100)
end