@interface DistributedNotificationCenter
+ (id)defaultCenter;
+ (void)observeXPCServer:(id)a3;
+ (void)registerObserverWithMessage:(id)a3 connection:(id)a4;
+ (void)unregisterObserverWithMessage:(id)a3 connection:(id)a4;
- (DistributedNotificationCenter)init;
- (void)_addObserverWithPortName:(id)a3 notificationName:(id)a4;
- (void)_handleMessage:(id)a3 connection:(id)a4 usingBlock:(id)a5;
- (void)_removeObserverWithPortName:(id)a3 notificationName:(id)a4;
- (void)_saveRegisteredPortNames;
- (void)dealloc;
- (void)postNotificationName:(__CFString *)a3;
@end

@implementation DistributedNotificationCenter

- (DistributedNotificationCenter)init
{
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___DistributedNotificationCenter;
  v14 = -[DistributedNotificationCenter init](&v19, "init");
  if (v14)
  {
    v14->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create( "com.apple.itunesstored.DistributedNotificationCenter",  0LL);
    v14->_observers = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v2 = (void *)CFPreferencesCopyAppValue(@"DistributedNotificationObservers", kSSUserDefaultsIdentifier);
    uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0)
    {
      __int128 v17 = 0u;
      __int128 v18 = 0u;
      __int128 v15 = 0u;
      __int128 v16 = 0u;
      id v4 = [v2 countByEnumeratingWithState:&v15 objects:v20 count:16];
      if (v4)
      {
        id v5 = v4;
        uint64_t v6 = *(void *)v16;
        do
        {
          for (i = 0LL; i != v5; i = (char *)i + 1)
          {
            if (*(void *)v16 != v6) {
              objc_enumerationMutation(v2);
            }
            uint64_t v8 = *(void *)(*((void *)&v15 + 1) + 8LL * (void)i);
            id v9 = [v2 objectForKey:v8];
            uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSString);
            if ((objc_opt_isKindOfClass(v8, v10) & 1) != 0)
            {
              uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSArray);
              if ((objc_opt_isKindOfClass(v9, v11) & 1) != 0)
              {
                if ([v9 count])
                {
                  v12 = -[DistributedNotificationObserver initWithServiceName:]( objc_alloc(&OBJC_CLASS___DistributedNotificationObserver),  "initWithServiceName:",  v8);
                  -[DistributedNotificationObserver addObservedNotificationNames:]( v12,  "addObservedNotificationNames:",  v9);
                  if (v12)
                  {
                    -[NSMutableDictionary setObject:forKey:](v14->_observers, "setObject:forKey:", v12, v8);
                  }
                }
              }
            }
          }

          id v5 = [v2 countByEnumeratingWithState:&v15 objects:v20 count:16];
        }

        while (v5);
      }
    }
  }

  return v14;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___DistributedNotificationCenter;
  -[DistributedNotificationCenter dealloc](&v3, "dealloc");
}

+ (id)defaultCenter
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F2420;
  block[3] = &unk_10034AE98;
  block[4] = a1;
  if (qword_1003A3400 != -1) {
    dispatch_once(&qword_1003A3400, block);
  }
  return (id)qword_1003A33F8;
}

- (void)postNotificationName:(__CFString *)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000F24BC;
  v6[3] = &unk_10034B300;
  v6[4] = self;
  v6[5] = a3;
  dispatch_sync(dispatchQueue, v6);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, a3, 0LL, 0LL, 1u);
}

+ (void)observeXPCServer:(id)a3
{
}

+ (void)registerObserverWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000F26D0;
  v4[3] = &unk_10034AE70;
  v4[4] = a3;
  objc_msgSend( +[DistributedNotificationCenter defaultCenter](DistributedNotificationCenter, "defaultCenter"),  "_handleMessage:connection:usingBlock:",  a3,  a4,  v4);
}

+ (void)unregisterObserverWithMessage:(id)a3 connection:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000F293C;
  v4[3] = &unk_10034AF00;
  v4[4] = a3;
  void v4[5] = a1;
  objc_msgSend( +[DistributedNotificationCenter defaultCenter](DistributedNotificationCenter, "defaultCenter"),  "_handleMessage:connection:usingBlock:",  a3,  a4,  v4);
}

- (void)_addObserverWithPortName:(id)a3 notificationName:(id)a4
{
  v7 = (DistributedNotificationObserver *)-[NSMutableDictionary objectForKey:](self->_observers, "objectForKey:");
  if (!v7)
  {
    uint64_t v8 = -[DistributedNotificationObserver initWithServiceName:]( objc_alloc(&OBJC_CLASS___DistributedNotificationObserver),  "initWithServiceName:",  a3);
    -[NSMutableDictionary setObject:forKey:](self->_observers, "setObject:forKey:", v8, a3);
    v7 = v8;
  }

  id v9 = v7;
  -[DistributedNotificationObserver addObservedNotificationName:](v7, "addObservedNotificationName:", a4);
  -[DistributedNotificationCenter _saveRegisteredPortNames](self, "_saveRegisteredPortNames");
}

- (void)_handleMessage:(id)a3 connection:(id)a4 usingBlock:(id)a5
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F2C4C;
  block[3] = &unk_10034AF28;
  void block[5] = a4;
  block[6] = a5;
  block[4] = a3;
  dispatch_async(dispatchQueue, block);
}

- (void)_removeObserverWithPortName:(id)a3 notificationName:(id)a4
{
  id v7 = -[NSMutableDictionary objectForKey:](self->_observers, "objectForKey:");
  if (v7)
  {
    uint64_t v8 = v7;
    [v7 removeObservedNotificationName:a4];
    if (!objc_msgSend(objc_msgSend(v8, "observedNotificationNames"), "count")) {
      -[NSMutableDictionary removeObjectForKey:](self->_observers, "removeObjectForKey:", a3);
    }
    -[DistributedNotificationCenter _saveRegisteredPortNames](self, "_saveRegisteredPortNames");
  }

- (void)_saveRegisteredPortNames
{
  objc_super v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  observers = self->_observers;
  id v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( observers,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(observers);
        }
        -[NSMutableDictionary setObject:forKey:]( v3,  "setObject:forKey:",  objc_msgSend( -[NSMutableDictionary objectForKey:]( self->_observers,  "objectForKey:",  *(void *)(*((void *)&v10 + 1) + 8 * (void)i)),  "observedNotificationNames"),  *(void *)(*((void *)&v10 + 1) + 8 * (void)i));
      }

      id v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( observers,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v6);
  }

  id v9 = (const __CFString *)kSSUserDefaultsIdentifier;
  CFPreferencesSetAppValue(@"DistributedNotificationObservers", v3, kSSUserDefaultsIdentifier);
  CFPreferencesAppSynchronize(v9);
}

@end