@interface NSKeyValueAccessor
- (NSKeyValueAccessor)initWithContainerClassID:(id)a3 key:(id)a4 implementation:(void *)a5 selector:(SEL)a6 extraArguments:(void *)a7[3] count:(unint64_t)a8;
- (SEL)selector;
- (id)containerClassID;
- (id)key;
- (unint64_t)extraArgumentCount;
- (void)dealloc;
- (void)extraArgument1;
- (void)extraArgument2;
@end

@implementation NSKeyValueAccessor

- (NSKeyValueAccessor)initWithContainerClassID:(id)a3 key:(id)a4 implementation:(void *)a5 selector:(SEL)a6 extraArguments:(void *)a7[3] count:(unint64_t)a8
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___NSKeyValueAccessor;
  v14 = -[NSKeyValueAccessor init](&v20, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_containerClassID = a3;
    CFHashCode v16 = [a4 copy];
    v15->_key = (NSString *)v16;
    v15->_implementation = a5;
    v15->_selector = a6;
    if (v16) {
      CFHashCode v16 = CFHash((CFTypeRef)v16);
    }
    v15->_hash = v16 ^ (unint64_t)a3;
    v15->_extraArgumentCount = a8;
    key = *a7;
    if (*a7 == a4) {
      key = v15->_key;
    }
    v15->_extraArgument1 = key;
    v18 = (NSString *)a7[1];
    if (v18 == a4) {
      v18 = v15->_key;
    }
    v15->_extraArgument2 = v18;
    v15->_extraArgument3 = a7[2];
  }

  return v15;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSKeyValueAccessor;
  -[NSKeyValueAccessor dealloc](&v3, sel_dealloc);
}

- (id)containerClassID
{
  return self->_containerClassID;
}

- (SEL)selector
{
  return self->_selector;
}

- (id)key
{
  return self->_key;
}

- (unint64_t)extraArgumentCount
{
  return self->_extraArgumentCount;
}

- (void)extraArgument1
{
  return self->_extraArgument1;
}

- (void)extraArgument2
{
  return self->_extraArgument2;
}

@end