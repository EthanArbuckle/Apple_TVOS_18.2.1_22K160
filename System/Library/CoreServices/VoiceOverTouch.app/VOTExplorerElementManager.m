@interface VOTExplorerElementManager
- (BOOL)elementsDidChangeOnLastUpdate;
- (BOOL)startedReadingCurrentElements;
- (NSArray)explorerElements;
- (SCRCTargetSelectorTimer)readAllExplorerElementsTimer;
- (SCRCThread)targetThread;
- (VOTElement)currentExplorerElement;
- (VOTElement)focusedElement;
- (VOTExplorerElementManager)initWithTargetThread:(id)a3;
- (VOTExplorerElementManagerContext)currentReadAllContext;
- (VOTExplorerElementManagerDelegate)delegate;
- (VOTOutputRequest)lastExplorerOutputRequest;
- (VOTTVSpeechRequestManager)tvSpeechRequestManager;
- (id)_nextExplorerElementInDirection:(unint64_t)a3 fromElement:(id)a4 didWrap:(BOOL *)a5;
- (void)__outputRequestFinished:(id)a3;
- (void)_finalizeReadAllOperation:(BOOL)a3;
- (void)_finalizeReadAllOperation:(BOOL)a3 interruptSpeechIfNeeded:(BOOL)a4;
- (void)_readElementInDirection:(unint64_t)a3 assignNativeFocus:(BOOL)a4;
- (void)_sendExplorerOutputRequest:(id)a3 forceReread:(BOOL)a4 interruptCurrentSpeech:(BOOL)a5;
- (void)_updateCurrentElementByMovingInDirection:(unint64_t)a3 fromElement:(id)a4 context:(id)a5;
- (void)cancelCurrentReadAll;
- (void)cancelPendingReadAll;
- (void)dealloc;
- (void)outputRequestFinished:(id)a3;
- (void)readAll:(id)a3;
- (void)readAllAfterDelay:(double)a3 context:(id)a4;
- (void)readNextElementAndAssignNativeFocus:(BOOL)a3;
- (void)readPreviousElementAndAssignNativeFocus:(BOOL)a3;
- (void)setCurrentExplorerElement:(id)a3;
- (void)setCurrentReadAllContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setElementsDidChangeOnLastUpdate:(BOOL)a3;
- (void)setExplorerElements:(id)a3;
- (void)setFocusedElement:(id)a3;
- (void)setLastExplorerOutputRequest:(id)a3;
- (void)setReadAllExplorerElementsTimer:(id)a3;
- (void)setStartedReadingCurrentElements:(BOOL)a3;
- (void)setTargetThread:(id)a3;
- (void)setTvSpeechRequestManager:(id)a3;
- (void)updateWithExplorerElements:(id)a3 focusedElement:(id)a4;
@end

@implementation VOTExplorerElementManager

- (VOTExplorerElementManager)initWithTargetThread:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___VOTExplorerElementManager;
  v5 = -[VOTExplorerElementManager init](&v12, "init");
  v6 = v5;
  if (v5)
  {
    -[VOTExplorerElementManager setTargetThread:](v5, "setTargetThread:", v4);
    v7 = objc_alloc_init(&OBJC_CLASS___VOTTVSpeechRequestManager);
    -[VOTExplorerElementManager setTvSpeechRequestManager:](v6, "setTvSpeechRequestManager:", v7);
    id v8 = objc_allocWithZone(&OBJC_CLASS___SCRCTargetSelectorTimer);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[VOTExplorerElementManager targetThread](v6, "targetThread"));
    id v10 = [v8 initWithTarget:v6 selector:"_handleReadAllExplorerElementsTimerDidFire:" thread:v9];

    -[VOTExplorerElementManager setReadAllExplorerElementsTimer:](v6, "setReadAllExplorerElementsTimer:", v10);
  }

  return v6;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTExplorerElementManager readAllExplorerElementsTimer](self, "readAllExplorerElementsTimer"));
  [v3 invalidate];

  -[VOTExplorerElementManager setReadAllExplorerElementsTimer:](self, "setReadAllExplorerElementsTimer:", 0LL);
  -[VOTExplorerElementManager setTargetThread:](self, "setTargetThread:", 0LL);
  -[VOTExplorerElementManager setExplorerElements:](self, "setExplorerElements:", 0LL);
  -[VOTExplorerElementManager setCurrentExplorerElement:](self, "setCurrentExplorerElement:", 0LL);
  -[VOTExplorerElementManager setLastExplorerOutputRequest:](self, "setLastExplorerOutputRequest:", 0LL);
  -[VOTExplorerElementManager setTvSpeechRequestManager:](self, "setTvSpeechRequestManager:", 0LL);
  -[VOTExplorerElementManager setCurrentReadAllContext:](self, "setCurrentReadAllContext:", 0LL);
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___VOTExplorerElementManager;
  -[VOTExplorerElementManager dealloc](&v4, "dealloc");
}

- (void)updateWithExplorerElements:(id)a3 focusedElement:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetThread);
  unsigned __int8 v9 = objc_msgSend(WeakRetained, "_debug_currentlyRunningOnThisThread");

  if ((v9 & 1) == 0) {
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/VoiceOverTouch/Sources/VOTExplorerElementManager.m",  89LL,  "-[VOTExplorerElementManager updateWithExplorerElements:focusedElement:]",  @"must run on target thread");
  }
  uint64_t v29 = 0LL;
  v30 = &v29;
  uint64_t v31 = 0x2020000000LL;
  char v32 = 0;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_1000E3DF4;
  v28[3] = &unk_10017A1A8;
  v28[4] = &v29;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 axFilterObjectsUsingBlock:v28]);
  v11 = v10;
  if (*((_BYTE *)v30 + 24))
  {
    id v12 = v10;

    id v6 = v12;
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[VOTExplorerElementManager explorerElements](self, "explorerElements"));
  unsigned int v14 = [v6 axIsEqualToOrderedArray:v13 withPredicate:&stru_10017A1E8];

  uint64_t v15 = ((uint64_t (*)(void))VOTLogTVExplorer)();
  v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v14 ^ 1));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    *(_DWORD *)buf = 138543618;
    id v34 = v17;
    __int16 v35 = 2114;
    id v36 = v18;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "Explorer elements did change? %{public}@\n%{public}@",  buf,  0x16u);
  }

  -[VOTExplorerElementManager setFocusedElement:](self, "setFocusedElement:", v7);
  -[VOTExplorerElementManager setElementsDidChangeOnLastUpdate:](self, "setElementsDidChangeOnLastUpdate:", v14 ^ 1);
  if ((v14 & 1) == 0)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[VOTExplorerElementManager tvSpeechRequestManager](self, "tvSpeechRequestManager"));
    [v19 reset];

    -[VOTExplorerElementManager _finalizeReadAllOperation:](self, "_finalizeReadAllOperation:", 0LL);
    -[VOTExplorerElementManager setExplorerElements:](self, "setExplorerElements:", v6);
    uint64_t v20 = VOTLogTVExplorer( -[VOTExplorerElementManager setStartedReadingCurrentElements:]( self,  "setStartedReadingCurrentElements:",  0LL));
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      id v34 = v6;
      __int16 v35 = 2114;
      id v36 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "New Explorer Elements: %{public}@\nFocus Element: %{public}@",  buf,  0x16u);
    }
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[VOTExplorerElementManager currentExplorerElement](self, "currentExplorerElement"));
  if (v22)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[VOTExplorerElementManager explorerElements](self, "explorerElements"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[VOTExplorerElementManager currentExplorerElement](self, "currentExplorerElement"));
    if ([v23 containsObject:v24])
    {
    }

    else
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[VOTExplorerElementManager currentExplorerElement](self, "currentExplorerElement"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[VOTExplorerElementManager focusedElement](self, "focusedElement"));
      unsigned __int8 v27 = [v25 isEqual:v26];

      if ((v27 & 1) == 0) {
        -[VOTExplorerElementManager setCurrentExplorerElement:](self, "setCurrentExplorerElement:", 0LL);
      }
    }
  }

  _Block_object_dispose(&v29, 8);
}

- (void)cancelCurrentReadAll
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetThread);
  unsigned __int8 v4 = objc_msgSend(WeakRetained, "_debug_currentlyRunningOnThisThread");

  if ((v4 & 1) == 0) {
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/VoiceOverTouch/Sources/VOTExplorerElementManager.m",  134LL,  "-[VOTExplorerElementManager cancelCurrentReadAll]",  @"must run on target thread");
  }
  uint64_t v6 = VOTLogTVExplorer(v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Explicitily canceling explorer ReadAll", v8, 2u);
  }

  -[VOTExplorerElementManager _finalizeReadAllOperation:](self, "_finalizeReadAllOperation:", 0LL);
}

- (void)readAllAfterDelay:(double)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[VOTExplorerElementManager readAllExplorerElementsTimer](self, "readAllExplorerElementsTimer"));
  [v7 dispatchAfterDelay:v6 withObject:a3];
}

- (void)cancelPendingReadAll
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[VOTExplorerElementManager readAllExplorerElementsTimer](self, "readAllExplorerElementsTimer"));
  [v2 cancel];
}

- (void)readAll:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetThread);
  unsigned __int8 v6 = objc_msgSend(WeakRetained, "_debug_currentlyRunningOnThisThread");

  if ((v6 & 1) == 0) {
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/VoiceOverTouch/Sources/VOTExplorerElementManager.m",  151LL,  "-[VOTExplorerElementManager readAll:]",  @"must run on target thread");
  }
  uint64_t v8 = VOTLogTVExplorer(v7);
  unsigned __int8 v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Checking readAll preconditions...", buf, 2u);
  }

  if ([v4 userInitiated])
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[VOTExplorerElementManager tvSpeechRequestManager](self, "tvSpeechRequestManager"));
    [v10 reset];
  }

  -[VOTExplorerElementManager cancelPendingReadAll](self, "cancelPendingReadAll");
  if (([v4 userInitiated] & 1) == 0
    && !-[VOTExplorerElementManager elementsDidChangeOnLastUpdate](self, "elementsDidChangeOnLastUpdate"))
  {
    BOOL v11 = -[VOTExplorerElementManager startedReadingCurrentElements](self, "startedReadingCurrentElements");
    if (v11)
    {
      uint64_t v12 = VOTLogTVExplorer(v11);
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)unsigned __int8 v27 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "Bailing on readAll: Not user initiated and elements didn't change since last time",  v27,  2u);
      }

      goto LABEL_25;
    }
  }

  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(-[VOTExplorerElementManager explorerElements](self, "explorerElements"));
  if ([v14 count])
  {

LABEL_15:
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[VOTExplorerElementManager delegate](self, "delegate"));
    [v17 willBeginReadAll:self];

    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    objc_msgSend(v4, "setBeginTimestamp:");
    -[VOTExplorerElementManager setCurrentReadAllContext:](self, "setCurrentReadAllContext:", v4);
    uint64_t v18 = VOTLogTVExplorer( -[VOTExplorerElementManager setStartedReadingCurrentElements:]( self,  "setStartedReadingCurrentElements:",  1LL));
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v25 = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "About to perform readAll", v25, 2u);
    }

    if ([v4 readFromCurrentExplorerElement])
    {
      uint64_t v20 = self;
      uint64_t v21 = 0LL;
    }

    else
    {
      uint64_t v20 = self;
      uint64_t v21 = 2LL;
    }

    -[VOTExplorerElementManager _updateCurrentElementByMovingInDirection:fromElement:context:]( v20,  "_updateCurrentElementByMovingInDirection:fromElement:context:",  v21,  0LL,  v4);
    goto LABEL_26;
  }

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[VOTExplorerElementManager focusedElement](self, "focusedElement"));

  if (v15) {
    goto LABEL_15;
  }
  uint64_t v22 = VOTLogTVExplorer(v16);
  v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v26 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_INFO,  "Bailing on readAll: No explorer elements",  v26,  2u);
  }

  if ([v4 userInitiated])
  {
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[VOSOutputEvent BoundaryEncountered](&OBJC_CLASS___VOSOutputEvent, "BoundaryEncountered"));
    -[os_log_s sendEvent:](v13, "sendEvent:", v24);

LABEL_25:
  }

- (void)readPreviousElementAndAssignNativeFocus:(BOOL)a3
{
}

- (void)readNextElementAndAssignNativeFocus:(BOOL)a3
{
}

- (void)_readElementInDirection:(unint64_t)a3 assignNativeFocus:(BOOL)a4
{
  BOOL v4 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetThread);
  unsigned __int8 v8 = objc_msgSend(WeakRetained, "_debug_currentlyRunningOnThisThread");

  if ((v8 & 1) == 0) {
    *(void *)&double v9 = _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/VoiceOverTouch/Sources/VOTExplorerElementManager.m",  205LL,  "-[VOTExplorerElementManager _readElementInDirection:assignNativeFocus:]",  @"must run on target thread").n128_u64[0];
  }
  -[VOTExplorerElementManager cancelPendingReadAll](self, "cancelPendingReadAll", v9);
  -[VOTExplorerElementManager _finalizeReadAllOperation:](self, "_finalizeReadAllOperation:", 0LL);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[VOTExplorerElementManager explorerElements](self, "explorerElements"));
  id v11 = [v10 count];

  if (v11)
  {
    -[VOTExplorerElementManager setStartedReadingCurrentElements:](self, "setStartedReadingCurrentElements:", 1LL);
    id v14 = (id)objc_claimAutoreleasedReturnValue(+[VOTExplorerElementManagerContext context](&OBJC_CLASS___VOTExplorerElementManagerContext, "context"));
    [v14 setAttemptToSetNativeFocus:v4];
    [v14 setUserInitiated:1];
    [v14 setInterruptsCurrentSpeech:1];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[VOTExplorerElementManager tvSpeechRequestManager](self, "tvSpeechRequestManager"));
    [v12 resetElements];

    -[VOTExplorerElementManager _updateCurrentElementByMovingInDirection:fromElement:context:]( self,  "_updateCurrentElementByMovingInDirection:fromElement:context:",  a3,  0LL,  v14);
  }

  else
  {
    id v14 = (id)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[VOSOutputEvent BoundaryEncountered](&OBJC_CLASS___VOSOutputEvent, "BoundaryEncountered"));
    [v14 sendEvent:v13];
  }
}

- (void)_updateCurrentElementByMovingInDirection:(unint64_t)a3 fromElement:(id)a4 context:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetThread);
  unsigned __int8 v11 = objc_msgSend(WeakRetained, "_debug_currentlyRunningOnThisThread");

  if ((v11 & 1) == 0) {
    *(void *)&double v12 = _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/VoiceOverTouch/Sources/VOTExplorerElementManager.m",  232LL,  "-[VOTExplorerElementManager _updateCurrentElementByMovingInDirection:fromElement:context:]",  @"must run on target thread").n128_u64[0];
  }
  unsigned int v13 = objc_msgSend(v9, "attemptToSetNativeFocus", v12);
  char v35 = 0;
  if (!v8) {
    id v8 = (id)objc_claimAutoreleasedReturnValue(-[VOTExplorerElementManager currentExplorerElement](self, "currentExplorerElement"));
  }
  id v14 = (void *)objc_claimAutoreleasedReturnValue( -[VOTExplorerElementManager _nextExplorerElementInDirection:fromElement:didWrap:]( self,  "_nextExplorerElementInDirection:fromElement:didWrap:",  a3,  v8,  &v35));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[VOTExplorerElementManager currentReadAllContext](self, "currentReadAllContext"));

  if (v15)
  {
    if (v35)
    {
      uint64_t v16 = self;
      uint64_t v17 = 1LL;
LABEL_8:
      -[VOTExplorerElementManager _finalizeReadAllOperation:](v16, "_finalizeReadAllOperation:", v17);
      goto LABEL_17;
    }

    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[VOTExplorerElementManager currentReadAllContext](self, "currentReadAllContext"));
    unsigned __int8 v19 = [v18 userInitiated];

    if ((v19 & 1) == 0)
    {
      focusedElement = self->_focusedElement;
      if (focusedElement && !-[VOTElement hasNativeFocus](focusedElement, "hasNativeFocus"))
      {
        uint64_t v16 = self;
        uint64_t v17 = 0LL;
        goto LABEL_8;
      }

      id v34 = (void *)objc_claimAutoreleasedReturnValue(-[VOTExplorerElementManager focusedElement](self, "focusedElement"));

      if (v14 == v34 || [v14 isMapItem])
      {
        -[VOTExplorerElementManager _updateCurrentElementByMovingInDirection:fromElement:context:]( self,  "_updateCurrentElementByMovingInDirection:fromElement:context:",  0LL,  v14,  v9);
        goto LABEL_17;
      }
    }
  }

  if (v14)
  {
    -[VOTExplorerElementManager setCurrentExplorerElement:](self, "setCurrentExplorerElement:", v14);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[VOTExplorerElementManager delegate](self, "delegate"));
    [v20 explorerElementManager:self didSetExplorerElementFocus:v14];

    if ([v9 userInitiated])
    {
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[VOTExplorerElementManager currentExplorerElement](self, "currentExplorerElement"));
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[VOTExplorerElementManager focusedElement](self, "focusedElement"));
      unsigned int v23 = [v21 isEqual:v22];

      if (v23)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[VOSOutputEvent DidSyncWithSystemFocus](&OBJC_CLASS___VOSOutputEvent, "DidSyncWithSystemFocus"));
        [v24 sendEvent:v25];
      }
    }

    if (!v13
      || (v26 = (void *)objc_claimAutoreleasedReturnValue(-[VOTExplorerElementManager currentExplorerElement](self, "currentExplorerElement")),
          unsigned __int8 v27 = [v26 setNativeFocus],
          v26,
          (v27 & 1) == 0))
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[VOTExplorerElementManager delegate](self, "delegate"));
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[VOTExplorerElementManager currentExplorerElement](self, "currentExplorerElement"));
      [v28 explorerElementManager:self willReadElement:v29];

      v30 = (void *)objc_claimAutoreleasedReturnValue(-[VOTExplorerElementManager tvSpeechRequestManager](self, "tvSpeechRequestManager"));
      [v30 updateHeadersAndElementsWithTarget:v14 ignoreLastUpdate:0];

      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[VOTExplorerElementManager tvSpeechRequestManager](self, "tvSpeechRequestManager"));
      char v32 = (void *)objc_claimAutoreleasedReturnValue([v31 generateOutputRequest:0]);

      -[VOTExplorerElementManager _sendExplorerOutputRequest:forceReread:interruptCurrentSpeech:]( self,  "_sendExplorerOutputRequest:forceReread:interruptCurrentSpeech:",  v32,  [v9 userInitiated],  objc_msgSend(v9, "interruptsCurrentSpeech"));
    }
  }

- (id)_nextExplorerElementInDirection:(unint64_t)a3 fromElement:(id)a4 didWrap:(BOOL *)a5
{
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetThread);
  unsigned __int8 v10 = objc_msgSend(WeakRetained, "_debug_currentlyRunningOnThisThread");

  if ((v10 & 1) == 0) {
    *(void *)&double v11 = _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/VoiceOverTouch/Sources/VOTExplorerElementManager.m",  309LL,  "-[VOTExplorerElementManager _nextExplorerElementInDirection:fromElement:didWrap:]",  @"must run on target thread").n128_u64[0];
  }
  double v12 = (void *)objc_claimAutoreleasedReturnValue(-[VOTExplorerElementManager explorerElements](self, "explorerElements", v11));
  if ([v12 count])
  {

    if (v8) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }

  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(-[VOTExplorerElementManager focusedElement](self, "focusedElement"));

  if (v13)
  {
    if (v8) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }

  _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/VoiceOverTouch/Sources/VOTExplorerElementManager.m",  311LL,  "-[VOTExplorerElementManager _nextExplorerElementInDirection:fromElement:didWrap:]",  @"There should be non-zero explorer elements at this point");
  if (!v8) {
LABEL_8:
  }
    id v8 = (id)objc_claimAutoreleasedReturnValue(-[VOTExplorerElementManager currentExplorerElement](self, "currentExplorerElement"));
LABEL_9:
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[VOTExplorerElementManager explorerElements](self, "explorerElements"));
  id v16 = [v15 count];

  if (v16)
  {
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[VOTExplorerElementManager explorerElements](self, "explorerElements"));
    [v14 addObjectsFromArray:v17];
  }

  uint64_t v18 = objc_claimAutoreleasedReturnValue(-[VOTExplorerElementManager focusedElement](self, "focusedElement"));
  if (v18)
  {
    unsigned __int8 v19 = (void *)v18;
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[VOTExplorerElementManager explorerElements](self, "explorerElements"));
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[VOTExplorerElementManager focusedElement](self, "focusedElement"));
    unsigned __int8 v22 = [v20 containsObject:v21];

    if ((v22 & 1) == 0)
    {
      unsigned int v23 = (void *)objc_claimAutoreleasedReturnValue(-[VOTExplorerElementManager focusedElement](self, "focusedElement"));
      [v14 addObject:v23];
    }
  }

  if (a3 == 2)
  {
    if (a5) {
      *a5 = 0;
    }
    uint64_t v24 = objc_claimAutoreleasedReturnValue([v14 firstObject]);
LABEL_35:
    v26 = (void *)v24;
    goto LABEL_36;
  }

  if (!v8) {
    id v8 = (id)objc_claimAutoreleasedReturnValue([v14 firstObject]);
  }
  v25 = (char *)[v14 indexOfObject:v8];
  if (v25 != (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    unsigned __int8 v27 = v25;
    v28 = (char *)[v14 count];
    uint64_t v29 = v28 - 1;
    if (v27) {
      v30 = v27 - 1;
    }
    else {
      v30 = v28 - 1;
    }
    BOOL v31 = v27 == v29;
    if (v27 == v29) {
      char v32 = 0LL;
    }
    else {
      char v32 = v27 + 1;
    }
    if (a3)
    {
      BOOL v31 = v27 == 0LL;
      v33 = v30;
    }

    else
    {
      v33 = v32;
    }

    if (a5) {
      *a5 = v31;
    }
    uint64_t v24 = objc_claimAutoreleasedReturnValue([v14 objectAtIndex:v33]);
    goto LABEL_35;
  }

  v26 = 0LL;
  if (a5) {
    *a5 = 0;
  }
LABEL_36:

  return v26;
}

- (void)_sendExplorerOutputRequest:(id)a3 forceReread:(BOOL)a4 interruptCurrentSpeech:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v11 = v7;
  if (v5)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
    [v8 stopSpeakingAtBoundary:0 allRequests:1 sessionDeactivationDelay:0];

    id v7 = v11;
  }

  [v7 setCompletionDelegate:self];
  [v11 setDoesNotInterrupt:1];
  [v11 setGeneratesBraille:1];
  [v11 send];
  -[VOTExplorerElementManager setLastExplorerOutputRequest:](self, "setLastExplorerOutputRequest:", v11);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v11 outputActions]);
  id v10 = [v9 count];

  if (!v10)
  {
    [v11 setFinishedSuccessfully:1];
    -[VOTExplorerElementManager outputRequestFinished:](self, "outputRequestFinished:", v11);
  }
}

- (void)_finalizeReadAllOperation:(BOOL)a3
{
}

- (void)_finalizeReadAllOperation:(BOOL)a3 interruptSpeechIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetThread);
  unsigned __int8 v8 = objc_msgSend(WeakRetained, "_debug_currentlyRunningOnThisThread");

  if ((v8 & 1) == 0) {
    *(void *)&double v9 = _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/VoiceOverTouch/Sources/VOTExplorerElementManager.m",  417LL,  "-[VOTExplorerElementManager _finalizeReadAllOperation:interruptSpeechIfNeeded:]",  @"must run on target thread").n128_u64[0];
  }
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[VOTExplorerElementManager currentReadAllContext](self, "currentReadAllContext", v9));

  if (v10)
  {
    if (v4)
    {
      uint64_t v12 = VOTLogTVExplorer(v11);
      unsigned int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        sub_1000F5B14(v13);
      }

      id v14 = (void *)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
      [v14 stopSpeakingAtBoundary:0 allRequests:1 sessionDeactivationDelay:0];
    }

    uint64_t v15 = VOTLogTVExplorer(-[VOTExplorerElementManager setCurrentReadAllContext:](self, "setCurrentReadAllContext:", 0LL));
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      sub_1000F5A78(v16);
    }

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[VOTExplorerElementManager delegate](self, "delegate"));
    [v17 explorerElementManager:self didFinishReadAll:v5];
  }

- (void)outputRequestFinished:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[VOTExplorerElementManager targetThread](self, "targetThread"));
  [v5 performSelector:"__outputRequestFinished:" onTarget:self count:1 objects:v4];
}

- (void)__outputRequestFinished:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetThread);
  unsigned __int8 v6 = objc_msgSend(WeakRetained, "_debug_currentlyRunningOnThisThread");

  if ((v6 & 1) == 0) {
    *(void *)&double v7 = _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/VoiceOverTouch/Sources/VOTExplorerElementManager.m",  441LL,  "-[VOTExplorerElementManager __outputRequestFinished:]",  @"must run on target thread").n128_u64[0];
  }
  if ((objc_msgSend(v4, "finishedSuccessfully", v7) & 1) != 0
    || ([v4 sendTimestamp],
        double v9 = v8,
        id v10 = (void *)objc_claimAutoreleasedReturnValue(-[VOTExplorerElementManager currentReadAllContext](self, "currentReadAllContext")),
        [v10 beginTimestamp],
        double v12 = v11,
        v10,
        v9 <= v12))
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[VOTExplorerElementManager currentReadAllContext](self, "currentReadAllContext"));

    if (v16)
    {
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[VOTExplorerElementManager currentReadAllContext](self, "currentReadAllContext"));
      -[VOTExplorerElementManager _updateCurrentElementByMovingInDirection:fromElement:context:]( self,  "_updateCurrentElementByMovingInDirection:fromElement:context:",  0LL,  0LL,  v17);
    }
  }

  else
  {
    uint64_t v14 = VOTLogTVExplorer(v13);
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138477827;
      id v19 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Explorer request did not finish sucessfully: %{private}@",  (uint8_t *)&v18,  0xCu);
    }

    -[VOTExplorerElementManager _finalizeReadAllOperation:interruptSpeechIfNeeded:]( self,  "_finalizeReadAllOperation:interruptSpeechIfNeeded:",  0LL,  0LL);
  }
}

- (VOTExplorerElementManagerDelegate)delegate
{
  return (VOTExplorerElementManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (VOTElement)focusedElement
{
  return self->_focusedElement;
}

- (void)setFocusedElement:(id)a3
{
}

- (VOTElement)currentExplorerElement
{
  return self->_currentExplorerElement;
}

- (void)setCurrentExplorerElement:(id)a3
{
}

- (NSArray)explorerElements
{
  return self->_explorerElements;
}

- (void)setExplorerElements:(id)a3
{
}

- (VOTTVSpeechRequestManager)tvSpeechRequestManager
{
  return self->_tvSpeechRequestManager;
}

- (void)setTvSpeechRequestManager:(id)a3
{
}

- (SCRCThread)targetThread
{
  return (SCRCThread *)objc_loadWeakRetained((id *)&self->_targetThread);
}

- (void)setTargetThread:(id)a3
{
}

- (VOTOutputRequest)lastExplorerOutputRequest
{
  return self->_lastExplorerOutputRequest;
}

- (void)setLastExplorerOutputRequest:(id)a3
{
}

- (SCRCTargetSelectorTimer)readAllExplorerElementsTimer
{
  return self->_readAllExplorerElementsTimer;
}

- (void)setReadAllExplorerElementsTimer:(id)a3
{
}

- (VOTExplorerElementManagerContext)currentReadAllContext
{
  return self->_currentReadAllContext;
}

- (void)setCurrentReadAllContext:(id)a3
{
}

- (BOOL)elementsDidChangeOnLastUpdate
{
  return self->_elementsDidChangeOnLastUpdate;
}

- (void)setElementsDidChangeOnLastUpdate:(BOOL)a3
{
  self->_elementsDidChangeOnLastUpdate = a3;
}

- (BOOL)startedReadingCurrentElements
{
  return self->_startedReadingCurrentElements;
}

- (void)setStartedReadingCurrentElements:(BOOL)a3
{
  self->_startedReadingCurrentElements = a3;
}

- (void).cxx_destruct
{
}

@end