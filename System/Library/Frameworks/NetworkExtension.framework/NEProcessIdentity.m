@interface NEProcessIdentity
+ (BOOL)supportsSecureCoding;
- (NEProcessIdentity)initWithCoder:(id)a3;
- (NSData)auditTokenData;
- (NSUUID)uuid;
- (id)initFromXPCConnection:(id)a3;
- (id)initFromXPCMessage:(id)a3;
- (int)pid;
- (int)pidVersion;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NEProcessIdentity

- (id)initFromXPCConnection:(id)a3
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  v4 = (_xpc_connection_s *)a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___NEProcessIdentity;
  v5 = -[NEProcessIdentity init](&v17, sel_init);
  if (!v5) {
    goto LABEL_9;
  }
  if (v4)
  {
    pid_t pid = xpc_connection_get_pid(v4);
    memset(buffer, 0, 32);
    xpc_connection_get_audit_token();
    v7 = (NSData *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:buffer length:32];
    if (pid && (uint64_t v19 = 0LL, memset(buffer, 0, sizeof(buffer)), proc_pidinfo(pid, 17, 1uLL, buffer, 56) == 56))
    {
      v8 = (NSUUID *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:buffer];
      v9 = v8;
      int v10 = buffer[2];
      if (LODWORD(buffer[2]) && v8 && v7)
      {
        v5->_pid_t pid = pid;
        v5->_pidVersion = v10;
        uuid = v5->_uuid;
        v5->_uuid = v8;
        v12 = v8;

        auditTokenData = v5->_auditTokenData;
        v5->_auditTokenData = v7;

LABEL_9:
        v14 = v5;
        goto LABEL_15;
      }
    }

    else
    {
      int v10 = 0;
      v9 = 0LL;
    }
  }

  else
  {
    int v10 = 0;
    v9 = 0LL;
    pid_t pid = 0;
    v7 = 0LL;
  }

  ne_log_obj();
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    LODWORD(buffer[0]) = 67109890;
    DWORD1(buffer[0]) = pid;
    WORD4(buffer[0]) = 1024;
    *(_DWORD *)((char *)buffer + 10) = v10;
    HIWORD(buffer[0]) = 2112;
    *(void *)&buffer[1] = v9;
    WORD4(buffer[1]) = 2112;
    *(void *)((char *)&buffer[1] + 10) = v7;
    _os_log_error_impl( &dword_1876B1000,  v15,  OS_LOG_TYPE_ERROR,  "Failed to derive the extension's identity data from xpc connection: %d, %d, %@, %@",  (uint8_t *)buffer,  0x22u);
  }

  v14 = 0LL;
LABEL_15:

  return v14;
}

- (id)initFromXPCMessage:(id)a3
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___NEProcessIdentity;
  v5 = -[NEProcessIdentity init](&v17, sel_init);
  if (!v5) {
    goto LABEL_14;
  }
  if (v4 && MEMORY[0x1895ADD58](v4) == MEMORY[0x1895F9250])
  {
    memset(buffer, 0, 32);
    xpc_dictionary_get_audit_token();
    v9 = (NSData *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:buffer length:32];
    int v8 = DWORD1(buffer[1]);
    if (!DWORD1(buffer[1])
      || (uint64_t v19 = 0LL, memset(buffer, 0, sizeof(buffer)), proc_pidinfo(v8, 17, 1uLL, buffer, 56) != 56))
    {
      int v6 = 0;
      v7 = 0LL;
      goto LABEL_5;
    }

    v12 = (NSUUID *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:buffer];
    v7 = v12;
    int v6 = buffer[2];
    if (!LODWORD(buffer[2]) || !v12 || !v9) {
      goto LABEL_5;
    }
    v5->_pid_t pid = v8;
    v5->_pidVersion = v6;
    uuid = v5->_uuid;
    v5->_uuid = v12;
    v14 = v12;

    auditTokenData = v5->_auditTokenData;
    v5->_auditTokenData = v9;

LABEL_14:
    v11 = v5;
    goto LABEL_15;
  }

  int v6 = 0;
  v7 = 0LL;
  int v8 = 0;
  v9 = 0LL;
LABEL_5:
  ne_log_obj();
  int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    LODWORD(buffer[0]) = 67109890;
    DWORD1(buffer[0]) = v8;
    WORD4(buffer[0]) = 1024;
    *(_DWORD *)((char *)buffer + 10) = v6;
    HIWORD(buffer[0]) = 2112;
    *(void *)&buffer[1] = v7;
    WORD4(buffer[1]) = 2112;
    *(void *)((char *)&buffer[1] + 10) = v9;
    _os_log_error_impl( &dword_1876B1000,  v10,  OS_LOG_TYPE_ERROR,  "Failed to derive the extension's identity data from xpc message: %d, %d, %@, %@",  (uint8_t *)buffer,  0x22u);
  }

  v11 = 0LL;
LABEL_15:

  return v11;
}

- (NEProcessIdentity)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___NEProcessIdentity;
  v5 = -[NEProcessIdentity init](&v11, sel_init);
  if (v5)
  {
    v5->_pid_t pid = [v4 decodeIntForKey:@"pid"];
    v5->_pidVersion = [v4 decodeInt32ForKey:@"pidVersion"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"auditToken"];
    auditTokenData = v5->_auditTokenData;
    v5->_auditTokenData = (NSData *)v8;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInt:forKey:", -[NEProcessIdentity pid](self, "pid"), @"pid");
  objc_msgSend(v4, "encodeInt32:forKey:", -[NEProcessIdentity pidVersion](self, "pidVersion"), @"pidVersion");
  v5 = -[NEProcessIdentity uuid](self, "uuid");
  [v4 encodeObject:v5 forKey:@"uuid"];

  -[NEProcessIdentity auditTokenData](self, "auditTokenData");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v6 forKey:@"auditToken"];
}

- (int)pid
{
  return self->_pid;
}

- (int)pidVersion
{
  return self->_pidVersion;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSData)auditTokenData
{
  return self->_auditTokenData;
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end