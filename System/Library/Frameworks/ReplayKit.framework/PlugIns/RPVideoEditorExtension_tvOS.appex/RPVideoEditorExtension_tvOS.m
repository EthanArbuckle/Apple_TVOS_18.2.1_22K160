uint64_t RPLogSetLogLevel(uint64_t result)
{
  return result;
}

uint64_t sub_100003808(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (a2) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(v3 + 16))(v3, 0LL, a2);
  }
  else {
    return (*(uint64_t (**)(uint64_t, void))(v3 + 16))(v3, *(void *)(a1 + 32));
  }
}

void sub_100003CB8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) status];
  if (v2 == (id)5)
  {
    *(_DWORD *)v6 = 136446466;
    *(void *)&v6[4] = "+[RPAudioMixUtility mixAudioForMovie:finalMovieURL:outputFileType:withCompletionHandler:]_block_invoke";
    *(_WORD *)&v6[12] = 1024;
    *(_DWORD *)&v6[14] = 72;
    uint64_t v3 = " [INFO] %{public}s:%d AVAssetExportSessionStatusCancelled";
    goto LABEL_9;
  }

  if (v2 == (id)4)
  {
    *(_DWORD *)v6 = 136446466;
    *(void *)&v6[4] = "+[RPAudioMixUtility mixAudioForMovie:finalMovieURL:outputFileType:withCompletionHandler:]_block_invoke";
    *(_WORD *)&v6[12] = 1024;
    *(_DWORD *)&v6[14] = 67;
    uint64_t v3 = " [INFO] %{public}s:%d AVAssetExportSessionFailed";
LABEL_9:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v3, v6, 0x12u);
LABEL_10:
    uint64_t v4 = *(void *)(a1 + 40);
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSError _rpUserErrorForCode:userInfo:]( &OBJC_CLASS___NSError,  "_rpUserErrorForCode:userInfo:",  -5818LL,  0LL,  *(_OWORD *)v6,  *(void *)&v6[16]));
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

    return;
  }

  if (__RPLogLevel <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v6 = 136446466;
    *(void *)&v6[4] = "+[RPAudioMixUtility mixAudioForMovie:finalMovieURL:outputFileType:withCompletionHandler:]_block_invoke";
    *(_WORD *)&v6[12] = 1024;
    *(_DWORD *)&v6[14] = 77;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d AVAssetExportSession returned with no errors",  v6,  0x12u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

LABEL_6:
  v10 = v9;
  return v10;
}

LABEL_7:
  return v4;
}

void sub_100004438( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void sub_100004828(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "finished dismissing",  v3,  2u);
  }

  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) delegate]);
  [v2 videoEditor:*(void *)(a1 + 32) didFinishWithActivityTypes:0];
}

id sub_1000049DC(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) pause];
}
}

void sub_100005408(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _createOverlayImageWithBackgroundWhite:0.959999979 backgroundAlpha:0.959999979 glyphAlpha:0.300000012];
  id v2 = (void *)qword_1000123A8;
  qword_1000123A8 = (uint64_t)v1;
}

void sub_1000054B8(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _createOverlayImageWithBackgroundWhite:0.959999979 backgroundAlpha:0.959999979 glyphAlpha:0.5];
  id v2 = (void *)qword_1000123B8;
  qword_1000123B8 = (uint64_t)v1;
}

void sub_100005918(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  id v13 = a4;
  v14 = *(void **)(a1 + 32);
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a3;
  id v19 = a2;
  [v14 setBundleIdentifier:v19];
  [*(id *)(a1 + 32) setAppName:v18];

  [*(id *)(a1 + 32) setMovieURL:v13];
  [*(id *)(a1 + 32) setFileAttachmentURL:v17];

  [*(id *)(a1 + 32) setOverrideShareMessage:v16];
  [*(id *)(a1 + 32) setOverrideTintColor:v15];

  id v20 = [v19 isEqualToString:@"com.apple.replayKit.ReplayKitTestRunneriOS"];
  [*(id *)(a1 + 32) setIsInternalTestMode:v20];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v21 = [*(id *)(a1 + 32) isInternalTestMode];
    *(_DWORD *)buf = 136315394;
    v26 = "-[RPVideoEditorExtensionViewController setupChildViewControllers]_block_invoke";
    __int16 v27 = 1024;
    unsigned int v28 = v21;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s isInternalTestMode: %d",  buf,  0x12u);
  }

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_100005B0C;
  v23[3] = &unk_10000C460;
  v23[4] = *(void *)(a1 + 32);
  id v24 = v13;
  id v22 = v13;
  dispatch_async(&_dispatch_main_q, v23);
}

void sub_100005B0C(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "loaded input items",  (uint8_t *)buf,  2u);
  }

  id v2 = *(void **)(a1 + 32);
  if (v2[2] == 1LL)
  {
    id v3 = objc_alloc(&OBJC_CLASS___SFAirDropSharingViewControllerTV);
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));
    id v5 = [v3 initWithSharingItems:v4];

    objc_initWeak(buf, v5);
    objc_initWeak(&location, *(id *)(a1 + 32));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100005CF0;
    v6[3] = &unk_10000C438;
    objc_copyWeak(&v7, buf);
    objc_copyWeak(&v8, &location);
    [v5 setCompletionHandler:v6];
    [*(id *)(a1 + 32) presentViewController:v5 animated:1 completion:0];
    objc_destroyWeak(&v8);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
    objc_destroyWeak(buf);
  }

  else
  {
    [v2 setupVideoEditorController];
  }

void sub_100005CB8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, id a17)
{
}

void sub_100005CF0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100005DA4;
  v5[3] = &unk_10000C410;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  [WeakRetained dismissViewControllerAnimated:1 completion:v5];

  objc_destroyWeak(&v6);
}

void sub_100005D90(_Unwind_Exception *a1)
{
}

void sub_100005DA4(uint64_t a1)
{
  id v2 = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = (void *)objc_claimAutoreleasedReturnValue([v2 videoEditorViewController]);
  [v2 videoEditor:v1 didFinishWithActivityTypes:&__NSArray0__struct];
}

void sub_100006234( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, char a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, char a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, char a45)
{
}

uint64_t sub_100006288(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100006298(uint64_t a1)
{
}

void sub_1000062A0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 attachments]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndexedSubscript:0]);

  if ([v5 hasItemConformingToTypeIdentifier:*(void *)(a1 + 32)])
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
    uint64_t v6 = *(void *)(a1 + 32);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1000063A0;
    v9[3] = &unk_10000C4B0;
    id v10 = v3;
    __int128 v12 = *(_OWORD *)(a1 + 56);
    __int128 v13 = *(_OWORD *)(a1 + 72);
    uint64_t v14 = *(void *)(a1 + 88);
    __int128 v8 = *(_OWORD *)(a1 + 40);
    id v7 = (id)v8;
    __int128 v11 = v8;
    [v5 loadItemForTypeIdentifier:v6 options:0 completionHandler:v9];
  }
}

void sub_1000063A0(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (!v7)
  {
    __int128 v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) attributedTitle]);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 string]);
    unsigned int v10 = [v9 isEqualToString:@"RPVideoEditorExtensionAppNameKey"];

    if (v10)
    {
      uint64_t v11 = *(void *)(a1 + 48);
LABEL_6:
      objc_storeStrong((id *)(*(void *)(v11 + 8) + 40LL), a2);
      goto LABEL_10;
    }

    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) attributedTitle]);
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 string]);
    unsigned int v14 = [v13 isEqualToString:@"RPVideoEditorExtensionMovieURLKey"];

    if (v14)
    {
      id v15 = v6;
      uint64_t v16 = objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v15));
      uint64_t v17 = *(void *)(a1 + 56);
    }

    else
    {
      id v20 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) attributedTitle]);
      unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue([v20 string]);
      unsigned int v22 = [v21 isEqualToString:@"RPVideoEditorExtensionBundleIdentifierKey"];

      if (v22)
      {
        uint64_t v11 = *(void *)(a1 + 64);
        goto LABEL_6;
      }

      v23 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) attributedTitle]);
      id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 string]);
      unsigned int v25 = [v24 isEqualToString:@"RPVideoEditorExtensionFileAttachmentKey"];

      if (!v25)
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) attributedTitle]);
        __int16 v27 = (void *)objc_claimAutoreleasedReturnValue([v26 string]);
        unsigned int v28 = [v27 isEqualToString:@"RPVideoEditorExtensionOverrideShareMessageKey"];

        if (v28)
        {
          uint64_t v11 = *(void *)(a1 + 80);
        }

        else
        {
          v29 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) attributedTitle]);
          v30 = (void *)objc_claimAutoreleasedReturnValue([v29 string]);
          unsigned int v31 = [v30 isEqualToString:@"RPVideoEditorExtensionOverrideTintColorKey"];

          if (!v31) {
            goto LABEL_10;
          }
          uint64_t v11 = *(void *)(a1 + 88);
        }

        goto LABEL_6;
      }

      id v15 = v6;
      uint64_t v16 = objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v15));
      uint64_t v17 = *(void *)(a1 + 72);
    }

    uint64_t v18 = *(void *)(v17 + 8);
    id v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = v16;

    goto LABEL_10;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100006F18();
  }
LABEL_10:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t sub_100006614(void *a1)
{
  uint64_t result = a1[4];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void, void, void, void))(result + 16))( result,  *(void *)(*(void *)(a1[5] + 8LL) + 40LL),  *(void *)(*(void *)(a1[6] + 8LL) + 40LL),  *(void *)(*(void *)(a1[7] + 8LL) + 40LL),  *(void *)(*(void *)(a1[8] + 8LL) + 40LL),  *(void *)(*(void *)(a1[9] + 8LL) + 40LL),  *(void *)(*(void *)(a1[10] + 8LL) + 40LL));
  }
  return result;
}

void sub_100006B34(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100006F5C(a2);
  }
}

void sub_100006D0C(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS___RPStoreManager);
  id v2 = (void *)qword_1000123D0;
  qword_1000123D0 = (uint64_t)v1;
}

void sub_100006D38()
{
}

void sub_100006DB0()
{
}

void sub_100006E28()
{
}

void sub_100006EA0()
{
}

void sub_100006F18()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Error loading input item for type",  v0,  2u);
}

void sub_100006F5C(void *a1)
{
  v1[0] = 67109120;
  v1[1] = [a1 code];
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "error calling extension - %i",  (uint8_t *)v1,  8u);
}

id objc_msgSend_willMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "willMoveToParentViewController:");
}