@interface CDRapportListener
- (CDRapportListener)init;
- (OS_dispatch_queue)dispatchQueue;
- (id)deviceFoundHandler;
- (void)_activated;
- (void)_handleEvent:(id)a3;
- (void)_invalidated;
- (void)activate;
- (void)invalidate;
- (void)setDeviceFoundHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
@end

@implementation CDRapportListener

- (CDRapportListener)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CDRapportListener;
  v2 = -[CDRapportListener init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, &_dispatch_main_q);
    v3->_activateCalledAtomic = 0;
  }

  return v3;
}

- (void)setDispatchQueue:(id)a3
{
}

- (void)activate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000101BC;
  block[3] = &unk_100030910;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100010228;
  block[3] = &unk_100030910;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_activated
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000102EC;
  v4[3] = &unk_100030CC8;
  objc_copyWeak(&v5, &location);
  xpc_set_event_stream_handler("com.apple.rapport.matching", dispatchQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_invalidated
{
  if (!self->_invalidateDone)
  {
    id deviceFoundHandler = self->_deviceFoundHandler;
    self->_id deviceFoundHandler = 0LL;

    self->_invalidateDone = 1;
  }

- (void)_handleEvent:(id)a3
{
  xpc_object_t xdict = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  string = xpc_dictionary_get_string(xdict, _xpc_event_key_name);
  id v5 = xpc_dictionary_get_string(xdict, "deviceID");
  if (string) {
    BOOL v6 = v5 == 0LL;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    id deviceFoundHandler = (void (**)(id, void *, uint64_t))self->_deviceFoundHandler;
    if (deviceFoundHandler)
    {
      v8 = v5;
      if (!strcmp(string, "CompanionAuthenticationDiscovery"))
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v8));
        deviceFoundHandler[2](deviceFoundHandler, v9, 1LL);
      }

      else
      {
        if (strcmp(string, "LegacyAppSignInDiscovery")) {
          goto LABEL_11;
        }
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v8));
        deviceFoundHandler[2](deviceFoundHandler, v9, 2LL);
      }
    }
  }

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (id)deviceFoundHandler
{
  return self->_deviceFoundHandler;
}

- (void)setDeviceFoundHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end