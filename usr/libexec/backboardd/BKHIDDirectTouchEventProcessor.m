@interface BKHIDDirectTouchEventProcessor
+ (NSArray)digitizerMatchingDictionaries;
- (BKHIDDirectTouchEventProcessor)initWithContext:(id)a3;
- (BKIOHIDService)mainDisplayAOPDigitizerService;
- (BKIOHIDService)mainDisplayDigitizerService;
- (BKIOHIDService)mainDisplayPencilDigitizerService;
- (BOOL)_queue_hasTouchEnterSlots;
- (BOOL)detachTouchIdentifiers:(unsigned int *)a3 count:(int64_t)a4 assignUserIdentifier:(unsigned int)a5 policy:(id)a6 offset:(CGPoint)a7;
- (BOOL)handlesPersistentPropertiesForSenderDescriptor:(id)a3;
- (BOOL)shouldIgnoreTouchesWhileObjectInProximity;
- (id)_determineServiceForEvent:(__IOHIDEvent *)a3 sender:(id)a4 fromTouchPad:(BOOL *)a5;
- (id)_persistentPropertyKeyDenylist;
- (id)_queue_addDigitizerStateForService:(id)a3;
- (id)_queue_applyCachedPropertiesToMultitouchService:(id)a3;
- (id)_queue_contextIDsToIgnoreForZoomSenders;
- (id)_queue_digitizerStateForService:(id)a3;
- (id)_queue_displayInfoForDisplay:(id)a3 createIfNeeded:(BOOL)a4;
- (id)_queue_servicesMatchingSenderDescriptor:(id)a3;
- (id)_queue_slotRecordForSlotID:(unsigned int)a3;
- (id)_queue_touchStreamClientForReference:(unsigned int)a3;
- (id)_queue_touchStreamInfoForDisplayUUID:(id)a3 createIfNeeded:(BOOL)a4;
- (id)authenticationSpecificationForSlotID:(unsigned int)a3 registrantEntitled:(BOOL *)a4;
- (id)cancelAndSuppressTouchesOnDisplay:(id)a3 reason:(id)a4;
- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5;
- (int64_t)setPersistentProperties:(id)a3 forServicesMatchingDescriptor:(id)a4;
- (unsigned)_queue_addTouchStreamClient:(id)a3 toDisplayUUID:(id)a4 versionedPID:(int64_t)a5;
- (unsigned)addTouchStreamForContextID:(unsigned int)a3 display:(id)a4 versionedPID:(int64_t)a5 identifier:(unsigned int)a6 shouldSendAmbiguityRecommendations:(BOOL)a7;
- (void)_handleDirectTouchEvent:(__IOHIDEvent *)a3 service:(id)a4;
- (void)_queue_addServicesMatchingSenderDescriptor:(id)a3 inPerDisplayInfo:(id)a4 toArray:(id)a5;
- (void)_queue_enumerateDigitizersForAllDisplaysUsingBlock:(id)a3;
- (void)_queue_enumerateDigitizersForDisplay:(id)a3 usingBlock:(id)a4;
- (void)_queue_enumerateTouchStreamsForAllDisplaysUsingBlock:(id)a3;
- (void)_queue_resetTouchAuthenticationInitialSampleEvent;
- (void)_queue_windowServerDidDeleteSlotID:(unsigned int)a3;
- (void)addTouchAuthenticationSpecifications:(id)a3 registrantEntitled:(BOOL)a4;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)applyExtendedHitTestInformationForCAScreenCoordinates:(CGPoint)a3 displayUUID:(id)a4 toPathAttributes:(id)a5 secureName:(unsigned int)a6 excludeContextIDs:(id)a7;
- (void)cancelTouchesOnAllDisplays;
- (void)cancelTouchesOnDisplay:(id)a3;
- (void)cancelTouchesOnMainDisplay;
- (void)cancelTouchesWithIdentifiers:(id)a3;
- (void)dealloc;
- (void)didInitializeRegistryWithContext:(id)a3;
- (void)globalKeyboardModifiersDidChange:(int64_t)a3;
- (void)invalidateTouchStreamReference:(unsigned int)a3;
- (void)matcher:(id)a3 servicesDidMatch:(id)a4;
- (void)postTouchAnnotations:(id)a3 sourcePID:(int)a4;
- (void)serviceDidDisappear:(id)a3;
- (void)setBuiltInDisplayInterfaceOrientation:(int64_t)a3;
- (void)setEventDispatchMode:(unsigned __int8)a3 ambiguityRecommendation:(unsigned __int8)a4 lastTouchTimestamp:(double)a5 forTouchStreamIdentifier:(unsigned int)a6;
- (void)setExcludedZoomContextIDs:(id)a3 fromVersionedPID:(int64_t)a4;
- (void)setHitTestRegions:(id)a3 forDisplay:(id)a4;
- (void)setOffset:(CGPoint)a3 forTouchesWithUserIdentifier:(unsigned int)a4;
- (void)setRoutingPolicy:(id)a3 forTouchesWithUserIdentifier:(unsigned int)a4;
- (void)setShouldIgnoreTouchesWhileObjectInProximity:(BOOL)a3;
- (void)transferTouchIdentifiers:(unsigned int *)a3 count:(int64_t)a4 toContextID:(unsigned int)a5;
@end

@implementation BKHIDDirectTouchEventProcessor

- (BKHIDDirectTouchEventProcessor)initWithContext:(id)a3
{
  obj = objc_alloc_init(&OBJC_CLASS___BKHIDEventHitTestDispatcher);
  id v5 = sub_10002D41C();
  id v41 = (id)objc_claimAutoreleasedReturnValue(v5);
  id v43 = (id)objc_claimAutoreleasedReturnValue( +[BKIOHIDServicePersistentPropertyController digitizerServicePersistentPropertyController]( &OBJC_CLASS___BKIOHIDServicePersistentPropertyController,  "digitizerServicePersistentPropertyController"));
  if (self
    && (v60.receiver = self,
        v60.super_class = (Class)&OBJC_CLASS___BKHIDDirectTouchEventProcessor,
        v6 = -[BKHIDDirectTouchEventProcessor init](&v60, "init"),
        (v7 = v6) != 0LL))
  {
    objc_storeStrong((id *)&v6->_dispatcher, obj);
    objc_storeStrong((id *)&v7->_touchEventServer, v41);
    objc_storeStrong((id *)&v7->_persistentPropertyController, v43);
    uint64_t v8 = BSDispatchQueueCreateWithFixedPriority("BKDigitizerInfoArbiterDispatchQueue", 0LL, 63LL);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue([a3 serviceMatcherDataProvider]);
    v11 = objc_alloc(&OBJC_CLASS___BKIOHIDServiceSimplePersistentPropertySupport);
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[BKSHIDEventSenderDescriptor stylusOpaqueTouchDigitizer]( &OBJC_CLASS___BKSHIDEventSenderDescriptor,  "stylusOpaqueTouchDigitizer"));
    v13 = -[BKIOHIDServiceSimplePersistentPropertySupport initWithSenderDescriptor:matcherDataProvider:persistentPropertyController:]( v11,  "initWithSenderDescriptor:matcherDataProvider:persistentPropertyController:",  v12,  v10,  v43);
    pencilOpaqueTouchPersistentPropertySupport = v7->_pencilOpaqueTouchPersistentPropertySupport;
    v7->_pencilOpaqueTouchPersistentPropertySupport = v13;

    [v43 registerHandler:v7->_pencilOpaqueTouchPersistentPropertySupport];
    v15 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v58 = 0u;
    __int128 v59 = 0u;
    __int128 v56 = 0u;
    __int128 v57 = 0u;
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[BKHIDDirectTouchEventProcessor digitizerMatchingDictionaries]( &OBJC_CLASS___BKHIDDirectTouchEventProcessor,  "digitizerMatchingDictionaries"));
    id v17 = [v16 countByEnumeratingWithState:&v56 objects:v63 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v57;
      do
      {
        for (i = 0LL; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v57 != v18) {
            objc_enumerationMutation(v16);
          }
          v20 = -[BKIOHIDServiceMatcher initWithMatchingDictionary:dataProvider:]( objc_alloc(&OBJC_CLASS___BKIOHIDServiceMatcher),  "initWithMatchingDictionary:dataProvider:",  *(void *)(*((void *)&v56 + 1) + 8LL * (void)i),  v10);
          -[NSMutableArray addObject:](v15, "addObject:", v20);
        }

        id v17 = [v16 countByEnumeratingWithState:&v56 objects:v63 count:16];
      }

      while (v17);
    }

    objc_storeStrong((id *)&v7->_matchers, v15);
    v7->_queue_startMainDisplayDigitizerMatchingTime = BSContinuousMachTimeNow(v21);
    objc_initWeak(&location, v7);
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    v22 = v15;
    id v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v22,  "countByEnumeratingWithState:objects:count:",  &v51,  v62,  16LL);
    if (v23)
    {
      uint64_t v24 = *(void *)v52;
      do
      {
        for (j = 0LL; j != v23; j = (char *)j + 1)
        {
          if (*(void *)v52 != v24) {
            objc_enumerationMutation(v22);
          }
          [*(id *)(*((void *)&v51 + 1) + 8 * (void)j) startObserving:v7 queue:v7->_queue];
        }

        id v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v22,  "countByEnumeratingWithState:objects:count:",  &v51,  v62,  16LL);
      }

      while (v23);
    }

    v40 = (void *)objc_claimAutoreleasedReturnValue(+[BKSDefaults localDefaults](&OBJC_CLASS___BKSDefaults, "localDefaults"));
    v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "digitizerSignpostsEnabled"));
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    v28 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
    id v29 = [v40 observeDefault:v26 onQueue:v28 withBlock:&stru_1000B6830];

    v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "digitizerVisualizeTouches"));
    v61[0] = v30;
    v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "digitizerVisualizeHitTestRegions"));
    v61[1] = v31;
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v61, 2LL));
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472LL;
    v49[2] = sub_10003ECB8;
    v49[3] = &unk_1000B8058;
    v33 = v7;
    v50 = v33;
    id v34 = [v40 observeDefaults:v32 onQueue:v28 withBlock:v49];

    v35 = v7->_queue;
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472LL;
    v47[2] = sub_10003ED24;
    v47[3] = &unk_1000B76D8;
    objc_copyWeak(&v48, &location);
    id v36 = (id)BSLogAddStateCaptureBlockWithTitle( v35,  @"BKDirectTouch",  v47);
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[CAWindowServer serverIfRunning](&OBJC_CLASS___CAWindowServer, "serverIfRunning"));
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472LL;
    v44[2] = sub_10003ED88;
    v44[3] = &unk_1000B6878;
    objc_copyWeak(&v46, &location);
    v38 = v33;
    v45 = v38;
    [v37 setSlotDeletionCallback:v44];

    -[BKIOHIDServicePersistentPropertyController registerHandler:]( v7->_persistentPropertyController,  "registerHandler:",  v38);
    objc_destroyWeak(&v46);
    objc_destroyWeak(&v48);

    objc_destroyWeak(&location);
  }

  else
  {
    v38 = 0LL;
  }

  return v38;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___BKHIDDirectTouchEventProcessor;
  -[BKHIDDirectTouchEventProcessor dealloc](&v3, "dealloc");
}

- (void)didInitializeRegistryWithContext:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue([a3 eventProcessorRegistry]);
  id v6 = objc_msgSend(v4, "eventProcessorOfClass:", objc_opt_class(BKKeyboardHIDEventProcessor, v5));
  id v9 = (id)objc_claimAutoreleasedReturnValue(v6);

  v7 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue([v9 addGlobalKeyboardObserver:self]);
  globalKeyboardObserver = self->_globalKeyboardObserver;
  self->_globalKeyboardObserver = v7;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10003EC40;
  v6[3] = &unk_1000B8030;
  v6[4] = a3;
  v6[5] = self;
  [a3 appendProem:self block:v6];
  id v5 = [a3 appendObject:self->_queue_perDisplayInfo withName:@"perDisplayInfo"];
}

- (BKIOHIDService)mainDisplayDigitizerService
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = sub_10003B28C;
  v10 = sub_10003B29C;
  id v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10003EC2C;
  v5[3] = &unk_1000B8080;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (BKIOHIDService *)v3;
}

- (BKIOHIDService)mainDisplayAOPDigitizerService
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = sub_10003B28C;
  v10 = sub_10003B29C;
  id v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10003EC18;
  v5[3] = &unk_1000B8080;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (BKIOHIDService *)v3;
}

- (BKIOHIDService)mainDisplayPencilDigitizerService
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = sub_10003B28C;
  v10 = sub_10003B29C;
  id v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10003EC04;
  v5[3] = &unk_1000B8080;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (BKIOHIDService *)v3;
}

- (void)cancelTouchesWithIdentifiers:(id)a3
{
  uint64_t v5 = (uint64_t)[a3 count];
  uint64_t v7 = BKLogTouchEvents(v5, v6);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = v8;
  if (v5 < 31)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v13 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "cancel touches with identifiers: %{public}@",  buf,  0xCu);
    }

    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10003EA1C;
    block[3] = &unk_1000B6F40;
    block[4] = a3;
    block[5] = self;
    block[6] = v5;
    dispatch_async(queue, block);
  }

  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v13) = v5;
      _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "too many touch identifiers passed to CancelTouchesWithIdentifiers (%d)",  buf,  8u);
    }
  }

- (void)cancelTouchesOnDisplay:(id)a3
{
  uint64_t v5 = BKLogTouchEvents(self, a2);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = a3;
    id v8 = [v7 length];
    id v9 = (void *)BKSDisplayUUIDMainKey;
    if (v8) {
      id v9 = v7;
    }
    id v10 = v9;

    *(_DWORD *)buf = 138543362;
    id v15 = v10;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "soft cancel on display:%{public}@", buf, 0xCu);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10003E9F8;
  v13[3] = &unk_1000B8030;
  v13[4] = self;
  v13[5] = a3;
  dispatch_async(queue, v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[BKTouchPadManager sharedInstance](&OBJC_CLASS___BKTouchPadManager, "sharedInstance"));
  [v12 sendCancelEventForDisplay:a3];
}

- (void)cancelTouchesOnMainDisplay
{
}

- (void)cancelTouchesOnAllDisplays
{
  uint64_t v3 = BKLogTouchEvents(self, a2);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "soft cancel on all displays", buf, 2u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003E9D8;
  block[3] = &unk_1000B8058;
  block[4] = self;
  dispatch_async(queue, block);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[BKTouchPadManager sharedInstance](&OBJC_CLASS___BKTouchPadManager, "sharedInstance"));
  [v6 sendCancelEventForAllDisplays];
}

- (id)cancelAndSuppressTouchesOnDisplay:(id)a3 reason:(id)a4
{
  uint64_t v7 = BKLogTouchEvents(self, a2);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v22 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "canceling events for suppression reason: %{public}@",  buf,  0xCu);
  }

  id v9 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003E800;
  block[3] = &unk_1000B6F18;
  block[4] = self;
  void block[5] = a3;
  id v11 = v9;
  v19 = v11;
  id v20 = a4;
  dispatch_sync(queue, block);
  id v12 = objc_alloc(&OBJC_CLASS___BSSimpleAssertion);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10003E894;
  v16[3] = &unk_1000B6948;
  id v13 = v11;
  id v17 = v13;
  id v14 = [v12 initWithIdentifier:@"touch-suppression-cancel-array" forReason:a4 invalidationBlock:v16];

  return v14;
}

- (void)setHitTestRegions:(id)a3 forDisplay:(id)a4
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003E6EC;
  block[3] = &unk_1000B7158;
  block[4] = self;
  void block[5] = a4;
  void block[6] = a3;
  dispatch_async(queue, block);
}

- (unsigned)addTouchStreamForContextID:(unsigned int)a3 display:(id)a4 versionedPID:(int64_t)a5 identifier:(unsigned int)a6 shouldSendAmbiguityRecommendations:(BOOL)a7
{
  uint64_t v14 = 0LL;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000LL;
  int v17 = -1;
  queue = (dispatch_queue_s *)self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10003DD70;
  v10[3] = &unk_1000B6998;
  v10[4] = self;
  v10[5] = a4;
  unsigned int v11 = a3;
  unsigned int v12 = a6;
  BOOL v13 = a7;
  v10[6] = &v14;
  v10[7] = a5;
  dispatch_sync(queue, v10);
  unsigned int v8 = *((_DWORD *)v15 + 6);
  _Block_object_dispose(&v14, 8);
  return v8;
}

- (void)invalidateTouchStreamReference:(unsigned int)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10003DB14;
  v4[3] = &unk_1000B7CF0;
  v4[4] = self;
  unsigned int v5 = a3;
  dispatch_async(queue, v4);
}

- (void)setEventDispatchMode:(unsigned __int8)a3 ambiguityRecommendation:(unsigned __int8)a4 lastTouchTimestamp:(double)a5 forTouchStreamIdentifier:(unsigned int)a6
{
  v11[0] = 0LL;
  v11[1] = v11;
  v11[2] = 0x2020000000LL;
  unsigned __int8 v12 = a3;
  v9[0] = 0LL;
  v9[1] = v9;
  v9[2] = 0x2020000000LL;
  unsigned __int8 v10 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003D404;
  block[3] = &unk_1000B69E8;
  unsigned int v8 = a6;
  block[4] = self;
  void block[5] = v9;
  void block[6] = v11;
  *(double *)&void block[7] = a5;
  dispatch_async(queue, block);
  _Block_object_dispose(v9, 8);
  _Block_object_dispose(v11, 8);
}

- (void)transferTouchIdentifiers:(unsigned int *)a3 count:(int64_t)a4 toContextID:(unsigned int)a5
{
  queue = (dispatch_queue_s *)self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10003CB00;
  v6[3] = &unk_1000B6A30;
  v6[4] = self;
  v6[5] = a3;
  void v6[6] = a4;
  unsigned int v7 = a5;
  dispatch_sync(queue, v6);
}

- (BOOL)detachTouchIdentifiers:(unsigned int *)a3 count:(int64_t)a4 assignUserIdentifier:(unsigned int)a5 policy:(id)a6 offset:(CGPoint)a7
{
  uint64_t v13 = 0LL;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000LL;
  char v16 = 0;
  queue = (dispatch_queue_s *)self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10003C69C;
  v10[3] = &unk_1000B6A80;
  v10[6] = &v13;
  v10[7] = a3;
  void v10[8] = a4;
  unsigned int v12 = a5;
  v10[4] = self;
  v10[5] = a6;
  CGPoint v11 = a7;
  dispatch_sync(queue, v10);
  char v8 = *((_BYTE *)v14 + 24);
  _Block_object_dispose(&v13, 8);
  return v8;
}

- (void)setRoutingPolicy:(id)a3 forTouchesWithUserIdentifier:(unsigned int)a4
{
  if (a4)
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10003C3D8;
    block[3] = &unk_1000B80A8;
    block[4] = self;
    void block[5] = a3;
    unsigned int v8 = a4;
    dispatch_sync(queue, block);
  }

  else
  {
    uint64_t v5 = BKLogTouchEvents(self, a2);
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "cannot alter routing policy for touches with zero userIdentifer",  buf,  2u);
    }
  }

- (void)setOffset:(CGPoint)a3 forTouchesWithUserIdentifier:(unsigned int)a4
{
  if (a4)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10003C21C;
    v7[3] = &unk_1000B6A30;
    v7[4] = self;
    CGPoint v8 = a3;
    unsigned int v9 = a4;
    dispatch_sync(queue, v7);
  }

  else
  {
    uint64_t v5 = BKLogTouchEvents(self, a2);
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "cannot alter touch offset for zero userIdentifer",  buf,  2u);
    }
  }

- (void)postTouchAnnotations:(id)a3 sourcePID:(int)a4
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003BFAC;
  block[3] = &unk_1000B80A8;
  block[4] = self;
  void block[5] = a3;
  int v6 = a4;
  dispatch_async(queue, block);
}

- (BOOL)shouldIgnoreTouchesWhileObjectInProximity
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_shouldIgnoreTouchesWhileObjectInProximity;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setShouldIgnoreTouchesWhileObjectInProximity:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_shouldIgnoreTouchesWhileObjectInProximity = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setExcludedZoomContextIDs:(id)a3 fromVersionedPID:(int64_t)a4
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003BE70;
  block[3] = &unk_1000B6F40;
  block[4] = self;
  void block[5] = a3;
  void block[6] = a4;
  dispatch_async(queue, block);
}

- (void)setBuiltInDisplayInterfaceOrientation:(int64_t)a3
{
  else {
    uint64_t v5 = dword_10008C430[a3 - 1];
  }
  persistentPropertyController = self->_persistentPropertyController;
  unsigned int v12 = @"GraphicsOrientation";
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v5));
  uint64_t v13 = v7;
  CGPoint v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v13,  &v12,  1LL));
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue( +[BKSHIDEventSenderDescriptor anyBuiltinTouchscreenDigitizer]( &OBJC_CLASS___BKSHIDEventSenderDescriptor,  "anyBuiltinTouchscreenDigitizer"));
  -[BKIOHIDServicePersistentPropertyController setPersistentProperties:forSenderDescriptor:]( persistentPropertyController,  "setPersistentProperties:forSenderDescriptor:",  v8,  v9);

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003BDFC;
  block[3] = &unk_1000B7ED8;
  block[4] = self;
  void block[5] = a3;
  dispatch_async(queue, block);
}

- (id)authenticationSpecificationForSlotID:(unsigned int)a3 registrantEntitled:(BOOL *)a4
{
  *a4 = 0;
  if (!a3) {
    return 0LL;
  }
  uint64_t v9 = 0LL;
  unsigned __int8 v10 = &v9;
  uint64_t v11 = 0x3032000000LL;
  unsigned int v12 = sub_10003B28C;
  uint64_t v13 = sub_10003B29C;
  id v14 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10003BD38;
  v7[3] = &unk_1000B6AF0;
  unsigned int v8 = a3;
  v7[4] = self;
  void v7[5] = &v9;
  v7[6] = a4;
  dispatch_sync(queue, v7);
  id v5 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v5;
}

- (void)addTouchAuthenticationSpecifications:(id)a3 registrantEntitled:(BOOL)a4
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003BA74;
  block[3] = &unk_1000B6B18;
  block[4] = self;
  void block[5] = a3;
  BOOL v6 = a4;
  dispatch_sync(queue, block);
}

- (void)_queue_resetTouchAuthenticationInitialSampleEvent
{
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  uint64_t v3 = self->_queue_touchEnterSlotIDs;
  id v4 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v15,  v21,  16LL);
  if (v4)
  {
    uint64_t v5 = 0LL;
    uint64_t v6 = *(void *)v16;
    do
    {
      unsigned int v7 = 0LL;
      do
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_queue_slotIDToSlotRecord,  "objectForKey:",  *(void *)(*((void *)&v15 + 1) + 8LL * (void)v7),  (void)v15));
        if (v8)
        {
          else {
            uint64_t v9 = 2LL;
          }
          v8[3] = v9;
        }

        unsigned int v7 = (char *)v7 + 1;
      }

      while (v4 != v7);
      id v4 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v15,  v21,  16LL);
      v5 += (uint64_t)v7;
    }

    while (v4);
  }

  uint64_t v12 = BKLogTouchEvents(v10, v11);
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    queue_touchEnterSlotIDs = self->_queue_touchEnterSlotIDs;
    *(_DWORD *)buf = 138543362;
    id v20 = queue_touchEnterSlotIDs;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "resetTouchAuthenticationInitialSampleEventMasks:%{public}@",  buf,  0xCu);
  }
}

- (void)applyExtendedHitTestInformationForCAScreenCoordinates:(CGPoint)a3 displayUUID:(id)a4 toPathAttributes:(id)a5 secureName:(unsigned int)a6 excludeContextIDs:(id)a7
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003B668;
  block[3] = &unk_1000B6B40;
  block[4] = a4;
  void block[5] = self;
  *(CGFloat *)&void block[8] = x;
  *(CGFloat *)&block[9] = y;
  unsigned int v16 = a6;
  void block[6] = a5;
  void block[7] = a7;
  dispatch_sync(queue, block);
}

- (void)_queue_windowServerDidDeleteSlotID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = -[NSMutableDictionary count](self->_queue_slotIDToSlotRecord, "count");
  if (v5)
  {
    uint64_t v7 = BKLogTouchEvents(v5, v6);
    unsigned int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10[0] = 67109120;
      v10[1] = v3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "CA didDeleteSlot:%X", (uint8_t *)v10, 8u);
    }

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v3));
    -[NSMutableDictionary removeObjectForKey:](self->_queue_slotIDToSlotRecord, "removeObjectForKey:", v9);
    -[NSMutableOrderedSet removeObject:](self->_queue_touchEnterSlotIDs, "removeObject:", v9);
    -[BKHIDDirectTouchEventProcessor _queue_resetTouchAuthenticationInitialSampleEvent]( self,  "_queue_resetTouchAuthenticationInitialSampleEvent");
  }

- (void)_queue_enumerateDigitizersForDisplay:(id)a3 usingBlock:(id)a4
{
  id v7 = a3;
  id v8 = [v7 length];
  uint64_t v9 = (void *)BKSDisplayUUIDMainKey;
  if (v8) {
    uint64_t v9 = v7;
  }
  id v10 = v9;

  uint64_t v11 = (id *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_queue_perDisplayInfo,  "objectForKeyedSubscript:",  v10));
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  uint64_t v12 = sub_100005584(v11);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  id v14 = [v13 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v18;
    do
    {
      unsigned int v16 = 0LL;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v13);
        }
        (*((void (**)(id, void))a4 + 2))(a4, *(void *)(*((void *)&v17 + 1) + 8LL * (void)v16));
        unsigned int v16 = (char *)v16 + 1;
      }

      while (v14 != v16);
      id v14 = [v13 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v14);
  }
}

- (void)_queue_enumerateDigitizersForAllDisplaysUsingBlock:(id)a3
{
  queue_perDisplayInfo = self->_queue_perDisplayInfo;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10003B550;
  v6[3] = &unk_1000B6B68;
  v6[4] = a3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( queue_perDisplayInfo,  "enumerateKeysAndObjectsUsingBlock:",  v6);
}

- (void)_queue_enumerateTouchStreamsForAllDisplaysUsingBlock:(id)a3
{
  queue_perDisplayInfo = self->_queue_perDisplayInfo;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10003B4E4;
  v6[3] = &unk_1000B6B68;
  v6[4] = a3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( queue_perDisplayInfo,  "enumerateKeysAndObjectsUsingBlock:",  v6);
}

- (BOOL)handlesPersistentPropertiesForSenderDescriptor:(id)a3
{
  unsigned int v4 = [a3 primaryPage];
  unsigned int v5 = [a3 primaryUsage];
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue( +[BKHIDDirectTouchEventProcessor digitizerMatchingDictionaries]( &OBJC_CLASS___BKHIDDirectTouchEventProcessor,  "digitizerMatchingDictionaries"));
  id v6 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v18;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"DeviceUsagePage"]);
        unsigned int v11 = [v10 unsignedIntValue];

        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"DeviceUsage"]);
        LODWORD(v10) = [v12 unsignedIntValue];

        BOOL v13 = v5 == (_DWORD)v10 || v5 == 0;
        if (v4 == v11 && v13)
        {
          BOOL v14 = 1;
          goto LABEL_15;
        }
      }

      id v6 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  BOOL v14 = 0;
LABEL_15:

  return v14;
}

- (id)_persistentPropertyKeyDenylist
{
  if (qword_1000DC030 != -1) {
    dispatch_once(&qword_1000DC030, &stru_1000B6B88);
  }
  return (id)qword_1000DC038;
}

- (int64_t)setPersistentProperties:(id)a3 forServicesMatchingDescriptor:(id)a4
{
  uint64_t v48 = 0LL;
  v49 = &v48;
  uint64_t v50 = 0x2020000000LL;
  char v51 = 0;
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472LL;
  v45[2] = sub_10003B248;
  v45[3] = &unk_1000B6BB0;
  id v31 = (id)objc_claimAutoreleasedReturnValue( -[BKHIDDirectTouchEventProcessor _persistentPropertyKeyDenylist]( self,  "_persistentPropertyKeyDenylist"));
  id v46 = v31;
  v47 = &v48;
  [a3 enumerateKeysAndObjectsUsingBlock:v45];
  if (*((_BYTE *)v49 + 24))
  {
    int64_t v7 = 1LL;
  }

  else
  {
    id v29 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKey:@"HoverDisabled"]);
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSNumber, v8);
    id v10 = v29;
    unsigned int v11 = v10;
    if (v9)
    {
      if ((objc_opt_isKindOfClass(v10, v9) & 1) != 0) {
        uint64_t v12 = v11;
      }
      else {
        uint64_t v12 = 0LL;
      }
    }

    else
    {
      uint64_t v12 = 0LL;
    }

    id v13 = v12;

    uint64_t v39 = 0LL;
    v40 = &v39;
    uint64_t v41 = 0x3032000000LL;
    v42 = sub_10003B28C;
    id v43 = sub_10003B29C;
    id v44 = 0LL;
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10003B2A4;
    block[3] = &unk_1000B7B80;
    v38 = &v39;
    block[4] = self;
    void block[5] = a4;
    id v15 = v13;
    id v37 = v15;
    dispatch_sync(queue, block);
    v30 = v15;
    if ([(id)v40[5] count])
    {
      __int128 v34 = 0u;
      __int128 v35 = 0u;
      __int128 v32 = 0u;
      __int128 v33 = 0u;
      id v17 = (id)v40[5];
      id v18 = [v17 countByEnumeratingWithState:&v32 objects:v56 count:16];
      id v20 = v18;
      if (v18)
      {
        uint64_t v21 = *(void *)v33;
        do
        {
          id v22 = 0LL;
          do
          {
            if (*(void *)v33 != v21) {
              objc_enumerationMutation(v17);
            }
            id v23 = *(void **)(*((void *)&v32 + 1) + 8LL * (void)v22);
            uint64_t v24 = BKLogTouchEvents(v18, v19);
            v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              v26 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionStream descriptionForRootObject:]( &OBJC_CLASS___BSDescriptionStream,  "descriptionForRootObject:",  a3));
              *(_DWORD *)buf = 138543618;
              id v53 = v26;
              __int16 v54 = 2114;
              v55 = v23;
              _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "sending:%{public}@ to:%{public}@",  buf,  0x16u);
            }

            id v18 = [v23 setProperties:a3];
            id v22 = (char *)v22 + 1;
          }

          while (v20 != v22);
          id v18 = [v17 countByEnumeratingWithState:&v32 objects:v56 count:16];
          id v20 = v18;
        }

        while (v18);
      }
    }

    else
    {
      uint64_t v27 = BKLogTouchEvents(0LL, v16);
      id v17 = (id)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v53 = a4;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v17,  OS_LOG_TYPE_DEFAULT,  "no currently matched services for %{public}@",  buf,  0xCu);
      }
    }

    _Block_object_dispose(&v39, 8);
    int64_t v7 = 2LL;
  }

  _Block_object_dispose(&v48, 8);
  return v7;
}

- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5
{
  uint64_t v8 = *a3;
  v28 = v8;
  BOOL v27 = 0;
  uint64_t v9 = (__IOHIDEvent *)objc_claimAutoreleasedReturnValue( -[BKHIDDirectTouchEventProcessor _determineServiceForEvent:sender:fromTouchPad:]( self,  "_determineServiceForEvent:sender:fromTouchPad:",  v8,  a4,  &v27));
  unsigned int v11 = v9;
  if (v9)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[__IOHIDEvent displayUUID](v9, "displayUUID"));
    unsigned int v13 = -[__IOHIDEvent primaryUsagePage](v11, "primaryUsagePage");
    unsigned int v14 = -[__IOHIDEvent primaryUsage](v11, "primaryUsage");
    if (v27)
    {
LABEL_3:
      id v15 = (void *)objc_claimAutoreleasedReturnValue(+[BKTouchPadManager sharedInstance](&OBJC_CLASS___BKTouchPadManager, "sharedInstance"));
      [v15 processEvent:&v28 sender:a4 dispatcher:a5];
LABEL_4:

      goto LABEL_7;
    }

    if (v13 == 13)
    {
      BOOL v18 = v14 == 12 || v14 == 5;
      BOOL v27 = v18;
      if (v14 == 12 || v14 == 5) {
        goto LABEL_3;
      }
    }

    else
    {
      BOOL v27 = 0;
    }

    id v19 = -[__IOHIDEvent isBuiltIn](v11, "isBuiltIn");
    if ((v12 != 0LL) != (_DWORD)v19)
    {
      unsigned int v21 = -[__IOHIDEvent primaryUsagePage](v11, "primaryUsagePage");
      id v19 = -[__IOHIDEvent primaryUsage](v11, "primaryUsage");
      if ((v19 | (v21 << 16)) - 851969 <= 0x1F && ((1 << ((_BYTE)v19 - 1)) & 0x80000009) != 0)
      {
        -[BKHIDDirectTouchEventProcessor _handleDirectTouchEvent:service:]( self,  "_handleDirectTouchEvent:service:",  v8,  v11);
        goto LABEL_7;
      }
    }

    uint64_t v22 = BKLogTouchEvents(v19, v20);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR))
    {
      id v23 = v12;
      id v24 = [v23 length];
      v25 = (void *)BKSDisplayUUIDMainKey;
      if (v24) {
        v25 = v23;
      }
      id v26 = v25;

      *(_DWORD *)buf = 138543874;
      id v30 = v26;
      __int16 v31 = 2114;
      __int128 v32 = v11;
      __int16 v33 = 2114;
      __int128 v34 = v8;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v15,  OS_LOG_TYPE_ERROR,  "ignoring digitizer event for display %{public}@ from unsupported service: (%{public}@):%{public}@",  buf,  0x20u);
    }

    goto LABEL_4;
  }

  uint64_t v16 = BKLogTouchEvents(0LL, v10);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    id v30 = a4;
    __int16 v31 = 2114;
    __int128 v32 = v8;
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v12,  OS_LOG_TYPE_ERROR,  "ignoring digitizer event from non-digitizer sender (%{public}@):%{public}@",  buf,  0x16u);
  }

- (void)matcher:(id)a3 servicesDidMatch:(id)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[BKHIDSystemInterface sharedInstance](&OBJC_CLASS___BKHIDSystemInterface, "sharedInstance"));
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 senderCache]);

  id v44 = v7;
  [v7 addSenderInfo:a4];
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  id v8 = a4;
  id v9 = [v8 countByEnumeratingWithState:&v45 objects:v53 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v46;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v46 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void **)(*((void *)&v45 + 1) + 8LL * (void)i);
        id v13 = [v12 isBuiltIn];
        int v14 = (int)v13;
        uint64_t v16 = BKLogTouchEvents(v13, v15);
        id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          id v18 = [v12 senderID];
          *(_DWORD *)buf = 134218242;
          double v50 = *(double *)&v18;
          __int16 v51 = 2114;
          __int128 v52 = v12;
          _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "digitizer attached (sender %llX) service:%{public}@",  buf,  0x16u);
        }

        if (v14)
        {
          unsigned int v19 = [v12 primaryUsagePage];
          id v20 = [v12 primaryUsage];
          unsigned int v22 = v20 | (v19 << 16);
          switch(v22)
          {
            case 0xD0001u:
              if (!self->_queue_mainDisplayAOPDigitizerService)
              {
                uint64_t v40 = BKLogTouchEvents(v20, v21);
                uint64_t v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
                if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "*** acquired AOP digitizer",  buf,  2u);
                }

                v42 = v12;
                queue_mainDisplayAOPDigitizerService = self->_queue_mainDisplayAOPDigitizerService;
                self->_queue_mainDisplayAOPDigitizerService = v42;
                break;
              }

              uint64_t v27 = BKLogTouchEvents(v20, v21);
              queue_mainDisplayAOPDigitizerService = (BKIOHIDService *)objc_claimAutoreleasedReturnValue(v27);
              if (os_log_type_enabled(queue_mainDisplayAOPDigitizerService, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                v25 = queue_mainDisplayAOPDigitizerService;
                id v26 = "*** already have an AOP digitizer";
LABEL_21:
                uint32_t v29 = 2;
                goto LABEL_24;
              }

              break;
            case 0xD0004u:
              if (!self->_queue_mainDisplayDigitizerService)
              {
                uint64_t v31 = BKLogTouchEvents(v20, v21);
                __int128 v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
                BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
                if (v33)
                {
                  double v34 = BSContinuousMachTimeNow(v33) - self->_queue_startMainDisplayDigitizerMatchingTime;
                  *(_DWORD *)buf = 134217984;
                  double v50 = v34;
                  _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "*** acquired main display digitizer (after %gs)",  buf,  0xCu);
                }

                -[BSContinuousMachTimer invalidate](self->_queue_mainDisplayDigitizerSentinelTimer, "invalidate");
                queue_mainDisplayDigitizerSentinelTimer = self->_queue_mainDisplayDigitizerSentinelTimer;
                self->_queue_mainDisplayDigitizerSentinelTimer = 0LL;

                id v36 = v12;
                queue_mainDisplayAOPDigitizerService = self->_queue_mainDisplayDigitizerService;
                self->_queue_mainDisplayDigitizerService = v36;
                break;
              }

              uint64_t v28 = BKLogTouchEvents(v20, v21);
              queue_mainDisplayAOPDigitizerService = (BKIOHIDService *)objc_claimAutoreleasedReturnValue(v28);
              if (os_log_type_enabled(queue_mainDisplayAOPDigitizerService, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                v25 = queue_mainDisplayAOPDigitizerService;
                id v26 = "*** already have a main display digitizer";
                goto LABEL_21;
              }

              break;
            case 0xD0020u:
              if (self->_queue_mainDisplayPencilDigitizerService)
              {
                uint64_t v23 = BKLogTouchEvents(v20, v21);
                queue_mainDisplayAOPDigitizerService = (BKIOHIDService *)objc_claimAutoreleasedReturnValue(v23);
                if (os_log_type_enabled(queue_mainDisplayAOPDigitizerService, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)buf = 0;
                  v25 = queue_mainDisplayAOPDigitizerService;
                  id v26 = "*** already have a pencil digitizer";
                  goto LABEL_21;
                }
              }

              else
              {
                uint64_t v37 = BKLogTouchEvents(v20, v21);
                v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
                if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "*** acquired pencil digitizer",  buf,  2u);
                }

                uint64_t v39 = v12;
                queue_mainDisplayAOPDigitizerService = self->_queue_mainDisplayPencilDigitizerService;
                self->_queue_mainDisplayPencilDigitizerService = v39;
              }

              break;
            default:
              uint64_t v30 = BKLogTouchEvents(v20, v21);
              queue_mainDisplayAOPDigitizerService = (BKIOHIDService *)objc_claimAutoreleasedReturnValue(v30);
              if (!os_log_type_enabled(queue_mainDisplayAOPDigitizerService, OS_LOG_TYPE_ERROR)) {
                break;
              }
              *(_DWORD *)buf = 67109120;
              LODWORD(v50) = v22;
              v25 = queue_mainDisplayAOPDigitizerService;
              id v26 = "*** unexpected digitizer usage pair 0x%X";
              uint32_t v29 = 8;
LABEL_24:
              _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, v26, buf, v29);
              break;
          }
        }

        id v43 =  -[BKHIDDirectTouchEventProcessor _queue_addDigitizerStateForService:]( self,  "_queue_addDigitizerStateForService:",  v12);
      }

      id v9 = [v8 countByEnumeratingWithState:&v45 objects:v53 count:16];
    }

    while (v9);
  }
}

- (void)serviceDidDisappear:(id)a3
{
  uint64_t v7 = BKLogTouchEvents(v5, v6);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v27 = 134218240;
    id v28 = [a3 senderID];
    __int16 v29 = 1024;
    unsigned int v30 = [a3 isBuiltIn];
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "digitizer detached (sender %llX) builtIn:%d",  (uint8_t *)&v27,  0x12u);
  }

  if (self->_queue_mainDisplayDigitizerService == a3)
  {
    uint64_t v11 = BKLogTouchEvents(v9, v10);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v27) = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "*** lost main display digitizer ***",  (uint8_t *)&v27,  2u);
    }

    queue_mainDisplayDigitizerService = self->_queue_mainDisplayDigitizerService;
    self->_queue_mainDisplayDigitizerService = 0LL;
  }

  if (self->_queue_mainDisplayPencilDigitizerService == a3)
  {
    uint64_t v14 = BKLogTouchEvents(v9, v10);
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v27) = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "*** lost pencil digitizer ***",  (uint8_t *)&v27,  2u);
    }

    queue_mainDisplayPencilDigitizerService = self->_queue_mainDisplayPencilDigitizerService;
    self->_queue_mainDisplayPencilDigitizerService = 0LL;
  }

  id v17 = (id)objc_claimAutoreleasedReturnValue([a3 displayUUID]);
  id v18 = [v17 length];
  unsigned int v19 = (void *)BKSDisplayUUIDMainKey;
  if (v18) {
    unsigned int v19 = v17;
  }
  id v20 = v19;

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( -[BKHIDDirectTouchEventProcessor _queue_digitizerStateForService:]( self,  "_queue_digitizerStateForService:",  a3));
  uint64_t v23 = BKLogTouchEvents(v21, v22);
  id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    int v27 = 138543362;
    id v28 = v21;
    _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "cancel -- digitizer did disappear:%{public}@",  (uint8_t *)&v27,  0xCu);
  }

  [v21 invalidate];
  uint64_t v25 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_queue_perDisplayInfo, "objectForKey:", v20));
  id v26 = (void *)v25;
  if (v25) {
    [*(id *)(v25 + 48) removeObjectForKey:a3];
  }
}

- (void)globalKeyboardModifiersDidChange:(int64_t)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10003AE84;
  v4[3] = &unk_1000B7ED8;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(queue, v4);
}

- (id)_queue_displayInfoForDisplay:(id)a3 createIfNeeded:(BOOL)a4
{
  if (!a3) {
    __assert_rtn( "-[BKHIDDirectTouchEventProcessor _queue_displayInfoForDisplay:createIfNeeded:]",  "BKHIDDirectTouchEventProcessor.mm",  1054,  "displayUUID");
  }
  BOOL v4 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  queue_perDisplayInfo = self->_queue_perDisplayInfo;
  if (!queue_perDisplayInfo)
  {
    id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v9 = self->_queue_perDisplayInfo;
    self->_queue_perDisplayInfo = v8;

    queue_perDisplayInfo = self->_queue_perDisplayInfo;
  }

  uint64_t v10 = (BKDirectTouchPerDisplayInfo *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( queue_perDisplayInfo,  "objectForKeyedSubscript:",  a3));
  if (v10) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = !v4;
  }
  if (!v11)
  {
    uint64_t v10 = objc_alloc_init(&OBJC_CLASS___BKDirectTouchPerDisplayInfo);
    else {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[BKSHIDEventDisplay displayWithHardwareIdentifier:]( &OBJC_CLASS___BKSHIDEventDisplay,  "displayWithHardwareIdentifier:",  a3));
    }
    id v13 = v12;
    if (v10) {
      objc_storeStrong((id *)&v10->_display, v12);
    }
    defaultDisplayController = self->_defaultDisplayController;
    if (defaultDisplayController) {
      uint64_t v15 = defaultDisplayController;
    }
    else {
      uint64_t v15 = (BKDisplayController *)objc_claimAutoreleasedReturnValue( +[BKDisplayController sharedInstance]( &OBJC_CLASS___BKDisplayController,  "sharedInstance"));
    }
    uint64_t v16 = v15;
    if (v10) {
      objc_storeStrong((id *)&v10->_displayController, v15);
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_queue_perDisplayInfo,  "setObject:forKeyedSubscript:",  v10,  a3);
  }

  return v10;
}

- (id)_queue_addDigitizerStateForService:(id)a3
{
  v72 = (void *)objc_claimAutoreleasedReturnValue( -[BKHIDDirectTouchEventProcessor _queue_applyCachedPropertiesToMultitouchService:]( self,  "_queue_applyCachedPropertiesToMultitouchService:",  a3));
  id v5 = (id)objc_claimAutoreleasedReturnValue([a3 displayUUID]);
  id v6 = [v5 length];
  uint64_t v7 = (void *)BKSDisplayUUIDMainKey;
  if (v6) {
    uint64_t v7 = v5;
  }
  id v8 = v7;

  v71 = v8;
  uint64_t v9 = objc_alloc(&OBJC_CLASS___BKTouchDeliveryStatisticsLoggingObserver);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%llX-%@",  [a3 senderID],  v8));
  v73 = -[BKTouchDeliveryStatisticsLoggingObserver initWithLabel:](v9, "initWithLabel:", v10);

  uint64_t v11 = objc_claimAutoreleasedReturnValue( -[BKHIDDirectTouchEventProcessor _queue_displayInfoForDisplay:createIfNeeded:]( self,  "_queue_displayInfoForDisplay:createIfNeeded:",  v8,  1LL));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[BKTouchDeliveryObservationManager sharedInstance]( &OBJC_CLASS___BKTouchDeliveryObservationManager,  "sharedInstance"));
  id v13 = objc_alloc(&OBJC_CLASS___BKDirectTouchState);
  if (v13
    && (dispatcher = self->_dispatcher,
        v74.receiver = v13,
        v74.super_class = (Class)&OBJC_CLASS___BKDirectTouchState,
        uint64_t v15 = -[BKHIDDirectTouchEventProcessor init](&v74, "init"),
        (id v17 = v15) != 0LL))
  {
    uint64_t v18 = objc_opt_class(v15, v16);
    if (v18 != objc_opt_class(&OBJC_CLASS___BKDirectTouchState, v19))
    {
      v64 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Subclasses not allowed"));
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        v65 = NSStringFromSelector( "initWithHIDService:eventProcessor:displayInfo:dispatcher:touchDeliveryObserver:statisticsObserver:delive ryPolicyServer:eventSystemInteface:");
        id v66 = (id)objc_claimAutoreleasedReturnValue(v65);
        v68 = (objc_class *)objc_opt_class(v17, v67);
        v69 = NSStringFromClass(v68);
        v70 = (void *)objc_claimAutoreleasedReturnValue(v69);
        *(_DWORD *)v75 = 138544642;
        *(void *)&v75[4] = v66;
        *(_WORD *)&v75[12] = 2114;
        *(void *)&v75[14] = v70;
        __int16 v76 = 2048;
        v77 = v17;
        __int16 v78 = 2114;
        v79 = @"BKDirectTouchState.mm";
        __int16 v80 = 1024;
        int v81 = 199;
        __int16 v82 = 2114;
        v83 = v64;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v75,  0x3Au);
      }

      _bs_set_crash_log_message([v64 UTF8String]);
      __break(0);
      JUMPOUT(0x100039864LL);
    }

    objc_storeStrong((id *)&v17->_queue, a3);
    objc_storeStrong((id *)&v17->_touchEventServer, self);
    objc_storeStrong((id *)&v17->_matchers, (id)v11);
    objc_storeStrong((id *)&v17->_pencilOpaqueTouchPersistentPropertySupport, dispatcher);
    objc_storeStrong((id *)&v17->_queue_mainDisplayAOPDigitizerService, v12);
    objc_storeStrong((id *)&v17->_queue_mainDisplayDigitizerService, 0LL);
    objc_storeStrong((id *)&v17->_queue_mainDisplayDigitizerSentinelTimer, 0LL);
    id v20 = objc_alloc_init(&OBJC_CLASS___BKTouchContactSet);
    globalKeyboardObserver = v17->_globalKeyboardObserver;
    v17->_globalKeyboardObserver = (BSInvalidatable *)v20;

    uint64_t v22 = objc_alloc_init(&OBJC_CLASS___BSMutableIntegerMap);
    queue_perDisplayInfo = v17->_queue_perDisplayInfo;
    v17->_queue_perDisplayInfo = v22;

    id v24 = objc_alloc_init(&OBJC_CLASS___BSMutableIntegerMap);
    queue_referenceToTouchStreamClient = v17->_queue_referenceToTouchStreamClient;
    v17->_queue_referenceToTouchStreamClient = v24;

    id v26 = objc_alloc_init(&OBJC_CLASS___BSMutableIntegerMap);
    int v27 = *(void **)&v17->_queue_previousVendedTouchStreamReference;
    *(void *)&v17->_queue_previousVendedTouchStreamReference = v26;

    id v28 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    queue_slotIDToSlotRecord = v17->_queue_slotIDToSlotRecord;
    v17->_queue_slotIDToSlotRecord = (NSMutableDictionary *)v28;

    unsigned int v30 = objc_alloc(&OBJC_CLASS___BKDirectTouchStateHitTester);
    uint64_t v31 = v17;
    __int128 v32 = self;
    id v33 = (id)v11;
    if (v30)
    {
      *(void *)v75 = v30;
      *(void *)&v75[8] = &OBJC_CLASS___BKDirectTouchStateHitTester;
      double v34 = (BKDirectTouchStateHitTester *)objc_msgSendSuper2((objc_super *)v75, "init");
      unsigned int v30 = v34;
      if (v34)
      {
        objc_storeStrong((id *)&v34->_state, v17);
        objc_storeStrong((id *)&v30->_eventProcessor, self);
        objc_storeStrong((id *)&v30->_displayInfo, (id)v11);
        objc_storeStrong((id *)&v30->_touchDeliveryPolicyServer, 0LL);
      }
    }

    id v35 = v31[3];
    v31[3] = v30;

    id v36 = objc_alloc(&OBJC_CLASS___BKDirectTouchUpdateEvents);
    if (v36)
    {
      *(void *)v75 = v36;
      *(void *)&v75[8] = &OBJC_CLASS___BKDirectTouchUpdateEvents;
      uint64_t v37 = (id *)objc_msgSendSuper2((objc_super *)v75, "init");
      v38 = v37;
      if (v37) {
        objc_storeStrong(v37 + 3, v17);
      }
    }

    else
    {
      v38 = 0LL;
    }

    id v39 = v31[23];
    v31[23] = v38;

    uint64_t v40 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    id v41 = v31[9];
    v31[9] = v40;

    if (v73) {
      [v31[9] addObject:v73];
    }
    if (v12) {
      [v31[9] addObject:v12];
    }
    *((_BYTE *)v31 + 205) = [a3 primaryUsage] == 32;
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[OS_dispatch_queue propertyForKey:](v17->_queue, "propertyForKey:", @"MaxHoverHeight"));
    id v43 = v42;
    if (v42)
    {
      [v42 doubleValue];
      v31[24] = v44;
    }

    __int128 v45 = (void *)objc_claimAutoreleasedReturnValue(+[BKSDefaults localDefaults](&OBJC_CLASS___BKSDefaults, "localDefaults"));
    sub_1000563FC( (uint64_t)v31,  (uint64_t)[v45 digitizerVisualizeTouches],  (uint64_t)objc_msgSend(v45, "digitizerVisualizeHitTestRegions"));
    uint64_t v48 = BKLogTouchEvents(v46, v47);
    v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v75 = 138543362;
      *(void *)&v75[4] = v31;
      _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "init: %{public}@", v75, 0xCu);
    }
  }

  else
  {
    uint64_t v31 = 0LL;
  }

  double v50 = v31;
  id v51 = a3;
  if (v11)
  {
    __int128 v52 = *(void **)(v11 + 48);
    if (!v52)
    {
      id v53 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      __int16 v54 = *(void **)(v11 + 48);
      *(void *)(v11 + 48) = v53;

      __int128 v52 = *(void **)(v11 + 48);
    }

    [v52 setObject:v50 forKeyedSubscript:v51];
  }

  int64_t queue_interfaceOrientation = self->_queue_interfaceOrientation;
  __int128 v56 = (void *)objc_claimAutoreleasedReturnValue([v72 objectForKey:@"HoverDisabled"]);
  unsigned int v57 = [v56 BOOLValue];

  if (v57)
  {
    if (!v50) {
      goto LABEL_34;
    }
    *((_BYTE *)v50 + 209) = 1;
  }

  else if (!v50)
  {
    goto LABEL_34;
  }

  v50[13] = (id)self->_queue_activeModifiers;
LABEL_34:
  if (v11)
  {
    id v58 = *(id *)(v11 + 32);
    if (v58) {
      sub_10005C7B4((uint64_t)v50, v58);
    }
  }

  else
  {
    id v58 = 0LL;
  }

  __int128 v59 = (void *)objc_claimAutoreleasedReturnValue(+[BKSDefaults localDefaults](&OBJC_CLASS___BKSDefaults, "localDefaults"));
  id v60 = [v59 digitizerVisualizeTouches];

  v61 = (void *)objc_claimAutoreleasedReturnValue(+[BKSDefaults localDefaults](&OBJC_CLASS___BKSDefaults, "localDefaults"));
  id v62 = [v61 digitizerVisualizeHitTestRegions];

  sub_1000563FC((uint64_t)v50, (uint64_t)v60, (uint64_t)v62);
  [v51 addDisappearanceObserver:self queue:self->_queue];

  return v50;
}

- (id)_queue_digitizerStateForService:(id)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue([a3 displayUUID]);
  id v6 = [v5 length];
  uint64_t v7 = (void *)BKSDisplayUUIDMainKey;
  if (v6) {
    uint64_t v7 = v5;
  }
  id v8 = v7;

  uint64_t v9 = objc_claimAutoreleasedReturnValue( -[BKHIDDirectTouchEventProcessor _queue_displayInfoForDisplay:createIfNeeded:]( self,  "_queue_displayInfoForDisplay:createIfNeeded:",  v8,  1LL));
  uint64_t v10 = (void *)v9;
  if (v9) {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v9 + 48) objectForKeyedSubscript:a3]);
  }
  else {
    uint64_t v11 = 0LL;
  }

  return v11;
}

- (id)_queue_touchStreamInfoForDisplayUUID:(id)a3 createIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v7 = a3;
  id v8 = [v7 length];
  uint64_t v9 = (void *)BKSDisplayUUIDMainKey;
  if (v8) {
    uint64_t v9 = v7;
  }
  id v10 = v9;

  uint64_t v11 = objc_claimAutoreleasedReturnValue( -[BKHIDDirectTouchEventProcessor _queue_displayInfoForDisplay:createIfNeeded:]( self,  "_queue_displayInfoForDisplay:createIfNeeded:",  v10,  1LL));
  uint64_t v12 = (id *)v11;
  if (v11) {
    id v13 = *(void **)(v11 + 24);
  }
  else {
    id v13 = 0LL;
  }
  uint64_t v14 = v13;
  uint64_t v15 = v14;
  if (v4 && !v14)
  {
    uint64_t v16 = objc_alloc_init(&OBJC_CLASS___BKDigitizerTouchStreamAggregate);
    uint64_t v15 = v16;
    if (v16) {
      objc_setProperty_nonatomic_copy(v16, v17, v10, 8LL);
    }
    if (v12) {
      objc_storeStrong(v12 + 3, v15);
    }
  }

  return v15;
}

- (unsigned)_queue_addTouchStreamClient:(id)a3 toDisplayUUID:(id)a4 versionedPID:(int64_t)a5
{
  unsigned int v8 = self->_queue_previousVendedTouchStreamReference + 1;
  self->_unsigned int queue_previousVendedTouchStreamReference = v8;
  if (a3) {
    *((_DWORD *)a3 + 4) = v8;
  }
  uint64_t v9 = objc_claimAutoreleasedReturnValue( -[BKHIDDirectTouchEventProcessor _queue_touchStreamInfoForDisplayUUID:createIfNeeded:]( self,  "_queue_touchStreamInfoForDisplayUUID:createIfNeeded:",  a4,  1LL));
  id v10 = (id *)v9;
  if (v9)
  {
    if (!*(void *)(v9 + 16))
    {
      uint64_t v11 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      id v12 = v10[2];
      _DWORD v10[2] = v11;
    }

    if (a3) {
      objc_storeWeak((id *)a3 + 4, v10);
    }
    [v10[2] addObject:a3];
  }

  queue_referenceToTouchStreamClient = self->_queue_referenceToTouchStreamClient;
  if (!queue_referenceToTouchStreamClient)
  {
    uint64_t v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v15 = self->_queue_referenceToTouchStreamClient;
    self->_queue_referenceToTouchStreamClient = v14;

    queue_referenceToTouchStreamClient = self->_queue_referenceToTouchStreamClient;
  }

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  self->_queue_previousVendedTouchStreamReference));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( queue_referenceToTouchStreamClient,  "setObject:forKeyedSubscript:",  a3,  v16);

  uint64_t v19 = BKLogTouchEvents(v17, v18);
  id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v37 = a3;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "create touch stream %{public}@", buf, 0xCu);
  }

  objc_initWeak(&location, a3);
  queue = self->_queue;
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_10003ADB4;
  v33[3] = &unk_1000B7B58;
  objc_copyWeak(&v34, &location);
  if (a3)
  {
    if (*((void *)a3 + 7))
    {
      id v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_processDeathWatcher == nil"));
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        int v27 = NSStringFromSelector("watchForProcessDeathOnQueue:block:");
        id v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
        unsigned int v30 = (objc_class *)objc_opt_class(a3, v29);
        uint64_t v31 = NSStringFromClass(v30);
        __int128 v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
        *(_DWORD *)buf = 138544642;
        id v37 = v28;
        __int16 v38 = 2114;
        id v39 = v32;
        __int16 v40 = 2048;
        id v41 = a3;
        __int16 v42 = 2114;
        id v43 = @"BKDigitizerTouchStreamClient.m";
        __int16 v44 = 1024;
        int v45 = 96;
        __int16 v46 = 2114;
        uint64_t v47 = v26;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
      }

      _bs_set_crash_log_message([v26 UTF8String]);
      __break(0);
      JUMPOUT(0x100039EA0LL);
    }

    uint64_t v22 = -[BSProcessDeathWatcher initWithPID:queue:deathHandler:]( objc_alloc(&OBJC_CLASS___BSProcessDeathWatcher),  "initWithPID:queue:deathHandler:",  *((unsigned int *)a3 + 10),  queue,  v33);
    uint64_t v23 = (void *)*((void *)a3 + 7);
    *((void *)a3 + 7) = v22;
  }

  unsigned int queue_previousVendedTouchStreamReference = self->_queue_previousVendedTouchStreamReference;
  objc_destroyWeak(&v34);
  objc_destroyWeak(&location);

  return queue_previousVendedTouchStreamReference;
}

- (id)_queue_touchStreamClientForReference:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  queue_referenceToTouchStreamClient = self->_queue_referenceToTouchStreamClient;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v3));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( queue_referenceToTouchStreamClient,  "objectForKeyedSubscript:",  v6));

  return v7;
}

- (id)_queue_applyCachedPropertiesToMultitouchService:(id)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a3 displayUUID]);
  if ([a3 primaryUsagePage] == 13 && objc_msgSend(a3, "primaryUsage") == 4)
  {
    uint64_t v22 = 0x3FF0000000000000LL;
    sub_100019B10(v5, 0LL, 0LL, (double *)&v22, 0LL, 0LL);
    double v6 = *(double *)&v22;
    uint64_t v9 = BKLogTouchEvents(v7, v8);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [a3 senderID];
      *(_DWORD *)buf = 134218240;
      id v24 = v11;
      __int16 v25 = 1024;
      LODWORD(v26) = (int)(v6 * 160.0);
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "service %llX setProperty:%d forKey:QuantizationDPI",  buf,  0x12u);
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  (int)(v6 * 160.0)));
    [a3 setProperty:v12 forKey:@"QuantizationDPI"];
  }

  persistentPropertyController = self->_persistentPropertyController;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([a3 senderDescriptor]);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( -[BKIOHIDServicePersistentPropertyController allPersistentPropertiesForServicesMatchingDescriptor:]( persistentPropertyController,  "allPersistentPropertiesForServicesMatchingDescriptor:",  v14));

  id v16 = [v15 count];
  if (v16)
  {
    uint64_t v18 = BKLogTouchEvents(v16, v17);
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      id v20 = [a3 senderID];
      *(_DWORD *)buf = 134218242;
      id v24 = v20;
      __int16 v25 = 2114;
      id v26 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "service %llX restore persistent props %{public}@",  buf,  0x16u);
    }

    [a3 setProperties:v15];
  }

  return v15;
}

- (BOOL)_queue_hasTouchEnterSlots
{
  return -[NSMutableOrderedSet count](self->_queue_touchEnterSlotIDs, "count") != 0LL;
}

- (id)_queue_slotRecordForSlotID:(unsigned int)a3
{
  if (a3)
  {
    uint64_t v3 = *(void *)&a3;
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    queue_slotIDToSlotRecord = self->_queue_slotIDToSlotRecord;
    double v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v3));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( queue_slotIDToSlotRecord,  "objectForKeyedSubscript:",  v6));
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  return v7;
}

- (id)_queue_contextIDsToIgnoreForZoomSenders
{
  return self->_queue_zoomExcludedContextIDs;
}

- (void)_handleDirectTouchEvent:(__IOHIDEvent *)a3 service:(id)a4
{
  if (!a4)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"must have a service here"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      id v10 = NSStringFromSelector(a2);
      id v11 = (id)objc_claimAutoreleasedReturnValue(v10);
      id v13 = (objc_class *)objc_opt_class(self, v12);
      uint64_t v14 = NSStringFromClass(v13);
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      *(_DWORD *)buf = 138544642;
      id v20 = v11;
      __int16 v21 = 2114;
      uint64_t v22 = v15;
      __int16 v23 = 2048;
      id v24 = self;
      __int16 v25 = 2114;
      id v26 = @"BKHIDDirectTouchEventProcessor.mm";
      __int16 v27 = 1024;
      int v28 = 1236;
      __int16 v29 = 2114;
      unsigned int v30 = v9;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
    }

    _bs_set_crash_log_message([v9 UTF8String]);
    __break(0);
    JUMPOUT(0x10003A454LL);
  }

  if (byte_1000DC028)
  {
    if (a3) {
      uint64_t TimeStamp = IOHIDEventGetTimeStamp(a3);
    }
    else {
      uint64_t TimeStamp = 0LL;
    }
    kdebug_trace(730464260LL, TimeStamp, 0LL, 0LL, 0LL);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003ACB8;
  block[3] = &unk_1000B6F40;
  block[4] = self;
  void block[5] = a4;
  void block[6] = a3;
  dispatch_sync(queue, block);
  if (byte_1000DC028)
  {
    if (a3) {
      uint64_t v17 = IOHIDEventGetTimeStamp(a3);
    }
    else {
      uint64_t v17 = 0LL;
    }
    kdebug_trace(730464264LL, v17, 0LL, 0LL, 0LL);
  }

- (id)_determineServiceForEvent:(__IOHIDEvent *)a3 sender:(id)a4 fromTouchPad:(BOOL *)a5
{
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___BKHIDAccessibilitySender, a2);
  if ((objc_opt_isKindOfClass(a4, v9) & 1) == 0 || (id v11 = a4) == 0LL)
  {
    uint64_t v18 = objc_opt_class(&OBJC_CLASS___BKIOHIDService, v10);
    id v19 = a4;
    id v20 = v19;
    if (v18)
    {
      if ((objc_opt_isKindOfClass(v19, v18) & 1) != 0) {
        __int16 v21 = v20;
      }
      else {
        __int16 v21 = 0LL;
      }
    }

    else
    {
      __int16 v21 = 0LL;
    }

    id v22 = v21;

    uint64_t v12 = 0LL;
    BOOL v23 = 0;
    goto LABEL_27;
  }

  uint64_t v12 = v11;
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 displayUUID]);

  if (v13)
  {
    uint64_t v16 = BKLogTouchEvents(v14, v15);
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v12 displayUUID]);
      int v32 = 138543362;
      id v33 = v31;
      _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "Not supported: accessibility digitizer for external display (%{public}@)",  (uint8_t *)&v32,  0xCu);
    }

- (void)_queue_addServicesMatchingSenderDescriptor:(id)a3 inPerDisplayInfo:(id)a4 toArray:(id)a5
{
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  uint64_t v7 = sub_100005584((id *)a4);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v16;
    do
    {
      id v11 = 0LL;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)v11);
        if (v12) {
          uint64_t v12 = (void *)v12[1];
        }
        id v13 = v12;
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "senderDescriptor", (void)v15));

        id v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v9);
  }
}

- (id)_queue_servicesMatchingSenderDescriptor:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  double v6 = (void *)objc_claimAutoreleasedReturnValue([a3 associatedDisplay]);
  uint64_t v7 = v6;
  if (v6)
  {
    id v8 = [v6 _isNullDisplay];
    if ((_DWORD)v8)
    {
      uint64_t v10 = BKLogTouchEvents(v8, v9);
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v25 = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "touch services cannot match nullDisplay",  v25,  2u);
      }
    }

    else
    {
      __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v7 _hardwareIdentifier]);
      queue_perDisplayInfo = self->_queue_perDisplayInfo;
      id v19 = v17;
      id v20 = [v19 length];
      __int16 v21 = (void *)BKSDisplayUUIDMainKey;
      if (v20) {
        __int16 v21 = v19;
      }
      id v22 = v21;

      BOOL v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](queue_perDisplayInfo, "objectForKey:", v22));
      -[BKHIDDirectTouchEventProcessor _queue_addServicesMatchingSenderDescriptor:inPerDisplayInfo:toArray:]( self,  "_queue_addServicesMatchingSenderDescriptor:inPerDisplayInfo:toArray:",  a3,  v23,  v5);
    }
  }

  else
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_queue_perDisplayInfo, "allValues"));
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    id v13 = v12;
    id v14 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v27;
      do
      {
        for (i = 0LL; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v27 != v15) {
            objc_enumerationMutation(v13);
          }
          -[BKHIDDirectTouchEventProcessor _queue_addServicesMatchingSenderDescriptor:inPerDisplayInfo:toArray:]( self,  "_queue_addServicesMatchingSenderDescriptor:inPerDisplayInfo:toArray:",  a3,  *(void *)(*((void *)&v26 + 1) + 8LL * (void)i),  v5);
        }

        id v14 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }

      while (v14);
    }
  }

  return v5;
}

- (void).cxx_destruct
{
}

+ (NSArray)digitizerMatchingDictionaries
{
  v11[0] = @"DeviceUsagePage";
  v11[1] = @"DeviceUsage";
  v12[0] = &off_1000C04B0;
  v12[1] = &off_1000C04C8;
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v12,  v11,  2LL));
  v13[0] = v2;
  v9[0] = @"DeviceUsagePage";
  v9[1] = @"DeviceUsage";
  v10[0] = &off_1000C04B0;
  v10[1] = &off_1000C04E0;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  2LL));
  v13[1] = v3;
  v7[0] = @"DeviceUsagePage";
  v7[1] = @"DeviceUsage";
  v8[0] = &off_1000C04B0;
  v8[1] = &off_1000C04F8;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v8,  v7,  2LL));
  v13[2] = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v13, 3LL));

  return (NSArray *)v5;
}

@end