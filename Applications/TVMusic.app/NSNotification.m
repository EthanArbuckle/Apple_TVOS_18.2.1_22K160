@interface NSNotification
+ (id)mainViewControllerDidAppear;
+ (id)mediaPlayerCommandCompletion;
+ (id)musicPageDidLoad;
+ (id)musicPageIntentUserInfoKey;
+ (id)musicPageWillLoad;
+ (id)willCloseVocalAttenuationView;
+ (id)willOpenVocalAttenuationView;
@end

@implementation NSNotification

+ (id)mediaPlayerCommandCompletion
{
  if (qword_1002B71E8 != -1) {
    swift_once(&qword_1002B71E8, sub_10016B608);
  }
  return (id)qword_1002C5EB0;
}

+ (id)musicPageWillLoad
{
  return sub_10012102C( (uint64_t)a1,  (uint64_t)a2,  &qword_1002B7230,  (id *)&static NSNotification.musicPageWillLoad,  (uint64_t)sub_100191838);
}

+ (id)musicPageDidLoad
{
  return sub_10012102C( (uint64_t)a1,  (uint64_t)a2,  &qword_1002B7238,  (id *)&static NSNotification.musicPageDidLoad,  (uint64_t)sub_1001918CC);
}

+ (id)musicPageIntentUserInfoKey
{
  return String._bridgeToObjectiveC()();
}

+ (id)mainViewControllerDidAppear
{
  return sub_10012102C( (uint64_t)a1,  (uint64_t)a2,  &qword_1002B7240,  (id *)&static NSNotification.mainViewControllerDidAppear,  (uint64_t)sub_1001919C4);
}

+ (id)willOpenVocalAttenuationView
{
  return sub_10012102C((uint64_t)a1, (uint64_t)a2, &qword_1002B7280, (id *)&qword_1002C5F48, (uint64_t)sub_1001AB974);
}

+ (id)willCloseVocalAttenuationView
{
  return sub_10012102C((uint64_t)a1, (uint64_t)a2, &qword_1002B7288, (id *)&qword_1002C5F50, (uint64_t)sub_1001AB9B0);
}

@end