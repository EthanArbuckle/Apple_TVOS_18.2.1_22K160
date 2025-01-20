@interface MICandidateAppContainer
- (BOOL)isPlaceholder;
- (NSURL)appURL;
- (void)setAppURL:(id)a3;
@end

@implementation MICandidateAppContainer

- (NSURL)appURL
{
  appURL = self->_appURL;
  if (!appURL)
  {
    -[MICandidateContainer rootURL](self, "rootURL");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = 0LL;
    v14 = &v13;
    uint64_t v15 = 0x3032000000LL;
    v16 = __Block_byref_object_copy_;
    v17 = __Block_byref_object_dispose_;
    id v18 = 0LL;
    [MEMORY[0x1896100A8] defaultManager];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = ___AppURLInContainer_block_invoke;
    v12[3] = &unk_189E41A00;
    v12[4] = &v13;
    [v5 enumerateURLsForItemsInDirectoryAtURL:v4 ignoreSymlinks:1 withBlock:v12];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v14;
    if (v6 && !v14[5] && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    {
      [v4 path];
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();

      v7 = v14;
    }

    v8 = (NSURL *)(id)v7[5];

    _Block_object_dispose(&v13, 8);
    v9 = self->_appURL;
    self->_appURL = v8;

    appURL = self->_appURL;
  }

  return appURL;
}

- (BOOL)isPlaceholder
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    [MEMORY[0x1896100A8] defaultManager];
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    char v4 = [v3 bundleAtURLIsPlaceholder:v2];
  }

  else
  {
    char v4 = 0;
  }

  return v4;
}

- (void)setAppURL:(id)a3
{
}

- (void).cxx_destruct
{
}

@end