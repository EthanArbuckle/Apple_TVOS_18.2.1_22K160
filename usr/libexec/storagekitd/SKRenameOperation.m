@interface SKRenameOperation
- (SKRenameOperation)initWithDisk:(id)a3 name:(id)a4 withCompletionBlock:(id)a5;
- (id)description;
- (id)newPerformOperation;
- (int64_t)defaultErrorCode;
@end

@implementation SKRenameOperation

- (SKRenameOperation)initWithDisk:(id)a3 name:(id)a4 withCompletionBlock:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = (void (**)(id, id))a5;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___SKRenameOperation;
  v12 = -[SKBaseDiskArbOperation initWithTarget:options:callbackBlock:]( &v24,  "initWithTarget:options:callbackBlock:",  v9,  &__NSDictionary0__struct,  v11);
  if (v12)
  {
    uint64_t v13 = objc_claimAutoreleasedReturnValue([v9 filesystemType]);
    if (v13)
    {
      v14 = (void *)v13;
      v15 = (void *)objc_claimAutoreleasedReturnValue([v9 filesystemType]);
      unsigned int v16 = [v15 isEqualToString:kSKDiskFileSystemFAT];

      if (v16)
      {
        uint64_t v17 = objc_claimAutoreleasedReturnValue([v10 uppercaseString]);

        id v10 = (id)v17;
      }
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue([v9 filesystem]);
    id v23 = 0LL;
    unsigned __int8 v19 = [v18 isValidName:v10 error:&v23];
    id v20 = v23;

    if ((v19 & 1) != 0)
    {
      objc_storeStrong((id *)&v12->_diskToRename, a3);
      objc_storeStrong((id *)&v12->_name, v10);
      v21 = v12;
    }

    else
    {
      v11[2](v11, v20);
      v21 = 0LL;
    }
  }

  else
  {
    v21 = 0LL;
  }

  return v21;
}

- (id)newPerformOperation
{
  v3 = (__DADisk *)objc_claimAutoreleasedReturnValue(-[SKDisk daDisk](self->_diskToRename, "daDisk"));
  DADiskRename(v3, (CFStringRef)self->_name, 0, (DADiskRenameCallback)sub_1000196D4, self);

  if (!-[SKBaseDiskArbOperation completeDiskArbOp](self, "completeDiskArbOp")) {
    return -[SKBaseDiskArbOperation newDAError](self, "newDAError");
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](&OBJC_CLASS___SKDaemonManager, "sharedManager"));
  id v5 = [v4 _recacheSyncDisk:self->_diskToRename];

  return 0LL;
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Rename Operation for %@",  self->_diskToRename);
}

- (int64_t)defaultErrorCode
{
  return 402LL;
}

- (void).cxx_destruct
{
}

@end