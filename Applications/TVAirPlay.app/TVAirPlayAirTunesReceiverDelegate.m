@interface TVAirPlayAirTunesReceiverDelegate
- (OS_dispatch_queue)receiverQueue;
- (TVAirPlayAirTunesReceiverDelegate)init;
- (void)airPlayReceiverDelegate:(id)a3 postEvent:(id)a4 withInfo:(id)a5;
- (void)setReceiverQueue:(id)a3;
@end

@implementation TVAirPlayAirTunesReceiverDelegate

- (TVAirPlayAirTunesReceiverDelegate)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVAirPlayAirTunesReceiverDelegate;
  v2 = -[TVAirPlayLegacyReceiverDelegate init](&v6, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.tvairplay.airtunesreceiver", 0LL);
    receiverQueue = v2->_receiverQueue;
    v2->_receiverQueue = (OS_dispatch_queue *)v3;

    AirPlayReceiverXPCClient_SetDelegateWithQueue(v2, v2->_receiverQueue);
    -[TVAirPlayLegacyReceiverDelegate setEventSink:](v2, "setEventSink:", v2);
  }

  return v2;
}

- (void)airPlayReceiverDelegate:(id)a3 postEvent:(id)a4 withInfo:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = sub_100004090();
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v18 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "TVAirPlayAirTunesReceiverDelegate: PostEvent: %{public}@",  buf,  0xCu);
  }

  v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[TVAirPlayAirTunesReceiverDelegate receiverQueue](self, "receiverQueue"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10000FD3C;
  v14[3] = &unk_100030EC0;
  id v15 = v7;
  id v16 = v8;
  id v12 = v8;
  id v13 = v7;
  dispatch_async(v11, v14);
}

- (OS_dispatch_queue)receiverQueue
{
  return self->_receiverQueue;
}

- (void)setReceiverQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end