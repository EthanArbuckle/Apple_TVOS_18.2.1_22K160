@interface GTEntitlementCheckingConnection
- (BOOL)isTrusted;
- (GTEntitlementCheckingConnection)initWithTransactionScopedXPCConnection:(id)a3 messageQueue:(id)a4;
@end

@implementation GTEntitlementCheckingConnection

- (GTEntitlementCheckingConnection)initWithTransactionScopedXPCConnection:(id)a3 messageQueue:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___GTEntitlementCheckingConnection;
  v4 = -[GTLocalXPCConnection initWithTransactionScopedXPCConnection:messageQueue:]( &v8,  "initWithTransactionScopedXPCConnection:messageQueue:",  a3,  a4);
  if (v4)
  {
    os_log_t v5 = os_log_create("com.apple.gputools.transport", "EntitlementConnection");
    log = v4->_log;
    v4->_log = v5;
  }

  return v4;
}

- (BOOL)isTrusted
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GTLocalXPCConnection connection](self, "connection"));
  xpc_connection_get_audit_token(v3, &v20);

  audit_token_t token = v20;
  SecTaskRef v4 = SecTaskCreateWithAuditToken(0LL, &token);
  log = self->_log;
  if (v4)
  {
    v6 = v4;
    v7 = log;
    CFErrorRef error = 0LL;
    CFTypeRef v8 = SecTaskCopyValueForEntitlement(v6, @"com.apple.private.gputools.client", &error);
    CFErrorRef v9 = error;
    if (error)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        token.val[0] = 138412290;
        *(void *)&token.val[1] = v9;
        _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "Failed to copy com.apple.private.gputools.client entitlement value, %@",  (uint8_t *)&token,  0xCu);
        CFErrorRef v9 = error;
      }

      CFErrorRef v10 = v9;
    }

    else
    {
      v16 = (void *)v8;
      if (!v8) {
        goto LABEL_7;
      }
      CFTypeID v17 = CFGetTypeID(v8);
      if (v17 == CFBooleanGetTypeID())
      {
        int v18 = CFEqual(v16, kCFBooleanTrue);
        CFRelease(v16);

        if (v18)
        {
LABEL_17:
          CFRelease(v6);
          LOBYTE(v15) = 1;
          return v15;
        }

- (void).cxx_destruct
{
}

@end