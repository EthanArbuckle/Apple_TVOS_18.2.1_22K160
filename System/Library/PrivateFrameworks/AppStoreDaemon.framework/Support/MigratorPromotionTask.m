@interface MigratorPromotionTask
- (MigratorPromotionTask)initWithConfiguration:(id)a3;
- (id)copyConfiguration;
- (id)migratorType;
- (void)main;
@end

@implementation MigratorPromotionTask

- (MigratorPromotionTask)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___MigratorPromotionTask;
  v5 = -[MigratorTask initWithConfiguration:](&v13, "initWithConfiguration:", v4);
  if (v5)
  {
    id v6 = sub_10023B8C4((uint64_t)v4, (uint64_t)@"bundleIDs");
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSArray, v7);
    if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0) {
      objc_storeStrong((id *)&v5->super.super._error, v6);
    }
    id v9 = sub_10023B8C4((uint64_t)v4, (uint64_t)@"options");

    uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSDictionary, v10);
    if ((objc_opt_isKindOfClass(v9, v11) & 1) != 0) {
      objc_storeStrong((id *)&v5->super._keepAlive, v9);
    }
  }

  return v5;
}

- (id)copyConfiguration
{
  v3 = sub_10023B694(objc_alloc(&OBJC_CLASS___MigratorConfiguration), @"DemotedApplications");
  sub_10023B928((uint64_t)v3, self->super.super._error, @"bundleIDs");
  sub_10023B928((uint64_t)v3, self->super._keepAlive, @"options");
  return v3;
}

- (id)migratorType
{
  return @"DemotedApplications";
}

- (void)main
{
  uint64_t v3 = ASDLogHandleForCategory(17LL);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSError componentsJoinedByString:]( self->super.super._error,  "componentsJoinedByString:",  @", "));
    int v11 = 138543362;
    v12 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Attempting to hydrate applications with bundleIDs: [%{public}@]",  (uint8_t *)&v11,  0xCu);
  }

  id v6 = sub_10020B788(objc_alloc(&OBJC_CLASS___ImportJobsForDemotedAppsTask), self->super.super._error);
  uint64_t v7 = v6;
  if (v6) {
    *((_BYTE *)v6 + 48) = 0;
  }
  id v8 = sub_10020F1C0((uint64_t)&OBJC_CLASS___TaskQueue);
  uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);
  uint64_t v10 = (void *)v9;
  if (v9) {
    [*(id *)(v9 + 8) addOperation:v7];
  }
}

- (void).cxx_destruct
{
}

@end