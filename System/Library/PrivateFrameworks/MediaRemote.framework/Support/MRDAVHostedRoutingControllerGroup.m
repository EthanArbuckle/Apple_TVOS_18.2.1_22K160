@interface MRDAVHostedRoutingControllerGroup
- (MRAVDistantEndpoint)distantEndpoint;
- (MRConcreteEndpoint)concreteEndpoint;
- (MRDAVHostedExternalDevice)externalDevice;
- (MRDAVHostedRoutingControllerGroup)initWithEndpoint:(id)a3 externalDevice:(id)a4;
- (id)description;
@end

@implementation MRDAVHostedRoutingControllerGroup

- (MRDAVHostedRoutingControllerGroup)initWithEndpoint:(id)a3 externalDevice:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___MRDAVHostedRoutingControllerGroup;
  v9 = -[MRDAVHostedRoutingControllerGroup init](&v17, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_concreteEndpoint, a3);
    objc_storeStrong((id *)&v10->_externalDevice, a4);
    v11 = objc_alloc(&OBJC_CLASS___MRAVDistantEndpoint);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v7 descriptor]);
    v13 = -[MRAVDistantEndpoint initWithDescriptor:](v11, "initWithDescriptor:", v12);

    v14 = (void *)objc_claimAutoreleasedReturnValue([v8 externalDeviceListenerEndpoint]);
    -[MRAVDistantEndpoint setExternalDeviceListenerEndpoint:](v13, "setExternalDeviceListenerEndpoint:", v14);

    distantEndpoint = v10->_distantEndpoint;
    v10->_distantEndpoint = v13;
  }

  return v10;
}

- (id)description
{
  return  -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@ - %@",  self->_concreteEndpoint,  self->_externalDevice);
}

- (MRConcreteEndpoint)concreteEndpoint
{
  return self->_concreteEndpoint;
}

- (MRAVDistantEndpoint)distantEndpoint
{
  return self->_distantEndpoint;
}

- (MRDAVHostedExternalDevice)externalDevice
{
  return self->_externalDevice;
}

- (void).cxx_destruct
{
}

@end