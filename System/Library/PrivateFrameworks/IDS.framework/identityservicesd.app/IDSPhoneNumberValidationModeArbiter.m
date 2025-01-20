@interface IDSPhoneNumberValidationModeArbiter
- (BOOL)isPrefightEnabledByServerBag;
- (BOOL)isValidationModeLegacy;
- (BOOL)isValidationModeShortCircuitingPreflight;
- (BOOL)isValidationModeUsingPreflight;
- (IDSCTPNRValidationMechanism)preflightShortCircuitMechanismOverride;
- (IDSPhoneNumberValidationModeArbiter)init;
- (IDSPhoneNumberValidationModeArbiter)initWithServerBag:(id)a3;
- (IDSServerBag)serverBag;
- (NSString)preflightTestDataOverride;
- (double)minimumIntervalBetweenValidationAttempts;
- (int64_t)validationMode;
- (unsigned)maxAllowableNumberOfPreflightRequests;
- (unsigned)maxAllowableNumberOfSuccessfullySentVerifications;
- (unsigned)maxAllowableNumberOfValidationAttemptsWhileNoneHaveSentSuccessfully;
@end

@implementation IDSPhoneNumberValidationModeArbiter

- (IDSPhoneNumberValidationModeArbiter)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstanceForBagType:](&OBJC_CLASS___IDSServerBag, "sharedInstanceForBagType:", 0LL));
  v4 = -[IDSPhoneNumberValidationModeArbiter initWithServerBag:](self, "initWithServerBag:", v3);

  return v4;
}

- (IDSPhoneNumberValidationModeArbiter)initWithServerBag:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___IDSPhoneNumberValidationModeArbiter;
  v6 = -[IDSPhoneNumberValidationModeArbiter init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_serverBag, a3);
  }

  return v7;
}

- (BOOL)isValidationModeLegacy
{
  return (id)-[IDSPhoneNumberValidationModeArbiter validationMode](self, "validationMode") == (id)2;
}

- (BOOL)isValidationModeUsingPreflight
{
  int64_t v3 = -[IDSPhoneNumberValidationModeArbiter validationMode](self, "validationMode");
  if (v3 != 1) {
    LOBYTE(v3) = (id)-[IDSPhoneNumberValidationModeArbiter validationMode](self, "validationMode") == (id)3;
  }
  return v3;
}

- (BOOL)isValidationModeShortCircuitingPreflight
{
  return (id)-[IDSPhoneNumberValidationModeArbiter validationMode](self, "validationMode") == (id)4
      || (id)-[IDSPhoneNumberValidationModeArbiter validationMode](self, "validationMode") == (id)5;
}

- (int64_t)validationMode
{
  int64_t v3 = (int64_t)+[IMUserDefaults phoneNumberValidationMode]( &OBJC_CLASS___IMUserDefaults,  "phoneNumberValidationMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMLockdownManager sharedInstance](&OBJC_CLASS___IMLockdownManager, "sharedInstance"));
  if ([v4 isInternalInstall])
  {
    unsigned int v5 = 1;
  }

  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[IMLockdownManager sharedInstance](&OBJC_CLASS___IMLockdownManager, "sharedInstance"));
    unsigned int v5 = [v6 isCarrierInstall];
  }

  if (v5 && v3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
    if (!os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
    {
LABEL_14:

      return v3;
    }

    int v12 = 134217984;
    int64_t v13 = v3;
    v8 = "Phone number validation mode overridden by user defaults { modeFromDefaults: %ld }";
    objc_super v9 = (os_log_s *)v7;
    uint32_t v10 = 12;
LABEL_12:
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v12, v10);
    goto LABEL_14;
  }

  if (!-[IDSPhoneNumberValidationModeArbiter isPrefightEnabledByServerBag](self, "isPrefightEnabledByServerBag"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
    if (!os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v3 = 2LL;
      goto LABEL_14;
    }

    LOWORD(v12) = 0;
    v8 = "Preflight disabled by server bag override -- falling back to legacy";
    int64_t v3 = 2LL;
    objc_super v9 = (os_log_s *)v7;
    uint32_t v10 = 2;
    goto LABEL_12;
  }

  return 1LL;
}

- (BOOL)isPrefightEnabledByServerBag
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSServerBag objectForKey:](self->_serverBag, "objectForKey:", @"preflight-enabled"));
  if (v3 && (uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSNumber, v2), (objc_opt_isKindOfClass(v3, v4) & 1) != 0)) {
    unsigned __int8 v5 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v5 = 1;
  }

  return v5;
}

- (IDSCTPNRValidationMechanism)preflightShortCircuitMechanismOverride
{
  if ((id)-[IDSPhoneNumberValidationModeArbiter validationMode](self, "validationMode") == (id)4)
  {
    int64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[IDSCTPNRValidationMechanism SMSLessMechanism]( &OBJC_CLASS___IDSCTPNRValidationMechanism,  "SMSLessMechanism"));
  }

  else if ((id)-[IDSPhoneNumberValidationModeArbiter validationMode](self, "validationMode") == (id)5)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPhoneNumberValidationModeArbiter preflightTestDataOverride](self, "preflightTestDataOverride"));
    int64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[IDSCTPNRValidationMechanism SMSMechanismWithContext:]( &OBJC_CLASS___IDSCTPNRValidationMechanism,  "SMSMechanismWithContext:",  v4));
  }

  else
  {
    int64_t v3 = 0LL;
  }

  return (IDSCTPNRValidationMechanism *)v3;
}

- (NSString)preflightTestDataOverride
{
  if ((id)-[IDSPhoneNumberValidationModeArbiter validationMode](self, "validationMode") == (id)3
    || -[IDSPhoneNumberValidationModeArbiter isValidationModeShortCircuitingPreflight]( self,  "isValidationModeShortCircuitingPreflight"))
  {
    int64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[IMUserDefaults phoneNumberValidationPreflightTestData]( &OBJC_CLASS___IMUserDefaults,  "phoneNumberValidationPreflightTestData"));
  }

  else
  {
    int64_t v3 = 0LL;
  }

  return (NSString *)v3;
}

- (double)minimumIntervalBetweenValidationAttempts
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPhoneNumberValidationModeArbiter serverBag](self, "serverBag"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"preflight-mechanism-delay"]);

  double v5 = 360.0;
  if (v4 && !-[IDSPhoneNumberValidationModeArbiter isValidationModeLegacy](self, "isValidationModeLegacy"))
  {
    [v4 doubleValue];
    double v5 = v6;
  }

  return v5;
}

- (unsigned)maxAllowableNumberOfPreflightRequests
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPhoneNumberValidationModeArbiter serverBag](self, "serverBag"));
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"preflight-request-limit"]);

  if (v3) {
    unsigned int v4 = [v3 unsignedIntValue];
  }
  else {
    unsigned int v4 = 5;
  }

  return v4;
}

- (unsigned)maxAllowableNumberOfSuccessfullySentVerifications
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[IMLockdownManager sharedInstance](&OBJC_CLASS___IMLockdownManager, "sharedInstance"));
  unsigned int v4 = [v3 isInternalInstall];

  if (v4
    && (uint64_t v5 = IMGetCachedDomainIntForKeyWithDefaultValue( @"com.apple.registration",  @"overrideMaxSMSRetries",  0LL),  v5 >= 1))
  {
    uint64_t v6 = v5;
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134217984;
      uint64_t v11 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "*********** Override max SMS retries value to %ld",  (uint8_t *)&v10,  0xCu);
    }
  }

  else
  {
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[IDSServerBag objectForKey:](self->_serverBag, "objectForKey:", @"sms-max-retries"));
    v7 = v8;
    if (v8) {
      LODWORD(v6) = -[os_log_s unsignedIntValue](v8, "unsignedIntValue");
    }
    else {
      LODWORD(v6) = 5;
    }
  }

  return v6;
}

- (unsigned)maxAllowableNumberOfValidationAttemptsWhileNoneHaveSentSuccessfully
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[IMLockdownManager sharedInstance](&OBJC_CLASS___IMLockdownManager, "sharedInstance"));
  unsigned int v4 = [v3 isInternalInstall];

  if (v4
    && (uint64_t v5 = IMGetCachedDomainIntForKeyWithDefaultValue( @"com.apple.registration",  @"overrideMaxSMSDeliveryRetries",  0LL),  v5 >= 1))
  {
    uint64_t v6 = v5;
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sms](&OBJC_CLASS___IMRGLog, "sms"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134217984;
      uint64_t v11 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "*********** Override max SMS delivery retries value to %ld",  (uint8_t *)&v10,  0xCu);
    }
  }

  else
  {
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[IDSServerBag objectForKey:]( self->_serverBag,  "objectForKey:",  @"sms-max-delivery-retries"));
    v7 = v8;
    if (v8) {
      LODWORD(v6) = -[os_log_s unsignedIntValue](v8, "unsignedIntValue");
    }
    else {
      LODWORD(v6) = 5;
    }
  }

  return v6;
}

- (IDSServerBag)serverBag
{
  return self->_serverBag;
}

- (void).cxx_destruct
{
}

@end