@interface MCMContainerSchemaActionMkdir
+ (id)actionIdentifier;
- (BOOL)performWithError:(id *)a3;
- (MCMContainerSchemaActionMkdir)initWithPathArgument:(id)a3 context:(id)a4;
- (id)description;
@end

@implementation MCMContainerSchemaActionMkdir

- (MCMContainerSchemaActionMkdir)initWithPathArgument:(id)a3 context:(id)a4
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MCMContainerSchemaActionMkdir;
  v7 = -[MCMContainerSchemaActionBase initWithContext:](&v11, sel_initWithContext_, a4);
  if (v7)
  {
    uint64_t v8 = [v6 fileURL];
    url = v7->_url;
    v7->_url = (NSURL *)v8;

    if (!v7->_url)
    {

      v7 = 0LL;
    }
  }

  return v7;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[NSURL path](self->_url, "path");
  [v3 stringByAppendingFormat:@" [%@]", v4];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)performWithError:(id *)a3
{
  v17[1] = *(id *)MEMORY[0x1895F89C0];
  v5 = -[NSURL URLByDeletingLastPathComponent](self->_url, "URLByDeletingLastPathComponent");
  uint64_t v6 = MEMORY[0x1895F87A8];
  v16[4] = self;
  v17[0] = 0LL;
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  v16[2] = __50__MCMContainerSchemaActionMkdir_performWithError___block_invoke;
  v16[3] = &unk_18A29E688;
  BOOL v7 = -[MCMContainerSchemaActionBase fixAndRetryIfPermissionsErrorWithURL:error:duringBlock:]( self,  "fixAndRetryIfPermissionsErrorWithURL:error:duringBlock:",  v5,  v17,  v16);
  id v8 = v17[0];
  v9 = v8;
  if (v7)
  {
    url = self->_url;
    v14[4] = self;
    id v15 = v8;
    v14[0] = v6;
    v14[1] = 3221225472LL;
    v14[2] = __50__MCMContainerSchemaActionMkdir_performWithError___block_invoke_2;
    v14[3] = &unk_18A29E688;
    BOOL v11 = -[MCMContainerSchemaActionBase fixAndRetryIfPermissionsErrorWithURL:error:duringBlock:]( self,  "fixAndRetryIfPermissionsErrorWithURL:error:duringBlock:",  url,  &v15,  v14);
    id v12 = v15;

    v9 = v12;
    if (!a3) {
      goto LABEL_7;
    }
  }

  else
  {
    BOOL v11 = 0;
    if (!a3) {
      goto LABEL_7;
    }
  }

  if (!v11) {
    *a3 = v9;
  }
LABEL_7:

  return v11;
}

- (void).cxx_destruct
{
}

uint64_t __50__MCMContainerSchemaActionMkdir_performWithError___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  return [*(id *)(a1 + 32) makedirAtURL:a2 followTerminalSymlink:1 error:a3];
}

uint64_t __50__MCMContainerSchemaActionMkdir_performWithError___block_invoke_2( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  return [*(id *)(a1 + 32) makedirAtURL:a2 followTerminalSymlink:0 error:a3];
}

+ (id)actionIdentifier
{
  v2 = @"mkdir";
  return @"mkdir";
}

@end