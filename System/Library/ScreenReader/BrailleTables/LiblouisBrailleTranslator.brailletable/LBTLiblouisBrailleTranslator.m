@interface LBTLiblouisBrailleTranslator
+ (void)initialize;
- (BOOL)activeTableSupportsContractedBraille;
- (BOOL)activeTableSupportsEightDotBraille;
- (BOOL)activeTableSupportsIPA;
- (BOOL)activeTableSupportsModeWithKey:(id)a3;
- (BOOL)activeTableSupportsTechnicalBraille;
- (LBTLiblouisBrailleTranslator)init;
- (LiblouisEmojiPrintPreprocessor)emojiPreprocessor;
- (LiblouisTextFormattingProcessor)textFormattingPreprocessor;
- (NSDictionary)activeTableMap;
- (NSDictionary)languageMap;
- (NSString)activeTable;
- (id)_printBrailleForText:(id)a3 table:(id)a4 locations:(id *)a5 textPositionsRange:(_NSRange)a6 textFormattingRanges:(id)a7;
- (id)printBrailleForTechnicalText:(id)a3 useTechnicalTable:(BOOL)a4 locations:(id *)a5 textFormattingRanges:(id)a6;
- (id)printBrailleForText:(id)a3 mode:(unint64_t)a4 locations:(id *)a5 textFormattingRanges:(id)a6;
- (id)printBrailleForText:(id)a3 mode:(unint64_t)a4 locations:(id *)a5 textPositionsRange:(_NSRange)a6 textFormattingRanges:(id)a7;
- (id)tableForActiveTableMode:(unint64_t)a3;
- (id)tableListForTable:(id)a3;
- (id)technicalTableForActiveLanguage:(BOOL)a3;
- (id)textForPrintBraille:(id)a3 mode:(unint64_t)a4 locations:(id *)a5;
- (unint64_t)interfaceVersion;
- (void)dealloc;
- (void)setActiveTable:(id)a3;
- (void)setEmojiPreprocessor:(id)a3;
- (void)setLanguageMap:(id)a3;
- (void)setTextFormattingPreprocessor:(id)a3;
@end

@implementation LBTLiblouisBrailleTranslator

+ (void)initialize
{
  v2 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(a1, a2));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 resourcePath]);

  id v5 = v4;
  lou_setDataPath((const char *)[v5 UTF8String]);
  lou_registerLogCallback((const char *(*)(uint64_t, const char *))sub_3D58);
}

- (LBTLiblouisBrailleTranslator)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___LBTLiblouisBrailleTranslator;
  v2 = -[LBTLiblouisBrailleTranslator init](&v6, "init");
  v3 = objc_opt_new(&OBJC_CLASS___LiblouisEmojiPrintPreprocessor);
  -[LBTLiblouisBrailleTranslator setEmojiPreprocessor:](v2, "setEmojiPreprocessor:", v3);

  v4 = objc_opt_new(&OBJC_CLASS___LiblouisTextFormattingProcessor);
  -[LBTLiblouisBrailleTranslator setTextFormattingPreprocessor:](v2, "setTextFormattingPreprocessor:", v4);

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___LBTLiblouisBrailleTranslator;
  -[LBTLiblouisBrailleTranslator dealloc](&v3, "dealloc");
}

- (NSDictionary)languageMap
{
  languageMap = self->_languageMap;
  if (!languageMap)
  {
    v4 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self, a2));
    id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 pathForResource:@"Tables" ofType:@"plist"]);
    v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  v6));
    v8 = self->_languageMap;
    self->_languageMap = v7;

    languageMap = self->_languageMap;
  }

  return languageMap;
}

- (NSDictionary)activeTableMap
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[LBTLiblouisBrailleTranslator languageMap](self, "languageMap"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LBTLiblouisBrailleTranslator activeTable](self, "activeTable"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:v4]);

  return (NSDictionary *)v5;
}

- (BOOL)activeTableSupportsModeWithKey:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[LBTLiblouisBrailleTranslator activeTableMap](self, "activeTableMap"));
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v4]);

  return v6 != 0LL;
}

- (id)tableListForTable:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[LBTLiblouisBrailleTranslator languageMap](self, "languageMap"));
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v4]);

  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allValues]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 componentsJoinedByString:@","]);

  return v8;
}

- (id)tableForActiveTableMode:(unint64_t)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[LBTLiblouisBrailleTranslator activeTableMap](self, "activeTableMap"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"table"]);
  if (!v5)
  {
    objc_super v6 = @"6Dot";
    if (a3 == 2) {
      objc_super v6 = @"8Dot";
    }
    if (a3 == 3) {
      v7 = @"Contracted";
    }
    else {
      v7 = v6;
    }
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v7]);
    if (!v5)
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"Contracted"]);
      if (!v5)
      {
        id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"8Dot"]);
        if (!v5) {
          id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"6Dot"]);
        }
      }
    }
  }

  id v8 = v5;

  return v8;
}

- (id)technicalTableForActiveLanguage:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[LBTLiblouisBrailleTranslator activeTableMap](self, "activeTableMap"));
  objc_super v6 = v5;
  if (!v3
    || (v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"Technical"])) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[LBTLiblouisBrailleTranslator tableForActiveTableMode:](self, "tableForActiveTableMode:", 1LL));
  }

  return v7;
}

- (unint64_t)interfaceVersion
{
  return 7LL;
}

- (void)setActiveTable:(id)a3
{
  id v4 = a3;
  id v5 = LBTLog();
  objc_super v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_1B8CC();
  }

  if (!-[NSString isEqualToString:](self->_activeTable, "isEqualToString:", v4))
  {
    lou_free();
    v7 = (NSString *)[v4 copy];
    activeTable = self->_activeTable;
    self->_activeTable = v7;

    v10 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self, v9));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForInfoDictionaryKey:@"BrailleTables"]);
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:v4]);
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:@"supportsContraction"]);
    self->_supportsContraction = [v14 BOOLValue];

    v15 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:@"supportsTechnical"]);
    self->_supportsTechnical = [v15 BOOLValue];

    v16 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:@"supports8dot"]);
    self->_supportsEightDot = [v16 BOOLValue];

    v17 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:@"supportsIPA"]);
    self->_supportsIPA = [v17 BOOLValue];
  }
}

- (BOOL)activeTableSupportsContractedBraille
{
  else {
    return -[LBTLiblouisBrailleTranslator activeTableSupportsModeWithKey:]( self,  "activeTableSupportsModeWithKey:",  @"Contracted");
  }
}

- (BOOL)activeTableSupportsEightDotBraille
{
  else {
    return -[LBTLiblouisBrailleTranslator activeTableSupportsModeWithKey:]( self,  "activeTableSupportsModeWithKey:",  @"8Dot");
  }
}

- (BOOL)activeTableSupportsTechnicalBraille
{
  else {
    return -[LBTLiblouisBrailleTranslator activeTableSupportsModeWithKey:]( self,  "activeTableSupportsModeWithKey:",  @"Technical");
  }
}

- (id)printBrailleForTechnicalText:(id)a3 useTechnicalTable:(BOOL)a4 locations:(id *)a5 textFormattingRanges:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue( -[LBTLiblouisBrailleTranslator technicalTableForActiveLanguage:]( self,  "technicalTableForActiveLanguage:",  v8));
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue( -[LBTLiblouisBrailleTranslator _printBrailleForText:table:locations:textPositionsRange:textFormattingRanges:]( self,  "_printBrailleForText:table:locations:textPositionsRange:textFormattingRanges:",  v10,  v12,  a5,  0,  [v10 length],  v11));
  }

  else
  {
    id v14 = LBTLog();
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1B92C(self, v15);
    }

    v13 = 0LL;
  }

  return v13;
}

- (id)printBrailleForText:(id)a3 mode:(unint64_t)a4 locations:(id *)a5 textFormattingRanges:(id)a6
{
  id v10 = a6;
  id v11 = a3;
  v12 = (void *)objc_claimAutoreleasedReturnValue( -[LBTLiblouisBrailleTranslator printBrailleForText:mode:locations:textPositionsRange:textFormattingRanges:]( self,  "printBrailleForText:mode:locations:textPositionsRange:textFormattingRanges:",  v11,  a4,  a5,  0,  [v11 length],  v10));

  return v12;
}

- (id)printBrailleForText:(id)a3 mode:(unint64_t)a4 locations:(id *)a5 textPositionsRange:(_NSRange)a6 textFormattingRanges:(id)a7
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  id v13 = a3;
  id v14 = a7;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[LBTLiblouisBrailleTranslator tableForActiveTableMode:](self, "tableForActiveTableMode:", a4));
  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue( -[LBTLiblouisBrailleTranslator _printBrailleForText:table:locations:textPositionsRange:textFormattingRanges:]( self,  "_printBrailleForText:table:locations:textPositionsRange:textFormattingRanges:",  v13,  v15,  a5,  location,  length,  v14));
  }

  else
  {
    id v17 = LBTLog();
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_1B9AC(self, v18);
    }

    v16 = 0LL;
  }

  return v16;
}

- (id)_printBrailleForText:(id)a3 table:(id)a4 locations:(id *)a5 textPositionsRange:(_NSRange)a6 textFormattingRanges:(id)a7
{
  v66 = a5;
  id v10 = a3;
  id v67 = a4;
  id v11 = a7;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[LBTLiblouisBrailleTranslator textFormattingPreprocessor](self, "textFormattingPreprocessor"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 processText:v10 withFormattingRanges:v11]);

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[LBTLiblouisBrailleTranslator emojiPreprocessor](self, "emojiPreprocessor"));
  id v70 = 0LL;
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 preprocessPrintString:v10 withLocationMap:&v70 typeformData:v13]);
  id v16 = v70;

  id v17 = objc_claimAutoreleasedReturnValue([v15 dataUsingEncoding:2483028224]);
  v18 = (unsigned __int16 *)[v17 bytes];
  unsigned int v19 = objc_msgSend(v15, "rangeOfComposedCharacterSequencesForRange:", 0, objc_msgSend(v15, "length"));
  int v69 = v19 + v20;
  else {
    unsigned int v21 = 3 * (v19 + v20);
  }
  unsigned int v68 = v21;
  v22 = malloc(2 * v21);
  if (!v22)
  {
    id v37 = LBTLog();
    v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      sub_1BA2C(v38, v39, v40, v41, v42, v43, v44, v45);
    }

    goto LABEL_18;
  }

  v23 = v22;
  if (v13)
  {
    unint64_t v24 = (unint64_t)[v13 length];
    if ([v15 length] != (id)(v24 >> 1))
    {
      id v25 = LBTLog();
      v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        sub_1BB08();
      }

      id v13 = 0LL;
    }
  }

  if (v66)
  {
    v27 = malloc(4LL * v21);
    if (!v27)
    {
      id v28 = LBTLog();
      v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        sub_1BAD8(v29, v30, v31, v32, v33, v34, v35, v36);
      }

      free(v23);
LABEL_18:
      v46 = 0LL;
      goto LABEL_47;
    }
  }

  else
  {
    v27 = 0LL;
  }

  uint64_t v65 = (uint64_t)&v65;
  uint64_t v47 = __chkstk_darwin([v13 length]);
  v49 = (__int16 *)((char *)&v65 - v48);
  if (v47) {
    objc_msgSend(v13, "getBytes:length:", (char *)&v65 - v48);
  }
  else {
    v49 = 0LL;
  }
  if (lou_translate( (char *)[v67 UTF8String], v18, &v69, (unsigned __int16 *)v23, (int *)&v68, v49, 0, v27, 0, 0, 68) == 1)
  {
    if (v66)
    {
      size_t v50 = 8LL * (int)v68;
      v51 = malloc(v50);
      if (v51)
      {
        v52 = v51;
        v53 = [v16 bytes];
        uint64_t v54 = (v69 - 1);
        if (v69 >= 1)
        {
          unint64_t v55 = (int)v68;
          while (v54)
          {
            LODWORD(v56) = v27[v54];
            uint64_t v57 = v54 - 1;
            if ((_DWORD)v56 != v27[v54 - 1]) {
              goto LABEL_32;
            }
LABEL_36:
            BOOL v60 = v54 <= 0;
            uint64_t v54 = v57;
            if (v60) {
              goto LABEL_38;
            }
          }

          LODWORD(v56) = *v27;
LABEL_32:
          unint64_t v58 = (int)v56;
          if (v55 > (int)v56)
          {
            uint64_t v59 = v53[v54];
            unint64_t v56 = (int)v56;
            do
              v52[v56++] = v59;
            while (v55 > v56);
          }

          uint64_t v57 = v54 - 1;
          unint64_t v55 = v58;
          goto LABEL_36;
        }

- (id)textForPrintBraille:(id)a3 mode:(unint64_t)a4 locations:(id *)a5
{
  id v8 = a3;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[LBTLiblouisBrailleTranslator tableForActiveTableMode:](self, "tableForActiveTableMode:", a4));
  id v10 = objc_claimAutoreleasedReturnValue([v8 dataUsingEncoding:2483028224]);
  id v11 = (unsigned __int16 *)[v10 bytes];
  unsigned int v12 = objc_msgSend(v8, "rangeOfComposedCharacterSequencesForRange:", 0, objc_msgSend(v8, "length"));
  int v41 = v12 + v13;
  int v14 = 4 * (v12 + v13) + 64;
  int v40 = v14;
  v15 = malloc(2LL * v14);
  if (a5)
  {
    id v16 = (char *)malloc(v14);
    if (!v16)
    {
      id v17 = LBTLog();
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_1BAD8(v18, v19, v20, v21, v22, v23, v24, v25);
      }
LABEL_26:

      free(v15);
      uint64_t v35 = 0LL;
      goto LABEL_27;
    }
  }

  else
  {
    id v16 = 0LL;
  }

  if (lou_backTranslate( (char *)[v9 UTF8String], v11, &v41, v15, &v40, 0, 0, v16, 0, 0, 0x80u) != 1)
  {
    id v38 = LBTLog();
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_1BBE8();
    }
    goto LABEL_26;
  }

  int v26 = v40;
  if (v16)
  {
    unint64_t v27 = v40;
    id v28 = malloc(8LL * v40);
    if (v28)
    {
      v29 = v28;
      uint64_t v30 = (v41 - 1);
      if (v41 >= 1)
      {
        while (v30)
        {
          int v31 = *(_DWORD *)&v16[4 * v30];
          uint64_t v32 = v30 - 1;
          if (v31 != *(_DWORD *)&v16[4 * v30 - 4]) {
            goto LABEL_14;
          }
LABEL_17:
          BOOL v34 = v30 <= 0;
          uint64_t v30 = v32;
          if (v34) {
            goto LABEL_19;
          }
        }

        int v31 = *(_DWORD *)v16;
LABEL_14:
        for (unint64_t i = v31; v27 > i; ++i)
          *((void *)v28 + i) = v30;
        uint64_t v32 = v30 - 1;
        unint64_t v27 = v31;
        goto LABEL_17;
      }

- (BOOL)activeTableSupportsIPA
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[LBTLiblouisBrailleTranslator activeTable](self, "activeTable"));
  unsigned __int8 v5 = [v4 isEqualToString:@"ipa"];

  return v5;
}

- (NSString)activeTable
{
  return self->_activeTable;
}

- (void)setLanguageMap:(id)a3
{
}

- (LiblouisEmojiPrintPreprocessor)emojiPreprocessor
{
  return self->_emojiPreprocessor;
}

- (void)setEmojiPreprocessor:(id)a3
{
}

- (LiblouisTextFormattingProcessor)textFormattingPreprocessor
{
  return self->_textFormattingPreprocessor;
}

- (void)setTextFormattingPreprocessor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end