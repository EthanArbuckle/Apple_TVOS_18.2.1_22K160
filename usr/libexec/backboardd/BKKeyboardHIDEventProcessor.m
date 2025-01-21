@interface BKKeyboardHIDEventProcessor
- (BKKeyboardHIDEventProcessor)initWithContext:(id)a3;
- (BKKeyboardHIDEventProcessor)initWithContext:(id)a3 server:(id)a4;
- (BOOL)_lock_anyKeyboardHasCapsLockActive;
- (BOOL)capsLockKeyHasLanguageSwitchLabel;
- (BOOL)isCapsLockLightOn;
- (BOOL)isCapsLockLightOnForSenderID:(unint64_t)a3;
- (BOOL)keyboardWantsStandardTypeOverrideForSenderID:(unint64_t)a3;
- (NSArray)allUsableDeviceProperties;
- (NSSet)keyCommandsToAuthenticate;
- (NSString)debugDescription;
- (NSString)keyboardLayout;
- (id)addGlobalKeyboardObserver:(id)a3;
- (id)devicePropertiesForSenderID:(unint64_t)a3;
- (id)keyboardLanguageForSenderID:(unint64_t)a3;
- (id)setObservingUsableKeyboardConnections:(id)a3;
- (int)_eventSourceForKeyboardInfo:(id)a3 sender:(id)a4;
- (int)eventSourceForSender:(id)a3;
- (int64_t)_lock_activeModifiers;
- (int64_t)activeModifiers;
- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5;
- (int64_t)processEvent:(__IOHIDEvent *)a3 withContext:(id)a4 buffer:(id)a5 sequence:(id)a6 sender:(id)a7 dispatcher:(id)a8 resolution:(id)a9;
- (void)_commonInitWithContext:(id)a3 server:(id)a4;
- (void)_lock_addModifierKeyDown:(id)a3;
- (void)_lock_applyDeliveryInformation:(id)a3 resolution:(id)a4 toEvent:(__IOHIDEvent *)a5;
- (void)_lock_cancelKeyDownEvents:(id)a3;
- (void)_lock_dispatchKeyEvent:(__IOHIDEvent *)a3 keyCommand:(id)a4 keyboardInfo:(id)a5 eventSource:(int)a6 fromSender:(id)a7 dispatcher:(id)a8;
- (void)_lock_handleKeyEvent:(__IOHIDEvent *)a3 fromSender:(id)a4 dispatcher:(id)a5 bypassCapsLockChecks:(BOOL)a6;
- (void)_lock_handleUnicodeEvent:(__IOHIDEvent *)a3 fromSender:(id)a4 dispatcher:(id)a5;
- (void)_lock_keyboardRemoved:(id)a3;
- (void)_lock_keyboardsDetected:(id)a3;
- (void)_lock_postSyntheticCapsLockPressForKeyboard:(id)a3;
- (void)_lock_publishUsableKeyboards:(id)a3 toServiceConnection:(id)a4;
- (void)_lock_publishUsableKeyboardsToServiceConnections;
- (void)_lock_removeCapsLockEntryIfNeeded:(id)a3;
- (void)_lock_removeModifierKeyDown:(id)a3;
- (void)_lock_removeSenderIDFromTracking:(unint64_t)a3;
- (void)_lock_restoreCapsLockStateToKeyboard:(id)a3;
- (void)_lock_setCapsLockActive:(BOOL)a3 onSenderID:(unint64_t)a4;
- (void)_lock_setCapsLockState:(BOOL)a3 forKeyboard:(id)a4;
- (void)_lock_setKeyboardLightsSuspended:(BOOL)a3;
- (void)_lock_setPrimaryKeyboard:(id)a3;
- (void)_lock_smartKeyboardAttachmentStateDidChange:(id)a3;
- (void)_lock_stopWatchingForGestures:(id)a3;
- (void)_lock_updateGlobalModifierState;
- (void)_lock_usableKeyboardAttached:(id)a3;
- (void)_lock_usableKeyboardDetached:(id)a3;
- (void)_lock_watchForGestures:(id)a3;
- (void)_modifierRemappingsDidChange;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)bufferDidEndDraining:(id)a3;
- (void)bufferingDidAddNewBuffers:(id)a3;
- (void)dealloc;
- (void)display:(id)a3 didBecomeBlank:(BOOL)a4;
- (void)matcher:(id)a3 servicesDidMatch:(id)a4;
- (void)postEvent:(__IOHIDEvent *)a3 withContext:(id)a4 toResolution:(id)a5 fromSequence:(id)a6;
- (void)serviceDidDisappear:(id)a3;
- (void)setCapsLockActive:(BOOL)a3 onSenderID:(unint64_t)a4;
- (void)setCapsLockDelayOverride:(double)a3;
- (void)setCapsLockDelayOverride:(double)a3 forSenderID:(unint64_t)a4;
- (void)setCapsLockLightOn:(BOOL)a3;
- (void)setKeyCommandsToAuthenticate:(id)a3;
- (void)setKeyboardLayout:(id)a3;
- (void)setKeyboardLayout:(id)a3 forSenderID:(unint64_t)a4;
- (void)setRomanCapsLockSwitchModeActive:(BOOL)a3;
- (void)setRomanCapsLockSwitchModeActive:(BOOL)a3 forSenderID:(unint64_t)a4;
- (void)setStandardType:(unsigned int)a3 forSenderID:(unint64_t)a4;
- (void)smartKeyboardAttachmentStateDidChange:(id)a3;
@end

@implementation BKKeyboardHIDEventProcessor

- (BKKeyboardHIDEventProcessor)initWithContext:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = [BKKeyboardHIDEventProcessor class];
  BKKeyboardHIDEventProcessor *v5 = [[BKKeyboardHIDEventProcessor alloc] init];
  if (v5)
  {
    BKHIDDomainServiceServer *v6 = [[BKHIDDomainServiceServer alloc] init];
    uint64_t v7 = BKSKeyboardBSServiceName;
    uint64_t v8 = BKLogKeyboard();
    v9 = v8;
    BKKeyboardServiceServer *v10 = [[BKKeyboardServiceServer alloc] initWithDelegate:v6 serverTarget:v5 serverProtocol:&OBJC_PROTOCOL___BKSKeyboardServiceServerToClientIPC clientProtocol:&OBJC_PROTOCOL___BKSKeyboardServiceClientToServerIPC serviceName:v7 queue:v9 log:0LL entitlement:0LL];

    [v5 _commonInitWithContext:v4 server:v10];
  }

  return v5;
}

- (BKKeyboardHIDEventProcessor)initWithContext:(id)a3 server:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = [BKKeyboardHIDEventProcessor class];
  BKKeyboardHIDEventProcessor *v8 = [[BKKeyboardHIDEventProcessor alloc] init];
  v9 = v8;
  if (v8) {
    [v8 _commonInitWithContext:v6 server:v7];
  }

  return v9;
}

- (void)_commonInitWithContext:(id)a3 server:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  self->_lock._os_unfair_lock_opaque = 0;
  NSMutableDictionary *v8 = [[NSMutableDictionary alloc] init];
  productIdentifierWithCapsLockActiveToGeneration = self->_productIdentifierWithCapsLockActiveToGeneration;
  self->_productIdentifierWithCapsLockActiveToGeneration = v8;

  NSMutableDictionary *v10 = [[NSMutableDictionary alloc] init];
  allKeyboardsBySenderID = self->_allKeyboardsBySenderID;
  self->_allKeyboardsBySenderID = v10;

  NSMutableArray *v12 = [[NSMutableArray alloc] init];
  usableKeyboards = self->_usableKeyboards;
  self->_usableKeyboards = v12;

  NSMutableArray *v14 = [[NSMutableArray alloc] init];
  eventRecognizers = self->_eventRecognizers;
  self->_eventRecognizers = v14;

  v16 = [v6 eventDispatcher];
  eventDispatcher = self->_eventDispatcher;
  self->_eventDispatcher = v16;

  v18 = [v6 systemInterface];
  eventSystemInterface = self->_eventSystemInterface;
  self->_eventSystemInterface = v18;

  v20 = [v6 eventProcessorRegistry];
  eventProcessorRegistry = self->_eventProcessorRegistry;
  self->_eventProcessorRegistry = v20;

  v22 = [BKDisplayController sharedInstance];
  displayController = self->_displayController;
  self->_displayController = v22;

  v24 = [self->_displayController addDisplayBlankingObserver:self];
  displayBlankingObservationAssertion = self->_displayBlankingObservationAssertion;
  self->_displayBlankingObservationAssertion = v24;

  keyboardLayout = self->_keyboardLayout;
  self->_keyboardLayout = (NSString *)@"US";

  v27 = &_dispatch_main_q;
  v54[0] = @"DeviceUsagePage";
  v54[1] = @"DeviceUsage";
  *(void *)&__int128 buf = &off_1000C0480;
  *((void *)&buf + 1) = &off_1000C0498;
  v28 = [NSDictionary dictionaryWithObjects:v54 forKeys:v28 count:2];
  BKIOHIDServiceMatcher *v29 = [[BKIOHIDServiceMatcher alloc] init];
  v30 = [v6 serviceMatcherDataProvider];
  BKIOHIDServiceMatcher *v31 = [[BKIOHIDServiceMatcher alloc] initWithMatchingDictionary:v28 dataProvider:v30];
  keyboardServiceMatcher = self->_keyboardServiceMatcher;
  self->_keyboardServiceMatcher = v31;

  [self->_keyboardServiceMatcher startObserving:self queue:_dispatch_main_q];
  NSMutableDictionary *v33 = [[NSMutableDictionary alloc] init];
  keyDownToEventSequence = self->_keyDownToEventSequence;
  self->_keyDownToEventSequence = v33;

  NSMutableDictionary *v35 = [[NSMutableDictionary alloc] init];
  senderIDToKeysDown = self->_senderIDToKeysDown;
  self->_senderIDToKeysDown = v35;

  NSMutableSet *v37 = [[NSMutableSet alloc] init];
  senderIDsWithModifiersOnly = self->_senderIDsWithModifiersOnly;
  self->_senderIDsWithModifiersOnly = v37;

  NSMutableSet *v39 = [[NSMutableSet alloc] init];
  downModifierKeys = self->_downModifierKeys;
  self->_downModifierKeys = v39;

  BKSDefaults *v41 = [BKSDefaults externalDefaults];
  v42 = [v41 keyboardDefaults];

  uint64_t v43 = BKLogKeyboard([v42 migrateIfNeeded]);
  v44 = [v43 autorelease];
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v42;
    _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "external defaults: %@", (uint8_t *)&buf, 0xCu);
  }

  v45 = [NSString stringWithUTF8String:@"modifierKeyRemapping"];
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472LL;
  v51[2] = sub_100035F78;
  v51[3] = &unk_1000B8030;
  id v46 = v42;
  id v52 = v46;
  v53 = self;
  id v47 = [v46 observeDefault:v45 onQueue:&_dispatch_main_q withBlock:v51];

  self->_server = a4;
  [self->_server activate];
  [buf retain];
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472LL;
  v49[2] = sub_100036024;
  v49[3] = &unk_1000B76D8;
  [v50 copy];
  id v48 = (id)BSLogAddStateCaptureBlockWithTitle( &_dispatch_main_q,  @"BKKeyboards",  v49);
  v50 = nil;
  objc_destroyWeak((id *)&buf);
}

- (void)dealloc
{
  BKHIDEventProcessorRegistry *v3 = [BKHIDEventProcessorRegistry sharedInstance];
  BKHIDEventRecognizerEngine *v5 = [v3 eventProcessorOfClass:[BKHIDEventRecognizerEngine class]];
  id v6 = v5;

  eventRecognizers = self->_eventRecognizers;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100035F6C;
  v10[3] = &unk_1000B65A8;
  id v11 = v6;
  id v8 = v6;
  [eventRecognizers enumerateObjectsUsingBlock:v10];
  [self->_keyboardServiceMatcher invalidate];

  v9.receiver = self;
  v9.super_class = [BKKeyboardHIDEventProcessor class];
  [v9 dealloc];
}

- (NSString)debugDescription
{
  v2 = [BSDescriptionStream descriptionForRootObject:self];
  v3 = [v2 description];

  return (NSString *)v3;
}

- (int)eventSourceForSender:(id)a3
{
  v3 = self;
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  allKeyboardsBySenderID = v3->_allKeyboardsBySenderID;
  id v7 = [NSNumber numberWithUnsignedLongLong:v5.senderID];
  id v8 = [allKeyboardsBySenderID objectForKeyedSubscript:v7];
  LODWORD(v3) = [BKKeyboardHIDEventProcessor _eventSourceForKeyboardInfo:v8 sender:v5];

  os_unfair_lock_unlock(p_lock);
  return (int)v3;
}

- (void)setCapsLockLightOn:(BOOL)a3
{
  BOOL v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  if (self->_primaryKeyboardInfo)
  {
    [self _lock_setCapsLockState:v3 forKeyboard:];
  }

  else
  {
    uint64_t v7 = BKLogKeyboard(v6);
    id v8 = os_log_s *v7;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)objc_super v9 = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "can't set caps lock state; no keyboards attached",
        v9,
        2u);
    }
  }

  os_unfair_lock_unlock(p_lock);
}

- (NSString)keyboardLayout
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  id v4 = [self->_keyboardLayout copy];
  os_unfair_lock_unlock(p_lock);
  return (NSString *)v4;
}

- (void)setKeyboardLayout:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v14 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@ != ((void *)0)" @"keyboardLayout"];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v15 = NSStringFromSelector(a2);
      v16 = [v15 autorelease];
      v18 = [self class];
      v19 = NSStringFromClass(v18);
      v20 = [v19 autorelease];
      *(_DWORD *)__int128 buf = 138544642;
      v27 = v16;
      __int16 v28 = 2114;
      v29 = v20;
      __int16 v30 = 2048;
      v31 = self;
      __int16 v32 = 2114;
      v33 = @"BKKeyboardHIDEventProcessor.m";
      __int16 v34 = 1024;
      int v35 = 391;
      __int16 v36 = 2114;
      v37 = v14;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
    }

    _bs_set_crash_log_message([v14 UTF8String]);
    __break(0);
    JUMPOUT(0x100030BFCLL);
  }

  uint64_t v6 = v5;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  uint64_t v7 = (NSString *)[v6 copy];
  keyboardLayout = self->_keyboardLayout;
  self->_keyboardLayout = v7;

  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  NSMutableDictionary *v9 = [self->_allKeyboardsBySenderID allValues];
  id v10 = [v9 countByEnumeratingWithState:v21 objects:v25 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      v13 = 0LL;
      do
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        sub_100052EE4(*(void *)(*((void *)&v21 + 1) + 8LL * (void)v13), v6);
        v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:v21 objects:v25 count:16];
    }

    while (v11);
  }

  [self _lock_publishUsableKeyboardsToServiceConnections];
  os_unfair_lock_unlock(&self->_lock);
}

- (int64_t)activeModifiers
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  int64_t v4 = [self _lock_activeModifiers];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)addGlobalKeyboardObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  keyboardObserverAssertion = self->_keyboardObserverAssertion;
  if (!keyboardObserverAssertion)
  {
    BSCompoundAssertion *v8 = [BSCompoundAssertion assertionWithIdentifier:@"backboardd.keyboards.global-observers"];
    objc_super v9 = self->_keyboardObserverAssertion;
    self->_keyboardObserverAssertion = v8;

    keyboardObserverAssertion = self->_keyboardObserverAssertion;
  }

  NSString *v10 = [v5 description];
  v11 = v10;
  uint64_t v12 = [BSCompoundAssertion acquireForReason:v11 withContext:v5];

  os_unfair_lock_unlock(p_lock);
  return v12;
}

- (void)setKeyCommandsToAuthenticate:(id)a3
{
  uint64_t v6 = (NSMutableSet *)a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  if (self->_keyCommandsToAuthenticate != v6)
  {
    NSMutableSet *v4 = [v6 mutableCopy];
    keyCommandsToAuthenticate = self->_keyCommandsToAuthenticate;
    self->_keyCommandsToAuthenticate = v4;
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (id)keyboardLanguageForSenderID:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  allKeyboardsBySenderID = self->_allKeyboardsBySenderID;
  uint64_t v7 = (void *)[NSNumber numberWithUnsignedLongLong:a3];
  id v8 = [allKeyboardsBySenderID objectForKey:v7];

  if (v8) {
    objc_super v9 = (void *)v8[7];
  }
  else {
    objc_super v9 = 0LL;
  }
  id v10 = v9;
  os_unfair_lock_unlock(p_lock);

  return v10;
}

- (void)setKeyboardLayout:(id)a3 forSenderID:(unint64_t)a4
{
  id v18 = a3;
  if (!v18)
  {
    id v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@ != ((void *)0)" key:@"keyboardLayout"];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = NSStringFromSelector(a2);
      v13 = v12;
      v15 = [self class];
      v16 = NSStringFromClass(v15);
      uint64_t v17 = v16;
      *(_DWORD *)__int128 buf = 138544642;
      v20 = v13;
      __int16 v21 = 2114;
      __int128 v22 = v17;
      __int16 v23 = 2048;
      __int128 v24 = self;
      __int16 v25 = 2114;
      v26 = @"BKKeyboardHIDEventProcessor.m";
      __int16 v27 = 1024;
      int v28 = 457;
      __int16 v29 = 2114;
      __int16 v30 = v11;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
    }

    _bs_set_crash_log_message([v11 UTF8String]);
    __break(0);
    JUMPOUT(0x100030FC4LL);
  }

  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  allKeyboardsBySenderID = self->_allKeyboardsBySenderID;
  NSNumber *v9 = [NSNumber numberWithUnsignedLongLong:a4];
  id v10 = [allKeyboardsBySenderID objectForKey:v9];

  sub_100052EE4((uint64_t)v10, v18);
  os_unfair_lock_unlock(p_lock);
}

- (void)setRomanCapsLockSwitchModeActive:(BOOL)a3 forSenderID:(unint64_t)a4
{
  BOOL v5 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  allKeyboardsBySenderID = self->_allKeyboardsBySenderID;
  NSNumber *v9 = [NSNumber numberWithUnsignedLongLong:a4];
  id v10 = [allKeyboardsBySenderID objectForKey:v9];

  if (v10)
  {
    if (v5) {
      [self _lock_setCapsLockState:0LL forKeyboard:v10];
    }
    sub_100053008((uint64_t)v10, v5);
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)setCapsLockDelayOverride:(double)a3 forSenderID:(unint64_t)a4
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  allKeyboardsBySenderID = self->_allKeyboardsBySenderID;
  NSNumber *v9 = [NSNumber numberWithUnsignedLongLong:a4];
  id v10 = [allKeyboardsBySenderID objectForKey:v9];

  sub_1000530C8((uint64_t)v10, a3);
  os_unfair_lock_unlock(p_lock);
}

- (void)setCapsLockActive:(BOOL)a3 onSenderID:(unint64_t)a4
{
  BOOL v5 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  [self _lock_setCapsLockActive:v5 onSenderID:a4];
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isCapsLockLightOnForSenderID:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  allKeyboardsBySenderID = self->_allKeyboardsBySenderID;
  uint64_t v7 = [NSNumber numberWithUnsignedLongLong:a3];
  id v8 = [allKeyboardsBySenderID objectForKey:v7];

  if (v8) {
    BOOL v9 = v8[8] != 0;
  }
  else {
    BOOL v9 = 0;
  }
  os_unfair_lock_unlock(p_lock);

  return v9;
}

- (BOOL)keyboardWantsStandardTypeOverrideForSenderID:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  if (a3)
  {
    allKeyboardsBySenderID = self->_allKeyboardsBySenderID;
    uint64_t v7 = (void *)[NSNumber numberWithUnsignedLongLong:a3];
    id v8 = [allKeyboardsBySenderID objectForKey:v7];

    if (v8) {
      LOBYTE(v9) = v8[13] != 0;
    }
    else {
      LOBYTE(v9) = 0;
    }
  }

  else
  {
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    [self->_allKeyboardsBySenderID allValues];
    id v9 = [v8 countByEnumeratingWithState:v14 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v15;
      while (2)
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8LL * (void)i);
          if (v12 && *(_BYTE *)(v12 + 13))
          {
            LOBYTE(v9) = 1;
            goto LABEL_15;
          }
        }

        id v9 = [v8 countByEnumeratingWithState:v14 objects:v18 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
  }

- (id)devicePropertiesForSenderID:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  if (a3)
  {
    uint64_t v6 = [BKHIDAccessibilitySender accessibilityHIDServices];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100035F3C;
    v14[3] = &unk_1000B65C8;
    v14[4] = a3;
    unsigned int v7 = [v6 bs_containsObjectPassingTest:v14];

    if (!v7)
    {
      allKeyboardsBySenderID = self->_allKeyboardsBySenderID;
      uint64_t v12 = (void *)[NSNumber numberWithUnsignedLongLong:a3];
      id v8 = [allKeyboardsBySenderID objectForKey:v12];

      if (v8) {
        goto LABEL_4;
      }
LABEL_6:
      uint64_t v10 = 0LL;
      goto LABEL_7;
    }
  }

  id v8 = self->_primaryKeyboardInfo;
  if (!v8) {
    goto LABEL_6;
  }
LABEL_4:
  id v9 = sub_10005320C(v8);
  uint64_t v10 = v9;
LABEL_7:
  os_unfair_lock_unlock(p_lock);

  return v10;
}

- (NSArray)allUsableDeviceProperties
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t v4 = [self->_usableKeyboards bs_map:&stru_1000B6608];
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (void)setRomanCapsLockSwitchModeActive:(BOOL)a3
{
  BOOL v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  uint64_t v6 = self->_usableKeyboards;
  [v6 countByEnumeratingWithState:&v11 objects:nil count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        sub_100053008(*(void *)(*((void *)&v11 + 1) + 8LL * (void)v10), v3);
        uint64_t v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      [v6 countByEnumeratingWithState:v11 objects:v15 count:16];
    }

    while (v8);
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)setCapsLockDelayOverride:(double)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  uint64_t v6 = self->_usableKeyboards;
  [v6 countByEnumeratingWithState:v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        sub_1000530C8(*(void *)(*((void *)&v11 + 1) + 8LL * (void)v10), a3);
        uint64_t v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      [v6 countByEnumeratingWithState:v11 objects:v15 count:16];
    }

    while (v8);
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)setStandardType:(unsigned int)a3 forSenderID:(unint64_t)a4
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  allKeyboardsBySenderID = self->_allKeyboardsBySenderID;
  uint64_t v9 = [NSNumber numberWithUnsignedLongLong:a4];
  id v18 = [allKeyboardsBySenderID objectForKey:v9];

  if (v18 && *((_DWORD *)v18 + 4) != a3)
  {
    *((_DWORD *)v18 + 4) = a3;
    id v10 = v18[3];
    NSNumber *v11 = [NSNumber numberWithUnsignedInt:*((unsigned int *)v18 + 4)];
    [v10 setProperty:v11 forKey:@"StandardType"];

    __int128 v12 = [BKSDefaults localDefaults];
    id v13 = sub_100052934((uint64_t)v18);
    uint64_t v14 = v13;
    __int128 v15 = (void *)v14;
    if (v14)
    {
      uint64_t v19 = v14;
      __int128 v16 = [NSNumber numberWithUnsignedInt:*((unsigned int *)v18 + 4)];
      v20 = v16;
      __int128 v17 = [NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
      [v12 setKeyboardTypeRemap:v17];
    }
  }

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isCapsLockLightOn
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  [v2 _lock_anyKeyboardHasCapsLockActive];
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)capsLockKeyHasLanguageSwitchLabel
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  primaryKeyboardInfo = self->_primaryKeyboardInfo;
  if (primaryKeyboardInfo) {
    BOOL capsLockKeyHasLanguageSwitchLabel = primaryKeyboardInfo->_capsLockKeyHasLanguageSwitchLabel;
  }
  else {
    BOOL capsLockKeyHasLanguageSwitchLabel = 0;
  }
  os_unfair_lock_unlock(p_lock);
  return capsLockKeyHasLanguageSwitchLabel;
}

- (NSSet)keyCommandsToAuthenticate
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  id v4 = [self->_keyCommandsToAuthenticate copy];
  os_unfair_lock_unlock(p_lock);
  return (NSSet *)v4;
}

- (void)_lock_updateGlobalModifierState
{
  int64_t globalActiveModifiers = self->_globalActiveModifiers;
  int64_t v4 = [self _lock_activeModifiers];
  if (globalActiveModifiers != v4)
  {
    int64_t v5 = v4;
    self->_int64_t globalActiveModifiers = v4;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    uint64_t v6 = [self->_keyboardObserverAssertion context];
    id v7 = [v6 countByEnumeratingWithState:v12 objects:v16 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          __int128 v11 = *(void **)((void *)v12 + 8LL * (void)i);
          if ((objc_opt_respondsToSelector(v11, "globalKeyboardModifiersDidChange:") & 1) != 0) {
            [v11 globalKeyboardModifiersDidChange:v5];
          }
        }

        id v8 = [v6 countByEnumeratingWithState:v12 objects:v16 count:16];
      }

      while (v8);
    }
  }

- (int64_t)_lock_activeModifiers
{
  v2 = [self->_usableKeyboards bs_reduce:&off_1000C0468 block:&stru_1000B6648];
  id v3 = [v2 integerValue];

  return (int64_t)v3;
}

- (BOOL)_lock_anyKeyboardHasCapsLockActive
{
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  v2 = self->_usableKeyboards;
  [v2 countByEnumeratingWithState:v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (i = 0LL; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void *)(*((void *)&v8 + 1) + 8LL * (void)i);
        if (v6 && *(_BYTE *)(v6 + 8))
        {
          LOBYTE(v3) = 1;
          goto LABEL_12;
        }
      }

      [v2 countByEnumeratingWithState:v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }

- (void)_lock_setKeyboardLightsSuspended:(BOOL)a3
{
  BOOL v3 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  int64_t v5 = self->_usableKeyboards;
  [v5 enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
    v6 = idx;
    v12 = obj;
    v16 = stop;
}];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    BOOL v9 = !v3;
    do
    {
      __int128 v10 = 0LL;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v12 + 1) + 8LL * (void)v10);
        if (v11 && *(_BYTE *)(v11 + 8)) {
          [*(id *)(v11 + 24) setElementValue:v9 forUsagePage:8 usage:2];
        }
        __int128 v10 = (char *)v10 + 1;
      }

      while (v7 != v10);
      [v5 countByEnumeratingWithState:v12 objects:v16 count:16];
    }

    while (v7);
  }
}

- (void)_lock_keyboardsDetected:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_assert_owner(p_lock);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100035C90;
  v6[3] = &unk_1000B6670;
  v6[4] = self;
  [v5 enumerateObjectsUsingBlock:v6];
}

- (void)_lock_keyboardRemoved:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  id v5 = [NSNumber numberWithUnsignedLongLong:v4 senderID];
  id v6 = [self->_allKeyboardsBySenderID objectForKey:v5];
  uint64_t v7 = BKLogKeyboard(v6);
  uint64_t v8 = v7;
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v9)
    {
      int v18 = 138543362;
      id v19 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Keyboard detached: %{public}@",  (uint8_t *)&v18,  0xCu);
    }

    __int128 v10 = (void *)[v4 propertyForKey:@"VendorID"];
    int v11 = [v10 unsignedIntValue];
    __int128 v12 = (void *)[v4 propertyForKey:@"ProductID"];
    int v13 = sub_10003588C(v11, (int)[v12 unsignedIntValue]);

    if (v13)
    {
      int64_t v15 = self->_countOfKeyboardsRequiringAllSmartCoverHESDisengagedForOpen - 1;
      self->_countOfKeyboardsRequiringAllSmartCoverHESDisengagedForOpen = v15;
      if (!v15)
      {
        BKSmartCoverHIDEventProcessor *v16 = [self->_eventProcessorRegistry eventProcessorOfClass:[BKSmartCoverHIDEventProcessor class]];
        __int128 v17 = [v16 autorelease];
        [v17 setAttachedCoverRequiresWorkaroundForOpenState:0];
      }
    }

    [self _lock_stopWatchingForGestures:v6];
    [self _lock_usableKeyboardDetached:v6];
    [self->_allKeyboardsBySenderID removeObjectForKey:v5];
  }

  else
  {
    if (v9)
    {
      int v18 = 138543362;
      id v19 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Keyboard not found for IOHIDService: %{public}@",  (uint8_t *)&v18,  0xCu);
    }
  }
}

- (void)_lock_setPrimaryKeyboard:(id)a3
{
  id v5 = (BKKeyboardInfo *)a3;
  os_unfair_lock_assert_owner(&self->_lock);
  id v6 = self->_primaryKeyboardInfo;
  if (v6 != v5)
  {
    self->_primaryKeyboardInfo = a3;
    if (v5)
    {
      sub_100052EE4((uint64_t)v5, self->_keyboardLayout);
      unsigned int keyboardType = v5->_keyboardType;
      uint64_t v8 = [NSNumber numberWithUnsignedChar:v5->_countryCode];
      uint64_t v9 = GSKeyboardSetHardwareKeyboardAttached(v5->_gsKeyboard, 1LL);
      uint64_t v10 = BKLogKeyboard(v9);
      os_log_s *v11 = [v10 autorelease];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v12 = [v8 unsignedIntValue];
        keyboardLayout = self->_keyboardLayout;
        gsKeyboard = v5->_gsKeyboard;
        v15[0] = 67109890;
        v15[1] = v12;
        __int16 v16 = 1024;
        unsigned int v17 = keyboardType;
        __int16 v18 = 2114;
        id v19 = keyboardLayout;
        __int16 v20 = 2048;
        __int16 v21 = gsKeyboard;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Hardware keyboard attached (countryCode:%d type:%d layout:%{public}@) GS:%p",  (uint8_t *)v15,  0x22u);
      }
    }

    else if (v6)
    {
      GSKeyboardSetHardwareKeyboardAttached(v6->_gsKeyboard, 0LL);
    }
  }
}

- (void)_lock_restoreCapsLockStateToKeyboard:(id)a3
{
  id v4 = (id *)a3;
  if (v4)
  {
    uint64_t v14 = v4;
    int v5 = sub_100052C9C(v4);
    id v6 = v14;
    if (v5)
    {
      if (!*((_BYTE *)v14 + 9))
      {
        unsigned __int8 v7 = [v14[3] isVirtualService];
        id v6 = v14;
        if ((v7 & 1) == 0)
        {
          id v8 = sub_1000531F0(v14);
          uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
          if (v9)
          {
            uint64_t v10 = [self->_productIdentifierWithCapsLockActiveToGeneration objectForKey:v9];

            if (v10)
            {
              id v11 = v14[3];
              [self _lock_setCapsLockActive:1 onSenderID:[v11 senderID]];

              productIdentifierWithCapsLockActiveToGeneration = self->_productIdentifierWithCapsLockActiveToGeneration;
              int v13 = [NSNumber numberWithInteger:v14[11]];
              [productIdentifierWithCapsLockActiveToGeneration setObject:v13 forKey:v9];

LABEL_10:
              id v4 = v14;
              goto LABEL_11;
            }
          }

          id v6 = v14;
        }
      }
    }

    [v6[3] setElementValue:0 forUsagePage:8 usage:2];
    goto LABEL_10;
  }

- (void)_lock_publishUsableKeyboards:(id)a3 toServiceConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((-[BKHIDDomainServiceServer responsePendingForConnection:]( self->_server,  "responsePendingForConnection:",  v7) & 1) == 0)
  {
    id v8 = [self->_server didRespondBlockForConnection:v7];
    lock_keyboardPublicationSeed = (void *)self->_lock_keyboardPublicationSeed;
    [self location];
    uint64_t v10 = (void *)[v7 remoteTarget];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10003574C;
    v12[3] = &unk_1000B66B8;
    [v15 copy];
    id v11 = v8;
    id v14 = v11;
    v15[1] = lock_keyboardPublicationSeed;
    id v13 = v7;
    [v10 setConnectedKeyboards:v6 withReply:v12];

    objc_destroyWeak(v15);
    [location release];
  }
}

- (void)_lock_publishUsableKeyboardsToServiceConnections
{
  BOOL v3 = [self->_usableKeyboards bs_map:&stru_1000B66D8];
  server = self->_server;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000356F8;
  v6[3] = &unk_1000B6700;
  v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  [server enumerateUserInfoWithBlock:v6];
}

- (void)_lock_usableKeyboardAttached:(id)a3
{
  id v4 = a3;
  BOOL v5 = [self->_usableKeyboards containsObject:v4];
  if ((v5 & 1) == 0)
  {
    uint64_t v6 = BKLogKeyboard(v5);
    id v7 = [os_log_s class];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138543362;
      id v13 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Usable keyboard attached: %{public}@",  (uint8_t *)&v12,  0xCu);
    }

    int64_t keyboardGeneration = self->_keyboardGeneration;
    if (keyboardGeneration >= 0) {
      int64_t v9 = keyboardGeneration + 1;
    }
    else {
      int64_t v9 = 1LL;
    }
    self->_int64_t keyboardGeneration = v9;
    if (v4) {
      v4[11] = v9;
    }
    [self->_usableKeyboards addObject:v4];
    if (!self->_primaryKeyboardInfo) {
      [self _lock_setPrimaryKeyboard:v4];
    }
    if (self->_keyboardLayout)
    {
      if (v4) {
        uint64_t v10 = (void *)v4[6];
      }
      else {
        uint64_t v10 = 0LL;
      }
      id v11 = v10;

      if (!v11) {
        sub_100052EE4((uint64_t)v4, self->_keyboardLayout);
      }
    }

    [self _lock_restoreCapsLockStateToKeyboard:v4];
    [self _lock_publishUsableKeyboardsToServiceConnections];
  }
}

- (void)_lock_addModifierKeyDown:(id)a3
{
  id v4 = a3;
  id v5 = sub_10003F4C4();
  uint64_t v6 = [v5 autorelease];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "modifier key down: %{public}@",  (uint8_t *)&v7,  0xCu);
  }

  [self->_downModifierKeys addObject:v4];
}

- (void)_lock_removeModifierKeyDown:(id)a3
{
  id v4 = a3;
  id v5 = sub_10003F4C4();
  uint64_t v6 = v5;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "modifier key up: %{public}@",  (uint8_t *)&v7,  0xCu);
  }

  [self->_downModifierKeys removeObject:v4];
}

- (void)_lock_removeSenderIDFromTracking:(unint64_t)a3
{
  id v5 = [self->_keyDownToEventSequence allKeys];
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id v6 = [v5 countByEnumeratingWithState:v26 objects:v31 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v27;
    do
    {
      int64_t v9 = 0LL;
      do
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v26 + 1) + 8LL * (void)v9);
        if (v10) {
          uint64_t v11 = *(void *)(v10 + 8);
        }
        else {
          uint64_t v11 = 0LL;
        }
        if (v11 == a3) {
          [self->_keyDownToEventSequence removeObjectForKey:];
        }
        int64_t v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v12 = [v5 countByEnumeratingWithState:v26 objects:v31 count:16];
      id v7 = v12;
    }

    while (v12);
  }

  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  NSMutableSet *v13 = [self->_downModifierKeys copy];
  BOOL v14 = [v13 countByEnumeratingWithState:v22 objects:v30 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v23;
    do
    {
      unsigned int v17 = 0LL;
      do
      {
        if (*(void *)v23 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v22 + 1) + 8LL * (void)v17);
        if (v18) {
          uint64_t v19 = *(void *)(v18 + 8);
        }
        else {
          uint64_t v19 = 0LL;
        }
        if (v19 == a3) {
          [self _lock_removeModifierKeyDown:];
        }
        unsigned int v17 = (char *)v17 + 1;
      }

      while (v15 != v17);
      id v20 = [v13 countByEnumeratingWithState:v22 objects:v30 count:16];
      id v15 = v20;
    }

    while (v20);
  }

  __int16 v21 = [NSNumber numberWithUnsignedLongLong:a3];
  [self->_senderIDsWithModifiersOnly removeObject:v21];
  [self->_senderIDToKeysDown removeObjectForKey:v21];
}

- (void)_lock_removeCapsLockEntryIfNeeded:(id)a3
{
  id v4 = sub_1000531F0(a3);
  id v5 = v4;
  if (v5)
  {
    id v6 = [self->_productIdentifierWithCapsLockActiveToGeneration objectForKeyedSubscript:v5];
    id v7 = [v6 integerValue];

    if (v7)
    {
      dispatch_time_t v8 = dispatch_time(0LL, 30000000000LL);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100035690;
      block[3] = &unk_1000B6F40;
      block[4] = self;
      id v10 = v5;
      id v11 = v7;
      dispatch_after(v8, &_dispatch_main_q, block);
    }
  }
}

- (void)_lock_usableKeyboardDetached:(id)a3
{
  id v4 = (id *)a3;
  os_unfair_lock_assert_owner(&self->_lock);
  [self _lock_removeCapsLockEntryIfNeeded:v4];
  BOOL v5 = [self->_usableKeyboards containsObject:v4];
  if ((_DWORD)v5)
  {
    uint64_t v6 = BKLogKeyboard(v5);
    id v7 = [os_log_s class];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138543362;
      id v12 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Usable keyboard detached: %{public}@",  (uint8_t *)&v11,  0xCu);
    }

    [self->_usableKeyboards removeObject:v4];
    if (v4) {
      id v8 = v4[3];
    }
    else {
      id v8 = 0LL;
    }
    id v9 = v8;
    [self _lock_removeSenderIDFromTracking:[v9 senderID]];

    if (-[BKKeyboardInfo isEqual:](self->_primaryKeyboardInfo, "isEqual:", v4))
    {
      [self _lock_setPrimaryKeyboard:0LL];
      if (-[NSMutableArray count](self->_usableKeyboards, "count"))
      {
        id v10 = [self->_usableKeyboards firstObject];
        [self _lock_setPrimaryKeyboard:v10];
      }
    }

    [self _lock_publishUsableKeyboardsToServiceConnections];
    if (v4 && *((_BYTE *)v4 + 14)) {
      [v4[3] setElementValue:0 forUsagePage:8 usage:2];
    }
  }
}

- (void)_lock_cancelKeyDownEvents:(id)a3
{
  id v4 = a3;
  uint64_t v5 = mach_absolute_time();
  if (v4) {
    uint64_t v6 = (void *)v4[3];
  }
  else {
    uint64_t v6 = 0LL;
  }
  id v7 = v6;

  id v8 = [v7 senderID];
  keyDownToEventSequence = self->_keyDownToEventSequence;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000355B8;
  v10[3] = &unk_1000B6720;
  void v10[4] = v8;
  v10[5] = v5;
  [keyDownToEventSequence enumerateKeysAndObjectsUsingBlock:v10];
  [self _lock_removeSenderIDFromTracking:v8];
}

- (int)_eventSourceForKeyboardInfo:(id)a3 sender:(id)a4
{
  if (!a3) {
    return [a4 eventSource];
  }
  return 1;
}

- (void)_lock_handleUnicodeEvent:(__IOHIDEvent *)a3 fromSender:(id)a4 dispatcher:(id)a5
{
  p_lock = &self->_lock;
  id v9 = a5;
  id v10 = a4;
  os_unfair_lock_assert_owner(p_lock);
  allKeyboardsBySenderID = self->_allKeyboardsBySenderID;
  id v12 = [NSNumber numberWithUnsignedLongLong:v10.senderID];
  id v17 = [allKeyboardsBySenderID objectForKeyedSubscript:v12];

  id v13 = [self->_eventSystemInterface deliveryManager];
  BKKeyboardEventExtras *v14 = [[BKKeyboardEventExtras alloc] init];
  unsigned int v15 = [self _eventSourceForKeyboardInfo:v17 sender:v10];
  if (v14) {
    v14->_eventSource = v15;
  }
  uint64_t v16 = [v13 sequenceForFirstEvent:a3 sender:v10 processor:self dispatcher:v9 additionalContext:v14];

  [v16 postEvent:a3 position:1 additionalContext:v14];
}

- (void)_lock_applyDeliveryInformation:(id)a3 resolution:(id)a4 toEvent:(__IOHIDEvent *)a5
{
  id v8 = (unsigned int *)a3;
  id v9 = a4;
  id v10 = [BKSHIDEventKeyboardAttributes baseAttributesFromProvider:v9];
  int v11 = [self->_eventSystemInterface deliveryManager];
  id v12 = [v11 authenticationOriginator];
  if (v8)
  {
    if (*((_BYTE *)v8 + 8)) {
      [v10 setOptions:128];
    }
    [v10 setSource:v8[3]];
    [v10 setGSModifierState:v8[4]];
    id v13 = *((id *)v8 + 3);
    if (v13 && IOHIDEventGetIntegerValue(a5, 196610LL))
    {
      id v14 = [v13 context];
      unsigned int v15 = [self->_eventSystemInterface clientConnectionManager];
      id v16 = [v15 versionedPIDForPID:[v9 pid]];

      if (v16 == (id)-1LL)
      {
        uint64_t v19 = BKLogKeyboard(v17);
        uint64_t v18 = [v19 autorelease];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)__int128 buf = 138543362;
          __int128 v22 = v8;
          _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "invalid audit token for destination:%{public}@",  buf,  0xCu);
        }
      }

      else
      {
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472LL;
        v20[2] = sub_100035544;
        v20[3] = &unk_1000B6740;
        v20[4] = v14;
        v20[5] = v16;
        uint64_t v18 = (os_log_s *)[v12 buildMessage:v20];
        [v10 setAuthenticationMessage:v18];
      }
    }
  }

  else
  {
    [v10 setSource:0];
    [v10 setGSModifierState:0];
    id v13 = 0LL;
  }

  BKSHIDEventSetAttributes(a5, v10);
}

- (void)_lock_dispatchKeyEvent:(__IOHIDEvent *)a3 keyCommand:(id)a4 keyboardInfo:(id)a5 eventSource:(int)a6 fromSender:(id)a7 dispatcher:(id)a8
{
  id v53 = a4;
  v56 = a5;
  id v13 = a7;
  id v55 = a8;
  uint64_t v57 = [self->_eventSystemInterface deliveryManager];
  uint64_t IntegerValue = IOHIDEventGetIntegerValue(a3, 196608LL);
  uint64_t v15 = IOHIDEventGetIntegerValue(a3, 196609LL);
  v60 = a3;
  uint64_t v16 = IOHIDEventGetIntegerValue(a3, 196610LL);
  v61 = v13;
  id v17 = [v13 senderID];
  uint64_t v18 = [NSNumber numberWithUnsignedLongLong:v17];
  [BKKeyDownKey self];
  BKKeyDownKey *v19 = [[BKKeyDownKey alloc] init];
  v19->_senderID = (unint64_t)v17;
  v19->_page = IntegerValue;
  v19->_usage = v15;
  id v20 = v19;
  uint64_t v58 = [self->_keyDownToEventSequence objectForKey:];
  __int16 v21 = [self->_senderIDToKeysDown objectForKey:v18];
  uint64_t v62 = v16;
  if (!+[BKSHIDEventKeyCommand _isModifierKeyWithPage:usage:]( &OBJC_CLASS___BKSHIDEventKeyCommand,  "_isModifierKeyWithPage:usage:",  IntegerValue,  v15))
  {
    __int128 v22 = self;
    __int128 v23 = (void *)v18;
    [self->_senderIDsWithModifiersOnly removeObject:v18];
    __int128 v25 = v53;
    __int128 v24 = v55;
    __int128 v27 = v56;
    __int128 v26 = (void *)v57;
    if (v16) {
      goto LABEL_7;
    }
LABEL_11:
    v54 = v21;
    [v21 removeObject:v20];
    __int128 v28 = v60;
    goto LABEL_12;
  }

  __int128 v22 = self;
  __int128 v23 = (void *)v18;
  if (!-[NSMutableSet count](v21, "count")) {
    [self->_senderIDsWithModifiersOnly addObject:v18];
  }
  __int128 v25 = v53;
  __int128 v24 = v55;
  __int128 v26 = (void *)v57;
  if (!v16)
  {
    [self _lock_removeModifierKeyDown:v20];
    __int128 v27 = v56;
    goto LABEL_11;
  }

  [self _lock_addModifierKeyDown:v20];
  __int128 v27 = v56;
LABEL_7:
  __int128 v28 = v60;
  if (!v21)
  {
    NSMutableSet *v21 = [[NSMutableSet alloc] init];
    [v22->_senderIDToKeysDown setObject:v21 forKey:v23];
  }

  v54 = v21;
  [v21 addObject:v20];
LABEL_12:
  __int128 v29 = (void *)v58;
  __int16 v30 = [[__BKKeyboardEventExtras alloc] init];
  v31 = v30;
  if (v30)
  {
    v30->_eventSource = a6;
    BOOL ModifierState = [v22->_senderIDsWithModifiersOnly containsObject:v23];
    v31->_modifiersOnly = (char)ModifierState;
    if (!v27) {
      goto LABEL_17;
    }
  }

  else
  {
    BOOL ModifierState = [v22->_senderIDsWithModifiersOnly containsObject:v23];
    if (!v27) {
      goto LABEL_17;
    }
  }

  id ModifierState = (id)v27[10];
  if (ModifierState)
  {
    id ModifierState = (id)GSKeyboardGetModifierState();
    if (v31) {
      v31->_GSid ModifierState = ModifierState;
    }
  }

- (void)_lock_handleKeyEvent:(__IOHIDEvent *)a3 fromSender:(id)a4 dispatcher:(id)a5 bypassCapsLockChecks:(BOOL)a6
{
  id v10 = a4;
  id v11 = a5;
  os_unfair_lock_assert_owner(&self->_lock);
  id v12 = [NSNumber numberWithUnsignedLongLong:[v10 senderID]];
  id v13 = [self->_allKeyboardsBySenderID objectForKeyedSubscript:v12];
  primaryKeyboardInfo = v13;
  if (!v13) {
    primaryKeyboardInfo = self->_primaryKeyboardInfo;
  }
  uint64_t v15 = primaryKeyboardInfo;

  uint64_t IntegerValue = IOHIDEventGetIntegerValue(a3, 196609LL);
  uint64_t v17 = IOHIDEventGetIntegerValue(a3, 196610LL);
  uint64_t v18 = [self _eventSourceForKeyboardInfo:v15 sender:v10];
  if (IntegerValue == 57 && v17)
  {
    if (a6) {
      goto LABEL_6;
    }
    if (v15 && v15->_capsLockRomanSwitchMode)
    {
      __int128 v24 = v15;
      goto LABEL_10;
    }

    if (sub_100052C9C(v15))
    {
LABEL_6:
      if (v15) {
        BOOL v19 = !v15->_capsLockOn;
      }
      else {
        BOOL v19 = 1LL;
      }
      [self _lock_setCapsLockState:v19 forKeyboard:v15];
    }
  }

  if (v15)
  {
LABEL_10:
    gsKeyboard = v15->_gsKeyboard;
    goto LABEL_11;
  }

  gsKeyboard = 0LL;
LABEL_11:
  if (+[BKSHIDEventKeyCommand _shouldMatchKeyCommandsForEvent:gsKeyboard:]( &OBJC_CLASS___BKSHIDEventKeyCommand,  "_shouldMatchKeyCommandsForEvent:gsKeyboard:",  a3,  gsKeyboard))
  {
    int64_t v25 = 0LL;
    __int16 v21 = [BKSHIDEventKeyCommand keyCommandForEvent:gsKeyboard:activeModifiers:a3 gsKeyboard:activeModifiers:&v25];
    if (v15) {
      v15->_activeModifiers = v25;
    }
  }

  else
  {
    __int16 v21 = 0LL;
  }

  [self _lock_dispatchKeyEvent:a3 keyCommand:v21 keyboardInfo:v15 eventSource:v18 fromSender:v10 dispatcher:v11];
  __int128 v22 = (void *)[self->_senderIDToKeysDown objectForKey:v12];
  id v23 = [v22 count];

  if (!v23) {
    [self->_senderIDsWithModifiersOnly removeObject:v12];
  }
}

- (void)_lock_watchForGestures:(id)a3
{
  id v4 = (id *)a3;
  uint64_t v5 = v4;
  if (v4 && *((_BYTE *)v4 + 14))
  {
    id v6 = v4[13];
    if (v6)
    {
      id v7 = v6;
LABEL_20:
      __int128 v26 = [BKHIDEventSequenceRecognizer recognizerForEventDescriptor:v7];
      [v26 setShouldConsumeEvents:1];
      objc_storeStrong(v5 + 12, v26);
      [self->_eventRecognizers addObject:v26];
      BKHIDEventProcessorRegistry *v27 = [BKHIDEventProcessorRegistry sharedInstance];
      BKHIDEventRecognizerEngine *v29 = [v27 eventProcessorOfClass:[BKHIDEventRecognizerEngine class]];
      __int16 v30 = (void *)objc_claimAutoreleasedReturnValue(v29);

      [self location];
      objc_initWeak(&from, v5);
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472LL;
      v31[2] = sub_1000354F4;
      v31[3] = &unk_1000B6768;
      [v32 copy];
      id v33 = location;
      [v30 addRecognizer:v26 recognitionBlock:v31];
      objc_destroyWeak(v33);
      [v32 release];
      [from release];
      [location release];

      goto LABEL_21;
    }

    id v8 = [v4[3] propertyForKey:@"KeyboardEnabledEvent"];
    NSDictionary *v10 = [NSDictionary class];
    id v11 = v8;
    id v12 = v11;
    if (v10)
    {
      if ((objc_opt_isKindOfClass(v11, v10) & 1) != 0) {
        id v13 = v12;
      }
      else {
        id v13 = 0LL;
      }
    }

    else
    {
      id v13 = 0LL;
    }

    id v14 = v13;

    uint64_t v15 = (void *)[v14 objectForKeyedSubscript:@"EventType"];
    uint64_t v16 = (void *)[v14 objectForKeyedSubscript:@"UsagePage"];
    uint64_t v17 = (void *)[v14 objectForKeyedSubscript:@"Usage"];

    if (v15 && v16 && v17)
    {
      unsigned __int16 v18 = (unsigned __int16)[v16 unsignedIntegerValue];
      unsigned __int16 v19 = (unsigned __int16)[v17 unsignedIntegerValue];
      id v20 = [v15 unsignedIntegerValue];
      __int16 v21 = [BKSHIDEventUsagePairDescriptor descriptorForHIDEventType:v20 page:v18 usage:v19];
      if (v21)
      {
        uint64_t v22 = [v21 descriptorByAddingSenderIDToMatchCriteria:v5[3].senderID];
        id v23 = v5[13];
        v5[13] = (id)v22;
      }

      else
      {
        id v24 = sub_10003F280();
        os_log_s *v25 = [v24 autorelease];
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          LODWORD(location) = 67109378;
          HIDWORD(location) = (_DWORD)v20;
          __int16 v36 = 2114;
          uint64_t Name = IOHIDEventTypeGetName(v20);
          _os_log_error_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "keyboardActivationChangeEventDescriptor: unsupported KeyboardEnabledEvent:EventType %d (%{public}@)",  (uint8_t *)&location,  0x12u);
        }
      }
    }

    id v7 = v5[13];
    if (v7) {
      goto LABEL_20;
    }
  }

- (void)_lock_stopWatchingForGestures:(id)a3
{
  if (a3)
  {
    id v4 = *((id *)a3 + 12);
    if (v4)
    {
      id v9 = v4;
      [self->_eventRecognizers removeObject:v4];
      uint64_t v5 = [BKHIDEventProcessorRegistry sharedInstance];
      BKHIDEventRecognizerEngine *v7 = [v5 eventProcessorOfClass:[BKHIDEventRecognizerEngine class]];
      id v8 = v7;

      [v8 removeRecognizer:v9];
      id v4 = v9;
    }
  }

  else
  {
    id v4 = 0LL;
  }
}

- (void)smartKeyboardAttachmentStateDidChange:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  [_lock_smartKeyboardAttachmentStateDidChange:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_smartKeyboardAttachmentStateDidChange:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  uint64_t v6 = BKLogKeyboard(v5);
  id v7 = v6;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    id v9 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "smartKeyboardAttachmentStateDidChange:%{public}@",  (uint8_t *)&v8,  0xCu);
  }

  if (sub_100052E30((uint64_t)v4))
  {
    [self _lock_usableKeyboardAttached:v4];
  }

  else
  {
    [self _lock_cancelKeyDownEvents:v4];
    [self _lock_usableKeyboardDetached:v4];
  }
}

- (void)_lock_postSyntheticCapsLockPressForKeyboard:(id)a3
{
  if (a3) {
    id v4 = (void *)*((void *)a3 + 3);
  }
  else {
    id v4 = 0LL;
  }
  id v11 = v4;
  id v5 = [v11 senderID];
  uint64_t v6 = mach_absolute_time();
  KeyboardEvent = (const void *)IOHIDEventCreateKeyboardEvent(0LL, v6, 7LL, 57LL, 1LL, 0LL);
  IOHIDEventSetSenderID(KeyboardEvent, v5);
  uint64_t v8 = mach_absolute_time();
  id v9 = (const void *)IOHIDEventCreateKeyboardEvent(0LL, v8, 7LL, 57LL, 0LL, 0LL);
  IOHIDEventSetSenderID(v9, v5);
  uint64_t v10 = self->_eventDispatcher;
  [self _lock_handleKeyEvent:KeyboardEvent fromSender:v11 dispatcher:v10 bypassCapsLockChecks:1];
  [self _lock_handleKeyEvent:v9 fromSender:v11 dispatcher:v10 bypassCapsLockChecks:YES];

  CFRelease(KeyboardEvent);
  CFRelease(v9);
}

- (void)_lock_setCapsLockState:(BOOL)a3 forKeyboard:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v12 = v6;
  if (v6 && *((_BYTE *)v6 + 8) != v4)
  {
    *((_BYTE *)v6 + 8) = v4;
    [*((id *)v6 + 3) setElementValue:v4 forUsagePage:8 usage:2];
    id v6 = v12;
  }

  id v7 = sub_1000531F0(v6);
  uint64_t v8 = [v7 autorelease];
  if (v8)
  {
    productIdentifierWithCapsLockActiveToGeneration = self->_productIdentifierWithCapsLockActiveToGeneration;
    if (v4)
    {
      if (v12) {
        uint64_t v10 = v12[11];
      }
      else {
        uint64_t v10 = 0LL;
      }
      id v11 = [NSNumber numberWithInteger:v10];
      [productIdentifierWithCapsLockActiveToGeneration setObject:v11 forKey:v8];
    }

    else
    {
      [productIdentifierWithCapsLockActiveToGeneration removeObjectForKey:v8];
    }
  }
}

- (void)_lock_setCapsLockActive:(BOOL)a3 onSenderID:(unint64_t)a4
{
  BOOL v5 = a3;
  allKeyboardsBySenderID = self->_allKeyboardsBySenderID;
  uint64_t v8 = [NSNumber numberWithUnsignedLongLong:a4];
  uint64_t v9 = [allKeyboardsBySenderID objectForKey:v8];

  if (v9)
  {
    if (*(_BYTE *)(v9 + 9))
    {
      uint64_t v11 = BKLogKeyboard(v10);
      os_log_s *v12 = v11;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v22 = 134217984;
        unint64_t v23 = a4;
        id v13 = "setCapsLockActive: [senderID %llX] the caps lock key is a language switch -- you cannot modify caps lock state";
LABEL_16:
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v22, 0xCu);
      }
    }

    else
    {
      uint64_t v15 = sub_100052C9C((void *)v9);
      if ((v15 & 1) != 0)
      {
        uint64_t v16 = @"off";
        if (v5) {
          uint64_t v16 = @"active";
        }
        id v12 = v16;
        char v17 = (*(_BYTE *)(v9 + 8) != 0) ^ v5;
        uint64_t v18 = BKLogKeyboard(v12);
        os_log_s *v19 = v18;
        BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
        if ((v17 & 1) != 0)
        {
          if (v20)
          {
            int v22 = 134218242;
            unint64_t v23 = a4;
            __int16 v24 = 2114;
            int64_t v25 = v12;
            _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "setCapsLockActive: [senderID %llX] set caps lock to %{public}@",  (uint8_t *)&v22,  0x16u);
          }

          [self _lock_postSyntheticCapsLockPressForKeyboard:v9];
        }

        else
        {
          if (v20)
          {
            int v22 = 134218242;
            unint64_t v23 = a4;
            __int16 v24 = 2114;
            int64_t v25 = v12;
            _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "setCapsLockActive: [senderID %llX] caps lock is already %{public}@",  (uint8_t *)&v22,  0x16u);
          }
        }
      }

      else
      {
        uint64_t v21 = BKLogKeyboard(v15);
        id v12 = v21;
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          int v22 = 134217984;
          unint64_t v23 = a4;
          id v13 = "setCapsLockActive: [senderID %llX] the capslock key on this keyboard has been remapped and there are no "
                "keys mapped to capslock";
          goto LABEL_16;
        }
      }
    }
  }

  else
  {
    uint64_t v14 = BKLogKeyboard(v10);
    os_log_s *v12 = [v14 autorelease];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v22 = 134217984;
      unint64_t v23 = a4;
      id v13 = "setCapsLockActive: [senderID %llX] no such keyboard";
      goto LABEL_16;
    }
  }
}

- (void)_modifierRemappingsDidChange
{
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = BKLogKeyboard(v3);
  os_log_s *v5 = [v4 autorelease];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "_modifierRemappingsDidChange", buf, 2u);
  }

  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v6 = self->_usableKeyboards;
  [v6 countByEnumeratingWithState:v18 objects:v24 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8LL * (void)i);
        if (v11)
        {
          if (*(_BYTE *)(v11 + 8))
          {
            uint64_t v12 = [v18 objectAtIndex:i];
            if ((v12 & 1) == 0)
            {
              uint64_t v13 = BKLogKeyboard(v12);
              uint64_t v14 = (os_log_s *)v13;
              if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
              {
                id v15 = *(id *)(v11 + 24);
                id v16 = [v15 senderID];
                *(_DWORD *)__int128 buf = 134217984;
                id v23 = v16;
                _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "_modifierRemappingsDidChange: [senderID %llX] capslock unmapped",  buf,  0xCu);
              }

              [self _lock_postSyntheticCapsLockPressForKeyboard:v11];
            }
          }
        }
      }

      [v6 countByEnumeratingWithState:v18 objects:v24 count:16];
    }

    while (v8);
  }

  os_unfair_lock_unlock(lock);
}

- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = *a3;
  int Type = IOHIDEventGetType(*a3, v11);
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  if (Type == 30)
  {
    [self _lock_handleUnicodeEvent:v10 fromSender:v8 dispatcher:v9];
  }

  else
  {
    uint64_t IntegerValue = (unsigned __int16)IOHIDEventGetIntegerValue(v10, 196608LL);
    uint64_t v15 = (unsigned __int16)IOHIDEventGetIntegerValue(v10, 196609LL);
    if ((IntegerValue != 7 || v15 == 102) && !GSKeyboardIsGlobeKeyUsagePair(IntegerValue, v15))
    {
      int64_t v16 = 0LL;
      goto LABEL_8;
    }

    [self _lock_handleKeyEvent:v10 fromSender:v8 dispatcher:v9 bypassCapsLockChecks:0];
    [self _lock_updateGlobalModifierState];
  }

  int64_t v16 = 1LL;
LABEL_8:
  os_unfair_lock_unlock(p_lock);

  return v16;
}

- (void)postEvent:(__IOHIDEvent *)a3 withContext:(id)a4 toResolution:(id)a5 fromSequence:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  Copy = (const void *)IOHIDEventCreateCopy(0LL, a3);
  uint64_t v15 = (void *)[v12 display];
  int64_t v16 = (void *)[v15 _hardwareIdentifier];
  _BKHIDNoteUserEventOccurredOnDisplay(v16);

  id v17 = v11;
  if (!v17)
  {
    uint64_t v34 = (objc_class *)[BKKeyboardEventExtras class];
    int v35 = NSStringFromClass(v34);
    __int16 v36 = [v35 autorelease];
    v37 = [NSString stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"extras", v36];

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      id v38 = NSStringFromSelector(a2);
      id v39 = v38;
      uint64_t v41 = [self class];
      v42 = NSStringFromClass(v41);
      uint64_t v43 = v42;
      *(_DWORD *)__int128 buf = 138544642;
      v60 = v39;
      __int16 v61 = 2114;
      uint64_t v62 = v43;
      __int16 v63 = 2048;
      __int128 v64 = self;
      __int16 v65 = 2114;
      __int128 v66 = @"BKKeyboardHIDEventProcessor.m";
      __int16 v67 = 1024;
      int v68 = 1382;
      __int16 v69 = 2114;
      v70 = v37;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
    }

    _bs_set_crash_log_message([v37 UTF8String]);
    __break(0);
    JUMPOUT(0x100034720LL);
  }

  __int128 v19 = v17;
  [BKKeyboardEventExtras class]
  if ((objc_opt_isKindOfClass(v19, v20) & 1) == 0)
  {
    v44 = (objc_class *)[v19 classForCoder];
    if (!v44) {
      v44 = [v19 class];
    }
    id v46 = NSStringFromClass(v44);
    uint64_t v47 = [v46 autorelease];
    v49 = [BKKeyboardEventExtras class];
    id v50 = NSStringFromClass(v49);
    v51 = v50;
    id v52 = [NSString stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@." extras:v47 class:v51 expected:v51];

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      id v53 = NSStringFromSelector(a2);
      v54 = [v53 autorelease];
      v56 = [self class];
      uint64_t v57 = NSStringFromClass(v56);
      uint64_t v58 = [v57 autorelease];
      *(_DWORD *)__int128 buf = 138544642;
      v60 = v54;
      __int16 v61 = 2114;
      uint64_t v62 = v58;
      __int16 v63 = 2048;
      __int128 v64 = self;
      __int16 v65 = 2114;
      __int128 v66 = @"BKKeyboardHIDEventProcessor.m";
      __int16 v67 = 1024;
      int v68 = 1382;
      __int16 v69 = 2114;
      v70 = v52;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
    }

    _bs_set_crash_log_message([v52 UTF8String]);
    __break(0);
    JUMPOUT(0x10003485CLL);
  }

  [self _lock_applyDeliveryInformation:v19 resolution:v12 toEvent:Copy];
  uint64_t IntegerValue = (unsigned __int16)IOHIDEventGetIntegerValue(a3, 196608LL);
  BOOL v22 = [BKSHIDEventKeyCommand _isModifierKeyWithPage:IntegerValue usage:(unsigned __int16)IOHIDEventGetIntegerValue(a3, 196609LL)];
  if ((_DWORD)v22)
  {
    uint64_t v23 = BKLogKeyboard(v22);
    os_log_s *v24 = [v23 autorelease];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t ConciseDescription = BKSHIDEventGetConciseDescription(a3);
      __int128 v26 = (void *)ConciseDescription;
      __int128 v27 = [BSDescriptionStream descriptionForRootObject:v12];
      *(_DWORD *)__int128 buf = 138543618;
      v60 = v26;
      __int16 v61 = 2114;
      uint64_t v62 = v27;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ -> %{public}@", buf, 0x16u);
    }
  }

  id v28 = sub_10003F4C4();
  os_log_s *v29 = v28;
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v31 = BKSHIDEventGetConciseDescription(a3);
    id v32 = v31;
    BSDescriptionStream *v33 = [BSDescriptionStream descriptionForRootObject:v12];
    *(_DWORD *)__int128 buf = 138543618;
    v60 = v32;
    __int16 v61 = 2114;
    uint64_t v62 = v33;
    _os_log_debug_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "%{public}@ -> %{public}@", buf, 0x16u);
  }

  __int16 v30 = (void *)[v13 dispatcher];
  [v30 postEvent:Copy toDestination:v12];

  CFRelease(Copy);
}

- (int64_t)processEvent:(__IOHIDEvent *)a3 withContext:(id)a4 buffer:(id)a5 sequence:(id)a6 sender:(id)a7 dispatcher:(id)a8 resolution:(id)a9
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a9;
  id v17 = *a3;
  int Type = IOHIDEventGetType(*a3, v18);
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  if (Type == 30)
  {
    uint64_t v20 = 1LL;
  }

  else if (IOHIDEventGetIntegerValue(v17, 196610LL))
  {
    uint64_t v20 = 1LL;
  }

  else
  {
    uint64_t v20 = 3LL;
  }

  [v15 postEvent:v17 position:v20 additionalContext:v13 fromBuffer:v14 toResolution:v16];
  os_unfair_lock_unlock(&self->_lock);

  return 1LL;
}

- (void)bufferingDidAddNewBuffers:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  BOOL v5 = self->_downModifierKeys;
  [v5 countByEnumeratingWithState:v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [self->_keyDownToEventSequence objectForKey:v11];
        [v10 repostFirstEventToBufferedTargets:v4];

        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      [v5 countByEnumeratingWithState:v11 objects:nil count:16];
    }

    while (v7);
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (void)bufferDidEndDraining:(id)a3
{
  id v4 = a3;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  keyDownToEventSequence = self->_keyDownToEventSequence;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000354E4;
  v8[3] = &unk_1000B6790;
  id v9 = v4;
  id v7 = v4;
  [keyDownToEventSequence enumerateKeysAndObjectsUsingBlock:v8];
  os_unfair_lock_unlock(p_lock);
}

- (void)display:(id)a3 didBecomeBlank:(BOOL)a4
{
  BOOL v4 = a4;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  [self _lock_setKeyboardLightsSuspended:v4];
  os_unfair_lock_unlock(p_lock);
}

- (void)matcher:(id)a3 servicesDidMatch:(id)a4
{
  id v5 = a4;
  id v7 = [v5 bs_compactMap:&stru_1000B67D0];
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  id v6 = [self->_eventSystemInterface senderCache];
  [v6 addSenderInfo:v5];

  [self _lock_keyboardsDetected:v7];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)serviceDidDisappear:(id)a3
{
  p_os_unfair_lock_t lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  [self _lock_keyboardRemoved:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)appendDescriptionToFormatter:(id)a3
{
  p_os_unfair_lock_t lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = [v5 appendObject:self->_keyboardLayout withName:@"keyboardLayout"];
  id v7 = [v5 appendObject:self->_primaryKeyboardInfo withName:@"primaryKeyboard"];
  id v8 = [v5 appendObject:self->_usableKeyboards withName:@"usableKeyboards"];
  id v9 =  [v5 appendBool:self->_countOfKeyboardsRequiringAllSmartCoverHESDisengagedForOpen > 0 withName:@"StrictWakeHallEffectSensors"];
  id v10 = [v5 appendObject:self->_keyDownToEventSequence withName:@"keyDownToEventSequence"];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100034F48;
  v11[3] = &unk_1000B7E88;
  v11[4] = self;
  [v5 appendCustomFormatWithName:@"globalActiveModifiers" block:v11];

  os_unfair_lock_unlock(p_lock);
}

- (id)setObservingUsableKeyboardConnections:(id)a3
{
  id v4 = a3;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v6 = [BKHIDDomainServiceServer currentConnection];
  id v7 = [self->_server userInfoForConnection:v6];
  unsigned int v8 = [v4 BOOLValue];
  if (v8 == [v7 BOOLValue]
    || (-[BKHIDDomainServiceServer setUserInfo:forConnection:](self->_server, "setUserInfo:forConnection:", v4, v6), !v8))
  {
    id v9 = 0LL;
  }

  else
  {
    id v9 = [NSMutableArray bs_map:stru_1000B67F0];
  }

  os_unfair_lock_unlock(p_lock);

  return v9;
}

- (void).cxx_destruct
{
}

@end