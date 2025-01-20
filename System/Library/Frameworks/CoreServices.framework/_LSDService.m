@interface _LSDService
+ (BOOL)XPCConnectionIsAlwaysPrivileged;
+ (BOOL)isEnabled;
+ (Class)clientClass;
+ (id)XPCConnectionToService;
+ (id)XPCInterface;
+ (id)XPCProxyWithErrorHandler:(uint64_t)a1;
+ (id)dispatchQueue;
+ (id)replacementObjectForXPCConnection:(id)a3 encoder:(id)a4 object:(id)a5;
+ (id)synchronousXPCProxyWithErrorHandler:(uint64_t)a1;
+ (unsigned)connectionType;
+ (void)XPCConnectionToService;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_LSDService)initWithXPCListener:(id)a3;
- (id).cxx_construct;
- (id)clientForConnection:(id)a3;
- (id)replacementObjectForXPCConnection:(id)a3 encoder:(id)a4 object:(id)a5;
- (void)clientBorn:(id)a3 forNewConnection:(id)a4;
- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5;
- (void)connectionWasInvalidated:(id)a3;
@end

@implementation _LSDService

+ (id)XPCConnectionToService
{
  if ([(id)__LSDefaultsGetSharedInstance() isInXCTestRigInsecure])
  {
    v3 = +[_LSDServiceDomain defaultServiceDomain]();
    _LSDServiceGetXPCConnection(a1, (uint64_t)v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    _LSDefaultLog();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      +[_LSDService XPCConnectionToService].cold.1(v5);
    }

    v4 = 0LL;
  }

  return v4;
}

+ (id)XPCProxyWithErrorHandler:(uint64_t)a1
{
  v3 = (void *)objc_opt_self();
  v4 = +[_LSDServiceDomain defaultServiceDomain]();
  _LSDServiceGetXPCProxyForServiceClass(v3, (uint64_t)v4, 0, a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)synchronousXPCProxyWithErrorHandler:(uint64_t)a1
{
  v3 = (void *)objc_opt_self();
  v4 = +[_LSDServiceDomain defaultServiceDomain]();
  _LSDServiceGetXPCProxyForServiceClass(v3, (uint64_t)v4, 1, a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (_LSDService)initWithXPCListener:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS____LSDService;
  v4 = -[_LSDService init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    objc_storeWeak((id *)&v4->_listener, a3);
    uint64_t v6 = [MEMORY[0x189607920] strongToStrongObjectsMapTable];
    clientMap = v5->_clientMap;
    v5->_clientMap = (NSMapTable *)v6;
  }

  return v5;
}

- (void)clientBorn:(id)a3 forNewConnection:(id)a4
{
  p_clientMapMutex = (os_unfair_lock_s *)&self->_clientMapMutex;
  os_unfair_lock_lock((os_unfair_lock_t)&self->_clientMapMutex);
  -[NSMapTable setObject:forKey:](self->_clientMap, "setObject:forKey:", a3, a4);
  os_unfair_lock_unlock(p_clientMapMutex);
}

- (void)connectionWasInvalidated:(id)a3
{
  p_clientMapMutex = (os_unfair_lock_s *)&self->_clientMapMutex;
  os_unfair_lock_lock((os_unfair_lock_t)&self->_clientMapMutex);
  -[NSMapTable removeObjectForKey:](self->_clientMap, "removeObjectForKey:", a3);
  os_unfair_lock_unlock(p_clientMapMutex);
}

- (id)clientForConnection:(id)a3
{
  p_clientMapMutex = (os_unfair_lock_s *)&self->_clientMapMutex;
  os_unfair_lock_lock((os_unfair_lock_t)&self->_clientMapMutex);
  -[NSMapTable objectForKey:](self->_clientMap, "objectForKey:", a3);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_clientMapMutex);
  return v6;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v6 = (objc_class *)[(id)objc_opt_class() clientClass];
  [(id)objc_opt_class() XPCInterface];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6
    && ((v8 = -[objc_class isSubclassOfClass:](v6, "isSubclassOfClass:", objc_opt_class()), v7) ? (int v9 = v8) : (int v9 = 0),
        v9 == 1))
  {
    [(id)objc_opt_class() dispatchQueue];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)[[v6 alloc] initWithXPCConnection:a4 queue:v10];
    BOOL v12 = v11 != 0LL;
    if (v11)
    {
      [a4 setExportedInterface:v7];
      [a4 setExportedObject:v11];
      [a4 setDelegate:self];
      objc_initWeak(&location, a4);
      objc_initWeak(&from, self);
      uint64_t v14 = MEMORY[0x1895F87A8];
      uint64_t v15 = 3221225472LL;
      v16 = __50___LSDService_listener_shouldAcceptNewConnection___block_invoke;
      v17 = &unk_189D76A50;
      objc_copyWeak(&v18, &from);
      objc_copyWeak(&v19, &location);
      [a4 setInvalidationHandler:&v14];
      -[_LSDService clientBorn:forNewConnection:](self, "clientBorn:forNewConnection:", v11, a4, v14, v15, v16, v17);
      [a4 resume];
      objc_destroyWeak(&v19);
      objc_destroyWeak(&v18);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }
  }

  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

+ (id)replacementObjectForXPCConnection:(id)a3 encoder:(id)a4 object:(id)a5
{
  return _LSDServiceReplaceObject((objc_object *)a5);
}

- (id)replacementObjectForXPCConnection:(id)a3 encoder:(id)a4 object:(id)a5
{
  return _LSDServiceReplaceObject((objc_object *)a5);
}

- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5
{
  BOOL v5 = a5;
  -[_LSDService clientForConnection:](self, "clientForConnection:");
  int v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    _LSDefaultLog();
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[_LSDService connection:handleInvocation:isReply:].cold.1((uint64_t)a3, (uint64_t)self, v10);
    }
  }

  [v9 handleXPCInvocation:a4 isReply:v5];
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((_DWORD *)self + 4) = 0;
  return self;
}

+ (unsigned)connectionType
{
  v2 = (void *)MEMORY[0x189603F70];
  uint64_t v3 = *MEMORY[0x189603A58];
  objc_msgSend( NSString,  "stringWithFormat:",  @"unimplemented method %s",  "+[_LSDService(SubclassesShouldOverride) connectionType]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 exceptionWithName:v3 reason:v4 userInfo:0];
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v5);
  v7 = v6;

  _Unwind_Resume(v7);
}

+ (Class)clientClass
{
  v2 = (void *)MEMORY[0x189603F70];
  uint64_t v3 = *MEMORY[0x189603A58];
  objc_msgSend( NSString,  "stringWithFormat:",  @"unimplemented method %s",  "+[_LSDService(SubclassesShouldOverride) clientClass]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 exceptionWithName:v3 reason:v4 userInfo:0];
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v5);
  v7 = v6;

  _Unwind_Resume(v7);
}

+ (id)XPCInterface
{
  v2 = (void *)MEMORY[0x189603F70];
  uint64_t v3 = *MEMORY[0x189603A58];
  objc_msgSend( NSString,  "stringWithFormat:",  @"unimplemented method %s",  "+[_LSDService(SubclassesShouldOverride) XPCInterface]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 exceptionWithName:v3 reason:v4 userInfo:0];
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v5);
  v7 = v6;

  _Unwind_Resume(v7);
}

+ (BOOL)isEnabled
{
  return 1;
}

+ (BOOL)XPCConnectionIsAlwaysPrivileged
{
  return 0;
}

+ (id)dispatchQueue
{
  return 0LL;
}

+ (void)XPCConnectionToService
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl( &dword_183E58000,  log,  OS_LOG_TYPE_FAULT,  "Process is directly invoking +XPCConnectionToService. This method is unsupported.",  v1,  2u);
}

- (void)connection:(uint64_t)a1 handleInvocation:(uint64_t)a2 isReply:(os_log_s *)a3 .cold.1(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  OUTLINED_FUNCTION_2_3( &dword_183E58000,  a3,  (uint64_t)a3,  "client was unexpectedly nil for connection %@ for %@",  (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

@end