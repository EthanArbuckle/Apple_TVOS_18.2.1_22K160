@interface DefaultCollectionActions
- (BOOL)shouldRatelimit:(id)a3 rule:(id)a4;
- (void)autoBugCaptureWithType:(id)a3 subType:(id)a4 domain:(id)a5;
- (void)tapToRadar:(id)a3 description:(id)a4 radar:(id)a5 componentName:(id)a6 componentVersion:(id)a7 componentID:(id)a8 attributes:(id)a9;
@end

@implementation DefaultCollectionActions

- (BOOL)shouldRatelimit:(id)a3 rule:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v6 lastMatch];
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7) {
    goto LABEL_5;
  }
  [v6 rule];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 repeatAfterSeconds];

  uint64_t v10 = 86400LL;
  if (v9) {
    uint64_t v10 = v9;
  }
  [MEMORY[0x189603F50] dateWithTimeIntervalSinceNow:(double)-v10];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 lastMatch];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = [v11 compare:v12];

  if (v13 != 1)
  {
    BOOL v17 = 1;
  }

  else
  {
LABEL_5:
    [MEMORY[0x189603F50] date];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setLastMatch:v14];

    [v6 lastMatch];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 lastMatchTimeKey];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 setDateProperty:v15 forKey:v16];

    BOOL v17 = 0;
  }

  return v17;
}

- (void)autoBugCaptureWithType:(id)a3 subType:(id)a4 domain:(id)a5
{
}

- (void)tapToRadar:(id)a3 description:(id)a4 radar:(id)a5 componentName:(id)a6 componentVersion:(id)a7 componentID:(id)a8 attributes:(id)a9
{
  id v23 = a6;
  id v14 = a7;
  id v15 = a8;
  id v16 = a9;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  id v20 = -[SecTapToRadar initTapToRadar:description:radar:]( objc_alloc(&OBJC_CLASS___SecTapToRadar),  "initTapToRadar:description:radar:",  v19,  v18,  v17);

  if (v23 && v14 && v15)
  {
    [v20 setComponentName:v23];
    [v20 setComponentVersion:v14];
    [v20 setComponentID:v15];
  }

  if (v16 && [MEMORY[0x1896078D8] isValidJSONObject:v16])
  {
    [MEMORY[0x1896078D8] dataWithJSONObject:v16 options:3 error:0];
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      v22 = (void *)[objc_alloc(NSString) initWithData:v21 encoding:4];
      [v20 setReason:v22];
    }
  }

  [v20 trigger];
}

@end