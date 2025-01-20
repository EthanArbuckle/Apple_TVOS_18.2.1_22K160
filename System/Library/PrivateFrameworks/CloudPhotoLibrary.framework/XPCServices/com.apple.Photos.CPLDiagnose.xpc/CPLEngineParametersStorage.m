@interface CPLEngineParametersStorage
+ (NSSet)defaultSupportedLibraryIdentifiers;
- (BOOL)isCPLEngineParametersStorageKey:(id)a3;
- (BOOL)removeParametersWithLibraryIdentifier:(id)a3 error:(id *)a4;
- (BOOL)saveParameters:(id)a3 error:(id *)a4;
- (CPLEngineParametersStorage)initWithBundleIdentifier:(id)a3;
- (CPLEngineParametersStorage)initWithUserDefaults:(id)a3 bundleIdentifier:(id)a4 supportedLibraryIdentifiers:(id)a5;
- (NSArray)allDefinedParameters;
- (NSSet)supportedLibraryIdentifiers;
- (NSString)bundleIdentifier;
- (id)_keyForInsanityForLibraryIdentifier:(id)a3;
- (id)_savedParametersForKey:(id)a3;
- (id)keyForLibraryIdentifier:(id)a3 error:(id *)a4;
- (id)parametersForLibraryIdentifier:(id)a3;
- (void)_removeKeyForInsanityForLibraryIdentifier:(id)a3;
- (void)_saveParameters:(id)a3 withKey:(id)a4;
- (void)_setKeyForInsanityIfNecessaryForParameters:(id)a3;
@end

@implementation CPLEngineParametersStorage

+ (NSSet)defaultSupportedLibraryIdentifiers
{
  if (qword_10003D340 != -1) {
    dispatch_once(&qword_10003D340, &stru_100030A40);
  }
  return (NSSet *)(id)qword_10003D338;
}

- (CPLEngineParametersStorage)initWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  id v6 = [(id)objc_opt_class(self) defaultSupportedLibraryIdentifiers];
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = -[CPLEngineParametersStorage initWithUserDefaults:bundleIdentifier:supportedLibraryIdentifiers:]( self,  "initWithUserDefaults:bundleIdentifier:supportedLibraryIdentifiers:",  v5,  v4,  v7);

  return v8;
}

- (CPLEngineParametersStorage)initWithUserDefaults:(id)a3 bundleIdentifier:(id)a4 supportedLibraryIdentifiers:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v42.receiver = self;
  v42.super_class = (Class)&OBJC_CLASS___CPLEngineParametersStorage;
  v12 = -[CPLEngineParametersStorage init](&v42, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_userDefaults, a3);
    v14 = (NSString *)[v10 copy];
    bundleIdentifier = v13->_bundleIdentifier;
    v13->_bundleIdentifier = v14;

    v16 = (NSSet *)[v11 copy];
    supportedLibraryIdentifiers = v13->_supportedLibraryIdentifiers;
    v13->_supportedLibraryIdentifiers = v16;

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults dictionaryForKey:](v13->_userDefaults, "dictionaryForKey:", @"CPLEngineInfo"));
    v19 = v18;
    if (!v18)
    {
LABEL_41:

      goto LABEL_42;
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:@"libraryIdentifier"]);
    if ([v20 isEqualToString:@"MobileSlideShow"])
    {
      if (!_CPLSilentLogging)
      {
        id v21 = sub_100002F28();
        v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v44 = v20;
          __int16 v45 = 2112;
          v46 = (void *)CPLLibraryIdentifierSystemLibrary;
          _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Automatically renaming %{public}@ to %@",  buf,  0x16u);
        }
      }

      id v23 = CPLLibraryIdentifierSystemLibrary;

      v20 = v23;
    }

    if (!v20)
    {
      v26 = 0LL;
      v24 = 0LL;
      goto LABEL_15;
    }

    v24 = (void *)objc_claimAutoreleasedReturnValue( -[CPLEngineParametersStorage keyForLibraryIdentifier:error:]( v13,  "keyForLibraryIdentifier:error:",  v20,  0LL));
    if (!v24)
    {
      v26 = 0LL;
      goto LABEL_15;
    }

    uint64_t v25 = objc_claimAutoreleasedReturnValue(-[CPLEngineParametersStorage _savedParametersForKey:](v13, "_savedParametersForKey:", v24));
    if (v25)
    {
      v26 = (void *)v25;
LABEL_15:
      if (_CPLSilentLogging)
      {
LABEL_40:
        -[NSUserDefaults removeObjectForKey:](v13->_userDefaults, "removeObjectForKey:", @"CPLEngineInfo", v36);

        goto LABEL_41;
      }

      id v27 = sub_100002F28();
      v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v44 = v20;
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Discarding old engine info for %{public}@",  buf,  0xCu);
      }

- (id)_savedParametersForKey:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults dictionaryForKey:](self->_userDefaults, "dictionaryForKey:", v4));
  if (v5)
  {
    id v6 = -[CPLEngineParameters initWithPlist:](objc_alloc(&OBJC_CLASS___CPLEngineParameters), "initWithPlist:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineParameters asPlist](v6, "asPlist"));
    if (([v7 isEqual:v5] & 1) == 0)
    {
      if (!_CPLSilentLogging)
      {
        id v8 = sub_100002F28();
        id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          int v11 = 138543874;
          id v12 = v4;
          __int16 v13 = 2112;
          v14 = v5;
          __int16 v15 = 2112;
          v16 = v7;
          _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Updating plist for %{public}@ from %@ to %@",  (uint8_t *)&v11,  0x20u);
        }
      }

      -[CPLEngineParametersStorage _saveParameters:withKey:](self, "_saveParameters:withKey:", v6, v4);
    }
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

- (void)_saveParameters:(id)a3 withKey:(id)a4
{
  id v6 = a4;
  id v7 = (id)objc_claimAutoreleasedReturnValue([a3 asPlist]);
  -[NSUserDefaults setObject:forKey:](self->_userDefaults, "setObject:forKey:", v7, v6);

  -[NSUserDefaults synchronize](self->_userDefaults, "synchronize");
}

- (id)keyForLibraryIdentifier:(id)a3 error:(id *)a4
{
  return objc_msgSend(@"CPLEngineParameters-", "stringByAppendingString:", a3, a4);
}

- (id)_keyForInsanityForLibraryIdentifier:(id)a3
{
  return [@"_CPLLibraryPathInsanityCheckDate." stringByAppendingString:a3];
}

- (void)_setKeyForInsanityIfNecessaryForParameters:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 cloudLibraryResourceStorageURL]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 lastPathComponent]);

  if (v6 && ([v6 isEqual:@"storage"] & 1) != 0)
  {
  }

  else
  {

    if (!_CPLSilentLogging)
    {
      id v7 = sub_100002F28();
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 libraryIdentifier]);
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 cloudLibraryResourceStorageURL]);
        int v15 = 138412546;
        v16 = v9;
        __int16 v17 = 2112;
        v18 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "Client asked to store some weird path for %@: %@",  (uint8_t *)&v15,  0x16u);
      }
    }

    userDefaults = self->_userDefaults;
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    __int16 v13 = (void *)objc_claimAutoreleasedReturnValue([v4 libraryIdentifier]);
    v14 = (void *)objc_claimAutoreleasedReturnValue( -[CPLEngineParametersStorage _keyForInsanityForLibraryIdentifier:]( self,  "_keyForInsanityForLibraryIdentifier:",  v13));
    -[NSUserDefaults setObject:forKey:](userDefaults, "setObject:forKey:", v12, v14);
  }
}

- (void)_removeKeyForInsanityForLibraryIdentifier:(id)a3
{
  userDefaults = self->_userDefaults;
  id v4 = (id)objc_claimAutoreleasedReturnValue( -[CPLEngineParametersStorage _keyForInsanityForLibraryIdentifier:]( self,  "_keyForInsanityForLibraryIdentifier:",  a3));
  -[NSUserDefaults removeObjectForKey:](userDefaults, "removeObjectForKey:", v4);
}

- (id)parametersForLibraryIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[CPLEngineParametersStorage keyForLibraryIdentifier:error:]( self,  "keyForLibraryIdentifier:error:",  v4,  0LL));
  if (!v5) {
    goto LABEL_4;
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineParametersStorage _savedParametersForKey:](self, "_savedParametersForKey:", v5));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 libraryIdentifier]);
  unsigned __int8 v8 = [v7 isEqualToString:v4];

  if ((v8 & 1) == 0)
  {

LABEL_4:
    id v6 = 0LL;
  }

  return v6;
}

- (BOOL)removeParametersWithLibraryIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[CPLEngineParametersStorage keyForLibraryIdentifier:error:]( self,  "keyForLibraryIdentifier:error:",  v6,  a4));
  if (v7)
  {
    -[NSUserDefaults removeObjectForKey:](self->_userDefaults, "removeObjectForKey:", v7);
    -[CPLEngineParametersStorage _removeKeyForInsanityForLibraryIdentifier:]( self,  "_removeKeyForInsanityForLibraryIdentifier:",  v6);
    -[NSUserDefaults synchronize](self->_userDefaults, "synchronize");
  }

  return v7 != 0LL;
}

- (BOOL)saveParameters:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 libraryIdentifier]);
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue( -[CPLEngineParametersStorage keyForLibraryIdentifier:error:]( self,  "keyForLibraryIdentifier:error:",  v7,  a4));

  if (v8)
  {
    -[CPLEngineParametersStorage _saveParameters:withKey:](self, "_saveParameters:withKey:", v6, v8);
    -[CPLEngineParametersStorage _setKeyForInsanityIfNecessaryForParameters:]( self,  "_setKeyForInsanityIfNecessaryForParameters:",  v6);
  }

  return v8 != 0LL;
}

- (BOOL)isCPLEngineParametersStorageKey:(id)a3
{
  return [a3 hasPrefix:@"CPLEngineParameters-"];
}

- (NSArray)allDefinedParameters
{
  v3 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSSet count](self->_supportedLibraryIdentifiers, "count"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[NSUserDefaults persistentDomainForName:]( self->_userDefaults,  "persistentDomainForName:",  self->_bundleIdentifier));
  id v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472LL;
  int v11 = sub_100003BF0;
  id v12 = &unk_100030A68;
  __int16 v13 = self;
  v5 = v3;
  v14 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:&v9];

  -[NSMutableArray sortUsingComparator:](v5, "sortUsingComparator:", &stru_100030AA8, v9, v10, v11, v12, v13);
  id v6 = v14;
  id v7 = v5;

  return v7;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSSet)supportedLibraryIdentifiers
{
  return self->_supportedLibraryIdentifiers;
}

- (void).cxx_destruct
{
}

@end