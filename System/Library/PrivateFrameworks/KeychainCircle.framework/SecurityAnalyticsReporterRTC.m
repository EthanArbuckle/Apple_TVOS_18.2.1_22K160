@interface SecurityAnalyticsReporterRTC
+ (id)rtcAnalyticsReporter;
+ (void)sendMetricWithEvent:(id)a3 success:(BOOL)a4 error:(id)a5;
@end

@implementation SecurityAnalyticsReporterRTC

+ (id)rtcAnalyticsReporter
{
  if (rtcAnalyticsReporter_onceToken != -1) {
    dispatch_once(&rtcAnalyticsReporter_onceToken, &__block_literal_global_187);
  }
  return (id)rtcAnalyticsReporter_rtcReporter;
}

+ (void)sendMetricWithEvent:(id)a3 success:(BOOL)a4 error:(id)a5
{
  id v9 = a3;
  id v7 = a5;
  if ([v9 permittedToSendMetrics])
  {
    [v9 queue];
    v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __66__SecurityAnalyticsReporterRTC_sendMetricWithEvent_success_error___block_invoke;
    block[3] = &unk_18A134DA8;
    id v11 = v9;
    BOOL v13 = a4;
    id v12 = v7;
    dispatch_sync(v8, block);
  }
}

void __66__SecurityAnalyticsReporterRTC_sendMetricWithEvent_success_error___block_invoke(uint64_t a1)
{
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithBool:*(unsigned __int8 *)(a1 + 48)];
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v2 forKeyedSubscript:@"didSucceed"];

  [v4 populateUnderlyingErrorsStartingWithRootError:*(void *)(a1 + 40)];
  v3 = +[SecurityAnalyticsReporterRTC rtcAnalyticsReporter]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "rtcAnalyticsReporter");
  [v3 sendEvent:v4];
}

void __52__SecurityAnalyticsReporterRTC_rtcAnalyticsReporter__block_invoke()
{
  uint64_t v12 = 0LL;
  BOOL v13 = &v12;
  uint64_t v14 = 0x2050000000LL;
  v0 = (void *)getAAFAnalyticsTransportRTCClass_softClass;
  uint64_t v15 = getAAFAnalyticsTransportRTCClass_softClass;
  if (!getAAFAnalyticsTransportRTCClass_softClass)
  {
    uint64_t v7 = MEMORY[0x1895F87A8];
    uint64_t v8 = 3221225472LL;
    id v9 = __getAAFAnalyticsTransportRTCClass_block_invoke;
    v10 = &unk_18A135408;
    id v11 = &v12;
    __getAAFAnalyticsTransportRTCClass_block_invoke((uint64_t)&v7);
    v0 = (void *)v13[3];
  }

  id v1 = v0;
  _Block_object_dispose(&v12, 8);
  [v1 analyticsTransportRTCWithClientType:&unk_18A13BF98 clientBundleId:@"com.apple.securityd" clientName:@"com.apple.aaa.dnu"];
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = 0LL;
  BOOL v13 = &v12;
  uint64_t v14 = 0x2050000000LL;
  v3 = (void *)getAAFAnalyticsReporterClass_softClass;
  uint64_t v15 = getAAFAnalyticsReporterClass_softClass;
  if (!getAAFAnalyticsReporterClass_softClass)
  {
    uint64_t v7 = MEMORY[0x1895F87A8];
    uint64_t v8 = 3221225472LL;
    id v9 = __getAAFAnalyticsReporterClass_block_invoke;
    v10 = &unk_18A135408;
    id v11 = &v12;
    __getAAFAnalyticsReporterClass_block_invoke((uint64_t)&v7);
    v3 = (void *)v13[3];
  }

  id v4 = v3;
  _Block_object_dispose(&v12, 8);
  uint64_t v5 = [v4 analyticsReporterWithTransport:v2];
  v6 = (void *)rtcAnalyticsReporter_rtcReporter;
  rtcAnalyticsReporter_rtcReporter = v5;
}

@end