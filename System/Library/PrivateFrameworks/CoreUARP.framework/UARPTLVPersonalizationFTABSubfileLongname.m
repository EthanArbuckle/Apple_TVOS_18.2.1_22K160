@interface UARPTLVPersonalizationFTABSubfileLongname
+ (id)metaDataTableEntry;
+ (id)tlvFromPropertyListValue:(id)a3;
+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4;
+ (unsigned)tlvType;
- (NSString)longname;
- (UARPTLVPersonalizationFTABSubfileLongname)init;
- (id)description;
- (id)generateTLV;
- (id)tlvValue;
- (void)setLongname:(id)a3;
@end

@implementation UARPTLVPersonalizationFTABSubfileLongname

- (UARPTLVPersonalizationFTABSubfileLongname)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___UARPTLVPersonalizationFTABSubfileLongname;
  return -[UARPMetaDataTLVString init](&v3, sel_init);
}

- (void)setLongname:(id)a3
{
  id v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [v7 copy];
  longname = v4->_longname;
  v4->_longname = (NSString *)v5;

  objc_sync_exit(v4);
}

- (id)description
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)NSString;
  [v3 objectForKeyedSubscript:@"Name"];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 stringWithFormat:@"<%@: %@>", v5, self->_longname];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (unsigned)tlvType
{
  return -2001563374;
}

- (id)generateTLV
{
  uint64_t v3 = +[UARPTLVPersonalizationFTABSubfileLongname tlvType]( &OBJC_CLASS___UARPTLVPersonalizationFTABSubfileLongname,  "tlvType");
  longname = self->_longname;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___UARPTLVPersonalizationFTABSubfileLongname;
  -[UARPMetaDataTLVString generateTLV:tlvValue:](&v6, sel_generateTLV_tlvValue_, v3, longname);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)tlvValue
{
  longname = self->_longname;
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___UARPTLVPersonalizationFTABSubfileLongname;
  -[UARPMetaDataTLVString tlvValue:](&v4, sel_tlvValue_, longname);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)metaDataTableEntry
{
  v6[2] = *MEMORY[0x1895F89C0];
  v6[0] = @"Personalization FTAB Payload Longname";
  v5[0] = @"Name";
  v5[1] = @"Value";
  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInt:",  +[UARPTLVPersonalizationFTABSubfileLongname tlvType]( UARPTLVPersonalizationFTABSubfileLongname,  "tlvType"));
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
    objc_super v4 = (void *)objc_opt_new();
    [v4 setLongname:v3];
  }

  else
  {
    objc_super v4 = 0LL;
  }

  return v4;
}

+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4
{
  objc_super v4 = strndup((const char *)a4, a3);
  uint64_t v5 = (void *)objc_opt_new();
  [NSString stringWithUTF8String:v4];
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setLongname:v6];

  free(v4);
  return v5;
}

- (NSString)longname
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (void).cxx_destruct
{
}

@end