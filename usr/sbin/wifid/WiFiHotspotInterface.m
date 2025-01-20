@interface WiFiHotspotInterface
- (BOOL)isScanning;
- (NSSet)networks;
- (OS_dispatch_queue)internalQueue;
- (SFRemoteHotspotSession)hotspotSession;
- (WiFiHotspotInterface)init;
- (id)copySortedHotspotDevicesByAutoPreferences;
- (id)getHotspotDeviceIdentifier:(id)a3;
- (id)getHotspotDeviceName:(id)a3;
- (id)hotspotUpdateNetworkcallback;
- (id)newHotspot:(id)a3 error:(id *)a4;
- (unsigned)isEqualHotspotDevices:(id)a3 compareTo:(id)a4;
- (unsigned)isEqualHotspotDevicesName:(id)a3 compareTo:(id)a4;
- (unsigned)isFamilyHotspot:(id)a3;
- (unsigned)isHotspotDeviceSupportADHS:(id)a3;
- (void)_stopBrowsingRemoveCache:(BOOL)a3;
- (void)callbackContext;
- (void)pauseBrowsing;
- (void)registerHotspotInterfaceUpdateNetworkCallback:(id)a3 withCallbackContext:(void *)a4;
- (void)session:(id)a3 updatedFoundDevices:(id)a4;
- (void)setCallbackContext:(void *)a3;
- (void)setHotspotSession:(id)a3;
- (void)setHotspotUpdateNetworkcallback:(id)a3;
- (void)setInternalQueue:(id)a3;
- (void)setNetworks:(id)a3;
- (void)setScanning:(BOOL)a3;
- (void)startBrowsing;
- (void)stopBrowsing;
- (void)updateNetworksWithHotspots:(id)a3;
@end

@implementation WiFiHotspotInterface

- (WiFiHotspotInterface)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___WiFiHotspotInterface;
  v2 = -[WiFiHotspotInterface init](&v11, "init");
  if (!v2)
  {
LABEL_10:
    v4 = 0LL;
LABEL_5:

    v2 = 0LL;
    goto LABEL_6;
  }

  v3 = objc_alloc_init(&OBJC_CLASS___SFRemoteHotspotSession);
  if (!v3)
  {
    v10 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [(id)qword_100219F60 WFLog:3 message:"failed to create SFRemoteHotspotSession"];
    }
    objc_autoreleasePoolPop(v10);
    goto LABEL_10;
  }

  v4 = v3;
  -[SFRemoteHotspotSession setDelegate:](v3, "setDelegate:", v2);
  objc_storeStrong((id *)&v2->_hotspotSession, v4);
  uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
  networks = v2->_networks;
  v2->_networks = (NSSet *)v5;

  if (!v2->_networks) {
    goto LABEL_5;
  }
  dispatch_queue_t v7 = dispatch_queue_create(0LL, 0LL);
  internalQueue = v2->_internalQueue;
  v2->_internalQueue = (OS_dispatch_queue *)v7;

LABEL_6:
  return v2;
}

- (void)updateNetworksWithHotspots:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_super v11 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue([v11 signalStrength]);
        id v13 = [v12 integerValue];

        if (v13) {
          [v5 addObject:v11];
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }

    while (v8);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiHotspotInterface networks](self, "networks"));
  unsigned __int8 v15 = [v5 isEqualToSet:v14];

  if ((v15 & 1) != 0)
  {
    v16 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [(id)qword_100219F60 WFLog:3 message:"Instant HS scan finished-> No new networks found."];
    }
  }

  else
  {
    -[WiFiHotspotInterface setNetworks:](self, "setNetworks:", v5);
    v16 = objc_autoreleasePoolPush();
    v17 = (void *)qword_100219F60;
    if (qword_100219F60)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiHotspotInterface networks](self, "networks"));
      [v17 WFLog:3, "networks found %@\n", v18 message];
    }
  }

  objc_autoreleasePoolPop(v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiHotspotInterface hotspotUpdateNetworkcallback](self, "hotspotUpdateNetworkcallback"));

  if (v19)
  {
    v20 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue( -[WiFiHotspotInterface hotspotUpdateNetworkcallback]( self,  "hotspotUpdateNetworkcallback"));
    ((void (**)(void, uint64_t, void *))v20)[2]( v20,  1LL,  -[WiFiHotspotInterface callbackContext](self, "callbackContext"));
  }
}

- (id)copySortedHotspotDevicesByAutoPreferences
{
  v3 = -[NSSortDescriptor initWithKey:ascending:comparator:]( objc_alloc(&OBJC_CLASS___NSSortDescriptor),  "initWithKey:ascending:comparator:",  @"self",  0LL,  &stru_1001E6620);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiHotspotInterface networks](self, "networks"));
  uint64_t v9 = v3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 sortedArrayUsingDescriptors:v5]);

  id v7 = [v6 copy];
  return v7;
}

- (id)newHotspot:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (v6)
  {
    uint64_t v36 = 0LL;
    v37 = &v36;
    uint64_t v38 = 0x3032000000LL;
    v39 = sub_10013AB08;
    v40 = sub_10013AB18;
    id v41 = 0LL;
    uint64_t v30 = 0LL;
    v31 = &v30;
    uint64_t v32 = 0x3032000000LL;
    v33 = sub_10013AB08;
    v34 = sub_10013AB18;
    id v35 = 0LL;
    id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    dispatch_semaphore_t v8 = dispatch_semaphore_create(0LL);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiHotspotInterface hotspotSession](self, "hotspotSession"));
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_10013AB20;
    v26[3] = &unk_1001E6648;
    v28 = &v30;
    v29 = &v36;
    v10 = v8;
    v27 = v10;
    [v9 enableRemoteHotspotForDevice:v6 withCompletionHandler:v26];

    dispatch_time_t v11 = dispatch_time(0LL, 60000000000LL);
    if (dispatch_semaphore_wait(v10, v11))
    {
      v12 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: Enable Remote Hotspot Timeout",  "-[WiFiHotspotInterface newHotspot:error:]");
      }
      objc_autoreleasePoolPop(v12);
      id v13 = objc_alloc(&OBJC_CLASS___NSError);
      NSErrorUserInfoKey v42 = NSLocalizedDescriptionKey;
      v43 = @"Enable Remote Hotspot Timeout";
      v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v43,  &v42,  1LL));
      unsigned __int8 v15 = -[NSError initWithDomain:code:userInfo:]( v13,  "initWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  -6722LL,  v14);
      v16 = (void *)v31[5];
      v31[5] = (uint64_t)v15;
    }

    if (a4 && (v17 = (void *)v31[5]) != 0LL)
    {
      *a4 = [v17 copy];
    }

    else
    {
      v20 = (void *)v37[5];
      if (v20)
      {
        __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v20 name]);
        -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v21, @"ssid");

        __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([(id)v37[5] password]);
        -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v22, @"password");

        __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([(id)v37[5] channel]);
        -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v23, @"channel");
      }

      __int128 v24 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        [(id)qword_100219F60 WFLog:3 message:"Started Hotspot"];
      }
      objc_autoreleasePoolPop(v24);
    }

    id v19 = -[NSMutableDictionary copy](v7, "copy");

    _Block_object_dispose(&v30, 8);
    _Block_object_dispose(&v36, 8);
  }

  else
  {
    v18 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend((id)qword_100219F60, "WFLog:message:", 3, "Cannot enable hotspot, missing SFRemoteHotspotDevice");
    }
    objc_autoreleasePoolPop(v18);
    id v19 = 0LL;
  }

  return v19;
}

- (BOOL)isScanning
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = -86;
  internalQueue = (dispatch_queue_s *)self->_internalQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10013AC3C;
  v5[3] = &unk_1001E5E20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)startBrowsing
{
  if (!-[WiFiHotspotInterface isScanning](self, "isScanning"))
  {
    char v3 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [(id)qword_100219F60 WFLog:3 message:"Starting hotspot browsing"];
    }
    objc_autoreleasePoolPop(v3);
    internalQueue = (dispatch_queue_s *)self->_internalQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10013ACE8;
    block[3] = &unk_1001E2520;
    block[4] = self;
    dispatch_sync(internalQueue, block);
  }

- (void)stopBrowsing
{
}

- (void)pauseBrowsing
{
}

- (void)_stopBrowsingRemoveCache:(BOOL)a3
{
  internalQueue = (dispatch_queue_s *)self->_internalQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10013AD90;
  v4[3] = &unk_1001E6670;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(internalQueue, v4);
}

- (id)getHotspotDeviceName:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 deviceName]);
  id v5 = [v4 length];

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 deviceName]);
  if ((unint64_t)v5 >= 0x21)
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 substringToIndex:30]);

    uint64_t v6 = (void *)v7;
  }

  return v6;
}

- (id)getHotspotDeviceIdentifier:(id)a3
{
  return [a3 deviceIdentifier];
}

- (unsigned)isEqualHotspotDevices:(id)a3 compareTo:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 deviceName]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 deviceName]);
  if ([v7 isEqualToString:v8])
  {
    char v9 = (void *)objc_claimAutoreleasedReturnValue([v5 deviceIdentifier]);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v6 deviceIdentifier]);
    unsigned __int8 v11 = [v9 isEqualToString:v10];
  }

  else
  {

    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (unsigned)isEqualHotspotDevicesName:(id)a3 compareTo:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a3 deviceName]);
  unsigned __int8 v7 = [v6 isEqualToString:v5];

  return v7;
}

- (unsigned)isFamilyHotspot:(id)a3
{
  return [a3 group] == (id)2;
}

- (unsigned)isHotspotDeviceSupportADHS:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  @"iPad3,4",  @"iPad3,5",  @"iPad3,6",  @"iPad4,1",  @"iPad4,2",  @"iPad4,3",  @"iPad4,4",  @"iPad4,5",  @"iPad4,6",  @"iPad4,7",  @"iPad4,8",  @"iPad4,9",  @"iPad5,1",  @"iPad5,2",  @"iPad5,3",  @"iPad5,4",  @"iPad6,11",  @"iPad6,11",  @"iPad6,12",  @"iPad6,12",  @"iPad6,3",  @"iPad6,4",  @"iPad6,7",  @"iPad6,8",  @"iPad7,1",  @"iPad7,10",  @"iPad7,11",  @"iPad7,12",  @"iPad7,2",  @"iPad7,3",  @"iPad7,4",  @"iPad7,5",  @"iPad7,6",  @"iPad7,7",  @"iPad7,8",  @"iPad7,9",  @"iPad11,6",  @"iPad11,7",  @"iPad12,1",  @"iPad12,2",  @"iPhone5,1",  @"iPhone5,2",  @"iPhone5,3",  @"iPhone5,4",  @"iPhone6,1",  @"iPhone6,2",
                   @"iPhone7,1",
                   @"iPhone7,2",
                   @"iPhone8,1",
                   @"iPhone8,1",
                   @"iPhone8,2",
                   @"iPhone8,2",
                   @"iPhone8,4",
                   @"iPhone8,4",
                   @"iPhone9,1",
                   @"iPhone9,2",
                   @"iPhone9,3",
                   @"iPhone9,4",
                   0LL));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 model]);
  if ([v4 containsObject:v5])
  {

LABEL_5:
    unsigned __int8 v7 = 0;
    goto LABEL_6;
  }

  unsigned __int8 v6 = [v3 osSupportsAutoHotspot];

  if ((v6 & 1) == 0) {
    goto LABEL_5;
  }
  unsigned __int8 v7 = 1;
LABEL_6:

  return v7;
}

- (void)registerHotspotInterfaceUpdateNetworkCallback:(id)a3 withCallbackContext:(void *)a4
{
  id v9 = a3;
  unsigned __int8 v6 = objc_autoreleasePoolPush();
  unsigned __int8 v7 = (void *)qword_100219F60;
  if (qword_100219F60)
  {
    id v8 = objc_retainBlock(v9);
    [v7 WFLog:3, "%s: callback %@, context %@", "-[WiFiHotspotInterface registerHotspotInterfaceUpdateNetworkCallback:withCallbackContext:]", v8, a4 message];
  }

  objc_autoreleasePoolPop(v6);
  -[WiFiHotspotInterface setHotspotUpdateNetworkcallback:](self, "setHotspotUpdateNetworkcallback:", v9);
  -[WiFiHotspotInterface setCallbackContext:](self, "setCallbackContext:", a4);
}

- (void)session:(id)a3 updatedFoundDevices:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  unsigned __int8 v7 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    [(id)qword_100219F60 WFLog:3, "Found hotspots %@", v6, v9 message];
  }
  objc_autoreleasePoolPop(v7);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  [v8 addObjectsFromArray:v6];
  -[WiFiHotspotInterface updateNetworksWithHotspots:](self, "updateNetworksWithHotspots:", v8);
}

- (NSSet)networks
{
  return (NSSet *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setNetworks:(id)a3
{
}

- (void)setScanning:(BOOL)a3
{
  self->_scanning = a3;
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void)setInternalQueue:(id)a3
{
}

- (SFRemoteHotspotSession)hotspotSession
{
  return (SFRemoteHotspotSession *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setHotspotSession:(id)a3
{
}

- (void)callbackContext
{
  return self->_callbackContext;
}

- (void)setCallbackContext:(void *)a3
{
  self->_callbackContext = a3;
}

- (id)hotspotUpdateNetworkcallback
{
  return self->_hotspotUpdateNetworkcallback;
}

- (void)setHotspotUpdateNetworkcallback:(id)a3
{
}

- (void).cxx_destruct
{
}

@end