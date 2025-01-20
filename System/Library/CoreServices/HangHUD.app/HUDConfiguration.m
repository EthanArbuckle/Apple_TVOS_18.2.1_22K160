@interface HUDConfiguration
+ (BOOL)supportsSecureCoding;
+ (id)sharedInstance;
- (BOOL)areProcessTerminationsMonitored;
- (HUDConfiguration)init;
- (HUDConfiguration)initWithCoder:(id)a3;
- (HUDConfiguration)initWithRunloopHangTimeoutDurationMSec:(unint64_t)a3 thirdPartyDevPreferredLanguages:(id)a4;
- (NSArray)thirdPartyDevPreferredLanguages;
- (unint64_t)runloopHangTimeoutDurationMSec;
- (void)encodeWithCoder:(id)a3;
- (void)updateWithHUDConfiguration:(id)a3;
@end

@implementation HUDConfiguration

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000E004;
  block[3] = &unk_100028898;
  block[4] = a1;
  if (qword_100036580 != -1) {
    dispatch_once(&qword_100036580, block);
  }
  return (id)qword_100036578;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HUDConfiguration)init
{
  thirdPartyDevPreferredLanguages = self->_thirdPartyDevPreferredLanguages;
  self->_runloopHangTimeoutDurationMSec = 9000LL;
  self->_thirdPartyDevPreferredLanguages = 0LL;

  self->_areProcessTerminationsMonitored = 0;
  return self;
}

- (HUDConfiguration)initWithRunloopHangTimeoutDurationMSec:(unint64_t)a3 thirdPartyDevPreferredLanguages:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___HUDConfiguration;
  v8 = -[HUDConfiguration init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    v8->_runloopHangTimeoutDurationMSec = a3;
    objc_storeStrong((id *)&v8->_thirdPartyDevPreferredLanguages, a4);
  }

  return v9;
}

- (void)updateWithHUDConfiguration:(id)a3
{
  id v4 = a3;
  self->_runloopHangTimeoutDurationMSec = (unint64_t)[v4 runloopHangTimeoutDurationMSec];
  v5 = (NSArray *)objc_claimAutoreleasedReturnValue([v4 thirdPartyDevPreferredLanguages]);

  thirdPartyDevPreferredLanguages = self->_thirdPartyDevPreferredLanguages;
  self->_thirdPartyDevPreferredLanguages = v5;
}

- (HUDConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeIntegerForKey:@"runloopHangTimeoutDurationMSec"];
  id v6 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class(NSString) forKey:@"thirdPartyDevPreferredLanguages"];
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  v8 = -[HUDConfiguration initWithRunloopHangTimeoutDurationMSec:thirdPartyDevPreferredLanguages:]( self,  "initWithRunloopHangTimeoutDurationMSec:thirdPartyDevPreferredLanguages:",  v5,  v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t runloopHangTimeoutDurationMSec = self->_runloopHangTimeoutDurationMSec;
  id v5 = a3;
  [v5 encodeInt64:runloopHangTimeoutDurationMSec forKey:@"runloopHangTimeoutDurationMSec"];
  [v5 encodeObject:self->_thirdPartyDevPreferredLanguages forKey:@"thirdPartyDevPreferredLanguages"];
}

- (unint64_t)runloopHangTimeoutDurationMSec
{
  return self->_runloopHangTimeoutDurationMSec;
}

- (NSArray)thirdPartyDevPreferredLanguages
{
  return (NSArray *)objc_getProperty(self, a2, 24LL, 1);
}

- (BOOL)areProcessTerminationsMonitored
{
  return self->_areProcessTerminationsMonitored;
}

- (void).cxx_destruct
{
}

@end