@interface BuddyWifiAutoJoiner
+ (id)_sharedInstance;
+ (void)beginAutojoiningWiFiNetworks;
+ (void)stopAutojoiningWiFiNetworks;
- (__CFArray)_copyAutoJoinableWiFiNetworks;
- (__WiFiNetwork)createNetworkWithSSID:(id)a3;
- (void)beginAutojoiningWiFiNetworks;
- (void)dealloc;
- (void)stopAutojoiningWiFiNetworks;
@end

@implementation BuddyWifiAutoJoiner

+ (id)_sharedInstance
{
  v3 = (void *)qword_1001098B8;
  if (!qword_1001098B8)
  {
    id v4 = objc_alloc_init((Class)a1);
    v5 = (void *)qword_1001098B8;
    qword_1001098B8 = (uint64_t)v4;

    v3 = (void *)qword_1001098B8;
  }

  return v3;
}

+ (void)beginAutojoiningWiFiNetworks
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([a1 _sharedInstance]);
  [v2 beginAutojoiningWiFiNetworks];
}

+ (void)stopAutojoiningWiFiNetworks
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([a1 _sharedInstance]);
  [v2 stopAutojoiningWiFiNetworks];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___BuddyWifiAutoJoiner;
  -[BuddyWifiAutoJoiner dealloc](&v3, "dealloc");
}

- (__WiFiNetwork)createNetworkWithSSID:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 dataUsingEncoding:4]);
  v9[0] = @"SSID_STR";
  v9[1] = @"SSID";
  v10[0] = v3;
  v10[1] = v4;
  v9[2] = @"AP_MODE";
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 2LL));
  v10[2] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  3LL));

  v7 = (__WiFiNetwork *)WiFiNetworkCreate(kCFAllocatorDefault, v6);
  return v7;
}

- (__CFArray)_copyAutoJoinableWiFiNetworks
{
  Mutable = CFArrayCreateMutable( kCFAllocatorDefault,  (CFIndex)[&off_1000D0FF8 count],  &kCFTypeArrayCallBacks);
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v4 = [&off_1000D0FF8 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      v7 = 0LL;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(&off_1000D0FF8);
        }
        v8 = -[BuddyWifiAutoJoiner createNetworkWithSSID:]( self,  "createNetworkWithSSID:",  *(void *)(*((void *)&v11 + 1) + 8LL * (void)v7));
        if (!v8) {
          sub_10007708C();
        }
        v9 = v8;
        CFArrayAppendValue(Mutable, v8);
        CFRelease(v9);
        v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [&off_1000D0FF8 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v5);
  }

  return Mutable;
}

- (void)beginAutojoiningWiFiNetworks
{
  if (self->_wifiManagerRef
    || (id v3 = (__WiFiManagerClient *)WiFiManagerClientCreate(kCFAllocatorDefault, 0LL),
        (self->_wifiManagerRef = v3) != 0LL))
  {
    id v4 = -[BuddyWifiAutoJoiner _copyAutoJoinableWiFiNetworks](self, "_copyAutoJoinableWiFiNetworks");
    if (v4)
    {
      id v5 = v4;
      if (CFArrayGetCount(v4))
      {
        unint64_t v6 = 0LL;
        do
        {
          ValueAtIndex = CFArrayGetValueAtIndex(v5, v6);
          WiFiManagerClientAddNetwork(self->_wifiManagerRef, ValueAtIndex);
          ++v6;
        }

        while (v6 < CFArrayGetCount(v5));
      }

      CFRelease(v5);
    }
  }

- (void)stopAutojoiningWiFiNetworks
{
  if (self->_wifiManagerRef)
  {
    id v3 = -[BuddyWifiAutoJoiner _copyAutoJoinableWiFiNetworks](self, "_copyAutoJoinableWiFiNetworks");
    if (v3)
    {
      id v4 = v3;
      if (CFArrayGetCount(v3))
      {
        unint64_t v5 = 0LL;
        do
        {
          ValueAtIndex = CFArrayGetValueAtIndex(v4, v5);
          WiFiNetworkDisableAutoJoinUntilFirstUserJoin(ValueAtIndex, 1LL);
          WiFiManagerClientUpdateNetwork(self->_wifiManagerRef, ValueAtIndex);
          ++v5;
        }

        while (v5 < CFArrayGetCount(v4));
      }

      CFRelease(v4);
    }

    CFRelease(self->_wifiManagerRef);
    self->_wifiManagerRef = 0LL;
  }

@end