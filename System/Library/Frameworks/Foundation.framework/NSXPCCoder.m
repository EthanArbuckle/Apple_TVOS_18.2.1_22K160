@interface NSXPCCoder
+ (id)_testEncodeAndDecodeInvocation:(id)a3 interface:(id)a4;
+ (id)_testEncodeAndDecodeObject:(id)a3 allowedClass:(Class)a4;
+ (id)_testEncodeAndDecodeObject:(id)a3 allowedClasses:(id)a4;
- (BOOL)requiresSecureCoding;
- (NSXPCCoder)init;
- (NSXPCConnection)connection;
- (id)decodeXPCObjectForKey:(id)a3;
- (id)userInfo;
- (void)dealloc;
- (void)setUserInfo:(id)userInfo;
- (xpc_object_t)decodeXPCObjectOfType:(xpc_type_t)type forKey:(NSString *)key;
@end

@implementation NSXPCCoder

- (NSXPCCoder)init
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NSXPCCoder;
  v2 = -[NSXPCCoder init](&v4, sel_init);
  if (v2 && _initializeClasses_onceToken != -1) {
    dispatch_once(&_initializeClasses_onceToken, &__block_literal_global_86);
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSXPCCoder;
  -[NSXPCCoder dealloc](&v3, sel_dealloc);
}

- (BOOL)requiresSecureCoding
{
  return 1;
}

- (id)decodeXPCObjectForKey:(id)a3
{
  return 0LL;
}

- (xpc_object_t)decodeXPCObjectOfType:(xpc_type_t)type forKey:(NSString *)key
{
  return 0LL;
}

- (NSXPCConnection)connection
{
  return 0LL;
}

+ (id)_testEncodeAndDecodeObject:(id)a3 allowedClasses:(id)a4
{
  v6 = objc_alloc_init(&OBJC_CLASS___NSXPCEncoder);
  -[NSXPCEncoder beginEncoding](v6, "beginEncoding");
  -[NSXPCEncoder encodeObject:forKey:](v6, "encodeObject:forKey:", a3, @"root");
  uint64_t v7 = -[NSXPCEncoder finishEncoding](v6, "finishEncoding");

  v8 = -[NSXPCDecoder initWithInterface:](objc_alloc(&OBJC_CLASS___NSXPCDecoder), "initWithInterface:", 0LL);
  -[NSXPCDecoder _startReadingFromXPCObject:](v8, "_startReadingFromXPCObject:", v7);
  id v9 = -[NSXPCDecoder decodeObjectOfClasses:forKey:](v8, "decodeObjectOfClasses:forKey:", a4, @"root");

  return v9;
}

+ (id)_testEncodeAndDecodeObject:(id)a3 allowedClass:(Class)a4
{
  return (id)objc_msgSend( a1,  "_testEncodeAndDecodeObject:allowedClasses:",  a3,  objc_msgSend(MEMORY[0x189604010], "setWithObject:", a4));
}

+ (id)_testEncodeAndDecodeInvocation:(id)a3 interface:(id)a4
{
  v11[1] = *MEMORY[0x1895F89C0];
  v6 = objc_alloc_init(&OBJC_CLASS___NSXPCEncoder);
  xpc_object_t v7 = xpc_dictionary_create(0LL, 0LL, 0LL);
  -[NSXPCEncoder _encodeInvocation:isReply:into:](v6, "_encodeInvocation:isReply:into:", a3, 0LL, v7);

  v8 = -[NSXPCDecoder initWithInterface:](objc_alloc(&OBJC_CLASS___NSXPCDecoder), "initWithInterface:", a4);
  v11[0] = 0LL;
  -[NSXPCDecoder _decodeMessageFromXPCObject:allowingSimpleMessageSend:outInvocation:outArguments:outArgumentsMaxCount:outMethodSignature:outSelector:]( v8,  "_decodeMessageFromXPCObject:allowingSimpleMessageSend:outInvocation:outArguments:outArgumentsMaxCount:outMethodSigna ture:outSelector:",  v7,  0LL,  v11,  0LL,  0LL,  0LL,  0LL);
  id v9 = v8;
  xpc_release(v7);
  return (id)v11[0];
}

- (id)userInfo
{
  return objc_getProperty(self, a2, 8LL, 1);
}

- (void)setUserInfo:(id)userInfo
{
}

@end