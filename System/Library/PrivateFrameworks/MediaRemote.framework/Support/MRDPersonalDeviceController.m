@interface MRDPersonalDeviceController
- (BOOL)personalDeviceWasRecentlyAttached;
- (MRDPersonalDeviceController)init;
- (MRDPersonalDeviceControllerDelegate)delegate;
- (MRPersistentTimer)overrideTimer;
- (NSSet)currentPersonalDeviceUIDs;
- (OS_dispatch_queue)delegateQueue;
- (OS_dispatch_queue)queue;
- (void)_handlePersonalDeviceChangeNotification:(id)a3;
- (void)_onQueue_beginTimerWithInterval:(double)a3;
- (void)_onQueue_recalculateStateForReason:(id)a3;
- (void)_onQueue_restoreState;
- (void)setCurrentPersonalDeviceUIDs:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegateQueue:(id)a3;
- (void)setOverrideTimer:(id)a3;
- (void)setPersonalDeviceWasRecentlyAttached:(BOOL)a3;
- (void)setQueue:(id)a3;
@end

@implementation MRDPersonalDeviceController

- (MRDPersonalDeviceController)init
{
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___MRDPersonalDeviceController;
  v2 = -[MRDPersonalDeviceController init](&v19, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.mediaremote.MRDPersonalDeviceController", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    dispatch_queue_attr_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v7);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.mediaremote.MRDPersonalDeviceController.delegateQueue", v8);
    delegateQueue = v2->_delegateQueue;
    v2->_delegateQueue = (OS_dispatch_queue *)v9;

    v11 = objc_opt_new(&OBJC_CLASS___NSSet);
    currentPersonalDeviceUIDs = v2->_currentPersonalDeviceUIDs;
    v2->_currentPersonalDeviceUIDs = v11;

    v2->_personalDeviceWasRecentlyAttached = 0;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v13 addObserver:v2 selector:"_handlePersonalDeviceChangeNotification:" name:MRAVOutputContextDidAddPersonalDeviceNotification object:0];

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v14 addObserver:v2 selector:"_handlePersonalDeviceChangeNotification:" name:MRAVOutputContextDidRemovePersonalDeviceNotification object:0];

    v15 = (dispatch_queue_s *)v2->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100060DD4;
    block[3] = &unk_100399250;
    v18 = v2;
    dispatch_async(v15, block);
  }

  return v2;
}

- (void)_handlePersonalDeviceChangeNotification:(id)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100060E34;
  block[3] = &unk_100399250;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)_onQueue_restoreState
{
  dispatch_queue_attr_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDPersonalDeviceController queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue( +[MRAVOutputContext sharedAudioPresentationContext]( &OBJC_CLASS___MRAVOutputContext,  "sharedAudioPresentationContext"));
  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 personalDeviceUIDs]);

  if (![v5 count]) {
    goto LABEL_9;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  dispatch_queue_attr_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 personalDeviceState]);

  v8 = (void *)objc_claimAutoreleasedReturnValue( [v7 objectForKeyedSubscript:@"kMRDPersonalDeviceControllerPersonalDeviceStateDateKey"]);
  dispatch_queue_t v9 = (void *)objc_claimAutoreleasedReturnValue( [v7 objectForKeyedSubscript:@"kMRDPersonalDeviceControllerPersonalDeviceStateDevicesKey"]);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  [v10 personalDeviceLockScreenTimeout];
  double v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v13 timeIntervalSinceDate:v8];
  double v15 = v12 - v14;

  if (v15 <= 0.0
    || ![v9 count]
    || (v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v9)),
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v5)),
        unsigned int v18 = [v16 isEqualToSet:v17],
        v17,
        v16,
        !v18))
  {

LABEL_9:
    -[MRDPersonalDeviceController _onQueue_recalculateStateForReason:]( self,  "_onQueue_recalculateStateForReason:",  @"Initial load with no persisted state.");
    goto LABEL_10;
  }

  uint64_t v20 = _MRLogForCategory(0LL, v19);
  v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 138412546;
    v24 = v9;
    __int16 v25 = 2048;
    double v26 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "[MRDPersonalDeviceController] Restoring personal device state for devices %@. Remaining time %f.",  (uint8_t *)&v23,  0x16u);
  }

  -[MRDPersonalDeviceController setPersonalDeviceWasRecentlyAttached:]( self,  "setPersonalDeviceWasRecentlyAttached:",  1LL);
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v5));
  -[MRDPersonalDeviceController setCurrentPersonalDeviceUIDs:](self, "setCurrentPersonalDeviceUIDs:", v22);

  -[MRDPersonalDeviceController _onQueue_beginTimerWithInterval:](self, "_onQueue_beginTimerWithInterval:", v15);
LABEL_10:
}

- (void)_onQueue_recalculateStateForReason:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDPersonalDeviceController queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  uint64_t v7 = _MRLogForCategory(0LL, v6);
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v45 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[MRDPersonalDeviceController] Recalculating state for reason: %@",  buf,  0xCu);
  }

  dispatch_queue_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[MRAVOutputContext sharedAudioPresentationContext]( &OBJC_CLASS___MRAVOutputContext,  "sharedAudioPresentationContext"));
  uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 personalDeviceUIDs]);
  double v11 = (void *)v10;
  double v12 = &__NSArray0__struct;
  if (v10) {
    double v12 = (void *)v10;
  }
  id v13 = v12;

  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  id v14 = v13;
  id v15 = [v14 countByEnumeratingWithState:&v37 objects:v43 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v38;
    while (2)
    {
      for (i = 0LL; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v38 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void **)(*((void *)&v37 + 1) + 8LL * (void)i);
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[MRDPersonalDeviceController currentPersonalDeviceUIDs](self, "currentPersonalDeviceUIDs"));
        unsigned __int8 v21 = [v20 containsObject:v19];

        if ((v21 & 1) == 0)
        {
          uint64_t v23 = _MRLogForCategory(0LL, v22);
          v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v45 = v19;
            _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "[MRDPersonalDeviceController] New personal device %@ recently attached.",  buf,  0xCu);
          }

          -[MRDPersonalDeviceController setPersonalDeviceWasRecentlyAttached:]( self,  "setPersonalDeviceWasRecentlyAttached:",  1LL);
          __int16 v25 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
          [v25 personalDeviceLockScreenTimeout];
          -[MRDPersonalDeviceController _onQueue_beginTimerWithInterval:](self, "_onQueue_beginTimerWithInterval:");

          goto LABEL_17;
        }
      }

      id v16 = [v14 countByEnumeratingWithState:&v37 objects:v43 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }

- (void)_onQueue_beginTimerWithInterval:(double)a3
{
  dispatch_queue_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDPersonalDeviceController queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  objc_initWeak(&location, self);
  uint64_t v6 = objc_alloc(&OBJC_CLASS___MRPersistentTimer);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MRDPersonalDeviceController queue](self, "queue"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000615D8;
  v9[3] = &unk_10039B590;
  objc_copyWeak(&v10, &location);
  v9[4] = self;
  v8 = -[MRPersistentTimer initWithInterval:name:queue:block:]( v6,  "initWithInterval:name:queue:block:",  @"com.apple.mediaremote.mrdpersonaldevicecontroller.overridetimer",  v7,  v9,  a3);
  -[MRDPersonalDeviceController setOverrideTimer:](self, "setOverrideTimer:", v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (BOOL)personalDeviceWasRecentlyAttached
{
  return self->_personalDeviceWasRecentlyAttached;
}

- (void)setPersonalDeviceWasRecentlyAttached:(BOOL)a3
{
  self->_personalDeviceWasRecentlyAttached = a3;
}

- (MRDPersonalDeviceControllerDelegate)delegate
{
  return (MRDPersonalDeviceControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
}

- (NSSet)currentPersonalDeviceUIDs
{
  return self->_currentPersonalDeviceUIDs;
}

- (void)setCurrentPersonalDeviceUIDs:(id)a3
{
}

- (MRPersistentTimer)overrideTimer
{
  return self->_overrideTimer;
}

- (void)setOverrideTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end