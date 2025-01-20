@interface TrialNamespaceLinkTest
+ (id)sharedObj;
- (BOOL)subscribeToTrialUpdates;
- (TRIExperimentIdentifiers)experimentIDs;
- (TrialNamespaceLinkTest)init;
- (int64_t)apsdSiriTCP_denominator;
- (int64_t)apsdSiriTCP_numerator;
- (int64_t)apsdSiriTLS_denominator;
- (int64_t)apsdSiriTLS_numerator;
- (int64_t)apsdSiriTrafficClassBEVI_denominator;
- (int64_t)apsdSiriTrafficClassBEVI_numerator;
- (int64_t)getInt64ForFactor:(id)a3 client:(id)a4 namespace:(id)a5 byDefault:(int64_t)a6;
- (int64_t)periodicSiriTCP_denominator;
- (int64_t)periodicSiriTCP_numerator;
- (int64_t)periodicSiriTLS_denominator;
- (int64_t)periodicSiriTLS_numerator;
- (int64_t)periodicSiriTrafficClassBEVI_denominator;
- (int64_t)periodicSiriTrafficClassBEVI_numerator;
- (int64_t)siriConnectionTimeoutThreshold;
- (int64_t)timeoutSiriTCP_denominator;
- (int64_t)timeoutSiriTCP_numerator;
- (int64_t)timeoutSiriTLS_denominator;
- (int64_t)timeoutSiriTLS_numerator;
- (int64_t)timeoutSiriTrafficClassBEVI_denominator;
- (int64_t)timeoutSiriTrafficClassBEVI_numerator;
- (void)init;
- (void)refresh;
@end

@implementation TrialNamespaceLinkTest

+ (id)sharedObj
{
  if (sharedObj_sharedTrialOnceToken != -1) {
    dispatch_once(&sharedObj_sharedTrialOnceToken, &__block_literal_global_0);
  }
  v2 = (void *)sharedObj_defaultConfiguration;
  if (!sharedObj_defaultConfiguration)
  {
    NSLog( @"%s: Failed to create TrialNamespaceLinkTest, resetting singleton",  "+[TrialNamespaceLinkTest sharedObj]");
    sharedObj_sharedTrialOnceToken = 0LL;
    v2 = (void *)sharedObj_defaultConfiguration;
  }

  return v2;
}

void __35__TrialNamespaceLinkTest_sharedObj__block_invoke()
{
  v0 = objc_alloc_init(&OBJC_CLASS___TrialNamespaceLinkTest);
  v1 = (void *)sharedObj_defaultConfiguration;
  sharedObj_defaultConfiguration = (uint64_t)v0;
}

- (TrialNamespaceLinkTest)init
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___TrialNamespaceLinkTest;
  v2 = -[TrialNamespaceLinkTest init](&v13, sel_init);
  v3 = v2;
  if (!v2) {
    goto LABEL_4;
  }
  v2->_trialProjectID = 324;
  p_trialProjectID = (unsigned int *)&v2->_trialProjectID;
  p_trialNamespaceName = &v2->_trialNamespaceName;
  trialNamespaceName = v2->_trialNamespaceName;
  v2->_trialNamespaceName = (NSString *)@"WIFI_POLICY_LINKTEST";

  uint64_t v7 = [MEMORY[0x189612BA8] clientWithIdentifier:*p_trialProjectID];
  trialClient = v3->_trialClient;
  v3->_trialClient = (TRIClient *)v7;

  dispatch_queue_t v9 = dispatch_queue_create("TrialNamespaceLinkTestQueue", 0LL);
  queue = v3->_queue;
  v3->_queue = (OS_dispatch_queue *)v9;

  if (!v3->_trialClient)
  {
    NSLog( @"%s: ERROR Trial Client not found _trialProjectID %d _trialNamespaceName %@",  "-[TrialNamespaceLinkTest init]",  *p_trialProjectID,  *p_trialNamespaceName);
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_FAULT)) {
      -[TrialNamespaceLinkTest init].cold.1(&v3->_trialProjectID, (uint64_t *)&v3->_trialNamespaceName);
    }
    __assert_rtn("-[TrialNamespaceLinkTest init]", "TrialNamespaceLinkTest.m", 123, "false");
  }

  if (!-[TrialNamespaceLinkTest subscribeToTrialUpdates](v3, "subscribeToTrialUpdates"))
  {
    NSLog( @"%s: Failed to configure subscription for _trialProjectID %d _trialNamespaceName %@",  "-[TrialNamespaceLinkTest init]",  *p_trialProjectID,  *p_trialNamespaceName);
    v11 = 0LL;
  }

  else
  {
LABEL_4:
    v11 = v3;
  }

  return v11;
}

- (BOOL)subscribeToTrialUpdates
{
  trialClient = self->_trialClient;
  if (trialClient)
  {
    NSLog( @"%s: checkTreatmentUpdate:subcribing to %@ trial",  a2,  "-[TrialNamespaceLinkTest subscribeToTrialUpdates]",  self->_trialNamespaceName);
    uint64_t v14 = 0LL;
    v15 = &v14;
    uint64_t v16 = 0x2020000000LL;
    char v17 = 0;
    v4 = (void *)MEMORY[0x1895BA820]();
    objc_initWeak(&location, self);
    trialNamespaceName = self->_trialNamespaceName;
    v5 = self->_trialClient;
    queue = self->_queue;
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    v11[2] = __49__TrialNamespaceLinkTest_subscribeToTrialUpdates__block_invoke;
    v11[3] = &unk_18A16CB90;
    objc_copyWeak(&v12, &location);
    v11[4] = &v14;
    -[TRIClient addUpdateHandlerForNamespaceName:queue:usingBlock:]( v5,  "addUpdateHandlerForNamespaceName:queue:usingBlock:",  trialNamespaceName,  queue,  v11);
    v8 = (TRINotificationToken *)objc_claimAutoreleasedReturnValue();
    trialToken = self->_trialToken;
    self->_trialToken = v8;

    if (!*((_BYTE *)v15 + 24)) {
      -[TrialNamespaceLinkTest refresh](self, "refresh");
    }
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
    objc_autoreleasePoolPop(v4);
    NSLog( @"%s: checkTreatmentUpdate:subcribing complete",  "-[TrialNamespaceLinkTest subscribeToTrialUpdates]");
    _Block_object_dispose(&v14, 8);
  }

  else
  {
    NSLog(@"%s: ERROR nil _trialClient, failing", a2, "-[TrialNamespaceLinkTest subscribeToTrialUpdates]");
  }

  return trialClient != 0LL;
}

void __49__TrialNamespaceLinkTest_subscribeToTrialUpdates__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  NSLog( @"%s: checkTreatmentUpdate:%@ Trial update noted",  "-[TrialNamespaceLinkTest subscribeToTrialUpdates]_block_invoke",  WeakRetained[3]);
  [WeakRetained refresh];
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
}

- (void)refresh
{
  obj = self;
  objc_sync_enter(obj);
  -[TRIClient refresh](obj->_trialClient, "refresh");
  uint64_t v2 = -[TRIClient experimentIdentifiersWithNamespaceName:]( obj->_trialClient,  "experimentIdentifiersWithNamespaceName:",  obj->_trialNamespaceName);
  experimentIDs = obj->experimentIDs;
  obj->experimentIDs = (TRIExperimentIdentifiers *)v2;
  v4 = -[TRIExperimentIdentifiers experimentId](obj->experimentIDs, "experimentId");
  uint64_t v5 = -[TRIExperimentIdentifiers deploymentId](obj->experimentIDs, "deploymentId");
  v6 = -[TRIExperimentIdentifiers treatmentId](obj->experimentIDs, "treatmentId");
  NSLog( @"%s: Trial TRIExperimentIdentifiers: experimentId: %@, deploymentId: %d, treatmentId: %@",  "-[TrialNamespaceLinkTest refresh]",  v4,  v5,  v6);

  obj->periodicSiriTCP_numerator = -[TrialNamespaceLinkTest getInt64ForFactor:client:namespace:byDefault:]( obj,  "getInt64ForFactor:client:namespace:byDefault:",  @"SiriPeriodicTCPSample.numerator",  obj->_trialClient,  obj->_trialNamespaceName,  1LL);
  obj->periodicSiriTCP_denominator = -[TrialNamespaceLinkTest getInt64ForFactor:client:namespace:byDefault:]( obj,  "getInt64ForFactor:client:namespace:byDefault:",  @"SiriPeriodicTCPSample.denominator",  obj->_trialClient,  obj->_trialNamespaceName,  24LL);
  obj->periodicSiriTLS_numerator = -[TrialNamespaceLinkTest getInt64ForFactor:client:namespace:byDefault:]( obj,  "getInt64ForFactor:client:namespace:byDefault:",  @"SiriPeriodicTLSSample.numerator",  obj->_trialClient,  obj->_trialNamespaceName,  1LL);
  obj->periodicSiriTLS_denominator = -[TrialNamespaceLinkTest getInt64ForFactor:client:namespace:byDefault:]( obj,  "getInt64ForFactor:client:namespace:byDefault:",  @"SiriPeriodicTLSSample.denominator",  obj->_trialClient,  obj->_trialNamespaceName,  24LL);
  obj->periodicSiriTrafficClassBEVI_numerator = -[TrialNamespaceLinkTest getInt64ForFactor:client:namespace:byDefault:]( obj,  "getInt64ForFactor:client:namespace:byDefault:",  @"SiriPeriodicTLSSample.numerator",  obj->_trialClient,  obj->_trialNamespaceName,  1LL);
  obj->periodicSiriTrafficClassBEVI_denominator = -[TrialNamespaceLinkTest getInt64ForFactor:client:namespace:byDefault:]( obj,  "getInt64ForFactor:client:namespace:byDefault:",  @"SiriPeriodicBEVI.denominator",  obj->_trialClient,  obj->_trialNamespaceName,  2LL);
  obj->timeoutSiriTCP_numerator = -[TrialNamespaceLinkTest getInt64ForFactor:client:namespace:byDefault:]( obj,  "getInt64ForFactor:client:namespace:byDefault:",  @"SiriTimeoutTCPSample.numerator",  obj->_trialClient,  obj->_trialNamespaceName,  0LL);
  obj->timeoutSiriTCP_denominator = -[TrialNamespaceLinkTest getInt64ForFactor:client:namespace:byDefault:]( obj,  "getInt64ForFactor:client:namespace:byDefault:",  @"SiriTimeoutTCPSample.denominator",  obj->_trialClient,  obj->_trialNamespaceName,  1LL);
  obj->timeoutSiriTLS_numerator = -[TrialNamespaceLinkTest getInt64ForFactor:client:namespace:byDefault:]( obj,  "getInt64ForFactor:client:namespace:byDefault:",  @"SiriTimeoutTLSSample.numerator",  obj->_trialClient,  obj->_trialNamespaceName,  1LL);
  obj->timeoutSiriTLS_denominator = -[TrialNamespaceLinkTest getInt64ForFactor:client:namespace:byDefault:]( obj,  "getInt64ForFactor:client:namespace:byDefault:",  @"SiriTimeoutTLSSample.denominator",  obj->_trialClient,  obj->_trialNamespaceName,  1LL);
  obj->timeoutSiriTrafficClassBEVI_numerator = -[TrialNamespaceLinkTest getInt64ForFactor:client:namespace:byDefault:]( obj,  "getInt64ForFactor:client:namespace:byDefault:",  @"SiriTimeoutBEVI.numerator",  obj->_trialClient,  obj->_trialNamespaceName,  1LL);
  obj->timeoutSiriTrafficClassBEVI_denominator = -[TrialNamespaceLinkTest getInt64ForFactor:client:namespace:byDefault:]( obj,  "getInt64ForFactor:client:namespace:byDefault:",  @"SiriTimeoutBEVI.denominator",  obj->_trialClient,  obj->_trialNamespaceName,  2LL);
  obj->apsdSiriTCP_numerator = -[TrialNamespaceLinkTest getInt64ForFactor:client:namespace:byDefault:]( obj,  "getInt64ForFactor:client:namespace:byDefault:",  @"ApsdTimeoutTCPSample.numerator",  obj->_trialClient,  obj->_trialNamespaceName,  1LL);
  obj->apsdSiriTCP_denominator = -[TrialNamespaceLinkTest getInt64ForFactor:client:namespace:byDefault:]( obj,  "getInt64ForFactor:client:namespace:byDefault:",  @"ApsdTimeoutTCPSample.denominator",  obj->_trialClient,  obj->_trialNamespaceName,  10LL);
  obj->apsdSiriTLS_numerator = -[TrialNamespaceLinkTest getInt64ForFactor:client:namespace:byDefault:]( obj,  "getInt64ForFactor:client:namespace:byDefault:",  @"ApsdTimeoutTLSSample.numerator",  obj->_trialClient,  obj->_trialNamespaceName,  0LL);
  obj->apsdSiriTLS_denominator = -[TrialNamespaceLinkTest getInt64ForFactor:client:namespace:byDefault:]( obj,  "getInt64ForFactor:client:namespace:byDefault:",  @"ApsdTimeoutTLSSample.denominator",  obj->_trialClient,  obj->_trialNamespaceName,  1LL);
  obj->apsdSiriTrafficClassBEVI_numerator = -[TrialNamespaceLinkTest getInt64ForFactor:client:namespace:byDefault:]( obj,  "getInt64ForFactor:client:namespace:byDefault:",  @"ApsdTimeoutBEVI.numerator",  obj->_trialClient,  obj->_trialNamespaceName,  1LL);
  obj->apsdSiriTrafficClassBEVI_denominator = -[TrialNamespaceLinkTest getInt64ForFactor:client:namespace:byDefault:]( obj,  "getInt64ForFactor:client:namespace:byDefault:",  @"ApsdTimeoutBEVI.denominator",  obj->_trialClient,  obj->_trialNamespaceName,  2LL);
  obj->siriConnectionTimeoutThreshold = -[TrialNamespaceLinkTest getInt64ForFactor:client:namespace:byDefault:]( obj,  "getInt64ForFactor:client:namespace:byDefault:",  @"SiriConnectionTimeoutThreshold",  obj->_trialClient,  obj->_trialNamespaceName,  15LL);
  objc_sync_exit(obj);
}

- (int64_t)getInt64ForFactor:(id)a3 client:(id)a4 namespace:(id)a5 byDefault:(int64_t)a6
{
  id v9 = a3;
  id v10 = a5;
  [a4 levelForFactor:v9 withNamespaceName:v10];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  id v12 = v11;
  if (v11)
  {
    a6 = [v11 longValue];
    NSLog( @"%s: Trial config for %@: %lld",  "-[TrialNamespaceLinkTest getInt64ForFactor:client:namespace:byDefault:]",  v9,  a6);
  }

  else
  {
    NSLog( @"%s: Trial returned no factor %@ with namespace %@.",  "-[TrialNamespaceLinkTest getInt64ForFactor:client:namespace:byDefault:]",  v9,  v10);
  }

  return a6;
}

- (TRIExperimentIdentifiers)experimentIDs
{
  return self->experimentIDs;
}

- (int64_t)periodicSiriTCP_numerator
{
  return self->periodicSiriTCP_numerator;
}

- (int64_t)periodicSiriTCP_denominator
{
  return self->periodicSiriTCP_denominator;
}

- (int64_t)periodicSiriTLS_numerator
{
  return self->periodicSiriTLS_numerator;
}

- (int64_t)periodicSiriTLS_denominator
{
  return self->periodicSiriTLS_denominator;
}

- (int64_t)periodicSiriTrafficClassBEVI_numerator
{
  return self->periodicSiriTrafficClassBEVI_numerator;
}

- (int64_t)periodicSiriTrafficClassBEVI_denominator
{
  return self->periodicSiriTrafficClassBEVI_denominator;
}

- (int64_t)timeoutSiriTCP_numerator
{
  return self->timeoutSiriTCP_numerator;
}

- (int64_t)timeoutSiriTCP_denominator
{
  return self->timeoutSiriTCP_denominator;
}

- (int64_t)timeoutSiriTLS_numerator
{
  return self->timeoutSiriTLS_numerator;
}

- (int64_t)timeoutSiriTLS_denominator
{
  return self->timeoutSiriTLS_denominator;
}

- (int64_t)timeoutSiriTrafficClassBEVI_numerator
{
  return self->timeoutSiriTrafficClassBEVI_numerator;
}

- (int64_t)timeoutSiriTrafficClassBEVI_denominator
{
  return self->timeoutSiriTrafficClassBEVI_denominator;
}

- (int64_t)apsdSiriTCP_numerator
{
  return self->apsdSiriTCP_numerator;
}

- (int64_t)apsdSiriTCP_denominator
{
  return self->apsdSiriTCP_denominator;
}

- (int64_t)apsdSiriTLS_numerator
{
  return self->apsdSiriTLS_numerator;
}

- (int64_t)apsdSiriTLS_denominator
{
  return self->apsdSiriTLS_denominator;
}

- (int64_t)apsdSiriTrafficClassBEVI_numerator
{
  return self->apsdSiriTrafficClassBEVI_numerator;
}

- (int64_t)apsdSiriTrafficClassBEVI_denominator
{
  return self->apsdSiriTrafficClassBEVI_denominator;
}

- (int64_t)siriConnectionTimeoutThreshold
{
  return self->siriConnectionTimeoutThreshold;
}

- (void).cxx_destruct
{
}

- (void)init
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  int v2 = *a1;
  uint64_t v3 = *a2;
  v4[0] = 67109378;
  v4[1] = v2;
  __int16 v5 = 2112;
  uint64_t v6 = v3;
  _os_log_fault_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_FAULT,  "Trial Client not found _trialProjectID %d _trialNamespaceName %@",  (uint8_t *)v4,  0x12u);
}

@end