@interface UARPUpdaterServiceManager
- (BOOL)automaticUpdatesDisabledForIdentifier:(id)a3;
- (BOOL)automaticUpdatesDisabledForService:(id)a3;
- (BOOL)bypassProgressForUARPConsent:(id)a3 sendConsent:(BOOL)a4;
- (BOOL)consentDisabledForModelNumber:(id)a3;
- (BOOL)consentDisabledForUARPConsent:(id)a3 sendConsent:(BOOL)a4;
- (BOOL)disableTRMSystemAuthenticationForRegistryEntryID:(id)a3;
- (BOOL)dynamicAssetSolicitation:(id)a3 modelNumber:(id)a4 notifyService:(id)a5;
- (BOOL)dynamicAssetSolicitation:(id)a3 modelNumbers:(id)a4 notifyService:(id)a5;
- (BOOL)enableTRMSystemAuthenticationForRegistryEntryID:(id)a3;
- (BOOL)handleBsdNotificationReceived:(id)a3 identifier:(id)a4;
- (BOOL)handleEAEventStreamMessage:(id)a3 updater:(id)a4 identifer:(id)a5;
- (BOOL)handleIOKitEventStreamMessage:(id)a3 updater:(id)a4 identifier:(id)a5;
- (BOOL)handleXPCStreamEvent:(id)a3;
- (BOOL)isXPCEventStreamSupported:(id)a3;
- (BOOL)queryIsBusy;
- (UARPUpdaterServiceManager)initWithQueue:(id)a3;
- (id)keyComponents:(id)a3;
- (id)keyForEventStream:(id)a3 updaterInstance:(id)a4 eventIdentifier:(id)a5;
- (id)queryPendingTssRequestsForUpdater:(id)a3;
- (id)updaterForAccessoryNeedingConsentWithName:(id)a3;
- (id)updaterForRegistryEntryID:(id)a3;
- (id)updaterForServiceName:(id)a3;
- (void)bsdNotificationRulesChangedForUpdaterServiceInstance:(id)a3 notificationNames:(id)a4;
- (void)checkinDASActivities;
- (void)checkinDASActivityRulesForUpdaterServiceInstance:(id)a3 dasActivities:(id)a4;
- (void)consentReceived:(id)a3;
- (void)consentReceivedPostLogoutMode:(id)a3;
- (void)dasActivityRulesChangedForUpdaterServiceInstance:(id)a3 dasActivities:(id)a4;
- (void)dealloc;
- (void)handleDASXPCActivity:(id)a3;
- (void)initServiceNameList;
- (void)matchingRulesChangedForUpdaterServiceInstance:(id)a3 matchingRules:(id)a4;
- (void)queryLaunchRules;
- (void)tssResponse:(id)a3 updaterName:(id)a4;
@end

@implementation UARPUpdaterServiceManager

- (UARPUpdaterServiceManager)initWithQueue:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___UARPUpdaterServiceManager;
  v4 = -[UARPUpdaterServiceManager init](&v6, "init");
  if (v4)
  {
    v4->_log = os_log_create("com.apple.accessoryupdater.uarp", "updaterManager");
    -[UARPUpdaterServiceManager initServiceNameList](v4, "initServiceNameList");
    v4->_queue = (OS_dispatch_queue *)a3;
    v4->_busyServiceNameList = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  }

  return v4;
}

- (void)initServiceNameList
{
  id v3 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  v4 = -[NSFileManager enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:",  +[NSURL fileURLWithPath:isDirectory:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:isDirectory:",  @"/System/Library/PrivateFrameworks/MobileAccessoryUpdater.framework/XPCServices/",  1LL),  0LL,  1LL,  0LL);
  v5 = (NSString *)-[NSDirectoryEnumerator nextObject](v4, "nextObject");
  if (v5)
  {
    v7 = v5;
    *(void *)&__int128 v6 = 138412290LL;
    __int128 v20 = v6;
    do
    {
      v8 = +[NSBundle bundleWithURL:](&OBJC_CLASS___NSBundle, "bundleWithURL:", v7, v20);
      if (v8)
      {
        v9 = v8;
        if (objc_msgSend( -[NSDictionary objectForKeyedSubscript:]( -[NSBundle infoDictionary](v8, "infoDictionary"),  "objectForKeyedSubscript:",  @"UARP Updater"),  "BOOLValue"))
        {
          v10 = -[NSBundle bundleIdentifier](v9, "bundleIdentifier");
          if (v10)
          {
            v11 = v10;
            log = self->_log;
            if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v20;
              v22 = v11;
              _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_INFO,  "Located UARP updater bundle %@",  buf,  0xCu);
            }

            v13 = -[UARPUpdaterServiceInstance initWithServiceBundle:delegate:]( objc_alloc(&OBJC_CLASS___UARPUpdaterServiceInstance),  "initWithServiceBundle:delegate:",  v9,  self);
            unsigned int v14 = -[UARPUpdaterServiceManager automaticUpdatesDisabledForService:]( self,  "automaticUpdatesDisabledForService:",  -[UARPUpdaterServiceInstance serviceName](v13, "serviceName"));
            v15 = self->_log;
            BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
            if (v14)
            {
              if (v16)
              {
                v17 = -[UARPUpdaterServiceInstance serviceName](v13, "serviceName");
                *(_DWORD *)buf = v20;
                v22 = v17;
                _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "UARP updater service disabled %@",  buf,  0xCu);
              }
            }

            else
            {
              if (v16)
              {
                v19 = -[UARPUpdaterServiceInstance serviceName](v13, "serviceName");
                *(_DWORD *)buf = v20;
                v22 = v19;
                _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "UARP updater service enabled %@",  buf,  0xCu);
              }

              [v3 addObject:v13];
            }
          }
        }
      }

      else
      {
        v18 = self->_log;
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v20;
          v22 = v7;
          _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "Unable to access XPC bundle at %@",  buf,  0xCu);
        }
      }

      v7 = (NSString *)-[NSDirectoryEnumerator nextObject](v4, "nextObject");
    }

    while (v7);
  }

  self->_updaterList = -[NSArray initWithArray:](objc_alloc(&OBJC_CLASS___NSArray), "initWithArray:", v3);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___UARPUpdaterServiceManager;
  -[UARPUpdaterServiceManager dealloc](&v3, "dealloc");
}

- (void)queryLaunchRules
{
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_INFO,  "First launch. Querying plugin launch rules.",  buf,  2u);
  }

  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  updaterList = self->_updaterList;
  id v5 = -[NSArray countByEnumeratingWithState:objects:count:]( updaterList,  "countByEnumeratingWithState:objects:count:",  &v9,  v14,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(updaterList);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)i) queryLaunchRules];
      }

      id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( updaterList,  "countByEnumeratingWithState:objects:count:",  &v9,  v14,  16LL);
    }

    while (v6);
  }

- (void)checkinDASActivities
{
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  updaterList = self->_updaterList;
  id v3 = -[NSArray countByEnumeratingWithState:objects:count:]( updaterList,  "countByEnumeratingWithState:objects:count:",  &v7,  v11,  16LL);
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(updaterList);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)i) checkinDASActivities];
      }

      id v4 = -[NSArray countByEnumeratingWithState:objects:count:]( updaterList,  "countByEnumeratingWithState:objects:count:",  &v7,  v11,  16LL);
    }

    while (v4);
  }

- (void)matchingRulesChangedForUpdaterServiceInstance:(id)a3 matchingRules:(id)a4
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100010708;
  block[3] = &unk_1000754F8;
  block[4] = a4;
  block[5] = self;
  block[6] = a3;
  dispatch_sync(queue, block);
}

- (void)bsdNotificationRulesChangedForUpdaterServiceInstance:(id)a3 notificationNames:(id)a4
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000109EC;
  block[3] = &unk_1000754F8;
  block[4] = a4;
  block[5] = self;
  block[6] = a3;
  dispatch_sync(queue, block);
}

- (void)dasActivityRulesChangedForUpdaterServiceInstance:(id)a3 dasActivities:(id)a4
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100010C10;
  block[3] = &unk_1000754F8;
  block[4] = a4;
  block[5] = self;
  block[6] = a3;
  dispatch_sync(queue, block);
}

- (void)checkinDASActivityRulesForUpdaterServiceInstance:(id)a3 dasActivities:(id)a4
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100010E70;
  block[3] = &unk_1000754F8;
  block[4] = a4;
  block[5] = self;
  block[6] = a3;
  dispatch_sync(queue, block);
}

- (id)updaterForServiceName:(id)a3
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  updaterList = self->_updaterList;
  id v5 = -[NSArray countByEnumeratingWithState:objects:count:]( updaterList,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (!v5) {
    return 0LL;
  }
  id v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0LL;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(updaterList);
    }
    __int128 v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if (v6 == (id)++v8)
    {
      id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( updaterList,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
      if (v6) {
        goto LABEL_3;
      }
      return 0LL;
    }
  }

- (id)updaterForAccessoryNeedingConsentWithName:(id)a3
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  updaterList = self->_updaterList;
  id v5 = -[NSArray countByEnumeratingWithState:objects:count:]( updaterList,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (!v5) {
    return 0LL;
  }
  id v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0LL;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(updaterList);
    }
    __int128 v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if (v6 == (id)++v8)
    {
      id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( updaterList,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
      if (v6) {
        goto LABEL_3;
      }
      return 0LL;
    }
  }

- (BOOL)bypassProgressForUARPConsent:(id)a3 sendConsent:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = -[UARPUpdaterServiceManager updaterForAccessoryNeedingConsentWithName:]( self,  "updaterForAccessoryNeedingConsentWithName:",  [a3 accessoryName]);
  if ([v7 consentDisabledForService])
  {
    if (!v4) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }

  BOOL v8 = -[UARPUpdaterServiceManager consentDisabledForModelNumber:]( self,  "consentDisabledForModelNumber:",  [a3 appleModelNumber]);
  if (v8 && v4)
  {
LABEL_6:
    [v7 consentReceivedPostLogoutMode:a3];
LABEL_7:
    LOBYTE(v8) = 1;
  }

  return v8;
}

- (BOOL)consentDisabledForUARPConsent:(id)a3 sendConsent:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = -[UARPUpdaterServiceManager updaterForAccessoryNeedingConsentWithName:]( self,  "updaterForAccessoryNeedingConsentWithName:",  [a3 accessoryName]);
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543618;
    id v12 = [v7 serviceName];
    __int16 v13 = 2114;
    id v14 = [a3 accessoryName];
    _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEFAULT,  "Check if consent is diabled for service %{public}@ accessory %{public}@",  (uint8_t *)&v11,  0x16u);
  }

  if ([v7 consentDisabledForService])
  {
    if (!v4) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }

  BOOL v9 = -[UARPUpdaterServiceManager consentDisabledForModelNumber:]( self,  "consentDisabledForModelNumber:",  [a3 appleModelNumber]);
  if (v9 && v4)
  {
LABEL_8:
    [v7 consentReceived:a3];
LABEL_9:
    LOBYTE(v9) = 1;
  }

  return v9;
}

- (id)updaterForRegistryEntryID:(id)a3
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  updaterList = self->_updaterList;
  id v5 = -[NSArray countByEnumeratingWithState:objects:count:]( updaterList,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (!v5) {
    return 0LL;
  }
  id v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0LL;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(updaterList);
    }
    BOOL v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if (v6 == (id)++v8)
    {
      id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( updaterList,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
      if (v6) {
        goto LABEL_3;
      }
      return 0LL;
    }
  }

- (id)keyForEventStream:(id)a3 updaterInstance:(id)a4 eventIdentifier:(id)a5
{
  return +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@,%@,%@",  a3,  [a4 serviceName],  a5);
}

- (id)keyComponents:(id)a3
{
  return objc_msgSend( a3,  "componentsSeparatedByCharactersInSet:",  +[NSCharacterSet characterSetWithCharactersInString:]( NSCharacterSet,  "characterSetWithCharactersInString:",  @","));
}

- (BOOL)isXPCEventStreamSupported:(id)a3
{
  else {
    return [a3 isEqualToString:@"com.apple.ExternalAccessory.matching"];
  }
}

- (BOOL)handleXPCStreamEvent:(id)a3
{
  id v5 = -[UARPUpdaterServiceManager keyComponents:]( self,  "keyComponents:",  +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  xpc_dictionary_get_string(a3, _xpc_event_key_name)));
  if ([v5 count] != (id)3) {
    goto LABEL_10;
  }
  id v6 = [v5 objectAtIndexedSubscript:1];
  id v7 = -[UARPUpdaterServiceManager updaterForServiceName:](self, "updaterForServiceName:", v6);
  if (!v7)
  {
    unsigned int v11 = os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR);
    if (!v11) {
      return v11;
    }
    sub_100048BF0();
    goto LABEL_10;
  }

  id v8 = v7;
  id v9 = [v5 objectAtIndexedSubscript:0];
  id v10 = [v5 objectAtIndexedSubscript:2];
  if ([v9 isEqualToString:@"com.apple.iokit.matching"])
  {
    if (-[UARPUpdaterServiceManager handleIOKitEventStreamMessage:updater:identifier:]( self,  "handleIOKitEventStreamMessage:updater:identifier:",  a3,  v8,  v10))
    {
      goto LABEL_14;
    }

    goto LABEL_10;
  }

  if ([v9 isEqualToString:@"com.apple.ExternalAccessory.matching"])
  {
    if (-[UARPUpdaterServiceManager handleEAEventStreamMessage:updater:identifer:]( self,  "handleEAEventStreamMessage:updater:identifer:",  a3,  v8,  v10))
    {
LABEL_14:
      -[NSMutableSet addObject:](self->_busyServiceNameList, "addObject:", v6);
      LOBYTE(v11) = 1;
      return v11;
    }

- (void)handleDASXPCActivity:(id)a3
{
  xpc_object_t v5 = xpc_activity_copy_criteria((xpc_activity_t)a3);
  if (v5)
  {
    id v6 = v5;
    id v7 = (id)_CFXPCCreateCFObjectFromXPCObject();
    xpc_release(v6);
    id v8 = (const char *)objc_msgSend( v7,  "objectForKeyedSubscript:",  +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "name"));
    xpc_activity_state_t state = xpc_activity_get_state((xpc_activity_t)a3);
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 136315650;
      v19 = "-[UARPUpdaterServiceManager handleDASXPCActivity:]";
      __int16 v20 = 2112;
      v21 = v8;
      __int16 v22 = 2048;
      xpc_activity_state_t v23 = state;
      _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEFAULT,  "%s: activity %@, state %ld",  (uint8_t *)&v18,  0x20u);
    }

    if (state == 2)
    {
      unsigned int v11 = self->_log;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 138412546;
        v19 = v8;
        __int16 v20 = 2112;
        v21 = (const char *)v7;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "RUN Handler called for activity: %@, criteria: %@",  (uint8_t *)&v18,  0x16u);
      }

      if (!xpc_activity_set_state((xpc_activity_t)a3, 4LL) && os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
        sub_100048D10();
      }
      id v12 = -[UARPUpdaterServiceManager keyComponents:](self, "keyComponents:", v8);
      if ([v12 count] == (id)3)
      {
        id v13 = [v12 objectAtIndexedSubscript:1];
        id v14 = -[UARPUpdaterServiceManager updaterForServiceName:](self, "updaterForServiceName:", v13);
        if (v14)
        {
          v15 = v14;
          id v16 = [v7 mutableCopy];
          objc_msgSend( v16,  "removeObjectForKey:",  +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "name"));
          v17 = -[UARPServiceUpdaterDASMatchingRule initWithIdentifier:matchingDictionary:]( [UARPServiceUpdaterDASMatchingRule alloc],  "initWithIdentifier:matchingDictionary:",  [v12 objectAtIndexedSubscript:2],  v16);
          [v15 dasActivityReceived:v17];
          -[NSMutableSet addObject:](self->_busyServiceNameList, "addObject:", v13);

          if (!xpc_activity_set_state((xpc_activity_t)a3, 5LL) && os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
            sub_100048C50();
          }
        }

        else if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR))
        {
          sub_100048BF0();
        }
      }

      else if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR))
      {
        sub_100048CB0();
      }
    }
  }

- (BOOL)automaticUpdatesDisabledForIdentifier:(id)a3
{
  id v3 = [a3 componentsSeparatedByString:@"."];
  BOOL v4 = (void *)CFPreferencesCopyAppValue(@"disabledProductIdentifiers", @"com.apple.mobileaccessoryupdater");
  LOBYTE(v3) = objc_msgSend( objc_msgSend(v4, "objectForKeyedSubscript:", objc_msgSend(v3, "objectAtIndex:", 0)),  "BOOLValue");

  return (char)v3;
}

- (BOOL)consentDisabledForModelNumber:(id)a3
{
  BOOL v4 = (void *)CFPreferencesCopyAppValue( @"disabledConsentProductIdentifiers",  @"com.apple.mobileaccessoryupdater");
  LOBYTE(a3) = objc_msgSend(objc_msgSend(v4, "objectForKeyedSubscript:", a3), "BOOLValue");

  return (char)a3;
}

- (BOOL)automaticUpdatesDisabledForService:(id)a3
{
  BOOL v4 = (void *)CFPreferencesCopyAppValue(@"disabledUARPServices", @"com.apple.mobileaccessoryupdater");
  LOBYTE(a3) = objc_msgSend(objc_msgSend(v4, "objectForKeyedSubscript:", a3), "BOOLValue");

  return (char)a3;
}

- (BOOL)handleIOKitEventStreamMessage:(id)a3 updater:(id)a4 identifier:(id)a5
{
  unsigned int v9 = -[UARPUpdaterServiceManager automaticUpdatesDisabledForIdentifier:]( self,  "automaticUpdatesDisabledForIdentifier:",  a5);
  if (v9)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412290;
      id v14 = a5;
      _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_INFO,  "Ignoring IOKit event because automatic updates are disabled for %@",  (uint8_t *)&v13,  0xCu);
    }
  }

  else
  {
    unsigned int v11 = -[UARPServiceUpdaterMatchedIOKitRule initWithIdentifier:registryEntryID:]( objc_alloc(&OBJC_CLASS___UARPServiceUpdaterMatchedIOKitRule),  "initWithIdentifier:registryEntryID:",  a5,  xpc_dictionary_get_uint64(a3, "IOMatchLaunchServiceID"));
    [a4 ioKitRuleMatched:v11];
  }

  return v9 ^ 1;
}

- (BOOL)handleBsdNotificationReceived:(id)a3 identifier:(id)a4
{
  return 1;
}

- (BOOL)handleEAEventStreamMessage:(id)a3 updater:(id)a4 identifer:(id)a5
{
  unsigned int v9 = -[UARPUpdaterServiceManager automaticUpdatesDisabledForIdentifier:]( self,  "automaticUpdatesDisabledForIdentifier:",  a5);
  if (v9)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      int v15 = 138412290;
      id v16 = a5;
      _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_INFO,  "Ignoring EA event because automatic updates are disabled for %@",  (uint8_t *)&v15,  0xCu);
    }
  }

  else
  {
    value = (NSString *)xpc_dictionary_get_value(a3, "EAMatchingSerialNumber");
    id v12 = value;
    if (value)
    {
      if (xpc_get_type(value) == (xpc_type_t)&_xpc_type_string) {
        id v12 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  xpc_string_get_string_ptr(v12));
      }
      else {
        id v12 = 0LL;
      }
    }

    int v13 = -[UARPServiceUpdaterMatchedEARule initWithEAIdentifier:accessorySerialNumber:]( objc_alloc(&OBJC_CLASS___UARPServiceUpdaterMatchedEARule),  "initWithEAIdentifier:accessorySerialNumber:",  a5,  v12);
    [a4 eaRuleMatched:v13];
  }

  return v9 ^ 1;
}

- (void)consentReceived:(id)a3
{
}

- (void)consentReceivedPostLogoutMode:(id)a3
{
}

- (BOOL)queryIsBusy
{
  if (!-[NSMutableSet count](self->_busyServiceNameList, "count")) {
    return 0;
  }
  id v21 = +[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set");
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  obj = self->_busyServiceNameList;
  id v3 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v30,  v39,  16LL);
  if (v3)
  {
    id v4 = v3;
    BOOL v22 = 0;
    uint64_t v5 = *(void *)v31;
    uint64_t v20 = *(void *)v31;
    do
    {
      id v6 = 0LL;
      id v23 = v4;
      do
      {
        if (*(void *)v31 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(NSMutableSet **)(*((void *)&v30 + 1) + 8LL * (void)v6);
        id v8 = -[UARPUpdaterServiceManager updaterForServiceName:](self, "updaterForServiceName:", v7, v20);
        if ([v8 queryIsServiceBusy])
        {
          BOOL v22 = 1;
        }

        else
        {
          v25 = v6;
          id v9 = [v8 findAndReleaseAllIONotificationPorts];
          __int128 v26 = 0u;
          __int128 v27 = 0u;
          __int128 v28 = 0u;
          __int128 v29 = 0u;
          id v10 = [v9 countByEnumeratingWithState:&v26 objects:v38 count:16];
          if (v10)
          {
            id v11 = v10;
            uint64_t v12 = *(void *)v27;
            do
            {
              for (i = 0LL; i != v11; i = (char *)i + 1)
              {
                if (*(void *)v27 != v12) {
                  objc_enumerationMutation(v9);
                }
                id v14 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
                log = self->_log;
                if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315394;
                  v35 = "-[UARPUpdaterServiceManager queryIsBusy]";
                  __int16 v36 = 2112;
                  v37 = v7;
                  _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEFAULT,  "%s: Releasing still registered IONotificationPort for %@",  buf,  0x16u);
                }

                IONotificationPortDestroy((IONotificationPortRef)[v14 pointerValue]);
              }

              id v11 = [v9 countByEnumeratingWithState:&v26 objects:v38 count:16];
            }

            while (v11);
          }

          [v21 addObject:v7];
          uint64_t v5 = v20;
          id v4 = v23;
          id v6 = v25;
        }

        id v6 = (char *)v6 + 1;
      }

      while (v6 != v4);
      id v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v30,  v39,  16LL);
    }

    while (v4);
  }

  else
  {
    BOOL v22 = 0;
  }

  -[NSMutableSet minusSet:](self->_busyServiceNameList, "minusSet:", v21);
  v17 = self->_log;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    busyServiceNameList = self->_busyServiceNameList;
    *(_DWORD *)buf = 136315394;
    v35 = "-[UARPUpdaterServiceManager queryIsBusy]";
    __int16 v36 = 2112;
    v37 = busyServiceNameList;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%s: Busy Services: %@", buf, 0x16u);
  }

  return v22;
}

- (BOOL)enableTRMSystemAuthenticationForRegistryEntryID:(id)a3
{
  kern_return_t v13;
  BOOLean_t v14;
  kern_return_t ParentEntry;
  io_registry_entry_t v16;
  const char *v17;
  char *v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  io_registry_entry_t v27;
  uint64_t v28;
  uint64_t v29;
  CFTypeRef v30;
  CFTypeRef v31;
  void *v32;
  uint64_t v33;
  CFTypeRef v34;
  CFTypeRef v35;
  void *v36;
  uint64_t v37;
  const char *v38;
  const char *v39;
  CFMutableDictionaryRef v40;
  void *v41;
  NSNumber *v42;
  CFDictionaryRef v43;
  io_service_t v44;
  CFTypeRef v45;
  const char *v46;
  char *v47;
  CFTypeRef v48;
  CFTypeRef v49;
  CFTypeRef v50;
  CFTypeRef v51;
  CFMutableDictionaryRef v52;
  void *v53;
  IONotificationPort *v54;
  CFDictionaryRef v55;
  uint64_t v56;
  uint64_t v57;
  BOOL v58;
  const char *v60;
  char *v61;
  UARPUpdaterServiceManager *v62;
  io_object_t v63;
  kern_return_t v64;
  id v65;
  os_log_s *log;
  void *v67;
  dispatch_queue_s *queue;
  id v69;
  id v70;
  io_object_t object;
  void block[4];
  int v73;
  uint64_t v74;
  uint64_t entryID;
  void v76[5];
  void v77[5];
  void v78[3];
  void v79[3];
  uint8_t buf[4];
  const char *v81;
  __int16 v82;
  const char *v83;
  __int16 v84;
  const char *v85;
  __int16 v86;
  io_registry_entry_t *v87;
  __int16 v88;
  const char *v89;
  __int16 v90;
  const char *v91;
  _OWORD v92[8];
  io_registry_entry_t parent[16];
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  uint8_t v98[4];
  uint64_t v99;
  io_name_t location;
  io_name_t name;
  id v5 = [a3 unsignedLongLongValue];
  id v6 = IORegistryEntryIDMatching((uint64_t)v5);
  if (!v6)
  {
    if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
      sub_100048D70();
    }
    return 0;
  }

  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v6);
  if (!MatchingService)
  {
    if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
      sub_100048DE0();
    }
    return 0;
  }

  io_registry_entry_t v8 = MatchingService;
  v69 = v5;
  v70 = a3;
  entryID = 0LL;
  memset(name, 0, sizeof(name));
  memset(location, 0, sizeof(location));
  IORegistryEntryGetRegistryEntryID(MatchingService, &entryID);
  IORegistryEntryGetName(v8, name);
  IORegistryEntryGetLocationInPlane(v8, "IOService", location);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    if (location[0]) {
      v60 = "@";
    }
    else {
      v60 = "";
    }
    parent[0] = 136316674;
    if (location[0]) {
      v61 = location;
    }
    else {
      v61 = "";
    }
    *(void *)&parent[1] = "IOPortGetParentPortForService";
    LOWORD(parent[3]) = 1024;
    *(io_registry_entry_t *)((char *)&parent[3] + 2) = v8;
    HIWORD(parent[4]) = 2080;
    *(void *)&parent[5] = name;
    LOWORD(parent[7]) = 2080;
    *(void *)((char *)&parent[7] + 2) = v60;
    HIWORD(parent[9]) = 2080;
    *(void *)&parent[10] = v61;
    LOWORD(parent[12]) = 2048;
    *(void *)((char *)&parent[12] + 2) = entryID;
    HIWORD(parent[14]) = 1024;
    parent[15] = 1;
    _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "%s: service: %d (%s%s%s, 0x%llx), builtIn: %d",  (uint8_t *)parent,  0x40u);
  }

  IOObjectRetain(v8);
  object = v8;
  while (!IORegistryEntryInPlane(v8, "IOPort"))
  {
    ParentEntry = IORegistryEntryGetParentEntry(v8, "IOService", (io_registry_entry_t *)v92);
    IOObjectRelease(v8);
    io_registry_entry_t v8 = v92[0];
    if (ParentEntry) {
      id v16 = 0;
    }
    else {
      id v16 = v92[0];
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      parent[0] = 136315394;
      *(void *)&parent[1] = "IOPortGetParentPortForService";
      LOWORD(parent[3]) = 1024;
      *(io_registry_entry_t *)((char *)&parent[3] + 2) = v16;
      _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "%s: Walking up IOService plane for currentService: %d",  (uint8_t *)parent,  0x12u);
      if (!v16)
      {
LABEL_29:
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
        {
          parent[0] = 136316162;
          if (location[0]) {
            v17 = "@";
          }
          else {
            v17 = "";
          }
          *(void *)&parent[1] = "IOPortGetParentPortForService";
          int v18 = location;
          if (!location[0]) {
            int v18 = "";
          }
          LOWORD(parent[3]) = 2080;
          *(void *)((char *)&parent[3] + 2) = "IOPort";
          HIWORD(parent[5]) = 2080;
          *(void *)&parent[6] = name;
          LOWORD(parent[8]) = 2080;
          *(void *)((char *)&parent[8] + 2) = v17;
          HIWORD(parent[10]) = 2080;
          *(void *)&parent[11] = v18;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%s: Could not find upstream service in %s plane! (service: %s%s%s)",  (uint8_t *)parent,  0x34u);
        }

        goto LABEL_39;
      }
    }

    else if (!v16)
    {
      goto LABEL_29;
    }
  }

  id v9 = kCFAllocatorDefault;
  while (1)
  {
    if (v8 != object && IOObjectConformsTo(v8, "IOPort"))
    {
      CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v8, @"BuiltIn", kCFAllocatorDefault, 0);
      id v11 = (id)CFMakeCollectable(CFProperty);
      if (v11)
      {
        if ([v11 BOOLValue])
        {
          v62 = self;
          v63 = object;
          goto LABEL_81;
        }
      }

      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_10004938C(v98, &v99, v12);
      }
    }

    int v13 = IORegistryEntryGetParentEntry(v8, "IOPort", parent);
    IOObjectRelease(v8);
    if (v13) {
      break;
    }
    id v14 = IOObjectConformsTo(parent[0], "IOService");
    io_registry_entry_t v8 = parent[0];
    if (!v14)
    {
      IOObjectRelease(parent[0]);
      goto LABEL_39;
    }

    if (!parent[0]) {
      goto LABEL_39;
    }
  }

  v19 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  if (v19) {
    sub_100049318(v19, v20, v21, v22, v23, v24, v25, v26);
  }
LABEL_39:
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_100049254();
  }
  __int128 v27 = object;
  IOObjectRetain(object);
  __int128 v28 = 0LL;
  __int128 v29 = 0LL;
  id v9 = kCFAllocatorDefault;
  while (1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      parent[0] = 136315394;
      *(void *)&parent[1] = "IOPortGetParentPortForService";
      LOWORD(parent[3]) = 1024;
      *(io_registry_entry_t *)((char *)&parent[3] + 2) = v27;
      _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "%s: Checking currentEntry: %d",  (uint8_t *)parent,  0x12u);
    }

    __int128 v30 = IORegistryEntryCreateCFProperty(v27, @"port-type", kCFAllocatorDefault, 0);
    __int128 v31 = (id)CFMakeCollectable(v30);
    if (v31)
    {
      __int128 v32 = (void *)v31;
      __int128 v33 = objc_opt_class(&OBJC_CLASS___NSData);
      if ((objc_opt_isKindOfClass(v32, v33) & 1) != 0 && [v32 length] == (id)4)
      {
        __int128 v28 = *(unsigned int *)[v32 bytes];
        if (v28 >= 0x15)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            parent[0] = 136315394;
            *(void *)&parent[1] = "IOPortGetParentPortForService";
            LOWORD(parent[3]) = 2080;
            *(void *)((char *)&parent[3] + 2) = "port-type";
            _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "%s: Invalid %s property value",  (uint8_t *)parent,  0x16u);
          }

          __int128 v28 = 0LL;
        }
      }
    }

    v34 = IORegistryEntryCreateCFProperty(v27, @"port-number", kCFAllocatorDefault, 0);
    v35 = (id)CFMakeCollectable(v34);
    if (v35)
    {
      __int16 v36 = (void *)v35;
      v37 = objc_opt_class(&OBJC_CLASS___NSData);
      if ((objc_opt_isKindOfClass(v36, v37) & 1) != 0 && [v36 length] == (id)4)
      {
        __int128 v29 = *(unsigned int *)[v36 bytes];
        if ((v29 - 100) <= 0xFFFFFF9C)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            parent[0] = 136315394;
            *(void *)&parent[1] = "IOPortGetParentPortForService";
            LOWORD(parent[3]) = 2080;
            *(void *)((char *)&parent[3] + 2) = "port-type";
            _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "%s: Invalid %s property value",  (uint8_t *)parent,  0x16u);
          }

          __int128 v29 = 0LL;
          goto LABEL_60;
        }
      }
    }

    if ((_DWORD)v28 && (_DWORD)v29) {
      break;
    }
LABEL_60:
    parent[0] = 0;
    IORegistryEntryGetParentEntry(v27, "IOService", parent);
    IOObjectRelease(v27);
    __int128 v27 = parent[0];
    if (!parent[0]) {
      goto LABEL_70;
    }
  }

  v74 = 0LL;
  v96 = 0u;
  v97 = 0u;
  v94 = 0u;
  v95 = 0u;
  memset(parent, 0, sizeof(parent));
  memset(v92, 0, sizeof(v92));
  IORegistryEntryGetRegistryEntryID(v27, &v74);
  IORegistryEntryGetName(v27, (char *)parent);
  IORegistryEntryGetLocationInPlane(v27, "IOService", (char *)v92);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316418;
    if (LOBYTE(v92[0])) {
      v38 = "@";
    }
    else {
      v38 = "";
    }
    v81 = "IOPortGetParentPortForService";
    if (LOBYTE(v92[0])) {
      v39 = (const char *)v92;
    }
    else {
      v39 = "";
    }
    v82 = 2080;
    v83 = "port-type";
    v84 = 2080;
    v85 = "port-number";
    v86 = 2080;
    v87 = parent;
    v88 = 2080;
    v89 = v38;
    v90 = 2080;
    v91 = v39;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%s: Found registry entry with %s and %s properties! (currentEntry: %s%s%s)",  buf,  0x3Eu);
  }

- (BOOL)disableTRMSystemAuthenticationForRegistryEntryID:(id)a3
{
  id v5 = -[UARPUpdaterServiceManager updaterForRegistryEntryID:](self, "updaterForRegistryEntryID:");
  if (!v5)
  {
    log = self->_log;
    BOOL v10 = os_log_type_enabled(log, OS_LOG_TYPE_ERROR);
    if (!v10) {
      return v10;
    }
    sub_10004941C(a3, log);
    goto LABEL_11;
  }

  id v6 = v5;
  id v7 = [v5 findAndReleaseIONotificationPortForRegistryEntryID:a3];
  io_registry_entry_t v8 = self->_log;
  if (!v7)
  {
    BOOL v10 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (!v10) {
      return v10;
    }
    sub_1000494A0(a3, v8);
LABEL_11:
    LOBYTE(v10) = 0;
    return v10;
  }

  id v9 = v7;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315650;
    id v14 = "-[UARPUpdaterServiceManager disableTRMSystemAuthenticationForRegistryEntryID:]";
    __int16 v15 = 2048;
    id v16 = [a3 unsignedLongLongValue];
    __int16 v17 = 2112;
    id v18 = [v6 serviceName];
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s: Releasing registered IONotificationPort for registryEntryID: 0x%llx / %@",  (uint8_t *)&v13,  0x20u);
  }

  IONotificationPortDestroy((IONotificationPortRef)[v9 pointerValue]);

  LOBYTE(v10) = 1;
  return v10;
}

- (BOOL)dynamicAssetSolicitation:(id)a3 modelNumber:(id)a4 notifyService:(id)a5
{
  id v9 = +[UARPSupportedAccessory findByAppleModelNumber:]( &OBJC_CLASS___UARPSupportedAccessory,  "findByAppleModelNumber:",  a4);
  if (v9 && (BOOL v10 = v9, [v9 updaterName]))
  {
    id v11 = -[UARPUpdaterServiceManager updaterForServiceName:]( self,  "updaterForServiceName:",  [v10 updaterName]);
    if (v11) {
      return [v11 dynamicAssetSolicitation:a3 modelNumber:a4 notifyService:a5];
    }
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      sub_100049594(v10, log);
    }
  }

  else if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR))
  {
    sub_100049524();
  }

  return 0;
}

- (BOOL)dynamicAssetSolicitation:(id)a3 modelNumbers:(id)a4 notifyService:(id)a5
{
  id v9 = [a4 count];
  if (v9)
  {
    id v22 = a3;
    id v23 = a5;
    id v10 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    id v11 = [a4 countByEnumeratingWithState:&v24 objects:v34 count:16];
    if (v11)
    {
      id v12 = v11;
      id v13 = 0LL;
      uint64_t v14 = *(void *)v25;
      do
      {
        for (i = 0LL; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(a4);
          }
          uint64_t v16 = *(void *)(*((void *)&v24 + 1) + 8LL * (void)i);
          id v17 = +[UARPSupportedAccessory findByAppleModelNumber:]( &OBJC_CLASS___UARPSupportedAccessory,  "findByAppleModelNumber:",  v16);
          id v18 = v17;
          if (!v13) {
            id v13 = [v17 updaterName];
          }
          if ([v18 updaterName]
            && (objc_msgSend(v13, "isEqualToString:", objc_msgSend(v18, "updaterName")) & 1) != 0)
          {
            [v10 addObject:v16];
          }

          else
          {
            log = self->_log;
            if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315650;
              __int128 v29 = "-[UARPUpdaterServiceManager dynamicAssetSolicitation:modelNumbers:notifyService:]";
              __int16 v30 = 2112;
              __int128 v31 = v18;
              __int16 v32 = 2112;
              id v33 = v13;
              _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "%s: Discarding accessory %@ that does not belong to selected service %@",  buf,  0x20u);
            }
          }
        }

        id v12 = [a4 countByEnumeratingWithState:&v24 objects:v34 count:16];
      }

      while (v12);
    }

    else
    {
      id v13 = 0LL;
    }

    id v20 = -[UARPUpdaterServiceManager updaterForServiceName:](self, "updaterForServiceName:", v13);
    if (v20)
    {
      LOBYTE(v9) = objc_msgSend( v20,  "dynamicAssetSolicitation:modelNumbers:notifyService:",  v22,  +[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v10),  v23);
    }

    else
    {
      LODWORD(v9) = os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR);
      if ((_DWORD)v9)
      {
        sub_100049618();
        LOBYTE(v9) = 0;
      }
    }
  }

  return (char)v9;
}

- (id)queryPendingTssRequestsForUpdater:(id)a3
{
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315394;
    id v10 = "-[UARPUpdaterServiceManager queryPendingTssRequestsForUpdater:]";
    __int16 v11 = 2112;
    id v12 = a3;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "%s: For service %@", (uint8_t *)&v9, 0x16u);
  }

  id v6 = -[UARPUpdaterServiceManager updaterForServiceName:](self, "updaterForServiceName:", a3);
  if (v6)
  {
    id v7 = [v6 queryPendingTssRequests];
    if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
      sub_1000496F8();
    }
  }

  else
  {
    if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
      sub_100049688();
    }
    return &__NSArray0__struct;
  }

  return v7;
}

- (void)tssResponse:(id)a3 updaterName:(id)a4
{
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315394;
    id v10 = "-[UARPUpdaterServiceManager tssResponse:updaterName:]";
    __int16 v11 = 2112;
    id v12 = a4;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "%s: For service %@", (uint8_t *)&v9, 0x16u);
  }

  id v8 = -[UARPUpdaterServiceManager updaterForServiceName:](self, "updaterForServiceName:", a4);
  if (v8)
  {
    [v8 tssResponse:a3];
  }

  else if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR))
  {
    sub_10004976C();
  }

@end