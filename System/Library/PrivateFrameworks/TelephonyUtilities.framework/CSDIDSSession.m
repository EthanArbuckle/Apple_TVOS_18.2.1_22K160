@interface CSDIDSSession
- (BOOL)isCellularDataAllowed;
- (BOOL)isCellularDataPreferred;
- (BOOL)isWiFiAllowed;
- (CSDIDSSession)init;
- (CSDIDSSession)initWithSessionProvider:(id)a3;
- (CSDIDSSessionProvider)sessionProvider;
- (NSMutableDictionary)preferences;
- (NSString)UUID;
- (NSString)propertiesDescription;
- (NSUUID)clientUUID;
- (id)description;
- (void)_updateSessionPreferences;
- (void)setCellularDataAllowed:(BOOL)a3;
- (void)setCellularDataPreferred:(BOOL)a3;
- (void)setClientUUID:(id)a3;
- (void)setWiFiAllowed:(BOOL)a3;
@end

@implementation CSDIDSSession

- (CSDIDSSession)init
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  objc_msgSend( v4,  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"CSDIDSSession.m",  26,  @"%s is not available. Use a designated initializer instead.",  "-[CSDIDSSession init]");

  return 0LL;
}

- (CSDIDSSession)initWithSessionProvider:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___CSDIDSSession;
  v6 = -[CSDIDSSession init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sessionProvider, a3);
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    preferences = v7->_preferences;
    v7->_preferences = (NSMutableDictionary *)v8;
  }

  return v7;
}

- (id)description
{
  uint64_t v3 = objc_opt_class(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSSession propertiesDescription](self, "propertiesDescription"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@ %p %@>",  v3,  self,  v4));

  return v5;
}

- (NSString)propertiesDescription
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSSession UUID](self, "UUID"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"UUID=%@", v2));

  return (NSString *)v3;
}

- (NSString)UUID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSSession sessionProvider](self, "sessionProvider"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 UUID]);

  return (NSString *)v3;
}

- (void)_updateSessionPreferences
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[CSDIDSSession sessionProvider](self, "sessionProvider"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSSession preferences](self, "preferences"));
  [v4 setPreferences:v3];
}

- (BOOL)isWiFiAllowed
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSSession preferences](self, "preferences"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:IDSSessionDisallowWifiInterfaceKey]);
  char v4 = [v3 BOOLValue] ^ 1;

  return v4;
}

- (void)setWiFiAllowed:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = sub_1001704C4();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    v10 = self;
    __int16 v11 = 1024;
    BOOL v12 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "self: %@ wiFiAllowed: %d",  (uint8_t *)&v9,  0x12u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", !v3));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSSession preferences](self, "preferences"));
  [v8 setObject:v7 forKeyedSubscript:IDSSessionDisallowWifiInterfaceKey];

  -[CSDIDSSession _updateSessionPreferences](self, "_updateSessionPreferences");
}

- (BOOL)isCellularDataAllowed
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSSession preferences](self, "preferences"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:IDSSessionDisallowCellularInterfaceKey]);
  char v4 = [v3 BOOLValue] ^ 1;

  return v4;
}

- (void)setCellularDataAllowed:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = sub_1001704C4();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    v10 = self;
    __int16 v11 = 1024;
    BOOL v12 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "self: %@ cellularDataAllowed: %d",  (uint8_t *)&v9,  0x12u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", !v3));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSSession preferences](self, "preferences"));
  [v8 setObject:v7 forKeyedSubscript:IDSSessionDisallowCellularInterfaceKey];

  -[CSDIDSSession _updateSessionPreferences](self, "_updateSessionPreferences");
}

- (BOOL)isCellularDataPreferred
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSSession preferences](self, "preferences"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:IDSSessionPreferCellularForCallSetupKey]);
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (void)setCellularDataPreferred:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = sub_1001704C4();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    v10 = self;
    __int16 v11 = 1024;
    BOOL v12 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "self: %@ cellularDataPreferred: %d",  (uint8_t *)&v9,  0x12u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v3));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSSession preferences](self, "preferences"));
  [v8 setObject:v7 forKeyedSubscript:IDSSessionPreferCellularForCallSetupKey];

  -[CSDIDSSession _updateSessionPreferences](self, "_updateSessionPreferences");
}

- (NSUUID)clientUUID
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSSession preferences](self, "preferences"));
  uint64_t v4 = IDSSessionClientUUIDKey;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:IDSSessionClientUUIDKey]);
  if (v5)
  {
    v6 = objc_alloc(&OBJC_CLASS___NSUUID);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSSession preferences](self, "preferences"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v4]);
    int v9 = -[NSUUID initWithUUIDString:](v6, "initWithUUIDString:", v8);
  }

  else
  {
    int v9 = 0LL;
  }

  return v9;
}

- (void)setClientUUID:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);
    int v10 = 138412546;
    __int16 v11 = self;
    __int16 v12 = 2112;
    v13 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "self: %@ clientUUID: %@",  (uint8_t *)&v10,  0x16u);
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);
  int v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSSession preferences](self, "preferences"));
  [v9 setObject:v8 forKeyedSubscript:IDSSessionClientUUIDKey];

  -[CSDIDSSession _updateSessionPreferences](self, "_updateSessionPreferences");
}

- (CSDIDSSessionProvider)sessionProvider
{
  return self->_sessionProvider;
}

- (NSMutableDictionary)preferences
{
  return self->_preferences;
}

- (void).cxx_destruct
{
}

@end