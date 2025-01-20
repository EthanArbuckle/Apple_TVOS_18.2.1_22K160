@interface DACServiceClient
- (BOOL)_isEqualToClient:(id)a3;
- (BOOL)isEqual:(id)a3;
- (DACServiceClient)initWithConnection:(id)a3;
- (NSXPCConnection)connection;
- (OS_os_transaction)transaction;
- (id)description;
- (unint64_t)hash;
@end

@implementation DACServiceClient

- (DACServiceClient)initWithConnection:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___DACServiceClient;
  v6 = -[DACServiceClient init](&v16, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    id v8 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"com.apple.DeviceActivityConductor.client-%d", -[NSXPCConnection processIdentifier](v7->_connection, "processIdentifier")));
    uint64_t v9 = os_transaction_create([v8 UTF8String]);
    transaction = v7->_transaction;
    v7->_transaction = (OS_os_transaction *)v9;

    id v11 = sub_100014610(4);
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      connection = v7->_connection;
      v14 = v7->_transaction;
      *(_DWORD *)buf = 134218498;
      v18 = v7;
      __int16 v19 = 2114;
      v20 = connection;
      __int16 v21 = 2048;
      v22 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%p new client %{public}@ with transaction %p",  buf,  0x20u);
    }
  }

  return v7;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DACServiceClient connection](self, "connection"));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p, %@>",  v5,  self,  v6));

  return v7;
}

- (BOOL)_isEqualToClient:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DACServiceClient connection](self, "connection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 connection]);

  LOBYTE(v4) = [v5 isEqual:v6];
  return (char)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (DACServiceClient *)a3;
  v6 = v4;
  if (!v4) {
    goto LABEL_5;
  }
  if (self == v4)
  {
    BOOL v8 = 1;
    goto LABEL_7;
  }

  uint64_t v7 = objc_opt_class(&OBJC_CLASS___DACServiceClient, v5);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0) {
    BOOL v8 = -[DACServiceClient _isEqualToClient:](self, "_isEqualToClient:", v6);
  }
  else {
LABEL_5:
  }
    BOOL v8 = 0;
LABEL_7:

  return v8;
}

- (unint64_t)hash
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DACServiceClient connection](self, "connection"));
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void).cxx_destruct
{
}

@end