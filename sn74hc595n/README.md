GR-CITRUSにKernel#shiftOutを実装したので、SN74HC595Nを使って制御してみた。

動画: https://youtu.be/y6mvuK9XPx8

## 接続方法

|GR-CITRUS |    | SN74HC595N |   |
|----------|----|------------|---|
| 5V       | -> | Vcc        |   |
|          |    | QA～QH     | -> LEDへ|
| PIN2     | -> | SER        | データ  |
| GND      | -> | OE         |   |
| PIN3     | -> | RCLK       | ラッチ  |
| PIN4     | -> | SRCLK      | クロック|
| 5V       | -> | SRCLR      |   |
| GND      | -> | GND        |   |


see details: https://qiita.com/sifue/items/77ff0a9ea745748608bf

## 利用方法

以下のコミットを取り込んだファームウェアで動く

https://github.com/wakayamarb/wrbb-v2lib-firm/pull/19
