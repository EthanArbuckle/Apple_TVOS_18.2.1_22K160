int main(int argc, const char **argv, const char **envp)
{
  SBRendererServiceConnection *v3;
  PBUIRenderService *v4;
  SBSnapshotServer *v5;
  SBImageAnalysisServer *v6;
  SBRendererServiceConnection *v7;
  void *v8;
  void *v9;
  v3 = objc_alloc(&OBJC_CLASS___SBRendererServiceConnection);
  v4 = objc_alloc_init(&OBJC_CLASS___PBUIRenderService);
  v5 = objc_opt_new(&OBJC_CLASS___SBSnapshotServer);
  v6 = objc_opt_new(&OBJC_CLASS___SBImageAnalysisServer);
  v7 = -[SBRendererServiceConnection initWithRenderService:snapshotServer:analysisServer:]( v3,  "initWithRenderService:snapshotServer:analysisServer:",  v4,  v5,  v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCListener serviceListener](&OBJC_CLASS___NSXPCListener, "serviceListener"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SBRendererServiceConnection activateWithListener:](v7, "activateWithListener:", v8));

  return 0;
}

id SBRSLogCommon()
{
  if (qword_100012040 != -1) {
    dispatch_once(&qword_100012040, &stru_10000C3B8);
  }
  return (id)qword_100012038;
}

void sub_100004AD4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.SBRendererService", "Common");
  v2 = (void *)qword_100012038;
  qword_100012038 = (uint64_t)v1;
}

id SBRSLogXPC()
{
  if (qword_100012050 != -1) {
    dispatch_once(&qword_100012050, &stru_10000C3D8);
  }
  return (id)qword_100012048;
}

void sub_100004B44(id a1)
{
  os_log_t v1 = os_log_create("com.apple.SBRendererService", "XPC");
  v2 = (void *)qword_100012048;
  qword_100012048 = (uint64_t)v1;
}

id SBRSLogSnapshotting()
{
  if (qword_100012060 != -1) {
    dispatch_once(&qword_100012060, &stru_10000C3F8);
  }
  return (id)qword_100012058;
}

void sub_100004BB4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.SBRendererService", "Snapshotting");
  v2 = (void *)qword_100012058;
  qword_100012058 = (uint64_t)v1;
}

id SBRSLogImageAnalysis()
{
  if (qword_100012070 != -1) {
    dispatch_once(&qword_100012070, &stru_10000C418);
  }
  return (id)qword_100012068;
}

void sub_100004C24(id a1)
{
  os_log_t v1 = os_log_create("com.apple.SBRendererService", "ImageAnalysis");
  v2 = (void *)qword_100012068;
  qword_100012068 = (uint64_t)v1;
}

void sub_100004DF0(_Unwind_Exception *a1)
{
}

void sub_100004E08(uint64_t a1)
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "operations", 0));
  id v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v12;
    while (2)
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
        v8 = (void *)objc_claimAutoreleasedReturnValue([v7 request]);
        v9 = (void *)objc_claimAutoreleasedReturnValue([v8 requestIdentifier]);
        unsigned int v10 = [v9 isEqual:*(void *)(a1 + 40)];

        if (v10)
        {
          [v7 cancel];
          goto LABEL_11;
        }
      }

      id v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

LABEL_11:
}

void sub_100005124( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_100005164(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained cancelRequest:*(void *)(a1 + 32)];
}

void sub_1000053D4(_Unwind_Exception *a1)
{
}

void sub_100005430( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1000054D8(uint64_t a1)
{
  __int128 v6 = 0u;
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  os_log_t v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "operations", 0));
  id v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0LL;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        [*(id *)(*((void *)&v6 + 1) + 8 * (void)v5) cancel];
        uint64_t v5 = (char *)v5 + 1;
      }

      while (v3 != v5);
      id v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }

    while (v3);
  }
}

void sub_1000057E4(_Unwind_Exception *a1)
{
}

void sub_100005940(_Unwind_Exception *a1)
{
}

void sub_10000596C(uint64_t a1)
{
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v4 = os_transaction_create([*(id *)(a1 + 32) UTF8String]);
    uint64_t v5 = (void *)*((void *)WeakRetained + 3);
    *((void *)WeakRetained + 3) = v4;

    __int128 v6 = (void *)objc_claimAutoreleasedReturnValue([*((id *)WeakRetained + 9) requestedAnalyses]);
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v15;
      uint64_t v10 = PRUISAnalysisDetermineProminentColor;
      do
      {
        __int128 v11 = 0LL;
        do
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          if ([*(id *)(*((void *)&v14 + 1) + 8 * (void)v11) isEqual:v10])
          {
            id v12 = objc_loadWeakRetained(v2);
            [v12 _determineProminentColor];
          }

          __int128 v11 = (char *)v11 + 1;
        }

        while (v8 != v11);
        id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }

      while (v8);
    }

    [WeakRetained _fireCompletionWithError:0];
    __int128 v13 = (void *)*((void *)WeakRetained + 3);
    *((void *)WeakRetained + 3) = 0LL;
  }
}

void sub_100005AF0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _fireCompletionWithError:0];
}

void sub_100005B6C(_Unwind_Exception *a1)
{
}

void sub_100005E84(_Unwind_Exception *a1)
{
}

void sub_100005EA8(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([v4 isEqualToString:PRUISAnalysisDetermineProminentColor])
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 40LL);
    if (v3) {
      [*(id *)(a1 + 40) setObject:v3 forKeyedSubscript:v4];
    }
  }
}
}

void sub_100006014(_Unwind_Exception *a1)
{
}

void sub_100006038(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v9 = (id *)WeakRetained;
    objc_sync_enter(v9);
    if (v6) {
      [v9 _fireCompletionWithError:v6];
    }
    else {
      objc_storeStrong(v9 + 5, a2);
    }
    objc_sync_exit(v9);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_1000060E8(_Unwind_Exception *a1)
{
}

CFStringRef SBSnapshotServiceErrorCodeToDebugDescription(uint64_t a1)
{
  else {
    return off_10000C530[a1 - 1];
  }
}

id sub_1000067AC(uint64_t a1)
{
  return [*(id *)(a1 + 40) invalidate];
}

void sub_100006B4C(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
}

void sub_100006C84(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
}

void sub_100006DE8(uint64_t a1)
{
  id v1 = SBRSLogXPC();
  uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_1000082E4();
  }
}

void sub_10000703C( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_100007050( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

  ;
}

  ;
}

void RegisterForTemporaryFolder()
{
  v0 = NSTemporaryDirectory();
  id v1 = (void *)objc_claimAutoreleasedReturnValue(v0);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v29 = 0LL;
  unsigned int v3 = [v2 removeItemAtPath:v1 error:&v29];
  id v4 = v29;

  id v5 = SBRSLogSnapshotting();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v31 = v1;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Successfully cleared temporary directory (%{public}@) contents on startup.",  buf,  0xCu);
    }
  }

  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    sub_1000085F0((uint64_t)v4, v7, v8, v9, v10, v11, v12, v13);
  }

  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v15 = PFPosterPathFileAttributes();
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  id v28 = v4;
  unsigned int v17 = [v14 createDirectoryAtPath:v1 withIntermediateDirectories:1 attributes:v16 error:&v28];
  id v18 = v28;

  id v19 = SBRSLogSnapshotting();
  v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  v21 = v20;
  if (v17)
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v31 = v1;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Successfully created temporary directory (%{public}@) contents on startup.",  buf,  0xCu);
    }
  }

  else if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    sub_10000858C((uint64_t)v18, v21, v22, v23, v24, v25, v26, v27);
  }
}

void sub_1000076E0(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = SBRSLogSnapshotting();
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  uint64_t v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_100008780(a1, v10);
    }

    uint64_t v11 = *(void *)(a1 + 48);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v6 snapshotBundle]);
    uint64_t v13 = objc_claimAutoreleasedReturnValue( +[PRUISSnapshotServiceResponse snapshotResponseForRequest:snapshotBundle:]( &OBJC_CLASS___PRUISSnapshotServiceResponse,  "snapshotResponseForRequest:snapshotBundle:",  v11,  v12));
  }

  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000086B8((uint64_t)v7, a1, v10);
    }

    uint64_t v15 = *(void *)(a1 + 48);
    if (v7)
    {
      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue( +[PRUISSnapshotServiceResponse errorResponseForRequest:error:]( &OBJC_CLASS___PRUISSnapshotServiceResponse,  "errorResponseForRequest:error:",  *(void *)(a1 + 48),  v7));
      goto LABEL_10;
    }

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError sbSnapshotService_errorWithCode:]( &OBJC_CLASS___NSError,  "sbSnapshotService_errorWithCode:",  0LL));
    uint64_t v13 = objc_claimAutoreleasedReturnValue( +[PRUISSnapshotServiceResponse errorResponseForRequest:error:]( &OBJC_CLASS___PRUISSnapshotServiceResponse,  "errorResponseForRequest:error:",  v15,  v12));
  }

  __int128 v14 = (void *)v13;

LABEL_10:
  (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
}

void sub_100007C60( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_100007C84(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100007C94(uint64_t a1)
{
}

void sub_100007C9C(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a4);
  id v10 = a4;
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
  id v9 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100007F3C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_100007F78(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = (id *)(a1 + 40);
  id v7 = a4;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained(v6);
  [WeakRetained _posterCollectionUpdatedForRole:*(void *)(a1 + 32) previousCollection:v8 updatedCollection:v7];
}

void sub_100008018(id a1, NSString *a2, PRSWallpaperObserver *a3, BOOL *a4)
{
}

void sub_10000814C( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_100008170(const char *a1, uint64_t a2, uint64_t a3)
{
  id v5 = NSStringFromSelector(a1);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v8 = (objc_class *)objc_opt_class(a2, v7);
  id v9 = NSStringFromClass(v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  int v11 = 138544642;
  uint64_t v12 = v6;
  __int16 v13 = 2114;
  __int128 v14 = v10;
  __int16 v15 = 2048;
  uint64_t v16 = a2;
  __int16 v17 = 2114;
  id v18 = @"SBRendererServiceConnection.m";
  __int16 v19 = 1024;
  int v20 = 39;
  __int16 v21 = 2114;
  uint64_t v22 = a3;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  (uint8_t *)&v11,  0x3Au);
}

void sub_10000826C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000082E4()
{
}

void sub_100008384()
{
}

void sub_100008414()
{
}

void sub_100008488()
{
}

void sub_100008518()
{
}

void sub_10000858C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000085F0( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100008654( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000086B8(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v5 = *(void *)(a2 + 32);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a2 + 40) path]);
  int v7 = 136446978;
  id v8 = "-[SBSnapshotServer executeSnapshotRequest:reply:]_block_invoke";
  __int16 v9 = 2114;
  uint64_t v10 = a1;
  __int16 v11 = 2114;
  uint64_t v12 = v5;
  __int16 v13 = 2114;
  __int128 v14 = v6;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "%{public}s FAILED with error: %{public}@ uniqueIdentifier: %{public}@ path: %{public}@",  (uint8_t *)&v7,  0x2Au);
}

void sub_100008780(uint64_t a1, os_log_s *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) path]);
  int v5 = 136446722;
  id v6 = "-[SBSnapshotServer executeSnapshotRequest:reply:]_block_invoke";
  __int16 v7 = 2114;
  uint64_t v8 = v3;
  __int16 v9 = 2114;
  uint64_t v10 = v4;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "%{public}s COMPLETE for uniqueIdentifier: %{public}@ path: %{public}@",  (uint8_t *)&v5,  0x20u);
}

void sub_10000883C()
{
  v1[0] = 136446466;
  sub_10000815C();
  _os_log_error_impl( (void *)&_mh_execute_header,  v0,  OS_LOG_TYPE_ERROR,  "%{public}s failed with error: %{public}@",  (uint8_t *)v1,  0x16u);
  sub_100007090();
}

void sub_1000088B4(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 path]);
  v4[0] = 136446466;
  sub_10000815C();
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "%{public}s complete for path: %{public}@",  (uint8_t *)v4,  0x16u);
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return [a1 uniqueIdentifier];
}