@interface UARPTLVPersonalizationFTABSubfileLongnameOS
+ (id)metaDataTableEntry;
+ (id)tlvFromPropertyListValue:(id)a3;
+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4;
+ (unsigned)tlvType;
- (NSString)longname;
- (UARPTLVPersonalizationFTABSubfileLongnameOS)init;
- (id)description;
- (id)generateTLV;
- (id)tlvValue;
- (void)setLongname:(id)a3;
@end

@implementation UARPTLVPersonalizationFTABSubfileLongnameOS

- (UARPTLVPersonalizationFTABSubfileLongnameOS)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___UARPTLVPersonalizationFTABSubfileLongnameOS;
  return -[UARPMetaDataTLVStringOS init](&v3, sel_init);
}

- (void)setLongname:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = [v4 copy];
  longname = v5->_longname;
  v5->_longname = (NSString *)v6;

  objc_sync_exit(v5);
}

- (id)description
{
  id v3 =  +[UARPTLVPersonalizationFTABSubfileLongnameOS metaDataTableEntry]( &OBJC_CLASS___UARPTLVPersonalizationFTABSubfileLongnameOS,  "metaDataTableEntry");
  id v4 = (void *)NSString;
  id v5 = (id)[v3 objectForKeyedSubscript:@"Name"];
  id v6 = (id)[v4 stringWithFormat:@"<%@: %@>", v5, self->_longname];

  return v6;
}

+ (unsigned)tlvType
{
  return -2001563374;
}

- (id)generateTLV
{
  uint64_t v3 = +[UARPTLVPersonalizationFTABSubfileLongnameOS tlvType]( &OBJC_CLASS___UARPTLVPersonalizationFTABSubfileLongnameOS,  "tlvType");
  longname = self->_longname;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___UARPTLVPersonalizationFTABSubfileLongnameOS;
  return -[UARPMetaDataTLVStringOS generateTLV:tlvValue:](&v6, sel_generateTLV_tlvValue_, v3, longname);
}

- (id)tlvValue
{
  longname = self->_longname;
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___UARPTLVPersonalizationFTABSubfileLongnameOS;
  return -[UARPMetaDataTLVStringOS tlvValue:](&v4, sel_tlvValue_, longname);
}

+ (id)metaDataTableEntry
{
  v6[2] = *MEMORY[0x1895F89C0];
  v6[0] = @"Personalization FTAB Payload Longname";
  v5[0] = @"Name";
  v5[1] = @"Value";
  id v2 = (id)objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInt:",  +[UARPTLVPersonalizationFTABSubfileLongnameOS tlvType]( UARPTLVPersonalizationFTABSubfileLongnameOS,  "tlvType"));
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
  id v5 = (void *)objc_opt_new();
  id v6 = (id)[NSString stringWithUTF8String:v4];
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