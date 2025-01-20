@interface TKClientTokenSession
- (BOOL)_testing_AuthenticateInternally;
- (BOOL)_testing_ForceAuthenticationNeeded;
- (BOOL)authenticateWhenNeeded;
- (BOOL)deleteObject:(id)a3 error:(id *)a4;
- (BOOL)evaluateAccessControl:(id)a3 forOperation:(id)a4 error:(id *)a5;
- (BOOL)isValidWithError:(id *)a3;
- (LAContext)LAContext;
- (NSArray)certificates;
- (NSArray)identities;
- (NSArray)keys;
- (NSDictionary)parameters;
- (NSString)slotName;
- (TKClientToken)token;
- (TKClientTokenSession)initWithToken:(id)a3 LAContext:(id)a4 parameters:(id)a5 error:(id *)a6;
- (TKClientTokenSession)initWithTokenID:(id)a3 LAContext:(id)a4 error:(id *)a5;
- (id)_initWithToken:(id)a3 LAContext:(id)a4 parameters:(id)a5 error:(id *)a6;
- (id)_testing_AuthContextUsed;
- (id)createObjectWithAttributes:(id)a3 error:(id *)a4;
- (id)objectForObjectID:(id)a3 error:(id *)a4;
- (id)processObjectCreationAttributes:(id)a3 authContext:(id *)a4 error:(id *)a5;
- (void)setAuthenticateWhenNeeded:(BOOL)a3;
- (void)setLAContext:(id)a3;
- (void)set_testing_AuthContextUsed:(id)a3;
- (void)set_testing_AuthenticateInternally:(BOOL)a3;
- (void)set_testing_ForceAuthenticationNeeded:(BOOL)a3;
@end

@implementation TKClientTokenSession

- (BOOL)isValidWithError:(id *)a3
{
  return 1;
}

- (id)_initWithToken:(id)a3 LAContext:(id)a4 parameters:(id)a5 error:(id *)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___TKClientTokenSession;
  v14 = -[TKClientTokenSession init](&v18, sel_init);
  p_isa = (id *)&v14->super.isa;
  if (v14
    && (v14->_authenticateWhenNeeded = 1,
        objc_storeStrong((id *)&v14->_token, a3),
        objc_storeStrong(p_isa + 2, a4),
        objc_storeStrong(p_isa + 3, a5),
        ![p_isa isValidWithError:a6]))
  {
    v16 = 0LL;
  }

  else
  {
    v16 = p_isa;
  }

  return v16;
}

- (TKClientTokenSession)initWithToken:(id)a3 LAContext:(id)a4 parameters:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v14 = off_189F89790;
  if ((isKindOfClass & 1) == 0) {
    v14 = off_189F89780;
  }
  v15 = (TKClientTokenSession *)[objc_alloc(*v14) initWithToken:v10 LAContext:v12 parameters:v11 error:a6];

  return v15;
}

- (TKClientTokenSession)initWithTokenID:(id)a3 LAContext:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = -[TKClientToken initWithTokenID:](objc_alloc(&OBJC_CLASS___TKClientToken), "initWithTokenID:", v9);

  id v11 = -[TKClientTokenSession initWithToken:LAContext:parameters:error:]( self,  "initWithToken:LAContext:parameters:error:",  v10,  v8,  MEMORY[0x189604A60],  a5);
  return v11;
}

- (BOOL)deleteObject:(id)a3 error:(id *)a4
{
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = [v5 deleteWithError:a4];

  return (char)a4;
}

- (BOOL)evaluateAccessControl:(id)a3 forOperation:(id)a4 error:(id *)a5
{
  if (a5)
  {
    [MEMORY[0x189607870] errorWithDomain:@"CryptoTokenKit" code:-1 userInfo:MEMORY[0x189604A60]];
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0;
}

- (id)objectForObjectID:(id)a3 error:(id *)a4
{
  return 0LL;
}

- (id)createObjectWithAttributes:(id)a3 error:(id *)a4
{
  if (a4)
  {
    [MEMORY[0x189607870] errorWithDomain:@"CryptoTokenKit" code:-1 userInfo:MEMORY[0x189604A60]];
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0LL;
}

- (id)processObjectCreationAttributes:(id)a3 authContext:(id *)a4 error:(id *)a5
{
  id v8 = a3;
  v27 = a5;
  uint64_t v9 = *MEMORY[0x18960B818];
  [v8 objectForKeyedSubscript:*MEMORY[0x18960B818]];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
LABEL_26:
    id v8 = v8;
    v21 = v8;
    goto LABEL_27;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    uint64_t v11 = SecAccessControlCreateFromData();
    if (!v11)
    {
      TK_LOG_client_0();
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
        -[TKClientTokenSession processObjectCreationAttributes:authContext:error:].cold.1();
      }
      goto LABEL_13;
    }

    id v12 = (void *)v11;

    id v10 = v12;
  }

  if ((SecAccessControlIsBound() & 1) != 0)
  {
    -[TKClientTokenSession _testing_AuthContextUsed](self, "_testing_AuthContextUsed");
    id v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13) {
      goto LABEL_24;
    }
    v14 = -[TKClientTokenSession LAContext](self, "LAContext");
    if (v14)
    {
      -[TKClientTokenSession set_testing_AuthContextUsed:](self, "set_testing_AuthContextUsed:", v14);
    }

    else
    {
      id v22 = objc_alloc_init(MEMORY[0x189608728]);
      -[TKClientTokenSession set_testing_AuthContextUsed:](self, "set_testing_AuthContextUsed:", v22);
    }

- (LAContext)LAContext
{
  return self->_LAContext;
}

- (void)setLAContext:(id)a3
{
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (TKClientToken)token
{
  return self->_token;
}

- (BOOL)authenticateWhenNeeded
{
  return self->_authenticateWhenNeeded;
}

- (void)setAuthenticateWhenNeeded:(BOOL)a3
{
  self->_authenticateWhenNeeded = a3;
}

- (NSArray)keys
{
  return self->_keys;
}

- (NSArray)certificates
{
  return self->_certificates;
}

- (NSArray)identities
{
  return self->_identities;
}

- (NSString)slotName
{
  return self->_slotName;
}

- (BOOL)_testing_AuthenticateInternally
{
  return self->__testing_AuthenticateInternally;
}

- (void)set_testing_AuthenticateInternally:(BOOL)a3
{
  self->__testing_AuthenticateInternally = a3;
}

- (BOOL)_testing_ForceAuthenticationNeeded
{
  return self->__testing_ForceAuthenticationNeeded;
}

- (void)set_testing_ForceAuthenticationNeeded:(BOOL)a3
{
  self->__testing_ForceAuthenticationNeeded = a3;
}

- (id)_testing_AuthContextUsed
{
  return self->__testing_AuthContextUsed;
}

- (void)set_testing_AuthContextUsed:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)processObjectCreationAttributes:authContext:error:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_13();
  _os_log_fault_impl( &dword_186E58000,  v0,  OS_LOG_TYPE_FAULT,  "Unable to deserialize AC %{public}@, error: %{public}@",  v1,  0x16u);
  OUTLINED_FUNCTION_4();
}

- (void)processObjectCreationAttributes:(uint64_t *)a1 authContext:(os_log_s *)a2 error:.cold.2( uint64_t **a1,  os_log_s *a2)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  uint64_t v2 = **a1;
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl( &dword_186E58000,  a2,  OS_LOG_TYPE_ERROR,  "-[LAContext evaluateAccessControl:] failed but did not provide an error, syntesizing: %{public}@",  (uint8_t *)&v3,  0xCu);
  OUTLINED_FUNCTION_4();
}

@end