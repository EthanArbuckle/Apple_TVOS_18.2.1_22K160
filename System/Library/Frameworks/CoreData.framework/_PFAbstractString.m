@interface _PFAbstractString
+ (BOOL)accessInstanceVariablesDirectly;
+ (Class)classForKeyedUnarchiver;
+ (id)alloc;
+ (id)allocWithZone:(_NSZone *)a3;
- (Class)classForCoder;
- (const)_fastCharacterContents;
- (const)cStringUsingEncoding:(unint64_t)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)fastestEncoding;
- (unint64_t)smallestEncoding;
@end

@implementation _PFAbstractString

+ (BOOL)accessInstanceVariablesDirectly
{
  return 0;
}

+ (id)alloc
{
  return _PFAllocateObject((Class)a1, 0LL);
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return _PFAllocateObject((Class)a1, 0LL);
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

+ (Class)classForKeyedUnarchiver
{
  return (Class)objc_opt_class();
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend( objc_alloc(MEMORY[0x189607940]),  "initWithUTF8String:",  -[_PFAbstractString UTF8String](self, "UTF8String"));
}

- (const)_fastCharacterContents
{
  return 0LL;
}

- (const)cStringUsingEncoding:(unint64_t)a3
{
  if (a3 <= 5 && ((1LL << a3) & 0x32) != 0) {
    return (const char *)-[_PFAbstractString UTF8String](self, "UTF8String");
  }
  uint64_t v7 = v3;
  uint64_t v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS____PFAbstractString;
  return -[_PFAbstractString cStringUsingEncoding:](&v6, sel_cStringUsingEncoding_);
}

- (unint64_t)fastestEncoding
{
  return 4LL;
}

- (unint64_t)smallestEncoding
{
  return 4LL;
}

- (id)description
{
  return (id)-[_PFAbstractString copy](self, "copy");
}

@end