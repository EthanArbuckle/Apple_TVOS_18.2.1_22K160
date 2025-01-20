@interface MCMContainerSchemaActionStopBackupExclude
+ (id)actionIdentifier;
- (BOOL)performWithError:(id *)a3;
- (MCMContainerSchemaActionStopBackupExclude)initWithPathArgument:(id)a3 context:(id)a4;
- (id)description;
@end

@implementation MCMContainerSchemaActionStopBackupExclude

- (MCMContainerSchemaActionStopBackupExclude)initWithPathArgument:(id)a3 context:(id)a4
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MCMContainerSchemaActionStopBackupExclude;
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
  v11[1] = *(id *)MEMORY[0x1895F89C0];
  url = self->_url;
  v11[0] = 0LL;
  BOOL v5 = -[MCMContainerSchemaActionBase fixAndRetryIfPermissionsErrorWithURL:error:duringBlock:]( self,  "fixAndRetryIfPermissionsErrorWithURL:error:duringBlock:",  url,  v11,  &__block_literal_global_4763);
  id v6 = v11[0];
  [v6 domain];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v7 isEqualToString:*MEMORY[0x189607688]])
  {
    uint64_t v8 = [v6 code];

    if (v8 == 2)
    {

      id v6 = 0LL;
      BOOL v5 = 1;
      goto LABEL_10;
    }
  }

  else
  {
  }

  if (a3) {
    char v9 = v5;
  }
  else {
    char v9 = 1;
  }
  if ((v9 & 1) == 0)
  {
    id v6 = v6;
    BOOL v5 = 0;
    *a3 = v6;
  }

- (void).cxx_destruct
{
}

uint64_t __62__MCMContainerSchemaActionStopBackupExclude_performWithError___block_invoke( uint64_t a1,  void *a2,  uint64_t a3)
{
  id v4 = a2;
  +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 removeExclusionFromBackupFromURL:v4 error:a3];

  return v6;
}

+ (id)actionIdentifier
{
  v2 = @"stop-backup-exclude";
  return @"stop-backup-exclude";
}

@end