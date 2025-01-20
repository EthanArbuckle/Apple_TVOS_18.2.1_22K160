@interface GTCaptureObjects
+ (BOOL)supportsSecureCoding;
- (GTCaptureObjects)initWithCoder:(id)a3;
- (NSArray)captureScopes;
- (NSArray)commandQueues;
- (NSArray)devices;
- (NSArray)metalLayers;
- (void)encodeWithCoder:(id)a3;
- (void)setCaptureScopes:(id)a3;
- (void)setCommandQueues:(id)a3;
- (void)setDevices:(id)a3;
- (void)setMetalLayers:(id)a3;
@end

@implementation GTCaptureObjects

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTCaptureObjects)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___GTCaptureObjects;
  v5 = -[GTCaptureObjects init](&v19, "init");
  if (v5)
  {
    id v6 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class(DYGTMTLDeviceProfile) forKey:@"devices"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    devices = v5->_devices;
    v5->_devices = (NSArray *)v7;

    id v9 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class(DYGTMTLCommandQueueInfo) forKey:@"commandQueues"];
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    commandQueues = v5->_commandQueues;
    v5->_commandQueues = (NSArray *)v10;

    id v12 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class(DYGTMTLCaptureScopeInfo) forKey:@"captureScopes"];
    uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
    captureScopes = v5->_captureScopes;
    v5->_captureScopes = (NSArray *)v13;

    id v15 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class(DYGTCAMetalLayerInfo) forKey:@"metalLayers"];
    uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
    metalLayers = v5->_metalLayers;
    v5->_metalLayers = (NSArray *)v16;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  devices = self->_devices;
  id v5 = a3;
  [v5 encodeObject:devices forKey:@"devices"];
  [v5 encodeObject:self->_commandQueues forKey:@"commandQueues"];
  [v5 encodeObject:self->_captureScopes forKey:@"captureScopes"];
  [v5 encodeObject:self->_metalLayers forKey:@"metalLayers"];
}

- (NSArray)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
}

- (NSArray)commandQueues
{
  return self->_commandQueues;
}

- (void)setCommandQueues:(id)a3
{
}

- (NSArray)captureScopes
{
  return self->_captureScopes;
}

- (void)setCaptureScopes:(id)a3
{
}

- (NSArray)metalLayers
{
  return self->_metalLayers;
}

- (void)setMetalLayers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end