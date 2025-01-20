@interface MigratorValidateAppleIDsTask
- (MigratorValidateAppleIDsTask)initWithConfiguration:(id)a3;
- (id)copyConfiguration;
- (id)migratorType;
- (void)main;
@end

@implementation MigratorValidateAppleIDsTask

- (MigratorValidateAppleIDsTask)initWithConfiguration:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MigratorValidateAppleIDsTask;
  return -[MigratorTask initWithConfiguration:](&v4, "initWithConfiguration:", a3);
}

- (id)copyConfiguration
{
  return sub_10023B694(objc_alloc(&OBJC_CLASS___MigratorConfiguration), @"ValidateAppleIDs");
}

- (id)migratorType
{
  return @"ValidateAppleIDs";
}

- (void)main
{
  v3 = objc_opt_new(&OBJC_CLASS___ValidateAppleIDsTask);
  uint64_t v7 = 0LL;
  unsigned int v4 = -[Task runSubTask:returningError:](self, "runSubTask:returningError:", v3, &v7);

  uint64_t v5 = ASDLogHandleForCategory(17LL);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    unsigned int v9 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "ValidateAppleIDsTask complete with result: %d",  buf,  8u);
  }
}

@end