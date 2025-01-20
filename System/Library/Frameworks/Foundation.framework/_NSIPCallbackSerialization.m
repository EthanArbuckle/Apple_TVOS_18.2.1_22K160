@interface _NSIPCallbackSerialization
- (_NSIPCallbackSerialization)init;
- (void)dealloc;
@end

@implementation _NSIPCallbackSerialization

- (_NSIPCallbackSerialization)init
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS____NSIPCallbackSerialization;
  v2 = -[_NSIPCallbackSerialization init](&v4, sel_init);
  if (v2) {
    v2->_UUID = objc_alloc_init(&OBJC_CLASS___NSUUID);
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____NSIPCallbackSerialization;
  -[_NSIPCallbackSerialization dealloc](&v3, sel_dealloc);
}

@end