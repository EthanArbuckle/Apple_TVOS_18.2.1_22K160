@interface WiFiAnalyticsManager
+ (id)sharedWiFiAnalyticsManager;
- (BOOL)copyHigherBandNetworksAvailableAtLocation:(id)a3 intoArray:(id *)a4;
- (BOOL)isHistoricallyBadLinkQualityNetwork:(__WiFiNetwork *)a3;
- (BOOL)isMovingNetwork:(__WiFiNetwork *)a3;
- (BOOL)isNetworkTraitsCacheValid;
- (BOOL)isOmnipresentNetwork:(__WiFiNetwork *)a3;
- (BOOL)roamParamsQueryPending;
- (BOOL)traitsCacheUpdateBusy;
- (NSDate)dateTraitCachesUpdated;
- (NSMutableArray)historicallyBadLinkQualityNetworkSsidsCache;
- (NSMutableArray)movingNetworkSsidsCache;
- (NSMutableArray)omnipresentNetworkSsidsCache;
- (NSMutableArray)usageCache;
- (WADeviceAnalyticsClient)deviceAnalyticsClient;
- (WiFiAnalyticsManager)init;
- (__WiFiManager)wifiManager;
- (__WiFiNetwork)_copyCreateEquivalentWiFiNetwork:(id)a3 authFlags:(int64_t)a4;
- (__WiFiNetwork)copyColocatedScopeTransitionNetwork:(__WiFiNetwork *)a3 minRssi:(int)a4 maxRssi:(int)a5 band:(unsigned int)a6;
- (double)managerInitTime;
- (id)copyAllStoredNetworkSsids;
- (id)copyAllStoredNetworkSsidsWithColocatedScopeId:(id)a3;
- (id)copyColocatedScopeIdForNetwork:(__WiFiNetwork *)a3;
- (id)copyGeoTagsForNetworkAtLocation:(__WiFiNetwork *)a3 location:(id)a4;
- (id)copyNetworksAvailableAtLocation:(id)a3;
- (id)copyPreferenceScoreDictionaryForNetwork:(__WiFiNetwork *)a3;
- (id)copyScoreSortedNetworksAvailableAtLocation:(id)a3;
- (id)copyStoredNetworksAvailableAtLocationWithinDistanceInBand:(id)a3 distance:(double)a4 band:(unsigned int)a5;
- (id)getNetworkUsageDictionary:(__WiFiNetwork *)a3;
- (unint64_t)isWithin:(double)a3 fromLocation:(id)a4 forNetwork:(__WiFiNetwork *)a5;
- (unsigned)getColocatedStateFromPreferenceScoreDictionary:(id)a3;
- (void)_cleanupExistingRetiredStores;
- (void)dealloc;
- (void)getAdaptiveRoamParams:(__CFString *)a3 ssid:(__CFString *)a4;
- (void)setDateTraitCachesUpdated:(id)a3;
- (void)setDeviceAnalyticsClient:(id)a3;
- (void)setHistoricallyBadLinkQualityNetworkSsidsCache:(id)a3;
- (void)setManagerInitTime:(double)a3;
- (void)setMovingNetworkSsidsCache:(id)a3;
- (void)setOmnipresentNetworkSsidsCache:(id)a3;
- (void)setRoamParamsQueryPending:(BOOL)a3;
- (void)setTraitsCacheUpdateBusy:(BOOL)a3;
- (void)setUsageCache:(id)a3;
- (void)setWiFiManager:(__WiFiManager *)a3;
- (void)setWifiManager:(__WiFiManager *)a3;
- (void)updateNetworkTraitsCache;
@end

@implementation WiFiAnalyticsManager

+ (id)sharedWiFiAnalyticsManager
{
  if (objc_opt_class(&OBJC_CLASS___WAClient))
  {
    if (qword_1002197E8 != -1) {
      dispatch_once(&qword_1002197E8, &stru_1001E2750);
    }
  }

  else
  {
    v3 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: failed in super-init" message:3];
    }
    objc_autoreleasePoolPop(v3);
  }

  return (id)qword_1002197E0;
}

- (WiFiAnalyticsManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___WiFiAnalyticsManager;
  v2 = -[WiFiAnalyticsManager init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    v2->_deviceAnalyticsClient = 0LL;
    v2->_movingNetworkSsidsCache = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v3->_omnipresentNetworkSsidsCache = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v3->_historicallyBadLinkQualityNetworkSsidsCache = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v3->_dateTraitCachesUpdated = 0LL;
    v3->_traitsCacheUpdateBusy = 0;
    v3->_usageCache = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  }

  else
  {
    v5 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"-[WiFiAnalyticsManager init] failed in super-init"];
    }
    objc_autoreleasePoolPop(v5);
  }

  return v3;
}

- (void)dealloc
{
  deviceAnalyticsClient = self->_deviceAnalyticsClient;
  if (deviceAnalyticsClient)
  {

    self->_deviceAnalyticsClient = 0LL;
  }

  movingNetworkSsidsCache = self->_movingNetworkSsidsCache;
  if (movingNetworkSsidsCache) {

  }
  omnipresentNetworkSsidsCache = self->_omnipresentNetworkSsidsCache;
  if (omnipresentNetworkSsidsCache) {

  }
  historicallyBadLinkQualityNetworkSsidsCache = self->_historicallyBadLinkQualityNetworkSsidsCache;
  if (historicallyBadLinkQualityNetworkSsidsCache) {

  }
  dateTraitCachesUpdated = self->_dateTraitCachesUpdated;
  if (dateTraitCachesUpdated) {

  }
  usageCache = self->_usageCache;
  if (usageCache)
  {
    -[NSMutableArray removeAllObjects](usageCache, "removeAllObjects");
  }

  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___WiFiAnalyticsManager;
  -[WiFiAnalyticsManager dealloc](&v9, "dealloc");
}

- (void)setWiFiManager:(__WiFiManager *)a3
{
  if (a3)
  {
    -[WiFiAnalyticsManager setWifiManager:](self, "setWifiManager:");
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    -[WiFiAnalyticsManager setManagerInitTime:](self, "setManagerInitTime:", Current);
  }

  else
  {
    v5 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: NULL WiFiManager" message:3];
    }
    objc_autoreleasePoolPop(v5);
  }

- (WADeviceAnalyticsClient)deviceAnalyticsClient
{
  if (objc_opt_class(&OBJC_CLASS___WADeviceAnalyticsClient))
  {
    if (!self->_deviceAnalyticsClient)
    {
      v3 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        [qword_100219F60 WFLog:@"%s: attempting to initialize deviceAnalyticsClient" message:3];
      }
      objc_autoreleasePoolPop(v3);
      if (_os_feature_enabled_impl("WiFiPolicy", "HND_AnalyticsProcessor")) {
        v4 = (WADeviceAnalyticsClient *)+[WADeviceAnalyticsClient sharedDeviceAnalyticsClientWithPersist]( &OBJC_CLASS___WADeviceAnalyticsClient,  "sharedDeviceAnalyticsClientWithPersist");
      }
      else {
        v4 = objc_alloc_init(&OBJC_CLASS___WADeviceAnalyticsClient);
      }
      self->_deviceAnalyticsClient = v4;
      if (v4)
      {
        -[WiFiAnalyticsManager _cleanupExistingRetiredStores](self, "_cleanupExistingRetiredStores");
        v5 = objc_autoreleasePoolPush();
        if (qword_100219F60) {
          [qword_100219F60 WFLog:@"deviceAnalyticsClient initialized successfully"];
        }
      }

      else
      {
        v5 = objc_autoreleasePoolPush();
        if (qword_100219F60) {
          [qword_100219F60 WFLog:@"%s: unable to init deviceAnalyticsClient" message:4];
        }
      }

      objc_autoreleasePoolPop(v5);
      self->_roamParamsQueryPending = 0;
    }
  }

  else
  {
    v7 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  4,  "%s: WADeviceAnalyticsClient class not present",  "-[WiFiAnalyticsManager deviceAnalyticsClient]");
    }
    objc_autoreleasePoolPop(v7);
  }

  return self->_deviceAnalyticsClient;
}

- (void)_cleanupExistingRetiredStores
{
  id v2 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  [v2 addObject:[NSURL URLWithString:@"/System/Library/PrivateFrameworks/MobileWiFi.framework/WiFiNetworkStoreModel.momd"]];
  [v2 addObject:[NSURL URLWithString:@"/usr/sbin/WiFiNetworkStoreModel.momd"]];
  v3 = &ACAccountStoreDidChangeNotification_ptr;
  v4 = -[NSFileManager URLForDirectory:inDomain:appropriateForURL:create:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "URLForDirectory:inDomain:appropriateForURL:create:error:",  14LL,  1LL,  0LL,  1LL,  0LL);
  v36 = -[NSURL URLByAppendingPathComponent:](v4, "URLByAppendingPathComponent:", @"WiFiNetworkStoreModel.sqlite");
  if (!v36)
  {
    v32 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"Error getting storeURL"];
    }
    goto LABEL_55;
  }

  v5 = -[NSURL URLByAppendingPathComponent:]( v4,  "URLByAppendingPathComponent:",  @"WiFiNetworkStoreModel.sqlite-wal");
  if (!v5)
  {
    v32 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"Error getting storeWalURL" message:4 "%s: Error getting storeWalURL" "-[WiFiAnalyticsManager _cleanupExistingRetiredStores]" ];
    }
    goto LABEL_55;
  }

  objc_super v6 = v5;
  v7 = -[NSURL URLByAppendingPathComponent:]( v4,  "URLByAppendingPathComponent:",  @"WiFiNetworkStoreModel.sqlite-shm");
  if (!v7)
  {
    v32 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: Error getting storeShmURL" message:4];
    }
LABEL_55:
    objc_autoreleasePoolPop(v32);
    return;
  }

  v8 = v7;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  id v9 = [v2 countByEnumeratingWithState:&v42 objects:v47 count:16];
  if (v9)
  {
    id v10 = v9;
    v33 = v8;
    v34 = v6;
    char v35 = 0;
    uint64_t v11 = *(void *)v43;
    do
    {
      v12 = 0LL;
      do
      {
        if (*(void *)v43 != v11) {
          objc_enumerationMutation(v2);
        }
        v13 = *(void **)(*((void *)&v42 + 1) + 8LL * (void)v12);
        if (v13
          && objc_msgSend( objc_msgSend((id)v3[381], "defaultManager"),  "fileExistsAtPath:",  objc_msgSend(v13, "path")))
        {
          v14 = v3;
          v15 = -[NSManagedObjectModel initWithContentsOfURL:]( objc_alloc(&OBJC_CLASS___NSManagedObjectModel),  "initWithContentsOfURL:",  v13);
          if (v15)
          {
            v16 = v15;
            v17 = -[NSPersistentStoreCoordinator initWithManagedObjectModel:]( objc_alloc(&OBJC_CLASS___NSPersistentStoreCoordinator),  "initWithManagedObjectModel:",  v15);
            if (v17)
            {
              v18 = v17;
              uint64_t v41 = 0LL;
              if (-[NSPersistentStoreCoordinator destroyPersistentStoreAtURL:withType:options:error:]( v17,  "destroyPersistentStoreAtURL:withType:options:error:",  v36,  NSSQLiteStoreType,  0LL,  &v41))
              {
                BOOL v19 = v41 == 0;
              }

              else
              {
                BOOL v19 = 0;
              }

              if (v19)
              {
                char v35 = 1;
              }

              else
              {
                v20 = objc_autoreleasePoolPush();
                if (qword_100219F60) {
                  [(id)qword_100219F60 WFLog:3, "%s failed to destroy store at URL %@ %@", "-[WiFiAnalyticsManager _cleanupExistingRetiredStores]", v13, v41 message];
                }
                objc_autoreleasePoolPop(v20);
              }
            }

            else
            {
              v22 = objc_autoreleasePoolPush();
              if (qword_100219F60) {
                [(id)qword_100219F60 WFLog:3 message:"_persistenceCoordinator is nil"];
              }
              objc_autoreleasePoolPop(v22);
            }
          }

          else
          {
            v21 = objc_autoreleasePoolPush();
            if (qword_100219F60) {
              [(id)qword_100219F60 WFLog:3 message:"failed to create managedObjectModel"];
            }
            objc_autoreleasePoolPop(v21);
          }

          v3 = v14;
        }

        v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v23 = [v2 countByEnumeratingWithState:&v42 objects:v47 count:16];
      id v10 = v23;
    }

    while (v23);
    if ((v35 & 1) != 0)
    {
      id v24 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
      [v24 addObject:v36];
      [v24 addObject:v33];
      [v24 addObject:v34];
      [v24 addObjectsFromArray:v2];
      __int128 v39 = 0u;
      __int128 v40 = 0u;
      __int128 v37 = 0u;
      __int128 v38 = 0u;
      id v25 = [v24 countByEnumeratingWithState:&v37 objects:v46 count:16];
      if (v25)
      {
        id v26 = v25;
        uint64_t v27 = *(void *)v38;
        do
        {
          for (i = 0LL; i != v26; i = (char *)i + 1)
          {
            if (*(void *)v38 != v27) {
              objc_enumerationMutation(v24);
            }
            v29 = *(void **)(*((void *)&v37 + 1) + 8LL * (void)i);
            if (v29
              && objc_msgSend( objc_msgSend((id)v3[381], "defaultManager"),  "fileExistsAtPath:",  objc_msgSend(v29, "path")))
            {
              uint64_t v41 = 0LL;
              v30 = objc_autoreleasePoolPush();
              if (qword_100219F60) {
                [(id)qword_100219F60 WFLog:4, "Will remove file at URL %@", v29 message];
              }
              objc_autoreleasePoolPop(v30);
              objc_msgSend( objc_msgSend((id)v3[381], "defaultManager"),  "removeItemAtPath:error:",  objc_msgSend(v29, "path"),  &v41);
              if (v41)
              {
                v31 = objc_autoreleasePoolPush();
                if (qword_100219F60) {
                  [(id)qword_100219F60 WFLog:4, "Failed to remove file at URL %@", v29 message];
                }
                objc_autoreleasePoolPop(v31);
              }
            }
          }

          id v26 = [v24 countByEnumeratingWithState:&v37 objects:v46 count:16];
        }

        while (v26);
      }
    }
  }

- (__WiFiNetwork)_copyCreateEquivalentWiFiNetwork:(id)a3 authFlags:(int64_t)a4
{
  if (!a3)
  {
    uint64_t v11 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: null ssid" message:3];
    }
    goto LABEL_17;
  }

  char v4 = a4;
  Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  if (!Mutable)
  {
    uint64_t v11 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: null networkRecord" message:3];
    }
LABEL_17:
    objc_autoreleasePoolPop(v11);
    return 0LL;
  }

  v7 = Mutable;
  CFDictionarySetValue(Mutable, @"SSID_STR", a3);
  v8 = (__WiFiNetwork *)sub_100094AAC((uint64_t)kCFAllocatorDefault, v7);
  id v9 = v8;
  if ((v4 & 8) != 0)
  {
    sub_100098A08((uint64_t)v8, 1);
  }

  else if ((v4 & 1) != 0)
  {
    sub_1000988D0((uint64_t)v8, 1);
  }

  else if ((v4 & 4) != 0)
  {
    sub_100096D18((int)v8, 1, v4 & 2);
  }

  else if ((v4 & 2) != 0)
  {
    sub_100096ED0((uint64_t)v8, 1);
  }

  sub_10009582C( (uint64_t)v9,  @"AP_MODE",  +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 2LL));
  CFRelease(v7);
  return v9;
}

- (void)getAdaptiveRoamParams:(__CFString *)a3 ssid:(__CFString *)a4
{
  v9[0] = 0LL;
  v9[1] = v9;
  v9[2] = 0x2020000000LL;
  v9[3] = 0LL;
  if (-[WiFiAnalyticsManager roamParamsQueryPending](self, "roamParamsQueryPending"))
  {
    v7 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: query already pending" message:4];
    }
    objc_autoreleasePoolPop(v7);
  }

  else
  {
    -[WiFiAnalyticsManager setRoamParamsQueryPending:](self, "setRoamParamsQueryPending:", 1LL);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000096AC;
    block[3] = &unk_1001E27A0;
    block[4] = self;
    block[5] = a3;
    block[6] = a4;
    block[7] = v9;
    dispatch_async((dispatch_queue_t)qword_100219F80, block);
  }

  _Block_object_dispose(v9, 8);
}

- (id)copyStoredNetworksAvailableAtLocationWithinDistanceInBand:(id)a3 distance:(double)a4 band:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  if (!-[WiFiAnalyticsManager deviceAnalyticsClient](self, "deviceAnalyticsClient"))
  {
    id v23 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"deviceAnalyticsClient is nil" message:4 "%s: deviceAnalyticsClient is nil" "-[WiFiAnalyticsManager copyStoredNetworksAvailableAtLocationWithinDistanceInBand:distance:band:]"];
    }
    goto LABEL_22;
  }

  if (!a3)
  {
    id v23 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: location is nil" message:4];
    }
LABEL_22:
    objc_autoreleasePoolPop(v23);
    id v10 = 0LL;
    return [v10 copy];
  }

  id v9 = -[WADeviceAnalyticsClient copyNetworksAvailableAtLocationWithinDistanceInBand:distance:band:]( -[WiFiAnalyticsManager deviceAnalyticsClient](self, "deviceAnalyticsClient"),  "copyNetworksAvailableAtLocationWithinDistanceInBand:distance:band:",  a3,  v5,  a4);
  if ([v9 count])
  {
    id v10 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    id v11 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v25;
      uint64_t v14 = WADeviceAnalyticsNetworkInfo[0];
      uint64_t v15 = WADeviceAnalyticsNetworkInfo[1];
      do
      {
        for (i = 0LL; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v25 != v13) {
            objc_enumerationMutation(v9);
          }
          v17 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)i);
          id v18 = [v17 objectForKey:v14];
          signed int v19 = objc_msgSend(objc_msgSend(v17, "objectForKey:", v15), "intValue");
          if (v18)
          {
            v20 = -[WiFiAnalyticsManager _copyCreateEquivalentWiFiNetwork:authFlags:]( self,  "_copyCreateEquivalentWiFiNetwork:authFlags:",  v18,  v19);
            if (v20)
            {
              v21 = v20;
              [v10 addObject:v20];
              CFRelease(v21);
            }
          }
        }

        id v12 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }

      while (v12);
    }
  }

  else
  {
    id v10 = 0LL;
  }

  return [v10 copy];
}

- (BOOL)copyHigherBandNetworksAvailableAtLocation:(id)a3 intoArray:(id *)a4
{
  if (!-[WiFiAnalyticsManager deviceAnalyticsClient](self, "deviceAnalyticsClient"))
  {
    id v12 = objc_autoreleasePoolPush();
    uint64_t v13 = (void *)qword_100219F60;
    if (!qword_100219F60) {
      goto LABEL_24;
    }
    uint64_t v14 = "%s: deviceAnalyticsClient is nil";
LABEL_17:
    uint64_t v15 = 4LL;
LABEL_23:
    objc_msgSend( v13,  "WFLog:message:",  v15,  v14,  "-[WiFiAnalyticsManager copyHigherBandNetworksAvailableAtLocation:intoArray:]");
    goto LABEL_24;
  }

  if (!a3)
  {
    id v12 = objc_autoreleasePoolPush();
    uint64_t v13 = (void *)qword_100219F60;
    if (!qword_100219F60) {
      goto LABEL_24;
    }
    uint64_t v14 = "%s: location is nil";
    goto LABEL_17;
  }

  id v7 = [a3 timestamp];
  if (!v7)
  {
    id v12 = objc_autoreleasePoolPush();
    uint64_t v13 = (void *)qword_100219F60;
    if (qword_100219F60)
    {
      uint64_t v14 = "%s: location timestamp is nil";
LABEL_22:
      uint64_t v15 = 3LL;
      goto LABEL_23;
    }

- (unint64_t)isWithin:(double)a3 fromLocation:(id)a4 forNetwork:(__WiFiNetwork *)a5
{
  if (-[WiFiAnalyticsManager deviceAnalyticsClient](self, "deviceAnalyticsClient"))
  {
    if (a4)
    {
      BOOL v9 = sub_100095BC8(a5);
      if (v9) {
        return (unint64_t)-[WADeviceAnalyticsClient isNetworkWithinRangeOfLocation:range:location:]( -[WiFiAnalyticsManager deviceAnalyticsClient](self, "deviceAnalyticsClient"),  "isNetworkWithinRangeOfLocation:range:location:",  v9,  a4,  a3);
      }
      double v10 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        [qword_100219F60 WFLog:@"ssid is nil" message:4 "-[WiFiAnalyticsManager isWithin:fromLocation:forNetwork:]"];
      }
    }

    else
    {
      double v10 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        [qword_100219F60 WFLog:@"%s: location is nil" message:4 "-[WiFiAnalyticsManager isWithin:fromLocation:forNetwork:]"];
      }
    }
  }

  else
  {
    double v10 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: deviceAnalyticsClient is nil" message:4];
    }
  }

  objc_autoreleasePoolPop(v10);
  return 0LL;
}

- (id)copyScoreSortedNetworksAvailableAtLocation:(id)a3
{
  if (!-[WiFiAnalyticsManager deviceAnalyticsClient](self, "deviceAnalyticsClient"))
  {
    v20 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: deviceAnalyticsClient is nil" message:4];
    }
    goto LABEL_25;
  }

  if (!a3)
  {
    v20 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: location is nil" message:4 "-[WiFiAnalyticsManager copyScoreSortedNetworksAvailableAtLocation:]"];
    }
LABEL_25:
    objc_autoreleasePoolPop(v20);
    id v6 = 0LL;
    return [v6 copy];
  }

  id v5 = -[WADeviceAnalyticsClient copyScoreSortedNetworksAvailableAtLocationWithinDistance:distance:authComparator:]( -[WiFiAnalyticsManager deviceAnalyticsClient](self, "deviceAnalyticsClient"),  "copyScoreSortedNetworksAvailableAtLocationWithinDistance:distance:authComparator:",  a3,  &stru_1001E27E0,  300.0);
  if ([v5 count])
  {
    id v6 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    id v7 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v22;
      uint64_t v10 = WADeviceAnalyticsNetworkInfo[0];
      uint64_t v11 = WADeviceAnalyticsNetworkInfo[1];
      do
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v22 != v9) {
            objc_enumerationMutation(v5);
          }
          uint64_t v13 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
          id v14 = [v13 objectForKey:v10];
          id v15 = [v13 objectForKey:v11];
          if (v14) {
            BOOL v16 = v15 == 0LL;
          }
          else {
            BOOL v16 = 1;
          }
          if (!v16)
          {
            v17 = -[WiFiAnalyticsManager _copyCreateEquivalentWiFiNetwork:authFlags:]( self,  "_copyCreateEquivalentWiFiNetwork:authFlags:",  v14,  v15);
            if (v17)
            {
              id v18 = v17;
              [v6 addObject:v17];
              CFRelease(v18);
            }
          }
        }

        id v8 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }

      while (v8);
    }
  }

  else
  {
    id v6 = 0LL;
  }

  return [v6 copy];
}

- (id)copyPreferenceScoreDictionaryForNetwork:(__WiFiNetwork *)a3
{
  id v5 = -[WiFiAnalyticsManager deviceAnalyticsClient](self, "deviceAnalyticsClient");
  if (a3 && v5 && (id v6 = sub_100095BC8(a3)) != 0LL) {
    return -[WADeviceAnalyticsClient copyPreferenceScoreDictionaryForNetwork:]( -[WiFiAnalyticsManager deviceAnalyticsClient](self, "deviceAnalyticsClient"),  "copyPreferenceScoreDictionaryForNetwork:",  v6);
  }
  else {
    return 0LL;
  }
}

- (unsigned)getColocatedStateFromPreferenceScoreDictionary:(id)a3
{
  uint64_t v4 = 0LL;
  unsigned int v5 = 0;
  do
  {
    value = 0LL;
    int valuePtr = -1;
    if (v4 <= 4)
    {
      id v6 = *(const void **)*(&off_1001E2850 + v4);
      if (v6)
      {
        CFDictionaryGetValueIfPresent((CFDictionaryRef)a3, v6, (const void **)&value);
        if (value)
        {
          CFNumberGetValue((CFNumberRef)value, kCFNumberIntType, &valuePtr);
        }
      }
    }

    ++v4;
  }

  while ((_DWORD)v4 != 5);
  return v5;
}

- (id)copyNetworksAvailableAtLocation:(id)a3
{
  if (-[WiFiAnalyticsManager deviceAnalyticsClient](self, "deviceAnalyticsClient"))
  {
    if (a3) {
      return -[WiFiAnalyticsManager copyStoredNetworksAvailableAtLocationWithinDistanceInBand:distance:band:]( self,  "copyStoredNetworksAvailableAtLocationWithinDistanceInBand:distance:band:",  a3,  0LL,  300.0);
    }
    id v6 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: location is nil" message:4 "-[WiFiAnalyticsManager copyNetworksAvailableAtLocation:]"];
    }
  }

  else
  {
    id v6 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: deviceAnalyticsClient is nil" message:4];
    }
  }

  objc_autoreleasePoolPop(v6);
  return 0LL;
}

- (id)copyGeoTagsForNetworkAtLocation:(__WiFiNetwork *)a3 location:(id)a4
{
  if (-[WiFiAnalyticsManager deviceAnalyticsClient](self, "deviceAnalyticsClient"))
  {
    if (a3)
    {
      if (a4)
      {
        id v7 = sub_100095BC8(a3);
        if (v7) {
          return -[WADeviceAnalyticsClient copyGeoTagsForNetwork:location:]( -[WiFiAnalyticsManager deviceAnalyticsClient](self, "deviceAnalyticsClient"),  "copyGeoTagsForNetwork:location:",  v7,  a4);
        }
        id v8 = objc_autoreleasePoolPush();
        if (qword_100219F60) {
          [qword_100219F60 WFLog:@"ssid is nil" message:4 "-[WiFiAnalyticsManager copyGeoTagsForNetworkAtLocation:location:]"];
        }
      }

      else
      {
        id v8 = objc_autoreleasePoolPush();
        if (qword_100219F60) {
          [qword_100219F60 WFLog:@"%s: location is nil" message:4 "-[WiFiAnalyticsManager copyGeoTagsForNetworkAtLocation:location:]"];
        }
      }
    }

    else
    {
      id v8 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        [qword_100219F60 WFLog:@"network is nil" message:4 "%s: network is nil" "-[WiFiAnalyticsManager copyGeoTagsForNetworkAtLocation:location:]"];
      }
    }
  }

  else
  {
    id v8 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: deviceAnalyticsClient is nil" message:4];
    }
  }

  objc_autoreleasePoolPop(v8);
  return 0LL;
}

- (void)updateNetworkTraitsCache
{
  v5[0] = 0LL;
  v5[1] = v5;
  v5[2] = 0x3052000000LL;
  v5[3] = sub_10000A560;
  v5[4] = sub_10000A570;
  v5[5] = self;
  if (!-[WiFiAnalyticsManager deviceAnalyticsClient](self, "deviceAnalyticsClient"))
  {
    v3 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: deviceAnalyticsClient is nil" message:4];
    }
    goto LABEL_9;
  }

  if (-[WiFiAnalyticsManager traitsCacheUpdateBusy](self, "traitsCacheUpdateBusy"))
  {
    v3 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  4,  "%s: cache updates already in progress",  "-[WiFiAnalyticsManager updateNetworkTraitsCache]");
    }
LABEL_9:
    objc_autoreleasePoolPop(v3);
    goto LABEL_4;
  }

  -[WiFiAnalyticsManager setTraitsCacheUpdateBusy:](self, "setTraitsCacheUpdateBusy:", 1LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000A57C;
  block[3] = &unk_1001E2808;
  block[4] = self;
  block[5] = v5;
  dispatch_async((dispatch_queue_t)qword_100219F80, block);
LABEL_4:
  _Block_object_dispose(v5, 8);
}

- (BOOL)isNetworkTraitsCacheValid
{
  if (!-[WiFiAnalyticsManager dateTraitCachesUpdated](self, "dateTraitCachesUpdated")) {
    goto LABEL_8;
  }
  -[NSDate timeIntervalSinceDate:]( +[NSDate date](&OBJC_CLASS___NSDate, "date"),  "timeIntervalSinceDate:",  -[WiFiAnalyticsManager dateTraitCachesUpdated](self, "dateTraitCachesUpdated"));
  double v4 = v3;
  unsigned int v5 = objc_autoreleasePoolPush();
  if (qword_100219F60)
  {
    id v6 = "No";
    if (v4 > 600.0) {
      id v6 = "Yes";
    }
    [(id)qword_100219F60 WFLog:3, "%s: Cache needs update: %s. Time difference %.2f", "-[WiFiAnalyticsManager isNetworkTraitsCacheValid]", v6, *(void *)&v4 message];
  }

  objc_autoreleasePoolPop(v5);
  if (v4 <= 600.0)
  {
    char v7 = 1;
  }

  else
  {
LABEL_8:
    -[WiFiAnalyticsManager updateNetworkTraitsCache](self, "updateNetworkTraitsCache");
    char v7 = 0;
  }

  return v7 & !-[WiFiAnalyticsManager traitsCacheUpdateBusy](self, "traitsCacheUpdateBusy");
}

- (BOOL)isMovingNetwork:(__WiFiNetwork *)a3
{
  if (!-[WiFiAnalyticsManager deviceAnalyticsClient](self, "deviceAnalyticsClient"))
  {
    char v7 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"deviceAnalyticsClient is nil" message:4 "%s: deviceAnalyticsClient is nil" "-[WiFiAnalyticsManager isMovingNetwork:]"];
    }
    goto LABEL_9;
  }

  if (!a3)
  {
    char v7 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"network is nil"];
    }
LABEL_9:
    objc_autoreleasePoolPop(v7);
    return 0;
  }

  unsigned int v5 = sub_100095BC8(a3);
  if (-[WiFiAnalyticsManager isNetworkTraitsCacheValid](self, "isNetworkTraitsCacheValid")) {
    return -[NSMutableArray containsObject:]( -[WiFiAnalyticsManager movingNetworkSsidsCache](self, "movingNetworkSsidsCache"),  "containsObject:",  v5);
  }
  return 0;
}

- (BOOL)isOmnipresentNetwork:(__WiFiNetwork *)a3
{
  if (!-[WiFiAnalyticsManager deviceAnalyticsClient](self, "deviceAnalyticsClient"))
  {
    char v7 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"deviceAnalyticsClient is nil" message:4 "%s: deviceAnalyticsClient is nil" "-[WiFiAnalyticsManager isOmnipresentNetwork:]"];
    }
    goto LABEL_9;
  }

  if (!a3)
  {
    char v7 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"network is nil" message:4 "%s: network is nil" "-[WiFiAnalyticsManager isOmnipresentNetwork:]"];
    }
LABEL_9:
    objc_autoreleasePoolPop(v7);
    return 0;
  }

  unsigned int v5 = sub_100095BC8(a3);
  if (-[WiFiAnalyticsManager isNetworkTraitsCacheValid](self, "isNetworkTraitsCacheValid")) {
    return -[NSMutableArray containsObject:]( -[WiFiAnalyticsManager omnipresentNetworkSsidsCache](self, "omnipresentNetworkSsidsCache"),  "containsObject:",  v5);
  }
  return 0;
}

- (BOOL)isHistoricallyBadLinkQualityNetwork:(__WiFiNetwork *)a3
{
  if (!-[WiFiAnalyticsManager deviceAnalyticsClient](self, "deviceAnalyticsClient"))
  {
    char v7 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: deviceAnalyticsClient is nil" message:4];
    }
    goto LABEL_9;
  }

  if (!a3)
  {
    char v7 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"network is nil" message:4 "%s: network is nil" -[WiFiAnalyticsManager isHistoricallyBadLinkQualityNetwork:]];
    }
LABEL_9:
    objc_autoreleasePoolPop(v7);
    return 0;
  }

  unsigned int v5 = sub_100095BC8(a3);
  if (-[WiFiAnalyticsManager isNetworkTraitsCacheValid](self, "isNetworkTraitsCacheValid")) {
    return -[NSMutableArray containsObject:]( -[WiFiAnalyticsManager historicallyBadLinkQualityNetworkSsidsCache]( self,  "historicallyBadLinkQualityNetworkSsidsCache"),  "containsObject:",  v5);
  }
  return 0;
}

- (id)copyAllStoredNetworkSsids
{
  if (-[WiFiAnalyticsManager deviceAnalyticsClient](self, "deviceAnalyticsClient")) {
    return -[WADeviceAnalyticsClient copyAllStoredNetworkSsids]( -[WiFiAnalyticsManager deviceAnalyticsClient](self, "deviceAnalyticsClient"),  "copyAllStoredNetworkSsids");
  }
  double v4 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  4,  "%s: deviceAnalyticsClient is nil",  "-[WiFiAnalyticsManager copyAllStoredNetworkSsids]");
  }
  objc_autoreleasePoolPop(v4);
  return 0LL;
}

- (id)copyAllStoredNetworkSsidsWithColocatedScopeId:(id)a3
{
  if (-[WiFiAnalyticsManager deviceAnalyticsClient](self, "deviceAnalyticsClient"))
  {
    if (a3) {
      return -[WADeviceAnalyticsClient copyAllStoredNetworkSsidsWithColocatedScopeId:]( -[WiFiAnalyticsManager deviceAnalyticsClient](self, "deviceAnalyticsClient"),  "copyAllStoredNetworkSsidsWithColocatedScopeId:",  a3);
    }
    id v6 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  4,  "%s: colocatedScopeIdStr is nil",  "-[WiFiAnalyticsManager copyAllStoredNetworkSsidsWithColocatedScopeId:]");
    }
  }

  else
  {
    id v6 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  4,  "%s: deviceAnalyticsClient is nil",  "-[WiFiAnalyticsManager copyAllStoredNetworkSsidsWithColocatedScopeId:]");
    }
  }

  objc_autoreleasePoolPop(v6);
  return 0LL;
}

- (id)copyColocatedScopeIdForNetwork:(__WiFiNetwork *)a3
{
  if (-[WiFiAnalyticsManager deviceAnalyticsClient](self, "deviceAnalyticsClient"))
  {
    unsigned int v5 = sub_100095BC8(a3);
    if (a3) {
      return -[WADeviceAnalyticsClient copyColocatedScopeIdForSsid:]( -[WiFiAnalyticsManager deviceAnalyticsClient](self, "deviceAnalyticsClient"),  "copyColocatedScopeIdForSsid:",  v5);
    }
    id v6 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"ssid is nil" message:4 "-[WiFiAnalyticsManager copyColocatedScopeIdForNetwork:]"];
    }
  }

  else
  {
    id v6 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: deviceAnalyticsClient is nil" message:4];
    }
  }

  objc_autoreleasePoolPop(v6);
  return 0LL;
}

- (__WiFiNetwork)copyColocatedScopeTransitionNetwork:(__WiFiNetwork *)a3 minRssi:(int)a4 maxRssi:(int)a5 band:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a4;
  if (!-[WiFiAnalyticsManager deviceAnalyticsClient](self, "deviceAnalyticsClient"))
  {
    __int128 v22 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: deviceAnalyticsClient is nil" message:4 v23 v24 v25 v26];
    }
    goto LABEL_23;
  }

  if (!a3)
  {
    __int128 v22 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: network is nil" message:4 v23 v24 v25 v26];
    }
    goto LABEL_23;
  }

  uint64_t v11 = sub_100095BC8(a3);
  id v12 = sub_1000951FC((uint64_t)a3, @"BSSID");
  if (!v12)
  {
    __int128 v22 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  4,  "%s: bssid is nil",  "-[WiFiAnalyticsManager copyColocatedScopeTransitionNetwork:minRssi:maxRssi:band:]",  v23,  v24,  v25,  v26);
    }
    goto LABEL_23;
  }

  uint64_t v13 = v12;
  id v14 = -[WADeviceAnalyticsClient copyColocatedScopeTransitionInfo:bssid:minRssi:maxRssi:band:]( -[WiFiAnalyticsManager deviceAnalyticsClient](self, "deviceAnalyticsClient"),  "copyColocatedScopeTransitionInfo:bssid:minRssi:maxRssi:band:",  v11,  v12,  v8,  v7,  v6);
  if (!v14)
  {
    __int128 v22 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [(id)qword_100219F60 WFLog:4 message:"%s: No transition info for %@[%@] in [%d,%d]",  "-[WiFiAnalyticsManager copyColocatedScopeTransitionNetwork:minRssi:maxRssi:band:]",  v11,  v13,  v7,  v8);
    }
LABEL_23:
    objc_autoreleasePoolPop(v22);
    return 0LL;
  }

  id v15 = v14;
  uint64_t v16 = WADeviceAnalyticsNetworkTransitionInfo[0];
  if ([v14 objectForKey:WADeviceAnalyticsNetworkTransitionInfo[0]])
  {
    uint64_t v17 = WADeviceAnalyticsNetworkTransitionInfo[1];
    if ([v15 objectForKey:v17])
    {
      uint64_t v18 = WADeviceAnalyticsNetworkTransitionInfo[2];
      if ([v15 objectForKey:v18])
      {
        if ([v15 objectForKey:v16]) {
          signed int v19 = -[WiFiAnalyticsManager _copyCreateEquivalentWiFiNetwork:authFlags:]( self,  "_copyCreateEquivalentWiFiNetwork:authFlags:",  [v15 objectForKey:v16],  (int)objc_msgSend(objc_msgSend(v15, "objectForKey:", v18), "intValue"));
        }
        else {
          signed int v19 = 0LL;
        }
        sub_10009582C((uint64_t)v19, @"BSSID", [v15 objectForKey:v17]);
        v20 = objc_autoreleasePoolPush();
        if (qword_100219F60) {
          [(id)qword_100219F60 WFLog:3, "%s: Received %@", "-[WiFiAnalyticsManager copyColocatedScopeTransitionNetwork:minRssi:maxRssi:band:]", v19 message];
        }
        goto LABEL_13;
      }

      v20 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        [(id)qword_100219F60 WFLog:4 message:"%s: No authFlags in transition info for %@[%@] in [%d,%d]",  "-[WiFiAnalyticsManager copyColocatedScopeTransitionNetwork:minRssi:maxRssi:band:]",  v11,  v13,  v8,  v7);
      }
    }

    else
    {
      v20 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        [(id)qword_100219F60 WFLog:4 message:"%s: No BSSID in transition info for %@[%@] in [%d,%d]",  "-[WiFiAnalyticsManager copyColocatedScopeTransitionNetwork:minRssi:maxRssi:band:]",  v11,  v13,  v8,  v7);
      }
    }
  }

  else
  {
    v20 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [(id)qword_100219F60 WFLog:4 message:"%s: No SSID in transition info for %@[%@] in [%d,%d]",  "-[WiFiAnalyticsManager copyColocatedScopeTransitionNetwork:minRssi:maxRssi:band:]",  v11,  v13,  v8,  v7);
    }
  }

  signed int v19 = 0LL;
LABEL_13:
  objc_autoreleasePoolPop(v20);
  CFRelease(v15);
  return v19;
}

- (id)getNetworkUsageDictionary:(__WiFiNetwork *)a3
{
  uint64_t v36 = 0LL;
  __int128 v37 = &v36;
  uint64_t v38 = 0x2020000000LL;
  char v39 = 0;
  uint64_t v32 = 0LL;
  v33 = &v32;
  uint64_t v34 = 0x2020000000LL;
  uint64_t v35 = 0LL;
  v31[0] = 0LL;
  v31[1] = v31;
  v31[2] = 0x2020000000LL;
  v31[3] = 0LL;
  uint64_t v25 = 0LL;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3052000000LL;
  v28 = sub_10000A560;
  v29 = sub_10000A570;
  uint64_t v30 = 0LL;
  uint64_t v19 = 0LL;
  v20 = &v19;
  uint64_t v21 = 0x3052000000LL;
  __int128 v22 = sub_10000A560;
  uint64_t v23 = sub_10000A570;
  uint64_t v24 = 0LL;
  if (!-[WiFiAnalyticsManager deviceAnalyticsClient](self, "deviceAnalyticsClient"))
  {
    uint64_t v17 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: deviceAnalyticsClient is nil" message:4];
    }
    goto LABEL_29;
  }

  if (!a3)
  {
    uint64_t v17 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"network is nil" message:4 "%s: network is nil" "-[WiFiAnalyticsManager getNetworkUsageDictionary:]"];
    }
    goto LABEL_29;
  }

  unsigned int v5 = sub_100095BC8(a3);
  if (!v5)
  {
    uint64_t v17 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: givenSsid is nil" message:4];
    }
LABEL_29:
    objc_autoreleasePoolPop(v17);
    goto LABEL_22;
  }

  id v6 = +[NSMutableIndexSet indexSet](&OBJC_CLASS___NSMutableIndexSet, "indexSet");
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10000B518;
  v18[3] = &unk_1001E2830;
  v18[6] = v31;
  v18[7] = &v32;
  v18[4] = v6;
  v18[5] = v5;
  v18[8] = &v19;
  v18[9] = &v36;
  v18[10] = &v25;
  -[NSMutableArray enumerateObjectsUsingBlock:]( -[WiFiAnalyticsManager usageCache](self, "usageCache"),  "enumerateObjectsUsingBlock:",  v18);
  if (!*((_BYTE *)v37 + 24))
  {
    id v7 = -[WADeviceAnalyticsClient copyNetworkUsageDictionary:]( -[WiFiAnalyticsManager deviceAnalyticsClient](self, "deviceAnalyticsClient"),  "copyNetworkUsageDictionary:",  sub_100095BC8(a3));
    v26[5] = (uint64_t)v7;
    if (v7)
    {
      v41[0] = v5;
      v40[0] = @"cachedSsid";
      v40[1] = @"cachedDate";
      uint64_t v8 = +[NSDate now](&OBJC_CLASS___NSDate, "now");
      v40[2] = @"cachedUsageDict";
      uint64_t v9 = v26[5];
      v41[1] = v8;
      v41[2] = v9;
      uint64_t v10 = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v41,  v40,  3LL);
      if ((unint64_t)-[NSMutableArray count](-[WiFiAnalyticsManager usageCache](self, "usageCache"), "count") >= 5)
      {
        if (([v6 containsIndex:v33[3]] & 1) == 0)
        {
          uint64_t v11 = objc_autoreleasePoolPush();
          if (qword_100219F60) {
            [(id)qword_100219F60 WFLog:3, "%s: Will remove object from usageCache for ssid %@", "-[WiFiAnalyticsManager getNetworkUsageDictionary:]", v20[5] message];
          }
          objc_autoreleasePoolPop(v11);
          [v6 addIndex:v33[3]];
        }

        if (![v6 count])
        {
          id v12 = objc_autoreleasePoolPush();
          if (qword_100219F60) {
            [qword_100219F60 WFLog:@"No objects to remove from full usageCache!?"];
          }
          objc_autoreleasePoolPop(v12);
        }

        if ([v6 count])
        {
          -[NSMutableArray removeObjectsAtIndexes:]( -[WiFiAnalyticsManager usageCache](self, "usageCache"),  "removeObjectsAtIndexes:",  v6);
          uint64_t v13 = objc_autoreleasePoolPush();
          if (qword_100219F60) {
            objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: Removed %u objects from usageCache. CurrSize: %u ",  "-[WiFiAnalyticsManager getNetworkUsageDictionary:]",  objc_msgSend(v6, "count"),  -[NSMutableArray count](-[WiFiAnalyticsManager usageCache](self, "usageCache"), "count"));
          }
          objc_autoreleasePoolPop(v13);
        }
      }

      -[NSMutableArray addObject:](-[WiFiAnalyticsManager usageCache](self, "usageCache"), "addObject:", v10);
      id v14 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        [(id)qword_100219F60 WFLog:3, "%s: Added usage for %@ to usageCache. CurrSize: %u", "-[WiFiAnalyticsManager getNetworkUsageDictionary:]", v5, -[NSMutableArray count](-[WiFiAnalyticsManager usageCache](self, "usageCache"), "count") message];
      }
      objc_autoreleasePoolPop(v14);
    }
  }

- (BOOL)roamParamsQueryPending
{
  return self->_roamParamsQueryPending;
}

- (void)setRoamParamsQueryPending:(BOOL)a3
{
  self->_roamParamsQueryPending = a3;
}

- (__WiFiManager)wifiManager
{
  return self->_wifiManager;
}

- (void)setWifiManager:(__WiFiManager *)a3
{
  self->_wifiManager = a3;
}

- (double)managerInitTime
{
  return self->_managerInitTime;
}

- (void)setManagerInitTime:(double)a3
{
  self->_managerInitTime = a3;
}

- (void)setDeviceAnalyticsClient:(id)a3
{
}

- (NSMutableArray)movingNetworkSsidsCache
{
  return self->_movingNetworkSsidsCache;
}

- (void)setMovingNetworkSsidsCache:(id)a3
{
}

- (NSMutableArray)omnipresentNetworkSsidsCache
{
  return self->_omnipresentNetworkSsidsCache;
}

- (void)setOmnipresentNetworkSsidsCache:(id)a3
{
}

- (NSMutableArray)historicallyBadLinkQualityNetworkSsidsCache
{
  return self->_historicallyBadLinkQualityNetworkSsidsCache;
}

- (void)setHistoricallyBadLinkQualityNetworkSsidsCache:(id)a3
{
}

- (NSMutableArray)usageCache
{
  return self->_usageCache;
}

- (void)setUsageCache:(id)a3
{
}

- (NSDate)dateTraitCachesUpdated
{
  return (NSDate *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setDateTraitCachesUpdated:(id)a3
{
}

- (BOOL)traitsCacheUpdateBusy
{
  return self->_traitsCacheUpdateBusy;
}

- (void)setTraitsCacheUpdateBusy:(BOOL)a3
{
  self->_traitsCacheUpdateBusy = a3;
}

@end