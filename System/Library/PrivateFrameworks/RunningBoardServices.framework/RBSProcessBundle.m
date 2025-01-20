@interface RBSProcessBundle
+ (BOOL)supportsRBSXPCSecureCoding;
+ (id)bundleWithDataSource:(id)a3;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)executablePath;
- (NSString)extensionPointIdentifier;
- (NSString)identifier;
- (NSString)path;
- (RBSProcessBundle)initWithRBSXPCCoder:(id)a3;
- (RBSProcessInstance)instance;
- (id)bundleInfoValueForKey:(id)a3;
- (id)bundleInfoValuesForKeys:(id)a3;
- (void)encodeWithRBSXPCCoder:(id)a3;
- (void)setInstance:(id)a3;
@end

@implementation RBSProcessBundle

+ (id)bundleWithDataSource:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___RBSProcessBundle);
  objc_storeWeak((id *)&v4->_dataSource, v3);
  uint64_t v5 = [v3 bundleIdentifier];
  identifier = v4->_identifier;
  v4->_identifier = (NSString *)v5;

  uint64_t v7 = [v3 bundlePath];
  path = v4->_path;
  v4->_path = (NSString *)v7;

  uint64_t v9 = [v3 executablePath];
  executablePath = v4->_executablePath;
  v4->_executablePath = (NSString *)v9;

  uint64_t v11 = [v3 extensionPointIdentifier];

  extensionPointIdentifier = v4->_extensionPointIdentifier;
  v4->_extensionPointIdentifier = (NSString *)v11;

  return v4;
}

- (id)bundleInfoValueForKey:(id)a3
{
  v12[1] = *MEMORY[0x1895F89C0];
  id v5 = a3;
  NSClassFromString(@"NSString");
  if (!v5)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 handleFailureInMethod:a2, self, @"RBSProcessBundle.m", 43, @"Invalid condition not satisfying: %@", @"object != nil" object file lineNumber description];
  }

  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    [MEMORY[0x1896077D8] currentHandler];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 handleFailureInMethod:a2, self, @"RBSProcessBundle.m", 43, @"Invalid condition not satisfying: %@", @"[object isKindOfClass:NSStringClass]" object file lineNumber description];
  }

  v12[0] = v5;
  [MEMORY[0x189603F18] arrayWithObjects:v12 count:1];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBSProcessBundle bundleInfoValuesForKeys:](self, "bundleInfoValuesForKeys:", v6);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 objectForKey:v5];
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)bundleInfoValuesForKeys:(id)a3
{
  uint64_t v48 = *MEMORY[0x1895F89C0];
  id v35 = a3;
  if ([v35 count])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    v34 = WeakRetained;
    if (WeakRetained)
    {
      [WeakRetained bundleInfoValuesForKeys:v35];
      id v5 = (id)objc_claimAutoreleasedReturnValue();
    }

    else if (self->_instance)
    {
      v6 = self;
      objc_sync_enter(v6);
      [MEMORY[0x189604010] setWithArray:v35];
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (void *)[v32 mutableCopy];
      uint64_t v7 = (void *)MEMORY[0x189604010];
      v8 = -[NSDictionary allKeys](v6->_plistValues, "allKeys");
      [v7 setWithArray:v8];
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v33 minusSet:v9];

      if ([v33 count])
      {
        v10 = +[RBSConnection sharedInstance](&OBJC_CLASS___RBSConnection, "sharedInstance");
        [v10 infoPlistResultForInstance:self->_instance forKeys:v35 error:0];
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

        [MEMORY[0x189603FC8] dictionaryWithDictionary:v6->_plistValues];
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        __int128 v42 = 0u;
        __int128 v43 = 0u;
        __int128 v40 = 0u;
        __int128 v41 = 0u;
        id v13 = v33;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v40 objects:v47 count:16];
        if (v14)
        {
          uint64_t v15 = *(void *)v41;
          do
          {
            for (uint64_t i = 0LL; i != v14; ++i)
            {
              if (*(void *)v41 != v15) {
                objc_enumerationMutation(v13);
              }
              uint64_t v17 = *(void *)(*((void *)&v40 + 1) + 8 * i);
              [v11 objectForKey:v17];
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              if (v18)
              {
                [v12 setObject:v18 forKey:v17];
              }

              else
              {
                [MEMORY[0x189603FE8] null];
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                [v12 setObject:v19 forKey:v17];
              }
            }

            uint64_t v14 = [v13 countByEnumeratingWithState:&v40 objects:v47 count:16];
          }

          while (v14);
        }

        uint64_t v20 = [v12 copy];
        plistValues = v6->_plistValues;
        v6->_plistValues = (NSDictionary *)v20;
      }

      id v5 = objc_alloc_init(MEMORY[0x189603FC8]);
      __int128 v38 = 0u;
      __int128 v39 = 0u;
      __int128 v36 = 0u;
      __int128 v37 = 0u;
      id v22 = v32;
      uint64_t v23 = [v22 countByEnumeratingWithState:&v36 objects:v46 count:16];
      if (v23)
      {
        uint64_t v24 = *(void *)v37;
        do
        {
          for (uint64_t j = 0LL; j != v23; ++j)
          {
            if (*(void *)v37 != v24) {
              objc_enumerationMutation(v22);
            }
            uint64_t v26 = *(void *)(*((void *)&v36 + 1) + 8 * j);
            v27 = -[NSDictionary objectForKey:](v6->_plistValues, "objectForKey:", v26);
            if (v27)
            {
              [MEMORY[0x189603FE8] null];
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              BOOL v29 = v27 == v28;

              if (!v29) {
                [v5 setObject:v27 forKey:v26];
              }
            }
          }

          uint64_t v23 = [v22 countByEnumeratingWithState:&v36 objects:v46 count:16];
        }

        while (v23);
      }

      objc_sync_exit(v6);
    }

    else
    {
      rbs_process_log();
      v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v45 = self;
        _os_log_impl( &dword_185F67000,  v30,  OS_LOG_TYPE_DEFAULT,  "Cannot fetch info.plist values: no data source found for bundle: %{public}@",  buf,  0xCu);
      }

      id v5 = 0LL;
    }
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

- (NSString)description
{
  id v3 = objc_alloc(NSString);
  [(id)objc_opt_class() description];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v5 = (void *)[v3 initWithFormat:@"<%@| id:%@ path:%@>", v4, self->_identifier, self->_path];

  return (NSString *)v5;
}

- (NSString)debugDescription
{
  id v3 = objc_alloc(NSString);
  [(id)objc_opt_class() description];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v10 = *(_OWORD *)&self->_identifier;
  executablePath = self->_executablePath;
  extensionPointIdentifier = self->_extensionPointIdentifier;
  -[NSDictionary entriesToStringWithIndent:debug:](self->_plistValues, "entriesToStringWithIndent:debug:", 0LL, 1LL);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)[v3 initWithFormat:@"<%@| id:%@ path:%@ executablePath:%@ extensionPoint:%@ Info.plist values:\n%@\n    >", v4, v10, executablePath, extensionPointIdentifier, v7];

  return (NSString *)v8;
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  identifier = self->_identifier;
  id v9 = v4;
  if (identifier)
  {
    [v4 encodeObject:identifier forKey:@"_identifier"];
    id v4 = v9;
  }

  path = self->_path;
  if (path)
  {
    [v9 encodeObject:path forKey:@"_path"];
    id v4 = v9;
  }

  executablePath = self->_executablePath;
  if (executablePath)
  {
    [v9 encodeObject:executablePath forKey:@"_executablePath"];
    id v4 = v9;
  }

  extensionPointIdentifier = self->_extensionPointIdentifier;
  if (extensionPointIdentifier)
  {
    [v9 encodeObject:extensionPointIdentifier forKey:@"_extensionPointIdentifier"];
    id v4 = v9;
  }
}

- (RBSProcessBundle)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___RBSProcessBundle;
  id v5 = -[RBSProcessBundle init](&v15, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 decodeStringForKey:@"_identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeStringForKey:@"_path"];
    path = v5->_path;
    v5->_path = (NSString *)v8;

    uint64_t v10 = [v4 decodeStringForKey:@"_executablePath"];
    executablePath = v5->_executablePath;
    v5->_executablePath = (NSString *)v10;

    uint64_t v12 = [v4 decodeStringForKey:@"_extensionPointIdentifier"];
    extensionPointIdentifier = v5->_extensionPointIdentifier;
    v5->_extensionPointIdentifier = (NSString *)v12;
  }

  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)path
{
  return self->_path;
}

- (NSString)executablePath
{
  return self->_executablePath;
}

- (NSString)extensionPointIdentifier
{
  return self->_extensionPointIdentifier;
}

- (RBSProcessInstance)instance
{
  return self->_instance;
}

- (void)setInstance:(id)a3
{
}

- (void).cxx_destruct
{
}

@end