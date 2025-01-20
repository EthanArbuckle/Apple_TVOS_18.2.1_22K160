@interface GTMTLReplay
@end

@implementation GTMTLReplay

void __GTMTLReplay_CLI_block_invoke(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  v13 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@-%@-%@",  a1[4],  v8,  v7);

  v10 = (void (*)(id, void *))a1[6];
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSString stringByAppendingPathExtension:](v13, "stringByAppendingPathExtension:", @"png"));
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:isDirectory:relativeToURL:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:isDirectory:relativeToURL:",  v11,  0LL,  a1[5]));
  v10(v9, v12);
}

void __GTMTLReplay_CLI_block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained processStreamingGRCData:v3];

  if (!v3)
  {
    [WeakRetained processStreamingGRCData:&off_5A01C8];
    [WeakRetained waitForCompletion];
  }
}

void __GTMTLReplay_CLI_block_invoke_194(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained processStreamingGRCData:v3];

  if (!v3)
  {
    [WeakRetained processStreamingGRCData:&off_5A01F0];
    [WeakRetained waitForCompletion];
  }
}

void __GTMTLReplay_CLI_block_invoke_208(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained processStreamingGRCData:v3];

  if (!v3)
  {
    [WeakRetained processStreamingGRCData:&off_5A0218];
    [WeakRetained waitForCompletion];
  }
}

void __GTMTLReplay_CLI_block_invoke_2_224(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v14 = v3;
  if (!v3)
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    goto LABEL_14;
  }

  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"Streaming APS Counters"]);
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = v4 != 0LL;

    id v3 = v14;
    if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"Remove APS Data"]);

      v11 = *(void **)(a1 + 40);
      if (v10)
      {
        [v11 removeAPSData];
        uint64_t v8 = *(void *)(a1 + 56);
        goto LABEL_10;
      }

      [v11 addAPSData:v14];
      uint64_t v9 = *(void *)(a1 + 56);
LABEL_13:
      ++*(void *)(*(void *)(v9 + 8) + 24LL);
      goto LABEL_14;
    }
  }

  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"Streaming APS Profiling"]);
    if (v5) {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 1;
    }

    id v3 = v14;
    if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"Remove APS Counters"]);

      v13 = *(void **)(a1 + 40);
      if (v12)
      {
        [v13 removeAPSCounterData];
        uint64_t v8 = *(void *)(a1 + 72);
        goto LABEL_10;
      }

      [v13 addAPSCounterData:v14];
      uint64_t v9 = *(void *)(a1 + 72);
      goto LABEL_13;
    }
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"Remove APS Timeline"]);

  id v7 = *(void **)(a1 + 40);
  if (!v6)
  {
    [v7 addAPSTimelineData:v14];
    uint64_t v9 = *(void *)(a1 + 80);
    goto LABEL_13;
  }

  [v7 removeAPSTimelineData];
  uint64_t v8 = *(void *)(a1 + 80);
LABEL_10:
  *(void *)(*(void *)(v8 + 8) + 24LL) = 0LL;
LABEL_14:
}

void __GTMTLReplay_CLI_block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
    if (g_runningInCI)
    {
      v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"\tBatch ID Filtering Data %lu/%lu",  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL),  *(void *)(a1 + 40)));
      id v3 = (void *)objc_claimAutoreleasedReturnValue( [v2 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n#CI-INFO# "]);

      v4 = __stdoutp;
      id v5 = v3;
      fprintf(v4, "#CI-INFO# %s\n", (const char *)[v5 UTF8String]);
    }
  }

void __GTMTLReplay_CLI_block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v8 = v3;
    [*(id *)(a1 + 32) addGPUTimelineData:v3];
    id v3 = v8;
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
    if (g_runningInCI)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"\tTimeline Data %lu",  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL)));
      id v5 = (void *)objc_claimAutoreleasedReturnValue( [v4 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n#CI-INFO# "]);

      v6 = __stdoutp;
      id v7 = v5;
      fprintf(v6, "#CI-INFO# %s\n", (const char *)[v7 UTF8String]);

      id v3 = v8;
    }
  }
}

void __GTMTLReplay_CLI_block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v8 = v3;
    [*(id *)(a1 + 32) addShaderProfilerData:v3];
    id v3 = v8;
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
    if (g_runningInCI)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"\tShader Profiler Data %lu",  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL)));
      id v5 = (void *)objc_claimAutoreleasedReturnValue( [v4 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n#CI-INFO# "]);

      v6 = __stdoutp;
      id v7 = v5;
      fprintf(v6, "#CI-INFO# %s\n", (const char *)[v7 UTF8String]);

      id v3 = v8;
    }
  }
}

void __GTMTLReplay_CLI_block_invoke_6(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
    if (g_runningInCI)
    {
      v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"\tBatch ID Filtering Data %lu/%lu",  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL),  *(void *)(a1 + 40)));
      id v3 = (void *)objc_claimAutoreleasedReturnValue( [v2 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n#CI-INFO# "]);

      v4 = __stdoutp;
      id v5 = v3;
      fprintf(v4, "#CI-INFO# %s\n", (const char *)[v5 UTF8String]);
    }
  }

void __GTMTLReplay_CLI_block_invoke_7(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained processStreamingGRCData:v3];

  if (!v3)
  {
    [WeakRetained processStreamingGRCData:&off_5A0240];
    [WeakRetained waitForCompletion];
    [WeakRetained writeGPUTimelineSerializedData];
  }
}

@end