@interface UARPTLVRequiredPersonalizationOptionOS
+ (id)metaDataTableEntry;
+ (id)tlvFromPropertyListValue:(id)a3;
+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4;
+ (unsigned)tlvType;
- (UARPTLVRequiredPersonalizationOptionOS)init;
- (id)description;
- (id)generateTLV;
- (id)tlvValue;
- (unsigned)tssOption;
- (void)setTssOption:(unsigned int)a3;
@end

@implementation UARPTLVRequiredPersonalizationOptionOS

- (UARPTLVRequiredPersonalizationOptionOS)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___UARPTLVRequiredPersonalizationOptionOS;
  return -[UARPMetaDataTLV32OS init](&v3, sel_init);
}

- (void)setTssOption:(unsigned int)a3
{
  v4 = self;
  objc_sync_enter(v4);
  *(&v4->super.super._tlvLength + 1) = a3;
  objc_sync_exit(v4);
}

- (id)description
{
  id v3 =  +[UARPTLVRequiredPersonalizationOptionOS metaDataTableEntry]( &OBJC_CLASS___UARPTLVRequiredPersonalizationOptionOS,  "metaDataTableEntry");
  v4 = (void *)NSString;
  id v5 = (id)[v3 objectForKeyedSubscript:@"Name"];
  id v6 =  +[UARPMetaDataTLVOS tlvTypeName:]( &OBJC_CLASS___UARPMetaDataTLVOS,  "tlvTypeName:",  *(&self->super.super._tlvLength + 1));
  id v7 = (id)[v4 stringWithFormat:@"<%@: %@>", v5, v6];

  return v7;
}

+ (unsigned)tlvType
{
  return -2001563351;
}

- (id)generateTLV
{
  uint64_t v3 = +[UARPTLVRequiredPersonalizationOptionOS tlvType]( &OBJC_CLASS___UARPTLVRequiredPersonalizationOptionOS,  "tlvType");
  uint64_t v4 = *(&self->super.super._tlvLength + 1);
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___UARPTLVRequiredPersonalizationOptionOS;
  return -[UARPMetaDataTLV32OS generateTLV:tlvValue:](&v6, sel_generateTLV_tlvValue_, v3, v4);
}

- (id)tlvValue
{
  uint64_t v2 = *(&self->super.super._tlvLength + 1);
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___UARPTLVRequiredPersonalizationOptionOS;
  return -[UARPMetaDataTLV32OS tlvValue:](&v4, sel_tlvValue_, v2);
}

+ (id)metaDataTableEntry
{
  v6[2] = *MEMORY[0x1895F89C0];
  v6[0] = @"Required Personalization Option";
  v5[0] = @"Name";
  v5[1] = @"Value";
  id v2 = (id)objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInt:",  +[UARPTLVRequiredPersonalizationOptionOS tlvType]( UARPTLVRequiredPersonalizationOptionOS,  "tlvType"));
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
    uint64_t v6 = [v4 unsignedLongValue];

    [v5 setTssOption:v6];
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4
{
  if (a3 == 4)
  {
    id v5 = (void *)objc_opt_new();
    [v5 setTssOption:uarpHtonl(*(_DWORD *)a4)];
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

- (unsigned)tssOption
{
  return *(&self->super.super._tlvLength + 1);
}

@end