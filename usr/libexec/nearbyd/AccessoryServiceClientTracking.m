@interface AccessoryServiceClientTracking
- (AccessoryServiceClientTracking)initWithNIConfiguration:(id)a3 parsedAccessoryConfigData:(const void *)a4 processName:(id)a5 uwbSessionId:(unsigned int)a6;
- (BOOL)isRunning;
- (NINearbyAccessoryConfiguration)niConfiguration;
- (NSString)processName;
- (const)parsedAccessoryConfigData;
- (id).cxx_construct;
- (unsigned)uwbSessionId;
- (void)setIsRunning:(BOOL)a3;
@end

@implementation AccessoryServiceClientTracking

- (AccessoryServiceClientTracking)initWithNIConfiguration:(id)a3 parsedAccessoryConfigData:(const void *)a4 processName:(id)a5 uwbSessionId:(unsigned int)a6
{
  id v11 = a3;
  id v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___AccessoryServiceClientTracking;
  v13 = -[AccessoryServiceClientTracking init](&v16, "init");
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_niConfiguration, a3);
    sub_10024EC2C((uint64_t)&v14->_parsedAccessoryConfigData, (uint64_t)a4);
    objc_storeStrong((id *)&v14->_processName, a5);
    v14->_uwbSessionId = a6;
    v14->_isRunning = 0;
  }

  return v14;
}

- (const)parsedAccessoryConfigData
{
  return &self->_parsedAccessoryConfigData;
}

- (NINearbyAccessoryConfiguration)niConfiguration
{
  return self->_niConfiguration;
}

- (NSString)processName
{
  return self->_processName;
}

- (unsigned)uwbSessionId
{
  return self->_uwbSessionId;
}

- (BOOL)isRunning
{
  return self->_isRunning;
}

- (void)setIsRunning:(BOOL)a3
{
  self->_isRunning = a3;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((_BYTE *)self + 8) = 0;
  *((_BYTE *)self + 47) = 0;
  return self;
}

@end