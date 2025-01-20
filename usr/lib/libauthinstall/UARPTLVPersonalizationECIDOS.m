@interface UARPTLVPersonalizationECIDOS
+ (id)metaDataTableEntry;
+ (id)tlvFromPropertyListValue:(id)a3;
+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4;
+ (unsigned)tlvType;
- (UARPTLVPersonalizationECIDOS)init;
- (id)description;
- (id)generateTLV;
- (id)tlvValue;
- (unint64_t)ecID;
- (void)setEcID:(unint64_t)a3;
@end

@implementation UARPTLVPersonalizationECIDOS

- (UARPTLVPersonalizationECIDOS)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___UARPTLVPersonalizationECIDOS;
  return -[UARPMetaDataTLV64OS init](&v3, sel_init);
}

- (void)setEcID:(unint64_t)a3
{
  v4 = self;
  objc_sync_enter(v4);
  v4->_ecID = a3;
  objc_sync_exit(v4);
}

- (id)description
{
  id v3 =  +[UARPTLVPersonalizationECIDOS metaDataTableEntry]( &OBJC_CLASS___UARPTLVPersonalizationECIDOS,  "metaDataTableEntry");
  v4 = (void *)NSString;
  id v5 = (id)[v3 objectForKeyedSubscript:@"Name"];
  id v6 = (id)[v4 stringWithFormat:@"<%@: 0x%016llx>", v5, self->_ecID];

  return v6;
}

+ (unsigned)tlvType
{
  return -2001563386;
}

- (id)generateTLV
{
  uint64_t v3 = +[UARPTLVPersonalizationECIDOS tlvType](&OBJC_CLASS___UARPTLVPersonalizationECIDOS, "tlvType");
  unint64_t ecID = self->_ecID;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___UARPTLVPersonalizationECIDOS;
  return -[UARPMetaDataTLV64OS generateTLV:tlvValue:](&v6, sel_generateTLV_tlvValue_, v3, ecID);
}

- (id)tlvValue
{
  unint64_t ecID = self->_ecID;
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___UARPTLVPersonalizationECIDOS;
  return -[UARPMetaDataTLV64OS tlvValue:](&v4, sel_tlvValue_, ecID);
}

+ (id)metaDataTableEntry
{
  v6[2] = *MEMORY[0x1895F89C0];
  v6[0] = @"Personalization ECID";
  v5[0] = @"Name";
  v5[1] = @"Value";
  id v2 = (id)objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInt:",  +[UARPTLVPersonalizationECIDOS tlvType]( UARPTLVPersonalizationECIDOS,  "tlvType"));
  v6[1] = v2;
  id v3 = (id)[MEMORY[0x189603F68] dictionaryWithObjects:v6 forKeys:v5 count:2];

  return v3;
}

+ (id)tlvFromPropertyListValue:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v4 = v3;
    id v5 = (void *)objc_opt_new();
    uint64_t v6 = [v4 unsignedLongLongValue];

    [v5 setEcID:v6];
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4
{
  if (a3 == 8)
  {
    id v5 = (void *)objc_opt_new();
    [v5 setEcID:uarpHtonll(*(void *)a4)];
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

- (unint64_t)ecID
{
  return self->_ecID;
}

@end