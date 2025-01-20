@interface TVSettingsApplication
+ (id)sharedApplication;
- (TVSettingsApplication)init;
- (id)keyCommands;
- (void)dealloc;
@end

@implementation TVSettingsApplication

+ (id)sharedApplication
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___TVSettingsApplication;
  id v2 = objc_msgSendSuper2(&v4, "sharedApplication");
  return (id)objc_claimAutoreleasedReturnValue(v2);
}

- (TVSettingsApplication)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVSettingsApplication;
  id v2 = -[TVSettingsApplication init](&v4, "init");
  if (v2)
  {
    +[TVSNetworkUtilities setupNetworkMonitoring](&OBJC_CLASS___TVSNetworkUtilities, "setupNetworkMonitoring");
    +[PBSMigrator tvset_registerMigrations](&OBJC_CLASS___PBSMigrator, "tvset_registerMigrations");
    +[PBSMigrator performMigrationIfNeeded](&OBJC_CLASS___PBSMigrator, "performMigrationIfNeeded");
  }

  return v2;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVSettingsApplication;
  -[TVSettingsApplication dealloc](&v4, "dealloc");
}

- (id)keyCommands
{
  id v2 = (void *)qword_1001E1C10;
  if (!qword_1001E1C10)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndex:](&OBJC_CLASS___NSIndexSet, "indexSetWithIndex:", 40LL));
    objc_super v4 = (void *)objc_claimAutoreleasedReturnValue( +[UIKeyCommand keyCommandWithKeyCodes:modifierFlags:buttonType:]( &OBJC_CLASS___UIKeyCommand,  "keyCommandWithKeyCodes:modifierFlags:buttonType:",  v3,  0LL,  29360168LL));
    v8 = v4;
    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v8, 1LL));
    v6 = (void *)qword_1001E1C10;
    qword_1001E1C10 = v5;

    id v2 = (void *)qword_1001E1C10;
  }

  return v2;
}

@end