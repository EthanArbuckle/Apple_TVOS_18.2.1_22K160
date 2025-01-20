@interface MatchingFilter
+ (BOOL)supportsSecureCoding;
- (BOOL)eaOverHIDAccessory;
- (BOOL)needsBootstrapping;
- (BOOL)needsDeviceIdleCheck;
- (BOOL)needsInstallerCheck;
- (BOOL)needsMayRebootCheck;
- (BOOL)needsMultiUpdateCheck;
- (BOOL)needsPeriodicFirmwareCheck;
- (BOOL)needsQueryDevices;
- (BOOL)noPowerAssertion;
- (BOOL)silentUpdateNoUI;
- (BOOL)stopOnBootstrapFailure;
- (MatchingFilter)initWithCoder:(id)a3;
- (NSDictionary)filter;
- (NSString)exclusionGroup;
- (NSString)filterName;
- (NSString)filterReadableName;
- (NSString)filterType;
- (void)encodeWithCoder:(id)a3;
- (void)setEaOverHIDAccessory:(BOOL)a3;
- (void)setExclusionGroup:(id)a3;
- (void)setFilter:(id)a3;
- (void)setFilterName:(id)a3;
- (void)setFilterReadableName:(id)a3;
- (void)setFilterType:(id)a3;
- (void)setNeedsBootstrapping:(BOOL)a3;
- (void)setNeedsDeviceIdleCheck:(BOOL)a3;
- (void)setNeedsInstallerCheck:(BOOL)a3;
- (void)setNeedsMayRebootCheck:(BOOL)a3;
- (void)setNeedsMultiUpdateCheck:(BOOL)a3;
- (void)setNeedsPeriodicFirmwareCheck:(BOOL)a3;
- (void)setNeedsQueryDevices:(BOOL)a3;
- (void)setNoPowerAssertion:(BOOL)a3;
- (void)setSilentUpdateNoUI:(BOOL)a3;
- (void)setStopOnBootstrapFailure:(BOOL)a3;
@end

@implementation MatchingFilter

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MatchingFilter)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MatchingFilter;
  v4 = -[MatchingFilter init](&v6, "init");
  if (v4)
  {
    v4->filterName = (NSString *) [a3 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"filterName"];
    v4->filterReadableName = (NSString *) [a3 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"filterCommonName"];
    v4->needsBootstrapping = [a3 decodeBoolForKey:@"needsBootstrapping"];
    v4->needsQueryDevices = [a3 decodeBoolForKey:@"needsQueryDevices"];
    v4->needsPeriodicFirmwareCheck = [a3 decodeBoolForKey:@"needsPeriodicFirmwareCheck"];
    v4->needsDeviceIdleCheck = [a3 decodeBoolForKey:@"needsDeviceIdleCheck"];
    v4->noPowerAssertion = [a3 decodeBoolForKey:@"noPowerAssertion"];
    v4->needsMayRebootCheck = [a3 decodeBoolForKey:@"needsMayRebootCheck"];
    v4->needsInstallerCheck = [a3 decodeBoolForKey:@"needsInstallerCheck"];
    v4->needsMultiUpdateCheck = [a3 decodeBoolForKey:@"needsMultiUpdateCheck"];
    v4->eaOverHIDAccessory = [a3 decodeBoolForKey:@"eaOverHIDAccessory"];
    v4->filterType = (NSString *) [a3 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"filterType"];
    v7[0] = objc_opt_class(&OBJC_CLASS___NSDictionary);
    v7[1] = objc_opt_class(&OBJC_CLASS___NSString);
    v7[2] = objc_opt_class(&OBJC_CLASS___NSNumber);
    v7[3] = objc_opt_class(&OBJC_CLASS___NSArray);
    v4->filter = (NSDictionary *) objc_msgSend( a3,  "decodeObjectOfClasses:forKey:",  +[NSSet setWithArray:]( NSSet,  "setWithArray:",  +[NSArray arrayWithObjects:count:]( NSArray,  "arrayWithObjects:count:",  v7,  4)),  @"filter");
    v4->exclusionGroup = (NSString *) [a3 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"exclusionGroup"];
    v4->silentUpdateNoUI = [a3 decodeBoolForKey:@"silentUpdateNoUI"];
    v4->stopOnBootstrapFailure = [a3 decodeBoolForKey:@"stopOnBootstrapFailure"];
  }

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
}

- (NSString)filterName
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setFilterName:(id)a3
{
}

- (BOOL)needsBootstrapping
{
  return self->needsBootstrapping;
}

- (void)setNeedsBootstrapping:(BOOL)a3
{
  self->needsBootstrapping = a3;
}

- (BOOL)eaOverHIDAccessory
{
  return self->eaOverHIDAccessory;
}

- (void)setEaOverHIDAccessory:(BOOL)a3
{
  self->eaOverHIDAccessory = a3;
}

- (NSString)filterType
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setFilterType:(id)a3
{
}

- (NSDictionary)filter
{
  return (NSDictionary *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setFilter:(id)a3
{
}

- (NSString)filterReadableName
{
  return (NSString *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setFilterReadableName:(id)a3
{
}

- (NSString)exclusionGroup
{
  return (NSString *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setExclusionGroup:(id)a3
{
}

- (BOOL)silentUpdateNoUI
{
  return self->silentUpdateNoUI;
}

- (void)setSilentUpdateNoUI:(BOOL)a3
{
  self->silentUpdateNoUI = a3;
}

- (BOOL)stopOnBootstrapFailure
{
  return self->stopOnBootstrapFailure;
}

- (void)setStopOnBootstrapFailure:(BOOL)a3
{
  self->stopOnBootstrapFailure = a3;
}

- (BOOL)needsPeriodicFirmwareCheck
{
  return self->needsPeriodicFirmwareCheck;
}

- (void)setNeedsPeriodicFirmwareCheck:(BOOL)a3
{
  self->needsPeriodicFirmwareCheck = a3;
}

- (BOOL)needsDeviceIdleCheck
{
  return self->needsDeviceIdleCheck;
}

- (void)setNeedsDeviceIdleCheck:(BOOL)a3
{
  self->needsDeviceIdleCheck = a3;
}

- (BOOL)noPowerAssertion
{
  return self->noPowerAssertion;
}

- (void)setNoPowerAssertion:(BOOL)a3
{
  self->noPowerAssertion = a3;
}

- (BOOL)needsMayRebootCheck
{
  return self->needsMayRebootCheck;
}

- (void)setNeedsMayRebootCheck:(BOOL)a3
{
  self->needsMayRebootCheck = a3;
}

- (BOOL)needsQueryDevices
{
  return self->needsQueryDevices;
}

- (void)setNeedsQueryDevices:(BOOL)a3
{
  self->needsQueryDevices = a3;
}

- (BOOL)needsInstallerCheck
{
  return self->needsInstallerCheck;
}

- (void)setNeedsInstallerCheck:(BOOL)a3
{
  self->needsInstallerCheck = a3;
}

- (BOOL)needsMultiUpdateCheck
{
  return self->needsMultiUpdateCheck;
}

- (void)setNeedsMultiUpdateCheck:(BOOL)a3
{
  self->needsMultiUpdateCheck = a3;
}

@end