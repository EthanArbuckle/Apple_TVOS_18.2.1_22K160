@interface MIStashedBundleContainer
- (BOOL)saveStashMetadata:(id)a3 withError:(id *)a4;
- (MIStashMetadata)stashMetadata;
- (NSURL)stashMetadataURL;
- (id)newStashMetadata;
- (id)stashMetadataWithError:(id *)a3;
- (void)setStashMetadata:(id)a3;
@end

@implementation MIStashedBundleContainer

- (NSURL)stashMetadataURL
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 URLByAppendingPathComponent:@"StashMetadata.plist" isDirectory:0];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (id)newStashMetadata
{
  v3 = objc_alloc_init(&OBJC_CLASS___MIStashMetadata);
  -[MIStashedBundleContainer setStashMetadata:](self, "setStashMetadata:", v3);

  -[MIStashedBundleContainer stashMetadata](self, "stashMetadata");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)stashMetadataWithError:(id *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MIStashedBundleContainer stashMetadata](self, "stashMetadata");
  if (v6)
  {
    id v7 = 0LL;
LABEL_5:
    v10 = (void *)[v5 copy];
    v8 = v5;
    goto LABEL_6;
  }
  v8 = -[MIStashedBundleContainer stashMetadataURL](self, "stashMetadataURL");
  id v14 = 0LL;
  +[MIStashMetadata metadataFromURL:error:](&OBJC_CLASS___MIStashMetadata, "metadataFromURL:error:", v8, &v14);
  v9 = (MIStashMetadata *)objc_claimAutoreleasedReturnValue();
  id v7 = v14;

  if (v9)
  {
LABEL_4:
    -[MIStashedBundleContainer setStashMetadata:](self, "setStashMetadata:", v9);

    v5 = v9;
    goto LABEL_5;
  }

  [v7 domain];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v12 isEqualToString:*MEMORY[0x189607460]])
  {
    uint64_t v13 = [v7 code];

    if (v13 == 260)
    {
      v9 = objc_alloc_init(&OBJC_CLASS___MIStashMetadata);
      goto LABEL_4;
    }
  }

  else
  {
  }

  if (a3)
  {
    id v7 = v7;
    v10 = 0LL;
    *a3 = v7;
  }

  else
  {
    v10 = 0LL;
  }

- (BOOL)saveStashMetadata:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  -[MIStashedBundleContainer stashMetadataURL](self, "stashMetadataURL");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v12 = 0LL;
  int v8 = [v6 serializeToURL:v7 error:&v12];
  id v9 = v12;
  v10 = v9;
  if (v8)
  {
    -[MIStashedBundleContainer setStashMetadata:](self, "setStashMetadata:", v6);
  }

  else if (a4)
  {
    *a4 = v9;
  }

  return v8;
}

- (MIStashMetadata)stashMetadata
{
  return self->_stashMetadata;
}

- (void)setStashMetadata:(id)a3
{
}

- (void).cxx_destruct
{
}

@end