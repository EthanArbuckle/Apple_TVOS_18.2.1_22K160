@interface BRLRhineBrailleTranslator
- (BOOL)activeTableSupportsContractedBraille;
- (BOOL)activeTableSupportsEightDotBraille;
- (BOOL)activeTableSupportsIPA;
- (BOOL)activeTableSupportsTechnicalBraille;
- (BRLRhineBrailleTranslator)init;
- (NSString)activeTable;
- (id)printBrailleForText:(id)a3 mode:(unint64_t)a4 locations:(id *)a5 textPositionsRange:(_NSRange)a6 textFormattingRanges:(id)a7;
- (id)textForPrintBraille:(id)a3 mode:(unint64_t)a4 locations:(id *)a5;
- (int)sendCommand:(id)a3;
- (unint64_t)interfaceVersion;
- (void)extractLocations:(int *)a3 locations_output:(id *)a4 output_size:(int64_t)a5;
- (void)setActiveTable:(id)a3;
- (void)setTranslationMode:(unint64_t)a3;
@end

@implementation BRLRhineBrailleTranslator

- (BRLRhineBrailleTranslator)init
{
  v3 = (void *)objc_opt_new(&OBJC_CLASS___BRLTEmojiPrintPreprocessor);
  v9[0] = v3;
  v4 = (void *)objc_opt_new(&OBJC_CLASS___BRLTUnicodePrintPreprocessor);
  v9[1] = v4;
  v5 = objc_opt_new(&OBJC_CLASS___BRLRhineInputPreprocessor);
  v9[2] = v5;
  v6 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v9, 3LL));
  allPreprocessors = self->_allPreprocessors;
  self->_allPreprocessors = v6;

  return self;
}

- (BOOL)activeTableSupportsContractedBraille
{
  else {
    return !-[NSString isEqualToString:](self->_activeTable, "isEqualToString:", @"es");
  }
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
  return 1;
}

- (unint64_t)interfaceVersion
{
  return 7LL;
}

- (void)setActiveTable:(id)a3
{
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet characterSetWithCharactersInString:]( &OBJC_CLASS___NSCharacterSet,  "characterSetWithCharactersInString:",  @"_-"));
  v7 = (char *)[v5 rangeOfCharacterFromSet:v6 options:4];
  id v8 = v5;
  v9 = v8;
  if (v7 == (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    self->_useContraction = 0;
    v10 = v8;
  }

  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v8 substringToIndex:v7]);

    v11 = (void *)objc_claimAutoreleasedReturnValue([v9 substringFromIndex:v7 + 1]);
    self->_useContraction = [v11 isEqualToString:@"g2"];
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue([languageDict objectForKeyedSubscript:v10]);
  if (v12)
  {
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"{FLN %@}",  v12));
    if (-[BRLRhineBrailleTranslator sendCommand:](self, "sendCommand:", v13))
    {
      id v14 = sub_1B07C();
      v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_1B91C((uint64_t)v9, v15, v16, v17, v18, v19, v20, v21);
      }
    }

    else
    {
      objc_storeStrong((id *)&self->_activeTable, a3);
    }
  }

  else
  {
    id v22 = sub_1B07C();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1B8B8((uint64_t)v10, v13, v23, v24, v25, v26, v27, v28);
    }
  }
}

- (int)sendCommand:(id)a3
{
  id v3 = a3;
  v4 = (char *)[v3 UTF8String];
  int v5 = 6 * strlen(v4);
  if (v5 >= 0x1FFFFFFF) {
    size_t v6 = 0x1FFFFFFFLL;
  }
  else {
    size_t v6 = v5;
  }
  v7 = (char *)malloc((int)v6);
  if (v7)
  {
    id v8 = v7;
    int v9 = wh_forward_translate(v4, v7, v6, 0LL);
    if (v9)
    {
      id v10 = sub_1B07C();
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_1B9B0();
      }
    }

    free(v8);
  }

  else
  {
    id v12 = sub_1B07C();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1B980(v13, v14, v15, v16, v17, v18, v19, v20);
    }

    int v9 = 1;
  }

  return v9;
}

- (void)extractLocations:(int *)a3 locations_output:(id *)a4 output_size:(int64_t)a5
{
  if (a4)
  {
    int64_t v5 = a5;
    int64_t v8 = 8 * a5;
    int v9 = malloc(8 * a5);
    id v10 = v9;
    if (v5 >= 1)
    {
      v11 = v9;
      do
      {
        uint64_t v12 = *a3++;
        *v11++ = v12;
        --v5;
      }

      while (v5);
    }

    *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v9, v8));
    free(v10);
  }

- (void)setTranslationMode:(unint64_t)a3
{
  if (_os_feature_enabled_impl("Accessibility", "CustomBraille"))
  {
    if (!self->_useContraction)
    {
LABEL_7:
      int64_t v5 = @"{FGR 1}";
      goto LABEL_8;
    }
  }

  else if (a3 != 3)
  {
    if (a3 - 1 > 1) {
      return;
    }
    goto LABEL_7;
  }

  int64_t v5 = @"{FGR 2}";
LABEL_8:
  -[BRLRhineBrailleTranslator sendCommand:](self, "sendCommand:", v5);
}

- (id)printBrailleForText:(id)a3 mode:(unint64_t)a4 locations:(id *)a5 textPositionsRange:(_NSRange)a6 textFormattingRanges:(id)a7
{
  v56 = a5;
  id v10 = a3;
  id v59 = a7;
  -[BRLRhineBrailleTranslator setTranslationMode:](self, "setTranslationMode:", a4);
  id v11 = v10;
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  uint64_t v12 = self->_allPreprocessors;
  id v13 = -[NSArray countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v61,  v65,  16LL);
  v58 = v11;
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = 0LL;
    uint64_t v16 = *(void *)v62;
    do
    {
      uint64_t v17 = 0LL;
      uint64_t v18 = v11;
      uint64_t v19 = v15;
      do
      {
        if (*(void *)v62 != v16) {
          objc_enumerationMutation(v12);
        }
        uint64_t v20 = *(void **)(*((void *)&v61 + 1) + 8LL * (void)v17);
        id v60 = 0LL;
        id v11 = (id)objc_claimAutoreleasedReturnValue( objc_msgSend( v20,  "preprocessPrintString:withLocationMap:isEightDot:textFormattingRanges:",  v18,  &v60,  1,  v59,  v56,  v58));
        id v21 = v60;

        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[BRLTPreprocessorHelper mergeLocationMap:withLocationMap:]( &OBJC_CLASS___BRLTPreprocessorHelper,  "mergeLocationMap:withLocationMap:",  v19,  v21));
        uint64_t v17 = (char *)v17 + 1;
        uint64_t v18 = v11;
        uint64_t v19 = v15;
      }

      while (v14 != v17);
      id v14 = -[NSArray countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v61,  v65,  16LL);
    }

    while (v14);
  }

  else
  {
    uint64_t v15 = 0LL;
  }

  id v22 = v11;
  id v23 = v22;
  uint64_t v24 = (const char *)[v23 cStringUsingEncoding:12];
  if (!v24)
  {
    id v43 = sub_1B07C();
    v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      sub_1BA10((uint64_t)v23, v35, v44, v45, v46, v47, v48, v49);
    }
    goto LABEL_34;
  }

  uint64_t v25 = (char *)v24;
  int v26 = 6 * strlen(v24);
  if (v26 >= 0x1FFFFFFF) {
    int v26 = 0x1FFFFFFF;
  }
  if (v26 <= 1) {
    size_t v27 = 1LL;
  }
  else {
    size_t v27 = v26;
  }
  uint64_t v28 = malloc(v27);
  v29 = malloc(v27);
  v30 = malloc(4LL * v27);
  v31 = v30;
  if (v28) {
    BOOL v32 = v29 == 0LL;
  }
  else {
    BOOL v32 = 1;
  }
  if (v32 || v30 == 0LL)
  {
    if (v28) {
      free(v28);
    }
    if (v29) {
      free(v29);
    }
    if (v31) {
      free(v31);
    }
    id v34 = sub_1B07C();
    v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      sub_1B980(v35, v36, v37, v38, v39, v40, v41, v42);
    }
LABEL_34:

    v50 = 0LL;
    goto LABEL_40;
  }

  int v51 = wh_forward_translate(v25, v28, v27, v30);
  brl_convert_to_utf(v28, v29, v27);
  v50 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v29,  4LL));
  if (v51)
  {
    id v52 = sub_1B07C();
    v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
      sub_1BA74();
    }

    v50 = 0LL;
  }

  id v54 = objc_msgSend(v50, "length", v56);
  +[BRLTPreprocessorHelper mergePreprocessorOutputLocationMap:outputToPreprocessedMap:outputLen:outputToTextMap:]( &OBJC_CLASS___BRLTPreprocessorHelper,  "mergePreprocessorOutputLocationMap:outputToPreprocessedMap:outputLen:outputToTextMap:",  v15,  v31,  v54,  v57);
  free(v29);
  free(v28);
  free(v31);
LABEL_40:

  return v50;
}

- (id)textForPrintBraille:(id)a3 mode:(unint64_t)a4 locations:(id *)a5
{
  id v8 = a3;
  -[BRLRhineBrailleTranslator setTranslationMode:](self, "setTranslationMode:", a4);
  id v9 = v8;
  id v10 = (char *)[v9 cStringUsingEncoding:4];
  int v11 = 6 * strlen(v10);
  if (v11 >= 0x1FFFFFFF) {
    int v11 = 0x1FFFFFFF;
  }
  if (v11 <= 1) {
    size_t v12 = 1LL;
  }
  else {
    size_t v12 = v11;
  }
  id v13 = malloc(v12);
  id v14 = malloc(v12);
  uint64_t v15 = malloc(4LL * v12);
  uint64_t v16 = v15;
  if (v13) {
    BOOL v17 = v14 == 0LL;
  }
  else {
    BOOL v17 = 1;
  }
  if (v17 || v15 == 0LL)
  {
    if (v13) {
      free(v13);
    }
    if (v14) {
      free(v14);
    }
    if (v16) {
      free(v16);
    }
    id v19 = sub_1B07C();
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_1BAD4(v20, v21, v22, v23, v24, v25, v26, v27);
    }

    uint64_t v28 = 0LL;
  }

  else
  {
    wh_backward_translate("%", (uint64_t)v14, v12, v15);
    brl_convert_from_utf((unsigned __int8 *)v10, v13, v12);
    if (wh_backward_translate(v13, (uint64_t)v14, v12, v16))
    {
      id v30 = sub_1B07C();
      v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        sub_1BB04();
      }
    }

    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v14,  12LL));
    -[BRLRhineBrailleTranslator extractLocations:locations_output:output_size:]( self,  "extractLocations:locations_output:output_size:",  v16,  a5,  [v28 length]);
    free(v14);
    free(v13);
    free(v16);
  }

  return v28;
}

- (NSString)activeTable
{
  return self->_activeTable;
}

- (void).cxx_destruct
{
}

@end