@interface AKDeviceListRequestProvider
- (AKDeviceListRequestContext)deviceRequestContext;
- (unint64_t)expectedResponseType;
- (void)requestURLWithCompletion:(id)a3;
- (void)setDeviceRequestContext:(id)a3;
@end

@implementation AKDeviceListRequestProvider

- (void)requestURLWithCompletion:(id)a3
{
  v5[1] = 3221225472LL;
  v5[2] = sub_10002FB8C;
  v5[3] = &unk_1001C6B10;
  v6 = self;
  id v7 = a3;
  v4.receiver = v6;
  v4.super_class = (Class)&OBJC_CLASS___AKDeviceListRequestProvider;
  v5[0] = _NSConcreteStackBlock;
  id v3 = v7;
  -[AKURLRequestProviderImpl requestURLWithCompletion:](&v4, "requestURLWithCompletion:", v5);
}

- (unint64_t)expectedResponseType
{
  return 1LL;
}

- (AKDeviceListRequestContext)deviceRequestContext
{
  return self->_deviceRequestContext;
}

- (void)setDeviceRequestContext:(id)a3
{
}

- (void).cxx_destruct
{
}

@end