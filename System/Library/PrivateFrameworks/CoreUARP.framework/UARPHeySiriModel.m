@interface UARPHeySiriModel
+ (id)hsModelWithUarpPayload:(id)a3;
+ (id)uarpPayloadWithHSModel:(id)a3;
- (BOOL)expandURL:(id *)a3;
- (NSArray)downloadedModels;
- (NSArray)fallbackModels;
- (NSArray)newModels;
- (NSArray)preInstalledModels;
- (UARPHeySiriModel)initWithURL:(id)a3;
- (id)exportAsSuperBinary:(id *)a3;
- (unint64_t)engineType;
- (unint64_t)majorVersion;
- (unint64_t)minorVersion;
- (void)addHeySiriDownloadedModel:(id)a3;
- (void)addHeySiriFallbackModel:(id)a3;
- (void)addHeySiriPreinstalledModel:(id)a3;
- (void)addHeySiriPrimaryModel:(id)a3;
- (void)expandSuperBinaryMetaData:(id)a3;
- (void)expandSuperBinaryPayloads:(id)a3;
@end

@implementation UARPHeySiriModel

- (UARPHeySiriModel)initWithURL:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___UARPHeySiriModel;
  v5 = -[UARPHeySiriModel init](&v9, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    url = v5->_url;
    v5->_url = (NSURL *)v6;
  }

  return v5;
}

- (NSArray)newModels
{
  return (NSArray *)objc_claimAutoreleasedReturnValue();
}

- (NSArray)fallbackModels
{
  return (NSArray *)[MEMORY[0x189603F18] arrayWithArray:self->_fallbackModels];
}

- (NSArray)downloadedModels
{
  return (NSArray *)[MEMORY[0x189603F18] arrayWithArray:self->_downloadedModels];
}

- (NSArray)preInstalledModels
{
  return (NSArray *)[MEMORY[0x189603F18] arrayWithArray:self->_preInstalledModels];
}

- (void)addHeySiriPrimaryModel:(id)a3
{
  id v4 = a3;
  newModels = self->_newModels;
  id v8 = v4;
  if (!newModels)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    v7 = self->_newModels;
    self->_newModels = v6;

    id v4 = v8;
    newModels = self->_newModels;
  }

  -[NSMutableArray addObject:](newModels, "addObject:", v4);
}

- (void)addHeySiriFallbackModel:(id)a3
{
  id v4 = a3;
  fallbackModels = self->_fallbackModels;
  id v8 = v4;
  if (!fallbackModels)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    v7 = self->_fallbackModels;
    self->_fallbackModels = v6;

    id v4 = v8;
    fallbackModels = self->_fallbackModels;
  }

  -[NSMutableArray addObject:](fallbackModels, "addObject:", v4);
}

- (void)addHeySiriDownloadedModel:(id)a3
{
  id v4 = a3;
  downloadedModels = self->_downloadedModels;
  id v8 = v4;
  if (!downloadedModels)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    v7 = self->_downloadedModels;
    self->_downloadedModels = v6;

    id v4 = v8;
    downloadedModels = self->_downloadedModels;
  }

  -[NSMutableArray addObject:](downloadedModels, "addObject:", v4);
}

- (void)addHeySiriPreinstalledModel:(id)a3
{
  id v4 = a3;
  preInstalledModels = self->_preInstalledModels;
  id v8 = v4;
  if (!preInstalledModels)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    v7 = self->_preInstalledModels;
    self->_preInstalledModels = v6;

    id v4 = v8;
    preInstalledModels = self->_preInstalledModels;
  }

  -[NSMutableArray addObject:](preInstalledModels, "addObject:", v4);
}

- (void)expandSuperBinaryMetaData:(id)a3
{
  id v4 = a3;
  +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:]( &OBJC_CLASS___UARPSuperBinaryAssetTLV,  "findTLVWithType:tlvs:",  1619725832LL,  v4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v8 valueAsNumber];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_engineType = [v5 unsignedShortValue];
  +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:]( &OBJC_CLASS___UARPSuperBinaryAssetTLV,  "findTLVWithType:tlvs:",  1619725831LL,  v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  [v6 valueAsVersion];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  self->_majorVersion = [v7 majorVersion];
  self->_minorVersion = [v7 minorVersion];
}

- (void)expandSuperBinaryPayloads:(id)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id obj = a3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        +[UARPHeySiriModel hsModelWithUarpPayload:](&OBJC_CLASS___UARPHeySiriModel, "hsModelWithUarpPayload:", v8);
        objc_super v9 = (void *)objc_claimAutoreleasedReturnValue();
        [v8 tlvs];
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:]( &OBJC_CLASS___UARPSuperBinaryAssetTLV,  "findTLVWithType:tlvs:",  1619725824LL,  v10);
        [v11 valueAsNumber];
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        else {
          -[UARPHeySiriModel addHeySiriDownloadedModel:](self, "addHeySiriDownloadedModel:", v9);
        }
      }

      uint64_t v5 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v5);
  }
}

- (BOOL)expandURL:(id *)a3
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  uint64_t v5 = -[UARPSuperBinaryAsset initWithURL:](objc_alloc(&OBJC_CLASS___UARPSuperBinaryAsset), "initWithURL:", self->_url);
  uint64_t v6 = v5;
  if (v5 && -[UARPSuperBinaryAsset expandHeadersAndTLVs:](v5, "expandHeadersAndTLVs:", a3))
  {
    v7 = -[UARPSuperBinaryAsset tlvs](v6, "tlvs");
    +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:]( &OBJC_CLASS___UARPSuperBinaryAssetTLV,  "findTLVWithType:tlvs:",  1619725831LL,  v7);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      [v8 valueAsVersion];
      objc_super v9 = (void *)objc_claimAutoreleasedReturnValue();
      self->_majorVersion = [v9 majorVersion];
      self->_minorVersion = [v9 minorVersion];
    }

    v27 = v8;
    v10 = -[UARPSuperBinaryAsset tlvs](v6, "tlvs");
    v11 = +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:]( &OBJC_CLASS___UARPSuperBinaryAssetTLV,  "findTLVWithType:tlvs:",  1619725832LL,  v10);
    if (v11)
    {
      [v11 valueAsNumber];
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      self->_engineType = [v12 unsignedShortValue];
    }

    v26 = v11;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    v28 = v6;
    v13 = -[UARPSuperBinaryAsset payloads](v6, "payloads");
    uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v30;
      do
      {
        for (uint64_t i = 0LL; i != v15; ++i)
        {
          if (*(void *)v30 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          +[UARPHeySiriModel hsModelWithUarpPayload:](&OBJC_CLASS___UARPHeySiriModel, "hsModelWithUarpPayload:", v18);
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
          [v18 tlvs];
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:]( &OBJC_CLASS___UARPSuperBinaryAssetTLV,  "findTLVWithType:tlvs:",  1619725824LL,  v20);
          if (v21
            && ([v21 valueAsNumber],
                v22 = (void *)objc_claimAutoreleasedReturnValue(),
                int v23 = [v22 unsignedShortValue],
                v22,
                v23 == 1))
          {
            -[UARPHeySiriModel addHeySiriPreinstalledModel:](self, "addHeySiriPreinstalledModel:", v19);
          }

          else
          {
            -[UARPHeySiriModel addHeySiriDownloadedModel:](self, "addHeySiriDownloadedModel:", v19);
          }
        }

        uint64_t v15 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }

      while (v15);
    }

    BOOL v24 = 1;
    uint64_t v6 = v28;
  }

  else
  {
    BOOL v24 = 0;
  }

  return v24;
}

+ (id)uarpPayloadWithHSModel:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (unsigned __int8 *)uarpAssetTagHeySiriModel4cc();
  uint64_t v5 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"%c%c%c%c",  *v4,  v4[1],  v4[2],  v4[3]);
  uint64_t v6 = -[UARPSuperBinaryAssetPayload initWithTag:majorVersion:minorVersion:releaseVersion:buildVersion:]( objc_alloc(&OBJC_CLASS___UARPSuperBinaryAssetPayload),  "initWithTag:majorVersion:minorVersion:releaseVersion:buildVersion:",  v5,  &unk_18A160A70,  &unk_18A160A70,  &unk_18A160A70,  &unk_18A160A70);
  [v3 modelLocale];
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    id v8 = objc_alloc(&OBJC_CLASS___UARPSuperBinaryAssetTLV);
    [v3 modelLocale];
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[UARPSuperBinaryAssetTLV initWithType:stringValue:](v8, "initWithType:stringValue:", 1619725825LL, v9);

    -[UARPSuperBinaryAssetPayload addMetaDataTLV:](v6, "addMetaDataTLV:", v10);
  }

  [v3 modelHash];
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = objc_alloc(&OBJC_CLASS___UARPSuperBinaryAssetTLV);
    [v3 modelHash];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = -[UARPSuperBinaryAssetTLV initWithType:stringValue:](v12, "initWithType:stringValue:", 1619725826LL, v13);

    -[UARPSuperBinaryAssetPayload addMetaDataTLV:](v6, "addMetaDataTLV:", v14);
  }

  [v3 digest];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    uint64_t v16 = objc_alloc(&OBJC_CLASS___UARPSuperBinaryAssetTLV);
    [v3 digest];
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[UARPSuperBinaryAssetTLV initWithType:dataValue:](v16, "initWithType:dataValue:", 1619725828LL, v17);

    -[UARPSuperBinaryAssetPayload addMetaDataTLV:](v6, "addMetaDataTLV:", v18);
  }

  [v3 signature];
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v20 = objc_alloc(&OBJC_CLASS___UARPSuperBinaryAssetTLV);
    [v3 signature];
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[UARPSuperBinaryAssetTLV initWithType:dataValue:](v20, "initWithType:dataValue:", 1619725829LL, v21);

    -[UARPSuperBinaryAssetPayload addMetaDataTLV:](v6, "addMetaDataTLV:", v22);
  }

  [v3 certificate];
  int v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    BOOL v24 = objc_alloc(&OBJC_CLASS___UARPSuperBinaryAssetTLV);
    [v3 certificate];
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[UARPSuperBinaryAssetTLV initWithType:dataValue:](v24, "initWithType:dataValue:", 1619725830LL, v25);

    -[UARPSuperBinaryAssetPayload addMetaDataTLV:](v6, "addMetaDataTLV:", v26);
  }

  [v3 modelData];
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    [v3 modelData];
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPSuperBinaryAssetPayload setPayloadToData:](v6, "setPayloadToData:", v28);
  }

  return v6;
}

+ (id)hsModelWithUarpPayload:(id)a3
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  id v24 = a3;
  [v24 tlvs];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    v25 = 0LL;
    v26 = 0LL;
    uint64_t v6 = 0LL;
    v7 = 0LL;
    id v8 = 0LL;
    uint64_t v9 = *(void *)v28;
    do
    {
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(v3);
        }
        v11 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        switch([v11 type])
        {
          case 0x608B0E01u:
            uint64_t v12 = [v11 valueAsString];
            v13 = v8;
            id v8 = (void *)v12;
            goto LABEL_12;
          case 0x608B0E02u:
            uint64_t v15 = [v11 valueAsString];
            v13 = v7;
            v7 = (void *)v15;
            goto LABEL_12;
          case 0x608B0E04u:
            uint64_t v14 = [v11 valueAsData];
            v13 = v6;
            uint64_t v6 = (void *)v14;
            goto LABEL_12;
          case 0x608B0E05u:
            uint64_t v16 = [v11 valueAsData];
            v13 = v26;
            v26 = (void *)v16;
            goto LABEL_12;
          case 0x608B0E06u:
            uint64_t v17 = [v11 valueAsData];
            v13 = v25;
            v25 = (void *)v17;
LABEL_12:

            break;
          default:
            continue;
        }
      }

      uint64_t v5 = [v3 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }

    while (v5);
  }

  else
  {
    v25 = 0LL;
    v26 = 0LL;
    uint64_t v6 = 0LL;
    v7 = 0LL;
    id v8 = 0LL;
  }

  [v24 payload];
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  id v19 = objc_alloc((Class)getCSVoiceTriggerRTModelClass());
  if (v18)
  {
    v21 = v25;
    v20 = v26;
    v22 = (void *)[v19 initWithData:v18 hash:v7 locale:v8 digest:v6 signature:v26 certificate:v25];
  }

  else
  {
    v22 = (void *)[v19 initWithHash:v7 locale:v8];
    v21 = v25;
    v20 = v26;
  }

  return v22;
}

- (id)exportAsSuperBinary:(id *)a3
{
  uint64_t v4 = -[UARPAssetVersion initWithMajorVersion:minorVersion:releaseVersion:buildVersion:]( objc_alloc(&OBJC_CLASS___UARPAssetVersion),  "initWithMajorVersion:minorVersion:releaseVersion:buildVersion:",  0LL,  0LL,  0LL,  0LL);
  uint64_t v5 = -[UARPSuperBinaryAsset initWithFormatVersion:assetVersion:]( objc_alloc(&OBJC_CLASS___UARPSuperBinaryAsset),  "initWithFormatVersion:assetVersion:",  3LL,  v4);
  if (-[NSMutableArray count](self->_newModels, "count"))
  {
    -[NSMutableArray firstObject](self->_newModels, "firstObject");
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = +[UARPHeySiriModel uarpPayloadWithHSModel:](&OBJC_CLASS___UARPHeySiriModel, "uarpPayloadWithHSModel:", v6);
    id v8 = -[UARPSuperBinaryAssetTLV initWithType:unsignedInt16:]( objc_alloc(&OBJC_CLASS___UARPSuperBinaryAssetTLV),  "initWithType:unsignedInt16:",  1619725827LL,  0LL);
    [v7 addMetaDataTLV:v8];
    -[UARPSuperBinaryAsset addPayload:](v5, "addPayload:", v7);
  }

  if (-[NSMutableArray count](self->_fallbackModels, "count"))
  {
    -[NSMutableArray firstObject](self->_fallbackModels, "firstObject");
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = +[UARPHeySiriModel uarpPayloadWithHSModel:](&OBJC_CLASS___UARPHeySiriModel, "uarpPayloadWithHSModel:", v9);
    v11 = -[UARPSuperBinaryAssetTLV initWithType:unsignedInt16:]( objc_alloc(&OBJC_CLASS___UARPSuperBinaryAssetTLV),  "initWithType:unsignedInt16:",  1619725827LL,  1LL);
    [v10 addMetaDataTLV:v11];
    -[UARPSuperBinaryAsset addPayload:](v5, "addPayload:", v10);
  }

  return v5;
}

- (unint64_t)engineType
{
  return self->_engineType;
}

- (unint64_t)majorVersion
{
  return self->_majorVersion;
}

- (unint64_t)minorVersion
{
  return self->_minorVersion;
}

- (void).cxx_destruct
{
}

@end