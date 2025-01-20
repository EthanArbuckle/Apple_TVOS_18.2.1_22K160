@interface NSPProxyTokenInfo
+ (BOOL)supportsSecureCoding;
- (NSPProxyTokenInfo)init;
- (NSPProxyTokenInfo)initWithCoder:(id)a3;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)reportErrorForTokenRegistration:(id)a3 error:(int)a4 withOptions:(id)a5;
- (void)tokenLowWaterMarkReached;
@end

@implementation NSPProxyTokenInfo

- (NSString)description
{
  if (self)
  {
    v3 = -[NSMutableString initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableString), "initWithCapacity:", 0LL);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyProxyInfo proxyURL](self->_proxyInfo, "proxyURL"));
    sub_100043E90(v3, v4, @"Proxy URL", 0, 14LL);

    sub_100044730(v3, self->_tokenCount, (uint64_t)@"Proxy tokens count", 0, 14);
    sub_100043E90(v3, self->_tokenAgentUUID, @"Proxy token Agent UUID", 0, 14LL);
  }

  else
  {
    v3 = 0LL;
  }

  return (NSString *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  uint64_t v4 = nplog_obj(self, a2, v2);
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    if (self) {
      proxyInfo = self->_proxyInfo;
    }
    else {
      proxyInfo = 0LL;
    }
    v7 = proxyInfo;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyProxyInfo vendor](v7, "vendor"));
    *(_DWORD *)buf = 138412290;
    v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Dealloc: Proxy Token Info : \"%@\"", buf, 0xCu);
  }

  sub_10000C6C4((uint64_t)self, v9, v10);
  if (self)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained mergeTokenStats:self];

    tokenRegistration = self->_tokenRegistration;
  }

  else
  {
    [0 mergeTokenStats:0];
    tokenRegistration = 0LL;
  }

  sub_100006AF0((uint64_t)tokenRegistration);
  sub_10000C93C((uint64_t)self);
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___NSPProxyTokenInfo;
  -[NSPProxyTokenInfo dealloc](&v13, "dealloc");
}

- (NSPProxyTokenInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSPProxyTokenInfo;
  uint64_t v2 = -[NSPProxyTokenInfo init](&v6, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    tokenAgentUUID = v2->_tokenAgentUUID;
    v2->_tokenAgentUUID = (NSUUID *)v3;
  }

  return v2;
}

- (NSPProxyTokenInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = -[NSPProxyTokenInfo init](self, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSPPrivacyProxyProxyInfo) forKey:@"proxyInfo"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    proxyInfo = v5->_proxyInfo;
    v5->_proxyInfo = (NSPPrivacyProxyProxyInfo *)v7;

    id v9 = [v4 decodeObjectOfClass:objc_opt_class(NSUUID) forKey:@"proxyTokenAgentUUID"];
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    tokenAgentUUID = v5->_tokenAgentUUID;
    v5->_tokenAgentUUID = (NSUUID *)v10;

    v5->_tokenFetchRetryAttempt = (unint64_t)[v4 decodeIntegerForKey:@"proxyTokenFetchRetryAttempt"];
    v5->_tokenFetchRetryOnKeyOrNetworkChange = [v4 decodeBoolForKey:@"proxyTokenFetchRetryOnNetworkOrKeyChange"];
    id v12 = [v4 decodeObjectOfClass:objc_opt_class(NSDate) forKey:@"proxyTokenFetchRetryDate"];
    uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
    tokenFetchRetryDate = v5->_tokenFetchRetryDate;
    v5->_tokenFetchRetryDate = (NSDate *)v13;

    v5->_useDefaultInterface = [v4 decodeBoolForKey:@"proxyTokenUseDefaultInterface"];
    v5->_subscriber = [v4 decodeBoolForKey:@"proxyTokenSubscriber"];
    id v15 = [v4 decodeObjectOfClass:objc_opt_class(NSData) forKey:@"proxyTokenNetworkSignature"];
    uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
    networkSignature = v5->_networkSignature;
    v5->_networkSignature = (NSData *)v16;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  if (self)
  {
    [v5 encodeObject:self->_proxyInfo forKey:@"proxyInfo"];
    [v5 encodeObject:self->_tokenAgentUUID forKey:@"proxyTokenAgentUUID"];
    [v5 encodeInteger:self->_tokenFetchRetryAttempt forKey:@"proxyTokenFetchRetryAttempt"];
    [v5 encodeBool:self->_tokenFetchRetryOnKeyOrNetworkChange forKey:@"proxyTokenFetchRetryOnNetworkOrKeyChange"];
    [v5 encodeObject:self->_tokenFetchRetryDate forKey:@"proxyTokenFetchRetryDate"];
    [v5 encodeBool:self->_useDefaultInterface forKey:@"proxyTokenUseDefaultInterface"];
    [v5 encodeBool:self->_subscriber forKey:@"proxyTokenSubscriber"];
    networkSignature = self->_networkSignature;
  }

  else
  {
    [v5 encodeObject:0 forKey:@"proxyInfo"];
    [v5 encodeObject:0 forKey:@"proxyTokenAgentUUID"];
    [v5 encodeInteger:0 forKey:@"proxyTokenFetchRetryAttempt"];
    [v5 encodeBool:0 forKey:@"proxyTokenFetchRetryOnNetworkOrKeyChange"];
    [v5 encodeObject:0 forKey:@"proxyTokenFetchRetryDate"];
    [v5 encodeBool:0 forKey:@"proxyTokenUseDefaultInterface"];
    [v5 encodeBool:0 forKey:@"proxyTokenSubscriber"];
    networkSignature = 0LL;
  }

  [v5 encodeObject:networkSignature forKey:@"proxyTokenNetworkSignature"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = -[NSPProxyTokenInfo init]( +[NSPProxyTokenInfo allocWithZone:](&OBJC_CLASS___NSPProxyTokenInfo, "allocWithZone:", a3),  "init");
  uint64_t v5 = (uint64_t)v4;
  if (self)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (!v5) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  id WeakRetained = 0LL;
  if (v4) {
LABEL_3:
  }
    objc_storeWeak((id *)(v5 + 16), WeakRetained);
LABEL_4:

  if (self)
  {
    sub_10000E01C(v5, self->_proxyInfo);
    unint64_t tokenCount = self->_tokenCount;
    if (!v5) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }

  sub_10000E01C(v5, 0LL);
  unint64_t tokenCount = 0LL;
  if (v5) {
LABEL_6:
  }
    *(void *)(v5 + 32) = tokenCount;
LABEL_7:
  if (self)
  {
    sub_10000E02C(v5, self->_tokenRegistration);
    tokenAgentUUID = self->_tokenAgentUUID;
  }

  else
  {
    sub_10000E02C(v5, 0LL);
    tokenAgentUUID = 0LL;
  }

  id v9 = tokenAgentUUID;
  if (v5) {
    objc_storeStrong((id *)(v5 + 48), tokenAgentUUID);
  }

  if (self)
  {
    sub_10000E03C(v5, self->_tokenPath);
    BOOL tokenRequestPending = self->_tokenRequestPending;
    if (!v5) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }

  sub_10000E03C(v5, 0LL);
  BOOL tokenRequestPending = 0;
  if (v5) {
LABEL_13:
  }
    *(_BYTE *)(v5 + 8) = tokenRequestPending;
LABEL_14:
  if (self)
  {
    sub_10000C7E4(v5, self->_tokenFetchRetryTimer);
    unint64_t tokenFetchRetryAttempt = self->_tokenFetchRetryAttempt;
    if (!v5) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }

  sub_10000C7E4(v5, 0LL);
  unint64_t tokenFetchRetryAttempt = 0LL;
  if (v5) {
LABEL_16:
  }
    *(void *)(v5 + 72) = tokenFetchRetryAttempt;
LABEL_17:
  if (self)
  {
    BOOL tokenFetchRetryOnKeyOrNetworkChange = self->_tokenFetchRetryOnKeyOrNetworkChange;
    if (!v5) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }

  BOOL tokenFetchRetryOnKeyOrNetworkChange = 0;
  if (v5) {
LABEL_19:
  }
    *(_BYTE *)(v5 + 9) = tokenFetchRetryOnKeyOrNetworkChange;
LABEL_20:
  if (self)
  {
    sub_10000C7F4(v5, self->_tokenFetchRetryDate);
    BOOL useDefaultInterface = self->_useDefaultInterface;
    if (!v5) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }

  sub_10000C7F4(v5, 0LL);
  BOOL useDefaultInterface = 0;
  if (v5) {
LABEL_22:
  }
    *(_BYTE *)(v5 + 10) = useDefaultInterface;
LABEL_23:
  if (self)
  {
    BOOL subscriber = self->_subscriber;
    if (!v5) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }

  BOOL subscriber = 0;
  if (v5) {
LABEL_25:
  }
    *(_BYTE *)(v5 + 11) = subscriber;
LABEL_26:
  if (self)
  {
    unint64_t tokenFetchSuccessCount = self->_tokenFetchSuccessCount;
    if (!v5) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }

  unint64_t tokenFetchSuccessCount = 0LL;
  if (v5) {
LABEL_28:
  }
    *(void *)(v5 + 88) = tokenFetchSuccessCount;
LABEL_29:
  if (self)
  {
    unint64_t tokenConsumedCount = self->_tokenConsumedCount;
    if (!v5) {
      goto LABEL_32;
    }
    goto LABEL_31;
  }

  unint64_t tokenConsumedCount = 0LL;
  if (v5) {
LABEL_31:
  }
    *(void *)(v5 + 96) = tokenConsumedCount;
LABEL_32:
  if (self)
  {
    unint64_t tokenExpiredCount = self->_tokenExpiredCount;
    if (!v5) {
      goto LABEL_35;
    }
    goto LABEL_34;
  }

  unint64_t tokenExpiredCount = 0LL;
  if (v5) {
LABEL_34:
  }
    *(void *)(v5 + 104) = tokenExpiredCount;
LABEL_35:
  if (self)
  {
    unint64_t tokenFetchFailedCount = self->_tokenFetchFailedCount;
    if (!v5) {
      goto LABEL_38;
    }
    goto LABEL_37;
  }

  unint64_t tokenFetchFailedCount = 0LL;
  if (v5) {
LABEL_37:
  }
    *(void *)(v5 + 112) = tokenFetchFailedCount;
LABEL_38:
  if (self)
  {
    unint64_t agentLowWaterMarkHitCount = self->_agentLowWaterMarkHitCount;
    if (!v5) {
      goto LABEL_41;
    }
    goto LABEL_40;
  }

  unint64_t agentLowWaterMarkHitCount = 0LL;
  if (v5) {
LABEL_40:
  }
    *(void *)(v5 + 120) = agentLowWaterMarkHitCount;
LABEL_41:
  if (self)
  {
    unint64_t cacheLowWaterMarkHitCount = self->_cacheLowWaterMarkHitCount;
    if (!v5) {
      goto LABEL_44;
    }
    goto LABEL_43;
  }

  unint64_t cacheLowWaterMarkHitCount = 0LL;
  if (v5) {
LABEL_43:
  }
    *(void *)(v5 + 128) = cacheLowWaterMarkHitCount;
LABEL_44:
  if (self)
  {
    unint64_t badTokenCount = self->_badTokenCount;
    if (!v5) {
      goto LABEL_47;
    }
    goto LABEL_46;
  }

  unint64_t badTokenCount = 0LL;
  if (v5) {
LABEL_46:
  }
    *(void *)(v5 + 136) = badTokenCount;
LABEL_47:
  if (self)
  {
    unint64_t missingTokenCount = self->_missingTokenCount;
    if (!v5) {
      goto LABEL_50;
    }
    goto LABEL_49;
  }

  unint64_t missingTokenCount = 0LL;
  if (v5) {
LABEL_49:
  }
    *(void *)(v5 + 144) = missingTokenCount;
LABEL_50:
  if (self) {
    self = (NSPProxyTokenInfo *)self->_networkSignature;
  }
  v23 = self;
  if (v5) {
    objc_storeStrong((id *)(v5 + 152), self);
  }

  id v24 = (id)v5;
  return v24;
}

- (void)tokenLowWaterMarkReached
{
  if (self) {
    ++self->_agentLowWaterMarkHitCount;
  }
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  if (self) {
    proxyInfo = self->_proxyInfo;
  }
  else {
    proxyInfo = 0LL;
  }
  uint64_t v5 = proxyInfo;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyProxyInfo vendor](v5, "vendor"));
  uint64_t v7 = sub_10000E688((uint64_t)self);

  +[NSPCoreData saveTokenEvent:eventType:vendor:tokenCount:]( &OBJC_CLASS___NSPCoreData,  "saveTokenEvent:eventType:vendor:tokenCount:",  v3,  0LL,  v6,  v7);
  sub_10000D5C4((uint64_t)self);
  sub_10000F5A8((uint64_t)self);
}

- (void)reportErrorForTokenRegistration:(id)a3 error:(int)a4 withOptions:(id)a5
{
  v8 = (id *)a3;
  __int128 buffer = 0u;
  memset(v40, 0, sizeof(v40));
  uint64_t v9 = objc_claimAutoreleasedReturnValue([a5 objectForKeyedSubscript:NWNetworkAgentStartOptionClientUUID]);
  id v12 = (void *)v9;
  if (!v9)
  {
    v22 = 0LL;
    goto LABEL_14;
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NWPath pathForClientID:](&OBJC_CLASS___NWPath, "pathForClientID:", v9));
  v14 = v13;
  if (v13)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 interface]);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v14 parameters]);
    int v17 = [v16 pid];
    if (v17)
    {
      int v18 = v17;
      uint64_t v19 = proc_pidinfo(v17, 13, 1uLL, &buffer, 64);
      if ((_DWORD)v19 == 64)
      {
        v22 = (const char *)v40;
LABEL_12:

        goto LABEL_13;
      }

      uint64_t v23 = nplog_obj(v19, v20, v21);
      id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        int v33 = 67109120;
        int v34 = v18;
        _os_log_error_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "Failed to convert from PID (%d) to process name",  (uint8_t *)&v33,  8u);
      }
    }

    v22 = 0LL;
    goto LABEL_12;
  }

  v22 = 0LL;
LABEL_13:

LABEL_14:
  uint64_t v25 = nplog_obj(v9, v10, v11);
  v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    if (!v22) {
      v22 = "none";
    }
    if (self) {
      proxyInfo = self->_proxyInfo;
    }
    else {
      proxyInfo = 0LL;
    }
    v28 = proxyInfo;
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyProxyInfo vendor](v28, "vendor"));
    int v33 = 67109634;
    int v34 = a4;
    __int16 v35 = 2080;
    v36 = v22;
    __int16 v37 = 2112;
    v38 = v29;
    _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_INFO,  "Received error (%d) from %s for %@ agent",  (uint8_t *)&v33,  0x1Cu);
  }

  if (a4 == 81)
  {
    if (self) {
      ++self->_missingTokenCount;
    }
    sub_10000D5C4((uint64_t)self);
    sub_10000F5A8((uint64_t)self);
    sub_10000E8B4((uint64_t)self);
  }

  else if (a4 == 80)
  {
    if (self)
    {
      ++self->_badTokenCount;
      if (v8) {
        [v8[3] flushTokens];
      }
      sub_10000E718((uint64_t)self, v30, v31);
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    }

    else
    {
      if (v8) {
        [v8[3] flushTokens];
      }
      id WeakRetained = 0LL;
    }

    [WeakRetained tokenInfoInvalid:self];
  }
}

- (void).cxx_destruct
{
}

@end