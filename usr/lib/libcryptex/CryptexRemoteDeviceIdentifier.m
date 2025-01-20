@interface CryptexRemoteDeviceIdentifier
- (CryptexRemoteDeviceIdentifier)initWithChipInstance:(const _img4_chip_instance *)a3;
- (_img4_chip_instance)inst;
- (void)dealloc;
@end

@implementation CryptexRemoteDeviceIdentifier

- (CryptexRemoteDeviceIdentifier)initWithChipInstance:(const _img4_chip_instance *)a3
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___CryptexRemoteDeviceIdentifier;
  v4 = -[CryptexRemoteDeviceIdentifier init](&v7, sel_init);
  v5 = (_img4_chip_instance *)calloc(1uLL, 0x90uLL);
  if (!v5) {
    -[CryptexRemoteDeviceIdentifier initWithChipInstance:].cold.1(&v8, v9);
  }
  v4->_inst = v5;
  memmove(v5, a3, 0x90uLL);
  return v4;
}

- (void)dealloc
{
  inst = self->_inst;
  if (inst)
  {
    free(inst);
    self->_inst = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CryptexRemoteDeviceIdentifier;
  -[CryptexRemoteDeviceIdentifier dealloc](&v4, sel_dealloc);
}

- (_img4_chip_instance)inst
{
  return self->_inst;
}

- (void)initWithChipInstance:(void *)a1 .cold.1(void *a1, _OWORD *a2)
{
  v2 = __error();
  OUTLINED_FUNCTION_4(v2);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  __break(1u);
}

@end