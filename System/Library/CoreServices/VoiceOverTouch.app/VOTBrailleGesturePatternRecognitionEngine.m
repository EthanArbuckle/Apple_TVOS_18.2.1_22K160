@interface VOTBrailleGesturePatternRecognitionEngine
- (BOOL)_bothObjectsAreNilOrBothAreNonNil:(id)a3 object:(id)a4;
- (BOOL)_halfPattern:(id)a3 hasSameDotsAsHalfPattern:(id)a4;
- (BOOL)areDotNumberPositionsCalibrated;
- (BOOL)shouldReverseDots;
- (BOOL)shouldUseEightDotBraille;
- (CGPoint)_averageOfOldPoint:(CGPoint)a3 newPoint:(CGPoint)a4 dataCount:(unint64_t)a5;
- (VOTBrailleGesturePatternRecognitionEngine)init;
- (VOTBrailleGesturePatternRecognitionEngineDelegate)delegate;
- (double)_averageOfOldFloat:(double)a3 newFloat:(double)a4 dataCount:(unint64_t)a5;
- (double)_distanceBetweenPoint:(CGPoint)a3 andPoint:(CGPoint)a4;
- (double)_totalDistanceBetweenCorrespondingPointsInTouches:(id)a3 andTouches:(id)a4;
- (id)_averagePointValueWithDataCount:(unint64_t)a3 currentPointValue:(id)a4 newPointValue:(id)a5;
- (id)_closestHalfPatternForOrderedTouches:(id)a3 possibleMatches:(id)a4 side:(unint64_t)a5;
- (id)_halfPatternFromOrderedTouches:(id)a3 correspondingHalfPattern:(id)a4;
- (id)_halfPatternFromTouches:(id)a3 side:(unint64_t)a4;
- (id)_orderedTouchesFromHalfPattern:(id)a3;
- (id)_sortTouches:(id)a3 fromTopToBottomForSide:(unint64_t)a4;
- (id)dotNumberPositions;
- (id)printBrailleForTouchPoints:(id)a3 shouldLearn:(BOOL)a4 error:(id *)a5;
- (unsigned)printBrailleCharacterFromBraillePattern:(id)a3;
- (void)_populateLeftTouchPoints:(id)a3 rightTouchPoints:(id)a4 fromTouchPoints:(id)a5;
- (void)calibrateWithTouchPoints:(id)a3;
- (void)resetLastGestures;
- (void)savePersistentGestureData;
- (void)setDelegate:(id)a3;
- (void)setTypingMode:(int64_t)a3 keyboardSize:(CGSize)a4 shouldUseEightDotBraille:(BOOL)a5 shouldReverseDots:(BOOL)a6;
- (void)unlearnLastGesture;
@end

@implementation VOTBrailleGesturePatternRecognitionEngine

- (VOTBrailleGesturePatternRecognitionEngine)init
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___VOTBrailleGesturePatternRecognitionEngine;
  v2 = -[VOTBrailleGesturePatternRecognitionEngine init](&v16, "init");
  v3 = v2;
  if (v2)
  {
    v2->_typingMode = 1LL;
    *(_WORD *)&v2->_shouldUseEightDotBraille = 0;
    v4 = objc_alloc(&OBJC_CLASS___VOTBrailleGestureDataRepository);
    v5 = -[VOTBrailleGestureDataRepository initWithTypingMode:keyboardSize:shouldUseEightDotBraille:]( v4,  "initWithTypingMode:keyboardSize:shouldUseEightDotBraille:",  v3->_typingMode,  0LL,  xmmword_1001AD170);
    repository = v3->_repository;
    v3->_repository = v5;

    uint64_t v9 = VOTLogBrailleGestures(v7, v8);
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = NSStringFromCGSize((CGSize)xmmword_1001AD170);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      *(_DWORD *)buf = 138412290;
      v18 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "initializing gesture repo with: %@",  buf,  0xCu);
    }

    v13 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    lastBrailleGestures = v3->_lastBrailleGestures;
    v3->_lastBrailleGestures = v13;
  }

  return v3;
}

- (id)printBrailleForTouchPoints:(id)a3 shouldLearn:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  -[VOTBrailleGesturePatternRecognitionEngine _populateLeftTouchPoints:rightTouchPoints:fromTouchPoints:]( self,  "_populateLeftTouchPoints:rightTouchPoints:fromTouchPoints:",  v9,  v10,  v8);

  if (self->_shouldUseEightDotBraille) {
    unint64_t v11 = 4LL;
  }
  else {
    unint64_t v11 = 3LL;
  }
  if ((unint64_t)[v9 count] <= v11 && (unint64_t)objc_msgSend(v10, "count") <= v11)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue( -[VOTBrailleGesturePatternRecognitionEngine _halfPatternFromTouches:side:]( self,  "_halfPatternFromTouches:side:",  v9,  0LL));
    v14 = (void *)objc_claimAutoreleasedReturnValue( -[VOTBrailleGesturePatternRecognitionEngine _halfPatternFromTouches:side:]( self,  "_halfPatternFromTouches:side:",  v10,  1LL));
    v15 = -[VOTBrailleGesturePattern initWithLeftDots:rightDots:]( objc_alloc(&OBJC_CLASS___VOTBrailleGesturePattern),  "initWithLeftDots:rightDots:",  v13,  v14);
    if (v6)
    {
      -[VOTBrailleGestureDataRepository updateDriftWithPattern:](self->_repository, "updateDriftWithPattern:", v15);
      -[NSMutableArray addObject:](self->_lastBrailleGestures, "addObject:", v15);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%C",  -[VOTBrailleGesturePatternRecognitionEngine printBrailleCharacterFromBraillePattern:]( self,  "printBrailleCharacterFromBraillePattern:",  v15)));
  }

  else
  {
    v12 = 0LL;
    if (a5) {
      *a5 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"VOTBrailleGestureErrorDomain",  1LL,  0LL));
    }
  }

  return v12;
}

- (void)unlearnLastGesture
{
  if (-[NSMutableArray count](self->_lastBrailleGestures, "count"))
  {
    repository = self->_repository;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_lastBrailleGestures, "lastObject"));
    -[VOTBrailleGestureDataRepository removeDriftAddedByPattern:](repository, "removeDriftAddedByPattern:", v4);

    -[NSMutableArray removeLastObject](self->_lastBrailleGestures, "removeLastObject");
  }

- (void)resetLastGestures
{
}

- (void)savePersistentGestureData
{
}

- (void)setTypingMode:(int64_t)a3 keyboardSize:(CGSize)a4 shouldUseEightDotBraille:(BOOL)a5 shouldReverseDots:(BOOL)a6
{
  BOOL v7 = a5;
  double height = a4.height;
  double width = a4.width;
  if (self->_typingMode != a3
    || (self->_keyboardSize.width == a4.width ? (BOOL v12 = self->_keyboardSize.height == a4.height) : (BOOL v12 = 0),
        !v12 || self->_shouldUseEightDotBraille != a5 || self->_shouldReverseDots != a6))
  {
    -[VOTBrailleGesturePatternRecognitionEngine resetLastGestures](self, "resetLastGestures");
    -[VOTBrailleGestureDataRepository saveDrift](self->_repository, "saveDrift");
    self->_typingMode = a3;
    self->_keyboardSize.double width = width;
    self->_keyboardSize.double height = height;
    self->_shouldUseEightDotBraille = v7;
    self->_shouldReverseDots = a6;
    v13 = -[VOTBrailleGestureDataRepository initWithTypingMode:keyboardSize:shouldUseEightDotBraille:]( objc_alloc(&OBJC_CLASS___VOTBrailleGestureDataRepository),  "initWithTypingMode:keyboardSize:shouldUseEightDotBraille:",  self->_typingMode,  v7,  width,  height);
    repository = self->_repository;
    self->_repository = v13;
  }

- (id)dotNumberPositions
{
  return -[VOTBrailleGestureDataRepository dotNumberPositions](self->_repository, "dotNumberPositions");
}

- (void)calibrateWithTouchPoints:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  -[VOTBrailleGesturePatternRecognitionEngine _populateLeftTouchPoints:rightTouchPoints:fromTouchPoints:]( self,  "_populateLeftTouchPoints:rightTouchPoints:fromTouchPoints:",  v5,  v6,  v4);

  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue( -[VOTBrailleGesturePatternRecognitionEngine _sortTouches:fromTopToBottomForSide:]( self,  "_sortTouches:fromTopToBottomForSide:",  v5,  0LL));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[VOTBrailleGesturePatternRecognitionEngine _sortTouches:fromTopToBottomForSide:]( self,  "_sortTouches:fromTopToBottomForSide:",  v6,  1LL));
  BOOL shouldUseEightDotBraille = self->_shouldUseEightDotBraille;
  id v10 = [v7 count];
  if (!shouldUseEightDotBraille)
  {
    if (v10 == (id)3 && [v8 count] == (id)3)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndexedSubscript:0]);
      v28[0] = v27;
      v26 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndexedSubscript:1]);
      v28[1] = v26;
      v18 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndexedSubscript:2]);
      v28[2] = v18;
      v19 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:0]);
      v28[3] = v19;
      v20 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:1]);
      v28[4] = v20;
      v21 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:2]);
      v28[5] = v21;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v28, 6LL));

      goto LABEL_9;
    }

    objc_super v16 = @"Should have had three points on each side, but had left points %@, right points %@";
    v22 = v7;
    v23 = v8;
    uint64_t v17 = 130LL;
LABEL_11:
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/VoiceOverTouch/Sources/VOTBrailleGesturePatternRecognitionEngine.m",  v17,  "-[VOTBrailleGesturePatternRecognitionEngine calibrateWithTouchPoints:]",  v16);
    v15 = 0LL;
    goto LABEL_12;
  }

  if (v10 != (id)4 || [v8 count] != (id)4)
  {
    objc_super v16 = @"Should have had four points on each side, but had left points %@, right points %@";
    v22 = v7;
    v23 = v8;
    uint64_t v17 = 121LL;
    goto LABEL_11;
  }

  v27 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndexedSubscript:0]);
  v29[0] = v27;
  v26 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndexedSubscript:1]);
  v29[1] = v26;
  v25 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndexedSubscript:2]);
  v29[2] = v25;
  v24 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:0]);
  v29[3] = v24;
  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:1]);
  v29[4] = v11;
  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:2]);
  v29[5] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndexedSubscript:3]);
  v29[6] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:3]);
  v29[7] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v29, 8LL));

LABEL_9:
LABEL_12:
  -[VOTBrailleGestureDataRepository calibrateWithDotNumberPositions:]( self->_repository,  "calibrateWithDotNumberPositions:",  v15,  v22,  v23);
}

- (BOOL)shouldUseEightDotBraille
{
  return self->_shouldUseEightDotBraille;
}

- (BOOL)shouldReverseDots
{
  return self->_shouldReverseDots;
}

- (BOOL)areDotNumberPositionsCalibrated
{
  return -[VOTBrailleGestureDataRepository areDotNumberPositionsCalibrated]( self->_repository,  "areDotNumberPositionsCalibrated");
}

- (void)_populateLeftTouchPoints:(id)a3 rightTouchPoints:(id)a4 fromTouchPoints:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double width = self->_keyboardSize.width;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v12 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v12)
  {
    id v13 = v12;
    double v14 = width * 0.5;
    uint64_t v15 = *(void *)v25;
    do
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v25 != v15) {
          objc_enumerationMutation(v10);
        }
        uint64_t v17 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)i);
        objc_msgSend(v17, "ax_CGPointValue");
        int64_t typingMode = self->_typingMode;
        BOOL v20 = typingMode == 1;
        if (typingMode == 1) {
          id v21 = v8;
        }
        else {
          id v21 = v9;
        }
        if (v20) {
          id v22 = v9;
        }
        else {
          id v22 = v8;
        }
        if (v18 >= v14) {
          v23 = v22;
        }
        else {
          v23 = v21;
        }
        [v23 addObject:v17];
      }

      id v13 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }

    while (v13);
  }
}

- (unsigned)printBrailleCharacterFromBraillePattern:(id)a3
{
  id v4 = a3;
  unsigned int v5 = -[VOTBrailleGesturePatternRecognitionEngine shouldUseEightDotBraille](self, "shouldUseEightDotBraille");
  unsigned int v6 = -[VOTBrailleGesturePatternRecognitionEngine shouldReverseDots](self, "shouldReverseDots");
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v4 leftDots]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 topDot]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 leftDots]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 middleDot]);

  if (v5)
  {
    if (v6) {
      __int16 v11 = 10304;
    }
    else {
      __int16 v11 = 10241;
    }
    if (v6) {
      __int16 v12 = 4;
    }
    else {
      __int16 v12 = 2;
    }
    if (v6) {
      __int16 v13 = 2;
    }
    else {
      __int16 v13 = 4;
    }
    if (v6) {
      __int16 v14 = 1;
    }
    else {
      __int16 v14 = 64;
    }
    if (v6) {
      __int16 v15 = 128;
    }
    else {
      __int16 v15 = 8;
    }
    if (v6) {
      __int16 v16 = 32;
    }
    else {
      __int16 v16 = 16;
    }
    if (v6) {
      __int16 v17 = 16;
    }
    else {
      __int16 v17 = 32;
    }
    if (!v8) {
      __int16 v11 = 10240;
    }
    if (v10) {
      __int16 v18 = v12;
    }
    else {
      __int16 v18 = 0;
    }
    __int16 v19 = v18 | v11;
    BOOL v20 = (void *)objc_claimAutoreleasedReturnValue([v4 leftDots]);
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 bottomDot]);

    if (!v21) {
      __int16 v13 = 0;
    }
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v4 leftDots]);
    v23 = (void *)objc_claimAutoreleasedReturnValue([v22 fourthDot]);

    if (v23) {
      __int16 v24 = v14;
    }
    else {
      __int16 v24 = 0;
    }
    __int16 v25 = v19 + v13 + v24;
    __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v4 rightDots]);
    __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v26 topDot]);

    if (v27) {
      __int16 v28 = v15;
    }
    else {
      __int16 v28 = 0;
    }
    v29 = (void *)objc_claimAutoreleasedReturnValue([v4 rightDots]);
    v30 = (void *)objc_claimAutoreleasedReturnValue([v29 middleDot]);

    if (v30) {
      __int16 v31 = v16;
    }
    else {
      __int16 v31 = 0;
    }
    __int16 v32 = v28 + v31;
    v33 = (void *)objc_claimAutoreleasedReturnValue([v4 rightDots]);
    v34 = (void *)objc_claimAutoreleasedReturnValue([v33 bottomDot]);

    if (v34) {
      __int16 v35 = v17;
    }
    else {
      __int16 v35 = 0;
    }
    unsigned __int16 v36 = v25 + v32 + v35;
    v37 = (void *)objc_claimAutoreleasedReturnValue([v4 rightDots]);

    v38 = (void *)objc_claimAutoreleasedReturnValue([v37 fourthDot]);
    if (v38)
    {
      if (v6) {
        __int16 v39 = 8;
      }
      else {
        __int16 v39 = 128;
      }
      v36 += v39;
    }
  }

  else
  {
    if (v6) {
      __int16 v40 = 10244;
    }
    else {
      __int16 v40 = 10241;
    }
    if (v6) {
      __int16 v41 = 1;
    }
    else {
      __int16 v41 = 4;
    }
    if (v6) {
      __int16 v42 = 32;
    }
    else {
      __int16 v42 = 8;
    }
    if (!v8) {
      __int16 v40 = 10240;
    }
    if (v10) {
      __int16 v43 = v40 | 2;
    }
    else {
      __int16 v43 = v40;
    }
    v44 = (void *)objc_claimAutoreleasedReturnValue([v4 leftDots]);
    v45 = (void *)objc_claimAutoreleasedReturnValue([v44 bottomDot]);

    if (!v45) {
      __int16 v41 = 0;
    }
    v46 = (void *)objc_claimAutoreleasedReturnValue([v4 rightDots]);
    v47 = (void *)objc_claimAutoreleasedReturnValue([v46 topDot]);

    if (v47) {
      __int16 v48 = v42;
    }
    else {
      __int16 v48 = 0;
    }
    unsigned __int16 v49 = v41 + v48 + v43;
    v50 = (void *)objc_claimAutoreleasedReturnValue([v4 rightDots]);
    v51 = (void *)objc_claimAutoreleasedReturnValue([v50 middleDot]);

    if (v51) {
      unsigned __int16 v36 = v49 + 16;
    }
    else {
      unsigned __int16 v36 = v49;
    }
    v52 = (void *)objc_claimAutoreleasedReturnValue([v4 rightDots]);

    v53 = (void *)objc_claimAutoreleasedReturnValue([v52 bottomDot]);
    if (v6) {
      __int16 v54 = 8;
    }
    else {
      __int16 v54 = 32;
    }
    unsigned __int16 v55 = v36 + v54;
    if (v53) {
      return v55;
    }
  }

  return v36;
}

- (id)_halfPatternFromTouches:(id)a3 side:(unint64_t)a4
{
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue( -[VOTBrailleGesturePatternRecognitionEngine _sortTouches:fromTopToBottomForSide:]( self,  "_sortTouches:fromTopToBottomForSide:",  a3));
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue( -[VOTBrailleGestureDataRepository halfPatternsForNumberOfDots:side:]( self->_repository,  "halfPatternsForNumberOfDots:side:",  [v6 count],  a4));
  if ([v7 count] == (id)1) {
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 firstObject]);
  }
  else {
    uint64_t v8 = objc_claimAutoreleasedReturnValue( -[VOTBrailleGesturePatternRecognitionEngine _closestHalfPatternForOrderedTouches:possibleMatches:side:]( self,  "_closestHalfPatternForOrderedTouches:possibleMatches:side:",  v6,  v7,  a4));
  }
  id v9 = (void *)v8;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[VOTBrailleGesturePatternRecognitionEngine _halfPatternFromOrderedTouches:correspondingHalfPattern:]( self,  "_halfPatternFromOrderedTouches:correspondingHalfPattern:",  v6,  v8));

  return v10;
}

- (id)_closestHalfPatternForOrderedTouches:(id)a3 possibleMatches:(id)a4 side:(unint64_t)a5
{
  id v7 = a3;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id obj = a4;
  id v8 = [obj countByEnumeratingWithState:&v28 objects:v40 count:16];
  if (v8)
  {
    id v10 = v8;
    __int16 v11 = 0LL;
    uint64_t v12 = *(void *)v29;
    double v13 = 1.79769313e308;
    *(void *)&__int128 v9 = 138544130LL;
    __int128 v26 = v9;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v29 != v12) {
          objc_enumerationMutation(obj);
        }
        __int16 v15 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
        __int16 v16 = (void *)objc_claimAutoreleasedReturnValue( -[VOTBrailleGesturePatternRecognitionEngine _orderedTouchesFromHalfPattern:]( self,  "_orderedTouchesFromHalfPattern:",  v15,  v26));
        -[VOTBrailleGesturePatternRecognitionEngine _totalDistanceBetweenCorrespondingPointsInTouches:andTouches:]( self,  "_totalDistanceBetweenCorrespondingPointsInTouches:andTouches:",  v7,  v16);
        double v18 = v17;

        uint64_t v21 = VOTLogBrailleGestures(v19, v20);
        id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue( -[VOTBrailleGesturePatternRecognitionEngine _orderedTouchesFromHalfPattern:]( self,  "_orderedTouchesFromHalfPattern:",  v15));
          *(_DWORD *)buf = v26;
          id v33 = v7;
          __int16 v34 = 2114;
          __int16 v35 = v15;
          __int16 v36 = 2114;
          v37 = v23;
          __int16 v38 = 2048;
          double v39 = v18;
          _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_INFO,  "Distance between %{public}@ and %{public}@ (with ordered touches %{public}@) was %f.",  buf,  0x2Au);
        }

        if (v18 < v13)
        {
          id v24 = v15;

          double v13 = v18;
          __int16 v11 = v24;
        }
      }

      id v10 = [obj countByEnumeratingWithState:&v28 objects:v40 count:16];
    }

    while (v10);
  }

  else
  {
    __int16 v11 = 0LL;
  }

  return v11;
}

- (id)_halfPatternFromOrderedTouches:(id)a3 correspondingHalfPattern:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(&OBJC_CLASS___VOTBrailleGestureHalfPattern);
  uint64_t v8 = objc_claimAutoreleasedReturnValue([v6 topDot]);

  if (v8)
  {
    __int128 v9 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:0]);
    -[VOTBrailleGestureHalfPattern setTopDot:](v7, "setTopDot:", v9);

    uint64_t v8 = 1LL;
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 middleDot]);

  if (v10)
  {
    uint64_t v11 = v8 + 1;
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:v8]);
    -[VOTBrailleGestureHalfPattern setMiddleDot:](v7, "setMiddleDot:", v12);

    uint64_t v8 = v11;
  }

  double v13 = (void *)objc_claimAutoreleasedReturnValue([v6 bottomDot]);

  if (v13)
  {
    uint64_t v14 = v8 + 1;
    __int16 v15 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:v8]);
    -[VOTBrailleGestureHalfPattern setBottomDot:](v7, "setBottomDot:", v15);

    uint64_t v8 = v14;
  }

  __int16 v16 = (void *)objc_claimAutoreleasedReturnValue([v6 fourthDot]);

  if (v16)
  {
    double v17 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:v8]);
    -[VOTBrailleGestureHalfPattern setFourthDot:](v7, "setFourthDot:", v17);
  }

  return v7;
}

- (double)_totalDistanceBetweenCorrespondingPointsInTouches:(id)a3 andTouches:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    unint64_t v8 = 0LL;
    double v9 = 0.0;
    do
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndexedSubscript:v8]);
      [v10 CGPointValue];
      double v12 = v11;
      double v14 = v13;
      __int16 v15 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndexedSubscript:v8]);
      [v15 CGPointValue];
      -[VOTBrailleGesturePatternRecognitionEngine _distanceBetweenPoint:andPoint:]( self,  "_distanceBetweenPoint:andPoint:",  v12,  v14,  v16,  v17);
      double v9 = v9 + v18;

      ++v8;
    }

    while ((unint64_t)[v6 count] > v8);
  }

  else
  {
    double v9 = 0.0;
  }

  return v9;
}

- (id)_orderedTouchesFromHalfPattern:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 3LL));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 topDot]);

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 topDot]);
    [v4 addObject:v6];
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 middleDot]);

  if (v7)
  {
    unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v3 middleDot]);
    [v4 addObject:v8];
  }

  double v9 = (void *)objc_claimAutoreleasedReturnValue([v3 bottomDot]);

  if (v9)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v3 bottomDot]);
    [v4 addObject:v10];
  }

  double v11 = (void *)objc_claimAutoreleasedReturnValue([v3 fourthDot]);

  if (v11)
  {
    double v12 = (void *)objc_claimAutoreleasedReturnValue([v3 fourthDot]);
    [v4 addObject:v12];
  }

  return v4;
}

- (double)_distanceBetweenPoint:(CGPoint)a3 andPoint:(CGPoint)a4
{
  return sqrt((a3.x - a4.x) * (a3.x - a4.x) + (a3.y - a4.y) * (a3.y - a4.y));
}

- (id)_sortTouches:(id)a3 fromTopToBottomForSide:(unint64_t)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000CD918;
  v5[3] = &unk_100179C30;
  v5[4] = self;
  v5[5] = a4;
  return (id)objc_claimAutoreleasedReturnValue([a3 sortedArrayUsingComparator:v5]);
}

- (BOOL)_halfPattern:(id)a3 hasSameDotsAsHalfPattern:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 topDot]);
  double v9 = (void *)objc_claimAutoreleasedReturnValue([v7 topDot]);
  if (-[VOTBrailleGesturePatternRecognitionEngine _bothObjectsAreNilOrBothAreNonNil:object:]( self,  "_bothObjectsAreNilOrBothAreNonNil:object:",  v8,  v9))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 middleDot]);
    double v11 = (void *)objc_claimAutoreleasedReturnValue([v7 middleDot]);
    if (-[VOTBrailleGesturePatternRecognitionEngine _bothObjectsAreNilOrBothAreNonNil:object:]( self,  "_bothObjectsAreNilOrBothAreNonNil:object:",  v10,  v11))
    {
      double v12 = (void *)objc_claimAutoreleasedReturnValue([v6 bottomDot]);
      double v13 = (void *)objc_claimAutoreleasedReturnValue([v7 bottomDot]);
      BOOL v14 = -[VOTBrailleGesturePatternRecognitionEngine _bothObjectsAreNilOrBothAreNonNil:object:]( self,  "_bothObjectsAreNilOrBothAreNonNil:object:",  v12,  v13);
    }

    else
    {
      BOOL v14 = 0;
    }
  }

  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)_bothObjectsAreNilOrBothAreNonNil:(id)a3 object:(id)a4
{
  if (a3) {
    BOOL v4 = a4 == 0LL;
  }
  else {
    BOOL v4 = 1;
  }
  BOOL v5 = !v4;
  return !((unint64_t)a3 | (unint64_t)a4) || v5;
}

- (id)_averagePointValueWithDataCount:(unint64_t)a3 currentPointValue:(id)a4 newPointValue:(id)a5
{
  id v8 = a5;
  double v9 = v8;
  if (a4)
  {
    objc_msgSend(a4, "ax_CGPointValue");
    double v11 = v10;
    double v13 = v12;
    objc_msgSend(v9, "ax_CGPointValue");
    -[VOTBrailleGesturePatternRecognitionEngine _averageOfOldPoint:newPoint:dataCount:]( self,  "_averageOfOldPoint:newPoint:dataCount:",  a3,  v11,  v13,  v14,  v15);
    id v16 = (id)objc_claimAutoreleasedReturnValue(+[NSValue ax_valueWithCGPoint:](&OBJC_CLASS___NSValue, "ax_valueWithCGPoint:"));
  }

  else
  {
    id v16 = v8;
  }

  double v17 = v16;

  return v17;
}

- (CGPoint)_averageOfOldPoint:(CGPoint)a3 newPoint:(CGPoint)a4 dataCount:(unint64_t)a5
{
  double y = a4.y;
  double v7 = a3.y;
  -[VOTBrailleGesturePatternRecognitionEngine _averageOfOldFloat:newFloat:dataCount:]( self,  "_averageOfOldFloat:newFloat:dataCount:",  a3.x,  a4.x);
  double v10 = v9;
  -[VOTBrailleGesturePatternRecognitionEngine _averageOfOldFloat:newFloat:dataCount:]( self,  "_averageOfOldFloat:newFloat:dataCount:",  a5,  v7,  y);
  double v12 = v11;
  double v13 = v10;
  result.double y = v12;
  result.x = v13;
  return result;
}

- (double)_averageOfOldFloat:(double)a3 newFloat:(double)a4 dataCount:(unint64_t)a5
{
  return (float)(1.0 / (float)((float)a5 + 1.0)) * a4 + a3 * (float)((float)a5 / (float)((float)a5 + 1.0));
}

- (VOTBrailleGesturePatternRecognitionEngineDelegate)delegate
{
  return (VOTBrailleGesturePatternRecognitionEngineDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end