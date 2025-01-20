@interface RBSXPCCoder
+ (BOOL)supportsRBSXPCSecureCoding;
+ (id)coder;
+ (id)coderWithMessage:(id)a3;
+ (id)rbs_testEncode:(id)a3 andDecodeOfExpectedClass:(Class)a4;
+ (id)rbs_testNSEncode:(id)a3 andDecodeOfExpectedClass:(Class)a4;
- (BOOL)containsValueForKey:(id)a3;
- (BOOL)decodeBoolForKey:(id)a3;
- (OS_xpc_object)XPCConnection;
- (OS_xpc_object)message;
- (RBSXPCCoder)init;
- (RBSXPCCoder)initWithMessage:(id)a3;
- (RBSXPCCoder)initWithRBSXPCCoder:(id)a3;
- (double)decodeDoubleForKey:(id)a3;
- (id)_finishCoding;
- (id)_implicitDecodeXPCObjectForKey:(id)a3;
- (id)decodeCollectionOfClass:(Class)a3 containingClass:(Class)a4 forKey:(id)a5;
- (id)decodeDictionaryOfClass:(Class)a3 forKey:(id)a4;
- (id)decodeObjectOfClass:(Class)a3 forKey:(id)a4;
- (id)decodeStringForKey:(id)a3;
- (id)decodeXPCObjectOfType:(_xpc_type_s *)a3 forKey:(id)a4;
- (int64_t)decodeInt64ForKey:(id)a3;
- (unint64_t)decodeUInt64ForKey:(id)a3;
- (void)_removeValueForKey:(id)a3;
- (void)dealloc;
- (void)encodeBool:(BOOL)a3 forKey:(id)a4;
- (void)encodeCollection:(id)a3 forKey:(id)a4;
- (void)encodeDictionary:(id)a3 forKey:(id)a4;
- (void)encodeDouble:(double)a3 forKey:(id)a4;
- (void)encodeInt64:(int64_t)a3 forKey:(id)a4;
- (void)encodeObject:(id)a3 forKey:(id)a4;
- (void)encodeUInt64:(unint64_t)a3 forKey:(id)a4;
@end

@implementation RBSXPCCoder

+ (id)coder
{
  return (id)[objc_alloc((Class)a1) initWithMessage:0];
}

+ (id)coderWithMessage:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithMessage:v4];

  return v5;
}

- (RBSXPCCoder)init
{
  return -[RBSXPCCoder initWithMessage:](self, "initWithMessage:", 0LL);
}

- (RBSXPCCoder)initWithMessage:(id)a3
{
  id v6 = a3;
  v7 = v6;
  if (v6 && MEMORY[0x186E30AB4](v6) != MEMORY[0x1895F9250])
  {
    [MEMORY[0x1896077D8] currentHandler];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 handleFailureInMethod:a2, self, @"RBSXPCCoder.m", 98, @"Invalid parameter not satisfying: %@", @"!message || (xpc_get_type(message) == XPC_TYPE_DICTIONARY)" object file lineNumber description];
  }

  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___RBSXPCCoder;
  v8 = -[RBSXPCCoder init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_finalized = 0;
    if (v7)
    {
      objc_storeStrong((id *)&v8->_message, a3);
      uint64_t v10 = xpc_dictionary_get_remote_connection(v7);
      xpcConnection = v9->_xpcConnection;
      v9->_xpcConnection = (OS_xpc_object *)v10;
    }

    else
    {
      v12 = (OS_xpc_object *)xpc_dictionary_create(0LL, 0LL, 0LL);
      xpcConnection = v9->_message;
      v9->_message = v12;
    }
  }

  return v9;
}

- (void)dealloc
{
  if (self->_codingContext)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 handleFailureInMethod:a2 object:self file:@"RBSXPCCoder.m" lineNumber:114 description:@"cannot dealloc while the coding context is in flight"];
  }

  archiver = self->_archiver;
  if (archiver)
  {
    -[NSKeyedArchiver finishEncoding](archiver, "finishEncoding");
    id v4 = self->_archiver;
    self->_archiver = 0LL;
  }

  unarchiver = self->_unarchiver;
  if (unarchiver)
  {
    -[NSKeyedUnarchiver finishDecoding](unarchiver, "finishDecoding");
    id v6 = self->_unarchiver;
    self->_unarchiver = 0LL;
  }

  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___RBSXPCCoder;
  -[RBSXPCCoder dealloc](&v9, sel_dealloc);
}

- (void)encodeObject:(id)a3 forKey:(id)a4
{
  id v10 = a3;
  id v7 = a4;
  if (RBSAtomicGetFlag((unsigned int *)&self->_finalized))
  {
    [MEMORY[0x1896077D8] currentHandler];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 handleFailureInMethod:a2 object:self file:@"RBSXPCCoder.m" lineNumber:139 description:@"cannot continue encoding after finalizing"];

    if (v7) {
      goto LABEL_3;
    }
  }

  else if (v7)
  {
    goto LABEL_3;
  }

  [MEMORY[0x1896077D8] currentHandler];
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 handleFailureInMethod:a2, self, @"RBSXPCCoder.m", 140, @"Invalid parameter not satisfying: %@", @"key != nil" object file lineNumber description];

LABEL_3:
  if (v10) {
    _RBSXPCEncodeObjectForKey(self, v10, v7);
  }
}

- (void)encodeCollection:(id)a3 forKey:(id)a4
{
  id v9 = a3;
  id v7 = a4;
  if (v9 && (_NSIsNSArray() & 1) == 0 && (_NSIsNSSet() & 1) == 0 && (_NSIsNSOrderedSet() & 1) == 0)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 handleFailureInMethod:a2, self, @"RBSXPCCoder.m", 148, @"Collection class %@ not supported", objc_msgSend(v9, "classForCoder") object file lineNumber description];
  }

  -[RBSXPCCoder encodeObject:forKey:](self, "encodeObject:forKey:", v9, v7);
}

- (void)encodeDictionary:(id)a3 forKey:(id)a4
{
  id v12 = a3;
  id v7 = a4;
  id v8 = v12;
  id v9 = v7;
  if (v12)
  {
    char v10 = _NSIsNSDictionary();
    id v8 = v12;
    if ((v10 & 1) == 0)
    {
      [MEMORY[0x1896077D8] currentHandler];
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 handleFailureInMethod:a2 object:self file:@"RBSXPCCoder.m" lineNumber:153 description:@"Object is not an NSDictionary"];

      id v8 = v12;
    }
  }

  -[RBSXPCCoder encodeObject:forKey:](self, "encodeObject:forKey:", v8, v9);
}

- (void)encodeDouble:(double)a3 forKey:(id)a4
{
  codingContext = self->_codingContext;
  if (!codingContext) {
    codingContext = self->_message;
  }
  id v9 = codingContext;
  id v7 = a4;
  id v8 = (const char *)[v7 UTF8String];

  RBSSerializeDoubleToXPCDictionaryWithKey(v9, v8, a3);
}

- (void)encodeBool:(BOOL)a3 forKey:(id)a4
{
  uint64_t v6 = [a4 UTF8String];
  if (v6)
  {
    id v7 = (const char *)v6;
    codingContext = self->_codingContext;
    if (!codingContext) {
      codingContext = self->_message;
    }
    id v9 = codingContext;
    xpc_dictionary_set_BOOL(v9, v7, a3);
  }

- (void)encodeInt64:(int64_t)a3 forKey:(id)a4
{
  uint64_t v6 = [a4 UTF8String];
  if (v6)
  {
    id v7 = (const char *)v6;
    codingContext = self->_codingContext;
    if (!codingContext) {
      codingContext = self->_message;
    }
    id v9 = codingContext;
    xpc_dictionary_set_int64(v9, v7, a3);
  }

- (void)encodeUInt64:(unint64_t)a3 forKey:(id)a4
{
  uint64_t v6 = [a4 UTF8String];
  if (v6)
  {
    id v7 = (const char *)v6;
    codingContext = self->_codingContext;
    if (!codingContext) {
      codingContext = self->_message;
    }
    id v9 = codingContext;
    xpc_dictionary_set_uint64(v9, v7, a3);
  }

- (BOOL)containsValueForKey:(id)a3
{
  codingContext = self->_codingContext;
  if (!codingContext) {
    codingContext = self->_message;
  }
  v5 = codingContext;
  id v6 = a3;
  id v7 = (const char *)[v6 UTF8String];

  RBSXPCDictionaryGetValue(v5, v7, 0LL);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8 != 0LL;
}

- (id)decodeObjectOfClass:(Class)a3 forKey:(id)a4
{
  return _BSXPCDecodeObjectForKey(self, a4, a3, 0LL);
}

- (id)decodeCollectionOfClass:(Class)a3 containingClass:(Class)a4 forKey:(id)a5
{
  return _BSXPCDecodeObjectForKey(self, a5, a3, (uint8_t *)a4);
}

- (id)decodeDictionaryOfClass:(Class)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = (objc_class *)objc_opt_class();
  _BSXPCDecodeObjectForKey(self, v6, v7, (uint8_t *)a3);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)decodeXPCObjectOfType:(_xpc_type_s *)a3 forKey:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    id class4NSXPC = (id)xpc_get_class4NSXPC();
  }

  else
  {
    NSClassFromString(@"OS_xpc_object");
    id class4NSXPC = (id)objc_claimAutoreleasedReturnValue();
  }

  -[RBSXPCCoder decodeObjectOfClass:forKey:](self, "decodeObjectOfClass:forKey:", class4NSXPC, v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)decodeStringForKey:(id)a3
{
  codingContext = self->_codingContext;
  if (!codingContext) {
    codingContext = self->_message;
  }
  v5 = codingContext;
  id v6 = a3;
  id v7 = (const char *)[v6 UTF8String];

  RBSXPCDictionaryGetValue(v5, v7, MEMORY[0x1895F92E8]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8) {
    id v9 = (void *)[objc_alloc(NSString) initWithUTF8String:xpc_string_get_string_ptr(v8)];
  }
  else {
    id v9 = 0LL;
  }

  return v9;
}

- (double)decodeDoubleForKey:(id)a3
{
  codingContext = self->_codingContext;
  if (!codingContext) {
    codingContext = self->_message;
  }
  v5 = codingContext;
  id v6 = a3;
  id v7 = (const char *)[v6 UTF8String];

  double v8 = RBSDeserializeDoubleFromXPCDictionaryWithKey(v5, v7);
  return v8;
}

- (BOOL)decodeBoolForKey:(id)a3
{
  uint64_t v4 = [a3 UTF8String];
  if (v4)
  {
    v5 = (const char *)v4;
    codingContext = self->_codingContext;
    if (!codingContext) {
      codingContext = self->_message;
    }
    id v7 = codingContext;
    BOOL v8 = xpc_dictionary_get_BOOL(v7, v5);

    LOBYTE(v4) = v8;
  }

  return v4;
}

- (int64_t)decodeInt64ForKey:(id)a3
{
  int64_t result = [a3 UTF8String];
  if (result)
  {
    v5 = (const char *)result;
    codingContext = self->_codingContext;
    if (!codingContext) {
      codingContext = self->_message;
    }
    id v7 = codingContext;
    int64_t int64 = xpc_dictionary_get_int64(v7, v5);

    return int64;
  }

  return result;
}

- (unint64_t)decodeUInt64ForKey:(id)a3
{
  unint64_t result = [a3 UTF8String];
  if (result)
  {
    v5 = (const char *)result;
    codingContext = self->_codingContext;
    if (!codingContext) {
      codingContext = self->_message;
    }
    id v7 = codingContext;
    uint64_t int64 = xpc_dictionary_get_uint64(v7, v5);

    return uint64;
  }

  return result;
}

- (void)_removeValueForKey:(id)a3
{
  if (a3)
  {
    codingContext = self->_codingContext;
    if (!codingContext) {
      codingContext = self->_message;
    }
    v5 = codingContext;
    id v6 = a3;
    id v7 = (const char *)[v6 UTF8String];

    BOOL v8 = v5;
    xdict = v8;
    if (v7)
    {
      if (v8)
      {
        xpc_dictionary_get_value(v8, v7);
        id v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9) {
          xpc_dictionary_set_value(xdict, v7, 0LL);
        }
      }
    }

    else
    {
      [MEMORY[0x1896077D8] currentHandler];
      char v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend( NSString,  "stringWithUTF8String:",  "void RBSXPCDictionarySetValue(xpc_object_t  _Nullable __strong, const char * _Nonnull, xpc_object_t  _Nullable _ _strong, xpc_type_t _Nullable)");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 handleFailureInFunction:v11 file:@"RBSXPCUtilities_Project.h" lineNumber:123 description:@"key must not be nil"];
    }
  }

- (id)_implicitDecodeXPCObjectForKey:(id)a3
{
  codingContext = self->_codingContext;
  if (!codingContext) {
    codingContext = self->_message;
  }
  v5 = codingContext;
  id v6 = a3;
  id v7 = (const char *)[v6 UTF8String];

  RBSXPCDictionaryGetValue(v5, v7, 0LL);
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8
    && (NSClassFromString(@"OS_xpc_object"),
        id v9 = (id)objc_claimAutoreleasedReturnValue(),
        (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v10 = v8;
  }

  else
  {
    id v10 = 0LL;
  }

  return v10;
}

- (id)_finishCoding
{
  if (RBSAtomicSetFlag(1u, (unsigned int *)&self->_finalized))
  {
    archiver = self->_archiver;
    if (archiver)
    {
      -[NSKeyedArchiver encodedData](archiver, "encodedData");
      uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v4 length])
      {
        message = self->_message;
        id v6 = v4;
        xpc_dictionary_set_data( message,  "bsx_archive",  (const void *)[v6 bytes],  objc_msgSend(v6, "length"));
      }

      id v7 = self->_archiver;
      self->_archiver = 0LL;
    }
  }

  return self->_message;
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (RBSXPCCoder)initWithRBSXPCCoder:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[RBSXPCCoder initWithMessage:](self, "initWithMessage:", v4);

  return v5;
}

- (OS_xpc_object)message
{
  return self->_message;
}

- (OS_xpc_object)XPCConnection
{
  return self->_xpcConnection;
}

- (void).cxx_destruct
{
}

+ (id)rbs_testEncode:(id)a3 andDecodeOfExpectedClass:(Class)a4
{
  id v5 = a3;
  +[RBSXPCCoder coder](&OBJC_CLASS___RBSXPCCoder, "coder");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 encodeObject:v5 forKey:@"RBSUnitTesting"];

  [v6 createMessage];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[RBSXPCCoder coderWithMessage:](&OBJC_CLASS___RBSXPCCoder, "coderWithMessage:", v7);
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue();

  [v8 decodeObjectOfClass:a4 forKey:@"RBSUnitTesting"];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)rbs_testNSEncode:(id)a3 andDecodeOfExpectedClass:(Class)a4
{
  return (id)[MEMORY[0x189607B28] _testEncodeAndDecodeObject:a3 allowedClass:a4];
}

@end