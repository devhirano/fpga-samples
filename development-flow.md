# 開発フロー

## ざっくりとした流れ

- specification
- high level design
- low level design
- RTL config
- functional verification
- logic synthesis
- gate level simulation
- place and route
- fabrication
- post si validation


## Specification

- 何を、どんなものを作りたいか
- 全体の振る舞いと input, output など
- counter であれば 4bit 幅、 reset 付、 active high enable など

## High Level Specifiation

- 大まかな役割ブロックの整理
- cpu であれば ALU, memory, register, I/O .. など

## Low Level Specifiation

- 具体的なそれぞれの処理を検討
- state machine, mux, decorders, internal registers など

## RTL Config

- Low Level Specification を verilog/hdl コードに落としこむ


## Simulation

- テストケースを記述して RTL Config が適切か確認する
- waveform を使い DUT が正しいかも確認する
- simulation には複数の種類が有り、テスト対象によって異なるツールを使い分ける必要がある
  - timing simulation
  - sdf simulation
  - gate level simulation

## Synthesis

- 合成は verilog/hdl の記述を実際の H/W に適合するよう、各 H/W プリミティブとのマッピングを行う
- 合成後はタイミング要件を満たしているかのタイミング解析を行う
  - 合成ツールはゲート遅延のみ理解し、ワイヤ遅延が認識できないため、調整が必要
- 合成後はバックエンド ( place and route ) に netlist を渡す


## Place and Route

?

## Post silicon validation

- シリコンに実際に載ったあとの動作確認
- RTL 動作は H/W に比べ格段に遅いため、この時点で発生する問題も存在する




