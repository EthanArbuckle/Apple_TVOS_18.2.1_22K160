@interface _ACTUserActionStream
+ (BOOL)isPathableWord:(id)a3;
+ (_NSRange)segmentAnchorRangeForCursor:(id)a3 withDocumentBefore:(id)a4;
+ (id)userActionStreamWithParameters:(id)a3 delegate:(id)a4;
- (ACTUserActionStreamDelegate)delegate;
- (ACTUserMentalCursor)cursor;
- (BOOL)advancePositionByAcceptingCandidate:(id)a3;
- (BOOL)advanceSegmentCursor;
- (BOOL)canBeginBackspacing;
- (BOOL)canContinueBackspacing;
- (BOOL)currentAndNextKeysAreTransposable;
- (BOOL)hasDesiredAutocorrection;
- (BOOL)inPartialCandidateSelection;
- (BOOL)isBackspacing;
- (BOOL)isFinished;
- (BOOL)isRetyping;
- (BOOL)lastActionSuppressesError;
- (BOOL)lastActionUseSecondaryString;
- (BOOL)lastAndCurrentKeysAreSame;
- (BOOL)preferBaseKeyForVariants;
- (BOOL)preferInlineSelection;
- (BOOL)preferManualCorrection;
- (BOOL)preferManualShift;
- (BOOL)preferPredictionSelection;
- (BOOL)rewindSegmentCursor;
- (BOOL)shouldBeginCorrectingAfterWord;
- (BOOL)shouldBeginCorrectingAfterWordTerminator;
- (BOOL)shouldIgnoreCurrentCharacter;
- (BOOL)shouldRejectBadAutocorrection;
- (BOOL)shouldTypeInternalString;
- (NSString)intendedText;
- (NSString)partialCandidateIntendedChunk;
- (NSString)partialCandidateSuffix;
- (TIErrorGenerator)errorGenerator;
- (TIKeyboardTyperUserModel)userModel;
- (TTKDefaultContinuousPathGenerator)pathGenerator;
- (UserPathManager)userPathManager;
- (_ACTUserActionStream)initWithParameters:(id)a3 delegate:(id)a4;
- (_NSRange)documentEditRangeWithSegmentRangePtr:(_NSRange *)a3;
- (double)averageActionInterval;
- (double)lastTimestamp;
- (double)randomActionInterval;
- (float)probabilityOfDoubledKey;
- (float)probabilityOfExtraneousKey;
- (float)probabilityOfSkippedKey;
- (float)probabilityOfSubstituteKey;
- (float)probabilityOfTransposition;
- (id)anyKeyForString:(id)a3 keyplane:(id)a4 wantSecondaryString:(BOOL)a5 substituteUpperCaseForLowerCase:(BOOL)a6;
- (id)candidateToSelectFromCandidates:(id)a3;
- (id)externalStringToInternal:(id)a3;
- (id)findPartialCandidate;
- (id)matchTransliterationCandidateToSegment:(id)a3 withCursorAt:(int)a4;
- (id)nextUserAction;
- (id)transliterationCandidate:(id)a3;
- (id)tryAcceptCandidate;
- (id)tryAcceptingCandidate:(id)a3;
- (id)tryBackspacing;
- (id)tryChangeKeyplane;
- (id)tryContinuousPath;
- (id)tryDoubleKeyTap;
- (id)tryExtraKeyTap;
- (id)tryKeyTap;
- (id)tryPeriodShortcut;
- (id)tryRejectCandidate;
- (id)trySelectPopupVariant;
- (id)trySkipKeyTap;
- (id)trySubstituteKeyTap;
- (id)tryTransposedKeyTaps;
- (id)tryTypingWillSuppressError:(BOOL *)a3;
- (int64_t)lastCursorPositionForTransliteratedCandidate;
- (unint64_t)segmentCursorBeforeBackspacing;
- (unint64_t)segmentEditHorizon;
- (unsigned)randomNumberSeed;
- (void)advancePositionByString:(id)a3;
- (void)configureWithParameters:(id)a3;
- (void)resetForIntendedSegments:(id)a3 expectedSegments:(id)a4;
- (void)resetForIntendedText:(id)a3;
- (void)rewindPositionByString:(id)a3;
- (void)setCursor:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setErrorGenerator:(id)a3;
- (void)setIntendedText:(id)a3;
- (void)setIsBackspacing:(BOOL)a3;
- (void)setLastActionSuppressesError:(BOOL)a3;
- (void)setLastActionUseSecondaryString:(BOOL)a3;
- (void)setLastCursorPositionForTransliteratedCandidate:(int64_t)a3;
- (void)setLastTimestamp:(double)a3;
- (void)setPartialCandidateIntendedChunk:(id)a3;
- (void)setPartialCandidateSuffix:(id)a3;
- (void)setPathGenerator:(id)a3;
- (void)setRandomNumberSeed:(unsigned int)a3;
- (void)setSegmentCursorBeforeBackspacing:(unint64_t)a3;
- (void)setSegmentEditHorizon:(unint64_t)a3;
- (void)setUserModel:(id)a3;
- (void)setUserPathManager:(id)a3;
@end

@implementation _ACTUserActionStream

+ (id)userActionStreamWithParameters:(id)a3 delegate:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = -[_ACTUserActionStream initWithParameters:delegate:]( objc_alloc(&OBJC_CLASS____ACTUserActionStream),  "initWithParameters:delegate:",  v6,  v5);

  return v7;
}

- (_ACTUserActionStream)initWithParameters:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  v7 = (ACTUserActionStreamDelegate *)a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS____ACTUserActionStream;
  v8 = -[_ACTUserActionStream init](&v14, "init");
  if (v8)
  {
    v9 = objc_alloc_init(&OBJC_CLASS___ACTUserMentalCursor);
    cursor = v8->_cursor;
    v8->_cursor = v9;

    v8->_lastCursorPositionForTransliteratedCandidate = -1LL;
    partialCandidateSuffix = v8->_partialCandidateSuffix;
    v8->_partialCandidateSuffix = 0LL;

    partialCandidateIntendedChunk = v8->_partialCandidateIntendedChunk;
    v8->_partialCandidateIntendedChunk = 0LL;

    v8->_delegate = v7;
  }

  -[_ACTUserActionStream configureWithParameters:](v8, "configureWithParameters:", v6);

  return v8;
}

- (void)configureWithParameters:(id)a3
{
  id v11 = a3;
  v4 = -[TIKeyboardTyperUserModel initWithModel:]( objc_alloc(&OBJC_CLASS___TIKeyboardTyperUserModel),  "initWithModel:",  v11);
  -[_ACTUserActionStream setUserModel:](self, "setUserModel:", v4);

  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[TIErrorGenerator errorGeneratorWithAttributes:]( &OBJC_CLASS___TIErrorGenerator,  "errorGeneratorWithAttributes:",  v11));
  -[_ACTUserActionStream setErrorGenerator:](self, "setErrorGenerator:", v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream userModel](self, "userModel"));
  unsigned int v7 = [v6 prefersContinuousPath];

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[TTKDefaultContinuousPathGenerator pathGeneratorWithAttributes:]( &OBJC_CLASS___TTKDefaultContinuousPathGenerator,  "pathGeneratorWithAttributes:",  v11));
    -[_ACTUserActionStream setPathGenerator:](self, "setPathGenerator:", v8);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"USER_PATH_FILE"]);
  if ([v9 length])
  {
    v10 = -[UserPathManager initWithPathFile:](objc_alloc(&OBJC_CLASS___UserPathManager), "initWithPathFile:", v9);
    -[_ACTUserActionStream setUserPathManager:](self, "setUserPathManager:", v10);
  }
}

- (BOOL)inPartialCandidateSelection
{
  return self->_partialCandidateSuffix != 0LL;
}

- (NSString)intendedText
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 intendedText]);

  return (NSString *)v3;
}

- (void)setIntendedText:(id)a3
{
}

- (void)setRandomNumberSeed:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  self->_randomNumberSeed = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream errorGenerator](self, "errorGenerator"));
  [v5 setRandomNumberSeed:v3];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream pathGenerator](self, "pathGenerator"));
  [v6 setRandomNumberSeed:v3];

  id v7 = (id)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream userPathManager](self, "userPathManager"));
  [v7 setRandomNumberSeed:v3];
}

- (id)externalStringToInternal:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (-[_ACTUserActionStream shouldTypeInternalString](self, "shouldTypeInternalString"))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream delegate](self, "delegate"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v6 externalStringToInternal:v4]);
  }

  if (-[_ACTUserActionStream preferBaseKeyForVariants](self, "preferBaseKeyForVariants"))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream delegate](self, "delegate"));
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 splitDigraphsInString:v5]);

    id v5 = (void *)v8;
  }

  return v5;
}

- (void)resetForIntendedText:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream userModel](self, "userModel"));
  unsigned __int8 v6 = [v5 prefersContinuousPath];
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream delegate](self, "delegate"));
  uint64_t v8 = v7;
  if ((v6 & 1) != 0) {
    uint64_t v9 = objc_claimAutoreleasedReturnValue([v7 inputSegmentsForContinuousPathString:v4]);
  }
  else {
    uint64_t v9 = objc_claimAutoreleasedReturnValue([v7 inputSegmentsForString:v4]);
  }
  v10 = (void *)v9;

  id v11 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v10 count]);
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v12 = v10;
  id v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      for (i = 0LL; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = (void *)objc_claimAutoreleasedReturnValue( -[_ACTUserActionStream externalStringToInternal:]( self,  "externalStringToInternal:",  *(void *)(*((void *)&v19 + 1) + 8LL * (void)i),  (void)v19));
        -[NSMutableArray addObject:](v11, "addObject:", v17);
      }

      id v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v14);
  }

  id v18 = -[NSMutableArray copy](v11, "copy");
  -[_ACTUserActionStream resetForIntendedSegments:expectedSegments:]( self,  "resetForIntendedSegments:expectedSegments:",  v18,  v12);
}

- (void)resetForIntendedSegments:(id)a3 expectedSegments:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[_ACTUserActionStream setLastTimestamp:](self, "setLastTimestamp:", 0.0);
  -[_ACTUserActionStream setLastActionSuppressesError:](self, "setLastActionSuppressesError:", 0LL);
  -[_ACTUserActionStream setSegmentEditHorizon:](self, "setSegmentEditHorizon:", 0LL);
  -[_ACTUserActionStream setLastCursorPositionForTransliteratedCandidate:]( self,  "setLastCursorPositionForTransliteratedCandidate:",  -1LL);
  uint64_t v8 = -[ACTUserMentalCursor initWithInternalSegments:externalSegments:]( objc_alloc(&OBJC_CLASS___ACTUserMentalCursor),  "initWithInternalSegments:externalSegments:",  v7,  v6);

  -[_ACTUserActionStream setCursor:](self, "setCursor:", v8);
}

- (BOOL)advanceSegmentCursor
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
  unsigned __int8 v4 = [v3 advanceSegmentCursor];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
  id v6 = [v5 segmentCursor];
  unint64_t v7 = -[_ACTUserActionStream segmentCursorBeforeBackspacing](self, "segmentCursorBeforeBackspacing");

  if ((unint64_t)v6 >= v7) {
    -[_ACTUserActionStream setSegmentCursorBeforeBackspacing:]( self,  "setSegmentCursorBeforeBackspacing:",  0x7FFFFFFFFFFFFFFFLL);
  }
  return v4;
}

- (BOOL)rewindSegmentCursor
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
  unsigned __int8 v3 = [v2 rewindSegmentCursor];

  return v3;
}

- (void)advancePositionByString:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
  [v5 advancePositionByString:v4];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
  id v7 = [v6 segmentCursor];
  unint64_t v8 = -[_ACTUserActionStream segmentCursorBeforeBackspacing](self, "segmentCursorBeforeBackspacing");

  if ((unint64_t)v7 >= v8) {
    -[_ACTUserActionStream setSegmentCursorBeforeBackspacing:]( self,  "setSegmentCursorBeforeBackspacing:",  0x7FFFFFFFFFFFFFFFLL);
  }
}

- (void)rewindPositionByString:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
  [v5 rewindPositionByString:v4];
}

- (BOOL)advancePositionByAcceptingCandidate:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream userModel](self, "userModel"));
  unsigned int v6 = [v5 prefersTransliteration];

  if (v6)
  {
    if (!self->_partialCandidateSuffix) {
      -[_ACTUserActionStream advanceSegmentCursor](self, "advanceSegmentCursor");
    }
    goto LABEL_13;
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
  unint64_t v8 = (char *)[v7 rangeOfInputSegmentsForCandidate:v4];
  uint64_t v10 = v9;

  if (v8 != (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    id v11 = &v8[v10];
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
    if (v11 >= [v12 segmentCursor])
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
      if (v11 == [v13 segmentCursor])
      {
        id v14 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
        id v15 = [v14 positionInCurrentInternalSegment];

        if (v15) {
          goto LABEL_9;
        }
      }

      else
      {
      }

      while (1)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
        id v18 = (char *)[v17 segmentCursor];

        if (v18 >= v11) {
          break;
        }
        -[_ACTUserActionStream advanceSegmentCursor](self, "advanceSegmentCursor");
      }

- (BOOL)hasDesiredAutocorrection
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream delegate](self, "delegate"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 autocorrection]);

  if ([v4 isAutocorrection])
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
    id v6 = [v5 rangeOfInputSegmentsForCandidate:v4];

    BOOL v7 = v6 != (id)0x7FFFFFFFFFFFFFFFLL;
  }

  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)currentAndNextKeysAreTransposable
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 currentLongCharacter]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream delegate](self, "delegate"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 keyboardController]);
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v6 layoutUtils]);
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream delegate](self, "delegate"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 keyplane]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 exactKeyForString:v4 keyplane:v9 includeSecondaryStrings:0]);

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 nextLongCharacter]);

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream delegate](self, "delegate"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 keyboardController]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 layoutUtils]);
  BOOL v16 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream delegate](self, "delegate"));
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 keyplane]);
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v15 exactKeyForString:v12 keyplane:v17 includeSecondaryStrings:0]);

  if (v10) {
    BOOL v19 = v18 == 0LL;
  }
  else {
    BOOL v19 = 1;
  }
  BOOL v21 = !v19 && v10 != v18;

  return v21;
}

- (BOOL)lastAndCurrentKeysAreSame
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 previousLongCharacter]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream delegate](self, "delegate"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 keyboardController]);
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v6 layoutUtils]);
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream delegate](self, "delegate"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 keyplane]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 exactKeyForString:v4 keyplane:v9 includeSecondaryStrings:0]);

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 currentLongCharacter]);

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream delegate](self, "delegate"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 keyboardController]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 layoutUtils]);
  BOOL v16 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream delegate](self, "delegate"));
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 keyplane]);
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v15 exactKeyForString:v12 keyplane:v17 includeSecondaryStrings:0]);

  if (v10) {
    BOOL v19 = v18 == 0LL;
  }
  else {
    BOOL v19 = 1;
  }
  BOOL v21 = !v19 && v10 == v18;

  return v21;
}

- (BOOL)shouldTypeInternalString
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream userModel](self, "userModel"));
  unsigned __int8 v3 = [v2 decomposeInputString];

  return v3;
}

- (double)averageActionInterval
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream userModel](self, "userModel"));
  [v2 averageKeyTapsPerSecond];
  float v4 = v3;

  return (float)(1.0 / v4);
}

- (BOOL)preferManualShift
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream userModel](self, "userModel"));
  char v3 = [v2 prefersAutocorrectForCaps] ^ 1;

  return v3;
}

- (BOOL)preferBaseKeyForVariants
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream userModel](self, "userModel"));
  unsigned __int8 v3 = [v2 baseKeyForVariants];

  return v3;
}

- (BOOL)preferPredictionSelection
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream userModel](self, "userModel"));
  unsigned __int8 v3 = [v2 prefersPredictionSelection];

  return v3;
}

- (BOOL)preferInlineSelection
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream userModel](self, "userModel"));
  unsigned __int8 v3 = [v2 prefersInlineSelection];

  return v3;
}

- (BOOL)preferManualCorrection
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream userModel](self, "userModel"));
  unsigned __int8 v3 = [v2 prefersToCorrectErrors];

  return v3;
}

- (BOOL)shouldIgnoreCurrentCharacter
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
  float v4 = (void *)objc_claimAutoreleasedReturnValue([v3 currentLongCharacter]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
  if ([v5 positionInCurrentInternalSegment])
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
    BOOL v7 = (char *)[v6 positionInCurrentInternalSegment];
    unint64_t v8 = &v7[(void)[v4 length]];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 currentInternalSegment]);
    BOOL v11 = v8 >= [v10 length];
  }

  else
  {
    BOOL v11 = 1;
  }

  else {
    unsigned int v12 = [v4 isEqualToString:@"’"] ^ 1;
  }
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream userModel](self, "userModel"));
  unsigned int v14 = [v13 prefersAutocorrectForApostrophes];

  unsigned int v15 = v14 & !-[_ACTUserActionStream isRetyping](self, "isRetyping");
  else {
    BOOL v16 = v15;
  }

  return v16;
}

- (id)anyKeyForString:(id)a3 keyplane:(id)a4 wantSecondaryString:(BOOL)a5 substituteUpperCaseForLowerCase:(BOOL)a6
{
  BOOL v7 = a5;
  id v10 = a4;
  id v11 = a3;
  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream delegate](self, "delegate"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 keyboardController]);
  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v13 layoutUtils]);
  LOBYTE(v17) = a6;
  unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v14,  "anyKeyForString:keyplane:wantSecondaryString:isRetyping:preferBaseKeyVariants:preferManualShift:subs tituteUpperCaseForLowerCase:",  v11,  v10,  v7,  -[_ACTUserActionStream isRetyping](self, "isRetyping"),  -[_ACTUserActionStream preferBaseKeyForVariants](self, "preferBaseKeyForVariants"),  -[_ACTUserActionStream preferManualShift](self, "preferManualShift"),  v17));

  return v15;
}

- (double)randomActionInterval
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream errorGenerator](self, "errorGenerator"));
  [v3 uniformRandomNumber];
  float v5 = v4;

  -[_ACTUserActionStream averageActionInterval](self, "averageActionInterval");
  *(float *)&double v6 = v6;
  *(float *)&double v6 = (v5 + 0.5) * *(float *)&v6;
  return *(float *)&v6;
}

- (float)probabilityOfTransposition
{
  float v3 = 0.0;
  if (-[_ACTUserActionStream currentAndNextKeysAreTransposable](self, "currentAndNextKeysAreTransposable"))
  {
    double v4 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
    float v5 = (void *)objc_claimAutoreleasedReturnValue([v4 currentLongCharacter]);

    double v6 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v6 nextLongCharacter]);

    if (sub_15168(v5) && sub_15168(v7))
    {
      unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream userModel](self, "userModel"));
      [v8 probTransposeLetters];
    }

    else
    {
      unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream userModel](self, "userModel"));
      [v8 probTransposeLetterAndSpace];
    }

    float v3 = v9;

LABEL_11:
  }

  return v3;
}

- (float)probabilityOfSkippedKey
{
  float v3 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
  double v4 = (void *)objc_claimAutoreleasedReturnValue([v3 currentLongCharacter]);

  if (sub_15168(v4))
  {
    if (-[_ACTUserActionStream lastAndCurrentKeysAreSame](self, "lastAndCurrentKeysAreSame"))
    {
      float v5 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream userModel](self, "userModel"));
      [v5 probSkipRepeatLetter];
    }

    else
    {
      unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
      id v9 = [v8 positionInCurrentInternalSegment];

      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream userModel](self, "userModel"));
      float v5 = v10;
      if (v9) {
        [v10 probSkipLetter];
      }
      else {
        [v10 probSkipInitialLetter];
      }
    }

    goto LABEL_9;
  }

  float v7 = 0.0;
  if (sub_151F8(v4))
  {
    float v5 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream userModel](self, "userModel"));
    [v5 probSkipSpace];
LABEL_9:
    float v7 = v6;
  }

  return v7;
}

- (float)probabilityOfDoubledKey
{
  float v3 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
  double v4 = (void *)objc_claimAutoreleasedReturnValue([v3 currentLongCharacter]);
  if (!sub_15168(v4))
  {

    float v6 = 0.0;
LABEL_8:

    return v6;
  }

  unsigned __int8 v5 = -[_ACTUserActionStream lastAndCurrentKeysAreSame](self, "lastAndCurrentKeysAreSame");

  float v6 = 0.0;
  if ((v5 & 1) == 0)
  {
    float v7 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
    id v8 = [v7 positionInCurrentInternalSegment];

    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream userModel](self, "userModel"));
    float v3 = v9;
    if (v8) {
      [v9 probDoubleTapLetter];
    }
    else {
      [v9 probDoubleTapInitialLetter];
    }
    float v6 = v10;
    goto LABEL_8;
  }

  return v6;
}

- (float)probabilityOfSubstituteKey
{
  float v3 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
  double v4 = (void *)objc_claimAutoreleasedReturnValue([v3 currentLongCharacter]);

  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream delegate](self, "delegate"));
  float v6 = (void *)objc_claimAutoreleasedReturnValue([v5 keyplane]);
  float v7 = (void *)objc_claimAutoreleasedReturnValue( -[_ACTUserActionStream anyKeyForString:keyplane:wantSecondaryString:substituteUpperCaseForLowerCase:]( self,  "anyKeyForString:keyplane:wantSecondaryString:substituteUpperCaseForLowerCase:",  v4,  v6,  0LL,  0LL));

  float v8 = 0.0;
  if (v7)
  {
    if (sub_15168(v4))
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
      id v10 = [v9 positionInCurrentInternalSegment];

      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream userModel](self, "userModel"));
      unsigned int v12 = v11;
      if (v10) {
        [v11 probSubstituteLetter];
      }
      else {
        [v11 probSubstituteInitialLetter];
      }
      goto LABEL_8;
    }

    if (sub_151F8(v4))
    {
      unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream userModel](self, "userModel"));
      [v12 probSubstituteSpace];
LABEL_8:
      float v8 = v13;
    }
  }

  return v8;
}

- (float)probabilityOfExtraneousKey
{
  float v3 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
  double v4 = (void *)objc_claimAutoreleasedReturnValue([v3 currentLongCharacter]);

  unsigned int v5 = sub_15168(v4);
  float v6 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
  id v7 = [v6 positionInCurrentInternalSegment];

  float v8 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 previousLongCharacter]);

  unsigned int v10 = sub_15168(v9);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
  id v12 = [v11 positionInCurrentInternalSegment];

  if (v5)
  {
    float v13 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream userModel](self, "userModel"));
    unsigned int v14 = v13;
    if (v7) {
      [v13 probExtraneousKey];
    }
    else {
      [v13 probExtraneousInitialKey];
    }
    goto LABEL_10;
  }

  if (v12) {
    unsigned int v16 = 0;
  }
  else {
    unsigned int v16 = v10;
  }
  float v17 = 0.0;
  if (v16 == 1)
  {
    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream userModel](self, "userModel"));
    [v14 probExtraneousFinalKey];
LABEL_10:
    float v17 = v15;
  }

  return v17;
}

- (id)nextUserAction
{
  char v9 = 0;
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream tryAcceptCandidate](self, "tryAcceptCandidate"));
  if (v3
    || (uint64_t v3 = objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream tryRejectCandidate](self, "tryRejectCandidate"))) != 0)
  {
    double v4 = (void *)v3;
    -[_ACTUserActionStream setIsBackspacing:](self, "setIsBackspacing:", 0LL);
  }

  else
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream tryBackspacing](self, "tryBackspacing"));
    if (v7)
    {
      double v4 = (void *)v7;
      BOOL v5 = 1LL;
      -[_ACTUserActionStream setIsBackspacing:](self, "setIsBackspacing:", 1LL);
      char v9 = 1;
      goto LABEL_5;
    }

    -[_ACTUserActionStream setIsBackspacing:](self, "setIsBackspacing:", 0LL);
    uint64_t v8 = objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream tryPeriodShortcut](self, "tryPeriodShortcut"));
    if (!v8)
    {
      double v4 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream tryTypingWillSuppressError:](self, "tryTypingWillSuppressError:", &v9));
      BOOL v5 = v9 != 0;
      goto LABEL_5;
    }

    double v4 = (void *)v8;
  }

  BOOL v5 = 0LL;
LABEL_5:
  -[_ACTUserActionStream setLastActionSuppressesError:](self, "setLastActionSuppressesError:", v5);
  return v4;
}

- (BOOL)isFinished
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
  unsigned __int8 v3 = [v2 atEndOfText];

  return v3;
}

- (id)tryAcceptCandidate
{
  if (!-[_ACTUserActionStream preferPredictionSelection](self, "preferPredictionSelection")
    && !-[_ACTUserActionStream preferInlineSelection](self, "preferInlineSelection"))
  {
    v25 = 0LL;
    return v25;
  }

  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream delegate](self, "delegate"));
  double v4 = (void *)objc_claimAutoreleasedReturnValue([v3 predictionBarCandidates]);

  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream delegate](self, "delegate"));
  float v6 = (void *)objc_claimAutoreleasedReturnValue([v5 inlineCompletionCandidates]);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream userModel](self, "userModel"));
  unsigned int v8 = [v7 prefersTransliteration];

  if (v8)
  {
    if (self->_partialCandidateSuffix) {
      uint64_t v9 = objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream findPartialCandidate](self, "findPartialCandidate"));
    }
    else {
      uint64_t v9 = objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream transliterationCandidate:](self, "transliterationCandidate:", v4));
    }
    goto LABEL_20;
  }

  if (![v6 count])
  {
LABEL_16:
    if (-[_ACTUserActionStream preferInlineSelection](self, "preferInlineSelection"))
    {
      v26 = 0LL;
      goto LABEL_26;
    }

    uint64_t v9 = objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream candidateToSelectFromCandidates:](self, "candidateToSelectFromCandidates:", v4));
LABEL_20:
    v26 = (void *)v9;
    if (v9) {
      goto LABEL_21;
    }
    goto LABEL_26;
  }

  v31 = v4;
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v6 firstObject]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream delegate](self, "delegate"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 candidate]);
  float v13 = (void *)objc_claimAutoreleasedReturnValue([v11 inputSegmentsForString:v12]);

  unsigned int v14 = (char *)[v13 count];
  if (!v14)
  {
LABEL_15:

    double v4 = v31;
    goto LABEL_16;
  }

  for (i = v14 - 1; ; --i)
  {
    unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([v13 objectAtIndexedSubscript:i]);
    BOOL v17 = sub_151F8(v16);

    if (v17) {
      goto LABEL_12;
    }
    id v18 = [v10 copy];
    BOOL v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "subarrayWithRange:", 0, i + 1));
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v19 componentsJoinedByString:&stru_89E80]);
    BOOL v21 = (void *)objc_claimAutoreleasedReturnValue([v18 candidateByReplacingWithCandidate:v20]);

    __int128 v22 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    -[NSMutableArray addObject:](v22, "addObject:", v21);
    uint64_t v23 = objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream candidateToSelectFromCandidates:](self, "candidateToSelectFromCandidates:", v22));
    if (v23) {
      break;
    }
    unsigned __int8 v24 = -[_ACTUserActionStream preferInlineSelection](self, "preferInlineSelection");

    if ((v24 & 1) != 0) {
      goto LABEL_15;
    }
LABEL_12:
    if (!i) {
      goto LABEL_15;
    }
  }

  v26 = (void *)v23;

  double v4 = v31;
LABEL_21:
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream userModel](self, "userModel"));
  if ([v27 prefersTransliteration])
  {

    goto LABEL_25;
  }

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream userModel](self, "userModel"));
  unsigned int v29 = [v28 prefersContinuousPath];

  if (v29)
  {
LABEL_25:
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream tryAcceptingCandidate:](self, "tryAcceptingCandidate:", v26));
    goto LABEL_27;
  }

- (id)matchTransliterationCandidateToSegment:(id)a3 withCursorAt:(int)a4
{
  id v6 = a3;
  if (a4 < 0
    || (uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor")),
        unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 externalSegments]),
        id v9 = [v8 count],
        v8,
        v7,
        (unint64_t)v9 <= a4))
  {
    id v16 = 0LL;
  }

  else
  {
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 externalSegments]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndexedSubscript:a4]);

    float v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet whitespaceAndNewlineCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "whitespaceAndNewlineCharacterSet"));
    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v12 stringByTrimmingCharactersInSet:v13]);

    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    id v15 = v6;
    id v16 = [v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v16)
    {
      unsigned __int8 v24 = v12;
      id v25 = v6;
      uint64_t v17 = *(void *)v27;
      while (2)
      {
        for (i = 0LL; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v27 != v17) {
            objc_enumerationMutation(v15);
          }
          BOOL v19 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
          __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "candidate", v24, v25, (void)v26));
          BOOL v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet whitespaceAndNewlineCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "whitespaceAndNewlineCharacterSet"));
          __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v20 stringByTrimmingCharactersInSet:v21]);

          if ([v22 isEqualToString:v14])
          {
            id v16 = v19;

            goto LABEL_14;
          }
        }

        id v16 = [v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v16) {
          continue;
        }
        break;
      }

- (id)findPartialCandidate
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream delegate](self, "delegate"));
  double v4 = (void *)objc_claimAutoreleasedReturnValue([v3 predictionBarCandidates]);

  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (!v6)
  {

LABEL_15:
    objc_storeStrong((id *)&self->_partialCandidateIntendedChunk, self->_partialCandidateSuffix);
    partialCandidateSuffix = self->_partialCandidateSuffix;
    self->_partialCandidateSuffix = 0LL;

    partialCandidateIntendedChunk = (NSString *)objc_claimAutoreleasedReturnValue([v5 firstObject]);
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSString input](partialCandidateIntendedChunk, "input"));
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue( +[TIKeyboardCandidateSingle candidateWithCandidate:forInput:]( &OBJC_CLASS___TIKeyboardCandidateSingle,  "candidateWithCandidate:forInput:",  @"NO_PARTIAL_CANDIDATE",  v20));

    goto LABEL_18;
  }

  id v7 = v6;
  unsigned int v8 = 0LL;
  id v9 = 0LL;
  uint64_t v10 = *(void *)v24;
  do
  {
    for (i = 0LL; i != v7; i = (char *)i + 1)
    {
      if (*(void *)v24 != v10) {
        objc_enumerationMutation(v5);
      }
      id v12 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
      float v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "candidate", (void)v23));
      if (-[NSString hasPrefix:](self->_partialCandidateSuffix, "hasPrefix:", v13) && [v13 length] > v9)
      {
        id v9 = [v13 length];
        id v14 = v12;

        unsigned int v8 = v14;
      }
    }

    id v7 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
  }

  while (v7);

  if (!v8) {
    goto LABEL_15;
  }
  NSUInteger v15 = -[NSString length](self->_partialCandidateSuffix, "length");
  id v16 = self->_partialCandidateSuffix;
  if (v9 == (id)v15)
  {
    uint64_t v17 = 0LL;
  }

  else
  {
    uint64_t v17 = (NSString *)objc_claimAutoreleasedReturnValue(-[NSString substringFromIndex:](v16, "substringFromIndex:", v9));
    id v16 = self->_partialCandidateSuffix;
  }

  self->_partialCandidateSuffix = v17;

  BOOL v21 = (NSString *)objc_claimAutoreleasedReturnValue([v8 candidate]);
  partialCandidateIntendedChunk = self->_partialCandidateIntendedChunk;
  self->_partialCandidateIntendedChunk = v21;
LABEL_18:

  return v8;
}

- (id)transliterationCandidate:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
  id v6 = (char *)[v5 segmentCursor];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
  if ([v7 positionInCurrentInternalSegment]) {
    goto LABEL_2;
  }
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
  if (![v12 segmentCursor])
  {

LABEL_2:
    goto LABEL_3;
  }

  float v13 = v6 - 1;
  int64_t v14 = -[_ACTUserActionStream lastCursorPositionForTransliteratedCandidate]( self,  "lastCursorPositionForTransliteratedCandidate");

  if (v14 < (uint64_t)v13)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( -[_ACTUserActionStream matchTransliterationCandidateToSegment:withCursorAt:]( self,  "matchTransliterationCandidateToSegment:withCursorAt:",  v4,  v13));
    if (v9)
    {
LABEL_34:
      -[_ACTUserActionStream setLastCursorPositionForTransliteratedCandidate:]( self,  "setLastCursorPositionForTransliteratedCandidate:",  v13);
      -[_ACTUserActionStream rewindSegmentCursor](self, "rewindSegmentCursor");
      goto LABEL_5;
    }

    NSUInteger v15 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 internalSegments]);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectAtIndex:v13]);
    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
    BOOL v19 = (void *)objc_claimAutoreleasedReturnValue([v18 externalSegments]);
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v19 objectAtIndex:v13]);
    id v21 = [v17 caseInsensitiveCompare:v20];

    if (-[TIKeyboardTyperUserModel usePartialCandidates](self->_userModel, "usePartialCandidates") && v21)
    {
      __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
      __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v22 externalSegments]);
      __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v23 objectAtIndexedSubscript:v13]);
      __int128 v25 = (NSString *)[v24 copy];
      partialCandidateSuffix = self->_partialCandidateSuffix;
      self->_partialCandidateSuffix = v25;

      uint64_t v27 = objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream findPartialCandidate](self, "findPartialCandidate"));
LABEL_33:
      id v9 = (void *)v27;
      goto LABEL_34;
    }

    if (v21)
    {
      __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream delegate](self, "delegate"));
      __int128 v29 = (void *)objc_claimAutoreleasedReturnValue([v28 keyboardController]);
      v30 = (void *)objc_claimAutoreleasedReturnValue([v29 inputMode]);
      v31 = (void *)objc_claimAutoreleasedReturnValue([v30 normalizedIdentifier]);
      if ([v31 hasSuffix:@"-Translit"]
        && (unint64_t)[v4 count] >= 2)
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndexedSubscript:0]);
        uint64_t v33 = objc_opt_class(&OBJC_CLASS___TIKeyboardCandidateSingle);
        if ((objc_opt_isKindOfClass(v32, v33) & 1) != 0)
        {
          v34 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndexedSubscript:1]);
          uint64_t v35 = objc_opt_class(&OBJC_CLASS___TIMecabraCandidate);
          char isKindOfClass = objc_opt_isKindOfClass(v34, v35);

          if ((isKindOfClass & 1) != 0)
          {
            uint64_t v27 = objc_claimAutoreleasedReturnValue([v4 objectAtIndexedSubscript:1]);
            goto LABEL_33;
          }

- (id)candidateToSelectFromCandidates:(id)a3
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_16A24;
  v9[3] = &unk_88E18;
  v9[4] = self;
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 indexesOfObjectsPassingTest:v9]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectsAtIndexes:v4]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 sortedArrayUsingComparator:&stru_88E58]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 firstObject]);

  return v7;
}

- (id)tryAcceptingCandidate:(id)a3
{
  id v4 = a3;
  -[_ACTUserActionStream lastTimestamp](self, "lastTimestamp");
  double v6 = v5;
  -[_ACTUserActionStream randomActionInterval](self, "randomActionInterval");
  double v8 = v6 + v7;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream userModel](self, "userModel"));
  unsigned int v10 = [v9 prefersTransliteration];

  if (!v10)
  {
    id v18 = -[ACTAcceptCandidate initWithCandidate:timestamp:]( objc_alloc(&OBJC_CLASS___ACTAcceptCandidate),  "initWithCandidate:timestamp:",  v4,  v8);
    if (!v18) {
      goto LABEL_10;
    }
    goto LABEL_7;
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 externalSegments]);
  float v13 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
  int64_t v14 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v13, "segmentCursor")));

  partialCandidateIntendedChunk = self->_partialCandidateIntendedChunk;
  if (partialCandidateIntendedChunk)
  {
    id v16 = partialCandidateIntendedChunk;

    uint64_t v17 = self->_partialCandidateIntendedChunk;
    self->_partialCandidateIntendedChunk = 0LL;

    int64_t v14 = v16;
  }

  id v18 = -[ACTAcceptCandidate initWithCandidate:timestamp:intendedCandidate:]( objc_alloc(&OBJC_CLASS___ACTAcceptCandidate),  "initWithCandidate:timestamp:intendedCandidate:",  v4,  v14,  v8);

  if (v18)
  {
LABEL_7:
    BOOL v19 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
    -[ACTUserAction setInputSegment:](v18, "setInputSegment:", [v19 segmentCursor]);

    if (-[_ACTUserActionStream advancePositionByAcceptingCandidate:](self, "advancePositionByAcceptingCandidate:", v4))
    {
      -[_ACTUserActionStream setLastTimestamp:](self, "setLastTimestamp:", v8);
    }

    else
    {

      id v18 = 0LL;
    }
  }

- (id)tryRejectCandidate
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream delegate](self, "delegate"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 autocorrection]);

  if (!v4) {
    goto LABEL_14;
  }
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
  if ([v5 positionInCurrentInternalSegment]) {
    goto LABEL_3;
  }
  if (-[_ACTUserActionStream preferPredictionSelection](self, "preferPredictionSelection"))
  {
  }

  else
  {
    unsigned int v7 = -[_ACTUserActionStream preferManualCorrection](self, "preferManualCorrection");

    if (!v7)
    {
LABEL_14:
      double v6 = 0LL;
      goto LABEL_15;
    }
  }

  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
  id v9 = [v8 rangeOfInputSegmentsForCandidate:v4];

  if (v9 != (id)0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_14;
  }
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v4 input]);
  double v5 = (void *)objc_claimAutoreleasedReturnValue( +[TIKeyboardCandidateSingle candidateWithUnchangedInput:]( &OBJC_CLASS___TIKeyboardCandidateSingle,  "candidateWithUnchangedInput:",  v10));

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
  id v12 = [v11 rangeOfInputSegmentsForCandidate:v5];

  if (v12 != (id)0x7FFFFFFFFFFFFFFFLL
    && -[_ACTUserActionStream shouldRejectBadAutocorrection](self, "shouldRejectBadAutocorrection"))
  {
    -[_ACTUserActionStream lastTimestamp](self, "lastTimestamp");
    double v14 = v13;
    -[_ACTUserActionStream randomActionInterval](self, "randomActionInterval");
    double v16 = v14 + v15;
    double v6 = -[ACTRejectCandidate initWithCandidate:timestamp:]( objc_alloc(&OBJC_CLASS___ACTRejectCandidate),  "initWithCandidate:timestamp:",  v4,  v16);
    if (v6)
    {
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
      if ([v17 segmentCursor])
      {
        id v18 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
        -[ACTUserAction setInputSegment:](v6, "setInputSegment:", (char *)[v18 segmentCursor] - 1);
      }

      else
      {
        -[ACTUserAction setInputSegment:](v6, "setInputSegment:", 1LL);
      }

      -[_ACTUserActionStream setLastTimestamp:](self, "setLastTimestamp:", v16);
    }

    goto LABEL_4;
  }

- (BOOL)isRetyping
{
  if (-[_ACTUserActionStream isBackspacing](self, "isBackspacing")
    || -[_ACTUserActionStream segmentCursorBeforeBackspacing](self, "segmentCursorBeforeBackspacing") == 0x7FFFFFFFFFFFFFFFLL)
  {
    return 0;
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
  id v5 = [v4 segmentCursor];
  BOOL v3 = v5 < (id)-[_ACTUserActionStream segmentCursorBeforeBackspacing](self, "segmentCursorBeforeBackspacing");

  return v3;
}

+ (_NSRange)segmentAnchorRangeForCursor:(id)a3 withDocumentBefore:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = (uint64_t)[v5 segmentCursor];
  if (v7 < 0) {
    goto LABEL_27;
  }
  uint64_t v8 = v7;
  while (2)
  {
    NSUInteger v9 = 0LL;
    uint64_t v26 = v8;
    while (1)
    {
      unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v5 externalSegments]);
      id v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "subarrayWithRange:", v8, v9));
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 componentsJoinedByString:&stru_89E80]);

      double v13 = [v6 rangeOfString:v12 options:4];
      uint64_t v15 = v14;
      id v16 = [v12 length];
      BOOL v17 = !v8 || (unint64_t)v16 >= 6;
      BOOL v18 = !v17;
      if (v13 != (_BYTE *)0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      if (!v8) {
        goto LABEL_16;
      }
      BOOL v19 = 0;
LABEL_19:
      BOOL v17 = v8-- != 0;
      char v22 = v17;
      int v23 = v18 || v19;

      if (v23 == 1)
      {
        ++v9;
        if ((v22 & 1) != 0) {
          continue;
        }
      }

      goto LABEL_26;
    }

    __int128 v20 = (char *)((_BYTE *)[v6 length] - &v13[v15]);
    BOOL v21 = (unint64_t)v20 >= 0x15;
    BOOL v19 = (unint64_t)v20 < 0x15;
    if (v8 || !v21)
    {
LABEL_18:
      if (!v18 && v19)
      {

        goto LABEL_29;
      }

      goto LABEL_19;
    }

- (_NSRange)documentEditRangeWithSegmentRangePtr:(_NSRange *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream delegate](self, "delegate"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 document]);

  uint64_t v7 = (void *)objc_opt_class(self);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
  NSUInteger v9 = (char *)[v7 segmentAnchorRangeForCursor:v8 withDocumentBefore:v6];
  uint64_t v11 = v10;

  if (v9 == (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    id v12 = 0LL;
    *a3 = (_NSRange)xmmword_821C0;
    uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
  }

  else
  {
    uint64_t v35 = a3;
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 externalSegments]);
    id v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "subarrayWithRange:", v9, v11));
    uint64_t v17 = objc_claimAutoreleasedReturnValue([v16 componentsJoinedByString:&stru_89E80]);

    v34 = (void *)v17;
    BOOL v18 = [v6 rangeOfString:v17 options:4];
    if (v18 == (_BYTE *)0x7FFFFFFFFFFFFFFFLL) {
      __int128 v20 = 0LL;
    }
    else {
      __int128 v20 = v18;
    }
    if (v18 == (_BYTE *)0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v21 = 0LL;
    }
    else {
      uint64_t v21 = v19;
    }
    uint64_t v13 = (uint64_t)&v20[v21];
    id v12 = (char *)((_BYTE *)[v6 length] - &v20[v21]);
    NSUInteger v22 = (NSUInteger)&v9[v11];
    int v23 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
    id v24 = [v23 segmentCursor];
    NSUInteger v25 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v25 externalSegments]);
    id v27 = [v26 count];
    __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
    __int128 v29 = v28;
    if (v24 >= v27)
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue([v28 externalSegments]);
      v30 = (char *)[v31 count];
    }

    else
    {
      v30 = (char *)[v28 segmentCursor] + 1;
    }

    v35->location = v22;
    v35->length = (NSUInteger)&v30[-v22];
  }

  NSUInteger v32 = v13;
  NSUInteger v33 = (NSUInteger)v12;
  result.length = v33;
  result.location = v32;
  return result;
}

- (BOOL)canBeginBackspacing
{
  if (-[_ACTUserActionStream isBackspacing](self, "isBackspacing")) {
    return 0;
  }
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
  id v4 = [v3 segmentCursor];

  if (!v4) {
    return 0;
  }
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
  id v6 = [v5 positionInCurrentInternalSegment];

  if (v6) {
    return 0;
  }
  else {
    return -[_ACTUserActionStream preferManualCorrection](self, "preferManualCorrection");
  }
}

- (BOOL)canContinueBackspacing
{
  BOOL v3 = -[_ACTUserActionStream isBackspacing](self, "isBackspacing");
  if (v3) {
    LOBYTE(v3) = -[_ACTUserActionStream preferManualCorrection](self, "preferManualCorrection");
  }
  return v3;
}

- (BOOL)shouldBeginCorrectingAfterWord
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream userModel](self, "userModel"));
  [v3 probBeginCorrectingAfterWord];
  float v5 = v4;

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream errorGenerator](self, "errorGenerator"));
  [v6 uniformRandomNumber];
  float v8 = v7;

  return v5 > v8;
}

- (BOOL)shouldBeginCorrectingAfterWordTerminator
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream userModel](self, "userModel"));
  [v3 probBeginCorrectingAfterWordTerminator];
  float v5 = v4;

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream errorGenerator](self, "errorGenerator"));
  [v6 uniformRandomNumber];
  float v8 = v7;

  return v5 > v8;
}

- (BOOL)shouldRejectBadAutocorrection
{
  if (-[_ACTUserActionStream preferPredictionSelection](self, "preferPredictionSelection"))
  {
    LOBYTE(v3) = 1;
  }

  else
  {
    BOOL v3 = -[_ACTUserActionStream preferManualCorrection](self, "preferManualCorrection");
    if (v3)
    {
      float v4 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream userModel](self, "userModel"));
      [v4 probRejectBadAutocorrection];
      float v6 = v5;

      double v7 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream errorGenerator](self, "errorGenerator"));
      [v7 uniformRandomNumber];
      float v9 = v8;

      LOBYTE(v3) = v6 > v9;
    }
  }

  return v3;
}

- (id)tryBackspacing
{
  unsigned int v3 = -[_ACTUserActionStream canBeginBackspacing](self, "canBeginBackspacing");
  unsigned int v4 = -[_ACTUserActionStream canContinueBackspacing](self, "canContinueBackspacing");
  unsigned int v5 = v4;
  if ((v3 & 1) == 0 && !v4)
  {
LABEL_3:
    float v6 = 0LL;
    goto LABEL_4;
  }

  if (v3)
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
    id v15 = [v14 segmentCursor];
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream userModel](self, "userModel"));
    id v17 = [v16 maxPriorSegmentsCheckedForErrors];

    if (v15 <= v17)
    {
      unint64_t v21 = 0LL;
    }

    else
    {
      BOOL v18 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
      uint64_t v19 = [v18 segmentCursor];
      __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream userModel](self, "userModel"));
      unint64_t v21 = v19 - (_BYTE *)[v20 maxPriorSegmentsCheckedForErrors];
    }

    unint64_t v37 = -[_ACTUserActionStream segmentEditHorizon](self, "segmentEditHorizon");
    if (v37 <= v21) {
      unint64_t v38 = v21;
    }
    else {
      unint64_t v38 = v37;
    }
    -[_ACTUserActionStream setSegmentEditHorizon:](self, "setSegmentEditHorizon:", v38);
  }

  __int128 v114 = xmmword_821C0;
  id v39 = -[_ACTUserActionStream documentEditRangeWithSegmentRangePtr:]( self,  "documentEditRangeWithSegmentRangePtr:",  &v114);
  if (v39 == (id)0x7FFFFFFFFFFFFFFFLL
    || (unint64_t v41 = v114, (void)v114 == 0x7FFFFFFFFFFFFFFFLL)
    || (id v42 = v39, v43 = v40, v41 < -[_ACTUserActionStream segmentEditHorizon](self, "segmentEditHorizon"))
    || -[_ACTUserActionStream hasDesiredAutocorrection](self, "hasDesiredAutocorrection"))
  {
    float v6 = 0LL;
    return v6;
  }

  id v47 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
  if ([v47 segmentCursor])
  {
    int v48 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
    if ([v48 positionInCurrentInternalSegment])
    {
      BOOL v112 = 0;
    }

    else
    {
      v110 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
      v49 = (void *)objc_claimAutoreleasedReturnValue([v110 externalSegments]);
      v50 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "objectAtIndex:", (char *)objc_msgSend( v50,  "segmentCursor") - 1));
      BOOL v112 = !sub_152B4(v51);
    }
  }

  else
  {
    BOOL v112 = 0;
  }

  id v52 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
  if ([v52 segmentCursor])
  {
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
    unsigned __int8 v54 = (void *)objc_claimAutoreleasedReturnValue([v53 externalSegments]);
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "objectAtIndex:", (char *)objc_msgSend( v55,  "segmentCursor") - 1));
    LODWORD(v110) = sub_152B4(v56);
  }

  else
  {
    LODWORD(v110) = 0;
  }

  v57 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
  if ([v57 atEndOfText])
  {
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
    v59 = (void *)objc_claimAutoreleasedReturnValue([v58 externalSegments]);
    v60 = (void *)objc_claimAutoreleasedReturnValue([v59 lastObject]);
    BOOL v61 = !sub_152B4(v60);
  }

  else
  {
    BOOL v61 = 0;
  }

  if (!v43)
  {
    if (*((void *)&v114 + 1)) {
      unsigned int v70 = v3;
    }
    else {
      unsigned int v70 = 0;
    }
    if (v70 == 1)
    {
      unint64_t v71 = v114;
      v72 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
      id v73 = [v72 segmentCursor];

      if (v71 < (unint64_t)v73
        && ((v112 || v61)
         && -[_ACTUserActionStream shouldBeginCorrectingAfterWord](self, "shouldBeginCorrectingAfterWord")
         || (v110 | v61) == 1
         && -[_ACTUserActionStream shouldBeginCorrectingAfterWordTerminator]( self,  "shouldBeginCorrectingAfterWordTerminator")))
      {
        float v6 = objc_alloc_init(&OBJC_CLASS___ACTBackspaceMentalCursor);
        v74 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
        -[_ACTUserActionStream setSegmentCursorBeforeBackspacing:]( self,  "setSegmentCursorBeforeBackspacing:",  [v74 segmentCursor]);

        while (1)
        {
          v75 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor", v110));
          id v76 = [v75 segmentCursor];
          unint64_t v77 = v114;

          -[_ACTUserActionStream rewindSegmentCursor](self, "rewindSegmentCursor");
        }

        v101 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
        -[ACTUserAction setInputSegment:](v6, "setInputSegment:", [v101 segmentCursor]);

        -[_ACTUserActionStream lastTimestamp](self, "lastTimestamp");
        double v103 = v102;
        -[_ACTUserActionStream randomActionInterval](self, "randomActionInterval");
        -[_ACTUserActionStream setLastTimestamp:](self, "setLastTimestamp:", v103 + v104);
        goto LABEL_4;
      }
    }

    goto LABEL_3;
  }

  v62 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream delegate](self, "delegate"));
  v63 = (void *)objc_claimAutoreleasedReturnValue([v62 document]);
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "substringWithRange:", v42, v43));

  v65 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
  v66 = (void *)objc_claimAutoreleasedReturnValue([v65 externalSegments]);
  v67 = (void *)objc_claimAutoreleasedReturnValue([v66 subarrayWithRange:v114]);
  v68 = (void *)objc_claimAutoreleasedReturnValue([v67 componentsJoinedByString:&stru_89E80]);

  if ([v64 length] && (objc_msgSend(v68, "hasPrefix:", v64) & 1) == 0)
  {
    if (!v3) {
      goto LABEL_62;
    }
    if ((v112 || v61) && -[_ACTUserActionStream shouldBeginCorrectingAfterWord](self, "shouldBeginCorrectingAfterWord"))
    {
      unsigned int v69 = 1;
LABEL_64:
      LODWORD(v110) = v69;
      v78 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream delegate](self, "delegate", v110));
      v79 = (void *)objc_claimAutoreleasedReturnValue([v78 keyboardController]);
      v80 = (void *)objc_claimAutoreleasedReturnValue([v79 layoutUtils]);
      v81 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream delegate](self, "delegate"));
      v82 = (void *)objc_claimAutoreleasedReturnValue([v81 keyplane]);
      v83 = (void *)objc_claimAutoreleasedReturnValue( [v80 exactKeyForString:@"Delete" keyplane:v82 includeSecondaryStrings:0]);

      v84 = v83;
      -[_ACTUserActionStream lastTimestamp](self, "lastTimestamp");
      double v86 = v85;
      -[_ACTUserActionStream randomActionInterval](self, "randomActionInterval");
      double v88 = v86 + v87;
      v89 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream errorGenerator](self, "errorGenerator"));
      [v83 paddedFrame];
      v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "errorForKeyString:rect:", @"Delete"));

      v91 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream delegate](self, "delegate"));
      [v91 pointForAttemptedTapOnKey:v83 withError:v90];
      double v93 = v92;
      double v95 = v94;

      v96 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream delegate](self, "delegate"));
      v97 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream delegate](self, "delegate"));
      v98 = (void *)objc_claimAutoreleasedReturnValue([v97 keyplane]);
      v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "keyContainingPoint:inKeyplane:", v98, v93, v95));

      if (v99) {
        v100 = -[ACTKeyTap initWithIntendedKey:touchedKey:error:location:timestamp:secondaryString:]( objc_alloc(&OBJC_CLASS___ACTKeyTap),  "initWithIntendedKey:touchedKey:error:location:timestamp:secondaryString:",  v84,  v99,  v90,  0LL,  v93,  v95,  v88);
      }
      else {
        v100 = -[ACTSkipKeyTap initWithIntendedKey:timestamp:]( objc_alloc(&OBJC_CLASS___ACTSkipKeyTap),  "initWithIntendedKey:timestamp:",  v84,  v88);
      }
      float v6 = (ACTBackspaceMentalCursor *)v100;
      v113 = v84;
      if (v111)
      {
        v105 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
        -[_ACTUserActionStream setSegmentCursorBeforeBackspacing:]( self,  "setSegmentCursorBeforeBackspacing:",  [v105 segmentCursor]);
      }

      while (1)
      {
        v106 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
        id v107 = [v106 segmentCursor];
        unint64_t v108 = v114;

        -[_ACTUserActionStream rewindSegmentCursor](self, "rewindSegmentCursor");
      }

      v109 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
      -[ACTUserAction setInputSegment:](v6, "setInputSegment:", [v109 segmentCursor]);

      -[_ACTUserActionStream setLastTimestamp:](self, "setLastTimestamp:", v88);
      goto LABEL_67;
    }

    if ((v110 | v61) == 1) {
      unsigned int v69 = -[_ACTUserActionStream shouldBeginCorrectingAfterWordTerminator]( self,  "shouldBeginCorrectingAfterWordTerminator");
    }
    else {
LABEL_62:
    }
      unsigned int v69 = 0;
    if ((v5 | v69) == 1) {
      goto LABEL_64;
    }
  }

  float v6 = 0LL;
LABEL_67:

LABEL_4:
  if (v6) {
    unsigned int v7 = 0;
  }
  else {
    unsigned int v7 = v5;
  }
  if (v7 == 1)
  {
    __int128 v114 = xmmword_821C0;
    id v8 = -[_ACTUserActionStream documentEditRangeWithSegmentRangePtr:]( self,  "documentEditRangeWithSegmentRangePtr:",  &v114);
    if (v8 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 currentInternalSegment]);
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "substringToIndex:", objc_msgSend(v12, "positionInCurrentInternalSegment")));

      -[_ACTUserActionStream rewindPositionByString:](self, "rewindPositionByString:", v13);
    }

    else
    {
      id v22 = v8;
      uint64_t v23 = v9;
      id v24 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream delegate](self, "delegate"));
      NSUInteger v25 = (void *)objc_claimAutoreleasedReturnValue([v24 document]);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "substringWithRange:", v22, v23));

      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream externalStringToInternal:](self, "externalStringToInternal:", v13));
      id v27 = [v26 length];
      __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
      id v29 = [v28 positionInCurrentInternalSegment];

      v30 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
      v31 = (void *)objc_claimAutoreleasedReturnValue([v30 currentInternalSegment]);
      if (v27 <= v29)
      {
        id v44 = [v26 length];
        v45 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
        v36 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v31,  "substringWithRange:",  v44,  (_BYTE *)objc_msgSend(v45, "positionInCurrentInternalSegment")
                        - (_BYTE *)[v26 length]));

        -[_ACTUserActionStream rewindPositionByString:](self, "rewindPositionByString:", v36);
      }

      else
      {
        NSUInteger v32 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
        id v33 = [v32 positionInCurrentInternalSegment];
        v34 = [v26 length];
        uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
        v36 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v31,  "substringWithRange:",  v33,  v34 - (_BYTE *)objc_msgSend(v35, "positionInCurrentInternalSegment")));

        -[_ACTUserActionStream advancePositionByString:](self, "advancePositionByString:", v36);
      }
    }
  }

  return v6;
}

- (id)tryPeriodShortcut
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream userModel](self, "userModel"));
  unsigned int v4 = [v3 prefersSpaceBarDoubleTap];

  if (v4)
  {
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
    float v6 = (void *)objc_claimAutoreleasedReturnValue([v5 currentLongCharacter]);

    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 nextLongCharacter]);

    uint64_t v9 = 0LL;
    if (!v6 || !v8) {
      goto LABEL_26;
    }
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByAppendingString:v8]);
    if (![v10 isEqualToString:@". "])
    {
      uint64_t v9 = 0LL;
LABEL_25:

LABEL_26:
      return v9;
    }

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream delegate](self, "delegate"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 keyboardController]);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 layoutUtils]);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream delegate](self, "delegate"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 keyplane]);
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v13 exactKeyForString:@" " keyplane:v15]);

    if (!v16)
    {
      uint64_t v9 = 0LL;
LABEL_24:

      goto LABEL_25;
    }

    -[_ACTUserActionStream lastTimestamp](self, "lastTimestamp");
    double v18 = v17;
    -[_ACTUserActionStream randomActionInterval](self, "randomActionInterval");
    double v20 = v18 + v19;
    unint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream errorGenerator](self, "errorGenerator"));
    [v16 paddedFrame];
    uint64_t v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "errorForKeyString:rect:", @" "));

    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream delegate](self, "delegate"));
    [v23 pointForAttemptedTapOnKey:v16 withError:v22];
    double v25 = v24;
    double v27 = v26;

    __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream delegate](self, "delegate"));
    id v29 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream delegate](self, "delegate"));
    v30 = (void *)objc_claimAutoreleasedReturnValue([v29 keyplane]);
    uint64_t v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "keyContainingPoint:inKeyplane:", v30, v25, v27));

    v53 = (void *)v31;
    unsigned __int8 v54 = (void *)v22;
    if (v31) {
      v55 = -[ACTKeyTap initWithIntendedKey:touchedKey:error:location:timestamp:secondaryString:]( objc_alloc(&OBJC_CLASS___ACTKeyTap),  "initWithIntendedKey:touchedKey:error:location:timestamp:secondaryString:",  v16,  v31,  v22,  0LL,  v25,  v27,  v20);
    }
    else {
      v55 = 0LL;
    }
    -[_ACTUserActionStream randomActionInterval](self, "randomActionInterval");
    double v33 = v20 + v32 * 0.5;
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream errorGenerator](self, "errorGenerator"));
    [v16 paddedFrame];
    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "errorForKeyString:rect:", @" "));

    v36 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream delegate](self, "delegate"));
    [v36 pointForAttemptedTapOnKey:v16 withError:v35];
    double v38 = v37;
    double v40 = v39;

    unint64_t v41 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream delegate](self, "delegate"));
    id v42 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream delegate](self, "delegate"));
    uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue([v42 keyplane]);
    id v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "keyContainingPoint:inKeyplane:", v43, v38, v40));

    if (v44)
    {
      v45 = -[ACTKeyTap initWithIntendedKey:touchedKey:error:location:timestamp:secondaryString:]( objc_alloc(&OBJC_CLASS___ACTKeyTap),  "initWithIntendedKey:touchedKey:error:location:timestamp:secondaryString:",  0LL,  v44,  v35,  0LL,  v38,  v40,  v33);
      v46 = v45;
      id v47 = v55;
      BOOL v48 = v55 != 0LL;
      if (v55 && v45)
      {
        v49 = -[ACTDoubleKeyTap initWithFirstTap:secondTap:]( objc_alloc(&OBJC_CLASS___ACTDoubleKeyTap),  "initWithFirstTap:secondTap:",  v55,  v45);
        goto LABEL_21;
      }
    }

    else
    {
      v46 = 0LL;
      id v47 = v55;
      BOOL v48 = v55 != 0LL;
    }

    if (v48) {
      v50 = v47;
    }
    else {
      v50 = v46;
    }
    v49 = v50;
LABEL_21:
    uint64_t v9 = v49;
    if (v49)
    {
      v51 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
      -[ACTUserAction setInputSegment:](v9, "setInputSegment:", [v51 segmentCursor]);

      id v47 = v55;
      -[_ACTUserActionStream advancePositionByString:](self, "advancePositionByString:", v10);
      -[_ACTUserActionStream setLastTimestamp:](self, "setLastTimestamp:", v33);
    }

    goto LABEL_24;
  }

  uint64_t v9 = 0LL;
  return v9;
}

- (id)tryTypingWillSuppressError:(BOOL *)a3
{
  *a3 = 0;
  if (-[_ACTUserActionStream shouldIgnoreCurrentCharacter](self, "shouldIgnoreCurrentCharacter"))
  {
    do
    {
      unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
      float v6 = (void *)objc_claimAutoreleasedReturnValue([v5 currentLongCharacter]);

      -[_ACTUserActionStream advancePositionByString:](self, "advancePositionByString:", v6);
    }

    while (-[_ACTUserActionStream shouldIgnoreCurrentCharacter](self, "shouldIgnoreCurrentCharacter"));
  }

  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
  unsigned __int8 v8 = [v7 atEndOfText];

  if ((v8 & 1) == 0)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream userModel](self, "userModel"));
    if ([v10 prefersContinuousPath])
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
      id v12 = [v11 positionInCurrentInternalSegment];

      if (!v12)
      {
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream tryContinuousPath](self, "tryContinuousPath"));
        goto LABEL_10;
      }
    }

    else
    {
    }

    uint64_t v9 = 0LL;
LABEL_10:
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream errorGenerator](self, "errorGenerator"));
    [v13 uniformRandomNumber];
    double v15 = v14;

    if (v9) {
      return v9;
    }
    float v16 = v15;
    float v17 = 0.0;
    if (!-[_ACTUserActionStream isRetyping](self, "isRetyping")
      && !-[_ACTUserActionStream lastActionSuppressesError](self, "lastActionSuppressesError")
      && !-[_ACTUserActionStream lastActionUseSecondaryString](self, "lastActionUseSecondaryString"))
    {
      double v24 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream userModel](self, "userModel"));
      if ([v24 prefersTransliteration])
      {
        double v25 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
        unsigned __int8 v26 = [v25 nextLongCharacterEndsSegment];

        if ((v26 & 1) != 0) {
          goto LABEL_14;
        }
      }

      else
      {
      }

      -[_ACTUserActionStream probabilityOfTransposition](self, "probabilityOfTransposition");
      float v17 = v29 + 0.0;
      if (v16 >= 0.0 && v17 > v16)
      {
        uint64_t v22 = objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream tryTransposedKeyTaps](self, "tryTransposedKeyTaps"));
        if (v22) {
          goto LABEL_53;
        }
      }
    }

- (id)tryTransposedKeyTaps
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 currentLongCharacter]);

  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream delegate](self, "delegate"));
  float v6 = (void *)objc_claimAutoreleasedReturnValue([v5 keyplane]);
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue( -[_ACTUserActionStream anyKeyForString:keyplane:wantSecondaryString:substituteUpperCaseForLowerCase:]( self,  "anyKeyForString:keyplane:wantSecondaryString:substituteUpperCaseForLowerCase:",  v4,  v6,  0LL,  0LL));

  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 nextLongCharacter]);

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream delegate](self, "delegate"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 keyplane]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue( -[_ACTUserActionStream anyKeyForString:keyplane:wantSecondaryString:substituteUpperCaseForLowerCase:]( self,  "anyKeyForString:keyplane:wantSecondaryString:substituteUpperCaseForLowerCase:",  v9,  v11,  0LL,  0LL));

  uint64_t v13 = 0LL;
  if (v4 && v7 && v9 && v12)
  {
    -[_ACTUserActionStream lastTimestamp](self, "lastTimestamp");
    double v15 = v14;
    -[_ACTUserActionStream randomActionInterval](self, "randomActionInterval");
    double v17 = v15 + v16;
    float v18 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream errorGenerator](self, "errorGenerator"));
    [v12 paddedFrame];
    uint64_t v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "errorForKeyString:rect:", v9));

    float v20 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream delegate](self, "delegate"));
    [v20 pointForAttemptedTapOnKey:v12 withError:v19];
    double v22 = v21;
    double v24 = v23;

    double v25 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream delegate](self, "delegate"));
    unsigned __int8 v26 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream delegate](self, "delegate"));
    float v27 = (void *)objc_claimAutoreleasedReturnValue([v26 keyplane]);
    uint64_t v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "keyContainingPoint:inKeyplane:", v27, v22, v24));

    BOOL v48 = (void *)v28;
    v49 = (void *)v19;
    if (v28) {
      v50 = -[ACTKeyTap initWithIntendedKey:touchedKey:error:location:timestamp:secondaryString:]( objc_alloc(&OBJC_CLASS___ACTKeyTap),  "initWithIntendedKey:touchedKey:error:location:timestamp:secondaryString:",  v12,  v28,  v19,  0LL,  v22,  v24,  v17);
    }
    else {
      v50 = 0LL;
    }
    -[_ACTUserActionStream randomActionInterval](self, "randomActionInterval");
    double v30 = v29;
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream errorGenerator](self, "errorGenerator"));
    [v7 paddedFrame];
    double v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "errorForKeyString:rect:", v4));

    double v33 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream delegate](self, "delegate"));
    [v33 pointForAttemptedTapOnKey:v7 withError:v32];
    double v35 = v34;
    double v37 = v36;

    double v38 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream delegate](self, "delegate"));
    double v39 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream delegate](self, "delegate"));
    double v40 = (void *)objc_claimAutoreleasedReturnValue([v39 keyplane]);
    unint64_t v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "keyContainingPoint:inKeyplane:", v40, v35, v37));

    if (v41)
    {
      double v42 = v17 + v30 * 0.5;
      uint64_t v43 = -[ACTKeyTap initWithIntendedKey:touchedKey:error:location:timestamp:secondaryString:]( objc_alloc(&OBJC_CLASS___ACTKeyTap),  "initWithIntendedKey:touchedKey:error:location:timestamp:secondaryString:",  v7,  v41,  v32,  0LL,  v35,  v37,  v42);
      id v44 = v43;
      uint64_t v13 = 0LL;
      v45 = v50;
      if (v50)
      {
        if (v43)
        {
          uint64_t v13 = -[ACTTransposeKeyTaps initWithFirstTap:secondTap:]( objc_alloc(&OBJC_CLASS___ACTTransposeKeyTaps),  "initWithFirstTap:secondTap:",  v50,  v43);
          if (v13)
          {
            -[_ACTUserActionStream setLastTimestamp:](self, "setLastTimestamp:", v42);
            v46 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
            -[ACTUserAction setInputSegment:](v13, "setInputSegment:", [v46 segmentCursor]);

            v45 = v50;
            -[_ACTUserActionStream advancePositionByString:](self, "advancePositionByString:", v4);
            -[_ACTUserActionStream advancePositionByString:](self, "advancePositionByString:", v9);
          }
        }
      }
    }

    else
    {
      uint64_t v13 = 0LL;
      id v44 = 0LL;
      v45 = v50;
    }
  }

  return v13;
}

- (id)trySkipKeyTap
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 currentLongCharacter]);

  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream delegate](self, "delegate"));
  float v6 = (void *)objc_claimAutoreleasedReturnValue([v5 keyplane]);
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue( -[_ACTUserActionStream anyKeyForString:keyplane:wantSecondaryString:substituteUpperCaseForLowerCase:]( self,  "anyKeyForString:keyplane:wantSecondaryString:substituteUpperCaseForLowerCase:",  v4,  v6,  0LL,  0LL));

  -[_ACTUserActionStream lastTimestamp](self, "lastTimestamp");
  double v9 = v8;
  uint64_t v10 = -[ACTSkipKeyTap initWithIntendedKey:timestamp:]( objc_alloc(&OBJC_CLASS___ACTSkipKeyTap),  "initWithIntendedKey:timestamp:",  v7,  v8);
  if (v10)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
    -[ACTUserAction setInputSegment:](v10, "setInputSegment:", [v11 segmentCursor]);

    -[_ACTUserActionStream advancePositionByString:](self, "advancePositionByString:", v4);
    -[_ACTUserActionStream setLastTimestamp:](self, "setLastTimestamp:", v9);
  }

  return v10;
}

- (id)trySubstituteKeyTap
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 currentLongCharacter]);

  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream delegate](self, "delegate"));
  float v6 = (void *)objc_claimAutoreleasedReturnValue([v5 keyplane]);
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue( -[_ACTUserActionStream anyKeyForString:keyplane:wantSecondaryString:substituteUpperCaseForLowerCase:]( self,  "anyKeyForString:keyplane:wantSecondaryString:substituteUpperCaseForLowerCase:",  v4,  v6,  0LL,  0LL));

  -[_ACTUserActionStream lastTimestamp](self, "lastTimestamp");
  double v9 = v8;
  -[_ACTUserActionStream randomActionInterval](self, "randomActionInterval");
  double v11 = v10;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream delegate](self, "delegate"));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 keyboard]);
  [v13 frame];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  double v22 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream errorGenerator](self, "errorGenerator"));
  objc_msgSend(v22, "uniformRandomPointInRect:", v15, v17, v19, v21);
  double v24 = v23;
  double v26 = v25;

  float v27 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream delegate](self, "delegate"));
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream delegate](self, "delegate"));
  double v29 = (void *)objc_claimAutoreleasedReturnValue([v28 keyplane]);
  double v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "keyContainingPoint:inKeyplane:", v29, v24, v26));

  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream userModel](self, "userModel"));
  double v32 = (void *)objc_claimAutoreleasedReturnValue([v30 representedString]);
  if (([v32 isEqualToString:@" "] & 1) == 0)
  {

LABEL_6:
    goto LABEL_7;
  }

  double v33 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream userModel](self, "userModel"));
  unsigned int v34 = [v33 spacesBetweenTransliterations];

  if (v34)
  {
    double v35 = (ACTSubstituteKeyTap *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream tryAcceptCandidate](self, "tryAcceptCandidate"));
    goto LABEL_9;
  }

- (id)tryExtraKeyTap
{
  double v4 = v3;
  -[_ACTUserActionStream randomActionInterval](self, "randomActionInterval");
  double v6 = v4 + v5;
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream delegate](self, "delegate"));
  double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 keyboard]);
  [v8 frame];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  double v17 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream errorGenerator](self, "errorGenerator"));
  objc_msgSend(v17, "uniformRandomPointInRect:", v10, v12, v14, v16);
  double v19 = v18;
  double v21 = v20;

  double v22 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream delegate](self, "delegate"));
  double v23 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream delegate](self, "delegate"));
  double v24 = (void *)objc_claimAutoreleasedReturnValue([v23 keyplane]);
  double v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "keyContainingPoint:inKeyplane:", v24, v19, v21));

  double v26 = -[ACTExtraKeyTap initWithTouchedKey:location:timestamp:]( objc_alloc(&OBJC_CLASS___ACTExtraKeyTap),  "initWithTouchedKey:location:timestamp:",  v25,  v19,  v21,  v6);
  if (v26)
  {
    float v27 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
    if (![v27 positionInCurrentInternalSegment])
    {
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
      uint64_t v32 = objc_claimAutoreleasedReturnValue([v31 currentExternalSegment]);
      if (v32)
      {
        double v33 = (void *)v32;
        unsigned int v34 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
        double v35 = (void *)objc_claimAutoreleasedReturnValue([v34 currentExternalSegment]);
        unsigned __int8 v36 = [v35 isEqualToString:@" "];

        if ((v36 & 1) != 0)
        {
          uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
          double v29 = (char *)[v28 segmentCursor] - 1;
          goto LABEL_5;
        }

- (id)tryDoubleKeyTap
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
  double v4 = (void *)objc_claimAutoreleasedReturnValue([v3 currentLongCharacter]);

  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream delegate](self, "delegate"));
  double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 keyplane]);
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue( -[_ACTUserActionStream anyKeyForString:keyplane:wantSecondaryString:substituteUpperCaseForLowerCase:]( self,  "anyKeyForString:keyplane:wantSecondaryString:substituteUpperCaseForLowerCase:",  v4,  v6,  0LL,  0LL));

  double v8 = 0LL;
  if (v7 && v4)
  {
    -[_ACTUserActionStream lastTimestamp](self, "lastTimestamp");
    double v10 = v9;
    -[_ACTUserActionStream randomActionInterval](self, "randomActionInterval");
    double v12 = v10 + v11;
    double v13 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream errorGenerator](self, "errorGenerator"));
    [v7 paddedFrame];
    uint64_t v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "errorForKeyString:rect:", v4));

    double v15 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream delegate](self, "delegate"));
    [v15 pointForAttemptedTapOnKey:v7 withError:v14];
    double v17 = v16;
    double v19 = v18;

    double v20 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream delegate](self, "delegate"));
    double v21 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream delegate](self, "delegate"));
    double v22 = (void *)objc_claimAutoreleasedReturnValue([v21 keyplane]);
    double v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "keyContainingPoint:inKeyplane:", v22, v17, v19));

    uint64_t v43 = (void *)v14;
    if (v23) {
      double v24 = -[ACTKeyTap initWithIntendedKey:touchedKey:error:location:timestamp:secondaryString:]( objc_alloc(&OBJC_CLASS___ACTKeyTap),  "initWithIntendedKey:touchedKey:error:location:timestamp:secondaryString:",  v7,  v23,  v14,  0LL,  v17,  v19,  v12);
    }
    else {
      double v24 = 0LL;
    }
    -[_ACTUserActionStream randomActionInterval](self, "randomActionInterval");
    double v26 = v25;
    float v27 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream errorGenerator](self, "errorGenerator"));
    [v7 paddedFrame];
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "errorForKeyString:rect:", v4));

    double v29 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream delegate](self, "delegate"));
    [v29 pointForAttemptedTapOnKey:v7 withError:v28];
    double v31 = v30;
    double v33 = v32;

    unsigned int v34 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream delegate](self, "delegate"));
    double v35 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream delegate](self, "delegate"));
    unsigned __int8 v36 = (void *)objc_claimAutoreleasedReturnValue([v35 keyplane]);
    double v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "keyContainingPoint:inKeyplane:", v36, v31, v33));

    if (v37)
    {
      double v38 = v12 + v26;
      double v39 = -[ACTKeyTap initWithIntendedKey:touchedKey:error:location:timestamp:secondaryString:]( objc_alloc(&OBJC_CLASS___ACTKeyTap),  "initWithIntendedKey:touchedKey:error:location:timestamp:secondaryString:",  0LL,  v37,  v28,  0LL,  v31,  v33,  v38);
      double v40 = v39;
      double v8 = 0LL;
      if (v24)
      {
        if (v39)
        {
          double v8 = -[ACTDoubleKeyTap initWithFirstTap:secondTap:]( objc_alloc(&OBJC_CLASS___ACTDoubleKeyTap),  "initWithFirstTap:secondTap:",  v24,  v39);
          if (v8)
          {
            unint64_t v41 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
            -[ACTUserAction setInputSegment:](v8, "setInputSegment:", [v41 segmentCursor]);

            -[_ACTUserActionStream advancePositionByString:](self, "advancePositionByString:", v4);
            -[_ACTUserActionStream setLastTimestamp:](self, "setLastTimestamp:", v38);
          }
        }
      }
    }

    else
    {
      double v8 = 0LL;
      double v40 = 0LL;
    }
  }

  return v8;
}

- (id)tryKeyTap
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
  double v4 = (void *)objc_claimAutoreleasedReturnValue([v3 currentLongCharacter]);

  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream delegate](self, "delegate"));
  double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 keyplane]);
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue( -[_ACTUserActionStream anyKeyForString:keyplane:wantSecondaryString:substituteUpperCaseForLowerCase:]( self,  "anyKeyForString:keyplane:wantSecondaryString:substituteUpperCaseForLowerCase:",  v4,  v6,  -[_ACTUserActionStream lastActionUseSecondaryString](self, "lastActionUseSecondaryString"),  0LL));

  if (!v7)
  {
    if (-[_ACTUserActionStream isRetyping](self, "isRetyping")
      || !sub_15168(v4)
      || (uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor")),
          unsigned __int8 v15 = [v14 atBeginningOfText],
          v14,
          (v15 & 1) != 0))
    {
      unsigned int v7 = 0LL;
      double v8 = 0LL;
      goto LABEL_15;
    }

    double v30 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream delegate](self, "delegate"));
    double v31 = (void *)objc_claimAutoreleasedReturnValue([v30 locale]);
    double v32 = (void *)objc_claimAutoreleasedReturnValue([v4 lowercaseStringWithLocale:v31]);

    unsigned int v33 = [v32 isEqualToString:v4];
    unsigned int v34 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream delegate](self, "delegate"));
    double v35 = (void *)objc_claimAutoreleasedReturnValue([v34 keyplane]);
    unsigned int v36 = [v35 isShiftKeyplane];

    unsigned int v7 = 0LL;
    if (v33 && v36)
    {
      double v37 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream delegate](self, "delegate"));
      double v38 = (void *)objc_claimAutoreleasedReturnValue([v37 locale]);
      double v39 = (void *)objc_claimAutoreleasedReturnValue([v4 capitalizedStringWithLocale:v38]);

      double v40 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream delegate](self, "delegate"));
      unint64_t v41 = (void *)objc_claimAutoreleasedReturnValue([v40 keyplane]);
      unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue( -[_ACTUserActionStream anyKeyForString:keyplane:wantSecondaryString:substituteUpperCaseForLowerCase:]( self,  "anyKeyForString:keyplane:wantSecondaryString:substituteUpperCaseForLowerCase:",  v39,  v41,  -[_ACTUserActionStream lastActionUseSecondaryString](self, "lastActionUseSecondaryString"),  0LL));
    }
  }

  double v8 = 0LL;
  if (v7 && v4)
  {
    -[_ACTUserActionStream lastTimestamp](self, "lastTimestamp");
    double v10 = v9;
    -[_ACTUserActionStream randomActionInterval](self, "randomActionInterval");
    double v12 = v11;
    if (-[_ACTUserActionStream isRetyping](self, "isRetyping"))
    {
      double v13 = (void *)objc_claimAutoreleasedReturnValue( +[TIPointError errorWithErrorVector:]( &OBJC_CLASS___TIPointError,  "errorWithErrorVector:",  CGPointZero.x,  CGPointZero.y));
    }

    else
    {
      double v16 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream errorGenerator](self, "errorGenerator"));
      double v17 = (void *)objc_claimAutoreleasedReturnValue([v7 representedString]);
      [v7 paddedFrame];
      double v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "errorForKeyString:rect:", v17));
    }

    double v18 = v10 + v12;
    double v19 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream delegate](self, "delegate"));
    [v19 pointForAttemptedTapOnKey:v7 withError:v13];
    double v21 = v20;
    double v23 = v22;

    double v24 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream delegate](self, "delegate"));
    double v25 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream delegate](self, "delegate"));
    double v26 = (void *)objc_claimAutoreleasedReturnValue([v25 keyplane]);
    float v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "keyContainingPoint:inKeyplane:", v26, v21, v23));

    if (v27)
    {
      double v8 = -[ACTKeyTap initWithIntendedKey:touchedKey:error:location:timestamp:secondaryString:]( objc_alloc(&OBJC_CLASS___ACTKeyTap),  "initWithIntendedKey:touchedKey:error:location:timestamp:secondaryString:",  v7,  v27,  v13,  -[_ACTUserActionStream lastActionUseSecondaryString](self, "lastActionUseSecondaryString"),  v21,  v23,  v18);
      -[_ACTUserActionStream isRetyping](self, "isRetyping");
      if (!v8)
      {
LABEL_14:

        goto LABEL_15;
      }
    }

    else
    {
      double v8 = -[ACTSkipKeyTap initWithIntendedKey:timestamp:]( objc_alloc(&OBJC_CLASS___ACTSkipKeyTap),  "initWithIntendedKey:timestamp:",  v7,  v18);
      if (!v8) {
        goto LABEL_14;
      }
    }

    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
    -[ACTUserAction setInputSegment:](v8, "setInputSegment:", [v28 segmentCursor]);

    -[_ACTUserActionStream advancePositionByString:](self, "advancePositionByString:", v4);
    -[_ACTUserActionStream setLastTimestamp:](self, "setLastTimestamp:", v18);
    -[_ACTUserActionStream setLastActionUseSecondaryString:](self, "setLastActionUseSecondaryString:", 0LL);
    goto LABEL_14;
  }

+ (BOOL)isPathableWord:(id)a3
{
  id v3 = a3;
  double v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableCharacterSet letterCharacterSet](&OBJC_CLASS___NSMutableCharacterSet, "letterCharacterSet"));
  [v4 addCharactersInString:@"'’׳״-"];
  [v4 removeCharactersInString:@"œŒß"];
  double v5 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByTrimmingCharactersInSet:v4]);
  id v6 = [v3 length];

  BOOL v7 = (unint64_t)v6 >= 2 && [v5 length] == 0;
  return v7;
}

- (id)tryContinuousPath
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
  double v4 = (void *)objc_claimAutoreleasedReturnValue([v3 currentInternalSegment]);

  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream userModel](self, "userModel"));
  unsigned __int8 v6 = [v5 expectsAppendedSpaceToContinuousPath];

  if ((v6 & 1) != 0
    || ![v4 isEqualToString:@" "]
    || (BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor")),
        id v8 = [v7 positionInCurrentInternalSegment],
        v7,
        v8))
  {
    int v9 = 0;
  }

  else
  {
    double v29 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
    [v29 advanceSegmentCursor];

    double v30 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
    uint64_t v31 = objc_claimAutoreleasedReturnValue([v30 currentInternalSegment]);

    int v9 = 1;
    double v4 = (void *)v31;
  }

  if ([(id)objc_opt_class(self) isPathableWord:v4])
  {
    v70[0] = 0LL;
    v70[1] = v70;
    v70[2] = 0x3032000000LL;
    v70[3] = sub_19D58;
    v70[4] = sub_19D68;
    id v71 = 0LL;
    uint64_t v66 = 0LL;
    v67 = &v66;
    uint64_t v68 = 0x2020000000LL;
    char v69 = 0;
    uint64_t v62 = 0LL;
    v63 = &v62;
    uint64_t v64 = 0x2020000000LL;
    char v65 = 0;
    double v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    double v11 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
    v55[0] = _NSConcreteStackBlock;
    v55[1] = 3221225472LL;
    v55[2] = sub_19D70;
    v55[3] = &unk_88E80;
    v56 = @"'’׳״-";
    v57 = self;
    id v12 = v10;
    id v58 = v12;
    v59 = v70;
    v60 = &v66;
    BOOL v61 = &v62;
    [v11 enumerateRemainingLongCharactersForCurrentSegment:v55];

    if (*((_BYTE *)v63 + 24) || !*((_BYTE *)v67 + 24))
    {
      double v13 = 0LL;
    }

    else
    {
      -[_ACTUserActionStream lastTimestamp](self, "lastTimestamp");
      double v15 = v14;
      -[_ACTUserActionStream randomActionInterval](self, "randomActionInterval");
      double v17 = v16;
      double v18 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream delegate](self, "delegate"));
      v50 = (void *)objc_claimAutoreleasedReturnValue([v18 keyboardController]);

      double v19 = (void *)objc_claimAutoreleasedReturnValue([v50 layoutUtils]);
      double v20 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream delegate](self, "delegate"));
      double v21 = (void *)objc_claimAutoreleasedReturnValue([v20 keyplane]);
      double v22 = (void *)objc_claimAutoreleasedReturnValue([v19 createTTKPlane:v21]);

      double v23 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream userPathManager](self, "userPathManager"));
      if (!v23) {
        goto LABEL_16;
      }
      double v24 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream userPathManager](self, "userPathManager"));
      double v25 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream delegate](self, "delegate"));
      double v26 = (void *)objc_claimAutoreleasedReturnValue([v25 keyboardController]);
      float v27 = (void *)objc_claimAutoreleasedReturnValue([v24 lookup:v4 keyboardController:v26]);

      if (v27)
      {
        uint64_t v28 = 1LL;
      }

      else
      {
LABEL_16:
        double v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
        __int128 v53 = 0u;
        __int128 v54 = 0u;
        __int128 v51 = 0u;
        __int128 v52 = 0u;
        id v33 = v12;
        id v34 = [v33 countByEnumeratingWithState:&v51 objects:v72 count:16];
        if (v34)
        {
          uint64_t v35 = *(void *)v52;
          do
          {
            for (i = 0LL; i != v34; i = (char *)i + 1)
            {
              if (*(void *)v52 != v35) {
                objc_enumerationMutation(v33);
              }
              [v32 appendString:v37];
            }

            id v34 = [v33 countByEnumeratingWithState:&v51 objects:v72 count:16];
          }

          while (v34);
        }

        double v38 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream pathGenerator](self, "pathGenerator"));
        float v27 = (void *)objc_claimAutoreleasedReturnValue([v38 generatePathFromString:v32 layout:v22]);

        uint64_t v28 = 0LL;
      }

      double v39 = -[ACTPathWord initWithPath:intendedString:keyplane:fromUserData:]( objc_alloc(&OBJC_CLASS___ACTPathWord),  "initWithPath:intendedString:keyplane:fromUserData:",  v27,  v4,  v22,  v28);
      double v40 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
      -[ACTUserAction setInputSegment:](v39, "setInputSegment:", [v40 segmentCursor]);

      -[_ACTUserActionStream setLastTimestamp:](self, "setLastTimestamp:", v15 + v17);
      -[_ACTUserActionStream setLastActionUseSecondaryString:](self, "setLastActionUseSecondaryString:", 0LL);
      unint64_t v41 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
      double v42 = (void *)objc_claimAutoreleasedReturnValue([v41 currentInternalSegment]);
      uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
      id v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "substringFromIndex:", objc_msgSend(v43, "positionInCurrentInternalSegment")));

      -[_ACTUserActionStream advancePositionByString:](self, "advancePositionByString:", v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream userModel](self, "userModel"));
      LODWORD(v41) = [v45 expectsAppendedSpaceToContinuousPath];

      if ((_DWORD)v41)
      {
        v46 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
        id v47 = (void *)objc_claimAutoreleasedReturnValue([v46 currentInternalSegment]);
        unsigned int v48 = [v47 isEqualToString:@" "];

        if (v48) {
          -[_ACTUserActionStream advancePositionByString:](self, "advancePositionByString:", @" ");
        }
      }

      double v13 = v39;
    }

    _Block_object_dispose(&v62, 8);
    _Block_object_dispose(&v66, 8);
    _Block_object_dispose(v70, 8);
  }

  else
  {
    if (v9) {
      -[_ACTUserActionStream rewindSegmentCursor](self, "rewindSegmentCursor");
    }
    double v13 = 0LL;
  }

  return v13;
}

- (id)tryChangeKeyplane
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
  double v4 = (void *)objc_claimAutoreleasedReturnValue([v3 currentLongCharacter]);

  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream delegate](self, "delegate"));
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v5 shiftKeyToAccessKeyplaneCloserToKeyString:v4]);

  if (v6)
  {
    -[_ACTUserActionStream setLastActionUseSecondaryString:](self, "setLastActionUseSecondaryString:", 1LL);
  }

  else
  {
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream delegate](self, "delegate"));
    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v7 keyToAccessKeyplaneCloserToKeyString:v4]);

    if (!v6)
    {
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream delegate](self, "delegate"));
      double v29 = (void *)objc_claimAutoreleasedReturnValue([v28 keyboardController]);
      double v30 = (void *)objc_claimAutoreleasedReturnValue([v29 layoutUtils]);
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v30 baseKeyForString:v4]);

      if (v31)
      {
        double v32 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream delegate](self, "delegate"));
        unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v32 keyToAccessKeyplaneCloserToKeyString:v31]);

        if (v6) {
          goto LABEL_4;
        }
      }

      else
      {
        unsigned __int8 v6 = 0LL;
      }

      double v25 = 0LL;
      goto LABEL_10;
    }
  }

- (id)trySelectPopupVariant
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
  double v4 = (void *)objc_claimAutoreleasedReturnValue([v3 currentComposedCharacter]);

  if (v4
    || (double v5 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor")),
        double v4 = (void *)objc_claimAutoreleasedReturnValue([v5 currentLongCharacter]),
        v5,
        v4))
  {
    -[_ACTUserActionStream lastTimestamp](self, "lastTimestamp");
    double v7 = v6;
    -[_ACTUserActionStream randomActionInterval](self, "randomActionInterval");
    double v9 = v7 + v8;
    -[_ACTUserActionStream setLastTimestamp:](self, "setLastTimestamp:", v9);
    double v10 = -[ACTSelectPopupVariant initWithIntendedKey:timestamp:]( objc_alloc(&OBJC_CLASS___ACTSelectPopupVariant),  "initWithIntendedKey:timestamp:",  v4,  v9);
    if (v10)
    {
      double v11 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
      -[ACTUserAction setInputSegment:](v10, "setInputSegment:", [v11 segmentCursor]);

      -[_ACTUserActionStream advancePositionByString:](self, "advancePositionByString:", v4);
    }
  }

  else
  {
    double v10 = 0LL;
  }

  return v10;
}

- (ACTUserActionStreamDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (ACTUserActionStreamDelegate *)a3;
}

- (TIErrorGenerator)errorGenerator
{
  return self->_errorGenerator;
}

- (void)setErrorGenerator:(id)a3
{
}

- (TIKeyboardTyperUserModel)userModel
{
  return self->_userModel;
}

- (void)setUserModel:(id)a3
{
}

- (unsigned)randomNumberSeed
{
  return self->_randomNumberSeed;
}

- (ACTUserMentalCursor)cursor
{
  return self->_cursor;
}

- (void)setCursor:(id)a3
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

- (BOOL)isBackspacing
{
  return self->_isBackspacing;
}

- (void)setIsBackspacing:(BOOL)a3
{
  self->_isBackspacing = a3;
}

- (unint64_t)segmentCursorBeforeBackspacing
{
  return self->_segmentCursorBeforeBackspacing;
}

- (void)setSegmentCursorBeforeBackspacing:(unint64_t)a3
{
  self->_segmentCursorBeforeBackspacing = a3;
}

- (unint64_t)segmentEditHorizon
{
  return self->_segmentEditHorizon;
}

- (void)setSegmentEditHorizon:(unint64_t)a3
{
  self->_segmentEditHorizon = a3;
}

- (int64_t)lastCursorPositionForTransliteratedCandidate
{
  return self->_lastCursorPositionForTransliteratedCandidate;
}

- (void)setLastCursorPositionForTransliteratedCandidate:(int64_t)a3
{
  self->_lastCursorPositionForTransliteratedCandidate = a3;
}

- (BOOL)lastActionSuppressesError
{
  return self->_lastActionSuppressesError;
}

- (void)setLastActionSuppressesError:(BOOL)a3
{
  self->_lastActionSuppressesError = a3;
}

- (BOOL)lastActionUseSecondaryString
{
  return self->_lastActionUseSecondaryString;
}

- (void)setLastActionUseSecondaryString:(BOOL)a3
{
  self->_lastActionUseSecondaryString = a3;
}

- (TTKDefaultContinuousPathGenerator)pathGenerator
{
  return self->_pathGenerator;
}

- (void)setPathGenerator:(id)a3
{
}

- (UserPathManager)userPathManager
{
  return self->_userPathManager;
}

- (void)setUserPathManager:(id)a3
{
}

- (NSString)partialCandidateSuffix
{
  return self->_partialCandidateSuffix;
}

- (void)setPartialCandidateSuffix:(id)a3
{
}

- (NSString)partialCandidateIntendedChunk
{
  return self->_partialCandidateIntendedChunk;
}

- (void)setPartialCandidateIntendedChunk:(id)a3
{
}

- (void).cxx_destruct
{
}

@end