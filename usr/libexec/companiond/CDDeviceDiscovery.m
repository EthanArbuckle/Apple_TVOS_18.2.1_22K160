@interface CDDeviceDiscovery
- (CDDeviceDiscovery)init;
- (OS_dispatch_queue)dispatchQueue;
- (id)deviceFoundHandler;
- (void)_activated;
- (void)_invalidated;
- (void)_startRapportDiscovery;
- (void)_startRapportListener;
- (void)activate;
- (void)invalidate;
- (void)setDeviceFoundHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)startDiscovery;
@end

@implementation CDDeviceDiscovery

- (CDDeviceDiscovery)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CDDeviceDiscovery;
  v2 = -[CDDeviceDiscovery init](&v5, "init");
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
  block[2] = sub_10000E0C0;
  block[3] = &unk_100030910;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000E12C;
  block[3] = &unk_100030910;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)startDiscovery
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000E18C;
  block[3] = &unk_100030910;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_activated
{
  id v2 = sub_10000E200();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Device discovery activated.", v4, 2u);
  }
}

- (void)_invalidated
{
  if (!self->_invalidateDone)
  {
    id deviceFoundHandler = self->_deviceFoundHandler;
    self->_id deviceFoundHandler = 0LL;

    -[CDRapportListener invalidate](self->_rapportListener, "invalidate");
    rapportListener = self->_rapportListener;
    self->_rapportListener = 0LL;

    -[CDRapportDiscovery invalidate](self->_rapportDiscovery, "invalidate");
    rapportDiscovery = self->_rapportDiscovery;
    self->_rapportDiscovery = 0LL;

    self->_invalidateDone = 1;
    id v6 = sub_10000E200();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Device discovery invalidated.", v8, 2u);
    }
  }

- (void)_startRapportListener
{
  v3 = objc_alloc_init(&OBJC_CLASS___CDRapportListener);
  rapportListener = self->_rapportListener;
  self->_rapportListener = v3;

  -[CDRapportListener setDispatchQueue:](self->_rapportListener, "setDispatchQueue:", self->_dispatchQueue);
  objc_super v5 = self->_rapportListener;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10000E37C;
  v6[3] = &unk_100030BE8;
  v6[4] = self;
  -[CDRapportListener setDeviceFoundHandler:](v5, "setDeviceFoundHandler:", v6);
  -[CDRapportListener activate](self->_rapportListener, "activate");
}

- (void)_startRapportDiscovery
{
  rapportDiscovery = self->_rapportDiscovery;
  if (rapportDiscovery)
  {
    -[CDRapportDiscovery resetDiscoveryTimer](rapportDiscovery, "resetDiscoveryTimer");
  }

  else
  {
    v4 = objc_alloc_init(&OBJC_CLASS___CDRapportDiscovery);
    objc_super v5 = self->_rapportDiscovery;
    self->_rapportDiscovery = v4;

    -[CDRapportDiscovery setDispatchQueue:](self->_rapportDiscovery, "setDispatchQueue:", self->_dispatchQueue);
    id v6 = self->_rapportDiscovery;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10000E478;
    v9[3] = &unk_100030BE8;
    v9[4] = self;
    -[CDRapportDiscovery setDeviceFoundHandler:](v6, "setDeviceFoundHandler:", v9);
    v7 = self->_rapportDiscovery;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10000E4E4;
    v8[3] = &unk_100030910;
    v8[4] = self;
    -[CDRapportDiscovery setInvalidationHandler:](v7, "setInvalidationHandler:", v8);
    -[CDRapportDiscovery activate](self->_rapportDiscovery, "activate");
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