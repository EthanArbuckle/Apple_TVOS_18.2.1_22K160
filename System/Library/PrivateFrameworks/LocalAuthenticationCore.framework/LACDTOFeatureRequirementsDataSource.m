@interface LACDTOFeatureRequirementsDataSource
- (BOOL)hasBiometricEnrollmentsForCurrentUser;
- (BOOL)hasPasscodeSetForCurrentUser;
- (BOOL)isPhone;
- (LACDTOFeatureRequirementsDataSource)initWithDevice:(id)a3 replyQueue:(id)a4;
- (void)hasHSA2AccountWithCompletion:(id)a3;
- (void)hasLocationServicesEnabledWithCompletion:(id)a3;
@end

@implementation LACDTOFeatureRequirementsDataSource

- (LACDTOFeatureRequirementsDataSource)initWithDevice:(id)a3 replyQueue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___LACDTOFeatureRequirementsDataSource;
  v9 = -[LACDTOFeatureRequirementsDataSource init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_device, a3);
    objc_storeStrong((id *)&v10->_replyQueue, a4);
  }

  return v10;
}

- (BOOL)hasPasscodeSetForCurrentUser
{
  return -[LACDTODeviceInfoProvider hasPasscodeSetForCurrentUser](self->_device, "hasPasscodeSetForCurrentUser");
}

- (BOOL)isPhone
{
  return -[LACDTODeviceInfoProvider isPhone](self->_device, "isPhone");
}

- (BOOL)hasBiometricEnrollmentsForCurrentUser
{
  return -[LACDTODeviceInfoProvider hasBiometricEnrollmentsForCurrentUser]( self->_device,  "hasBiometricEnrollmentsForCurrentUser");
}

- (void)hasHSA2AccountWithCompletion:(id)a3
{
  v3 = (void (**)(id, void, void *))a3;
  v4 = +[LACError errorWithCode:debugDescription:]( &OBJC_CLASS___LACError,  "errorWithCode:debugDescription:",  -1000LL,  @"Missing AuthKit dependency");
  LACLogDTOFeature();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[LACDTOFeatureRequirementsDataSource hasHSA2AccountWithCompletion:].cold.1( (uint64_t)v4,  v5,  v6,  v7,  v8,  v9,  v10,  v11);
  }

  v3[2](v3, 0LL, v4);
}

- (void)hasLocationServicesEnabledWithCompletion:(id)a3
{
  v3 = (void (**)(id, void, void *))a3;
  v4 = +[LACError errorWithCode:debugDescription:]( &OBJC_CLASS___LACError,  "errorWithCode:debugDescription:",  -1000LL,  @"Missing CoreLocation dependency");
  LACLogDTOFeature();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[LACDTOFeatureRequirementsDataSource hasLocationServicesEnabledWithCompletion:].cold.1( (uint64_t)v4,  v5,  v6,  v7,  v8,  v9,  v10,  v11);
  }

  v3[2](v3, 0LL, v4);
}

- (void).cxx_destruct
{
}

- (void)hasHSA2AccountWithCompletion:(uint64_t)a3 .cold.1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)hasLocationServicesEnabledWithCompletion:(uint64_t)a3 .cold.1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

@end