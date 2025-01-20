@interface PRWirelessProximityAdapter
- (PRWirelessProximityAdapter)initWithQueue:(id)a3;
- (id)wiproxStateHandler;
- (void)enableSPMIMessagingWithHandler:(id)a3;
- (void)querySPMIMessagingStatusWithHandler:(id)a3;
- (void)rangingDidUpdateState:(id)a3;
- (void)setWiproxStateHandler:(id)a3;
@end

@implementation PRWirelessProximityAdapter

- (PRWirelessProximityAdapter)initWithQueue:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v12 handleFailureInMethod:a2, self, @"PRWirelessProximityAdapter.m", 18, @"Invalid parameter not satisfying: %@", @"queue" object file lineNumber description];
  }

  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___PRWirelessProximityAdapter;
  v7 = -[PRWirelessProximityAdapter init](&v13, "init");
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_queue, a3);
    v9 = -[WPRanging initWithDelegate:queue:]( objc_alloc(&OBJC_CLASS___WPRanging),  "initWithDelegate:queue:",  v8,  v8->_queue);
    wpRanging = v8->_wpRanging;
    v8->_wpRanging = v9;
  }

  return v8;
}

- (void)enableSPMIMessagingWithHandler:(id)a3
{
  id v4 = a3;
  wpRanging = self->_wpRanging;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10026E558;
  v7[3] = &unk_1007B9528;
  id v8 = v4;
  id v6 = v4;
  -[WPRanging enableRanging:reply:](wpRanging, "enableRanging:reply:", 1LL, v7);
}

- (void)querySPMIMessagingStatusWithHandler:(id)a3
{
  id v4 = a3;
  wpRanging = self->_wpRanging;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10026E5E8;
  v7[3] = &unk_1007B9550;
  id v8 = v4;
  id v6 = v4;
  -[WPRanging isRangingEnabledReply:](wpRanging, "isRangingEnabledReply:", v7);
}

- (void)rangingDidUpdateState:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self->_wiproxStateHandler)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10026E68C;
    v7[3] = &unk_1007B9578;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (id)wiproxStateHandler
{
  return objc_getProperty(self, a2, 24LL, 1);
}

- (void)setWiproxStateHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end