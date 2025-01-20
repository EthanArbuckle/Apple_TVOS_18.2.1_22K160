@interface UARPTLVPersonalizationEnableMixMatchOS
+ (id)metaDataTableEntry;
+ (id)tlvFromPropertyListValue:(id)a3;
+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4;
+ (unsigned)tlvType;
- (UARPTLVPersonalizationEnableMixMatchOS)init;
- (id)description;
- (id)generateTLV;
- (id)tlvValue;
- (unsigned)enableMixMatch;
- (void)setEnableMixMatch:(unsigned __int8)a3;
@end

@implementation UARPTLVPersonalizationEnableMixMatchOS

- (UARPTLVPersonalizationEnableMixMatchOS)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___UARPTLVPersonalizationEnableMixMatchOS;
  return -[UARPMetaDataTLV8OS init](&v3, sel_init);
}

- (void)setEnableMixMatch:(unsigned __int8)a3
{
  v4 = self;
  objc_sync_enter(v4);
  *((_BYTE *)&v4->super.super._tlvLength + 4) = a3;
  objc_sync_exit(v4);
}

- (id)description
{
  id v3 =  +[UARPTLVPersonalizationEnableMixMatchOS metaDataTableEntry]( &OBJC_CLASS___UARPTLVPersonalizationEnableMixMatchOS,  "metaDataTableEntry");
  v4 = (void *)NSString;
  id v5 = (id)[v3 objectForKeyedSubscript:@"Name"];
  v6 = v5;
  if (*((_BYTE *)&self->super.super._tlvLength + 4)) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  id v8 = (id)[v4 stringWithFormat:@"<%@: %@>", v5, v7];

  return v8;
}

+ (unsigned)tlvType
{
  return -2001563379;
}

- (id)generateTLV
{
  uint64_t v3 = +[UARPTLVPersonalizationEnableMixMatchOS tlvType]( &OBJC_CLASS___UARPTLVPersonalizationEnableMixMatchOS,  "tlvType");
  uint64_t v4 = *((unsigned __int8 *)&self->super.super._tlvLength + 4);
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___UARPTLVPersonalizationEnableMixMatchOS;
  return -[UARPMetaDataTLV8OS generateTLV:tlvValue:](&v6, sel_generateTLV_tlvValue_, v3, v4);
}

- (id)tlvValue
{
  uint64_t v2 = *((unsigned __int8 *)&self->super.super._tlvLength + 4);
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___UARPTLVPersonalizationEnableMixMatchOS;
  return -[UARPMetaDataTLV8OS tlvValue:](&v4, sel_tlvValue_, v2);
}

+ (id)metaDataTableEntry
{
  v6[2] = *MEMORY[0x1895F89C0];
  v6[0] = @"Personalization Enable Mix Match";
  v5[0] = @"Name";
  v5[1] = @"Value";
  id v2 = (id)objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInt:",  +[UARPTLVPersonalizationEnableMixMatchOS tlvType]( UARPTLVPersonalizationEnableMixMatchOS,  "tlvType"));
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
    uint64_t v6 = [v4 unsignedCharValue];

    [v5 setEnableMixMatch:v6];
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4
{
  if (a3 == 1)
  {
    id v5 = (void *)objc_opt_new();
    [v5 setEnableMixMatch:*(unsigned __int8 *)a4];
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

- (unsigned)enableMixMatch
{
  return *((_BYTE *)&self->super.super._tlvLength + 4);
}

@end