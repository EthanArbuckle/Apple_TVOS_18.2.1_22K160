@interface UARPMetaDataTLVString
- (UARPMetaDataTLVString)init;
- (id)generateTLV:(unsigned int)a3 tlvValue:(id)a4;
- (id)tlvValue:(id)a3;
@end

@implementation UARPMetaDataTLVString

- (UARPMetaDataTLVString)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___UARPMetaDataTLVString;
  return -[UARPMetaDataTLV init](&v3, sel_init);
}

- (id)generateTLV:(unsigned int)a3 tlvValue:(id)a4
{
  v6 = (objc_class *)MEMORY[0x189603FB8];
  id v7 = a4;
  id v8 = objc_alloc_init(v6);
  int v13 = uarpHtonl(a3);
  [v8 appendBytes:&v13 length:4];
  int v12 = uarpHtonl([v7 length]);
  [v8 appendBytes:&v12 length:4];
  v9 = -[UARPMetaDataTLVString tlvValue:](self, "tlvValue:", v7);
  [v8 appendData:v9];
  [MEMORY[0x189603F48] dataWithData:v8];
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)tlvValue:(id)a3
{
  objc_super v3 = (objc_class *)MEMORY[0x189603F48];
  id v4 = a3;
  id v5 = objc_alloc(v3);
  id v6 = v4;
  uint64_t v7 = [v6 UTF8String];
  uint64_t v8 = [v6 length];

  return (id)[v5 initWithBytes:v7 length:v8];
}

@end