@interface SATVManagedConfigurationUpdateStep
+ (NSString)stableIdentifier;
+ (void)initialize;
- (TVSKStepDelegate)stepDelegate;
- (id)executeStepForContext:(id)a3;
- (void)_notifyTriggerStatusChange;
- (void)setStepDelegate:(id)a3;
@end

@implementation SATVManagedConfigurationUpdateStep

+ (void)initialize
{
  if ((id)objc_opt_class(&OBJC_CLASS___SATVManagedConfigurationUpdateStep, a2) == a1)
  {
    os_log_t v2 = os_log_create("com.apple.purplebuddy.SetupFlow", "SATVManagedConfigurationUpdateStep");
    v3 = (void *)qword_1001097C8;
    qword_1001097C8 = (uint64_t)v2;
  }

+ (NSString)stableIdentifier
{
  return (NSString *)@"SATVManagedConfigurationUpdateStep";
}

- (id)executeStepForContext:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 setupSession]);
  unsigned __int8 v6 = [v5 isUpdate];

  if ((v6 & 1) == 0)
  {
    v14 = (os_log_s *)qword_1001097C8;
    if (os_log_type_enabled((os_log_t)qword_1001097C8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      v15 = "Finished executing the step as it is not an update flow.";
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v15, v17, 2u);
    }

- (void)_notifyTriggerStatusChange
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", TVSKStepTriggerAuthentication));
  id v3 = objc_alloc_init(&OBJC_CLASS___TVSKStepTriggersContext);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVManagedConfigurationUpdateStep stepDelegate](self, "stepDelegate"));
  [v4 step:self triggerStatusDidChangeForTriggers:v5 context:v3];
}

- (TVSKStepDelegate)stepDelegate
{
  return (TVSKStepDelegate *)objc_loadWeakRetained((id *)&self->stepDelegate);
}

- (void)setStepDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end