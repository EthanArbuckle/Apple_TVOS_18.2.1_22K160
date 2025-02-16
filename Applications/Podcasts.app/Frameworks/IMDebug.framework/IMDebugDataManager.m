@interface IMDebugDataManager
+ (id)writeDebugData;
+ (id)writeDebugDataWithProgress:(id)a3;
+ (void)initialize;
+ (void)registerAsyncDataProvider:(id)a3;
+ (void)registerDataProvider:(id)a3;
+ (void)writeDebugData:(id)a3;
+ (void)writeDebugData:(id)a3 completion:(id)a4;
@end

@implementation IMDebugDataManager

+ (void)initialize
{
  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___IMDebugDataManager;
  objc_msgSendSuper2(&v12, "initialize");
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v4 = (void *)dataProviders;
  dataProviders = (uint64_t)v3;

  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v6 = (void *)asyncDataProviders;
  asyncDataProviders = (uint64_t)v5;

  v7 = objc_alloc_init(&OBJC_CLASS___IMDebugViewHierarchyDataProvider);
  [a1 registerDataProvider:v7];

  v8 = objc_alloc_init(&OBJC_CLASS___IMDebugViewControllerHierarchyDataProvider);
  [a1 registerDataProvider:v8];

  v9 = objc_alloc_init(&OBJC_CLASS___IMDebugScreenShotDataProvider);
  [a1 registerDataProvider:v9];

  v10 = objc_alloc_init(&OBJC_CLASS___IMDebugUserDefaultsDataProvider);
  [a1 registerDataProvider:v10];

  v11 = objc_alloc_init(&OBJC_CLASS___IMDebugDownloadReportDataProvider);
  [a1 registerAsyncDataProvider:v11];
}

+ (void)registerDataProvider:(id)a3
{
  if (a3) {
    objc_msgSend((id)dataProviders, "addObject:");
  }
}

+ (void)registerAsyncDataProvider:(id)a3
{
}

+ (void)writeDebugData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __48__IMDebugDataManager_writeDebugData_completion___block_invoke;
  block[3] = &unk_C5E0;
  id v14 = v7;
  id v15 = a1;
  id v13 = v6;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

void __48__IMDebugDataManager_writeDebugData_completion___block_invoke(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) writeDebugDataWithProgress:*(void *)(a1 + 32)]);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = __48__IMDebugDataManager_writeDebugData_completion___block_invoke_2;
  v5[3] = &unk_C5B8;
  id v3 = *(id *)(a1 + 40);
  id v6 = v2;
  id v7 = v3;
  id v4 = v2;
  dispatch_async(&_dispatch_main_q, v5);
}

uint64_t __48__IMDebugDataManager_writeDebugData_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

+ (void)writeDebugData:(id)a3
{
}

+ (id)writeDebugData
{
  return [a1 writeDebugDataWithProgress:0];
}

+ (id)writeDebugDataWithProgress:(id)a3
{
  id v53 = a3;
  v60 = (void *)objc_claimAutoreleasedReturnValue(+[DebugUtil applicationDocumentsDirectory](&OBJC_CLASS___DebugUtil, "applicationDocumentsDirectory"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v62 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForInfoDictionaryKey:@"CFBundleDisplayName"]);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  v58 = (void *)objc_claimAutoreleasedReturnValue([v4 description]);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](&OBJC_CLASS___UIDevice, "currentDevice"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 name]);
  v57 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@ %@",  v62,  v58,  v6));

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v60 URLByAppendingPathComponent:v57]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 URLByAppendingPathExtension:@"zip"]);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( [v9 contentsOfDirectoryAtURL:v60 includingPropertiesForKeys:0 options:0 error:0]);

  __int128 v90 = 0u;
  __int128 v91 = 0u;
  __int128 v88 = 0u;
  __int128 v89 = 0u;
  id obj = v10;
  id v11 = [obj countByEnumeratingWithState:&v88 objects:v94 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v89;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v89 != v12) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v88 + 1) + 8LL * (void)i);
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 pathExtension]);
        v16 = (void *)objc_claimAutoreleasedReturnValue([v8 pathExtension]);
        unsigned int v17 = [v15 isEqualToString:v16];

        if (v17)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue([v14 pathComponents]);
          v19 = (void *)objc_claimAutoreleasedReturnValue([v18 lastObject]);
          v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet whitespaceCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "whitespaceCharacterSet"));
          v21 = (void *)objc_claimAutoreleasedReturnValue([v19 componentsSeparatedByCharactersInSet:v20]);

          v22 = (void *)objc_claimAutoreleasedReturnValue([v21 firstObject]);
          LODWORD(v19) = [v22 isEqualToString:v62];

          if ((_DWORD)v19)
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
            [v23 removeItemAtURL:v14 error:0];
          }
        }
      }

      id v11 = [obj countByEnumeratingWithState:&v88 objects:v94 count:16];
    }

    while (v11);
  }

  id v24 = objc_claimAutoreleasedReturnValue([v8 path]);
  v59 = zipOpen((uint64_t)[v24 cStringUsingEncoding:4], 0);

  if (!v59) {
    NSLog(@"Can't open '%@'", v8);
  }
  v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
  v61 = (void *)objc_claimAutoreleasedReturnValue([v55 components:252 fromDate:v56]);
  unsigned int v52 = [v61 second];
  unsigned int v25 = [v61 minute];
  unsigned int v26 = [v61 hour];
  unsigned int v27 = [v61 day];
  unsigned int v28 = [v61 month];
  unsigned int v29 = [v61 year];
  dispatch_group_t v30 = dispatch_group_create();
  v31 = (char *)[(id)dataProviders count];
  id v32 = [(id)asyncDataProviders count];
  unsigned int v33 = v28 - 1;
  v34 = &v31[(void)v32];
  v87[0] = 0LL;
  v87[1] = v87;
  v87[2] = 0x2020000000LL;
  v87[3] = 0LL;
  v72[0] = _NSConcreteStackBlock;
  v72[1] = 3221225472LL;
  v72[2] = __49__IMDebugDataManager_writeDebugDataWithProgress___block_invoke;
  v72[3] = &unk_C630;
  v76 = v59;
  unsigned int v77 = v52;
  unsigned int v78 = v25;
  unsigned int v79 = v26;
  unsigned int v80 = v27;
  unsigned int v81 = v33;
  unsigned int v82 = v29;
  uint64_t v84 = 0LL;
  uint64_t v85 = 0LL;
  uint64_t v83 = 0LL;
  id v54 = v53;
  id v74 = v54;
  v75 = v87;
  v86 = v34;
  v35 = v30;
  v73 = v35;
  v36 = objc_retainBlock(v72);
  __int128 v70 = 0u;
  __int128 v71 = 0u;
  __int128 v68 = 0u;
  __int128 v69 = 0u;
  id v37 = (id)dataProviders;
  id v38 = [v37 countByEnumeratingWithState:&v68 objects:v93 count:16];
  if (v38)
  {
    uint64_t v39 = *(void *)v69;
    do
    {
      for (j = 0LL; j != v38; j = (char *)j + 1)
      {
        if (*(void *)v69 != v39) {
          objc_enumerationMutation(v37);
        }
        v41 = *(void **)(*((void *)&v68 + 1) + 8LL * (void)j);
        dispatch_group_enter(v35);
        v42 = (void *)objc_claimAutoreleasedReturnValue([v41 debugData]);
        v43 = (void *)objc_claimAutoreleasedReturnValue([v41 debugDataFileName]);
        ((void (*)(void *, void *, void *))v36[2])(v36, v42, v43);
      }

      id v38 = [v37 countByEnumeratingWithState:&v68 objects:v93 count:16];
    }

    while (v38);
  }

  __int128 v66 = 0u;
  __int128 v67 = 0u;
  __int128 v64 = 0u;
  __int128 v65 = 0u;
  id v44 = (id)asyncDataProviders;
  id v45 = [v44 countByEnumeratingWithState:&v64 objects:v92 count:16];
  if (v45)
  {
    uint64_t v46 = *(void *)v65;
    do
    {
      for (k = 0LL; k != v45; k = (char *)k + 1)
      {
        if (*(void *)v65 != v46) {
          objc_enumerationMutation(v44);
        }
        v48 = *(void **)(*((void *)&v64 + 1) + 8LL * (void)k);
        dispatch_group_enter(v35);
        [v48 createDebugDataWithCompletion:v36];
      }

      id v45 = [v44 countByEnumeratingWithState:&v64 objects:v92 count:16];
    }

    while (v45);
  }

  dispatch_time_t v49 = dispatch_time(0LL, 30000000000LL);
  dispatch_group_wait(v35, v49);
  if (zipClose((uint64_t)v59, 0LL))
  {
    NSLog(@"Error closing '%@'", v8);
    id v50 = 0LL;
  }

  else
  {
    id v50 = v8;
  }

  _Block_object_dispose(v87, 8);
  return v50;
}

void __49__IMDebugDataManager_writeDebugDataWithProgress___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 56);
  id v7 = v5;
  id v8 = a2;
  if (zipOpenNewFileInZip3( v6,  (const char *)[v7 cStringUsingEncoding:4],  a1 + 64,  0,  0,  0,  0,  0,  8,  8,  0xFFFFFFF100000000,  8,  0,  0,  0)) {
    NSLog(@"Could not append file %@ to zip archive", v7);
  }
  uint64_t v9 = *(void *)(a1 + 56);
  id v10 = v8;
  id v11 = (const Bytef *)[v10 bytes];
  uInt v12 = [v10 length];

  if ((zipWriteInFileInZip(v9, v11, v12) & 0x80000000) != 0) {
    NSLog(@"Error writing data for %@ to zip archive", v7);
  }
  if (*(void *)(a1 + 40))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = __49__IMDebugDataManager_writeDebugDataWithProgress___block_invoke_2;
    block[3] = &unk_C608;
    id v13 = *(id *)(a1 + 40);
    uint64_t v14 = *(void *)(a1 + 48);
    id v16 = v13;
    uint64_t v17 = v14;
    uint64_t v18 = *(void *)(a1 + 112);
    dispatch_async(&_dispatch_main_q, block);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __49__IMDebugDataManager_writeDebugDataWithProgress___block_invoke_2(void *a1)
{
  uint64_t v1 = a1[4];
  uint64_t v2 = *(void *)(a1[5] + 8LL);
  uint64_t v3 = *(void *)(v2 + 24) + 1LL;
  *(void *)(v2 + 24) = v3;
  return (*(uint64_t (**)(uint64_t, double))(v1 + 16))( v1,  (double)(unint64_t)v3 / (double)(unint64_t)a1[6]);
}

@end