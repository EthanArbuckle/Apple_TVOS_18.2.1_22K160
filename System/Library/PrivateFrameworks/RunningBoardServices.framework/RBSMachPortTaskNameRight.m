@interface RBSMachPortTaskNameRight
+ (BOOL)supportsRBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (id)portForSelf;
+ (id)taskNameForPID:(int)a3;
- (BOOL)isUsable;
- (RBSAuditToken)auditToken;
- (RBSMachPortTaskNameRight)init;
- (RBSMachPortTaskNameRight)initWithCoder:(id)a3;
- (RBSMachPortTaskNameRight)initWithRBSXPCCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initWithPID:(void *)a1;
- (int)pid;
- (uint64_t)_initWithPID:(void *)a3 port:(void *)a4 auditToken:;
- (unsigned)port;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithRBSXPCCoder:(id)a3;
- (void)invalidate;
@end

@implementation RBSMachPortTaskNameRight

- (RBSMachPortTaskNameRight)init
{
  pid_t v3 = getpid();
  return (RBSMachPortTaskNameRight *)-[RBSMachPortTaskNameRight initWithPID:](self, v3);
}

- (id)initWithPID:(void *)a1
{
  kern_return_t v6;
  mach_error_t v7;
  os_log_s *v8;
  __int128 v10;
  kern_return_t v11;
  mach_error_t v12;
  os_log_s *v13;
  void *v14;
  void *v15;
  _OWORD v16[2];
  mach_msg_type_number_t task_info_outCnt;
  integer_t task_info_out[4];
  __int128 v19;
  mach_port_name_t tn;
  id v3 = 0LL;
  if (!a1 || a2 < 1) {
    goto LABEL_11;
  }
  if (!_RBSSandboxCanGetMachTaskName(a2)) {
    goto LABEL_10;
  }
  tn = 0;
  v5 = (mach_port_name_t *)MEMORY[0x1895FBBE0];
  if (task_name_for_pid(*MEMORY[0x1895FBBE0], a2, &tn))
  {
    if (RBSPIDExists(a2))
    {
      v6 = task_name_for_pid(*v5, a2, &tn);
      if (v6)
      {
        v7 = v6;
        rbs_general_log();
        v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          -[RBSMachPortTaskNameRight initWithPID:].cold.2(v7);
        }

        goto LABEL_10;
      }

      goto LABEL_12;
    }

- (unsigned)port
{
  return -[RBSMachPort port](self->_port, "port");
}

- (BOOL)isUsable
{
  return -[RBSMachPort isUsable](self->_port, "isUsable");
}

+ (id)taskNameForPID:(int)a3
{
  if (a3 < 1)
  {
    id v5 = 0LL;
  }

  else if (_RBSSandboxCanGetMachTaskName(a3))
  {
    id v5 = -[RBSMachPortTaskNameRight initWithPID:](objc_alloc((Class)a1), a3);
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

+ (id)portForSelf
{
  return +[RBSMachPortTaskNameRight taskNameForPID:]( &OBJC_CLASS___RBSMachPortTaskNameRight,  "taskNameForPID:",  getpid());
}

- (uint64_t)_initWithPID:(void *)a3 port:(void *)a4 auditToken:
{
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    objc_storeStrong((id *)(a1 + 8), a3);
    *(_DWORD *)(a1 + 16) = a2;
    objc_storeStrong((id *)(a1 + 24), a4);
    id v10 = (id)a1;
  }

  return a1;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___RBSMachPortTaskNameRight;
  -[RBSMachPortTaskNameRight dealloc](&v3, sel_dealloc);
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
  uint64_t pid = self->_pid;
  id v5 = a3;
  [v5 encodeInt64:pid forKey:@"_pid"];
  [v5 encodeObject:self->_auditToken forKey:@"_auditToken"];
  [v5 encodeObject:self->_port forKey:@"_port"];
}

- (RBSMachPortTaskNameRight)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  int v5 = [v4 decodeInt64ForKey:@"_pid"];
  [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_auditToken"];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_port"];
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[RBSMachPortTaskNameRight _initWithPID:port:auditToken:]((uint64_t)self, v5, v7, v6);
  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RBSMachPortTaskNameRight)initWithCoder:(id)a3
{
  id v4 = a3;
  self->_uint64_t pid = [v4 decodeIntForKey:@"_pid"];
  [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_auditToken"];
  int v5 = (RBSAuditToken *)objc_claimAutoreleasedReturnValue();
  auditToken = self->_auditToken;
  self->_auditToken = v5;

  [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_port"];
  v7 = (RBSMachPort *)objc_claimAutoreleasedReturnValue();

  port = self->_port;
  self->_port = v7;

  return self;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t pid = self->_pid;
  id v5 = a3;
  [v5 encodeInt:pid forKey:@"_pid"];
  [v5 encodeObject:self->_auditToken forKey:@"_auditToken"];
  [v5 encodeObject:self->_port forKey:@"_port"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = -[RBSMachPort copyWithZone:](self->_port, "copyWithZone:");
  if (v5)
  {
    v6 = +[RBSMachPortTaskNameRight allocWithZone:](&OBJC_CLASS___RBSMachPortTaskNameRight, "allocWithZone:", a3);
    -[RBSMachPortTaskNameRight _initWithPID:port:auditToken:]((uint64_t)v6, self->_pid, v5, self->_auditToken);
  }

  else
  {
    v6 = 0LL;
  }

  return v6;
}

- (RBSAuditToken)auditToken
{
  return self->_auditToken;
}

- (int)pid
{
  return self->_pid;
}

- (void).cxx_destruct
{
}

- (void)initWithPID:(mach_error_t)a1 .cold.1(mach_error_t a1)
{
}

- (void)initWithPID:(mach_error_t)a1 .cold.2(mach_error_t a1)
{
}

@end