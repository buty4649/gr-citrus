# INPUT_PULL定数が使えるのは以下のFWから
# https://github.com/wakayamarb/wrbb-v2lib-firm/pull/18
pinMode(14, INPUT_PULLUP)

100.times do
    led(digitalRead(14))
    delay(100)
end