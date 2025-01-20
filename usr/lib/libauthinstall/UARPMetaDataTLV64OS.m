@interface UARPMetaDataTLV64OS
- (UARPMetaDataTLV64OS)init;
- (id)generateTLV:(unsigned int)a3 tlvValue:(unint64_t)a4;
- (id)tlvValue:(unint64_t)a3;
@end

@implementation UARPMetaDataTLV64OS

- (UARPMetaDataTLV64OS)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___UARPMetaDataTLV64OS;
  return -[UARPMetaDataTLVOS init](&v3, sel_init);
}

- (id)generateTLV:(unsigned int)a3 tlvValue:(unint64_t)a4
{
  id v7 = objc_alloc_init(MEMORY[0x189603FB8]);
  int v12 = uarpHtonl(a3);
  [v7 appendBytes:&v12 length:4];
  int v11 = uarpHtonl(8u);
  [v7 appendBytes:&v11 length:4];
  id v8 = -[UARPMetaDataTLV64OS tlvValue:](self, "tlvValue:", a4);
  [v7 appendData:v8];
  id v9 = (id)[MEMORY[0x189603F48] dataWithData:v7];

  return v9;
}

- (id)tlvValue:(unint64_t)a3
{
  unint64_t v4 = uarpHtonll(a3);
  return (id)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:&v4 length:8];
}

@end