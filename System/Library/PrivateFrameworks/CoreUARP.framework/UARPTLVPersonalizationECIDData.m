@interface UARPTLVPersonalizationECIDData
+ (id)metaDataTableEntry;
+ (id)tlvFromPropertyListValue:(id)a3;
+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4;
+ (unsigned)tlvType;
- (NSData)ecID;
- (UARPTLVPersonalizationECIDData)init;
- (id)description;
- (id)generateTLV;
- (id)tlvValue;
- (void)setEcID:(id)a3;
@end

@implementation UARPTLVPersonalizationECIDData

- (UARPTLVPersonalizationECIDData)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___UARPTLVPersonalizationECIDData;
  return -[UARPMetaDataTLVData init](&v3, sel_init);
}

- (void)setEcID:(id)a3
{
  id v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [v7 copy];
  ecID = v4->_ecID;
  v4->_ecID = (NSData *)v5;

  objc_sync_exit(v4);
}

- (id)description
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)NSString;
  [v3 objectForKeyedSubscript:@"Name"];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 stringWithFormat:@"<%@: %@>", v5, self->_ecID];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (unsigned)tlvType
{
  return -2001563339;
}

- (id)generateTLV
{
  uint64_t v3 = +[UARPTLVPersonalizationECIDData tlvType](&OBJC_CLASS___UARPTLVPersonalizationECIDData, "tlvType");
  ecID = self->_ecID;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___UARPTLVPersonalizationECIDData;
  -[UARPMetaDataTLVData generateTLV:tlvValue:](&v6, sel_generateTLV_tlvValue_, v3, ecID);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)tlvValue
{
  return self->_ecID;
}

+ (id)metaDataTableEntry
{
  v6[2] = *MEMORY[0x1895F89C0];
  v6[0] = @"Personalization ECID Data";
  v5[0] = @"Name";
  v5[1] = @"Value";
  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInt:",  +[UARPTLVPersonalizationECIDData tlvType](UARPTLVPersonalizationECIDData, "tlvType"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v2;
  [MEMORY[0x189603F68] dictionaryWithObjects:v6 forKeys:v5 count:2];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)tlvFromPropertyListValue:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (void *)objc_opt_new();
    [v4 setEcID:v3];
  }

  else
  {
    v4 = 0LL;
  }

  return v4;
}

+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4
{
  objc_super v6 = (void *)objc_opt_new();
  [MEMORY[0x189603F48] dataWithBytes:a4 length:a3];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setEcID:v7];

  return v6;
}

- (NSData)ecID
{
  return (NSData *)objc_getProperty(self, a2, 32LL, 1);
}

- (void).cxx_destruct
{
}

@end