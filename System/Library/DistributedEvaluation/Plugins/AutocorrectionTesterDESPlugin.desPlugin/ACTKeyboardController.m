@interface ACTKeyboardController
- (ACTKeyboardController)init;
- (ACTKeyboardController)initWithInputMode:(id)a3;
- (ACTKeyboardLayoutUtils)layoutUtils;
- (BOOL)asyncPredictions;
- (BOOL)canSuggestSupplementalItemsForCurrentSelection;
- (BOOL)generatesCandidates;
- (BOOL)hardwareKeyboardMode;
- (BOOL)hasPrediction:(id)a3;
- (BOOL)inlineCompletionEnabled;
- (BOOL)inputIsPunctuationFollowingContinuousPath;
- (BOOL)insertsSpaceAfterPredictiveInput;
- (BOOL)isAutoshifted;
- (BOOL)isContinuousPathNonSpacePunctuation:(unsigned int)a3;
- (BOOL)isKeyStringAboveSpaceBar:(id)a3;
- (BOOL)isKeyplane:(id)a3 alternateOfKeyplane:(id)a4;
- (BOOL)isKeyplane:(id)a3 shiftAlternateOfKeyplane:(id)a4;
- (BOOL)isScreenLocked;
- (BOOL)isShifted;
- (BOOL)justAcceptedAutocorrection;
- (BOOL)lastInputWasContinuousPath;
- (BOOL)lastInputWasSelection;
- (BOOL)longPredictionListEnabled;
- (BOOL)nextKeyIsFlick;
- (BOOL)nextKeyIsMultitap;
- (BOOL)secureTextEntry;
- (BOOL)shouldAcceptCandidate:(id)a3 beforeInputString:(id)a4;
- (BOOL)shouldSkipCandidateSelection;
- (BOOL)syncToKeyboardStateByWaitingForResults:(BOOL)a3;
- (BOOL)touchPassesDragThresholdAtPoint:(CGPoint)a3 pathIndex:(unint64_t)a4;
- (BOOL)usesAutocapitalization;
- (BOOL)usesAutocorrection;
- (BOOL)usesPrediction;
- (BOOL)usesTransliteration;
- (BOOL)wordLearningEnabled;
- (NSArray)keys;
- (NSArray)predictions;
- (NSCondition)requestCondition;
- (NSLock)cpRequestTokenLock;
- (NSMutableDictionary)activeTouchState;
- (NSMutableSet)leftKeys;
- (NSMutableSet)rightKeys;
- (NSString)clientIdentifier;
- (NSString)inputModeIdentifier;
- (NSString)lastCommittedText;
- (NSString)markedText;
- (NSString)recipientIdentifier;
- (NSString)text;
- (NSUUID)documentIdentifier;
- (TIAutocorrectionList)autocorrectionList;
- (TICandidateRequestToken)currentRequestToken;
- (TICandidateRequestToken)lastCPRequestToken;
- (TIInputContextHistory)inputContextHistory;
- (TIInputMode)inputMode;
- (TIKeyboardCandidate)autocorrection;
- (TIKeyboardCandidate)inlineCompletion;
- (TIKeyboardCandidateResultSet)candidateResultSet;
- (TIKeyboardInputManager)existingInputManager;
- (TIKeyboardInputManager)inputManager;
- (TIKeyboardInputManagerFactory)keyboardInputManagerFactory;
- (TIKeyboardInputManagerState)inputManagerState;
- (TIKeyboardInputManagerWrapper)inputManagerWrapper;
- (TIKeyboardIntermediateText)intermediateText;
- (TIKeyboardState)keyboardState;
- (TISmartPunctuationController)smartPunctuationController;
- (TTKSimpleKeyboardPlane)ttkLayout;
- (UIKBTree)keyboard;
- (UIKBTree)keyplane;
- (_NSRange)selectedRange;
- (_NSRange)selectedRangeForText:(id)a3;
- (float)distanceFromKey:(id)a3 toPoint:(CGPoint)a4;
- (id)adjustContinuousPathCandidate:(id)a3;
- (id)candidateByApplyingSmartPunctuationToCandidate:(id)a3;
- (id)candidateToConfirmInputString;
- (id)candidatesForString:(id)a3;
- (id)clonedKeyboardState;
- (id)createKeyboardInputManagerWrapper;
- (id)displayStringOverrideForKey:(id)a3;
- (id)keyContainingPoint:(CGPoint)a3 inKeyplane:(id)a4;
- (id)keyToAccessKeyplane:(id)a3 fromKeyplane:(id)a4;
- (id)performSkipTapAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7 forcedKeyCode:(int64_t)a8;
- (id)performTouchUpAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7 secondaryString:(BOOL)a8;
- (id)trimmedCandidate:(id)a3;
- (int64_t)keyCodeWithString:(id)a3 inKeyplane:(id)a4;
- (int64_t)performTouchDownAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7;
- (int64_t)performTouchDragAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7;
- (int64_t)retestTouchAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7;
- (unint64_t)autocapitalizationType;
- (unint64_t)autocorrectionType;
- (unint64_t)supplementalLexiconIdentifier;
- (void)acceptAutocorrection;
- (void)acceptCandidate:(id)a3;
- (void)acceptCandidate:(id)a3 predictiveCandidate:(BOOL)a4;
- (void)acceptCandidateInputEvent:(id)a3 fromCandidateBar:(BOOL)a4;
- (void)addInput:(id)a3 fromVariantKey:(BOOL)a4 fromGestureKey:(BOOL)a5;
- (void)addInput:(id)a3 fromVariantKey:(BOOL)a4 fromGestureKey:(BOOL)a5 touchEvent:(id)a6;
- (void)addInput:(id)a3 fromVariantKey:(BOOL)a4 touchEvent:(id)a5;
- (void)addStringFromGestureKeyInput:(id)a3;
- (void)addStringFromVariantKey:(id)a3;
- (void)adjustCursorByOffset:(int64_t)a3;
- (void)adjustKeyplaneEmulatingKBStar:(id)a3;
- (void)adjustPhraseBoundaryInForwardDirection:(BOOL)a3 granularity:(int)a4;
- (void)alternateKeyplane;
- (void)closeRequestToken:(id)a3;
- (void)commitText;
- (void)dealloc;
- (void)deleteBackwards;
- (void)deleteInput;
- (void)deleteInput:(id)a3;
- (void)deleteText:(id)a3 rawText:(id)a4;
- (void)divideKeyplane:(id)a3 intoLeft:(id)a4 right:(id)a5;
- (void)enumerateKeyplaneNamesAdjacentToKeyplane:(id)a3 usingBlock:(id)a4;
- (void)generateAutocorrectionsOrCandidates;
- (void)generateAutocorrectionsWithCount:(unint64_t)a3;
- (void)generateAutocorrectionsWithKeyboardState:(id)a3;
- (void)generateAutocorrectionsWithShiftState:(int)a3;
- (void)generateCandidates;
- (void)generateCandidatesWithKeyboardState:(id)a3;
- (void)handleKeyboardInput:(id)a3;
- (void)insertText:(id)a3;
- (void)insertTextAfterSelection:(id)a3;
- (void)mergeFrameFromKey:(id)a3 intoKey:(id)a4;
- (void)performTouchCancelAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7;
- (void)performTouchEndRestAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7;
- (void)performTouchRestAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7;
- (void)pushAutocorrections:(id)a3 requestToken:(id)a4;
- (void)pushCandidateResultSet:(id)a3 requestToken:(id)a4;
- (void)registerLayoutWithFavonius;
- (void)rejectCandidate:(id)a3;
- (void)reset;
- (void)setActiveTouchState:(id)a3;
- (void)setAsyncPredictions:(BOOL)a3;
- (void)setAutocapitalizationType:(unint64_t)a3;
- (void)setAutocorrectionList:(id)a3;
- (void)setAutocorrectionType:(unint64_t)a3;
- (void)setCanSuggestSupplementalItemsForCurrentSelection:(BOOL)a3;
- (void)setCandidateResultSet:(id)a3;
- (void)setClientIdentifier:(id)a3;
- (void)setCpRequestTokenLock:(id)a3;
- (void)setCurrentRequestToken:(id)a3;
- (void)setDocumentIdentifier:(id)a3;
- (void)setHardwareKeyboardMode:(BOOL)a3;
- (void)setInitialKeyplane;
- (void)setInlineCompletionEnabled:(BOOL)a3;
- (void)setInputContextHistory:(id)a3;
- (void)setInputIsPunctuationFollowingContinuousPath:(BOOL)a3;
- (void)setInputManagerState:(id)a3;
- (void)setInputManagerWrapper:(id)a3;
- (void)setInputModeIdentifier:(id)a3;
- (void)setInsertsSpaceAfterPredictiveInput:(BOOL)a3;
- (void)setIntermediateText:(id)a3;
- (void)setIsScreenLocked:(BOOL)a3;
- (void)setJustAcceptedAutocorrection:(BOOL)a3;
- (void)setKeyboard:(id)a3;
- (void)setKeyboardConfiguration:(id)a3;
- (void)setKeyboardInputManagerFactory:(id)a3;
- (void)setKeyboardState:(id)a3;
- (void)setKeyplane:(id)a3;
- (void)setKeys:(id)a3;
- (void)setLastCPRequestToken:(id)a3;
- (void)setLastInputWasContinuousPath:(BOOL)a3;
- (void)setLastInputWasSelection:(BOOL)a3;
- (void)setLeftKeys:(id)a3;
- (void)setLongPredictionListEnabled:(BOOL)a3;
- (void)setMarkedText:(id)a3;
- (void)setNextKeyIsFlick:(BOOL)a3;
- (void)setNextKeyIsMultitap:(BOOL)a3;
- (void)setRecipientIdentifier:(id)a3;
- (void)setRightKeys:(id)a3;
- (void)setSecureTextEntry:(BOOL)a3;
- (void)setSelectedRange:(_NSRange)a3;
- (void)setShouldSkipCandidateSelection:(BOOL)a3;
- (void)setSupplementalLexiconIdentifier:(unint64_t)a3;
- (void)setTtkLayout:(id)a3;
- (void)setUsesAutocapitalization:(BOOL)a3;
- (void)setUsesAutocorrection:(BOOL)a3;
- (void)setUsesPrediction:(BOOL)a3;
- (void)setUsesTransliteration:(BOOL)a3;
- (void)setWordLearningEnabled:(BOOL)a3;
- (void)shiftKeyplane;
- (void)syncToDocumentState:(id)a3;
- (void)syncToEmptyDocument;
- (void)syncToKeyboardState;
- (void)tearDown;
- (void)textAccepted:(id)a3 predictiveCandidate:(BOOL)a4;
- (void)updateAutoshift;
- (void)updateDocumentState;
- (void)updateKeyboardOutput:(id)a3 withInputForSmartPunctuation:(id)a4;
@end

@implementation ACTKeyboardController

- (ACTKeyboardController)init
{
  return -[ACTKeyboardController initWithInputMode:](self, "initWithInputMode:", 0LL);
}

- (ACTKeyboardController)initWithInputMode:(id)a3
{
  id v5 = a3;
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___ACTKeyboardController;
  v6 = -[ACTKeyboardController init](&v31, "init");
  if (v6)
  {
    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v8 = (void *)*((void *)v6 + 31);
    *((void *)v6 + 31) = v7;

    objc_storeStrong((id *)v6 + 12, a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v5 normalizedIdentifier]);
    id v10 = [v9 copy];
    v11 = (void *)*((void *)v6 + 11);
    *((void *)v6 + 11) = v10;

    v6[49] = 1;
    v6[60] = 1;
    v12 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
    v13 = (void *)*((void *)v6 + 4);
    *((void *)v6 + 4) = v12;

    v14 = objc_alloc(&OBJC_CLASS___ACTKeyboardLayoutUtils);
    v15 = (void *)objc_claimAutoreleasedReturnValue([v5 locale]);
    v16 = -[ACTKeyboardLayoutUtils initWithLocale:](v14, "initWithLocale:", v15);
    v17 = (void *)*((void *)v6 + 9);
    *((void *)v6 + 9) = v16;

    *(_OWORD *)(v6 + 168) = xmmword_821E0;
    v6[56] = 1;
    v18 = NSClassFromString(@"TISmartPunctuationController");
    if (v18)
    {
      id v19 = objc_alloc_init(v18);
      v20 = (void *)*((void *)v6 + 23);
      *((void *)v6 + 23) = v19;

      Class v21 = NSClassFromString(@"TISmartPunctuationOptions");
      v22 = (void *)objc_claimAutoreleasedReturnValue([v5 locale]);
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class smartPunctuationOptionsForLocale:](v21, "smartPunctuationOptionsForLocale:", v22));
      [*((id *)v6 + 23) setSmartPunctuationOptions:v23];

      [*((id *)v6 + 23) setSmartQuotesEnabled:0];
      [*((id *)v6 + 23) setSmartDashesEnabled:0];
    }

    v24 = objc_alloc_init(&OBJC_CLASS___NSCondition);
    v25 = (void *)*((void *)v6 + 32);
    *((void *)v6 + 32) = v24;

    v26 = objc_alloc_init(&OBJC_CLASS___NSLock);
    v27 = (void *)*((void *)v6 + 34);
    *((void *)v6 + 34) = v26;

    uint64_t v28 = objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    v29 = (void *)*((void *)v6 + 36);
    *((void *)v6 + 36) = v28;

    +[TIKeyboardInputManager swizzleTestingParameters](&OBJC_CLASS___TIKeyboardInputManager, "swizzleTestingParameters");
  }

  return (ACTKeyboardController *)v6;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController inputManager](self, "inputManager"));
  [v3 suspend];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___ACTKeyboardController;
  -[ACTKeyboardController dealloc](&v4, "dealloc");
}

- (void)setAutocorrectionList:(id)a3
{
  objc_super v4 = (TIAutocorrectionList *)a3;
  obj = self;
  objc_sync_enter(obj);
  autocorrectionList = obj->_autocorrectionList;
  obj->_autocorrectionList = v4;

  objc_sync_exit(obj);
}

- (TIAutocorrectionList)autocorrectionList
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_autocorrectionList;
  objc_sync_exit(v2);

  return v3;
}

- (void)setKeyboard:(id)a3
{
  id v5 = (UIKBTree *)a3;
  if (self->_keyboard != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_keyboard, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIKBTree subtrees](self->_keyboard, "subtrees"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndex:0]);
    -[ACTKeyboardController setKeyplane:](self, "setKeyplane:", v7);

    -[ACTKeyboardController setInitialKeyplane](self, "setInitialKeyplane");
    -[ACTKeyboardController updateAutoshift](self, "updateAutoshift");
    id v5 = v8;
  }
}

- (void)setKeyplane:(id)a3
{
  v22 = (UIKBTree *)a3;
  if (self->_keyplane != v22)
  {
    objc_storeStrong((id *)&self->_keyplane, a3);
    -[UIKBTree zipGeometrySet](self->_keyplane, "zipGeometrySet");
    -[ACTKeyboardController adjustKeyplaneEmulatingKBStar:](self, "adjustKeyplaneEmulatingKBStar:", self->_keyplane);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keyplane](self, "keyplane"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 keys]);
    -[ACTKeyboardController setKeys:](self, "setKeys:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keyplane](self, "keyplane"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 cachedKeysByKeyName:@"Latin-Accents"]);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keyboardState](self, "keyboardState"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 layoutState]);
    [v10 setHasAccentKey:v8 != 0];

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keyplane](self, "keyplane"));
    id v12 = [v11 isAlphabeticPlane];
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keyboardState](self, "keyboardState"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 layoutState]);
    [v14 setIsAlphabeticPlane:v12];

    leftKeys = self->_leftKeys;
    self->_leftKeys = 0LL;

    rightKeys = self->_rightKeys;
    self->_rightKeys = 0LL;

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIKBTree name](self->_keyplane, "name"));
    LODWORD(v12) = [v17 containsString:@"Wildcat"];

    if ((_DWORD)v12)
    {
      v18 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      id v19 = self->_leftKeys;
      self->_leftKeys = v18;

      v20 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      Class v21 = self->_rightKeys;
      self->_rightKeys = v20;

      -[ACTKeyboardController divideKeyplane:intoLeft:right:]( self,  "divideKeyplane:intoLeft:right:",  self->_keyplane,  self->_leftKeys,  self->_rightKeys);
    }
  }

  -[ACTKeyboardController registerLayoutWithFavonius](self, "registerLayoutWithFavonius");
}

- (void)divideKeyplane:(id)a3 intoLeft:(id)a4 right:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (v8 && v9)
  {
    [v8 removeAllObjects];
    [v10 removeAllObjects];
    v11 = (void *)objc_claimAutoreleasedReturnValue([v7 subtrees]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 firstObject]);

    uint64_t v52 = 0LL;
    v53 = (double *)&v52;
    uint64_t v54 = 0x4010000000LL;
    v55 = &unk_7EC7A;
    CGSize size = CGRectNull.size;
    CGPoint origin = CGRectNull.origin;
    CGSize v57 = size;
    uint64_t v46 = 0LL;
    v47 = (double *)&v46;
    uint64_t v48 = 0x4010000000LL;
    v49 = &unk_7EC7A;
    CGPoint v50 = origin;
    CGSize v51 = size;
    v14 = (void *)objc_claimAutoreleasedReturnValue([v12 keys]);
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472LL;
    v45[2] = sub_1BD2C;
    v45[3] = &unk_88F70;
    v45[4] = &v52;
    v45[5] = &v46;
    [v14 enumerateObjectsUsingBlock:v45];

    double v15 = v53[5];
    double v16 = v53[7];
    double v17 = v53[6] * 0.5;
    double v18 = UIRectInset(v53[4], v15, v17, v16, 0.0, 0.0, 0.0, v47[6] * -0.5);
    uint64_t v20 = v19;
    uint64_t v22 = v21;
    uint64_t v24 = v23;
    double v25 = UIRectInset(v17, v15, v17, v16, 0.0, v47[6] * -0.5, 0.0, 0.0);
    uint64_t v27 = v26;
    uint64_t v29 = v28;
    uint64_t v31 = v30;
    v32 = (void *)objc_claimAutoreleasedReturnValue([v7 keys]);
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472LL;
    v33[2] = sub_1BDD8;
    v33[3] = &unk_88F98;
    double v37 = v18;
    uint64_t v38 = v20;
    uint64_t v39 = v22;
    uint64_t v40 = v24;
    v36 = &v52;
    id v34 = v8;
    double v41 = v25;
    uint64_t v42 = v27;
    uint64_t v43 = v29;
    uint64_t v44 = v31;
    id v35 = v10;
    [v32 enumerateObjectsUsingBlock:v33];

    _Block_object_dispose(&v46, 8);
    _Block_object_dispose(&v52, 8);
  }
}

- (void)mergeFrameFromKey:(id)a3 intoKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v5 && v6 && [v5 count] == (char *)&dword_0 + 1)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 lastObject]);
    uint64_t v49 = 0LL;
    CGPoint v50 = &v49;
    uint64_t v51 = 0x3032000000LL;
    uint64_t v52 = sub_1C1E0;
    v53 = sub_1C1F0;
    id v54 = (id)objc_claimAutoreleasedReturnValue([v7 firstObject]);
    uint64_t v45 = 0LL;
    uint64_t v46 = (double *)&v45;
    uint64_t v47 = 0x2020000000LL;
    uint64_t v48 = 0x7FEFFFFFFFFFFFFFLL;
    if ([v7 count])
    {
      [v8 frame];
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472LL;
      v37[2] = sub_1C1F8;
      v37[3] = &unk_88FC0;
      uint64_t v41 = v9;
      uint64_t v42 = v10;
      uint64_t v43 = v11;
      uint64_t v44 = v12;
      id v38 = v8;
      uint64_t v39 = &v45;
      uint64_t v40 = &v49;
      [v7 enumerateObjectsUsingBlock:v37];
    }

    if (v46[3] < 2.0)
    {
      [v8 frame];
      CGFloat v14 = v13;
      CGFloat v16 = v15;
      CGFloat v18 = v17;
      CGFloat v20 = v19;
      [(id)v50[5] frame];
      v59.origin.x = v21;
      v59.origin.y = v22;
      v59.size.width = v23;
      v59.size.height = v24;
      v55.origin.x = v14;
      v55.origin.y = v16;
      v55.size.width = v18;
      v55.size.height = v20;
      CGRect v56 = CGRectUnion(v55, v59);
      objc_msgSend((id)v50[5], "setFrame:", v56.origin.x, v56.origin.y, v56.size.width, v56.size.height);
      [v8 paddedFrame];
      CGFloat v26 = v25;
      CGFloat v28 = v27;
      CGFloat v30 = v29;
      CGFloat v32 = v31;
      [(id)v50[5] paddedFrame];
      v60.origin.x = v33;
      v60.origin.y = v34;
      v60.size.width = v35;
      v60.size.height = v36;
      v57.origin.x = v26;
      v57.origin.y = v28;
      v57.size.width = v30;
      v57.size.height = v32;
      CGRect v58 = CGRectUnion(v57, v60);
      objc_msgSend((id)v50[5], "setPaddedFrame:", v58.origin.x, v58.origin.y, v58.size.width, v58.size.height);
    }

    [v8 setVisible:0];
    _Block_object_dispose(&v45, 8);
    _Block_object_dispose(&v49, 8);
  }
}

- (void)adjustKeyplaneEmulatingKBStar:(id)a3
{
  id v45 = a3;
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v45 keys]);
  id v5 = -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  [v4 count]);
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  id obj = v4;
  id v6 = [obj countByEnumeratingWithState:&v54 objects:v60 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v55;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v55 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v54 + 1) + 8LL * (void)i);
        uint64_t v11 = self;
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController layoutUtils](self, "layoutUtils"));
        double v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "representedStringForKey:shifted:", v10, objc_msgSend(v45, "isShiftKeyplane")));
        CGFloat v14 = (void *)objc_claimAutoreleasedReturnValue([v13 lowercaseString]);

        if (v14)
        {
          double v15 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v5, "objectForKey:", v14));
          if (!v15)
          {
            double v15 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
            -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v15, v14);
          }

          -[NSMutableArray addObject:](v15, "addObject:", v10);
        }

        [v10 setVisible:1];

        self = v11;
      }

      id v7 = [obj countByEnumeratingWithState:&v54 objects:v60 count:16];
    }

    while (v7);
  }

  if (self->_ttkLayout)
  {
    CGFloat v16 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    uint64_t v42 = self;
    id v43 = (id)objc_claimAutoreleasedReturnValue(-[TTKSimpleKeyboardPlane keys](self->_ttkLayout, "keys"));
    id v17 = [v43 countByEnumeratingWithState:&v50 objects:v59 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v51;
      do
      {
        for (j = 0LL; j != v18; j = (char *)j + 1)
        {
          if (*(void *)v51 != v19) {
            objc_enumerationMutation(v43);
          }
          CGFloat v21 = *(void **)(*((void *)&v50 + 1) + 8LL * (void)j);
          CGFloat v22 = (void *)objc_claimAutoreleasedReturnValue([v21 string]);
          CGFloat v23 = @" ";

          CGFloat v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](v5, "valueForKey:", v23));
          if (v24)
          {
            double v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", v23));
            CGFloat v26 = (void *)objc_claimAutoreleasedReturnValue([v25 firstObject]);

            double v27 = (void *)objc_claimAutoreleasedReturnValue([v26 name]);
            -[NSMutableDictionary setObject:forKey:](v16, "setObject:forKey:", v21, v27);
          }
        }

        id v18 = [v43 countByEnumeratingWithState:&v50 objects:v59 count:16];
      }

      while (v18);
    }

    __int128 v48 = 0u;
    __int128 v49 = 0u;
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    CGFloat v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](v5, "allValues"));
    id v29 = [v28 countByEnumeratingWithState:&v46 objects:v58 count:16];
    if (v29)
    {
      id v30 = v29;
      uint64_t v31 = *(void *)v47;
      do
      {
        for (k = 0LL; k != v30; k = (char *)k + 1)
        {
          if (*(void *)v47 != v31) {
            objc_enumerationMutation(v28);
          }
          CGFloat v33 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v46 + 1) + 8 * (void)k) firstObject]);
          CGFloat v34 = (void *)objc_claimAutoreleasedReturnValue([v33 name]);
          CGFloat v35 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v16, "objectForKey:", v34));

          if (v35)
          {
            CGFloat v36 = (void *)objc_claimAutoreleasedReturnValue([v33 name]);
            double v37 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v16, "objectForKey:", v36));

            [v37 frame];
            objc_msgSend(v33, "setFrame:");
            [v37 frame];
            objc_msgSend(v33, "setPaddedFrame:");
          }
        }

        id v30 = [v28 countByEnumeratingWithState:&v46 objects:v58 count:16];
      }

      while (v30);
    }

    self = v42;
  }

  id v38 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v5, "objectForKey:", @"dictation"));
  uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v5, "objectForKey:", @" "));
  -[ACTKeyboardController mergeFrameFromKey:intoKey:](self, "mergeFrameFromKey:intoKey:", v38, v39);

  uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v5, "objectForKey:", @"international"));
  uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v5, "objectForKey:", @"more"));
  -[ACTKeyboardController mergeFrameFromKey:intoKey:](self, "mergeFrameFromKey:intoKey:", v40, v41);
}

- (BOOL)isShifted
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keyplane](self, "keyplane"));
  unsigned __int8 v3 = [v2 isShiftKeyplane];

  return v3;
}

- (BOOL)isAutoshifted
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keyboardState](self, "keyboardState"));
  BOOL v3 = [v2 shiftState] == 2;

  return v3;
}

- (void)shiftKeyplane
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keyboard](self, "keyboard"));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keyplane](self, "keyplane"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 shiftAlternateKeyplaneName]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 subtreeWithName:v5]);
  -[ACTKeyboardController setKeyplane:](self, "setKeyplane:", v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keyplane](self, "keyplane"));
  id v8 = [v7 isShiftKeyplane];

  id v9 = (id)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keyboardState](self, "keyboardState"));
  [v9 setShiftState:v8];
}

- (void)alternateKeyplane
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keyboard](self, "keyboard"));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keyplane](self, "keyplane"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 alternateKeyplaneName]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 subtreeWithName:v5]);
  -[ACTKeyboardController setKeyplane:](self, "setKeyplane:", v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keyplane](self, "keyplane"));
  id v8 = [v7 isShiftKeyplane];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keyboardState](self, "keyboardState"));
  [v9 setShiftState:v8];

  -[ACTKeyboardController updateAutoshift](self, "updateAutoshift");
}

- (void)updateAutoshift
{
  if (-[ACTKeyboardController isShifted](self, "isShifted"))
  {
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keyplane](self, "keyplane"));
    unsigned __int8 v4 = [v3 BOOLForProperty:@"shift-is-plane-chooser"];

    if ((v4 & 1) == 0) {
      -[ACTKeyboardController shiftKeyplane](self, "shiftKeyplane");
    }
  }

  if (!-[ACTKeyboardController isShifted](self, "isShifted"))
  {
    id v13 = (id)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keyplane](self, "keyplane"));
    unsigned int v5 = -[ACTKeyboardController usesAutocapitalization](self, "usesAutocapitalization");

    if (v5)
    {
      id v13 = (id)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController text](self, "text"));
      unint64_t v6 = -[ACTKeyboardController autocapitalizationType](self, "autocapitalizationType");
      if (v6 == 1)
      {
        if ([v13 length])
        {
          id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController inputManagerState](self, "inputManagerState"));
          uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString _stringWithUnichar:]( NSString,  "_stringWithUnichar:",  [v13 _lastLongCharacter]));
          unsigned int v11 = [v9 stringEndsWord:v10];

          if (!v11) {
            goto LABEL_16;
          }
        }
      }

      else if (v6 != 3)
      {
        if (v6 != 2) {
          goto LABEL_16;
        }
        id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController inputManagerState](self, "inputManagerState"));
        unsigned __int8 v8 = [v7 nextInputWouldStartSentence];

        if ((v8 & 1) == 0) {
          goto LABEL_16;
        }
      }

      -[ACTKeyboardController shiftKeyplane](self, "shiftKeyplane");
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keyboardState](self, "keyboardState"));
      [v12 setShiftState:2];

LABEL_16:
    }
  }

- (void)setInitialKeyplane
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keyboard](self, "keyboard"));
  id v9 = (id)objc_claimAutoreleasedReturnValue([v3 subtrees]);

  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndex:0]);
  if ([v4 isShiftKeyplane])
  {
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keyboard](self, "keyboard"));
    unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 shiftAlternateKeyplaneName]);
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v5 subtreeWithName:v6]);

    unsigned __int8 v4 = (void *)v7;
  }

  -[ACTKeyboardController setKeyplane:](self, "setKeyplane:", v4);
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keyboardState](self, "keyboardState"));
  [v8 setShiftState:0];
}

- (void)setKeyboardConfiguration:(id)a3
{
  id v9 = a3;
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([v9 inputManagerState]);
  -[ACTKeyboardController setInputManagerState:](self, "setInputManagerState:", v4);

  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v9 intermediateText]);
  if (v5)
  {
    unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v9 intermediateText]);
    -[ACTKeyboardController setIntermediateText:](self, "setIntermediateText:", v6);
  }

  layoutUtils = self->_layoutUtils;
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v9 accentKeyString]);
  -[ACTKeyboardLayoutUtils setLayoutKeyOverride:forKey:uiKeyboardStringNothing:]( layoutUtils,  "setLayoutKeyOverride:forKey:uiKeyboardStringNothing:",  v8,  UIKeyboardKeyAccent,  UIKeyboardStringNothing);

  -[ACTKeyboardController registerLayoutWithFavonius](self, "registerLayoutWithFavonius");
  -[ACTKeyboardController updateDocumentState](self, "updateDocumentState");
}

- (void)setIntermediateText:(id)a3
{
  id v5 = a3;
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 displayString]);
  -[ACTKeyboardController setMarkedText:](self, "setMarkedText:", v6);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 inputString]);
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keyboardState](self, "keyboardState"));
  [v8 setInputForMarkedText:v7];

  id v10 = (id)objc_claimAutoreleasedReturnValue([v5 searchString]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keyboardState](self, "keyboardState"));
  [v9 setSearchStringForMarkedText:v10];
}

- (void)registerLayoutWithFavonius
{
  id v3 = objc_alloc(&OBJC_CLASS___TIKeyboardLayout);
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keys](self, "keys"));
  id v25 = objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  if (self->_leftKeys && self->_rightKeys) {
    [v25 setUsesTwoHands:1];
  }
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keys](self, "keys"));
  id v5 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v27;
    double y = CGRectNull.origin.y;
    double width = CGRectNull.size.width;
    double height = CGRectNull.size.height;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v27 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
        if ([v12 visible])
        {
          id v13 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController layoutUtils](self, "layoutUtils"));
          uint64_t v14 = objc_claimAutoreleasedReturnValue( objc_msgSend( v13,  "representedStringForKey:shifted:",  v12,  -[ACTKeyboardController isShifted](self, "isShifted")));

          if (v14) {
            double v15 = (__CFString *)v14;
          }
          else {
            double v15 = &stru_89E80;
          }
          CGFloat v16 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController inputModeIdentifier](self, "inputModeIdentifier"));
          uint64_t LanguageWithRegion = TIInputModeGetLanguageWithRegion();
          id v18 = (void *)objc_claimAutoreleasedReturnValue(LanguageWithRegion);
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSLocale localeWithLocaleIdentifier:]( &OBJC_CLASS___NSLocale,  "localeWithLocaleIdentifier:",  v18));

          uint64_t v20 = objc_claimAutoreleasedReturnValue(-[__CFString lowercaseStringWithLocale:](v15, "lowercaseStringWithLocale:", v19));
          CGFloat v21 = (void *)v20;
          if (v20) {
            uint64_t v22 = v20;
          }
          else {
            uint64_t v22 = (uint64_t)v15;
          }
          [v12 paddedFrame];
          objc_msgSend(v25, "addKeyWithExactString:frame:", v22);
        }

        else
        {
          objc_msgSend(v25, "addKeyWithExactString:frame:", &stru_89E80, CGRectNull.origin.x, y, width, height);
        }
      }

      id v6 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }

    while (v6);
  }

  CGFloat v23 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keyboardState](self, "keyboardState"));
  [v23 setKeyLayout:v25];
}

- (id)clonedKeyboardState
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keyboardState](self, "keyboardState"));
  id v3 = [v2 copy];

  return v3;
}

- (void)reset
{
  if (self->_inputManagerWrapper)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController inputManager](self, "inputManager"));
    [v3 clearSoftLearning];

    unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController inputManager](self, "inputManager"));
    [v4 suspend];

    inputManagerWrapper = self->_inputManagerWrapper;
    self->_inputManagerWrapper = 0LL;
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController inputManager](self, "inputManager"));
  [v6 resume];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  -[ACTKeyboardController setDocumentIdentifier:](self, "setDocumentIdentifier:", v7);

  -[ACTKeyboardController syncToEmptyDocument](self, "syncToEmptyDocument");
}

- (void)tearDown
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController inputManager](self, "inputManager"));
  [v2 tearDown];
}

- (TIKeyboardInputManager)inputManager
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController inputManagerWrapper](self, "inputManagerWrapper"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 inputManager]);

  uint64_t v4 = objc_opt_class(&OBJC_CLASS___TIKeyboardInputManager);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0) {
    id v5 = v3;
  }
  else {
    id v5 = 0LL;
  }

  return (TIKeyboardInputManager *)v5;
}

- (TIKeyboardInputManager)existingInputManager
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardInputManagerWrapper inputManager](self->_inputManagerWrapper, "inputManager"));
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___TIKeyboardInputManager);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0) {
    id v4 = v2;
  }
  else {
    id v4 = 0LL;
  }

  return (TIKeyboardInputManager *)v4;
}

- (id)createKeyboardInputManagerWrapper
{
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___TIKeyboardInputManagerWrapper);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keyboardInputManagerFactory](self, "keyboardInputManagerFactory"));

  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keyboardInputManagerFactory](self, "keyboardInputManagerFactory"));
    id v6 = (TIKeyboardInputManager *)[v5 newKeyboardInputManager];
  }

  else
  {
    uint64_t v7 = objc_alloc(&OBJC_CLASS___TIKeyboardInputManager);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController inputMode](self, "inputMode"));
    id v6 = -[TIKeyboardInputManager initWithInputMode:keyboardState:](v7, "initWithInputMode:keyboardState:", v5, 0LL);
  }

  unsigned __int8 v8 = v6;

  -[TIKeyboardInputManagerWrapper setInputManager:](v3, "setInputManager:", v8);
  -[TIKeyboardInputManagerWrapper changingContextWithTrigger:]( v3,  "changingContextWithTrigger:",  TIContextChangeTriggerGainFocus);

  return v3;
}

- (TIKeyboardInputManagerWrapper)inputManagerWrapper
{
  inputManagerWrapper = self->_inputManagerWrapper;
  if (!inputManagerWrapper)
  {
    id v4 = -[ACTKeyboardController createKeyboardInputManagerWrapper](self, "createKeyboardInputManagerWrapper");
    if ((objc_opt_respondsToSelector(v4, "setClientProxy:") & 1) != 0)
    {
      id v5 = -[ACTClientProxy initWithClient:](objc_alloc(&OBJC_CLASS___ACTClientProxy), "initWithClient:", self);
      [v4 setClientProxy:v5];
    }

    -[ACTKeyboardController setInputManagerWrapper:](self, "setInputManagerWrapper:", v4);

    inputManagerWrapper = self->_inputManagerWrapper;
  }

  return inputManagerWrapper;
}

- (BOOL)hardwareKeyboardMode
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keyboardState](self, "keyboardState"));

  if (!v3) {
    return self->_hardwareKeyboardMode;
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keyboardState](self, "keyboardState"));
  unsigned __int8 v5 = [v4 hardwareKeyboardMode];

  return v5;
}

- (void)setHardwareKeyboardMode:(BOOL)a3
{
  BOOL v3 = a3;
  self->_hardwareKeyboardMode = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keyboardState](self, "keyboardState"));
  [v4 setHardwareKeyboardMode:v3];
}

- (BOOL)shouldSkipCandidateSelection
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keyboardState](self, "keyboardState"));
  unsigned __int8 v3 = [v2 shouldSkipCandidateSelection];

  return v3;
}

- (void)setShouldSkipCandidateSelection:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keyboardState](self, "keyboardState"));
  [v4 setShouldSkipCandidateSelection:v3];
}

- (void)commitText
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController inputManagerState](self, "inputManagerState"));
  unsigned int v4 = [v3 usesCandidateSelection];

  if (v4)
  {
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController candidateResultSet](self, "candidateResultSet"));
    id v33 = (id)objc_claimAutoreleasedReturnValue([v5 firstCandidate]);

    id v6 = v33;
    if (!v33)
    {
LABEL_17:

      return;
    }

    -[ACTKeyboardController acceptCandidate:](self, "acceptCandidate:", v33);
LABEL_16:
    id v6 = v33;
    goto LABEL_17;
  }

  if (-[ACTKeyboardController usesAutocorrection](self, "usesAutocorrection"))
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController autocorrectionList](self, "autocorrectionList"));
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v7 candidates]);
    id v33 = (id)objc_claimAutoreleasedReturnValue([v8 firstObject]);

    uint64_t v9 = objc_claimAutoreleasedReturnValue([v33 rawInput]);
    if (v9)
    {
      id v10 = (void *)v9;
      unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v33 rawInput]);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v33 input]);
      if (![v11 isEqualToString:v12])
      {
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v33 input]);
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v33 candidate]);
        if ([v13 isEqualToString:v14])
        {
        }

        else
        {
          double v15 = (void *)objc_claimAutoreleasedReturnValue([v33 rawInput]);
          CGFloat v16 = (void *)objc_claimAutoreleasedReturnValue([v33 candidate]);
          unsigned __int8 v17 = [v15 isEqualToString:v16];

          if ((v17 & 1) == 0) {
            goto LABEL_8;
          }
        }

        id v18 = (void *)objc_claimAutoreleasedReturnValue([v33 input]);
        id v19 = -[ACTKeyboardController selectedRangeForText:](self, "selectedRangeForText:", v18);
        uint64_t v21 = v20;

        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableString substringWithRange:](self->_text, "substringWithRange:", v19, v21));
        CGFloat v23 = (void *)objc_claimAutoreleasedReturnValue([v33 input]);
        LOBYTE(v21) = [v22 isEqualToString:v23];

        if ((v21 & 1) == 0)
        {
          CGFloat v24 = (void *)objc_claimAutoreleasedReturnValue([v33 rawInput]);
          id v25 = -[ACTKeyboardController selectedRangeForText:](self, "selectedRangeForText:", v24);
          uint64_t v27 = v26;

          uint64_t v28 = objc_claimAutoreleasedReturnValue(-[NSMutableString substringWithRange:](self->_text, "substringWithRange:", v25, v27));
          uint64_t v22 = (void *)v28;
        }

        id v29 = objc_alloc(&OBJC_CLASS___TIKeyboardCandidateSingle);
        id v30 = (void *)objc_claimAutoreleasedReturnValue([v33 input]);
        uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v33 rawInput]);
        id v32 = [v29 initWithCandidate:v22 forInput:v30 rawInput:v31];

        -[ACTKeyboardController textAccepted:predictiveCandidate:](self, "textAccepted:predictiveCandidate:", v32, 0LL);
        -[ACTKeyboardController setAutocorrectionList:](self, "setAutocorrectionList:", 0LL);

        goto LABEL_16;
      }
    }

- (void)syncToDocumentState:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = objc_alloc_init(&OBJC_CLASS___TIKeyboardState);
  keyboardState = self->_keyboardState;
  self->_keyboardState = v5;

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController documentIdentifier](self, "documentIdentifier"));
  -[TIKeyboardState setDocumentIdentifier:](self->_keyboardState, "setDocumentIdentifier:", v7);

  id v8 = objc_alloc_init(&OBJC_CLASS___TITextInputTraits);
  -[TIKeyboardState setTextInputTraits:](self->_keyboardState, "setTextInputTraits:", v8);

  text = self->_text;
  uint64_t v10 = objc_claimAutoreleasedReturnValue([v4 contextBeforeInput]);
  unsigned int v11 = (void *)v10;
  if (v10) {
    uint64_t v12 = (const __CFString *)v10;
  }
  else {
    uint64_t v12 = &stru_89E80;
  }
  -[NSMutableString setString:](text, "setString:", v12);

  id v13 = -[NSMutableString length](self->_text, "length");
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v4 selectedText]);
  id v15 = [v14 length];
  self->_selectedRange.location = (NSUInteger)v13;
  self->_selectedRange.length = (NSUInteger)v15;

  CGFloat v16 = self->_text;
  uint64_t v17 = objc_claimAutoreleasedReturnValue([v4 selectedText]);
  id v18 = (void *)v17;
  if (v17) {
    id v19 = (const __CFString *)v17;
  }
  else {
    id v19 = &stru_89E80;
  }
  -[NSMutableString appendString:](v16, "appendString:", v19);

  uint64_t v20 = self->_text;
  uint64_t v21 = objc_claimAutoreleasedReturnValue([v4 contextAfterInput]);
  uint64_t v22 = (void *)v21;
  if (v21) {
    CGFloat v23 = (const __CFString *)v21;
  }
  else {
    CGFloat v23 = &stru_89E80;
  }
  -[NSMutableString appendString:](v20, "appendString:", v23);

  CGFloat v24 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController autocorrectionList](self, "autocorrectionList"));
  id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 corrections]);
  uint64_t v26 = objc_claimAutoreleasedReturnValue([v25 autocorrection]);
  if (v26)
  {
    uint64_t v27 = (void *)v26;
    int v28 = TISwearWordPolicyV1Enabled();

    if (!v28) {
      goto LABEL_14;
    }
    CGFloat v24 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController inputManagerWrapper](self, "inputManagerWrapper"));
    id v25 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController autocorrectionList](self, "autocorrectionList"));
    id v29 = (void *)objc_claimAutoreleasedReturnValue([v25 corrections]);
    id v30 = (void *)objc_claimAutoreleasedReturnValue([v29 autocorrection]);
    v109[0] = _NSConcreteStackBlock;
    v109[1] = 3221225472LL;
    v109[2] = sub_1E0D0;
    v109[3] = &unk_88FE8;
    v109[4] = self;
    [v24 textAccepted:v30 completionHandler:v109];
  }

LABEL_14:
  -[ACTKeyboardController setAutocorrectionList:](self, "setAutocorrectionList:", 0LL);
  -[ACTKeyboardController setCandidateResultSet:](self, "setCandidateResultSet:", 0LL);
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v4 markedText]);
  -[ACTKeyboardController setMarkedText:](self, "setMarkedText:", v31);

  if ([v4 documentIsEmpty])
  {
    -[ACTKeyboardController setIntermediateText:](self, "setIntermediateText:", 0LL);
  }

  else
  {
    id v32 = (void *)objc_claimAutoreleasedReturnValue([v4 markedText]);
    id v33 = (void *)objc_claimAutoreleasedReturnValue([v4 markedText]);
    CGFloat v34 = (void *)objc_claimAutoreleasedReturnValue( +[TIKeyboardIntermediateText intermediateTextWithInputString:displayString:selectionLocation:lastInputString:]( TIKeyboardIntermediateText,  "intermediateTextWithInputString:displayString:selectionLocation:lastInputString:",  v32,  v33,  [v4 selectedRangeInMarkedText],  0));
    -[ACTKeyboardController setIntermediateText:](self, "setIntermediateText:", v34);
  }

  -[ACTKeyboardController updateDocumentState](self, "updateDocumentState");
  CGFloat v35 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController inputModeIdentifier](self, "inputModeIdentifier"));
  CGFloat v36 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keyboardState](self, "keyboardState"));
  [v36 setInputMode:v35];

  double v37 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keyboardState](self, "keyboardState"));
  [v37 setAutocorrectionEnabled:1];

  unint64_t v38 = -[ACTKeyboardController autocorrectionType](self, "autocorrectionType");
  uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keyboardState](self, "keyboardState"));
  uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue([v39 textInputTraits]);
  [v40 setAutocorrectionType:v38];

  BOOL v41 = -[ACTKeyboardController usesPrediction](self, "usesPrediction");
  uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keyboardState](self, "keyboardState"));
  [v42 setAutocorrectionListUIDisplayed:v41];

  BOOL v43 = -[ACTKeyboardController usesAutocapitalization](self, "usesAutocapitalization");
  uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keyboardState](self, "keyboardState"));
  [v44 setAutocapitalizationEnabled:v43];

  unint64_t v45 = -[ACTKeyboardController autocapitalizationType](self, "autocapitalizationType");
  __int128 v46 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keyboardState](self, "keyboardState"));
  [v46 setAutocapitalizationType:v45];

  BOOL hardwareKeyboardMode = self->_hardwareKeyboardMode;
  __int128 v48 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keyboardState](self, "keyboardState"));
  [v48 setHardwareKeyboardMode:hardwareKeyboardMode];

  __int128 v49 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keyboardState](self, "keyboardState"));
  [v49 setShortcutConversionEnabled:1];

  BOOL v50 = -[ACTKeyboardController wordLearningEnabled](self, "wordLearningEnabled");
  __int128 v51 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keyboardState](self, "keyboardState"));
  [v51 setWordLearningEnabled:v50];

  BOOL v52 = -[ACTKeyboardController inlineCompletionEnabled](self, "inlineCompletionEnabled");
  __int128 v53 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keyboardState](self, "keyboardState"));
  [v53 setInlineCompletionEnabled:v52];

  __int128 v54 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController clientIdentifier](self, "clientIdentifier"));
  __int128 v55 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keyboardState](self, "keyboardState"));
  [v55 setClientIdentifier:v54];

  __int128 v56 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController recipientIdentifier](self, "recipientIdentifier"));
  __int128 v57 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keyboardState](self, "keyboardState"));
  [v57 setRecipientIdentifier:v56];

  CGRect v58 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController inputContextHistory](self, "inputContextHistory"));
  CGRect v59 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keyboardState](self, "keyboardState"));
  [v59 setInputContextHistory:v58];

  unint64_t v60 = -[ACTKeyboardController supplementalLexiconIdentifier](self, "supplementalLexiconIdentifier");
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keyboardState](self, "keyboardState"));
  [v61 setSupplementalLexiconIdentifier:v60];

  BOOL v62 = -[ACTKeyboardController canSuggestSupplementalItemsForCurrentSelection]( self,  "canSuggestSupplementalItemsForCurrentSelection");
  uint64_t v63 = objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keyboardState](self, "keyboardState"));
  [(id)v63 setCanSuggestSupplementalItemsForCurrentSelection:v62];

  v64 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keyboardState](self, "keyboardState"));
  LOBYTE(v63) = objc_opt_respondsToSelector(v64, "setLongPredictionListEnabled:");

  if ((v63 & 1) != 0)
  {
    BOOL v65 = -[ACTKeyboardController longPredictionListEnabled](self, "longPredictionListEnabled");
    v66 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keyboardState](self, "keyboardState"));
    [v66 setLongPredictionListEnabled:v65];
  }

  id v67 = objc_alloc_init(&OBJC_CLASS___TIKeyboardLayoutState);
  v68 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keyboardState](self, "keyboardState"));
  [v68 setLayoutState:v67];

  v69 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController inputModeIdentifier](self, "inputModeIdentifier"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keyboardState](self, "keyboardState"));
  v71 = (void *)objc_claimAutoreleasedReturnValue([v70 layoutState]);
  [v71 setInputMode:v69];

  v72 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keyplane](self, "keyplane"));
  v73 = (void *)objc_claimAutoreleasedReturnValue([v72 cachedKeysByKeyName:@"Candidate-Selection"]);
  BOOL v74 = [v73 count] != 0;
  v75 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keyboardState](self, "keyboardState"));
  v76 = (void *)objc_claimAutoreleasedReturnValue([v75 layoutState]);
  [v76 setHasCandidateKey:v74];

  v77 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keyplane](self, "keyplane"));
  v78 = (void *)objc_claimAutoreleasedReturnValue([v77 cachedKeysByKeyName:@"Latin-Accents"]);
  BOOL v79 = [v78 count] != 0;
  v80 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keyboardState](self, "keyboardState"));
  v81 = (void *)objc_claimAutoreleasedReturnValue([v80 layoutState]);
  [v81 setHasAccentKey:v79];

  v82 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keyplane](self, "keyplane"));
  v83 = (void *)objc_claimAutoreleasedReturnValue([v82 cachedKeysByKeyName:@"Multitap-Complete-Key"]);
  BOOL v84 = [v83 count] != 0;
  v85 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keyboardState](self, "keyboardState"));
  v86 = (void *)objc_claimAutoreleasedReturnValue([v85 layoutState]);
  [v86 setCanMultitap:v84];

  v87 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keyplane](self, "keyplane"));
  id v88 = [v87 isAlphabeticPlane];
  v89 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keyboardState](self, "keyboardState"));
  v90 = (void *)objc_claimAutoreleasedReturnValue([v89 layoutState]);
  [v90 setIsAlphabeticPlane:v88];

  v91 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keyplane](self, "keyplane"));
  id v92 = [v91 isKanaPlane];
  v93 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keyboardState](self, "keyboardState"));
  v94 = (void *)objc_claimAutoreleasedReturnValue([v93 layoutState]);
  [v94 setIsKanaPlane:v92];

  v95 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keyplane](self, "keyplane"));
  v96 = (void *)objc_claimAutoreleasedReturnValue([v95 name]);
  LODWORD(v93) = [v96 containsString:@"Wildcat"];

  v97 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keyboardState](self, "keyboardState"));
  v98 = (void *)objc_claimAutoreleasedReturnValue([v97 layoutState]);
  [v98 setUserInterfaceIdiom:v93];

  BOOL v99 = -[ACTKeyboardController secureTextEntry](self, "secureTextEntry");
  v100 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keyboardState](self, "keyboardState"));
  [v100 setSecureTextEntry:v99];

  BOOL v101 = -[ACTKeyboardController isScreenLocked](self, "isScreenLocked");
  v102 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keyboardState](self, "keyboardState"));
  [v102 setIsScreenLocked:v101];

  -[ACTKeyboardController setInitialKeyplane](self, "setInitialKeyplane");
  v103 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController layoutUtils](self, "layoutUtils"));
  v104 = (void *)objc_claimAutoreleasedReturnValue([v103 keyOverrides]);
  [v104 removeAllObjects];

  v105 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController activeTouchState](self, "activeTouchState"));
  [v105 removeAllObjects];

  v106 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController inputManagerWrapper](self, "inputManagerWrapper"));
  v107 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController clonedKeyboardState](self, "clonedKeyboardState"));
  v108[0] = _NSConcreteStackBlock;
  v108[1] = 3221225472LL;
  v108[2] = sub_1E0DC;
  v108[3] = &unk_88FE8;
  v108[4] = self;
  [v106 syncToKeyboardState:v107 completionHandler:v108];

  -[ACTKeyboardController setLastInputWasSelection:](self, "setLastInputWasSelection:", 0LL);
  -[ACTKeyboardController setLastInputWasContinuousPath:](self, "setLastInputWasContinuousPath:", 0LL);
  -[ACTKeyboardController setInputIsPunctuationFollowingContinuousPath:]( self,  "setInputIsPunctuationFollowingContinuousPath:",  0LL);
  -[ACTKeyboardController updateAutoshift](self, "updateAutoshift");
  -[ACTKeyboardController generateAutocorrectionsOrCandidates](self, "generateAutocorrectionsOrCandidates");
}

- (void)syncToEmptyDocument
{
  id v3 = objc_msgSend( [TIDocumentState alloc],  "initWithContextBefore:markedText:selectedText:contextAfter:selectedRangeInMarkedText:",  &stru_89E80,  0,  0,  0,  0x7FFFFFFFFFFFFFFFLL,  0);
  -[ACTKeyboardController syncToDocumentState:](self, "syncToDocumentState:", v3);
}

- (void)syncToKeyboardState
{
}

- (BOOL)syncToKeyboardStateByWaitingForResults:(BOOL)a3
{
  uint64_t v12 = 0LL;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000LL;
  BOOL v15 = !a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController inputManagerWrapper](self, "inputManagerWrapper"));
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController clonedKeyboardState](self, "clonedKeyboardState"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1E2C0;
  v11[3] = &unk_89010;
  v11[4] = self;
  v11[5] = &v12;
  [v4 syncToKeyboardState:v5 completionHandler:v11];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", 0.5));
  if (*((_BYTE *)v13 + 24))
  {
LABEL_4:
    char v9 = 1;
  }

  else
  {
    while (1)
    {
      [v6 timeIntervalSinceNow];
      if (v7 <= 0.0) {
        break;
      }
      id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
      [v8 acceptInputForMode:NSDefaultRunLoopMode beforeDate:v6];

      if (*((_BYTE *)v13 + 24)) {
        goto LABEL_4;
      }
    }

    char v9 = *((_BYTE *)v13 + 24) != 0;
  }

  _Block_object_dispose(&v12, 8);
  return v9;
}

- (void)updateDocumentState
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController text](self, "text"));
  NSUInteger location = self->_selectedRange.location;
  NSUInteger length = self->_selectedRange.length;
  id v23 = v3;
  if ((unint64_t)[v3 length] <= 0x1000)
  {
    id v8 = v23;
  }

  else
  {
    id v6 = objc_msgSend(v23, "rangeOfComposedCharacterSequenceAtIndex:", (char *)objc_msgSend(v23, "length") - 2048);
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v23 substringFromIndex:v6]);

    location -= (unint64_t)v6;
    id v8 = (void *)v7;
  }

  id v24 = v8;
  if (location)
  {
    char v9 = (__CFString *)objc_claimAutoreleasedReturnValue([v8 substringToIndex:location]);
    if (length)
    {
LABEL_6:
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "substringWithRange:", location, length));
      goto LABEL_9;
    }
  }

  else
  {
    char v9 = &stru_89E80;
    if (length) {
      goto LABEL_6;
    }
  }

  uint64_t v10 = 0LL;
LABEL_9:
  unint64_t v11 = location + length;
  else {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v24 substringFromIndex:v11]);
  }
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[TIDocumentState documentStateWithContextBefore:selectedText:contextAfter:]( &OBJC_CLASS___TIDocumentState,  "documentStateWithContextBefore:selectedText:contextAfter:",  v9,  v10,  v12));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController markedText](self, "markedText"));
  id v15 = [v14 length];

  if (v15)
  {
    CGFloat v16 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController intermediateText](self, "intermediateText"));
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 displayString]);
    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController intermediateText](self, "intermediateText"));
    id v19 = [v18 selectedRange];
    uint64_t v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "documentStateAfterSettingMarkedText:selectedRange:", v17, v19, v20));

    id v13 = (void *)v21;
  }

  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keyboardState](self, "keyboardState"));
  [v22 setDocumentState:v13];
}

- (void)insertText:(id)a3
{
  if (a3)
  {
    text = self->_text;
    NSUInteger location = self->_selectedRange.location;
    NSUInteger length = self->_selectedRange.length;
    id v7 = a3;
    -[NSMutableString replaceCharactersInRange:withString:]( text,  "replaceCharactersInRange:withString:",  location,  length,  v7);
    id v8 = [v7 length];

    self->_selectedRange.location += (NSUInteger)v8;
    self->_selectedRange.NSUInteger length = 0LL;
    -[ACTKeyboardController updateDocumentState](self, "updateDocumentState");
  }

- (void)insertTextAfterSelection:(id)a3
{
  if (a3)
  {
    -[NSMutableString replaceCharactersInRange:withString:]( self->_text,  "replaceCharactersInRange:withString:",  self->_selectedRange.location,  self->_selectedRange.length,  a3);
    -[ACTKeyboardController updateDocumentState](self, "updateDocumentState");
  }

- (void)deleteBackwards
{
  if (self->_selectedRange.length)
  {
    -[NSMutableString deleteCharactersInRange:](self->_text, "deleteCharactersInRange:", self->_selectedRange.location);
LABEL_5:
    self->_selectedRange.NSUInteger length = 0LL;
    goto LABEL_6;
  }

  NSUInteger location = self->_selectedRange.location;
  if (location)
  {
    id v4 = -[NSMutableString _rangeOfBackwardDeletionClusterAtIndex:]( self->_text,  "_rangeOfBackwardDeletionClusterAtIndex:",  location - 1);
    -[NSMutableString deleteCharactersInRange:](self->_text, "deleteCharactersInRange:", v4, v5);
    self->_selectedRange.NSUInteger location = (NSUInteger)v4;
    goto LABEL_5;
  }

- (_NSRange)selectedRangeForText:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = self->_selectedRange.length + self->_selectedRange.location;
  else {
    NSUInteger v6 = v5 - (void)[v4 length];
  }

  NSUInteger v7 = v6;
  NSUInteger v8 = v5 - v6;
  result.NSUInteger length = v8;
  result.NSUInteger location = v7;
  return result;
}

- (void)deleteText:(id)a3 rawText:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  id location = -[ACTKeyboardController selectedRangeForText:](self, "selectedRangeForText:", v15);
  NSUInteger length = v8;
  id v10 = -[ACTKeyboardController selectedRangeForText:](self, "selectedRangeForText:", v6);
  NSUInteger v12 = v11;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableString substringWithRange:](self->_text, "substringWithRange:", location, length));
  if (v6) {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableString substringWithRange:](self->_text, "substringWithRange:", v10, v12));
  }
  else {
    uint64_t v14 = 0LL;
  }
  if (![v13 isEqualToString:v15])
  {
    if ([v14 isEqualToString:v6])
    {
      self->_selectedRange.id location = (NSUInteger)v10;
      self->_selectedRange.NSUInteger length = v12;
      NSUInteger length = v12;
      id location = v10;
      goto LABEL_11;
    }

    if (!v15 || v14)
    {
      id location = (id)self->_selectedRange.location;
      NSUInteger length = self->_selectedRange.length;
      goto LABEL_11;
    }
  }

  self->_selectedRange.id location = (NSUInteger)location;
  self->_selectedRange.NSUInteger length = length;
LABEL_11:
  -[NSMutableString deleteCharactersInRange:](self->_text, "deleteCharactersInRange:", location, length);
  self->_selectedRange.NSUInteger length = 0LL;
  -[ACTKeyboardController updateDocumentState](self, "updateDocumentState");
}

- (void)setSelectedRange:(_NSRange)a3
{
  if (a3.location != self->_selectedRange.location || a3.length != self->_selectedRange.length)
  {
    self->_selectedRange = a3;
    -[ACTKeyboardController setAutocorrectionList:](self, "setAutocorrectionList:", 0LL);
    -[ACTKeyboardController updateDocumentState](self, "updateDocumentState");
    NSUInteger v5 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController inputManagerWrapper](self, "inputManagerWrapper"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController clonedKeyboardState](self, "clonedKeyboardState"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1E824;
    v7[3] = &unk_88FE8;
    v7[4] = self;
    [v5 syncToKeyboardState:v6 completionHandler:v7];
  }

- (void)adjustPhraseBoundaryInForwardDirection:(BOOL)a3 granularity:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  BOOL v5 = a3;
  NSUInteger v7 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController inputManagerWrapper](self, "inputManagerWrapper"));
  NSUInteger v8 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController clonedKeyboardState](self, "clonedKeyboardState"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1E8F8;
  v9[3] = &unk_88FE8;
  v9[4] = self;
  [v7 adjustPhraseBoundaryInForwardDirection:v5 granularity:v4 keyboardState:v8 completionHandler:v9];
}

- (void)adjustCursorByOffset:(int64_t)a3
{
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keyboardState](self, "keyboardState"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 documentState]);
  NSUInteger v7 = (void *)objc_claimAutoreleasedReturnValue([v6 documentStateAfterCursorAdjustment:a3]);
  NSUInteger v8 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keyboardState](self, "keyboardState"));
  [v8 setDocumentState:v7];

  id v10 = (id)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController inputManagerWrapper](self, "inputManagerWrapper"));
  char v9 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController clonedKeyboardState](self, "clonedKeyboardState"));
  [v10 syncToKeyboardState:v9 completionHandler:&stru_89050];
}

- (int64_t)performTouchDownAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  double y = a3.y;
  double x = a3.x;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController activeTouchState](self, "activeTouchState"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a6));
  CGFloat v16 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:v15]);

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keyplane](self, "keyplane"));
  id v18 = (void *)objc_claimAutoreleasedReturnValue( -[ACTKeyboardController keyContainingPoint:inKeyplane:]( self,  "keyContainingPoint:inKeyplane:",  v17,  x,  y));

  if ([v18 interactionType] == 14)
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keyplane](self, "keyplane"));
    uint64_t v20 = @"Shift";
LABEL_5:
    int64_t v21 = -[ACTKeyboardController keyCodeWithString:inKeyplane:](self, "keyCodeWithString:inKeyplane:", v20, v19);

    goto LABEL_7;
  }

  if ([v18 interactionType] == 11)
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keyplane](self, "keyplane"));
    uint64_t v20 = @"More";
    goto LABEL_5;
  }

  int64_t v21 = -1LL;
LABEL_7:
  uint64_t v33 = 0LL;
  CGFloat v34 = &v33;
  uint64_t v35 = 0x2020000000LL;
  int64_t v36 = v21;
  double v22 = a4;
  if ([v18 interactionType] != 11)
  {
    id v23 = (void *)objc_claimAutoreleasedReturnValue( +[TIKeyboardTouchEvent touchEventWithStage:location:radius:timestamp:pathIndex:fingerID:forcedKeyCode:continuousPathState:]( &OBJC_CLASS___TIKeyboardTouchEvent,  "touchEventWithStage:location:radius:timestamp:pathIndex:fingerID:forcedKeyCode:continuousPathState:",  0LL,  a6,  v7,  v21,  1LL,  x,  y,  v22,  a5));
    id v24 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController inputManagerWrapper](self, "inputManagerWrapper"));
    id v25 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController clonedKeyboardState](self, "clonedKeyboardState"));
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_1ECEC;
    v32[3] = &unk_89078;
    v32[4] = &v33;
    [v24 performHitTestForTouchEvent:v23 keyboardState:v25 continuation:v32];
  }

  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( +[TIKeyboardTouchEvent touchEventWithStage:location:radius:timestamp:pathIndex:fingerID:forcedKeyCode:continuousPathState:]( &OBJC_CLASS___TIKeyboardTouchEvent,  "touchEventWithStage:location:radius:timestamp:pathIndex:fingerID:forcedKeyCode:continuousPathState:",  0LL,  a6,  v7,  v34[3],  1LL,  x,  y,  v22,  a5));
  uint64_t v27 = objc_alloc_init(&OBJC_CLASS____ACTKeyboardTouchState);
  -[_ACTKeyboardTouchState setLastTouchEvent:](v27, "setLastTouchEvent:", v26);
  -[_ACTKeyboardTouchState setDragged:](v27, "setDragged:", 0LL);
  -[_ACTKeyboardTouchState setInitialDragPoint:](v27, "setInitialDragPoint:", x, y);
  int v28 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController activeTouchState](self, "activeTouchState"));
  id v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a6));
  [v28 setObject:v27 forKey:v29];

  int64_t v30 = v34[3];
  _Block_object_dispose(&v33, 8);

  return v30;
}

- (BOOL)touchPassesDragThresholdAtPoint:(CGPoint)a3 pathIndex:(unint64_t)a4
{
  double y = a3.y;
  double x = a3.x;
  NSUInteger v8 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController activeTouchState](self, "activeTouchState"));
  char v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:v9]);

  [v10 initialDragPoint];
  double v12 = v11;
  double v14 = v13;
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keyboardState](self, "keyboardState"));
  CGFloat v16 = (void *)objc_claimAutoreleasedReturnValue([v15 layoutState]);
  uint64_t v17 = (char *)[v16 userInterfaceIdiom];

  unsigned int v18 = [v10 dragged];
  float v19 = 42.0;
  if (v18) {
    float v19 = 34.0;
  }
  float v20 = 18.0;
  if (v18) {
    float v20 = 12.0;
  }
  if (v17 != (_BYTE *)&dword_0 + 1) {
    float v19 = v20;
  }
  float v21 = y - v14;
  float v22 = x - v12;
  BOOL v23 = fabsf(v22) >= v19;
  BOOL v24 = fabsf(v21) >= v19 || v23;

  return v24;
}

- (int64_t)retestTouchAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  double y = a3.y;
  double x = a3.x;
  double v14 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController activeTouchState](self, "activeTouchState"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a6));
  CGFloat v16 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:v15]);

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 lastTouchEvent]);
  else {
    id v18 = [v17 continuousPathState];
  }
  if ([v17 forcedKeyCode] == (id)-2) {
    uint64_t v19 = -2LL;
  }
  else {
    uint64_t v19 = -1LL;
  }
  double v20 = a4;
  float v21 = (void *)objc_claimAutoreleasedReturnValue( +[TIKeyboardTouchEvent touchEventWithStage:location:radius:timestamp:pathIndex:fingerID:forcedKeyCode:continuousPathState:]( &OBJC_CLASS___TIKeyboardTouchEvent,  "touchEventWithStage:location:radius:timestamp:pathIndex:fingerID:forcedKeyCode:continuousPathState:",  1LL,  a6,  v7,  v19,  v18,  x,  y,  v20,  a5));
  uint64_t v31 = 0LL;
  id v32 = &v31;
  uint64_t v33 = 0x2020000000LL;
  uint64_t v34 = v19;
  float v22 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController inputManagerWrapper](self, "inputManagerWrapper"));
  BOOL v23 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController clonedKeyboardState](self, "clonedKeyboardState"));
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_1F0D8;
  v30[3] = &unk_89078;
  v30[4] = &v31;
  [v22 performHitTestForTouchEvent:v21 keyboardState:v23 continuation:v30];

  BOOL v24 = (void *)objc_claimAutoreleasedReturnValue( +[TIKeyboardTouchEvent touchEventWithStage:location:radius:timestamp:pathIndex:fingerID:forcedKeyCode:continuousPathState:]( &OBJC_CLASS___TIKeyboardTouchEvent,  "touchEventWithStage:location:radius:timestamp:pathIndex:fingerID:forcedKeyCode:continuousPathState:",  1LL,  a6,  v7,  x,  y,  v20,  a5));
  id v25 = objc_alloc_init(&OBJC_CLASS____ACTKeyboardTouchState);
  -[_ACTKeyboardTouchState setLastTouchEvent:](v25, "setLastTouchEvent:", v24);
  -[_ACTKeyboardTouchState setDragged:](v25, "setDragged:", 1LL);
  -[_ACTKeyboardTouchState setInitialDragPoint:](v25, "setInitialDragPoint:", x, y);
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController activeTouchState](self, "activeTouchState"));
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a6));
  [v26 setObject:v25 forKey:v27];

  int64_t v28 = v32[3];
  _Block_object_dispose(&v31, 8);

  return v28;
}

- (int64_t)performTouchDragAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  double y = a3.y;
  double x = a3.x;
  double v14 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController activeTouchState](self, "activeTouchState"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a6));
  CGFloat v16 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:v15]);

  if (-[ACTKeyboardController touchPassesDragThresholdAtPoint:pathIndex:]( self,  "touchPassesDragThresholdAtPoint:pathIndex:",  a6,  x,  y))
  {
    *(float *)&double v17 = a4;
    id v18 = -[ACTKeyboardController retestTouchAtLocation:radius:timestamp:pathIndex:fingerID:]( self,  "retestTouchAtLocation:radius:timestamp:pathIndex:fingerID:",  a6,  v7,  x,  y,  v17,  a5);
  }

  else
  {
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v16 lastTouchEvent]);
    id v18 = [v19 forcedKeyCode];
  }

  return (int64_t)v18;
}

- (void)performTouchCancelAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  double y = a3.y;
  double x = a3.x;
  double v14 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController activeTouchState](self, "activeTouchState"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a6));
  id v26 = (id)objc_claimAutoreleasedReturnValue([v14 objectForKey:v15]);

  CGFloat v16 = (void *)objc_claimAutoreleasedReturnValue([v26 lastTouchEvent]);
  unsigned int v17 = [v16 continuousPathState];
  if (v17 == 2) {
    unsigned int v18 = 2;
  }
  else {
    unsigned int v18 = 6;
  }
  if (v17) {
    uint64_t v19 = v18;
  }
  else {
    uint64_t v19 = 0LL;
  }
  if ([v16 forcedKeyCode] == (id)-2) {
    uint64_t v20 = -2LL;
  }
  else {
    uint64_t v20 = -1LL;
  }
  float v21 = (void *)objc_claimAutoreleasedReturnValue( +[TIKeyboardTouchEvent touchEventWithStage:location:radius:timestamp:pathIndex:fingerID:forcedKeyCode:continuousPathState:]( &OBJC_CLASS___TIKeyboardTouchEvent,  "touchEventWithStage:location:radius:timestamp:pathIndex:fingerID:forcedKeyCode:continuousPathState:",  3LL,  a6,  v7,  v20,  v19,  x,  y,  a4,  a5));
  float v22 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController inputManagerWrapper](self, "inputManagerWrapper"));
  BOOL v23 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController clonedKeyboardState](self, "clonedKeyboardState"));
  [v22 skipHitTestForTouchEvent:v21 keyboardState:v23];

  BOOL v24 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController activeTouchState](self, "activeTouchState"));
  id v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a6));
  [v24 removeObjectForKey:v25];
}

- (void)performTouchRestAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  double y = a3.y;
  double x = a3.x;
  double v14 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController activeTouchState](self, "activeTouchState"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a6));
  id v28 = (id)objc_claimAutoreleasedReturnValue([v14 objectForKey:v15]);

  CGFloat v16 = (void *)objc_claimAutoreleasedReturnValue([v28 lastTouchEvent]);
  unsigned int v17 = v16;
  if (v16)
  {
    unsigned int v18 = [v16 continuousPathState];
    if (v18 == 2) {
      unsigned int v19 = 2;
    }
    else {
      unsigned int v19 = 6;
    }
    if (v18) {
      uint64_t v20 = v19;
    }
    else {
      uint64_t v20 = 0LL;
    }
    uint64_t v21 = (uint64_t)[v17 forcedKeyCode];
  }

  else
  {
    uint64_t v20 = 0LL;
    uint64_t v21 = -1LL;
  }

  float v22 = (void *)objc_claimAutoreleasedReturnValue( +[TIKeyboardTouchEvent touchEventWithStage:location:radius:timestamp:pathIndex:fingerID:forcedKeyCode:continuousPathState:]( &OBJC_CLASS___TIKeyboardTouchEvent,  "touchEventWithStage:location:radius:timestamp:pathIndex:fingerID:forcedKeyCode:continuousPathState:",  4LL,  a6,  v7,  v21,  v20,  x,  y,  a4,  a5));
  BOOL v23 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController inputManagerWrapper](self, "inputManagerWrapper"));
  BOOL v24 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController clonedKeyboardState](self, "clonedKeyboardState"));
  [v23 skipHitTestForTouchEvent:v22 keyboardState:v24];

  id v25 = objc_alloc_init(&OBJC_CLASS____ACTKeyboardTouchState);
  -[_ACTKeyboardTouchState setLastTouchEvent:](v25, "setLastTouchEvent:", v22);
  -[_ACTKeyboardTouchState setDragged:](v25, "setDragged:", [v28 dragged]);
  [v28 initialDragPoint];
  -[_ACTKeyboardTouchState setInitialDragPoint:](v25, "setInitialDragPoint:");
  id v26 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController activeTouchState](self, "activeTouchState"));
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a6));
  [v26 setObject:v25 forKey:v27];
}

- (void)performTouchEndRestAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  double y = a3.y;
  double x = a3.x;
  double v14 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController activeTouchState](self, "activeTouchState"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a6));
  id v25 = (id)objc_claimAutoreleasedReturnValue([v14 objectForKey:v15]);

  CGFloat v16 = (void *)objc_claimAutoreleasedReturnValue([v25 lastTouchEvent]);
  unsigned int v17 = [v16 continuousPathState];
  if (v17 == 2) {
    unsigned int v18 = 2;
  }
  else {
    unsigned int v18 = 6;
  }
  if (v17) {
    uint64_t v19 = v18;
  }
  else {
    uint64_t v19 = 0LL;
  }
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[TIKeyboardTouchEvent touchEventWithStage:location:radius:timestamp:pathIndex:fingerID:forcedKeyCode:continuousPathState:]( TIKeyboardTouchEvent,  "touchEventWithStage:location:radius:timestamp:pathIndex:fingerID:forcedKeyCode:continuousPathState:",  5,  a6,  v7,  [v16 forcedKeyCode],  v19,  x,  y,  a4,  a5));
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController inputManagerWrapper](self, "inputManagerWrapper"));
  float v22 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController clonedKeyboardState](self, "clonedKeyboardState"));
  [v21 performHitTestForTouchEvent:v20 keyboardState:v22 continuation:&stru_890B8];

  BOOL v23 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController activeTouchState](self, "activeTouchState"));
  BOOL v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a6));
  [v23 removeObjectForKey:v24];
}

- (id)adjustContinuousPathCandidate:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController text](self, "text"));
  int v6 = [v5 length];
  if (v6 >= 3
    && [v4 length]
    && [v5 characterAtIndex:(v6 - 1)] == 46
    && [v5 characterAtIndex:(v6 - 2)] == 46
    && [v5 characterAtIndex:(v6 - 3)] == 46
    && [v4 characterAtIndex:0])
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v4 substringFromIndex:1]);

    id v4 = (id)v7;
  }

  return v4;
}

- (id)performTouchUpAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7 secondaryString:(BOOL)a8
{
  BOOL v8 = a8;
  uint64_t v9 = *(void *)&a7;
  double y = a3.y;
  double x = a3.x;
  CGFloat v16 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController activeTouchState](self, "activeTouchState"));
  unsigned int v17 = &CFAbsoluteTimeGetCurrent_ptr;
  unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a6));
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKey:v18]);

  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 lastTouchEvent]);
  if (-[ACTKeyboardController touchPassesDragThresholdAtPoint:pathIndex:]( self,  "touchPassesDragThresholdAtPoint:pathIndex:",  a6,  x,  y)
    || [v20 continuousPathState] == 3
    || [v20 continuousPathState] == 4)
  {
    *(float *)&double v21 = a4;
    -[ACTKeyboardController retestTouchAtLocation:radius:timestamp:pathIndex:fingerID:]( self,  "retestTouchAtLocation:radius:timestamp:pathIndex:fingerID:",  a6,  v9,  x,  y,  v21,  a5);
    float v22 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController activeTouchState](self, "activeTouchState"));
    BOOL v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a6));
    BOOL v24 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKey:v23]);

    uint64_t v25 = objc_claimAutoreleasedReturnValue([v24 lastTouchEvent]);
    uint64_t v20 = (void *)v25;
    uint64_t v19 = v24;
  }

  id v26 = [v20 forcedKeyCode];
  else {
    id v27 = [v20 continuousPathState];
  }
  id v28 = (void *)objc_claimAutoreleasedReturnValue( +[TIKeyboardTouchEvent touchEventWithStage:location:radius:timestamp:pathIndex:fingerID:forcedKeyCode:continuousPathState:]( &OBJC_CLASS___TIKeyboardTouchEvent,  "touchEventWithStage:location:radius:timestamp:pathIndex:fingerID:forcedKeyCode:continuousPathState:",  2LL,  a6,  v9,  v26,  v27,  x,  y,  a4,  a5));
  if (v26 == (id)-2LL)
  {
    if (!-[ACTKeyboardController insertsSpaceAfterPredictiveInput](self, "insertsSpaceAfterPredictiveInput")
      && !-[ACTKeyboardController usesTransliteration](self, "usesTransliteration"))
    {
      id v29 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController autocorrection](self, "autocorrection"));
      if (![v29 isAutocorrection])
      {
LABEL_32:

        goto LABEL_33;
      }

      int64_t v30 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController autocorrection](self, "autocorrection"));
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v30 candidate]);
      if (![v31 length])
      {

        goto LABEL_31;
      }

      id v32 = v28;
      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController autocorrection](self, "autocorrection"));
      unsigned __int8 v34 = [v33 isContinuousPathConversion];

      id v28 = v32;
      if ((v34 & 1) == 0)
      {
        -[ACTKeyboardController setLastInputWasSelection:](self, "setLastInputWasSelection:", 1LL);
        id v29 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController inputManagerState](self, "inputManagerState"));
        int64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v29 wordSeparator]);
        -[ACTKeyboardController addInput:fromVariantKey:touchEvent:]( self,  "addInput:fromVariantKey:touchEvent:",  v30,  0LL,  0LL);
LABEL_31:

        goto LABEL_32;
      }
    }

- (id)performSkipTapAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7 forcedKeyCode:(int64_t)a8
{
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keys](self, "keys", a6, *(void *)&a7, a3.x, a3.y));
  double v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndex:a8]);

  if ([v11 interactionType] == 11)
  {
    double v12 = &stru_89E80;
  }

  else
  {
    double v12 = 0LL;
    double v13 = 0LL;
  }

  -[ACTKeyboardController alternateKeyplane](self, "alternateKeyplane");
  double v13 = v12;
LABEL_5:
  -[ACTKeyboardController generateAutocorrectionsOrCandidates](self, "generateAutocorrectionsOrCandidates");

  return (id)v13;
}

- (void)addStringFromVariantKey:(id)a3
{
}

- (void)addStringFromGestureKeyInput:(id)a3
{
}

- (int64_t)keyCodeWithString:(id)a3 inKeyplane:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0LL;
  unsigned int v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  uint64_t v20 = -1LL;
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v7 keys]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_2026C;
  v13[3] = &unk_890E0;
  v13[4] = self;
  id v9 = v7;
  id v14 = v9;
  id v10 = v6;
  id v15 = v10;
  CGFloat v16 = &v17;
  [v8 enumerateObjectsUsingBlock:v13];

  int64_t v11 = v18[3];
  _Block_object_dispose(&v17, 8);

  return v11;
}

- (float)distanceFromKey:(id)a3 toPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v6 = a3;
  [v6 frame];
  double MinX = CGRectGetMinX(v24);
  [v6 frame];
  if (x >= MinX)
  {
    float v13 = 0.0;
    if (x <= CGRectGetMaxX(*(CGRect *)&v8)) {
      goto LABEL_6;
    }
    [v6 frame];
    double MaxX = CGRectGetMaxX(v25);
  }

  else
  {
    double MaxX = CGRectGetMinX(*(CGRect *)&v8);
  }

  float v13 = x - MaxX;
LABEL_6:
  [v6 frame];
  double MinY = CGRectGetMinY(v26);
  [v6 frame];
  if (y < MinY)
  {
    double v19 = CGRectGetMinY(*(CGRect *)&v15);
LABEL_10:
    float v21 = y - v19;
    goto LABEL_11;
  }

  CGFloat MaxY = CGRectGetMaxY(*(CGRect *)&v15);
  float v21 = 0.0;
  if (y > MaxY)
  {
    [v6 frame];
    double v19 = CGRectGetMaxY(v27);
    goto LABEL_10;
  }

- (id)keyContainingPoint:(CGPoint)a3 inKeyplane:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  [v7 frame];
  v27.double x = x;
  v27.double y = y;
  if (CGRectContainsPoint(v28, v27)
    || (uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 name]),
        unsigned int v9 = [v8 hasPrefix:@"Dynamic"],
        v8,
        v9))
  {
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "keys", 0));
    id v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v11)
    {
      id v12 = v11;
      float v13 = 0LL;
      uint64_t v14 = *(void *)v23;
      double v15 = 1.79769313e308;
      do
      {
        for (i = 0LL; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v23 != v14) {
            objc_enumerationMutation(v10);
          }
          uint64_t v17 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
          if ([v17 visible])
          {
            -[ACTKeyboardController distanceFromKey:toPoint:](self, "distanceFromKey:toPoint:", v17, x, y);
            double v19 = v18;
            if (v15 > v18)
            {
              id v20 = v17;

              float v13 = v20;
              double v15 = v19;
            }
          }
        }

        id v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }

      while (v12);
    }

    else
    {
      float v13 = 0LL;
    }
  }

  else
  {
    float v13 = 0LL;
  }

  return v13;
}

- (BOOL)isKeyStringAboveSpaceBar:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keyplane](self, "keyplane"));
  int64_t v6 = -[ACTKeyboardController keyCodeWithString:inKeyplane:](self, "keyCodeWithString:inKeyplane:", @" ", v5);

  if (v6 == -1)
  {
    BOOL v19 = 0;
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keyplane](self, "keyplane"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 keys]);
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:v6]);

    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keyplane](self, "keyplane"));
    int64_t v11 = -[ACTKeyboardController keyCodeWithString:inKeyplane:](self, "keyCodeWithString:inKeyplane:", v4, v10);

    if (v11 == -1)
    {
      BOOL v19 = 0;
    }

    else
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keyplane](self, "keyplane"));
      float v13 = (void *)objc_claimAutoreleasedReturnValue([v12 keys]);
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectAtIndexedSubscript:v11]);

      [v9 frame];
      double v16 = v15;
      [v14 frame];
      CGFloat MidX = CGRectGetMidX(v22);
      [v14 frame];
      CGFloat v18 = v16 + CGRectGetMidY(v23);
      [v9 frame];
      v21.double x = MidX;
      v21.double y = v18;
      BOOL v19 = CGRectContainsPoint(v24, v21);
    }
  }

  return v19;
}

- (void)enumerateKeyplaneNamesAdjacentToKeyplane:(id)a3 usingBlock:(id)a4
{
  id v7 = (void (**)(id, void *))a4;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([a3 shiftAlternateKeyplaneName]);
  v7[2](v7, v5);

  int64_t v6 = (void *)objc_claimAutoreleasedReturnValue([a3 alternateKeyplaneName]);
  v7[2](v7, v6);
}

- (BOOL)isKeyplane:(id)a3 shiftAlternateOfKeyplane:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keyboard](self, "keyboard"));
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v6 shiftAlternateKeyplaneName]);

  id v10 = (id)objc_claimAutoreleasedReturnValue([v8 subtreeWithName:v9]);
  return v10 == v7;
}

- (BOOL)isKeyplane:(id)a3 alternateOfKeyplane:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keyboard](self, "keyboard"));
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v6 alternateKeyplaneName]);

  id v10 = (id)objc_claimAutoreleasedReturnValue([v8 subtreeWithName:v9]);
  return v10 == v7;
}

- (id)keyToAccessKeyplane:(id)a3 fromKeyplane:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[ACTKeyboardController isKeyplane:shiftAlternateOfKeyplane:]( self,  "isKeyplane:shiftAlternateOfKeyplane:",  v6,  v7))
  {
    uint64_t v8 = @"Shift";
  }

  else
  {
    if (!-[ACTKeyboardController isKeyplane:alternateOfKeyplane:](self, "isKeyplane:alternateOfKeyplane:", v6, v7))
    {
      unsigned int v9 = 0LL;
      goto LABEL_7;
    }

    uint64_t v8 = @"More";
  }

  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue( -[ACTKeyboardLayoutUtils exactKeyForString:keyplane:includeSecondaryStrings:]( self->_layoutUtils,  "exactKeyForString:keyplane:includeSecondaryStrings:",  v8,  v7,  0LL));
LABEL_7:

  return v9;
}

- (id)displayStringOverrideForKey:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController layoutUtils](self, "layoutUtils"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 keyOverrides]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v4]);

  return v7;
}

- (void)acceptAutocorrection
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController autocorrectionList](self, "autocorrectionList"));
  unsigned int v4 = [v3 shouldAcceptTopCandidate];

  if (v4)
  {
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController autocorrectionList](self, "autocorrectionList"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 candidates]);
    id v7 = (id)objc_claimAutoreleasedReturnValue([v6 firstObject]);
  }

  else
  {
    id v7 = 0LL;
  }

  -[ACTKeyboardController textAccepted:predictiveCandidate:](self, "textAccepted:predictiveCandidate:", v7, 0LL);
  -[ACTKeyboardController setAutocorrectionList:](self, "setAutocorrectionList:", 0LL);
}

- (void)rejectCandidate:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController inputManagerWrapper](self, "inputManagerWrapper"));
    [v5 candidateRejected:v4];
  }

  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  CGRect v26 = self;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController autocorrectionList](self, "autocorrectionList"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 predictions]);

  id obj = v7;
  id v8 = [v7 countByEnumeratingWithState:&v29 objects:v33 count:16];
  CGPoint v27 = v4;
  if (v8)
  {
    id v9 = v8;
    id v10 = 0LL;
    uint64_t v11 = *(void *)v30;
    id v12 = &stru_89E80;
    float v13 = &stru_89E80;
    while (1)
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v30 != v11) {
          objc_enumerationMutation(obj);
        }
        double v15 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)i);
        double v16 = (__CFString *)objc_claimAutoreleasedReturnValue([v15 input]);
        uint64_t v17 = v16;
        if (v13)
        {
          id v18 = -[__CFString length](v16, "length");
          id v19 = -[__CFString length](v13, "length");

          if (v18 <= v19) {
            continue;
          }
          uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue([v15 input]);
        }

        uint64_t v20 = objc_claimAutoreleasedReturnValue([v15 rawInput]);

        id v10 = [v15 typingEngine];
        id v12 = (__CFString *)v20;
        float v13 = v17;
      }

      id v9 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (!v9) {
        goto LABEL_16;
      }
    }
  }

  id v10 = 0LL;
  id v12 = &stru_89E80;
  float v13 = &stru_89E80;
LABEL_16:

  id v21 = [[TIKeyboardCandidateSingle alloc] initWithCandidate:v13 forInput:v13 rawInput:v12];
  [v21 setTypingEngine:v10];
  id v22 = [[TICorrectionCandidates alloc] initWithAutocorrection:v21 alternateCorrections:0];
  CGRect v23 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController autocorrectionList](v26, "autocorrectionList"));
  CGRect v24 = (void *)objc_claimAutoreleasedReturnValue([v23 predictions]);
  __int128 v25 = (void *)objc_claimAutoreleasedReturnValue( +[TIAutocorrectionList listWithCorrections:predictions:]( &OBJC_CLASS___TIAutocorrectionList,  "listWithCorrections:predictions:",  v22,  v24));
  -[ACTKeyboardController setAutocorrectionList:](v26, "setAutocorrectionList:", v25);
}

- (BOOL)hasPrediction:(id)a3
{
  id v4 = a3;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController autocorrectionList](self, "autocorrectionList", 0LL));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 predictions]);

  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    char v9 = 0;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v15 + 1) + 8 * (void)i) candidate]);
        BOOL v13 = [v12 compare:v4] == 0;

        v9 |= v13;
      }

      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v8);
  }

  else
  {
    char v9 = 0;
  }

  return v9 & 1;
}

- (void)acceptCandidate:(id)a3
{
}

- (void)acceptCandidate:(id)a3 predictiveCandidate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController inputManagerState](self, "inputManagerState"));
  unsigned int v8 = [v7 usesCandidateSelection];

  if (v8)
  {
    char v9 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController inputManagerState](self, "inputManagerState"));
    unsigned int v10 = [v9 commitsAcceptedCandidate];

    if (v10)
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 candidate]);
      id v12 = [v11 length];

      if (v12)
      {
        BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController inputManagerWrapper](self, "inputManagerWrapper"));
        [v13 textAccepted:v6];
      }

      -[ACTKeyboardController setMarkedText:](self, "setMarkedText:", 0LL);
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v6 candidate]);
      -[ACTKeyboardController insertText:](self, "insertText:", v14);
    }

    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController inputManagerWrapper](self, "inputManagerWrapper"));
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController clonedKeyboardState](self, "clonedKeyboardState"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_20FE8;
    v17[3] = &unk_89108;
    v17[4] = self;
    [v15 handleAcceptedCandidate:v6 keyboardState:v16 completionHandler:v17];
  }

  else
  {
    -[ACTKeyboardController textAccepted:predictiveCandidate:](self, "textAccepted:predictiveCandidate:", v6, v4);
  }

  -[ACTKeyboardController setLastInputWasSelection:](self, "setLastInputWasSelection:", v4);
  -[ACTKeyboardController setCandidateResultSet:](self, "setCandidateResultSet:", 0LL);
  -[ACTKeyboardController setAutocorrectionList:](self, "setAutocorrectionList:", 0LL);
}

- (id)candidateByApplyingSmartPunctuationToCandidate:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController smartPunctuationController](self, "smartPunctuationController"));

  id v6 = v4;
  id v7 = v6;
  if (v5)
  {
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController smartPunctuationController](self, "smartPunctuationController"));
    char v9 = (void *)objc_claimAutoreleasedReturnValue([v6 candidate]);
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v8 smartPunctuationResultsForString:v9]);

    id v7 = v6;
    if ([v10 count])
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 candidate]);
      id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](&OBJC_CLASS___NSMutableString, "stringWithString:", v11));

      __int128 v29 = 0u;
      __int128 v30 = 0u;
      __int128 v27 = 0u;
      __int128 v28 = 0u;
      BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "reverseObjectEnumerator", 0));
      id v14 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v28;
        do
        {
          for (i = 0LL; i != v15; i = (char *)i + 1)
          {
            if (*(void *)v28 != v16) {
              objc_enumerationMutation(v13);
            }
            __int128 v18 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)i);
            id v19 = [v18 range];
            uint64_t v21 = v20;
            id v22 = (void *)objc_claimAutoreleasedReturnValue([v18 replacementString]);
            objc_msgSend(v12, "replaceCharactersInRange:withString:", v19, v21, v22);
          }

          id v15 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
        }

        while (v15);
      }

      id v23 = objc_alloc(&OBJC_CLASS___TIKeyboardCandidateSingle);
      CGRect v24 = (void *)objc_claimAutoreleasedReturnValue([v6 input]);
      __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v6 rawInput]);
      id v7 = [v23 initWithCandidate:v12 forInput:v24 rawInput:v25];
    }
  }

  return v7;
}

- (void)textAccepted:(id)a3 predictiveCandidate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 candidate]);
  id v8 = [v7 length];

  if (!v8)
  {
    char v9 = v6;
    goto LABEL_15;
  }

  char v9 = (void *)objc_claimAutoreleasedReturnValue( -[ACTKeyboardController candidateByApplyingSmartPunctuationToCandidate:]( self,  "candidateByApplyingSmartPunctuationToCandidate:",  v6));

  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController inputManagerWrapper](self, "inputManagerWrapper"));
  char v11 = objc_opt_respondsToSelector(v10, "textAccepted:completionHandler:");

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController inputManagerWrapper](self, "inputManagerWrapper"));
  BOOL v13 = v12;
  if ((v11 & 1) != 0)
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_214C4;
    v21[3] = &unk_88FE8;
    v21[4] = self;
    [v12 textAccepted:v9 completionHandler:v21];
  }

  else
  {
    [v12 textAccepted:v9];
  }

  if (v4)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController inputManager](self, "inputManager"));
    [v14 dropInput];
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue([v9 input]);
  if ([v15 length])
  {

LABEL_12:
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v9 input]);
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v9 rawInput]);
    -[ACTKeyboardController deleteText:rawText:](self, "deleteText:rawText:", v18, v19);

    goto LABEL_13;
  }

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v9 rawInput]);
  id v17 = [v16 length];

  if (v17) {
    goto LABEL_12;
  }
  -[NSMutableString deleteCharactersInRange:]( self->_text,  "deleteCharactersInRange:",  self->_selectedRange.location,  self->_selectedRange.length);
  self->_selectedRange.NSUInteger length = 0LL;
  -[ACTKeyboardController updateDocumentState](self, "updateDocumentState");
LABEL_13:
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v9 candidate]);
  -[ACTKeyboardController insertText:](self, "insertText:", v20);

LABEL_15:
}

- (TIKeyboardCandidate)inlineCompletion
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController autocorrectionList](self, "autocorrectionList"));
  unsigned int v4 = [v3 shouldAcceptInlineCompletion];

  if (v4)
  {
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController autocorrectionList](self, "autocorrectionList"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 inlineCompletions]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 firstObject]);

    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 candidate]);
    char v9 = (void *)objc_claimAutoreleasedReturnValue([v8 componentsSeparatedByString:@" "]);

    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController text](self, "text"));
    char v11 = (char *)-[ACTKeyboardController selectedRange](self, "selectedRange");
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue([v10 substringFromIndex:&v11[v12 - 1]]);

    if ([v13 isEqualToString:@" "])
    {
      if ((unint64_t)[v9 count] < 2)
      {
        uint64_t v16 = 0LL;
        goto LABEL_9;
      }

      uint64_t v14 = objc_claimAutoreleasedReturnValue([v9 objectAtIndexedSubscript:1]);
      uint64_t v15 = objc_claimAutoreleasedReturnValue([v7 candidateByReplacingWithCandidate:v14 input:&stru_89E80 rawInput:&stru_89E80]);
    }

    else
    {
      uint64_t v14 = objc_claimAutoreleasedReturnValue([v9 firstObject]);
      uint64_t v15 = objc_claimAutoreleasedReturnValue([v7 candidateByReplacingWithCandidate:v14]);
    }

    uint64_t v16 = (void *)v15;

    id v7 = (void *)v14;
LABEL_9:

    return (TIKeyboardCandidate *)v16;
  }

  uint64_t v16 = 0LL;
  return (TIKeyboardCandidate *)v16;
}

- (TIKeyboardCandidate)autocorrection
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController autocorrectionList](self, "autocorrectionList"));
  unsigned int v4 = [v3 shouldAcceptTopCandidate];

  if (v4
    && (BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController autocorrectionList](self, "autocorrectionList")),
        id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 candidates]),
        id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 firstObject]),
        v6,
        v5,
        v7))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController trimmedCandidate:](self, "trimmedCandidate:", v7));
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController candidateToConfirmInputString](self, "candidateToConfirmInputString"));
  }

  char v9 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController text](self, "text"));
  unsigned int v10 = (char *)-[ACTKeyboardController selectedRange](self, "selectedRange");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v9 substringToIndex:&v10[v11]]);

  BOOL v13 = (void *)objc_claimAutoreleasedReturnValue([v8 input]);
  if ([v13 length])
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v8 input]);
    if ([v12 hasSuffix:v14])
    {
    }

    else
    {
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v8 rawInput]);
      if ([v15 length])
      {
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v8 rawInput]);
        unsigned __int8 v17 = [v12 hasSuffix:v16];

        if ((v17 & 1) != 0) {
          goto LABEL_14;
        }
      }

      else
      {
      }

      BOOL v13 = v8;
      id v8 = (void *)objc_claimAutoreleasedReturnValue( +[TIKeyboardCandidateSingle candidateWithUnchangedInput:]( &OBJC_CLASS___TIKeyboardCandidateSingle,  "candidateWithUnchangedInput:",  &stru_89E80));
    }
  }

LABEL_14:
  return (TIKeyboardCandidate *)v8;
}

- (NSArray)predictions
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController candidateResultSet](self, "candidateResultSet"));
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 candidates]);

  if (!v4 || ![v4 count])
  {
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController autocorrectionList](self, "autocorrectionList"));
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 predictions]);
    id v7 = (void *)v6;
    id v8 = &__NSArray0__struct;
    if (v6) {
      id v8 = (void *)v6;
    }
    id v9 = v8;

    unsigned int v4 = v9;
  }

  return (NSArray *)v4;
}

- (id)candidateToConfirmInputString
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController inputManager](self, "inputManager"));
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 defaultCandidate]);

  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController trimmedCandidate:](self, "trimmedCandidate:", v4));
  return v5;
}

- (id)trimmedCandidate:(id)a3
{
  id v3 = a3;
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 input]);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v3 rawInput]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 candidate]);
  id v7 = [v4 length];
  id v8 = [v6 length];
  if (v7 >= v8) {
    id v9 = v8;
  }
  else {
    id v9 = v7;
  }
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceCharacterSet](&OBJC_CLASS___NSCharacterSet, "whitespaceCharacterSet"));
  uint64_t v26 = 0LL;
  __int128 v27 = &v26;
  uint64_t v28 = 0x2020000000LL;
  uint64_t v29 = 0LL;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_21B84;
  v22[3] = &unk_89130;
  id v11 = v4;
  id v23 = v11;
  id v12 = v10;
  id v24 = v12;
  __int128 v25 = &v26;
  objc_msgSend(v6, "enumerateSubstringsInRange:options:usingBlock:", 0, v9, 2, v22);
  id v13 = v3;
  id v14 = v13;
  if (v27[3])
  {
    uint64_t v15 = objc_opt_class(&OBJC_CLASS___TIZephyrCandidate);
    if ((objc_opt_isKindOfClass(v13, v15) & 1) != 0)
    {
      id v16 = objc_alloc(&OBJC_CLASS___TIZephyrCandidate);
      unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue([v6 substringFromIndex:v27[3]]);
      __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v11 substringFromIndex:v27[3]]);
      id v14 = objc_msgSend( v16,  "initWithCandidate:forInput:rawInput:wordOriginFeedbackID:usageTrackingMask:sourceMask:",  v17,  v18,  v5,  objc_msgSend(v13, "wordOriginFeedbackID"),  objc_msgSend(v13, "usageTrackingMask"),  objc_msgSend(v13, "sourceMask"));

      objc_msgSend(v14, "setContinuousPathConversion:", objc_msgSend(v13, "isContinuousPathConversion"));
      id v19 = v13;
    }

    else
    {
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v6 substringFromIndex:v27[3]]);
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v11 substringFromIndex:v27[3]]);
      id v14 = (id)objc_claimAutoreleasedReturnValue( +[TIKeyboardCandidateSingle candidateWithCandidate:forInput:]( &OBJC_CLASS___TIKeyboardCandidateSingle,  "candidateWithCandidate:forInput:",  v19,  v20));
    }
  }

  _Block_object_dispose(&v26, 8);
  return v14;
}

- (BOOL)generatesCandidates
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keyboardState](self, "keyboardState"));
  if ((objc_opt_respondsToSelector(v3, "setLongPredictionListEnabled:") & 1) != 0)
  {
    unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keyboardState](self, "keyboardState"));
    unsigned __int8 v5 = [v4 longPredictionListEnabled];
  }

  else
  {
    unsigned __int8 v5 = 0;
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController inputManagerState](self, "inputManagerState"));
  char v7 = [v6 usesCandidateSelection] | v5;

  return v7;
}

- (void)generateAutocorrectionsOrCandidates
{
  unsigned int v3 = -[ACTKeyboardController generatesCandidates](self, "generatesCandidates");
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController clonedKeyboardState](self, "clonedKeyboardState"));
  if (v3) {
    -[ACTKeyboardController generateCandidatesWithKeyboardState:](self, "generateCandidatesWithKeyboardState:", v4);
  }
  else {
    -[ACTKeyboardController generateAutocorrectionsWithKeyboardState:]( self,  "generateAutocorrectionsWithKeyboardState:",  v4);
  }
}

- (void)generateAutocorrectionsWithShiftState:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController clonedKeyboardState](self, "clonedKeyboardState"));
  [v5 setShiftState:v3];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController inputManagerWrapper](self, "inputManagerWrapper"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_21DC0;
  v7[3] = &unk_89158;
  v7[4] = self;
  [v6 generateAutocorrectionsWithKeyboardState:v5 completionHandler:v7];
}

- (void)generateAutocorrectionsWithCount:(unint64_t)a3
{
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController inputManagerWrapper](self, "inputManagerWrapper"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController clonedKeyboardState](self, "clonedKeyboardState"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_21E68;
  v7[3] = &unk_89158;
  v7[4] = self;
  objc_msgSend(v5, "generateAutocorrectionsWithKeyboardState:candidateRange:completionHandler:", v6, 0, a3, v7);
}

- (void)pushAutocorrections:(id)a3 requestToken:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  char v7 = (void *)objc_claimAutoreleasedReturnValue([v14 corrections]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 autocorrection]);
  unsigned int v9 = [v8 isContinuousPathConversion];

  if (v9)
  {
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController cpRequestTokenLock](self, "cpRequestTokenLock"));
    [v10 lock];

    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController lastCPRequestToken](self, "lastCPRequestToken"));
    unsigned int v12 = [v11 isSameRequestAs:v6];

    if (v12)
    {
      -[ACTKeyboardController setAutocorrectionList:](self, "setAutocorrectionList:", v14);
      -[ACTKeyboardController setLastCPRequestToken:](self, "setLastCPRequestToken:", 0LL);
    }

    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController cpRequestTokenLock](self, "cpRequestTokenLock"));
    [v13 unlock];
  }

  else
  {
    -[ACTKeyboardController setAutocorrectionList:](self, "setAutocorrectionList:", v14);
  }
}

- (void)pushCandidateResultSet:(id)a3 requestToken:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  char v7 = (void *)objc_claimAutoreleasedReturnValue([v13 firstCandidate]);
  unsigned int v8 = [v7 isContinuousPathConversion];

  if (v8)
  {
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController cpRequestTokenLock](self, "cpRequestTokenLock"));
    [v9 lock];

    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController lastCPRequestToken](self, "lastCPRequestToken"));
    unsigned int v11 = [v10 isSameRequestAs:v6];

    if (v11)
    {
      -[ACTKeyboardController setCandidateResultSet:](self, "setCandidateResultSet:", v13);
      -[ACTKeyboardController setLastCPRequestToken:](self, "setLastCPRequestToken:", 0LL);
    }

    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController cpRequestTokenLock](self, "cpRequestTokenLock"));
    [v12 unlock];
  }

  else
  {
    -[ACTKeyboardController setCandidateResultSet:](self, "setCandidateResultSet:", v13);
  }
}

- (void)closeRequestToken:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v10 = v4;
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController currentRequestToken](self, "currentRequestToken"));
    unsigned int v6 = [v5 isSameRequestAs:v10];

    id v4 = v10;
    if (v6)
    {
      char v7 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController requestCondition](self, "requestCondition"));
      [v7 lock];

      -[ACTKeyboardController setCurrentRequestToken:](self, "setCurrentRequestToken:", 0LL);
      unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController requestCondition](self, "requestCondition"));
      [v8 signal];

      unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController requestCondition](self, "requestCondition"));
      [v9 unlock];

      id v4 = v10;
    }
  }
}

- (void)generateAutocorrectionsWithKeyboardState:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[ACTKeyboardController autocorrection](self, "autocorrection"));
  if (!v5
    || (unsigned int v6 = (void *)v5,
        char v7 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController autocorrection](self, "autocorrection")),
        unsigned __int8 v8 = [v7 isForShortcutConversion],
        v7,
        v6,
        (v8 & 1) == 0))
  {
    if (-[ACTKeyboardController asyncPredictions](self, "asyncPredictions")
      && (unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController inputManagerWrapper](self, "inputManagerWrapper")),
          char v10 = objc_opt_respondsToSelector( v9,  "generateAutocorrectionsWithKeyboardState:candidateRange:requestToken:completionHandler:"),  v9,  (v10 & 1) != 0))
    {
      id v11 = -[objc_class tokenForKeyboardState:]( NSClassFromString(@"TICandidateRequestToken"),  "tokenForKeyboardState:",  v4);
      unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController requestCondition](self, "requestCondition"));
      [v13 lock];

      -[ACTKeyboardController setAutocorrectionList:](self, "setAutocorrectionList:", 0LL);
      -[ACTKeyboardController setCurrentRequestToken:](self, "setCurrentRequestToken:", v12);
      id v14 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController requestCondition](self, "requestCondition"));
      [v14 unlock];

      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController inputManagerWrapper](self, "inputManagerWrapper"));
      id v16 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController clonedKeyboardState](self, "clonedKeyboardState"));
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472LL;
      v31[2] = sub_22464;
      v31[3] = &unk_89180;
      v31[4] = self;
      id v17 = v12;
      id v32 = v17;
      objc_msgSend( v15,  "generateAutocorrectionsWithKeyboardState:candidateRange:requestToken:completionHandler:",  v16,  0,  3,  v17,  v31);

      __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController requestCondition](self, "requestCondition"));
      [v18 lock];

      id v19 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController currentRequestToken](self, "currentRequestToken"));
      if (v19)
      {
        do
        {
          if ([v4 needAutofill])
          {
            uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  0.5));
            uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController requestCondition](self, "requestCondition"));
            unsigned __int8 v22 = [v21 waitUntilDate:v20];

            if ((v22 & 1) == 0)
            {
              id v23 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController requestCondition](self, "requestCondition"));
              [v23 unlock];

              id v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  0.5));
              __int128 v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
              [v25 acceptInputForMode:NSDefaultRunLoopMode beforeDate:v24];

              uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController requestCondition](self, "requestCondition"));
              [v26 lock];
            }
          }

          else
          {
            uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController requestCondition](self, "requestCondition"));
            [v20 wait];
          }

          __int128 v27 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController currentRequestToken](self, "currentRequestToken"));
        }

        while (v27);
      }

      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController requestCondition](self, "requestCondition"));
      [v28 unlock];
    }

    else
    {
      id v17 = (id)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController inputManagerWrapper](self, "inputManagerWrapper"));
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController clonedKeyboardState](self, "clonedKeyboardState"));
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472LL;
      v30[2] = sub_22524;
      v30[3] = &unk_89158;
      v30[4] = self;
      [v17 generateAutocorrectionsWithKeyboardState:v29 completionHandler:v30];
    }
  }
}

- (void)generateCandidates
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController clonedKeyboardState](self, "clonedKeyboardState"));
  -[ACTKeyboardController generateCandidatesWithKeyboardState:](self, "generateCandidatesWithKeyboardState:", v3);
}

- (void)acceptCandidateInputEvent:(id)a3 fromCandidateBar:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  char v7 = v6;
  id v14 = v6;
  if (v4)
  {
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v6 acceptedCandidate]);
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 candidate]);
    if ([v9 length])
    {

      char v7 = v14;
LABEL_5:
      -[ACTKeyboardController handleKeyboardInput:](self, "handleKeyboardInput:", v7);
      -[ACTKeyboardController setLastInputWasSelection:](self, "setLastInputWasSelection:", 1LL);
LABEL_8:
      -[ACTKeyboardController updateAutoshift](self, "updateAutoshift");
      -[ACTKeyboardController generateAutocorrectionsOrCandidates](self, "generateAutocorrectionsOrCandidates");
      id v13 = v14;
      goto LABEL_9;
    }

    char v10 = (void *)objc_claimAutoreleasedReturnValue([v14 acceptedCandidate]);
    unsigned int v11 = [v10 isSecureContentCandidate];

    char v7 = v14;
    if (v11) {
      goto LABEL_5;
    }
  }

  unsigned int v12 = [v7 isDoubleSpace];
  id v13 = v14;
  if (v12)
  {
    -[ACTKeyboardController handleKeyboardInput:](self, "handleKeyboardInput:", v14);
    goto LABEL_8;
  }

- (void)generateCandidatesWithKeyboardState:(id)a3
{
  id v4 = a3;
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  char v22 = 0;
  -[ACTKeyboardController setCandidateResultSet:](self, "setCandidateResultSet:", 0LL);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController inputManagerWrapper](self, "inputManagerWrapper"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController clonedKeyboardState](self, "clonedKeyboardState"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_22954;
  v18[3] = &unk_891A8;
  v18[4] = self;
  v18[5] = &v19;
  objc_msgSend(v5, "generateCandidatesWithKeyboardState:candidateRange:completionHandler:", v6, 0, 0x7FFFFFFFLL, v18);

  char v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", 0.5));
  if (*((_BYTE *)v20 + 24)) {
    goto LABEL_6;
  }
  while (1)
  {
    [v7 timeIntervalSinceNow];
    if (v8 <= 0.0) {
      break;
    }
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
    [v9 acceptInputForMode:NSDefaultRunLoopMode beforeDate:v7];

    if (*((_BYTE *)v20 + 24)) {
      goto LABEL_6;
    }
  }

  if (*((_BYTE *)v20 + 24))
  {
LABEL_6:
    char v10 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController candidateResultSet](self, "candidateResultSet"));
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 uncommittedText]);

    if (v11)
    {
      unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController candidateResultSet](self, "candidateResultSet"));
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 uncommittedText]);
      -[ACTKeyboardController setIntermediateText:](self, "setIntermediateText:", v13);
    }

    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController candidateResultSet](self, "candidateResultSet"));
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 committedText]);

    if (v15)
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController candidateResultSet](self, "candidateResultSet"));
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 committedText]);
      -[ACTKeyboardController insertText:](self, "insertText:", v17);
    }
  }

  _Block_object_dispose(&v19, 8);
}

- (id)candidatesForString:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  unsigned int v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  id v14 = sub_1C1E0;
  uint64_t v15 = sub_1C1F0;
  id v16 = 0LL;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController inputManagerWrapper](self, "inputManagerWrapper"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keyboardState](self, "keyboardState"));
  char v7 = (void *)objc_claimAutoreleasedReturnValue([v6 keyLayout]);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_22AB4;
  v10[3] = &unk_891D0;
  v10[4] = &v11;
  [v5 generateReplacementsForString:v4 keyLayout:v7 continuation:v10];

  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

- (void)updateKeyboardOutput:(id)a3 withInputForSmartPunctuation:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  char v7 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController smartPunctuationController](self, "smartPunctuationController"));

  if (v7)
  {
    else {
      id v8 = [v6 isFlick];
    }
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController smartPunctuationController](self, "smartPunctuationController"));
    char v10 = (void *)objc_claimAutoreleasedReturnValue([v6 string]);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keyboardState](self, "keyboardState"));
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 documentState]);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v9 smartPunctuationOutputForInput:v10 isLockedInput:v8 documentState:v12]);

    if ([v13 deletionCount]) {
      objc_msgSend(v17, "setDeletionCount:", objc_msgSend(v13, "deletionCount"));
    }
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 insertionText]);
    if ([v14 length])
    {
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v17 insertionText]);
      id v16 = [v15 length];

      if (!v16)
      {
LABEL_11:

        goto LABEL_12;
      }

      id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 insertionText]);
      [v17 setInsertionText:v14];
    }

    goto LABEL_11;
  }

- (void)handleKeyboardInput:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 acceptedCandidate]);

  if (!v5) {
    goto LABEL_9;
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 acceptedCandidate]);
  char v7 = (void *)objc_claimAutoreleasedReturnValue( -[ACTKeyboardController candidateByApplyingSmartPunctuationToCandidate:]( self,  "candidateByApplyingSmartPunctuationToCandidate:",  v6));
  [v4 setAcceptedCandidate:v7];

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 acceptedCandidate]);
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 input]);
  char v10 = (void *)objc_claimAutoreleasedReturnValue([v4 acceptedCandidate]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 rawInput]);
  -[ACTKeyboardController deleteText:rawText:](self, "deleteText:rawText:", v9, v11);

  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v4 acceptedCandidate]);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 candidate]);

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v4 acceptedCandidate]);
  if ((objc_opt_respondsToSelector(v14, "isContinuousPathConversion") & 1) == 0) {
    goto LABEL_5;
  }
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v4 acceptedCandidate]);
  unsigned int v16 = [v15 isContinuousPathConversion];

  if (v16)
  {
    id v14 = v13;
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController adjustContinuousPathCandidate:](self, "adjustContinuousPathCandidate:", v13));
LABEL_5:
  }

  -[ACTKeyboardController insertText:](self, "insertText:", v13);
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v4 acceptedCandidate]);
  unsigned int v18 = [v17 isAutocorrection];

  if (v18) {
    -[ACTKeyboardController setJustAcceptedAutocorrection:](self, "setJustAcceptedAutocorrection:", 1LL);
  }

LABEL_9:
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController inputManagerWrapper](self, "inputManagerWrapper"));
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController clonedKeyboardState](self, "clonedKeyboardState"));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_22E58;
  v22[3] = &unk_891F8;
  void v22[4] = self;
  id v23 = v4;
  id v21 = v4;
  [v19 handleKeyboardInput:v21 keyboardState:v20 completionHandler:v22];
}

- (void)addInput:(id)a3 fromVariantKey:(BOOL)a4 fromGestureKey:(BOOL)a5
{
  uint64_t v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  -[ACTKeyboardController addInput:fromVariantKey:fromGestureKey:touchEvent:]( self,  "addInput:fromVariantKey:fromGestureKey:touchEvent:",  v8,  v6,  v5,  0LL);
  LOBYTE(v5) = [v8 isEqualToString:@"Shift"];

  if ((v5 & 1) == 0) {
    -[ACTKeyboardController updateAutoshift](self, "updateAutoshift");
  }
  -[ACTKeyboardController generateAutocorrectionsOrCandidates](self, "generateAutocorrectionsOrCandidates");
}

- (void)addInput:(id)a3 fromVariantKey:(BOOL)a4 touchEvent:(id)a5
{
}

- (BOOL)isContinuousPathNonSpacePunctuation:(unsigned int)a3
{
  unsigned __int16 v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController inputManager](self, "inputManager"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 terminatorsDeletingAutospace]);

  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v5 characterSet]);
  LOBYTE(v3) = [v6 characterIsMember:v3];

  return v3;
}

- (BOOL)shouldAcceptCandidate:(id)a3 beforeInputString:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 candidate]);
  if ([v8 length] || objc_msgSend(v6, "slotID"))
  {
  }

  else
  {
    id v19 = [v6 customInfoType];

    if (!v19) {
      goto LABEL_5;
    }
  }

  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController inputManagerState](self, "inputManagerState"));
  unsigned __int8 v10 = [v9 shouldSuppressAutocorrectionWithTerminator:v7];

  if ((v10 & 1) != 0)
  {
LABEL_5:
    char v11 = 0;
    goto LABEL_15;
  }

  if ([v7 length] && (uint64_t v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "input"))) != 0)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = objc_claimAutoreleasedReturnValue([v6 candidate]);
    if (v14)
    {
      uint64_t v15 = (void *)v14;
      unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([v6 input]);
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 stringByAppendingString:v7]);
      unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue([v6 candidate]);
      char v11 = [v18 rangeOfString:v17 options:9] == (id)0x7FFFFFFFFFFFFFFFLL;
    }

    else
    {
      char v11 = 1;
    }
  }

  else
  {
    char v11 = 1;
  }

- (void)addInput:(id)a3 fromVariantKey:(BOOL)a4 fromGestureKey:(BOOL)a5 touchEvent:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v41 = a3;
  id v10 = a6;
  char v11 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController inputManagerState](self, "inputManagerState"));
  unsigned int v12 = [v11 stringEndsWord:v41];

  if (!v12) {
    goto LABEL_11;
  }
  if (-[ACTKeyboardController usesAutocorrection](self, "usesAutocorrection")
    && (uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController inputManagerState](self, "inputManagerState")),
        unsigned __int8 v15 = [v14 usesCandidateSelection],
        v14,
        (v15 & 1) == 0))
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController inlineCompletion](self, "inlineCompletion"));
    id v13 = v41;
    if (!v19)
    {
      uint64_t v20 = objc_claimAutoreleasedReturnValue(-[ACTKeyboardController autocorrection](self, "autocorrection"));
      id v13 = v41;
      id v19 = (void *)v20;
      if (!v20) {
        goto LABEL_12;
      }
    }
  }

  else
  {
    unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController inputManagerState](self, "inputManagerState"));
    unsigned int v17 = [v16 usesCandidateSelection];

    if (!v17)
    {
LABEL_11:
      id v19 = 0LL;
      goto LABEL_12;
    }

    unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController candidateResultSet](self, "candidateResultSet"));
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 defaultCandidate]);

    id v13 = v41;
    if (!v19) {
      goto LABEL_12;
    }
  }

  if (!-[ACTKeyboardController shouldAcceptCandidate:beforeInputString:]( self,  "shouldAcceptCandidate:beforeInputString:",  v19,  v13))
  {

    goto LABEL_11;
  }

- (void)deleteInput
{
}

- (void)deleteInput:(id)a3
{
  id v4 = a3;
  -[ACTKeyboardController setAutocorrectionList:](self, "setAutocorrectionList:", 0LL);
  id v5 = objc_alloc_init(&OBJC_CLASS___TIKeyboardInput);
  [v5 setBackspace:1];
  -[ACTKeyboardController handleKeyboardInput:](self, "handleKeyboardInput:", v5);
  [v5 setTouchEvent:v4];

  -[ACTKeyboardController updateAutoshift](self, "updateAutoshift");
}

- (NSString)text
{
  return &self->_text->super;
}

- (ACTKeyboardLayoutUtils)layoutUtils
{
  return self->_layoutUtils;
}

- (BOOL)insertsSpaceAfterPredictiveInput
{
  return self->_insertsSpaceAfterPredictiveInput;
}

- (void)setInsertsSpaceAfterPredictiveInput:(BOOL)a3
{
  self->_insertsSpaceAfterPredictiveInput = a3;
}

- (TIKeyboardInputManagerFactory)keyboardInputManagerFactory
{
  return self->_keyboardInputManagerFactory;
}

- (void)setKeyboardInputManagerFactory:(id)a3
{
  self->_keyboardInputManagerFactordouble y = (TIKeyboardInputManagerFactory *)a3;
}

- (NSString)inputModeIdentifier
{
  return self->_inputModeIdentifier;
}

- (void)setInputModeIdentifier:(id)a3
{
}

- (TIInputMode)inputMode
{
  return self->_inputMode;
}

- (unint64_t)supplementalLexiconIdentifier
{
  return self->_supplementalLexiconIdentifier;
}

- (void)setSupplementalLexiconIdentifier:(unint64_t)a3
{
  self->_supplementalLexiconIdentifier = a3;
}

- (BOOL)canSuggestSupplementalItemsForCurrentSelection
{
  return self->_canSuggestSupplementalItemsForCurrentSelection;
}

- (void)setCanSuggestSupplementalItemsForCurrentSelection:(BOOL)a3
{
  self->_canSuggestSupplementalItemsForCurrentSelection = a3;
}

- (BOOL)asyncPredictions
{
  return self->_asyncPredictions;
}

- (void)setAsyncPredictions:(BOOL)a3
{
  self->_asyncPredictions = a3;
}

- (UIKBTree)keyboard
{
  return self->_keyboard;
}

- (UIKBTree)keyplane
{
  return self->_keyplane;
}

- (NSMutableSet)leftKeys
{
  return self->_leftKeys;
}

- (void)setLeftKeys:(id)a3
{
}

- (NSMutableSet)rightKeys
{
  return self->_rightKeys;
}

- (void)setRightKeys:(id)a3
{
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
}

- (NSString)recipientIdentifier
{
  return self->_recipientIdentifier;
}

- (void)setRecipientIdentifier:(id)a3
{
}

- (TIInputContextHistory)inputContextHistory
{
  return self->_inputContextHistory;
}

- (void)setInputContextHistory:(id)a3
{
}

- (TIKeyboardInputManagerState)inputManagerState
{
  return self->_inputManagerState;
}

- (void)setInputManagerState:(id)a3
{
}

- (BOOL)lastInputWasSelection
{
  return self->_lastInputWasSelection;
}

- (void)setLastInputWasSelection:(BOOL)a3
{
  self->_lastInputWasSelection = a3;
}

- (BOOL)lastInputWasContinuousPath
{
  return self->_lastInputWasContinuousPath;
}

- (void)setLastInputWasContinuousPath:(BOOL)a3
{
  self->_lastInputWasContinuousPath = a3;
}

- (BOOL)inputIsPunctuationFollowingContinuousPath
{
  return self->_inputIsPunctuationFollowingContinuousPath;
}

- (void)setInputIsPunctuationFollowingContinuousPath:(BOOL)a3
{
  self->_inputIsPunctuationFollowingContinuousPath = a3;
}

- (BOOL)nextKeyIsMultitap
{
  return self->_nextKeyIsMultitap;
}

- (void)setNextKeyIsMultitap:(BOOL)a3
{
  self->_nextKeyIsMultitap = a3;
}

- (BOOL)nextKeyIsFlick
{
  return self->_nextKeyIsFlick;
}

- (void)setNextKeyIsFlick:(BOOL)a3
{
  self->_nextKeyIsFlick = a3;
}

- (TIKeyboardState)keyboardState
{
  return self->_keyboardState;
}

- (void)setKeyboardState:(id)a3
{
}

- (BOOL)usesAutocorrection
{
  return self->_usesAutocorrection;
}

- (void)setUsesAutocorrection:(BOOL)a3
{
  self->_usesAutocorrection = a3;
}

- (unint64_t)autocorrectionType
{
  return self->_autocorrectionType;
}

- (void)setAutocorrectionType:(unint64_t)a3
{
  self->_autocorrectionType = a3;
}

- (unint64_t)autocapitalizationType
{
  return self->_autocapitalizationType;
}

- (void)setAutocapitalizationType:(unint64_t)a3
{
  self->_autocapitalizationType = a3;
}

- (BOOL)usesPrediction
{
  return self->_usesPrediction;
}

- (void)setUsesPrediction:(BOOL)a3
{
  self->_usesPrediction = a3;
}

- (BOOL)usesAutocapitalization
{
  return self->_usesAutocapitalization;
}

- (void)setUsesAutocapitalization:(BOOL)a3
{
  self->_usesAutocapitalization = a3;
}

- (BOOL)wordLearningEnabled
{
  return self->_wordLearningEnabled;
}

- (void)setWordLearningEnabled:(BOOL)a3
{
  self->_wordLearningEnabled = a3;
}

- (BOOL)inlineCompletionEnabled
{
  return self->_inlineCompletionEnabled;
}

- (void)setInlineCompletionEnabled:(BOOL)a3
{
  self->_inlineCompletionEnabled = a3;
}

- (BOOL)longPredictionListEnabled
{
  return self->_longPredictionListEnabled;
}

- (void)setLongPredictionListEnabled:(BOOL)a3
{
  self->_longPredictionListEnabled = a3;
}

- (TISmartPunctuationController)smartPunctuationController
{
  return self->_smartPunctuationController;
}

- (BOOL)usesTransliteration
{
  return self->_usesTransliteration;
}

- (void)setUsesTransliteration:(BOOL)a3
{
  self->_usesTransliteration = a3;
}

- (TTKSimpleKeyboardPlane)ttkLayout
{
  return self->_ttkLayout;
}

- (void)setTtkLayout:(id)a3
{
}

- (_NSRange)selectedRange
{
  NSUInteger length = self->_selectedRange.length;
  NSUInteger location = self->_selectedRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (NSString)markedText
{
  return self->_markedText;
}

- (void)setMarkedText:(id)a3
{
}

- (NSString)lastCommittedText
{
  return self->_lastCommittedText;
}

- (BOOL)secureTextEntry
{
  return self->_secureTextEntry;
}

- (void)setSecureTextEntry:(BOOL)a3
{
  self->_secureTextEntrdouble y = a3;
}

- (BOOL)isScreenLocked
{
  return self->_isScreenLocked;
}

- (void)setIsScreenLocked:(BOOL)a3
{
  self->_isScreenLocked = a3;
}

- (TIKeyboardCandidateResultSet)candidateResultSet
{
  return self->_candidateResultSet;
}

- (void)setCandidateResultSet:(id)a3
{
}

- (BOOL)justAcceptedAutocorrection
{
  return self->_justAcceptedAutocorrection;
}

- (void)setJustAcceptedAutocorrection:(BOOL)a3
{
  self->_justAcceptedAutocorrection = a3;
}

- (NSArray)keys
{
  return self->_keys;
}

- (void)setKeys:(id)a3
{
}

- (void)setInputManagerWrapper:(id)a3
{
}

- (TIKeyboardIntermediateText)intermediateText
{
  return self->_intermediateText;
}

- (NSMutableDictionary)activeTouchState
{
  return self->_activeTouchState;
}

- (void)setActiveTouchState:(id)a3
{
}

- (NSCondition)requestCondition
{
  return self->_requestCondition;
}

- (TICandidateRequestToken)currentRequestToken
{
  return self->_currentRequestToken;
}

- (void)setCurrentRequestToken:(id)a3
{
}

- (NSLock)cpRequestTokenLock
{
  return self->_cpRequestTokenLock;
}

- (void)setCpRequestTokenLock:(id)a3
{
}

- (TICandidateRequestToken)lastCPRequestToken
{
  return self->_lastCPRequestToken;
}

- (void)setLastCPRequestToken:(id)a3
{
}

- (NSUUID)documentIdentifier
{
  return self->_documentIdentifier;
}

- (void)setDocumentIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end