@interface AKSRPRequest
+ (BOOL)_performRequestWithURL:(id)a3 context:(id)a4 error:(__CFError *)a5;
- (AKSRPContextHelper)contextHelper;
- (AKSRPRequest)initWithURL:(id)a3 contextHelper:(id)a4 completionHandler:(id)a5;
- (NSDictionary)additionalHeaders;
- (NSDictionary)dispatchingInfo;
- (NSURL)url;
- (id)_tokenGenerationInfoForContext:(id)a3;
- (int64_t)responseCode;
- (void)_attachAdditionalHeaders:(id)a3 toContextHelper:(id)a4;
- (void)_performRequestWithContext:(id)a3 responseHandler:(id)a4;
- (void)executeWithResponseHandler:(id)a3;
- (void)handleResponseCode;
- (void)invalidateWithError:(id)a3;
- (void)setAdditionalHeaders:(id)a3;
- (void)setResponseCode:(int64_t)a3;
@end

@implementation AKSRPRequest

- (AKSRPRequest)initWithURL:(id)a3 contextHelper:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___AKSRPRequest;
  v12 = -[AKSRPRequest init](&v22, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_url, a3);
    objc_storeStrong((id *)&v13->_contextHelper, a4);
    id v14 = objc_retainBlock(v11);
    id completionHandler = v13->_completionHandler;
    v13->_id completionHandler = v14;

    criticalTokenError = v13->_criticalTokenError;
    v13->_criticalTokenError = 0LL;

    dispatch_queue_attr_t v17 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v18 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v17);
    dispatch_queue_t v19 = dispatch_queue_create("com.apple.akd.srp-request", v18);
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)v19;
  }

  return v13;
}

- (NSDictionary)dispatchingInfo
{
  v3 = -[NSMutableDictionary initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableDictionary), "initWithCapacity:", 3LL);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AKSRPContextHelper client](self->_contextHelper, "client"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v5, @"capp");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AKSRPContextHelper authContext](self->_contextHelper, "authContext"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 _proxiedAppName]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v7, @"papp");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AKSRPContextHelper authContext](self->_contextHelper, "authContext"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v8 serviceType]));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v9, @"svct");

  id v10 = -[NSMutableDictionary copy](v3, "copy");
  return (NSDictionary *)v10;
}

- (void)executeWithResponseHandler:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AKSRPRequest additionalHeaders](self, "additionalHeaders"));
  -[AKSRPRequest _attachAdditionalHeaders:toContextHelper:]( self,  "_attachAdditionalHeaders:toContextHelper:",  v5,  self->_contextHelper);

  contextHelper = self->_contextHelper;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000A3B20;
  v8[3] = &unk_1001C7640;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  -[AKSRPContextHelper authenticationParametersWithCompletion:]( contextHelper,  "authenticationParametersWithCompletion:",  v8);
}

- (void)handleResponseCode
{
  int64_t v3 = -[AKSRPRequest responseCode](self, "responseCode");
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[AKSRPRequest contextHelper](self, "contextHelper"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v5 altDSID]);
  +[AKCommonResponseCodeHandler handleResponseCode:altDSID:]( &OBJC_CLASS___AKCommonResponseCodeHandler,  "handleResponseCode:altDSID:",  v3,  v4);
}

- (void)invalidateWithError:(id)a3
{
}

- (void)_performRequestWithContext:(id)a3 responseHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000A3E88;
  block[3] = &unk_1001C7280;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (id)_tokenGenerationInfoForContext:(id)a3
{
  id v5 = a3;
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSDictionary, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v5 configurationParameters]);

  id v9 = (id)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:kAppleIDAuthSupportClientProvidedData]);
  if ((objc_opt_isKindOfClass(v9, v7) & 1) != 0) {
    id v10 = v9;
  }
  else {
    id v10 = 0LL;
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[AKSRPContextHelper altDSID](self->_contextHelper, "altDSID"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 authKitAccountWithAltDSID:v12 error:0]);

  uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSNumber, v14);
  id v16 = (id)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:AKContinutationKeyGenKey]);
  char isKindOfClass = objc_opt_isKindOfClass(v16, v15);
  id v18 = 0LL;
  if ((isKindOfClass & 1) != 0) {
    id v18 = v16;
  }

  id v19 = [v18 BOOLValue];
  uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSNumber, v20);
  id v22 = (id)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:AKPasscodeIndicatorKey]);
  if ((objc_opt_isKindOfClass(v22, v21) & 1) != 0) {
    id v23 = v22;
  }
  else {
    id v23 = 0LL;
  }

  unsigned int v24 = [v23 BOOLValue];
  v25 = (void *)objc_claimAutoreleasedReturnValue([v11 passwordResetTokenForAccount:v13]);
  v26 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v19));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v26, "setObject:forKeyedSubscript:", v27, @"ckgen");

  if (v24)
  {
    uint64_t v28 = objc_claimAutoreleasedReturnValue(-[AKSRPContextHelper password](self->_contextHelper, "password"));
    if (v28) {
      int64_t v3 = (void *)v28;
    }
    else {
      int64_t v3 = 0LL;
    }
    if (v28) {
      BOOL v29 = v25 == 0LL;
    }
    else {
      BOOL v29 = 0LL;
    }
  }

  else
  {
    BOOL v29 = 0LL;
  }

  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v29));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v26, "setObject:forKeyedSubscript:", v30, @"prkgen");

  if (v24) {
  uint64_t v31 = AKAppProvidedContextKey;
  }
  v32 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:AKAppProvidedContextKey]);

  if (v32)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v31]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v26, "setObject:forKeyedSubscript:", v33, v31);

    uint64_t v34 = AKEphemeralAuthKey;
    v35 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:AKEphemeralAuthKey]);
    v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v35 BOOLValue]));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v26, "setObject:forKeyedSubscript:", v36, v34);

    uint64_t v37 = AKShortLivedTokenKey;
    v38 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:AKShortLivedTokenKey]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v26, "setObject:forKeyedSubscript:", v38, v37);
  }

  return v26;
}

+ (BOOL)_performRequestWithURL:(id)a3 context:(id)a4 error:(__CFError *)a5
{
  id v7 = a3;
  LOBYTE(a5) = AppleIDAuthSupportAuthenticate([a4 underlyingContext], v7, a5);

  return (char)a5;
}

- (void)_attachAdditionalHeaders:(id)a3 toContextHelper:(id)a4
{
  id v9 = a3;
  id v5 = a4;
  if ([v9 count])
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v9));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 additionalHeaders]);
    [v6 addEntriesFromDictionary:v7];

    id v8 = [v6 copy];
    [v5 setAdditionalHeaders:v8];
  }
}

- (NSDictionary)additionalHeaders
{
  return self->_additionalHeaders;
}

- (void)setAdditionalHeaders:(id)a3
{
}

- (int64_t)responseCode
{
  return self->_responseCode;
}

- (void)setResponseCode:(int64_t)a3
{
  self->_responseCode = a3;
}

- (NSURL)url
{
  return self->_url;
}

- (AKSRPContextHelper)contextHelper
{
  return self->_contextHelper;
}

- (void).cxx_destruct
{
}

@end