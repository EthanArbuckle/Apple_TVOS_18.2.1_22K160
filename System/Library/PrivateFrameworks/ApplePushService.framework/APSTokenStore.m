@interface APSTokenStore
- (APSEnvironment)environment;
- (APSTokenStore)initWithEnvironment:(id)a3 allowInMemoryCache:(BOOL)a4;
- (BOOL)isAppSpecificTokenValidWithDomain:(id)a3 token:(id)a4 tokenServiceSuffix:(id)a5 user:(id)a6 error:(id *)a7;
- (BOOL)isAppSpecificTokenValidWithDomain:(id)a3 token:(id)a4 user:(id)a5 error:(id *)a6;
- (BOOL)isMatchingTokenInKeychain:(id)a3 user:(id)a4 error:(id *)a5;
- (NSMutableDictionary)perAppTokensByUserThenService;
- (id)_cachedTokensForUser:(id)a3 andService:(id)a4;
- (id)_copyHashForString:(id)a3;
- (id)_copyTokenForDomain:(id)a3 appSpecificIdentifier:(id)a4 tokenServiceSuffix:(id)a5 user:(id)a6;
- (id)copyAppSpecificIdentifierWithTopic:(id)a3 identifier:(id)a4 user:(id)a5;
- (id)copyAppSpecificTokensWithDomain:(id)a3 forTopic:(id)a4 tokenServiceSuffix:(id)a5 user:(id)a6 returnRef:(BOOL)a7 error:(id *)a8;
- (id)copyAppSpecificTokensWithDomain:(id)a3 forTopic:(id)a4 user:(id)a5 returnRef:(BOOL)a6 error:(id *)a7;
- (id)copyTokenForDomain:(id)a3 appSpecificIdentifier:(id)a4 tokenServiceSuffix:(id)a5 user:(id)a6;
- (id)description;
- (id)deserializedPersistedData:(id)a3 forInfo:(id)a4 outPersistedInfo:(id *)a5;
- (id)deserializedPersistedData:(id)a3 withType:(int64_t)a4 outPersistedInfo:(id *)a5;
- (id)serializeInfo:(id)a3 withToken:(id)a4;
- (id)suffixForInfo:(id)a3;
- (id)systemTokenForUser:(id)a3;
- (id)tokenForInfo:(id)a3 user:(id)a4 persistedInfo:(id *)a5;
- (id)tokenInfoArrayForTopic:(id)a3 user:(id)a4;
- (id)tokensForTopic:(id)a3 user:(id)a4 error:(id *)a5;
- (void)_cacheTokens:(id)a3 forUser:(id)a4 andService:(id)a5;
- (void)_clearCacheForUser:(id)a3 andService:(id)a4;
- (void)deleteAppSpecificTokensWithDomain:(id)a3 forTopic:(id)a4 user:(id)a5;
- (void)deleteAppSpecificTokensWithDomain:(id)a3 tokenServiceSuffix:(id)a4 user:(id)a5;
- (void)deleteAppSpecificTokensWithRefArray:(id)a3;
- (void)deleteAppTokensForUser:(id)a3;
- (void)setEnvironment:(id)a3;
- (void)setPerAppTokensByUserThenService:(id)a3;
- (void)setSystemToken:(id)a3 forUser:(id)a4;
- (void)setToken:(__CFData *)a3 withDomain:(id)a4 appSpecificIdentifier:(id)a5 tokenServiceSuffix:(id)a6 user:(id)a7 topic:(id)a8;
- (void)setToken:(id)a3 forInfo:(id)a4 user:(id)a5;
@end

@implementation APSTokenStore

- (APSTokenStore)initWithEnvironment:(id)a3 allowInMemoryCache:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___APSTokenStore;
  v8 = -[APSTokenStore init](&v13, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_environment, a3);
    if (v4)
    {
      v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      perAppTokensByUserThenService = v9->_perAppTokensByUserThenService;
      v9->_perAppTokensByUserThenService = v10;
    }
  }

  return v9;
}

- (void)setSystemToken:(id)a3 forUser:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[APSTokenStore environment](self, "environment"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v9 domain]);
  -[APSTokenStore setToken:withDomain:appSpecificIdentifier:tokenServiceSuffix:user:topic:]( self,  "setToken:withDomain:appSpecificIdentifier:tokenServiceSuffix:user:topic:",  v7,  v8,  0LL,  &stru_100123240,  v6,  0LL);
}

- (id)systemTokenForUser:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSTokenStore environment](self, "environment"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 domain]);
  id v7 = -[APSTokenStore copyTokenForDomain:appSpecificIdentifier:tokenServiceSuffix:user:]( self,  "copyTokenForDomain:appSpecificIdentifier:tokenServiceSuffix:user:",  v6,  0LL,  &stru_100123240,  v4);

  return v7;
}

- (void)deleteAppTokensForUser:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSTokenStore environment](self, "environment"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 domain]);
  -[APSTokenStore deleteAppSpecificTokensWithDomain:tokenServiceSuffix:user:]( self,  "deleteAppSpecificTokensWithDomain:tokenServiceSuffix:user:",  v6,  @",PerAppToken.v0",  v4);

  id v8 = (id)objc_claimAutoreleasedReturnValue(-[APSTokenStore environment](self, "environment"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v8 domain]);
  -[APSTokenStore deleteAppSpecificTokensWithDomain:tokenServiceSuffix:user:]( self,  "deleteAppSpecificTokensWithDomain:tokenServiceSuffix:user:",  v7,  @",ExtendedAppToken.v1",  v4);
}

- (void)setToken:(id)a3 forInfo:(id)a4 user:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8 && ![v9 type])
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[APSTokenStore environment](self, "environment"));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 domain]);
    objc_super v13 = (void *)objc_claimAutoreleasedReturnValue([v9 topic]);
    -[APSTokenStore deleteAppSpecificTokensWithDomain:forTopic:user:]( self,  "deleteAppSpecificTokensWithDomain:forTopic:user:",  v12,  v13,  v10);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue([v9 topic]);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
  id v16 = -[APSTokenStore copyAppSpecificIdentifierWithTopic:identifier:user:]( self,  "copyAppSpecificIdentifierWithTopic:identifier:user:",  v14,  v15,  v10);

  if (!v8)
  {
    v19 = 0LL;
LABEL_12:
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[APSTokenStore environment](self, "environment"));
    v21 = (void *)objc_claimAutoreleasedReturnValue([v20 domain]);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[APSTokenStore suffixForInfo:](self, "suffixForInfo:", v9));
    v23 = (void *)objc_claimAutoreleasedReturnValue([v9 topic]);
    -[APSTokenStore setToken:withDomain:appSpecificIdentifier:tokenServiceSuffix:user:topic:]( self,  "setToken:withDomain:appSpecificIdentifier:tokenServiceSuffix:user:topic:",  v19,  v21,  v16,  v22,  v10,  v23);

    goto LABEL_13;
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue([v9 baseToken]);

  if (!v17)
  {
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      sub_1000BC954((uint64_t)self, v18);
    }
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[APSTokenStore serializeInfo:withToken:](self, "serializeInfo:withToken:", v9, v8));
  if (v19) {
    goto LABEL_12;
  }
LABEL_13:
}

- (id)tokenForInfo:(id)a3 user:(id)a4 persistedInfo:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 topic]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
  id v12 = -[APSTokenStore copyAppSpecificIdentifierWithTopic:identifier:user:]( self,  "copyAppSpecificIdentifierWithTopic:identifier:user:",  v10,  v11,  v9);

  objc_super v13 = (void *)objc_claimAutoreleasedReturnValue(-[APSTokenStore environment](self, "environment"));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 domain]);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[APSTokenStore suffixForInfo:](self, "suffixForInfo:", v8));
  id v16 = -[APSTokenStore copyTokenForDomain:appSpecificIdentifier:tokenServiceSuffix:user:]( self,  "copyTokenForDomain:appSpecificIdentifier:tokenServiceSuffix:user:",  v14,  v12,  v15,  v9);

  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue( -[APSTokenStore deserializedPersistedData:forInfo:outPersistedInfo:]( self,  "deserializedPersistedData:forInfo:outPersistedInfo:",  v16,  v8,  a5));
  }

  else
  {
    v17 = 0LL;
    if (a5) {
      *a5 = v8;
    }
  }

  return v17;
}

- (id)tokensForTopic:(id)a3 user:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[APSEnvironment domain](self->_environment, "domain"));
  id v42 = 0LL;
  id v10 = -[APSTokenStore copyAppSpecificTokensWithDomain:forTopic:user:returnRef:error:]( self,  "copyAppSpecificTokensWithDomain:forTopic:user:returnRef:error:",  v9,  v7,  v8,  0LL,  &v42);
  id v31 = v42;

  v11 = &__NSArray0__struct;
  if (v10) {
    v11 = v10;
  }
  id v12 = v11;

  objc_super v13 = (void *)objc_claimAutoreleasedReturnValue(-[APSEnvironment domain](self->_environment, "domain"));
  id v41 = 0LL;
  id v14 = -[APSTokenStore copyAppSpecificTokensWithDomain:forTopic:tokenServiceSuffix:user:returnRef:error:]( self,  "copyAppSpecificTokensWithDomain:forTopic:tokenServiceSuffix:user:returnRef:error:",  v13,  v7,  @",ExtendedAppToken.v1",  v8,  0LL,  &v41);
  id v30 = v41;

  id v15 = [v12 mutableCopy];
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  id v16 = v12;
  id v17 = [v16 countByEnumeratingWithState:&v37 objects:v44 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v38;
    do
    {
      for (i = 0LL; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v38 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = (void *)objc_claimAutoreleasedReturnValue( -[APSTokenStore deserializedPersistedData:withType:outPersistedInfo:]( self,  "deserializedPersistedData:withType:outPersistedInfo:",  *(void *)(*((void *)&v37 + 1) + 8LL * (void)i),  0LL,  0LL));
        if (v21) {
          [v15 addObject:v21];
        }
      }

      id v18 = [v16 countByEnumeratingWithState:&v37 objects:v44 count:16];
    }

    while (v18);
  }

  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  id v22 = v14;
  id v23 = [v22 countByEnumeratingWithState:&v33 objects:v43 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v34;
    do
    {
      for (j = 0LL; j != v24; j = (char *)j + 1)
      {
        if (*(void *)v34 != v25) {
          objc_enumerationMutation(v22);
        }
        v27 = (void *)objc_claimAutoreleasedReturnValue( -[APSTokenStore deserializedPersistedData:withType:outPersistedInfo:]( self,  "deserializedPersistedData:withType:outPersistedInfo:",  *(void *)(*((void *)&v33 + 1) + 8LL * (void)j),  1LL,  0LL));
        if (v27) {
          [v15 addObject:v27];
        }
      }

      id v24 = [v22 countByEnumeratingWithState:&v33 objects:v43 count:16];
    }

    while (v24);
  }

  if (a5 && v31 && v30) {
    *a5 = v31;
  }
  id v28 = [v15 copy];

  return v28;
}

- (id)tokenInfoArrayForTopic:(id)a3 user:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[APSEnvironment domain](self->_environment, "domain"));
  id v9 = -[APSTokenStore copyAppSpecificTokensWithDomain:forTopic:tokenServiceSuffix:user:returnRef:error:]( self,  "copyAppSpecificTokensWithDomain:forTopic:tokenServiceSuffix:user:returnRef:error:",  v8,  v6,  @",ExtendedAppToken.v1",  v7,  0LL,  0LL);

  id v10 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v11 = v9;
  id v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v23;
    do
    {
      id v15 = 0LL;
      do
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v22 + 1) + 8LL * (void)v15);
        id v21 = 0LL;
        id v17 =  -[APSTokenStore deserializedPersistedData:withType:outPersistedInfo:]( self,  "deserializedPersistedData:withType:outPersistedInfo:",  v16,  1LL,  &v21);
        id v18 = v21;
        if (v18) {
          -[NSMutableArray addObject:](v10, "addObject:", v18);
        }

        id v15 = (char *)v15 + 1;
      }

      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }

    while (v13);
  }

  id v19 = -[NSMutableArray copy](v10, "copy");
  return v19;
}

- (BOOL)isMatchingTokenInKeychain:(id)a3 user:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[APSTokenStore environment](self, "environment"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 domain]);
  LOBYTE(a5) = -[APSTokenStore isAppSpecificTokenValidWithDomain:token:user:error:]( self,  "isAppSpecificTokenValidWithDomain:token:user:error:",  v11,  v9,  v8,  a5);

  return (char)a5;
}

- (id)suffixForInfo:(id)a3
{
  unint64_t v3 = (unint64_t)[a3 type];
  if (v3 > 2) {
    return &stru_100123240;
  }
  else {
    return off_10011DF98[v3];
  }
}

- (id)serializeInfo:(id)a3 withToken:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 dictionaryRepresentation]);
  id v8 = [v7 mutableCopy];

  [v8 setObject:v5 forKeyedSubscript:@"APSTokenPersistenceKey"];
  id v9 = [v6 type];

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v9));
  [v8 setObject:v10 forKeyedSubscript:@"APSTypePersistenceKey"];

  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v8,  1LL,  0LL));
  return v11;
}

- (id)deserializedPersistedData:(id)a3 forInfo:(id)a4 outPersistedInfo:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[APSTokenStore deserializedPersistedData:withType:outPersistedInfo:]( self,  "deserializedPersistedData:withType:outPersistedInfo:",  v9,  [v8 type],  a5));

  if (![v8 type] && !*a5)
  {
    id v11 = objc_alloc(&OBJC_CLASS___APSAppTokenInfo);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 dictionaryRepresentation]);
    *a5 = [v11 initWithDictionary:v12];
  }

  return v10;
}

- (id)deserializedPersistedData:(id)a3 withType:(int64_t)a4 outPersistedInfo:(id *)a5
{
  id v7 = a3;
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSDictionary, v8);
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSNumber, v10);
  uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSString, v12);
  id v15 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v9,  v11,  v13,  objc_opt_class(&OBJC_CLASS___NSData, v14),  0LL);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  id v31 = 0LL;
  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v16,  v7,  &v31));
  id v18 = v31;

  if (v17)
  {
    uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSDictionary, v19);
    if ((objc_opt_isKindOfClass(v17, v20) & 1) != 0)
    {
      id v21 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:@"APSTokenPersistenceKey"]);
      __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:@"APSTypePersistenceKey"]);
      __int128 v23 = v22;
      if (v22 && (unsigned int v24 = [v22 intValue], v24 <= 2))
      {
        id v25 = [objc_alloc((Class)*off_10011DFB0[v24]) initWithDictionary:v17];
        v26 = v25;
        if (v25) {
          BOOL v27 = v21 == 0LL;
        }
        else {
          BOOL v27 = 1;
        }
        if (!v27)
        {
          if (a5) {
            *a5 = v25;
          }
          id v28 = v21;
LABEL_19:

          goto LABEL_20;
        }
      }

      else
      {
        v26 = 0LL;
      }

      id v28 = 0LL;
      if (a5) {
        *a5 = 0LL;
      }
      goto LABEL_19;
    }
  }

  if (a4 || (uint64_t v29 = objc_opt_class(&OBJC_CLASS___NSData, v19), (objc_opt_isKindOfClass(v7, v29) & 1) == 0)) {
    id v28 = 0LL;
  }
  else {
    id v28 = v7;
  }
LABEL_20:

  return v28;
}

- (BOOL)isAppSpecificTokenValidWithDomain:(id)a3 token:(id)a4 user:(id)a5 error:(id *)a6
{
  id v20 = 0LL;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  unsigned __int8 v13 = -[APSTokenStore isAppSpecificTokenValidWithDomain:token:tokenServiceSuffix:user:error:]( self,  "isAppSpecificTokenValidWithDomain:token:tokenServiceSuffix:user:error:",  v12,  v11,  @",PerAppToken.v0",  v10,  &v20);
  id v14 = v20;
  id v19 = 0LL;
  unsigned __int8 v15 = -[APSTokenStore isAppSpecificTokenValidWithDomain:token:tokenServiceSuffix:user:error:]( self,  "isAppSpecificTokenValidWithDomain:token:tokenServiceSuffix:user:error:",  v12,  v11,  @",ExtendedAppToken.v1",  v10,  &v19);

  id v16 = v19;
  id v17 = v16;
  if (a6 && v14 && v16) {
    *a6 = v14;
  }

  return v13 | v15;
}

- (BOOL)isAppSpecificTokenValidWithDomain:(id)a3 token:(id)a4 tokenServiceSuffix:(id)a5 user:(id)a6 error:(id *)a7
{
  id v12 = (__CFString *)a3;
  unsigned __int8 v13 = (__CFString *)a4;
  id v14 = a5;
  id v15 = a6;
  if (v13)
  {
    id v16 = -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"%@%@", v12, v14);
    id v17 = (void *)objc_claimAutoreleasedReturnValue( -[APSTokenStore _cachedTokensForUser:andService:]( self,  "_cachedTokensForUser:andService:",  v15,  v16));
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    if (v17)
    {
      if (v19)
      {
        *(_DWORD *)buf = 138413314;
        v50 = self;
        __int16 v51 = 2112;
        v52 = v12;
        __int16 v53 = 2112;
        v54 = v13;
        __int16 v55 = 2112;
        id v56 = v14;
        __int16 v57 = 2048;
        id v58 = [v17 count];
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%@: isAppSpecificTokenValid %@ %@ %@ - using cache {count: %llu}",  buf,  0x34u);
      }

      LOBYTE(v18) = [v17 containsObject:v13];
LABEL_42:

      goto LABEL_43;
    }

    id v41 = a7;
    if (v19)
    {
      *(_DWORD *)buf = 138413058;
      v50 = self;
      __int16 v51 = 2112;
      v52 = v12;
      __int16 v53 = 2112;
      v54 = v13;
      __int16 v55 = 2112;
      id v56 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%@: isAppSpecificTokenValid %@ %@ %@",  buf,  0x2Au);
    }

    Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFDictionaryAddValue(Mutable, kSecClass, kSecClassGenericPassword);
    CFDictionaryAddValue(Mutable, kSecAttrAccessGroup, APSBundleIdentifier);
    CFDictionaryAddValue(Mutable, kSecAttrService, v16);
    CFDictionaryAddValue(Mutable, kSecMatchLimit, kSecMatchLimitAll);
    CFDictionaryAddValue(Mutable, kSecReturnData, kCFBooleanTrue);
    if ([v15 isDefaultUser])
    {
      id v21 = (void *)objc_claimAutoreleasedReturnValue(+[APSMultiUserMode sharedInstance](&OBJC_CLASS___APSMultiUserMode, "sharedInstance"));
      unsigned int v22 = [v21 isMultiUser];

      if (v22) {
        CFDictionaryAddValue(Mutable, kSecUseSystemKeychain, kCFBooleanTrue);
      }
    }

    CFTypeRef result = 0LL;
    OSStatus v23 = SecItemCopyMatching(Mutable, &result);
    if (v23 == -25300)
    {
      id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v50 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "%@: SecItemCopyMatching() returned no items found.",  buf,  0xCu);
      }

      if (!v41) {
        goto LABEL_23;
      }
      uint64_t v26 = APSErrorDomain;
      uint64_t v27 = -25300LL;
    }

    else
    {
      OSStatus v24 = v23;
      if (!v23) {
        goto LABEL_23;
      }
      id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        sub_1000BC9C4();
      }

      CFTypeRef result = 0LL;
      if (!v41) {
        goto LABEL_23;
      }
      uint64_t v26 = APSErrorDomain;
      uint64_t v27 = v24;
    }

    *id v41 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v26,  v27,  0LL));
LABEL_23:
    CFRelease(Mutable);
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    uint64_t v29 = (id)(id)result;
    id v30 = [v29 countByEnumeratingWithState:&v43 objects:v48 count:16];
    if (v30)
    {
      id v31 = v30;
      __int128 v39 = v16;
      id v40 = v15;
      id v42 = v12;
      uint64_t v32 = *(void *)v44;
      while (2)
      {
        for (i = 0LL; i != v31; i = (char *)i + 1)
        {
          if (*(void *)v44 != v32) {
            objc_enumerationMutation(v29);
          }
          __int128 v34 = (void *)objc_claimAutoreleasedReturnValue( -[APSTokenStore deserializedPersistedData:withType:outPersistedInfo:]( self,  "deserializedPersistedData:withType:outPersistedInfo:",  *(void *)(*((void *)&v43 + 1) + 8 * (void)i),  [@",ExtendedAppToken.v1" isEqualToString:v14],  0));
          unsigned __int8 v35 = [v34 isEqualToData:v13];

          if ((v35 & 1) != 0)
          {
            LODWORD(v18) = 1;
            goto LABEL_33;
          }
        }

        id v31 = [v29 countByEnumeratingWithState:&v43 objects:v48 count:16];
        if (v31) {
          continue;
        }
        break;
      }

      LODWORD(v18) = 0;
LABEL_33:
      id v12 = v42;
      id v16 = v39;
      id v15 = v40;
    }

    else
    {
      LODWORD(v18) = 0;
    }

    __int128 v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      __int128 v37 = @"NO";
      *(_DWORD *)buf = 138412802;
      v50 = self;
      __int16 v51 = 2112;
      if ((_DWORD)v18) {
        __int128 v37 = @"YES";
      }
      v52 = v13;
      __int16 v53 = 2112;
      v54 = v37;
      _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "%@: isAppSpecificTokenValid? %@ found cached token %@",  buf,  0x20u);
    }

    if (result) {
      CFRelease(result);
    }

    id v17 = 0LL;
    goto LABEL_42;
  }

  LOBYTE(v18) = 0;
LABEL_43:

  return (char)v18;
}

- (id)copyAppSpecificTokensWithDomain:(id)a3 forTopic:(id)a4 user:(id)a5 returnRef:(BOOL)a6 error:(id *)a7
{
  return -[APSTokenStore copyAppSpecificTokensWithDomain:forTopic:tokenServiceSuffix:user:returnRef:error:]( self,  "copyAppSpecificTokensWithDomain:forTopic:tokenServiceSuffix:user:returnRef:error:",  a3,  a4,  @",PerAppToken.v0",  a5,  a6,  a7);
}

- (id)copyAppSpecificTokensWithDomain:(id)a3 forTopic:(id)a4 tokenServiceSuffix:(id)a5 user:(id)a6 returnRef:(BOOL)a7 error:(id *)a8
{
  BOOL v54 = a7;
  id v12 = a3;
  id v51 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v64 = self;
    __int16 v65 = 2112;
    id v66 = v12;
    __int16 v67 = 2112;
    id v68 = v51;
    __int16 v69 = 2112;
    id v70 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%@: copyAppSpecificTokensWithDomain %@ %@ %@",  buf,  0x2Au);
  }

  v48 = v13;
  id v16 = -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"%@%@", v12, v13);
  Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(Mutable, kSecClass, kSecClassGenericPassword);
  CFDictionaryAddValue(Mutable, kSecAttrAccessGroup, APSBundleIdentifier);
  __int128 v46 = v16;
  CFDictionaryAddValue(Mutable, kSecAttrService, v16);
  CFDictionaryAddValue(Mutable, kSecMatchLimit, kSecMatchLimitAll);
  CFDictionaryAddValue(Mutable, kSecReturnAttributes, kCFBooleanTrue);
  CFDictionaryAddValue(Mutable, kSecReturnPersistentRef, kCFBooleanTrue);
  if ([v14 isDefaultUser])
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue(+[APSMultiUserMode sharedInstance](&OBJC_CLASS___APSMultiUserMode, "sharedInstance"));
    unsigned int v19 = [v18 isMultiUser];

    if (v19) {
      CFDictionaryAddValue(Mutable, kSecUseSystemKeychain, kCFBooleanTrue);
    }
  }

  CFTypeRef result = 0LL;
  OSStatus v20 = SecItemCopyMatching(Mutable, &result);
  if (v20 == -25300)
  {
    id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v64 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "%@: SecItemCopyMatching() returned no items found.",  buf,  0xCu);
    }

    if (!a8) {
      goto LABEL_17;
    }
    uint64_t v23 = APSErrorDomain;
    uint64_t v24 = -25300LL;
  }

  else
  {
    OSStatus v21 = v20;
    if (!v20) {
      goto LABEL_17;
    }
    unsigned int v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v64 = self;
      __int16 v65 = 2048;
      id v66 = (id)v21;
      __int16 v67 = 2112;
      id v68 = v12;
      _os_log_error_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "%@: SecItemCopyMatching() failed: %ld - copyAppSpecificTokensWithDomain %@",  buf,  0x20u);
    }

    CFTypeRef result = 0LL;
    if (!a8) {
      goto LABEL_17;
    }
    uint64_t v23 = APSErrorDomain;
    uint64_t v24 = v21;
  }

  *a8 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v23,  v24,  0LL));
LABEL_17:
  __int16 v55 = v12;
  cf = Mutable;
  v47 = v14;
  uint64_t v26 = (id)result;
  id v27 = -[APSTokenStore _copyHashForString:](self, "_copyHashForString:", v51);
  id v28 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  id v29 = v26;
  id v30 = [v29 countByEnumeratingWithState:&v57 objects:v62 count:16];
  if (!v30) {
    goto LABEL_40;
  }
  id v31 = v30;
  uint64_t v32 = *(void *)v58;
  id v49 = v27;
  id v50 = v29;
  uint64_t v53 = *(void *)v58;
  do
  {
    for (i = 0LL; i != v31; i = (char *)i + 1)
    {
      if (*(void *)v58 != v32) {
        objc_enumerationMutation(v29);
      }
      __int128 v34 = *(void **)(*((void *)&v57 + 1) + 8LL * (void)i);
      unsigned __int8 v35 = (void *)objc_claimAutoreleasedReturnValue([v34 objectForKeyedSubscript:kSecAttrAccount]);
      if ([v35 containsString:v27])
      {
        if (!v28) {
          id v28 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
        }
        id v36 = v31;
        __int128 v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138413058;
          v64 = self;
          __int16 v65 = 2112;
          id v66 = v55;
          __int16 v67 = 2112;
          id v68 = v51;
          __int16 v69 = 2112;
          id v70 = v35;
          _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "%@: copyAppSpecificTokensWithDomain - %@ for topic %@ account %@",  buf,  0x2Au);
        }

        __int128 v38 = (void *)objc_claimAutoreleasedReturnValue([v34 objectForKeyedSubscript:kSecValuePersistentRef]);
        if (v54)
        {
          -[NSMutableArray addObject:](v28, "addObject:", v38);
LABEL_37:

          uint64_t v32 = v53;
          id v31 = v36;
          goto LABEL_38;
        }

        __int128 v39 = v28;
        id v40 = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        CFDictionaryAddValue(v40, kSecValuePersistentRef, v38);
        CFDictionaryAddValue(v40, kSecReturnData, kCFBooleanTrue);
        OSStatus v41 = SecItemCopyMatching(v40, &v56);
        if (v41)
        {
          OSStatus v42 = v41;
          __int128 v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138413058;
            v64 = self;
            __int16 v65 = 2112;
            id v66 = v38;
            __int16 v67 = 2048;
            id v68 = (id)v42;
            __int16 v69 = 2112;
            id v70 = v55;
            _os_log_error_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_ERROR,  "%@: SecItemCopyMatching() failed for persistenRef %@ with error: %ld - copyAppSpecificTokensWithDomain %@",  buf,  0x2Au);
          }

          id v28 = v39;
          id v27 = v49;
          id v29 = v50;
LABEL_35:
        }

        else
        {
          __int128 v43 = (os_log_s *)v56;
          id v27 = v49;
          id v29 = v50;
          if (v56)
          {
            -[NSMutableArray addObject:](v28, "addObject:", v56);
            goto LABEL_35;
          }
        }

        CFRelease(v40);
        goto LABEL_37;
      }

- (id)copyAppSpecificIdentifierWithTopic:(id)a3 identifier:(id)a4 user:(id)a5
{
  id v7 = a4;
  id v8 = -[APSTokenStore _copyHashForString:](self, "_copyHashForString:", a3);
  uint64_t v9 = -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"%@,%@", v7, v8);

  return v9;
}

- (void)deleteAppSpecificTokensWithRefArray:(id)a3
{
  id v3 = a3;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v15 objects:v27 count:16];
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = *(void *)v16;
    *(void *)&__int128 v5 = 138412802LL;
    __int128 v13 = v5;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8LL * (void)v8);
        CFStringRef v25 = kSecValuePersistentRef;
        uint64_t v26 = v9;
        id v10 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v26,  &v25,  1LL,  v13));
        OSStatus v11 = SecItemDelete(v10);

        if (v11)
        {
          id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v13;
            OSStatus v20 = self;
            __int16 v21 = 2048;
            uint64_t v22 = v11;
            __int16 v23 = 2112;
            uint64_t v24 = v9;
            _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "%@: SecItemDelete() failed: %ld - deleteAppSpecificTokensWithArray persistentRef %@",  buf,  0x20u);
          }
        }

        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v3 countByEnumeratingWithState:&v15 objects:v27 count:16];
    }

    while (v6);
  }
}

- (id)_copyHashForString:(id)a3
{
  id v3 = sub_100077E4C(a3);
  return (id)objc_claimAutoreleasedReturnValue(v3);
}

- (void)deleteAppSpecificTokensWithDomain:(id)a3 forTopic:(id)a4 user:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  OSStatus v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    __int128 v15 = self;
    __int16 v16 = 2112;
    id v17 = v8;
    __int16 v18 = 2112;
    id v19 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%@: deleteAppSpecificTokens - %@ for topic %@",  buf,  0x20u);
  }

  id v12 = -[APSTokenStore copyAppSpecificTokensWithDomain:forTopic:user:returnRef:error:]( self,  "copyAppSpecificTokensWithDomain:forTopic:user:returnRef:error:",  v8,  v9,  v10,  1LL,  0LL);
  __int128 v13 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@%@",  v8,  @",PerAppToken.v0");
  -[APSTokenStore _clearCacheForUser:andService:](self, "_clearCacheForUser:andService:", v10, v13);

  -[APSTokenStore deleteAppSpecificTokensWithRefArray:](self, "deleteAppSpecificTokensWithRefArray:", v12);
}

- (void)setToken:(__CFData *)a3 withDomain:(id)a4 appSpecificIdentifier:(id)a5 tokenServiceSuffix:(id)a6 user:(id)a7 topic:(id)a8
{
  id v13 = a4;
  id v14 = (__CFData *)a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    id v29 = self;
    __int16 v30 = 2112;
    id v31 = v13;
    __int16 v32 = 2112;
    __int128 v33 = a3;
    __int16 v34 = 2112;
    unsigned __int8 v35 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%@: setTokenForDomain %@ token %@ appSpecificIdentifier %@",  buf,  0x2Au);
  }

  Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(Mutable, kSecClass, kSecClassGenericPassword);
  CFDictionaryAddValue(Mutable, kSecAttrAccessGroup, APSBundleIdentifier);
  if ([v16 isDefaultUser])
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue(+[APSMultiUserMode sharedInstance](&OBJC_CLASS___APSMultiUserMode, "sharedInstance"));
    unsigned int v20 = [v19 isMultiUser];

    if (v20) {
      CFDictionaryAddValue(Mutable, kSecUseSystemKeychain, kCFBooleanTrue);
    }
  }

  if (v14)
  {
    CFDictionaryAddValue(Mutable, kSecAttrAccount, v14);
    __int16 v21 = -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"%@%@", v13, v15);
  }

  else
  {
    __int16 v21 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@%@",  v13,  &stru_100123240);
  }

  uint64_t v22 = v21;
  -[APSTokenStore _clearCacheForUser:andService:](self, "_clearCacheForUser:andService:", v16, v21);
  CFDictionaryAddValue(Mutable, kSecAttrService, v22);
  if (a3)
  {
    CFDictionaryAddValue(Mutable, kSecAttrAccessible, kSecAttrAccessibleAlwaysThisDeviceOnly);
    CFDictionaryAddValue(Mutable, kSecValueData, a3);
    OSStatus v23 = SecItemAdd(Mutable, 0LL);
    if (v23 == -25299)
    {
      id v27 = v15;
      uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138413058;
        id v29 = self;
        __int16 v30 = 2112;
        id v31 = v13;
        __int16 v32 = 2112;
        __int128 v33 = v14;
        __int16 v34 = 2112;
        unsigned __int8 v35 = a3;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "%@: SecResult shows duplicate item, trying to update it. setTokenForDomain %@ appSpecificIdentifier %@  token %@",  buf,  0x2Au);
      }

      CFDictionaryRemoveValue(Mutable, kSecValueData);
      CFStringRef v25 = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      CFDictionaryAddValue(v25, kSecValueData, a3);
      OSStatus v23 = SecItemUpdate(Mutable, v25);
      CFRelease(v25);
      id v15 = v27;
    }

    if (v23)
    {
      uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        sub_1000BCA84();
      }
LABEL_20:
    }
  }

  else if (SecItemDelete(Mutable))
  {
    uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_1000BCA24();
    }
    goto LABEL_20;
  }

  CFRelease(Mutable);
}

- (void)deleteAppSpecificTokensWithDomain:(id)a3 tokenServiceSuffix:(id)a4 user:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  OSStatus v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v19 = self;
    __int16 v20 = 2112;
    id v21 = v8;
    __int16 v22 = 2112;
    id v23 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%@: deleteAppSpecificTokens - domain %@ tokenServiceSuffix %@",  buf,  0x20u);
  }

  id v12 = -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"%@%@", v8, v9);
  -[APSTokenStore _clearCacheForUser:andService:](self, "_clearCacheForUser:andService:", v10, v12);
  Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(Mutable, kSecClass, kSecClassGenericPassword);
  CFDictionaryAddValue(Mutable, kSecAttrAccessGroup, APSBundleIdentifier);
  CFDictionaryAddValue(Mutable, kSecAttrService, v12);
  unsigned int v14 = [v10 isDefaultUser];

  if (v14)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[APSMultiUserMode sharedInstance](&OBJC_CLASS___APSMultiUserMode, "sharedInstance"));
    unsigned int v16 = [v15 isMultiUser];

    if (v16) {
      CFDictionaryAddValue(Mutable, kSecUseSystemKeychain, kCFBooleanTrue);
    }
  }

  if (SecItemDelete(Mutable))
  {
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_1000BCAE4();
    }
  }

  CFRelease(Mutable);
}

- (id)copyTokenForDomain:(id)a3 appSpecificIdentifier:(id)a4 tokenServiceSuffix:(id)a5 user:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = -[APSTokenStore _copyTokenForDomain:appSpecificIdentifier:tokenServiceSuffix:user:]( self,  "_copyTokenForDomain:appSpecificIdentifier:tokenServiceSuffix:user:",  v10,  v11,  v12,  v13);
  if (!v14) {
    id v14 = -[APSTokenStore _copyTokenForDomain:appSpecificIdentifier:tokenServiceSuffix:user:]( self,  "_copyTokenForDomain:appSpecificIdentifier:tokenServiceSuffix:user:",  v10,  v11,  v12,  v13);
  }

  return v14;
}

- (id)_copyTokenForDomain:(id)a3 appSpecificIdentifier:(id)a4 tokenServiceSuffix:(id)a5 user:(id)a6
{
  id v41 = a3;
  unint64_t v10 = (unint64_t)a4;
  id v11 = (__CFString *)a5;
  id v42 = a6;
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    id v50 = self;
    __int16 v51 = 2112;
    id v52 = v41;
    __int16 v53 = 2112;
    unint64_t v54 = v10;
    __int16 v55 = 2112;
    CFTypeRef v56 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@: copyTokenForDomain %@ %@ %@", buf, 0x2Au);
  }

  Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(Mutable, kSecClass, kSecClassGenericPassword);
  CFDictionaryAddValue(Mutable, kSecAttrAccessGroup, APSBundleIdentifier);
  if ([v42 isDefaultUser])
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[APSMultiUserMode sharedInstance](&OBJC_CLASS___APSMultiUserMode, "sharedInstance"));
    unsigned int v15 = [v14 isMultiUser];

    if (v15) {
      CFDictionaryAddValue(Mutable, kSecUseSystemKeychain, kCFBooleanTrue);
    }
  }

  if (v10)
  {
    CFDictionaryAddValue(Mutable, kSecAttrAccount, (const void *)v10);
    unsigned int v16 = objc_alloc(&OBJC_CLASS___NSString);
    id v36 = v11;
  }

  else
  {
    unsigned int v16 = objc_alloc(&OBJC_CLASS___NSString);
    id v36 = &stru_100123240;
  }

  id v17 = -[NSString initWithFormat:](v16, "initWithFormat:", @"%@%@", v41, v36);
  CFDictionaryAddValue(Mutable, kSecAttrService, v17);
  CFDictionaryAddValue(Mutable, kSecReturnData, kCFBooleanTrue);
  CFTypeRef result = 0LL;
  OSStatus v18 = SecItemCopyMatching(Mutable, &result);
  if (v18 != -25300 && v18)
  {
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_1000BCB44();
    }
  }

  CFRelease(Mutable);
  if (!(v10 | (unint64_t)result))
  {
    CFPropertyListRef v20 = sub_10007783C(@"APSPublicTokens", (int)[v42 isDefaultUser]);
    if (v20)
    {
      id v21 = (void *)v20;
      CFTypeID v22 = CFGetTypeID(v20);
      if (v22 == CFDictionaryGetTypeID())
      {
        __int128 v38 = v17;
        __int128 v39 = v11;
        unint64_t v40 = v10;
        id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v50 = self;
          _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "%@: Migrating tokens to the keychain",  buf,  0xCu);
        }

        __int128 v45 = 0u;
        __int128 v46 = 0u;
        __int128 v43 = 0u;
        __int128 v44 = 0u;
        __int128 v37 = v21;
        id v24 = v21;
        id v25 = [v24 countByEnumeratingWithState:&v43 objects:v48 count:16];
        if (v25)
        {
          id v26 = v25;
          uint64_t v27 = *(void *)v44;
          do
          {
            for (i = 0LL; i != v26; i = (char *)i + 1)
            {
              if (*(void *)v44 != v27) {
                objc_enumerationMutation(v24);
              }
              id v29 = *(const void **)(*((void *)&v43 + 1) + 8LL * (void)i);
              Value = CFDictionaryGetValue((CFDictionaryRef)v24, v29);
              CFTypeRef v31 = result;
              __int16 v32 = (void *)objc_claimAutoreleasedReturnValue(-[APSTokenStore environment](self, "environment"));
              __int128 v33 = (void *)objc_claimAutoreleasedReturnValue([v32 domain]);
              -[APSTokenStore setToken:withDomain:appSpecificIdentifier:tokenServiceSuffix:user:topic:]( self,  "setToken:withDomain:appSpecificIdentifier:tokenServiceSuffix:user:topic:",  v31,  v33,  0LL,  &stru_100123240,  v42,  0LL);
            }

            id v26 = [v24 countByEnumeratingWithState:&v43 objects:v48 count:16];
          }

          while (v26);
        }

        sub_10007792C(@"APSPublicTokens", 0, (int)[v42 isDefaultUser]);
        sub_100077A2C((int)[v42 isDefaultUser]);
        id v11 = v39;
        unint64_t v10 = v40;
        id v21 = v37;
        id v17 = v38;
      }

      CFRelease(v21);
    }
  }

  CFTypeRef v34 = result;

  return (id)v34;
}

- (id)description
{
  uint64_t v3 = objc_opt_class(self, a2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[APSTokenStore environment](self, "environment"));
  __int128 v5 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@:%p; %@>",
                   v3,
                   self,
                   v5));

  return v6;
}

- (void)_clearCacheForUser:(id)a3 andService:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_perAppTokensByUserThenService)
  {
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412802;
      id v13 = self;
      __int16 v14 = 2112;
      id v15 = v6;
      __int16 v16 = 2112;
      id v17 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%@: dropping cache {user: %@, service: %@}",  (uint8_t *)&v12,  0x20u);
    }

    perAppTokensByUserThenService = self->_perAppTokensByUserThenService;
    unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 name]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( perAppTokensByUserThenService,  "objectForKeyedSubscript:",  v10));
    [v11 removeObjectForKey:v7];
  }
}

- (id)_cachedTokensForUser:(id)a3 andService:(id)a4
{
  perAppTokensByUserThenService = self->_perAppTokensByUserThenService;
  if (perAppTokensByUserThenService)
  {
    id v6 = a4;
    id v7 = (void *)objc_claimAutoreleasedReturnValue([a3 name]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( perAppTokensByUserThenService,  "objectForKeyedSubscript:",  v7));

    perAppTokensByUserThenService = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v6]);
  }

  return perAppTokensByUserThenService;
}

- (void)_cacheTokens:(id)a3 forUser:(id)a4 andService:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  perAppTokensByUserThenService = self->_perAppTokensByUserThenService;
  if (perAppTokensByUserThenService)
  {
    int v12 = (void *)objc_claimAutoreleasedReturnValue([v9 name]);
    id v13 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( perAppTokensByUserThenService,  "objectForKeyedSubscript:",  v12));

    if (!v13)
    {
      id v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      __int16 v14 = self->_perAppTokensByUserThenService;
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v9 name]);
      -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v13, v15);
    }

    __int16 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138413058;
      OSStatus v18 = self;
      __int16 v19 = 2112;
      id v20 = v9;
      __int16 v21 = 2112;
      id v22 = v10;
      __int16 v23 = 2048;
      id v24 = [v8 count];
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "%@: storing cache {user: %@, service: %@, count: %llu}",  (uint8_t *)&v17,  0x2Au);
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v8, v10);
  }
}

- (APSEnvironment)environment
{
  return self->_environment;
}

- (void)setEnvironment:(id)a3
{
}

- (NSMutableDictionary)perAppTokensByUserThenService
{
  return self->_perAppTokensByUserThenService;
}

- (void)setPerAppTokensByUserThenService:(id)a3
{
}

- (void).cxx_destruct
{
}

  ;
}

@end