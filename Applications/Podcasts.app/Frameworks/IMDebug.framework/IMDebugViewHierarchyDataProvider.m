@interface IMDebugViewHierarchyDataProvider
- (id)debugData;
- (id)debugDataFileName;
@end

@implementation IMDebugViewHierarchyDataProvider

- (id)debugDataFileName
{
  return @"ViewHierarchy.txt";
}

- (id)debugData
{
  uint64_t v5 = 0LL;
  v6 = &v5;
  uint64_t v7 = 0x3032000000LL;
  v8 = __Block_byref_object_copy_;
  v9 = __Block_byref_object_dispose_;
  v10 = &stru_C750;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __45__IMDebugViewHierarchyDataProvider_debugData__block_invoke;
  block[3] = &unk_C568;
  block[4] = &v5;
  dispatch_sync(&_dispatch_main_q, block);
  v2 = (void *)objc_claimAutoreleasedReturnValue([(id)v6[5] dataUsingEncoding:4]);
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __45__IMDebugViewHierarchyDataProvider_debugData__block_invoke(uint64_t a1)
{
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(+[DebugUtil allViewControllers](&OBJC_CLASS___DebugUtil, "allViewControllers"));
  id v2 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v23;
    do
    {
      for (i = 0LL; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v23 != v4) {
          objc_enumerationMutation(obj);
        }
        v6 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
        uint64_t v7 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
        v8 = (objc_class *)objc_opt_class(v6);
        v9 = NSStringFromClass(v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"\n\nView Hierarchy for: %@\n",  v10));
        uint64_t v12 = objc_claimAutoreleasedReturnValue([v7 stringByAppendingString:v11]);
        uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 8LL);
        v14 = *(void **)(v13 + 40);
        *(void *)(v13 + 40) = v12;

        v15 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
        v16 = (void *)objc_claimAutoreleasedReturnValue([v6 view]);
        v17 = (void *)objc_claimAutoreleasedReturnValue([v16 recursiveDescription]);
        uint64_t v18 = objc_claimAutoreleasedReturnValue([v15 stringByAppendingString:v17]);
        uint64_t v19 = *(void *)(*(void *)(a1 + 32) + 8LL);
        v20 = *(void **)(v19 + 40);
        *(void *)(v19 + 40) = v18;
      }

      id v3 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }

    while (v3);
  }
}

@end