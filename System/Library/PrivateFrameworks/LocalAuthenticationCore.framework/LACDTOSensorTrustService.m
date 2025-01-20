@interface LACDTOSensorTrustService
- (LACDTOSensorTrustService)initWithReplyQueue:(id)a3 uiController:(id)a4 store:(id)a5 featureStateProvider:(id)a6;
- (id)_repairStateProvider;
- (id)_trustStore;
- (id)_trustVerifier;
- (id)_uiPresenter;
- (id)evaluationProcessor;
- (id)trustStateProvider;
@end

@implementation LACDTOSensorTrustService

- (LACDTOSensorTrustService)initWithReplyQueue:(id)a3 uiController:(id)a4 store:(id)a5 featureStateProvider:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___LACDTOSensorTrustService;
  v15 = -[LACDTOSensorTrustService init](&v22, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_replyQueue, a3);
    objc_storeStrong((id *)&v16->_uiController, a4);
    objc_storeStrong((id *)&v16->_store, a5);
    objc_storeStrong((id *)&v16->_featureStateProvider, a6);
    uint64_t v17 = +[LACFlags sharedInstance](&OBJC_CLASS___LACFlags, "sharedInstance");
    flags = v16->_flags;
    v16->_flags = (LACFlagsProvider *)v17;

    v19 = -[LACDTOSensorTrustStateProvider initWithStore:]( objc_alloc(&OBJC_CLASS___LACDTOSensorTrustStateProvider),  "initWithStore:",  v16->_store);
    trustStateProvider = v16->_trustStateProvider;
    v16->_trustStateProvider = v19;
  }

  return v16;
}

- (id)evaluationProcessor
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[LACDTOSensorTrustService _trustStore](self, "_trustStore");
  v5 = -[LACDTOSensorTrustService _uiPresenter](self, "_uiPresenter");
  v6 = -[LACDTOSensorTrustController initWithReplyQueue:ui:store:verifier:flags:]( objc_alloc(&OBJC_CLASS___LACDTOSensorTrustController),  "initWithReplyQueue:ui:store:verifier:flags:",  self->_replyQueue,  v5,  v4,  v3,  self->_flags);

  return v6;
}

- (id)trustStateProvider
{
  return self->_trustStateProvider;
}

- (id)_repairStateProvider
{
  return +[LACDTOSensorRepairStateProviderFactory repairStateProviderWithReplyQueue:flags:]( &OBJC_CLASS___LACDTOSensorRepairStateProviderFactory,  "repairStateProviderWithReplyQueue:flags:",  self->_replyQueue,  self->_flags);
}

- (id)_trustVerifier
{
  v3 = objc_alloc(&OBJC_CLASS___LACDTOSensorTrustVerifier);
  v4 = -[LACDTOSensorTrustService trustStateProvider](self, "trustStateProvider");
  featureStateProvider = self->_featureStateProvider;
  v6 = -[LACDTOSensorTrustService _repairStateProvider](self, "_repairStateProvider");
  v7 = -[LACDTOSensorTrustVerifier initWithTrustStateProvider:featureStateProvider:repairStateProvider:]( v3,  "initWithTrustStateProvider:featureStateProvider:repairStateProvider:",  v4,  featureStateProvider,  v6);

  return v7;
}

- (id)_trustStore
{
  return  -[LACDTOSensorTrustStoreKVSAdapter initWithKVStore:]( objc_alloc(&OBJC_CLASS___LACDTOSensorTrustStoreKVSAdapter),  "initWithKVStore:",  self->_store);
}

- (id)_uiPresenter
{
  return  -[LACUserInterfacePresenter initWithReplyQueue:uiController:]( objc_alloc(&OBJC_CLASS___LACUserInterfacePresenter),  "initWithReplyQueue:uiController:",  self->_replyQueue,  self->_uiController);
}

- (void).cxx_destruct
{
}

@end