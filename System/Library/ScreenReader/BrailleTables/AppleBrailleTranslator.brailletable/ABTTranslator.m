@interface ABTTranslator
- (ABTTranslator)init;
- (BOOL)activeTableSupportsContractedBraille;
- (BOOL)activeTableSupportsEightDotBraille;
- (BOOL)activeTableSupportsIPA;
- (BOOL)activeTableSupportsTechnicalBraille;
- (id)_applyNumeralReadings:(id)a3 locations:(id *)a4;
- (id)_brailleForProcessedText:(id)a3 locations:(id *)a4;
- (id)_compositionOf:(id)a3 then:(id)a4;
- (id)_identityMapOfSize:(int64_t)a3;
- (id)_longVowelExpressedFor:(id)a3 partOfSpeech:(int64_t)a4;
- (id)_normalize:(id)a3;
- (id)_printBrailleForText:(id)a3 locations:(id *)a4;
- (id)_processKanjiNumbers:(id)a3 locations:(id *)a4;
- (id)_replaceWords:(id)a3 locations:(id *)a4;
- (id)_textForPrintBraille:(id)a3;
- (id)_yomiWithSpacingOf:(id)a3 locations:(id *)a4;
- (id)_zeroMapOfSize:(int64_t)a3;
- (id)activeTable;
- (id)applyNumeralReadings:(id)a3 locations:(id *)a4;
- (id)printBrailleForText:(id)a3 mode:(unint64_t)a4 locations:(id *)a5 textPositionsRange:(_NSRange)a6 textFormattingRanges:(id)a7;
- (id)processKanjiNumbers:(id)a3 locations:(id *)a4;
- (id)replaceWords:(id)a3 locations:(id *)a4;
- (id)textForPrintBraille:(id)a3;
- (id)textForPrintBraille:(id)a3 mode:(unint64_t)a4 locations:(id *)a5;
- (unint64_t)interfaceVersion;
@end

@implementation ABTTranslator

- (ABTTranslator)init
{
  v72.receiver = self;
  v72.super_class = (Class)&OBJC_CLASS___ABTTranslator;
  v2 = -[ABTTranslator init](&v72, "init");
  if (v2)
  {
    v3 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___ABTTranslator));
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 pathForResource:@"JapaneseNormalization" ofType:@"plist"]);

    v71 = (void *)v5;
    uint64_t v6 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  v5));
    normalizer = v2->_normalizer;
    v2->_normalizer = (NSDictionary *)v6;

    if (!v2->_normalizer)
    {
      id v8 = sub_6054();
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_6294();
      }
    }

    rules = v2->_rules;
    v2->_rules = (NSDictionary *)&off_B8E0;

    v11 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___ABTTranslator));
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    uint64_t v13 = objc_claimAutoreleasedReturnValue([v12 pathForResource:@"JapaneseNumeralReadings" ofType:@"plist"]);

    v70 = (void *)v13;
    uint64_t v14 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  v13));
    numeralInfo = v2->_numeralInfo;
    v2->_numeralInfo = (NSDictionary *)v14;

    if (!v2->_numeralInfo)
    {
      id v16 = sub_6054();
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_6268();
      }
    }

    v18 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___ABTTranslator));
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    uint64_t v20 = objc_claimAutoreleasedReturnValue([v19 pathForResource:@"kataToHira" ofType:@"plist"]);

    v69 = (void *)v20;
    uint64_t v21 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  v20));
    kataToHira = v2->_kataToHira;
    v2->_kataToHira = (NSDictionary *)v21;

    if (!v2->_kataToHira)
    {
      id v23 = sub_6054();
      v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_623C();
      }
    }

    v25 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___ABTTranslator));
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue([v26 pathForResource:@"kanaToBraille" ofType:@"plist"]);

    uint64_t v28 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  v27));
    kanaToBraille = v2->_kanaToBraille;
    v2->_kanaToBraille = (NSDictionary *)v28;

    if (!v2->_kanaToBraille)
    {
      id v30 = sub_6054();
      v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        sub_6210();
      }
    }

    v32 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___ABTTranslator));
    v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
    v34 = (void *)objc_claimAutoreleasedReturnValue([v33 pathForResource:@"numberToBraille" ofType:@"plist"]);

    uint64_t v35 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  v34));
    numberToBraille = v2->_numberToBraille;
    v2->_numberToBraille = (NSDictionary *)v35;

    if (!v2->_numberToBraille)
    {
      id v37 = sub_6054();
      v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
        sub_61E4();
      }
    }

    v39 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___ABTTranslator));
    v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
    v41 = (void *)objc_claimAutoreleasedReturnValue([v40 pathForResource:@"romajiToBraille" ofType:@"plist"]);

    uint64_t v42 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  v41));
    romajiToBraille = v2->_romajiToBraille;
    v2->_romajiToBraille = (NSDictionary *)v42;

    if (!v2->_romajiToBraille)
    {
      id v44 = sub_6054();
      v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
        sub_61B8();
      }
    }

    unknownPlaceholder = v2->_unknownPlaceholder;
    v2->_unknownPlaceholder = (NSString *)@"⠢";

    v47 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___ABTTranslator));
    v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
    v49 = (void *)objc_claimAutoreleasedReturnValue([v48 pathForResource:@"BrailleToKana" ofType:@"plist"]);

    uint64_t v50 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  v49));
    brailleToKana = v2->_brailleToKana;
    v2->_brailleToKana = (NSDictionary *)v50;

    if (!v2->_brailleToKana)
    {
      id v52 = sub_6054();
      v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
        sub_618C();
      }
    }

    v54 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___ABTTranslator));
    v55 = (void *)objc_claimAutoreleasedReturnValue(v54);
    v56 = (void *)objc_claimAutoreleasedReturnValue([v55 pathForResource:@"BrailleToNumber" ofType:@"plist"]);

    uint64_t v57 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  v56));
    brailleToNumber = v2->_brailleToNumber;
    v2->_brailleToNumber = (NSDictionary *)v57;

    if (!v2->_brailleToNumber)
    {
      id v59 = sub_6054();
      v60 = (os_log_s *)objc_claimAutoreleasedReturnValue(v59);
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
        sub_6160();
      }
    }

    v61 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___ABTTranslator));
    v62 = (void *)objc_claimAutoreleasedReturnValue(v61);
    v63 = (void *)objc_claimAutoreleasedReturnValue([v62 pathForResource:@"BrailleToRomaji" ofType:@"plist"]);

    uint64_t v64 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  v63));
    brailleToRomaji = v2->_brailleToRomaji;
    v2->_brailleToRomaji = (NSDictionary *)v64;

    if (!v2->_brailleToRomaji)
    {
      id v66 = sub_6054();
      v67 = (os_log_s *)objc_claimAutoreleasedReturnValue(v66);
      if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR)) {
        sub_6134();
      }
    }
  }

  return v2;
}

- (id)activeTable
{
  return @"ja";
}

- (BOOL)activeTableSupportsContractedBraille
{
  return 0;
}

- (BOOL)activeTableSupportsEightDotBraille
{
  return 0;
}

- (BOOL)activeTableSupportsIPA
{
  return 0;
}

- (BOOL)activeTableSupportsTechnicalBraille
{
  return 0;
}

- (unint64_t)interfaceVersion
{
  return 7LL;
}

- (id)printBrailleForText:(id)a3 mode:(unint64_t)a4 locations:(id *)a5 textPositionsRange:(_NSRange)a6 textFormattingRanges:(id)a7
{
  id v7 = a3;
  id v8 = -[NSMutableData initWithCapacity:]( [NSMutableData alloc],  "initWithCapacity:",  8 * (void)[v7 length]);
  if ([v7 length])
  {
    unint64_t v9 = 0LL;
    do
    {
      unint64_t v42 = v9;
      -[NSMutableData appendBytes:length:](v8, "appendBytes:length:", &v42, 8LL);
      ++v9;
    }

    while (v9 < (unint64_t)[v7 length]);
  }

  id v10 = [[BRLTEmojiPrintPreprocessor alloc] initWithPrimaryLanguageCode:@"ja-JP"];
  v31 = (void *)objc_opt_new(&OBJC_CLASS___BRLTUnicodePrintPreprocessor);
  v32 = v10;
  v11 = -[NSArray initWithObjects:](objc_alloc(&OBJC_CLASS___NSArray), "initWithObjects:", v10, v31, 0LL);
  v12 = v8;
  id v13 = v7;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  uint64_t v14 = v11;
  id v15 = -[NSArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v38,  v43,  16LL);
  v34 = v13;
  uint64_t v35 = v12;
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v39;
    do
    {
      v18 = 0LL;
      v19 = v13;
      uint64_t v20 = v12;
      do
      {
        if (*(void *)v39 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v21 = *(void **)(*((void *)&v38 + 1) + 8LL * (void)v18);
        id v37 = 0LL;
        id v13 = (id)objc_claimAutoreleasedReturnValue( [v21 preprocessPrintString:v19 withLocationMap:&v37 isEightDot:1 textFormattingRanges:0]);
        id v22 = v37;

        v12 = (NSMutableData *)objc_claimAutoreleasedReturnValue( +[BRLTPreprocessorHelper mergeLocationMap:withLocationMap:]( &OBJC_CLASS___BRLTPreprocessorHelper,  "mergeLocationMap:withLocationMap:",  v20,  v22));
        v18 = (char *)v18 + 1;
        v19 = v13;
        uint64_t v20 = v12;
      }

      while (v16 != v18);
      id v16 = -[NSArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v38,  v43,  16LL);
    }

    while (v16);
  }

  id v36 = 0LL;
  id v23 = (void *)objc_claimAutoreleasedReturnValue(-[ABTTranslator _printBrailleForText:locations:](self, "_printBrailleForText:locations:", v13, &v36));
  id v24 = v36;
  if (a5)
  {
    v25 = malloc(8 * (void)[v23 length]);
    if ([v23 length])
    {
      unint64_t v26 = 0LL;
      do
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue([v24 objectAtIndex:v26]);
        v25[v26] = [v27 integerValue];

        ++v26;
      }

      while (v26 < (unint64_t)[v23 length]);
    }

    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( NSData,  "dataWithBytes:length:",  v25,  8 * (void)[v23 length]));
    *a5 = (id)objc_claimAutoreleasedReturnValue( +[BRLTPreprocessorHelper mergeLocationMap:withLocationMap:]( &OBJC_CLASS___BRLTPreprocessorHelper,  "mergeLocationMap:withLocationMap:",  v12,  v28));
    if (v25) {
      free(v25);
    }
  }

  return v23;
}

- (id)textForPrintBraille:(id)a3 mode:(unint64_t)a4 locations:(id *)a5
{
  return -[ABTTranslator _textForPrintBraille:](self, "_textForPrintBraille:", a3, a4, a5);
}

- (id)_printBrailleForText:(id)a3 locations:(id *)a4
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[ABTTranslator _normalize:](self, "_normalize:", a3));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ABTTranslator _identityMapOfSize:](self, "_identityMapOfSize:", [v6 length]));
  if ([v6 length])
  {
    uint64_t v8 = 0LL;
    unint64_t v9 = 0LL;
    do
    {
      uint64_t v10 = 1LL;
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "substringWithRange:", v9, 1));
      if (([v11 isEqual:@" "] & 1) == 0)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_kanaToBraille, "objectForKey:", v11));

        uint64_t v10 = v8;
        if (!v12)
        {

          goto LABEL_9;
        }
      }

      ++v9;
      uint64_t v8 = v10;
    }

    while (v9 < (unint64_t)[v6 length]);
    id v13 = v6;
    if ((v10 & 1) == 0) {
      goto LABEL_10;
    }
    uint64_t v14 = v13;
    id v15 = 0LL;
  }

  else
  {
LABEL_9:
    id v16 = v6;
LABEL_10:
    id v34 = 0LL;
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[ABTTranslator _replaceWords:locations:](self, "_replaceWords:locations:", v6, &v34));
    id v18 = v34;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[ABTTranslator _compositionOf:then:](self, "_compositionOf:then:", v18, v7));

    id v33 = v18;
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[ABTTranslator _processKanjiNumbers:locations:](self, "_processKanjiNumbers:locations:", v17, &v33));
    id v21 = v33;

    id v22 = (void *)objc_claimAutoreleasedReturnValue(-[ABTTranslator _compositionOf:then:](self, "_compositionOf:then:", v21, v19));
    id v32 = v21;
    id v23 = (void *)objc_claimAutoreleasedReturnValue( -[ABTTranslator _applyNumeralReadings:locations:]( self,  "_applyNumeralReadings:locations:",  v20,  &v32));
    id v24 = v32;

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[ABTTranslator _compositionOf:then:](self, "_compositionOf:then:", v24, v22));
    id v31 = v24;
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[ABTTranslator _yomiWithSpacingOf:locations:](self, "_yomiWithSpacingOf:locations:", v23, &v31));
    id v15 = v31;

    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ABTTranslator _compositionOf:then:](self, "_compositionOf:then:", v15, v25));
  }

  id v30 = v15;
  unint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( -[ABTTranslator _brailleForProcessedText:locations:]( self,  "_brailleForProcessedText:locations:",  v14,  &v30));
  id v27 = v30;

  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(-[ABTTranslator _compositionOf:then:](self, "_compositionOf:then:", v27, v7));
  if (a4) {
    *a4 = v28;
  }

  return v26;
}

- (id)_identityMapOfSize:(int64_t)a3
{
  v4 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", a3);
  if (a3 >= 1)
  {
    uint64_t v5 = 0LL;
    do
    {
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v5));
      -[NSMutableArray addObject:](v4, "addObject:", v6);

      ++v5;
    }

    while (a3 != v5);
  }

  return v4;
}

- (id)_zeroMapOfSize:(int64_t)a3
{
  int64_t v3 = a3;
  v4 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", a3);
  if (v3 >= 1)
  {
    do
    {
      -[NSMutableArray addObject:](v4, "addObject:", &off_9E88);
      --v3;
    }

    while (v3);
  }

  return v4;
}

- (id)_compositionOf:(id)a3 then:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 count] && !objc_msgSend(v6, "count"))
  {
    id v7 = 0LL;
  }

  else
  {
    id v7 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v5 count]);
    if ([v5 count])
    {
      unint64_t v8 = 0LL;
      do
      {
        unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndex:v8]);
        unint64_t v10 = (unint64_t)[v9 integerValue];

        if ((v10 & 0x8000000000000000LL) != 0)
        {
          unint64_t v10 = 0LL;
        }

        else if (v10 >= (unint64_t)[v6 count])
        {
          unint64_t v10 = (unint64_t)[v6 count] - 1;
        }

        v11 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndex:v10]);
        -[NSMutableArray addObject:](v7, "addObject:", v11);

        ++v8;
      }

      while (v8 < (unint64_t)[v5 count]);
    }
  }

  return v7;
}

- (id)_normalize:(id)a3
{
  id v4 = a3;
  id v5 = -[NSMutableString initWithCapacity:]( [NSMutableString alloc],  "initWithCapacity:",  [v4 length]);
  if ([v4 length])
  {
    unint64_t v6 = 0LL;
    do
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "substringWithRange:", v6, 1));
      unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_normalizer, "objectForKey:", v7));
      if (v8) {
        unint64_t v9 = v8;
      }
      else {
        unint64_t v9 = v7;
      }
      -[NSMutableString appendString:](v5, "appendString:", v9);

      ++v6;
    }

    while (v6 < (unint64_t)[v4 length]);
  }

  return v5;
}

- (id)_replaceWords:(id)a3 locations:(id *)a4
{
  id v5 = a3;
  unint64_t v6 = -[NSAttributedString initWithString:](objc_alloc(&OBJC_CLASS___NSAttributedString), "initWithString:", v5);
  id v31 = v5;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ABTTranslator _identityMapOfSize:](self, "_identityMapOfSize:", [v5 length]));
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[NSDictionary allKeys](self->_rules, "allKeys"));
  id v36 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
  if (v36)
  {
    uint64_t v8 = 1LL;
    uint64_t v34 = *(void *)v44;
    uint64_t v35 = self;
    do
    {
      uint64_t v9 = 0LL;
      unint64_t v10 = v7;
      v11 = v6;
      do
      {
        __int128 v38 = v10;
        if (*(void *)v44 != v34) {
          objc_enumerationMutation(obj);
        }
        uint64_t v39 = v9;
        unint64_t v42 = *(void **)(*((void *)&v43 + 1) + 8 * v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_rules, "objectForKey:"));
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectAtIndex:0]);
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v12 objectAtIndex:1]);
        __int128 v40 = (void *)objc_claimAutoreleasedReturnValue([v12 objectAtIndex:2]);
        unint64_t v6 = objc_opt_new(&OBJC_CLASS___NSMutableAttributedString);
        id v15 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
        id v37 = v12;
        if (-[NSMutableAttributedString length](v11, "length"))
        {
          unint64_t v16 = 0LL;
          __int128 v41 = v6;
          do
          {
            uint64_t v17 = (char *)[v42 length] + v16;
            if (v17 <= -[NSMutableAttributedString length](v11, "length")
              && (id v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableAttributedString string](v11, "string")),
                  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "substringWithRange:", v16, objc_msgSend(v42, "length"))),
                  unsigned int v20 = [v42 isEqual:v19],
                  v19,
                  v18,
                  v20))
            {
              if ([v13 length])
              {
                unint64_t v21 = 0LL;
                do
                {
                  id v22 = (void *)objc_claimAutoreleasedReturnValue([v14 objectAtIndex:v21]);
                  id v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  (char *)[v22 integerValue] + v16));
                  -[NSMutableArray addObject:](v15, "addObject:", v23);

                  ++v21;
                }

                while (v21 < (unint64_t)[v13 length]);
              }

              id v24 = objc_alloc(&OBJC_CLASS___NSAttributedString);
              v47[0] = @"token";
              v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v8));
              v47[1] = @"partOfSpeech";
              v48[0] = v25;
              v48[1] = v40;
              unint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v48,  v47,  2LL));
              id v27 = -[NSAttributedString initWithString:attributes:](v24, "initWithString:attributes:", v13, v26);

              ++v8;
              unint64_t v6 = v41;
              -[NSMutableAttributedString appendAttributedString:](v41, "appendAttributedString:", v27);
              uint64_t v28 = (uint64_t)[v42 length];
            }

            else
            {
              v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v16));
              -[NSMutableArray addObject:](v15, "addObject:", v29);

              id v27 = (NSAttributedString *)objc_claimAutoreleasedReturnValue( -[NSMutableAttributedString attributedSubstringFromRange:]( v11,  "attributedSubstringFromRange:",  v16,  1LL));
              unint64_t v6 = v41;
              -[NSMutableAttributedString appendAttributedString:](v41, "appendAttributedString:", v27);
              uint64_t v28 = 1LL;
            }

            v16 += v28;
          }

          while (v16 < (unint64_t)-[NSMutableAttributedString length](v11, "length"));
        }

        self = v35;
        id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ABTTranslator _compositionOf:then:](v35, "_compositionOf:then:", v15, v38));

        uint64_t v9 = v39 + 1;
        unint64_t v10 = v7;
        v11 = v6;
      }

      while ((id)(v39 + 1) != v36);
      id v36 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
    }

    while (v36);
  }

  if (a4) {
    *a4 = v7;
  }

  return v6;
}

- (id)_processKanjiNumbers:(id)a3 locations:(id *)a4
{
  id v5 = a3;
  v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet decimalDigitCharacterSet](&OBJC_CLASS___NSCharacterSet, "decimalDigitCharacterSet"));
  unint64_t v6 = objc_opt_new(&OBJC_CLASS___NSMutableAttributedString);
  id v7 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  if (![v5 length]) {
    goto LABEL_59;
  }
  v65 = v7;
  char v66 = 0;
  v61 = a4;
  char v8 = 0;
  int v9 = 0;
  id v63 = 0LL;
  uint64_t v64 = v6;
  unint64_t v10 = 0LL;
  uint64_t v11 = 4LL;
  v12 = &CFLocaleCreate_ptr;
  v67 = v5;
  do
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "attributedSubstringFromRange:", v10, 1));
    uint64_t v14 = v13;
    int v68 = v9;
    if (v11 > 3) {
      goto LABEL_10;
    }
    if (v11 > 2) {
      goto LABEL_10;
    }
    if ([v14 isEqual:@"百"])
    {
LABEL_5:
      unsigned int v15 = 1;
      goto LABEL_11;
    }

    if (v11 > 1) {
LABEL_10:
    }
      unsigned int v15 = 0;
    else {
      unsigned int v15 = [v14 isEqual:@"十"];
    }
LABEL_11:
    unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v14 string]);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([&off_B908 objectForKey:v16]);

    if (v17)
    {
      unsigned int v18 = 1;
    }

    else
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue([v14 string]);
      unsigned int v18 = [&off_B838 containsObject:v19];

      id v5 = v67;
    }

    v71 = (void *)objc_claimAutoreleasedReturnValue([v5 attributesAtIndex:v10 effectiveRange:0]);
    v70 = (void *)objc_claimAutoreleasedReturnValue([v71 objectForKey:@"token"]);
    if (v70) {
      unsigned int v20 = 0;
    }
    else {
      unsigned int v20 = v18;
    }
    objc_super v72 = v14;
    v73 = v17;
    if ((v8 & 1) == 0)
    {
      char v8 = 0;
      goto LABEL_32;
    }

    if (((v20 ^ 1 | v15) & 1) == 0 && (v66 & (v17 != 0LL)) == 0)
    {
      char v8 = 1;
      goto LABEL_32;
    }

    if ((v66 & 1) != 0)
    {
      if ((v11 & 0xFFFFFFFFFFFFFFFELL) == 2)
      {
        uint64_t v21 = v11 - 1;
        do
        {
          id v22 = [objc_alloc((Class)v12[12]) initWithString:@"0"];
          -[NSMutableAttributedString appendAttributedString:](v6, "appendAttributedString:", v22);

          id v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v10 - 2));
          -[NSMutableArray addObject:](v65, "addObject:", v23);

          --v21;
        }

        while (v21);
      }

      id v24 = objc_alloc((Class)v12[12]);
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v63));
      unint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@", v25));
      id v27 = [v24 initWithString:v26];

      -[NSMutableAttributedString appendAttributedString:](v6, "appendAttributedString:", v27);
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v10 - 1));
      -[NSMutableArray addObject:](v65, "addObject:", v28);

LABEL_31:
      char v66 = 0;
      char v8 = 0;
      uint64_t v11 = 4LL;
LABEL_32:
      if ((v20 & 1) == 0) {
        goto LABEL_30;
      }
      goto LABEL_33;
    }

    do
    {
      id v29 = [objc_alloc((Class)v12[12]) initWithString:@"0"];
      -[NSMutableAttributedString appendAttributedString:](v6, "appendAttributedString:", v29);

      id v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v10 - 1));
      -[NSMutableArray addObject:](v65, "addObject:", v30);

      --v11;
    }

    while (v11);
    char v66 = 0;
    char v8 = 0;
    uint64_t v11 = 4LL;
    if ((v20 & 1) == 0)
    {
LABEL_30:
      unint64_t v6 = v64;
      id v31 = v72;
      -[NSMutableAttributedString appendAttributedString:](v64, "appendAttributedString:", v72);
      id v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v10));
      -[NSMutableArray addObject:](v65, "addObject:", v32);

      int v9 = 0;
      id v5 = v67;
      v12 = &CFLocaleCreate_ptr;
      goto LABEL_49;
    }

- (id)_applyNumeralReadings:(id)a3 locations:(id *)a4
{
  id v4 = a3;
  id v5 = -[NSSet initWithObjects:]( objc_alloc(&OBJC_CLASS___NSSet),  "initWithObjects:",  @"0",  @"1",  @"2",  @"3",  @"4",  @"5",  @"6",  @"7",  @"8",  @"9",  @"〇",  @"一",  @"二",  @"三",  @"四",  @"五",  @"六",  @"七",  @"八",  @"九",  @"十",  @"百",  @"千",  @"万",  @"億",  @"兆",  0LL);
  unint64_t v6 = objc_opt_new(&OBJC_CLASS___NSMutableAttributedString);
  id v7 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  if ([v4 length])
  {
    char v8 = 0LL;
    uint64_t v60 = -1LL;
    v61 = v5;
    id v63 = v6;
    while (1)
    {
      if (v8 >= [v4 length]) {
        goto LABEL_8;
      }
      int v9 = (void *)objc_claimAutoreleasedReturnValue([v4 attributesAtIndex:v8 effectiveRange:0]);
      unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"token"]);

      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 string]);
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "substringWithRange:", v8, 1));

      if (!v10 && -[NSSet containsObject:](v5, "containsObject:", v12))
      {

LABEL_8:
        if (v8 == [v4 length]) {
          break;
        }
        unint64_t v15 = (unint64_t)(v8 + 1);
        unint64_t v16 = v8;
        if (v8 + 1 < [v4 length])
        {
          unint64_t v16 = v8;
          while (1)
          {
            unint64_t v15 = (unint64_t)(v16 + 1);
            uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v4 attributesAtIndex:v8 effectiveRange:0]);
            unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:@"token"]);

            v19 = (void *)objc_claimAutoreleasedReturnValue([v4 string]);
            unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "substringWithRange:", v16 + 1, 1));

            if (v18 || !-[NSSet containsObject:](v5, "containsObject:", v20)) {
              break;
            }

            id v21 = [v4 length];
            id v22 = v16 + 1;
            unint64_t v23 = (unint64_t)(v16 + 2);
            ++v16;
            if (v23 >= (unint64_t)v21)
            {
              unint64_t v15 = (unint64_t)(v22 + 1);
              unint64_t v16 = v22;
              goto LABEL_16;
            }
          }
        }

- (id)_yomiWithSpacingOf:(id)a3 locations:(id *)a4
{
  id v5 = a3;
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet decimalDigitCharacterSet](&OBJC_CLASS___NSCharacterSet, "decimalDigitCharacterSet"));
  id v7 = (const __CFString *)[v5 string];
  char v8 = CFLocaleCreate(kCFAllocatorDefault, @"ja");
  v105.CFIndex location = 0LL;
  v105.CFIndex length = 0LL;
  int v9 = CFStringTokenizerCreate(kCFAllocatorDefault, 0LL, v105, 0LL, v8);
  CFRelease(v8);
  v106.CFIndex length = CFStringGetLength(v7);
  unint64_t v10 = v7;
  uint64_t v11 = v9;
  v106.CFIndex location = 0LL;
  CFStringTokenizerSetString(v9, v10, v106);
  v99 = objc_opt_new(&OBJC_CLASS___NSMutableString);
  v12 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  tokenizer = v9;
  v84 = a4;
  if (CFStringTokenizerAdvanceToNextToken(v9))
  {
    CFIndex v13 = 0LL;
    BOOL v14 = 0;
    unsigned int v15 = 0;
    int v100 = 0;
    BOOL v16 = 0;
    uint64_t v17 = &CFLocaleCreate_ptr;
    v88 = v12;
    v101 = v5;
    v86 = v6;
    while (1)
    {
      int v94 = v16;
      unsigned int v90 = v15;
      CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v11);
      CFIndex v19 = v13;
      unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue([v5 string]);
      id v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "substringWithRange:", v13, CurrentTokenRange.location - v13));
      -[NSMutableString appendString:](v99, "appendString:", v21);

      CFIndex v22 = v19;
      CFIndex v97 = v19;
      if (CurrentTokenRange.location > v19)
      {
        do
        {
          unint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17[21], "numberWithInteger:", v22, v84));
          -[NSMutableArray addObject:](v12, "addObject:", v23);

          ++v22;
        }

        while (CurrentTokenRange.location != v22);
      }

      id v24 = (void *)CFStringTokenizerCopyCurrentTokenAttribute(v11, 0x400000uLL);
      int CurrentTokenPartOfSpeech = _CFStringTokenizerGetCurrentTokenPartOfSpeech(v11);
      CFIndex length = CurrentTokenRange.length;
      BOOL v91 = v14;
      if (CurrentTokenRange.length < 1)
      {
        BOOL v104 = 1;
        int v28 = v100;
        if (!CurrentTokenRange.length) {
          goto LABEL_22;
        }
      }

      else
      {
        BOOL v104 = 0;
        uint64_t v27 = 0LL;
        int v28 = v100;
        do
        {
          id v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "string", v84));
          unsigned int v30 = [v29 characterAtIndex:CurrentTokenRange.location + v27];

          if (v30 > 0x7F)
          {
            if (!__maskrune(v30, 0x100uLL)) {
              break;
            }
          }

          else if ((_DefaultRuneLocale.__runetype[v30] & 0x100) == 0)
          {
            break;
          }

          BOOL v104 = ++v27 >= CurrentTokenRange.length;
        }

        while (CurrentTokenRange.length != v27);
      }

      id v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "string", v84));
      unsigned int v32 = objc_msgSend( v6,  "characterIsMember:",  objc_msgSend(v31, "characterAtIndex:", CurrentTokenRange.location)) ^ 1;

      if ((v32 & 1) != 0)
      {
LABEL_22:
        int v37 = 1;
        int v89 = v28;
        goto LABEL_23;
      }

      if (CurrentTokenRange.length < 1)
      {
        int v37 = 0;
        int v89 = v28;
        int v100 = 1;
        goto LABEL_26;
      }

      unsigned int v92 = v32;
      CFIndex location = CurrentTokenRange.location;
      CFIndex v34 = CurrentTokenRange.length;
      while (1)
      {
        uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v5 string]);
        id v36 = [v35 characterAtIndex:location];

        ++location;
        if (!--v34) {
          goto LABEL_21;
        }
      }

      int v28 = 0;
LABEL_21:
      int v89 = v28;
      CFIndex length = CurrentTokenRange.length;
      int v37 = v92;
LABEL_23:
      int v100 = v37 ^ 1;
      if (((v104 | v37 ^ 1) & 1) == 0)
      {
        id v38 = (id)CurrentTokenPartOfSpeech;
        goto LABEL_27;
      }

- (id)_longVowelExpressedFor:(id)a3 partOfSpeech:(int64_t)a4
{
  id v5 = a3;
  if (([v5 isEqual:@"うろうろ"] & 1) == 0
    && ![v5 isEqual:@"こうり"])
  {
    unint64_t v6 = objc_opt_new(&OBJC_CLASS___NSMutableString);
    if (![v5 length]) {
      goto LABEL_4;
    }
    unsigned __int8 v8 = 0;
    int v9 = 0LL;
    while (1)
    {
      unint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "substringWithRange:", v9, 1));
      uint64_t v11 = v10;
      if ((v8 & 1) != 0) {
        unsigned int v12 = -[__CFString isEqual:](v10, "isEqual:", @"う");
      }
      else {
        unsigned int v12 = 0;
      }
      if (a4 == 1)
      {
        BOOL v13 = v9 == (char *)[v5 length] - 1;
        if (!v12) {
          goto LABEL_16;
        }
      }

      else
      {
        BOOL v13 = 0;
        if (!v12) {
          goto LABEL_16;
        }
      }

      if (v13)
      {
LABEL_16:
        BOOL v14 = v6;
        unsigned int v15 = v11;
        goto LABEL_17;
      }

      BOOL v14 = v6;
      unsigned int v15 = @"ー";
LABEL_17:
      -[NSMutableString appendString:](v14, "appendString:", v15);
      else {
        unsigned __int8 v8 = [&off_B898 containsObject:v11];
      }

      if (++v9 >= [v5 length]) {
        goto LABEL_4;
      }
    }
  }

  unint64_t v6 = (NSMutableString *)v5;
LABEL_4:

  return v6;
}

- (id)_brailleForProcessedText:(id)a3 locations:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet newlineCharacterSet](&OBJC_CLASS___NSCharacterSet, "newlineCharacterSet"));
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByTrimmingCharactersInSet:v7]);

  int v9 = objc_opt_new(&OBJC_CLASS___NSMutableString);
  unint64_t v10 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  if (![v8 length]) {
    goto LABEL_231;
  }
  v73 = a4;
  uint64_t v74 = 0LL;
  int v11 = 0;
  char v78 = 0;
  BOOL v82 = 0LL;
  uint64_t v75 = 0LL;
  uint64_t v76 = 0LL;
  uint64_t v72 = 0LL;
  uint64_t v12 = 0LL;
  uint64_t v77 = -1LL;
  v79 = v9;
  v80 = self;
  do
  {
    __darwin_ct_rune_t v13 = [v8 characterAtIndex:v12];
    v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "substringWithRange:", v12, 1));
    if (-[NSMutableString length](v9, "length")) {
      BOOL v14 = -[NSMutableString characterAtIndex:]( v9,  "characterAtIndex:",  (char *)-[NSMutableString length](v9, "length") - 1) == 10240;
    }
    else {
      BOOL v14 = 0;
    }
    if (v13 == 32)
    {
      if (v11 == 2 && v82)
      {
        unint64_t v15 = v12 + 1;
        do
        {
          unint64_t v16 = v15;
          unsigned int v17 = [v8 characterAtIndex:v16];
          unint64_t v15 = v16 + 1;
        }

        while (v17 == 32);
        if (v16 >= (unint64_t)[v8 length])
        {
          int v11 = 2;
          BOOL v82 = 1LL;
        }

        else
        {
          unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "substringWithRange:", v16, 1));
          CFIndex v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_romajiToBraille, "objectForKey:", v18));
          BOOL v82 = v19 != 0LL;

          if (v19)
          {
            int v11 = 2;
          }

          else
          {
            -[NSMutableString appendString:](v9, "appendString:", @"⠴");
            uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableArray objectAtIndex:]( v10,  "objectAtIndex:",  (char *)-[NSMutableArray count](v10, "count") - 1));
            -[NSMutableArray addObject:](v10, "addObject:", v41);

            int v11 = 0;
          }
        }
      }

      int v83 = v11;
      -[NSMutableString appendString:](v9, "appendString:", @"⠀");
      id v36 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v12));
      -[NSMutableArray addObject:](v10, "addObject:", v36);
      goto LABEL_96;
    }

    if (!v11)
    {
      unsigned int v20 = &CFLocaleCreate_ptr;
      if (v13 > 0x7F)
      {
        if (__maskrune(v13, 0x100uLL)) {
          goto LABEL_43;
        }
        __uint32_t v22 = __maskrune(v13, 0x400uLL);
      }

      else
      {
        if ((_DefaultRuneLocale.__runetype[v13] & 0x100) != 0) {
          goto LABEL_43;
        }
        __uint32_t v22 = _DefaultRuneLocale.__runetype[v13] & 0x400;
      }

      BOOL v28 = v22 != 0;
      BOOL v29 = v82;
      if (v22) {
        goto LABEL_78;
      }
      goto LABEL_140;
    }

    unsigned int v20 = &CFLocaleCreate_ptr;
    if (v11 != 1)
    {
      if (v82 || v13 != 45)
      {
        if (v82) {
          goto LABEL_64;
        }
        if (v14)
        {
          else {
            __uint32_t v21 = _DefaultRuneLocale.__runetype[v13] & 0x100;
          }
          BOOL v46 = v21 != 0;
        }

        else
        {
          BOOL v46 = 0;
        }

        if (v13 <= 0x3B && ((1LL << v13) & 0xC00F00000000000LL) != 0 || v13 == 8212 || v13 == 8230 || v46)
        {
          if (v77 == -1)
          {
            BOOL v82 = 0LL;
          }

          else
          {
            BOOL v82 = 1LL;
            -[NSMutableString replaceCharactersInRange:withString:]( v9,  "replaceCharactersInRange:withString:",  v77,  1LL,  @"⠦");
          }

- (id)_textForPrintBraille:(id)a3
{
  id v3 = a3;
  int v40 = objc_opt_new(&OBJC_CLASS___NSMutableString);
  if ([v3 length])
  {
    int v4 = 0;
    int v5 = 0;
    uint64_t v39 = 0LL;
    uint64_t v36 = 0LL;
    char v38 = 0;
    for (unint64_t i = 0; i < (unint64_t)[v3 length]; ++i)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringWithRange:", i, 1));
      unsigned __int8 v8 = &stru_93A0;
      int v9 = &stru_93A0;
      if ([v7 isEqual:@"⠀"])
      {
        if (v4)
        {
          if (v4 != 2) {
            goto LABEL_22;
          }
          if ((v5 & 1) == 0) {
            goto LABEL_21;
          }
        }

        -[NSMutableString appendString:](v40, "appendString:", @" ");
      }

      else if (i + 1 < (unint64_t)[v3 length] {
             && [v7 isEqual:@"⠰"]
      }
             && (v4
              || (unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_brailleToKana, "objectForKey:", v8)),
                  v10,
                  !v10)))
      {
        uint64_t v39 = 0LL;
        int v4 = 2;
      }

      else if ([v7 isEqual:@"⠦"])
      {
        char v38 = 0;
        uint64_t v39 = 0LL;
        int v4 = 2;
        int v5 = 1;
      }

      else
      {
        if ([v7 isEqual:@"⠼"])
        {
          int v4 = 1;
          goto LABEL_23;
        }

        if ([v7 isEqual:@"⠤"]
          && (-[__CFString isEqual:](v8, "isEqual:", @"⠤⠤") & 1) == 0)
        {
          if (v4 == 1) {
            goto LABEL_22;
          }
          if (v4 != 2)
          {
            -[__CFString isEqual:](v8, "isEqual:", @"⠠⠠");
            [v7 isEqual:@"⠠"];
            BOOL v11 = 0;
            goto LABEL_42;
          }

          if ((v5 & 1) == 0)
          {
LABEL_21:
            int v5 = 0;
LABEL_22:
            int v4 = 0;
            goto LABEL_23;
          }
        }

        BOOL v11 = v4 == 2;
        if (-[__CFString isEqual:](v8, "isEqual:", @"⠠⠠") && v4 == 2)
        {
          int v4 = 2;
          HIDWORD(v39) = 1;
          ++i;
        }

        else
        {
          if (![v7 isEqual:@"⠠"] || v4 != 2)
          {
            if (v4 == 1)
            {
              uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_brailleToNumber, "objectForKey:", v7));
              BOOL v13 = v12 != 0LL;

              int v14 = 1;
              int v4 = v13;
              goto LABEL_43;
            }

- (id)processKanjiNumbers:(id)a3 locations:(id *)a4
{
  id v6 = a3;
  id v7 = -[NSAttributedString initWithString:](objc_alloc(&OBJC_CLASS___NSAttributedString), "initWithString:", v6);

  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[ABTTranslator _processKanjiNumbers:locations:](self, "_processKanjiNumbers:locations:", v7, a4));
  int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 string]);

  return v9;
}

- (id)replaceWords:(id)a3 locations:(id *)a4
{
  int v4 = (void *)objc_claimAutoreleasedReturnValue(-[ABTTranslator _replaceWords:locations:](self, "_replaceWords:locations:", a3, a4));
  int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 string]);

  return v5;
}

- (id)applyNumeralReadings:(id)a3 locations:(id *)a4
{
  id v6 = a3;
  id v7 = -[NSAttributedString initWithString:](objc_alloc(&OBJC_CLASS___NSAttributedString), "initWithString:", v6);

  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[ABTTranslator _applyNumeralReadings:locations:](self, "_applyNumeralReadings:locations:", v7, a4));
  int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 string]);

  return v9;
}

- (id)textForPrintBraille:(id)a3
{
  return -[ABTTranslator _textForPrintBraille:](self, "_textForPrintBraille:", a3);
}

- (void).cxx_destruct
{
}

@end