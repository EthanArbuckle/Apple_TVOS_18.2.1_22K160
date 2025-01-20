@interface OTDeviceInformationActualAdapter
- (BOOL)isAppleTV;
- (BOOL)isHomePod;
- (BOOL)isMachineIDOverridden;
- (BOOL)isWatch;
- (CKKSListenerCollection)deviceNameUpdateListeners;
- (NSString)overriddenMachineID;
- (__SCDynamicStore)store;
- (id)deviceName;
- (id)modelID;
- (id)osVersion;
- (id)serialNumber;
- (void)clearOverride;
- (void)dealloc;
- (void)registerForDeviceNameUpdates:(id)a3;
- (void)setDeviceNameUpdateListeners:(id)a3;
- (void)setOverriddenMachineID:(id)a3;
- (void)setStore:(__SCDynamicStore *)a3;
- (void)setupDeviceNameListener;
@end

@implementation OTDeviceInformationActualAdapter

- (void)dealloc
{
  if (-[OTDeviceInformationActualAdapter store](self, "store"))
  {
    CFRelease(-[OTDeviceInformationActualAdapter store](self, "store"));
    -[OTDeviceInformationActualAdapter setStore:](self, "setStore:", 0LL);
  }

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___OTDeviceInformationActualAdapter;
  -[OTDeviceInformationActualAdapter dealloc](&v3, "dealloc");
}

- (BOOL)isMachineIDOverridden
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[OTDeviceInformationActualAdapter overriddenMachineID](self, "overriddenMachineID"));
  BOOL v3 = v2 != 0LL;

  return v3;
}

- (void)clearOverride
{
}

- (id)modelID
{
  if (qword_1002DE850 != -1) {
    dispatch_once(&qword_1002DE850, &stru_100283C60);
  }
  return (id)qword_1002DE848;
}

- (id)deviceName
{
  else {
    v2 = 0LL;
  }
  return v2;
}

- (void)registerForDeviceNameUpdates:(id)a3
{
  id v7 = a3;
  if (SecIsInternalRelease(v7, v4))
  {
    v5 = self;
    objc_sync_enter(v5);
    -[OTDeviceInformationActualAdapter setupDeviceNameListener](v5, "setupDeviceNameListener");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[OTDeviceInformationActualAdapter deviceNameUpdateListeners](v5, "deviceNameUpdateListeners"));
    [v6 registerListener:v7];

    objc_sync_exit(v5);
  }
}

- (id)serialNumber
{
  int v8 = 0;
  v2 = (void *)MGCopyAnswerWithError(@"SerialNumber", 0LL, &v8);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSString, v3);
  if ((objc_opt_isKindOfClass(v2, v4) & 1) == 0)
  {

    v5 = sub_10001267C("octagon");
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v10 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "failed getting serial number: %d", buf, 8u);
    }

    v2 = 0LL;
  }

  return v2;
}

- (BOOL)isHomePod
{
  return MGGetSInt32Answer(@"DeviceClassNumber", 0xFFFFFFFFLL) == 7;
}

- (BOOL)isAppleTV
{
  return MGGetSInt32Answer(@"DeviceClassNumber", 0xFFFFFFFFLL) == 4;
}

- (BOOL)isWatch
{
  return 0;
}

- (void)setupDeviceNameListener
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[OTDeviceInformationActualAdapter deviceNameUpdateListeners](self, "deviceNameUpdateListeners"));

  if (!v3)
  {
    uint64_t v4 = -[CKKSListenerCollection initWithName:]( objc_alloc(&OBJC_CLASS___CKKSListenerCollection),  "initWithName:",  @"OTDeviceInformationActualAdapter");
    -[OTDeviceInformationActualAdapter setDeviceNameUpdateListeners:](self, "setDeviceNameUpdateListeners:", v4);

    CFStringRef ComputerName = SCDynamicStoreKeyCreateComputerName(0LL);
    if (ComputerName)
    {
      CFStringRef v6 = ComputerName;
      CFStringRef v12 = ComputerName;
      id v7 = (const __CFArray *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v12,  1LL));
      CFRelease(v6);
      v11.version = 0LL;
      memset(&v11.retain, 0, 24);
      v11.info = self;
      -[OTDeviceInformationActualAdapter setStore:]( self,  "setStore:",  SCDynamicStoreCreate( 0LL,  @"OTDeviceInformationActualAdapter",  (SCDynamicStoreCallBack)sub_100035418,  &v11));
      if (-[OTDeviceInformationActualAdapter store](self, "store"))
      {
        SCDynamicStoreSetNotificationKeys(-[OTDeviceInformationActualAdapter store](self, "store"), v7, 0LL);
        int v8 = -[OTDeviceInformationActualAdapter store](self, "store");
        dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
        int v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
        SCDynamicStoreSetDispatchQueue(v8, v10);
      }
    }
  }

- (CKKSListenerCollection)deviceNameUpdateListeners
{
  return (CKKSListenerCollection *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setDeviceNameUpdateListeners:(id)a3
{
}

- (__SCDynamicStore)store
{
  return self->_store;
}

- (void)setStore:(__SCDynamicStore *)a3
{
  self->_store = a3;
}

- (NSString)overriddenMachineID
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setOverriddenMachineID:(id)a3
{
}

- (void).cxx_destruct
{
}

- (id)osVersion
{
  *(void *)&__int128 v0 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v0 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v12[14] = v0;
  __int128 v13 = v0;
  v12[12] = v0;
  v12[13] = v0;
  v12[10] = v0;
  v12[11] = v0;
  v12[8] = v0;
  v12[9] = v0;
  v12[6] = v0;
  v12[7] = v0;
  v12[4] = v0;
  v12[5] = v0;
  v12[2] = v0;
  v12[3] = v0;
  v12[0] = v0;
  v12[1] = v0;
  size_t v9 = 256LL;
  int v1 = sysctlbyname("kern.osrelease", v12, &v9, 0LL, 0LL);
  *(void *)&__int128 v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v10[14] = v2;
  __int128 v11 = v2;
  v10[12] = v2;
  v10[13] = v2;
  v10[10] = v2;
  v10[11] = v2;
  v10[8] = v2;
  v10[9] = v2;
  v10[6] = v2;
  v10[7] = v2;
  v10[4] = v2;
  v10[5] = v2;
  v10[2] = v2;
  v10[3] = v2;
  v10[0] = v2;
  v10[1] = v2;
  size_t v8 = 256LL;
  if (sysctlbyname("kern.osversion", v10, &v8, 0LL, 0LL) | v1
    || (HIBYTE(v13) = 0,
        HIBYTE(v11) = 0,
        (v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s (%s)",  v12,  v10))) == 0LL))
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 operatingSystemVersionString]);

    v5 = (void *)objc_claimAutoreleasedReturnValue( [v4 stringByReplacingOccurrencesOfString:@"Version" withString:&stru_100294B48]);
  }

  CFStringRef v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@",  @"tv",  v5));

  return v6;
}

@end