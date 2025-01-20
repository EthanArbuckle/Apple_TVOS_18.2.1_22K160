@interface UpgradeSequencer
+ (id)getSharedInstance;
- (BOOL)_isInterfaceLocked;
- (BOOL)lockIsHeldByClient:(_rpc_cred *)a3;
- (NSMutableDictionary)upgradesUnderway;
- (OS_dispatch_queue)lockAcquireQueue;
- (OS_dispatch_queue)registrationQueue;
- (OS_dispatch_queue)workQueue;
- (OS_dispatch_source)lockTimer;
- (OS_os_log)logHandle;
- (UpgradeClient)lockingClient;
- (UpgradeSequencer)init;
- (id)_abort;
- (id)_completeUpgradeSession;
- (id)_completeUpgradeWithError:(id)a3;
- (id)_timeout;
- (id)_unlockInterface;
- (id)sessionCompleteCallback;
- (int)_setKernelUpgradeOngoing:(BOOL)a3;
- (void)_disableInterfaceLockTimeout;
- (void)_handleInterfaceLockCancel;
- (void)_restartInterfaceLockTimeout;
- (void)_startUpgradeForCryptex:(id)a3 withGraftPath:(id)a4 killingJobs:(BOOL)a5 withCompletion:(id)a6;
- (void)abortWithCompletion:(id)a3;
- (void)completeUpgradeWithCompletion:(id)a3;
- (void)lockInterfaceForClient:(id)a3 withCompletion:(id)a4;
- (void)onUpgradeCompleteForCryptex:(id)a3 withCompletion:(id)a4;
- (void)onUpgradeSessionComplete:(id)a3;
- (void)setLockTimer:(id)a3;
- (void)setLockingClient:(id)a3;
- (void)setSessionCompleteCallback:(id)a3;
- (void)startUpgradeForCryptexes:(id)a3 killingJobs:(BOOL)a4 withCompletion:(id)a5;
@end

@implementation UpgradeSequencer

+ (id)getSharedInstance
{
  if (qword_10005A3D0 != -1) {
    dispatch_once(&qword_10005A3D0, &stru_100055168);
  }
  return (id)qword_10005A3D8;
}

- (UpgradeSequencer)init
{
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___UpgradeSequencer;
  id v2 = -[UpgradeSequencer init](&v23, "init");
  if (v2)
  {
    dispatch_queue_attr_t initially_inactive = dispatch_queue_attr_make_initially_inactive(0LL);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(initially_inactive);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.security.cryptexd.upgrade_sequencer_registration", v4);

    v6 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v5;

    dispatch_set_qos_class(*((void *)v2 + 3), 25LL, 0LL);
    dispatch_activate(*((dispatch_object_t *)v2 + 3));
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.security.cryptexd.upgrade_sequencer_work", 0LL);
    v8 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v7;

    dispatch_set_target_queue(*((dispatch_object_t *)v2 + 2), *((dispatch_queue_t *)v2 + 3));
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.security.cryptexd.upgrade_sequencer_lock_acquire", 0LL);
    v10 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v9;

    dispatch_set_target_queue(*((dispatch_object_t *)v2 + 1), *((dispatch_queue_t *)v2 + 2));
    dispatch_suspend(*((dispatch_object_t *)v2 + 1));
    dispatch_source_t v11 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  *((dispatch_queue_t *)v2 + 2));
    v12 = (void *)*((void *)v2 + 8);
    *((void *)v2 + 8) = v11;

    dispatch_source_set_timer(*((dispatch_source_t *)v2 + 8), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0LL);
    v13 = (dispatch_source_s *)*((void *)v2 + 8);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100002E14;
    handler[3] = &unk_1000550D8;
    v14 = v2;
    id v22 = v14;
    dispatch_source_set_event_handler(v13, handler);
    dispatch_resume(*((dispatch_object_t *)v2 + 8));
    v15 = (void *)v14[6];
    v14[6] = 0LL;

    v16 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v17 = (void *)v14[4];
    v14[4] = v16;

    os_log_t v18 = os_log_create("com.apple.libcryptex", "upgrade_sequencer");
    v19 = (void *)v14[5];
    v14[5] = v18;
  }

  return (UpgradeSequencer *)v2;
}

- (void)startUpgradeForCryptexes:(id)a3 killingJobs:(BOOL)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer workQueue](self, "workQueue"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100003000;
  v13[3] = &unk_100055230;
  id v14 = v8;
  id v15 = v9;
  v13[4] = self;
  BOOL v16 = a4;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(v10, v13);
}

- (void)completeUpgradeWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer workQueue](self, "workQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100003CA4;
  v7[3] = &unk_100055258;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)onUpgradeCompleteForCryptex:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer workQueue](self, "workQueue"));
  dispatch_suspend(v8);

  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer registrationQueue](self, "registrationQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100003DC4;
  block[3] = &unk_100055280;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

- (void)onUpgradeSessionComplete:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer workQueue](self, "workQueue"));
  dispatch_suspend(v5);

  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer registrationQueue](self, "registrationQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100004044;
  block[3] = &unk_100055258;
  block[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(v6, block);
}

- (void)lockInterfaceForClient:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer lockAcquireQueue](self, "lockAcquireQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100004144;
  block[3] = &unk_100055280;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, block);
}

- (BOOL)lockIsHeldByClient:(_rpc_cred *)a3
{
  uint64_t v8 = 0LL;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000LL;
  char v11 = 0;
  dispatch_queue_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer workQueue](self, "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100004A20;
  block[3] = &unk_1000552A8;
  block[4] = self;
  void block[5] = &v8;
  block[6] = a3;
  dispatch_sync(v5, block);

  LOBYTE(a3) = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return (char)a3;
}

- (void)abortWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer workQueue](self, "workQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100004B30;
  v7[3] = &unk_100055258;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (BOOL)_isInterfaceLocked
{
  id v2 = self;
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer workQueue](self, "workQueue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer lockingClient](v2, "lockingClient"));
  LOBYTE(v2) = v4 != 0LL;

  return (char)v2;
}

- (int)_setKernelUpgradeOngoing:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer workQueue](self, "workQueue"));
  dispatch_assert_queue_V2(v4);

  return sub_100036564(v3);
}

- (id)_completeUpgradeSession
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer workQueue](self, "workQueue"));
  dispatch_assert_queue_V2(v3);

  unsigned int v4 = -[UpgradeSequencer _setKernelUpgradeOngoing:](self, "_setKernelUpgradeOngoing:", 0LL);
  if (v4)
  {
    signed int v5 = v4;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer logHandle](self, "logHandle"));

    if (v6)
    {
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer logHandle](self, "logHandle"));
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        uint64_t v8 = 3LL;
      }
      else {
        uint64_t v8 = 2LL;
      }
      id v9 = (char *)_os_log_send_and_compose_impl(v8, 0LL, 0LL, 0LL, &_mh_execute_header, v7, 16LL);
    }

    else
    {
      id v9 = (char *)_os_log_send_and_compose_impl(2LL, 0LL, 0LL, 0LL, &_mh_execute_header, &_os_log_default, 16LL);
    }

    CFErrorRef v15 = sub_10000A444( "-[UpgradeSequencer _completeUpgradeSession]",  "upgrade_sequencer.m",  611,  "com.apple.security.cryptex.posix",  v5,  0LL,  v9);
    free(v9);
    return v15;
  }

  else
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer _unlockInterface](self, "_unlockInterface"));
    if (v10)
    {
      char v11 = (void *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer logHandle](self, "logHandle"));

      if (v11)
      {
        id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer logHandle](self, "logHandle"));
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          uint64_t v13 = 3LL;
        }
        else {
          uint64_t v13 = 2LL;
        }
        id v14 = (char *)_os_log_send_and_compose_impl(v13, 0LL, 0LL, 0LL, &_mh_execute_header, v12, 16LL);
      }

      else
      {
        id v14 = (char *)_os_log_send_and_compose_impl(2LL, 0LL, 0LL, 0LL, &_mh_execute_header, &_os_log_default, 16LL);
      }

      CFErrorRef v17 = sub_10000A444( "-[UpgradeSequencer _completeUpgradeSession]",  "upgrade_sequencer.m",  620,  "com.apple.security.cryptex.posix",  26LL,  v10,  v14);
      free(v14);

      return v17;
    }

    else
    {
      return 0LL;
    }
  }

- (void)_handleInterfaceLockCancel
{
  signed int v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer workQueue](self, "workQueue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer lockingClient](self, "lockingClient"));
  if (v6)
  {
    buffer[0] = *(_OWORD *)"unknown";
    buffer[1] = *(_OWORD *)&qword_100044668;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer lockingClient](self, "lockingClient"));
    uint64_t v8 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue([v7 conn]);
    pid_t pid = xpc_connection_get_pid(v8);
    proc_name(pid, buffer, 0x20u);

    int v10 = *__error();
    char v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer logHandle](self, "logHandle"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer lockingClient](self, "lockingClient"));
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 conn]);
      if (v13)
      {
        id v2 = (void *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer lockingClient](self, "lockingClient"));
        BOOL v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue([v2 conn]);
        pid_t v14 = xpc_connection_get_pid(v3);
      }

      else
      {
        pid_t v14 = -1;
      }

      int v19 = 136315394;
      v20 = buffer;
      __int16 v21 = 1024;
      pid_t v22 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "XPC client <process=%s pid=%d>: Client disconnected.",  (uint8_t *)&v19,  0x12u);
      if (v13)
      {
      }
    }

    *__error() = v10;
    CFErrorRef v15 = (void *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer _abort](self, "_abort"));
    if (v15)
    {
      int v16 = *__error();
      CFErrorRef v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer logHandle](self, "logHandle"));
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buffer[0]) = 138412290;
        *(void *)((char *)buffer + 4) = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "Failed to abort upgrade.: %@",  (uint8_t *)buffer,  0xCu);
      }

      *__error() = v16;
    }

    id v18 = -[UpgradeSequencer _unlockInterface](self, "_unlockInterface");
  }

- (id)_unlockInterface
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer workQueue](self, "workQueue"));
  dispatch_assert_queue_V2(v3);

  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer lockingClient](self, "lockingClient"));
  if (v4)
  {
    -[UpgradeSequencer _disableInterfaceLockTimeout](self, "_disableInterfaceLockTimeout");
    -[UpgradeSequencer setLockingClient:](self, "setLockingClient:", 0LL);
  }

  return 0LL;
}

- (void)_disableInterfaceLockTimeout
{
  signed int v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer workQueue](self, "workQueue"));
  dispatch_assert_queue_V2(v5);

  buffer[0] = *(_OWORD *)"unknown";
  buffer[1] = *(_OWORD *)&qword_100044668;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer lockingClient](self, "lockingClient"));
  id v7 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue([v6 conn]);
  pid_t pid = xpc_connection_get_pid(v7);
  proc_name(pid, buffer, 0x20u);

  int v9 = *__error();
  int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer logHandle](self, "logHandle"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    char v11 = (void *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer lockingClient](self, "lockingClient"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 conn]);
    if (v12)
    {
      id v2 = (void *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer lockingClient](self, "lockingClient"));
      BOOL v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue([v2 conn]);
      pid_t v13 = xpc_connection_get_pid(v3);
    }

    else
    {
      pid_t v13 = -1;
    }

    int v15 = 136315394;
    int v16 = buffer;
    __int16 v17 = 1024;
    pid_t v18 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "XPC client <process=%s pid=%d>: Suspending upgrade lock timeout.",  (uint8_t *)&v15,  0x12u);
    if (v12)
    {
    }
  }

  *__error() = v9;
  pid_t v14 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer lockTimer](self, "lockTimer"));
  dispatch_source_set_timer(v14, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0LL);
}

- (void)_restartInterfaceLockTimeout
{
  signed int v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer workQueue](self, "workQueue"));
  dispatch_assert_queue_V2(v5);

  buffer[0] = *(_OWORD *)"unknown";
  buffer[1] = *(_OWORD *)&qword_100044668;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer lockingClient](self, "lockingClient"));
  id v7 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue([v6 conn]);
  pid_t pid = xpc_connection_get_pid(v7);
  proc_name(pid, buffer, 0x20u);

  int v9 = *__error();
  int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer logHandle](self, "logHandle"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    char v11 = (void *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer lockingClient](self, "lockingClient"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 conn]);
    if (v12)
    {
      id v2 = (void *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer lockingClient](self, "lockingClient"));
      BOOL v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue([v2 conn]);
      pid_t v13 = xpc_connection_get_pid(v3);
    }

    else
    {
      pid_t v13 = -1;
    }

    int v16 = 136315650;
    __int16 v17 = buffer;
    __int16 v18 = 1024;
    pid_t v19 = v13;
    __int16 v20 = 1024;
    int v21 = 10;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "XPC client <process=%s pid=%d>: Giving client another %d seconds to hold lock.",  (uint8_t *)&v16,  0x18u);
    if (v12)
    {
    }
  }

  *__error() = v9;
  pid_t v14 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer lockTimer](self, "lockTimer"));
  dispatch_time_t v15 = dispatch_walltime(0LL, 10000000000LL);
  dispatch_source_set_timer(v14, v15, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
}

- (id)_timeout
{
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer workQueue](self, "workQueue"));
  dispatch_assert_queue_V2(v6);

  CFErrorRef v7 = (CFErrorRef)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer lockingClient](self, "lockingClient"));
  if (v7)
  {
    buffer[0] = *(_OWORD *)"unknown";
    buffer[1] = *(_OWORD *)&qword_100044668;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer lockingClient](self, "lockingClient"));
    int v9 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue([v8 conn]);
    pid_t pid = xpc_connection_get_pid(v9);
    proc_name(pid, buffer, 0x20u);

    char v11 = (void *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer logHandle](self, "logHandle"));
    if (v11)
    {
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer logHandle](self, "logHandle"));
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        uint64_t v13 = 3LL;
      }
      else {
        uint64_t v13 = 2LL;
      }
      pid_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer lockingClient](self, "lockingClient"));
      dispatch_time_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 conn]);
      if (v15)
      {
        BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer lockingClient](self, "lockingClient"));
        unsigned int v4 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue([v3 conn]);
        pid_t v16 = xpc_connection_get_pid(v4);
      }

      else
      {
        pid_t v16 = -1;
      }

      int v25 = 136315650;
      v26 = buffer;
      __int16 v27 = 1024;
      pid_t v28 = v16;
      __int16 v29 = 1024;
      int v30 = 60;
      LODWORD(v24) = 24;
      pid_t v22 = (char *)_os_log_send_and_compose_impl(v13, 0LL, 0LL, 0LL, &_mh_execute_header, v12, 16LL);
      if (v15)
      {
      }
    }

    else
    {
      id v18 = &_os_log_default;
      pid_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer lockingClient](self, "lockingClient"));
      __int16 v20 = (void *)objc_claimAutoreleasedReturnValue([v19 conn]);
      if (v20)
      {
        id v2 = (void *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer lockingClient](self, "lockingClient"));
        BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 conn]);
        pid_t v21 = xpc_connection_get_pid((xpc_connection_t)v3);
      }

      else
      {
        pid_t v21 = -1;
      }

      int v25 = 136315650;
      v26 = buffer;
      __int16 v27 = 1024;
      pid_t v28 = v21;
      __int16 v29 = 1024;
      int v30 = 60;
      LODWORD(v24) = 24;
      pid_t v22 = (char *)_os_log_send_and_compose_impl(2LL, 0LL, 0LL, 0LL, &_mh_execute_header, &_os_log_default, 16LL);
      if (v20)
      {
      }

      id v12 = (os_log_s *)&_os_log_default;
    }

    CFErrorRef v7 = sub_10000A444( "-[UpgradeSequencer _timeout]",  "upgrade_sequencer.m",  697,  "com.apple.security.cryptex.posix",  60LL,  0LL,  v22);
    free(v22);
    __int16 v17 = (void *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer _completeUpgradeWithError:](self, "_completeUpgradeWithError:", v7, &v25, v24));
  }

  else
  {
    __int16 v17 = 0LL;
  }

  return v17;
}

- (id)_abort
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer workQueue](self, "workQueue"));
  dispatch_assert_queue_V2(v3);

  v9[0] = 0;
  LODWORD(v8) = 2;
  unsigned int v4 = (char *)_os_log_send_and_compose_impl(2LL, 0LL, 0LL, 0LL, &_mh_execute_header, &_os_log_default, 16LL);
  CFErrorRef v5 = sub_10000A444( "-[UpgradeSequencer _abort]",  "upgrade_sequencer.m",  712,  "com.apple.security.cryptex",  27LL,  0LL,  v4);
  free(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer _completeUpgradeWithError:](self, "_completeUpgradeWithError:", v5, v9, v8));

  return v6;
}

- (void)_startUpgradeForCryptex:(id)a3 withGraftPath:(id)a4 killingJobs:(BOOL)a5 withCompletion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = (void (**)(id, CFErrorRef))a6;
  uint64_t v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer workQueue](self, "workQueue"));
  dispatch_assert_queue_V2(v13);

  pid_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer upgradesUnderway](self, "upgradesUnderway"));
  dispatch_time_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:v10]);

  if (v15)
  {
    pid_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer logHandle](self, "logHandle"));

    if (v16)
    {
      __int16 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer logHandle](self, "logHandle"));
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        uint64_t v18 = 3LL;
      }
      else {
        uint64_t v18 = 2LL;
      }
      pid_t v19 = (char *)_os_log_send_and_compose_impl(v18, 0LL, 0LL, 0LL, &_mh_execute_header, v17, 16LL);
    }

    else
    {
      pid_t v19 = (char *)_os_log_send_and_compose_impl(2LL, 0LL, 0LL, 0LL, &_mh_execute_header, &_os_log_default, 16LL);
    }

    CFErrorRef v20 = sub_10000A444( "-[UpgradeSequencer _startUpgradeForCryptex:withGraftPath:killingJobs:withCompletion:]",  "upgrade_sequencer.m",  732,  "com.apple.security.cryptex",  29LL,  0LL,  v19);
    free(v19);
    v12[2](v12, v20);
  }

  else
  {
    CFErrorRef v20 = 0LL;
  }

  pid_t v21 = -[UpgradeOperation initWithCryptexName:graftPath:]( objc_alloc(&OBJC_CLASS___UpgradeOperation),  "initWithCryptexName:graftPath:",  v10,  v11);
  pid_t v22 = v21;
  if (v21)
  {
    -[UpgradeOperation startUpgrade](v21, "startUpgrade");
    objc_super v23 = (void *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer upgradesUnderway](self, "upgradesUnderway"));
    [v23 setObject:v22 forKeyedSubscript:v10];

    if (v7) {
      -[UpgradeOperation terminateJobsWithCompletion:](v22, "terminateJobsWithCompletion:", v12);
    }
    else {
      v12[2](v12, 0LL);
    }
    CFErrorRef v28 = v20;
  }

  else
  {
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer logHandle](self, "logHandle"));

    if (v24)
    {
      int v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer logHandle](self, "logHandle"));
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        uint64_t v26 = 3LL;
      }
      else {
        uint64_t v26 = 2LL;
      }
      __int16 v27 = (char *)_os_log_send_and_compose_impl(v26, 0LL, 0LL, 0LL, &_mh_execute_header, v25, 16LL);
    }

    else
    {
      __int16 v27 = (char *)_os_log_send_and_compose_impl(2LL, 0LL, 0LL, 0LL, &_mh_execute_header, &_os_log_default, 16LL);
    }

    CFErrorRef v28 = sub_10000A444( "-[UpgradeSequencer _startUpgradeForCryptex:withGraftPath:killingJobs:withCompletion:]",  "upgrade_sequencer.m",  742,  "com.apple.security.cryptex",  24LL,  0LL,  v27);
    free(v27);

    v12[2](v12, v28);
  }
}

- (id)_completeUpgradeWithError:(id)a3
{
  id v4 = a3;
  CFErrorRef v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer workQueue](self, "workQueue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer upgradesUnderway](self, "upgradesUnderway"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100005E6C;
  v13[3] = &unk_1000552D0;
  id v7 = v4;
  id v14 = v7;
  [v6 enumerateKeysAndObjectsUsingBlock:v13];

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer upgradesUnderway](self, "upgradesUnderway"));
  [v8 removeAllObjects];

  int v9 = (void *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer sessionCompleteCallback](self, "sessionCompleteCallback"));
  if (v9)
  {
    id v10 = (void (**)(void, void))objc_claimAutoreleasedReturnValue( -[UpgradeSequencer sessionCompleteCallback]( self,  "sessionCompleteCallback"));
    ((void (**)(void, id))v10)[2](v10, v7);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[UpgradeSequencer _completeUpgradeSession](self, "_completeUpgradeSession"));

  return v11;
}

- (OS_dispatch_queue)lockAcquireQueue
{
  return self->_lockAcquireQueue;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (OS_dispatch_queue)registrationQueue
{
  return self->_registrationQueue;
}

- (NSMutableDictionary)upgradesUnderway
{
  return self->_upgradesUnderway;
}

- (OS_os_log)logHandle
{
  return self->_logHandle;
}

- (id)sessionCompleteCallback
{
  return self->_sessionCompleteCallback;
}

- (void)setSessionCompleteCallback:(id)a3
{
}

- (UpgradeClient)lockingClient
{
  return self->_lockingClient;
}

- (void)setLockingClient:(id)a3
{
}

- (OS_dispatch_source)lockTimer
{
  return self->_lockTimer;
}

- (void)setLockTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end