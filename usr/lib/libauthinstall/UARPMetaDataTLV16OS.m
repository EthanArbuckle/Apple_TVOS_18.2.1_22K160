@interface UARPMetaDataTLV16OS
- (UARPMetaDataTLV16OS)init;
- (id)generateTLV:(unsigned int)a3 tlvValue:(unsigned __int16)a4;
- (id)tlvValue:(unsigned __int16)a3;
@end

@implementation UARPMetaDataTLV16OS

- (UARPMetaDataTLV16OS)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___UARPMetaDataTLV16OS;
  return -[UARPMetaDataTLVOS init](&v3, sel_init);
}

- (id)generateTLV:(unsigned int)a3 tlvValue:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  id v7 = objc_alloc_init(MEMORY[0x189603FB8]);
  int v12 = uarpHtonl(a3);
  [v7 appendBytes:&v12 length:4];
  int v11 = uarpHtonl(2u);
  [v7 appendBytes:&v11 length:4];
  id v8 = -[UARPMetaDataTLV16OS tlvValue:](self, "tlvValue:", v4);
  [v7 appendData:v8];
  id v9 = (id)[MEMORY[0x189603F48] dataWithData:v7];

  return v9;
}

- (id)tlvValue:(unsigned __int16)a3
{
  int v4 = uarpHtons(a3);
  return (id)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:&v4 length:4];
}

@end