@interface _NSJSONRoundTrippingNumber
+ (BOOL)instancesRespondToSelector:(SEL)a3;
+ (BOOL)isSubclassOfClass:(Class)a3;
+ (BOOL)supportsSecureCoding;
+ (id)instanceMethodSignatureForSelector:(SEL)a3;
- (BOOL)_allowsDirectEncoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToNumber:(id)a3;
- (BOOL)isKindOfClass:(Class)a3;
- (BOOL)isNSNumber__;
- (BOOL)respondsToSelector:(SEL)a3;
- (Class)superclass;
- (_NSJSONRoundTrippingNumber)initWithCoder:(id)a3;
- (_NSJSONRoundTrippingNumber)initWithNumber:(id)a3 representation:(id)a4;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)stringValue;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)forwardInvocation:(id)a3;
@end

@implementation _NSJSONRoundTrippingNumber

- (_NSJSONRoundTrippingNumber)initWithNumber:(id)a3 representation:(id)a4
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS____NSJSONRoundTrippingNumber;
  v6 = -[_NSJSONRoundTrippingNumber init](&v8, sel_init);
  if (v6)
  {
    v6->_number = (NSNumber *)a3;
    v6->_representation = (NSString *)[a4 copy];
  }

  return v6;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____NSJSONRoundTrippingNumber;
  -[_NSJSONRoundTrippingNumber dealloc](&v3, sel_dealloc);
}

- (id)stringValue
{
  return (id)-[NSString copy](self->_representation, "copy");
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    if (self == a3)
    {
      LOBYTE(v5) = 1;
    }

    else
    {
      int v5 = [a3 isNSNumber];
      if (v5) {
        LOBYTE(v5) = -[_NSJSONRoundTrippingNumber isEqualToNumber:](self, "isEqualToNumber:", a3);
      }
    }
  }

  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)isEqualToNumber:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  if (a3 && object_getClass(a3) == (Class)&OBJC_CLASS____NSJSONRoundTrippingNumber) {
    return -[NSString isEqualToString:](self->_representation, "isEqualToString:", *((void *)a3 + 2));
  }
  return 0;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_representation, "hash");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)_allowsDirectEncoding
{
  return 0;
}

- (_NSJSONRoundTrippingNumber)initWithCoder:(id)a3
{
  v15[1] = *MEMORY[0x1895F89C0];
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"_NSJSONRoundTrippingNumber can only be decoded by NSXPCCoder." userInfo:0]);
  }

  uint64_t v5 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NS.number"];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NS.representation"];
    if (v7) {
      return -[_NSJSONRoundTrippingNumber initWithNumber:representation:]( self,  "initWithNumber:representation:",  v6,  v7);
    }

    v12 = @"NSDebugDescription";
    v13 = @"Unable to decode underlying string representation for round-tripping number.";
    uint64_t v9 = (void *)MEMORY[0x189603F68];
    v10 = &v13;
    v11 = &v12;
  }

  else
  {

    v14 = @"NSDebugDescription";
    v15[0] = @"Unable to decode underlying NSNumber instance for round-tripping number.";
    uint64_t v9 = (void *)MEMORY[0x189603F68];
    v10 = (const __CFString **)v15;
    v11 = &v14;
  }

  objc_msgSend( a3,  "failWithError:",  +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  @"NSCocoaErrorDomain",  4864,  objc_msgSend(v9, "dictionaryWithObjects:forKeys:count:", v10, v11, 1)));
  return 0LL;
}

- (void)encodeWithCoder:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    [a3 encodeObject:self->_number forKey:@"NS.number"];
    [a3 encodeObject:self->_representation forKey:@"NS.representation"];
  }

  else
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"_NSJSONRoundTrippingNumber can only be encoded by NSXPCCoder." userInfo:0]);
    -[_NSJSONRoundTrippingNumber superclass](v5, v6);
  }

- (Class)superclass
{
  return (Class)objc_opt_class();
}

+ (BOOL)isSubclassOfClass:(Class)a3
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  if (&OBJC_CLASS___NSNumber == (__objc2_class *)a3) {
    return 1;
  }
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS____NSJSONRoundTrippingNumber;
  return objc_msgSendSuper2(&v4, sel_isSubclassOfClass_);
}

- (BOOL)isKindOfClass:(Class)a3
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  if (&OBJC_CLASS___NSNumber == (__objc2_class *)a3) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS____NSJSONRoundTrippingNumber;
  return -[_NSJSONRoundTrippingNumber isKindOfClass:](&v4, sel_isKindOfClass_);
}

- (BOOL)isNSNumber__
{
  return 1;
}

+ (BOOL)instancesRespondToSelector:(SEL)a3
{
  return sel_initWithNumber_representation_ == a3
      || sel_dealloc == a3
      || sel_stringValue == a3
      || sel_initWithCoder_ == a3
      || sel_encodeWithCoder_ == a3
      || sel__allowsDirectEncoding == a3
      || sel_isEqual_ == a3
      || sel_isEqualToNumber_ == a3
      || sel_hash == a3;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  return [(id)objc_opt_class() instancesRespondToSelector:a3];
}

+ (id)instanceMethodSignatureForSelector:(SEL)a3
{
  return (id)+[NSNumber instanceMethodSignatureForSelector:]( &OBJC_CLASS___NSNumber,  "instanceMethodSignatureForSelector:",  a3);
}

- (id)methodSignatureForSelector:(SEL)a3
{
  return (id)-[NSNumber methodSignatureForSelector:](self->_number, "methodSignatureForSelector:", a3);
}

- (void)forwardInvocation:(id)a3
{
}

@end