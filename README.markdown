# Adapter.Xd

## Usage

```
(xd2xd)

xd ---> zip --- json2plist ---> plist ---> checker
```

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
  +-- interactions/
  |     |
  |     `--- interactions.json
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
  |     |      `--- graphicContent.agc (json)
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
'(:|artboards| :HAVE-ID ;; key is :|id|
  :|resources| (:|meta| (:|ux| (:|colorSwatches| :not-have-id
                                :|documentLibrary| (:|version| :number
                                                    :|isStickerSheet| :boolean
                                                    :|hashedMetadata| nil
                                                    :|elements| (:HAVE-ID :|assetGroupData|))
                                :|gridDefaults| (:|defaultGrid| :not-have-id
                                                 :|layoutOverrides| :not-have-id)
                                :|symbols| (:HAVE-ID :|group|)
                                :|symbolsMetadata| (:|haveNestedSymbolsBeenMigrated| :boolean
                                                    :|usingNestedSymbolSyncing| :boolean)))
                :|gradients| nil
                :|clipPaths| nil)
  :|children| nil
  :|version| :string)
```

### artwork/

#### artboard-${id}/graphics/graphicContent.agc

JSON

```
(artwork-artboard-data "33d0e899-7255-4554-b08e-46818ff65507")

'(:|version| :string
  :|children| ((:|artboard| (:|type| :string ;; "artboard"
                             :|id| :string
                             :|meta| (:|ux| (:|hasCustomName| :boolean
                                             :|constraintsDisabled| :boolean
                                             :|gridStyle| :not-have-id))
                             :|style| :not-have-id
                             :|artboard| (:|children| :HAVE-ID
                                          :|meta| (:|ux| (:|path| :string)) ;; is :|id| ex) "33d0e899-7255-4554-b08e-46818ff65507"
                                          :|ref| :string)))) ;; is :|id| ex) "33d0e899-7255-4554-b08e-46818ff65507"
  :|resources| (:|href| :string)  ;; "/resources/graphics/graphicContent.agc"
  :|artboards| (:|href| :string)) ;; "/resources/graphics/graphicContent.agc"
```

#### pasteboard/graphics/graphicContent.agc

JSON

```
(artwork-pasteboard-data)

'(:|version| :string
  :|children| :HAVE-ID
  :|resources| (:|href| :string)  ;; "/resources/graphics/graphicContent.agc"
  :|artboards| (:|href| :string)) ;; "/resources/graphics/graphicContent.agc"
```

### interactions/

#### interactions.json

JSON

```
(interactions-data)

'(:|version| :string
  :|interactions| :have-id) ;; key is :|id|
```


## ZIP

https://github.com/bluelisp/zip
