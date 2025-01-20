@interface PDBarcodeServiceConnectionTask
+ (BOOL)supportsSecureCoding;
- (BOOL)isValid;
- (NSString)passUniqueIdentifier;
- (NSURL)barcodeServiceURL;
- (PDBarcodeServiceConnectionTask)initWithCoder:(id)a3;
- (const)backoffLevels;
- (id)bodyDictionary;
- (id)endpointComponents;
- (id)headerFields;
- (id)method;
- (id)queryFields;
- (id)request;
- (unint64_t)numberOfBackoffLevels;
- (void)encodeWithCoder:(id)a3;
- (void)handleResponse:(id)a3 data:(id)a4;
- (void)setBarcodeServiceURL:(id)a3;
- (void)setPassUniqueIdentifier:(id)a3;
@end

@implementation PDBarcodeServiceConnectionTask

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDBarcodeServiceConnectionTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___PDBarcodeServiceConnectionTask;
  v6 = -[PDNetworkTask initWithCoder:](&v15, "initWithCoder:", v4);
  if (v6)
  {
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSURL, v5),  @"barcodeServiceURL");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    barcodeServiceURL = v6->_barcodeServiceURL;
    v6->_barcodeServiceURL = (NSURL *)v8;

    id v11 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v10),  @"passUniqueIdentifier");
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    passUniqueIdentifier = v6->_passUniqueIdentifier;
    v6->_passUniqueIdentifier = (NSString *)v12;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PDBarcodeServiceConnectionTask;
  id v4 = a3;
  -[PDNetworkTask encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend( v4,  "encodeObject:forKey:",  self->_barcodeServiceURL,  @"barcodeServiceURL",  v5.receiver,  v5.super_class);
  [v4 encodeObject:self->_passUniqueIdentifier forKey:@"passUniqueIdentifier"];
}

- (id)method
{
  return 0LL;
}

- (id)endpointComponents
{
  return 0LL;
}

- (id)queryFields
{
  return 0LL;
}

- (id)headerFields
{
  v2 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  uint64_t v4 = PKRFC1123StringForDate();
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v5, @"Date");

  id v6 = -[NSMutableDictionary copy](v2, "copy");
  return v6;
}

- (id)bodyDictionary
{
  return 0LL;
}

- (const)backoffLevels
{
  return (const $82EDB067EE6F192B39F18594CC8676AD *)&_FasterBackoffLevels;
}

- (unint64_t)numberOfBackoffLevels
{
  return 7LL;
}

- (id)request
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PDBarcodeServiceConnectionTask barcodeServiceURL](self, "barcodeServiceURL"));
  __int128 v64 = 0u;
  __int128 v65 = 0u;
  __int128 v66 = 0u;
  __int128 v67 = 0u;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[PDBarcodeServiceConnectionTask endpointComponents](self, "endpointComponents"));
  id v5 = [v4 countByEnumeratingWithState:&v64 objects:v76 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v65;
    do
    {
      uint64_t v8 = 0LL;
      v9 = v3;
      do
      {
        if (*(void *)v65 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void **)(*((void *)&v64 + 1) + 8LL * (void)v8);
        id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet URLPathAllowedCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "URLPathAllowedCharacterSet"));
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v10 stringByAddingPercentEncodingWithAllowedCharacters:v11]);
        v3 = (void *)objc_claimAutoreleasedReturnValue([v9 URLByAppendingPathComponent:v12]);

        uint64_t v8 = (char *)v8 + 1;
        v9 = v3;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v64 objects:v76 count:16];
    }

    while (v6);
  }

  v51 = self;
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[PDBarcodeServiceConnectionTask queryFields](self, "queryFields"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue([v53 allKeys]);
  id v13 = [obj countByEnumeratingWithState:&v60 objects:v75 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v61;
    v16 = @"?";
    do
    {
      for (i = 0LL; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v61 != v15) {
          objc_enumerationMutation(obj);
        }
        v18 = *(void **)(*((void *)&v60 + 1) + 8LL * (void)i);
        v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet URLQueryAllowedCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "URLQueryAllowedCharacterSet"));
        v20 = (void *)objc_claimAutoreleasedReturnValue([v18 stringByAddingPercentEncodingWithAllowedCharacters:v19]);

        v21 = (void *)objc_claimAutoreleasedReturnValue([v53 objectForKey:v18]);
        v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet URLQueryAllowedCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "URLQueryAllowedCharacterSet"));
        v23 = (void *)objc_claimAutoreleasedReturnValue([v21 stringByAddingPercentEncodingWithAllowedCharacters:v22]);

        [v54 appendFormat:@"%@%@=%@", v16, v20, v23];
        v16 = @"&";
      }

      id v14 = [obj countByEnumeratingWithState:&v60 objects:v75 count:16];
    }

    while (v14);
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue([v3 absoluteString]);
  v25 = (void *)objc_claimAutoreleasedReturnValue([v24 stringByAppendingString:v54]);
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v25));

  v27 = -[NSMutableURLRequest initWithURL:](objc_alloc(&OBJC_CLASS___NSMutableURLRequest), "initWithURL:", v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[PDBarcodeServiceConnectionTask method](v51, "method"));
  -[NSMutableURLRequest setHTTPMethod:](v27, "setHTTPMethod:", v28);

  -[NSMutableURLRequest setHTTPShouldHandleCookies:](v27, "setHTTPShouldHandleCookies:", 0LL);
  -[NSMutableURLRequest setCachePolicy:](v27, "setCachePolicy:", 1LL);
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[PDBarcodeServiceConnectionTask headerFields](v51, "headerFields"));
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  v30 = (void *)objc_claimAutoreleasedReturnValue([v29 allKeys]);
  id v31 = [v30 countByEnumeratingWithState:&v56 objects:v74 count:16];
  if (v31)
  {
    id v32 = v31;
    uint64_t v33 = *(void *)v57;
    do
    {
      for (j = 0LL; j != v32; j = (char *)j + 1)
      {
        if (*(void *)v57 != v33) {
          objc_enumerationMutation(v30);
        }
        uint64_t v35 = *(void *)(*((void *)&v56 + 1) + 8LL * (void)j);
        v36 = (void *)objc_claimAutoreleasedReturnValue([v29 objectForKey:v35]);
        -[NSMutableURLRequest setValue:forHTTPHeaderField:](v27, "setValue:forHTTPHeaderField:", v36, v35);
      }

      id v32 = [v30 countByEnumeratingWithState:&v56 objects:v74 count:16];
    }

    while (v32);
  }

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[PDBarcodeServiceConnectionTask bodyDictionary](v51, "bodyDictionary"));
  if (v37)
  {
    id v55 = 0LL;
    v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v37,  0LL,  &v55));
    id v39 = v55;
    if (v38)
    {
      -[NSMutableURLRequest setHTTPBody:](v27, "setHTTPBody:", v38);
      -[NSMutableURLRequest setValue:forHTTPHeaderField:]( v27,  "setValue:forHTTPHeaderField:",  @"application/json",  @"Accept");
      -[NSMutableURLRequest setValue:forHTTPHeaderField:]( v27,  "setValue:forHTTPHeaderField:",  @"application/json",  @"Content-Type");
    }

    else
    {
      v40 = v26;
      uint64_t Object = PKLogFacilityTypeGetObject(28LL);
      v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v69 = v51;
        __int16 v70 = 2112;
        id v71 = v39;
        _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "Could not create body data task for task %@: %@",  buf,  0x16u);
      }

      v27 = 0LL;
      v26 = v40;
    }
  }

  uint64_t v43 = PKLogFacilityTypeGetObject(28LL);
  v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    v45 = (PDBarcodeServiceConnectionTask *)objc_claimAutoreleasedReturnValue(-[NSMutableURLRequest URL](v27, "URL"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableURLRequest allHTTPHeaderFields](v27, "allHTTPHeaderFields"));
    v47 = v26;
    v48 = (void *)objc_claimAutoreleasedReturnValue([v46 debugDescription]);
    v49 = (void *)objc_claimAutoreleasedReturnValue([v37 debugDescription]);
    *(_DWORD *)buf = 138412802;
    v69 = v45;
    __int16 v70 = 2112;
    id v71 = v48;
    __int16 v72 = 2112;
    v73 = v49;
    _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEFAULT,  "Auxiliary capability connection request:\n%@\n%@\n%@\n",  buf,  0x20u);

    v26 = v47;
  }

  return v27;
}

- (void)handleResponse:(id)a3 data:(id)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  a4,  0LL,  0LL));
  uint64_t Object = PKLogFacilityTypeGetObject(28LL);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v5 URL]);
    id v10 = [v5 statusCode];
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 allHeaderFields]);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 debugDescription]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 debugDescription]);
    int v14 = 138413058;
    uint64_t v15 = v9;
    __int16 v16 = 2048;
    id v17 = v10;
    __int16 v18 = 2112;
    v19 = v12;
    __int16 v20 = 2112;
    v21 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Auxiliary capability connection response:\n%@ %ld\n%@\n%@\n",  (uint8_t *)&v14,  0x2Au);
  }
}

- (BOOL)isValid
{
  return self->_barcodeServiceURL != 0LL;
}

- (NSURL)barcodeServiceURL
{
  return self->_barcodeServiceURL;
}

- (void)setBarcodeServiceURL:(id)a3
{
}

- (NSString)passUniqueIdentifier
{
  return self->_passUniqueIdentifier;
}

- (void)setPassUniqueIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end