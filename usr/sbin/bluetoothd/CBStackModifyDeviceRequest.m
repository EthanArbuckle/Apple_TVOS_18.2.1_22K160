@interface CBStackModifyDeviceRequest
- (CBDevice)device;
- (OS_dispatch_source)timer;
- (id)completionHandler;
- (void)setCompletionHandler:(id)a3;
- (void)setDevice:(id)a3;
- (void)setTimer:(id)a3;
@end

@implementation CBStackModifyDeviceRequest

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (CBDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end