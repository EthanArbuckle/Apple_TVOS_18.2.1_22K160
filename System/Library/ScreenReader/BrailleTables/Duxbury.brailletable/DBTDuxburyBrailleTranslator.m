@interface DBTDuxburyBrailleTranslator
+ (_NSRange)_mappedRange:(_NSRange)a3 withPreprocessedMap:(id)a4;
- (BOOL)_loadTable:(id)a3 translationHandle:(void *)a4 backTranslationHandle:(void *)a5;
- (BOOL)activeTableSupportsContractedBraille;
- (BOOL)activeTableSupportsEightDotBraille;
- (BOOL)activeTableSupportsIPA;
- (BOOL)activeTableSupportsTechnicalBraille;
- (DBTDuxburyBrailleTranslator)init;
- (id)_eightDotPrintBrailleForText:(id)a3 locations:(id *)a4 textFormattingRanges:(id)a5;
- (id)_eightDotTextForPrintBraille:(id)a3 locations:(id *)a4;
- (id)_newPrintPreprocessorsForTable:(id)a3 primaryLanguageCode:(id)a4;
- (id)_printBrailleForText:(id)a3 mode:(unint64_t)a4 locations:(id *)a5 textPositionsRange:(_NSRange)a6 textFormattingRanges:(id)a7;
- (id)_printBrailleForText:(id)a3 mode:(unint64_t)a4 locations:(id *)a5 textPositionsRange:(_NSRange)a6 textFormattingRanges:(id)a7 optimize:(BOOL)a8;
- (id)_scrubDollarCodesInBuffer:(int *)a3 originalLength:(unint64_t)a4 originalLocations:(id)a5 newLocations:(id)a6 convertASCIIBrailleToUnicode:(BOOL)a7 limitRange:(_NSRange)a8;
- (id)_tableInfoForKey:(id)a3;
- (id)_textForPrintBraille:(id)a3 mode:(unint64_t)a4 locations:(id *)a5;
- (id)_textForPrintBraille:(id)a3 mode:(unint64_t)a4 locations:(id *)a5 optimize:(BOOL)a6;
- (id)activeTable;
- (id)printBrailleForTechnicalText:(id)a3 useTechnicalTable:(BOOL)a4 locations:(id *)a5;
- (id)printBrailleForText:(id)a3 mode:(unint64_t)a4 locations:(id *)a5 textPositionsRange:(_NSRange)a6 textFormattingRanges:(id)a7;
- (id)textForPrintBraille:(id)a3 mode:(unint64_t)a4 locations:(id *)a5;
- (unint64_t)_prepBuffersForConversion:(BOOL)a3 withString:(id)a4 mode:(unint64_t)a5 prefixLength:(unint64_t)a6;
- (unint64_t)interfaceVersion;
- (void)_eightDotTablesFromRawTable:(id)a3 translationTable:(id *)a4 backTranslationTable:(id *)a5;
- (void)_populatePrintBrailleForTextLocations:(id *)a3 inLength:(unint64_t)a4 outLength:(unint64_t)a5 translationHandle:(void *)a6 offsetToBraille:(unsigned __int16)a7 prefixCodeLength:(unsigned __int16)a8 preprocessedMap:(id)a9 optimize:(BOOL)a10;
- (void)_populateTextForPrintBrailleLocations:(id *)a3 inLength:(unint64_t)a4 outLength:(unint64_t)a5 offsetToBraille:(unsigned __int16)a6 prefixLength:(unint64_t)a7;
- (void)_populateTextForPrintBrailleLocations:(id *)a3 inLength:(unint64_t)a4 outLength:(unint64_t)a5 offsetToBraille:(unsigned __int16)a6 prefixLength:(unint64_t)a7 optimize:(BOOL)a8;
- (void)_unloadTables;
- (void)_unloadTechnicalTable;
- (void)dealloc;
- (void)loadNemethTable;
- (void)setActiveTable:(id)a3;
@end

@implementation DBTDuxburyBrailleTranslator

- (DBTDuxburyBrailleTranslator)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___DBTDuxburyBrailleTranslator;
  v2 = -[DBTDuxburyBrailleTranslator init](&v6, "init");
  if (v2)
  {
    v3 = (DBTComposedCharactersPreprocessor *)[objc_allocWithZone((Class)DBTComposedCharactersPreprocessor) init];
    composedCharacterPreprocessor = v2->_composedCharacterPreprocessor;
    v2->_composedCharacterPreprocessor = v3;
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___DBTDuxburyBrailleTranslator;
  -[DBTDuxburyBrailleTranslator dealloc](&v3, "dealloc");
}

- (void)_unloadTables
{
}

- (void)_unloadTechnicalTable
{
  id v3 = DBTLog();
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Begin unloading technical table", buf, 2u);
  }

  technicalTranslationHandle = self->_technicalTranslationHandle;
  if (technicalTranslationHandle)
  {
    if (BRLTRN_Destroy(technicalTranslationHandle))
    {
      id v6 = DBTLog();
      v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[DBTDuxburyBrailleTranslator _unloadTables].cold.1();
      }
    }

    self->_technicalTranslationHandle = 0LL;
  }

  technicalBackTranslationHandle = self->_technicalBackTranslationHandle;
  if (technicalBackTranslationHandle)
  {
    if (BRLTRN_Destroy(technicalBackTranslationHandle))
    {
      id v9 = DBTLog();
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[DBTDuxburyBrailleTranslator _unloadTables].cold.1();
      }
    }

    self->_technicalBackTranslationHandle = 0LL;
  }

  id v11 = DBTLog();
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "End unloading technical table", v13, 2u);
  }
}

- (id)_tableInfoForKey:(id)a3
{
  id v4 = a3;
  if ((unint64_t)[v4 length] >= 6)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "substringWithRange:", (char *)objc_msgSend( v4,  "length") - 5, 5));
    if ([&off_35398 containsObject:v5])
    {
      uint64_t v6 = -5LL;
      goto LABEL_8;
    }
  }

  v7 = v4;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "substringWithRange:", (char *)objc_msgSend( v4,  "length") - 3, 3));
  if (![&off_353B0 containsObject:v5])
  {
    v7 = v4;
    goto LABEL_10;
  }

  uint64_t v6 = -3LL;
LABEL_8:
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "substringToIndex:", (char *)objc_msgSend( v4,  "length") + v6));

LABEL_10:
LABEL_11:
  v8 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 pathForResource:@"Tables" ofType:@"plist"]);
  if (v10)
  {
    id v11 = [objc_allocWithZone(NSDictionary) initWithContentsOfFile:v10];
    v12 = v11;
    if (v11) {
      v13 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:v7]);
    }
    else {
      v13 = 0LL;
    }
  }

  else
  {
    v13 = 0LL;
  }

  return v13;
}

- (id)_newPrintPreprocessorsForTable:(id)a3 primaryLanguageCode:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v8 = objc_opt_new(&OBJC_CLASS___DBTTextFormatterPreprocessor);
  [v7 addObject:v8];

  if ([v5 isEqualToString:@"jpn"])
  {
    id v9 = objc_opt_new(&OBJC_CLASS___DBTSSeparatedByBunSetsuPreprocessor);
    [v7 addObject:v9];
    v10 = objc_opt_new(&OBJC_CLASS___DBTStringTransformPrintPreprocessor);
    -[DBTStringTransformPrintPreprocessor setStringTransform:]( v10,  "setStringTransform:",  kCFStringTransformLatinHiragana);
    [v7 addObject:v10];
  }

  if (([v5 isEqualToString:@"zh-cn"] & 1) != 0
    || [v5 isEqualToString:@"zh-tw"])
  {
    id v11 = objc_opt_new(&OBJC_CLASS___DBTSSepratedBySpacesPreprocessor);
    -[DBTSSepratedBySpacesPreprocessor setTokenizerUnit:](v11, "setTokenizerUnit:", 1LL);
    [v7 addObject:v11];
    v12 = objc_opt_new(&OBJC_CLASS___DBTStringTransformPrintPreprocessor);
    -[DBTStringTransformPrintPreprocessor setStringTransform:]( v12,  "setStringTransform:",  kCFStringTransformMandarinLatin);
    -[DBTStringTransformPrintPreprocessor setCharacterLevelStringTransform:]( v12,  "setCharacterLevelStringTransform:",  NSStringTransformMandarinToLatin);
    [v7 addObject:v12];
  }

  id v13 = [[BRLTEmojiPrintPreprocessor alloc] initWithPrimaryLanguageCode:v6];

  [v7 addObject:v13];
  v14 = (void *)objc_opt_new(&OBJC_CLASS___BRLTUnicodePrintPreprocessor);
  [v7 addObject:v14];

  return v7;
}

- (unint64_t)_prepBuffersForConversion:(BOOL)a3 withString:(id)a4 mode:(unint64_t)a5 prefixLength:(unint64_t)a6
{
  id v9 = a4;
  id v10 = [v9 length];
  if ((unint64_t)v10 + 4 >= self->_inBufferLen)
  {
    DBTWideCharBufferFree(self->_inBuffer);
    DBTWideCharBufferFree(self->_outBuffer);
    DBTWideCharBufferFree(self->_tmpBuffer);
    unint64_t v11 = 4LL * ((void)v10 + 20);
    self->_inBufferLen = (unint64_t)v10 + 20;
    self->_outBufferLen = v11;
    self->_tmpBufferLen = v11;
    self->_inBuffer = (int *)DBTWideCharBufferOfLength((size_t)v10 + 20, 1);
    self->_outBuffer = (int *)DBTWideCharBufferOfLength(self->_outBufferLen, 1);
    self->_tmpBuffer = (int *)DBTWideCharBufferOfLength(self->_tmpBufferLen, 1);
  }

  if (a5 == 4)
  {
    v12 = &_TechnicalPrefix;
    if (!a6) {
      goto LABEL_12;
    }
    goto LABEL_10;
  }

  if (self->_supportsContraction)
  {
    v12 = (int *)&_UnContractedPrefix;
    if (a5 == 3) {
      v12 = (int *)&_ContractedGrade2Prefix;
    }
    if (a6)
    {
LABEL_10:
      inBuffer = self->_inBuffer;
      unint64_t v14 = a6;
      do
      {
        int v15 = *v12++;
        *inBuffer++ = v15;
        --v14;
      }

      while (v14);
    }
  }

- (unint64_t)interfaceVersion
{
  return 7LL;
}

- (void)setActiveTable:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToString:self->_activeTable] & 1) == 0)
  {
    -[DBTDuxburyBrailleTranslator _unloadTables](self, "_unloadTables");
    if (-[DBTDuxburyBrailleTranslator _loadTable:translationHandle:backTranslationHandle:]( self,  "_loadTable:translationHandle:backTranslationHandle:",  v4,  &self->_translationHandle,  &self->_backTranslationHandle))
    {
      id v5 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
      id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[DBTDuxburyBrailleTranslator _tableInfoForKey:](self, "_tableInfoForKey:", v4));
      v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"8dot"]);
      if ([v8 length])
      {
        id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 pathForResource:v8 ofType:@"plist"]);
        id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  v9));
        unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"Table"]);
        -[DBTDuxburyBrailleTranslator _eightDotTablesFromRawTable:translationTable:backTranslationTable:]( self,  "_eightDotTablesFromRawTable:translationTable:backTranslationTable:",  v11,  &self->_eightDotTranslationTable,  &self->_eightDotBackTranslationTable);
      }

      v12 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForInfoDictionaryKey:@"BrailleTables"]);
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:v4]);
      unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:@"contracted"]);
      self->_contracted = [v14 BOOLValue];

      int v15 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:@"uncontracted"]);
      BOOL v16 = ([v15 BOOLValue] & 1) != 0 || self->_contracted;
      self->_supportsContraction = v16;

      v17 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:@"supportsTechnical"]);
      self->_supportsTechnical = [v17 BOOLValue];

      v18 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:@"supports8dot"]);
      BOOL v19 = [v18 BOOLValue]
         && -[NSDictionary count](self->_eightDotTranslationTable, "count")
         && -[NSDictionary count](self->_eightDotBackTranslationTable, "count") != 0;
      self->_supportsEightDot = v19;

      v20 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:@"supportsIPA"]);
      self->_supportsIPA = [v20 BOOLValue];

      v21 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:@"languages"]);
      uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSArray);
      if ((objc_opt_isKindOfClass(v21, v22) & 1) != 0)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue([v21 firstObject]);
      }

      else
      {
        id v24 = DBTLog();
        v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          -[DBTDuxburyBrailleTranslator setActiveTable:].cold.1((uint64_t)v4, v25, v26, v27, v28, v29, v30, v31);
        }

        v23 = 0LL;
      }

      v32 = -[DBTDuxburyBrailleTranslator _newPrintPreprocessorsForTable:primaryLanguageCode:]( self,  "_newPrintPreprocessorsForTable:primaryLanguageCode:",  v4,  v23);
      printPreprocessors = self->_printPreprocessors;
      self->_printPreprocessors = v32;

      v34 = (NSString *)[v4 copy];
      activeTable = self->_activeTable;
      self->_activeTable = v34;
    }

    else
    {
      -[DBTDuxburyBrailleTranslator _unloadTables](self, "_unloadTables");
    }
  }
}

- (void)loadNemethTable
{
  if (!self->_technicalTranslationHandle
    && !-[DBTDuxburyBrailleTranslator _loadTable:translationHandle:backTranslationHandle:]( self,  "_loadTable:translationHandle:backTranslationHandle:",  @"nemeth",  &self->_technicalTranslationHandle,  &self->_technicalBackTranslationHandle))
  {
    -[DBTDuxburyBrailleTranslator _unloadTechnicalTable](self, "_unloadTechnicalTable");
  }

- (BOOL)_loadTable:(id)a3 translationHandle:(void *)a4 backTranslationHandle:(void *)a5
{
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[DBTDuxburyBrailleTranslator _tableInfoForKey:](self, "_tableInfoForKey:", v8));
  id v10 = DBTLog();
  unint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  v12 = v11;
  if (v9)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v9;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "Begin loading tables %@", buf, 0xCu);
    }

    id v13 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s resourcePath](v12, "resourcePath"));
    int v15 = DBTWideCharBufferOfFullPath(v14, (uint64_t)@"chitab", @"txt");
    v48 = a5;
    v49 = v9;
    if (a4)
    {
      id v47 = v8;
      BOOL v16 = v15;
      v17 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"trans"]);
      v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:@"btb"]);
      BOOL v19 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:@"sct"]);
      *(void *)buf = 0LL;
      v20 = DBTWideCharBufferOfFullPath(v14, (uint64_t)v18, @"btb");
      v21 = DBTWideCharBufferOfFullPath(v14, (uint64_t)v19, @"sct");
      v46 = v16;
      int v22 = BRLTRN_CreateW(v20, v21, (uint64_t *)buf, 0LL, v16);
      DBTWideCharBufferFree(v20);
      DBTWideCharBufferFree(v21);
      if (v22)
      {
        id v23 = DBTLog();
        id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          -[DBTDuxburyBrailleTranslator _unloadTables].cold.1();
        }

        DBTWideCharBufferFree(v16);
        BOOL v25 = 0;
        id v8 = v47;
        goto LABEL_21;
      }

      v43 = *(_DWORD **)buf;
      *(_DWORD *)(*(void *)buf + 240LL) = 0;
      v43[73] = 4;
      *a4 = v43;

      v32 = v19;
      v33 = v18;
      id v8 = v47;
      int v15 = v16;
      id v9 = v49;
      if (!v48) {
        goto LABEL_18;
      }
    }

    else
    {
      v32 = 0LL;
      v33 = 0LL;
      if (!a5)
      {
LABEL_18:
        BOOL v19 = v32;
        v18 = v33;
LABEL_20:
        DBTWideCharBufferFree(v15);
        BOOL v25 = 1;
LABEL_21:

        id v9 = v49;
        goto LABEL_22;
      }
    }

    v34 = v15;
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", @"back", v46));
    v18 = (void *)objc_claimAutoreleasedReturnValue([v35 objectForKey:@"btb"]);

    uint64_t v36 = objc_claimAutoreleasedReturnValue([v35 objectForKey:@"sct"]);
    *(void *)buf = 0LL;
    v37 = DBTWideCharBufferOfFullPath(v14, (uint64_t)v18, @"btb");
    v38 = DBTWideCharBufferOfFullPath(v14, v36, @"sct");
    int v39 = BRLTRN_CreateW(v37, v38, (uint64_t *)buf, 0LL, v34);
    DBTWideCharBufferFree(v37);
    DBTWideCharBufferFree(v38);
    if (v39)
    {
      id v40 = v8;
      id v41 = DBTLog();
      v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
        -[DBTDuxburyBrailleTranslator _unloadTables].cold.1();
      }

      DBTWideCharBufferFree(v34);
      BOOL v25 = 0;
      id v8 = v40;
      BOOL v19 = (void *)v36;
      goto LABEL_21;
    }

    v44 = *(_DWORD **)buf;
    *(_DWORD *)(*(void *)buf + 240LL) = 0;
    v44[73] = 4;
    *v48 = v44;

    int v15 = v34;
    BOOL v19 = (void *)v36;
    goto LABEL_20;
  }

  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    -[DBTDuxburyBrailleTranslator _loadTable:translationHandle:backTranslationHandle:].cold.1( (uint64_t)v8,  v12,  v26,  v27,  v28,  v29,  v30,  v31);
  }
  BOOL v25 = 0;
LABEL_22:

  return v25;
}

- (id)activeTable
{
  return self->_activeTable;
}

- (BOOL)activeTableSupportsContractedBraille
{
  return self->_supportsContraction;
}

- (BOOL)activeTableSupportsIPA
{
  return self->_supportsIPA;
}

- (BOOL)activeTableSupportsEightDotBraille
{
  return self->_supportsEightDot;
}

- (BOOL)activeTableSupportsTechnicalBraille
{
  return self->_supportsTechnical;
}

- (void)_populatePrintBrailleForTextLocations:(id *)a3 inLength:(unint64_t)a4 outLength:(unint64_t)a5 translationHandle:(void *)a6 offsetToBraille:(unsigned __int16)a7 prefixCodeLength:(unsigned __int16)a8 preprocessedMap:(id)a9 optimize:(BOOL)a10
{
  unsigned int v10 = a8;
  int v11 = a7;
  v57 = a3;
  unsigned __int16 v59 = a7;
  id v56 = a9;
  size_t v54 = 8 * a5;
  BOOL v16 = (char *)malloc(8 * a5);
  v17 = (char *)&v53 - ((4 * a4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  bzero(v17, 4 * a4);
  v55 = &v53;
  if (a4)
  {
    v18 = (_DWORD *)((char *)&v53 - ((4 * a4 + 15) & 0xFFFFFFFFFFFFFFF0LL));
    unint64_t v19 = a4;
    do
    {
      *v18++ = v11 - v10;
      --v19;
    }

    while (v19);
    bzero(self->_tmpBuffer, self->_tmpBufferLen);
    if (!a10)
    {
      uint64_t v20 = v10;
      inBuffer = self->_inBuffer;
      unint64_t v22 = a4;
      id v23 = (_DWORD *)((char *)&v53 - ((4 * a4 + 15) & 0xFFFFFFFFFFFFFFF0LL));
      while (1)
      {
        int v24 = BRLTRN_TranslateString( a6,  inBuffer,  self->_tmpBuffer,  LOWORD(self->_tmpBufferLen),  (unsigned __int16)v20,  &v59);
        inBuffer = self->_inBuffer;
        int v25 = inBuffer[v20] == 31 ? *(v23 - 1) : v59 - v10;
        _DWORD *v23 = v25;
        if (v24) {
          goto LABEL_25;
        }
        ++v23;
        ++v20;
        if (!--v22) {
          goto LABEL_26;
        }
      }
    }
  }

  else
  {
    bzero(self->_tmpBuffer, self->_tmpBufferLen);
    if (!a10) {
      goto LABEL_26;
    }
  }

  v58 = 0LL;
  int LocationMap = BRLTRN_TranslateStringAndGetLocationMap( a6,  self->_inBuffer,  self->_tmpBuffer,  LOWORD(self->_tmpBufferLen),  &v58);
  uint64_t v27 = v58;
  if (LocationMap) {
    BOOL v28 = 1;
  }
  else {
    BOOL v28 = a4 == 0;
  }
  if (!v28)
  {
    uint64_t v29 = &v58[2 * v10];
    uint64_t v30 = &self->_inBuffer[v10];
    unint64_t v31 = a4;
    v32 = (unsigned int *)((char *)&v53 - ((4 * a4 + 15) & 0xFFFFFFFFFFFFFFF0LL));
    do
    {
      int v33 = *v30++;
      if (v33 == 31) {
        unsigned int v34 = *(v32 - 1);
      }
      else {
        unsigned int v34 = *(unsigned __int16 *)v29 - v10;
      }
      *v32++ = v34;
      v29 += 2;
      --v31;
    }

    while (v31);
  }

  if (v27) {
    free(v27);
  }
  if (LocationMap)
  {
LABEL_25:
    size_t v35 = v54;
    bzero(v16, v54);
    id v37 = v56;
    uint64_t v36 = v57;
    goto LABEL_50;
  }

- (id)_scrubDollarCodesInBuffer:(int *)a3 originalLength:(unint64_t)a4 originalLocations:(id)a5 newLocations:(id)a6 convertASCIIBrailleToUnicode:(BOOL)a7 limitRange:(_NSRange)a8
{
  BOOL v8 = a7;
  v12 = (char *)a5;
  id v13 = a6;
  int v24 = v12;
  if (v12) {
    v12 = (char *)[v12 bytes];
  }
  uint64_t v14 = 0LL;
  if (a4)
  {
    unint64_t v15 = 0LL;
    do
    {
      unsigned int v16 = a3[v15];
      if (v16 != 28 || v15 >= a4)
      {
LABEL_12:
        if (v8) {
          unsigned int v16 = ASCIIBrailleToUnicode(v16);
        }
        a3[v14++] = v16;
        if (v12)
        {
          if (a8.location == 0x7FFFFFFFFFFFFFFFLL
            || ((NSUInteger v19 = *(void *)&v12[8 * v15], v19 >= a8.location) ? (v20 = v19 > a8.location + a8.length) : (v20 = 1),
                !v20))
          {
            [v13 appendBytes:&v12[8 * v15] length:8];
          }
        }
      }

      else
      {
        unint64_t v18 = v15;
        while (a3[v18] != 31)
        {
          if (a4 == ++v18) {
            goto LABEL_12;
          }
        }

        unint64_t v15 = v18;
      }

      ++v15;
    }

    while (v15 < a4);
  }

  id v21 = DBTNSStringFromWideCharBuffer(a3, v14);
  unint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(v21);

  return v22;
}

+ (_NSRange)_mappedRange:(_NSRange)a3 withPreprocessedMap:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v6 = a4;
  v7 = v6;
  if (location == 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }

  else
  {
    id v9 = v6;
    unsigned int v10 = [v9 bytes];
    unint64_t v11 = (unint64_t)[v9 length];
    unint64_t v12 = v11 >> 3;
    if (v11 < 8)
    {
LABEL_9:
      unint64_t v8 = location;
    }

    else
    {
      unint64_t v8 = 0LL;
      if (v12 <= 1) {
        uint64_t v13 = 1LL;
      }
      else {
        uint64_t v13 = v11 >> 3;
      }
      while (v10[v8] < location)
      {
        if (v13 == ++v8) {
          goto LABEL_9;
        }
      }
    }

    if (v8 < v12)
    {
      unint64_t v14 = v8;
      while (v10[v14] < location + length)
      {
        if (v12 == ++v14) {
          goto LABEL_16;
        }
      }

      unint64_t v12 = v14;
    }

- (id)_printBrailleForText:(id)a3 mode:(unint64_t)a4 locations:(id *)a5 textPositionsRange:(_NSRange)a6 textFormattingRanges:(id)a7
{
  LOBYTE(v8) = 1;
  return -[DBTDuxburyBrailleTranslator _printBrailleForText:mode:locations:textPositionsRange:textFormattingRanges:optimize:]( self,  "_printBrailleForText:mode:locations:textPositionsRange:textFormattingRanges:optimize:",  a3,  a4,  a5,  a6.location,  a6.length,  a7,  v8);
}

- (id)_printBrailleForText:(id)a3 mode:(unint64_t)a4 locations:(id *)a5 textPositionsRange:(_NSRange)a6 textFormattingRanges:(id)a7 optimize:(BOOL)a8
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  id v56 = (int *)a4;
  BOOL v50 = a8;
  id v11 = a7;
  composedCharacterPreprocessor = self->_composedCharacterPreprocessor;
  id v66 = 0LL;
  id v58 = v11;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( -[DBTComposedCharactersPreprocessor preprocessPrintString:withLocationMap:isEightDot:textFormattingRanges:]( composedCharacterPreprocessor,  "preprocessPrintString:withLocationMap:isEightDot:textFormattingRanges:",  a3,  &v66,  0LL));
  id v14 = v66;
  id v15 = v13;
  NSUInteger v16 = -[NSArray count](self->_printPreprocessors, "count");
  v17 = v15;
  unint64_t v18 = v14;
  v57 = self;
  if (v16)
  {
    v51 = a5;
    __int128 v65 = 0u;
    __int128 v64 = 0u;
    __int128 v63 = 0u;
    __int128 v62 = 0u;
    NSUInteger v19 = self->_printPreprocessors;
    id v20 = -[NSArray countByEnumeratingWithState:objects:count:]( v19,  "countByEnumeratingWithState:objects:count:",  &v62,  v67,  16LL);
    id v54 = v15;
    v17 = v15;
    v55 = v14;
    unint64_t v18 = v14;
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v63;
      v17 = v54;
      unint64_t v18 = v55;
      do
      {
        id v23 = 0LL;
        int v24 = v17;
        int v25 = v18;
        do
        {
          if (*(void *)v63 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v26 = *(void **)(*((void *)&v62 + 1) + 8LL * (void)v23);
          id v61 = 0LL;
          v17 = (void *)objc_claimAutoreleasedReturnValue( [v26 preprocessPrintString:v24 withLocationMap:&v61 isEightDot:0 textFormattingRanges:v58]);
          id v27 = v61;

          unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[BRLTPreprocessorHelper mergeLocationMap:withLocationMap:]( &OBJC_CLASS___BRLTPreprocessorHelper,  "mergeLocationMap:withLocationMap:",  v25,  v27));
          id v23 = (char *)v23 + 1;
          int v24 = v17;
          int v25 = v18;
        }

        while (v21 != v23);
        id v21 = -[NSArray countByEnumeratingWithState:objects:count:]( v19,  "countByEnumeratingWithState:objects:count:",  &v62,  v67,  16LL);
      }

      while (v21);
    }

    id v14 = v55;
    id v15 = v54;
    a5 = v51;
    self = v57;
  }

  translationHandle = self->_translationHandle;
  if (v56 == &dword_4)
  {
    if (translationHandle) {
      translationHandle = self->_technicalTranslationHandle;
    }
    unsigned int v29 = 9;
  }

  else
  {
    unsigned int v29 = 4 * self->_supportsContraction;
  }

  uint64_t v30 = v29;
  unint64_t v31 = -[DBTDuxburyBrailleTranslator _prepBuffersForConversion:withString:mode:prefixLength:]( self,  "_prepBuffersForConversion:withString:mode:prefixLength:",  1LL,  v17);
  bzero(self->_outBuffer, self->_outBufferLen);
  if (BRLTRN_TranslateString( translationHandle,  self->_inBuffer,  self->_outBuffer,  LOWORD(self->_outBufferLen),  v29,  &v60))
  {
    id v32 = DBTLog();
    int v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      -[DBTDuxburyBrailleTranslator _unloadTables].cold.1();
    }

    unsigned int v34 = 0LL;
  }

  else
  {
    DBTWideCharBufferLength(self->_outBuffer);
    id v56 = (int *)v49;
    uint64_t v35 = __chkstk_darwin();
    id v37 = &v49[-v36];
    uint64_t v38 = v35 - v29;
    if (v35 != v30)
    {
      unint64_t v39 = &v57->_outBuffer[v30];
      char v40 = v37;
      uint64_t v41 = v35 - v30;
      do
      {
        int v42 = *v39++;
        *v40++ = v42;
        --v41;
      }

      while (v41);
    }

    if (a5)
    {
      id v59 = 0LL;
      LOBYTE(v48) = v50;
      v55 = v37;
      unint64_t v43 = v57;
      -[DBTDuxburyBrailleTranslator _populatePrintBrailleForTextLocations:inLength:outLength:translationHandle:offsetToBraille:prefixCodeLength:preprocessedMap:optimize:]( v57,  "_populatePrintBrailleForTextLocations:inLength:outLength:translationHandle:offsetToBraille:prefixCodeLength:prep rocessedMap:optimize:",  &v59,  v31,  v38,  translationHandle,  v60,  v30,  v18,  v48);
      id v44 = v59;
      uint64_t v45 = objc_claimAutoreleasedReturnValue( +[NSMutableData dataWithCapacity:]( NSMutableData,  "dataWithCapacity:",  [v44 length]));
      id v37 = v55;
      int v46 = (void *)v45;
    }

    else
    {
      id v44 = 0LL;
      int v46 = 0LL;
      unint64_t v43 = v57;
    }

    unsigned int v34 = (void *)objc_claimAutoreleasedReturnValue( -[DBTDuxburyBrailleTranslator _scrubDollarCodesInBuffer:originalLength:originalLocations:newLocations:convertASCIIBrailleToUnicode:limitRange:]( v43,  "_scrubDollarCodesInBuffer:originalLength:originalLocations:newLocations:convertASCIIBrailleToUnicode:limitRange:",  v37,  v38,  v44,  v46,  1LL,  location,  length));
    if (a5) {
      *a5 = v46;
    }
  }

  return v34;
}

- (id)printBrailleForText:(id)a3 mode:(unint64_t)a4 locations:(id *)a5 textPositionsRange:(_NSRange)a6 textFormattingRanges:(id)a7
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  id v13 = a3;
  id v14 = a7;
  int v15 = _os_feature_enabled_impl("Accessibility", "CustomBraille");
  if (a4 != 4 && v15)
  {
    if (!self->_supportsEightDot)
    {
      if (self->_contracted) {
        a4 = 3LL;
      }
      else {
        a4 = 1LL;
      }
      goto LABEL_15;
    }

    goto LABEL_10;
  }

  if (a4 == 4)
  {
    if (self->_supportsTechnical)
    {
      uint64_t v16 = objc_claimAutoreleasedReturnValue( -[DBTDuxburyBrailleTranslator printBrailleForTechnicalText:useTechnicalTable:locations:]( self,  "printBrailleForTechnicalText:useTechnicalTable:locations:",  v13,  1LL,  a5));
      goto LABEL_16;
    }

    a4 = 4LL;
LABEL_15:
    uint64_t v16 = objc_claimAutoreleasedReturnValue( -[DBTDuxburyBrailleTranslator _printBrailleForText:mode:locations:textPositionsRange:textFormattingRanges:]( self,  "_printBrailleForText:mode:locations:textPositionsRange:textFormattingRanges:",  v13,  a4,  a5,  location,  length,  v14));
    goto LABEL_16;
  }

  if (a4 != 2) {
    goto LABEL_15;
  }
  if (!self->_supportsEightDot)
  {
    a4 = 2LL;
    goto LABEL_15;
  }

- (id)printBrailleForTechnicalText:(id)a3 useTechnicalTable:(BOOL)a4 locations:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  if (v6
    && ((-[DBTDuxburyBrailleTranslator loadNemethTable](self, "loadNemethTable"), self->_supportsTechnical)
     || self->_technicalTranslationHandle))
  {
    id v9 = [v8 length];
    unsigned int v10 = self;
    id v11 = v8;
    uint64_t v12 = 4LL;
  }

  else
  {
    id v9 = [v8 length];
    unsigned int v10 = self;
    id v11 = v8;
    uint64_t v12 = 1LL;
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue( -[DBTDuxburyBrailleTranslator _printBrailleForText:mode:locations:textPositionsRange:textFormattingRanges:]( v10,  "_printBrailleForText:mode:locations:textPositionsRange:textFormattingRanges:",  v11,  v12,  a5,  0LL,  v9,  0LL));

  return v13;
}

- (void)_populateTextForPrintBrailleLocations:(id *)a3 inLength:(unint64_t)a4 outLength:(unint64_t)a5 offsetToBraille:(unsigned __int16)a6 prefixLength:(unint64_t)a7
{
}

- (void)_populateTextForPrintBrailleLocations:(id *)a3 inLength:(unint64_t)a4 outLength:(unint64_t)a5 offsetToBraille:(unsigned __int16)a6 prefixLength:(unint64_t)a7 optimize:(BOOL)a8
{
  int v10 = a6;
  unint64_t v11 = a5;
  unsigned __int16 v36 = a6;
  size_t v34 = 8 * a5;
  int v15 = (char *)malloc(8 * a5);
  uint64_t v16 = (int *)((char *)&v34 - ((4 * a4 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  *uint64_t v16 = v10 - a7;
  bzero(self->_tmpBuffer, self->_tmpBufferLen);
  if (!a8)
  {
    if (a4 >= 2)
    {
      unint64_t v23 = a4 - 1;
      int v24 = v16 + 1;
      unsigned __int16 v25 = a7 + 1;
      while (1)
      {
        int v26 = BRLTRN_TranslateString( (_DWORD *)self->_backTranslationHandle,  self->_inBuffer,  self->_tmpBuffer,  LOWORD(self->_tmpBufferLen),  v25,  &v36);
        *int v24 = v36 - (_DWORD)a7;
        if (v26) {
          goto LABEL_15;
        }
        ++v24;
        ++v25;
        if (!--v23) {
          goto LABEL_16;
        }
      }
    }

    goto LABEL_16;
  }

  uint64_t v35 = 0LL;
  int LocationMap = BRLTRN_TranslateStringAndGetLocationMap( (_DWORD *)self->_backTranslationHandle,  self->_inBuffer,  self->_tmpBuffer,  LOWORD(self->_tmpBufferLen),  &v35);
  unint64_t v18 = v35;
  if (LocationMap || !a4)
  {
    if (!v35) {
      goto LABEL_14;
    }
  }

  else
  {
    NSUInteger v19 = &v35[2 * a7];
    id v20 = (_DWORD *)((char *)&v34 - ((4 * a4 + 15) & 0xFFFFFFFFFFFFFFF0LL));
    unint64_t v21 = a4;
    do
    {
      int v22 = *(unsigned __int16 *)v19;
      v19 += 2;
      *v20++ = v22 - a7;
      --v21;
    }

    while (v21);
  }

  free(v18);
LABEL_14:
  if (!LocationMap)
  {
LABEL_16:
    unint64_t v28 = a4 - 1;
    size_t v27 = v34;
    while (1)
    {
      unint64_t v29 = a4;
      a4 = v28;
      if (!v28) {
        break;
      }
      int v30 = v16[v28];
      if (v30 != v16[v29 - 2]) {
        goto LABEL_21;
      }
LABEL_25:
      unint64_t v28 = a4 - 1;
    }

    int v30 = *v16;
LABEL_21:
    unint64_t v31 = v30;
    if (v11 > v30)
    {
      unint64_t v32 = v11 - v30;
      int v33 = (unint64_t *)&v15[8 * v31];
      do
      {
        *v33++ = a4;
        --v32;
      }

      while (v32);
    }

    unint64_t v11 = v31;
    goto LABEL_25;
  }

- (id)_textForPrintBraille:(id)a3 mode:(unint64_t)a4 locations:(id *)a5
{
  return -[DBTDuxburyBrailleTranslator _textForPrintBraille:mode:locations:optimize:]( self,  "_textForPrintBraille:mode:locations:optimize:",  a3,  a4,  a5,  1LL);
}

- (id)_textForPrintBraille:(id)a3 mode:(unint64_t)a4 locations:(id *)a5 optimize:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  backTranslationHandle = self->_backTranslationHandle;
  if (a4 == 4)
  {
    -[DBTDuxburyBrailleTranslator loadNemethTable](self, "loadNemethTable");
    if (self->_technicalBackTranslationHandle) {
      backTranslationHandle = self->_technicalBackTranslationHandle;
    }
    unsigned int v12 = 9;
  }

  else
  {
    unsigned int v12 = 4 * self->_supportsContraction;
  }

  uint64_t v13 = v12;
  unint64_t v14 = -[DBTDuxburyBrailleTranslator _prepBuffersForConversion:withString:mode:prefixLength:]( self,  "_prepBuffersForConversion:withString:mode:prefixLength:",  0LL,  v10,  a4,  v12);
  unint64_t v15 = v14;
  inBuffer = self->_inBuffer;
  if (v14 + v12 > v12)
  {
    uint64_t v17 = v12;
    unint64_t v18 = v14;
    do
    {
      __int32 v19 = UnicodeToASCIIBraille(inBuffer[v17]);
      inBuffer = self->_inBuffer;
      inBuffer[v17++] = v19;
      --v18;
    }

    while (v18);
  }

  if (BRLTRN_TranslateString( backTranslationHandle,  inBuffer,  self->_outBuffer,  LOWORD(self->_outBufferLen),  v13,  &v36))
  {
    id v20 = DBTLog();
    unint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[DBTDuxburyBrailleTranslator _unloadTables].cold.1();
    }
    int v22 = 0LL;
    goto LABEL_27;
  }

  uint64_t v23 = DBTWideCharBufferLength(self->_outBuffer) - v13;
  if (a5)
  {
    -[DBTDuxburyBrailleTranslator _populateTextForPrintBrailleLocations:inLength:outLength:offsetToBraille:prefixLength:optimize:]( self,  "_populateTextForPrintBrailleLocations:inLength:outLength:offsetToBraille:prefixLength:optimize:",  a5,  v15,  v23,  v36,  v13,  v6);
    unint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSMutableData dataWithCapacity:]( NSMutableData,  "dataWithCapacity:",  [*a5 length]));
    if (a4 != 4)
    {
      id v24 = *a5;
      goto LABEL_20;
    }
  }

  else
  {
    unint64_t v21 = 0LL;
    id v24 = 0LL;
    if (a4 != 4)
    {
LABEL_20:
      int v22 = (void *)objc_claimAutoreleasedReturnValue( -[DBTDuxburyBrailleTranslator _scrubDollarCodesInBuffer:originalLength:originalLocations:newLocations:convertASCIIBrailleToUnicode:limitRange:]( self,  "_scrubDollarCodesInBuffer:originalLength:originalLocations:newLocations:convertASCIIBrailleToUni code:limitRange:",  &self->_outBuffer[v13],  v23,  v24,  v21,  0LL,  0x7FFFFFFFFFFFFFFFLL,  0LL));
      if (!a5) {
        goto LABEL_27;
      }
      goto LABEL_26;
    }
  }

  outBuffer = self->_outBuffer;
  uint64_t v26 = DBTWideCharBufferLength(outBuffer);
  id v27 = DBTNSStringFromWideCharBuffer(outBuffer, v26);
  unint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
  unint64_t v29 = objc_alloc_init(&OBJC_CLASS___DBTDuxburyFormatParser);
  id v35 = 0LL;
  int v30 = (void *)objc_claimAutoreleasedReturnValue( -[DBTDuxburyFormatParser LaTeXRepresentationOfString:error:]( v29,  "LaTeXRepresentationOfString:error:",  v28,  &v35));
  id v31 = v35;
  if (v31)
  {
    if (a5) {
      id v32 = *a5;
    }
    else {
      id v32 = 0LL;
    }
    id v33 = (id)objc_claimAutoreleasedReturnValue( -[DBTDuxburyBrailleTranslator _scrubDollarCodesInBuffer:originalLength:originalLocations:newLocations:convertASCIIBrailleToUnicode:limitRange:]( self,  "_scrubDollarCodesInBuffer:originalLength:originalLocations:newLocations:convertASCIIBrailleToUnicode:limitRange:",  &self->_outBuffer[v13],  v23,  v32,  v21,  0LL,  0x7FFFFFFFFFFFFFFFLL,  0LL));
  }

  else
  {
    id v33 = v30;
  }

  int v22 = v33;

  if (a5)
  {
LABEL_26:
    unint64_t v21 = v21;
    *a5 = v21;
  }

- (id)textForPrintBraille:(id)a3 mode:(unint64_t)a4 locations:(id *)a5
{
  id v8 = a3;
  int v9 = _os_feature_enabled_impl("Accessibility", "CustomBraille");
  if (a4 == 4 || !v9)
  {
    if (a4 == 2)
    {
      if (self->_supportsEightDot) {
        goto LABEL_9;
      }
      a4 = 2LL;
    }

- (id)_eightDotPrintBrailleForText:(id)a3 locations:(id *)a4 textFormattingRanges:(id)a5
{
  uint64_t v53 = a4;
  id v7 = a5;
  composedCharacterPreprocessor = self->_composedCharacterPreprocessor;
  id v72 = 0LL;
  id v58 = v7;
  int v9 = (void *)objc_claimAutoreleasedReturnValue( -[DBTComposedCharactersPreprocessor preprocessPrintString:withLocationMap:isEightDot:textFormattingRanges:]( composedCharacterPreprocessor,  "preprocessPrintString:withLocationMap:isEightDot:textFormattingRanges:",  a3,  &v72,  0LL));
  id v10 = v72;
  unint64_t v11 = v9;
  NSUInteger v12 = -[NSArray count](self->_printPreprocessors, "count");
  v55 = v11;
  id v56 = self;
  uint64_t v13 = v10;
  id v54 = v10;
  if (v12)
  {
    __int128 v70 = 0u;
    __int128 v71 = 0u;
    __int128 v68 = 0u;
    __int128 v69 = 0u;
    v57 = self->_printPreprocessors;
    id v14 = -[NSArray countByEnumeratingWithState:objects:count:]( v57,  "countByEnumeratingWithState:objects:count:",  &v68,  v73,  16LL);
    unint64_t v11 = v55;
    uint64_t v13 = v10;
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v69;
      uint64_t v13 = v54;
      unint64_t v11 = v55;
      do
      {
        uint64_t v17 = 0LL;
        unint64_t v18 = v11;
        __int32 v19 = v13;
        do
        {
          if (*(void *)v69 != v16) {
            objc_enumerationMutation(v57);
          }
          id v20 = *(void **)(*((void *)&v68 + 1) + 8LL * (void)v17);
          id v67 = 0LL;
          unint64_t v11 = (__CFString *)objc_claimAutoreleasedReturnValue( [v20 preprocessPrintString:v18 withLocationMap:&v67 isEightDot:1 textFormattingRanges:v58]);
          id v21 = v67;

          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[BRLTPreprocessorHelper mergeLocationMap:withLocationMap:]( &OBJC_CLASS___BRLTPreprocessorHelper,  "mergeLocationMap:withLocationMap:",  v19,  v21));
          uint64_t v17 = (char *)v17 + 1;
          unint64_t v18 = v11;
          __int32 v19 = v13;
        }

        while (v15 != v17);
        id v15 = -[NSArray countByEnumeratingWithState:objects:count:]( v57,  "countByEnumeratingWithState:objects:count:",  &v68,  v73,  16LL);
      }

      while (v15);
    }

    self = v56;
  }

  CFIndex Length = CFStringGetLength(v11);
  v57 = (NSArray *)&v53;
  uint64_t v23 = __chkstk_darwin();
  unsigned __int16 v25 = (char *)&v53 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  unsigned __int16 v60 = v11;
  uint64_t v63 = 0LL;
  int64_t v64 = v23;
  CharactersPtr = CFStringGetCharactersPtr(v11);
  CStringPtr = 0LL;
  id v61 = CharactersPtr;
  if (!CharactersPtr) {
    CStringPtr = CFStringGetCStringPtr(v11, 0x600u);
  }
  int64_t v65 = 0LL;
  int64_t v66 = 0LL;
  __int128 v62 = CStringPtr;
  if (Length >= 1)
  {
    uint64_t v28 = 0LL;
    int64_t v29 = 0LL;
    uint64_t v30 = 64LL;
    do
    {
      else {
        uint64_t v31 = v29;
      }
      int64_t v32 = v64;
      if (v64 <= v29)
      {
        UniChar v33 = 0;
      }

      else if (v61)
      {
        UniChar v33 = v61[v29 + v63];
      }

      else if (v62)
      {
        UniChar v33 = v62[v63 + v29];
      }

      else
      {
        int64_t v37 = v65;
        if (v66 <= v29 || v65 > v29)
        {
          uint64_t v39 = -v31;
          uint64_t v40 = v31 + v28;
          uint64_t v41 = v30 - v31;
          int64_t v42 = v29 + v39;
          int64_t v43 = v42 + 64;
          if (v42 + 64 >= v64) {
            int64_t v43 = v64;
          }
          int64_t v65 = v42;
          int64_t v66 = v43;
          if (v64 >= v41) {
            int64_t v32 = v41;
          }
          v74.NSUInteger length = v32 + v40;
          v74.NSUInteger location = v42 + v63;
          CFStringGetCharacters(v60, v74, v59);
          int64_t v37 = v65;
        }

        UniChar v33 = v59[v29 - v37];
      }

      size_t v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v33));
      id v35 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_eightDotTranslationTable, "objectForKey:", v34));
      if (v35
        || (id v35 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKey:]( self->_eightDotTranslationTable,  "objectForKey:",  @"UndefinedSymbol"))) != 0LL)
      {
        unsigned __int16 v36 = v35;
        *(_WORD *)&v25[2 * v29] = (unsigned __int16)[v35 unsignedIntegerValue];
      }

      else
      {
        *(_WORD *)&v25[2 * v29] = 10240;
      }

      ++v29;
      --v28;
      ++v30;
      self = v56;
    }

    while (Length != v29);
  }

  id v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCharacters:length:]( &OBJC_CLASS___NSString,  "stringWithCharacters:length:",  v25,  Length));
  uint64_t v45 = v53;
  int v46 = v54;
  if (v53)
  {
    char v47 = [v13 bytes];
    if ((uint64_t)[v44 length] >= 1)
    {
      uint64_t v48 = __chkstk_darwin();
      BOOL v50 = 0LL;
      do
      {
        v51 = v50;
        if (v47) {
          v51 = (id *)v47[(void)v50];
        }
        *(id **)((char *)&(&v53)[(void)v50] - ((v49 + 15) & 0xFFFFFFFFFFFFFFF0LL)) = v51;
        BOOL v50 = (id *)((char *)v50 + 1);
      }

      while ((id *)v48 != v50);
      *uint64_t v45 = (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:"));
    }
  }

  return v44;
}

- (id)_eightDotTextForPrintBraille:(id)a3 locations:(id *)a4
{
  BOOL v6 = (__CFString *)a3;
  CFIndex Length = CFStringGetLength(v6);
  uint64_t v8 = __chkstk_darwin();
  id v10 = (char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v39 = v6;
  uint64_t v42 = 0LL;
  int64_t v43 = v8;
  CharactersPtr = CFStringGetCharactersPtr(v6);
  CStringPtr = 0LL;
  uint64_t v40 = CharactersPtr;
  if (!CharactersPtr) {
    CStringPtr = CFStringGetCStringPtr(v6, 0x600u);
  }
  int64_t v44 = 0LL;
  int64_t v45 = 0LL;
  uint64_t v41 = CStringPtr;
  if (Length < 1)
  {
    uint64_t v30 = 0LL;
    if (!a4) {
      goto LABEL_38;
    }
    goto LABEL_34;
  }

  uint64_t v35 = (uint64_t)&v35;
  unsigned __int16 v36 = v6;
  int64_t v37 = a4;
  uint64_t v13 = 0LL;
  uint64_t v14 = 0LL;
  int64_t v15 = 0LL;
  uint64_t v16 = 64LL;
  do
  {
    else {
      uint64_t v17 = v15;
    }
    int64_t v18 = v43;
    if (v43 <= v15)
    {
      UniChar v19 = 0;
    }

    else if (v40)
    {
      UniChar v19 = v40[v15 + v42];
    }

    else if (v41)
    {
      UniChar v19 = v41[v42 + v15];
    }

    else
    {
      int64_t v23 = v44;
      if (v45 <= v15 || v44 > v15)
      {
        uint64_t v25 = -v17;
        uint64_t v26 = v17 + v13;
        uint64_t v27 = v16 - v17;
        int64_t v28 = v15 + v25;
        int64_t v29 = v28 + 64;
        if (v28 + 64 >= v43) {
          int64_t v29 = v43;
        }
        int64_t v44 = v28;
        int64_t v45 = v29;
        if (v43 >= v27) {
          int64_t v18 = v27;
        }
        v46.NSUInteger length = v18 + v26;
        v46.NSUInteger location = v28 + v42;
        CFStringGetCharacters(v39, v46, buffer);
        int64_t v23 = v44;
      }

      UniChar v19 = buffer[v15 - v23];
    }

    id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v19,  v35));
    id v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_eightDotBackTranslationTable, "objectForKey:", v20));
    int v22 = v21;
    if (v21)
    {
      *(_WORD *)&v10[2 * v15] = (unsigned __int16)[v21 unsignedIntegerValue];
      ++v14;
    }

    ++v15;
    --v13;
    ++v16;
  }

  while (Length != v15);
  a4 = v37;
  if (v14 <= 0) {
    uint64_t v30 = 0LL;
  }
  else {
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCharacters:length:]( &OBJC_CLASS___NSString,  "stringWithCharacters:length:",  v10,  v14));
  }
  BOOL v6 = v36;
  if (a4)
  {
LABEL_34:
    if ((uint64_t)[v30 length] >= 1)
    {
      uint64_t v31 = __chkstk_darwin();
      uint64_t v33 = 0LL;
      do
      {
        *(uint64_t *)((char *)&v35 + 8 * v33 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0LL)) = v33;
        ++v33;
      }

      while (v31 != v33);
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:"));
    }
  }

- (void)_eightDotTablesFromRawTable:(id)a3 translationTable:(id *)a4 backTranslationTable:(id *)a5
{
  id v5 = a3;
  id v6 = [objc_allocWithZone(NSMutableDictionary) init];
  id v7 = [objc_allocWithZone(NSMutableDictionary) init];
  id v52 = [objc_allocWithZone(NSMutableArray) init];
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSString);
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSNumber);
  uint64_t v44 = objc_opt_class(&OBJC_CLASS___NSArray);
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  id v10 = v5;
  id v11 = [v10 countByEnumeratingWithState:&v61 objects:v67 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v51 = *(void *)v62;
    id v46 = v10;
    char v47 = v6;
    uint64_t v45 = v8;
    do
    {
      uint64_t v13 = 0LL;
      id v48 = v12;
      do
      {
        if (*(void *)v62 != v51) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = *(void **)(*((void *)&v61 + 1) + 8LL * (void)v13);
        if ((objc_opt_isKindOfClass(v14, v8) & 1) == 0)
        {
          NSLog(@"Invalid key: %@", v14);
          goto LABEL_58;
        }

        [v52 removeAllObjects];
        int64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:v14]);
        BOOL v50 = v13;
        if ((objc_opt_isKindOfClass(v15, v9) & 1) != 0)
        {
        }

        else if ((objc_opt_isKindOfClass(v15, v44) & 1) != 0)
        {
          __int128 v59 = 0u;
          __int128 v60 = 0u;
          __int128 v57 = 0u;
          __int128 v58 = 0u;
          uint64_t v16 = v15;
          id v17 = v15;
          id v18 = [v17 countByEnumeratingWithState:&v57 objects:v66 count:16];
          if (v18)
          {
            id v19 = v18;
            uint64_t v20 = *(void *)v58;
            do
            {
              for (i = 0LL; i != v19; i = (char *)i + 1)
              {
                if (*(void *)v58 != v20) {
                  objc_enumerationMutation(v17);
                }
                int v22 = *(void **)(*((void *)&v57 + 1) + 8LL * (void)i);
                if ((objc_opt_isKindOfClass(v22, v9) & 1) != 0)
                {
                }

                else
                {
                  NSLog(@"Invalid sub-value: %@", v14);
                }
              }

              id v19 = [v17 countByEnumeratingWithState:&v57 objects:v66 count:16];
            }

            while (v19);
          }

          uint64_t v8 = v45;
          id v10 = v46;
          id v12 = v48;
          int64_t v15 = v16;
          id v6 = v47;
        }

        else
        {
          NSLog(@"Invalid value: %@", v14);
        }

        uint64_t v49 = v15;
        if ([v14 isEqualToString:@"UndefinedSymbol"])
        {
          int64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v14]);

          if (v23) {
            NSLog(@"Duplicate undefined translation symbol: %@", v14);
          }
          uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v52 objectAtIndex:0]);
          unint64_t v25 = (unint64_t)[v24 integerValue];
          if ((uint64_t)v25 < 1)
          {
            uint64_t v26 = 0LL;
          }

          else
          {
            uint64_t v26 = 0LL;
            do
            {
              unint64_t v27 = ~(10 * (v25 / 0xA)) + v25;
              if (v27 <= 7) {
                v26 |= _DotValue[2 * v27];
              }
              BOOL v28 = v25 > 9;
              v25 /= 0xAuLL;
            }

            while (v28);
          }

          uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v26 + 10240));
          [v7 setObject:v32 forKey:v14];
        }

        else
        {
          unint64_t v29 = (unint64_t)[v14 integerValue];
          if ((uint64_t)v29 < 1)
          {
            uint64_t v30 = 0LL;
          }

          else
          {
            uint64_t v30 = 0LL;
            do
            {
              unint64_t v31 = ~(10 * (v29 / 0xA)) + v29;
              if (v31 <= 7) {
                v30 |= _DotValue[2 * v31];
              }
              BOOL v28 = v29 > 9;
              v29 /= 0xAuLL;
            }

            while (v28);
          }

          uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v30 + 10240));
          __int128 v53 = 0u;
          __int128 v54 = 0u;
          __int128 v55 = 0u;
          __int128 v56 = 0u;
          id v33 = v52;
          id v34 = [v33 countByEnumeratingWithState:&v53 objects:v65 count:16];
          if (v34)
          {
            id v35 = v34;
            uint64_t v36 = *(void *)v54;
            do
            {
              for (j = 0LL; j != v35; j = (char *)j + 1)
              {
                if (*(void *)v54 != v36) {
                  objc_enumerationMutation(v33);
                }
                uint64_t v38 = *(void *)(*((void *)&v53 + 1) + 8LL * (void)j);
                uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v38]);

                if (v39) {
                  NSLog(@"Duplicate translation value for key: %@", v38);
                }
                [v7 setObject:v24 forKey:v38];
              }

              id v35 = [v33 countByEnumeratingWithState:&v53 objects:v65 count:16];
            }

            while (v35);
          }

          [v7 setObject:v24 forKey:v24];
          if (![v33 count])
          {
            id v10 = v46;
            id v6 = v47;
            uint64_t v8 = v45;
            id v12 = v48;
            goto LABEL_57;
          }

          id v6 = v47;
          uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue([v47 objectForKey:v24]);

          uint64_t v8 = v45;
          id v12 = v48;
          if (v40) {
            NSLog(@"Duplicate back translation value for key: %@", v24);
          }
          uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v33 objectAtIndex:0]);
          [v47 setObject:v32 forKey:v24];
          id v10 = v46;
        }

LABEL_57:
        uint64_t v13 = v50;

LABEL_58:
        uint64_t v13 = (char *)v13 + 1;
      }

      while (v13 != v12);
      id v41 = [v10 countByEnumeratingWithState:&v61 objects:v67 count:16];
      id v12 = v41;
    }

    while (v41);
  }

  if (a4) {
    objc_storeStrong(a4, v7);
  }
  if (a5) {
    objc_storeStrong(a5, v6);
  }
}

- (void).cxx_destruct
{
}

- (void)setActiveTable:(uint64_t)a3 .cold.1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)_loadTable:(uint64_t)a3 translationHandle:(uint64_t)a4 backTranslationHandle:(uint64_t)a5 .cold.1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

@end