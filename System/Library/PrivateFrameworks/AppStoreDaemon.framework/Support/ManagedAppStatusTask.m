@interface ManagedAppStatusTask
- (ManagedAppStatusTask)init;
- (void)main;
@end

@implementation ManagedAppStatusTask

- (ManagedAppStatusTask)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___ManagedAppStatusTask;
  v2 = -[Task init](&v7, "init");
  if (v2)
  {
    id v3 = sub_1002EEBC0((uint64_t)&OBJC_CLASS___AppInstallsDatabaseStore);
    uint64_t v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = *(void **)&v2->super._success;
    *(void *)&v2->super._success = v4;
  }

  return v2;
}

- (void)main
{
  uint64_t v8 = 0LL;
  v9 = &v8;
  uint64_t v10 = 0x3032000000LL;
  v11 = sub_1001AD9E4;
  v12 = sub_1001AD9F4;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v4 = *(void **)&self->super._success;
  id v13 = v3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001AD9FC;
  v7[3] = &unk_1003EAAD0;
  v7[4] = &v8;
  [v4 readUsingSession:v7];
  v5 = (NSError *)[(id)v9[5] copy];
  error = self->super._error;
  self->super._error = v5;

  -[Task completeWithSuccess](self, "completeWithSuccess");
  _Block_object_dispose(&v8, 8);
}

- (void).cxx_destruct
{
}

@end