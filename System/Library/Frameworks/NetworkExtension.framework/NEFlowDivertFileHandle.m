@interface NEFlowDivertFileHandle
- (NSData)keyMaterial;
- (NSNumber)controlUnit;
- (id)description;
- (id)dictionary;
- (id)getUnitForSocket:(int)a1;
- (id)initFlowDivertControlSocket;
- (id)initFlowDivertControlSocketDisableAppMap:(BOOL)a3;
- (id)initFlowDivertControlSocketWithParams:(BOOL)a3 order:(int)a4;
- (id)initFlowDivertDataSocket;
- (id)initFromDictionary:(id)a3;
- (unint64_t)type;
@end

@implementation NEFlowDivertFileHandle

- (id)initFlowDivertControlSocket
{
  return -[NEFlowDivertFileHandle initFlowDivertControlSocketDisableAppMap:]( self,  "initFlowDivertControlSocketDisableAppMap:",  0LL);
}

- (id)initFlowDivertControlSocketDisableAppMap:(BOOL)a3
{
  return -[NEFlowDivertFileHandle initFlowDivertControlSocketWithParams:order:]( self,  "initFlowDivertControlSocketWithParams:order:",  a3,  0x7FFFFFFFLL);
}

- (id)initFlowDivertControlSocketWithParams:(BOOL)a3 order:(int)a4
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  int v18 = a4;
  uint64_t KernelControlSocket = NEHelperGetKernelControlSocket();
  if ((KernelControlSocket & 0x80000000) != 0) {
    goto LABEL_11;
  }
  int v6 = KernelControlSocket;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___NEFlowDivertFileHandle;
  self = -[NEFileHandle initWithFileDescriptor:launchOwnerWhenReadable:]( &v17,  sel_initWithFileDescriptor_launchOwnerWhenReadable_,  KernelControlSocket,  1LL);
  if (!self) {
    goto LABEL_10;
  }
  -[NEFlowDivertFileHandle getUnitForSocket:](v6);
  v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  controlUnit = self->_controlUnit;
  self->_controlUnit = v7;

  arc4random_buf(__buf, 0x100uLL);
  v9 = (void *)NEFlowTLVMsgCreate();
  NEFlowTLVAdd();
  nelog_is_debug_logging_enabled();
  NEFlowTLVAdd();
  NEFlowTLVAdd();
  NEFlowTLVAdd();
  ssize_t v10 = send(v6, v9, 0LL, 0);
  if (v10 < 0)
  {
    ne_log_obj();
    keyMaterial = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(keyMaterial, OS_LOG_TYPE_ERROR))
    {
      v15 = __error();
      v16 = strerror(*v15);
      *(_DWORD *)buf = 136315138;
      v20 = v16;
      _os_log_error_impl( &dword_1876B1000,  keyMaterial,  OS_LOG_TYPE_ERROR,  "Failed to send the FLOW_DIVERT_PKT_GROUP_INIT message: %s",  buf,  0xCu);
    }
  }

  else
  {
    v11 = (NSData *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:__buf length:256];
    keyMaterial = (os_log_s *)self->_keyMaterial;
    self->_keyMaterial = v11;
  }

  if (v9) {
    CFAllocatorDeallocate((CFAllocatorRef)*MEMORY[0x189604DB0], v9);
  }
  if (v10 < 0)
  {
LABEL_11:
    v13 = 0LL;
  }

  else
  {
LABEL_10:
    self = self;
    v13 = self;
  }

  return v13;
}

- (id)initFlowDivertDataSocket
{
  uint64_t KernelControlSocket = NEHelperGetKernelControlSocket();
  if ((KernelControlSocket & 0x80000000) != 0)
  {
    v8 = 0LL;
  }

  else
  {
    int v4 = KernelControlSocket;
    v10.receiver = self;
    v10.super_class = (Class)&OBJC_CLASS___NEFlowDivertFileHandle;
    v5 = -[NEFileHandle initWithFileDescriptor:launchOwnerWhenReadable:]( &v10,  sel_initWithFileDescriptor_launchOwnerWhenReadable_,  KernelControlSocket,  1LL);
    if (v5)
    {
      uint64_t v6 = -[NEFlowDivertFileHandle getUnitForSocket:](v4);
      controlUnit = v5->_controlUnit;
      v5->_controlUnit = (NSNumber *)v6;
    }

    self = v5;
    v8 = self;
  }

  return v8;
}

- (id)initFromDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___NEFlowDivertFileHandle;
  v5 = -[NEFileHandle initFromDictionary:](&v14, sel_initFromDictionary_, v4);
  if (v5)
  {
    uint64_t uint64 = xpc_dictionary_get_uint64(v4, "control-unit");
    size_t length = 0LL;
    data = xpc_dictionary_get_data(v4, "key-material", &length);
    uint64_t v8 = [MEMORY[0x189607968] numberWithUnsignedLongLong:uint64];
    v9 = (void *)v5[3];
    v5[3] = v8;

    if (data)
    {
      if (length)
      {
        uint64_t v10 = objc_msgSend(MEMORY[0x189603F48], "dataWithBytes:length:", data);
        v11 = (void *)v5[4];
        v5[4] = v10;
      }
    }
  }

  return v5;
}

- (id)dictionary
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___NEFlowDivertFileHandle;
  v3 = -[NEFileHandle dictionary](&v11, sel_dictionary);
  -[NEFlowDivertFileHandle controlUnit](self, "controlUnit");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_set_uint64(v3, "control-unit", [v4 unsignedLongLongValue]);
  v5 = -[NEFlowDivertFileHandle keyMaterial](self, "keyMaterial");
  uint64_t v6 = [v5 length];

  if (v6)
  {
    id v7 = -[NEFlowDivertFileHandle keyMaterial](self, "keyMaterial");
    uint64_t v8 = (const void *)[v7 bytes];
    v9 = -[NEFlowDivertFileHandle keyMaterial](self, "keyMaterial");
    xpc_dictionary_set_data(v3, "key-material", v8, [v9 length]);
  }

  return v3;
}

- (id)description
{
  v3 = (void *)NSString;
  -[NEFileHandle handle](self, "handle");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 fileDescriptor];
  -[NEFlowDivertFileHandle controlUnit](self, "controlUnit");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"Flow Divert socket (%d) control unit %@", v5, v6];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)type
{
  return 3LL;
}

- (NSNumber)controlUnit
{
  return (NSNumber *)objc_getProperty(self, a2, 24LL, 1);
}

- (NSData)keyMaterial
{
  return (NSData *)objc_getProperty(self, a2, 32LL, 1);
}

- (void).cxx_destruct
{
}

- (id)getUnitForSocket:(int)a1
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  socklen_t v5 = 32;
  sockaddr v6 = (sockaddr)0;
  __int128 v7 = 0u;
  if (getpeername(a1, &v6, &v5))
  {
    ne_log_obj();
    v1 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    {
      v3 = __error();
      id v4 = strerror(*v3);
      *(_DWORD *)buf = 136315138;
      v9 = v4;
      _os_log_error_impl(&dword_1876B1000, v1, OS_LOG_TYPE_ERROR, "getpeername on control socket failed: %s", buf, 0xCu);
    }

    return 0LL;
  }

  else
  {
    [MEMORY[0x189607968] numberWithUnsignedInt:*(unsigned int *)&v6.sa_data[6]];
    return (id)objc_claimAutoreleasedReturnValue();
  }

@end