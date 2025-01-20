@interface XADAuditServer
+ (Class)deviceSettingsManagerClass;
- (AXUpdateElementVisualsCoalescer)_frontmostAppUpdateCoalescer;
- (BOOL)_handlingScreenChanged;
- (BOOL)updateRunningApplications;
- (NSMutableDictionary)runningApplications;
- (XADAuditServer)initWithTransport:(id)a3;
- (id)_currentMedusaApplications;
- (id)_deviceCaptureScreenshot;
- (id)deviceCaptureScreenshot;
- (id)deviceElement:(id)a3 performAction:(id)a4 withValue:(id)a5;
- (id)deviceElement:(id)a3 valueForAttribute:(id)a4;
- (id)deviceElement:(id)a3 valueForParameterizedAttribute:(id)a4 withObject:(id)a5;
- (id)deviceFetchElementAtNormalizedDeviceCoordinate:(id)a3;
- (id)deviceFetchResolvesElementsOnSimulator;
- (id)deviceFetchSpecialElement:(id)a3;
- (id)deviceInspectorCanNavWhileMonitoringEvents;
- (id)deviceInspectorSupportedEventTypes;
- (id)deviceRunningApplications;
- (int64_t)_screenChangeHandleAttempts;
- (void)_appStateChanged:(id)a3;
- (void)_checkFrontmostAppPidChanged;
- (void)_handleLayoutChangedNotification;
- (void)_handleScreenChangedNotification;
- (void)connectionInterrupted;
- (void)deviceDidGetTargeted;
- (void)deviceInspectorFocusOnElement:(id)a3;
- (void)deviceInspectorLockOnCurrentElement;
- (void)deviceInspectorMoveWithOptions:(id)a3;
- (void)deviceInspectorPreviewOnElement:(id)a3;
- (void)deviceInspectorSetMonitoredEventType:(id)a3;
- (void)deviceInspectorShowVisuals:(id)a3;
- (void)deviceSetAuditTargetPid:(id)a3;
- (void)didReceiveAccessibilityNotification:(int)a3;
- (void)eventManager:(id)a3 eventToHighlightElement:(id)a4;
- (void)eventManager:(id)a3 eventToHighlightPoint:(CGPoint)a4;
- (void)eventManager:(id)a3 notificationReceived:(int)a4 notification:(id)a5 traits:(id)a6 label:(id)a7 value:(id)a8 hint:(id)a9 identifier:(id)a10;
- (void)eventManager:(id)a3 stoppedSnarfingEvents:(BOOL)a4;
- (void)eventManager:(id)a3 systemFocusDidMoveToElement:(id)a4;
- (void)frontmostApplicationsDidChange;
- (void)highlightElement:(id)a3;
- (void)highlightElements:(id)a3;
- (void)inspectorManager:(id)a3 inspectorElementPropertiesChanged:(id)a4;
- (void)inspectorManager:(id)a3 inspectorFocusDidChange:(id)a4;
- (void)inspectorManager:(id)a3 inspectorMonitoredEventTypeChanged:(unint64_t)a4;
- (void)setApplicationStateNotificationsEnabled:(BOOL)a3;
- (void)setRunningApplications:(id)a3;
- (void)set_frontmostAppUpdateCoalescer:(id)a3;
- (void)set_handlingScreenChanged:(BOOL)a3;
- (void)set_screenChangeHandleAttempts:(int64_t)a3;
@end

@implementation XADAuditServer

+ (Class)deviceSettingsManagerClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___XADAuditDeviceSettingsManager, a2);
}

- (XADAuditServer)initWithTransport:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___XADAuditServer;
  v5 = -[XADAuditServer initWithTransport:](&v16, "initWithTransport:", v4);
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[XADEventManager sharedManager](&OBJC_CLASS___XADEventManager, "sharedManager"));
    [v6 setDelegate:v5];

    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    runningApplications = v5->_runningApplications;
    v5->_runningApplications = (NSMutableDictionary *)v7;

    v9 = objc_alloc_init(&OBJC_CLASS___AXUpdateElementVisualsCoalescer);
    frontmostAppUpdateCoalescer = v5->__frontmostAppUpdateCoalescer;
    v5->__frontmostAppUpdateCoalescer = v9;

    -[AXUpdateElementVisualsCoalescer setThreshold:](v5->__frontmostAppUpdateCoalescer, "setThreshold:", 0.2);
    objc_initWeak(&location, v5);
    v11 = v5->__frontmostAppUpdateCoalescer;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100008408;
    v13[3] = &unk_1000149B8;
    objc_copyWeak(&v14, &location);
    -[AXUpdateElementVisualsCoalescer setUpdateVisualsSequenceDidFinishHandler:]( v11,  "setUpdateVisualsSequenceDidFinishHandler:",  v13);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  return v5;
}

- (void)_appStateChanged:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
  uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:SBApplicationStateDisplayIDKey]);
  v6 = (void *)v5;
  if (v5) {
    uint64_t v7 = (__CFString *)v5;
  }
  else {
    uint64_t v7 = @"Unknown";
  }
  v8 = v7;

  v9 = v8;
  v44 = v8;
  uint64_t v10 = SBSCopyLocalizedApplicationNameForDisplayIdentifier(v8);
  v11 = (void *)v10;
  if (v10) {
    v12 = (__CFString *)v10;
  }
  else {
    v12 = @"Unknown";
  }
  v13 = v12;

  uint64_t v14 = SBApplicationStateProcessIDKey;
  v15 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:SBApplicationStateProcessIDKey]);
  uint64_t v16 = SBSCopyBundleInfoValueForKeyAndProcessID(@"CFBundleExecutable", [v15 intValue]);
  v17 = (void *)v16;
  if (v16) {
    v18 = (__CFString *)v16;
  }
  else {
    v18 = @"Unknown";
  }
  v45 = v18;

  v48[0] = @"name";
  uint64_t v19 = objc_claimAutoreleasedReturnValue([v3 name]);

  v46 = (void *)v19;
  if (v19) {
    v20 = (const __CFString *)v19;
  }
  else {
    v20 = @"Unknown";
  }
  v49[0] = v20;
  v48[1] = @"pid";
  uint64_t v21 = objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v14]);
  v22 = (void *)v21;
  if (v21) {
    v23 = (const __CFString *)v21;
  }
  else {
    v23 = @"Unknown";
  }
  v49[1] = v23;
  v48[2] = @"state";
  uint64_t v24 = SBApplicationStateKey;
  uint64_t v25 = objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:SBApplicationStateKey]);
  v26 = (void *)v25;
  if (v25) {
    v27 = (const __CFString *)v25;
  }
  else {
    v27 = @"Unknown";
  }
  v49[2] = v27;
  v48[3] = @"state_description";
  v43 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v24]);
  uint64_t Description = SBApplicationStateGetDescription([v43 intValue]);
  if (Description) {
    v29 = (const __CFString *)Description;
  }
  else {
    v29 = @"Unknown";
  }
  v49[3] = v29;
  v48[4] = @"elevated_state";
  uint64_t v30 = SBApplicationMostElevatedStateForProcessIDKey;
  uint64_t v31 = objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:SBApplicationMostElevatedStateForProcessIDKey]);
  v32 = (void *)v31;
  if (v31) {
    v33 = (const __CFString *)v31;
  }
  else {
    v33 = @"Unknown";
  }
  v49[4] = v33;
  v48[5] = @"elevated_state_description";
  v34 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v30]);
  uint64_t v35 = SBApplicationStateGetDescription([v34 intValue]);
  if (v35) {
    v36 = (const __CFString *)v35;
  }
  else {
    v36 = @"Unknown";
  }
  v49[5] = v36;
  v49[6] = v9;
  v48[6] = @"displayID";
  v48[7] = @"mach_absolute_time";
  v37 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  mach_absolute_time());
  v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
  v49[7] = v38;
  v48[8] = @"timestamp";
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v49[8] = v39;
  v49[9] = v13;
  v48[9] = @"appName";
  v48[10] = @"execName";
  v49[10] = v45;
  v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v49,  v48,  11LL));

  v41 = (void *)objc_claimAutoreleasedReturnValue( +[DTXMessage messageWithSelector:objectArguments:]( &OBJC_CLASS___DTXMessage,  "messageWithSelector:objectArguments:",  "hostAppStateChanged:",  v40,  0LL));
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[XADAuditServer connection](self, "connection"));
  [v42 sendControlAsync:v41 replyHandler:0];
}

- (void)setApplicationStateNotificationsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___XADAuditServer;
  if (-[XADAuditServer applicationStateNotificationsEnabled](&v8, "applicationStateNotificationsEnabled") != a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS___XADAuditServer;
    -[XADAuditServer setApplicationStateNotificationsEnabled:](&v7, "setApplicationStateNotificationsEnabled:", v3);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_100008870;
    v5[3] = &unk_100014AD8;
    BOOL v6 = v3;
    v5[4] = self;
    dispatch_async(&_dispatch_main_q, v5);
  }

- (id)deviceCaptureScreenshot
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000089B0;
  v6[3] = &unk_100014B00;
  id v3 = (id)objc_opt_new(&OBJC_CLASS___DTXRemoteInvocationReceipt);
  id v7 = v3;
  objc_super v8 = self;
  dispatch_async(&_dispatch_main_q, v6);
  id v4 = v3;

  return v4;
}

- (void)connectionInterrupted
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[XADEventManager sharedManager](&OBJC_CLASS___XADEventManager, "sharedManager"));
  [v3 connectionInterrupted];

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[XADInspectorManager sharedManager](&OBJC_CLASS___XADInspectorManager, "sharedManager"));
  [v4 connectionInterrupted];

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___XADAuditServer;
  -[XADAuditServer connectionInterrupted](&v5, "connectionInterrupted");
}

- (id)_deviceCaptureScreenshot
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[XADInspectorManager sharedManager](&OBJC_CLASS___XADInspectorManager, "sharedManager"));
  [v2 hideVisualsSynchronously];

  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXAuditPluginManager sharedManager](&OBJC_CLASS___AXAuditPluginManager, "sharedManager"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 platformPlugin]);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v4,  "screenshotInfoForTransportWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height));

  return v5;
}

- (void)highlightElement:(id)a3
{
  id v6 = (id)objc_claimAutoreleasedReturnValue([a3 axElement]);
  if (!v6 || (uint64_t v4 = objc_opt_class(&OBJC_CLASS___AXElement, v3), (objc_opt_isKindOfClass(v6, v4) & 1) != 0))
  {
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(+[XADDisplayManager sharedManager](&OBJC_CLASS___XADDisplayManager, "sharedManager"));
    [v5 setCursorStyle:4];
    [v5 setCursorFrameForElement:v6];
  }
}

- (void)highlightElements:(id)a3
{
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v3 = a3;
  id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * (void)i), "axElement", (void)v12));
        if (v9)
        {
          uint64_t v10 = objc_opt_class(&OBJC_CLASS___AXElement, v8);
          if ((objc_opt_isKindOfClass(v9, v10) & 1) == 0)
          {

            goto LABEL_12;
          }
        }

        v11 = (void *)objc_claimAutoreleasedReturnValue(+[XADDisplayManager sharedManager](&OBJC_CLASS___XADDisplayManager, "sharedManager"));
        [v11 setCursorStyle:4];
        [v11 setCursorFrameForElement:v9];
      }

      id v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

- (void)deviceInspectorFocusOnElement:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___XADAuditServer;
  -[XADAuditServer deviceInspectorFocusOnElement:](&v9, "deviceInspectorFocusOnElement:", v4);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100008D70;
  v6[3] = &unk_100014B00;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  dispatch_async(&_dispatch_main_q, v6);
}

- (void)deviceInspectorMoveWithOptions:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[AXAuditObjectTransportManager sharedManager]( &OBJC_CLASS___AXAuditObjectTransportManager,  "sharedManager"));
  id v6 = objc_msgSend( v4,  "objectForTransportDictionary:expectedClass:",  v3,  objc_opt_class(NSDictionary, v5));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:kAXAuditInspectorMoveDirectionKey]);
  id v9 = [v8 integerValue];

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:kAXAuditInspectorMoveIncludeContainersKey]);
  unsigned __int8 v11 = [v10 BOOLValue];

  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:kAXAuditInspectorMoveAllowNonAXKey]);
  unsigned __int8 v13 = [v12 BOOLValue];

  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(+[XADInspectorManager sharedManager](&OBJC_CLASS___XADInspectorManager, "sharedManager"));
  __int128 v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v14 dispatchQueue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100008F88;
  block[3] = &unk_100014B28;
  id v18 = v14;
  id v19 = v9;
  unsigned __int8 v20 = v11;
  unsigned __int8 v21 = v13;
  id v16 = v14;
  dispatch_async(v15, block);
}

- (void)deviceInspectorPreviewOnElement:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___XADAuditServer;
  -[XADAuditServer deviceInspectorPreviewOnElement:](&v9, "deviceInspectorPreviewOnElement:", v4);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10000903C;
  v6[3] = &unk_100014B00;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  dispatch_async(&_dispatch_main_q, v6);
}

- (void)deviceInspectorSetMonitoredEventType:(id)a3
{
  if (a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)&OBJC_CLASS___XADAuditServer;
    -[XADAuditServer deviceInspectorSetMonitoredEventType:](&v5, "deviceInspectorSetMonitoredEventType:");
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_100009164;
    v4[3] = &unk_100014B50;
    v4[4] = self;
    v4[5] = -[XADAuditServer monitoredEventType](self, "monitoredEventType");
    dispatch_async(&_dispatch_main_q, v4);
  }

- (void)deviceInspectorShowVisuals:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___XADAuditServer;
  -[XADAuditServer deviceInspectorShowVisuals:](&v13, "deviceInspectorShowVisuals:", v4);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(+[XADInspectorManager sharedManager](&OBJC_CLASS___XADInspectorManager, "sharedManager"));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 dispatchQueue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100009294;
  block[3] = &unk_100014B78;
  id v10 = v5;
  unsigned __int8 v11 = self;
  id v12 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);
}

- (void)deviceInspectorLockOnCurrentElement
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___XADAuditServer;
  -[XADAuditServer deviceInspectorLockOnCurrentElement](&v4, "deviceInspectorLockOnCurrentElement");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100009348;
  block[3] = &unk_100014890;
  void block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (id)deviceInspectorSupportedEventTypes
{
  return &off_100015990;
}

- (id)deviceInspectorCanNavWhileMonitoringEvents
{
  return &__kCFBooleanTrue;
}

- (void)inspectorManager:(id)a3 inspectorMonitoredEventTypeChanged:(unint64_t)a4
{
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4));
  id v7 = (id)objc_claimAutoreleasedReturnValue( +[DTXMessage messageWithSelector:objectArguments:]( &OBJC_CLASS___DTXMessage,  "messageWithSelector:objectArguments:",  "hostInspectorMonitoredEventTypeChanged:",  v5,  0LL));

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[XADAuditServer connection](self, "connection"));
  [v6 sendControlAsync:v7 replyHandler:0];
}

- (void)inspectorManager:(id)a3 inspectorElementPropertiesChanged:(id)a4
{
  id v5 = a4;
  id v10 = (id)objc_claimAutoreleasedReturnValue( +[AXAuditObjectTransportManager sharedManager]( &OBJC_CLASS___AXAuditObjectTransportManager,  "sharedManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v10 transportDictionaryForObject:v5]);

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[DTXMessage messageWithSelector:objectArguments:]( &OBJC_CLASS___DTXMessage,  "messageWithSelector:objectArguments:",  "hostInspectorCurrentElementPropertiesChanged:",  v6,  0LL));
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[DTXMessage messageWithSelector:objectArguments:]( &OBJC_CLASS___DTXMessage,  "messageWithSelector:objectArguments:",  "hostInspectorCurrentElementPropertiesChanged:",  v8,  0LL));
  }

  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[XADAuditServer connection](self, "connection"));
  [v9 sendControlAsync:v7 replyHandler:0];
}

- (void)inspectorManager:(id)a3 inspectorFocusDidChange:(id)a4
{
  id v5 = a4;
  id v10 = (id)objc_claimAutoreleasedReturnValue( +[AXAuditObjectTransportManager sharedManager]( &OBJC_CLASS___AXAuditObjectTransportManager,  "sharedManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v10 transportDictionaryForObject:v5]);

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[DTXMessage messageWithSelector:objectArguments:]( &OBJC_CLASS___DTXMessage,  "messageWithSelector:objectArguments:",  "hostInspectorCurrentElementChanged:",  v6,  0LL));
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[DTXMessage messageWithSelector:objectArguments:]( &OBJC_CLASS___DTXMessage,  "messageWithSelector:objectArguments:",  "hostInspectorCurrentElementChanged:",  v8,  0LL));
  }

  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[XADAuditServer connection](self, "connection"));
  [v9 sendControlAsync:v7 replyHandler:0];
}

- (id)deviceElement:(id)a3 performAction:(id)a4 withValue:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    objc_super v9 = (void *)objc_opt_new(&OBJC_CLASS___DTXRemoteInvocationReceipt);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[XADInspectorManager sharedManager](&OBJC_CLASS___XADInspectorManager, "sharedManager"));
    [v10 setDelegate:self];
    unsigned __int8 v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v10 dispatchQueue]);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_100009768;
    v17[3] = &unk_100014BA0;
    id v18 = v7;
    id v19 = v8;
    id v20 = v10;
    id v12 = v9;
    id v21 = v12;
    id v13 = v10;
    dispatch_async(v11, v17);

    __int128 v14 = v21;
    id v15 = v12;
  }

  else
  {
    id v15 = 0LL;
  }

  return v15;
}

- (id)deviceElement:(id)a3 valueForAttribute:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = (void *)objc_opt_new(&OBJC_CLASS___DTXRemoteInvocationReceipt);
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(+[XADInspectorManager sharedManager](&OBJC_CLASS___XADInspectorManager, "sharedManager"));
    [v9 setDelegate:self];
    id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v9 dispatchQueue]);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_1000099A0;
    v16[3] = &unk_100014BA0;
    id v17 = v6;
    id v18 = v7;
    id v19 = v9;
    id v11 = v8;
    id v20 = v11;
    id v12 = v9;
    dispatch_async(v10, v16);

    id v13 = v20;
    id v14 = v11;
  }

  else
  {
    id v14 = 0LL;
  }

  return v14;
}

- (id)deviceElement:(id)a3 valueForParameterizedAttribute:(id)a4 withObject:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9)
  {
    id v11 = (void *)objc_opt_new(&OBJC_CLASS___DTXRemoteInvocationReceipt);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[XADInspectorManager sharedManager](&OBJC_CLASS___XADInspectorManager, "sharedManager"));
    [v12 setDelegate:self];
    id v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v12 dispatchQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100009C64;
    block[3] = &unk_100014BF0;
    id v20 = v8;
    id v21 = v9;
    id v22 = v12;
    id v23 = v10;
    id v14 = v11;
    id v24 = v14;
    id v15 = v12;
    dispatch_async(v13, block);

    id v16 = v24;
    id v17 = v14;
  }

  else
  {
    id v17 = 0LL;
  }

  return v17;
}

- (void)eventManager:(id)a3 systemFocusDidMoveToElement:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[XADInspectorManager sharedManager](&OBJC_CLASS___XADInspectorManager, "sharedManager"));
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 dispatchQueue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100009EA0;
  block[3] = &unk_100014B78;
  id v11 = v6;
  id v12 = self;
  id v13 = v5;
  id v8 = v5;
  id v9 = v6;
  dispatch_async(v7, block);
}

- (id)deviceFetchSpecialElement:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_opt_new(&OBJC_CLASS___DTXRemoteInvocationReceipt);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[XADInspectorManager sharedManager](&OBJC_CLASS___XADInspectorManager, "sharedManager"));
  id v7 = [v4 integerValue];

  [v6 setDelegate:self];
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 dispatchQueue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100009FE0;
  block[3] = &unk_100014C18;
  id v15 = v6;
  id v17 = v7;
  id v9 = v5;
  id v16 = v9;
  id v10 = v6;
  dispatch_async(v8, block);

  id v11 = v16;
  id v12 = v9;

  return v12;
}

- (id)deviceFetchResolvesElementsOnSimulator
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[XADInspectorManager sharedManager](&OBJC_CLASS___XADInspectorManager, "sharedManager"));
  [v3 setDelegate:self];
  id v4 = (void *)objc_opt_new(&OBJC_CLASS___DTXRemoteInvocationReceipt);
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v3 dispatchQueue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000A120;
  block[3] = &unk_100014890;
  id v6 = v4;
  id v9 = v6;
  dispatch_async(v5, block);

  return v6;
}

- (id)deviceFetchElementAtNormalizedDeviceCoordinate:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[XADInspectorManager sharedManager](&OBJC_CLASS___XADInspectorManager, "sharedManager"));
  [v5 setDelegate:self];
  id v6 = (void *)objc_opt_new(&OBJC_CLASS___DTXRemoteInvocationReceipt);
  [v4 CGPointValue];
  uint64_t v8 = v7;
  uint64_t v10 = v9;

  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 dispatchQueue]);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10000A288;
  v17[3] = &unk_100014C40;
  id v18 = v5;
  uint64_t v20 = v8;
  uint64_t v21 = v10;
  id v12 = v6;
  id v19 = v12;
  id v13 = v5;
  dispatch_async(v11, v17);

  id v14 = v19;
  id v15 = v12;

  return v15;
}

- (void)deviceDidGetTargeted
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___XADAuditServer;
  -[XADAuditServer deviceDidGetTargeted](&v13, "deviceDidGetTargeted");
  -[XADAuditServer _checkFrontmostAppPidChanged](self, "_checkFrontmostAppPidChanged");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[XADInspectorManager sharedManager](&OBJC_CLASS___XADInspectorManager, "sharedManager"));
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v3 dispatchQueue]);
  uint64_t v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472LL;
  uint64_t v9 = sub_10000A3E8;
  uint64_t v10 = &unk_100014B00;
  id v11 = v3;
  id v12 = self;
  id v5 = v3;
  dispatch_async(v4, &v7);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[XADEventManager sharedManager](&OBJC_CLASS___XADEventManager, "sharedManager", v7, v8, v9, v10));
  [v6 deviceDidGetTargeted];
}

- (void)eventManager:(id)a3 stoppedSnarfingEvents:(BOOL)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[XADInspectorManager sharedManager](&OBJC_CLASS___XADInspectorManager, "sharedManager", a3, a4));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 dispatchQueue]);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10000A4B0;
  v8[3] = &unk_100014B00;
  id v9 = v5;
  uint64_t v10 = self;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (void)eventManager:(id)a3 eventToHighlightElement:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[XADInspectorManager sharedManager](&OBJC_CLASS___XADInspectorManager, "sharedManager"));
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 dispatchQueue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000A5A0;
  block[3] = &unk_100014B78;
  id v11 = v6;
  id v12 = self;
  id v13 = v5;
  id v8 = v5;
  id v9 = v6;
  dispatch_async(v7, block);
}

- (void)eventManager:(id)a3 eventToHighlightPoint:(CGPoint)a4
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[XADInspectorManager sharedManager](&OBJC_CLASS___XADInspectorManager, "sharedManager", a3));
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v7 dispatchQueue]);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10000A6B0;
  v10[3] = &unk_100014C40;
  id v11 = v7;
  id v12 = self;
  CGFloat v13 = x;
  CGFloat v14 = y;
  id v9 = v7;
  dispatch_async(v8, v10);
}

- (void)frontmostApplicationsDidChange
{
  id v4 = (id)objc_claimAutoreleasedReturnValue( +[DTXMessage messageWithSelector:objectArguments:]( &OBJC_CLASS___DTXMessage,  "messageWithSelector:objectArguments:",  "hostDeviceRunningApplicationsDidChange",  0LL));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[XADAuditServer connection](self, "connection"));
  [v3 sendControlAsync:v4 replyHandler:0];
}

- (BOOL)updateRunningApplications
{
  v2 = self;
  uint64_t v3 = AXAuditCurrentApplications(self, a2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[XADAuditServer runningApplications](v2, "runningApplications"));
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v47 objects:v53 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v48;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v48 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v47 + 1) + 8LL * (void)i);
        id v12 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", AXAuditPidForElement(v11));
        CGFloat v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        [v5 setObject:v11 forKey:v13];
      }

      id v8 = [v6 countByEnumeratingWithState:&v47 objects:v53 count:16];
    }

    while (v8);
  }

  id v14 = [v5 count];
  if (v14 == [v36 count])
  {
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    id obj = v5;
    id v34 = [obj countByEnumeratingWithState:&v43 objects:v52 count:16];
    if (v34)
    {
      uint64_t v35 = *(void *)v44;
      v32 = v5;
      v33 = v2;
      id v31 = v6;
      while (1)
      {
        uint64_t v15 = 0LL;
LABEL_12:
        if (*(void *)v44 != v35) {
          objc_enumerationMutation(obj);
        }
        uint64_t v37 = v15;
        id v16 = *(void **)(*((void *)&v43 + 1) + 8 * v15);
        __int128 v39 = 0u;
        __int128 v40 = 0u;
        __int128 v41 = 0u;
        __int128 v42 = 0u;
        id v17 = v36;
        id v18 = [v17 countByEnumeratingWithState:&v39 objects:v51 count:16];
        if (!v18) {
          break;
        }
        id v19 = v18;
        uint64_t v20 = *(void *)v40;
LABEL_16:
        uint64_t v21 = 0LL;
        while (1)
        {
          if (*(void *)v40 != v20) {
            objc_enumerationMutation(v17);
          }
          id v22 = *(void **)(*((void *)&v39 + 1) + 8 * v21);
          unsigned int v23 = objc_msgSend(v16, "intValue", v31, v32, v33);
          unsigned int v24 = [v22 intValue];
          uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([obj objectForKeyedSubscript:v16]);
          v26 = (void *)objc_claimAutoreleasedReturnValue([v25 label]);

          v27 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:v22]);
          v28 = (void *)objc_claimAutoreleasedReturnValue([v27 label]);

          if (v23 == v24)
          {
          }

          if (v19 == (id)++v21)
          {
            id v19 = [v17 countByEnumeratingWithState:&v39 objects:v51 count:16];
            if (v19) {
              goto LABEL_16;
            }
            goto LABEL_28;
          }
        }

        uint64_t v15 = v37 + 1;
        if ((id)(v37 + 1) != v34) {
          goto LABEL_12;
        }
        BOOL v29 = 0;
        id v5 = v32;
        v2 = v33;
        id v6 = v31;
        id v34 = [obj countByEnumeratingWithState:&v43 objects:v52 count:16];
        if (!v34) {
          goto LABEL_30;
        }
      }

- (id)deviceRunningApplications
{
  uint64_t v28 = 0LL;
  BOOL v29 = &v28;
  uint64_t v30 = 0x3032000000LL;
  id v31 = sub_10000AE18;
  v32 = sub_10000AE28;
  id v33 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[XADAuditServer _currentMedusaApplications](self, "_currentMedusaApplications"));
  id v4 = [v3 countByEnumeratingWithState:&v24 objects:v34 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v25;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v25 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)i);
        id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 bundleId]);
        unsigned __int8 v9 = [v8 isEqualToString:@"com.apple.springboard"];

        if ((v9 & 1) == 0)
        {
          uint64_t v10 = AXAuditPidForElement(v7);
          uint64_t v11 = (void *)objc_opt_new(&OBJC_CLASS___AXAuditApplication);
          [v11 setPid:v10];
          [v11 setPsnObj:0];
          uint64_t v12 = objc_claimAutoreleasedReturnValue([v7 bundleId]);
          [v11 setBundleIdentifier:v12];

          CGFloat v13 = (void *)objc_claimAutoreleasedReturnValue([v7 label]);
          [v11 setDisplayName:v13];

          id v14 = (void *)objc_claimAutoreleasedReturnValue([v11 bundleIdentifier]);
          LOBYTE(v12) = [v14 length] == 0;

          if ((v12 & 1) == 0)
          {
            uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v11 bundleIdentifier]);
            id v16 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage _applicationIconImageForBundleIdentifier:format:]( &OBJC_CLASS___UIImage,  "_applicationIconImageForBundleIdentifier:format:",  v15,  0LL));

            if (v16)
            {
              v35.width = 14.0;
              v35.height = 14.0;
              UIGraphicsBeginImageContextWithOptions(v35, 0, 0.0);
              objc_msgSend(v16, "drawInRect:", 0.0, 0.0, 14.0, 14.0);
              ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
              id v18 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
              UIGraphicsEndImageContext();
              [v11 setIcon:v18];
            }
          }

          [(id)v29[5] addObject:v11];
        }
      }

      id v4 = [v3 countByEnumeratingWithState:&v24 objects:v34 count:16];
    }

    while (v4);
  }

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_10000AE30;
  v21[3] = &unk_100014C68;
  unsigned int v23 = &v28;
  id v19 = (id)objc_opt_new(&OBJC_CLASS___DTXRemoteInvocationReceipt);
  id v22 = v19;
  dispatch_async(&_dispatch_main_q, v21);

  _Block_object_dispose(&v28, 8);
  return v19;
}

- (id)_currentMedusaApplications
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[XADAuditServer runningApplications](self, "runningApplications"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 allValues]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ax_filteredArrayUsingBlock:", &stru_100014CA8));

  return v4;
}

- (void)deviceSetAuditTargetPid:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___XADAuditServer;
  id v3 = a3;
  -[XADAuditServer deviceSetAuditTargetPid:](&v11, "deviceSetAuditTargetPid:", v3);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[XADInspectorManager sharedManager]( &OBJC_CLASS___XADInspectorManager,  "sharedManager",  v11.receiver,  v11.super_class));
  id v5 = [v3 integerValue];

  [v4 setTargetPid:v5];
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 frontmostAppForTargetPid]);
  id v7 = sub_10000B080(v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if (v8)
  {
    unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(+[XADEventManager sharedManager](&OBJC_CLASS___XADEventManager, "sharedManager"));
    unsigned __int8 v10 = [v9 snarfingEvents];

    if ((v10 & 1) == 0)
    {
    }
  }
}

- (void)_checkFrontmostAppPidChanged
{
  if (-[XADAuditServer updateRunningApplications](self, "updateRunningApplications")
    && (uint64_t)-[XADAuditServer hostAPIVersion](self, "hostAPIVersion") >= 4)
  {
    -[XADAuditServer frontmostApplicationsDidChange](self, "frontmostApplicationsDidChange");
  }

  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[XADAuditServer _currentMedusaApplications](self, "_currentMedusaApplications"));
  id v4 = [v3 count];

  if (v4 == (id)1)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[XADAuditServer _currentMedusaApplications](self, "_currentMedusaApplications"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 firstObject]);

    id v7 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", AXAuditPidForElement(v6));
    unsigned __int8 v10 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(v7);
  }

  else
  {
    unsigned __int8 v10 = &off_1000159A8;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[DTXMessage messageWithSelector:objectArguments:]( &OBJC_CLASS___DTXMessage,  "messageWithSelector:objectArguments:",  "hostDeviceFrontmostAppPidDidChange:",  v10,  0LL));
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(-[XADAuditServer connection](self, "connection"));
  [v9 sendControlAsync:v8 replyHandler:0];
}

- (void)_handleLayoutChangedNotification
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[XADAuditServer _frontmostAppUpdateCoalescer](self, "_frontmostAppUpdateCoalescer"));
  [v2 notifyUpdateElementVisualsEventDidOccur];

  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[XADInspectorManager sharedManager](&OBJC_CLASS___XADInspectorManager, "sharedManager"));
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v3 dispatchQueue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000B294;
  block[3] = &unk_100014890;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

- (void)_handleScreenChangedNotification
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[XADAuditServer _frontmostAppUpdateCoalescer](self, "_frontmostAppUpdateCoalescer"));
  [v3 notifyUpdateElementVisualsEventDidOccur];

  if (-[XADAuditServer _screenChangeHandleAttempts](self, "_screenChangeHandleAttempts") <= 9)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[XADInspectorManager sharedManager](&OBJC_CLASS___XADInspectorManager, "sharedManager"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 frontmostAppForTargetPid]);
    id v6 = sub_10000B080(v5);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    if (v7)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(+[XADEventManager sharedManager](&OBJC_CLASS___XADEventManager, "sharedManager"));
      unsigned __int8 v9 = [v8 snarfingEvents];

      if ((v9 & 1) == 0)
      {
      }

      -[XADAuditServer set_handlingScreenChanged:](self, "set_handlingScreenChanged:", 0LL);
    }

    else
    {
      dispatch_time_t v10 = dispatch_time(0LL, 100000000LL);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10000B3C8;
      block[3] = &unk_100014890;
      void block[4] = self;
      dispatch_after(v10, &_dispatch_main_q, block);
    }
  }

- (void)didReceiveAccessibilityNotification:(int)a3
{
  if (a3 == 1001)
  {
    -[XADAuditServer _handleLayoutChangedNotification](self, "_handleLayoutChangedNotification");
  }

  else if (a3 == 1000 && !-[XADAuditServer _handlingScreenChanged](self, "_handlingScreenChanged"))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[XADEventManager sharedManager](&OBJC_CLASS___XADEventManager, "sharedManager"));
    unsigned __int8 v5 = [v4 snarfingEvents];

    if ((v5 & 1) == 0)
    {
      -[XADAuditServer set_handlingScreenChanged:](self, "set_handlingScreenChanged:", 1LL);
      -[XADAuditServer set_screenChangeHandleAttempts:](self, "set_screenChangeHandleAttempts:", 0LL);
      dispatch_time_t v6 = dispatch_time(0LL, 100000000LL);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10000B4EC;
      block[3] = &unk_100014890;
      void block[4] = self;
      dispatch_after(v6, &_dispatch_main_q, block);
    }
  }

- (void)eventManager:(id)a3 notificationReceived:(int)a4 notification:(id)a5 traits:(id)a6 label:(id)a7 value:(id)a8 hint:(id)a9 identifier:(id)a10
{
  uint64_t v13 = *(void *)&a4;
  id v35 = a5;
  uint64_t v15 = (__CFString *)a6;
  id v16 = (__CFString *)a7;
  id v17 = (__CFString *)a8;
  id v18 = (__CFString *)a9;
  id v19 = (__CFString *)a10;
  -[XADAuditServer didReceiveAccessibilityNotification:](self, "didReceiveAccessibilityNotification:", v13);
  if ([v35 length])
  {
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[AXAuditObjectTransportManager sharedManager]( &OBJC_CLASS___AXAuditObjectTransportManager,  "sharedManager"));
    if ((uint64_t)-[XADAuditServer hostAPIVersion](self, "hostAPIVersion") < 6)
    {
      __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v20 transportDictionaryForObject:v35]);
    }

    else
    {
      uint64_t v21 = &stru_100015310;
      if (v15) {
        id v22 = v15;
      }
      else {
        id v22 = &stru_100015310;
      }
      if (v16) {
        unsigned int v23 = v16;
      }
      else {
        unsigned int v23 = &stru_100015310;
      }
      if (v17) {
        __int128 v24 = v17;
      }
      else {
        __int128 v24 = &stru_100015310;
      }
      if (v18) {
        __int128 v25 = v18;
      }
      else {
        __int128 v25 = &stru_100015310;
      }
      if (v19) {
        uint64_t v21 = v19;
      }
      __int128 v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v35,  kAXAuditNotificationDictKeyNotification,  v22,  kAXAuditNotificationDictKeyTraits,  v23,  kAXAuditNotificationDictKeyLabel,  v24,  kAXAuditNotificationDictKeyValue,  v25,  kAXAuditNotificationDictKeyHint,  v21,  kAXAuditNotificationDictKeyIdentifier,  0LL));
      __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v20 transportDictionaryForObject:v26]);
    }

    if (v27)
    {
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( +[DTXMessage messageWithSelector:objectArguments:]( &OBJC_CLASS___DTXMessage,  "messageWithSelector:objectArguments:",  "hostInspectorNotificationReceived:",  v27,  0LL));
    }

    else
    {
      id v34 = v17;
      BOOL v29 = v16;
      uint64_t v30 = v15;
      id v31 = v20;
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( +[DTXMessage messageWithSelector:objectArguments:]( &OBJC_CLASS___DTXMessage,  "messageWithSelector:objectArguments:",  "hostInspectorNotificationReceived:",  v32,  0LL));

      uint64_t v20 = v31;
      uint64_t v15 = v30;
      id v16 = v29;
      id v17 = v34;
    }

    id v33 = (void *)objc_claimAutoreleasedReturnValue(-[XADAuditServer connection](self, "connection"));
    [v33 sendControlAsync:v28 replyHandler:0];
  }
}

- (BOOL)_handlingScreenChanged
{
  return self->__handlingScreenChanged;
}

- (void)set_handlingScreenChanged:(BOOL)a3
{
  self->__handlingScreenChanged = a3;
}

- (int64_t)_screenChangeHandleAttempts
{
  return self->__screenChangeHandleAttempts;
}

- (void)set_screenChangeHandleAttempts:(int64_t)a3
{
  self->__screenChangeHandleAttempts = a3;
}

- (NSMutableDictionary)runningApplications
{
  return self->_runningApplications;
}

- (void)setRunningApplications:(id)a3
{
}

- (AXUpdateElementVisualsCoalescer)_frontmostAppUpdateCoalescer
{
  return self->__frontmostAppUpdateCoalescer;
}

- (void)set_frontmostAppUpdateCoalescer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end