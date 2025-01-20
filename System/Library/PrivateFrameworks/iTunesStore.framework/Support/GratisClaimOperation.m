@interface GratisClaimOperation
- (BOOL)suppressesErrorDialogs;
- (GratisClaimOperation)initWithPurchase:(id)a3;
- (GratisClaimOperation)initWithRequestBody:(id)a3;
- (NSData)clientAuditTokenData;
- (NSDictionary)rawOutput;
- (NSString)authenticationReasonDescription;
- (SSURLConnectionResponse)URLResponse;
- (id)_accountID;
- (id)_authenticationContext;
- (id)_bodyData;
- (id)_newDefaultRequestProperties;
- (id)_newRetryRequestPropertiesWithURL:(id)a3;
- (void)dealloc;
- (void)operation:(id)a3 didAuthenticateWithDSID:(id)a4;
- (void)run;
- (void)setAuthenticationReasonDescription:(id)a3;
- (void)setClientAuditTokenData:(id)a3;
- (void)setSuppressesErrorDialogs:(BOOL)a3;
@end

@implementation GratisClaimOperation

- (GratisClaimOperation)initWithPurchase:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___GratisClaimOperation;
  v4 = -[GratisClaimOperation init](&v12, "init");
  if (v4)
  {
    v4->_accountID = (NSNumber *)[a3 accountIdentifier];
    v4->_defaultRequestProperties = (SSURLRequestProperties *)[a3 requestProperties];
    v4->_suppressesErrorDialogs = objc_msgSend( objc_msgSend( a3,  "valueForDownloadProperty:",  SSDownloadPropertyShouldSuppressErrorDialogs),  "BOOLValue");
    v5 = -[SSVGratisRequestBody initWithRequestStyle:]( objc_alloc(&OBJC_CLASS___SSVGratisRequestBody),  "initWithRequestStyle:",  1LL);
    v4->_requestBody = v5;
    -[SSVGratisRequestBody setAccountIdentifier:](v5, "setAccountIdentifier:", v4->_accountID);
    id v6 = [a3 gratisIdentifiers];
    if ([v6 count])
    {
      id v7 = [v6 objectAtIndex:0];
      uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSNumber);
      char isKindOfClass = objc_opt_isKindOfClass(v7, v8);
      requestBody = v4->_requestBody;
      if ((isKindOfClass & 1) != 0) {
        -[SSVGratisRequestBody setItemIdentifiers:](requestBody, "setItemIdentifiers:", v6);
      }
      else {
        -[SSVGratisRequestBody setBundleIdentifiers:](requestBody, "setBundleIdentifiers:", v6);
      }
    }
  }

  return v4;
}

- (GratisClaimOperation)initWithRequestBody:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___GratisClaimOperation;
  v4 = -[GratisClaimOperation init](&v6, "init");
  if (v4)
  {
    v4->_accountID = (NSNumber *)objc_msgSend(objc_msgSend(a3, "accountIdentifier"), "copy");
    v4->_requestBody = (SSVGratisRequestBody *)[a3 copy];
    v4->_suppressesErrorDialogs = 1;
  }

  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___GratisClaimOperation;
  -[GratisClaimOperation dealloc](&v3, "dealloc");
}

- (NSString)authenticationReasonDescription
{
  objc_super v3 = self->_authenticationReasonDescription;
  -[GratisClaimOperation unlock](self, "unlock");
  return v3;
}

- (NSData)clientAuditTokenData
{
  objc_super v3 = self->_clientAuditTokenData;
  -[GratisClaimOperation unlock](self, "unlock");
  return v3;
}

- (NSDictionary)rawOutput
{
  objc_super v3 = self->_rawOutput;
  -[GratisClaimOperation unlock](self, "unlock");
  return v3;
}

- (void)setAuthenticationReasonDescription:(id)a3
{
  authenticationReasonDescription = self->_authenticationReasonDescription;
  if (authenticationReasonDescription != a3)
  {

    self->_authenticationReasonDescription = (NSString *)[a3 copy];
  }

  -[GratisClaimOperation unlock](self, "unlock");
}

- (void)setClientAuditTokenData:(id)a3
{
  clientAuditTokenData = self->_clientAuditTokenData;
  if (clientAuditTokenData != a3)
  {

    self->_clientAuditTokenData = (NSData *)a3;
  }

  -[GratisClaimOperation unlock](self, "unlock");
}

- (void)setSuppressesErrorDialogs:(BOOL)a3
{
  self->_suppressesErrorDialogs = a3;
  -[GratisClaimOperation unlock](self, "unlock");
}

- (BOOL)suppressesErrorDialogs
{
  BOOL suppressesErrorDialogs = self->_suppressesErrorDialogs;
  -[GratisClaimOperation unlock](self, "unlock");
  return suppressesErrorDialogs;
}

- (SSURLConnectionResponse)URLResponse
{
  objc_super v3 = self->_urlResponse;
  -[GratisClaimOperation unlock](self, "unlock");
  return v3;
}

- (void)run
{
  id v3 = -[GratisClaimOperation _newDefaultRequestProperties](self, "_newDefaultRequestProperties");
  v4 = &ACSLocateCachingServer_ptr;
  p_cache = &OBJC_CLASS___PerformDownloadOperation.cache;
  objc_super v6 = &ACSLocateCachingServer_ptr;
  do
  {
    context = objc_autoreleasePoolPush();
    id v7 = objc_alloc_init((Class)v4[322]);
    [v7 setDelegate:self];
    [v7 setShouldSendXTokenHeader:1];
    id v8 = -[GratisClaimOperation _authenticationContext](self, "_authenticationContext");
    [v7 setAuthenticationContext:v8];
    id v9 = [p_cache + 393 provider];
    [v9 setAuthenticationContext:v8];
    [v7 setDataProvider:v9];
    [v7 setRequestProperties:v3];
    id v10 = [v6[459] sharedDaemonConfig];
    if (!v10) {
      id v10 = [v6[459] sharedConfig];
    }
    LODWORD(v11) = [v10 shouldLog];
    objc_super v12 = (os_log_s *)[v10 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO)) {
      uint64_t v11 = v11;
    }
    else {
      v11 &= 2u;
    }
    if ((_DWORD)v11)
    {
      uint64_t v14 = objc_opt_class(self);
      requestBody = self->_requestBody;
      *(_DWORD *)v36 = 138412546;
      *(void *)&v36[4] = v14;
      __int16 v37 = 2112;
      v38 = requestBody;
      LODWORD(v33) = 22;
      uint64_t v16 = _os_log_send_and_compose_impl( v11,  0LL,  0LL,  0LL,  &_mh_execute_header,  v12,  1LL,  "%@: Running claim with body: %@",  v36,  v33);
      if (v16)
      {
        v17 = (void *)v16;
        v18 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v16, 4LL);
        free(v17);
        v32 = v18;
        *(void *)&double v13 = SSFileLog(v10, @"%@").n128_u64[0];
      }
    }

    *(void *)v36 = 0LL;
    id v19 = -[GratisClaimOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v7,  v36,  v13,  v32);
    id v20 = [v9 redirectedClaimURL];
    if (v20)
    {

      id v3 = -[GratisClaimOperation _newRetryRequestPropertiesWithURL:](self, "_newRetryRequestPropertiesWithURL:", v20);
    }

    else
    {
      -[GratisClaimOperation lock](self, "lock");
      id v21 = [v9 output];
      if (v21)
      {
        v22 = v21;
        v34 = +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v21,  100LL,  0LL,  0LL);
        self->_rawOutput = (NSDictionary *)v22;
        id v23 = v3;
        v24 = v6;
        v25 = p_cache;
        v26 = v4;
        v27 = objc_alloc(&OBJC_CLASS___SSURLConnectionResponse);
        id v28 = [v7 response];
        v29 = v27;
        v4 = v26;
        p_cache = v25;
        objc_super v6 = v24;
        id v3 = v23;
        self->_urlResponse = -[SSURLConnectionResponse initWithURLResponse:bodyData:]( v29,  "initWithURLResponse:bodyData:",  v28,  v34);
        id v30 = [v22 objectForKey:@"duAnonymousPings"];
        uint64_t v31 = objc_opt_class(&OBJC_CLASS___NSArray);
        if ((objc_opt_isKindOfClass(v30, v31) & 1) != 0) {
          +[PurchaseOperation reportAnonymousPings:](&OBJC_CLASS___PurchaseOperation, "reportAnonymousPings:", v30);
        }
      }

      -[GratisClaimOperation unlock](self, "unlock");
      -[GratisClaimOperation setError:](self, "setError:", *(void *)v36);
      -[GratisClaimOperation setSuccess:](self, "setSuccess:", v19);
    }

    [v7 setDelegate:0];

    objc_autoreleasePoolPop(context);
  }

  while (v20);
}

- (void)operation:(id)a3 didAuthenticateWithDSID:(id)a4
{
  self->_accountID = (NSNumber *)[a4 copy];
  -[GratisClaimOperation unlock](self, "unlock");
  id v7 = -[GratisClaimOperation _authenticationContext](self, "_authenticationContext");
  objc_msgSend(objc_msgSend(a3, "dataProvider"), "setAuthenticationContext:", v7);
  [a3 setAuthenticationContext:v7];
  objc_msgSend( objc_msgSend(a3, "_requestProperties"),  "setHTTPBody:",  -[GratisClaimOperation _bodyData](self, "_bodyData"));
}

- (id)_accountID
{
  id v3 = self->_accountID;
  -[GratisClaimOperation unlock](self, "unlock");
  if (v3) {
    return v3;
  }
  id v3 = (NSNumber *)-[SSVGratisRequestBody accountIdentifier](self->_requestBody, "accountIdentifier");
  if (v3) {
    return v3;
  }
  else {
    return objc_msgSend( objc_msgSend(+[SSAccountStore defaultStore](SSAccountStore, "defaultStore"), "activeAccount"),  "uniqueIdentifier");
  }
}

- (id)_authenticationContext
{
  id v3 = -[SSMutableAuthenticationContext initWithAccountIdentifier:]( objc_alloc(&OBJC_CLASS___SSMutableAuthenticationContext),  "initWithAccountIdentifier:",  -[GratisClaimOperation _accountID](self, "_accountID"));
  if (-[GratisClaimOperation suppressesErrorDialogs](self, "suppressesErrorDialogs"))
  {
    -[SSMutableAuthenticationContext setPromptStyle:](v3, "setPromptStyle:", 1000LL);
    -[SSMutableAuthenticationContext setShouldSuppressDialogs:](v3, "setShouldSuppressDialogs:", 1LL);
  }

  -[SSMutableAuthenticationContext setReasonDescription:]( v3,  "setReasonDescription:",  -[GratisClaimOperation authenticationReasonDescription](self, "authenticationReasonDescription"));
  id v4 = -[SSURLRequestProperties HTTPHeaders](self->_defaultRequestProperties, "HTTPHeaders");
  -[SSMutableAuthenticationContext setValue:forHTTPHeaderField:]( v3,  "setValue:forHTTPHeaderField:",  [v4 objectForKey:SSHTTPHeaderUserAgent],  SSHTTPHeaderUserAgent);
  return v3;
}

- (id)_bodyData
{
  id v3 = -[SSVGratisRequestBody copy](self->_requestBody, "copy");
  id v4 = -[GratisClaimOperation _accountID](self, "_accountID");
  [v3 setAccountIdentifier:v4];
  if (v4)
  {
    CFDataRef v5 = sub_100022204((uint64_t)[v4 unsignedLongLongValue], 1);
    id v6 = -[__CFData base64EncodedStringWithOptions:](v5, "base64EncodedStringWithOptions:", 0LL);
    if (v6) {
      [v3 setValue:v6 forBodyParameter:@"kbsync"];
    }
  }

  id v7 = [v3 propertyListBodyData];

  return v7;
}

- (id)_newDefaultRequestProperties
{
  id v3 = (SSMutableURLRequestProperties *)-[SSURLRequestProperties mutableCopy]( self->_defaultRequestProperties,  "mutableCopy");
  if (!v3) {
    id v3 = objc_alloc_init(&OBJC_CLASS___SSMutableURLRequestProperties);
  }
  -[SSMutableURLRequestProperties setAllowedRetryCount:](v3, "setAllowedRetryCount:", 0LL);
  -[SSMutableURLRequestProperties setClientAuditTokenData:]( v3,  "setClientAuditTokenData:",  -[GratisClaimOperation clientAuditTokenData](self, "clientAuditTokenData"));
  -[SSMutableURLRequestProperties setITunesStoreRequest:](v3, "setITunesStoreRequest:", 1LL);
  -[SSMutableURLRequestProperties setHTTPBody:]( v3,  "setHTTPBody:",  -[GratisClaimOperation _bodyData](self, "_bodyData"));
  -[SSMutableURLRequestProperties setHTTPMethod:](v3, "setHTTPMethod:", @"POST");
  -[SSMutableURLRequestProperties setURLBagKey:](v3, "setURLBagKey:", @"up-to-date-claim");
  -[SSMutableURLRequestProperties setValue:forHTTPHeaderField:]( v3,  "setValue:forHTTPHeaderField:",  @"application/x-apple-plist",  @"Content-Type");
  id v4 = objc_msgSend( +[SSDevice currentDevice](SSDevice, "currentDevice"),  "thinnedApplicationVariantIdentifier");
  if (v4) {
    -[SSMutableURLRequestProperties setValue:forHTTPHeaderField:]( v3,  "setValue:forHTTPHeaderField:",  v4,  SSHTTPHeaderXAppleTADevice);
  }
  return v3;
}

- (id)_newRetryRequestPropertiesWithURL:(id)a3
{
  id v4 = -[SSMutableURLRequestProperties initWithURL:]( objc_alloc(&OBJC_CLASS___SSMutableURLRequestProperties),  "initWithURL:",  a3);
  -[SSMutableURLRequestProperties setAllowedRetryCount:](v4, "setAllowedRetryCount:", 0LL);
  -[SSMutableURLRequestProperties setHTTPHeaders:]( v4,  "setHTTPHeaders:",  -[SSURLRequestProperties HTTPHeaders](self->_defaultRequestProperties, "HTTPHeaders"));
  -[SSMutableURLRequestProperties setITunesStoreRequest:](v4, "setITunesStoreRequest:", 1LL);
  return v4;
}

@end