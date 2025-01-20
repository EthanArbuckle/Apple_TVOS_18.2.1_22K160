@interface MRDAVOutputDeviceRoute
- (AVOutputDevice)avOutputDevice;
- (MRDAVOutputDeviceRoute)initWithAVOutputDevice:(id)a3;
@end

@implementation MRDAVOutputDeviceRoute

- (MRDAVOutputDeviceRoute)initWithAVOutputDevice:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = [[MRAVOutputDeviceSourceInfo alloc] initWithRoutingContextUID:0 multipleBuiltInDevices:0];
    v7 = -[MRAVConcreteOutputDevice initWithAVOutputDevice:sourceInfo:]( objc_alloc(&OBJC_CLASS___MRAVConcreteOutputDevice),  "initWithAVOutputDevice:sourceInfo:",  v5,  v6);
    v12.receiver = self;
    v12.super_class = (Class)&OBJC_CLASS___MRDAVOutputDeviceRoute;
    v8 = -[MRDOutputDeviceRoute initWithOutputDevice:](&v12, "initWithOutputDevice:", v7);
    v9 = v8;
    if (v8) {
      objc_storeStrong((id *)&v8->_avOutputDevice, a3);
    }
    self = v9;

    v10 = self;
  }

  else
  {
    v10 = 0LL;
  }

  return v10;
}

- (AVOutputDevice)avOutputDevice
{
  return self->_avOutputDevice;
}

- (void).cxx_destruct
{
}

@end