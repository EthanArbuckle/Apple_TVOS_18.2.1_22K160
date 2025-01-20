@interface LACDTOServiceXPCHost
- (LACDTOServiceXPCHost)initWithFeatureController:(id)a3 ratchetStateProvider:(id)a4 trustStateProvider:(id)a5 pendingEvaluationController:(id)a6;
- (void)cancelPendingEvaluationWithRatchetIdentifier:(id)a3 reason:(id)a4 completion:(id)a5;
- (void)checkCanEnableFeatureWithCompletion:(id)a3;
- (void)checkIsFeatureAvailableWithCompletion:(id)a3;
- (void)checkIsFeatureEnabledWithCompletion:(id)a3;
- (void)checkIsFeatureStrictModeEnabledWithCompletion:(id)a3;
- (void)checkIsFeatureSupportedWithCompletion:(id)a3;
- (void)checkIsSensorTrustedWithCompletion:(id)a3;
- (void)disableFeatureStrictModeWithContext:(id)a3 completion:(id)a4;
- (void)disableFeatureWithContext:(id)a3 completion:(id)a4;
- (void)enableFeatureActivatingGracePeriodWithCompletion:(id)a3;
- (void)enableFeatureStrictModeWithCompletion:(id)a3;
- (void)enableFeatureWithCompletion:(id)a3;
- (void)ratchetStateCompositeWithCompletion:(id)a3;
- (void)ratchetStateWithCompletion:(id)a3;
@end

@implementation LACDTOServiceXPCHost

- (LACDTOServiceXPCHost)initWithFeatureController:(id)a3 ratchetStateProvider:(id)a4 trustStateProvider:(id)a5 pendingEvaluationController:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___LACDTOServiceXPCHost;
  v15 = -[LACDTOServiceXPCHost init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_featureController, a3);
    objc_storeStrong((id *)&v16->_ratchetStateProvider, a4);
    objc_storeStrong((id *)&v16->_pendingEvaluationController, a6);
    objc_storeStrong((id *)&v16->_trustStateProvider, a5);
  }

  return v16;
}

- (void)checkIsFeatureEnabledWithCompletion:(id)a3
{
}

- (void)checkIsFeatureSupportedWithCompletion:(id)a3
{
}

- (void)checkIsFeatureAvailableWithCompletion:(id)a3
{
}

- (void)checkIsFeatureStrictModeEnabledWithCompletion:(id)a3
{
}

- (void)checkIsSensorTrustedWithCompletion:(id)a3
{
}

- (void)checkCanEnableFeatureWithCompletion:(id)a3
{
}

- (void)enableFeatureWithCompletion:(id)a3
{
}

- (void)enableFeatureActivatingGracePeriodWithCompletion:(id)a3
{
}

- (void)disableFeatureWithContext:(id)a3 completion:(id)a4
{
}

- (void)enableFeatureStrictModeWithCompletion:(id)a3
{
}

- (void)disableFeatureStrictModeWithContext:(id)a3 completion:(id)a4
{
}

- (void)ratchetStateWithCompletion:(id)a3
{
}

- (void)ratchetStateCompositeWithCompletion:(id)a3
{
}

- (void)cancelPendingEvaluationWithRatchetIdentifier:(id)a3 reason:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc(&OBJC_CLASS___LACXPCClient);
  [MEMORY[0x189607B30] currentConnection];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  id v13 = -[LACXPCClient initWithConnection:](v11, "initWithConnection:", v12);

  -[LACDTOPendingPolicyEvaluationController cancelPendingEvaluationForClient:ratchetIdentifier:reason:completion:]( self->_pendingEvaluationController,  "cancelPendingEvaluationForClient:ratchetIdentifier:reason:completion:",  v13,  v10,  v9,  v8);
}

- (void).cxx_destruct
{
}

@end