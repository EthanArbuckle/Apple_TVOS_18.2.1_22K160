@interface NEVPNConnection
+ (id)createConnectionForEnabledEnterpriseConfiguration;
+ (id)createConnectionForEnabledEnterpriseConfigurationWithName:(id)a3;
+ (id)createDisconnectErrorWithDomain:(id)a3 code:(unsigned int)a4;
- (BOOL)installNotify;
- (BOOL)installed;
- (BOOL)startVPNTunnelAndReturnError:(NSError *)error;
- (BOOL)startVPNTunnelWithOptions:(NSDictionary *)options andReturnError:(NSError *)error;
- (NEVPNManager)manager;
- (NEVPNStatus)status;
- (NSDate)connectedDate;
- (NSError)lastDisconnectError;
- (id)initWithType:(void *)a1;
- (uint64_t)reload;
- (void)createSessionWithConfigurationIdentifier:(uint64_t)a3 forceInfoFetch:(void *)a4 completionHandler:;
- (void)dealloc;
- (void)destroySession;
- (void)fetchExtendedStatusWithCompletionHandler:(id)a3;
- (void)fetchLastDisconnectErrorWithCompletionHandler:(void *)handler;
- (void)fetchStatisticsWithCompletionHandler:(id)a3;
- (void)notifyStatusChanged;
- (void)resetLastDisconnectError:(void *)a1;
- (void)setInstallNotify:(BOOL)a3;
- (void)setInstalled:(BOOL)a3;
- (void)stopVPNTunnel;
- (void)updateSessionInfoForce:(uint64_t)a3 notify:(void *)a4 withCompletionHandler:;
@end

@implementation NEVPNConnection

- (void)dealloc
{
  if (self && self->_session)
  {
    ne_session_cancel();
    self->_session = 0LL;
  }

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NEVPNConnection;
  -[NEVPNConnection dealloc](&v3, sel_dealloc);
}

- (BOOL)startVPNTunnelAndReturnError:(NSError *)error
{
  return -[NEVPNConnection startVPNTunnelWithOptions:andReturnError:]( self,  "startVPNTunnelWithOptions:andReturnError:",  0LL,  error);
}

- (BOOL)startVPNTunnelWithOptions:(NSDictionary *)options andReturnError:(NSError *)error
{
  v6 = options;
  v7 = self;
  objc_sync_enter(v7);
  if (+[NEProvider isRunningInProvider](&OBJC_CLASS___NEProvider, "isRunningInProvider"))
  {
    ne_log_obj();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( &dword_1876B1000,  v8,  OS_LOG_TYPE_ERROR,  "VPN tunnels cannot be started from Network Extension providers",  buf,  2u);
    }

    if (error)
    {
      uint64_t v9 = 3LL;
LABEL_17:
      [MEMORY[0x189607870] errorWithDomain:@"NEVPNErrorDomain" code:v9 userInfo:0];
      v15 = 0LL;
      BOOL v16 = 0;
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    }

    goto LABEL_27;
  }

  if (error) {
    *error = 0LL;
  }
  uint64_t v10 = -[NEVPNConnection status](v7, "status");
  if (!v7 || !v10 || !v7->_session)
  {
    if (error)
    {
      uint64_t v9 = 1LL;
      goto LABEL_17;
    }

- (void)stopVPNTunnel
{
  v2 = self;
  objc_sync_enter(v2);
  if (+[NEProvider isRunningInProvider](&OBJC_CLASS___NEProvider, "isRunningInProvider"))
  {
    ne_log_obj();
    objc_super v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v4 = 0;
      _os_log_error_impl( &dword_1876B1000,  v3,  OS_LOG_TYPE_ERROR,  "VPN tunnels cannot be stopped from Network Extension providers",  v4,  2u);
    }
  }

  else if (v2 && v2->_session)
  {
    ne_session_stop();
  }

  objc_sync_exit(v2);
}

- (NEVPNManager)manager
{
  return (NEVPNManager *)objc_loadWeakRetained((id *)&self->_weakmanager);
}

- (void)fetchLastDisconnectErrorWithCompletionHandler:(void *)handler
{
  id v4 = handler;
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __65__NEVPNConnection_fetchLastDisconnectErrorWithCompletionHandler___block_invoke;
  v6[3] = &unk_18A0903B8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  -[NEVPNConnection updateSessionInfoForce:notify:withCompletionHandler:]((uint64_t)self, 1LL, 1LL, v6);
}

- (void)fetchExtendedStatusWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __60__NEVPNConnection_fetchExtendedStatusWithCompletionHandler___block_invoke;
  v6[3] = &unk_18A0902D8;
  id v7 = v4;
  id v5 = v4;
  -[NEVPNConnection updateSessionInfoForce:notify:withCompletionHandler:]((uint64_t)self, 1LL, 0LL, v6);
}

- (void)fetchStatisticsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  ne_session_get_info();
}

- (NEVPNStatus)status
{
  return self->_status;
}

- (NSDate)connectedDate
{
  return (NSDate *)objc_getProperty(self, a2, 24LL, 1);
}

- (BOOL)installed
{
  return self->_installed;
}

- (void)setInstalled:(BOOL)a3
{
  self->_installed = a3;
}

- (BOOL)installNotify
{
  return self->_installNotify;
}

- (void)setInstallNotify:(BOOL)a3
{
  self->_installNotify = a3;
}

- (NSError)lastDisconnectError
{
  return (NSError *)objc_getProperty(self, a2, 72LL, 1);
}

- (void).cxx_destruct
{
}

void __56__NEVPNConnection_fetchStatisticsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4 && MEMORY[0x1895ADD58]() == MEMORY[0x1895F9250]) {
    id v3 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  }
  else {
    id v3 = 0LL;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __60__NEVPNConnection_fetchExtendedStatusWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)updateSessionInfoForce:(uint64_t)a3 notify:(void *)a4 withCompletionHandler:
{
  id v5 = a4;
  v6 = (void (**)(void, void, void))v5;
  if (a1)
  {
    if (*(void *)(a1 + 56))
    {
      id v9 = v5;
      ne_session_get_info2();
    }

    else
    {
      ne_log_obj();
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( &dword_1876B1000,  v7,  OS_LOG_TYPE_DEFAULT,  "No ne_session available, cannot update session info",  buf,  2u);
      }

      [MEMORY[0x189607870] errorWithDomain:@"NEVPNErrorDomain" code:1 userInfo:0];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(void, void *, void))v6)[2](v6, v8, 0LL);
    }
  }
}

void __71__NEVPNConnection_updateSessionInfoForce_notify_withCompletionHandler___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (!v3 || (uint64_t v5 = MEMORY[0x1895ADD58](v3), v6 = MEMORY[0x1895F9250], v5 != MEMORY[0x1895F9250]))
  {
    __int128 v44 = *(_OWORD *)(a1 + 40);
    id v7 = (id)v44;
    ne_session_get_status();

    goto LABEL_36;
  }

  int64_t int64 = xpc_dictionary_get_int64(v4, "NEStatus");
  xpc_dictionary_get_value(v4, "IPv4");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_get_value(v4, "IPv6");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 && MEMORY[0x1895ADD58](v9) == v6)
  {
    BOOL v11 = 1;
    goto LABEL_10;
  }

  if (v10)
  {
    BOOL v11 = MEMORY[0x1895ADD58](v10) == v6;
LABEL_10:
    LODWORD(v43) = v11;
    goto LABEL_11;
  }

  LODWORD(v43) = 0;
LABEL_11:
  uint64_t v12 = xpc_dictionary_get_value(v4, "IPSec");
  v13 = (void *)v12;
  if ((v12 && MEMORY[0x1895ADD58](v12) == v6
     || (xpc_dictionary_get_value(v4, "PPP"),
         uint64_t v14 = objc_claimAutoreleasedReturnValue(),
         v13,
         (v13 = (void *)v14) != 0LL))
    && MEMORY[0x1895ADD58](v13) == v6)
  {
    unsigned int v18 = xpc_dictionary_get_int64(v4, "Status") + 1;
    if (v18 <= 4) {

    }
      int64_t int64 = qword_187873040[v18];
    int64_t v17 = xpc_dictionary_get_int64(v13, "ConnectTime");
  }

  else
  {
    uint64_t v15 = xpc_dictionary_get_value(v4, "VPN");
    BOOL v16 = (void *)v15;
    if (v15 && MEMORY[0x1895ADD58](v15) == v6) {
      int64_t v17 = xpc_dictionary_get_int64(v16, "ConnectTime");
    }
    else {
      int64_t v17 = 0LL;
    }
  }

  size_t length = 0LL;
  data = xpc_dictionary_get_data(v4, "LastDisconnectError", &length);
  if (data)
  {
    v20 = data;
    id v21 = objc_alloc(MEMORY[0x189603F48]);
    char v22 = (void *)[v21 initWithBytesNoCopy:v20 length:length freeWhenDone:0];
    uint64_t v46 = 0LL;
    [MEMORY[0x189607908] unarchivedObjectOfClass:objc_opt_class() fromData:v22 error:&v46];
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v46)
    {
      ne_log_obj();
      v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl( &dword_1876B1000,  v24,  OS_LOG_TYPE_ERROR,  "Failed to decode the last disconnect error",  buf,  2u);
      }
    }
  }

  else
  {
    v23 = 0LL;
  }

  v25 = *(void **)(a1 + 32);
  if (v25) {
    uint64_t v26 = v25[7];
  }
  else {
    uint64_t v26 = 0LL;
  }
  if (v26 != *(void *)(a1 + 48)) {
    goto LABEL_33;
  }
  -[NEVPNConnection resetLastDisconnectError:](v25, v23);
  uint64_t v28 = [*(id *)(a1 + 32) status];
  v29 = *(void **)(a1 + 32);
  if (v28 == int64)
  {
    goto LABEL_49;
  }

  v29[2] = int64;
  [*(id *)(a1 + 32) connectedDate];
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    uint64_t v31 = *(void *)(*(void *)(a1 + 32) + 16LL);

    if (v31 == 1)
    {
      uint64_t v32 = *(void *)(a1 + 32);
      v33 = *(void **)(v32 + 24);
      *(void *)(v32 + 24) = 0LL;
LABEL_47:

      v34 = *(void **)(a1 + 32);
      goto LABEL_48;
    }
  }

  v34 = *(void **)(a1 + 32);
  if (!v34[3] && v34[2] == 3LL && v17 >= 1)
  {
    [MEMORY[0x1896079D8] processInfo];
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    [v35 systemUptime];
    double v37 = v36;

    [MEMORY[0x189603F50] date];
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v38 = [v33 dateByAddingTimeInterval:(double)v17 - v37];
    uint64_t v39 = *(void *)(a1 + 32);
    v40 = *(void **)(v39 + 24);
    *(void *)(v39 + 24) = v38;

    goto LABEL_47;
  }

- (void)resetLastDisconnectError:(void *)a1
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  if (a1)
  {
    uint64_t v5 = a1;
    objc_sync_enter(v5);
    id v7 = v5 + 9;
    id v6 = v5[9];
    if (v6 == v4 || ([v6 isEqual:v4] & 1) != 0)
    {
      objc_sync_exit(v5);

      goto LABEL_29;
    }

    v8 = (__CFString *)v5[5];
    [v5 manager];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      [v5 manager];
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 configuration];
      BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v12 = [v11 name];

      v8 = (__CFString *)v12;
    }

    if (v8)
    {
      ne_log_obj();
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = *v7;
        if (*v7)
        {
          [*v7 localizedDescription];
          uint64_t v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if (v4)
          {
LABEL_11:
            [v4 localizedDescription];
            BOOL v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
            goto LABEL_18;
          }
        }

        else
        {
          uint64_t v15 = @"none";
          if (v4) {
            goto LABEL_11;
          }
        }

        BOOL v16 = @"none";
LABEL_18:
        int v19 = 138412802;
        v20 = v8;
        __int16 v21 = 2112;
        char v22 = v15;
        __int16 v23 = 2112;
        v24 = v16;
        _os_log_impl( &dword_1876B1000,  v13,  OS_LOG_TYPE_DEFAULT,  "Last disconnect error for %@ changed from \"%@\" to \"%@\"",  (uint8_t *)&v19,  0x20u);
        if (v4) {

        }
        if (!v14) {
          goto LABEL_28;
        }
        goto LABEL_27;
      }

- (void)notifyStatusChanged
{
  if (a1)
  {
    [MEMORY[0x189607958] defaultCenter];
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    [v2 postNotificationName:@"com.apple.networkextension.statuschanged" object:a1];
  }

uint64_t __71__NEVPNConnection_updateSessionInfoForce_notify_withCompletionHandler___block_invoke_24( uint64_t *a1,  int a2)
{
  id v4 = (void *)a1[4];
  if (v4) {
    uint64_t v5 = v4[7];
  }
  else {
    uint64_t v5 = 0LL;
  }
  if (v5 == a1[6] && [v4 status] != a2)
  {
    *(void *)(a1[4] + 16) = a2;
    -[NEVPNConnection notifyStatusChanged](a1[4]);
  }

  uint64_t result = a1[5];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0LL, 0LL);
  }
  return result;
}

void __65__NEVPNConnection_fetchLastDisconnectErrorWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  [v2 lastDisconnectError];
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = v3;
  if (!v2)
  {
    id v15 = 0LL;
    goto LABEL_22;
  }

  id v15 = v3;
  [v15 domain];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  int v6 = [v5 isEqualToString:@"NEVPNConnectionErrorDomainPlugin"];

  if (v6)
  {
    int v7 = [v15 code];
    uint64_t v8 = 1LL;
    switch(v7)
    {
      case 2:
        goto LABEL_21;
      case 3:
      case 5:
      case 8:
      case 9:
      case 11:
      case 12:
      case 13:
      case 14:
      case 15:
      case 16:
      case 18:
      case 19:
      case 21:
      case 24:
      case 27:
      case 28:
      case 29:
        goto LABEL_22;
      case 4:
        uint64_t v8 = 2LL;
        goto LABEL_21;
      case 6:
        uint64_t v8 = 14LL;
        goto LABEL_21;
      case 7:
        uint64_t v8 = 12LL;
        goto LABEL_21;
      case 10:
        uint64_t v8 = 4LL;
        goto LABEL_21;
      case 17:
        uint64_t v8 = 5LL;
        goto LABEL_21;
      case 20:
        uint64_t v8 = 6LL;
        goto LABEL_21;
      case 22:
        uint64_t v8 = 7LL;
        goto LABEL_21;
      case 23:
        uint64_t v8 = 8LL;
        goto LABEL_21;
      case 25:
        uint64_t v8 = 9LL;
        goto LABEL_21;
      case 26:
        uint64_t v8 = 10LL;
        goto LABEL_21;
      case 30:
        uint64_t v8 = 11LL;
        goto LABEL_21;
      default:
        if (v7 != 38) {
          goto LABEL_22;
        }
        uint64_t v8 = 13LL;
        break;
    }

    goto LABEL_21;
  }

  [v15 domain];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  int v10 = [v9 isEqualToString:@"NEVPNConnectionErrorDomainIPSec"];

  if (v10)
  {
    unsigned int v11 = [v15 code] - 2;
    if (v11 <= 0x16 && ((0x7DFFBFu >> v11) & 1) != 0)
    {
      uint64_t v8 = qword_187873068[v11];
LABEL_21:
      id v12 = objc_alloc(MEMORY[0x189607870]);
      [v15 userInfo];
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v14 = [v12 initWithDomain:@"NEVPNConnectionErrorDomain" code:v8 userInfo:v13];

      id v15 = (id)v14;
    }
  }

+ (id)createDisconnectErrorWithDomain:(id)a3 code:(unsigned int)a4
{
  v13[1] = *MEMORY[0x1895F89C0];
  id v5 = a3;
  if ([v5 isEqualToString:@"NEVPNConnectionErrorDomainPlugin"])
  {
    int v6 = 0LL;
    int v7 = 0LL;
    switch(a4)
    {
      case 2u:
        uint64_t v8 = @"VPN_DISCONNECT_ERROR_OVERSLEPT";
        goto LABEL_32;
      case 3u:
      case 8u:
      case 9u:
      case 0xBu:
      case 0xDu:
      case 0x13u:
      case 0x1Fu:
      case 0x20u:
      case 0x21u:
      case 0x22u:
      case 0x23u:
      case 0x24u:
      case 0x25u:
        break;
      case 4u:
        goto LABEL_6;
      case 5u:
        goto LABEL_16;
      case 6u:
        uint64_t v8 = @"VPN_DISCONNECT_ERROR_PLUGIN_NOT_AVAILABLE";
        goto LABEL_32;
      case 7u:
        goto LABEL_13;
      case 0xAu:
        goto LABEL_12;
      case 0xCu:
        uint64_t v8 = @"VPN_DISCONNECT_ERROR_CONNECT_TIMEOUT";
        goto LABEL_32;
      case 0xEu:
        uint64_t v8 = @"VPN_DISCONNECT_ERROR_CONFIGURATION_APP_REQUIRED";
        goto LABEL_32;
      case 0xFu:
        goto LABEL_9;
      case 0x10u:
        uint64_t v8 = @"VPN_DISCONNECT_ERROR_SERVER_ADDRESS_INVALID";
        goto LABEL_32;
      case 0x11u:
        goto LABEL_11;
      case 0x12u:
        goto LABEL_14;
      case 0x14u:
        uint64_t v8 = @"VPN_DISCONNECT_ERROR_SERVER_NOT_RESPONDING";
        goto LABEL_32;
      case 0x15u:
        goto LABEL_17;
      case 0x16u:
        goto LABEL_18;
      case 0x17u:
        goto LABEL_7;
      case 0x18u:
        goto LABEL_10;
      case 0x19u:
        goto LABEL_15;
      case 0x1Au:
        goto LABEL_19;
      case 0x1Bu:
        goto LABEL_20;
      case 0x1Cu:
        goto LABEL_8;
      case 0x1Du:
        goto LABEL_21;
      case 0x1Eu:
        goto LABEL_22;
      case 0x26u:
        uint64_t v8 = @"VPN_DISCONNECT_ERROR_CONFIGURATION_NOT_FOUND";
        goto LABEL_32;
      default:
        goto LABEL_29;
    }
  }

  else
  {
    int v6 = 0LL;
    if ([v5 isEqualToString:@"NEVPNConnectionErrorDomainIPSec"])
    {
      int v7 = 0LL;
      switch(a4)
      {
        case 2u:
LABEL_9:
          uint64_t v8 = @"VPN_DISCONNECT_ERROR_SERVER_ADDRESS_MISSING";
          goto LABEL_32;
        case 3u:
          uint64_t v8 = @"VPN_DISCONNECT_ERROR_SHARED_SECRET_MISSING";
          goto LABEL_32;
        case 4u:
LABEL_10:
          uint64_t v8 = @"VPN_DISCONNECT_ERROR_CLIENT_CERTIFICATE_MISSING";
          goto LABEL_32;
        case 5u:
LABEL_11:
          uint64_t v8 = @"VPN_DISCONNECT_ERROR_SERVER_ADDRESS_RESOLUTION_FAILED";
          goto LABEL_32;
        case 6u:
        case 0x12u:
LABEL_6:
          uint64_t v8 = @"VPN_DISCONNECT_ERROR_NO_NETWORK_AVAILABLE";
          goto LABEL_32;
        case 7u:
LABEL_12:
          uint64_t v8 = @"VPN_DISCONNECT_ERROR_CONFIGURATION_FAILED";
          goto LABEL_32;
        case 8u:
LABEL_13:
          uint64_t v8 = @"VPN_DISCONNECT_ERROR_INTERNAL_ERROR";
          goto LABEL_32;
        case 9u:
          uint64_t v8 = @"VPN_DISCONNECT_ERROR_CONNECTION_ERROR";
          goto LABEL_32;
        case 0xAu:
LABEL_14:
          uint64_t v8 = @"VPN_DISCONNECT_ERROR_SERVER_NEGOTIATION_FAILED";
          goto LABEL_32;
        case 0xBu:
        case 0xEu:
LABEL_7:
          uint64_t v8 = @"VPN_DISCONNECT_ERROR_AUTHENTICATION_FAILED";
          goto LABEL_32;
        case 0xCu:
        case 0x18u:
LABEL_8:
          uint64_t v8 = @"VPN_DISCONNECT_ERROR_SERVER_CERTIFICATE_INVALID";
          goto LABEL_32;
        case 0xDu:
LABEL_15:
          uint64_t v8 = @"VPN_DISCONNECT_ERROR_CLIENT_CERTIFICATE_INVALID";
          goto LABEL_32;
        case 0xFu:
LABEL_16:
          uint64_t v8 = @"VPN_DISCONNECT_ERROR_NETWORK_CHANGE";
          goto LABEL_32;
        case 0x10u:
LABEL_17:
          uint64_t v8 = @"VPN_DISCONNECT_ERROR_SERVER_DISCONNECTED";
          goto LABEL_32;
        case 0x11u:
LABEL_18:
          uint64_t v8 = @"VPN_DISCONNECT_ERROR_SERVER_DEAD";
          goto LABEL_32;
        case 0x13u:
          break;
        case 0x14u:
LABEL_19:
          uint64_t v8 = @"VPN_DISCONNECT_ERROR_CLIENT_CERTIFICATE_NOT_YET_VALID";
          goto LABEL_32;
        case 0x15u:
LABEL_20:
          uint64_t v8 = @"VPN_DISCONNECT_ERROR_CLIENT_CERTIFICATE_EXPIRED";
          goto LABEL_32;
        case 0x16u:
LABEL_21:
          uint64_t v8 = @"VPN_DISCONNECT_ERROR_SERVER_CERTIFICATE_NOT_YET_VALID";
          goto LABEL_32;
        case 0x17u:
LABEL_22:
          uint64_t v8 = @"VPN_DISCONNECT_ERROR_SERVER_CERTIFICATE_EXPIRED";
LABEL_32:
          NEResourcesCopyLocalizedNSString(v8, v8);
          int v6 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v6) {
            goto LABEL_34;
          }
          id v9 = objc_alloc(MEMORY[0x189607870]);
          uint64_t v12 = *MEMORY[0x1896075E0];
          v13[0] = v6;
          [MEMORY[0x189603F68] dictionaryWithObjects:v13 forKeys:&v12 count:1];
          int v10 = (void *)objc_claimAutoreleasedReturnValue();
          int v7 = (void *)[v9 initWithDomain:v5 code:a4 userInfo:v10];

          break;
        default:
LABEL_29:
          int v7 = 0LL;
          break;
      }
    }

    else
    {
LABEL_34:
      int v7 = 0LL;
    }
  }

  return v7;
}

+ (id)createConnectionForEnabledEnterpriseConfiguration
{
  return +[NEVPNConnection createConnectionForEnabledEnterpriseConfigurationWithName:]( &OBJC_CLASS___NEVPNConnection,  "createConnectionForEnabledEnterpriseConfigurationWithName:",  0LL);
}

+ (id)createConnectionForEnabledEnterpriseConfigurationWithName:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __77__NEVPNConnection_createConnectionForEnabledEnterpriseConfigurationWithName___block_invoke;
  block[3] = &unk_18A090390;
  id v11 = v3;
  uint64_t v4 = createConnectionForEnabledEnterpriseConfigurationWithName__onceToken;
  id v5 = v3;
  int v6 = v5;
  if (v4 == -1)
  {
    int v7 = v5;
  }

  else
  {
    dispatch_once(&createConnectionForEnabledEnterpriseConfigurationWithName__onceToken, block);
    int v7 = v11;
  }

  id v8 = (id)createConnectionForEnabledEnterpriseConfigurationWithName__g_headless;

  return v8;
}

uint64_t __77__NEVPNConnection_createConnectionForEnabledEnterpriseConfigurationWithName___block_invoke( uint64_t a1)
{
  id v2 = objc_alloc(&OBJC_CLASS___NEVPNConnection);
  id v3 = *(void **)(a1 + 32);
  id v4 = v3;
  if (v2)
  {
    id v2 = (NEVPNConnection *)-[NEVPNConnection initWithType:](v2, 1);
    if (v2)
    {
      id v5 = -[NEConfigurationManager initForAllUsers]( objc_alloc(&OBJC_CLASS___NEConfigurationManager),  "initForAllUsers");
      configManager = v2->_configManager;
      v2->_configManager = v5;

      objc_storeStrong((id *)&v2->_configurationName, v3);
      dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      int v7 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
      dispatch_queue_t v8 = dispatch_queue_create("NEVPNConnection queue", v7);
      queue = v2->_queue;
      v2->_queue = (OS_dispatch_queue *)v8;
    }
  }

  int v10 = (void *)createConnectionForEnabledEnterpriseConfigurationWithName__g_headless;
  createConnectionForEnabledEnterpriseConfigurationWithName__g_headless = (uint64_t)v2;

  if (createConnectionForEnabledEnterpriseConfigurationWithName__g_headless)
  {
    id v11 = *(void **)(createConnectionForEnabledEnterpriseConfigurationWithName__g_headless + 32);
    uint64_t v12 = *(void *)(createConnectionForEnabledEnterpriseConfigurationWithName__g_headless + 48);
  }

  else
  {
    id v11 = 0LL;
    uint64_t v12 = 0LL;
  }

  id v13 = v11;
  [v13 setChangedQueue:v12 andHandler:&__block_literal_global_23324];

  return -[NEVPNConnection reload](createConnectionForEnabledEnterpriseConfigurationWithName__g_headless);
}

- (uint64_t)reload
{
  if (result)
  {
    v1 = (void *)result;
    *(void *)(result + 16) = 0LL;
    if (*(void *)(result + 56))
    {
      ne_session_cancel();
      v1[7] = 0LL;
    }

    id v2 = (void *)v1[4];
    uint64_t v3 = v1[6];
    v4[0] = MEMORY[0x1895F87A8];
    v4[1] = 3221225472LL;
    v4[2] = __25__NEVPNConnection_reload__block_invoke;
    v4[3] = &unk_18A090328;
    v4[4] = v1;
    return [v2 loadConfigurationsWithCompletionQueue:v3 handler:v4];
  }

  return result;
}

void __25__NEVPNConnection_reload__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    ne_log_obj();
    int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v6;
      _os_log_error_impl( &dword_1876B1000,  v7,  OS_LOG_TYPE_ERROR,  "reloadWithCompletionHandler: failed to load configurations: %@",  buf,  0xCu);
    }

    -[NEVPNConnection resetLastDisconnectError:](*(void **)(a1 + 32), v6);
    uint64_t v8 = *(void *)(a1 + 32);
    if (v8) {
      *(_BYTE *)(v8 + 10) = 1;
    }
  }

  else
  {
    if (v5
      && (uint64_t v9 = MEMORY[0x1895F87A8],
          v18[0] = MEMORY[0x1895F87A8],
          v18[1] = 3221225472LL,
          v18[2] = __25__NEVPNConnection_reload__block_invoke_88,
          v18[3] = &unk_18A090300,
          v18[4] = *(void *)(a1 + 32),
          uint64_t v10 = [v5 indexOfObjectPassingTest:v18],
          v10 != 0x7FFFFFFFFFFFFFFFLL))
    {
      [v5 objectAtIndexedSubscript:v10];
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      [v11 name];
      id v13 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v14 = *(void *)(a1 + 32);
      if (v14) {
        objc_storeStrong((id *)(v14 + 40), v13);
      }

      id v15 = *(void **)(a1 + 32);
      [v11 identifier];
      BOOL v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = v9;
      v17[1] = 3221225472LL;
      v17[2] = __25__NEVPNConnection_reload__block_invoke_2;
      v17[3] = &unk_18A0907E8;
      v17[4] = *(void *)(a1 + 32);
      -[NEVPNConnection createSessionWithConfigurationIdentifier:forceInfoFetch:completionHandler:](v15, v16, 1LL, v17);
    }

    else
    {
      id v11 = +[NEVPNConnection createDisconnectErrorWithDomain:code:]( &OBJC_CLASS___NEVPNConnection,  "createDisconnectErrorWithDomain:code:",  @"NEVPNConnectionErrorDomainPlugin",  38LL);
      -[NEVPNConnection resetLastDisconnectError:](*(void **)(a1 + 32), v11);
      uint64_t v12 = *(void *)(a1 + 32);
      if (v12) {
        *(_BYTE *)(v12 + 10) = 1;
      }
    }
  }
}

uint64_t __25__NEVPNConnection_reload__block_invoke_88(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6 = a2;
  if ([v6 grade] == 1)
  {
    [v6 VPN];
    int v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v7 isEnabled])
    {
      uint64_t v8 = *(void *)(a1 + 32);
      if (!v8 || (id v9 = *(id *)(v8 + 40)) == 0LL)
      {

LABEL_13:
        uint64_t v15 = 1LL;
        *a4 = 1;
        goto LABEL_11;
      }

      uint64_t v10 = v9;
      id v11 = *(void **)(a1 + 32);
      if (v11) {
        id v11 = (void *)v11[5];
      }
      uint64_t v12 = v11;
      [v6 name];
      id v13 = (void *)objc_claimAutoreleasedReturnValue();
      int v14 = [v12 isEqualToString:v13];

      if (v14) {
        goto LABEL_13;
      }
    }

    else
    {
    }
  }

  uint64_t v15 = 0LL;
LABEL_11:

  return v15;
}

void __25__NEVPNConnection_reload__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  id v4 = v3;
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    *(_BYTE *)(v5 + 10) = 1;
  }
  if (v3)
  {
    ne_log_obj();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      uint64_t v8 = v4;
      _os_log_error_impl( &dword_1876B1000,  v6,  OS_LOG_TYPE_ERROR,  "Failed to create a connection for the current enterprise configuration: %@",  (uint8_t *)&v7,  0xCu);
    }

    -[NEVPNConnection resetLastDisconnectError:](*(void **)(a1 + 32), v4);
  }
}

- (void)createSessionWithConfigurationIdentifier:(uint64_t)a3 forceInfoFetch:(void *)a4 completionHandler:
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  id v7 = a2;
  id v8 = a4;
  if (a1)
  {
    uint64_t v9 = a1;
    objc_sync_enter(v9);
    if (v7)
    {
      if (v9[7])
      {
        ne_session_cancel();
        v9[7] = 0LL;
      }

      [v7 getUUIDBytes:v37];
      uint64_t v10 = ne_session_create();
      if (v10)
      {
        id v11 = MEMORY[0x1895F8AE0];
        uint64_t v12 = MEMORY[0x1895F87A8];
        uint64_t v21 = MEMORY[0x1895F87A8];
        uint64_t v22 = 3221225472LL;
        __int16 v23 = __93__NEVPNConnection_createSessionWithConfigurationIdentifier_forceInfoFetch_completionHandler___block_invoke_2;
        v24 = &unk_18A0902B0;
        uint64_t v25 = v9;
        uint64_t v26 = v10;
        ne_session_set_event_handler();

        v9[7] = v10;
        v19[0] = v12;
        v19[1] = 3221225472LL;
        v19[2] = __93__NEVPNConnection_createSessionWithConfigurationIdentifier_forceInfoFetch_completionHandler___block_invoke_3;
        v19[3] = &unk_18A0902D8;
        id v20 = v8;
        -[NEVPNConnection updateSessionInfoForce:notify:withCompletionHandler:]((uint64_t)v9, a3, 1LL, v19);
      }

      else
      {
        ne_log_obj();
        BOOL v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v34 = "-[NEVPNConnection createSessionWithConfigurationIdentifier:forceInfoFetch:completionHandler:]";
          __int16 v35 = 2112;
          id v36 = v7;
          _os_log_error_impl( &dword_1876B1000,  v16,  OS_LOG_TYPE_ERROR,  "%s: Cannot create ne_session for configID: %@",  buf,  0x16u);
        }

        if (v8)
        {
          [MEMORY[0x189607870] errorWithDomain:@"NEVPNErrorDomain" code:1 userInfo:0];
          id v17 = (void *)objc_claimAutoreleasedReturnValue();
          v27[0] = MEMORY[0x1895F87A8];
          v27[1] = 3221225472LL;
          v27[2] = __93__NEVPNConnection_createSessionWithConfigurationIdentifier_forceInfoFetch_completionHandler___block_invoke_28;
          v27[3] = &unk_18A0908C8;
          id v28 = v17;
          id v29 = v8;
          id v18 = v17;
          dispatch_async(MEMORY[0x1895F8AE0], v27);
        }
      }
    }

    else
    {
      ne_log_obj();
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v34 = "-[NEVPNConnection createSessionWithConfigurationIdentifier:forceInfoFetch:completionHandler:]";
        _os_log_error_impl( &dword_1876B1000,  v13,  OS_LOG_TYPE_ERROR,  "%s: Cannot create ne_session for nil configID",  buf,  0xCu);
      }

      if (v8)
      {
        [MEMORY[0x189607870] errorWithDomain:@"NEVPNErrorDomain" code:1 userInfo:0];
        int v14 = (void *)objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1895F87A8];
        block[1] = 3221225472LL;
        block[2] = __93__NEVPNConnection_createSessionWithConfigurationIdentifier_forceInfoFetch_completionHandler___block_invoke;
        block[3] = &unk_18A0908C8;
        id v31 = v14;
        id v32 = v8;
        id v15 = v14;
        dispatch_async(MEMORY[0x1895F8AE0], block);
      }
    }

    objc_sync_exit(v9);
  }
}

uint64_t __93__NEVPNConnection_createSessionWithConfigurationIdentifier_forceInfoFetch_completionHandler___block_invoke( uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

uint64_t __93__NEVPNConnection_createSessionWithConfigurationIdentifier_forceInfoFetch_completionHandler___block_invoke_28( uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

void __93__NEVPNConnection_createSessionWithConfigurationIdentifier_forceInfoFetch_completionHandler___block_invoke_2( uint64_t a1,  int a2)
{
  if (a2 == 2)
  {
    ne_session_release();
  }

  else if (a2 == 1)
  {
    id obj = *(id *)(a1 + 32);
    objc_sync_enter(obj);
    uint64_t v3 = *(void *)(a1 + 32);
    if (v3) {
      uint64_t v4 = *(void *)(v3 + 56);
    }
    else {
      uint64_t v4 = 0LL;
    }
    if (v4 == *(void *)(a1 + 40)) {
      -[NEVPNConnection updateSessionInfoForce:notify:withCompletionHandler:](v3, 0LL, 1LL, 0LL);
    }
    objc_sync_exit(obj);
  }

uint64_t __93__NEVPNConnection_createSessionWithConfigurationIdentifier_forceInfoFetch_completionHandler___block_invoke_3( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __77__NEVPNConnection_createConnectionForEnabledEnterpriseConfigurationWithName___block_invoke_2()
{
  return -[NEVPNConnection reload](createConnectionForEnabledEnterpriseConfigurationWithName__g_headless);
}

- (id)initWithType:(void *)a1
{
  if (!a1) {
    return 0LL;
  }
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_CLASS___NEVPNConnection;
  uint64_t v3 = (id *)objc_msgSendSuper2(&v7, sel_init);
  uint64_t v4 = v3;
  if (v3)
  {
    v3[2] = 0LL;
    v3[7] = 0LL;
    *((_DWORD *)v3 + 3) = a2;
    objc_storeWeak(v3 + 8, 0LL);
    id v5 = v4[9];
    v4[9] = 0LL;
  }

  return v4;
}

- (void)destroySession
{
  if (a1)
  {
    id obj = a1;
    objc_sync_enter(obj);
    v1 = obj;
    if (obj[7])
    {
      ne_session_cancel();
      v1 = obj;
      obj[7] = 0LL;
    }

    id v2 = v1;
    if (v1[2])
    {
      v1[2] = 0LL;
      [MEMORY[0x189607958] defaultCenter];
      uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
      [v3 postNotificationName:@"com.apple.networkextension.statuschanged" object:obj];

      id v2 = obj;
    }

    objc_sync_exit(v2);
  }

@end