@interface CLStreamedLocationProviderServerDiscoverer
+ (BOOL)iOSSourceVersionNewEnough:(id *)a3;
+ (BOOL)macOSSourceVersionNewEnough:(id *)a3;
+ (BOOL)validateRemoteDeviceForStreaming:(id)a3;
- (NSMutableArray)probeClients;
- (OS_dispatch_queue)requestQ;
- (OS_dispatch_queue)workQ;
- (RPCompanionLinkClient)nearbyDeviceListener;
- (id)deviceWithEffectiveID:(id)a3;
- (id)initOnQueue:(id)a3;
- (void)dealloc;
- (void)findCandidateServersWithCompletion:(id)a3;
- (void)invalidate;
- (void)invalidateAndReleaseProbeClients;
- (void)setNearbyDeviceListener:(id)a3;
- (void)setProbeClients:(id)a3;
- (void)setRequestQ:(id)a3;
- (void)setWorkQ:(id)a3;
@end

@implementation CLStreamedLocationProviderServerDiscoverer

- (id)initOnQueue:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___CLStreamedLocationProviderServerDiscoverer;
  v4 = -[CLStreamedLocationProviderServerDiscoverer init](&v7, "init");
  if (v4)
  {
    v4->_workQ = (OS_dispatch_queue *)dispatch_queue_create("CLStreamedLocationProviderServerDiscoverer.workQueue", 0LL);
    v4->_requestQ = (OS_dispatch_queue *)dispatch_queue_create( "CLStreamedLocationProviderServerDiscoverer.requestQueue",  0LL);
    v4->_nearbyDeviceListener = objc_alloc_init(&OBJC_CLASS___RPCompanionLinkClient);
    sub_1004F2598();
    if (sub_1004F5330())
    {
      -[RPCompanionLinkClient setFlags:](v4->_nearbyDeviceListener, "setFlags:", 1LL);
      uint64_t v5 = 4LL;
    }

    else
    {
      uint64_t v5 = 65538LL;
    }

    -[RPCompanionLinkClient setControlFlags:](v4->_nearbyDeviceListener, "setControlFlags:", v5);
    -[RPCompanionLinkClient setDispatchQueue:](v4->_nearbyDeviceListener, "setDispatchQueue:", a3);
    -[RPCompanionLinkClient setDeviceFoundHandler:]( v4->_nearbyDeviceListener,  "setDeviceFoundHandler:",  &stru_10182C130);
    -[RPCompanionLinkClient setDeviceLostHandler:](v4->_nearbyDeviceListener, "setDeviceLostHandler:", &stru_10182C150);
    -[RPCompanionLinkClient activateWithCompletion:]( v4->_nearbyDeviceListener,  "activateWithCompletion:",  &stru_10182C190);
  }

  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLStreamedLocationProviderServerDiscoverer;
  -[CLStreamedLocationProviderServerDiscoverer dealloc](&v3, "dealloc");
}

- (void)invalidate
{
  self->_nearbyDeviceListener = 0LL;
  -[CLStreamedLocationProviderServerDiscoverer invalidateAndReleaseProbeClients]( self,  "invalidateAndReleaseProbeClients");
}

- (void)invalidateAndReleaseProbeClients
{
  probeClients = self->_probeClients;
  if (probeClients)
  {
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    __int128 v8 = 0u;
    __int128 v9 = 0u;
    id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( probeClients,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        objc_super v7 = 0LL;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(probeClients);
          }
          [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) invalidate];
          objc_super v7 = (char *)v7 + 1;
        }

        while (v5 != v7);
        id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( probeClients,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
      }

      while (v5);
    }
  }

  self->_probeClients = 0LL;
}

- (id)deviceWithEffectiveID:(id)a3
{
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v4 = -[RPCompanionLinkClient activeDevices]( -[CLStreamedLocationProviderServerDiscoverer nearbyDeviceListener](self, "nearbyDeviceListener", 0LL),  "activeDevices");
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v23 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        __int128 v9 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        if (objc_msgSend(objc_msgSend(v9, "effectiveIdentifier"), "isEqualToString:", a3))
        {
          if (qword_101934990 != -1) {
            dispatch_once(&qword_101934990, &stru_10182C2F8);
          }
          __int128 v10 = (os_log_s *)qword_101934998;
          if (os_log_type_enabled((os_log_t)qword_101934998, OS_LOG_TYPE_DEBUG))
          {
            id v11 = [a3 UTF8String];
            *(_DWORD *)buf = 68289283;
            int v18 = 0;
            __int16 v19 = 2082;
            v20 = "";
            __int16 v21 = 2081;
            id v22 = v11;
            _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:#Multiclient found an active device with effective ID, effectiveID:%{private, location:escape_only}s}",  buf,  0x1Cu);
          }

          return v9;
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v23 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  return 0LL;
}

+ (BOOL)iOSSourceVersionNewEnough:(id *)a3
{
  if (a3->var0 < 16) {
    return 0;
  }
  if (a3->var0 == 16) {
    return a3->var1 > 3;
  }
  return 1;
}

+ (BOOL)macOSSourceVersionNewEnough:(id *)a3
{
  if (a3->var0 < 14) {
    return 0;
  }
  if (a3->var0 == 14) {
    return a3->var1 > 3;
  }
  return 1;
}

+ (BOOL)validateRemoteDeviceForStreaming:(id)a3
{
  unint64_t v4 = (unint64_t)[a3 statusFlags];
  if (objc_msgSend(objc_msgSend(a3, "model"), "containsString:", @"Mac"))
  {
    sub_1004F2598();
    if (!sub_1004F5330())
    {
      if (qword_101934990 != -1) {
        dispatch_once(&qword_101934990, &stru_10182C2F8);
      }
      uint64_t v5 = qword_101934998;
      if (!os_log_type_enabled((os_log_t)qword_101934998, OS_LOG_TYPE_INFO)) {
        return 0;
      }
      *(_DWORD *)buf = 68289026;
      int v29 = 0;
      __int16 v30 = 2082;
      v31 = "";
      id v6 = "{msg%{public}.0s:#Multiclient not a VM, so not using mac}";
      uint64_t v7 = (os_log_s *)v5;
      uint32_t v8 = 18;
      goto LABEL_42;
    }

    if (a3) {
      [a3 operatingSystemVersion];
    }
    else {
      memset(v27, 0, sizeof(v27));
    }
    if (!+[CLStreamedLocationProviderServerDiscoverer macOSSourceVersionNewEnough:]( &OBJC_CLASS___CLStreamedLocationProviderServerDiscoverer,  "macOSSourceVersionNewEnough:",  v27))
    {
      if (qword_101934990 != -1) {
        dispatch_once(&qword_101934990, &stru_10182C2F8);
      }
      uint64_t v12 = qword_101934998;
      if (!os_log_type_enabled((os_log_t)qword_101934998, OS_LOG_TYPE_INFO)) {
        return 0;
      }
      id v13 = [a3 name];
      if (a3)
      {
        [a3 operatingSystemVersion];
        __int128 v14 = v24;
        [a3 operatingSystemVersion];
        uint64_t v15 = v22;
      }

      else
      {
        uint64_t v15 = 0LL;
        __int128 v14 = 0LL;
        v24 = 0LL;
        uint64_t v25 = 0LL;
        uint64_t v26 = 0LL;
        uint64_t v21 = 0LL;
        uint64_t v22 = 0LL;
        uint64_t v23 = 0LL;
      }

      *(_DWORD *)buf = 68289795;
      int v29 = 0;
      __int16 v30 = 2082;
      v31 = "";
      __int16 v32 = 2113;
      id v33 = v13;
      __int16 v34 = 2050;
      id v35 = v14;
      __int16 v36 = 2050;
      uint64_t v37 = v15;
      id v6 = "{msg%{public}.0s:#Multiclient macOS device running too-old software, ignoring, name:%{private, lo"
           "cation:escape_only}@, major:%{public}ld, minor:%{public}ld}";
      goto LABEL_41;
    }

    return 1;
  }

  if (objc_msgSend(objc_msgSend(a3, "model"), "hasPrefix:", @"iPhone"))
  {
    if (a3) {
      [a3 operatingSystemVersion];
    }
    else {
      memset(v20, 0, sizeof(v20));
    }
    if (!+[CLStreamedLocationProviderServerDiscoverer iOSSourceVersionNewEnough:]( &OBJC_CLASS___CLStreamedLocationProviderServerDiscoverer,  "iOSSourceVersionNewEnough:",  v20))
    {
      if (qword_101934990 != -1) {
        dispatch_once(&qword_101934990, &stru_10182C2F8);
      }
      uint64_t v12 = qword_101934998;
      if (!os_log_type_enabled((os_log_t)qword_101934998, OS_LOG_TYPE_INFO)) {
        return 0;
      }
      id v16 = [a3 name];
      if (a3)
      {
        [a3 operatingSystemVersion];
        v17 = v24;
        [a3 operatingSystemVersion];
        uint64_t v18 = v22;
      }

      else
      {
        uint64_t v18 = 0LL;
        v17 = 0LL;
        v24 = 0LL;
        uint64_t v25 = 0LL;
        uint64_t v26 = 0LL;
        uint64_t v21 = 0LL;
        uint64_t v22 = 0LL;
        uint64_t v23 = 0LL;
      }

      *(_DWORD *)buf = 68289795;
      int v29 = 0;
      __int16 v30 = 2082;
      v31 = "";
      __int16 v32 = 2113;
      id v33 = v16;
      __int16 v34 = 2050;
      id v35 = v17;
      __int16 v36 = 2050;
      uint64_t v37 = v18;
      id v6 = "{msg%{public}.0s:#Multiclient iOS device running too-old software, ignoring, name:%{private, loca"
           "tion:escape_only}@, major:%{public}ld, minor:%{public}ld}";
LABEL_41:
      uint64_t v7 = (os_log_s *)v12;
      uint32_t v8 = 48;
LABEL_42:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, v6, buf, v8);
      return 0;
    }

    return 1;
  }

  sub_1004F2598();
  if (!sub_1004F5330() || (v4 & 0x1000000) == 0)
  {
    if (qword_101934990 != -1) {
      dispatch_once(&qword_101934990, &stru_10182C2F8);
    }
    uint64_t v11 = qword_101934998;
    if (!os_log_type_enabled((os_log_t)qword_101934998, OS_LOG_TYPE_INFO)) {
      return 0;
    }
    *(_DWORD *)buf = 68289795;
    int v29 = 0;
    __int16 v30 = 2082;
    v31 = "";
    __int16 v32 = 2113;
    id v33 = [a3 name];
    __int16 v34 = 2114;
    id v35 = [a3 model];
    __int16 v36 = 1026;
    LODWORD(v37) = (v4 >> 24) & 1;
    id v6 = "{msg%{public}.0s:#Multiclient candidate is neither a phone nor a mac host, skipping, name:%{private"
         ", location:escape_only}@, model:%{public, location:escape_only}@, USB?:%{public}hhd}";
    uint64_t v7 = (os_log_s *)v11;
    uint32_t v8 = 44;
    goto LABEL_42;
  }

  if (qword_101934990 != -1) {
    dispatch_once(&qword_101934990, &stru_10182C2F8);
  }
  __int128 v9 = (os_log_s *)qword_101934998;
  BOOL v10 = 1;
  if (os_log_type_enabled((os_log_t)qword_101934998, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 68289283;
    int v29 = 0;
    __int16 v30 = 2082;
    v31 = "";
    __int16 v32 = 2113;
    id v33 = [a3 name];
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:#Multiclient accepting this device because it looks like it's our host, name:%{privat e, location:escape_only}@}",  buf,  0x1Cu);
  }

  return v10;
}

- (void)findCandidateServersWithCompletion:(id)a3
{
  id v26 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  id v25 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  objc_msgSend( v25,  "setObject:forKeyedSubscript:",  objc_msgSend( -[RPCompanionLinkClient localDevice]( -[CLStreamedLocationProviderServerDiscoverer nearbyDeviceListener](self, "nearbyDeviceListener"),  "localDevice"),  "effectiveIdentifier"),  @"kCLLocationSTreamingMessageRapportDeviceIDKey");
  if (!self->_probeClients) {
    self->_probeClients = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  objc_msgSend( -[RPCompanionLinkClient activeDevices]( -[CLStreamedLocationProviderServerDiscoverer nearbyDeviceListener]( self,  "nearbyDeviceListener"),  "activeDevices"),  "count"));
  }
  sub_1004F2598();
  __int128 v29 = 0u;
  if (sub_1004F5330()) {
    uint64_t v4 = 0x380000103C04LL;
  }
  else {
    uint64_t v4 = 532482LL;
  }
  __int128 v30 = 0uLL;
  __int128 v31 = 0uLL;
  __int128 v32 = 0uLL;
  id v5 = -[RPCompanionLinkClient activeDevices]( -[CLStreamedLocationProviderServerDiscoverer nearbyDeviceListener](self, "nearbyDeviceListener"),  "activeDevices");
  id v6 = [v5 countByEnumeratingWithState:&v29 objects:v45 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v30;
    uint64_t v24 = RPOptionTimeoutSeconds;
    uint64_t v23 = RPOptionStatusFlags;
    uint64_t v22 = RPOptionAllowUnauthenticated;
    do
    {
      __int128 v9 = 0LL;
      do
      {
        if (*(void *)v30 != v8) {
          objc_enumerationMutation(v5);
        }
        BOOL v10 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)v9);
        unsigned int v11 = [v10 statusFlags];
        sub_1004F2598();
        if (!sub_1004F5330() || (v11 & 0x1000000) != 0)
        {
          if (+[CLStreamedLocationProviderServerDiscoverer validateRemoteDeviceForStreaming:]( &OBJC_CLASS___CLStreamedLocationProviderServerDiscoverer,  "validateRemoteDeviceForStreaming:",  v10))
          {
            uint64_t v15 = objc_alloc_init(&OBJC_CLASS___RPCompanionLinkClient);
            -[RPCompanionLinkClient setDispatchQueue:]( v15,  "setDispatchQueue:",  -[CLStreamedLocationProviderServerDiscoverer workQ](self, "workQ"));
            sub_1004F2598();
            if (sub_1004F5330())
            {
              -[RPCompanionLinkClient setControlFlags:](v15, "setControlFlags:", v4);
              -[RPCompanionLinkClient setFlags:](v15, "setFlags:", 1LL);
              v35[0] = v24;
              v35[1] = v22;
              v36[0] = &off_1018D30B0;
              v36[1] = &__kCFBooleanTrue;
              v35[2] = v23;
              v36[2] = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v4);
              id v16 = v36;
              v17 = v35;
              uint64_t v18 = 3LL;
            }

            else
            {
              -[RPCompanionLinkClient setControlFlags:](v15, "setControlFlags:", 2LL);
              v33[0] = v24;
              v33[1] = v23;
              v34[0] = &off_1018D30B0;
              v34[1] = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v4);
              id v16 = v34;
              v17 = v33;
              uint64_t v18 = 2LL;
            }

            __int16 v19 = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v16,  v17,  v18);
            -[RPCompanionLinkClient setDestinationDevice:](v15, "setDestinationDevice:", v10);
            v28[0] = _NSConcreteStackBlock;
            v28[1] = 3221225472LL;
            v28[2] = sub_100244FBC;
            v28[3] = &unk_10182C208;
            v28[4] = v15;
            v28[5] = self;
            v28[6] = v25;
            v28[7] = v19;
            v28[8] = v26;
            -[RPCompanionLinkClient activateWithCompletion:](v15, "activateWithCompletion:", v28);
            -[NSMutableArray addObject:]( -[CLStreamedLocationProviderServerDiscoverer probeClients](self, "probeClients"),  "addObject:",  v15);
          }
        }

        else
        {
          if (qword_101934990 != -1) {
            dispatch_once(&qword_101934990, &stru_10182C2F8);
          }
          uint64_t v12 = (os_log_s *)qword_101934998;
          if (os_log_type_enabled((os_log_t)qword_101934998, OS_LOG_TYPE_DEBUG))
          {
            id v13 = [v10 name];
            id v14 = [v10 model];
            *(_DWORD *)buf = 68289538;
            int v38 = 0;
            __int16 v39 = 2082;
            v40 = "";
            __int16 v41 = 2114;
            id v42 = v13;
            __int16 v43 = 2114;
            id v44 = v14;
            _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:#Multiclient skipping this device because it's not the host, name:%{public, l ocation:escape_only}@, model:%{public, location:escape_only}@}",  buf,  0x26u);
          }
        }

        __int128 v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v29 objects:v45 count:16];
    }

    while (v7);
  }

  dispatch_time_t v20 = dispatch_time(0LL, 5000000000LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002455BC;
  block[3] = &unk_10182C230;
  block[4] = v26;
  block[5] = a3;
  dispatch_after( v20,  (dispatch_queue_t)-[RPCompanionLinkClient dispatchQueue]( -[CLStreamedLocationProviderServerDiscoverer nearbyDeviceListener](self, "nearbyDeviceListener"),  "dispatchQueue"),  block);
}

- (RPCompanionLinkClient)nearbyDeviceListener
{
  return self->_nearbyDeviceListener;
}

- (void)setNearbyDeviceListener:(id)a3
{
  self->_nearbyDeviceListener = (RPCompanionLinkClient *)a3;
}

- (OS_dispatch_queue)workQ
{
  return self->_workQ;
}

- (void)setWorkQ:(id)a3
{
  self->_workQ = (OS_dispatch_queue *)a3;
}

- (OS_dispatch_queue)requestQ
{
  return self->_requestQ;
}

- (void)setRequestQ:(id)a3
{
  self->_requestQ = (OS_dispatch_queue *)a3;
}

- (NSMutableArray)probeClients
{
  return self->_probeClients;
}

- (void)setProbeClients:(id)a3
{
  self->_probeClients = (NSMutableArray *)a3;
}

@end