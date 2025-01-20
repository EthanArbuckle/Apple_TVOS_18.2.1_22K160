@interface MCMXPCMessageSetDataProtection
- (BOOL)isThirdParty;
- (BOOL)retryIfLocked;
- (MCMXPCMessageSetDataProtection)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5;
- (int)dataProtectionClass;
@end

@implementation MCMXPCMessageSetDataProtection

- (MCMXPCMessageSetDataProtection)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MCMXPCMessageSetDataProtection;
  v9 = -[MCMXPCMessageWithContainerBase initWithXPCObject:context:error:]( &v11,  sel_initWithXPCObject_context_error_,  v8,  a4,  a5);
  if (v9)
  {
    v9->_thirdParty = xpc_dictionary_get_BOOL(v8, "IsThirdParty");
    v9->_dataProtectionClass = xpc_dictionary_get_int64(v8, "DataProtectionClass");
    v9->_retryIfLocked = xpc_dictionary_get_BOOL(v8, "RetryIfLocked");
  }

  return v9;
}

- (BOOL)isThirdParty
{
  return self->_thirdParty;
}

- (int)dataProtectionClass
{
  return self->_dataProtectionClass;
}

- (BOOL)retryIfLocked
{
  return self->_retryIfLocked;
}

@end