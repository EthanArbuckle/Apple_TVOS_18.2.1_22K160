@interface WiFiManagerHomeHub
- (HHSynchronizedEndpointList)endpointList;
- (OS_dispatch_queue)queue;
- (WiFiManagerHomeHub)initWithManager:(__WiFiManager *)a3 queue:(id)a4 callback:(void *)a5;
- (__WiFiManager)manager;
- (unint64_t)numberOfActiveEndpoints;
- (void)decrementActiveEndpointCount;
- (void)incrementActiveEndpointCount;
- (void)setEndpointList:(id)a3;
- (void)setManager:(__WiFiManager *)a3;
- (void)setQueue:(id)a3;
- (void)setStateUpdatedCallback:(void *)a3;
- (void)stateUpdatedCallback;
- (void)synchronizedEndpointList:(id)a3 didActivateEndpoint:(id)a4;
- (void)synchronizedEndpointList:(id)a3 didAddEndpoint:(id)a4;
- (void)synchronizedEndpointList:(id)a3 didDeactivateEndpoint:(id)a4;
- (void)synchronizedEndpointList:(id)a3 didDeleteEndpoint:(id)a4;
@end

@implementation WiFiManagerHomeHub

- (WiFiManagerHomeHub)initWithManager:(__WiFiManager *)a3 queue:(id)a4 callback:(void *)a5
{
  id v9 = a4;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___WiFiManagerHomeHub;
  v10 = -[WiFiManagerHomeHub init](&v18, "init");
  v11 = v10;
  if (v10)
  {
    v10->_manager = a3;
    objc_storeStrong((id *)&v10->_queue, a4);
    v11->_stateUpdatedCallback = a5;
    v11->_numberOfActiveEndpoints = 0LL;
    if (byte_100219FA0)
    {
      endpointList = v11->_endpointList;
      v11->_endpointList = 0LL;
    }

    else
    {
      endpointList = (HHSynchronizedEndpointList *)objc_claimAutoreleasedReturnValue( +[HHManagementClient clientWithQueue:]( &OBJC_CLASS___HHManagementClient,  "clientWithQueue:",  v9));
      uint64_t v13 = objc_claimAutoreleasedReturnValue( +[HHSynchronizedEndpointList synchronizedEndpointListWithClient:]( &OBJC_CLASS___HHSynchronizedEndpointList,  "synchronizedEndpointListWithClient:",  endpointList));
      v14 = v11->_endpointList;
      v11->_endpointList = (HHSynchronizedEndpointList *)v13;
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiManagerHomeHub endpointList](v11, "endpointList"));
    [v15 setDelegate:v11];

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiManagerHomeHub endpointList](v11, "endpointList"));
    [v16 resume];
  }

  return v11;
}

- (void)synchronizedEndpointList:(id)a3 didAddEndpoint:(id)a4
{
  if (objc_msgSend(a4, "state", a3) == (id)2) {
    -[WiFiManagerHomeHub incrementActiveEndpointCount](self, "incrementActiveEndpointCount");
  }
}

- (void)synchronizedEndpointList:(id)a3 didActivateEndpoint:(id)a4
{
}

- (void)synchronizedEndpointList:(id)a3 didDeactivateEndpoint:(id)a4
{
}

- (void)synchronizedEndpointList:(id)a3 didDeleteEndpoint:(id)a4
{
  if (objc_msgSend(a4, "state", a3) == (id)2) {
    -[WiFiManagerHomeHub decrementActiveEndpointCount](self, "decrementActiveEndpointCount");
  }
}

- (void)incrementActiveEndpointCount
{
}

- (void)decrementActiveEndpointCount
{
}

- (unint64_t)numberOfActiveEndpoints
{
  return self->_numberOfActiveEndpoints;
}

- (HHSynchronizedEndpointList)endpointList
{
  return self->_endpointList;
}

- (void)setEndpointList:(id)a3
{
}

- (__WiFiManager)manager
{
  return self->_manager;
}

- (void)setManager:(__WiFiManager *)a3
{
  self->_manager = a3;
}

- (void)stateUpdatedCallback
{
  return self->_stateUpdatedCallback;
}

- (void)setStateUpdatedCallback:(void *)a3
{
  self->_stateUpdatedCallback = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end