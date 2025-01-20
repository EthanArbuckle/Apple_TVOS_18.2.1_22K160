@interface AKURLRequestProviderImpl
- (AKAccountManager)accountManager;
- (AKAppleIDAuthenticationContext)concreteAuthenticationContext;
- (AKAuthenticatedServerRequest)context;
- (AKClient)client;
- (AKURLRequestProviderImpl)initWithContext:(id)a3;
- (AKURLRequestProviderImpl)initWithContext:(id)a3 url:(id)a4;
- (AKURLRequestProviderImpl)initWithContext:(id)a3 urlBagKey:(id)a4;
- (AKURLRequestProviderImpl)initWithContext:(id)a3 urlBagKey:(id)a4 shouldCacheResource:(BOOL)a5;
- (AKURLRequestProviderImpl)initWithContext:(id)a3 urlBagKey:(id)a4 shouldCacheResource:(BOOL)a5 accountManager:(id)a6;
- (AKURLRequestProviderImpl)initWithUrlBagKey:(id)a3;
- (BOOL)_denyVirtualInterfaces;
- (BOOL)_validateDataExists:(id)a3;
- (BOOL)_validateErrorCode:(id)a3 withKey:(id)a4;
- (BOOL)_validateJSONResponseData:(id)a3 error:(id *)a4;
- (BOOL)_validateResponseBodyFormat;
- (BOOL)shouldCacheResource;
- (BOOL)signRequest:(id)a3 error:(id *)a4;
- (BOOL)validateResponseData:(id)a3 error:(id *)a4;
- (NSData)authKitBodyData;
- (NSDictionary)authKitBody;
- (NSDictionary)serverCompatibleRequestBody;
- (NSString)dataCenterIdentifier;
- (NSString)urlBagKey;
- (NSURL)requestURLOverride;
- (id)_errorFromResponseDictionary:(id)a3;
- (id)appendRequestUrl:(id)a3 queryParameterNamed:(id)a4 value:(id)a5;
- (id)responseDictionaryWithData:(id)a3 error:(id *)a4;
- (id)serverCompatibleRequestBodyWithPayload:(id)a3;
- (unint64_t)expectedResponseType;
- (unint64_t)requestBodyType;
- (void)buildRequestWithCompletion:(id)a3;
- (void)requestURLWithCompletion:(id)a3;
- (void)setAccountManager:(id)a3;
- (void)setAuthKitBody:(id)a3;
- (void)setAuthKitBodyData:(id)a3;
- (void)setClient:(id)a3;
- (void)setConcreteAuthenticationContext:(id)a3;
- (void)setContext:(id)a3;
- (void)setDataCenterIdentifier:(id)a3;
- (void)setShouldCacheResource:(BOOL)a3;
- (void)setUrlBagKey:(id)a3;
- (void)set_denyVirtualInterfaces:(BOOL)a3;
@end

@implementation AKURLRequestProviderImpl

- (AKURLRequestProviderImpl)initWithUrlBagKey:(id)a3
{
  id v5 = a3;
  v6 = -[AKURLRequestProviderImpl init](self, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_urlBagKey, a3);
  }

  return v7;
}

- (AKURLRequestProviderImpl)initWithContext:(id)a3
{
  id v5 = a3;
  v6 = -[AKURLRequestProviderImpl init](self, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_context, a3);
    uint64_t v11 = objc_opt_class(&OBJC_CLASS___AKAppleIDAuthenticationContext, v8, v9, v10);
    if ((objc_opt_isKindOfClass(v5, v11) & 1) != 0) {
      v12 = (AKAppleIDAuthenticationContext *)v5;
    }
    else {
      v12 = -[AKAppleIDAuthenticationContext initWithAuthenticatedServerRequestContext:]( objc_alloc(&OBJC_CLASS___AKAppleIDAuthenticationContext),  "initWithAuthenticatedServerRequestContext:",  v5);
    }
    concreteAuthenticationContext = v7->_concreteAuthenticationContext;
    v7->_concreteAuthenticationContext = v12;
  }

  return v7;
}

- (AKURLRequestProviderImpl)initWithContext:(id)a3 url:(id)a4
{
  id v7 = a4;
  uint64_t v8 = -[AKURLRequestProviderImpl initWithContext:](self, "initWithContext:", a3);
  uint64_t v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_requestURLOverride, a4);
  }

  return v9;
}

- (AKURLRequestProviderImpl)initWithContext:(id)a3 urlBagKey:(id)a4
{
  return -[AKURLRequestProviderImpl initWithContext:urlBagKey:shouldCacheResource:]( self,  "initWithContext:urlBagKey:shouldCacheResource:",  a3,  a4,  0LL);
}

- (AKURLRequestProviderImpl)initWithContext:(id)a3 urlBagKey:(id)a4 shouldCacheResource:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
  uint64_t v11 = -[AKURLRequestProviderImpl initWithContext:urlBagKey:shouldCacheResource:accountManager:]( self,  "initWithContext:urlBagKey:shouldCacheResource:accountManager:",  v9,  v8,  v5,  v10);

  return v11;
}

- (AKURLRequestProviderImpl)initWithContext:(id)a3 urlBagKey:(id)a4 shouldCacheResource:(BOOL)a5 accountManager:(id)a6
{
  id v11 = a4;
  id v12 = a6;
  v13 = -[AKURLRequestProviderImpl initWithContext:](self, "initWithContext:", a3);
  if (v13)
  {
    v14 = (NSString *)[v11 copy];
    urlBagKey = v13->_urlBagKey;
    v13->_urlBagKey = v14;

    v13->_shouldCacheResource = a5;
    objc_storeStrong((id *)&v13->_accountManager, a6);
    objc_storeStrong((id *)&v13->_urlBagKey, a4);
  }

  return v13;
}

- (void)requestURLWithCompletion:(id)a3
{
  id v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl requestURLOverride](self, "requestURLOverride"));

  if (!v4)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[AKAuthenticatedServerRequest altDSID](self->_context, "altDSID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[AKURLBag bagForAltDSID:](&OBJC_CLASS___AKURLBag, "bagForAltDSID:", v7));

    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl urlBagKey](self, "urlBagKey"));
    [v6 urlForKey:v8 completion:v9];

    goto LABEL_5;
  }

  BOOL v5 = v9;
  if (v9)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl requestURLOverride](self, "requestURLOverride"));
    (*((void (**)(id, void *, void))v9 + 2))(v9, v6, 0LL);
LABEL_5:

    BOOL v5 = v9;
  }
}

- (void)buildRequestWithCompletion:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10001630C;
  v4[3] = &unk_1001C6B10;
  BOOL v5 = self;
  id v6 = a3;
  id v3 = v6;
  -[AKURLRequestProviderImpl requestURLWithCompletion:](v5, "requestURLWithCompletion:", v4);
}

- (unint64_t)expectedResponseType
{
  return 0LL;
}

- (unint64_t)requestBodyType
{
  return 0LL;
}

- (id)responseDictionaryWithData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = -[AKURLRequestProviderImpl _validateDataExists:](self, "_validateDataExists:", v6);
  if (v7)
  {
    unint64_t v8 = -[AKURLRequestProviderImpl expectedResponseType](self, "expectedResponseType");
    switch(v8)
    {
      case 2uLL:
        uint64_t v13 = _AKLogSystem(2LL);
        v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
          sub_10012D584();
        }

        break;
      case 1uLL:
        id v9 = @"application/json";
        goto LABEL_14;
      case 0uLL:
        id v9 = @"application/x-plist";
LABEL_14:
        id v12 = (void *)objc_claimAutoreleasedReturnValue( +[AAFSerialization dictionaryFromObject:ofType:]( &OBJC_CLASS___AAFSerialization,  "dictionaryFromObject:ofType:",  v6,  v9));
LABEL_15:
        v15 = (void *)objc_claimAutoreleasedReturnValue( -[AKURLRequestProviderImpl _errorFromResponseDictionary:]( self,  "_errorFromResponseDictionary:",  v12));
        id v11 = v15;
        if (a4)
        {
          id v11 = v15;
          *a4 = v11;
        }

        goto LABEL_17;
    }

    id v12 = 0LL;
    goto LABEL_15;
  }

  uint64_t v10 = _AKLogSystem(v7);
  id v11 = (id)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412290;
    v18 = self;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v11,  OS_LOG_TYPE_DEFAULT,  "%@: Server returned no response, treating as success",  (uint8_t *)&v17,  0xCu);
  }

  id v12 = &__NSDictionary0__struct;
LABEL_17:

  return v12;
}

- (id)_errorFromResponseDictionary:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)AKErrorStatusCodeKey;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:AKErrorStatusCodeKey]);
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSNumber, v7, v8, v9);
  id v11 = v6;
  if ((objc_opt_isKindOfClass(v11, v10) & 1) != 0) {
    id v12 = v11;
  }
  else {
    id v12 = 0LL;
  }

  if (v11) {
    BOOL v14 = v12 == 0LL;
  }
  else {
    BOOL v14 = 0;
  }
  if (v14)
  {
    uint64_t v22 = _AKLogSystem(v13);
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      int v37 = 138412802;
      v38 = self;
      __int16 v39 = 2112;
      id v40 = v11;
      __int16 v41 = 2112;
      id v42 = v5;
      _os_log_error_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "%@: Unexpected error code value (%@) for key (%@)",  (uint8_t *)&v37,  0x20u);
    }

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7010LL));
  }

  else if ([v12 integerValue])
  {
    v15 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  3LL);
    uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSString, v16, v17, v18);
    id v20 = (id)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:AKErrorMessageKey]);
    if ((objc_opt_isKindOfClass(v20, v19) & 1) != 0) {
      id v21 = v20;
    }
    else {
      id v21 = 0LL;
    }

    uint64_t v26 = _AKLogSystem(v25);
    v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      int v37 = 138412802;
      v38 = self;
      __int16 v39 = 2112;
      id v40 = v12;
      __int16 v41 = 2112;
      id v42 = v21;
      _os_log_error_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "%@: Server request failed with code (%@) and message (%@)",  (uint8_t *)&v37,  0x20u);
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v12, v5);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v15,  "setObject:forKeyedSubscript:",  v21,  NSLocalizedDescriptionKey);
    uint64_t v31 = objc_opt_class(&OBJC_CLASS___NSNumber, v28, v29, v30);
    uint64_t v32 = AKSubErrorStatusCodeKey;
    id v33 = (id)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:AKSubErrorStatusCodeKey]);
    if ((objc_opt_isKindOfClass(v33, v31) & 1) != 0) {
      id v34 = v33;
    }
    else {
      id v34 = 0LL;
    }

    id v35 = -[NSMutableDictionary copy](v15, "copy");
    v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSError ak_errorWithCode:userInfo:]( &OBJC_CLASS___NSError,  "ak_errorWithCode:userInfo:",  -7010LL,  v35));
  }

  else
  {
    v24 = 0LL;
  }

  return v24;
}

- (BOOL)validateResponseData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = -[AKURLRequestProviderImpl _validateDataExists:](self, "_validateDataExists:", v6);
  if (v7)
  {
    BOOL v8 = -[AKURLRequestProviderImpl _validateResponseBodyFormat](self, "_validateResponseBodyFormat");
    if (v8)
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[AAFSerialization dictionaryFromObject:ofType:]( &OBJC_CLASS___AAFSerialization,  "dictionaryFromObject:ofType:",  v6,  @"application/x-plist"));
      uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSDictionary, v10, v11, v12);
      uint64_t isKindOfClass = objc_opt_isKindOfClass(v9, v13);
      if ((isKindOfClass & 1) == 0)
      {
        uint64_t v38 = _AKLogSystem(isKindOfClass);
        __int16 v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
          sub_10012D64C();
        }

        *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7010LL));
        int v40 = 1;
        goto LABEL_29;
      }

      uint64_t v15 = AKErrorStatusCodeKey;
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:AKErrorStatusCodeKey]);
      if (-[AKURLRequestProviderImpl _validateErrorCode:withKey:](self, "_validateErrorCode:withKey:", v16, v15))
      {
        if (![v16 integerValue])
        {
          int v40 = 0;
LABEL_28:

LABEL_29:
          unsigned __int8 v35 = v40 == 0;
          goto LABEL_30;
        }

        uint64_t v17 = objc_alloc(&OBJC_CLASS___NSMutableDictionary);
        uint64_t v45 = v15;
        v46 = v16;
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v46,  &v45,  1LL));
        uint64_t v19 = -[NSMutableDictionary initWithDictionary:](v17, "initWithDictionary:", v18);

        uint64_t v20 = objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:AKErrorMessageKey]);
        uint64_t v21 = _AKLogSystem(v20);
        uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          sub_10012D5E8();
        }

        uint64_t v26 = objc_opt_class(&OBJC_CLASS___NSString, v23, v24, v25);
        if ((objc_opt_isKindOfClass(v20, v26) & 1) != 0) {
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v19,  "setObject:forKeyedSubscript:",  v20,  NSLocalizedDescriptionKey);
        }
        uint64_t v27 = AKSubErrorStatusCodeKey;
        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:AKSubErrorStatusCodeKey]);
        uint64_t v43 = v20;
        if (v28)
        {
          unsigned int v29 = -[AKURLRequestProviderImpl _validateErrorCode:withKey:]( self,  "_validateErrorCode:withKey:",  v28,  v27,  v20);
          uint64_t v30 = AKAppleIDAuthenticationServerErrorDomain;
          if (v29)
          {
            uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  AKAppleIDAuthenticationServerErrorDomain,  [v28 integerValue],  0));
            uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
            [v32 setObject:v31 forKeyedSubscript:NSUnderlyingErrorKey];
            -[NSMutableDictionary setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v28, v27);
          }

          else
          {
            uint64_t v32 = 0LL;
          }
        }

        else
        {
          uint64_t v32 = 0LL;
          uint64_t v30 = AKAppleIDAuthenticationServerErrorDomain;
        }

        __int16 v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  v30,  objc_msgSend(v16, "integerValue", v43),  v32));
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v19,  "setObject:forKeyedSubscript:",  v41,  NSUnderlyingErrorKey);
        *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError ak_errorWithCode:userInfo:]( &OBJC_CLASS___NSError,  "ak_errorWithCode:userInfo:",  -7010LL,  v19));
      }

      else
      {
        *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7010LL));
      }

      int v40 = 1;
      goto LABEL_28;
    }

    uint64_t v36 = _AKLogSystem(v8);
    int v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
      sub_10012D684();
    }

    unsigned __int8 v35 = -[AKURLRequestProviderImpl _validateJSONResponseData:error:](self, "_validateJSONResponseData:error:", v6, a4);
  }

  else
  {
    uint64_t v33 = _AKLogSystem(v7);
    id v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
      sub_10012D6B0();
    }

    unsigned __int8 v35 = 1;
  }

- (BOOL)_validateJSONResponseData:(id)a3 error:(id *)a4
{
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue( +[AAFSerialization dictionaryFromObject:ofType:]( &OBJC_CLASS___AAFSerialization,  "dictionaryFromObject:ofType:",  a3,  @"application/json"));
  id v6 = v5;
  if (!v5) {
    goto LABEL_10;
  }
  uint64_t v7 = AKErrorStatusCodeKey;
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:AKErrorStatusCodeKey]);
  uint64_t v9 = v8;
  if (!v8 || (id v10 = [v8 integerValue]) == 0)
  {

LABEL_10:
    BOOL v16 = 1;
    goto LABEL_11;
  }

  uint64_t v11 = _AKLogSystem(v10);
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    sub_10012D6DC(v9, v12);
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  AKAppleIDAuthenticationServerErrorDomain,  [v9 integerValue],  0));
  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  [v14 setObject:v13 forKeyedSubscript:NSUnderlyingErrorKey];
  [v14 setObject:v9 forKeyedSubscript:v7];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:AKErrorMessageKey]);
  [v14 setObject:v15 forKeyedSubscript:NSLocalizedDescriptionKey];

  if (a4) {
    *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError ak_errorWithCode:userInfo:]( &OBJC_CLASS___NSError,  "ak_errorWithCode:userInfo:",  -7010LL,  v14));
  }

  BOOL v16 = 0;
LABEL_11:

  return v16;
}

- (BOOL)_validateDataExists:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    BOOL v5 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v4, 4LL);

    uint64_t v7 = _AKLogSystem(v6);
    BOOL v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_10012D760();
    }
  }

  return a3 != 0LL;
}

- (BOOL)_validateResponseBodyFormat
{
  unint64_t v3 = -[AKURLRequestProviderImpl expectedResponseType](self, "expectedResponseType");
  unint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = _AKLogSystem(v3);
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10012D7C4(self, v6);
    }
  }

  return v4 == 0;
}

- (BOOL)_validateErrorCode:(id)a3 withKey:(id)a4
{
  id v5 = a3;
  id v9 = a4;
  if (v5
    && (uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSNumber, v6, v7, v8),
        uint64_t isKindOfClass = objc_opt_isKindOfClass(v5, v10),
        (isKindOfClass & 1) == 0))
  {
    uint64_t v13 = _AKLogSystem(isKindOfClass);
    BOOL v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10012D838();
    }

    BOOL v12 = 0;
  }

  else
  {
    BOOL v12 = 1;
  }

  return v12;
}

- (NSDictionary)serverCompatibleRequestBody
{
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl authKitBody](self, "authKitBody"));
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( -[AKURLRequestProviderImpl serverCompatibleRequestBodyWithPayload:]( self,  "serverCompatibleRequestBodyWithPayload:",  v3));

  return (NSDictionary *)v4;
}

- (id)serverCompatibleRequestBodyWithPayload:(id)a3
{
  id v3 = a3;
  id v4 = [&__NSDictionary0__struct mutableCopy];
  [v4 setObject:&__NSDictionary0__struct forKeyedSubscript:AKRequestHeadersKey];
  id v5 = [&__NSDictionary0__struct mutableCopy];
  uint64_t v6 = v5;
  if (v3) {
    [v5 addEntriesFromDictionary:v3];
  }
  [v4 setObject:v6 forKeyedSubscript:AKRequestBodyKey];
  id v7 = [v4 copy];

  return v7;
}

- (BOOL)signRequest:(id)a3 error:(id *)a4
{
  if (a4) {
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7027LL));
  }
  return 0;
}

- (id)appendRequestUrl:(id)a3 queryParameterNamed:(id)a4 value:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = objc_alloc(&OBJC_CLASS___NSURLComponents);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v7 absoluteString]);
  BOOL v12 = -[NSURLComponents initWithString:](v10, "initWithString:", v11);

  if (v12)
  {
    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLComponents queryItems](v12, "queryItems"));
    uint64_t v15 = (NSMutableArray *)[v14 mutableCopy];

    if (!v15) {
      uint64_t v15 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    }
    BOOL v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLQueryItem queryItemWithName:value:]( &OBJC_CLASS___NSURLQueryItem,  "queryItemWithName:value:",  v8,  v9));
    -[NSMutableArray addObject:](v15, "addObject:", v16);
    -[NSURLComponents setQueryItems:](v12, "setQueryItems:", v15);
    id v17 = (id)objc_claimAutoreleasedReturnValue(-[NSURLComponents URL](v12, "URL"));
  }

  else
  {
    uint64_t v18 = _AKLogSystem(v13);
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      int v21 = 138412802;
      id v22 = v8;
      __int16 v23 = 2112;
      id v24 = v9;
      __int16 v25 = 2112;
      id v26 = v7;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEBUG,  "Failed to append %@:%@ to %@",  (uint8_t *)&v21,  0x20u);
    }

    id v17 = v7;
  }

  return v17;
}

- (NSDictionary)authKitBody
{
  return self->authKitBody;
}

- (void)setAuthKitBody:(id)a3
{
}

- (AKClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (NSString)urlBagKey
{
  return self->_urlBagKey;
}

- (void)setUrlBagKey:(id)a3
{
}

- (NSURL)requestURLOverride
{
  return self->_requestURLOverride;
}

- (BOOL)shouldCacheResource
{
  return self->_shouldCacheResource;
}

- (void)setShouldCacheResource:(BOOL)a3
{
  self->_shouldCacheResource = a3;
}

- (AKAccountManager)accountManager
{
  return self->_accountManager;
}

- (void)setAccountManager:(id)a3
{
}

- (NSData)authKitBodyData
{
  return self->_authKitBodyData;
}

- (void)setAuthKitBodyData:(id)a3
{
}

- (NSString)dataCenterIdentifier
{
  return self->_dataCenterIdentifier;
}

- (void)setDataCenterIdentifier:(id)a3
{
}

- (BOOL)_denyVirtualInterfaces
{
  return self->__denyVirtualInterfaces;
}

- (void)set_denyVirtualInterfaces:(BOOL)a3
{
  self->__denyVirtualInterfaces = a3;
}

- (AKAppleIDAuthenticationContext)concreteAuthenticationContext
{
  return self->_concreteAuthenticationContext;
}

- (void)setConcreteAuthenticationContext:(id)a3
{
}

- (AKAuthenticatedServerRequest)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
}

@end