@interface BMRapportRequest
- (BMRapportRequest)initWithUUID:(id)a3 activity:(id)a4 requestBlock:(id)a5 queue:(id)a6 completionHandler:(id)a7;
- (BMSyncSessionContext)sessionContext;
- (NSDictionary)errorFromDevice;
- (NSSet)deliveredToDevices;
- (NSSet)inFlightToDevices;
- (NSUUID)uuid;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)requestTimeout;
- (OS_xpc_object)activity;
- (id)completionHandler;
- (id)requestBlock;
- (id)requestTimeoutHandler;
- (unint64_t)state;
- (void)markAsDeliveredToDevice:(id)a3 withError:(id)a4;
- (void)markAsInFlightToDevice:(id)a3;
- (void)requestTimeoutDidFire;
- (void)runRequestOnDevice:(id)a3;
- (void)setActivity:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setDeliveredToDevices:(id)a3;
- (void)setErrorFromDevice:(id)a3;
- (void)setInFlightToDevices:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRequestBlock:(id)a3;
- (void)setRequestTimeout:(id)a3;
- (void)setRequestTimeoutHandler:(id)a3;
- (void)setSessionContext:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setUuid:(id)a3;
- (void)startRequestTimeout;
- (void)stopRequestTimeout;
@end

@implementation BMRapportRequest

- (BMRapportRequest)initWithUUID:(id)a3 activity:(id)a4 requestBlock:(id)a5 queue:(id)a6 completionHandler:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v33.receiver = self;
  v33.super_class = (Class)&OBJC_CLASS___BMRapportRequest;
  v18 = -[BMRapportRequest init](&v33, "init");
  v19 = v18;
  if (v18)
  {
    v18->_state = 0LL;
    objc_storeStrong((id *)&v18->_uuid, a3);
    objc_storeStrong((id *)&v19->_activity, a4);
    id v20 = [v15 copy];
    id requestBlock = v19->_requestBlock;
    v19->_id requestBlock = v20;

    id v22 = [v17 copy];
    id completionHandler = v19->_completionHandler;
    v19->_id completionHandler = v22;

    v24 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
    deliveredToDevices = v19->_deliveredToDevices;
    v19->_deliveredToDevices = v24;

    v26 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
    inFlightToDevices = v19->_inFlightToDevices;
    v19->_inFlightToDevices = v26;

    v28 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    errorFromDevice = v19->_errorFromDevice;
    v19->_errorFromDevice = v28;

    objc_storeStrong((id *)&v19->_queue, a6);
    uint64_t v30 = os_transaction_create("BMRapportRequest");
    transaction = v19->_transaction;
    v19->_transaction = (OS_os_transaction *)v30;

    -[BMRapportRequest startRequestTimeout](v19, "startRequestTimeout");
  }

  return v19;
}

- (void)runRequestOnDevice:(id)a3
{
  id v4 = a3;
  -[BMRapportRequest stopRequestTimeout](self, "stopRequestTimeout");
  self->_state = 1LL;
  v5 = (void (**)(id, id))objc_claimAutoreleasedReturnValue(-[BMRapportRequest requestBlock](self, "requestBlock"));
  v5[2](v5, v4);
}

- (void)markAsInFlightToDevice:(id)a3
{
}

- (void)markAsDeliveredToDevice:(id)a3 withError:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  -[NSMutableSet removeObject:](self->_inFlightToDevices, "removeObject:", v9);
  -[NSMutableSet addObject:](self->_deliveredToDevices, "addObject:", v9);
  if (v6)
  {
    errorFromDevice = self->_errorFromDevice;
    v8 = (void *)objc_claimAutoreleasedReturnValue([v9 rapportIdentifier]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](errorFromDevice, "setObject:forKeyedSubscript:", v6, v8);
  }
}

- (void)startRequestTimeout
{
  requestTimeout = self->_requestTimeout;
  if (requestTimeout)
  {
    dispatch_time_t v3 = dispatch_time(0LL, 30000000000LL);
    dispatch_source_set_timer((dispatch_source_t)requestTimeout, v3, 0xFFFFFFFFFFFFFFFFLL, 0x6FC23AC00uLL);
  }

  else
  {
    v5 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_queue);
    id v6 = self->_requestTimeout;
    self->_requestTimeout = v5;

    v7 = self->_requestTimeout;
    dispatch_time_t v8 = dispatch_time(0LL, 30000000000LL);
    dispatch_source_set_timer((dispatch_source_t)v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0x6FC23AC00uLL);
    objc_initWeak(&location, self);
    id v9 = self->_requestTimeout;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1000080FC;
    v10[3] = &unk_100068A60;
    objc_copyWeak(&v11, &location);
    dispatch_source_set_event_handler((dispatch_source_t)v9, v10);
    dispatch_resume((dispatch_object_t)self->_requestTimeout);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

- (void)stopRequestTimeout
{
  requestTimeout = self->_requestTimeout;
  if (requestTimeout)
  {
    dispatch_source_cancel((dispatch_source_t)requestTimeout);
    id v4 = self->_requestTimeout;
    self->_requestTimeout = 0LL;
  }

- (void)requestTimeoutDidFire
{
  dispatch_time_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportRequest requestTimeoutHandler](self, "requestTimeoutHandler"));

  if (v3)
  {
    id v4 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[BMRapportRequest requestTimeoutHandler](self, "requestTimeoutHandler"));
    v4[2]();
  }

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (OS_xpc_object)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
}

- (id)requestBlock
{
  return self->_requestBlock;
}

- (void)setRequestBlock:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (NSSet)deliveredToDevices
{
  return &self->_deliveredToDevices->super;
}

- (void)setDeliveredToDevices:(id)a3
{
}

- (NSSet)inFlightToDevices
{
  return &self->_inFlightToDevices->super;
}

- (void)setInFlightToDevices:(id)a3
{
}

- (NSDictionary)errorFromDevice
{
  return &self->_errorFromDevice->super;
}

- (void)setErrorFromDevice:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_source)requestTimeout
{
  return self->_requestTimeout;
}

- (void)setRequestTimeout:(id)a3
{
}

- (id)requestTimeoutHandler
{
  return self->_requestTimeoutHandler;
}

- (void)setRequestTimeoutHandler:(id)a3
{
}

- (BMSyncSessionContext)sessionContext
{
  return self->_sessionContext;
}

- (void)setSessionContext:(id)a3
{
}

- (void).cxx_destruct
{
}

@end