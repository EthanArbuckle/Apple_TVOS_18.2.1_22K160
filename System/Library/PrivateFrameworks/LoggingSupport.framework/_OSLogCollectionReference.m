@interface _OSLogCollectionReference
+ (_OSLogCollectionReference)referenceWithURL:(id)a3 error:(id *)a4;
+ (id)localDBRefWithError:(id *)a3;
- (_OSLogCollectionReference)initWithDiagnosticsDirectory:(id)a3 timesyncDirectory:(id)a4 UUIDTextDirectory:(id)a5;
- (_OSLogDirectoryReference)UUIDTextReference;
- (_OSLogDirectoryReference)diagnosticsDirectoryReference;
- (_OSLogDirectoryReference)timesyncReference;
- (void)close;
@end

@implementation _OSLogCollectionReference

- (_OSLogCollectionReference)initWithDiagnosticsDirectory:(id)a3 timesyncDirectory:(id)a4 UUIDTextDirectory:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS____OSLogCollectionReference;
  v12 = -[_OSLogCollectionReference init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_diagnosticsDirectoryReference, a3);
    objc_storeStrong((id *)&v13->_timesyncReference, a4);
    objc_storeStrong((id *)&v13->_UUIDTextReference, a5);
  }

  return v13;
}

- (void)close
{
}

- (_OSLogDirectoryReference)diagnosticsDirectoryReference
{
  return self->_diagnosticsDirectoryReference;
}

- (_OSLogDirectoryReference)timesyncReference
{
  return self->_timesyncReference;
}

- (_OSLogDirectoryReference)UUIDTextReference
{
  return self->_UUIDTextReference;
}

- (void).cxx_destruct
{
}

+ (_OSLogCollectionReference)referenceWithURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)NSString;
  if (_os_trace_shared_paths_init_once != -1) {
    dispatch_once(&_os_trace_shared_paths_init_once, &__block_literal_global_55);
  }
  [v7 stringWithUTF8String:_os_trace_persist_path];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 path];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  int v10 = [v9 hasPrefix:v8];

  if (v10)
  {
    [a1 localDBRefWithError:a4];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_21:

    return (_OSLogCollectionReference *)v11;
  }

  [v6 path];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = [v12 rangeOfString:@".logarchive" options:4];
  if (v13 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a4)
    {
      [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:3 userInfo:0];
      id v11 = 0LL;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      id v11 = 0LL;
    }

    goto LABEL_20;
  }

  id v15 = [v12 substringToIndex:v13 + v14];
  uint64_t v16 = open((const char *)[v15 fileSystemRepresentation], 0);
  if ((_DWORD)v16 == -1)
  {
    if (a4)
    {
      [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:*__error() userInfo:0];
      id v11 = 0LL;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      id v11 = 0LL;
    }

    goto LABEL_19;
  }

  uint64_t v17 = v16;
  v18 = -[_OSLogDirectoryReference initWithDescriptor:sandboxExtensionToken:]( objc_alloc(&OBJC_CLASS____OSLogDirectoryReference),  "initWithDescriptor:sandboxExtensionToken:",  v16,  0LL);
  v19 = -[_OSLogDirectoryReference initWithDescriptor:sandboxExtensionToken:]( objc_alloc(&OBJC_CLASS____OSLogDirectoryReference),  "initWithDescriptor:sandboxExtensionToken:",  v17,  0LL);
  if (close(v17) == -1)
  {
    int v26 = *__error();
    result = (_OSLogCollectionReference *)*__error();
    if (v26 == 9)
    {
      qword_18C695DA0 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
      qword_18C695DD0 = (uint64_t)result;
      __break(1u);
      goto LABEL_26;
    }

    _os_assumes_log();
  }

  id v20 = [v15 stringByAppendingPathComponent:@"timesync"];
  uint64_t v21 = open((const char *)[v20 fileSystemRepresentation], 0);
  if ((_DWORD)v21 == -1)
  {
    v23 = 0LL;
    goto LABEL_18;
  }

  int v22 = v21;
  v23 = -[_OSLogDirectoryReference initWithDescriptor:sandboxExtensionToken:]( objc_alloc(&OBJC_CLASS____OSLogDirectoryReference),  "initWithDescriptor:sandboxExtensionToken:",  v21,  0LL);
  if (close(v22) != -1)
  {
LABEL_18:
    id v11 = (void *)[objc_alloc((Class)a1) initWithDiagnosticsDirectory:v18 timesyncDirectory:v23 UUIDTextDirectory:v19];

LABEL_19:
LABEL_20:

    goto LABEL_21;
  }

  int v24 = *__error();
  result = (_OSLogCollectionReference *)*__error();
  if (v24 != 9)
  {
    _os_assumes_log();
    goto LABEL_18;
  }

+ (id)localDBRefWithError:(id *)a3
{
  v31[3] = *MEMORY[0x1895F89C0];
  OSLogLogdAdminConnection();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    id v9 = 0LL;
LABEL_28:

    return v9;
  }

  xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v6, "operation", 6uLL);
  xpc_object_t v7 = xpc_connection_send_message_with_reply_sync((xpc_connection_t)v5, v6);
  if (MEMORY[0x186E40964]() == MEMORY[0x1895F9268])
  {
    if (a3)
    {
      id v10 = v7;
      string = xpc_dictionary_get_string(v10, (const char *)*MEMORY[0x1895F91B0]);
      if (string) {
        v12 = string;
      }
      else {
        v12 = "unknown error";
      }
      v30[0] = @"_OSLogErrorInternalCode";
      [MEMORY[0x189607968] numberWithUnsignedInteger:15];
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = v13;
      v30[1] = @"_OSLogErrorXPCErrorDescription";
      [NSString stringWithUTF8String:v12];
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
      v30[2] = *MEMORY[0x1896075E0];
      v31[1] = v14;
      v31[2] = @"Connection to logd failed";
      [MEMORY[0x189603F68] dictionaryWithObjects:v31 forKeys:v30 count:3];
      id v15 = (void *)objc_claimAutoreleasedReturnValue();

      uint64_t v16 = [MEMORY[0x189607870] errorWithDomain:@"OSLogErrorDomain" code:10 userInfo:v15];

      v8 = (void *)v16;
      goto LABEL_12;
    }

@end