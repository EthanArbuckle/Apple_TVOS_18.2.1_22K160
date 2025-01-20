@interface VOTBrailleGestureDataRepository
- (BOOL)_allDotsAreOnScreen:(id)a3 withDrift:(CGPoint)a4;
- (BOOL)areDotNumberPositionsCalibrated;
- (BOOL)saveDrift;
- (CGPoint)_averageLeftDrift;
- (CGPoint)_averageRecentDriftFromDrifts:(id)a3;
- (CGPoint)_averageRightDrift;
- (CGPoint)_driftByAddingDisplacementOfPointValue:(id)a3 fromPointValue:(id)a4 toDrift:(CGPoint)a5;
- (CGPoint)_driftOfHalfPattern:(id)a3 relativeToDotPositions:(id)a4;
- (NSMutableArray)leftDrifts;
- (NSMutableArray)rightDrifts;
- (VOTBrailleGestureDataRepository)initWithTypingMode:(int64_t)a3 keyboardSize:(CGSize)a4 shouldUseEightDotBraille:(BOOL)a5;
- (VOTBrailleGestureHalfPattern)leftDotPositions;
- (VOTBrailleGestureHalfPattern)rightDotPositions;
- (id)_adjustPointValue:(id)a3 withDrift:(CGPoint)a4;
- (id)_arrayOfDictionariesFromPointValues:(id)a3;
- (id)_calibratedDotPositionsFilePath;
- (id)_filenameSuffix;
- (id)_gestureDataDirectory;
- (id)_loadDataFromFile:(id)a3;
- (id)_mutableArrayOfPointValuesFromDictionaries:(id)a3;
- (id)_mutableArrayOfZeroPointValues:(unint64_t)a3;
- (id)_recordedDriftsFilePath;
- (id)dotNumberPositions;
- (id)halfPatternsForNumberOfDots:(unint64_t)a3 side:(unint64_t)a4;
- (unint64_t)_totalNumberOfDots;
- (void)_addInstanceOfDrift:(CGPoint)a3 toArray:(id)a4 forPattern:(id)a5;
- (void)_appendDots:(id)a3 toPositionsArray:(id)a4 withDrift:(CGPoint)a5;
- (void)_deleteCalibratedData;
- (void)_generateInitialData;
- (void)_generateScreenAwayInitialData;
- (void)_generateTableTopInitialData;
- (void)_getEightDotTableTopMiddleLeftDot:(CGPoint *)a3 middleRightDot:(CGPoint *)a4 bottomLeftDot:(CGPoint *)a5 bottomRightDot:(CGPoint *)a6 angleFromXAxisToLineOfHand:(double)a7 topLeftDot:(CGPoint)a8;
- (void)_getMiddleDotsForSixDotTableTopInitialDataForLeft:(CGPoint *)a3 right:(CGPoint *)a4 angleFromXAxisToLineOfHand:(double)a5 topLeftDot:(CGPoint)a6;
- (void)_loadAllDataFromFiles;
- (void)_orderedLeftDots:(id *)a3 rightDots:(id *)a4;
- (void)_removeInstanceOfDriftFromArray:(id)a3;
- (void)_repairFileProtectionClassOnPathIfNecessary:(id)a3;
- (void)_resetLearnedData;
- (void)calibrateWithDotNumberPositions:(id)a3;
- (void)removeDriftAddedByPattern:(id)a3;
- (void)setLeftDotPositions:(id)a3;
- (void)setLeftDrifts:(id)a3;
- (void)setRightDotPositions:(id)a3;
- (void)setRightDrifts:(id)a3;
- (void)updateDriftWithPattern:(id)a3;
@end

@implementation VOTBrailleGestureDataRepository

- (VOTBrailleGestureDataRepository)initWithTypingMode:(int64_t)a3 keyboardSize:(CGSize)a4 shouldUseEightDotBraille:(BOOL)a5
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___VOTBrailleGestureDataRepository;
  v9 = -[VOTBrailleGestureDataRepository init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    v9->_typingMode = a3;
    v9->_keyboardSize.CGFloat width = width;
    v9->_keyboardSize.CGFloat height = height;
    v9->_shouldUseEightDotBraille = a5;
    -[VOTBrailleGestureDataRepository _loadAllDataFromFiles](v9, "_loadAllDataFromFiles");
  }

  return v10;
}

- (id)halfPatternsForNumberOfDots:(unint64_t)a3 side:(unint64_t)a4
{
  id v29 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  double v7 = exp2((double)(-[VOTBrailleGestureDataRepository _totalNumberOfDots](self, "_totalNumberOfDots") >> 1));
  if (v7 > 0.0)
  {
    double v8 = v7;
    uint64_t v9 = 0LL;
    v30 = self;
    unint64_t v22 = a3;
    while ((v9 & 1)
          + ((unint64_t)(v9 & 2) >> 1)
          + ((unint64_t)(v9 & 4) >> 2)
          + ((unint64_t)(v9 & 8) >> 3) != a3)
    {
LABEL_23:
    }

    if (a4)
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureDataRepository rightDotPositions](self, "rightDotPositions"));
      -[VOTBrailleGestureDataRepository _averageRightDrift](self, "_averageRightDrift");
    }

    else
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureDataRepository leftDotPositions](self, "leftDotPositions"));
      -[VOTBrailleGestureDataRepository _averageLeftDrift](self, "_averageLeftDrift");
    }

    double v12 = v10;
    double v13 = v11;
    if ((v9 & 1) != 0)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue([v31 topDot]);
      uint64_t v14 = objc_claimAutoreleasedReturnValue( -[VOTBrailleGestureDataRepository _adjustPointValue:withDrift:]( self,  "_adjustPointValue:withDrift:",  v12,  v13));
      v23 = (void *)v14;
      if ((v9 & 2) != 0)
      {
LABEL_9:
        v27 = (void *)objc_claimAutoreleasedReturnValue([v31 middleDot]);
        uint64_t v15 = objc_claimAutoreleasedReturnValue( -[VOTBrailleGestureDataRepository _adjustPointValue:withDrift:]( self,  "_adjustPointValue:withDrift:",  v12,  v13));
        v24 = (void *)v15;
        if ((v9 & 4) != 0) {
          goto LABEL_10;
        }
        goto LABEL_15;
      }
    }

    else
    {
      uint64_t v14 = 0LL;
      if ((v9 & 2) != 0) {
        goto LABEL_9;
      }
    }

    uint64_t v15 = 0LL;
    if ((v9 & 4) != 0)
    {
LABEL_10:
      v28 = (void *)objc_claimAutoreleasedReturnValue([v31 bottomDot]);
      uint64_t v16 = objc_claimAutoreleasedReturnValue( -[VOTBrailleGestureDataRepository _adjustPointValue:withDrift:]( self,  "_adjustPointValue:withDrift:",  v12,  v13));
      v25 = (void *)v16;
      if ((v9 & 8) != 0) {
        goto LABEL_11;
      }
      goto LABEL_16;
    }

- (void)updateDriftWithPattern:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 leftDots]);
  id v6 = [v5 count];

  if (v6)
  {
    double v7 = (void *)objc_claimAutoreleasedReturnValue([v4 leftDots]);
    double v8 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureDataRepository leftDotPositions](self, "leftDotPositions"));
    -[VOTBrailleGestureDataRepository _driftOfHalfPattern:relativeToDotPositions:]( self,  "_driftOfHalfPattern:relativeToDotPositions:",  v7,  v8);
    double v10 = v9;
    double v12 = v11;

    double v13 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureDataRepository leftDrifts](self, "leftDrifts"));
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v4 leftDots]);
    -[VOTBrailleGestureDataRepository _addInstanceOfDrift:toArray:forPattern:]( self,  "_addInstanceOfDrift:toArray:forPattern:",  v13,  v14,  v10,  v12);

    uint64_t v17 = VOTLogBrailleGestures(v15, v16);
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v43.x = v10;
      v43.y = v12;
      v19 = NSStringFromPoint(v43);
      v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureDataRepository leftDrifts](self, "leftDrifts"));
      int v39 = 138543618;
      v40 = v20;
      __int16 v41 = 2114;
      v42 = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Added left drift %{public}@.  Recorded drifts are now %{public}@",  (uint8_t *)&v39,  0x16u);
    }
  }

  unint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v4 rightDots]);
  id v23 = [v22 count];

  if (v23)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue([v4 rightDots]);
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureDataRepository rightDotPositions](self, "rightDotPositions"));
    -[VOTBrailleGestureDataRepository _driftOfHalfPattern:relativeToDotPositions:]( self,  "_driftOfHalfPattern:relativeToDotPositions:",  v24,  v25);
    double v27 = v26;
    double v29 = v28;

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureDataRepository rightDrifts](self, "rightDrifts"));
    v31 = (void *)objc_claimAutoreleasedReturnValue([v4 rightDots]);
    -[VOTBrailleGestureDataRepository _addInstanceOfDrift:toArray:forPattern:]( self,  "_addInstanceOfDrift:toArray:forPattern:",  v30,  v31,  v27,  v29);

    uint64_t v34 = VOTLogBrailleGestures(v32, v33);
    v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      v44.x = v27;
      v44.y = v29;
      v36 = NSStringFromPoint(v44);
      v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureDataRepository rightDrifts](self, "rightDrifts"));
      int v39 = 138543618;
      v40 = v37;
      __int16 v41 = 2114;
      v42 = v38;
      _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "Added right drift %{public}@.  Recorded drifts are now %{public}@",  (uint8_t *)&v39,  0x16u);
    }
  }
}

- (void)removeDriftAddedByPattern:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 leftDots]);
  id v6 = [v5 count];

  if (v6)
  {
    double v7 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureDataRepository leftDrifts](self, "leftDrifts"));
    -[VOTBrailleGestureDataRepository _removeInstanceOfDriftFromArray:](self, "_removeInstanceOfDriftFromArray:", v7);

    uint64_t v10 = VOTLogBrailleGestures(v8, v9);
    double v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      double v12 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureDataRepository leftDrifts](self, "leftDrifts"));
      int v21 = 138543362;
      unint64_t v22 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Removed left drift.  Recorded drifts are now %{public}@",  (uint8_t *)&v21,  0xCu);
    }
  }

  double v13 = (void *)objc_claimAutoreleasedReturnValue([v4 rightDots]);
  id v14 = [v13 count];

  if (v14)
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureDataRepository rightDrifts](self, "rightDrifts"));
    -[VOTBrailleGestureDataRepository _removeInstanceOfDriftFromArray:](self, "_removeInstanceOfDriftFromArray:", v15);

    uint64_t v18 = VOTLogBrailleGestures(v16, v17);
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureDataRepository rightDrifts](self, "rightDrifts"));
      int v21 = 138543362;
      unint64_t v22 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Removed right drift.  Recorded drifts are now %{public}@",  (uint8_t *)&v21,  0xCu);
    }
  }
}

- (BOOL)saveDrift
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureDataRepository leftDrifts](self, "leftDrifts"));
  id v4 = [v3 count];

  if ((unint64_t)v4 >= 6)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureDataRepository leftDrifts](self, "leftDrifts"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureDataRepository leftDrifts](self, "leftDrifts"));
    objc_msgSend(v5, "removeObjectsInRange:", 0, (char *)objc_msgSend(v6, "count") - 5);
  }

  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureDataRepository rightDrifts](self, "rightDrifts"));
  id v8 = [v7 count];

  if ((unint64_t)v8 >= 6)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureDataRepository rightDrifts](self, "rightDrifts"));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureDataRepository rightDrifts](self, "rightDrifts"));
    objc_msgSend(v9, "removeObjectsInRange:", 0, (char *)objc_msgSend(v10, "count") - 5);
  }

  v23[0] = @"Left";
  double v11 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureDataRepository leftDrifts](self, "leftDrifts"));
  double v12 = (void *)objc_claimAutoreleasedReturnValue( -[VOTBrailleGestureDataRepository _arrayOfDictionariesFromPointValues:]( self,  "_arrayOfDictionariesFromPointValues:",  v11));
  v23[1] = @"Right";
  v24[0] = v12;
  double v13 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureDataRepository rightDrifts](self, "rightDrifts"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue( -[VOTBrailleGestureDataRepository _arrayOfDictionariesFromPointValues:]( self,  "_arrayOfDictionariesFromPointValues:",  v13));
  v24[1] = v14;
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v24,  v23,  2LL));

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureDataRepository _recordedDriftsFilePath](self, "_recordedDriftsFilePath"));
  id v17 = [v15 writeToFile:v16 atomically:1];
  BOOL v19 = (char)v17;
  if ((_DWORD)v17)
  {
    -[VOTBrailleGestureDataRepository _repairFileProtectionClassOnPathIfNecessary:]( self,  "_repairFileProtectionClassOnPathIfNecessary:",  v16);
  }

  else
  {
    uint64_t v20 = VOTLogBrailleGestures(v17, v18);
    int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_1000F467C();
    }
  }

  return v19;
}

- (id)dotNumberPositions
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v7 = 0LL;
  id v8 = 0LL;
  -[VOTBrailleGestureDataRepository _orderedLeftDots:rightDots:](self, "_orderedLeftDots:rightDots:", &v8, &v7);
  id v4 = v8;
  id v5 = v7;
  -[VOTBrailleGestureDataRepository _averageLeftDrift](self, "_averageLeftDrift");
  -[VOTBrailleGestureDataRepository _appendDots:toPositionsArray:withDrift:]( self,  "_appendDots:toPositionsArray:withDrift:",  v4,  v3);
  -[VOTBrailleGestureDataRepository _averageRightDrift](self, "_averageRightDrift");
  -[VOTBrailleGestureDataRepository _appendDots:toPositionsArray:withDrift:]( self,  "_appendDots:toPositionsArray:withDrift:",  v5,  v3);

  return v3;
}

- (void)_orderedLeftDots:(id *)a3 rightDots:(id *)a4
{
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v8 = [v7 voiceOverTouchBrailleShouldReverseDots];

  if (a3)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureDataRepository leftDotPositions](self, "leftDotPositions"));
    *a3 = (id)objc_claimAutoreleasedReturnValue([v9 dotArrayReversed:v8]);
  }

  if (a4)
  {
    id v10 = (id)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureDataRepository rightDotPositions](self, "rightDotPositions"));
    *a4 = (id)objc_claimAutoreleasedReturnValue([v10 dotArrayReversed:v8]);
  }

- (void)_appendDots:(id)a3 toPositionsArray:(id)a4 withDrift:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  id v9 = a3;
  id v10 = a4;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      id v14 = 0LL;
      do
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v9);
        }
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( -[VOTBrailleGestureDataRepository _adjustPointValue:withDrift:]( self,  "_adjustPointValue:withDrift:",  *(void *)(*((void *)&v16 + 1) + 8LL * (void)v14),  x,  y));
        [v10 addObject:v15];

        id v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v12 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v12);
  }
}

- (BOOL)_allDotsAreOnScreen:(id)a3 withDrift:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  __int128 v8 = xmmword_1001AD170;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v27 objects:v37 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v28;
    while (2)
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v28 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = (void *)objc_claimAutoreleasedReturnValue( -[VOTBrailleGestureDataRepository _adjustPointValue:withDrift:]( self,  "_adjustPointValue:withDrift:",  *(void *)(*((void *)&v27 + 1) + 8LL * (void)i),  x,  y,  (void)v27));
        objc_msgSend(v14, "ax_CGPointValue");
        v38.double x = v15;
        v38.double y = v16;
        v39.origin.double x = 0.0;
        v39.origin.double y = 0.0;
        v39.size.CGFloat width = *((CGFloat *)&v8 + 1);
        *(void *)&v39.size.CGFloat height = v8;
        BOOL v17 = CGRectContainsPoint(v39, v38);

        if (!v17)
        {
          BOOL v18 = 0;
          goto LABEL_11;
        }
      }

      id v11 = [v9 countByEnumeratingWithState:&v27 objects:v37 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  BOOL v18 = 1;
LABEL_11:

  uint64_t v21 = VOTLogBrailleGestures(v19, v20);
  unint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v40.origin.double x = 0.0;
    v40.origin.double y = 0.0;
    v40.size.CGFloat width = *((CGFloat *)&v8 + 1);
    *(void *)&v40.size.CGFloat height = v8;
    id v23 = NSStringFromRect(v40);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    v25 = "NO";
    *(_DWORD *)buf = 138412802;
    uint64_t v32 = v24;
    if (v18) {
      v25 = "YES";
    }
    __int16 v33 = 2080;
    uint64_t v34 = v25;
    __int16 v35 = 2112;
    id v36 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "all dots within screen rect %@ -> %s %@",  buf,  0x20u);
  }

  return v18;
}

- (void)calibrateWithDotNumberPositions:(id)a3
{
  id v4 = a3;
  id v5 = [v4 count];
  if (v5 != (id)-[VOTBrailleGestureDataRepository _totalNumberOfDots](self, "_totalNumberOfDots")) {
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/VoiceOverTouch/Sources/VOTBrailleGestureDataRepository.m",  262LL,  "-[VOTBrailleGestureDataRepository calibrateWithDotNumberPositions:]",  @"Should have received all dots when calibrating");
  }
  if (self->_shouldUseEightDotBraille) {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndexedSubscript:6]);
  }
  else {
    id v6 = 0LL;
  }
  if (self->_shouldUseEightDotBraille) {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndexedSubscript:7]);
  }
  else {
    id v7 = 0LL;
  }
  __int128 v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndexedSubscript:0]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndexedSubscript:1]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndexedSubscript:2]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[VOTBrailleGestureHalfPattern halfPatternWithTopDot:middleDot:bottomDot:fourthDot:]( &OBJC_CLASS___VOTBrailleGestureHalfPattern,  "halfPatternWithTopDot:middleDot:bottomDot:fourthDot:",  v8,  v9,  v10,  v6));
  -[VOTBrailleGestureDataRepository setLeftDotPositions:](self, "setLeftDotPositions:", v11);

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndexedSubscript:3]);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndexedSubscript:4]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndexedSubscript:5]);
  CGFloat v15 = (void *)objc_claimAutoreleasedReturnValue( +[VOTBrailleGestureHalfPattern halfPatternWithTopDot:middleDot:bottomDot:fourthDot:]( &OBJC_CLASS___VOTBrailleGestureHalfPattern,  "halfPatternWithTopDot:middleDot:bottomDot:fourthDot:",  v12,  v13,  v14,  v7));
  -[VOTBrailleGestureDataRepository setRightDotPositions:](self, "setRightDotPositions:", v15);

  CGFloat v16 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureDataRepository leftDotPositions](self, "leftDotPositions"));
  BOOL v17 = (void *)objc_claimAutoreleasedReturnValue([v16 dictionaryRepresentation]);

  BOOL v18 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureDataRepository rightDotPositions](self, "rightDotPositions"));
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 dictionaryRepresentation]);

  v26[0] = @"Left";
  v26[1] = @"Right";
  v27[0] = v17;
  v27[1] = v19;
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v27,  v26,  2LL));
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( -[VOTBrailleGestureDataRepository _calibratedDotPositionsFilePath]( self,  "_calibratedDotPositionsFilePath"));
  id v22 = [v20 writeToFile:v21 atomically:1];
  if ((_DWORD)v22)
  {
    -[VOTBrailleGestureDataRepository _repairFileProtectionClassOnPathIfNecessary:]( self,  "_repairFileProtectionClassOnPathIfNecessary:",  v21);
    -[VOTBrailleGestureDataRepository _resetLearnedData](self, "_resetLearnedData");
  }

  else
  {
    uint64_t v24 = VOTLogBrailleGestures(v22, v23);
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_1000F46A8();
    }
  }
}

- (BOOL)areDotNumberPositionsCalibrated
{
  return self->_areDotNumberPositionsCalibrated;
}

- (CGPoint)_driftByAddingDisplacementOfPointValue:(id)a3 fromPointValue:(id)a4 toDrift:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  id v8 = a3;
  id v9 = a4;
  if (!v9) {
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/VoiceOverTouch/Sources/VOTBrailleGestureDataRepository.m",  295LL,  "-[VOTBrailleGestureDataRepository _driftByAddingDisplacementOfPointValue:fromPointValue:toDrift:]",  @"Original point value should have been non-nil, as it came from our reference dot positions.");
  }
  objc_msgSend(v9, "ax_CGPointValue");
  if (v8)
  {
    double v12 = v10;
    double v13 = v11;
    objc_msgSend(v8, "ax_CGPointValue");
    double x = x + v14 - v12;
    double y = y + v15 - v13;
  }

  double v16 = x;
  double v17 = y;
  result.double y = v17;
  result.double x = v16;
  return result;
}

- (CGPoint)_driftOfHalfPattern:(id)a3 relativeToDotPositions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double y = CGPointZero.y;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 topDot]);
  double v10 = (void *)objc_claimAutoreleasedReturnValue([v7 topDot]);
  -[VOTBrailleGestureDataRepository _driftByAddingDisplacementOfPointValue:fromPointValue:toDrift:]( self,  "_driftByAddingDisplacementOfPointValue:fromPointValue:toDrift:",  v9,  v10,  CGPointZero.x,  y);
  double v12 = v11;
  double v14 = v13;

  double v15 = (void *)objc_claimAutoreleasedReturnValue([v6 middleDot]);
  double v16 = (void *)objc_claimAutoreleasedReturnValue([v7 middleDot]);
  -[VOTBrailleGestureDataRepository _driftByAddingDisplacementOfPointValue:fromPointValue:toDrift:]( self,  "_driftByAddingDisplacementOfPointValue:fromPointValue:toDrift:",  v15,  v16,  v12,  v14);
  double v18 = v17;
  double v20 = v19;

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v6 bottomDot]);
  id v22 = (void *)objc_claimAutoreleasedReturnValue([v7 bottomDot]);
  -[VOTBrailleGestureDataRepository _driftByAddingDisplacementOfPointValue:fromPointValue:toDrift:]( self,  "_driftByAddingDisplacementOfPointValue:fromPointValue:toDrift:",  v21,  v22,  v18,  v20);
  double v24 = v23;
  double v26 = v25;

  if (self->_shouldUseEightDotBraille)
  {
    __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v6 fourthDot]);
    __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v7 fourthDot]);
    -[VOTBrailleGestureDataRepository _driftByAddingDisplacementOfPointValue:fromPointValue:toDrift:]( self,  "_driftByAddingDisplacementOfPointValue:fromPointValue:toDrift:",  v27,  v28,  v24,  v26);
    double v24 = v29;
    double v26 = v30;
  }

  id v31 = [v6 count];
  if (v31)
  {
    double v24 = v24 / (double)(unint64_t)v31;
    double v26 = v26 / (double)(unint64_t)v31;
  }

  else if (v24 != CGPointZero.x || v26 != y)
  {
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/VoiceOverTouch/Sources/VOTBrailleGestureDataRepository.m",  324LL,  "-[VOTBrailleGestureDataRepository _driftOfHalfPattern:relativeToDotPositions:]",  @"Somehow had no dots, but managed to calculate drift.");
  }

  double v33 = v24;
  double v34 = v26;
  result.double y = v34;
  result.double x = v33;
  return result;
}

- (void)_addInstanceOfDrift:(CGPoint)a3 toArray:(id)a4 forPattern:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  id v9 = a4;
  id v10 = a5;
  if (!v9) {
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/VoiceOverTouch/Sources/VOTBrailleGestureDataRepository.m",  331LL,  "-[VOTBrailleGestureDataRepository _addInstanceOfDrift:toArray:forPattern:]",  @"Should have initialized array of drifts already");
  }
  double v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue ax_valueWithCGPoint:](&OBJC_CLASS___NSValue, "ax_valueWithCGPoint:", x, y));
  [v9 addObject:v11];

  -[VOTBrailleGestureDataRepository _averageRecentDriftFromDrifts:](self, "_averageRecentDriftFromDrifts:", v9);
  double v13 = v12;
  double v15 = v14;
  double v16 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v17 = [v16 voiceOverTouchBrailleShouldReverseDots];

  double v18 = (void *)objc_claimAutoreleasedReturnValue([v10 dotArrayReversed:v17]);
  BOOL v19 = -[VOTBrailleGestureDataRepository _allDotsAreOnScreen:withDrift:]( self,  "_allDotsAreOnScreen:withDrift:",  v18,  v13,  v15);
  if (!v19)
  {
    uint64_t v21 = VOTLogBrailleGestures(v19, v20);
    id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      sub_1000F46D4(v22, x, y);
    }

    [v9 removeLastObject];
  }
}

- (void)_removeInstanceOfDriftFromArray:(id)a3
{
  id v3 = a3;
  if (!v3) {
    *(void *)&double v4 = _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/VoiceOverTouch/Sources/VOTBrailleGestureDataRepository.m",  351LL,  "-[VOTBrailleGestureDataRepository _removeInstanceOfDriftFromArray:]",  @"Should have initialized array of drifts already").n128_u64[0];
  }
  id v5 = objc_msgSend(v3, "count", v4);
  if ((unint64_t)v5 < 6)
  {
    uint64_t v7 = VOTLogBrailleGestures(v5, v6);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Could not remove last instance of drift.  This is expected if we backspaced further than the text we had entered in this run.",  v9,  2u);
    }
  }

  else
  {
    [v3 removeLastObject];
  }
}

- (CGPoint)_averageRecentDriftFromDrifts:(id)a3
{
  id v3 = a3;
  double v4 = (char *)[v3 count];
  if ((unint64_t)v4 <= 4)
  {
    CGFloat x = CGPointZero.x;
    CGFloat y = CGPointZero.y;
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/VoiceOverTouch/Sources/VOTBrailleGestureDataRepository.m",  366LL,  "-[VOTBrailleGestureDataRepository _averageRecentDriftFromDrifts:]",  @"Unexpectedly had fewer drifts than we needed to get the average.");
  }

  else
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "subarrayWithRange:", v4 - 5, 5));
    CGFloat x = sub_10003A0C4(v5);
    CGFloat y = v7;
  }

  double v9 = x;
  double v10 = y;
  result.CGFloat y = v10;
  result.CGFloat x = v9;
  return result;
}

- (CGPoint)_averageLeftDrift
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureDataRepository leftDrifts](self, "leftDrifts"));
  -[VOTBrailleGestureDataRepository _averageRecentDriftFromDrifts:](self, "_averageRecentDriftFromDrifts:", v3);
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.CGFloat y = v9;
  result.CGFloat x = v8;
  return result;
}

- (CGPoint)_averageRightDrift
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureDataRepository rightDrifts](self, "rightDrifts"));
  -[VOTBrailleGestureDataRepository _averageRecentDriftFromDrifts:](self, "_averageRecentDriftFromDrifts:", v3);
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.CGFloat y = v9;
  result.CGFloat x = v8;
  return result;
}

- (id)_adjustPointValue:(id)a3 withDrift:(CGPoint)a4
{
  if (!a3) {
    return 0LL;
  }
  double y = a4.y;
  double x = a4.x;
  objc_msgSend(a3, "ax_CGPointValue");
  return (id)objc_claimAutoreleasedReturnValue( +[NSValue ax_valueWithCGPoint:]( &OBJC_CLASS___NSValue,  "ax_valueWithCGPoint:",  x + v6,  y + v7));
}

- (unint64_t)_totalNumberOfDots
{
  if (self->_shouldUseEightDotBraille) {
    return 8LL;
  }
  else {
    return 6LL;
  }
}

- (void)_resetLearnedData
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureDataRepository _recordedDriftsFilePath](self, "_recordedDriftsFilePath"));
  unsigned int v5 = [v3 fileExistsAtPath:v4];

  if (v5)
  {
    uint64_t v8 = VOTLogBrailleGestures(v6, v7);
    double v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Deleting recorded drifts", buf, 2u);
    }

    double v10 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureDataRepository _recordedDriftsFilePath](self, "_recordedDriftsFilePath"));
    id v17 = 0LL;
    unsigned __int8 v11 = [v3 removeItemAtPath:v10 error:&v17];
    id v12 = v17;

    if ((v11 & 1) == 0)
    {
      uint64_t v15 = VOTLogBrailleGestures(v13, v14);
      double v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_1000F4764();
      }
    }
  }

  -[VOTBrailleGestureDataRepository _loadAllDataFromFiles](self, "_loadAllDataFromFiles");
}

- (void)_deleteCalibratedData
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  double v4 = (void *)objc_claimAutoreleasedReturnValue( -[VOTBrailleGestureDataRepository _calibratedDotPositionsFilePath]( self,  "_calibratedDotPositionsFilePath"));
  id v5 = [v3 fileExistsAtPath:v4];
  if ((_DWORD)v5)
  {
    uint64_t v7 = VOTLogBrailleGestures(v5, v6);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Deleting calibrated dot positions", buf, 2u);
    }

    id v15 = 0LL;
    unsigned __int8 v9 = [v3 removeItemAtPath:v4 error:&v15];
    id v10 = v15;
    id v12 = v10;
    if ((v9 & 1) == 0)
    {
      uint64_t v13 = VOTLogBrailleGestures(v10, v11);
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1000F47C4();
      }
    }
  }
}

- (id)_filenameSuffix
{
  v2 = @"tableTop";
  if (!self->_typingMode) {
    v2 = @"screenAway";
  }
  if (self->_shouldUseEightDotBraille) {
    id v3 = @"8dot";
  }
  else {
    id v3 = @"6dot";
  }
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@_%dx%d_%@.plist",  v2,  (int)self->_keyboardSize.width,  (int)self->_keyboardSize.height,  v3);
}

- (id)_gestureDataDirectory
{
  id v3 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  double v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 lastObject]);

  NSFileAttributeKey v18 = NSFileProtectionKey;
  NSFileProtectionType v19 = NSFileProtectionNone;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v19,  &v18,  1LL));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByAppendingPathComponent:@"Accessibility"]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 stringByAppendingPathComponent:@"BrailleGestures"]);
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v17 = 0LL;
  unsigned __int8 v10 = [v9 createDirectoryAtPath:v8 withIntermediateDirectories:1 attributes:v6 error:&v17];
  id v11 = v17;
  uint64_t v13 = v11;
  if ((v10 & 1) == 0)
  {
    uint64_t v14 = VOTLogBrailleGestures(v11, v12);
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1000F4824();
    }
  }

  -[VOTBrailleGestureDataRepository _repairFileProtectionClassOnPathIfNecessary:]( self,  "_repairFileProtectionClassOnPathIfNecessary:",  v7);
  -[VOTBrailleGestureDataRepository _repairFileProtectionClassOnPathIfNecessary:]( self,  "_repairFileProtectionClassOnPathIfNecessary:",  v8);

  return v8;
}

- (id)_calibratedDotPositionsFilePath
{
  calibratedDotPositionsFilePath = self->_calibratedDotPositionsFilePath;
  if (!calibratedDotPositionsFilePath)
  {
    double v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureDataRepository _gestureDataDirectory](self, "_gestureDataDirectory"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureDataRepository _filenameSuffix](self, "_filenameSuffix"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"CalibratedDotPositions.%@",  v5));
    uint64_t v7 = (NSString *)objc_claimAutoreleasedReturnValue([v4 stringByAppendingPathComponent:v6]);
    uint64_t v8 = self->_calibratedDotPositionsFilePath;
    self->_calibratedDotPositionsFilePath = v7;

    calibratedDotPositionsFilePath = self->_calibratedDotPositionsFilePath;
  }

  return calibratedDotPositionsFilePath;
}

- (id)_recordedDriftsFilePath
{
  recordedDriftsFilePath = self->_recordedDriftsFilePath;
  if (!recordedDriftsFilePath)
  {
    double v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureDataRepository _gestureDataDirectory](self, "_gestureDataDirectory"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureDataRepository _filenameSuffix](self, "_filenameSuffix"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"RecordedDrifts.%@",  v5));
    uint64_t v7 = (NSString *)objc_claimAutoreleasedReturnValue([v4 stringByAppendingPathComponent:v6]);
    uint64_t v8 = self->_recordedDriftsFilePath;
    self->_recordedDriftsFilePath = v7;

    recordedDriftsFilePath = self->_recordedDriftsFilePath;
  }

  return recordedDriftsFilePath;
}

- (void)_generateTableTopInitialData
{
  BOOL shouldUseEightDotBraille = self->_shouldUseEightDotBraille;
  double v4 = dbl_100132E20[!self->_shouldUseEightDotBraille];
  double v5 = dbl_100132E30[!self->_shouldUseEightDotBraille];
  double width = self->_keyboardSize.width;
  double v7 = (width + -100.0 + -120.0) * 0.5;
  double v8 = cos(v4);
  if (v5 * v8 <= v7)
  {
    double v9 = fmin(width + -100.0 + v5 * v8 * -2.0, 300.0);
  }

  else
  {
    double v4 = acos(v7 / v5);
    double v8 = cos(v4);
    double v9 = 120.0;
  }

  double v10 = v5 * sin(v4);
  double v11 = v10 + (self->_keyboardSize.height - v10) * 0.5;
  double v12 = (width - v9) * 0.5;
  double v13 = width - v12;
  double v14 = v12 - v5 * v8;
  double v15 = v11 - v10;
  double v16 = width - v14;
  if (shouldUseEightDotBraille)
  {
    -[VOTBrailleGestureDataRepository _getEightDotTableTopMiddleLeftDot:middleRightDot:bottomLeftDot:bottomRightDot:angleFromXAxisToLineOfHand:topLeftDot:]( self,  "_getEightDotTableTopMiddleLeftDot:middleRightDot:bottomLeftDot:bottomRightDot:angleFromXAxisToLineOfHand:topLeftDot:",  &v39,  &v37,  v36,  v35,  v4,  v12,  v11);
    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue ax_valueWithCGPoint:](&OBJC_CLASS___NSValue, "ax_valueWithCGPoint:", v12, v11));
    NSFileAttributeKey v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue ax_valueWithCGPoint:](&OBJC_CLASS___NSValue, "ax_valueWithCGPoint:", v39, v40));
    NSFileProtectionType v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue ax_valueWithCGPoint:](&OBJC_CLASS___NSValue, "ax_valueWithCGPoint:", v36[0], v36[1]));
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue ax_valueWithCGPoint:](&OBJC_CLASS___NSValue, "ax_valueWithCGPoint:", v14, v15));
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[VOTBrailleGestureHalfPattern halfPatternWithTopDot:middleDot:bottomDot:fourthDot:]( &OBJC_CLASS___VOTBrailleGestureHalfPattern,  "halfPatternWithTopDot:middleDot:bottomDot:fourthDot:",  v17,  v18,  v19,  v20));
    -[VOTBrailleGestureDataRepository setLeftDotPositions:](self, "setLeftDotPositions:", v21);

    id v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue ax_valueWithCGPoint:](&OBJC_CLASS___NSValue, "ax_valueWithCGPoint:", v13, v11));
    double v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue ax_valueWithCGPoint:](&OBJC_CLASS___NSValue, "ax_valueWithCGPoint:", v37, v38));
    double v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue ax_valueWithCGPoint:](&OBJC_CLASS___NSValue, "ax_valueWithCGPoint:", v35[0], v35[1]));
    double v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue ax_valueWithCGPoint:](&OBJC_CLASS___NSValue, "ax_valueWithCGPoint:", v16, v15));
    double v26 = (void *)objc_claimAutoreleasedReturnValue( +[VOTBrailleGestureHalfPattern halfPatternWithTopDot:middleDot:bottomDot:fourthDot:]( &OBJC_CLASS___VOTBrailleGestureHalfPattern,  "halfPatternWithTopDot:middleDot:bottomDot:fourthDot:",  v22,  v23,  v24,  v25));
    -[VOTBrailleGestureDataRepository setRightDotPositions:](self, "setRightDotPositions:", v26);
  }

  else
  {
    -[VOTBrailleGestureDataRepository _getMiddleDotsForSixDotTableTopInitialDataForLeft:right:angleFromXAxisToLineOfHand:topLeftDot:]( self,  "_getMiddleDotsForSixDotTableTopInitialDataForLeft:right:angleFromXAxisToLineOfHand:topLeftDot:",  &v39,  &v37,  v4,  v12,  v11);
    __int128 v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue ax_valueWithCGPoint:](&OBJC_CLASS___NSValue, "ax_valueWithCGPoint:", v12, v11));
    __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue ax_valueWithCGPoint:](&OBJC_CLASS___NSValue, "ax_valueWithCGPoint:", v39, v40));
    double v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue ax_valueWithCGPoint:](&OBJC_CLASS___NSValue, "ax_valueWithCGPoint:", v14, v15));
    double v30 = (void *)objc_claimAutoreleasedReturnValue( +[VOTBrailleGestureHalfPattern halfPatternWithTopDot:middleDot:bottomDot:]( &OBJC_CLASS___VOTBrailleGestureHalfPattern,  "halfPatternWithTopDot:middleDot:bottomDot:",  v27,  v28,  v29));
    -[VOTBrailleGestureDataRepository setLeftDotPositions:](self, "setLeftDotPositions:", v30);

    id v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue ax_valueWithCGPoint:](&OBJC_CLASS___NSValue, "ax_valueWithCGPoint:", v13, v11));
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue ax_valueWithCGPoint:](&OBJC_CLASS___NSValue, "ax_valueWithCGPoint:", v37, v38));
    double v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue ax_valueWithCGPoint:](&OBJC_CLASS___NSValue, "ax_valueWithCGPoint:", v16, v15));
    double v34 = (void *)objc_claimAutoreleasedReturnValue( +[VOTBrailleGestureHalfPattern halfPatternWithTopDot:middleDot:bottomDot:]( &OBJC_CLASS___VOTBrailleGestureHalfPattern,  "halfPatternWithTopDot:middleDot:bottomDot:",  v31,  v32,  v33));
    -[VOTBrailleGestureDataRepository setRightDotPositions:](self, "setRightDotPositions:", v34);
  }

- (void)_getEightDotTableTopMiddleLeftDot:(CGPoint *)a3 middleRightDot:(CGPoint *)a4 bottomLeftDot:(CGPoint *)a5 bottomRightDot:(CGPoint *)a6 angleFromXAxisToLineOfHand:(double)a7 topLeftDot:(CGPoint)a8
{
  double y = a8.y;
  double x = a8.x;
  __double2 v16 = __sincos_stret(a7 + 0.289686994);
  double v17 = x + v16.__cosval * -120.0;
  double v18 = y + v16.__sinval * -120.0;
  double width = self->_keyboardSize.width;
  __double2 v20 = __sincos_stret(a7);
  if (a3)
  {
    a3->double x = v17;
    a3->double y = v18;
  }

  if (a4)
  {
    a4->double x = width - v17;
    a4->double y = v18;
  }

  double v21 = v17 + v20.__cosval * -120.0;
  double v22 = v18 + v20.__sinval * -120.0;
  if (a5)
  {
    a5->double x = v21;
    a5->double y = v22;
  }

  if (a6)
  {
    a6->double x = width - v21;
    a6->double y = v22;
  }

- (void)_getMiddleDotsForSixDotTableTopInitialDataForLeft:(CGPoint *)a3 right:(CGPoint *)a4 angleFromXAxisToLineOfHand:(double)a5 topLeftDot:(CGPoint)a6
{
  double y = a6.y;
  double x = a6.x;
  __double2 v11 = __sincos_stret(a5 + 0.289686994);
  double v12 = x + v11.__cosval * -120.0;
  double v13 = y + v11.__sinval * -120.0;
  double width = self->_keyboardSize.width;
  if (a3)
  {
    a3->double x = v12;
    a3->double y = v13;
  }

  if (a4)
  {
    a4->double x = width - v12;
    a4->double y = v13;
  }

- (void)_generateScreenAwayInitialData
{
  double height = self->_keyboardSize.height;
  double v4 = 3.0;
  if (!self->_shouldUseEightDotBraille) {
    double v4 = 2.0;
  }
  double v5 = dbl_100132E30[!self->_shouldUseEightDotBraille];
  if (height + -100.0 <= v5) {
    double v5 = height + -100.0;
  }
  double v6 = v5 / v4;
  double v7 = (height - v5) * 0.5;
  double v8 = self->_keyboardSize.width + -50.0;
  double v9 = v5 / v4 + v7;
  double v10 = v6 + v6 + v7;
  if (self->_shouldUseEightDotBraille)
  {
    double v11 = v6 + v10;
    id v21 = (id)objc_claimAutoreleasedReturnValue(+[NSValue ax_valueWithCGPoint:](&OBJC_CLASS___NSValue, "ax_valueWithCGPoint:", 50.0, v6 + v10));
    double v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue ax_valueWithCGPoint:](&OBJC_CLASS___NSValue, "ax_valueWithCGPoint:", v8, v11));
  }

  else
  {
    double v12 = 0LL;
    id v21 = 0LL;
  }

  double v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue ax_valueWithCGPoint:](&OBJC_CLASS___NSValue, "ax_valueWithCGPoint:", v8, v7));
  double v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue ax_valueWithCGPoint:](&OBJC_CLASS___NSValue, "ax_valueWithCGPoint:", v8, v9));
  double v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue ax_valueWithCGPoint:](&OBJC_CLASS___NSValue, "ax_valueWithCGPoint:", v8, v10));
  __double2 v16 = (void *)objc_claimAutoreleasedReturnValue( +[VOTBrailleGestureHalfPattern halfPatternWithTopDot:middleDot:bottomDot:fourthDot:]( &OBJC_CLASS___VOTBrailleGestureHalfPattern,  "halfPatternWithTopDot:middleDot:bottomDot:fourthDot:",  v13,  v14,  v15,  v12));
  -[VOTBrailleGestureDataRepository setLeftDotPositions:](self, "setLeftDotPositions:", v16);

  double v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue ax_valueWithCGPoint:](&OBJC_CLASS___NSValue, "ax_valueWithCGPoint:", 50.0, v7));
  double v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue ax_valueWithCGPoint:](&OBJC_CLASS___NSValue, "ax_valueWithCGPoint:", 50.0, v9));
  NSFileProtectionType v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue ax_valueWithCGPoint:](&OBJC_CLASS___NSValue, "ax_valueWithCGPoint:", 50.0, v10));
  __double2 v20 = (void *)objc_claimAutoreleasedReturnValue( +[VOTBrailleGestureHalfPattern halfPatternWithTopDot:middleDot:bottomDot:fourthDot:]( &OBJC_CLASS___VOTBrailleGestureHalfPattern,  "halfPatternWithTopDot:middleDot:bottomDot:fourthDot:",  v17,  v18,  v19,  v21));
  -[VOTBrailleGestureDataRepository setRightDotPositions:](self, "setRightDotPositions:", v20);
}

- (void)_generateInitialData
{
  if (self->_typingMode == 1) {
    -[VOTBrailleGestureDataRepository _generateTableTopInitialData](self, "_generateTableTopInitialData");
  }
  else {
    -[VOTBrailleGestureDataRepository _generateScreenAwayInitialData](self, "_generateScreenAwayInitialData");
  }
}

- (id)_mutableArrayOfZeroPointValues:(unint64_t)a3
{
  double v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:"));
  if (a3)
  {
    double y = CGPointZero.y;
    do
    {
      double v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue ax_valueWithCGPoint:](&OBJC_CLASS___NSValue, "ax_valueWithCGPoint:", CGPointZero.x, y));
      [v4 addObject:v6];

      --a3;
    }

    while (a3);
  }

  return v4;
}

- (id)_mutableArrayOfPointValuesFromDictionaries:(id)a3
{
  id v3 = a3;
  double v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v3 count]));
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      double v9 = 0LL;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = sub_100039F14(*(void **)(*((void *)&v13 + 1) + 8LL * (void)v9));
        double v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
        objc_msgSend(v4, "addObject:", v11, (void)v13);

        double v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v7);
  }

  return v4;
}

- (id)_arrayOfDictionariesFromPointValues:(id)a3
{
  id v3 = a3;
  double v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v3 count]));
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      double v9 = 0LL;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = sub_100039FBC(*(void **)(*((void *)&v13 + 1) + 8LL * (void)v9));
        double v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
        objc_msgSend(v4, "addObject:", v11, (void)v13);

        double v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v7);
  }

  return v4;
}

- (void)_repairFileProtectionClassOnPathIfNecessary:(id)a3
{
  id v3 = a3;
  double v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v24 = 0LL;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 attributesOfItemAtPath:v3 error:&v24]);
  id v6 = v24;
  uint64_t v8 = v6;
  if (!v5)
  {
    uint64_t v22 = VOTLogBrailleGestures(v6, v7);
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_1000F4884();
    }
    id v17 = v8;
    goto LABEL_11;
  }

  double v9 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:NSFileProtectionKey]);
  unsigned __int8 v10 = [v9 isEqualToString:NSFileProtectionNone];

  if ((v10 & 1) == 0)
  {
    uint64_t v13 = VOTLogBrailleGestures(v11, v12);
    __int128 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1000F4954();
    }

    NSFileAttributeKey v25 = NSFileProtectionKey;
    NSFileProtectionType v26 = NSFileProtectionNone;
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v26,  &v25,  1LL));
    id v23 = v8;
    unsigned __int8 v16 = [v4 setAttributes:v15 ofItemAtPath:v3 error:&v23];
    id v17 = v23;

    if ((v16 & 1) != 0) {
      goto LABEL_12;
    }
    uint64_t v20 = VOTLogBrailleGestures(v18, v19);
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_1000F48EC();
    }
LABEL_11:

LABEL_12:
    uint64_t v8 = v17;
  }
}

- (id)_loadDataFromFile:(id)a3
{
  id v3 = a3;
  double v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  if (![v4 fileExistsAtPath:v3])
  {
LABEL_6:
    id v6 = 0LL;
    goto LABEL_7;
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  v3));
  if (!v6)
  {
    uint64_t v7 = VOTLogBrailleGestures(0LL, v5);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000F49B4();
    }

    goto LABEL_6;
  }

- (void)_loadAllDataFromFiles
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[VOTBrailleGestureDataRepository _calibratedDotPositionsFilePath]( self,  "_calibratedDotPositionsFilePath"));
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureDataRepository _loadDataFromFile:](self, "_loadDataFromFile:", v3));

  if (!v4) {
    goto LABEL_22;
  }
  uint64_t v8 = VOTLogBrailleGestures(v5, v6);
  double v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    sub_1000F4B04();
  }

  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"Left"]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[VOTBrailleGestureHalfPattern halfPatternWithDictionaryRepresentation:]( &OBJC_CLASS___VOTBrailleGestureHalfPattern,  "halfPatternWithDictionaryRepresentation:",  v10));
  -[VOTBrailleGestureDataRepository setLeftDotPositions:](self, "setLeftDotPositions:", v11);

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"Right"]);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[VOTBrailleGestureHalfPattern halfPatternWithDictionaryRepresentation:]( &OBJC_CLASS___VOTBrailleGestureHalfPattern,  "halfPatternWithDictionaryRepresentation:",  v12));
  -[VOTBrailleGestureDataRepository setRightDotPositions:](self, "setRightDotPositions:", v13);

  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureDataRepository leftDotPositions](self, "leftDotPositions"));
  uint64_t v15 = objc_claimAutoreleasedReturnValue([v14 topDot]);
  if (v15)
  {
    unsigned __int8 v16 = (void *)v15;
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureDataRepository leftDotPositions](self, "leftDotPositions"));
    uint64_t v18 = objc_claimAutoreleasedReturnValue([v17 middleDot]);
    if (v18)
    {
      uint64_t v19 = (void *)v18;
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureDataRepository leftDotPositions](self, "leftDotPositions"));
      uint64_t v21 = objc_claimAutoreleasedReturnValue([v20 bottomDot]);
      if (v21)
      {
        uint64_t v22 = (void *)v21;
        id v23 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureDataRepository rightDotPositions](self, "rightDotPositions"));
        uint64_t v24 = objc_claimAutoreleasedReturnValue([v23 topDot]);
        if (v24)
        {
          v62 = (void *)v24;
          NSFileAttributeKey v25 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureDataRepository rightDotPositions](self, "rightDotPositions"));
          uint64_t v26 = objc_claimAutoreleasedReturnValue([v25 middleDot]);
          if (v26)
          {
            v60 = v25;
            v61 = (void *)v26;
            v59 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureDataRepository rightDotPositions](self, "rightDotPositions"));
            __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v59 bottomDot]);
            if (v27)
            {
              if (self->_shouldUseEightDotBraille)
              {
                id v58 = v27;
                v57 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureDataRepository leftDotPositions](self, "leftDotPositions"));
                __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v57 fourthDot]);
                if (v28)
                {
                  if (self->_shouldUseEightDotBraille)
                  {
                    v56 = v28;
                    v55 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureDataRepository rightDotPositions](self, "rightDotPositions"));
                    double v29 = (void *)objc_claimAutoreleasedReturnValue([v55 fourthDot]);
                    BOOL v30 = v29 == 0LL;

                    __int128 v28 = v56;
                  }

                  else
                  {
                    BOOL v30 = 0;
                  }
                }

                else
                {
                  BOOL v30 = 1;
                }

                __int128 v27 = v58;
              }

              else
              {
                BOOL v30 = 0;
              }
            }

            else
            {
              BOOL v30 = 1;
            }

            if (!v30)
            {
              self->_areDotNumberPositionsCalibrated = 1;
              goto LABEL_22;
            }

            goto LABEL_19;
          }
        }
      }
    }
  }

LABEL_19:
  uint64_t v31 = VOTLogBrailleGestures(v5, v6);
  uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
    sub_1000F4A4C(self, v32);
  }

  id v5 = -[VOTBrailleGestureDataRepository _deleteCalibratedData](self, "_deleteCalibratedData");
LABEL_22:
  if (!self->_areDotNumberPositionsCalibrated)
  {
    uint64_t v33 = VOTLogBrailleGestures(v5, v6);
    double v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
      sub_1000F4A14();
    }

    -[VOTBrailleGestureDataRepository _generateInitialData](self, "_generateInitialData");
    uint64_t v35 = objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureDataRepository leftDotPositions](self, "leftDotPositions"));
    if (!v35
      || (id v36 = (void *)v35,
          double v37 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureDataRepository rightDotPositions](self, "rightDotPositions")),
          v37,
          v36,
          !v37))
    {
      *(void *)&double v7 = _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/VoiceOverTouch/Sources/VOTBrailleGestureDataRepository.m",  739LL,  "-[VOTBrailleGestureDataRepository _loadAllDataFromFiles]",  @"Should have updated dot positions in repository after generating initial data.").n128_u64[0];
    }
  }

  double v38 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureDataRepository _recordedDriftsFilePath](self, "_recordedDriftsFilePath", v7));
  double v39 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureDataRepository _loadDataFromFile:](self, "_loadDataFromFile:", v38));

  if (v39)
  {
    v42 = (void *)objc_claimAutoreleasedReturnValue([v39 objectForKeyedSubscript:@"Left"]);
    NSPoint v43 = (void *)objc_claimAutoreleasedReturnValue( -[VOTBrailleGestureDataRepository _mutableArrayOfPointValuesFromDictionaries:]( self,  "_mutableArrayOfPointValuesFromDictionaries:",  v42));
    -[VOTBrailleGestureDataRepository setLeftDrifts:](self, "setLeftDrifts:", v43);

    NSPoint v44 = (void *)objc_claimAutoreleasedReturnValue([v39 objectForKeyedSubscript:@"Right"]);
    v45 = (void *)objc_claimAutoreleasedReturnValue( -[VOTBrailleGestureDataRepository _mutableArrayOfPointValuesFromDictionaries:]( self,  "_mutableArrayOfPointValuesFromDictionaries:",  v44));
    -[VOTBrailleGestureDataRepository setRightDrifts:](self, "setRightDrifts:", v45);

    uint64_t v48 = VOTLogBrailleGestures(v46, v47);
    v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      v50 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureDataRepository leftDrifts](self, "leftDrifts"));
      v51 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureDataRepository rightDrifts](self, "rightDrifts"));
      *(_DWORD *)buf = 138543618;
      v64 = v50;
      __int16 v65 = 2114;
      v66 = v51;
      _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_DEFAULT,  "Had recorded left drifts: %{public}@\nright drifts: %{public}@",  buf,  0x16u);
    }
  }

  else
  {
    uint64_t v52 = VOTLogBrailleGestures(v40, v41);
    v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "Had no stored drifts", buf, 2u);
    }

    v54 = (void *)objc_claimAutoreleasedReturnValue( -[VOTBrailleGestureDataRepository _mutableArrayOfZeroPointValues:]( self,  "_mutableArrayOfZeroPointValues:",  5LL));
    -[VOTBrailleGestureDataRepository setLeftDrifts:](self, "setLeftDrifts:", v54);

    v49 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[VOTBrailleGestureDataRepository _mutableArrayOfZeroPointValues:]( self,  "_mutableArrayOfZeroPointValues:",  5LL));
    -[VOTBrailleGestureDataRepository setRightDrifts:](self, "setRightDrifts:", v49);
  }
}

- (VOTBrailleGestureHalfPattern)leftDotPositions
{
  return self->_leftDotPositions;
}

- (void)setLeftDotPositions:(id)a3
{
}

- (VOTBrailleGestureHalfPattern)rightDotPositions
{
  return self->_rightDotPositions;
}

- (void)setRightDotPositions:(id)a3
{
}

- (NSMutableArray)leftDrifts
{
  return self->_leftDrifts;
}

- (void)setLeftDrifts:(id)a3
{
}

- (NSMutableArray)rightDrifts
{
  return self->_rightDrifts;
}

- (void)setRightDrifts:(id)a3
{
}

- (void).cxx_destruct
{
}

@end