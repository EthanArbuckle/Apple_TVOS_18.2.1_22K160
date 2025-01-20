@interface UARPMetaDataTLV64
- (UARPMetaDataTLV64)init;
- (id)generateTLV:(unsigned int)a3 tlvValue:(unint64_t)a4;
- (id)tlvValue:(unint64_t)a3;
@end

@implementation UARPMetaDataTLV64

- (UARPMetaDataTLV64)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___UARPMetaDataTLV64;
  return -[UARPMetaDataTLV init](&v3, sel_init);
}

- (id)generateTLV:(unsigned int)a3 tlvValue:(unint64_t)a4
{
  id v7 = objc_alloc_init(MEMORY[0x189603FB8]);
  int v12 = uarpHtonl(a3);
  [v7 appendBytes:&v12 length:4];
  int v11 = uarpHtonl(8u);
  [v7 appendBytes:&v11 length:4];
  v8 = -[UARPMetaDataTLV64 tlvValue:](self, "tlvValue:", a4);
  [v7 appendData:v8];
  [MEMORY[0x189603F48] dataWithData:v7];
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)tlvValue:(unint64_t)a3
{
  unint64_t v4 = uarpHtonll(a3);
  return (id)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:&v4 length:8];
}

@end