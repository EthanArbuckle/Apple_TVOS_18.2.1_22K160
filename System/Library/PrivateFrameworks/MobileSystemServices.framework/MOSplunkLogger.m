@interface MOSplunkLogger
- (BOOL)allowInvalidCert;
- (MOSplunkLogger)initWithName:(id)a3 configurationURL:(id)a4 splunkTopic:(id)a5 version:(id)a6 allowInvalidCert:(BOOL)a7;
- (NSMutableArray)events;
- (NSNumber)samplingPercentage;
- (NSString)path;
- (NSString)splunkTopic;
- (NSString)version;
- (NSURL)configurationURL;
- (NSURL)splunkUploadURL;
- (OS_dispatch_queue)queue;
- (double)lastSuccessfulConfigurationLoad;
- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
- (void)_onQueue_loadConfiguration;
- (void)logEventNamed:(id)a3 value:(id)a4;
- (void)setAllowInvalidCert:(BOOL)a3;
- (void)setConfigurationURL:(id)a3;
- (void)setEvents:(id)a3;
- (void)setLastSuccessfulConfigurationLoad:(double)a3;
- (void)setPath:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSamplingPercentage:(id)a3;
- (void)setSplunkTopic:(id)a3;
- (void)setSplunkUploadURL:(id)a3;
- (void)setVersion:(id)a3;
- (void)uploadEventsWithCompletion:(id)a3;
@end

@implementation MOSplunkLogger

- (MOSplunkLogger)initWithName:(id)a3 configurationURL:(id)a4 splunkTopic:(id)a5 version:(id)a6 allowInvalidCert:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___MOSplunkLogger;
  v16 = -[MOSplunkLogger init](&v25, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_configurationURL, a4);
    objc_storeStrong((id *)&v17->_splunkTopic, a5);
    objc_storeStrong((id *)&v17->_version, a6);
    id v18 = objc_alloc_init(MEMORY[0x189603FA8]);
    -[MOSplunkLogger setEvents:](v17, "setEvents:", v18);

    -[MOSplunkLogger setAllowInvalidCert:](v17, "setAllowInvalidCert:", v7);
    id v19 = [NSString stringWithFormat:@"%@.SplunkLoggerQueue", v12];
    v20 = (const char *)[v19 UTF8String];
    dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v21 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v22 = dispatch_queue_create(v20, v21);
    -[MOSplunkLogger setQueue:](v17, "setQueue:", v22);

    v23 = v17;
  }

  return v17;
}

- (void)_onQueue_loadConfiguration
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  dispatch_semaphore_t v4 = dispatch_semaphore_create(0LL);
  [MEMORY[0x189607AA8] ephemeralSessionConfiguration];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607AA0] sessionWithConfiguration:v5 delegate:self delegateQueue:0];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __44__MOSplunkLogger__onQueue_loadConfiguration__block_invoke;
  v15[3] = &unk_189D3D778;
  v15[4] = self;
  dispatch_semaphore_t v16 = v4;
  BOOL v7 = v4;
  v8 = _Block_copy(v15);
  v9 = -[MOSplunkLogger configurationURL](self, "configurationURL");
  [v6 dataTaskWithURL:v9 completionHandler:v8];
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  MOLogWrite( 0LL,  3,  (uint64_t)"-[MOSplunkLogger _onQueue_loadConfiguration]",  @"Loading configuration",  v11,  v12,  v13,  v14,  v15[0]);
  [v10 resume];
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
}

void __44__MOSplunkLogger__onQueue_loadConfiguration__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v9)
  {
    id v15 = v9;
    id v16 = 0LL;
LABEL_5:
    MOLogWrite( 0LL,  3,  (uint64_t)"-[MOSplunkLogger _onQueue_loadConfiguration]_block_invoke",  @"Unable to load configuration. Error: %@",  v11,  v12,  v13,  v14,  (char)v15);
    id v18 = 0LL;
    id v19 = 0LL;
    v20 = 0LL;
    goto LABEL_6;
  }

  id v51 = 0LL;
  [MEMORY[0x1896078D8] JSONObjectWithData:v7 options:0 error:&v51];
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  id v17 = v51;
  if (v17)
  {
    id v15 = v17;
    goto LABEL_5;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v16 = v16;
    [v16 objectForKeyedSubscript:@"metricsUrl"];
    id v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      [MEMORY[0x189604030] URLWithString:v19];
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      [*(id *)(a1 + 32) version];
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      [v50 URLByAppendingPathComponent:v29];
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      [*(id *)(a1 + 32) splunkTopic];
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      [v30 URLByAppendingPathComponent:v31];
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      [*(id *)(a1 + 32) setSplunkUploadURL:v32];

      [*(id *)(a1 + 32) splunkUploadURL];
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite( 0LL,  3,  (uint64_t)"-[MOSplunkLogger _onQueue_loadConfiguration]_block_invoke",  @"Splunk upload URL set to %@",  v34,  v35,  v36,  v37,  (char)v33);
    }

    else
    {
      MOLogWrite( 0LL,  3,  (uint64_t)"-[MOSplunkLogger _onQueue_loadConfiguration]_block_invoke",  @"Could not find metrics URL in configuration",  v25,  v26,  v27,  v28,  v48);
    }

    [v16 objectForKeyedSubscript:@"performance"];
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    [v38 objectForKeyedSubscript:@"samplingPercentage"];
    id v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      [*(id *)(a1 + 32) setSamplingPercentage:v18];
      MOLogWrite( 0LL,  3,  (uint64_t)"-[MOSplunkLogger _onQueue_loadConfiguration]_block_invoke",  @"Sampling percentage set to %@",  v43,  v44,  v45,  v46,  (char)v18);
    }

    else
    {
      MOLogWrite( 0LL,  3,  (uint64_t)"-[MOSplunkLogger _onQueue_loadConfiguration]_block_invoke",  @"Could not find sampling percentage in configuration",  v39,  v40,  v41,  v42,  v49);
    }

    [*(id *)(a1 + 32) samplingPercentage];
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      [*(id *)(a1 + 32) splunkUploadURL];
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      if (v47)
      {
        [MEMORY[0x189603F50] timeIntervalSinceReferenceDate];
        objc_msgSend(*(id *)(a1 + 32), "setLastSuccessfulConfigurationLoad:");
      }

      id v15 = 0LL;
    }

    v20 = v16;
  }

  else
  {
    MOLogWrite( 0LL,  3,  (uint64_t)"-[MOSplunkLogger _onQueue_loadConfiguration]_block_invoke",  @"Configuration does not have the expected format",  v21,  v22,  v23,  v24,  v48);
    id v18 = 0LL;
    id v19 = 0LL;
    v20 = 0LL;
    id v15 = 0LL;
  }

- (void)uploadEventsWithCompletion:(id)a3
{
  id v4 = a3;
  -[MOSplunkLogger queue](self, "queue");
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = MEMORY[0x1895F87A8];
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __45__MOSplunkLogger_uploadEventsWithCompletion___block_invoke;
  block[3] = &unk_189D3D7A0;
  block[4] = self;
  dispatch_async(v5, block);

  -[MOSplunkLogger queue](self, "queue");
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v9[0] = v6;
  v9[1] = 3221225472LL;
  v9[2] = __45__MOSplunkLogger_uploadEventsWithCompletion___block_invoke_2;
  v9[3] = &unk_189D3D7F0;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, v9);
}

uint64_t __45__MOSplunkLogger_uploadEventsWithCompletion___block_invoke(uint64_t a1)
{
  double v3 = v2;
  uint64_t result = [*(id *)(a1 + 32) lastSuccessfulConfigurationLoad];
  if (v3 - v5 > 86400.0) {
    return objc_msgSend(*(id *)(a1 + 32), "_onQueue_loadConfiguration");
  }
  return result;
}

void __45__MOSplunkLogger_uploadEventsWithCompletion___block_invoke_2(uint64_t a1)
{
  v35[2] = *MEMORY[0x1895F89C0];
  float v2 = (float)arc4random_uniform(0x64u);
  [*(id *)(a1 + 32) samplingPercentage];
  double v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 floatValue];
  float v5 = v4 * 100.0;

  if (v5 >= v2)
  {
    [MEMORY[0x189607AA8] ephemeralSessionConfiguration];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189607AA0] sessionWithConfiguration:v6 delegate:*(void *)(a1 + 32) delegateQueue:0];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    id v8 = objc_alloc_init(MEMORY[0x189607948]);
    [*(id *)(a1 + 32) splunkUploadURL];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 setURL:v9];

    [v8 setHTTPMethod:@"POST"];
    v34[0] = @"postTime";
    [MEMORY[0x189607968] numberWithUnsignedLongLong:clock_gettime_nsec_np(_CLOCK_REALTIME) / 0xF4240];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    v34[1] = @"events";
    v35[0] = v10;
    [*(id *)(a1 + 32) events];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    v35[1] = v11;
    [MEMORY[0x189603F68] dictionaryWithObjects:v35 forKeys:v34 count:2];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

    id v33 = 0LL;
    [MEMORY[0x1896078D8] dataWithJSONObject:v12 options:0 error:&v33];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    id v14 = v33;
    id v19 = v14;
    if (!v13 || v14)
    {
      MOLogWrite( 0LL,  3,  (uint64_t)"-[MOSplunkLogger uploadEventsWithCompletion:]_block_invoke_2",  @"Failed to serialize Splunk payload: %@",  v15,  v16,  v17,  v18,  (char)v14);
    }

    else
    {
      [v8 setHTTPBody:v13];
      dispatch_semaphore_t v20 = dispatch_semaphore_create(0LL);
      aBlock[0] = MEMORY[0x1895F87A8];
      aBlock[1] = 3221225472LL;
      aBlock[2] = __45__MOSplunkLogger_uploadEventsWithCompletion___block_invoke_3;
      aBlock[3] = &unk_189D3D7C8;
      uint64_t v21 = *(void **)(a1 + 40);
      aBlock[4] = *(void *)(a1 + 32);
      dispatch_semaphore_t v31 = v20;
      id v32 = v21;
      uint64_t v22 = v20;
      uint64_t v23 = _Block_copy(aBlock);
      [v7 dataTaskWithRequest:v8 completionHandler:v23];
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite( 0LL,  3,  (uint64_t)"-[MOSplunkLogger uploadEventsWithCompletion:]_block_invoke_2",  @"Splunk upload start",  v25,  v26,  v27,  v28,  v29);
      [v24 resume];
      dispatch_semaphore_wait(v22, 0xFFFFFFFFFFFFFFFFLL);
    }
  }

  else
  {
    (*(void (**)(void, void))(*(void *)(a1 + 40) + 16LL))(*(void *)(a1 + 40), 0LL);
  }

void __45__MOSplunkLogger_uploadEventsWithCompletion___block_invoke_3( uint64_t a1,  void *a2,  void *a3,  void *a4)
{
  id v32 = a2;
  id v7 = a3;
  id v8 = a4;
  uint64_t v13 = v8;
  if (v8)
  {
    MOLogWrite( 0LL,  3,  (uint64_t)"-[MOSplunkLogger uploadEventsWithCompletion:]_block_invoke_3",  @"Error in uploading the events to splunk: %@",  v9,  v10,  v11,  v12,  (char)v8);
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      id v14 = v7;
      if ([v14 statusCode] < 200 || objc_msgSend(v14, "statusCode") > 299)
      {
        char v31 = [v14 statusCode];
        MOLogWrite( 0LL,  3,  (uint64_t)"-[MOSplunkLogger uploadEventsWithCompletion:]_block_invoke_3",  @"Splunk upload unexpected status: %d",  v25,  v26,  v27,  v28,  v31);
      }

      else
      {
        MOLogWrite( 0LL,  3,  (uint64_t)"-[MOSplunkLogger uploadEventsWithCompletion:]_block_invoke_3",  @"Splunk upload successful",  v15,  v16,  v17,  v18,  v30);
        [*(id *)(a1 + 32) events];
        id v19 = (void *)objc_claimAutoreleasedReturnValue();
        [v19 removeAllObjects];
      }
    }

    else
    {
      dispatch_semaphore_t v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      MOLogWrite( 0LL,  3,  (uint64_t)"-[MOSplunkLogger uploadEventsWithCompletion:]_block_invoke_3",  @"Received the wrong kind of response: %@",  v21,  v22,  v23,  v24,  (char)v14);
    }
  }

  uint64_t v29 = *(void *)(a1 + 48);
  if (v29) {
    (*(void (**)(uint64_t, void *))(v29 + 16))(v29, v13);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)logEventNamed:(id)a3 value:(id)a4
{
  id v6 = a3;
  id v7 = (void *)[a4 mutableCopy];
  [MEMORY[0x189607968] numberWithUnsignedLongLong:clock_gettime_nsec_np(_CLOCK_REALTIME) / 0xF4240];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setObject:v8 forKeyedSubscript:@"eventTime"];

  -[MOSplunkLogger splunkTopic](self, "splunkTopic");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setObject:v9 forKeyedSubscript:@"topic"];

  [v7 setObject:v6 forKeyedSubscript:@"eventType"];
  -[MOSplunkLogger queue](self, "queue");
  uint64_t v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __38__MOSplunkLogger_logEventNamed_value___block_invoke;
  v12[3] = &unk_189D3D818;
  v12[4] = self;
  id v13 = v7;
  id v11 = v7;
  dispatch_async(v10, v12);
}

void __38__MOSplunkLogger_logEventNamed_value___block_invoke(uint64_t a1)
{
  float v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 addObject:*(void *)(a1 + 40)];

  [*(id *)(a1 + 32) events];
  double v3 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v4 = [v3 count];

  if (v4 >= 0x3E9)
  {
    MOLogWrite( 0LL,  3,  (uint64_t)"-[MOSplunkLogger logEventNamed:value:]_block_invoke",  @"Maximum number of events exceeded. Discarding oldest event.",  v5,  v6,  v7,  v8,  v9);
    [*(id *)(a1 + 32) events];
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    [v10 removeObjectAtIndex:0];
  }

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  uint64_t v8 = (void (**)(id, uint64_t, void))a5;
  MOLogWrite( 0LL,  3,  (uint64_t)"-[MOSplunkLogger URLSession:didReceiveChallenge:completionHandler:]",  @"Splunk upload challenge",  v9,  v10,  v11,  v12,  v28);
  int v30 = 0;
  if ([v7 previousFailureCount] >= 1) {
    goto LABEL_2;
  }
  [v7 protectionSpace];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 authenticationMethod];
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  int v15 = [v14 isEqualToString:*MEMORY[0x189607738]];

  if (!v15)
  {
    v8[2](v8, 1LL, 0LL);
    goto LABEL_11;
  }

  [v7 protectionSpace];
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x186E24EA4]([v16 serverTrust], &v30);

  if (!-[MOSplunkLogger allowInvalidCert](self, "allowInvalidCert") && v30 != 4 && v30 != 1)
  {
    MOLogWrite( 0LL,  3,  (uint64_t)"-[MOSplunkLogger URLSession:didReceiveChallenge:completionHandler:]",  @"Error evaluating trust. SecTrustResultType=%d",  v17,  v18,  v19,  v20,  v30);
LABEL_2:
    v8[2](v8, 2LL, 0LL);
    goto LABEL_11;
  }

  if (-[MOSplunkLogger allowInvalidCert](self, "allowInvalidCert")) {
    MOLogWrite( 0LL,  3,  (uint64_t)"-[MOSplunkLogger URLSession:didReceiveChallenge:completionHandler:]",  @"Force Accepting Credential",  v21,  v22,  v23,  v24,  v29);
  }
  uint64_t v25 = (void *)MEMORY[0x189607A60];
  [v7 protectionSpace];
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "credentialForTrust:", objc_msgSend(v26, "serverTrust"));
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();

  ((void (**)(id, uint64_t, void *))v8)[2](v8, 0LL, v27);
LABEL_11:
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (NSMutableArray)events
{
  return self->_events;
}

- (void)setEvents:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (BOOL)allowInvalidCert
{
  return self->_allowInvalidCert;
}

- (void)setAllowInvalidCert:(BOOL)a3
{
  self->_allowInvalidCert = a3;
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
}

- (NSURL)splunkUploadURL
{
  return self->_splunkUploadURL;
}

- (void)setSplunkUploadURL:(id)a3
{
}

- (NSURL)configurationURL
{
  return self->_configurationURL;
}

- (void)setConfigurationURL:(id)a3
{
}

- (NSString)splunkTopic
{
  return self->_splunkTopic;
}

- (void)setSplunkTopic:(id)a3
{
}

- (NSNumber)samplingPercentage
{
  return self->_samplingPercentage;
}

- (void)setSamplingPercentage:(id)a3
{
}

- (double)lastSuccessfulConfigurationLoad
{
  return self->_lastSuccessfulConfigurationLoad;
}

- (void)setLastSuccessfulConfigurationLoad:(double)a3
{
  self->_lastSuccessfulConfigurationLoad = a3;
}

- (void).cxx_destruct
{
}

@end