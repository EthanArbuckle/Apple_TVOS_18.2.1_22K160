@interface OSASubmissionPolicy
- (BOOL)hasTasking;
- (BOOL)ignoreProxies;
- (NSDictionary)latestResults;
- (NSMutableDictionary)scanOptions;
- (OSASubmissionPolicy)init;
- (OSASubmissionPolicy)initWithTemplate:(id)a3 options:(id)a4;
- (id)_loadPreviousResults;
- (id)buildSubmissionTemplateForConfig:(id)a3;
- (id)shouldSubmitRouting:(id)a3;
- (void)persist;
- (void)registerRouting:(id)a3 result:(BOOL)a4;
- (void)setIgnoreProxies:(BOOL)a3;
@end

@implementation OSASubmissionPolicy

- (OSASubmissionPolicy)init
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___OSASubmissionPolicy;
  v2 = -[OSASubmissionPolicy init](&v32, sel_init);
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = -[OSASubmissionPolicy _loadPreviousResults](v2, "_loadPreviousResults");
    results = v3->_results;
    v3->_results = (NSMutableDictionary *)v4;

    if (!v3->_results)
    {
      uint64_t v6 = objc_opt_new();
      v7 = v3->_results;
      v3->_results = (NSMutableDictionary *)v6;
    }

    uint64_t v8 = objc_opt_new();
    allowOptOutByRouting = v3->_allowOptOutByRouting;
    v3->_allowOptOutByRouting = (NSMutableSet *)v8;

    uint64_t v10 = objc_opt_new();
    scanOptions = v3->_scanOptions;
    v3->_scanOptions = (NSMutableDictionary *)v10;

    [MEMORY[0x189611B08] sharedInstance];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 submissionParam:@"templates"];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = [v13 objectForKeyedSubscript:@"default"];
    default_template = v3->_default_template;
    v3->_default_template = (NSArray *)v14;

    objc_storeStrong((id *)&v3->_primary_template, v3->_default_template);
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    v16 = v3->_default_template;
    uint64_t v17 = -[NSArray countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v28,  v33,  16LL);
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v29;
      do
      {
        for (uint64_t i = 0LL; i != v18; ++i)
        {
          if (*(void *)v29 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          [v21 objectForKeyedSubscript:@"policy"];
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          [v22 objectForKeyedSubscript:@"allow-optout"];
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          int v24 = [v23 BOOLValue];

          if (v24)
          {
            v25 = v3->_allowOptOutByRouting;
            [v21 objectForKeyedSubscript:@"routing"];
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableSet addObject:](v25, "addObject:", v26);
          }
        }

        uint64_t v18 = -[NSArray countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v28,  v33,  16LL);
      }

      while (v18);
    }
  }

  return v3;
}

- (OSASubmissionPolicy)initWithTemplate:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = -[OSASubmissionPolicy init](self, "init");
  v9 = v8;
  if (v6 && v8)
  {
    if (([v6 isEqualToString:@"default"] & 1) == 0)
    {
      [MEMORY[0x189611B08] sharedInstance];
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 submissionParam:@"templates"];
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v12 = [v11 objectForKeyedSubscript:v6];
      primary_template = v9->_primary_template;
      v9->_primary_template = (NSArray *)v12;
    }

    uint64_t v14 = [v7 objectForKeyedSubscript:@"logs"];
    specific_files = v9->_specific_files;
    v9->_specific_files = (NSArray *)v14;

    uint64_t v16 = [v7 objectForKeyedSubscript:@"submission_info"];
    identifier = v9->_identifier;
    v9->_identifier = (NSString *)v16;

    uint64_t v18 = [v7 objectForKeyedSubscript:@"prefaces"];
    prefaces = v9->_prefaces;
    v9->_prefaces = (NSDictionary *)v18;
  }

  return v9;
}

- (id)_loadPreviousResults
{
  v2 = (void *)MEMORY[0x189603F68];
  [MEMORY[0x189611B08] sharedInstance];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 pathDiagnostics];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 stringByAppendingPathComponent:@"com.apple.osanalytics.submissionStatus.plist"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 dictionaryWithContentsOfFile:v5];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = (void *)[v6 mutableCopy];

  return v7;
}

- (void)persist
{
}

void __30__OSASubmissionPolicy_persist__block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = (void *)[objc_alloc(MEMORY[0x189607898]) initWithFileDescriptor:a2 closeOnDealloc:0];
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = (id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
  id obj = 0LL;
  [v3 writeData:v4 error:&obj];
  objc_storeStrong(v5, obj);
}

- (NSDictionary)latestResults
{
  return (NSDictionary *)self->_results;
}

- (id)shouldSubmitRouting:(id)a3
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  [MEMORY[0x189611B08] sharedInstance];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v5 optInApple])
  {

LABEL_4:
    id v7 = &stru_18A161700;
    goto LABEL_8;
  }

  char v6 = -[NSMutableSet containsObject:](self->_allowOptOutByRouting, "containsObject:", v4);

  if ((v6 & 1) != 0) {
    goto LABEL_4;
  }
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543362;
    id v12 = v4;
    _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "ignoring %{public}@ during Opt-OUT",  (uint8_t *)&v11,  0xCu);
  }

  id v7 = @"opt-out";
LABEL_8:
  if (-[__CFString length](v7, "length")) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0LL;
  }
  v9 = v8;

  return v9;
}

- (id)buildSubmissionTemplateForConfig:(id)a3
{
  uint64_t v47 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  [MEMORY[0x189611B10] getAvailableTaskingRoutings];
  __int128 v30 = (void *)objc_claimAutoreleasedReturnValue();
  self->_hasTasking = 0;
  [MEMORY[0x189603FA8] array];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v29 = v4;
  int v6 = [v4 isProxy];
  uint64_t v7 = 2LL;
  if (v6) {
    uint64_t v7 = 1LL;
  }
  uint64_t v8 = (&self->super.isa)[v7];
  objc_super v32 = (void *)objc_opt_new();
  v33 = (void *)objc_opt_new();
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  v9 = v8;
  uint64_t v10 = -[NSArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v34,  v46,  16LL);
  id v31 = v5;
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v35;
    do
    {
      for (uint64_t i = 0LL; i != v11; ++i)
      {
        if (*(void *)v35 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        [v14 objectForKeyedSubscript:@"routing"];
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v16 = (void *)[v14 mutableCopy];
        -[OSASubmissionPolicy shouldSubmitRouting:](self, "shouldSubmitRouting:", v15);
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
        if ([v17 length])
        {
          [v16 setObject:v17 forKeyedSubscript:@"<inactive>"];
          uint64_t v18 = v33;
        }

        else
        {
          if (v9 != self->_default_template)
          {
            if (self->_specific_files)
            {
              [v16 objectForKeyedSubscript:@"extensions"];
              uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
              uint64_t v20 = [v19 count];

              if (!v20)
              {
                [v16 setObject:self->_identifier forKeyedSubscript:@"submission_info"];
                [v16 setObject:self->_specific_files forKeyedSubscript:@"logs"];
                specific_files = self->_specific_files;
                self->_specific_files = 0LL;
              }
            }
          }
          v22 = -[NSDictionary objectForKeyedSubscript:](self->_prefaces, "objectForKeyedSubscript:", v15);
          v5 = v31;
          uint64_t v18 = v32;
          if (v22)
          {
            v23 = -[NSDictionary objectForKeyedSubscript:](self->_prefaces, "objectForKeyedSubscript:", v15);
            [v16 setObject:v23 forKeyedSubscript:@"<preface>"];

            uint64_t v18 = v32;
          }
        }

        [v18 addObject:v15];
        [v5 addObject:v16];
      }

      uint64_t v11 = -[NSArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v34,  v46,  16LL);
    }

    while (v11);
  }

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
  {
    else {
      int v24 = @"primary";
    }
    if (v9 == self->_default_template) {
      v25 = @"default";
    }
    else {
      v25 = @"custom";
    }
    objc_msgSend(v32, "componentsJoinedByString:", @", ");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "componentsJoinedByString:", @", ");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v39 = v24;
    __int16 v40 = 2112;
    v41 = v25;
    __int16 v42 = 2112;
    v43 = v26;
    __int16 v44 = 2112;
    v45 = v27;
    _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "submission template '%@:%@' includes [%@]; excludes [%@]",
      buf,
      0x2Au);
  }

  return v31;
}

- (void)registerRouting:(id)a3 result:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v13 = (__CFString *)a3;
  int v6 = -[NSMutableSet containsObject:](self->_allowOptOutByRouting, "containsObject:", v13);
  uint64_t v7 = @"default";
  if (v6) {
    uint64_t v7 = v13;
  }
  uint64_t v8 = v7;
  v9 = -[NSMutableDictionary objectForKeyedSubscript:](self->_results, "objectForKeyedSubscript:", v8);
  if (v9)
  {
    uint64_t v10 = v9;
    if (v4) {
      [v9 removeObjectForKey:@"attempt"];
    }
  }

  else
  {
    uint64_t v10 = (void *)objc_opt_new();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_results, "setObject:forKeyedSubscript:", v10, v8);
  }

  [MEMORY[0x189603F50] date];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4) {
    uint64_t v12 = @"success";
  }
  else {
    uint64_t v12 = @"attempt";
  }
  [v10 setObject:v11 forKeyedSubscript:v12];
}

- (BOOL)ignoreProxies
{
  return self->_ignoreProxies;
}

- (void)setIgnoreProxies:(BOOL)a3
{
  self->_ignoreProxies = a3;
}

- (BOOL)hasTasking
{
  return self->_hasTasking;
}

- (NSMutableDictionary)scanOptions
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 72LL, 1);
}

- (void).cxx_destruct
{
}

@end