@interface CarrierBundlingEligibilityResponse
- (BOOL)isFamilySubscription;
- (BOOL)needsHeaderEnrichment;
- (BOOL)needsSilentSMS;
- (BOOL)wantsDelayedRetry;
- (CarrierBundlingEligibilityResponse)initWithEligibilityDictionary:(id)a3;
- (NSError)error;
- (NSString)SMSSessionIdentifier;
- (NSString)headerEnrichmentMessage;
- (NSString)headerEnrichmentSessionIdentifier;
- (NSString)silentSMSMessage;
- (NSString)silentSMSNumber;
- (NSURL)headerEnrichmentURL;
- (double)delayInterval;
- (int64_t)bundlingStatus;
- (void)setBundlingStatus:(int64_t)a3;
@end

@implementation CarrierBundlingEligibilityResponse

- (CarrierBundlingEligibilityResponse)initWithEligibilityDictionary:(id)a3
{
  id v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)&OBJC_CLASS___CarrierBundlingEligibilityResponse;
  v5 = -[CarrierBundlingEligibilityResponse init](&v50, "init");
  if (!v5) {
    goto LABEL_25;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"failureType"]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"status"]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"errorCode"]);
  if ([v7 integerValue])
  {
    v9 = (const __CFString *)SSServerErrorDomain;
    v10 = v7;
LABEL_6:
    id v11 = [v10 integerValue];
    v12 = v9;
    goto LABEL_7;
  }

  if ((objc_opt_respondsToSelector(v6, "integerValue") & 1) != 0)
  {
    v9 = (const __CFString *)SSServerErrorDomain;
    v10 = v6;
    goto LABEL_6;
  }

  if ((objc_opt_respondsToSelector(v8, "integerValue") & 1) == 0)
  {
    error = (NSError *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"fuseCarrierBundleStatus"]);
    if ((objc_opt_respondsToSelector(error, "integerValue") & 1) != 0)
    {
      uint64_t v44 = (uint64_t)-[NSError integerValue](error, "integerValue");
    }

    else
    {
      v45 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"checkBack"]);
      v48 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"startFuseHeaderEnrichment"]);
      v49 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"startFuseManualSms"]);
      v46 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"hasFuseCarrierBundleSubscription"]);
      if ((objc_opt_respondsToSelector(v45, "BOOLValue") & 1) != 0
        && ([v45 BOOLValue] & 1) != 0)
      {
        uint64_t v44 = 6LL;
      }

      else if ((objc_opt_respondsToSelector(v46, "BOOLValue") & 1) != 0 {
             && ([v46 BOOLValue] & 1) != 0)
      }
      {
        uint64_t v44 = 1LL;
      }

      else if ((objc_opt_respondsToSelector(v49, "BOOLValue") & 1) != 0 {
             && ([v49 BOOLValue] & 1) != 0)
      }
      {
        uint64_t v44 = 5LL;
      }

      else if ((objc_opt_respondsToSelector(v48, "BOOLValue") & 1) != 0)
      {
        else {
          uint64_t v44 = 2LL;
        }
      }

      else
      {
        uint64_t v44 = 2LL;
      }
    }

    switch(v44)
    {
      case 1LL:
        uint64_t v47 = 1LL;
        goto LABEL_51;
      case 2LL:
        uint64_t v47 = 2LL;
        goto LABEL_51;
      case 3LL:
        v5->_bundlingStatus = 0LL;
        goto LABEL_8;
      case 4LL:
        v5->_bundlingStatus = 0LL;
        v5->_needsHeaderEnrichment = 1;
        goto LABEL_8;
      case 5LL:
        uint64_t v47 = 3LL;
LABEL_51:
        v5->_bundlingStatus = v47;
        break;
      case 6LL:
        v5->_bundlingStatus = 0LL;
        v5->_wantsDelayedRetry = 1;
        break;
      case 7LL:
        v5->_bundlingStatus = 0LL;
        v5->_needsSilentSMS = 1;
        break;
      default:
        goto LABEL_8;
    }

    goto LABEL_8;
  }

  id v11 = [v8 integerValue];
  v12 = @"CarrierBundlingEligibilityErrorDomain";
LABEL_7:
  uint64_t v13 = SSError(v12, v11, 0LL, 0LL);
  uint64_t v14 = objc_claimAutoreleasedReturnValue(v13);
  error = v5->_error;
  v5->_error = (NSError *)v14;
LABEL_8:

  v16 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"fuseHeaderEnrichmentMessage"]);
  uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0)
  {
    v18 = (NSString *)[v16 copy];
    headerEnrichmentMessage = v5->_headerEnrichmentMessage;
    v5->_headerEnrichmentMessage = v18;
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"fuseHeaderEnrichmentSessionId"]);

  uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v20, v21) & 1) != 0)
  {
    v22 = (NSString *)[v20 copy];
    headerEnrichmentSessionIdentifier = v5->_headerEnrichmentSessionIdentifier;
    v5->_headerEnrichmentSessionIdentifier = v22;
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"fuseHeaderEnrichmentUrl"]);

  uint64_t v25 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v24, v25) & 1) != 0)
  {
    v26 = -[NSURL initWithString:](objc_alloc(&OBJC_CLASS___NSURL), "initWithString:", v24);
    headerEnrichmentURL = v5->_headerEnrichmentURL;
    v5->_headerEnrichmentURL = v26;
  }

  v28 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"fuseSilentSMSMessage"]);

  uint64_t v29 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v28, v29) & 1) != 0)
  {
    v30 = (NSString *)[v28 copy];
    silentSMSMessage = v5->_silentSMSMessage;
    v5->_silentSMSMessage = v30;
  }

  v32 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"fuseSilentSMSNumber"]);

  uint64_t v33 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v32, v33) & 1) != 0)
  {
    v34 = (NSString *)[v32 copy];
    silentSMSNumber = v5->_silentSMSNumber;
    v5->_silentSMSNumber = v34;
  }

  v36 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"fuseSmsSessionId"]);

  uint64_t v37 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v36, v37) & 1) != 0)
  {
    v38 = (NSString *)[v36 copy];
    smsSessionIdentifier = v5->_smsSessionIdentifier;
    v5->_smsSessionIdentifier = v38;
  }

  v40 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"waitTime"]);
  if ((objc_opt_respondsToSelector(v40, "doubleValue") & 1) != 0)
  {
    [v40 doubleValue];
    v5->_delayInterval = v41 / 1000.0;
  }

  v42 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"isFamily"]);
  if ((objc_opt_respondsToSelector(v42, "BOOLValue") & 1) != 0) {
    v5->_familySubscription = [v42 BOOLValue];
  }

LABEL_25:
  return v5;
}

- (int64_t)bundlingStatus
{
  return self->_bundlingStatus;
}

- (void)setBundlingStatus:(int64_t)a3
{
  self->_bundlingStatus = a3;
}

- (double)delayInterval
{
  return self->_delayInterval;
}

- (NSError)error
{
  return self->_error;
}

- (NSString)headerEnrichmentMessage
{
  return self->_headerEnrichmentMessage;
}

- (NSString)headerEnrichmentSessionIdentifier
{
  return self->_headerEnrichmentSessionIdentifier;
}

- (NSURL)headerEnrichmentURL
{
  return self->_headerEnrichmentURL;
}

- (BOOL)needsHeaderEnrichment
{
  return self->_needsHeaderEnrichment;
}

- (BOOL)needsSilentSMS
{
  return self->_needsSilentSMS;
}

- (NSString)silentSMSMessage
{
  return self->_silentSMSMessage;
}

- (NSString)silentSMSNumber
{
  return self->_silentSMSNumber;
}

- (NSString)SMSSessionIdentifier
{
  return self->_smsSessionIdentifier;
}

- (BOOL)wantsDelayedRetry
{
  return self->_wantsDelayedRetry;
}

- (BOOL)isFamilySubscription
{
  return self->_familySubscription;
}

- (void).cxx_destruct
{
}

@end