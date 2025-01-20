@interface MigratorTestFlightFeedbackTask
- (MigratorTestFlightFeedbackTask)initWithConfiguration:(id)a3;
- (id)copyConfiguration;
- (id)migratorType;
- (void)main;
@end

@implementation MigratorTestFlightFeedbackTask

- (MigratorTestFlightFeedbackTask)initWithConfiguration:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MigratorTestFlightFeedbackTask;
  return -[MigratorTask initWithConfiguration:](&v4, "initWithConfiguration:", a3);
}

- (id)copyConfiguration
{
  return sub_10023B694(objc_alloc(&OBJC_CLASS___MigratorConfiguration), @"TestFlightFeedback");
}

- (id)migratorType
{
  return @"TestFlightFeedback";
}

- (void)main
{
  uint64_t v2 = ASDLogHandleForCategory(17LL);
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Performing test flight feedback migration",  v4,  2u);
  }
}

@end