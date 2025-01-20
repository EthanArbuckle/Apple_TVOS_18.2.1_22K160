@interface PKXPCObject
+ (BOOL)supportsSecureCoding;
+ (id)object:(id)a3;
- (OS_xpc_object)object;
- (PKXPCObject)initWithCoder:(id)a3;
- (PKXPCObject)initWithObject:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setObject:(id)a3;
@end

@implementation PKXPCObject

+ (id)object:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc(&OBJC_CLASS___PKXPCObject);
  v8 = (void *)objc_msgSend_initWithObject_(v4, v5, (uint64_t)v3, v6, v7);

  return v8;
}

- (PKXPCObject)initWithObject:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PKXPCObject;
  v5 = -[PKXPCObject init](&v11, sel_init);
  v9 = v5;
  if (v5) {
    objc_msgSend_setObject_(v5, v6, (uint64_t)v4, v7, v8);
  }

  return v9;
}

- (PKXPCObject)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    objc_msgSend_raise_format_( MEMORY[0x189603F70],  v5,  *MEMORY[0x189603A60],  (uint64_t)@"This object may only be decoded by an NSXPCCoder.",  v6);
  }
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___PKXPCObject;
  v10 = -[PKXPCObject init](&v21, sel_init);
  if (!v10
    || (objc_msgSend_decodeXPCObjectForKey_(v4, v7, (uint64_t)@"PlugInKit.object", v8, v9),
        objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend_setObject_(v10, v12, (uint64_t)v11, v13, v14),
        v11,
        objc_msgSend_object(v10, v15, v16, v17, v18),
        v19 = (PKXPCObject *)objc_claimAutoreleasedReturnValue(),
        v19,
        v19))
  {
    v19 = v10;
  }

  return v19;
}

- (void)encodeWithCoder:(id)a3
{
  id v11 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    objc_msgSend_raise_format_( MEMORY[0x189603F70],  v4,  *MEMORY[0x189603A60],  (uint64_t)@"This object may only be decoded by an NSXPCCoder.",  v7);
  }
  objc_msgSend_object(self, v4, v5, v6, v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeXPCObject_forKey_(v11, v9, (uint64_t)v8, (uint64_t)@"PlugInKit.object", v10);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (OS_xpc_object)object
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setObject:(id)a3
{
}

- (void).cxx_destruct
{
}

@end