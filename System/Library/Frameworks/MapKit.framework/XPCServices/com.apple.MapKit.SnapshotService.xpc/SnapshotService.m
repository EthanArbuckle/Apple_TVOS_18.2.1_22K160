@interface SnapshotService
- (BOOL)hasEnoughPixelsForRequest:(int64_t)a3;
- (SnapshotService)init;
- (id)_nextSnapshotRequest;
- (int64_t)pixelsForRequest:(id)a3;
- (void)_cleanupForRequest:(id)a3;
- (void)_startNextSnapshotterIfPossible:(id)a3;
- (void)cancelSnapshotForConnection:(id)a3;
- (void)requestIconWithStyleAttributes:(id)a3 size:(unint64_t)a4 scale:(double)a5 completionHandler:(id)a6;
- (void)requestSnapshotWithOptions:(id)a3 completionHandler:(id)a4;
@end

@implementation SnapshotService

- (SnapshotService)init
{
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___SnapshotService;
  v2 = -[SnapshotService init](&v21, "init");
  if (v2)
  {
    sub_100004528();
    v3 = objc_alloc_init(&OBJC_CLASS___NSLock);
    lock = v2->_lock;
    v2->_lock = v3;

    v5 = -[NSMapTable initWithKeyOptions:valueOptions:capacity:]( objc_alloc(&OBJC_CLASS___NSMapTable),  "initWithKeyOptions:valueOptions:capacity:",  512LL,  512LL,  5LL);
    connectionToSnapshotRequest = v2->_connectionToSnapshotRequest;
    v2->_connectionToSnapshotRequest = v5;

    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    pendingSnapshotRequests = v2->_pendingSnapshotRequests;
    v2->_pendingSnapshotRequests = v7;

    v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    requestIdToSnapshotter = v2->_requestIdToSnapshotter;
    v2->_requestIdToSnapshotter = v9;

    v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    proccessIdToPendingSerialSnapshot = v2->_proccessIdToPendingSerialSnapshot;
    v2->_proccessIdToPendingSerialSnapshot = v11;

    v2->_requestCounter = 0LL;
    v2->_lastRequestPID = 0;
    dispatch_queue_attr_t v13 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_DEFAULT, 0);
    v14 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v13);
    dispatch_queue_attr_t v15 = dispatch_queue_attr_make_with_autorelease_frequency(v14, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v15);

    dispatch_queue_t v17 = dispatch_queue_create("com.apple.MapKit.SnapshotService.homeQueue", v16);
    homeQueue = v2->_homeQueue;
    v2->_homeQueue = (OS_dispatch_queue *)v17;

    +[GEOMapService setShouldResolveAttribution:](&OBJC_CLASS___GEOMapService, "setShouldResolveAttribution:", 0LL);
    v19 = v2;
  }

  return v2;
}

- (int64_t)pixelsForRequest:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 options]);
  [v4 scale];
  double v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v3 options]);
  [v7 size];
  double v9 = v6 * v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue([v3 options]);

  [v10 size];
  int64_t v12 = llround(v9 * v11);

  return v12;
}

- (BOOL)hasEnoughPixelsForRequest:(int64_t)a3
{
  int64_t usedPixels = self->_usedPixels;
  uint64_t v10 = 0LL;
  double v11 = &v10;
  uint64_t v12 = 0x2020000000LL;
  double v5 = (void *)qword_10000CC80;
  uint64_t v13 = qword_10000CC80;
  if (!qword_10000CC80)
  {
    double v6 = (void *)sub_100004528();
    double v5 = dlsym(v6, "MapKitConfig_SnapshotServiceMaxPixels");
    v11[3] = (uint64_t)v5;
    qword_10000CC80 = (uint64_t)v5;
  }

  _Block_object_dispose(&v10, 8);
  if (!v5)
  {
    double v8 = dlerror();
    double v9 = (_Unwind_Exception *)abort_report_np("%s", v8);
    _Block_object_dispose(&v10, 8);
    _Unwind_Resume(v9);
  }

  return usedPixels + a3 <= GEOConfigGetInteger(*v5, v5[1]);
}

- (void)cancelSnapshotForConnection:(id)a3
{
  id v4 = a3;
  homeQueue = self->_homeQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000049C8;
  v7[3] = &unk_100008390;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)homeQueue, v7);
}

- (id)_nextSnapshotRequest
{
  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000LL;
  id v3 = (void *)qword_10000CC78;
  uint64_t v26 = qword_10000CC78;
  if (!qword_10000CC78)
  {
    id v4 = (void *)sub_100004528();
    id v3 = dlsym(v4, "MapKitConfig_SnapshotServicePerProcessSerializationEnabled");
    *(void *)(*(void *)&buf[8] + 24LL) = v3;
    qword_10000CC78 = (uint64_t)v3;
  }

  _Block_object_dispose(buf, 8);
  if (!v3)
  {
    v24 = dlerror();
    abort_report_np("%s", v24);
  }

  int BOOL = GEOConfigGetBOOL(*v3, v3[1]);
  pendingSnapshotRequests = self->_pendingSnapshotRequests;
  if (!BOOL) {
    return (id)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](pendingSnapshotRequests, "firstObject"));
  }
  if (!-[NSMutableArray count](pendingSnapshotRequests, "count")) {
    return 0LL;
  }
  uint64_t v7 = 0LL;
  while (1)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_pendingSnapshotRequests, "objectAtIndex:", v7));
    double v9 = (void *)objc_claimAutoreleasedReturnValue([v8 options]);
    unsigned int v10 = [v9 _snapshotServiceSerialPerProcess];

    if (!v10) {
      break;
    }
    proccessIdToPendingSerialSnapshot = self->_proccessIdToPendingSerialSnapshot;
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v8 processIdentifier]));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](proccessIdToPendingSerialSnapshot, "objectForKey:", v12));
    LOBYTE(proccessIdToPendingSerialSnapshot) = v13 == 0LL;

    v14 = self->_proccessIdToPendingSerialSnapshot;
    dispatch_queue_attr_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v8 processIdentifier]));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v14, "objectForKey:", v15));
    id v17 = [v16 unsignedIntegerValue];

    id v18 = sub_1000041DC();
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      id v20 = [v8 requestId];
      signed int v21 = [v8 processIdentifier];
      *(_DWORD *)buf = 134218496;
      *(void *)&buf[4] = v20;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v21;
      *(_WORD *)&buf[22] = 2048;
      uint64_t v26 = (uint64_t)v17;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "Skipping request %llu from process %llu due to per process serialization waiting on request %llu.",  buf,  0x20u);
    }
  }

  id v23 = v8;

  return v23;
}

- (void)_cleanupForRequest:(id)a3
{
  id v4 = a3;
  self->_usedPixels -= -[SnapshotService pixelsForRequest:](self, "pixelsForRequest:", v4);
  proccessIdToPendingSerialSnapshot = self->_proccessIdToPendingSerialSnapshot;
  id v6 = [v4 processIdentifier];

  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v6));
  -[NSMutableDictionary removeObjectForKey:](proccessIdToPendingSerialSnapshot, "removeObjectForKey:", v7);
}

- (void)_startNextSnapshotterIfPossible:(id)a3
{
  id v55 = a3;
  -[NSLock lock](self->_lock, "lock");
  if (-[NSMutableArray count](self->_pendingSnapshotRequests, "count"))
  {
    uint64_t v54 = DefaultLoggingSubsystem;
    while (1)
    {
      id v4 = -[NSMutableDictionary count](self->_requestIdToSnapshotter, "count");
      *(void *)buf = 0LL;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000LL;
      double v5 = (void *)qword_10000CC70;
      *(void *)&_BYTE buf[24] = qword_10000CC70;
      if (!qword_10000CC70)
      {
        id v6 = (void *)sub_100004528();
        double v5 = dlsym(v6, "MapKitConfig_SnapshotServiceQueueWidth");
        *(void *)(*(void *)&buf[8] + 24LL) = v5;
        qword_10000CC70 = (uint64_t)v5;
      }

      _Block_object_dispose(buf, 8);
      if (!v5)
      {
        v53 = dlerror();
        abort_report_np("%s", v53);
        __break(1u);
      }

      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SnapshotService _nextSnapshotRequest](self, "_nextSnapshotRequest"));
      if (!v7)
      {
        id v45 = sub_1000041DC();
        v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
        if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          v47 = "All pending snapshots are waiting on other snapshots to complete trying again as soon as the current sna"
                "pshot(s) are finished.";
          v48 = v46;
          os_log_type_t v49 = OS_LOG_TYPE_INFO;
          uint32_t v50 = 2;
          goto LABEL_41;
        }

- (void)requestSnapshotWithOptions:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_1000041DC();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  unsigned int v10 = (char *)[v6 signpostId];
  if ((unint64_t)(v10 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v11 = (os_signpost_id_t)v10;
    if (os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v9,  OS_SIGNPOST_INTERVAL_BEGIN,  v11,  "RequestSnapshotWithOptions",  (const char *)&unk_100007C06,  buf,  2u);
    }
  }

  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  homeQueue = self->_homeQueue;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100005AFC;
  v17[3] = &unk_1000083E0;
  v17[4] = self;
  id v18 = v12;
  id v19 = v6;
  id v20 = v7;
  id v14 = v7;
  id v15 = v6;
  id v16 = v12;
  dispatch_async((dispatch_queue_t)homeQueue, v17);
}

- (void)requestIconWithStyleAttributes:(id)a3 size:(unint64_t)a4 scale:(double)a5 completionHandler:(id)a6
{
  id v9 = a3;
  unsigned int v10 = (void (**)(id, id))a6;
  if (v10)
  {
    id v11 = objc_alloc_init(&OBJC_CLASS___VKIconManager);
    uint64_t v13 = v11;
    if (a4 > 5) {
      uint64_t v14 = 5LL;
    }
    else {
      uint64_t v14 = qword_100006CA8[a4];
    }
    *(float *)&double v12 = a5;
    id v15 = (void *)objc_claimAutoreleasedReturnValue( [v11 imageForStyleAttributes:v9 withStylesheetName:@"default-search" contentScale:v14 sizeGroup:0 modifiers:v12]);
    id v16 = v15;
    if (v15)
    {
      id v17 = CGImageRetain((CGImageRef)[v15 image]);
      if (v17)
      {
        uint64_t v24 = 0LL;
        id v25 = &v24;
        uint64_t v26 = 0x2050000000LL;
        id v18 = (void *)qword_10000CC88;
        uint64_t v27 = qword_10000CC88;
        if (!qword_10000CC88)
        {
          v23[0] = _NSConcreteStackBlock;
          v23[1] = 3221225472LL;
          v23[2] = sub_100005EBC;
          v23[3] = &unk_100008340;
          v23[4] = &v24;
          sub_100005EBC((uint64_t)v23);
          id v18 = (void *)v25[3];
        }

        id v19 = v18;
        _Block_object_dispose(&v24, 8);
        id v20 = objc_alloc(v19);
        [v16 contentScale];
        id v22 = [v20 initWithCGImage:v17 scale:0 orientation:v21];
      }

      else
      {
        id v22 = 0LL;
      }

      CGImageRelease(v17);
      v10[2](v10, v22);
    }

    else
    {
      v10[2](v10, 0LL);
    }
  }
}

- (void).cxx_destruct
{
}

@end