@interface PBHIDEventSystemClient
- (BSAtomicSignal)invalidationSignal;
- (BSMutableIntegerMap)senders;
- (OS_dispatch_queue)queue;
- (PBHIDEventSystemClient)init;
- (PBHIDEventSystemClient)initWithDelegate:(id)a3;
- (PBHIDEventSystemClient)initWithQueue:(id)a3 delegate:(id)a4;
- (PBHIDEventSystemClientDelegate)delegate;
- (__IOHIDEventSystemClient)HIDEventSystemClient;
- (id)senderForEvent:(__IOHIDEvent *)a3;
- (os_unfair_lock_s)lock;
- (void)_queue_processEvent:(__IOHIDEvent *)a3;
- (void)_queue_registerService:(__IOHIDServiceClient *)a3;
- (void)_queue_unregisterService:(__IOHIDServiceClient *)a3;
- (void)dealloc;
- (void)dispatchEvent:(__IOHIDEvent *)a3;
- (void)invalidate;
- (void)setDelegate:(id)a3;
@end

@implementation PBHIDEventSystemClient

- (PBHIDEventSystemClient)initWithQueue:(id)a3 delegate:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    v10 = v9;
    v34.receiver = self;
    v34.super_class = (Class)&OBJC_CLASS___PBHIDEventSystemClient;
    v11 = -[PBHIDEventSystemClient init](&v34, "init");
    v12 = v11;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_queue, a3);
      v13 = objc_alloc_init(&OBJC_CLASS___BSAtomicSignal);
      invalidationSignal = v12->_invalidationSignal;
      v12->_invalidationSignal = v13;

      v12->_lock._os_unfair_lock_opaque = 0;
      v15 = objc_alloc_init(&OBJC_CLASS___BSMutableIntegerMap);
      lock_senders = v12->_lock_senders;
      v12->_lock_senders = v15;

      objc_storeWeak((id *)&v12->_lock_delegate, v10);
      uint64_t v17 = IOHIDEventSystemClientCreateWithType(kCFAllocatorDefault, 1LL, 0LL);
      v12->_HIDEventSystemClient = (__IOHIDEventSystemClient *)v17;
      if (!v17)
      {
        -[BSAtomicSignal signal](v12->_invalidationSignal, "signal");
        v22 = 0LL;
        goto LABEL_7;
      }

      IOHIDEventSystemClientSetDispatchQueue(v17, v12->_queue);
      CFTypeRef v18 = CFRetain(v12->_HIDEventSystemClient);
      HIDEventSystemClient = v12->_HIDEventSystemClient;
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472LL;
      v33[2] = sub_10016424C;
      v33[3] = &unk_1003D0680;
      v33[4] = v18;
      IOHIDEventSystemClientSetCancelHandler(HIDEventSystemClient, v33);
      objc_initWeak(&location, v12);
      v20 = v12->_HIDEventSystemClient;
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472LL;
      v30[2] = sub_100164264;
      v30[3] = &unk_1003D9B48;
      objc_copyWeak(&v31, &location);
      IOHIDEventSystemClientRegisterDeviceMatchingBlock(v20, v30, 0LL, 0LL);
      v21 = v12->_HIDEventSystemClient;
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472LL;
      v28[2] = sub_100164298;
      v28[3] = &unk_1003D9B70;
      objc_copyWeak(&v29, &location);
      IOHIDEventSystemClientRegisterEventBlock(v21, v28, 0LL, 0LL);
      IOHIDEventSystemClientActivate(v12->_HIDEventSystemClient);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1001642CC;
      block[3] = &unk_1003CFEB8;
      v26 = v12;
      dispatch_queue_t v27 = (dispatch_queue_t)v8;
      dispatch_sync(v27, block);

      objc_destroyWeak(&v29);
      objc_destroyWeak(&v31);
      objc_destroyWeak(&location);
    }

    v22 = v12;
LABEL_7:

    return v22;
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"queue != ((void *)0)"));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100287DB8(a2);
  }
  result = (PBHIDEventSystemClient *)_bs_set_crash_log_message([v24 UTF8String]);
  __break(0);
  return result;
}

- (PBHIDEventSystemClient)initWithDelegate:(id)a3
{
  dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = a3;
  dispatch_queue_t v8 = dispatch_queue_create("com.apple.PineBoard.HID.eventSystemClient", v6);

  id v9 = -[PBHIDEventSystemClient initWithQueue:delegate:](self, "initWithQueue:delegate:", v8, v7);
  return v9;
}

- (PBHIDEventSystemClient)init
{
  return -[PBHIDEventSystemClient initWithDelegate:](self, "initWithDelegate:", 0LL);
}

- (void)dealloc
{
  if ((-[BSAtomicSignal hasBeenSignalled](self->_invalidationSignal, "hasBeenSignalled") & 1) != 0)
  {
    HIDEventSystemClient = self->_HIDEventSystemClient;
    if (HIDEventSystemClient)
    {
      CFRelease(HIDEventSystemClient);
      self->_HIDEventSystemClient = 0LL;
    }

    v6.receiver = self;
    v6.super_class = (Class)&OBJC_CLASS___PBHIDEventSystemClient;
    -[PBHIDEventSystemClient dealloc](&v6, "dealloc");
  }

  else
  {
    dispatch_queue_attr_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"instance must be invalidated before being deallocated"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100287E68(a2);
    }
    _bs_set_crash_log_message([v5 UTF8String]);
    __break(0);
  }

- (void)invalidate
{
  if (-[BSAtomicSignal signal](self->_invalidationSignal, "signal"))
  {
    os_unfair_lock_lock_with_options(&self->_lock, 0x10000LL);
    objc_storeWeak((id *)&self->_lock_delegate, 0LL);
    os_unfair_lock_unlock(&self->_lock);
    IOHIDEventSystemClientCancel(self->_HIDEventSystemClient);
  }

- (id)senderForEvent:(__IOHIDEvent *)a3
{
  if (!a3) {
    goto LABEL_13;
  }
  uint64_t SenderID = IOHIDEventGetSenderID(a3);
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[BSMutableIntegerMap objectForKey:](self->_lock_senders, "objectForKey:", SenderID));
  os_unfair_lock_unlock(p_lock);
  if ([v7 category] == (id)1 && sub_100031DB4((uint64_t)a3, 0x10u))
  {
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[PBHIDSender senderMediaRemote](&OBJC_CLASS___PBHIDSender, "senderMediaRemote"));

    id v7 = (void *)v8;
  }

  if (!v7)
  {
    if (sub_100031DB4((uint64_t)a3, 1u))
    {
      uint64_t v9 = objc_claimAutoreleasedReturnValue(+[PBHIDSender senderIR](&OBJC_CLASS___PBHIDSender, "senderIR"));
LABEL_12:
      id v7 = (void *)v9;
      return v7;
    }

    if (sub_100031DB4((uint64_t)a3, 2u))
    {
      uint64_t v9 = objc_claimAutoreleasedReturnValue(+[PBHIDSender senderCEC](&OBJC_CLASS___PBHIDSender, "senderCEC"));
      goto LABEL_12;
    }

    if (sub_100031DB4((uint64_t)a3, 0x10u))
    {
      uint64_t v9 = objc_claimAutoreleasedReturnValue(+[PBHIDSender senderMediaRemote](&OBJC_CLASS___PBHIDSender, "senderMediaRemote"));
      goto LABEL_12;
    }

- (PBHIDEventSystemClientDelegate)delegate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0x10000LL);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lock_delegate);
  os_unfair_lock_unlock(p_lock);
  return (PBHIDEventSystemClientDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0x10000LL);
  p_lock_delegate = &self->_lock_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_lock_delegate);

  if (WeakRetained != v4) {
    objc_storeWeak((id *)p_lock_delegate, v4);
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)dispatchEvent:(__IOHIDEvent *)a3
{
  if (a3)
  {
    IOHIDEventSystemClientDispatchEvent(self->_HIDEventSystemClient, a3);
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"HIDEvent != ((void *)0)"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100287F14(a2);
    }
    _bs_set_crash_log_message([v4 UTF8String]);
    __break(0);
  }

- (void)_queue_registerService:(__IOHIDServiceClient *)a3
{
  dispatch_queue_attr_t v5 = -[PBHIDSender initWithHIDServiceClient:](objc_alloc(&OBJC_CLASS___PBHIDSender), "initWithHIDServiceClient:", a3);
  objc_super v6 = v5;
  if (v5 && -[PBHIDSender senderID](v5, "senderID"))
  {
    os_unfair_lock_lock(&self->_lock);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_lock_delegate);
    -[BSMutableIntegerMap setObject:forKey:]( self->_lock_senders,  "setObject:forKey:",  v6,  -[PBHIDSender senderID](v6, "senderID"));
    os_unfair_lock_unlock(&self->_lock);
    uint64_t v8 = self->_queue;
    objc_initWeak(&location, self);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100164968;
    v10[3] = &unk_1003D9B98;
    uint64_t v9 = v8;
    v11 = v9;
    objc_copyWeak(&v12, &location);
    IOHIDServiceClientRegisterRemovalBlock(a3, v10, 0LL, 0LL);
    [WeakRetained eventSystemClient:self didRegisterSender:v6];
    objc_destroyWeak(&v12);

    objc_destroyWeak(&location);
  }
}

- (void)_queue_unregisterService:(__IOHIDServiceClient *)a3
{
  id v4 = sub_100031CC4(a3);
  if (v4)
  {
    dispatch_queue_attr_t v5 = v4;
    os_unfair_lock_lock(&self->_lock);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_lock_delegate);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[BSMutableIntegerMap objectForKey:](self->_lock_senders, "objectForKey:", v5));
    if (v7)
    {
      -[BSMutableIntegerMap removeObjectForKey:](self->_lock_senders, "removeObjectForKey:", v5);
      os_unfair_lock_unlock(&self->_lock);
      [WeakRetained eventSystemClient:self didUnregisterSender:v7];
    }

    else
    {
      os_unfair_lock_unlock(&self->_lock);
    }
  }

- (void)_queue_processEvent:(__IOHIDEvent *)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0x10000LL);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lock_delegate);
  os_unfair_lock_unlock(p_lock);
  [WeakRetained eventSystemClient:self didReceiveEvent:a3];
}

- (BSMutableIntegerMap)senders
{
  return self->_lock_senders;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (__IOHIDEventSystemClient)HIDEventSystemClient
{
  return self->_HIDEventSystemClient;
}

- (BSAtomicSignal)invalidationSignal
{
  return self->_invalidationSignal;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void).cxx_destruct
{
}

@end