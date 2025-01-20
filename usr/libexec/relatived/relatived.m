void sub_100003978( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000039A4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 eventMask] != (id)1)
  {
    if (qword_100023970 != -1) {
      dispatch_once(&qword_100023970, &stru_10001C668);
    }
    v4 = (void *)qword_100023978;
    if (os_log_type_enabled((os_log_t)qword_100023978, OS_LOG_TYPE_DEBUG))
    {
      v5 = v4;
      int v7 = 134349056;
      id v8 = [v3 eventMask];
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "[RMUserInteractionMonitorAttentionAwareness] event: %{public}llu",  (uint8_t *)&v7,  0xCu);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained sendUserInteractionUpdate];
  }
}
}

void sub_100003CA0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.RelativeMotion", "TempestDataProducer");
  v2 = (void *)qword_100023978;
  qword_100023978 = (uint64_t)v1;
}

void sub_100003CDC(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 8), a2);
  }
}

void sub_100003CEC(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 16), a2);
  }
}

void sub_100003CFC(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

void sub_100003D0C(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

void sub_100003DA4(id a1)
{
  os_log_t v1 = objc_alloc_init(&OBJC_CLASS___RMAudioListenerPoseEngine);
  v2 = (void *)qword_100023C30;
  qword_100023C30 = (uint64_t)v1;
}

void sub_100004244(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 40), a2);
  }
}

void sub_100004254(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 48), a2);
  }
}

void sub_100004264(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 64), a2);
  }
}

void sub_100004274(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 56), a2);
  }
}

void sub_100004284(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 80), a2);
  }
}

uint64_t sub_1000043D4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_1000043E4(uint64_t a1)
{
}

void sub_1000043EC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = *(id *)(v2 + 24);
    if (v3)
    {
      ++v3[10];
    }
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:kCMMediaSessionClientMode]);
  v5 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 40) objectForKeyedSubscript:kCMMediaSessionPredictionIntervalMicroseconds]);
  v6 = objc_opt_new(&OBJC_CLASS___RMAudioListenerPoseEngineClientEntry);
  id v8 = v6;
  if (v6) {
    objc_setProperty_nonatomic_copy(v6, v7, *(id *)(a1 + 56), 8LL);
  }
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v4, v9) & 1) != 0) {
    int64_t v10 = (int)[v4 intValue];
  }
  else {
    int64_t v10 = 0LL;
  }
  if (v8) {
    v8->_int clientMode = v10;
  }
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v5, v11) & 1) != 0) {
    uint64_t v12 = (uint64_t)[v5 unsignedLongLongValue];
  }
  else {
    uint64_t v12 = -1LL;
  }
  if (v8) {
    v8->_predictionIntervalMicroseconds = v12;
  }
  uint64_t v13 = *(void *)(a1 + 32);
  if (v13) {
    v14 = *(void **)(v13 + 48);
  }
  else {
    v14 = 0LL;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"TempestClientModeOverride"]);

  if (v15)
  {
    uint64_t v16 = *(void *)(a1 + 32);
    v17 = v16 ? *(void **)(v16 + 48) : 0LL;
    unint64_t v18 = (unint64_t)[v17 integerForKey:@"TempestClientModeOverride"];
    if ((v18 & 0x8000000000000000LL) == 0)
    {
      unint64_t v19 = v18;
      if (qword_100023970 != -1) {
        dispatch_once(&qword_100023970, &stru_10001C7E8);
      }
      v20 = (os_log_s *)qword_100023978;
      if (os_log_type_enabled((os_log_t)qword_100023978, OS_LOG_TYPE_DEFAULT))
      {
        if (v8) {
          int clientMode = v8->_clientMode;
        }
        else {
          int clientMode = 0;
        }
        v28[0] = 67240448;
        v28[1] = clientMode;
        __int16 v29 = 1026;
        int v30 = v19;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Overriding requested client mode %{public}d with %{public}d",  (uint8_t *)v28,  0xEu);
      }

      if (v8) {
        v8->_int clientMode = v19;
      }
    }
  }

  uint64_t v22 = *(void *)(a1 + 32);
  if (v22) {
    v23 = *(void **)(v22 + 16);
  }
  else {
    v23 = 0LL;
  }
  [v23 setObject:v8 forKey:*(void *)(a1 + 48)];
  if (sub_100004698(*(void *)(a1 + 32)))
  {
    v24 = sub_1000047BC(*(dispatch_queue_t **)(a1 + 32), *(_BYTE *)(a1 + 72));
    uint64_t v25 = objc_claimAutoreleasedReturnValue(v24);
    uint64_t v26 = *(void *)(*(void *)(a1 + 64) + 8LL);
    v27 = *(void **)(v26 + 40);
    *(void *)(v26 + 40) = v25;

    if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL)) {
      sub_100004D24(*(void *)(a1 + 32));
    }
  }
}

uint64_t sub_100004698(uint64_t a1)
{
  uint64_t v1 = a1;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __int128 v9 = 0u;
    __int128 v10 = 0u;
    id v2 = *(id *)(v1 + 16);
    id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v3)
    {
      id v4 = v3;
      uint64_t v5 = *(void *)v10;
      while (2)
      {
        v6 = 0LL;
        do
        {
          if (*(void *)v10 != v5) {
            objc_enumerationMutation(v2);
          }
          int v7 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(v1 + 16),  "objectForKey:",  *(void *)(*((void *)&v9 + 1) + 8 * (void)v6),  (void)v9));
          if (v7 && v7[2])
          {

            uint64_t v1 = 1LL;
            goto LABEL_13;
          }

          v6 = (char *)v6 + 1;
        }

        while (v4 != v6);
        id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }

    uint64_t v1 = 0LL;
LABEL_13:
  }

  return v1;
}

id *sub_1000047BC(dispatch_queue_t *a1, char a2)
{
  id v2 = (id *)a1;
  if (a1)
  {
    dispatch_assert_queue_V2(a1[4]);
    id v4 = (id *)v2[3];
    uint64_t v5 = sub_10000521C((uint64_t)v2);
    if (v4)
    {
      id v6 = v4[1];
      if (v6)
      {
        id v7 = v4[11];

        v4[11] = (id)v5;
        if (v7 == (id)v5 && (a2 & 1) == 0)
        {
          if (qword_100023970 != -1) {
            dispatch_once(&qword_100023970, &stru_10001C7E8);
          }
          id v8 = (os_log_s *)qword_100023978;
          if (os_log_type_enabled((os_log_t)qword_100023978, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Keeping existing CMMediaSession",  buf,  2u);
          }

          id v2 = 0LL;
LABEL_44:

          return v2;
        }
      }

      else
      {
        v4[11] = (id)v5;
      }
    }

    sub_100005174((uint64_t)v2);
    if (qword_100023970 != -1) {
      dispatch_once(&qword_100023970, &stru_10001C7E8);
    }
    __int128 v9 = (os_log_s *)qword_100023978;
    if (os_log_type_enabled((os_log_t)qword_100023978, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Restarting CMMediaSession", buf, 2u);
    }

    __int128 v10 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    __int128 v11 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", sub_1000054D0((uint64_t)v2));
    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v10,  "setObject:forKeyedSubscript:",  v12,  kCMMediaSessionClientMode);

    if (v5 != -1)
    {
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v5));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v10,  "setObject:forKeyedSubscript:",  v13,  kCMMediaSessionPredictionIntervalMicroseconds);
    }

    id v14 = -[CMMediaSession _initWithOptions:](objc_alloc(&OBJC_CLASS___CMMediaSession), "_initWithOptions:", v10);
    sub_100003CDC((uint64_t)v4, v14);

    if ([v2[6] BOOLForKey:@"TempestLogMsl"])
    {
      if (qword_100023970 != -1) {
        dispatch_once(&qword_100023970, &stru_10001C7E8);
      }
      v15 = (os_log_s *)qword_100023978;
      if (os_log_type_enabled((os_log_t)qword_100023978, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Logging MSL", buf, 2u);
      }

      id v16 = sub_10000F490();
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/Tempest/MSL",  v17));

      if (v4) {
        id v19 = v4[1];
      }
      else {
        id v19 = 0LL;
      }
      [v19 _enableLoggingForReplayWithFilenamePrefix:@"tempest" filePath:v18];
    }

    else
    {
      if (qword_100023970 != -1) {
        dispatch_once(&qword_100023970, &stru_10001C7E8);
      }
      v20 = (os_log_s *)qword_100023978;
      if (os_log_type_enabled((os_log_t)qword_100023978, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "MSL logging disabled", buf, 2u);
      }
    }

    *(void *)buf = 0LL;
    v34 = buf;
    uint64_t v35 = 0x2020000000LL;
    uint64_t v36 = 2LL;
    if (v4) {
      id v21 = v4[1];
    }
    else {
      id v21 = 0LL;
    }
    id v22 = v21;
    id v23 = v2[4];
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_100005558;
    v32[3] = &unk_10001C728;
    v32[4] = v2;
    v32[5] = buf;
    unsigned __int8 v24 = [v22 _startPoseUpdatesToQueue:v23 andHandler:v32];

    if ((v24 & 1) != 0)
    {
      sub_100005908((uint64_t)v2);
      if (qword_100023970 != -1) {
        dispatch_once(&qword_100023970, &stru_10001C7E8);
      }
      uint64_t v25 = (os_log_s *)qword_100023978;
      if (os_log_type_enabled((os_log_t)qword_100023978, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v31 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Starting timer to emulate media session status callback",  v31,  2u);
      }

      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472LL;
      v30[2] = sub_100005C7C;
      v30[3] = &unk_10001C750;
      v30[4] = v2;
      dispatch_source_t v26 = sub_100005EDC((dispatch_source_t)v2, v30, 2.0);
      v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
      sub_100003CEC((uint64_t)v4, v27);

      +[RMAudioAccessoryManager setTempestActive:](&OBJC_CLASS___RMAudioAccessoryManager, "setTempestActive:", 1LL);
      id v2 = 0LL;
    }

    else
    {
      if (qword_100023970 != -1) {
        dispatch_once(&qword_100023970, &stru_10001C7E8);
      }
      v28 = (os_log_s *)qword_100023978;
      if (os_log_type_enabled((os_log_t)qword_100023978, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v31 = 0;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Failed to start CMMediaSession", v31, 2u);
      }

      id v2 = (id *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"kRMErrorDomain",  3LL,  0LL));
    }

    _Block_object_dispose(buf, 8);

    goto LABEL_44;
  }

  return v2;
}

void sub_100004D0C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
}

void sub_100004D24(uint64_t a1)
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
    uint64_t v2 = sub_1000054D0(a1);
    if (qword_100023970 != -1) {
      dispatch_once(&qword_100023970, &stru_10001C7E8);
    }
    id v3 = (os_log_s *)qword_100023978;
    if (os_log_type_enabled((os_log_t)qword_100023978, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 67240192;
      v7[1] = v2;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Updating CMMediaSession client mode to %{public}d",  (uint8_t *)v7,  8u);
    }

    id v4 = *(void **)(a1 + 24);
    if (v4) {
      uint64_t v5 = (void *)v4[1];
    }
    else {
      uint64_t v5 = 0LL;
    }
    id v6 = v4;
    [v5 _updateClientMode:v2];
  }

void sub_100004EBC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    id v3 = *(void **)(v2 + 16);
  }
  else {
    id v3 = 0LL;
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:*(void *)(a1 + 40)]);
  if (v4) {
    uint64_t v5 = v4[3];
  }
  else {
    uint64_t v5 = 0LL;
  }

  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    id v7 = *(void **)(v6 + 16);
  }
  else {
    id v7 = 0LL;
  }
  [v7 removeObjectForKey:*(void *)(a1 + 40)];
  int v8 = sub_100004698(*(void *)(a1 + 32));
  uint64_t v9 = *(void *)(a1 + 32);
  if (v8)
  {
    sub_100004D24(v9);
  }

  else
  {
    if (v9) {
      __int128 v10 = *(void **)(v9 + 24);
    }
    else {
      __int128 v10 = 0LL;
    }
    id v11 = v10;
    uint64_t v12 = *(void *)(a1 + 32);
    if (v12 && (uint64_t v13 = *(id *)(v12 + 24)) != 0LL)
    {
      uint64_t v14 = v13[10];
    }

    else
    {
      uint64_t v14 = 0LL;
    }

    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_10000505C;
    v24[3] = &unk_10001C6D8;
    v15 = (char *)v11;
    uint64_t v16 = *(void *)(a1 + 32);
    id v25 = v15;
    uint64_t v26 = v16;
    uint64_t v27 = v14;
    v17 = objc_retainBlock(v24);
    unint64_t v18 = v17;
    if (!v15) {
      goto LABEL_21;
    }
    uint64_t v19 = 72LL;
    if (!v5) {
      uint64_t v19 = 64LL;
    }
    double v20 = *(double *)&v15[v19];
    if (v20 > 0.0)
    {
      dispatch_time_t v21 = dispatch_time(0LL, (uint64_t)(v20 * 1000000000.0));
      uint64_t v22 = *(void *)(a1 + 32);
      if (v22) {
        id v23 = *(dispatch_queue_s **)(v22 + 32);
      }
      else {
        id v23 = 0LL;
      }
      dispatch_after(v21, v23, v18);
    }

    else
    {
LABEL_21:
      ((void (*)(void *))v17[2])(v17);
    }
  }

void sub_10000505C(void *a1)
{
  uint64_t v2 = a1[4];
  if (v2 && *(void *)(v2 + 80) > a1[6])
  {
    if (qword_100023970 != -1) {
      dispatch_once(&qword_100023970, &stru_10001C7E8);
    }
    id v3 = (os_log_s *)qword_100023978;
    if (os_log_type_enabled((os_log_t)qword_100023978, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "Not stopping CMMediaSession because new session is using it",  buf,  2u);
    }
  }

  else
  {
    if (qword_100023970 != -1) {
      dispatch_once(&qword_100023970, &stru_10001C7E8);
    }
    id v4 = (os_log_s *)qword_100023978;
    if (os_log_type_enabled((os_log_t)qword_100023978, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Stopping CMMediaSession", v5, 2u);
    }

    sub_100005174(a1[5]);
  }

void sub_100005174(uint64_t a1)
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
    uint64_t v2 = (id *)*(id *)(a1 + 24);
    if (v2)
    {
      if (v2[1])
      {
        id v3 = v2;
        sub_100005F78(a1);
        [v3[1] _stop];
        [v3[1] _disableLoggingForReplay];
        sub_100003CDC((uint64_t)v3, 0LL);
        +[RMAudioAccessoryManager setTempestActive:](&OBJC_CLASS___RMAudioAccessoryManager, "setTempestActive:", 0LL);
        uint64_t v2 = v3;
      }
    }
  }

uint64_t sub_10000521C(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(result + 32));
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v2 = *(id *)(v1 + 16);
    id v3 = [v2 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v3)
    {
      id v4 = v3;
      char v5 = 0;
      char v6 = 0;
      uint64_t v7 = *(void *)v18;
      unint64_t v8 = -1LL;
      do
      {
        uint64_t v9 = 0LL;
        do
        {
          if (*(void *)v18 != v7) {
            objc_enumerationMutation(v2);
          }
          __int128 v10 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(v1 + 16),  "objectForKey:",  *(void *)(*((void *)&v17 + 1) + 8 * (void)v9),  (void)v17));
          if (v10) {
            unint64_t v11 = v10[2];
          }
          else {
            unint64_t v11 = 0LL;
          }
          if (v8 >= v11) {
            unint64_t v12 = v11;
          }
          else {
            unint64_t v12 = v8;
          }
          BOOL v13 = v11 == 0;
          char v14 = !v13;
          v5 |= v14;
          v6 |= v13;
          if (!v13) {
            unint64_t v8 = v12;
          }

          uint64_t v9 = (char *)v9 + 1;
        }

        while (v4 != v9);
        id v15 = [v2 countByEnumeratingWithState:&v17 objects:v21 count:16];
        id v4 = v15;
      }

      while (v15);

      if ((v5 & 1) != 0) {
        unint64_t v16 = v8;
      }
      else {
        unint64_t v16 = 0LL;
      }
      if ((v6 & 1) != 0) {
        return v16;
      }
      else {
        return v8;
      }
    }

    else
    {

      return -1LL;
    }
  }

  return result;
}

uint64_t sub_10000538C(uint64_t a1, uint64_t a2)
{
  if (!a1) {
    return 0LL;
  }
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v4 = *(id *)(a1 + 16);
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      unint64_t v8 = 0LL;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(a1 + 16),  "objectForKey:",  *(void *)(*((void *)&v12 + 1) + 8 * (void)v8),  (void)v12));
        if (v9 && v9[2] && v9[3] == a2)
        {

          uint64_t v10 = 1LL;
          goto LABEL_14;
        }

        unint64_t v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  uint64_t v10 = 0LL;
LABEL_14:

  return v10;
}

uint64_t sub_1000054D0(uint64_t a1)
{
  if (!a1) {
    return 0LL;
  }
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  uint64_t v2 = 0LL;
  if ((sub_10000538C(a1, 0LL) & 1) == 0)
  {
    uint64_t v2 = 4LL;
    if ((sub_10000538C(a1, 4LL) & 1) == 0)
    {
      uint64_t v2 = 2LL;
      if ((sub_10000538C(a1, 2LL) & 1) == 0)
      {
        uint64_t v2 = 3LL;
      }
    }
  }

  return v2;
}

void sub_100005558(uint64_t a1, void *a2, int a3)
{
  if (a3 == 114) {
    uint64_t v5 = 4LL;
  }
  else {
    uint64_t v5 = 2LL;
  }
  sub_1000055E0(*(void *)(a1 + 32), a2, v5);
  uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
  if (v6 != v5)
  {
    if (a3 == 114)
    {
      sub_100005804(*(void *)(a1 + 32));
    }

    else if (v6 == 4)
    {
      sub_100005888(*(void *)(a1 + 32));
    }

    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v5;
  }

void sub_1000055E0(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 attitude]);
    [v6 quaternion];
    v33[0] = v7;
    unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 attitude]);
    [v8 quaternion];
    v33[1] = v9;
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v5 attitude]);
    [v10 quaternion];
    v33[2] = v11;
    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v5 attitude]);
    [v12 quaternion];
    v33[3] = v13;
    [v5 timestamp];
    v33[4] = v14;
    v33[5] = a3;
    [v5 consumedAuxTimestamp];
    v33[6] = v15;
    [v5 receivedAuxTimestamp];
    v33[7] = v16;
    id v28 = v5;
    [v5 machAbsTimestamp];
    v33[8] = v17;

    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    id v18 = *(id *)(a1 + 16);
    id v19 = [v18 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v30;
      do
      {
        uint64_t v22 = 0LL;
        do
        {
          if (*(void *)v30 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 16) objectForKey:*(void *)(*((void *)&v29 + 1) + 8 * (void)v22)]);
          unsigned __int8 v24 = (void *)v23;
          if (v23 && *(void *)(v23 + 16))
          {
            id v25 = *(void (***)(void, void))(v23 + 8);
            uint64_t v26 = v25;
            uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v33, 72LL));
            ((void (**)(void, void *))v25)[2](v26, v27);
          }

          uint64_t v22 = (char *)v22 + 1;
        }

        while (v20 != v22);
        id v20 = [v18 countByEnumeratingWithState:&v29 objects:v34 count:16];
      }

      while (v20);
    }

    id v5 = v28;
  }
}

void sub_100005804(uint64_t a1)
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
    int v2 = *(_DWORD *)(a1 + 12);
    if (!v2)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100006890;
      block[3] = &unk_10001C750;
      block[4] = a1;
      dispatch_async(&_dispatch_main_q, block);
      int v2 = *(_DWORD *)(a1 + 12);
    }

    *(_DWORD *)(a1 + 12) = v2 + 1;
  }

void sub_100005888(uint64_t a1)
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
    int v2 = *(_DWORD *)(a1 + 12) - 1;
    *(_DWORD *)(a1 + 12) = v2;
    if (!v2)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10000696C;
      block[3] = &unk_10001C750;
      block[4] = a1;
      dispatch_async(&_dispatch_main_q, block);
    }
  }

void sub_100005908(uint64_t a1)
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
    if (*(_BYTE *)(a1 + 9))
    {
      int v2 = *(id *)(a1 + 24);
      if (*(_BYTE *)(a1 + 8))
      {
        if (qword_100023970 != -1) {
          dispatch_once(&qword_100023970, &stru_10001C7E8);
        }
        id v3 = (os_log_s *)qword_100023978;
        if (os_log_type_enabled((os_log_t)qword_100023978, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf[0]) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Keeping existing RMFacePoseCaptureSession",  (uint8_t *)buf,  2u);
        }

        [(id)a1 facePoseCaptureSessionDidConfigure:*(void *)(a1 + 64)];
      }

      else
      {
        if (qword_100023970 != -1) {
          dispatch_once(&qword_100023970, &stru_10001C7E8);
        }
        id v4 = (os_log_s *)qword_100023978;
        if (os_log_type_enabled((os_log_t)qword_100023978, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf[0]) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Starting RMFacePoseCaptureSession",  (uint8_t *)buf,  2u);
        }

        objc_initWeak(buf, (id)a1);
        id v5 = *(id *)(a1 + 64);
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472LL;
        v16[2] = sub_10000609C;
        v16[3] = &unk_10001C7A0;
        v16[4] = a1;
        objc_copyWeak(&v17, buf);
        [v5 startCaptureSessionWithHandler:v16];

        *(_BYTE *)(a1 + _Block_object_dispose(va, 8) = 1;
        objc_destroyWeak(&v17);
        objc_destroyWeak(buf);
      }

      ++*(void *)(a1 + 72);
      [*(id *)(a1 + 56) startLidAngleUpdates];
      if (qword_100023970 != -1) {
        dispatch_once(&qword_100023970, &stru_10001C7E8);
      }
      uint64_t v6 = (os_log_s *)qword_100023978;
      if (os_log_type_enabled((os_log_t)qword_100023978, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Starting timer to control camera pause state",  (uint8_t *)buf,  2u);
      }

      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472LL;
      v15[2] = sub_1000063A0;
      v15[3] = &unk_10001C750;
      v15[4] = a1;
      dispatch_source_t v7 = sub_100005EDC((dispatch_source_t)a1, v15, 0.1);
      unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      sub_100003CFC((uint64_t)v2, v8);

      if (qword_100023970 != -1) {
        dispatch_once(&qword_100023970, &stru_10001C7E8);
      }
      uint64_t v9 = (os_log_s *)qword_100023978;
      if (os_log_type_enabled((os_log_t)qword_100023978, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Starting timer to read lid angle",  (uint8_t *)buf,  2u);
      }

      if (v2) {
        v2[5] = 0xBFF0000000000000LL;
      }
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_100006420;
      v13[3] = &unk_10001C700;
      v13[4] = a1;
      id v14 = v2;
      uint64_t v10 = v2;
      dispatch_source_t v11 = sub_100005EDC((dispatch_source_t)a1, v13, 0.1);
      __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      sub_100003D0C((uint64_t)v10, v12);
    }
  }

void sub_100005C60(_Unwind_Exception *a1)
{
}

void sub_100005C7C(uint64_t a1)
{
  id v5 = @"Time";
  uint64_t v2 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", sub_10000D17C());
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v6 = v3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v6,  &v5,  1LL));

  sub_100005D34(*(void *)(a1 + 32), v4);
}

void sub_100005D34(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
    id v17 = v3;
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"Time"]);
    [v16 doubleValue];
    uint64_t v22 = v4;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    id v5 = *(id *)(a1 + 16);
    id v6 = [v5 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v19;
      do
      {
        uint64_t v9 = 0LL;
        do
        {
          if (*(void *)v19 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 16) objectForKey:*(void *)(*((void *)&v18 + 1) + 8 * (void)v9)]);
          dispatch_source_t v11 = (void *)v10;
          if (v10) {
            __int128 v12 = *(void (***)(void, void))(v10 + 8);
          }
          else {
            __int128 v12 = 0LL;
          }
          uint64_t v13 = v12;
          id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &v22, 8LL));
          ((void (**)(void, void *))v12)[2](v13, v14);

          uint64_t v9 = (char *)v9 + 1;
        }

        while (v7 != v9);
        id v15 = [v5 countByEnumeratingWithState:&v18 objects:v23 count:16];
        id v7 = v15;
      }

      while (v15);
    }

    id v3 = v17;
  }
}

dispatch_source_t sub_100005EDC(dispatch_source_t a1, void *a2, double a3)
{
  id v5 = a2;
  if (a1)
  {
    a1 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  *((dispatch_queue_t *)a1 + 4));
    if (a1)
    {
      dispatch_time_t v6 = dispatch_walltime(0LL, 0LL);
      dispatch_source_set_timer(a1, v6, (unint64_t)(a3 * 1000000000.0), 0LL);
      dispatch_source_set_event_handler(a1, v5);
      dispatch_resume(a1);
    }
  }

  return a1;
}

void sub_100005F78(uint64_t a1)
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
    if (*(_BYTE *)(a1 + 9))
    {
      id v2 = *(id *)(a1 + 24);
      uint64_t v3 = (uint64_t)v2;
      if (v2)
      {
        uint64_t v4 = (dispatch_source_s *)*((void *)v2 + 3);
        if (v4) {
          dispatch_source_cancel(v4);
        }
        sub_100003CFC(v3, 0LL);
        id v5 = *(dispatch_source_s **)(v3 + 32);
        if (v5) {
          dispatch_source_cancel(v5);
        }
        sub_100003D0C(v3, 0LL);
        dispatch_time_t v6 = (dispatch_source_s *)*(id *)(v3 + 16);
        if (v6)
        {
          id v7 = v6;
          dispatch_source_cancel(v6);
        }
      }

      else
      {
        sub_100003CFC(0LL, 0LL);
        sub_100003D0C(0LL, 0LL);
      }

      sub_100003CEC(v3, 0LL);
      [*(id *)(a1 + 56) stopLidAngleUpdates];
      uint64_t v8 = *(void *)(a1 + 72);
      dispatch_time_t v9 = dispatch_time(0LL, 2000000000LL);
      uint64_t v10 = *(dispatch_queue_s **)(a1 + 32);
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      v11[2] = sub_100006590;
      v11[3] = &unk_10001C7C8;
      v11[4] = a1;
      v11[5] = v8;
      dispatch_after(v9, v10, v11);
      [*(id *)(a1 + 64) setCameraPaused:1];
    }
  }

void sub_10000609C(uint64_t a1, void *a2, __int128 *a3)
{
  id v5 = a2;
  dispatch_time_t v6 = *(void **)(a1 + 32);
  if (v6) {
    dispatch_time_t v6 = (void *)v6[4];
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100006174;
  block[3] = &unk_10001C778;
  id v7 = v6;
  objc_copyWeak(&v11, (id *)(a1 + 40));
  id v10 = v5;
  __int128 v12 = *a3;
  uint64_t v13 = *((void *)a3 + 2);
  id v8 = v5;
  dispatch_async(v7, block);

  objc_destroyWeak(&v11);
}

void sub_100006174(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = *(void **)(a1 + 32);
  CMTime v4 = *(CMTime *)(a1 + 48);
  sub_1000061C4((uint64_t)WeakRetained, v2, &v4);
}

void sub_1000061C4(uint64_t a1, void *a2, CMTime *a3)
{
  id v5 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
    if (v5 && *(_BYTE *)(a1 + 10))
    {
      dispatch_time_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"rm_tracked_faces"]);
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 firstObject]);
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"raw_data"]);

      dispatch_time_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"pose"]);
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"rm_camera_id"]);
      if (qword_100023970 != -1) {
        dispatch_once(&qword_100023970, &stru_10001C7E8);
      }
      id v11 = (os_log_s *)qword_100023978;
      if (os_log_type_enabled((os_log_t)qword_100023978, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(v16.value) = 138543618;
        *(CMTimeValue *)((char *)&v16.value + 4) = (CMTimeValue)v10;
        LOWORD(v16.flags) = 2114;
        *(void *)((char *)&v16.flags + 2) = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "[Cam %{public}@] Pose %{public}@",  (uint8_t *)&v16,  0x16u);
      }
    }

    __int128 v12 = *(void **)(a1 + 24);
    if (v12) {
      uint64_t v13 = (void *)v12[1];
    }
    else {
      uint64_t v13 = 0LL;
    }
    CMTime v16 = *a3;
    id v14 = v13;
    id v15 = v12;
    [v14 _feedFaceKitData:v5 timestamp:CMTimeGetSeconds(&v16)];
  }
}

void sub_1000063A0(uint64_t a1)
{
  id v2 = *(id **)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = (id **)v2[3];
    if (v3)
    {
      id v7 = v3;
      id v2 = v3[1];
    }

    else
    {
      id v7 = 0LL;
      id v2 = 0LL;
    }
  }

  else
  {
    id v7 = 0LL;
  }

  CMTime v4 = v2;
  unsigned int v5 = [v4 isRequestingCameraOn];
  dispatch_time_t v6 = *(void **)(a1 + 32);
  if (v6) {
    dispatch_time_t v6 = (void *)v6[8];
  }
  [v6 setCameraPaused:v5 ^ 1];
}

void sub_100006420(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    uint64_t v3 = *(void **)(v2 + 56);
  }
  else {
    uint64_t v3 = 0LL;
  }
  [v3 lidAngle];
  if (v4 >= 0.0)
  {
    double v5 = v4;
    uint64_t v6 = *(void *)(a1 + 40);
    if (v6)
    {
      *(double *)(v6 + 40) = v4;
    }

    else if (fabs(v4) <= 0.1)
    {
      return;
    }

    uint64_t v7 = *(void *)(a1 + 32);
    if (!v7) {
      goto LABEL_21;
    }
    if (!*(_BYTE *)(v7 + 10)) {
      goto LABEL_14;
    }
    if (qword_100023970 != -1) {
      dispatch_once(&qword_100023970, &stru_10001C7E8);
    }
    id v8 = (os_log_s *)qword_100023978;
    if (os_log_type_enabled((os_log_t)qword_100023978, OS_LOG_TYPE_DEBUG))
    {
      int v11 = 134349056;
      double v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "LidAngle %{public}.2f", (uint8_t *)&v11, 0xCu);
    }

    uint64_t v7 = *(void *)(a1 + 32);
    if (v7)
    {
LABEL_14:
      dispatch_time_t v9 = *(id *)(v7 + 24);
      id v10 = v9;
      if (v9) {
        dispatch_time_t v9 = (void *)v9[1];
      }
    }

    else
    {
LABEL_21:
      id v10 = 0LL;
      dispatch_time_t v9 = 0LL;
    }

    [v9 _feedLidAngle:v5];
  }

void sub_100006590(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2 && *(void *)(v2 + 72) > *(void *)(a1 + 40))
  {
    if (qword_100023970 != -1) {
      dispatch_once(&qword_100023970, &stru_10001C7E8);
    }
    uint64_t v3 = (os_log_s *)qword_100023978;
    if (os_log_type_enabled((os_log_t)qword_100023978, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "Not stopping RMFacePoseCaptureSession because new session is using it",  buf,  2u);
    }
  }

  else
  {
    if (qword_100023970 != -1) {
      dispatch_once(&qword_100023970, &stru_10001C7E8);
    }
    double v4 = (os_log_s *)qword_100023978;
    if (os_log_type_enabled((os_log_t)qword_100023978, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Stopping RMFacePoseCaptureSession", v8, 2u);
    }

    uint64_t v5 = *(void *)(a1 + 32);
    if (v5) {
      uint64_t v6 = *(void **)(v5 + 64);
    }
    else {
      uint64_t v6 = 0LL;
    }
    [v6 stopCaptureSession];
    uint64_t v7 = *(void *)(a1 + 32);
    if (v7) {
      *(_BYTE *)(v7 + _Block_object_dispose(va, 8) = 0;
    }
  }

void sub_10000674C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) numberOfCameras];
  if (qword_100023970 != -1) {
    dispatch_once(&qword_100023970, &stru_10001C7E8);
  }
  uint64_t v3 = (void *)qword_100023978;
  if (os_log_type_enabled((os_log_t)qword_100023978, OS_LOG_TYPE_DEFAULT))
  {
    double v4 = *(void **)(a1 + 32);
    uint64_t v5 = v3;
    v9[0] = 67240448;
    v9[1] = [v4 numberOfCameras];
    __int16 v10 = 1026;
    BOOL v11 = v2 != 0LL;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Number of cameras: %{public}d, updating CMMediaSession tracking scheme to %{public}d",  (uint8_t *)v9,  0xEu);
  }

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    uint64_t v7 = *(id *)(v6 + 24);
    id v8 = v7;
    if (v7) {
      uint64_t v7 = (void *)v7[1];
    }
  }

  else
  {
    id v8 = 0LL;
    uint64_t v7 = 0LL;
  }

  [v7 _updateTrackingScheme:v2 != 0];
}

void sub_100006890(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  if (v1) {
    uint64_t v1 = (void *)v1[10];
  }
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    uint64_t v3 = *(void *)(v2 + 32);
  }
  else {
    uint64_t v3 = 0LL;
  }
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10000691C;
  v5[3] = &unk_10001C750;
  v5[4] = *(void *)(a1 + 32);
  double v4 = v1;
  [v4 startUserInteractionUpdatesToQueue:v3 withHandler:v5];
}

void sub_10000691C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    uint64_t v2 = *(id *)(v1 + 24);
    if (v2)
    {
      id v3 = v2;
      uint64_t v2 = (void *)v2[1];
    }

    else
    {
      id v3 = 0LL;
    }
  }

  else
  {
    id v3 = 0LL;
    uint64_t v2 = 0LL;
  }

  [v2 _triggerUserInteractedWithDeviceEvent];
}

id sub_10000696C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    return [*(id *)(v1 + 80) stopUserInteractionUpdates];
  }
  else {
    return [0 stopUserInteractionUpdates];
  }
}

void sub_1000069FC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.RelativeMotion", "TempestDataProducer");
  uint64_t v2 = (void *)qword_100023978;
  qword_100023978 = (uint64_t)v1;
}

LABEL_6:
}

void sub_100006FB4(_Unwind_Exception *a1)
{
}

void sub_100006FE0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) endpoint]);
  uint64_t v8 = sub_100010D64((uint64_t)v7);
  dispatch_time_t v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000070C4;
  block[3] = &unk_10001C810;
  id v10 = *(id *)(a1 + 40);
  id v15 = v6;
  id v16 = v10;
  id v14 = v5;
  id v11 = v6;
  id v12 = v5;
  dispatch_async(v9, block);
}

uint64_t sub_1000070C4(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16LL))(a1[6], a1[4], a1[5]);
}

void sub_1000070D8(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
  }

  else
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL)));
    id v4 = (id)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v3,  1LL,  0LL));

    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }

void sub_100007194(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_100010CA0(a2);
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
  }

  else
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL)));
    id v4 = (id)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v3,  1LL,  0LL));

    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }

uint64_t sub_100007258(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100007268(uint64_t a1)
{
}

void sub_100007270(uint64_t a1, id *a2)
{
  if (a2)
  {
    id v3 = sub_10000944C(a2);
    uint64_t v4 = objc_claimAutoreleasedReturnValue(v3);
    id v7 = (id)v4;
    if (v4) {
      id v5 = (const __CFString *)v4;
    }
    else {
      id v5 = @"Unknown";
    }
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v5];
  }

  else
  {
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = (id)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL),  1LL,  0LL));
    (*(void (**)(uint64_t, const __CFString *))(v6 + 16))(v6, @"RMSpiListClients");
  }
}

void sub_100007314(void *a1, void *a2)
{
  id v3 = a2;
  id v10 = v3;
  if (v3)
  {
    uint64_t v4 = sub_10000944C(v3);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    unsigned int v6 = [v5 isEqualToString:a1[4]];

    if (v6)
    {
      sub_100010CA0((uint64_t)v10);
      ++*(void *)(*(void *)(a1[6] + 8LL) + 24LL);
    }
  }

  else
  {
    uint64_t v7 = a1[5];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  *(void *)(*(void *)(a1[6] + 8LL) + 24LL)));
    dispatch_time_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v8,  1LL,  0LL));
    (*(void (**)(uint64_t, const __CFString *, void *))(v7 + 16))(v7, @"RMSpiDisconnectClient", v9);
  }
}

void sub_10000744C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.RelativeMotion", "InternalService");
  uint64_t v2 = (void *)qword_100023988;
  qword_100023988 = (uint64_t)v1;
}

void sub_1000077B8(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) receiverQueue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100007864;
  block[3] = &unk_10001C8D0;
  id v5 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, block);
}

void *sub_100007864(void *result)
{
  unsigned __int8 v1 = atomic_load((unsigned __int8 *)(result[4] + 8LL));
  if ((v1 & 1) != 0) {
    return (void *)(*(uint64_t (**)(void, void))(result[6] + 16LL))(result[6], result[5]);
  }
  return result;
}

void sub_1000079CC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.RelativeMotion", "TempestDataProducer");
  uint64_t v2 = (void *)qword_100023978;
  qword_100023978 = (uint64_t)v1;
}

id *sub_100007A60(id *a1, void *a2)
{
  id v4 = a2;
  if (a1)
  {
    v8.receiver = a1;
    v8.super_class = (Class)&OBJC_CLASS___RMHeadphoneActivityProvider;
    id v5 = (id *)objc_msgSendSuper2(&v8, "init");
    a1 = v5;
    if (v5)
    {
      objc_storeStrong(v5 + 1, a2);
      objc_setProperty_atomic(a1, v6, 0LL, 24LL);
    }
  }

  return a1;
}

void *sub_100007AE4(void *a1, void *a2)
{
  id v4 = a2;
  if (a1)
  {
    unsigned int v5 = objc_msgSend(objc_getProperty(a1, v3, 24, 1), "unknown");
    if (v5 == [v4 unknown]
      && (unsigned int v7 = objc_msgSend(objc_getProperty(a1, v6, 24, 1), "stationary"),
          v7 == [v4 stationary])
      && (unsigned int v9 = objc_msgSend(objc_getProperty(a1, v8, 24, 1), "walking"),
          v9 == [v4 walking]))
    {
      unsigned int v12 = objc_msgSend(objc_getProperty(a1, v10, 24, 1), "running");
      a1 = (void *)(v12 ^ [v4 running] ^ 1);
    }

    else
    {
      a1 = 0LL;
    }
  }

  return a1;
}

void sub_100007C94(uint64_t a1, void *a2, void *a3)
{
  unsigned int v5 = a2;
  id v6 = a3;
  if (v5)
  {
    if (sub_100007AE4(*(void **)(a1 + 32), v5))
    {
      if (qword_100023970 != -1) {
        dispatch_once(&qword_100023970, &stru_10001C990);
      }
      objc_super v8 = (os_log_s *)qword_100023978;
      if (os_log_type_enabled((os_log_t)qword_100023978, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v23 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "Suppressing duplicate activity: %{public}@",  buf,  0xCu);
      }
    }

    else
    {
      unsigned int v9 = *(void **)(a1 + 32);
      if (v9) {
        objc_setProperty_atomic(v9, v7, v5, 24LL);
      }
      id v10 = objc_alloc(&OBJC_CLASS___NSMutableDictionary);
      v20[0] = kCMHeadphoneEventTypeKey;
      v20[1] = kCMHeadphoneEventPayloadData;
      v21[0] = kCMHeadphoneEventTypeActivity;
      v21[1] = v5;
      id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v21,  v20,  2LL));
      unsigned int v12 = -[NSMutableDictionary initWithDictionary:](v10, "initWithDictionary:", v11);

      if (v6) {
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v12,  "setObject:forKeyedSubscript:",  v6,  kCMHeadphoneEventPayloadError);
      }
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v12,  0LL,  0LL));
      if (v13)
      {
        uint64_t v14 = *(void *)(a1 + 32);
        if (v14) {
          id v15 = *(dispatch_queue_s **)(v14 + 8);
        }
        else {
          id v15 = 0LL;
        }
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472LL;
        v17[2] = sub_100007F50;
        v17[3] = &unk_10001C948;
        id v19 = *(id *)(a1 + 40);
        id v18 = v13;
        dispatch_async(v15, v17);
      }

      else
      {
        if (qword_100023970 != -1) {
          dispatch_once(&qword_100023970, &stru_10001C990);
        }
        id v16 = (os_log_s *)qword_100023978;
        if (os_log_type_enabled((os_log_t)qword_100023978, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v23 = v12;
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "Failed to serialize activity dictionary: %{public}@",  buf,  0xCu);
        }
      }
    }
  }
}

uint64_t sub_100007F50(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

void sub_100007FF4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.RelativeMotion", "TempestDataProducer");
  uint64_t v2 = (void *)qword_100023978;
  qword_100023978 = (uint64_t)v1;
}

id *sub_100008190(id *result, uint64_t a2, uint64_t a3)
{
  if (!a3)
  {
    id v3 = result;
    [result[4] setLastDeviceStatus:a2];
    id v4 = [v3[4] lastDeviceStatus];
    id v5 = v3[4];
    if (v4) {
      return (id *)[v5 notifyDisconnectedToClient];
    }
    else {
      return (id *)[v5 notifyConnectedToClient];
    }
  }

  return result;
}

void sub_100008588(uint64_t a1)
{
  uint64_t v2 = (void (**)(id, void))objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) callbackBlock]);
  v2[2](v2, *(void *)(a1 + 40));
}

void sub_10000888C(_Unwind_Exception *a1)
{
}

void sub_100008918(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  unsigned int v7 = v6;
  if (!v6) {
    goto LABEL_10;
  }
  objc_super v8 = (NSString *)objc_claimAutoreleasedReturnValue([v6 domain]);
  unsigned int v9 = v8;
  if (v8 != CMErrorDomain)
  {

    goto LABEL_10;
  }

  id v10 = [v7 code];

  if (v10 != (id)109)
  {
LABEL_10:
    if (v5)
    {
      if (qword_100023970 != -1) {
        dispatch_once(&qword_100023970, &stru_10001CA00);
      }
      id v15 = (void *)qword_100023978;
      if (os_log_type_enabled((os_log_t)qword_100023978, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = *(void **)(a1 + 32);
        id v17 = v15;
        id v18 = (void *)objc_claimAutoreleasedReturnValue([v16 activeAudioRouteDeviceID]);
        int v20 = 138477827;
        __int128 v21 = v18;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "[RMHeadphoneStatusProvider] Activity supported for device: %{private}@",  (uint8_t *)&v20,  0xCu);
      }

      [*(id *)(a1 + 32) setActivitySupported:1];
      [*(id *)(a1 + 32) notifyConnectedToClient];
    }

    goto LABEL_16;
  }

  if (qword_100023970 != -1) {
    dispatch_once(&qword_100023970, &stru_10001CA00);
  }
  id v11 = (void *)qword_100023978;
  if (os_log_type_enabled((os_log_t)qword_100023978, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v12 = *(void **)(a1 + 32);
    uint64_t v13 = v11;
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v12 activeAudioRouteDeviceID]);
    int v20 = 138477827;
    __int128 v21 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "[RMHeadphoneStatusProvider] Activity not supported for device: %{private}@",  (uint8_t *)&v20,  0xCu);
  }

  [*(id *)(a1 + 32) notifyDisconnectedToClient];
LABEL_16:
  id v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) audioAccessoryManager]);
  [v19 stopActivityUpdates];
}

void sub_100008C10(id a1)
{
  os_log_t v1 = os_log_create("com.apple.RelativeMotion", "TempestDataProducer");
  uint64_t v2 = (void *)qword_100023978;
  qword_100023978 = (uint64_t)v1;
}

double sub_100008CC4@<D0>(id *a1@<X0>, _OWORD *a2@<X8>)
{
  if (a1)
  {
    id v3 = sub_100011104(a1);
    id v5 = (id)objc_claimAutoreleasedReturnValue(v3);
    xpc_connection_get_audit_token(v5, a2);
  }

  else
  {
    double result = 0.0;
    *a2 = 0u;
    a2[1] = 0u;
  }

  return result;
}

BOOL sub_100008D1C(id *a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    CFErrorRef error = 0LL;
    sub_100008CC4(a1, &v35);
    audit_token_t token = v35;
    id v4 = SecTaskCreateWithAuditToken(kCFAllocatorDefault, &token);
    if (v4)
    {
      id v5 = v4;
      CFTypeRef v6 = SecTaskCopyValueForEntitlement(v4, v3, &error);
      CFErrorRef v7 = error;
      if (error)
      {
        if (qword_100023960 != -1) {
          dispatch_once(&qword_100023960, &stru_10001CA20);
        }
        objc_super v8 = (os_log_s *)(id)qword_100023968;
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v34 = v7;
          unsigned int v9 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
          id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%d",  v35.val[0]));
          -[NSMutableString appendString:](v9, "appendString:", v10);

          for (uint64_t i = 1LL; i != 8; ++i)
          {
            -[NSMutableString appendString:](v9, "appendString:", @"|");
            unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%d",  v35.val[i]));
            -[NSMutableString appendString:](v9, "appendString:", v12);
          }

          uint64_t v13 = error;
          uint64_t v14 = v9;
          CFErrorDomain Domain = CFErrorGetDomain(v13);
          CFIndex Code = CFErrorGetCode(error);
          token.val[0] = 138412802;
          *(void *)&token.val[1] = v9;
          LOWORD(token.val[3]) = 2112;
          *(void *)((char *)&token.val[3] + 2) = Domain;
          HIWORD(token.val[5]) = 2048;
          *(void *)&token.val[6] = Code;
          _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "#Warning SecTaskCopyValueForEntitlement failed for token '%@' with error '%@' (%ld)",  (uint8_t *)&token,  0x20u);

          CFErrorRef v7 = v34;
        }

        CFRelease(error);
      }

      if (v6)
      {
        CFTypeID v17 = CFGetTypeID(v6);
        BOOL v18 = v17 == CFBooleanGetTypeID() && CFBooleanGetValue((CFBooleanRef)v6) != 0;
        CFRelease(v6);
        if (v7) {
          goto LABEL_26;
        }
      }

      else
      {
        BOOL v18 = 0LL;
        if (v7)
        {
LABEL_26:
          if (qword_100023960 != -1) {
            dispatch_once(&qword_100023960, &stru_10001CA20);
          }
          uint64_t v26 = (void *)qword_100023968;
          if (os_log_type_enabled((os_log_t)qword_100023968, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v27 = v3;
            id v28 = v26;
            id v29 = -[__CFString UTF8String](v27, "UTF8String");
            audit_token_t token = v35;
            audit_token_to_au32(&token, 0LL, &euidp, &egidp, &ruidp, &rgidp, &pidp, &asidp, 0LL);
            pid_t v30 = pidp;
            __int128 v31 = sub_1000091D4(&v35);
            __int128 v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
            token.val[0] = 136315650;
            *(void *)&token.val[1] = v29;
            LOWORD(token.val[3]) = 1024;
            *(unsigned int *)((char *)&token.val[3] + 2) = v30;
            HIWORD(token.val[4]) = 2112;
            *(void *)&token.val[5] = v32;
            _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "#Warning Issue retrieving entitlement, '%s', pid, %d, executable or bundle, '%@'",  (uint8_t *)&token,  0x1Cu);
          }
        }
      }

      CFRelease(v5);
      goto LABEL_31;
    }

    if (qword_100023960 != -1) {
      dispatch_once(&qword_100023960, &stru_10001CA20);
    }
    id v19 = (os_log_s *)(id)qword_100023968;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
      __int128 v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%d",  v35.val[0]));
      -[NSMutableString appendString:](v20, "appendString:", v21);

      for (uint64_t j = 1LL; j != 8; ++j)
      {
        -[NSMutableString appendString:](v20, "appendString:", @"|");
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%d",  v35.val[j]));
        -[NSMutableString appendString:](v20, "appendString:", v23);
      }

      unsigned __int8 v24 = v20;
      id v25 = -[NSMutableString UTF8String](v24, "UTF8String");
      token.val[0] = 136315138;
      *(void *)&token.val[1] = v25;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "#Warning SecTaskCreateWithAuditToken failed for token '%s'",  (uint8_t *)&token,  0xCu);
    }
  }

  BOOL v18 = 0LL;
LABEL_31:

  return v18;
}

__CFString *sub_1000091D4(_OWORD *a1)
{
  __int128 v2 = a1[1];
  *(_OWORD *)atoken.val = *a1;
  *(_OWORD *)&atoken.val[4] = v2;
  audit_token_to_au32(&atoken, 0LL, &euidp, &egidp, &ruidp, &rgidp, &pidp, &asidp, 0LL);
  if (proc_pidpath(pidp, &atoken, 0x1000u) <= 0) {
    goto LABEL_16;
  }
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", &atoken));
  if (!v3) {
    goto LABEL_16;
  }
  id v4 = v3;
  id v5 = CFStringCreateWithCString(kCFAllocatorDefault, (const char *)[v4 UTF8String], 4u);
  if (v5)
  {
    CFTypeRef v6 = v5;
    CFURLRef v7 = CFURLCreateWithFileSystemPath(kCFAllocatorDefault, v5, kCFURLPOSIXPathStyle, 0);
    if (v7)
    {
      CFURLRef v8 = v7;
      unsigned int v9 = (const __CFURL *)_CFBundleCopyBundleURLForExecutableURL();
      if (v9)
      {
        id v10 = v9;
        id v11 = CFBundleCreate(kCFAllocatorDefault, v9);
        if (v11)
        {
          unsigned int v12 = v11;
          uint64_t v13 = (id)CFBundleGetIdentifier(v11);
          CFRelease(v12);
        }

        else
        {
          uint64_t v13 = 0LL;
        }

        CFRelease(v10);
      }

      else
      {
        uint64_t v13 = 0LL;
      }

      CFRelease(v8);
    }

    else
    {
      uint64_t v13 = 0LL;
    }

    CFRelease(v6);
  }

  else
  {
    uint64_t v13 = 0LL;
  }

  uint64_t v14 = v13;

  if (!v14)
  {
LABEL_16:
    __int128 v15 = a1[1];
    *(_OWORD *)atoken.val = *a1;
    *(_OWORD *)&atoken.val[4] = v15;
    audit_token_to_au32(&atoken, 0LL, &euidp, &egidp, &ruidp, &rgidp, &pidp, &asidp, 0LL);
    if (proc_pidpath(pidp, &atoken, 0x1000u) >= 1) {
      return (__CFString *)(id)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  &atoken));
    }
    uint64_t v14 = 0LL;
  }

  return v14;
}

BOOL sub_1000093F0(BOOL a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    double v4 = sub_100008CC4((id *)a1, v6);
    a1 = TCCAccessCheckAuditToken(v3, v6, 0LL, v4) != 0;
  }

  return a1;
}

id *sub_10000944C(id *a1)
{
  if (a1)
  {
    sub_100008CC4(a1, v3);
    os_log_t v1 = sub_1000091D4(v3);
    a1 = (id *)objc_claimAutoreleasedReturnValue(v1);
  }

  return a1;
}

id *sub_10000947C(id *result)
{
  if (result)
  {
    sub_100008CC4(result, &v1);
    aaudit_token_t token = v1;
    audit_token_to_au32(&atoken, 0LL, &euidp, &egidp, &ruidp, &rgidp, &pidp, &asidp, 0LL);
    return (id *)pidp;
  }

  return result;
}

void sub_1000094D4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.RelativeMotion", "IPC");
  __int128 v2 = (void *)qword_100023968;
  qword_100023968 = (uint64_t)v1;
}

void sub_100009544(id a1)
{
  os_log_t v1 = objc_opt_new(&OBJC_CLASS___RMAudioAccessoryManagerSharedInternal);
  __int128 v2 = (void *)qword_100023C40;
  qword_100023C40 = (uint64_t)v1;
}

LABEL_13:
  }

  else
  {
    LOBYTE(v4) = 0;
  }

  return (char)v4;
}
  }

  else
  {
    LOBYTE(v4) = 0;
  }

  return (char)v4;
}
  }

  else
  {
    LOBYTE(v4) = 0;
  }

  return (char)v4;
}

void sub_1000098AC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_1000098D4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  CFURLRef v7 = WeakRetained;
  if (WeakRetained)
  {
    id v8 = WeakRetained;
    objc_sync_enter(v8);
    [v8 setLastDeviceStatus:a2];
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "managers", 0));
    id v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v16;
      do
      {
        unsigned int v12 = 0LL;
        do
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v9);
          }
          uint64_t v13 = objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v15 + 1) + 8 * (void)v12) deviceMotionStatusHandler]);
          uint64_t v14 = (void *)v13;
          if (v13) {
            (*(void (**)(uint64_t, uint64_t, id))(v13 + 16))(v13, a2, v5);
          }

          unsigned int v12 = (char *)v12 + 1;
        }

        while (v10 != v12);
        id v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }

      while (v10);
    }

    objc_sync_exit(v8);
  }
}

void sub_100009A40(_Unwind_Exception *a1)
{
}

void sub_100009DF8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_100009E20(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = WeakRetained;
    objc_sync_enter(v9);
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "managers", 0));
    id v11 = [v10 countByEnumeratingWithState:&v23 objects:v29 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v24;
      do
      {
        for (uint64_t i = 0LL; i != v11; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v24 != v12) {
            objc_enumerationMutation(v10);
          }
          uint64_t v14 = objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v23 + 1) + 8 * (void)i) deviceMotionHandler]);
          __int128 v15 = (void *)v14;
          if (v14) {
            (*(void (**)(uint64_t, id, id))(v14 + 16))(v14, v5, v6);
          }
        }

        id v11 = [v10 countByEnumeratingWithState:&v23 objects:v29 count:16];
      }

      while (v11);
    }

    double v16 = sub_10000D190();
    objc_msgSend(v9, "setDmSamplesPerSecond:", (char *)objc_msgSend(v9, "dmSamplesPerSecond") + 1);
    [v9 lastDMSampleTime];
    if (v17 + 1.0 < v16)
    {
      objc_msgSend(v9, "setDmSampleRate:", objc_msgSend(v9, "dmSamplesPerSecond"));
      [v9 setDmSamplesPerSecond:0];
      [v9 setLastDMSampleTime:v16];
    }

    [v9 lastDMPrintTime];
    if (v18 + 5.0 >= v16) {
      goto LABEL_25;
    }
    [v9 setLastDMPrintTime:v16];
    if ([v9 requested50HzHeadphoneMotion])
    {
      if (qword_100023970 != -1) {
        dispatch_once(&qword_100023970, &stru_10001CAE8);
      }
      id v19 = (os_log_s *)(id)qword_100023978;
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_24;
      }
      id v20 = [v9 dmSampleRate];
      *(_DWORD *)buf = 134349056;
      id v28 = v20;
      __int128 v21 = "[RMAudioAccessoryManager] current device motion samples per second: %{public}lu. Headphone Motion API set to"
            " 50Hz for user study.";
    }

    else
    {
      if (qword_100023970 != -1) {
        dispatch_once(&qword_100023970, &stru_10001CAE8);
      }
      id v19 = (os_log_s *)(id)qword_100023978;
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_24;
      }
      id v22 = [v9 dmSampleRate];
      *(_DWORD *)buf = 134349056;
      id v28 = v22;
      __int128 v21 = "[RMAudioAccessoryManager] current device motion samples per second: %{public}lu";
    }

    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, v21, buf, 0xCu);
LABEL_24:

LABEL_25:
    objc_sync_exit(v9);
  }
}

void sub_10000A10C(_Unwind_Exception *a1)
{
}

void sub_10000A490( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_10000A4B8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = WeakRetained;
    objc_sync_enter(v9);
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "managers", 0));
    id v11 = [v10 countByEnumeratingWithState:&v21 objects:v27 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v22;
      do
      {
        for (uint64_t i = 0LL; i != v11; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v10);
          }
          uint64_t v14 = objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v21 + 1) + 8 * (void)i) activityHandler]);
          __int128 v15 = (void *)v14;
          if (v14) {
            (*(void (**)(uint64_t, id, id))(v14 + 16))(v14, v5, v6);
          }
        }

        id v11 = [v10 countByEnumeratingWithState:&v21 objects:v27 count:16];
      }

      while (v11);
    }

    double v16 = sub_10000D190();
    objc_msgSend(v9, "setActivitySamplesPerSecond:", (char *)objc_msgSend(v9, "activitySamplesPerSecond") + 1);
    [v9 lastActivitySampleTime];
    if (v17 + 1.0 < v16)
    {
      objc_msgSend(v9, "setActivitySampleRate:", objc_msgSend(v9, "activitySamplesPerSecond"));
      [v9 setActivitySamplesPerSecond:0];
      [v9 setLastActivitySampleTime:v16];
    }

    [v9 lastActivityPrintTime];
    if (v18 + 5.0 < v16)
    {
      [v9 setLastActivityPrintTime:v16];
      if (qword_100023970 != -1) {
        dispatch_once(&qword_100023970, &stru_10001CAE8);
      }
      id v19 = (os_log_s *)(id)qword_100023978;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        id v20 = [v9 activitySampleRate];
        *(_DWORD *)buf = 134349056;
        id v26 = v20;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "[RMAudioAccessoryManager] current activity samples per second: %{public}lu",  buf,  0xCu);
      }
    }

    objc_sync_exit(v9);
  }
}

void sub_10000A734(_Unwind_Exception *a1)
{
}

void sub_10000A84C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

LABEL_27:
  objc_sync_exit(obj);
}

void sub_10000AE48( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_10000B274(_Unwind_Exception *a1)
{
}

void sub_10000B418(_Unwind_Exception *a1)
{
}

void sub_10000B4B4(_Unwind_Exception *a1)
{
}

void sub_10000B568( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_10000B650(_Unwind_Exception *a1)
{
}

void sub_10000B6DC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_10000B76C(_Unwind_Exception *a1)
{
}

void sub_10000B7EC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_10000B8F8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.RelativeMotion", "TempestDataProducer");
  __int128 v2 = (void *)qword_100023978;
  qword_100023978 = (uint64_t)v1;
}

id *sub_10000B928(id *a1, void *a2, char a3)
{
  id v6 = a2;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)&OBJC_CLASS___RMHeadphoneMotionProvider;
    CFURLRef v7 = (id *)objc_msgSendSuper2(&v9, "init");
    a1 = v7;
    if (v7)
    {
      *((_BYTE *)v7 + _Block_object_dispose((const void *)(v1 - 160), 8) = a3;
      objc_storeStrong(v7 + 2, a2);
    }
  }

  return a1;
}

void sub_10000BA68(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    double v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v3,  0LL,  0LL));
    if (v4)
    {
      uint64_t v5 = *(void *)(a1 + 32);
      if (v5) {
        id v6 = *(dispatch_queue_s **)(v5 + 16);
      }
      else {
        id v6 = 0LL;
      }
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472LL;
      v8[2] = sub_10000BBE0;
      v8[3] = &unk_10001C948;
      id v10 = *(id *)(a1 + 40);
      id v9 = v4;
      dispatch_async(v6, v8);
    }

    else
    {
      if (qword_100023970 != -1) {
        dispatch_once(&qword_100023970, &stru_10001CB30);
      }
      CFURLRef v7 = (os_log_s *)qword_100023978;
      if (os_log_type_enabled((os_log_t)qword_100023978, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v12 = v3;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "Failed to serialize CMDeviceMotion object: %{public}@",  buf,  0xCu);
      }
    }
  }
}

uint64_t sub_10000BBE0(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

void sub_10000BC50(id a1)
{
  os_log_t v1 = os_log_create("com.apple.RelativeMotion", "TempestDataProducer");
  __int128 v2 = (void *)qword_100023978;
  qword_100023978 = (uint64_t)v1;
}

id *sub_10000BC80(id *a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (a1)
  {
    v10.receiver = a1;
    v10.super_class = (Class)&OBJC_CLASS___RMConnectionHandlerInternal;
    id v8 = (id *)objc_msgSendSuper2(&v10, "init");
    a1 = v8;
    if (v8)
    {
      objc_storeStrong(v8 + 1, a3);
      objc_storeStrong(a1 + 2, a2);
    }
  }

  return a1;
}

void sub_10000BD18(uint64_t a1)
{
  if (a1)
  {
    sub_100010CA0(*(void *)(a1 + 16));
    __int128 v2 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0LL;

    id v3 = *(void **)(a1 + 8);
    *(void *)(a1 + _Block_object_dispose((const void *)(v1 - 160), 8) = 0LL;
  }

id sub_10000BFBC()
{
  if (qword_100023960 != -1) {
    dispatch_once(&qword_100023960, &stru_10001CBE0);
  }
  return (id)qword_100023968;
}

void sub_10000C51C(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_type_t type = xpc_get_type(v3);
  if (type == (xpc_type_t)&_xpc_type_connection)
  {
    if (qword_100023960 != -1) {
      dispatch_once(&qword_100023960, &stru_10001CBE0);
    }
    id v8 = &selRef_dealloc;
    id v9 = (os_log_s *)qword_100023968;
    if (os_log_type_enabled((os_log_t)qword_100023968, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v35) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "New connection request received",  (uint8_t *)&v35,  2u);
    }

    objc_super v10 = objc_alloc(&OBJC_CLASS___RMConnectionEndpoint);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) queue]);
    id v12 = sub_100010918((id *)&v10->super.isa, v3, v11);

    if ([*(id *)(a1 + 32) isEndpointConnectionAllowed:v12])
    {
      if (qword_100023960 != -1) {
        dispatch_once(&qword_100023960, &stru_10001CBE0);
      }
      uint64_t v13 = (void *)qword_100023968;
      if (os_log_type_enabled((os_log_t)qword_100023968, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = v13;
        __int128 v15 = sub_100011104(v12);
        double v16 = (char *)objc_claimAutoreleasedReturnValue(v15);
        double v17 = sub_10000944C(v12);
        double v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
        unsigned int v19 = sub_10000947C(v12);
        int v35 = 134284035;
        name = v16;
        __int16 v37 = 2114;
        v38 = v18;
        __int16 v39 = 1025;
        unsigned int v40 = v19;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Accepted connection %{private}p from %{public}@ (%{private}d)",  (uint8_t *)&v35,  0x1Cu);
      }

      sub_100011120(v12, *(void **)(a1 + 32));
      id v20 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) messageHandlerConstructor]);
      uint64_t v21 = ((uint64_t (**)(void, id *))v20)[2](v20, v12);
      __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(v21);

      __int128 v23 = sub_1000101F0(v12);
      id v8 = (char **)objc_claimAutoreleasedReturnValue(v23);

      if (v8)
      {
        sub_100010D34((uint64_t)v12);
        __int128 v24 = sub_10000BC80((id *)objc_alloc(&OBJC_CLASS___RMConnectionHandlerInternal), v12, v22);
        __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) connections]);
        [v25 addObject:v24];

LABEL_25:
        goto LABEL_26;
      }

      sub_1000115C0();
    }

    else if (qword_100023960 == -1)
    {
      goto LABEL_23;
    }

    dispatch_once(&qword_100023960, &stru_10001CBE0);
LABEL_23:
    id v28 = v8[301];
    if (os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_ERROR))
    {
      id v29 = v28;
      pid_t v30 = sub_100011104(v12);
      __int128 v31 = (char *)objc_claimAutoreleasedReturnValue(v30);
      __int128 v32 = sub_10000944C(v12);
      v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
      unsigned int v34 = sub_10000947C(v12);
      int v35 = 134284035;
      name = v31;
      __int16 v37 = 2114;
      v38 = v33;
      __int16 v39 = 1025;
      unsigned int v40 = v34;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_ERROR,  "Denied connection %{private}p from %{public}@ (%{private}d)",  (uint8_t *)&v35,  0x1Cu);
    }

    goto LABEL_25;
  }

  uint64_t v5 = type;
  if (type == (xpc_type_t)&_xpc_type_error)
  {
    string = xpc_dictionary_get_string(v3, _xpc_error_key_description);
    if (qword_100023960 != -1) {
      dispatch_once(&qword_100023960, &stru_10001CBE0);
    }
    uint64_t v27 = (os_log_s *)qword_100023968;
    if (os_log_type_enabled((os_log_t)qword_100023968, OS_LOG_TYPE_FAULT))
    {
      int v35 = 136315138;
      name = string;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_FAULT, "Got error: %s", (uint8_t *)&v35, 0xCu);
    }
  }

  else
  {
    if (qword_100023960 != -1) {
      dispatch_once(&qword_100023960, &stru_10001CBE0);
    }
    id v6 = (void *)qword_100023968;
    if (os_log_type_enabled((os_log_t)qword_100023968, OS_LOG_TYPE_FAULT))
    {
      id v7 = v6;
      int v35 = 136315138;
      name = xpc_type_get_name(v5);
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_FAULT,  "Unexpected event type %s",  (uint8_t *)&v35,  0xCu);
    }
  }

LABEL_26:
}

void sub_10000CA2C(uint64_t a1)
{
  __int128 v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) connections]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v2));

  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8LL * (void)v8);
        if (v9) {
          uint64_t v10 = *(void *)(v9 + 16);
        }
        else {
          uint64_t v10 = 0LL;
        }
        (*(void (**)(void, uint64_t))(*(void *)(a1 + 40) + 16LL))(*(void *)(a1 + 40), v10);
        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v11 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      id v6 = v11;
    }

    while (v11);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))(*(void *)(a1 + 40));
}

void sub_10000CC14(id a1, RMConnectionHandlerInternal *a2, unint64_t a3, BOOL *a4)
{
}

void sub_10000CFFC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.RelativeMotion", "IPC");
  __int128 v2 = (void *)qword_100023968;
  qword_100023968 = (uint64_t)v1;
}

  ;
}

void sub_10000D058( void *a1, int a2, int a3, int a4, const char *a5, const char *a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint8_t buf)
{
}

void sub_10000D078( void *a1, int a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint8_t buf)
{
}

void sub_10000D08C( void *a1, int a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint8_t buf)
{
}

BOOL sub_10000D0A0(os_log_s *a1)
{
  return os_log_type_enabled(a1, OS_LOG_TYPE_INFO);
}

BOOL sub_10000D0AC(os_log_s *a1)
{
  return os_log_type_enabled(a1, OS_LOG_TYPE_FAULT);
}

BOOL sub_10000D0B8(os_log_t log)
{
  return os_signpost_enabled(log);
}

double sub_10000D0C0(unint64_t a1)
{
  double v2 = *(double *)&qword_100023C58;
  if (*(double *)&qword_100023C58 == 0.0)
  {
    mach_timebase_info(&info);
    if (info.denom)
    {
      uint32_t numer = info.numer;
      uint32_t denom = info.denom;
      do
      {
        uint32_t v5 = denom;
        uint32_t denom = numer % denom;
        uint32_t numer = v5;
      }

      while (denom);
    }

    else
    {
      uint32_t v5 = info.numer;
    }

    uint32_t v6 = info.numer / v5;
    unsigned int v7 = 1000000000;
    do
    {
      uint32_t v8 = v7;
      unsigned int v7 = v6 % v7;
      uint32_t v6 = v8;
    }

    while (v7);
    double v2 = (double)(info.numer / v5 / v8) / (double)(0x3B9ACA00 / v8 * (unint64_t)(info.denom / v5));
    *(double *)&qword_100023C58 = v2;
  }

  return v2 * (double)a1;
}

double sub_10000D17C()
{
  uint64_t v0 = mach_absolute_time();
  return sub_10000D0C0(v0);
}

double sub_10000D190()
{
  uint64_t v0 = mach_continuous_time();
  return sub_10000D0C0(v0);
}

void sub_10000D450(uint64_t a1)
{
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  uint64_t v11 = 0LL;
  uint64_t v2 = mach_absolute_time();
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) receiverQueue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000D524;
  block[3] = &unk_10001CC08;
  id v4 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v6 = v4;
  uint64_t v7 = v2;
  dispatch_async(v3, block);
}

void sub_10000D524(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isRunning])
  {
    uint64_t v2 = *(void *)(a1 + 40);
    id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", a1 + 48, 64LL));
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }

void sub_10000D934(uint64_t a1)
{
  os_log_t v1 = (void (**)(void))objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) handler]);
  v1[2]();
}

void sub_10000D9CC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.RelativeMotion", "TempestDataProducer");
  uint64_t v2 = (void *)qword_100023978;
  qword_100023978 = (uint64_t)v1;
}

void sub_10000DA3C(id a1)
{
  CFBooleanRef v1 = (CFBooleanRef)MGCopyAnswer(@"InternalBuild", 0LL);
  byte_100023C60 = v1 == kCFBooleanTrue;
  CFRelease(v1);
}

void sub_10000DAB8(id a1)
{
  if (_os_feature_enabled_impl("CoreLocation", "OpportunisticAnchoredTracking"))
  {
    int v2 = 802516499;
    __int128 v1 = xmmword_1000153D8;
    byte_100023C70 = MGIsDeviceOneOfType(&v1);
  }

void sub_10000DBE8(id a1)
{
  __int128 v1 = objc_opt_new(&OBJC_CLASS___RMHeadphoneActivityManager);
  int v2 = (void *)qword_100023C80;
  qword_100023C80 = (uint64_t)v1;
}

id sub_10000DF14()
{
  if (qword_100023970 != -1) {
    dispatch_once(&qword_100023970, &stru_10001CD68);
  }
  return (id)qword_100023978;
}

LABEL_38:
      goto LABEL_39;
    }

    if ([v9 isEqualToString:@"kRMStartStreamingHeadphoneMotion"])
    {
      v45 = v14;
      id v28 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"lowLatency"]);
      id v29 = [v28 BOOLValue];

      pid_t v30 = objc_alloc(&OBJC_CLASS___RMHeadphoneMotionProvider);
      __int128 v31 = sub_100010D64((uint64_t)v8);
      __int128 v22 = (RMDummyDataProviderConfiguration *)objc_claimAutoreleasedReturnValue(v31);
      __int128 v32 = sub_10000B928((id *)&v30->super.isa, v22, v29);
    }

    else if ([v9 isEqualToString:@"kRMStartStreamingHeadphoneActivity"])
    {
      v45 = v14;
      __int16 v39 = objc_alloc(&OBJC_CLASS___RMHeadphoneActivityProvider);
      unsigned int v40 = sub_100010D64((uint64_t)v8);
      __int128 v22 = (RMDummyDataProviderConfiguration *)objc_claimAutoreleasedReturnValue(v40);
      __int128 v32 = sub_100007A60((id *)&v39->super.isa, v22);
    }

    else
    {
      v45 = v14;
      v41 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:kCMHeadphoneRequireActivitySupport]);
      v42 = [v41 BOOLValue];

      v43 = objc_alloc(&OBJC_CLASS___RMHeadphoneStatusProvider);
      v44 = sub_100010D64((uint64_t)v8);
      __int128 v22 = (RMDummyDataProviderConfiguration *)objc_claimAutoreleasedReturnValue(v44);
      __int128 v32 = -[RMHeadphoneStatusProvider initWithReceiverQueue:requireActivitySupport:]( v43,  "initWithReceiverQueue:requireActivitySupport:",  v22,  v42);
    }

    __int128 v25 = (RMAudioListenerPoseProviderConfiguration *)v32;
    sub_100003D0C((uint64_t)self, v32);
    goto LABEL_37;
  }

  if (v10)
  {
    if (qword_100023C98 == -1) {
      goto LABEL_6;
    }
    goto LABEL_41;
  }

  if (qword_100023970 != -1) {
    dispatch_once(&qword_100023970, &stru_10001CD68);
  }
  uint64_t v27 = (os_log_s *)qword_100023978;
  if (os_log_type_enabled((os_log_t)qword_100023978, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_FAULT,  "Configuration message doesn't contain any data",  buf,  2u);
  }

LABEL_39:
}

void sub_10000E540(id a1)
{
  __int128 v1 = objc_alloc(&OBJC_CLASS___NSSet);
  uint64_t v2 = objc_opt_class(&OBJC_CLASS___NSArray);
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSString);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSData);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSDate);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber);
  __int128 v8 = -[NSSet initWithObjects:]( v1,  "initWithObjects:",  v2,  v3,  v4,  v5,  v6,  v7,  objc_opt_class(&OBJC_CLASS___NSError),  0LL);
  __int128 v9 = (void *)qword_100023C90;
  qword_100023C90 = (uint64_t)v8;
}

void sub_10000EA90(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[RBSProcessIdentifier identifierWithPid:]( &OBJC_CLASS___RBSProcessIdentifier,  "identifierWithPid:",  sub_10000947C(*(id **)(a1 + 32)));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[RBSProcessPredicate predicateMatchingIdentifier:]( &OBJC_CLASS___RBSProcessPredicate,  "predicateMatchingIdentifier:",  v5));
  double v16 = v6;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v16, 1LL));
  [v3 setPredicates:v7];

  __int128 v8 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessStateDescriptor descriptor](&OBJC_CLASS___RBSProcessStateDescriptor, "descriptor"));
  [v3 setStateDescriptor:v8];

  v14[0] = 0LL;
  v14[1] = v14;
  v14[2] = 0x2020000000LL;
  char v15 = 1;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  _DWORD v9[2] = sub_10000EC58;
  v9[3] = &unk_10001CCD0;
  __int128 v13 = v14;
  id v10 = *(id *)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  id v12 = *(id *)(a1 + 48);
  [v3 setUpdateHandler:v9];

  _Block_object_dispose(v14, 8);
}

void sub_10000EC38( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_10000EC58(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a4 state]);
  unsigned int v8 = [v7 taskState];

  if (v8 == 4)
  {
    if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL))
    {
      if (qword_100023970 != -1) {
        dispatch_once(&qword_100023970, &stru_10001CD68);
      }
      __int128 v13 = (os_log_s *)qword_100023978;
      if (os_log_type_enabled((os_log_t)qword_100023978, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        id v22 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "%{public}@ is scheduled, resuming data stream",  buf,  0xCu);
      }

      uint64_t v14 = sub_100010D64(*(void *)(a1 + 32));
      char v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v14);
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472LL;
      v16[2] = sub_10000EEF8;
      v16[3] = &unk_10001CB80;
      id v12 = &v17;
      id v17 = *(id *)(a1 + 40);
      id v18 = *(id *)(a1 + 48);
      dispatch_async(v15, v16);

      *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 1;
      goto LABEL_15;
    }
  }

  else if (v8 == 3 && *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL))
  {
    if (qword_100023970 != -1) {
      dispatch_once(&qword_100023970, &stru_10001CD68);
    }
    __int128 v9 = (os_log_s *)qword_100023978;
    if (os_log_type_enabled((os_log_t)qword_100023978, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      id v22 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "%{public}@ is suspended, pausing data stream",  buf,  0xCu);
    }

    uint64_t v10 = sub_100010D64(*(void *)(a1 + 32));
    id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v10);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000EEF0;
    block[3] = &unk_10001C750;
    id v12 = &v20;
    id v20 = *(id *)(a1 + 40);
    dispatch_async(v11, block);

    *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 0;
LABEL_15:
  }
}

id sub_10000EEF0(uint64_t a1)
{
  return [*(id *)(a1 + 32) stopProducingData];
}

id sub_10000EEF8(uint64_t a1)
{
  return [*(id *)(a1 + 32) startProducingDataWithCallback:*(void *)(a1 + 40)];
}

uint64_t sub_10000EF1C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

id sub_10000F23C(uint64_t a1)
{
  v13[0] = @"client";
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2) {
    uint64_t v2 = (void *)v2[3];
  }
  id v3 = v2;
  v13[1] = @"duration";
  v14[0] = v3;
  double v4 = sub_10000D190();
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    double v6 = *(double *)(v5 + 40);
  }
  else {
    double v6 = 0.0;
  }
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v4 - v6));
  v14[1] = v7;
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v14,  v13,  2LL));

  if (qword_100023970 != -1) {
    dispatch_once(&qword_100023970, &stru_10001CD68);
  }
  __int128 v9 = (os_log_s *)qword_100023978;
  if (os_log_type_enabled((os_log_t)qword_100023978, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138477827;
    id v12 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Sending analytics: \n%{private}@",  (uint8_t *)&v11,  0xCu);
  }

  return v8;
}

void sub_10000F3E0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.RelativeMotion", "TempestDataProducer");
  uint64_t v2 = (void *)qword_100023978;
  qword_100023978 = (uint64_t)v1;
}

id sub_10000F490()
{
  if (qword_100023CE8 != -1) {
    dispatch_once(&qword_100023CE8, &stru_10001CD88);
  }
  return (id)qword_100023CE0;
}

void sub_10000F4D0(id a1)
{
  os_log_t v1 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  id v5 = (id)objc_claimAutoreleasedReturnValue(v1);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v5 lastObject]);
  uint64_t v3 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%s",  v2,  "com.apple.relatived"));
  double v4 = (void *)qword_100023CE0;
  qword_100023CE0 = v3;
}

void sub_10000F554()
{
  if (qword_100023950 != -1) {
    dispatch_once(&qword_100023950, &stru_10001CF78);
  }
  uint64_t v0 = (os_log_s *)qword_100023958;
  if (os_log_type_enabled((os_log_t)qword_100023958, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "relatived exiting", v5, 2u);
  }

  dispatch_sync((dispatch_queue_t)qword_100023CA8, &stru_10001CDA8);
  dispatch_sync((dispatch_queue_t)qword_100023CB8, &stru_10001CDC8);
  dispatch_sync((dispatch_queue_t)qword_100023CC8, &stru_10001CDE8);
  dispatch_sync((dispatch_queue_t)qword_100023CD8, &stru_10001CE08);
  os_log_t v1 = (void *)qword_100023CA8;
  qword_100023CA8 = 0LL;

  uint64_t v2 = (void *)qword_100023CB8;
  qword_100023CB8 = 0LL;

  uint64_t v3 = (void *)qword_100023CC8;
  qword_100023CC8 = 0LL;

  double v4 = (void *)qword_100023CD8;
  qword_100023CD8 = 0LL;
}

void sub_10000F664(id a1)
{
  os_log_t v1 = (void *)qword_100023CA0;
  qword_100023CA0 = 0LL;
}

void sub_10000F690(id a1)
{
  os_log_t v1 = (void *)qword_100023CB0;
  qword_100023CB0 = 0LL;
}

void sub_10000F6BC(id a1)
{
  os_log_t v1 = (void *)qword_100023CC0;
  qword_100023CC0 = 0LL;
}

void sub_10000F6E8(id a1)
{
  os_log_t v1 = (void *)qword_100023CD0;
  qword_100023CD0 = 0LL;
}

uint64_t start()
{
  if (qword_100023950 != -1) {
    dispatch_once(&qword_100023950, &stru_10001CF78);
  }
  uint64_t v0 = (os_log_s *)qword_100023958;
  if (os_log_type_enabled((os_log_t)qword_100023958, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v21.st_dev) = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "relatived starting", (uint8_t *)&v21, 2u);
  }

  id v1 = sub_10000F490();
  id v2 = objc_claimAutoreleasedReturnValue(v1);
  if (stat((const char *)[v2 UTF8String], &v21))
  {
    if (*__error() == 2)
    {
      id v3 = v2;
      if (mkdir((const char *)[v3 UTF8String], 0x1E4u))
      {
        if (qword_100023950 != -1) {
          dispatch_once(&qword_100023950, &stru_10001CF78);
        }
        double v4 = (void *)qword_100023958;
        if (os_log_type_enabled((os_log_t)qword_100023958, OS_LOG_TYPE_ERROR))
        {
          id v5 = v4;
          double v6 = __error();
          uint64_t v7 = strerror(*v6);
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v3;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = v7;
          _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "Error trying to create our cache directory (%@): %s",  buf,  0x16u);
        }
      }
    }

    else
    {
      if (qword_100023950 != -1) {
        dispatch_once(&qword_100023950, &stru_10001CF78);
      }
      unsigned int v8 = (void *)qword_100023958;
      if (os_log_type_enabled((os_log_t)qword_100023958, OS_LOG_TYPE_ERROR))
      {
        __int128 v9 = v8;
        uint64_t v10 = __error();
        int v11 = strerror(*v10);
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v2;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "Unexpected while checking for prsence of our cache directory (%@): %s",  buf,  0x16u);
      }
    }
  }

  dispatch_queue_t v12 = dispatch_queue_create("Tempest", 0LL);
  __int128 v13 = (void *)qword_100023CA8;
  qword_100023CA8 = (uint64_t)v12;

  dispatch_queue_t v14 = dispatch_queue_create("Public", 0LL);
  char v15 = (void *)qword_100023CB8;
  qword_100023CB8 = (uint64_t)v14;

  dispatch_queue_t v16 = dispatch_queue_create("Control", 0LL);
  id v17 = (void *)qword_100023CC8;
  qword_100023CC8 = (uint64_t)v16;

  dispatch_queue_t v18 = dispatch_queue_create("Status", 0LL);
  unsigned int v19 = (void *)qword_100023CD8;
  qword_100023CD8 = (uint64_t)v18;

  dispatch_async((dispatch_queue_t)qword_100023CA8, &stru_10001CE28);
  dispatch_async((dispatch_queue_t)qword_100023CB8, &stru_10001CE88);
  dispatch_async((dispatch_queue_t)qword_100023CC8, &stru_10001CEC8);
  dispatch_async((dispatch_queue_t)qword_100023CD8, &stru_10001CF28);
  *(_OWORD *)buf = off_10001CF68;
  sigaction(2, (const sigaction *)buf, 0LL);
  sigaction(3, (const sigaction *)buf, 0LL);
  sigaction(15, (const sigaction *)buf, 0LL);
  CFRunLoopRun();
  sub_10000F554();

  return 0LL;
}

void sub_10000FA5C(id a1)
{
  id v1 = objc_alloc(&OBJC_CLASS___RMConnectionListener);
  id v2 = -[RMConnectionListener initWithQueue:entitlement:messageHandlerConstructor:]( v1,  "initWithQueue:entitlement:messageHandlerConstructor:",  qword_100023CA8,  @"com.apple.developer.coremotion.head-pose",  &stru_10001CE68);
  id v3 = (void *)qword_100023CA0;
  qword_100023CA0 = (uint64_t)v2;

  [(id)qword_100023CA0 setDeprecatedEntitlement:@"com.apple.relatived.tempest"];
  [(id)qword_100023CA0 startListeningForService:@"com.apple.relatived.tempest"];
}

RMConnectionStreamProducingDelegate *__cdecl sub_10000FAC8(id a1, RMConnectionEndpoint *a2)
{
  id v2 = a2;
  id v3 = -[RMDataStreamHandler initWithEndpoint:isInternal:]( objc_alloc(&OBJC_CLASS___RMDataStreamHandler),  "initWithEndpoint:isInternal:",  v2,  1LL);

  return (RMConnectionStreamProducingDelegate *)v3;
}

void sub_10000FB10(id a1)
{
  id v1 = objc_alloc(&OBJC_CLASS___RMConnectionListener);
  id v2 = -[RMConnectionListener initWithQueue:entitlement:tccService:messageHandlerConstructor:]( v1,  "initWithQueue:entitlement:tccService:messageHandlerConstructor:",  qword_100023CB8,  @"com.apple.locationd.activity",  kTCCServiceMotion,  &stru_10001CEA8);
  id v3 = (void *)qword_100023CB0;
  qword_100023CB0 = (uint64_t)v2;

  [(id)qword_100023CB0 startListeningForService:@"com.apple.relatived.public"];
}

RMConnectionStreamProducingDelegate *__cdecl sub_10000FB78(id a1, RMConnectionEndpoint *a2)
{
  id v2 = a2;
  id v3 = -[RMDataStreamHandler initWithEndpoint:isInternal:]( objc_alloc(&OBJC_CLASS___RMDataStreamHandler),  "initWithEndpoint:isInternal:",  v2,  0LL);

  return (RMConnectionStreamProducingDelegate *)v3;
}

void sub_10000FBC0(id a1)
{
  id v1 = objc_alloc(&OBJC_CLASS___RMConnectionListener);
  id v2 = -[RMConnectionListener initWithQueue:entitlement:messageHandlerConstructor:]( v1,  "initWithQueue:entitlement:messageHandlerConstructor:",  qword_100023CC8,  @"com.apple.relatived.internal",  &stru_10001CF08);
  id v3 = (void *)qword_100023CC0;
  qword_100023CC0 = (uint64_t)v2;

  [(id)qword_100023CC0 startListeningForService:@"com.apple.relatived.internal"];
}

RMConnectionDataDelegate *__cdecl sub_10000FC1C(id a1, RMConnectionEndpoint *a2)
{
  id v2 = a2;
  id v3 = objc_alloc(&OBJC_CLASS___RMInternalServiceHandler);
  double v4 = -[RMInternalServiceHandler initWithEndpoint:managedListener:]( v3,  "initWithEndpoint:managedListener:",  v2,  qword_100023CB0);

  return (RMConnectionDataDelegate *)v4;
}

void sub_10000FC68(id a1)
{
  id v1 = objc_alloc(&OBJC_CLASS___RMConnectionListener);
  id v2 = -[RMConnectionListener initWithQueue:entitlement:messageHandlerConstructor:]( v1,  "initWithQueue:entitlement:messageHandlerConstructor:",  qword_100023CD8,  0LL,  &stru_10001CF48);
  id v3 = (void *)qword_100023CD0;
  qword_100023CD0 = (uint64_t)v2;

  [(id)qword_100023CD0 startListeningForService:@"com.apple.relatived.status"];
}

RMConnectionStreamProducingDelegate *__cdecl sub_10000FCC0(id a1, RMConnectionEndpoint *a2)
{
  id v2 = a2;
  id v3 = -[RMDataStreamHandler initWithEndpoint:isInternal:]( objc_alloc(&OBJC_CLASS___RMDataStreamHandler),  "initWithEndpoint:isInternal:",  v2,  0LL);

  return (RMConnectionStreamProducingDelegate *)v3;
}

void sub_10000FD08(unsigned int a1)
{
  if (a1 <= 0xF && ((1 << a1) & 0x800C) != 0)
  {
    Main = CFRunLoopGetMain();
    CFRunLoopStop(Main);
  }

void sub_10000FD3C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.RelativeMotion", "Daemon");
  id v2 = (void *)qword_100023958;
  qword_100023958 = (uint64_t)v1;
}

void sub_10000FD6C(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v13 = a4;
  if (a1)
  {
    id v7 = a3;
    xpc_object_t reply = xpc_dictionary_create_reply(a2);
    id v9 = v7;
    uint64_t v10 = (const char *)[v9 UTF8String];

    xpc_dictionary_set_string(reply, "kRMConnectionMessageNameKey", v10);
    if (v13)
    {
      id v11 = v13;
      xpc_object_t v12 = xpc_data_create([v11 bytes], (size_t)objc_msgSend(v11, "length"));
      xpc_dictionary_set_value(reply, "kRMConnectionMessageDataKey", v12);
    }

    xpc_connection_send_message(*(xpc_connection_t *)(a1 + 56), reply);
  }
}

BOOL sub_10000FE4C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  double v6 = v5;
  if (!a1)
  {
    BOOL v20 = 0LL;
    goto LABEL_30;
  }

  if (xpc_get_type(v5) != (xpc_type_t)&_xpc_type_endpoint)
  {
    if (qword_100023960 != -1) {
      dispatch_once(&qword_100023960, &stru_10001D048);
    }
    id v7 = (os_log_s *)qword_100023968;
    if (os_log_type_enabled((os_log_t)qword_100023968, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v22) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "The client did not send streaming endpoint correctly",  (uint8_t *)&v22,  2u);
    }

    BOOL v8 = 0;
    goto LABEL_29;
  }

  id WeakRetained = (_xpc_endpoint_s *)objc_loadWeakRetained((id *)(a1 + 24));
  xpc_connection_t v10 = xpc_connection_create_from_endpoint(v6);
  if (v10)
  {
    id v11 = (void **)(a1 + 32);
    objc_storeStrong((id *)(a1 + 32), v10);
    if ((sub_10001020C(a1, WeakRetained) & 1) == 0)
    {
      BOOL v8 = a3 != 0LL;
      if (a3)
      {
        if (qword_100023960 != -1) {
          dispatch_once(&qword_100023960, &stru_10001D048);
        }
        xpc_object_t v12 = (os_log_s *)qword_100023968;
        if (os_log_type_enabled((os_log_t)qword_100023968, OS_LOG_TYPE_ERROR))
        {
          int v22 = 138412290;
          __int128 v23 = WeakRetained;
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Failed to start the streaming with handler %@",  (uint8_t *)&v22,  0xCu);
        }

        *a3 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"RMConnectionStreaming",  -2LL,  0LL));
      }

      if (qword_100023960 != -1) {
        dispatch_once(&qword_100023960, &stru_10001D048);
      }
      id v13 = (void *)qword_100023968;
      if (os_log_type_enabled((os_log_t)qword_100023968, OS_LOG_TYPE_DEFAULT))
      {
        dispatch_queue_t v14 = *(_xpc_endpoint_s **)(a1 + 56);
        uint64_t v15 = *(void *)(a1 + 32);
        int v22 = 134283777;
        __int128 v23 = v14;
        __int16 v24 = 2049;
        uint64_t v25 = v15;
        dispatch_queue_t v16 = v14;
        id v17 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Cancelling the streaming server connection %{private}p.%{private}p",  (uint8_t *)&v22,  0x16u);
      }

      xpc_connection_cancel(v10);
      dispatch_queue_t v18 = *v11;
      *id v11 = 0LL;

      goto LABEL_28;
    }

    goto LABEL_27;
  }

  if (qword_100023960 != -1) {
    dispatch_once(&qword_100023960, &stru_10001D048);
  }
  unsigned int v19 = (os_log_s *)qword_100023968;
  if (os_log_type_enabled((os_log_t)qword_100023968, OS_LOG_TYPE_ERROR))
  {
    int v22 = 138412290;
    __int128 v23 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "Failed to create connection from endpoint %@",  (uint8_t *)&v22,  0xCu);
  }

  if (!a3)
  {
LABEL_27:
    BOOL v8 = 0;
    goto LABEL_28;
  }

  *a3 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"RMConnectionStreaming",  -1LL,  0LL));
  BOOL v8 = 1;
LABEL_28:

LABEL_29:
  BOOL v20 = !v8;
LABEL_30:

  return v20;
}

id sub_1000101B0()
{
  if (qword_100023960 != -1) {
    dispatch_once(&qword_100023960, &stru_10001D048);
  }
  return (id)qword_100023968;
}

id *sub_1000101F0(id *WeakRetained)
{
  if (WeakRetained) {
    id WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 3);
  }
  return WeakRetained;
}

id sub_10001020C(uint64_t a1, void *a2)
{
  if (!a1) {
    return 0LL;
  }
  id v3 = *(_xpc_connection_s **)(a1 + 32);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100010D70;
  handler[3] = &unk_10001CB58;
  handler[4] = a1;
  id v4 = a2;
  xpc_connection_set_event_handler(v3, handler);
  id v5 = *(dispatch_queue_s **)(a1 + 8);
  double v6 = (_xpc_connection_s *)*(id *)(a1 + 32);
  xpc_connection_set_target_queue(v6, v5);

  xpc_connection_resume(*(xpc_connection_t *)(a1 + 32));
  xpc_object_t v7 = xpc_string_create("kRMConnectionMessageDataStream");
  keys = "kRMConnectionMessageNameKey";
  id v8 = v7;
  xpc_object_t values = v8;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100010FDC;
  v18[3] = &unk_10001CFC8;
  v18[4] = a1;
  xpc_object_t v9 = xpc_dictionary_create((const char *const *)&keys, &values, 1uLL);
  id v19 = v9;
  id v10 = [v4 endpoint:a1 shouldStartStreamingDataToReceiver:v18];

  if (qword_100023960 != -1) {
    dispatch_once(&qword_100023960, &stru_10001D048);
  }
  id v11 = (void *)qword_100023968;
  if (os_log_type_enabled((os_log_t)qword_100023968, OS_LOG_TYPE_DEBUG))
  {
    xpc_object_t v12 = *(void **)(a1 + 56);
    uint64_t v13 = *(void *)(a1 + 32);
    dispatch_queue_t v14 = "NO";
    if ((_DWORD)v10) {
      dispatch_queue_t v14 = "YES";
    }
    *(_DWORD *)buf = 134284035;
    int v22 = v12;
    __int16 v23 = 2049;
    uint64_t v24 = v13;
    __int16 v25 = 2080;
    id v26 = v14;
    id v15 = v12;
    dispatch_queue_t v16 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEBUG,  "shouldStartStreamingDataToReceiver returned on streaming server connection %{private}p.%{private}p: %s",  buf,  0x20u);
  }

  return v10;
}

void sub_100010444(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  double v6 = a3;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
    id v8 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  xpc_dictionary_get_string(v5, "kRMConnectionMessageNameKey"));
    xpc_object_t v9 = (char *)objc_claimAutoreleasedReturnValue(v8);
    xpc_object_t value = xpc_dictionary_get_value(v5, "kRMConnectionMessageDataKey");
    id v11 = (void *)objc_claimAutoreleasedReturnValue(value);
    xpc_object_t v12 = v11;
    if (v11)
    {
      bytes_ptr = (NSData *)xpc_data_get_bytes_ptr(v11);
      if (bytes_ptr) {
        bytes_ptr = -[NSData initWithBytes:length:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBytes:length:",  bytes_ptr,  xpc_data_get_length(v12));
      }
    }

    else
    {
      bytes_ptr = 0LL;
    }

    xpc_object_t v14 = xpc_dictionary_get_value(v5, "kRMConnectionRequestSteamingKey");
    uint64_t v15 = objc_claimAutoreleasedReturnValue(v14);
    dispatch_queue_t v16 = (void *)v15;
    if (v9)
    {
      if (!v15)
      {
        if (v6)
        {
          v6[2](v6, v9, bytes_ptr);
          goto LABEL_31;
        }

        if ([v9 isEqualToString:@"kRMConnectionMessagePriorityBoost"])
        {
          if (qword_100023960 != -1) {
            dispatch_once(&qword_100023960, &stru_10001D048);
          }
          __int128 v32 = (os_log_s *)qword_100023968;
          if (os_log_type_enabled((os_log_t)qword_100023968, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138477827;
            v42 = v9;
            _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_INFO,  "Creating reply to hold onto priority boost: %{private}@",  buf,  0xCu);
          }

          xpc_object_t reply = xpc_dictionary_create_reply(v5);
          unsigned int v34 = *(void **)(a1 + 64);
          *(void *)(a1 + 64) = reply;
        }

        else
        {
          if ((objc_opt_respondsToSelector(WeakRetained, "endpoint:didReceiveMessage:withData:replyBlock:") & 1) == 0)
          {
            if (qword_100023960 != -1) {
              dispatch_once(&qword_100023960, &stru_10001D048);
            }
            uint64_t v35 = qword_100023968;
            if (!os_log_type_enabled((os_log_t)qword_100023968, OS_LOG_TYPE_FAULT)) {
              goto LABEL_31;
            }
            *(_WORD *)buf = 0;
            uint64_t v27 = "Message received but the handler doesn't implement the selector 'endpoint:didReceiveMessage:withData:replyBlock:'";
            id v28 = (os_log_s *)v35;
            os_log_type_t v29 = OS_LOG_TYPE_FAULT;
            uint32_t v30 = 2;
            goto LABEL_14;
          }

          v37[0] = _NSConcreteStackBlock;
          v37[1] = 3221225472LL;
          v37[2] = sub_100010904;
          v37[3] = &unk_10001CFA0;
          v37[4] = a1;
          id v38 = v5;
          [WeakRetained endpoint:a1 didReceiveMessage:v9 withData:bytes_ptr replyBlock:v37];
          unsigned int v34 = v38;
        }

        goto LABEL_31;
      }

      if ([WeakRetained conformsToProtocol:&OBJC_PROTOCOL___RMConnectionStreamProducingDelegate])
      {
        [WeakRetained endpoint:a1 didReceiveStreamingRequest:v9 withData:bytes_ptr];
        id v40 = 0LL;
        sub_10000FE4C(a1, v16, &v40);
        id v17 = v40;
        if (v17)
        {
          dispatch_queue_t v18 = v17;
          id v39 = v17;
          id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v17,  1LL,  &v39));
          uint64_t v36 = v12;
          BOOL v20 = v9;
          stat v21 = v16;
          int v22 = bytes_ptr;
          id v23 = WeakRetained;
          uint64_t v24 = v6;
          id v25 = v39;

          sub_10000FD6C(a1, v5, @"kRMConnectionMessageError", v19);
          double v6 = v24;
          id WeakRetained = v23;
          bytes_ptr = v22;
          dispatch_queue_t v16 = v21;
          xpc_object_t v9 = v20;
          xpc_object_t v12 = v36;
        }

        else
        {
          if (qword_100023960 != -1) {
            dispatch_once(&qword_100023960, &stru_10001D048);
          }
          __int128 v31 = (os_log_s *)qword_100023968;
          if (os_log_type_enabled((os_log_t)qword_100023968, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_INFO,  "Streaming session started, sending acknowledgement",  buf,  2u);
          }

          sub_10000FD6C(a1, v5, @"kRMConnectionMessageSuccess", 0LL);
        }

        goto LABEL_31;
      }

      sub_100011C68();
    }

    else if (qword_100023960 == -1)
    {
LABEL_12:
      uint64_t v26 = qword_100023968;
      if (!os_log_type_enabled((os_log_t)qword_100023968, OS_LOG_TYPE_ERROR))
      {
LABEL_31:

        goto LABEL_32;
      }

      *(_DWORD *)buf = 136315138;
      v42 = "kRMConnectionMessageNameKey";
      uint64_t v27 = "XPC message missing key %s";
      id v28 = (os_log_s *)v26;
      os_log_type_t v29 = OS_LOG_TYPE_ERROR;
      uint32_t v30 = 12;
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, v28, v29, v27, buf, v30);
      goto LABEL_31;
    }

    dispatch_once(&qword_100023960, &stru_10001D048);
    goto LABEL_12;
  }

LABEL_32:
}

void sub_100010904(uint64_t a1, void *a2, void *a3)
{
}

id *sub_100010918(id *a1, void *a2, void *a3)
{
  double v6 = a2;
  xpc_object_t v7 = a3;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)&OBJC_CLASS___RMConnectionEndpoint;
    id v8 = (id *)objc_msgSendSuper2(&v12, "init");
    a1 = v8;
    if (v8)
    {
      objc_storeStrong(v8 + 7, a2);
      objc_storeStrong(a1 + 1, a3);
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472LL;
      handler[2] = sub_100010A08;
      handler[3] = &unk_10001CB58;
      a1 = a1;
      id v11 = a1;
      xpc_connection_set_event_handler(v6, handler);
      xpc_connection_set_target_queue(v6, v7);
    }
  }

  return a1;
}

void sub_100010A08(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_type_t type = xpc_get_type(v3);
  if (type == (xpc_type_t)&_xpc_type_error)
  {
    if (v3 == &_xpc_error_connection_interrupted)
    {
      if (qword_100023960 != -1) {
        dispatch_once(&qword_100023960, &stru_10001D048);
      }
      xpc_object_t v9 = (void *)qword_100023968;
      if (os_log_type_enabled((os_log_t)qword_100023968, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v10 = *(void *)(a1 + 32);
        if (v10) {
          uint64_t v10 = *(void *)(v10 + 56);
        }
        int v12 = 134283521;
        uint64_t v13 = v10;
        id v11 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "#Warning Messaging connection %{private}p interrupted!",  (uint8_t *)&v12,  0xCu);
      }

      sub_100010C5C(*(void *)(a1 + 32));
    }

    else if (v3 == &_xpc_error_connection_invalid)
    {
      if (qword_100023960 != -1) {
        dispatch_once(&qword_100023960, &stru_10001D048);
      }
      double v6 = (void *)qword_100023968;
      if (os_log_type_enabled((os_log_t)qword_100023968, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v7 = *(void *)(a1 + 32);
        if (v7) {
          uint64_t v7 = *(void *)(v7 + 56);
        }
        int v12 = 134283521;
        uint64_t v13 = v7;
        id v8 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "#Warning Messaging connection %{private}p invalidated!",  (uint8_t *)&v12,  0xCu);
      }

      sub_100010CA0(*(void *)(a1 + 32));
    }
  }

  else if (type == (xpc_type_t)&_xpc_type_dictionary)
  {
    sub_100010444(*(void *)(a1 + 32), v3, 0LL);
  }

  else
  {
    if (qword_100023960 != -1) {
      dispatch_once(&qword_100023960, &stru_10001D048);
    }
    id v5 = (os_log_s *)qword_100023968;
    if (os_log_type_enabled((os_log_t)qword_100023968, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Got unexpected xpc event", (uint8_t *)&v12, 2u);
    }
  }
}

void sub_100010C5C(uint64_t a1)
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
    [WeakRetained endpointWasInterrupted:a1];
  }

void sub_100010CA0(uint64_t a1)
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    id v2 = *(void **)(a1 + 64);
    *(void *)(a1 + 64) = 0LL;

    if (*(void *)(a1 + 32)) {
      sub_100010F54(a1);
    }
    if (*(void *)(a1 + 40)) {
      sub_100011078(a1);
    }
    if (*(void *)(a1 + 56))
    {
      xpc_connection_cancel(*(xpc_connection_t *)(a1 + 56));
      id v3 = *(void **)(a1 + 56);
      *(void *)(a1 + 56) = 0LL;
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
    [WeakRetained endpointWasInvalidated:a1];
  }

void sub_100010D34(uint64_t a1)
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    xpc_connection_resume(*(xpc_connection_t *)(a1 + 56));
  }

uint64_t sub_100010D64(uint64_t result)
{
  if (result) {
    return *(void *)(result + 8);
  }
  return result;
}

void sub_100010D70(uint64_t a1, xpc_object_t object)
{
  if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_error)
  {
    if (object == &_xpc_error_connection_interrupted)
    {
      if (qword_100023960 != -1) {
        dispatch_once(&qword_100023960, &stru_10001D048);
      }
      uint64_t v10 = (void *)qword_100023968;
      if (!os_log_type_enabled((os_log_t)qword_100023968, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_21;
      }
      id v11 = *(void **)(a1 + 32);
      if (v11) {
        id v11 = (void *)v11[7];
      }
      uint64_t v12 = *(void *)(a1 + 32);
      if (v12) {
        uint64_t v12 = *(void *)(v12 + 32);
      }
      int v13 = 134283777;
      xpc_object_t v14 = v11;
      __int16 v15 = 2049;
      uint64_t v16 = v12;
      uint64_t v7 = v11;
      id v8 = v10;
      xpc_object_t v9 = "#Warning Streaming server connection %{private}p.%{private}p interrupted!";
    }

    else
    {
      if (object != &_xpc_error_connection_invalid) {
        return;
      }
      if (qword_100023960 != -1) {
        dispatch_once(&qword_100023960, &stru_10001D048);
      }
      id v4 = (void *)qword_100023968;
      if (!os_log_type_enabled((os_log_t)qword_100023968, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_21;
      }
      id v5 = *(void **)(a1 + 32);
      if (v5) {
        id v5 = (void *)v5[7];
      }
      uint64_t v6 = *(void *)(a1 + 32);
      if (v6) {
        uint64_t v6 = *(void *)(v6 + 32);
      }
      int v13 = 134283777;
      xpc_object_t v14 = v5;
      __int16 v15 = 2049;
      uint64_t v16 = v6;
      uint64_t v7 = v5;
      id v8 = v4;
      xpc_object_t v9 = "#Warning Streaming server connection %{private}p.%{private}p invalidated!";
    }

    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, v9, (uint8_t *)&v13, 0x16u);

LABEL_21:
    sub_100010F54(*(void *)(a1 + 32));
  }

void sub_100010F54(uint64_t a1)
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    if (*(void *)(a1 + 32))
    {
      xpc_connection_set_event_handler(*(xpc_connection_t *)(a1 + 32), &stru_10001D008);
      xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
      id v2 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = 0LL;

      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
      [WeakRetained endpointShouldStopStreamingData:a1];
    }

    else
    {
      sub_100011D80();
    }
  }

void sub_100010FDC(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    uint64_t v4 = *(void *)(v4 + 32);
  }
  if (v4)
  {
    id v5 = *(void **)(a1 + 40);
    id v9 = v3;
    id v6 = v3;
    xpc_dictionary_set_data( v5,  "kRMConnectionMessageDataStreamKey",  [v6 bytes],  (size_t)objc_msgSend(v6, "length"));
    uint64_t v7 = *(void *)(a1 + 32);
    if (v7) {
      id v8 = *(_xpc_connection_s **)(v7 + 32);
    }
    else {
      id v8 = 0LL;
    }
    xpc_connection_send_message(v8, *(xpc_object_t *)(a1 + 40));
    id v3 = v9;
  }
}

void sub_100011078(uint64_t a1)
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    if (*(void *)(a1 + 40))
    {
      xpc_connection_suspend(*(xpc_connection_t *)(a1 + 40));
      xpc_connection_set_event_handler(*(xpc_connection_t *)(a1 + 40), &stru_10001D028);
      xpc_connection_resume(*(xpc_connection_t *)(a1 + 40));
      xpc_connection_cancel(*(xpc_connection_t *)(a1 + 40));
      id v2 = *(void **)(a1 + 40);
      *(void *)(a1 + 40) = 0LL;
    }

    if (*(void *)(a1 + 48))
    {
      xpc_connection_cancel(*(xpc_connection_t *)(a1 + 48));
      id v3 = *(void **)(a1 + 48);
      *(void *)(a1 + 4_Block_object_dispose(va, 8) = 0LL;
    }
  }

id *sub_100011104(id *a1)
{
  if (a1) {
    a1 = (id *)a1[7];
  }
  return a1;
}

id *sub_100011120(id *result, void *a2)
{
  if (result) {
    return (id *)objc_storeWeak(result + 2, a2);
  }
  return result;
}

id *sub_100011130(id *result, void *a2)
{
  if (result) {
    return (id *)objc_storeWeak(result + 3, a2);
  }
  return result;
}

void sub_1000111B0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.RelativeMotion", "IPC");
  id v2 = (void *)qword_100023968;
  qword_100023968 = (uint64_t)v1;
}

  ;
}

uint64_t sub_1000111F4()
{
  id v1 = sub_10000BFBC();
  id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (sub_10000D0AC(v2))
  {
    sub_10000D02C();
    sub_10000D08C( (void *)&_mh_execute_header,  v3,  v4,  "{msg%{public}.0s:Entitlement cannot be nil, event:%{public, location:escape_only}s, condition:%{pr ivate, location:escape_only}s}",  v5,  v6,  v7,  v8,  v26,  v27,  v28,  v29,  v30);
  }

  id v9 = sub_10000BFBC();
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (sub_10000D0B8(v10))
  {
    sub_10000D02C();
    sub_10000D058( (void *)&_mh_execute_header,  v11,  v12,  v13,  "Entitlement cannot be nil",  "{msg%{public}.0s:Entitlement cannot be nil, event:%{public, location:escape_only}s, condition:%{pr ivate, location:escape_only}s}",  v14,  v15,  v26,  v27,  v28,  v29,  v30);
  }

  id v16 = sub_10000BFBC();
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (sub_10000D0A0(v17))
  {
    sub_10000D02C();
    sub_10000D078( (void *)&_mh_execute_header,  v18,  v19,  "{msg%{public}.0s:Entitlement cannot be nil, event:%{public, location:escape_only}s, condition:%{pr ivate, location:escape_only}s}",  v20,  v21,  v22,  v23,  v26,  v27,  v28,  v29,  v30);
  }

  uint64_t v24 = abort_report_np( "%s:%d: assertion failure in %s",  "/Library/Caches/com.apple.xbs/Sources/RelativeMotion/Common/RMConnectionListener.m",  77,  "-[RMConnectionListener initWithQueue:entitlement:tccService:messageHandlerConstructor:]");
  return sub_100011310(v24);
}

uint64_t sub_100011310()
{
  id v1 = sub_10000BFBC();
  id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (sub_10000D0AC(v2))
  {
    sub_10000D02C();
    sub_10000D08C( (void *)&_mh_execute_header,  v3,  v4,  "{msg%{public}.0s:TCC service cannot be nil, event:%{public, location:escape_only}s, condition:%{pr ivate, location:escape_only}s}",  v5,  v6,  v7,  v8,  v26,  v27,  v28,  v29,  v30);
  }

  id v9 = sub_10000BFBC();
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (sub_10000D0B8(v10))
  {
    sub_10000D02C();
    sub_10000D058( (void *)&_mh_execute_header,  v11,  v12,  v13,  "TCC service cannot be nil",  "{msg%{public}.0s:TCC service cannot be nil, event:%{public, location:escape_only}s, condition:%{pr ivate, location:escape_only}s}",  v14,  v15,  v26,  v27,  v28,  v29,  v30);
  }

  id v16 = sub_10000BFBC();
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (sub_10000D0A0(v17))
  {
    sub_10000D02C();
    sub_10000D078( (void *)&_mh_execute_header,  v18,  v19,  "{msg%{public}.0s:TCC service cannot be nil, event:%{public, location:escape_only}s, condition:%{pr ivate, location:escape_only}s}",  v20,  v21,  v22,  v23,  v26,  v27,  v28,  v29,  v30);
  }

  uint64_t v24 = abort_report_np( "%s:%d: assertion failure in %s",  "/Library/Caches/com.apple.xbs/Sources/RelativeMotion/Common/RMConnectionListener.m",  78,  "-[RMConnectionListener initWithQueue:entitlement:tccService:messageHandlerConstructor:]");
  return sub_10001142C(v24);
}

void sub_10001142C()
{
  id v1 = sub_10000BFBC();
  id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (sub_10000D0AC(v2))
  {
    sub_10000D02C();
    sub_10000D08C( (void *)&_mh_execute_header,  v3,  v4,  "{msg%{public}.0s:TCC service exists and entitlement does not!, event:%{public, location:escape_only}s, condition:%{private, location:escape_only}s}",  v5,  v6,  v7,  v8,  v25,  v26,  v27,  v28,  v29);
  }

  id v9 = sub_10000BFBC();
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (sub_10000D0B8(v10))
  {
    sub_10000D02C();
    sub_10000D058( (void *)&_mh_execute_header,  v11,  v12,  v13,  "TCC service exists and entitlement does not!",  "{msg%{public}.0s:TCC service exists and entitlement does not!, event:%{public, location:escape_only}s, condition:%{private, location:escape_only}s}",  v14,  v15,  v25,  v26,  v27,  v28,  v29);
  }

  id v16 = sub_10000BFBC();
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (sub_10000D0A0(v17))
  {
    sub_10000D02C();
    sub_10000D078( (void *)&_mh_execute_header,  v18,  v19,  "{msg%{public}.0s:TCC service exists and entitlement does not!, event:%{public, location:escape_only}s, condition:%{private, location:escape_only}s}",  v20,  v21,  v22,  v23,  v25,  v26,  v27,  v28,  v29);
  }

  uint64_t v24 = abort_report_np( "%s:%d: assertion failure in %s",  "/Library/Caches/com.apple.xbs/Sources/RelativeMotion/Common/RMConnectionListener.m",  93,  "-[RMConnectionListener isEndpointConnectionAllowed:]");
  sub_100011548(v24);
}

void sub_100011548(uint64_t a1)
{
  id v2 = sub_10000BFBC();
  int v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138477827;
    uint64_t v5 = a1;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "Couldn't create XPC service for %{private}@",  (uint8_t *)&v4,  0xCu);
  }

  abort();
}

uint64_t sub_1000115C0()
{
  id v1 = sub_10000BFBC();
  id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (sub_10000D0AC(v2))
  {
    sub_10000D02C();
    sub_10000D08C( (void *)&_mh_execute_header,  v3,  v4,  "{msg%{public}.0s:The messageHandler didn't set the endpoint delegate at creation, event:%{public, loca tion:escape_only}s, condition:%{private, location:escape_only}s}",  v5,  v6,  v7,  v8,  v26,  v27,  v28,  v29,  v30);
  }

  id v9 = sub_10000BFBC();
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (sub_10000D0B8(v10))
  {
    sub_10000D02C();
    sub_10000D058( (void *)&_mh_execute_header,  v11,  v12,  v13,  "The messageHandler didn't set the endpoint delegate at creation",  "{msg%{public}.0s:The messageHandler didn't set the endpoint delegate at creation, event:%{public, loca tion:escape_only}s, condition:%{private, location:escape_only}s}",  v14,  v15,  v26,  v27,  v28,  v29,  v30);
  }

  id v16 = sub_10000BFBC();
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (sub_10000D0A0(v17))
  {
    sub_10000D02C();
    sub_10000D078( (void *)&_mh_execute_header,  v18,  v19,  "{msg%{public}.0s:The messageHandler didn't set the endpoint delegate at creation, event:%{public, loca tion:escape_only}s, condition:%{private, location:escape_only}s}",  v20,  v21,  v22,  v23,  v26,  v27,  v28,  v29,  v30);
  }

  uint64_t v24 = abort_report_np( "%s:%d: assertion failure in %s",  "/Library/Caches/com.apple.xbs/Sources/RelativeMotion/Common/RMConnectionListener.m",  148,  "-[RMConnectionListener startListeningForService:]_block_invoke");
  return sub_1000116DC(v24);
}

uint64_t sub_1000116DC()
{
  id v1 = sub_10000BFBC();
  id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (sub_10000D0AC(v2))
  {
    sub_10000D02C();
    sub_10000D08C( (void *)&_mh_execute_header,  v3,  v4,  "{msg%{public}.0s:Endpoint invalidated with no dataDelegate in place, event:%{public, location:escape_o nly}s, condition:%{private, location:escape_only}s}",  v5,  v6,  v7,  v8,  v26,  v27,  v28,  v29,  v30);
  }

  id v9 = sub_10000BFBC();
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (sub_10000D0B8(v10))
  {
    sub_10000D02C();
    sub_10000D058( (void *)&_mh_execute_header,  v11,  v12,  v13,  "Endpoint invalidated with no dataDelegate in place",  "{msg%{public}.0s:Endpoint invalidated with no dataDelegate in place, event:%{public, location:escape_o nly}s, condition:%{private, location:escape_only}s}",  v14,  v15,  v26,  v27,  v28,  v29,  v30);
  }

  id v16 = sub_10000BFBC();
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (sub_10000D0A0(v17))
  {
    sub_10000D02C();
    sub_10000D078( (void *)&_mh_execute_header,  v18,  v19,  "{msg%{public}.0s:Endpoint invalidated with no dataDelegate in place, event:%{public, location:escape_o nly}s, condition:%{private, location:escape_only}s}",  v20,  v21,  v22,  v23,  v26,  v27,  v28,  v29,  v30);
  }

  uint64_t v24 = abort_report_np( "%s:%d: assertion failure in %s",  "/Library/Caches/com.apple.xbs/Sources/RelativeMotion/Common/RMConnectionListener.m",  197,  "-[RMConnectionListener endpointWasInvalidated:]");
  return sub_1000117F8(v24);
}

uint64_t sub_1000117F8()
{
  id v1 = sub_10000DF14();
  id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (sub_10000D0AC(v2))
  {
    sub_10000D02C();
    sub_10000D08C( (void *)&_mh_execute_header,  v3,  v4,  "{msg%{public}.0s:Endpoint must be same as the initially passed endpoint, event:%{public, location:esca pe_only}s, condition:%{private, location:escape_only}s}",  v5,  v6,  v7,  v8,  v26,  v27,  v28,  v29,  v30);
  }

  id v9 = sub_10000DF14();
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (sub_10000D0B8(v10))
  {
    sub_10000D02C();
    sub_10000D058( (void *)&_mh_execute_header,  v11,  v12,  v13,  "Endpoint must be same as the initially passed endpoint",  "{msg%{public}.0s:Endpoint must be same as the initially passed endpoint, event:%{public, location:esca pe_only}s, condition:%{private, location:escape_only}s}",  v14,  v15,  v26,  v27,  v28,  v29,  v30);
  }

  id v16 = sub_10000DF14();
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (sub_10000D0A0(v17))
  {
    sub_10000D02C();
    sub_10000D078( (void *)&_mh_execute_header,  v18,  v19,  "{msg%{public}.0s:Endpoint must be same as the initially passed endpoint, event:%{public, location:esca pe_only}s, condition:%{private, location:escape_only}s}",  v20,  v21,  v22,  v23,  v26,  v27,  v28,  v29,  v30);
  }

  uint64_t v24 = abort_report_np( "%s:%d: assertion failure in %s",  "/Library/Caches/com.apple.xbs/Sources/RelativeMotion/relatived/RMDataStreamHandler.m",  84,  "-[RMDataStreamHandler endpoint:didReceiveMessage:withData:replyBlock:]");
  return sub_100011914(v24);
}

uint64_t sub_100011914()
{
  id v1 = sub_10000DF14();
  id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (sub_10000D0AC(v2))
  {
    sub_10000D02C();
    sub_10000D08C( (void *)&_mh_execute_header,  v3,  v4,  "{msg%{public}.0s:Endpoint must be same as the initially passed endpoint, event:%{public, location:esca pe_only}s, condition:%{private, location:escape_only}s}",  v5,  v6,  v7,  v8,  v26,  v27,  v28,  v29,  v30);
  }

  id v9 = sub_10000DF14();
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (sub_10000D0B8(v10))
  {
    sub_10000D02C();
    sub_10000D058( (void *)&_mh_execute_header,  v11,  v12,  v13,  "Endpoint must be same as the initially passed endpoint",  "{msg%{public}.0s:Endpoint must be same as the initially passed endpoint, event:%{public, location:esca pe_only}s, condition:%{private, location:escape_only}s}",  v14,  v15,  v26,  v27,  v28,  v29,  v30);
  }

  id v16 = sub_10000DF14();
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (sub_10000D0A0(v17))
  {
    sub_10000D02C();
    sub_10000D078( (void *)&_mh_execute_header,  v18,  v19,  "{msg%{public}.0s:Endpoint must be same as the initially passed endpoint, event:%{public, location:esca pe_only}s, condition:%{private, location:escape_only}s}",  v20,  v21,  v22,  v23,  v26,  v27,  v28,  v29,  v30);
  }

  uint64_t v24 = abort_report_np( "%s:%d: assertion failure in %s",  "/Library/Caches/com.apple.xbs/Sources/RelativeMotion/relatived/RMDataStreamHandler.m",  91,  "-[RMDataStreamHandler endpoint:didReceiveStreamingRequest:withData:]");
  return sub_100011A30(v24);
}

uint64_t sub_100011A30()
{
  id v1 = sub_10000DF14();
  id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (sub_10000D0AC(v2))
  {
    sub_10000D02C();
    sub_10000D08C( (void *)&_mh_execute_header,  v3,  v4,  "{msg%{public}.0s:Endpoint must be same as the initially passed endpoint, event:%{public, location:esca pe_only}s, condition:%{private, location:escape_only}s}",  v5,  v6,  v7,  v8,  v26,  v27,  v28,  v29,  v30);
  }

  id v9 = sub_10000DF14();
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (sub_10000D0B8(v10))
  {
    sub_10000D02C();
    sub_10000D058( (void *)&_mh_execute_header,  v11,  v12,  v13,  "Endpoint must be same as the initially passed endpoint",  "{msg%{public}.0s:Endpoint must be same as the initially passed endpoint, event:%{public, location:esca pe_only}s, condition:%{private, location:escape_only}s}",  v14,  v15,  v26,  v27,  v28,  v29,  v30);
  }

  id v16 = sub_10000DF14();
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (sub_10000D0A0(v17))
  {
    sub_10000D02C();
    sub_10000D078( (void *)&_mh_execute_header,  v18,  v19,  "{msg%{public}.0s:Endpoint must be same as the initially passed endpoint, event:%{public, location:esca pe_only}s, condition:%{private, location:escape_only}s}",  v20,  v21,  v22,  v23,  v26,  v27,  v28,  v29,  v30);
  }

  uint64_t v24 = abort_report_np( "%s:%d: assertion failure in %s",  "/Library/Caches/com.apple.xbs/Sources/RelativeMotion/relatived/RMDataStreamHandler.m",  145,  "-[RMDataStreamHandler endpoint:shouldStartStreamingDataToReceiver:]");
  return sub_100011B4C(v24);
}

uint64_t sub_100011B4C()
{
  id v1 = sub_10000DF14();
  id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (sub_10000D0AC(v2))
  {
    sub_10000D02C();
    sub_10000D08C( (void *)&_mh_execute_header,  v3,  v4,  "{msg%{public}.0s:Endpoint must be same as the initially passed endpoint, event:%{public, location:esca pe_only}s, condition:%{private, location:escape_only}s}",  v5,  v6,  v7,  v8,  v26,  v27,  v28,  v29,  v30);
  }

  id v9 = sub_10000DF14();
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (sub_10000D0B8(v10))
  {
    sub_10000D02C();
    sub_10000D058( (void *)&_mh_execute_header,  v11,  v12,  v13,  "Endpoint must be same as the initially passed endpoint",  "{msg%{public}.0s:Endpoint must be same as the initially passed endpoint, event:%{public, location:esca pe_only}s, condition:%{private, location:escape_only}s}",  v14,  v15,  v26,  v27,  v28,  v29,  v30);
  }

  id v16 = sub_10000DF14();
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (sub_10000D0A0(v17))
  {
    sub_10000D02C();
    sub_10000D078( (void *)&_mh_execute_header,  v18,  v19,  "{msg%{public}.0s:Endpoint must be same as the initially passed endpoint, event:%{public, location:esca pe_only}s, condition:%{private, location:escape_only}s}",  v20,  v21,  v22,  v23,  v26,  v27,  v28,  v29,  v30);
  }

  uint64_t v24 = abort_report_np( "%s:%d: assertion failure in %s",  "/Library/Caches/com.apple.xbs/Sources/RelativeMotion/relatived/RMDataStreamHandler.m",  228,  "-[RMDataStreamHandler endpointShouldStopStreamingData:]");
  return sub_100011C68(v24);
}

#error "100011CD8: call analysis failed (funcsize=58)"
#error "100011DF0: call analysis failed (funcsize=58)"
id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__startAudioAccessoryDeviceMotionUpdatesToQueue_lowLatencyMode_withHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_startAudioAccessoryDeviceMotionUpdatesToQueue:lowLatencyMode:withHandler:");
}