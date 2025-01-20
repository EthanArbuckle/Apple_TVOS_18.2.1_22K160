@interface CWFEAP8021X
- (BOOL)isMonitoringEvents;
- (CWFEAP8021X)init;
- (CWFEAP8021X)initWithInterfaceName:(id)a3;
- (NSString)interfaceName;
- (id)clientStatus:(id *)a3;
- (id)controlMode:(id *)a3;
- (id)controlState:(id *)a3;
- (id)eventHandler;
- (id)supplicantState:(id *)a3;
- (void)__startEventMonitoring;
- (void)dealloc;
- (void)setEventHandler:(id)a3;
- (void)startEventMonitoring;
- (void)stopEventMonitoring;
@end

@implementation CWFEAP8021X

- (CWFEAP8021X)initWithInterfaceName:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___CWFEAP8021X;
  v5 = -[CWFEAP8021X init](&v22, sel_init);
  v10 = v5;
  if (!v4) {
    goto LABEL_6;
  }
  if (!v5) {
    goto LABEL_6;
  }
  uint64_t v11 = objc_msgSend_copy(v4, v6, v7, v8, v9);
  interfaceName = v10->_interfaceName;
  v10->_interfaceName = (NSString *)v11;

  dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v13 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v14 = dispatch_queue_create("com.apple.corewifi.EAP8021X-mutex", v13);
  mutexQueue = v10->_mutexQueue;
  v10->_mutexQueue = (OS_dispatch_queue *)v14;

  if (!v10->_mutexQueue) {
    goto LABEL_6;
  }
  dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v16 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v17 = dispatch_queue_create("com.apple.corewifi.EAP8021X-event", v16);
  eventQueue = v10->_eventQueue;
  v10->_eventQueue = (OS_dispatch_queue *)v17;

  if (!v10->_eventQueue
    || (v21.version = 0LL,
        memset(&v21.retain, 0, 24),
        v21.info = v10,
        SCDynamicStoreRef v19 = SCDynamicStoreCreate( (CFAllocatorRef)*MEMORY[0x189604DB0],  @"com.apple.corewifi.EAP8021X",  (SCDynamicStoreCallBack)sub_18651451C,  &v21),  (v10->_storeRef = v19) == 0LL))
  {
LABEL_6:

    v10 = 0LL;
  }

  return v10;
}

- (void)dealloc
{
  storeRef = self->_storeRef;
  if (storeRef) {
    CFRelease(storeRef);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CWFEAP8021X;
  -[CWFEAP8021X dealloc](&v4, sel_dealloc);
}

- (CWFEAP8021X)init
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
  -[CWFEAP8021X __startEventMonitoring](v3, v4);
  return result;
}

- (void)__startEventMonitoring
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  if (!qword_18C4A4330)
  {
    __int128 v31 = xmmword_189E5F3D0;
    uint64_t v32 = 0LL;
    qword_18C4A4330 = _sl_dlopen();
  }

  if (qword_18C4A4330)
  {
    uint64_t v6 = objc_msgSend_UTF8String(self->_interfaceName, a2, v2, v3, v4);
    uint64_t v11 = v6;
    *(void *)&__int128 v31 = 0LL;
    *((void *)&v31 + 1) = &v31;
    uint64_t v32 = 0x2020000000LL;
    v12 = off_18C4A4338;
    v33 = off_18C4A4338;
    if (!off_18C4A4338)
    {
      v13 = sub_18651519C(v6, v7, v8, v9, v10);
      v12 = dlsym(v13, "EAPOLControlKeyCreate");
      *(void *)(*((void *)&v31 + 1) + 24LL) = v12;
      off_18C4A4338 = v12;
    }

    _Block_object_dispose(&v31, 8);
    if (!v12)
    {
      objc_msgSend_currentHandler(MEMORY[0x1896077D8], v14, v15, v16, v17);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithUTF8String_( NSString,  v24,  (uint64_t)"CFStringRef soft_EAPOLControlKeyCreate(const char *)",  v25,  v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = dlerror();
      objc_msgSend_handleFailureInFunction_file_lineNumber_description_( v23,  v29,  (uint64_t)v27,  (uint64_t)@"CWFEAP8021X.m",  33,  @"%s",  v28);

      __break(1u);
    }

    uint64_t v18 = ((uint64_t (*)(uint64_t))v12)(v11);
    SCDynamicStoreContext v21 = (const void *)v18;
    if (v18)
    {
      uint64_t v30 = v18;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x189603F18], v19, (uint64_t)&v30, 1, v20);
      objc_super v22 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
      if (SCDynamicStoreSetNotificationKeys(self->_storeRef, v22, 0LL)) {
        SCDynamicStoreSetDispatchQueue(self->_storeRef, (dispatch_queue_t)self->_eventQueue);
      }
      CFRelease(v21);
    }
  }

- (void)startEventMonitoring
{
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_1865149D4;
  block[3] = &unk_189E5BC10;
  block[4] = self;
  dispatch_sync(mutexQueue, block);
}

- (void)stopEventMonitoring
{
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_186514A70;
  block[3] = &unk_189E5BC10;
  block[4] = self;
  dispatch_sync(mutexQueue, block);
}

- (BOOL)isMonitoringEvents
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  mutexQueue = (dispatch_queue_s *)self->_mutexQueue;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = sub_186514B5C;
  v5[3] = &unk_189E5BC38;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)controlState:(id *)a3
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  unsigned int v17 = 0;
  CFTypeRef cf = 0LL;
  if (!qword_18C4A4330)
  {
    __int128 v18 = xmmword_189E5F3D0;
    uint64_t v19 = 0LL;
    qword_18C4A4330 = _sl_dlopen();
  }

  if (!qword_18C4A4330) {
    goto LABEL_11;
  }
  uint64_t v7 = objc_msgSend_UTF8String(self->_interfaceName, a2, (uint64_t)a3, v3, v4);
  sub_186514CB0(v7, (const char *)&v17, (uint64_t)&cf, v8, v9);
  if (!v10)
  {
    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x189607968], v11, v17, v12, v13);
    dispatch_queue_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }

  if (a3)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v11, *MEMORY[0x189607670], v10, 0);
    dispatch_queue_t v14 = 0LL;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
LABEL_11:
    dispatch_queue_t v14 = 0LL;
  }

- (id)supplicantState:(id *)a3
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  int v17 = 0;
  CFTypeRef cf = 0LL;
  if (!qword_18C4A4330)
  {
    __int128 v18 = xmmword_189E5F3D0;
    uint64_t v19 = 0LL;
    qword_18C4A4330 = _sl_dlopen();
  }

  if (!qword_18C4A4330) {
    goto LABEL_11;
  }
  uint64_t v7 = objc_msgSend_UTF8String(self->_interfaceName, a2, (uint64_t)a3, v3, v4);
  sub_186514CB0(v7, (const char *)&v17, (uint64_t)&cf, v8, v9);
  if (!v10)
  {
    objc_msgSend_objectForKeyedSubscript_((void *)cf, v11, (uint64_t)@"SupplicantState", v12, v13);
    dispatch_queue_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }

  if (a3)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v11, *MEMORY[0x189607670], v10, 0);
    dispatch_queue_t v14 = 0LL;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
LABEL_11:
    dispatch_queue_t v14 = 0LL;
  }

- (id)controlMode:(id *)a3
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  int v17 = 0;
  CFTypeRef cf = 0LL;
  if (!qword_18C4A4330)
  {
    __int128 v18 = xmmword_189E5F3D0;
    uint64_t v19 = 0LL;
    qword_18C4A4330 = _sl_dlopen();
  }

  if (!qword_18C4A4330) {
    goto LABEL_11;
  }
  uint64_t v7 = objc_msgSend_UTF8String(self->_interfaceName, a2, (uint64_t)a3, v3, v4);
  sub_186514CB0(v7, (const char *)&v17, (uint64_t)&cf, v8, v9);
  if (!v10)
  {
    objc_msgSend_objectForKeyedSubscript_((void *)cf, v11, (uint64_t)@"Mode", v12, v13);
    dispatch_queue_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }

  if (a3)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v11, *MEMORY[0x189607670], v10, 0);
    dispatch_queue_t v14 = 0LL;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
LABEL_11:
    dispatch_queue_t v14 = 0LL;
  }

- (id)clientStatus:(id *)a3
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  int v17 = 0;
  CFTypeRef cf = 0LL;
  if (!qword_18C4A4330)
  {
    __int128 v18 = xmmword_189E5F3D0;
    uint64_t v19 = 0LL;
    qword_18C4A4330 = _sl_dlopen();
  }

  if (!qword_18C4A4330) {
    goto LABEL_11;
  }
  uint64_t v7 = objc_msgSend_UTF8String(self->_interfaceName, a2, (uint64_t)a3, v3, v4);
  sub_186514CB0(v7, (const char *)&v17, (uint64_t)&cf, v8, v9);
  if (!v10)
  {
    objc_msgSend_objectForKeyedSubscript_((void *)cf, v11, (uint64_t)@"ClientStatus", v12, v13);
    dispatch_queue_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }

  if (a3)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v11, *MEMORY[0x189607670], v10, 0);
    dispatch_queue_t v14 = 0LL;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
LABEL_11:
    dispatch_queue_t v14 = 0LL;
  }

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (id)eventHandler
{
  return objc_getProperty(self, a2, 48LL, 1);
}

- (void)setEventHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end