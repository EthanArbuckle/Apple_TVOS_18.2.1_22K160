void sub_100004CAC(_Unwind_Exception *a1)
{
  void *v1;
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000504C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_100005074(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100005084(uint64_t a1)
{
}

void sub_10000508C(uint64_t a1)
{
  id v2 = MTMetricsKitOSLog();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "MetricsKit: AMPIDService XPC connection invalidated",  buf,  2u);
  }

  dispatch_time_t v4 = dispatch_time(0LL, 30000000000LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000514C;
  block[3] = &unk_1000204A0;
  block[4] = *(void *)(a1 + 32);
  dispatch_after(v4, &_dispatch_main_q, block);
}

void sub_10000514C(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8LL);
  v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0LL;

  id v4 = objc_loadWeakRetained(&location);
  if (!v4)
  {
    id v5 = MTMetricsKitOSLog();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "MetricsKit: AMPIDService shared secret store released",  v7,  2u);
    }
  }

  objc_destroyWeak(&location);
}

void sub_1000051F8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

void sub_10000520C(id a1)
{
  id v1 = MTMetricsKitOSLog();
  uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_ERROR,  "MetricsKit: AMPIDService XPC connection from client interrupted!",  v3,  2u);
  }
}

void setupSandbox()
{
  v0 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___ServiceDelegate));
  id v1 = (void *)objc_claimAutoreleasedReturnValue(v0);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v1 bundleIdentifier]);

  id v3 = v2;
  if (_set_user_dir_suffix([v3 UTF8String]))
  {
    id v4 = NSTemporaryDirectory();
  }

  else
  {
    id v5 = MTMetricsKitOSLog();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = *__error();
      v8[0] = 67109120;
      v8[1] = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "MetricsKit: Failed to setup dir suffix for sandbox environment (error code: %d)",  (uint8_t *)v8,  8u);
    }
  }
}

int main(int argc, const char **argv, const char **envp)
{
  id v3 = MTMetricsKitOSLog();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "MetricsKit: AMPIDService XPC Service started",  v9,  2u);
  }

  setupSandbox();
  v6 = (void *)objc_opt_new(&OBJC_CLASS___ServiceDelegate, v5);
  int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCListener serviceListener](&OBJC_CLASS___NSXPCListener, "serviceListener"));
  [v7 setDelegate:v6];
  [v7 resume];

  return 0;
}

uint64_t sub_100005588(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_10000566C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_100005818(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100005AFC(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v9 = 0LL;
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 URLForDirectory:5 inDomain:1 appropriateForURL:0 create:1 error:&v9]);
  id v4 = v9;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) metricsKitBundleIdentifier]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v3 URLByAppendingPathComponent:v5]);

  uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 path]);
  v8 = (void *)qword_1000284A8;
  qword_1000284A8 = v7;
}

void sub_100005DA0(_Unwind_Exception *a1)
{
}
}

uint64_t sub_100006810(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

id MTMetricsKitOSLog()
{
  if (qword_1000284B8 != -1) {
    dispatch_once(&qword_1000284B8, &stru_1000205A8);
  }
  return (id)qword_1000284B0;
}

void sub_10000697C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.amp-ae-eng.MetricsKit", "general");
  uint64_t v2 = (void *)qword_1000284B0;
  qword_1000284B0 = (uint64_t)v1;
}

uint64_t MTSetExceptionsEnabled(uint64_t result)
{
  byte_1000284C0 = result;
  return result;
}

id MTError( uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (a2) {
    id v9 = &a9;
  }
  else {
    id v9 = 0LL;
  }
  v10 = sub_1000069F0(a1, a2, (uint64_t)v9);
  return (id)objc_claimAutoreleasedReturnValue(v10);
}

NSError *sub_1000069F0(uint64_t a1, void *a2, uint64_t a3)
{
  if (a2)
  {
    id v5 = a2;
    v6 = -[NSString initWithFormat:arguments:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:arguments:", v5, a3);
  }

  else
  {
    v6 = @"MetricsKit error";
  }

  uint64_t v7 = objc_alloc(&OBJC_CLASS___NSError);
  NSErrorUserInfoKey v11 = NSLocalizedDescriptionKey;
  v12 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v12,  &v11,  1LL));
  id v9 = -[NSError initWithDomain:code:userInfo:](v7, "initWithDomain:code:userInfo:", @"MTError", a1, v8);

  return v9;
}

id MTConfigurationError( uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (!a2)
  {
    v13 = sub_1000069F0(a1, 0LL, 0LL);
    return (id)objc_claimAutoreleasedReturnValue(v13);
  }

  id v9 = sub_1000069F0(a1, a2, (uint64_t)&a9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  NSErrorUserInfoKey v11 = v10;
  if (byte_1000284C0)
  {
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 localizedDescription]);
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"MTException",  @"%@",  v12,  &a9);
  }

  else
  {
    int v15 = atomic_load(&dword_1000284C4);
    if (v15 > 199) {
      return v11;
    }
    do
      unsigned int v16 = __ldxr(&dword_1000284C4);
    while (__stxr(v16 + 1, &dword_1000284C4));
    id v17 = MTMetricsKitOSLog();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v18 = [v11 code];
      v19 = (void *)objc_claimAutoreleasedReturnValue([v11 localizedDescription]);
      *(_DWORD *)buf = 134218242;
      id v21 = v18;
      __int16 v22 = 2112;
      v23 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "MetricsKit: Error occurred with code %ld: %@",  buf,  0x16u);
    }
  }

  return v11;
}

NSError *MTWrappedError(void *a1, uint64_t a2, void *a3)
{
  id v5 = a1;
  id v6 = [a3 mutableCopy];
  uint64_t v7 = v6;
  if (v5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:NSLocalizedDescriptionKey]);

    if (!v8)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 localizedDescription]);
      [v7 setObject:v9 forKeyedSubscript:NSLocalizedDescriptionKey];
    }

    [v7 setObject:v5 forKeyedSubscript:NSUnderlyingErrorKey];
  }

  v10 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"MTError",  a2,  v7);

  return v10;
}

id MTUndelegatedMethodError( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return MTConfigurationError( 101LL,  @"The method /%s/ must be overridden with a platform-specific delegate method. If you have no data for this field, have your delegate return nil.",  a3,  a4,  a5,  a6,  a7,  a8,  a1);
}

void sub_100006EB0(_Unwind_Exception *a1)
{
}

void sub_100006FB8(_Unwind_Exception *a1)
{
}

void sub_1000070C4(_Unwind_Exception *a1)
{
}

void sub_1000071DC(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[MTPromise _globalPromiseStorage](&OBJC_CLASS___MTPromise, "_globalPromiseStorage"));
  [v2 addObject:*(void *)(a1 + 32)];
}

id sub_100007568(uint64_t a1)
{
  return [*(id *)(a1 + 32) addErrorBlock:*(void *)(a1 + 40)];
}

id sub_100007574(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) callErrorBlock:*(void *)(a1 + 40) withPromiseResult:a2];
}

id sub_100007674(uint64_t a1)
{
  return [*(id *)(a1 + 32) addCompletionBlock:*(void *)(a1 + 40)];
}

id sub_100007680(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) callCompletionBlock:*(void *)(a1 + 40) withPromiseResult:a2];
}

id sub_100007780(uint64_t a1)
{
  return [*(id *)(a1 + 32) addSuccessBlock:*(void *)(a1 + 40)];
}

id sub_10000778C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) callSuccessBlock:*(void *)(a1 + 40) withPromiseResult:a2];
}

void sub_100007A88(_Unwind_Exception *a1)
{
}

void sub_100007AA4(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (v5)
  {
    uint64_t v7 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
  }

  else
  {
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[MTPromise promiseWithResult:](&OBJC_CLASS___MTPromise, "promiseWithResult:", v10));
  }

  id v9 = (void *)v8;
  [(id)objc_opt_class(WeakRetained) _finishPromise:*(void *)(a1 + 32) withPromise:v8];
}

void sub_100007C30(_Unwind_Exception *a1)
{
}

void sub_100007C4C(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (v10)
  {
    uint64_t v7 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
  }

  else
  {
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[MTPromise promiseWithError:](&OBJC_CLASS___MTPromise, "promiseWithError:", v5));
  }

  id v9 = (void *)v8;
  [(id)objc_opt_class(WeakRetained) _finishPromise:*(void *)(a1 + 32) withPromise:v8];
}

void sub_100008084( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_1000080A0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  os_log_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[MTPromise _globalPromiseStorage](&OBJC_CLASS___MTPromise, "_globalPromiseStorage"));
  [v1 removeObject:WeakRetained];
}

void sub_100008190( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_1000081AC(uint64_t a1, char a2, void *a3)
{
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = WeakRetained;
  if ((a2 & 1) != 0)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
    [v6 finishWithResult:v7 error:v8];
  }

  else
  {
    [WeakRetained finishWithResult:0 error:v8];
  }
}

void sub_1000082D4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_1000082F0(uint64_t a1, void *a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained finishWithResult:v6 error:v5];
}

void sub_1000083F4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_100008410(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (v5) {
    [WeakRetained finishWithError:v5];
  }
  else {
    [WeakRetained finishWithResult:&__kCFBooleanTrue];
  }
}

void sub_100008518( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_100008534(uint64_t a1, void *a2, void *a3)
{
  unint64_t v9 = a2;
  unint64_t v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v7 = WeakRetained;
  if (v9 | v5)
  {
    if (v9) {
      objc_msgSend(WeakRetained, "finishWithResult:");
    }
    else {
      [WeakRetained finishWithError:v5];
    }
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    [v7 finishWithResult:v8];
  }
}

void sub_100008824(_Unwind_Exception *a1)
{
}

void sub_100008844(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 56);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [*(id *)(a1 + 32) addObject:v4];

  unint64_t v5 = *(_BYTE **)(a1 + 64);
  else {
    [WeakRetained _configureAllPromise:*(void *)(a1 + 48) withResults:*(void *)(a1 + 32) promises:*(void *)(a1 + 40) currentPromiseIndex:*(void *)(a1 + 64) + 1];
  }
}

void sub_1000088E0(uint64_t a1, void *a2)
{
  id v5 = a2;
  for (unint64_t i = *(void *)(a1 + 48) + 1; i < (unint64_t)[*(id *)(a1 + 32) count]; ++i)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectAtIndexedSubscript:i]);
    [v4 cancel];
  }

  [*(id *)(a1 + 40) finishWithError:v5];
}

void sub_100008AB8(_Unwind_Exception *a1)
{
}

void sub_100008ADC(uint64_t a1, void *a2)
{
  id v5 = a2;
  for (unint64_t i = *(void *)(a1 + 48) + 1; i < (unint64_t)[*(id *)(a1 + 32) count]; ++i)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectAtIndexedSubscript:i]);
    [v4 cancel];
  }

  [*(id *)(a1 + 40) finishWithResult:v5];
}

void sub_100008B5C(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = *(_BYTE **)(a1 + 56);
  else {
    [WeakRetained _configureAnyPromise:*(void *)(a1 + 40) withPromises:*(void *)(a1 + 32) currentPromiseIndex:*(void *)(a1 + 56) + 1];
  }
}

id sub_100008D1C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithResult:a2];
}

id sub_100008D28(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithError:a2];
}

void sub_100008D74(id a1)
{
  os_log_t v1 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  uint64_t v2 = (void *)qword_1000284C8;
  qword_1000284C8 = (uint64_t)v1;
}

void sub_100008DDC(id a1)
{
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.MetricsKit.globalPromiseStorageAccessQueue", 0LL);
  uint64_t v2 = (void *)qword_1000284D8;
  qword_1000284D8 = (uint64_t)v1;
}

void sub_1000091EC(_Unwind_Exception *a1)
{
}

void sub_100009284( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_100009388( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1000093BC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v6)
  {
    uint64_t v11 = (id *)(a1 + 32);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained handleUserRecordID:v5];

    id v13 = objc_loadWeakRetained(v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 container]);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100009524;
    v15[3] = &unk_100020878;
    objc_copyWeak(&v16, v11);
    [v14 accountInfoWithCompletionHandler:v15];

    objc_destroyWeak(&v16);
    goto LABEL_8;
  }

  id v8 = (id)objc_claimAutoreleasedReturnValue([v6 domain]);
  id v9 = [v7 code];

  if (v9 == (id)9)
  {
    id v8 = objc_loadWeakRetained((id *)(a1 + 32));
    [v8 handleUserRecordID:0];
LABEL_5:
  }

  id v10 = objc_loadWeakRetained((id *)(a1 + 32));
  [v10 handleEngineStartedWithError:v7];

LABEL_8:
}

void sub_100009510(_Unwind_Exception *a1)
{
}

void sub_100009524(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v6)
  {
    id v8 = v6;
LABEL_8:
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained handleEngineStartedWithError:v8];

    goto LABEL_9;
  }

  if ([v5 accountStatus] == (id)1)
  {
    if (([v5 supportsDeviceToDeviceEncryption] & 1) == 0)
    {
      id v9 = objc_loadWeakRetained((id *)(a1 + 32));
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 container]);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 containerIdentifier]);
      id v18 = MTError( 702LL,  @"iCloud account for container %@ doesn't support device to device encryption",  v12,  v13,  v14,  v15,  v16,  v17,  (uint64_t)v11);
      id v8 = (id)objc_claimAutoreleasedReturnValue(v18);

      if (v8) {
        goto LABEL_8;
      }
    }
  }

  else
  {
    id v25 = [v5 accountStatus];
    id v32 = MTError( 701LL,  @"iCloud account is not available. Account status: %ld",  v26,  v27,  v28,  v29,  v30,  v31,  (uint64_t)v25);
    id v8 = (id)objc_claimAutoreleasedReturnValue(v32);
    if (v8) {
      goto LABEL_8;
    }
  }

  v19 = (id *)(a1 + 32);
  id v20 = objc_loadWeakRetained((id *)(a1 + 32));
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 zoneID]);

  id v22 = objc_loadWeakRetained(v19);
  v23 = (void *)objc_claimAutoreleasedReturnValue([v22 container]);
  v24 = (void *)objc_claimAutoreleasedReturnValue([v23 privateCloudDatabase]);
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_100009710;
  v34[3] = &unk_100020850;
  id v8 = v21;
  id v35 = v8;
  objc_copyWeak(&v36, v19);
  [v24 fetchRecordZoneWithID:v8 completionHandler:v34];

  objc_destroyWeak(&v36);
LABEL_9:
}

void sub_1000096FC(_Unwind_Exception *a1)
{
}

void sub_100009710(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 domain]);
  if (![v7 isEqual:CKErrorDomain])
  {

    goto LABEL_7;
  }

  id v8 = [v6 code];

  if (v8 != (id)26)
  {
LABEL_7:
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained handleEngineStartedWithError:v6];

    goto LABEL_8;
  }

  id v9 = MTMetricsKitOSLog();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v21 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "MetricsKit: Creating new zone with ID %@",  buf,  0xCu);
  }

  uint64_t v12 = -[CKRecordZone initWithZoneID:](objc_alloc(&OBJC_CLASS___CKRecordZone), "initWithZoneID:", *(void *)(a1 + 32));
  uint64_t v13 = (id *)(a1 + 40);
  id v14 = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 container]);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 privateCloudDatabase]);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100009904;
  v18[3] = &unk_100020828;
  objc_copyWeak(&v19, v13);
  [v16 saveRecordZone:v12 completionHandler:v18];

  objc_destroyWeak(&v19);
LABEL_8:
}

void sub_1000098E8(_Unwind_Exception *a1)
{
}

void sub_100009904(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = (id *)(a1 + 32);
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained handleEngineStartedWithError:v4];
}

void sub_100009AAC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v5;
  if (v6)
  {
    id v8 = MTMetricsKitOSLog();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412290;
      id v11 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "MetricsKit: Failed to fetch records with ID. error %@",  (uint8_t *)&v10,  0xCu);
    }

    id v7 = 0LL;
  }

  [*(id *)(a1 + 32) finishWithResult:v7 error:v6];
}

void sub_100009DC0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_100009DF8(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a2 objectForKeyedSubscript:v5]);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v9 = WeakRetained;
  if (v7)
  {
    uint64_t v12 = v7;
    int v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v12, 1LL));
    [v9 handleFetchedRecords:v10 error:v6];
  }

  else
  {
    [WeakRetained handleFetchedRecords:0 error:v6];
  }

  id v11 = objc_loadWeakRetained((id *)(a1 + 40));
  [v11 removePendingRecordID:*(void *)(a1 + 32)];
}

void sub_10000A238( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, id location)
{
}

void sub_10000A290(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v6 = v3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v6, 1LL));

  [WeakRetained handleFetchedRecords:v5 error:0];
}

void sub_10000A338(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained handleDeletedRecordID:v3 error:0];
}

void sub_10000A384(uint64_t a1)
{
  dispatch_queue_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained pendingRecordIDs]);
  id v4 = [v3 count];

  if (!v4)
  {
    id v5 = objc_loadWeakRetained(v1);
    [v5 _endTransaction];
  }

void sub_10000A55C(_Unwind_Exception *a1)
{
}

id sub_10000A574(uint64_t a1)
{
  return [*(id *)(a1 + 32) commit];
}

void sub_10000A6C0(_Unwind_Exception *exception_object)
{
}

void sub_10000AA1C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, id location)
{
}

void sub_10000AA88(uint64_t a1, void *a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained handleSavedRecord:v6 error:v5];
}

void sub_10000AAEC(uint64_t a1)
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v12;
    id v6 = (id *)(a1 + 40);
    do
    {
      id v7 = 0LL;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)v7);
        id WeakRetained = objc_loadWeakRetained(v6);
        int v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "recordID", (void)v11));
        [WeakRetained removePendingRecordID:v10];

        id v7 = (char *)v7 + 1;
      }

      while (v4 != v7);
      id v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v4);
  }
}

void sub_10000AC7C(_Unwind_Exception *a1)
{
}

void sub_10000AD24(_Unwind_Exception *a1)
{
}

void sub_10000AE9C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_10000AEB8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10000AEC8(uint64_t a1)
{
}

void sub_10000AED0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0LL;
}

void sub_10000AFA8(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) delegate]);
  [v2 accountDidChangeWithUserRecordID:*(void *)(a1 + 40)];
}

void sub_10000B0AC(_Unwind_Exception *a1)
{
}

void sub_10000B0C0(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) delegate]);
  [v2 syncEngineDidStartWithError:*(void *)(a1 + 40)];
}

LABEL_13:
  id v20 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MTIDSyncEngine queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000B368;
  block[3] = &unk_100020A08;
  v24 = v7;
  id v25 = self;
  uint64_t v26 = v6;
  uint64_t v21 = v6;
  id v22 = v7;
  dispatch_async(v20, block);
}

void sub_10000B368(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v2 = MTMetricsKitOSLog();
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) recordID]);
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 recordName]);
      uint64_t v6 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      int v10 = v5;
      __int16 v11 = 2112;
      uint64_t v12 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "MetricsKit: Failed to save record with ID %@ error %@",  buf,  0x16u);
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) delegate]);
    [v7 recordWasFailedToSave:*(void *)(a1 + 48)];
  }

  else
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) delegate]);
    [v8 recordWasSaved:*(void *)(a1 + 48)];
  }

void sub_10000B5D4(uint64_t a1)
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0LL;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v9 + 1) + 8LL * (void)v6);
        id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "delegate", (void)v9));
        [v8 recordWasFetched:v7];

        uint64_t v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v4);
  }
}

void sub_10000B82C(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) delegate]);
  [v2 recordWasDeleted:*(void *)(a1 + 40)];
}

LABEL_10:
  return v12;
}
}

void sub_10000BD18(_Unwind_Exception *a1)
{
}

void sub_10000BD2C(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___NSObject);
  id v2 = (void *)qword_1000284F8;
  qword_1000284F8 = (uint64_t)v1;
}

id sub_10000C450(uint64_t a1)
{
  return [*(id *)(a1 + 48) _setupCompositePromise:*(void *)(a1 + 32) composition:*(void *)(a1 + 40)];
}

void sub_10000C858(_Unwind_Exception *a1)
{
}

uint64_t sub_10000C8E4(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16LL))();
  }
  return result;
}

uint64_t sub_10000C974(uint64_t result, uint64_t a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16LL))();
  }
  return result;
}

uint64_t sub_10000CA90(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16LL))();
  }
  return result;
}

uint64_t sub_10000CB30(uint64_t result, uint64_t a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16LL))();
  }
  return result;
}

void sub_10000CCB4(_Unwind_Exception *a1)
{
}

void sub_10000CE74( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_10000CE90(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v7 = WeakRetained;
    id v3 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained startDate]);
    [v3 timeIntervalSinceNow];
    double v5 = v4 + -0.01;
    double v6 = -*(double *)(a1 + 48);

    id WeakRetained = v7;
    if (v5 < v6)
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
      id WeakRetained = v7;
    }
  }
}

void sub_10000D198(id a1)
{
  v3[0] = @"date";
  v3[1] = @"syncWaitTime";
  v3[2] = @"idType";
  v3[3] = @"cachePolicy";
  v3[4] = @"reset";
  v3[5] = @"dsId";
  v3[6] = @"iTunesUserRequired";
  v3[7] = @"appBundleID";
  v3[8] = @"existingOnly";
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v3, 9LL));
  id v2 = (void *)qword_100028500;
  qword_100028500 = v1;
}

void sub_10000EEEC(_Unwind_Exception *a1)
{
}

void sub_10000EF00(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _generateFutureRecordsForScheme:*(void *)(a1 + 32) referenceRecord:*(void *)(a1 + 40)];
}

LABEL_14:
}

BOOL sub_10000F258(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[6];
  id v5 = a2;
  double v6 = (void *)objc_claimAutoreleasedReturnValue( +[MTIDCloudKitStore spanRecordKeyWithReferenceRecord:serialNumber:]( &OBJC_CLASS___MTIDCloudKitStore,  "spanRecordKeyWithReferenceRecord:serialNumber:",  v3,  v4));
  BOOL v7 = +[MTIDCloudKitStore updateRecord:isSpanRecord:scheme:expectedKey:expiration:reset:]( &OBJC_CLASS___MTIDCloudKitStore,  "updateRecord:isSpanRecord:scheme:expectedKey:expiration:reset:",  v5,  1LL,  a1[5],  v6,  0LL,  0LL);

  return v7;
}

void sub_10000F600(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 64);
  id v16 = 0LL;
  double v6 = (void *)objc_claimAutoreleasedReturnValue([v2 recordWithID:v3 qualityOfService:v4 updateRecordMaybe:v5 error:&v16]);
  id v7 = v16;
  if (v7)
  {
    [*(id *)(a1 + 48) finishWithError:v7];
  }

  else if ((objc_msgSend(v6, "mt_isSynchronized") & 1) != 0 {
         || ![*(id *)(a1 + 32) canSyncBetweenDevices]
  }
         || *(double *)(a1 + 72) <= 0.0
         || *(_BYTE *)(a1 + 80))
  {
    [*(id *)(a1 + 48) finishWithResult:v6];
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"secretKey"]);
    __int128 v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) promiseManager]);
    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 waitForRecordToSync:v6 timeout:*(double *)(a1 + 72)]);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10000F774;
    v12[3] = &unk_100020BB8;
    id v13 = v8;
    id v14 = *(id *)(a1 + 48);
    id v15 = v6;
    id v11 = v8;
    [v10 addFinishBlock:v12];
  }
}

void sub_10000F774(void *a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  double v6 = (void *)a1[4];
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"secretKey"]);
  LODWORD(v6) = [v6 isEqualToString:v7];

  id v8 = (void *)a1[5];
  if ((_DWORD)v6) {
    [v8 finishWithResult:v9 error:v5];
  }
  else {
    [v8 finishWithResult:a1[6]];
  }
}

BOOL sub_10000FF14(uint64_t a1, void *a2)
{
  if (*(_BYTE *)(a1 + 48)) {
    return 0LL;
  }
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a2;
  double v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTIDCloudKitStore keyOfReferenceDate:](&OBJC_CLASS___MTIDCloudKitStore, "keyOfReferenceDate:", v4));
  BOOL v7 = +[MTIDCloudKitStore updateRecord:isSpanRecord:scheme:expectedKey:expiration:reset:]( &OBJC_CLASS___MTIDCloudKitStore,  "updateRecord:isSpanRecord:scheme:expectedKey:expiration:reset:",  v5,  0LL,  *(void *)(a1 + 40),  v6,  0LL,  *(unsigned __int8 *)(a1 + 49));

  return v7;
}

BOOL sub_1000100F4(uint64_t a1, void *a2)
{
  if (*(_BYTE *)(a1 + 56)) {
    return 0LL;
  }
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  id v6 = a2;
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue( +[MTIDCloudKitStore spanRecordKeyWithReferenceRecord:serialNumber:]( MTIDCloudKitStore,  "spanRecordKeyWithReferenceRecord:serialNumber:",  v4,  [v5 serialNumber]));
  uint64_t v8 = *(void *)(a1 + 48);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) endDate]);
  BOOL v10 = +[MTIDCloudKitStore updateRecord:isSpanRecord:scheme:expectedKey:expiration:reset:]( &OBJC_CLASS___MTIDCloudKitStore,  "updateRecord:isSpanRecord:scheme:expectedKey:expiration:reset:",  v6,  1LL,  v8,  v7,  v9,  0LL);

  return v10;
}

id sub_100010440(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (!v3)
  {
    id v25 = &__kCFBooleanFalse;
    goto LABEL_21;
  }

  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id v5 = [v3 countByEnumeratingWithState:&v30 objects:v39 count:16];
  if (!v5) {
    goto LABEL_19;
  }
  id v7 = v5;
  uint64_t v8 = *(void *)v31;
  *(void *)&__int128 v6 = 138412546LL;
  __int128 v28 = v6;
  do
  {
    for (unint64_t i = 0LL; i != v7; unint64_t i = (char *)i + 1)
    {
      if (*(void *)v31 != v8) {
        objc_enumerationMutation(v4);
      }
      BOOL v10 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v4,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v30 + 1) + 8 * (void)i),  v28));
      id v11 = v10;
      if (v10)
      {
        __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v10 recordType]);
        unsigned int v13 = [v12 isEqualToString:@"MT_IDSecret"];

        if (v13)
        {
          id v14 = (void *)objc_claimAutoreleasedReturnValue([v11 recordID]);
          id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 recordName]);
          unsigned int v16 = [v15 hasPrefix:@"MT_ID"];

          if (v16)
          {
            objc_msgSend(v11, "mt_setSynchronized:", 1);
            uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) localDB]);
            id v29 = 0LL;
            unsigned __int8 v18 = [v17 writeRecord:v11 error:&v29];
            id v19 = v29;

            if ((v18 & 1) == 0)
            {
              id v20 = MTMetricsKitOSLog();
              uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
              if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              {
                id v22 = (void *)objc_claimAutoreleasedReturnValue([v11 recordID]);
                uint64_t v23 = a1;
                v24 = (void *)objc_claimAutoreleasedReturnValue([v22 recordName]);
                *(_DWORD *)buf = v28;
                id v36 = v24;
                __int16 v37 = 2112;
                id v38 = v19;
                _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "MetricsKit: Failed to save local record data with ID %@ error %@",  buf,  0x16u);

                a1 = v23;
                goto LABEL_14;
              }

              goto LABEL_15;
            }
          }

          else
          {
            id v19 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) syncEngine]);
            uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 recordID]);
            v34 = v21;
            id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v34,  1LL));
            [v19 deleteRecordsWithIDs:v22];
LABEL_14:

LABEL_15:
          }
        }
      }
    }

    id v7 = [v4 countByEnumeratingWithState:&v30 objects:v39 count:16];
  }

  while (v7);
LABEL_19:
  id v25 = &__kCFBooleanTrue;
LABEL_21:
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(+[MTPromise promiseWithResult:](&OBJC_CLASS___MTPromise, "promiseWithResult:", v25));

  return v26;
}

void sub_10001155C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
}

uint64_t sub_10001157C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10001158C(uint64_t a1)
{
}

id sub_100011594(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = MTMetricsKitOSLog();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    __int128 v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) idNamespace]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 recordID]);
    unsigned int v8 = objc_msgSend(v3, "mt_isSynchronized");
    id v9 = @"unsynchronized";
    *(_DWORD *)buf = 138412802;
    __int16 v37 = v6;
    __int16 v38 = 2112;
    if (v8) {
      id v9 = @"synchronized";
    }
    v39 = v7;
    __int16 v40 = 2112;
    v41 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "MetricsKit: Loaded reference record for scheme %@ with id %@, synchronized: %@",  buf,  0x20u);
  }

  if ((uint64_t)[*(id *)(a1 + 32) lifespan] < 1)
  {
    id v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mt_secretValue"));
    id v14 = -[MTIDSecret initWithValue:effectiveDate:expirationDate:isSynchronize:]( [MTIDSecret alloc],  "initWithValue:effectiveDate:expirationDate:isSynchronize:",  v10,  0,  0,  objc_msgSend(v3, "mt_isSynchronized"));
    if ([*(id *)(a1 + 48) canSyncBetweenDevices])
    {
      unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) localDB]);
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 syncStatusCode]);
      -[MTIDSecret setSyncStatusCode:](v14, "setSyncStatusCode:", v17);
    }

    id v18 = MTMetricsKitOSLog();
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      id v20 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) idNamespace]);
      *(_DWORD *)buf = 138412290;
      __int16 v37 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "MetricsKit: Returning secret for scheme %@",  buf,  0xCu);
    }

    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[MTPromise promiseWithResult:](&OBJC_CLASS___MTPromise, "promiseWithResult:", v14));
    goto LABEL_14;
  }

  id v10 = (id)objc_claimAutoreleasedReturnValue(+[MTIDCloudKitStore referenceDateOfRecord:](&OBJC_CLASS___MTIDCloudKitStore, "referenceDateOfRecord:", v3));
  if (v10 || (id v10 = *(id *)(a1 + 40)) != 0LL)
  {
    uint64_t v11 = objc_claimAutoreleasedReturnValue( +[MTIDSpan spanForScheme:date:referenceDate:]( &OBJC_CLASS___MTIDSpan,  "spanForScheme:date:referenceDate:",  *(void *)(a1 + 32),  *(void *)(a1 + 40),  v10));
    uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8LL);
    unsigned int v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    [*(id *)(a1 + 48) generateFutureRecordsForScheme:*(void *)(a1 + 32) referenceRecord:v3];
    id v14 = (MTIDSecret *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 48) spanRecordForScheme:*(void *)(a1 + 32) span:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) timeout:*(unsigned __int8 *)(a1 + 72) existingOnly:25 qualityOfService:v3 referenceRecord:*(double *)(a1 + 64)]);
    v32[0] = (uint64_t)_NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = (uint64_t)sub_100011964;
    v32[3] = (uint64_t)&unk_100020C80;
    id v33 = *(id *)(a1 + 32);
    id v34 = v3;
    __int128 v35 = *(_OWORD *)(a1 + 48);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDSecret thenWithBlock:](v14, "thenWithBlock:", v32));

LABEL_14:
    goto LABEL_15;
  }

  id v22 = MTMetricsKitOSLog();
  uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) idNamespace]);
    *(_DWORD *)buf = 138412290;
    __int16 v37 = v24;
    _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "MetricsKit: Reference date is null, returning error. Scheme: %@",  buf,  0xCu);
  }

  id v31 = MTError( 703LL,  @"Namespace date is null, are you sending multiple reset requests too quickly?",  v25,  v26,  v27,  v28,  v29,  v30,  v32[0]);
  id v10 = (id)objc_claimAutoreleasedReturnValue(v31);
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[MTPromise promiseWithError:](&OBJC_CLASS___MTPromise, "promiseWithError:", v10));
LABEL_15:

  return v15;
}

id sub_100011964(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = MTMetricsKitOSLog();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    __int128 v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) idNamespace]);
    *(_DWORD *)buf = 138412290;
    uint64_t v23 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "MetricsKit: Span record obtained for scheme %@",  buf,  0xCu);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "mt_secretValue"));
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mt_secretValue"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@%@", v7, v8));

  id v10 = objc_alloc(&OBJC_CLASS___MTIDSecret);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) startDate]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) endDate]);
  else {
    id v13 = 0LL;
  }
  id v14 = -[MTIDSecret initWithValue:effectiveDate:expirationDate:isSynchronize:]( v10,  "initWithValue:effectiveDate:expirationDate:isSynchronize:",  v9,  v11,  v12,  v13);

  if ([*(id *)(a1 + 48) canSyncBetweenDevices])
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) localDB]);
    unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([v15 syncStatusCode]);
    -[MTIDSecret setSyncStatusCode:](v14, "setSyncStatusCode:", v16);
  }

  id v17 = MTMetricsKitOSLog();
  id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) idNamespace]);
    *(_DWORD *)buf = 138412290;
    uint64_t v23 = v19;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "MetricsKit: Returning secret for scheme %@",  buf,  0xCu);
  }

  id v20 = (void *)objc_claimAutoreleasedReturnValue(+[MTPromise promiseWithResult:](&OBJC_CLASS___MTPromise, "promiseWithResult:", v14));
  return v20;
}

MTPromise *__cdecl sub_100011DC4(id a1, id a2)
{
  return +[MTPromise promiseWithResult:](&OBJC_CLASS___MTPromise, "promiseWithResult:", &__kCFBooleanTrue);
}

void sub_100011FB4(id *a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([a1[4] generatedDates]);
  [v2 removeAllObjects];

  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([a1[5] objectForKeyedSubscript:@"dsId"]);
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v4 = a1[6];
  id v5 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      for (unint64_t i = 0LL; i != v6; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v20 + 1) + 8LL * (void)i);
        id v10 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( a1[4],  "referenceRecordForScheme:dsId:date:reset:timeout:existingOnly:qualityOfService:",  v9,  v16,  0,  0,  0,  -1,  0.0,  v16));
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472LL;
        v19[2] = sub_100012254;
        v19[3] = &unk_100020D10;
        v19[4] = a1[4];
        v19[5] = v9;
        [v10 addSuccessBlock:v19];
        [v3 addObject:v10];
      }

      id v6 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v6);
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([a1[4] syncEngine]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([a1[4] localDB]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 pendingRecordIDs]);
  [v11 saveRecordsWithIDs:v13 qualityOfService:-1];

  id v14 = v3;
  if ([v3 count])
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[MTPromise promiseWithAll:](&OBJC_CLASS___MTPromise, "promiseWithAll:", v3));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_1000122D4;
    v17[3] = &unk_100020D38;
    id v18 = a1[7];
    [v15 addFinishBlock:v17];
  }

  else
  {
    [a1[7] finishWithResult:&__kCFBooleanTrue];
  }
}

void sub_100012254(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (objc_msgSend(v5, "mt_isSynchronized"))
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) syncEngine]);
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v5 recordID]);
    [v3 fetchRecordWithID:v4];
  }

  [*(id *)(a1 + 32) generateFutureRecordsForScheme:*(void *)(a1 + 40) referenceRecord:v5];
}

id sub_1000122D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  if (a3) {
    id v5 = 0LL;
  }
  else {
    id v5 = &__kCFBooleanTrue;
  }
  return [v4 finishWithResult:v5 error:a3];
}

id sub_100012414(id a1, CKRecord *a2)
{
  id v2 = a2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord objectForKeyedSubscript:](v2, "objectForKeyedSubscript:", @"secretKey"));
  [v3 setObject:v4 forKeyedSubscript:@"key"];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord mt_secretValue](v2, "mt_secretValue"));
  [v3 setObject:v5 forKeyedSubscript:@"value"];

  BOOL v6 = -[CKRecord mt_isSynchronized](v2, "mt_isSynchronized");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v6));
  [v3 setObject:v7 forKeyedSubscript:@"isSynchronized"];

  id v8 = [v3 copy];
  return v8;
}

void sub_100012870( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_1000128AC(uint64_t a1, void *a2)
{
  id v8 = a2;
  [v8 finishWithResult:*(void *)(a1 + 32)];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    objc_sync_enter(v5);
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v5 dict]);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:*(void *)(a1 + 40)]);

    [v7 removeObject:v8];
    objc_sync_exit(v5);
  }
}

void sub_10001294C(_Unwind_Exception *a1)
{
}

void sub_100012AA0(_Unwind_Exception *a1)
{
}

void sub_100012AB4(uint64_t a1)
{
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      BOOL v6 = 0LL;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend( *(id *)(*((void *)&v7 + 1) + 8 * (void)v6),  "finishWithResult:",  *(void *)(a1 + 40),  (void)v7);
        BOOL v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }

    while (v4);
  }
}

LABEL_8:
  return v9;
}

LABEL_9:
  return v10;
}

LABEL_12:
  objc_sync_exit(v7);
  return (char)a4;
}

void sub_100013F40(_Unwind_Exception *a1)
{
}

void sub_100014110(_Unwind_Exception *a1)
{
}

void sub_1000141F0(_Unwind_Exception *a1)
{
}

void sub_100014378(_Unwind_Exception *a1)
{
}

void sub_100014580(_Unwind_Exception *a1)
{
}

void sub_100014BF4(_Unwind_Exception *a1)
{
}

MTPromise *__cdecl sub_100015018(id a1, id a2)
{
  return +[MTPromise promiseWithResult:](&OBJC_CLASS___MTPromise, "promiseWithResult:", &__kCFBooleanTrue);
}

MTPromise *__cdecl sub_100015244(id a1, id a2)
{
  return +[MTPromise promiseWithResult:](&OBJC_CLASS___MTPromise, "promiseWithResult:", &__kCFBooleanTrue);
}

void sub_1000152C0(_Unwind_Exception *a1)
{
}

void sub_1000152D4(id a1, id a2, MTIDSecretStore *a3, BOOL *a4)
{
}

void sub_100015410(_Unwind_Exception *a1)
{
}

void sub_10001542C(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if ((objc_opt_respondsToSelector(v6, "debugInfo") & 1) != 0)
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v6 debugInfo]);
    [v4 addObject:v5];
  }
}

MTPromise *__cdecl sub_100015690(id a1, id a2)
{
  return +[MTPromise promiseWithResult:](&OBJC_CLASS___MTPromise, "promiseWithResult:", &__kCFBooleanTrue);
}

id objc_msgSend_promiseForRecordWithID_timeout_qualityOfService_existingOnly_updateRecordMaybe_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "promiseForRecordWithID:timeout:qualityOfService:existingOnly:updateRecordMaybe:");
}

id objc_msgSend_referenceRecordForScheme_dsId_date_reset_timeout_existingOnly_qualityOfService_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "referenceRecordForScheme:dsId:date:reset:timeout:existingOnly:qualityOfService:");
}

id objc_msgSend_spanRecordForScheme_span_timeout_existingOnly_qualityOfService_referenceRecord_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "spanRecordForScheme:span:timeout:existingOnly:qualityOfService:referenceRecord:");
}

id objc_msgSend_zoneID(void *a1, const char *a2, ...)
{
  return [a1 zoneID];
}