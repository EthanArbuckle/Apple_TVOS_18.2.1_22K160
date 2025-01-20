@interface NSPProber
+ (BOOL)supportsSecureCoding;
- (NSPProber)initWithCoder:(id)a3;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSPProber

- (NSString)description
{
  if (self)
  {
    v3 = -[NSMutableString initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableString), "initWithCapacity:", 0LL);
    sub_100043E90(v3, self->_name, @"Probe", 0, 14LL);
    sub_1000446CC(v3, self->_probingActive, (uint64_t)@"Probing active", 0, 14);
    sub_100044730(v3, self->_probeCount, (uint64_t)@"Probe count", 0, 14);
    sub_100044730(v3, self->_probeSuccessCount, (uint64_t)@"Probe success count", 0, 14);
    sub_100044730(v3, self->_probeFailedCount, (uint64_t)@"Probe failed count", 0, 14);
    sub_100044730(v3, self->_probeRedirectedCount, (uint64_t)@"Probe redirected count", 0, 14);
    sub_100044730(v3, self->_probeServerErrorCount, (uint64_t)@"Probe server error count", 0, 14);
  }

  else
  {
    v3 = 0LL;
  }

  return (NSString *)v3;
}

- (NSPProber)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___NSPProber;
  v5 = -[NSPProber init](&v13, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"proberName"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    name = v5->_name;
    v5->_name = (NSString *)v7;

    v5->_proxyProber = [v4 decodeBoolForKey:@"proberProxy"];
    v5->_probeCount = (unint64_t)[v4 decodeIntegerForKey:@"proberProbeCount"];
    v5->_probeConnectionTimeout = (unint64_t)[v4 decodeIntegerForKey:@"proberProbeConnectionTimeout"];
    v5->_probingActive = [v4 decodeBoolForKey:@"proberProbeActiveCount"];
    v5->_probeOnNetworkChange = [v4 decodeBoolForKey:@"proberProbeOnNetworkChange"];
    v5->_linkQuality = [v4 decodeIntForKey:@"proberLinkQuality"];
    id v9 = [v4 decodeObjectOfClass:objc_opt_class(NSDate) forKey:@"proberNextProbeDate"];
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    nextProbeDate = v5->_nextProbeDate;
    v5->_nextProbeDate = (NSDate *)v10;

    v5->_probeSuccessCount = (unint64_t)[v4 decodeIntegerForKey:@"proberProbeSuccessCount"];
    v5->_probeFailedCount = (unint64_t)[v4 decodeIntegerForKey:@"proberProbeFailedCount"];
    v5->_probeRedirectedCount = (unint64_t)[v4 decodeIntegerForKey:@"proberProbeRedirectedCount"];
    v5->_probeServerErrorCount = (unint64_t)[v4 decodeIntegerForKey:@"proberProbeServerErrorCount"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  if (self)
  {
    [v5 encodeObject:self->_name forKey:@"proberName"];
    [v5 encodeBool:self->_proxyProber forKey:@"proberProxy"];
    [v5 encodeInteger:self->_probeCount forKey:@"proberProbeCount"];
    [v5 encodeInteger:self->_probeConnectionTimeout forKey:@"proberProbeConnectionTimeout"];
    [v5 encodeBool:self->_probingActive forKey:@"proberProbeActiveCount"];
    [v5 encodeBool:self->_probeOnNetworkChange forKey:@"proberProbeOnNetworkChange"];
    [v5 encodeInt:self->_linkQuality forKey:@"proberLinkQuality"];
    [v5 encodeObject:self->_nextProbeDate forKey:@"proberNextProbeDate"];
    [v5 encodeInteger:self->_probeSuccessCount forKey:@"proberProbeSuccessCount"];
    [v5 encodeInteger:self->_probeFailedCount forKey:@"proberProbeFailedCount"];
    [v5 encodeInteger:self->_probeRedirectedCount forKey:@"proberProbeRedirectedCount"];
    unint64_t probeServerErrorCount = self->_probeServerErrorCount;
  }

  else
  {
    [v5 encodeObject:0 forKey:@"proberName"];
    [v5 encodeBool:0 forKey:@"proberProxy"];
    [v5 encodeInteger:0 forKey:@"proberProbeCount"];
    [v5 encodeInteger:0 forKey:@"proberProbeConnectionTimeout"];
    [v5 encodeBool:0 forKey:@"proberProbeActiveCount"];
    [v5 encodeBool:0 forKey:@"proberProbeOnNetworkChange"];
    [v5 encodeInt:0 forKey:@"proberLinkQuality"];
    [v5 encodeObject:0 forKey:@"proberNextProbeDate"];
    [v5 encodeInteger:0 forKey:@"proberProbeSuccessCount"];
    [v5 encodeInteger:0 forKey:@"proberProbeFailedCount"];
    [v5 encodeInteger:0 forKey:@"proberProbeRedirectedCount"];
    unint64_t probeServerErrorCount = 0LL;
  }

  [v5 encodeInteger:probeServerErrorCount forKey:@"proberProbeServerErrorCount"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = -[NSPProber init](+[NSPProber allocWithZone:](&OBJC_CLASS___NSPProber, "allocWithZone:", a3), "init");
  uint64_t v5 = (uint64_t)v4;
  if (self)
  {
    sub_10000E01C((uint64_t)v4, self->_name);
    BOOL proxyProber = self->_proxyProber;
    if (!v5) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  sub_10000E01C((uint64_t)v4, 0LL);
  BOOL proxyProber = 0;
  if (v5) {
LABEL_3:
  }
    *(_BYTE *)(v5 + 11) = proxyProber;
LABEL_4:
  if (self)
  {
    sub_10001F910(v5, self->_probeSession);
    sub_10000E02C(v5, self->_dataTask);
    sub_100006F58(v5, self->_operationQueue);
    sub_10000E03C(v5, self->_probeRetryTimer);
    unint64_t probeCount = self->_probeCount;
    if (!v5) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }

  sub_10001F910(v5, 0LL);
  sub_10000E02C(v5, 0LL);
  sub_100006F58(v5, 0LL);
  sub_10000E03C(v5, 0LL);
  unint64_t probeCount = 0LL;
  if (v5) {
LABEL_6:
  }
    *(void *)(v5 + 64) = probeCount;
LABEL_7:
  if (self)
  {
    unint64_t probeConnectionTimeout = self->_probeConnectionTimeout;
    if (!v5) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }

  unint64_t probeConnectionTimeout = 0LL;
  if (v5) {
LABEL_9:
  }
    *(void *)(v5 + 72) = probeConnectionTimeout;
LABEL_10:
  if (self)
  {
    BOOL probingActive = self->_probingActive;
    if (!v5) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }

  BOOL probingActive = 0;
  if (v5) {
LABEL_12:
  }
    *(_BYTE *)(v5 + 8) = probingActive;
LABEL_13:
  if (self)
  {
    BOOL probeOnNetworkChange = self->_probeOnNetworkChange;
    if (!v5) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }

  BOOL probeOnNetworkChange = 0;
  if (v5) {
LABEL_15:
  }
    *(_BYTE *)(v5 + 9) = probeOnNetworkChange;
LABEL_16:
  if (self)
  {
    int linkQuality = self->_linkQuality;
    if (!v5) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }

  int linkQuality = 0;
  if (v5) {
LABEL_18:
  }
    *(_DWORD *)(v5 + 12) = linkQuality;
LABEL_19:
  if (self)
  {
    sub_10000C7F4(v5, self->_nextProbeDate);
    path = self->_path;
    if (!v5) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }

  sub_10000C7F4(v5, 0LL);
  path = 0LL;
  if (v5) {
LABEL_21:
  }
    objc_storeStrong((id *)(v5 + 88), path);
LABEL_22:
  if (self)
  {
    BOOL probePending = self->_probePending;
    if (!v5) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }

  BOOL probePending = 0;
  if (v5) {
LABEL_24:
  }
    *(_BYTE *)(v5 + 10) = probePending;
LABEL_25:
  if (self)
  {
    unint64_t probeSuccessCount = self->_probeSuccessCount;
    if (!v5) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }

  unint64_t probeSuccessCount = 0LL;
  if (v5) {
LABEL_27:
  }
    *(void *)(v5 + 96) = probeSuccessCount;
LABEL_28:
  if (self)
  {
    unint64_t probeFailedCount = self->_probeFailedCount;
    if (!v5) {
      goto LABEL_31;
    }
    goto LABEL_30;
  }

  unint64_t probeFailedCount = 0LL;
  if (v5) {
LABEL_30:
  }
    *(void *)(v5 + 104) = probeFailedCount;
LABEL_31:
  if (self)
  {
    unint64_t probeRedirectedCount = self->_probeRedirectedCount;
    if (!v5) {
      goto LABEL_34;
    }
    goto LABEL_33;
  }

  unint64_t probeRedirectedCount = 0LL;
  if (v5) {
LABEL_33:
  }
    *(void *)(v5 + 112) = probeRedirectedCount;
LABEL_34:
  if (!self)
  {
    unint64_t probeServerErrorCount = 0LL;
    if (!v5) {
      return (id)v5;
    }
    goto LABEL_36;
  }

  unint64_t probeServerErrorCount = self->_probeServerErrorCount;
  if (v5) {
LABEL_36:
  }
    *(void *)(v5 + 120) = probeServerErrorCount;
  return (id)v5;
}

- (void)dealloc
{
  uint64_t v4 = nplog_obj(self, a2, v2);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    if (self) {
      name = self->_name;
    }
    else {
      name = 0LL;
    }
    *(_DWORD *)buf = 138412290;
    v12 = name;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Dealloc %@ prober", buf, 0xCu);
  }

  sub_100020588((uint64_t)self, v7, v8);
  if (self)
  {
    probeSession = self->_probeSession;
    if (probeSession)
    {
      -[NSURLSession invalidateAndCancel](probeSession, "invalidateAndCancel");
      sub_10001F910((uint64_t)self, 0LL);
    }
  }

  sub_100006F58((uint64_t)self, 0LL);
  sub_10000E02C((uint64_t)self, 0LL);
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NSPProber;
  -[NSPProber dealloc](&v10, "dealloc");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
}

@end