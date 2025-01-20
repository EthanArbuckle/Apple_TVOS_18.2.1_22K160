@interface NEPlaceholderDNSService
- (NEPlaceholderDNSService)init;
- (void)dealloc;
@end

@implementation NEPlaceholderDNSService

- (NEPlaceholderDNSService)init
{
  uint64_t v3 = ne_log_obj(self, a2);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v38 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "%@ installing placeholder DNS entry to the dynamic store",  buf,  0xCu);
  }

  v33.receiver = self;
  v33.super_class = (Class)&OBJC_CLASS___NEPlaceholderDNSService;
  v6 = -[NEPlaceholderDNSService init](&v33, "init");
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue([v7 UUIDString]);

    if (v8)
    {
      CFStringRef v41 = kSCDynamicStoreUseSessionKeys;
      CFBooleanRef v42 = kCFBooleanTrue;
      v11 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v42,  &v41,  1LL));
      v12 = SCDynamicStoreCreateWithOptions(kCFAllocatorDefault, @"NEPlaceholderDNSService", v11, 0LL, 0LL);
      v32 = v12;
      uint64_t v14 = ne_log_obj(v12, v13);
      v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      NetworkServiceEntity = v15;
      if (v12)
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v38 = v6;
          __int16 v39 = 2112;
          v40 = v8;
          _os_log_debug_impl( (void *)&_mh_execute_header,  NetworkServiceEntity,  OS_LOG_TYPE_DEBUG,  "%@ adding placeholder DNS entry for service %@ to the dynamic store",  buf,  0x16u);
        }

        NetworkServiceEntity = (os_log_s *)SCDynamicStoreKeyCreateNetworkServiceEntity( kCFAllocatorDefault,  kSCDynamicStoreDomainState,  v8,  kSCEntNetDNS);
        v17 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"placeholder-%u.hostname.internal",  (unsigned __int16)(arc4random_uniform(0x9C40u) + 10000));
        v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
        v35[0] = kSCPropNetDNSServerAddresses;
        v35[1] = kSCPropNetDNSServerPort;
        v36[0] = &off_1000C1668;
        v36[1] = &off_1000C1788;
        v36[2] = v18;
        v35[2] = kSCPropNetDNSDomainName;
        v35[3] = kSCPropNetDNSSupplementalMatchDomains;
        v34 = v18;
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v34, 1LL));
        v36[3] = v19;
        v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v36,  v35,  4LL));

        uint64_t v21 = SCDynamicStoreSetValue(v12, (CFStringRef)NetworkServiceEntity, v20);
        int v22 = v21;
        uint64_t v24 = ne_log_obj(v21, v23);
        v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
        v26 = v25;
        if (v22)
        {
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v38 = v6;
            __int16 v39 = 2112;
            v40 = v8;
            _os_log_debug_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEBUG,  "%@ successfully added placeholder DNS entry with key uuid: %@",  buf,  0x16u);
          }

          objc_setProperty_atomic(v6, v27, v8, 16LL);
          v6->_placeholderServiceStore = v12;
          v28 = v6;
        }

        else
        {
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v38 = v6;
            __int16 v39 = 2112;
            v40 = v8;
            _os_log_error_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_ERROR,  "%@ failed to add placeholder DNS entry for service %@ to the dynamic store",  buf,  0x16u);
          }

          myCFRelease(&v32);
          v28 = 0LL;
        }
      }

      else
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v38 = v6;
          _os_log_error_impl( (void *)&_mh_execute_header,  NetworkServiceEntity,  OS_LOG_TYPE_ERROR,  "%@ failed to open dynamic store session",  buf,  0xCu);
        }

        v28 = 0LL;
      }
    }

    else
    {
      uint64_t v29 = ne_log_obj(v9, v10);
      v11 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v38 = v6;
        _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%@ failed to create UUID", buf, 0xCu);
      }

      v28 = 0LL;
    }
  }

  else
  {
    uint64_t v31 = ne_log_obj(0LL, v5);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)v8, OS_LOG_TYPE_FAULT, "[super init] failed", buf, 2u);
    }

    v28 = 0LL;
  }

  return v28;
}

- (void)dealloc
{
  if (self)
  {
    placeholderServiceStore = self->_placeholderServiceStore;
    if (placeholderServiceStore)
    {
      CFRelease(placeholderServiceStore);
      self->_placeholderServiceStore = 0LL;
    }
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NEPlaceholderDNSService;
  -[NEPlaceholderDNSService dealloc](&v4, "dealloc");
}

- (void).cxx_destruct
{
}

@end