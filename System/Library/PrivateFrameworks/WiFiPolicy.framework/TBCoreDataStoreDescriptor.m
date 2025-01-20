@interface TBCoreDataStoreDescriptor
+ (id)clientStoreDescriptor;
+ (id)defaultModelURL;
+ (id)defaultPersistentStoreURLWithDirectory:(id)a3;
+ (id)defaultStoresDirectoryURL;
+ (id)directStoreDescriptor;
+ (id)serverStoreDescriptor;
+ (id)tempStoreDescriptor;
+ (id)tempStoresDirectoryURL;
- (NSDictionary)storeOptions;
- (NSPersistentStoreDescription)storeDescription;
- (NSURL)modelURL;
- (NSURL)storeURL;
- (TBCoreDataStoreDescriptor)initWithType:(unint64_t)a3 storeURL:(id)a4 modelURL:(id)a5;
- (unint64_t)type;
- (void)setModelURL:(id)a3;
- (void)setStoreOptions:(id)a3;
- (void)setStoreURL:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation TBCoreDataStoreDescriptor

+ (id)clientStoreDescriptor
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [(id)objc_opt_class() defaultPersistentStoreURLWithDirectory:v3];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v5 = objc_alloc((Class)a1);
  [(id)objc_opt_class() defaultModelURL];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)[v5 initWithType:2 storeURL:v4 modelURL:v6];

  return v7;
}

+ (id)serverStoreDescriptor
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [(id)objc_opt_class() defaultPersistentStoreURLWithDirectory:v3];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v5 = objc_alloc((Class)a1);
  [(id)objc_opt_class() defaultModelURL];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)[v5 initWithType:0 storeURL:v4 modelURL:v6];

  return v7;
}

+ (id)directStoreDescriptor
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [(id)objc_opt_class() defaultPersistentStoreURLWithDirectory:v3];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v5 = objc_alloc((Class)a1);
  [(id)objc_opt_class() defaultModelURL];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)[v5 initWithType:1 storeURL:v4 modelURL:v6];

  return v7;
}

+ (id)tempStoreDescriptor
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [(id)objc_opt_class() defaultPersistentStoreURLWithDirectory:v3];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v5 = objc_alloc((Class)a1);
  [(id)objc_opt_class() defaultModelURL];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)[v5 initWithType:3 storeURL:v4 modelURL:v6];

  return v7;
}

- (TBCoreDataStoreDescriptor)initWithType:(unint64_t)a3 storeURL:(id)a4 modelURL:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___TBCoreDataStoreDescriptor;
  v11 = -[TBCoreDataStoreDescriptor init](&v21, sel_init);
  v11->_unint64_t type = a3;
  objc_storeStrong((id *)&v11->_storeURL, a4);
  objc_storeStrong((id *)&v11->_modelURL, a5);
  [MEMORY[0x189602578] persistentStoreDescriptionWithURL:v11->_storeURL];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  unint64_t type = v11->_type;
  if (type <= 3) {
    [v12 setType:**((void **)&unk_18A16E7D0 + type)];
  }
  [v13 setConfiguration:@"Default"];
  [v13 setShouldInferMappingModelAutomatically:1];
  [v13 setShouldMigrateStoreAutomatically:1];
  [v13 setShouldAddStoreAsynchronously:0];
  uint64_t v15 = *MEMORY[0x1896024A0];
  [v13 setOption:@"com.apple.wifid.store.cache" forKey:*MEMORY[0x1896024A0]];
  uint64_t v16 = *MEMORY[0x189602490];
  [v13 setOption:MEMORY[0x189604A88] forKey:*MEMORY[0x189602490]];
  objc_storeStrong((id *)&v11->_storeDescription, v13);
  if (!v11->_type)
  {
    v17 = (NSDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    -[NSDictionary setObject:forKeyedSubscript:]( v17,  "setObject:forKeyedSubscript:",  @"com.apple.wifid.store.cache",  v15);
    uint64_t v18 = MEMORY[0x189604A88];
    -[NSDictionary setObject:forKeyedSubscript:]( v17,  "setObject:forKeyedSubscript:",  MEMORY[0x189604A88],  *MEMORY[0x189602498]);
    -[NSDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v18, v16);
    -[NSDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v18, *MEMORY[0x189602440]);
    -[NSDictionary setObject:forKeyedSubscript:]( v17,  "setObject:forKeyedSubscript:",  *MEMORY[0x189607538],  *MEMORY[0x189602430]);
    storeOptions = v11->_storeOptions;
    v11->_storeOptions = v17;
  }

  return v11;
}

+ (id)defaultPersistentStoreURLWithDirectory:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 URLByAppendingPathExtension:@"sqlite"];
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)defaultStoresDirectoryURL
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189604030] fileURLWithPath:v2 isDirectory:1];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)tempStoresDirectoryURL
{
  v2 = (void *)MEMORY[0x189604030];
  NSTemporaryDirectory();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 fileURLWithPath:v3];
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)defaultModelURL
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 URLForResource:@"ThreeBars" withExtension:@"momd"];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_unint64_t type = a3;
}

- (NSURL)storeURL
{
  return self->_storeURL;
}

- (void)setStoreURL:(id)a3
{
}

- (NSURL)modelURL
{
  return self->_modelURL;
}

- (void)setModelURL:(id)a3
{
}

- (NSDictionary)storeOptions
{
  return self->_storeOptions;
}

- (void)setStoreOptions:(id)a3
{
}

- (NSPersistentStoreDescription)storeDescription
{
  return self->_storeDescription;
}

- (void).cxx_destruct
{
}

@end