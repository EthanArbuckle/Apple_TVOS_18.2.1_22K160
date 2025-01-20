@interface HostWatcher
+ (int)dumpConnectedHosts:(id *)a3;
+ (void)addService:(id)a3 forHostID:(__CFString *)a4;
+ (void)cleanupClosedSocketForPeer:(id)a3;
+ (void)invalidateServiceWithPID:(int)a3 heartBeatRef:(unint64_t)a4;
+ (void)invalidateWatcherForHost:(__CFString *)a3;
+ (void)removeService:(id)a3 forHostID:(__CFString *)a4;
- (BOOL)aboutToSleep;
- (BOOL)invalidated;
- (BOOL)lockdownSockConfirmedClosed;
- (BOOL)sleepTimerEnabled;
- (BOOL)systemSleepNotificationProcessed;
- (HostWatcher)initWithCheckinGoop:(void *)a3;
- (IONotificationPort)powerPort;
- (NSMutableArray)servicesAwaitingClose;
- (NSMutableSet)watchedServices;
- (NSString)descriptionOverride;
- (NSString)hostID;
- (NSString)hostName;
- (NSString)peerName;
- (OS_dispatch_queue)pingQueue;
- (OS_dispatch_semaphore)pingSem;
- (OS_dispatch_source)powerDownTimer;
- (OS_os_transaction)transaction;
- (SSLContext)sslCtx;
- (_lockdown_connection)ldConn;
- (id)description;
- (id)receiveMessage:(char *)a3 size:(unint64_t *)a4;
- (id)sleepHandler;
- (int)receivePacket:(char *)a3 size:(unint64_t)a4;
- (int)sendPacket:(const char *)a3 size:(unint64_t)a4;
- (int)sock;
- (unsigned)powerConn;
- (unsigned)powerNotifier;
- (void)addService:(id)a3;
- (void)dealloc;
- (void)enumerateServices:(id)a3;
- (void)handleSleepNotification:(unsigned int)a3 service:(unsigned int)a4 messageArgument:(void *)a5;
- (void)invalidate;
- (void)powerLogForService:(id)a3 event:(id)a4;
- (void)removeService:(id)a3;
- (void)runWatcher;
- (void)setAboutToSleep:(BOOL)a3;
- (void)setDescriptionOverride:(id)a3;
- (void)setHostID:(id)a3;
- (void)setHostName:(id)a3;
- (void)setInvalidated:(BOOL)a3;
- (void)setLdConn:(_lockdown_connection *)a3;
- (void)setLockdownSockConfirmedClosed:(BOOL)a3;
- (void)setPeerName:(id)a3;
- (void)setPingQueue:(id)a3;
- (void)setPingSem:(id)a3;
- (void)setPowerConn:(unsigned int)a3;
- (void)setPowerDownTimer:(id)a3;
- (void)setPowerNotifier:(unsigned int)a3;
- (void)setPowerPort:(IONotificationPort *)a3;
- (void)setServicesAwaitingClose:(id)a3;
- (void)setSleepHandler:(id)a3;
- (void)setSleepTimerEnabled:(BOOL)a3;
- (void)setSock:(int)a3;
- (void)setSslCtx:(SSLContext *)a3;
- (void)setSystemSleepNotificationProcessed:(BOOL)a3;
- (void)setWatchedServices:(id)a3;
@end

@implementation HostWatcher

+ (void)cleanupClosedSocketForPeer:(id)a3
{
  id v3 = a3;
  v4 = (dispatch_queue_s *)qword_100010C18;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100001F18;
  block[3] = &unk_10000C4D0;
  id v7 = v3;
  id v5 = v3;
  dispatch_sync(v4, block);
}

+ (void)addService:(id)a3 forHostID:(__CFString *)a4
{
  id v5 = a3;
  v6 = (dispatch_queue_s *)qword_100010C18;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100002298;
  block[3] = &unk_10000C4F8;
  id v9 = v5;
  v10 = a4;
  id v7 = v5;
  dispatch_sync(v6, block);
}

+ (void)removeService:(id)a3 forHostID:(__CFString *)a4
{
  id v5 = a3;
  v6 = (dispatch_queue_s *)qword_100010C18;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100002370;
  block[3] = &unk_10000C4F8;
  id v9 = v5;
  v10 = a4;
  id v7 = v5;
  dispatch_sync(v6, block);
}

+ (void)invalidateWatcherForHost:(__CFString *)a3
{
  uint64_t v18 = 0LL;
  v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  v21 = sub_1000025A8;
  v22 = sub_1000025B8;
  id v23 = 0LL;
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v5 = (void *)v19[5];
  v19[5] = (uint64_t)v4;

  v6 = (dispatch_queue_s *)qword_100010C18;
  if (a3)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_1000025C0;
    v17[3] = &unk_10000C520;
    v17[5] = a3;
    id v7 = v17;
  }

  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000263C;
    block[3] = &unk_10000C570;
    id v7 = block;
  }

  v7[4] = &v18;
  dispatch_sync(v6, v7);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v8 = (id)v19[5];
  id v9 = [v8 countByEnumeratingWithState:&v12 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v13;
    do
    {
      v11 = 0LL;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * (void)v11), "invalidate", (void)v12);
        v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v8 countByEnumeratingWithState:&v12 objects:v24 count:16];
    }

    while (v9);
  }

  _Block_object_dispose(&v18, 8);
}

+ (void)invalidateServiceWithPID:(int)a3 heartBeatRef:(unint64_t)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100002708;
  v4[3] = &unk_10000C5D0;
  v4[4] = a4;
  int v5 = a3;
  dispatch_sync((dispatch_queue_t)qword_100010C18, v4);
}

+ (int)dumpConnectedHosts:(id *)a3
{
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  int v5 = v4;
  if (v4)
  {
    v6 = (dispatch_queue_s *)qword_100010C18;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100002934;
    block[3] = &unk_10000C4D0;
    id v7 = v4;
    __int128 v12 = v7;
    dispatch_sync(v6, block);

    id v8 = -[NSMutableArray count](v7, "count");
    int v9 = 0;
    if (a3 && v8)
    {
      int v9 = 0;
      *a3 = v7;
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to allocate array.",  buf,  2u);
    }

    int v9 = -1;
  }

  return v9;
}

- (int)sendPacket:(const char *)a3 size:(unint64_t)a4
{
  if (-[HostWatcher ldConn](self, "ldConn"))
  {
    unint64_t v7 = 0LL;
    while (a4 > v7)
    {
      uint64_t v8 = lockdown_send(-[HostWatcher ldConn](self, "ldConn"), &a3[v7], a4 - v7);
      v7 += v8;
      if (v8 == -1) {
        return -1;
      }
    }

    return 0;
  }

  else
  {
    *__error() = 22;
    return -1;
  }

- (int)receivePacket:(char *)a3 size:(unint64_t)a4
{
  if (-[HostWatcher ldConn](self, "ldConn"))
  {
    unint64_t v7 = 0LL;
    while (a4 > v7)
    {
      uint64_t v8 = lockdown_recv(-[HostWatcher ldConn](self, "ldConn"), &a3[v7], a4 - v7);
      v7 += v8;
      if (v8 <= 0) {
        return -1;
      }
    }

    return 0;
  }

  else
  {
    *__error() = 22;
    return -1;
  }

- (id)receiveMessage:(char *)a3 size:(unint64_t *)a4
{
  unsigned int v28 = 0;
  if (!a3 || !a4)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    *(_WORD *)buf = 0;
    uint64_t v10 = "Invalid inputs.";
LABEL_9:
    uint32_t v11 = 2;
    goto LABEL_10;
  }

  if (-[HostWatcher receivePacket:size:](self, "receivePacket:size:", &v28, 4LL))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = *__error();
      uint64_t v8 = __error();
      int v9 = strerror(*v8);
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v30 = v7;
      *(_WORD *)&v30[4] = 2082;
      *(void *)&v30[6] = v9;
      uint64_t v10 = "Failed to read response message size: %d %{public}s";
LABEL_6:
      uint32_t v11 = 18;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v10, buf, v11);
    }

- (void)invalidate
{
  id v3 = &_os_log_default;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[HostWatcher hostID](self, "hostID"));
    *(_DWORD *)buf = 138543362;
    uint64_t v10 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalidating host watcher: %{public}@",  buf,  0xCu);
  }

  -[HostWatcher setInvalidated:](self, "setInvalidated:", 1LL);
  int v5 = (dispatch_queue_s *)qword_100010C08;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000312C;
  block[3] = &unk_10000C680;
  objc_copyWeak(&v7, &location);
  void block[4] = self;
  dispatch_async(v5, block);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)runWatcher
{
  v37 = 0LL;
  size_t v38 = 256LL;
  uint64_t v33 = 0LL;
  v34 = &v33;
  uint64_t v35 = 0x2020000000LL;
  unint64_t v36 = sub_100003B0C();
  objc_initWeak(&location, self);
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[HostWatcher pingQueue](self, "pingQueue"));
  dispatch_assert_queue_V2(v3);

  v37 = malloc(v38);
  if (!v37)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v18 = "Failed to allocate read buffer.";
LABEL_30:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v18, buf, 2u);
    }

- (void)handleSleepNotification:(unsigned int)a3 service:(unsigned int)a4 messageArgument:(void *)a5
{
  HIDWORD(v8) = a3;
  LODWORD(v8) = a3 + 536870288;
  switch((v8 >> 4))
  {
    case 0u:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Power notification: kIOMessageCanSystemSleep",  buf,  2u);
      }

      IOReturn v9 = IOAllowPowerChange(-[HostWatcher powerConn](self, "powerConn"), (intptr_t)a5);
      if (v9 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        unsigned int v51 = v9;
        uint64_t v10 = "IOAllowPowerChange failed: %08x";
        goto LABEL_17;
      }

      break;
    case 1u:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Power notification: kIOMessageSystemWillSleep",  buf,  2u);
      }

      if (-[HostWatcher systemSleepNotificationProcessed](self, "systemSleepNotificationProcessed"))
      {
        IOReturn v11 = IOAllowPowerChange(-[HostWatcher powerConn](self, "powerConn"), (intptr_t)a5);
        if (v11 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          unsigned int v51 = v11;
          uint64_t v10 = "IOAllowPowerChange failed: %08x";
          goto LABEL_17;
        }
      }

      else
      {
        -[HostWatcher setAboutToSleep:](self, "setAboutToSleep:", 1LL);
        unint64_t v36 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(-[HostWatcher pingSem](self, "pingSem"));
        dispatch_semaphore_signal(v36);

        v37 = (dispatch_queue_s *)qword_100010C18;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_100004160;
        block[3] = &unk_10000C6D0;
        objc_copyWeak(&v48, &location);
        dispatch_sync(v37, block);
        id v38 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
        {
          v39 = (void *)objc_claimAutoreleasedReturnValue(-[HostWatcher peerName](self, "peerName"));
          v40 = (void *)objc_claimAutoreleasedReturnValue(-[HostWatcher servicesAwaitingClose](self, "servicesAwaitingClose"));
          sub_10000802C(v39, v40, buf);
        }

        v41 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[HostWatcher pingQueue](self, "pingQueue"));
        v42 = _NSConcreteStackBlock;
        uint64_t v43 = 3221225472LL;
        v44 = sub_10000424C;
        v45 = &unk_10000C740;
        objc_copyWeak(v46, &location);
        v46[1] = a5;
        dispatch_sync(v41, &v42);

        -[HostWatcher setSystemSleepNotificationProcessed:]( self,  "setSystemSleepNotificationProcessed:",  1LL,  v42,  v43,  v44,  v45);
        objc_destroyWeak(v46);
        objc_destroyWeak(&v48);
      }

      break;
    case 2u:
      BOOL v12 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
      if (v12) {
        sub_100008100(v12, v13, v14, v15, v16, v17, v18, v19);
      }
      break;
    case 9u:
      BOOL v20 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
      if (v20) {
        sub_1000080CC(v20, v21, v22, v23, v24, v25, v26, v27);
      }
      break;
    case 0xBu:
      BOOL v28 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
      if (v28) {
        sub_100008098(v28, v29, v30, v31, v32, v33, v34, v35);
      }
      break;
    default:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        unsigned int v51 = a3;
        uint64_t v10 = "Unknown power notification: %d";
LABEL_17:
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v10, buf, 8u);
      }

      break;
  }

  objc_destroyWeak(&location);
}

- (id)description
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[HostWatcher descriptionOverride](self, "descriptionOverride"));

  if (v3)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[HostWatcher descriptionOverride](self, "descriptionOverride"));
  }

  else
  {
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS___HostWatcher;
    id v5 = -[HostWatcher description](&v7, "description");
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v5);
  }

  return v4;
}

- (HostWatcher)initWithCheckinGoop:(void *)a3
{
  v63.receiver = self;
  v63.super_class = (Class)&OBJC_CLASS___HostWatcher;
  CFDictionaryRef theDict = 0LL;
  uint64_t v4 = -[HostWatcher init](&v63, "init");
  if (!v4)
  {
    char v8 = 0;
    goto LABEL_48;
  }

  v69[0] = @"CheckinConnectionInfo";
  v69[1] = @"NoHeartBeat";
  v70[0] = a3;
  v70[1] = &__kCFBooleanTrue;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v70,  v69,  2LL));
  int v6 = secure_lockdown_checkin(v4 + 64, v5, &theDict);
  if (!v6)
  {
    Value = CFDictionaryGetValue(theDict, @"HostID");
    uint64_t v12 = objc_claimAutoreleasedReturnValue(Value);
    uint64_t v13 = (void *)*((void *)v4 + 5);
    *((void *)v4 + 5) = v12;

    uint64_t v14 = *((void *)v4 + 5);
    uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
    {
      uint64_t v16 = CFDictionaryGetValue(theDict, @"HostName");
      uint64_t v17 = objc_claimAutoreleasedReturnValue(v16);
      uint64_t v18 = (void *)*((void *)v4 + 6);
      *((void *)v4 + 6) = v17;

      uint64_t v19 = *((void *)v4 + 6);
      uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSString);
      if ((objc_opt_isKindOfClass(v19, v20) & 1) == 0)
      {
        uint64_t v21 = (void *)*((void *)v4 + 6);
        *((void *)v4 + 6) = @"Unknown host";
      }

      int socket = lockdown_get_socket(*((void *)v4 + 8));
      *((_DWORD *)v4 + 6) = socket;
      if (socket == -1)
      {
        char v8 = 0;
        if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_47;
        }
        *(_WORD *)buf = 0;
        IOReturn v9 = "Invalid socket.";
      }

      else
      {
        v4[11] = 0;
        uint64_t securecontext = lockdown_get_securecontext(*((void *)v4 + 8));
        *((void *)v4 + 16) = securecontext;
        if (!securecontext && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "SSL not enabled on this connection.",  buf,  2u);
        }

        uint64_t v24 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
        uint64_t v25 = (void *)*((void *)v4 + 9);
        *((void *)v4 + 9) = v24;

        if (*((void *)v4 + 9))
        {
          uint64_t v26 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
          uint64_t v27 = (void *)*((void *)v4 + 10);
          *((void *)v4 + 10) = v26;

          if (*((void *)v4 + 10))
          {
            if (sub_100001CC8(*((_DWORD *)v4 + 6)))
            {
              id v28 = sub_100005218(*((_DWORD *)v4 + 6));
              uint64_t v29 = objc_claimAutoreleasedReturnValue(v28);
              uint64_t v30 = (void *)*((void *)v4 + 7);
              *((void *)v4 + 7) = v29;

              if (*((void *)v4 + 7))
              {
                uint64_t v31 = objc_alloc(&OBJC_CLASS___NSString);
                uint64_t v32 = (objc_class *)objc_opt_class(v4);
                uint64_t v33 = -[NSString initWithFormat:]( v31,  "initWithFormat:",  @"<%s: %p> [%@ %@ '%@'] [fd=%d]",  class_getName(v32),  v4,  *((void *)v4 + 5),  *((void *)v4 + 7),  *((void *)v4 + 6),  *((unsigned int *)v4 + 6));
                uint64_t v34 = (void *)*((void *)v4 + 11);
                *((void *)v4 + 11) = v33;

                if (*((void *)v4 + 11))
                {
                  io_connect_t v35 = IORegisterForSystemPower( v4,  (IONotificationPortRef *)v4 + 15,  (IOServiceInterestCallback)sub_1000052DC,  (io_object_t *)v4 + 5);
                  *((_DWORD *)v4 + 4) = v35;
                  if (v35)
                  {
                    unint64_t v36 = objc_alloc(&OBJC_CLASS___NSString);
                    v37 = (void *)objc_claimAutoreleasedReturnValue([v4 hostID]);
                    id v38 = -[NSString initWithFormat:]( v36,  "initWithFormat:",  @"com.apple.mobile.heartbeat.pingQueue.%@",  v37);

                    if (v38)
                    {
                      v39 = v38;
                      dispatch_queue_t v40 = dispatch_queue_create(-[NSString UTF8String](v39, "UTF8String"), 0LL);
                      v41 = (void *)*((void *)v4 + 12);
                      *((void *)v4 + 12) = v40;

                      if (*((void *)v4 + 12))
                      {
                        dispatch_semaphore_t v42 = dispatch_semaphore_create(0LL);
                        uint64_t v43 = (void *)*((void *)v4 + 13);
                        *((void *)v4 + 13) = v42;

                        if (*((void *)v4 + 13))
                        {
                          IONotificationPortSetDispatchQueue( *((IONotificationPortRef *)v4 + 15),  (dispatch_queue_t)qword_100010C08);
                          objc_initWeak((id *)buf, v4);
                          dispatch_source_t v44 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)qword_100010C08);
                          v45 = (void *)*((void *)v4 + 14);
                          *((void *)v4 + 14) = v44;

                          v46 = (dispatch_source_s *)*((void *)v4 + 14);
                          if (v46)
                          {
                            dispatch_source_set_timer(v46, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0LL);
                            v47 = (dispatch_source_s *)*((void *)v4 + 14);
                            handler[0] = _NSConcreteStackBlock;
                            handler[1] = 3221225472LL;
                            handler[2] = sub_1000052E8;
                            handler[3] = &unk_10000C6D0;
                            objc_copyWeak(&v61, (id *)buf);
                            dispatch_source_set_event_handler(v47, handler);
                            id v48 = (dispatch_source_s *)*((void *)v4 + 14);
                            v58[0] = _NSConcreteStackBlock;
                            v58[1] = 3221225472LL;
                            v58[2] = sub_100005434;
                            v58[3] = &unk_10000C6D0;
                            objc_copyWeak(&v59, (id *)buf);
                            dispatch_source_set_cancel_handler(v48, v58);
                            dispatch_resume(*((dispatch_object_t *)v4 + 14));
                            objc_destroyWeak(&v59);
                            objc_destroyWeak(&v61);
                            objc_destroyWeak((id *)buf);
                            uint64_t v49 = os_transaction_create("com.apple.mobile.heartbeat");
                            v50 = (void *)*((void *)v4 + 4);
                            *((void *)v4 + 4) = v49;

                            uint64_t v51 = *((void *)v4 + 11);
                            uint64_t v67 = *((void *)v4 + 5);
                            uint64_t v68 = v51;
                            sub_100001E40( @"com.apple.heartbeatd.host.attached",  (const __CFDictionary *)+[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v68,  &v67,  1LL));
                            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                            {
                              *(_DWORD *)buf = 138543362;
                              v66 = v4;
                              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Initialized host watcher: %{public}@",  buf,  0xCu);
                            }

                            char v8 = 1;
                            goto LABEL_47;
                          }

                          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                          {
                            *(_WORD *)v62 = 0;
                            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to create timer.",  v62,  2u);
                          }

                          objc_destroyWeak((id *)buf);
                          goto LABEL_71;
                        }

                        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_WORD *)buf = 0;
                          v57 = "Failed to create ping semaphore.";
                          goto LABEL_67;
                        }
                      }

                      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_WORD *)buf = 0;
                        v57 = "Failed to allocate queue.";
LABEL_67:
                        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  v57,  buf,  2u);
                      }

- (void)dealloc
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint32_t v10 = self;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Deallocating host watcher: %{public}@",  buf,  0xCu);
  }

  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[HostWatcher watchedServices](self, "watchedServices"));
  [v3 enumerateObjectsUsingBlock:&stru_10000C780];

  ldConn = self->_ldConn;
  if (ldConn) {
    lockdown_disconnect(ldConn);
  }
  if (self->_powerConn)
  {
    IOReturn v5 = IODeregisterForSystemPower(&self->_powerNotifier);
    if (v5)
    {
      IOReturn v6 = v5;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v10) = v6;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "IODeregisterForSystemPower failed: %08x",  buf,  8u);
      }
    }

    IONotificationPortDestroy(self->_powerPort);
    IOServiceClose(self->_powerConn);
  }

  powerDownTimer = self->_powerDownTimer;
  if (powerDownTimer) {
    dispatch_source_cancel((dispatch_source_t)powerDownTimer);
  }
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___HostWatcher;
  -[HostWatcher dealloc](&v8, "dealloc");
}

- (void)powerLogForService:(id)a3 event:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = v7;
  if (!v6 || !v7)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    *(_WORD *)uint64_t v22 = 0;
    uint64_t v21 = "Invalid argument(s).";
LABEL_13:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v21, v22, 2u);
    goto LABEL_14;
  }

  IOReturn v9 = objc_alloc(&OBJC_CLASS___NSMutableDictionary);
  v23[0] = @"HostName";
  uint32_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[HostWatcher hostName](self, "hostName"));
  v24[0] = v10;
  v23[1] = @"HostClient";
  IOReturn v11 = (void *)objc_claimAutoreleasedReturnValue([v6 hostClient]);
  v24[1] = v11;
  v23[2] = @"Service";
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v6 serviceName]);
  v24[2] = v12;
  v23[3] = @"ServiceInstanceID";
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v6 serviceInstanceID]);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 UUIDString]);
  v23[4] = @"Transport";
  v24[3] = v14;
  v24[4] = @"network";
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v24,  v23,  5LL));
  uint64_t v16 = -[NSMutableDictionary initWithDictionary:](v9, "initWithDictionary:", v15);

  if (!v16)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    *(_WORD *)uint64_t v22 = 0;
    uint64_t v21 = "Failed to create dictionary.";
    goto LABEL_13;
  }

  if ([v8 isEqual:@"com.apple.mobile.heartbeat.ServiceStop"])
  {
    double v17 = TMGetKernelMonotonicClock();
    if (v17 <= 0.0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v22 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to query monotonic clock time.",  v22,  2u);
      }

      goto LABEL_8;
    }

    double v18 = v17;
    [v6 serviceStartTime];
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v18 - v19));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v16,  "setObject:forKeyedSubscript:",  v20,  @"DurationSeconds");
  }

  PLLogRegisteredEvent(119LL, v8, v16, 0LL);
LABEL_8:

LABEL_14:
}

- (void)addService:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)qword_100010C18);
  if (v5)
  {
    -[HostWatcher powerLogForService:event:]( self,  "powerLogForService:event:",  v5,  @"com.apple.mobile.heartbeat.ServiceStart");
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[HostWatcher watchedServices](self, "watchedServices"));
    [v4 addObject:v5];
  }
}

- (void)removeService:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)qword_100010C18);
  if (v5)
  {
    -[HostWatcher powerLogForService:event:]( self,  "powerLogForService:event:",  v5,  @"com.apple.mobile.heartbeat.ServiceStop");
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[HostWatcher watchedServices](self, "watchedServices"));
    [v4 removeObject:v5];
  }
}

- (void)enumerateServices:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)qword_100010C18);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[HostWatcher watchedServices](self, "watchedServices"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100005A4C;
  v7[3] = &unk_10000C7A8;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateObjectsUsingBlock:v7];
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (NSString)hostID
{
  return self->_hostID;
}

- (void)setHostID:(id)a3
{
}

- (NSString)hostName
{
  return self->_hostName;
}

- (void)setHostName:(id)a3
{
}

- (NSString)peerName
{
  return self->_peerName;
}

- (void)setPeerName:(id)a3
{
}

- (_lockdown_connection)ldConn
{
  return self->_ldConn;
}

- (void)setLdConn:(_lockdown_connection *)a3
{
  self->_ldConn = a3;
}

- (NSMutableSet)watchedServices
{
  return self->_watchedServices;
}

- (void)setWatchedServices:(id)a3
{
}

- (NSMutableArray)servicesAwaitingClose
{
  return self->_servicesAwaitingClose;
}

- (void)setServicesAwaitingClose:(id)a3
{
}

- (NSString)descriptionOverride
{
  return self->_descriptionOverride;
}

- (void)setDescriptionOverride:(id)a3
{
}

- (OS_dispatch_queue)pingQueue
{
  return self->_pingQueue;
}

- (void)setPingQueue:(id)a3
{
}

- (OS_dispatch_semaphore)pingSem
{
  return self->_pingSem;
}

- (void)setPingSem:(id)a3
{
}

- (OS_dispatch_source)powerDownTimer
{
  return self->_powerDownTimer;
}

- (void)setPowerDownTimer:(id)a3
{
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (BOOL)aboutToSleep
{
  return self->_aboutToSleep;
}

- (void)setAboutToSleep:(BOOL)a3
{
  self->_aboutToSleep = a3;
}

- (BOOL)sleepTimerEnabled
{
  return self->_sleepTimerEnabled;
}

- (void)setSleepTimerEnabled:(BOOL)a3
{
  self->_sleepTimerEnabled = a3;
}

- (IONotificationPort)powerPort
{
  return self->_powerPort;
}

- (void)setPowerPort:(IONotificationPort *)a3
{
  self->_powerPort = a3;
}

- (unsigned)powerConn
{
  return self->_powerConn;
}

- (void)setPowerConn:(unsigned int)a3
{
  self->_powerConn = a3;
}

- (unsigned)powerNotifier
{
  return self->_powerNotifier;
}

- (void)setPowerNotifier:(unsigned int)a3
{
  self->_powerNotifier = a3;
}

- (int)sock
{
  return self->_sock;
}

- (void)setSock:(int)a3
{
  self->_sock = a3;
}

- (BOOL)lockdownSockConfirmedClosed
{
  return self->_lockdownSockConfirmedClosed;
}

- (void)setLockdownSockConfirmedClosed:(BOOL)a3
{
  self->_lockdownSockConfirmedClosed = a3;
}

- (SSLContext)sslCtx
{
  return self->_sslCtx;
}

- (void)setSslCtx:(SSLContext *)a3
{
  self->_sslCtx = a3;
}

- (id)sleepHandler
{
  return self->_sleepHandler;
}

- (void)setSleepHandler:(id)a3
{
}

- (BOOL)systemSleepNotificationProcessed
{
  return self->_systemSleepNotificationProcessed;
}

- (void)setSystemSleepNotificationProcessed:(BOOL)a3
{
  self->_systemSleepNotificationProcessed = a3;
}

- (void).cxx_destruct
{
}

@end