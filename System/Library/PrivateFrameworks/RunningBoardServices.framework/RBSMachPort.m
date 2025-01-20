@interface RBSMachPort
+ (BOOL)supportsRBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (id)portConsumingRightForPort:(unsigned int)a3;
+ (id)portForPort:(unsigned int)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isUsable;
- (RBSMachPort)initWithCoder:(id)a3;
- (RBSMachPort)initWithRBSXPCCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unsigned)port;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithRBSXPCCoder:(id)a3;
- (void)invalidate;
@end

@implementation RBSMachPort

+ (id)portForPort:(unsigned int)a3
{
  if (mach_port_insert_right(*MEMORY[0x1895FBBE0], a3, a3, 0x13u))
  {
    rbs_general_log();
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      +[RBSMachPort portForPort:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    }

    return 0LL;
  }

  else
  {
    v13 = objc_alloc(&OBJC_CLASS___RBSMachPort);
    if (v13)
    {
      v14.receiver = v13;
      v14.super_class = (Class)&OBJC_CLASS___RBSMachPort;
      v13 = objc_msgSendSuper2(&v14, sel_init);
      if (v13)
      {
        v13->_port = a3;
        v13->_lock._os_unfair_lock_opaque = 0;
      }
    }

    return v13;
  }

+ (id)portConsumingRightForPort:(unsigned int)a3
{
  v4 = objc_alloc(&OBJC_CLASS___RBSMachPort);
  if (v4)
  {
    v6.receiver = v4;
    v6.super_class = (Class)&OBJC_CLASS___RBSMachPort;
    v4 = objc_msgSendSuper2(&v6, sel_init);
    if (v4)
    {
      v4->_port = a3;
      v4->_lock._os_unfair_lock_opaque = 0;
    }
  }

  return v4;
}

- (unsigned)port
{
  if (self->_port + 1 >= 2) {
    return self->_port;
  }
  else {
    return 0;
  }
}

- (BOOL)isUsable
{
  mach_port_name_t port = self->_port;
  if (port - 1 > 0xFFFFFFFD) {
    LOBYTE(v3) = 0;
  }
  else {
    return (RBSMachPortType(port) >> 16) & 1;
  }
  return v3;
}

- (void)invalidate
{
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  id v6 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v5 = (void *)xpc_mach_send_create();
  if (v5) {
    [v6 encodeXPCObject:v5 forKey:@"_port"];
  }
  os_unfair_lock_unlock(p_lock);
}

- (RBSMachPort)initWithRBSXPCCoder:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    unsigned int v5 = xpc_mach_send_copy_right();
    if (!self) {
      goto LABEL_7;
    }
  }

  else
  {
    unsigned int v5 = 0;
    if (!self) {
      goto LABEL_7;
    }
  }

  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___RBSMachPort;
  id v6 = -[RBSMachPort init](&v8, sel_init);
  self = v6;
  if (v6)
  {
    v6->_mach_port_name_t port = v5;
    v6->_lock._os_unfair_lock_opaque = 0;
  }

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RBSMachPort)initWithCoder:(id)a3
{
  uint64_t v4 = MEMORY[0x1895F9290];
  uint64_t v5 = [a3 decodeXPCObjectOfType:MEMORY[0x1895F9290] forKey:@"_port"];
  id v6 = (void *)v5;
  if (v5 && MEMORY[0x186E30AB4](v5) == v4)
  {
    unsigned int v8 = xpc_mach_send_copy_right();
    if (self)
    {
      unsigned int v9 = v8;
      v12.receiver = self;
      v12.super_class = (Class)&OBJC_CLASS___RBSMachPort;
      uint64_t v10 = -[RBSMachPort init](&v12, sel_init);
      if (v10)
      {
        v10->_mach_port_name_t port = v9;
        v10->_lock._os_unfair_lock_opaque = 0;
      }
    }

    else
    {
      uint64_t v10 = 0LL;
    }

    self = v10;
    uint64_t v7 = self;
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  mach_port_name_t port = self->_port;
  if (port - 1 <= 0xFFFFFFFD && (RBSMachPortType(port) & 0x10000) != 0)
  {
    id v6 = (void *)xpc_mach_send_create();
    if (v6) {
      [v7 encodeXPCObject:v6 forKey:@"_port"];
    }
  }

  os_unfair_lock_unlock(p_lock);
}

- (id)copyWithZone:(_NSZone *)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  +[RBSMachPort portForPort:](&OBJC_CLASS___RBSMachPort, "portForPort:", self->_port);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (RBSMachPort *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      unsigned int v5 = -[RBSMachPort port](self, "port");
      BOOL v6 = v5 == -[RBSMachPort port](v4, "port");
    }

    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  return -[RBSMachPort port](self, "port");
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___RBSMachPort;
  -[RBSMachPort dealloc](&v3, sel_dealloc);
}

+ (void)portForPort:(uint64_t)a3 .cold.1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

@end