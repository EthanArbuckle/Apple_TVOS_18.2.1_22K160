@interface AXRDeviceRemoteScrollAccumulator
- (AXRDeviceRemoteScrollAccumulator)init;
- (AXRDeviceRemoteScrollAccumulatorDelegate)delegate;
- (void)_queue_accumulateScrollAmount:(int64_t)a3;
- (void)accumulateScrollAmount:(int64_t)a3;
- (void)setDelegate:(id)a3;
@end

@implementation AXRDeviceRemoteScrollAccumulator

- (AXRDeviceRemoteScrollAccumulator)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___AXRDeviceRemoteScrollAccumulator;
  v2 = -[AXRDeviceRemoteScrollAccumulator init](&v10, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_USER_INTERACTIVE, 0);
    v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.accessibility.axremoted.scroll.accumulator", v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;
  }

  return v2;
}

- (void)accumulateScrollAmount:(int64_t)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000045BC;
  v4[3] = &unk_100008680;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)_queue_accumulateScrollAmount:(int64_t)a3
{
  id v5 = +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  if (v7 - self->_lastScrollEventTime >= 0.25)
  {
    self->_scrollIsActive = 0;
    self->_lastScrollEventTime = v7;
    self->_int64_t currentAccumulatedScroll = a3;
    return;
  }

  int64_t currentAccumulatedScroll = self->_currentAccumulatedScroll;
  self->_scrollIsActive = 1;
  self->_lastScrollEventTime = v7;
  int64_t v9 = currentAccumulatedScroll + a3;
  self->_int64_t currentAccumulatedScroll = v9;
  if (v9 < 51)
  {
    if (v9 > -51) {
      return;
    }
    uint64_t v20 = ax_remote_daemon_log(v5, v6);
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      sub_1000054B8(v21, v22, v23, v24, v25, v26, v27, v28);
    }

    self->_currentAccumulatedScroll += 50LL;
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_100004764;
    v29[3] = &unk_100008610;
    v29[4] = self;
    v19 = v29;
  }

  else
  {
    uint64_t v10 = ax_remote_daemon_log(v5, v6);
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_100005484(v11, v12, v13, v14, v15, v16, v17, v18);
    }

    self->_currentAccumulatedScroll -= 50LL;
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = sub_100004720;
    v30[3] = &unk_100008610;
    v30[4] = self;
    v19 = v30;
  }

  AXPerformBlockAsynchronouslyOnMainThread(v19);
}

- (AXRDeviceRemoteScrollAccumulatorDelegate)delegate
{
  return (AXRDeviceRemoteScrollAccumulatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end