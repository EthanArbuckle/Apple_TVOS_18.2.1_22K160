@interface NBSCBrailleTranslator
+ (id)sharedInstance;
- (BOOL)activeTableSupportsContractedBraille;
- (BOOL)activeTableSupportsEightDotBraille;
- (BOOL)activeTableSupportsIPA;
- (BOOL)activeTableSupportsTechnicalBraille;
- (NBSCBrailleTranslator)init;
- (id).cxx_construct;
- (id)activeTable;
- (id)printBrailleForText:(id)a3 mode:(unint64_t)a4 locations:(id *)a5 textPositionsRange:(_NSRange)a6 textFormattingRanges:(id)a7;
- (id)textForPrintBraille:(id)a3 mode:(unint64_t)a4 locations:(id *)a5;
- (unint64_t)interfaceVersion;
@end

@implementation NBSCBrailleTranslator

+ (id)sharedInstance
{
  v2 = (void *)_sharedInstance;
  if (!_sharedInstance)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NBSCBrailleTranslator);
    v4 = (void *)_sharedInstance;
    _sharedInstance = (uint64_t)v3;

    v2 = (void *)_sharedInstance;
  }

  return v2;
}

- (NBSCBrailleTranslator)init
{
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___NBSCBrailleTranslator;
  v2 = -[NBSCBrailleTranslator init](&v26, "init");
  _initialized = 0;
  if (v2)
  {
    _initialized = 1;
    v3 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___NBSCBrailleTranslator));
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 resourcePath]);
    id v6 = objc_claimAutoreleasedReturnValue([v5 stringByAppendingString:@"/"]);
    v7 = (char *)[v6 UTF8String];

    if (Init(v7))
    {
      _initialized = 0;
      id v8 = NBSCLog();
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_259A0();
      }
    }

    v10 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___NBSCBrailleTranslator));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 pathForResource:@"HanKataToZenHira" ofType:@"plist"]);

    uint64_t v13 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  v12));
    hanKataToZenHira = v2->_hanKataToZenHira;
    v2->_hanKataToZenHira = (NSDictionary *)v13;

    if (!v2->_hanKataToZenHira)
    {
      _initialized = 0;
      id v15 = NBSCLog();
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_2592C((uint64_t)v12, v16);
      }
    }

    v17 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___NBSCBrailleTranslator));
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    id v19 = objc_claimAutoreleasedReturnValue([v18 pathForResource:@"kan" ofType:@"dat"]);
    v20 = (const char *)[v19 UTF8String];

    if (CToText::Init(&v2->_brlToText, v20))
    {
      _initialized = 0;
      id v21 = NBSCLog();
      v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_258CC();
      }
    }

    if (CToText::SetConvertMode(&v2->_brlToText, 0))
    {
      _initialized = 0;
      id v23 = NBSCLog();
      v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_2586C();
      }
    }
  }

  return v2;
}

- (unint64_t)interfaceVersion
{
  return 7LL;
}

- (id)activeTable
{
  return @"jpn";
}

- (BOOL)activeTableSupportsContractedBraille
{
  return 0;
}

- (BOOL)activeTableSupportsEightDotBraille
{
  return 0;
}

- (BOOL)activeTableSupportsTechnicalBraille
{
  return 0;
}

- (BOOL)activeTableSupportsIPA
{
  return 0;
}

- (id)printBrailleForText:(id)a3 mode:(unint64_t)a4 locations:(id *)a5 textPositionsRange:(_NSRange)a6 textFormattingRanges:(id)a7
{
  id v55 = a3;
  id v53 = a7;
  if (_initialized)
  {
    v9 = -[NSMutableData initWithCapacity:]( [NSMutableData alloc],  "initWithCapacity:",  8 * (void)[v55 length]);
    for (unint64_t i = 0; i < (unint64_t)[v55 length]; ++i)
    {
      v72[0] = i;
      -[NSMutableData appendBytes:length:](v9, "appendBytes:length:", v72, 8LL);
    }

    id v51 = [[BRLTEmojiPrintPreprocessor alloc] initWithPrimaryLanguageCode:@"ja-JP"];
    v52 = (void *)objc_opt_new(&OBJC_CLASS___BRLTUnicodePrintPreprocessor);
    v11 = -[NSArray initWithObjects:](objc_alloc(&OBJC_CLASS___NSArray), "initWithObjects:", v51, v52, 0LL, v9);
    v54 = v9;
    id v12 = v55;
    __int128 v67 = 0u;
    __int128 v68 = 0u;
    __int128 v69 = 0u;
    __int128 v70 = 0u;
    uint64_t v13 = v11;
    id v14 = -[NSArray countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v67,  v73,  16LL);
    v50 = a5;
    if (v14)
    {
      uint64_t v15 = *(void *)v68;
      v16 = v54;
      do
      {
        v17 = 0LL;
        v18 = v12;
        id v19 = v16;
        do
        {
          if (*(void *)v68 != v15) {
            objc_enumerationMutation(v13);
          }
          v20 = *(void **)(*((void *)&v67 + 1) + 8LL * (void)v17);
          id v66 = 0LL;
          id v12 = (id)objc_claimAutoreleasedReturnValue( [v20 preprocessPrintString:v18 withLocationMap:&v66 isEightDot:1 textFormattingRanges:0]);
          id v21 = v66;

          v16 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[BRLTPreprocessorHelper mergeLocationMap:withLocationMap:]( &OBJC_CLASS___BRLTPreprocessorHelper,  "mergeLocationMap:withLocationMap:",  v19,  v21));
          v17 = (char *)v17 + 1;
          v18 = v12;
          id v19 = v16;
        }

        while (v14 != v17);
        id v14 = -[NSArray countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v67,  v73,  16LL);
      }

      while (v14);
    }

    else
    {
      v16 = v54;
    }

    id v32 = [v12 length];
    unint64_t v33 = (unint64_t)v32;
    if (v32)
    {
      else {
        size_t v34 = 4LL * ((void)v32 + 1);
      }
      v35 = operator new[](v34);
      uint64_t v36 = 0LL;
      do
      {
        v35[v36] = [v12 characterAtIndex:v36];
        ++v36;
      }

      while (v33 != v36);
      v35[v33] = 0;
      bzero(v72, 0x4B00uLL);
      bzero(v71, 0x4B00uLL);
      uint64_t v63 = 0LL;
      uint64_t v64 = 0LL;
      uint64_t v65 = 0LL;
      v56[1] = v35;
      v56[2] = v72;
      v57 = v71;
      uint64_t v58 = 0LL;
      int v37 = 10 * v33;
      if (v33 > 0x19999999) {
        int v37 = -1;
      }
      int v59 = 0;
      unsigned int v60 = v37;
      __int128 v61 = xmmword_2B280;
      uint64_t v62 = 1LL;
      int v38 = TextToBrl();
      operator delete[](v35);
      if (v38)
      {
        id v39 = NBSCLog();
        v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
          sub_25A60();
        }
        v31 = &stru_2C350;
      }

      else
      {
        uint64_t v41 = v60;
        v42 = operator new[](2LL * v60);
        v43 = v42;
        if (v60)
        {
          uint64_t v44 = 0LL;
          v45 = v57;
          int v46 = v60 * HIDWORD(v63);
          while (*(_WORD *)&v45[2 * v44])
          {
            *((_WORD *)v42 + v44) = *((unsigned __int8 *)v72 + 2 * (v46 + v44)) | 0x2800;
            if (v41 == ++v44) {
              goto LABEL_36;
            }
          }

          LODWORD(v41) = v44;
        }

- (id)textForPrintBraille:(id)a3 mode:(unint64_t)a4 locations:(id *)a5
{
  uint64_t v26 = a5;
  id v6 = a3;
  uint64_t v28 = objc_opt_new(&OBJC_CLASS___NSMutableString);
  for (unint64_t i = 0; i < objc_msgSend(v6, "length", v26); ++i)
  {
    LOWORD(v33[0]) = (unsigned __int16)[v6 characterAtIndex:i];
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCharacters:length:]( &OBJC_CLASS___NSString,  "stringWithCharacters:length:",  v33,  1LL));
    -[NSMutableString appendString:](v28, "appendString:", v8);
    if (i == (char *)[v6 length] - 1)
    {
    }
  }

  uint64_t v27 = v28;

  v31[0] = 0LL;
  v31[3] = 0LL;
  v31[1] = v33;
  v31[2] = &v32;
  CToText::SetConvertMode(&self->_brlToText, 0);
  uint64_t v30 = 0LL;
  uint64_t v29 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  v9 = -[NSMutableData initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableData),  "initWithCapacity:",  8LL * (void)-[NSMutableString length](v29, "length"));
  for (unint64_t j = 0LL; j < (unint64_t)-[NSMutableString length](v27, "length"); unint64_t j = ++v30)
  {
    unsigned int v11 = -[NSMutableString characterAtIndex:](v27, "characterAtIndex:", v30);
    if (v11 == 13) {
      break;
    }
    if (v11 >> 8 == 40)
    {
      LOBYTE(v31[0]) = v11;
      if (!CToText::BrlToText(&self->_brlToText, (uint64_t)v31))
      {
        if (v33[0])
        {
          int v12 = 0;
          uint64_t v13 = v33;
          do
          {
            id v14 = &v33[v12];
            int v16 = v14[1];
            uint64_t v15 = v14 + 1;
            if (!v16) {
              goto LABEL_18;
            }
            v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCharacters:length:]( &OBJC_CLASS___NSString,  "stringWithCharacters:length:",  v13,  1LL));
            v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCharacters:length:]( &OBJC_CLASS___NSString,  "stringWithCharacters:length:",  v15,  1LL));
            id v19 = (void *)objc_claimAutoreleasedReturnValue([v17 stringByAppendingString:v18]);
            v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_hanKataToZenHira, "objectForKey:", v19));
            if (v20)
            {
              -[NSMutableString appendString:](v29, "appendString:", v20);
              -[NSMutableData appendBytes:length:](v9, "appendBytes:length:", &v30, 8LL);
              v12 += 2;
            }

            if (!v20)
            {
LABEL_18:
              id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCharacters:length:]( &OBJC_CLASS___NSString,  "stringWithCharacters:length:",  &v33[v12],  1LL));
              id v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_hanKataToZenHira, "objectForKey:", v21));
              id v23 = v22;
              if (v22)
              {
                id v24 = v22;

                id v21 = v24;
              }

              -[NSMutableString appendString:](v29, "appendString:", v21);
              -[NSMutableData appendBytes:length:](v9, "appendBytes:length:", &v30, 8LL);

              ++v12;
            }

            uint64_t v13 = &v33[v12];
          }

          while (*v13);
        }
      }
    }
  }

  if (v26) {
    *uint64_t v26 = v9;
  }

  return v29;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  return self;
}

@end