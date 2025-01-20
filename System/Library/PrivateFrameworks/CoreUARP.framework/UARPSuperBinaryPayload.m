@interface UARPSuperBinaryPayload
- (BOOL)expandTLVs;
- (BOOL)getNeedsHostPersonalization;
- (BOOL)needsHostPersonalization;
- (BOOL)queryTatsuSigningServer:(id)a3 ssoOnly:(BOOL)a4 error:(id *)a5;
- (NSArray)measurements;
- (NSArray)tlvs;
- (NSData)manifest;
- (NSData)metaData;
- (NSData)nonce;
- (NSData)payloadData;
- (NSDictionary)tssRequest;
- (NSNumber)demote;
- (NSNumber)trustedOverride;
- (UARPAssetTag)tag;
- (UARPAssetVersion)version;
- (UARPSuperBinaryPayload)initWithData:(id)a3 metaData:(id)a4 tag:(id)a5 version:(id)a6;
- (id)composeTSSRequest:(unint64_t)a3;
- (id)composeTSSRequest:(unint64_t)a3 asMeasurement:(BOOL)a4;
- (id)description;
- (id)getManifest;
- (id)getMeasurements;
- (id)getTlvs;
- (id)getTssRequest;
- (id)personalizedData;
- (id)personalizedMetaData;
- (id)requiredTSSOptions;
- (id)tatsuMeasurements:(unint64_t)a3;
- (id)tssKeyName:(id)a3 unitNumber:(unint64_t)a4;
- (id)tssRequestAsString;
- (unint64_t)ecID;
- (unsigned)boardID;
- (unsigned)chipID;
- (unsigned)productionMode;
- (unsigned)securityDomain;
- (unsigned)securityMode;
- (void)addSubfile:(id)a3 tag:(id)a4;
- (void)processMeasurementsForTSSOptions:(id)a3 unitNumber:(unint64_t)a4 asMeasurement:(BOOL)a5;
- (void)processTLVsForPersonalization;
- (void)removeSubfile:(id)a3 tag:(id)a4;
- (void)setBoardID:(unsigned int)a3;
- (void)setChipID:(unsigned int)a3;
- (void)setDemote:(id)a3;
- (void)setEcID:(unint64_t)a3;
- (void)setManifest:(id)a3;
- (void)setNonce:(id)a3;
- (void)setProductionMode:(unsigned __int8)a3;
- (void)setSecurityDomain:(unsigned __int8)a3;
- (void)setSecurityMode:(unsigned __int8)a3;
- (void)setTrustedOverride:(id)a3;
@end

@implementation UARPSuperBinaryPayload

- (UARPSuperBinaryPayload)initWithData:(id)a3 metaData:(id)a4 tag:(id)a5 version:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v36.receiver = self;
  v36.super_class = (Class)&OBJC_CLASS___UARPSuperBinaryPayload;
  v14 = -[UARPSuperBinaryPayload init](&v36, sel_init);
  if (v14)
  {
    uint64_t v15 = [v12 copy];
    tag = v14->_tag;
    v14->_tag = (UARPAssetTag *)v15;

    uint64_t v17 = [v13 copy];
    version = v14->_version;
    v14->_version = (UARPAssetVersion *)v17;

    uint64_t v19 = [v10 copy];
    payloadData = v14->_payloadData;
    v14->_payloadData = (NSData *)v19;

    uint64_t v21 = [v11 copy];
    metaData = v14->_metaData;
    v14->_metaData = (NSData *)v21;

    uint64_t v23 = objc_opt_new();
    tlvs = v14->_tlvs;
    v14->_tlvs = (NSMutableArray *)v23;

    uint64_t v25 = objc_opt_new();
    measurements = v14->_measurements;
    v14->_measurements = (NSMutableArray *)v25;

    uint64_t v27 = objc_opt_new();
    tssRequest = v14->_tssRequest;
    v14->_tssRequest = (NSMutableDictionary *)v27;

    uint64_t v29 = objc_opt_new();
    trimmedTlvs = v14->_trimmedTlvs;
    v14->_trimmedTlvs = (NSMutableArray *)v29;

    uint64_t v31 = objc_opt_new();
    subfiles = v14->_subfiles;
    v14->_subfiles = (NSMutableArray *)v31;

    v33 = -[FTABFile initWithData:](objc_alloc(&OBJC_CLASS___FTABFile), "initWithData:", v14->_payloadData);
    ftab = v14->_ftab;
    v14->_ftab = v33;
  }

  return v14;
}

- (id)getTlvs
{
  return (id)[MEMORY[0x189603F18] arrayWithArray:self->_tlvs];
}

- (id)getMeasurements
{
  return (id)[MEMORY[0x189603F18] arrayWithArray:self->_measurements];
}

- (id)personalizedData
{
  if (self->_ftab)
  {
    if (-[NSMutableArray count](self->_subfiles, "count")) {
      -[FTABFile addSubfiles:](self->_ftab, "addSubfiles:", self->_subfiles);
    }
    if (self->_manifest) {
      -[FTABFile setManifest:](self->_ftab, "setManifest:");
    }
    -[FTABFile writeToData](self->_ftab, "writeToData");
    v3 = (NSData *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v3 = self->_payloadData;
  }

  return v3;
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

  if (!v20->_ftab)
  {
    manifest = v20->_manifest;
    if (manifest)
    {
      +[UARPMetaDataTLV tlvFromType:length:value:]( &OBJC_CLASS___UARPMetaDataTLV,  "tlvFromType:length:value:",  2293403952LL,  -[NSData length](manifest, "length"),  -[NSData bytes](v20->_manifest, "bytes"));
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10) {
        -[NSMutableArray addObject:](v20->_trimmedTlvs, "addObject:", v10);
      }
    }
  }

  id v11 = (void *)objc_opt_new();
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
        [*(id *)(*((void *)&v21 + 1) + 8 * j) generateTLV];
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
        [v11 appendData:v17];
      }

      uint64_t v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v21,  v29,  16LL);
    }

    while (v14);
  }

  [MEMORY[0x189603F48] dataWithData:v11];
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (BOOL)getNeedsHostPersonalization
{
  return self->_needsHostPersonalization;
}

- (id)getManifest
{
  return self->_manifest;
}

- (id)getTssRequest
{
  return (id)[MEMORY[0x189603F68] dictionaryWithDictionary:self->_tssRequest];
}

- (id)tssRequestAsString
{
  return (id)[NSString stringWithFormat:@"%@", self->_tssRequest];
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
      v9 = (void *)v8;
      -[NSMutableArray addObject:](self->_tlvs, "addObject:", v8);
    }

    while (v4 < -[NSData length](self->_metaData, "length"));
  }

  -[UARPSuperBinaryPayload processTLVsForPersonalization](self, "processTLVsForPersonalization");
  return 1;
}

- (id)requiredTSSOptions
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  v3 = (void *)objc_opt_new();
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  unint64_t v4 = self->_tlvs;
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
        v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
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
            id v12 = (void *)objc_claimAutoreleasedReturnValue();
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

- (id)composeTSSRequest:(unint64_t)a3
{
  return -[UARPSuperBinaryPayload composeTSSRequest:asMeasurement:](self, "composeTSSRequest:asMeasurement:", a3, 0LL);
}

- (id)composeTSSRequest:(unint64_t)a3 asMeasurement:(BOOL)a4
{
  BOOL v4 = a4;
  manifest = self->_manifest;
  self->_manifest = 0LL;

  uint64_t v8 = (NSMutableDictionary *)objc_opt_new();
  tssRequest = self->_tssRequest;
  self->_tssRequest = v8;

  id v10 = (NSMutableString *)objc_opt_new();
  keyManifest = self->_keyManifest;
  self->_keyManifest = v10;

  -[NSMutableString appendFormat:](self->_keyManifest, "appendFormat:", @"%@", self->_ticketPrefix);
  if (self->_ticketNeedsUnitNumber) {
    -[NSMutableString appendFormat:](self->_keyManifest, "appendFormat:", @"%lu", a3);
  }
  -[NSMutableString appendFormat:](self->_keyManifest, "appendFormat:", @",Ticket");
  if (!v4)
  {
    uint64_t v29 = (void *)objc_opt_new();
    [v29 appendFormat:@"@%@", self->_keyManifest];
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_tssRequest,  "setObject:forKeyedSubscript:",  MEMORY[0x189604A88],  v29);
    v30 = -[UARPSuperBinaryPayload tssKeyName:unitNumber:](self, "tssKeyName:unitNumber:", @"BoardID", a3);
    objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInt:", -[UARPSuperBinaryPayload boardID](self, "boardID"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_tssRequest, "setObject:forKeyedSubscript:", v12, v30);

    -[UARPSuperBinaryPayload tssKeyName:unitNumber:](self, "tssKeyName:unitNumber:", @"ChipID", a3);
    __int128 v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInt:", -[UARPSuperBinaryPayload chipID](self, "chipID"));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_tssRequest, "setObject:forKeyedSubscript:", v13, v28);

    -[UARPSuperBinaryPayload tssKeyName:unitNumber:](self, "tssKeyName:unitNumber:", @"ECID", a3);
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", -[UARPSuperBinaryPayload ecID](self, "ecID"));
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_tssRequest, "setObject:forKeyedSubscript:", v15, v14);

    -[UARPSuperBinaryPayload tssKeyName:unitNumber:](self, "tssKeyName:unitNumber:", @"Nonce", a3);
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPSuperBinaryPayload nonce](self, "nonce");
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_tssRequest, "setObject:forKeyedSubscript:", v17, v16);
    v18 = -[UARPSuperBinaryPayload tssKeyName:unitNumber:](self, "tssKeyName:unitNumber:", @"ProductionMode", a3);
    int v19 = -[UARPSuperBinaryPayload productionMode](self, "productionMode");
    uint64_t v20 = MEMORY[0x189604A80];
    uint64_t v21 = MEMORY[0x189604A88];
    if (v19) {
      uint64_t v22 = MEMORY[0x189604A88];
    }
    else {
      uint64_t v22 = MEMORY[0x189604A80];
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_tssRequest, "setObject:forKeyedSubscript:", v22, v18);
    -[UARPSuperBinaryPayload tssKeyName:unitNumber:](self, "tssKeyName:unitNumber:", @"SecurityDomain", a3);
    __int128 v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedChar:",  -[UARPSuperBinaryPayload securityDomain](self, "securityDomain"));
    __int128 v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_tssRequest, "setObject:forKeyedSubscript:", v24, v23);

    -[UARPSuperBinaryPayload tssKeyName:unitNumber:](self, "tssKeyName:unitNumber:", @"SecurityMode", a3);
    __int128 v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[UARPSuperBinaryPayload securityMode](self, "securityMode")) {
      uint64_t v26 = v21;
    }
    else {
      uint64_t v26 = v20;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_tssRequest, "setObject:forKeyedSubscript:", v26, v25);
  }

  -[UARPSuperBinaryPayload processMeasurementsForTSSOptions:unitNumber:asMeasurement:]( self,  "processMeasurementsForTSSOptions:unitNumber:asMeasurement:",  self->_tssRequest,  a3,  v4);
  return (id)[MEMORY[0x189603F68] dictionaryWithDictionary:self->_tssRequest];
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
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  id v10 = v9;
  if (v9)
  {
    [v9 objectForKeyedSubscript:self->_keyManifest];
    uint64_t v11 = (NSData *)objc_claimAutoreleasedReturnValue();
    manifest = self->_manifest;
    self->_manifest = v11;
  }

  return v10 != 0LL;
}

- (void)processTLVsForPersonalization
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  v3 = self->_tlvs;
  uint64_t v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v12 + 1) + 8 * v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          self->_needsHostPersonalization = [v8 isRequired] != 0;
        }

        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            id v9 = v8;
            [v9 ticketPrefix];
            id v10 = (NSString *)objc_claimAutoreleasedReturnValue();
            ticketPrefix = self->_ticketPrefix;
            self->_ticketPrefix = v10;
          }

          else
          {
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
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  self->_suffixNeedsUnitNumber = [v8 suffixNeedsLogicalUnitNumber] != 0;
                }

                else
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0) {
                    -[NSMutableArray addObject:](self->_measurements, "addObject:", v8, (void)v12);
                  }
                }
              }
            }
          }
        }

        ++v7;
      }

      while (v5 != v7);
      uint64_t v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    }

    while (v5);
  }
}

- (void)processMeasurementsForTSSOptions:(id)a3 unitNumber:(unint64_t)a4 asMeasurement:(BOOL)a5
{
  uint64_t v42 = *MEMORY[0x1895F89C0];
  id v26 = a3;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  v30 = self;
  obuint64_t j = self->_measurements;
  uint64_t v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v36,  v41,  16LL);
  if (v27)
  {
    uint64_t v25 = *(void *)v37;
    do
    {
      uint64_t v6 = 0LL;
      do
      {
        if (*(void *)v37 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v29 = v6;
        uint64_t v7 = *(void **)(*((void *)&v36 + 1) + 8 * v6);
        uint64_t v8 = (void *)objc_opt_new();
        __int128 v32 = 0u;
        __int128 v33 = 0u;
        __int128 v34 = 0u;
        __int128 v35 = 0u;
        [v7 tlvs];
        id v9 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v10 = [v9 countByEnumeratingWithState:&v32 objects:v40 count:16];
        if (!v10)
        {
          __int128 v12 = 0LL;
          goto LABEL_38;
        }

        uint64_t v11 = v10;
        __int128 v12 = 0LL;
        uint64_t v13 = *(void *)v33;
        do
        {
          for (uint64_t i = 0LL; i != v11; ++i)
          {
            if (*(void *)v33 != v13) {
              objc_enumerationMutation(v9);
            }
            __int128 v15 = *(void **)(*((void *)&v32 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              id v16 = v15;
              uint64_t v17 = [v16 longname];

              __int128 v12 = (void *)v17;
              continue;
            }

            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              [v15 digest];
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              [v8 setObject:v18 forKeyedSubscript:@"Digest"];

              continue;
            }

            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              if (a5) {
                continue;
              }
              if (-[UARPSuperBinaryPayload securityMode](v30, "securityMode")) {
                uint64_t v19 = MEMORY[0x189604A88];
              }
              else {
                uint64_t v19 = MEMORY[0x189604A80];
              }
              uint64_t v20 = v8;
              uint64_t v21 = @"ESEC";
              goto LABEL_33;
            }

            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              if (a5) {
                continue;
              }
              if (-[UARPSuperBinaryPayload productionMode](v30, "productionMode")) {
                uint64_t v19 = MEMORY[0x189604A88];
              }
              else {
                uint64_t v19 = MEMORY[0x189604A80];
              }
              uint64_t v20 = v8;
              uint64_t v21 = @"EPRO";
              goto LABEL_33;
            }

            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              int v22 = [v15 trusted];
              if (!a5)
              {
                if (v22) {
                  uint64_t v19 = MEMORY[0x189604A88];
                }
                else {
                  uint64_t v19 = MEMORY[0x189604A80];
                }
                uint64_t v20 = v8;
                uint64_t v21 = @"Trusted";
LABEL_33:
                [v20 setObject:v19 forKeyedSubscript:v21];
                continue;
              }
            }
          }

          uint64_t v11 = [v9 countByEnumeratingWithState:&v32 objects:v40 count:16];
        }

        while (v11);
LABEL_38:

        __int128 v23 = (void *)objc_opt_new();
        [v23 appendFormat:@"%@", v30->_ticketPrefix];
        if (v30->_prefixNeedsUnitNumber) {
          objc_msgSend(v23, "appendFormat:", @"%lu", a4);
        }
        [v23 appendFormat:@",%@", v12];
        if (v30->_suffixNeedsUnitNumber) {
          objc_msgSend(v23, "appendFormat:", @",%lu", a4);
        }
        [v26 setObject:v8 forKeyedSubscript:v23];

        uint64_t v6 = v29 + 1;
      }

      while (v29 + 1 != v27);
      uint64_t v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v36,  v41,  16LL);
    }

    while (v27);
  }
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

- (id)description
{
  v3 = (void *)objc_opt_new();
  [v3 appendFormat:@"Payload - 4cc <%@> - Version <%@> - TLVs - %@", self->_tag, self->_version, self->_tlvs];
  [NSString stringWithString:v3];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)tatsuMeasurements:(unint64_t)a3
{
  uint64_t v5 = (void *)-[NSMutableArray count](self->_tlvs, "count");
  if (v5)
  {
    -[UARPSuperBinaryPayload composeTSSRequest:asMeasurement:](self, "composeTSSRequest:asMeasurement:", a3, 1LL);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (UARPAssetTag)tag
{
  return (UARPAssetTag *)objc_getProperty(self, a2, 120LL, 1);
}

- (UARPAssetVersion)version
{
  return (UARPAssetVersion *)objc_getProperty(self, a2, 128LL, 1);
}

- (NSArray)tlvs
{
  return (NSArray *)objc_getProperty(self, a2, 8LL, 1);
}

- (NSData)payloadData
{
  return (NSData *)objc_getProperty(self, a2, 136LL, 1);
}

- (NSData)metaData
{
  return (NSData *)objc_getProperty(self, a2, 144LL, 1);
}

- (BOOL)needsHostPersonalization
{
  return self->_needsHostPersonalization;
}

- (NSData)manifest
{
  return (NSData *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setManifest:(id)a3
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

- (NSData)nonce
{
  return (NSData *)objc_getProperty(self, a2, 160LL, 1);
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

- (NSNumber)trustedOverride
{
  return (NSNumber *)objc_getProperty(self, a2, 168LL, 1);
}

- (void)setTrustedOverride:(id)a3
{
}

- (NSNumber)demote
{
  return (NSNumber *)objc_getProperty(self, a2, 176LL, 1);
}

- (void)setDemote:(id)a3
{
}

- (NSDictionary)tssRequest
{
  return (NSDictionary *)objc_getProperty(self, a2, 40LL, 1);
}

- (NSArray)measurements
{
  return (NSArray *)objc_getProperty(self, a2, 80LL, 1);
}

- (void).cxx_destruct
{
}

- (void)addSubfile:(id)a3 tag:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = -[FTABSubfile initWithTag:data:](objc_alloc(&OBJC_CLASS___FTABSubfile), "initWithTag:data:", v6, v7);

  -[NSMutableArray addObject:](self->_subfiles, "addObject:", v8);
}

- (void)removeSubfile:(id)a3 tag:(id)a4
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v5 = a4;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v6 = self->_subfiles;
  uint64_t v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
LABEL_3:
    uint64_t v10 = 0LL;
    while (1)
    {
      if (*(void *)v16 != v9) {
        objc_enumerationMutation(v6);
      }
      uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * v10);
      objc_msgSend(v11, "tag", (void)v15);
      __int128 v12 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v13 = [v12 compare:v5];

      if (!v13) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_12;
      }
    }

    __int128 v14 = v11;

    if (!v14) {
      goto LABEL_13;
    }
    -[NSMutableArray removeObject:](self->_subfiles, "removeObject:", v14);
    id v6 = v14;
  }

@end