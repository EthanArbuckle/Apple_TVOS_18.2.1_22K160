@interface _NSClrDatM
- (BOOL)_allowsDirectEncoding;
- (BOOL)_canReplaceWithDispatchDataForXPCCoder;
- (BOOL)_canUseRealloc;
- (id)description;
- (void)_freeBytes;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _NSClrDatM

- (void)_freeBytes
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  memset_s(self->super._bytes, self->super._capacity, 0, self->super._capacity);
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____NSClrDatM;
  -[NSConcreteMutableData _freeBytes](&v3, sel__freeBytes);
}

- (BOOL)_canReplaceWithDispatchDataForXPCCoder
{
  return 0;
}

- (BOOL)_allowsDirectEncoding
{
  return 0;
}

- (BOOL)_canUseRealloc
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS____NSClrDatM;
  -[NSData encodeWithCoder:](&v4, sel_encodeWithCoder_);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    [a3 encodeBool:1 forKey:@"NS.zeroing"];
  }
}

- (id)description
{
  return @"{length = <redacted>, bytes = <redacted>}";
}

@end