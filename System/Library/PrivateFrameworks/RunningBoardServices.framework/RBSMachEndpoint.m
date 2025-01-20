@interface RBSMachEndpoint
+ (BOOL)supportsRBSXPCSecureCoding;
- (BOOL)_isCachedPortValid;
- (BOOL)_isEquivalentToEndpoint:(id)a3;
- (BOOL)isNonLaunching;
- (NSString)description;
- (NSString)name;
- (OS_xpc_object)endpoint;
- (RBSMachEndpoint)init;
- (RBSMachEndpoint)initWithRBSXPCCoder:(id)a3;
- (id)_copy;
- (id)_initWithName:(id)a3 nonLaunching:(BOOL)a4 port:(id)a5;
- (void)encodeWithRBSXPCCoder:(id)a3;
@end

@implementation RBSMachEndpoint

- (RBSMachEndpoint)init
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 handleFailureInMethod:a2 object:self file:@"RBSMachEndpoint.m" lineNumber:32 description:@"cannot call -init on RBSMachEndpoint"];

  return 0LL;
}

- (id)_initWithName:(id)a3 nonLaunching:(BOOL)a4 port:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }

  else
  {
    [MEMORY[0x1896077D8] currentHandler];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 handleFailureInMethod:a2, self, @"RBSMachEndpoint.m", 39, @"Invalid parameter not satisfying: %@", @"name != nil" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }

  [MEMORY[0x1896077D8] currentHandler];
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v18 handleFailureInMethod:a2, self, @"RBSMachEndpoint.m", 40, @"Invalid parameter not satisfying: %@", @"port != nil" object file lineNumber description];

LABEL_3:
  if (MEMORY[0x186E30AB4](v11) != MEMORY[0x1895F9290])
  {
    [MEMORY[0x1896077D8] currentHandler];
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v19 handleFailureInMethod:a2, self, @"RBSMachEndpoint.m", 42, @"unexpected port type %@", v11 object file lineNumber description];
  }

  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___RBSMachEndpoint;
  v12 = -[RBSMachEndpoint init](&v20, sel_init);
  if (v12)
  {
    uint64_t v13 = [v9 copy];
    name = v12->_name;
    v12->_name = (NSString *)v13;

    v12->_nonLaunching = a4;
    objc_storeStrong((id *)&v12->_port, a5);
    v12->_lock._os_unfair_lock_opaque = 0;
    getterCache_endpoint = v12->_getterCache_endpoint;
    v12->_getterCache_endpoint = 0LL;

    v12->_lock_hasCheckedEndpoint = 0;
  }

  return v12;
}

- (OS_xpc_object)endpoint
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_lock_hasCheckedEndpoint)
  {
    self->_lock_hasCheckedEndpoint = 1;
    if (-[RBSMachEndpoint _isCachedPortValid](self, "_isCachedPortValid"))
    {
      if (xpc_mach_send_copy_right() - 1 <= 0xFFFFFFFD)
      {
        bs_from_port = (OS_xpc_object *)xpc_endpoint_create_bs_from_port();
        getterCache_endpoint = self->_getterCache_endpoint;
        self->_getterCache_endpoint = bs_from_port;
      }
    }
  }

  os_unfair_lock_unlock(p_lock);
  return self->_getterCache_endpoint;
}

- (id)_copy
{
  v3 = (void *)xpc_mach_send_create_with_disposition();
  id v4 = -[RBSMachEndpoint _initWithName:nonLaunching:port:]( objc_alloc(&OBJC_CLASS___RBSMachEndpoint),  "_initWithName:nonLaunching:port:",  self->_name,  self->_nonLaunching,  v3);

  return v4;
}

- (BOOL)_isCachedPortValid
{
  int right = xpc_mach_send_get_right();
  if (right) {
    LOBYTE(right) = xpc_mach_send_get_right() != -1;
  }
  return right;
}

- (BOOL)_isEquivalentToEndpoint:(id)a3
{
  id v4 = (RBSMachEndpoint *)a3;
  v5 = v4;
  if (self == v4)
  {
    BOOL v10 = 1;
    goto LABEL_15;
  }

  if (!v4) {
    goto LABEL_13;
  }
  uint64_t v6 = objc_opt_class();
  if (v6 != objc_opt_class()) {
    goto LABEL_13;
  }
  uint64_t v7 = objc_opt_class();
  if (v7 != objc_opt_class()
    || !-[RBSMachEndpoint _isCachedPortValid](self, "_isCachedPortValid")
    || !-[RBSMachEndpoint _isCachedPortValid](v5, "_isCachedPortValid"))
  {
    goto LABEL_13;
  }

  name = self->_name;
  id v9 = v5->_name;
  if (name == v9)
  {
LABEL_11:
    if (!self->_nonLaunching != v5->_nonLaunching)
    {
      BOOL v10 = xpc_equal(self->_port, v5->_port);
      goto LABEL_15;
    }

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_name forKey:@"name"];
  if (self->_nonLaunching) {
    [v4 encodeBool:1 forKey:@"nonLaunching"];
  }
  [v4 encodeXPCObject:self->_port forKey:@"port"];
}

- (RBSMachEndpoint)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v4 decodeBoolForKey:@"nonLaunching"];
  [v4 decodeXPCObjectOfType:MEMORY[0x1895F9290] forKey:@"port"];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[RBSMachEndpoint _initWithName:nonLaunching:port:](self, "_initWithName:nonLaunching:port:", v5, v6, v7);
  return v8;
}

- (NSString)description
{
  id v3 = objc_alloc(NSString);
  [(id)objc_opt_class() description];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  name = self->_name;
  if (self->_nonLaunching) {
    uint64_t v6 = @"YES";
  }
  else {
    uint64_t v6 = @"NO";
  }
  BOOL v7 = -[RBSMachEndpoint _isCachedPortValid](self, "_isCachedPortValid");
  v8 = @"Invalid";
  if (v7) {
    v8 = @"YES";
  }
  id v9 = (void *)[v3 initWithFormat:@"<%@| name:%@ nonLaunching:%@ port:%@>", v4, name, v6, v8];

  return (NSString *)v9;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)isNonLaunching
{
  return self->_nonLaunching;
}

- (void).cxx_destruct
{
}

@end