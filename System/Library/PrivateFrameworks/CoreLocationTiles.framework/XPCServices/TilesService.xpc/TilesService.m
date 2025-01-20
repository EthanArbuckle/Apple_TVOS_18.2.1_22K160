void CLTilesService::CLTilesService(CLTilesService *this)
{
  void *v2;
  dispatch_queue_attr_s *v3;
  dispatch_queue_t v4;
  void *listener;
  *(void *)this = off_10000C488;
  v2 = operator new(0x20uLL);
  v2[1] = 0LL;
  v2[2] = 0LL;
  *v2 = off_10000C4C0;
  *((_DWORD *)v2 + 6) = 31337;
  *((_OWORD *)this + 5) = 0u;
  *((void *)this + 1) = v2 + 3;
  *((void *)this + 2) = v2;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((void *)this + 8) = 0LL;
  *((_DWORD *)this + 18) = 1065353216;
  *((_OWORD *)this + 6) = 0u;
  *((_DWORD *)this + 28) = 1065353216;
  *((void *)this + 15) = 0LL;
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = dispatch_queue_create("com.apple.location.tilesservice.serialQ", v3);
  *((void *)this + 3) = v4;
  listener = (void *)xpc_connection_create_listener("com.apple.location.tilesservice", v4);
  CLTilesService::startService((uint64_t)this, (uint64_t)listener);
  xpc_release(listener);
}

void sub_100001790(_Unwind_Exception *a1)
{
}

void CLTilesService::startService(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    a1 = sub_100006F28();
LABEL_5:
    v7 = (_Unwind_Exception *)sub_100007098(a1);
    operator delete(v2);
    _Unwind_Resume(v7);
  }

  uint64_t v3 = a1;
  uint64_t v4 = *(void *)(a1 + 24);
  if (!v4) {
    goto LABEL_5;
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100001A6C;
  v8[3] = &unk_10000C428;
  v8[4] = a1;
  v6 = (CLConnectionServer *)operator new(0x30uLL);
  CLConnectionServer::CLConnectionServer(v6, a2, v4, v8);
  sub_100003FFC((CLConnectionServer **)(v3 + 32), v6);
}

uint64_t CLTilesService::CLTilesService(uint64_t a1, uint64_t a2, void *a3)
{
  *(void *)a1 = off_10000C488;
  v6 = operator new(0x20uLL);
  v6[2] = 0LL;
  void *v6 = off_10000C4C0;
  v6[1] = 0LL;
  *(void *)(a1 + 16) = v6;
  *((_DWORD *)v6 + 6) = 31337;
  *(void *)(a1 + 8) = v6 + 3;
  *(void *)(a1 + 24) = a3;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(void *)(a1 + 64) = 0LL;
  *(_DWORD *)(a1 + 72) = 1065353216;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_DWORD *)(a1 + 112) = 1065353216;
  *(void *)(a1 + 120) = 0LL;
  CLTilesService::startService(a1, a2);
  return a1;
}

void sub_100001934(_Unwind_Exception *a1)
{
}

void CLTilesService::~CLTilesService(CLTilesService *this)
{
  *((void *)this + 3) = 0LL;
  sub_100004028((uint64_t)this + 80);
  sub_100004028((uint64_t)this + 40);
  sub_100003FFC((CLConnectionServer **)this + 4, 0LL);
  sub_100003D68(this);
}

void sub_1000019C4(uint64_t a1)
{
  v2 = operator new(0x20uLL);
  v2[2] = 0LL;
  void *v2 = off_10000C4C0;
  v2[1] = 0LL;
  *((void *)&v6 + 1) = v2;
  *((_DWORD *)v2 + 6) = 31337;
  *(void *)&__int128 v6 = v2 + 3;
  sub_100003DA8(a1 + 8, &v6);
  uint64_t v3 = (std::__shared_weak_count *)*((void *)&v6 + 1);
  if (*((void *)&v6 + 1))
  {
    uint64_t v4 = (unint64_t *)(*((void *)&v6 + 1) + 8LL);
    do
      unint64_t v5 = __ldaxr(v4);
    while (__stlxr(v5 - 1, v4));
    if (!v5)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
}

void sub_100001A58(void *a1)
{
}

void sub_100001A6C(uint64_t a1, uint64_t *a2, CLConnectionMessage **a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *a2;
  *a2 = 0LL;
  sub_10000409C(&v55, v5);
  sub_100001E34(v4, &v53);
  v7 = v55;
  __int128 v6 = v56;
  if (v56)
  {
    p_shared_weak_owners = (unint64_t *)&v56->__shared_weak_owners_;
    do
      unint64_t v9 = __ldxr(p_shared_weak_owners);
    while (__stxr(v9 + 1, p_shared_weak_owners));
  }

  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3321888768LL;
  v49[2] = sub_100001EB8;
  v49[3] = &unk_10000C398;
  v49[4] = v4;
  v49[5] = v53;
  v50 = v54;
  if (v54)
  {
    v10 = &v54->__shared_weak_owners_;
    do
      unint64_t v11 = __ldxr((unint64_t *)v10);
    while (__stxr(v11 + 1, (unint64_t *)v10));
  }

  v51 = v7;
  v52 = v6;
  if (v6)
  {
    v12 = (unint64_t *)&v6->__shared_weak_owners_;
    do
      unint64_t v13 = __ldxr(v12);
    while (__stxr(v13 + 1, v12));
  }

  CLConnection::setDefaultMessageHandler(v7, v49);
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3321888768LL;
  v45[2] = sub_100002758;
  v45[3] = &unk_10000C3F8;
  v14 = v55;
  v45[4] = v4;
  v45[5] = v53;
  v46 = v54;
  if (v54)
  {
    v15 = &v54->__shared_weak_owners_;
    do
      unint64_t v16 = __ldxr((unint64_t *)v15);
    while (__stxr(v16 + 1, (unint64_t *)v15));
  }

  v47 = v7;
  v48 = v6;
  if (v6)
  {
    v17 = (unint64_t *)&v6->__shared_weak_owners_;
    do
      unint64_t v18 = __ldxr(v17);
    while (__stxr(v18 + 1, v17));
  }

  CLConnection::setInterruptionHandler(v14, v45);
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3321888768LL;
  v41[2] = sub_100002AF4;
  v41[3] = &unk_10000C3F8;
  v19 = v55;
  v41[4] = v4;
  v41[5] = v53;
  v42 = v54;
  if (v54)
  {
    v20 = &v54->__shared_weak_owners_;
    do
      unint64_t v21 = __ldxr((unint64_t *)v20);
    while (__stxr(v21 + 1, (unint64_t *)v20));
  }

  v43 = v7;
  v44 = v6;
  if (v6)
  {
    v22 = (unint64_t *)&v6->__shared_weak_owners_;
    do
      unint64_t v23 = __ldxr(v22);
    while (__stxr(v23 + 1, v22));
  }

  CLConnection::setDisconnectionHandler(v19, v41);
  CLConnection::start(v55);
  v39 = v55;
  v40 = v56;
  if (v56)
  {
    p_shared_owners = (unint64_t *)&v56->__shared_owners_;
    do
      unint64_t v25 = __ldxr(p_shared_owners);
    while (__stxr(v25 + 1, p_shared_owners));
  }

  v26 = *a3;
  v27 = a3[1];
  v38[0] = v26;
  v38[1] = v27;
  if (v27)
  {
    v28 = (unint64_t *)((char *)v27 + 8);
    do
      unint64_t v29 = __ldxr(v28);
    while (__stxr(v29 + 1, v28));
  }

  CLTilesService::handleMessage(v4, (uint64_t *)&v39, v38);
  if (v27)
  {
    v30 = (unint64_t *)((char *)v27 + 8);
    do
      unint64_t v31 = __ldaxr(v30);
    while (__stlxr(v31 - 1, v30));
    if (!v31)
    {
      (*(void (**)(CLConnectionMessage *))(*(void *)v27 + 16LL))(v27);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v27);
    }
  }

  v32 = v40;
  if (v40)
  {
    v33 = (unint64_t *)&v40->__shared_owners_;
    do
      unint64_t v34 = __ldaxr(v33);
    while (__stlxr(v34 - 1, v33));
    if (!v34)
    {
      ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
      std::__shared_weak_count::__release_weak(v32);
    }
  }

  if (v44) {
    std::__shared_weak_count::__release_weak(v44);
  }
  if (v42) {
    std::__shared_weak_count::__release_weak(v42);
  }
  if (v48) {
    std::__shared_weak_count::__release_weak(v48);
  }
  if (v46) {
    std::__shared_weak_count::__release_weak(v46);
  }
  if (v52) {
    std::__shared_weak_count::__release_weak(v52);
  }
  if (v50) {
    std::__shared_weak_count::__release_weak(v50);
  }
  if (v6) {
    std::__shared_weak_count::__release_weak(v6);
  }
  if (v54) {
    std::__shared_weak_count::__release_weak(v54);
  }
  v35 = v56;
  if (v56)
  {
    v36 = (unint64_t *)&v56->__shared_owners_;
    do
      unint64_t v37 = __ldaxr(v36);
    while (__stlxr(v37 - 1, v36));
    if (!v37)
    {
      ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
      std::__shared_weak_count::__release_weak(v35);
    }
  }

void sub_100001D8C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, char a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, std::__shared_weak_count *a20, uint64_t a21, std::__shared_weak_count *a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, std::__shared_weak_count *a29, uint64_t a30, std::__shared_weak_count *a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, std::__shared_weak_count *a38, uint64_t a39, std::__shared_weak_count *a40)
{
  if (a22) {
    std::__shared_weak_count::__release_weak(a22);
  }
  if (a20) {
    std::__shared_weak_count::__release_weak(a20);
  }
  if (a31) {
    std::__shared_weak_count::__release_weak(a31);
  }
  if (a29) {
    std::__shared_weak_count::__release_weak(a29);
  }
  if (a40) {
    std::__shared_weak_count::__release_weak(a40);
  }
  if (a38) {
    std::__shared_weak_count::__release_weak(a38);
  }
  if (v40) {
    std::__shared_weak_count::__release_weak(v40);
  }
  v43 = *(std::__shared_weak_count **)(v41 - 104);
  if (v43) {
    std::__shared_weak_count::__release_weak(v43);
  }
  sub_100003D10(v41 - 96);
  _Unwind_Resume(a1);
}

void sub_100001E34(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 16);
  if (v3)
  {
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      unint64_t v5 = __ldxr(p_shared_owners);
    while (__stxr(v5 + 1, p_shared_owners));
    *a2 = v2;
    a2[1] = v3;
    p_shared_weak_owners = (unint64_t *)&v3->__shared_weak_owners_;
    do
      unint64_t v7 = __ldxr(p_shared_weak_owners);
    while (__stxr(v7 + 1, p_shared_weak_owners));
    do
      unint64_t v8 = __ldaxr(p_shared_owners);
    while (__stlxr(v8 - 1, p_shared_owners));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }

  else
  {
    *a2 = v2;
    a2[1] = 0LL;
  }

void sub_100001EB8(void *a1, uint64_t *a2)
{
  uint64_t v2 = a1[4];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3321888768LL;
  v13[2] = sub_100001FE4;
  v13[3] = &unk_10000C368;
  uint64_t v4 = a1[7];
  uint64_t v3 = (std::__shared_weak_count *)a1[8];
  v13[4] = v2;
  v13[5] = v4;
  v14 = v3;
  if (v3)
  {
    p_shared_weak_owners = (unint64_t *)&v3->__shared_weak_owners_;
    do
      unint64_t v6 = __ldxr(p_shared_weak_owners);
    while (__stxr(v6 + 1, p_shared_weak_owners));
  }

  unint64_t v7 = (std::__shared_weak_count *)a2[1];
  uint64_t v15 = *a2;
  unint64_t v16 = v7;
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      unint64_t v9 = __ldxr(p_shared_owners);
    while (__stxr(v9 + 1, p_shared_owners));
  }

  uint64_t v10 = a1[6];
  if (v10 && *(void *)(v10 + 8) != -1LL)
  {
    sub_100001FE4(v13);
    unint64_t v7 = v16;
  }

  if (v7)
  {
    unint64_t v11 = (unint64_t *)&v7->__shared_owners_;
    do
      unint64_t v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }

  if (v14) {
    std::__shared_weak_count::__release_weak(v14);
  }
}

void sub_100001FC0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  uint64_t v17 = v16;
  sub_100003D10(v17);
  if (a16) {
    std::__shared_weak_count::__release_weak(a16);
  }
  _Unwind_Resume(a1);
}

void sub_100001FE4(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v23 = 0LL;
  v24 = 0LL;
  uint64_t v3 = (std::__shared_weak_count *)a1[6];
  if (v3)
  {
    uint64_t v4 = std::__shared_weak_count::lock(v3);
    v24 = v4;
    if (v4)
    {
      uint64_t v5 = a1[5];
      uint64_t v23 = v5;
      if (v5)
      {
        uint64_t v21 = v5;
        v22 = v4;
        p_shared_owners = (unint64_t *)&v4->__shared_owners_;
        do
          unint64_t v7 = __ldxr(p_shared_owners);
        while (__stxr(v7 + 1, p_shared_owners));
        unint64_t v8 = (CLConnectionMessage *)a1[7];
        unint64_t v9 = (CLConnectionMessage *)a1[8];
        v20[0] = v8;
        v20[1] = v9;
        if (v9)
        {
          uint64_t v10 = (unint64_t *)((char *)v9 + 8);
          do
            unint64_t v11 = __ldxr(v10);
          while (__stxr(v11 + 1, v10));
        }

        CLTilesService::handleMessage(v2, &v21, v20);
        if (v9)
        {
          unint64_t v12 = (unint64_t *)((char *)v9 + 8);
          do
            unint64_t v13 = __ldaxr(v12);
          while (__stlxr(v13 - 1, v12));
          if (!v13)
          {
            (*(void (**)(CLConnectionMessage *))(*(void *)v9 + 16LL))(v9);
            std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v9);
          }
        }

        v14 = v22;
        if (v22)
        {
          uint64_t v15 = (unint64_t *)&v22->__shared_owners_;
          do
            unint64_t v16 = __ldaxr(v15);
          while (__stlxr(v16 - 1, v15));
          if (!v16)
          {
            ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
            std::__shared_weak_count::__release_weak(v14);
          }
        }
      }
    }
  }

  uint64_t v17 = v24;
  if (v24)
  {
    unint64_t v18 = (unint64_t *)&v24->__shared_owners_;
    do
      unint64_t v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }

void sub_10000211C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13)
{
}

void CLTilesService::handleMessage(uint64_t a1, uint64_t *a2, CLConnectionMessage **a3)
{
  unint64_t v6 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  if (!*(void *)(a1 + 120)) {
    *(void *)(a1 + 120) = os_transaction_create("CLTilesService-ActiveConnection");
  }
  sub_1000041D4(a1 + 40, a2, a2);
  unint64_t v7 = (__int128 *)CLConnectionMessage::name(*a3);
  if (*((char *)v7 + 23) < 0)
  {
    sub_100003E38(__p, *(void **)v7, *((void *)v7 + 1));
  }

  else
  {
    __int128 v8 = *v7;
    uint64_t v43 = *((void *)v7 + 2);
    *(_OWORD *)__p = v8;
  }

  unint64_t v9 = _os_activity_create( (void *)&_mh_execute_header,  "CL: #TilesService handling message",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v9, &state);

  if (qword_100010AE0 != -1) {
    dispatch_once(&qword_100010AE0, &stru_10000C520);
  }
  uint64_t v10 = (os_log_s *)qword_100010AE8;
  if (os_log_type_enabled((os_log_t)qword_100010AE8, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v11 = __p;
    if (v43 < 0) {
      unint64_t v11 = (void **)__p[0];
    }
    *(_DWORD *)buf = 68289538;
    int v45 = 0;
    __int16 v46 = 2082;
    v47 = "";
    __int16 v48 = 2082;
    v49 = "activity";
    __int16 v50 = 2082;
    v51 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#TilesService handling message, event:%{public, location:escape_only}s, messageName :%{public, location:escape_only}s}",  buf,  0x26u);
  }

  if (v43 >= 0) {
    unint64_t v12 = (void *)HIBYTE(v43);
  }
  else {
    unint64_t v12 = __p[1];
  }
  if (v12 != (void *)40)
  {
    if (v12 == (void *)34)
    {
      unint64_t v13 = v43 >= 0 ? __p : (void **)__p[0];
      if (!memcmp(v13, "kCLConnectionDownloadAndDecompress", 0x22uLL))
      {
        uint64_t v14 = a2[1];
        uint64_t v39 = *a2;
        v40 = (std::__shared_weak_count *)v14;
        if (v14)
        {
          uint64_t v15 = (unint64_t *)(v14 + 8);
          do
            unint64_t v16 = __ldxr(v15);
          while (__stxr(v16 + 1, v15));
        }

        uint64_t v17 = a3[1];
        v38[0] = *a3;
        v38[1] = v17;
        if (v17)
        {
          unint64_t v18 = (unint64_t *)((char *)v17 + 8);
          do
            unint64_t v19 = __ldxr(v18);
          while (__stxr(v19 + 1, v18));
        }

        CLTilesService::handleDownloadRequest(a1, &v39, v38);
        if (v17)
        {
          v20 = (unint64_t *)((char *)v17 + 8);
          do
            unint64_t v21 = __ldaxr(v20);
          while (__stlxr(v21 - 1, v20));
          if (!v21)
          {
            (*(void (**)(CLConnectionMessage *))(*(void *)v17 + 16LL))(v17);
            std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v17);
          }
        }

        v22 = v40;
        if (v40)
        {
          p_shared_owners = (unint64_t *)&v40->__shared_owners_;
          do
            unint64_t v24 = __ldaxr(p_shared_owners);
          while (__stlxr(v24 - 1, p_shared_owners));
          if (!v24)
          {
            ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
            unint64_t v25 = v22;
LABEL_63:
            std::__shared_weak_count::__release_weak(v25);
            goto LABEL_52;
          }
        }

        goto LABEL_52;
      }
    }

LABEL_41:
    if (qword_100010AE0 != -1) {
      dispatch_once(&qword_100010AE0, &stru_10000C520);
    }
    v27 = (os_log_s *)qword_100010AE8;
    if (os_log_type_enabled((os_log_t)qword_100010AE8, OS_LOG_TYPE_FAULT))
    {
      v28 = __p;
      if (v43 < 0) {
        v28 = (void **)__p[0];
      }
      *(_DWORD *)buf = 68289282;
      int v45 = 0;
      __int16 v46 = 2082;
      v47 = "";
      __int16 v48 = 2082;
      v49 = (const char *)v28;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:#TilesService received unknown message, messageName:%{public, location:escape_only}s}",  buf,  0x1Cu);
      if (qword_100010AE0 != -1) {
        dispatch_once(&qword_100010AE0, &stru_10000C520);
      }
    }

    unint64_t v29 = (os_log_s *)qword_100010AE8;
    if (os_signpost_enabled((os_log_t)qword_100010AE8))
    {
      v30 = __p;
      if (v43 < 0) {
        v30 = (void **)__p[0];
      }
      *(_DWORD *)buf = 68289282;
      int v45 = 0;
      __int16 v46 = 2082;
      v47 = "";
      __int16 v48 = 2082;
      v49 = (const char *)v30;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v29,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "#TilesService received unknown message",  "{msg%{public}.0s:#TilesService received unknown message, messageName:%{public, location:escape_only}s}",  buf,  0x1Cu);
    }

    goto LABEL_52;
  }

  if (v43 >= 0) {
    v26 = __p;
  }
  else {
    v26 = (void **)__p[0];
  }
  if (memcmp(v26, "kCLConnectionDownloadAndDecompressCancel", 0x28uLL)) {
    goto LABEL_41;
  }
  uint64_t v31 = *a2;
  uint64_t v32 = a2[1];
  v37[0] = v31;
  v37[1] = v32;
  if (v32)
  {
    v33 = (unint64_t *)(v32 + 8);
    do
      unint64_t v34 = __ldxr(v33);
    while (__stxr(v34 + 1, v33));
  }

  CLTilesService::handleDownloadRequestCancellation(a1, v37);
  if (v32)
  {
    v35 = (unint64_t *)(v32 + 8);
    do
      unint64_t v36 = __ldaxr(v35);
    while (__stlxr(v36 - 1, v35));
    if (!v36)
    {
      (*(void (**)(uint64_t))(*(void *)v32 + 16LL))(v32);
      unint64_t v25 = (std::__shared_weak_count *)v32;
      goto LABEL_63;
    }
  }

LABEL_52:
  os_activity_scope_leave(&state);
  if (SHIBYTE(v43) < 0) {
    operator delete(__p[0]);
  }
}

void sub_1000025EC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13, uint64_t a14, os_activity_scope_state_s state, void *__p, uint64_t a17, int a18, __int16 a19, char a20, char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void *sub_10000265C(void *result, void *a2)
{
  uint64_t v2 = a2[6];
  result[5] = a2[5];
  result[6] = v2;
  if (v2)
  {
    uint64_t v3 = (unint64_t *)(v2 + 16);
    do
      unint64_t v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }

  uint64_t v5 = a2[8];
  result[7] = a2[7];
  result[8] = v5;
  if (v5)
  {
    unint64_t v6 = (unint64_t *)(v5 + 8);
    do
      unint64_t v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }

  return result;
}

void sub_1000026A0(uint64_t a1)
{
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 48);
  if (v2) {
    std::__shared_weak_count::__release_weak(v2);
  }
}

void *sub_1000026D8(void *result, void *a2)
{
  uint64_t v2 = a2[6];
  result[5] = a2[5];
  result[6] = v2;
  if (v2)
  {
    uint64_t v3 = (unint64_t *)(v2 + 16);
    do
      unint64_t v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }

  uint64_t v5 = a2[8];
  result[7] = a2[7];
  result[8] = v5;
  if (v5)
  {
    unint64_t v6 = (unint64_t *)(v5 + 16);
    do
      unint64_t v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }

  return result;
}

void sub_10000271C(uint64_t a1)
{
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 64);
  if (v2) {
    std::__shared_weak_count::__release_weak(v2);
  }
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 48);
  if (v3) {
    std::__shared_weak_count::__release_weak(v3);
  }
}

void sub_100002758(void *a1)
{
  uint64_t v2 = a1[4];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3321888768LL;
  v8[2] = sub_10000281C;
  v8[3] = &unk_10000C3C8;
  uint64_t v4 = a1[7];
  uint64_t v3 = (std::__shared_weak_count *)a1[8];
  v8[4] = v2;
  void v8[5] = v4;
  unint64_t v9 = v3;
  if (v3)
  {
    p_shared_weak_owners = (unint64_t *)&v3->__shared_weak_owners_;
    do
      unint64_t v6 = __ldxr(p_shared_weak_owners);
    while (__stxr(v6 + 1, p_shared_weak_owners));
  }

  uint64_t v7 = a1[6];
  if (v7 && *(void *)(v7 + 8) != -1LL)
  {
    sub_10000281C(v8);
    uint64_t v3 = v9;
  }

  if (v3) {
    std::__shared_weak_count::__release_weak(v3);
  }
}

void sub_100002804( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    std::__shared_weak_count::__release_weak(a16);
  }
  _Unwind_Resume(exception_object);
}

void sub_10000281C(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v16 = 0LL;
  uint64_t v17 = 0LL;
  uint64_t v3 = (std::__shared_weak_count *)a1[6];
  if (v3)
  {
    uint64_t v4 = std::__shared_weak_count::lock(v3);
    uint64_t v17 = v4;
    if (v4)
    {
      uint64_t v5 = a1[5];
      uint64_t v16 = v5;
      if (v5)
      {
        uint64_t v14 = v5;
        uint64_t v15 = v4;
        p_shared_owners = (unint64_t *)&v4->__shared_owners_;
        do
          unint64_t v7 = __ldxr(p_shared_owners);
        while (__stxr(v7 + 1, p_shared_owners));
        CLTilesService::handleConnectionDisconnection(v2, &v14);
        __int128 v8 = v15;
        if (v15)
        {
          unint64_t v9 = (unint64_t *)&v15->__shared_owners_;
          do
            unint64_t v10 = __ldaxr(v9);
          while (__stlxr(v10 - 1, v9));
          if (!v10)
          {
            ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
            std::__shared_weak_count::__release_weak(v8);
          }
        }
      }
    }
  }

  unint64_t v11 = v17;
  if (v17)
  {
    unint64_t v12 = (unint64_t *)&v17->__shared_owners_;
    do
      unint64_t v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }

void sub_1000028FC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
}

void CLTilesService::handleConnectionDisconnection(uint64_t a1, uint64_t *a2)
{
  if (qword_100010AE0 != -1) {
    dispatch_once(&qword_100010AE0, &stru_10000C520);
  }
  uint64_t v4 = (os_log_s *)qword_100010AE8;
  if (os_log_type_enabled((os_log_t)qword_100010AE8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *a2;
    uint64_t v6 = *(void *)(a1 + 64);
    *(_DWORD *)buf = 68289538;
    int v16 = 0;
    __int16 v17 = 2082;
    unint64_t v18 = "";
    __int16 v19 = 2050;
    uint64_t v20 = v5;
    __int16 v21 = 2050;
    uint64_t v22 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#TilesService removing connection from activeConnections due to client disconnection, c onnection:%{public}p, numActiveConnections:%{public}lu}",  buf,  0x26u);
  }

  sub_1000046F0((void *)(a1 + 40), a2);
  unint64_t v7 = (std::__shared_weak_count *)a2[1];
  uint64_t v13 = *a2;
  uint64_t v14 = v7;
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      unint64_t v9 = __ldxr(p_shared_owners);
    while (__stxr(v9 + 1, p_shared_owners));
  }

  CLTilesService::removeDownloadRequestForConnection(a1, &v13);
  unint64_t v10 = v14;
  if (v14)
  {
    unint64_t v11 = (unint64_t *)&v14->__shared_owners_;
    do
      unint64_t v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }

  if (!*(void *)(a1 + 64))
  {

    *(void *)(a1 + 120) = 0LL;
  }

void sub_100002AA4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t sub_100002AC0(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(result + 48) = v2;
  if (v2)
  {
    uint64_t v3 = (unint64_t *)(v2 + 16);
    do
      unint64_t v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }

  return result;
}

void sub_100002AE4(uint64_t a1)
{
  v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1) {
    std::__shared_weak_count::__release_weak(v1);
  }
}

void sub_100002AF4(void *a1)
{
  uint64_t v2 = a1[4];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3321888768LL;
  v8[2] = sub_100002BB8;
  v8[3] = &unk_10000C3C8;
  uint64_t v4 = a1[7];
  uint64_t v3 = (std::__shared_weak_count *)a1[8];
  v8[4] = v2;
  void v8[5] = v4;
  unint64_t v9 = v3;
  if (v3)
  {
    p_shared_weak_owners = (unint64_t *)&v3->__shared_weak_owners_;
    do
      unint64_t v6 = __ldxr(p_shared_weak_owners);
    while (__stxr(v6 + 1, p_shared_weak_owners));
  }

  uint64_t v7 = a1[6];
  if (v7 && *(void *)(v7 + 8) != -1LL)
  {
    sub_100002BB8(v8);
    uint64_t v3 = v9;
  }

  if (v3) {
    std::__shared_weak_count::__release_weak(v3);
  }
}

void sub_100002BA0( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    std::__shared_weak_count::__release_weak(a16);
  }
  _Unwind_Resume(exception_object);
}

void sub_100002BB8(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v16 = 0LL;
  __int16 v17 = 0LL;
  uint64_t v3 = (std::__shared_weak_count *)a1[6];
  if (v3)
  {
    uint64_t v4 = std::__shared_weak_count::lock(v3);
    __int16 v17 = v4;
    if (v4)
    {
      uint64_t v5 = a1[5];
      uint64_t v16 = v5;
      if (v5)
      {
        uint64_t v14 = v5;
        uint64_t v15 = v4;
        p_shared_owners = (unint64_t *)&v4->__shared_owners_;
        do
          unint64_t v7 = __ldxr(p_shared_owners);
        while (__stxr(v7 + 1, p_shared_owners));
        CLTilesService::handleConnectionDisconnection(v2, &v14);
        __int128 v8 = v15;
        if (v15)
        {
          unint64_t v9 = (unint64_t *)&v15->__shared_owners_;
          do
            unint64_t v10 = __ldaxr(v9);
          while (__stlxr(v10 - 1, v9));
          if (!v10)
          {
            ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
            std::__shared_weak_count::__release_weak(v8);
          }
        }
      }
    }
  }

  unint64_t v11 = v17;
  if (v17)
  {
    unint64_t v12 = (unint64_t *)&v17->__shared_owners_;
    do
      unint64_t v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }

void sub_100002C98( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
}

void CLTilesService::handleDownloadRequest(uint64_t a1, uint64_t *a2, CLConnectionMessage **a3)
{
  uint64_t v6 = *a2;
  sub_100003F4C(buf, "com.apple.location.tilesservice.downloads");
  char isEntitled = CLConnection::isEntitled(v6, buf);
  char v8 = isEntitled;
  if ((v44[15] & 0x80000000) != 0)
  {
    operator delete(*(void **)buf);
    if ((v8 & 1) != 0)
    {
LABEL_3:
      unint64_t v9 = *a3;
      unint64_t v10 = (CLTileDownloadRequest *)objc_opt_class(&OBJC_CLASS___NSMutableURLRequest);
      unint64_t v11 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v10,  objc_opt_class(&OBJC_CLASS___NSURL),  0LL);
      DictionaryOfClasses = (void *)CLConnectionMessage::getDictionaryOfClasses(v9, v11);
      id v13 = DictionaryOfClasses;
      if (DictionaryOfClasses)
      {
        unint64_t v9 = (CLConnectionMessage *)[DictionaryOfClasses objectForKey:@"kCLConnectionDownloadAndDecompressDestinationURLKey"];
        if (v9)
        {
          id v13 = [v13 objectForKey:@"kCLConnectionDownloadAndDecompressRequestKey"];
          if (v13)
          {
            unint64_t v10 = -[CLTileDownloadRequest initWithQueue:]( objc_alloc(&OBJC_CLASS___CLTileDownloadRequest),  "initWithQueue:",  *(void *)(a1 + 24));
            uint64_t v14 = a2[1];
            *(void *)buf = *a2;
            *(void *)v44 = v14;
            if (v14)
            {
              uint64_t v15 = (unint64_t *)(v14 + 8);
              do
                unint64_t v16 = __ldxr(v15);
              while (__stxr(v16 + 1, v15));
            }

            *(void *)&v44[8] = v10;
            sub_100004ABC(a1 + 80, buf, buf);
            __int16 v17 = *(std::__shared_weak_count **)v44;
            if (*(void *)v44)
            {
              unint64_t v18 = (unint64_t *)(*(void *)v44 + 8LL);
              do
                unint64_t v19 = __ldaxr(v18);
              while (__stlxr(v19 - 1, v18));
              if (!v19)
              {
                ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
                std::__shared_weak_count::__release_weak(v17);
              }
            }

            if (qword_100010AE0 == -1)
            {
LABEL_15:
              uint64_t v20 = (os_log_s *)qword_100010AE8;
              if (os_log_type_enabled((os_log_t)qword_100010AE8, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v21 = *a2;
                [v13 timeoutInterval];
                uint64_t v23 = v22;
                unsigned int v24 = [v13 allowsCellularAccess];
                uint64_t v25 = *(void *)(a1 + 104);
                *(_DWORD *)buf = 68290563;
                *(_DWORD *)&uint8_t buf[4] = 0;
                *(_WORD *)v44 = 2082;
                *(void *)&v44[2] = "";
                *(_WORD *)&v44[10] = 2050;
                *(void *)&v44[12] = v21;
                __int16 v45 = 2050;
                uint64_t v46 = v23;
                __int16 v47 = 1026;
                unsigned int v48 = v24;
                __int16 v49 = 2113;
                id v50 = v13;
                __int16 v51 = 2113;
                v52 = v9;
                __int16 v53 = 2050;
                uint64_t v54 = v25;
                _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#TilesService starting download request, connection:%{public}p, tim eout:%{public}f, allowsCellular:%{public}hhd, request:%{private, location:escape_only}@, destination:%{private, location:escape_only}@, numCurrentDownloads:%{public}lu}",  buf,  0x4Au);
              }

              v39[0] = _NSConcreteStackBlock;
              v39[1] = 3321888768LL;
              v39[2] = sub_100003690;
              v39[3] = &unk_10000C448;
              uint64_t v27 = *a2;
              v26 = (std::__shared_weak_count *)a2[1];
              v39[4] = a1;
              v39[5] = v27;
              v40 = v26;
              if (v26)
              {
                p_shared_owners = (unint64_t *)&v26->__shared_owners_;
                do
                  unint64_t v29 = __ldxr(p_shared_owners);
                while (__stxr(v29 + 1, p_shared_owners));
              }

              -[CLTileDownloadRequest downloadWithURLRequest:withDecompressionURL:completionHandler:]( v10,  "downloadWithURLRequest:withDecompressionURL:completionHandler:",  v13,  v9,  v39);
              v30 = v40;
              if (v40)
              {
                uint64_t v31 = (unint64_t *)&v40->__shared_owners_;
                do
                  unint64_t v32 = __ldaxr(v31);
                while (__stlxr(v32 - 1, v31));
LABEL_35:
                if (!v32)
                {
                  ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
                  std::__shared_weak_count::__release_weak(v30);
                }

                return;
              }

              return;
            }

LABEL_42:
            dispatch_once(&qword_100010AE0, &stru_10000C520);
            goto LABEL_15;
          }

          sub_1000074E8();
        }

        else
        {
          sub_100007378();
        }
      }

      else
      {
        sub_100007208();
      }

      __break(1u);
      goto LABEL_42;
    }
  }

  else if ((isEntitled & 1) != 0)
  {
    goto LABEL_3;
  }

  if (qword_100010AE0 != -1) {
    dispatch_once(&qword_100010AE0, &stru_10000C520);
  }
  v33 = (os_log_s *)qword_100010AE8;
  if (os_log_type_enabled((os_log_t)qword_100010AE8, OS_LOG_TYPE_ERROR))
  {
    uint64_t v34 = *a2;
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&uint8_t buf[4] = 0;
    *(_WORD *)v44 = 2082;
    *(void *)&v44[2] = "";
    *(_WORD *)&v44[10] = 2050;
    *(void *)&v44[12] = v34;
    _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_ERROR,  "{msg%{public}.0s:#TilesService connection lacks proper entitlement., connection:%{public}p}",  buf,  0x1Cu);
    if (qword_100010AE0 != -1) {
      dispatch_once(&qword_100010AE0, &stru_10000C520);
    }
  }

  v35 = (os_log_s *)qword_100010AE8;
  if (os_signpost_enabled((os_log_t)qword_100010AE8))
  {
    uint64_t v36 = *a2;
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&uint8_t buf[4] = 0;
    *(_WORD *)v44 = 2082;
    *(void *)&v44[2] = "";
    *(_WORD *)&v44[10] = 2050;
    *(void *)&v44[12] = v36;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v35,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "#TilesService connection lacks proper entitlement.",  "{msg%{public}.0s:#TilesService connection lacks proper entitlement., connection:%{public}p}",  buf,  0x1Cu);
  }

  *(void *)buf = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"kCLTileErrorDomain",  3LL,  0LL);
  uint64_t v37 = *a2;
  sub_10000495C("kCLConnectionDownloadAndDecompressError", buf, &v41);
  CLConnection::sendMessage(v37, &v41);
  v30 = v42;
  if (v42)
  {
    v38 = (unint64_t *)&v42->__shared_owners_;
    do
      unint64_t v32 = __ldaxr(v38);
    while (__stlxr(v32 - 1, v38));
    goto LABEL_35;
  }

void sub_1000031A4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20, void *__p, uint64_t a22, int a23, __int16 a24, char a25, char a26)
{
}

void CLTilesService::handleDownloadRequestCancellation(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  sub_100003F4C(&__p, "com.apple.location.tilesservice.downloads");
  char isEntitled = CLConnection::isEntitled(v4, &__p);
  char v6 = isEntitled;
  if (SBYTE3(v27) < 0)
  {
    operator delete(__p);
    if ((v6 & 1) != 0)
    {
LABEL_3:
      unint64_t v7 = (std::__shared_weak_count *)a2[1];
      uint64_t v19 = *a2;
      uint64_t v20 = v7;
      if (v7)
      {
        p_shared_owners = (unint64_t *)&v7->__shared_owners_;
        do
          unint64_t v9 = __ldxr(p_shared_owners);
        while (__stxr(v9 + 1, p_shared_owners));
      }

      CLTilesService::removeDownloadRequestForConnection(a1, &v19);
      unint64_t v10 = v20;
      if (v20)
      {
        unint64_t v11 = (unint64_t *)&v20->__shared_owners_;
        do
          unint64_t v12 = __ldaxr(v11);
        while (__stlxr(v12 - 1, v11));
LABEL_21:
        if (!v12)
        {
          ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
          std::__shared_weak_count::__release_weak(v10);
        }

        return;
      }

      return;
    }
  }

  else if ((isEntitled & 1) != 0)
  {
    goto LABEL_3;
  }

  if (qword_100010AE0 != -1) {
    dispatch_once(&qword_100010AE0, &stru_10000C520);
  }
  id v13 = (os_log_s *)qword_100010AE8;
  if (os_log_type_enabled((os_log_t)qword_100010AE8, OS_LOG_TYPE_ERROR))
  {
    uint64_t v14 = *a2;
    __p = (void *)68289282;
    __int16 v24 = 2082;
    uint64_t v25 = "";
    __int16 v26 = 2050;
    uint64_t v27 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "{msg%{public}.0s:#TilesService connection lacks proper entitlement., connection:%{public}p}",  (uint8_t *)&__p,  0x1Cu);
    if (qword_100010AE0 != -1) {
      dispatch_once(&qword_100010AE0, &stru_10000C520);
    }
  }

  uint64_t v15 = (os_log_s *)qword_100010AE8;
  if (os_signpost_enabled((os_log_t)qword_100010AE8))
  {
    uint64_t v16 = *a2;
    __p = (void *)68289282;
    __int16 v24 = 2082;
    uint64_t v25 = "";
    __int16 v26 = 2050;
    uint64_t v27 = v16;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v15,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "#TilesService connection lacks proper entitlement.",  "{msg%{public}.0s:#TilesService connection lacks proper entitlement., connection:%{public}p}",  (uint8_t *)&__p,  0x1Cu);
  }

  __p = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"kCLTileErrorDomain",  3LL,  0LL);
  uint64_t v17 = *a2;
  sub_10000495C("kCLConnectionDownloadAndDecompressError", &__p, &v21);
  CLConnection::sendMessage(v17, &v21);
  unint64_t v10 = v22;
  if (v22)
  {
    unint64_t v18 = (unint64_t *)&v22->__shared_owners_;
    do
      unint64_t v12 = __ldaxr(v18);
    while (__stlxr(v12 - 1, v18));
    goto LABEL_21;
  }

void sub_100003498( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, char a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
}

void CLTilesService::removeDownloadRequestForConnection(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = (void *)(a1 + 80);
  uint64_t v5 = sub_10000473C((void *)(a1 + 80), a2);
  if (v5)
  {
    char v6 = v5;
    unint64_t v7 = (std::__shared_weak_count *)v5[3];
    if (v7)
    {
      p_shared_owners = (unint64_t *)&v7->__shared_owners_;
      do
        unint64_t v9 = __ldxr(p_shared_owners);
      while (__stxr(v9 + 1, p_shared_owners));
    }

    unint64_t v10 = (void *)v5[4];
    if (qword_100010AE0 != -1) {
      dispatch_once(&qword_100010AE0, &stru_10000C520);
    }
    unint64_t v11 = (os_log_s *)qword_100010AE8;
    if (os_log_type_enabled((os_log_t)qword_100010AE8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v12 = *a2;
      *(_DWORD *)buf = 68289282;
      int v16 = 0;
      __int16 v17 = 2082;
      unint64_t v18 = "";
      __int16 v19 = 2050;
      uint64_t v20 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:#TilesService removing connection from fDownloadRequestsMap, connection:%{public}p}",  buf,  0x1Cu);
    }

    [v10 cancel];

    sub_100004828(v4, v6, (uint64_t)buf);
    sub_1000046AC((uint64_t)buf, 0LL);
    if (v7)
    {
      id v13 = (unint64_t *)&v7->__shared_owners_;
      do
        unint64_t v14 = __ldaxr(v13);
      while (__stlxr(v14 - 1, v13));
      if (!v14)
      {
        ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
        std::__shared_weak_count::__release_weak(v7);
      }
    }
  }

void sub_10000367C(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

void sub_100003690(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5 = a1[4];
  uint64_t v7 = a1[5];
  char v6 = (std::__shared_weak_count *)a1[6];
  uint64_t v13 = v7;
  unint64_t v14 = v6;
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      unint64_t v9 = __ldxr(p_shared_owners);
    while (__stxr(v9 + 1, p_shared_owners));
  }

  CLTilesService::handleDownloadRequestCallback(v5, &v13, a2, a3, a4);
  unint64_t v10 = v14;
  if (v14)
  {
    unint64_t v11 = (unint64_t *)&v14->__shared_owners_;
    do
      unint64_t v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }

void sub_100003724( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void CLTilesService::handleDownloadRequestCallback( uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v48 = a5;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
  if (sub_10000473C((void *)(a1 + 40), a2))
  {
    uint64_t v44 = 0LL;
    __int16 v45 = 0LL;
    if (a5)
    {
      sub_10000495C("kCLConnectionDownloadAndDecompressError", &v48, buf);
    }

    else
    {
      v49[0] = @"kCLConnectionDownloadAndDecompressFileKey";
      v49[1] = @"kCLConnectionDownloadAndDecompressURLResponseKey";
      v50[0] = a3;
      v50[1] = a4;
      uint64_t v43 = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v50,  v49,  2LL);
      sub_100004D68("kCLConnectionDownloadAndDecompressSuccess", &v43, buf);
    }

    uint64_t v22 = *(void *)buf;
    uint64_t v21 = *(std::__shared_weak_count **)v52;
    uint64_t v44 = *(void *)buf;
    __int16 v45 = *(std::__shared_weak_count **)v52;
    if (*(void *)buf)
    {
      if (qword_100010AE0 == -1) {
        goto LABEL_21;
      }
    }

    else
    {
      sub_100007658(qword_100010AE0 == -1);
      abort_report_np( "%s:%d: assertion failure in %s",  "/Library/Caches/com.apple.xbs/Sources/CoreLocation/CoreLocationTiles/TilesService/CLTilesService.mm",  233,  "handleDownloadRequestCallback");
      __break(1u);
    }

    dispatch_once(&qword_100010AE0, &stru_10000C520);
LABEL_21:
    uint64_t v23 = (os_log_s *)qword_100010AE8;
    if (os_log_type_enabled((os_log_t)qword_100010AE8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v24 = *a2;
      id v25 = [v48 description];
      *(_DWORD *)buf = 68290051;
      *(_WORD *)v52 = 2082;
      *(_DWORD *)&uint8_t buf[4] = 0;
      *(void *)&v52[2] = "";
      __int16 v53 = 2050;
      uint64_t v54 = v24;
      __int16 v55 = 2113;
      uint64_t v56 = a3;
      __int16 v57 = 2113;
      uint64_t v58 = a4;
      __int16 v59 = 2113;
      id v60 = v25;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:#TilesService sending response for download request, connection:%{public}p, d ecompressedFile:%{private, location:escape_only}@, response:%{private, location:escape_only}@, error:% {private, location:escape_only}@}",  buf,  0x3Au);
    }

    uint64_t v26 = *a2;
    uint64_t v41 = v22;
    v42 = v21;
    if (v21)
    {
      p_shared_owners = (unint64_t *)&v21->__shared_owners_;
      do
        unint64_t v28 = __ldxr(p_shared_owners);
      while (__stxr(v28 + 1, p_shared_owners));
    }

    CLConnection::sendMessage(v26, &v41);
    unint64_t v29 = v42;
    if (v42)
    {
      v30 = (unint64_t *)&v42->__shared_owners_;
      do
        unint64_t v31 = __ldaxr(v30);
      while (__stlxr(v31 - 1, v30));
      if (!v31)
      {
        ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
        std::__shared_weak_count::__release_weak(v29);
      }
    }

    unint64_t v32 = (std::__shared_weak_count *)a2[1];
    uint64_t v39 = *a2;
    v40 = v32;
    if (v32)
    {
      v33 = (unint64_t *)&v32->__shared_owners_;
      do
        unint64_t v34 = __ldxr(v33);
      while (__stxr(v34 + 1, v33));
    }

    CLTilesService::removeDownloadRequestForConnection(a1, &v39);
    v35 = v40;
    if (v40)
    {
      uint64_t v36 = (unint64_t *)&v40->__shared_owners_;
      do
        unint64_t v37 = __ldaxr(v36);
      while (__stlxr(v37 - 1, v36));
      if (!v37)
      {
        ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
        std::__shared_weak_count::__release_weak(v35);
      }
    }

    unint64_t v18 = v45;
    if (v45)
    {
      v38 = (unint64_t *)&v45->__shared_owners_;
      do
        unint64_t v20 = __ldaxr(v38);
      while (__stlxr(v20 - 1, v38));
LABEL_42:
      if (!v20)
      {
        ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
        std::__shared_weak_count::__release_weak(v18);
      }

      return;
    }

    return;
  }

  if (qword_100010AE0 != -1) {
    dispatch_once(&qword_100010AE0, &stru_10000C520);
  }
  unint64_t v10 = (os_log_s *)qword_100010AE8;
  if (os_log_type_enabled((os_log_t)qword_100010AE8, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = *a2;
    *(_DWORD *)buf = 68290051;
    *(_WORD *)v52 = 2082;
    *(_DWORD *)&uint8_t buf[4] = 0;
    *(void *)&v52[2] = "";
    __int16 v53 = 2050;
    uint64_t v54 = v11;
    __int16 v55 = 2113;
    uint64_t v56 = a3;
    __int16 v57 = 2113;
    uint64_t v58 = a4;
    __int16 v59 = 2113;
    id v60 = [a5 description];
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "{msg%{public}.0s:#TilesService dropping response to connection due to it not being active anymore, conne ction:%{public}p, decompressedFile:%{private, location:escape_only}@, response:%{private, location:e scape_only}@, error:%{private, location:escape_only}@}",  buf,  0x3Au);
    if (qword_100010AE0 != -1) {
      dispatch_once(&qword_100010AE0, &stru_10000C520);
    }
  }

  unint64_t v12 = (os_log_s *)qword_100010AE8;
  if (os_signpost_enabled((os_log_t)qword_100010AE8))
  {
    uint64_t v13 = *a2;
    id v14 = [v48 description];
    *(_DWORD *)buf = 68290051;
    *(_WORD *)v52 = 2082;
    *(_DWORD *)&uint8_t buf[4] = 0;
    *(void *)&v52[2] = "";
    __int16 v53 = 2050;
    uint64_t v54 = v13;
    __int16 v55 = 2113;
    uint64_t v56 = a3;
    __int16 v57 = 2113;
    uint64_t v58 = a4;
    __int16 v59 = 2113;
    id v60 = v14;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v12,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "#TilesService dropping response to connection due to it not being active anymore",  "{msg%{public}.0s:#TilesService dropping response to connection due to it not being active anymore, conne ction:%{public}p, decompressedFile:%{private, location:escape_only}@, response:%{private, location:e scape_only}@, error:%{private, location:escape_only}@}",  buf,  0x3Au);
  }

  uint64_t v15 = (std::__shared_weak_count *)a2[1];
  uint64_t v46 = *a2;
  __int16 v47 = v15;
  if (v15)
  {
    int v16 = (unint64_t *)&v15->__shared_owners_;
    do
      unint64_t v17 = __ldxr(v16);
    while (__stxr(v17 + 1, v16));
  }

  CLTilesService::removeDownloadRequestForConnection(a1, &v46);
  unint64_t v18 = v47;
  if (v47)
  {
    __int16 v19 = (unint64_t *)&v47->__shared_owners_;
    do
      unint64_t v20 = __ldaxr(v19);
    while (__stlxr(v20 - 1, v19));
    goto LABEL_42;
  }

void sub_100003C0C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_100003C68(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(result + 48) = v2;
  if (v2)
  {
    uint64_t v3 = (unint64_t *)(v2 + 8);
    do
      unint64_t v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }

  return result;
}

uint64_t sub_100003C8C(uint64_t a1)
{
  return sub_100003D10(a1 + 40);
}

void sub_100003C94(void *a1)
{
  v1 = sub_100003D68(a1);
  operator delete(v1);
}

void sub_100003CA8()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

void sub_100003CD0(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_10000C4C0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_100003CE4(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)off_10000C4C0;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t sub_100003D10(uint64_t a1)
{
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 8);
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      unint64_t v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }

  return a1;
}

void *sub_100003D68(void *a1)
{
  *a1 = off_10000C488;
  sub_1000019C4((uint64_t)a1);
  sub_100003D10((uint64_t)(a1 + 1));
  return a1;
}

uint64_t sub_100003DA8(uint64_t a1, __int128 *a2)
{
  __int128 v3 = *a2;
  *(void *)a2 = 0LL;
  *((void *)a2 + 1) = 0LL;
  unint64_t v4 = *(std::__shared_weak_count **)(a1 + 8);
  *(_OWORD *)a1 = v3;
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      unint64_t v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }

  return a1;
}

void sub_100003E0C(id a1)
{
  qword_100010AE8 = (uint64_t)os_log_create("com.apple.location.TilesService", "TilesService");
}

void *sub_100003E38(_BYTE *__dst, void *__src, unint64_t a3)
{
  uint64_t v5 = __dst;
  if (a3 > 0x16)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8LL) {
      sub_100003EC4();
    }
    uint64_t v6 = (a3 & 0xFFFFFFFFFFFFFFF8LL) + 8;
    if ((a3 | 7) != 0x17) {
      uint64_t v6 = a3 | 7;
    }
    uint64_t v7 = v6 + 1;
    char v8 = operator new(v6 + 1);
    v5[1] = a3;
    v5[2] = v7 | 0x8000000000000000LL;
    *uint64_t v5 = v8;
    uint64_t v5 = v8;
  }

  else
  {
    __dst[23] = a3;
  }

  return memmove(v5, __src, a3 + 1);
}

void sub_100003EC4()
{
}

void sub_100003ED8(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_100003F28(exception, a1);
}

void sub_100003F14(_Unwind_Exception *a1)
{
}

std::logic_error *sub_100003F28(std::logic_error *a1, const char *a2)
{
  result = std::logic_error::logic_error(a1, a2);
  return result;
}

void *sub_100003F4C(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8LL) {
    sub_100003EC4();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8LL) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000LL;
    *a1 = v6;
  }

  else
  {
    *((_BYTE *)a1 + 23) = v4;
    uint64_t v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }

  memmove(v6, __s, v5);
LABEL_9:
  *((_BYTE *)v6 + v5) = 0;
  return a1;
}

void sub_100003FFC(CLConnectionServer **a1, CLConnectionServer *a2)
{
  __int128 v3 = *a1;
  *a1 = a2;
  if (v3)
  {
    CLConnectionServer::~CLConnectionServer(v3);
    operator delete(v4);
  }

uint64_t sub_100004028(uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = 0LL;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void sub_100004060(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v2 = a2;
    do
    {
      __int128 v3 = (void *)*v2;
      sub_100003D10((uint64_t)(v2 + 2));
      operator delete(v2);
      uint64_t v2 = v3;
    }

    while (v3);
  }

void *sub_10000409C(void *a1, uint64_t a2)
{
  *a1 = a2;
  size_t v4 = operator new(0x20uLL);
  *size_t v4 = &off_10000C550;
  v4[1] = 0LL;
  v4[2] = 0LL;
  v4[3] = a2;
  a1[1] = v4;
  return a1;
}

void sub_1000040E4(void *a1)
{
  if (v1) {
    CLConnection::deferredDelete(v1);
  }
  __cxa_rethrow();
}

void sub_1000040FC(_Unwind_Exception *a1)
{
}

void sub_100004114(std::__shared_weak_count *a1)
{
}

CLConnection *sub_100004128(uint64_t a1)
{
  result = *(CLConnection **)(a1 + 24);
  if (result) {
    return (CLConnection *)CLConnection::deferredDelete(result);
  }
  return result;
}

uint64_t sub_100004148(uint64_t a1, uint64_t a2)
{
  else {
    return 0LL;
  }
}

BOOL sub_100004188(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a2 + 8);
  if (v2 == v3) {
    return 1LL;
  }
  if ((v3 & v2) < 0 != __OFSUB__(v2, v3)) {
    return strcmp((const char *)(v2 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL)) == 0;
  }
  return 0LL;
}

void *sub_1000041D4(uint64_t a1, void *a2, void *a3)
{
  unint64_t v6 = 0x9DDFEA08EB382D69LL * ((8 * *a2 + 8LL) ^ HIDWORD(*a2));
  unint64_t v7 = 0x9DDFEA08EB382D69LL * (HIDWORD(*a2) ^ (v6 >> 47) ^ v6);
  unint64_t v8 = 0x9DDFEA08EB382D69LL * (v7 ^ (v7 >> 47));
  unint64_t v9 = *(void *)(a1 + 8);
  if (v9)
  {
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      unint64_t v3 = 0x9DDFEA08EB382D69LL * (v7 ^ (v7 >> 47));
      if (v8 >= v9) {
        unint64_t v3 = v8 % v9;
      }
    }

    else
    {
      unint64_t v3 = v8 & (v9 - 1);
    }

    uint64_t v11 = *(void **)(*(void *)a1 + 8 * v3);
    if (v11)
    {
      unint64_t v12 = (void *)*v11;
      if (*v11)
      {
        do
        {
          unint64_t v13 = v12[1];
          if (v13 == v8)
          {
            if (v12[2] == *a2) {
              return v12;
            }
          }

          else
          {
            if (v10.u32[0] > 1uLL)
            {
              if (v13 >= v9) {
                v13 %= v9;
              }
            }

            else
            {
              v13 &= v9 - 1;
            }

            if (v13 != v3) {
              break;
            }
          }

          unint64_t v12 = (void *)*v12;
        }

        while (v12);
      }
    }
  }

  uint64_t v14 = a1 + 16;
  uint64_t v15 = operator new(0x20uLL);
  v28[0] = v15;
  v28[1] = a1 + 16;
  void *v15 = 0LL;
  v15[1] = v8;
  uint64_t v16 = a3[1];
  v15[2] = *a3;
  v15[3] = v16;
  if (v16)
  {
    unint64_t v17 = (unint64_t *)(v16 + 8);
    do
      unint64_t v18 = __ldxr(v17);
    while (__stxr(v18 + 1, v17));
  }

  char v29 = 1;
  float v19 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v20 = *(float *)(a1 + 32);
  if (!v9 || (float)(v20 * (float)v9) < v19)
  {
    BOOL v21 = 1LL;
    if (v9 >= 3) {
      BOOL v21 = (v9 & (v9 - 1)) != 0;
    }
    unint64_t v22 = v21 | (2 * v9);
    unint64_t v23 = vcvtps_u32_f32(v19 / v20);
    if (v22 <= v23) {
      size_t v24 = v23;
    }
    else {
      size_t v24 = v22;
    }
    sub_100004478(a1, v24);
    unint64_t v9 = *(void *)(a1 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v8 >= v9) {
        unint64_t v3 = v8 % v9;
      }
      else {
        unint64_t v3 = v8;
      }
    }

    else
    {
      unint64_t v3 = (v9 - 1) & v8;
    }
  }

  id v25 = *(void **)(*(void *)a1 + 8 * v3);
  if (v25)
  {
    *(void *)v28[0] = *v25;
    *id v25 = v28[0];
  }

  else
  {
    *(void *)v28[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v28[0];
    *(void *)(*(void *)a1 + 8 * v3) = v14;
    if (*(void *)v28[0])
    {
      unint64_t v26 = *(void *)(*(void *)v28[0] + 8LL);
      if ((v9 & (v9 - 1)) != 0)
      {
        if (v26 >= v9) {
          v26 %= v9;
        }
      }

      else
      {
        v26 &= v9 - 1;
      }

      *(void *)(*(void *)a1 + 8 * v26) = v28[0];
    }
  }

  unint64_t v12 = (void *)v28[0];
  v28[0] = 0LL;
  ++*(void *)(a1 + 24);
  sub_1000046AC((uint64_t)v28, 0LL);
  return v12;
}

void sub_100004460(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

void sub_100004478(uint64_t a1, size_t __n)
{
  if (__n == 1)
  {
    size_t prime = 2LL;
  }

  else
  {
    size_t prime = __n;
    if ((__n & (__n - 1)) != 0) {
      size_t prime = std::__next_prime(__n);
    }
  }

  int8x8_t v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(void *)&v4) {
    goto LABEL_16;
  }
  if (prime < *(void *)&v4)
  {
    unint64_t v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      unint64_t v5 = std::__next_prime(v5);
    }

    else
    {
      uint64_t v7 = 1LL << -(char)__clz(v5 - 1);
      if (v5 >= 2) {
        unint64_t v5 = v7;
      }
    }

    if (prime <= v5) {
      size_t prime = v5;
    }
    if (prime < *(void *)&v4) {
LABEL_16:
    }
      sub_100004554(a1, prime);
  }

void sub_100004554(uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    if (a2 >> 61) {
      sub_100003CA8();
    }
    int8x8_t v4 = operator new(8 * a2);
    unint64_t v5 = *(void **)a1;
    *(void *)a1 = v4;
    if (v5) {
      operator delete(v5);
    }
    uint64_t v6 = 0LL;
    *(void *)(a1 + 8) = a2;
    do
      *(void *)(*(void *)a1 + 8 * v6++) = 0LL;
    while (a2 != v6);
    uint64_t v7 = *(void **)(a1 + 16);
    if (v7)
    {
      unint64_t v8 = v7[1];
      uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2) {
          v8 %= a2;
        }
      }

      else
      {
        v8 &= a2 - 1;
      }

      *(void *)(*(void *)a1 + 8 * v8) = a1 + 16;
      uint64_t v11 = (void *)*v7;
      if (*v7)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= a2) {
              v12 %= a2;
            }
          }

          else
          {
            v12 &= a2 - 1;
          }

          if (v12 != v8)
          {
            if (!*(void *)(*(void *)a1 + 8 * v12))
            {
              *(void *)(*(void *)a1 + 8 * v12) = v7;
              goto LABEL_24;
            }

            void *v7 = *v11;
            *uint64_t v11 = **(void **)(*(void *)a1 + 8 * v12);
            **(void **)(*(void *)a1 + 8 * v12) = v11;
            uint64_t v11 = v7;
          }

          unint64_t v12 = v8;
LABEL_24:
          uint64_t v7 = v11;
          uint64_t v11 = (void *)*v11;
          unint64_t v8 = v12;
        }

        while (v11);
      }
    }
  }

  else
  {
    uint8x8_t v10 = *(void **)a1;
    *(void *)a1 = 0LL;
    if (v10) {
      operator delete(v10);
    }
    *(void *)(a1 + 8) = 0LL;
  }

void sub_1000046AC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = a2;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16)) {
      sub_100003D10((uint64_t)v2 + 16);
    }
    operator delete(v2);
  }

uint64_t sub_1000046F0(void *a1, void *a2)
{
  uint64_t result = (uint64_t)sub_10000473C(a1, a2);
  if (result)
  {
    sub_100004828(a1, (void *)result, (uint64_t)v4);
    sub_1000046AC((uint64_t)v4, 0LL);
    return 1LL;
  }

  return result;
}

void *sub_10000473C(void *a1, void *a2)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  if (!*(void *)&v2) {
    return 0LL;
  }
  unint64_t v3 = 0x9DDFEA08EB382D69LL * ((8 * *a2 + 8LL) ^ HIDWORD(*a2));
  unint64_t v4 = 0x9DDFEA08EB382D69LL * (HIDWORD(*a2) ^ (v3 >> 47) ^ v3);
  unint64_t v5 = 0x9DDFEA08EB382D69LL * (v4 ^ (v4 >> 47));
  uint8x8_t v6 = (uint8x8_t)vcnt_s8(v2);
  v6.i16[0] = vaddlv_u8(v6);
  if (v6.u32[0] > 1uLL)
  {
    unint64_t v7 = v5;
    if (v5 >= *(void *)&v2) {
      unint64_t v7 = v5 % *(void *)&v2;
    }
  }

  else
  {
    unint64_t v7 = v5 & (*(void *)&v2 - 1LL);
  }

  unint64_t v8 = *(void **)(*a1 + 8 * v7);
  if (!v8) {
    return 0LL;
  }
  uint64_t result = (void *)*v8;
  if (*v8)
  {
    do
    {
      unint64_t v10 = result[1];
      if (v10 == v5)
      {
        if (result[2] == *a2) {
          return result;
        }
      }

      else
      {
        if (v6.u32[0] > 1uLL)
        {
          if (v10 >= *(void *)&v2) {
            v10 %= *(void *)&v2;
          }
        }

        else
        {
          v10 &= *(void *)&v2 - 1LL;
        }

        if (v10 != v7) {
          return 0LL;
        }
      }

      uint64_t result = (void *)*result;
    }

    while (result);
  }

  return result;
}

void *sub_100004828@<X0>(void *result@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  int8x8_t v3 = (int8x8_t)result[1];
  unint64_t v4 = a2[1];
  uint8x8_t v5 = (uint8x8_t)vcnt_s8(v3);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    if (v4 >= *(void *)&v3) {
      v4 %= *(void *)&v3;
    }
  }

  else
  {
    v4 &= *(void *)&v3 - 1LL;
  }

  uint8x8_t v6 = *(void **)(*result + 8 * v4);
  do
  {
    unint64_t v7 = v6;
    uint8x8_t v6 = (void *)*v6;
  }

  while (v6 != a2);
  if (v7 == result + 2) {
    goto LABEL_18;
  }
  unint64_t v8 = v7[1];
  if (v5.u32[0] > 1uLL)
  {
    if (v8 >= *(void *)&v3) {
      v8 %= *(void *)&v3;
    }
  }

  else
  {
    v8 &= *(void *)&v3 - 1LL;
  }

  if (v8 != v4)
  {
LABEL_18:
    if (!*a2) {
      goto LABEL_19;
    }
    unint64_t v9 = *(void *)(*a2 + 8LL);
    if (v5.u32[0] > 1uLL)
    {
      if (v9 >= *(void *)&v3) {
        v9 %= *(void *)&v3;
      }
    }

    else
    {
      v9 &= *(void *)&v3 - 1LL;
    }

    if (v9 != v4) {
LABEL_19:
    }
      *(void *)(*result + 8 * v4) = 0LL;
  }

  uint64_t v10 = *a2;
  if (*a2)
  {
    unint64_t v11 = *(void *)(v10 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v11 >= *(void *)&v3) {
        v11 %= *(void *)&v3;
      }
    }

    else
    {
      v11 &= *(void *)&v3 - 1LL;
    }

    if (v11 != v4)
    {
      *(void *)(*result + 8 * v11) = v7;
      uint64_t v10 = *a2;
    }
  }

  void *v7 = v10;
  *a2 = 0LL;
  --result[3];
  *(void *)a3 = a2;
  *(void *)(a3 + 8) = result + 2;
  *(_BYTE *)(a3 + 16) = 1;
  return result;
}

void *sub_10000495C@<X0>(char *a1@<X1>, void *a2@<X2>, void *a3@<X8>)
{
  uint8x8_t v6 = operator new(0x70uLL);
  uint64_t result = sub_1000049BC(v6, a1, a2);
  *a3 = v6 + 3;
  a3[1] = v6;
  return result;
}

void sub_1000049A8(_Unwind_Exception *a1)
{
}

void *sub_1000049BC(void *a1, char *a2, void *a3)
{
  a1[2] = 0LL;
  *a1 = off_10000C5B0;
  a1[1] = 0LL;
  sub_100004A4C((uint64_t)(a1 + 3), a2, a3);
  return a1;
}

void sub_1000049F4(_Unwind_Exception *a1)
{
}

void sub_100004A08(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_10000C5B0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_100004A1C(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)off_10000C5B0;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void sub_100004A40(uint64_t a1)
{
}

uint64_t sub_100004A4C(uint64_t a1, char *a2, void *a3)
{
  if (v7 < 0) {
    operator delete(__p[0]);
  }
  return a1;
}

void sub_100004AA0( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *sub_100004ABC(uint64_t a1, void *a2, void *a3)
{
  unint64_t v6 = 0x9DDFEA08EB382D69LL * ((8 * *a2 + 8LL) ^ HIDWORD(*a2));
  unint64_t v7 = 0x9DDFEA08EB382D69LL * (HIDWORD(*a2) ^ (v6 >> 47) ^ v6);
  unint64_t v8 = 0x9DDFEA08EB382D69LL * (v7 ^ (v7 >> 47));
  unint64_t v9 = *(void *)(a1 + 8);
  if (v9)
  {
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      unint64_t v3 = 0x9DDFEA08EB382D69LL * (v7 ^ (v7 >> 47));
      if (v8 >= v9) {
        unint64_t v3 = v8 % v9;
      }
    }

    else
    {
      unint64_t v3 = v8 & (v9 - 1);
    }

    unint64_t v11 = *(void **)(*(void *)a1 + 8 * v3);
    if (v11)
    {
      unint64_t v12 = (void *)*v11;
      if (*v11)
      {
        do
        {
          unint64_t v13 = v12[1];
          if (v13 == v8)
          {
            if (v12[2] == *a2) {
              return v12;
            }
          }

          else
          {
            if (v10.u32[0] > 1uLL)
            {
              if (v13 >= v9) {
                v13 %= v9;
              }
            }

            else
            {
              v13 &= v9 - 1;
            }

            if (v13 != v3) {
              break;
            }
          }

          unint64_t v12 = (void *)*v12;
        }

        while (v12);
      }
    }
  }

  uint64_t v14 = a1 + 16;
  uint64_t v15 = operator new(0x28uLL);
  v28[0] = v15;
  v28[1] = a1 + 16;
  void *v15 = 0LL;
  v15[1] = v8;
  uint64_t v16 = a3[1];
  v15[2] = *a3;
  v15[3] = v16;
  if (v16)
  {
    unint64_t v17 = (unint64_t *)(v16 + 8);
    do
      unint64_t v18 = __ldxr(v17);
    while (__stxr(v18 + 1, v17));
  }

  v15[4] = a3[2];
  char v29 = 1;
  float v19 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v20 = *(float *)(a1 + 32);
  if (!v9 || (float)(v20 * (float)v9) < v19)
  {
    BOOL v21 = 1LL;
    if (v9 >= 3) {
      BOOL v21 = (v9 & (v9 - 1)) != 0;
    }
    unint64_t v22 = v21 | (2 * v9);
    unint64_t v23 = vcvtps_u32_f32(v19 / v20);
    if (v22 <= v23) {
      size_t v24 = v23;
    }
    else {
      size_t v24 = v22;
    }
    sub_100004478(a1, v24);
    unint64_t v9 = *(void *)(a1 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v8 >= v9) {
        unint64_t v3 = v8 % v9;
      }
      else {
        unint64_t v3 = v8;
      }
    }

    else
    {
      unint64_t v3 = (v9 - 1) & v8;
    }
  }

  id v25 = *(void **)(*(void *)a1 + 8 * v3);
  if (v25)
  {
    *(void *)v28[0] = *v25;
    *id v25 = v28[0];
  }

  else
  {
    *(void *)v28[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v28[0];
    *(void *)(*(void *)a1 + 8 * v3) = v14;
    if (*(void *)v28[0])
    {
      unint64_t v26 = *(void *)(*(void *)v28[0] + 8LL);
      if ((v9 & (v9 - 1)) != 0)
      {
        if (v26 >= v9) {
          v26 %= v9;
        }
      }

      else
      {
        v26 &= v9 - 1;
      }

      *(void *)(*(void *)a1 + 8 * v26) = v28[0];
    }
  }

  unint64_t v12 = (void *)v28[0];
  v28[0] = 0LL;
  ++*(void *)(a1 + 24);
  sub_1000046AC((uint64_t)v28, 0LL);
  return v12;
}

void sub_100004D50(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

void *sub_100004D68@<X0>(char *a1@<X1>, void *a2@<X2>, void *a3@<X8>)
{
  unint64_t v6 = operator new(0x70uLL);
  uint64_t result = sub_100004DC8(v6, a1, a2);
  *a3 = v6 + 3;
  a3[1] = v6;
  return result;
}

void sub_100004DB4(_Unwind_Exception *a1)
{
}

void *sub_100004DC8(void *a1, char *a2, void *a3)
{
  a1[2] = 0LL;
  *a1 = off_10000C5B0;
  a1[1] = 0LL;
  sub_100004E14((uint64_t)(a1 + 3), a2, a3);
  return a1;
}

void sub_100004E00(_Unwind_Exception *a1)
{
}

uint64_t sub_100004E14(uint64_t a1, char *a2, void *a3)
{
  if (v7 < 0) {
    operator delete(__p[0]);
  }
  return a1;
}

void sub_100004E68( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

  ;
}

void sub_100004EB0( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, const char *a5, const char *a6, uint8_t *a7)
{
}

  ;
}

void sub_100004EF8( void *a1, int a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint8_t buf)
{
}

void sub_100004F0C( void *a1, int a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint8_t buf)
{
}

BOOL sub_100004F20()
{
  return os_log_type_enabled((os_log_t)qword_100010AE8, OS_LOG_TYPE_FAULT);
}

BOOL sub_100004F34()
{
  return os_log_type_enabled(*(os_log_t *)(v0 + 2792), OS_LOG_TYPE_INFO);
}

BOOL sub_100004F44()
{
  return os_signpost_enabled(*(os_log_t *)(v0 + 2792));
}

  ;
}

void sub_100004F90(id a1)
{
  v1[0] = @"gsp10-ssl.apple.com";
  v2[0] = +[NSNull null](&OBJC_CLASS___NSNull, "null");
  v1[1] = @"gs-loc.apple.com";
  v2[1] = +[NSNull null](&OBJC_CLASS___NSNull, "null");
  v2[2] = @"1.2.840.113635.100.6.27.35";
  v1[2] = @"iphone-ld.apple.com";
  v1[3] = @"configuration.apple.com";
  v2[3] = +[NSNull null](&OBJC_CLASS___NSNull, "null");
  v1[4] = @"cl5.apple.com";
  v2[4] = +[NSNull null](&OBJC_CLASS___NSNull, "null");
  v1[5] = @"cl4.apple.com";
  v2[5] = +[NSNull null](&OBJC_CLASS___NSNull, "null");
  v1[6] = @"cl3.apple.com";
  v2[6] = +[NSNull null](&OBJC_CLASS___NSNull, "null");
  v1[7] = @"cl2.apple.com";
  v2[7] = +[NSNull null](&OBJC_CLASS___NSNull, "null");
  v1[8] = @"ingest.apple-studies.com";
  v2[8] = +[NSNull null](&OBJC_CLASS___NSNull, "null");
  v1[9] = @"ingest.stg.apple-studies.com";
  v2[9] = +[NSNull null](&OBJC_CLASS___NSNull, "null");
  qword_100011428 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v2,  v1,  10LL);
}

LABEL_21:
  unint64_t v18 = (os_log_s *)qword_100011288;
  if (os_log_type_enabled((os_log_t)qword_100011288, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289283;
    unint64_t v37 = 0;
    v38 = 2082;
    uint64_t v39 = "";
    v40 = 2049;
    uint64_t v41 = (id)v16;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#VerifyHost result, result:%{private}lu}",  buf,  0x1Cu);
  }

  if (v16 == 2)
  {
    (*((void (**)(id, uint64_t, void))a5 + 2))(a5, 2LL, 0LL);
  }

  else if (v16 == 1)
  {
    (*((void (**)(id, void, NSURLCredential *))a5 + 2))( a5,  0,  +[NSURLCredential credentialForTrust:]( NSURLCredential,  "credentialForTrust:",  objc_msgSend(objc_msgSend(a4, "protectionSpace"), "serverTrust")));
  }

  else
  {
    (*((void (**)(id, uint64_t, void))a5 + 2))(a5, 1LL, 0LL);
  }

  return v16;
}

void sub_100005758(id a1)
{
  qword_100011288 = (uint64_t)os_log_create("com.apple.locationd.Utility", "Utility");
}

uint64_t getSharedSessionInQueue(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100005894;
  block[3] = &unk_10000C640;
  block[4] = a1;
  if (qword_100011438 != -1) {
    dispatch_once(&qword_100011438, block);
  }
  if (qword_100011440 != a1) {
    sub_1000077FC();
  }
  return qword_100011430;
}

id sub_100005894(uint64_t a1)
{
  int8x8_t v2 = +[NSURLSessionConfiguration defaultSessionConfiguration]( &OBJC_CLASS___NSURLSessionConfiguration,  "defaultSessionConfiguration");
  unint64_t v3 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
  -[NSOperationQueue setUnderlyingQueue:](v3, "setUnderlyingQueue:", *(void *)(a1 + 32));
  qword_100011440 = *(void *)(a1 + 32);
  qword_100011430 = +[NSURLSession sessionWithConfiguration:delegate:delegateQueue:]( &OBJC_CLASS___NSURLSession,  "sessionWithConfiguration:delegate:delegateQueue:",  v2,  objc_alloc_init(&OBJC_CLASS___CLTileDownloadTaskDelegate),  v3);
  return (id)qword_100011430;
}

uint64_t decompress(const char *a1, const char *a2)
{
  unint64_t v4 = malloc(0x4000uLL);
  uint8x8_t v5 = &CLCertificatePinningHelper__metaData;
  unint64_t v6 = &CLCertificatePinningHelper__metaData;
  if (!v4)
  {
    uint64_t v13 = 0LL;
    unsigned int v14 = 0;
    int v15 = 0;
    unint64_t v11 = 0LL;
    goto LABEL_50;
  }

  char v7 = v4;
  uint64_t v50 = 0LL;
  unint64_t v8 = -[NSFileManager attributesOfItemAtPath:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "attributesOfItemAtPath:error:",  +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a1),  &v50);
  if (v50)
  {
    if (qword_100010AE0 != -1) {
      dispatch_once(&qword_100010AE0, &stru_10000C698);
    }
    unint64_t v9 = (os_log_s *)qword_100010AE8;
    if (os_log_type_enabled((os_log_t)qword_100010AE8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289538;
      int v52 = 0;
      __int16 v53 = 2082;
      uint64_t v54 = "";
      __int16 v55 = 2082;
      uint64_t v56 = a1;
      __int16 v57 = 2114;
      *(void *)uint64_t v58 = v50;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:#TilesService, attributesOfItemAtPath returned an error, file_path_from:%{public, l ocation:escape_only}s, attributesError:%{public, location:escape_only}@}",  buf,  0x26u);
      if (qword_100010AE0 != -1) {
        dispatch_once(&qword_100010AE0, &stru_10000C698);
      }
    }

    uint8x8_t v10 = (os_log_s *)qword_100010AE8;
    if (os_signpost_enabled((os_log_t)qword_100010AE8))
    {
      *(_DWORD *)buf = 68289538;
      int v52 = 0;
      __int16 v53 = 2082;
      uint64_t v54 = "";
      __int16 v55 = 2082;
      uint64_t v56 = a1;
      __int16 v57 = 2114;
      *(void *)uint64_t v58 = v50;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v10,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "#TilesService, attributesOfItemAtPath returned an error",  "{msg%{public}.0s:#TilesService, attributesOfItemAtPath returned an error, file_path_from:%{public, l ocation:escape_only}s, attributesError:%{public, location:escape_only}@}",  buf,  0x26u);
    }

    unint64_t v11 = 0LL;
    unint64_t v12 = 0LL;
    uint8x8_t v5 = &CLCertificatePinningHelper__metaData;
    goto LABEL_47;
  }

  id v16 = objc_msgSend(-[NSDictionary objectForKey:](v8, "objectForKey:", NSFileSize), "unsignedLongLongValue");
  if (!v16)
  {
    if (qword_100010AE0 != -1) {
      dispatch_once(&qword_100010AE0, &stru_10000C698);
    }
    unint64_t v32 = (os_log_s *)qword_100010AE8;
    if (os_log_type_enabled((os_log_t)qword_100010AE8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289282;
      int v52 = 0;
      __int16 v53 = 2082;
      uint64_t v54 = "";
      __int16 v55 = 2082;
      uint64_t v56 = a1;
      _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:#TilesService, file is empty or inaccessible, file_path_from:%{public, location:escape_only}s}",  buf,  0x1Cu);
      if (qword_100010AE0 != -1) {
        dispatch_once(&qword_100010AE0, &stru_10000C698);
      }
    }

    v33 = (os_log_s *)qword_100010AE8;
    if (os_signpost_enabled((os_log_t)qword_100010AE8))
    {
      *(_DWORD *)buf = 68289282;
      int v52 = 0;
      __int16 v53 = 2082;
      uint64_t v54 = "";
      __int16 v55 = 2082;
      uint64_t v56 = a1;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v33,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "#TilesService, file is empty or inaccessible",  "{msg%{public}.0s:#TilesService, file is empty or inaccessible, file_path_from:%{public, location:escape_only}s}",  buf,  0x1Cu);
    }

    unint64_t v11 = 0LL;
    goto LABEL_46;
  }

  unint64_t v11 = (unint64_t)v16;
  if (qword_100010AE0 != -1) {
    dispatch_once(&qword_100010AE0, &stru_10000C698);
  }
  unint64_t v17 = (os_log_s *)qword_100010AE8;
  if (os_log_type_enabled((os_log_t)qword_100010AE8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68290050;
    int v52 = 0;
    __int16 v53 = 2082;
    uint64_t v54 = "";
    __int16 v55 = 2082;
    uint64_t v56 = a1;
    __int16 v57 = 2082;
    *(void *)uint64_t v58 = a2;
    *(_WORD *)&v58[8] = 2050;
    *(void *)&v58[10] = v11;
    *(_WORD *)&v58[18] = 1026;
    *(_DWORD *)&v58[20] = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:#TilesService, file_path_from:%{public, location:escape_only}s, file_path_to:%{pu blic, location:escape_only}s, fileSize:%{public}llu, isOK:%{public}hhd}",  buf,  0x36u);
  }

  unint64_t v18 = fopen(a2, "wb");
  if (!v18)
  {
    if (qword_100010AE0 != -1) {
      dispatch_once(&qword_100010AE0, &stru_10000C698);
    }
    unint64_t v34 = (os_log_s *)qword_100010AE8;
    if (os_log_type_enabled((os_log_t)qword_100010AE8, OS_LOG_TYPE_FAULT))
    {
      int v35 = *__error();
      *(_DWORD *)buf = 68289538;
      int v52 = 0;
      __int16 v53 = 2082;
      uint64_t v54 = "";
      __int16 v55 = 2082;
      uint64_t v56 = a2;
      __int16 v57 = 1026;
      *(_DWORD *)uint64_t v58 = v35;
      _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:#TilesService, can't open file_path_to, file_path_to:%{public, location:escape_only }s, errno:%{public}d}",  buf,  0x22u);
      if (qword_100010AE0 != -1) {
        dispatch_once(&qword_100010AE0, &stru_10000C698);
      }
    }

    uint64_t v36 = (os_log_s *)qword_100010AE8;
    if (os_signpost_enabled((os_log_t)qword_100010AE8))
    {
      int v37 = *__error();
      *(_DWORD *)buf = 68289538;
      int v52 = 0;
      __int16 v53 = 2082;
      uint64_t v54 = "";
      __int16 v55 = 2082;
      uint64_t v56 = a2;
      __int16 v57 = 1026;
      *(_DWORD *)uint64_t v58 = v37;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v36,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "#TilesService, can't open file_path_to",  "{msg%{public}.0s:#TilesService, can't open file_path_to, file_path_to:%{public, location:escape_only }s, errno:%{public}d}",  buf,  0x22u);
    }

LABEL_46:
    unint64_t v12 = 0LL;
    goto LABEL_47;
  }

  unint64_t v12 = v18;
  float v19 = gzopen(a1, "rb");
  if (v19)
  {
    float v20 = v19;
    unsigned int v14 = 0;
    int v15 = 0;
    if (gzeof(v19))
    {
LABEL_20:
      uint64_t v13 = 1LL;
    }

    else
    {
      while (1)
      {
        int v22 = gzread(v20, v7, 0x4000u);
        int v23 = v22;
        if (v22 <= 0)
        {
          if (qword_100010AE0 != -1) {
            dispatch_once(&qword_100010AE0, &stru_10000C698);
          }
          size_t v24 = (os_log_s *)qword_100010AE8;
          if (os_log_type_enabled((os_log_t)qword_100010AE8, OS_LOG_TYPE_FAULT))
          {
            int v25 = *__error();
            *(_DWORD *)buf = 68289794;
            int v52 = 0;
            __int16 v53 = 2082;
            uint64_t v54 = "";
            __int16 v55 = 2082;
            uint64_t v56 = a1;
            __int16 v57 = 1026;
            *(_DWORD *)uint64_t v58 = v25;
            *(_WORD *)&v58[4] = 1026;
            *(_DWORD *)&v58[6] = v23;
            _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:#TilesService, error reading source file, file_path_from:%{public, location:e scape_only}s, errno:%{public}d, read:%{public}d}",  buf,  0x28u);
            if (qword_100010AE0 != -1) {
              dispatch_once(&qword_100010AE0, &stru_10000C698);
            }
          }

          uint64_t v26 = qword_100010AE8;
          if (os_signpost_enabled((os_log_t)qword_100010AE8))
          {
            int v27 = *__error();
            *(_DWORD *)buf = 68289794;
            int v52 = 0;
            __int16 v53 = 2082;
            uint64_t v54 = "";
            __int16 v55 = 2082;
            uint64_t v56 = a1;
            __int16 v57 = 1026;
            *(_DWORD *)uint64_t v58 = v27;
            *(_WORD *)&v58[4] = 1026;
            *(_DWORD *)&v58[6] = v23;
            unint64_t v28 = "#TilesService, error reading source file";
            char v29 = "{msg%{public}.0s:#TilesService, error reading source file, file_path_from:%{public, locati"
                  "on:escape_only}s, errno:%{public}d, read:%{public}d}";
            v30 = (os_log_s *)v26;
            uint32_t v31 = 40;
LABEL_73:
            _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v30,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  v28,  v29,  buf,  v31);
            goto LABEL_74;
          }

          goto LABEL_74;
        }

        v15 += v22;
        size_t v21 = fwrite(v7, 1uLL, v22, v12);
        if (v21 != v23) {
          break;
        }
        v14 += v23;
        unint64_t v6 = &CLCertificatePinningHelper__metaData;
        if (gzeof(v20)) {
          goto LABEL_20;
        }
      }

      size_t v45 = v21;
      if (qword_100010AE0 != -1) {
        dispatch_once(&qword_100010AE0, &stru_10000C698);
      }
      uint64_t v46 = (os_log_s *)qword_100010AE8;
      if (os_log_type_enabled((os_log_t)qword_100010AE8, OS_LOG_TYPE_FAULT))
      {
        int v47 = *__error();
        *(_DWORD *)buf = 68289794;
        int v52 = 0;
        __int16 v53 = 2082;
        uint64_t v54 = "";
        __int16 v55 = 2082;
        uint64_t v56 = a2;
        __int16 v57 = 1026;
        *(_DWORD *)uint64_t v58 = v47;
        *(_WORD *)&v58[4] = 2050;
        *(void *)&v58[6] = v45;
        _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:#TilesService, can't write to file_path_to, file_path_to:%{public, location:escap e_only}s, errno:%{public}d, write:%{public}llu}",  buf,  0x2Cu);
        if (qword_100010AE0 != -1) {
          dispatch_once(&qword_100010AE0, &stru_10000C698);
        }
      }

      uint64_t v48 = qword_100010AE8;
      if (os_signpost_enabled((os_log_t)qword_100010AE8))
      {
        int v49 = *__error();
        *(_DWORD *)buf = 68289794;
        int v52 = 0;
        __int16 v53 = 2082;
        uint64_t v54 = "";
        __int16 v55 = 2082;
        uint64_t v56 = a2;
        __int16 v57 = 1026;
        *(_DWORD *)uint64_t v58 = v49;
        *(_WORD *)&v58[4] = 2050;
        *(void *)&v58[6] = v45;
        unint64_t v28 = "#TilesService, can't write to file_path_to";
        char v29 = "{msg%{public}.0s:#TilesService, can't write to file_path_to, file_path_to:%{public, location:e"
              "scape_only}s, errno:%{public}d, write:%{public}llu}";
        v30 = (os_log_s *)v48;
        uint32_t v31 = 44;
        goto LABEL_73;
      }

LABEL_74:
      uint64_t v13 = 0LL;
      unint64_t v6 = &CLCertificatePinningHelper__metaData;
    }

    gzclose(v20);
    uint8x8_t v5 = &CLCertificatePinningHelper__metaData;
    goto LABEL_48;
  }

  if (qword_100010AE0 != -1) {
    dispatch_once(&qword_100010AE0, &stru_10000C698);
  }
  uint64_t v41 = (os_log_s *)qword_100010AE8;
  if (os_log_type_enabled((os_log_t)qword_100010AE8, OS_LOG_TYPE_FAULT))
  {
    int v42 = *__error();
    *(_DWORD *)buf = 68289538;
    int v52 = 0;
    __int16 v53 = 2082;
    uint64_t v54 = "";
    __int16 v55 = 2082;
    uint64_t v56 = a1;
    __int16 v57 = 1026;
    *(_DWORD *)uint64_t v58 = v42;
    _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:#TilesService, can't open file_path_from, file_path_from:%{public, location:escape_on ly}s, errno:%{public}d}",  buf,  0x22u);
    if (qword_100010AE0 != -1) {
      dispatch_once(&qword_100010AE0, &stru_10000C698);
    }
  }

  uint64_t v43 = (os_log_s *)qword_100010AE8;
  if (os_signpost_enabled((os_log_t)qword_100010AE8))
  {
    int v44 = *__error();
    *(_DWORD *)buf = 68289538;
    int v52 = 0;
    __int16 v53 = 2082;
    uint64_t v54 = "";
    __int16 v55 = 2082;
    uint64_t v56 = a1;
    __int16 v57 = 1026;
    *(_DWORD *)uint64_t v58 = v44;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v43,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "#TilesService, can't open file_path_from",  "{msg%{public}.0s:#TilesService, can't open file_path_from, file_path_from:%{public, location:escape_on ly}s, errno:%{public}d}",  buf,  0x22u);
  }

  uint8x8_t v5 = &CLCertificatePinningHelper__metaData;
LABEL_47:
  uint64_t v13 = 0LL;
  unsigned int v14 = 0;
  int v15 = 0;
  if (v12) {
LABEL_48:
  }
    fclose(v12);
  free(v7);
LABEL_50:
  if (v5[38].ivars != (__objc2_ivar_list *)-1LL) {
    dispatch_once(&qword_100010AE0, &stru_10000C698);
  }
  weak_ivar_lyt = (os_log_s *)v6[38].weak_ivar_lyt;
  if (os_log_type_enabled(weak_ivar_lyt, OS_LOG_TYPE_DEBUG))
  {
    if (v14) {
      double v39 = (double)v11 / (double)v14;
    }
    else {
      double v39 = 0.0;
    }
    *(_DWORD *)buf = 68290818;
    int v52 = 0;
    __int16 v53 = 2082;
    uint64_t v54 = "";
    __int16 v55 = 2082;
    uint64_t v56 = a1;
    __int16 v57 = 2082;
    *(void *)uint64_t v58 = a2;
    *(_WORD *)&v58[8] = 1026;
    *(_DWORD *)&v58[10] = v13;
    *(_WORD *)&v58[14] = 2050;
    *(void *)&v58[16] = v11;
    __int16 v59 = 1026;
    int v60 = v15;
    __int16 v61 = 1026;
    unsigned int v62 = v14;
    __int16 v63 = 2050;
    double v64 = v39;
    _os_log_impl( (void *)&_mh_execute_header,  weak_ivar_lyt,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:#TilesService, file_path_from:%{public, location:escape_only}s, file_path_to:%{pu blic, location:escape_only}s, isOK:%{public}hhd, fileSize:%{public}llu, totalReadBytes:%{public}d, t otalWrittenBytes:%{public}d, compression:%{public}.4f}",  buf,  0x4Cu);
  }

  return v13;
}

void sub_1000065B4( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    std::__shared_weak_count::__release_weak(a16);
  }
  unint64_t v18 = *(std::__shared_weak_count **)(v16 - 40);
  if (v18) {
    std::__shared_weak_count::__release_weak(v18);
  }
  _Unwind_Resume(exception_object);
}

void *sub_1000065D8(void *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = result[6];
  if (v4)
  {
    uint64_t result = (void *)result[4];
    if (*(void *)(v4 + 8) != -1LL) {
      return [result onDownloadCompleted:a2 withResponse:a3 withError:a4];
    }
  }

  return result;
}

uint64_t sub_100006604(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(result + 48) = v2;
  if (v2)
  {
    unint64_t v3 = (unint64_t *)(v2 + 16);
    do
      unint64_t v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }

  return result;
}

void sub_100006628(uint64_t a1)
{
  v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1) {
    std::__shared_weak_count::__release_weak(v1);
  }
}

void sub_100006E00(id a1)
{
  qword_100010AE8 = (uint64_t)os_log_create("com.apple.location.TilesService", "TilesService");
}

  ;
}

  ;
}

const char *sub_100006EA0()
{
  return dispatch_queue_get_label(*(dispatch_queue_t *)(v0 + 1088));
}

const char *sub_100006EA8()
{
  return dispatch_queue_get_label(v0);
}

int main(int argc, const char **argv, const char **envp)
{
}

CLTilesService *sub_100006EE4@<X0>(CLTilesService **a1@<X8>)
{
  uint64_t v2 = (CLTilesService *)operator new(0x80uLL);
  uint64_t result = CLTilesService::CLTilesService(v2);
  *a1 = v2;
  return result;
}

void sub_100006F14(_Unwind_Exception *a1)
{
}

#error "100006FA0: call analysis failed (funcsize=73)"
#error "100007110: call analysis failed (funcsize=73)"
#error "100007280: call analysis failed (funcsize=73)"
#error "1000073F0: call analysis failed (funcsize=73)"
#error "100007560: call analysis failed (funcsize=73)"
void sub_100007658(char a1)
{
  os_log_s *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  os_log_s *v5;
  uint8_t v6[40];
  if ((a1 & 1) == 0) {
    dispatch_once(&qword_100010AE0, &stru_10000C520);
  }
  v1 = (os_log_s *)qword_100010AE8;
  if (os_log_type_enabled((os_log_t)qword_100010AE8, OS_LOG_TYPE_FAULT))
  {
    sub_100004ECC();
    _os_log_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:#TilesService replyMessage can't be NULL, event:%{public, location:escape_only}s, c ondition:%{private, location:escape_only}s}",  v6,  0x26u);
    if (qword_100010AE0 != -1) {
      dispatch_once(&qword_100010AE0, &stru_10000C520);
    }
  }

  if (os_signpost_enabled((os_log_t)qword_100010AE8))
  {
    sub_100004ECC();
    sub_100004EB0( (void *)&_mh_execute_header,  v2,  v3,  v4,  "#TilesService replyMessage can't be NULL",  "{msg%{public}.0s:#TilesService replyMessage can't be NULL, event:%{public, location:escape_only}s, c ondition:%{private, location:escape_only}s}",  v6);
    if (qword_100010AE0 != -1) {
      dispatch_once(&qword_100010AE0, &stru_10000C520);
    }
  }

  uint8x8_t v5 = (os_log_s *)qword_100010AE8;
  if (os_log_type_enabled((os_log_t)qword_100010AE8, OS_LOG_TYPE_INFO))
  {
    sub_100004ECC();
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:#TilesService replyMessage can't be NULL, event:%{public, location:escape_only}s, c ondition:%{private, location:escape_only}s}",  v6,  0x26u);
  }

void sub_1000077FC()
{
  if (qword_100010AE0 != -1) {
    goto LABEL_11;
  }
  while (1)
  {
    uint64_t v0 = (os_log_s *)qword_100010AE8;
    if (os_log_type_enabled((os_log_t)qword_100010AE8, OS_LOG_TYPE_FAULT))
    {
      sub_100006EA8();
      sub_100006EA0();
      sub_100006E64();
      _os_log_impl( (void *)&_mh_execute_header,  v0,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:The passed queue in getSharedSessionInQueue is different to the one that had been statica lly set., queue:%{public, location:escape_only}s, sharedSessionQueue:%{public, location:escape_only}s, event:%{public, location:escape_only}s, condition:%{private, location:escape_only}s}",  buf,  0x3Au);
      if (qword_100010AE0 != -1) {
        dispatch_once(&qword_100010AE0, &stru_10000C698);
      }
    }

    v1 = (os_log_s *)qword_100010AE8;
    if (os_signpost_enabled((os_log_t)qword_100010AE8))
    {
      sub_100006EA8();
      sub_100006EA0();
      sub_100006E64();
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v1,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "The passed queue in getSharedSessionInQueue is different to the one that had been statically set.",  "{msg%{public}.0s:The passed queue in getSharedSessionInQueue is different to the one that had been statica lly set., queue:%{public, location:escape_only}s, sharedSessionQueue:%{public, location:escape_only}s, event:%{public, location:escape_only}s, condition:%{private, location:escape_only}s}",  buf,  0x3Au);
      if (qword_100010AE0 != -1) {
        dispatch_once(&qword_100010AE0, &stru_10000C698);
      }
    }

    uint64_t v2 = (os_log_s *)qword_100010AE8;
    if (os_log_type_enabled((os_log_t)qword_100010AE8, OS_LOG_TYPE_INFO))
    {
      unint64_t v3 = sub_100006EA8();
      unint64_t v4 = sub_100006EA0();
      *(_DWORD *)buf = 68290051;
      int v6 = 0;
      __int16 v7 = 2082;
      unint64_t v8 = "";
      __int16 v9 = 2082;
      uint8x8_t v10 = v3;
      __int16 v11 = 2082;
      unint64_t v12 = v4;
      __int16 v13 = 2082;
      unsigned int v14 = "assert";
      __int16 v15 = 2081;
      uint64_t v16 = "queue == sharedSessionQueue";
      _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:The passed queue in getSharedSessionInQueue is different to the one that had been statica lly set., queue:%{public, location:escape_only}s, sharedSessionQueue:%{public, location:escape_only}s, event:%{public, location:escape_only}s, condition:%{private, location:escape_only}s}",  buf,  0x3Au);
    }

    abort_report_np( "%s:%d: assertion failure in %s",  "/Library/Caches/com.apple.xbs/Sources/CoreLocation/CoreLocationTiles/TilesService/CLTileDownloadRequest.mm",  70,  "getSharedSessionInQueue");
LABEL_11:
    dispatch_once(&qword_100010AE0, &stru_10000C698);
  }

void sub_100007A24()
{
  if (qword_100010AE0 != -1) {
    goto LABEL_11;
  }
  while (1)
  {
    uint64_t v0 = (os_log_s *)qword_100010AE8;
    if (os_log_type_enabled((os_log_t)qword_100010AE8, OS_LOG_TYPE_FAULT))
    {
      sub_100006E2C();
      _os_log_impl( (void *)&_mh_execute_header,  v0,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:Nothing was downloaded to #TilesService? Was it successful?, error:%{private, locat ion:escape_only}@, event:%{public, location:escape_only}s, condition:%{private, location:escape_only}s}",  buf,  0x30u);
      if (qword_100010AE0 != -1) {
        dispatch_once(&qword_100010AE0, &stru_10000C698);
      }
    }

    v1 = (os_log_s *)qword_100010AE8;
    if (os_signpost_enabled((os_log_t)qword_100010AE8))
    {
      sub_100006E2C();
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v1,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "Nothing was downloaded to #TilesService? Was it successful?",  "{msg%{public}.0s:Nothing was downloaded to #TilesService? Was it successful?, error:%{private, locat ion:escape_only}@, event:%{public, location:escape_only}s, condition:%{private, location:escape_only}s}",  buf,  0x30u);
      if (qword_100010AE0 != -1) {
        dispatch_once(&qword_100010AE0, &stru_10000C698);
      }
    }

    uint64_t v2 = (os_log_s *)qword_100010AE8;
    if (os_log_type_enabled((os_log_t)qword_100010AE8, OS_LOG_TYPE_INFO))
    {
      sub_100006E2C();
      _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:Nothing was downloaded to #TilesService? Was it successful?, error:%{private, locat ion:escape_only}@, event:%{public, location:escape_only}s, condition:%{private, location:escape_only}s}",  buf,  0x30u);
    }

    abort_report_np( "%s:%d: assertion failure in %s",  "/Library/Caches/com.apple.xbs/Sources/CoreLocation/CoreLocationTiles/TilesService/CLTileDownloadRequest.mm",  282,  "-[CLTileDownloadRequest onDownloadCompleted:withResponse:withError:]");
LABEL_11:
    dispatch_once(&qword_100010AE0, &stru_10000C698);
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