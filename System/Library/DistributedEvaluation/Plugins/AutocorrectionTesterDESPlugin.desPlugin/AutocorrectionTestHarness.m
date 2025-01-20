@interface AutocorrectionTestHarness
+ (id)overrideInputMode:(id)a3;
- (AutocorrectionTestHarness)initWithAttributes:(id)a3;
- (BOOL)compareExpectedValue:(id)a3 withResult:(id)a4;
- (BOOL)multilingualEnabled;
- (BOOL)outcomeIsFailureForTest:(id)a3 withResult:(id)a4;
- (BOOL)requiresMaintenance;
- (BOOL)saveDebugData;
- (NSArray)resultClassifiers;
- (NSString)typologyOutpath;
- (TIInputMode)secondaryInputMode;
- (TIKeyboardInputManagerConfig)config;
- (TIKeyboardTyper)testTyper;
- (TITestTyperDriver)dslTestDriver;
- (id)emptyResultForPlayback:(id)a3;
- (id)emptyResultForTest:(id)a3;
- (id)friendId;
- (id)keyboardFromWidth:(id)a3 useDynamicLayout:(BOOL)a4 orientation:(id)a5 keyboardLayout:(id)a6;
- (id)newKeyboardInputManager;
- (id)replayTest:(id)a3 withError:(id)a4;
- (id)runConversationTest:(id)a3 trialID:(unint64_t)a4 withError:(id)a5;
- (id)runTest:(id)a3 trialID:(unint64_t)a4 withError:(id)a5;
- (id)selfId;
- (id)testTerminator;
- (id)typeTest:(id)a3 withError:(id)a4;
- (unsigned)seedForTest:(id)a3 trialID:(unint64_t)a4;
- (void)initializeConversationHistory;
- (void)nullifyConversationHistory;
- (void)reset;
- (void)setSaveDebugData:(BOOL)a3;
- (void)setTypologyOutpath:(id)a3;
- (void)tearDown;
- (void)testConversation:(id)a3 testingSender:(id)a4 warmupMessages:(unint64_t)a5 adaptToSentMessages:(BOOL)a6 adaptToReceivedMessages:(BOOL)a7 trialID:(unint64_t)a8 withError:(id)a9 writingResults:(id)a10;
- (void)trainWithCorpus:(id)a3;
@end

@implementation AutocorrectionTestHarness

- (id)keyboardFromWidth:(id)a3 useDynamicLayout:(BOOL)a4 orientation:(id)a5 keyboardLayout:(id)a6
{
  BOOL v7 = a4;
  id v9 = a5;
  id v10 = a6;
  [a3 floatValue];
  if (!v7)
  {
    float v31 = v11;
    if (v11 >= 320.0)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue( +[TUIKeyboardLayoutFactory sharedKeyboardFactory]( &OBJC_CLASS___TUIKeyboardLayoutFactory,  "sharedKeyboardFactory"));
      char v33 = objc_opt_respondsToSelector(v32, "keyboardPrefixForWidth:andEdge:");

      if ((v33 & 1) != 0)
      {
        id v34 = [v9 isEqualToString:@"Portrait"];
        v35 = (void *)objc_claimAutoreleasedReturnValue( +[TUIKeyboardLayoutFactory sharedKeyboardFactory]( &OBJC_CLASS___TUIKeyboardLayoutFactory,  "sharedKeyboardFactory"));
        v15 = (__CFString *)objc_claimAutoreleasedReturnValue([v35 keyboardPrefixForWidth:v34 andEdge:v31]);

        if (v15) {
          goto LABEL_28;
        }
      }

      if ([v9 isEqualToString:@"Portrait"])
      {
        v36 = @"Wildcat-Portrait";
        v37 = @"iPhone-Portrait";
        if (v31 < 320.0) {
          v37 = 0LL;
        }
        if (v31 < 768.0) {
          v36 = v37;
        }
        if (v31 < 1024.0) {
          v15 = (__CFString *)v36;
        }
        else {
          v15 = @"Wildcat-PortraitFudge";
        }
        goto LABEL_28;
      }

      if ([v9 isEqualToString:@"Landscape"])
      {
        if (v31 >= 1366.0)
        {
          v15 = @"Wildcat-LandscapeFudge";
          goto LABEL_28;
        }

        if (v31 >= 1024.0)
        {
          v15 = @"Wildcat-Landscape";
          goto LABEL_28;
        }

        if (v31 >= 568.0)
        {
          v15 = @"iPhone-Caymen";
          goto LABEL_28;
        }

        if (v31 >= 480.0)
        {
          v15 = @"iPhone-Landscape";
          goto LABEL_28;
        }
      }

      v15 = 0LL;
    }

    else
    {
      v15 = @"iPhone-Portrait";
    }

- (AutocorrectionTestHarness)initWithAttributes:(id)a3
{
  id v6 = a3;
  v174.receiver = self;
  v174.super_class = (Class)&OBJC_CLASS___AutocorrectionTestHarness;
  BOOL v7 = -[AutocorrectionTestHarness init](&v174, "init");

  v173 = v7;
  if (v7)
  {
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v6 valueForKey:@"TYPOLOGY_OUTPATH"]);
    typologyOutpath = v7->_typologyOutpath;
    v7->_typologyOutpath = (NSString *)v8;

    if (v7->_typologyOutpath)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      unsigned __int8 v11 = [v10 createDirectoryAtPath:v7->_typologyOutpath withIntermediateDirectories:1 attributes:0 error:0];

      if ((v11 & 1) == 0)
      {
        NSLog(@"Failure creating TYPOLOGY_OUTPATH %@", v7->_typologyOutpath);
        unsigned int v12 = v7->_typologyOutpath;
        v7->_typologyOutpath = 0LL;
      }
    }

    v13 = objc_alloc_init(&OBJC_CLASS___TIKeyboardInputManagerConfig);
    v165 = v13;
    -[TIKeyboardInputManagerConfig setDisableAnalytics:](v13, "setDisableAnalytics:", 1LL);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v6 valueForKey:@"INPUT_MODE"]);
    v166 = v14;
    if ([v14 containsString:@"sw="])
    {
      id v171 = v14;
    }

    else
    {
      uint64_t SupportedSoftwareKeyboardsForInputModeAndIdiom = UIKeyboardGetSupportedSoftwareKeyboardsForInputModeAndIdiom( v14,  0LL);
      double v16 = (void *)objc_claimAutoreleasedReturnValue(SupportedSoftwareKeyboardsForInputModeAndIdiom);
      double v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectAtIndex:0]);

      uint64_t v18 = UIKeyboardInputModeWithNewSWLayout(v166, v17);
      id v171 = (id)objc_claimAutoreleasedReturnValue(v18);
    }

    double v19 = (__CFString *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"SIRI_MODE"]);
    v20 = v19;
    id v21 = @"NO";
    if (!v19) {
      double v19 = @"NO";
    }
    id v22 = -[__CFString BOOLValue](v19, "BOOLValue");

    v23 = &CFAbsoluteTimeGetCurrent_ptr;
    v170 = (void *)objc_claimAutoreleasedReturnValue( +[TIInputMode inputModeWithIdentifier:isSiriMode:]( &OBJC_CLASS___TIInputMode,  "inputModeWithIdentifier:isSiriMode:",  v171,  v22));
    double v24 = (void *)objc_claimAutoreleasedReturnValue([v170 normalizedIdentifier]);
    uint64_t v25 = TIGetInputModeProperties();
    v172 = (void *)objc_claimAutoreleasedReturnValue(v25);

    double v26 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"USE_LANGUAGE_MODEL"]);
    double v27 = v26;
    if (!v26) {
      double v27 = (void *)objc_claimAutoreleasedReturnValue([v172 objectForKey:TIInputModePropertiesHasWordNgramModel]);
    }
    -[TIKeyboardInputManagerConfig setUsesWordNgramModel:]( v13,  "setUsesWordNgramModel:",  [v27 BOOLValue]);
    if (!v26) {

    }
    if (-[TIKeyboardInputManagerConfig usesWordNgramModel](v13, "usesWordNgramModel")
      && (objc_opt_respondsToSelector(v170, "keyboardFeatureSpecializationClassFromInputModeProperties") & 1) != 0
      && ![v170 keyboardFeatureSpecializationClassFromInputModeProperties])
    {
      [v170 setQuickTypeKeyboardFeatureSpecializationClass];
    }

    v28 = (void *)objc_claimAutoreleasedReturnValue( +[AutocorrectionTestHarness overrideInputMode:]( &OBJC_CLASS___AutocorrectionTestHarness,  "overrideInputMode:",  v170));
    -[TIKeyboardInputManagerConfig setInputMode:](v13, "setInputMode:", v28);

    id v29 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardInputManagerConfig inputMode](v13, "inputMode"));
    -[TIKeyboardInputManagerConfig setAllowsSpaceCorrections:]( v13,  "setAllowsSpaceCorrections:",  [v29 spaceAutocorrectionEnabled]);

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardInputManagerConfig inputMode](v13, "inputMode"));
    -[TIKeyboardInputManagerConfig setUsesETSRescoring:]( v13,  "setUsesETSRescoring:",  [v30 typedStringLMRankingEnabled]);

    float v31 = (void *)objc_claimAutoreleasedReturnValue([v172 objectForKey:TIInputModePropertiesAutocorrectSpellingKey]);
    -[TIKeyboardInputManagerConfig setUsesTextChecker:](v13, "setUsesTextChecker:", [v31 BOOLValue]);

    v32 = (__CFString *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"USE_RETROCORRECTION"]);
    char v33 = v32;
    if (!v32) {
      v32 = @"NO";
    }
    -[TIKeyboardInputManagerConfig setUsesRetrocorrection:]( v13,  "setUsesRetrocorrection:",  -[__CFString BOOLValue](v32, "BOOLValue"));

    id v34 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"WORD_LEARNING_ENABLED"]);
    if ([v34 BOOLValue])
    {
      id v35 = &dword_0 + 1;
    }

    else
    {
      v36 = (__CFString *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"USES_ADAPTATION"]);
      v3 = v36;
      if (!v36)
      {
        v36 = (__CFString *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"USE_WORD_NGRAM_MODEL_ADAPTATION"]);
        v4 = v36;
        if (!v36) {
          v36 = @"NO";
        }
      }

      id v35 = -[__CFString BOOLValue](v36, "BOOLValue");
      if (!v3) {
    }
      }

    if ((objc_opt_respondsToSelector(v13, "usesAdaptation") & 1) != 0)
    {
      -[TIKeyboardInputManagerConfig setUsesAdaptation:](v13, "setUsesAdaptation:", v35);
    }

    else if ((objc_opt_respondsToSelector(v13, "usesWordNgramModelAdaptation") & 1) != 0)
    {
      -[TIKeyboardInputManagerConfig setUsesWordNgramModelAdaptation:](v13, "setUsesWordNgramModelAdaptation:", v35);
    }

    v37 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"NEGATIVE_LEARNING_ENABLED"]);
    -[TIKeyboardInputManagerConfig setNegativeLearningDisabled:]( v13,  "setNegativeLearningDisabled:",  [v37 BOOLValue] ^ 1);

    v38 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"MAX_WORDS_PER_PREDICTION"]);
    v39 = v38;
    if (!v38) {
      v38 = &off_8FEA0;
    }
    -[TIKeyboardInputManagerConfig setMaxWordsPerPrediction:]( v13,  "setMaxWordsPerPrediction:",  [v38 integerValue]);

    if ((objc_opt_respondsToSelector(v13, "usesCustomStaticDictionary") & 1) != 0)
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"CUSTOM_STATIC_DICTIONARY_PATH"]);
      -[TIKeyboardInputManagerConfig setUsesCustomStaticDictionary:](v13, "setUsesCustomStaticDictionary:", v40 != 0LL);
    }

    v41 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"CUSTOM_STATIC_DICTIONARY_PATH"]);
    -[TIKeyboardInputManagerConfig setStaticDictionaryPath:](v13, "setStaticDictionaryPath:", v41);

    if ((objc_opt_respondsToSelector(v13, "usesCustomNgramModel") & 1) != 0)
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"CUSTOM_LANGUAGE_MODEL_PATH"]);
      -[TIKeyboardInputManagerConfig setUsesCustomNgramModel:](v13, "setUsesCustomNgramModel:", v42 != 0LL);
    }

    v43 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"CUSTOM_LANGUAGE_MODEL_PATH"]);
    v44 = v43;
    if (!v43)
    {
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue(-[TIKeyboardInputManagerConfig inputMode](v13, "inputMode"));
      id v21 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString languageWithRegion](v3, "languageWithRegion"));
      uint64_t v45 = TINgramModelPathForInputMode();
      v44 = (void *)objc_claimAutoreleasedReturnValue(v45);
    }

    -[TIKeyboardInputManagerConfig setNgramModelPath:](v13, "setNgramModelPath:", v44);
    if (!v43)
    {
    }

    v46 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"CUSTOM_DYNAMIC_RESOURCE_PATH"]);
    v47 = v46;
    if (!v46)
    {
      uint64_t v48 = UIKeyboardUserDirectory();
      v47 = (void *)objc_claimAutoreleasedReturnValue(v48);
    }

    -[TIKeyboardInputManagerConfig setDynamicResourcePath:](v13, "setDynamicResourcePath:", v47);
    if (!v46) {

    }
    v49 = (__CFString *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"CUSTOM_SHAPE_STORE_DIR"]);
    v50 = v49;
    if (!v49) {
      v50 = (__CFString *)objc_claimAutoreleasedReturnValue(-[TIKeyboardInputManagerConfig dynamicResourcePath](v13, "dynamicResourcePath"));
    }
    -[TIKeyboardInputManagerConfig setShapeStoreResourceDir:](v13, "setShapeStoreResourceDir:", v50);
    if (!v49) {

    }
    if ((objc_opt_respondsToSelector(v13, "setUsesStemSuffixCorrectionFactor:") & 1) != 0)
    {
      v51 = (void *)objc_claimAutoreleasedReturnValue([v172 objectForKey:TIInputModePropertiesUseStemSuffixCorrectionFactorKey]);
      -[TIKeyboardInputManagerConfig setUsesStemSuffixCorrectionFactor:]( v13,  "setUsesStemSuffixCorrectionFactor:",  [v51 BOOLValue]);
    }

    uint64_t v52 = objc_claimAutoreleasedReturnValue([v6 objectForKey:@"FAVONIUS_LANGUAGE_MODEL_WEIGHT"]);
    uint64_t v53 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v52, v53) & 1) != 0)
    {
      v168 = (void *)v52;
      v54 = objc_alloc_init(&OBJC_CLASS___NSNumberFormatter);
      -[NSNumberFormatter setNumberStyle:](v54, "setNumberStyle:", 1LL);
      v50 = (__CFString *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"FAVONIUS_LANGUAGE_MODEL_WEIGHT"]);
      uint64_t v52 = objc_claimAutoreleasedReturnValue(-[NSNumberFormatter numberFromString:](v54, "numberFromString:", v50));
    }

    if (v52)
    {
      uint64_t v55 = objc_opt_class(&OBJC_CLASS___NSNumber);
      if ((objc_opt_isKindOfClass(v52, v55) & 1) != 0
        && (objc_opt_respondsToSelector(v13, "favoniusLanguageModelWeight") & 1) != 0)
      {
        -[TIKeyboardInputManagerConfig setFavoniusLanguageModelWeight:](v13, "setFavoniusLanguageModelWeight:", v52);
      }
    }

    v169 = (void *)v52;
    uint64_t v56 = objc_claimAutoreleasedReturnValue([v6 objectForKey:@"MLTT_BUNDLE_URL"]);
    v164 = (void *)v56;
    uint64_t v57 = objc_opt_class(&OBJC_CLASS___NSURL);
    if ((objc_opt_isKindOfClass(v56, v57) & 1) != 0) {
      -[TIKeyboardInputManagerConfig setMlttBundleURL:](v13, "setMlttBundleURL:", v56);
    }
    -[TIKeyboardInputManagerConfig setTesting:](v13, "setTesting:", 1LL);
    -[TIKeyboardInputManagerConfig setUsesUserModelLogging:](v13, "setUsesUserModelLogging:", 0LL);
    -[TIKeyboardInputManagerConfig setStickerSuggestionsEnabled:](v13, "setStickerSuggestionsEnabled:", 0LL);
    objc_storeStrong((id *)&v7->_config, v13);
    v58 = (__CFString *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"MAX_PREDICTIONS"]);
    v59 = v58;
    if (!v58)
    {
      v58 = (__CFString *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"SIZE_OF_AUTOCORRECTION_LIST"]);
      v50 = v58;
      if (!v58) {
        v58 = @"3";
      }
    }

    signed int v60 = -[__CFString intValue](v58, "intValue");
    if (!v59) {

    }
    v61 = (void *)objc_claimAutoreleasedReturnValue([v172 objectForKey:TIInputModePropertiesSupportsMultilingual]);
    unsigned int v62 = [v61 BOOLValue];

    if (v62)
    {
      v63 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"MULTILINGUAL_ENABLED"]);
      v64 = v63;
      if (!v63) {
        v63 = &__kCFBooleanFalse;
      }
      v173->_multilingualEnabled = [v63 BOOLValue];
    }

    else
    {
      v173->_multilingualEnabled = 0;
    }

    v167 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"KEYBOARD_SECOND_LANGUAGE"]);
    if ([v167 length])
    {
      uint64_t v65 = objc_claimAutoreleasedReturnValue(+[TIInputMode inputModeWithIdentifier:](&OBJC_CLASS___TIInputMode, "inputModeWithIdentifier:", v167));
      secondaryInputMode = v173->_secondaryInputMode;
      v173->_secondaryInputMode = (TIInputMode *)v65;
    }

    v67 = -[TIKeyboardTyper initWithInputMode:](objc_alloc(&OBJC_CLASS___TIKeyboardTyper), "initWithInputMode:", v170);
    v68 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"BAD_SENTENCES_FILE_PATH"]);
    v69 = (void *)objc_claimAutoreleasedReturnValue([v68 stringValue]);
    -[TIKeyboardTyper setBadSentenceLogFilePath:](v67, "setBadSentenceLogFilePath:", v69);

    -[TIKeyboardTyper setInputModeIdentifier:](v67, "setInputModeIdentifier:", v171);
    v70 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"PRINT_TYPING_TRANSCRIPT"]);
    -[TIKeyboardTyper setPrintTypingTranscript:](v67, "setPrintTypingTranscript:", [v70 BOOLValue]);

    v71 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"SHOW_CANDIDATE_BAR"]);
    -[TIKeyboardTyper setShowsCandidateBar:](v67, "setShowsCandidateBar:", [v71 BOOLValue]);

    v72 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"TRANSLITERATION_SUMMARIES"]);
    -[TIKeyboardTyper setPrintTranslitSummaries:](v67, "setPrintTranslitSummaries:", [v72 BOOLValue]);

    v73 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"TEST_AUTO_FILL_FEATURE"]);
    LODWORD(v69) = [v73 BOOLValue];

    v74 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](v67, "keyboardController"));
    if ((_DWORD)v69) {
      [v74 setIsScreenLocked:0];
    }
    else {
      [v74 setIsScreenLocked:v35 ^ 1];
    }

    uint64_t v75 = objc_claimAutoreleasedReturnValue([v6 objectForKey:@"USE_LANGUAGE_MODEL"]);
    v76 = (void *)v75;
    if (v75)
    {
      int v77 = 0;
      int v78 = 0;
      v79 = (void *)v75;
    }

    else
    {
      uint64_t v80 = objc_claimAutoreleasedReturnValue([v6 objectForKey:@"USE_PREDICTION"]);
      v74 = (void *)v80;
      if (v80)
      {
        int v77 = 0;
        int v78 = 0;
        v79 = (void *)v80;
      }

      else
      {
        uint64_t v81 = objc_claimAutoreleasedReturnValue([v6 objectForKey:@"AUTOCORRECTION_LISTS"]);
        v23 = (CFAbsoluteTime (**)(void))v81;
        if (v81)
        {
          v74 = 0LL;
          int v78 = 0;
          int v77 = 1;
          v79 = (void *)v81;
        }

        else
        {
          v79 = (void *)objc_claimAutoreleasedReturnValue([v172 objectForKey:TIInputModePropertiesEnablePrediction]);
          v74 = 0LL;
          v23 = 0LL;
          int v77 = 1;
          int v78 = 1;
        }
      }
    }

    unsigned int v82 = [v79 BOOLValue];
    if (v78) {

    }
    if (v77) {
    if (!v76)
    }

    if (v82) {
      -[TIKeyboardTyper setUsesPrediction:](v67, "setUsesPrediction:", 1LL);
    }
    -[TIKeyboardTyper setMaxPredictions:](v67, "setMaxPredictions:", v60);
    -[TIKeyboardTyper setKeyboardInputManagerFactory:](v67, "setKeyboardInputManagerFactory:", v173);
    v83 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"USE_AUTOCORRECTION"]);
    v84 = v83;
    if (!v83) {
      v83 = &__kCFBooleanTrue;
    }
    -[TIKeyboardTyper setUsesAutocorrection:](v67, "setUsesAutocorrection:", [v83 BOOLValue]);

    v85 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"USE_AUTOCAPITALIZATION"]);
    v86 = v85;
    if (!v85) {
      v85 = &__kCFBooleanTrue;
    }
    -[TIKeyboardTyper setUsesAutocapitalization:](v67, "setUsesAutocapitalization:", [v85 BOOLValue]);

    v87 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"WORD_LEARNING_ENABLED"]);
    -[TIKeyboardTyper setWordLearningEnabled:](v67, "setWordLearningEnabled:", [v87 BOOLValue]);

    v88 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"WARN_IF_SELECTING_POPUP_VARIANT"]);
    v89 = v88;
    if (!v88) {
      v88 = &__kCFBooleanFalse;
    }
    -[TIKeyboardTyper setWarnIfSelectingPopupVariant:]( v67,  "setWarnIfSelectingPopupVariant:",  [v88 BOOLValue]);

    v90 = (__CFString *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"MAX_PREDICTIONS_REPORTED"]);
    v91 = v90;
    if (!v90) {
      v90 = @"0";
    }
    -[TIKeyboardTyper setMaxPredictionsReported:]( v67,  "setMaxPredictionsReported:",  -[__CFString intValue](v90, "intValue"));

    v92 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"LOG_DOCUMENT_CONTEXT"]);
    v93 = v92;
    if (!v92) {
      v92 = &__kCFBooleanFalse;
    }
    -[TIKeyboardTyper setLogDocumentContext:](v67, "setLogDocumentContext:", [v92 BOOLValue]);

    v94 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"CONTINUOUS_PATH_ENABLED"]);
    v95 = v94;
    if (!v94) {
      v94 = &__kCFBooleanTrue;
    }
    id v96 = [v94 BOOLValue];

    v97 = (void *)objc_claimAutoreleasedReturnValue(-[AutocorrectionTestHarness config](v173, "config"));
    char v98 = objc_opt_respondsToSelector(v97, "usesContinuousPath");

    if ((v98 & 1) != 0)
    {
      v99 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"CONTINUOUS_PATH_APPEND_SPACE"]);
      v100 = v99;
      if (!v99) {
        v99 = &__kCFBooleanFalse;
      }
      -[TIKeyboardTyper setInsertsSpaceAfterPredictiveInput:]( v67,  "setInsertsSpaceAfterPredictiveInput:",  [v99 BOOLValue]);

      v101 = (void *)objc_claimAutoreleasedReturnValue(-[AutocorrectionTestHarness config](v173, "config"));
      [v101 setUsesContinuousPath:v96];

      uint64_t v102 = objc_claimAutoreleasedReturnValue(-[AutocorrectionTestHarness config](v173, "config"));
      [(id)v102 setUsesCJContinuousPath:v96];

      v103 = (void *)objc_claimAutoreleasedReturnValue(-[AutocorrectionTestHarness config](v173, "config"));
      LOBYTE(v102) = objc_opt_respondsToSelector(v103, "continuousPathEnabledAlgorithms");

      if ((v102 & 1) != 0)
      {
        v104 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"CONTINUOUS_PATH_ALGORITHMS"]);
        v105 = v104;
        if (!v104) {
          v104 = &off_8FEB8;
        }
        id v106 = [v104 intValue];
        v107 = (void *)objc_claimAutoreleasedReturnValue(-[AutocorrectionTestHarness config](v173, "config"));
        [v107 setContinuousPathEnabledAlgorithms:v106];
      }

      v108 = (void *)objc_claimAutoreleasedReturnValue(-[AutocorrectionTestHarness config](v173, "config"));
      char v109 = objc_opt_respondsToSelector(v108, "usesContinuousPathRetrocorrection");

      if ((v109 & 1) != 0)
      {
        v110 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"ENABLE_CONTINUOUS_PATH_RETROCORRECTION"]);
        v111 = v110;
        if (!v110) {
          v110 = &__kCFBooleanTrue;
        }
        id v112 = [v110 BOOLValue];
        v113 = (void *)objc_claimAutoreleasedReturnValue(-[AutocorrectionTestHarness config](v173, "config"));
        [v113 setUsesContinuousPathRetrocorrection:v112];
      }

      v114 = (void *)objc_claimAutoreleasedReturnValue(-[AutocorrectionTestHarness config](v173, "config"));
      char v115 = objc_opt_respondsToSelector(v114, "cpCandidatesCount");

      if ((v115 & 1) != 0)
      {
        v116 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"CONTINUOUS_PATH_NUM_CANDIDATE_RESCORED_BY_LM"]);
        v117 = v116;
        if (!v116) {
          v116 = &off_8FED0;
        }
        id v118 = [v116 integerValue];
        v119 = (void *)objc_claimAutoreleasedReturnValue(-[AutocorrectionTestHarness config](v173, "config"));
        [v119 setCpCandidatesCount:v118];
      }

      v120 = (void *)objc_claimAutoreleasedReturnValue([v172 objectForKey:TIInputModePropertiesContinuousPathParametersKey]);
      v121 = (void *)objc_claimAutoreleasedReturnValue(-[AutocorrectionTestHarness config](v173, "config"));
      [v121 setContinuousPathParams:v120];

      v122 = (void *)objc_claimAutoreleasedReturnValue([v172 objectForKey:TIInputModePropertiesContinuousPathEnsembleSourceWeightsKey]);
      v123 = (void *)objc_claimAutoreleasedReturnValue(-[AutocorrectionTestHarness config](v173, "config"));
      [v123 setContinuousPathEnsembleSourceWeights:v122];

      v124 = (void *)objc_claimAutoreleasedReturnValue([v172 objectForKey:TIInputModePropertiesContinuousPathEnsembleSourceScalesKey]);
      v125 = (void *)objc_claimAutoreleasedReturnValue(-[AutocorrectionTestHarness config](v173, "config"));
      [v125 setContinuousPathEnsembleSourceScales:v124];
    }

    v126 = (void *)objc_claimAutoreleasedReturnValue( +[ACTUserActionStreamFactory userActionStreamWithParameters:delegate:]( &OBJC_CLASS___ACTUserActionStreamFactory,  "userActionStreamWithParameters:delegate:",  v6,  v67));
    -[TIKeyboardTyper linkWithUserActionStream:](v67, "linkWithUserActionStream:", v126);

    v127 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper userModel](v67, "userModel"));
    -[TIKeyboardTyper setUsesTransliteration:]( v67,  "setUsesTransliteration:",  [v127 prefersTransliteration]);

    uint64_t InputModeKBStarLayout = UIKeyboardGetInputModeKBStarLayout(v171);
    v129 = (void *)objc_claimAutoreleasedReturnValue(InputModeKBStarLayout);
    v130 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"TTKKeyboardPlane"]);
    uint64_t v131 = objc_opt_class(&OBJC_CLASS___TTKSimpleKeyboardPlane);
    if ((objc_opt_isKindOfClass(v130, v131) & 1) != 0)
    {
      v132 = (TTKSimpleKeyboardPlane *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](v67, "keyboardController"));
      -[TTKSimpleKeyboardPlane setTtkLayout:](v132, "setTtkLayout:", v130);
    }

    else
    {
      uint64_t v133 = objc_opt_class(&OBJC_CLASS___NSDictionary);
      if ((objc_opt_isKindOfClass(v130, v133) & 1) != 0)
      {
        v132 = -[TTKSimpleKeyboardPlane initWithJsonDictionary:]( objc_alloc(&OBJC_CLASS___TTKSimpleKeyboardPlane),  "initWithJsonDictionary:",  v130);
        v134 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](v67, "keyboardController"));
        [v134 setTtkLayout:v132];
      }

      else
      {
        v132 = (TTKSimpleKeyboardPlane *)objc_claimAutoreleasedReturnValue([v130 description]);
        NSLog( @"TTKKeyboardPlane parameter was provided, but was neither a TTKSimpleKeyboardPlane nor a Dictionary of keys. Value was %@",  v132);
      }
    }

    v135 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"USE_DYNAMIC_LAYOUT"]);
    v136 = v135;
    if (!v135) {
      v135 = &__kCFBooleanFalse;
    }
    id v137 = [v135 BOOLValue];

    v138 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"KEYBOARD_WIDTH"]);
    uint64_t v139 = objc_claimAutoreleasedReturnValue([v6 objectForKey:@"KEYBOARD_ORIENTATION"]);
    v140 = (void *)v139;
    if (v138) {
      v141 = v138;
    }
    else {
      v141 = &off_8FEE8;
    }
    if (v139) {
      v142 = (const __CFString *)v139;
    }
    else {
      v142 = @"Portrait";
    }
    v143 = (void *)objc_claimAutoreleasedReturnValue( -[AutocorrectionTestHarness keyboardFromWidth:useDynamicLayout:orientation:keyboardLayout:]( v173,  "keyboardFromWidth:useDynamicLayout:orientation:keyboardLayout:",  v141,  v137,  v142,  v129));
    -[TIKeyboardTyper setKeyboard:](v67, "setKeyboard:", v143);

    v144 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"PERSONA"]);
    if (v144)
    {
      v145 = objc_alloc(&OBJC_CLASS___TITestUserPersona);
      v146 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"PERSONA"]);
      v147 = -[TITestUserPersona initWithPersonaName:](v145, "initWithPersonaName:", v146);
      -[TIKeyboardTyper setUserPersona:](v67, "setUserPersona:", v147);

      v148 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper userPersona](v67, "userPersona"));
      v149 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyplane](v67, "keyplane"));
      [v148 updateFromKeyplane:v149];
    }

    else
    {
      -[TIKeyboardTyper setUserPersona:](v67, "setUserPersona:", 0LL);
    }

    v150 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper userPersona](v67, "userPersona"));

    if (!v150)
    {
      v151 = (void *)objc_claimAutoreleasedReturnValue( +[TIErrorGenerator errorGeneratorWithAttributes:]( &OBJC_CLASS___TIErrorGenerator,  "errorGeneratorWithAttributes:",  v6));
      if (!v151)
      {
        NSLog(@"Unable to construct generator from attrs.");
        exit(1);
      }

      -[TIKeyboardTyper setErrorGenerator:](v67, "setErrorGenerator:", v151);
    }

    -[TIKeyboardTyper reset](v67, "reset");
    dslTestDriver = v173->_dslTestDriver;
    v173->_dslTestDriver = 0LL;

    objc_storeStrong((id *)&v173->_testTyper, v67);
    v153 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    insertedText = v173->_insertedText;
    v173->_insertedText = v153;

    v155 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    resultClassifiers = v173->_resultClassifiers;
    v173->_resultClassifiers = v155;

    -[AutocorrectionTestHarness setResultClassifiers](v173, "setResultClassifiers");
    v157 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"SAVE_DEBUG_DATA"]);
    v158 = v157;
    if (!v157) {
      v157 = &__kCFBooleanFalse;
    }
    v173->_saveDebugData = [v157 BOOLValue];

    v159 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"RUN_DSL_TEST"]);
    if (v159)
    {
      v160 = -[TITestTyperDriver initWithTestTyper:]( objc_alloc(&OBJC_CLASS___TITestTyperDriver),  "initWithTestTyper:",  v67);
      v161 = v173->_dslTestDriver;
      v173->_dslTestDriver = v160;
    }
  }

  v162 = v173;

  return v162;
}

+ (id)overrideInputMode:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 languageWithRegion]);
  unsigned int v5 = [v4 hasPrefix:@"ars"];

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 languageWithRegion]);
    NSLog(@"Override %@ input mode identifier with the ar", v6);

    id v7 = (id)objc_claimAutoreleasedReturnValue( +[TIInputMode inputModeWithIdentifier:]( &OBJC_CLASS___TIInputMode,  "inputModeWithIdentifier:",  @"ar"));
  }

  else
  {
    id v7 = v3;
  }

  uint64_t v8 = v7;

  return v8;
}

- (id)newKeyboardInputManager
{
  if (-[AutocorrectionTestHarness multilingualEnabled](self, "multilingualEnabled")
    && (id v3 = (void *)objc_claimAutoreleasedReturnValue(-[AutocorrectionTestHarness config](self, "config")),
        v4 = (void *)objc_claimAutoreleasedReturnValue([v3 inputMode]),
        unsigned int v5 = [v4 isSiriMode],
        v4,
        v3,
        !v5))
  {
    v39 = objc_alloc_init(&OBJC_CLASS___TIDynamicLanguageLikelihoodModel);
    unsigned int v12 = objc_alloc(&OBJC_CLASS___TIMultilingualPreferenceOverrides);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[AutocorrectionTestHarness secondaryInputMode](self, "secondaryInputMode"));
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[AutocorrectionTestHarness config](self, "config"));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 inputMode]);
    v41 = v15;
    double v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v41, 1LL));
    double v17 = (void *)objc_claimAutoreleasedReturnValue(-[AutocorrectionTestHarness config](self, "config"));
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 inputMode]);
    double v19 = (void *)objc_claimAutoreleasedReturnValue([v18 languageWithRegion]);
    v40 = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v40, 1LL));
    id v21 = -[TIMultilingualPreferenceOverrides initWithPreferredSecondaryInputMode:userEnabledInputModes:userPreferredLanguages:]( v12,  "initWithPreferredSecondaryInputMode:userEnabledInputModes:userPreferredLanguages:",  v13,  v16,  v20);

    id v22 = [[TILanguageSelectionController alloc] initWithLanguageLikelihoodModel:v39 preferenceProvider:v21];
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[AutocorrectionTestHarness config](self, "config"));
    double v24 = (void *)objc_claimAutoreleasedReturnValue([v23 inputMode]);
    uint64_t v25 = (objc_class *)[v24 multilingualInputManagerClass];

    id v26 = objc_alloc(v25);
    double v27 = (void *)objc_claimAutoreleasedReturnValue(-[AutocorrectionTestHarness config](self, "config"));
    id v11 = [v26 initWithConfig:v27 keyboardState:0 languageSelectionController:v22];

    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    [v11 setTestingStateObject:v28];
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[AutocorrectionTestHarness config](self, "config"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 inputMode]);
    uint64_t v8 = (objc_class *)[v7 inputManagerClass];

    id v9 = objc_alloc(v8);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[AutocorrectionTestHarness config](self, "config"));
    id v11 = [v9 initWithConfig:v10 keyboardState:0];
  }

  id v29 = (void *)objc_claimAutoreleasedReturnValue(-[AutocorrectionTestHarness typologyOutpath](self, "typologyOutpath", v39));
  BOOL v30 = v29 == 0LL;

  if (!v30)
  {
    id v31 = objc_alloc(&OBJC_CLASS___TITypologyPreferencesEnabledForTesting);
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[AutocorrectionTestHarness typologyOutpath](self, "typologyOutpath"));
    id v33 = [v31 initWithOutputPath:v32];
    [v11 setTypologyPreferences:v33];

    id v34 = objc_alloc(&OBJC_CLASS___TIKeyboardInputManagerLogger);
    id v35 = (void *)objc_claimAutoreleasedReturnValue([v11 typologyPreferences]);
    id v36 = [v34 initWithTypologyPreferences:v35];

    [v11 setInputManagerLogger:v36];
    v37 = (void *)objc_claimAutoreleasedReturnValue([v11 configurationPropertyList]);
    [v36 setConfig:v37];
  }

  return v11;
}

- (id)testTerminator
{
  return @" ";
}

- (id)replayTest:(id)a3 withError:(id)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[TITypingLog typingLogWithDebug:]( &OBJC_CLASS___TITypingLog,  "typingLogWithDebug:",  self->_saveDebugData));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[AutocorrectionTestHarness testTyper](self, "testTyper"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 intended]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 expected]);
  [v7 attemptToTypeIntended:v8 expected:v9 typingLog:v6];

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[AutocorrectionTestHarness testTyper](self, "testTyper"));
  [v10 commitText];

  return v6;
}

- (id)typeTest:(id)a3 withError:(id)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[TITypingLog typingLogWithDebug:]( &OBJC_CLASS___TITypingLog,  "typingLogWithDebug:",  self->_saveDebugData));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[AutocorrectionTestHarness testTyper](self, "testTyper"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 input]);
  [v7 attemptToTypeText:v8 typingLog:v6];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[AutocorrectionTestHarness testTyper](self, "testTyper"));
  [v9 commitText];

  return v6;
}

- (id)emptyResultForTest:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___AutocorrectionResult);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[AutocorrectionTestHarness testTyper](self, "testTyper"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 input]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 tokensForString:v7]);
  -[AutocorrectionResult setInput:](v5, "setInput:", v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[AutocorrectionTestHarness testTyper](self, "testTyper"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 userModel]);
  if ([v10 prefersContinuousPath])
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[AutocorrectionTestHarness config](self, "config"));
    unsigned int v12 = [v11 usesContinuousPath];

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[AutocorrectionTestHarness testTyper](self, "testTyper"));
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v4 input]);
      v15 = (void *)objc_claimAutoreleasedReturnValue([v13 tokensForString:v14]);

      id v16 = [v15 count];
      double v17 = v15;
      if (!v16) {
        double v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithObject:]( &OBJC_CLASS___NSMutableArray,  "arrayWithObject:",  &stru_89E80));
      }
      -[AutocorrectionResult setIntended:](v5, "setIntended:", v17);
      if (!v16)
      {
LABEL_12:

        goto LABEL_14;
      }

      goto LABEL_14;
    }
  }

  else
  {
  }

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v4 expectedOutput]);
  id v19 = [v18 count];

  if ((unint64_t)v19 < 2)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue([v4 expectedOutput]);
    id v21 = (char *)[v20 count];

    if (v21 != (_BYTE *)&dword_0 + 1)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](&OBJC_CLASS___NSMutableArray, "arrayWithObject:", &stru_89E80));
      -[AutocorrectionResult setIntended:](v5, "setIntended:", v15);
      goto LABEL_14;
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[AutocorrectionTestHarness testTyper](self, "testTyper"));
    double v17 = (void *)objc_claimAutoreleasedReturnValue([v4 expectedOutput]);
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v17 firstObject]);
    v23 = (void *)objc_claimAutoreleasedReturnValue([v15 tokensForString:v22]);
    -[AutocorrectionResult setIntended:](v5, "setIntended:", v23);

    goto LABEL_12;
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue([v4 expectedOutput]);
  -[AutocorrectionResult setIntended:](v5, "setIntended:", v15);
LABEL_14:

  double v24 = (void *)objc_claimAutoreleasedReturnValue([v4 corpusId]);
  -[AutocorrectionResult setCorpusId:](v5, "setCorpusId:", v24);

  return v5;
}

- (id)emptyResultForPlayback:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___AutocorrectionResult);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 intended]);
  -[AutocorrectionResult setInput:](v4, "setInput:", v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 intended]);
  -[AutocorrectionResult setIntended:](v4, "setIntended:", v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 corpusId]);
  -[AutocorrectionResult setCorpusId:](v4, "setCorpusId:", v7);

  return v4;
}

- (unsigned)seedForTest:(id)a3 trialID:(unint64_t)a4
{
  int v4 = a4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a3 input]);
  id v6 = (char *)[v5 length];
  if (v6)
  {
    id v7 = 0LL;
    unsigned int v8 = 5381;
    do
      unsigned int v8 = 33 * v8 + [v5 characterAtIndex:v7++];
    while (v6 != v7);
    int v9 = 33 * v8;
  }

  else
  {
    int v9 = 177573;
  }

  unsigned int v10 = v9 + v4;

  return v10;
}

- (id)friendId
{
  return @"mailto:friend@apple.com";
}

- (id)selfId
{
  return @"mailto:self@apple.com";
}

- (void)initializeConversationHistory
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[AutocorrectionTestHarness friendId](self, "friendId"));
  id v9 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v3));

  int v4 = (void *)objc_claimAutoreleasedReturnValue(-[AutocorrectionTestHarness selfId](self, "selfId"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v4));

  id v6 = -[TIInputContextHistory initWithRecipientIdentifiers:senderIdentifiers:]( objc_alloc(&OBJC_CLASS___TIInputContextHistory),  "initWithRecipientIdentifiers:senderIdentifiers:",  v9,  v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[AutocorrectionTestHarness testTyper](self, "testTyper"));
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 keyboardController]);
  [v8 setInputContextHistory:v6];
}

- (void)nullifyConversationHistory
{
  id v3 = objc_alloc(&OBJC_CLASS___TIInputContextHistory);
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", @"mailto:null@apple.com"));
  int v4 = -[TIInputContextHistory initWithRecipientIdentifiers:](v3, "initWithRecipientIdentifiers:");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[AutocorrectionTestHarness testTyper](self, "testTyper"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 keyboardController]);
  [v6 setInputContextHistory:v4];

  id v8 = (id)objc_claimAutoreleasedReturnValue(-[AutocorrectionTestHarness testTyper](self, "testTyper"));
  [v8 syncToEmptyDocument];
}

- (void)testConversation:(id)a3 testingSender:(id)a4 warmupMessages:(unint64_t)a5 adaptToSentMessages:(BOOL)a6 adaptToReceivedMessages:(BOOL)a7 trialID:(unint64_t)a8 withError:(id)a9 writingResults:(id)a10
{
  BOOL v34 = a6;
  BOOL v35 = a7;
  id v12 = a3;
  id v39 = a4;
  id v31 = a9;
  id v32 = a10;
  -[AutocorrectionTestHarness initializeConversationHistory](self, "initializeConversationHistory");
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  id obj = v12;
  id v13 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v13)
  {
    int v14 = 0;
    uint64_t v15 = *(void *)v41;
    do
    {
      id v16 = 0LL;
      uint64_t v38 = v14;
      unint64_t v33 = v14 - a5;
      do
      {
        if (*(void *)v41 != v15) {
          objc_enumerationMutation(obj);
        }
        double v17 = *(void **)(*((void *)&v40 + 1) + 8LL * (void)v16);
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 senderId]);
        unsigned int v19 = [v18 isEqualToString:v39];

        if (!v19)
        {
          if (!v35) {
            goto LABEL_14;
          }
          double v24 = (void *)objc_claimAutoreleasedReturnValue(-[AutocorrectionTestHarness testTyper](self, "testTyper"));
          uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 keyboardController]);
          id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 inputContextHistory]);
          double v27 = (void *)objc_claimAutoreleasedReturnValue([v17 text]);
          v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
          id v29 = (void *)objc_claimAutoreleasedReturnValue(-[AutocorrectionTestHarness friendId](self, "friendId"));
          [v26 addTextEntry:v27 timestamp:v28 senderIdentifier:v29];
          goto LABEL_13;
        }

        if ((unint64_t)v16 + v38 >= a5)
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[AutocorrectionTestHarness testTyper](self, "testTyper"));
          [v20 syncToEmptyDocument];

          TIDispatchWaitForAllBlocks();
          id v21 = (void *)objc_claimAutoreleasedReturnValue([v17 text]);
          id v22 = (void *)objc_claimAutoreleasedReturnValue(+[AutocorrectionTest testWithInput:](&OBJC_CLASS___AutocorrectionTest, "testWithInput:", v21));

          v23 = (void *)objc_claimAutoreleasedReturnValue( -[AutocorrectionTestHarness runTest:trialID:withError:]( self,  "runTest:trialID:withError:",  v22,  a8,  v31));
          [v32 setObject:v23 atIndexedSubscript:(char *)v16 + v33];
        }

        if (v34)
        {
          double v24 = (void *)objc_claimAutoreleasedReturnValue(-[AutocorrectionTestHarness testTyper](self, "testTyper"));
          uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 keyboardController]);
          id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 inputContextHistory]);
          double v27 = (void *)objc_claimAutoreleasedReturnValue([v17 text]);
          v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
          id v29 = (void *)objc_claimAutoreleasedReturnValue(-[AutocorrectionTestHarness selfId](self, "selfId"));
          [v26 addTextEntry:v27 timestamp:v28 senderIdentifier:v29];
LABEL_13:
        }

- (id)runConversationTest:(id)a3 trialID:(unint64_t)a4 withError:(id)a5
{
  id v8 = a3;
  id v24 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 conversation]);
  unsigned int v10 = [v9 count];
  id v11 = [v8 warmupMessages];

  uint64_t v25 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", v10 - v11);
  if (v10 != v11)
  {
    int64_t v12 = v11 - v10;
    do
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
      -[NSMutableArray addObject:](v25, "addObject:", v13);
    }

    while (!__CFADD__(v12++, 1LL));
  }

  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v8 sendersToTest]);
  id obj = v15;
  id v16 = [v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v27;
    do
    {
      uint64_t v18 = 0LL;
      do
      {
        if (*(void *)v27 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void *)(*((void *)&v26 + 1) + 8LL * (void)v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue([v8 conversation]);
        -[AutocorrectionTestHarness testConversation:testingSender:warmupMessages:adaptToSentMessages:adaptToReceivedMessages:trialID:withError:writingResults:]( self,  "testConversation:testingSender:warmupMessages:adaptToSentMessages:adaptToReceivedMessages:trialID:withError:writingResults:",  v20,  v19,  [v8 warmupMessages],  objc_msgSend(v8, "adaptToSentMessages"),  objc_msgSend(v8, "adaptToReceivedMessages"),  a4,  v24,  v25);

        uint64_t v18 = (char *)v18 + 1;
      }

      while (v16 != v18);
      uint64_t v15 = obj;
      id v16 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }

    while (v16);
  }

  id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  -[NSMutableArray removeObjectIdenticalTo:](v25, "removeObjectIdenticalTo:", v21);

  return v25;
}

- (id)runTest:(id)a3 trialID:(unint64_t)a4 withError:(id)a5
{
  id v42 = a3;
  -[NSMutableArray removeAllObjects](self->_insertedText, "removeAllObjects");
  id v7 = v42;
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___PlaybackTest);
  char isKindOfClass = objc_opt_isKindOfClass(v7, v8);
  if ((isKindOfClass & 1) != 0) {
    uint64_t v10 = objc_claimAutoreleasedReturnValue(-[AutocorrectionTestHarness emptyResultForPlayback:](self, "emptyResultForPlayback:", v7));
  }
  else {
    uint64_t v10 = objc_claimAutoreleasedReturnValue(-[AutocorrectionTestHarness emptyResultForTest:](self, "emptyResultForTest:", v7));
  }
  id v11 = (void *)v10;
  int64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v7 sourceMetadata]);
  [v11 setSourceMetadata:v12];

  unsigned int v43 = -[AutocorrectionTestHarness seedForTest:trialID:](self, "seedForTest:trialID:", v7, a4);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[AutocorrectionTestHarness testTyper](self, "testTyper"));
  int v14 = (void *)objc_claimAutoreleasedReturnValue([v13 userActionStream]);
  [v14 setRandomNumberSeed:v43];

  if ((isKindOfClass & 1) != 0) {
    uint64_t v15 = objc_claimAutoreleasedReturnValue(-[AutocorrectionTestHarness replayTest:withError:](self, "replayTest:withError:", v7, 0LL));
  }
  else {
    uint64_t v15 = objc_claimAutoreleasedReturnValue(-[AutocorrectionTestHarness typeTest:withError:](self, "typeTest:withError:", v7, 0LL));
  }
  id v16 = (void *)v15;
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[AutocorrectionTestHarness typologyOutpath](self, "typologyOutpath"));

  if (v17)
  {
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper inputManager](self->_testTyper, "inputManager"));
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 inputManagerLogger]);
    v20 = (void *)objc_claimAutoreleasedReturnValue([v19 writeToFile]);

    id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 objectAtIndexedSubscript:0]);
    [v11 setTypologyLogURL:v21];

    id v22 = (void *)objc_claimAutoreleasedReturnValue([v20 objectAtIndexedSubscript:1]);
    [v11 setTypologyTraceLogURL:v22];
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue([v16 correctedTransliterationSequence]);
  id v24 = v23;
  if (v23)
  {
    id v25 = v23;
  }

  else
  {
    __int128 v26 = (void *)objc_claimAutoreleasedReturnValue(-[AutocorrectionTestHarness testTyper](self, "testTyper"));
    __int128 v27 = (void *)objc_claimAutoreleasedReturnValue(-[AutocorrectionTestHarness testTyper](self, "testTyper"));
    __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v27 text]);
    id v25 = (id)objc_claimAutoreleasedReturnValue([v26 tokensForString:v28]);
  }

  __int128 v29 = (void *)objc_claimAutoreleasedReturnValue(-[AutocorrectionTestHarness config](self, "config"));
  if ((objc_opt_respondsToSelector(v29, "usesContinuousPath") & 1) == 0) {
    goto LABEL_21;
  }
  BOOL v30 = (void *)objc_claimAutoreleasedReturnValue(-[AutocorrectionTestHarness config](self, "config"));
  unsigned int v31 = [v30 usesContinuousPath];

  if (v31)
  {
    id v32 = (void *)objc_claimAutoreleasedReturnValue([v11 intended]);
    __int128 v29 = (void *)objc_claimAutoreleasedReturnValue([v32 componentsJoinedByString:&stru_89E80]);

    if (([v29 hasSuffix:@" "] & 1) == 0)
    {
      if ([v16 adjustForContinuousPath])
      {
        unint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v25 lastObject]);
        unsigned int v34 = [v33 isEqualToString:@" "];

        if (v34)
        {
          uint64_t v35 = [v25 count] - 1;
          id v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( &OBJC_CLASS___NSMutableArray,  "arrayWithCapacity:",  (int)v35));
          if ((_DWORD)v35)
          {
            for (uint64_t i = 0LL; i != v35; ++i)
            {
              uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue([v25 objectAtIndex:i]);
              [v36 addObject:v38];
            }
          }

          goto LABEL_22;
        }
      }
    }

- (void)trainWithCorpus:(id)a3
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v4 = a3;
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    do
    {
      id v7 = 0LL;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8LL * (void)v7);
        id v9 = (void *)objc_claimAutoreleasedReturnValue(-[AutocorrectionTestHarness testTyper](self, "testTyper", (void)v11));
        [v9 attemptToTypeText:v8];

        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[AutocorrectionTestHarness testTyper](self, "testTyper"));
        [v10 commitText];

        id v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v5);
  }
}

- (BOOL)compareExpectedValue:(id)a3 withResult:(id)a4
{
  return _[a3 isEqualToArray:a4];
}

- (BOOL)outcomeIsFailureForTest:(id)a3 withResult:(id)a4
{
  id v5 = a4;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 intended]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 corrected]);
  LOBYTE(self) = !-[AutocorrectionTestHarness compareExpectedValue:withResult:]( self,  "compareExpectedValue:withResult:",  v6,  v7);

  return (char)self;
}

- (void)reset
{
}

- (void)tearDown
{
}

- (BOOL)requiresMaintenance
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AutocorrectionTestHarness testTyper](self, "testTyper"));
  unsigned __int8 v3 = [v2 wordLearningEnabled];

  return v3;
}

- (NSArray)resultClassifiers
{
  return &self->_resultClassifiers->super;
}

- (TIKeyboardTyper)testTyper
{
  return self->_testTyper;
}

- (TITestTyperDriver)dslTestDriver
{
  return self->_dslTestDriver;
}

- (BOOL)saveDebugData
{
  return self->_saveDebugData;
}

- (void)setSaveDebugData:(BOOL)a3
{
  self->_saveDebugData = a3;
}

- (TIKeyboardInputManagerConfig)config
{
  return self->_config;
}

- (BOOL)multilingualEnabled
{
  return self->_multilingualEnabled;
}

- (TIInputMode)secondaryInputMode
{
  return self->_secondaryInputMode;
}

- (NSString)typologyOutpath
{
  return self->_typologyOutpath;
}

- (void)setTypologyOutpath:(id)a3
{
}

- (void).cxx_destruct
{
}

@end