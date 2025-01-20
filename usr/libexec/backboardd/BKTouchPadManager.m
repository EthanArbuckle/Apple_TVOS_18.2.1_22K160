@interface BKTouchPadManager
+ (id)sharedInstance;
- (BKTouchPadManager)init;
- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5;
- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 display:(id)a5 dispatcher:(id)a6;
- (void)_queue_handleEvent:(__IOHIDEvent *)a3 fromTouchPad:(id)a4 dispatcher:(id)a5;
- (void)_queue_sendCancelEventForTouchPad:(id)a3;
- (void)_queue_sendEvent:(__IOHIDEvent *)a3 fromTouchPad:(id)a4 toDestination:(id)a5 dispatcher:(id)a6;
- (void)_queue_touchPadRemoved:(id)a3;
- (void)_queue_touchPadsDetected:(id)a3;
- (void)dealloc;
- (void)matcher:(id)a3 servicesDidMatch:(id)a4;
- (void)sendCancelEventForAllDisplays;
- (void)sendCancelEventForDisplay:(id)a3;
- (void)serviceDidDisappear:(id)a3;
@end

@implementation BKTouchPadManager

- (BKTouchPadManager)init
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___BKTouchPadManager;
  v2 = -[BKTouchPadManager init](&v15, "init");
  if (v2)
  {
    uint64_t Serial = BSDispatchQueueCreateSerial(@"BKTouchPadQueue");
    touchPadQueue = v2->_touchPadQueue;
    v2->_touchPadQueue = (OS_dispatch_queue *)Serial;

    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    queue_currentTouchPads = v2->_queue_currentTouchPads;
    v2->_queue_currentTouchPads = v5;

    v19[0] = @"DeviceUsagePage";
    v19[1] = @"DeviceUsage";
    v20[0] = &off_1000C03F0;
    v20[1] = &off_1000C0408;
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v20,  v19,  2LL));
    v16 = v7;
    v17 = @"DeviceUsagePairs";
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v16, 1LL));
    v18 = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v18,  &v17,  1LL));

    v10 = objc_alloc(&OBJC_CLASS___BKIOHIDServiceMatcher);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[BKHIDSystemInterface sharedInstance](&OBJC_CLASS___BKHIDSystemInterface, "sharedInstance"));
    v12 = -[BKIOHIDServiceMatcher initWithMatchingDictionary:dataProvider:]( v10,  "initWithMatchingDictionary:dataProvider:",  v9,  v11);
    touchPadMatcher = v2->_touchPadMatcher;
    v2->_touchPadMatcher = v12;

    -[BKIOHIDServiceMatcher startObserving:queue:]( v2->_touchPadMatcher,  "startObserving:queue:",  v2,  v2->_touchPadQueue);
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___BKTouchPadManager;
  -[BKTouchPadManager dealloc](&v3, "dealloc");
}

- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5
{
  return -[BKTouchPadManager processEvent:sender:display:dispatcher:]( self,  "processEvent:sender:display:dispatcher:",  a3,  a4,  0LL,  a5);
}

- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 display:(id)a5 dispatcher:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = *a3;
  touchPadQueue = (dispatch_queue_s *)self->_touchPadQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000E5C8;
  block[3] = &unk_1000B5A88;
  block[4] = self;
  id v20 = v10;
  id v22 = v12;
  v23 = v13;
  id v21 = v11;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  dispatch_sync(touchPadQueue, block);

  return 1LL;
}

- (void)sendCancelEventForDisplay:(id)a3
{
  id v4 = a3;
  touchPadQueue = (dispatch_queue_s *)self->_touchPadQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000E4D8;
  v7[3] = &unk_1000B8030;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(touchPadQueue, v7);
}

- (void)sendCancelEventForAllDisplays
{
  touchPadQueue = (dispatch_queue_s *)self->_touchPadQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000E478;
  block[3] = &unk_1000B8058;
  block[4] = self;
  dispatch_async(touchPadQueue, block);
}

- (void)serviceDidDisappear:(id)a3
{
  touchPadQueue = (dispatch_queue_s *)self->_touchPadQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(touchPadQueue);
  -[BKTouchPadManager _queue_touchPadRemoved:](self, "_queue_touchPadRemoved:", v5);
}

- (void)_queue_touchPadRemoved:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [a3 senderID]));
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_queue_currentTouchPads, "objectForKey:", v4));
  v7 = (void *)v5;
  if (v5)
  {
    uint64_t v8 = BKLogTouchEvents(v5, v6);
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543362;
      id v11 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "TouchPad was removed: %{public}@",  (uint8_t *)&v10,  0xCu);
    }

    -[BKTouchPadManager _queue_sendCancelEventForTouchPad:](self, "_queue_sendCancelEventForTouchPad:", v7);
    -[NSMutableDictionary removeObjectForKey:](self->_queue_currentTouchPads, "removeObjectForKey:", v4);
    if (!-[NSMutableDictionary count](self->_queue_currentTouchPads, "count")) {
      BKSHIDServicesSetTouchPadAvailability();
    }
  }
}

- (void)matcher:(id)a3 servicesDidMatch:(id)a4
{
  id v11 = a4;
  touchPadQueue = (dispatch_queue_s *)self->_touchPadQueue;
  v7 = (BKIOHIDServiceMatcher *)a3;
  dispatch_assert_queue_V2(touchPadQueue);
  touchPadMatcher = self->_touchPadMatcher;

  if (touchPadMatcher == v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[BKHIDSystemInterface sharedInstance](&OBJC_CLASS___BKHIDSystemInterface, "sharedInstance"));
    int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 senderCache]);
    [v10 addSenderInfo:v11];

    -[BKTouchPadManager _queue_touchPadsDetected:](self, "_queue_touchPadsDetected:", v11);
  }
}

- (void)_queue_touchPadsDetected:(id)a3
{
  id v6 = a3;
  if ([v6 count])
  {
    id v4 = -[NSMutableDictionary count](self->_queue_currentTouchPads, "count");
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10000E350;
    v7[3] = &unk_1000B5B00;
    v7[4] = self;
    [v6 enumerateObjectsUsingBlock:v7];
    id v5 = -[NSMutableDictionary count](self->_queue_currentTouchPads, "count");
    if (!v4)
    {
      if (v5) {
        BKSHIDServicesSetTouchPadAvailability(1LL);
      }
    }
  }
}

- (void)_queue_sendEvent:(__IOHIDEvent *)a3 fromTouchPad:(id)a4 toDestination:(id)a5 dispatcher:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  if (byte_1000DC028)
  {
    if (a3)
    {
      uint64_t TimeStamp = IOHIDEventGetTimeStamp(a3);
      kdebug_trace(730464260LL, TimeStamp, 0LL, 0LL, 0LL);
      if (!byte_1000DC028) {
        goto LABEL_2;
      }
      uint64_t v25 = IOHIDEventGetTimeStamp(a3);
    }

    else
    {
      kdebug_trace(730464260LL, 0LL, 0LL, 0LL, 0LL);
      uint64_t v25 = 0LL;
      if (!byte_1000DC028) {
        goto LABEL_2;
      }
    }

    kdebug_trace(730464264LL, v25, 0LL, 0LL, 0LL);
  }

- (void)_queue_handleEvent:(__IOHIDEvent *)a3 fromTouchPad:(id)a4 dispatcher:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 currentDestinations]);
  if ((IOHIDEventGetIntegerValue(a3, 720903) & 0x80) != 0 && [v10 count])
  {
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    __int128 v49 = 0u;
    __int128 v50 = 0u;
    id v11 = v10;
    id v12 = [v11 countByEnumeratingWithState:&v49 objects:v62 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v50;
      do
      {
        for (i = 0LL; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v50 != v14) {
            objc_enumerationMutation(v11);
          }
          -[BKTouchPadManager _queue_sendEvent:fromTouchPad:toDestination:dispatcher:]( self,  "_queue_sendEvent:fromTouchPad:toDestination:dispatcher:",  a3,  v8,  *(void *)(*((void *)&v49 + 1) + 8LL * (void)i),  v9);
        }

        id v13 = [v11 countByEnumeratingWithState:&v49 objects:v62 count:16];
      }

      while (v13);
    }

    [v8 resetForCancel];
  }

  else
  {
    Children = (const __CFArray *)IOHIDEventGetChildren(a3);
    if (Children)
    {
      id v17 = Children;
      CFIndex Count = CFArrayGetCount(Children);
      if (Count)
      {
        uint64_t v19 = Count;
        unsigned int v20 = [v8 pathIndexTouchingMask];
        LODWORD(v44) = [v8 pathIndexInRangeMask];
        v43 = v10;
        unsigned int v42 = v20;
        if (v19 < 1)
        {
          HIDWORD(v44) = v20;
        }

        else
        {
          CFIndex v21 = 0LL;
          HIDWORD(v44) = v20;
          do
          {
            ValueAtIndex = CFArrayGetValueAtIndex(v17, v21);
            if (IOHIDEventGetType(ValueAtIndex, v23) == 11)
            {
              char IntegerValue = IOHIDEventGetIntegerValue(ValueAtIndex, 720901LL);
              char v25 = IOHIDEventGetIntegerValue(ValueAtIndex, 720903LL);
              if ((v25 & 2) != 0)
              {
                uint64_t v26 = IOHIDEventGetIntegerValue(ValueAtIndex, 720905LL);
                int v27 = HIDWORD(v44) | (1LL << IntegerValue);
                if (!v26) {
                  int v27 = HIDWORD(v44) & ~(1LL << IntegerValue);
                }
                HIDWORD(v44) = v27;
              }

              if ((v25 & 1) != 0)
              {
                uint64_t v28 = IOHIDEventGetIntegerValue(ValueAtIndex, 720904LL);
                int v29 = v44 | (1LL << IntegerValue);
                if (!v28) {
                  int v29 = v44 & ~(1LL << IntegerValue);
                }
                LODWORD(v44) = v29;
              }
            }

            ++v21;
          }

          while (v19 != v21);
        }

        v30 = (void *)objc_claimAutoreleasedReturnValue([v8 senderInfo]);
        v31 = (void *)objc_claimAutoreleasedReturnValue([v30 displayUUID]);
        uint64_t v33 = BKLogTouchEvents(v31, v32);
        v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109888;
          int v55 = HIDWORD(v44);
          __int16 v56 = 1024;
          int v57 = v44;
          __int16 v58 = 1024;
          BOOL v59 = v42 != 0;
          __int16 v60 = 1024;
          BOOL v61 = v44 != 0;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEBUG,  "touches:%X ranges:%X then:%{BOOL}u now:%{BOOL}u",  buf,  0x1Au);
        }

        if (!v44 || v42)
        {
          id v36 = v43;
        }

        else
        {
          v35 = (void *)objc_claimAutoreleasedReturnValue([v8 overrideSenderDescriptor]);
          id v36 = (id)objc_claimAutoreleasedReturnValue([v9 destinationsForEvent:a3 fromSender:v30 overrideSenderDescriptor:v35]);

          [v8 setCurrentDestinations:v36];
          [v8 setEventDispatcher:v9];
        }

        [v8 setPathIndexInRangeMask:v44];
        [v8 setPathIndexTouchingMask:HIDWORD(v44)];
        if ([v36 count]) {
          _BKHIDNoteUserEventOccurredOnDisplay(v31);
        }
        __int128 v47 = 0u;
        __int128 v48 = 0u;
        __int128 v45 = 0u;
        __int128 v46 = 0u;
        id v37 = v36;
        id v38 = [v37 countByEnumeratingWithState:&v45 objects:v53 count:16];
        if (v38)
        {
          id v39 = v38;
          uint64_t v40 = *(void *)v46;
          do
          {
            for (j = 0LL; j != v39; j = (char *)j + 1)
            {
              if (*(void *)v46 != v40) {
                objc_enumerationMutation(v37);
              }
              -[BKTouchPadManager _queue_sendEvent:fromTouchPad:toDestination:dispatcher:]( self,  "_queue_sendEvent:fromTouchPad:toDestination:dispatcher:",  a3,  v8,  *(void *)(*((void *)&v45 + 1) + 8LL * (void)j),  v9);
            }

            id v39 = [v37 countByEnumeratingWithState:&v45 objects:v53 count:16];
          }

          while (v39);
        }

        id v10 = v43;
      }
    }
  }
}

- (void)_queue_sendCancelEventForTouchPad:(id)a3
{
  id v4 = a3;
  uint64_t v6 = BKLogTouchEvents(v4, v5);
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    id v25 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "touchpad: Cancel (%{public}@)", buf, 0xCu);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 currentDestinations]);
  if ([v8 count])
  {
    uint64_t v9 = mach_absolute_time();
    DigitizerEvent = (const void *)IOHIDEventCreateDigitizerEvent( 0LL,  v9,  3LL,  0LL,  0LL,  128LL,  0LL,  0LL,  0.0,  0.0,  0.0,  0.0,  0.0,  0LL);
    IOHIDEventSetIntegerValue(DigitizerEvent, 720921LL, 0LL);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 senderInfo]);
    IOHIDEventSetSenderID(DigitizerEvent, [v11 senderID]);

    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    id v12 = v8;
    id v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v20;
      do
      {
        id v16 = 0LL;
        do
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v19 + 1) + 8LL * (void)v16);
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v4 eventDispatcher]);
          -[BKTouchPadManager _queue_sendEvent:fromTouchPad:toDestination:dispatcher:]( self,  "_queue_sendEvent:fromTouchPad:toDestination:dispatcher:",  DigitizerEvent,  v4,  v17,  v18);

          id v16 = (char *)v16 + 1;
        }

        while (v14 != v16);
        id v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }

      while (v14);
    }

    CFRelease(DigitizerEvent);
  }

  [v4 resetForCancel];
}

- (void).cxx_destruct
{
}

+ (id)sharedInstance
{
  if (qword_1000DBEF8 != -1) {
    dispatch_once(&qword_1000DBEF8, &stru_1000B5A60);
  }
  return (id)qword_1000DBEF0;
}

@end