@interface BKHIDEventClient
- (BKHIDEventClient)init;
- (BKHIDEventClient)initWithPid:(int)a3 sendRight:(id)a4;
- (BKHIDEventClient)initWithPid:(int)a3 sendRight:(id)a4 queue:(id)a5;
- (BKHIDEventClient)initWithPid:(int)a3 sendRight:(id)a4 queue:(id)a5 processName:(id)a6;
- (BKHIDEventClientDelegate)delegate;
- (BOOL)_deathByPid;
- (BOOL)_deathBySendRight;
- (BOOL)isTerminating;
- (BSMachPortSendRight)sendRight;
- (NSString)description;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int)pid;
- (void)_queue_invalidate;
- (void)_queue_performDelegateCallout:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)setDelegate:(id)a3;
- (void)setTerminating:(BOOL)a3;
@end

@implementation BKHIDEventClient

- (BKHIDEventClient)init
{
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"use initWithPid:..."));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    v5 = NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v8 = (objc_class *)objc_opt_class(self, v7);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    int v12 = 138544642;
    v13 = v6;
    __int16 v14 = 2114;
    v15 = v10;
    __int16 v16 = 2048;
    v17 = self;
    __int16 v18 = 2114;
    v19 = @"BKHIDEventClient.m";
    __int16 v20 = 1024;
    int v21 = 29;
    __int16 v22 = 2114;
    v23 = v4;
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  (uint8_t *)&v12,  0x3Au);
  }

  result = (BKHIDEventClient *)_bs_set_crash_log_message([v4 UTF8String]);
  __break(0);
  return result;
}

- (BKHIDEventClient)initWithPid:(int)a3 sendRight:(id)a4
{
  return -[BKHIDEventClient initWithPid:sendRight:queue:](self, "initWithPid:sendRight:queue:", *(void *)&a3, a4, 0LL);
}

- (BKHIDEventClient)initWithPid:(int)a3 sendRight:(id)a4 queue:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a5;
  id v9 = a4;
  uint64_t v10 = BSProcessDescriptionForPID(v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  int v12 = -[BKHIDEventClient initWithPid:sendRight:queue:processName:]( self,  "initWithPid:sendRight:queue:processName:",  v6,  v9,  v8,  v11);

  return v12;
}

- (BKHIDEventClient)initWithPid:(int)a3 sendRight:(id)a4 queue:(id)a5 processName:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v40.receiver = self;
  v40.super_class = (Class)&OBJC_CLASS___BKHIDEventClient;
  __int16 v14 = -[BKHIDEventClient init](&v40, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_queue, a5);
    if (!v15->_queue)
    {
      v17 = (objc_class *)objc_opt_class(v15, v16);
      __int16 v18 = NSStringFromClass(v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      __int16 v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: (pid: %d) %p>",  v19,  v15->_queue_pid,  v15));
      uint64_t Serial = BSDispatchQueueCreateSerial(v20);
      queue = v15->_queue;
      v15->_queue = (OS_dispatch_queue *)Serial;
    }

    v15->_uint64_t queue_pid = a3;
    objc_storeStrong((id *)&v15->_queue_sendRight, a4);
    if (a3 >= 1)
    {
      v23 = (NSString *)[v13 copy];
      queue_procName = v15->_queue_procName;
      v15->_queue_procName = v23;
    }

    if (-[BKHIDEventClient _deathByPid](v15, "_deathByPid"))
    {
      v25 = objc_alloc(&OBJC_CLASS___BSProcessDeathWatcher);
      uint64_t queue_pid = v15->_queue_pid;
      v27 = v15->_queue;
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472LL;
      v38[2] = sub_100009F6C;
      v38[3] = &unk_1000B8058;
      v28 = (id *)&v39;
      v29 = v15;
      v39 = v29;
      v30 = -[BSProcessDeathWatcher initWithPID:queue:deathHandler:]( v25,  "initWithPID:queue:deathHandler:",  queue_pid,  v27,  v38);
      queue_pidWatcher = v29->_queue_pidWatcher;
      v29->_queue_pidWatcher = v30;

LABEL_10:
      goto LABEL_11;
    }

    if (-[BKHIDEventClient _deathBySendRight](v15, "_deathBySendRight"))
    {
      v32 = -[BSPortDeathSentinel initWithSendRight:]( objc_alloc(&OBJC_CLASS___BSPortDeathSentinel),  "initWithSendRight:",  v15->_queue_sendRight);
      queue_portSentinel = v15->_queue_portSentinel;
      v15->_queue_portSentinel = v32;

      -[BSPortDeathSentinel setQueue:](v15->_queue_portSentinel, "setQueue:", v15->_queue);
      v34 = v15->_queue_portSentinel;
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472LL;
      v36[2] = sub_10000A05C;
      v36[3] = &unk_1000B8058;
      v28 = (id *)&v37;
      v37 = v15;
      -[BSPortDeathSentinel activateWithHandler:](v34, "activateWithHandler:", v36);
      goto LABEL_10;
    }
  }

- (void)dealloc
{
  if (!self->_queue_invalidated)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_queue_invalidated"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      id v8 = NSStringFromSelector(a2);
      id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      id v11 = (objc_class *)objc_opt_class(self, v10);
      id v12 = NSStringFromClass(v11);
      id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      *(_DWORD *)buf = 138544642;
      *(void *)&buf[4] = v9;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v13;
      *(_WORD *)&buf[22] = 2048;
      int v21 = self;
      LOWORD(v22) = 2114;
      *(void *)((char *)&v22 + 2) = @"BKHIDEventClient.m";
      WORD5(v22) = 1024;
      HIDWORD(v22) = 79;
      __int16 v23 = 2114;
      v24 = v7;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
    }

    _bs_set_crash_log_message([v7 UTF8String]);
    __break(0);
    JUMPOUT(0x1000099ACLL);
  }

  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  int v21 = (BKHIDEventClient *)sub_100009ECC;
  *(void *)&__int128 v22 = sub_100009EDC;
  v3 = self->_queue;
  *((void *)&v22 + 1) = v3;
  v18[0] = 0LL;
  v18[1] = v18;
  v18[2] = 0x3032000000LL;
  v18[3] = sub_100009ECC;
  v18[4] = sub_100009EDC;
  v19 = self->_queue_sendRight;
  v16[0] = 0LL;
  v16[1] = v16;
  v16[2] = 0x3032000000LL;
  v16[3] = sub_100009ECC;
  v16[4] = sub_100009EDC;
  v17 = self->_queue_procName;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100009F18;
  block[3] = &unk_1000B5778;
  block[4] = buf;
  block[5] = v18;
  block[6] = v16;
  dispatch_async((dispatch_queue_t)v3, block);
  queue = self->_queue;
  self->_queue = 0LL;

  queue_delegate = self->_queue_delegate;
  self->_queue_delegate = 0LL;

  self->_uint64_t queue_pid = -1;
  _Block_object_dispose(v16, 8);

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(buf, 8);

  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___BKHIDEventClient;
  -[BKHIDEventClient dealloc](&v14, "dealloc");
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100009EF8;
  v7[3] = &unk_1000B8030;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (BKHIDEventClientDelegate)delegate
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = sub_100009ECC;
  uint64_t v10 = sub_100009EDC;
  id v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100009EE4;
  v5[3] = &unk_1000B8080;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (BKHIDEventClientDelegate *)v3;
}

- (void)invalidate
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100009EC4;
  block[3] = &unk_1000B8058;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (NSString)description
{
  return (NSString *)-[BKHIDEventClient descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0LL);
}

- (id)succinctDescription
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKHIDEventClient succinctDescriptionBuilder](self, "succinctDescriptionBuilder"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 build]);

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return +[BSDescriptionBuilder builderWithObject:](&OBJC_CLASS___BSDescriptionBuilder, "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[BKHIDEventClient descriptionBuilderWithMultilinePrefix:]( self,  "descriptionBuilderWithMultilinePrefix:",  a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKHIDEventClient succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3));
  v5 = v4;
  queue_procName = self->_queue_procName;
  if (queue_procName) {
    id v7 = [v4 appendObject:queue_procName withName:@"name"];
  }
  else {
    id v8 = [v4 appendInt:self->_queue_pid withName:@"pid"];
  }
  queue_sendRight = self->_queue_sendRight;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100009E60;
  v12[3] = &unk_1000B57A0;
  id v10 = v5;
  id v13 = v10;
  -[BSMachPortSendRight accessPort:](queue_sendRight, "accessPort:", v12);

  return v10;
}

- (BOOL)_deathByPid
{
  return 1;
}

- (BOOL)_deathBySendRight
{
  return 0;
}

- (void)_queue_invalidate
{
  if (!self->_queue_invalidated)
  {
    self->_queue_invalidated = 1;
    queue_delegate = self->_queue_delegate;
    self->_queue_delegate = 0LL;

    -[BSProcessDeathWatcher invalidate](self->_queue_pidWatcher, "invalidate");
    queue_pidWatcher = self->_queue_pidWatcher;
    self->_queue_pidWatcher = 0LL;

    -[BSPortDeathSentinel invalidate](self->_queue_portSentinel, "invalidate");
    queue_portSentinel = self->_queue_portSentinel;
    self->_queue_portSentinel = 0LL;
  }

- (void)_queue_performDelegateCallout:(id)a3
{
  id v4 = a3;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100009E1C;
  v8[3] = &unk_1000B73F0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (int)pid
{
  return self->_queue_pid;
}

- (BSMachPortSendRight)sendRight
{
  return self->_queue_sendRight;
}

- (BOOL)isTerminating
{
  return self->_terminating;
}

- (void)setTerminating:(BOOL)a3
{
  self->_terminating = a3;
}

- (void).cxx_destruct
{
}

@end