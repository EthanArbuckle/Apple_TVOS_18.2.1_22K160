@interface UMPersonaMachPort
+ (BOOL)supportsSecureCoding;
- (Class)classForCoder;
- (UMPersonaMachPort)initWithCoder:(id)a3;
- (id)replacementObjectForCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UMPersonaMachPort

- (id)replacementObjectForCoder:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = self;
  }

  else
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___UMPersonaMachPort;
    -[UMPersonaMachPort replacementObjectForCoder:](&v8, sel_replacementObjectForCoder_, v4);
    v5 = (UMPersonaMachPort *)objc_claimAutoreleasedReturnValue();
  }

  v6 = v5;

  return v6;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_machPort(self, v5, v6, v7)
    && objc_msgSend_machPort(self, v8, v9, v10) != -1
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend_machPort(self, v11, v12, v13);
    v15 = (void *)xpc_mach_send_create();
    if (v15) {
      objc_msgSend_encodeXPCObject_forKey_(v4, v14, (uint64_t)v15, (uint64_t)@"UMPersonaMachPort");
    }
  }

  else
  {
    v16.receiver = self;
    v16.super_class = (Class)&OBJC_CLASS___UMPersonaMachPort;
    -[UMPersonaMachPort encodeWithCoder:](&v16, sel_encodeWithCoder_, v4);
  }
}

- (UMPersonaMachPort)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend_decodeXPCObjectOfType_forKey_(v4, v5, MEMORY[0x1895F9290], (uint64_t)@"UMPersonaMachPort"),
        (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0)
    && (v7 = (void *)v6, uint64_t v8 = xpc_mach_send_copy_right(), v7, (v8 - 1) <= 0xFFFFFFFD))
  {
    v15.receiver = self;
    v15.super_class = (Class)&OBJC_CLASS___UMPersonaMachPort;
    uint64_t v9 = -[UMPersonaMachPort initWithMachPort:options:](&v15, sel_initWithMachPort_options_, v8, 0LL);
    if (!v9) {
      mach_port_deallocate(*MEMORY[0x1895FBBE0], v8);
    }
  }

  else
  {

    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v10, *MEMORY[0x189607670], 4864, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_failWithError_(v4, v12, (uint64_t)v11, v13);

    uint64_t v9 = 0LL;
  }

  return v9;
}

@end