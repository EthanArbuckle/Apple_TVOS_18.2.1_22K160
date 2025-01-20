@interface NSXPCListenerEndpoint
+ (BOOL)supportsSecureCoding;
- (NSXPCListenerEndpoint)init;
- (NSXPCListenerEndpoint)initWithCoder:(id)a3;
- (id)_endpoint;
- (id)_initWithConnection:(id)a3;
- (void)_setEndpoint:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSXPCListenerEndpoint

- (NSXPCListenerEndpoint)init
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSXPCListenerEndpoint;
  result = -[NSXPCListenerEndpoint init](&v3, sel_init);
  result->_lock._os_unfair_lock_opaque = 0;
  return result;
}

- (id)_initWithConnection:(id)a3
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSXPCListenerEndpoint;
  uint64_t v4 = -[NSXPCListenerEndpoint init](&v6, sel_init);
  v4->_endpoint = xpc_endpoint_create((xpc_connection_t)a3);
  v4->_lock._os_unfair_lock_opaque = 0;
  return v4;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  endpoint = self->_endpoint;
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NSXPCListenerEndpoint;
  -[NSXPCListenerEndpoint dealloc](&v4, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSXPCListenerEndpoint)initWithCoder:(id)a3
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: This class may only be decoded by an NSXPCCoder.", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v9);
  }

  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NSXPCListenerEndpoint;
  objc_super v6 = -[NSXPCListenerEndpoint init](&v10, sel_init);
  uint64_t v7 = (OS_xpc_object *)[a3 decodeXPCObjectOfType:MEMORY[0x1895F9260] forKey:@"ep"];
  v6->_endpoint = v7;
  v6->_lock._os_unfair_lock_opaque = 0;
  if (v7) {
    xpc_retain(v7);
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a3, "encodeXPCObject:forKey:", -[NSXPCListenerEndpoint _endpoint](self, "_endpoint"), @"ep");
  }

  else
  {
    objc_super v6 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: This class may only be encoded by an NSXPCCoder.", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v6);
    -[NSXPCListenerEndpoint _endpoint](v7, v8);
  }

- (id)_endpoint
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  endpoint = self->_endpoint;
  os_unfair_lock_unlock(p_lock);
  return endpoint;
}

- (void)_setEndpoint:(id)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  endpoint = self->_endpoint;
  self->_endpoint = (OS_xpc_object *)xpc_retain(a3);
  os_unfair_lock_unlock(p_lock);
}

@end