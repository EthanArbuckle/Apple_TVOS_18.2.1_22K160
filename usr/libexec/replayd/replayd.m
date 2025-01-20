id sub_100004BF0(uint64_t a1)
{
  return objc_msgSend( *(id *)(a1 + 32),  "thermalPressureDidChangeWithThermalLevel:",  objc_msgSend(*(id *)(a1 + 32), "getStateWithToken:", *(unsigned int *)(*(void *)(a1 + 32) + 8)));
}
}

void sub_100005598(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100041E04(v2);
    }
    NSLog(@"error = %@", v2);
  }
}

void sub_1000056B8(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) path]);
  if ([*(id *)(a1 + 40) fileExistsAtPath:v2])
  {
    v3 = *(void **)(a1 + 40);
    id v7 = 0LL;
    unsigned __int8 v4 = [v3 removeItemAtPath:v2 error:&v7];
    id v5 = v7;
    if ((v4 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100041E74(v5);
    }
  }

  else
  {
    id v5 = 0LL;
  }

  uint64_t v6 = *(void *)(a1 + 48);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v5);
  }
}

void sub_100005854(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) path]);
  LODWORD(v2) = [v2 fileExistsAtPath:v3];

  if ((_DWORD)v2) {
    [*(id *)(a1 + 32) removeItemAtURL:*(void *)(a1 + 40) error:0];
  }
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v6 = *(void **)(a1 + 32);
  id v16 = 0LL;
  [v6 moveItemAtURL:v4 toURL:v5 error:&v16];
  id v7 = v16;
  if (v7 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100041EE4((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);
  }
  uint64_t v15 = *(void *)(a1 + 56);
  if (v15) {
    (*(void (**)(uint64_t, id))(v15 + 16))(v15, v7);
  }
}

void sub_1000059AC(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _srTempPath]);
  id v24 = 0LL;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v2 contentsOfDirectoryAtPath:v3 error:&v24]);
  id v5 = v24;

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"self BEGINSWITH[cd] %@",  *(void *)(a1 + 40)));
  v17 = v4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 filteredArrayUsingPredicate:v6]);

  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id obj = v7;
  id v8 = [obj countByEnumeratingWithState:&v20 objects:v27 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        uint64_t v12 = v5;
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8LL * (void)i);
        if (v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_100041F50(buf, (int)v5, v26);
        }
        uint64_t v14 = *(void **)(a1 + 32);
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 _srTempPath]);
        id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@",  v15,  v13));
        id v19 = v12;
        [v14 removeItemAtPath:v16 error:&v19];
        id v5 = v19;
      }

      id v9 = [obj countByEnumeratingWithState:&v20 objects:v27 count:16];
    }

    while (v9);
  }
}

void sub_100005D84( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_100006FB8(id a1)
{
}

void sub_100007054(void *a1)
{
}

void sub_10000706C(id a1)
{
}

void sub_10000718C(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 112LL);
  if (v2)
  {
    (*(void (**)(void))(v2 + 16))();
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 112);
    *(void *)(v3 + 112) = 0LL;
  }

void sub_100007528(uint64_t a1)
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    id v8 = "-[RPMovieWriter startWritingHandler:]_block_invoke";
    __int16 v9 = 1024;
    int v10 = 150;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d ",  buf,  0x12u);
  }

  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) outputURL]);
  [v2 _srRemoveFile:v3 completion:&stru_100070D70];

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000076DC;
  v5[3] = &unk_100070D98;
  uint64_t v4 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  [v4 setUpAssetWriterWithHandler:v5];
}

void sub_100007684(id a1, NSError *a2)
{
  uint64_t v2 = a2;
}

uint64_t sub_1000076DC(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_1000077BC(_Unwind_Exception *a1)
{
}

id sub_1000077D4(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 48);
  __int128 v4 = *(_OWORD *)(a1 + 72);
  v6[0] = *(_OWORD *)(a1 + 56);
  v6[1] = v4;
  v6[2] = *(_OWORD *)(a1 + 88);
  id result = [v2 dispatchedAppendVideoSampleBuffer:v3 withWindowTransform:v6];
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = (_BYTE)result;
  return result;
}

id sub_1000078A0(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchedAppendAudio1SampleBuffer:*(void *)(a1 + 40)];
}

id sub_100007924(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchedAppendAudio2SampleBuffer:*(void *)(a1 + 40)];
}

void sub_100007A6C(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isFinishingWriting])
  {
    if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf.value) = 136446466;
      *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)"-[RPMovieWriter finishWritingWithHandler:]_block_invoke";
      LOWORD(buf.flags) = 1024;
      *(CMTimeFlags *)((char *)&buf.flags + 2) = 254;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d asset writer finished nothing to do",  (uint8_t *)&buf,  0x12u);
    }

    uint64_t v2 = *(void *)(a1 + 40);
    if (v2) {
      (*(void (**)(uint64_t, void, void))(v2 + 16))(v2, 0LL, 0LL);
    }
    return;
  }

  CMBufferQueueReset(*(CMBufferQueueRef *)(*(void *)(a1 + 32) + 112LL));
  CMBufferQueueReset(*(CMBufferQueueRef *)(*(void *)(a1 + 32) + 96LL));
  CMBufferQueueReset(*(CMBufferQueueRef *)(*(void *)(a1 + 32) + 104LL));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) assetWriter]);

  if (v3)
  {
    if ([*(id *)(a1 + 32) didProcessFirstSample])
    {
      __int128 v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) assetWriter]);
      id v5 = [v4 status];

      if (v5 == (id)1)
      {
        if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf.value) = 136446466;
          *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)"-[RPMovieWriter finishWritingWithHandler:]_block_invoke";
          LOWORD(buf.flags) = 1024;
          *(CMTimeFlags *)((char *)&buf.flags + 2) = 215;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d asset writer in correct state, attempting to finish writing",  (uint8_t *)&buf,  0x12u);
        }

        id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) assetWriter]);
        id v7 = *(void **)(a1 + 32);
        if (v7) {
          [v7 trimVideoPresentationTime];
        }
        else {
          memset(&time1, 0, sizeof(time1));
        }
        __int128 v18 = *(_OWORD *)&kCMTimeInvalid.value;
        *(_OWORD *)&buf.value = *(_OWORD *)&kCMTimeInvalid.value;
        CMTimeEpoch epoch = kCMTimeInvalid.epoch;
        buf.CMTimeEpoch epoch = epoch;
        if (CMTimeCompare(&time1, &buf))
        {
          uint64_t v14 = *(void **)(a1 + 32);
          if (v14) {
            [v14 trimVideoPresentationTime];
          }
          else {
            memset(v25, 0, sizeof(v25));
          }
          objc_msgSend(v6, "endSessionAtSourceTime:", v25, v18);
          uint64_t v15 = *(void **)(a1 + 32);
          __int128 v23 = v18;
          CMTimeEpoch v24 = epoch;
          [v15 setTrimVideoPresentationTime:&v23];
        }

        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472LL;
        v19[2] = sub_100007EC4;
        v19[3] = &unk_100070E38;
        id v20 = v6;
        id v16 = *(id *)(a1 + 40);
        uint64_t v21 = *(void *)(a1 + 32);
        id v22 = v16;
        id v17 = v6;
        [v17 finishWritingWithCompletionHandler:v19];
      }

      else
      {
        uint64_t v11 = *(void *)(a1 + 40);
        if (v11)
        {
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError _rpUserErrorForCode:userInfo:]( &OBJC_CLASS___NSError,  "_rpUserErrorForCode:userInfo:",  -5825LL,  0LL));
          (*(void (**)(uint64_t, void, void *))(v11 + 16))(v11, 0LL, v12);
        }

        [*(id *)(a1 + 32) setDidProcessFirstSample:0];
      }

      objc_msgSend(*(id *)(a1 + 32), "setIsFinishingWriting:", 1, v18);
      return;
    }

    uint64_t v8 = *(void *)(a1 + 40);
    if (v8)
    {
      uint64_t v9 = -5822LL;
      goto LABEL_25;
    }
  }

  else
  {
    if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf.value) = 136446466;
      *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)"-[RPMovieWriter finishWritingWithHandler:]_block_invoke";
      LOWORD(buf.flags) = 1024;
      *(CMTimeFlags *)((char *)&buf.flags + 2) = 198;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d no asset writer object",  (uint8_t *)&buf,  0x12u);
    }

    uint64_t v8 = *(void *)(a1 + 40);
    if (v8)
    {
      uint64_t v9 = -5824LL;
LABEL_25:
      int v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError _rpUserErrorForCode:userInfo:]( &OBJC_CLASS___NSError,  "_rpUserErrorForCode:userInfo:",  v9,  0LL));
      (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0LL, v10);
    }
  }

void sub_100007EC4(uint64_t a1)
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v2 = [*(id *)(a1 + 32) status];
    *(_DWORD *)id v6 = 136446722;
    *(void *)&v6[4] = "-[RPMovieWriter finishWritingWithHandler:]_block_invoke";
    *(_WORD *)&v6[12] = 1024;
    *(_DWORD *)&v6[14] = 227;
    __int16 v7 = 1024;
    BOOL v8 = v2 == (id)3;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d asset writer state: %i",  v6,  0x18u);
  }

  if (objc_msgSend(*(id *)(a1 + 32), "status", *(_OWORD *)v6) == (id)3) {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSError _rpUserErrorForCode:userInfo:]( &OBJC_CLASS___NSError,  "_rpUserErrorForCode:userInfo:",  -5823LL,  0LL));
  }
  else {
    uint64_t v3 = 0LL;
  }
  if ([*(id *)(a1 + 32) status] == (id)3) {
    __int128 v4 = 0LL;
  }
  else {
    __int128 v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) outputURL]);
  }
  uint64_t v5 = *(void *)(a1 + 48);
  if (v5) {
    (*(void (**)(uint64_t, void *, void *))(v5 + 16))(v5, v4, v3);
  }
  [*(id *)(a1 + 40) setDidProcessFirstSample:0];
}

void sub_100008188(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = *(void *)(a1 + 48);
    if (v7)
    {
      BOOL v8 = *(void (**)(void))(v7 + 16);
LABEL_13:
      v8();
    }
  }

  else
  {
    if (!v5)
    {
      if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)CMTime buf = 136446466;
        uint64_t v15 = "-[RPMovieWriter finishWritingAndSaveToCameraRollWithSessionID:mixAudioTracks:handler:]_block_invoke";
        __int16 v16 = 1024;
        int v17 = 289;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d asset writer finished nothing to do",  buf,  0x12u);
      }

      BOOL v8 = *(void (**)(void))(*(void *)(a1 + 48) + 16LL);
      goto LABEL_13;
    }

    uint64_t v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v11 = *(unsigned __int8 *)(a1 + 56);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100008340;
    v12[3] = &unk_100070D98;
    id v13 = *(id *)(a1 + 48);
    [v9 saveVideoToCameraRoll:v5 sessionID:v10 mixAudioTracks:v11 handler:v12];
  }
}

void sub_100008340(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    if (v4)
    {
      id v5 = *(void (**)(void))(v4 + 16);
LABEL_12:
      v5();
    }
  }

  else
  {
    if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136446466;
      BOOL v8 = "-[RPMovieWriter finishWritingAndSaveToCameraRollWithSessionID:mixAudioTracks:handler:]_block_invoke";
      __int16 v9 = 1024;
      int v10 = 281;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d ",  (uint8_t *)&v7,  0x12u);
    }

    uint64_t v6 = *(void *)(a1 + 32);
    if (v6)
    {
      id v5 = *(void (**)(void))(v6 + 16);
      goto LABEL_12;
    }
  }
}

void sub_100008558(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v3 = *(void *)(a1 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100008620;
  v4[3] = &unk_100070E88;
  id v7 = *(id *)(a1 + 48);
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 32);
  __int128 v8 = *(_OWORD *)(a1 + 56);
  [v2 _srRemoveFile:v3 completion:v4];
}

void sub_100008620(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = *(void *)(a1 + 48);
    id v7 = (id)objc_claimAutoreleasedReturnValue( +[NSError _rpUserErrorForCode:userInfo:]( &OBJC_CLASS___NSError,  "_rpUserErrorForCode:userInfo:",  -5827LL,  0LL));
    (*(void (**)(uint64_t, void, id))(v3 + 16))(v3, 0LL, v7);
  }

  else
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[AVAsset assetWithURL:](&OBJC_CLASS___AVAsset, "assetWithURL:", *(void *)(a1 + 32)));
    id v5 = -[AVAssetExportSession initWithAsset:presetName:]( objc_alloc(&OBJC_CLASS___AVAssetExportSession),  "initWithAsset:presetName:",  v4,  AVAssetExportPresetPassthrough);
    -[AVAssetExportSession setOutputURL:](v5, "setOutputURL:", *(void *)(a1 + 40));
    -[AVAssetExportSession setOutputFileType:](v5, "setOutputFileType:", AVFileTypeMPEG4);
    CMTimeMakeWithSeconds(&v19, *(Float64 *)(a1 + 56), 1);
    if (v4) {
      [v4 duration];
    }
    else {
      memset(&lhs, 0, sizeof(lhs));
    }
    CMTimeMakeWithSeconds(&rhs, *(Float64 *)(a1 + 64), 1);
    CMTimeSubtract(&v18, &lhs, &rhs);
    v13.CMTime start = v18;
    CMTime start = v19;
    CMTimeSubtract(&v15, &v13.start, &start);
    CMTime start = v19;
    CMTime duration = v15;
    CMTimeRangeMake(&v13, &start, &duration);
    CMTimeRange v11 = v13;
    -[AVAssetExportSession setTimeRange:](v5, "setTimeRange:", &v11);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100008830;
    v8[3] = &unk_100070DC0;
    __int16 v9 = v5;
    id v10 = *(id *)(a1 + 48);
    id v6 = v5;
    -[AVAssetExportSession exportAsynchronouslyWithCompletionHandler:]( v6,  "exportAsynchronouslyWithCompletionHandler:",  v8);
  }

void sub_100008830(uint64_t a1)
{
  id v2 = (id *)(a1 + 32);
  id v3 = [*(id *)(a1 + 32) status];
  if (v3 == (id)5)
  {
    if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136446466;
      __int16 v9 = "-[RPMovieWriter trimMovieWithURL:startClipDuration:endClipDuration:outputFileURL:handler:]_block_invoke";
      __int16 v10 = 1024;
      int v11 = 327;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d Export Trim Video Cancelled",  (uint8_t *)&v8,  0x12u);
    }

    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = -5828LL;
    goto LABEL_11;
  }

  if (v3 == (id)4)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = -5826LL;
LABEL_11:
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSError _rpUserErrorForCode:userInfo:]( &OBJC_CLASS___NSError,  "_rpUserErrorForCode:userInfo:",  v5,  0LL));
    (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0LL, v6);
    goto LABEL_16;
  }

  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136446466;
    __int16 v9 = "-[RPMovieWriter trimMovieWithURL:startClipDuration:endClipDuration:outputFileURL:handler:]_block_invoke";
    __int16 v10 = 1024;
    int v11 = 332;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d Export Trim succeeded",  (uint8_t *)&v8,  0x12u);
  }

  uint64_t v7 = *(void *)(a1 + 40);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) outputURL]);
  (*(void (**)(uint64_t, void *, void))(v7 + 16))(v7, v6, 0LL);
LABEL_16:
}

LABEL_35:
}

  v74 = (void *)objc_claimAutoreleasedReturnValue([v60 objectForKeyedSubscript:@"SCStreamPropertiesColorSpace"]);

  if (v74)
  {
    v75 = (NSString *)objc_claimAutoreleasedReturnValue([v104 objectForKeyedSubscript:@"SCStreamPropertiesColorSpace"]);
    colorSpace = self->_colorSpace;
    self->_colorSpace = v75;
  }

  v77 = (void *)objc_claimAutoreleasedReturnValue([v104 objectForKeyedSubscript:@"SCStreamPropertiesColorMatrix"]);

  if (v77)
  {
    v78 = (NSString *)objc_claimAutoreleasedReturnValue([v104 objectForKeyedSubscript:@"SCStreamPropertiesColorMatrix"]);
    colorMatrix = self->_colorMatrix;
    self->_colorMatrix = v78;
  }

  v80 = (void *)objc_claimAutoreleasedReturnValue([v104 objectForKeyedSubscript:@"SCStreamPropertiesContentScale"]);

  if (v80)
  {
    v81 = (void *)objc_claimAutoreleasedReturnValue([v104 objectForKeyedSubscript:@"SCStreamPropertiesContentScale"]);
    [v81 floatValue];
    self->_contentScale = v82;
  }

  v83 = (void *)objc_claimAutoreleasedReturnValue([v104 objectForKeyedSubscript:@"SCStreamPropertiesAudioEnabled"]);

  if (v83)
  {
    v84 = (void *)objc_claimAutoreleasedReturnValue([v104 objectForKeyedSubscript:@"SCStreamPropertiesAudioEnabled"]);
    self->_audioEnabled = [v84 BOOLValue];
  }

  v85 = (void *)objc_claimAutoreleasedReturnValue([v104 objectForKeyedSubscript:@"SCStreamPropertiesSampleRate"]);

  if (v85)
  {
    v86 = (void *)objc_claimAutoreleasedReturnValue([v104 objectForKeyedSubscript:@"SCStreamPropertiesSampleRate"]);
    self->_audioSampleRate = (int)[v86 intValue];
  }

  v87 = (void *)objc_claimAutoreleasedReturnValue([v104 objectForKeyedSubscript:@"SCStreamPropertiesChannelCount"]);

  if (v87)
  {
    v88 = (void *)objc_claimAutoreleasedReturnValue([v104 objectForKeyedSubscript:@"SCStreamPropertiesChannelCount"]);
    self->_audioChannelCount = (int)[v88 intValue];
  }

  v89 = (void *)objc_claimAutoreleasedReturnValue([v104 objectForKeyedSubscript:@"SCStreamPropertiesExcludeCallingClientAudio"]);

  if (v89)
  {
    v90 = (void *)objc_claimAutoreleasedReturnValue([v104 objectForKeyedSubscript:@"SCStreamPropertiesExcludeCallingClientAudio"]);
    self->_excludeCallingClientAudio = [v90 BOOLValue];
  }

  v91 = (void *)objc_claimAutoreleasedReturnValue([v104 objectForKeyedSubscript:@"SCStreamPropertiesBestResolution"]);
  if ([v91 BOOLValue])
  {
    v92 = (void *)objc_claimAutoreleasedReturnValue([v104 objectForKeyedSubscript:@"SCStreamPropertiesNominalResolution"]);
    v93 = [v92 BOOLValue];

    if (!v93)
    {
      v94 = 2LL;
      goto LABEL_58;
    }
  }

  else
  {
  }

  v95 = (void *)objc_claimAutoreleasedReturnValue([v104 objectForKeyedSubscript:@"SCStreamPropertiesNominalResolution"]);
  if ([v95 BOOLValue])
  {
    v96 = (void *)objc_claimAutoreleasedReturnValue([v104 objectForKeyedSubscript:@"SCStreamPropertiesBestResolution"]);
    v97 = [v96 BOOLValue];

    if (!v97)
    {
      v94 = 3LL;
      goto LABEL_58;
    }
  }

  else
  {
  }

  v94 = 1LL;
LABEL_58:
  self->_captureResolutionType = v94;
  v98 = (void *)objc_claimAutoreleasedReturnValue([v104 objectForKeyedSubscript:@"SCStreamPropertiesCaptureDynamicRange"]);

  if (v98)
  {
    v99 = (void *)objc_claimAutoreleasedReturnValue([v104 objectForKeyedSubscript:@"SCStreamPropertiesCaptureDynamicRange"]);
    self->_captureDynamicRange = [v99 unsignedIntValue];
  }

  v100 = (void *)objc_claimAutoreleasedReturnValue([v104 objectForKeyedSubscript:@"SCStreamPropertiesMicrophoneEnabled"]);

  if (v100)
  {
    v101 = (void *)objc_claimAutoreleasedReturnValue([v104 objectForKeyedSubscript:@"SCStreamPropertiesMicrophoneEnabled"]);
    self->_micEnabled = [v101 BOOLValue];
  }

  v102 = (void *)objc_claimAutoreleasedReturnValue([v104 objectForKeyedSubscript:@"SCStreamPropertiesShowMouseClicks"]);

  if (v102)
  {
    v103 = (void *)objc_claimAutoreleasedReturnValue([v104 objectForKeyedSubscript:@"SCStreamPropertiesShowMouseClicks"]);
    self->_showMouseClicks = [v103 BOOLValue];
  }
}

void sub_100009D78( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27)
{
}

void sub_100009D98(id a1, NSError *a2)
{
  id v2 = a2;
  if (v2)
  {
  }

  else if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136446466;
    uint64_t v4 = "-[RPMovieWriter dispatchedAppendVideoSampleBuffer:withWindowTransform:]_block_invoke";
    __int16 v5 = 1024;
    int v6 = 552;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d Asset writer output file removed",  (uint8_t *)&v3,  0x12u);
  }
}

void sub_100009E94(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
  }

  else
  {
    uint64_t v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 48);
    __int128 v6 = *(_OWORD *)(a1 + 72);
    v7[0] = *(_OWORD *)(a1 + 56);
    v7[1] = v6;
    v7[2] = *(_OWORD *)(a1 + 88);
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v4 appendInitialSampleBuffer:v5 withTransform:v7];
  }
}

uint64_t sub_10000ACE4(uint64_t a1)
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = *(unsigned __int8 *)(a1 + 56);
    *(_DWORD *)CMTime buf = 136446722;
    int v8 = "-[RPMovieWriter saveVideoToCameraRoll:sessionID:mixAudioTracks:handler:]_block_invoke";
    __int16 v9 = 1024;
    int v10 = 716;
    __int16 v11 = 1024;
    int v12 = v2;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d Start Save to Photos, mixAudioTracks=%d",  buf,  0x18u);
  }

  *(void *)(*(void *)(a1 + 32) + 120LL) = 0LL;
  uint64_t v3 = *(unsigned __int8 *)(a1 + 56);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10000AE1C;
  _OWORD v6[3] = &unk_100070F20;
  uint64_t v4 = *(void *)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  +[RPPhotosUtility exportVideoToPhotosAsynchronously:mixAudioTracks:completionHandler:]( &OBJC_CLASS___RPPhotosUtility,  "exportVideoToPhotosAsynchronously:mixAudioTracks:completionHandler:",  v4,  v3,  v6);
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0LL);
  }
  return result;
}

void sub_10000AE1C(uint64_t a1, void *a2, void *a3, double a4)
{
  id v7 = a2;
  id v8 = a3;
  if (v7)
  {
  }

  else if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136446722;
    int v10 = "-[RPMovieWriter saveVideoToCameraRoll:sessionID:mixAudioTracks:handler:]_block_invoke";
    __int16 v11 = 1024;
    int v12 = 730;
    __int16 v13 = 2048;
    double v14 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d Save to Photos Video saved to camera roll successfully. Video duration: %.2f seconds",  (uint8_t *)&v9,  0x1Cu);
  }

  [*(id *)(a1 + 32) setDurationInSeconds:a4];
}

void sub_10000B2E0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_10000B2F0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_10000B308( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

  ;
}

id sub_10000B344@<X0>(void *a1@<X0>, uint64_t x8_0@<X8>)
{
  *(void *)(v3 - _Block_object_dispose((const void *)(v1 - 80), 8) = x8_0;
  return [a1 code];
}

void sub_10000BBE8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }

  else
  {
    if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)CMTime buf = 136446466;
      __int16 v16 = "-[RPBroadcastExtensionProxy establishConnectionWithHandler:]_block_invoke";
      __int16 v17 = 1024;
      int v18 = 78;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d beginExtensionRequestWithInputItems returned",  buf,  0x12u);
    }

    dispatch_semaphore_t v7 = dispatch_semaphore_create(0LL);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 48) _extensionContextForUUID:v5]);
    int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 _auxiliaryConnection]);
    int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 remoteObjectProxy]);

    if (v10)
    {
      uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 72LL);
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_10000BE14;
      v13[3] = &unk_100070D30;
      int v12 = v7;
      double v14 = v12;
      [v10 setEndpoint:v11 completionHandler:v13];
      dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
    }

    else
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
    }
  }
}

uint64_t sub_10000BE14(uint64_t a1)
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136446466;
    uint64_t v4 = "-[RPBroadcastExtensionProxy establishConnectionWithHandler:]_block_invoke";
    __int16 v5 = 1024;
    int v6 = 87;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d Remote endpoint set.",  (uint8_t *)&v3,  0x12u);
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10000C180( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_10000C1A0(uint64_t a1)
{
  int v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v2);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained errorHandler]);

  if (v4)
  {
    id v5 = objc_loadWeakRetained(v2);
    int v6 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([v5 errorHandler]);
    dispatch_semaphore_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError _rpUserErrorForCode:userInfo:]( &OBJC_CLASS___NSError,  "_rpUserErrorForCode:userInfo:",  -5808LL,  &__NSDictionary0__struct));
    ((void (**)(void, void *))v6)[2](v6, v7);
  }

void sub_10000C270(id a1)
{
}

void sub_10000C7F4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_10000C814(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v4);
  int v6 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained errorHandler]);

  if (v6)
  {
    id v7 = objc_loadWeakRetained(v4);
    id v8 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([v7 errorHandler]);
    int v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSError _rpUserErrorForCode:userInfo:]( &OBJC_CLASS___NSError,  "_rpUserErrorForCode:userInfo:",  -5808LL,  &__NSDictionary0__struct));
    ((void (**)(void, void *))v8)[2](v8, v9);
  }
}

LABEL_18:
}
      }

      int v10 = [obj countByEnumeratingWithState:&v29 objects:v37 count:16];
      if (!v10)
      {
LABEL_20:

        int v6 = 0LL;
        id v5 = v26;
        a1 = v25;
        id v8 = v27;
        break;
      }
    }
  }

  CMTimeEpoch v24 = *(void *)(a1 + 32);
  if (v24) {
    (*(void (**)(uint64_t, void *, id))(v24 + 16))(v24, v8, v6);
  }
}
}

LABEL_9:
    int v12 = @"ACKNOWLEDGEMENT_ALERT_BODY_CAMERA";
    goto LABEL_10;
  }

  int v9 = 0LL;
  if (a4) {
    goto LABEL_7;
  }
LABEL_3:
  if (v5)
  {
    int v10 = self->_sessionType;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 stringByAppendingString:@" "]);
    if (v10 == 3)
    {
      int v12 = @"ACKNOWLEDGEMENT_BROADCAST_ALERT_BODY_MIC";
LABEL_10:
      double v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:]( &OBJC_CLASS___NSBundle,  "_rpLocalizedStringFromFrameworkBundleWithKey:",  v12));
      CMTime v15 = objc_claimAutoreleasedReturnValue([v11 stringByAppendingString:v14]);

      int v9 = (void *)v15;
      return v9;
    }

    goto LABEL_9;
  }

  return v9;
}

  if (*(id *)(a1 + 32) != v5)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    [v7 _srRemoveFile:*(void *)(a1 + 32) completion:&stru_100071D08];
  }

  +[RPPhotosUtility exportVideoToPhotosLibrary:completionHandler:]( &OBJC_CLASS___RPPhotosUtility,  "exportVideoToPhotosLibrary:completionHandler:",  v5,  *(void *)(a1 + 40));
}

uint64_t sub_1000110E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) purgeable:a3 urgency:a2]);
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446722;
    int v6 = "-[RPRecordingManager setUpMemoryPressureNotification]_block_invoke";
    __int16 v7 = 1024;
    int v8 = 212;
    __int16 v9 = 2112;
    uint64_t v10 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d purgeable=%@",  (uint8_t *)&v5,  0x1Cu);
  }

  return v3;
}

uint64_t sub_1000111C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) purge:a3 urgency:a2]);
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446722;
    int v6 = "-[RPRecordingManager setUpMemoryPressureNotification]_block_invoke";
    __int16 v7 = 1024;
    int v8 = 217;
    __int16 v9 = 2112;
    uint64_t v10 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d purge=%@",  (uint8_t *)&v5,  0x1Cu);
  }

  return v3;
}

void sub_1000112B0(id a1)
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136446466;
    int v2 = "-[RPRecordingManager setUpMemoryPressureNotification]_block_invoke";
    __int16 v3 = 1024;
    int v4 = 221;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d cancelling my purge!",  (uint8_t *)&v1,  0x12u);
  }

uint64_t sub_10001136C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) periodic:a3 urgency:a2]);
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446722;
    int v6 = "-[RPRecordingManager setUpMemoryPressureNotification]_block_invoke";
    __int16 v7 = 1024;
    int v8 = 225;
    __int16 v9 = 2112;
    uint64_t v10 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d periodic=%@",  (uint8_t *)&v5,  0x1Cu);
  }

  return v3;
}

void sub_100011BF8(uint64_t a1, int a2)
{
  if (a2)
  {
    if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136446466;
      int v5 = "-[RPRecordingManager applicationDisconnectedWithBundleID:withProcessIdentifier:]_block_invoke";
      __int16 v6 = 1024;
      int v7 = 344;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d client disconnected, successfully stopped active session",  (uint8_t *)&v4,  0x12u);
    }
  }

  else if (dword_100084688 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100043048();
  }

  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[RPClientManager sharedInstance](&OBJC_CLASS___RPClientManager, "sharedInstance"));
  [v3 removeClient:*(void *)(a1 + 32)];
}

void sub_100011DF8(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) getCallingConnectionClient]);
    uint64_t v4 = *(unsigned __int8 *)(a1 + 72);
    uint64_t v5 = *(unsigned __int8 *)(a1 + 73);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100011F04;
    v9[3] = &unk_100071190;
    uint64_t v6 = *(void *)(a1 + 40);
    id v10 = *(id *)(a1 + 48);
    objc_msgSend( v3,  "startInAppRecordingSessionWithContextID:windowSize:microphoneEnabled:cameraEnabled:withHandler:",  v6,  v4,  v5,  v9,  *(double *)(a1 + 56),  *(double *)(a1 + 64));
  }

  else
  {
    uint64_t v7 = *(void *)(a1 + 48);
    if (v7)
    {
      id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSError _rpUserErrorForCode:userInfo:]( &OBJC_CLASS___NSError,  "_rpUserErrorForCode:userInfo:",  -5803LL,  0LL));
      (*(void (**)(uint64_t, id, void, void))(v7 + 16))(v7, v8, 0LL, 0LL);
    }
  }

uint64_t sub_100011F04(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_100011FA8(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_100012118(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = v5;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }

  else
  {
    uint64_t v7 = *(void *)(a1 + 32);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1000121F8;
    v8[3] = &unk_100071208;
    id v9 = v5;
    id v10 = *(id *)(a1 + 40);
    +[RPAudioMixUtility mixAudioForMovie:finalMovieURL:outputFileType:withCompletionHandler:]( &OBJC_CLASS___RPAudioMixUtility,  "mixAudioForMovie:finalMovieURL:outputFileType:withCompletionHandler:",  v9,  v7,  AVFileTypeMPEG4,  v8);
  }
}

void sub_1000121F8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
  }

  else if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 136446722;
    uint64_t v6 = "-[RPRecordingManager stopInAppRecordingWithUrl:handler:]_block_invoke";
    __int16 v7 = 1024;
    int v8 = 531;
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d Success Mixed Audio to %@",  (uint8_t *)&v5,  0x1Cu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

uint64_t sub_1000123EC(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_100012538(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) getCallingConnectionClient]);
    uint64_t v4 = *(unsigned __int8 *)(a1 + 72);
    uint64_t v5 = *(unsigned __int8 *)(a1 + 73);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100012644;
    v9[3] = &unk_100071190;
    uint64_t v6 = *(void *)(a1 + 40);
    id v10 = *(id *)(a1 + 48);
    objc_msgSend( v3,  "startInAppCaptureSessionWithContextID:windowSize:microphoneEnabled:cameraEnabled:withHandler:",  v6,  v4,  v5,  v9,  *(double *)(a1 + 56),  *(double *)(a1 + 64));
  }

  else
  {
    uint64_t v7 = *(void *)(a1 + 48);
    if (v7)
    {
      id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSError _rpUserErrorForCode:userInfo:]( &OBJC_CLASS___NSError,  "_rpUserErrorForCode:userInfo:",  -5803LL,  0LL));
      (*(void (**)(uint64_t, id, void, void))(v7 + 16))(v7, v8, 0LL, 0LL);
    }
  }

uint64_t sub_100012644(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_1000126E8(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_1000127D4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_100012C84(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
}

void sub_1000130A8(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) getCallingConnectionClient]);
    uint64_t v4 = *(unsigned __int8 *)(a1 + 80);
    uint64_t v5 = *(unsigned __int8 *)(a1 + 81);
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1000131BC;
    v10[3] = &unk_100071190;
    id v11 = *(id *)(a1 + 56);
    objc_msgSend( v3,  "startInAppBroadcastSessionWithContextID:windowSize:microphoneEnabled:cameraEnabled:listenerEndpoint:withHandler:",  v6,  v4,  v5,  v7,  v10,  *(double *)(a1 + 64),  *(double *)(a1 + 72));
  }

  else
  {
    uint64_t v8 = *(void *)(a1 + 56);
    if (v8)
    {
      id v9 = (id)objc_claimAutoreleasedReturnValue( +[NSError _rpUserErrorForCode:userInfo:]( &OBJC_CLASS___NSError,  "_rpUserErrorForCode:userInfo:",  -5803LL,  0LL));
      (*(void (**)(uint64_t, id, void, void))(v8 + 16))(v8, v9, 0LL, 0LL);
    }
  }

void sub_1000131BC(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  if (v7)
  {
  }

  else if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136446466;
    id v10 = "-[RPRecordingManager startInAppBroadcastWithContextID:windowSize:microphoneEnabled:cameraEnabled:listenerEndpo"
          "int:withHandler:]_block_invoke";
    __int16 v11 = 1024;
    int v12 = 722;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d start broadcast successfull",  (uint8_t *)&v9,  0x12u);
  }

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id, uint64_t, uint64_t))(v8 + 16))(v8, v7, a3, a4);
  }
}

void sub_100013378(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
  }

  else if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446466;
    uint64_t v6 = "-[RPRecordingManager stopInAppBroadcastWithHandler:]_block_invoke";
    __int16 v7 = 1024;
    int v8 = 748;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d stop broadcast successfull",  (uint8_t *)&v5,  0x12u);
  }

  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
}

uint64_t sub_100013564(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_100013754(uint64_t a1, int a2)
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)CMTime buf = 136446466;
    int v12 = "-[RPRecordingManager startSystemRecordingWithContextID:windowSize:microphoneEnabled:cameraEnabled:withHandler:]_block_invoke";
    __int16 v13 = 1024;
    int v14 = 791;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d ",  buf,  0x12u);
  }

  if (a2)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) getCallingConnectionClient]);
    uint64_t v5 = *(unsigned __int8 *)(a1 + 72);
    uint64_t v6 = *(unsigned __int8 *)(a1 + 73);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1000138E4;
    v9[3] = &unk_100070D98;
    uint64_t v7 = *(void *)(a1 + 40);
    id v10 = *(id *)(a1 + 48);
    objc_msgSend( v4,  "startSystemRecordingSessionWithContextID:windowSize:microphoneEnabled:cameraEnabled:withHandler:",  v7,  v5,  v6,  v9,  *(double *)(a1 + 56),  *(double *)(a1 + 64));
  }

  else
  {
    uint64_t v8 = *(void *)(a1 + 48);
    if (!v8) {
      return;
    }
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSError _rpUserErrorForCode:userInfo:]( &OBJC_CLASS___NSError,  "_rpUserErrorForCode:userInfo:",  -5803LL,  0LL));
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v4);
  }
}

uint64_t sub_1000138E4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_100013988(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_100013A2C(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_100013BD0(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) getCallingConnectionClient]);
    uint64_t v4 = *(unsigned __int8 *)(a1 + 72);
    uint64_t v5 = *(unsigned __int8 *)(a1 + 73);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100013CDC;
    v9[3] = &unk_100071190;
    uint64_t v6 = *(void *)(a1 + 40);
    id v10 = *(id *)(a1 + 48);
    objc_msgSend( v3,  "startInAppClipSessionWithContextID:windowSize:microphoneEnabled:cameraEnabled:withHandler:",  v6,  v4,  v5,  v9,  *(double *)(a1 + 56),  *(double *)(a1 + 64));
  }

  else
  {
    uint64_t v7 = *(void *)(a1 + 48);
    if (v7)
    {
      id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSError _rpUserErrorForCode:userInfo:]( &OBJC_CLASS___NSError,  "_rpUserErrorForCode:userInfo:",  -5803LL,  0LL));
      (*(void (**)(uint64_t, id, void, void))(v7 + 16))(v7, v8, 0LL, 0LL);
    }
  }

uint64_t sub_100013CDC(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_100013E24(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_100013F98(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_100014058(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_1000143D0(id a1, BOOL a2)
{
  if (a2)
  {
    if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v2 = 136446466;
      id v3 = "-[RPRecordingManager stopAllActiveClients]_block_invoke";
      __int16 v4 = 1024;
      int v5 = 1046;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d stop all clients success",  (uint8_t *)&v2,  0x12u);
    }
  }

  else if (dword_100084688 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100043414();
  }

void sub_100014A80(id a1, NSError *a2, NSString *a3, double a4)
{
  int v5 = a2;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[RPConnectionManager sharedInstance](&OBJC_CLASS___RPConnectionManager, "sharedInstance"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 currentConnection]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[RPConnectionManager uniqueClientIdentifierWithPID:]( RPConnectionManager,  "uniqueClientIdentifierWithPID:",  [v7 processIdentifier]));
  if (v5)
  {
    int v9 = &__NSDictionary0__struct;
    uint64_t v10 = -5831LL;
  }

  else
  {
    if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136446722;
      __int16 v13 = "-[RPRecordingManager processSaveToPhotos:mixAudioTracks:ignoreDoNotDisturb:isClip:]_block_invoke";
      __int16 v14 = 1024;
      int v15 = 1093;
      __int16 v16 = 2048;
      double v17 = a4;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d Save to Photos Video saved to camera roll successfully. Video duration: %.2f seconds",  (uint8_t *)&v12,  0x1Cu);
    }

    uint64_t v10 = 0LL;
    int v9 = 0LL;
  }

  __int16 v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError _rpUserErrorForCode:userInfo:]( &OBJC_CLASS___NSError,  "_rpUserErrorForCode:userInfo:",  v10,  v9));
  +[RPReportingAgent reportSessionEnded:endReason:withServiceName:clientBundleId:]( &OBJC_CLASS___RPReportingAgent,  "reportSessionEnded:endReason:withServiceName:clientBundleId:",  2LL,  v11,  @"InAppRecording",  v8);
}

void sub_100014E10(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v8 = (void *)v7;
  if (!v6)
  {
    v27 = (void *)v7;
    uint64_t v25 = a1;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    id v26 = v5;
    id obj = v5;
    id v9 = [obj countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (!v9) {
      goto LABEL_20;
    }
    id v10 = v9;
    uint64_t v11 = *(void *)v30;
    uint64_t v12 = _kCFBundleDisplayNameKey;
    while (1)
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v30 != v11) {
          objc_enumerationMutation(obj);
        }
        __int16 v14 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)i);
        int v15 = (void *)objc_claimAutoreleasedReturnValue([v14 _plugIn]);
        __int16 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 containingUrl]);
        double v17 = (void *)objc_claimAutoreleasedReturnValue( +[RPImageUtility getImageDataFromExtensionContainingAppBundleUrl:]( &OBJC_CLASS___RPImageUtility,  "getImageDataFromExtensionContainingAppBundleUrl:",  v16));

        int v18 = (void *)objc_claimAutoreleasedReturnValue([v14 infoDictionary]);
        CMTime v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKey:v12]);

        id v20 = (void *)objc_claimAutoreleasedReturnValue([v14 identifier]);
        if (v20) {
          BOOL v21 = v19 == 0LL;
        }
        else {
          BOOL v21 = 1;
        }
        if (v21)
        {
        }

        else
        {

          if (v17)
          {
            id v22 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
            __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v14 identifier]);
            -[NSMutableDictionary setObject:forKey:](v22, "setObject:forKey:", v23, @"extBundleID");

            -[NSMutableDictionary setObject:forKey:](v22, "setObject:forKey:", v19, @"displayName");
            -[NSMutableDictionary setObject:forKey:](v22, "setObject:forKey:", v17, @"extAppImgData");
            [v27 addObject:v22];

            goto LABEL_18;
          }
        }

        if (dword_100084688 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)CMTime buf = 136446466;
          v34 = "-[RPRecordingManager getSystemBroadcastExtensionInfo:]_block_invoke";
          __int16 v35 = 1024;
          int v36 = 1285;
          _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  " [ERROR] %{public}s:%d Error getting broadcast extension info",  buf,  0x12u);
        }

void sub_100015270(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  uint64_t v3 = *(void *)(a1 + 32);
  __int16 v4 = *(void **)(v3 + 64);
  *(void *)(v3 + 64) = v2;

  [*(id *)(*(void *)(a1 + 32) + 56) invalidate];
  uint64_t v5 = objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",  *(void *)(a1 + 32),  "updateDelegateRecordingTimer:",  0LL,  1LL,  0.5));
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = v5;
}

void sub_100016674(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v30 = a3;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id obj = v5;
  id v6 = [v5 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v34;
    do
    {
      id v9 = 0LL;
      id v31 = v7;
      do
      {
        if (*(void *)v34 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)v9);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 extensionPointIdentifier]);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v10 _extensionBundle]);
        NSLog(@"NSExtensionPointIdentifier %@ _extensionBundle %@", v11, v12);

        if (!*(void *)(a1 + 32)
          || (__int16 v13 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]),
              unsigned int v14 = [v13 hasPrefix:*(void *)(a1 + 32)],
              v13,
              v14))
        {
          int v15 = (void *)objc_claimAutoreleasedReturnValue([v10 attributes]);
          __int16 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"NSExtensionActivationRule"]);
          uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSDictionary);
          if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0)
          {
            uint64_t v18 = v8;
            id v19 = v16;
            id v20 = v19;
            if (*(void *)(a1 + 40))
            {
              uint64_t v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:"));
              if (!v21) {
                goto LABEL_15;
              }
              id v22 = (void *)v21;
              __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:*(void *)(a1 + 40)]);
              unsigned int v24 = [v23 BOOLValue];

              if (!v24) {
                goto LABEL_15;
              }
            }

            if (*(void *)(a1 + 48))
            {
              uint64_t v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:"));
              if (v25)
              {
                id v26 = (void *)v25;
                v27 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:*(void *)(a1 + 48)]);
                unsigned __int8 v28 = [v27 BOOLValue];

                if ((v28 & 1) != 0)
                {
LABEL_15:

                  uint64_t v8 = v18;
                  id v7 = v31;
LABEL_20:

                  goto LABEL_21;
                }
              }
            }

            uint64_t v8 = v18;
            id v7 = v31;
          }

          else if (*(void *)(a1 + 40))
          {
            goto LABEL_20;
          }

          [*(id *)(a1 + 56) addObject:v10];
          goto LABEL_20;
        }

LABEL_21:
        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    }

    while (v7);
  }

  uint64_t v29 = *(void *)(a1 + 64);
  if (v29) {
    (*(void (**)(uint64_t, void, id))(v29 + 16))(v29, *(void *)(a1 + 56), v30);
  }
}

BOOL sub_100016A3C(int a1)
{
  return a1 == 8;
}

BOOL sub_100016A48(int a1)
{
  return a1 != 8;
}

void sub_100016ED0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_100016EF4(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained applicationStateDidChange:v3];
}

LABEL_14:
  a4 = v10;
  if (-[RPSession sessionState](self, "sessionState") == 1)
  {
LABEL_15:
    uint64_t v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[RPClipSession dispatchCaptureQueue](self, "dispatchCaptureQueue"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100017C04;
    v14[3] = &unk_1000713A8;
    v14[4] = self;
    int v15 = v8;
    uint64_t v17 = a4;
    __int16 v16 = v9;
    dispatch_async(v12, v14);

    goto LABEL_18;
  }

  if (v9)
  {
    __int16 v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError _rpUserErrorForCode:userInfo:]( &OBJC_CLASS___NSError,  "_rpUserErrorForCode:userInfo:",  -5829LL,  0LL));
    v9[2](v9, v13);
  }

void sub_100017C04(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(_BYTE *)(v2 + 368))
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSError _rpUserErrorForCode:userInfo:]( &OBJC_CLASS___NSError,  "_rpUserErrorForCode:userInfo:",  -5836LL,  0LL));
    objc_msgSend(*(id *)(a1 + 32), "reportSummaryEvent:recordedFileSize:", objc_msgSend(v3, "code"), 0);
    uint64_t v4 = *(void *)(a1 + 48);
    if (v4) {
      (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);
    }
  }

  else
  {
    *(_BYTE *)(v2 + 36_Block_object_dispose((const void *)(v1 - 80), 8) = 1;
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(a1 + 40);
    id v7 = *(void **)(v5 + 352);
    double v8 = *(double *)(a1 + 56);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100017D54;
    v9[3] = &unk_100071380;
    void v9[4] = v5;
    id v10 = v6;
    id v11 = *(id *)(a1 + 48);
    [v7 exportClipToURL:v10 duration:v9 completionHandler:v8];
  }

void sub_100017D54(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(_BYTE *)(*(void *)(a1 + 32) + 368LL) = 0;
  id v5 = v3;
  objc_msgSend( *(id *)(a1 + 32),  "reportSummaryEvent:recordedFileSize:",  objc_msgSend(v3, "code"),  +[RPSession getFileSizeForURL:](RPSession, "getFileSizeForURL:", *(void *)(a1 + 40)));
  uint64_t v4 = *(void *)(a1 + 48);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);
  }
}

void sub_100017E60(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) sessionState];
  id v3 = *(opaqueCMSampleBuffer **)(a1 + 40);
  if (v2 == 1)
  {
    ImageBuffer = CMSampleBufferGetImageBuffer(v3);
    id v5 = ImageBuffer;
    id v6 = *(void **)(a1 + 32);
    if (v6[45]
      || (size_t Width = CVPixelBufferGetWidth(ImageBuffer),
          [v6 createEncodingSessionWithWidth:Width withHeight:CVPixelBufferGetHeight(v5)],
          *(void *)(*(void *)(a1 + 32) + 360LL)))
    {
      CMSampleBufferGetPresentationTimeStamp(&v12, *(CMSampleBufferRef *)(a1 + 40));
      double v8 = *(OpaqueVTCompressionSession **)(*(void *)(a1 + 32) + 360LL);
      CMTime presentationTimeStamp = v12;
      CMTime v10 = kCMTimeInvalid;
      if (VTCompressionSessionEncodeFrame(v8, v5, &presentationTimeStamp, &v10, 0LL, 0LL, 0LL)) {
        BOOL v9 = dword_100084688 > 2;
      }
      else {
        BOOL v9 = 1;
      }
      if (!v9 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10004390C();
      }
    }

    CFRelease(*(CFTypeRef *)(a1 + 40));
  }

  else
  {
    CFRelease(v3);
  }

void sub_100018180(void *a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  id v7 = a1;
  double v8 = v7;
  if (a3)
  {
  }

  else if (v7)
  {
    [v7 appendVideoSampleBuffer:a5];
  }

  else if (dword_100084688 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100043A04();
  }
}

void sub_1000183C0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "RPClipSession: startCapture has failed. Error: %@",  (uint8_t *)&v11,  0xCu);
    }

    [*(id *)(a1 + 32) setSessionState:3];
    uint64_t v4 = *(void *)(a1 + 40);
    if (v4)
    {
      id v5 = *(void (**)(void))(v4 + 16);
LABEL_10:
      v5();
    }
  }

  else
  {
    *(void *)(*(void *)(a1 + 32) + 360LL) = 0LL;
    id v6 = objc_alloc(&OBJC_CLASS___RPClipWriter);
    [*(id *)(a1 + 32) windowSize];
    id v7 = -[RPClipWriter initWithWindowSize:](v6, "initWithWindowSize:");
    uint64_t v8 = *(void *)(a1 + 32);
    BOOL v9 = *(void **)(v8 + 352);
    *(void *)(v8 + 352) = v7;

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "RPClipSession: startCapture has started successfully",  (uint8_t *)&v11,  2u);
    }

    [*(id *)(a1 + 32) setSessionState:1];
    uint64_t v10 = *(void *)(a1 + 40);
    if (v10)
    {
      id v5 = *(void (**)(void))(v10 + 16);
      goto LABEL_10;
    }
  }
}

void sub_1000186CC(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend( *(id *)(a1 + 40),  "notifyClientSessionDidStopWithError:movieURL:showAlert:",  objc_msgSend(*(id *)(a1 + 32), "code"),  0,  1);
}

void sub_100018790(id a1)
{
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.replaykit.ClipSessionDispatchQueue", 0LL);
  unsigned int v2 = (void *)qword_1000846F0;
  qword_1000846F0 = (uint64_t)v1;
}

void sub_1000189C0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446722;
    id v7 = "-[RPClipSession handleResumeCaptureWithCompletionHandler:]_block_invoke";
    __int16 v8 = 1024;
    int v9 = 350;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d resume capture completed with Error: %@",  (uint8_t *)&v6,  0x1Cu);
  }

  if (v3) {
    uint64_t v4 = 3LL;
  }
  else {
    uint64_t v4 = 1LL;
  }
  [*(id *)(a1 + 32) setSessionState:v4];
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

void sub_100018DE0(uint64_t a1)
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136446466;
    unsigned int v2 = "-[RPClipSession handleDisplayWarning]_block_invoke";
    __int16 v3 = 1024;
    int v4 = 385;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d notifying client",  (uint8_t *)&v1,  0x12u);
  }

void sub_1000190BC(uint64_t a1)
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136446466;
    unsigned int v2 = "-[RPClipSession handleDeviceRestrictionWarning]_block_invoke";
    __int16 v3 = 1024;
    int v4 = 414;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d notifying client",  (uint8_t *)&v1,  0x12u);
  }

void sub_1000192C0(uint64_t a1)
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136446466;
    unsigned int v2 = "-[RPClipSession handleResumeContextIDFailure]_block_invoke";
    __int16 v3 = 1024;
    int v4 = 426;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d notifying client",  (uint8_t *)&v1,  0x12u);
  }

double sub_100019408()
{
  if ((byte_100084700 & 1) == 0)
  {
    mach_timebase_info(&info);
    LODWORD(v2) = info.numer;
    LODWORD(v3) = info.denom;
    *(double *)&qword_100084708 = (double)v2 / (double)v3 / 1000000000.0;
    __dmb(0xBu);
    byte_100084700 = 1;
  }

  double v0 = *(double *)&qword_100084708;
  return v0 * (double)(uint64_t)mach_absolute_time();
}

unint64_t sub_100019488(unint64_t result, unint64_t a2)
{
  if (a2) {
    return (unint64_t)(round((double)result / (double)a2) * (double)a2);
  }
  return result;
}

unint64_t sub_1000194A8(unint64_t result, unint64_t a2)
{
  if (result)
  {
    double v2 = (double)a2;
    double v3 = (double)result;
    double v4 = log10((double)result);
    double v5 = __exp10(v2 - ceil(v4));
    return (unint64_t)(round(v5 * v3) / v5);
  }

  return result;
}

Float64 sub_1000194F0(CMTime *a1)
{
  CMTime v2 = *a1;
  return CMTimeGetSeconds(&v2);
}

CMTime *sub_100019524@<X0>(Float64 a1@<X0>, CMTime *a2@<X8>)
{
  return CMTimeMakeWithSeconds(a2, a1, 1000000);
}

double sub_100019534( double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  if (a9 >= 0.5) {
    double v16 = pow(a9 * -2.0 + 2.0, 3.0) * -0.5 + 1.0;
  }
  else {
    double v16 = pow(a9, 3.0) * 4.0;
  }
  return a1 + v16 * (a5 - a1);
}

LABEL_19:
  __int128 v32 = (void *)objc_claimAutoreleasedReturnValue([v104 objectForKeyedSubscript:@"SCStreamPropertiesShowCursor"]);
  if (v32)
  {
    __int128 v33 = (void *)objc_claimAutoreleasedReturnValue([v104 objectForKeyedSubscript:@"SCStreamPropertiesShowCursor"]);
    self->_showCursor = [v33 BOOLValue];
  }

  __int128 v34 = (void *)objc_claimAutoreleasedReturnValue([v104 objectForKeyedSubscript:@"SCStreamPropertiesBackgroundColorR"]);
  [v34 doubleValue];
  __int128 v36 = v35;
  v37 = (void *)objc_claimAutoreleasedReturnValue([v104 objectForKeyedSubscript:@"SCStreamPropertiesBackgroundColorG"]);
  [v37 doubleValue];
  v39 = v38;
  v40 = (void *)objc_claimAutoreleasedReturnValue([v104 objectForKeyedSubscript:@"SCStreamPropertiesBackgroundColorB"]);
  [v40 doubleValue];
  v42 = v41;
  v43 = (void *)objc_claimAutoreleasedReturnValue([v104 objectForKeyedSubscript:@"SCStreamPropertiesBackgroundColorA"]);
  [v43 doubleValue];
  self->_backgroundColor = -[SCReporting getColorFromRGBA:withGreen:withBlue:withAlpha:]( self,  "getColorFromRGBA:withGreen:withBlue:withAlpha:",  v36,  v39,  v42,  v44);

  v45 = (void *)objc_claimAutoreleasedReturnValue([v104 objectForKeyedSubscript:@"SCStreamPropertiesSourceRectX"]);
  if (v45)
  {
    v46 = objc_claimAutoreleasedReturnValue([v104 objectForKeyedSubscript:@"SCStreamPropertiesSourceRectY"]);
    if (v46)
    {
      v47 = (void *)v46;
      v48 = objc_claimAutoreleasedReturnValue([v104 objectForKeyedSubscript:@"SCStreamPropertiesSourceRectWidth"]);
      if (v48)
      {
        v49 = (void *)v48;
        v50 = (void *)objc_claimAutoreleasedReturnValue([v104 objectForKeyedSubscript:@"SCStreamPropertiesSourceRectHeight"]);

        if (v50)
        {
          v51 = (void *)objc_claimAutoreleasedReturnValue([v104 objectForKeyedSubscript:@"SCStreamPropertiesSourceRectX"]);
          [v51 floatValue];
          v52 = (void *)objc_claimAutoreleasedReturnValue([v104 objectForKeyedSubscript:@"SCStreamPropertiesSourceRectY"]);
          [v52 floatValue];
          v53 = (void *)objc_claimAutoreleasedReturnValue([v104 objectForKeyedSubscript:@"SCStreamPropertiesSourceRectWidth"]);
          [v53 floatValue];
          v55 = v54;
          v56 = (void *)objc_claimAutoreleasedReturnValue([v104 objectForKeyedSubscript:@"SCStreamPropertiesSourceRectHeight"]);
          [v56 floatValue];
          v58 = v57;

          self->_inputSurfacesize_t Width = (uint64_t)v55;
          self->_inputSurfaceHeight = (uint64_t)v58;
        }

        goto LABEL_28;
      }
    }
  }

LABEL_28:
  v59 = (void *)objc_claimAutoreleasedReturnValue([v104 objectForKeyedSubscript:@"SCStreamPropertiesDestinationRectX"]);
  v60 = v104;
  if (!v59) {
    goto LABEL_35;
  }
  v61 = objc_claimAutoreleasedReturnValue([v104 objectForKeyedSubscript:@"SCStreamPropertiesDestinationRectY"]);
  if (!v61) {
    goto LABEL_34;
  }
  v62 = (void *)v61;
  v63 = objc_claimAutoreleasedReturnValue([v104 objectForKeyedSubscript:@"SCStreamPropertiesDestinationRectWidth"]);
  if (!v63)
  {

LABEL_34:
    v60 = v104;
    goto LABEL_35;
  }

  v64 = (void *)v63;
  v65 = (void *)objc_claimAutoreleasedReturnValue([v104 objectForKeyedSubscript:@"SCStreamPropertiesDestinationRectHeight"]);

  v60 = v104;
  if (v65)
  {
    v66 = (void *)objc_claimAutoreleasedReturnValue([v104 objectForKeyedSubscript:@"SCStreamPropertiesDestinationRectX"]);
    [v66 floatValue];
    v67 = (void *)objc_claimAutoreleasedReturnValue([v104 objectForKeyedSubscript:@"SCStreamPropertiesDestinationRectY"]);
    [v67 floatValue];
    v68 = (void *)objc_claimAutoreleasedReturnValue([v104 objectForKeyedSubscript:@"SCStreamPropertiesDestinationRectWidth"]);
    [v68 floatValue];
    v70 = v69;
    v71 = (void *)objc_claimAutoreleasedReturnValue([v104 objectForKeyedSubscript:@"SCStreamPropertiesDestinationRectHeight"]);
    [v71 floatValue];
    v73 = v72;

    v60 = v104;
    self->_destSurfacesize_t Width = (uint64_t)v70;
    self->_destSurfaceHeight = (uint64_t)v73;
  }

void sub_10001C6D0(id a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  [v1 getUUIDBytes:&unk_100084710];
}

uint64_t sub_10001D024(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (a2) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(v3 + 16))(v3, 0LL, a2);
  }
  else {
    return (*(uint64_t (**)(uint64_t, void))(v3 + 16))(v3, *(void *)(a1 + 32));
  }
}

void sub_10001D4D4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) status];
  if (v2 == (id)5)
  {
    *(_DWORD *)int v6 = 136446466;
    *(void *)&v6[4] = "+[RPAudioMixUtility mixAudioForMovie:finalMovieURL:outputFileType:withCompletionHandler:]_block_invoke";
    *(_WORD *)&v6[12] = 1024;
    *(_DWORD *)&v6[14] = 72;
    uint64_t v3 = " [INFO] %{public}s:%d AVAssetExportSessionStatusCancelled";
    goto LABEL_9;
  }

  if (v2 == (id)4)
  {
    *(_DWORD *)int v6 = 136446466;
    *(void *)&v6[4] = "+[RPAudioMixUtility mixAudioForMovie:finalMovieURL:outputFileType:withCompletionHandler:]_block_invoke";
    *(_WORD *)&v6[12] = 1024;
    *(_DWORD *)&v6[14] = 67;
    uint64_t v3 = " [INFO] %{public}s:%d AVAssetExportSessionFailed";
LABEL_9:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v3, v6, 0x12u);
LABEL_10:
    uint64_t v4 = *(void *)(a1 + 40);
    double v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSError _rpUserErrorForCode:userInfo:]( &OBJC_CLASS___NSError,  "_rpUserErrorForCode:userInfo:",  -5818LL,  0LL,  *(_OWORD *)v6,  *(void *)&v6[16]));
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

    return;
  }

  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)int v6 = 136446466;
    *(void *)&v6[4] = "+[RPAudioMixUtility mixAudioForMovie:finalMovieURL:outputFileType:withCompletionHandler:]_block_invoke";
    *(_WORD *)&v6[12] = 1024;
    *(_DWORD *)&v6[14] = 77;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d AVAssetExportSession returned with no errors",  v6,  0x12u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

LABEL_6:
  __int16 v10 = v9;
  return v10;
}

  return a3 != 0;
}

LABEL_7:
  return v4;
}

void sub_10001EE54(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100043FC8(a2, v3);
  }
}

void sub_10001EF40(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100044030(a2, v3);
  }
}

void sub_10001F010(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100044098(a2, v3);
  }
}

void sub_10001F0E0(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100044100(a2, v3);
  }
}

void sub_10001F238(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100044168(a2, v3);
  }
}

void sub_10001F390(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000441D0(a2, v3);
  }
}

void sub_10001F460(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100044238(a2, v3);
  }
}

void sub_10001F530(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000442A0(a2, v3);
  }
}

void sub_10001F5F0(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100044308(a2, v3);
  }
}

void sub_10001F6C0(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100044370(a2, v3);
  }
}

void sub_10001F75C(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS___RPMultipleClientProxy);
  id v2 = (void *)qword_100084728;
  qword_100084728 = (uint64_t)v1;
}

void sub_10001F974(_Unwind_Exception *a1)
{
}

void sub_10001FA44(_Unwind_Exception *a1)
{
}

void sub_10001FBDC(_Unwind_Exception *a1)
{
}

void sub_10001FC04(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000443D8(a2, v3);
  }
}

void sub_10001FDD8(_Unwind_Exception *a1)
{
}

void sub_10001FE00(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100044440(a2, v3);
  }
}

void sub_10001FFC4(_Unwind_Exception *a1)
{
}

void sub_10001FFEC(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000444A8(a2, v3);
  }
}

void sub_1000201B4(_Unwind_Exception *a1)
{
}

void sub_1000201DC(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100044510(a2, v3);
  }
}

void sub_10002039C(_Unwind_Exception *a1)
{
}

void sub_1000203C4(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100044578(a2, v3);
  }
}

id sub_10002052C(void *a1, const char *a2)
{
  return [a1 code];
}

  ;
}

void sub_100020540( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_100020590(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS___RPClientManager);
  id v2 = (void *)qword_100084738;
  qword_100084738 = (uint64_t)v1;
}

void sub_1000208FC(id a1, BOOL a2)
{
  if (dword_100084688 <= 1)
  {
    BOOL v2 = a2;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = 136446722;
      uint64_t v4 = "-[RPClientManager removeClient:]_block_invoke";
      __int16 v5 = 1024;
      int v6 = 57;
      __int16 v7 = 1024;
      BOOL v8 = v2;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d stop current active session ended with success:%d",  (uint8_t *)&v3,  0x18u);
    }
  }

LABEL_16:
  return v6;
}

LABEL_11:
  return v6;
}

  return v8;
}

  return (char)v6;
}

void sub_100021178(_Unwind_Exception *a1)
{
}

void sub_1000211A0(uint64_t a1, char a2)
{
  unsigned int v3 = dword_100084688;
  if ((a2 & 1) == 0)
  {
    if (dword_100084688 <= 2)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100044648();
      }
      unsigned int v3 = dword_100084688;
    }

    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
  }

  if (v3 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136446466;
    __int16 v5 = "-[RPClientManager stopAllClientsWithHandler:]_block_invoke";
    __int16 v6 = 1024;
    int v7 = 127;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d leave stop group",  (uint8_t *)&v4,  0x12u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t sub_1000212A8(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    if (dword_100084688 <= 1)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v3 = 136446466;
        int v4 = "-[RPClientManager stopAllClientsWithHandler:]_block_invoke";
        __int16 v5 = 1024;
        int v6 = 136;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d all clients stopped",  (uint8_t *)&v3,  0x12u);
      }

      uint64_t result = *(void *)(a1 + 32);
    }

    return (*(uint64_t (**)(uint64_t, void))(result + 16))( result,  *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL));
  }

  return result;
}

id sub_1000213D8()
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v3 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "RPConnectionManager: RPDaemonRun:",  v3,  2u);
  }

  uint64_t v0 = objc_claimAutoreleasedReturnValue(+[RPConnectionManager sharedInstance](&OBJC_CLASS___RPConnectionManager, "sharedInstance"));
  uint64_t v1 = (void *)qword_100084748;
  qword_100084748 = v0;

  return [(id)qword_100084748 finishStartup];
}

void sub_1000214A8(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___RPConnectionManager);
  BOOL v2 = (void *)qword_100084750;
  qword_100084750 = (uint64_t)v1;
}

void sub_100021A2C(id a1)
{
  dispatch_queue_t v1 = dispatch_queue_create("com.replaykit.connectionManagerQueue", 0LL);
  BOOL v2 = (void *)qword_100084760;
  qword_100084760 = (uint64_t)v1;
}

void sub_100021E48(uint64_t a1)
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)CMTime buf = 136446466;
    BOOL v8 = "-[RPConnectionManager processNewConnection:]_block_invoke";
    __int16 v9 = 1024;
    int v10 = 201;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d connection INTERRUPTED",  buf,  0x12u);
  }

  BOOL v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) connectionManagerQueue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100021F7C;
  block[3] = &unk_100071758;
  int v3 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v5 = v3;
  int v6 = *(_DWORD *)(a1 + 48);
  dispatch_sync(v2, block);
}

id sub_100021F7C(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) applicationDisconnectedWithBundleID:*(void *)(a1 + 40) withProcessIdentifier:*(unsigned int *)(a1 + 48)];
}

void sub_100021F90(uint64_t a1)
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)CMTime buf = 136446466;
    BOOL v8 = "-[RPConnectionManager processNewConnection:]_block_invoke_2";
    __int16 v9 = 1024;
    int v10 = 207;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d connection INVALID",  buf,  0x12u);
  }

  BOOL v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) connectionManagerQueue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000220C4;
  block[3] = &unk_100071758;
  int v3 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v5 = v3;
  int v6 = *(_DWORD *)(a1 + 48);
  dispatch_sync(v2, block);
}

id sub_1000220C4(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) applicationDisconnectedWithBundleID:*(void *)(a1 + 40) withProcessIdentifier:*(unsigned int *)(a1 + 48)];
}

id sub_1000220D8(void *a1)
{
  return [*(id *)(a1[4] + 16) connectionManagerDidAcceptNewConnection:a1[5] bundleIdentifier:a1[6]];
}

void sub_1000222E0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)CMTime buf = 136446466;
    id v12 = "-[RPConnectionManager stopAndDiscardInAppRecordingFromFilePermissionErrorWithHandler:]_block_invoke";
    __int16 v13 = 1024;
    int v14 = 236;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d stopped recording from file permissions error",  buf,  0x12u);
  }

  int v7 = *(void **)(a1 + 40);
  BOOL v8 = *(void **)(*(void *)(a1 + 32) + 16LL);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10002241C;
  v9[3] = &unk_1000717A8;
  id v10 = v7;
  [v8 discardInAppRecordingWithHandler:v9];
}

void sub_10002241C(uint64_t a1)
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136446466;
    id v5 = "-[RPConnectionManager stopAndDiscardInAppRecordingFromFilePermissionErrorWithHandler:]_block_invoke";
    __int16 v6 = 1024;
    int v7 = 238;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d discarded recording from file permissions error",  (uint8_t *)&v4,  0x12u);
  }

  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSError _rpUserErrorForCode:userInfo:]( &OBJC_CLASS___NSError,  "_rpUserErrorForCode:userInfo:",  -5835LL,  0LL));
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);
}

void sub_100022614(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)dispatch_queue_t v1 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "RPConnectionManager: stopCurrentActiveSessionWithHandler completed",  v1,  2u);
  }

void sub_10002274C(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)dispatch_queue_t v1 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "RPConnectionManager: stopAllActiveClients completed",  v1,  2u);
  }

void sub_1000228AC(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)dispatch_queue_t v1 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "RPConnectionManager: getSystemBroadcastExtensionInfo completed",  v1,  2u);
  }

void sub_100022A0C(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)dispatch_queue_t v1 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "RPConnectionManager: setBroadcastURL completed",  v1,  2u);
  }

void sub_100022BB8(uint64_t a1)
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136446466;
    uint64_t v2 = "-[RPConnectionManager updateProcessIDForAudioCaptureWithPID:]_block_invoke";
    __int16 v3 = 1024;
    int v4 = 288;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d completed",  (uint8_t *)&v1,  0x12u);
  }

void sub_100022DD4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  __int16 v3 = *(void **)(*(void *)(a1 + 32) + 16LL);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 72);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 73);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100022E74;
  _OWORD v6[3] = &unk_100071190;
  id v7 = *(id *)(a1 + 48);
  objc_msgSend( v3,  "startInAppRecordingWithContextID:windowSize:microphoneEnabled:cameraEnabled:withHandler:",  v2,  v4,  v5,  v6,  *(double *)(a1 + 56),  *(double *)(a1 + 64));
}

void sub_100022E74(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int16 v9 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "RPConnectionManager: startInAppRecordingWithContextID completed",  v9,  2u);
  }

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id, uint64_t, uint64_t))(v8 + 16))(v8, v7, a3, a4);
  }
}

void sub_100023094(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16LL);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10002310C;
  v3[3] = &unk_100071190;
  id v4 = *(id *)(a1 + 48);
  [v2 resumeInAppRecordingWithWindowLayerContextID:v1 completionHandler:v3];
}

void sub_10002310C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136446466;
    id v10 = "-[RPConnectionManager resumeInAppRecordingWithWindowLayerContextID:completionHandler:]_block_invoke_2";
    __int16 v11 = 1024;
    int v12 = 311;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d completed",  (uint8_t *)&v9,  0x12u);
  }

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id, uint64_t, uint64_t))(v8 + 16))(v8, v7, a3, a4);
  }
}

void sub_100023308(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 40);
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16LL);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100023378;
  v3[3] = &unk_1000711E0;
  id v4 = v1;
  [v2 stopInAppRecordingWithHandler:v3];
}

void sub_100023378(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "RPConnectionManager: stopInAppRecordingWithHandler completed",  v8,  2u);
  }

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
}

id sub_100023514(uint64_t a1)
{
  return [*(id *)(a1 + 32) stopAndDiscardInAppRecordingFromFilePermissionErrorWithHandler:*(void *)(a1 + 40)];
}

void sub_1000236CC(uint64_t a1)
{
  uint64_t v8 = 0LL;
  int v9 = &v8;
  uint64_t v10 = 0x2020000000LL;
  id v11 = [*(id *)(a1 + 32) consumeSandboxExtensionToken:*(void *)(a1 + 40)];
  if (v9[3] == -1)
  {
    [*(id *)(a1 + 32) stopAndDiscardInAppRecordingFromFilePermissionErrorWithHandler:*(void *)(a1 + 56)];
  }

  else
  {
    uint64_t v2 = *(void *)(a1 + 32);
    __int16 v3 = *(void **)(v2 + 16);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_1000237F0;
    v5[3] = &unk_100071820;
    void v5[4] = v2;
    uint64_t v7 = &v8;
    uint64_t v4 = *(void *)(a1 + 48);
    id v6 = *(id *)(a1 + 56);
    [v3 stopInAppRecordingWithUrl:v4 handler:v5];
  }

  _Block_object_dispose(&v8, 8);
}

void sub_1000237D8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_1000237F0(uint64_t a1, void *a2)
{
  id v3 = a2;
  unsigned __int8 v4 = [*(id *)(a1 + 32) releaseSandboxExtensionHandle:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
  unsigned int v5 = dword_100084688;
  if ((v4 & 1) == 0 && dword_100084688 <= 2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000447CC();
    }
    unsigned int v5 = dword_100084688;
  }

  if (v5 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446466;
    uint64_t v7 = "-[RPConnectionManager stopInAppRecordingWithUrl:extensionToken:handler:]_block_invoke";
    __int16 v8 = 1024;
    int v9 = 354;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d completed",  (uint8_t *)&v6,  0x12u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_100023A18(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "RPConnectionManager: discardInAppRecordingWithHandler completed",  v1,  2u);
  }

void sub_100023B50(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "RPConnectionManager: pauseInAppRecording completed",  v1,  2u);
  }

void sub_100023D00(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 16LL);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 72);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 73);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100023DA0;
  _OWORD v6[3] = &unk_100071190;
  id v7 = *(id *)(a1 + 48);
  objc_msgSend( v3,  "startInAppCaptureWithContextID:windowSize:microphoneEnabled:cameraEnabled:withHandler:",  v2,  v4,  v5,  v6,  *(double *)(a1 + 56),  *(double *)(a1 + 64));
}

void sub_100023DA0(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v9 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "RPConnectionManager: startInAppCaptureWithContextID completed",  v9,  2u);
  }

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id, uint64_t, uint64_t))(v8 + 16))(v8, v7, a3, a4);
  }
}

void sub_100023F38(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 40);
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16LL);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100023FA8;
  v3[3] = &unk_100070D98;
  id v4 = v1;
  [v2 stopInAppCaptureWithHandler:v3];
}

void sub_100023FA8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "RPConnectionManager: stopInAppCaptureWithHandler completed",  v5,  2u);
  }

  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
}

void sub_100024100(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "RPConnectionManager: pauseInAppCapture completed",  v1,  2u);
  }

void sub_1000242E8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16LL);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100024360;
  v3[3] = &unk_100071190;
  id v4 = *(id *)(a1 + 48);
  [v2 resumeInAppCaptureWithWindowLayerContextID:v1 completionHandler:v3];
}

void sub_100024360(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136446466;
    uint64_t v10 = "-[RPConnectionManager resumeInAppCaptureWithWindowLayerContextID:completionHandler:]_block_invoke_2";
    __int16 v11 = 1024;
    int v12 = 420;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d completed",  (uint8_t *)&v9,  0x12u);
  }

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id, uint64_t, uint64_t))(v8 + 16))(v8, v7, a3, a4);
  }
}

void sub_1000246A4(void *a1)
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136446466;
    uint64_t v2 = "-[RPConnectionManager setupBroadcastWithHostBundleID:broadcastExtensionBundleID:broadcastConfigurationData:user"
         "Info:handler:]_block_invoke";
    __int16 v3 = 1024;
    int v4 = 435;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d completed",  (uint8_t *)&v1,  0x12u);
  }

void sub_1000248EC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  __int16 v3 = *(void **)(*(void *)(a1 + 32) + 16LL);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 80);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 81);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100024990;
  _OWORD v7[3] = &unk_100071190;
  uint64_t v6 = *(void *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  objc_msgSend( v3,  "startInAppBroadcastWithContextID:windowSize:microphoneEnabled:cameraEnabled:listenerEndpoint:withHandler:",  v2,  v4,  v5,  v6,  v7,  *(double *)(a1 + 64),  *(double *)(a1 + 72));
}

void sub_100024990(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v9 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "RPConnectionManager: startInAppBroadcastWithContextID completed",  v9,  2u);
  }

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id, uint64_t, uint64_t))(v8 + 16))(v8, v7, a3, a4);
  }
}

void sub_100024B28(uint64_t a1)
{
  int v1 = *(void **)(a1 + 40);
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16LL);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100024B98;
  v3[3] = &unk_100070D98;
  id v4 = v1;
  [v2 stopInAppBroadcastWithHandler:v3];
}

void sub_100024B98(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "RPConnectionManager: stopInAppBroadcastWithHandler completed",  v5,  2u);
  }

  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
}

void sub_100024CF0(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v1 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "RPConnectionManager: pauseInAppBroadcast completed",  v1,  2u);
  }

void sub_100024ED8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16LL);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100024F50;
  v3[3] = &unk_100071190;
  id v4 = *(id *)(a1 + 48);
  [v2 resumeInAppBroadcastWithWindowLayerContextID:v1 completionHandler:v3];
}

void sub_100024F50(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136446466;
    uint64_t v10 = "-[RPConnectionManager resumeInAppBroadcastWithWindowLayerContextID:completionHandler:]_block_invoke_2";
    __int16 v11 = 1024;
    int v12 = 485;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d completed",  (uint8_t *)&v9,  0x12u);
  }

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id, uint64_t, uint64_t))(v8 + 16))(v8, v7, a3, a4);
  }
}

void sub_100025274(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 16LL);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 72);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 73);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100025314;
  _OWORD v6[3] = &unk_100070D98;
  id v7 = *(id *)(a1 + 48);
  objc_msgSend( v3,  "startSystemRecordingWithContextID:windowSize:microphoneEnabled:cameraEnabled:withHandler:",  v2,  v4,  v5,  v6,  *(double *)(a1 + 56),  *(double *)(a1 + 64));
}

void sub_100025314(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "RPConnectionManager: startSystemRecordingWithContextID completed",  v5,  2u);
  }

  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
}

void sub_100025570(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 40);
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16LL);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1000255E0;
  v3[3] = &unk_100070D98;
  id v4 = v1;
  [v2 stopSystemRecordingWithHandler:v3];
}

void sub_1000255E0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "RPConnectionManager: stopSystemRecordingWithHandler completed",  v5,  2u);
  }

  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
}

void sub_100025840(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 40);
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16LL);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1000258B0;
  v3[3] = &unk_1000711E0;
  id v4 = v1;
  [v2 stopSystemRecordingWithURLHandler:v3];
}

void sub_1000258B0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "RPConnectionManager: stopSystemRecordingWithURLHandler completed",  v8,  2u);
  }

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
}

void sub_100025B00(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 16LL);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 72);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 73);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100025BA0;
  _OWORD v6[3] = &unk_100071190;
  id v7 = *(id *)(a1 + 48);
  objc_msgSend( v3,  "startClipBufferingWithContextID:windowSize:microphoneEnabled:cameraEnabled:withCompletionHandler:",  v2,  v4,  v5,  v6,  *(double *)(a1 + 56),  *(double *)(a1 + 64));
}

void sub_100025BA0(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136446466;
    uint64_t v10 = "-[RPConnectionManager startClipBufferingWithContextID:windowSize:microphoneEnabled:cameraEnabled:withCompletio"
          "nHandler:]_block_invoke_2";
    __int16 v11 = 1024;
    int v12 = 653;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d completed",  (uint8_t *)&v9,  0x12u);
  }

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id, uint64_t, uint64_t))(v8 + 16))(v8, v7, a3, a4);
  }
}

void sub_100025E00(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 40);
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16LL);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100025E70;
  v3[3] = &unk_100070D98;
  id v4 = v1;
  [v2 stopClipBufferingWithCompletionHandler:v3];
}

void sub_100025E70(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446466;
    id v6 = "-[RPConnectionManager stopClipBufferingWithCompletionHandler:]_block_invoke_2";
    __int16 v7 = 1024;
    int v8 = 666;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d completed",  (uint8_t *)&v5,  0x12u);
  }

  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
}

LABEL_5:
}

void sub_1000261B8(uint64_t a1)
{
  uint64_t v11 = 0LL;
  int v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  id v14 = [*(id *)(a1 + 32) consumeSandboxExtensionToken:*(void *)(a1 + 40)];
  if (v12[3] == -1)
  {
    uint64_t v6 = *(void *)(a1 + 56);
    if (v6)
    {
      __int16 v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError _rpUserErrorForCode:userInfo:]( &OBJC_CLASS___NSError,  "_rpUserErrorForCode:userInfo:",  -5835LL,  0LL));
      (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
    }
  }

  else
  {
    uint64_t v2 = *(void *)(a1 + 32);
    id v3 = *(void **)(v2 + 16);
    double v4 = *(double *)(a1 + 64);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100026318;
    v8[3] = &unk_100071820;
    void v8[4] = v2;
    uint64_t v10 = &v11;
    uint64_t v5 = *(void *)(a1 + 48);
    id v9 = *(id *)(a1 + 56);
    [v3 exportClipToURL:v5 duration:v8 completionHandler:v4];
  }

  _Block_object_dispose(&v11, 8);
}

void sub_100026300( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100026318(uint64_t a1, void *a2)
{
  id v3 = a2;
  unsigned __int8 v4 = [*(id *)(a1 + 32) releaseSandboxExtensionHandle:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
  unsigned int v5 = dword_100084688;
  if ((v4 & 1) == 0 && dword_100084688 <= 2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100044B14();
    }
    unsigned int v5 = dword_100084688;
  }

  if (v5 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136446466;
    int v8 = "-[RPConnectionManager exportClipToURL:duration:extensionToken:completionHandler:]_block_invoke";
    __int16 v9 = 1024;
    int v10 = 697;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d completed",  (uint8_t *)&v7,  0x12u);
  }

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
}

void sub_1000265CC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16LL);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100026644;
  v3[3] = &unk_100071190;
  id v4 = *(id *)(a1 + 48);
  [v2 resumeInAppClipWithWindowLayerContextID:v1 completionHandler:v3];
}

void sub_100026644(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136446466;
    int v10 = "-[RPConnectionManager resumeInAppClipWithWindowLayerContextID:completionHandler:]_block_invoke_2";
    __int16 v11 = 1024;
    int v12 = 711;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d completed",  (uint8_t *)&v9,  0x12u);
  }

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id, uint64_t, uint64_t))(v8 + 16))(v8, v7, a3, a4);
  }
}

void sub_100026818(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "RPConnectionManager: macApplicationDidResignActive",  v1,  2u);
  }

void sub_100026A00(void *a1)
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136446466;
    uint64_t v2 = "-[RPConnectionManager macApplicationDidBecomeActiveWithContextID:completionHandler:]_block_invoke";
    __int16 v3 = 1024;
    int v4 = 734;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d completed",  (uint8_t *)&v1,  0x12u);
  }

void sub_100026DB8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100026DD8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  __int16 v3 = *(void **)(v1 + 16);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100026E60;
  _OWORD v6[3] = &unk_100071820;
  void v6[4] = v1;
  __int128 v5 = *(_OWORD *)(a1 + 48);
  id v4 = (id)v5;
  __int128 v7 = v5;
  [v3 saveVideo:v2 handler:v6];
}

void sub_100026E60(uint64_t a1, void *a2)
{
  id v3 = a2;
  unsigned __int8 v4 = [*(id *)(a1 + 32) releaseSandboxExtensionHandle:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
  unsigned int v5 = dword_100084688;
  if ((v4 & 1) == 0 && dword_100084688 <= 2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100044C7C();
    }
    unsigned int v5 = dword_100084688;
  }

  if (v5 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446466;
    __int128 v7 = "-[RPConnectionManager saveVideo:extensionToken:handler:]_block_invoke";
    __int16 v8 = 1024;
    int v9 = 759;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d completed",  (uint8_t *)&v6,  0x12u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_1000270AC(void *a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "RPConnectionManager: saveVideoToCameraRoll completed",  v1,  2u);
  }

void sub_100027238(void *a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "RPConnectionManager: saveClipToCameraRoll completed",  v1,  2u);
  }

void sub_1000274F0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100027510(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(v1 + 16);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100027598;
  _OWORD v6[3] = &unk_100071820;
  void v6[4] = v1;
  __int128 v5 = *(_OWORD *)(a1 + 48);
  id v4 = (id)v5;
  __int128 v7 = v5;
  [v3 saveClipToCameraRoll:v2 handler:v6];
}

void sub_100027598(uint64_t a1, void *a2)
{
  id v3 = a2;
  unsigned __int8 v4 = [*(id *)(a1 + 32) releaseSandboxExtensionHandle:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
  unsigned int v5 = dword_100084688;
  if ((v4 & 1) == 0 && dword_100084688 <= 2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100044D6C();
    }
    unsigned int v5 = dword_100084688;
  }

  if (v5 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446466;
    __int128 v7 = "-[RPConnectionManager saveClipToCameraRoll:extensionToken:handler:]_block_invoke";
    __int16 v8 = 1024;
    int v9 = 798;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d completed",  (uint8_t *)&v6,  0x12u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

LABEL_15:
}

void sub_1000279E0(id a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  @"/System/Library/Frameworks/ReplayKit.framework"));
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithURL:](&OBJC_CLASS___NSBundle, "bundleWithURL:", v3));
  uint64_t v2 = (void *)qword_100084770;
  qword_100084770 = v1;
}

LABEL_8:
  if (([v8 isEqualToString:&stru_100073210] & 1) != 0
    || [v8 isEqualToString:@"$(PRODUCT_BUNDLE_IDENTIFIER)"])
  {
    goto LABEL_10;
  }

id sub_100028F44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) notifyClientWithOutputURL:a2 error:a3 withHandler:*(void *)(a1 + 40)];
}

id sub_100028F58(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) notifyClientWithOutputURL:0 error:a2 withHandler:*(void *)(a1 + 40)];
}

id sub_100028F6C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) notifyClientWithOutputURL:0 error:a2 withHandler:*(void *)(a1 + 40)];
}

id sub_100028F80(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) notifyClientWithOutputURL:0 error:a2 withHandler:*(void *)(a1 + 40)];
}

void sub_10002922C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
  }

  else
  {
    *(_DWORD *)(*(void *)(a1 + 32) + 56LL) = 2;
    unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 8) reportingAgent]);
    [v4 resetReportingMetrics];

    unsigned int v5 = *(void **)(a1 + 32);
    int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 clientBundleID]);
    [v5 beginPrivacyAccountingIntervalwithSource:v6 withDestination:0];
  }

  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, id, id, id))(v7 + 16))( v7,  v3,  [*(id *)(*(void *)(a1 + 32) + 8) cameraEnabled],  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "microphoneEnabled"));
  }
}

void sub_10002944C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
  }

  else
  {
    [*(id *)(a1 + 32) endPrivacyAccountingInterval];
  }

  *(_DWORD *)(*(void *)(a1 + 32) + 56LL) = 0;
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
}

void sub_1000296FC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136446722;
      uint64_t v7 = "-[RPClient resumeInAppRecordingWithContextID:completionHandler:]_block_invoke";
      __int16 v8 = 1024;
      int v9 = 497;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d Not resuming with error %@",  (uint8_t *)&v6,  0x1Cu);
    }

    *(_DWORD *)(*(void *)(a1 + 32) + 56LL) = 0;
    uint64_t v4 = *(void *)(a1 + 40);
    if (v4) {
      (*(void (**)(uint64_t, id, void, void))(v4 + 16))(v4, v3, 0LL, 0LL);
    }
  }

  else
  {
    if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136446466;
      uint64_t v7 = "-[RPClient resumeInAppRecordingWithContextID:completionHandler:]_block_invoke";
      __int16 v8 = 1024;
      int v9 = 503;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d Successfully resumed",  (uint8_t *)&v6,  0x12u);
    }

    uint64_t v5 = *(void *)(a1 + 40);
    if (v5) {
      (*(void (**)(uint64_t, void, id, id))(v5 + 16))( v5,  0,  [*(id *)(*(void *)(a1 + 32) + 8) cameraEnabled],  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "microphoneEnabled"));
    }
  }
}

uint64_t sub_1000299D4(uint64_t a1)
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136446466;
    uint64_t v4 = "-[RPClient discardInAppRecordingWithHandler:]_block_invoke";
    __int16 v5 = 1024;
    int v6 = 514;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d In app recording has been discared",  (uint8_t *)&v3,  0x12u);
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_100029D44(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
  }

  else
  {
    *(_DWORD *)(*(void *)(a1 + 32) + 56LL) = 1;
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 16) reportingAgent]);
    [v4 resetReportingMetrics];

    __int16 v5 = *(void **)(a1 + 32);
    int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 clientBundleID]);
    [v5 beginPrivacyAccountingIntervalwithSource:v6 withDestination:0];
  }

  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, id, id, id))(v7 + 16))( v7,  v3,  [*(id *)(*(void *)(a1 + 32) + 16) cameraEnabled],  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "microphoneEnabled"));
  }
}

void sub_100029F64(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
  }

  else
  {
    [*(id *)(a1 + 32) endPrivacyAccountingInterval];
  }

  *(_DWORD *)(*(void *)(a1 + 32) + 56LL) = 0;
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
}

void sub_10002A1F8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136446722;
      uint64_t v7 = "-[RPClient resumeInAppCaptureWithContextID:completionHandler:]_block_invoke";
      __int16 v8 = 1024;
      int v9 = 579;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d Not resuming with error %@",  (uint8_t *)&v6,  0x1Cu);
    }

    *(_DWORD *)(*(void *)(a1 + 32) + 56LL) = 0;
    uint64_t v4 = *(void *)(a1 + 40);
    if (v4) {
      (*(void (**)(uint64_t, id, void, void))(v4 + 16))(v4, v3, 0LL, 0LL);
    }
  }

  else
  {
    if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136446466;
      uint64_t v7 = "-[RPClient resumeInAppCaptureWithContextID:completionHandler:]_block_invoke";
      __int16 v8 = 1024;
      int v9 = 585;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d Successfully resumed",  (uint8_t *)&v6,  0x12u);
    }

    uint64_t v5 = *(void *)(a1 + 40);
    if (v5) {
      (*(void (**)(uint64_t, void, id, id))(v5 + 16))( v5,  0,  [*(id *)(*(void *)(a1 + 32) + 16) cameraEnabled],  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "microphoneEnabled"));
    }
  }
}

void sub_10002A890(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
  }

  else
  {
    *(_DWORD *)(*(void *)(a1 + 32) + 56LL) = 3;
    uint64_t v4 = *(id **)(a1 + 32);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4[3] broadcastHostBundleId]);
    int v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) clientBundleID]);
    [v4 beginPrivacyAccountingIntervalwithSource:v5 withDestination:v6];
  }

  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, id, id, id))(v7 + 16))( v7,  v3,  [*(id *)(*(void *)(a1 + 32) + 24) cameraEnabled],  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "microphoneEnabled"));
  }
}

void sub_10002AAB0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
  }

  else
  {
    [*(id *)(a1 + 32) endPrivacyAccountingInterval];
  }

  *(_DWORD *)(*(void *)(a1 + 32) + 56LL) = 0;
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
}

void sub_10002AD90(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136446722;
      uint64_t v7 = "-[RPClient resumeInAppBroadcastWithContextID:completionHandler:]_block_invoke";
      __int16 v8 = 1024;
      int v9 = 672;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d Not resuming with error %@",  (uint8_t *)&v6,  0x1Cu);
    }

    *(_DWORD *)(*(void *)(a1 + 32) + 56LL) = 0;
    uint64_t v4 = *(void *)(a1 + 40);
    if (v4) {
      (*(void (**)(uint64_t, id, void, void))(v4 + 16))(v4, v3, 0LL, 0LL);
    }
  }

  else
  {
    if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136446466;
      uint64_t v7 = "-[RPClient resumeInAppBroadcastWithContextID:completionHandler:]_block_invoke";
      __int16 v8 = 1024;
      int v9 = 678;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d Successfully resumed",  (uint8_t *)&v6,  0x12u);
    }

    uint64_t v5 = *(void *)(a1 + 40);
    if (v5) {
      (*(void (**)(uint64_t, void, id, id))(v5 + 16))( v5,  0,  [*(id *)(*(void *)(a1 + 32) + 24) cameraEnabled],  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "microphoneEnabled"));
    }
  }
}

void sub_10002B1DC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
  }

  else
  {
    *(_DWORD *)(*(void *)(a1 + 32) + 56LL) = 4;
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 32) reportingAgent]);
    [v4 resetReportingMetrics];

    uint64_t v5 = *(void **)(a1 + 32);
    int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 clientBundleID]);
    [v5 beginPrivacyAccountingIntervalwithSource:v6 withDestination:0];
  }

  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, id, id, id))(v7 + 16))( v7,  v3,  [*(id *)(*(void *)(a1 + 32) + 32) cameraEnabled],  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "microphoneEnabled"));
  }
}

void sub_10002B3FC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
  }

  else
  {
    [*(id *)(a1 + 32) endPrivacyAccountingInterval];
  }

  *(_DWORD *)(*(void *)(a1 + 32) + 56LL) = 0;
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
}

void sub_10002B690(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136446722;
      uint64_t v7 = "-[RPClient resumeInAppClipWithContextID:completionHandler:]_block_invoke";
      __int16 v8 = 1024;
      int v9 = 743;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d Not resuming with error %@",  (uint8_t *)&v6,  0x1Cu);
    }

    *(_DWORD *)(*(void *)(a1 + 32) + 56LL) = 0;
    uint64_t v4 = *(void *)(a1 + 40);
    if (v4) {
      (*(void (**)(uint64_t, id, void, void))(v4 + 16))(v4, v3, 0LL, 0LL);
    }
  }

  else
  {
    if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136446466;
      uint64_t v7 = "-[RPClient resumeInAppClipWithContextID:completionHandler:]_block_invoke";
      __int16 v8 = 1024;
      int v9 = 749;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d Successfully resumed",  (uint8_t *)&v6,  0x12u);
    }

    uint64_t v5 = *(void *)(a1 + 40);
    if (v5) {
      (*(void (**)(uint64_t, void, id, id))(v5 + 16))( v5,  0,  [*(id *)(*(void *)(a1 + 32) + 32) cameraEnabled],  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "microphoneEnabled"));
    }
  }
}

void sub_10002B994(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136446722;
      __int16 v8 = "-[RPClient exportClipToURL:duration:completionHandler:]_block_invoke";
      __int16 v9 = 1024;
      int v10 = 761;
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d Clip not exported with error %@",  (uint8_t *)&v7,  0x1Cu);
    }

    uint64_t v4 = *(void *)(a1 + 32);
    if (v4)
    {
      uint64_t v5 = *(void (**)(void))(v4 + 16);
LABEL_12:
      v5();
    }
  }

  else
  {
    if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136446466;
      __int16 v8 = "-[RPClient exportClipToURL:duration:completionHandler:]_block_invoke";
      __int16 v9 = 1024;
      int v10 = 766;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d Successfully clipped",  (uint8_t *)&v7,  0x12u);
    }

    uint64_t v6 = *(void *)(a1 + 32);
    if (v6)
    {
      uint64_t v5 = *(void (**)(void))(v6 + 16);
      goto LABEL_12;
    }
  }
}

void sub_10002BDA8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
  }

  else
  {
    *(_DWORD *)(*(void *)(a1 + 32) + 56LL) = 5;
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 40) reportingAgent]);
    [v4 resetReportingMetrics];

    uint64_t v5 = *(void **)(a1 + 32);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 clientBundleID]);
    [v5 beginPrivacyAccountingIntervalwithSource:v6 withDestination:0];
  }

  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);
  }
}

void sub_10002BFA0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
  }

  else
  {
    [*(id *)(a1 + 32) endPrivacyAccountingInterval];
  }

  *(_DWORD *)(*(void *)(a1 + 32) + 56LL) = 0;
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
}

void sub_10002C150(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
  }

  else
  {
    [*(id *)(a1 + 32) endPrivacyAccountingInterval];
  }

  *(_DWORD *)(*(void *)(a1 + 32) + 56LL) = 0;
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
}

uint64_t sub_10002CD54(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

LABEL_26:
    CFRelease(v22);
    uint64_t v25 = v23;
    if (!Mutable) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }

  __int128 v23 = 0;
  uint64_t v25 = 0;
  if (v21) {
    goto LABEL_26;
  }
  if (Mutable) {
LABEL_20:
  }
    CFRelease(Mutable);
LABEL_21:

  return v25;
}

void sub_10002DB6C(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___RPAngelProxy);
  uint64_t v2 = (void *)qword_100084780;
  qword_100084780 = (uint64_t)v1;
}

void sub_10002DBD4(id a1)
{
  dispatch_queue_t v1 = dispatch_queue_create("com.replaykitangel.angelProxyConnectionQueue", 0LL);
  uint64_t v2 = (void *)qword_100084790;
  qword_100084790 = (uint64_t)v1;
}

void sub_10002DC40(id a1)
{
  id v5 = (id)objc_claimAutoreleasedReturnValue( +[BSMutableServiceInterface interfaceWithIdentifier:]( &OBJC_CLASS___BSMutableServiceInterface,  "interfaceWithIdentifier:",  @"com.apple.ReplayKitAngel.session"));
  dispatch_queue_t v1 = (void *)objc_claimAutoreleasedReturnValue( +[BSObjCProtocol protocolForProtocol:]( &OBJC_CLASS___BSObjCProtocol,  "protocolForProtocol:",  &OBJC_PROTOCOL___RPAngelServerProtocol));
  [v5 setServer:v1];

  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[BSObjCProtocol protocolForProtocol:]( &OBJC_CLASS___BSObjCProtocol,  "protocolForProtocol:",  &OBJC_PROTOCOL___RPAngelClientProtocol));
  [v5 setClient:v2];

  [v5 setClientMessagingExpectation:0];
  id v3 = [v5 copy];
  uint64_t v4 = (void *)qword_1000847A0;
  qword_1000847A0 = (uint64_t)v3;
}

void sub_10002DEA8(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 connectionManagerQueue]);
  [v4 setTargetQueue:v5];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[BSServiceQuality userInitiated](&OBJC_CLASS___BSServiceQuality, "userInitiated"));
  [v4 setServiceQuality:v6];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) getBSServiceInterface]);
  [v4 setInterface:v7];

  [v4 setInterfaceTarget:*(void *)(a1 + 32)];
  [v4 setActivationHandler:&stru_1000719D0];
  [v4 setInterruptionHandler:&stru_1000719F0];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10002E15C;
  v8[3] = &unk_100071A18;
  void v8[4] = *(void *)(a1 + 32);
  [v4 setInvalidationHandler:v8];
}

void sub_10002DFB4(id a1, BSServiceConnectionContext *a2)
{
  uint64_t v2 = a2;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136446466;
    id v4 = "-[RPAngelProxy setupConnection]_block_invoke_2";
    __int16 v5 = 1024;
    int v6 = 86;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d Activation handler",  (uint8_t *)&v3,  0x12u);
  }
}

void sub_10002E084(id a1, BSServiceConnectionContext *a2)
{
  uint64_t v2 = a2;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136446466;
    id v4 = "-[RPAngelProxy setupConnection]_block_invoke";
    __int16 v5 = 1024;
    int v6 = 89;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d Interruption handler",  (uint8_t *)&v3,  0x12u);
  }

  -[BSServiceConnectionContext activate](v2, "activate");
}

void sub_10002E15C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446466;
    uint64_t v7 = "-[RPAngelProxy setupConnection]_block_invoke";
    __int16 v8 = 1024;
    int v9 = 93;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d Invalidation handler",  (uint8_t *)&v6,  0x12u);
  }

  uint64_t v4 = *(void *)(a1 + 32);
  __int16 v5 = *(void **)(v4 + 8);
  *(void *)(v4 + _Block_object_dispose(va, 8) = 0LL;
}

void sub_10002F374(uint64_t a1)
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)CMTime buf = 136446466;
    unsigned int v24 = "-[RPAppAudioCaptureManager startWithConfig:outputHandler:didStartHandler:]_block_invoke";
    __int16 v25 = 1024;
    int v26 = 267;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d ",  buf,  0x12u);
  }

  id v2 = objc_retainBlock(*(id *)(a1 + 40));
  uint64_t v4 = (id *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 32);
  __int16 v5 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = v2;

  *((void *)*v4 + 4) = malloc(0xA0uLL);
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 32LL);
  __int128 v7 = *(_OWORD *)(*(void *)(a1 + 32) + 72LL);
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 88LL);
  *(_OWORD *)(v6 + _Block_object_dispose(va, 8) = *(_OWORD *)(*(void *)(a1 + 32) + 56LL);
  *(void *)(v6 + 40) = v8;
  *(_OWORD *)(v6 + 24) = v7;
  uint64_t v9 = *(void *)(a1 + 32);
  *(_OWORD *)(v9 + 96) = *(_OWORD *)&kCMTimeInvalid.value;
  *(void *)(v9 + 112) = kCMTimeInvalid.epoch;
  if ((objc_msgSend( *v4,  "handleStartAudioQueueFailed:didFailHandler:",  AudioQueueNewInput( (const AudioStreamBasicDescription *)(*((void *)*v4 + 4) + 8),  (AudioQueueInputCallback)sub_10002F8C4,  *v4,  0,  0,  0x800u,  *((AudioQueueRef **)*v4 + 4)),  *(void *)(a1 + 48)) & 1) == 0)
  {
    if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)CMTime buf = 136446466;
      unsigned int v24 = "-[RPAppAudioCaptureManager startWithConfig:outputHandler:didStartHandler:]_block_invoke";
      __int16 v25 = 1024;
      int v26 = 287;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d Created Audio Queue Input",  buf,  0x12u);
    }

    int v10 = *(void **)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 56);
    id v12 = *(id *)(a1 + 64);
    if (v10)
    {
      id v13 = objc_msgSend(v10, "newAudioTapForAudioCaptureConfig:", v11, v12);
      if (v13)
      {
        id v14 = v13;
        if ((objc_msgSend( *(id *)(a1 + 32),  "handleStartAudioQueueFailed:didFailHandler:",  AudioQueueSetProperty( **(AudioQueueRef **)(*(void *)(a1 + 32) + 32),  0x71746F62u,  v13,  8u),  *(void *)(a1 + 48)) & 1) == 0)
        {
          if (dword_100084688 <= 1
            && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)CMTime buf = 136446466;
            unsigned int v24 = "-[RPAppAudioCaptureManager startWithConfig:outputHandler:didStartHandler:]_block_invoke";
            __int16 v25 = 1024;
            int v26 = 299;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d Successfully set Audio Queue Process Tap",  buf,  0x12u);
          }

          UInt32 ioDataSize = 40;
          if ((objc_msgSend( *(id *)(a1 + 32),  "handleStartAudioQueueFailed:didFailHandler:",  AudioQueueGetProperty( **(AudioQueueRef **)(*(void *)(a1 + 32) + 32),  0x61716674u,  (void *)(*(void *)(*(void *)(a1 + 32) + 32) + 8),  &ioDataSize),  *(void *)(a1 + 48)) & 1) == 0)
          {
            *(_DWORD *)(*((void *)*v4 + 4) + 136LL) = 4096;
            for (uint64_t i = 48LL; i != 128; i += 8LL)
            {
              AudioQueueAllocateBuffer( **((AudioQueueRef **)*v4 + 4),  *(_DWORD *)(*((void *)*v4 + 4) + 136LL),  (AudioQueueBufferRef *)(*((void *)*v4 + 4) + i));
              AudioQueueEnqueueBuffer( **((AudioQueueRef **)*v4 + 4),  *(AudioQueueBufferRef *)(*((void *)*v4 + 4) + i),  0,  0LL);
            }

            *(void *)(*(void *)(*(void *)(a1 + 32) + 32LL) + 144LL) = 0LL;
            *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 32LL) + 152LL) = 1;
            if ((objc_msgSend( *(id *)(a1 + 32),  "handleStartAudioQueueFailed:didFailHandler:",  AudioQueueAddPropertyListener( **(AudioQueueRef **)(*(void *)(a1 + 32) + 32),  0x6171726Eu,  (AudioQueuePropertyListenerProc)sub_10002FA1C,  *(void **)(a1 + 32)),  *(void *)(a1 + 48)) & 1) == 0)
            {
              uint64_t v16 = AudioQueueStart(**((AudioQueueRef **)*v4 + 4), 0LL);
              if ((_DWORD)v16 == -66665)
              {
                if (dword_100084688 <= 1
                  && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)CMTime buf = 136446466;
                  unsigned int v24 = "-[RPAppAudioCaptureManager startWithConfig:outputHandler:didStartHandler:]_block_invoke";
                  __int16 v25 = 1024;
                  int v26 = 330;
                  _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d AudioQueueStart retry after can not start yet error",  buf,  0x12u);
                }

                sleep(1u);
                uint64_t v16 = AudioQueueStart(**((AudioQueueRef **)*v4 + 4), 0LL);
              }

              if (([*(id *)(a1 + 32) handleStartAudioQueueFailed:v16 didFailHandler:*(void *)(a1 + 48)] & 1) == 0)
              {
                if (dword_100084688 <= 1
                  && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)CMTime buf = 136446466;
                  unsigned int v24 = "-[RPAppAudioCaptureManager startWithConfig:outputHandler:didStartHandler:]_block_invoke";
                  __int16 v25 = 1024;
                  int v26 = 338;
                  _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d Successfully started Audio Queue Recording",  buf,  0x12u);
                }

                id v17 = objc_retainBlock(*(id *)(a1 + 48));
                uint64_t v18 = *(void *)(a1 + 32);
                id v19 = *(void **)(v18 + 24);
                *(void *)(v18 + 24) = v17;
              }
            }
          }
        }

LABEL_33:
        return;
      }
    }

    else
    {
    }

    uint64_t v20 = *(void *)(a1 + 48);
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSError _rpUserErrorForCode:userInfo:]( &OBJC_CLASS___NSError,  "_rpUserErrorForCode:userInfo:",  -5803LL,  0LL));
    (*(void (**)(uint64_t, void *))(v20 + 16))(v20, v21);

    id v14 = 0LL;
    goto LABEL_33;
  }

void sub_10002F8C4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6)
{
  id v10 = a1;
  CMClockMakeHostTimeFromSystemUnits(&v23, *(void *)(a4 + 8));
  CMTimeValue value = v23.value;
  CMTimeScale timescale = v23.timescale;
  CMTime time1 = *(CMTime *)((_BYTE *)v10 + 4);
  CMTime time2 = kCMTimeInvalid;
  if (CMTimeCompare(&time1, &time2)
    && value
    && *((void *)v10 + 12) >= value
    && dword_100084688 <= 2
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10004588C(value, timescale);
  }

  id v13 = (dispatch_queue_s *)*((void *)v10 + 1);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100030344;
  block[3] = &unk_100071AC0;
  CMTime v19 = v23;
  id v16 = v10;
  uint64_t v17 = a3;
  int v20 = a5;
  uint64_t v18 = a6;
  id v14 = v10;
  dispatch_async(v13, block);
}

void sub_10002FA1C(void *a1, OpaqueAudioQueue *a2, int a3)
{
  __int16 v5 = a1;
  UInt32 ioDataSize = 4;
  int outData = 0;
  if (a3 == 1634824814)
  {
    if (AudioQueueGetProperty(a2, 0x6171726Eu, &outData, &ioDataSize))
    {
    }

    else
    {
      if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)CMTime buf = 136446722;
        id v14 = "isRunningListenerCallback";
        __int16 v15 = 1024;
        int v16 = 238;
        __int16 v17 = 1024;
        int v18 = outData;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d RPAppAudioCaptureManager: isRunningListenerCallback with isRunning %d",  buf,  0x18u);
      }

      uint64_t v6 = (dispatch_queue_s *)v5[1];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1000308B4;
      block[3] = &unk_1000717D0;
      __int128 v7 = v5;
      uint64_t v9 = v7;
      int v10 = outData;
      dispatch_async(v6, block);
      AudioQueueRemovePropertyListener(*v7[4], 0x6171726Eu, (AudioQueuePropertyListenerProc)sub_10002FA1C, v7);
    }
  }

  else if (dword_100084688 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100045988();
  }
}

id sub_10002FC0C(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  id result = *(id *)(a2 + 64);
  *(void *)(a1 + 64) = result;
  return result;
}

void sub_10002FC3C(uint64_t a1)
{
}

void sub_10002FC5C(id a1, NSError *a2)
{
  id v2 = a2;
  if (v2 && dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSError _rpUserErrorForCode:userInfo:]( &OBJC_CLASS___NSError,  "_rpUserErrorForCode:userInfo:",  -5833LL,  0LL));
    int v4 = 136446722;
    __int16 v5 = "-[RPAppAudioCaptureManager resumeWithConfig:]_block_invoke";
    __int16 v6 = 1024;
    int v7 = 356;
    __int16 v8 = 2112;
    uint64_t v9 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d Error: %@",  (uint8_t *)&v4,  0x1Cu);
  }
}

void sub_10002FDB4(uint64_t a1)
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)CMTime buf = 136446466;
    id v12 = "-[RPAppAudioCaptureManager stop]_block_invoke";
    __int16 v13 = 1024;
    int v14 = 363;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d ",  buf,  0x12u);
  }

  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0LL;

  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(v4 + 32);
  if (v5)
  {
    if (*(_DWORD *)(v5 + 152))
    {
      *(_DWORD *)(v5 + 152) = 0;
      if (AudioQueueStop(**(AudioQueueRef **)(*(void *)(a1 + 32) + 32LL), 1u))
      {
      }

      else
      {
        if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)CMTime buf = 136446466;
          id v12 = "-[RPAppAudioCaptureManager stop]_block_invoke";
          __int16 v13 = 1024;
          int v14 = 378;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d Audio Queue successfully stopped",  buf,  0x12u);
        }

        for (uint64_t i = 48LL; i != 128; i += 8LL)
        {
          OSStatus v7 = AudioQueueFreeBuffer( **(AudioQueueRef **)(*(void *)(a1 + 32) + 32LL),  *(AudioQueueBufferRef *)(*(void *)(*(void *)(a1 + 32) + 32LL) + i));
          if (v7) {
            BOOL v8 = dword_100084688 > 2;
          }
          else {
            BOOL v8 = 1;
          }
          if (!v8)
          {
            OSStatus v9 = v7;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)CMTime buf = 136446722;
              id v12 = "-[RPAppAudioCaptureManager stop]_block_invoke";
              __int16 v13 = 1024;
              int v14 = 385;
              __int16 v15 = 1024;
              OSStatus v16 = v9;
              _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  " [ERROR] %{public}s:%d AudioQueueFreeBuffer error: %i",  buf,  0x18u);
            }
          }
        }

        if (AudioQueueDispose(**(AudioQueueRef **)(*(void *)(a1 + 32) + 32LL), 1u))
        {
        }

        else if (dword_100084688 <= 1 {
               && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        }
        {
          *(_DWORD *)CMTime buf = 136446466;
          id v12 = "-[RPAppAudioCaptureManager stop]_block_invoke";
          __int16 v13 = 1024;
          int v14 = 391;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d Audio Queue has been disposed",  buf,  0x12u);
        }
      }
    }

    AudioQueueRemovePropertyListener( **(AudioQueueRef **)(*(void *)(a1 + 32) + 32LL),  0x6171726Eu,  (AudioQueuePropertyListenerProc)sub_10002FA1C,  *(void **)(a1 + 32));
    free(*(void **)(*(void *)(a1 + 32) + 32LL));
    *(void *)(*(void *)(a1 + 32) + 32LL) = 0LL;
    uint64_t v4 = *(void *)(a1 + 32);
  }

  int v10 = *(void **)(v4 + 48);
  *(void *)(v4 + 4_Block_object_dispose(va, 8) = 0LL;
}

void sub_1000302EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100030344(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(void *)(v1 + 32)) {
    return;
  }
  uint64_t v4 = (__int128 *)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 56);
  int v5 = *(_DWORD *)(a1 + 64);
  *(_OWORD *)CMTime time1 = *(_OWORD *)(v1 + 96);
  *(void *)&time1[16] = *(void *)(v1 + 112);
  CMTime time2 = kCMTimeInvalid;
  if (CMTimeCompare((CMTime *)time1, &time2))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    if (*(void *)(v6 + 96) >= v3)
    {
      if (dword_100084688 <= 2)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_100045DE4(v3, v5);
        }
        uint64_t v6 = *(void *)(a1 + 32);
      }

      if (AudioQueueEnqueueBuffer(**(AudioQueueRef **)(v6 + 32), *(AudioQueueBufferRef *)(a1 + 40), 0, 0LL)) {
        BOOL v7 = dword_100084688 > 2;
      }
      else {
        BOOL v7 = 1;
      }
      if (!v7 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100045D68();
      }
      return;
    }
  }

  else if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)CMTime time1 = 136446722;
    *(void *)&time1[4] = "handleInputBuffer_block_invoke";
    *(_WORD *)&time1[12] = 1024;
    *(_DWORD *)&time1[14] = 147;
    *(_WORD *)&time1[18] = 2048;
    *(double *)&time1[20] = (float)((float)v3 / (float)v5);
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d RPAppAudioCaptureManager: first sample received at time %.3f",  time1,  0x1Cu);
  }

  uint64_t v8 = *(void *)(a1 + 32);
  __int128 v9 = *v4;
  *(void *)(v8 + 112) = *((void *)v4 + 2);
  *(_OWORD *)(v8 + 96) = v9;
  uint64_t v10 = *(void *)(a1 + 32);
  if (*(_BYTE *)(v10 + 40))
  {
    *(_BYTE *)(v10 + 40) = 0;
    uint64_t v10 = *(void *)(a1 + 32);
    if (*(void *)(v10 + 48))
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      [v11 timeIntervalSinceDate:*(void *)(*(void *)(a1 + 32) + 48)];
      if (v12 > 0.0)
      {
        Float64 v13 = v12;
        if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)CMTime time1 = 136446466;
          *(void *)&time1[4] = "handleInputBuffer_block_invoke";
          *(_WORD *)&time1[12] = 1024;
          *(_DWORD *)&time1[14] = 159;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d RPAppAudioCaptureManager: gap since last audio tap, filling with empty sample buffer",  time1,  0x12u);
        }

        uint64_t v14 = *(void *)(a1 + 32);
        CMTime time2 = kCMTimeZero;
        __int128 v15 = *(_OWORD *)(v14 + 72);
        *(_OWORD *)CMTime time1 = *(_OWORD *)(v14 + 56);
        *(_OWORD *)&time1[16] = v15;
        uint64_t v34 = *(void *)(v14 + 88);
        CMSampleBufferRef v16 = sub_10003CB90(&time2, (uint64_t)time1, v13);
        (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 16LL) + 16LL))();
        if (v16) {
          CFRelease(v16);
        }
      }

      uint64_t v10 = *(void *)(a1 + 32);
    }
  }

  uint64_t v17 = *(void *)(v10 + 32);
  if (*(_DWORD *)(v17 + 152) == 2)
  {
    unsigned int v18 = *(_DWORD *)(a1 + 80);
    if (!v18)
    {
      unsigned int v19 = *(_DWORD *)(v17 + 24);
      if (v19) {
        unsigned int v18 = *(_DWORD *)(*(void *)(a1 + 40) + 16LL) / v19;
      }
      else {
        unsigned int v18 = 0;
      }
    }

    CMAudioFormatDescriptionRef formatDescriptionOut = 0LL;
    time2.CMTimeValue value = 0LL;
    CMBlockBufferRef destinationBuffer = 0LL;
    if (!CMAudioFormatDescriptionCreate( kCFAllocatorDefault,  (const AudioStreamBasicDescription *)(v17 + 8),  0LL,  0LL,  0LL,  0LL,  0LL,  &formatDescriptionOut))
    {
      size_t v20 = *(unsigned int *)(*(void *)(a1 + 40) + 16LL);
      if (!CMBlockBufferCreateWithMemoryBlock( kCFAllocatorDefault,  0LL,  v20,  kCFAllocatorDefault,  0LL,  0LL,  v20,  1u,  &destinationBuffer)
        && !CMBlockBufferReplaceDataBytes( *(const void **)(*(void *)(a1 + 40) + 8LL),  destinationBuffer,  0LL,  *(unsigned int *)(*(void *)(a1 + 40) + 16LL)))
      {
        CMItemCount v21 = *(unsigned int *)(a1 + 80);
        id v22 = *(const AudioStreamPacketDescription **)(a1 + 48);
        *(_OWORD *)CMTime time1 = *v4;
        *(void *)&time1[16] = *((void *)v4 + 2);
        if (!CMAudioSampleBufferCreateReadyWithPacketDescriptions( kCFAllocatorDefault,  destinationBuffer,  formatDescriptionOut,  v21,  (CMTime *)time1,  v22,  (CMSampleBufferRef *)&time2))
        {
          CMTime v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
          CMSampleBufferGetDuration(&time, (CMSampleBufferRef)time2.value);
          id v24 = [v23 dateByAddingTimeInterval:CMTimeGetSeconds(&time)];
          uint64_t v25 = objc_claimAutoreleasedReturnValue(v24);
          uint64_t v26 = *(void *)(a1 + 32);
          v27 = *(void **)(v26 + 48);
          *(void *)(v26 + 4_Block_object_dispose(va, 8) = v25;

          uint64_t v28 = *(void *)(*(void *)(a1 + 32) + 16LL);
          if (v28) {
            (*(void (**)(uint64_t, CMTimeValue))(v28 + 16))(v28, time2.value);
          }
        }
      }
    }

    if (time2.value) {
      CFRelease((CFTypeRef)time2.value);
    }
    if (destinationBuffer) {
      CFRelease(destinationBuffer);
    }
    if (formatDescriptionOut) {
      CFRelease(formatDescriptionOut);
    }
    *(void *)(*(void *)(*(void *)(a1 + 32) + 32LL) + 144LL) += v18;
  }

  else if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)CMTime time1 = 136446466;
    *(void *)&time1[4] = "handleInputBuffer_block_invoke";
    *(_WORD *)&time1[12] = 1024;
    *(_DWORD *)&time1[14] = 168;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d RPAppAudioCaptureManager: recorder is not running, ignoring audio data",  time1,  0x12u);
  }

  if (AudioQueueEnqueueBuffer( **(AudioQueueRef **)(*(void *)(a1 + 32) + 32LL),  *(AudioQueueBufferRef *)(a1 + 40),  0,  0LL)
    && dword_100084688 <= 2
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100045CEC();
  }

uint64_t sub_1000308B4(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  uint64_t v2 = *(void *)(v1 + 32);
  if (v2)
  {
    if (*(_DWORD *)(v2 + 152) == 1)
    {
      uint64_t v3 = result;
      if (*(_DWORD *)(result + 40))
      {
        id result = *(void *)(v1 + 24);
        if (result)
        {
          id result = (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0LL);
          uint64_t v2 = *(void *)(*(void *)(v3 + 32) + 32LL);
        }

        *(_DWORD *)(v2 + 152) = 2;
      }
    }
  }

  return result;
}

double sub_100030914(double a1, float a2)
{
  return a2;
}

double sub_100030934@<D0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X8>)
{
  *(void *)(v3 - _Block_object_dispose(va, 8) = a3;
  return (float)((float)a1 / (float)a2);
}

void sub_10003094C( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

char *sub_100030BDC(int a1)
{
  unint64_t v1 = dword_1000847E4++;
  uint64_t v2 = (char *)&unk_1000847B0 + 5 * (v1 % 0xA);
  *uint64_t v2 = HIBYTE(a1);
  v2[1] = BYTE2(a1);
  v2[2] = BYTE1(a1);
  v2[3] = a1;
  v2[4] = 0;
  return v2;
}

uint64_t sub_100030C3C(char *a1)
{
  return (a1[1] << 16) | (*a1 << 24) | (a1[2] << 8) | a1[3];
}

uint64_t sub_1000317A0(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[RPCaptureManager sharedInstance](&OBJC_CLASS___RPCaptureManager, "sharedInstance"));
  [v2 stopCaptureForDelegate:*(void *)(a1 + 32)];

  [*(id *)(a1 + 32) setSessionState:3];
  [*(id *)(a1 + 32) reportSummaryEvent:0 recordedFileSize:0];
  [*(id *)(*(void *)(a1 + 32) + 408) invalidateConnection];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 408);
  *(void *)(v3 + 40_Block_object_dispose(va, 8) = 0LL;

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0LL);
  }
  return result;
}

id sub_100031EA4(uint64_t a1)
{
  return [*(id *)(a1 + 32) startCaptureWithHandler:*(void *)(a1 + 40)];
}

void sub_100032084(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    [*(id *)(a1 + 32) setSessionState:3];
    uint64_t v4 = *(void *)(a1 + 40);
    if (v4)
    {
      int v5 = *(void (**)(void))(v4 + 16);
LABEL_12:
      v5();
    }
  }

  else
  {
    if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136446466;
      uint64_t v8 = "-[RPBroadcastSession startCaptureWithHandler:]_block_invoke";
      __int16 v9 = 1024;
      int v10 = 244;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d startCapture has started successfully",  (uint8_t *)&v7,  0x12u);
    }

    [*(id *)(a1 + 32) setSessionState:1];
    uint64_t v6 = *(void *)(a1 + 40);
    if (v6)
    {
      int v5 = *(void (**)(void))(v6 + 16);
      goto LABEL_12;
    }
  }
}

id sub_100032334(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) recordingDidPause];
}

uint64_t sub_1000324D0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_1000324DC(id a1)
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136446466;
    uint64_t v2 = "-[RPBroadcastSession resumeSessionWithWindowLayerContextID:completionHandler:]_block_invoke_2";
    __int16 v3 = 1024;
    int v4 = 275;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d notifying extension of resume",  (uint8_t *)&v1,  0x12u);
  }

void sub_1000328A8(_Unwind_Exception *a1)
{
}

void sub_100032900(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  if (v3)
  {
    [*(id *)(a1 + 40) disableBroadcast];
  }

  else if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136446466;
    int v5 = "-[RPBroadcastSession enableBroadcastWithListenerEndpoint:]_block_invoke";
    __int16 v6 = 1024;
    int v7 = 299;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d connection to extensions ready",  (uint8_t *)&v4,  0x12u);
  }
}

void sub_1000329EC(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained handleBroadcastServiceInfo:v3];
}

void sub_100032A34(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained handleBroadcastURL:v3];
}

void sub_100032A7C(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained handleBroadcastError:v3];
}

id sub_100032C38(uint64_t a1)
{
  return [*(id *)(a1 + 32) notifyClientSessionDidStopWithError:-5804 movieURL:0 showAlert:0];
}

void sub_100032E38(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = objc_alloc(&OBJC_CLASS___NSKeyedUnarchiver);
  uint64_t v5 = *(void *)(a1 + 32);
  id v17 = 0LL;
  __int16 v6 = -[NSKeyedUnarchiver initForReadingFromData:error:](v4, "initForReadingFromData:error:", v5, &v17);
  id v7 = v17;
  id v8 = -[NSKeyedUnarchiver decodeObjectOfClass:forKey:]( v6,  "decodeObjectOfClass:forKey:",  objc_opt_class(&OBJC_CLASS___RPBroadcastConfiguration),  NSKeyedArchiveRootObjectKey);
  __int16 v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v11 = *(void **)(v10 + 360);
  *(void *)(v10 + 360) = v3;
  id v12 = v3;

  objc_storeStrong((id *)(*(void *)(a1 + 40) + 368LL), *(id *)(a1 + 48));
  uint64_t v13 = *(void *)(a1 + 40);
  uint64_t v14 = *(void **)(v13 + 424);
  *(void *)(v13 + 424) = v9;
  id v15 = v9;

  *(void *)(*(void *)(a1 + 40) + 400LL) = 1LL;
  uint64_t v16 = *(void *)(a1 + 40) + 376LL;
  *(void *)(v16 + 16) = kCMTimeZero.epoch;
  *(_OWORD *)uint64_t v16 = *(_OWORD *)&kCMTimeZero.value;
  [*(id *)(a1 + 40) setupDispatchLimits];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
}

void sub_1000330DC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5 && !v6 && [v5 count])
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 firstObject]);
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }

  else
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1000331D0;
    v10[3] = &unk_100071300;
    uint64_t v9 = *(void *)(a1 + 32);
    id v11 = *(id *)(a1 + 40);
    +[NSExtension extensionsWithMatchingPointName:baseIdentifier:unwantedActivationRule:completion:]( &OBJC_CLASS___NSExtension,  "extensionsWithMatchingPointName:baseIdentifier:unwantedActivationRule:completion:",  @"com.apple.broadcast-services",  v9,  @"NSExtensionActivationSupportsReplayKitStreaming",  v10);
  }
}

void sub_1000331D0(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = v5;
  if (v5)
  {
    if (!a3)
    {
      uint64_t v9 = v5;
      id v7 = [v5 count];
      id v6 = v9;
      if (v7)
      {
        id v8 = (void *)objc_claimAutoreleasedReturnValue([v9 firstObject]);
        (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();

        id v6 = v9;
      }
    }
  }
}

void sub_100033284(id a1)
{
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.replaykit.BroadcastSessionDispatchQueue", 0LL);
  uint64_t v2 = (void *)qword_1000847E8;
  qword_1000847E8 = (uint64_t)v1;
}

void sub_1000333FC(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend( *(id *)(a1 + 40),  "notifyClientSessionDidStopWithError:movieURL:showAlert:",  objc_msgSend(*(id *)(a1 + 32), "code"),  0,  1);
}

id sub_100033860(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v1 = a1[5];
  id v3 = *(void **)(v2 + 408);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000338CC;
  _OWORD v6[3] = &unk_100071BA0;
  uint64_t v4 = a1[7];
  void v6[5] = a1[6];
  v6[6] = v4;
  void v6[4] = v2;
  return [v3 processPayload:v1 completion:v6];
}

id sub_1000338CC(uint64_t a1)
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v2 = *(void *)(a1 + 40);
    int v5 = 136446722;
    id v6 = "-[RPBroadcastSession notifyExtensionOfAudioSampleBuffer:withType:]_block_invoke_2";
    __int16 v7 = 1024;
    int v8 = 629;
    __int16 v9 = 2048;
    uint64_t v10 = v2;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d Sending %ld audio payload to broadcast extension...",  (uint8_t *)&v5,  0x1Cu);
  }

  id v3 = *(const void **)(a1 + 48);
  if (v3) {
    CFRelease(v3);
  }
  return [*(id *)(a1 + 32) dispatchCompleted:*(void *)(a1 + 40)];
}

id sub_100033CC0(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v1 = a1[5];
  id v3 = *(void **)(v2 + 408);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100033D2C;
  _OWORD v7[3] = &unk_100071BA0;
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[7];
  void v7[4] = v2;
  v7[5] = v4;
  v7[6] = v5;
  return [v3 processPayload:v1 completion:v7];
}

id sub_100033D2C(uint64_t a1)
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136446466;
    uint64_t v5 = "-[RPBroadcastSession notifyExtensionOfVideoSampleBuffer:withType:sampleOrientation:]_block_invoke_2";
    __int16 v6 = 1024;
    int v7 = 679;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d Sending video payload to broadcast extension...",  (uint8_t *)&v4,  0x12u);
  }

  uint64_t v2 = *(const void **)(a1 + 40);
  if (v2) {
    CFRelease(v2);
  }
  return [*(id *)(a1 + 32) dispatchCompleted:*(void *)(a1 + 48)];
}

uint64_t sub_10003410C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_100034118(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100034160(id a1)
{
  dispatch_queue_attr_t v1 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_USER_INTERACTIVE, 0);
  int v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v1);
  dispatch_queue_t v2 = dispatch_queue_create("com.replaykit.broadcastSession.AudioSampleQueue", v4);
  id v3 = (void *)qword_1000847F8;
  qword_1000847F8 = (uint64_t)v2;
}

void sub_1000341F4(id a1)
{
  dispatch_queue_attr_t v1 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_USER_INTERACTIVE, 0);
  int v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v1);
  dispatch_queue_t v2 = dispatch_queue_create("com.replaykit.broadcastSession.VideoSampleQueue", v4);
  id v3 = (void *)qword_100084808;
  qword_100084808 = (uint64_t)v2;
}

void sub_100034470(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446722;
    int v7 = "-[RPBroadcastSession handleResumeCaptureWithCompletionHandler:]_block_invoke";
    __int16 v8 = 1024;
    int v9 = 810;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d resume capture completed with Error: %@",  (uint8_t *)&v6,  0x1Cu);
  }

  if (v3) {
    uint64_t v4 = 3LL;
  }
  else {
    uint64_t v4 = 1LL;
  }
  [*(id *)(a1 + 32) setSessionState:v4];
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

void sub_100034880(uint64_t a1)
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136446466;
    dispatch_queue_t v2 = "-[RPBroadcastSession handleClientApplicationDidEnterForeground]_block_invoke";
    __int16 v3 = 1024;
    int v4 = 841;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d notifying client",  (uint8_t *)&v1,  0x12u);
  }

void sub_100034A84(uint64_t a1)
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136446466;
    dispatch_queue_t v2 = "-[RPBroadcastSession handleDisplayWarning]_block_invoke";
    __int16 v3 = 1024;
    int v4 = 854;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d notifying client",  (uint8_t *)&v1,  0x12u);
  }

void sub_100034D60(uint64_t a1)
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136446466;
    dispatch_queue_t v2 = "-[RPBroadcastSession handleDeviceRestrictionWarning]_block_invoke";
    __int16 v3 = 1024;
    int v4 = 883;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d notifying client",  (uint8_t *)&v1,  0x12u);
  }

void sub_100034F64(uint64_t a1)
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136446466;
    dispatch_queue_t v2 = "-[RPBroadcastSession handleResumeContextIDFailure]_block_invoke";
    __int16 v3 = 1024;
    int v4 = 895;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d notifying client",  (uint8_t *)&v1,  0x12u);
  }

__CFData *sub_100035144(CGImage *a1, void *a2, void *a3, BOOL *a4)
{
  int v7 = a2;
  __int16 v8 = a3;
  int v9 = (__CFData *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](&OBJC_CLASS___NSMutableData, "data"));
  *a4 = 0;
  __int16 v10 = CGImageDestinationCreateWithData(v9, v8, 1uLL, 0LL);

  if (v10)
  {
    CGImageDestinationAddImage(v10, a1, v7);
    *a4 = CGImageDestinationFinalize(v10);
    CFRelease(v10);
  }

  else if (dword_100084688 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10004635C();
  }

  return v9;
}

void sub_10003578C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = v6;
  if (!v5 || v6)
  {
  }

  else
  {
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSString stringWithString:](&OBJC_CLASS___NSString, "stringWithString:", v5));
    uint64_t v9 = *(void *)(a1 + 32);
    __int16 v10 = *(void **)(v9 + 360);
    *(void *)(v9 + 360) = v8;

    if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136446722;
      id v12 = "-[RPSystemRecordSession startSystemRecordingWithMicrophoneEnabled:cameraEnabled:contextID:windowSize:handler:]_block_invoke";
      __int16 v13 = 1024;
      int v14 = 64;
      __int16 v15 = 2112;
      id v16 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d connect to angel, sessionID=%@",  (uint8_t *)&v11,  0x1Cu);
    }
  }
}

void sub_1000358EC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)CMTime buf = 138412290;
      id v18 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "RPSystemRecordSession: startWriting for movie writer has failed. Error: %@",  buf,  0xCu);
    }

    [*(id *)(a1 + 32) setSessionState:3];
    uint64_t v4 = *(void *)(a1 + 40);
    if (v4) {
      (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
    }
  }

  else
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[RPCaptureManager sharedInstance](&OBJC_CLASS___RPCaptureManager, "sharedInstance"));
    id v6 = *(void **)(a1 + 32);
    id v7 = [v6 microphoneEnabled];
    [*(id *)(a1 + 32) windowSize];
    double v9 = v8;
    double v11 = v10;
    id v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) contextID]);
    __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", v12));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100035ABC;
    v15[3] = &unk_100071208;
    int v14 = *(void **)(a1 + 40);
    v15[4] = *(void *)(a1 + 32);
    id v16 = v14;
    objc_msgSend( v5,  "startCaptureForDelegate:forProcessID:shouldStartMicrophoneCapture:windowSize:systemRecording:contextIDs:mixedReali tyCamera:didStartHandler:",  v6,  0xFFFFFFFFLL,  v7,  1,  v13,  1,  v9,  v11,  v15);
  }
}

void sub_100035ABC(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v4)
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "RPSystemRecordSession: startCapture has failed. Error: %@",  (uint8_t *)&v8,  0xCu);
    }

    [*(id *)(a1 + 32) setSessionState:3];
    uint64_t v5 = *(void *)(a1 + 40);
    if (v5)
    {
      id v6 = *(void (**)(void))(v5 + 16);
LABEL_12:
      v6();
    }
  }

  else
  {
    if (v4)
    {
      LOWORD(v_Block_object_dispose(va, 8) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "RPSystemRecordSession: startCapture has started successfully",  (uint8_t *)&v8,  2u);
    }

    [*(id *)(a1 + 32) setSessionState:1];
    [*(id *)(a1 + 32) checkAndPlaySystemSessionSound:1];
    uint64_t v7 = *(void *)(a1 + 40);
    if (v7)
    {
      id v6 = *(void (**)(void))(v7 + 16);
      goto LABEL_12;
    }
  }
}

void sub_100035E58(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) setSessionState:3];
  BOOL v4 = *(void **)(a1 + 32);
  id v5 = [v3 code];
  id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 352) outputURL]);
  objc_msgSend( v4,  "reportSummaryEvent:recordedFileSize:",  v5,  +[RPSession getFileSizeForURL:](RPSession, "getFileSizeForURL:", v6));

  if (v3)
  {
    +[RPPhotosUtility showAlertFailedSaveToPhotosWithError:]( &OBJC_CLASS___RPPhotosUtility,  "showAlertFailedSaveToPhotosWithError:",  v3);
    uint64_t v7 = *(void *)(a1 + 40);
    if (v7)
    {
      int v8 = *(void (**)(void))(v7 + 16);
LABEL_12:
      v8();
    }
  }

  else
  {
    if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136446466;
      double v11 = "-[RPSystemRecordSession stopSystemRecordingWithHandler:]_block_invoke";
      __int16 v12 = 1024;
      int v13 = 180;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d finishWritingAndSaveToCameraRoll encountered no error",  (uint8_t *)&v10,  0x12u);
    }

    uint64_t v9 = *(void *)(a1 + 40);
    if (v9)
    {
      int v8 = *(void (**)(void))(v9 + 16);
      goto LABEL_12;
    }
  }
}

void sub_1000361E0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) setSessionState:3];
  uint64_t v7 = *(void **)(a1 + 32);
  id v8 = [v6 code];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 352) outputURL]);
  objc_msgSend( v7,  "reportSummaryEvent:recordedFileSize:",  v8,  +[RPSession getFileSizeForURL:](RPSession, "getFileSizeForURL:", v9));

  if (v6)
  {
    +[RPPhotosUtility showAlertFailedSaveToPhotosWithError:]( &OBJC_CLASS___RPPhotosUtility,  "showAlertFailedSaveToPhotosWithError:",  v6);
    uint64_t v10 = *(void *)(a1 + 40);
    if (v10)
    {
      double v11 = *(void (**)(void))(v10 + 16);
LABEL_12:
      v11();
    }
  }

  else
  {
    if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136446466;
      int v14 = "-[RPSystemRecordSession stopSystemRecordingWithURLHandler:]_block_invoke";
      __int16 v15 = 1024;
      int v16 = 222;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d writing movie finished",  (uint8_t *)&v13,  0x12u);
    }

    uint64_t v12 = *(void *)(a1 + 40);
    if (v12)
    {
      double v11 = *(void (**)(void))(v12 + 16);
      goto LABEL_12;
    }
  }
}

id *sub_100036748(id *result, opaqueCMSampleBuffer *a2)
{
  id v3 = result;
  int v4 = *((_DWORD *)result + 12);
  switch(v4)
  {
    case 2:
      if (([result[4] microphoneEnabled] & 1) == 0)
      {
        DataBuffer = CMSampleBufferGetDataBuffer(a2);
        size_t DataLength = CMBlockBufferGetDataLength(DataBuffer);
        CMBlockBufferFillDataBytes(0, DataBuffer, 0LL, DataLength);
      }

      return (id *)[*((id *)v3[4] + 44) appendAudio2SampleBuffer:a2];
    case 1:
      return (id *)[*((id *)result[4] + 44) appendAudio1SampleBuffer:a2];
    case 0:
      return (id *)[result[4] processSampleBuffer:a2 transformFlags:result[5] movieWriter:*((void *)result[4] + 44)];
  }

  return result;
}

void sub_10003689C(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend( *(id *)(a1 + 40),  "notifyClientSessionDidStopWithError:movieURL:showAlert:",  objc_msgSend(*(id *)(a1 + 32), "code"),  0,  1);
}

void sub_100036960(id a1)
{
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.replaykit.SystemRecordSessionDispatchQueue", 0LL);
  dispatch_queue_t v2 = (void *)qword_100084818;
  qword_100084818 = (uint64_t)v1;
}

void sub_100036AB0(uint64_t a1)
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136446466;
    dispatch_queue_t v2 = "-[RPSystemRecordSession handleSystemAlertStop]_block_invoke";
    __int16 v3 = 1024;
    int v4 = 338;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d notifying client",  (uint8_t *)&v1,  0x12u);
  }

void sub_100036F1C(uint64_t a1)
{
  dispatch_queue_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSError _rpUserErrorForCode:userInfo:]( &OBJC_CLASS___NSError,  "_rpUserErrorForCode:userInfo:",  -5805LL,  0LL));
  [*(id *)(a1 + 32) reportSessionEndReason:v2];
  [*(id *)(a1 + 32) notifyClientSessionDidStopWithError:-5805 movieURL:0 showAlert:1];
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136446466;
    int v4 = "-[RPSystemRecordSession handleMemoryWarning]_block_invoke";
    __int16 v5 = 1024;
    int v6 = 360;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d Notifying client, stopped due to insufficient storage",  (uint8_t *)&v3,  0x12u);
  }
}

void sub_100037024(uint64_t a1)
{
  dispatch_queue_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSError _rpUserErrorForCode:userInfo:]( &OBJC_CLASS___NSError,  "_rpUserErrorForCode:userInfo:",  -5805LL,  0LL));
  [*(id *)(a1 + 32) reportSessionEndReason:v2];
  [*(id *)(a1 + 32) notifyClientSessionDidStopWithError:-5805 movieURL:0 showAlert:1];
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136446466;
    int v4 = "-[RPSystemRecordSession handleMemoryWarning]_block_invoke";
    __int16 v5 = 1024;
    int v6 = 372;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d Notifying client, stopped due to insufficient storage",  (uint8_t *)&v3,  0x12u);
  }
}

void sub_10003712C(uint64_t a1)
{
  dispatch_queue_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSError _rpUserErrorForCode:userInfo:]( &OBJC_CLASS___NSError,  "_rpUserErrorForCode:userInfo:",  -5805LL,  0LL));
  [*(id *)(a1 + 32) reportSessionEndReason:v2];
  [*(id *)(a1 + 32) notifyClientSessionDidStopWithError:-5805 movieURL:0 showAlert:1];
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136446466;
    int v4 = "-[RPSystemRecordSession handleMemoryWarning]_block_invoke";
    __int16 v5 = 1024;
    int v6 = 381;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d Notifying client, stopped due to insufficient storage",  (uint8_t *)&v3,  0x12u);
  }
}

void sub_100037358(uint64_t a1)
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136446466;
    dispatch_queue_t v2 = "-[RPSystemRecordSession handleIncomingCallWarning]_block_invoke";
    __int16 v3 = 1024;
    int v4 = 395;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d notifying client",  (uint8_t *)&v1,  0x12u);
  }

void sub_10003754C(uint64_t a1)
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136446466;
    dispatch_queue_t v2 = "-[RPSystemRecordSession handleDeviceLockedWarning]_block_invoke";
    __int16 v3 = 1024;
    int v4 = 407;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d notifying client",  (uint8_t *)&v1,  0x12u);
  }

void sub_100037740(uint64_t a1)
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136446466;
    dispatch_queue_t v2 = "-[RPSystemRecordSession handleDeviceRestrictionWarning]_block_invoke";
    __int16 v3 = 1024;
    int v4 = 419;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d notifying client",  (uint8_t *)&v1,  0x12u);
  }

void sub_100037B6C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446722;
    uint64_t v7 = "-[RPSystemRecordSession handleResumeCaptureWithCompletionHandler:]_block_invoke";
    __int16 v8 = 1024;
    int v9 = 448;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d resume capture completed with Error: %@",  (uint8_t *)&v6,  0x1Cu);
  }

  if (v3) {
    uint64_t v4 = 3LL;
  }
  else {
    uint64_t v4 = 1LL;
  }
  [*(id *)(a1 + 32) setSessionState:v4];
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

void sub_100037D98(uint64_t a1)
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136446466;
    dispatch_queue_t v2 = "-[RPSystemRecordSession handleResumeContextIDFailure]_block_invoke";
    __int16 v3 = 1024;
    int v4 = 466;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d notifying client",  (uint8_t *)&v1,  0x12u);
  }

void sub_1000383F8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_100038418(uint64_t a1)
{
  uint64_t v13 = 0LL;
  int v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  int v16 = sub_100038710;
  id v17 = sub_100038720;
  id v18 = 0LL;
  dispatch_queue_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[PHPhotoLibrary sharedPhotoLibrary](&OBJC_CLASS___PHPhotoLibrary, "sharedPhotoLibrary"));
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)CMTime buf = 136446466;
    size_t v20 = "+[RPPhotosUtility exportVideoToPhotosLibrary:completionHandler:]_block_invoke";
    __int16 v21 = 1024;
    int v22 = 45;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d Start Save to Photos",  buf,  0x12u);
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100038728;
  v10[3] = &unk_100071CA0;
  id v11 = *(id *)(a1 + 32);
  uint64_t v12 = &v13;
  id v9 = 0LL;
  unsigned int v3 = [v2 performChangesAndWait:v10 error:&v9];
  id v4 = v9;
  if (v3)
  {
    if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL);
      *(_DWORD *)CMTime buf = 136446722;
      size_t v20 = "+[RPPhotosUtility exportVideoToPhotosLibrary:completionHandler:]_block_invoke_2";
      __int16 v21 = 1024;
      int v22 = 59;
      __int16 v23 = 2048;
      uint64_t v24 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d Save to Photos Video saved to camera roll successfully. Video duration: %.2f seconds",  buf,  0x1Cu);
    }
  }

  else
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue( +[NSError _rpUserErrorForCode:userInfo:]( &OBJC_CLASS___NSError,  "_rpUserErrorForCode:userInfo:",  -5831LL,  &__NSDictionary0__struct));

    +[RPPhotosUtility showAlertFailedSaveToPhotosWithError:]( &OBJC_CLASS___RPPhotosUtility,  "showAlertFailedSaveToPhotosWithError:",  v6);
    id v4 = (id)v6;
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  [v7 _srRemoveFile:*(void *)(a1 + 32) completion:&stru_100071CC0];

  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(uint64_t, id, uint64_t, double))(v8 + 16))( v8,  v4,  v14[5],  *(double *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL));
  }

  _Block_object_dispose(&v13, 8);
}

void sub_1000386F0( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
}

uint64_t sub_100038710(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100038720(uint64_t a1)
{
}

void sub_100038728(uint64_t a1)
{
  id v7 = (id)objc_claimAutoreleasedReturnValue( +[PHAssetCreationRequest creationRequestForAsset]( &OBJC_CLASS___PHAssetCreationRequest,  "creationRequestForAsset"));
  dispatch_queue_t v2 = objc_alloc_init(&OBJC_CLASS___PHAssetResourceCreationOptions);
  -[PHAssetResourceCreationOptions setShouldMoveFile:](v2, "setShouldMoveFile:", 1LL);
  [v7 addResourceWithType:2 fileURL:*(void *)(a1 + 32) options:v2];
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue([v7 placeholderForCreatedAsset]);
  uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 localIdentifier]);
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void sub_1000387CC(id a1, NSError *a2)
{
  dispatch_queue_t v2 = a2;
}

void sub_1000388F0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (dword_100084688 > 2 || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      if (v5) {
        goto LABEL_9;
      }
      goto LABEL_5;
    }

    sub_1000468F8();
    if (!v5) {
LABEL_5:
    }
      id v5 = *(id *)(a1 + 32);
  }

  else if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136446466;
    id v9 = "+[RPPhotosUtility exportVideoToPhotosAsynchronously:mixAudioTracks:completionHandler:]_block_invoke";
    __int16 v10 = 1024;
    int v11 = 98;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d Mixing video audio tracks completed",  (uint8_t *)&v8,  0x12u);
  }

void sub_100038A64(id a1, NSError *a2)
{
  dispatch_queue_t v2 = a2;
}

CFStringRef sub_100038CFC(unsigned int a1)
{
  if (a1 > 2) {
    return @"Invalid type";
  }
  else {
    return *(&off_100071DE8 + (int)a1);
  }
}

void sub_1000392A4(uint64_t a1)
{
  SampleAttachmentsArray = CMSampleBufferGetSampleAttachmentsArray(*(CMSampleBufferRef *)(a1 + 40), 1u);
  if (CFArrayGetCount(SampleAttachmentsArray))
  {
    ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(SampleAttachmentsArray, 0LL);
    else {
      BOOL v4 = 1LL;
    }
  }

  else
  {
    BOOL v4 = 0LL;
  }

  [*(id *)(a1 + 32) updateLatestSampleTime:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 8) addFrameToBuffer:*(void *)(a1 + 40) isKeyFrame:v4];
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

void sub_100039474(uint64_t a1)
{
}

void sub_1000395E0(uint64_t a1)
{
}

void sub_10003989C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v15 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1000398D4(uint64_t a1)
{
  if (!dword_100084688 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v2 = *(int *)(a1 + 80);
    else {
      unsigned int v3 = *(&off_100071DE8 + v2);
    }
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) + 1LL;
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL);
    *(_DWORD *)CMTime buf = 136447234;
    v27 = "-[RPClipWriter queueAndWaitForSample:withAssetInput:withBuffer:didAppendIdleFrame:]_block_invoke";
    __int16 v28 = 1024;
    int v29 = 170;
    __int16 v30 = 2112;
    *(void *)id v31 = v3;
    *(_WORD *)&v31[8] = 2048;
    *(void *)&v31[10] = v4;
    *(_WORD *)&v31[18] = 2048;
    *(void *)&v31[20] = v5;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [DEBUG] %{public}s:%d %@ block start, sample %lu out of %lu",  buf,  0x30u);
  }

  if ([*(id *)(a1 + 32) isReadyForMoreMediaData])
  {
    *(void *)&__int128 v6 = 136446722LL;
    __int128 v24 = v6;
    id v7 = @"Invalid type";
    do
    {
      uint64_t v8 = *(void *)(*(void *)(a1 + 72) + 8LL);
      if (*(_BYTE *)(v8 + 24)) {
        break;
      }
      if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) >= *(void *)(*(void *)(*(void *)(a1 + 64)
                                                                                                + 8LL)
                                                                                    + 24LL))
      {
        *(_BYTE *)(v8 + 24) = 1;
      }

      else
      {
        id v9 = (opaqueCMSampleBuffer *)objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:");
        __int16 v10 = v9;
        uint64_t v11 = *(void *)(a1 + 48);
        if (!*(_BYTE *)(v11 + 112))
        {
          uint64_t v12 = *(void **)(v11 + 80);
          CMSampleBufferGetPresentationTimeStamp(&v25, v9);
          [v12 startSessionAtSourceTime:&v25];
          *(float *)(*(void *)(a1 + 48) + 116LL) = sub_10003D0D4(v10);
          *(_BYTE *)(*(void *)(a1 + 48) + 112LL) = 1;
        }

        if (sub_10003D0D4(v10) >= *(float *)(*(void *)(a1 + 48) + 116LL))
        {
          *(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [*(id *)(a1 + 32) appendSampleBuffer:v10] ^ 1;
          if (!dword_100084688 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            BOOL v13 = *(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL) == 0;
            uint64_t v14 = *(int *)(a1 + 80);
            uint64_t v15 = v7;
            float v16 = sub_10003D0D4(v10);
            *(_DWORD *)CMTime buf = 136447234;
            v27 = "-[RPClipWriter queueAndWaitForSample:withAssetInput:withBuffer:didAppendIdleFrame:]_block_invoke";
            __int16 v28 = 1024;
            int v29 = 187;
            __int16 v30 = 1024;
            *(_DWORD *)id v31 = v13;
            *(_WORD *)&v31[4] = 2112;
            *(void *)&v31[6] = v7;
            *(_WORD *)&v31[14] = 2048;
            *(double *)&v31[16] = v16;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [DEBUG] %{public}s:%d did complete:%d append %@ sample with timestamp:%lf",  buf,  0x2Cu);
            id v7 = v15;
          }
        }

        uint64_t v17 = *(void *)(a1 + 56);
        if (*(_BYTE *)(a1 + 84) && !*(void *)(*(void *)(v17 + 8) + 24LL))
        {
          if (!dword_100084688 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)CMTime buf = v24;
            v27 = "-[RPClipWriter queueAndWaitForSample:withAssetInput:withBuffer:didAppendIdleFrame:]_block_invoke";
            __int16 v28 = 1024;
            int v29 = 192;
            __int16 v30 = 2048;
            *(void *)id v31 = v10;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [DEBUG] %{public}s:%d releasing idle video sample %p",  buf,  0x1Cu);
          }

          CFRelease(v10);
          uint64_t v17 = *(void *)(a1 + 56);
        }

        ++*(void *)(*(void *)(v17 + 8) + 24LL);
      }
    }

    while ((objc_msgSend(*(id *)(a1 + 32), "isReadyForMoreMediaData", v24) & 1) != 0);
  }

  if (!dword_100084688 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = *(int *)(a1 + 80);
    else {
      uint64_t v19 = *(&off_100071DE8 + v18);
    }
    unsigned int v20 = objc_msgSend(*(id *)(a1 + 32), "isReadyForMoreMediaData", v24);
    int v21 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL);
    *(_DWORD *)CMTime buf = 136447234;
    v27 = "-[RPClipWriter queueAndWaitForSample:withAssetInput:withBuffer:didAppendIdleFrame:]_block_invoke";
    __int16 v28 = 1024;
    int v29 = 201;
    __int16 v30 = 2112;
    *(void *)id v31 = v19;
    *(_WORD *)&v31[8] = 1024;
    *(_DWORD *)&v31[10] = v20;
    *(_WORD *)&v31[14] = 1024;
    *(_DWORD *)&v31[16] = v21;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [DEBUG] %{public}s:%d %@ block isReady: %d, completedOrFailed: %d",  buf,  0x28u);
  }

  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL))
  {
    [*(id *)(a1 + 32) markAsFinished];
    dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 48) + 32LL));
    if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = *(int *)(a1 + 80);
      else {
        __int16 v23 = *(&off_100071DE8 + v22);
      }
      *(_DWORD *)CMTime buf = 136446722;
      v27 = "-[RPClipWriter queueAndWaitForSample:withAssetInput:withBuffer:didAppendIdleFrame:]_block_invoke";
      __int16 v28 = 1024;
      int v29 = 206;
      __int16 v30 = 2112;
      *(void *)id v31 = v23;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d finished appending %@ samples",  buf,  0x1Cu);
    }
  }

void sub_100039F38(uint64_t a1)
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t v5 = 136446466;
    *(void *)&void v5[4] = "-[RPClipWriter waitForCompletionAndFinishWriting:withHandler:]_block_invoke";
    *(_WORD *)&v5[12] = 1024;
    *(_DWORD *)&v5[14] = 214;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d finish asset writing",  v5,  0x12u);
  }

  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 80LL);
  *(_OWORD *)uint64_t v5 = *(_OWORD *)(a1 + 48);
  *(void *)&uint8_t v5[16] = *(void *)(a1 + 64);
  [v2 endSessionAtSourceTime:v5];
  if ([*(id *)(*(void *)(a1 + 32) + 80) finishWriting])
  {
    unsigned int v3 = 0LL;
  }

  else
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 80) error]);
    unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSError _rpUserErrorForCode:userInfo:]( &OBJC_CLASS___NSError,  "_rpUserErrorForCode:userInfo:",  -5823LL,  0LL));
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

id sub_10003A1D4(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) flushBuffer];
}

void sub_10003A704( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, char a33)
{
}

uint64_t sub_10003A75C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10003A76C(uint64_t a1)
{
}

void sub_10003A774(void *a1)
{
  id v2 = [*(id *)(a1[4] + 8) copy];
  uint64_t v3 = *(void *)(a1[5] + 8LL);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = [*(id *)(a1[4] + 16) copy];
  uint64_t v6 = *(void *)(a1[6] + 8LL);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  id v8 = [*(id *)(a1[4] + 24) copy];
  uint64_t v9 = *(void *)(a1[7] + 8LL);
  __int16 v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

void sub_10003A7EC(void *a1, void *a2)
{
  id v3 = a2;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446466;
    uint64_t v6 = "-[RPClipWriter exportClipToURL:duration:completionHandler:]_block_invoke_2";
    __int16 v7 = 1024;
    int v8 = 262;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d flushing copied buffers and calling completion handler",  (uint8_t *)&v5,  0x12u);
  }

  [*(id *)(*(void *)(a1[5] + 8) + 40) flushBuffer];
  [*(id *)(*(void *)(a1[6] + 8) + 40) flushBuffer];
  [*(id *)(*(void *)(a1[7] + 8) + 40) flushBuffer];
  uint64_t v4 = a1[4];
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
}

void sub_10003A944(id a1)
{
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.replaykit.ClipWriterDispatchQueue", 0LL);
  id v2 = (void *)qword_100084828;
  qword_100084828 = (uint64_t)v1;
}

void sub_10003ADF4(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v4)
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "RPRecordSession: startCapture has failed. Error: %@",  (uint8_t *)&v8,  0xCu);
    }

    [*(id *)(a1 + 32) setSessionState:3];
    uint64_t v5 = *(void *)(a1 + 40);
    if (v5)
    {
      uint64_t v6 = *(void (**)(void))(v5 + 16);
LABEL_10:
      v6();
    }
  }

  else
  {
    if (v4)
    {
      LOWORD(v_Block_object_dispose((const void *)(v33 - 192), 8) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "RPRecordSession: startCapture has started successfully",  (uint8_t *)&v8,  2u);
    }

    [*(id *)(a1 + 32) setSessionState:1];
    uint64_t v7 = *(void *)(a1 + 40);
    if (v7)
    {
      uint64_t v6 = *(void (**)(void))(v7 + 16);
      goto LABEL_10;
    }
  }
}

void sub_10003B258(id a1)
{
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.replaykit.CaptureSessionDispatchQueue", 0LL);
  id v2 = (void *)qword_100084838;
  qword_100084838 = (uint64_t)v1;
}

void sub_10003B3C8(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend( *(id *)(a1 + 40),  "notifyClientSessionDidStopWithError:movieURL:showAlert:",  objc_msgSend(*(id *)(a1 + 32), "code"),  0,  1);
}

void sub_10003B6F0(uint64_t a1)
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136446466;
    id v2 = "-[RPCaptureSession handleDisplayWarning]_block_invoke";
    __int16 v3 = 1024;
    int v4 = 250;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d notifying client",  (uint8_t *)&v1,  0x12u);
  }

void sub_10003B9CC(uint64_t a1)
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136446466;
    id v2 = "-[RPCaptureSession handleDeviceRestrictionWarning]_block_invoke";
    __int16 v3 = 1024;
    int v4 = 279;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d notifying client",  (uint8_t *)&v1,  0x12u);
  }

void sub_10003BBD0(uint64_t a1)
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136446466;
    id v2 = "-[RPCaptureSession handleResumeContextIDFailure]_block_invoke";
    __int16 v3 = 1024;
    int v4 = 291;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d notifying client",  (uint8_t *)&v1,  0x12u);
  }

void sub_10003BEA4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446722;
    uint64_t v7 = "-[RPCaptureSession handleResumeCaptureWithCompletionHandler:]_block_invoke";
    __int16 v8 = 1024;
    int v9 = 304;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d resume capture completed with Error: %@",  (uint8_t *)&v6,  0x1Cu);
  }

  if (v3) {
    uint64_t v4 = 3LL;
  }
  else {
    uint64_t v4 = 1LL;
  }
  [*(id *)(a1 + 32) setSessionState:v4];
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

uint64_t start()
{
  if ((_set_user_dir_suffix("com.apple.replayd") & 1) == 0
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100046C74();
  }

  uint64_t v0 = objc_autoreleasePoolPush();
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "replayd Starting!",  v3,  2u);
  }

  sub_1000213D8();
  objc_autoreleasePoolPop(v0);
  int v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
  [v1 run];

  return 0xFFFFFFFFLL;
}

uint64_t sub_10003C250(uint64_t result)
{
  return result;
}

void sub_10003C2A4(id a1)
{
  int v1 = objc_alloc_init(&OBJC_CLASS___RPFeatureFlagUtility);
  id v2 = (void *)qword_100084848;
  qword_100084848 = (uint64_t)v1;
}

CMSampleBufferRef sub_10003C444(IOSurfaceRef surface, const CMSampleTimingInfo *a2)
{
  CVPixelBufferRef pixelBufferOut = 0LL;
  CMSampleBufferRef sampleBufferOut = 0LL;
  CMVideoFormatDescriptionRef formatDescriptionOut = 0LL;
  CVPixelBufferCreateWithIOSurface(kCFAllocatorDefault, surface, 0LL, &pixelBufferOut);
  CMVideoFormatDescriptionCreateForImageBuffer(0LL, pixelBufferOut, &formatDescriptionOut);
  CMSampleBufferCreateForImageBuffer( kCFAllocatorDefault,  pixelBufferOut,  1u,  0LL,  0LL,  formatDescriptionOut,  a2,  &sampleBufferOut);
  if (pixelBufferOut) {
    CFRelease(pixelBufferOut);
  }
  if (formatDescriptionOut) {
    CFRelease(formatDescriptionOut);
  }
  return sampleBufferOut;
}

CMSampleBufferRef sub_10003C4DC(CVImageBufferRef imageBuffer, uint64_t a2)
{
  CMSampleBufferRef sampleBufferOut = 0LL;
  CMVideoFormatDescriptionRef formatDescriptionOut = 0LL;
  __int128 v3 = *(_OWORD *)&kCMTimingInfoInvalid.decodeTimeStamp.value;
  *(_OWORD *)&v9.presentationTimeStamp.CMTimeScale timescale = *(_OWORD *)&kCMTimingInfoInvalid.presentationTimeStamp.timescale;
  *(_OWORD *)&v9.decodeTimeStamp.CMTimeValue value = v3;
  CMTimeEpoch epoch = kCMTimingInfoInvalid.decodeTimeStamp.epoch;
  __int128 v5 = *(_OWORD *)&kCMTimingInfoInvalid.duration.epoch;
  *(_OWORD *)&v9.duration.CMTimeValue value = *(_OWORD *)&kCMTimingInfoInvalid.duration.value;
  *(_OWORD *)&v9.duration.CMTimeEpoch epoch = v5;
  *(_OWORD *)&v9.presentationTimeStamp.CMTimeValue value = *(_OWORD *)a2;
  CMTimeEpoch v6 = *(void *)(a2 + 16);
  v9.decodeTimeStamp.CMTimeEpoch epoch = epoch;
  v9.presentationTimeStamp.CMTimeEpoch epoch = v6;
  if (!CMVideoFormatDescriptionCreateForImageBuffer(kCFAllocatorDefault, imageBuffer, &formatDescriptionOut))
  {
    OSStatus v7 = CMSampleBufferCreateReadyWithImageBuffer( kCFAllocatorDefault,  imageBuffer,  formatDescriptionOut,  &v9,  &sampleBufferOut);
    if (formatDescriptionOut) {
      CFRelease(formatDescriptionOut);
    }
    if (!v7) {
      return sampleBufferOut;
    }
  }

  CMSampleBufferRef result = sampleBufferOut;
  if (sampleBufferOut)
  {
    CFRelease(sampleBufferOut);
    return 0LL;
  }

  return result;
}

CMSampleBufferRef sub_10003C5DC(opaqueCMSampleBuffer *a1, uint64_t a2)
{
  CMSampleBufferRef sampleBufferOut = 0LL;
  CMSampleBufferGetSampleTimingInfoArray(a1, 0LL, 0LL, &numSampleTimingEntries);
  CMItemCount v4 = numSampleTimingEntries;
  if ((unint64_t)numSampleTimingEntries >= 0x38E38E38E38E38FLL)
  {
    return 0LL;
  }

  else
  {
    __int128 v5 = (CMSampleTimingInfo *)malloc(72 * numSampleTimingEntries);
    CMSampleBufferGetSampleTimingInfoArray(a1, v4, v5, &numSampleTimingEntries);
    CMItemCount v6 = numSampleTimingEntries;
    if (numSampleTimingEntries >= 1)
    {
      p_decodeTimeStamp = &v5->decodeTimeStamp;
      __int128 v8 = *(_OWORD *)&kCMTimeInvalid.value;
      CMTimeEpoch epoch = kCMTimeInvalid.epoch;
      CMItemCount v10 = numSampleTimingEntries;
      do
      {
        *(_OWORD *)&p_decodeTimeStamp->CMTimeValue value = v8;
        p_decodeTimeStamp->CMTimeEpoch epoch = epoch;
        *(_OWORD *)&p_decodeTimeStamp[-1].CMTimeValue value = *(_OWORD *)a2;
        p_decodeTimeStamp[-1].CMTimeEpoch epoch = *(void *)(a2 + 16);
        p_decodeTimeStamp += 3;
        --v10;
      }

      while (v10);
    }

    CMSampleBufferCreateCopyWithNewTiming(kCFAllocatorDefault, a1, v6, v5, &sampleBufferOut);
    free(v5);
    return sampleBufferOut;
  }

id sub_10003C708(opaqueCMSampleBuffer *a1, uint64_t a2)
{
  CMItemCount v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  __int128 v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a2));
  [v4 setObject:v5 forKeyedSubscript:@"RPBroadcastProcessExtensionPayloadKeySampleType"];

  CMBlockBufferRef blockBufferOut = 0LL;
  size_t bufferListSizeNeededOut = 0LL;
  CMSampleBufferGetAudioBufferListWithRetainedBlockBuffer( a1,  &bufferListSizeNeededOut,  0LL,  0LL,  0LL,  0LL,  0,  &blockBufferOut);
  size_t v6 = bufferListSizeNeededOut;
  OSStatus v7 = (AudioBufferList *)malloc(bufferListSizeNeededOut);
  CMSampleBufferGetAudioBufferListWithRetainedBlockBuffer(a1, 0LL, v7, v6, 0LL, 0LL, 0, &blockBufferOut);
  __int128 v8 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
  if (v7->mNumberBuffers)
  {
    unint64_t v9 = 0LL;
    p_mData = &v7->mBuffers[0].mData;
    do
    {
      uint64_t v11 = *((unsigned int *)p_mData - 1);
      uint64_t v12 = *p_mData;
      p_mData += 2;
      -[NSMutableData appendBytes:length:](v8, "appendBytes:length:", v12, v11);
      ++v9;
    }

    while (v9 < v7->mNumberBuffers);
  }

  free(v7);
  [v4 setObject:v8 forKeyedSubscript:@"RPBroadcastProcessExtensionPayloadKeyAudioBufferList"];
  FormatDescription = CMSampleBufferGetFormatDescription(a1);
  uint64_t v14 = +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  CMAudioFormatDescriptionGetStreamBasicDescription(FormatDescription),  40LL);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  [v4 setObject:v15 forKeyedSubscript:@"RPBroadcastProcessExtensionPayloadKeyAudioFormatDescription"];
  CMSampleBufferGetSampleTimingInfo(a1, 0LL, &timingInfoOut);
  float v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &timingInfoOut, 72LL));
  [v4 setObject:v16 forKeyedSubscript:@"RPBroadcastProcessExtensionPayloadKeyTimingInfo"];
  uint64_t v17 = +[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", CMSampleBufferGetNumSamples(a1));
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  [v4 setObject:v18 forKeyedSubscript:@"RPBroadcastProcessExtensionPayloadKeyNumSamples"];

  if (blockBufferOut) {
    CFRelease(blockBufferOut);
  }

  return v4;
}

CMSampleBufferRef sub_10003C914(void *a1)
{
  CMAudioFormatDescriptionRef formatDescriptionOut = 0LL;
  CMSampleBufferRef v17 = 0LL;
  id v1 = a1;
  id v2 = (void *)objc_claimAutoreleasedReturnValue([v1 objectForKeyedSubscript:@"RPBroadcastProcessExtensionPayloadKeyNumSamples"]);
  id v3 = [v2 integerValue];

  CMItemCount v4 = (void *)objc_claimAutoreleasedReturnValue([v1 objectForKeyedSubscript:@"RPBroadcastProcessExtensionPayloadKeyTimingInfo"]);
  [v4 getBytes:&sampleTimingArray length:72];
  __int128 v5 = (void *)objc_claimAutoreleasedReturnValue( [v1 objectForKeyedSubscript:@"RPBroadcastProcessExtensionPayloadKeyAudioFormatDescription"]);
  [v5 getBytes:&asbd length:40];
  CMAudioFormatDescriptionCreate(kCFAllocatorDefault, &asbd, 0LL, 0LL, 0LL, 0LL, 0LL, &formatDescriptionOut);
  StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(formatDescriptionOut);
  OSStatus v7 = (void *)objc_claimAutoreleasedReturnValue( [v1 objectForKeyedSubscript:@"RPBroadcastProcessExtensionPayloadKeyAudioBufferList"]);

  if ([v7 length])
  {
    size_t v8 = (size_t)[v7 length];
    unint64_t v9 = (char *)malloc(v8);
    memcpy(v9, [v7 bytes], v8);
    if (v9)
    {
      UInt32 mChannelsPerFrame = StreamBasicDescription->mChannelsPerFrame;
      if (mChannelsPerFrame == 1 || (StreamBasicDescription->mFormatFlags & 0x20) == 0)
      {
        uint64_t v11 = malloc(0x18uLL);
        *(_DWORD *)uint64_t v11 = 1;
        *((_DWORD *)v11 + 2) = mChannelsPerFrame;
        *((_DWORD *)v11 + 3) = v8;
        *((void *)v11 + 2) = v9;
        goto LABEL_13;
      }

      if (mChannelsPerFrame == 2)
      {
        uint64_t v11 = malloc(0x28uLL);
        *(_DWORD *)uint64_t v11 = 2;
        *((_DWORD *)v11 + 2) = 1;
        *((_DWORD *)v11 + 3) = v8 >> 1;
        *((void *)v11 + 2) = v9;
        *((_DWORD *)v11 + 6) = 1;
        *((_DWORD *)v11 + 7) = v8 >> 1;
        *((void *)v11 + 4) = &v9[v8 >> 1];
        goto LABEL_13;
      }

      free(v9);
    }
  }

  uint64_t v11 = 0LL;
LABEL_13:
  CMSampleBufferCreate( kCFAllocatorDefault,  0LL,  0,  0LL,  0LL,  formatDescriptionOut,  (CMItemCount)v3,  1LL,  &sampleTimingArray,  0LL,  0LL,  &v17);
  CMSampleBufferSetDataBufferFromAudioBufferList( v17,  kCFAllocatorDefault,  kCFAllocatorDefault,  0,  (const AudioBufferList *)v11);
  if (formatDescriptionOut) {
    CFRelease(formatDescriptionOut);
  }
  if (v11)
  {
    free(*((void **)v11 + 2));
    free(v11);
  }

  CMSampleBufferRef v12 = v17;

  return v12;
}

CMSampleBufferRef sub_10003CB90(CMTime *a1, uint64_t a2, Float64 a3)
{
  CMSampleBufferRef v15 = 0LL;
  CMAudioFormatDescriptionRef formatDescriptionOut = 0LL;
  __int128 v5 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)&asbd.Float64 mSampleRate = *(_OWORD *)a2;
  *(_OWORD *)&asbd.mBytesPerPacket = v5;
  *(void *)&asbd.mBitsPerChannel = *(void *)(a2 + 32);
  if (CMAudioFormatDescriptionCreate(kCFAllocatorDefault, &asbd, 0LL, 0LL, 0LL, 0LL, 0LL, &formatDescriptionOut))
  {
    if (formatDescriptionOut) {
      CFRelease(formatDescriptionOut);
    }
    size_t v6 = 0LL;
  }

  else
  {
    size_t v6 = formatDescriptionOut;
  }

  StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(v6);
  CMAudioFormatDescriptionRef formatDescriptionOut = 0LL;
  unsigned int mFramesPerPacket = StreamBasicDescription->mFramesPerPacket;
  if (!mFramesPerPacket)
  {
LABEL_27:
    Float64 mSampleRate = 0.0;
    if (!v6) {
      goto LABEL_42;
    }
    goto LABEL_41;
  }

  mBytesPerPacket = (const opaqueCMFormatDescription *)StreamBasicDescription->mBytesPerPacket;
  CMAudioFormatDescriptionRef formatDescriptionOut = mBytesPerPacket;
  if ((_DWORD)mBytesPerPacket != StreamBasicDescription->mBytesPerFrame * mFramesPerPacket)
  {
    goto LABEL_27;
  }

  CMItemCount v10 = (unint64_t)(a3 * 44100.0 / (double)mFramesPerPacket);
  asbd.Float64 mSampleRate = 0.0;
  if (CMBlockBufferCreateWithMemoryBlock( kCFAllocatorDefault,  0LL,  (void)mBytesPerPacket * v10,  kCFAllocatorDefault,  0LL,  0LL,  (void)mBytesPerPacket * v10,  0,  (CMBlockBufferRef *)&asbd))
  {
  }

  else
  {
    if (!CMBlockBufferAssureBlockMemory(*(CMBlockBufferRef *)&asbd.mSampleRate))
    {
      Float64 mSampleRate = asbd.mSampleRate;
      goto LABEL_8;
    }
  }

  if (*(void *)&asbd.mSampleRate) {
    CFRelease(*(CFTypeRef *)&asbd.mSampleRate);
  }
  Float64 mSampleRate = 0.0;
LABEL_8:
  CMTimeMakeWithSeconds(&v13.duration, a3, 44100);
  v13.CMTime presentationTimeStamp = *a1;
  v13.decodeTimeStamp = kCMTimeInvalid;
  if (!CMSampleBufferCreate( kCFAllocatorDefault,  *(CMBlockBufferRef *)&mSampleRate,  1u,  0LL,  0LL,  v6,  v10,  1LL,  &v13,  1LL,  (const size_t *)&formatDescriptionOut,  &v15))
  {
    if (v6) {
      CFRelease(v6);
    }
    if (mSampleRate != 0.0) {
      CFRelease(*(CFTypeRef *)&mSampleRate);
    }
    return v15;
  }

  if (dword_100084688 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100046EE8();
    if (!v6) {
      goto LABEL_42;
    }
    goto LABEL_41;
  }

  if (v6) {
LABEL_41:
  }
    CFRelease(v6);
LABEL_42:
  if (mSampleRate != 0.0) {
    CFRelease(*(CFTypeRef *)&mSampleRate);
  }
  CMSampleBufferRef result = v15;
  if (v15)
  {
    CFRelease(v15);
    return 0LL;
  }

  return result;
}

CMSampleBufferRef sub_10003CEE4(uint64_t a1, const AudioStreamBasicDescription *a2, CMTime *a3)
{
  CMAudioFormatDescriptionRef formatDescriptionOut = 0LL;
  sCMTime buf = 0LL;
  unsigned int v5 = *(_DWORD *)(a1 + 12);
  UInt32 mBytesPerPacket = a2->mBytesPerPacket;
  if (CMAudioFormatDescriptionCreate(kCFAllocatorDefault, a2, 0LL, 0LL, 0LL, 0LL, 0LL, &formatDescriptionOut))
  {
  }

  else
  {
    CMTime presentationTimeStamp = *a3;
    OSStatus v7 = CMAudioSampleBufferCreateWithPacketDescriptions( kCFAllocatorDefault,  0LL,  0,  0LL,  0LL,  formatDescriptionOut,  v5 / mBytesPerPacket,  &presentationTimeStamp,  0LL,  &sbuf);
    CFRelease(formatDescriptionOut);
    if (v7)
    {
    }

    else
    {
      if (!CMSampleBufferSetDataBufferFromAudioBufferList( sbuf,  kCFAllocatorDefault,  kCFAllocatorDefault,  0,  (const AudioBufferList *)a1))
      {
        CMSampleBufferRef v8 = sbuf;
        CMTime presentationTimeStamp = *a3;
        CMSampleBufferSetOutputPresentationTimeStamp(sbuf, &presentationTimeStamp);
        return v8;
      }
    }
  }

  if (sbuf) {
    CFRelease(sbuf);
  }
  return 0LL;
}

void sub_10003D094(const void *a1, void **a2)
{
  if (a1) {
    CFRelease(a1);
  }
  if (a2)
  {
    free(a2[2]);
    free(a2);
  }

float sub_10003D0D4(opaqueCMSampleBuffer *a1)
{
  if (!a1) {
    return 0.0;
  }
  CMSampleBufferGetPresentationTimeStamp(&v2, a1);
  return (float)v2.value / (float)v2.timescale;
}

CGImageRef sub_10003D114(__IOSurface *a1)
{
  if (IOSurfaceGetPixelFormat(a1) == 1380411457)
  {
    uint64_t v12 = kCGImageComponentTypeRequest;
    CMSampleTimingInfo v13 = &off_1000754C0;
    CMTime v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v13,  &v12,  1LL));
    CGImageRef v3 = (CGImageRef)CGImageCreateFromIOSurface(a1, v2);
  }

  else
  {
    IOSurfaceLock(a1, 0, 0LL);
    BaseAddress = IOSurfaceGetBaseAddress(a1);
    size_t BytesPerRow = IOSurfaceGetBytesPerRow(a1);
    size_t Width = IOSurfaceGetWidth(a1);
    size_t Height = IOSurfaceGetHeight(a1);
    size_t AllocSize = IOSurfaceGetAllocSize(a1);
    CFRetain(a1);
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    CMItemCount v10 = CGDataProviderCreateWithData(a1, BaseAddress, AllocSize, (CGDataProviderReleaseDataCallback)sub_10003D2A4);
    CGImageRef v3 = CGImageCreate( Width,  Height,  8uLL,  0x20uLL,  BytesPerRow,  DeviceRGB,  0x2002u,  v10,  0LL,  1,  kCGRenderingIntentDefault);
    CGDataProviderRelease(v10);
    CGColorSpaceRelease(DeviceRGB);
  }

  return v3;
}

void sub_10003D2A4(__IOSurface *a1)
{
}

LABEL_25:
  return v5;
}

__SecTask *sub_10003DF40(_OWORD *a1, const __CFString *a2)
{
  CFErrorRef error = 0LL;
  __int128 v3 = a1[1];
  *(_OWORD *)v10.val = *a1;
  *(_OWORD *)&v10.val[4] = v3;
  CMItemCount v4 = SecTaskCreateWithAuditToken(0LL, &v10);
  Value = v4;
  if (v4)
  {
    size_t v6 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v4, a2, &error);
    CFRelease(Value);
    if (v6)
    {
      CFTypeID TypeID = CFBooleanGetTypeID();
      if (TypeID == CFGetTypeID(v6)) {
        Value = (__SecTask *)CFBooleanGetValue(v6);
      }
      else {
        Value = 0LL;
      }
      CFRelease(v6);
    }

    else
    {
      if (error)
      {
        CMSampleBufferRef v8 = (__CFString *)CFErrorCopyDescription(error);
      }

      return 0LL;
    }
  }

  return Value;
}

id sub_10003E02C(_OWORD *a1, const __CFString *a2, id a3)
{
  CFErrorRef error = 0LL;
  __int128 v5 = a1[1];
  *(_OWORD *)v12.val = *a1;
  *(_OWORD *)&v12.val[4] = v5;
  size_t v6 = SecTaskCreateWithAuditToken(0LL, &v12);
  if (!v6) {
    return 0LL;
  }
  OSStatus v7 = v6;
  CMSampleBufferRef v8 = (void *)SecTaskCopyValueForEntitlement(v6, a2, &error);
  CFRelease(v7);
  if (!v8)
  {
    if (error)
    {
      audit_token_t v10 = (__CFString *)CFErrorCopyDescription(error);
    }

    return 0LL;
  }

  if (a3)
  {
    CFTypeID TypeID = CFArrayGetTypeID();
    if (TypeID == CFGetTypeID(v8)) {
      a3 = [v8 containsObject:a3];
    }
    else {
      a3 = 0LL;
    }
  }

  CFRelease(v8);
  return a3;
}

void sub_10003E168(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS___RPCaptureManager);
  CMTime v2 = (void *)qword_100084860;
  qword_100084860 = (uint64_t)v1;
}

_DWORD *sub_10003E628(uint64_t a1, uint64_t a2)
{
  CMSampleBufferRef result = *(_DWORD **)(a1 + 32);
  if (result[18])
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_10003E68C;
    v3[3] = &unk_100071E60;
    void v3[4] = a2;
    return [result callDelegate:v3];
  }

  return result;
}

id sub_10003E68C(uint64_t a1, void *a2)
{
  return [a2 didCaptureSampleWithType:2 withSampleBuffer:*(void *)(a1 + 32) withTransformFlags:0];
}

void sub_10003E6A0(uint64_t a1)
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = 136446466;
    __int128 v3 = "-[RPCaptureManager startMicrophoneCaptureWithDispatchGroup:]_block_invoke_3";
    __int16 v4 = 1024;
    int v5 = 99;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d mic capture started",  (uint8_t *)&v2,  0x12u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_10003E900(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003EA34(uint64_t a1)
{
  *(_DWORD *)(*(void *)(a1 + 32) + 96LL) = *(_DWORD *)(a1 + 40);
  id v2 = +[RPAppAudioCaptureManager audioCaptureConfigForSystemRecording:processID:contextID:]( &OBJC_CLASS___RPAppAudioCaptureManager,  "audioCaptureConfigForSystemRecording:processID:contextID:",  *(unsigned __int8 *)(*(void *)(a1 + 32) + 112LL),  *(unsigned int *)(a1 + 40),  *(void *)(*(void *)(a1 + 32) + 104LL));
  __int16 v4 = v3;
  int v5 = *(void **)(*(void *)(a1 + 32) + 64LL);
  id v6 = v3;
  if (v5) {
    objc_msgSend(v5, "resumeWithConfig:", v2, v4);
  }
  else {
}
  }

void sub_10003EAEC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

id sub_10003EDA8(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) hasDelegate:*(void *)(a1 + 40)];
  id v3 = [*(id *)(a1 + 32) delegateCount];
  if (v2) {
    BOOL v4 = v3 == (id)1;
  }
  else {
    BOOL v4 = 0;
  }
  if (v4)
  {
    [*(id *)(a1 + 32) stopAllCapture];
  }

  else if (dword_100084688 <= 1)
  {
    int v5 = (int)v3;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = *(_DWORD *)(*(void *)(a1 + 32) + 72LL);
      int v9 = 136446978;
      audit_token_t v10 = "-[RPCaptureManager stopCaptureForDelegate:]_block_invoke";
      __int16 v11 = 1024;
      int v12 = 189;
      __int16 v13 = 1024;
      int v14 = v6;
      __int16 v15 = 1024;
      int v16 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d continue capture state %d with delegate count %d",  (uint8_t *)&v9,  0x1Eu);
    }
  }

  else {
    char v7 = v2;
  }
  if ((v7 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136446466;
    audit_token_t v10 = "-[RPCaptureManager stopCaptureForDelegate:]_block_invoke";
    __int16 v11 = 1024;
    int v12 = 192;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d ignore stopping delegate that is not capturing",  (uint8_t *)&v9,  0x12u);
  }

  return [*(id *)(a1 + 32) removeDelegate:*(void *)(a1 + 40)];
}

void sub_10003F1D8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_10003F1F8(uint64_t a1)
{
  unsigned int v2 = dispatch_group_create();
  id v3 = *(_DWORD **)(a1 + 32);
  if (v3[18])
  {
    if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 48);
      int v11 = 136446722;
      int v12 = "-[RPCaptureManager startCaptureForDelegate:forProcessID:shouldStartMicrophoneCapture:windowSize:systemRecord"
            "ing:contextIDs:mixedRealityCamera:didStartHandler:]_block_invoke";
      __int16 v13 = 1024;
      int v14 = 221;
      __int16 v15 = 2048;
      uint64_t v16 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d added capture delegate %p",  (uint8_t *)&v11,  0x1Cu);
    }
  }

  else
  {
    if (dword_100084688 <= 1)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = *(void *)(a1 + 48);
        int v11 = 136446722;
        int v12 = "-[RPCaptureManager startCaptureForDelegate:forProcessID:shouldStartMicrophoneCapture:windowSize:systemReco"
              "rding:contextIDs:mixedRealityCamera:didStartHandler:]_block_invoke";
        __int16 v13 = 1024;
        int v14 = 217;
        __int16 v15 = 2048;
        uint64_t v16 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d starting capture for delegate %p",  (uint8_t *)&v11,  0x1Cu);
      }

      id v3 = *(_DWORD **)(a1 + 32);
    }

    objc_msgSend( v3,  "startCaptureManagersForProcessID:windowSize:systemRecording:contextIDs:mixedRealityCamera:dispatchGroup:",  *(unsigned int *)(a1 + 80),  *(unsigned __int8 *)(a1 + 84),  *(void *)(a1 + 40),  *(unsigned __int8 *)(a1 + 85),  v2,  *(double *)(a1 + 64),  *(double *)(a1 + 72));
  }

  if (*(_BYTE *)(a1 + 86)) {
    [*(id *)(a1 + 32) startMicrophoneCaptureWithDispatchGroup:v2];
  }
  dispatch_time_t v6 = dispatch_time(0LL, 10000000000LL);
  if (dispatch_group_wait(v2, v6))
  {
    if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136446466;
      int v12 = "-[RPCaptureManager startCaptureForDelegate:forProcessID:shouldStartMicrophoneCapture:windowSize:systemRecord"
            "ing:contextIDs:mixedRealityCamera:didStartHandler:]_block_invoke";
      __int16 v13 = 1024;
      int v14 = 246;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d start timeout",  (uint8_t *)&v11,  0x12u);
    }

    [*(id *)(a1 + 32) stopAllCapture];
    *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 0;
  }

  else
  {
    if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136446466;
      int v12 = "-[RPCaptureManager startCaptureForDelegate:forProcessID:shouldStartMicrophoneCapture:windowSize:systemRecord"
            "ing:contextIDs:mixedRealityCamera:didStartHandler:]_block_invoke";
      __int16 v13 = 1024;
      int v14 = 229;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d start success",  (uint8_t *)&v11,  0x12u);
    }

    *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 1;
    uint64_t v7 = os_transaction_create("com.apple.replayd.screen-capture");
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = *(void **)(v8 + 120);
    *(void *)(v8 + 120) = v7;

    if (*(_BYTE *)(a1 + 86)) {
      int v10 = 2;
    }
    else {
      int v10 = 1;
    }
    *(_DWORD *)(*(void *)(a1 + 32) + 72LL) = v10;
    if (*(void *)(*(void *)(a1 + 32) + 128LL))
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 0;
      [*(id *)(a1 + 32) stopAllCapture];
    }
  }
}

_DWORD *sub_10003F6E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  CMSampleBufferRef result = *(_DWORD **)(a1 + 32);
  if (result[18])
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_10003F74C;
    v4[3] = &unk_100071ED0;
    void v4[4] = a2;
    v4[5] = a3;
    return [result callDelegate:v4];
  }

  return result;
}

id sub_10003F74C(uint64_t a1, void *a2)
{
  return [a2 didCaptureSampleWithType:0 withSampleBuffer:*(void *)(a1 + 32) withTransformFlags:*(void *)(a1 + 40)];
}

void sub_10003F75C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136446466;
    uint64_t v5 = "-[RPCaptureManager startCaptureManagersForProcessID:windowSize:systemRecording:contextIDs:mixedRealityCamera:di"
         "spatchGroup:]_block_invoke_3";
    __int16 v6 = 1024;
    int v7 = 290;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d screen capture started ",  (uint8_t *)&v4,  0x12u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

_DWORD *sub_10003F838(uint64_t a1, uint64_t a2)
{
  CMSampleBufferRef result = *(_DWORD **)(a1 + 32);
  if (result[18])
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_10003F89C;
    v3[3] = &unk_100071E60;
    void v3[4] = a2;
    return [result callDelegate:v3];
  }

  return result;
}

id sub_10003F89C(uint64_t a1, void *a2)
{
  return [a2 didCaptureSampleWithType:1 withSampleBuffer:*(void *)(a1 + 32) withTransformFlags:0];
}

void sub_10003F8B0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136446466;
    uint64_t v5 = "-[RPCaptureManager startCaptureManagersForProcessID:windowSize:systemRecording:contextIDs:mixedRealityCamera:di"
         "spatchGroup:]_block_invoke_3";
    __int16 v6 = 1024;
    int v7 = 311;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d app audio started ",  (uint8_t *)&v4,  0x12u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_10003FB94(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 88LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003FC1C;
  block[3] = &unk_100070D30;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

void sub_10003FC1C(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v2 = (id)objc_claimAutoreleasedReturnValue( +[NSError _rpUserErrorForCode:userInfo:]( &OBJC_CLASS___NSError,  "_rpUserErrorForCode:userInfo:",  -5806LL,  0LL));
  [v1 captureDidFailWithError:v2];
}

void sub_10003FD78(uint64_t a1)
{
  dispatch_group_t v2 = dispatch_group_create();
  [*(id *)(a1 + 32) startMicrophoneCaptureWithDispatchGroup:v2];
}

id sub_10003FFC0(uint64_t a1, void *a2)
{
  return [a2 captureDidFailWithError:*(void *)(a1 + 32)];
}

id sub_10003FFCC(uint64_t a1)
{
  return [*(id *)(a1 + 32) stopAllCapture];
}

void sub_10004061C(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  [*(id *)(a1 + 32) setSessionState:3];
  uint64_t v8 = *(void **)(a1 + 32);
  id v9 = [v7 code];
  int v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 352) outputURL]);
  objc_msgSend( v8,  "reportSummaryEvent:recordedFileSize:",  v9,  +[RPSession getFileSizeForURL:](RPSession, "getFileSizeForURL:", v10));

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 360LL), a2);
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136446978;
    __int16 v13 = "-[RPRecordSession stopRecordingWithHandler:]_block_invoke";
    __int16 v14 = 1024;
    int v15 = 111;
    __int16 v16 = 2112;
    id v17 = v6;
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d movie writer finished writing with output: %@ and error: %@",  (uint8_t *)&v12,  0x26u);
  }

  uint64_t v11 = *(void *)(a1 + 40);
  if (v11) {
    (*(void (**)(uint64_t, id, id))(v11 + 16))(v11, v6, v7);
  }
}

void sub_1000409D8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
  }

  else
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 360);
    *(void *)(v4 + 360) = 0LL;
  }

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(void))(v6 + 16))();
  }
}

void sub_100040A9C(id a1)
{
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.replaykit.RecordSessionDispatchQueue", 0LL);
  dispatch_group_t v2 = (void *)qword_100084870;
  qword_100084870 = (uint64_t)v1;
}

void sub_100040C14(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)CMTime buf = 138412290;
      id v19 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "RPRecordSession: startWriting for movie writer has failed. Error: %@",  buf,  0xCu);
    }

    [*(id *)(a1 + 32) setSessionState:3];
    uint64_t v4 = *(void *)(a1 + 40);
    if (v4) {
      (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
    }
  }

  else
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[RPCaptureManager sharedInstance](&OBJC_CLASS___RPCaptureManager, "sharedInstance"));
    uint64_t v6 = *(unsigned int **)(a1 + 32);
    uint64_t v7 = v6[2];
    id v8 = [v6 microphoneEnabled];
    [*(id *)(a1 + 32) windowSize];
    double v10 = v9;
    double v12 = v11;
    __int16 v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) contextID]);
    __int16 v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", v13));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100040DEC;
    v16[3] = &unk_100071208;
    int v15 = *(void **)(a1 + 40);
    v16[4] = *(void *)(a1 + 32);
    id v17 = v15;
    objc_msgSend( v5,  "startCaptureForDelegate:forProcessID:shouldStartMicrophoneCapture:windowSize:systemRecording:contextIDs:didStartHandler:",  v6,  v7,  v8,  0,  v14,  v16,  v10,  v12);
  }
}

void sub_100040DEC(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v4)
    {
      int v10 = 138412290;
      id v11 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "RPRecordSession: startCapture has failed. Error: %@",  (uint8_t *)&v10,  0xCu);
    }

    [*(id *)(a1 + 32) setSessionState:3];
    uint64_t v5 = *(void *)(a1 + 40);
    if (v5)
    {
      uint64_t v6 = *(void (**)(void))(v5 + 16);
LABEL_10:
      v6();
    }
  }

  else
  {
    if (v4)
    {
      LOWORD(v10) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "RPRecordSession: startCapture has started successfully",  (uint8_t *)&v10,  2u);
    }

    [*(id *)(a1 + 32) setSessionState:1];
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(void **)(v7 + 360);
    *(void *)(v7 + 360) = 0LL;

    uint64_t v9 = *(void *)(a1 + 40);
    if (v9)
    {
      uint64_t v6 = *(void (**)(void))(v9 + 16);
      goto LABEL_10;
    }
  }
}

id *sub_100040FB8(id *result, opaqueCMSampleBuffer *a2)
{
  id v3 = result;
  int v4 = *((_DWORD *)result + 12);
  switch(v4)
  {
    case 2:
      if (([result[4] microphoneEnabled] & 1) == 0)
      {
        DataBuffer = CMSampleBufferGetDataBuffer(a2);
        size_t DataLength = CMBlockBufferGetDataLength(DataBuffer);
        CMBlockBufferFillDataBytes(0, DataBuffer, 0LL, DataLength);
      }

      return (id *)[*((id *)v3[4] + 44) appendAudio2SampleBuffer:a2];
    case 1:
      return (id *)[*((id *)result[4] + 44) appendAudio1SampleBuffer:a2];
    case 0:
      return (id *)[result[4] processSampleBuffer:a2 transformFlags:result[5] movieWriter:*((void *)result[4] + 44)];
  }

  return result;
}

void sub_10004110C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_msgSend( *(id *)(a1 + 40),  "notifyClientSessionDidStopWithError:movieURL:showAlert:",  objc_msgSend(*(id *)(a1 + 32), "code"),  v5,  1);
}

void sub_1000413B4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446722;
    uint64_t v7 = "-[RPRecordSession handleResumeCaptureWithCompletionHandler:]_block_invoke";
    __int16 v8 = 1024;
    int v9 = 286;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d resume capture completed with Error: %@",  (uint8_t *)&v6,  0x1Cu);
  }

  if (v3) {
    uint64_t v4 = 3LL;
  }
  else {
    uint64_t v4 = 1LL;
  }
  [*(id *)(a1 + 32) setSessionState:v4];
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

void sub_1000417D4(uint64_t a1, uint64_t a2)
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = 136446466;
    id v3 = "-[RPRecordSession handleDisplayWarning]_block_invoke";
    __int16 v4 = 1024;
    int v5 = 321;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d notifying client",  (uint8_t *)&v2,  0x12u);
  }

void sub_100041AB0(uint64_t a1, uint64_t a2)
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = 136446466;
    id v3 = "-[RPRecordSession handleDeviceRestrictionWarning]_block_invoke";
    __int16 v4 = 1024;
    int v5 = 350;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d notifying client",  (uint8_t *)&v2,  0x12u);
  }

void sub_100041CB4(uint64_t a1, uint64_t a2)
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = 136446466;
    id v3 = "-[RPRecordSession handleResumeContextIDFailure]_block_invoke";
    __int16 v4 = 1024;
    int v5 = 362;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d notifying client",  (uint8_t *)&v2,  0x12u);
  }

void sub_100041DC4()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "error creating temp directory",  v0,  2u);
  sub_100005D94();
}

void sub_100041E04(void *a1)
{
}

void sub_100041E74(void *a1)
{
}

void sub_100041EE4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100041F50(uint8_t *buf, int a2, _DWORD *a3)
{
  *(_DWORD *)CMTime buf = 67109120;
  *a3 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "_rkDeleteFilesWithPrefix error: %i",  buf,  8u);
}

void sub_100041F98()
{
  int v0 = 136446466;
  uint64_t v1 = "-[RPClipBuffer addFrameToBuffer:isKeyFrame:]";
  __int16 v2 = 1024;
  int v3 = 64;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  " [ERROR] %{public}s:%d nil sample buffer",  (uint8_t *)&v0,  0x12u);
}

void sub_10004202C(void *a1)
{
  id v1 = objc_begin_catch(a1);
  if (dword_100084688 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    int v2 = 136446466;
    int v3 = "-[RPMicAudioCaptureManager observeValueForKeyPath:ofObject:change:context:]";
    __int16 v4 = 1024;
    int v5 = 199;
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  " [ERROR] %{public}s:%d removeObserver failed",  (uint8_t *)&v2,  0x12u);
  }

  objc_end_catch();
}

void sub_100042110()
{
}

void sub_10004218C()
{
}

void sub_100042208()
{
}

void sub_100042284()
{
}

void sub_100042300()
{
  sub_10000B308( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v0,  " [ERROR] %{public}s:%d error=%@",  v1,  v2,  v3,  v4,  2u);
  sub_10000B33C();
}

void sub_10004237C(id *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([*a1 error]);
  [v1 code];
  sub_10000B2D0();
  sub_10000B318();
  sub_10000B2F0( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v2,  " [ERROR] %{public}s:%d Export Trim Video Failed, due to error: %i",  v3,  v4,  v5,  v6,  2u);

  sub_10000B33C();
}

void sub_100042418(void *a1)
{
}

void sub_100042494()
{
}

void sub_100042510(void *a1)
{
}

void sub_10004258C(void *a1)
{
}

void sub_100042608( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100042698()
{
}

void sub_100042714()
{
}

void sub_100042790(void *a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([a1 assetWriter]);
  unsigned int v3 = [v2 status];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a1 assetWriter]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 error]);
  *(_DWORD *)__int16 v8 = 136446978;
  sub_10000B2D0();
  *(_DWORD *)&v8[7] = 583;
  v8[9] = v6;
  unsigned int v9 = v3;
  __int16 v10 = 2112;
  uint64_t v11 = v7;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  " [ERROR] %{public}s:%d asset writer not started with status %d and error %@",  (uint8_t *)v8,  0x22u);
}

void sub_100042880()
{
}

void sub_1000428FC()
{
}

void sub_100042978()
{
}

void sub_1000429F4()
{
}

void sub_100042A70(void *a1)
{
}

void sub_100042AF8()
{
}

void sub_100042B74()
{
}

void sub_100042BF0(void *a1)
{
}

void sub_100042C78( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100042D08()
{
}

void sub_100042D84(double a1, double a2)
{
  float v2 = a1;
  int v4 = 136446978;
  uint64_t v5 = "-[RPSession checkMinWindowSizeRequirement:]";
  float v3 = a2;
  __int16 v6 = 1024;
  int v7 = 995;
  __int16 v8 = 2048;
  double v9 = v2;
  __int16 v10 = 2048;
  double v11 = v3;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  " [ERROR] %{public}s:%d Invalid requirements due to invalid window size of width: %f and height: %f",  (uint8_t *)&v4,  0x26u);
  sub_10000B33C();
}

void sub_100042E38()
{
}

void sub_100042EB4(void *a1)
{
}

void sub_100042F40()
{
  *(_DWORD *)uint64_t v2 = 136446722;
  sub_10000B2D0();
  *(_DWORD *)&v2[7] = 1631;
  v2[9] = v0;
  int v3 = v1;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  " [ERROR] %{public}s:%d reached max dispatch count, dropping sample of type %d",  (uint8_t *)v2,  0x18u);
  sub_10000B300();
}

void sub_100042FD0()
{
}

void sub_100043048()
{
}

void sub_1000430C0()
{
}

void sub_100043138()
{
}

void sub_1000431B0()
{
}

void sub_100043228()
{
}

void sub_1000432A4()
{
}

void sub_100043320()
{
}

void sub_10004339C()
{
}

void sub_100043414()
{
}

void sub_10004348C()
{
}

void sub_100043504()
{
}

void sub_100043580()
{
}

void sub_1000435F8()
{
  *(_DWORD *)uint64_t v2 = 136446722;
  sub_10000B2D0();
  *(_DWORD *)&v2[7] = 193;
  v2[9] = v0;
  int v3 = v1;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  " [ERROR] %{public}s:%d status: %d",  (uint8_t *)v2,  0x18u);
  sub_10000B300();
}

void sub_100043688()
{
}

void sub_100043704()
{
}

void sub_100043780()
{
}

void sub_100043808()
{
}

void sub_100043890()
{
}

void sub_10004390C()
{
}

void sub_100043988()
{
}

void sub_100043A04()
{
}

void sub_100043A80()
{
}

void sub_100043AFC()
{
}

void sub_100043B78()
{
}

void sub_100043BF4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 136446978;
  uint64_t v4 = "-[RPClipSession captureDidFailWithError:]_block_invoke";
  __int16 v5 = 1024;
  int v6 = 310;
  __int16 v7 = 2112;
  uint64_t v8 = v2;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  " [ERROR] %{public}s:%d captureDidFailWithError=%@ stopError=%@",  (uint8_t *)&v3,  0x26u);
  sub_10000B33C();
}

void sub_100043C9C()
{
}

void sub_100043D14()
{
}

void sub_100043D8C()
{
}

void sub_100043E04()
{
}

void sub_100043E7C()
{
  int v0 = 136446466;
  uint64_t v1 = "+[RPReportingAgent sendReportEventWithType:dictionary:withServiceName:clientBundleId:sessionID:]";
  __int16 v2 = 1024;
  int v3 = 128;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  " [ERROR] %{public}s:%d payloadDict cannot be null!",  (uint8_t *)&v0,  0x12u);
}

void sub_100043F10(unsigned __int16 a1, void *a2)
{
  int v2 = 136446978;
  int v3 = "+[RPReportingAgent sendReportEventWithType:dictionary:withServiceName:clientBundleId:sessionID:]";
  __int16 v4 = 1024;
  int v5 = 156;
  __int16 v6 = 1024;
  int v7 = a1;
  __int16 v8 = 1024;
  unsigned int v9 = [a2 code];
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  " [ERROR] %{public}s:%d error reporting eventType:%d error code:%d",  (uint8_t *)&v2,  0x1Eu);
}

void sub_100043FC8(void *a1, const char *a2)
{
}

void sub_100044030(void *a1, const char *a2)
{
}

void sub_100044098(void *a1, const char *a2)
{
}

void sub_100044100(void *a1, const char *a2)
{
}

void sub_100044168(void *a1, const char *a2)
{
}

void sub_1000441D0(void *a1, const char *a2)
{
}

void sub_100044238(void *a1, const char *a2)
{
}

void sub_1000442A0(void *a1, const char *a2)
{
}

void sub_100044308(void *a1, const char *a2)
{
}

void sub_100044370(void *a1, const char *a2)
{
}

void sub_1000443D8(void *a1, const char *a2)
{
}

void sub_100044440(void *a1, const char *a2)
{
}

void sub_1000444A8(void *a1, const char *a2)
{
}

void sub_100044510(void *a1, const char *a2)
{
}

void sub_100044578(void *a1, const char *a2)
{
}

void sub_1000445E0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100044614( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100044648()
{
  int v0 = 136446466;
  uint64_t v1 = "-[RPClientManager stopAllClientsWithHandler:]_block_invoke";
  __int16 v2 = 1024;
  int v3 = 120;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  " [ERROR] %{public}s:%d stop current active session failed",  (uint8_t *)&v0,  0x12u);
}

void sub_1000446DC()
{
}

void sub_100044754()
{
}

void sub_1000447CC()
{
}

void sub_100044844()
{
}

void sub_1000448BC()
{
}

void sub_100044934()
{
}

void sub_1000449AC()
{
}

void sub_100044A24()
{
}

void sub_100044A9C()
{
}

void sub_100044B14()
{
}

void sub_100044B8C()
{
}

void sub_100044C04()
{
}

void sub_100044C7C()
{
}

void sub_100044CF4()
{
}

void sub_100044D6C()
{
}

void sub_100044DE4()
{
}

void sub_100044E5C(int *a1)
{
  int v1 = *a1;
  int v2 = 136446722;
  uint64_t v3 = "-[RPClient pauseCurrentActiveSession]";
  __int16 v4 = 1024;
  int v5 = 227;
  __int16 v6 = 1024;
  int v7 = v1;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  " [ERROR] %{public}s:%d pause not supported for session type %d",  (uint8_t *)&v2,  0x18u);
  sub_10000B300();
}

void sub_100044EF8()
{
}

void sub_100044F74()
{
}

void sub_100044FF0()
{
}

void sub_10004506C()
{
}

void sub_1000450E8()
{
}

void sub_100045164()
{
}

void sub_1000451E0()
{
}

void sub_10004525C()
{
}

void sub_1000452D8()
{
}

void sub_100045354()
{
}

void sub_1000453D0()
{
}

void sub_10004544C()
{
}

void sub_1000454C8()
{
}

void sub_100045544()
{
}

void sub_1000455C0()
{
}

void sub_10004563C()
{
  int v0 = 136446722;
  uint64_t v1 = "-[RPDelegateBase init]";
  __int16 v2 = 1024;
  int v3 = 27;
  __int16 v4 = 2080;
  int v5 = "-[RPDelegateBase init]";
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  " [ERROR] %{public}s:%d %s not using as abstract class",  (uint8_t *)&v0,  0x1Cu);
}

void sub_1000456DC()
{
  int v0 = 136446466;
  uint64_t v1 = "-[RPAngelProxy updateTimer:]";
  __int16 v2 = 1024;
  int v3 = 134;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  " [ERROR] %{public}s:%d timer string nil",  (uint8_t *)&v0,  0x12u);
}

void sub_100045770()
{
}

void sub_1000457EC(uint64_t *a1)
{
  uint64_t v1 = *a1;
  int v2 = 136446722;
  uint64_t v3 = "-[RPAppAudioCaptureManager startWithConfig:outputHandler:didStartHandler:]_block_invoke";
  __int16 v4 = 1024;
  int v5 = 291;
  __int16 v6 = 2048;
  uint64_t v7 = v1;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  " [ERROR] %{public}s:%d (%p) Failed to create audio tap",  (uint8_t *)&v2,  0x1Cu);
  sub_10000B33C();
}

void sub_10004588C(uint64_t a1, int a2)
{
}

void sub_10004590C()
{
}

void sub_100045988()
{
}

void sub_100045A04()
{
}

void sub_100045A80()
{
}

void sub_100045AFC()
{
}

void sub_100045B78()
{
}

void sub_100045BF4()
{
}

void sub_100045C70()
{
}

void sub_100045CEC()
{
}

void sub_100045D68()
{
}

void sub_100045DE4(uint64_t a1, int a2)
{
}

void sub_100045E64()
{
  int v0 = 136446466;
  uint64_t v1 = "+[RPStringUtility rotatingDeviceUniqueID]";
  __int16 v2 = 1024;
  int v3 = 33;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  " [ERROR] %{public}s:%d Could not get NSUserDefaults shared defaults object",  (uint8_t *)&v0,  0x12u);
}

void sub_100045EF8(uint64_t a1)
{
  int v1 = 136446722;
  __int16 v2 = "+[RPStringUtility isInvalidBundleId:]";
  __int16 v3 = 1024;
  int v4 = 54;
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  " [ERROR] %{public}s:%d bundleID=%@ is invalid",  (uint8_t *)&v1,  0x1Cu);
}

void sub_100045F98()
{
}

void sub_100046014()
{
}

void sub_100046090()
{
}

void sub_10004610C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 136446978;
  uint64_t v4 = "-[RPBroadcastSession captureDidFailWithError:]_block_invoke";
  __int16 v5 = 1024;
  int v6 = 446;
  __int16 v7 = 2112;
  uint64_t v8 = v2;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  " [ERROR] %{public}s:%d captureDidFailWithError=%@ stopError=%@",  (uint8_t *)&v3,  0x26u);
  sub_10000B33C();
}

void sub_1000461B4()
{
}

void sub_100046234()
{
}

void sub_1000462B4()
{
  int v0 = 136446978;
  uint64_t v1 = "-[RPBroadcastSession notifyExtensionOfAction:completion:]";
  __int16 v2 = 1024;
  int v3 = 719;
  __int16 v4 = 2080;
  __int16 v5 = "-[RPBroadcastSession notifyExtensionOfAction:completion:]";
  __int16 v6 = 1024;
  int v7 = 5;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  " [ERROR] %{public}s:%d %s notify extension RPBroadcastActionFinish time out after %d seconds",  (uint8_t *)&v0,  0x22u);
  sub_10000B33C();
}

void sub_10004635C()
{
}

void sub_1000463D4()
{
}

void sub_10004644C()
{
}

void sub_1000464C4()
{
}

void sub_100046540()
{
}

void sub_1000465C0()
{
}

void sub_10004663C()
{
}

void sub_1000466BC()
{
}

void sub_100046738(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 136446978;
  uint64_t v4 = "-[RPSystemRecordSession captureDidFailWithError:]_block_invoke";
  __int16 v5 = 1024;
  int v6 = 315;
  __int16 v7 = 2112;
  uint64_t v8 = v2;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  " [ERROR] %{public}s:%d captureDidFailWithError=%@ stopError=%@",  (uint8_t *)&v3,  0x26u);
  sub_10000B33C();
}

void sub_1000467E0(uint64_t a1)
{
  int v1 = 136446722;
  uint64_t v2 = "+[RPPhotosUtility exportVideoToPhotosLibrary:completionHandler:]_block_invoke";
  __int16 v3 = 1024;
  int v4 = 64;
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  " [ERROR] %{public}s:%d Save to Photos error: %@",  (uint8_t *)&v1,  0x1Cu);
}

void sub_100046880()
{
}

void sub_1000468F8()
{
}

void sub_100046970()
{
}

void sub_1000469E8(void *a1)
{
  int v1 = 136446722;
  uint64_t v2 = "-[RPClipWriter setupAssetWriter]";
  __int16 v3 = 1024;
  int v4 = 81;
  __int16 v5 = 1024;
  unsigned int v6 = [a1 code];
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  " [ERROR] %{public}s:%d error: %i",  (uint8_t *)&v1,  0x18u);
}

void sub_100046A88(uint64_t a1)
{
  int v1 = 136446722;
  uint64_t v2 = "-[RPClipWriter waitForCompletionAndFinishWriting:withHandler:]_block_invoke";
  __int16 v3 = 1024;
  int v4 = 221;
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  " [ERROR] %{public}s:%d error finishing asset writing:%@",  (uint8_t *)&v1,  0x1Cu);
}

void sub_100046B28(uint64_t a1)
{
  int v1 = 136446722;
  uint64_t v2 = "-[RPCaptureSession startCaptureWithMicrophoneEnabled:cameraEnabled:contextID:windowSize:handler:]";
  __int16 v3 = 1024;
  int v4 = 52;
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  " [ERROR] %{public}s:%d error found when checking requirements: %@",  (uint8_t *)&v1,  0x1Cu);
}

void sub_100046BC8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 136446978;
  int v4 = "-[RPCaptureSession captureDidFailWithError:]_block_invoke";
  __int16 v5 = 1024;
  int v6 = 186;
  __int16 v7 = 2112;
  uint64_t v8 = v2;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  " [ERROR] %{public}s:%d captureDidFailWithError=%@ stopError=%@",  (uint8_t *)&v3,  0x26u);
}

void sub_100046C74()
{
  int v0 = *__error();
  v1[0] = 67109120;
  v1[1] = v0;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failed to set user dir suffix: %{darwin.errno}d",  (uint8_t *)v1,  8u);
}

void sub_100046CF8()
{
}

void sub_100046D74()
{
}

void sub_100046DF0()
{
}

void sub_100046E6C()
{
}

void sub_100046EE8()
{
}

void sub_100046F64()
{
}

void sub_100046FE0()
{
}

void sub_10004705C()
{
}

void sub_1000470D8()
{
}

void sub_100047154()
{
}

void sub_1000471D0()
{
}

void sub_10004724C()
{
}

void sub_1000472C8()
{
  sub_10000B308( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v0,  " [ERROR] %{public}s:%d error copying entitlment from SecTaskRef, error=%@",  v1,  v2,  v3,  v4,  2u);
}

void sub_100047350()
{
  sub_10000B308( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v0,  " [ERROR] %{public}s:%d error copying entitlment from SecTaskRef, error=%@",  v1,  v2,  v3,  v4,  2u);
}

void sub_1000473D8()
{
  int v0 = 136446466;
  uint64_t v1 = "-[RPCaptureManager updateContextIDs:forProcessID:systemRecording:]";
  __int16 v2 = 1024;
  int v3 = 321;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  " [ERROR] %{public}s:%d missing contextID",  (uint8_t *)&v0,  0x12u);
}

void sub_10004746C(void *a1)
{
  id v1 = objc_claimAutoreleasedReturnValue([a1 localizedDescription]);
  int v2 = 136446722;
  int v3 = "-[RPCaptureManager setAVAudioSessionCategory]";
  __int16 v4 = 1024;
  int v5 = 357;
  __int16 v6 = 2080;
  id v7 = [v1 UTF8String];
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  " [ERROR] %{public}s:%d %s",  (uint8_t *)&v2,  0x1Cu);
}

void sub_10004752C(uint64_t a1)
{
  int v1 = 136446722;
  int v2 = "-[RPRecordSession startRecordingWithMicrophoneEnabled:cameraEnabled:contextID:windowSize:handler:]";
  __int16 v3 = 1024;
  int v4 = 62;
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  " [ERROR] %{public}s:%d error found when checking requirements: %@",  (uint8_t *)&v1,  0x1Cu);
}

void sub_1000475CC()
{
  int v0 = 136446466;
  int v1 = "-[RPRecordSession discardInAppRecordingWithHandler:]_block_invoke";
  __int16 v2 = 1024;
  int v3 = 149;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  " [ERROR] %{public}s:%d Error deleting file",  (uint8_t *)&v0,  0x12u);
}

void sub_100047660(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 136446978;
  int v4 = "-[RPRecordSession captureDidFailWithError:]_block_invoke";
  __int16 v5 = 1024;
  int v6 = 255;
  __int16 v7 = 2112;
  uint64_t v8 = v2;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  " [ERROR] %{public}s:%d captureDidFailWithError=%@ stopError=%@",  (uint8_t *)&v3,  0x26u);
}

id objc_msgSend_createNewBroadcastClientWithBundleID_broadcastExtensionBundleID_broadcastConfigurationData_userInfo_isSystemBroadcast_handler_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "createNewBroadcastClientWithBundleID:broadcastExtensionBundleID:broadcastConfigurationData:userInfo:isSystemB roadcast:handler:");
}

id objc_msgSend_extensionsWithMatchingPointName_baseIdentifier_unwantedActivationRule_completion_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extensionsWithMatchingPointName:baseIdentifier:unwantedActivationRule:completion:");
}

id objc_msgSend_processAcknowledgementSetupBroadcastWithMicrophoneEnabled_cameraEnabled_listenerEndpoint_withHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "processAcknowledgementSetupBroadcastWithMicrophoneEnabled:cameraEnabled:listenerEndpoint:withHandler:");
}

id objc_msgSend_sendReportEventWithType_dictionary_withServiceName_clientBundleId_sessionID_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendReportEventWithType:dictionary:withServiceName:clientBundleId:sessionID:");
}

id objc_msgSend_setupBroadcastWithHostBundleID_broadcastExtensionBundleID_broadcastConfigurationData_userInfo_handler_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "setupBroadcastWithHostBundleID:broadcastExtensionBundleID:broadcastConfigurationData:userInfo:handler:");
}

id objc_msgSend_setupInAppBroadcastExtensionBundleID_broadcastConfigurationData_userInfo_handler_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupInAppBroadcastExtensionBundleID:broadcastConfigurationData:userInfo:handler:");
}

id objc_msgSend_showAlertWithTitle_bodyText_defaultButtonText_secondaryButtonText_url_requireReponse_imageURL_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "showAlertWithTitle:bodyText:defaultButtonText:secondaryButtonText:url:requireReponse:imageURL:");
}

id objc_msgSend_showSavedToPhotosBannerWithPhotosURL_identifier_sessionID_completionHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showSavedToPhotosBannerWithPhotosURL:identifier:sessionID:completionHandler:");
}

id objc_msgSend_startAppAudioCaptureForSystemRecording_processID_contextIDs_outputHandler_didStartHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startAppAudioCaptureForSystemRecording:processID:contextIDs:outputHandler:didStartHandler:");
}

id objc_msgSend_startBroadcastWithMicrophoneEnabled_cameraEnabled_contextID_windowSize_listenerEndpoint_handler_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "startBroadcastWithMicrophoneEnabled:cameraEnabled:contextID:windowSize:listenerEndpoint:handler:");
}

id objc_msgSend_startCaptureForDelegate_forProcessID_shouldStartMicrophoneCapture_windowSize_systemRecording_contextIDs_didStartHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "startCaptureForDelegate:forProcessID:shouldStartMicrophoneCapture:windowSize:systemRecording:contextIDs:didStartHandler:");
}

id objc_msgSend_startCaptureForDelegate_forProcessID_shouldStartMicrophoneCapture_windowSize_systemRecording_contextIDs_mixedRealityCamera_didStartHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "startCaptureForDelegate:forProcessID:shouldStartMicrophoneCapture:windowSize:systemRecording:contextIDs:mixed RealityCamera:didStartHandler:");
}

id objc_msgSend_startCaptureManagersForProcessID_windowSize_systemRecording_contextIDs_mixedRealityCamera_dispatchGroup_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "startCaptureManagersForProcessID:windowSize:systemRecording:contextIDs:mixedRealityCamera:dispatchGroup:");
}

id objc_msgSend_startCaptureWithMicrophoneEnabled_cameraEnabled_contextID_windowSize_handler_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startCaptureWithMicrophoneEnabled:cameraEnabled:contextID:windowSize:handler:");
}

id objc_msgSend_startClipBufferingWithContextID_windowSize_microphoneEnabled_cameraEnabled_withCompletionHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "startClipBufferingWithContextID:windowSize:microphoneEnabled:cameraEnabled:withCompletionHandler:");
}

id objc_msgSend_startClipWithMicrophoneEnabled_cameraEnabled_contextID_windowSize_handler_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startClipWithMicrophoneEnabled:cameraEnabled:contextID:windowSize:handler:");
}

id objc_msgSend_startInAppBroadcastSessionWithContextID_windowSize_microphoneEnabled_cameraEnabled_listenerEndpoint_withHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "startInAppBroadcastSessionWithContextID:windowSize:microphoneEnabled:cameraEnabled:listenerEndpoint:withHandler:");
}

id objc_msgSend_startInAppBroadcastWithContextID_windowSize_microphoneEnabled_cameraEnabled_listenerEndpoint_withHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "startInAppBroadcastWithContextID:windowSize:microphoneEnabled:cameraEnabled:listenerEndpoint:withHandler:");
}

id objc_msgSend_startInAppCaptureSessionWithContextID_windowSize_microphoneEnabled_cameraEnabled_withHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "startInAppCaptureSessionWithContextID:windowSize:microphoneEnabled:cameraEnabled:withHandler:");
}

id objc_msgSend_startInAppCaptureWithContextID_windowSize_microphoneEnabled_cameraEnabled_withHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startInAppCaptureWithContextID:windowSize:microphoneEnabled:cameraEnabled:withHandler:");
}

id objc_msgSend_startInAppClipSessionWithContextID_windowSize_microphoneEnabled_cameraEnabled_withHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startInAppClipSessionWithContextID:windowSize:microphoneEnabled:cameraEnabled:withHandler:");
}

id objc_msgSend_startInAppRecordingSessionWithContextID_windowSize_microphoneEnabled_cameraEnabled_withHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "startInAppRecordingSessionWithContextID:windowSize:microphoneEnabled:cameraEnabled:withHandler:");
}

id objc_msgSend_startInAppRecordingWithContextID_windowSize_microphoneEnabled_cameraEnabled_withHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startInAppRecordingWithContextID:windowSize:microphoneEnabled:cameraEnabled:withHandler:");
}

id objc_msgSend_startRecordingWithMicrophoneEnabled_cameraEnabled_contextID_windowSize_handler_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startRecordingWithMicrophoneEnabled:cameraEnabled:contextID:windowSize:handler:");
}

id objc_msgSend_startSessionWithPID_windowSize_systemRecording_contextIDs_mixedRealityCamera_outputHandler_didStartHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "startSessionWithPID:windowSize:systemRecording:contextIDs:mixedRealityCamera:outputHandler:didStartHandler:");
}

id objc_msgSend_startSystemRecordingSessionWithContextID_windowSize_microphoneEnabled_cameraEnabled_withHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "startSystemRecordingSessionWithContextID:windowSize:microphoneEnabled:cameraEnabled:withHandler:");
}

id objc_msgSend_startSystemRecordingWithContextID_windowSize_microphoneEnabled_cameraEnabled_withHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startSystemRecordingWithContextID:windowSize:microphoneEnabled:cameraEnabled:withHandler:");
}

id objc_msgSend_startSystemRecordingWithMicrophoneEnabled_cameraEnabled_contextID_windowSize_handler_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startSystemRecordingWithMicrophoneEnabled:cameraEnabled:contextID:windowSize:handler:");
}

id objc_msgSend_updateClient_withHostBundleID_broadcastExtensionBundleID_broadcastConfigurationData_userInfo_isSystemBroadcast_handler_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "updateClient:withHostBundleID:broadcastExtensionBundleID:broadcastConfigurationData:userInfo:isSystemBroadcast:handler:");
}

id objc_msgSend_yearForWeekOfYear(void *a1, const char *a2, ...)
{
  return [a1 yearForWeekOfYear];
}