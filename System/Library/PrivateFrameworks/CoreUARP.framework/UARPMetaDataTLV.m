@interface UARPMetaDataTLV
+ (id)metaDataTable;
+ (id)metaDataTableEntry;
+ (id)tlvFromKey:(id)a3 value:(id)a4;
+ (id)tlvFromPropertyListValue:(id)a3;
+ (id)tlvFromType:(unsigned int)a3 length:(unsigned int)a4 value:(void *)a5;
+ (id)tlvTypeName:(unsigned int)a3;
+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4;
- (UARPMetaDataTLV)init;
- (UARPMetaDataTLV)initWithType:(unsigned int)a3 length:(unsigned int)a4 value:(void *)a5;
- (id)description;
- (id)generateTLV;
- (id)tlvValue;
- (unsigned)tlvLength;
- (unsigned)tlvType;
@end

@implementation UARPMetaDataTLV

- (UARPMetaDataTLV)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___UARPMetaDataTLV;
  return -[UARPMetaDataTLV init](&v3, sel_init);
}

- (UARPMetaDataTLV)initWithType:(unsigned int)a3 length:(unsigned int)a4 value:(void *)a5
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___UARPMetaDataTLV;
  v8 = -[UARPMetaDataTLV init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_tlvType = a3;
    v8->_tlvLength = a4;
    uint64_t v10 = [MEMORY[0x189603F48] dataWithBytes:a5 length:a4];
    tlvValue = v9->_tlvValue;
    v9->_tlvValue = (NSData *)v10;
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
      v5 = &OBJC_CLASS___UARPTLVPersonalizationRequired;
      goto LABEL_41;
    case 0x88B29101:
      v5 = &OBJC_CLASS___UARPTLVPersonalizationPayloadTag;
      goto LABEL_41;
    case 0x88B29102:
      v5 = &OBJC_CLASS___UARPTLVPersonalizationSuperBinaryAssetID;
      goto LABEL_41;
    case 0x88B29103:
      v5 = &OBJC_CLASS___UARPTLVPersonalizationManifestPrefix;
      goto LABEL_41;
    case 0x88B29104:
      v5 = &OBJC_CLASS___UARPTLVPersonalizationBoardID;
      goto LABEL_41;
    case 0x88B29105:
      v5 = &OBJC_CLASS___UARPTLVPersonalizationChipID;
      goto LABEL_41;
    case 0x88B29106:
      v5 = &OBJC_CLASS___UARPTLVPersonalizationECID;
      goto LABEL_41;
    case 0x88B29107:
      v5 = &OBJC_CLASS___UARPTLVPersonalizationNonce;
      goto LABEL_41;
    case 0x88B29108:
      v5 = &OBJC_CLASS___UARPTLVPersonalizationNonceHash;
      goto LABEL_41;
    case 0x88B29109:
      v5 = &OBJC_CLASS___UARPTLVPersonalizationSecurityDomain;
      goto LABEL_41;
    case 0x88B2910A:
      v5 = &OBJC_CLASS___UARPTLVPersonalizationSecurityMode;
      goto LABEL_41;
    case 0x88B2910B:
      v5 = &OBJC_CLASS___UARPTLVPersonalizationProductionMode;
      goto LABEL_41;
    case 0x88B2910C:
      v5 = &OBJC_CLASS___UARPTLVPersonalizationChipEpoch;
      goto LABEL_41;
    case 0x88B2910D:
      v5 = &OBJC_CLASS___UARPTLVPersonalizationEnableMixMatch;
      goto LABEL_41;
    case 0x88B2910E:
      v5 = &OBJC_CLASS___UARPTLVPersonalizationSuperBinaryPayloadIndex;
      goto LABEL_41;
    case 0x88B2910F:
      v5 = &OBJC_CLASS___UARPTLVPersonalizationChipRevision;
      goto LABEL_41;
    case 0x88B29110:
      v5 = &OBJC_CLASS___UARPTLVPersonalizationFTABPayload;
      goto LABEL_41;
    case 0x88B29111:
      v5 = &OBJC_CLASS___UARPTLVPersonalizationFTABSubfileTag;
      goto LABEL_41;
    case 0x88B29112:
      v5 = &OBJC_CLASS___UARPTLVPersonalizationFTABSubfileLongname;
      goto LABEL_41;
    case 0x88B29113:
      v5 = &OBJC_CLASS___UARPTLVPersonalizationFTABSubfileDigest;
      goto LABEL_41;
    case 0x88B29114:
      v5 = &OBJC_CLASS___UARPTLVPersonalizationFTABSubfileHashAlgorithm;
      goto LABEL_41;
    case 0x88B29115:
      v5 = &OBJC_CLASS___UARPTLVPersonalizationFTABSubfileESEC;
      goto LABEL_41;
    case 0x88B29116:
      v5 = &OBJC_CLASS___UARPTLVPersonalizationFTABSubfileEPRO;
      goto LABEL_41;
    case 0x88B29117:
      v5 = &OBJC_CLASS___UARPTLVPersonalizationFTABSubfileTrusted;
      goto LABEL_41;
    case 0x88B29118:
      v5 = &OBJC_CLASS___UARPTLVPersonalizationSoCLiveNonce;
      goto LABEL_41;
    case 0x88B29121:
      v5 = &OBJC_CLASS___UARPTLVPersonalizationPrefixNeedsLogicalUnitNumber;
      goto LABEL_41;
    case 0x88B29122:
      v5 = &OBJC_CLASS___UARPTLVPersonalizationSuffixNeedsLogicalUnitNumber;
      goto LABEL_41;
    case 0x88B29125:
      v5 = &OBJC_CLASS___UARPTLVPersonalizationLogicalUnitNumber;
      goto LABEL_41;
    case 0x88B29126:
      v5 = &OBJC_CLASS___UARPTLVPersonalizationTicketNeedsLogicalUnitNumber;
      goto LABEL_41;
    case 0x88B29128:
      v5 = &OBJC_CLASS___UARPTLVHostPersonalizationRequired;
      goto LABEL_41;
    case 0x88B29129:
      v5 = &OBJC_CLASS___UARPTLVRequiredPersonalizationOption;
      goto LABEL_41;
    case 0x88B29130:
      v5 = &OBJC_CLASS___UARPTLVPersonalizedManifest;
      goto LABEL_41;
    case 0x88B29131:
      v5 = &OBJC_CLASS___UARPTLVPersonalizationLife;
      goto LABEL_41;
    case 0x88B29132:
      v5 = &OBJC_CLASS___UARPTLVPersonalizationProvisioning;
      goto LABEL_41;
    case 0x88B29133:
      v5 = &OBJC_CLASS___UARPTLVPersonalizationManifestEpoch;
      goto LABEL_41;
    case 0x88B29134:
      v5 = &OBJC_CLASS___UARPTLVPersonalizationManifestSuffix;
      goto LABEL_41;
    case 0x88B29135:
      v5 = &OBJC_CLASS___UARPTLVPersonalizationECIDData;
      goto LABEL_41;
    case 0x88B29136:
      v5 = &OBJC_CLASS___UARPTLVPersonalizationFTABSubfileDigestFilename;
LABEL_41:
      -[__objc2_class tlvWithLength:value:](v5, "tlvWithLength:value:", a4, a5);
      v6 = (UARPMetaDataTLV *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v6 = -[UARPMetaDataTLV initWithType:length:value:]( objc_alloc(&OBJC_CLASS___UARPMetaDataTLV),  "initWithType:length:value:",  *(void *)&a3,  *(void *)&a4,  a5);
      break;
  }

  return v6;
}

+ (id)tlvFromKey:(id)a3 value:(id)a4
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id v19 = a4;
  v6 = +[UARPMetaDataTLV metaDataTable](&OBJC_CLASS___UARPMetaDataTLV, "metaDataTable");
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    v9 = 0LL;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v6);
        }
        v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        [v12 objectForKeyedSubscript:@"Name"];
        objc_super v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (![v5 caseInsensitiveCompare:v13])
        {
          [v12 objectForKeyedSubscript:@"Value"];
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          unsigned int v15 = [v14 unsignedLongValue] + 2001563392;
          if (v15 <= 0x35 && ((0x3F036601FFFFFFuLL >> v15) & 1) != 0)
          {
            uint64_t v16 = -[__objc2_class tlvFromPropertyListValue:](*off_18A141D78[v15], "tlvFromPropertyListValue:", v19);
            v17 = v9;
            v9 = (void *)v16;
          }
        }
      }

      uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v8);
  }

  else
  {
    v9 = 0LL;
  }

  return v9;
}

+ (id)metaDataTable
{
  if (metaDataTable_once != -1) {
    dispatch_once(&metaDataTable_once, &__block_literal_global);
  }
  return (id)metaDataTable_table;
}

void __32__UARPMetaDataTLV_metaDataTable__block_invoke()
{
  id v39 = (id)objc_opt_new();
  v0 = +[UARPTLVPersonalizationRequired metaDataTableEntry]( &OBJC_CLASS___UARPTLVPersonalizationRequired,  "metaDataTableEntry");
  [v39 addObject:v0];
  v1 = +[UARPTLVPersonalizationPayloadTag metaDataTableEntry]( &OBJC_CLASS___UARPTLVPersonalizationPayloadTag,  "metaDataTableEntry");
  [v39 addObject:v1];
  v2 = +[UARPTLVPersonalizationSuperBinaryAssetID metaDataTableEntry]( &OBJC_CLASS___UARPTLVPersonalizationSuperBinaryAssetID,  "metaDataTableEntry");
  [v39 addObject:v2];

  +[UARPTLVPersonalizationManifestPrefix metaDataTableEntry]( &OBJC_CLASS___UARPTLVPersonalizationManifestPrefix,  "metaDataTableEntry");
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v39 addObject:v3];
  v4 = +[UARPTLVPersonalizationBoardID metaDataTableEntry](&OBJC_CLASS___UARPTLVPersonalizationBoardID, "metaDataTableEntry");
  [v39 addObject:v4];

  +[UARPTLVPersonalizationChipID metaDataTableEntry](&OBJC_CLASS___UARPTLVPersonalizationChipID, "metaDataTableEntry");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v39 addObject:v5];
  v6 = +[UARPTLVPersonalizationECID metaDataTableEntry](&OBJC_CLASS___UARPTLVPersonalizationECID, "metaDataTableEntry");
  [v39 addObject:v6];

  +[UARPTLVPersonalizationECIDData metaDataTableEntry]( &OBJC_CLASS___UARPTLVPersonalizationECIDData,  "metaDataTableEntry");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v39 addObject:v7];

  +[UARPTLVPersonalizationNonce metaDataTableEntry](&OBJC_CLASS___UARPTLVPersonalizationNonce, "metaDataTableEntry");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v39 addObject:v8];
  v9 = +[UARPTLVPersonalizationNonceHash metaDataTableEntry]( &OBJC_CLASS___UARPTLVPersonalizationNonceHash,  "metaDataTableEntry");
  [v39 addObject:v9];

  +[UARPTLVPersonalizationSecurityDomain metaDataTableEntry]( &OBJC_CLASS___UARPTLVPersonalizationSecurityDomain,  "metaDataTableEntry");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v39 addObject:v10];
  v11 = +[UARPTLVPersonalizationSecurityMode metaDataTableEntry]( &OBJC_CLASS___UARPTLVPersonalizationSecurityMode,  "metaDataTableEntry");
  [v39 addObject:v11];
  v12 = +[UARPTLVPersonalizationProductionMode metaDataTableEntry]( &OBJC_CLASS___UARPTLVPersonalizationProductionMode,  "metaDataTableEntry");
  [v39 addObject:v12];

  +[UARPTLVPersonalizationChipEpoch metaDataTableEntry]( &OBJC_CLASS___UARPTLVPersonalizationChipEpoch,  "metaDataTableEntry");
  objc_super v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v39 addObject:v13];
  v14 = +[UARPTLVPersonalizationEnableMixMatch metaDataTableEntry]( &OBJC_CLASS___UARPTLVPersonalizationEnableMixMatch,  "metaDataTableEntry");
  [v39 addObject:v14];

  +[UARPTLVPersonalizationSuperBinaryPayloadIndex metaDataTableEntry]( &OBJC_CLASS___UARPTLVPersonalizationSuperBinaryPayloadIndex,  "metaDataTableEntry");
  unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v39 addObject:v15];

  +[UARPTLVPersonalizationChipRevision metaDataTableEntry]( &OBJC_CLASS___UARPTLVPersonalizationChipRevision,  "metaDataTableEntry");
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v39 addObject:v16];
  v17 = +[UARPTLVPersonalizationFTABSubfileTag metaDataTableEntry]( &OBJC_CLASS___UARPTLVPersonalizationFTABSubfileTag,  "metaDataTableEntry");
  [v39 addObject:v17];
  v18 = +[UARPTLVPersonalizationFTABSubfileLongname metaDataTableEntry]( &OBJC_CLASS___UARPTLVPersonalizationFTABSubfileLongname,  "metaDataTableEntry");
  [v39 addObject:v18];

  +[UARPTLVPersonalizationFTABSubfileDigest metaDataTableEntry]( &OBJC_CLASS___UARPTLVPersonalizationFTABSubfileDigest,  "metaDataTableEntry");
  id v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v39 addObject:v19];

  +[UARPTLVPersonalizationFTABSubfileHashAlgorithm metaDataTableEntry]( &OBJC_CLASS___UARPTLVPersonalizationFTABSubfileHashAlgorithm,  "metaDataTableEntry");
  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v39 addObject:v20];

  +[UARPTLVPersonalizationFTABSubfileESEC metaDataTableEntry]( &OBJC_CLASS___UARPTLVPersonalizationFTABSubfileESEC,  "metaDataTableEntry");
  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue();
  [v39 addObject:v21];

  +[UARPTLVPersonalizationFTABSubfileEPRO metaDataTableEntry]( &OBJC_CLASS___UARPTLVPersonalizationFTABSubfileEPRO,  "metaDataTableEntry");
  __int128 v22 = (void *)objc_claimAutoreleasedReturnValue();
  [v39 addObject:v22];

  +[UARPTLVPersonalizationFTABSubfileTrusted metaDataTableEntry]( &OBJC_CLASS___UARPTLVPersonalizationFTABSubfileTrusted,  "metaDataTableEntry");
  __int128 v23 = (void *)objc_claimAutoreleasedReturnValue();
  [v39 addObject:v23];
  v24 = +[UARPTLVPersonalizationSoCLiveNonce metaDataTableEntry]( &OBJC_CLASS___UARPTLVPersonalizationSoCLiveNonce,  "metaDataTableEntry");
  [v39 addObject:v24];

  +[UARPTLVPersonalizationPrefixNeedsLogicalUnitNumber metaDataTableEntry]( &OBJC_CLASS___UARPTLVPersonalizationPrefixNeedsLogicalUnitNumber,  "metaDataTableEntry");
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
  [v39 addObject:v25];
  v26 = +[UARPTLVPersonalizationSuffixNeedsLogicalUnitNumber metaDataTableEntry]( &OBJC_CLASS___UARPTLVPersonalizationSuffixNeedsLogicalUnitNumber,  "metaDataTableEntry");
  [v39 addObject:v26];
  v27 = +[UARPTLVPersonalizationLogicalUnitNumber metaDataTableEntry]( &OBJC_CLASS___UARPTLVPersonalizationLogicalUnitNumber,  "metaDataTableEntry");
  [v39 addObject:v27];
  v28 = +[UARPTLVPersonalizationTicketNeedsLogicalUnitNumber metaDataTableEntry]( &OBJC_CLASS___UARPTLVPersonalizationTicketNeedsLogicalUnitNumber,  "metaDataTableEntry");
  [v39 addObject:v28];
  v29 = +[UARPTLVHostPersonalizationRequired metaDataTableEntry]( &OBJC_CLASS___UARPTLVHostPersonalizationRequired,  "metaDataTableEntry");
  [v39 addObject:v29];
  v30 = +[UARPTLVRequiredPersonalizationOption metaDataTableEntry]( &OBJC_CLASS___UARPTLVRequiredPersonalizationOption,  "metaDataTableEntry");
  [v39 addObject:v30];
  v31 = +[UARPTLVPersonalizationFTABPayload metaDataTableEntry]( &OBJC_CLASS___UARPTLVPersonalizationFTABPayload,  "metaDataTableEntry");
  [v39 addObject:v31];
  v32 = +[UARPTLVPersonalizedManifest metaDataTableEntry](&OBJC_CLASS___UARPTLVPersonalizedManifest, "metaDataTableEntry");
  [v39 addObject:v32];
  v33 = +[UARPTLVPersonalizationLife metaDataTableEntry](&OBJC_CLASS___UARPTLVPersonalizationLife, "metaDataTableEntry");
  [v39 addObject:v33];
  v34 = +[UARPTLVPersonalizationProvisioning metaDataTableEntry]( &OBJC_CLASS___UARPTLVPersonalizationProvisioning,  "metaDataTableEntry");
  [v39 addObject:v34];
  v35 = +[UARPTLVPersonalizationManifestEpoch metaDataTableEntry]( &OBJC_CLASS___UARPTLVPersonalizationManifestEpoch,  "metaDataTableEntry");
  [v39 addObject:v35];
  v36 = +[UARPTLVPersonalizationManifestSuffix metaDataTableEntry]( &OBJC_CLASS___UARPTLVPersonalizationManifestSuffix,  "metaDataTableEntry");
  [v39 addObject:v36];

  uint64_t v37 = [MEMORY[0x189603F18] arrayWithArray:v39];
  v38 = (void *)metaDataTable_table;
  metaDataTable_table = v37;
}

+ (id)tlvTypeName:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v20 = *MEMORY[0x1895F89C0];
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  +[UARPMetaDataTLV metaDataTable](&OBJC_CLASS___UARPMetaDataTLV, "metaDataTable");
  id obj = (id)objc_claimAutoreleasedReturnValue();
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
        uint64_t v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        [v8 objectForKeyedSubscript:@"Value"];
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        [MEMORY[0x189607968] numberWithUnsignedInt:v3];
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
        char v11 = [v9 isEqual:v10];

        if ((v11 & 1) != 0)
        {
          [v8 objectForKeyedSubscript:@"Name"];
          v12 = (void *)objc_claimAutoreleasedReturnValue();
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

  v12 = 0LL;
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
  [MEMORY[0x189603F48] dataWithData:v3];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

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