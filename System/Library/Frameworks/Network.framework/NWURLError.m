@interface NWURLError
+ (NSDictionary)allUserInfoKeys;
- (NSData)downloadTaskResumeData;
- (NSError)underlyingError;
- (NSNumber)blockedTrackerFailure;
- (NSNumber)networkUnavailableReason;
- (NSNumber)privacyProxyFailure;
- (NSNumber)vpnInactiveFailure;
- (NSNumber)webSocketHandshakeFailureReason;
- (NSURL)failingURL;
- (NWURLError)initWithCoder:(id)a3;
- (OS_nw_path)path;
- (OS_nw_resolution_report)resolutionReport;
- (__SecTrust)peerTrust;
- (id)copyWithZone:(_NSZone *)a3;
- (id)localizedDescription;
- (id)localizedFailureReason;
- (id)localizedRecoverySuggestion;
- (id)userInfo;
- (int64_t)translateCodeForError:(__CFError *)a3;
- (int64_t)translateDNSError:(int64_t)a3;
- (int64_t)translatePOSIXError:(int64_t)a3;
- (int64_t)translateTLSError:(int64_t)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)fillErrorForLoader:(id)a3 andTask:(id)a4;
- (void)initWithNWError:(void *)a3 forLoader:(void *)a4 andTask:;
- (void)setBlockedTrackerFailure:(id)a3;
- (void)setDownloadTaskResumeData:(id)a3;
- (void)setFailingURL:(id)a3;
- (void)setNetworkUnavailableReason:(id)a3;
- (void)setPath:(id)a3;
- (void)setPeerTrust:(__SecTrust *)a3;
- (void)setPrivacyProxyFailure:(id)a3;
- (void)setResolutionReport:(id)a3;
- (void)setUnderlyingError:(id)a3;
- (void)setVpnInactiveFailure:(id)a3;
- (void)setWebSocketHandshakeFailureReason:(id)a3;
@end

@implementation NWURLError

- (id)userInfo
{
  v3 = objc_alloc_init(&OBJC_CLASS___NWURLErrorUserInfoDictionary);
  -[NWURLErrorUserInfoDictionary setError:](v3, "setError:", self);
  return v3;
}

- (NWURLError)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"NSCode"];
  if (self)
  {
    uint64_t v6 = *MEMORY[0x189607740];
    v16.receiver = self;
    v16.super_class = (Class)&OBJC_CLASS___NWURLError;
    self = -[NWURLError initWithDomain:code:userInfo:](&v16, sel_initWithDomain_code_userInfo_, v6, v5, 0LL);
    if (self)
    {
      [v4 decodeObjectOfClass:objc_opt_class() forKey:@"underlyingError"];
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NWURLError setUnderlyingError:](self, "setUnderlyingError:", v7);

      [v4 decodeObjectOfClass:objc_opt_class() forKey:@"failingURL"];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NWURLError setFailingURL:](self, "setFailingURL:", v8);

      [v4 decodeObjectOfClass:objc_opt_class() forKey:@"networkUnavailableReason"];
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NWURLError setNetworkUnavailableReason:](self, "setNetworkUnavailableReason:", v9);

      [v4 decodeObjectOfClass:objc_opt_class() forKey:@"webSocketHandshakeFailureReason"];
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NWURLError setWebSocketHandshakeFailureReason:](self, "setWebSocketHandshakeFailureReason:", v10);

      [v4 decodeObjectOfClass:objc_opt_class() forKey:@"privacyProxyFailure"];
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NWURLError setPrivacyProxyFailure:](self, "setPrivacyProxyFailure:", v11);

      [v4 decodeObjectOfClass:objc_opt_class() forKey:@"vpnInactiveFailure"];
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NWURLError setVpnInactiveFailure:](self, "setVpnInactiveFailure:", v12);

      [v4 decodeObjectOfClass:objc_opt_class() forKey:@"blockedTrackerFailure"];
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NWURLError setBlockedTrackerFailure:](self, "setBlockedTrackerFailure:", v13);

      [v4 decodeObjectOfClass:objc_opt_class() forKey:@"downloadTaskResumeData"];
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NWURLError setDownloadTaskResumeData:](self, "setDownloadTaskResumeData:", v14);
    }
  }

  return self;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[NWURLError code](self, "code"), @"NSCode");
  -[NWURLError underlyingError](self, "underlyingError");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v5 forKey:@"underlyingError"];

  -[NWURLError failingURL](self, "failingURL");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v6 forKey:@"failingURL"];
  v7 = -[NWURLError networkUnavailableReason](self, "networkUnavailableReason");
  [v4 encodeObject:v7 forKey:@"networkUnavailableReason"];
  v8 = -[NWURLError webSocketHandshakeFailureReason](self, "webSocketHandshakeFailureReason");
  [v4 encodeObject:v8 forKey:@"webSocketHandshakeFailureReason"];
  v9 = -[NWURLError privacyProxyFailure](self, "privacyProxyFailure");
  [v4 encodeObject:v9 forKey:@"privacyProxyFailure"];
  v10 = -[NWURLError vpnInactiveFailure](self, "vpnInactiveFailure");
  [v4 encodeObject:v10 forKey:@"vpnInactiveFailure"];
  v11 = -[NWURLError blockedTrackerFailure](self, "blockedTrackerFailure");
  [v4 encodeObject:v11 forKey:@"blockedTrackerFailure"];

  -[NWURLError downloadTaskResumeData](self, "downloadTaskResumeData");
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v12 forKey:@"downloadTaskResumeData"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[NWURLError allocWithZone:](&OBJC_CLASS___NWURLError, "allocWithZone:", a3);
  uint64_t v5 = -[NWURLError code](self, "code");
  if (v4)
  {
    uint64_t v6 = *MEMORY[0x189607740];
    v18.receiver = v4;
    v18.super_class = (Class)&OBJC_CLASS___NWURLError;
    id v4 = -[NWURLError initWithDomain:code:userInfo:](&v18, sel_initWithDomain_code_userInfo_, v6, v5, 0LL);
  }
  v7 = -[NWURLError underlyingError](self, "underlyingError");
  -[NWURLError setUnderlyingError:](v4, "setUnderlyingError:", v7);
  v8 = -[NWURLError failingURL](self, "failingURL");
  -[NWURLError setFailingURL:](v4, "setFailingURL:", v8);

  -[NWURLError setPeerTrust:](v4, "setPeerTrust:", -[NWURLError peerTrust](self, "peerTrust"));
  v9 = -[NWURLError networkUnavailableReason](self, "networkUnavailableReason");
  -[NWURLError setNetworkUnavailableReason:](v4, "setNetworkUnavailableReason:", v9);
  v10 = -[NWURLError webSocketHandshakeFailureReason](self, "webSocketHandshakeFailureReason");
  -[NWURLError setWebSocketHandshakeFailureReason:](v4, "setWebSocketHandshakeFailureReason:", v10);
  v11 = -[NWURLError privacyProxyFailure](self, "privacyProxyFailure");
  -[NWURLError setPrivacyProxyFailure:](v4, "setPrivacyProxyFailure:", v11);

  -[NWURLError path](self, "path");
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWURLError setPath:](v4, "setPath:", v12);
  v13 = -[NWURLError vpnInactiveFailure](self, "vpnInactiveFailure");
  -[NWURLError setVpnInactiveFailure:](v4, "setVpnInactiveFailure:", v13);
  v14 = -[NWURLError blockedTrackerFailure](self, "blockedTrackerFailure");
  -[NWURLError setBlockedTrackerFailure:](v4, "setBlockedTrackerFailure:", v14);
  v15 = -[NWURLError resolutionReport](self, "resolutionReport");
  -[NWURLError setResolutionReport:](v4, "setResolutionReport:", v15);

  -[NWURLError downloadTaskResumeData](self, "downloadTaskResumeData");
  objc_super v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWURLError setDownloadTaskResumeData:](v4, "setDownloadTaskResumeData:", v16);

  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NWURLError;
  -[NWURLError dealloc](&v3, sel_dealloc);
}

- (id)localizedDescription
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 host];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = (void *)_CFNetworkErrorCopyLocalizedDescriptionWithHostname();

  return v5;
}

- (id)localizedFailureReason
{
  return (id)_CFNetworkErrorGetLocalizedFailureReason();
}

- (id)localizedRecoverySuggestion
{
  return (id)_CFNetworkErrorGetLocalizedRecoverySuggestion();
}

- (void)setPeerTrust:(__SecTrust *)a3
{
  if (a3) {
    CFRetain(a3);
  }
  peerTrust = self->_peerTrust;
  if (peerTrust) {
    CFRelease(peerTrust);
  }
  self->_peerTrust = a3;
}

- (void)fillErrorForLoader:(id)a3 andTask:(id)a4
{
  id v19 = a3;
  id v6 = a4;
  if (v19)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      [v19 underlyingConnection];
      v7 = (nw_connection *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8 = v7;
        nw_path_t v9 = nw_connection_copy_current_path(v7);
        if (v9)
        {
          -[NWURLError setPath:](self, "setPath:", v9);
          v10 = v9;
          int v11 = *((_DWORD *)v10 + 95);

          switch(v11)
          {
            case 5:
              id v12 = &unk_189BFD280;
              goto LABEL_10;
            case 26:
              id v12 = &unk_189BFD298;
              goto LABEL_10;
            case 27:
              id v12 = &unk_189BFD268;
LABEL_10:
              -[NWURLError setNetworkUnavailableReason:](self, "setNetworkUnavailableReason:", v12);
              break;
            case 30:
              -[NWURLError setVpnInactiveFailure:](self, "setVpnInactiveFailure:", MEMORY[0x189604A88]);
              break;
            default:
              break;
          }
        }

        v13 = v8;
        uint64_t v23 = 0LL;
        v24 = &v23;
        int v26 = 0;
        uint64_t v25 = 0x2020000000LL;
        v14 = v13 + 34;
        v20[0] = MEMORY[0x1895F87A8];
        v20[1] = 3221225472LL;
        v20[2] = __nw_connection_get_privacy_stance_block_invoke;
        v20[3] = &unk_189BC9210;
        v22 = &v23;
        v15 = v13;
        v21 = v15;
        os_unfair_lock_lock(v14);
        __nw_connection_get_privacy_stance_block_invoke((uint64_t)v20);
        os_unfair_lock_unlock(v14);
        LODWORD(v14) = *((_DWORD *)v24 + 6);

        _Block_object_dispose(&v23, 8);
        if ((_DWORD)v14 == 3) {
          -[NWURLError setPrivacyProxyFailure:](self, "setPrivacyProxyFailure:", MEMORY[0x189604A88]);
        }
        if (nw_connection_failed_due_to_blocked_tracker(v15)) {
          -[NWURLError setBlockedTrackerFailure:](self, "setBlockedTrackerFailure:", MEMORY[0x189604A88]);
        }
        id v16 = nw_connection_copy_failed_resolution_report(v15);
        -[NWURLError setResolutionReport:](self, "setResolutionReport:", v16);
      }
    }
  }

  if (v6)
  {
    [v6 currentRequest];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 URL];
    objc_super v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NWURLError setFailingURL:](self, "setFailingURL:", v18);

    -[NWURLError setPeerTrust:](self, "setPeerTrust:", [v6 secTrust]);
  }
}

- (int64_t)translateCodeForError:(__CFError *)a3
{
  CFIndex Code = CFErrorGetCode(a3);
  CFErrorDomain Domain = CFErrorGetDomain(a3);
  if (CFEqual(Domain, @"kNWErrorDomainDNS") && Code >= -65792 && Code <= -65537) {
    return -[NWURLError translateDNSError:](self, "translateDNSError:", Code);
  }
  CFErrorDomain v8 = CFErrorGetDomain(a3);
  if (CFEqual(v8, @"NSOSStatusErrorDomain") && Code >= -9899 && Code <= -9800) {
    return -[NWURLError translateTLSError:](self, "translateTLSError:", Code);
  }
  CFErrorDomain v9 = CFErrorGetDomain(a3);
  if (CFEqual(v9, @"NSPOSIXErrorDomain")) {
    return -[NWURLError translatePOSIXError:](self, "translatePOSIXError:", Code);
  }
  else {
    return -1LL;
  }
}

- (int64_t)translateDNSError:(int64_t)a3
{
  int64_t v3 = -1006LL;
  if (a3 == -65568) {
    int64_t v3 = -1001LL;
  }
  if (a3 == -65554) {
    int64_t v3 = -1003LL;
  }
  if (a3 == -65538) {
    return -1003LL;
  }
  else {
    return v3;
  }
}

- (int64_t)translateTLSError:(int64_t)a3
{
  else {
    return *((void *)&unk_18272D540 + a3 + 9853);
  }
}

- (int64_t)translatePOSIXError:(int64_t)a3
{
  int64_t result = -1LL;
  switch(a3)
  {
    case 13LL:
    case 49LL:
    case 51LL:
    case 59LL:
    case 61LL:
    case 64LL:
    case 65LL:
      int64_t result = -1004LL;
      break;
    case 22LL:
      int64_t result = -1000LL;
      break;
    case 32LL:
    case 35LL:
    case 40LL:
    case 52LL:
    case 53LL:
    case 54LL:
    case 57LL:
    case 60LL:
    case 96LL:
    case 100LL:
      int64_t result = -1005LL;
      break;
    case 39LL:
      int64_t result = -1010LL;
      break;
    case 41LL:
    case 42LL:
      int64_t result = -1011LL;
      break;
    case 43LL:
      int64_t result = -1002LL;
      break;
    case 46LL:
      int64_t result = -1008LL;
      break;
    case 50LL:
      int64_t result = -1009LL;
      break;
    case 79LL:
      int64_t result = -1016LL;
      break;
    case 80LL:
      int64_t result = -1013LL;
      break;
    case 89LL:
      int64_t result = -999LL;
      break;
    case 91LL:
      int64_t result = -1014LL;
      break;
    case 92LL:
      int64_t result = -1015LL;
      break;
    case 94LL:
      int64_t result = -1017LL;
      break;
    default:
      return result;
  }

  return result;
}

- (NSError)underlyingError
{
  return self->_underlyingError;
}

- (void)setUnderlyingError:(id)a3
{
}

- (NSURL)failingURL
{
  return self->_failingURL;
}

- (void)setFailingURL:(id)a3
{
}

- (__SecTrust)peerTrust
{
  return self->_peerTrust;
}

- (NSNumber)networkUnavailableReason
{
  return self->_networkUnavailableReason;
}

- (void)setNetworkUnavailableReason:(id)a3
{
}

- (NSNumber)webSocketHandshakeFailureReason
{
  return self->_webSocketHandshakeFailureReason;
}

- (void)setWebSocketHandshakeFailureReason:(id)a3
{
}

- (NSNumber)privacyProxyFailure
{
  return self->_privacyProxyFailure;
}

- (void)setPrivacyProxyFailure:(id)a3
{
}

- (NSNumber)vpnInactiveFailure
{
  return self->_vpnInactiveFailure;
}

- (void)setVpnInactiveFailure:(id)a3
{
}

- (NSNumber)blockedTrackerFailure
{
  return self->_blockedTrackerFailure;
}

- (void)setBlockedTrackerFailure:(id)a3
{
}

- (OS_nw_path)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (OS_nw_resolution_report)resolutionReport
{
  return self->_resolutionReport;
}

- (void)setResolutionReport:(id)a3
{
}

- (NSData)downloadTaskResumeData
{
  return self->_downloadTaskResumeData;
}

- (void)setDownloadTaskResumeData:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (NSDictionary)allUserInfoKeys
{
  if (allUserInfoKeys_onceToken != -1) {
    dispatch_once(&allUserInfoKeys_onceToken, &__block_literal_global_77102);
  }
  return (NSDictionary *)(id)allUserInfoKeys_keys;
}

void __29__NWURLError_allUserInfoKeys__block_invoke()
{
  v17[14] = *MEMORY[0x1895F89C0];
  v16[0] = *MEMORY[0x1896075E0];
  NSStringFromSelector(sel_localizedDescription);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v15;
  v16[1] = *MEMORY[0x1896075F0];
  NSStringFromSelector(sel_localizedFailureReason);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v14;
  v16[2] = *MEMORY[0x189607618];
  NSStringFromSelector(sel_localizedRecoverySuggestion);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v13;
  v16[3] = *MEMORY[0x189607798];
  NSStringFromSelector(sel_underlyingError);
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v12;
  v16[4] = *MEMORY[0x189607748];
  NSStringFromSelector(sel_failingURL);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v17[4] = v0;
  v16[5] = *MEMORY[0x189607750];
  NSStringFromSelector(sel_peerTrust);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v17[5] = v1;
  v16[6] = *MEMORY[0x189607768];
  NSStringFromSelector(sel_networkUnavailableReason);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v17[6] = v2;
  v16[7] = *MEMORY[0x1896020A8];
  NSStringFromSelector(sel_webSocketHandshakeFailureReason);
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17[7] = v3;
  v16[8] = *MEMORY[0x189602098];
  NSStringFromSelector(sel_privacyProxyFailure);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17[8] = v4;
  v16[9] = *MEMORY[0x189602088];
  NSStringFromSelector(sel_path);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[9] = v5;
  v16[10] = *MEMORY[0x1896020A0];
  NSStringFromSelector(sel_vpnInactiveFailure);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[10] = v6;
  v16[11] = *MEMORY[0x189602080];
  NSStringFromSelector(sel_blockedTrackerFailure);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[11] = v7;
  v16[12] = *MEMORY[0x189602090];
  NSStringFromSelector(sel_resolutionReport);
  CFErrorDomain v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[12] = v8;
  v16[13] = *MEMORY[0x189601E68];
  NSStringFromSelector(sel_downloadTaskResumeData);
  CFErrorDomain v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[13] = v9;
  uint64_t v10 = [MEMORY[0x189603F68] dictionaryWithObjects:v17 forKeys:v16 count:14];
  int v11 = (void *)allUserInfoKeys_keys;
  allUserInfoKeys_keys = v10;
}

- (void)initWithNWError:(void *)a3 forLoader:(void *)a4 andTask:
{
  id v7 = a3;
  id v8 = a4;
  if (a1)
  {
    CFErrorDomain v9 = a2;
    CFErrorRef v10 = nw_error_copy_cf_error(v9);
    if (v10)
    {
      CFErrorRef v11 = v10;
      uint64_t v12 = [a1 translateCodeForError:v10];
      uint64_t v13 = *MEMORY[0x189607740];
      v16.receiver = a1;
      v16.super_class = (Class)&OBJC_CLASS___NWURLError;
      id v14 = objc_msgSendSuper2(&v16, sel_initWithDomain_code_userInfo_, v13, v12, 0);
      if (v14)
      {
        a1 = v14;
        [v14 setUnderlyingError:v11];

        [a1 fillErrorForLoader:v7 andTask:v8];
        goto LABEL_8;
      }

      CFRelease(v11);
    }

    else
    {
    }

    a1 = 0LL;
  }

@end