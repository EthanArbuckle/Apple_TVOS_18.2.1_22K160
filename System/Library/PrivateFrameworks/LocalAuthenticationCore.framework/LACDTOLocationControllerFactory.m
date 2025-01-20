@interface LACDTOLocationControllerFactory
+ (id)controllerWithStore:(id)a3 featureController:(id)a4 eventBus:(id)a5 workQueue:(id)a6;
@end

@implementation LACDTOLocationControllerFactory

+ (id)controllerWithStore:(id)a3 featureController:(id)a4 eventBus:(id)a5 workQueue:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  uint64_t v12 = MEMORY[0x1895F87A8];
  v38[0] = MEMORY[0x1895F87A8];
  v38[1] = 3221225472LL;
  v38[2] = __92__LACDTOLocationControllerFactory_controllerWithStore_featureController_eventBus_workQueue___block_invoke;
  v38[3] = &unk_18A368C50;
  id v13 = v11;
  id v39 = v13;
  id v14 = v9;
  id v40 = v14;
  id v41 = v10;
  id v15 = v10;
  id v16 = a5;
  __92__LACDTOLocationControllerFactory_controllerWithStore_featureController_eventBus_workQueue___block_invoke((uint64_t)v38);
  v34[0] = v12;
  v34[1] = 3221225472LL;
  v34[2] = __92__LACDTOLocationControllerFactory_controllerWithStore_featureController_eventBus_workQueue___block_invoke_3;
  v34[3] = &unk_18A368C78;
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  id v35 = v17;
  id v18 = v14;
  id v36 = v18;
  id v19 = v13;
  id v37 = v19;
  __92__LACDTOLocationControllerFactory_controllerWithStore_featureController_eventBus_workQueue___block_invoke_3(v34);
  uint64_t v26 = v12;
  uint64_t v27 = 3221225472LL;
  v28 = __92__LACDTOLocationControllerFactory_controllerWithStore_featureController_eventBus_workQueue___block_invoke_4;
  v29 = &unk_18A368CA0;
  id v30 = v17;
  id v31 = v18;
  id v32 = (id)objc_claimAutoreleasedReturnValue();
  id v33 = v19;
  id v20 = v19;
  id v21 = v32;
  id v22 = v18;
  id v23 = v17;
  __92__LACDTOLocationControllerFactory_controllerWithStore_featureController_eventBus_workQueue___block_invoke_4(&v26);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setEventBus:", v16, v26, v27, v28, v29);

  return v24;
}

LACDTOLocationProviderModeDecorator *__92__LACDTOLocationControllerFactory_controllerWithStore_featureController_eventBus_workQueue___block_invoke( uint64_t a1)
{
  v2 = objc_alloc(&OBJC_CLASS___LACDTOLocationProviderModeDecorator);
  uint64_t v6 = MEMORY[0x1895F87A8];
  uint64_t v7 = 3221225472LL;
  v8 = __92__LACDTOLocationControllerFactory_controllerWithStore_featureController_eventBus_workQueue___block_invoke_2;
  id v9 = &unk_18A368C28;
  id v10 = *(id *)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  __92__LACDTOLocationControllerFactory_controllerWithStore_featureController_eventBus_workQueue___block_invoke_2((uint64_t)&v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[LACDTOLocationProviderModeDecorator initWithLocationProvider:featureController:]( v2,  "initWithLocationProvider:featureController:",  v3,  *(void *)(a1 + 48),  v6,  v7,  v8,  v9);

  return v4;
}

LACDTOLocationProviderTaskDecorator *__92__LACDTOLocationControllerFactory_controllerWithStore_featureController_eventBus_workQueue___block_invoke_2( uint64_t a1)
{
  if (_os_feature_enabled_impl())
  {
    v2 = -[LACDTOLocationProviderCRAdapter initWithWorkQueue:]( objc_alloc(&OBJC_CLASS___LACDTOLocationProviderCRAdapter),  "initWithWorkQueue:",  *(void *)(a1 + 32));
    v3 = -[LACDTOLocationProviderTaskDecorator initWithLocationProvider:workQueue:]( objc_alloc(&OBJC_CLASS___LACDTOLocationProviderTaskDecorator),  "initWithLocationProvider:workQueue:",  v2,  *(void *)(a1 + 32));
  }

  else
  {
    v3 = -[LACDTOLocationProviderKVSAdapter initWithKVStore:]( objc_alloc(&OBJC_CLASS___LACDTOLocationProviderKVSAdapter),  "initWithKVStore:",  *(void *)(a1 + 40));
  }

  return v3;
}

LACDTOLocationMonitor *__92__LACDTOLocationControllerFactory_controllerWithStore_featureController_eventBus_workQueue___block_invoke_3( void *a1)
{
  v2 = -[LACDTOLocationProviderPersistenceDecorator initWithLocationProvider:store:cacheEnabled:]( objc_alloc(&OBJC_CLASS___LACDTOLocationProviderPersistenceDecorator),  "initWithLocationProvider:store:cacheEnabled:",  a1[4],  a1[5],  1LL);
  v3 = -[LACDTOLocationMonitor initWithLocationProvider:workQueue:]( objc_alloc(&OBJC_CLASS___LACDTOLocationMonitor),  "initWithLocationProvider:workQueue:",  v2,  a1[6]);

  return v3;
}

LACDTOLocationController *__92__LACDTOLocationControllerFactory_controllerWithStore_featureController_eventBus_workQueue___block_invoke_4( void *a1)
{
  v2 = -[LACDTOLocationProviderPersistenceDecorator initWithLocationProvider:store:cacheEnabled:]( objc_alloc(&OBJC_CLASS___LACDTOLocationProviderPersistenceDecorator),  "initWithLocationProvider:store:cacheEnabled:",  a1[4],  a1[5],  0LL);
  v3 = -[LACDTOLocationController initWithLocationProvider:monitor:workQueue:]( objc_alloc(&OBJC_CLASS___LACDTOLocationController),  "initWithLocationProvider:monitor:workQueue:",  v2,  a1[6],  a1[7]);

  return v3;
}

@end