@interface UARPTLVPersonalizationECID
+ (id)metaDataTableEntry;
+ (id)tlvFromPropertyListValue:(id)a3;
+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4;
+ (unsigned)tlvType;
- (UARPTLVPersonalizationECID)init;
- (id)description;
- (id)generateTLV;
- (id)tlvValue;
- (unint64_t)ecID;
- (void)setEcID:(unint64_t)a3;
@end

@implementation UARPTLVPersonalizationECID

- (UARPTLVPersonalizationECID)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___UARPTLVPersonalizationECID;
  return -[UARPMetaDataTLV64 init](&v3, sel_init);
}

- (void)setEcID:(unint64_t)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_ecID = a3;
  objc_sync_exit(obj);
}

- (id)description
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)NSString;
  [v3 objectForKeyedSubscript:@"Name"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 stringWithFormat:@"<%@: 0x%016llx>", v5, self->_ecID];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (unsigned)tlvType
{
  return -2001563386;
}

- (id)generateTLV
{
  uint64_t v3 = +[UARPTLVPersonalizationECID tlvType](&OBJC_CLASS___UARPTLVPersonalizationECID, "tlvType");
  unint64_t ecID = self->_ecID;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___UARPTLVPersonalizationECID;
  -[UARPMetaDataTLV64 generateTLV:tlvValue:](&v6, sel_generateTLV_tlvValue_, v3, ecID);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)tlvValue
{
  unint64_t ecID = self->_ecID;
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___UARPTLVPersonalizationECID;
  -[UARPMetaDataTLV64 tlvValue:](&v4, sel_tlvValue_, ecID);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)metaDataTableEntry
{
  v6[2] = *MEMORY[0x1895F89C0];
  v6[0] = @"Personalization ECID";
  v5[0] = @"Name";
  v5[1] = @"Value";
  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInt:",  +[UARPTLVPersonalizationECID tlvType](UARPTLVPersonalizationECID, "tlvType"));
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
    id v4 = v3;
    v5 = (void *)objc_opt_new();
    uint64_t v6 = [v4 unsignedLongLongValue];

    [v5 setEcID:v6];
  }

  else
  {
    v5 = 0LL;
  }

  return v5;
}

+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4
{
  if (a3 == 8)
  {
    v5 = (void *)objc_opt_new();
    [v5 setEcID:uarpNtohll(*(void *)a4)];
  }

  else
  {
    v5 = 0LL;
  }

  return v5;
}

- (unint64_t)ecID
{
  return self->_ecID;
}

@end