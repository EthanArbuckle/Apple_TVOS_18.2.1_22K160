@interface UARPMetaDataTLVOS
+ (id)metaDataTable;
+ (id)metaDataTableEntry;
+ (id)tlvFromKey:(id)a3 value:(id)a4;
+ (id)tlvFromPropertyListValue:(id)a3;
+ (id)tlvFromType:(unsigned int)a3 length:(unsigned int)a4 value:(void *)a5;
+ (id)tlvTypeName:(unsigned int)a3;
+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4;
- (UARPMetaDataTLVOS)init;
- (UARPMetaDataTLVOS)initWithType:(unsigned int)a3 length:(unsigned int)a4 value:(void *)a5;
- (id)description;
- (id)generateTLV;
- (id)tlvValue;
- (unsigned)tlvLength;
- (unsigned)tlvType;
@end

@implementation UARPMetaDataTLVOS

- (UARPMetaDataTLVOS)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___UARPMetaDataTLVOS;
  return -[UARPMetaDataTLVOS init](&v3, sel_init);
}

- (UARPMetaDataTLVOS)initWithType:(unsigned int)a3 length:(unsigned int)a4 value:(void *)a5
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___UARPMetaDataTLVOS;
  v8 = -[UARPMetaDataTLVOS init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_tlvType = a3;
    v8->_tlvLength = a4;
    v10 = (NSData *)(id)[MEMORY[0x189603F48] dataWithBytes:a5 length:a4];
    tlvValue = v9->_tlvValue;
    v9->_tlvValue = v10;
  }

  return v9;
}

- (id)description
{
  return (id)objc_msgSend( NSString,  "stringWithFormat:",  @"<Type = 0x%08x, Length = 0x%08x>",  self->_tlvType,  self->_tlvLength);
}

+ (id)tlvFromType:(unsigned int)a3 length:(unsigned int)a4 value:(void *)a5
{
  switch(a3)
  {
    case 0x88B29100:
      v5 = &OBJC_CLASS___UARPTLVPersonalizationRequiredOS;
      goto LABEL_41;
    case 0x88B29101:
      v5 = &OBJC_CLASS___UARPTLVPersonalizationPayloadTagOS;
      goto LABEL_41;
    case 0x88B29102:
      v5 = &OBJC_CLASS___UARPTLVPersonalizationSuperBinaryAssetIDOS;
      goto LABEL_41;
    case 0x88B29103:
      v5 = &OBJC_CLASS___UARPTLVPersonalizationManifestPrefixOS;
      goto LABEL_41;
    case 0x88B29104:
      v5 = &OBJC_CLASS___UARPTLVPersonalizationBoardIDOS;
      goto LABEL_41;
    case 0x88B29105:
      v5 = &OBJC_CLASS___UARPTLVPersonalizationChipIDOS;
      goto LABEL_41;
    case 0x88B29106:
      v5 = &OBJC_CLASS___UARPTLVPersonalizationECIDOS;
      goto LABEL_41;
    case 0x88B29107:
      v5 = &OBJC_CLASS___UARPTLVPersonalizationNonceOS;
      goto LABEL_41;
    case 0x88B29108:
      v5 = &OBJC_CLASS___UARPTLVPersonalizationNonceHashOS;
      goto LABEL_41;
    case 0x88B29109:
      v5 = &OBJC_CLASS___UARPTLVPersonalizationSecurityDomainOS;
      goto LABEL_41;
    case 0x88B2910A:
      v5 = &OBJC_CLASS___UARPTLVPersonalizationSecurityModeOS;
      goto LABEL_41;
    case 0x88B2910B:
      v5 = &OBJC_CLASS___UARPTLVPersonalizationProductionModeOS;
      goto LABEL_41;
    case 0x88B2910C:
      v5 = &OBJC_CLASS___UARPTLVPersonalizationChipEpochOS;
      goto LABEL_41;
    case 0x88B2910D:
      v5 = &OBJC_CLASS___UARPTLVPersonalizationEnableMixMatchOS;
      goto LABEL_41;
    case 0x88B2910E:
      v5 = &OBJC_CLASS___UARPTLVPersonalizationSuperBinaryPayloadIndexOS;
      goto LABEL_41;
    case 0x88B2910F:
      v5 = &OBJC_CLASS___UARPTLVPersonalizationChipRevisionOS;
      goto LABEL_41;
    case 0x88B29110:
      v5 = &OBJC_CLASS___UARPTLVPersonalizationFTABPayloadOS;
      goto LABEL_41;
    case 0x88B29111:
      v5 = &OBJC_CLASS___UARPTLVPersonalizationFTABSubfileTagOS;
      goto LABEL_41;
    case 0x88B29112:
      v5 = &OBJC_CLASS___UARPTLVPersonalizationFTABSubfileLongnameOS;
      goto LABEL_41;
    case 0x88B29113:
      v5 = &OBJC_CLASS___UARPTLVPersonalizationFTABSubfileDigestOS;
      goto LABEL_41;
    case 0x88B29114:
      v5 = &OBJC_CLASS___UARPTLVPersonalizationFTABSubfileHashAlgorithmOS;
      goto LABEL_41;
    case 0x88B29115:
      v5 = &OBJC_CLASS___UARPTLVPersonalizationFTABSubfileESECOS;
      goto LABEL_41;
    case 0x88B29116:
      v5 = &OBJC_CLASS___UARPTLVPersonalizationFTABSubfileEPROOS;
      goto LABEL_41;
    case 0x88B29117:
      v5 = &OBJC_CLASS___UARPTLVPersonalizationFTABSubfileTrustedOS;
      goto LABEL_41;
    case 0x88B29118:
      v5 = &OBJC_CLASS___UARPTLVPersonalizationSoCLiveNonceOS;
      goto LABEL_41;
    case 0x88B29121:
      v5 = &OBJC_CLASS___UARPTLVPersonalizationPrefixNeedsLogicalUnitNumberOS;
      goto LABEL_41;
    case 0x88B29122:
      v5 = &OBJC_CLASS___UARPTLVPersonalizationSuffixNeedsLogicalUnitNumberOS;
      goto LABEL_41;
    case 0x88B29125:
      v5 = &OBJC_CLASS___UARPTLVPersonalizationLogicalUnitNumberOS;
      goto LABEL_41;
    case 0x88B29126:
      v5 = &OBJC_CLASS___UARPTLVPersonalizationTicketNeedsLogicalUnitNumberOS;
      goto LABEL_41;
    case 0x88B29128:
      v5 = &OBJC_CLASS___UARPTLVHostPersonalizationRequiredOS;
      goto LABEL_41;
    case 0x88B29129:
      v5 = &OBJC_CLASS___UARPTLVRequiredPersonalizationOptionOS;
      goto LABEL_41;
    case 0x88B29130:
      v5 = &OBJC_CLASS___UARPTLVPersonalizedManifestOS;
      goto LABEL_41;
    case 0x88B29131:
      v5 = &OBJC_CLASS___UARPTLVPersonalizationLifeOS;
      goto LABEL_41;
    case 0x88B29132:
      v5 = &OBJC_CLASS___UARPTLVPersonalizationProvisioningOS;
      goto LABEL_41;
    case 0x88B29133:
      v5 = &OBJC_CLASS___UARPTLVPersonalizationManifestEpochOS;
      goto LABEL_41;
    case 0x88B29134:
      v5 = &OBJC_CLASS___UARPTLVPersonalizationManifestSuffixOS;
      goto LABEL_41;
    case 0x88B29135:
      v5 = &OBJC_CLASS___UARPTLVPersonalizationECIDDataOS;
      goto LABEL_41;
    case 0x88B29136:
      v5 = &OBJC_CLASS___UARPTLVPersonalizationFTABSubfileDigestFilenameOS;
LABEL_41:
      v6 = (UARPMetaDataTLVOS *)(id)-[__objc2_class tlvWithLength:value:]( v5,  "tlvWithLength:value:",  a4,  a5);
      break;
    default:
      v6 = -[UARPMetaDataTLVOS initWithType:length:value:]( objc_alloc(&OBJC_CLASS___UARPMetaDataTLVOS),  "initWithType:length:value:",  *(void *)&a3,  *(void *)&a4,  a5);
      break;
  }

  return v6;
}

+ (id)tlvFromKey:(id)a3 value:(id)a4
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id v19 = a4;
  id v6 = +[UARPMetaDataTLVOS metaDataTable](&OBJC_CLASS___UARPMetaDataTLVOS, "metaDataTable");
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = 0LL;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v6);
        }
        v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v13 = (id)[v12 objectForKeyedSubscript:@"Name"];
        if (![v5 caseInsensitiveCompare:v13])
        {
          id v14 = (id)[v12 objectForKeyedSubscript:@"Value"];
          unsigned int v15 = [v14 unsignedLongValue] + 2001563392;
          if (v15 <= 0x35 && ((0x3F036601FFFFFFuLL >> v15) & 1) != 0)
          {
            id v16 = (id)-[__objc2_class tlvFromPropertyListValue:]( *off_18A120920[v15],  "tlvFromPropertyListValue:",  v19);
            v17 = v9;
            id v9 = v16;
          }
        }
      }

      uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v8);
  }

  else
  {
    id v9 = 0LL;
  }

  return v9;
}

+ (id)metaDataTable
{
  if (metaDataTable_once != -1) {
    dispatch_once(&metaDataTable_once, &__block_literal_global_1);
  }
  return (id)metaDataTable_table;
}

void __34__UARPMetaDataTLVOS_metaDataTable__block_invoke()
{
  v0 = (void *)objc_opt_new();
  id v1 =  +[UARPTLVPersonalizationRequiredOS metaDataTableEntry]( &OBJC_CLASS___UARPTLVPersonalizationRequiredOS,  "metaDataTableEntry");
  [v0 addObject:v1];

  id v2 =  +[UARPTLVPersonalizationPayloadTagOS metaDataTableEntry]( &OBJC_CLASS___UARPTLVPersonalizationPayloadTagOS,  "metaDataTableEntry");
  [v0 addObject:v2];

  id v3 =  +[UARPTLVPersonalizationSuperBinaryAssetIDOS metaDataTableEntry]( &OBJC_CLASS___UARPTLVPersonalizationSuperBinaryAssetIDOS,  "metaDataTableEntry");
  [v0 addObject:v3];

  id v4 =  +[UARPTLVPersonalizationManifestPrefixOS metaDataTableEntry]( &OBJC_CLASS___UARPTLVPersonalizationManifestPrefixOS,  "metaDataTableEntry");
  [v0 addObject:v4];

  id v5 =  +[UARPTLVPersonalizationBoardIDOS metaDataTableEntry]( &OBJC_CLASS___UARPTLVPersonalizationBoardIDOS,  "metaDataTableEntry");
  [v0 addObject:v5];

  id v6 =  +[UARPTLVPersonalizationChipIDOS metaDataTableEntry]( &OBJC_CLASS___UARPTLVPersonalizationChipIDOS,  "metaDataTableEntry");
  [v0 addObject:v6];

  id v7 =  +[UARPTLVPersonalizationECIDOS metaDataTableEntry]( &OBJC_CLASS___UARPTLVPersonalizationECIDOS,  "metaDataTableEntry");
  [v0 addObject:v7];

  id v8 =  +[UARPTLVPersonalizationECIDDataOS metaDataTableEntry]( &OBJC_CLASS___UARPTLVPersonalizationECIDDataOS,  "metaDataTableEntry");
  [v0 addObject:v8];

  id v9 =  +[UARPTLVPersonalizationNonceOS metaDataTableEntry]( &OBJC_CLASS___UARPTLVPersonalizationNonceOS,  "metaDataTableEntry");
  [v0 addObject:v9];

  id v10 =  +[UARPTLVPersonalizationNonceHashOS metaDataTableEntry]( &OBJC_CLASS___UARPTLVPersonalizationNonceHashOS,  "metaDataTableEntry");
  [v0 addObject:v10];

  id v11 =  +[UARPTLVPersonalizationSecurityDomainOS metaDataTableEntry]( &OBJC_CLASS___UARPTLVPersonalizationSecurityDomainOS,  "metaDataTableEntry");
  [v0 addObject:v11];

  id v12 =  +[UARPTLVPersonalizationSecurityModeOS metaDataTableEntry]( &OBJC_CLASS___UARPTLVPersonalizationSecurityModeOS,  "metaDataTableEntry");
  [v0 addObject:v12];

  id v13 =  +[UARPTLVPersonalizationProductionModeOS metaDataTableEntry]( &OBJC_CLASS___UARPTLVPersonalizationProductionModeOS,  "metaDataTableEntry");
  [v0 addObject:v13];

  id v14 =  +[UARPTLVPersonalizationChipEpochOS metaDataTableEntry]( &OBJC_CLASS___UARPTLVPersonalizationChipEpochOS,  "metaDataTableEntry");
  [v0 addObject:v14];

  id v15 =  +[UARPTLVPersonalizationEnableMixMatchOS metaDataTableEntry]( &OBJC_CLASS___UARPTLVPersonalizationEnableMixMatchOS,  "metaDataTableEntry");
  [v0 addObject:v15];

  id v16 =  +[UARPTLVPersonalizationSuperBinaryPayloadIndexOS metaDataTableEntry]( &OBJC_CLASS___UARPTLVPersonalizationSuperBinaryPayloadIndexOS,  "metaDataTableEntry");
  [v0 addObject:v16];

  id v17 =  +[UARPTLVPersonalizationChipRevisionOS metaDataTableEntry]( &OBJC_CLASS___UARPTLVPersonalizationChipRevisionOS,  "metaDataTableEntry");
  [v0 addObject:v17];

  id v18 =  +[UARPTLVPersonalizationFTABSubfileTagOS metaDataTableEntry]( &OBJC_CLASS___UARPTLVPersonalizationFTABSubfileTagOS,  "metaDataTableEntry");
  [v0 addObject:v18];

  id v19 =  +[UARPTLVPersonalizationFTABSubfileLongnameOS metaDataTableEntry]( &OBJC_CLASS___UARPTLVPersonalizationFTABSubfileLongnameOS,  "metaDataTableEntry");
  [v0 addObject:v19];

  id v20 =  +[UARPTLVPersonalizationFTABSubfileDigestOS metaDataTableEntry]( &OBJC_CLASS___UARPTLVPersonalizationFTABSubfileDigestOS,  "metaDataTableEntry");
  [v0 addObject:v20];

  id v21 =  +[UARPTLVPersonalizationFTABSubfileHashAlgorithmOS metaDataTableEntry]( &OBJC_CLASS___UARPTLVPersonalizationFTABSubfileHashAlgorithmOS,  "metaDataTableEntry");
  [v0 addObject:v21];

  id v22 =  +[UARPTLVPersonalizationFTABSubfileESECOS metaDataTableEntry]( &OBJC_CLASS___UARPTLVPersonalizationFTABSubfileESECOS,  "metaDataTableEntry");
  [v0 addObject:v22];

  id v23 =  +[UARPTLVPersonalizationFTABSubfileEPROOS metaDataTableEntry]( &OBJC_CLASS___UARPTLVPersonalizationFTABSubfileEPROOS,  "metaDataTableEntry");
  [v0 addObject:v23];

  id v24 =  +[UARPTLVPersonalizationFTABSubfileTrustedOS metaDataTableEntry]( &OBJC_CLASS___UARPTLVPersonalizationFTABSubfileTrustedOS,  "metaDataTableEntry");
  [v0 addObject:v24];

  id v25 =  +[UARPTLVPersonalizationSoCLiveNonceOS metaDataTableEntry]( &OBJC_CLASS___UARPTLVPersonalizationSoCLiveNonceOS,  "metaDataTableEntry");
  [v0 addObject:v25];

  id v26 =  +[UARPTLVPersonalizationPrefixNeedsLogicalUnitNumberOS metaDataTableEntry]( &OBJC_CLASS___UARPTLVPersonalizationPrefixNeedsLogicalUnitNumberOS,  "metaDataTableEntry");
  [v0 addObject:v26];

  id v27 =  +[UARPTLVPersonalizationSuffixNeedsLogicalUnitNumberOS metaDataTableEntry]( &OBJC_CLASS___UARPTLVPersonalizationSuffixNeedsLogicalUnitNumberOS,  "metaDataTableEntry");
  [v0 addObject:v27];

  id v28 =  +[UARPTLVPersonalizationLogicalUnitNumberOS metaDataTableEntry]( &OBJC_CLASS___UARPTLVPersonalizationLogicalUnitNumberOS,  "metaDataTableEntry");
  [v0 addObject:v28];

  id v29 =  +[UARPTLVPersonalizationTicketNeedsLogicalUnitNumberOS metaDataTableEntry]( &OBJC_CLASS___UARPTLVPersonalizationTicketNeedsLogicalUnitNumberOS,  "metaDataTableEntry");
  [v0 addObject:v29];

  id v30 =  +[UARPTLVHostPersonalizationRequiredOS metaDataTableEntry]( &OBJC_CLASS___UARPTLVHostPersonalizationRequiredOS,  "metaDataTableEntry");
  [v0 addObject:v30];

  id v31 =  +[UARPTLVRequiredPersonalizationOptionOS metaDataTableEntry]( &OBJC_CLASS___UARPTLVRequiredPersonalizationOptionOS,  "metaDataTableEntry");
  [v0 addObject:v31];

  id v32 =  +[UARPTLVPersonalizationFTABPayloadOS metaDataTableEntry]( &OBJC_CLASS___UARPTLVPersonalizationFTABPayloadOS,  "metaDataTableEntry");
  [v0 addObject:v32];

  id v33 =  +[UARPTLVPersonalizedManifestOS metaDataTableEntry]( &OBJC_CLASS___UARPTLVPersonalizedManifestOS,  "metaDataTableEntry");
  [v0 addObject:v33];

  id v34 =  +[UARPTLVPersonalizationLifeOS metaDataTableEntry]( &OBJC_CLASS___UARPTLVPersonalizationLifeOS,  "metaDataTableEntry");
  [v0 addObject:v34];

  id v35 =  +[UARPTLVPersonalizationProvisioningOS metaDataTableEntry]( &OBJC_CLASS___UARPTLVPersonalizationProvisioningOS,  "metaDataTableEntry");
  [v0 addObject:v35];

  id v36 =  +[UARPTLVPersonalizationManifestEpochOS metaDataTableEntry]( &OBJC_CLASS___UARPTLVPersonalizationManifestEpochOS,  "metaDataTableEntry");
  [v0 addObject:v36];

  id v37 =  +[UARPTLVPersonalizationManifestSuffixOS metaDataTableEntry]( &OBJC_CLASS___UARPTLVPersonalizationManifestSuffixOS,  "metaDataTableEntry");
  [v0 addObject:v37];

  id v38 = (id)[MEMORY[0x189603F18] arrayWithArray:v0];
  v39 = (void *)metaDataTable_table;
  metaDataTable_table = (uint64_t)v38;
}

+ (id)tlvTypeName:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v20 = *MEMORY[0x1895F89C0];
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id obj = +[UARPMetaDataTLVOS metaDataTable](&OBJC_CLASS___UARPMetaDataTLVOS, "metaDataTable");
  uint64_t v4 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v9 = (id)[v8 objectForKeyedSubscript:@"Value"];
        id v10 = (id)[MEMORY[0x189607968] numberWithUnsignedInt:v3];
        char v11 = [v9 isEqual:v10];

        if ((v11 & 1) != 0)
        {
          id v12 = (id)[v8 objectForKeyedSubscript:@"Name"];
          goto LABEL_11;
        }
      }

      uint64_t v5 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  id v12 = 0LL;
LABEL_11:

  return v12;
}

- (id)generateTLV
{
  id v3 = objc_alloc_init(MEMORY[0x189603FB8]);
  int v7 = uarpHtonl(self->_tlvType);
  [v3 appendBytes:&v7 length:4];
  int v6 = uarpHtonl(self->_tlvLength);
  [v3 appendBytes:&v6 length:4];
  [v3 appendData:self->_tlvValue];
  id v4 = (id)[MEMORY[0x189603F48] dataWithData:v3];

  return v4;
}

- (id)tlvValue
{
  return self->_tlvValue;
}

+ (id)metaDataTableEntry
{
  return 0LL;
}

+ (id)tlvFromPropertyListValue:(id)a3
{
  return 0LL;
}

+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4
{
  return 0LL;
}

- (unsigned)tlvType
{
  return self->_tlvType;
}

- (unsigned)tlvLength
{
  return self->_tlvLength;
}

- (void).cxx_destruct
{
}

@end