@interface SDDomainBrowser
+ (id)sharedBrowser;
- (SDDomainBrowser)init;
- (id)childrenForNode:(__SFNode *)a3;
- (id)displayNameForDomain:(id)a3;
- (void)browseAfterDelay:(double)a3;
- (void)buildNodes;
- (void)netServiceBrowser:(id)a3 didFindDomain:(id)a4 moreComing:(BOOL)a5;
- (void)netServiceBrowser:(id)a3 didNotSearch:(id)a4;
- (void)netServiceBrowser:(id)a3 didRemoveDomain:(id)a4 moreComing:(BOOL)a5;
- (void)parseDomain:(id)a3;
- (void)postNotification;
- (void)restart;
- (void)scheduleBrowser;
- (void)start;
- (void)statusChanged:(id)a3;
- (void)stop;
@end

@implementation SDDomainBrowser

+ (id)sharedBrowser
{
  if (qword_100657168 != -1) {
    dispatch_once(&qword_100657168, &stru_1005CEB48);
  }
  return (id)qword_100657170;
}

- (SDDomainBrowser)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SDDomainBrowser;
  v2 = -[SDDomainBrowser init](&v9, "init");
  v3 = v2;
  if (v2)
  {
    timer = v2->_timer;
    v2->_timer = 0LL;

    v3->_clientCount = 0;
    domainBrowser = v3->_domainBrowser;
    v3->_domainBrowser = 0LL;

    v3->_sendNotification = 0;
    v6 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
    domains = v3->_domains;
    v3->_domains = v6;

    v3->_domainTree = CFDictionaryCreateMutable( 0LL,  0LL,  (const CFDictionaryKeyCallBacks *)&unk_1005CEAE8,  &kCFTypeDictionaryValueCallBacks);
  }

  return v3;
}

- (void)browseAfterDelay:(double)a3
{
  timer = self->_timer;
  dispatch_time_t v4 = sub_100114580(a3);
  sub_100114638((dispatch_source_s *)timer, v4);
}

- (void)statusChanged:(id)a3
{
}

- (void)scheduleBrowser
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSNetServiceBrowser);
  domainBrowser = self->_domainBrowser;
  self->_domainBrowser = v3;

  -[NSNetServiceBrowser searchForBrowsableDomains](self->_domainBrowser, "searchForBrowsableDomains");
  -[NSNetServiceBrowser setDelegate:](self->_domainBrowser, "setDelegate:", self);
}

- (void)restart
{
  if (self->_clientCount >= 1)
  {
    -[NSMutableSet removeAllObjects](self->_domains, "removeAllObjects");
    domainBrowser = self->_domainBrowser;
    if (domainBrowser) {
      -[NSNetServiceBrowser stop](domainBrowser, "stop");
    }
    CFDictionaryRemoveAllValues(self->_domainTree);
    -[SDDomainBrowser scheduleBrowser](self, "scheduleBrowser");
  }

- (id)childrenForNode:(__SFNode *)a3
{
  if (SFNodeIsRoot(a3))
  {
    Value = (void *)CFDictionaryGetValue(self->_domainTree, &stru_1005E3958);
  }

  else
  {
    v6 = (const __CFSet *)SFNodeCopyKinds(a3);
    if (CFSetContainsValue(v6, kSFNodeKindDomain))
    {
      v8 = (const void *)SFNodeCopyRealName(a3, v7);
      Value = (void *)CFDictionaryGetValue(self->_domainTree, v8);
      CFRelease(v8);
    }

    else
    {
      Value = 0LL;
    }

    CFRelease(v6);
  }

  return [Value allValues];
}

- (id)displayNameForDomain:(id)a3
{
  v3 = (__CFString *)a3;
  dispatch_time_t v4 = (char *)-[__CFString length](v3, "length", 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL) + 1;
  v5 = (char *)malloc((size_t)v4);
  if (CFStringGetCString(v3, v5, (CFIndex)v4, 0x8000100u))
  {
    Mutable = CFStringCreateMutable(0LL, 0LL);
    if (v5 && *v5)
    {
      uint64_t v7 = (unsigned __int8 *)v5;
      do
      {
        uint64_t v7 = sub_1001184F0(v7, (uint64_t)&v11);
        v8 = CFStringCreateWithCString(0LL, (const char *)&v11, 0x8000100u);
        if (v8)
        {
          objc_super v9 = v8;
          CFStringAppend(Mutable, v8);
          CFRelease(v9);
        }

        if (!v7) {
          break;
        }
        if (*v7) {
          CFStringAppend(Mutable, @".");
        }
      }

      while (*v7);
    }
  }

  else
  {
    Mutable = 0LL;
  }

  free(v5);

  return Mutable;
}

- (void)parseDomain:(id)a3
{
  dispatch_time_t v4 = (__CFString *)a3;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  *(_OWORD *)cStr = 0u;
  __int128 v28 = 0u;
  if (v4)
  {
    bzero(v26, 0x400uLL);
    id v5 = -[__CFString length](v4, "length");
    v6 = (char *)malloc((size_t)v5 + 1);
    CFStringGetCString(v4, v6, (CFIndex)v5 + 1, 0x8000100u);
    uint64_t v7 = 0LL;
    v6[(void)v5 - 1] = 0;
    v24 = v6;
    v8 = (unsigned __int8 *)v6;
    while (*v8)
    {
      uint64_t v9 = v7 + 1;
      v26[v7] = v8;
      v8 = sub_1001184F0(v8, (uint64_t)cStr);
      uint64_t v7 = v9;
      if (!v8) {
        goto LABEL_7;
      }
    }

    LODWORD(v9) = v7;
LABEL_7:
    int v10 = v9 - 1;
    if ((int)v9 >= 1)
    {
      CFStringRef v11 = 0LL;
      BOOL v12 = 0;
      uint64_t v25 = kSFNodeKindDomain;
      uint64_t v13 = v9 + 1LL;
      do
      {
        if (v11) {
          CFRelease(v11);
        }
        v14 = (char *)v26[v10];
        CFStringRef v11 = CFStringCreateWithCString(0LL, v14, 0x8000100u);
        if (v12)
        {
          v15 = sub_1001184F0((unsigned __int8 *)v14, (uint64_t)cStr);
          CFStringRef v16 = CFStringCreateWithCString(0LL, cStr, 0x8000100u);
          CFStringRef v17 = CFStringCreateWithCString(0LL, (const char *)v15, 0x8000100u);
          Value = (void *)CFDictionaryGetValue(self->_domainTree, v17);
          if (!Value)
          {
            Value = CFDictionaryCreateMutable( 0LL,  0LL,  (const CFDictionaryKeyCallBacks *)&unk_1005CEAE8,  &kCFTypeDictionaryValueCallBacks);
            CFDictionarySetValue(self->_domainTree, v17, Value);
            CFRelease(Value);
          }

          if (!CFDictionaryGetValue((CFDictionaryRef)Value, v16))
          {
            v19 = (const void *)SFNodeCreate(0LL, v16, v11);
            SFNodeAddDomain(v19, v11);
            SFNodeAddKind(v19, v25);
            SFNodeSetDomain(v19, v17);
            CFDictionarySetValue((CFMutableDictionaryRef)Value, v16, v19);
            CFRelease(v19);
          }

          CFRelease(v16);
          CFRelease(v17);
          BOOL v12 = 1;
        }

        else
        {
          v20 = (const __CFDictionary *)CFDictionaryGetValue(self->_domainTree, &stru_1005E3958);
          if (v20) {
            BOOL v12 = CFDictionaryGetValue(v20, v11) != 0LL;
          }
          else {
            BOOL v12 = 0;
          }
        }

        --v13;
        --v10;
      }

      while (v13 > 1);
      if (v11)
      {
        if (!v12)
        {
          Mutable = (void *)CFDictionaryGetValue(self->_domainTree, &stru_1005E3958);
          if (!Mutable)
          {
            Mutable = CFDictionaryCreateMutable( 0LL,  0LL,  (const CFDictionaryKeyCallBacks *)&unk_1005CEAE8,  &kCFTypeDictionaryValueCallBacks);
            CFDictionarySetValue(self->_domainTree, &stru_1005E3958, Mutable);
            CFRelease(Mutable);
          }

          v22 = (void *)objc_claimAutoreleasedReturnValue(-[SDDomainBrowser displayNameForDomain:](self, "displayNameForDomain:", v11));
          v23 = (const void *)SFNodeCreate(0LL, v22, v11);
          SFNodeAddDomain(v23, v11);
          SFNodeAddKind(v23, v25);
          CFDictionarySetValue((CFMutableDictionaryRef)Mutable, v11, v23);
          CFRelease(v23);
        }

        CFRelease(v11);
      }
    }

    free(v24);
  }
}

- (void)buildNodes
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](self->_domains, "allObjects"));

  if (v3)
  {
    uint64_t Count = CFArrayGetCount((CFArrayRef)v3);
    MutableCopy = CFArrayCreateMutableCopy(0LL, Count, (CFArrayRef)v3);
    v7.location = 0LL;
    v7.length = Count;
    CFArraySortValues(MutableCopy, v7, (CFComparatorFunction)sub_1001189F4, self);
    if (Count >= 1)
    {
      for (CFIndex i = 0LL; i != Count; ++i)
        -[SDDomainBrowser parseDomain:](self, "parseDomain:", CFArrayGetValueAtIndex(MutableCopy, i));
    }

    CFRelease(MutableCopy);
  }

- (void)postNotification
{
  if (self->_clientCount >= 1)
  {
    id v2 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v2 postNotificationName:@"com.apple.sharingd.DomainsChanged" object:0 userInfo:0];
  }

- (void)netServiceBrowser:(id)a3 didFindDomain:(id)a4 moreComing:(BOOL)a5
{
  id v9 = a4;
  CFRange v7 = (void *)objc_claimAutoreleasedReturnValue([v9 lowercaseString]);
  v8 = v7;
  if (!a5)
  {
    -[SDDomainBrowser buildNodes](self, "buildNodes");
    -[SDDomainBrowser postNotification](self, "postNotification");
  }
}

- (void)netServiceBrowser:(id)a3 didRemoveDomain:(id)a4 moreComing:(BOOL)a5
{
  if (!a5)
  {
    -[SDDomainBrowser buildNodes](self, "buildNodes");
    -[SDDomainBrowser postNotification](self, "postNotification");
  }

- (void)netServiceBrowser:(id)a3 didNotSearch:(id)a4
{
  id v4 = a4;
  uint64_t v6 = browser_log(v4, v5);
  CFRange v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_100118E5C((uint64_t)v4, v7);
  }
}

- (void)start
{
  clientuint64_t Count = self->_clientCount;
  self->_clientuint64_t Count = clientCount + 1;
  if (!clientCount)
  {
    -[SDDomainBrowser scheduleBrowser](self, "scheduleBrowser");
    if (!self->_timer)
    {
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472LL;
      v8[2] = sub_100118CA4;
      v8[3] = &unk_1005CB2F8;
      v8[4] = self;
      id v4 = sub_100114598(1, &_dispatch_main_q, v8);
      uint64_t v5 = (OS_dispatch_source *)objc_claimAutoreleasedReturnValue(v4);
      timer = self->_timer;
      self->_timer = v5;

      dispatch_resume((dispatch_object_t)self->_timer);
    }

    CFRange v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v7 addObserver:self selector:"statusChanged:" name:@"com.apple.sharingd.MulticastDNSChanged" object:0];
  }

- (void)stop
{
  int v2 = self->_clientCount - 1;
  self->_clientuint64_t Count = v2;
  if (!v2)
  {
    domainBrowser = self->_domainBrowser;
    if (domainBrowser)
    {
      -[NSNetServiceBrowser setDelegate:](domainBrowser, "setDelegate:", 0LL);
      -[NSNetServiceBrowser stop](self->_domainBrowser, "stop");
      uint64_t v5 = self->_domainBrowser;
      self->_domainBrowser = 0LL;
    }

    -[NSMutableSet removeAllObjects](self->_domains, "removeAllObjects");
    CFDictionaryRemoveAllValues(self->_domainTree);
    id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v6 removeObserver:self];
  }

- (void).cxx_destruct
{
}

@end