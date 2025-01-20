@interface NSFileReactorProxy
+ (void)_enumerateParentDirectoriesStartingAtURL:(id)a3 usingBlock:(id)a4;
- (BOOL)allowedForURL:(id)a3;
- (NSFileReactorProxy)initWithClient:(id)a3 reactorID:(id)a4;
- (id)_clientProxy;
- (id)client;
- (id)description;
- (id)descriptionWithIndenting:(id)a3;
- (id)itemLocation;
- (id)reactorID;
- (unsigned)effectiveUserIdentifier;
- (void)collectDebuggingInformationWithCompletionHandler:(id)a3;
- (void)dealloc;
- (void)setEffectiveUserIdentifier:(unsigned int)a3;
@end

@implementation NSFileReactorProxy

- (NSFileReactorProxy)initWithClient:(id)a3 reactorID:(id)a4
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NSFileReactorProxy;
  v6 = -[NSFileReactorProxy init](&v8, sel_init);
  if (v6)
  {
    v6->_client = (NSXPCConnection *)a3;
    v6->_reactorID = a4;
  }

  return v6;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSFileReactorProxy;
  -[NSFileReactorProxy dealloc](&v3, sel_dealloc);
}

- (id)client
{
  return self->_client;
}

- (id)reactorID
{
  return self->_reactorID;
}

- (void)setEffectiveUserIdentifier:(unsigned int)a3
{
  self->_effectiveUserIdentifier = a3;
}

- (unsigned)effectiveUserIdentifier
{
  return self->_effectiveUserIdentifier;
}

- (id)itemLocation
{
  return self->_itemLocation;
}

- (id)descriptionWithIndenting:(id)a3
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  client = self->_client;
  if (client)
  {
    uint64_t v6 = -[NSXPCConnection processIdentifier](client, "processIdentifier");
    int v7 = proc_name(v6, buffer, 0x100u);
    if (v7 < 1) {
      objc_super v8 = 0LL;
    }
    else {
      objc_super v8 =  -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  buffer,  v7,  4LL);
    }
    uint64_t v9 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ (%i)", v8, v6);
  }

  else
  {
    uint64_t v9 = (NSString *)@"<?>";
  }

  uint64_t v10 = [a3 stringByAppendingString:@"    "];
  id result = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@<%@ %p> client: %@, reactor ID: %@",  a3,  objc_opt_class(),  self,  v9,  self->_reactorID);
  itemLocation = self->_itemLocation;
  if (itemLocation) {
    return (id)[result stringByAppendingFormat:@"\n%@location: %p", v10, itemLocation];
  }
  return result;
}

- (id)description
{
  return -[NSFileReactorProxy descriptionWithIndenting:](self, "descriptionWithIndenting:", &stru_189CA6A28);
}

- (BOOL)allowedForURL:(id)a3
{
  return 0;
}

+ (void)_enumerateParentDirectoriesStartingAtURL:(id)a3 usingBlock:(id)a4
{
  id v5 = a3;
  uint64_t v7 = *MEMORY[0x1895F89C0];
  char v6 = 0;
  (*((void (**)(id, id, char *))a4 + 2))(a4, a3, &v6);
  if (v5 && !v6)
  {
    do
    {
      if (objc_msgSend((id)objc_msgSend(v5, "path"), "isEqualToString:", @"/")) {
        break;
      }
      id v5 = (id)[v5 URLByDeletingLastPathComponent];
      (*((void (**)(id, id, char *))a4 + 2))(a4, v5, &v6);
      if (!v5) {
        break;
      }
    }

    while (!v6);
  }

- (id)_clientProxy
{
  return 0LL;
}

- (void)collectDebuggingInformationWithCompletionHandler:(id)a3
{
  v5[5] = *MEMORY[0x1895F89C0];
  id v4 = -[NSFileReactorProxy _clientProxy](self, "_clientProxy");
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __71__NSFileReactorProxy_collectDebuggingInformationWithCompletionHandler___block_invoke;
  v5[3] = &unk_189CA4430;
  v5[4] = a3;
  objc_msgSend( (id)objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v5),  "collectDebuggingInformationWithCompletionHandler:",  a3);
}

uint64_t __71__NSFileReactorProxy_collectDebuggingInformationWithCompletionHandler___block_invoke( uint64_t a1,  uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v4 = (os_log_s *)_NSFCLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138543618;
    uint64_t v7 = @"collectDebuggingInformation";
    __int16 v8 = 2114;
    uint64_t v9 = a2;
    _os_log_error_impl( &dword_182EB1000,  v4,  OS_LOG_TYPE_ERROR,  "Sending of a '%{public}@' message was interrupted: %{public}@",  (uint8_t *)&v6,  0x16u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

@end