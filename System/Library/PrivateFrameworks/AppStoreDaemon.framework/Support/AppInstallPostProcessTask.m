@interface AppInstallPostProcessTask
- (void)main;
@end

@implementation AppInstallPostProcessTask

- (void)main
{
  id v3 = [*(id *)&self->super._success databaseID];
  objc_opt_self(&OBJC_CLASS___AppInstallPostProcessResponse);
  v4 = objc_alloc(&OBJC_CLASS___AppInstallPostProcessResponse);
  v5 = (NSError *)v4;
  if (v4)
  {
    v8.receiver = v4;
    v8.super_class = (Class)&OBJC_CLASS___AppInstallPostProcessResponse;
    id v6 = -[Task init](&v8, "init");
    v5 = (NSError *)v6;
    if (v6)
    {
      *((void *)v6 + 1) = v3;
      *((void *)v6 + 3) = 2LL;
      objc_storeStrong((id *)v6 + 2, 0LL);
    }
  }

  error = self->super._error;
  self->super._error = v5;
}

- (void).cxx_destruct
{
}

@end