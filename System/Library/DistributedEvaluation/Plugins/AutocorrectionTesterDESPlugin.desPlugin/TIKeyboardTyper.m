@interface TIKeyboardTyper
- (ACTKeyboardController)keyboardController;
- (ACTUserActionStreaming)userActionStream;
- (BOOL)asyncPredictions;
- (BOOL)attemptToTapAutocorrectionWithString:(id)a3;
- (BOOL)attemptToTapPredictionBarCandidateWithString:(id)a3;
- (BOOL)attemptToTapPredictionWithString:(id)a3;
- (BOOL)changeToNearestAlphabeticPlane;
- (BOOL)changeToNearestKeyplaneWithString:(id)a3;
- (BOOL)hardwareKeyboardMode;
- (BOOL)hasPrediction:(id)a3;
- (BOOL)inPartialCandidateSelection;
- (BOOL)inlineCompletionEnabled;
- (BOOL)insertsSpaceAfterPredictiveInput;
- (BOOL)isAutoshifted;
- (BOOL)isShifted;
- (BOOL)lastInputWasSelection;
- (BOOL)logDocumentContext;
- (BOOL)longPredictionListEnabled;
- (BOOL)nextKeyIsMultitap;
- (BOOL)postTokenisString:(id)a3 i:(unint64_t)a4;
- (BOOL)printTranslitSummaries;
- (BOOL)printTypingTranscript;
- (BOOL)priorTokenisString:(id)a3 i:(unint64_t)a4;
- (BOOL)shouldDecomposeInputString;
- (BOOL)shouldSkipCandidateSelection;
- (BOOL)showsCandidateBar;
- (BOOL)usePartialCandidates;
- (BOOL)usesAutocapitalization;
- (BOOL)usesAutocorrection;
- (BOOL)usesPrediction;
- (BOOL)usesTransliteration;
- (BOOL)warnIfSelectingPopupVariant;
- (BOOL)wordLearningEnabled;
- (CGPoint)pointForAttemptedTapOnKey:(id)a3 withError:(id)a4;
- (NSArray)inlineCompletionCandidates;
- (NSArray)predictionBarCandidates;
- (NSArray)predictions;
- (NSDictionary)shiftedKeyToUnShiftedKeyExcludeCapitalizationMap;
- (NSLocale)locale;
- (NSString)badSentenceLogFilePath;
- (NSString)clientIdentifier;
- (NSString)inputModeIdentifier;
- (NSString)markedText;
- (NSString)recipientIdentifier;
- (NSString)text;
- (TIAutocorrectionList)autocorrectionList;
- (TIErrorGenerator)errorGenerator;
- (TIInputContextHistory)inputContextHistory;
- (TIInputMode)inputMode;
- (TIKeyboardCandidate)autocorrection;
- (TIKeyboardCandidateResultSet)candidateResultSet;
- (TIKeyboardInputManager)inputManager;
- (TIKeyboardInputManagerFactory)keyboardInputManagerFactory;
- (TIKeyboardTyper)init;
- (TIKeyboardTyper)initWithInputMode:(id)a3;
- (TIKeyboardTyperUserModel)userModel;
- (TITestUserPersona)userPersona;
- (UIKBTree)keyboard;
- (UIKBTree)keyplane;
- (_NSRange)selectedRange;
- (double)interTouchTimestampInterval;
- (double)lastTimestamp;
- (id)_keyplaneCloserToKeyWithString:(id)a3;
- (id)_logStringForTouchedKey:(id)a3;
- (id)_performGestureKeyInput:(id)a3 timestamp:(double)a4 typingLog:(id)a5;
- (id)_performTapAtLocation:(CGPoint)a3 timestamp:(double)a4 fingerID:(int)a5 secondaryString:(BOOL)a6;
- (id)_performTapAtLocation:(CGPoint)a3 timestamp:(double)a4 intendedKey:(id)a5 touchedKey:(id)a6 secondaryString:(BOOL)a7 touchError:(id)a8 typingLog:(id)a9;
- (id)_performTouchEvent:(id)a3 typingLog:(id)a4;
- (id)_performVariantKey:(id)a3 timestamp:(double)a4 typingLog:(id)a5;
- (id)candidateBarCandidates;
- (id)candidatesForString:(id)a3;
- (id)displayStringOverrideForKey:(id)a3;
- (id)externalStringToInternal:(id)a3;
- (id)inputSegmentsForContinuousPathString:(id)a3;
- (id)inputSegmentsForString:(id)a3;
- (id)internalStringToExternal:(id)a3;
- (id)keyContainingPoint:(CGPoint)a3 inKeyplane:(id)a4;
- (id)keyToAccessKeyplaneCloserToKeyString:(id)a3;
- (id)keyWithString:(id)a3 inKeyplane:(id)a4;
- (id)keyWithString:(id)a3 inKeyplane:(id)a4 includeSecondaryStrings:(BOOL)a5;
- (id)mapShiftedKeyToUnShiftedKeyExcludeCapitalization:(id)a3;
- (id)mergeHyphenatedWord:(id)a3 string:(id)a4;
- (id)performTapAtKey:(id)a3 biasedTowards:(id)a4 biasWeight:(float)a5;
- (id)performTapAtLocation:(CGPoint)a3;
- (id)performTouchUpAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7;
- (id)performTouchUpAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7 secondaryString:(BOOL)a8;
- (id)predictationBarDebugString;
- (id)shiftKeyToAccessKeyplaneCloserToKeyString:(id)a3;
- (id)splitDigraphsInString:(id)a3;
- (id)tokensForString:(id)a3;
- (id)transliteratedTokensForString:(id)a3;
- (int)maxPredictionsReported;
- (int64_t)maxPredictions;
- (int64_t)performTouchDownAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7;
- (int64_t)performTouchDragAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7;
- (unint64_t)autocapitalizationType;
- (unint64_t)autocorrectionType;
- (unint64_t)cursorLocationInMarkedText;
- (unint64_t)learnWordContextIndex;
- (void)_bumpTouchPathID;
- (void)_finishKeystrokeAndRecordPredictionsInTypingLog:(id)a3 touchedKey:(id)a4 insertedKey:(id)a5 typingLog:(id)a6;
- (void)_performAcceptCandidate:(id)a3 timestamp:(double)a4 typingLog:(id)a5;
- (void)_performAcceptCandidate:(id)a3 timestamp:(double)a4 typingLog:(id)a5 predictiveCandidate:(BOOL)a6;
- (void)_performAcceptCandidate:(id)a3 timestamp:(double)a4 typingLog:(id)a5 predictiveCandidate:(BOOL)a6 intendedTransliteration:(id)a7;
- (void)_performAcceptPredictiveCandidate:(id)a3 timestamp:(double)a4 typingLog:(id)a5;
- (void)_performRejectCandidate:(id)a3 timestamp:(double)a4 typingLog:(id)a5;
- (void)_skipTapTimestamp:(double)a3 intendedKey:(id)a4 typingLog:(id)a5;
- (void)acceptAutocorrection;
- (void)acceptCandidate:(id)a3;
- (void)acceptCandidateFromPredictionBar:(id)a3;
- (void)acceptCandidateInputEvent:(id)a3 fromCandidateBar:(BOOL)a4;
- (void)acceptCandidateViaKeyboard:(id)a3;
- (void)acceptPredictiveCandidate:(id)a3;
- (void)adjustCursorByOffset:(int64_t)a3;
- (void)adjustPhraseBoundaryByOffset:(int64_t)a3 granularity:(int)a4;
- (void)adjustPhraseBoundaryInForwardDirection:(BOOL)a3 granularity:(int)a4;
- (void)attemptGestureKeyInput:(id)a3;
- (void)attemptTapOnKeyWithString:(id)a3;
- (void)attemptTapOnKeyWithString:(id)a3 withErrorGenerator:(id)a4 typingLog:(id)a5;
- (void)attemptToDelete;
- (void)attemptToDeleteWithCount:(unsigned int)a3;
- (void)attemptToRapidDeleteCharacters:(unsigned int)a3;
- (void)attemptToShift;
- (void)attemptToStrokeWord:(id)a3;
- (void)attemptToStrokeWord:(id)a3 startTime:(double)a4 duration:(double)a5 typingLog:(id)a6 callback:(id)a7;
- (void)attemptToStrokeWord:(id)a3 startTime:(double)a4 typingLog:(id)a5 callback:(id)a6;
- (void)attemptToStrokeWord:(id)a3 typingLog:(id)a4;
- (void)attemptToStrokeWord:(id)a3 typingLog:(id)a4 callback:(id)a5;
- (void)attemptToStrokeWord:(id)a3 withCallback:(id)a4;
- (void)attemptToStrokeWord:(id)a3 withStartTime:(double)a4;
- (void)attemptToStrokeWord:(id)a3 withStartTime:(double)a4 duration:(double)a5;
- (void)attemptToTapKeys:(id)a3;
- (void)attemptToTapMoreKey;
- (void)attemptToTapPredictionWithLiteral:(id)a3;
- (void)attemptToTypeIntended:(id)a3 expected:(id)a4 typingLog:(id)a5;
- (void)attemptToTypeText:(id)a3;
- (void)attemptToTypeText:(id)a3 typingLog:(id)a4;
- (void)attemptToTypeWithLog:(id)a3;
- (void)attemptVariantKey:(id)a3;
- (void)candidateRejected:(id)a3;
- (void)commitText;
- (void)dealloc;
- (void)generateAutocorrectionsWithShiftState:(int)a3;
- (void)generateCandidates;
- (void)insertText:(id)a3;
- (void)learnWord:(id)a3 withCount:(unint64_t)a4;
- (void)linkWithUserActionStream:(id)a3;
- (void)performStrokeForPath:(id)a3 typingLog:(id)a4 callback:(id)a5;
- (void)performTouchCancelAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7;
- (void)performTouchEndRestAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7;
- (void)performTouchRestAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7;
- (void)registerLearning:(id)a3 fullCandidate:(id)a4 mode:(id)a5;
- (void)rejectAutocorrection;
- (void)reset;
- (void)setAsyncPredictions:(BOOL)a3;
- (void)setAutocapitalizationType:(unint64_t)a3;
- (void)setAutocorrectionList:(id)a3;
- (void)setAutocorrectionType:(unint64_t)a3;
- (void)setBadSentenceLogFilePath:(id)a3;
- (void)setClientIdentifier:(id)a3;
- (void)setErrorGenerator:(id)a3;
- (void)setHardwareKeyboardMode:(BOOL)a3;
- (void)setInlineCompletionEnabled:(BOOL)a3;
- (void)setInputContextHistory:(id)a3;
- (void)setInputMode:(id)a3;
- (void)setInputModeIdentifier:(id)a3;
- (void)setInsertsSpaceAfterPredictiveInput:(BOOL)a3;
- (void)setInterTouchTimestampInterval:(double)a3;
- (void)setKeyboard:(id)a3;
- (void)setKeyboardInputManagerFactory:(id)a3;
- (void)setLastInputWasSelection:(BOOL)a3;
- (void)setLastTimestamp:(double)a3;
- (void)setLearnWordContextIndex:(unint64_t)a3;
- (void)setLocale:(id)a3;
- (void)setLogDocumentContext:(BOOL)a3;
- (void)setLongPredictionListEnabled:(BOOL)a3;
- (void)setMaxPredictions:(int64_t)a3;
- (void)setMaxPredictionsReported:(int)a3;
- (void)setNextKeyIsMultitap:(BOOL)a3;
- (void)setPrintTranslitSummaries:(BOOL)a3;
- (void)setPrintTypingTranscript:(BOOL)a3;
- (void)setRecipientIdentifier:(id)a3;
- (void)setSelectedRange:(_NSRange)a3;
- (void)setShiftedKeyToUnShiftedKeyExcludeCapitalizationMap;
- (void)setShiftedKeyToUnShiftedKeyExcludeCapitalizationMap:(id)a3;
- (void)setShouldDecomposeInputString:(BOOL)a3;
- (void)setShouldSkipCandidateSelection:(BOOL)a3;
- (void)setShowsCandidateBar:(BOOL)a3;
- (void)setUserModel:(id)a3;
- (void)setUserPersona:(id)a3;
- (void)setUsesAutocapitalization:(BOOL)a3;
- (void)setUsesAutocorrection:(BOOL)a3;
- (void)setUsesPrediction:(BOOL)a3;
- (void)setUsesTransliteration:(BOOL)a3;
- (void)setWarnIfSelectingPopupVariant:(BOOL)a3;
- (void)setWordLearningEnabled:(BOOL)a3;
- (void)suspendAndResume;
- (void)syncToDocumentState:(id)a3;
- (void)syncToEmptyDocument;
- (void)tearDown;
@end

@implementation TIKeyboardTyper

- (TIKeyboardTyper)init
{
  return -[TIKeyboardTyper initWithInputMode:](self, "initWithInputMode:", 0LL);
}

- (TIKeyboardTyper)initWithInputMode:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___TIKeyboardTyper;
  v6 = -[TIKeyboardTyper init](&v16, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_inputMode, a3);
    v8 = -[ACTKeyboardController initWithInputMode:]( objc_alloc(&OBJC_CLASS___ACTKeyboardController),  "initWithInputMode:",  v5);
    keyboardController = v7->_keyboardController;
    v7->_keyboardController = v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue([v5 locale]);
    v11 = (NSLocale *)[v10 copy];
    locale = v7->_locale;
    v7->_locale = v11;

    v7->_maxPredictions = 3LL;
    v7->_touchPathID = 1LL;
    uint64_t v13 = objc_claimAutoreleasedReturnValue( +[ACTUserActionStreamFactory userActionStreamWithParameters:delegate:]( &OBJC_CLASS___ACTUserActionStreamFactory,  "userActionStreamWithParameters:delegate:",  &off_90688,  v7));
    userActionStream = v7->_userActionStream;
    v7->_userActionStream = (ACTUserActionStreaming *)v13;

    -[ACTUserActionStreaming setDelegate:](v7->_userActionStream, "setDelegate:", v7);
    -[TIKeyboardTyper setClientIdentifier:](v7, "setClientIdentifier:", @"testTyper");
  }

  return v7;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper inputManager](self, "inputManager"));
  [v3 suspend];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TIKeyboardTyper;
  -[TIKeyboardTyper dealloc](&v4, "dealloc");
}

- (void)tearDown
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  [v3 tearDown];

  keyboardController = self->_keyboardController;
  self->_keyboardController = 0LL;
}

- (void)linkWithUserActionStream:(id)a3
{
  id v5 = (ACTUserActionStreaming *)a3;
  userActionStream = self->_userActionStream;
  if (userActionStream != v5)
  {
    v9 = v5;
    -[ACTUserActionStreaming setDelegate:](userActionStream, "setDelegate:", 0LL);
    objc_storeStrong((id *)&self->_userActionStream, a3);
    -[ACTUserActionStreaming setDelegate:](self->_userActionStream, "setDelegate:", self);
    keyboardController = self->_keyboardController;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ACTUserActionStreaming errorGenerator](self->_userActionStream, "errorGenerator"));
    [v8 setKeyboardInfoDelgate:keyboardController];

    id v5 = v9;
  }
}

- (TIKeyboardTyperUserModel)userModel
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper userActionStream](self, "userActionStream"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 userModel]);

  return (TIKeyboardTyperUserModel *)v3;
}

- (void)setUserModel:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper userActionStream](self, "userActionStream"));
  [v5 setUserModel:v4];
}

- (TIErrorGenerator)errorGenerator
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper userActionStream](self, "userActionStream"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 errorGenerator]);

  return (TIErrorGenerator *)v3;
}

- (void)setErrorGenerator:(id)a3
{
  id v5 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper userActionStream](self, "userActionStream"));
  [v4 setErrorGenerator:v5];

  [v5 setKeyboardInfoDelgate:self->_keyboardController];
}

- (BOOL)lastInputWasSelection
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  unsigned __int8 v3 = [v2 lastInputWasSelection];

  return v3;
}

- (void)setLastInputWasSelection:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  [v4 setLastInputWasSelection:v3];
}

- (void)reset
{
  BOOL v3 = objc_autoreleasePoolPush();
  -[TIKeyboardTyper setLastTimestamp:](self, "setLastTimestamp:", 0.0);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper userActionStream](self, "userActionStream"));
  [v4 setIntendedText:&stru_89E80];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  [v5 reset];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper userPersona](self, "userPersona"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 keyplane]);
  [v6 updateFromKeyplane:v8];

  objc_autoreleasePoolPop(v3);
}

- (void)syncToDocumentState:(id)a3
{
  id v4 = a3;
  -[TIKeyboardTyper setLastTimestamp:](self, "setLastTimestamp:", 0.0);
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  [v5 syncToDocumentState:v4];
}

- (void)syncToEmptyDocument
{
  id v3 = objc_msgSend( [TIDocumentState alloc],  "initWithContextBefore:markedText:selectedText:contextAfter:selectedRangeInMarkedText:",  &stru_89E80,  0,  0,  0,  0x7FFFFFFFFFFFFFFFLL,  0);
  -[TIKeyboardTyper syncToDocumentState:](self, "syncToDocumentState:", v3);
}

- (void)suspendAndResume
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper inputManager](self, "inputManager"));
  [v3 suspend];

  id v4 = (id)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper inputManager](self, "inputManager"));
  [v4 resume];
}

- (void)attemptToTypeText:(id)a3
{
}

- (void)attemptToTypeWithLog:(id)a3
{
  id v36 = a3;
  if ((TILogProblemSentencesToStdout() & 1) != 0
    || (id v4 = (TIProgressTracker *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper badSentenceLogFilePath](self, "badSentenceLogFilePath")),
        v4,
        v4))
  {
    id v5 = objc_alloc(&OBJC_CLASS___TIProgressTracker);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper userActionStream](self, "userActionStream"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 intendedText]);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper badSentenceLogFilePath](self, "badSentenceLogFilePath"));
    id v4 = -[TIProgressTracker initWithIntendedString:repeatLimit:timeout:badSentencePath:]( v5,  "initWithIntendedString:repeatLimit:timeout:badSentencePath:",  v7,  4LL,  v8,  1500.0);
  }

  v9 = 0LL;
  do
  {
    v10 = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper userActionStream](self, "userActionStream"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v11 nextUserAction]);

    if (!v9) {
      break;
    }
    v12 = objc_autoreleasePoolPush();
    objc_msgSend(v36, "setTokenIndex:", objc_msgSend(v9, "inputSegment"));
    if (-[TIKeyboardTyper warnIfSelectingPopupVariant](self, "warnIfSelectingPopupVariant"))
    {
      Class v13 = NSClassFromString(@"ACTSelectPopupVariant");
      if ((objc_opt_isKindOfClass(v9, v13) & 1) != 0)
      {
        v14 = __stderrp;
        id v15 = objc_claimAutoreleasedReturnValue([v9 description]);
        fprintf( v14,  "WARNING! Typer is selecting a pop-up key variant: %s. This may indicate a keyboard layout mis-configuration.\n",  (const char *)[v15 UTF8String]);
      }
    }

    uint64_t v16 = objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper predictationBarDebugString](self, "predictationBarDebugString"));
    v17 = (void *)v16;
    if (v16)
    {
      if ((TIPrintTypingTranscriptToStdout(v16) & 1) != 0
        || (uint64_t v16 = -[TIKeyboardTyper printTypingTranscript](self, "printTypingTranscript"), (_DWORD)v16))
      {
        uint64_t v16 = fputs((const char *)[v17 UTF8String], __stdoutp);
      }
    }

    if ((TIPrintTypingTranscriptToStdout(v16) & 1) != 0
      || -[TIKeyboardTyper printTypingTranscript](self, "printTypingTranscript"))
    {
      v18 = __stdoutp;
      v19 = (void *)objc_claimAutoreleasedReturnValue([v9 shortDescription]);
      v20 = (void *)objc_claimAutoreleasedReturnValue([v9 shortDescription]);
      v21 = (char *)[v20 length] - 1;

      else {
        uint64_t v22 = (uint64_t)v21;
      }
      id v23 = objc_claimAutoreleasedReturnValue([v19 substringToIndex:v22]);
      fprintf(v18, "%-45s\t", (const char *)[v23 UTF8String]);
    }

    if ((TIPrintTypingTranscriptToStdout([v9 applyWithTyper:self log:v36]) & 1) != 0
      || -[TIKeyboardTyper printTypingTranscript](self, "printTypingTranscript"))
    {
      v24 = __stdoutp;
      id v25 = objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper text](self, "text"));
      fprintf(v24, ">>> %s", (const char *)[v25 UTF8String]);
    }

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
    unsigned int v27 = [v26 justAcceptedAutocorrection];

    if (v27)
    {
      if ((TIPrintTypingTranscriptToStdout(v28) & 1) != 0
        || -[TIKeyboardTyper printTypingTranscript](self, "printTypingTranscript"))
      {
        fwrite("\t\t\t<autocorrect>", 0x10uLL, 1uLL, __stdoutp);
      }

      v29 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
      [v29 setJustAcceptedAutocorrection:0];

      id v28 = [v36 logAutocorrectionInserted];
    }

    if ((TIPrintTypingTranscriptToStdout(v28) & 1) != 0
      || -[TIKeyboardTyper printTypingTranscript](self, "printTypingTranscript"))
    {
      fputc(10, __stdoutp);
    }

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper text](self, "text"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithString:](&OBJC_CLASS___NSString, "stringWithString:", v30));
    unsigned int v32 = -[TIProgressTracker shouldStopAfterAddingStateString:](v4, "shouldStopAfterAddingStateString:", v31);

    objc_autoreleasePoolPop(v12);
  }

  while (!v32);
  v33 = -[TIProgressTracker stoppageReason](v4, "stoppageReason");
  if (v33 == (_BYTE *)&dword_0 + 3) {
    v33 = (char *)-[TIProgressTracker saveBadSentenceAndTranscript:]( v4,  "saveBadSentenceAndTranscript:",  -[TIProgressTracker stoppageReason](v4, "stoppageReason"));
  }
  if ((TIPrintTypingTranscriptToStdout(v33) & 1) != 0
    || -[TIKeyboardTyper printTypingTranscript](self, "printTypingTranscript"))
  {
    v34 = __stdoutp;
    id v35 = objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper text](self, "text"));
    fprintf(v34, "%-45s\t>>> %s。\t\t END\n\n", " ", (const char *)[v35 UTF8String]);
  }
}

- (void)attemptToTypeText:(id)a3 typingLog:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper userActionStream](self, "userActionStream"));
  [v7 setIntendedText:v9];

  if ((TIPrintTypingTranscriptToStdout(v8) & 1) != 0
    || -[TIKeyboardTyper printTypingTranscript](self, "printTypingTranscript"))
  {
    fprintf(__stdoutp, "----->> %s\n", (const char *)[v9 UTF8String]);
  }

  -[TIKeyboardTyper attemptToTypeWithLog:](self, "attemptToTypeWithLog:", v6);
}

- (void)attemptToTypeIntended:(id)a3 expected:(id)a4 typingLog:(id)a5
{
  id v16 = a4;
  id v8 = a5;
  id v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 componentsJoinedByString:&stru_89E80]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v16 componentsJoinedByString:&stru_89E80]);
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"----->> %@ -> %@",  v10,  v11));
  if ((TIPrintTypingTranscriptToStdout(v12) & 1) != 0
    || -[TIKeyboardTyper printTypingTranscript](self, "printTypingTranscript"))
  {
    fprintf(__stdoutp, "%s\n", (const char *)[v12 UTF8String]);
  }

  Class v13 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper userActionStream](self, "userActionStream"));
  [v13 resetForIntendedSegments:v9 expectedSegments:v16];

  -[TIKeyboardTyper attemptToTypeWithLog:](self, "attemptToTypeWithLog:", v8);
  if (-[TIKeyboardTyper printTranslitSummaries](self, "printTranslitSummaries"))
  {
    fprintf(__stdoutp, "input : %s\n", (const char *)[v10 UTF8String]);
    fprintf(__stdoutp, "expected: %s\n", (const char *)[v11 UTF8String]);
    v14 = __stdoutp;
    id v15 = objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper text](self, "text"));
    fprintf(v14, "actual  : %s\n\n", (const char *)[v15 UTF8String]);
  }
}

- (void)attemptToTapKeys:(id)a3
{
  id v4 = a3;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8LL * (void)v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper errorGenerator](self, "errorGenerator"));
        -[TIKeyboardTyper attemptTapOnKeyWithString:withErrorGenerator:typingLog:]( self,  "attemptTapOnKeyWithString:withErrorGenerator:typingLog:",  v9,  v10,  0LL);

        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v6);
  }
}

- (void)attemptToStrokeWord:(id)a3
{
}

- (void)attemptToStrokeWord:(id)a3 withStartTime:(double)a4
{
}

- (void)attemptToStrokeWord:(id)a3 withStartTime:(double)a4 duration:(double)a5
{
}

- (void)attemptToStrokeWord:(id)a3 withCallback:(id)a4
{
}

- (void)attemptToStrokeWord:(id)a3 typingLog:(id)a4
{
}

- (void)attemptToStrokeWord:(id)a3 typingLog:(id)a4 callback:(id)a5
{
}

- (void)attemptToStrokeWord:(id)a3 startTime:(double)a4 typingLog:(id)a5 callback:(id)a6
{
}

- (void)attemptToStrokeWord:(id)a3 startTime:(double)a4 duration:(double)a5 typingLog:(id)a6 callback:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a3;
  id v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "substringWithRange:", 0, 1));
  -[TIKeyboardTyper changeToNearestKeyplaneWithString:](self, "changeToNearestKeyplaneWithString:", v15);

  id v21 = (id)objc_claimAutoreleasedReturnValue( +[TTKDefaultContinuousPathGenerator pathGeneratorWithAttributes:]( &OBJC_CLASS___TTKDefaultContinuousPathGenerator,  "pathGeneratorWithAttributes:",  &__NSDictionary0__struct));
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 layoutUtils]);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyplane](self, "keyplane"));
  v19 = (void *)objc_claimAutoreleasedReturnValue([v17 createTTKPlane:v18]);

  v20 = (void *)objc_claimAutoreleasedReturnValue([v21 generatePathFromString:v14 timestamp:v19 duration:a4 layout:a5]);
  -[TIKeyboardTyper performStrokeForPath:typingLog:callback:]( self,  "performStrokeForPath:typingLog:callback:",  v20,  v13,  v12);
}

- (void)attemptTapOnKeyWithString:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper errorGenerator](self, "errorGenerator"));
  -[TIKeyboardTyper attemptTapOnKeyWithString:withErrorGenerator:typingLog:]( self,  "attemptTapOnKeyWithString:withErrorGenerator:typingLog:",  v4,  v5,  0LL);
}

- (void)attemptTapOnKeyWithString:(id)a3 withErrorGenerator:(id)a4 typingLog:(id)a5
{
  id v24 = a5;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyplane](self, "keyplane"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyWithString:inKeyplane:](self, "keyWithString:inKeyplane:", v7, v8));

  if (v9)
  {
    -[TIKeyboardTyper lastTimestamp](self, "lastTimestamp");
    double v11 = v10;
    -[TIKeyboardTyper interTouchTimestampInterval](self, "interTouchTimestampInterval");
    double v13 = v11 + v12;
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper errorGenerator](self, "errorGenerator"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v9 representedString]);
    [v9 paddedFrame];
    id v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "errorForKeyString:rect:", v15));

    -[TIKeyboardTyper pointForAttemptedTapOnKey:withError:](self, "pointForAttemptedTapOnKey:withError:", v9, v16);
    double v18 = v17;
    double v20 = v19;
    id v21 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyplane](self, "keyplane"));
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( -[TIKeyboardTyper keyContainingPoint:inKeyplane:]( self,  "keyContainingPoint:inKeyplane:",  v21,  v18,  v20));

    if (v22) {
      id v23 =  -[TIKeyboardTyper _performTapAtLocation:timestamp:intendedKey:touchedKey:secondaryString:touchError:typingLog:]( self,  "_performTapAtLocation:timestamp:intendedKey:touchedKey:secondaryString:touchError:typingLog:",  v9,  v22,  0LL,  v16,  v24,  v18,  v20,  v13);
    }
    else {
      -[TIKeyboardTyper _skipTapTimestamp:intendedKey:typingLog:]( self,  "_skipTapTimestamp:intendedKey:typingLog:",  v9,  v24,  v13);
    }
    -[TIKeyboardTyper setLastTimestamp:](self, "setLastTimestamp:", v13);
  }
}

- (id)performTapAtLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  -[TIKeyboardTyper lastTimestamp](self, "lastTimestamp");
  double v7 = v6;
  -[TIKeyboardTyper interTouchTimestampInterval](self, "interTouchTimestampInterval");
  double v9 = v7 + v8;
  double v10 = (void *)objc_claimAutoreleasedReturnValue( -[TIKeyboardTyper _performTapAtLocation:timestamp:fingerID:secondaryString:]( self,  "_performTapAtLocation:timestamp:fingerID:secondaryString:",  0LL,  0LL,  x,  y,  v9));
  -[TIKeyboardTyper setLastTimestamp:](self, "setLastTimestamp:", v9);
  return v10;
}

- (id)performTapAtKey:(id)a3 biasedTowards:(id)a4 biasWeight:(float)a5
{
  id v8 = a4;
  id v9 = a3;
  -[TIKeyboardTyper lastTimestamp](self, "lastTimestamp");
  double v11 = v10;
  -[TIKeyboardTyper interTouchTimestampInterval](self, "interTouchTimestampInterval");
  double v13 = v12;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 keyplane]);

  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyWithString:inKeyplane:](self, "keyWithString:inKeyplane:", v9, v15));
  -[TIKeyboardTyper pointForAttemptedTapOnKey:withError:](self, "pointForAttemptedTapOnKey:withError:", v16, 0LL);
  double v18 = v17;
  double v20 = v19;
  id v21 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyWithString:inKeyplane:](self, "keyWithString:inKeyplane:", v8, v15));

  -[TIKeyboardTyper pointForAttemptedTapOnKey:withError:](self, "pointForAttemptedTapOnKey:withError:", v21, 0LL);
  double v23 = v22;
  double v25 = v24;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  unsigned int v27 = (void *)objc_claimAutoreleasedReturnValue([v26 leftKeys]);
  unsigned __int8 v28 = [v27 containsObject:v16];

  if ((v28 & 1) != 0)
  {
    uint64_t v29 = 3LL;
  }

  else
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
    v31 = (void *)objc_claimAutoreleasedReturnValue([v30 rightKeys]);
    unsigned int v32 = [v31 containsObject:v16];

    if (v32) {
      uint64_t v29 = 9LL;
    }
    else {
      uint64_t v29 = 0LL;
    }
  }

  double v33 = a5;
  double v34 = v20 + a5 * (v25 - v20);
  double v35 = v18 + v33 * (v23 - v18);
  double v36 = v11 + v13;
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  LODWORD(v38) = 5.0;
  objc_msgSend(v37, "performTouchDownAtLocation:radius:timestamp:pathIndex:fingerID:", 0, v29, v35, v34, v38, v36);

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  LODWORD(v40) = 5.0;
  v41 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v39,  "performTouchUpAtLocation:radius:timestamp:pathIndex:fingerID:secondaryString:",  0,  v29,  0,  v35,  v34,  v40,  v36));

  -[TIKeyboardTyper setLastTimestamp:](self, "setLastTimestamp:", v36);
  return v41;
}

- (void)attemptToDelete
{
}

- (void)attemptToDeleteWithCount:(unsigned int)a3
{
  if (a3)
  {
    unsigned int v3 = a3;
    do
    {
      -[TIKeyboardTyper attemptTapOnKeyWithString:withErrorGenerator:typingLog:]( self,  "attemptTapOnKeyWithString:withErrorGenerator:typingLog:",  @"Delete",  0LL,  0LL);
      --v3;
    }

    while (v3);
  }

- (void)attemptToRapidDeleteCharacters:(unsigned int)a3
{
  if (a3)
  {
    -[TIKeyboardTyper attemptToDelete](self, "attemptToDelete");
    unsigned int v5 = a3 - 1;
    if (a3 != 1)
    {
      while (1)
      {
        double v6 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper inputManager](self, "inputManager"));
        double v7 = (void *)objc_claimAutoreleasedReturnValue([v6 keyboardState]);
        id v12 = (id)objc_claimAutoreleasedReturnValue([v7 documentState]);

        id v8 = (void *)objc_claimAutoreleasedReturnValue([v12 contextBeforeInput]);
        if (![v8 length]) {
          break;
        }
        id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "substringToIndex:", (char *)objc_msgSend(v8, "length") - 1));
        double v10 = (void *)objc_claimAutoreleasedReturnValue([v12 contextAfterInput]);
        double v11 = (void *)objc_claimAutoreleasedReturnValue( +[TIDocumentState documentStateWithContextBefore:selectedText:contextAfter:]( &OBJC_CLASS___TIDocumentState,  "documentStateWithContextBefore:selectedText:contextAfter:",  v9,  &stru_89E80,  v10));

        -[TIKeyboardTyper syncToDocumentState:](self, "syncToDocumentState:", v11);
        if (!--v5) {
          return;
        }
      }
    }
  }

- (void)attemptToShift
{
}

- (void)attemptToTapMoreKey
{
}

- (void)attemptVariantKey:(id)a3
{
  id v3 =  -[TIKeyboardTyper _performVariantKey:timestamp:typingLog:]( self,  "_performVariantKey:timestamp:typingLog:",  a3,  0LL,  0.0);
}

- (void)attemptGestureKeyInput:(id)a3
{
  id v3 =  -[TIKeyboardTyper _performGestureKeyInput:timestamp:typingLog:]( self,  "_performGestureKeyInput:timestamp:typingLog:",  a3,  0LL,  0.0);
}

- (void)acceptAutocorrection
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper autocorrection](self, "autocorrection"));
  -[TIKeyboardTyper lastTimestamp](self, "lastTimestamp");
  -[TIKeyboardTyper _performAcceptCandidate:timestamp:typingLog:]( self,  "_performAcceptCandidate:timestamp:typingLog:",  v3,  0LL);
}

- (void)rejectAutocorrection
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper autocorrection](self, "autocorrection"));
  -[TIKeyboardTyper lastTimestamp](self, "lastTimestamp");
  -[TIKeyboardTyper _performRejectCandidate:timestamp:typingLog:]( self,  "_performRejectCandidate:timestamp:typingLog:",  v3,  0LL);
}

- (void)candidateRejected:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper inputManager](self, "inputManager"));
  [v5 candidateRejected:v4];
}

- (void)registerLearning:(id)a3 fullCandidate:(id)a4 mode:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v13 = (id)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper inputManager](self, "inputManager"));
  double v11 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 keyboardState]);
  [v13 registerLearning:v10 fullCandidate:v9 keyboardState:v12 mode:v8];
}

- (void)acceptPredictiveCandidate:(id)a3
{
  id v4 = a3;
  -[TIKeyboardTyper lastTimestamp](self, "lastTimestamp");
  -[TIKeyboardTyper _performAcceptPredictiveCandidate:timestamp:typingLog:]( self,  "_performAcceptPredictiveCandidate:timestamp:typingLog:",  v4,  0LL);
}

- (void)acceptCandidate:(id)a3
{
  id v4 = a3;
  -[TIKeyboardTyper lastTimestamp](self, "lastTimestamp");
  -[TIKeyboardTyper _performAcceptCandidate:timestamp:typingLog:]( self,  "_performAcceptCandidate:timestamp:typingLog:",  v4,  0LL);
}

- (void)acceptCandidateViaKeyboard:(id)a3
{
  id v4 = a3;
  -[TIKeyboardTyper lastTimestamp](self, "lastTimestamp");
  -[TIKeyboardTyper _performAcceptCandidate:timestamp:typingLog:]( self,  "_performAcceptCandidate:timestamp:typingLog:",  v4,  0LL);

  id v9 = objc_alloc_init(&OBJC_CLASS___TIKeyboardInput);
  [v9 setString:@"\n"];
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 inputManager]);
  id v7 = [v6 handleKeyboardInput:v9];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  [v8 generateAutocorrectionsOrCandidates];
}

- (TIKeyboardCandidate)autocorrection
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 autocorrection]);

  return (TIKeyboardCandidate *)v3;
}

- (id)candidateBarCandidates
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper candidateResultSet](self, "candidateResultSet"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 candidates]);

  return v3;
}

- (NSArray)predictionBarCandidates
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper candidateBarCandidates](self, "candidateBarCandidates"));
  if (v3)
  {
    if (-[TIKeyboardTyper inPartialCandidateSelection](self, "inPartialCandidateSelection")) {
      id v4 = [v3 count];
    }
    else {
      id v4 = -[TIKeyboardTyper maxPredictions](self, "maxPredictions");
    }
    id v10 = v4;
    id v11 = [v3 count];
    if (v10 >= v11) {
      id v12 = v11;
    }
    else {
      id v12 = v10;
    }
    id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "subarrayWithRange:", 0, v12));
  }

  else
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( &OBJC_CLASS___NSMutableArray,  "arrayWithCapacity:",  -[TIKeyboardTyper maxPredictions](self, "maxPredictions")));
    double v6 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper autocorrection](self, "autocorrection"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper autocorrection](self, "autocorrection"));
    unsigned int v8 = [v7 isAutocorrection];

    if ((v8 & 1) != 0)
    {
      unsigned int v9 = 1;
    }

    else
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 input]);
      unsigned int v9 = [v13 length] != 0;
    }

    uint64_t v14 = objc_opt_class(&OBJC_CLASS___TIMecabraCandidate);
    v50 = v6;
    if ((objc_opt_isKindOfClass(v6, v14) & 1) != 0)
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper locale](self, "locale"));
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 languageCode]);
      if ([v16 isEqualToString:@"ko"])
      {
        unsigned int v17 = 0;
      }

      else
      {
        double v18 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper locale](self, "locale"));
        double v19 = (void *)objc_claimAutoreleasedReturnValue([v18 languageCode]);
        unsigned int v20 = [v19 isEqualToString:@"th"] ^ 1;

        unsigned int v17 = v20;
      }
    }

    else
    {
      unsigned int v17 = 0;
    }

    id v21 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper autocorrectionList](self, "autocorrectionList"));
    double v22 = (void *)objc_claimAutoreleasedReturnValue([v21 predictions]);

    if ([v22 count])
    {
      double v23 = (void *)objc_claimAutoreleasedReturnValue([v22 objectAtIndex:0]);
      unsigned int v24 = [v23 isContinuousPathConversion];
      v9 &= v24 ^ 1;
      v8 &= v24 ^ 1;
    }

    int64_t v25 = -[TIKeyboardTyper maxPredictions](self, "maxPredictions", v3);
    if (v25) {
      uint64_t v26 = v9;
    }
    else {
      uint64_t v26 = 0LL;
    }
    uint64_t v27 = v25 - v26;
    if (v27) {
      uint64_t v28 = v8;
    }
    else {
      uint64_t v28 = 0LL;
    }
    unint64_t v29 = v27 - v28;
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper autocorrectionList](self, "autocorrectionList"));
    v31 = (void *)objc_claimAutoreleasedReturnValue([v30 emojiList]);

    unsigned int v32 = (char *)[v31 count];
    else {
      double v33 = (char *)v29;
    }
    unint64_t v34 = v29 - (void)v33;
    double v35 = (char *)[v22 count];
    else {
      double v36 = (char *)v34;
    }
    if (v9)
    {
      v37 = (void *)objc_claimAutoreleasedReturnValue([v50 input]);
      double v38 = (void *)objc_claimAutoreleasedReturnValue( +[TIKeyboardCandidateSingle candidateWithUnchangedInput:]( &OBJC_CLASS___TIKeyboardCandidateSingle,  "candidateWithUnchangedInput:",  v37));

      [v5 addObject:v38];
    }

    if ((v8 | v17) == 1) {
      [v5 addObject:v50];
    }
    if (v36)
    {
      for (i = 0LL; i != v36; ++i)
      {
        double v40 = (void *)objc_claimAutoreleasedReturnValue([v22 objectAtIndex:i]);
        v41 = v40;
        if (v40 && [v40 slotID])
        {
          v42 = (void *)objc_claimAutoreleasedReturnValue(+[TIAppAutofillManager sharedInstance](&OBJC_CLASS___TIAppAutofillManager, "sharedInstance"));
          v43 = (void *)objc_claimAutoreleasedReturnValue([v42 secureCandidateRenderer]);

          if (v43) {
            id v44 = (id)objc_claimAutoreleasedReturnValue([v43 cachedCandidateForSecureCandidate:v41]);
          }
          else {
            id v44 = v41;
          }
          v45 = v44;
          [v5 addObject:v44];
        }

        else
        {
          [v5 addObject:v41];
        }
      }
    }

    if (v33)
    {
      for (j = 0LL; j != v33; ++j)
      {
        v47 = (void *)objc_claimAutoreleasedReturnValue([v31 objectAtIndex:j]);
        [v5 addObject:v47];
      }
    }

    id v3 = v49;
  }

  return (NSArray *)v5;
}

- (id)predictationBarDebugString
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper predictionBarCandidates](self, "predictionBarCandidates"));
  if ([v3 count] && -[TIKeyboardTyper showsCandidateBar](self, "showsCandidateBar"))
  {
    id v4 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    uint64_t v27 = v3;
    id obj = v3;
    id v5 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v31;
      unsigned int v8 = &CFAbsoluteTimeGetCurrent_ptr;
      unsigned int v9 = &stru_89E80;
      do
      {
        id v10 = 0LL;
        id v28 = v6;
        do
        {
          if (*(void *)v31 != v7) {
            objc_enumerationMutation(obj);
          }
          id v11 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)v10);
          uint64_t v12 = objc_opt_class(v8[93]);
          id v13 = (__CFString *)v9;
          if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
          {
            id v14 = v11;
            id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 lexiconLocale]);

            if (v15)
            {
              uint64_t v16 = v7;
              unsigned int v17 = v4;
              double v18 = v9;
              double v19 = v8;
              unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue([v14 lexiconLocale]);
              id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 substringToIndex:2]);
              id v13 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @" (%@)",  v21));

              unsigned int v8 = v19;
              unsigned int v9 = v18;
              id v4 = v17;
              uint64_t v7 = v16;
              id v6 = v28;
            }

            else
            {
              id v13 = (__CFString *)v9;
            }
          }

          double v22 = (void *)objc_claimAutoreleasedReturnValue([v11 candidate]);
          double v23 = (void *)objc_claimAutoreleasedReturnValue([v22 stringByAppendingString:v13]);
          -[NSMutableArray addObject:](v4, "addObject:", v23);

          id v10 = (char *)v10 + 1;
        }

        while (v6 != v10);
        id v6 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
      }

      while (v6);
    }

    unsigned int v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v4, "componentsJoinedByString:", @"\t"));
    int64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 stringByAppendingString:@"\n"]);

    id v3 = v27;
  }

  else
  {
    int64_t v25 = 0LL;
  }

  return v25;
}

- (NSArray)inlineCompletionCandidates
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper autocorrectionList](self, "autocorrectionList"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 inlineCompletions]);

  return (NSArray *)v3;
}

- (TIKeyboardCandidateResultSet)candidateResultSet
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 candidateResultSet]);

  return (TIKeyboardCandidateResultSet *)v3;
}

- (int64_t)performTouchDownAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  double y = a3.y;
  double x = a3.x;
  -[TIKeyboardTyper setLastTimestamp:](self, "setLastTimestamp:", a5);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  *(float *)&double v15 = a4;
  id v16 = objc_msgSend(v14, "performTouchDownAtLocation:radius:timestamp:pathIndex:fingerID:", a6, v7, x, y, v15, a5);

  return (int64_t)v16;
}

- (int64_t)performTouchDragAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  double y = a3.y;
  double x = a3.x;
  -[TIKeyboardTyper setLastTimestamp:](self, "setLastTimestamp:", a5);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  *(float *)&double v15 = a4;
  id v16 = objc_msgSend(v14, "performTouchDragAtLocation:radius:timestamp:pathIndex:fingerID:", a6, v7, x, y, v15, a5);

  return (int64_t)v16;
}

- (void)performTouchCancelAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  double y = a3.y;
  double x = a3.x;
  -[TIKeyboardTyper setLastTimestamp:](self, "setLastTimestamp:", a5);
  id v15 = (id)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  *(float *)&double v14 = a4;
  objc_msgSend(v15, "performTouchCancelAtLocation:radius:timestamp:pathIndex:fingerID:", a6, v7, x, y, v14, a5);
}

- (void)performTouchRestAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  double y = a3.y;
  double x = a3.x;
  -[TIKeyboardTyper setLastTimestamp:](self, "setLastTimestamp:", a5);
  id v15 = (id)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  *(float *)&double v14 = a4;
  objc_msgSend(v15, "performTouchRestAtLocation:radius:timestamp:pathIndex:fingerID:", a6, v7, x, y, v14, a5);
}

- (void)performTouchEndRestAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  double y = a3.y;
  double x = a3.x;
  -[TIKeyboardTyper setLastTimestamp:](self, "setLastTimestamp:", a5);
  id v15 = (id)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  *(float *)&double v14 = a4;
  objc_msgSend(v15, "performTouchEndRestAtLocation:radius:timestamp:pathIndex:fingerID:", a6, v7, x, y, v14, a5);
}

- (id)performTouchUpAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7
{
  return -[TIKeyboardTyper performTouchUpAtLocation:radius:timestamp:pathIndex:fingerID:secondaryString:]( self,  "performTouchUpAtLocation:radius:timestamp:pathIndex:fingerID:secondaryString:",  a6,  *(void *)&a7,  0LL,  a3.x,  a3.y);
}

- (id)performTouchUpAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7 secondaryString:(BOOL)a8
{
  BOOL v8 = a8;
  uint64_t v9 = *(void *)&a7;
  double y = a3.y;
  double x = a3.x;
  -[TIKeyboardTyper setLastTimestamp:](self, "setLastTimestamp:", a5);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  *(float *)&double v17 = a4;
  double v18 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v16,  "performTouchUpAtLocation:radius:timestamp:pathIndex:fingerID:secondaryString:",  a6,  v9,  v8,  x,  y,  v17,  a5));

  return v18;
}

- (UIKBTree)keyboard
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 keyboard]);

  return (UIKBTree *)v3;
}

- (UIKBTree)keyplane
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 keyplane]);

  return (UIKBTree *)v3;
}

- (id)keyWithString:(id)a3 inKeyplane:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 layoutUtils]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 exactKeyForString:v7 keyplane:v6 includeSecondaryStrings:0]);

  return v10;
}

- (id)keyWithString:(id)a3 inKeyplane:(id)a4 includeSecondaryStrings:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 layoutUtils]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 exactKeyForString:v9 keyplane:v8 includeSecondaryStrings:v5]);

  return v12;
}

- (id)shiftKeyToAccessKeyplaneCloserToKeyString:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyplane](self, "keyplane"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyplane](self, "keyplane"));
  unsigned __int8 v7 = [v6 isShiftKeyplane];

  if ((v7 & 1) == 0)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 layoutUtils]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyplane](self, "keyplane"));
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v10 exactKeyForString:v4 keyplane:v11 includeSecondaryStrings:1]);

    if (v5)
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 keyplane]);
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v13 firstCachedKeyWithName:@"Shift-Key"]);

LABEL_7:
      goto LABEL_8;
    }

- (id)keyToAccessKeyplaneCloserToKeyString:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper _keyplaneCloserToKeyWithString:](self, "_keyplaneCloserToKeyWithString:", a3));
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyplane](self, "keyplane"));
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v5 keyToAccessKeyplane:v4 fromKeyplane:v6]);

  return v7;
}

- (BOOL)changeToNearestKeyplaneWithString:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyplane](self, "keyplane"));
  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyWithString:inKeyplane:](self, "keyWithString:inKeyplane:", v4, v5));
  if (v6)
  {
    unsigned __int8 v7 = (void *)v6;
LABEL_7:
  }

  else
  {
    id v8 = 0LL;
    while (1)
    {
      id v9 = v8;
      id v8 = (void *)objc_claimAutoreleasedReturnValue( -[TIKeyboardTyper keyToAccessKeyplaneCloserToKeyString:]( self,  "keyToAccessKeyplaneCloserToKeyString:",  v4));

      if (!v8) {
        break;
      }
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 representedString]);
      -[TIKeyboardTyper attemptTapOnKeyWithString:withErrorGenerator:typingLog:]( self,  "attemptTapOnKeyWithString:withErrorGenerator:typingLog:",  v10,  0LL,  0LL);

      BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyplane](self, "keyplane"));
      uint64_t v11 = objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyWithString:inKeyplane:](self, "keyWithString:inKeyplane:", v4, v5));
      if (v11)
      {
        unsigned __int8 v7 = (void *)v11;

        goto LABEL_7;
      }
    }
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyplane](self, "keyplane"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyWithString:inKeyplane:](self, "keyWithString:inKeyplane:", v4, v12));
  BOOL v14 = v13 != 0LL;

  return v14;
}

- (BOOL)changeToNearestAlphabeticPlane
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyplane](self, "keyplane"));
  unsigned __int8 v4 = [v3 isAlphabeticPlane];

  if ((v4 & 1) == 0)
  {
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboard](self, "keyboard"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyplane](self, "keyplane"));
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v6 alternateKeyplaneName]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 subtreeWithName:v7]);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyplane](self, "keyplane"));
  unsigned __int8 v10 = [v9 isAlphabeticPlane];

  return v10;
}

- (id)_keyplaneCloserToKeyWithString:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyplane](self, "keyplane"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 componentName]);
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v6 lowercaseString]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithObject:forKey:",  v7,  v7));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObjects:](&OBJC_CLASS___NSMutableArray, "arrayWithObjects:", v7, 0LL));
  while ([v9 count])
  {
    unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndex:0]);
    [v9 removeObjectAtIndex:0];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboard](self, "keyboard"));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 subtreeWithName:v10]);

    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyWithString:inKeyplane:](self, "keyWithString:inKeyplane:", v4, v12));
    if (v13)
    {
      id v14 = v10;
      id v15 = v14;
      do
      {
        id v16 = v14;
        id v14 = v15;

        id v15 = (void *)objc_claimAutoreleasedReturnValue([v8 valueForKey:v14]);
      }

      while (![v15 isEqualToString:v7]);
      double v17 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboard](self, "keyboard"));
      double v18 = (void *)objc_claimAutoreleasedReturnValue([v17 subtreeWithName:v14]);
    }

    else
    {
      double v19 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472LL;
      v21[2] = sub_4B598;
      v21[3] = &unk_89A40;
      id v22 = v8;
      id v14 = v10;
      id v23 = v14;
      id v24 = v9;
      [v19 enumerateKeyplaneNamesAdjacentToKeyplane:v12 usingBlock:v21];

      double v18 = 0LL;
      id v15 = v22;
    }

    if (v18) {
      goto LABEL_11;
    }
  }

  double v18 = 0LL;
LABEL_11:

  return v18;
}

- (CGPoint)pointForAttemptedTapOnKey:(id)a3 withError:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v7 paddedFrame];
  CGFloat x = v37.origin.x;
  CGFloat y = v37.origin.y;
  CGFloat width = v37.size.width;
  CGFloat height = v37.size.height;
  double MidX = CGRectGetMidX(v37);
  v38.origin.CGFloat x = x;
  v38.origin.CGFloat y = y;
  v38.size.CGFloat width = width;
  v38.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v38);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper userPersona](self, "userPersona"));

  if (v14)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper userPersona](self, "userPersona"));
    [v15 userPointForKey:v7];
    double MidX = v16;
    double MidY = v17;
  }

  else
  {
    double v18 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
    double v19 = (void *)objc_claimAutoreleasedReturnValue([v18 layoutUtils]);
    unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyplane](self, "keyplane"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "representedStringForKey:shifted:", v7, objc_msgSend(v20, "isShiftKeyplane")));

    if (v6 && ([v15 isEqualToString:@"\n"] & 1) == 0)
    {
      objc_msgSend(v6, "applyToPoint:", MidX, MidY);
      double MidX = v21;
      double MidY = v22;
    }

    id v23 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboard](self, "keyboard"));
    id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 name]);
    unsigned __int8 v25 = [v24 hasPrefix:@"Dynamic"];

    if ((v25 & 1) == 0)
    {
      if (MidX < 0.0) {
        double MidX = 0.0;
      }
      if (MidY < 0.0) {
        double MidY = 0.0;
      }
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboard](self, "keyboard"));
      [v26 frame];
      double v28 = v27;

      if (MidX > v28)
      {
        unint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboard](self, "keyboard"));
        [v29 frame];
        double MidX = CGRectGetMaxX(v39);
      }

      __int128 v30 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboard](self, "keyboard"));
      [v30 frame];
      double v32 = v31;

      if (MidY > v32)
      {
        __int128 v33 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboard](self, "keyboard"));
        [v33 frame];
        double MidY = CGRectGetMaxY(v40);
      }
    }
  }

  double v34 = MidX;
  double v35 = MidY;
  result.CGFloat y = v35;
  result.CGFloat x = v34;
  return result;
}

- (id)keyContainingPoint:(CGPoint)a3 inKeyplane:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "keyContainingPoint:inKeyplane:", v7, x, y));

  return v9;
}

- (void)_finishKeystrokeAndRecordPredictionsInTypingLog:(id)a3 touchedKey:(id)a4 insertedKey:(id)a5 typingLog:(id)a6
{
  id v30 = a3;
  id v10 = a4;
  id v11 = a5;
  id v29 = a6;
  uint64_t v12 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v13 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper predictionBarCandidates](self, "predictionBarCandidates"));
  id v15 = [v14 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v36;
    do
    {
      double v18 = 0LL;
      do
      {
        if (*(void *)v36 != v17) {
          objc_enumerationMutation(v14);
        }
        double v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v35 + 1) + 8 * (void)v18), "candidate", v29));
        -[NSMutableArray addObject:](v12, "addObject:", v19);

        double v18 = (char *)v18 + 1;
      }

      while (v16 != v18);
      id v16 = [v14 countByEnumeratingWithState:&v35 objects:v40 count:16];
    }

    while (v16);
  }

  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper inlineCompletionCandidates](self, "inlineCompletionCandidates"));
  id v21 = [v20 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v32;
    do
    {
      id v24 = 0LL;
      do
      {
        if (*(void *)v32 != v23) {
          objc_enumerationMutation(v20);
        }
        unsigned __int8 v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v31 + 1) + 8 * (void)v24), "candidate", v29));
        -[NSMutableArray addObject:](v13, "addObject:", v25);

        id v24 = (char *)v24 + 1;
      }

      while (v22 != v24);
      id v22 = [v20 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }

    while (v22);
  }

  if (v10) {
    id v26 = (id)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper _logStringForTouchedKey:](self, "_logStringForTouchedKey:", v10));
  }
  else {
    id v26 = v11;
  }
  double v27 = v26;
  double v28 = v29;
  objc_msgSend( v29,  "finishKeystrokeWithTouchedKey:touchEvent:insertedKey:predictionBarState:inlineCompletionBarState:",  v26,  v30,  v11,  v12,  v13,  v29);
}

- (id)_performTapAtLocation:(CGPoint)a3 timestamp:(double)a4 intendedKey:(id)a5 touchedKey:(id)a6 secondaryString:(BOOL)a7 touchError:(id)a8 typingLog:(id)a9
{
  BOOL v11 = a7;
  double y = a3.y;
  double x = a3.x;
  id v17 = a5;
  id v18 = a6;
  id v19 = a8;
  id v20 = a9;
  if (v11)
  {
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v17 secondaryRepresentedStrings]);
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 firstObject]);
  }

  else
  {
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v17 representedString]);
  }

  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( +[TIKeyboardTouchEvent touchEventWithStage:location:radius:timestamp:pathIndex:forcedKeyCode:]( &OBJC_CLASS___TIKeyboardTouchEvent,  "touchEventWithStage:location:radius:timestamp:pathIndex:forcedKeyCode:",  0LL,  0LL,  -1LL,  x,  y,  5.0,  a4));
  unsigned int v47 = [v22 isEqualToString:@"Delete"];
  id v24 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper text](self, "text"));
  v48 = v19;
  [v20 beginKeystrokeWithIntendedKey:v22 touchEvent:v23 touchError:v19 documentBefore:v24];

  unsigned __int8 v25 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 leftKeys]);
  unsigned __int8 v27 = [v26 containsObject:v17];

  if ((v27 & 1) != 0)
  {
    uint64_t v28 = 3LL;
  }

  else
  {
    id v29 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
    id v30 = (void *)objc_claimAutoreleasedReturnValue([v29 rightKeys]);
    unsigned int v31 = [v30 containsObject:v17];

    if (v31) {
      uint64_t v28 = 9LL;
    }
    else {
      uint64_t v28 = 0LL;
    }
  }

  if ([v18 interactionType] == 11)
  {
    __int128 v32 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
    __int128 v33 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyplane](self, "keyplane"));
    id v34 = [v32 keyCodeWithString:@"More" inKeyplane:v33];

    -[TIKeyboardTyper lastTimestamp](self, "lastTimestamp");
    double v36 = v35;
    -[TIKeyboardTyper interTouchTimestampInterval](self, "interTouchTimestampInterval");
    double v38 = v36 + v37;
    CGRect v39 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
    LODWORD(v40) = 5.0;
    v41 = (__CFString *)objc_claimAutoreleasedReturnValue( objc_msgSend( v39,  "performSkipTapAtLocation:radius:timestamp:pathIndex:fingerID:forcedKeyCode:",  0,  v28,  v34,  x,  y,  v40,  v38));

    v42 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper userPersona](self, "userPersona"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
    id v44 = (void *)objc_claimAutoreleasedReturnValue([v43 keyplane]);
    [v42 updateFromKeyplane:v44];
  }

  else
  {
    v41 = (__CFString *)objc_claimAutoreleasedReturnValue( -[TIKeyboardTyper _performTapAtLocation:timestamp:fingerID:secondaryString:]( self,  "_performTapAtLocation:timestamp:fingerID:secondaryString:",  v28,  v11,  x,  y,  a4));
  }

  if (!v41) {
    v41 = &stru_89E80;
  }
  if (((-[__CFString isEqualToString:](v41, "isEqualToString:", @"\\b") ^ 1 | v47) & 1) == 0)
  {

    v41 = @"\\B";
  }

  -[TIKeyboardTyper setLastTimestamp:](self, "setLastTimestamp:", a4);
  v45 = (void *)objc_claimAutoreleasedReturnValue( +[TIKeyboardTouchEvent touchEventWithStage:location:radius:timestamp:pathIndex:forcedKeyCode:]( &OBJC_CLASS___TIKeyboardTouchEvent,  "touchEventWithStage:location:radius:timestamp:pathIndex:forcedKeyCode:",  2LL,  0LL,  -1LL,  x,  y,  5.0,  a4));
  -[TIKeyboardTyper _finishKeystrokeAndRecordPredictionsInTypingLog:touchedKey:insertedKey:typingLog:]( self,  "_finishKeystrokeAndRecordPredictionsInTypingLog:touchedKey:insertedKey:typingLog:",  v45,  v18,  v41,  v20);

  return v41;
}

- (id)_performTouchEvent:(id)a3 typingLog:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = [v6 stage];
  [v6 location];
  double v10 = v9;
  double v12 = v11;
  [v6 radius];
  float v14 = v13;
  [v6 timestamp];
  double v16 = v15;
  id v17 = [v6 pathIndex];
  id v18 = [v6 fingerID];
  if (v8 == 2)
  {
    id v21 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
    *(float *)&double v22 = v14;
    uint64_t v23 = (__CFString *)objc_claimAutoreleasedReturnValue( objc_msgSend( v21,  "performTouchUpAtLocation:radius:timestamp:pathIndex:fingerID:secondaryString:",  v17,  v18,  0,  v10,  v12,  v22,  v16));

    id v19 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    id v24 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper predictionBarCandidates](self, "predictionBarCandidates"));
    if (-[TIKeyboardTyper maxPredictionsReported](self, "maxPredictionsReported") >= 1)
    {
      unint64_t v25 = 0LL;
      do
      {
        id v26 = (void *)objc_claimAutoreleasedReturnValue([v24 objectAtIndexedSubscript:v25]);
        unsigned __int8 v27 = (void *)objc_claimAutoreleasedReturnValue([v26 candidate]);
        -[NSMutableArray addObject:](v19, "addObject:", v27);

        ++v25;
      }

      while ((uint64_t)v25 < -[TIKeyboardTyper maxPredictionsReported](self, "maxPredictionsReported"));
    }

    [v7 registerPathStringAsKeyStrokes:v23 path:0 predictionBarState:v19];
  }

  else
  {
    if (v8 == 1)
    {
      id v19 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
      *(float *)&double v28 = v14;
      -[NSMutableArray performTouchDragAtLocation:radius:timestamp:pathIndex:fingerID:]( v19,  "performTouchDragAtLocation:radius:timestamp:pathIndex:fingerID:",  v17,  v18,  v10,  v12,  v28,  v16);
    }

    else
    {
      if (v8)
      {
        uint64_t v23 = &stru_89E80;
        goto LABEL_14;
      }

      id v19 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
      *(float *)&double v20 = v14;
      -[NSMutableArray performTouchDownAtLocation:radius:timestamp:pathIndex:fingerID:]( v19,  "performTouchDownAtLocation:radius:timestamp:pathIndex:fingerID:",  v17,  v18,  v10,  v12,  v20,  v16);
    }

    uint64_t v23 = &stru_89E80;
  }

LABEL_14:
  [v6 timestamp];
  -[TIKeyboardTyper setLastTimestamp:](self, "setLastTimestamp:");

  return v23;
}

- (void)_skipTapTimestamp:(double)a3 intendedKey:(id)a4 typingLog:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  [v9 frame];
  double v11 = v10;
  double v13 = v12;
  id v16 = (id)objc_claimAutoreleasedReturnValue( +[TIKeyboardTouchEvent touchEventWithStage:location:radius:timestamp:pathIndex:forcedKeyCode:]( &OBJC_CLASS___TIKeyboardTouchEvent,  "touchEventWithStage:location:radius:timestamp:pathIndex:forcedKeyCode:",  0LL,  0LL,  -1LL));
  float v14 = (void *)objc_claimAutoreleasedReturnValue( +[TIKeyboardTouchEvent touchEventWithStage:location:radius:timestamp:pathIndex:forcedKeyCode:]( &OBJC_CLASS___TIKeyboardTouchEvent,  "touchEventWithStage:location:radius:timestamp:pathIndex:forcedKeyCode:",  2LL,  0LL,  -1LL,  v11,  v13,  5.0,  a3));
  double v15 = (void *)objc_claimAutoreleasedReturnValue([v9 representedString]);

  [v8 beginKeystrokeWithIntendedKey:v15 touchEvent:v16 touchError:0];
  -[TIKeyboardTyper setLastTimestamp:](self, "setLastTimestamp:", a3);
  [v8 finishKeystrokeWithTouchedKey:@"<NoKey>" touchEvent:v14 insertedKey:&stru_89E80];
}

- (id)_performVariantKey:(id)a3 timestamp:(double)a4 typingLog:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  [v8 beginKeystrokeWithIntendedKey:v7 touchEvent:0 touchError:0];
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  [v9 addStringFromVariantKey:v7];

  double v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"<%@>", v7));
  [v8 finishKeystrokeWithTouchedKey:v10 touchEvent:0 insertedKey:v7];

  return v7;
}

- (id)_performGestureKeyInput:(id)a3 timestamp:(double)a4 typingLog:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  [v8 beginKeystrokeWithIntendedKey:v7 touchEvent:0 touchError:0];
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  [v9 addStringFromGestureKeyInput:v7];

  double v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"<%@>", v7));
  [v8 finishKeystrokeWithTouchedKey:v10 touchEvent:0 insertedKey:v7];

  return v7;
}

- (void)_performAcceptCandidate:(id)a3 timestamp:(double)a4 typingLog:(id)a5 predictiveCandidate:(BOOL)a6 intendedTransliteration:(id)a7
{
  BOOL v7 = a6;
  id v12 = a7;
  id v13 = a5;
  id v14 = a3;
  double v15 = (void *)objc_claimAutoreleasedReturnValue([v14 candidate]);
  [v13 logAcceptedCandidate:v15 intendedTransliterationCandidate:v12];

  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  [v16 acceptCandidate:v14 predictiveCandidate:v7];

  -[TIKeyboardTyper setLastTimestamp:](self, "setLastTimestamp:", a4);
  id v17 = (id)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  [v17 generateAutocorrectionsOrCandidates];
}

- (void)_performAcceptCandidate:(id)a3 timestamp:(double)a4 typingLog:(id)a5 predictiveCandidate:(BOOL)a6
{
}

- (void)_performAcceptCandidate:(id)a3 timestamp:(double)a4 typingLog:(id)a5
{
}

- (void)_performAcceptPredictiveCandidate:(id)a3 timestamp:(double)a4 typingLog:(id)a5
{
}

- (void)_performRejectCandidate:(id)a3 timestamp:(double)a4 typingLog:(id)a5
{
  id v8 = a3;
  [a5 logRejectedAutocorrection];
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  [v9 rejectCandidate:v8];

  -[TIKeyboardTyper setLastTimestamp:](self, "setLastTimestamp:", a4);
}

- (void)performStrokeForPath:(id)a3 typingLog:(id)a4 callback:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  double v10 = (void (**)(id, void *, _BYTE *))a5;
  unsigned __int8 v40 = 0;
  double v11 = (void *)objc_claimAutoreleasedReturnValue([v8 samples]);
  id v12 = [v11 count];

  if ((unint64_t)v12 < 2)
  {
    uint64_t v25 = 0LL;
  }

  else
  {
    uint64_t v13 = 0LL;
    while (1)
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v8 samples]);
      double v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectAtIndexedSubscript:v13]);

      id v16 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
      [v15 point];
      double v18 = v17;
      double v20 = v19;
      [v15 timeStamp];
      LODWORD(v22) = 5.0;
      if (v13) {
        objc_msgSend( v16,  "performTouchDragAtLocation:radius:timestamp:pathIndex:fingerID:",  0,  0,  v18,  v20,  v22,  v21);
      }
      else {
        objc_msgSend( v16,  "performTouchDownAtLocation:radius:timestamp:pathIndex:fingerID:",  0,  0,  v18,  v20,  v22,  v21);
      }

      if (v10)
      {
        v10[2](v10, v15, &v40);
        if (v40) {
          break;
        }
      }

      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v8 samples]);
      id v24 = [v23 count];

      uint64_t v25 = v13 + 1;
      unint64_t v26 = v13 + 2;
      ++v13;
    }

    uint64_t v25 = v13;
  }

- (void)_bumpTouchPathID
{
  unint64_t touchPathID = self->_touchPathID;
  if (touchPathID + 1 <= 0x14) {
    unint64_t v3 = touchPathID + 1;
  }
  else {
    unint64_t v3 = 1LL;
  }
  self->_unint64_t touchPathID = v3;
}

- (id)_performTapAtLocation:(CGPoint)a3 timestamp:(double)a4 fingerID:(int)a5 secondaryString:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v7 = *(void *)&a5;
  double y = a3.y;
  double x = a3.x;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  LODWORD(v13) = 5.0;
  objc_msgSend( v12,  "performTouchDownAtLocation:radius:timestamp:pathIndex:fingerID:",  self->_touchPathID,  v7,  x,  y,  v13,  a4);

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  LODWORD(v15) = 5.0;
  id v16 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v14,  "performTouchUpAtLocation:radius:timestamp:pathIndex:fingerID:secondaryString:",  self->_touchPathID,  v7,  v6,  x,  y,  v15,  a4));

  -[TIKeyboardTyper _bumpTouchPathID](self, "_bumpTouchPathID");
  double v17 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper userPersona](self, "userPersona"));
  double v18 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  double v19 = (void *)objc_claimAutoreleasedReturnValue([v18 keyplane]);
  [v17 updateFromKeyplane:v19];

  return v16;
}

- (id)_logStringForTouchedKey:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (v4)
  {
    unsigned int v6 = [v4 interactionType];
    if (v6 <= 0x10 && ((1 << v6) & 0x1A006) != 0)
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 layoutUtils]);
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyplane](self, "keyplane"));
      double v10 = (__CFString *)objc_claimAutoreleasedReturnValue( objc_msgSend( v8,  "representedStringForKey:shifted:",  v5,  objc_msgSend(v9, "isShiftKeyplane")));
    }

    else
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 representedString]);
      double v10 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@>",  v7));
    }
  }

  else
  {
    double v10 = @"<NoKey>";
  }

  return v10;
}

- (id)tokensForString:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper userModel](self, "userModel"));
  unsigned int v6 = [v5 prefersTransliteration];

  if (v6)
  {
    id v12 = v4;
    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v12, 1LL));
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper userModel](self, "userModel"));
    unsigned int v9 = [v8 prefersContinuousPath];

    if (v9) {
      uint64_t v7 = objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper inputSegmentsForContinuousPathString:](self, "inputSegmentsForContinuousPathString:", v4));
    }
    else {
      uint64_t v7 = objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper inputSegmentsForString:](self, "inputSegmentsForString:", v4));
    }
  }

  double v10 = (void *)v7;

  return v10;
}

- (id)inputSegmentsForString:(id)a3
{
  return TITestTyperTokensForString(a3, 0LL);
}

- (BOOL)priorTokenisString:(id)a3 i:(unint64_t)a4
{
  if (a4)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 objectAtIndex:a4 - 1]);
    id v5 = objc_msgSend(v4, "characterAtIndex:", (char *)objc_msgSend(v4, "length") - 1);
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet decimalDigitCharacterSet](&OBJC_CLASS___NSCharacterSet, "decimalDigitCharacterSet"));
    if ([v6 characterIsMember:v5])
    {
      LOBYTE(v7) = 0;
    }

    else
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet punctuationCharacterSet](&OBJC_CLASS___NSCharacterSet, "punctuationCharacterSet"));
      unsigned int v7 = ((_DWORD)v5 != 32) & ~[v8 characterIsMember:v5];
    }
  }

  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (BOOL)postTokenisString:(id)a3 i:(unint64_t)a4
{
  id v5 = a3;
  if ((char *)[v5 count] - 1 <= (char *)a4)
  {
    LOBYTE(v9) = 0;
  }

  else
  {
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndex:a4 + 1]);
    id v7 = [v6 characterAtIndex:0];
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet decimalDigitCharacterSet](&OBJC_CLASS___NSCharacterSet, "decimalDigitCharacterSet"));
    if ([v8 characterIsMember:v7])
    {
      LOBYTE(v9) = 0;
    }

    else
    {
      double v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet punctuationCharacterSet](&OBJC_CLASS___NSCharacterSet, "punctuationCharacterSet"));
      unsigned int v9 = ((_DWORD)v7 != 32) & ~[v10 characterIsMember:v7];
    }
  }

  return v9;
}

- (id)mergeHyphenatedWord:(id)a3 string:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 lastObject]);
    [v5 removeLastObject];
    id v8 = (id)objc_claimAutoreleasedReturnValue([v7 stringByAppendingString:v6]);
  }

  else
  {
    id v8 = v6;
  }

  return v8;
}

- (id)inputSegmentsForContinuousPathString:(id)a3
{
  id v4 = TITestTyperTokensForString(a3, 0LL);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  if ([v5 count])
  {
    unint64_t v7 = 0LL;
    char v8 = 0;
    do
    {
      unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndex:v7]);
      if ((v8 & 1) != 0)
      {
        uint64_t v10 = objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper mergeHyphenatedWord:string:](self, "mergeHyphenatedWord:string:", v6, v9));

        unsigned int v9 = (void *)v10;
      }

      if ([v9 isEqualToString:@"-"]
        && -[TIKeyboardTyper priorTokenisString:i:](self, "priorTokenisString:i:", v5, v7)
        && -[TIKeyboardTyper postTokenisString:i:](self, "postTokenisString:i:", v5, v7))
      {
        uint64_t v11 = objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper mergeHyphenatedWord:string:](self, "mergeHyphenatedWord:string:", v6, v9));

        char v8 = 1;
        unsigned int v9 = (void *)v11;
      }

      else
      {
        char v8 = 0;
      }

      [v6 addObject:v9];

      ++v7;
    }

    while (v7 < (unint64_t)[v5 count]);
  }

  return v6;
}

- (id)transliteratedTokensForString:(id)a3
{
  return TITestTyperTokensForString(a3, 0LL);
}

- (id)externalStringToInternal:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 inputManager]);
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 externalStringToInternal:v4]);

  return v7;
}

- (id)internalStringToExternal:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 inputManager]);
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 internalStringToExternal:v4]);

  return v7;
}

- (id)splitDigraphsInString:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper inputMode](self, "inputMode"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 languageWithRegion]);
  unsigned int v7 = [v6 hasPrefix:@"de_"];

  if (v7)
  {
    char v8 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByReplacingOccurrencesOfString:@"ß" withString:@"ss"]);

    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboard](self, "keyboard"));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 subtrees]);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndex:0]);

    if ([v11 isShiftKeyplane])
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboard](self, "keyboard"));
      double v13 = (void *)objc_claimAutoreleasedReturnValue([v11 shiftAlternateKeyplaneName]);
      uint64_t v14 = objc_claimAutoreleasedReturnValue([v12 subtreeWithName:v13]);

      uint64_t v11 = (void *)v14;
    }

    double v15 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
    id v16 = [v15 keyCodeWithString:@"ü" inKeyplane:v11];

    if (v16 == (id)-1LL)
    {
      double v17 = (void *)objc_claimAutoreleasedReturnValue([v8 stringByReplacingOccurrencesOfString:@"Ä" withString:@"Ae"]);

      double v18 = (void *)objc_claimAutoreleasedReturnValue([v17 stringByReplacingOccurrencesOfString:@"Ö" withString:@"Oe"]);
      double v19 = (void *)objc_claimAutoreleasedReturnValue([v18 stringByReplacingOccurrencesOfString:@"Ü" withString:@"Ue"]);

      double v20 = (void *)objc_claimAutoreleasedReturnValue([v19 stringByReplacingOccurrencesOfString:@"ä" withString:@"ae"]);
      double v21 = (void *)objc_claimAutoreleasedReturnValue([v20 stringByReplacingOccurrencesOfString:@"ö" withString:@"oe"]);

      char v8 = (void *)objc_claimAutoreleasedReturnValue([v21 stringByReplacingOccurrencesOfString:@"ü" withString:@"ue"]);
    }

    goto LABEL_8;
  }

  double v22 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper inputMode](self, "inputMode"));
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 languageWithRegion]);
  unsigned int v24 = [v23 hasPrefix:@"fr_"];

  if (v24)
  {
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByReplacingOccurrencesOfString:@"æ" withString:@"ae"]);

    unint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v25 stringByReplacingOccurrencesOfString:@"œ" withString:@"oe"]);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v26 stringByReplacingOccurrencesOfString:@"Æ" withString:@"AE"]);

    char v8 = (void *)objc_claimAutoreleasedReturnValue([v11 stringByReplacingOccurrencesOfString:@"Œ" withString:@"OE"]);
LABEL_8:

    id v4 = v8;
  }

  return v4;
}

- (void)learnWord:(id)a3 withCount:(unint64_t)a4
{
  id v6 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_4D23C;
  v12[3] = &unk_89A68;
  v12[4] = self;
  double v13 = &off_90580;
  unsigned int v7 = objc_retainBlock(v12);
  -[TIKeyboardTyper syncToEmptyDocument](self, "syncToEmptyDocument");
  -[TIKeyboardTyper attemptToTypeText:](self, "attemptToTypeText:", @"- -  - - . ");
  -[TIKeyboardTyper syncToEmptyDocument](self, "syncToEmptyDocument");
  for (; a4; --a4)
  {
    uint64_t v8 = ((uint64_t (*)(void *))v7[2])(v7);
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[TIKeyboardTyper attemptToTypeText:](self, "attemptToTypeText:", v9);

    -[TIKeyboardTyper attemptToTypeText:](self, "attemptToTypeText:", @" ");
    -[TIKeyboardTyper attemptToTypeText:](self, "attemptToTypeText:", v6);
    -[TIKeyboardTyper rejectAutocorrection](self, "rejectAutocorrection");
    -[TIKeyboardTyper attemptToTypeText:](self, "attemptToTypeText:", @" ");
    uint64_t v10 = ((uint64_t (*)(void *))v7[2])(v7);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    -[TIKeyboardTyper attemptToTypeText:](self, "attemptToTypeText:", v11);

    -[TIKeyboardTyper attemptToTypeText:](self, "attemptToTypeText:", @". ");
    -[TIKeyboardTyper syncToEmptyDocument](self, "syncToEmptyDocument");
  }
}

- (BOOL)usePartialCandidates
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper userModel](self, "userModel"));
  unsigned __int8 v3 = [v2 usePartialCandidates];

  return v3;
}

- (BOOL)inPartialCandidateSelection
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper userActionStream](self, "userActionStream"));
  unsigned __int8 v3 = [v2 inPartialCandidateSelection];

  return v3;
}

- (ACTUserActionStreaming)userActionStream
{
  return self->_userActionStream;
}

- (TITestUserPersona)userPersona
{
  return self->_userPersona;
}

- (void)setUserPersona:(id)a3
{
}

- (ACTKeyboardController)keyboardController
{
  return self->_keyboardController;
}

- (double)interTouchTimestampInterval
{
  return self->_interTouchTimestampInterval;
}

- (void)setInterTouchTimestampInterval:(double)a3
{
  self->_interTouchTimestampInterval = a3;
}

- (BOOL)shouldDecomposeInputString
{
  return self->_shouldDecomposeInputString;
}

- (void)setShouldDecomposeInputString:(BOOL)a3
{
  self->_shouldDecomposeInputString = a3;
}

- (int)maxPredictionsReported
{
  return self->_maxPredictionsReported;
}

- (void)setMaxPredictionsReported:(int)a3
{
  self->_maxPredictionsReported = a3;
}

- (int64_t)maxPredictions
{
  return self->_maxPredictions;
}

- (void)setMaxPredictions:(int64_t)a3
{
  self->_maxPredictions = a3;
}

- (BOOL)logDocumentContext
{
  return self->_logDocumentContext;
}

- (void)setLogDocumentContext:(BOOL)a3
{
  self->_logDocumentContext = a3;
}

- (BOOL)warnIfSelectingPopupVariant
{
  return self->_warnIfSelectingPopupVariant;
}

- (void)setWarnIfSelectingPopupVariant:(BOOL)a3
{
  self->_warnIfSelectingPopupVariant = a3;
}

- (NSString)badSentenceLogFilePath
{
  return self->_badSentenceLogFilePath;
}

- (void)setBadSentenceLogFilePath:(id)a3
{
}

- (BOOL)printTypingTranscript
{
  return self->_printTypingTranscript;
}

- (void)setPrintTypingTranscript:(BOOL)a3
{
  self->_printTypingTranscript = a3;
}

- (BOOL)showsCandidateBar
{
  return self->_showsCandidateBar;
}

- (void)setShowsCandidateBar:(BOOL)a3
{
  self->_showsCandidateBar = a3;
}

- (BOOL)printTranslitSummaries
{
  return self->_printTranslitSummaries;
}

- (void)setPrintTranslitSummaries:(BOOL)a3
{
  self->_printTranslitSummaries = a3;
}

- (NSDictionary)shiftedKeyToUnShiftedKeyExcludeCapitalizationMap
{
  return self->_shiftedKeyToUnShiftedKeyExcludeCapitalizationMap;
}

- (void)setShiftedKeyToUnShiftedKeyExcludeCapitalizationMap:(id)a3
{
}

- (TIInputMode)inputMode
{
  return self->_inputMode;
}

- (void)setInputMode:(id)a3
{
}

- (double)lastTimestamp
{
  return self->_lastTimestamp;
}

- (void)setLastTimestamp:(double)a3
{
  self->_lastTimestamp = a3;
}

- (unint64_t)learnWordContextIndex
{
  return self->_learnWordContextIndex;
}

- (void)setLearnWordContextIndex:(unint64_t)a3
{
  self->_learnWordContextIndedouble x = a3;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
}

- (void).cxx_destruct
{
}

- (TIKeyboardInputManagerFactory)keyboardInputManagerFactory
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 keyboardInputManagerFactory]);

  return (TIKeyboardInputManagerFactory *)v3;
}

- (void)setKeyboardInputManagerFactory:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  [v5 setKeyboardInputManagerFactory:v4];
}

- (NSString)inputModeIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 inputModeIdentifier]);

  return (NSString *)v3;
}

- (void)setInputModeIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  [v5 setInputModeIdentifier:v4];
}

- (BOOL)asyncPredictions
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  unsigned __int8 v3 = [v2 asyncPredictions];

  return v3;
}

- (void)setAsyncPredictions:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  [v4 setAsyncPredictions:v3];
}

- (void)setKeyboard:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  [v5 setKeyboard:v4];

  -[TIKeyboardTyper setShiftedKeyToUnShiftedKeyExcludeCapitalizationMap]( self,  "setShiftedKeyToUnShiftedKeyExcludeCapitalizationMap");
}

- (void)setShiftedKeyToUnShiftedKeyExcludeCapitalizationMap
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper inputMode](self, "inputMode"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 languageWithRegion]);
  unsigned __int8 v5 = [v4 isEqualToString:@"th_TH"];

  if ((v5 & 1) == 0)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboard](self, "keyboard"));
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyplane](self, "keyplane"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 shiftAlternateKeyplaneName]);
    id v40 = (id)objc_claimAutoreleasedReturnValue([v6 subtreeWithName:v8]);

    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v40 name]);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyplane](self, "keyplane"));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 name]);
    unsigned __int8 v12 = [v9 isEqualToString:v11];

    if ((v12 & 1) == 0)
    {
      double v36 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      double v13 = (void *)objc_claimAutoreleasedReturnValue([v40 keys]);
      if ([v13 count])
      {
        uint64_t v14 = 0LL;
        while (1)
        {
          double v15 = (void *)objc_claimAutoreleasedReturnValue([v13 objectAtIndex:v14]);
          [v15 paddedFrame];
          CGFloat x = v41.origin.x;
          CGFloat y = v41.origin.y;
          CGFloat width = v41.size.width;
          CGFloat height = v41.size.height;
          double MidX = CGRectGetMidX(v41);
          v42.origin.CGFloat x = x;
          v42.origin.CGFloat y = y;
          v42.size.CGFloat width = width;
          v42.size.CGFloat height = height;
          double MidY = CGRectGetMidY(v42);
          double v22 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyplane](self, "keyplane"));
          uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( -[TIKeyboardTyper keyContainingPoint:inKeyplane:]( self,  "keyContainingPoint:inKeyplane:",  v22,  MidX,  MidY));

          if (!v23) {
            goto LABEL_16;
          }
          [v23 paddedFrame];
          CGFloat v24 = v43.origin.x;
          CGFloat v25 = v43.origin.y;
          CGFloat v26 = v43.size.width;
          CGFloat v27 = v43.size.height;
          double v28 = CGRectGetMidX(v43);
          v44.origin.CGFloat x = v24;
          v44.origin.CGFloat y = v25;
          v44.size.CGFloat width = v26;
          v44.size.CGFloat height = v27;
          double v29 = CGRectGetMidY(v44);
          if (v28 != MidX || v29 != MidY) {
            goto LABEL_16;
          }
          unsigned int v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "representedString", v29));
          __int128 v32 = (void *)objc_claimAutoreleasedReturnValue([v15 representedString]);
          double v38 = (void *)objc_claimAutoreleasedReturnValue([v23 representedString]);
          CGRect v39 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper inputMode](self, "inputMode"));
          double v33 = (void *)objc_claimAutoreleasedReturnValue([v39 locale]);
          double v34 = (void *)objc_claimAutoreleasedReturnValue([v38 uppercaseStringWithLocale:v33]);
          double v35 = (void *)objc_claimAutoreleasedReturnValue([v15 representedString]);
          unsigned __int8 v37 = [v34 isEqualToString:v35];

          if ((v37 & 1) == 0)
          {
            unsigned int v31 = (void *)objc_claimAutoreleasedReturnValue([v15 representedString]);
            -[NSMutableDictionary setValue:forKey:](v36, "setValue:forKey:", v23, v31);
            goto LABEL_15;
          }

- (BOOL)isShifted
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  unsigned __int8 v3 = [v2 isShifted];

  return v3;
}

- (BOOL)isAutoshifted
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  unsigned __int8 v3 = [v2 isAutoshifted];

  return v3;
}

- (NSString)clientIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 clientIdentifier]);

  return (NSString *)v3;
}

- (void)setClientIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  [v5 setClientIdentifier:v4];
}

- (NSString)recipientIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 recipientIdentifier]);

  return (NSString *)v3;
}

- (void)setRecipientIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  [v5 setRecipientIdentifier:v4];
}

- (TIInputContextHistory)inputContextHistory
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 inputContextHistory]);

  return (TIInputContextHistory *)v3;
}

- (void)setInputContextHistory:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  [v5 setInputContextHistory:v4];
}

- (BOOL)nextKeyIsMultitap
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  unsigned __int8 v3 = [v2 nextKeyIsMultitap];

  return v3;
}

- (void)setNextKeyIsMultitap:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  [v4 setNextKeyIsMultitap:v3];
}

- (TIKeyboardInputManager)inputManager
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 inputManager]);

  return (TIKeyboardInputManager *)v3;
}

- (BOOL)usesAutocorrection
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  unsigned __int8 v3 = [v2 usesAutocorrection];

  return v3;
}

- (void)setUsesAutocorrection:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  [v4 setUsesAutocorrection:v3];
}

- (unint64_t)autocorrectionType
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  id v3 = [v2 autocorrectionType];

  return (unint64_t)v3;
}

- (void)setAutocorrectionType:(unint64_t)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  [v4 setAutocorrectionType:a3];
}

- (BOOL)usesPrediction
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  unsigned __int8 v3 = [v2 usesPrediction];

  return v3;
}

- (void)setUsesPrediction:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  [v4 setUsesPrediction:v3];
}

- (BOOL)usesAutocapitalization
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  unsigned __int8 v3 = [v2 usesAutocapitalization];

  return v3;
}

- (void)setUsesAutocapitalization:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  [v4 setUsesAutocapitalization:v3];
}

- (unint64_t)autocapitalizationType
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  id v3 = [v2 autocapitalizationType];

  return (unint64_t)v3;
}

- (void)setAutocapitalizationType:(unint64_t)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  [v4 setAutocapitalizationType:a3];
}

- (BOOL)wordLearningEnabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  unsigned __int8 v3 = [v2 wordLearningEnabled];

  return v3;
}

- (void)setWordLearningEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  [v4 setWordLearningEnabled:v3];
}

- (BOOL)inlineCompletionEnabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  unsigned __int8 v3 = [v2 inlineCompletionEnabled];

  return v3;
}

- (void)setInlineCompletionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  [v4 setInlineCompletionEnabled:v3];
}

- (BOOL)hardwareKeyboardMode
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  unsigned __int8 v3 = [v2 hardwareKeyboardMode];

  return v3;
}

- (void)setHardwareKeyboardMode:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  [v4 setHardwareKeyboardMode:v3];
}

- (BOOL)shouldSkipCandidateSelection
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  unsigned __int8 v3 = [v2 shouldSkipCandidateSelection];

  return v3;
}

- (void)setShouldSkipCandidateSelection:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3) {
    -[TIKeyboardTyper acceptAutocorrection](self, "acceptAutocorrection");
  }
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  [v5 setShouldSkipCandidateSelection:v3];
}

- (BOOL)longPredictionListEnabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  unsigned __int8 v3 = [v2 longPredictionListEnabled];

  return v3;
}

- (void)setLongPredictionListEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  [v4 setLongPredictionListEnabled:v3];
}

- (BOOL)usesTransliteration
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  unsigned __int8 v3 = [v2 usesTransliteration];

  return v3;
}

- (void)setUsesTransliteration:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  [v4 setUsesTransliteration:v3];
}

- (BOOL)insertsSpaceAfterPredictiveInput
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  unsigned __int8 v3 = [v2 insertsSpaceAfterPredictiveInput];

  return v3;
}

- (void)setInsertsSpaceAfterPredictiveInput:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  [v4 setInsertsSpaceAfterPredictiveInput:v3];
}

- (id)mapShiftedKeyToUnShiftedKeyExcludeCapitalization:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[TIKeyboardTyper shiftedKeyToUnShiftedKeyExcludeCapitalizationMap]( self,  "shiftedKeyToUnShiftedKeyExcludeCapitalizationMap"));

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( -[TIKeyboardTyper shiftedKeyToUnShiftedKeyExcludeCapitalizationMap]( self,  "shiftedKeyToUnShiftedKeyExcludeCapitalizationMap"));
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v4]);
  }

  else
  {
    unsigned int v7 = 0LL;
  }

  return v7;
}

- (NSString)text
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 text]);

  return (NSString *)v3;
}

- (_NSRange)selectedRange
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  id v3 = [v2 selectedRange];
  NSUInteger v5 = v4;

  NSUInteger v6 = (NSUInteger)v3;
  NSUInteger v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (void)setSelectedRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  NSUInteger v6 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  objc_msgSend(v6, "setSelectedRange:", location, length);

  id v7 = (id)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  [v7 generateAutocorrectionsOrCandidates];
}

- (NSString)markedText
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 markedText]);

  return (NSString *)v3;
}

- (void)insertText:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  [v5 insertText:v4];
}

- (void)commitText
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  [v2 commitText];
}

- (void)adjustCursorByOffset:(int64_t)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  [v5 adjustCursorByOffset:a3];

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  [v6 generateAutocorrectionsOrCandidates];
}

- (void)adjustPhraseBoundaryInForwardDirection:(BOOL)a3 granularity:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  BOOL v5 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  [v7 adjustPhraseBoundaryInForwardDirection:v5 granularity:v4];

  id v8 = (id)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  [v8 generateAutocorrectionsOrCandidates];
}

- (void)adjustPhraseBoundaryByOffset:(int64_t)a3 granularity:(int)a4
{
  if ((_DWORD)a3)
  {
    uint64_t v4 = *(void *)&a4;
    else {
      int v6 = -(int)a3;
    }
    BOOL v7 = a3 >= 0;
    do
    {
      -[TIKeyboardTyper adjustPhraseBoundaryInForwardDirection:granularity:]( self,  "adjustPhraseBoundaryInForwardDirection:granularity:",  v7,  v4);
      --v6;
    }

    while (v6);
  }

- (unint64_t)cursorLocationInMarkedText
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 keyboardState]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 documentState]);
  id v5 = [v4 selectedRangeInMarkedText];

  return (unint64_t)v5;
}

- (id)displayStringOverrideForKey:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 displayStringOverrideForKey:v4]);

  return v6;
}

- (NSArray)predictions
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 predictions]);

  return (NSArray *)v3;
}

- (TIAutocorrectionList)autocorrectionList
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 autocorrectionList]);

  return (TIAutocorrectionList *)v3;
}

- (void)setAutocorrectionList:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  [v5 setAutocorrectionList:v4];
}

- (void)generateCandidates
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  [v2 generateAutocorrectionsOrCandidates];
}

- (void)generateAutocorrectionsWithShiftState:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  [v4 generateAutocorrectionsWithShiftState:v3];
}

- (id)candidatesForString:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 candidatesForString:v4]);

  return v6;
}

- (BOOL)hasPrediction:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  unsigned __int8 v6 = [v5 hasPrediction:v4];

  return v6;
}

- (void)acceptCandidateInputEvent:(id)a3 fromCandidateBar:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  [v7 acceptCandidateInputEvent:v6 fromCandidateBar:v4];
}

- (void)acceptCandidateFromPredictionBar:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___TIKeyboardInput);
  [v5 setString:@" "];
  [v5 setAcceptedCandidate:v4];

  [v5 setSynthesizedByAcceptingCandidate:1];
  -[TIKeyboardTyper acceptCandidateInputEvent:fromCandidateBar:]( self,  "acceptCandidateInputEvent:fromCandidateBar:",  v5,  1LL);
}

- (BOOL)attemptToTapPredictionWithString:(id)a3
{
  id v4 = a3;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper predictions](self, "predictions", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 candidate]);
        unsigned int v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          -[TIKeyboardTyper acceptCandidateFromPredictionBar:](self, "acceptCandidateFromPredictionBar:", v10);
          BOOL v13 = 1;
          goto LABEL_11;
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  BOOL v13 = 0;
LABEL_11:

  return v13;
}

- (BOOL)attemptToTapPredictionBarCandidateWithString:(id)a3
{
  id v4 = a3;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper predictionBarCandidates](self, "predictionBarCandidates", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 candidate]);
        unsigned int v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          -[TIKeyboardTyper acceptCandidateFromPredictionBar:](self, "acceptCandidateFromPredictionBar:", v10);
          BOOL v13 = 1;
          goto LABEL_11;
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  BOOL v13 = 0;
LABEL_11:

  return v13;
}

- (BOOL)attemptToTapAutocorrectionWithString:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper autocorrection](self, "autocorrection"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper autocorrection](self, "autocorrection"));
  unsigned int v7 = [v6 isAutocorrection];

  if (v7
    && (uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 candidate]),
        unsigned int v9 = [v8 isEqualToString:v4],
        v8,
        v9))
  {
    -[TIKeyboardTyper acceptCandidateFromPredictionBar:](self, "acceptCandidateFromPredictionBar:", v5);
    BOOL v10 = 1;
  }

  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (void)attemptToTapPredictionWithLiteral:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue( +[TIKeyboardCandidateSingle candidateWithUnchangedInput:]( &OBJC_CLASS___TIKeyboardCandidateSingle,  "candidateWithUnchangedInput:",  a3));
  -[TIKeyboardTyper acceptCandidateFromPredictionBar:](self, "acceptCandidateFromPredictionBar:", v4);
}

@end