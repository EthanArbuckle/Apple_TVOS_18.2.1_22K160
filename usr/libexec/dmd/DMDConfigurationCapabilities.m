@interface DMDConfigurationCapabilities
+ (id)supportedActivationTypes;
+ (id)supportedAssetTypes;
+ (id)supportedCommandTypes;
+ (id)supportedConfigurationTypes;
+ (id)supportedDeclarationTypes;
+ (id)supportedEventTypes;
+ (id)supportedMessageTypes;
+ (id)supportedPredicateTypes;
@end

@implementation DMDConfigurationCapabilities

+ (id)supportedCommandTypes
{
  if (qword_1000CCC20 != -1) {
    dispatch_once(&qword_1000CCC20, &stru_10009E1A0);
  }
  return (id)qword_1000CCC18;
}

+ (id)supportedDeclarationTypes
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100021718;
  block[3] = &unk_10009E1C0;
  block[4] = a1;
  if (qword_1000CCC30 != -1) {
    dispatch_once(&qword_1000CCC30, block);
  }
  return (id)qword_1000CCC28;
}

+ (id)supportedAssetTypes
{
  if (qword_1000CCC40 != -1) {
    dispatch_once(&qword_1000CCC40, &stru_10009E1E0);
  }
  return (id)qword_1000CCC38;
}

+ (id)supportedConfigurationTypes
{
  if (qword_1000CCC50 != -1) {
    dispatch_once(&qword_1000CCC50, &stru_10009E200);
  }
  return (id)qword_1000CCC48;
}

+ (id)supportedEventTypes
{
  if (qword_1000CCC60 != -1) {
    dispatch_once(&qword_1000CCC60, &stru_10009E220);
  }
  return (id)qword_1000CCC58;
}

+ (id)supportedActivationTypes
{
  if (qword_1000CCC70 != -1) {
    dispatch_once(&qword_1000CCC70, &stru_10009E240);
  }
  return (id)qword_1000CCC68;
}

+ (id)supportedPredicateTypes
{
  if (qword_1000CCC80 != -1) {
    dispatch_once(&qword_1000CCC80, &stru_10009E260);
  }
  return (id)qword_1000CCC78;
}

+ (id)supportedMessageTypes
{
  if (qword_1000CCC90 != -1) {
    dispatch_once(&qword_1000CCC90, &stru_10009E280);
  }
  return (id)qword_1000CCC88;
}

@end