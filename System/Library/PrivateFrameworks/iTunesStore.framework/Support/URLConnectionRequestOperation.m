@interface URLConnectionRequestOperation
- (BOOL)_shouldSendMachineDataHeadersForProperties:(id)a3;
- (BOOL)sendsResponseForHTTPFailures;
- (BOOL)shouldMescalSign;
- (NSURL)destinationFileURL;
- (SSAuthenticationContext)authenticationContext;
- (SSURLConnectionResponse)URLResponse;
- (SSURLRequestProperties)requestProperties;
- (URLConnectionRequestOperation)initWithRequestProperties:(id)a3;
- (id)_accountIdentifier;
- (id)_metricsPageEventWithResponse:(id)a3 performance:(id)a4;
- (id)_newStoreURLOperationWithProperties:(id)a3;
- (void)_addKBSyncDataToRequestProperties:(id)a3 forAccountID:(id)a4;
- (void)_importKeybagFromDictionary:(id)a3;
- (void)dealloc;
- (void)operation:(id)a3 didAuthenticateWithDSID:(id)a4;
- (void)run;
- (void)setAuthenticationContext:(id)a3;
- (void)setDestinationFileURL:(id)a3;
- (void)setSendsResponseForHTTPFailures:(BOOL)a3;
- (void)setShouldMescalSign:(BOOL)a3;
@end

@implementation URLConnectionRequestOperation

- (URLConnectionRequestOperation)initWithRequestProperties:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___URLConnectionRequestOperation;
  v4 = -[URLConnectionRequestOperation init](&v6, "init");
  if (v4) {
    v4->_properties = (SSURLRequestProperties *)[a3 copy];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___URLConnectionRequestOperation;
  -[URLConnectionRequestOperation dealloc](&v3, "dealloc");
}

- (SSAuthenticationContext)authenticationContext
{
  objc_super v3 = self->_authenticationContext;
  -[URLConnectionRequestOperation unlock](self, "unlock");
  return v3;
}

- (NSURL)destinationFileURL
{
  objc_super v3 = (NSURL *)-[NSURL copy](self->_destinationFileURL, "copy");
  -[URLConnectionRequestOperation unlock](self, "unlock");
  return v3;
}

- (SSURLRequestProperties)requestProperties
{
  return self->_properties;
}

- (BOOL)sendsResponseForHTTPFailures
{
  BOOL sendsResponseForHTTPFailures = self->_sendsResponseForHTTPFailures;
  -[URLConnectionRequestOperation unlock](self, "unlock");
  return sendsResponseForHTTPFailures;
}

- (void)setAuthenticationContext:(id)a3
{
  authenticationContext = self->_authenticationContext;
  if (authenticationContext != a3)
  {

    self->_authenticationContext = (SSAuthenticationContext *)[a3 copy];
  }

  -[URLConnectionRequestOperation unlock](self, "unlock");
}

- (void)setDestinationFileURL:(id)a3
{
  destinationFileURL = self->_destinationFileURL;
  if (destinationFileURL != a3)
  {

    self->_destinationFileURL = (NSURL *)[a3 copy];
  }

  -[URLConnectionRequestOperation unlock](self, "unlock");
}

- (void)setSendsResponseForHTTPFailures:(BOOL)a3
{
  self->_BOOL sendsResponseForHTTPFailures = a3;
  -[URLConnectionRequestOperation unlock](self, "unlock");
}

- (void)setShouldMescalSign:(BOOL)a3
{
  self->_shouldMescalSign = a3;
  -[URLConnectionRequestOperation unlock](self, "unlock");
}

- (BOOL)shouldMescalSign
{
  BOOL shouldMescalSign = self->_shouldMescalSign;
  -[URLConnectionRequestOperation unlock](self, "unlock");
  return shouldMescalSign;
}

- (SSURLConnectionResponse)URLResponse
{
  objc_super v3 = self->_response;
  -[URLConnectionRequestOperation unlock](self, "unlock");
  return v3;
}

- (void)run
{
  uint64_t v23 = 0LL;
  objc_super v3 = -[URLConnectionRequestOperation destinationFileURL](self, "destinationFileURL");
  v4 = v3;
  if (!v3)
  {
    v7 = self->_properties;
    goto LABEL_6;
  }

  unsigned int v5 = -[NSURL isFileURL](v3, "isFileURL");
  objc_super v6 = self->_properties;
  v7 = v6;
  if (!v5)
  {
LABEL_6:
    int v8 = 0;
    goto LABEL_7;
  }

  if ((-[SSURLRequestProperties shouldDecodeResponse](v6, "shouldDecodeResponse") & 1) != 0)
  {
    int v8 = 1;
  }

  else
  {
    id v21 = -[SSURLRequestProperties mutableCopy](v7, "mutableCopy");
    int v8 = 1;
    [v21 setShouldDecodeResponse:1];

    v7 = (SSURLRequestProperties *)v21;
  }

- (void)operation:(id)a3 didAuthenticateWithDSID:(id)a4
{
}

- (id)_accountIdentifier
{
  id result = -[SSAuthenticationContext requiredUniqueIdentifier]( -[URLConnectionRequestOperation authenticationContext](self, "authenticationContext"),  "requiredUniqueIdentifier");
  if (!result) {
    return objc_msgSend( objc_msgSend(+[SSAccountStore defaultStore](SSAccountStore, "defaultStore"), "activeAccount"),  "uniqueIdentifier");
  }
  return result;
}

- (void)_addKBSyncDataToRequestProperties:(id)a3 forAccountID:(id)a4
{
  id v7 = [a3 KBSyncType];
  if (a4 && v7)
  {
    if (v7 == (id)2) {
      uint64_t v8 = 1LL;
    }
    else {
      uint64_t v8 = 9LL;
    }
    CFDataRef v9 = sub_100022204((uint64_t)[a4 unsignedLongLongValue], v8);
    if (-[__CFData length](v9, "length"))
    {
      uint64_t v10 = ISCopyEncodedBase64(-[__CFData bytes](v9, "bytes"), -[__CFData length](v9, "length"));
      if (v10)
      {
        v11 = (void *)v10;
        id v12 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
        if (!v12) {
          id v12 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
        }
        unsigned int v13 = [v12 shouldLog];
        else {
          LODWORD(v14) = v13;
        }
        id v15 = (os_log_s *)[v12 OSLogObject];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO)) {
          uint64_t v14 = v14;
        }
        else {
          v14 &= 2u;
        }
        if ((_DWORD)v14)
        {
          int v21 = 138413058;
          uint64_t v22 = objc_opt_class(self);
          __int16 v23 = 2112;
          id v24 = a4;
          __int16 v25 = 2048;
          uint64_t v26 = v8;
          __int16 v27 = 2048;
          id v28 = [v11 length];
          uint64_t v17 = _os_log_send_and_compose_impl( v14,  0LL,  0LL,  0LL,  &_mh_execute_header,  v15,  1LL,  "%@: Set kbsync data for account: %@, transaction type: %lu, with length: %lu",  &v21,  42);
          if (v17)
          {
            uint64_t v18 = (void *)v17;
            id v19 = +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v17,  4LL);
            free(v18);
            uint64_t v20 = v19;
            *(void *)&double v16 = SSFileLog(v12, @"%@").n128_u64[0];
          }
        }

        objc_msgSend(a3, "setValue:forRequestParameter:", v11, @"kbsync", v16, v20);
      }
    }
  }

- (void)_importKeybagFromDictionary:(id)a3
{
  id v3 = [a3 objectForKey:@"keybag"];
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSData);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    if ([v3 length]) {
      sub_100023280(v3);
    }
  }

- (id)_metricsPageEventWithResponse:(id)a3 performance:(id)a4
{
  id v6 = objc_alloc_init(&OBJC_CLASS___SSMetricsPageEvent);
  objc_msgSend(v6, "setPageURL:", objc_msgSend(objc_msgSend(a3, "URL"), "absoluteString"));
  [a4 startTime];
  double v8 = v7;
  -[NSDate timeIntervalSince1970]( +[NSDate dateWithTimeIntervalSinceReferenceDate:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceReferenceDate:"),  "timeIntervalSince1970");
  objc_msgSend(v6, "setRequestStartTime:");
  [a4 receivedResponseInterval];
  -[NSDate timeIntervalSince1970]( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  v8 + v9),  "timeIntervalSince1970");
  objc_msgSend(v6, "setResponseStartTime:");
  [a4 finishInterval];
  -[NSDate timeIntervalSince1970]( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  v8 + v10),  "timeIntervalSince1970");
  objc_msgSend(v6, "setResponseEndTime:");
  id v11 = [a3 allHeaderFields];
  objc_msgSend( v6,  "setServerApplicationInstance:",  ISDictionaryValueForCaseInsensitiveString(v11, @"X-Apple-Application-Instance"));
  objc_msgSend(v6, "setServerTiming:", ISDictionaryValueForCaseInsensitiveString(v11, @"Apple-Timing-App"));
  return v6;
}

- (id)_newStoreURLOperationWithProperties:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___ISStoreURLOperation);
  unsigned int v6 = [a3 shouldProcessProtocol];
  double v7 = (id *)&off_100348938;
  if (!v6) {
    double v7 = (id *)&OBJC_CLASS___ISDataProvider_ptr;
  }
  objc_msgSend(v5, "setDataProvider:", objc_msgSend(*v7, "provider"));
  objc_msgSend( v5,  "setAuthenticationContext:",  -[URLConnectionRequestOperation authenticationContext](self, "authenticationContext"));
  id v8 = [a3 mutableCopy];
  -[URLConnectionRequestOperation _addKBSyncDataToRequestProperties:forAccountID:]( self,  "_addKBSyncDataToRequestProperties:forAccountID:",  v8,  -[URLConnectionRequestOperation _accountIdentifier](self, "_accountIdentifier"));
  if (-[URLConnectionRequestOperation _shouldSendMachineDataHeadersForProperties:]( self,  "_shouldSendMachineDataHeadersForProperties:",  v8))
  {
    uint64_t v9 = 1LL;
LABEL_8:
    [v5 setMachineDataStyle:v9];
    goto LABEL_9;
  }

  uint64_t v9 = (uint64_t)[v8 machineDataStyle];
  if (v9) {
    goto LABEL_8;
  }
LABEL_9:
  [v5 setRequestProperties:v8];

  objc_msgSend(v5, "_setShouldSetCookies:", objc_msgSend(a3, "shouldSetCookies"));
  return v5;
}

- (BOOL)_shouldSendMachineDataHeadersForProperties:(id)a3
{
  id v4 = [a3 URLBagKey];
  if (!v4)
  {
    id v7 = objc_msgSend(objc_msgSend(a3, "URL"), "absoluteString");
    BOOL v6 = 1;
    if ([v7 rangeOfString:@"buyProduct" options:1] == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      BOOL v6 = 1;
      if ([v7 rangeOfString:@"redeemCodeSrv" options:1] == (id)0x7FFFFFFFFFFFFFFFLL) {
        return [v7 rangeOfString:@"giftBuySrv" options:1] != (id)0x7FFFFFFFFFFFFFFFLL;
      }
    }

    return v6;
  }

  id v5 = v4;
  if (([v4 isEqualToString:@"buyProduct"] & 1) != 0
    || ([v5 isEqualToString:@"redeemCodeSrv"] & 1) != 0)
  {
    return 1;
  }

  return [v5 isEqualToString:@"giftBuySrv"];
}

@end