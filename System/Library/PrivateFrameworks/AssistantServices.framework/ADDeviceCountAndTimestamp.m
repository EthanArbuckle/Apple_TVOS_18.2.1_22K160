@interface ADDeviceCountAndTimestamp
- (NSDate)timestamp;
- (unint64_t)deviceCount;
- (void)setDeviceCount:(unint64_t)a3;
- (void)setTimestamp:(id)a3;
@end

@implementation ADDeviceCountAndTimestamp

- (unint64_t)deviceCount
{
  return self->_deviceCount;
}

- (void)setDeviceCount:(unint64_t)a3
{
  self->_deviceCount = a3;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (void).cxx_destruct
{
}

@end