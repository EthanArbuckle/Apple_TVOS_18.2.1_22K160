@interface _NSClrDat
- (BOOL)_allowsDirectEncoding;
- (BOOL)_canReplaceWithDispatchDataForXPCCoder;
- (id)description;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _NSClrDat

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  memset_s(self->super._bytes, self->super._length, 0, self->super._length);
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____NSClrDat;
  -[NSConcreteData dealloc](&v3, sel_dealloc);
}

- (BOOL)_canReplaceWithDispatchDataForXPCCoder
{
  return 0;
}

- (BOOL)_allowsDirectEncoding
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS____NSClrDat;
  -[NSData encodeWithCoder:](&v4, sel_encodeWithCoder_);
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    [a3 encodeBool:1 forKey:@"NS.zeroing"];
  }
}

- (id)description
{
  return @"{length = <redacted>, bytes = <redacted>}";
}

@end