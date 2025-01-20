@interface DMMigrationSentinelManager
- (BOOL)isSentinelPresent;
- (DMMigrationSentinelManager)initWithFileManager:(id)a3;
- (DMMigrationSentinelManager)initWithFileManager:(id)a3 sentinelPath:(id)a4;
- (void)removeSentinelIfPresent;
@end

@implementation DMMigrationSentinelManager

- (DMMigrationSentinelManager)initWithFileManager:(id)a3
{
  return -[DMMigrationSentinelManager initWithFileManager:sentinelPath:]( self,  "initWithFileManager:sentinelPath:",  a3,  @"/private/var/datamigrator/migrate");
}

- (DMMigrationSentinelManager)initWithFileManager:(id)a3 sentinelPath:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___DMMigrationSentinelManager;
  v9 = -[DMMigrationSentinelManager init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_fileManager, a3);
    objc_storeStrong((id *)&v10->_sentinelPath, a4);
  }

  return v10;
}

- (BOOL)isSentinelPresent
{
  return -[NSFileManager fileExistsAtPath:](self->_fileManager, "fileExistsAtPath:", self->_sentinelPath);
}

- (void)removeSentinelIfPresent
{
  fileManager = self->_fileManager;
  sentinelPath = self->_sentinelPath;
  id v10 = 0LL;
  unsigned __int8 v5 = -[NSFileManager removeItemAtPath:error:](fileManager, "removeItemAtPath:error:", sentinelPath, &v10);
  id v6 = v10;
  id v7 = v6;
  if ((v5 & 1) == 0)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 domain]);
    if ([v8 isEqualToString:NSCocoaErrorDomain])
    {
      id v9 = [v7 code];

      if (v9 == (id)4) {
        goto LABEL_7;
      }
    }

    else
    {
    }

    _DMLogFunc(v2, 3LL);
  }

- (void).cxx_destruct
{
}

@end