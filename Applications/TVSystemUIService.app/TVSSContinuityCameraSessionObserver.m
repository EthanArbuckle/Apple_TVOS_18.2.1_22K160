@interface TVSSContinuityCameraSessionObserver
+ (TVSSContinuityCameraSessionObserver)sharedInstance;
- (AVCaptureDevice)continuityCaptureDevice;
- (AVCaptureDeviceDiscoverySession)captureDiscoverySession;
- (NSString)connectedDeviceName;
- (RPRemoteDisplayDiscovery)remoteDisplayDiscovery;
- (TVSObserverSet)observerSet;
- (TVSSContinuityCameraSessionObserver)init;
- (void)activateRemoteDisplayDiscovery;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setCaptureDiscoverySession:(id)a3;
- (void)setRemoteDisplayDiscovery:(id)a3;
@end

@implementation TVSSContinuityCameraSessionObserver

+ (TVSSContinuityCameraSessionObserver)sharedInstance
{
  id v10 = a1;
  SEL v9 = a2;
  obj = _NSConcreteStackBlock;
  int v4 = -1073741824;
  int v5 = 0;
  v6 = sub_10001A7F8;
  v7 = &unk_1001B6430;
  id v8 = a1;
  v12 = (dispatch_once_t *)&unk_100221908;
  id location = 0LL;
  objc_storeStrong(&location, &obj);
  if (*v12 != -1) {
    dispatch_once(v12, location);
  }
  objc_storeStrong(&location, 0LL);
  return (TVSSContinuityCameraSessionObserver *)(id)qword_100221900;
}

- (TVSSContinuityCameraSessionObserver)init
{
  SEL v10 = a2;
  v11 = 0LL;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVSSContinuityCameraSessionObserver;
  v11 = -[TVSSContinuityCameraSessionObserver init](&v9, "init");
  objc_storeStrong((id *)&v11, v11);
  if (v11)
  {
    v2 = objc_alloc_init(&OBJC_CLASS___RPRemoteDisplayDiscovery);
    remoteDisplayDiscovery = v11->_remoteDisplayDiscovery;
    v11->_remoteDisplayDiscovery = v2;

    -[RPRemoteDisplayDiscovery setDiscoveryFlags:]( v11->_remoteDisplayDiscovery,  "setDiscoveryFlags:",  (unint64_t)-[RPRemoteDisplayDiscovery discoveryFlags](v11->_remoteDisplayDiscovery, "discoveryFlags") | 3);
    AVCaptureDeviceType v12 = AVCaptureDeviceTypeContinuityCamera;
    id v8 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v12, 1LL);
    int v4 =  +[AVCaptureDeviceDiscoverySession discoverySessionWithDeviceTypes:mediaType:position:]( &OBJC_CLASS___AVCaptureDeviceDiscoverySession,  "discoverySessionWithDeviceTypes:mediaType:position:");
    captureDiscoverySession = v11->_captureDiscoverySession;
    v11->_captureDiscoverySession = v4;

    -[TVSSContinuityCameraSessionObserver activateRemoteDisplayDiscovery](v11, "activateRemoteDisplayDiscovery");
    -[AVCaptureDeviceDiscoverySession addObserver:forKeyPath:options:context:]( v11->_captureDiscoverySession,  "addObserver:forKeyPath:options:context:",  v11,  @"devices",  5LL,  off_10021EB78);
  }

  v7 = v11;
  objc_storeStrong((id *)&v11, 0LL);
  return v7;
}

- (void)dealloc
{
  int v4 = self;
  SEL v3 = a2;
  -[RPRemoteDisplayDiscovery invalidate](self->_remoteDisplayDiscovery, "invalidate");
  -[AVCaptureDeviceDiscoverySession removeObserver:forKeyPath:context:]( v4->_captureDiscoverySession,  "removeObserver:forKeyPath:context:",  v4,  @"devices",  off_10021EB78);
  v2.receiver = v4;
  v2.super_class = (Class)&OBJC_CLASS___TVSSContinuityCameraSessionObserver;
  -[TVSSContinuityCameraSessionObserver dealloc](&v2, "dealloc");
}

- (void)activateRemoteDisplayDiscovery
{
  AVCaptureDeviceType v12 = self;
  location[1] = (id)a2;
  location[0] = VideoMicBackingStoreLog();
  os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    sub_10001AC54((uint64_t)v13, (uint64_t)v12->_remoteDisplayDiscovery);
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)location[0],  v10,  "Activating remote display disovery state for %p",  v13,  0xCu);
  }

  objc_storeStrong(location, 0LL);
  objc_initWeak(&from, v12);
  remoteDisplayDiscovery = v12->_remoteDisplayDiscovery;
  SEL v3 = _NSConcreteStackBlock;
  int v4 = -1073741824;
  int v5 = 0;
  v6 = sub_10001AC8C;
  v7 = &unk_1001B6580;
  objc_copyWeak(&v8, &from);
  -[RPRemoteDisplayDiscovery activateWithCompletion:](remoteDisplayDiscovery, "activateWithCompletion:", &v3);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&from);
}

- (NSString)connectedDeviceName
{
  v16 = self;
  location[1] = (id)a2;
  location[0] =  -[RPRemoteDisplayDiscovery peerDeviceIdentifier]( self->_remoteDisplayDiscovery,  "peerDeviceIdentifier");
  if (location[0])
  {
    memset(__b, 0, sizeof(__b));
    id obj = -[RPRemoteDisplayDiscovery discoveredDevices](v16->_remoteDisplayDiscovery, "discoveredDevices");
    id v11 = [obj countByEnumeratingWithState:__b objects:v18 count:16];
    if (v11)
    {
      uint64_t v7 = *(void *)__b[2];
      uint64_t v8 = 0LL;
      id v9 = v11;
      while (1)
      {
        uint64_t v6 = v8;
        if (*(void *)__b[2] != v7) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(id *)(__b[1] + 8 * v8);
        id v4 = [v13 idsDeviceIdentifier];
        unsigned __int8 v5 = [v4 isEqual:location[0]];

        if ((v5 & 1) != 0) {
          break;
        }
        ++v8;
        if (v6 + 1 >= (unint64_t)v9)
        {
          uint64_t v8 = 0LL;
          id v9 = [obj countByEnumeratingWithState:__b objects:v18 count:16];
          if (!v9) {
            goto LABEL_11;
          }
        }
      }

      id v3 = [v13 name];
      id v17 = [v3 copy];

      int v14 = 1;
    }

    else
    {
LABEL_11:
      int v14 = 0;
    }

    if (!v14)
    {
      id v17 = 0LL;
      int v14 = 1;
    }
  }

  else
  {
    id v17 = 0LL;
    int v14 = 1;
  }

  objc_storeStrong(location, 0LL);
  return (NSString *)v17;
}

- (AVCaptureDevice)continuityCaptureDevice
{
  id v3 = -[AVCaptureDeviceDiscoverySession devices](self->_captureDiscoverySession, "devices");
  id v4 = -[NSArray firstObject](v3, "firstObject");

  return (AVCaptureDevice *)v4;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  v24 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v22 = 0LL;
  objc_storeStrong(&v22, a4);
  id v21 = 0LL;
  objc_storeStrong(&v21, a5);
  v20 = a6;
  if (a6 == off_10021EB78)
  {
    v19 = -[TVSSContinuityCameraSessionObserver continuityCaptureDevice](v24, "continuityCaptureDevice");
    id v18 = VideoMicBackingStoreLog();
    os_log_type_t v17 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_DEFAULT))
    {
      sub_10001AEB8((uint64_t)v25, (uint64_t)v19);
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v18,  v17,  "Continuity camera device changed to %{public}@",  v25,  0xCu);
    }

    objc_storeStrong(&v18, 0LL);
    observerSet = v24->_observerSet;
    id v11 = _NSConcreteStackBlock;
    int v12 = -1073741824;
    int v13 = 0;
    int v14 = sub_10001B430;
    v15 = &unk_1001B65A8;
    v16 = v19;
    -[TVSObserverSet enumerateObserversUsingBlock:](observerSet, "enumerateObserversUsingBlock:", &v11);
    objc_storeStrong((id *)&v16, 0LL);
    objc_storeStrong((id *)&v19, 0LL);
  }

  else
  {
    v10.receiver = v24;
    v10.super_class = (Class)&OBJC_CLASS___TVSSContinuityCameraSessionObserver;
    -[TVSSContinuityCameraSessionObserver observeValueForKeyPath:ofObject:change:context:]( &v10,  "observeValueForKeyPath:ofObject:change:context:",  location[0],  v22,  v21,  v20);
  }

  objc_storeStrong(&v21, 0LL);
  objc_storeStrong(&v22, 0LL);
  objc_storeStrong(location, 0LL);
}

- (RPRemoteDisplayDiscovery)remoteDisplayDiscovery
{
  return self->_remoteDisplayDiscovery;
}

- (void)setRemoteDisplayDiscovery:(id)a3
{
}

- (AVCaptureDeviceDiscoverySession)captureDiscoverySession
{
  return self->_captureDiscoverySession;
}

- (void)setCaptureDiscoverySession:(id)a3
{
}

- (TVSObserverSet)observerSet
{
  return self->_observerSet;
}

- (void).cxx_destruct
{
}

@end