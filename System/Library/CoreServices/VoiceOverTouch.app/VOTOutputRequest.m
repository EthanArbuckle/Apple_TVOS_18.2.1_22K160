@interface VOTOutputRequest
+ (BOOL)setCopyLastOutputRequestEnabled:(BOOL)a3;
+ (id)createRequest;
+ (id)lastRequest;
+ (id)previousRequests;
+ (id)stringShouldSeparateDueToLanguage:(id)a3 language:(id)a4 keyboardLanguageHint:(id)a5;
+ (void)addPreviousRequests:(id)a3;
+ (void)blockNextRequest;
+ (void)clearPreviousRequests;
+ (void)initialize;
+ (void)resetBlockedRequestCount;
+ (void)sendRequestWithString:(id)a3;
+ (void)sendRequestWithString:(id)a3 shouldQueue:(BOOL)a4;
+ (void)setRequestEnqueuedBlock:(id)a3;
- (BOOL)cancelRequest;
- (BOOL)cannotBeInterrupted;
- (BOOL)containsActions;
- (BOOL)disableOutput;
- (BOOL)doesNotInterrupt;
- (BOOL)finishedSuccessfully;
- (BOOL)generatesBraille;
- (BOOL)hasSameOutputAs:(id)a3;
- (BOOL)interruptsEverything;
- (BOOL)isComputerVisionAsynchrousRequest;
- (BOOL)lastSystemRequest;
- (BOOL)sendsToDisplay;
- (BOOL)startedRequest;
- (BOOL)suppressSpeech;
- (BOOL)synthesizeSilently;
- (NSArray)elementHeadersForOutput;
- (NSArray)imageCaptionResults;
- (NSMutableArray)outputActions;
- (NSNumber)brailleAlertTimeout;
- (NSString)keyboardLanguageHint;
- (NSString)language;
- (NSString)supplementalBrailleDescription;
- (VOTOutputRequest)init;
- (VOTOutputRequestCompletionProtocol)completionDelegate;
- (_NSRange)brailleLineRange;
- (double)sendTimestamp;
- (id)_addAXOutputActions:(id)a3 atIndex:(unint64_t)a4;
- (id)actionCompletionBlock;
- (id)actionStringAtIndex:(int64_t)a3;
- (id)addAttributedString:(id)a3;
- (id)addAttributedString:(id)a3 withLanguage:(id)a4;
- (id)addAttributedString:(id)a3 withLanguage:(id)a4 category:(id)a5;
- (id)addString:(id)a3;
- (id)addString:(id)a3 brailleString:(id)a4 breakWords:(BOOL)a5 withLanguage:(id)a6 atIndex:(int64_t)a7;
- (id)addString:(id)a3 brailleString:(id)a4 breakWords:(BOOL)a5 withLanguage:(id)a6 atIndex:(int64_t)a7 category:(id)a8;
- (id)addString:(id)a3 brailleString:(id)a4 withLanguage:(id)a5;
- (id)addString:(id)a3 breakWords:(BOOL)a4 withLanguage:(id)a5 atIndex:(int64_t)a6;
- (id)addString:(id)a3 breakWords:(BOOL)a4 withLanguage:(id)a5 atIndex:(int64_t)a6 category:(id)a7;
- (id)addString:(id)a3 category:(id)a4;
- (id)addString:(id)a3 withLanguage:(id)a4;
- (id)addString:(id)a3 withLanguage:(id)a4 category:(id)a5;
- (id)combinedActionString;
- (id)combinedOriginalString;
- (id)completionBlock;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)lastAction;
- (id)requestQueueMixinBehavior;
- (id)startBlock;
- (int)brailleType;
- (int)limitToComponentType;
- (int64_t)originationType;
- (unint64_t)numberOfActions;
- (unint64_t)numberOfActionsWithString:(id)a3;
- (void)_handleAttachmentInRequest:(__AXUIElement *)a3;
- (void)_mergeActionsStartingAtIndex:(unint64_t)a3;
- (void)addNotificationEvent:(unsigned int)a3 forDelegate:(id)a4;
- (void)addOutputEvent:(id)a3 toFirstActionMatchingCategory:(id)a4;
- (void)addPause:(float)a3;
- (void)addSound:(id)a3;
- (void)addTVElement:(id)a3 filterWithAspectMask:(BOOL)a4;
- (void)addTVElement:(id)a3 servesAsHeader:(BOOL)a4 filterWithAspectMask:(BOOL)a5;
- (void)removeActions;
- (void)removeActionsWithHelper:(id)a3;
- (void)removeLastActionWithString:(id)a3;
- (void)send;
- (void)setActionCompletionBlock:(id)a3;
- (void)setBrailleAlertTimeout:(id)a3;
- (void)setBrailleLineRange:(_NSRange)a3;
- (void)setBrailleType:(int)a3;
- (void)setCancelRequest:(BOOL)a3;
- (void)setCannotBeInterrupted:(BOOL)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setCompletionDelegate:(id)a3;
- (void)setDisableOutput:(BOOL)a3;
- (void)setDoesNotInterrupt:(BOOL)a3;
- (void)setElementHeadersForOutput:(id)a3;
- (void)setFinishedSuccessfully:(BOOL)a3;
- (void)setGeneratesBraille:(BOOL)a3;
- (void)setImageCaptionResults:(id)a3;
- (void)setInterruptsEverything:(BOOL)a3;
- (void)setIsComputerVisionAsynchrousRequest:(BOOL)a3;
- (void)setKeyboardLanguageHint:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setLastSystemRequest:(BOOL)a3;
- (void)setLimitToComponentType:(int)a3;
- (void)setOriginationType:(int64_t)a3;
- (void)setRequestQueueMixinBehavior:(id)a3;
- (void)setSendsToDisplay:(BOOL)a3 fromDirection:(int64_t)a4;
- (void)setStartBlock:(id)a3;
- (void)setStartedRequest:(BOOL)a3;
- (void)setSupplementalBrailleDescription:(id)a3;
- (void)setSuppressSpeech:(BOOL)a3;
- (void)setSynthesizeSilently:(BOOL)a3;
@end

@implementation VOTOutputRequest

+ (void)initialize
{
  if (qword_1001ACBB8 != -1) {
    dispatch_once(&qword_1001ACBB8, &stru_100176BA0);
  }
}

- (VOTOutputRequest)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___VOTOutputRequest;
  v2 = -[VOTOutputRequest init](&v7, "init");
  if (v2)
  {
    id v3 = [objc_allocWithZone(NSMutableArray) init];
    v4 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v3;

    *((_DWORD *)v2 + 18) = 0;
    objc_storeWeak((id *)v2 + 18, 0LL);
    *(_OWORD *)(v2 + 168) = xmmword_100132550;
    v5 = v2;
  }

  return (VOTOutputRequest *)v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(&OBJC_CLASS___VOTOutputRequest);
  v5 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  outputActions = v4->_outputActions;
  v4->_outputActions = v5;

  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  objc_super v7 = self->_outputActions;
  id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v19,  v23,  16LL);
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      v11 = 0LL;
      do
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = v4->_outputActions;
        id v13 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * (void)v11), "copy", (void)v19);
        -[NSMutableArray addObject:](v12, "addObject:", v13);

        v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v19,  v23,  16LL);
    }

    while (v9);
  }

  v14 = (NSString *)-[NSString copy](self->_language, "copy");
  language = v4->_language;
  v4->_language = v14;

  v16 = (NSArray *)-[NSArray copy](self->_elementHeadersForOutput, "copy");
  elementHeadersForOutput = v4->_elementHeadersForOutput;
  v4->_elementHeadersForOutput = v16;

  v4->_generatesBraille = self->_generatesBraille;
  v4->_brailleType = self->_brailleType;
  v4->_doesNotInterrupt = self->_doesNotInterrupt;
  v4->_cannotBeInterrupted = self->_cannotBeInterrupted;
  return v4;
}

+ (id)createRequest
{
  return [objc_allocWithZone((Class)VOTOutputRequest) init];
}

+ (void)setRequestEnqueuedBlock:(id)a3
{
  uint64_t v3 = qword_1001ACBD0;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_1001ACBD0, &stru_100176BC0);
  }
  [(id)qword_1001ACBC0 lock];
  id v5 = objc_retainBlock(v4);

  v6 = (void *)qword_1001ACBC8;
  qword_1001ACBC8 = (uint64_t)v5;

  [(id)qword_1001ACBC0 unlock];
}

+ (void)sendRequestWithString:(id)a3
{
}

+ (void)sendRequestWithString:(id)a3 shouldQueue:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  id v5 = [objc_allocWithZone((Class)VOTOutputRequest) init];
  v6 = v5;
  if (v4) {
    [v5 setDoesNotInterrupt:1];
  }
  id v7 = [v6 addString:v8];
  [v6 send];
}

+ (void)clearPreviousRequests
{
}

+ (id)previousRequests
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_1001ACBB0 reverseObjectEnumerator]);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 allObjects]);

  [(id)qword_1001ACBA8 unlock];
  return v3;
}

+ (id)lastRequest
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_1001ACBB0 reverseObjectEnumerator]);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 nextObject]);

  [(id)qword_1001ACBA8 unlock];
  return v3;
}

+ (void)blockNextRequest
{
}

+ (void)resetBlockedRequestCount
{
  qword_1001AD150 = 0LL;
}

+ (void)addPreviousRequests:(id)a3
{
  uint64_t v3 = (void *)qword_1001ACBA8;
  id v4 = a3;
  [v3 lock];
  [(id)qword_1001ACBB0 axSafelyAddObjectsFromArray:v4];

  [(id)qword_1001ACBA8 unlock];
}

- (void)removeActions
{
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  uint64_t v3 = self->_outputActions;
  id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0LL;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * (void)v7), "setOutputRequest:", 0, (void)v8);
        id v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
    }

    while (v5);
  }

  -[NSMutableArray removeAllObjects](self->_outputActions, "removeAllObjects");
}

- (void)removeActionsWithHelper:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTOutputRequest outputActions](self, "outputActions"));
  id v8 = [v5 mutableCopy];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000073A8;
  v9[3] = &unk_100176BE8;
  id v10 = v4;
  id v6 = v4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v8 indexesOfObjectsPassingTest:v9]);
  [v8 removeObjectsAtIndexes:v7];

  -[NSMutableArray setArray:](self->_outputActions, "setArray:", v8);
}

- (void)removeLastActionWithString:(id)a3
{
  id v4 = a3;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray reverseObjectEnumerator](self->_outputActions, "reverseObjectEnumerator", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
LABEL_3:
    uint64_t v9 = 0LL;
    while (1)
    {
      if (*(void *)v15 != v8) {
        objc_enumerationMutation(v5);
      }
      id v10 = *(void **)(*((void *)&v14 + 1) + 8 * v9);
      __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 string]);
      unsigned __int8 v12 = [v11 isEqualToString:v4];

      if ((v12 & 1) != 0) {
        break;
      }
      if (v7 == (id)++v9)
      {
        id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_12;
      }
    }

    id v13 = v10;

    if (!v13) {
      goto LABEL_13;
    }
    [v13 setOutputRequest:0];
    -[NSMutableArray removeObject:](self->_outputActions, "removeObject:", v13);
    id v5 = v13;
  }

- (unint64_t)numberOfActionsWithString:(id)a3
{
  id v4 = a3;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v5 = self->_outputActions;
  id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
  if (v6)
  {
    id v7 = v6;
    unint64_t v8 = 0LL;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v5);
        }
        __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * (void)i), "string", (void)v14));
        unsigned int v12 = [v11 isEqualToString:v4];

        v8 += v12;
      }

      id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
    }

    while (v7);
  }

  else
  {
    unint64_t v8 = 0LL;
  }

  return v8;
}

- (BOOL)containsActions
{
  return -[NSMutableArray count](self->_outputActions, "count") != 0LL;
}

- (VOTOutputRequestCompletionProtocol)completionDelegate
{
  return (VOTOutputRequestCompletionProtocol *)objc_loadWeakRetained((id *)&self->_completionDelegate);
}

- (void)setLanguage:(id)a3
{
}

- (NSString)language
{
  return self->_language;
}

+ (BOOL)setCopyLastOutputRequestEnabled:(BOOL)a3
{
  BOOL result = byte_1001ACBD8;
  byte_1001ACBD8 = a3;
  return result;
}

- (double)sendTimestamp
{
  return self->_sendTimestamp;
}

- (void)send
{
  self->_sendTimestamp = v3;
  [(id)qword_1001ACBA8 lock];
  id v4 = (void *)qword_1001ACBB0;
  if (byte_1001ACBD8)
  {
    id v5 = -[VOTOutputRequest copy](self, "copy");
    [v4 addObject:v5];
  }

  else
  {
    id v6 = [(id)qword_1001ACBB0 addObject:self];
  }

  int v7 = _AXSAutomationEnabled(v6);
  id v8 = [(id)qword_1001ACBB0 count];
  if (v7) {
    unint64_t v9 = 100LL;
  }
  else {
    unint64_t v9 = 10LL;
  }
  if ((unint64_t)v8 > v9)
  {
    id v10 = (char *)[(id)qword_1001ACBB0 count] - v9;
    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1001ACBB0, "subarrayWithRange:", 0, v10));
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    __int128 v56 = 0u;
    __int128 v57 = 0u;
    id v12 = [v11 countByEnumeratingWithState:&v54 objects:v59 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v55;
      do
      {
        for (i = 0LL; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v55 != v14) {
            objc_enumerationMutation(v11);
          }
          __int128 v16 = *(void **)(*((void *)&v54 + 1) + 8LL * (void)i);
          [v16 setFinishedSuccessfully:0];
          __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 completionDelegate]);
          [v17 outputRequestFinished:v16];
        }

        id v13 = [v11 countByEnumeratingWithState:&v54 objects:v59 count:16];
      }

      while (v13);
    }

    objc_msgSend((id)qword_1001ACBB0, "removeObjectsInRange:", 0, v10);
  }

  if (_AXSAutomationEnabled([(id)qword_1001ACBA8 unlock]))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
    [v18 postNotificationName:@"VoiceOverEventOccurred" object:@"DidProcessOutputRequest"];
  }

  if ([(id)VOTSharedWorkspace inUnitTestMode])
  {
    [(id)qword_1001ACBC0 lock];
    if (qword_1001ACBC8)
    {
      __int128 v19 = _Block_copy((const void *)qword_1001ACBC8);
      __int128 v20 = (void (**)(void, void))objc_claimAutoreleasedReturnValue(v19);
      [(id)qword_1001ACBC0 unlock];
      if (v20)
      {
        ((void (**)(void, VOTOutputRequest *))v20)[2](v20, self);
      }
    }

    else
    {
      [(id)qword_1001ACBC0 unlock];
    }
  }

  if (qword_1001AD150 < 1)
  {
    if (-[NSMutableArray count](self->_outputActions, "count"))
    {
      if (([(id)VOTSharedWorkspace outputDisabled] & 1) == 0)
      {
        v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
        __int128 v50 = 0u;
        __int128 v51 = 0u;
        __int128 v52 = 0u;
        __int128 v53 = 0u;
        __int128 v21 = self->_outputActions;
        id v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v21,  "countByEnumeratingWithState:objects:count:",  &v50,  v58,  16LL);
        if (v22)
        {
          id v23 = v22;
          uint64_t v24 = *(void *)v51;
          do
          {
            for (j = 0LL; j != v23; j = (char *)j + 1)
            {
              if (*(void *)v51 != v24) {
                objc_enumerationMutation(v21);
              }
              v26 = *(void **)(*((void *)&v50 + 1) + 8LL * (void)j);
              [v26 setOutputRequest:self];
              if (![v26 component])
              {
                if (self->_generatesBraille && [v26 generatesBraille])
                {
                  v27 = (void *)objc_claimAutoreleasedReturnValue([v26 brailleString]);
                  v28 = v27;
                  if (v27) {
                    id v29 = v27;
                  }
                  else {
                    id v29 = (id)objc_claimAutoreleasedReturnValue([v26 string]);
                  }
                  v30 = v29;

                  [v48 appendFormat:@"%@ ", v30];
                }

                if ([v26 performPunctuationTranslation])
                {
                  v31 = (void *)objc_claimAutoreleasedReturnValue([v26 string]);
                  id v32 = [v26 replaceCommas];
                  v33 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForVariant:15]);
                  id v34 = sub_10004B824(v31, (uint64_t)v32, v33);
                  v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
                  [v26 setString:v35];
                }
              }
            }

            id v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v21,  "countByEnumeratingWithState:objects:count:",  &v50,  v58,  16LL);
          }

          while (v23);
        }

        if (self->_generatesBraille)
        {
          v36 = -[VOTOutputAction initWithString:](objc_alloc(&OBJC_CLASS___VOTOutputAction), "initWithString:", v48);
          -[VOTOutputAction setComponent:](v36, "setComponent:", 3LL);
          -[VOTOutputAction setSynchronization:](v36, "setSynchronization:", 1LL);
          -[VOTOutputAction setOutputRequest:](v36, "setOutputRequest:", self);
          if (self->_brailleType)
          {
            v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:"));
            -[VOTOutputAction setObject:forVariant:](v36, "setObject:forVariant:", v37, 34LL);
          }

          id WeakRetained = objc_loadWeakRetained((id *)&self->_brailleAlertTimeout);

          if (WeakRetained)
          {
            id v39 = objc_loadWeakRetained((id *)&self->_brailleAlertTimeout);
            -[VOTOutputAction setObject:forVariant:](v36, "setObject:forVariant:", v39, 36LL);
          }

          if (self->_brailleLineRange.location || self->_brailleLineRange.length != 0x7FFFFFFF)
          {
            v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithRange:](&OBJC_CLASS___NSValue, "valueWithRange:"));
            -[VOTOutputAction setObject:forVariant:](v36, "setObject:forVariant:", v40, 35LL);
          }

          -[NSMutableArray addObject:](self->_outputActions, "addObject:", v36);
        }

        if (-[VOTOutputRequest limitToComponentType](self, "limitToComponentType"))
        {
          v49[0] = _NSConcreteStackBlock;
          v49[1] = 3221225472LL;
          v49[2] = sub_100007D44;
          v49[3] = &unk_100176C10;
          v49[4] = self;
          -[VOTOutputRequest removeActionsWithHelper:](self, "removeActionsWithHelper:", v49);
        }

        id v41 = [objc_allocWithZone(NSNumber) initWithUnsignedInt:2];
        id v42 = [objc_allocWithZone(AXIndexMap) init];
        [v42 setObject:v41 forIndex:1];
        [v42 setObject:self forIndex:14];
        v43 = (void *)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
        [v43 handleEvent:v42];

        if (-[VOTOutputRequest lastSystemRequest](self, "lastSystemRequest"))
        {
          v44 = (void *)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
          [v44 shutdown];
        }
      }
    }

    else
    {
      -[VOTOutputRequest setFinishedSuccessfully:](self, "setFinishedSuccessfully:", 1LL);
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[VOTOutputRequest completionDelegate](self, "completionDelegate"));
      [v45 outputRequestFinished:self];

      v46 = (void *)objc_claimAutoreleasedReturnValue(-[VOTOutputRequest completionBlock](self, "completionBlock"));
      if (v46)
      {
        v47 = (void (**)(void, void))objc_claimAutoreleasedReturnValue(-[VOTOutputRequest completionBlock](self, "completionBlock"));
        ((void (**)(void, VOTOutputRequest *))v47)[2](v47, self);
      }
    }
  }

  else
  {
    --qword_1001AD150;
  }

- (BOOL)hasSameOutputAs:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTOutputRequest outputActions](self, "outputActions"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 outputActions]);
  id v7 = [v5 count];
  if (v7 == [v6 count])
  {
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    id obj = v5;
    id v8 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v29;
      __int128 v21 = v5;
      id v22 = v4;
      while (2)
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v29 != v10) {
            objc_enumerationMutation(obj);
          }
          id v12 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
          __int128 v24 = 0u;
          __int128 v25 = 0u;
          __int128 v26 = 0u;
          __int128 v27 = 0u;
          id v13 = v6;
          id v14 = [v13 countByEnumeratingWithState:&v24 objects:v32 count:16];
          if (!v14)
          {

LABEL_21:
            BOOL v19 = 0;
            id v5 = v21;
            id v4 = v22;
            goto LABEL_22;
          }

          id v15 = v14;
          int v16 = 0;
          uint64_t v17 = *(void *)v25;
          do
          {
            for (j = 0LL; j != v15; j = (char *)j + 1)
            {
              if (*(void *)v25 != v17) {
                objc_enumerationMutation(v13);
              }
              v16 |= [v12 hasSameOutputAs:*(void *)(*((void *)&v24 + 1) + 8 * (void)j)];
            }

            id v15 = [v13 countByEnumeratingWithState:&v24 objects:v32 count:16];
          }

          while (v15);

          if ((v16 & 1) == 0) {
            goto LABEL_21;
          }
        }

        id v9 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
        BOOL v19 = 1;
        id v5 = v21;
        id v4 = v22;
        if (v9) {
          continue;
        }
        break;
      }
    }

    else
    {
      BOOL v19 = 1;
    }

- (void)addOutputEvent:(id)a3 toFirstActionMatchingCategory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v8 = self->_outputActions;
  id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    while (2)
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        id v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForVariant:", 86, (void)v15));
        if ([v7 isEqual:v14])
        {
          [v13 addOutputEvent:v6];

          goto LABEL_11;
        }
      }

      id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
      if (v10) {
        continue;
      }
      break;
    }
  }

- (NSMutableArray)outputActions
{
  return self->_outputActions;
}

- (id)actionStringAtIndex:(int64_t)a3
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_outputActions, "objectAtIndex:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 string]);

  return v4;
}

- (id)combinedActionString
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = sub_1000081E8;
  id v10 = sub_1000081F8;
  id v11 = 0LL;
  outputActions = self->_outputActions;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100008200;
  v5[3] = &unk_100176C38;
  v5[4] = &v6;
  -[NSMutableArray enumerateObjectsUsingBlock:](outputActions, "enumerateObjectsUsingBlock:", v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)combinedOriginalString
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = sub_1000081E8;
  id v10 = sub_1000081F8;
  id v11 = 0LL;
  outputActions = self->_outputActions;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100008354;
  v5[3] = &unk_100176C38;
  v5[4] = &v6;
  -[NSMutableArray enumerateObjectsUsingBlock:](outputActions, "enumerateObjectsUsingBlock:", v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (unint64_t)numberOfActions
{
  return (unint64_t)-[NSMutableArray count](self->_outputActions, "count");
}

- (id)lastAction
{
  return -[NSMutableArray lastObject](self->_outputActions, "lastObject");
}

- (BOOL)doesNotInterrupt
{
  return self->_doesNotInterrupt;
}

- (void)setDoesNotInterrupt:(BOOL)a3
{
  self->_doesNotInterrupt = a3;
}

- (void)setInterruptsEverything:(BOOL)a3
{
  self->_interruptsEverything = a3;
}

- (BOOL)interruptsEverything
{
  return self->_interruptsEverything;
}

- (void)_handleAttachmentInRequest:(__AXUIElement *)a3
{
  if ([(id)VOTSharedWorkspace inUnitTestMode])
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___AXUIElement, v5);
    if ((objc_opt_isKindOfClass(a3, v6) & 1) != 0)
    {
      uint64_t v8 = objc_claimAutoreleasedReturnValue(+[VOTElement elementWithUIElement:](&OBJC_CLASS___VOTElement, "elementWithUIElement:", a3));
    }

    else
    {
      char v13 = 0;
      uint64_t v11 = objc_opt_class(&OBJC_CLASS___VOTElement, v7);
      uint64_t v12 = __UIAccessibilityCastAsClass(v11, a3, 1LL, &v13);
      uint64_t v8 = objc_claimAutoreleasedReturnValue(v12);
      if (v13) {
        abort();
      }
    }

    id v10 = (void *)v8;
  }

  else
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[AXUIElement uiElementWithAXElement:](&OBJC_CLASS___AXUIElement, "uiElementWithAXElement:", a3));
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[VOTElement elementWithUIElement:](&OBJC_CLASS___VOTElement, "elementWithUIElement:", v9));
  }

  [v10 addTextualInformationToRequest:self options:0xC11004000 dataPackage:0];
}

- (id)addAttributedString:(id)a3 withLanguage:(id)a4 category:(id)a5
{
  id v8 = a3;
  id v9 = (__CFString *)a4;
  id v10 = a5;
  uint64_t v12 = objc_opt_class(&OBJC_CLASS___AXAttributedString, v11);
  if ((objc_opt_isKindOfClass(v8, v12) & 1) == 0)
  {
    id v125 = (id)objc_claimAutoreleasedReturnValue( -[VOTOutputRequest addString:withLanguage:category:]( self,  "addString:withLanguage:category:",  v8,  v9,  v10));
    goto LABEL_97;
  }

  if (![v8 length])
  {
    id v125 = 0LL;
    goto LABEL_97;
  }

  id v13 = [v8 copy];

  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t v15 = AXUIAccessibilitySpeechAttributePhonemeSubstitution;
  id v16 = [v13 length];
  v138[0] = _NSConcreteStackBlock;
  v138[1] = 3221225472LL;
  v138[2] = sub_100009200;
  v138[3] = &unk_100176C60;
  id v17 = v14;
  id v139 = v17;
  id v8 = v13;
  id v140 = v8;
  objc_msgSend(v8, "enumerateAttribute:inRange:options:usingBlock:", v15, 0, v16, 0, v138);
  uint64_t v144 = v15;
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v144, 1LL));
  [v8 removeAttributes:v18];

  if ([v17 count]) {
    [v8 setAttribute:v17 forKey:v15];
  }
  v119 = v17;
  BOOL v19 = (void *)objc_claimAutoreleasedReturnValue(-[VOTOutputRequest outputActions](self, "outputActions"));
  v118 = (char *)[v19 count];

  unint64_t v136 = 0LL;
  uint64_t v137 = 0LL;
  id v120 = [v8 length];
  id v125 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v20 = 0LL;
  uint64_t v121 = UIAccessibilityTokenBrailleOverride;
  unint64_t v21 = 0LL;
  id v122 = v8;
  id v123 = v10;
  while (1)
  {
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v8 attributesAtIndex:v21 effectiveRange:&v136]);
    id v23 = v22;
    if (v136 == 0x7FFFFFFFFFFFFFFFLL)
    {

      goto LABEL_96;
    }

    v129 = v20;
    __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "substringWithRange:", v136, v137));
    __int128 v25 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemVoiceOver sharedInstance](&OBJC_CLASS___AXSubsystemVoiceOver, "sharedInstance"));
    unsigned __int8 v26 = [v25 ignoreLogging];

    if ((v26 & 1) == 0)
    {
      __int128 v27 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemVoiceOver identifier](&OBJC_CLASS___AXSubsystemVoiceOver, "identifier"));
      uint64_t v28 = AXLoggerForFacility();
      __int128 v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);

      os_log_type_t v30 = AXOSLogLevelFromAXLogLevel(3LL);
      if (os_log_type_enabled(v29, v30))
      {
        uint64_t v31 = AXColorizeFormatLog(3LL, @"adding sub range %{private}@ -> %{private}@ %d, %d");
        id v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
        unint64_t v116 = v136;
        uint64_t v117 = v137;
        id v114 = v24;
        v115 = v23;
        uint64_t v33 = _AXStringForArgs(v32);
        id v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
        if (os_log_type_enabled(v29, v30))
        {
          *(_DWORD *)buf = 138543362;
          v143 = v34;
          _os_log_impl((void *)&_mh_execute_header, v29, v30, "%{public}@", buf, 0xCu);
        }

        id v10 = v123;
      }
    }

    unint64_t v35 = v136;
    uint64_t v36 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKey:", UIAccessibilityTokenLiteralTextRanges, v114, v115, v116, v117));
    uint64_t v37 = v36;
    v128 = (void *)v36;
    if (v9)
    {
      if (v36) {
        goto LABEL_20;
      }
    }

    else
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKey:UIAccessibilityTokenLanguage]);
      if (v38
        || (v38 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKey:UIAccessibilityTokenOverrideLanguage])) != 0
        || (v38 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKey:@"accessibilityLanguage"])) != 0)
      {

LABEL_20:
        id v9 = &stru_10017A920;
        goto LABEL_21;
      }

      if (v37) {
        goto LABEL_20;
      }
      id v9 = 0LL;
    }

- (id)addAttributedString:(id)a3 withLanguage:(id)a4
{
  return -[VOTOutputRequest addAttributedString:withLanguage:category:]( self,  "addAttributedString:withLanguage:category:",  a3,  a4,  0LL);
}

- (id)_addAXOutputActions:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v8 = -[NSMutableArray count](self->_outputActions, "count");
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id obj = v6;
  id v9 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = -[VOTOutputAction initWithAXAction:]( objc_alloc(&OBJC_CLASS___VOTOutputAction),  "initWithAXAction:",  *(void *)(*((void *)&v20 + 1) + 8LL * (void)i));
        -[VOTOutputAction setOutputRequest:](v13, "setOutputRequest:", self);
        id v14 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace applicationForCurrentElement]);
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 bundleIdentifier]);
        -[VOTOutputAction setObject:forVariant:](v13, "setObject:forVariant:", v15, 43LL);

        -[NSMutableArray addObject:](v7, "addObject:", v13);
        id v16 = -[NSMutableArray count](self->_outputActions, "count");
        outputActions = self->_outputActions;
        else {
          -[NSMutableArray insertObject:atIndex:](outputActions, "insertObject:atIndex:", v13, a4);
        }
        a4 += (_BYTE *)-[NSMutableArray count](self->_outputActions, "count") - v8;
      }

      id v10 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v10);
  }

  return v7;
}

- (void)_mergeActionsStartingAtIndex:(unint64_t)a3
{
  unint64_t v47 = a3;
  int64_t v4 = a3 + 1;
  if (a3 + 1 <= (unint64_t)-[NSMutableArray count](self->_outputActions, "count"))
  {
    id v41 = self;
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTOutputRequest outputActions](self, "outputActions"));
    id v44 = [v5 count];
    id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableIndexSet);
    uint64_t v7 = 0LL;
    do
      -[NSMutableIndexSet addIndex:](v6, "addIndex:", v7++);
    while (v4 != v7);
    id v42 = v6;
    id v45 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet whitespaceAndNewlineCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "whitespaceAndNewlineCharacterSet"));
    if (v4 < (uint64_t)v44)
    {
      v43 = v5;
      do
      {
        id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:v47]);
        id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 outputVariants]);

        id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:v4]);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 outputVariants]);

        if (v9)
        {
          id v46 = [v9 copy];
          [v46 addObjectsFromIndexMap:v11];
        }

        else
        {
          id v46 = [v11 copy];
        }

        uint64_t v53 = 0LL;
        __int128 v54 = &v53;
        uint64_t v55 = 0x2020000000LL;
        char v56 = 1;
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v46 indexes]);
        v48[0] = _NSConcreteStackBlock;
        v48[1] = 3221225472LL;
        v48[2] = sub_100009974;
        v48[3] = &unk_100176C88;
        id v14 = v9;
        id v49 = v14;
        id v15 = v11;
        id v50 = v15;
        id v16 = v12;
        id v51 = v16;
        __int128 v52 = &v53;
        [v13 enumerateIndexesUsingBlock:v48];

        id v17 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:v47]);
        __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v17 string]);
        BOOL v19 = (void *)objc_claimAutoreleasedReturnValue([v18 stringByTrimmingCharactersInSet:v45]);
        id v20 = [v19 length];

        __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:v4]);
        __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v21 string]);
        __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v22 stringByTrimmingCharactersInSet:v45]);

        unint64_t v24 = (unint64_t)[v23 length];
        __int128 v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "ax_filteredSetUsingBlock:", &stru_100176CC8));
        BOOL v26 = ((unint64_t)[v25 count] | v24) == 0;
        if (v24) {
          BOOL v27 = v20 == 0LL;
        }
        else {
          BOOL v27 = 1;
        }
        BOOL v28 = v27 || *((_BYTE *)v54 + 24) == 0;
        if (!v28 || v26)
        {
          if ([v23 length])
          {
            __int128 v29 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:v47]);
            os_log_type_t v30 = (void *)objc_claimAutoreleasedReturnValue([v29 string]);

            if ([v30 length])
            {
              unsigned int v31 = objc_msgSend( v45,  "characterIsMember:",  objc_msgSend(v30, "characterAtIndex:", (char *)objc_msgSend(v30, "length") - 1));
              id v32 = @" ";
              if (v31) {
                id v32 = &stru_10017A920;
              }
            }

            else
            {
              id v32 = @" ";
            }

            uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@",  v32,  v23));
            id v34 = (void *)objc_claimAutoreleasedReturnValue([v43 objectAtIndexedSubscript:v47]);
            unint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v34 objectForVariant:54]);

            if (v35)
            {
              id v36 = v23;

              uint64_t v33 = v36;
            }

            uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v30 stringByAppendingString:v33]);
            v38 = (void *)objc_claimAutoreleasedReturnValue([v43 objectAtIndexedSubscript:v47]);
            [v38 setString:v37 overrideOriginalString:1];

            uint64_t v5 = v43;
          }
        }

        else
        {
          -[NSMutableIndexSet addIndex:](v42, "addIndex:", v4);
          unint64_t v47 = v4;
        }

        ++v4;

        _Block_object_dispose(&v53, 8);
      }

      while (v44 != (id)v4);
    }

    id v39 = (void *)objc_claimAutoreleasedReturnValue([v5 objectsAtIndexes:v42]);
    id v40 = [v39 count];
    if (v40 < [v5 count])
    {
      -[VOTOutputRequest removeActions](v41, "removeActions");
      -[NSMutableArray addObjectsFromArray:](v41->_outputActions, "addObjectsFromArray:", v39);
    }
  }

- (id)addAttributedString:(id)a3
{
  return -[VOTOutputRequest addAttributedString:withLanguage:](self, "addAttributedString:withLanguage:", a3, 0LL);
}

- (id)addString:(id)a3
{
  id v4 = a3;
  else {
    uint64_t v5 = objc_claimAutoreleasedReturnValue( -[VOTOutputRequest addString:breakWords:withLanguage:atIndex:]( self,  "addString:breakWords:withLanguage:atIndex:",  v4,  0LL,  0LL,  0x7FFFFFFFFFFFFFFFLL));
  }
  id v6 = (void *)v5;

  return v6;
}

- (id)addString:(id)a3 withLanguage:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  else {
    uint64_t v8 = objc_claimAutoreleasedReturnValue( -[VOTOutputRequest addString:breakWords:withLanguage:atIndex:]( self,  "addString:breakWords:withLanguage:atIndex:",  v7,  0LL,  v6,  0x7FFFFFFFFFFFFFFFLL));
  }
  id v9 = (void *)v8;

  return v9;
}

- (id)addString:(id)a3 brailleString:(id)a4 withLanguage:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  if ([v8 isAXAttributedString])
  {
    uint64_t v11 = UIAccessibilityTokenBrailleOverride;
    id v12 = v8;
    [v12 setAttribute:v10 forKey:v11];

    id v13 = (void *)objc_claimAutoreleasedReturnValue( -[VOTOutputRequest addAttributedString:withLanguage:]( self,  "addAttributedString:withLanguage:",  v12,  v9));
    id v10 = v12;
  }

  else
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue( -[VOTOutputRequest addString:brailleString:breakWords:withLanguage:atIndex:]( self,  "addString:brailleString:breakWords:withLanguage:atIndex:",  v8,  v10,  0LL,  v9,  0x7FFFFFFFFFFFFFFFLL));
  }

  return v13;
}

- (id)addString:(id)a3 category:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if ([v7 isAXAttributedString]) {
    uint64_t v8 = objc_claimAutoreleasedReturnValue( -[VOTOutputRequest addAttributedString:withLanguage:category:]( self,  "addAttributedString:withLanguage:category:",  v7,  0LL,  v6));
  }
  else {
    uint64_t v8 = objc_claimAutoreleasedReturnValue( -[VOTOutputRequest addString:breakWords:withLanguage:atIndex:category:]( self,  "addString:breakWords:withLanguage:atIndex:category:",  v7,  0LL,  0LL,  0x7FFFFFFFFFFFFFFFLL,  v6));
  }
  id v9 = (void *)v8;

  return v9;
}

- (id)addString:(id)a3 withLanguage:(id)a4 category:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  if ([v10 isAXAttributedString]) {
    uint64_t v11 = objc_claimAutoreleasedReturnValue( -[VOTOutputRequest addAttributedString:withLanguage:category:]( self,  "addAttributedString:withLanguage:category:",  v10,  v9,  v8));
  }
  else {
    uint64_t v11 = objc_claimAutoreleasedReturnValue( -[VOTOutputRequest addString:breakWords:withLanguage:atIndex:category:]( self,  "addString:breakWords:withLanguage:atIndex:category:",  v10,  0LL,  v9,  0x7FFFFFFFFFFFFFFFLL,  v8));
  }
  id v12 = (void *)v11;

  return v12;
}

+ (id)stringShouldSeparateDueToLanguage:(id)a3 language:(id)a4 keyboardLanguageHint:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  unint64_t v126 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  uint64_t v141 = (uint64_t)[v7 length];
  __int128 v135 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet whitespaceAndNewlineCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "whitespaceAndNewlineCharacterSet"));
  v128 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableCharacterSet punctuationCharacterSet]( &OBJC_CLASS___NSMutableCharacterSet,  "punctuationCharacterSet"));
  v124 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet decimalDigitCharacterSet](&OBJC_CLASS___NSCharacterSet, "decimalDigitCharacterSet"));
  id v130 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet characterSetWithCharactersInString:]( &OBJC_CLASS___NSCharacterSet,  "characterSetWithCharactersInString:",  @"ー"));
  if (v8)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[AXLanguageManager sharedInstance](&OBJC_CLASS___AXLanguageManager, "sharedInstance"));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 dialectForLanguageID:v8]);

    id v131 = v8;
  }

  else
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace selectedLanguage]);

    if (v12)
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue(+[AXLanguageManager sharedInstance](&OBJC_CLASS___AXLanguageManager, "sharedInstance"));
      id v14 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace selectedLanguage]);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v13 dialectForLanguageID:v14]);
    }

    else
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v13 currentLanguageMap]);
    }

    id v15 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace selectedLanguage]);
    id v16 = v15;
    if (v15)
    {
      id v131 = v15;
    }

    else
    {
      id v131 = (id)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace systemSpokenLanguage]);
    }
  }

  v129 = (void *)objc_claimAutoreleasedReturnValue(+[AXLanguageManager sharedInstance](&OBJC_CLASS___AXLanguageManager, "sharedInstance"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v11 specificLanguageID]);
  int v127 = sub_100034B24(v17);
  int v125 = sub_100034B78();
  id v122 = v17;
  unint64_t v133 = (unint64_t)v9;
  id v123 = v8;
  __int128 v134 = objc_alloc_init(&OBJC_CLASS___AXIndexMap);
  v145 = v11;
  if (v141 < 1)
  {
    __int128 v18 = 0LL;
    uint64_t v137 = 0LL;
    uint64_t v146 = 0LL;
    goto LABEL_171;
  }

  uint64_t v146 = 0LL;
  uint64_t v137 = 0LL;
  BYTE4(v132) = 0;
  __int128 v18 = 0LL;
  uint64_t v19 = 0LL;
  v142 = v7;
  do
  {
    id v20 = v18;
    id v21 = [v7 rangeOfComposedCharacterSequenceAtIndex:v19];
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "substringWithRange:", v21, v22));
    id v23 = [v18 characterAtIndex:0];
    if ([v18 length] == (id)1)
    {
      if ([v135 characterIsMember:v23])
      {
        BYTE4(v132) &= v127 ^ 1;
LABEL_18:
        id v24 = v18;
        goto LABEL_168;
      }
    }

    v138 = v20;
    id v25 = sub_100034BF4();
    BOOL v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    unsigned int v27 = [v26 characterIsMember:v23];

    id v28 = sub_100034B80();
    __int128 v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    unsigned int v151 = v23;
    unsigned int v30 = [v29 characterIsMember:v23];

    unint64_t v136 = v18;
    if ((sub_10004A990(v145, v131, v18) & 1) != 0 || (v27 & 1) != 0 || v30)
    {
      if ((v127 & v27 & 1) == 0 && (!v125 || !v30))
      {
        LODWORD(v132) = 0;
        id v20 = 0LL;
        int v31 = 1;
        goto LABEL_74;
      }

      if ((v132 & 0x100000000LL) != 0)
      {
        LODWORD(v132) = 0;
      }

      else
      {
        id v32 = [v138 characterAtIndex:0];
        uint64_t v33 = v23;
        if (v138)
        {
          id v34 = v32;
          if (([v135 characterIsMember:v32] & 1) == 0
            && ([v128 characterIsMember:v34] & 1) == 0
            && (_DWORD)v34 != 8207
            && ([v124 characterIsMember:v23] & 1) == 0
            && ![v128 characterIsMember:v23])
          {
            uint64_t v132 = 0LL;
            id v20 = 0LL;
            int v31 = 1;
            goto LABEL_75;
          }
        }

        id v35 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
        uint64_t v36 = v19;
        uint64_t v37 = 0LL;
        uint64_t v38 = v19;
        if (v19 < v141)
        {
          while (1)
          {
            id v39 = [v142 characterAtIndex:v38];
            unsigned int v40 = [v135 characterIsMember:v39];
            if (v40)
            {
              if (v37) {
                goto LABEL_47;
              }
              uint64_t v37 = (__CFString *)[v35 mutableCopy];
            }

            id v41 = sub_100034BF4();
            id v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
            unsigned int v43 = v40 | [v42 characterIsMember:v39];

            if (v43 != 1) {
              break;
            }
            if (v37) {
              -[__CFString appendFormat:](v37, "appendFormat:", @"%C", v39);
            }
            else {
              objc_msgSend(v35, "appendFormat:", @"%C", v39);
            }
            uint64_t v19 = v36;
            if (v141 == ++v38)
            {
              uint64_t v38 = v141;
              goto LABEL_47;
            }
          }

          uint64_t v19 = v36;
        }

- (void)addPause:(float)a3
{
  id v7 = [objc_allocWithZone((Class)VOTOutputAction) initWithString:&stru_10017A920];
  *(float *)&double v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v5));
  [v7 setObject:v6 forVariant:38];

  [v7 setOutputRequest:self];
  -[NSMutableArray addObject:](self->_outputActions, "addObject:", v7);
}

- (id)addString:(id)a3 breakWords:(BOOL)a4 withLanguage:(id)a5 atIndex:(int64_t)a6
{
  return -[VOTOutputRequest addString:breakWords:withLanguage:atIndex:category:]( self,  "addString:breakWords:withLanguage:atIndex:category:",  a3,  a4,  a5,  a6,  0LL);
}

- (id)addString:(id)a3 breakWords:(BOOL)a4 withLanguage:(id)a5 atIndex:(int64_t)a6 category:(id)a7
{
  return -[VOTOutputRequest addString:brailleString:breakWords:withLanguage:atIndex:category:]( self,  "addString:brailleString:breakWords:withLanguage:atIndex:category:",  a3,  0LL,  a4,  a5,  a6,  a7);
}

- (id)addString:(id)a3 brailleString:(id)a4 breakWords:(BOOL)a5 withLanguage:(id)a6 atIndex:(int64_t)a7
{
  return -[VOTOutputRequest addString:brailleString:breakWords:withLanguage:atIndex:category:]( self,  "addString:brailleString:breakWords:withLanguage:atIndex:category:",  a3,  a4,  a5,  a6,  a7,  0LL);
}

- (id)addString:(id)a3 brailleString:(id)a4 breakWords:(BOOL)a5 withLanguage:(id)a6 atIndex:(int64_t)a7 category:(id)a8
{
  BOOL v11 = a5;
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v18 = a8;
  if (v14)
  {
    if (!v16)
    {
      uint64_t v19 = (void *)objc_opt_class(self, v17);
      id v20 = (void *)objc_claimAutoreleasedReturnValue(-[VOTOutputRequest keyboardLanguageHint](self, "keyboardLanguageHint"));
      id v21 = (void *)objc_claimAutoreleasedReturnValue( [v19 stringShouldSeparateDueToLanguage:v14 language:0 keyboardLanguageHint:v20]);

      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[AXOutputRequest processStringsAndLanguages:brailleString:breakWords:withLanguage:atIndex:category:]( &OBJC_CLASS___AXOutputRequest,  "processStringsAndLanguages:brailleString:breakWords:withLanguage:atIndex:category:",  v21,  v15,  v11,  0LL,  a7,  v18));
      id v23 = v22;
      if (v22 && [v22 count])
      {
        id v24 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( -[VOTOutputRequest _addAXOutputActions:atIndex:]( self,  "_addAXOutputActions:atIndex:",  v23,  a7));

LABEL_42:
        goto LABEL_43;
      }
    }

    if (self->_sendsToDisplay)
    {
      id v25 = [objc_allocWithZone((Class)VOTOutputAction) initWithTextDisplay:v14];
      [v25 setOutputRequest:self];
      [v25 setObject:v18 forVariant:86];
      BOOL v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  self->_textDisplayDirection));
      [v25 setObject:v26 forVariant:11];
      id v27 = -[NSMutableArray count](self->_outputActions, "count");
      outputActions = self->_outputActions;
      else {
        -[NSMutableArray insertObject:atIndex:](outputActions, "insertObject:atIndex:", v25, a7);
      }
    }

    else
    {
      id v25 = 0LL;
    }

    if ((unint64_t)[v14 length] >= 0x3E9 && v11)
    {
      id v42 = v15;
      __int128 v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet whitespaceAndNewlineCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "whitespaceAndNewlineCharacterSet"));
      id v24 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
      if ((unint64_t)[v14 length] < 0x3E9)
      {
LABEL_34:
        id v33 = v25;
      }

      else
      {
        unsigned int v30 = v14;
        while (2)
        {
          uint64_t v31 = 1000LL;
          while ((objc_msgSend(v29, "characterIsMember:", objc_msgSend(v30, "characterAtIndex:", v31)) & 1) == 0)
          {
            if (--v31 == -1)
            {
              uint64_t v31 = (uint64_t)[v30 length];
              if (v31 < 0)
              {
                id v14 = v30;
                goto LABEL_34;
              }

              break;
            }
          }

          id v32 = (void *)objc_claimAutoreleasedReturnValue([v30 substringToIndex:v31]);
          id v33 = [objc_allocWithZone((Class)VOTOutputAction) initWithString:v32];

          [v33 setObject:v18 forVariant:86];
          [v33 setOutputRequest:self];
          [v33 setWasDivided:1];
          [v33 setObject:v16 forVariant:15];
          -[NSMutableArray addObject:](self->_outputActions, "addObject:", v33);
          -[NSMutableArray addObject:](v24, "addObject:", v33);
          unint64_t v34 = v31 + 1;
          if (v34 >= (unint64_t)[v30 length])
          {

            id v14 = v30;
          }

          else
          {
            id v14 = (id)objc_claimAutoreleasedReturnValue([v30 substringFromIndex:v34]);

            unsigned int v30 = v14;
            id v25 = v33;
          }

          break;
        }
      }

      if ([v14 length])
      {
        id v35 = [objc_allocWithZone((Class)VOTOutputAction) initWithString:v14];

        [v35 setObject:v18 forVariant:86];
        [v35 setOutputRequest:self];
        [v35 setWasDivided:1];
        if ([v16 length]) {
          [v35 setObject:v16 forVariant:15];
        }
        -[NSMutableArray addObject:](self->_outputActions, "addObject:", v35);
        -[NSMutableArray addObject:](v24, "addObject:", v35);
      }

      else
      {
        id v35 = v33;
      }

      id v15 = v42;
    }

    else
    {
      id v35 = [objc_allocWithZone((Class)VOTOutputAction) initWithString:v14 brailleString:v15];

      [v35 setObject:v18 forVariant:86];
      if ([v16 length]) {
        id v36 = v16;
      }
      else {
        id v36 = 0LL;
      }
      [v35 setObject:v36 forVariant:15];
      uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace applicationForCurrentElement]);
      uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue([v37 bundleIdentifier]);
      [v35 setObject:v38 forVariant:43];

      [v35 setOutputRequest:self];
      id v39 = -[NSMutableArray count](self->_outputActions, "count");
      unsigned int v40 = self->_outputActions;
      else {
        -[NSMutableArray insertObject:atIndex:](v40, "insertObject:atIndex:", v35, a7);
      }
      id v43 = v35;
      id v24 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v43,  1LL));
    }

    goto LABEL_42;
  }

  id v24 = 0LL;
LABEL_43:

  return v24;
}

- (void)addSound:(id)a3
{
  id v4 = a3;
  id v5 = [objc_allocWithZone((Class)VOTOutputAction) initWithSoundPath:v4];

  [v5 setOutputRequest:self];
  -[NSMutableArray addObject:](self->_outputActions, "addObject:", v5);
}

- (void)addNotificationEvent:(unsigned int)a3 forDelegate:(id)a4
{
  if (a4)
  {
    outputActions = self->_outputActions;
    id v6 = a4;
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](outputActions, "lastObject"));
    [v7 setObject:v6 forVariant:a3];
  }

- (void)setSendsToDisplay:(BOOL)a3 fromDirection:(int64_t)a4
{
  self->_sendsToDisplay = a3;
  self->_textDisplayDirection = a4;
}

- (BOOL)sendsToDisplay
{
  return self->_sendsToDisplay;
}

- (void)setCannotBeInterrupted:(BOOL)a3
{
  self->_cannotBeInterrupted = a3;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v3 = self->_outputActions;
  id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0LL;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend( *(id *)(*((void *)&v8 + 1) + 8 * (void)v7),  "setObject:forVariant:",  kCFBooleanTrue,  23,  (void)v8);
        id v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
    }

    while (v5);
  }
}

- (BOOL)cannotBeInterrupted
{
  return self->_cannotBeInterrupted;
}

- (id)description
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"[%p] OutputRequest:\n",  self));
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v16 = self;
  id v4 = self->_outputActions;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        __int128 v9 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        [v3 appendString:@"Action: "];
        __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 string]);

        if (v10)
        {
          __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v9 string]);
          [v3 appendFormat:@"'%@'", v11];
        }

        else
        {
          [v3 appendString:@"__NO_STRING__"];
        }

        [v3 appendString:@"\n"];
      }

      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
    }

    while (v6);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v13 = v12;
  if (v16->_cannotBeInterrupted) {
    [v12 addObject:@"Cannot be interrupted"];
  }
  if (v16->_doesNotInterrupt) {
    [v13 addObject:@"Does not interrupt"];
  }
  if ([v13 count])
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "componentsJoinedByString:", @", "));
    [v3 appendFormat:@"%@\n", v14];
  }

  return v3;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTOutputRequest combinedActionString](self, "combinedActionString"));
  if (v4) {
    [v3 setObject:v4 forKeyedSubscript:@"combinedActionString"];
  }
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTOutputRequest combinedOriginalString](self, "combinedOriginalString"));
  if (v5) {
    [v3 setObject:v5 forKeyedSubscript:@"combinedOriginalString"];
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[VOTOutputRequest finishedSuccessfully](self, "finishedSuccessfully")));
  [v3 setObject:v6 forKeyedSubscript:@"finishedSuccessfully"];

  return v3;
}

- (BOOL)startedRequest
{
  return self->startedRequest;
}

- (void)setStartedRequest:(BOOL)a3
{
  self->startedRequest = a3;
}

- (BOOL)disableOutput
{
  return self->disableOutput;
}

- (void)setDisableOutput:(BOOL)a3
{
  self->disableOutput = a3;
}

- (BOOL)finishedSuccessfully
{
  return self->finishedSuccessfully;
}

- (void)setFinishedSuccessfully:(BOOL)a3
{
  self->finishedSuccessfully = a3;
}

- (NSArray)elementHeadersForOutput
{
  return self->elementHeadersForOutput;
}

- (void)setElementHeadersForOutput:(id)a3
{
}

- (BOOL)lastSystemRequest
{
  return self->lastSystemRequest;
}

- (void)setLastSystemRequest:(BOOL)a3
{
  self->lastSystemRequest = a3;
}

- (BOOL)cancelRequest
{
  return self->cancelRequest;
}

- (void)setCancelRequest:(BOOL)a3
{
  self->cancelRequest = a3;
}

- (NSArray)imageCaptionResults
{
  return self->imageCaptionResults;
}

- (void)setImageCaptionResults:(id)a3
{
}

- (void)setCompletionDelegate:(id)a3
{
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (id)actionCompletionBlock
{
  return self->_actionCompletionBlock;
}

- (void)setActionCompletionBlock:(id)a3
{
}

- (id)startBlock
{
  return self->_startBlock;
}

- (void)setStartBlock:(id)a3
{
}

- (int)limitToComponentType
{
  return self->_limitToComponentType;
}

- (void)setLimitToComponentType:(int)a3
{
  self->_limitToComponentType = a3;
}

- (int64_t)originationType
{
  return self->_originationType;
}

- (void)setOriginationType:(int64_t)a3
{
  self->_originationType = a3;
}

- (id)requestQueueMixinBehavior
{
  return self->_requestQueueMixinBehavior;
}

- (void)setRequestQueueMixinBehavior:(id)a3
{
}

- (BOOL)generatesBraille
{
  return self->_generatesBraille;
}

- (void)setGeneratesBraille:(BOOL)a3
{
  self->_generatesBraille = a3;
}

- (BOOL)suppressSpeech
{
  return self->_suppressSpeech;
}

- (void)setSuppressSpeech:(BOOL)a3
{
  self->_suppressSpeech = a3;
}

- (int)brailleType
{
  return self->_brailleType;
}

- (void)setBrailleType:(int)a3
{
  self->_brailleType = a3;
}

- (NSNumber)brailleAlertTimeout
{
  return (NSNumber *)objc_loadWeakRetained((id *)&self->_brailleAlertTimeout);
}

- (void)setBrailleAlertTimeout:(id)a3
{
}

- (_NSRange)brailleLineRange
{
  NSUInteger length = self->_brailleLineRange.length;
  NSUInteger location = self->_brailleLineRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setBrailleLineRange:(_NSRange)a3
{
  self->_brailleLineRange = a3;
}

- (NSString)supplementalBrailleDescription
{
  return self->_supplementalBrailleDescription;
}

- (void)setSupplementalBrailleDescription:(id)a3
{
}

- (BOOL)synthesizeSilently
{
  return self->_synthesizeSilently;
}

- (void)setSynthesizeSilently:(BOOL)a3
{
  self->_synthesizeSilently = a3;
}

- (BOOL)isComputerVisionAsynchrousRequest
{
  return self->_isComputerVisionAsynchrousRequest;
}

- (void)setIsComputerVisionAsynchrousRequest:(BOOL)a3
{
  self->_isComputerVisionAsynchrousRequest = a3;
}

- (NSString)keyboardLanguageHint
{
  return self->_keyboardLanguageHint;
}

- (void)setKeyboardLanguageHint:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)addTVElement:(id)a3 filterWithAspectMask:(BOOL)a4
{
}

- (void)addTVElement:(id)a3 servesAsHeader:(BOOL)a4 filterWithAspectMask:(BOOL)a5
{
  BOOL v5 = a5;
  id v28 = a3;
  if (a4 || (unint64_t v8 = (unint64_t)[v28 traits], (kAXHeaderTrait & v8) != 0))
  {
    if (!v5 || ([v28 aspectMask] & 1) != 0)
    {
      id v9 = objc_alloc(&OBJC_CLASS___AXAttributedString);
      __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v28 label]);
      id v11 = [v9 initWithString:v10];

      uint64_t v12 = AXUIAccessibilitySpeechAttributePitch;
      [v11 setAttribute:&off_1001873D0 forKey:AXUIAccessibilitySpeechAttributePitch];
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v28 language]);
      id v14 = -[VOTOutputRequest addAttributedString:withLanguage:](self, "addAttributedString:withLanguage:", v11, v13);

      if (!v5) {
        goto LABEL_8;
      }
    }

    unsigned __int8 v15 = [v28 aspectMask];
    id v16 = v28;
    if ((v15 & 2) != 0)
    {
      uint64_t v12 = AXUIAccessibilitySpeechAttributePitch;
LABEL_8:
      id v17 = objc_alloc(&OBJC_CLASS___AXAttributedString);
      __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v28 value]);
      id v19 = [v17 initWithString:v18];

      [v19 setAttribute:&off_1001873D0 forKey:v12];
      __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v28 language]);
      id v21 = -[VOTOutputRequest addAttributedString:withLanguage:](self, "addAttributedString:withLanguage:", v19, v20);
      goto LABEL_9;
    }
  }

  else
  {
    if (v5) {
      uint64_t v22 = 17827842LL;
    }
    else {
      uint64_t v22 = 16779266LL;
    }
    [v28 addTextualInformationToRequest:self options:v22 dataPackage:0];
    unsigned int v23 = [v28 doesHaveTraits:kAXKeyboardKeyTrait];
    id v16 = v28;
    if (v23)
    {
      id v24 = [v28 aspectMask];
      id v16 = v28;
      if (v24)
      {
        id v19 = (id)objc_claimAutoreleasedReturnValue([v28 label]);
        if ([v19 length] != (id)1) {
          goto LABEL_10;
        }
        id v25 = sub_10004B920(v19, 0LL, 0LL);
        __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(v25);
        if ([v20 length])
        {
          LODWORD(v26) = 0.75;
          -[VOTOutputRequest addPause:](self, "addPause:", v26);
          id v27 = -[VOTOutputRequest addString:](self, "addString:", v20);
        }

@end