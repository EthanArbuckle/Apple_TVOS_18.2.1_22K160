@interface CPLPrivateEngineAlias
+ (BOOL)registerPrivateEngineAlias:(id)a3 error:(id *)a4;
+ (BOOL)unregisterPrivateEngineAliasWithName:(id)a3 error:(id *)a4;
+ (NSArray)registeredAliasNames;
+ (NSArray)registeredAliases;
+ (NSString)privateEngineAliasPathEnvKey;
+ (NSString)privateEnginePathEnvKey;
+ (id)_defaultBaseURL;
+ (id)_destinationURL;
+ (id)privateEngineAliasWithName:(id)a3;
+ (unint64_t)baseLibraryOptions;
+ (void)_loadNonBuiltinAliases;
+ (void)_registerAliases;
+ (void)_registerPrivateEngineAlias:(id)a3 builtin:(BOOL)a4;
+ (void)_saveNonBuiltinAliases;
+ (void)setOverridePrivateEngineAliasPath:(id)a3;
- (CPLPrivateEngineAlias)initWithName:(id)a3 mainScopeIdentifier:(id)a4 libraryIdentifier:(id)a5 libraryOptions:(unint64_t)a6 baseURL:(id)a7;
- (CPLPrivateEngineAlias)initWithName:(id)a3 universeName:(id)a4 libraryIdentifier:(id)a5 libraryOptions:(unint64_t)a6 baseURL:(id)a7;
- (CPLPrivateEngineAlias)initWithPlist:(id)a3;
- (NSString)aliasName;
- (NSString)libraryIdentifier;
- (NSString)mainScopeIdentifier;
- (NSString)universeName;
- (NSURL)baseURL;
- (NSURL)cplDirectoryURL;
- (id)asPlist;
- (id)newLibraryManager;
- (unint64_t)libraryOptions;
@end

@implementation CPLPrivateEngineAlias

+ (id)_defaultBaseURL
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 environment]);

  v4 = (void *)objc_claimAutoreleasedReturnValue( +[CPLPrivateEngineAlias privateEnginePathEnvKey]( &OBJC_CLASS___CPLPrivateEngineAlias,  "privateEnginePathEnvKey"));
  uint64_t v5 = objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:v4]);
  if (v5)
  {
    v6 = (void *)v5;
  }

  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"TMPDIR"]);

    if (!v6)
    {
      v7 = -[NSURL initFileURLWithPath:isDirectory:]( objc_alloc(&OBJC_CLASS___NSURL),  "initFileURLWithPath:isDirectory:",  @"/var/tmp",  1LL);
      goto LABEL_5;
    }
  }

  v7 = -[NSURL initFileURLWithPath:isDirectory:]( objc_alloc(&OBJC_CLASS___NSURL),  "initFileURLWithPath:isDirectory:",  v6,  1LL);

LABEL_5:
  return v7;
}

+ (void)_registerAliases
{
  if (![(id)qword_10003D378 count])
  {
    if (!qword_10003D380)
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
      v4 = (void *)objc_claimAutoreleasedReturnValue([v3 environment]);
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[CPLPrivateEngineAlias privateEngineAliasPathEnvKey]( &OBJC_CLASS___CPLPrivateEngineAlias,  "privateEngineAliasPathEnvKey"));
      uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v5]);
      v7 = (void *)qword_10003D380;
      qword_10003D380 = v6;
    }

    byte_10003D388 = 1;
    v8 = objc_alloc(&OBJC_CLASS___CPLPrivateEngineAlias);
    v9 = -[CPLPrivateEngineAlias initWithName:universeName:libraryIdentifier:libraryOptions:baseURL:]( v8,  "initWithName:universeName:libraryIdentifier:libraryOptions:baseURL:",  silentMoverEngineAliasName,  silentMoverEngineUniverseName,  @"CPLSilentMoverLib",  8LL,  0LL);
    [a1 _registerPrivateEngineAlias:v9 builtin:1];

    v10 = objc_alloc(&OBJC_CLASS___CPLPrivateEngineAlias);
    v11 = -[CPLPrivateEngineAlias initWithName:universeName:libraryIdentifier:libraryOptions:baseURL:]( v10,  "initWithName:universeName:libraryIdentifier:libraryOptions:baseURL:",  normalCPLEngineAliasName,  0LL,  @"CPLPrimarySync",  9LL,  0LL);
    [a1 _registerPrivateEngineAlias:v11 builtin:1];

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    unsigned int v13 = [v12 BOOLForKey:@"CPLTestPrivateEngineDisableScopeSync"];

    if (v13) {
      uint64_t v14 = 9LL;
    }
    else {
      uint64_t v14 = 1035LL;
    }
    v15 = -[CPLPrivateEngineAlias initWithName:universeName:libraryIdentifier:libraryOptions:baseURL:]( objc_alloc(&OBJC_CLASS___CPLPrivateEngineAlias),  "initWithName:universeName:libraryIdentifier:libraryOptions:baseURL:",  @"tests",  @"UnitTests",  @"CPLUnitTests",  v14,  0LL);
    [a1 _registerPrivateEngineAlias:v15 builtin:1];

    [a1 _loadNonBuiltinAliases];
  }

+ (unint64_t)baseLibraryOptions
{
  if (byte_10003D388) {
    return 8LL;
  }
  else {
    return 0LL;
  }
}

+ (NSString)privateEnginePathEnvKey
{
  return (NSString *)@"CPL_PRIVATE_ENGINE_PATH";
}

+ (NSString)privateEngineAliasPathEnvKey
{
  return (NSString *)@"CPL_PRIVATE_ENGINE_ALIAS_PATH";
}

+ (void)setOverridePrivateEngineAliasPath:(id)a3
{
}

+ (id)_destinationURL
{
  if (qword_10003D380) {
    id v2 = (id)qword_10003D380;
  }
  else {
    id v2 = (id)objc_claimAutoreleasedReturnValue([@"~/.cplprivateengines.plist" stringByExpandingTildeInPath]);
  }
  v3 = v2;
  v4 = -[NSURL initFileURLWithPath:isDirectory:]( objc_alloc(&OBJC_CLASS___NSURL),  "initFileURLWithPath:isDirectory:",  v2,  0LL);

  return v4;
}

+ (void)_saveNonBuiltinAliases
{
  v3 = objc_alloc(&OBJC_CLASS___NSMutableArray);
  v4 = -[NSMutableArray initWithCapacity:](v3, "initWithCapacity:", [(id)qword_10003D390 count]);
  uint64_t v5 = (void *)qword_10003D390;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100008EE4;
  v8[3] = &unk_100030D10;
  v9 = v4;
  v7 = v4;
  [v5 enumerateKeysAndObjectsUsingBlock:v8];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([a1 _destinationURL]);
  -[NSMutableArray writeToURL:error:](v7, "writeToURL:error:", v6, 0LL);
}

+ (void)_loadNonBuiltinAliases
{
  v3 = objc_alloc(&OBJC_CLASS___NSArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue([a1 _destinationURL]);
  uint64_t v5 = -[NSArray initWithContentsOfURL:error:](v3, "initWithContentsOfURL:error:", v4, 0LL);

  if (v5)
  {
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    uint64_t v6 = v5;
    id v7 = -[NSArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        v10 = 0LL;
        do
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8LL * (void)v10);
          v12 = objc_alloc(&OBJC_CLASS___CPLPrivateEngineAlias);
          unsigned int v13 = -[CPLPrivateEngineAlias initWithPlist:](v12, "initWithPlist:", v11, (void)v14);
          if (v13) {
            [a1 _registerPrivateEngineAlias:v13 builtin:0];
          }

          v10 = (char *)v10 + 1;
        }

        while (v8 != v10);
        id v8 = -[NSArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
      }

      while (v8);
    }
  }
}

+ (BOOL)registerPrivateEngineAlias:(id)a3 error:(id *)a4
{
  id v6 = a3;
  [a1 _registerAliases];
  id v7 = (void *)qword_10003D378;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 aliasName]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v8]);

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v6 aliasName]);

    id v11 = (id)objc_claimAutoreleasedReturnValue( +[CPLErrors cplErrorWithCode:description:]( &OBJC_CLASS___CPLErrors,  "cplErrorWithCode:description:",  150LL,  @"Alias %@ is already registered",  v10));
    if (a4)
    {
      id v11 = v11;
      *a4 = v11;
    }
  }

  else
  {
    [a1 _registerPrivateEngineAlias:v6 builtin:0];

    [a1 _saveNonBuiltinAliases];
    id v11 = 0LL;
  }

  return v9 == 0LL;
}

+ (void)_registerPrivateEngineAlias:(id)a3 builtin:(BOOL)a4
{
  id v5 = a3;
  id v6 = (void *)qword_10003D378;
  id v14 = v5;
  if (!qword_10003D378)
  {
    id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    id v8 = (void *)qword_10003D378;
    qword_10003D378 = (uint64_t)v7;

    uint64_t v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v10 = (void *)qword_10003D390;
    qword_10003D390 = (uint64_t)v9;

    id v5 = v14;
    id v6 = (void *)qword_10003D378;
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 aliasName]);
  [v6 setObject:v14 forKeyedSubscript:v11];

  if (!a4)
  {
    v12 = (void *)qword_10003D390;
    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v14 aliasName]);
    [v12 setObject:v14 forKeyedSubscript:v13];
  }
}

+ (BOOL)unregisterPrivateEngineAliasWithName:(id)a3 error:(id *)a4
{
  id v6 = a3;
  [a1 _registerAliases];
  id v7 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_10003D378 objectForKeyedSubscript:v6]);

  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_10003D390 objectForKeyedSubscript:v6]);

    if (v8)
    {
      [(id)qword_10003D378 removeObjectForKey:v6];
      [(id)qword_10003D390 removeObjectForKey:v6];
      [a1 _saveNonBuiltinAliases];
      [a1 _saveNonBuiltinAliases];
      id v9 = 0LL;
      BOOL v10 = 1;
      goto LABEL_9;
    }

    id v11 = @"Can't registered builtin alias %@";
  }

  else
  {
    id v11 = @"Unknown alias %@";
  }

  id v9 = (id)objc_claimAutoreleasedReturnValue( +[CPLErrors cplErrorWithCode:description:]( &OBJC_CLASS___CPLErrors,  "cplErrorWithCode:description:",  150LL,  v11,  v6));
  if (a4)
  {
    id v9 = v9;
    BOOL v10 = 0;
    *a4 = v9;
  }

  else
  {
    BOOL v10 = 0;
  }

+ (id)privateEngineAliasWithName:(id)a3
{
  id v4 = a3;
  [a1 _registerAliases];
  id v5 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_10003D378 objectForKeyedSubscript:v4]);

  return v5;
}

+ (NSArray)registeredAliasNames
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_10003D378 allKeys]);
  v3 = v2;
  if (!v2) {
    id v2 = &__NSArray0__struct;
  }
  id v4 = v2;

  return v4;
}

+ (NSArray)registeredAliases
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_10003D378 allValues]);
  v3 = v2;
  if (!v2) {
    id v2 = &__NSArray0__struct;
  }
  id v4 = v2;

  return v4;
}

- (CPLPrivateEngineAlias)initWithName:(id)a3 mainScopeIdentifier:(id)a4 libraryIdentifier:(id)a5 libraryOptions:(unint64_t)a6 baseURL:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  if (!v15)
  {
    id v16 = [(id)objc_opt_class(self) _defaultBaseURL];
    id v15 = (id)objc_claimAutoreleasedReturnValue(v16);
  }

  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___CPLPrivateEngineAlias;
  __int128 v17 = -[CPLPrivateEngineAlias init](&v30, "init");
  if (v17)
  {
    v18 = (NSString *)[v12 copy];
    aliasName = v17->_aliasName;
    v17->_aliasName = v18;

    v20 = (NSString *)[v13 copy];
    mainScopeIdentifier = v17->_mainScopeIdentifier;
    v17->_mainScopeIdentifier = v20;

    v22 = (NSString *)[v14 copy];
    libraryIdentifier = v17->_libraryIdentifier;
    v17->_libraryIdentifier = v22;

    v17->_libraryOptions = a6;
    v24 = (NSURL *)[v15 copy];
    baseURL = v17->_baseURL;
    v17->_baseURL = v24;

    v26 = (void *)objc_claimAutoreleasedReturnValue([v15 URLByAppendingPathComponent:v14]);
    uint64_t v27 = objc_claimAutoreleasedReturnValue([v26 URLByAppendingPathExtension:@"cpltestlibrary"]);
    cplDirectoryURL = v17->_cplDirectoryURL;
    v17->_cplDirectoryURL = (NSURL *)v27;
  }

  return v17;
}

- (CPLPrivateEngineAlias)initWithName:(id)a3 universeName:(id)a4 libraryIdentifier:(id)a5 libraryOptions:(unint64_t)a6 baseURL:(id)a7
{
  id v12 = a7;
  id v13 = a5;
  id v14 = a3;
  uint64_t v15 = CPLPrimaryScopeIdentifierForUniverseName(a4);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  __int128 v17 = -[CPLPrivateEngineAlias initWithName:mainScopeIdentifier:libraryIdentifier:libraryOptions:baseURL:]( self,  "initWithName:mainScopeIdentifier:libraryIdentifier:libraryOptions:baseURL:",  v14,  v16,  v13,  a6,  v12);

  return v17;
}

- (CPLPrivateEngineAlias)initWithPlist:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"name"]);
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"identifier"]);
    id v8 = (void *)v7;
    id v9 = 0LL;
    if (!v6 || !v7) {
      goto LABEL_30;
    }
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v6, v10) & 1) == 0
      || (uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSString), (objc_opt_isKindOfClass(v8, v11) & 1) == 0))
    {
      id v9 = 0LL;
LABEL_30:

      goto LABEL_31;
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"path"]);
    if (v12)
    {
      uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSString);
      if ((objc_opt_isKindOfClass(v12, v13) & 1) == 0)
      {
        id v9 = 0LL;
LABEL_29:

        goto LABEL_30;
      }
    }

    id v14 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"mainScopeIdentifier"]);
    if (v14) {
      goto LABEL_12;
    }
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"universe"]);
    if (v15)
    {
      uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSString);
      if ((objc_opt_isKindOfClass(v15, v16) & 1) == 0)
      {
        id v14 = 0LL;
        goto LABEL_24;
      }
    }

    uint64_t v17 = CPLPrimaryScopeIdentifierForUniverseName(v15);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(v17);

    if (v14)
    {
LABEL_12:
      uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSString);
      if ((objc_opt_isKindOfClass(v14, v18) & 1) != 0)
      {
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"options"]);
        if (!v15)
        {
          id v20 = [(id)objc_opt_class(self) baseLibraryOptions];
          goto LABEL_21;
        }

        uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSNumber);
        if ((objc_opt_isKindOfClass(v15, v19) & 1) != 0)
        {
          id v20 = [v15 integerValue];
LABEL_21:
          id v21 = v20;
          if (v12) {
            v22 = -[NSURL initFileURLWithPath:isDirectory:]( objc_alloc(&OBJC_CLASS___NSURL),  "initFileURLWithPath:isDirectory:",  v12,  0LL);
          }
          else {
            v22 = 0LL;
          }
          self =  -[CPLPrivateEngineAlias initWithName:mainScopeIdentifier:libraryIdentifier:libraryOptions:baseURL:]( self,  "initWithName:mainScopeIdentifier:libraryIdentifier:libraryOptions:baseURL:",  v6,  v14,  v8,  v21,  v22);

          id v9 = self;
          goto LABEL_27;
        }

- (id)asPlist
{
  v15[0] = @"name";
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrivateEngineAlias aliasName](self, "aliasName"));
  v16[0] = v3;
  v15[1] = @"identifier";
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrivateEngineAlias libraryIdentifier](self, "libraryIdentifier"));
  v16[1] = v4;
  v15[2] = @"mainScopeIdentifier";
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[CPLPrivateEngineAlias mainScopeIdentifier](self, "mainScopeIdentifier"));
  v16[2] = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v16,  v15,  3LL));
  id v7 = [v6 mutableCopy];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrivateEngineAlias baseURL](self, "baseURL"));
  id v9 = [(id)objc_opt_class(self) _defaultBaseURL];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  LOBYTE(v5) = [v8 isEqual:v10];

  if ((v5 & 1) == 0)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrivateEngineAlias baseURL](self, "baseURL"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 path]);
    [v7 setObject:v12 forKeyedSubscript:@"path"];
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  self->_libraryOptions));
  [v7 setObject:v13 forKeyedSubscript:@"options"];

  return v7;
}

- (NSString)universeName
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrivateEngineAlias mainScopeIdentifier](self, "mainScopeIdentifier"));
  uint64_t v3 = CPLUniverseNameFromMainScopeIdentifier();
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return (NSString *)v4;
}

- (id)newLibraryManager
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( -[NSURL URLByAppendingPathComponent:]( self->_cplDirectoryURL,  "URLByAppendingPathComponent:",  @"state"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[NSURL URLByAppendingPathComponent:]( self->_cplDirectoryURL,  "URLByAppendingPathComponent:",  @"resources"));
  id v5 = [[CPLLibraryManager alloc] initWithClientLibraryBaseURL:self->_cplDirectoryURL cloudLibraryStateStorageURL:v3 cloudLibraryResourceStorageURL:v4 libraryIdentifier:self->_libraryIdentifier mainS copeIdentifier:self->_mainScopeIdentifier options:self->_libraryOptions];

  return v5;
}

- (NSString)aliasName
{
  return self->_aliasName;
}

- (NSString)mainScopeIdentifier
{
  return self->_mainScopeIdentifier;
}

- (NSString)libraryIdentifier
{
  return self->_libraryIdentifier;
}

- (unint64_t)libraryOptions
{
  return self->_libraryOptions;
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (NSURL)cplDirectoryURL
{
  return self->_cplDirectoryURL;
}

- (void).cxx_destruct
{
}

@end