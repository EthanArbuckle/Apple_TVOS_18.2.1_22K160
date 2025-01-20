@interface ZWEventProcessor
+ (id)defaultEventProcessor;
- (BOOL)_handleEvent:(id)a3;
- (BOOL)offsetValuesAreNormalizedForAutopanner:(id)a3;
- (CGPoint)currentTouchOffset;
- (CGPoint)offsetForAutopanner:(id)a3;
- (NSPointerArray)externalDisplayDelegates;
- (SCRCThread)hidPostThread;
- (ZOTFullscreenEventHandler)fullscreenEventHandler;
- (ZWEventProcessor)init;
- (ZWEventProcessor)initWithHIDTapIdentifier:(id)a3 HIDEventTapPriority:(int)a4 systemEventTapIdentifier:(id)a5 systemEventTapPriority:(int)a6;
- (ZWEventProcessorDelegate)mainDisplayDelegate;
- (void)_adjustThreadPriority;
- (void)_sendCancelEventToAppDirectlyWithSenderID:(id)a3;
- (void)dealloc;
- (void)disableSleepTimer:(BOOL)a3;
- (void)dispatchEntireEventQueue;
- (void)dispatchEventToSystem:(id)a3;
- (void)resetEventQueue;
- (void)sendCancelEventToAppDirectlyWithSenderID:(unint64_t)a3;
- (void)setCurrentTouchOffset:(CGPoint)a3;
- (void)setExternalDisplayDelegates:(id)a3;
- (void)setHidPostThread:(id)a3;
- (void)setMainDisplayDelegate:(id)a3;
@end

@implementation ZWEventProcessor

+ (id)defaultEventProcessor
{
  if (defaultEventProcessor_onceToken != -1) {
    dispatch_once(&defaultEventProcessor_onceToken, &__block_literal_global_2);
  }
  return (id)defaultEventProcessor__eventProcessor;
}

void __41__ZWEventProcessor_defaultEventProcessor__block_invoke(id a1)
{
  id v1 = objc_alloc_init((Class)objc_opt_class(&OBJC_CLASS___ZWAppleTVEventProcessor));
  v2 = (void *)defaultEventProcessor__eventProcessor;
  defaultEventProcessor__eventProcessor = (uint64_t)v1;
}

- (ZWEventProcessor)initWithHIDTapIdentifier:(id)a3 HIDEventTapPriority:(int)a4 systemEventTapIdentifier:(id)a5 systemEventTapPriority:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v8 = *(void *)&a4;
  id v10 = a3;
  id v11 = a5;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___ZWEventProcessor;
  v12 = -[ZWEventProcessor initWithHIDTapIdentifier:HIDEventTapPriority:systemEventTapIdentifier:systemEventTapPriority:]( &v25,  "initWithHIDTapIdentifier:HIDEventTapPriority:systemEventTapIdentifier:systemEventTapPriority:",  v10,  v8,  v11,  v6);
  v13 = v12;
  if (v12)
  {
    -[ZWEventProcessor setHIDEventFilterMask:](v12, "setHIDEventFilterMask:", 256LL);
    v14 = objc_alloc_init(&OBJC_CLASS___SCRCThread);
    hidPostThread = v13->_hidPostThread;
    v13->_hidPostThread = v14;

    -[SCRCThread performSelector:onTarget:count:objects:]( v13->_hidPostThread,  "performSelector:onTarget:count:objects:",  "_adjustThreadPriority",  v13,  0LL,  0LL);
    -[ZWEventProcessor setShouldNotifyUserEventOccurred:](v13, "setShouldNotifyUserEventOccurred:", 1LL);
    objc_initWeak(&location, v13);
    v19 = _NSConcreteStackBlock;
    uint64_t v20 = 3221225472LL;
    v21 = __113__ZWEventProcessor_initWithHIDTapIdentifier_HIDEventTapPriority_systemEventTapIdentifier_systemEventTapPriority___block_invoke;
    v22 = &unk_6CE88;
    objc_copyWeak(&v23, &location);
    -[ZWEventProcessor setHIDEventHandler:](v13, "setHIDEventHandler:", &v19);
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[AXUIEventManager sharedEventManager]( &OBJC_CLASS___AXUIEventManager,  "sharedEventManager",  v19,  v20,  v21,  v22));
    [v16 registerEventHandler:v13];

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSPointerArray weakObjectsPointerArray](&OBJC_CLASS___NSPointerArray, "weakObjectsPointerArray"));
    -[ZWEventProcessor setExternalDisplayDelegates:](v13, "setExternalDisplayDelegates:", v17);

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

  return v13;
}

id __113__ZWEventProcessor_initWithHIDTapIdentifier_HIDEventTapPriority_systemEventTapIdentifier_systemEventTapPriority___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  if ((AXInPreboardScenario() & 1) != 0 || (AXInCheckerBoardScenario() & 1) != 0)
  {
    id v4 = 0LL;
  }

  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v4 = [WeakRetained _handleEvent:v3];
  }

  return v4;
}

- (void)dealloc
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXUIEventManager sharedEventManager](&OBJC_CLASS___AXUIEventManager, "sharedEventManager"));
  [v3 unregisterEventHandler:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___ZWEventProcessor;
  -[ZWEventProcessor dealloc](&v4, "dealloc");
}

- (void)_adjustThreadPriority
{
}

- (ZWEventProcessor)init
{
  return -[ZWEventProcessor initWithHIDTapIdentifier:HIDEventTapPriority:systemEventTapIdentifier:systemEventTapPriority:]( self,  "initWithHIDTapIdentifier:HIDEventTapPriority:systemEventTapIdentifier:systemEventTapPriority:",  ZWHIDEventTapIdentifier,  29LL,  0LL,  0LL);
}

- (BOOL)_handleEvent:(id)a3
{
  return 0;
}

- (CGPoint)offsetForAutopanner:(id)a3
{
  double x = CGPointZero.x;
  double y = CGPointZero.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (BOOL)offsetValuesAreNormalizedForAutopanner:(id)a3
{
  return 1;
}

- (void)dispatchEventToSystem:(id)a3
{
  char v3 = 1;
  _AXLogWithFacility( 0LL,  0LL,  1LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0.0,  v3,  @"NO-OP. Should've been handled in a sublcass");
}

- (void)dispatchEntireEventQueue
{
  char v2 = 1;
  _AXLogWithFacility( 0LL,  0LL,  1LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0.0,  v2,  @"NO-OP. Should've been handled in a sublcass");
}

- (void)resetEventQueue
{
  char v2 = 1;
  _AXLogWithFacility( 0LL,  0LL,  1LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0.0,  v2,  @"NO-OP. Should've been handled in a sublcass");
}

- (void)disableSleepTimer:(BOOL)a3
{
  char v3 = 1;
  _AXLogWithFacility( 0LL,  0LL,  1LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0.0,  v3,  @"NO-OP. Should've been handled in a sublcass");
}

- (void)_sendCancelEventToAppDirectlyWithSenderID:(id)a3
{
  double y = CGPointZero.y;
  id v4 = a3;
  id v14 = (id)objc_claimAutoreleasedReturnValue( +[AXEventRepresentation touchRepresentationWithHandType:location:]( &OBJC_CLASS___AXEventRepresentation,  "touchRepresentationWithHandType:location:",  8LL,  CGPointZero.x,  y));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[AXBackBoardServer server](&OBJC_CLASS___AXBackBoardServer, "server"));
  id v11 = objc_msgSend(v10, "contextIdForPosition:", v7 * 0.5, v9 * 0.5);

  [v14 setContextId:v11];
  id v12 = [v4 unsignedLongLongValue];

  [v14 setSenderID:v12];
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[AXBackBoardServer server](&OBJC_CLASS___AXBackBoardServer, "server"));
  [v13 postEvent:v14 afterNamedTap:@"__NOTHING__" includeTaps:&off_6F360];
}

- (void)sendCancelEventToAppDirectlyWithSenderID:(unint64_t)a3
{
  hidPostThread = self->_hidPostThread;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  -[SCRCThread performSelector:onTarget:count:objects:]( hidPostThread,  "performSelector:onTarget:count:objects:",  "_sendCancelEventToAppDirectlyWithSenderID:",  self,  1LL,  v5);
}

- (ZWEventProcessorDelegate)mainDisplayDelegate
{
  return (ZWEventProcessorDelegate *)objc_loadWeakRetained((id *)&self->_mainDisplayDelegate);
}

- (void)setMainDisplayDelegate:(id)a3
{
}

- (NSPointerArray)externalDisplayDelegates
{
  return self->_externalDisplayDelegates;
}

- (void)setExternalDisplayDelegates:(id)a3
{
}

- (ZOTFullscreenEventHandler)fullscreenEventHandler
{
  return self->_fullscreenEventHandler;
}

- (CGPoint)currentTouchOffset
{
  double x = self->_currentTouchOffset.x;
  double y = self->_currentTouchOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setCurrentTouchOffset:(CGPoint)a3
{
  self->_currentTouchOffset = a3;
}

- (SCRCThread)hidPostThread
{
  return self->_hidPostThread;
}

- (void)setHidPostThread:(id)a3
{
}

- (void).cxx_destruct
{
}

@end