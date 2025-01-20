@interface BTAudioSmartRouteManager
+ (id)sharedInstance;
- (BTAudioSmartRouteManager)init;
- (id).cxx_construct;
- (id)registerDevice:(unsigned int)a3 deviceAddr:(id)a4;
- (id)unRegisterDevice:(id)a3;
- (unsigned)activeClientCount;
- (void)dealloc;
- (void)startIO:(id)a3 bundleID:(id)a4 isInput:(BOOL)a5 notifyMode:(int *)a6;
- (void)stopIO:(id)a3 bundleID:(id)a4 isInput:(BOOL)a5;
@end

@implementation BTAudioSmartRouteManager

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___BTAudioSmartRouteManager;
  -[BTAudioSmartRouteManager dealloc](&v3, "dealloc");
}

- (BTAudioSmartRouteManager)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___BTAudioSmartRouteManager;
  v2 = -[BTAudioSmartRouteManager init](&v4, "init");
  v2->_btAudioDeviceDict = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  2LL);
  return v2;
}

+ (id)sharedInstance
{
  id result = (id)qword_95A78;
  if (!qword_95A78)
  {
    id result = objc_alloc_init(&OBJC_CLASS___BTAudioSmartRouteManager);
    qword_95A78 = (uint64_t)result;
  }

  return result;
}

- (id)registerDevice:(unsigned int)a3 deviceAddr:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  v7 = (BTAudioSmartRouteDevice *)-[NSMutableDictionary objectForKey:](self->_btAudioDeviceDict, "objectForKey:", a4);
  if (!v7)
  {
    v8 = (os_log_s *)qword_95A70;
    if (os_log_type_enabled((os_log_t)qword_95A70, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412546;
      id v11 = a4;
      __int16 v12 = 1024;
      int v13 = v5;
      _os_log_impl( &dword_0,  v8,  OS_LOG_TYPE_DEFAULT,  "Create Smart Route Manager Entry for %@ Device ID %d: ",  (uint8_t *)&v10,  0x12u);
    }

    v7 = -[BTAudioSmartRouteDevice initWithBluetoothInfo:deviceAddr:]( objc_alloc(&OBJC_CLASS___BTAudioSmartRouteDevice),  "initWithBluetoothInfo:deviceAddr:",  v5,  a4);
    -[NSMutableDictionary setObject:forKey:](self->_btAudioDeviceDict, "setObject:forKey:", v7, a4);
  }

  return v7;
}

- (id)unRegisterDevice:(id)a3
{
  id v5 = -[NSMutableDictionary objectForKey:](self->_btAudioDeviceDict, "objectForKey:");
  if (v5)
  {
    v6 = v5;
    -[NSMutableDictionary removeObjectForKey:](self->_btAudioDeviceDict, "removeObjectForKey:", a3);
    v7 = (os_log_s *)qword_95A70;
    if (os_log_type_enabled((os_log_t)qword_95A70, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412546;
      id v10 = a3;
      __int16 v11 = 1024;
      unsigned int v12 = [v6 retainCount];
      _os_log_impl( &dword_0,  v7,  OS_LOG_TYPE_DEFAULT,  "Release Smart Route Manager Entry for %@ %d",  (uint8_t *)&v9,  0x12u);
    }
  }

  return 0LL;
}

- (void)startIO:(id)a3 bundleID:(id)a4 isInput:(BOOL)a5 notifyMode:(int *)a6
{
  BOOL v7 = a5;
  __int16 v11 = (os_log_s *)qword_95A70;
  if (os_log_type_enabled((os_log_t)qword_95A70, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412546;
    id v14 = a4;
    __int16 v15 = 1024;
    BOOL v16 = v7;
    _os_log_impl( &dword_0,  v11,  OS_LOG_TYPE_DEFAULT,  "Smart Route Manager StartIO:  %@ Device ID %d: ",  (uint8_t *)&v13,  0x12u);
  }

  id v12 = -[NSMutableDictionary objectForKey:](self->_btAudioDeviceDict, "objectForKey:", a3);
  if (v12) {
    [v12 updateSession:a4 isStart:1 isInput:v7];
  }
  *a6 = 2;
}

- (void)stopIO:(id)a3 bundleID:(id)a4 isInput:(BOOL)a5
{
  BOOL v5 = a5;
  int v9 = (os_log_s *)qword_95A70;
  if (os_log_type_enabled((os_log_t)qword_95A70, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = a4;
    __int16 v13 = 1024;
    BOOL v14 = v5;
    _os_log_impl( &dword_0,  v9,  OS_LOG_TYPE_DEFAULT,  "Smart Route Manager StopIO:  %@ Device ID %d: ",  (uint8_t *)&v11,  0x12u);
  }

  id v10 = -[NSMutableDictionary objectForKey:](self->_btAudioDeviceDict, "objectForKey:", a3);
  if (v10) {
    [v10 updateSession:a4 isStart:0 isInput:v5];
  }
}

- (unsigned)activeClientCount
{
  return self->_activeClientCount;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  return self;
}

@end