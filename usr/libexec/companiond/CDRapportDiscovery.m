@interface CDRapportDiscovery
- (CDRapportDiscovery)init;
- (OS_dispatch_queue)dispatchQueue;
- (id)deviceFoundHandler;
- (id)invalidationHandler;
- (void)_activated;
- (void)_handleDeviceFound:(id)a3;
- (void)_invalidated;
- (void)_startDiscoveryTimer;
- (void)activate;
- (void)invalidate;
- (void)resetDiscoveryTimer;
- (void)setDeviceFoundHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInvalidationHandler:(id)a3;
@end

@implementation CDRapportDiscovery

- (CDRapportDiscovery)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CDRapportDiscovery;
  v2 = -[CDRapportDiscovery init](&v5, "init");
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
  block[2] = sub_10000E650;
  block[3] = &unk_100030910;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000E6BC;
  block[3] = &unk_100030910;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)resetDiscoveryTimer
{
}

- (void)_activated
{
  v3 = objc_alloc_init(&OBJC_CLASS___RPCompanionLinkClient);
  rapportClient = self->_rapportClient;
  self->_rapportClient = v3;

  -[RPCompanionLinkClient setRssiThreshold:](self->_rapportClient, "setRssiThreshold:", -75LL);
  objc_super v5 = self->_rapportClient;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10000E7CC;
  v8[3] = &unk_100030C30;
  v8[4] = self;
  -[RPCompanionLinkClient setDeviceFoundHandler:](v5, "setDeviceFoundHandler:", v8);
  -[RPCompanionLinkClient setDispatchQueue:](self->_rapportClient, "setDispatchQueue:", self->_dispatchQueue);
  -[RPCompanionLinkClient setControlFlags:](self->_rapportClient, "setControlFlags:", 0x82004113800LL);
  v6 = self->_rapportClient;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000E7D8;
  v7[3] = &unk_1000309B0;
  v7[4] = self;
  -[RPCompanionLinkClient activateWithCompletion:](v6, "activateWithCompletion:", v7);
}

- (void)_invalidated
{
  if (!self->_invalidateDone)
  {
    -[RPCompanionLinkClient invalidate](self->_rapportClient, "invalidate");
    rapportClient = self->_rapportClient;
    self->_rapportClient = 0LL;

    -[BSContinuousMachTimer invalidate](self->_discoveryTimer, "invalidate");
    discoveryTimer = self->_discoveryTimer;
    self->_discoveryTimer = 0LL;

    id deviceFoundHandler = self->_deviceFoundHandler;
    self->_id deviceFoundHandler = 0LL;

    invalidationHandler = (void (**)(void))self->_invalidationHandler;
    if (invalidationHandler)
    {
      invalidationHandler[2]();
      id v7 = self->_invalidationHandler;
      self->_invalidationHandler = 0LL;
    }

    self->_invalidateDone = 1;
    id v8 = sub_10000E8A0();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Discovery invalidated.", v10, 2u);
    }
  }

- (void)_handleDeviceFound:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v4 idsDeviceIdentifier]);
  if (v5)
  {
    if (self->_deviceFoundHandler)
    {
      if (([v4 statusFlags] & 0x40000000) != 0)
      {
        v6 = (void (*)(void))*((void *)self->_deviceFoundHandler + 2);
        goto LABEL_10;
      }

      if (([v4 statusFlags] & 0x200000) != 0)
      {
        v6 = (void (*)(void))*((void *)self->_deviceFoundHandler + 2);
LABEL_10:
        v6();
      }
    }
  }

  else
  {
    id v7 = sub_10000E8A0();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10001F34C((uint64_t)v4, v8, v9, v10, v11, v12, v13, v14);
    }
  }
}

- (void)_startDiscoveryTimer
{
  id v3 = sub_10000E8A0();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Starting discovery timer.", buf, 2u);
  }

  discoveryTimer = self->_discoveryTimer;
  if (!discoveryTimer)
  {
    v6 = -[BSContinuousMachTimer initWithIdentifier:]( objc_alloc(&OBJC_CLASS___BSContinuousMachTimer),  "initWithIdentifier:",  @"CDRapportDiscovery.discoveryTimer");
    id v7 = self->_discoveryTimer;
    self->_discoveryTimer = v6;

    discoveryTimer = self->_discoveryTimer;
  }

  dispatchQueue = self->_dispatchQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10000EB54;
  v9[3] = &unk_100030A98;
  v9[4] = self;
  -[BSContinuousMachTimer scheduleWithFireInterval:leewayInterval:queue:handler:]( discoveryTimer,  "scheduleWithFireInterval:leewayInterval:queue:handler:",  dispatchQueue,  v9,  30.0,  1.0);
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

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end