@interface __NSCFDeallocBomb
- (uint64_t)disarm;
- (void)dealloc;
- (void)initWithMethod:(void *)a3 delegate:;
@end

@implementation __NSCFDeallocBomb

- (void)initWithMethod:(void *)a3 delegate:
{
  id v6 = a3;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)&OBJC_CLASS_____NSCFDeallocBomb;
    id v7 = objc_msgSendSuper2(&v9, sel_init);
    a1 = v7;
    if (v7)
    {
      objc_storeStrong((id *)v7 + 1, a3);
      a1[2] = a2;
    }
  }

  return a1;
}

- (uint64_t)disarm
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v1 = result;
    if (*(_BYTE *)(result + 24))
    {
      if (__CFNAPIMisuseFaultLogHandle::onceToken != -1) {
        dispatch_once(&__CFNAPIMisuseFaultLogHandle::onceToken, &__block_literal_global_7_4727);
      }
      v2 = (os_log_s *)(id)__CFNAPIMisuseFaultLogHandle::logger;
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      {
        v4 = (char *)objc_opt_class();
        uint64_t v5 = *(void *)(v1 + 8);
        int v8 = 138412802;
        objc_super v9 = v4;
        __int16 v10 = 2112;
        uint64_t v11 = v5;
        __int16 v12 = 2048;
        uint64_t v13 = v5;
        id v6 = v4;
        _os_log_error_impl( &dword_18298D000,  v2,  OS_LOG_TYPE_ERROR,  "API MISUSE: NSURLSession delegate %@: %@ (%p)",  (uint8_t *)&v8,  0x20u);
      }

      if (__CFNAPIMisuseFaultLogHandle::onceToken != -1) {
        dispatch_once(&__CFNAPIMisuseFaultLogHandle::onceToken, &__block_literal_global_7_4727);
      }
      v3 = (os_log_s *)(id)__CFNAPIMisuseFaultLogHandle::logger;
      if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      {
        Name = sel_getName(*(SEL *)(v1 + 16));
        int v8 = 136315138;
        objc_super v9 = Name;
        _os_log_fault_impl( &dword_18298D000,  v3,  OS_LOG_TYPE_FAULT,  "API MISUSE: %s completion handler called more than once",  (uint8_t *)&v8,  0xCu);
      }

      return 0LL;
    }

    else
    {
      result = 1LL;
      *(_BYTE *)(v1 + 24) = 1;
    }
  }

  return result;
}

- (void)dealloc
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  if (!self->disarmed)
  {
    if (__CFNAPIMisuseFaultLogHandle::onceToken != -1) {
      dispatch_once(&__CFNAPIMisuseFaultLogHandle::onceToken, &__block_literal_global_7_4727);
    }
    v3 = (os_log_s *)(id)__CFNAPIMisuseFaultLogHandle::logger;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = (char *)objc_opt_class();
      id object = self->object;
      *(_DWORD *)buf = 138412802;
      uint64_t v11 = v5;
      __int16 v12 = 2112;
      id v13 = object;
      __int16 v14 = 2048;
      id v15 = object;
      id v7 = v5;
      _os_log_error_impl( &dword_18298D000,  v3,  OS_LOG_TYPE_ERROR,  "API MISUSE: NSURLSession delegate %@: %@ (%p)",  buf,  0x20u);
    }

    if (__CFNAPIMisuseFaultLogHandle::onceToken != -1) {
      dispatch_once(&__CFNAPIMisuseFaultLogHandle::onceToken, &__block_literal_global_7_4727);
    }
    v4 = (os_log_s *)(id)__CFNAPIMisuseFaultLogHandle::logger;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      Name = sel_getName(self->method);
      *(_DWORD *)buf = 136315138;
      uint64_t v11 = Name;
      _os_log_fault_impl( &dword_18298D000,  v4,  OS_LOG_TYPE_FAULT,  "API MISUSE: %s completion handler not called",  buf,  0xCu);
    }
  }

  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS_____NSCFDeallocBomb;
  -[__NSCFDeallocBomb dealloc](&v9, sel_dealloc);
}

- (void).cxx_destruct
{
}

@end