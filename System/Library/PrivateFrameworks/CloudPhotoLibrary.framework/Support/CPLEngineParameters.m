@interface CPLEngineParameters
+ (BOOL)supportsSecureCoding;
- (BOOL)matchesParameters:(id)a3;
- (CPLEngineParameters)initWithClientLibraryBaseURL:(id)a3 cloudLibraryStateStorageURL:(id)a4 cloudLibraryResourceStorageURL:(id)a5 libraryIdentifier:(id)a6 mainScopeIdentifier:(id)a7 options:(unint64_t)a8;
- (CPLEngineParameters)initWithCoder:(id)a3;
- (CPLEngineParameters)initWithPlist:(id)a3;
- (NSString)libraryIdentifier;
- (NSString)mainScopeIdentifier;
- (NSURL)clientLibraryBaseURL;
- (NSURL)cloudLibraryResourceStorageURL;
- (NSURL)cloudLibraryStateStorageURL;
- (id)asPlist;
- (id)description;
- (id)redactedDescription;
- (unint64_t)options;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CPLEngineParameters

- (CPLEngineParameters)initWithClientLibraryBaseURL:(id)a3 cloudLibraryStateStorageURL:(id)a4 cloudLibraryResourceStorageURL:(id)a5 libraryIdentifier:(id)a6 mainScopeIdentifier:(id)a7 options:(unint64_t)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___CPLEngineParameters;
  v19 = -[CPLEngineParameters init](&v31, "init");
  if (v19)
  {
    v20 = (NSURL *)[v14 copy];
    clientLibraryBaseURL = v19->_clientLibraryBaseURL;
    v19->_clientLibraryBaseURL = v20;

    v22 = (NSURL *)[v15 copy];
    cloudLibraryStateStorageURL = v19->_cloudLibraryStateStorageURL;
    v19->_cloudLibraryStateStorageURL = v22;

    v24 = (NSURL *)[v16 copy];
    cloudLibraryResourceStorageURL = v19->_cloudLibraryResourceStorageURL;
    v19->_cloudLibraryResourceStorageURL = v24;

    v26 = (NSString *)[v17 copy];
    libraryIdentifier = v19->_libraryIdentifier;
    v19->_libraryIdentifier = v26;

    v28 = (NSString *)[v18 copy];
    mainScopeIdentifier = v19->_mainScopeIdentifier;
    v19->_mainScopeIdentifier = v28;

    v19->_options = a8;
  }

  return v19;
}

- (CPLEngineParameters)initWithPlist:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    id v6 = v4;
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"libraryIdentifier"]);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"mainScopeIdentifier"]);
    v9 = v8;
    if (v8)
    {
      id v10 = v8;
    }

    else
    {
      uint64_t v12 = CPLPrimaryScopeIdentifierForCurrentUniverse();
      id v10 = (id)objc_claimAutoreleasedReturnValue(v12);
    }

    id v13 = v10;

    uint64_t v14 = objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"clientLibraryBasePath"]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"cloudLibraryStateStoragePath"]);
    uint64_t v16 = objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"cloudLibraryResourceStoragePath"]);
    if (v14) {
      uint64_t v17 = objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](&OBJC_CLASS___NSURL, "fileURLWithPath:isDirectory:", v14, 1LL));
    }
    else {
      uint64_t v17 = 0LL;
    }
    objc_super v31 = (void *)v17;
    v33 = (void *)v14;
    if (v15) {
      id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:isDirectory:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:isDirectory:",  v15,  1LL));
    }
    else {
      id v18 = 0LL;
    }
    v32 = v13;
    v19 = (void *)v7;
    uint64_t v29 = v16;
    if (v16)
    {
      uint64_t v20 = v16;
      v21 = self;
      v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:isDirectory:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:isDirectory:",  v20,  1LL,  v29));
    }

    else
    {
      v21 = self;
      v22 = 0LL;
    }

    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", @"options", v29));
    id v24 = [v23 integerValue];

    v11 = 0LL;
    if (v15)
    {
      v25 = v31;
      if (v31 && v22)
      {
        v26 = v21;
        v27 = v32;
        self =  -[CPLEngineParameters initWithClientLibraryBaseURL:cloudLibraryStateStorageURL:cloudLibraryResourceStorageURL:libraryIdentifier:mainScopeIdentifier:options:]( v26,  "initWithClientLibraryBaseURL:cloudLibraryStateStorageURL:cloudLibraryResourceStorageURL:libraryIdenti fier:mainScopeIdentifier:options:",  v31,  v18,  v22,  v19,  v32,  v24);
        v11 = self;
      }

      else
      {
        self = v21;
        v27 = v32;
      }
    }

    else
    {
      self = v21;
      v25 = v31;
      v27 = v32;
    }
  }

  else
  {
    v11 = 0LL;
  }

  return v11;
}

- (id)asPlist
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL path](self->_clientLibraryBaseURL, "path"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL path](self->_cloudLibraryStateStorageURL, "path"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL path](self->_cloudLibraryResourceStorageURL, "path"));
  v11[0] = @"clientLibraryBasePath";
  v11[1] = @"cloudLibraryStateStoragePath";
  v11[2] = @"cloudLibraryResourceStoragePath";
  v11[3] = @"libraryIdentifier";
  libraryIdentifier = self->_libraryIdentifier;
  mainScopeIdentifier = self->_mainScopeIdentifier;
  v12[2] = v5;
  v12[3] = libraryIdentifier;
  v12[4] = mainScopeIdentifier;
  v12[0] = v3;
  v12[1] = v4;
  v11[4] = @"mainScopeIdentifier";
  v11[5] = @"options";
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  self->_options));
  v12[5] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v12,  v11,  6LL));

  return v9;
}

- (id)description
{
  v3 = objc_alloc(&OBJC_CLASS___NSString);
  uint64_t v4 = objc_opt_class(self);
  libraryIdentifier = self->_libraryIdentifier;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL path](self->_clientLibraryBaseURL, "path"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByAbbreviatingWithTildeInPath]);
  v8 = -[NSString initWithFormat:](v3, "initWithFormat:", @"<%@ for %@ at %@>", v4, libraryIdentifier, v7);

  return v8;
}

- (id)redactedDescription
{
  v3 = objc_alloc(&OBJC_CLASS___NSString);
  uint64_t v4 = objc_opt_class(self);
  libraryIdentifier = self->_libraryIdentifier;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL path](self->_clientLibraryBaseURL, "path"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 lastPathComponent]);
  v8 = -[NSString initWithFormat:](v3, "initWithFormat:", @"<%@ for %@ at %@>", v4, libraryIdentifier, v7);

  return v8;
}

- (BOOL)matchesParameters:(id)a3
{
  id v4 = a3;
  clientLibraryBaseURL = self->_clientLibraryBaseURL;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 clientLibraryBaseURL]);
  if (sub_100023B8C((uint64_t)self, clientLibraryBaseURL, v6))
  {
    cloudLibraryStateStorageURL = self->_cloudLibraryStateStorageURL;
    v8 = (void *)objc_claimAutoreleasedReturnValue([v4 cloudLibraryStateStorageURL]);
    if (sub_100023B8C((uint64_t)self, cloudLibraryStateStorageURL, v8))
    {
      cloudLibraryResourceStorageURL = self->_cloudLibraryResourceStorageURL;
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 cloudLibraryResourceStorageURL]);
      if (sub_100023B8C((uint64_t)self, cloudLibraryResourceStorageURL, v10))
      {
        unint64_t v11 = self->_mainScopeIdentifier;
        uint64_t v12 = objc_claimAutoreleasedReturnValue([v4 mainScopeIdentifier]);
        uint64_t v13 = v12;
        BOOL v14 = v11 && v12 && ([(id)v11 isEqual:v12] & 1) != 0 || (v11 | v13) == 0;
      }

      else
      {
        BOOL v14 = 0;
      }
    }

    else
    {
      BOOL v14 = 0;
    }
  }

  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineParameters asPlist](self, "asPlist"));
  id v9 = 0LL;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v6,  200LL,  0LL,  &v9));
  id v8 = v9;

  if (!v7) {
    sub_10018ED28(self, (uint64_t)v8, (uint64_t)a2);
  }
  [v5 encodeObject:v7 forKey:@"data"];
}

- (CPLEngineParameters)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class(NSData) forKey:@"data"];
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if (v6)
  {
    id v12 = 0LL;
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v6,  0LL,  0LL,  &v12));
    id v8 = v12;
    if (v7)
    {
      self = -[CPLEngineParameters initWithPlist:](self, "initWithPlist:", v7);
      id v9 = self;
    }

    else
    {
      if (_CPLSilentLogging)
      {
        id v9 = 0LL;
        goto LABEL_10;
      }

      id v10 = sub_100023FDC();
      uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v14 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Invalid plist from coder: %@", buf, 0xCu);
      }

      id v9 = 0LL;
    }

LABEL_10:
    goto LABEL_11;
  }

  id v9 = 0LL;
LABEL_11:

  return v9;
}

- (NSURL)clientLibraryBaseURL
{
  return self->_clientLibraryBaseURL;
}

- (NSURL)cloudLibraryStateStorageURL
{
  return self->_cloudLibraryStateStorageURL;
}

- (NSURL)cloudLibraryResourceStorageURL
{
  return self->_cloudLibraryResourceStorageURL;
}

- (NSString)libraryIdentifier
{
  return self->_libraryIdentifier;
}

- (NSString)mainScopeIdentifier
{
  return self->_mainScopeIdentifier;
}

- (unint64_t)options
{
  return self->_options;
}

- (void).cxx_destruct
{
}

@end