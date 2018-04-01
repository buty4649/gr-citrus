@ADDRESS = 0x45

def crc8(data)
  crc8 = 0xff
  data.each do |d|
    crc8 = crc8 ^ d
    8.times do
      crc8 = crc8 << 1
      crc8 = crc8 ^ 0x31 unless (crc8 & 0x100).zero?
      crc8 = crc8 & 0xff
    end
  end
  crc8
end
i2c = I2c.new(2)

i2c.begin(@ADDRESS)

# soft reset
i2c.lwrite(0x30)
i2c.lwrite(0xA2)
delay(10)
i2c.end()

usb = Serial.new(0)

i2c.begin(@ADDRESS)
i2c.lwrite(0xF3)
i2c.lwrite(0x2D)
i2c.end()

stat = i2c.lread()
stat = stat << 8
stat = stat | i2c.lread()

i2c.begin(@ADDRESS)
  i2c.lwrite(0x24)
  i2c.lwrite(0x00)
i2c.end()
delay(500)

i2c.request(@ADDRESS, 6)
buffer = Array.new()
6.times{|i| buffer[i] = i2c.lread()}

# CRCチェック
##usb.println("#{crc8(buffer[0..1]).to_s(16)} == #{buffer[2].to_s(16)}")
##usb.println("#{crc8(buffer[3..4]).to_s(16)} == #{buffer[5].to_s(16)}")

# 温度
temp = (buffer[0] << 8) | buffer[1]
temp = (temp * 175) / 0xffff - 45

# 湿度
hum = (buffer[2] << 8) | buffer[3]
hum = (hum * 100) / 0xffff

usb.println("温度: #{temp.to_s} / 湿度: #{hum.to_s}")