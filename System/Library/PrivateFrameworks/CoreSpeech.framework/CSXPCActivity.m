@interface CSXPCActivity
- (void)registerXPCActivities;
@end

@implementation CSXPCActivity

- (void)registerXPCActivities
{
  if (XPC_ACTIVITY_CHECK_IN)
  {
    v2[0] = _NSConcreteStackBlock;
    v2[1] = 3221225472LL;
    v2[2] = sub_1000F1540;
    v2[3] = &unk_10022D360;
    v3 = &stru_10022D338;
    v4 = &stru_10022D2F8;
    xpc_activity_register("com.apple.siri.xpc_activity.power-logging", XPC_ACTIVITY_CHECK_IN, v2);
  }

  else
  {
    xpc_activity_unregister("com.apple.siri.xpc_activity.power-logging");
  }

@end