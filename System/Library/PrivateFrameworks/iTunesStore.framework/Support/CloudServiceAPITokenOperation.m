@interface CloudServiceAPITokenOperation
- (NSString)clientToken;
- (NSString)requestingBundleID;
- (NSString)requestingBundleVersion;
- (SSAuthenticationContext)authenticationContext;
- (id)responseBlock;
- (void)run;
- (void)setAuthenticationContext:(id)a3;
- (void)setClientToken:(id)a3;
- (void)setRequestingBundleID:(id)a3;
- (void)setRequestingBundleVersion:(id)a3;
- (void)setResponseBlock:(id)a3;
@end

@implementation CloudServiceAPITokenOperation

- (NSString)clientToken
{
  id v3 = -[NSString copy](self->_clientToken, "copy");
  -[CloudServiceAPITokenOperation unlock](self, "unlock");
  return (NSString *)v3;
}

- (void)setClientToken:(id)a3
{
  id v4 = a3;
  -[CloudServiceAPITokenOperation lock](self, "lock");
  v5 = (NSString *)[v4 copy];

  clientToken = self->_clientToken;
  self->_clientToken = v5;

  -[CloudServiceAPITokenOperation unlock](self, "unlock");
}

- (NSString)requestingBundleID
{
  id v3 = -[NSString copy](self->_requestingBundleID, "copy");
  -[CloudServiceAPITokenOperation unlock](self, "unlock");
  return (NSString *)v3;
}

- (void)setRequestingBundleID:(id)a3
{
  id v4 = a3;
  -[CloudServiceAPITokenOperation lock](self, "lock");
  v5 = (NSString *)[v4 copy];

  requestingBundleID = self->_requestingBundleID;
  self->_requestingBundleID = v5;

  -[CloudServiceAPITokenOperation unlock](self, "unlock");
}

- (NSString)requestingBundleVersion
{
  id v3 = -[NSString copy](self->_requestingBundleVersion, "copy");
  -[CloudServiceAPITokenOperation unlock](self, "unlock");
  return (NSString *)v3;
}

- (void)setRequestingBundleVersion:(id)a3
{
  id v4 = a3;
  -[CloudServiceAPITokenOperation lock](self, "lock");
  v5 = (NSString *)[v4 copy];

  requestingBundleVersion = self->_requestingBundleVersion;
  self->_requestingBundleVersion = v5;

  -[CloudServiceAPITokenOperation unlock](self, "unlock");
}

- (SSAuthenticationContext)authenticationContext
{
  id v3 = -[SSAuthenticationContext copy](self->_authenticationContext, "copy");
  -[CloudServiceAPITokenOperation unlock](self, "unlock");
  return (SSAuthenticationContext *)v3;
}

- (void)setAuthenticationContext:(id)a3
{
  id v4 = a3;
  -[CloudServiceAPITokenOperation lock](self, "lock");
  v5 = (SSAuthenticationContext *)[v4 copy];

  authenticationContext = self->_authenticationContext;
  self->_authenticationContext = v5;

  -[CloudServiceAPITokenOperation unlock](self, "unlock");
}

- (void)setResponseBlock:(id)a3
{
  id v6 = a3;
  -[CloudServiceAPITokenOperation lock](self, "lock");
  if (self->_responseBlock != v6)
  {
    id v4 = [v6 copy];
    id responseBlock = self->_responseBlock;
    self->_id responseBlock = v4;
  }

  -[CloudServiceAPITokenOperation unlock](self, "unlock");
}

- (id)responseBlock
{
  id v3 = [self->_responseBlock copy];
  -[CloudServiceAPITokenOperation unlock](self, "unlock");
  id v4 = objc_retainBlock(v3);

  return v4;
}

- (void)run
{
  id v76 = 0LL;
  unsigned int v3 = -[CloudServiceAPITokenOperation copyAccountID:credentialSource:byAuthenticatingWithContext:returningError:]( self,  "copyAccountID:credentialSource:byAuthenticatingWithContext:returningError:",  &v76,  0LL,  self->_authenticationContext,  0LL);
  id v4 = v76;
  v5 = v4;
  if (v3) {
    BOOL v6 = v4 == 0LL;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    id v8 = objc_alloc_init(&OBJC_CLASS___ISStoreURLOperation);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[DaemonProtocolDataProvider provider](&OBJC_CLASS___DaemonProtocolDataProvider, "provider"));
    [v8 setDataProvider:v9];

    v73 = (void *)objc_claimAutoreleasedReturnValue(-[CloudServiceAPITokenOperation authenticationContext](self, "authenticationContext"));
    objc_msgSend(v8, "setAuthenticationContext:");
    v10 = objc_alloc_init(&OBJC_CLASS___SSMutableURLRequestProperties);
    v87[0] = SSHTTPHeaderXAppleRequestingBundleID;
    v11 = (const __CFString *)-[NSString copy](self->_requestingBundleID, "copy");
    v12 = (__CFString *)v11;
    if (v11) {
      v13 = v11;
    }
    else {
      v13 = &stru_10035EB18;
    }
    v88[0] = v13;
    v87[1] = SSHTTPHeaderXAppleRequestingBundleVersion;
    v14 = (const __CFString *)-[NSString copy](self->_requestingBundleVersion, "copy");
    v15 = (__CFString *)v14;
    if (v14) {
      v16 = v14;
    }
    else {
      v16 = &stru_10035EB18;
    }
    v88[1] = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v88,  v87,  2LL));
    -[SSMutableURLRequestProperties setHTTPHeaders:](v10, "setHTTPHeaders:", v17);

    v18 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    id v19 = -[NSString copy](self->_clientToken, "copy");
    if ([v19 length]) {
      -[NSMutableDictionary setObject:forKey:](v18, "setObject:forKey:", v19, @"assertion");
    }
    v71 = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[SSDevice currentDevice](&OBJC_CLASS___SSDevice, "currentDevice"));
    v21 = (void *)objc_claimAutoreleasedReturnValue([v20 uniqueDeviceIdentifier]);

    if ([v21 length]) {
      -[NSMutableDictionary setObject:forKey:](v18, "setObject:forKey:", v21, @"guid");
    }
    if (!self->_requestingBundleID
      || (id v22 = -[objc_class standardDefaults](off_1003A2AB0(), "standardDefaults"),
          v23 = (void *)objc_claimAutoreleasedReturnValue(v22),
          v24 = (void *)objc_claimAutoreleasedReturnValue([v23 mediaLibraryAccessApplicationIdentifiersWithTCCAcceptanceDates]),
          uint64_t v25 = objc_claimAutoreleasedReturnValue([v24 objectForKey:self->_requestingBundleID]),
          v24,
          v23,
          (v26 = (void *)v25) == 0LL))
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    }

    v69 = v26;
    [v26 timeIntervalSince1970];
    v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%lld",  llround(v27 * 1000.0)));
    -[NSMutableDictionary setObject:forKey:](v18, "setObject:forKey:", v28, @"tcc-acceptance-date");

    uint64_t v29 = objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v18,  1LL,  0LL));
    -[SSMutableURLRequestProperties setValue:forHTTPHeaderField:]( v10,  "setValue:forHTTPHeaderField:",  @"application/json",  @"Content-Type");
    v68 = (void *)v29;
    -[SSMutableURLRequestProperties setHTTPBody:](v10, "setHTTPBody:", v29);
    -[SSMutableURLRequestProperties setHTTPMethod:](v10, "setHTTPMethod:", @"POST");
    -[SSMutableURLRequestProperties setURLBagKey:](v10, "setURLBagKey:", @"createMusicToken");
    [v8 setRequestProperties:v10];
    id v75 = 0LL;
    LODWORD(v29) = -[CloudServiceAPITokenOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v8,  &v75);
    id v30 = v75;
    v72 = v18;
    v70 = v21;
    v74 = v30;
    if (!(_DWORD)v29)
    {
      if (v30)
      {
        v43 = (void *)objc_claimAutoreleasedReturnValue([v30 userInfo]);
        v44 = (void *)objc_claimAutoreleasedReturnValue([v43 objectForKeyedSubscript:SSErrorHTTPStatusCodeKey]);

        if ((objc_opt_respondsToSelector(v44, "integerValue") & 1) != 0)
        {
          id v45 = [v44 integerValue];
          BOOL v46 = v45 == (id)403;
          if (v45 == (id)403) {
            uint64_t v47 = 107LL;
          }
          else {
            uint64_t v47 = 109LL;
          }
        }

        else
        {
          BOOL v46 = 0;
          uint64_t v47 = 109LL;
        }

        NSErrorUserInfoKey v83 = NSUnderlyingErrorKey;
        v84 = v74;
        v51 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v84,  &v83,  1LL));
      }

      else
      {
        v51 = 0LL;
        BOOL v46 = 0;
        uint64_t v47 = 109LL;
      }

      v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  SSErrorDomain,  v47,  v51));
      id v7 = [[SSVCloudServiceAPITokenResponse alloc] initWithToken:0 error:v52];

      if (!v46) {
        goto LABEL_59;
      }
      goto LABEL_45;
    }

    v31 = (void *)objc_claimAutoreleasedReturnValue([v8 response]);
    v32 = (void *)objc_claimAutoreleasedReturnValue([v8 dataProvider]);
    v33 = (void *)objc_claimAutoreleasedReturnValue([v32 output]);

    uint64_t v34 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v33, v34) & 1) == 0)
    {

      v33 = 0LL;
    }

    id v35 = [v31 statusCode];
    v67 = v5;
    if (v35 == (id)403)
    {
      uint64_t v36 = objc_claimAutoreleasedReturnValue([v33 objectForKey:@"error_description"]);
      v37 = (void *)v36;
      v38 = &stru_10035EB18;
      if (v36) {
        v38 = (__CFString *)v36;
      }
      v39 = v38;

      uint64_t v40 = SSErrorDomain;
      NSErrorUserInfoKey v85 = NSLocalizedDescriptionKey;
      v86 = v39;
      v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v86,  &v85,  1LL));
      v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v40,  107LL,  v41));
    }

    else
    {
      if ([v31 statusCode] == (id)200)
      {
        v48 = (void *)objc_claimAutoreleasedReturnValue([v33 objectForKey:@"music_token"]);
        uint64_t v49 = objc_opt_class(&OBJC_CLASS___NSString);
        if ((objc_opt_isKindOfClass(v48, v49) & 1) != 0)
        {
          id v50 = v48;
          v42 = 0LL;
        }

        else
        {
          v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  SSErrorDomain,  100LL,  0LL));
          id v50 = 0LL;
        }

LABEL_44:
        id v7 = [[SSVCloudServiceAPITokenResponse alloc] initWithToken:v50 error:v42];

        v5 = v67;
        if (v35 != (id)403)
        {
LABEL_59:

          goto LABEL_60;
        }

- (void).cxx_destruct
{
}

@end