@interface ADPeerLocationPolicy
- (ADPeerLocationPolicy)init;
- (ADPeerLocationPolicyDelegate)delegate;
- (double)allowedTimelimit;
- (void)_cancelTimer;
- (void)_resetTimer;
- (void)locationDataWasRecievedFromPeer;
- (void)locationPeerDidChange;
- (void)setAllowedTimelimit:(double)a3;
- (void)setDelegate:(id)a3;
@end

@implementation ADPeerLocationPolicy

- (ADPeerLocationPolicy)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___ADPeerLocationPolicy;
  v2 = -[ADPeerLocationPolicy init](&v8, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("ADPeerLocationPolicy", v4);

    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v2->_allowedTimelimit = 43200.0;
  }

  return v2;
}

- (void)locationDataWasRecievedFromPeer
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100217BF8;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)locationPeerDidChange
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100217BB0;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_cancelTimer
{
  timerSource = self->_timerSource;
  if (timerSource)
  {
    dispatch_source_cancel((dispatch_source_t)timerSource);
    v4 = self->_timerSource;
    self->_timerSource = 0LL;
  }

- (void)_resetTimer
{
  double allowedTimelimit = self->_allowedTimelimit;
  queue = (dispatch_queue_s *)self->_queue;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100217B74;
  handler[3] = &unk_1004FD940;
  handler[4] = self;
  dispatch_queue_t v5 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, queue);
  double v6 = 4.32e13;
  if (allowedTimelimit > 0.0) {
    double v6 = allowedTimelimit * 1000000000.0;
  }
  uint64_t v7 = (unint64_t)v6;
  dispatch_time_t v8 = dispatch_time(0LL, (unint64_t)v6);
  dispatch_source_set_timer(v5, v8, v7, 0LL);
  dispatch_source_set_event_handler(v5, handler);
  timerSource = self->_timerSource;
  self->_timerSource = (OS_dispatch_source *)v5;

  dispatch_resume((dispatch_object_t)self->_timerSource);
}

- (ADPeerLocationPolicyDelegate)delegate
{
  return (ADPeerLocationPolicyDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (double)allowedTimelimit
{
  return self->_allowedTimelimit;
}

- (void)setAllowedTimelimit:(double)a3
{
  self->_double allowedTimelimit = a3;
}

- (void).cxx_destruct
{
}

@end