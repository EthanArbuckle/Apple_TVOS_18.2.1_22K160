@interface UARPSuperBinaryMetaDataTable
+ (unsigned)compressionAlgorithmFromString:(id)a3;
- (BOOL)expandPlist:(id *)a3;
- (BOOL)writeToURL:(id)a3 error:(id *)a4;
- (NSArray)values;
- (NSDictionary)dict;
- (NSNumber)formatVersion;
- (UARPSuperBinaryMetaDataTable)initWithDictionary:(id)a3;
- (UARPSuperBinaryMetaDataTable)initWithPlist:(id)a3;
- (id)createTLVWithType:(unint64_t)a3 keyValue:(id)a4 payloadsURL:(id)a5 isFilepath:(BOOL)a6;
- (id)initAppleSpecificWithFormatVersion:(id)a3;
- (id)initVendorAgnosticWithFormatVersion:(id)a3;
- (id)tlvArrayWithKey:(id)a3 keyValue:(id)a4 payloadsURL:(id)a5 error:(id *)a6;
- (id)tlvWithKey:(id)a3 keyValue:(id)a4 payloadsURL:(id)a5 error:(id *)a6;
- (void)addAnalyticsTLVs2;
- (void)addAppleSpecificTLVs;
- (void)addComposeTLVs2;
- (void)addDeviceSpecificTLVs2;
- (void)addHeySiriModelTLVs2;
- (void)addHostSpecificTLVs;
- (void)addHostSpecificTLVs2;
- (void)addLogsTLVs2;
- (void)addMappedAnalyticsTlvs;
- (void)addPersonalizationTLVs2;
- (void)addSysconfigTlvs;
- (void)addTLV:(unint64_t)a3 keyValue16:(id)a4 tlvArray:(id)a5;
- (void)addTLV:(unint64_t)a3 keyValue32:(id)a4 tlvArray:(id)a5;
- (void)addTLV:(unint64_t)a3 keyValue64:(id)a4 tlvArray:(id)a5;
- (void)addTLV:(unint64_t)a3 keyValue8:(id)a4 tlvArray:(id)a5;
- (void)addTLV:(unint64_t)a3 keyValue:(id)a4 tlvArray:(id)a5 payloadsURL:(id)a6 isFilepath:(BOOL)a7;
- (void)addTLV:(unint64_t)a3 legacyTLV:(unint64_t)a4 keyValue:(id)a5 tlvArray:(id)a6 payloadsURL:(id)a7 isFilepath:(BOOL)a8;
- (void)addTLV:(unint64_t)a3 versionString:(id)a4 tlvArray:(id)a5;
- (void)addTLVCompressPayloadAlgorithm:(id)a3 tlvArray:(id)a4;
- (void)addTLVs:(unint64_t)a3 excludedHwRevisions:(id)a4 tlvArray:(id)a5;
- (void)addVoiceAssistTLVs2;
@end

@implementation UARPSuperBinaryMetaDataTable

- (UARPSuperBinaryMetaDataTable)initWithPlist:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___UARPSuperBinaryMetaDataTable;
  v5 = -[UARPSuperBinaryMetaDataTable init](&v9, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    plist = v5->_plist;
    v5->_plist = (NSURL *)v6;
  }

  return v5;
}

- (UARPSuperBinaryMetaDataTable)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___UARPSuperBinaryMetaDataTable;
  v5 = -[UARPSuperBinaryMetaDataTable init](&v9, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    dict = v5->_dict;
    v5->_dict = (NSDictionary *)v6;
  }

  return v5;
}

- (id)initAppleSpecificWithFormatVersion:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___UARPSuperBinaryMetaDataTable;
  v5 = -[UARPSuperBinaryMetaDataTable init](&v11, sel_init);
  if (v5)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    values = v5->_values;
    v5->_values = v6;

    uint64_t v8 = [v4 copy];
    formatVersion = v5->_formatVersion;
    v5->_formatVersion = (NSNumber *)v8;

    if (-[NSNumber unsignedIntegerValue](v5->_formatVersion, "unsignedIntegerValue") == 1)
    {
      -[UARPSuperBinaryMetaDataTable addAppleSpecificTLVs](v5, "addAppleSpecificTLVs");
      -[UARPSuperBinaryMetaDataTable addHostSpecificTLVs](v5, "addHostSpecificTLVs");
    }

    else
    {
      -[UARPSuperBinaryMetaDataTable addDeviceSpecificTLVs2](v5, "addDeviceSpecificTLVs2");
      -[UARPSuperBinaryMetaDataTable addHeySiriModelTLVs2](v5, "addHeySiriModelTLVs2");
      -[UARPSuperBinaryMetaDataTable addPersonalizationTLVs2](v5, "addPersonalizationTLVs2");
      -[UARPSuperBinaryMetaDataTable addHostSpecificTLVs2](v5, "addHostSpecificTLVs2");
      -[UARPSuperBinaryMetaDataTable addVoiceAssistTLVs2](v5, "addVoiceAssistTLVs2");
      -[UARPSuperBinaryMetaDataTable addLogsTLVs2](v5, "addLogsTLVs2");
      -[UARPSuperBinaryMetaDataTable addAnalyticsTLVs2](v5, "addAnalyticsTLVs2");
      -[UARPSuperBinaryMetaDataTable addComposeTLVs2](v5, "addComposeTLVs2");
      -[UARPSuperBinaryMetaDataTable addSysconfigTlvs](v5, "addSysconfigTlvs");
    }
  }

  return v5;
}

- (id)initVendorAgnosticWithFormatVersion:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___UARPSuperBinaryMetaDataTable;
  v5 = -[UARPSuperBinaryMetaDataTable init](&v11, sel_init);
  if (v5)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    values = v5->_values;
    v5->_values = v6;

    uint64_t v8 = [v4 copy];
    formatVersion = v5->_formatVersion;
    v5->_formatVersion = (NSNumber *)v8;

    if (-[NSNumber unsignedIntegerValue](v5->_formatVersion, "unsignedIntegerValue") == 1)
    {
      -[UARPSuperBinaryMetaDataTable addHostSpecificTLVs](v5, "addHostSpecificTLVs");
    }

    else
    {
      -[UARPSuperBinaryMetaDataTable addDeviceSpecificTLVs2](v5, "addDeviceSpecificTLVs2");
      -[UARPSuperBinaryMetaDataTable addHostSpecificTLVs2](v5, "addHostSpecificTLVs2");
    }
  }

  return v5;
}

- (NSArray)values
{
  return (NSArray *)[MEMORY[0x189603F18] arrayWithArray:self->_values];
}

- (BOOL)writeToURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x189603FC8]);
  [v7 setObject:self->_values forKey:@"MetaData Values"];
  if (-[NSNumber unsignedIntegerValue](self->_formatVersion, "unsignedIntegerValue") >= 2) {
    [v7 setObject:self->_formatVersion forKey:@"MetaData Format Version"];
  }
  char v8 = [v7 writeToURL:v6 error:a4];

  return v8;
}

- (BOOL)expandPlist:(id *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = v5;
  if (!v5)
  {
    [NSString stringWithFormat:@"cannot expand metadata plist"];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_opt_new();
    [v14 setObject:v13 forKeyedSubscript:*MEMORY[0x1896075E0]];
    v15 = (void *)[objc_alloc(MEMORY[0x189607870]) initWithDomain:@"com.apple.uarp" code:5 userInfo:v14];
    v16 = v15;
    if (a3) {
      *a3 = v15;
    }

    goto LABEL_7;
  }

  id v7 = (void *)MEMORY[0x189603FA8];
  [v5 objectForKeyedSubscript:@"MetaData Values"];
  char v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 arrayWithArray:v8];
  objc_super v9 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  values = self->_values;
  self->_values = v9;

  [v6 objectForKeyedSubscript:@"MetaData Format Version"];
  objc_super v11 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  formatVersion = self->_formatVersion;
  self->_formatVersion = v11;

  v13 = self->_formatVersion;
  if (!v13)
  {
    self->_formatVersion = (NSNumber *)&unk_18A15FE88;
LABEL_7:
  }

  return v6 != 0LL;
}

- (id)tlvWithKey:(id)a3 keyValue:(id)a4 payloadsURL:(id)a5 error:(id *)a6
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 firstObject];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)tlvArrayWithKey:(id)a3 keyValue:(id)a4 payloadsURL:(id)a5 error:(id *)a6
{
  id v41 = a3;
  id v39 = a4;
  id v36 = a5;
  id v38 = objc_alloc_init(MEMORY[0x189603FA8]);
  uint64_t v9 = -[NSMutableArray count](self->_values, "count");
  if (!v9) {
    goto LABEL_57;
  }
  uint64_t v10 = v9;
  uint64_t v11 = 0LL;
  uint64_t v40 = v9;
  unint64_t v12 = 0x189607000uLL;
  unint64_t v13 = 0x189603000uLL;
  while (1)
  {
    v14 = -[NSMutableArray objectAtIndex:](self->_values, "objectAtIndex:", v11, v36);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      id v15 = v14;
      v16 = 0LL;
      uint64_t v17 = 0LL;
      uint64_t v18 = v11;
    }

    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v16 = 0LL;
        id v15 = 0LL;
        goto LABEL_12;
      }

      unint64_t v19 = v12;
      v20 = self;
      unint64_t v21 = v13;
      id v22 = v14;
      [v22 objectForKey:@"Filepath"];
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v17 = [v23 BOOLValue];
      [v22 objectForKey:@"Name"];
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      [v22 objectForKey:@"Value"];
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      uint64_t v18 = v11;
      if (v16) {
        uint64_t v18 = [v16 unsignedIntegerValue];
      }

      unint64_t v13 = v21;
      self = v20;
      unint64_t v12 = v19;
      uint64_t v10 = v40;
    }

- (void)addAppleSpecificTLVs
{
  id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
  [v3 setObject:@"Payload Certificate" forKeyedSubscript:@"Name"];
  uint64_t v4 = MEMORY[0x189604A88];
  [v3 setObject:MEMORY[0x189604A88] forKeyedSubscript:@"Filepath"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v3);
  id v5 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v5 setObject:@"Payload Signature" forKeyedSubscript:@"Name"];
  [v5 setObject:v4 forKeyedSubscript:@"Filepath"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v5);
  id v6 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v6 setObject:@"Payload Hash" forKeyedSubscript:@"Name"];
  [v6 setObject:v4 forKeyedSubscript:@"Filepath"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v6);
  -[NSMutableArray addObject:](self->_values, "addObject:", @"Personalization Required");
  -[NSMutableArray addObject:](self->_values, "addObject:", @"Personalization Payload Tag");
  -[NSMutableArray addObject:](self->_values, "addObject:", @"Personalization SuperBinary AssetID");
  -[NSMutableArray addObject:](self->_values, "addObject:", @"Personalization Manifest Prefix");
}

- (void)addDeviceSpecificTLVs2
{
  id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
  [v3 setObject:@"Payload Filepath" forKeyedSubscript:@"Name"];
  [v3 setObject:&unk_18A15FEA0 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v3);
  id v4 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v4 setObject:@"Payload Long Name" forKeyedSubscript:@"Name"];
  [v4 setObject:&unk_18A15FEB8 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v4);
  id v5 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v5 setObject:@"Minimum Required Version" forKeyedSubscript:@"Name"];
  [v5 setObject:&unk_18A15FED0 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v5);
  id v6 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v6 setObject:@"Ignore Version" forKeyedSubscript:@"Name"];
  [v6 setObject:&unk_18A15FEE8 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v6);
  id v7 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v7 setObject:@"Urgent Update" forKeyedSubscript:@"Name"];
  [v7 setObject:&unk_18A15FF00 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v7);
  id v8 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v8 setObject:@"Payload Certificate" forKeyedSubscript:@"Name"];
  [v8 setObject:&unk_18A15FF18 forKeyedSubscript:@"Value"];
  uint64_t v9 = MEMORY[0x189604A88];
  [v8 setObject:MEMORY[0x189604A88] forKeyedSubscript:@"Filepath"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v8);
  id v10 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v10 setObject:@"Payload Signature" forKeyedSubscript:@"Name"];
  [v10 setObject:&unk_18A15FF30 forKeyedSubscript:@"Value"];
  [v10 setObject:v9 forKeyedSubscript:@"Filepath"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v10);
  id v11 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v11 setObject:@"Payload Hash" forKeyedSubscript:@"Name"];
  [v11 setObject:&unk_18A15FF48 forKeyedSubscript:@"Value"];
  [v11 setObject:v9 forKeyedSubscript:@"Filepath"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v11);
  id v12 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v12 setObject:@"Payload Digest" forKeyedSubscript:@"Name"];
  [v12 setObject:&unk_18A15FF60 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v12);
  id v13 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v13 setObject:@"Minimum Battery Level" forKeyedSubscript:@"Name"];
  [v13 setObject:&unk_18A15FF78 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v13);
  id v14 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v14 setObject:@"Trigger Battery Level" forKeyedSubscript:@"Name"];
  [v14 setObject:&unk_18A15FF90 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v14);
  id v15 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v15 setObject:@"Payload Compression ChunkSize" forKeyedSubscript:@"Name"];
  [v15 setObject:&unk_18A15FFA8 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v15);
  id v16 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v16 setObject:@"Payload Compression Algorithm" forKeyedSubscript:@"Name"];
  [v16 setObject:&unk_18A15FFC0 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v16);
  id v17 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v17 setObject:@"Flash Partition Bitmap" forKeyedSubscript:@"Name"];
  [v17 setObject:&unk_18A15FFD8 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v17);
  id v18 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v18 setObject:@"Flash Partition Boot" forKeyedSubscript:@"Name"];
  [v18 setObject:&unk_18A15FFF0 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v18);
  id v19 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v19 setObject:@"Compressed Headers Payload Index" forKeyedSubscript:@"Name"];
  [v19 setObject:&unk_18A160008 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v19);
  id v20 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v20 setObject:@"Erase Option" forKeyedSubscript:@"Name"];
  [v20 setObject:&unk_18A160020 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v20);
  id v21 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v21 setObject:@"Payload Expand Filename" forKeyedSubscript:@"Name"];
  [v21 setObject:&unk_18A160038 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v21);
  id v22 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v22 setObject:@"Payload Hash Algorithm" forKeyedSubscript:@"Name"];
  [v22 setObject:&unk_18A160050 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v22);
  id v23 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v23 setObject:@"Compressed Headers" forKeyedSubscript:@"Name"];
  [v23 setObject:&unk_18A160068 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v23);
  id v24 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v24 setObject:@"Payload Description" forKeyedSubscript:@"Name"];
  [v24 setObject:&unk_18A160080 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v24);
  id v25 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v25 setObject:@"Payload Signature (Development)" forKeyedSubscript:@"Name"];
  [v25 setObject:&unk_18A160098 forKeyedSubscript:@"Value"];
  [v25 setObject:v9 forKeyedSubscript:@"Filepath"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v25);
  id v26 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v26 setObject:@"Device Specific Data" forKeyedSubscript:@"Name"];
  [v26 setObject:&unk_18A1600B0 forKeyedSubscript:@"Value"];
  [v26 setObject:v9 forKeyedSubscript:@"Filepath"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v26);
  id v27 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v27 setObject:@"MetaData Hash Algorithm" forKeyedSubscript:@"Name"];
  [v27 setObject:&unk_18A1600C8 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v27);
  id v28 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v28 setObject:@"MetaData Hash" forKeyedSubscript:@"Name"];
  [v28 setObject:&unk_18A1600E0 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v28);
  id v29 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v29 setObject:@"Uncompressed Payload Length" forKeyedSubscript:@"Name"];
  [v29 setObject:&unk_18A1600F8 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v29);
  id v30 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v30 setObject:@"No Compressed Headers" forKeyedSubscript:@"Name"];
  [v30 setObject:&unk_18A160110 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v30);
}

- (void)addHostSpecificTLVs
{
}

- (void)addHeySiriModelTLVs2
{
  id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
  [v3 setObject:@"HeySiri Model Type" forKeyedSubscript:@"Name"];
  [v3 setObject:&unk_18A160128 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v3);
  id v4 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v4 setObject:@"HeySiri Model Locale" forKeyedSubscript:@"Name"];
  [v4 setObject:&unk_18A160140 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v4);
  id v5 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v5 setObject:@"HeySiri Model Hash" forKeyedSubscript:@"Name"];
  [v5 setObject:&unk_18A160158 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v5);
  id v6 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v6 setObject:@"HeySiri Model Role" forKeyedSubscript:@"Name"];
  [v6 setObject:&unk_18A160170 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v6);
  id v7 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v7 setObject:@"HeySiri Model Digest" forKeyedSubscript:@"Name"];
  [v7 setObject:&unk_18A160188 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v7);
  id v8 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v8 setObject:@"HeySiri Model Signature" forKeyedSubscript:@"Name"];
  [v8 setObject:&unk_18A1601A0 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v8);
  id v9 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v9 setObject:@"HeySiri Model Certificate" forKeyedSubscript:@"Name"];
  [v9 setObject:&unk_18A1601B8 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v9);
  id v10 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v10 setObject:@"HeySiri Model Engine Version" forKeyedSubscript:@"Name"];
  [v10 setObject:&unk_18A1601D0 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v10);
  id v11 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v11 setObject:@"HeySiri Model Engine Type" forKeyedSubscript:@"Name"];
  [v11 setObject:&unk_18A1601E8 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v11);
}

- (void)addVoiceAssistTLVs2
{
  id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
  [v3 setObject:@"Voice Assist Type" forKeyedSubscript:@"Name"];
  [v3 setObject:&unk_18A160200 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v3);
  id v4 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v4 setObject:@"Voice Assist Locale" forKeyedSubscript:@"Name"];
  [v4 setObject:&unk_18A160218 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v4);
  id v5 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v5 setObject:@"Voice Assist Hash" forKeyedSubscript:@"Name"];
  [v5 setObject:&unk_18A160230 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v5);
  id v6 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v6 setObject:@"Voice Assist Role" forKeyedSubscript:@"Name"];
  [v6 setObject:&unk_18A160248 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v6);
  id v7 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v7 setObject:@"Voice Assist Digest" forKeyedSubscript:@"Name"];
  [v7 setObject:&unk_18A160260 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v7);
  id v8 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v8 setObject:@"Voice Assist Signature" forKeyedSubscript:@"Name"];
  [v8 setObject:&unk_18A160278 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v8);
  id v9 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v9 setObject:@"Voice Assist Certificate" forKeyedSubscript:@"Name"];
  [v9 setObject:&unk_18A160290 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v9);
  id v10 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v10 setObject:@"Voice Assist Engine Version" forKeyedSubscript:@"Name"];
  [v10 setObject:&unk_18A1602A8 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v10);
}

- (void)addPersonalizationTLVs2
{
  id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
  [v3 setObject:@"Personalization Required" forKeyedSubscript:@"Name"];
  [v3 setObject:&unk_18A1602C0 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v3);
  id v4 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v4 setObject:@"Personalization Payload Tag" forKeyedSubscript:@"Name"];
  [v4 setObject:&unk_18A1602D8 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v4);
  id v5 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v5 setObject:@"Personalization SuperBinary AssetID" forKeyedSubscript:@"Name"];
  [v5 setObject:&unk_18A1602F0 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v5);
  id v6 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v6 setObject:@"Personalization Manifest Prefix" forKeyedSubscript:@"Name"];
  [v6 setObject:&unk_18A160308 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v6);
  id v7 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v7 setObject:@"Personalization Board ID" forKeyedSubscript:@"Name"];
  [v7 setObject:&unk_18A160320 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v7);
  id v8 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v8 setObject:@"Personalization Chip ID" forKeyedSubscript:@"Name"];
  [v8 setObject:&unk_18A160338 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v8);
  id v9 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v9 setObject:@"Personalization ECID" forKeyedSubscript:@"Name"];
  [v9 setObject:&unk_18A160350 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v9);
  id v10 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v10 setObject:@"Personalization ECID Data" forKeyedSubscript:@"Name"];
  [v10 setObject:&unk_18A160368 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v10);
  id v11 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v11 setObject:@"Personalization Nonce" forKeyedSubscript:@"Name"];
  [v11 setObject:&unk_18A160380 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v11);
  id v12 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v12 setObject:@"Personalization Nonce Hash" forKeyedSubscript:@"Name"];
  [v12 setObject:&unk_18A160398 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v12);
  id v13 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v13 setObject:@"Personalization Security Domain" forKeyedSubscript:@"Name"];
  [v13 setObject:&unk_18A1603B0 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v13);
  id v14 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v14 setObject:@"Personalization Security Mode" forKeyedSubscript:@"Name"];
  [v14 setObject:&unk_18A1603C8 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v14);
  id v15 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v15 setObject:@"Personalization Production Mode" forKeyedSubscript:@"Name"];
  [v15 setObject:&unk_18A1603E0 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v15);
  id v16 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v16 setObject:@"Personalization Chip Epoch" forKeyedSubscript:@"Name"];
  [v16 setObject:&unk_18A1603F8 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v16);
  id v17 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v17 setObject:@"Personalization Enable Mix Match" forKeyedSubscript:@"Name"];
  [v17 setObject:&unk_18A160410 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v17);
  id v18 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v18 setObject:@"Personalization SuperBinary Payload Index" forKeyedSubscript:@"Name"];
  [v18 setObject:&unk_18A160428 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v18);
  id v19 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v19 setObject:@"Personalization Chip Revision" forKeyedSubscript:@"Name"];
  [v19 setObject:&unk_18A160440 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v19);
  id v20 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v20 setObject:@"Personalization FTAB Payload" forKeyedSubscript:@"Name"];
  [v20 setObject:&unk_18A160458 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v20);
  id v21 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v21 setObject:@"Personalization FTAB Payload Tag" forKeyedSubscript:@"Name"];
  [v21 setObject:&unk_18A160470 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v21);
  id v22 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v22 setObject:@"Personalization FTAB Payload Longname" forKeyedSubscript:@"Name"];
  [v22 setObject:&unk_18A160488 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v22);
  id v23 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v23 setObject:@"Personalization FTAB Payload Digest" forKeyedSubscript:@"Name"];
  [v23 setObject:&unk_18A1604A0 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v23);
  id v24 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v24 setObject:@"Personalization FTAB Payload Hash Algorithm" forKeyedSubscript:@"Name"];
  [v24 setObject:&unk_18A1604B8 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v24);
  id v25 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v25 setObject:@"Personalization FTAB Payload Security Mode" forKeyedSubscript:@"Name"];
  [v25 setObject:&unk_18A1604D0 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v25);
  id v26 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v26 setObject:@"Personalization FTAB Payload Production Mode" forKeyedSubscript:@"Name"];
  [v26 setObject:&unk_18A1604E8 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v26);
  id v27 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v27 setObject:@"Personalization FTAB Payload Trusted" forKeyedSubscript:@"Name"];
  [v27 setObject:&unk_18A160500 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v27);
  id v28 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v28 setObject:@"Personalization SoC Live Nonce" forKeyedSubscript:@"Name"];
  [v28 setObject:&unk_18A160518 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v28);
  id v29 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v29 setObject:@"Personalization FTAB Payload Security Mode Host Override" forKeyedSubscript:@"Name"];
  [v29 setObject:&unk_18A160530 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v29);
  id v30 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v30 setObject:@"Personalization FTAB Payload Production Mode Host Override" forKeyedSubscript:@"Name"];
  [v30 setObject:&unk_18A160548 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v30);
  id v31 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v31 setObject:@"Personalization Payload Hash Algorithm" forKeyedSubscript:@"Name"];
  [v31 setObject:&unk_18A1604B8 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v31);
  id v32 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v32 setObject:@"Personalization Payload Longname" forKeyedSubscript:@"Name"];
  [v32 setObject:&unk_18A160488 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v32);
  id v33 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v33 setObject:@"Personalization Payload Effective Security Mode" forKeyedSubscript:@"Name"];
  [v33 setObject:&unk_18A1604D0 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v33);
  id v34 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v34 setObject:@"Personalization Payload Effective Production Mode" forKeyedSubscript:@"Name"];
  [v34 setObject:&unk_18A1604E8 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v34);
  id v35 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v35 setObject:@"Personalization Payload Trusted" forKeyedSubscript:@"Name"];
  [v35 setObject:&unk_18A160500 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v35);
  id v36 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v36 setObject:@"Personalization Payload Digest" forKeyedSubscript:@"Name"];
  [v36 setObject:&unk_18A1604A0 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v36);
  id v37 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v37 setObject:@"Personalization Board ID (64 bits)" forKeyedSubscript:@"Name"];
  [v37 setObject:&unk_18A160560 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v37);
  id v38 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v38 setObject:@"Personalization Matching Data" forKeyedSubscript:@"Name"];
  [v38 setObject:&unk_18A160578 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v38);
  id v39 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v39 setObject:@"Personalization Matching Data Product Revision Minimum" forKeyedSubscript:@"Name"];
  [v39 setObject:&unk_18A160590 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v39);
  id v40 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v40 setObject:@"Personalization Matching Data Product Revision Maximum" forKeyedSubscript:@"Name"];
  [v40 setObject:&unk_18A1605A8 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v40);
  id v41 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v41 setObject:@"Personalization Matching Data Payload Tags" forKeyedSubscript:@"Name"];
  [v41 setObject:&unk_18A1605C0 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v41);
  id v42 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v42 setObject:@"Personalization Digest List Size" forKeyedSubscript:@"Name"];
  [v42 setObject:&unk_18A1605D8 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v42);
  id v43 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v43 setObject:@"Personalization Prefix Needs Logical Unit Number" forKeyedSubscript:@"Name"];
  [v43 setObject:&unk_18A1605F0 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v43);
  id v44 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v44 setObject:@"Personalization Suffix Needs Logical Unit Number" forKeyedSubscript:@"Name"];
  [v44 setObject:&unk_18A160608 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v44);
  id v45 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v45 setObject:@"Personalization Payload Demotion Security Mode" forKeyedSubscript:@"Name"];
  [v45 setObject:&unk_18A160620 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v45);
  id v46 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v46 setObject:@"Personalization Payload Demotion Production Mode" forKeyedSubscript:@"Name"];
  [v46 setObject:&unk_18A160638 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v46);
  id v47 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v47 setObject:@"Personalization Logical Unit Number" forKeyedSubscript:@"Name"];
  [v47 setObject:&unk_18A160650 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v47);
  id v48 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v48 setObject:@"Personalization Ticket Needs Logical Unit Number" forKeyedSubscript:@"Name"];
  [v48 setObject:&unk_18A160668 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v48);
  id v49 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v49 setObject:@"Personalization More Requests to Follow" forKeyedSubscript:@"Name"];
  [v49 setObject:&unk_18A160680 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v49);
  id v50 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v50 setObject:@"Host Personalization Required" forKeyedSubscript:@"Name"];
  [v50 setObject:&unk_18A160698 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v50);
  id v51 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v51 setObject:@"Required Personalization Option" forKeyedSubscript:@"Name"];
  [v51 setObject:&unk_18A1606B0 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v51);
  id v52 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v52 setObject:@"Personalized Manifest" forKeyedSubscript:@"Name"];
  [v52 setObject:&unk_18A1606C8 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v52);
  id v53 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v53 setObject:@"Personalization Life" forKeyedSubscript:@"Name"];
  [v53 setObject:&unk_18A1606E0 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v53);
  id v54 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v54 setObject:@"Personalization Provisioning" forKeyedSubscript:@"Name"];
  [v54 setObject:&unk_18A1606F8 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v54);
  id v55 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v55 setObject:@"Personalization Manifest Epoch" forKeyedSubscript:@"Name"];
  [v55 setObject:&unk_18A160710 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v55);
  id v56 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v56 setObject:@"Personalization Manifest Suffix" forKeyedSubscript:@"Name"];
  [v56 setObject:&unk_18A160728 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v56);
  id v57 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v57 setObject:@"Personalization FTAB Payload Digest Filename" forKeyedSubscript:@"Name"];
  [v57 setObject:&unk_18A160740 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v57);
  id v58 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v58 setObject:@"Personalization Payload Digest Filename" forKeyedSubscript:@"Name"];
  [v58 setObject:&unk_18A160740 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v58);
}

- (void)addHostSpecificTLVs2
{
  id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
  [v3 setObject:@"Host Minimum Battery Level" forKeyedSubscript:@"Name"];
  [v3 setObject:&unk_18A160758 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v3);
  id v4 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v4 setObject:@"Host Inactive To Stage Asset" forKeyedSubscript:@"Name"];
  [v4 setObject:&unk_18A160770 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v4);
  id v5 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v5 setObject:@"Host Inactive To Apply Asset" forKeyedSubscript:@"Name"];
  [v5 setObject:&unk_18A160788 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v5);
  id v6 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v6 setObject:@"Host Network Delay" forKeyedSubscript:@"Name"];
  [v6 setObject:&unk_18A1607A0 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v6);
  id v7 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v7 setObject:@"Host Reconnect After Apply" forKeyedSubscript:@"Name"];
  [v7 setObject:&unk_18A1607B8 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v7);
  id v8 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v8 setObject:@"Minimum iOS Version" forKeyedSubscript:@"Name"];
  [v8 setObject:&unk_18A1607D0 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v8);
  id v9 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v9 setObject:@"Minimum macOS Version" forKeyedSubscript:@"Name"];
  [v9 setObject:&unk_18A1607E8 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v9);
  id v10 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v10 setObject:@"Minimum tvOS Version" forKeyedSubscript:@"Name"];
  [v10 setObject:&unk_18A160800 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v10);
  id v11 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v11 setObject:@"Minimum watchOS Version" forKeyedSubscript:@"Name"];
  [v11 setObject:&unk_18A160818 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v11);
  id v12 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v12 setObject:@"Host Trigger Battery Level" forKeyedSubscript:@"Name"];
  [v12 setObject:&unk_18A160830 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v12);
  id v13 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v13 setObject:@"Excluded Hardware Version" forKeyedSubscript:@"Name"];
  [v13 setObject:&unk_18A160848 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v13);
}

- (void)addLogsTLVs2
{
  id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
  [v3 setObject:@"Log Friendly Name" forKeyedSubscript:@"Name"];
  [v3 setObject:&unk_18A160860 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v3);
  id v4 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v4 setObject:@"Log Apple Model Number" forKeyedSubscript:@"Name"];
  [v4 setObject:&unk_18A160878 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v4);
  id v5 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v5 setObject:@"Log Serial Number" forKeyedSubscript:@"Name"];
  [v5 setObject:&unk_18A160890 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v5);
}

- (void)addAnalyticsTLVs2
{
  id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
  [v3 setObject:@"Analytics Event Name" forKeyedSubscript:@"Name"];
  [v3 setObject:&unk_18A1608A8 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v3);
  id v4 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v4 setObject:@"Analytics Payload Type" forKeyedSubscript:@"Name"];
  [v4 setObject:&unk_18A1608C0 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v4);
}

- (void)addComposeTLVs2
{
  id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
  [v3 setObject:@"Compose Payload Hash Algorithm" forKeyedSubscript:@"Name"];
  [v3 setObject:&unk_18A1608D8 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v3);
  id v4 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v4 setObject:@"Compose Measured Payloads" forKeyedSubscript:@"Name"];
  [v4 setObject:&unk_18A1608F0 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v4);
  id v5 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v5 setObject:@"Compose Measured Payloads (Non-FTAB)" forKeyedSubscript:@"Name"];
  [v5 setObject:&unk_18A160908 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v5);
  id v6 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v6 setObject:@"Compose MetaData Hash Algorithm" forKeyedSubscript:@"Name"];
  [v6 setObject:&unk_18A160920 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v6);
  id v7 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v7 setObject:@"Personalization Options Required" forKeyedSubscript:@"Name"];
  [v7 setObject:&unk_18A160938 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v7);
  id v8 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v8 setObject:@"Version File" forKeyedSubscript:@"Name"];
  [v8 setObject:&unk_18A160950 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v8);
  id v9 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v9 setObject:@"Version BVER File" forKeyedSubscript:@"Name"];
  [v9 setObject:&unk_18A160968 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v9);
  id v10 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v10 setObject:@"Property List Payload" forKeyedSubscript:@"Name"];
  [v10 setObject:&unk_18A160980 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v10);
}

- (void)addMappedAnalyticsTlvs
{
  id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
  [v3 setObject:@"Log Apple Model Number" forKeyedSubscript:@"Name"];
  [v3 setObject:&unk_18A160998 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v3);
  id v4 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v4 setObject:@"Mapped Analytics Event ID" forKeyedSubscript:@"Name"];
  [v4 setObject:&unk_18A1609B0 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v4);
}

- (void)addSysconfigTlvs
{
  id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
  [v3 setObject:@"Sysconfig Region Code" forKeyedSubscript:@"Name"];
  [v3 setObject:&unk_18A1609C8 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v3);
  id v4 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v4 setObject:@"Sysconfig Manufacturing Part Number" forKeyedSubscript:@"Name"];
  [v4 setObject:&unk_18A1609E0 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v4);
  id v5 = objc_alloc_init(MEMORY[0x189603FC8]);

  [v5 setObject:@"Sysconfig Regulatory Model Number" forKeyedSubscript:@"Name"];
  [v5 setObject:&unk_18A1609F8 forKeyedSubscript:@"Value"];
  -[NSMutableArray addObject:](self->_values, "addObject:", v5);
}

- (id)createTLVWithType:(unint64_t)a3 keyValue:(id)a4 payloadsURL:(id)a5 isFilepath:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a4;
  id v10 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && v6)
  {
    [MEMORY[0x189604030] fileURLWithPath:v9 relativeToURL:v10];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    id v12 = -[UARPSuperBinaryAssetTLV initWithType:urlValue:]( objc_alloc(&OBJC_CLASS___UARPSuperBinaryAssetTLV),  "initWithType:urlValue:",  a3,  v11);
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      id v13 = -[UARPSuperBinaryAssetTLV initWithType:stringValue:]( objc_alloc(&OBJC_CLASS___UARPSuperBinaryAssetTLV),  "initWithType:stringValue:",  a3,  v9);
    }

    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        id v13 = -[UARPSuperBinaryAssetTLV initWithType:unsignedInt32:]( [UARPSuperBinaryAssetTLV alloc],  "initWithType:unsignedInt32:",  a3,  [v9 unsignedLongValue]);
      }

      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v12 = 0LL;
          goto LABEL_11;
        }

        id v13 = -[UARPSuperBinaryAssetTLV initWithType:dataValue:]( objc_alloc(&OBJC_CLASS___UARPSuperBinaryAssetTLV),  "initWithType:dataValue:",  a3,  v9);
      }
    }

    id v12 = v13;
  }

+ (unsigned)compressionAlgorithmFromString:(id)a3
{
  return 0;
}

- (void)addTLV:(unint64_t)a3 keyValue:(id)a4 tlvArray:(id)a5 payloadsURL:(id)a6 isFilepath:(BOOL)a7
{
  BOOL v7 = a7;
  id v13 = a5;
  -[UARPSuperBinaryMetaDataTable createTLVWithType:keyValue:payloadsURL:isFilepath:]( self,  "createTLVWithType:keyValue:payloadsURL:isFilepath:",  a3,  a4,  a6,  v7);
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12) {
    [v13 addObject:v12];
  }
}

- (void)addTLV:(unint64_t)a3 legacyTLV:(unint64_t)a4 keyValue:(id)a5 tlvArray:(id)a6 payloadsURL:(id)a7 isFilepath:(BOOL)a8
{
  BOOL v8 = a8;
  id v16 = a5;
  id v14 = a6;
  id v15 = a7;
  -[UARPSuperBinaryMetaDataTable addTLV:keyValue:tlvArray:payloadsURL:isFilepath:]( self,  "addTLV:keyValue:tlvArray:payloadsURL:isFilepath:",  a3,  v16,  v14,  v15,  v8);
  if (-[NSNumber unsignedIntegerValue](self->_formatVersion, "unsignedIntegerValue") <= 2) {
    -[UARPSuperBinaryMetaDataTable addTLV:keyValue:tlvArray:payloadsURL:isFilepath:]( self,  "addTLV:keyValue:tlvArray:payloadsURL:isFilepath:",  a4,  v16,  v14,  v15,  v8);
  }
}

- (void)addTLV:(unint64_t)a3 keyValue8:(id)a4 tlvArray:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v9 = -[UARPSuperBinaryAssetTLV initWithType:unsignedInt8:]( [UARPSuperBinaryAssetTLV alloc],  "initWithType:unsignedInt8:",  a3,  [v7 unsignedCharValue]);
    [v8 addObject:v9];
  }

  else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
  {
    -[UARPSuperBinaryMetaDataTable addTLV:keyValue8:tlvArray:].cold.1();
  }
}

- (void)addTLV:(unint64_t)a3 keyValue16:(id)a4 tlvArray:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v9 = -[UARPSuperBinaryAssetTLV initWithType:unsignedInt16:]( [UARPSuperBinaryAssetTLV alloc],  "initWithType:unsignedInt16:",  a3,  [v7 unsignedShortValue]);
    [v8 addObject:v9];
  }

  else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
  {
    -[UARPSuperBinaryMetaDataTable addTLV:keyValue8:tlvArray:].cold.1();
  }
}

- (void)addTLV:(unint64_t)a3 keyValue32:(id)a4 tlvArray:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v9 = -[UARPSuperBinaryAssetTLV initWithType:unsignedInt32:]( [UARPSuperBinaryAssetTLV alloc],  "initWithType:unsignedInt32:",  a3,  [v7 unsignedLongValue]);
    [v8 addObject:v9];
  }

  else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
  {
    -[UARPSuperBinaryMetaDataTable addTLV:keyValue8:tlvArray:].cold.1();
  }
}

- (void)addTLV:(unint64_t)a3 keyValue64:(id)a4 tlvArray:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v9 = -[UARPSuperBinaryAssetTLV initWithType:unsignedInt64:]( [UARPSuperBinaryAssetTLV alloc],  "initWithType:unsignedInt64:",  a3,  [v7 unsignedLongLongValue]);
    [v8 addObject:v9];
  }

  else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
  {
    -[UARPSuperBinaryMetaDataTable addTLV:keyValue8:tlvArray:].cold.1();
  }
}

- (void)addTLVCompressPayloadAlgorithm:(id)a3 tlvArray:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    unsigned int v8 = +[UARPSuperBinaryMetaDataTable compressionAlgorithmFromString:]( &OBJC_CLASS___UARPSuperBinaryMetaDataTable,  "compressionAlgorithmFromString:",  v6);
    [MEMORY[0x189607968] numberWithUnsignedLong:v8];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPSuperBinaryMetaDataTable addTLV:keyValue32:tlvArray:]( self,  "addTLV:keyValue32:tlvArray:",  3436347660LL,  v9,  v7);
  }

  else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
  {
    -[UARPSuperBinaryMetaDataTable addTLVCompressPayloadAlgorithm:tlvArray:].cold.1();
  }
}

- (void)addTLV:(unint64_t)a3 versionString:(id)a4 tlvArray:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[UARPSuperBinaryAsset versionFromString:version:]( &OBJC_CLASS___UARPSuperBinaryAsset,  "versionFromString:version:",  v7,  v10);
    id v9 = -[UARPSuperBinaryAssetTLV initWithType:version:]( objc_alloc(&OBJC_CLASS___UARPSuperBinaryAssetTLV),  "initWithType:version:",  a3,  v10);
    [v8 addObject:v9];
  }

  else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
  {
    -[UARPSuperBinaryMetaDataTable addTLV:versionString:tlvArray:].cold.1();
  }
}

- (void)addTLVs:(unint64_t)a3 excludedHwRevisions:(id)a4 tlvArray:(id)a5
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v7 = a4;
  id v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v18;
      do
      {
        uint64_t v13 = 0LL;
        do
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * v13);
          id v15 = objc_alloc(&OBJC_CLASS___UARPSuperBinaryAssetTLV);
          id v16 = -[UARPSuperBinaryAssetTLV initWithType:stringValue:]( v15,  "initWithType:stringValue:",  a3,  v14,  (void)v17);
          [v8 addObject:v16];

          ++v13;
        }

        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }

      while (v11);
    }
  }

  else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
  {
    -[UARPSuperBinaryMetaDataTable addTLVs:excludedHwRevisions:tlvArray:].cold.1();
  }
}

- (NSNumber)formatVersion
{
  return (NSNumber *)objc_getProperty(self, a2, 24LL, 1);
}

- (NSDictionary)dict
{
  return (NSDictionary *)objc_getProperty(self, a2, 32LL, 1);
}

- (void).cxx_destruct
{
}

- (void)addTLV:keyValue8:tlvArray:.cold.1()
{
}

- (void)addTLVCompressPayloadAlgorithm:tlvArray:.cold.1()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl( &dword_187DC0000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "invalid plist, trying to use non-string to add compression algorithm",  v0,  2u);
}

- (void)addTLV:versionString:tlvArray:.cold.1()
{
}

- (void)addTLVs:excludedHwRevisions:tlvArray:.cold.1()
{
}

@end