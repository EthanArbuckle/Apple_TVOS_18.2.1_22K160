@interface VOTBrailleGestureTranslator
- (BOOL)_isFullCellStrong;
- (BOOL)_shouldUseEightDotBraille;
- (BOOL)areDotNumberPositionsCalibrated;
- (BOOL)isActive;
- (BOOL)isExistingInputContainedIn:(id)a3 withMode:(unint64_t)a4 isPrefix:(BOOL *)a5;
- (BOOL)isUnitTesting;
- (BOOL)performBrailleBufferBackspace:(id *)a3;
- (BOOL)shouldUseContractedBraille;
- (BRLTTranslationService)translationService;
- (CGSize)keyboardSize;
- (VOTBrailleGestureTranslator)init;
- (VOTBrailleGestureTranslatorDelegate)delegate;
- (id)_outputForBefore:(id)a3 after:(id)a4 delete:(BOOL)a5;
- (id)_trimCommonPrefixWithString:(id)a3 fromString:(id)a4;
- (id)brailleForText:(id)a3 mode:(unint64_t)a4;
- (id)dotNumberPositions;
- (id)outputForLatestInput;
- (id)popLastBrailleCellFromBuffer;
- (id)printBrailleForAllTouchPointsInInput:(id)a3 shouldLearn:(BOOL)a4 error:(id *)a5;
- (id)printBrailleForGesturePattern:(id)a3;
- (id)printBrailleForInput:(id)a3 error:(id *)a4;
- (id)textForBraille:(id)a3 mode:(unint64_t)a4;
- (id)translateExistingInputWithMode:(unint64_t)a3;
- (id)translatedTextForPrintBraille:(id)a3 mode:(unint64_t)a4;
- (id)translatedTextForPrintBraille:(id)a3 mode:(unint64_t)a4 buffer:(id)a5;
- (id)translatedTextOfBufferWithMode:(unint64_t)a3;
- (int64_t)typingMode;
- (void)_resetTranslator;
- (void)addPrintBrailleToBuffer:(id)a3 language:(id)a4;
- (void)calibrateWithTouchPoints:(id)a3;
- (void)clearBrailleBuffer;
- (void)didInputBackspace;
- (void)didInputSpace;
- (void)didPressReturnKey;
- (void)savePersistentGestureData;
- (void)setActive:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setShouldUseContractedBraille:(BOOL)a3;
- (void)setTranslationService:(id)a3;
- (void)setTypingMode:(int64_t)a3 keyboardSize:(CGSize)a4 shouldUseEightDotBraille:(BOOL)a5 shouldReverseDots:(BOOL)a6;
- (void)setUnitTesting:(BOOL)a3;
@end

@implementation VOTBrailleGestureTranslator

- (VOTBrailleGestureTranslator)init
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___VOTBrailleGestureTranslator;
  v2 = -[VOTBrailleGestureTranslator init](&v14, "init");
  v3 = v2;
  if (v2)
  {
    v2->_unitTesting = 0;
    v4 = objc_alloc_init(&OBJC_CLASS___VOTBrailleGesturePatternRecognitionEngine);
    recognitionEngine = v3->_recognitionEngine;
    v3->_recognitionEngine = v4;

    -[VOTBrailleGesturePatternRecognitionEngine setDelegate:](v3->_recognitionEngine, "setDelegate:", v3);
    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
    brailleBuffer = v3->_brailleBuffer;
    v3->_brailleBuffer = v6;

    objc_initWeak(&location, v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1000263F0;
    v11[3] = &unk_100176F08;
    objc_copyWeak(&v12, &location);
    id v9 = objc_loadWeakRetained(&location);
    [v8 registerUpdateBlock:v11 forRetrieveSelector:"voiceOverBrailleTableIdentifier" withListener:v9];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

  return v3;
}

- (void)setUnitTesting:(BOOL)a3
{
  if (self->_unitTesting != a3)
  {
    self->_unitTesting = a3;
    translationService = self->_translationService;
    self->_translationService = 0LL;
  }

- (id)printBrailleForAllTouchPointsInInput:(id)a3 shouldLearn:(BOOL)a4 error:(id *)a5
{
  BOOL v5 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id v26 = v7;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 seriesOfTouchPoints]);
  id v10 = [v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v29;
    while (2)
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v29 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v28 + 1) + 8LL * (void)i);
        recognitionEngine = self->_recognitionEngine;
        id v27 = 0LL;
        v16 = (void *)objc_claimAutoreleasedReturnValue( -[VOTBrailleGesturePatternRecognitionEngine printBrailleForTouchPoints:shouldLearn:error:]( recognitionEngine,  "printBrailleForTouchPoints:shouldLearn:error:",  v14,  v5,  &v27));
        id v17 = v27;
        if (v17)
        {
          v21 = v17;
          uint64_t v22 = VOTLogBrailleGestures(v17, v18);
          v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
            sub_1000EFB94(v21, v14, v23);
          }

          v20 = v26;
          if (a5) {
            *a5 = v21;
          }

          v19 = &stru_10017A920;
          goto LABEL_15;
        }

        [v8 appendString:v16];
      }

      id v11 = [v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  v19 = v8;
  v20 = v26;
LABEL_15:

  return v19;
}

- (void)addPrintBrailleToBuffer:(id)a3 language:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = -[NSMutableString copy](self->_brailleBuffer, "copy");
  id v9 = -[NSMutableString appendString:](self->_brailleBuffer, "appendString:", v6);
  uint64_t v11 = VOTLogBrailleGestures(v9, v10);
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    brailleBuffer = self->_brailleBuffer;
    int v16 = 138543874;
    id v17 = brailleBuffer;
    __int16 v18 = 2114;
    id v19 = v6;
    __int16 v20 = 2114;
    id v21 = v7;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "Braille buffer = %{public}@, added %{public}@ (language = %{public}@)",  (uint8_t *)&v16,  0x20u);
  }

  v13 = (VOTOutputRequest *)objc_claimAutoreleasedReturnValue( -[VOTBrailleGestureTranslator _outputForBefore:after:delete:]( self,  "_outputForBefore:after:delete:",  v8,  self->_brailleBuffer,  0LL));
  outputForLatestInput = self->_outputForLatestInput;
  self->_outputForLatestInput = v13;
}

- (id)popLastBrailleCellFromBuffer
{
  p_brailleBuffer = &self->_brailleBuffer;
  if (!-[NSMutableString length](self->_brailleBuffer, "length")
    || ((id v4 = -[NSMutableString rangeOfComposedCharacterSequenceAtIndex:]( *p_brailleBuffer,  "rangeOfComposedCharacterSequenceAtIndex:",  (char *)-[NSMutableString length](*p_brailleBuffer, "length") - 1),  v4 != (id)0x7FFFFFFFFFFFFFFFLL)
      ? (BOOL v6 = v5 == 0)
      : (BOOL v6 = 1),
        v6))
  {
    outputForLatestInput = self->_outputForLatestInput;
    self->_outputForLatestInput = 0LL;

    uint64_t v11 = 0LL;
  }

  else
  {
    id v8 = v4;
    uint64_t v9 = v5;
    id v10 = -[NSMutableString copy](*p_brailleBuffer, "copy");
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableString substringWithRange:](*p_brailleBuffer, "substringWithRange:", v8, v9));
    id v12 = -[NSMutableString deleteCharactersInRange:](*p_brailleBuffer, "deleteCharactersInRange:", v8, v9);
    uint64_t v14 = VOTLogBrailleGestures(v12, v13);
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      sub_1000EFC40(p_brailleBuffer);
    }

    id v17 = (VOTOutputRequest *)objc_claimAutoreleasedReturnValue( -[VOTBrailleGestureTranslator _outputForBefore:after:delete:]( self,  "_outputForBefore:after:delete:",  v10,  self->_brailleBuffer,  1LL));
    __int16 v18 = self->_outputForLatestInput;
    self->_outputForLatestInput = v17;
  }

  return v11;
}

- (id)translatedTextOfBufferWithMode:(unint64_t)a3
{
  return -[VOTBrailleGestureTranslator translatedTextForPrintBraille:mode:]( self,  "translatedTextForPrintBraille:mode:",  self->_brailleBuffer,  a3);
}

- (id)translatedTextForPrintBraille:(id)a3 mode:(unint64_t)a4
{
  return -[VOTBrailleGestureTranslator translatedTextForPrintBraille:mode:buffer:]( self,  "translatedTextForPrintBraille:mode:buffer:",  a3,  a4,  self->_brailleBuffer);
}

- (id)translatedTextForPrintBraille:(id)a3 mode:(unint64_t)a4 buffer:(id)a5
{
  id v8 = (__CFString *)a3;
  id v9 = a5;
  uint64_t v10 = objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureTranslator textForBraille:mode:](self, "textForBraille:mode:", @"⠿", a4));
  uint64_t v11 = (__CFString *)v10;
  if (a4 == 4)
  {
    uint64_t v26 = objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureTranslator textForBraille:mode:](self, "textForBraille:mode:", v8, 4LL));
    __int128 v28 = (__CFString *)v26;
  }

  else
  {
    if (a4 == 3)
    {
      if (!v10)
      {
        uint64_t v12 = VOTLogBraille();
        uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          sub_1000EFD88(v13, v14, v15, v16, v17, v18, v19, v20);
        }

        uint64_t v11 = &stru_10017A920;
      }

      v77 = v11;
      if ([v9 length])
      {
        id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@%@",  @"⠿",  v8,  @"⠿"));
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureTranslator textForBraille:mode:](self, "textForBraille:mode:", v21, 3LL));
        v23 = (char *)[v22 rangeOfString:v11 options:0];
        else {
          v25 = (__CFString *)objc_claimAutoreleasedReturnValue([v22 substringFromIndex:&v23[v24]]);
        }

        id v34 = -[__CFString rangeOfString:options:](v25, "rangeOfString:options:", v11, 4LL);
        if (v34 == (id)0x7FFFFFFFFFFFFFFFLL) {
          v35 = &stru_10017A920;
        }
        else {
          v35 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString substringToIndex:](v25, "substringToIndex:", v34));
        }

        v36 = (void *)objc_claimAutoreleasedReturnValue([@"⠿" stringByAppendingString:v8]);
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureTranslator textForBraille:mode:](self, "textForBraille:mode:", v36, 3LL));
        v38 = (char *)[v37 rangeOfString:v11];
        else {
          v40 = (__CFString *)objc_claimAutoreleasedReturnValue([v37 substringFromIndex:&v38[v39]]);
        }

        uint64_t v43 = VOTLogBrailleGestures(v41, v42);
        v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG)) {
          sub_1000EFD1C((uint64_t)v35);
        }

        if (!v35 || (id v45 = -[__CFString length](v35, "length"), v46 = v35, !v45)) {
          v46 = v40;
        }
        __int128 v28 = v46;
      }

      else
      {
        __int128 v29 = (__CFString *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureTranslator textForBraille:mode:](self, "textForBraille:mode:", v8, 3LL));
        __int128 v30 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v8, "stringByAppendingString:", @"⠿"));
        __int128 v31 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureTranslator textForBraille:mode:](self, "textForBraille:mode:", v30, 3LL));
        id v32 = [v31 rangeOfString:v11 options:4];
        if (v32 == (id)0x7FFFFFFFFFFFFFFFLL) {
          v33 = &stru_10017A920;
        }
        else {
          v33 = (__CFString *)objc_claimAutoreleasedReturnValue([v31 substringToIndex:v32]);
        }

        uint64_t v49 = VOTLogBrailleGestures(v47, v48);
        v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG)) {
          sub_1000EFCB0((uint64_t)v29);
        }

        if (!v33 || (id v51 = -[__CFString length](v33, "length"), v52 = v33, !v51)) {
          v52 = v29;
        }
        __int128 v28 = v52;
      }
    }

    else
    {
      v77 = (__CFString *)v10;
      __int128 v28 = (__CFString *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureTranslator textForBraille:mode:](self, "textForBraille:mode:", v8, a4));
    }

    v53 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString uppercaseString](v28, "uppercaseString"));
    v54 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString capitalizedString](v28, "capitalizedString"));
    id v78 = v9;
    v79 = v8;
    v55 = (void *)objc_claimAutoreleasedReturnValue([v9 stringByAppendingString:v8]);
    v56 = (void *)objc_claimAutoreleasedReturnValue( -[VOTBrailleGestureTranslator translateExistingInputWithMode:]( self,  "translateExistingInputWithMode:",  a4));
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureTranslator textForBraille:mode:](self, "textForBraille:mode:", v55, a4));
    v58 = (__CFString *)objc_claimAutoreleasedReturnValue( -[VOTBrailleGestureTranslator _trimCommonPrefixWithString:fromString:]( self,  "_trimCommonPrefixWithString:fromString:",  v56,  v57));
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureTranslator textForBraille:mode:](self, "textForBraille:mode:", v55, a4));
    uint64_t v61 = VOTLogBrailleGestures(v59, v60);
    v62 = (os_log_s *)objc_claimAutoreleasedReturnValue(v61);
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138544898;
      v81 = v28;
      __int16 v82 = 2114;
      v83 = v54;
      __int16 v84 = 2114;
      v85 = v53;
      __int16 v86 = 2114;
      v87 = v56;
      __int16 v88 = 2114;
      v89 = v57;
      __int16 v90 = 2114;
      v91 = v58;
      __int16 v92 = 2114;
      v93 = v59;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v62,  OS_LOG_TYPE_DEBUG,  "Context translations:\n translatedText = \"%{public}@\", capitalized: \"%{public}@\", uppercase: \"%{public}@\"\n currentBufferTranslation = \"%{public}@\"\n contextTranslation = \"%{public}@\"\n contextSuffix = \"%{public}@\"\n uncontractedTranslation = \"%{public}@\"",  buf,  0x48u);
    }

    unsigned __int8 v63 = [v57 isEqualToString:v53];
    v64 = v53;
    if ((v63 & 1) != 0) {
      goto LABEL_46;
    }
    unsigned __int8 v65 = [v57 isEqualToString:v54];
    v64 = v54;
    if ((v65 & 1) != 0) {
      goto LABEL_46;
    }
    if (v28)
    {
      id v66 = -[__CFString length](v58, "length");
      id v67 = -[__CFString length](v28, "length");
      v64 = v58;
      if (v66 == v67) {
        goto LABEL_46;
      }
      if (v54)
      {
        unsigned __int8 v68 = [v59 hasSuffix:v54];
        v64 = v54;
        if ((v68 & 1) != 0) {
          goto LABEL_46;
        }
      }

      if (v53 && (unsigned __int8 v69 = -[__CFString hasPrefix:](v58, "hasPrefix:", v53), v64 = v53, (v69 & 1) != 0)
        || v54 && (unsigned int v70 = -[__CFString hasPrefix:](v58, "hasPrefix:", v54), v64 = v54, v70))
      {
LABEL_46:
        v71 = v64;

        __int128 v28 = v71;
      }
    }

    id v9 = v78;
    id v8 = v79;
    uint64_t v11 = v77;
  }

  uint64_t v72 = VOTLogBrailleGestures(v26, v27);
  v73 = (os_log_s *)objc_claimAutoreleasedReturnValue(v72);
  if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v74 = BRLTModeDescription(a4);
    v75 = (__CFString *)objc_claimAutoreleasedReturnValue(v74);
    *(_DWORD *)buf = 138543874;
    v81 = v8;
    __int16 v82 = 2114;
    v83 = v28;
    __int16 v84 = 2112;
    v85 = v75;
    _os_log_impl( (void *)&_mh_execute_header,  v73,  OS_LOG_TYPE_DEFAULT,  "Translated text: %{public}@ -> %{public}@ (mode:%@)",  buf,  0x20u);
  }

  return v28;
}

- (id)_trimCommonPrefixWithString:(id)a3 fromString:(id)a4
{
  id v5 = a4;
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v5 commonPrefixWithString:a3 options:0]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "substringFromIndex:", objc_msgSend(v6, "length")));

  return v7;
}

- (id)translateExistingInputWithMode:(unint64_t)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[VOTBrailleGestureTranslator textForBraille:mode:]( self,  "textForBraille:mode:",  self->_brailleBuffer,  a3));
  uint64_t v6 = VOTLogBrailleGestures(v4, v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    brailleBuffer = self->_brailleBuffer;
    int v10 = 138543618;
    uint64_t v11 = brailleBuffer;
    __int16 v12 = 2114;
    uint64_t v13 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Translated text: \"%{public}@\" -> \"%{public}@\"",  (uint8_t *)&v10,  0x16u);
  }

  return v4;
}

- (BOOL)isExistingInputContainedIn:(id)a3 withMode:(unint64_t)a4 isPrefix:(BOOL *)a5
{
  id v8 = a3;
  brailleBuffer = self->_brailleBuffer;
  if (brailleBuffer && -[NSMutableString length](brailleBuffer, "length"))
  {
    int v10 = (void *)objc_claimAutoreleasedReturnValue([v8 lowercaseString]);
    v24[0] = v10;
    v24[1] = v8;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    id v11 = (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v24,  2LL));
    id v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v20;
      while (2)
      {
        for (i = 0LL; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( -[VOTBrailleGestureTranslator brailleForText:mode:]( self,  "brailleForText:mode:",  *(void *)(*((void *)&v19 + 1) + 8LL * (void)i),  a4,  (void)v19));
          if ([v16 containsString:self->_brailleBuffer])
          {
            if (a5) {
              *a5 = [v16 hasPrefix:self->_brailleBuffer];
            }

            BOOL v17 = 1;
            goto LABEL_17;
          }
        }

        id v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }

    BOOL v17 = 0;
    if (a5) {
      *a5 = 0;
    }
LABEL_17:
  }

  else
  {
    BOOL v17 = 1;
  }

  return v17;
}

- (void)didInputSpace
{
  uint64_t v2 = VOTLogBrailleGestures(self, a2);
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Did input space", v4, 2u);
  }
}

- (BOOL)performBrailleBufferBackspace:(id *)a3
{
  id v5 = -[NSMutableString length](self->_brailleBuffer, "length");
  if (v5)
  {
    id v6 = -[NSMutableString copy](self->_brailleBuffer, "copy");
    if (a3) {
      *a3 = (id)objc_claimAutoreleasedReturnValue( -[NSMutableString substringFromIndex:]( self->_brailleBuffer,  "substringFromIndex:",  (char *)-[NSMutableString length](self->_brailleBuffer, "length") - 1));
    }
    -[NSMutableString deleteCharactersInRange:]( self->_brailleBuffer,  "deleteCharactersInRange:",  (char *)-[NSMutableString length](self->_brailleBuffer, "length") - 1,  1LL);
    id v7 = -[VOTBrailleGesturePatternRecognitionEngine unlearnLastGesture](self->_recognitionEngine, "unlearnLastGesture");
    uint64_t v9 = VOTLogBrailleGestures(v7, v8);
    int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      brailleBuffer = self->_brailleBuffer;
      int v15 = 138477827;
      uint64_t v16 = brailleBuffer;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Did backspace from braille buffer, which is now \"%{private}@\"",  (uint8_t *)&v15,  0xCu);
    }

    id v12 = (VOTOutputRequest *)objc_claimAutoreleasedReturnValue( -[VOTBrailleGestureTranslator _outputForBefore:after:delete:]( self,  "_outputForBefore:after:delete:",  v6,  self->_brailleBuffer,  1LL));
    outputForLatestInput = self->_outputForLatestInput;
    self->_outputForLatestInput = v12;
  }

  return v5 != 0LL;
}

- (void)didInputBackspace
{
  uint64_t v3 = VOTLogBrailleGestures(self, a2);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Did input backspace", v5, 2u);
  }

  if (-[NSMutableString length](self->_brailleBuffer, "length")) {
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/VoiceOverTouch/Sources/VOTBrailleGestureTranslator.m",  351LL,  "-[VOTBrailleGestureTranslator didInputBackspace]",  @"Should not have been allowed to input a real backspace if we still had something in the Braille buffer");
  }
}

- (void)didPressReturnKey
{
  uint64_t v2 = VOTLogBrailleGestures(self, a2);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Did press return key", v4, 2u);
  }
}

- (id)printBrailleForInput:(id)a3 error:(id *)a4
{
  id v7 = a3;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 seriesOfTouchPoints]);
  if ([v8 count] != (id)1)
  {
    int v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v15 handleFailureInMethod:a2 object:self file:@"VOTBrailleGestureTranslator.m" lineNumber:363 description:@"Should have only sent one set of touch points for determining print Braille"];
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 lastObject]);
  int v10 = (void *)objc_claimAutoreleasedReturnValue( -[VOTBrailleGesturePatternRecognitionEngine printBrailleForTouchPoints:shouldLearn:error:]( self->_recognitionEngine,  "printBrailleForTouchPoints:shouldLearn:error:",  v9,  0LL,  a4));
  uint64_t v12 = VOTLogBrailleGestures(v10, v11);
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    sub_1000EFDF8((uint64_t)v10);
  }

  return v10;
}

- (id)printBrailleForGesturePattern:(id)a3
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%C",  -[VOTBrailleGesturePatternRecognitionEngine printBrailleCharacterFromBraillePattern:]( self->_recognitionEngine,  "printBrailleCharacterFromBraillePattern:",  a3));
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    uint64_t v5 = VOTLogBrailleGestures(self, a2);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_1000EFE64(a3, v6);
    }

    self->_active = a3;
    -[VOTBrailleGesturePatternRecognitionEngine resetLastGestures](self->_recognitionEngine, "resetLastGestures");
  }

- (void)setTypingMode:(int64_t)a3 keyboardSize:(CGSize)a4 shouldUseEightDotBraille:(BOOL)a5 shouldReverseDots:(BOOL)a6
{
}

- (id)dotNumberPositions
{
  return -[VOTBrailleGesturePatternRecognitionEngine dotNumberPositions](self->_recognitionEngine, "dotNumberPositions");
}

- (void)calibrateWithTouchPoints:(id)a3
{
  id v4 = a3;
  uint64_t v6 = VOTLogBrailleGestures(v4, v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_1000EFF00((uint64_t)v4, v7, v8);
  }

  -[VOTBrailleGesturePatternRecognitionEngine calibrateWithTouchPoints:]( self->_recognitionEngine,  "calibrateWithTouchPoints:",  v4);
}

- (void)savePersistentGestureData
{
}

- (BOOL)areDotNumberPositionsCalibrated
{
  return -[VOTBrailleGesturePatternRecognitionEngine areDotNumberPositionsCalibrated]( self->_recognitionEngine,  "areDotNumberPositionsCalibrated");
}

- (id)outputForLatestInput
{
  id v3 = -[VOTOutputRequest copy](self->_outputForLatestInput, "copy");
  outputForLatestInput = self->_outputForLatestInput;
  self->_outputForLatestInput = 0LL;

  return v3;
}

- (void)_resetTranslator
{
  uint64_t v3 = VOTLogBrailleGestures(self, a2);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_1000EFF68(v4);
  }

  translationService = self->_translationService;
  self->_translationService = 0LL;
}

- (BRLTTranslationService)translationService
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace selectedBrailleGesturesInputTable]);
  id v4 = v3;
  if (v3)
  {
    if (!self->_translationService
      || (uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 serviceIdentifier]),
          uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[BRLTTranslationService serviceIdentifier](self->_translationService, "serviceIdentifier")),
          unsigned __int8 v7 = [v5 isEqualToString:v6],
          v6,
          v5,
          (v7 & 1) == 0))
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 serviceIdentifier]);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[BRLTTranslationService serviceForIdentifier:input:loopback:]( &OBJC_CLASS___BRLTTranslationService,  "serviceForIdentifier:input:loopback:",  v8,  0LL,  -[VOTBrailleGestureTranslator isUnitTesting](self, "isUnitTesting")));

      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      v14[2] = sub_100027808;
      v14[3] = &unk_100176D38;
      id v15 = v4;
      [v9 setInvalidationHandler:v14];
      translationService = self->_translationService;
      self->_translationService = (BRLTTranslationService *)v9;
      id v11 = v9;
    }

    uint64_t v12 = self->_translationService;
  }

  else
  {
    uint64_t v12 = 0LL;
  }

  return v12;
}

- (BOOL)_shouldUseEightDotBraille
{
  return -[VOTBrailleGesturePatternRecognitionEngine shouldUseEightDotBraille]( self->_recognitionEngine,  "shouldUseEightDotBraille");
}

- (void)clearBrailleBuffer
{
  uint64_t v3 = VOTLogBrailleGestures(self, a2);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Clear braille buffer", v5, 2u);
  }

  -[NSMutableString setString:](self->_brailleBuffer, "setString:", &stru_10017A920);
  -[VOTBrailleGesturePatternRecognitionEngine resetLastGestures](self->_recognitionEngine, "resetLastGestures");
}

- (BOOL)_isFullCellStrong
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureTranslator textForBraille:mode:](self, "textForBraille:mode:", @"⠿", 1LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[VOTBrailleGestureTranslator textForBraille:mode:]( self,  "textForBraille:mode:",  @"⠿⠿⠿",  1LL));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByReplacingOccurrencesOfString:@" " withString:&stru_10017A920]);

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@%@%@", v3, v3, v3));
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByReplacingOccurrencesOfString:@" " withString:&stru_10017A920]);

  if ([v3 length]) {
    unsigned __int8 v8 = [v5 isEqualToString:v7];
  }
  else {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (id)_outputForBefore:(id)a3 after:(id)a4 delete:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if (-[VOTBrailleGestureTranslator _isFullCellStrong](self, "_isFullCellStrong"))
  {
    int v10 = (void *)objc_claimAutoreleasedReturnValue( -[VOTBrailleGestureTranslator translatedTextForPrintBraille:mode:buffer:]( self,  "translatedTextForPrintBraille:mode:buffer:",  v8,  3LL,  &stru_10017A920));
    uint64_t v11 = objc_claimAutoreleasedReturnValue( -[VOTBrailleGestureTranslator translatedTextForPrintBraille:mode:buffer:]( self,  "translatedTextForPrintBraille:mode:buffer:",  v9,  3LL,  &stru_10017A920));
  }

  else
  {
    int v10 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureTranslator textForBraille:mode:](self, "textForBraille:mode:", v8, 1LL));
    uint64_t v11 = objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureTranslator textForBraille:mode:](self, "textForBraille:mode:", v9, 1LL));
  }

  uint64_t v12 = (void *)v11;
  unint64_t v13 = 0LL;
  if ([v10 length])
  {
    do
    {
      unsigned int v14 = [v10 characterAtIndex:v13];
      ++v13;
    }

    while (v13 < (unint64_t)[v10 length]);
  }

  id v15 = objc_opt_new(&OBJC_CLASS___VOTOutputRequest);
  if (v5)
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v10 substringFromIndex:v13]);
    id v17 = [[AXAttributedString alloc] initWithString:v16];
    objc_msgSend( v17,  "addAttribute:forKey:withRange:",  kCFBooleanTrue,  UIAccessibilityTokenLowPitch,  0,  objc_msgSend(v17, "length"));
    id v18 = -[VOTOutputRequest addAttributedString:](v15, "addAttributedString:", v17);
  }

  else
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v12 substringFromIndex:v13]);
    id v19 = -[VOTOutputRequest addString:](v15, "addString:", v16);
  }

  return v15;
}

- (id)textForBraille:(id)a3 mode:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v24 = 0LL;
  v25 = &v24;
  uint64_t v26 = 0x3032000000LL;
  uint64_t v27 = sub_100027DF8;
  __int128 v28 = sub_100027E08;
  id v29 = 0LL;
  unsigned __int8 v7 = dispatch_group_create();
  dispatch_group_enter(v7);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace selectedBrailleGesturesInputTable]);
  id v9 = (__CFString *)objc_claimAutoreleasedReturnValue([v8 tableIdentifier]);
  int v10 = v9;
  if (a4 == 4)
  {

    int v10 = @"nemeth";
  }

  id v11 = objc_alloc(&OBJC_CLASS___BRLTTranslationParameters);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString brl_languageAndVariant](v10, "brl_languageAndVariant"));
  id v13 = objc_msgSend( v11,  "initWithLanguage:mode:partial:useTechnicalTable:textPositionsRange:textFormattingRanges:",  v12,  a4,  0,  a4 == 4,  0x7FFFFFFFFFFFFFFFLL,  0,  0);

  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureTranslator translationService](self, "translationService"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100027E10;
  v21[3] = &unk_100177290;
  v23 = &v24;
  id v15 = v7;
  __int128 v22 = v15;
  [v14 textForBraille:v6 parameters:v13 withReply:v21];

  dispatch_time_t v16 = dispatch_time(0LL, 1000000000LL);
  if (dispatch_group_wait(v15, v16))
  {
    uint64_t v17 = VOTLogBraille();
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_1000F0010((uint64_t)v6);
    }
  }

  id v19 = (id)v25[5];

  _Block_object_dispose(&v24, 8);
  return v19;
}

- (id)brailleForText:(id)a3 mode:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v24 = 0LL;
  v25 = &v24;
  uint64_t v26 = 0x3032000000LL;
  uint64_t v27 = sub_100027DF8;
  __int128 v28 = sub_100027E08;
  id v29 = 0LL;
  unsigned __int8 v7 = dispatch_group_create();
  dispatch_group_enter(v7);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace selectedBrailleGesturesInputTable]);
  id v9 = (__CFString *)objc_claimAutoreleasedReturnValue([v8 tableIdentifier]);
  int v10 = v9;
  if (a4 == 4)
  {

    int v10 = @"nemeth";
  }

  id v11 = objc_alloc(&OBJC_CLASS___BRLTTranslationParameters);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString brl_languageAndVariant](v10, "brl_languageAndVariant"));
  id v13 = objc_msgSend( v11,  "initWithLanguage:mode:partial:useTechnicalTable:textPositionsRange:textFormattingRanges:",  v12,  a4,  0,  a4 == 4,  0x7FFFFFFFFFFFFFFFLL,  0,  0);

  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureTranslator translationService](self, "translationService"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100028084;
  v21[3] = &unk_100177290;
  v23 = &v24;
  id v15 = v7;
  __int128 v22 = v15;
  [v14 brailleForText:v6 parameters:v13 withReply:v21];

  dispatch_time_t v16 = dispatch_time(0LL, 1000000000LL);
  if (dispatch_group_wait(v15, v16))
  {
    uint64_t v17 = VOTLogBraille();
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_1000F0010((uint64_t)v6);
    }
  }

  id v19 = (id)v25[5];

  _Block_object_dispose(&v24, 8);
  return v19;
}

- (VOTBrailleGestureTranslatorDelegate)delegate
{
  return (VOTBrailleGestureTranslatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isActive
{
  return self->_active;
}

- (BOOL)shouldUseContractedBraille
{
  return self->_shouldUseContractedBraille;
}

- (void)setShouldUseContractedBraille:(BOOL)a3
{
  self->_shouldUseContractedBraille = a3;
}

- (BOOL)isUnitTesting
{
  return self->_unitTesting;
}

- (int64_t)typingMode
{
  return self->_typingMode;
}

- (CGSize)keyboardSize
{
  double width = self->_keyboardSize.width;
  double height = self->_keyboardSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setTranslationService:(id)a3
{
}

- (void).cxx_destruct
{
}

@end