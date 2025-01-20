@interface IMDebugViewControllerHierarchyDataProvider
- (id)debugData;
- (id)debugDataFileName;
@end

@implementation IMDebugViewControllerHierarchyDataProvider

- (id)debugDataFileName
{
  return @"ViewControllerHierarchy.txt";
}

- (id)debugData
{
  uint64_t v5 = 0LL;
  v6 = &v5;
  uint64_t v7 = 0x3032000000LL;
  v8 = __Block_byref_object_copy__1;
  v9 = __Block_byref_object_dispose__1;
  v10 = &stru_C750;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __55__IMDebugViewControllerHierarchyDataProvider_debugData__block_invoke;
  block[3] = &unk_C568;
  block[4] = &v5;
  dispatch_sync(&_dispatch_main_q, block);
  v2 = (void *)objc_claimAutoreleasedReturnValue([(id)v6[5] dataUsingEncoding:4]);
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __55__IMDebugViewControllerHierarchyDataProvider_debugData__block_invoke(uint64_t a1)
{
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[DebugUtil allViewControllers](&OBJC_CLASS___DebugUtil, "allViewControllers", 0LL));
  id v3 = [v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v17;
    do
    {
      v6 = 0LL;
      do
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)v6);
        uint64_t v8 = objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) stringByAppendingString:@"\n\n"]);
        uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8LL);
        v10 = *(void **)(v9 + 40);
        *(void *)(v9 + 40) = v8;

        v11 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
        v12 = (void *)objc_claimAutoreleasedReturnValue([v7 recursiveDescription]);
        uint64_t v13 = objc_claimAutoreleasedReturnValue([v11 stringByAppendingString:v12]);
        uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 8LL);
        v15 = *(void **)(v14 + 40);
        *(void *)(v14 + 40) = v13;

        v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v4);
  }
}

@end