@interface WFMeasure
+ (BOOL)isOnSupportedPlatform;
- (BOOL)doDNSResolution:(id)a3 timeout:(int64_t)a4;
- (BOOL)doPing:(id)a3 count:(int64_t)a4 timeout:(int64_t)a5 size:(int64_t)a6 class:(int64_t)a7 minRTT:(int64_t *)a8 maxRTT:(int64_t *)a9 successCount:(int64_t *)a10;
- (BOOL)isApsdTimeout;
- (BOOL)isInProgress;
- (BOOL)isParis;
- (BOOL)isPeriodicTest;
- (BOOL)isRetest;
- (BOOL)isSiriTimeout;
- (BOOL)shouldApsdSampleSiriTCP;
- (BOOL)shouldApsdSampleSiriTLS;
- (BOOL)shouldPeriodicSampleSiriTCP;
- (BOOL)shouldPeriodicSampleSiriTLS;
- (BOOL)shouldTimeoutSampleSiriTCP;
- (BOOL)shouldTimeoutSampleSiriTLS;
- (BOOL)start:(id)a3 withCompletionQueue:(id)a4;
- (NSMutableSet)dnsServers;
- (NSString)gatewayAddress;
- (NSString)interfaceName;
- (NSString)publicDNSAddress;
- (NSString)testDNSHostname;
- (NSString)testReason;
- (OS_dispatch_group)dispatchGroup;
- (OS_dispatch_queue)completionQueue;
- (OS_dispatch_queue)internalQueue;
- (WFMeasure)initWithType:(unint64_t)a3 andReason:(id)a4 prevTestedOptions:(unint64_t)a5 andInterfaceName:(id)a6;
- (WFMeasureResult)result;
- (id)completionHandler;
- (id)description;
- (unint64_t)options;
- (unsigned)getApsdSampleTrafficClass;
- (unsigned)getPeriodicSampleTrafficClass;
- (unsigned)getTimeoutSampleTrafficClass;
- (unsigned)tclass;
- (void)abort;
- (void)dispatchDNSTest:(id)a3;
- (void)dispatchPingTest:(unint64_t)a3;
- (void)dispatchSiriTest:(int64_t)a3 trafficClass:(unsigned int)a4;
- (void)dispatchThroughputTest;
- (void)doThroughputTest;
- (void)getLazyNSNumberPreference:(id)a3 exists:(id)a4;
- (void)getLazyNSStringPreference:(id)a3 exists:(id)a4;
- (void)retrieveNetworkConfigurations;
- (void)setCompletionHandler:(id)a3;
- (void)setCompletionQueue:(id)a3;
- (void)setDispatchGroup:(id)a3;
- (void)setDnsServers:(id)a3;
- (void)setGatewayAddress:(id)a3;
- (void)setInterfaceName:(id)a3;
- (void)setInternalQueue:(id)a3;
- (void)setIsApsdTimeout:(BOOL)a3;
- (void)setIsInProgress:(BOOL)a3;
- (void)setIsParis:(BOOL)a3;
- (void)setIsPeriodicTest:(BOOL)a3;
- (void)setIsRetest:(BOOL)a3;
- (void)setIsSiriTimeout:(BOOL)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setPublicDNSAddress:(id)a3;
- (void)setResult:(id)a3;
- (void)setTclass:(unsigned int)a3;
- (void)setTestDNSHostname:(id)a3;
- (void)setTestReason:(id)a3;
@end

@implementation WFMeasure

+ (BOOL)isOnSupportedPlatform
{
  return MGGetSInt32Answer() != 4;
}

- (WFMeasure)initWithType:(unint64_t)a3 andReason:(id)a4 prevTestedOptions:(unint64_t)a5 andInterfaceName:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  v38.receiver = self;
  v38.super_class = (Class)&OBJC_CLASS___WFMeasure;
  v12 = -[WFMeasure init](&v38, sel_init);
  uint64_t v34 = 0LL;
  v35 = &v34;
  uint64_t v36 = 0x2020000000LL;
  char v37 = 0;
  uint64_t v30 = 0LL;
  v31 = &v30;
  uint64_t v32 = 0x2020000000LL;
  char v33 = 0;
  *(_DWORD *)&v12->_isPeriodicTest = 0;
  p_isPeriodicTest = &v12->_isPeriodicTest;
  v12->_isParis = 0;
  NSLog( @"%s: Requesting test type: %lu for Reason: %@ prevTestedOptions: %lx using interface: %@",  "-[WFMeasure initWithType:andReason:prevTestedOptions:andInterfaceName:]",  a3,  v10,  a5,  v11);
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    NSLog( @"%s: feature not enabled",  "-[WFMeasure initWithType:andReason:prevTestedOptions:andInterfaceName:]");
    goto LABEL_25;
  }

  if (MGGetBoolAnswer())
  {
    *((_BYTE *)v31 + 24) = 1;
    v29[0] = MEMORY[0x1895F87A8];
    v29[1] = 3221225472LL;
    v29[2] = __71__WFMeasure_initWithType_andReason_prevTestedOptions_andInterfaceName___block_invoke;
    v29[3] = &unk_18A16CE50;
    v29[4] = &v30;
    -[WFMeasure getLazyNSNumberPreference:exists:]( v12,  "getLazyNSNumberPreference:exists:",  @"behave_as_internal",  v29);
  }

  if (MGGetBoolAnswer())
  {
    v28[0] = MEMORY[0x1895F87A8];
    v28[1] = 3221225472LL;
    v28[2] = __71__WFMeasure_initWithType_andReason_prevTestedOptions_andInterfaceName___block_invoke_2;
    v28[3] = &unk_18A16CE50;
    v28[4] = &v34;
    -[WFMeasure getLazyNSNumberPreference:exists:]( v12,  "getLazyNSNumberPreference:exists:",  @"behave_as_seed",  v28);
  }

  if (MGGetBoolAnswer())
  {
    v26[0] = MEMORY[0x1895F87A8];
    v26[1] = 3221225472LL;
    v26[2] = __71__WFMeasure_initWithType_andReason_prevTestedOptions_andInterfaceName___block_invoke_3;
    v26[3] = &unk_18A16C818;
    v27 = v12;
    -[WFMeasure getLazyNSNumberPreference:exists:]( v27,  "getLazyNSNumberPreference:exists:",  @"behave_as_paris",  v26);
  }

  -[WFMeasure setIsInProgress:](v12, "setIsInProgress:", 0LL);
  -[WFMeasure setOptions:](v12, "setOptions:", 0LL);
  -[WFMeasure setInterfaceName:](v12, "setInterfaceName:", v11);
  -[WFMeasure setTestReason:](v12, "setTestReason:", v10);
  dispatch_group_t v14 = dispatch_group_create();
  -[WFMeasure setDispatchGroup:](v12, "setDispatchGroup:", v14);

  -[WFMeasure setTclass:](v12, "setTclass:", 700LL);
  if (a5)
  {
    NSLog( @"%s: Because prevTestedOptions is nonzero, assuming this is a retest",  "-[WFMeasure initWithType:andReason:prevTestedOptions:andInterfaceName:]");
    v12->_isRetest = 1;
  }

  if (MGGetBoolAnswer())
  {
    v24[0] = MEMORY[0x1895F87A8];
    v24[1] = 3221225472LL;
    v24[2] = __71__WFMeasure_initWithType_andReason_prevTestedOptions_andInterfaceName___block_invoke_4;
    v24[3] = &unk_18A16C818;
    v25 = v12;
    -[WFMeasure getLazyNSNumberPreference:exists:]( v25,  "getLazyNSNumberPreference:exists:",  @"behave_as_retest",  v24);
  }

  if (v12->_isRetest)
  {
    NSLog( @"%s: Because _isRetest using previous test options 0x%lx",  "-[WFMeasure initWithType:andReason:prevTestedOptions:andInterfaceName:]",  a5);
    -[WFMeasure setOptions:](v12, "setOptions:", a5);
  }

  switch(a3)
  {
    case 0xFFFFFFFFuLL:
      -[WFMeasure setOptions:](v12, "setOptions:", -[WFMeasure options](v12, "options") | 1);
      -[WFMeasure setOptions:](v12, "setOptions:", -[WFMeasure options](v12, "options") | 2);
      -[WFMeasure setOptions:](v12, "setOptions:", -[WFMeasure options](v12, "options") | 4);
      if (!*((_BYTE *)v31 + 24) && !*((_BYTE *)v35 + 24) && *p_isPeriodicTest) {
        break;
      }
LABEL_32:
      -[WFMeasure setOptions:](v12, "setOptions:", -[WFMeasure options](v12, "options") | 8);
      uint64_t v15 = -[WFMeasure options](v12, "options") | 0x10;
      goto LABEL_33;
    case 2uLL:
      -[WFMeasure setOptions:](v12, "setOptions:", -[WFMeasure options](v12, "options") | 2);
      -[WFMeasure setOptions:](v12, "setOptions:", -[WFMeasure options](v12, "options") | 4);
      if (v12->_isParis && !*((_BYTE *)v31 + 24) && !*((_BYTE *)v35 + 24) && *p_isPeriodicTest) {
        break;
      }
      goto LABEL_32;
    case 1uLL:
      uint64_t v15 = -[WFMeasure options](v12, "options") | 1;
LABEL_33:
      -[WFMeasure setOptions:](v12, "setOptions:", v15);
      break;
  }

  if (!+[WFMeasure isOnSupportedPlatform](&OBJC_CLASS___WFMeasure, "isOnSupportedPlatform")
    || a3 != 0xFFFFFFFF && a3 != 2)
  {
    goto LABEL_75;
  }

  if (!v12->_isSiriTimeout)
  {
    if (*p_isPeriodicTest)
    {
      if (-[WFMeasure shouldPeriodicSampleSiriTLS](v12, "shouldPeriodicSampleSiriTLS")) {
        -[WFMeasure setOptions:](v12, "setOptions:", -[WFMeasure options](v12, "options") | 0x40);
      }
      if ((-[WFMeasure options](v12, "options") & 0x40) == 0
        && -[WFMeasure shouldPeriodicSampleSiriTCP](v12, "shouldPeriodicSampleSiriTCP"))
      {
        -[WFMeasure setOptions:](v12, "setOptions:", -[WFMeasure options](v12, "options") | 0x20);
      }

      -[WFMeasure setTclass:]( v12,  "setTclass:",  -[WFMeasure getPeriodicSampleTrafficClass](v12, "getPeriodicSampleTrafficClass"));
      if (![v10 containsString:@"tls"])
      {
        goto LABEL_75;
      }
    }

    else
    {
      if (!v12->_isApsdTimeout) {
        goto LABEL_75;
      }
      if (-[WFMeasure shouldApsdSampleSiriTLS](v12, "shouldApsdSampleSiriTLS")) {
        -[WFMeasure setOptions:](v12, "setOptions:", -[WFMeasure options](v12, "options") | 0x40);
      }
      if ((-[WFMeasure options](v12, "options") & 0x40) == 0
        && -[WFMeasure shouldApsdSampleSiriTCP](v12, "shouldApsdSampleSiriTCP"))
      {
        -[WFMeasure setOptions:](v12, "setOptions:", -[WFMeasure options](v12, "options") | 0x20);
      }

      -[WFMeasure setTclass:]( v12,  "setTclass:",  -[WFMeasure getApsdSampleTrafficClass](v12, "getApsdSampleTrafficClass"));
      if (![v10 containsString:@"tls"])
      {
        goto LABEL_75;
      }
    }

void __71__WFMeasure_initWithType_andReason_prevTestedOptions_andInterfaceName___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v3 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  id v4 = a2;
  NSLog( @"%s: Setting isInternal from %u to %u",  "-[WFMeasure initWithType:andReason:prevTestedOptions:andInterfaceName:]_block_invoke",  v3,  [v4 BOOLValue]);
  LOBYTE(v3) = [v4 BOOLValue];

  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v3;
}

void __71__WFMeasure_initWithType_andReason_prevTestedOptions_andInterfaceName___block_invoke_2( uint64_t a1,  void *a2)
{
  uint64_t v3 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  id v4 = a2;
  NSLog( @"%s: Setting isSeedBuild from %u to %u",  "-[WFMeasure initWithType:andReason:prevTestedOptions:andInterfaceName:]_block_invoke_2",  v3,  [v4 BOOLValue]);
  LOBYTE(v3) = [v4 BOOLValue];

  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v3;
}

void __71__WFMeasure_initWithType_andReason_prevTestedOptions_andInterfaceName___block_invoke_3( uint64_t a1,  void *a2)
{
  uint64_t v3 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 13LL);
  id v4 = a2;
  NSLog( @"%s: Setting _isParis from %u to %u",  "-[WFMeasure initWithType:andReason:prevTestedOptions:andInterfaceName:]_block_invoke_3",  v3,  [v4 BOOLValue]);
  LOBYTE(v3) = [v4 BOOLValue];

  *(_BYTE *)(*(void *)(a1 + 32) + 13LL) = v3;
}

void __71__WFMeasure_initWithType_andReason_prevTestedOptions_andInterfaceName___block_invoke_4( uint64_t a1,  void *a2)
{
  uint64_t v3 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 12LL);
  id v4 = a2;
  NSLog( @"%s: Setting _isRetest from %u to %u",  "-[WFMeasure initWithType:andReason:prevTestedOptions:andInterfaceName:]_block_invoke_4",  v3,  [v4 BOOLValue]);
  LOBYTE(v3) = [v4 BOOLValue];

  *(_BYTE *)(*(void *)(a1 + 32) + 12LL) = v3;
}

uint64_t __71__WFMeasure_initWithType_andReason_prevTestedOptions_andInterfaceName___block_invoke_5( uint64_t a1,  void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  NSLog( @"%s: OVERRIDING kWFMeasurePreferenceTestOptions self.options from 0x%lx to 0x%x",  "-[WFMeasure initWithType:andReason:prevTestedOptions:andInterfaceName:]_block_invoke_5",  [v3 options],  objc_msgSend(v4, "unsignedIntValue"));
  LODWORD(v3) = [v4 unsignedIntValue];

  return [*(id *)(a1 + 32) setOptions:v3];
}

- (void)getLazyNSNumberPreference:(id)a3 exists:(id)a4
{
  id v9 = a3;
  v5 = (void (**)(id, void *))a4;
  [MEMORY[0x189604038] standardUserDefaults];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 persistentDomainForName:@"com.apple.wifipolicy.wfmeasure"];
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  [v7 objectForKey:v9];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    NSLog( @"%s: Found preference value in domain: %@ key: %@",  "-[WFMeasure getLazyNSNumberPreference:exists:]",  @"com.apple.wifipolicy.wfmeasure",  v9);
    v5[2](v5, v8);
  }
}

- (void)getLazyNSStringPreference:(id)a3 exists:(id)a4
{
  id v9 = a3;
  v5 = (void (**)(id, void *))a4;
  [MEMORY[0x189604038] standardUserDefaults];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 persistentDomainForName:@"com.apple.wifipolicy.wfmeasure"];
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  [v7 objectForKey:v9];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    NSLog( @"%s: Found preference value in domain: %@ key: %@",  "-[WFMeasure getLazyNSStringPreference:exists:]",  @"com.apple.wifipolicy.wfmeasure",  v9);
    v5[2](v5, v8);
  }
}

- (BOOL)shouldPeriodicSampleSiriTCP
{
  uint64_t v17 = 0LL;
  v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  int v20 = 0;
  uint64_t v13 = 0LL;
  dispatch_group_t v14 = &v13;
  uint64_t v15 = 0x2020000000LL;
  int v16 = 0;
  +[TrialNamespaceLinkTest sharedObj](&OBJC_CLASS___TrialNamespaceLinkTest, "sharedObj");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  int v4 = objc_msgSend(v3, "periodicSiriTCP_numerator");
  *((_DWORD *)v18 + 6) = v4;
  v5 = +[TrialNamespaceLinkTest sharedObj](&OBJC_CLASS___TrialNamespaceLinkTest, "sharedObj");
  int v6 = objc_msgSend(v5, "periodicSiriTCP_denominator");
  *((_DWORD *)v14 + 6) = v6;

  if (MGGetBoolAnswer())
  {
    uint64_t v7 = MEMORY[0x1895F87A8];
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __40__WFMeasure_shouldPeriodicSampleSiriTCP__block_invoke;
    v12[3] = &unk_18A16CE50;
    v12[4] = &v17;
    -[WFMeasure getLazyNSNumberPreference:exists:]( self,  "getLazyNSNumberPreference:exists:",  @"periodic_sampling_siri_numerator",  v12);
    v11[0] = v7;
    v11[1] = 3221225472LL;
    v11[2] = __40__WFMeasure_shouldPeriodicSampleSiriTCP__block_invoke_2;
    v11[3] = &unk_18A16CE50;
    v11[4] = &v13;
    -[WFMeasure getLazyNSNumberPreference:exists:]( self,  "getLazyNSNumberPreference:exists:",  @"periodic_sampling_siri_denominator",  v11);
  }

  uint32_t v8 = arc4random_uniform(*((_DWORD *)v14 + 6));
  uint32_t v9 = *((_DWORD *)v18 + 6);
  if (v8 >= v9) {
    NSLog( @"%s: Periodic Test Not Selected for Siri TCP sampling via odds of numerator %u denominator %u",  "-[WFMeasure shouldPeriodicSampleSiriTCP]",  *((unsigned int *)v18 + 6),  *((unsigned int *)v14 + 6));
  }
  else {
    NSLog( @"%s: PERIODIC TEST SELECTED for Siri TCP sampling via odds of numerator %u denominator %u",  "-[WFMeasure shouldPeriodicSampleSiriTCP]",  *((unsigned int *)v18 + 6),  *((unsigned int *)v14 + 6));
  }
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
  return v8 < v9;
}

void __40__WFMeasure_shouldPeriodicSampleSiriTCP__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  id v4 = a2;
  NSLog( @"%s: OVERRIDING kWFMeasurePreferencePeriodicSiriSamplingRateNumerator samplingNumerator from %u to %u",  "-[WFMeasure shouldPeriodicSampleSiriTCP]_block_invoke",  v3,  [v4 unsignedIntValue]);
  LODWORD(v3) = [v4 unsignedIntValue];

  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v3;
}

void __40__WFMeasure_shouldPeriodicSampleSiriTCP__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  id v4 = a2;
  NSLog( @"%s: OVERRIDING kWFMeasurePreferencePeriodicSiriSamplingRateDenominator samplingDenominator from %u to %u",  "-[WFMeasure shouldPeriodicSampleSiriTCP]_block_invoke_2",  v3,  [v4 unsignedIntValue]);
  LODWORD(v3) = [v4 unsignedIntValue];

  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v3;
}

- (BOOL)shouldPeriodicSampleSiriTLS
{
  uint64_t v17 = 0LL;
  v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  int v20 = 0;
  uint64_t v13 = 0LL;
  dispatch_group_t v14 = &v13;
  uint64_t v15 = 0x2020000000LL;
  int v16 = 0;
  +[TrialNamespaceLinkTest sharedObj](&OBJC_CLASS___TrialNamespaceLinkTest, "sharedObj");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  int v4 = objc_msgSend(v3, "periodicSiriTLS_numerator");
  *((_DWORD *)v18 + 6) = v4;
  v5 = +[TrialNamespaceLinkTest sharedObj](&OBJC_CLASS___TrialNamespaceLinkTest, "sharedObj");
  int v6 = objc_msgSend(v5, "periodicSiriTLS_denominator");
  *((_DWORD *)v14 + 6) = v6;

  if (MGGetBoolAnswer())
  {
    uint64_t v7 = MEMORY[0x1895F87A8];
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __40__WFMeasure_shouldPeriodicSampleSiriTLS__block_invoke;
    v12[3] = &unk_18A16CE50;
    v12[4] = &v17;
    -[WFMeasure getLazyNSNumberPreference:exists:]( self,  "getLazyNSNumberPreference:exists:",  @"periodic_sampling_siri_numerator",  v12);
    v11[0] = v7;
    v11[1] = 3221225472LL;
    v11[2] = __40__WFMeasure_shouldPeriodicSampleSiriTLS__block_invoke_2;
    v11[3] = &unk_18A16CE50;
    v11[4] = &v13;
    -[WFMeasure getLazyNSNumberPreference:exists:]( self,  "getLazyNSNumberPreference:exists:",  @"periodic_sampling_siri_denominator",  v11);
  }

  uint32_t v8 = arc4random_uniform(*((_DWORD *)v14 + 6));
  uint32_t v9 = *((_DWORD *)v18 + 6);
  if (v8 >= v9) {
    NSLog( @"%s: Periodic Test Not Selected for Siri TLS sampling via odds of numerator %u denominator %u",  "-[WFMeasure shouldPeriodicSampleSiriTLS]",  *((unsigned int *)v18 + 6),  *((unsigned int *)v14 + 6));
  }
  else {
    NSLog( @"%s: PERIODIC TEST SELECTED for Siri TLS sampling via odds of numerator %u denominator %u",  "-[WFMeasure shouldPeriodicSampleSiriTLS]",  *((unsigned int *)v18 + 6),  *((unsigned int *)v14 + 6));
  }
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
  return v8 < v9;
}

void __40__WFMeasure_shouldPeriodicSampleSiriTLS__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  id v4 = a2;
  NSLog( @"%s: OVERRIDING kWFMeasurePreferencePeriodicSiriSamplingRateNumerator samplingNumerator from %u to %u",  "-[WFMeasure shouldPeriodicSampleSiriTLS]_block_invoke",  v3,  [v4 unsignedIntValue]);
  LODWORD(v3) = [v4 unsignedIntValue];

  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v3;
}

void __40__WFMeasure_shouldPeriodicSampleSiriTLS__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  id v4 = a2;
  NSLog( @"%s: OVERRIDING kWFMeasurePreferencePeriodicSiriSamplingRateDenominator samplingDenominator from %u to %u",  "-[WFMeasure shouldPeriodicSampleSiriTLS]_block_invoke_2",  v3,  [v4 unsignedIntValue]);
  LODWORD(v3) = [v4 unsignedIntValue];

  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v3;
}

- (unsigned)getPeriodicSampleTrafficClass
{
  uint64_t v11 = 0LL;
  v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  int v14 = 0;
  +[TrialNamespaceLinkTest sharedObj](&OBJC_CLASS___TrialNamespaceLinkTest, "sharedObj");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint32_t v4 = objc_msgSend(v3, "periodicSiriTrafficClassBEVI_numerator");
  v5 = +[TrialNamespaceLinkTest sharedObj](&OBJC_CLASS___TrialNamespaceLinkTest, "sharedObj");
  uint32_t v6 = objc_msgSend(v5, "periodicSiriTrafficClassBEVI_denominator");

  if (arc4random_uniform(v6) >= v4)
  {
    NSLog(@"%s: Perodic Traffic Class for Siri to use BE", "-[WFMeasure getPeriodicSampleTrafficClass]");
    int v7 = 0;
  }

  else
  {
    NSLog(@"%s: Perodic Traffic Class for Siri to use VI", "-[WFMeasure getPeriodicSampleTrafficClass]");
    int v7 = 700;
  }

  *((_DWORD *)v12 + 6) = v7;
  if (MGGetBoolAnswer())
  {
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __42__WFMeasure_getPeriodicSampleTrafficClass__block_invoke;
    v10[3] = &unk_18A16CE50;
    v10[4] = &v11;
    -[WFMeasure getLazyNSNumberPreference:exists:]( self,  "getLazyNSNumberPreference:exists:",  @"periodic_siri_tclass",  v10);
  }

  unsigned int v8 = *((_DWORD *)v12 + 6);
  _Block_object_dispose(&v11, 8);
  return v8;
}

void __42__WFMeasure_getPeriodicSampleTrafficClass__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  NSLog( @"%s: OVERRIDING kWFMeasurePreferencePeriodicSiriTrafficClass to %u",  "-[WFMeasure getPeriodicSampleTrafficClass]_block_invoke",  [v3 unsignedIntValue]);
  int v4 = [v3 unsignedIntValue];

  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v4;
}

- (BOOL)shouldTimeoutSampleSiriTCP
{
  uint64_t v17 = 0LL;
  v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  int v20 = 0;
  uint64_t v13 = 0LL;
  int v14 = &v13;
  uint64_t v15 = 0x2020000000LL;
  int v16 = 0;
  +[TrialNamespaceLinkTest sharedObj](&OBJC_CLASS___TrialNamespaceLinkTest, "sharedObj");
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  int v4 = objc_msgSend(v3, "timeoutSiriTCP_numerator");
  *((_DWORD *)v18 + 6) = v4;
  v5 = +[TrialNamespaceLinkTest sharedObj](&OBJC_CLASS___TrialNamespaceLinkTest, "sharedObj");
  int v6 = objc_msgSend(v5, "timeoutSiriTCP_denominator");
  *((_DWORD *)v14 + 6) = v6;

  if (MGGetBoolAnswer())
  {
    uint64_t v7 = MEMORY[0x1895F87A8];
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __39__WFMeasure_shouldTimeoutSampleSiriTCP__block_invoke;
    v12[3] = &unk_18A16CE50;
    v12[4] = &v17;
    -[WFMeasure getLazyNSNumberPreference:exists:]( self,  "getLazyNSNumberPreference:exists:",  @"siri_timeout_sampling_numerator",  v12);
    v11[0] = v7;
    v11[1] = 3221225472LL;
    v11[2] = __39__WFMeasure_shouldTimeoutSampleSiriTCP__block_invoke_2;
    v11[3] = &unk_18A16CE50;
    v11[4] = &v13;
    -[WFMeasure getLazyNSNumberPreference:exists:]( self,  "getLazyNSNumberPreference:exists:",  @"siri_timeout_sampling_denominator",  v11);
  }

  uint32_t v8 = arc4random_uniform(*((_DWORD *)v14 + 6));
  uint32_t v9 = *((_DWORD *)v18 + 6);
  if (v8 >= v9) {
    NSLog( @"%s: Timeout Test Not Selected for Siri TCP sampling via odds of numerator %u denominator %u",  "-[WFMeasure shouldTimeoutSampleSiriTCP]",  *((unsigned int *)v18 + 6),  *((unsigned int *)v14 + 6));
  }
  else {
    NSLog( @"%s: Timeout Test Selected for Siri TCP sampling via odds of numerator %u denominator %u",  "-[WFMeasure shouldTimeoutSampleSiriTCP]",  *((unsigned int *)v18 + 6),  *((unsigned int *)v14 + 6));
  }
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
  return v8 < v9;
}

void __39__WFMeasure_shouldTimeoutSampleSiriTCP__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  id v4 = a2;
  NSLog( @"%s: OVERRIDING kWFMeasurePreferenceSiriTimeoutSamplingRateNumerator samplingNumerator from %u to %u",  "-[WFMeasure shouldTimeoutSampleSiriTCP]_block_invoke",  v3,  [v4 unsignedIntValue]);
  LODWORD(v3) = [v4 unsignedIntValue];

  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v3;
}

void __39__WFMeasure_shouldTimeoutSampleSiriTCP__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  id v4 = a2;
  NSLog( @"%s: OVERRIDING kWFMeasurePreferenceSiriTimeoutSamplingRateDenominator samplingDenominator from %u to %u",  "-[WFMeasure shouldTimeoutSampleSiriTCP]_block_invoke_2",  v3,  [v4 unsignedIntValue]);
  LODWORD(v3) = [v4 unsignedIntValue];

  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v3;
}

- (BOOL)shouldTimeoutSampleSiriTLS
{
  uint64_t v17 = 0LL;
  v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  int v20 = 0;
  uint64_t v13 = 0LL;
  int v14 = &v13;
  uint64_t v15 = 0x2020000000LL;
  int v16 = 0;
  +[TrialNamespaceLinkTest sharedObj](&OBJC_CLASS___TrialNamespaceLinkTest, "sharedObj");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  int v4 = objc_msgSend(v3, "timeoutSiriTLS_numerator");
  *((_DWORD *)v18 + 6) = v4;
  v5 = +[TrialNamespaceLinkTest sharedObj](&OBJC_CLASS___TrialNamespaceLinkTest, "sharedObj");
  int v6 = objc_msgSend(v5, "timeoutSiriTLS_denominator");
  *((_DWORD *)v14 + 6) = v6;

  if (MGGetBoolAnswer())
  {
    uint64_t v7 = MEMORY[0x1895F87A8];
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __39__WFMeasure_shouldTimeoutSampleSiriTLS__block_invoke;
    v12[3] = &unk_18A16CE50;
    v12[4] = &v17;
    -[WFMeasure getLazyNSNumberPreference:exists:]( self,  "getLazyNSNumberPreference:exists:",  @"siri_timeout_sampling_numerator",  v12);
    v11[0] = v7;
    v11[1] = 3221225472LL;
    v11[2] = __39__WFMeasure_shouldTimeoutSampleSiriTLS__block_invoke_2;
    v11[3] = &unk_18A16CE50;
    v11[4] = &v13;
    -[WFMeasure getLazyNSNumberPreference:exists:]( self,  "getLazyNSNumberPreference:exists:",  @"siri_timeout_sampling_denominator",  v11);
  }

  uint32_t v8 = arc4random_uniform(*((_DWORD *)v14 + 6));
  uint32_t v9 = *((_DWORD *)v18 + 6);
  if (v8 >= v9) {
    NSLog( @"%s: Timeout Test Not Selected for Siri TLS sampling via odds of numerator %u denominator %u",  "-[WFMeasure shouldTimeoutSampleSiriTLS]",  *((unsigned int *)v18 + 6),  *((unsigned int *)v14 + 6));
  }
  else {
    NSLog( @"%s: Timeout Test Selected for Siri TLS sampling via odds of numerator %u denominator %u",  "-[WFMeasure shouldTimeoutSampleSiriTLS]",  *((unsigned int *)v18 + 6),  *((unsigned int *)v14 + 6));
  }
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
  return v8 < v9;
}

void __39__WFMeasure_shouldTimeoutSampleSiriTLS__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  id v4 = a2;
  NSLog( @"%s: OVERRIDING kWFMeasurePreferenceSiriTimeoutSamplingRateNumerator samplingNumerator from %u to %u",  "-[WFMeasure shouldTimeoutSampleSiriTLS]_block_invoke",  v3,  [v4 unsignedIntValue]);
  LODWORD(v3) = [v4 unsignedIntValue];

  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v3;
}

void __39__WFMeasure_shouldTimeoutSampleSiriTLS__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  id v4 = a2;
  NSLog( @"%s: OVERRIDING kWFMeasurePreferenceSiriTimeoutSamplingRateDenominator samplingDenominator from %u to %u",  "-[WFMeasure shouldTimeoutSampleSiriTLS]_block_invoke_2",  v3,  [v4 unsignedIntValue]);
  LODWORD(v3) = [v4 unsignedIntValue];

  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v3;
}

- (unsigned)getTimeoutSampleTrafficClass
{
  uint64_t v11 = 0LL;
  v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  int v14 = 0;
  +[TrialNamespaceLinkTest sharedObj](&OBJC_CLASS___TrialNamespaceLinkTest, "sharedObj");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint32_t v4 = objc_msgSend(v3, "timeoutSiriTrafficClassBEVI_numerator");
  v5 = +[TrialNamespaceLinkTest sharedObj](&OBJC_CLASS___TrialNamespaceLinkTest, "sharedObj");
  uint32_t v6 = objc_msgSend(v5, "timeoutSiriTrafficClassBEVI_numerator");

  if (arc4random_uniform(v6) >= v4)
  {
    NSLog(@"%s: Timeout Traffic Class Class for Siri to use BE", "-[WFMeasure getTimeoutSampleTrafficClass]");
    int v7 = 0;
  }

  else
  {
    NSLog(@"%s: Timeout Traffic Class for Siri to use VI", "-[WFMeasure getTimeoutSampleTrafficClass]");
    int v7 = 700;
  }

  *((_DWORD *)v12 + 6) = v7;
  if (MGGetBoolAnswer())
  {
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __41__WFMeasure_getTimeoutSampleTrafficClass__block_invoke;
    v10[3] = &unk_18A16CE50;
    v10[4] = &v11;
    -[WFMeasure getLazyNSNumberPreference:exists:]( self,  "getLazyNSNumberPreference:exists:",  @"siri_timeout_tclass",  v10);
  }

  unsigned int v8 = *((_DWORD *)v12 + 6);
  _Block_object_dispose(&v11, 8);
  return v8;
}

void __41__WFMeasure_getTimeoutSampleTrafficClass__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  NSLog( @"%s: OVERRIDING kWFMeasurePreferenceSiriTimeoutTrafficClass to %u",  "-[WFMeasure getTimeoutSampleTrafficClass]_block_invoke",  [v3 unsignedIntValue]);
  int v4 = [v3 unsignedIntValue];

  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v4;
}

- (BOOL)shouldApsdSampleSiriTCP
{
  uint64_t v17 = 0LL;
  v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  int v20 = 0;
  uint64_t v13 = 0LL;
  int v14 = &v13;
  uint64_t v15 = 0x2020000000LL;
  int v16 = 0;
  +[TrialNamespaceLinkTest sharedObj](&OBJC_CLASS___TrialNamespaceLinkTest, "sharedObj");
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  int v4 = objc_msgSend(v3, "apsdSiriTCP_numerator");
  *((_DWORD *)v18 + 6) = v4;
  v5 = +[TrialNamespaceLinkTest sharedObj](&OBJC_CLASS___TrialNamespaceLinkTest, "sharedObj");
  int v6 = objc_msgSend(v5, "apsdSiriTCP_denominator");
  *((_DWORD *)v14 + 6) = v6;

  if (MGGetBoolAnswer())
  {
    uint64_t v7 = MEMORY[0x1895F87A8];
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __36__WFMeasure_shouldApsdSampleSiriTCP__block_invoke;
    v12[3] = &unk_18A16CE50;
    v12[4] = &v17;
    -[WFMeasure getLazyNSNumberPreference:exists:]( self,  "getLazyNSNumberPreference:exists:",  @"apsd_sampling_numerator",  v12);
    v11[0] = v7;
    v11[1] = 3221225472LL;
    v11[2] = __36__WFMeasure_shouldApsdSampleSiriTCP__block_invoke_2;
    v11[3] = &unk_18A16CE50;
    v11[4] = &v13;
    -[WFMeasure getLazyNSNumberPreference:exists:]( self,  "getLazyNSNumberPreference:exists:",  @"apsd_sampling_denominator",  v11);
  }

  uint32_t v8 = arc4random_uniform(*((_DWORD *)v14 + 6));
  uint32_t v9 = *((_DWORD *)v18 + 6);
  if (v8 >= v9) {
    NSLog( @"%s: Apsd Test Not Selected for Siri TCP sampling via odds of numerator %u denominator %u",  "-[WFMeasure shouldApsdSampleSiriTCP]",  *((unsigned int *)v18 + 6),  *((unsigned int *)v14 + 6));
  }
  else {
    NSLog( @"%s: Apsd Test Selected for Siri TCP sampling via odds of numerator %u denominator %u",  "-[WFMeasure shouldApsdSampleSiriTCP]",  *((unsigned int *)v18 + 6),  *((unsigned int *)v14 + 6));
  }
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
  return v8 < v9;
}

void __36__WFMeasure_shouldApsdSampleSiriTCP__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  id v4 = a2;
  NSLog( @"%s: OVERRIDING kWFMeasurePreferenceApsdSamplingRateNumerator samplingNumerator from %u to %u",  "-[WFMeasure shouldApsdSampleSiriTCP]_block_invoke",  v3,  [v4 unsignedIntValue]);
  LODWORD(v3) = [v4 unsignedIntValue];

  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v3;
}

void __36__WFMeasure_shouldApsdSampleSiriTCP__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  id v4 = a2;
  NSLog( @"%s: OVERRIDING kWFMeasurePreferenceApsdSamplingRateDenominator samplingDenominator from %u to %u",  "-[WFMeasure shouldApsdSampleSiriTCP]_block_invoke_2",  v3,  [v4 unsignedIntValue]);
  LODWORD(v3) = [v4 unsignedIntValue];

  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v3;
}

- (BOOL)shouldApsdSampleSiriTLS
{
  uint64_t v17 = 0LL;
  v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  int v20 = 0;
  uint64_t v13 = 0LL;
  int v14 = &v13;
  uint64_t v15 = 0x2020000000LL;
  int v16 = 0;
  +[TrialNamespaceLinkTest sharedObj](&OBJC_CLASS___TrialNamespaceLinkTest, "sharedObj");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  int v4 = objc_msgSend(v3, "apsdSiriTLS_numerator");
  *((_DWORD *)v18 + 6) = v4;
  v5 = +[TrialNamespaceLinkTest sharedObj](&OBJC_CLASS___TrialNamespaceLinkTest, "sharedObj");
  int v6 = objc_msgSend(v5, "apsdSiriTLS_denominator");
  *((_DWORD *)v14 + 6) = v6;

  if (MGGetBoolAnswer())
  {
    uint64_t v7 = MEMORY[0x1895F87A8];
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __36__WFMeasure_shouldApsdSampleSiriTLS__block_invoke;
    v12[3] = &unk_18A16CE50;
    v12[4] = &v17;
    -[WFMeasure getLazyNSNumberPreference:exists:]( self,  "getLazyNSNumberPreference:exists:",  @"apsd_sampling_numerator",  v12);
    v11[0] = v7;
    v11[1] = 3221225472LL;
    v11[2] = __36__WFMeasure_shouldApsdSampleSiriTLS__block_invoke_2;
    v11[3] = &unk_18A16CE50;
    v11[4] = &v13;
    -[WFMeasure getLazyNSNumberPreference:exists:]( self,  "getLazyNSNumberPreference:exists:",  @"apsd_sampling_denominator",  v11);
  }

  uint32_t v8 = arc4random_uniform(*((_DWORD *)v14 + 6));
  uint32_t v9 = *((_DWORD *)v18 + 6);
  if (v8 >= v9) {
    NSLog( @"%s: Apsd Test Not Selected for Siri TLS sampling via odds of numerator %u denominator %u",  "-[WFMeasure shouldApsdSampleSiriTLS]",  *((unsigned int *)v18 + 6),  *((unsigned int *)v14 + 6));
  }
  else {
    NSLog( @"%s: Apsd Test Selected for Siri TLS sampling via odds of numerator %u denominator %u",  "-[WFMeasure shouldApsdSampleSiriTLS]",  *((unsigned int *)v18 + 6),  *((unsigned int *)v14 + 6));
  }
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
  return v8 < v9;
}

void __36__WFMeasure_shouldApsdSampleSiriTLS__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  id v4 = a2;
  NSLog( @"%s: OVERRIDING kWFMeasurePreferenceApsdSamplingRateNumerator samplingNumerator from %u to %u",  "-[WFMeasure shouldApsdSampleSiriTLS]_block_invoke",  v3,  [v4 unsignedIntValue]);
  LODWORD(v3) = [v4 unsignedIntValue];

  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v3;
}

void __36__WFMeasure_shouldApsdSampleSiriTLS__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  id v4 = a2;
  NSLog( @"%s: OVERRIDING kWFMeasurePreferenceApsdSamplingRateDenominator samplingDenominator from %u to %u",  "-[WFMeasure shouldApsdSampleSiriTLS]_block_invoke_2",  v3,  [v4 unsignedIntValue]);
  LODWORD(v3) = [v4 unsignedIntValue];

  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v3;
}

- (unsigned)getApsdSampleTrafficClass
{
  uint64_t v11 = 0LL;
  v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  int v14 = 0;
  +[TrialNamespaceLinkTest sharedObj](&OBJC_CLASS___TrialNamespaceLinkTest, "sharedObj");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint32_t v4 = objc_msgSend(v3, "apsdSiriTrafficClassBEVI_numerator");
  v5 = +[TrialNamespaceLinkTest sharedObj](&OBJC_CLASS___TrialNamespaceLinkTest, "sharedObj");
  uint32_t v6 = objc_msgSend(v5, "apsdSiriTrafficClassBEVI_numerator");

  if (arc4random_uniform(v6) >= v4)
  {
    NSLog(@"%s: Apsd Traffic Class Class for Siri to use BE", "-[WFMeasure getApsdSampleTrafficClass]");
    int v7 = 0;
  }

  else
  {
    NSLog(@"%s: Apsd Traffic Class for Siri to use VI", "-[WFMeasure getApsdSampleTrafficClass]");
    int v7 = 700;
  }

  *((_DWORD *)v12 + 6) = v7;
  if (MGGetBoolAnswer())
  {
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __38__WFMeasure_getApsdSampleTrafficClass__block_invoke;
    v10[3] = &unk_18A16CE50;
    v10[4] = &v11;
    -[WFMeasure getLazyNSNumberPreference:exists:](self, "getLazyNSNumberPreference:exists:", @"apsd_tclass", v10);
  }

  unsigned int v8 = *((_DWORD *)v12 + 6);
  _Block_object_dispose(&v11, 8);
  return v8;
}

void __38__WFMeasure_getApsdSampleTrafficClass__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  NSLog( @"%s: OVERRIDING kWFMeasurePreferenceApsdTrafficClass to %u",  "-[WFMeasure getApsdSampleTrafficClass]_block_invoke",  [v3 unsignedIntValue]);
  int v4 = [v3 unsignedIntValue];

  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v4;
}

- (void)retrieveNetworkConfigurations
{
  id v3 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  int v4 = SCDynamicStoreCreate((CFAllocatorRef)*MEMORY[0x189604DB0], @"com.apple.wifi.wfmeasure", 0LL, 0LL);
  v5 = SCPreferencesCreateWithAuthorization(v3, @"com.apple.wifi.wfmeasure", 0LL, 0LL);
  uint32_t v6 = v5;
  if (v4) {
    BOOL v7 = v5 == 0LL;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    -[WFMeasure gatewayAddress](self, "gatewayAddress");
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFMeasure dnsServers](self, "dnsServers");
    uint32_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog( @"%s: CRITICAL No SCDynamicStoreCreate found self.gatewayAddress is probably stale or incorrect %@ self.dnsServers is probably stale or incorrect %@",  "-[WFMeasure retrieveNetworkConfigurations]",  v8,  v9);

    if (v4) {
      goto LABEL_24;
    }
LABEL_7:
    if (!v6) {
      return;
    }
LABEL_8:
    CFRelease(v6);
    return;
  }

  id v10 = SCNetworkSetCopyCurrent(v5);
  if (!v10)
  {
    v24 = -[WFMeasure gatewayAddress](self, "gatewayAddress");
    v25 = -[WFMeasure dnsServers](self, "dnsServers");
    NSLog( @"%s: CRITICAL No SCNetworkSetCopyCurrent found self.gatewayAddress is probably stale or incorrect %@ self.dnsServe rs is probably stale or incorrect %@",  "-[WFMeasure retrieveNetworkConfigurations]",  v24,  v25);

    goto LABEL_24;
  }

  uint64_t v11 = v10;
  v12 = SCNetworkSetCopyServices(v10);
  if (v12)
  {
    uint64_t v13 = v12;
    if (CFArrayGetCount(v12) < 1)
    {
LABEL_18:
      v22 = -[WFMeasure gatewayAddress](self, "gatewayAddress");
      v23 = -[WFMeasure dnsServers](self, "dnsServers");
      NSLog( @"%s: CRITICAL No matchingService found self.gatewayAddress is probably stale or incorrect %@ self.dnsServers is probably stale or incorrect %@",  "-[WFMeasure retrieveNetworkConfigurations]",  v22,  v23);
    }

    else
    {
      CFIndex v14 = 0LL;
      while (1)
      {
        ValueAtIndex = (const __SCNetworkService *)CFArrayGetValueAtIndex(v13, v14);
        if (ValueAtIndex)
        {
          int v16 = ValueAtIndex;
          Interface = SCNetworkServiceGetInterface(ValueAtIndex);
          if (Interface)
          {
            CFStringRef BSDName = SCNetworkInterfaceGetBSDName(Interface);
            if (BSDName)
            {
              uint64_t v19 = BSDName;
              -[WFMeasure interfaceName](self, "interfaceName");
              int v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
              CFComparisonResult v21 = CFStringCompare(v19, v20, 0LL);

              if (v21 == kCFCompareEqualTo) {
                break;
              }
            }
          }
        }

        if (++v14 >= CFArrayGetCount(v13)) {
          goto LABEL_18;
        }
      }

      ServiceID = SCNetworkServiceGetServiceID(v16);
      if (ServiceID)
      {
        v29 = ServiceID;
        uint64_t v30 = (const __CFString *)*MEMORY[0x18960C548];
        NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity( v3,  (CFStringRef)*MEMORY[0x18960C548],  ServiceID,  (CFStringRef)*MEMORY[0x18960C580]);
        uint64_t v32 = SCDynamicStoreKeyCreateNetworkServiceEntity(v3, v30, v29, (CFStringRef)*MEMORY[0x18960C588]);
        if (!NetworkServiceEntity)
        {
          v39 = -[WFMeasure dnsServers](self, "dnsServers");
          NSLog( @"%s: WARNING No DNS Servers found dnsKey = nil self.dnsServers is probably stale or incorrect %@",  "-[WFMeasure retrieveNetworkConfigurations]",  v39);

          goto LABEL_44;
        }

        char v33 = (const __CFDictionary *)SCDynamicStoreCopyValue(v4, NetworkServiceEntity);
        if (!v33)
        {
          v40 = -[WFMeasure dnsServers](self, "dnsServers");
          NSLog( @"%s: CRITICAL No DNS Servers found dnsValue = nil kSCEntNetDNS dnsKey %@ self.dnsServers is probably stale or incorrect %@",  "-[WFMeasure retrieveNetworkConfigurations]",  NetworkServiceEntity,  v40);

LABEL_43:
          CFRelease(NetworkServiceEntity);
LABEL_44:
          if (v32)
          {
            v43 = (const __CFDictionary *)SCDynamicStoreCopyValue(v4, v32);
            if (v43)
            {
              v44 = v43;
              -[WFMeasure setGatewayAddress:]( self,  "setGatewayAddress:",  CFDictionaryGetValue(v43, (const void *)*MEMORY[0x18960C718]));
              CFRelease(v44);
            }

            else
            {
              NSLog( @"%s: WARNING No gatewayAddress found ipv4Value = nil",  "-[WFMeasure retrieveNetworkConfigurations]");
            }

            CFRelease(v32);
          }

          else
          {
            NSLog( @"%s: WARNING No gatewayAddress found ipv4Key = nil",  "-[WFMeasure retrieveNetworkConfigurations]");
          }

          goto LABEL_20;
        }

        uint64_t v34 = v33;
        Value = CFDictionaryGetValue(v33, (const void *)*MEMORY[0x18960C620]);
        -[WFMeasure dnsServers](self, "dnsServers");
        uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
        char v37 = v36;
        if (Value)
        {

          if (v37)
          {
            -[WFMeasure dnsServers](self, "dnsServers");
            objc_super v38 = (void *)objc_claimAutoreleasedReturnValue();
            [v38 removeAllObjects];
          }

          else
          {
            [MEMORY[0x189603FE0] set];
            objc_super v38 = (void *)objc_claimAutoreleasedReturnValue();
            -[WFMeasure setDnsServers:](self, "setDnsServers:", v38);
          }

          CFTypeID v41 = CFGetTypeID(Value);
          if (v41 == CFArrayGetTypeID())
          {
            -[WFMeasure dnsServers](self, "dnsServers");
            char v37 = (void *)objc_claimAutoreleasedReturnValue();
            [v37 addObjectsFromArray:Value];
          }

          else
          {
            CFTypeID v42 = CFGetTypeID(Value);
            if (v42 != CFStringGetTypeID())
            {
LABEL_42:
              CFRelease(v34);
              goto LABEL_43;
            }

            -[WFMeasure dnsServers](self, "dnsServers");
            char v37 = (void *)objc_claimAutoreleasedReturnValue();
            [v37 addObject:Value];
          }
        }

        else
        {
          NSLog( @"%s: CRITICAL No DNS Servers found dnsServers = nil kSCEntNetDNS dnsValue is %@ self.dnsServers is probably stale or incorrect %@",  "-[WFMeasure retrieveNetworkConfigurations]",  v34,  v36);
        }

        goto LABEL_42;
      }
      v22 = -[WFMeasure gatewayAddress](self, "gatewayAddress");
      v23 = -[WFMeasure dnsServers](self, "dnsServers");
      NSLog( @"%s: CRITICAL No matchingServiceID found self.gatewayAddress is probably stale or incorrect %@ self.dnsServers i s probably stale or incorrect %@",  "-[WFMeasure retrieveNetworkConfigurations]",  v22,  v23);
    }

LABEL_20:
    CFRelease(v13);
    goto LABEL_23;
  }
  v26 = -[WFMeasure gatewayAddress](self, "gatewayAddress");
  v27 = -[WFMeasure dnsServers](self, "dnsServers");
  NSLog( @"%s: CRITICAL No SCNetworkSetCopyServices found self.gatewayAddress is probably stale or incorrect %@ self.dnsServer s is probably stale or incorrect %@",  "-[WFMeasure retrieveNetworkConfigurations]",  v26,  v27);

LABEL_23:
  CFRelease(v11);
  if (!v4) {
    goto LABEL_7;
  }
LABEL_24:
  CFRelease(v4);
  if (v6) {
    goto LABEL_8;
  }
}

- (void)doThroughputTest
{
  id v3 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue();
  dispatch_group_leave(v3);
}

- (void)dispatchThroughputTest
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __35__WFMeasure_dispatchThroughputTest__block_invoke;
  block[3] = &unk_18A16C770;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __35__WFMeasure_dispatchThroughputTest__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) doThroughputTest];
}

- (BOOL)doPing:(id)a3 count:(int64_t)a4 timeout:(int64_t)a5 size:(int64_t)a6 class:(int64_t)a7 minRTT:(int64_t *)a8 maxRTT:(int64_t *)a9 successCount:(int64_t *)a10
{
  v40[3] = *MEMORY[0x1895F89C0];
  id v38 = a3;
  if (!v38)
  {
    NSLog(@"%s: null address", "-[WFMeasure doPing:count:timeout:size:class:minRTT:maxRTT:successCount:]");
LABEL_29:
    BOOL v28 = 0;
    goto LABEL_23;
  }

  if ((unint64_t)(a4 - 0x7FFFFFFF) < 0xFFFFFFFF80000002LL)
  {
    NSLog( @"%s: invalid count(%d)",  "-[WFMeasure doPing:count:timeout:size:class:minRTT:maxRTT:successCount:]",  a4);
    goto LABEL_29;
  }

  if ((unint64_t)(a5 - 0x7FFFFFFF) < 0xFFFFFFFF80000002LL)
  {
    NSLog( @"%s: invalid timeout(%d)",  "-[WFMeasure doPing:count:timeout:size:class:minRTT:maxRTT:successCount:]",  a5);
    goto LABEL_29;
  }

  if ((unint64_t)(a6 - 0x7FFFFFFF) < 0xFFFFFFFF80000002LL)
  {
    NSLog( @"%s: invalid size(%d)",  "-[WFMeasure doPing:count:timeout:size:class:minRTT:maxRTT:successCount:]",  a6);
    goto LABEL_29;
  }

  if ((unint64_t)a7 > 0x7FFFFFFE)
  {
    NSLog( @"%s: invalid traffic class(%d)",  "-[WFMeasure doPing:count:timeout:size:class:minRTT:maxRTT:successCount:]",  a7);
    goto LABEL_29;
  }

  v31 = a8;
  int64_t v13 = 0LL;
  uint64_t v34 = *MEMORY[0x189602100];
  uint64_t v35 = *MEMORY[0x189602108];
  uint64_t v32 = *MEMORY[0x189602110];
  uint64_t v33 = *MEMORY[0x1896020F8];
  int64_t v14 = 0xFFFFFFFF80000000LL;
  uint64_t v15 = 0x7FFFFFFFLL;
  int64_t v30 = a4;
  do
  {
    v39[0] = v35;
    [MEMORY[0x189607968] numberWithInteger:a5];
    int v16 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = v16;
    v40[1] = &unk_18A1B3BA0;
    v39[1] = v34;
    v39[2] = v33;
    [MEMORY[0x189607968] numberWithInteger:a6];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    v40[2] = v17;
    [MEMORY[0x189603F68] dictionaryWithObjects:v40 forKeys:v39 count:3];
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v19 = (void *)[v18 mutableCopy];
    if (a7)
    {
      [MEMORY[0x189607968] numberWithInteger:a7];
      int v20 = (void *)objc_claimAutoreleasedReturnValue();
      [v19 setObject:v20 forKeyedSubscript:v32];
    }

    [MEMORY[0x189603F50] timeIntervalSinceReferenceDate];
    double v22 = v21;
    int v23 = CFNetDiagnosticPingWithOptions();
    [MEMORY[0x189603F50] timeIntervalSinceReferenceDate];
    BOOL v24 = v23 == 0;
    double v26 = (v25 - v22) * 1000.0;
    uint64_t v27 = (uint64_t)v26;
    if (!v24) {
      ++v13;
    }
    if (v14 <= v27) {
      int64_t v14 = (uint64_t)v26;
    }
    if (v15 >= v27) {
      uint64_t v15 = (uint64_t)v26;
    }

    --a4;
  }

  while (a4);
  NSLog( @"%s: LQM-WiFi: ping: address %@, count %d, timeout %d, size %d, class %d, duration %d, success-count %d",  "-[WFMeasure doPing:count:timeout:size:class:minRTT:maxRTT:successCount:]",  v38,  v30,  a5,  a6,  a7,  v27,  v13);
  if (a9) {
    *a9 = v14;
  }
  if (v31) {
    int64_t *v31 = v15;
  }
  if (a10) {
    *a10 = v13;
  }
  BOOL v28 = 1;
LABEL_23:

  return v28;
}

- (void)dispatchPingTest:(unint64_t)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189603FA8] arrayWithArray:&unk_18A1B5798];
  uint32_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 == 8)
  {
    v12 = +[WiFiPolicyNetworkActivityTracing sharedNetworkActivityTracing]( &OBJC_CLASS___WiFiPolicyNetworkActivityTracing,  "sharedNetworkActivityTracing");
    [v12 networkActivityStart:6 activate:1];

    -[WFMeasure publicDNSAddress](self, "publicDNSAddress");
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_isParis) {
      uint64_t v11 = 1LL;
    }
    else {
      uint64_t v11 = 3LL;
    }
    uint64_t v8 = 5LL;
  }

  else
  {
    if (a3 == 4)
    {
      +[WiFiPolicyNetworkActivityTracing sharedNetworkActivityTracing]( &OBJC_CLASS___WiFiPolicyNetworkActivityTracing,  "sharedNetworkActivityTracing");
      BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v8 = 5LL;
      [v7 networkActivityStart:5 activate:1];

      -[WFMeasure dnsServers](self, "dnsServers");
      uint32_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 anyObject];
      id v10 = (void *)objc_claimAutoreleasedReturnValue();

      uint64_t v11 = 3LL;
    }

    else
    {
      +[WiFiPolicyNetworkActivityTracing sharedNetworkActivityTracing]( &OBJC_CLASS___WiFiPolicyNetworkActivityTracing,  "sharedNetworkActivityTracing");
      int64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 networkActivityStart:4 activate:1];

      -[WFMeasure gatewayAddress](self, "gatewayAddress");
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (self->_isParis) {
        uint64_t v11 = 1LL;
      }
      else {
        uint64_t v11 = 3LL;
      }
      if (self->_isParis) {
        uint64_t v8 = 1LL;
      }
      else {
        uint64_t v8 = 5LL;
      }
      [v5 addObjectsFromArray:&unk_18A1B57B0];
    }

    [v6 addObjectsFromArray:&unk_18A1B57C8];
  }

  dispatch_get_global_queue(0LL, 0LL);
  int64_t v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __30__WFMeasure_dispatchPingTest___block_invoke;
  block[3] = &unk_18A16DBF8;
  id v19 = v6;
  id v20 = v5;
  double v21 = self;
  id v22 = v10;
  uint64_t v23 = v11;
  uint64_t v24 = v8;
  unint64_t v25 = a3;
  id v15 = v10;
  id v16 = v5;
  id v17 = v6;
  dispatch_async(v14, block);
}

void __30__WFMeasure_dispatchPingTest___block_invoke(uint64_t a1)
{
  uint64_t v92 = *MEMORY[0x1895F89C0];
  uint64_t v89 = 0LL;
  int64_t v88 = 0LL;
  uint64_t v84 = 0LL;
  v85 = &v84;
  uint64_t v86 = 0x2020000000LL;
  uint64_t v87 = 0LL;
  __int128 v80 = 0u;
  __int128 v81 = 0u;
  __int128 v82 = 0u;
  __int128 v83 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v80 objects:v91 count:16];
  if (v2)
  {
    uint64_t v3 = 0LL;
    uint64_t v4 = 0LL;
    uint64_t v53 = *(void *)v81;
    uint64_t v54 = v2;
    uint64_t v60 = 0x7FFFFFFFLL;
    int64_t v61 = 0xFFFFFFFF80000000LL;
    while (1)
    {
      for (uint64_t i = 0LL; i != v54; ++i)
      {
        if (*(void *)v81 != v53) {
          objc_enumerationMutation(obj);
        }
        v59 = *(void **)(*((void *)&v80 + 1) + 8 * i);
        __int128 v76 = 0u;
        __int128 v77 = 0u;
        __int128 v78 = 0u;
        __int128 v79 = 0u;
        id v56 = *(id *)(a1 + 40);
        uint64_t v5 = [v56 countByEnumeratingWithState:&v76 objects:v90 count:16];
        if (!v5) {
          goto LABEL_83;
        }
        uint64_t v58 = *(void *)v77;
        while (2)
        {
          uint64_t v6 = 0LL;
          uint64_t v57 = v5;
          do
          {
            if (*(void *)v77 != v58) {
              objc_enumerationMutation(v56);
            }
            BOOL v7 = *(void **)(*((void *)&v76 + 1) + 8 * v6);
            uint64_t v8 = *(void **)(a1 + 48);
            uint64_t v9 = *(void *)(a1 + 56);
            uint64_t v10 = *(void *)(a1 + 64);
            uint64_t v11 = *(void *)(a1 + 72);
            uint64_t v12 = [v59 integerValue];
            uint64_t v13 = [v7 integerValue];
            uint64_t v14 = [v8 doPing:v9 count:v10 timeout:v11 size:v12 class:v13 minRTT:&v89 maxRTT:&v88 successCount:v85 + 3];
            if (MGGetBoolAnswer() && *(void *)(a1 + 80) == 4LL)
            {
              id v15 = *(void **)(a1 + 48);
              v75[0] = MEMORY[0x1895F87A8];
              v75[1] = 3221225472LL;
              v75[2] = __30__WFMeasure_dispatchPingTest___block_invoke_2;
              v75[3] = &unk_18A16CE50;
              v75[4] = &v84;
              [v15 getLazyNSNumberPreference:@"local_dns_result" exists:v75];
            }

            if (MGGetBoolAnswer() && *(void *)(a1 + 80) == 8LL)
            {
              id v16 = *(void **)(a1 + 48);
              v74[0] = MEMORY[0x1895F87A8];
              v74[1] = 3221225472LL;
              v74[2] = __30__WFMeasure_dispatchPingTest___block_invoke_3;
              v74[3] = &unk_18A16CE50;
              v74[4] = &v84;
              [v16 getLazyNSNumberPreference:@"public_dns_result" exists:v74];
            }

            if (MGGetBoolAnswer() && *(void *)(a1 + 80) == 2LL)
            {
              id v17 = *(void **)(a1 + 48);
              v73[0] = MEMORY[0x1895F87A8];
              v73[1] = 3221225472LL;
              v73[2] = __30__WFMeasure_dispatchPingTest___block_invoke_4;
              v73[3] = &unk_18A16CE50;
              v73[4] = &v84;
              [v17 getLazyNSNumberPreference:@"gateway_result" exists:v73];
            }

            if (MGGetBoolAnswer())
            {
              unint64_t v18 = *(void *)(a1 + 80);
              if (v18 <= 8 && ((1LL << v18) & 0x114) != 0)
              {
                id v19 = *(void **)(a1 + 48);
                v72[0] = MEMORY[0x1895F87A8];
                v72[1] = 3221225472LL;
                v72[2] = __30__WFMeasure_dispatchPingTest___block_invoke_5;
                v72[3] = &unk_18A16DBA8;
                v72[4] = v7;
                v72[5] = &v84;
                [v19 getLazyNSNumberPreference:@"fail_pings_ac" exists:v72];
              }
            }

            uint64_t v20 = v85[3];
            if (v60 >= v89) {
              uint64_t v21 = v89;
            }
            else {
              uint64_t v21 = v60;
            }
            int64_t v22 = v61;
            if (v61 <= v88) {
              int64_t v22 = v88;
            }
            uint64_t v60 = v21;
            int64_t v61 = v22;
            if ((_DWORD)v14)
            {
              uint64_t v23 = [v7 integerValue];
              if (v23 > 699)
              {
                if (v23 == 700)
                {
                  uint64_t v33 = [v59 integerValue];
                  uint64_t v34 = *(void **)(a1 + 48);
                  if (v33 == 300)
                  {
                    [v34 result];
                    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend( v35,  "setTrafficClassVIAttemptedSmall:",  *(void *)(a1 + 64) + objc_msgSend(v35, "trafficClassVIAttemptedSmall"));
                  }

                  else
                  {
                    [v34 result];
                    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend( v35,  "setTrafficClassVIAttemptedLarge:",  *(void *)(a1 + 64) + objc_msgSend(v35, "trafficClassVIAttemptedLarge"));
                  }

                  if (v85[3] >= 1)
                  {
                    uint64_t v43 = [v59 integerValue];
                    v44 = *(void **)(a1 + 48);
                    if (v43 == 300)
                    {
                      [v44 result];
                      id v38 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend( v38,  "setTrafficClassVISucceededSmall:",  v85[3] + objc_msgSend(v38, "trafficClassVISucceededSmall"));
                    }

                    else
                    {
                      [v44 result];
                      id v38 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend( v38,  "setTrafficClassVISucceededLarge:",  v85[3] + objc_msgSend(v38, "trafficClassVISucceededLarge"));
                    }

                    goto LABEL_63;
                  }
                }

                else if (v23 == 800)
                {
                  uint64_t v27 = [v59 integerValue];
                  BOOL v28 = *(void **)(a1 + 48);
                  if (v27 == 300)
                  {
                    [v28 result];
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend( v29,  "setTrafficClassVOAttemptedSmall:",  *(void *)(a1 + 64) + objc_msgSend(v29, "trafficClassVOAttemptedSmall"));
                  }

                  else
                  {
                    [v28 result];
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend( v29,  "setTrafficClassVOAttemptedLarge:",  *(void *)(a1 + 64) + objc_msgSend(v29, "trafficClassVOAttemptedLarge"));
                  }

                  if (v85[3] >= 1)
                  {
                    uint64_t v39 = [v59 integerValue];
                    v40 = *(void **)(a1 + 48);
                    if (v39 == 300)
                    {
                      [v40 result];
                      id v38 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend( v38,  "setTrafficClassVOSucceededSmall:",  v85[3] + objc_msgSend(v38, "trafficClassVOSucceededSmall"));
                    }

                    else
                    {
                      [v40 result];
                      id v38 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend( v38,  "setTrafficClassVOSucceededLarge:",  v85[3] + objc_msgSend(v38, "trafficClassVOSucceededLarge"));
                    }

                    goto LABEL_63;
                  }
                }
              }

              else if (v23)
              {
                if (v23 == 200)
                {
                  uint64_t v24 = [v59 integerValue];
                  unint64_t v25 = *(void **)(a1 + 48);
                  if (v24 == 300)
                  {
                    [v25 result];
                    double v26 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend( v26,  "setTrafficClassBKAttemptedSmall:",  *(void *)(a1 + 64) + objc_msgSend(v26, "trafficClassBKAttemptedSmall"));
                  }

                  else
                  {
                    [v25 result];
                    double v26 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend( v26,  "setTrafficClassBKAttemptedLarge:",  *(void *)(a1 + 64) + objc_msgSend(v26, "trafficClassBKAttemptedLarge"));
                  }

                  if (v85[3] >= 1)
                  {
                    uint64_t v36 = [v59 integerValue];
                    char v37 = *(void **)(a1 + 48);
                    if (v36 == 300)
                    {
                      [v37 result];
                      id v38 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend( v38,  "setTrafficClassBKSucceededSmall:",  v85[3] + objc_msgSend(v38, "trafficClassBKSucceededSmall"));
                    }

                    else
                    {
                      [v37 result];
                      id v38 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend( v38,  "setTrafficClassBKSucceededLarge:",  v85[3] + objc_msgSend(v38, "trafficClassBKSucceededLarge"));
                    }

void __30__WFMeasure_dispatchPingTest___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  id v4 = a2;
  NSLog( @"%s: OVERRIDING kWFMeasurePreferenceLocalDNSResult result from %ld to %ld",  "-[WFMeasure dispatchPingTest:]_block_invoke_2",  v3,  [v4 integerValue]);
  LODWORD(v3) = [v4 BOOLValue];

  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v3;
}

void __30__WFMeasure_dispatchPingTest___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  id v4 = a2;
  NSLog( @"%s: OVERRIDING kWFMeasurePreferencePublicDNSResult result from %ld to %ld",  "-[WFMeasure dispatchPingTest:]_block_invoke_3",  v3,  [v4 integerValue]);
  LODWORD(v3) = [v4 BOOLValue];

  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v3;
}

void __30__WFMeasure_dispatchPingTest___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  id v4 = a2;
  NSLog( @"%s: OVERRIDING kWFMeasurePreferenceGatewayResult result from %ld to %ld",  "-[WFMeasure dispatchPingTest:]_block_invoke_4",  v3,  [v4 integerValue]);
  LODWORD(v3) = [v4 BOOLValue];

  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v3;
}

void __30__WFMeasure_dispatchPingTest___block_invoke_5(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) integerValue];
  if (v3 == [v4 integerValue])
  {
    NSLog( @"%s: OVERRIDING kWFMeasurePreferenceFailPingsOnACResult to fail for this AC %ld from %ld to %ld",  "-[WFMeasure dispatchPingTest:]_block_invoke_5",  [v4 integerValue],  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24),  objc_msgSend(v4, "integerValue"));
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0LL;
  }
}

void __30__WFMeasure_dispatchPingTest___block_invoke_242(uint64_t a1)
{
  double v2 = (double)(uint64_t)(*(void *)(a1 + 48) - *(void *)(a1 + 56)) / (double)*(uint64_t *)(a1 + 48) * 100.0;
  NSLog( @"%s: LQM-WiFi: Ping test completed for %@, minRTT=%d maxRTT=%d PER=%f",  "-[WFMeasure dispatchPingTest:]_block_invoke",  *(void *)(a1 + 32),  *(void *)(a1 + 64),  *(void *)(a1 + 72),  *(void *)&v2);
  else {
    unsigned int v3 = 3;
  }
  uint64_t v4 = *(void *)(a1 + 80);
  switch(v4)
  {
    case 2LL:
      uint64_t v15 = *(void *)(a1 + 64);
      [*(id *)(a1 + 40) result];
      id v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v16 setGatewayMinRTT:v15];

      uint64_t v17 = *(void *)(a1 + 72);
      [*(id *)(a1 + 40) result];
      unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
      [v18 setGatewayMaxRTT:v17];

      [*(id *)(a1 + 40) result];
      id v19 = (void *)objc_claimAutoreleasedReturnValue();
      [v19 setGatewayPacketLoss:(uint64_t)v2];

      [*(id *)(a1 + 40) result];
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v19) = [v20 gatewayResultsValid];

      if ((_DWORD)v19) {
        uint64_t v11 = v3;
      }
      else {
        uint64_t v11 = 3LL;
      }
      +[WiFiPolicyNetworkActivityTracing sharedNetworkActivityTracing]( &OBJC_CLASS___WiFiPolicyNetworkActivityTracing,  "sharedNetworkActivityTracing");
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v13 = v12;
      uint64_t v14 = 4LL;
      break;
    case 8LL:
      uint64_t v21 = *(void *)(a1 + 64);
      [*(id *)(a1 + 40) result];
      int64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
      [v22 setPublicDNSMinRTT:v21];

      uint64_t v23 = *(void *)(a1 + 72);
      [*(id *)(a1 + 40) result];
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
      [v24 setPublicDNSMaxRTT:v23];

      [*(id *)(a1 + 40) result];
      unint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
      [v25 setPublicDNSPacketLoss:(uint64_t)v2];

      [*(id *)(a1 + 40) result];
      double v26 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v25) = [v26 publicResultsValid];

      if ((_DWORD)v25) {
        uint64_t v11 = v3;
      }
      else {
        uint64_t v11 = 3LL;
      }
      +[WiFiPolicyNetworkActivityTracing sharedNetworkActivityTracing]( &OBJC_CLASS___WiFiPolicyNetworkActivityTracing,  "sharedNetworkActivityTracing");
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v13 = v12;
      uint64_t v14 = 6LL;
      break;
    case 4LL:
      uint64_t v5 = *(void *)(a1 + 64);
      [*(id *)(a1 + 40) result];
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 setLocalDNSMinRTT:v5];

      uint64_t v7 = *(void *)(a1 + 72);
      [*(id *)(a1 + 40) result];
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 setLocalDNSMaxRTT:v7];

      [*(id *)(a1 + 40) result];
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 setLocalDNSPacketLoss:(uint64_t)v2];

      [*(id *)(a1 + 40) result];
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v9) = [v10 gatewayResultsValid];

      if ((_DWORD)v9) {
        uint64_t v11 = v3;
      }
      else {
        uint64_t v11 = 3LL;
      }
      +[WiFiPolicyNetworkActivityTracing sharedNetworkActivityTracing]( &OBJC_CLASS___WiFiPolicyNetworkActivityTracing,  "sharedNetworkActivityTracing");
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v13 = v12;
      uint64_t v14 = 5LL;
      break;
    default:
      NSLog( @"%s: not a recognizable ping option. Ignoring results",  "-[WFMeasure dispatchPingTest:]_block_invoke");
      goto LABEL_21;
  }

  [v12 networkActivityStop:v14 withReason:v11 withClientMetric:0 withClientDict:0 andError:0];

LABEL_21:
  [*(id *)(a1 + 40) dispatchGroup];
  uint64_t v27 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue();
  dispatch_group_leave(v27);
}

- (BOOL)doDNSResolution:(id)a3 timeout:(int64_t)a4
{
  uint64_t v4 = (__CFString *)a3;
  uint64_t v14 = 0LL;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000LL;
  CFHostRef v17 = CFHostCreateWithName((CFAllocatorRef)*MEMORY[0x189604DB0], v4);
  uint64_t v5 = (__CFHost *)v15[3];
  if (v5)
  {
    int started = CFHostStartInfoResolution(v5, kCFHostAddresses, &error);
    CFRetain((CFTypeRef)v15[3]);
    dispatch_time_t v7 = dispatch_time(0LL, 5000000LL);
    dispatch_get_global_queue(0LL, 0LL);
    uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __37__WFMeasure_doDNSResolution_timeout___block_invoke;
    block[3] = &unk_18A16DB60;
    void block[4] = &v14;
    dispatch_after(v7, v8, block);

    if (started)
    {
      Addressing = CFHostGetAddressing((CFHostRef)v15[3], 0LL);
      if (Addressing)
      {
        BOOL v10 = CFArrayGetCount(Addressing) != 0;
        goto LABEL_8;
      }
    }

    else
    {
      NSLog( @"%s: CFHostStartInfoResolution returned error %d",  "-[WFMeasure doDNSResolution:timeout:]",  error.error);
    }
  }

  else
  {
    NSLog(@"%s: hostRef is NULL", "-[WFMeasure doDNSResolution:timeout:]");
  }

  BOOL v10 = 0;
LABEL_8:
  uint64_t v11 = (const void *)v15[3];
  if (v11) {
    CFRelease(v11);
  }
  _Block_object_dispose(&v14, 8);

  return v10;
}

void __37__WFMeasure_doDNSResolution_timeout___block_invoke(uint64_t a1)
{
}

- (void)dispatchDNSTest:(id)a3
{
  id v4 = a3;
  +[WiFiPolicyNetworkActivityTracing sharedNetworkActivityTracing]( &OBJC_CLASS___WiFiPolicyNetworkActivityTracing,  "sharedNetworkActivityTracing");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 networkActivityStart:7 activate:1];

  dispatch_get_global_queue(0LL, 0LL);
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __29__WFMeasure_dispatchDNSTest___block_invoke;
  v8[3] = &unk_18A16C748;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __29__WFMeasure_dispatchDNSTest___block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) doDNSResolution:*(void *)(a1 + 40) timeout:5];
  [*(id *)(a1 + 32) internalQueue];
  unsigned int v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __29__WFMeasure_dispatchDNSTest___block_invoke_2;
  block[3] = &unk_18A16D1C8;
  char v7 = v2;
  id v4 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v6 = v4;
  dispatch_sync(v3, block);
}

void __29__WFMeasure_dispatchDNSTest___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = 0LL;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000LL;
  char v17 = *(_BYTE *)(a1 + 48);
  if (MGGetBoolAnswer())
  {
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    v11[2] = __29__WFMeasure_dispatchDNSTest___block_invoke_3;
    v11[3] = &unk_18A16DBA8;
    char v2 = *(void **)(a1 + 32);
    id v12 = *(id *)(a1 + 40);
    uint64_t v13 = &v14;
    [v2 getLazyNSNumberPreference:@"resolve_apple_result" exists:v11];
  }

  if (*((_BYTE *)v15 + 24)) {
    unsigned int v3 = @"YES";
  }
  else {
    unsigned int v3 = @"NO";
  }
  NSLog( @"%s: LQM-WiFi: DNS test to resolve %@ completed, success=%@",  "-[WFMeasure dispatchDNSTest:]_block_invoke_2",  *(void *)(a1 + 40),  v3);
  int v4 = *((unsigned __int8 *)v15 + 24);
  [*(id *)(a1 + 32) result];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setDnsSuccess:v4 != 0];

  [*(id *)(a1 + 32) result];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setDnsResultsValid:1];

  +[WiFiPolicyNetworkActivityTracing sharedNetworkActivityTracing]( &OBJC_CLASS___WiFiPolicyNetworkActivityTracing,  "sharedNetworkActivityTracing");
  char v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = v7;
  if (*((_BYTE *)v15 + 24)) {
    uint64_t v9 = 2LL;
  }
  else {
    uint64_t v9 = 3LL;
  }
  [v7 networkActivityStop:7 withReason:v9 withClientMetric:0 withClientDict:0 andError:0];

  [*(id *)(a1 + 32) dispatchGroup];
  BOOL v10 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue();
  dispatch_group_leave(v10);

  _Block_object_dispose(&v14, 8);
}

void __29__WFMeasure_dispatchDNSTest___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
  id v5 = a2;
  NSLog( @"%s: OVERRIDING kWFMeasurePreferenceResolveAppleResult %@ result from %u to %u",  "-[WFMeasure dispatchDNSTest:]_block_invoke_3",  v3,  v4,  [v5 BOOLValue]);
  LOBYTE(v3) = [v5 BOOLValue];

  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v3;
}

- (void)dispatchSiriTest:(int64_t)a3 trafficClass:(unsigned int)a4
{
  if (a3 == 2)
  {
    +[WiFiPolicyNetworkActivityTracing sharedNetworkActivityTracing]( &OBJC_CLASS___WiFiPolicyNetworkActivityTracing,  "sharedNetworkActivityTracing");
    char v7 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = v7;
    uint64_t v9 = 10LL;
  }

  else if (a3 == 1)
  {
    +[WiFiPolicyNetworkActivityTracing sharedNetworkActivityTracing]( &OBJC_CLASS___WiFiPolicyNetworkActivityTracing,  "sharedNetworkActivityTracing");
    char v7 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = v7;
    uint64_t v9 = 9LL;
  }

  else
  {
    if (a3) {
      -[WFMeasure dispatchSiriTest:trafficClass:].cold.1();
    }
    +[WiFiPolicyNetworkActivityTracing sharedNetworkActivityTracing]( &OBJC_CLASS___WiFiPolicyNetworkActivityTracing,  "sharedNetworkActivityTracing");
    char v7 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = v7;
    uint64_t v9 = 8LL;
  }

  [v7 networkActivityStart:v9 activate:1];

  dispatch_get_global_queue(0LL, 0LL);
  BOOL v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __43__WFMeasure_dispatchSiriTest_trafficClass___block_invoke;
  block[3] = &unk_18A16DC70;
  unsigned int v12 = a4;
  void block[4] = self;
  void block[5] = a3;
  dispatch_async(v10, block);
}

void __43__WFMeasure_dispatchSiriTest_trafficClass___block_invoke(uint64_t a1)
{
  char v2 = objc_alloc(&OBJC_CLASS___SiriNWConnection);
  [*(id *)(a1 + 32) internalQueue];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) testReason];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __43__WFMeasure_dispatchSiriTest_trafficClass___block_invoke_2;
  v7[3] = &unk_18A16DC48;
  int v8 = *(_DWORD *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  v7[5] = v5;
  id v6 = -[SiriNWConnection initWithQueueAndCompletion:reason:callback:]( v2,  "initWithQueueAndCompletion:reason:callback:",  v3,  v4,  v7);

  NSLog(@"SiriNWConnection Starting");
  -[SiriNWConnection runSiriProbeWithDepth:trafficClass:]( v6,  "runSiriProbeWithDepth:trafficClass:",  *(void *)(a1 + 40),  *(unsigned int *)(a1 + 48));
}

void __43__WFMeasure_dispatchSiriTest_trafficClass___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v43 = 0LL;
  v44 = &v43;
  uint64_t v45 = 0x2020000000LL;
  char v46 = a2;
  if (MGGetBoolAnswer())
  {
    id v6 = *(_BYTE **)(a1 + 32);
    uint64_t v7 = MEMORY[0x1895F87A8];
    if (v6[10])
    {
      if (v6[12])
      {
        uint64_t v42 = MEMORY[0x1895F87A8];
        int v8 = @"siri_timeout_retest_result";
        uint64_t v9 = &v42;
        BOOL v10 = __43__WFMeasure_dispatchSiriTest_trafficClass___block_invoke_3;
      }

      else
      {
        uint64_t v41 = MEMORY[0x1895F87A8];
        int v8 = @"siri_timeout_result";
        uint64_t v9 = &v41;
        BOOL v10 = __43__WFMeasure_dispatchSiriTest_trafficClass___block_invoke_4;
      }

      v9[1] = 3221225472LL;
      v9[2] = (uint64_t)v10;
      v9[3] = (uint64_t)&unk_18A16DC20;
      *((_BYTE *)v9 + 40) = a2;
      v9[4] = (uint64_t)&v43;
      objc_msgSend(v6, "getLazyNSNumberPreference:exists:", v8);
    }

    uint64_t v11 = *(_BYTE **)(a1 + 32);
    if (v11[9])
    {
      if (v11[12])
      {
        v40[0] = v7;
        v40[1] = 3221225472LL;
        v40[2] = __43__WFMeasure_dispatchSiriTest_trafficClass___block_invoke_5;
        v40[3] = &unk_18A16DBA8;
        v40[4] = v11;
        void v40[5] = &v43;
        [v11 getLazyNSNumberPreference:@"periodic_siri_retest_result" exists:v40];
      }

      else
      {
        v39[0] = v7;
        v39[1] = 3221225472LL;
        v39[2] = __43__WFMeasure_dispatchSiriTest_trafficClass___block_invoke_6;
        void v39[3] = &unk_18A16DBA8;
        v39[4] = v11;
        v39[5] = &v43;
        [v11 getLazyNSNumberPreference:@"periodic_siri_result" exists:v39];
      }
    }

    unsigned int v12 = *(_BYTE **)(a1 + 32);
    if (v12[11])
    {
      if (v12[12])
      {
        v38[0] = v7;
        v38[1] = 3221225472LL;
        v38[2] = __43__WFMeasure_dispatchSiriTest_trafficClass___block_invoke_7;
        v38[3] = &unk_18A16DBA8;
        v38[4] = v12;
        v38[5] = &v43;
        [v12 getLazyNSNumberPreference:@"apsd_retest_result" exists:v38];
      }

      else
      {
        v37[0] = v7;
        v37[1] = 3221225472LL;
        v37[2] = __43__WFMeasure_dispatchSiriTest_trafficClass___block_invoke_8;
        v37[3] = &unk_18A16DBA8;
        v37[4] = v12;
        v37[5] = &v43;
        [v12 getLazyNSNumberPreference:@"apsd_result" exists:v37];
      }
    }
  }

  if (!*((_BYTE *)v44 + 24))
  {
    NSLog(@"SiriNWConnection has failed with error %@", v5);
    goto LABEL_28;
  }

  NSLog(@"SiriNWConnection has succeeded");
  int v13 = *(_DWORD *)(a1 + 48);
  if (v13 <= 599)
  {
    if (v13)
    {
      if (v13 != 200) {
        goto LABEL_28;
      }
      [*(id *)(a1 + 32) result];
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setTrafficClassBKAttemptedLarge:", objc_msgSend(v16, "trafficClassBKAttemptedLarge") + 1);

      [*(id *)(a1 + 32) result];
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setTrafficClassBKSucceededLarge:", objc_msgSend(v15, "trafficClassBKSucceededLarge") + 1);
    }

    else
    {
      [*(id *)(a1 + 32) result];
      unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setTrafficClassBEAttemptedLarge:", objc_msgSend(v18, "trafficClassBEAttemptedLarge") + 1);

      [*(id *)(a1 + 32) result];
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setTrafficClassBESucceededLarge:", objc_msgSend(v15, "trafficClassBESucceededLarge") + 1);
    }
  }

  else if (v13 == 600 || v13 == 700)
  {
    [*(id *)(a1 + 32) result];
    char v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTrafficClassVIAttemptedLarge:", objc_msgSend(v17, "trafficClassVIAttemptedLarge") + 1);

    [*(id *)(a1 + 32) result];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTrafficClassVISucceededLarge:", objc_msgSend(v15, "trafficClassVISucceededLarge") + 1);
  }

  else
  {
    if (v13 != 800) {
      goto LABEL_28;
    }
    [*(id *)(a1 + 32) result];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTrafficClassVOAttemptedLarge:", objc_msgSend(v14, "trafficClassVOAttemptedLarge") + 1);

    [*(id *)(a1 + 32) result];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTrafficClassVOSucceededLarge:", objc_msgSend(v15, "trafficClassVOSucceededLarge") + 1);
  }

LABEL_28:
  uint64_t v19 = *(unsigned int *)(a1 + 48);
  [*(id *)(a1 + 32) result];
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v20 setSiriTrafficClass:v19];

  uint64_t v21 = *(void *)(a1 + 40);
  if (v21 == 2)
  {
    int v32 = *((unsigned __int8 *)v44 + 24);
    [*(id *)(a1 + 32) result];
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
    [v33 setSiriACESuccess:v32 != 0];

    [*(id *)(a1 + 32) result];
    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
    [v34 setSiriACEResultsValid:1];

    +[WiFiPolicyNetworkActivityTracing sharedNetworkActivityTracing]( &OBJC_CLASS___WiFiPolicyNetworkActivityTracing,  "sharedNetworkActivityTracing");
    unint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) result];
    double v26 = (void *)objc_claimAutoreleasedReturnValue();
    else {
      uint64_t v35 = 3LL;
    }
    [v25 networkActivityStop:10 withReason:v35 withClientMetric:0 withClientDict:0 andError:0];
  }

  else if (v21 == 1)
  {
    int v28 = *((unsigned __int8 *)v44 + 24);
    [*(id *)(a1 + 32) result];
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    [v29 setSiriTLSSuccess:v28 != 0];

    [*(id *)(a1 + 32) result];
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
    [v30 setSiriTLSResultsValid:1];

    +[WiFiPolicyNetworkActivityTracing sharedNetworkActivityTracing]( &OBJC_CLASS___WiFiPolicyNetworkActivityTracing,  "sharedNetworkActivityTracing");
    unint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) result];
    double v26 = (void *)objc_claimAutoreleasedReturnValue();
    else {
      uint64_t v31 = 3LL;
    }
    [v25 networkActivityStop:9 withReason:v31 withClientMetric:0 withClientDict:0 andError:0];
  }

  else
  {
    if (v21)
    {
      NSLog(@"dispatchSiriTest got results for invalid probeDepth");
      __assert_rtn("-[WFMeasure dispatchSiriTest:trafficClass:]_block_invoke_2", "WFMeasure.m", 1411, "false");
    }

    int v22 = *((unsigned __int8 *)v44 + 24);
    [*(id *)(a1 + 32) result];
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
    [v23 setSiriTCPSuccess:v22 != 0];

    [*(id *)(a1 + 32) result];
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
    [v24 setSiriTCPResultsValid:1];

    +[WiFiPolicyNetworkActivityTracing sharedNetworkActivityTracing]( &OBJC_CLASS___WiFiPolicyNetworkActivityTracing,  "sharedNetworkActivityTracing");
    unint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) result];
    double v26 = (void *)objc_claimAutoreleasedReturnValue();
    else {
      uint64_t v27 = 3LL;
    }
    [v25 networkActivityStop:8 withReason:v27 withClientMetric:0 withClientDict:0 andError:0];
  }

  [*(id *)(a1 + 32) dispatchGroup];
  uint64_t v36 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue();
  dispatch_group_leave(v36);

  _Block_object_dispose(&v43, 8);
}

void __43__WFMeasure_dispatchSiriTest_trafficClass___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned __int8 *)(a1 + 40);
  id v4 = a2;
  NSLog( @"%s: OVERRIDING kWFMeasurePreferenceSiriTimeoutRetestResult success from %u to %u",  "-[WFMeasure dispatchSiriTest:trafficClass:]_block_invoke_3",  v3,  [v4 BOOLValue]);
  LOBYTE(v3) = [v4 BOOLValue];

  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v3;
}

void __43__WFMeasure_dispatchSiriTest_trafficClass___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned __int8 *)(a1 + 40);
  id v4 = a2;
  NSLog( @"%s: OVERRIDING kWFMeasurePreferenceSiriTimeoutTestResult success from %u to %u",  "-[WFMeasure dispatchSiriTest:trafficClass:]_block_invoke_4",  v3,  [v4 BOOLValue]);
  LOBYTE(v3) = [v4 BOOLValue];

  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v3;
}

void __43__WFMeasure_dispatchSiriTest_trafficClass___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  NSLog( @"%s: OVERRIDING kWFMeasurePreferencePeriodicSiriRetestResult success from %u to %u",  "-[WFMeasure dispatchSiriTest:trafficClass:]_block_invoke_5",  [v3 tclass],  objc_msgSend(v4, "BOOLValue"));
  LOBYTE(v3) = [v4 BOOLValue];

  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = (_BYTE)v3;
}

void __43__WFMeasure_dispatchSiriTest_trafficClass___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  NSLog( @"%s: OVERRIDING kWFMeasurePreferencePeriodicSiriTestResult success from %u to %u",  "-[WFMeasure dispatchSiriTest:trafficClass:]_block_invoke_6",  [v3 tclass],  objc_msgSend(v4, "BOOLValue"));
  LOBYTE(v3) = [v4 BOOLValue];

  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = (_BYTE)v3;
}

void __43__WFMeasure_dispatchSiriTest_trafficClass___block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  NSLog( @"%s: OVERRIDING kWFMeasurePreferenceApsdRetestResult success from %u to %u",  "-[WFMeasure dispatchSiriTest:trafficClass:]_block_invoke_7",  [v3 tclass],  objc_msgSend(v4, "BOOLValue"));
  LOBYTE(v3) = [v4 BOOLValue];

  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = (_BYTE)v3;
}

void __43__WFMeasure_dispatchSiriTest_trafficClass___block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  NSLog( @"%s: OVERRIDING kWFMeasurePreferenceApsdTestResult success from %u to %u",  "-[WFMeasure dispatchSiriTest:trafficClass:]_block_invoke_8",  [v3 tclass],  objc_msgSend(v4, "BOOLValue"));
  LOBYTE(v3) = [v4 BOOLValue];

  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = (_BYTE)v3;
}

- (BOOL)start:(id)a3 withCompletionQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[WFMeasure isInProgress](self, "isInProgress"))
  {
    NSLog(@"%s: measurement already started", "-[WFMeasure start:withCompletionQueue:]");
  }

  else
  {
    -[WFMeasure setCompletionHandler:](self, "setCompletionHandler:", v6);
    -[WFMeasure setCompletionQueue:](self, "setCompletionQueue:", v7);
    -[WFMeasure internalQueue](self, "internalQueue");
    int v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      dispatch_queue_t v9 = dispatch_queue_create("com.apple.wifi.wfmeasure", 0LL);
      -[WFMeasure setInternalQueue:](self, "setInternalQueue:", v9);
    }

    if ((-[WFMeasure options](self, "options") & 1) != 0)
    {
      -[WFMeasure dispatchGroup](self, "dispatchGroup");
      BOOL v10 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue();
      dispatch_group_enter(v10);

      -[WFMeasure dispatchThroughputTest](self, "dispatchThroughputTest");
    }

    if ((-[WFMeasure options](self, "options") & 2) != 0)
    {
      -[WFMeasure dispatchGroup](self, "dispatchGroup");
      uint64_t v11 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue();
      dispatch_group_enter(v11);

      -[WFMeasure dispatchPingTest:](self, "dispatchPingTest:", 2LL);
    }

    if ((-[WFMeasure options](self, "options") & 4) != 0)
    {
      -[WFMeasure dispatchGroup](self, "dispatchGroup");
      unsigned int v12 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue();
      dispatch_group_enter(v12);

      -[WFMeasure dispatchPingTest:](self, "dispatchPingTest:", 4LL);
    }

    if ((-[WFMeasure options](self, "options") & 8) != 0)
    {
      -[WFMeasure dispatchGroup](self, "dispatchGroup");
      int v13 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue();
      dispatch_group_enter(v13);

      -[WFMeasure dispatchPingTest:](self, "dispatchPingTest:", 8LL);
    }

    if ((-[WFMeasure options](self, "options") & 0x10) != 0)
    {
      -[WFMeasure dispatchGroup](self, "dispatchGroup");
      uint64_t v14 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue();
      dispatch_group_enter(v14);

      -[WFMeasure testDNSHostname](self, "testDNSHostname");
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFMeasure dispatchDNSTest:](self, "dispatchDNSTest:", v15);
    }

    if ((-[WFMeasure options](self, "options") & 0x20) != 0)
    {
      -[WFMeasure dispatchGroup](self, "dispatchGroup");
      uint64_t v16 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue();
      dispatch_group_enter(v16);

      -[WFMeasure dispatchSiriTest:trafficClass:]( self,  "dispatchSiriTest:trafficClass:",  0LL,  -[WFMeasure tclass](self, "tclass"));
    }

    if ((-[WFMeasure options](self, "options") & 0x40) != 0)
    {
      -[WFMeasure dispatchGroup](self, "dispatchGroup");
      char v17 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue();
      dispatch_group_enter(v17);

      -[WFMeasure dispatchSiriTest:trafficClass:]( self,  "dispatchSiriTest:trafficClass:",  1LL,  -[WFMeasure tclass](self, "tclass"));
    }

    dispatch_get_global_queue(0LL, 0LL);
    unint64_t v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __39__WFMeasure_start_withCompletionQueue___block_invoke;
    block[3] = &unk_18A16C770;
    void block[4] = self;
    dispatch_async(v18, block);

    -[WFMeasure setIsInProgress:](self, "setIsInProgress:", 1LL);
  }

  BOOL v19 = -[WFMeasure isInProgress](self, "isInProgress");

  return v19;
}

void __39__WFMeasure_start_withCompletionQueue___block_invoke(uint64_t a1)
{
  char v2 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue();
  dispatch_time_t v3 = dispatch_time(0LL, 120000000000LL);
  uint64_t v4 = dispatch_group_wait(v2, v3);

  if (v4) {
    NSLog(@"%s: tests timed out", "-[WFMeasure start:withCompletionQueue:]_block_invoke");
  }
  else {
    NSLog(@"%s: all tests completed", "-[WFMeasure start:withCompletionQueue:]_block_invoke");
  }
  [*(id *)(a1 + 32) internalQueue];
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __39__WFMeasure_start_withCompletionQueue___block_invoke_2;
  block[3] = &unk_18A16C770;
  void block[4] = *(void *)(a1 + 32);
  dispatch_sync(v5, block);
}

void __39__WFMeasure_start_withCompletionQueue___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) completionHandler];
  if (v2)
  {
    dispatch_time_t v3 = (void *)v2;
    [*(id *)(a1 + 32) completionQueue];
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      [*(id *)(a1 + 32) completionQueue];
      id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __39__WFMeasure_start_withCompletionQueue___block_invoke_3;
      block[3] = &unk_18A16C770;
      void block[4] = *(void *)(a1 + 32);
      dispatch_async(v5, block);
    }
  }

void __39__WFMeasure_start_withCompletionQueue___block_invoke_3(uint64_t a1)
{
  id v5 = *(_BYTE **)(a1 + 32);
  if (!v5[13])
  {
    [v5 result];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setSeenSpecificAcFailure:0];

    [*(id *)(a1 + 32) result];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) result];
    int v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v8 trafficClassBEAttemptedSmall];
    if (v9 <= 0
      && ([*(id *)(a1 + 32) result],
          v1 = (void *)objc_claimAutoreleasedReturnValue(),
          [v1 trafficClassBEAttemptedLarge] < 1))
    {
      int v12 = 0;
      int v10 = 0;
      BOOL v11 = 0;
    }

    else
    {
      [*(id *)(a1 + 32) result];
      uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v2 trafficClassBESucceededSmall])
      {
        int v10 = 0;
        BOOL v11 = 0;
        int v12 = 1;
      }

      else
      {
        [*(id *)(a1 + 32) result];
        dispatch_time_t v3 = (void *)objc_claimAutoreleasedReturnValue();
        BOOL v11 = [v3 trafficClassBESucceededLarge] == 0;
        int v12 = 1;
        int v10 = 1;
      }
    }

    objc_msgSend(v7, "setSeenSpecificAcFailure:", v11 | objc_msgSend(v7, "seenSpecificAcFailure"));
    if (v10) {

    }
    if (v12) {
    if (v9 <= 0)
    }

    [*(id *)(a1 + 32) result];
    int v13 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) result];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = [v14 trafficClassBKAttemptedSmall];
    if (v15 <= 0
      && ([*(id *)(a1 + 32) result],
          v1 = (void *)objc_claimAutoreleasedReturnValue(),
          [v1 trafficClassBKAttemptedLarge] < 1))
    {
      int v18 = 0;
      int v16 = 0;
      BOOL v17 = 0;
    }

    else
    {
      [*(id *)(a1 + 32) result];
      uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v2 trafficClassBKSucceededSmall])
      {
        int v16 = 0;
        BOOL v17 = 0;
        int v18 = 1;
      }

      else
      {
        [*(id *)(a1 + 32) result];
        dispatch_time_t v3 = (void *)objc_claimAutoreleasedReturnValue();
        BOOL v17 = [v3 trafficClassBKSucceededLarge] == 0;
        int v18 = 1;
        int v16 = 1;
      }
    }

    objc_msgSend(v13, "setSeenSpecificAcFailure:", v17 | objc_msgSend(v13, "seenSpecificAcFailure"));
    if (v16) {

    }
    if (v18) {
    if (v15 <= 0)
    }

    [*(id *)(a1 + 32) result];
    BOOL v19 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) result];
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v21 = [v20 trafficClassVOAttemptedSmall];
    if (v21 <= 0
      && ([*(id *)(a1 + 32) result],
          v1 = (void *)objc_claimAutoreleasedReturnValue(),
          [v1 trafficClassVOAttemptedLarge] < 1))
    {
      int v24 = 0;
      int v22 = 0;
      BOOL v23 = 0;
    }

    else
    {
      [*(id *)(a1 + 32) result];
      uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v2 trafficClassVOSucceededSmall])
      {
        int v22 = 0;
        BOOL v23 = 0;
        int v24 = 1;
      }

      else
      {
        [*(id *)(a1 + 32) result];
        dispatch_time_t v3 = (void *)objc_claimAutoreleasedReturnValue();
        BOOL v23 = [v3 trafficClassVOSucceededLarge] == 0;
        int v24 = 1;
        int v22 = 1;
      }
    }

    objc_msgSend(v19, "setSeenSpecificAcFailure:", v23 | objc_msgSend(v19, "seenSpecificAcFailure"));
    if (v22) {

    }
    if (v24) {
    if (v21 <= 0)
    }

    [*(id *)(a1 + 32) result];
    unint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) result];
    double v26 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v27 = [v26 trafficClassVIAttemptedSmall];
    if (v27 <= 0
      && ([*(id *)(a1 + 32) result],
          v1 = (void *)objc_claimAutoreleasedReturnValue(),
          [v1 trafficClassVIAttemptedLarge] < 1))
    {
      int v30 = 0;
      int v28 = 0;
      BOOL v29 = 0;
    }

    else
    {
      [*(id *)(a1 + 32) result];
      uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v2 trafficClassVISucceededSmall])
      {
        int v28 = 0;
        BOOL v29 = 0;
        int v30 = 1;
      }

      else
      {
        [*(id *)(a1 + 32) result];
        dispatch_time_t v3 = (void *)objc_claimAutoreleasedReturnValue();
        BOOL v29 = [v3 trafficClassVISucceededLarge] == 0;
        int v30 = 1;
        int v28 = 1;
      }
    }

    objc_msgSend(v25, "setSeenSpecificAcFailure:", v29 | objc_msgSend(v25, "seenSpecificAcFailure"));
    if (v28) {

    }
    if (v30) {
    if (v27 <= 0)
    }

    [*(id *)(a1 + 32) result];
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v32 = [v31 numAcFailed];

    [*(id *)(a1 + 32) result];
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
    int v34 = [v33 seenSpecificAcFailure];
    if (v32)
    {
      if ((v34 & 1) == 0) {
        __39__WFMeasure_start_withCompletionQueue___block_invoke_3_cold_2();
      }
    }

    else if (v34)
    {
      __39__WFMeasure_start_withCompletionQueue___block_invoke_3_cold_1();
    }
  }

  +[WiFiUsageMonitor sharedInstance](&OBJC_CLASS___WiFiUsageMonitor, "sharedInstance");
  uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) result];
  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
  char v37 = *(void **)(a1 + 32);
  uint64_t v38 = v37[13];
  [v37 interfaceName];
  uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue();
  [v35 linkTestEvent:v36 withReason:v38 forInterface:v39];

  [*(id *)(a1 + 32) dnsServers];
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) result];
  uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();
  [v41 setDnsServers:v40];

  [*(id *)(a1 + 32) gatewayAddress];
  uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) result];
  uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue();
  [v43 setGatewayAddress:v42];

  [*(id *)(a1 + 32) completionHandler];
  char v46 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) result];
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v45 = (void *)[v44 copy];
  v46[2](v46, v45);
}

- (id)description
{
  dispatch_time_t v3 = (void *)NSString;
  if (-[WFMeasure isInProgress](self, "isInProgress")) {
    uint64_t v4 = @"YES";
  }
  else {
    uint64_t v4 = @"NO";
  }
  unint64_t v5 = -[WFMeasure options](self, "options");
  -[WFMeasure interfaceName](self, "interfaceName");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFMeasure gatewayAddress](self, "gatewayAddress");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFMeasure dnsServers](self, "dnsServers");
  int v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"isInProgress=%@ options=0x%lx interfaceName=%@ gateway=%@ dnsServers=%@", v4, v5, v6, v7, v8];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)abort
{
  dispatch_time_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 networkActivityTracingCompleteConnectionsActivities];

  -[WFMeasure setIsInProgress:](self, "setIsInProgress:", 0LL);
}

- (BOOL)isInProgress
{
  return self->_isInProgress;
}

- (void)setIsInProgress:(BOOL)a3
{
  self->_isInProgress = a3;
}

- (NSString)gatewayAddress
{
  return self->_gatewayAddress;
}

- (void)setGatewayAddress:(id)a3
{
}

- (NSMutableSet)dnsServers
{
  return self->_dnsServers;
}

- (void)setDnsServers:(id)a3
{
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (OS_dispatch_group)dispatchGroup
{
  return self->_dispatchGroup;
}

- (void)setDispatchGroup:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (OS_dispatch_queue)completionQueue
{
  return self->_completionQueue;
}

- (void)setCompletionQueue:(id)a3
{
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void)setInternalQueue:(id)a3
{
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (void)setInterfaceName:(id)a3
{
}

- (NSString)publicDNSAddress
{
  return self->_publicDNSAddress;
}

- (void)setPublicDNSAddress:(id)a3
{
}

- (NSString)testDNSHostname
{
  return self->_testDNSHostname;
}

- (void)setTestDNSHostname:(id)a3
{
}

- (NSString)testReason
{
  return self->_testReason;
}

- (void)setTestReason:(id)a3
{
}

- (BOOL)isPeriodicTest
{
  return self->_isPeriodicTest;
}

- (void)setIsPeriodicTest:(BOOL)a3
{
  self->_isPeriodicTest = a3;
}

- (BOOL)isSiriTimeout
{
  return self->_isSiriTimeout;
}

- (void)setIsSiriTimeout:(BOOL)a3
{
  self->_isSiriTimeout = a3;
}

- (BOOL)isApsdTimeout
{
  return self->_isApsdTimeout;
}

- (void)setIsApsdTimeout:(BOOL)a3
{
  self->_isApsdTimeout = a3;
}

- (BOOL)isRetest
{
  return self->_isRetest;
}

- (void)setIsRetest:(BOOL)a3
{
  self->_isRetest = a3;
}

- (BOOL)isParis
{
  return self->_isParis;
}

- (void)setIsParis:(BOOL)a3
{
  self->_isParis = a3;
}

- (unsigned)tclass
{
  return self->_tclass;
}

- (void)setTclass:(unsigned int)a3
{
  self->_tclass = a3;
}

- (WFMeasureResult)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
}

- (void).cxx_destruct
{
}

void __30__WFMeasure_dispatchPingTest___block_invoke_cold_1(uint8_t *buf, _BYTE *a2)
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_fault_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_FAULT,  "Pinging LocalDNS PublicDNS or Gateway failed due to no pingAddress",  buf,  2u);
}

- (void)dispatchSiriTest:trafficClass:.cold.1()
{
}

void __39__WFMeasure_start_withCompletionQueue___block_invoke_3_cold_1()
{
  __assert_rtn( "-[WFMeasure start:withCompletionQueue:]_block_invoke_3",  "WFMeasure.m",  1489,  "self.result.seenSpecificAcFailure == NO");
}

void __39__WFMeasure_start_withCompletionQueue___block_invoke_3_cold_2()
{
  __assert_rtn( "-[WFMeasure start:withCompletionQueue:]_block_invoke_3",  "WFMeasure.m",  1487,  "self.result.seenSpecificAcFailure == YES");
}

@end