@interface GetPlayInfoOperation
- (GetPlayInfoOperation)initWithPlayInfoRequestContext:(id)a3;
- (NSString)clientIdentifierHeader;
- (NSString)userAgent;
- (SSPlayInfoRequestContext)playInfoContext;
- (SSPlayInfoResponse)playInfoResponse;
- (id)_copyRequestBody:(id *)a3;
- (void)_failWithError:(id)a3;
- (void)_setPlayInfoResponse:(id)a3;
- (void)_setResponseForOutput:(id)a3;
- (void)dealloc;
- (void)run;
- (void)setClientIdentifierHeader:(id)a3;
- (void)setUserAgent:(id)a3;
@end

@implementation GetPlayInfoOperation

- (GetPlayInfoOperation)initWithPlayInfoRequestContext:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___GetPlayInfoOperation;
  v4 = -[GetPlayInfoOperation init](&v6, "init");
  if (v4) {
    v4->_context = (SSPlayInfoRequestContext *)[a3 copy];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___GetPlayInfoOperation;
  -[GetPlayInfoOperation dealloc](&v3, "dealloc");
}

- (NSString)clientIdentifierHeader
{
  objc_super v3 = self->_clientIdentifierHeader;
  -[GetPlayInfoOperation unlock](self, "unlock");
  return v3;
}

- (SSPlayInfoRequestContext)playInfoContext
{
  return (SSPlayInfoRequestContext *)-[SSPlayInfoRequestContext copy](self->_context, "copy");
}

- (SSPlayInfoResponse)playInfoResponse
{
  objc_super v3 = self->_response;
  -[GetPlayInfoOperation unlock](self, "unlock");
  return v3;
}

- (void)setClientIdentifierHeader:(id)a3
{
  clientIdentifierHeader = self->_clientIdentifierHeader;
  if (clientIdentifierHeader != a3)
  {

    self->_clientIdentifierHeader = (NSString *)[a3 copy];
  }

  -[GetPlayInfoOperation unlock](self, "unlock");
}

- (void)setUserAgent:(id)a3
{
  userAgent = self->_userAgent;
  if (userAgent != a3)
  {

    self->_userAgent = (NSString *)[a3 copy];
  }

  -[GetPlayInfoOperation unlock](self, "unlock");
}

- (NSString)userAgent
{
  objc_super v3 = self->_userAgent;
  -[GetPlayInfoOperation unlock](self, "unlock");
  return v3;
}

- (void)run
{
  uint64_t v30 = 0LL;
  id v3 = -[GetPlayInfoOperation _copyRequestBody:](self, "_copyRequestBody:", &v30);
  if (!v3)
  {
    id v11 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v11) {
      id v11 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v12 = [v11 shouldLog];
    else {
      LODWORD(v13) = v12;
    }
    v14 = (os_log_s *)[v11 OSLogObject];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v13 = v13;
    }
    else {
      v13 &= 2u;
    }
    if (!(_DWORD)v13) {
      goto LABEL_26;
    }
LABEL_24:
    uint64_t v16 = objc_opt_class(self);
    int v31 = 138412546;
    uint64_t v32 = v16;
    __int16 v33 = 2112;
    uint64_t v34 = v30;
    uint64_t v17 = _os_log_send_and_compose_impl( v13,  0LL,  0LL,  0LL,  &_mh_execute_header,  v14,  0LL,  "%@: Could not generate request body: %@",  &v31,  22);
    if (v17)
    {
      v18 = (void *)v17;
      +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v17, 4LL);
      free(v18);
      SSFileLog(v11, @"%@");
    }

- (id)_copyRequestBody:(id *)a3
{
  v38 = 0LL;
  id v5 = -[SSPlayInfoRequestContext sinfs](self->_context, "sinfs");
  if ([v5 count]) {
    id v6 = -[SinfsArray initWithSINFs:](objc_alloc(&OBJC_CLASS___SinfsArray), "initWithSINFs:", v5);
  }
  else {
    id v6 = 0LL;
  }
  id v7 = -[SSPlayInfoRequestContext accountIdentifier](self->_context, "accountIdentifier");
  if (v7) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = v6 == 0LL;
  }
  if (!v8) {
    id v7 =  -[SinfsArray copyValueForProperty:error:]( v6,  "copyValueForProperty:error:",  @"SinfPropertyAccountIdentifier",  &v38);
  }
  if (v7)
  {
    v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v7, @"dsid");
    id v10 = -[SSPlayInfoRequestContext contentIdentifier](self->_context, "contentIdentifier");
    if (v10)
    {
      -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v10, @"content-id");
    }

    else
    {
      id v18 = -[SinfsArray copyValueForProperty:error:]( v6,  "copyValueForProperty:error:",  @"SinfPropertyFairPlayKeyIdentifier",  &v38);
      if (v18)
      {
        v19 = v18;
        v20 = -[NSArray initWithObjects:](objc_alloc(&OBJC_CLASS___NSArray), "initWithObjects:", v18, 0LL);
        id v21 = -[SinfsArray copyValueForProperty:error:]( v6,  "copyValueForProperty:error:",  @"SinfPropertyRentalInformation",  0LL);
        if (v21) {
          unsigned int v22 = @"rental-ids";
        }
        else {
          unsigned int v22 = @"key-ids";
        }
        -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v20, v22);
      }

      else
      {
        id v29 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
        if (!v29) {
          id v29 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
        }
        unsigned int v30 = [v29 shouldLog];
        else {
          LODWORD(v31) = v30;
        }
        uint64_t v32 = (os_log_s *)[v29 OSLogObject];
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT)) {
          uint64_t v31 = v31;
        }
        else {
          v31 &= 2u;
        }
        if ((_DWORD)v31)
        {
          uint64_t v33 = objc_opt_class(self);
          int v39 = 138412546;
          uint64_t v40 = v33;
          __int16 v41 = 2112;
          v42 = v38;
          uint64_t v34 = _os_log_send_and_compose_impl( v31,  0LL,  0LL,  0LL,  &_mh_execute_header,  v32,  0LL,  "%@: Could not get key identifier: %@",  &v39,  22);
          if (v34)
          {
            v35 = (void *)v34;
            v36 = +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v34,  4LL);
            free(v35);
            v37 = v36;
            SSFileLog(v29, @"%@");
          }
        }
      }
    }

    id v23 = -[SSPlayInfoRequestContext playbackType](self->_context, "playbackType", v37);
    if (v23) {
      -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v23, @"subPlayType");
    }
    id v24 = -[ISDevice guid](+[ISDevice sharedInstance](&OBJC_CLASS___ISDevice, "sharedInstance"), "guid");
    if (v24) {
      -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v24, @"guid");
    }
    id v25 = objc_msgSend(+[SSDevice currentDevice](SSDevice, "currentDevice"), "productType");
    if (v25) {
      -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v25, @"hw.model");
    }
    id v26 = -[SSPlayInfoRequestContext playerGUID](self->_context, "playerGUID");
    if (v26) {
      -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v26, @"player-guid");
    }
    id v27 = -[SSPlayInfoRequestContext SICData](self->_context, "SICData");
    if (v27) {
      -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v27, @"sic");
    }
  }

  else
  {
    id v11 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v11) {
      id v11 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v12 = [v11 shouldLog];
    else {
      LODWORD(v13) = v12;
    }
    v14 = (os_log_s *)[v11 OSLogObject];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v13 = v13;
    }
    else {
      v13 &= 2u;
    }
    if ((_DWORD)v13)
    {
      uint64_t v15 = objc_opt_class(self);
      int v39 = 138412546;
      uint64_t v40 = v15;
      __int16 v41 = 2112;
      v42 = v38;
      uint64_t v16 = _os_log_send_and_compose_impl( v13,  0LL,  0LL,  0LL,  &_mh_execute_header,  v14,  0LL,  "%@: Could not get DSID: %@",  &v39,  22);
      if (v16)
      {
        uint64_t v17 = (void *)v16;
        +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v16, 4LL);
        free(v17);
        SSFileLog(v11, @"%@");
      }
    }

    v9 = 0LL;
  }

  if (v38)
  {

    v9 = 0LL;
  }

  if (a3) {
    *a3 = v38;
  }
  return v9;
}

- (void)_failWithError:(id)a3
{
  id v3 = a3;
  if (!a3) {
    id v3 = (id)SSError(SSErrorDomain, 100LL, 0LL, 0LL);
  }
  id v5 = -[SSPlayInfoResponse initWithPlayInfoData:error:]( objc_alloc(&OBJC_CLASS___SSPlayInfoResponse),  "initWithPlayInfoData:error:",  0LL,  v3);
  -[GetPlayInfoOperation _setPlayInfoResponse:](self, "_setPlayInfoResponse:", v5);
  -[GetPlayInfoOperation setError:](self, "setError:", v3);
}

- (void)_setPlayInfoResponse:(id)a3
{
  response = self->_response;
  if (response != a3)
  {

    self->_response = (SSPlayInfoResponse *)a3;
  }

  -[GetPlayInfoOperation unlock](self, "unlock");
}

- (void)_setResponseForOutput:(id)a3
{
  id v5 = [a3 objectForKey:@"status"];
  if (v5
    && (id v6 = v5, (objc_opt_respondsToSelector(v5, "intValue") & 1) != 0)
    && [v6 intValue])
  {
    id v7 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v7) {
      id v7 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v8 = [v7 shouldLog];
    else {
      LODWORD(v9) = v8;
    }
    id v10 = (os_log_s *)[v7 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v9 = v9;
    }
    else {
      v9 &= 2u;
    }
    if ((_DWORD)v9)
    {
      int v18 = 138412546;
      uint64_t v19 = objc_opt_class(self);
      __int16 v20 = 2112;
      id v21 = v6;
      uint64_t v11 = _os_log_send_and_compose_impl( v9,  0LL,  0LL,  0LL,  &_mh_execute_header,  v10,  0LL,  "%@: Received failure status code: %@",  &v18,  22);
      if (v11)
      {
        unsigned int v12 = (void *)v11;
        uint64_t v13 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v11, 4LL);
        free(v12);
        uint64_t v16 = v13;
        SSFileLog(v7, @"%@");
      }
    }

    -[GetPlayInfoOperation _failWithError:]( self,  "_failWithError:",  SSError(NSOSStatusErrorDomain, (int)objc_msgSend(v6, "intValue", v16), 0, 0));
  }

  else
  {
    id v14 = [a3 objectForKey:@"play-info"];
    uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSData);
    if ((objc_opt_isKindOfClass(v14, v15) & 1) == 0) {
      id v14 = 0LL;
    }
    uint64_t v17 = -[SSPlayInfoResponse initWithPlayInfoData:error:]( objc_alloc(&OBJC_CLASS___SSPlayInfoResponse),  "initWithPlayInfoData:error:",  v14,  0LL);
    -[GetPlayInfoOperation _setPlayInfoResponse:](self, "_setPlayInfoResponse:");
    -[GetPlayInfoOperation setSuccess:](self, "setSuccess:", 1LL);
  }

@end