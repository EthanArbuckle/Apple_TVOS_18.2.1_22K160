@interface MIAppUserDataMigrator
- (BOOL)performMigration;
- (MIAppUserDataMigrator)init;
- (id)dataClassName;
- (unint64_t)countItemsToMigrate;
- (void)setCountItemsToMigrate:(unint64_t)a3;
@end

@implementation MIAppUserDataMigrator

- (MIAppUserDataMigrator)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MIAppUserDataMigrator;
  result = -[MIAppUserDataMigrator init](&v3, "init");
  if (result) {
    result->_countItemsToMigrate = 0LL;
  }
  return result;
}

- (id)dataClassName
{
  return @"MIAppUserDataMigrator";
}

- (BOOL)performMigration
{
  uint64_t v3 = v2;
  v4 = self;
  unint64_t v24 = -[MIAppUserDataMigrator countItemsToMigrate](self, "countItemsToMigrate");
  _DMLogFunc(v2, 3LL);
  if (!-[MIAppUserDataMigrator countItemsToMigrate](v4, "countItemsToMigrate", v24))
  {
    BOOL v22 = 1;
    uint64_t v32 = 1LL;
    if ((container_perform_data_migration_for_current_user(&v32) & 1) != 0) {
      return v22;
    }
    goto LABEL_14;
  }

  unint64_t v5 = 0LL;
  char v31 = 1;
  v6 = &MIFunctionNameErrorKey_ptr;
  v7 = &MIFunctionNameErrorKey_ptr;
  v30 = v4;
  do
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6[15], "stringWithUTF8String:", 0, v25, v26, v27, v29));
    id v9 = objc_alloc((Class)v7[6]);
    id v34 = 0LL;
    id v10 = [v9 initWithBundleIdentifier:v8 allowPlaceholder:1 error:&v34];
    id v11 = v34;
    if (v10
      && (v12 = (void *)objc_claimAutoreleasedReturnValue([v10 dataContainerURL]), v12, v12))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:]( &OBJC_CLASS___NSURL,  "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:",  0LL,  0LL,  0LL));
      v14 = (void *)objc_claimAutoreleasedReturnValue([v10 dataContainerURL]);
      v15 = (void *)objc_claimAutoreleasedReturnValue([v6[15] stringWithFileSystemRepresentation:0]);
      v16 = (void *)objc_claimAutoreleasedReturnValue([v14 URLByAppendingPathComponent:v15]);

      v17 = (void *)objc_claimAutoreleasedReturnValue([v13 path]);
      v28 = (void *)objc_claimAutoreleasedReturnValue([v16 path]);
      _DMLogFunc(v3, 3LL);

      v18 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager", v8, v17, v28));
      id v33 = v11;
      unsigned __int8 v19 = [v18 moveItemIfExistsAtURL:v13 toURL:v16 error:&v33];
      id v20 = v33;

      if ((v19 & 1) == 0)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue([v13 path]);
        v27 = (void *)objc_claimAutoreleasedReturnValue([v16 path]);
        id v29 = v20;
        v25 = v8;
        v26 = v21;
        _DMLogFunc(v2, 3LL);

        char v31 = 0;
      }

      id v11 = v20;
      v4 = v30;
      uint64_t v3 = v2;
      v6 = &MIFunctionNameErrorKey_ptr;
      v7 = &MIFunctionNameErrorKey_ptr;
    }

    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue([v10 dataContainerURL]);
      v26 = v13;
      v27 = v11;
      v25 = v8;
      _DMLogFunc(v3, 3LL);
      char v31 = 0;
    }

    ++v5;
  }

  while (v5 < -[MIAppUserDataMigrator countItemsToMigrate](v4, "countItemsToMigrate"));
  uint64_t v32 = 1LL;
  if ((container_perform_data_migration_for_current_user(&v32) & 1) == 0)
  {
LABEL_14:
    _DMLogFunc(v3, 3LL);
    goto LABEL_15;
  }

  if ((v31 & 1) == 0)
  {
LABEL_15:
    _DMLogFunc(v3, 3LL);
    return 0;
  }

  return 1;
}

- (unint64_t)countItemsToMigrate
{
  return self->_countItemsToMigrate;
}

- (void)setCountItemsToMigrate:(unint64_t)a3
{
  self->_countItemsToMigrate = a3;
}

@end