# Adapter.Xd

## Usage

## Installation

# XD


```
 zip/
  |
  +-- artwork
  |     |
  |     +--- artboard-${id}/
  |     |       |
  |     |       `--- graphics/
  |     |               |
  |     |               `--- graphicContent.agc (json)
  |     |
  |     +--- pasteboard/
  |             |
  |             `--- graphics/
  |                     |
  |                     `--- graphicContent.agc (json)
  |
  +-- interactions/  ※済み
  |     |
  |     `--- interactions.json  ※ interaction
  |
  +-- META-INF/
  |     |
  |     `--- metadata.xml
  |
  +-- renditions/
  |     |
  |     `--- image-${?}.png
  |
  +-- resources/
  |     |
  |     +--- graphics/
  |     |      |
  |     |      `--- graphicContent.agc (json)   ※済み artboard
  |     |
  |     `--- ${?} 画像ファイル。拡張子なし。
  |
  +-- sharing/
  |     |
  |     `--- sharing.json
  |
  +-- manifest (json)
  |
  +-- mimetype (text)
  |
  +-- preview.png
  |
  `-- thumbnail.png
```

### resources/

#### resources/graphics/graphicContent.agc

JSON

```
'(:|artboards| :have-id ;; key is :|id|
  :|resources| (:|meta| (:|meta| (:|ux| (:|colorSwatches| :not-have-id
                                         :|documentLibrary| (:|version| :number
                                                             :|isStickerSheet| :boolean
                                                             :|hashedMetadata| nil
                                                             :|elements| (:have-id :|assetGroupData|))
                                         :|gridDefaults| (:|defaultGrid| :not-have-id
                                                          :|layoutOverrides| :not-have-id)
                                         :|symbols| (:have-id :|group|)
                                         :|symbolsMetadata| (:|haveNestedSymbolsBeenMigrated| :boolean
                                                             :|usingNestedSymbolSyncing| :boolean))))
                :|gradients| nil
                :|clipPaths| nil)
  :|children| nil
  :|version| :string)
```

## ZIP

https://github.com/bluelisp/zip
