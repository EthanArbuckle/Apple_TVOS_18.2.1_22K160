@interface OTOperationConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)discretionaryNetwork;
- (BOOL)useCachedAccountStatus;
- (OTOperationConfiguration)init;
- (OTOperationConfiguration)initWithCoder:(id)a3;
- (int64_t)qualityOfService;
- (unint64_t)timeoutWaitForCKAccount;
- (void)encodeWithCoder:(id)a3;
- (void)setDiscretionaryNetwork:(BOOL)a3;
- (void)setQualityOfService:(int64_t)a3;
- (void)setTimeoutWaitForCKAccount:(unint64_t)a3;
- (void)setUseCachedAccountStatus:(BOOL)a3;
@end

@implementation OTOperationConfiguration

- (OTOperationConfiguration)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___OTOperationConfiguration;
  v2 = -[OTOperationConfiguration init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_OWORD *)&v2->_timeoutWaitForCKAccount = xmmword_18065A210;
    *(_WORD *)&v2->_discretionaryNetwork = 0;
    v4 = v2;
  }

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x189607968];
  unint64_t timeoutWaitForCKAccount = self->_timeoutWaitForCKAccount;
  id v6 = a3;
  [v4 numberWithUnsignedLongLong:timeoutWaitForCKAccount];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 encodeObject:v7 forKey:@"timeoutWaitForCKAccount"];

  [MEMORY[0x189607968] numberWithInteger:self->_qualityOfService];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 encodeObject:v8 forKey:@"qualityOfService"];

  [MEMORY[0x189607968] numberWithBool:self->_discretionaryNetwork];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 encodeObject:v9 forKey:@"discretionaryNetwork"];

  [MEMORY[0x189607968] numberWithBool:self->_useCachedAccountStatus];
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [v6 encodeObject:v10 forKey:@"useCachedAccountStatus"];
}

- (OTOperationConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timeoutWaitForCKAccount"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_unint64_t timeoutWaitForCKAccount = [v5 unsignedLongLongValue];

  [v4 decodeObjectOfClass:objc_opt_class() forKey:@"qualityOfService"];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  self->_qualityOfService = [v6 integerValue];

  [v4 decodeObjectOfClass:objc_opt_class() forKey:@"discretionaryNetwork"];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  self->_discretionaryNetwork = [v7 BOOLValue];

  [v4 decodeObjectOfClass:objc_opt_class() forKey:@"useCachedAccountStatus"];
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  self->_useCachedAccountStatus = [v8 BOOLValue];
  return self;
}

- (unint64_t)timeoutWaitForCKAccount
{
  return self->_timeoutWaitForCKAccount;
}

- (void)setTimeoutWaitForCKAccount:(unint64_t)a3
{
  self->_unint64_t timeoutWaitForCKAccount = a3;
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (void)setQualityOfService:(int64_t)a3
{
  self->_qualityOfService = a3;
}

- (BOOL)discretionaryNetwork
{
  return self->_discretionaryNetwork;
}

- (void)setDiscretionaryNetwork:(BOOL)a3
{
  self->_discretionaryNetwork = a3;
}

- (BOOL)useCachedAccountStatus
{
  return self->_useCachedAccountStatus;
}

- (void)setUseCachedAccountStatus:(BOOL)a3
{
  self->_useCachedAccountStatus = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end