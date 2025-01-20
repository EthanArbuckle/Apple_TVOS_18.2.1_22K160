@interface CarrierBundlingEligibilityOperation
- (BOOL)isDeepLink;
- (CarrierBundlingEligibilityResponse)eligibilityResponse;
- (NSString)cellularProviderName;
- (NSString)mobileSubscriberCountryCode;
- (NSString)mobileSubscriberNetworkCode;
- (NSString)phoneNumber;
- (id)_newDefaultRequestBodyDictionary;
- (id)_newDefaultRequestBodyDictionaryWithResponseCode:(int64_t)a3 error:(id)a4;
- (id)_sendPreflightRequest:(id *)a3;
- (void)_finishEnrichmentWithSessionID:(id)a3 carrierResponse:(id)a4 URLResponse:(id)a5 URLError:(id)a6 outputBlock:(id)a7;
- (void)_finishSilentSMSWithSessionID:(id)a3 responseCode:(int64_t)a4 smsSendingError:(id)a5 outputBlock:(id)a6;
- (void)_sendEnrichmentRequestWithPreflightResponse:(id)a3 outputBlock:(id)a4;
- (void)_sendSilentSMSRequestWithPreflightResponse:(id)a3 outputBlock:(id)a4;
- (void)run;
- (void)setDeepLink:(BOOL)a3;
@end

@implementation CarrierBundlingEligibilityOperation

- (NSString)cellularProviderName
{
  id v3 = -[NSString copy](self->_cellularProviderName, "copy");
  -[CarrierBundlingEligibilityOperation unlock](self, "unlock");
  return (NSString *)v3;
}

- (CarrierBundlingEligibilityResponse)eligibilityResponse
{
  id v3 = self->_eligibilityResponse;
  -[CarrierBundlingEligibilityOperation unlock](self, "unlock");
  return v3;
}

- (BOOL)isDeepLink
{
  BOOL deepLink = self->_deepLink;
  -[CarrierBundlingEligibilityOperation unlock](self, "unlock");
  return deepLink;
}

- (NSString)mobileSubscriberCountryCode
{
  id v3 = -[NSString copy](self->_mobileSubscriberCountryCode, "copy");
  -[CarrierBundlingEligibilityOperation unlock](self, "unlock");
  return (NSString *)v3;
}

- (NSString)mobileSubscriberNetworkCode
{
  id v3 = -[NSString copy](self->_mobileSubscriberNetworkCode, "copy");
  -[CarrierBundlingEligibilityOperation unlock](self, "unlock");
  return (NSString *)v3;
}

- (NSString)phoneNumber
{
  id v3 = -[NSString copy](self->_phoneNumber, "copy");
  -[CarrierBundlingEligibilityOperation unlock](self, "unlock");
  return (NSString *)v3;
}

- (void)setDeepLink:(BOOL)a3
{
  self->_BOOL deepLink = a3;
  -[CarrierBundlingEligibilityOperation unlock](self, "unlock");
}

- (void)run
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SSVTelephonyController sharedController](&OBJC_CLASS___SSVTelephonyController, "sharedController"));
  unsigned int v5 = [v4 isPhoneNumberAccessRestricted];

  if (v5)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v33 handleFailureInMethod:a2 object:self file:@"CarrierBundlingEligibilityOperation.m" lineNumber:94 description:@"Phone number access is restricted."];
  }

  uint64_t v47 = 0LL;
  v48 = (id *)&v47;
  uint64_t v49 = 0x3032000000LL;
  v50 = sub_100099EFC;
  v51 = sub_100099F0C;
  id v52 = 0LL;
  uint64_t v41 = 0LL;
  v42 = &v41;
  uint64_t v43 = 0x3032000000LL;
  v44 = sub_100099EFC;
  v45 = sub_100099F0C;
  id v46 = 0LL;
  uint64_t v37 = 0LL;
  v38 = &v37;
  uint64_t v39 = 0x2020000000LL;
  char v40 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[ISNetworkObserver sharedInstance](&OBJC_CLASS___ISNetworkObserver, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 mobileSubscriberCountryCode]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 mobileSubscriberNetworkCode]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v6 providerName]);
  v34 = v6;
  v10 = (void *)objc_claimAutoreleasedReturnValue([v6 phoneNumber]);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[SSVTelephonyController sharedController](&OBJC_CLASS___SSVTelephonyController, "sharedController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 IMEI]);

  -[CarrierBundlingEligibilityOperation lock](self, "lock");
  v13 = (NSString *)[v9 copy];
  cellularProviderName = self->_cellularProviderName;
  self->_cellularProviderName = v13;

  v15 = (NSString *)[v7 copy];
  mobileSubscriberCountryCode = self->_mobileSubscriberCountryCode;
  self->_mobileSubscriberCountryCode = v15;

  v17 = (NSString *)[v8 copy];
  mobileSubscriberNetworkCode = self->_mobileSubscriberNetworkCode;
  self->_mobileSubscriberNetworkCode = v17;

  v19 = (NSString *)[v10 copy];
  phoneNumber = self->_phoneNumber;
  self->_phoneNumber = v19;

  v21 = (NSString *)[v12 copy];
  IMEI = self->_IMEI;
  self->_IMEI = v21;

  -[CarrierBundlingEligibilityOperation unlock](self, "unlock");
  v23 = v10;
  v24 = v9;
  v25 = v8;
  v26 = v7;
  for (i = 0LL; ; i = v29)
  {
    v28 = (id *)(v42 + 5);
    id obj = (id)v42[5];
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[CarrierBundlingEligibilityOperation _sendPreflightRequest:](self, "_sendPreflightRequest:", &obj));
    objc_storeStrong(v28, obj);

    [v29 delayInterval];
    +[NSThread sleepForTimeInterval:](&OBJC_CLASS___NSThread, "sleepForTimeInterval:");
  }

  if (v29)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue([v29 error]);

    if (v30)
    {
      uint64_t v31 = objc_claimAutoreleasedReturnValue([v29 error]);
      v32 = (void *)v42[5];
      v42[5] = v31;
    }

    else
    {
      if ((char *)[v29 bundlingStatus] - 1 <= (char *)3)
      {
        objc_storeStrong(v48 + 5, v29);
        *((_BYTE *)v38 + 24) = 1;
      }

      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472LL;
      v35[2] = sub_100099F14;
      v35[3] = &unk_10034D120;
      v35[4] = &v41;
      v35[5] = &v47;
      v35[6] = &v37;
      v32 = objc_retainBlock(v35);
      if ([v29 needsHeaderEnrichment])
      {
        -[CarrierBundlingEligibilityOperation _sendEnrichmentRequestWithPreflightResponse:outputBlock:]( self,  "_sendEnrichmentRequestWithPreflightResponse:outputBlock:",  v29,  v32);
      }

      else if ([v29 needsSilentSMS])
      {
        -[CarrierBundlingEligibilityOperation _sendSilentSMSRequestWithPreflightResponse:outputBlock:]( self,  "_sendSilentSMSRequestWithPreflightResponse:outputBlock:",  v29,  v32);
      }
    }
  }

  -[CarrierBundlingEligibilityOperation lock](self, "lock");
  objc_storeStrong((id *)&self->_eligibilityResponse, v48[5]);
  -[CarrierBundlingEligibilityOperation unlock](self, "unlock");
  -[CarrierBundlingEligibilityOperation setError:](self, "setError:", v42[5]);
  -[CarrierBundlingEligibilityOperation setSuccess:](self, "setSuccess:", *((unsigned __int8 *)v38 + 24));

  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v41, 8);

  _Block_object_dispose(&v47, 8);
}

- (void)_finishEnrichmentWithSessionID:(id)a3 carrierResponse:(id)a4 URLResponse:(id)a5 URLError:(id)a6 outputBlock:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v31 = (void (**)(id, CarrierBundlingEligibilityResponse *, id))a7;
  v16 = objc_alloc_init(&OBJC_CLASS___SSMutableURLRequestProperties);
  -[SSMutableURLRequestProperties setHTTPMethod:](v16, "setHTTPMethod:", @"POST");
  -[SSMutableURLRequestProperties setURLBagKey:](v16, "setURLBagKey:", @"fuseHeaderEnrichmentResponse");
  -[SSMutableURLRequestProperties setValue:forHTTPHeaderField:]( v16,  "setValue:forHTTPHeaderField:",  @"application/json",  @"Content-Type");
  v32 = v15;
  id v17 = -[CarrierBundlingEligibilityOperation _newDefaultRequestBodyDictionaryWithResponseCode:error:]( self,  "_newDefaultRequestBodyDictionaryWithResponseCode:error:",  [v14 statusCode],  v15);
  v18 = v17;
  if (v13) {
    [v17 setObject:v13 forKey:@"responseMessage"];
  }
  if (v12) {
    [v18 setObject:v12 forKey:@"sessionId"];
  }
  v33 = v12;
  if (-[CarrierBundlingEligibilityOperation isDeepLink](self, "isDeepLink")) {
    [v18 setObject:@"true" forKey:@"deepLink"];
  }
  v30 = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v18,  0LL,  0LL));
  -[SSMutableURLRequestProperties setHTTPBody:](v16, "setHTTPBody:", v19);

  while (1)
  {
    id v20 = objc_alloc_init(&OBJC_CLASS___ISStoreURLOperation);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[DaemonProtocolDataProvider provider](&OBJC_CLASS___DaemonProtocolDataProvider, "provider"));
    [v20 setDataProvider:v21];

    [v20 setRequestProperties:v16];
    id v34 = 0LL;
    unsigned int v22 = -[CarrierBundlingEligibilityOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v20,  &v34);
    id v23 = v34;
    v24 = (void *)objc_claimAutoreleasedReturnValue([v20 dataProvider]);
    v25 = (void *)objc_claimAutoreleasedReturnValue([v24 output]);

    v26 = 0LL;
    if (v22)
    {
      uint64_t v27 = objc_opt_class(&OBJC_CLASS___NSDictionary);
      if ((objc_opt_isKindOfClass(v25, v27) & 1) != 0) {
        v26 = -[CarrierBundlingEligibilityResponse initWithEligibilityDictionary:]( objc_alloc(&OBJC_CLASS___CarrierBundlingEligibilityResponse),  "initWithEligibilityDictionary:",  v25);
      }
      else {
        v26 = 0LL;
      }
    }

    if (!-[CarrierBundlingEligibilityResponse wantsDelayedRetry](v26, "wantsDelayedRetry")) {
      break;
    }
    -[CarrierBundlingEligibilityResponse delayInterval](v26, "delayInterval");
    +[NSThread sleepForTimeInterval:](&OBJC_CLASS___NSThread, "sleepForTimeInterval:");
  }

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[CarrierBundlingEligibilityResponse error](v26, "error"));
  if (v28)
  {
    uint64_t v29 = objc_claimAutoreleasedReturnValue(-[CarrierBundlingEligibilityResponse error](v26, "error"));

    v26 = 0LL;
    id v23 = (id)v29;
  }

  v31[2](v31, v26, v23);
}

- (void)_finishSilentSMSWithSessionID:(id)a3 responseCode:(int64_t)a4 smsSendingError:(id)a5 outputBlock:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  uint64_t v27 = (void (**)(id, CarrierBundlingEligibilityResponse *, id))a6;
  id v12 = objc_alloc_init(&OBJC_CLASS___SSMutableURLRequestProperties);
  -[SSMutableURLRequestProperties setHTTPMethod:](v12, "setHTTPMethod:", @"POST");
  -[SSMutableURLRequestProperties setURLBagKey:](v12, "setURLBagKey:", @"fuseHeaderEnrichmentResponse");
  -[SSMutableURLRequestProperties setValue:forHTTPHeaderField:]( v12,  "setValue:forHTTPHeaderField:",  @"application/json",  @"Content-Type");
  v28 = v11;
  id v13 = -[CarrierBundlingEligibilityOperation _newDefaultRequestBodyDictionaryWithResponseCode:error:]( self,  "_newDefaultRequestBodyDictionaryWithResponseCode:error:",  a4,  v11);
  id v14 = v13;
  if (v10) {
    [v13 setObject:v10 forKey:@"sessionId"];
  }
  if (-[CarrierBundlingEligibilityOperation isDeepLink](self, "isDeepLink")) {
    [v14 setObject:@"true" forKey:@"deepLink"];
  }
  v26 = v14;
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v14,  0LL,  0LL));
  -[SSMutableURLRequestProperties setHTTPBody:](v12, "setHTTPBody:", v15);

  while (1)
  {
    id v16 = objc_alloc_init(&OBJC_CLASS___ISStoreURLOperation);
    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[DaemonProtocolDataProvider provider](&OBJC_CLASS___DaemonProtocolDataProvider, "provider"));
    [v16 setDataProvider:v17];

    [v16 setRequestProperties:v12];
    id v29 = 0LL;
    unsigned int v18 = -[CarrierBundlingEligibilityOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v16,  &v29);
    id v19 = v29;
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v16 dataProvider]);
    v21 = (void *)objc_claimAutoreleasedReturnValue([v20 output]);

    unsigned int v22 = 0LL;
    if (v18)
    {
      uint64_t v23 = objc_opt_class(&OBJC_CLASS___NSDictionary);
      if ((objc_opt_isKindOfClass(v21, v23) & 1) != 0) {
        unsigned int v22 = -[CarrierBundlingEligibilityResponse initWithEligibilityDictionary:]( objc_alloc(&OBJC_CLASS___CarrierBundlingEligibilityResponse),  "initWithEligibilityDictionary:",  v21);
      }
      else {
        unsigned int v22 = 0LL;
      }
    }

    if (!-[CarrierBundlingEligibilityResponse wantsDelayedRetry](v22, "wantsDelayedRetry")) {
      break;
    }
    -[CarrierBundlingEligibilityResponse delayInterval](v22, "delayInterval");
    +[NSThread sleepForTimeInterval:](&OBJC_CLASS___NSThread, "sleepForTimeInterval:");
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CarrierBundlingEligibilityResponse error](v22, "error"));
  if (v24)
  {
    uint64_t v25 = objc_claimAutoreleasedReturnValue(-[CarrierBundlingEligibilityResponse error](v22, "error"));

    unsigned int v22 = 0LL;
    id v19 = (id)v25;
  }

  v27[2](v27, v22, v19);
}

- (id)_newDefaultRequestBodyDictionary
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarrierBundlingEligibilityOperation cellularProviderName](self, "cellularProviderName"));
  if (v4) {
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v4, @"carrier");
  }
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[ISDevice sharedInstance](&OBJC_CLASS___ISDevice, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 guid]);

  if (v6) {
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v6, @"guid");
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarrierBundlingEligibilityOperation mobileSubscriberCountryCode](self, "mobileSubscriberCountryCode"));

  if (v7) {
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v7, @"MCC");
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarrierBundlingEligibilityOperation mobileSubscriberNetworkCode](self, "mobileSubscriberNetworkCode"));

  if (v8) {
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v8, @"MNC");
  }
  -[CarrierBundlingEligibilityOperation lock](self, "lock");
  v9 = self->_IMEI;

  -[CarrierBundlingEligibilityOperation unlock](self, "unlock");
  if (v9) {
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v9, @"IMEI");
  }

  return v3;
}

- (id)_newDefaultRequestBodyDictionaryWithResponseCode:(int64_t)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = -[CarrierBundlingEligibilityOperation _newDefaultRequestBodyDictionary](self, "_newDefaultRequestBodyDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%ld", a3));
  [v7 setObject:v8 forKey:@"responseCode"];

  if (v6)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v6 domain]);

    if (v9)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 domain]);
      [v7 setObject:v10 forKey:@"error-domain"];
    }

    if ([v6 code])
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v6 code]));
      [v7 setObject:v11 forKey:@"error-code"];
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 userInfo]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:NSLocalizedDescriptionKey]);
    if (v13) {
      [v7 setObject:v13 forKey:@"error-title"];
    }
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:NSLocalizedFailureReasonErrorKey]);

    if (v14) {
      [v7 setObject:v14 forKey:@"error-message"];
    }
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:NSUnderlyingErrorKey]);

    if (v15)
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@", v15));
      [v7 setObject:v16 forKey:@"error-underlying"];
    }
  }

  return v7;
}

- (void)_sendEnrichmentRequestWithPreflightResponse:(id)a3 outputBlock:(id)a4
{
  id v6 = a3;
  v50 = (void (**)(id, uint64_t, uint64_t))a4;
  uint64_t v62 = 0LL;
  v63 = &v62;
  uint64_t v64 = 0x3032000000LL;
  v65 = sub_100099EFC;
  v66 = sub_100099F0C;
  id v67 = 0LL;
  uint64_t v56 = 0LL;
  v57 = &v56;
  uint64_t v58 = 0x3032000000LL;
  v59 = sub_100099EFC;
  v60 = sub_100099F0C;
  id v61 = 0LL;
  v53 = v6;
  id v52 = (void *)objc_claimAutoreleasedReturnValue([v6 headerEnrichmentURL]);
  if (v52)
  {
    [v6 delayInterval];
    if (v7 > 2.22044605e-16) {
      +[NSThread sleepForTimeInterval:](&OBJC_CLASS___NSThread, "sleepForTimeInterval:");
    }
    applicationID = (const __CFString *)kSSUserDefaultsIdentifier;
    while (1)
    {
      id v8 = objc_alloc_init(&OBJC_CLASS___ISURLOperation);
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[ISDataProvider provider](&OBJC_CLASS___ISDataProvider, "provider"));
      [v8 setDataProvider:v9];

      [v8 _setLoadsHTTPFailures:1];
      id v10 = -[SSMutableURLRequestProperties initWithURL:]( objc_alloc(&OBJC_CLASS___SSMutableURLRequestProperties),  "initWithURL:",  v52);
      -[SSMutableURLRequestProperties setHTTPMethod:](v10, "setHTTPMethod:", @"POST");
      -[SSMutableURLRequestProperties setITunesStoreRequest:](v10, "setITunesStoreRequest:", 0LL);
      -[SSMutableURLRequestProperties setValue:forHTTPHeaderField:]( v10,  "setValue:forHTTPHeaderField:",  @"ValidateMobile",  @"SOAPAction");
      else {
        BOOL v11 = 1LL;
      }
      -[SSMutableURLRequestProperties setRequiresCellularDataNetwork:](v10, "setRequiresCellularDataNetwork:", v11, v47);
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v53 headerEnrichmentMessage]);
      uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSString);
      if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
      {
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 dataUsingEncoding:4]);
        -[SSMutableURLRequestProperties setHTTPBody:](v10, "setHTTPBody:", v14);
      }

      -[SSMutableURLRequestProperties setValue:forHTTPHeaderField:]( v10,  "setValue:forHTTPHeaderField:",  @"text/xml; charset=utf-8",
        @"Content-Type");
      [v8 setRequestProperties:v10];
      id v15 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
      if (!v15) {
        id v15 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
      }
      unsigned int v16 = [v15 shouldLog];
      unsigned int v17 = [v15 shouldLogToDisk];
      unsigned int v18 = (os_log_s *)objc_claimAutoreleasedReturnValue([v15 OSLogObject]);
      id v19 = v18;
      if (v17) {
        unsigned int v20 = v16 | 2;
      }
      else {
        unsigned int v20 = v16;
      }
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO)) {
        uint64_t v21 = v20;
      }
      else {
        uint64_t v21 = v20 & 2;
      }
      if ((_DWORD)v21)
      {
        unsigned int v22 = (void *)objc_opt_class(self);
        int v68 = 138412290;
        v69 = v22;
        id v23 = v22;
        LODWORD(v49) = 12;
        v24 = (void *)_os_log_send_and_compose_impl( v21,  0LL,  0LL,  0LL,  &_mh_execute_header,  v19,  1LL,  "%@: Sending header enrichment request",  &v68,  v49);

        if (!v24) {
          goto LABEL_22;
        }
        id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v24,  4LL));
        free(v24);
        v48 = v19;
        SSFileLog(v15, @"%@");
      }

LABEL_22:
      uint64_t v25 = (id *)(v57 + 5);
      id obj = (id)v57[5];
      -[CarrierBundlingEligibilityOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v8,  &obj);
      objc_storeStrong(v25, obj);
      v26 = (NSHTTPURLResponse *)objc_claimAutoreleasedReturnValue([v8 response]);
      if (v26)
      {
        id v27 = 0LL;
LABEL_24:
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "headerEnrichmentSessionIdentifier", v48));
        id v29 = (void *)objc_claimAutoreleasedReturnValue([v8 dataProvider]);
        v30 = (void *)objc_claimAutoreleasedReturnValue([v29 output]);

        uint64_t v31 = objc_opt_class(&OBJC_CLASS___NSData);
        if ((objc_opt_isKindOfClass(v30, v31) & 1) != 0) {
          v32 = -[NSString initWithData:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithData:encoding:",  v30,  4LL);
        }
        else {
          v32 = 0LL;
        }
        v54[0] = _NSConcreteStackBlock;
        v54[1] = 3221225472LL;
        v54[2] = sub_10009B06C;
        v54[3] = &unk_10034D148;
        v54[4] = &v56;
        v54[5] = &v62;
        -[CarrierBundlingEligibilityOperation _finishEnrichmentWithSessionID:carrierResponse:URLResponse:URLError:outputBlock:]( self,  "_finishEnrichmentWithSessionID:carrierResponse:URLResponse:URLError:outputBlock:",  v28,  v32,  v26,  v27,  v54);

        goto LABEL_32;
      }

      v33 = (void *)objc_claimAutoreleasedReturnValue([(id)v57[5] domain]);
      unsigned int v34 = [v33 isEqualToString:NSURLErrorDomain];

      if (!v34)
      {
        v26 = 0LL;
        id v27 = 0LL;
        goto LABEL_32;
      }

      v26 = -[NSHTTPURLResponse initWithURL:statusCode:HTTPVersion:headerFields:]( objc_alloc(&OBJC_CLASS___NSHTTPURLResponse),  "initWithURL:statusCode:HTTPVersion:headerFields:",  v52,  400LL,  @"HTTP/1.1",  0LL);
      id v27 = [(id)v57[5] copy];
      if (v26) {
        goto LABEL_24;
      }
LABEL_32:
      if (!objc_msgSend((id)v63[5], "needsHeaderEnrichment", v48))
      {

        goto LABEL_48;
      }

      v35 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
      if (!v35) {
        v35 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
      }
      unsigned int v36 = [v35 shouldLog];
      unsigned int v37 = [v35 shouldLogToDisk];
      v38 = (os_log_s *)objc_claimAutoreleasedReturnValue([v35 OSLogObject]);
      uint64_t v39 = v38;
      if (v37) {
        unsigned int v40 = v36 | 2;
      }
      else {
        unsigned int v40 = v36;
      }
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v41 = v40;
      }
      else {
        uint64_t v41 = v40 & 2;
      }
      if ((_DWORD)v41)
      {
        v42 = (void *)objc_opt_class(self);
        int v68 = 138412290;
        v69 = v42;
        id v43 = v42;
        LODWORD(v49) = 12;
        v44 = (void *)_os_log_send_and_compose_impl( v41,  0LL,  0LL,  0LL,  &_mh_execute_header,  v39,  0LL,  "%@: Performing delayed retry: still need header enrichment",  &v68,  v49);

        if (!v44) {
          goto LABEL_45;
        }
        uint64_t v39 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v44,  4LL));
        free(v44);
        uint64_t v47 = v39;
        SSFileLog(v35, @"%@");
      }

LABEL_45:
      [(id)v63[5] delayInterval];
      +[NSThread sleepForTimeInterval:](&OBJC_CLASS___NSThread, "sleepForTimeInterval:");
    }
  }

  uint64_t v45 = SSError(SSErrorDomain, 2LL, 0LL, 0LL);
  uint64_t v46 = objc_claimAutoreleasedReturnValue(v45);
  id v8 = (id)v57[5];
  v57[5] = v46;
LABEL_48:

  if (v50) {
    v50[2](v50, v63[5], v57[5]);
  }

  _Block_object_dispose(&v56, 8);
  _Block_object_dispose(&v62, 8);
}

- (id)_sendPreflightRequest:(id *)a3
{
  unsigned int v5 = objc_alloc_init(&OBJC_CLASS___ISLoadURLBagOperation);
  id v45 = 0LL;
  -[CarrierBundlingEligibilityOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v5,  &v45);
  id v6 = v45;
  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[ISLoadURLBagOperation URLBag](v5, "URLBag"));
  uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 urlForKey:@"fuseHeaderEnrichment"]);
  v9 = (void *)v8;
  if (v6) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = v7 == 0LL;
  }
  if (!v10 && v8 == 0)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v26) {
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    LODWORD(v27) = [v26 shouldLog];
    v28 = (os_log_s *)objc_claimAutoreleasedReturnValue([v26 OSLogObject]);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO)) {
      uint64_t v27 = v27;
    }
    else {
      v27 &= 2u;
    }
    if ((_DWORD)v27)
    {
      id v29 = (void *)objc_opt_class(self);
      int v46 = 138412290;
      uint64_t v47 = v29;
      id v30 = v29;
      uint64_t v31 = (void *)_os_log_send_and_compose_impl( v27,  0LL,  0LL,  0LL,  &_mh_execute_header,  v28,  1LL,  "%@: Loaded bag successfully, but no enrichment URL found. Assuming carrier bundle status not eligible.",  &v46,  12);

      if (!v31)
      {
LABEL_35:

        v32 = objc_alloc_init(&OBJC_CLASS___CarrierBundlingEligibilityResponse);
        -[CarrierBundlingEligibilityResponse setBundlingStatus:](v32, "setBundlingStatus:", 2LL);
        id v33 = 0LL;
        goto LABEL_45;
      }

      v28 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v31,  4LL));
      free(v31);
      SSFileLog(v26, @"%@");
    }

    goto LABEL_35;
  }

  if (!v8)
  {
    uint64_t v34 = SSError(SSErrorDomain, 3LL, 0LL, 0LL);
    id v33 = (id)objc_claimAutoreleasedReturnValue(v34);
    v32 = 0LL;
    goto LABEL_45;
  }

  id v12 = objc_alloc_init(&OBJC_CLASS___ISStoreURLOperation);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[DaemonProtocolDataProvider provider](&OBJC_CLASS___DaemonProtocolDataProvider, "provider"));
  [v12 setDataProvider:v13];

  [v12 setMachineDataStyle:3];
  id v14 = -[SSMutableURLRequestProperties initWithURL:]( objc_alloc(&OBJC_CLASS___SSMutableURLRequestProperties),  "initWithURL:",  v9);
  -[SSMutableURLRequestProperties setHTTPMethod:](v14, "setHTTPMethod:", @"POST");
  -[SSMutableURLRequestProperties setValue:forHTTPHeaderField:]( v14,  "setValue:forHTTPHeaderField:",  @"application/json",  @"Content-Type");
  id v15 = -[CarrierBundlingEligibilityOperation _newDefaultRequestBodyDictionary]( self,  "_newDefaultRequestBodyDictionary");
  uint64_t v16 = objc_claimAutoreleasedReturnValue(-[CarrierBundlingEligibilityOperation phoneNumber](self, "phoneNumber"));
  if (v16) {
    [v15 setObject:v16 forKey:@"phoneNumber"];
  }
  unsigned int v40 = (void *)v16;
  if (-[CarrierBundlingEligibilityOperation isDeepLink](self, "isDeepLink")) {
    [v15 setObject:@"true" forKey:@"deepLink"];
  }
  v42 = a3;
  id v43 = v6;
  uint64_t v41 = v15;
  unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v15,  0LL,  0LL));
  -[SSMutableURLRequestProperties setHTTPBody:](v14, "setHTTPBody:", v17);

  [v12 setRequestProperties:v14];
  unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v18) {
    unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v19 = [v18 shouldLog];
  else {
    unsigned int v20 = v19;
  }
  uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue([v18 OSLogObject]);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO)) {
    uint64_t v22 = v20;
  }
  else {
    uint64_t v22 = v20 & 2;
  }
  if (!(_DWORD)v22)
  {
    id v6 = v43;
    goto LABEL_38;
  }

  id v23 = (void *)objc_opt_class(self);
  int v46 = 138412290;
  uint64_t v47 = v23;
  id v24 = v23;
  uint64_t v25 = (void *)_os_log_send_and_compose_impl( v22,  0LL,  0LL,  0LL,  &_mh_execute_header,  v21,  1LL,  "%@: Running preflight operation",  &v46,  12);

  id v6 = v43;
  if (v25)
  {
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v25,  4LL));
    free(v25);
    SSFileLog(v18, @"%@");
LABEL_38:
  }

  id v44 = 0LL;
  unsigned int v35 = -[CarrierBundlingEligibilityOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v12,  &v44);
  id v33 = v44;
  v32 = 0LL;
  a3 = v42;
  if (v35)
  {
    unsigned int v36 = (void *)objc_claimAutoreleasedReturnValue([v12 dataProvider]);
    unsigned int v37 = (void *)objc_claimAutoreleasedReturnValue([v36 output]);

    uint64_t v38 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v37, v38) & 1) != 0) {
      v32 = -[CarrierBundlingEligibilityResponse initWithEligibilityDictionary:]( objc_alloc(&OBJC_CLASS___CarrierBundlingEligibilityResponse),  "initWithEligibilityDictionary:",  v37);
    }
    else {
      v32 = 0LL;
    }

    id v6 = v43;
  }

LABEL_45:
  if (a3 && !v32) {
    *a3 = v33;
  }

  return v32;
}

- (void)_sendSilentSMSRequestWithPreflightResponse:(id)a3 outputBlock:(id)a4
{
  id v6 = a3;
  uint64_t v49 = (void (**)(id, uint64_t, uint64_t))a4;
  uint64_t v59 = 0LL;
  v60 = &v59;
  uint64_t v61 = 0x3032000000LL;
  uint64_t v62 = sub_100099EFC;
  v63 = sub_100099F0C;
  id v64 = 0LL;
  uint64_t v53 = 0LL;
  v54 = &v53;
  uint64_t v55 = 0x3032000000LL;
  uint64_t v56 = sub_100099EFC;
  v57 = sub_100099F0C;
  id v58 = 0LL;
  double v7 = (void *)objc_claimAutoreleasedReturnValue([v6 silentSMSMessage]);
  v50 = v6;
  uint64_t v8 = objc_claimAutoreleasedReturnValue([v6 silentSMSNumber]);
  v9 = (void *)v8;
  if (!v7 || !v8)
  {
    uint64_t v44 = SSError(SSErrorDomain, 2LL, 0LL, 0LL);
    uint64_t v45 = objc_claimAutoreleasedReturnValue(v44);
    id v13 = (id)v54[5];
    v54[5] = v45;
    goto LABEL_49;
  }

  [v6 delayInterval];
  if (v10 > 2.22044605e-16) {
    +[NSThread sleepForTimeInterval:](&OBJC_CLASS___NSThread, "sleepForTimeInterval:");
  }
  while (1)
  {
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue( +[SSVTelephonyController sharedController]( &OBJC_CLASS___SSVTelephonyController,  "sharedController",  v46));
    id v52 = 0LL;
    unsigned int v12 = [v11 sendSMSWithText:v7 toPhoneNumber:v9 countryCode:0 error:&v52];
    id v13 = v52;

    if (v12)
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
      if (!v14) {
        id v14 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
      }
      unsigned int v15 = [v14 shouldLog];
      unsigned int v16 = [v14 shouldLogToDisk];
      unsigned int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v14 OSLogObject]);
      unsigned int v18 = v17;
      if (v16) {
        unsigned int v19 = v15 | 2;
      }
      else {
        unsigned int v19 = v15;
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO)) {
        uint64_t v20 = v19;
      }
      else {
        uint64_t v20 = v19 & 2;
      }
      if (!(_DWORD)v20) {
        goto LABEL_17;
      }
      uint64_t v21 = (void *)objc_opt_class(self);
      int v65 = 138412290;
      v66 = v21;
      id v22 = v21;
      LODWORD(v48) = 12;
      id v23 = (void *)_os_log_send_and_compose_impl( v20,  0LL,  0LL,  0LL,  &_mh_execute_header,  v18,  1LL,  "%@: Silent SMS succeeded",  &v65,  v48);

      if (v23)
      {
        unsigned int v18 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v23,  4LL));
        free(v23);
        uint64_t v47 = v18;
        SSFileLog(v14, @"%@");
LABEL_17:
        uint64_t v24 = 200LL;
        goto LABEL_30;
      }

      uint64_t v24 = 200LL;
    }

    else
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
      if (!v14) {
        id v14 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
      }
      unsigned int v25 = [v14 shouldLog];
      unsigned int v26 = [v14 shouldLogToDisk];
      uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue([v14 OSLogObject]);
      unsigned int v18 = v27;
      if (v26) {
        unsigned int v28 = v25 | 2;
      }
      else {
        unsigned int v28 = v25;
      }
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        uint64_t v29 = v28;
      }
      else {
        uint64_t v29 = v28 & 2;
      }
      if (!(_DWORD)v29) {
        goto LABEL_29;
      }
      id v30 = (void *)objc_opt_class(self);
      int v65 = 138412290;
      v66 = v30;
      id v31 = v30;
      LODWORD(v48) = 12;
      v32 = (void *)_os_log_send_and_compose_impl( v29,  0LL,  0LL,  0LL,  &_mh_execute_header,  v18,  16LL,  "%@: Silent SMS failed",  &v65,  v48);

      if (v32)
      {
        unsigned int v18 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v32,  4LL));
        free(v32);
        uint64_t v47 = v18;
        SSFileLog(v14, @"%@");
LABEL_29:
        uint64_t v24 = 460LL;
LABEL_30:

        goto LABEL_31;
      }

      uint64_t v24 = 460LL;
    }

- (void).cxx_destruct
{
}

@end