@interface ABRequestHandler
- (ABRequestHandler)init;
- (void)fetchProxyCredential:(id)a3 reply:(id)a4;
@end

@implementation ABRequestHandler

- (ABRequestHandler)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___ABRequestHandler;
  v2 = -[ABRequestHandler init](&v11, "init");
  if (v2)
  {
    if (qword_10000C7C0 != -1) {
      dispatch_once(&qword_10000C7C0, &stru_100008598);
    }
    Instance = (_OWORD *)_CFRuntimeCreateInstance(0LL, *(void *)(qword_10000C7C8 + 96), 128LL, 0LL);
    v4 = Instance;
    if (Instance)
    {
      Instance[1] = 0u;
      v4 = Instance + 1;
      Instance[7] = 0u;
      Instance[8] = 0u;
      Instance[5] = 0u;
      Instance[6] = 0u;
      Instance[3] = 0u;
      Instance[4] = 0u;
      Instance[2] = 0u;
    }

    *(void *)v4 = off_100008520;
    *((void *)v4 + 1) = &off_1000087A8;
    pthread_mutex_init((pthread_mutex_t *)(v4 + 1), 0LL);
    *(void *)v4 = off_1000085C8;
    *((void *)v4 + 1) = off_100008610;
    *((void *)v4 + 10) = off_100008630;
    v5 = CFGetAllocator(v4 - 1);
    *((void *)v4 + 13) = off_100008728;
    *((void *)v4 + 14) = CFDictionaryCreateMutable( v5,  0LL,  &kCFTypeDictionaryKeyCallBacks,  (const CFDictionaryValueCallBacks *)&unk_10000C668);
    *((void *)v4 + 15) = 0LL;
    CFAllocatorRef v6 = CFGetAllocator(v4 - 1);
    *((void *)v4 + 11) = CFURLCredentialStorageCreate(v6);
    *((void *)v4 + 12) = CFSetCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeSetCallBacks);
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.cfnetwork.authbroker.authenticator.work-queue", v7);
    v9 = (dispatch_object_s *)*((void *)v4 + 15);
    *((void *)v4 + 15) = v8;
    if (v9) {
      dispatch_release(v9);
    }
    v2->authenticator = v4;
  }

  return v2;
}

- (void)fetchProxyCredential:(id)a3 reply:(id)a4
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = a3;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Fetching proxy credential for query %@",  (uint8_t *)&buf,  0xCu);
  }

  authenticator = self->authenticator;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 3221225472LL;
  aBlock[2] = sub_100005FB8;
  aBlock[3] = &unk_100008740;
  aBlock[4] = a4;
  dispatch_queue_t v8 = (std::__shared_weak_count_vtbl *)operator new(0x18uLL);
  v8->~__shared_weak_count_0 = (void (__cdecl *)(std::__shared_weak_count *__hidden))sub_100006068;
  v8->__on_zero_shared = 0LL;
  v8->~__shared_weak_count = (void (__cdecl *)(std::__shared_weak_count *__hidden))_Block_copy(aBlock);
  aBlock[5] = v8;
  v9 = (std::__shared_weak_count *)operator new(0x20uLL);
  v9->__shared_owners_ = 0LL;
  p_shared_owners = (unint64_t *)&v9->__shared_owners_;
  v9->__vftable = (std::__shared_weak_count_vtbl *)&off_100008770;
  v9->__shared_weak_owners_ = 0LL;
  v9[1].__vftable = v8;
  v28 = v9;
  if (a3) {
    objc_super v11 = (std::__shared_weak_count_vtbl *)CFRetain(a3);
  }
  else {
    objc_super v11 = 0LL;
  }
  v12 = (std::__shared_weak_count *)operator new(0x20uLL);
  v12->__shared_owners_ = 0LL;
  v13 = (unint64_t *)&v12->__shared_owners_;
  v12->__vftable = (std::__shared_weak_count_vtbl *)&off_1000086B8;
  v12->__shared_weak_owners_ = 0LL;
  v12[1].__vftable = v11;
  v14 = (dispatch_queue_s *)*((void *)authenticator + 15);
  *(void *)&__int128 buf = _NSConcreteStackBlock;
  *((void *)&buf + 1) = 3321888768LL;
  v30 = sub_100005444;
  v31 = &unk_100008640;
  v32 = authenticator;
  v33 = v11;
  v34 = v12;
  do
    unint64_t v15 = __ldxr(v13);
  while (__stxr(v15 + 1, v13));
  v35 = v8;
  v36 = v9;
  do
    unint64_t v16 = __ldxr(p_shared_owners);
  while (__stxr(v16 + 1, p_shared_owners));
  dispatch_async(v14, &buf);
  v17 = v36;
  if (v36)
  {
    v18 = (unint64_t *)&v36->__shared_owners_;
    do
      unint64_t v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }

  v20 = v34;
  if (v34)
  {
    v21 = (unint64_t *)&v34->__shared_owners_;
    do
      unint64_t v22 = __ldaxr(v21);
    while (__stlxr(v22 - 1, v21));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
  }

  do
    unint64_t v23 = __ldaxr(v13);
  while (__stlxr(v23 - 1, v13));
  if (!v23)
  {
    ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
    std::__shared_weak_count::__release_weak(v12);
  }

  v24 = v28;
  if (v28)
  {
    v25 = (unint64_t *)&v28->__shared_owners_;
    do
      unint64_t v26 = __ldaxr(v25);
    while (__stlxr(v26 - 1, v25));
    if (!v26)
    {
      ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
      std::__shared_weak_count::__release_weak(v24);
    }
  }

@end