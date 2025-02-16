@interface NSURLHostNameAddressInfo
+ (id)addressInfoForHost:(id)a3;
+ (void)asyncResolveWithCallbackClient:(id)a3;
- (addrinfo)addrinfo;
- (double)_timestamp;
- (id)_initWithAddressInfo:(addrinfo *)a3;
- (void)dealloc;
@end

@implementation NSURLHostNameAddressInfo

+ (id)addressInfoForHost:(id)a3
{
  v4 = (void *)[(id)qword_18C496C78 objectForKey:a3];
  v5 = v4;
  if (v4)
  {
    [v4 _timestamp];
    if (v6 + 600.0 <= CFAbsoluteTimeGetCurrent())
    {
      [(id)qword_18C496C78 removeObjectForKey:a3];
      v5 = 0LL;
    }

    else
    {
      id v7 = v5;
      id v8 = v5;
    }
  }

  [(id)_MergedGlobals_125 unlock];
  return v5;
}

+ (void)asyncResolveWithCallbackClient:(id)a3
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  pthread_once(&initControl_0, (void (*)(void))NSURLHostNameAddressInfoInit);
  id v4 = a3;
  __dmb(0xBu);
  pthread_attr_init(&__attr);
  pthread_attr_setdetachstate(&__attr, 2);
  qos_class_t v5 = qos_class_main();
  pthread_attr_set_qos_class_np(&__attr, v5, 0);
  pthread_create(&v6, &__attr, (void *(__cdecl *)(void *))resolveHostName, a3);
  pthread_attr_destroy(&__attr);
}

- (id)_initWithAddressInfo:(addrinfo *)a3
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NSURLHostNameAddressInfo;
  id v4 = -[NSURLHostNameAddressInfo init](&v7, sel_init);
  qos_class_t v5 = v4;
  if (v4)
  {
    v4->addressInfo = a3;
    v4->timestamp = CFAbsoluteTimeGetCurrent();
  }

  return v5;
}

- (addrinfo)addrinfo
{
  return self->addressInfo;
}

- (double)_timestamp
{
  return self->timestamp;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  addressInfo = self->addressInfo;
  if (addressInfo) {
    freeaddrinfo(addressInfo);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NSURLHostNameAddressInfo;
  -[NSURLHostNameAddressInfo dealloc](&v4, sel_dealloc);
}

@end