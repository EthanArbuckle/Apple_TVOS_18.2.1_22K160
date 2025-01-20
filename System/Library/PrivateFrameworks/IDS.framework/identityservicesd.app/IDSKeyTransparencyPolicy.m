@interface IDSKeyTransparencyPolicy
- (BOOL)_isKeyTransparencyDisabledViaServerBagProtocolVersion_FaceTime;
- (BOOL)_isKeyTransparencyDisabledViaServerBagProtocolVersion_Madrid;
- (BOOL)_isKeyTransparencyDisabledViaServerBagProtocolVersion_Multiplex;
- (BOOL)_isKeyTransparencyEnabledViaDefaults;
- (BOOL)_isKeyTransparencyEnabledViaServerBag;
- (BOOL)isKeyTransparencyAccountKeyCircleEnabled;
- (BOOL)isKeyTransparencyAnalyticsEnabled;
- (BOOL)isKeyTransparencyCloudKitCircleEnabled;
- (BOOL)isKeyTransparencyEnabled;
- (BOOL)isKeyTransparencyEnabledForServiceIdentifier:(id)a3;
- (BOOL)isKeyTransparencyEnabledForServiceType:(id)a3;
- (BOOL)isKeyTransparencyRTCAnalyticsEnabled;
- (BOOL)isKeyTransparencySFAnalyticsEnabled;
- (BOOL)isKeyTransparencyTrustCircleAllowedWithoutEnrollment;
- (BOOL)isKeyTransparencyTrustCircleEnabled;
- (BOOL)isKeyTransparencyUIEnabled;
- (BOOL)isKeyTransparencyXPCActivityEnabled;
- (BOOL)shouldSyncTrustCircleAfterSelfQueryForServiceIdentifier:(id)a3;
- (unint64_t)keyTransparencyMaximumVerificationsPerXPCActivity;
- (unint64_t)keyTransparencyXPCActivityIntervalInSeconds;
@end

@implementation IDSKeyTransparencyPolicy

- (BOOL)isKeyTransparencyEnabled
{
  BOOL v3 = -[IDSKeyTransparencyPolicy _isKeyTransparencyEnabledViaDefaults](self, "_isKeyTransparencyEnabledViaDefaults");
  if (v3) {
    LOBYTE(v3) = -[IDSKeyTransparencyPolicy _isKeyTransparencyEnabledViaServerBag]( self,  "_isKeyTransparencyEnabledViaServerBag");
  }
  return v3;
}

- (BOOL)isKeyTransparencyTrustCircleAllowedWithoutEnrollment
{
  return 0;
}

- (BOOL)_isKeyTransparencyEnabledViaDefaults
{
  BOOL v2 = +[IMUserDefaults isKeyTransparencyDisabled](&OBJC_CLASS___IMUserDefaults, "isKeyTransparencyDisabled");
  if (v2) {
    return CUTIsInternalInstall(v2, v3) ^ 1;
  }
  else {
    return 1;
  }
}

- (BOOL)_isKeyTransparencyEnabledViaServerBag
{
  if (-[IDSKeyTransparencyPolicy _isKeyTransparencyDisabledViaServerBagProtocolVersion_Madrid]( self,  "_isKeyTransparencyDisabledViaServerBagProtocolVersion_Madrid")
    && -[IDSKeyTransparencyPolicy _isKeyTransparencyDisabledViaServerBagProtocolVersion_FaceTime]( self,  "_isKeyTransparencyDisabledViaServerBagProtocolVersion_FaceTime"))
  {
    return !-[IDSKeyTransparencyPolicy _isKeyTransparencyDisabledViaServerBagProtocolVersion_Multiplex]( self,  "_isKeyTransparencyDisabledViaServerBagProtocolVersion_Multiplex");
  }

  else
  {
    return 1;
  }

- (BOOL)_isKeyTransparencyDisabledViaServerBagProtocolVersion_Madrid
{
  BOOL v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstanceForBagType:](&OBJC_CLASS___IDSServerBag, "sharedInstanceForBagType:", 0LL));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"kt-min-idv-im"]);

  if (v3 && (uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber, v4), (objc_opt_isKindOfClass(v3, v5) & 1) != 0))
  {
    uint64_t v6 = _IDSIDProtocolVersionNumber();
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    BOOL v8 = [v3 compare:v7] == (id)1;
  }

  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)_isKeyTransparencyDisabledViaServerBagProtocolVersion_FaceTime
{
  BOOL v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstanceForBagType:](&OBJC_CLASS___IDSServerBag, "sharedInstanceForBagType:", 0LL));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"kt-min-idv-ft"]);

  if (v3 && (uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber, v4), (objc_opt_isKindOfClass(v3, v5) & 1) != 0))
  {
    uint64_t v6 = _IDSIDProtocolVersionNumber();
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    BOOL v8 = [v3 compare:v7] == (id)1;
  }

  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)_isKeyTransparencyDisabledViaServerBagProtocolVersion_Multiplex
{
  BOOL v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstanceForBagType:](&OBJC_CLASS___IDSServerBag, "sharedInstanceForBagType:", 0LL));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"kt-min-idv-mp1"]);

  if (v3 && (uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber, v4), (objc_opt_isKindOfClass(v3, v5) & 1) != 0))
  {
    uint64_t v6 = _IDSIDProtocolVersionNumber();
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    BOOL v8 = [v3 compare:v7] == (id)1;
  }

  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)isKeyTransparencyEnabledForServiceIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:IDSiMessageKeyTransparencyService])
  {
    unsigned __int8 v5 = -[IDSKeyTransparencyPolicy _isKeyTransparencyDisabledViaServerBagProtocolVersion_Madrid]( self,  "_isKeyTransparencyDisabledViaServerBagProtocolVersion_Madrid");
  }

  else if ([v4 isEqualToString:IDSFaceTimeMultiKeyTransparencyService])
  {
    unsigned __int8 v5 = -[IDSKeyTransparencyPolicy _isKeyTransparencyDisabledViaServerBagProtocolVersion_FaceTime]( self,  "_isKeyTransparencyDisabledViaServerBagProtocolVersion_FaceTime");
  }

  else
  {
    if (![v4 isEqualToString:IDSMultiplex1KeyTransparencyService])
    {
      char v6 = 0;
      goto LABEL_8;
    }

    unsigned __int8 v5 = -[IDSKeyTransparencyPolicy _isKeyTransparencyDisabledViaServerBagProtocolVersion_Multiplex]( self,  "_isKeyTransparencyDisabledViaServerBagProtocolVersion_Multiplex");
  }

  char v6 = v5 ^ 1;
LABEL_8:

  return v6;
}

- (BOOL)isKeyTransparencyEnabledForServiceType:(id)a3
{
  id v4 = a3;
  if (IDSIsiMessageRegistrationServiceType(v4))
  {
    unsigned __int8 v5 = -[IDSKeyTransparencyPolicy _isKeyTransparencyDisabledViaServerBagProtocolVersion_Madrid]( self,  "_isKeyTransparencyDisabledViaServerBagProtocolVersion_Madrid");
  }

  else if (IDSIsMultiwayRegistrationServiceType(v4))
  {
    unsigned __int8 v5 = -[IDSKeyTransparencyPolicy _isKeyTransparencyDisabledViaServerBagProtocolVersion_FaceTime]( self,  "_isKeyTransparencyDisabledViaServerBagProtocolVersion_FaceTime");
  }

  else
  {
    if (!IDSIsMultiplex1RegistrationServiceType(v4))
    {
      char v6 = 0;
      goto LABEL_8;
    }

    unsigned __int8 v5 = -[IDSKeyTransparencyPolicy _isKeyTransparencyDisabledViaServerBagProtocolVersion_Multiplex]( self,  "_isKeyTransparencyDisabledViaServerBagProtocolVersion_Multiplex");
  }

  char v6 = v5 ^ 1;
LABEL_8:

  return v6;
}

- (BOOL)isKeyTransparencyTrustCircleEnabled
{
  if (-[IDSKeyTransparencyPolicy isKeyTransparencyCloudKitCircleEnabled]( self,  "isKeyTransparencyCloudKitCircleEnabled"))
  {
    return 1;
  }

  else
  {
    return -[IDSKeyTransparencyPolicy isKeyTransparencyAccountKeyCircleEnabled]( self,  "isKeyTransparencyAccountKeyCircleEnabled");
  }

- (BOOL)isKeyTransparencyCloudKitCircleEnabled
{
  if (!-[IDSKeyTransparencyPolicy isKeyTransparencyEnabled](self, "isKeyTransparencyEnabled")) {
    return 0;
  }
  BOOL v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstanceForBagType:](&OBJC_CLASS___IDSServerBag, "sharedInstanceForBagType:", 0LL));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"kt-cloud-kit-enabled"]);

  BOOL v4 = +[IMUserDefaults isKeyTransparencyCloudKitCircleDisabled]( &OBJC_CLASS___IMUserDefaults,  "isKeyTransparencyCloudKitCircleDisabled");
  if (v4 && (CUTIsInternalInstall(v4, v5) & 1) != 0)
  {
    unsigned __int8 v6 = 0;
  }

  else if (v3 && (uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber, v5), (objc_opt_isKindOfClass(v3, v7) & 1) != 0))
  {
    unsigned __int8 v6 = [v3 BOOLValue];
  }

  else
  {
    unsigned __int8 v6 = 1;
  }

  return v6;
}

- (BOOL)isKeyTransparencyAccountKeyCircleEnabled
{
  if (!-[IDSKeyTransparencyPolicy isKeyTransparencyEnabled](self, "isKeyTransparencyEnabled")) {
    return 0;
  }
  BOOL v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstanceForBagType:](&OBJC_CLASS___IDSServerBag, "sharedInstanceForBagType:", 0LL));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"kt-account-key-enabled"]);

  BOOL v4 = +[IMUserDefaults isKeyTransparencyAccountKeyCircleDisabled]( &OBJC_CLASS___IMUserDefaults,  "isKeyTransparencyAccountKeyCircleDisabled");
  if (v4 && (CUTIsInternalInstall(v4, v5) & 1) != 0)
  {
    unsigned __int8 v6 = 0;
  }

  else if (v3 && (uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber, v5), (objc_opt_isKindOfClass(v3, v7) & 1) != 0))
  {
    unsigned __int8 v6 = [v3 BOOLValue];
  }

  else
  {
    unsigned __int8 v6 = 1;
  }

  return v6;
}

- (BOOL)isKeyTransparencyXPCActivityEnabled
{
  if (!-[IDSKeyTransparencyPolicy isKeyTransparencyEnabled](self, "isKeyTransparencyEnabled")) {
    return 0;
  }
  BOOL v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstanceForBagType:](&OBJC_CLASS___IDSServerBag, "sharedInstanceForBagType:", 0LL));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"kt-xpc-activity-enabled"]);

  if (v3 && (uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber, v4), (objc_opt_isKindOfClass(v3, v5) & 1) != 0)) {
    unsigned __int8 v6 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v6 = 1;
  }

  return v6;
}

- (unint64_t)keyTransparencyXPCActivityIntervalInSeconds
{
  BOOL v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstanceForBagType:](&OBJC_CLASS___IDSServerBag, "sharedInstanceForBagType:", 0LL));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"kt-xpc-activity-interval"]);

  BOOL v4 = +[IMUserDefaults isKeyTransparencyAggressiveVerificationScheduleEnabled]( &OBJC_CLASS___IMUserDefaults,  "isKeyTransparencyAggressiveVerificationScheduleEnabled");
  if (v4 && (CUTIsInternalInstall(v4, v5) & 1) != 0)
  {
    unint64_t v6 = 300LL;
  }

  else
  {
    unint64_t v6 = 86400LL;
    if (v3)
    {
      uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber, v5);
      if ((objc_opt_isKindOfClass(v3, v7) & 1) != 0) {
        unint64_t v6 = (unint64_t)[v3 unsignedIntegerValue];
      }
    }
  }

  return v6;
}

- (unint64_t)keyTransparencyMaximumVerificationsPerXPCActivity
{
  if (!-[IDSKeyTransparencyPolicy isKeyTransparencyEnabled](self, "isKeyTransparencyEnabled")) {
    return 0LL;
  }
  BOOL v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstanceForBagType:](&OBJC_CLASS___IDSServerBag, "sharedInstanceForBagType:", 0LL));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"kt-xpc-activity-max-verifications"]);

  if (v3 && (uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber, v4), (objc_opt_isKindOfClass(v3, v5) & 1) != 0)) {
    unint64_t v6 = (unint64_t)[v3 unsignedIntegerValue];
  }
  else {
    unint64_t v6 = 25LL;
  }

  return v6;
}

- (BOOL)isKeyTransparencyAnalyticsEnabled
{
  if (!-[IDSKeyTransparencyPolicy isKeyTransparencyEnabled](self, "isKeyTransparencyEnabled")) {
    return 0;
  }
  BOOL v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstanceForBagType:](&OBJC_CLASS___IDSServerBag, "sharedInstanceForBagType:", 0LL));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"kt-analytics-enabled"]);

  if (v3 && (uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber, v4), (objc_opt_isKindOfClass(v3, v5) & 1) != 0)) {
    unsigned __int8 v6 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v6 = 1;
  }

  return v6;
}

- (BOOL)isKeyTransparencyRTCAnalyticsEnabled
{
  BOOL v2 = -[IDSKeyTransparencyPolicy isKeyTransparencyEnabled](self, "isKeyTransparencyEnabled");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstanceForBagType:](&OBJC_CLASS___IDSServerBag, "sharedInstanceForBagType:", 0LL));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"kt-rtc-analytics-enabled"]);

  if (v5 && (uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber, v6), (objc_opt_isKindOfClass(v5, v7) & 1) != 0)) {
    unsigned __int8 v8 = [v5 BOOLValue];
  }
  else {
    unsigned __int8 v8 = 1;
  }

  return v8;
}

- (BOOL)isKeyTransparencySFAnalyticsEnabled
{
  if (!-[IDSKeyTransparencyPolicy isKeyTransparencyEnabled](self, "isKeyTransparencyEnabled")) {
    return 0;
  }
  BOOL v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstanceForBagType:](&OBJC_CLASS___IDSServerBag, "sharedInstanceForBagType:", 0LL));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"kt-sf-analytics-enabled"]);

  if (v3 && (uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber, v4), (objc_opt_isKindOfClass(v3, v5) & 1) != 0)) {
    unsigned __int8 v6 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v6 = 1;
  }

  return v6;
}

- (BOOL)shouldSyncTrustCircleAfterSelfQueryForServiceIdentifier:(id)a3
{
  if (!-[IDSKeyTransparencyPolicy isKeyTransparencyEnabledForServiceIdentifier:]( self,  "isKeyTransparencyEnabledForServiceIdentifier:",  a3)) {
    return 0;
  }
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstanceForBagType:](&OBJC_CLASS___IDSServerBag, "sharedInstanceForBagType:", 0LL));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"kt-self-verify-rate"]);

  if (v4 && (uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSNumber, v5), (objc_opt_isKindOfClass(v4, v6) & 1) != 0))
  {
    id v7 = v4;
    id v8 = [v7 unsignedIntegerValue];
    else {
      unint64_t v9 = (unint64_t)v8;
    }
  }

  else
  {
    id v7 = 0LL;
    unint64_t v9 = 10LL;
  }

  BOOL v11 = +[IMUserDefaults isKeyTransparencyAggressiveVerificationScheduleEnabled]( &OBJC_CLASS___IMUserDefaults,  "isKeyTransparencyAggressiveVerificationScheduleEnabled");
  uint32_t v13 = arc4random_uniform(0x64u);
  BOOL v10 = v9 > v13;
  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    if (v9 <= v13) {
      v15 = @"NO";
    }
    else {
      v15 = @"YES";
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v9));
    int v19 = 138413058;
    v20 = v15;
    __int16 v21 = 2112;
    v22 = v16;
    __int16 v23 = 2112;
    v24 = v17;
    __int16 v25 = 2112;
    id v26 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Determined if self-query should be verified { shouldSelfVerify: %@, diceRoll: %@, percentage: %@, bagValue: %@ }",  (uint8_t *)&v19,  0x2Au);
  }

  return v10;
}

- (BOOL)isKeyTransparencyUIEnabled
{
  if (-[IDSKeyTransparencyPolicy isKeyTransparencyEnabled](self, "isKeyTransparencyEnabled")
    && (BOOL v2 = +[IMUserDefaults isKeyTransparencyUIEnabled](&OBJC_CLASS___IMUserDefaults, "isKeyTransparencyUIEnabled")))
  {
    return CUTIsInternalInstall(v2, v3);
  }

  else
  {
    return 0;
  }

@end