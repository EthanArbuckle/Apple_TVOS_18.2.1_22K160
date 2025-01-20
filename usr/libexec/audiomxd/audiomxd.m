void sub_10000307C(std::exception *a1)
{
  void *v1;
  std::exception::~exception(a1);
  operator delete(v1);
}

const char *sub_100003090()
{
  return "CAException";
}

void sub_1000030A0(uint64_t a1)
{
  v1 = (void *)sub_1000030F0(a1);
  operator delete(v1);
}

void sub_1000030B8(uint64_t a1)
{
  v1 = (void *)sub_1000030F0(a1);
  operator delete(v1);
}

uint64_t sub_1000030CC(uint64_t result)
{
  *(_BYTE *)(result + 8) = 1;
  return result;
}

uint64_t sub_1000030D8(uint64_t result)
{
  *(_BYTE *)(result + 8) = 0;
  return result;
}

uint64_t sub_1000030E0()
{
  return 0LL;
}

uint64_t sub_1000030E8()
{
  return 0LL;
}

uint64_t sub_1000030F0(uint64_t result)
{
  *(void *)result = &off_100008598;
  if (*(_BYTE *)(result + 8))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      int v1 = 136315394;
      v2 = "CAD_SubServer.cpp";
      __int16 v3 = 1024;
      int v4 = 36;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "%25s:%-5d  CAD_SubServer::~CAD_SubServer: still running at destruction",  (uint8_t *)&v1,  0x12u);
    }

    __break(1u);
  }

  return result;
}

void sub_1000031B0(id a1)
{
  qword_10000C038 = (uint64_t)os_log_create("com.apple.coreaudio.mediaserverd", "service");
}

uint64_t start()
{
  v0 = -[NSString UTF8String]( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@AudioCapture",  NSTemporaryDirectory()),  "UTF8String");
  memset(&__to, 0, sizeof(__to));
  int v1 = (std::string *)((char *)v0 - 1);
  do
  {
    int v2 = v1->__r_.__value_.__s.__data_[1];
    int v1 = (std::string *)((char *)v1 + 1);
  }

  while (v2);
  sub_100004C90(&__to.__pn_, v0, v1);
  memset(&__new_symlink, 0, sizeof(__new_symlink));
  sub_100004C90(&__new_symlink.__pn_, (std::string *)"/var/tmp/AudioCapture", (std::string *)"");
  __ec.__val_ = 0;
  __ec.__cat_ = std::system_category();
  std::__fs::filesystem::__create_directory_symlink(&__to, &__new_symlink, &__ec);
  if (__ec.__val_)
  {
    if (__ec.__val_ != 17)
    {
      int v4 = (os_log_s *)CADefaultLog(v3);
      v5 = v4;
      if (v4)
      {
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          p_to = &__to;
          if ((__to.__pn_.__r_.__value_.__s.__size_ & 0x80u) != 0) {
            p_to = (std::__fs::filesystem::path *)__to.__pn_.__r_.__value_.__r.__words[0];
          }
          *(_DWORD *)buf = 136315906;
          *(void *)&buf[4] = "mediaserverd.mm";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 204;
          *(_WORD *)&buf[18] = 2080;
          *(void *)&buf[20] = p_to;
          *(_WORD *)&buf[28] = 1024;
          *(_DWORD *)&buf[30] = __ec.__val_;
          _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%25s:%-5d Error creating symlink to %s. Code:%d",  buf,  0x22u);
        }
      }
    }
  }

  BOOL v7 = std::__fs::filesystem::__create_directory(&__to, &__ec);
  if (__ec.__val_)
  {
    if (__ec.__val_ != 17)
    {
      v8 = (os_log_s *)CADefaultLog(v7);
      v9 = v8;
      if (v8)
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v10 = &__to;
          if ((__to.__pn_.__r_.__value_.__s.__size_ & 0x80u) != 0) {
            v10 = (std::__fs::filesystem::path *)__to.__pn_.__r_.__value_.__r.__words[0];
          }
          *(_DWORD *)buf = 136315906;
          *(void *)&buf[4] = "mediaserverd.mm";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 208;
          *(_WORD *)&buf[18] = 2080;
          *(void *)&buf[20] = v10;
          *(_WORD *)&buf[28] = 1024;
          *(_DWORD *)&buf[30] = __ec.__val_;
          _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%25s:%-5d Error creating %s path. Code:%d",  buf,  0x22u);
        }
      }
    }
  }

  setiopolicy_np(9, 0, 1);
  if (qword_10000C040 != -1) {
    dispatch_once(&qword_10000C040, &stru_1000085E8);
  }
  os_signpost_id_t v11 = os_signpost_id_generate((os_log_t)qword_10000C038);
  if (qword_10000C040 != -1) {
    dispatch_once(&qword_10000C040, &stru_1000085E8);
  }
  unint64_t v121 = v11 - 1;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v12 = (os_log_s *)qword_10000C038;
    if (os_signpost_enabled((os_log_t)qword_10000C038))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v12,  OS_SIGNPOST_INTERVAL_BEGIN,  v11,  "mediaserverdSubServerCreationTime",  " enableTelemetry=YES ",  buf,  2u);
      if (qword_10000C040 != -1) {
        dispatch_once(&qword_10000C040, &stru_1000085E8);
      }
    }

    v13 = (os_log_s *)qword_10000C038;
    if (os_signpost_enabled((os_log_t)qword_10000C038))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v13,  OS_SIGNPOST_INTERVAL_BEGIN,  v11,  "mediaserverdStartTime",  " enableTelemetry=YES ",  buf,  2u);
    }
  }

  int v117 = pthread_set_fixedpriority_self();
  v14 = pthread_self();
  if (pthread_get_qos_class_np(v14, &__qos_class, &__relative_priority)) {
    BOOL v15 = 0;
  }
  else {
    BOOL v15 = pthread_set_qos_class_self_np(QOS_CLASS_USER_INITIATED, 0) == 0;
  }
  v16 = getprogname();
  openlog(v16, 40, 24);
  uint64_t v17 = getpid();
  proc_disable_wakemon(v17);
  wd_endpoint_register("com.apple.audiomxd.watchdog");
  out_token[0] = 0;
  uint64_t v18 = notify_register_dispatch("com.apple.language.changed", out_token, &_dispatch_main_q, &stru_100008648);
  int v19 = v18;
  if ((_DWORD)v18)
  {
    v20 = (os_log_s *)CADefaultLog(v18);
    v21 = v20;
    if (v20)
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)&buf[4] = "mediaserverd.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 148;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = v19;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "%25s:%-5d Could not register for language change notification, err = %u",  buf,  0x18u);
      }
    }
  }

  qword_10000C030 = (uint64_t)CFRunLoopGetCurrent();
  queue = dispatch_queue_create("com.apple.coreaudio.mediaserverd.cleanup", 0LL);
  context = objc_autoreleasePoolPush();
  signal(15, (void (__cdecl *)(int))1);
  signal(1, (void (__cdecl *)(int))1);
  signal(13, (void (__cdecl *)(int))1);
  v22 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0LL, queue);
  if (!v22) {
    __assert_rtn("main", "mediaserverd.mm", 258, "gSTS_TERM != NULL");
  }
  v23 = v22;
  dispatch_source_set_event_handler(v22, &stru_100008608);
  source = (dispatch_source_s *)v23;
  dispatch_resume(v23);
  __p = operator new(0x18uLL);
  void *__p = 0LL;
  __p[1] = 0LL;
  __p[2] = 0LL;
  if (qword_10000C040 != -1) {
    dispatch_once(&qword_10000C040, &stru_1000085E8);
  }
  if (v121 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v24 = (os_log_s *)qword_10000C038;
    if (os_signpost_enabled((os_log_t)qword_10000C038))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v24,  OS_SIGNPOST_INTERVAL_BEGIN,  v11,  "AQSubServerInitTime",  " enableTelemetry=YES ",  buf,  2u);
    }
  }

  v25 = operator new(0x10uLL);
  v25[8] = 0;
  v119 = v25;
  *(void *)v25 = &off_100008678;
  if (qword_10000C040 != -1) {
    dispatch_once(&qword_10000C040, &stru_1000085E8);
  }
  if (v121 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v26 = (os_log_s *)qword_10000C038;
    if (os_signpost_enabled((os_log_t)qword_10000C038))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v26,  OS_SIGNPOST_INTERVAL_END,  v11,  "AQSubServerInitTime",  (const char *)&unk_1000078E7,  buf,  2u);
    }
  }

  BOOL v115 = v15;
  v27 = sub_100004808(1uLL);
  uint64_t v29 = v28;
  v30 = (char *)&v27[v28];
  void *v27 = v119;
  void *__p = v27;
  __p[1] = v27 + 1;
  __p[2] = v30;
  if (qword_10000C040 != -1) {
    dispatch_once(&qword_10000C040, &stru_1000085E8);
  }
  if (v121 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v31 = (os_log_s *)qword_10000C038;
    if (os_signpost_enabled((os_log_t)qword_10000C038))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v31,  OS_SIGNPOST_INTERVAL_BEGIN,  v11,  "FigSubServerInitTime",  " enableTelemetry=YES ",  buf,  2u);
    }
  }

  v32 = operator new(0x10uLL);
  v32[8] = 0;
  *(void *)v32 = &off_100008558;
  MXInitialize();
  if (qword_10000C040 != -1) {
    dispatch_once(&qword_10000C040, &stru_1000085E8);
  }
  if (v121 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v33 = (os_log_s *)qword_10000C038;
    if (os_signpost_enabled((os_log_t)qword_10000C038))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v33,  OS_SIGNPOST_INTERVAL_END,  v11,  "FigSubServerInitTime",  (const char *)&unk_1000078E7,  buf,  2u);
    }
  }

  if (v29 < 2)
  {
    uint64_t v36 = 2LL;
    else {
      unint64_t v37 = v36;
    }
    v35 = &selRef_UTF8String;
    if (v37) {
      unint64_t v37 = (unint64_t)sub_100004808(v37);
    }
    else {
      uint64_t v38 = 0LL;
    }
    uint64_t v39 = 0LL;
    unint64_t v40 = v37 + 8;
    unint64_t v41 = v37 + 8 * v38;
    *(void *)(v37 + 8) = v32;
    v34 = (void *)(v37 + 16);
    do
    {
      *(void *)(v37 + v39 * 8) = v27[v39];
      --v39;
    }

    while (v39 != -1);
    v27 = (void *)v37;
    v42 = (void *)*__p;
    void *__p = v40 - 8;
    __p[1] = v34;
    __p[2] = v41;
    if (v42)
    {
      operator delete(v42);
      v27 = (void *)*__p;
    }

    __p[1] = v34;
    if (v27 == v34) {
      goto LABEL_82;
    }
  }

  else
  {
    v27[1] = v32;
    v34 = v27 + 2;
    __p[1] = v27 + 2;
    v35 = &selRef_UTF8String;
  }

  do
  {
    if (*v27)
    {
      v43 = (const __CFArray *)(*(uint64_t (**)(void))(*(void *)*v27 + 32LL))(*v27);
      *(void *)buf = v43;
      *(_WORD *)&buf[8] = 0;
      if (v43)
      {
        unsigned int v44 = 0;
LABEL_78:
        LODWORD(v43) = CFArrayGetCount(v43);
        while (v44 < v43)
        {
          *(void *)out_token = 0LL;
          ++v44;
          v43 = *(const __CFArray **)buf;
          if (*(void *)buf) {
            goto LABEL_78;
          }
        }
      }

      sub_10000483C((uint64_t)buf);
    }

    ++v27;
  }

  while (v27 != v34);
LABEL_82:
  if (v121 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v45 = (os_log_s *)qword_10000C038;
    if (os_signpost_enabled((os_log_t)qword_10000C038))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v45,  OS_SIGNPOST_INTERVAL_END,  v11,  "mediaserverdSubServerCreationTime",  (const char *)&unk_1000078E7,  buf,  2u);
    }

    v46 = (os_log_s *)qword_10000C038;
    if (os_signpost_enabled((os_log_t)qword_10000C038))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v46,  OS_SIGNPOST_INTERVAL_BEGIN,  v11,  "FIGSubServerStartTime",  " enableTelemetry=YES ",  buf,  2u);
    }
  }

  (*(void (**)(_BYTE *))(*(void *)v32 + 16LL))(v32);
  if (v121 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v47 = (os_log_s *)qword_10000C038;
    if (os_signpost_enabled((os_log_t)qword_10000C038))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v47,  OS_SIGNPOST_INTERVAL_END,  v11,  "FIGSubServerStartTime",  (const char *)&unk_1000078E7,  buf,  2u);
    }

    v48 = (os_log_s *)qword_10000C038;
    if (os_signpost_enabled((os_log_t)qword_10000C038))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v48,  OS_SIGNPOST_INTERVAL_BEGIN,  v11,  "AQSubServerStartTime",  " enableTelemetry=YES ",  buf,  2u);
    }
  }

  (*(void (**)(_BYTE *))(*(void *)v119 + 16LL))(v119);
  if (v121 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v49 = (os_log_s *)qword_10000C038;
    if (os_signpost_enabled((os_log_t)qword_10000C038))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v49,  OS_SIGNPOST_INTERVAL_END,  v11,  "AQSubServerStartTime",  (const char *)&unk_1000078E7,  buf,  2u);
    }
  }

  if (v121 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v50 = (os_log_s *)qword_10000C038;
    if (os_signpost_enabled((os_log_t)qword_10000C038))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v50,  OS_SIGNPOST_INTERVAL_END,  v11,  "mediaserverdStartTime",  (const char *)&unk_1000078E7,  buf,  2u);
    }
  }

  uint64_t v51 = notify_post("com.apple.mediaserverd.up");
  if (!qword_10000C058)
  {
    *(_OWORD *)buf = off_1000086F8;
    *(void *)&buf[16] = 0LL;
    uint64_t v51 = _sl_dlopen(buf, 0LL);
    qword_10000C058 = v51;
  }

  if (qword_10000C058)
  {
    v52 = (void *)sub_100004874();
    uint64_t v51 = (uint64_t)dlsym(v52, "MSNMonitorStartMic");
    if (v51)
    {
      v53 = (os_log_s *)CADefaultLog(v51);
      v54 = v53;
      if (v53 && os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = "mediaserverd.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 358;
        _os_log_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_INFO,  "%25s:%-5d Starting MediaSafetyNet microphone monitor",  buf,  0x12u);
      }

      *(void *)buf = 0LL;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000LL;
      v55 = off_10000C060;
      *(void *)&buf[24] = off_10000C060;
      if (!off_10000C060)
      {
        v56 = (void *)sub_100004874();
        v55 = dlsym(v56, "MSNMonitorStartMic");
        *(void *)(*(void *)&buf[8] + 24LL) = v55;
        off_10000C060 = v55;
      }

      _Block_object_dispose(buf, 8);
      if (!v55)
      {
        v111 = dlerror();
        uint64_t result = abort_report_np("%s", v111);
        __break(1u);
        return result;
      }

      uint64_t v51 = ((uint64_t (*)(void))v55)();
    }
  }

  if (audiomxd_enabled(v51))
  {
    v57 = (uint64_t *)operator new(0x18uLL);
    uint64_t *v57 = 0LL;
    v57[1] = 0LL;
    v57[2] = 0LL;
    qword_10000C050 = (uint64_t)v57;
    sub_100006448(v57);
    v58 = operator new(8uLL);
    void *v58 = &off_100008720;
    uint64_t v59 = *v57;
    uint64_t *v57 = (uint64_t)v58;
    if (v59)
    {
      (*(void (**)(uint64_t))(*(void *)v59 + 8LL))(v59);
      if (!*v57) {
        __assert_rtn("CreateConnection", "AudioFileServerListener.cpp", 27, "mServer.get()");
      }
    }

    v60 = dispatch_queue_create("com.apple.audio.AudioFileServer.listener", 0LL);
    v57[2] = (uint64_t)v60;
    v61 = operator new(0x30uLL);
    xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.audio.AudioFileServer", v60, 1uLL);
    *((_BYTE *)v61 + 16) = 1;
    *((void *)v61 + 1) = mach_service;
    *((void *)v61 + 3) = 0LL;
    *((void *)v61 + 5) = 0LL;
    XPC_Connection::Initialize((XPC_Connection *)v61);
    uint64_t v63 = v57[1];
    v57[1] = (uint64_t)v61;
    if (v63)
    {
      (*(void (**)(uint64_t))(*(void *)v63 + 8LL))(v63);
      v61 = (void *)v57[1];
    }

    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 0x40000000LL;
    *(void *)&buf[16] = sub_1000064AC;
    *(void *)&buf[24] = &unk_100008858;
    *(void *)&buf[32] = v57;
    v64 = (_BYTE *)*((void *)v61 + 3);
    if (v64 != buf)
    {
      if (v64) {
        _Block_release(v64);
      }
      *((void *)v61 + 3) = _Block_copy(buf);
      v61 = (void *)v57[1];
    }

    v65 = (_xpc_connection_s *)*((void *)v61 + 1);
    if (v65) {
      xpc_connection_resume(v65);
    }
  }

  wd_endpoint_activate();
  uint64_t v66 = MGGetBoolAnswer(@"ExclaveCapability");
  if ((_DWORD)v66)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "mediaserverd.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 409;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%25s:%-5d [audiomxd conclave] Launching audiomxd conclave",  buf,  0x12u);
    }

    if (v121 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v67 = (os_log_s *)qword_10000C038;
      if (os_signpost_enabled((os_log_t)qword_10000C038))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v67,  OS_SIGNPOST_INTERVAL_BEGIN,  v11,  "AudiomxdConclaveLaunch",  (const char *)&unk_1000078E7,  buf,  2u);
      }
    }

    os_signpost_id_t v112 = v11;
    v68 = operator new(0x10uLL);
    void *v68 = "com.apple.audiomxd.MTDAudioDSPControl";
    v68[1] = 37LL;
    v69 = operator new(0x20uLL);
    v69[2] = "com.apple.audiomxd.SiriAudioDSPControl";
    v69[3] = 38LL;
    *(_OWORD *)v69 = *(_OWORD *)v68;
    operator delete(v68);
    v70 = sub_100004934(4uLL);
    v71 = v70;
    uint64_t v73 = v72;
    v74 = (char *)&v70[2 * v72];
    v70[4] = "com.apple.audiomxd.SoundAnalysisAudioDSPControl";
    v70[5] = 47LL;
    v75 = (char *)(v70 + 6);
    uint64_t v76 = 2LL;
    for (uint64_t i = 2LL; i != -2; i -= 2LL)
    {
      --v76;
      *(_OWORD *)&v70[i] = *(_OWORD *)&v69[i];
    }

    v78 = (char *)v70;
    operator delete(v69);
    if (PlatformUtilities_iOS::IsInternalBuild(v79))
    {
      if (v73 < 4)
      {
        uint64_t v80 = (48 - 16 * v76) >> 4;
        unint64_t v81 = v80 + 1;
        else {
          unint64_t v82 = v81;
        }
        v83 = (char *)sub_100004934(v82);
        v84 = &v83[16 * v80];
        *(void *)v84 = "com.apple.audiomxd.AudioCaptureServer";
        *((void *)v84 + 1) = 37LL;
        v75 = v84 + 16;
        if (v76 == 3)
        {
          v85 = &v83[16 * v80];
        }

        else
        {
          uint64_t v86 = -48LL;
          v87 = (__int128 *)(v71 + 4);
          do
          {
            v85 = v84 - 16;
            __int128 v88 = *v87--;
            *((_OWORD *)v84 - 1) = v88;
            v84 -= 16;
            v86 += 16LL;
          }

          while (v86);
        }

        if (v71) {
          operator delete(v71);
        }
        v78 = v85;
      }

      else
      {
        v71[6] = "com.apple.audiomxd.AudioCaptureServer";
        v71[7] = 37LL;
        v75 = (char *)(v71 + 8);
      }
    }

    for (j = v78; v78 != v75; v78 += 16)
    {
      int v89 = tb_conclave_endpoint_for_service(*(void *)v78, out_token);
      if (v89)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          uint64_t v90 = *(void *)v78;
          *(_DWORD *)buf = 136315906;
          *(void *)&buf[4] = "mediaserverd.mm";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 160;
          *(_WORD *)&buf[18] = 2080;
          *(void *)&buf[20] = v90;
          *(_WORD *)&buf[28] = 1024;
          *(_DWORD *)&buf[30] = v89;
          os_log_type_t v91 = OS_LOG_TYPE_ERROR;
          v92 = "%25s:%-5d [audiomxd conclave][%s] conclave launch returned error:%u\n";
          uint32_t v93 = 34;
LABEL_164:
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, v91, v92, buf, v93);
        }
      }

      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        uint64_t v94 = *(void *)v78;
        *(_DWORD *)buf = 136315650;
        *(void *)&buf[4] = "mediaserverd.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 164;
        *(_WORD *)&buf[18] = 2080;
        *(void *)&buf[20] = v94;
        os_log_type_t v91 = OS_LOG_TYPE_INFO;
        v92 = "%25s:%-5d [audiomxd conclave][%s] conclave launch suceeded";
        uint32_t v93 = 28;
        goto LABEL_164;
      }
    }

    if (qword_10000C040 != -1) {
      dispatch_once(&qword_10000C040, &stru_1000085E8);
    }
    if (v121 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v95 = (os_log_s *)qword_10000C038;
      if (os_signpost_enabled((os_log_t)qword_10000C038))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v95,  OS_SIGNPOST_INTERVAL_END,  v112,  "AudiomxdConclaveLaunch",  (const char *)&unk_1000078E7,  buf,  2u);
      }
    }

    (*(void (**)(_BYTE *))(*(void *)v119 + 48LL))(v119);
    operator delete(j);
  }

  if (v115) {
    uint64_t v66 = pthread_set_qos_class_self_np(__qos_class, __relative_priority);
  }
  if (!v117) {
    pthread_set_timeshare_self(v66);
  }
  objc_autoreleasePoolPop(context);
  while ((byte_10000C048 & 1) == 0)
  {
    v96 = -[NSDate initWithTimeIntervalSinceNow:]( objc_alloc(&OBJC_CLASS___NSDate),  "initWithTimeIntervalSinceNow:",  1.0e10);
    -[NSRunLoop runMode:beforeDate:]( +[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"),  "runMode:beforeDate:",  NSDefaultRunLoopMode,  v96);
  }

  v97 = (void *)*__p;
  v98 = (void *)__p[1];
  if ((void *)*__p != v98)
  {
    v99 = (void *)*__p;
    do
    {
      v100 = (_BYTE *)*v99;
      if (*v99)
      {
        if (v100[8])
        {
          v101 = (const __CFArray *)(*(uint64_t (**)(void))(*(void *)v100 + 32LL))(*v99);
          *(void *)buf = v101;
          *(_WORD *)&buf[8] = 0;
          if (v101)
          {
            unsigned int v102 = 0;
LABEL_188:
            LODWORD(v101) = CFArrayGetCount(v101);
            while (v102 < v101)
            {
              *(void *)out_token = 0LL;
              if (CACFArray::GetCFType((CACFArray *)buf, v102, (const void **)out_token)) {
                CFRunLoopRemoveSource( (CFRunLoopRef)qword_10000C030,  *(CFRunLoopSourceRef *)out_token,  kCFRunLoopCommonModes);
              }
              ++v102;
              v101 = *(const __CFArray **)buf;
              if (*(void *)buf) {
                goto LABEL_188;
              }
            }
          }

          (*(void (**)(_BYTE *))(*(void *)v100 + 24LL))(v100);
          sub_10000483C((uint64_t)buf);
        }

        (*(void (**)(_BYTE *))(*(void *)v100 + 8LL))(v100);
      }

      ++v99;
    }

    while (v99 != v98);
  }

  if (v97)
  {
    __p[1] = v97;
    operator delete(v97);
  }

  operator delete(__p);
  dispatch_source_cancel(source);
  dispatch_release(source);
  v103 = queue;
  if (queue) {
    dispatch_release(queue);
  }
  uint64_t v104 = audiomxd_enabled(v103);
  if ((_DWORD)v104)
  {
    v105 = (uint64_t *)qword_10000C050;
    if (qword_10000C050)
    {
      sub_100006448((uint64_t *)qword_10000C050);
      uint64_t v106 = v105[1];
      v105[1] = 0LL;
      if (v106) {
        (*(void (**)(uint64_t))(*(void *)v106 + 8LL))(v106);
      }
      uint64_t v107 = *v105;
      uint64_t *v105 = 0LL;
      if (v107) {
        (*(void (**)(uint64_t))(*(void *)v107 + 8LL))(v107);
      }
      operator delete(v105);
    }

    qword_10000C050 = 0LL;
  }

  v108 = (os_log_s *)CADefaultLog(v104);
  v109 = v108;
  if (v108 && os_log_type_enabled(v108, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "mediaserverd.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 513;
    _os_log_impl((void *)&_mh_execute_header, v109, OS_LOG_TYPE_INFO, "%25s:%-5d main exiting", buf, 0x12u);
  }

  return 0LL;
}

void sub_1000046C4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, void *__p, uint64_t a31, int a32, __int16 a33, char a34, char a35, void *a36, uint64_t a37, int a38, __int16 a39, char a40, char a41)
{
  if (a35 < 0) {
    operator delete(__p);
  }
  if (a41 < 0) {
    operator delete(a36);
  }
  _Unwind_Resume(a1);
}

void sub_1000047E4(void *a1)
{
}

void sub_1000047F4()
{
}

void *sub_100004808(unint64_t a1)
{
  if (a1 >> 61) {
    sub_1000049DC();
  }
  return operator new(8 * a1);
}

uint64_t sub_10000483C(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 8))
  {
    int v2 = *(const void **)a1;
    if (*(void *)a1) {
      CFRelease(v2);
    }
  }

  return a1;
}

uint64_t sub_100004874()
{
  uint64_t v3 = 0LL;
  if (!qword_10000C058)
  {
    __int128 v4 = off_1000086F8;
    uint64_t v5 = 0LL;
    qword_10000C058 = _sl_dlopen(&v4, &v3);
    int v1 = v3;
    uint64_t v0 = qword_10000C058;
    if (qword_10000C058)
    {
      if (!v3) {
        return v0;
      }
    }

    else
    {
      int v1 = (char *)abort_report_np("%s", v3);
    }

    free(v1);
    return v0;
  }

  return qword_10000C058;
}

void *sub_100004934(unint64_t a1)
{
  if (a1 >> 60) {
    sub_1000049DC();
  }
  return operator new(16 * a1);
}

void sub_100004968(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_1000049B8(exception, a1);
}

void sub_1000049A4(_Unwind_Exception *a1)
{
}

std::logic_error *sub_1000049B8(std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  return result;
}

void sub_1000049DC()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  int v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

void sub_100004A08(uint64_t a1)
{
  int v1 = (void *)sub_1000030F0(a1);
  operator delete(v1);
}

uint64_t sub_100004A1C()
{
  uint64_t result = audiomxd_enabled();
  if ((_DWORD)result) {
    return AudioToolboxServerInit(1LL);
  }
  return result;
}

uint64_t sub_100004A40()
{
  uint64_t result = audiomxd_enabled();
  if ((_DWORD)result) {
    return AudioToolboxServerInit(2LL);
  }
  return result;
}

void sub_100004A64(id a1)
{
  int v1 = (os_log_s *)CADefaultLog(a1);
  if (v1)
  {
    int v2 = v1;
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    {
      int v3 = 136315394;
      __int128 v4 = "mediaserverd.mm";
      __int16 v5 = 1024;
      int v6 = 260;
      _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_ERROR,  "%25s:%-5d SIGTERM received, process about to terminate.",  (uint8_t *)&v3,  0x12u);
    }
  }

  if (qword_10000C030)
  {
    byte_10000C048 = 1;
    CFRunLoopStop((CFRunLoopRef)qword_10000C030);
  }
}

void sub_100004B30(id a1, int a2)
{
  uint64_t v2 = MGGetSInt32Answer(@"DeviceClassNumber", 0LL);
  int v3 = v2;
  __int128 v4 = (os_log_s *)CADefaultLog(v2);
  __int16 v5 = v4;
  if (v3 != 7)
  {
    if (v4 && os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315394;
      BOOL v7 = "mediaserverd.mm";
      __int16 v8 = 1024;
      int v9 = 139;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%25s:%-5d com.apple.language.changed notification received, audiomxd exiting",  (uint8_t *)&v6,  0x12u);
    }

    exit(0);
  }

  if (v4 && os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    BOOL v7 = "mediaserverd.mm";
    __int16 v8 = 1024;
    int v9 = 143;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%25s:%-5d com.apple.language.changed notification received, resynchronizing all preferences to pick up new preferr ed language list",  (uint8_t *)&v6,  0x12u);
  }

  CFPreferencesSynchronize(kCFPreferencesAnyApplication, kCFPreferencesAnyUser, kCFPreferencesAnyHost);
}

std::string *sub_100004C90(std::string *this, std::string *a2, std::string *a3)
{
  __int128 v4 = a2;
  LODWORD(v6) = (char)this->__r_.__value_.__s.__size_;
  unint64_t v7 = (char *)a3 - (char *)a2;
  if ((v6 & 0x80000000) != 0)
  {
    if (a3 == a2) {
      return this;
    }
    std::string::size_type size = this->__r_.__value_.__l.__size_;
    std::string::size_type cap = this->__r_.__value_.__l.__cap_;
    std::string::size_type v9 = (cap & 0x7FFFFFFFFFFFFFFFLL) - 1;
    v10 = (std::string *)this->__r_.__value_.__r.__words[0];
    std::string::size_type v6 = HIBYTE(cap);
  }

  else
  {
    if (a3 == a2) {
      return this;
    }
    std::string::size_type size = this->__r_.__value_.__s.__size_;
    std::string::size_type v9 = 22LL;
    v10 = this;
  }

  if (v10 > v4 || (std::string *)((char *)&v10->__r_.__value_.__l.__data_ + size + 1) <= v4)
  {
    if (v9 - size < v7)
    {
      std::string::__grow_by(this, v9, size - v9 + v7, size, size, 0LL, 0LL);
      this->__r_.__value_.__l.__size_ = size;
      LOBYTE(v6) = this->__r_.__value_.__s.__size_;
    }

    v13 = this;
    if ((v6 & 0x80) != 0) {
      v13 = (std::string *)this->__r_.__value_.__r.__words[0];
    }
    v14 = (char *)v13 + size;
    do
    {
      std::string::value_type v15 = v4->__r_.__value_.__s.__data_[0];
      __int128 v4 = (std::string *)((char *)v4 + 1);
      *v14++ = v15;
    }

    while (v4 != a3);
    std::string::value_type *v14 = 0;
    std::string::size_type v16 = v7 + size;
    else {
      this->__r_.__value_.__s.__size_ = v16 & 0x7F;
    }
  }

  else
  {
    if (v7 >= 0x7FFFFFFFFFFFFFF8LL) {
      sub_100004E4C();
    }
    if (v7 > 0x16)
    {
      uint64_t v17 = (v7 & 0xFFFFFFFFFFFFFFF8LL) + 8;
      if ((v7 | 7) != 0x17) {
        uint64_t v17 = v7 | 7;
      }
      uint64_t v18 = v17 + 1;
      p_p = (std::string::value_type *)operator new(v17 + 1);
      std::string::size_type v24 = v7;
      int64_t v25 = v18 | 0x8000000000000000LL;
      __p = p_p;
    }

    else
    {
      HIBYTE(v25) = v7;
      p_p = (std::string::value_type *)&__p;
    }

    do
    {
      std::string::value_type v19 = v4->__r_.__value_.__s.__data_[0];
      __int128 v4 = (std::string *)((char *)v4 + 1);
      *p_p++ = v19;
    }

    while (v4 != a3);
    std::string::value_type *p_p = 0;
    if (v25 >= 0) {
      v20 = (const std::string::value_type *)&__p;
    }
    else {
      v20 = (const std::string::value_type *)__p;
    }
    if (v25 >= 0) {
      std::string::size_type v21 = HIBYTE(v25);
    }
    else {
      std::string::size_type v21 = v24;
    }
    std::string::append(this, v20, v21);
    if (SHIBYTE(v25) < 0) {
      operator delete(__p);
    }
  }

  return this;
}

void sub_100004E30( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_100004E4C()
{
}

void sub_100004E68(uint64_t a1, uint64_t a2)
{
  __int128 v4 = (char *)operator new(0xC8uLL);
  v4[16] = 0;
  *((void *)v4 + 1) = a2;
  *((void *)v4 + 3) = 0LL;
  *((void *)v4 + 5) = 0LL;
  XPC_Connection::Initialize((XPC_Connection *)v4);
  *(void *)__int128 v4 = off_100008790;
  *((void *)v4 + 6) = 0LL;
  *((void *)v4 + 7) = off_100008888;
  *((_WORD *)v4 + 32) = 0;
  *((void *)v4 + 9) = 0LL;
  *((void *)v4 + 10) = 0LL;
  *((void *)v4 + 11) = 0xFFFFFFFF00000000LL;
  *((_DWORD *)v4 + 24) = 0;
  *((void *)v4 + 13) = xpc_null_create();
  *((void *)v4 + 7) = off_1000087B8;
  v4[112] = 1;
  *(_OWORD *)(v4 + 120) = 0u;
  *(_OWORD *)(v4 + 136) = 0u;
  *(_OWORD *)(v4 + 152) = 0u;
  std::string::size_type v6 = (_xpc_connection_s *)*((void *)v4 + 1);
  if (v6) {
    uint64_t pid = xpc_connection_get_pid(v6);
  }
  else {
    uint64_t pid = 0xFFFFFFFFLL;
  }
  v4[168] = 1;
  *((void *)v4 + 22) = "AudioFileConnection";
  *((_DWORD *)v4 + 46) = pid;
  *((void *)v4 + 24) = 0LL;
  PlatformUtilities::processName(__p, (PlatformUtilities *)pid, v5);
  if (v16 >= 0) {
    __int16 v8 = __p;
  }
  else {
    __int16 v8 = (void **)__p[0];
  }
  snprintf(__str, 0x80uLL, "%s %p (%d:%s)", "AudioFileConnection", v4 + 168, pid, (const char *)v8);
  if (v16 < 0) {
    operator delete(__p[0]);
  }
  *((void *)v4 + 24) = os_transaction_create(__str);
  std::string::size_type v9 = (_xpc_connection_s *)*((void *)v4 + 1);
  if (v9) {
    xpc_connection_set_finalizer_f(v9, (xpc_finalizer_t)&XPC_Connection::Finalize);
  }
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 0x40000000LL;
  aBlock[2] = sub_100005114;
  aBlock[3] = &unk_100008740;
  aBlock[4] = a1;
  aBlock[5] = v4;
  v10 = (void *)*((void *)v4 + 3);
  if (v10 != aBlock)
  {
    if (v10) {
      _Block_release(v10);
    }
    *((void *)v4 + 3) = _Block_copy(aBlock);
  }

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 0x40000000LL;
  v13[2] = nullsub_2;
  v13[3] = &unk_100008760;
  v13[4] = a1;
  v13[5] = v4;
  os_signpost_id_t v11 = (void *)*((void *)v4 + 5);
  if (v11 != v13)
  {
    if (v11) {
      _Block_release(v11);
    }
    *((void *)v4 + 5) = _Block_copy(v13);
  }

  v12 = (_xpc_connection_s *)*((void *)v4 + 1);
  if (v12) {
    xpc_connection_resume(v12);
  }
}

void sub_1000050AC(_Unwind_Exception *a1)
{
}

void sub_100005114(uint64_t a1, xpc_object_t object)
{
  int v3 = *(_xpc_connection_s ***)(a1 + 40);
  if (xpc_get_type(object) != (xpc_type_t)&_xpc_type_dictionary) {
    return;
  }
  char v41 = 0;
  xpc_object_t v40 = object;
  if (object)
  {
    int PropertyInfo = 560821095;
    char v38 = 1;
    xpc_object_t xdict = xpc_dictionary_create_reply(object);
    std::string::size_type v6 = v3 + 6;
    int v5 = v3[6];
    AudioFilePropertyID v35 = 0;
    xpc_object_t v7 = xpc_dictionary_get_value(v40, "type");
    __int16 v8 = v7;
    if (!v7 || xpc_get_type(v7) != (xpc_type_t)&_xpc_type_uint64)
    {
LABEL_5:
      if (xdict) {
        xpc_dictionary_set_int64(xdict, "status", PropertyInfo);
      }
      goto LABEL_8;
    }

    int v10 = xpc_uint64_get_value(v8);
    if (v10 <= 1869636973)
    {
      if (v10 == 1668050803)
      {
        AudioFileClose(*v6);
        int PropertyInfo = 0;
        *std::string::size_type v6 = 0LL;
        goto LABEL_5;
      }

      if (v10 != 1768842863) {
        goto LABEL_5;
      }
      if (v5)
      {
        AudioFilePropertyID v16 = v35;
        if ((sub_100005920(v35) & 1) != 0 || v16 == 1633776244 || v16 == 1819243876 || v16 == 1768842863)
        {
          int PropertyInfo = AudioFileGetPropertyInfo(v5, v16, (UInt32 *)&v27, (UInt32 *)&inStartingPacket);
          if (!PropertyInfo)
          {
            if (xdict)
            {
              xpc_dictionary_set_uint64(xdict, "size", v27);
              if (xdict) {
                xpc_dictionary_set_uint64(xdict, "writable", inStartingPacket);
              }
            }
          }

          goto LABEL_5;
        }

LABEL_72:
        int PropertyInfo = 1886681407;
        goto LABEL_5;
      }
    }

    else
    {
      switch(v10)
      {
        case 1869636974:
          xpc_object_t v17 = xpc_dictionary_get_value(v40, "data");
          uint64_t v18 = v17;
          if (!v17 || xpc_get_type(v17) != (xpc_type_t)&_xpc_type_data) {
            goto LABEL_57;
          }
          xpc_data_get_length(v18);
          bytes_ptr = (const char *)xpc_data_get_bytes_ptr(v18);
          uint64_t v27 = 0LL;
          int PropertyInfo = sub_1000057D0(bytes_ptr, (CFURLRef *)&v27);
          if (PropertyInfo) {
            goto LABEL_5;
          }
          LODWORD(inStartingPacket) = 0;
          sub_1000058C8((uint64_t)v40, "hint", &inStartingPacket);
          if (!v5)
          {
            int PropertyInfo = AudioFileOpenURL((CFURLRef)v27, kAudioFileReadPermission, inStartingPacket, v3 + 6);
            if (!PropertyInfo)
            {
              v20 = v3[6];
              ioDataSize[0] = 40;
              int PropertyInfo = AudioFileGetProperty(v20, 0x64666D74u, ioDataSize, v3 + 16);
              if (PropertyInfo) {
                AudioFileClose(v20);
              }
            }

            goto LABEL_5;
          }

          break;
        case 1886547824:
          if (v5)
          {
            AudioFilePropertyID v21 = v35;
            int v22 = sub_100005920(v35);
            if ((v22 & 1) != 0 || v21 == 1633776244 || v21 == 1819243876 || v21 == 1768842863)
            {
              int PropertyInfo = AudioFileGetPropertyInfo(v5, v21, ioDataSize, isWritable);
              if (PropertyInfo) {
                goto LABEL_5;
              }
              if (v21 == 1633776244 || v21 == 1819243876 || v21 == 1768842863)
              {
                int PropertyInfo = AudioFileGetProperty(v5, v21, ioDataSize, &inStartingPacket);
                if (!PropertyInfo)
                {
                  Data = CFPropertyListCreateData( kCFAllocatorDefault,  (CFPropertyListRef)inStartingPacket,  kCFPropertyListBinaryFormat_v1_0,  0LL,  0LL);
                  uint64_t v27 = (uint64_t)Data;
                  LOBYTE(value) = 1;
                  if (Data)
                  {
                    unsigned int Length = CFDataGetLength(Data);
                    BytePtr = CFDataGetBytePtr((CFDataRef)v27);
                    if (xdict) {
                      xpc_dictionary_set_data(xdict, "data", BytePtr, Length);
                    }
                    int PropertyInfo = 0;
                  }

                  else
                  {
                    int PropertyInfo = 2003334207;
                  }

                  sub_100005AF8((uint64_t)&v27);
                }

                goto LABEL_5;
              }

              if (v22)
              {
                sub_100005B30(&v27, ioDataSize[0]);
                int PropertyInfo = AudioFileGetProperty(v5, v21, ioDataSize, (void *)v27);
                v26 = (void *)v27;
                if (PropertyInfo)
                {
                  if (v27) {
                    free((void *)v27);
                  }
                  goto LABEL_5;
                }

                if (xdict)
                {
                  xpc_dictionary_set_data(xdict, "data", (const void *)v27, ioDataSize[0]);
                  v26 = (void *)v27;
                }

                if (v26) {
                  free(v26);
                }
                goto LABEL_79;
              }
            }

            goto LABEL_72;
          }

          break;
        case 1919246692:
          UInt32 ioNumPackets = 0;
          SInt64 inStartingPacket = 0LL;
          xpc_object_t v11 = xpc_dictionary_get_value(v40, "numbytes");
          v12 = v11;
          if (v11)
          {
            if (xpc_get_type(v11) == (xpc_type_t)&_xpc_type_uint64)
            {
              UInt32 v13 = xpc_uint64_get_value(v12);
              UInt32 ioNumBytes = v13;
              if (sub_1000058C8((uint64_t)v40, "numpackets", &ioNumPackets))
              {
                if (sub_100005B8C((uint64_t)v40, &inStartingPacket))
                {
                  *(void *)isWritable = 0LL;
                  *(void *)ioDataSize = 0LL;
                  uint64_t value = 2LL;
                  uint64_t v27 = (uint64_t)&off_1000087E0;
                  int fd = -1;
                  int PropertyInfo = sub_100005BEC( (uint64_t)(v3 + 7),  (uint64_t)(v3 + 16),  v13,  ioNumPackets,  (unsigned int **)ioDataSize,  (unsigned int **)isWritable,  (uint64_t)&v27);
                  if (PropertyInfo) {
                    goto LABEL_5;
                  }
                  int PropertyInfo = AudioFileReadPacketData( v5,  0,  &ioNumBytes,  *(AudioStreamPacketDescription **)isWritable,  inStartingPacket,  &ioNumPackets,  *(void **)(*(void *)ioDataSize + 16LL));
                  if (PropertyInfo) {
                    goto LABEL_5;
                  }
                  if (xdict)
                  {
                    xpc_dictionary_set_uint64(xdict, "numbytes", ioNumBytes);
                    if (xdict) {
                      xpc_dictionary_set_uint64(xdict, "numpackets", ioNumPackets);
                    }
                  }

                  int v14 = fd;
                  if (fd)
                  {
                    xpc_object_t v15 = xdict;
                    if (xdict)
                    {
                      xpc_dictionary_set_uint64(xdict, "bufsize", HIDWORD(value));
                      xpc_object_t v15 = xdict;
                    }

                    xpc_dictionary_set_fd(v15, "bufFD", v14);
                  }

LABEL_79:
                  int PropertyInfo = 0;
                  goto LABEL_5;
                }
              }
            }
          }

LABEL_57:
          int PropertyInfo = -50;
          goto LABEL_5;
        default:
          goto LABEL_5;
      }
    }

    int PropertyInfo = 560951410;
    goto LABEL_5;
  }

  char v38 = 1;
  xpc_object_t xdict = 0LL;
LABEL_8:
  std::string::size_type v9 = v3[1];
  if (v9) {
    xpc_connection_send_message(v9, xdict);
  }
  XPC_Dictionary::~XPC_Dictionary((XPC_Dictionary *)&v36);
  XPC_Dictionary::~XPC_Dictionary((XPC_Dictionary *)&v39);
}

void sub_100005738( void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30)
{
}

uint64_t sub_1000057D0(const char *a1, CFURLRef *a2)
{
  if (!a1) {
    return 4294967246LL;
  }
  if (strncmp(a1, "ipod-library", 0xCuLL)) {
    return 4294967253LL;
  }
  int v5 = CFStringCreateWithCString(kCFAllocatorDefault, a1, 0x201u);
  if (!v5) {
    return 4294967246LL;
  }
  std::string::size_type v6 = v5;
  CFURLRef v7 = CFURLCreateWithString(kCFAllocatorDefault, v5, 0LL);
  CFRelease(v6);
  if (!v7) {
    return 4294967246LL;
  }
  if (!PUTIsPersistentURL(v7))
  {
    CFRelease(v7);
    return 4294967253LL;
  }

  __int16 v8 = (const __CFString *)PUTCreatePathForPersistentURL(v7, 0LL);
  CFRelease(v7);
  uint64_t v4 = 4294967253LL;
  if (v8)
  {
    *a2 = CFURLCreateWithString(kCFAllocatorDefault, v8, 0LL);
    CFRelease(v8);
    if (*a2) {
      return 0LL;
    }
    else {
      return 4294967253LL;
    }
  }

  return v4;
}

uint64_t sub_1000058C8(uint64_t result, const char *a2, _DWORD *a3)
{
  if (result)
  {
    uint64_t result = (uint64_t)xpc_dictionary_get_value((xpc_object_t)result, a2);
    if (result)
    {
      uint64_t v4 = (void *)result;
      if (xpc_get_type((xpc_object_t)result) == (xpc_type_t)&_xpc_type_uint64)
      {
        *a3 = xpc_uint64_get_value(v4);
        return 1LL;
      }

      else
      {
        return 0LL;
      }
    }
  }

  return result;
}

uint64_t sub_100005920(int a1)
{
  uint64_t result = 1LL;
  if (a1 <= 1718775914)
  {
    if (a1 <= 1684434291)
    {
      if (a1 <= 1652125802)
      {
        if (a1 == 1650683508) {
          return result;
        }
        int v3 = 1651663220;
        goto LABEL_31;
      }

      if (a1 == 1652125803 || a1 == 1667787108) {
        return result;
      }
      int v3 = 1668112752;
    }

    else if (a1 > 1701082481)
    {
      if (a1 == 1701082482 || a1 == 1717988724) {
        return result;
      }
      int v3 = 1718383476;
    }

    else
    {
      if (a1 == 1684434292 || a1 == 1685022310) {
        return result;
      }
      int v3 = 1685289589;
    }

LABEL_31:
    if (a1 != v3) {
      return 0LL;
    }
    return result;
  }

  if (a1 > 1886086769)
  {
    if (a1 > 1886616164)
    {
      if (a1 == 1886616165 || a1 == 1920168566) {
        return result;
      }
      int v3 = 1935832164;
    }

    else
    {
      if (a1 == 1886086770 || a1 == 1886090594) {
        return result;
      }
      int v3 = 1886283375;
    }

    goto LABEL_31;
  }

  if (a1 > 1869640812)
  {
    if (a1 == 1869640813 || a1 == 1885564532) {
      return result;
    }
    int v3 = 1886085753;
    goto LABEL_31;
  }

  if (a1 != 1718775915 && a1 != 1768174452)
  {
    int v3 = 1835493731;
    goto LABEL_31;
  }

  return result;
}

uint64_t sub_100005AF8(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 8))
  {
    uint64_t v2 = *(const void **)a1;
    if (*(void *)a1) {
      CFRelease(v2);
    }
  }

  return a1;
}

void *sub_100005B30(void *a1, size_t __size)
{
  *a1 = 0LL;
  uint64_t v4 = malloc(__size);
  if (__size && !v4)
  {
    exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
    CFURLRef v7 = std::bad_alloc::bad_alloc(exception);
  }

  *a1 = v4;
  return a1;
}

uint64_t sub_100005B8C(uint64_t result, int64_t *a2)
{
  if (result)
  {
    uint64_t result = (uint64_t)xpc_dictionary_get_value((xpc_object_t)result, "startingPacket");
    if (result)
    {
      int v3 = (void *)result;
      if (xpc_get_type((xpc_object_t)result) == (xpc_type_t)&_xpc_type_int64)
      {
        *a2 = xpc_int64_get_value(v3);
        return 1LL;
      }

      else
      {
        return 0LL;
      }
    }
  }

  return result;
}

uint64_t sub_100005BEC( uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4, unsigned int **a5, unsigned int **a6, uint64_t a7)
{
  uint64_t v14 = sub_100006228(*(unsigned __int8 *)(a1 + 56));
  unsigned int v15 = *(_DWORD *)(a2 + 28);
  if ((*(_BYTE *)(a2 + 12) & 0x20) != 0)
  {
    if (v15 - 65 <= 0xFFFFFFBF)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__str = 136315394;
        *(void *)&__str[4] = "SharedAudioBufferList.h";
        __int16 v65 = 1024;
        int v66 = 90;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "%25s:%-5d  STACK_ABL: invalid number of buffers",  __str,  0x12u);
      }

      exception = __cxa_allocate_exception(0x10uLL);
      *(void *)exception = &off_100008840;
      exception[2] = -50;
    }
  }

  else
  {
    unsigned int v15 = 1;
  }

  __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v62 - v17;
  *(_DWORD *)((char *)&v62 - v17) = v15;
  std::string::value_type v19 = (int **)((char *)&v62 - v17 + 16);
  uint64_t v20 = v15;
  do
  {
    *std::string::value_type v19 = 0LL;
    *((_DWORD *)v19 - 2) = v16;
    *((_DWORD *)v19 - 1) = a3;
    v19 += 2;
    --v20;
  }

  while (v20);
  if ((a3 & 0xF) != 0) {
    uint64_t v21 = 16 - (a3 & 0xF);
  }
  else {
    uint64_t v21 = 0LL;
  }
  sub_100006228(*(unsigned __int8 *)(a1 + 56));
  unint64_t v22 = (v21 + a3) * v15 + 16LL * a4 + 32;
  if (HIDWORD(v22)) {
    return 4294967188LL;
  }
  sub_100006228(*(unsigned __int8 *)(a1 + 56));
  if (*(void *)(a1 + 16) < (unint64_t)v22)
  {
    size_t v23 = -(int)vm_page_size & (v22 + vm_page_size - 1);
    (*(void (**)(uint64_t))(*(void *)a1 + 16LL))(a1);
    int v24 = *(_DWORD *)(a7 + 8);
    if (v24)
    {
      if (v24 == 1)
      {
        *(void *)(a1 + 16) = v23;
        v31 = mmap(0LL, v23, 3, 4097, -1, 0LL);
        *(void *)(a1 + 24) = v31;
        if ((unint64_t)v31 + 1 > 1)
        {
          *(_WORD *)(a1 + _Block_object_dispose((const void *)(v41 - 160), 8) = 257;
          xpc_object_t v35 = xpc_shmem_create(v31, *(void *)(a1 + 16));
          if (!v35) {
            xpc_object_t v35 = xpc_null_create();
          }
          uint64_t v36 = *(void **)(a1 + 48);
          *(void *)(a1 + 4_Block_object_dispose((const void *)(v41 - 160), 8) = v35;
          xpc_release(v36);
          *(_DWORD *)(a7 + 12) = *(void *)(a1 + 16);
          xpc_object_t v37 = *(xpc_object_t *)(a1 + 48);
          if (v37) {
            xpc_retain(*(xpc_object_t *)(a1 + 48));
          }
          else {
            xpc_object_t v37 = xpc_null_create();
          }
          char v38 = *(void **)(a7 + 16);
          *(void *)(a7 + 16) = v37;
          xpc_release(v38);
          goto LABEL_39;
        }

        uint64_t memory_entry_64 = *__error();
        sub_1000067B0((uint64_t)"mmap");
        goto LABEL_27;
      }

      if (v24 != 2) {
        goto LABEL_39;
      }
      do
      {
        unsigned int v25 = __ldxr(&dword_10000C06C);
        unsigned int v26 = v25 + 1;
      }

      while (__stxr(v25 + 1, &dword_10000C06C));
      *(_DWORD *)(a1 + 40) = v26;
      pid_t v27 = getpid();
      snprintf(__str, 0x40uLL, "AppleABL.%x.%x", v27, v26);
      int v28 = shm_open(__str, 514, 511LL);
      *(_DWORD *)(a1 + 36) = v28;
      if (v28 == -1)
      {
        sub_1000067B0((uint64_t)"shm_open");
        uint64_t memory_entry_64 = *__error();
LABEL_27:
        if ((_DWORD)memory_entry_64) {
          return memory_entry_64;
        }
        goto LABEL_39;
      }

      ftruncate(v28, v23);
      *(void *)(a1 + 16) = v23;
      uint64_t v29 = mmap(0LL, v23, 3, 1, *(_DWORD *)(a1 + 36), 0LL);
      *(void *)(a1 + 24) = v29;
      if ((unint64_t)v29 + 1 <= 1)
      {
        uint64_t memory_entry_64 = *__error();
        sub_1000067B0((uint64_t)"mmap");
        close(*(_DWORD *)(a1 + 36));
        *(_DWORD *)(a1 + 36) = -1;
        shm_unlink(__str);
        goto LABEL_27;
      }

      *(_WORD *)(a1 + _Block_object_dispose((const void *)(v41 - 160), 8) = 257;
      *(_DWORD *)(a7 + 12) = *(void *)(a1 + 16);
      int v33 = *(_DWORD *)(a1 + 36);
    }

    else
    {
      *(void *)__str = 0LL;
      vm_size_t v32 = (v23 + vm_page_size - 1) & -(uint64_t)vm_page_size;
      if (v32)
      {
        uint64_t memory_entry_64 = vm_allocate(mach_task_self_, (vm_address_t *)__str, v32, 1);
        if ((_DWORD)memory_entry_64)
        {
          sub_1000066D0((uint64_t)"vm_allocate", memory_entry_64);
          return memory_entry_64;
        }

        memory_object_size_t size = v32;
        v62 = (int *)(a1 + 32);
        uint64_t memory_entry_64 = mach_make_memory_entry_64( mach_task_self_,  &size,  *(memory_object_offset_t *)__str,  3,  (mach_port_t *)(a1 + 32),  0);
        if ((_DWORD)memory_entry_64)
        {
          vm_deallocate(mach_task_self_, *(vm_address_t *)__str, v32);
          sub_1000066D0((uint64_t)"mach_make_memory_entry_64", memory_entry_64);
          return memory_entry_64;
        }

        ++dword_10000C068;
        uint64_t v34 = *(void *)__str;
        **(_DWORD **)__str = dword_10000C068;
        int v33 = *v62;
      }

      else
      {
        int v33 = 0;
        uint64_t v34 = 0LL;
        *(_DWORD *)(a1 + 32) = 0;
      }

      *(_WORD *)(a1 + _Block_object_dispose((const void *)(v41 - 160), 8) = 257;
      *(void *)(a1 + 16) = v32;
      *(void *)(a1 + 24) = v34;
      *(_DWORD *)(a7 + 12) = v32;
    }

    *(_DWORD *)(a7 + 16) = v33;
  }

LABEL_39:
  unsigned int v39 = *((_DWORD *)v18 + 2);
  unsigned int v40 = *((_DWORD *)v18 + 3);
  char v41 = *(unsigned int **)(a1 + 24);
  *char v41 = v15;
  v41[1] = v39;
  if ((v40 & 0xF) != 0) {
    int v42 = 16 - (v40 & 0xF);
  }
  else {
    int v42 = 0;
  }
  unsigned int v43 = v42 + v40;
  v41[2] = v43;
  v41[3] = v40;
  v41[4] = a4;
  if (v15)
  {
    unint64_t v44 = 0LL;
    v45 = (char *)(v41 + 8);
    v46 = (const void **)(v18 + 16);
    do
    {
      if (*v46)
      {
        memcpy(v45, *v46, v41[3]);
        unsigned int v43 = v41[2];
      }

      v45 += v43;
      ++v44;
      v46 += 2;
    }

    while (v44 < v15);
    char v41 = *(unsigned int **)(a1 + 24);
    if (!v41) {
      return 4294967246LL;
    }
  }

  unsigned int v47 = *v41;
  v48 = *(unsigned int **)(a1 + 64);
  if (v48)
  {
    if (*v48 >= v47) {
      goto LABEL_53;
    }
    free(v48);
    *(void *)(a1 + 64) = 0LL;
  }

  v48 = (unsigned int *)malloc(16LL * (v47 - 1) + 24);
  if (!v48)
  {
    v60 = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
    v61 = std::bad_alloc::bad_alloc(v60);
  }

  *(void *)(a1 + 64) = v48;
  unsigned int *v48 = v47;
LABEL_53:
  *a5 = v48;
  v49 = *(unsigned int **)(a1 + 24);
  v50 = *(_DWORD **)(a1 + 64);
  uint64_t v51 = *v49;
  v52 = v49 + 8;
  _DWORD *v50 = v51;
  v53 = (unsigned int **)(v50 + 4);
  uint64_t v55 = v49[2];
  unsigned int v54 = v49[3];
  unsigned int v56 = v49[1];
  do
  {
    os_log_s *v53 = v52;
    v52 = (unsigned int *)((char *)v52 + v55);
    *((_DWORD *)v53 - 2) = v56;
    *((_DWORD *)v53 - 1) = v54;
    v53 += 2;
    --v51;
  }

  while (v51);
  uint64_t memory_entry_64 = 0LL;
  if (v49[4]) {
    v57 = v52;
  }
  else {
    v57 = 0LL;
  }
  *a6 = v57;
  return memory_entry_64;
}

void sub_100006204(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    sub_1000047E4(a1);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_100006228(uint64_t result)
{
  if (!(_BYTE)result)
  {
    if (os_log_type_enabled(0LL, OS_LOG_TYPE_ERROR))
    {
      int v1 = 136315394;
      uint64_t v2 = "SharedAudioBufferList.h";
      __int16 v3 = 1024;
      int v4 = 194;
      _os_log_impl( (void *)&_mh_execute_header,  0LL,  OS_LOG_TYPE_ERROR,  "%25s:%-5d ASSERTION FAILURE [(mIsServer) != 0 is false]: ",  (uint8_t *)&v1,  0x12u);
    }

    __break(1u);
  }

  return result;
}

uint64_t sub_1000062DC(void *a1)
{
  *a1 = off_1000087B8;
  uint64_t v2 = (void *)a1[8];
  if (v2)
  {
    free(v2);
    a1[8] = 0LL;
  }

  return sub_100006318((uint64_t)a1);
}

uint64_t sub_100006318(uint64_t a1)
{
  *(void *)a1 = off_100008888;
  sub_100006518(a1);
  xpc_release(*(xpc_object_t *)(a1 + 48));
  *(void *)(a1 + 4_Block_object_dispose((const void *)(v41 - 160), 8) = 0LL;
  return a1;
}

void sub_100006360(void *a1)
{
  int v1 = (void *)sub_1000062DC(a1);
  operator delete(v1);
}

void sub_100006374(XPC_Connection *a1)
{
  *(void *)a1 = off_100008790;
  uint64_t v2 = (void *)*((void *)a1 + 24);
  if (v2)
  {
    os_release(v2);
    *((void *)a1 + 24) = 0LL;
  }

  __int16 v3 = (OpaqueAudioFileID *)*((void *)a1 + 6);
  if (v3)
  {
    AudioFileClose(v3);
    int v4 = (void *)*((void *)a1 + 24);
    if (v4)
    {
      os_release(v4);
      *((void *)a1 + 24) = 0LL;
    }
  }

  sub_1000062DC((void *)a1 + 7);
  XPC_Connection::~XPC_Connection(a1);
}

void sub_1000063DC(XPC_Connection *a1)
{
  *(void *)a1 = off_100008790;
  uint64_t v2 = (void *)*((void *)a1 + 24);
  if (v2)
  {
    os_release(v2);
    *((void *)a1 + 24) = 0LL;
  }

  __int16 v3 = (OpaqueAudioFileID *)*((void *)a1 + 6);
  if (v3)
  {
    AudioFileClose(v3);
    int v4 = (void *)*((void *)a1 + 24);
    if (v4)
    {
      os_release(v4);
      *((void *)a1 + 24) = 0LL;
    }
  }

  sub_1000062DC((void *)a1 + 7);
  XPC_Connection::~XPC_Connection(a1);
  operator delete(v5);
}

uint64_t sub_100006448(uint64_t *a1)
{
  uint64_t v2 = a1[1];
  a1[1] = 0LL;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  __int16 v3 = (dispatch_object_s *)a1[2];
  if (v3)
  {
    dispatch_release(v3);
    a1[2] = 0LL;
  }

  uint64_t result = *a1;
  *a1 = 0LL;
  if (result) {
    return (*(uint64_t (**)(uint64_t))(*(void *)result + 8LL))(result);
  }
  return result;
}

xpc_type_t sub_1000064AC(uint64_t a1, xpc_object_t object)
{
  __int16 v3 = *(void **)(a1 + 32);
  xpc_type_t result = xpc_get_type(object);
  if (result == (xpc_type_t)&_xpc_type_connection) {
    return (xpc_type_t)(*(uint64_t (**)(void, xpc_object_t))(*(void *)*v3 + 16LL))(*v3, object);
  }
  return result;
}

void sub_100006504(uint64_t a1)
{
  int v1 = (void *)sub_100006318(a1);
  operator delete(v1);
}

void sub_100006518(uint64_t a1)
{
  vm_address_t v2 = *(void *)(a1 + 24);
  if (v2)
  {
    if (*(_BYTE *)(a1 + 9))
    {
      if (*(_DWORD *)(a1 + 32))
      {
        uint64_t v3 = vm_deallocate(mach_task_self_, v2, *(void *)(a1 + 16));
        if ((_DWORD)v3) {
          sub_1000066D0((uint64_t)"vm_deallocate", v3);
        }
        mach_port_name_t v4 = *(_DWORD *)(a1 + 32);
        if (v4)
        {
          uint64_t v5 = mach_port_deallocate(mach_task_self_, v4);
          if ((_DWORD)v5) {
            sub_1000066D0((uint64_t)"mach_port_deallocate", v5);
          }
        }

        *(_BYTE *)(a1 + 9) = 0;
        *(_DWORD *)(a1 + 32) = 0;
      }

      else if (xpc_get_type(*(xpc_object_t *)(a1 + 48)) == (xpc_type_t)&_xpc_type_null)
      {
        if (*(_DWORD *)(a1 + 36) != -1)
        {
          if (close(*(_DWORD *)(a1 + 36))) {
            sub_1000067B0((uint64_t)"close");
          }
          if (*(_BYTE *)(a1 + 8))
          {
            int v8 = *(_DWORD *)(a1 + 40);
            pid_t v9 = getpid();
            snprintf(__str, 0x40uLL, "AppleABL.%x.%x", v9, v8);
            if (shm_unlink(__str)) {
              sub_1000067B0((uint64_t)"shm_unlink");
            }
          }

          *(_DWORD *)(a1 + 36) = -1;
        }
      }

      else
      {
        xpc_object_t v6 = xpc_null_create();
        CFURLRef v7 = *(void **)(a1 + 48);
        *(void *)(a1 + 4_Block_object_dispose((const void *)(v41 - 160), 8) = v6;
        xpc_release(v7);
      }
    }

    else if (*(_BYTE *)(a1 + 8))
    {
      free(*(void **)(a1 + 24));
    }
  }

  *(void *)(a1 + 16) = 0LL;
  *(void *)(a1 + 24) = 0LL;
}

void sub_1000066C0(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    sub_1000047E4(a1);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_1000066D0(uint64_t a1, uint64_t a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136316162;
    xpc_object_t v6 = "SharableMemory.cpp";
    __int16 v7 = 1024;
    int v8 = 52;
    __int16 v9 = 2080;
    uint64_t v10 = a1;
    __int16 v11 = 1024;
    int v12 = a2;
    __int16 v13 = 2080;
    uint64_t v14 = mach_error_string(a2);
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "%25s:%-5d %s failed: 0x%x (%s)",  (uint8_t *)&v5,  0x2Cu);
  }

  return a2;
}

void sub_1000067B0(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    int v2 = *__error();
    int v3 = 136315906;
    mach_port_name_t v4 = "SharableMemory.cpp";
    __int16 v5 = 1024;
    int v6 = 58;
    __int16 v7 = 2080;
    uint64_t v8 = a1;
    __int16 v9 = 1024;
    int v10 = v2;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "%25s:%-5d %s failed: errno %d",  (uint8_t *)&v3,  0x22u);
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

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}