@interface UARPSuperBinary
- (BOOL)expandMetaData:(UARPSuperBinaryHeader *)a3;
- (BOOL)expandSuperBinary;
- (BOOL)expandTLVs;
- (BOOL)generateTatsuMeasurements:(unint64_t)a3 relativeURL:(id)a4;
- (BOOL)needsHostPersonalization;
- (BOOL)preparePayload:(UARPPayloadHeader2 *)a3;
- (BOOL)provisioning;
- (BOOL)queryTatsuSigningServer:(id)a3 ssoOnly:(BOOL)a4 error:(id *)a5;
- (NSArray)payloads;
- (NSArray)tlvs;
- (NSData)ecidData;
- (NSData)nonce;
- (NSNumber)demote;
- (NSNumber)trustedOverride;
- (UARPSuperBinary)initWithData:(id)a3 delegate:(id)a4 delegateQueue:(id)a5;
- (UARPSuperBinary)initWithFilePath:(id)a3 delegate:(id)a4 delegateQueue:(id)a5;
- (UARPSuperBinary)initWithURL:(id)a3 delegate:(id)a4 delegateQueue:(id)a5;
- (id)composeTSSRequest:(unint64_t)a3 asMeasurement:(BOOL)a4;
- (id)generatePersonalizedSuperBinary;
- (id)generatePersonalizedSuperBinaryInternal:(id)a3;
- (id)generatePersonalizedSuperBinaryWithoutRRKO;
- (id)getDataBlock:(unint64_t)a3 offset:(unint64_t)a4;
- (id)getPayloads;
- (id)getTlvs;
- (id)payloadWith4ccTag:(id)a3;
- (id)payloadsWithout4ccTag:(id)a3;
- (id)personalizeSuperBinary:(unint64_t)a3 signingServer:(id)a4 ssoOnly:(BOOL)a5;
- (id)personalizedMetaData;
- (id)requiredTSSOptions;
- (id)tatsuMeasurements:(unint64_t)a3;
- (id)tssKeyName:(id)a3 unitNumber:(unint64_t)a4;
- (unint64_t)ecID;
- (unint64_t)totalBytesRequested;
- (unint64_t)totalLength;
- (unsigned)boardID;
- (unsigned)chipID;
- (unsigned)life;
- (unsigned)manifestEpoch;
- (unsigned)productionMode;
- (unsigned)securityDomain;
- (unsigned)securityMode;
- (void)generateTatsuMeasurements:(unint64_t)a3;
- (void)generateTatsuMeasurementsPerPayload:(unint64_t)a3;
- (void)layer2Context;
- (void)log:(id)a3;
- (void)logInternal:(id)a3 arguments:(char *)a4;
- (void)processMeasurementsForTSSOptions:(id)a3 unitNumber:(unint64_t)a4 asMeasurement:(BOOL)a5;
- (void)processTLVsForPersonalization;
- (void)setBoardID:(unsigned int)a3;
- (void)setChipID:(unsigned int)a3;
- (void)setDemote:(id)a3;
- (void)setEcID:(unint64_t)a3;
- (void)setEcidData:(id)a3;
- (void)setLayer2Context:(void *)a3;
- (void)setLife:(unsigned __int8)a3;
- (void)setManifestEpoch:(unsigned __int8)a3;
- (void)setNonce:(id)a3;
- (void)setProductionMode:(unsigned __int8)a3;
- (void)setProvisioning:(BOOL)a3;
- (void)setSecurityDomain:(unsigned __int8)a3;
- (void)setSecurityMode:(unsigned __int8)a3;
- (void)setTrustedOverride:(id)a3;
@end

@implementation UARPSuperBinary

- (UARPSuperBinary)initWithData:(id)a3 delegate:(id)a4 delegateQueue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___UARPSuperBinary;
  v11 = -[UARPSuperBinary init](&v23, sel_init);
  v12 = v11;
  if (!v11) {
    goto LABEL_4;
  }
  if (!v8) {
    goto LABEL_5;
  }
  objc_storeWeak((id *)&v11->_delegate, v9);
  objc_storeStrong((id *)&v12->_delegateQueue, a5);
  uint64_t v13 = [v8 copy];
  data = v12->_data;
  v12->_data = (NSData *)v13;

  uint64_t v15 = objc_opt_new();
  tlvs = v12->_tlvs;
  v12->_tlvs = (NSMutableArray *)v15;

  uint64_t v17 = objc_opt_new();
  trimmedTlvs = v12->_trimmedTlvs;
  v12->_trimmedTlvs = (NSMutableArray *)v17;

  uint64_t v19 = objc_opt_new();
  measurements = v12->_measurements;
  v12->_measurements = (NSMutableArray *)v19;

  v12->_totalLength = -[NSData length](v12->_data, "length");
  if (-[UARPSuperBinary expandSuperBinary](v12, "expandSuperBinary")) {
LABEL_4:
  }
    v21 = v12;
  else {
LABEL_5:
  }
    v21 = 0LL;

  return v21;
}

- (UARPSuperBinary)initWithFilePath:(id)a3 delegate:(id)a4 delegateQueue:(id)a5
{
  id v8 = (void *)MEMORY[0x189603F48];
  id v9 = a5;
  id v10 = a4;
  [a3 stringByExpandingTildeInPath];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 dataWithContentsOfFile:v11];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = -[UARPSuperBinary initWithData:delegate:delegateQueue:]( self,  "initWithData:delegate:delegateQueue:",  v12,  v10,  v9);

  return v13;
}

- (UARPSuperBinary)initWithURL:(id)a3 delegate:(id)a4 delegateQueue:(id)a5
{
  id v8 = (void *)MEMORY[0x189603F48];
  id v9 = a5;
  id v10 = a4;
  [v8 dataWithContentsOfURL:a3];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[UARPSuperBinary initWithData:delegate:delegateQueue:]( self,  "initWithData:delegate:delegateQueue:",  v11,  v10,  v9);

  return v12;
}

- (BOOL)expandSuperBinary
{
  v3 = (NSMutableArray *)objc_opt_new();
  payloads = self->_payloads;
  self->_payloads = v3;

  data = self->_data;
  if (!data) {
    return 0;
  }
  if (-[NSData length](data, "length") < 0x2C) {
    return 0;
  }
  -[NSData getBytes:range:](self->_data, "getBytes:range:", v16, 0LL, 44LL);
  uarpSuperBinaryHeaderEndianSwap(v16, v16);
  unint64_t v6 = v16[2];
  if (-[NSData length](self->_data, "length") < v6) {
    return 0;
  }
  self->_formatVersion = v16[0];
  v7 = objc_alloc(&OBJC_CLASS___UARPAssetVersion);
  id v8 = -[UARPAssetVersion initWithMajorVersion:minorVersion:releaseVersion:buildVersion:]( v7,  "initWithMajorVersion:minorVersion:releaseVersion:buildVersion:",  v16[3],  v16[4],  v16[5],  v16[6]);
  version = self->_version;
  self->_version = v8;

  if (!-[UARPSuperBinary expandMetaData:](self, "expandMetaData:", v16)) {
    return 0;
  }
  uint64_t v10 = v16[9];
  unint64_t v11 = v16[10];
  do
  {
    BOOL v12 = v11 >= 0x28;
    v11 -= 40LL;
    BOOL v13 = !v12;
    if (!v12) {
      break;
    }
    -[NSData getBytes:range:](self->_data, "getBytes:range:", v15, v10, 40LL);
    uarpPayloadHeaderEndianSwap(v15, v15);
    v10 += 40LL;
  }

  while (-[UARPSuperBinary preparePayload:](self, "preparePayload:", v15));
  return v13;
}

- (BOOL)expandMetaData:(UARPSuperBinaryHeader *)a3
{
  unsigned int superBinaryMetadataLength = a3->superBinaryMetadataLength;
  if (!superBinaryMetadataLength) {
    return 1;
  }
  unint64_t v6 = a3->superBinaryMetadataOffset + superBinaryMetadataLength;
  if (-[NSData length](self->_data, "length") < v6) {
    return 0;
  }
  -[NSData subdataWithRange:]( self->_data,  "subdataWithRange:",  a3->superBinaryMetadataOffset,  a3->superBinaryMetadataLength);
  id v8 = (NSData *)objc_claimAutoreleasedReturnValue();
  metaData = self->_metaData;
  self->_metaData = v8;

  return -[UARPSuperBinary expandTLVs](self, "expandTLVs");
}

- (BOOL)preparePayload:(UARPPayloadHeader2 *)a3
{
  v5 = -[UARPAssetTag initWithChar1:char2:char3:char4:]( objc_alloc(&OBJC_CLASS___UARPAssetTag),  "initWithChar1:char2:char3:char4:",  (char)a3->var1.char1,  (char)a3->var1.char2,  (char)a3->var1.char3,  (char)a3->var1.char4);
  unint64_t v6 = -[UARPAssetVersion initWithMajorVersion:minorVersion:releaseVersion:buildVersion:]( objc_alloc(&OBJC_CLASS___UARPAssetVersion),  "initWithMajorVersion:minorVersion:releaseVersion:buildVersion:",  a3->var2.major,  a3->var2.minor,  a3->var2.release,  a3->var2.build);
  unint64_t v7 = a3->var4 + a3->var3;
  if (-[NSData length](self->_data, "length") >= v7)
  {
    if (a3->var4)
    {
      -[NSData subdataWithRange:](self->_data, "subdataWithRange:", a3->var3);
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      id v9 = 0LL;
    }

    unint64_t v10 = a3->var6 + a3->var5;
    if (-[NSData length](self->_data, "length") >= v10)
    {
      if (a3->var6)
      {
        -[NSData subdataWithRange:](self->_data, "subdataWithRange:", a3->var5);
        unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        unint64_t v11 = 0LL;
      }

      BOOL v12 = -[UARPSuperBinaryPayload initWithData:metaData:tag:version:]( objc_alloc(&OBJC_CLASS___UARPSuperBinaryPayload),  "initWithData:metaData:tag:version:",  v11,  v9,  v5,  v6);
      BOOL v13 = v12;
      if (v12 && -[UARPSuperBinaryPayload expandTLVs](v12, "expandTLVs"))
      {
        -[NSMutableArray addObject:](self->_payloads, "addObject:", v13);
        BOOL v8 = 1;
      }

      else
      {
        BOOL v8 = 0;
      }
    }

    else
    {
      BOOL v8 = 0;
    }
  }

  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)payloadWith4ccTag:(id)a3
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  v5 = self->_payloads;
  id v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        objc_msgSend(v9, "tag", (void)v13);
        unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
        char v11 = [v10 isEqual:v4];

        if ((v11 & 1) != 0)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }

      id v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
      if (v6) {
        continue;
      }
      break;
    }
  }

- (id)payloadsWithout4ccTag:(id)a3
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v5 = (void *)objc_opt_new();
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v6 = self->_payloads;
  uint64_t v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        char v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        objc_msgSend(v11, "tag", (void)v16);
        BOOL v12 = (void *)objc_claimAutoreleasedReturnValue();
        char v13 = [v12 isEqual:v4];

        if ((v13 & 1) == 0) {
          [v5 addObject:v11];
        }
      }

      uint64_t v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
    }

    while (v8);
  }

  [MEMORY[0x189603F18] arrayWithArray:v5];
  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)getTlvs
{
  return (id)[MEMORY[0x189603F18] arrayWithArray:self->_tlvs];
}

- (id)personalizedMetaData
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  -[NSMutableArray removeAllObjects](self->_trimmedTlvs, "removeAllObjects");
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  v20 = self;
  v3 = self->_tlvs;
  uint64_t v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v25,  v30,  16LL);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v26;
    do
    {
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        if (*(void *)v26 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0) {
                      -[NSMutableArray addObject:](v20->_trimmedTlvs, "addObject:", v8);
                    }
                  }
                }
              }
            }
          }
        }
      }

      uint64_t v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v25,  v30,  16LL);
    }

    while (v5);
  }

  manifest = v20->_manifest;
  if (manifest)
  {
    +[UARPMetaDataTLV tlvFromType:length:value:]( &OBJC_CLASS___UARPMetaDataTLV,  "tlvFromType:length:value:",  2293403952LL,  -[NSData length](manifest, "length"),  -[NSData bytes](v20->_manifest, "bytes"));
    unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10) {
      -[NSMutableArray addObject:](v20->_trimmedTlvs, "addObject:", v10);
    }
  }

  char v11 = (void *)objc_opt_new();
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  BOOL v12 = v20->_trimmedTlvs;
  uint64_t v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v21,  v29,  16LL);
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v22;
    do
    {
      for (uint64_t j = 0LL; j != v14; ++j)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v12);
        }
        [*(id *)(*((void *)&v21 + 1) + 8 * j) generateTLV];
        __int128 v17 = (void *)objc_claimAutoreleasedReturnValue();
        [v11 appendData:v17];
      }

      uint64_t v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v21,  v29,  16LL);
    }

    while (v14);
  }

  [MEMORY[0x189603F48] dataWithData:v11];
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)getPayloads
{
  return (id)[MEMORY[0x189603F18] arrayWithArray:self->_payloads];
}

- (BOOL)expandTLVs
{
  v3 = -[NSData bytes](self->_metaData, "bytes");
  if (-[NSData length](self->_metaData, "length"))
  {
    unint64_t v4 = 0LL;
    do
    {
      if (v4 + 4 > -[NSData length](self->_metaData, "length")) {
        break;
      }
      uint64_t v5 = uarpHtonl(*(_DWORD *)&v3[v4]);
      unint64_t v6 = v4 + 8;
      if (v4 + 8 > -[NSData length](self->_metaData, "length")) {
        break;
      }
      uint64_t v7 = uarpHtonl(*(_DWORD *)&v3[v4 + 4]);
      unint64_t v4 = v6 + v7;
      if (v4 > -[NSData length](self->_metaData, "length")) {
        break;
      }
      uint64_t v8 = +[UARPMetaDataTLV tlvFromType:length:value:]( &OBJC_CLASS___UARPMetaDataTLV,  "tlvFromType:length:value:",  v5,  v7,  &v3[v6]);
      if (!v8) {
        break;
      }
      uint64_t v9 = (void *)v8;
      -[NSMutableArray addObject:](self->_tlvs, "addObject:", v8);
    }

    while (v4 < -[NSData length](self->_metaData, "length"));
  }

  -[UARPSuperBinary processTLVsForPersonalization](self, "processTLVsForPersonalization");
  return 1;
}

- (id)personalizeSuperBinary:(unint64_t)a3 signingServer:(id)a4 ssoOnly:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v28 = *MEMORY[0x1895F89C0];
  id v22 = a4;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  uint64_t v8 = self->_payloads;
  uint64_t v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v23,  v27,  16LL);
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v24;
    while (2)
    {
      for (uint64_t i = 0LL; i != v10; ++i)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if ([v13 needsHostPersonalization])
        {
          [v13 setBoardID:self->_boardID];
          [v13 setChipID:self->_chipID];
          [v13 setEcID:self->_ecID];
          [v13 setNonce:self->_nonce];
          [v13 setProductionMode:self->_productionMode];
          [v13 setSecurityDomain:self->_securityDomain];
          [v13 setSecurityMode:self->_securityMode];
          [v13 setTrustedOverride:self->_trustedOverride];
          [v13 setDemote:self->_demote];
          -[UARPSuperBinary log:](self, "log:", @"Personalizing %@", v13);
          [v13 composeTSSRequest:a3];
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v14) {
            goto LABEL_17;
          }
          [v13 tag];
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[UARPSuperBinary log:](self, "log:", @"TSS Request Options for payload %@", v15);

          [v13 tssRequest];
          __int128 v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[UARPSuperBinary log:](self, "log:", @"%@", v16);

          if (![v13 queryTatsuSigningServer:v22 ssoOnly:v5 error:0])
          {
LABEL_17:

            __int128 v19 = 0LL;
            goto LABEL_18;
          }
        }

        else
        {
          [v13 tag];
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[UARPSuperBinary log:](self, "log:", @"Host Personalization not required for payload %@", v14);
        }
      }

      uint64_t v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v23,  v27,  16LL);
      if (v10) {
        continue;
      }
      break;
    }
  }

  if (!-[UARPSuperBinary needsHostPersonalization](self, "needsHostPersonalization")
    || (id v17 = -[UARPSuperBinary composeTSSRequest:asMeasurement:](self, "composeTSSRequest:asMeasurement:", a3, 0LL),
        v18 = -[UARPSuperBinary queryTatsuSigningServer:ssoOnly:error:]( self,  "queryTatsuSigningServer:ssoOnly:error:",  v22,  v5,  0LL),  __int128 v19 = 0LL,  v18))
  {
    -[UARPSuperBinary generatePersonalizedSuperBinary](self, "generatePersonalizedSuperBinary");
    v20 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = v20;
    if (v20)
    {
      uint64_t v8 = v20;
      __int128 v19 = v8;
    }

    else
    {
      __int128 v19 = 0LL;
    }

- (BOOL)queryTatsuSigningServer:(id)a3 ssoOnly:(BOOL)a4 error:(id *)a5
{
  BOOL v5 = a4;
  id v7 = a3;
  if (!v7)
  {
    [MEMORY[0x189604030] URLWithString:@"https://gs.apple.com:443"];
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }

  tssRequest = self->_tssRequest;
  if (v5) {
    UARPPersonalizationTSSRequestWithSigningServerSSO(tssRequest, v7);
  }
  else {
    UARPPersonalizationTSSRequestWithSigningServer(tssRequest, v7);
  }
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = v9;
  if (v9)
  {
    [v9 objectForKeyedSubscript:self->_keyManifest];
    uint64_t v11 = (NSData *)objc_claimAutoreleasedReturnValue();
    manifest = self->_manifest;
    self->_manifest = v11;
  }

  return v10 != 0LL;
}

- (id)generatePersonalizedSuperBinary
{
  return -[UARPSuperBinary generatePersonalizedSuperBinaryInternal:]( self,  "generatePersonalizedSuperBinaryInternal:",  self->_payloads);
}

- (id)generatePersonalizedSuperBinaryWithoutRRKO
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  v3 = -[UARPAssetTag initWithString:](objc_alloc(&OBJC_CLASS___UARPAssetTag), "initWithString:", @"RRKO");
  unint64_t v4 = -[UARPAssetTag initWithString:](objc_alloc(&OBJC_CLASS___UARPAssetTag), "initWithString:", @"rrko");
  __int128 v16 = self;
  id v17 = (void *)objc_opt_new();
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  BOOL v5 = self->_payloads;
  uint64_t v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v18,  v22,  16LL);
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        objc_msgSend(v10, "tag", v16);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ([v11 isEqual:v3])
        {
        }

        else
        {
          [v10 tag];
          BOOL v12 = (void *)objc_claimAutoreleasedReturnValue();
          char v13 = [v12 isEqual:v4];

          if ((v13 & 1) == 0) {
            [v17 addObject:v10];
          }
        }
      }

      uint64_t v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v18,  v22,  16LL);
    }

    while (v7);
  }

  -[UARPSuperBinary generatePersonalizedSuperBinaryInternal:](v16, "generatePersonalizedSuperBinaryInternal:", v17);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)generatePersonalizedSuperBinaryInternal:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_opt_new();
  uint64_t v6 = (void *)objc_opt_new();
  v33 = (void *)objc_opt_new();
  v34[0] = self->_formatVersion;
  v34[1] = 44;
  int v36 = -[UARPAssetVersion majorVersion](self->_version, "majorVersion");
  int v37 = -[UARPAssetVersion minorVersion](self->_version, "minorVersion");
  int v38 = -[UARPAssetVersion releaseVersion](self->_version, "releaseVersion");
  int v39 = -[UARPAssetVersion buildVersion](self->_version, "buildVersion");
  int v42 = 44;
  int v43 = 40 * [v4 count];
  -[UARPSuperBinary personalizedMetaData](self, "personalizedMetaData");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  int v40 = v43 + 44;
  int v8 = [v7 length];
  int v9 = v43 + 44 + v8;
  int v41 = v8;
  int v35 = v9;
  v32 = v7;
  [v6 appendData:v7];
  uint64_t v10 = (unsigned int *)calloc([v4 count], 0x28uLL);
  if ([v4 count])
  {
    unint64_t v11 = 0LL;
    BOOL v12 = v10 + 4;
    do
    {
      [v4 objectAtIndex:v11];
      char v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 personalizedMetaData];
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(v12 - 4) = 40;
      [v13 tag];
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      *((_BYTE *)v12 - 12) = [v15 char1];

      [v13 tag];
      __int128 v16 = (void *)objc_claimAutoreleasedReturnValue();
      *((_BYTE *)v12 - 11) = [v16 char2];

      [v13 tag];
      id v17 = (void *)objc_claimAutoreleasedReturnValue();
      *((_BYTE *)v12 - 10) = [v17 char3];

      [v13 tag];
      __int128 v18 = (void *)objc_claimAutoreleasedReturnValue();
      *((_BYTE *)v12 - 9) = [v18 char4];

      [v13 version];
      __int128 v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(v12 - 2) = [v19 majorVersion];

      [v13 version];
      __int128 v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(v12 - 1) = [v20 minorVersion];

      [v13 version];
      __int128 v21 = (void *)objc_claimAutoreleasedReturnValue();
      _DWORD *v12 = [v21 releaseVersion];

      [v13 version];
      id v22 = (void *)objc_claimAutoreleasedReturnValue();
      v12[1] = [v22 buildVersion];

      v12[2] = v9;
      int v23 = [v14 length];
      v12[3] = v23;
      v9 += v23;
      [v6 appendData:v14];

      ++v11;
      v12 += 10;
    }

    while (v11 < [v4 count]);
  }

  if ([v4 count])
  {
    unint64_t v24 = 0LL;
    __int128 v25 = v10 + 9;
    __int128 v26 = v33;
    do
    {
      [v4 objectAtIndex:v24];
      __int128 v27 = (void *)objc_claimAutoreleasedReturnValue();
      [v27 personalizedData];
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(v25 - 1) = v9;
      int v29 = [v28 length];
      *__int128 v25 = v29;
      v25 += 10;
      v9 += v29;
      [v33 appendData:v28];

      ++v24;
    }

    while (v24 < [v4 count]);
  }

  else
  {
    __int128 v26 = v33;
  }

  int v35 = v9;
  uarpSuperBinaryHeaderEndianSwap(v34, v34);
  [v5 appendBytes:v34 length:44];
  if ([v4 count])
  {
    unint64_t v30 = 0LL;
    do
    {
      uarpPayloadHeaderEndianSwap(v10, v10);
      [v5 appendBytes:v10 length:40];
      ++v30;
      v10 += 10;
    }

    while (v30 < [v4 count]);
  }

  [v5 appendData:v6];
  [v5 appendData:v26];

  return v5;
}

- (BOOL)generateTatsuMeasurements:(unint64_t)a3 relativeURL:(id)a4
{
  id v6 = a4;
  uint64_t v7 = (NSMutableDictionary *)objc_opt_new();
  tatsuMeasurements = self->_tatsuMeasurements;
  self->_tatsuMeasurements = v7;

  if (-[UARPSuperBinary expandTLVs](self, "expandTLVs")) {
    -[UARPSuperBinary processTLVsForPersonalization](self, "processTLVsForPersonalization");
  }
  if (self->_needsHostPersonalization) {
    -[UARPSuperBinary generateTatsuMeasurements:](self, "generateTatsuMeasurements:", a3);
  }
  else {
    -[UARPSuperBinary generateTatsuMeasurementsPerPayload:](self, "generateTatsuMeasurementsPerPayload:", a3);
  }
  int v9 = (void *)NSString;
  [v6 lastPathComponent];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 stringWithFormat:@"%@.plist", v10];
  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

  BOOL v12 = (void *)MEMORY[0x189604030];
  [v6 URLByDeletingLastPathComponent];
  char v13 = (void *)objc_claimAutoreleasedReturnValue();

  [v12 fileURLWithPath:v11 isDirectory:0 relativeToURL:v13];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

  char v15 = -[NSMutableDictionary writeToURL:error:](self->_tatsuMeasurements, "writeToURL:error:", v14, 0LL);
  return v15;
}

- (void)generateTatsuMeasurementsPerPayload:(unint64_t)a3
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  BOOL v5 = self->_payloads;
  uint64_t v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        if (a3)
        {
          uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * v9);
          unint64_t v11 = 1LL;
          do
          {
            objc_msgSend(v10, "tatsuMeasurements:", v11, (void)v13);
            BOOL v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (v12) {
              -[NSMutableDictionary addEntriesFromDictionary:]( self->_tatsuMeasurements,  "addEntriesFromDictionary:",  v12);
            }

            ++v11;
          }

          while (v11 <= a3);
        }

        ++v9;
      }

      while (v9 != v7);
      uint64_t v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    }

    while (v7);
  }
}

- (void)generateTatsuMeasurements:(unint64_t)a3
{
  manifest = self->_manifest;
  self->_manifest = 0LL;

  uint64_t v6 = (NSMutableDictionary *)objc_opt_new();
  tssRequest = self->_tssRequest;
  self->_tssRequest = v6;

  if (a3)
  {
    uint64_t v8 = 0LL;
    do
    {
      -[UARPSuperBinary tatsuMeasurements:](self, "tatsuMeasurements:", v8);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9) {
        -[NSMutableDictionary addEntriesFromDictionary:](self->_tatsuMeasurements, "addEntriesFromDictionary:", v9);
      }

      ++v8;
    }

    while (a3 != v8);
  }

- (void)processTLVsForPersonalization
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  v3 = self->_tlvs;
  uint64_t v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v14 + 1) + 8 * v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          self->_needsHostPersonalization = [v8 isRequired] != 0;
          goto LABEL_13;
        }

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          id v9 = v8;
          [v9 ticketPrefix];
          uint64_t v10 = (NSString *)objc_claimAutoreleasedReturnValue();
          ticketPrefix = self->_ticketPrefix;
          self->_ticketPrefix = v10;
LABEL_12:

          goto LABEL_13;
        }

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          id v9 = v8;
          [v9 manifestSuffix];
          BOOL v12 = (NSString *)objc_claimAutoreleasedReturnValue();
          ticketPrefix = self->_ticketSuffix;
          self->_ticketSuffix = v12;
          goto LABEL_12;
        }

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          self->_ticketNeedsUnitNumber = [v8 ticketNeedsLogicalUnitNumber] != 0;
        }

        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            self->_prefixNeedsUnitNumber = [v8 prefixNeedsLogicalUnitNumber] != 0;
          }

          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0
              || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
              || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              self->_suffixNeedsUnitNumber = objc_msgSend(v8, "suffixNeedsLogicalUnitNumber", (void)v14) != 0;
            }

            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0) {
                -[NSMutableArray addObject:](self->_measurements, "addObject:", v8, (void)v14);
              }
            }
          }
        }

- (id)tatsuMeasurements:(unint64_t)a3
{
  uint64_t v5 = (void *)-[NSMutableArray count](self->_tlvs, "count");
  if (v5)
  {
    -[UARPSuperBinary composeTSSRequest:asMeasurement:](self, "composeTSSRequest:asMeasurement:", a3, 1LL);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)composeTSSRequest:(unint64_t)a3 asMeasurement:(BOOL)a4
{
  BOOL v30 = a4;
  uint64_t v36 = *MEMORY[0x1895F89C0];
  manifest = self->_manifest;
  self->_manifest = 0LL;

  uint64_t v7 = (NSMutableDictionary *)objc_opt_new();
  tssRequest = self->_tssRequest;
  self->_tssRequest = v7;

  -[UARPSuperBinary requiredTSSOptions](self, "requiredTSSOptions");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = (NSMutableString *)objc_opt_new();
  keyManifest = self->_keyManifest;
  self->_keyManifest = v10;

  -[NSMutableString appendFormat:](self->_keyManifest, "appendFormat:", @"%@", self->_ticketPrefix);
  if (self->_ticketNeedsUnitNumber) {
    -[NSMutableString appendFormat:](self->_keyManifest, "appendFormat:", @"%lu", a3);
  }
  -[NSMutableString appendFormat:](self->_keyManifest, "appendFormat:", @",Ticket");
  BOOL v12 = (void *)objc_opt_new();
  [v12 appendFormat:@"@%@", self->_keyManifest];
  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_tssRequest,  "setObject:forKeyedSubscript:",  MEMORY[0x189604A88],  v12);
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id v13 = v9;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v32;
    do
    {
      for (uint64_t i = 0LL; i != v15; ++i)
      {
        if (*(void *)v32 != v16) {
          objc_enumerationMutation(v13);
        }
        switch([*(id *)(*((void *)&v31 + 1) + 8 * i) unsignedLongValue])
        {
          case 4u:
            -[UARPSuperBinary tssKeyName:unitNumber:](self, "tssKeyName:unitNumber:", @"BoardID", a3);
            uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v19 = (void *)MEMORY[0x189607968];
            uint64_t v20 = -[UARPSuperBinary boardID](self, "boardID");
            goto LABEL_13;
          case 5u:
            -[UARPSuperBinary tssKeyName:unitNumber:](self, "tssKeyName:unitNumber:", @"ChipID", a3);
            uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v19 = (void *)MEMORY[0x189607968];
            uint64_t v20 = -[UARPSuperBinary chipID](self, "chipID");
LABEL_13:
            uint64_t v23 = [v19 numberWithUnsignedInt:v20];
            goto LABEL_28;
          case 7u:
            -[UARPSuperBinary tssKeyName:unitNumber:](self, "tssKeyName:unitNumber:", @"ECID", a3);
            uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v23 = objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", -[UARPSuperBinary ecID](self, "ecID"));
            goto LABEL_28;
          case 8u:
            -[UARPSuperBinary tssKeyName:unitNumber:](self, "tssKeyName:unitNumber:", @"SecurityDomain", a3);
            uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
            unint64_t v24 = (void *)MEMORY[0x189607968];
            uint64_t v25 = -[UARPSuperBinary securityDomain](self, "securityDomain");
            goto LABEL_27;
          case 9u:
            -[UARPSuperBinary tssKeyName:unitNumber:](self, "tssKeyName:unitNumber:", @"SecurityMode", a3);
            uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
            int v21 = -[UARPSuperBinary securityMode](self, "securityMode");
            goto LABEL_17;
          case 0xAu:
            -[UARPSuperBinary tssKeyName:unitNumber:](self, "tssKeyName:unitNumber:", @"ProductionMode", a3);
            uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
            int v21 = -[UARPSuperBinary productionMode](self, "productionMode");
LABEL_17:
            if (v21) {
              ecidData = (NSData *)MEMORY[0x189604A88];
            }
            else {
              ecidData = (NSData *)MEMORY[0x189604A80];
            }
            goto LABEL_20;
          case 0x18u:
            -[UARPSuperBinary tssKeyName:unitNumber:](self, "tssKeyName:unitNumber:", @"Nonce", a3);
            uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v23 = -[UARPSuperBinary nonce](self, "nonce");
            goto LABEL_28;
          case 0x19u:
            -[UARPSuperBinary tssKeyName:unitNumber:](self, "tssKeyName:unitNumber:", @"Life", a3);
            uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
            unint64_t v24 = (void *)MEMORY[0x189607968];
            uint64_t v25 = -[UARPSuperBinary life](self, "life");
            goto LABEL_27;
          case 0x1Au:
            -[UARPSuperBinary tssKeyName:unitNumber:](self, "tssKeyName:unitNumber:", @"Provisioning", a3);
            uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (!-[UARPSuperBinary provisioning](self, "provisioning")) {
              goto LABEL_29;
            }
            __int128 v26 = self->_tssRequest;
            ecidData = (NSData *)MEMORY[0x189604A88];
            goto LABEL_21;
          case 0x1Bu:
            -[UARPSuperBinary tssKeyName:unitNumber:](self, "tssKeyName:unitNumber:", @"ManifestEpoch", a3);
            uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
            unint64_t v24 = (void *)MEMORY[0x189607968];
            uint64_t v25 = -[UARPSuperBinary manifestEpoch](self, "manifestEpoch");
LABEL_27:
            uint64_t v23 = [v24 numberWithUnsignedChar:v25];
LABEL_28:
            __int128 v27 = (void *)v23;
            -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_tssRequest,  "setObject:forKeyedSubscript:",  v23,  v18);

            goto LABEL_29;
          case 0x1Du:
            -[UARPSuperBinary tssKeyName:unitNumber:](self, "tssKeyName:unitNumber:", @"ECID", a3);
            uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
            ecidData = self->_ecidData;
LABEL_20:
            __int128 v26 = self->_tssRequest;
LABEL_21:
            -[NSMutableDictionary setObject:forKeyedSubscript:](v26, "setObject:forKeyedSubscript:", ecidData, v18);
LABEL_29:

            break;
          default:
            continue;
        }
      }

      uint64_t v15 = [v13 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }

    while (v15);
  }

  -[UARPSuperBinary processMeasurementsForTSSOptions:unitNumber:asMeasurement:]( self,  "processMeasurementsForTSSOptions:unitNumber:asMeasurement:",  self->_tssRequest,  a3,  v30);
  [MEMORY[0x189603F68] dictionaryWithDictionary:self->_tssRequest];
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (id)tssKeyName:(id)a3 unitNumber:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = (void *)objc_opt_new();
  [v7 appendFormat:@"%@", self->_ticketPrefix];
  if (self->_prefixNeedsUnitNumber) {
    objc_msgSend(v7, "appendFormat:", @"%lu", a4);
  }
  [v7 appendFormat:@",%@", v6];
  if (self->_suffixNeedsUnitNumber) {
    objc_msgSend(v7, "appendFormat:", @",%lu", a4);
  }
  [NSString stringWithString:v7];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)processMeasurementsForTSSOptions:(id)a3 unitNumber:(unint64_t)a4 asMeasurement:(BOOL)a5
{
  uint64_t v52 = *MEMORY[0x1895F89C0];
  id v25 = a3;
  __int128 v34 = self;
  int v35 = (void *)objc_opt_new();
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  obuint64_t j = self->_payloads;
  uint64_t v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v45,  v51,  16LL);
  if (v28)
  {
    uint64_t v27 = *(void *)v46;
    do
    {
      for (uint64_t i = 0LL; i != v28; ++i)
      {
        if (*(void *)v46 != v27) {
          objc_enumerationMutation(obj);
        }
        [*(id *)(*((void *)&v45 + 1) + 8 * i) measurements];
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
        __int128 v41 = 0u;
        __int128 v42 = 0u;
        __int128 v43 = 0u;
        __int128 v44 = 0u;
        id v30 = v7;
        uint64_t v32 = [v7 countByEnumeratingWithState:&v41 objects:v50 count:16];
        if (v32)
        {
          uint64_t v29 = i;
          uint64_t v8 = 0LL;
          id v9 = 0LL;
          uint64_t v31 = *(void *)v42;
          do
          {
            uint64_t v10 = 0LL;
            do
            {
              if (*(void *)v42 != v31) {
                objc_enumerationMutation(v30);
              }
              uint64_t v33 = v10;
              unint64_t v11 = *(void **)(*((void *)&v41 + 1) + 8 * v10);
              __int128 v37 = 0u;
              __int128 v38 = 0u;
              __int128 v39 = 0u;
              __int128 v40 = 0u;
              [v11 tlvs];
              BOOL v12 = (void *)objc_claimAutoreleasedReturnValue();
              uint64_t v13 = [v12 countByEnumeratingWithState:&v37 objects:v49 count:16];
              if (v13)
              {
                uint64_t v14 = v13;
                uint64_t v15 = *(void *)v38;
                do
                {
                  for (uint64_t j = 0LL; j != v14; ++j)
                  {
                    if (*(void *)v38 != v15) {
                      objc_enumerationMutation(v12);
                    }
                    __int128 v17 = *(void **)(*((void *)&v37 + 1) + 8 * j);
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      id v18 = v17;
                      uint64_t v19 = [v18 longname];

                      id v9 = (void *)v19;
                    }

                    else
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        id v20 = v17;
                        uint64_t v21 = [v20 digest];

                        uint64_t v8 = (void *)v21;
                      }

                      else
                      {
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0 && !a5)
                        {
                          if (-[UARPSuperBinary productionMode](v34, "productionMode")) {
                            uint64_t v22 = MEMORY[0x189604A88];
                          }
                          else {
                            uint64_t v22 = MEMORY[0x189604A80];
                          }
                          [v35 setObject:v22 forKeyedSubscript:@"EPRO"];
                        }
                      }
                    }
                  }

                  uint64_t v14 = [v12 countByEnumeratingWithState:&v37 objects:v49 count:16];
                }

                while (v14);
              }

              uint64_t v10 = v33 + 1;
            }

            while (v33 + 1 != v32);
            uint64_t v32 = [v30 countByEnumeratingWithState:&v41 objects:v50 count:16];
          }

          while (v32);
          if (v9)
          {
            uint64_t i = v29;
            if (v8) {
              [v35 setObject:v8 forKeyedSubscript:v9];
            }
          }

          else
          {
            uint64_t i = v29;
          }
        }

        else
        {
          id v9 = 0LL;
          uint64_t v8 = 0LL;
        }
      }

      uint64_t v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v45,  v51,  16LL);
    }

    while (v28);
  }

  uint64_t v23 = (void *)objc_opt_new();
  [v23 appendFormat:@"%@", v34->_ticketPrefix];
  if (v34->_prefixNeedsUnitNumber) {
    objc_msgSend(v23, "appendFormat:", @"%lu", a4);
  }
  [v23 appendFormat:@",%@", v34->_ticketSuffix];
  [v25 setObject:v35 forKeyedSubscript:v23];
}

- (id)requiredTSSOptions
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  v3 = (void *)objc_opt_new();
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  uint64_t v4 = self->_tlvs;
  uint64_t v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          id v10 = v9;
          if (objc_msgSend(v10, "tssOption", (void)v14) == -2001563388)
          {
            uint64_t v11 = 4LL;
            goto LABEL_29;
          }

          if ([v10 tssOption] == -2001563387)
          {
            uint64_t v11 = 5LL;
            goto LABEL_29;
          }

          if ([v10 tssOption] == -2001563386)
          {
            uint64_t v11 = 7LL;
            goto LABEL_29;
          }

          if ([v10 tssOption] == -2001563339)
          {
            uint64_t v11 = 29LL;
            goto LABEL_29;
          }

          if ([v10 tssOption] == -2001563385)
          {
            uint64_t v11 = 24LL;
            goto LABEL_29;
          }

          if ([v10 tssOption] == -2001563383)
          {
            uint64_t v11 = 8LL;
            goto LABEL_29;
          }

          if ([v10 tssOption] == -2001563382)
          {
            uint64_t v11 = 9LL;
            goto LABEL_29;
          }

          if ([v10 tssOption] == -2001563381)
          {
            uint64_t v11 = 10LL;
            goto LABEL_29;
          }

          if ([v10 tssOption] == -2001563343)
          {
            uint64_t v11 = 25LL;
            goto LABEL_29;
          }

          if ([v10 tssOption] == -2001563342)
          {
            uint64_t v11 = 26LL;
            goto LABEL_29;
          }

          if ([v10 tssOption] == -2001563341)
          {
            uint64_t v11 = 27LL;
LABEL_29:
            [MEMORY[0x189607968] numberWithUnsignedLong:v11];
            BOOL v12 = (void *)objc_claimAutoreleasedReturnValue();
            [v3 addObject:v12];
          }

          continue;
        }
      }

      uint64_t v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
    }

    while (v6);
  }

  return v3;
}

- (id)getDataBlock:(unint64_t)a3 offset:(unint64_t)a4
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_totalBytesRequested += [v5 length];
  return v5;
}

- (void)logInternal:(id)a3 arguments:(char *)a4
{
  uint64_t v6 = (objc_class *)MEMORY[0x189607940];
  id v7 = a3;
  uint64_t v8 = (void *)[[v6 alloc] initWithFormat:v7 arguments:a4];

  [v8 appendString:@"\n"];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    delegateQueue = self->_delegateQueue;
    if (delegateQueue)
    {
      v12[0] = MEMORY[0x1895F87A8];
      v12[1] = 3221225472LL;
      v12[2] = __41__UARPSuperBinary_logInternal_arguments___block_invoke;
      v12[3] = &unk_18A141D18;
      v12[4] = self;
      id v13 = v8;
      dispatch_async((dispatch_queue_t)delegateQueue, v12);
    }

    else
    {
      id v11 = objc_loadWeakRetained((id *)&self->_delegate);
      [v11 superbinary:self logString:v8];
    }
  }
}

void __41__UARPSuperBinary_logInternal_arguments___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8LL));
  [WeakRetained superbinary:*(void *)(a1 + 32) logString:*(void *)(a1 + 40)];
}

- (void)log:(id)a3
{
}

- (unsigned)boardID
{
  return self->_boardID;
}

- (void)setBoardID:(unsigned int)a3
{
  self->_boardID = a3;
}

- (unsigned)chipID
{
  return self->_chipID;
}

- (void)setChipID:(unsigned int)a3
{
  self->_chipID = a3;
}

- (unint64_t)ecID
{
  return self->_ecID;
}

- (void)setEcID:(unint64_t)a3
{
  self->_ecID = a3;
}

- (NSData)ecidData
{
  return (NSData *)objc_getProperty(self, a2, 184LL, 1);
}

- (void)setEcidData:(id)a3
{
}

- (NSData)nonce
{
  return (NSData *)objc_getProperty(self, a2, 192LL, 1);
}

- (void)setNonce:(id)a3
{
}

- (unsigned)productionMode
{
  return self->_productionMode;
}

- (void)setProductionMode:(unsigned __int8)a3
{
  self->_productionMode = a3;
}

- (unsigned)securityDomain
{
  return self->_securityDomain;
}

- (void)setSecurityDomain:(unsigned __int8)a3
{
  self->_securityDomain = a3;
}

- (unsigned)securityMode
{
  return self->_securityMode;
}

- (void)setSecurityMode:(unsigned __int8)a3
{
  self->_securityMode = a3;
}

- (unsigned)life
{
  return self->_life;
}

- (void)setLife:(unsigned __int8)a3
{
  self->_life = a3;
}

- (BOOL)provisioning
{
  return self->_provisioning;
}

- (void)setProvisioning:(BOOL)a3
{
  self->_provisioning = a3;
}

- (unsigned)manifestEpoch
{
  return self->_manifestEpoch;
}

- (void)setManifestEpoch:(unsigned __int8)a3
{
  self->_manifestEpoch = a3;
}

- (NSNumber)trustedOverride
{
  return (NSNumber *)objc_getProperty(self, a2, 200LL, 1);
}

- (void)setTrustedOverride:(id)a3
{
}

- (NSNumber)demote
{
  return (NSNumber *)objc_getProperty(self, a2, 208LL, 1);
}

- (void)setDemote:(id)a3
{
}

- (BOOL)needsHostPersonalization
{
  return self->_needsHostPersonalization;
}

- (NSArray)tlvs
{
  return (NSArray *)objc_getProperty(self, a2, 64LL, 1);
}

- (NSArray)payloads
{
  return (NSArray *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)layer2Context
{
  return self->_layer2Context;
}

- (void)setLayer2Context:(void *)a3
{
  self->_layer2Context = a3;
}

- (unint64_t)totalLength
{
  return self->_totalLength;
}

- (unint64_t)totalBytesRequested
{
  return self->_totalBytesRequested;
}

- (void).cxx_destruct
{
}

@end