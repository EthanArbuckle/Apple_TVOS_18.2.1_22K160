@interface MRDProximityLockScreenRoutingProvider
- (BOOL)invalidated;
- (MRDLockScreenRoutingProviderDelegate)delegate;
- (MRDProximityLockScreenRoutingProvider)initWithDispatchQueue:(id)a3;
- (NSArray)nearbyDeviceIdentifiers;
- (NSMutableSet)nearbyDevices;
- (OS_dispatch_queue)queue;
- (void)clearNearbyDevices;
- (void)setDelegate:(id)a3;
- (void)setInvalidated:(BOOL)a3;
- (void)setNearbyDevices:(id)a3;
- (void)setQueue:(id)a3;
- (void)startObservationIfNeeded;
@end

@implementation MRDProximityLockScreenRoutingProvider

- (MRDProximityLockScreenRoutingProvider)initWithDispatchQueue:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MRDProximityLockScreenRoutingProvider;
  v6 = -[MRDProximityLockScreenRoutingProvider init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    v6->_invalidated = 1;
    objc_storeStrong((id *)&v6->_queue, a3);
    v8 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    nearbyDevices = v7->_nearbyDevices;
    v7->_nearbyDevices = v8;

    -[MRDProximityLockScreenRoutingProvider startObservationIfNeeded](v7, "startObservationIfNeeded");
  }

  return v7;
}

- (NSArray)nearbyDeviceIdentifiers
{
  return (NSArray *)&__NSArray0__struct;
}

- (void)startObservationIfNeeded
{
  uint64_t v3 = _MRLogForCategory(7LL, a2);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v8 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[ProximityProvider] startObservationIfNeeded (%p)",  buf,  0xCu);
  }

  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDProximityLockScreenRoutingProvider queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001DFBC;
  block[3] = &unk_100399250;
  block[4] = self;
  dispatch_async(v5, block);
}

- (void)clearNearbyDevices
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MRDProximityLockScreenRoutingProvider nearbyDevices](self, "nearbyDevices"));
  id v4 = [v3 count];

  if (v4)
  {
    uint64_t v6 = _MRLogForCategory(7LL, v5);
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[ProximityProvider] Removing all nearby devices.",  v9,  2u);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRDProximityLockScreenRoutingProvider nearbyDevices](self, "nearbyDevices"));
    [v8 removeAllObjects];
  }

- (MRDLockScreenRoutingProviderDelegate)delegate
{
  return (MRDLockScreenRoutingProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSMutableSet)nearbyDevices
{
  return self->_nearbyDevices;
}

- (void)setNearbyDevices:(id)a3
{
}

- (void).cxx_destruct
{
}

@end