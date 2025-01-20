@interface PDNotificationStreamManager
- (PDNotificationStreamManager)init;
- (id)_notificationNameKeyForStream:(int64_t)a3;
- (id)_notificationStreamNameForStream:(int64_t)a3;
- (void)_queue_startObservingNotification:(id)a3 forStream:(int64_t)a4;
- (void)_queue_stopObservingNotification:(id)a3 forStream:(int64_t)a4;
- (void)_queue_updateEventStreamRegistration;
- (void)_queue_updateEventStreamRegistrationForStream:(int64_t)a3;
- (void)_scheduleEventStreamRegistrationUpdateWhileInternalQueue:(BOOL)a3;
- (void)_unregisterConsumer:(id)a3;
- (void)_updateConsumers:(id)a3 requiresRegistration:(BOOL)a4;
- (void)recalculateNotificationNames;
- (void)receivedXPCEvent:(id)a3 forEventStream:(id)a4;
- (void)registerConsumer:(id)a3;
- (void)start;
- (void)unregisterConsumer:(id)a3;
@end

@implementation PDNotificationStreamManager

- (PDNotificationStreamManager)init
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___PDNotificationStreamManager;
  v2 = -[PDNotificationStreamManager init](&v16, "init");
  if (v2)
  {
    dispatch_group_t v3 = dispatch_group_create();
    group = v2->_group;
    v2->_group = (OS_dispatch_group *)v3;

    dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.passd.notificationmanager", v6);
    internalSerialQueue = v2->_internalSerialQueue;
    v2->_internalSerialQueue = (OS_dispatch_queue *)v7;

    v2->_consumerLock._os_unfair_lock_opaque = 0;
    uint64_t v9 = objc_claimAutoreleasedReturnValue( +[NSHashTable pk_weakObjectsHashTableUsingPointerPersonality]( &OBJC_CLASS___NSHashTable,  "pk_weakObjectsHashTableUsingPointerPersonality"));
    consumers = v2->_consumers;
    v2->_consumers = (NSHashTable *)v9;

    uint64_t v11 = objc_claimAutoreleasedReturnValue( +[NSMapTable pk_weakPointerPersonalityToStrongObjectsMapTable]( &OBJC_CLASS___NSMapTable,  "pk_weakPointerPersonalityToStrongObjectsMapTable"));
    consumerRegistrationState = v2->_consumerRegistrationState;
    v2->_consumerRegistrationState = (NSMapTable *)v11;

    v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    registeredNotificationNames = v2->_registeredNotificationNames;
    v2->_registeredNotificationNames = v13;

    PDXPCEventStreamPauseEventDelivery();
  }

  return v2;
}

- (void)registerConsumer:(id)a3
{
  if (a3)
  {
    id v6 = a3;
    id v4 = a3;
    dispatch_queue_attr_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v6, 1LL));

    -[PDNotificationStreamManager _updateConsumers:requiresRegistration:]( self,  "_updateConsumers:requiresRegistration:",  v5,  1LL,  v6);
    -[PDNotificationStreamManager _scheduleEventStreamRegistrationUpdateWhileInternalQueue:]( self,  "_scheduleEventStreamRegistrationUpdateWhileInternalQueue:",  0LL);
  }

- (void)unregisterConsumer:(id)a3
{
  if (a3)
  {
    -[PDNotificationStreamManager _unregisterConsumer:](self, "_unregisterConsumer:");
    -[PDNotificationStreamManager _scheduleEventStreamRegistrationUpdateWhileInternalQueue:]( self,  "_scheduleEventStreamRegistrationUpdateWhileInternalQueue:",  0LL);
  }

- (void)_updateConsumers:(id)a3 requiresRegistration:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([v6 count])
  {
    if (v4)
    {
      os_unfair_lock_lock(&self->_consumerLock);
      __int128 v25 = 0u;
      __int128 v26 = 0u;
      __int128 v23 = 0u;
      __int128 v24 = 0u;
      id v7 = v6;
      id v8 = [v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v24;
        do
        {
          for (i = 0LL; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v24 != v10) {
              objc_enumerationMutation(v7);
            }
            -[NSHashTable addObject:]( self->_consumers,  "addObject:",  *(void *)(*((void *)&v23 + 1) + 8LL * (void)i));
          }

          id v9 = [v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
        }

        while (v9);
      }

      os_unfair_lock_unlock(&self->_consumerLock);
    }

    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    id v12 = v6;
    id v13 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v20;
      do
      {
        for (j = 0LL; j != v14; j = (char *)j + 1)
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)j);
          id v18 = objc_msgSend(v17, "createCurrentNotificationRegistrationState", (void)v19);
          os_unfair_lock_lock(&self->_consumerLock);
          if (-[NSHashTable containsObject:](self->_consumers, "containsObject:", v17))
          {
            if (v18)
            {
              -[NSMapTable setObject:forKey:](self->_consumerRegistrationState, "setObject:forKey:", v18, v17);
            }

            else if (v17)
            {
              -[NSMapTable removeObjectForKey:](self->_consumerRegistrationState, "removeObjectForKey:", v17);
            }
          }

          os_unfair_lock_unlock(&self->_consumerLock);
        }

        id v14 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }

      while (v14);
    }
  }
}

- (void)_unregisterConsumer:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_consumerLock);
    -[NSMapTable removeObjectForKey:](self->_consumerRegistrationState, "removeObjectForKey:", v4);
    -[NSHashTable removeObject:](self->_consumers, "removeObject:", v4);
    os_unfair_lock_unlock(&self->_consumerLock);
  }
}

- (void)recalculateNotificationNames
{
  group = self->_group;
  internalSerialQueue = self->_internalSerialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10024D34C;
  block[3] = &unk_100639300;
  block[4] = self;
  dispatch_group_async((dispatch_group_t)group, (dispatch_queue_t)internalSerialQueue, block);
}

- (void)start
{
  group = self->_group;
  internalSerialQueue = self->_internalSerialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10024D414;
  block[3] = &unk_100639300;
  block[4] = self;
  dispatch_group_async((dispatch_group_t)group, (dispatch_queue_t)internalSerialQueue, block);
}

- (void)_scheduleEventStreamRegistrationUpdateWhileInternalQueue:(BOOL)a3
{
  p_needsRegistrationUpdate = &self->_needsRegistrationUpdate;
  if (a3)
  {
    atomic_store(0, (unsigned __int8 *)p_needsRegistrationUpdate);
    -[PDNotificationStreamManager _queue_updateEventStreamRegistration](self, "_queue_updateEventStreamRegistration");
  }

  else
  {
    while (!__ldaxr((unsigned __int8 *)p_needsRegistrationUpdate))
    {
      if (!__stlxr(1u, (unsigned __int8 *)p_needsRegistrationUpdate))
      {
        internalSerialQueue = self->_internalSerialQueue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_10024D518;
        block[3] = &unk_100639300;
        block[4] = self;
        dispatch_async((dispatch_queue_t)internalSerialQueue, block);
        return;
      }
    }

    __clrex();
  }

- (void)_queue_updateEventStreamRegistration
{
}

- (void)_queue_updateEventStreamRegistrationForStream:(int64_t)a3
{
  dispatch_queue_attr_t v5 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  os_unfair_lock_lock(&self->_consumerLock);
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectEnumerator](self->_consumerRegistrationState, "objectEnumerator"));
  id v7 = [v6 countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v34;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v34 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*((void *)&v33 + 1) + 8 * (void)v10) notificationNamesForStream:a3]);
        if (v11) {
          -[NSMutableSet unionSet:](v5, "unionSet:", v11);
        }

        uint64_t v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v33 objects:v39 count:16];
    }

    while (v8);
  }

  os_unfair_lock_unlock(&self->_consumerLock);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  id v13 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_registeredNotificationNames,  "objectForKeyedSubscript:",  v12));
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id v14 = v5;
  id v15 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v29,  v38,  16LL);
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v30;
    do
    {
      id v18 = 0LL;
      do
      {
        if (*(void *)v30 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v29 + 1) + 8LL * (void)v18);
        if (v13
          && [v13 containsObject:*(void *)(*((void *)&v29 + 1) + 8 * (void)v18)])
        {
          [v13 removeObject:v19];
        }

        else
        {
          -[PDNotificationStreamManager _queue_startObservingNotification:forStream:]( self,  "_queue_startObservingNotification:forStream:",  v19,  a3);
        }

        id v18 = (char *)v18 + 1;
      }

      while (v16 != v18);
      id v16 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v29,  v38,  16LL);
    }

    while (v16);
  }

  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v20 = v13;
  id v21 = [v20 countByEnumeratingWithState:&v25 objects:v37 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v26;
    do
    {
      __int128 v24 = 0LL;
      do
      {
        if (*(void *)v26 != v23) {
          objc_enumerationMutation(v20);
        }
        -[PDNotificationStreamManager _queue_stopObservingNotification:forStream:]( self,  "_queue_stopObservingNotification:forStream:",  *(void *)(*((void *)&v25 + 1) + 8LL * (void)v24),  a3,  (void)v25);
        __int128 v24 = (char *)v24 + 1;
      }

      while (v22 != v24);
      id v22 = [v20 countByEnumeratingWithState:&v25 objects:v37 count:16];
    }

    while (v22);
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_registeredNotificationNames,  "setObject:forKeyedSubscript:",  v14,  v12);
}

- (void)receivedXPCEvent:(id)a3 forEventStream:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  else {
    uint64_t v7 = [v6 isEqualToString:@"com.apple.distnoted.matching"];
  }
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[PDNotificationStreamManager _notificationNameKeyForStream:]( self,  "_notificationNameKeyForStream:",  v7));
  uint64_t v9 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  xpc_dictionary_get_string(v5, _xpc_event_key_name));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  if (v8)
  {
    uint64_t v11 = +[NSString stringWithUTF8String:]( NSString, "stringWithUTF8String:", xpc_dictionary_get_string(v5, (const char *)[v8 UTF8String]));
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    if (v12)
    {
      id v13 = (os_log_s *)v12;
      v39 = v8;
      if (![v10 length])
      {
        uint64_t Object = PKLogFacilityTypeGetObject(0LL);
        id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          id v54 = v6;
          __int16 v55 = 2112;
          v56 = v13;
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "PDNotificationStreamManager (%{public}@): Resolved XPC wake to %@.",  buf,  0x16u);
        }
      }

      id v40 = v6;
      id v41 = v5;
      os_unfair_lock_t lock = &self->_consumerLock;
      v38 = v10;
      os_unfair_lock_lock(&self->_consumerLock);
      id v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_consumers, "allObjects"));
      uint64_t v17 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      __int128 v47 = 0u;
      __int128 v48 = 0u;
      __int128 v49 = 0u;
      __int128 v50 = 0u;
      id v18 = v16;
      id v19 = [v18 countByEnumeratingWithState:&v47 objects:v52 count:16];
      if (v19)
      {
        id v20 = v19;
        uint64_t v21 = *(void *)v48;
        do
        {
          for (i = 0LL; i != v20; i = (char *)i + 1)
          {
            if (*(void *)v48 != v21) {
              objc_enumerationMutation(v18);
            }
            uint64_t v23 = *(void *)(*((void *)&v47 + 1) + 8LL * (void)i);
            __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_consumerRegistrationState, "objectForKey:", v23, lock));
            __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v24 notificationNamesForStream:v7]);
          }

          id v20 = [v18 countByEnumeratingWithState:&v47 objects:v52 count:16];
        }

        while (v20);
      }

      os_unfair_lock_unlock(lock);
      id v26 = -[NSMutableArray count](v17, "count");
      __int128 v43 = 0u;
      __int128 v44 = 0u;
      __int128 v45 = 0u;
      __int128 v46 = 0u;
      __int128 v27 = v17;
      id v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v27,  "countByEnumeratingWithState:objects:count:",  &v43,  v51,  16LL);
      id v5 = v41;
      if (v28)
      {
        id v29 = v28;
        uint64_t v30 = *(void *)v44;
        do
        {
          for (j = 0LL; j != v29; j = (char *)j + 1)
          {
            if (*(void *)v44 != v30) {
              objc_enumerationMutation(v27);
            }
            objc_msgSend( *(id *)(*((void *)&v43 + 1) + 8 * (void)j),  "handleNotificationWithName:event:forStream:",  v13,  v41,  v7,  lock);
          }

          id v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v27,  "countByEnumeratingWithState:objects:count:",  &v43,  v51,  16LL);
        }

        while (v29);
      }

      uint64_t v32 = PKLogFacilityTypeGetObject(0LL);
      __int128 v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
      BOOL v34 = os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);
      if (v26)
      {
        id v6 = v40;
        if (v34)
        {
          *(_DWORD *)buf = 138543618;
          id v54 = v40;
          __int16 v55 = 2112;
          v56 = v13;
          __int128 v35 = "PDNotificationStreamManager (%{public}@): Observers existed to handle notification %@.";
LABEL_33:
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, v35, buf, 0x16u);
        }
      }

      else
      {
        id v6 = v40;
        if (v34)
        {
          *(_DWORD *)buf = 138543618;
          id v54 = v40;
          __int16 v55 = 2112;
          v56 = v13;
          __int128 v35 = "PDNotificationStreamManager (%{public}@): No observers existed to handle notification %@!";
          goto LABEL_33;
        }
      }

      uint64_t v10 = v38;
      id v8 = v39;
      goto LABEL_35;
    }
  }

  uint64_t v36 = PKLogFacilityTypeGetObject(0LL);
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v54 = v6;
    __int16 v55 = 2112;
    v56 = (os_log_s *)v10;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "PDNotificationStreamManager (%{public}@): WARNING RECEIVED MALFORMED NOTIFICATION EVENT %@!",  buf,  0x16u);
  }

- (id)_notificationNameKeyForStream:(int64_t)a3
{
  dispatch_group_t v3 = @"Name";
  if (a3 != 1) {
    dispatch_group_t v3 = 0LL;
  }
  if (a3) {
    return (id)v3;
  }
  else {
    return @"Notification";
  }
}

- (id)_notificationStreamNameForStream:(int64_t)a3
{
  dispatch_group_t v3 = @"com.apple.distnoted.matching";
  if (a3 != 1) {
    dispatch_group_t v3 = 0LL;
  }
  if (a3) {
    return (id)v3;
  }
  else {
    return @"com.apple.notifyd.matching";
  }
}

- (void)_queue_startObservingNotification:(id)a3 forStream:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = v6;
  if (v6)
  {
    id v8 = (const char *)[v6 UTF8String];
    xpc_object_t v9 = xpc_dictionary_create(0LL, 0LL, 0LL);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( -[PDNotificationStreamManager _notificationNameKeyForStream:]( self,  "_notificationNameKeyForStream:",  a4));
    uint64_t v11 = v10;
    if (v10) {
      xpc_dictionary_set_string(v9, (const char *)[v10 UTF8String], v8);
    }
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( -[PDNotificationStreamManager _notificationStreamNameForStream:]( self,  "_notificationStreamNameForStream:",  a4));
    if (v12)
    {
      uint64_t Object = PKLogFacilityTypeGetObject(0LL);
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138543618;
        id v16 = v12;
        __int16 v17 = 2114;
        id v18 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "PDNotificationStreamManager (%{public}@): Start observing notification %{public}@.",  (uint8_t *)&v15,  0x16u);
      }

      xpc_set_event([v12 UTF8String], v8, v9);
    }
  }
}

- (void)_queue_stopObservingNotification:(id)a3 forStream:(int64_t)a4
{
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[PDNotificationStreamManager _notificationStreamNameForStream:]( self,  "_notificationStreamNameForStream:",  a4));
    if (v7)
    {
      uint64_t Object = PKLogFacilityTypeGetObject(0LL);
      xpc_object_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 138543618;
        uint64_t v11 = v7;
        __int16 v12 = 2114;
        id v13 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "PDNotificationStreamManager (%{public}@): Stop observing notification %{public}@.",  (uint8_t *)&v10,  0x16u);
      }

      xpc_set_event( [v7 UTF8String], objc_msgSend(v6, "UTF8String"), 0);
    }
  }
}

- (void).cxx_destruct
{
}

@end