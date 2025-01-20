@interface AluminiumAuthenticator
+ (id)_defaultIncludedHeaders;
- (AluminiumAuthenticator)initWithASCIIEncodedKey:(id)a3;
- (AluminiumAuthenticator)initWithHexEncodedKey:(id)a3;
- (BOOL)addAuthenticationHeadersToRequest:(id)a3 error:(id *)a4;
- (BOOL)addAuthenticationHeadersToRequest:(id)a3 includedHeaders:(id)a4 body:(id)a5 algorithm:(unsigned int)defaultAlgorithm error:(id *)a7;
- (BOOL)verifyAuthenticationWithRequest:(__CFHTTPMessage *)a3 error:(id *)a4;
- (BOOL)verifyAuthenticationWithRequest:(__CFHTTPMessage *)a3 includedHeaders:(id)a4 algorithm:(unsigned int)defaultAlgorithm error:(id *)a6;
- (NSSet)defaultIncludedHeaders;
- (unsigned)defaultAlgorithm;
- (void)setDefaultAlgorithm:(unsigned int)a3;
- (void)setDefaultIncludedHeaders:(id)a3;
@end

@implementation AluminiumAuthenticator

+ (id)_defaultIncludedHeaders
{
  if (qword_1001252C8 != -1) {
    dispatch_once(&qword_1001252C8, &stru_1000F9A40);
  }
  return (id)qword_1001252C0;
}

- (AluminiumAuthenticator)initWithHexEncodedKey:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___AluminiumAuthenticator;
  v5 = -[AluminiumAuthenticator init](&v13, "init");
  if (v5)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 _dataUsingHexEncoding]);
    key = v5->_key;
    v5->_key = (NSData *)v6;

    v8 = v5->_key;
    if (!v8 || !-[NSData length](v8, "length"))
    {
      v11 = 0LL;
      goto LABEL_7;
    }

    uint64_t v9 = objc_claimAutoreleasedReturnValue( +[AluminiumAuthenticator _defaultIncludedHeaders]( &OBJC_CLASS___AluminiumAuthenticator,  "_defaultIncludedHeaders"));
    defaultIncludedHeaders = v5->_defaultIncludedHeaders;
    v5->_defaultIncludedHeaders = (NSSet *)v9;

    v5->_defaultAlgorithm = 0;
  }

  v11 = v5;
LABEL_7:

  return v11;
}

- (AluminiumAuthenticator)initWithASCIIEncodedKey:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___AluminiumAuthenticator;
  v5 = -[AluminiumAuthenticator init](&v13, "init");
  if (v5)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 dataUsingEncoding:1]);
    key = v5->_key;
    v5->_key = (NSData *)v6;

    v8 = v5->_key;
    if (!v8 || !-[NSData length](v8, "length"))
    {
      v11 = 0LL;
      goto LABEL_7;
    }

    uint64_t v9 = objc_claimAutoreleasedReturnValue( +[AluminiumAuthenticator _defaultIncludedHeaders]( &OBJC_CLASS___AluminiumAuthenticator,  "_defaultIncludedHeaders"));
    defaultIncludedHeaders = v5->_defaultIncludedHeaders;
    v5->_defaultIncludedHeaders = (NSSet *)v9;

    v5->_defaultAlgorithm = 0;
  }

  v11 = v5;
LABEL_7:

  return v11;
}

- (BOOL)addAuthenticationHeadersToRequest:(id)a3 error:(id *)a4
{
  return -[AluminiumAuthenticator addAuthenticationHeadersToRequest:includedHeaders:body:algorithm:error:]( self,  "addAuthenticationHeadersToRequest:includedHeaders:body:algorithm:error:",  a3,  0LL,  0LL,  0xFFFFFFFFLL,  a4);
}

- (BOOL)addAuthenticationHeadersToRequest:(id)a3 includedHeaders:(id)a4 body:(id)a5 algorithm:(unsigned int)defaultAlgorithm error:(id *)a7
{
  id v12 = a3;
  objc_super v13 = (NSSet *)a4;
  id v14 = a5;
  if (a7) {
    *a7 = 0LL;
  }
  if (defaultAlgorithm == -1) {
    defaultAlgorithm = self->_defaultAlgorithm;
  }
  if (defaultAlgorithm < 6)
  {
    unint64_t v15 = qword_1000BD6D8[defaultAlgorithm];
    if (-[NSData length](self->_key, "length") < v15)
    {
      if (a7)
      {
        NSErrorUserInfoKey v91 = NSLocalizedDescriptionKey;
        v92 = @"Key size too short";
        v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v92,  &v91,  1LL));
        uint64_t v17 = 6LL;
LABEL_11:
        BOOL v18 = 0;
        *a7 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"AluminiumAuthenticatorErrorDomain",  v17,  v16));
LABEL_62:

        goto LABEL_63;
      }

      goto LABEL_12;
    }

    if (!v13) {
      objc_super v13 = self->_defaultIncludedHeaders;
    }
    v19 = v13;
    v20 = (NSSet *)objc_claimAutoreleasedReturnValue(-[NSSet _lowercaseSet](v13, "_lowercaseSet"));

    if (qword_1001252D0 != -1) {
      dispatch_once(&qword_1001252D0, &stru_1000F9A60);
    }
    id v78 = v14;
    unint64_t v75 = v15;
    v76 = self;
    if (!-[NSSet containsObject:](v20, "containsObject:", qword_1001252D8))
    {
      uint64_t v21 = objc_claimAutoreleasedReturnValue(-[NSSet setByAddingObject:](v20, "setByAddingObject:", qword_1001252D8));

      v20 = (NSSet *)v21;
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSSet allObjects](v20, "allObjects"));
    v16 = (void *)objc_claimAutoreleasedReturnValue([v22 sortedArrayUsingSelector:"compare:"]);

    v23 = (void *)objc_claimAutoreleasedReturnValue([v12 valueForHTTPHeaderField:@"X-Apple-HMAC-Sent-Timestamp"]);
    v24 = v23;
    if (!v23 || ![v23 length])
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      [v25 timeIntervalSince1970];
      uint64_t v27 = (uint64_t)(v26 * 1000.0);

      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%lld", v27));
      [v12 addValue:v28 forHTTPHeaderField:@"X-Apple-HMAC-Sent-Timestamp"];
    }

    v77 = v24;
    v29 = (void *)objc_claimAutoreleasedReturnValue([v12 URL]);
    v30 = (void *)objc_claimAutoreleasedReturnValue([v12 valueForHTTPHeaderField:@"Host"]);
    v80 = v20;
    if (-[NSSet containsObject:](v20, "containsObject:", @"host") && (!v30 || ![v30 length]))
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue([v29 host]);

      if (v32)
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue([v29 host]);
        [v12 addValue:v33 forHTTPHeaderField:@"Host"];
      }
    }

    id v79 = v30;
    id v81 = v29;
    v34 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v31);
    v35 = (void *)objc_claimAutoreleasedReturnValue([v12 HTTPMethod]);
    v36 = (void *)objc_claimAutoreleasedReturnValue([v35 lowercaseString]);
    unsigned int v37 = [v34 _addHMACComponent:v36 error:a7];

    id v83 = v34;
    if (v37)
    {
      id v38 = v81;
      v39 = (__CFString *)objc_claimAutoreleasedReturnValue([v81 path]);
      v40 = v39;
      if (!v39) {
        v39 = @"/";
      }
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString lowercaseString](v39, "lowercaseString"));
      unsigned int v42 = [v34 _addHMACComponent:v41 error:a7];

      if (v42)
      {
        v43 = (void *)objc_claimAutoreleasedReturnValue([v81 query]);
        objc_super v13 = v80;
        id v74 = v43;
        if (v43
          && (v44 = v43, [v43 length])
          && ![v83 _addHMACComponent:v44 error:a7])
        {
          BOOL v18 = 0;
          v55 = v77;
          id v14 = v78;
        }

        else
        {
          __int128 v86 = 0u;
          __int128 v87 = 0u;
          __int128 v84 = 0u;
          __int128 v85 = 0u;
          v73 = v16;
          id v45 = v16;
          id v46 = [v45 countByEnumeratingWithState:&v84 objects:v90 count:16];
          if (v46)
          {
            id v47 = v46;
            uint64_t v48 = *(void *)v85;
            id v82 = v45;
            while (2)
            {
              for (i = 0LL; i != v47; i = (char *)i + 1)
              {
                if (*(void *)v85 != v48) {
                  objc_enumerationMutation(v82);
                }
                uint64_t v50 = *(void *)(*((void *)&v84 + 1) + 8LL * (void)i);
                v51 = (void *)objc_claimAutoreleasedReturnValue([v12 valueForHTTPHeaderField:v50]);
                v52 = v51;
                if (v51
                  && [v51 length]
                  && (![v83 _addHMACComponent:v50 error:a7]
                   || ![v83 _addHMACComponent:v52 error:a7]))
                {

                  BOOL v18 = 0;
                  v55 = v77;
                  id v14 = v78;
                  v16 = v73;
                  id v38 = v81;
                  goto LABEL_59;
                }
              }

              id v45 = v82;
              id v47 = [v82 countByEnumeratingWithState:&v84 objects:v90 count:16];
              if (v47) {
                continue;
              }
              break;
            }
          }

          id v14 = v78;
          if (v78 && [v78 length])
          {
            v53 = (void *)objc_claimAutoreleasedReturnValue([v78 base64EncodedStringWithOptions:0]);
            id v54 = v83;
            [v83 addObject:v53];
          }

          else
          {
            id v54 = v83;
            [v83 addObject:&stru_1000FB848];
          }

          id v38 = v81;
          v56 = (void *)objc_claimAutoreleasedReturnValue([v54 componentsJoinedByString:@"|"]);
          v57 = (void *)objc_claimAutoreleasedReturnValue([v56 dataUsingEncoding:1]);

          if (v57)
          {
            uint64_t v72 = (uint64_t)&v72;
            id v59 = v78;
            unint64_t v60 = v75;
            __chkstk_darwin(v58);
            v61 = v76;
            id v62 = -[NSData bytes](v76->_key, "bytes");
            NSUInteger v63 = -[NSData length](v61->_key, "length");
            id v64 = v57;
            id v65 = [v64 bytes];
            id v82 = v64;
            CCHmac( defaultAlgorithm,  v62,  v63,  v65,  (size_t)[v64 length],  (char *)&v72 - ((v60 + 15) & 0xFFFFFFFFFFFFFFF0));
            v66 = (char *)&v72 - ((v60 + 15) & 0xFFFFFFFFFFFFFFF0LL);
            unint64_t v67 = v60;
            id v14 = v59;
            id v38 = v81;
            v68 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytesNoCopy:length:freeWhenDone:]( &OBJC_CLASS___NSData,  "dataWithBytesNoCopy:length:freeWhenDone:",  v66,  v67,  0LL));
            v69 = (void *)objc_claimAutoreleasedReturnValue([v68 base64EncodedStringWithOptions:0]);

            [v12 addValue:v69 forHTTPHeaderField:@"X-Apple-HMAC-Digest"];
            BOOL v18 = 1;
            v16 = v73;
            v55 = v77;
            objc_super v13 = v80;
          }

          else
          {
            id v82 = 0LL;
            objc_super v13 = v80;
            if (a7)
            {
              NSErrorUserInfoKey v88 = NSLocalizedDescriptionKey;
              v89 = @"Cannot encode HMAC text";
              v70 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v89,  &v88,  1LL));
              *a7 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"AluminiumAuthenticatorErrorDomain",  1LL,  v70));
            }

            BOOL v18 = 0;
            v16 = v73;
            v55 = v77;
          }

- (BOOL)verifyAuthenticationWithRequest:(__CFHTTPMessage *)a3 error:(id *)a4
{
  return -[AluminiumAuthenticator verifyAuthenticationWithRequest:includedHeaders:algorithm:error:]( self,  "verifyAuthenticationWithRequest:includedHeaders:algorithm:error:",  a3,  0LL,  0xFFFFFFFFLL,  a4);
}

- (BOOL)verifyAuthenticationWithRequest:(__CFHTTPMessage *)a3 includedHeaders:(id)a4 algorithm:(unsigned int)defaultAlgorithm error:(id *)a6
{
  v10 = (NSSet *)a4;
  if (a6) {
    *a6 = 0LL;
  }
  v11 = (__CFString *)CFHTTPMessageCopyHeaderFieldValue(a3, @"X-Apple-HMAC-Digest");
  id v12 = (__CFString *)CFHTTPMessageCopyHeaderFieldValue(a3, @"X-Apple-HMAC-Sent-Timestamp");
  if (!v11 || !-[__CFString length](v11, "length"))
  {
    if (a6)
    {
      NSErrorUserInfoKey v96 = NSLocalizedDescriptionKey;
      v97 = @"Missing digest header in HTTP request";
      BOOL v18 = &v97;
      v19 = &v96;
LABEL_18:
      objc_super v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v18,  v19,  1LL));
      BOOL v20 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"AluminiumAuthenticatorErrorDomain",  3LL,  v13));
      goto LABEL_19;
    }

- (NSSet)defaultIncludedHeaders
{
  return self->_defaultIncludedHeaders;
}

- (void)setDefaultIncludedHeaders:(id)a3
{
}

- (unsigned)defaultAlgorithm
{
  return self->_defaultAlgorithm;
}

- (void)setDefaultAlgorithm:(unsigned int)a3
{
  self->_defaultAlgorithm = a3;
}

- (void).cxx_destruct
{
}

@end