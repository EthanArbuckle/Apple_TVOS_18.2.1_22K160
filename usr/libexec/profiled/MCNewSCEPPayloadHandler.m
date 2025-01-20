@interface MCNewSCEPPayloadHandler
+ (id)atsOverrideDataWithInsecureHTTPForHost:(id)a3 fromATSOverrideData:(id)a4;
+ (id)mutableATSExceptionInExceptionDomains:(id)a3 matchingHost:(id)a4;
+ (void)allowInsecureHTTPLoadsOfURL:(id)a3 forConfiguration:(id)a4;
- (BOOL)_createKeyPairLength:(unint64_t)a3 outPublicKey:(__SecKey *)a4 outPrivateKey:(__SecKey *)a5;
- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6;
- (__SecIdentity)copyIdentityImmediatelyWithInteractionClient:(id)a3 outError:(id *)a4;
- (id)_SCEPOperationURLWithBaseURLString:(id)a3 operation:(id)a4 message:(id)a5;
- (id)_invalidRAResponse;
- (id)_performPKIOperation:(id)a3 withPayload:(id)a4 usingPost:(BOOL)a5 error:(id *)a6;
- (id)_synchronousTransactionWithURL:(id)a3 method:(id)a4 content:(id)a5 contentType:(id)a6 outResponseCode:(int64_t *)a7 outContentType:(id *)a8 outError:(id *)a9;
- (id)userInputFields;
- (void)dealloc;
@end

@implementation MCNewSCEPPayloadHandler

- (void)dealloc
{
  identity = self->_identity;
  if (identity) {
    CFRelease(identity);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MCNewSCEPPayloadHandler;
  -[MCNewSCEPPayloadHandler dealloc](&v4, "dealloc");
}

- (id)userInputFields
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 challenge]);

  if (v3)
  {
    objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
  }

  else
  {
    objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    uint64_t v6 = MCLocalizedString(@"SCEP_CHALLENGE_TITLE", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v2 friendlyName]);
    uint64_t v9 = MCLocalizedFormat(@"SCEP_CHALLENGE_P_NAME");
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[MCNewPayloadHandler promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:]( &OBJC_CLASS___MCNewPayloadHandler,  "promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue :minimumLength:fieldType:flags:",  @"challenge",  v7,  v10,  0LL,  0LL,  0LL,  0LL,  0LL,  3LL));
    [v4 addObject:v11];
  }

  return v4;
}

- (id)_SCEPOperationURLWithBaseURLString:(id)a3 operation:(id)a4 message:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = -[NSURLComponents initWithString:](objc_alloc(&OBJC_CLASS___NSURLComponents), "initWithString:", v9);

  v11 = -[NSURLQueryItem initWithName:value:]( objc_alloc(&OBJC_CLASS___NSURLQueryItem),  "initWithName:value:",  @"operation",  v8);
  v17 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v17, 1LL));
  id v13 = [v12 mutableCopy];

  if (v7)
  {
    v14 = -[NSURLQueryItem initWithName:value:]( objc_alloc(&OBJC_CLASS___NSURLQueryItem),  "initWithName:value:",  @"message",  v7);
    [v13 addObject:v14];
  }

  -[NSURLComponents setQueryItems:](v10, "setQueryItems:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLComponents URL](v10, "URL"));

  return v15;
}

+ (id)mutableATSExceptionInExceptionDomains:(id)a3 matchingHost:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  for (id i = v6; ; id i = (id)v16)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:i]);
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary);
    if ((objc_opt_isKindOfClass(v8, v9) & 1) == 0) {
      goto LABEL_7;
    }
    id v10 = v8;
    v11 = v10;
    if (i == v6)
    {
      id i = v6;
      goto LABEL_12;
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"NSIncludesSubdomains"]);
    uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSNumber);

LABEL_7:
    v14 = (char *)[i rangeOfString:@"."];
    if (!v15)
    {
      v11 = 0LL;
      goto LABEL_12;
    }

    uint64_t v16 = objc_claimAutoreleasedReturnValue([i substringFromIndex:v14 + 1]);
  }

LABEL_12:
  return v11;
}

+ (id)atsOverrideDataWithInsecureHTTPForHost:(id)a3 fromATSOverrideData:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  a4,  1LL,  0LL,  0LL));
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0) {
    id v9 = v7;
  }
  else {
    id v9 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  1LL));
  }
  id v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"NSExceptionDomains"]);
  uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary);
  if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
  {
    id v13 = v11;
  }

  else
  {
    id v13 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  1LL));
    [v10 setObject:v13 forKeyedSubscript:@"NSExceptionDomains"];
  }

  id v14 = [(id)objc_opt_class(a1) mutableATSExceptionInExceptionDomains:v13 matchingHost:v6];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  if (!v15)
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  1LL));
    [v13 setObject:v15 forKeyedSubscript:v6];
  }

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
  [v15 setObject:v16 forKeyedSubscript:@"NSExceptionAllowsInsecureHTTPLoads"];

  v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v10,  200LL,  0LL,  0LL));
  return v17;
}

+ (void)allowInsecureHTTPLoadsOfURL:(id)a3 forConfiguration:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (void *)objc_opt_class(a1);
  id v12 = (id)objc_claimAutoreleasedReturnValue([v7 host]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v12 lowercaseString]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 _atsContext]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v8 atsOverrideDataWithInsecureHTTPForHost:v9 fromATSOverrideData:v10]);
  objc_msgSend(v6, "set_atsContext:", v11);
}

- (id)_synchronousTransactionWithURL:(id)a3 method:(id)a4 content:(id)a5 contentType:(id)a6 outResponseCode:(int64_t *)a7 outContentType:(id *)a8 outError:(id *)a9
{
  id v15 = a3;
  id v42 = a4;
  id v43 = a5;
  id v44 = a6;
  v45 = v15;
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableURLRequest requestWithURL:](&OBJC_CLASS___NSMutableURLRequest, "requestWithURL:", v15));
  [v16 setHTTPMethod:v42];
  if (v43) {
    objc_msgSend(v16, "setHTTPBody:");
  }
  if (v44) {
    [v16 setValue:v44 forHTTPHeaderField:@"Content-Type"];
  }
  v17 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v45;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "Performing synchronous URL request: %{public}@",  (uint8_t *)&buf,  0xCu);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v54 = 0x3032000000LL;
  v55 = sub_10005AC1C;
  v56 = sub_10005AC2C;
  id v57 = 0LL;
  dispatch_semaphore_t v18 = dispatch_semaphore_create(0LL);
  uint64_t v19 = objc_claimAutoreleasedReturnValue( +[NSURLSessionConfiguration ephemeralSessionConfiguration]( &OBJC_CLASS___NSURLSessionConfiguration,  "ephemeralSessionConfiguration"));
  [(id)objc_opt_class(self) allowInsecureHTTPLoadsOfURL:v45 forConfiguration:v19];
  v40 = (void *)v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSession sessionWithConfiguration:]( &OBJC_CLASS___NSURLSession,  "sessionWithConfiguration:",  v19));
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472LL;
  v46[2] = sub_10005AC34;
  v46[3] = &unk_1000C3BE0;
  p___int128 buf = &buf;
  v21 = v18;
  v47 = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue([v20 dataTaskWithRequest:v16 completionHandler:v46]);
  [v22 resume];
  dispatch_semaphore_wait(v21, 0xFFFFFFFFFFFFFFFFLL);
  v41 = (void *)objc_claimAutoreleasedReturnValue([v22 response]);
  v23 = (void *)objc_claimAutoreleasedReturnValue([v22 error]);
  v39 = v20;
  v24 = _MCLogObjects[0];
  if (v23)
  {
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v49 = 138543618;
      id v50 = v45;
      __int16 v51 = 2114;
      v52 = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "URL request to %{public}@ failed. Error: %{public}@",  v49,  0x16u);
    }

    if (a9)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue([v23 domain]);
      id v26 = [v23 code];
      v27 = (void *)objc_claimAutoreleasedReturnValue([v23 localizedDescription]);
      uint64_t v28 = MCErrorArrayFromLocalizedDescription(v27);
      v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
      uint64_t v30 = MCErrorTypeFatal;
      v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v25,  v26,  v29,  MCErrorTypeFatal));

      uint64_t v32 = MCErrorArray(@"SCEP_ERROR_NETWORK");
      v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
      *a9 = (id)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:",  MCSCEPErrorDomain,  22005LL,  v33,  v31,  v30,  0LL));
    }

    v34 = _MCLogObjects[0];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      id v35 = [v41 statusCode];
      *(_DWORD *)v49 = 134217984;
      id v50 = v35;
      _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEBUG,  "URL request failed. Status code: %ld",  v49,  0xCu);
    }

    id v36 = 0LL;
  }

  else
  {
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v49 = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "URL request succeeded.", v49, 2u);
    }

    if (a7) {
      *a7 = (int64_t)[v41 statusCode];
    }
    if (a8)
    {
      v37 = (void *)objc_claimAutoreleasedReturnValue([v41 allHeaderFields]);
      *a8 = (id)objc_claimAutoreleasedReturnValue([v37 objectForKey:@"Content-Type"]);
    }

    id v36 = *(id *)(*((void *)&buf + 1) + 40LL);
  }

  _Block_object_dispose(&buf, 8);
  return v36;
}

- (id)_invalidRAResponse
{
  uint64_t v2 = MCSCEPErrorDomain;
  uint64_t v3 = MCErrorArray(@"SCEP_ERROR_INVALID_RA_RESPONSE");
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v2,  22003LL,  v4,  MCErrorTypeFatal,  0LL));

  return v5;
}

- (BOOL)_createKeyPairLength:(unint64_t)a3 outPublicKey:(__SecKey *)a4 outPrivateKey:(__SecKey *)a5
{
  v11[0] = kSecAttrKeyTypeRSA;
  v10[0] = kSecAttrKeyType;
  v10[1] = kSecAttrKeySizeInBits;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  v11[1] = v7;
  uint64_t v8 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v11,  v10,  2LL));

  LOBYTE(a5) = SecKeyGeneratePair(v8, a4, a5) == 0;
  return (char)a5;
}

- (id)_performPKIOperation:(id)a3 withPayload:(id)a4 usingPost:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = @"GET";
  if (v7) {
    id v12 = @"POST";
  }
  id v13 = v12;
  if (v7) {
    id v14 = 0LL;
  }
  else {
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v11 base64EncodedStringWithOptions:0]);
  }
  id v15 = (void *)objc_claimAutoreleasedReturnValue( -[MCNewSCEPPayloadHandler _SCEPOperationURLWithBaseURLString:operation:message:]( self,  "_SCEPOperationURLWithBaseURLString:operation:message:",  v10,  @"PKIOperation",  v14));
  uint64_t v16 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)__int128 buf = 138543362;
    v21 = v13;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Sending CSR via %{public}@.", buf, 0xCu);
  }

  if (v7) {
    id v17 = v11;
  }
  else {
    id v17 = 0LL;
  }
  dispatch_semaphore_t v18 = (void *)objc_claimAutoreleasedReturnValue( -[MCNewSCEPPayloadHandler _synchronousTransactionWithURL:method:content:contentType:outResponseCode:outContentType:outError:]( self,  "_synchronousTransactionWithURL:method:content:contentType:outResponseCode:outContentType:outError:",  v15,  v13,  v17,  @"application/x-pki-message",  0LL,  0LL,  a6));

  return v18;
}

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  id v28 = 0LL;
  id v10 = -[MCNewSCEPPayloadHandler copyIdentityImmediatelyWithInteractionClient:outError:]( self,  "copyIdentityImmediatelyWithInteractionClient:outError:",  v8,  &v28);
  id v11 = v28;
  if (!v11)
  {
    v27 = a6;
    id v12 = -[MCNewCertificatePayloadHandler accessibility](self, "accessibility");
    id v13 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)__int128 buf = 138412290;
      uint64_t v30 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "Storing SCEP identity, storing with accessibility %@",  buf,  0xCu);
    }

    id v14 = (void *)objc_claimAutoreleasedReturnValue([v9 UUID]);
    uint64_t v15 = kMCAppleIdentitiesKeychainGroup;
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 profile]);
    dispatch_semaphore_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[MCKeychain saveItem:withLabel:group:useSystemKeychain:accessibility:]( MCKeychain,  "saveItem:withLabel:group:useSystemKeychain:accessibility:",  v10,  v14,  v15,  [v17 isInstalledForSystem],  v12));

    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v9 UUID]);
    -[MCNewPayloadHandler _touchDependencyBetweenPersistentID:andUUID:]( self,  "_touchDependencyBetweenPersistentID:andUUID:",  v18,  v19);

    CFRelease(v10);
    if (v18)
    {
      if (v8)
      {
        id v11 = 0LL;
        if (([v8 didUpdateStatus:0] & 1) == 0)
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
          id v11 = (id)objc_claimAutoreleasedReturnValue([v20 userCancelledError]);
        }
      }

      else
      {
        id v11 = 0LL;
      }

      [v9 setCertificatePersistentID:v18];
      v24 = (void *)objc_claimAutoreleasedReturnValue([v9 UUID]);
      -[MCNewPayloadHandler _retainDependencyBetweenPersistentID:andUUID:]( self,  "_retainDependencyBetweenPersistentID:andUUID:",  v18,  v24);

      v25 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEBUG,  "Successfully installed certificate.",  buf,  2u);
      }
    }

    else
    {
      uint64_t v21 = MCCertificateErrorDomain;
      uint64_t v22 = MCErrorArray(@"ERROR_CERTIFICATE_CANNOT_STORE");
      v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
      id v11 = (id)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v21,  9002LL,  v23,  MCErrorTypeFatal,  0LL));
    }

    a6 = v27;
  }

  if (a6 && v11) {
    *a6 = [v11 MCCopyAsPrimaryError];
  }

  return v11 == 0LL;
}

- (__SecIdentity)copyIdentityImmediatelyWithInteractionClient:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  identity = self->_identity;
  if (identity)
  {
    CFRetain(identity);
    id v8 = self->_identity;
    goto LABEL_34;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler userInputResponses](self, "userInputResponses"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 challenge]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[MCNewPayloadHandler prioritizeUserInput:key:overField:]( &OBJC_CLASS___MCNewPayloadHandler,  "prioritizeUserInput:key:overField:",  v10,  @"challenge",  v11));

  CFTypeRef v188 = 0LL;
  CFTypeRef v189 = 0LL;
  if (v6)
  {
    uint64_t v14 = MCLocalizedString(@"PROGRESS_GENERATING_KEY", v13);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    unsigned __int8 v16 = [v6 didUpdateStatus:v15];

    if ((v16 & 1) == 0) {
      goto LABEL_14;
    }
  }

  if (!-[MCNewSCEPPayloadHandler _createKeyPairLength:outPublicKey:outPrivateKey:]( self,  "_createKeyPairLength:outPublicKey:outPrivateKey:",  [v9 keySize],  &v189,  &v188))
  {
    uint64_t v32 = MCSCEPErrorDomain;
    uint64_t v33 = MCErrorArray(@"SCEP_ERROR_CANNOT_GENERATE_KEY_PAIR");
    v34 = a4;
    id v35 = (void *)objc_claimAutoreleasedReturnValue(v33);
    id v27 = (id)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v32,  22001LL,  v35,  MCErrorTypeFatal,  0LL));

    a4 = v34;
    goto LABEL_16;
  }

  if (v6)
  {
    uint64_t v18 = MCLocalizedString(@"PROGRESS_ENROLLING_CERTIFICATE", v17);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    unsigned __int8 v20 = [v6 didUpdateStatus:v19];

    if ((v20 & 1) == 0)
    {
LABEL_14:
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
      id v27 = (id)objc_claimAutoreleasedReturnValue([v31 userCancelledError]);

LABEL_16:
      uint64_t v30 = 0LL;
      id v28 = 0LL;
      goto LABEL_17;
    }
  }

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v9 URLString]);
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v9 CAInstanceName]);
  uint64_t v23 = objc_claimAutoreleasedReturnValue( -[MCNewSCEPPayloadHandler _SCEPOperationURLWithBaseURLString:operation:message:]( self,  "_SCEPOperationURLWithBaseURLString:operation:message:",  v21,  @"GetCACert",  v22));

  id v186 = 0LL;
  id v187 = 0LL;
  v180 = (void *)v23;
  v24 = (const __CFData *)objc_claimAutoreleasedReturnValue( -[MCNewSCEPPayloadHandler _synchronousTransactionWithURL:method:content:contentType:outResponseCode:outContentType:outError:]( self,  "_synchronousTransactionWithURL:method:content:contentType:outResponseCode:outContentType:outError:",  v23,  @"GET",  0LL,  0LL,  0LL,  &v187,  &v186));
  id v25 = v187;
  id v26 = v186;
  v179 = v25;
  if (v26)
  {
    id v27 = v26;
LABEL_10:
    id v28 = 0LL;
    SecCertificateRef v29 = 0LL;
    v181 = 0LL;
    goto LABEL_11;
  }

  CFDataRef data = v24;
  if (![v25 isEqualToString:@"application/x-x509-ca-cert"])
  {
    if (![v25 isEqualToString:@"application/x-x509-ca-ra-cert"])
    {
      SecCertificateRef v29 = 0LL;
      id v43 = 0LL;
      goto LABEL_45;
    }

    SecCertificateRef v29 = (SecCertificateRef)SecCMSCertificatesOnlyMessageCopyCertificates(v24);
    if (!v29)
    {
      id v27 = (id)objc_claimAutoreleasedReturnValue(-[MCNewSCEPPayloadHandler _invalidRAResponse](self, "_invalidRAResponse"));
      id v28 = 0LL;
      goto LABEL_59;
    }

    *(void *)__int128 buf = 0LL;
    id v185 = 0LL;
    if (SecSCEPValidateCACertMessage(v29, [v9 CAFingerprint], 0, buf, &v185))
    {
      id v27 = (id)objc_claimAutoreleasedReturnValue(-[MCNewSCEPPayloadHandler _invalidRAResponse](self, "_invalidRAResponse"));
      CFRelease(v29);
      id v28 = 0LL;
      SecCertificateRef v29 = 0LL;
LABEL_59:
      v181 = 0LL;
      goto LABEL_11;
    }

    if (*(void *)buf && v185)
    {
      v85 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v184 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v85,  OS_LOG_TYPE_DEBUG,  "GetCACert returned separate signing and encryption certificates for RA.",  v184,  2u);
      }

      v191[0] = v185;
      v191[1] = *(void *)buf;
      uint64_t v86 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v191, 2LL));
    }

    else
    {
      if (!*(void *)buf)
      {
        v134 = 0LL;
        id v43 = 0LL;
        goto LABEL_120;
      }

      v133 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v184 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v133,  OS_LOG_TYPE_DEBUG,  "GetCACert returned an RA certificate.",  v184,  2u);
      }

      uint64_t v86 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", *(void *)buf));
    }

    id v43 = (void *)v86;
    v134 = *(__SecCertificate **)buf;
    CFRetain(*(CFTypeRef *)buf);
LABEL_120:
    CFRelease(v29);
    SecCertificateRef v29 = v134;
    goto LABEL_45;
  }

  v41 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEBUG, "GetCACert returned a CA certificate.", buf, 2u);
  }

  SecCertificateRef v42 = SecCertificateCreateWithData(kCFAllocatorDefault, v24);
  if (!v42)
  {
    uint64_t v69 = MCSCEPErrorDomain;
    uint64_t v70 = MCErrorArray(@"SCEP_ERROR_INVALID_CA_RESPONSE");
    v174 = a4;
    v71 = (void *)objc_claimAutoreleasedReturnValue(v70);
    id v27 = (id)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v69,  22002LL,  v71,  MCErrorTypeFatal,  0LL));

    a4 = v174;
    goto LABEL_10;
  }

  SecCertificateRef v29 = v42;
  id v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", v42));
LABEL_45:
  id v44 = [v43 count];
  v177 = v12;
  v181 = v43;
  if (!v29 || !v44)
  {
    uint64_t v66 = MCSCEPErrorDomain;
    uint64_t v67 = MCErrorArray(@"SCEP_ERROR_UNSUPPORTED_SERVER_CONFIGURATION");
    v68 = (void *)objc_claimAutoreleasedReturnValue(v67);
    v24 = data;
    id v27 = (id)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v66,  22004LL,  v68,  MCErrorTypeFatal,  0LL));

    id v12 = v177;
    id v28 = 0LL;
    goto LABEL_11;
  }

  v172 = v29;
  v173 = a4;
  uint64_t v45 = kSecAttrAccessibleAlwaysThisDeviceOnlyPrivate;
  v46 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)__int128 buf = 138412290;
    *(void *)&uint8_t buf[4] = v45;
    _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_DEBUG,  "Temporarily storing SCEP server certificate, storing with accessibility %@",  buf,  0xCu);
  }

  v47 = (void *)objc_claimAutoreleasedReturnValue([v9 UUID]);
  v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-signing", v47));
  uint64_t v49 = kMCAppleCertificatesKeychainGroup;
  id v50 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  uint64_t v51 = v45;
  v52 = (void *)objc_claimAutoreleasedReturnValue([v50 profile]);
  uint64_t v175 = v49;
  id v28 = (void *)objc_claimAutoreleasedReturnValue( +[MCKeychain saveItem:withLabel:group:useSystemKeychain:accessibility:]( MCKeychain,  "saveItem:withLabel:group:useSystemKeychain:accessibility:",  v172,  v48,  v49,  [v52 isInstalledForSystem],  v51));

  v166 = v28;
  if (!v28)
  {
    uint64_t v72 = MCSCEPErrorDomain;
    uint64_t v73 = MCErrorArray(@"SCEP_ERROR_CANNOT_STORE_CA_CERT");
    uint64_t v74 = objc_claimAutoreleasedReturnValue(v73);
    uint64_t v75 = v72;
    v76 = (void *)v74;
    id v27 = (id)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v75,  22012LL,  v74,  MCErrorTypeFatal,  0LL));
    id v12 = v177;
    v24 = data;
    a4 = v173;
    goto LABEL_147;
  }

  v53 = (void *)objc_claimAutoreleasedReturnValue([v9 UUID]);
  -[MCNewPayloadHandler _touchDependencyBetweenPersistentID:andUUID:]( self,  "_touchDependencyBetweenPersistentID:andUUID:",  v28,  v53);

  uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue([v9 CACaps]);
  if (v54) {
    goto LABEL_51;
  }
  v80 = (void *)objc_claimAutoreleasedReturnValue([v9 URLString]);
  v81 = (void *)objc_claimAutoreleasedReturnValue([v9 CAInstanceName]);
  uint64_t v82 = objc_claimAutoreleasedReturnValue( -[MCNewSCEPPayloadHandler _SCEPOperationURLWithBaseURLString:operation:message:]( self,  "_SCEPOperationURLWithBaseURLString:operation:message:",  v80,  @"GetCACaps",  v81));

  v76 = (void *)v82;
  id v183 = 0LL;
  v83 = (void *)objc_claimAutoreleasedReturnValue( -[MCNewSCEPPayloadHandler _synchronousTransactionWithURL:method:content:contentType:outResponseCode:outContentType:outError:]( self,  "_synchronousTransactionWithURL:method:content:contentType:outResponseCode:outContentType:outError:",  v82,  @"GET",  0LL,  0LL,  0LL,  0LL,  &v183));
  id v84 = v183;
  id v12 = v177;
  if (v84)
  {
    id v27 = v84;
    v165 = v83;
    id v28 = 0LL;
    a4 = v173;
    v24 = data;

    goto LABEL_147;
  }

  if ([v83 length])
  {
    v135 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v83, 4LL);
    v136 = v76;
    v137 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet characterSetWithCharactersInString:]( &OBJC_CLASS___NSCharacterSet,  "characterSetWithCharactersInString:",  @"\r\n"));
    v138 = v83;
    uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue( -[NSString componentsSeparatedByCharactersInSet:]( v135,  "componentsSeparatedByCharactersInSet:",  v137));

    if (v54)
    {
LABEL_51:
      unsigned int v167 = [v54 containsObject:@"POSTPKIOperation"];
      unsigned int v55 = [v54 containsObject:@"AES"];
      unsigned __int8 v56 = [v54 containsObject:@"DES3"];
      unsigned int v57 = [v54 containsObject:@"SHA-512"];
      unsigned int v58 = [v54 containsObject:@"SHA-256"];
      unsigned int v170 = [v54 containsObject:@"SHA-1"];
      v160 = v54;
      goto LABEL_52;
    }
  }

  else
  {
  }

  v154 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v154,  OS_LOG_TYPE_DEFAULT,  "Did not receive GetCACaps information from SCEP server. Assuming support for SHA-1 only.",  buf,  2u);
  }

  v160 = 0LL;
  unsigned int v58 = 0;
  unsigned int v57 = 0;
  unsigned __int8 v56 = 0;
  unsigned int v55 = 0;
  unsigned int v167 = 0;
  unsigned int v170 = 1;
LABEL_52:
  v59 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  5LL));
  v60 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v9 usageFlags]));
  [v59 setObject:v60 forKeyedSubscript:kSecCertificateKeyUsage];

  [v59 setObject:v177 forKeyedSubscript:kSecCSRChallengePassword];
  v61 = (void *)objc_claimAutoreleasedReturnValue([v9 subjectAltName]);
  [v59 setObject:v61 forKeyedSubscript:kSecSubjectAltName];

  v164 = v59;
  if (v55)
  {
    [v59 setObject:kSecCMSEncryptionAlgorithmAESCBC forKeyedSubscript:kSecCMSBulkEncryptionAlgorithm];
    os_log_t v62 = _MCLogObjects[0];
    if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO)) {
      goto LABEL_64;
    }
    *(_WORD *)__int128 buf = 0;
    v63 = "SCEP: AES is supported.";
    v64 = v62;
    os_log_type_t v65 = OS_LOG_TYPE_INFO;
    goto LABEL_63;
  }

  if ((v56 & 1) == 0)
  {
    os_log_t v77 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__int128 buf = 0;
      v63 = "Insufficient required capability from Certificate Authority. AES, 3DES not supported. Falling back to 3DES anyway.";
      v64 = v77;
      os_log_type_t v65 = OS_LOG_TYPE_ERROR;
LABEL_63:
      _os_log_impl((void *)&_mh_execute_header, v64, v65, v63, buf, 2u);
    }
  }

@end