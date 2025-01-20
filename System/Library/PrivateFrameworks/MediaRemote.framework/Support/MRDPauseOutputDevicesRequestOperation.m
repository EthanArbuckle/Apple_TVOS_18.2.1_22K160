@interface MRDPauseOutputDevicesRequestOperation
- (NSSet)devicesInGroup;
- (NSSet)relevantOutputDeviceUIDs;
- (NSSet)relevantOutputDevices;
- (NSString)reason;
- (int64_t)type;
- (void)setDevicesInGroup:(id)a3;
- (void)setReason:(id)a3;
- (void)setRelevantOutputDevices:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation MRDPauseOutputDevicesRequestOperation

- (NSSet)relevantOutputDeviceUIDs
{
  v3 = objc_alloc(&OBJC_CLASS___NSSet);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSSet msv_compactMap:](self->_relevantOutputDevices, "msv_compactMap:", &stru_10039D480));
  v5 = -[NSSet initWithArray:](v3, "initWithArray:", v4);

  return v5;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSSet)devicesInGroup
{
  return self->_devicesInGroup;
}

- (void)setDevicesInGroup:(id)a3
{
}

- (NSSet)relevantOutputDevices
{
  return self->_relevantOutputDevices;
}

- (void)setRelevantOutputDevices:(id)a3
{
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
}

- (void).cxx_destruct
{
}

@end