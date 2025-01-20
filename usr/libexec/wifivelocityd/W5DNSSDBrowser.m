@interface W5DNSSDBrowser
- (BOOL)addServiceInstance:(const char *)a3 serviceType:(const char *)a4 domain:(const char *)a5;
- (_DNSServiceRef_t)serviceRef;
- (id)_deconstructServiceType:(const void *)a3 rdlen:(unsigned __int16)a4;
- (id)_ipStringFromAddress:(const sockaddr *)a3;
- (id)addDomain:(const void *)a3 rdlen:(unsigned __int16)a4;
- (id)addServiceType:(const void *)a3 rdlen:(unsigned __int16)a4 fullname:(const char *)a5;
- (id)browseAllResults;
- (id)init:(BOOL)a3;
- (int)startBrowsing;
- (void)addBrowseContext:(id)a3;
- (void)addBrowseResult:(id)a3 hostname:(const char *)a4 address:(const sockaddr *)a5 interfaceIndex:(unsigned int)a6;
- (void)dealloc;
- (void)stopBrowsing;
@end

@implementation W5DNSSDBrowser

- (id)init:(BOOL)a3
{
  BOOL v3 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___W5DNSSDBrowser;
  v4 = -[W5DNSSDBrowser init](&v15, "init");
  if (!v4) {
    return v4;
  }
  *((void *)v4 + 2) = dispatch_queue_create("com.apple.wifivelocity.dnssd", 0LL);
  v5 = (DNSServiceRef *)(v4 + 8);
  DNSServiceErrorType Connection = DNSServiceCreateConnection((DNSServiceRef *)v4 + 1);
  if (Connection || !*v5)
  {
    v10 = (os_log_s *)sub_10008C90C();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 136315906;
      v17 = "-[W5DNSSDBrowser init:]";
      __int16 v18 = 2080;
      v19 = "W5LogManager.m";
      __int16 v20 = 1024;
      int v21 = 10075;
      __int16 v22 = 1024;
      DNSServiceErrorType v23 = Connection;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v10,  0LL,  "[wifivelocity] %s (%s:%u) DNSServiceCreateConnection failed. Error: %d",  &v16,  34);
    }
  }

  else
  {
    DNSServiceErrorType v7 = DNSServiceSetDispatchQueue(*v5, *((dispatch_queue_t *)v4 + 2));
    if (!v7)
    {
      *((void *)v4 + 3) = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
      *((void *)v4 + 4) = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
      v4[40] = 0;
      *((void *)v4 + 6) = 0LL;
      *((void *)v4 + 7) = 0LL;
      if (v3)
      {
        v4[40] = 1;
        v8 = objc_opt_new(&OBJC_CLASS___NSOperationQueue);
        *((void *)v4 + 6) = v8;
        -[NSOperationQueue setMaxConcurrentOperationCount:](v8, "setMaxConcurrentOperationCount:", -1LL);
        *((void *)v4 + 7) = objc_opt_new(&OBJC_CLASS___NSMutableSet);
      }

      return v4;
    }

    DNSServiceErrorType v11 = v7;
    v12 = (os_log_s *)sub_10008C90C();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 136315906;
      v17 = "-[W5DNSSDBrowser init:]";
      __int16 v18 = 2080;
      v19 = "W5LogManager.m";
      __int16 v20 = 1024;
      int v21 = 10078;
      __int16 v22 = 1024;
      DNSServiceErrorType v23 = v11;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v12,  0LL,  "[wifivelocity] %s (%s:%u) DNSServiceSetDispatchQueue failed. Error: %d",  &v16,  34);
    }
  }

  v13 = (os_log_s *)sub_10008C90C();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136315650;
    v17 = "-[W5DNSSDBrowser init:]";
    __int16 v18 = 2080;
    v19 = "W5LogManager.m";
    __int16 v20 = 1024;
    int v21 = 10103;
    LODWORD(v14) = 28;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v13,  0LL,  "[wifivelocity] %s (%s:%u) Failed to init W5DNSSDBrowser",  (const char *)&v16,  v14,  LODWORD(v15.receiver));
  }

  return 0LL;
}

- (_DNSServiceRef_t)serviceRef
{
  return self->_sdRef;
}

- (int)startBrowsing
{
  DNSServiceRef sdRef = self->_sdRef;
  return DNSServiceQueryRecord( &sdRef,  0x4000u,  0xFFFFFFFF,  "b._dns-sd._udp.local.",  0xCu,  1u,  (DNSServiceQueryRecordReply)sub_1000738C8,  self);
}

- (id)addDomain:(const void *)a3 rdlen:(unsigned __int16)a4
{
  int v5 = sub_10008E3E0((unsigned __int8 *)a3, 0LL, v19, 0LL);
  if (v5)
  {
    int v8 = v5;
    v9 = (os_log_s *)sub_10008C90C();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315906;
      v12 = "-[W5DNSSDBrowser addDomain:rdlen:]";
      __int16 v13 = 2080;
      v14 = "W5LogManager.m";
      __int16 v15 = 1024;
      int v16 = 10130;
      __int16 v17 = 1024;
      int v18 = v8;
      int v10 = 34;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v9,  0LL,  "[wifivelocity] %s (%s:%u) DomainNameToString failed. Error: %d",  (const char *)&v11,  v10);
    }

    return 0LL;
  }

  else
  {
    v6 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%s", v19);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->browseResults,  "setObject:forKeyedSubscript:",  +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"),  v6);
  }

  return v6;
}

- (id)addServiceType:(const void *)a3 rdlen:(unsigned __int16)a4 fullname:(const char *)a5
{
  id result = -[W5DNSSDBrowser _deconstructServiceType:rdlen:](self, "_deconstructServiceType:rdlen:", a3, a4);
  if (result)
  {
    id v8 = result;
    v9 = -[NSString substringFromIndex:]( +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s", a5),  "substringFromIndex:",  [@"_services._dns-sd._udp." length]);
    id result = -[NSMutableDictionary objectForKey:](self->browseResults, "objectForKey:", v9);
    if (result)
    {
      objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:](self->browseResults, "objectForKeyedSubscript:", v9),  "setObject:forKeyedSubscript:",  +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"),  v8);
      v10[0] = v8;
      v10[1] = v9;
      return +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v10, 2LL);
    }
  }

  return result;
}

- (BOOL)addServiceInstance:(const char *)a3 serviceType:(const char *)a4 domain:(const char *)a5
{
  id v8 = -[NSMutableDictionary objectForKey:]( self->browseResults,  "objectForKey:",  +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%s", a5));
  if (v8)
  {
    id v8 = [v8 objectForKey:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s", a4)];
    if (v8)
    {
      v9 = v8;
      if (DNSServiceConstructFullName(fullName, a3, a4, a5))
      {
        LOBYTE(v8) = 0;
      }

      else
      {
        [v9 setValue:+[NSMutableArray arrayWithObject:]( NSMutableArray, "arrayWithObject:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s", a3)), +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s", fullName) forKey];
        LOBYTE(v8) = 1;
      }
    }
  }

  return (char)v8;
}

- (void)addBrowseResult:(id)a3 hostname:(const char *)a4 address:(const sockaddr *)a5 interfaceIndex:(unsigned int)a6
{
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  id v10 = -[NSMutableDictionary allValues](self->browseResults, "allValues");
  id v11 = [v10 countByEnumeratingWithState:&v41 objects:v50 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v42;
    v32 = a5;
    v33 = self;
    v31 = a4;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v42 != v13) {
          objc_enumerationMutation(v10);
        }
        __int16 v15 = *(void **)(*((void *)&v41 + 1) + 8LL * (void)i);
        __int128 v37 = 0u;
        __int128 v38 = 0u;
        __int128 v39 = 0u;
        __int128 v40 = 0u;
        id v16 = [v15 allValues];
        id v17 = [v16 countByEnumeratingWithState:&v37 objects:v49 count:16];
        if (!v17) {
          continue;
        }
        id v18 = v17;
        uint64_t v19 = *(void *)v38;
        while (2)
        {
          for (j = 0LL; j != v18; j = (char *)j + 1)
          {
            if (*(void *)v38 != v19) {
              objc_enumerationMutation(v16);
            }
            id v21 = [*(id *)(*((void *)&v37 + 1) + 8 * (void)j) objectForKey:a3];
            if (v21)
            {
              __int16 v22 = v21;
              if_indextoname(a6, v48);
              DNSServiceErrorType v23 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%s", v48);
              SocketGetInterfaceInfo(0xFFFFFFFFLL, v48, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, &v36);
              id v24 = -[W5DNSSDBrowser _ipStringFromAddress:](v33, "_ipStringFromAddress:", v32);
              v47[0] = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%s", v31);
              v47[1] = v23;
              if (v36 <= 31)
              {
                v25 = "Enet";
                switch(v36)
                {
                  case 1:
                    goto LABEL_36;
                  case 2:
                    v25 = "WiFi";
                    break;
                  case 3:
                  case 5:
                  case 6:
                  case 7:
                    goto LABEL_29;
                  case 4:
                    v25 = "AWDL";
                    break;
                  case 8:
                    v25 = "USB";
                    break;
                  default:
                    if (v36 != 16) {
                      goto LABEL_29;
                    }
                    v25 = "Direct";
                    break;
                }

                goto LABEL_36;
              }

              if (v36 > 127)
              {
                if (v36 == 128)
                {
                  v25 = "NAN";
                }

                else
                {
                  if (v36 != 256) {
                    goto LABEL_29;
                  }
                  v25 = "IPsecBT";
                }
              }

              else
              {
                if (v36 != 32)
                {
                  if (v36 == 64)
                  {
                    v25 = "WFD";
                    goto LABEL_36;
                  }

- (void)addBrowseContext:(id)a3
{
}

- (id)browseAllResults
{
  return self->browseResults;
}

- (id)_deconstructServiceType:(const void *)a3 rdlen:(unsigned __int16)a4
{
  v4 = (char *)a3;
  int v5 = (char *)a3 + a4;
  char v6 = 1;
  DNSServiceErrorType v7 = __dst;
  while (1)
  {
    char v8 = v6;
    if (v5 - v4 < 1) {
      break;
    }
    unint64_t v9 = *v4;
    unint64_t v10 = v9 + 1;
    memcpy(v7, v4, v9 + 1);
    char v6 = 0;
    v4 += v10;
    v7 += v10;
    if ((v8 & 1) == 0)
    {
      *DNSServiceErrorType v7 = 0;
      int v11 = sub_10008E3E0(__dst, 0LL, v23, 0LL);
      if (!v11) {
        return +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%s", v23);
      }
      int v13 = v11;
      v14 = (os_log_s *)sub_10008C90C();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 136315906;
        id v16 = "-[W5DNSSDBrowser _deconstructServiceType:rdlen:]";
        __int16 v17 = 2080;
        id v18 = "W5LogManager.m";
        __int16 v19 = 1024;
        int v20 = 10284;
        __int16 v21 = 1024;
        int v22 = v13;
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v14,  0LL,  "[wifivelocity] %s (%s:%u) DomainNameToString failed. Error: %d",  (const char *)&v15,  34);
      }

      return 0LL;
    }
  }

  return 0LL;
}

- (id)_ipStringFromAddress:(const sockaddr *)a3
{
  int sa_family = a3->sa_family;
  if (sa_family == 30)
  {
    v4 = &a3->sa_data[6];
    int v5 = 30;
    socklen_t v6 = 46;
  }

  else
  {
    if (sa_family != 2)
    {
      *(_OWORD *)char v8 = *(_OWORD *)"Unsupported";
      memset(v9, 0, sizeof(v9));
      return +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%s", v8);
    }

    v4 = &a3->sa_data[2];
    int v5 = 2;
    socklen_t v6 = 16;
  }

  inet_ntop(v5, v4, v8, v6);
  return +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%s", v8);
}

- (void)stopBrowsing
{
  DNSServiceRef sdRef = self->_sdRef;
  if (sdRef) {
    DNSServiceRefDeallocate(sdRef);
  }
  self->_DNSServiceRef sdRef = 0LL;
  pingQueue = self->pingQueue;
  if (pingQueue) {
    -[NSOperationQueue cancelAllOperations](pingQueue, "cancelAllOperations");
  }

  self->browseContexts = 0LL;
  int v5 = (os_log_s *)sub_10008C90C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int64_t addedCount = self->addedCount;
    int64_t pingedCount = self->pingedCount;
    int v9 = 136316162;
    unint64_t v10 = "-[W5DNSSDBrowser stopBrowsing]";
    __int16 v11 = 2080;
    id v12 = "W5LogManager.m";
    __int16 v13 = 1024;
    int v14 = 10322;
    __int16 v15 = 2048;
    int64_t v16 = addedCount;
    __int16 v17 = 2048;
    int64_t v18 = pingedCount;
    int v8 = 48;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v5,  0LL,  "[wifivelocity] %s (%s:%u) Browsed IP Address Stats (unique). Added: %ld, Pinged: %ld",  (const char *)&v9,  v8);
  }

- (void)dealloc
{
  DNSServiceRef sdRef = self->_sdRef;
  if (sdRef) {
    DNSServiceRefDeallocate(sdRef);
  }
  dsnsdQueue = (dispatch_object_s *)self->dsnsdQueue;
  if (dsnsdQueue) {
    dispatch_release(dsnsdQueue);
  }
  browseContexts = self->browseContexts;
  if (browseContexts) {

  }
  pingQueue = self->pingQueue;
  if (pingQueue) {

  }
  pingedIPAddresses = self->pingedIPAddresses;
  if (pingedIPAddresses) {

  }
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___W5DNSSDBrowser;
  -[W5DNSSDBrowser dealloc](&v8, "dealloc");
}

@end