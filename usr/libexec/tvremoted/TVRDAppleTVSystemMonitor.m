@interface TVRDAppleTVSystemMonitor
- (TVRDAppleTVSystemMonitor)init;
- (int64_t)attentionState;
@end

@implementation TVRDAppleTVSystemMonitor

- (TVRDAppleTVSystemMonitor)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVRDAppleTVSystemMonitor;
  v2 = -[TVRDAppleTVSystemMonitor init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    v2->_attentionState = 1;
    objc_initWeak(&location, v2);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = __32__TVRDAppleTVSystemMonitor_init__block_invoke;
    v5[3] = &unk_100020BF0;
    objc_copyWeak(&v6, &location);
    +[PBSSystemStatus addPermanentObserverForProperty:notifyInitial:invokeOnMainThread:handler:]( &OBJC_CLASS___PBSSystemStatus,  "addPermanentObserverForProperty:notifyInitial:invokeOnMainThread:handler:",  @"systemAttentionState",  1LL,  1LL,  v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }

  return v3;
}

void __32__TVRDAppleTVSystemMonitor_init__block_invoke(uint64_t a1)
{
  WeakRetained = (unsigned int *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (char *)+[PBSSystemStatus systemAttentionState](&OBJC_CLASS___PBSSystemStatus, "systemAttentionState");
    uint64_t v3 = (unint64_t)(v2 - 1) > 4 ? 1LL : qword_100019858[(void)(v2 - 1)];
    v4 = WeakRetained + 2;
    do
      unsigned int v5 = __ldaxr(v4);
    while (__stlxr(v3, v4));
    if (v3 != v5)
    {
      id v6 = _TVRDXPCLog();
      v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        if ((unint64_t)(v3 - 1) >= 3) {
          objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %ld)",  v3));
        }
        else {
          objc_super v8 = off_100020DF8[v3 - 1];
        }
        *(_DWORD *)buf = 138543362;
        v11 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "System attention state changed: %{public}@",  buf,  0xCu);
      }

      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      [v9 postNotificationName:@"TVRDAppleTVSystemMonitorAttentionStateChangedNotification" object:WeakRetained];
    }
  }
}

- (int64_t)attentionState
{
  return atomic_load(&self->_attentionState);
}

@end