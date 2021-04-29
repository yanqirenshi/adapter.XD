# GeniusParty/docs

開発者向けドキュメント

# Usecase

- 欲しいものをノードにしていく。
- ノードを元に Mandara で Network Graph を書く。(公開する)
- Genius のポートフォリヲを作成&公開できるようにする。
- やってきたこと、やりたいこと、を忘れないようにする。
- やってることロードマップの管理
- Genius(ユーザー) の管理
- 他 Genius の検索
- 他 Genius の ノード を検索できるようにする。
- 他 Genius とつながるを継続する。
- フレンドとかではなく、コミュニティ的なもので繋る。(ユニオンって名前にしようかな)
- ギルド。ももうけたないな。プロジェクトと役割の集団は別になるはず。
- 世界はゲームだ。世界は漫画だ。ファンタジーだ。
- もっとも重要なのは個だ。
- 個から世界を見る。

# WBS

- Object Model
- Data Model
- Process Model
- デプロイ図
- 画面遷移図
- API
- 画面

# 画面

- World (Network Graph)
- Mandara (Network Graph)
- Project
  - やることのひとまとまりのもの。
  - Network の ノード を一種類なのか。
- Note

# Network Graph

Network Graph で表す。

線が繋っていないノードがあっても OK

<Node>
- Ordinary
- Link
- Project

<Node Type>
- Image
- Text

# graph

```
  +--------+                   +-------+
  | genius |-----have-to------>| force |
  +--------+                   +-------+

  +--------+                   +-------+
  | genius |-----have-to------>| guild |
  |        |                   |       |
  |        |-----join-to------>|       |
  +--------+                   +-------+

  +--------+                   +-------+
  | genius |-----have-to------>| party |
  |        |                   |       |
  |        |-----join-to------>|       |
  +--------+                   +-------+

  +--------+                   +---------+
  | genius |-----have-to------>| quantum |
  +--------+                   +---------+

  +---------+                  +---------+
  | quantum |----have-to------>| quantum |
  +---------+                  +---------+
```
