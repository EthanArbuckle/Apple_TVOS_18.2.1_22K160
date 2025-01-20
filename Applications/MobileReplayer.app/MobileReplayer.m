uint64_t start(int a1, char **a2)
{
  void *v4;
  uint64_t v5;
  setenv("MTL_TRACING_ENABLE_RESOURCE_RESOLUTION", "1", 1);
  v4 = objc_autoreleasePoolPush();
  v5 = UIApplicationMain(a1, a2, 0LL, @"MRAppDelegateiOS");
  objc_autoreleasePoolPop(v4);
  return v5;
}

void sub_10000201C(id a1)
{
  v1 = objc_opt_new(&OBJC_CLASS___MRReplayController);
  v2 = (void *)qword_10000D420;
  qword_10000D420 = (uint64_t)v1;
}

void sub_100002190( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1000023AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}
}

void sub_1000024CC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
}

void sub_100002C3C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, void *a26, void *a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, id location, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43)
{
  objc_destroyWeak(v44);
  objc_destroyWeak((id *)(v46 - 200));

  _Unwind_Resume(a1);
}

void sub_100002E24(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = *(void **)(a1 + 32);
  id v10 = WeakRetained;
  v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained shaderProfiler]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 startShaderProfiler:v4]);

  [v5 waitUntilResolved];
  v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) transport]);
  id v7 = [*(id *)(a1 + 48) kind];
  v8 = (void *)objc_claimAutoreleasedReturnValue([v5 result]);
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[DYTransportMessage messageWithKind:plistPayload:]( &OBJC_CLASS___DYTransportMessage,  "messageWithKind:plistPayload:",  v7,  v8));
  [v6 send:v9 inReplyTo:*(void *)(a1 + 48) error:0];
}

void sub_100002F08( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100002F58(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100002F68(uint64_t a1)
{
}

void sub_100002F70(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = *(void **)(a1 + 32);
  v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained shaderProfiler]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 batchedCounterDataForShaderProfiler:v4]);

  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100003074;
  v9[3] = &unk_100008340;
  id v10 = v5;
  __int128 v11 = *(_OWORD *)(a1 + 40);
  id v8 = v5;
  [v8 notifyOnQueue:v7 handler:v9];
}

void sub_100003044( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100003074(uint64_t a1)
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) result]);
  [v4 setObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) forKeyedSubscript:kDYBatchFilteredCounterProgress];
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) transport]);
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[DYTransportMessage messageWithKind:plistPayload:]( &OBJC_CLASS___DYTransportMessage,  "messageWithKind:plistPayload:",  4123LL,  v4));
  [v2 send:v3 inReplyTo:0 error:0];
}

void sub_100003110( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  v12 = v11;

  _Unwind_Resume(a1);
}

void sub_100003140(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = *(void **)(a1 + 32);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained shaderProfiler]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectPayload]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"highPriorityBatches"]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 batchedCounterDataForShaderProfiler:v4 forHighPriorityBatches:v6]);

  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  v9 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000032B4;
  v13[3] = &unk_100008390;
  int8x16_t v12 = *(int8x16_t *)(a1 + 40);
  id v10 = (id)v12.i64[0];
  int8x16_t v14 = vextq_s8(v12, v12, 8uLL);
  id v15 = v7;
  id v11 = v7;
  [v11 notifyOnQueue:v9 handler:v13];
}

void sub_100003268( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_1000032B4(id *a1)
{
  id v5 = (id)objc_claimAutoreleasedReturnValue([a1[4] transport]);
  id v2 = [a1[5] kind];
  v3 = (void *)objc_claimAutoreleasedReturnValue([a1[6] result]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[DYTransportMessage messageWithKind:plistPayload:]( &OBJC_CLASS___DYTransportMessage,  "messageWithKind:plistPayload:",  v2,  v3));
  [v5 send:v4 inReplyTo:a1[5] error:0];
}

void sub_10000334C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100003378(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = *(void **)(a1 + 32);
  id v10 = WeakRetained;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained shaderProfiler]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 derivedCounterDataForFrameProfiler:v4]);

  [v5 waitUntilResolved];
  v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) transport]);
  id v7 = [*(id *)(a1 + 48) kind];
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 result]);
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[DYTransportMessage messageWithKind:plistPayload:]( &OBJC_CLASS___DYTransportMessage,  "messageWithKind:plistPayload:",  v7,  v8));
  [v6 send:v9 inReplyTo:*(void *)(a1 + 48) error:0];
}

void sub_10000345C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100003634(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000366C(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) strongDelegate]);
  [v2 setViewController:*(void *)(a1 + 40)];

  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = 0LL;
}

void sub_1000036B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000036C8(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 8LL);
  if (v2)
  {
    v9 = (UIImageView *)objc_claimAutoreleasedReturnValue([v2 view]);
    -[UIImageView setImage:](v9, "setImage:", *(void *)(a1 + 40));
  }

  else
  {
    uint64_t v3 = objc_alloc_init(&OBJC_CLASS___UIViewController);
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 8);
    *(void *)(v4 + 8) = v3;

    v9 = -[UIImageView initWithImage:](objc_alloc(&OBJC_CLASS___UIImageView), "initWithImage:", *(void *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
    -[UIImageView setBackgroundColor:](v9, "setBackgroundColor:", v6);

    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
    [v7 bounds];
    -[UIImageView setFrame:](v9, "setFrame:");

    -[UIImageView setContentMode:](v9, "setContentMode:", 1LL);
    [*(id *)(*(void *)(a1 + 32) + 8) setView:v9];
    id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) strongDelegate]);
    [v8 setViewController:*(void *)(*(void *)(a1 + 32) + 8)];
  }
}

void sub_1000037DC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100003A8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100003B08(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 archiveStack]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v2 _replayerControllerSupportForCaptureStore:v3]);
  [*(id *)(a1 + 32) setReplayControllerSupport:v4];

  id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) replayControllerSupport]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) archiveStack]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 createDebugPlaybackEngineWithCaptureStore:v6]);
  [*(id *)(a1 + 32) setPlaybackEngine:v7];

  return [*(id *)(a1 + 32) _displayPlaybackEngine];
}

void sub_100003BB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100003F24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100004030( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100004098(uint64_t a1, int a2, char a3)
{
  *(void *)(a1 + 8) = objc_claimAutoreleasedReturnValue( +[CATransaction animationTimingFunction]( &OBJC_CLASS___CATransaction,  "animationTimingFunction"));
  +[CATransaction animationDuration](&OBJC_CLASS___CATransaction, "animationDuration");
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = 0LL;
  *(_BYTE *)(a1 + 32) = +[CATransaction disableActions](&OBJC_CLASS___CATransaction, "disableActions");
  *(_BYTE *)(a1 + 33) = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[CATransaction completionBlock](&OBJC_CLASS___CATransaction, "completionBlock"));
  id v8 = [v7 copy];
  v9 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = v8;

  if (a2) {
    +[CATransaction setDisableActions:](&OBJC_CLASS___CATransaction, "setDisableActions:", 1LL);
  }
  return a1;
}

void sub_100004130(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100004160(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 33)) {
    +[CATransaction flush](&OBJC_CLASS___CATransaction, "flush");
  }
  id v2 = *(id *)(a1 + 8);
  +[CATransaction setAnimationTimingFunction:](&OBJC_CLASS___CATransaction, "setAnimationTimingFunction:", v2);

  +[CATransaction setAnimationDuration:](&OBJC_CLASS___CATransaction, "setAnimationDuration:", *(double *)(a1 + 16));
  +[CATransaction setCompletionBlock:](&OBJC_CLASS___CATransaction, "setCompletionBlock:", *(void *)(a1 + 24));
  +[CATransaction setDisableActions:](&OBJC_CLASS___CATransaction, "setDisableActions:", *(unsigned __int8 *)(a1 + 32));

  return a1;
}

void sub_1000041F4(void *a1)
{
}

void sub_100004248( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  id v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)&OBJC_CLASS___MRAppDelegate;
  -[_Unwind_Exception dealloc](&a9, "dealloc");
  _Unwind_Resume(a1);
}

void sub_100004494( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id objc_msgSend_waitUntilResolved(void *a1, const char *a2, ...)
{
  return [a1 waitUntilResolved];
}