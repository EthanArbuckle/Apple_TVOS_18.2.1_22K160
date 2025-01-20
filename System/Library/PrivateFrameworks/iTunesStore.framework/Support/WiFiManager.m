@interface WiFiManager
+ (id)sharedWiFiManager;
- (NSString)IPAddress;
- (WiFiManager)init;
- (id)_wifiInterfaceName;
- (int)clientType;
- (int64_t)_wifiClientTypeForManagerType:(int)a3;
- (void)_wifiClient;
- (void)dealloc;
- (void)setClientType:(int)a3;
@end

@implementation WiFiManager

- (WiFiManager)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___WiFiManager;
  v2 = -[WiFiManager init](&v4, "init");
  if (v2) {
    v2->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.itunesstored.WiFiManager", 0LL);
  }
  return v2;
}

- (void)dealloc
{
  dispatchQueue = (dispatch_object_s *)self->_dispatchQueue;
  if (dispatchQueue) {
    dispatch_release(dispatchQueue);
  }
  wifiClient = self->_wifiClient;
  if (wifiClient) {
    CFRelease(wifiClient);
  }
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___WiFiManager;
  -[WiFiManager dealloc](&v5, "dealloc");
}

+ (id)sharedWiFiManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100175084;
  block[3] = &unk_10034AE98;
  block[4] = a1;
  if (qword_1003A3598 != -1) {
    dispatch_once(&qword_1003A3598, block);
  }
  return (id)qword_1003A3590;
}

- (int)clientType
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100175130;
  v5[3] = &unk_10034B2D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSString)IPAddress
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3052000000LL;
  v9 = sub_100175208;
  v10 = sub_100175218;
  uint64_t v11 = 0LL;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100175224;
  v5[3] = &unk_10034DC10;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  int v3 = (NSString *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setClientType:(int)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100175374;
  v4[3] = &unk_100350550;
  v4[4] = self;
  int v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)_wifiClient
{
  result = self->_wifiClient;
  if (!result)
  {
    int64_t v4 = -[WiFiManager _wifiClientTypeForManagerType:]( self,  "_wifiClientTypeForManagerType:",  self->_clientType);
    result = (void *)WiFiManagerClientCreate(0LL, v4, v5);
    self->_wifiClient = (__WiFiManagerClient *)result;
  }

  return result;
}

- (int64_t)_wifiClientTypeForManagerType:(int)a3
{
  return a3 == 2;
}

- (id)_wifiInterfaceName
{
  if (-[WiFiManager _wifiClient](self, "_wifiClient")
    && (v2 = (const __CFArray *)WiFiManagerClientCopyDevices()) != 0LL)
  {
    int v3 = v2;
    if (CFArrayGetCount(v2) < 1)
    {
      id v5 = 0LL;
    }

    else
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v3, 0LL);
      id v5 = (id)WiFiDeviceClientGetInterfaceName(ValueAtIndex);
    }

    CFRelease(v3);
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

@end