@interface TVSSApplication
+ (id)sharedApplication;
- (TVSSApplication)init;
- (id)keyCommands;
- (void)dealloc;
@end

@implementation TVSSApplication

+ (id)sharedApplication
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___TVSSApplication;
  id v2 = objc_msgSendSuper2(&v4, "sharedApplication");
  return (id)objc_claimAutoreleasedReturnValue(v2);
}

- (TVSSApplication)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVSSApplication;
  id v2 = -[TVSSApplication init](&v4, "init");
  if (v2) {
    +[TVSNetworkUtilities setupNetworkMonitoring](&OBJC_CLASS___TVSNetworkUtilities, "setupNetworkMonitoring");
  }
  return v2;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVSSApplication;
  -[TVSSApplication dealloc](&v4, "dealloc");
}

- (id)keyCommands
{
  id v2 = (void *)qword_100012670;
  if (!qword_100012670)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndex:](&OBJC_CLASS___NSIndexSet, "indexSetWithIndex:", 40LL));
    objc_super v4 = (void *)objc_claimAutoreleasedReturnValue( +[UIKeyCommand keyCommandWithKeyCodes:modifierFlags:buttonType:]( &OBJC_CLASS___UIKeyCommand,  "keyCommandWithKeyCodes:modifierFlags:buttonType:",  v3,  0LL,  29360168LL));
    v8 = v4;
    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v8, 1LL));
    v6 = (void *)qword_100012670;
    qword_100012670 = v5;

    id v2 = (void *)qword_100012670;
  }

  return v2;
}

@end