@interface W5WiFiSniffManager
- (BOOL)__isCancelled;
- (W5WiFiSniffManager)init;
- (W5WiFiSniffManager)initWithStatusManager:(id)a3 andUserNotificationManager:(id)a4;
- (id)__pendingRequestWithUUID:(id)a3;
- (void)__nextRequest;
- (void)__setupWatchdogTask;
- (void)addRequest:(id)a3;
- (void)cancelRequestWithUUID:(id)a3 reply:(id)a4;
- (void)dealloc;
- (void)teardownAndNotify:(id)a3;
@end

@implementation W5WiFiSniffManager

- (W5WiFiSniffManager)initWithStatusManager:(id)a3 andUserNotificationManager:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___W5WiFiSniffManager;
  v6 = -[W5WiFiSniffManager init](&v12, "init");
  v7 = v6;
  if (!a3
    || !v6
    || ((v6->_status = (W5StatusManager *)a3, !a4)
      ? (v8 = 0LL)
      : (v8 = (W5UserNotificationManager *)a4),
        (v7->_notification = v8,
         dispatch_queue_t v9 = dispatch_queue_create("com.apple.wifivelocity.wifi-sniffer", 0LL),
         (v7->_queue = (OS_dispatch_queue *)v9) == 0LL)
     || (v10 = objc_alloc_init(&OBJC_CLASS___NSMutableArray), (v7->_pendingRequests = v10) == 0LL)))
  {

    return 0LL;
  }

  return v7;
}

- (W5WiFiSniffManager)init
{
  return result;
}

- (void)dealloc
{
  notification = self->_notification;
  if (notification) {

  }
  queue = (dispatch_object_s *)self->_queue;
  if (queue) {
    dispatch_release(queue);
  }
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___W5WiFiSniffManager;
  -[W5WiFiSniffManager dealloc](&v5, "dealloc");
}

- (void)addRequest:(id)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100050444;
  v4[3] = &unk_1000D1BA8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (id)__pendingRequestWithUUID:(id)a3
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  pendingRequests = self->_pendingRequests;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( pendingRequests,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
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
      objc_enumerationMutation(pendingRequests);
    }
    dispatch_queue_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if (v6 == (id)++v8)
    {
      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( pendingRequests,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
      if (v6) {
        goto LABEL_3;
      }
      return 0LL;
    }
  }

- (void)cancelRequestWithUUID:(id)a3 reply:(id)a4
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000505E0;
  block[3] = &unk_1000D1BD0;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(queue, block);
}

- (void)__setupWatchdogTask
{
  self->_watchdogTask = 0LL;
  SEL v3 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"while kill -0 %d; do sleep 10; done; kill -9 %d;",
         -[NSProcessInfo processIdentifier]( +[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"),  "processIdentifier"),  -[NSTask processIdentifier](self->_task, "processIdentifier"));
  v5[0] = @"-c";
  v5[1] = v3;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10005096C;
  v4[3] = &unk_1000D1C20;
  v4[4] = self;
  +[NSTask runTaskWithLaunchPath:arguments:launchHandler:reply:]( &OBJC_CLASS___NSTask,  "runTaskWithLaunchPath:arguments:launchHandler:reply:",  @"/bin/sh",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v5, 2LL),  v4,  0LL);
}

- (void)__nextRequest
{
  if (!self->_activeRequest && -[NSMutableArray count](self->_pendingRequests, "count"))
  {
    self->_activeRequest = objc_alloc_init(&OBJC_CLASS___W5WiFiActiveSnifferRequest);
    -[W5WiFiActiveSnifferRequest setRequestInfo:]( self->_activeRequest,  "setRequestInfo:",  objc_msgSend(-[NSMutableArray firstObject](self->_pendingRequests, "firstObject"), "copy"));
    SEL v3 = self->_activeRequest;
    -[NSMutableArray removeObjectAtIndex:](self->_pendingRequests, "removeObjectAtIndex:", 0LL);
    v23[4] = self;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v25 = sub_100051110;
    v26 = &unk_1000D2A70;
    v27 = self;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_1000513E8;
    v23[3] = &unk_1000D2A70;
    v4 = -[W5WiFiInterface interfaceName](-[W5StatusManager wifi](self->_status, "wifi"), "interfaceName");
    id v5 = -[NSURL path]( -[W5WiFiSnifferRequest outputFile]( -[W5WiFiActiveSnifferRequest requestInfo](self->_activeRequest, "requestInfo"),  "outputFile"),  "path");
    if (!v4 || (id v6 = v5) == 0LL)
    {
      NSErrorUserInfoKey v28 = NSLocalizedFailureReasonErrorKey;
      v29 = @"W5ParamErr";
      v25( (uint64_t)v24,  0LL,  (uint64_t)+[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifivelocity.error",  1LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v29,  &v28,  1LL)));
      return;
    }

    if ((_os_feature_enabled_impl("WiFiVelocity", "BloodHoundSniffer") & 1) == 0) {
      -[W5WiFiSnifferRequest setTcpDump:]( -[W5WiFiActiveSnifferRequest requestInfo](self->_activeRequest, "requestInfo"),  "setTcpDump:",  1LL);
    }
    if (-[W5WiFiSnifferRequest monitorMode]( -[W5WiFiActiveSnifferRequest requestInfo](self->_activeRequest, "requestInfo"),  "monitorMode"))
    {
      -[W5WiFiInterface disassociate](-[W5StatusManager wifi](self->_status, "wifi"), "disassociate");
      -[W5WiFiInterface setChannel:]( -[W5StatusManager wifi](self->_status, "wifi"),  "setChannel:",  -[W5WiFiSnifferRequest channel]( -[W5WiFiActiveSnifferRequest requestInfo](self->_activeRequest, "requestInfo"),  "channel"));
      uint64_t v7 = (os_log_s *)sub_10008C90C();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = -[W5WiFiSnifferRequest channel]( -[W5WiFiActiveSnifferRequest requestInfo](self->_activeRequest, "requestInfo"),  "channel");
        int v37 = 136315906;
        v38 = "-[W5WiFiSniffManager __nextRequest]";
        __int16 v39 = 2080;
        v40 = "W5WiFiSniffManager.m";
        __int16 v41 = 1024;
        int v42 = 469;
        __int16 v43 = 2114;
        v44 = v8;
        int v21 = 38;
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v7,  0LL,  "[wifivelocity] %s (%s:%u) Setting Channel: %{public}@",  &v37,  v21);
      }

      dispatch_queue_t v9 = (os_log_s *)sub_10008C90C();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v37 = 136315650;
        v38 = "-[W5WiFiSniffManager __nextRequest]";
        __int16 v39 = 2080;
        v40 = "W5WiFiSniffManager.m";
        __int16 v41 = 1024;
        int v42 = 492;
        LODWORD(v20) = 28;
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v9,  0LL,  "[wifivelocity] %s (%s:%u) Sniff via tcp dump",  (const char *)&v37,  v20,  v22);
      }

      if (-[W5WiFiSnifferRequest noAutoStop]( -[W5WiFiActiveSnifferRequest requestInfo](self->_activeRequest, "requestInfo"),  "noAutoStop"))
      {
        v10 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
        v36[0] = @"-i";
        v36[1] = v4;
        v36[2] = @"-I";
        v36[3] = @"-G";
        v36[4] = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%ld",  -[W5WiFiSnifferRequest rotationInterval]( -[W5WiFiActiveSnifferRequest requestInfo](self->_activeRequest, "requestInfo"),  "rotationInterval"));
        -[NSMutableArray addObjectsFromArray:]( v10,  "addObjectsFromArray:",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v36, 5LL));
        if (-[W5WiFiSnifferRequest maxSize]( -[W5WiFiActiveSnifferRequest requestInfo](self->_activeRequest, "requestInfo"),  "maxSize") >= 1)
        {
          v35[0] = @"-C";
          v35[1] = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%ld",  -[W5WiFiSnifferRequest maxSize]( -[W5WiFiActiveSnifferRequest requestInfo](self->_activeRequest, "requestInfo"),  "maxSize"));
          -[NSMutableArray addObjectsFromArray:]( v10,  "addObjectsFromArray:",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v35, 2LL));
        }

        if (-[W5WiFiSnifferRequest maxFiles]( -[W5WiFiActiveSnifferRequest requestInfo](self->_activeRequest, "requestInfo"),  "maxFiles") >= 1)
        {
          v34[0] = @"-W";
          v34[1] = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%ld",  -[W5WiFiSnifferRequest maxFiles]( -[W5WiFiActiveSnifferRequest requestInfo](self->_activeRequest, "requestInfo"),  "maxFiles"));
          -[NSMutableArray addObjectsFromArray:]( v10,  "addObjectsFromArray:",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v34, 2LL));
        }

        if (-[W5WiFiSnifferRequest snaplen]( -[W5WiFiActiveSnifferRequest requestInfo](self->_activeRequest, "requestInfo"),  "snaplen") >= 1)
        {
          v33[0] = @"-s";
          v33[1] = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%ld",  -[W5WiFiSnifferRequest snaplen]( -[W5WiFiActiveSnifferRequest requestInfo](self->_activeRequest, "requestInfo"),  "snaplen"));
          -[NSMutableArray addObjectsFromArray:]( v10,  "addObjectsFromArray:",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v33, 2LL));
        }

        v32[0] = @"-w";
        v32[1] = v6;
        -[NSMutableArray addObjectsFromArray:]( v10,  "addObjectsFromArray:",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v32, 2LL));
        -[W5WiFiSnifferRequest duration]( -[W5WiFiActiveSnifferRequest requestInfo](self->_activeRequest, "requestInfo"),  "duration");
        p_super = &v10->super;
        goto LABEL_27;
      }

      v31[0] = @"-i";
      v31[1] = v4;
      v31[2] = @"-I";
      v31[3] = @"-G";
      -[W5WiFiSnifferRequest duration]( -[W5WiFiActiveSnifferRequest requestInfo](self->_activeRequest, "requestInfo"),  "duration");
      LODWORD(v19) = vcvtpd_s64_f64(v18);
      v31[4] = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%d", v19);
      v31[5] = @"-W";
      v31[6] = @"1";
      v31[7] = @"-w";
      v31[8] = v6;
      v16 = v31;
      uint64_t v17 = 9LL;
    }

    else
    {
      __int128 v13 = (os_log_s *)sub_10008C90C();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v37 = 136315650;
        v38 = "-[W5WiFiSniffManager __nextRequest]";
        __int16 v39 = 2080;
        v40 = "W5WiFiSniffManager.m";
        __int16 v41 = 1024;
        int v42 = 520;
        LODWORD(v20) = 28;
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v13,  0LL,  "[wifivelocity] %s (%s:%u) Sniff via tcp dump",  (const char *)&v37,  v20,  v22);
      }

      v30[0] = @"-q";
      v30[1] = @"-n";
      v30[2] = @"-i";
      v30[3] = v4;
      v30[4] = @"-I";
      v30[5] = @"-G";
      -[W5WiFiSnifferRequest duration]( -[W5WiFiActiveSnifferRequest requestInfo](self->_activeRequest, "requestInfo"),  "duration");
      LODWORD(v15) = vcvtpd_s64_f64(v14);
      v30[6] = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%d", v15);
      v30[7] = @"-W";
      v30[8] = @"1";
      v30[9] = @"-w";
      v30[10] = v6;
      v16 = v30;
      uint64_t v17 = 11LL;
    }

    p_super = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v16, v17);
    double v11 = 0.0;
LABEL_27:
    +[NSTask runTaskWithLaunchPath:arguments:timeout:startBlock:updateBlock:endBlock:]( &OBJC_CLASS___NSTask,  "runTaskWithLaunchPath:arguments:timeout:startBlock:updateBlock:endBlock:",  @"/usr/sbin/tcpdump",  p_super,  v24,  0LL,  v23,  v11);
  }

- (BOOL)__isCancelled
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  void v5[2] = sub_100051600;
  v5[3] = &unk_1000D18F8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)teardownAndNotify:(id)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100051690;
  v4[3] = &unk_1000D1B80;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(queue, v4);
}

@end