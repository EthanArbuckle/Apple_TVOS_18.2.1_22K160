@interface UARPSuperBinaryOS
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
- (UARPSuperBinaryOS)initWithData:(id)a3 delegate:(id)a4 delegateQueue:(id)a5;
- (UARPSuperBinaryOS)initWithFilePath:(id)a3 delegate:(id)a4 delegateQueue:(id)a5;
- (UARPSuperBinaryOS)initWithURL:(id)a3 delegate:(id)a4 delegateQueue:(id)a5;
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

@implementation UARPSuperBinaryOS

- (UARPSuperBinaryOS)initWithData:(id)a3 delegate:(id)a4 delegateQueue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___UARPSuperBinaryOS;
  v11 = -[UARPSuperBinaryOS init](&v23, sel_init);
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
  if (-[UARPSuperBinaryOS expandSuperBinary](v12, "expandSuperBinary")) {
LABEL_4:
  }
    v21 = v12;
  else {
LABEL_5:
  }
    v21 = 0LL;

  return v21;
}

- (UARPSuperBinaryOS)initWithFilePath:(id)a3 delegate:(id)a4 delegateQueue:(id)a5
{
  id v8 = (void *)MEMORY[0x189603F48];
  id v9 = a5;
  id v10 = a4;
  id v11 = (id)[a3 stringByExpandingTildeInPath];
  id v12 = (id)[v8 dataWithContentsOfFile:v11];
  uint64_t v13 = -[UARPSuperBinaryOS initWithData:delegate:delegateQueue:]( self,  "initWithData:delegate:delegateQueue:",  v12,  v10,  v9);

  return v13;
}

- (UARPSuperBinaryOS)initWithURL:(id)a3 delegate:(id)a4 delegateQueue:(id)a5
{
  id v8 = (void *)MEMORY[0x189603F48];
  id v9 = a5;
  id v10 = a4;
  id v11 = (id)[v8 dataWithContentsOfURL:a3];
  id v12 = -[UARPSuperBinaryOS initWithData:delegate:delegateQueue:]( self,  "initWithData:delegate:delegateQueue:",  v11,  v10,  v9);

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
  v7 = objc_alloc(&OBJC_CLASS___UARPAssetVersionOS);
  id v8 = -[UARPAssetVersionOS initWithMajorVersion:minorVersion:releaseVersion:buildVersion:]( v7,  "initWithMajorVersion:minorVersion:releaseVersion:buildVersion:",  v16[3],  v16[4],  v16[5],  v16[6]);
  version = self->_version;
  self->_version = v8;

  if (!-[UARPSuperBinaryOS expandMetaData:](self, "expandMetaData:", v16)) {
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

  while (-[UARPSuperBinaryOS preparePayload:](self, "preparePayload:", v15));
  return v13;
}

- (BOOL)expandMetaData:(UARPSuperBinaryHeader *)a3
{
  unsigned int var5 = a3->var5;
  if (!var5) {
    return 1;
  }
  unint64_t v6 = a3->var4 + var5;
  if (-[NSData length](self->_data, "length") < v6) {
    return 0;
  }
  id v8 = -[NSData subdataWithRange:](self->_data, "subdataWithRange:", a3->var4, a3->var5);
  metaData = self->_metaData;
  self->_metaData = v8;

  return -[UARPSuperBinaryOS expandTLVs](self, "expandTLVs");
}

- (BOOL)preparePayload:(UARPPayloadHeader2 *)a3
{
  v5 = -[UARPAssetTagOS initWithChar1:char2:char3:char4:]( objc_alloc(&OBJC_CLASS___UARPAssetTagOS),  "initWithChar1:char2:char3:char4:",  (char)a3->var1.var0,  (char)a3->var1.var1,  (char)a3->var1.var2,  (char)a3->var1.var3);
  unint64_t v6 = -[UARPAssetVersionOS initWithMajorVersion:minorVersion:releaseVersion:buildVersion:]( objc_alloc(&OBJC_CLASS___UARPAssetVersionOS),  "initWithMajorVersion:minorVersion:releaseVersion:buildVersion:",  a3->var2.var0,  a3->var2.var1,  a3->var2.var2,  a3->var2.var3);
  unint64_t v7 = a3->var4 + a3->var3;
  if (-[NSData length](self->_data, "length") >= v7)
  {
    if (a3->var4) {
      id v9 = -[NSData subdataWithRange:](self->_data, "subdataWithRange:", a3->var3);
    }
    else {
      id v9 = 0LL;
    }
    unint64_t v10 = a3->var6 + a3->var5;
    if (-[NSData length](self->_data, "length") >= v10)
    {
      if (a3->var6) {
        unint64_t v11 = -[NSData subdataWithRange:](self->_data, "subdataWithRange:", a3->var5);
      }
      else {
        unint64_t v11 = 0LL;
      }
      BOOL v12 = -[UARPSuperBinaryPayloadOS initWithData:metaData:tag:version:]( objc_alloc(&OBJC_CLASS___UARPSuperBinaryPayloadOS),  "initWithData:metaData:tag:version:",  v11,  v9,  v5,  v6);
      BOOL v13 = v12;
      if (v12 && -[UARPSuperBinaryPayloadOS expandTLVs](v12, "expandTLVs"))
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
        id v10 = (id)objc_msgSend(v9, "tag", (void)v13);
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
        id v12 = (id)objc_msgSend(v11, "tag", (void)v16);
        char v13 = [v12 isEqual:v4];

        if ((v13 & 1) == 0) {
          [v5 addObject:v11];
        }
      }

      uint64_t v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
    }

    while (v8);
  }

  id v14 = (id)[MEMORY[0x189603F18] arrayWithArray:v5];
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
    id v10 =  +[UARPMetaDataTLVOS tlvFromType:length:value:]( &OBJC_CLASS___UARPMetaDataTLVOS,  "tlvFromType:length:value:",  2293403952LL,  -[NSData length](manifest, "length"),  -[NSData bytes](v20->_manifest, "bytes"));
    if (v10) {
      -[NSMutableArray addObject:](v20->_trimmedTlvs, "addObject:", v10);
    }
  }

  char v11 = (void *)objc_opt_new();
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v12 = v20->_trimmedTlvs;
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
        id v17 = (id)[*(id *)(*((void *)&v21 + 1) + 8 * j) generateTLV];
        [v11 appendData:v17];
      }

      uint64_t v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v21,  v29,  16LL);
    }

    while (v14);
  }

  id v18 = (id)[MEMORY[0x189603F48] dataWithData:v11];
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
      id v8 =  +[UARPMetaDataTLVOS tlvFromType:length:value:]( &OBJC_CLASS___UARPMetaDataTLVOS,  "tlvFromType:length:value:",  v5,  v7,  &v3[v6]);
      if (!v8) {
        break;
      }
      uint64_t v9 = v8;
      -[NSMutableArray addObject:](self->_tlvs, "addObject:", v8);
    }

    while (v4 < -[NSData length](self->_metaData, "length"));
  }

  -[UARPSuperBinaryOS processTLVsForPersonalization](self, "processTLVsForPersonalization");
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
  id v8 = self->_payloads;
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
          -[UARPSuperBinaryOS log:](self, "log:", @"Personalizing %@", v13);
          id v14 = (id)[v13 composeTSSRequest:a3];
          if (!v14
            || (id v15 = (id)[v13 tag],
                -[UARPSuperBinaryOS log:](self, "log:", @"TSS Request Options for payload %@", v15),
                v15,
                id v16 = (id)[v13 tssRequest],
                -[UARPSuperBinaryOS log:](self, "log:", @"%@", v16),
                v16,
                ![v13 queryTatsuSigningServer:v22 ssoOnly:v5 error:0]))
          {

            __int128 v19 = 0LL;
            goto LABEL_18;
          }
        }

        else
        {
          id v14 = (id)[v13 tag];
          -[UARPSuperBinaryOS log:](self, "log:", @"Host Personalization not required for payload %@", v14);
        }
      }

      uint64_t v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v23,  v27,  16LL);
      if (v10) {
        continue;
      }
      break;
    }
  }

  if (!-[UARPSuperBinaryOS needsHostPersonalization](self, "needsHostPersonalization")
    || (id v17 = -[UARPSuperBinaryOS composeTSSRequest:asMeasurement:](self, "composeTSSRequest:asMeasurement:", a3, 0LL),
        v18 = -[UARPSuperBinaryOS queryTatsuSigningServer:ssoOnly:error:]( self,  "queryTatsuSigningServer:ssoOnly:error:",  v22,  v5,  0LL),  __int128 v19 = 0LL,  v18))
  {
    v20 = (NSMutableArray *) -[UARPSuperBinaryOS generatePersonalizedSuperBinary]( self,  "generatePersonalizedSuperBinary");
    id v8 = v20;
    if (v20)
    {
      id v8 = v20;
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
  if (!v7) {
    id v7 = (id)[MEMORY[0x189604030] URLWithString:@"https://gs.apple.com:443"];
  }
  tssRequest = self->_tssRequest;
  if (v5) {
    id v9 = UARPPersonalizationTSSRequestWithSigningServerSSO(tssRequest, v7);
  }
  else {
    id v9 = UARPPersonalizationTSSRequestWithSigningServer(tssRequest, v7);
  }
  uint64_t v10 = v9;
  if (v9)
  {
    uint64_t v11 = (NSData *)(id)[v9 objectForKeyedSubscript:self->_keyManifest];
    manifest = self->_manifest;
    self->_manifest = v11;
  }

  return v10 != 0LL;
}

- (id)generatePersonalizedSuperBinary
{
  return -[UARPSuperBinaryOS generatePersonalizedSuperBinaryInternal:]( self,  "generatePersonalizedSuperBinaryInternal:",  self->_payloads);
}

- (id)generatePersonalizedSuperBinaryWithoutRRKO
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  v3 = -[UARPAssetTagOS initWithString:](objc_alloc(&OBJC_CLASS___UARPAssetTagOS), "initWithString:", @"RRKO");
  unint64_t v4 = -[UARPAssetTagOS initWithString:](objc_alloc(&OBJC_CLASS___UARPAssetTagOS), "initWithString:", @"rrko");
  id v16 = self;
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
        id v11 = (id)objc_msgSend(v10, "tag", v16);
        if ([v11 isEqual:v3])
        {
        }

        else
        {
          id v12 = (id)[v10 tag];
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

  id v14 =  -[UARPSuperBinaryOS generatePersonalizedSuperBinaryInternal:]( v16,  "generatePersonalizedSuperBinaryInternal:",  v17);
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
  int v36 = -[UARPAssetVersionOS majorVersion](self->_version, "majorVersion");
  int v37 = -[UARPAssetVersionOS minorVersion](self->_version, "minorVersion");
  int v38 = -[UARPAssetVersionOS releaseVersion](self->_version, "releaseVersion");
  int v39 = -[UARPAssetVersionOS buildVersion](self->_version, "buildVersion");
  int v42 = 44;
  int v43 = 40 * [v4 count];
  id v7 = -[UARPSuperBinaryOS personalizedMetaData](self, "personalizedMetaData");
  int v40 = v43 + 44;
  int v8 = [v7 length];
  int v9 = v43 + 44 + v8;
  int v41 = v8;
  int v35 = v9;
  id v32 = v7;
  [v6 appendData:v7];
  uint64_t v10 = (unsigned int *)calloc([v4 count], 0x28uLL);
  if ([v4 count])
  {
    unint64_t v11 = 0LL;
    id v12 = v10 + 4;
    do
    {
      id v13 = (id)[v4 objectAtIndex:v11];
      id v14 = (id)[v13 personalizedMetaData];
      *(v12 - 4) = 40;
      id v15 = (id)[v13 tag];
      *((_BYTE *)v12 - 12) = [v15 char1];

      id v16 = (id)[v13 tag];
      *((_BYTE *)v12 - 11) = [v16 char2];

      id v17 = (id)[v13 tag];
      *((_BYTE *)v12 - 10) = [v17 char3];

      id v18 = (id)[v13 tag];
      *((_BYTE *)v12 - 9) = [v18 char4];

      id v19 = (id)[v13 version];
      *(v12 - 2) = [v19 majorVersion];

      id v20 = (id)[v13 version];
      *(v12 - 1) = [v20 minorVersion];

      id v21 = (id)[v13 version];
      _DWORD *v12 = [v21 releaseVersion];

      id v22 = (id)[v13 version];
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
      id v27 = (id)[v4 objectAtIndex:v24];
      id v28 = (id)[v27 personalizedData];
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
  id v7 = (NSMutableDictionary *)objc_opt_new();
  tatsuMeasurements = self->_tatsuMeasurements;
  self->_tatsuMeasurements = v7;

  if (-[UARPSuperBinaryOS expandTLVs](self, "expandTLVs")) {
    -[UARPSuperBinaryOS processTLVsForPersonalization](self, "processTLVsForPersonalization");
  }
  if (self->_needsHostPersonalization) {
    -[UARPSuperBinaryOS generateTatsuMeasurements:](self, "generateTatsuMeasurements:", a3);
  }
  else {
    -[UARPSuperBinaryOS generateTatsuMeasurementsPerPayload:](self, "generateTatsuMeasurementsPerPayload:", a3);
  }
  int v9 = (void *)NSString;
  id v10 = (id)[v6 lastPathComponent];
  id v11 = (id)[v9 stringWithFormat:@"%@.plist", v10];

  id v12 = (void *)MEMORY[0x189604030];
  id v13 = (id)[v6 URLByDeletingLastPathComponent];

  id v14 = (id)[v12 fileURLWithPath:v11 isDirectory:0 relativeToURL:v13];
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
          id v10 = *(void **)(*((void *)&v13 + 1) + 8 * v9);
          unint64_t v11 = 1LL;
          do
          {
            id v12 = (id)objc_msgSend(v10, "tatsuMeasurements:", v11, (void)v13);
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
      id v9 = -[UARPSuperBinaryOS tatsuMeasurements:](self, "tatsuMeasurements:", v8);
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
          id v10 = (NSString *)(id)[v9 ticketPrefix];
          ticketPrefix = self->_ticketPrefix;
          self->_ticketPrefix = v10;
LABEL_12:

          goto LABEL_13;
        }

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          id v9 = v8;
          id v12 = (NSString *)(id)[v9 manifestSuffix];
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
  id v5 = (id)-[NSMutableArray count](self->_tlvs, "count");
  if (v5) {
    id v5 = -[UARPSuperBinaryOS composeTSSRequest:asMeasurement:](self, "composeTSSRequest:asMeasurement:", a3, 1LL);
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

  id v9 = -[UARPSuperBinaryOS requiredTSSOptions](self, "requiredTSSOptions");
  id v10 = (NSMutableString *)objc_opt_new();
  keyManifest = self->_keyManifest;
  self->_keyManifest = v10;

  -[NSMutableString appendFormat:](self->_keyManifest, "appendFormat:", @"%@", self->_ticketPrefix);
  if (self->_ticketNeedsUnitNumber) {
    -[NSMutableString appendFormat:](self->_keyManifest, "appendFormat:", @"%lu", a3);
  }
  -[NSMutableString appendFormat:](self->_keyManifest, "appendFormat:", @",Ticket");
  id v12 = (void *)objc_opt_new();
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
            id v18 = -[UARPSuperBinaryOS tssKeyName:unitNumber:](self, "tssKeyName:unitNumber:", @"BoardID", a3);
            uint64_t v19 = (void *)MEMORY[0x189607968];
            uint64_t v20 = -[UARPSuperBinaryOS boardID](self, "boardID");
            goto LABEL_13;
          case 5u:
            id v18 = -[UARPSuperBinaryOS tssKeyName:unitNumber:](self, "tssKeyName:unitNumber:", @"ChipID", a3);
            uint64_t v19 = (void *)MEMORY[0x189607968];
            uint64_t v20 = -[UARPSuperBinaryOS chipID](self, "chipID");
LABEL_13:
            int v23 = (NSData *)(id)[v19 numberWithUnsignedInt:v20];
            goto LABEL_28;
          case 7u:
            id v18 = -[UARPSuperBinaryOS tssKeyName:unitNumber:](self, "tssKeyName:unitNumber:", @"ECID", a3);
            int v23 = (NSData *)(id)objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedLongLong:",  -[UARPSuperBinaryOS ecID](self, "ecID"));
            goto LABEL_28;
          case 8u:
            id v18 =  -[UARPSuperBinaryOS tssKeyName:unitNumber:]( self,  "tssKeyName:unitNumber:",  @"SecurityDomain",  a3);
            unint64_t v24 = (void *)MEMORY[0x189607968];
            uint64_t v25 = -[UARPSuperBinaryOS securityDomain](self, "securityDomain");
            goto LABEL_27;
          case 9u:
            id v18 =  -[UARPSuperBinaryOS tssKeyName:unitNumber:]( self,  "tssKeyName:unitNumber:",  @"SecurityMode",  a3);
            int v21 = -[UARPSuperBinaryOS securityMode](self, "securityMode");
            goto LABEL_17;
          case 0xAu:
            id v18 =  -[UARPSuperBinaryOS tssKeyName:unitNumber:]( self,  "tssKeyName:unitNumber:",  @"ProductionMode",  a3);
            int v21 = -[UARPSuperBinaryOS productionMode](self, "productionMode");
LABEL_17:
            if (v21) {
              ecidData = (NSData *)MEMORY[0x189604A88];
            }
            else {
              ecidData = (NSData *)MEMORY[0x189604A80];
            }
            goto LABEL_20;
          case 0x18u:
            id v18 = -[UARPSuperBinaryOS tssKeyName:unitNumber:](self, "tssKeyName:unitNumber:", @"Nonce", a3);
            int v23 = -[UARPSuperBinaryOS nonce](self, "nonce");
            goto LABEL_28;
          case 0x19u:
            id v18 = -[UARPSuperBinaryOS tssKeyName:unitNumber:](self, "tssKeyName:unitNumber:", @"Life", a3);
            unint64_t v24 = (void *)MEMORY[0x189607968];
            uint64_t v25 = -[UARPSuperBinaryOS life](self, "life");
            goto LABEL_27;
          case 0x1Au:
            id v18 =  -[UARPSuperBinaryOS tssKeyName:unitNumber:]( self,  "tssKeyName:unitNumber:",  @"Provisioning",  a3);
            if (!-[UARPSuperBinaryOS provisioning](self, "provisioning")) {
              goto LABEL_29;
            }
            __int128 v26 = self->_tssRequest;
            ecidData = (NSData *)MEMORY[0x189604A88];
            goto LABEL_21;
          case 0x1Bu:
            id v18 =  -[UARPSuperBinaryOS tssKeyName:unitNumber:]( self,  "tssKeyName:unitNumber:",  @"ManifestEpoch",  a3);
            unint64_t v24 = (void *)MEMORY[0x189607968];
            uint64_t v25 = -[UARPSuperBinaryOS manifestEpoch](self, "manifestEpoch");
LABEL_27:
            int v23 = (NSData *)(id)[v24 numberWithUnsignedChar:v25];
LABEL_28:
            id v27 = v23;
            -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_tssRequest,  "setObject:forKeyedSubscript:",  v23,  v18);

            goto LABEL_29;
          case 0x1Du:
            id v18 = -[UARPSuperBinaryOS tssKeyName:unitNumber:](self, "tssKeyName:unitNumber:", @"ECID", a3);
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

  -[UARPSuperBinaryOS processMeasurementsForTSSOptions:unitNumber:asMeasurement:]( self,  "processMeasurementsForTSSOptions:unitNumber:asMeasurement:",  self->_tssRequest,  a3,  v30);
  id v28 = (id)[MEMORY[0x189603F68] dictionaryWithDictionary:self->_tssRequest];

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
  id v8 = (id)[NSString stringWithString:v7];

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
        id v7 = (id)[*(id *)(*((void *)&v45 + 1) + 8 * i) measurements];
        __int128 v41 = 0u;
        __int128 v42 = 0u;
        __int128 v43 = 0u;
        __int128 v44 = 0u;
        id v30 = v7;
        uint64_t v32 = [v7 countByEnumeratingWithState:&v41 objects:v50 count:16];
        if (v32)
        {
          uint64_t v29 = i;
          id v8 = 0LL;
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
              id v12 = (id)[v11 tlvs];
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
                      id v19 = (id)[v18 longname];

                      id v9 = v19;
                    }

                    else
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        id v20 = v17;
                        id v21 = (id)[v20 digest];

                        id v8 = v21;
                      }

                      else
                      {
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0 && !a5)
                        {
                          if (-[UARPSuperBinaryOS productionMode](v34, "productionMode")) {
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
          id v8 = 0LL;
        }
      }

      uint64_t v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v45,  v51,  16LL);
    }

    while (v28);
  }

  int v23 = (void *)objc_opt_new();
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
            id v12 = (id)[MEMORY[0x189607968] numberWithUnsignedLong:v11];
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
  uint64_t v5 = -[NSData subdataWithRange:](self->_data, "subdataWithRange:", a4, a3);
  self->_totalBytesRequested += -[NSData length](v5, "length");
  return v5;
}

- (void)logInternal:(id)a3 arguments:(char *)a4
{
  uint64_t v6 = (objc_class *)MEMORY[0x189607940];
  id v7 = a3;
  id v8 = (void *)[[v6 alloc] initWithFormat:v7 arguments:a4];

  [v8 appendString:@"\n"];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    delegateQueue = self->_delegateQueue;
    if (delegateQueue)
    {
      v13[0] = MEMORY[0x1895F87A8];
      v13[1] = 3254779904LL;
      v13[2] = __43__UARPSuperBinaryOS_logInternal_arguments___block_invoke;
      v13[3] = &__block_descriptor_48_e8_32s40s_e5_v8__0l;
      v13[4] = self;
      id v14 = v8;
      dispatch_async((dispatch_queue_t)delegateQueue, v13);
      uint64_t v11 = v14;
    }

    else
    {
      id v12 = objc_loadWeakRetained((id *)&self->_delegate);
      [v12 superbinary:self logString:v8];
      uint64_t v11 = v12;
    }
  }
}

void __43__UARPSuperBinaryOS_logInternal_arguments___block_invoke(uint64_t a1)
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