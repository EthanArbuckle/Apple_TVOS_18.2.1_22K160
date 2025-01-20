void sub_4350( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_43D4(uint64_t a1)
{
  id v1 = objc_alloc_init((Class)objc_opt_class(*(void *)(a1 + 32)));
  v2 = (void *)_sharedPlugin;
  _sharedPlugin = (uint64_t)v1;
}

id sub_4600(void *a1)
{
  return [*(id *)(a1[4] + 32) startStreamingForAudioDeviceUID:a1[5] options:a1[6]];
}

id sub_4724(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) stopStreamingForAudioDeviceUID:*(void *)(a1 + 40)];
}

id sub_49AC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateAvailableDevices:*(void *)(a1 + 40) reportAudioDeviceUIDs:*(unsigned __int8 *)(a1 + 48)];
}

id sub_4FF8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _enqueueAudioData:*(void *)(a1 + 40) numSamples:*(unsigned int *)(a1 + 64) startingSampleTime:*(void *)(a1 + 56) forUID:*(void *)(a1 + 48)];
}

id sub_5174(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateNetworkClockWithSynchronizedNetworkTime:*(void *)(a1 + 48) forSampleTime:*(void *)(a1 + 56) networkClockIdentifier:*(void *)(a1 + 64) transportTypeIsUSB:*(unsigned __int8 *)(a1 + 72) forUID:*(void *)(a1 + 40)];
}

id sub_52C4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _useCachedNetworkClockIfPossibleForUID:*(void *)(a1 + 40)];
}

id sub_53D8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startFillingSilenceAudioDataIfApplicableForUID:*(void *)(a1 + 40)];
}

id sub_54FC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateUSBActive:*(unsigned __int8 *)(a1 + 48) forUID:*(void *)(a1 + 40)];
}

uint64_t sub_56CC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_56DC(uint64_t a1)
{
}

void sub_56E4(void *a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1[4] + 24) objectForKeyedSubscript:a1[5]]);
  uint64_t v3 = *(void *)(a1[6] + 8LL);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

id sub_5728(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startCollectingLatencyMetricsWithUniqueID:*(void *)(a1 + 48) forAudioDevic:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

id sub_58A4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishCollectingLatencyMetricsForUniqueID:*(void *)(a1 + 48) withReply:*(void *)(a1 + 40)];
}

void sub_5A48( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

id ContinuityCaptureAudioPlugin_Create(uint64_t a1, const void *a2)
{
  CFUUIDRef v3 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0x44u,  0x3Au,  0xBAu,  0xB8u,  0xE7u,  0xB3u,  0x49u,  0x1Au,  0xB9u,  0x85u,  0xBEu,  0xB9u,  0x18u,  0x70u,  0x30u,  0xDBu);
  if (!CFEqual(a2, v3)) {
    return 0LL;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[CMContinuityCaptureAudioPlugin sharedPlugin]( &OBJC_CLASS___CMContinuityCaptureAudioPlugin,  "sharedPlugin"));
  id v5 = [v4 driverRef];

  return v5;
}

uint64_t sub_5C24(uint64_t a1, int a2, uint64_t a3, char *__dst)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (*(_BYTE *)(v4 + 32))
  {
    double v6 = *(double *)(a3 + 80);
    uint64_t v8 = *(unsigned int *)(v4 + 12);
    unint64_t v7 = *(unsigned int *)(v4 + 16);
    size_t v9 = (v8 * a2);
    unint64_t v10 = v8 * (unint64_t)v6 % v7;
    if (((int)v9 + (int)v10) % v7 <= v10)
    {
      size_t v13 = (v7 - v10);
      size_t v14 = (v9 - v13);
      memcpy(__dst, (const void *)(*(void *)v4 + v10), v13);
      v12 = &__dst[v13];
      v11 = *(const void **)v4;
      size_t v9 = v14;
    }

    else
    {
      v11 = (const void *)(*(void *)v4 + v10);
      v12 = __dst;
    }

    memcpy(v12, v11, v9);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_A744();
  }

  return 0LL;
}

int sub_5CF0( id a1, unsigned int a2, const AudioServerPlugInIOCycleInfo *a3, void *a4, void *a5, unsigned int a6)
{
  return 0;
}

LABEL_10:
            *a6 = v19;
            goto LABEL_11;
          }
        }

        p_ringBuffer->zeroIndexSampleTime = (double)a5;
        v19 = 1;
        if (!a6) {
          goto LABEL_11;
        }
        goto LABEL_10;
      }

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_A894();
      }
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_A814();
    }
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_A7AC();
  }
}

void sub_6200( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_66D8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

id sub_68D0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(_BYTE *)(v2 + 66))
  {
    *(_BYTE *)(v2 + 66) = 1;
    HostTimeClock = CMClockGetHostTimeClock();
    CMClockGetTime((CMTime *)v46, HostTimeClock);
    uint64_t v4 = *(void *)(a1 + 32) + 260LL;
    uint64_t v5 = *(void *)&v46[16];
    *(_OWORD *)uint64_t v4 = *(_OWORD *)v46;
    *(void *)(v4 + 16) = v5;
    double v6 = *(unsigned int **)(a1 + 32);
    if (v6)
    {
      [v6 _inputASBDForMode:v6[76]];
      uint64_t v7 = *(void *)(a1 + 32);
    }

    else
    {
      uint64_t v7 = 0LL;
      uint64_t v47 = 0LL;
      memset(v46, 0, sizeof(v46));
    }

    uint64_t v8 = v7 + 312;
    uint64_t v9 = v47;
    __int128 v10 = *(_OWORD *)&v46[16];
    *(_OWORD *)uint64_t v8 = *(_OWORD *)v46;
    *(_OWORD *)(v8 + 16) = v10;
    *(void *)(v8 + 32) = v9;
    v11 = *(unsigned int **)(a1 + 32);
    if (v11)
    {
      [v11 _outputASBDForMode:v11[76]];
      uint64_t v12 = *(void *)(a1 + 32);
    }

    else
    {
      uint64_t v12 = 0LL;
      uint64_t v47 = 0LL;
      memset(v46, 0, sizeof(v46));
    }

    uint64_t v13 = v12 + 352;
    uint64_t v14 = v47;
    __int128 v15 = *(_OWORD *)&v46[16];
    *(_OWORD *)uint64_t v13 = *(_OWORD *)v46;
    *(_OWORD *)(v13 + 16) = v15;
    *(void *)(v13 + 32) = v14;
    uint64_t v16 = *(void *)(a1 + 32);
    BOOL v17 = (*(_BYTE *)(v16 + 324) & 0x20) != 0 && *(_DWORD *)(v16 + 340) > 1u;
    *(_BYTE *)(v16 + 392) = v17;
    uint64_t v48 = kCMContinuityCaptureAudioDeviceStartOptionsKey_deviceMode;
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *(unsigned int *)(*(void *)(a1 + 32) + 304LL)));
    v49 = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v49,  &v48,  1LL));

    v20 = (void *)objc_claimAutoreleasedReturnValue( +[CMContinuityCaptureAudioPlugin sharedPlugin]( &OBJC_CLASS___CMContinuityCaptureAudioPlugin,  "sharedPlugin"));
    v21 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) deviceUID]);
    [v20 startStreamingForAudioDeviceUID:v21 options:v19];

    *(_BYTE *)(*(void *)(a1 + 32) + 64LL) = 0;
    v22 = *(_BYTE **)(a1 + 32);
    if (v22[424])
    {
      v22[64] = 1;
      v22 = *(_BYTE **)(a1 + 32);
    }

    [v22 samplingRate];
    *(_DWORD *)(*(void *)(a1 + 32) + 68LL) = (v23 * 0.01);
    uint64_t v24 = *(void *)(a1 + 32);
    int v25 = *(_DWORD *)(v24 + 68);
    v26 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v24 + 8) physicalFormat]);
    uint64_t v27 = objc_claimAutoreleasedReturnValue( +[NSMutableData dataWithLength:]( NSMutableData,  "dataWithLength:",  [v26 bytesPerFrame] * v25));
    uint64_t v28 = *(void *)(a1 + 32);
    v29 = *(void **)(v28 + 56);
    *(void *)(v28 + 56) = v27;

    uint64_t v30 = *(void *)(a1 + 32);
    v31 = *(dispatch_source_s **)(v30 + 48);
    if (v31)
    {
      dispatch_source_cancel(v31);
      uint64_t v32 = *(void *)(a1 + 32);
      v33 = *(void **)(v32 + 48);
      *(void *)(v32 + 48) = 0LL;

      uint64_t v30 = *(void *)(a1 + 32);
    }

    dispatch_source_t v34 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  *(dispatch_queue_t *)(v30 + 16));
    uint64_t v35 = *(void *)(a1 + 32);
    v36 = *(void **)(v35 + 48);
    *(void *)(v35 + 48) = v34;

    objc_initWeak((id *)v46, *(id *)(a1 + 32));
    v37 = *(dispatch_source_s **)(*(void *)(a1 + 32) + 48LL);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_6D80;
    handler[3] = &unk_10598;
    objc_copyWeak(&v45, (id *)v46);
    dispatch_source_set_event_handler(v37, handler);
    dispatch_source_set_timer(*(dispatch_source_t *)(*(void *)(a1 + 32) + 48LL), 0xFFFFFFFFFFFFFFFFLL, 0LL, 0LL);
    dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 48LL));
    objc_destroyWeak(&v45);
    objc_destroyWeak((id *)v46);

    uint64_t v2 = *(void *)(a1 + 32);
  }

  *(_BYTE *)(v2 + 65) = 1;
  *(void *)(*(void *)(a1 + 32) + 72LL) = 0LL;
  v38 = (void *)(*(void *)(a1 + 32) + 80LL);
  void *v38 = 0LL;
  v38[1] = 0LL;
  v39 = (void *)(*(void *)(a1 + 32) + 96LL);
  v39[1] = 0LL;
  v39[2] = 0LL;
  void *v39 = 0LL;
  *(_BYTE *)(*(void *)(a1 + 32) + 244LL) = 0;
  v43.receiver = *(id *)(a1 + 32);
  v43.super_class = (Class)&OBJC_CLASS___CMContinuityCaptureAudioDevice;
  id result = objc_msgSendSuper2(&v43, "performStartIO");
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = (_DWORD)result;
  if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL))
  {
    v42 = *(void **)(a1 + 32);
    uint64_t v41 = a1 + 32;
    [v42 _initializeHostTimeForZeroSampleTime];
    id result = *(id *)v41;
    if (*(_BYTE *)(*(void *)v41 + 64LL)) {
      return [result _scheduleWritingNextSilenceFrame];
    }
  }

  return result;
}

void sub_6D38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_6D80(uint64_t a1)
{
  WeakRetained = (unsigned int *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && *((_BYTE *)WeakRetained + 64)) {
    [WeakRetained _writeAudioData:*((void *)WeakRetained + 7) numSamples:WeakRetained[17] startingSampleTime:*((void *)WeakRetained + 9)];
  }
}

void sub_6DF4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

id sub_6E9C(uint64_t a1)
{
  *(_BYTE *)(*(void *)(a1 + 32) + 65LL) = 0;
  *(void *)(*(void *)(a1 + 32) + 72LL) = 0LL;
  uint64_t v2 = (void *)(*(void *)(a1 + 32) + 80LL);
  void *v2 = 0LL;
  v2[1] = 0LL;
  CFUUIDRef v3 = (void *)(*(void *)(a1 + 32) + 96LL);
  v3[1] = 0LL;
  v3[2] = 0LL;
  *CFUUIDRef v3 = 0LL;
  ++*(void *)(*(void *)(a1 + 32) + 224LL);
  double v4 = sub_704C((void *)(*(void *)(a1 + 32) + 120LL));
  uint64_t v5 = *(void *)(a1 + 32);
  if (!*(_BYTE *)(v5 + 67))
  {
    double v6 = (void *)objc_claimAutoreleasedReturnValue( +[CMContinuityCaptureAudioPlugin sharedPlugin]( &OBJC_CLASS___CMContinuityCaptureAudioPlugin,  "sharedPlugin",  v4));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) deviceUID]);
    [v6 stopStreamingForAudioDeviceUID:v7];

    [*(id *)(a1 + 32) _clearTimeSyncClock];
    *(_BYTE *)(*(void *)(a1 + 32) + 66LL) = 0;
    *(_BYTE *)(*(void *)(a1 + 32) + 64LL) = 0;
    *(_DWORD *)(*(void *)(a1 + 32) + 68LL) = 0;
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void **)(v8 + 56);
    *(void *)(v8 + 56) = 0LL;

    uint64_t v5 = *(void *)(a1 + 32);
    __int128 v10 = *(dispatch_source_s **)(v5 + 48);
    if (v10)
    {
      dispatch_source_cancel(v10);
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v12 = *(void **)(v11 + 48);
      *(void *)(v11 + 48) = 0LL;

      uint64_t v5 = *(void *)(a1 + 32);
    }
  }

  v14.receiver = (id)v5;
  v14.super_class = (Class)&OBJC_CLASS___CMContinuityCaptureAudioDevice;
  id result = objc_msgSendSuper2(&v14, "performStopIO", v4);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = (_DWORD)result;
  return result;
}

void sub_7030(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double sub_704C(void *a1)
{
  unint64_t v2 = a1[3];
  __int128 v5 = 0uLL;
  uint64_t v6 = 0LL;
  sub_A148(&v7, v2, &v5);
  CFUUIDRef v3 = (void *)a1[4];
  if (v3)
  {
    a1[5] = v3;
    operator delete(v3);
  }

  double result = *(double *)&v7;
  *((_OWORD *)a1 + 2) = v7;
  a1[6] = v8;
  atomic_store(0LL, a1 + 7);
  return result;
}

uint64_t sub_7118(uint64_t a1, void *a2, uint64_t *a3, void *a4)
{
  uint64_t v8 = *(void *)(a1 + 32);
  unint64_t v9 = atomic_load((unint64_t *)(v8 + 56));
  __int128 v10 = (uint64_t *)(*(void *)(v8 + 32) + 24 * v9);
  uint64_t v11 = *v10;
  uint64_t v12 = v10[1];
  uint64_t v13 = v10[2];
  uint64_t v14 = mach_absolute_time();
  __int128 v15 = *(uint64_t **)(a1 + 40);
  if (v12 >= v14)
  {
    uint64_t v11 = *v15;
    uint64_t v12 = v15[1];
  }

  else
  {
    uint64_t *v15 = v11;
    v15[1] = v12;
    v15[2] = v13;
  }

  *a2 = v11;
  *a3 = v12;
  *a4 = v15[2];
  return 0LL;
}

uint64_t sub_7204(uint64_t a1, uint64_t a2, _BYTE *a3, _BYTE *a4)
{
  uint64_t result = 1970171760LL;
  if (a3)
  {
    if (a4)
    {
      uint64_t result = 0LL;
      *a3 = *(_BYTE *)(a1 + 32);
      *a4 = 1;
    }
  }

  return result;
}

uint64_t sub_7284(uint64_t a1, uint64_t a2, _BYTE *a3, _BYTE *a4)
{
  uint64_t result = 1970171760LL;
  if (a3)
  {
    if (a4)
    {
      uint64_t result = 0LL;
      *a3 = *(_BYTE *)(a1 + 32);
      *a4 = 1;
    }
  }

  return result;
}

id sub_730C(uint64_t a1)
{
  return [*(id *)(a1 + 32) setSamplingRate:*(double *)(a1 + 40)];
}

void sub_73B4(uint64_t a1)
{
  unint64_t v2 = (*(_DWORD *)(*(void *)(a1 + 32) + 376LL) * *(_DWORD *)(a1 + 56));
  if ([*(id *)(a1 + 40) length] == (id)v2)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    BOOL v4 = *(_BYTE *)(v3 + 64) == 0;
    *(_BYTE *)(v3 + 64) = 0;
    BOOL v5 = v4;
    v23[2] = sub_7754;
    v23[3] = &unk_10650;
    __int128 v7 = *(void **)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    v23[4] = *(void *)(a1 + 32);
    uint64_t v25 = v6;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    id v24 = v7;
    int v26 = *(_DWORD *)(a1 + 56);
    uint64_t v8 = objc_retainBlock(v23);
    unint64_t v9 = v8;
    if (v5)
    {
      if (*(void *)(*(void *)(a1 + 32) + 72LL) <= *(void *)(a1 + 48))
      {
        ((void (*)(void *))v8[2])(v8);
        goto LABEL_13;
      }

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) deviceName]);
        uint64_t v18 = *(void *)(*(void *)(a1 + 32) + 72LL);
        v19 = *(void **)(a1 + 48);
        *(_DWORD *)buf = 138412802;
        uint64_t v28 = v17;
        __int16 v29 = 2048;
        uint64_t v30 = v18;
        __int16 v31 = 2048;
        id v32 = v19;
        _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "AudioDevice %@ requesting a configuration change due to enqueued sample time going backwards. old:%llu new:%llu",  buf,  0x20u);
      }

      v20 = *(void **)(a1 + 32);
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472LL;
      v21[2] = sub_77B4;
      v21[3] = &unk_10678;
      uint64_t v13 = v21;
      v21[4] = v9;
      [v20 _handleTimelineChange:v21];
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) deviceName]);
        uint64_t v11 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 138412546;
        uint64_t v28 = v10;
        __int16 v29 = 2048;
        uint64_t v30 = v11;
        _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "AudioDevice %@ requesting a configuration change because it will start writing real samples and it was filling silence frames. sampleTime:%llu",  buf,  0x16u);
      }

      uint64_t v12 = *(void **)(a1 + 32);
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472LL;
      v22[2] = sub_77A8;
      v22[3] = &unk_10678;
      uint64_t v13 = v22;
      v22[4] = v9;
      [v12 _handleTimelineChange:v22];
    }

LABEL_13:
    return;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) deviceName]);
    uint64_t v15 = *(void *)(a1 + 48);
    id v16 = [*(id *)(a1 + 40) length];
    *(_DWORD *)buf = 138413058;
    uint64_t v28 = v14;
    __int16 v29 = 2048;
    uint64_t v30 = v15;
    __int16 v31 = 2048;
    id v32 = v16;
    __int16 v33 = 1024;
    int v34 = v2;
    _os_log_error_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "AudioDevice %@ dropping data for sampleTime %llu, dataLength %lu, expected dataLength %u",  buf,  0x26u);
  }

void sub_76FC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, void *a24)
{
  _Unwind_Resume(a1);
}

id sub_7754(uint64_t a1)
{
  unint64_t v2 = *(_BYTE **)(a1 + 32);
  if (!v2[244])
  {
    [v2 _synchronizeCurrentHostTimeForSampleTime:(double)*(unint64_t *)(a1 + 48)];
    *(_BYTE *)(*(void *)(a1 + 32) + 244LL) = 1;
    unint64_t v2 = *(_BYTE **)(a1 + 32);
  }

  return [v2 _writeAudioData:*(void *)(a1 + 40) numSamples:*(unsigned int *)(a1 + 56) startingSampleTime:*(void *)(a1 + 48)];
}

uint64_t sub_77A8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_77B4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

id sub_7828(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) deviceName]);
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 56);
    int v6 = *(unsigned __int8 *)(a1 + 64);
    *(_DWORD *)buf = 138413314;
    uint64_t v18 = v2;
    __int16 v19 = 2048;
    uint64_t v20 = v3;
    __int16 v21 = 2048;
    uint64_t v22 = v4;
    __int16 v23 = 2048;
    uint64_t v24 = v5;
    __int16 v25 = 1024;
    int v26 = v6;
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "AudioDevice %@ update network clock with synchronizedNetworkTime %llu sampleTime %llu clockIdentifier %llu transportIsUSB %d",  buf,  0x30u);
  }

  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 40);
  unint64_t v9 = *(void *)(a1 + 48);
  [*(id *)(a1 + 32) samplingRate];
  double v11 = (double)v9 / v10 * 1000000000.0;
  uint64_t v12 = *(void **)(a1 + 32);
  if (*(_BYTE *)(a1 + 64)) {
    int v13 = 1667463012;
  }
  else {
    int v13 = 1667463020;
  }
  v15[0] = v7;
  v15[1] = v8 - (unint64_t)v11;
  int v16 = v13;
  return [v12 _updateNetworkClock:v15];
}

id sub_79E0(uint64_t a1, __n128 a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 400LL);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 408LL);
  a2.n128_u64[0] = *(void *)(*(void *)(a1 + 32) + 416LL);
  __n128 v8 = a2;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) deviceName]);
    *(_DWORD *)buf = 138413826;
    double v11 = v5;
    __int16 v12 = 2048;
    uint64_t v13 = v3;
    __int16 v14 = 2048;
    uint64_t v15 = v4;
    __int16 v16 = 1024;
    unsigned int v17 = HIBYTE(v8.n128_u32[0]);
    __int16 v18 = 1024;
    int v19 = v8.n128_u8[2];
    __int16 v20 = 1024;
    int v21 = v8.n128_u8[1];
    __int16 v22 = 1024;
    int v23 = v8.n128_u8[0];
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "AudioDevice %@ use cached network clock clockIdentifier %llu networkTimeForZeroSampleTime %llu transportType '%c%c%c%c'",  buf,  0x38u);
  }

  int v6 = *(void **)(a1 + 32);
  v9[0] = v3;
  v9[1] = v4;
  v9[2] = v8.n128_u64[0];
  return objc_msgSend(v6, "_updateNetworkClock:", v9, *(_OWORD *)&v8);
}

void sub_7DAC( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
}

void sub_7DD0(uint64_t a1)
{
  id v2 = [objc_alloc((Class)CMContinuityCaptureTimeSyncClock) initWithClockIdentifier:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 232);
  *(void *)(v3 + 232) = v2;

  *(void *)(*(void *)(a1 + 32) + 136LL) = *(void *)(a1 + 48);
  unsigned int v15 = 0;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[TSClockManager sharedClockManager](&OBJC_CLASS___TSClockManager, "sharedClockManager"));
  uint64_t v6 = *(void *)(a1 + 40);
  id v14 = 0LL;
  [v5 addMappingFromClockID:v6 toCoreAudioClockDomain:&v15 error:&v14];
  id v7 = v14;

  if (!v7) {
    [*(id *)(a1 + 32) setClockDomain:v15];
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    __n128 v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) deviceName]);
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 48);
    double v11 = (void *)objc_claimAutoreleasedReturnValue(+[TSClockManager sharedClockManager](&OBJC_CLASS___TSClockManager, "sharedClockManager"));
    *(_DWORD *)buf = 138413570;
    unsigned int v17 = v8;
    __int16 v18 = 2048;
    uint64_t v19 = v10;
    __int16 v20 = 2048;
    uint64_t v21 = v9;
    __int16 v22 = 2112;
    int v23 = v11;
    __int16 v24 = 1024;
    unsigned int v25 = v15;
    __int16 v26 = 2112;
    id v27 = v7;
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "AudioDevice %@ new synchronized networkTimeForZeroSampleTime %llu networkClockIdentifier %llu clockManager %@ cloc kDomain %u clockDomainError %@",  buf,  0x3Au);
  }

  uint64_t v12 = *(void *)(a1 + 32) + 400LL;
  uint64_t v13 = *(void *)(a1 + 56);
  *(_OWORD *)uint64_t v12 = *(_OWORD *)(a1 + 40);
  *(void *)(v12 + 16) = v13;
}

void sub_7FA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_8038(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) deviceName]);
    int v3 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 65LL);
    *(_DWORD *)buf = 138412546;
    __n128 v8 = v2;
    __int16 v9 = 1024;
    int v10 = v3;
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "AudioDevice %@ startFillingSilenceAudioDataIfApplicable called. Currently steaming %d",  buf,  0x12u);
  }

  uint64_t v4 = *(void *)(a1 + 32);
  if (*(_BYTE *)(v4 + 65))
  {
    if (!*(_BYTE *)(v4 + 64))
    {
      *(_BYTE *)(v4 + 64) = 1;
      uint64_t v5 = *(void **)(a1 + 32);
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472LL;
      v6[2] = sub_817C;
      v6[3] = &unk_106C8;
      v6[4] = v5;
      [v5 _handleTimelineChange:v6];
    }
  }

id sub_817C(uint64_t a1)
{
  id result = *(id *)(a1 + 32);
  if (*((_BYTE *)result + 65))
  {
    [result _synchronizeCurrentHostTimeForSampleTime:(double)*((unint64_t *)result + 9)];
    return [*(id *)(a1 + 32) _scheduleWritingNextSilenceFrame];
  }

  return result;
}

void sub_823C(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 40)) {
    uint64_t v2 = 1667463012LL;
  }
  else {
    uint64_t v2 = 1667463020LL;
  }
  if ((_DWORD)v2 != [*(id *)(a1 + 32) transportType])
  {
    int v3 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 65LL);
    BOOL v4 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v4)
      {
        uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) deviceName]);
        unsigned int v6 = [*(id *)(a1 + 32) transportType];
        unsigned __int8 v7 = [*(id *)(a1 + 32) transportType] >> 16;
        unsigned __int8 v8 = (unsigned __int16)[*(id *)(a1 + 32) transportType] >> 8;
        unsigned __int8 v9 = [*(id *)(a1 + 32) transportType];
        int v10 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 65LL);
        int v17 = 138414594;
        __int16 v18 = v5;
        __int16 v19 = 1024;
        unsigned int v20 = HIBYTE(v6);
        __int16 v21 = 1024;
        int v22 = v7;
        __int16 v23 = 1024;
        int v24 = v8;
        __int16 v25 = 1024;
        int v26 = v9;
        __int16 v27 = 1024;
        int v28 = 99;
        __int16 v29 = 1024;
        int v30 = 99;
        __int16 v31 = 1024;
        int v32 = 119;
        __int16 v33 = 1024;
        int v34 = v2 & 0x6C;
        __int16 v35 = 1024;
        int v36 = v10;
        _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "AudioDevice %@ skip changing transport type from:'%c%c%c%c' to:'%c%c%c%c' streaming %d. TransportType will be updated when clock is synchonized over new transport",  (uint8_t *)&v17,  0x42u);
      }
    }

    else
    {
      if (v4)
      {
        double v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) deviceName]);
        unsigned int v12 = [*(id *)(a1 + 32) transportType];
        unsigned __int8 v13 = [*(id *)(a1 + 32) transportType] >> 16;
        unsigned __int8 v14 = (unsigned __int16)[*(id *)(a1 + 32) transportType] >> 8;
        unsigned __int8 v15 = [*(id *)(a1 + 32) transportType];
        int v16 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 65LL);
        int v17 = 138414594;
        __int16 v18 = v11;
        __int16 v19 = 1024;
        unsigned int v20 = HIBYTE(v12);
        __int16 v21 = 1024;
        int v22 = v13;
        __int16 v23 = 1024;
        int v24 = v14;
        __int16 v25 = 1024;
        int v26 = v15;
        __int16 v27 = 1024;
        int v28 = 99;
        __int16 v29 = 1024;
        int v30 = 99;
        __int16 v31 = 1024;
        int v32 = 119;
        __int16 v33 = 1024;
        int v34 = v2 & 0x6C;
        __int16 v35 = 1024;
        int v36 = v16;
        _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "AudioDevice %@ changing transport type old:'%c%c%c%c' new:'%c%c%c%c' streaming %d.",  (uint8_t *)&v17,  0x42u);
      }

      [*(id *)(a1 + 32) setTransportType:v2];
    }
  }

void sub_84E0(_Unwind_Exception *exception_object)
{
}

void sub_8588(uint64_t a1)
{
}

uint64_t sub_8658(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_8668(uint64_t a1)
{
}

void sub_8670(uint64_t a1)
{
}

id sub_8720(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) deviceName]);
    uint64_t v3 = *(void *)(a1 + 40);
    unsigned int v4 = *(_DWORD *)(*(void *)(a1 + 32) + 304LL);
    unsigned int v5 = *(_DWORD *)(a1 + 48);
    *(_DWORD *)buf = 138414594;
    double v11 = v2;
    __int16 v12 = 2112;
    uint64_t v13 = v3;
    __int16 v14 = 1024;
    unsigned int v15 = HIBYTE(v4);
    __int16 v16 = 1024;
    int v17 = BYTE2(v4);
    __int16 v18 = 1024;
    int v19 = BYTE1(v4);
    __int16 v20 = 1024;
    int v21 = v4;
    __int16 v22 = 1024;
    unsigned int v23 = HIBYTE(v5);
    __int16 v24 = 1024;
    int v25 = BYTE2(v5);
    __int16 v26 = 1024;
    int v27 = BYTE1(v5);
    __int16 v28 = 1024;
    int v29 = v5;
  }

  *(_DWORD *)(*(void *)(a1 + 32) + 304LL) = *(_DWORD *)(a1 + 48);
  unsigned int v6 = *(void **)(a1 + 32);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_88C0;
  v8[3] = &unk_10790;
  v8[4] = v6;
  int v9 = *(_DWORD *)(a1 + 48);
  return [v6 requestConfigurationChange:v8];
}

void sub_88C0(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) deviceName]);
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 8) physicalFormat]);
    int v4 = 138412546;
    unsigned int v5 = v2;
    __int16 v6 = 2112;
    unsigned __int8 v7 = v3;
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "AudioDevice %@ updated format to %@",  (uint8_t *)&v4,  0x16u);
  }

void sub_89B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_8BF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_8DA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_8FA8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_9364(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

LABEL_24:
  __int16 v28 = (unint64_t)v15;
  int v29 = v13;
  result.var1 = v29;
  result.var0 = v28;
  return result;
}

void sub_99D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_9D08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_9D2C(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_9DB0;
  v2[3] = &unk_107E0;
  id v1 = *(void **)(a1 + 40);
  id v3 = *(id *)(a1 + 32);
  id v4 = v1;
  [v3 requestConfigurationChange:v2];
}

void sub_9D9C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
}

void sub_9DB0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  id v3 = *(dispatch_queue_s **)(v1 + 16);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_9E2C;
  v4[3] = &unk_107E0;
  v4[4] = v1;
  id v5 = v2;
  dispatch_sync(v3, v4);
}

uint64_t sub_9E2C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = 0LL;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40LL));
  *(_BYTE *)(*(void *)(a1 + 32) + 67LL) = 0;
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_9EAC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = (os_unfair_lock_s *)(v2 + 40);
  group = (dispatch_group_s *)*(id *)(v2 + 32);
  os_unfair_lock_unlock(v3);
  id v4 = *(void **)(a1 + 40);
  id v5 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 16LL);
  if (group) {
    dispatch_group_notify(group, v5, v4);
  }
  else {
    dispatch_async(v5, v4);
  }
}

void *sub_A148(void *a1, unint64_t a2, __int128 *a3)
{
  *a1 = 0LL;
  a1[1] = 0LL;
  a1[2] = 0LL;
  if (a2)
  {
    sub_A1D4(a1, a2);
    uint64_t v6 = a1[1];
    uint64_t v7 = v6 + 24 * a2;
    uint64_t v8 = 24 * a2;
    do
    {
      __int128 v9 = *a3;
      *(void *)(v6 + 16) = *((void *)a3 + 2);
      *(_OWORD *)uint64_t v6 = v9;
      v6 += 24LL;
      v8 -= 24LL;
    }

    while (v8);
    a1[1] = v7;
  }

  return a1;
}

void sub_A1B8(_Unwind_Exception *exception_object)
{
  id v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }

  _Unwind_Resume(exception_object);
}

char *sub_A1D4(void *a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    sub_A224();
  }
  id result = (char *)sub_A238((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[24 * v4];
  return result;
}

void sub_A224()
{
}

void *sub_A238(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    sub_A2F0();
  }
  return operator new(24 * a2);
}

void sub_A27C(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_A2CC(exception, a1);
}

void sub_A2B8(_Unwind_Exception *a1)
{
}

std::logic_error *sub_A2CC(std::logic_error *a1, const char *a2)
{
  id result = std::logic_error::logic_error(a1, a2);
  return result;
}

void sub_A2F0()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

void sub_A318( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_A350(uint64_t a1)
{
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_debug_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "%@ setting default mode ContinuityCaptureAudioDeviceMode_Default",  (uint8_t *)&v1,  0xCu);
}

void sub_A3CC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_A404(uint64_t a1, uint64_t a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", a2));
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_debug_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "%@ pid:%@ trying to set property",  (uint8_t *)&v4,  0x16u);
}

void sub_A4B4()
{
}

void sub_A51C()
{
}

void sub_A584()
{
}

void sub_A5EC()
{
}

void sub_A654()
{
}

void sub_A6BC(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  int v3 = 134218242;
  uint64_t v4 = a2;
  __int16 v5 = 2112;
  uint64_t v6 = v2;
  _os_log_error_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Told to finish collecting metrics for uniqueID %lld but couldn't find it in %@",  (uint8_t *)&v3,  0x16u);
  sub_5A58();
}

void sub_A744()
{
}

void sub_A7AC()
{
}

void sub_A814()
{
}

void sub_A894()
{
}

void sub_A910(void *a1, double a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 deviceName]);
  int v4 = 138412546;
  uint8_t v5 = v3;
  __int16 v6 = 2048;
  double v7 = a2;
  _os_log_error_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "AudioDevice %@ throwing away first bad zero time stamp for sample time %f because it's in the past",  (uint8_t *)&v4,  0x16u);
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

id objc_msgSend_initWithDeviceUID_deviceName_modelUID_transportLatencyInSeconds_withPlugin_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDeviceUID:deviceName:modelUID:transportLatencyInSeconds:withPlugin:");
}

id objc_msgSend_updateNetworkClockWithSynchronizedNetworkTime_forSampleTime_networkClockIdentifier_transportTypeIsUSB_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "updateNetworkClockWithSynchronizedNetworkTime:forSampleTime:networkClockIdentifier:transportTypeIsUSB:");
}

id objc_msgSend_writeAudioData_numSamples_startingSampleTime_zeroIndexSampleTimeUpdatedOut_zeroIndexSampleTimeOut_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "writeAudioData:numSamples:startingSampleTime:zeroIndexSampleTimeUpdatedOut:zeroIndexSampleTimeOut:");
}