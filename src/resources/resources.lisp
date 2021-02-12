(in-package :adapter.xd)

(defun resouces-data-resources (resouces-data)
  (getf resouces-data :|resources|))

(defvar *MODEL-RESOURCES*
  '(:|clipPaths| "empty"
    :|gradients| "empty"
    :|meta| (:|ux| (:|symbolsMetadata| (:|usingNestedSymbolSyncing| "boolean"
                                        :|haveNestedSymbolsBeenMigrated| "boolean")
                    :|symbols| "list (plist)"
                    :|gridDefaults| (:|layoutOverrides| "list (plist)"
                                     :|defaultGrid| "plist")
                    :|documentLibrary| (:|elements| "list (plist)"
                                        :|hashedMetadata| "empty"
                                        :|isStickerSheet| "boolean"
                                        :|version| "number")
                    :|colorSwatches| "list (plist)"))))
