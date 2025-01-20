@interface CacheDeleteAppInFocus
+ (void)subscribeToAppInFocusStreamBeginning:(id)a3 callback:(id)a4;
@end

@implementation CacheDeleteAppInFocus

+ (void)subscribeToAppInFocusStreamBeginning:(id)a3 callback:(id)a4
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id v6 = a4;
  if (!qword_18C4C42D0)
  {
    __int128 v27 = xmmword_18A0667E0;
    v28 = 0LL;
    qword_18C4C42D0 = _sl_dlopen();
  }

  if (qword_18C4C42D0)
  {
    if (qword_18C4C42B8 != -1) {
      dispatch_once(&qword_18C4C42B8, &__block_literal_global_10);
    }
    uint64_t v23 = 0LL;
    v24 = &v23;
    uint64_t v25 = 0x2020000000LL;
    v7 = (void (*)(void))off_18C4C42E0;
    v26 = off_18C4C42E0;
    uint64_t v8 = MEMORY[0x1895F87A8];
    if (!off_18C4C42E0)
    {
      *(void *)&__int128 v27 = MEMORY[0x1895F87A8];
      *((void *)&v27 + 1) = 3221225472LL;
      v28 = __getBiomeLibrarySymbolLoc_block_invoke;
      v29 = &unk_18A066800;
      v30 = &v23;
      __getBiomeLibrarySymbolLoc_block_invoke((uint64_t)&v27);
      v7 = (void (*)(void))v24[3];
    }

    _Block_object_dispose(&v23, 8);
    if (!v7)
    {
      dlerror();
      abort_report_np();
      __break(1u);
    }

    v7();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 App];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 InFocus];
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x1895A73EC]();
    v13 = (void *)objc_opt_new();
    id v14 = objc_alloc((Class)_MergedGlobals_8);
    [MEMORY[0x189603F50] date];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)[v14 initWithStartDate:v15 endDate:v5 maxEvents:0 lastN:0 reversed:1];

    [v11 publisherWithOptions:v16];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v8;
    v20[1] = 3221225472LL;
    v20[2] = __71__CacheDeleteAppInFocus_subscribeToAppInFocusStreamBeginning_callback___block_invoke_3;
    v20[3] = &unk_18A0667A0;
    id v21 = v13;
    id v22 = v6;
    id v18 = v13;
    id v19 = (id)[v17 sinkWithCompletion:&__block_literal_global_34 receiveInput:v20];

    objc_autoreleasePoolPop(v12);
  }
}

void __71__CacheDeleteAppInFocus_subscribeToAppInFocusStreamBeginning_callback___block_invoke()
{
  uint64_t v3 = 0LL;
  v4 = &v3;
  uint64_t v5 = 0x2050000000LL;
  v0 = (void *)qword_18C4C42D8;
  uint64_t v6 = qword_18C4C42D8;
  if (!qword_18C4C42D8)
  {
    v2[0] = MEMORY[0x1895F87A8];
    v2[1] = 3221225472LL;
    v2[2] = __getBMPublisherOptionsClass_block_invoke;
    v2[3] = &unk_18A066800;
    v2[4] = &v3;
    __getBMPublisherOptionsClass_block_invoke((uint64_t)v2);
    v0 = (void *)v4[3];
  }

  id v1 = v0;
  _Block_object_dispose(&v3, 8);
  _MergedGlobals_8 = (uint64_t)v1;
}

void __71__CacheDeleteAppInFocus_subscribeToAppInFocusStreamBeginning_callback___block_invoke_2( uint64_t a1,  void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 state];
  [v2 error];
  id v4 = (id)objc_claimAutoreleasedReturnValue();

  NSLog(@"subscribeToAppInFocusStreamBeginning completion: %ld %@", v3, v4);
}

void __71__CacheDeleteAppInFocus_subscribeToAppInFocusStreamBeginning_callback___block_invoke_3( uint64_t a1,  void *a2)
{
  id v21 = a2;
  [v21 eventBody];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 bundleID];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    uint64_t v5 = *(void **)(a1 + 32);
    [v21 eventBody];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 bundleID];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v5) = [v5 containsObject:v7];

    if ((v5 & 1) == 0)
    {
      if (*(void *)(a1 + 40))
      {
        [v21 eventBody];
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
        char v9 = [v8 starting];

        if ((v9 & 1) == 0)
        {
          v10 = *(void **)(a1 + 32);
          [v21 eventBody];
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          [v11 bundleID];
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          [v10 addObject:v12];

          (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
        }
      }

      else
      {
        v13 = (void *)MEMORY[0x189603F50];
        [v21 timestamp];
        objc_msgSend(v13, "dateWithTimeIntervalSinceReferenceDate:");
        id v14 = (void *)objc_claimAutoreleasedReturnValue();
        [v21 eventBody];
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        else {
          v16 = " Leaving";
        }
        [v21 eventBody];
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        [v17 bundleID];
        id v18 = (void *)objc_claimAutoreleasedReturnValue();
        [v21 eventBody];
        id v19 = (void *)objc_claimAutoreleasedReturnValue();
        [v19 launchReason];
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        NSLog(@"%d subscribeToAppInFocusStreamBeginning event: %@ %s %@ %@", 153LL, v14, v16, v18, v20);
      }
    }
  }
}

@end