@interface PerfDiagsSelfEnablementController
+ (BOOL)isAnyModeActive;
@end

@implementation PerfDiagsSelfEnablementController

+ (BOOL)isAnyModeActive
{
  v17[0] = @"PDSEHangTracer";
  v17[1] = @"PDSEHTThirdParty";
  v17[2] = @"PDSESentry";
  v17[3] = @"PDSEAppLaunch";
  v17[4] = @"PDSEWorkflowResponsiveness";
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v17, 5LL));
  id v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    id v4 = v3;
    char v5 = 0;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v2);
        }
        v8 = sub_100027AD0(@"com.apple.da", @"mobile", *(void *)(*((void *)&v12 + 1) + 8LL * (void)i));
        v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
        id v10 = objc_msgSend(v9, "count", (void)v12);

        v5 |= v10 != 0LL;
      }

      id v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v4);
  }

  else
  {
    char v5 = 0;
  }

  return v5 & 1;
}

@end