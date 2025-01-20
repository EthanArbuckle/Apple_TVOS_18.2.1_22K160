@interface LACKeyBagStateProviderMKBAdapter
- (LACKeyBagStateProviderMKBAdapter)initWithUserId:(unsigned int)a3;
- (int64_t)state;
@end

@implementation LACKeyBagStateProviderMKBAdapter

- (LACKeyBagStateProviderMKBAdapter)initWithUserId:(unsigned int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___LACKeyBagStateProviderMKBAdapter;
  result = -[LACKeyBagStateProviderMKBAdapter init](&v5, sel_init);
  if (result) {
    result->_userId = a3;
  }
  return result;
}

- (int64_t)state
{
  v6[1] = *MEMORY[0x1895F89C0];
  objc_super v5 = @"DeviceHandle";
  [MEMORY[0x189607968] numberWithUnsignedInt:self->_userId];
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  [MEMORY[0x189603F68] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  int v3 = MKBGetDeviceLockState();

  else {
    return qword_1892B3D58[v3 + 8];
  }
}

@end