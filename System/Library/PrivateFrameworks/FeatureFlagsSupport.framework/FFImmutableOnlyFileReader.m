@interface FFImmutableOnlyFileReader
- (FFFileReader)underlying;
- (FFImmutableOnlyFileReader)init;
- (NSString)immutableInternalPathPrefix;
- (NSString)immutablePathPrefix;
- (id)contentsOfDirectoryAtURL:(id)a3 error:(id *)a4;
- (id)dictionaryWithContentsOfURL:(id)a3 error:(id *)a4;
- (void)setImmutableInternalPathPrefix:(id)a3;
- (void)setImmutablePathPrefix:(id)a3;
- (void)setUnderlying:(id)a3;
@end

@implementation FFImmutableOnlyFileReader

- (FFImmutableOnlyFileReader)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___FFImmutableOnlyFileReader;
  v2 = -[FFImmutableOnlyFileReader init](&v6, sel_init);
  if (v2)
  {
    [NSString stringWithUTF8String:*_os_feature_search_paths()];
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[FFImmutableOnlyFileReader setImmutablePathPrefix:](v2, "setImmutablePathPrefix:", v3);

    [NSString stringWithUTF8String:_os_feature_internal_search_path()];
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[FFImmutableOnlyFileReader setImmutableInternalPathPrefix:](v2, "setImmutableInternalPathPrefix:", v4);
  }

  return v2;
}

- (id)dictionaryWithContentsOfURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  [v6 path];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[FFImmutableOnlyFileReader immutablePathPrefix](self, "immutablePathPrefix");
  if ([v7 hasPrefix:v8])
  {
  }

  else
  {
    [v6 path];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[FFImmutableOnlyFileReader immutableInternalPathPrefix](self, "immutableInternalPathPrefix");
    int v11 = [v9 hasPrefix:v10];

    if (!v11)
    {
      v13 = 0LL;
      goto LABEL_6;
    }
  }
  v12 = -[FFImmutableOnlyFileReader underlying](self, "underlying");
  [v12 dictionaryWithContentsOfURL:v6 error:a4];
  v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return v13;
}

- (id)contentsOfDirectoryAtURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  [v6 path];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[FFImmutableOnlyFileReader immutablePathPrefix](self, "immutablePathPrefix");
  if ([v7 hasPrefix:v8])
  {
  }

  else
  {
    [v6 path];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[FFImmutableOnlyFileReader immutableInternalPathPrefix](self, "immutableInternalPathPrefix");
    char v11 = [v9 hasPrefix:v10];

    if ((v11 & 1) == 0)
    {
      [MEMORY[0x189603F18] array];
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
  v12 = -[FFImmutableOnlyFileReader underlying](self, "underlying");
  [v12 contentsOfDirectoryAtURL:v6 error:a4];
  v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return v13;
}

- (FFFileReader)underlying
{
  return self->_underlying;
}

- (void)setUnderlying:(id)a3
{
}

- (NSString)immutablePathPrefix
{
  return self->_immutablePathPrefix;
}

- (void)setImmutablePathPrefix:(id)a3
{
}

- (NSString)immutableInternalPathPrefix
{
  return self->_immutableInternalPathPrefix;
}

- (void)setImmutableInternalPathPrefix:(id)a3
{
}

- (void).cxx_destruct
{
}

@end