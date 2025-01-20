@interface LACDTOEnvironmentProviderFactory
+ (id)environmentProviderWithLocationProvider:(id)a3 featureController:(id)a4 ratchetStateProvider:(id)a5 lostModeController:(id)a6;
@end

@implementation LACDTOEnvironmentProviderFactory

+ (id)environmentProviderWithLocationProvider:(id)a3 featureController:(id)a4 ratchetStateProvider:(id)a5 lostModeController:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = -[LACDTOEnvironmentProvider initWithLocationProvider:featureController:ratchetStateProvider:lostModeController:]( objc_alloc(&OBJC_CLASS____TtC23LocalAuthenticationCore25LACDTOEnvironmentProvider),  "initWithLocationProvider:featureController:ratchetStateProvider:lostModeController:",  v12,  v11,  v10,  v9);

  return v13;
}

@end