void sub_100004B70(id a1)
{
  qword_1000260E0 = (uint64_t)os_log_create("com.apple.avfaudio", "atpt");
}

uint64_t sub_100004B9C( uint64_t a1, int a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  *(_BYTE *)a1 = 0;
  *(void *)(a1 + 16) = 0LL;
  *(double *)(a1 + 24) = a4;
  *(void *)(a1 + 40) = 0LL;
  *(double *)(a1 + 72) = a3;
  *(_BYTE *)(a1 + 80) = 0;
  double v11 = fmax(a6, 1.0);
  double v12 = fmin(a8, v11);
  double v13 = 0.0;
  if (v12 != 0.0) {
    double v13 = a3 / (1000.0 / v12);
  }
  *(double *)(a1 + 64) = v13;
  if (a2) {
    int v14 = a2;
  }
  else {
    int v14 = -1;
  }
  *(_DWORD *)(a1 + 52) = v14;
  *(_DWORD *)(a1 + 56) = (int)(a3 / (1000.0 / v11));
  if (a7 == 0.0) {
    int v15 = 0;
  }
  else {
    int v15 = (int)(a3 / (1000.0 / a7));
  }
  *(_DWORD *)(a1 + 60) = v15;
  double v16 = fmax(a9, 0.0);
  if (v16 == 0.0) {
    int v17 = 0;
  }
  else {
    int v17 = (int)(a3 / (-1000.0 / v16));
  }
  *(_DWORD *)(a1 + 48) = v17;
  float v18 = a5 * 0.05;
  float v19 = __exp10f(v18);
  double v20 = v19;
  if (v19 > 1.0)
  {
    if (qword_1000260B0 != -1) {
      dispatch_once(&qword_1000260B0, &stru_100020490);
    }
    v21 = (os_log_s *) (id) qword_1000260E0;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      int v23 = 136315650;
      v24 = "PulseTone.mm";
      __int16 v25 = 1024;
      int v26 = 142;
      __int16 v27 = 2048;
      double v28 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "%25s:%-5d Playing tone above amplitude of 1.0. { amplitude=%f }",  (uint8_t *)&v23,  0x1Cu);
    }
  }

  *(double *)(a1 + 32) = v20;
  *(double *)(a1 + 8) = (*(double *)(a1 + 64) + (double)*(int *)(a1 + 56)) / a3;
  return a1;
}

void sub_100004D88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100004D9C(void *a1)
{
}

uint64_t start()
{
  v0 = objc_opt_new(&OBJC_CLASS___AVAudioDeviceTestServiceDelegate);
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCListener serviceListener](&OBJC_CLASS___NSXPCListener, "serviceListener"));
  [v1 setDelegate:v0];
  [v1 resume];

  return 0LL;
}

void sub_100005C08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100005CF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

LABEL_117:
}

void sub_100007248( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_1000078B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100007A3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

LABEL_24:
    ++v14;
  }

  v48 = 0LL;
  v30 = [v13 setPreferredDataSource:j error:&v48];
  v31 = v48;
  if ((v30 & 1) != 0)
  {
    if (qword_1000260B8 != -1) {
      dispatch_once(&qword_1000260B8, &stru_1000204D0);
    }
    v32 = (os_log_s *) (id) qword_1000260E8;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v54 = "AVAudioDeviceTestService.mm";
      v55 = 1024;
      v56 = 404;
      v57 = 2112;
      v58 = j;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%25s:%-5d using data source %@", buf, 0x1Cu);
    }
  }

  else
  {
    if (qword_1000260B8 != -1) {
      dispatch_once(&qword_1000260B8, &stru_1000204D0);
    }
    v33 = (os_log_s *) (id) qword_1000260E8;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      v34 = [v31 code];
      *(_DWORD *)buf = 136315650;
      v54 = "AVAudioDeviceTestService.mm";
      v55 = 1024;
      v56 = 402;
      v57 = 2048;
      v58 = v34;
      _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_ERROR,  "%25s:%-5d setPreferredDataSource %li",  buf,  0x1Cu);
    }
  }

  v47 = v31;
  v35 = [v45 setPreferredInput:v13 error:&v47];
  v36 = v47;

  if ((v35 & 1) != 0)
  {
    if (qword_1000260B8 != -1) {
      dispatch_once(&qword_1000260B8, &stru_1000204D0);
    }
    v37 = (os_log_s *) (id) qword_1000260E8;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v54 = "AVAudioDeviceTestService.mm";
      v55 = 1024;
      v56 = 411;
      v57 = 2112;
      v58 = v13;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "%25s:%-5d using port %@", buf, 0x1Cu);
    }
  }

  else
  {
    if (qword_1000260B8 != -1) {
      dispatch_once(&qword_1000260B8, &stru_1000204D0);
    }
    v38 = (os_log_s *) (id) qword_1000260E8;
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      v39 = [v36 code];
      *(_DWORD *)buf = 136315650;
      v54 = "AVAudioDeviceTestService.mm";
      v55 = 1024;
      v56 = 409;
      v57 = 2048;
      v58 = v39;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "%25s:%-5d setPreferredInput %li", buf, 0x1Cu);
    }
  }

  if ([v5 outputMode] == (id)1) {
    v40 = 1936747378LL;
  }
  else {
    v40 = 0LL;
  }
  v46 = v36;
  v41 = [v45 overrideOutputAudioPort:v40 error:&v46];
  v42 = v46;

  if ((v41 & 1) == 0)
  {
    if (qword_1000260B8 != -1) {
      dispatch_once(&qword_1000260B8, &stru_1000204D0);
    }
    v43 = (os_log_s *) (id) qword_1000260E8;
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      v44 = [v42 code];
      *(_DWORD *)buf = 136315650;
      v54 = "AVAudioDeviceTestService.mm";
      v55 = 1024;
      v56 = 417;
      v57 = 2048;
      v58 = v44;
      _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_ERROR,  "%25s:%-5d overrideOutputAudioPort %li",  buf,  0x1Cu);
    }
  }
}

void sub_10000811C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

LABEL_13:
    exit(-9);
  }

  v9 = v4;
  -[AVAudioDeviceTestService setExtensionHandle:]( v5,  "setExtensionHandle:",  sandbox_extension_consume([v9 UTF8String]));
  if (-[AVAudioDeviceTestService extensionHandle](v5, "extensionHandle") < 0)
  {
    if (qword_1000260B8 != -1) {
      dispatch_once(&qword_1000260B8, &stru_1000204D0);
    }
    v7 = (os_log_s *) (id) qword_1000260E8;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *__error();
      *(_DWORD *)buf = 136315650;
      double v11 = "AVAudioDeviceTestService.mm";
      double v12 = 1024;
      double v13 = 430;
      int v14 = 1024;
      int v15 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%25s:%-5d failed to consume extension: %i",  buf,  0x18u);
    }

    goto LABEL_13;
  }

  objc_sync_exit(v5);
}

void sub_100008434(_Unwind_Exception *a1)
{
  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

void sub_1000084F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000A728( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, void *exc_buf, void *a15, uint64_t a16, void *a17, void *a18, void *a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, void *a35, void *a36, uint64_t a37, uint64_t a38, char a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,void *a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,void *a60)
{
  if (a2)
  {

    _Block_object_dispose((const void *)(v65 - 208), 8);
    _Block_object_dispose(&a39, 8);

    if (a2 == 2)
    {
      id v67 = objc_begin_catch(a1);
      if (qword_1000260B8 != -1) {
        dispatch_once(&qword_1000260B8, &stru_1000204D0);
      }
      v68 = (os_log_s *) (id) qword_1000260E8;
      if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
      {
        id v69 = sub_100011968(-7LL);
        v70 = (void *)objc_claimAutoreleasedReturnValue(v69);
        id v71 = [v70 code];
        *(_DWORD *)(v65 - 208) = 136315906;
        uint64_t v72 = v65 - 256;
        *(void *)(v72 + 52) = "AVAudioDeviceTestService.mm";
        *(_WORD *)(v65 - 196) = 1024;
        *(_DWORD *)(v72 + 62) = 838;
        *(_WORD *)(v65 - 190) = 2112;
        *(void *)(v72 + 68) = v67;
        *(_WORD *)(v65 - 180) = 2048;
        *(void *)(v72 + 78) = v71;
        _os_log_impl( (void *)&_mh_execute_header,  v68,  OS_LOG_TYPE_ERROR,  "%25s:%-5d exception (%@) with test error (%li)",  (uint8_t *)(v65 - 208),  0x26u);
      }

      id v73 = sub_100011968(-7LL);
      v74 = (void *)objc_claimAutoreleasedReturnValue(v73);
      (*(void (**)(uint64_t, void, void *))(v60 + 16))(v60, 0LL, v74);

      objc_end_catch();
      JUMPOUT(0x10000A1D0LL);
    }

    objc_begin_catch(a1);
    JUMPOUT(0x10000A1D4LL);
  }

  _Unwind_Resume(a1);
}

void sub_10000B4CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000B5EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000C454( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_10000CE5C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_10000D434(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000D5B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000D680(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000D72C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000DAC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000DCBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000E030(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

LABEL_75:
}

void sub_10000EAE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000F0BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000F1B8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000F53C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_10000F854( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  v10 = v9;

  a9.super_class = (Class)&OBJC_CLASS___AVAudioDeviceTestService;
  -[_Unwind_Exception dealloc](&a9, "dealloc");
  _Unwind_Resume(a1);
}

void sub_10000FC0C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14)
{
  _Unwind_Resume(a1);
}
}

void sub_10000FEA8( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_100010368( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, void *a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, void *a30)
{
  _Unwind_Resume(a1);
}

void sub_10001082C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000109D4(_Unwind_Exception *a1)
{
  v3 = v1;

  _Unwind_Resume(a1);
}

void sub_100010B28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100010B7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100010E1C(id **a1, id *a2)
{
  v2 = *a1;
  *a1 = a2;
  if (v2)
  {

    operator delete(v2);
  }

void sub_100010E58(id a1)
{
  qword_1000260E8 = (uint64_t)os_log_create("com.apple.avfaudio", "asts");
}

void sub_100010E84(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:AVAudioSessionRouteChangeReasonKey]);
  id v6 = [v5 unsignedIntegerValue];

  v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stringForRouteChangeReason:v6]);
  if (qword_1000260B8 != -1) {
    dispatch_once(&qword_1000260B8, &stru_1000204D0);
  }
  v8 = (os_log_s *) (id) qword_1000260E8;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
    int v11 = 136315906;
    double v12 = "AVAudioDeviceTestService.mm";
    __int16 v13 = 1024;
    int v14 = 1731;
    __int16 v15 = 2112;
    double v16 = v7;
    __int16 v17 = 2112;
    float v18 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%25s:%-5d route change (%@) - %@",  (uint8_t *)&v11,  0x26u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.avfaudio.devicetest.service",  -2LL,  0LL));
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_100011038(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100011090(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:AVAudioSessionInterruptionTypeKey]);

  if (v5)
  {
    id v6 = [v5 unsignedIntegerValue];
    v7 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:AVAudioSessionInterruptionReasonKey]);
    id v9 = [v8 unsignedIntegerValue];

    v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stringForInterruptionReason:v9]);
    if (v6)
    {
      if (v6 == (id)1)
      {
        if (qword_1000260B8 != -1) {
          dispatch_once(&qword_1000260B8, &stru_1000204D0);
        }
        int v11 = (os_log_s *) (id) qword_1000260E8;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          double v12 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
          int v18 = 136315906;
          float v19 = "AVAudioDeviceTestService.mm";
          __int16 v20 = 1024;
          int v21 = 1765;
          __int16 v22 = 2114;
          id v23 = v10;
          __int16 v24 = 2114;
          __int16 v25 = v12;
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%25s:%-5d Interruption began (%{public}@) - %{public}@",  (uint8_t *)&v18,  0x26u);
        }

        __int16 v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.avfaudio.devicetest.service",  -16LL,  0LL));
        (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
      }

      else
      {
        if (qword_1000260B8 != -1) {
          dispatch_once(&qword_1000260B8, &stru_1000204D0);
        }
        __int16 v17 = (os_log_s *) (id) qword_1000260E8;
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          int v18 = 136315394;
          float v19 = "AVAudioDeviceTestService.mm";
          __int16 v20 = 1024;
          int v21 = 1784;
          _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%25s:%-5d Unhandled interruption type",  (uint8_t *)&v18,  0x12u);
        }

        __int16 v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.avfaudio.devicetest.service",  -3LL,  0LL));
        (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
      }
    }

    else
    {
      if (qword_1000260B8 != -1) {
        dispatch_once(&qword_1000260B8, &stru_1000204D0);
      }
      __int16 v15 = (os_log_s *) (id) qword_1000260E8;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        double v16 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
        int v18 = 136315906;
        float v19 = "AVAudioDeviceTestService.mm";
        __int16 v20 = 1024;
        int v21 = 1775;
        __int16 v22 = 2114;
        id v23 = v10;
        __int16 v24 = 2114;
        __int16 v25 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%25s:%-5d Interruption ended (%{public}@) - %{public}@",  (uint8_t *)&v18,  0x26u);
      }

      __int16 v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.avfaudio.devicetest.service",  -17LL,  0LL));
      (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
    }
  }

  else
  {
    if (qword_1000260B8 != -1) {
      dispatch_once(&qword_1000260B8, &stru_1000204D0);
    }
    int v14 = (os_log_s *) (id) qword_1000260E8;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 136315650;
      float v19 = "AVAudioDeviceTestService.mm";
      __int16 v20 = 1024;
      int v21 = 1749;
      __int16 v22 = 2112;
      id v23 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%25s:%-5d No AVAudioSessionInterruptionTypeKey. note: %@",  (uint8_t *)&v18,  0x1Cu);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.avfaudio.devicetest.service",  -3LL,  0LL));
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }
}

void sub_100011528(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000115D0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (qword_1000260B8 != -1) {
    dispatch_once(&qword_1000260B8, &stru_1000204D0);
  }
  v4 = (os_log_s *) (id) qword_1000260E8;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
    id v6 = sub_100011968(-4LL);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    int v9 = 136315906;
    v10 = "AVAudioDeviceTestService.mm";
    __int16 v11 = 1024;
    int v12 = 1799;
    __int16 v13 = 2112;
    int v14 = v5;
    __int16 v15 = 2048;
    id v16 = [v7 code];
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%25s:%-5d mediaserverd/audiomxd died (%@) with test error (%li)",  (uint8_t *)&v9,  0x26u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.avfaudio.devicetest.service",  -4LL,  0LL));
  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100011754(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001179C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (qword_1000260B8 != -1) {
    dispatch_once(&qword_1000260B8, &stru_1000204D0);
  }
  v4 = (os_log_s *) (id) qword_1000260E8;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
    id v6 = sub_100011968(-5LL);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    int v9 = 136315906;
    v10 = "AVAudioDeviceTestService.mm";
    __int16 v11 = 1024;
    int v12 = 1810;
    __int16 v13 = 2112;
    int v14 = v5;
    __int16 v15 = 2048;
    id v16 = [v7 code];
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%25s:%-5d mediaserverd/audiomxd was reset (%@) with test error (%li)",  (uint8_t *)&v9,  0x26u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.avfaudio.devicetest.service",  -5LL,  0LL));
  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100011920(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100011968(uint64_t a1)
{
  if (qword_1000260B8 != -1) {
    dispatch_once(&qword_1000260B8, &stru_1000204D0);
  }
  v2 = (os_log_s *) (id) qword_1000260E8;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315650;
    v5 = "AVAudioDeviceTestService.mm";
    __int16 v6 = 1024;
    int v7 = 163;
    __int16 v8 = 2048;
    uint64_t v9 = a1;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "%25s:%-5d error code %li", (uint8_t *)&v4, 0x1Cu);
  }

  return (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSCocoaErrorDomain,  a1,  0LL));
}

void *sub_100011A78(void *a1, uint64_t a2, int *a3)
{
  *a1 = 0LL;
  a1[1] = 0LL;
  a1[2] = 0LL;
  if (a2)
  {
    uint64_t v6 = 4 * a2;
    int v7 = operator new(4 * a2);
    *a1 = v7;
    a1[1] = v7;
    __int16 v8 = &v7[a2];
    a1[2] = v8;
    int v9 = *a3;
    do
    {
      *v7++ = v9;
      v6 -= 4LL;
    }

    while (v6);
    a1[1] = v8;
  }

  return a1;
}

id sub_100011AE0(uint64_t a1, uint64_t a2, void *a3)
{
  *a3 = 0LL;
  return *(id *)(a1 + 32);
}

void sub_100011AEC(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:AVSystemController_AudioVolumeNotificationParameter]);

  [v5 floatValue];
  float v6 = *(float *)(a1 + 32);
  float v8 = vabds_f32(v7, v6);
  float v9 = fabsf(v7 + v6);
  float v10 = (float)(v9 * 0.00000011921) + (float)(v9 * 0.00000011921);
  if (v8 >= 1.1755e-38 && v8 > v10)
  {
    int v12 = (void *)objc_claimAutoreleasedReturnValue( +[AVSystemController sharedAVSystemController]( &OBJC_CLASS___AVSystemController,  "sharedAVSystemController"));
    LODWORD(v13) = *(_DWORD *)(a1 + 32);
    [v12 setActiveCategoryVolumeTo:v13];

    if (qword_1000260B8 != -1) {
      dispatch_once(&qword_1000260B8, &stru_1000204D0);
    }
    int v14 = (os_log_s *) (id) qword_1000260E8;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      [v5 floatValue];
      double v15 = *(float *)(a1 + 32);
      int v17 = 136315906;
      int v18 = "AVAudioDeviceTestService.mm";
      __int16 v19 = 1024;
      int v20 = 1445;
      __int16 v21 = 2048;
      double v22 = v16;
      __int16 v23 = 2048;
      double v24 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%25s:%-5d Volume not as expected, updating volume. { current=%f, expected=%f }",  (uint8_t *)&v17,  0x26u);
    }
  }
}

void sub_100011C98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100011CDC(uint64_t a1)
{
  if (qword_1000260B8 != -1) {
    dispatch_once(&qword_1000260B8, &stru_1000204D0);
  }
  v2 = (os_log_s *) (id) qword_1000260E8;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v19 = "AVAudioDeviceTestService.mm";
    __int16 v20 = 1024;
    int v21 = 1378;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "%25s:%-5d Attempting to stop audio session for HearingTest.",  buf,  0x12u);
  }

  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) hearingTestSession]);
  if (!v3) {
    goto LABEL_8;
  }
  int v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) hearingTestSession]);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) hearingTestSession]);
    unsigned __int8 v6 = [v5 isActive];

    if ((v6 & 1) == 0)
    {
LABEL_8:
      if (qword_1000260B8 != -1) {
        dispatch_once(&qword_1000260B8, &stru_1000204D0);
      }
      float v7 = (os_log_s *) (id) qword_1000260E8;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v19 = "AVAudioDeviceTestService.mm";
        __int16 v20 = 1024;
        int v21 = 1383;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%25s:%-5d Hearing test audio session is not active, cannot de-activate it.",  buf,  0x12u);
      }

      float v8 = 0LL;
      (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
      goto LABEL_26;
    }
  }

  else
  {
  }

  float v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) hearingTestSession]);
  id v17 = 0LL;
  [v9 setActive:0 error:&v17];
  id v10 = v17;

  if (v10)
  {
    if (qword_1000260B8 != -1) {
      dispatch_once(&qword_1000260B8, &stru_1000204D0);
    }
    __int16 v11 = (os_log_s *) (id) qword_1000260E8;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = (void *)objc_claimAutoreleasedReturnValue([v10 localizedDescription]);
      *(_DWORD *)buf = 136315650;
      __int16 v19 = "AVAudioDeviceTestService.mm";
      __int16 v20 = 1024;
      int v21 = 1390;
      __int16 v22 = 2114;
      __int16 v23 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%25s:%-5d Failed de-activate audio session. { error=%{public}@ }",  buf,  0x1Cu);
    }

    uint64_t v13 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.avfaudio.devicetest.service",  -14LL,  0LL));
    float v8 = (void *)v13;
  }

  else
  {
    if (qword_1000260B8 != -1) {
      dispatch_once(&qword_1000260B8, &stru_1000204D0);
    }
    int v14 = (os_log_s *) (id) qword_1000260E8;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v19 = "AVAudioDeviceTestService.mm";
      __int16 v20 = 1024;
      int v21 = 1393;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%25s:%-5d De-activated audio session.",  buf,  0x12u);
    }

    float v8 = 0LL;
  }

  double v15 = *(void **)(a1 + 32);
  float v16 = (void *)objc_claimAutoreleasedReturnValue([v15 userVolumeBeforeHearingTest]);
  [v16 floatValue];
  objc_msgSend(v15, "resetVolume:");

  [*(id *)(a1 + 32) cleanUpObservers];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
LABEL_26:
}

void sub_1000120AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100012104(uint64_t a1)
{
  if (qword_1000260B8 != -1) {
    dispatch_once(&qword_1000260B8, &stru_1000204D0);
  }
  v2 = (os_log_s *) (id) qword_1000260E8;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    double v28 = "AVAudioDeviceTestService.mm";
    __int16 v29 = 1024;
    int v30 = 1327;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "%25s:%-5d Setting up audio session with Playback category for HearingTest.",  buf,  0x12u);
  }

  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance"));
  [*(id *)(a1 + 32) setHearingTestSession:v3];

  int v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) hearingTestSession]);
  id v26 = 0LL;
  unsigned __int8 v5 = [v4 setCategory:AVAudioSessionCategoryPlayback error:&v26];
  id v6 = v26;

  if (v6) {
    unsigned __int8 v7 = 0;
  }
  else {
    unsigned __int8 v7 = v5;
  }
  if ((v7 & 1) != 0)
  {
    float v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) hearingTestSession]);
    id v25 = 0LL;
    unsigned __int8 v9 = [v8 setMode:AVAudioSessionModeRaw error:&v25];
    id v10 = v25;

    if (v10) {
      unsigned __int8 v11 = 0;
    }
    else {
      unsigned __int8 v11 = v9;
    }
    if ((v11 & 1) != 0)
    {
      int v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) hearingTestSession]);
      id v24 = 0LL;
      unsigned __int8 v13 = [v12 setActive:1 error:&v24];
      id v14 = v24;

      if (v14) {
        unsigned __int8 v15 = 0;
      }
      else {
        unsigned __int8 v15 = v13;
      }
      if ((v15 & 1) != 0)
      {
        if (qword_1000260B8 != -1) {
          dispatch_once(&qword_1000260B8, &stru_1000204D0);
        }
        float v16 = (os_log_s *) (id) qword_1000260E8;
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          double v28 = "AVAudioDeviceTestService.mm";
          __int16 v29 = 1024;
          int v30 = 1367;
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "%25s:%-5d Setup and activated audio session for HearingTest.",  buf,  0x12u);
        }

        [*(id *)(a1 + 32) setupObservers:*(void *)(a1 + 40)];
        (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
        id v17 = 0LL;
      }

      else
      {
        if (qword_1000260B8 != -1) {
          dispatch_once(&qword_1000260B8, &stru_1000204D0);
        }
        __int16 v22 = (os_log_s *) (id) qword_1000260E8;
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          __int16 v23 = (void *)objc_claimAutoreleasedReturnValue([v14 localizedDescription]);
          *(_DWORD *)buf = 136315650;
          double v28 = "AVAudioDeviceTestService.mm";
          __int16 v29 = 1024;
          int v30 = 1361;
          __int16 v31 = 2114;
          v32 = v23;
          _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "%25s:%-5d Failed to set active. { error=%{public}@ }",  buf,  0x1Cu);
        }

        id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.avfaudio.devicetest.service",  -1LL,  0LL));
        (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
      }
    }

    else
    {
      if (qword_1000260B8 != -1) {
        dispatch_once(&qword_1000260B8, &stru_1000204D0);
      }
      __int16 v20 = (os_log_s *) (id) qword_1000260E8;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        int v21 = (void *)objc_claimAutoreleasedReturnValue([v10 localizedDescription]);
        *(_DWORD *)buf = 136315650;
        double v28 = "AVAudioDeviceTestService.mm";
        __int16 v29 = 1024;
        int v30 = 1343;
        __int16 v31 = 2114;
        v32 = v21;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "%25s:%-5d Failed to set mode. { error=%{public}@ }",  buf,  0x1Cu);
      }

      id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.avfaudio.devicetest.service",  -1LL,  0LL));
      (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
    }
  }

  else
  {
    if (qword_1000260B8 != -1) {
      dispatch_once(&qword_1000260B8, &stru_1000204D0);
    }
    int v18 = (os_log_s *) (id) qword_1000260E8;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      __int16 v19 = (void *)objc_claimAutoreleasedReturnValue([v6 localizedDescription]);
      *(_DWORD *)buf = 136315650;
      double v28 = "AVAudioDeviceTestService.mm";
      __int16 v29 = 1024;
      int v30 = 1335;
      __int16 v31 = 2114;
      v32 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "%25s:%-5d Failed to set category. { error=%{public}@ }",  buf,  0x1Cu);
    }

    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.avfaudio.devicetest.service",  -1LL,  0LL));
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }
}

void sub_100012678(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000126D4(uint64_t a1)
{
  if (qword_1000260B8 != -1) {
    dispatch_once(&qword_1000260B8, &stru_1000204D0);
  }
  v2 = (os_log_s *) (id) qword_1000260E8;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    double v28 = "AVAudioDeviceTestService.mm";
    __int16 v29 = 1024;
    int v30 = 1277;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "%25s:%-5d Setting up audio session with Playback category for HearingTest.",  buf,  0x12u);
  }

  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance"));
  [*(id *)(a1 + 32) setHearingTestSession:v3];

  int v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) hearingTestSession]);
  id v26 = 0LL;
  unsigned __int8 v5 = [v4 setCategory:AVAudioSessionCategoryPlayback error:&v26];
  id v6 = v26;

  if (v6) {
    unsigned __int8 v7 = 0;
  }
  else {
    unsigned __int8 v7 = v5;
  }
  if ((v7 & 1) != 0)
  {
    float v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) hearingTestSession]);
    id v25 = 0LL;
    unsigned __int8 v9 = [v8 setMode:AVAudioSessionModeRaw error:&v25];
    id v10 = v25;

    if (v10) {
      unsigned __int8 v11 = 0;
    }
    else {
      unsigned __int8 v11 = v9;
    }
    if ((v11 & 1) != 0)
    {
      int v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) hearingTestSession]);
      id v24 = 0LL;
      unsigned __int8 v13 = [v12 setActive:1 error:&v24];
      id v14 = v24;

      if (v14) {
        unsigned __int8 v15 = 0;
      }
      else {
        unsigned __int8 v15 = v13;
      }
      if ((v15 & 1) != 0)
      {
        if (qword_1000260B8 != -1) {
          dispatch_once(&qword_1000260B8, &stru_1000204D0);
        }
        float v16 = (os_log_s *) (id) qword_1000260E8;
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          double v28 = "AVAudioDeviceTestService.mm";
          __int16 v29 = 1024;
          int v30 = 1317;
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "%25s:%-5d Setup and activated audio session for HearingTest.",  buf,  0x12u);
        }

        [*(id *)(a1 + 32) setupObservers:*(void *)(a1 + 40)];
        id v17 = 0LL;
      }

      else
      {
        if (qword_1000260B8 != -1) {
          dispatch_once(&qword_1000260B8, &stru_1000204D0);
        }
        __int16 v22 = (os_log_s *) (id) qword_1000260E8;
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          __int16 v23 = (void *)objc_claimAutoreleasedReturnValue([v14 localizedDescription]);
          *(_DWORD *)buf = 136315650;
          double v28 = "AVAudioDeviceTestService.mm";
          __int16 v29 = 1024;
          int v30 = 1311;
          __int16 v31 = 2114;
          v32 = v23;
          _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "%25s:%-5d Failed to set active. { error=%{public}@ }",  buf,  0x1Cu);
        }

        id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.avfaudio.devicetest.service",  -1LL,  0LL));
        (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
      }
    }

    else
    {
      if (qword_1000260B8 != -1) {
        dispatch_once(&qword_1000260B8, &stru_1000204D0);
      }
      __int16 v20 = (os_log_s *) (id) qword_1000260E8;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        int v21 = (void *)objc_claimAutoreleasedReturnValue([v10 localizedDescription]);
        *(_DWORD *)buf = 136315650;
        double v28 = "AVAudioDeviceTestService.mm";
        __int16 v29 = 1024;
        int v30 = 1293;
        __int16 v31 = 2114;
        v32 = v21;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "%25s:%-5d Failed to set mode. { error=%{public}@ }",  buf,  0x1Cu);
      }

      id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.avfaudio.devicetest.service",  -1LL,  0LL));
      (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
    }
  }

  else
  {
    if (qword_1000260B8 != -1) {
      dispatch_once(&qword_1000260B8, &stru_1000204D0);
    }
    int v18 = (os_log_s *) (id) qword_1000260E8;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      __int16 v19 = (void *)objc_claimAutoreleasedReturnValue([v6 localizedDescription]);
      *(_DWORD *)buf = 136315650;
      double v28 = "AVAudioDeviceTestService.mm";
      __int16 v29 = 1024;
      int v30 = 1285;
      __int16 v31 = 2114;
      v32 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "%25s:%-5d Failed to set category. { error=%{public}@ }",  buf,  0x1Cu);
    }

    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.avfaudio.devicetest.service",  -1LL,  0LL));
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }
}

void sub_100012C34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100012C90(uint64_t a1)
{
  return [*(id *)(a1 + 32) cleanUp];
}

void sub_100012C98(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) inputTapFile]);
  id v9 = 0LL;
  unsigned __int8 v5 = [v4 writeFromBuffer:v3 error:&v9];
  id v6 = v9;

  if ((v5 & 1) == 0)
  {
    if (qword_1000260B8 != -1) {
      dispatch_once(&qword_1000260B8, &stru_1000204D0);
    }
    unsigned __int8 v7 = (os_log_s *) (id) qword_1000260E8;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      float v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) localizedDescription]);
      *(_DWORD *)buf = 136315650;
      unsigned __int8 v11 = "AVAudioDeviceTestService.mm";
      __int16 v12 = 1024;
      int v13 = 1224;
      __int16 v14 = 2112;
      unsigned __int8 v15 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%25s:%-5d error writing debug file %@",  buf,  0x1Cu);
    }
  }
}

void sub_100012DFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100012E30(uint64_t a1)
{
  if (qword_1000260B8 != -1) {
    dispatch_once(&qword_1000260B8, &stru_1000204D0);
  }
  v2 = (os_log_s *) (id) qword_1000260E8;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315394;
    unsigned __int8 v15 = "AVAudioDeviceTestService.mm";
    __int16 v16 = 1024;
    int v17 = 1161;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "%25s:%-5d [AVAT Server] Stop tone playback requested.",  (uint8_t *)&v14,  0x12u);
  }

  id v3 = *(_BYTE **)(*(void *)(a1 + 32) + 8LL);
  if (v3)
  {
    _BYTE *v3 = 1;
    if (qword_1000260B8 != -1) {
      dispatch_once(&qword_1000260B8, &stru_1000204D0);
    }
    int v4 = (os_log_s *) (id) qword_1000260E8;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
      int v14 = 136315650;
      unsigned __int8 v15 = "AVAudioDeviceTestService.mm";
      __int16 v16 = 1024;
      int v17 = 1165;
      __int16 v18 = 2048;
      uint64_t v19 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%25s:%-5d [AVAT Server] Tone has been stopped. { frequency=%f }",  (uint8_t *)&v14,  0x1Cu);
    }

    +[NSThread sleepForTimeInterval:]( &OBJC_CLASS___NSThread,  "sleepForTimeInterval:",  *(double *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 8LL));
  }

  else
  {
    if (qword_1000260B8 != -1) {
      dispatch_once(&qword_1000260B8, &stru_1000204D0);
    }
    id v6 = (os_log_s *) (id) qword_1000260E8;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136315394;
      unsigned __int8 v15 = "AVAudioDeviceTestService.mm";
      __int16 v16 = 1024;
      int v17 = 1168;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%25s:%-5d [AVAT Server] Tone stop requested but, pulse tone handler is nil",  (uint8_t *)&v14,  0x12u);
    }
  }

  unsigned __int8 v7 = *(void **)(a1 + 32);
  float v8 = (void *)objc_claimAutoreleasedReturnValue([v7 userVolumeBeforeHearingTest]);
  [v8 floatValue];
  objc_msgSend(v7, "resetVolume:");

  [*(id *)(a1 + 32) removeSystemVolumeObserver];
  id v9 = sub_100013128();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  uint64_t v11 = sub_100013194();
  if ((unint64_t)(v11 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v12 = v11;
    if (os_signpost_enabled(v10))
    {
      LOWORD(v14) = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v10,  OS_SIGNPOST_INTERVAL_END,  v12,  "AVF tone playback",  "user tap",  (uint8_t *)&v14,  2u);
    }
  }

  return [*(id *)(a1 + 32) cleanUp];
}

void sub_100013108(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100013120(uint64_t a1)
{
  return [*(id *)(a1 + 32) cleanUp];
}

__objc2_prot_list *sub_100013128()
{
  unsigned __int8 v0 = atomic_load((unsigned __int8 *)&qword_1000260C8);
  p_prots = &OBJC_PROTOCOL___NSObject.prots;
  if ((v0 & 1) == 0)
  {
    int v3 = __cxa_guard_acquire(&qword_1000260C8);
    p_prots = (__objc2_prot_list **)(&OBJC_PROTOCOL___NSObject + 16);
    if (v3)
    {
      qword_1000260C0 = (uint64_t)os_log_create("com.apple.avfaudio", "adtssp");
      __cxa_guard_release(&qword_1000260C8);
      p_prots = (__objc2_prot_list **)(&OBJC_PROTOCOL___NSObject + 16);
    }
  }

  return p_prots[24];
}

uint64_t sub_100013194()
{
  unsigned __int8 v0 = atomic_load((unsigned __int8 *)&qword_1000260D8);
  if ((v0 & 1) == 0 && __cxa_guard_acquire(&qword_1000260D8))
  {
    v2 = sub_100013128();
    int v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    os_signpost_id_t v4 = os_signpost_id_generate(v3);

    qword_1000260D0 = v4;
    __cxa_guard_release(&qword_1000260D8);
  }

  return qword_1000260D0;
}

uint64_t sub_100013204(uint64_t a1)
{
  if (qword_1000260B8 != -1) {
    dispatch_once(&qword_1000260B8, &stru_1000204D0);
  }
  v2 = (os_log_s *) (id) qword_1000260E8;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    uint64_t v5 = "AVAudioDeviceTestService.mm";
    __int16 v6 = 1024;
    int v7 = 1112;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "%25s:%-5d player finished",  (uint8_t *)&v4,  0x12u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1000132FC(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) inputTapFile]);
  id v9 = 0LL;
  unsigned __int8 v5 = [v4 writeFromBuffer:v3 error:&v9];
  id v6 = v9;

  if ((v5 & 1) == 0)
  {
    if (qword_1000260B8 != -1) {
      dispatch_once(&qword_1000260B8, &stru_1000204D0);
    }
    int v7 = (os_log_s *) (id) qword_1000260E8;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      float v8 = (void *)objc_claimAutoreleasedReturnValue([v6 localizedDescription]);
      *(_DWORD *)buf = 136315650;
      uint64_t v11 = "AVAudioDeviceTestService.mm";
      __int16 v12 = 1024;
      int v13 = 1133;
      __int16 v14 = 2112;
      unsigned __int8 v15 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%25s:%-5d error writing debug file %@",  buf,  0x1Cu);
    }
  }
}

void sub_100013458(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001348C(id *a1)
{
  if (qword_1000260B8 != -1) {
    dispatch_once(&qword_1000260B8, &stru_1000204D0);
  }
  v2 = (os_log_s *) (id) qword_1000260E8;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    [a1[4] frequency];
    uint64_t v4 = v3;
    [a1[4] volume];
    float v6 = v5;
    [a1[4] duration];
    *(_DWORD *)buf = 136316162;
    *(void *)&uint8_t buf[4] = "AVAudioDeviceTestService.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 892;
    *(_WORD *)&buf[18] = 2048;
    *(void *)&buf[20] = v4;
    *(_WORD *)&buf[28] = 2048;
    *(double *)&buf[30] = v6;
    *(_WORD *)&buf[38] = 2048;
    id v121 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "%25s:%-5d [AVAT Server] Playback tone request. { frequency=%f, volume=%f, duration=%f }",  buf,  0x30u);
  }

  id v9 = a1[4];
  id v8 = a1[5];
  v110[0] = _NSConcreteStackBlock;
  v110[1] = 3221225472LL;
  v110[2] = sub_100014508;
  v110[3] = &unk_100020630;
  id v111 = a1[6];
  [v8 checkSequenceValidity:v9 completion:v110];
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1[5] hearingTestSession]);
  LODWORD(v8) = v10 == 0LL;

  if ((_DWORD)v8)
  {
    if (qword_1000260B8 != -1) {
      dispatch_once(&qword_1000260B8, &stru_1000204D0);
    }
    uint64_t v11 = (os_log_s *) (id) qword_1000260E8;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "AVAudioDeviceTestService.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 901;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%25s:%-5d HearingTest session not set, falling back to default playback session.",  buf,  0x12u);
    }

    id v13 = a1[4];
    id v12 = a1[5];
    v108[0] = _NSConcreteStackBlock;
    v108[1] = 3221225472LL;
    v108[2] = sub_100014564;
    v108[3] = &unk_100020630;
    id v109 = a1[6];
    [v12 setupAudioSessionFor:v13 playbackOnly:1 completion:v108];
  }

  __int16 v14 = (void *)objc_claimAutoreleasedReturnValue( +[AVSystemController sharedAVSystemController]( &OBJC_CLASS___AVSystemController,  "sharedAVSystemController"));
  if (([v14 getActiveCategoryVolume:&v107 andName:0] & 1) == 0)
  {
    if (qword_1000260B8 != -1) {
      dispatch_once(&qword_1000260B8, &stru_1000204D0);
    }
    unsigned __int8 v15 = (os_log_s *) (id) qword_1000260E8;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "AVAudioDeviceTestService.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 913;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%25s:%-5d Error getting current volume",  buf,  0x12u);
    }
  }

  if (qword_1000260B8 != -1) {
    dispatch_once(&qword_1000260B8, &stru_1000204D0);
  }
  __int16 v16 = (os_log_s *) (id) qword_1000260E8;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "AVAudioDeviceTestService.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 916;
    *(_WORD *)&buf[18] = 2048;
    *(double *)&buf[20] = v107;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "%25s:%-5d [AVAT Server] CurrentVolume=%f",  buf,  0x1Cu);
  }

  int v17 = (void *)objc_claimAutoreleasedReturnValue([a1[5] userVolumeBeforeHearingTest]);
  BOOL v18 = v17 == 0LL;

  if (v18)
  {
    uint64_t v19 = objc_alloc(&OBJC_CLASS___NSNumber);
    *(float *)&double v20 = v107;
    int v21 = -[NSNumber initWithFloat:](v19, "initWithFloat:", v20);
    [a1[5] setUserVolumeBeforeHearingTest:v21];
  }

  if (qword_1000260B8 != -1) {
    dispatch_once(&qword_1000260B8, &stru_1000204D0);
  }
  __int16 v22 = (os_log_s *) (id) qword_1000260E8;
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v23 = (void *)objc_claimAutoreleasedReturnValue([a1[5] userVolumeBeforeHearingTest]);
    [v23 doubleValue];
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "AVAudioDeviceTestService.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 922;
    *(_WORD *)&buf[18] = 2048;
    *(void *)&buf[20] = v24;
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "%25s:%-5d [AVAT Server] userVolumeBeforeHearingTest=%f",  buf,  0x1Cu);
  }

  [a1[4] volume];
  float v26 = vabds_f32(v107, v25);
  if (v26 >= 1.1755e-38)
  {
    float v27 = fabsf(v25 + v107);
    if (v26 > (float)((float)(v27 * 0.00000011921) + (float)(v27 * 0.00000011921)))
    {
      [a1[4] volume];
      if ((objc_msgSend(v14, "setActiveCategoryVolumeTo:") & 1) == 0)
      {
        if (qword_1000260B8 != -1) {
          dispatch_once(&qword_1000260B8, &stru_1000204D0);
        }
        double v28 = (os_log_s *) (id) qword_1000260E8;
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          [a1[4] volume];
          *(_DWORD *)buf = 136315650;
          *(void *)&uint8_t buf[4] = "AVAudioDeviceTestService.mm";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 925;
          *(_WORD *)&buf[18] = 2048;
          *(double *)&buf[20] = v29;
          _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "%25s:%-5d Unable to set category volume to %f",  buf,  0x1Cu);
        }

        int v30 = (void (**)(id, void, void *))a1[6];
        id v31 = sub_100011968(-15LL);
        v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
        v30[2](v30, 0LL, v32);
      }
    }
  }

  id v33 = a1[5];
  [a1[4] volume];
  int v35 = v34;
  v105[0] = _NSConcreteStackBlock;
  v105[1] = 3221225472LL;
  v105[2] = sub_1000145C0;
  v105[3] = &unk_100020630;
  id v106 = a1[6];
  LODWORD(v36) = v35;
  [v33 setupVolumeObserverForVolume:v105 completion:v36];
  if (([a1[5] createAudioEngineAndPulseToneHandlerFor:a1[4]] & 1) == 0)
  {
    if (qword_1000260B8 != -1) {
      dispatch_once(&qword_1000260B8, &stru_1000204D0);
    }
    v37 = (os_log_s *) (id) qword_1000260E8;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "AVAudioDeviceTestService.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 937;
      _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "%25s:%-5d Failed to create pulse tone handler",  buf,  0x12u);
    }

    v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.avfaudio.devicetest.service",  -10LL,  0LL));
    (*((void (**)(void))a1[6] + 2))();
  }

  v39 = (void *)objc_claimAutoreleasedReturnValue([a1[5] hearingTestSession]);
  BOOL v40 = v39 == 0LL;

  if (v40)
  {
    if (qword_1000260B8 != -1) {
      dispatch_once(&qword_1000260B8, &stru_1000204D0);
    }
    v41 = (os_log_s *) (id) qword_1000260E8;
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "AVAudioDeviceTestService.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 943;
      _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "%25s:%-5d No session already created.",  buf,  0x12u);
    }

    v102[0] = _NSConcreteStackBlock;
    v102[1] = 3221225472LL;
    v102[2] = sub_10001461C;
    v102[3] = &unk_100020658;
    id v42 = a1[6];
    id v103 = a1[5];
    id v104 = v42;
    [v103 setupObservers:v102];
  }

  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  *(void *)&buf[24] = sub_100014748;
  *(void *)&buf[32] = sub_100014758;
  id v121 = [*(id *)(*((void *)a1[5] + 1) + 16) copy];
  id v44 = a1[4];
  id v43 = a1[5];
  v101[0] = _NSConcreteStackBlock;
  v101[1] = 3221225472LL;
  v101[2] = sub_100014760;
  v101[3] = &unk_100020680;
  v101[4] = v43;
  [v43 setupAudioEngineFor:v44 sourceNodeBlock:v101];
  id v45 = a1[5];
  v46 = (void *)objc_claimAutoreleasedReturnValue([a1[4] micBufferNumbers]);
  id v47 = [v46 count];
  if (v47) {
    v48 = (void *)objc_claimAutoreleasedReturnValue([a1[4] micBufferNumbers]);
  }
  else {
    v48 = 0LL;
  }
  v99[0] = _NSConcreteStackBlock;
  v99[1] = 3221225472LL;
  v99[2] = sub_100014918;
  v99[3] = &unk_100020630;
  id v100 = a1[6];
  [v45 setupMultiChannelMixerForOutputChannel:v48 completion:v99];
  if (v47) {

  }
  v49 = sub_100013128();
  v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
  uint64_t v51 = sub_100013194();
  if ((unint64_t)(v51 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v52 = v51;
    if (os_signpost_enabled(v50))
    {
      [a1[4] frequency];
      v54 = v53;
      [a1[4] soundLevel];
      *(_DWORD *)v112 = 134218240;
      v113 = v54;
      __int16 v114 = 2048;
      *(void *)v115 = v55;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v50,  OS_SIGNPOST_INTERVAL_BEGIN,  v52,  "AVF tone playback",  "freq=%f, lvl=%f",  v112,  0x16u);
    }
  }

  v56 = (void *)objc_claimAutoreleasedReturnValue([a1[5] engine]);
  [v56 prepare];

  if ([a1[5] isMixerOutputEnabled])
  {
    v57 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  @"/tmp/multichannel_mixer_out.caf"));
    v58 = objc_alloc(&OBJC_CLASS___AVAudioFile);
    v59 = (void *)objc_claimAutoreleasedReturnValue([a1[5] engine]);
    uint64_t v60 = (void *)objc_claimAutoreleasedReturnValue([v59 outputNode]);
    v61 = (void *)objc_claimAutoreleasedReturnValue([v60 outputFormatForBus:0]);
    v62 = (void *)objc_claimAutoreleasedReturnValue([v61 settings]);
    id v98 = 0LL;
    v63 = -[AVAudioFile initForWriting:settings:error:](v58, "initForWriting:settings:error:", v57, v62, &v98);
    id v64 = v98;

    if (v64) {
      (*((void (**)(void))a1[6] + 2))();
    }
    uint64_t v65 = (void *)objc_claimAutoreleasedReturnValue([a1[5] multichannelMixer]);
    v66 = (void *)objc_claimAutoreleasedReturnValue([a1[5] multichannelMixer]);
    id v67 = (void *)objc_claimAutoreleasedReturnValue([v66 outputFormatForBus:0]);
    v96[0] = _NSConcreteStackBlock;
    v96[1] = 3221225472LL;
    v96[2] = sub_100014974;
    v96[3] = &unk_1000206A8;
    v68 = v63;
    v97 = v68;
    [v65 installTapOnBus:0 bufferSize:1024 format:v67 block:v96];
  }

  else
  {
    id v64 = 0LL;
  }

  id v69 = (void *)objc_claimAutoreleasedReturnValue([a1[5] engine]);
  id v95 = v64;
  unsigned __int8 v70 = [v69 startAndReturnError:&v95];
  id v71 = v95;

  if ((v70 & 1) == 0)
  {
    if (qword_1000260B8 != -1) {
      dispatch_once(&qword_1000260B8, &stru_1000204D0);
    }
    v82 = (os_log_s *) (id) qword_1000260E8;
    if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
    {
      v83 = (void *)objc_claimAutoreleasedReturnValue([v71 localizedDescription]);
      id v84 = sub_100011968(-10LL);
      v85 = (void *)objc_claimAutoreleasedReturnValue(v84);
      double v86 = COERCE_DOUBLE([v85 code]);
      *(_DWORD *)v112 = 136315906;
      v113 = "AVAudioDeviceTestService.mm";
      __int16 v114 = 1024;
      *(_DWORD *)v115 = 990;
      *(_WORD *)&v115[4] = 2112;
      *(void *)&v115[6] = v83;
      __int16 v116 = 2048;
      double v117 = v86;
      _os_log_impl( (void *)&_mh_execute_header,  v82,  OS_LOG_TYPE_ERROR,  "%25s:%-5d startAndReturnError (%@) with test error (%li)",  v112,  0x26u);
    }

    v87 = (void (**)(id, void, void *))a1[6];
    id v88 = sub_100011968(-10LL);
    v89 = (void *)objc_claimAutoreleasedReturnValue(v88);
    v87[2](v87, 0LL, v89);

    exit(-1);
  }

  if (qword_1000260B8 != -1) {
    dispatch_once(&qword_1000260B8, &stru_1000204D0);
  }
  uint64_t v72 = (os_log_s *) (id) qword_1000260E8;
  if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
  {
    [a1[4] frequency];
    uint64_t v74 = v73;
    [a1[4] volume];
    float v76 = v75;
    [a1[4] duration];
    *(_DWORD *)v112 = 136316162;
    v113 = "AVAudioDeviceTestService.mm";
    __int16 v114 = 1024;
    *(_DWORD *)v115 = 995;
    *(_WORD *)&v115[4] = 2048;
    *(void *)&v115[6] = v74;
    __int16 v116 = 2048;
    double v117 = v76;
    __int16 v118 = 2048;
    uint64_t v119 = v77;
    _os_log_impl( (void *)&_mh_execute_header,  v72,  OS_LOG_TYPE_DEFAULT,  "%25s:%-5d [AVAT Server] Started playing back tone. { frequency=%f, volume=%f, duration=%f }",  v112,  0x30u);
  }

  [a1[4] duration];
  dispatch_time_t v79 = dispatch_time(0LL, (uint64_t)(v78 * 1000000000.0));
  v80 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([a1[5] toneQueue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100014A50;
  block[3] = &unk_1000206D0;
  int8x16_t v90 = *((int8x16_t *)a1 + 2);
  id v81 = (id)v90.i64[0];
  int8x16_t v92 = vextq_s8(v90, v90, 8uLL);
  v94 = buf;
  id v93 = a1[6];
  dispatch_after(v79, v80, block);

  _Block_object_dispose(buf, 8);
}

void sub_1000142D4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, void *a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, void *a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,void *a58)
{
  _Block_object_dispose((const void *)(v63 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_100014508(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }
}

void sub_100014550( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_100014564(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }
}

void sub_1000145AC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_1000145C0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }
}

void sub_100014608( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_10001461C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (qword_1000260B8 != -1) {
      dispatch_once(&qword_1000260B8, &stru_1000204D0);
    }
    uint64_t v4 = (os_log_s *) (id) qword_1000260E8;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315394;
      float v6 = "AVAudioDeviceTestService.mm";
      __int16 v7 = 1024;
      int v8 = 946;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%25s:%-5d Interruption detected, resetting observers.",  (uint8_t *)&v5,  0x12u);
    }

    [*(id *)(a1 + 32) cleanUpObservers];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }
}

void sub_100014730(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100014748(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100014758(uint64_t a1)
{
}

uint64_t sub_100014760(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, unsigned int *a5)
{
  int v5 = *(unsigned __int8 **)(*(void *)(a1 + 32) + 8LL);
  if (v5 && a4)
  {
    uint64_t v6 = 0LL;
    __int16 v7 = a5 + 4;
    uint64_t v8 = *a5;
    uint64_t v9 = *((void *)v5 + 5);
    int v10 = *((_DWORD *)v5 + 12);
    int v11 = v5[80];
    uint64_t v12 = a4;
    double v13 = *((double *)v5 + 3) / *((double *)v5 + 9);
    while (1)
    {
      ++v9;
      int v14 = v10 + 1;
      double v15 = 0.0;
      if (!v11)
      {
        int v20 = *((_DWORD *)v5 + 13);
        if (v20)
        {
          if (v10 < 0)
          {
            int v11 = *v5;
            v5[80] = v11;
          }

          else
          {
            double v21 = sin((v13 * (double)v9 + v13 * (double)v9) * 3.14159265) * *((double *)v5 + 4);
            int v22 = *((_DWORD *)v5 + 14);
            if (v10 >= v22)
            {
              int v25 = *((_DWORD *)v5 + 15);
              if (!v25 && !*v5)
              {
                int v11 = 0;
                int v10 = *((_DWORD *)v5 + 14);
                goto LABEL_26;
              }

              double v26 = *((double *)v5 + 8);
              double v27 = v26 + (double)v22;
              if (v27 <= (double)v14)
              {
                int v10 = (int)-((double)v25 - v26);
                *((_DWORD *)v5 + 13) = (v20 & ~(v20 >> 31)) - 1;
                int v11 = *v5;
                v5[80] = v11;
                goto LABEL_6;
              }

              int v11 = 0;
              double v24 = (v27 - (double)v14) / v26;
            }

            else
            {
              double v23 = *((double *)v5 + 8);
              int v11 = 0;
              if (v23 <= (double)v14)
              {
                ++v10;
LABEL_26:
                double v15 = v21;
                goto LABEL_6;
              }

              double v24 = (double)v14 / v23;
            }

            double v15 = v21 * v24;
          }
        }

        else
        {
          int v11 = 0;
        }
      }

      ++v10;
LABEL_6:
      if ((_DWORD)v8)
      {
        int v17 = v7;
        uint64_t v18 = v8;
        do
        {
          uint64_t v19 = *(void *)v17;
          v17 += 4;
          float v16 = v15;
          *(float *)(v19 + 4 * v6) = v16;
          --v18;
        }

        while (v18);
      }

      if (++v6 == v12)
      {
        *((void *)v5 + 5) = v9;
        *((_DWORD *)v5 + 12) = v10;
        return 0LL;
      }
    }
  }

  return 0LL;
}

void sub_100014918(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }
}

void sub_100014960( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_100014974(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  __int16 v7 = *(void **)(a1 + 32);
  id v9 = 0LL;
  unsigned __int8 v8 = [v7 writeFromBuffer:v5 error:&v9];
  if (v9) {
    __assert_rtn( "-[AVAudioDeviceTestService playbackTone:completion:]_block_invoke",  "AVAudioDeviceTestService.mm",  984,  "err == nil");
  }
  if ((v8 & 1) == 0) {
    __assert_rtn( "-[AVAudioDeviceTestService playbackTone:completion:]_block_invoke",  "AVAudioDeviceTestService.mm",  985,  "didWrite");
  }
}

void sub_100014A38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100014A50(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8LL);
  if (!v2)
  {
    if (qword_1000260B8 != -1) {
      dispatch_once(&qword_1000260B8, &stru_1000204D0);
    }
    int v11 = (os_log_s *) (id) qword_1000260E8;
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_21;
    }
    [*(id *)(a1 + 40) frequency];
    uint64_t v15 = v14;
    [*(id *)(a1 + 40) volume];
    float v17 = v16;
    [*(id *)(a1 + 40) duration];
    *(_DWORD *)v32 = 136316162;
    *(void *)&v32[4] = "AVAudioDeviceTestService.mm";
    *(_WORD *)&v32[12] = 1024;
    *(_DWORD *)&v32[14] = 999;
    *(_WORD *)&v32[18] = 2048;
    *(void *)&v32[20] = v15;
    *(_WORD *)&v32[28] = 2048;
    *(double *)&v32[30] = v17;
    *(_WORD *)&v32[38] = 2048;
    uint64_t v33 = v18;
    uint64_t v19 = "%25s:%-5d [AVAT Server] Duration timer called, tone has already been stopped, pulse tone handler is nil { freq"
          "uency=%f, volume=%f, duration=%f }";
    int v20 = v11;
    uint32_t v21 = 48;
LABEL_20:
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, v19, v32, v21);
LABEL_21:

    goto LABEL_22;
  }

  if (([*(id *)(v2 + 16) isEqualToString:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)] & 1) == 0)
  {
    if (qword_1000260B8 != -1) {
      dispatch_once(&qword_1000260B8, &stru_1000204D0);
    }
    int v11 = (os_log_s *) (id) qword_1000260E8;
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_21;
    }
    [*(id *)(a1 + 40) frequency];
    uint64_t v23 = v22;
    [*(id *)(a1 + 40) volume];
    float v25 = v24;
    [*(id *)(a1 + 40) duration];
    uint64_t v26 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
    uint64_t v27 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 16LL);
    *(_DWORD *)v32 = 136316674;
    *(void *)&v32[4] = "AVAudioDeviceTestService.mm";
    *(_WORD *)&v32[12] = 1024;
    *(_DWORD *)&v32[14] = 1001;
    *(_WORD *)&v32[18] = 2048;
    *(void *)&v32[20] = v23;
    *(_WORD *)&v32[28] = 2048;
    *(double *)&v32[30] = v25;
    *(_WORD *)&v32[38] = 2048;
    uint64_t v33 = v28;
    *(_WORD *)int v34 = 2112;
    *(void *)&v34[2] = v26;
    *(_WORD *)&v34[10] = 2112;
    *(void *)&v34[12] = v27;
    uint64_t v19 = "%25s:%-5d [AVAT Server] Duration timer called, tone has already been stopped, pulse tone IDs do not match. { f"
          "requency=%f, volume=%f, duration=%f, pulseToneID=%@, currID=%@ }";
    int v20 = v11;
    uint32_t v21 = 68;
    goto LABEL_20;
  }

  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8LL);
  if (v3
    && [*(id *)(v3 + 16) isEqualToString:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)])
  {
    if (qword_1000260B8 != -1) {
      dispatch_once(&qword_1000260B8, &stru_1000204D0);
    }
    uint64_t v4 = (os_log_s *) (id) qword_1000260E8;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      [*(id *)(a1 + 40) frequency];
      uint64_t v6 = v5;
      [*(id *)(a1 + 40) volume];
      float v8 = v7;
      [*(id *)(a1 + 40) duration];
      *(_DWORD *)v32 = 136316162;
      *(void *)&v32[4] = "AVAudioDeviceTestService.mm";
      *(_WORD *)&v32[12] = 1024;
      *(_DWORD *)&v32[14] = 1003;
      *(_WORD *)&v32[18] = 2048;
      *(void *)&v32[20] = v6;
      *(_WORD *)&v32[28] = 2048;
      *(double *)&v32[30] = v8;
      *(_WORD *)&v32[38] = 2048;
      uint64_t v33 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%25s:%-5d [AVAT Server] Duration timer called, stopping tone. { frequency=%f, volume=%f, duration=%f }",  v32,  0x30u);
    }

    **(_BYTE **)(*(void *)(a1 + 32) + 8LL) = 1;
    +[NSThread sleepForTimeInterval:]( &OBJC_CLASS___NSThread,  "sleepForTimeInterval:",  *(double *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 8LL));
    [*(id *)(a1 + 32) cleanUp];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
    int v10 = sub_100013128();
    int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    uint64_t v12 = sub_100013194();
    if ((unint64_t)(v12 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v13 = v12;
      if (os_signpost_enabled(v11))
      {
        *(_WORD *)v32 = 0;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v11,  OS_SIGNPOST_INTERVAL_END,  v13,  "AVF tone playback",  "duration timer",  v32,  2u);
      }
    }

    goto LABEL_21;
  }

LABEL_22:
  float v29 = *(void **)(a1 + 32);
  int v30 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v29,  "userVolumeBeforeHearingTest",  *(_OWORD *)v32,  *(_OWORD *)&v32[16],  *(void *)&v32[32],  v33,  *(_OWORD *)v34,  *(void *)&v34[16]));
  [v30 floatValue];
  objc_msgSend(v29, "resetVolume:");

  return [*(id *)(a1 + 32) removeSystemVolumeObserver];
}

void sub_100014E8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100014EB8(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:AVAudioSessionRouteChangeReasonKey]);
  id v6 = [v5 unsignedIntegerValue];

  float v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stringForRouteChangeReason:v6]);
  if (qword_1000260B8 != -1) {
    dispatch_once(&qword_1000260B8, &stru_1000204D0);
  }
  float v8 = (os_log_s *) (id) qword_1000260E8;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315650;
    int v10 = "AVAudioDeviceTestService.mm";
    __int16 v11 = 1024;
    int v12 = 553;
    __int16 v13 = 2112;
    uint64_t v14 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%25s:%-5d route change (%@)",  (uint8_t *)&v9,  0x1Cu);
  }
}

void sub_10001500C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100015040(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (qword_1000260B8 != -1) {
    dispatch_once(&qword_1000260B8, &stru_1000204D0);
  }
  uint64_t v4 = (os_log_s *) (id) qword_1000260E8;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 object]);
    id v6 = sub_100011968(-3LL);
    float v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    int v11 = 136315906;
    int v12 = "AVAudioDeviceTestService.mm";
    __int16 v13 = 1024;
    int v14 = 561;
    __int16 v15 = 2112;
    float v16 = v5;
    __int16 v17 = 2048;
    id v18 = [v7 code];
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%25s:%-5d interruption (%@) with test error (%li)",  (uint8_t *)&v11,  0x26u);
  }

  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = sub_100011968(-3LL);
  int v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0LL, v10);

  exit(-3);
}

void sub_10001518C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000151D4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (qword_1000260B8 != -1) {
    dispatch_once(&qword_1000260B8, &stru_1000204D0);
  }
  uint64_t v4 = (os_log_s *) (id) qword_1000260E8;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 object]);
    id v6 = sub_100011968(-4LL);
    float v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    int v11 = 136315906;
    int v12 = "AVAudioDeviceTestService.mm";
    __int16 v13 = 1024;
    int v14 = 571;
    __int16 v15 = 2112;
    float v16 = v5;
    __int16 v17 = 2048;
    id v18 = [v7 code];
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%25s:%-5d mediaserverd died (%@) with test error (%li)",  (uint8_t *)&v11,  0x26u);
  }

  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = sub_100011968(-4LL);
  int v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0LL, v10);

  exit(-4);
}

void sub_100015320(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100015368(uint64_t a1, uint64_t a2, void *a3)
{
  *a3 = 0LL;
  return *(id *)(a1 + 32);
}

void sub_100015374(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (qword_1000260B8 != -1) {
    dispatch_once(&qword_1000260B8, &stru_1000204D0);
  }
  float v7 = (os_log_s *) (id) qword_1000260E8;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 averagePowerPerChannel]);
    int v16 = 136315650;
    __int16 v17 = "AVAudioDeviceTestService.mm";
    __int16 v18 = 1024;
    int v19 = 655;
    __int16 v20 = 2112;
    id v21 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%25s:%-5d collecting input tap data %@",  (uint8_t *)&v16,  0x1Cu);
  }

  if (([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) appendDataFromBuffer:v5] & 1) == 0)
  {
    if (qword_1000260B8 != -1) {
      dispatch_once(&qword_1000260B8, &stru_1000204D0);
    }
    id v9 = (os_log_s *) (id) qword_1000260E8;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = sub_100011968(-10LL);
      int v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      id v12 = [v11 code];
      int v16 = 136315650;
      __int16 v17 = "AVAudioDeviceTestService.mm";
      __int16 v18 = 1024;
      int v19 = 658;
      __int16 v20 = 2048;
      id v21 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%25s:%-5d failed to read in from buffer - test error %li",  (uint8_t *)&v16,  0x1Cu);
    }

    uint64_t v13 = *(void *)(a1 + 40);
    id v14 = sub_100011968(-10LL);
    __int16 v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    (*(void (**)(uint64_t, void, void *))(v13 + 16))(v13, 0LL, v15);
  }
}

void sub_1000155DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100015628(uint64_t a1)
{
  if (qword_1000260B8 != -1) {
    dispatch_once(&qword_1000260B8, &stru_1000204D0);
  }
  uint64_t v2 = (os_log_s *) (id) qword_1000260E8;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "AVAudioDeviceTestService.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 771;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%25s:%-5d processing xcorr", buf, 0x12u);
  }

  group = dispatch_group_create();
  dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_qos_class(&_dispatch_queue_attr_concurrent, QOS_CLASS_USER_INTERACTIVE, -1);
  uint64_t v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v23 = dispatch_queue_create("com.apple.avfaudio.xcorr_queue", v4);

  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) splitIntoSingleChannelBuffers]);
  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  BOOL v40 = sub_100014748;
  v41 = sub_100014758;
  id v42 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  obunint64_t j = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) micBufferNumbers]);
  if (!v5
    || (id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "micBufferNumbers", v23, group)),
        BOOL v7 = [v6 count] == 0,
        v6,
        v5,
        v7))
  {
    for (unint64_t i = 0; (unint64_t)objc_msgSend(v27, "count", v23) > i; ++i)
    {
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", i));
      -[NSMutableArray addObject:](obj, "addObject:", v22);
    }
  }

  else
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) micBufferNumbers]);
    id v9 = (NSMutableArray *)[v8 copy];

    obunint64_t j = v9;
  }

  for (unint64_t j = 0LL; (unint64_t)-[NSMutableArray count](obj, "count") > j; ++j)
  {
    int v11 = *(void **)(*(void *)&buf[8] + 40LL);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    [v11 addObject:v12];
  }

  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  obja = obj;
  id v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obja,  "countByEnumeratingWithState:objects:count:",  &v34,  v38,  16LL);
  if (v13)
  {
    uint64_t v14 = *(void *)v35;
    do
    {
      for (k = 0LL; k != v13; k = (char *)k + 1)
      {
        if (*(void *)v35 != v14) {
          objc_enumerationMutation(obja);
        }
        uint64_t v16 = *(void *)(*((void *)&v34 + 1) + 8LL * (void)k);
        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472LL;
        v28[2] = sub_100015B38;
        v28[3] = &unk_1000205E0;
        v28[4] = v16;
        id v29 = v27;
        id v17 = *(id *)(a1 + 32);
        uint64_t v18 = *(void *)(a1 + 40);
        int v19 = *(void **)(a1 + 48);
        id v30 = v17;
        uint64_t v31 = v18;
        id v32 = v19;
        uint64_t v33 = buf;
        __int16 v20 = objc_retainBlock(v28);
        else {
          ((void (*)(void *))v20[2])(v20);
        }
      }

      id v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obja,  "countByEnumeratingWithState:objects:count:",  &v34,  v38,  16LL);
    }

    while (v13);
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
  _Block_object_dispose(buf, 8);
}

void sub_100015A58( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12)
{
  _Block_object_dispose((const void *)(v13 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_100015B38(uint64_t a1)
{
  uint64_t v2 = (int)[*(id *)(a1 + 32) intValue];
  dispatch_queue_attr_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectAtIndex:v2]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( NSData,  "dataWithBytes:length:",  *((void *)[v3 audioBufferList] + 2),  *((unsigned int *)objc_msgSend(v3, "audioBufferList") + 3)));
  if ([*(id *)(a1 + 48) calculateCrossCorrelationPeak])
  {
    [*(id *)(a1 + 56) calculateCrossCorrelationPeakRelativeToSource:*(void *)(a1 + 64) capture:v3];
    uint64_t v6 = v5;
    if (qword_1000260B8 != -1) {
      dispatch_once(&qword_1000260B8, &stru_1000204D0);
    }
    BOOL v7 = (os_log_s *) (id) qword_1000260E8;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315650;
      uint64_t v14 = "AVAudioDeviceTestService.mm";
      __int16 v15 = 1024;
      int v16 = 802;
      __int16 v17 = 2048;
      uint64_t v18 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d db %f", (uint8_t *)&v13, 0x1Cu);
    }
  }

  uint64_t v8 = objc_alloc(&OBJC_CLASS___AVAudioDeviceTestResult);
  id v9 = [*(id *)(a1 + 48) outputID];
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v3 format]);
  [v10 sampleRate];
  int v11 = -[AVAudioDeviceTestResult initWithData:inputID:outputID:sampleRate:correlationValue:]( v8,  "initWithData:inputID:outputID:sampleRate:correlationValue:",  v4,  v2,  v9);

  id v12 = *(id *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL);
  objc_sync_enter(v12);
  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setObject:v11 atIndexedSubscript:v2];
  objc_sync_exit(v12);
}

void sub_100015D50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100015D9C(id a1)
{
  if (qword_1000260B8 != -1) {
    dispatch_once(&qword_1000260B8, &stru_1000204D0);
  }
  uint64_t v1 = (os_log_s *) (id) qword_1000260E8;
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = 136315394;
    dispatch_queue_attr_t v3 = "AVAudioDeviceTestService.mm";
    __int16 v4 = 1024;
    int v5 = 715;
    _os_log_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_DEFAULT,  "%25s:%-5d player finished",  (uint8_t *)&v2,  0x12u);
  }

void sub_100015E78(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (qword_1000260B8 != -1) {
      dispatch_once(&qword_1000260B8, &stru_1000204D0);
    }
    BOOL v7 = (os_log_s *) (id) qword_1000260E8;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 localizedDescription]);
      int v11 = 136315650;
      id v12 = "AVAudioDeviceTestService.mm";
      __int16 v13 = 1024;
      int v14 = 262;
      __int16 v15 = 2112;
      int v16 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%25s:%-5d Error instantiating AVAudioUnit: %@",  (uint8_t *)&v11,  0x1Cu);
    }
  }

  else
  {
    [*(id *)(a1 + 40) setMultichannelMixer:v5];
    id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) engine]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) multichannelMixer]);
    [v9 attachNode:v10];
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100016000(_Unwind_Exception *a1)
{
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v3 + 32));
  _Unwind_Resume(a1);
}

void sub_1000160F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
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

id objc_msgSend_writeFromBuffer_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeFromBuffer:error:");
}