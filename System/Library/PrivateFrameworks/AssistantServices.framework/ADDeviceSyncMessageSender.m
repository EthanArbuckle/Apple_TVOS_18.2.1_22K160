@interface ADDeviceSyncMessageSender
- (ADDeviceSyncMessageSender)initWithDeviceIdentifier:(id)a3 messagingService:(id)a4;
- (NSString)deviceIdentifier;
- (void)sendMessage:(id)a3 completion:(id)a4;
@end

@implementation ADDeviceSyncMessageSender

- (ADDeviceSyncMessageSender)initWithDeviceIdentifier:(id)a3 messagingService:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___ADDeviceSyncMessageSender;
  v8 = -[ADDeviceSyncMessageSender init](&v12, "init");
  if (v8)
  {
    v9 = (NSString *)[v6 copy];
    deviceIdentifier = v8->_deviceIdentifier;
    v8->_deviceIdentifier = v9;

    objc_storeWeak((id *)&v8->_messagingService, v7);
  }

  return v8;
}

- (void)sendMessage:(id)a3 completion:(id)a4
{
  id v10 = a3;
  id v6 = (void (**)(id, void, void *))a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_messagingService);
  v8 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained sendMessage:v10 toDeviceWithIdentifier:self->_deviceIdentifier completion:v6];
  }

  else if (v6)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[AFError errorWithCode:description:underlyingError:]( &OBJC_CLASS___AFError,  "errorWithCode:description:underlyingError:",  2403LL,  @"Messaging service is nil.",  0LL));
    v6[2](v6, 0LL, v9);
  }
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void).cxx_destruct
{
}

@end