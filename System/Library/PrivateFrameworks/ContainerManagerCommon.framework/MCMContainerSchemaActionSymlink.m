@interface MCMContainerSchemaActionSymlink
+ (id)actionIdentifier;
- (BOOL)performWithError:(id *)a3;
- (MCMContainerSchemaActionSymlink)initWithSourcePathArgument:(id)a3 destinationPathArgument:(id)a4 destFinalPathArgument:(id)a5 context:(id)a6;
- (id)description;
@end

@implementation MCMContainerSchemaActionSymlink

- (MCMContainerSchemaActionSymlink)initWithSourcePathArgument:(id)a3 destinationPathArgument:(id)a4 destFinalPathArgument:(id)a5 context:(id)a6
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___MCMContainerSchemaActionSymlink;
  v13 = -[MCMContainerSchemaActionBase initWithContext:](&v21, sel_initWithContext_, a6);
  if (v13)
  {
    uint64_t v14 = [v11 fileURL];
    linkURL = v13->_linkURL;
    v13->_linkURL = (NSURL *)v14;

    uint64_t v16 = [v12 fileURL];
    finalLinkURL = v13->_finalLinkURL;
    v13->_finalLinkURL = (NSURL *)v16;

    uint64_t v18 = [v10 string];
    targetPath = v13->_targetPath;
    v13->_targetPath = (NSString *)v18;

    if (!v13->_linkURL || !v13->_targetPath)
    {

      v13 = 0LL;
    }
  }

  return v13;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[NSURL path](self->_linkURL, "path");
  [v3 stringByAppendingFormat:@" [%@] → [%@]", v4, self->_targetPath];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)performWithError:(id *)a3
{
  v30[1] = *(id *)MEMORY[0x1895F89C0];
  v4 = -[NSURL path](self->_finalLinkURL, "path");
  v5 = self->_targetPath;
  v6 = (void *)MEMORY[0x189603FA8];
  [v4 pathComponents];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 arrayWithArray:v7];
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x189603FA8];
  -[NSString pathComponents](v5, "pathComponents");
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 arrayWithArray:v10];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  while (1)
  {

    if (![v8 count] || !objc_msgSend(v11, "count")) {
      break;
    }
    [v8 objectAtIndexedSubscript:0];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 objectAtIndexedSubscript:0];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (([v10 isEqualToString:v12] & 1) == 0)
    {

      break;
    }

    [v8 removeObjectAtIndex:0];
    [v11 removeObjectAtIndex:0];
  }

  if ([v8 count]) {
    [v8 removeObjectAtIndex:0];
  }
  [MEMORY[0x189603FA8] array];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v8 count])
  {
    unint64_t v14 = 0LL;
    do
    {
      [v13 addObject:@".."];
      ++v14;
    }

    while (v14 < [v8 count]);
  }

  [v13 addObjectsFromArray:v11];
  [NSString pathWithComponents:v13];
  v15 = (NSString *)objc_claimAutoreleasedReturnValue();

  targetPath = self->_targetPath;
  self->_targetPath = v15;

  v17 = self->_targetPath;
  uint64_t v18 = self->_finalLinkURL;
  linkURL = self->_linkURL;
  v30[0] = 0LL;
  v27[0] = MEMORY[0x1895F87A8];
  v27[1] = 3221225472LL;
  v27[2] = __52__MCMContainerSchemaActionSymlink_performWithError___block_invoke;
  v27[3] = &unk_18A29DB38;
  v27[4] = self;
  v20 = v18;
  v28 = v20;
  objc_super v21 = v17;
  v29 = v21;
  BOOL v22 = -[MCMContainerSchemaActionBase fixAndRetryIfPermissionsErrorWithURL:error:duringBlock:]( self,  "fixAndRetryIfPermissionsErrorWithURL:error:duringBlock:",  linkURL,  v30,  v27);
  id v23 = v30[0];
  v24 = v23;
  if (a3 && !v22) {
    *a3 = v23;
  }

  return v22;
}

- (void).cxx_destruct
{
}

uint64_t __52__MCMContainerSchemaActionSymlink_performWithError___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  v18[1] = *(id *)MEMORY[0x1895F89C0];
  id v5 = a2;
  [v5 URLByDeletingLastPathComponent];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (![*(id *)(a1 + 32) makedirAtURL:v6 followTerminalSymlink:1 error:a3])
  {
    v8 = 0LL;
    id v9 = 0LL;
    goto LABEL_7;
  }

  if (![*(id *)(a1 + 40) isEqual:v5])
  {
    v8 = 0LL;
    id v9 = 0LL;
    goto LABEL_9;
  }
  v7 = +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
  v18[0] = 0LL;
  [v7 targetOfSymbolicLinkAtURL:v5 error:v18];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v9 = v18[0];

  if (!v8)
  {
    [v9 domain];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = *MEMORY[0x189607688];
    if ([v13 isEqualToString:*MEMORY[0x189607688]])
    {
      uint64_t v15 = [v9 code];

      if (v15 == 17)
      {
        v8 = 0LL;
        if (([*(id *)(a1 + 32) backupFileURL:v5 error:a3] & 1) == 0) {
          goto LABEL_7;
        }
LABEL_9:
        +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
        id v11 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v10 = [v11 symbolicallyLinkURL:v5 toSymlinkTarget:*(void *)(a1 + 48) error:a3];

        goto LABEL_10;
      }
    }

    else
    {
    }

    [v9 domain];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v16 isEqualToString:v14])
    {
      uint64_t v17 = [v9 code];

      if (v17 == 2)
      {
        v8 = 0LL;
        goto LABEL_9;
      }
    }

    else
    {
    }

    id v9 = v9;
    v8 = 0LL;
    uint64_t v10 = 0LL;
    *a3 = v9;
    goto LABEL_10;
  }

  if (([v8 isEqualToString:*(void *)(a1 + 48)] & 1) == 0)
  {
LABEL_7:
    uint64_t v10 = 0LL;
    goto LABEL_10;
  }

  uint64_t v10 = 1LL;
LABEL_10:

  return v10;
}

+ (id)actionIdentifier
{
  v2 = @"symlink";
  return @"symlink";
}

@end