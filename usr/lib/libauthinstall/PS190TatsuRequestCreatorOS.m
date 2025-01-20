@interface PS190TatsuRequestCreatorOS
- (BOOL)generateRequestDictionary;
- (BOOL)parseOptions:(id)a3;
- (NSDictionary)requestDictionary;
- (PS190TatsuRequestCreatorOS)initWithOptions:(id)a3 logFunction:(void *)a4 logContext:(void *)a5;
@end

@implementation PS190TatsuRequestCreatorOS

- (PS190TatsuRequestCreatorOS)initWithOptions:(id)a3 logFunction:(void *)a4 logContext:(void *)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___PS190TatsuRequestCreatorOS;
  v9 = -[PS190SoCRestoreInfoHelperOS initWithOptions:logFunction:logContext:]( &v13,  sel_initWithOptions_logFunction_logContext_,  v8,  a4,  a5);
  v10 = v9;
  if (!v9
    || -[PS190TatsuRequestCreatorOS parseOptions:](v9, "parseOptions:", v8)
    && -[PS190TatsuRequestCreatorOS generateRequestDictionary](v10, "generateRequestDictionary"))
  {
    v11 = v10;
  }

  else
  {
    v11 = 0LL;
  }

  return v11;
}

- (BOOL)parseOptions:(id)a3
{
  v18[1] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  id v5 = (id)[v4 objectForKeyedSubscript:@"FirmwareData"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    -[PS190SoCRestoreInfoHelperOS log:]( self,  "log:",  @"%s: Unable to locate firmware dictionary",  "-[PS190TatsuRequestCreatorOS parseOptions:]");
LABEL_8:
    BOOL v10 = 0;
    goto LABEL_13;
  }

  v6 = (NSData *)(id)[v5 objectForKeyedSubscript:@"FirmwareData"];
  firmwareData = self->_firmwareData;
  self->_firmwareData = v6;

  if (!self->_firmwareData)
  {
    -[PS190SoCRestoreInfoHelperOS log:](self, "log:", @"Unable to locate firmware data", v17);
    goto LABEL_8;
  }

  id v8 = (id)[v4 objectForKeyedSubscript:@"DeviceInfo"];
  v9 = v8;
  BOOL v10 = v8 != 0LL;
  if (v8)
  {
    id v11 = (id)[v8 objectForKeyedSubscript:@"InfoArray"];
    if (v11)
    {
      objc_storeStrong((id *)&self->_deviceInfoArray, v11);
    }

    else
    {
      v18[0] = v9;
      v12 = (NSArray *)(id)[MEMORY[0x189603F18] arrayWithObjects:v18 count:1];
      deviceInfoArray = self->_deviceInfoArray;
      self->_deviceInfoArray = v12;
    }

    v14 = (NSDictionary *)(id)[v9 objectForKeyedSubscript:@"APInfo"];
    apParameters = self->_apParameters;
    self->_apParameters = v14;
  }

  else
  {
    -[PS190SoCRestoreInfoHelperOS log:](self, "log:", @"Failed to locate device info");
  }

LABEL_13:
  return v10;
}

- (BOOL)generateRequestDictionary
{
  uint64_t v86 = *MEMORY[0x1895F89C0];
  id v66 = PS190GenerateDigest(self->_firmwareData);
  id v77 = (id)[MEMORY[0x189603FC8] dictionary];
  __int128 v79 = 0u;
  __int128 v80 = 0u;
  __int128 v81 = 0u;
  __int128 v82 = 0u;
  v74 = self;
  v3 = self->_deviceInfoArray;
  uint64_t v72 = -[NSArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v79,  v85,  16LL);
  if (v72)
  {
    uint64_t v73 = *(void *)v80;
    uint64_t v4 = MEMORY[0x189604A88];
    obj = v3;
LABEL_3:
    uint64_t v5 = 0LL;
    while (1)
    {
      if (*(void *)v80 != v73) {
        objc_enumerationMutation(obj);
      }
      v6 = *(void **)(*((void *)&v79 + 1) + 8 * v5);
      id v7 = (id)[v6 objectForKeyedSubscript:@"TagNumber"];
      if (!v7) {
        break;
      }
      id v8 = v7;
      uint64_t v9 = [v7 unsignedIntValue];
      id v10 = (id)objc_msgSend( NSString,  "stringWithValidatedFormat:validFormatSpecifiers:error:",  @"@PCON%u,Ticket",  @"%u",  0,  v9);
      if (!v10)
      {
        -[PS190SoCRestoreInfoHelperOS log:]( v74,  "log:",  @"%s: Unable to locate ticket name",  "-[PS190TatsuRequestCreatorOS generateRequestDictionary]");

        goto LABEL_64;
      }

      [v77 setObject:v4 forKeyedSubscript:v10];
      id v11 = (id)[v6 objectForKeyedSubscript:@"HardwareID"];
      v12 = v11;
      if (v11)
      {
        id v13 = (id)[v11 objectForKeyedSubscript:@"BoardID"];
        if (v13)
        {
          id v14 = (id)objc_msgSend( NSString,  "stringWithFormat:",  @"PCON%u,BoardID",  v9);
          [v77 setObject:v13 forKeyedSubscript:v14];
        }

        id v75 = v13;
        id v76 = (id)[v12 objectForKeyedSubscript:@"ChipID"];
        if (v76)
        {
          id v71 = (id)objc_msgSend( NSString,  "stringWithFormat:",  @"PCON%u,ChipID",  v9);
          objc_msgSend(v77, "setObject:forKeyedSubscript:", v76);
          id v15 = (id)[v12 objectForKeyedSubscript:@"DebugDisable"];
          id v70 = v15;
          if (v15)
          {
            v16 = v15;
            id v17 = (id)objc_msgSend( NSString,  "stringWithFormat:",  @"PCON%u,DebugDisable",  v9);
            else {
              uint64_t v18 = MEMORY[0x189604A80];
            }
            id v68 = v17;
            [v77 setObject:v18 forKeyedSubscript:v17];
            id v19 = (id)[v12 objectForKeyedSubscript:@"ECID"];
            if (v19)
            {
              id v20 = (id)objc_msgSend( NSString,  "stringWithFormat:",  @"PCON%u,ECID",  v9);
              uint64_t v78 = [v19 unsignedLongLongValue];
              id v21 = (id)[MEMORY[0x189603F48] dataWithBytes:&v78 length:8];
              [v77 setObject:v21 forKeyedSubscript:v20];

              uint64_t v4 = MEMORY[0x189604A88];
            }

            id v67 = v19;
            id v22 = (id)[v12 objectForKeyedSubscript:@"Nonce"];
            if (v22)
            {
              id v23 = (id)objc_msgSend( NSString,  "stringWithFormat:",  @"PCON%u,Nonce",  v9);
              [v77 setObject:v22 forKeyedSubscript:v23];
            }

            id v24 = (id)[v12 objectForKeyedSubscript:@"ProductionMode"];
            if (v24)
            {
              v25 = v24;
              id v26 = (id)objc_msgSend( NSString,  "stringWithFormat:",  @"PCON%u,ProductionMode",  v9);
              else {
                uint64_t v27 = MEMORY[0x189604A80];
              }
              [v77 setObject:v27 forKeyedSubscript:v26];
              v28 = v26;
              id v24 = v25;
            }

            id v29 = (id)[v12 objectForKeyedSubscript:@"RealHDCPKeysPresent"];
            if (v29)
            {
              id v63 = v24;
              id v64 = v22;
              id v30 = (id)objc_msgSend( NSString,  "stringWithFormat:",  @"PCON%u,RealHdcpKeysPresent",  v9);
              int v31 = [v29 BOOLValue];
              uint64_t v32 = MEMORY[0x189604A80];
              if (v31) {
                uint64_t v33 = MEMORY[0x189604A88];
              }
              else {
                uint64_t v33 = MEMORY[0x189604A80];
              }
              id v65 = v29;
              id v62 = v30;
              [v77 setObject:v33 forKeyedSubscript:v30];
              id v34 = (id)[v12 objectForKeyedSubscript:@"SecurityDomain"];
              if (v34) {
                v35 = v34;
              }
              else {
                v35 = &unk_18A131948;
              }
              id v60 = (id)objc_msgSend( NSString,  "stringWithFormat:",  @"PCON%u,SecurityDomain",  v9);
              id v61 = v35;
              objc_msgSend(v77, "setObject:forKeyedSubscript:", v35);
              id v36 = (id)[v12 objectForKeyedSubscript:@"SecurityMode"];
              if (v36)
              {
                uint64_t v37 = v9;
                id v38 = (id)objc_msgSend( NSString,  "stringWithFormat:",  @"PCON%u,SecurityMode",  v9);
                id v59 = v38;
                else {
                  uint64_t v39 = v32;
                }
                [v77 setObject:v39 forKeyedSubscript:v38];
                id v58 = (id)objc_msgSend( NSString,  "stringWithFormat:",  @"PCON%u,Firmware",  v37);
                v83 = @"Digest";
                id v84 = v66;
                id v40 = (id)[MEMORY[0x189603F68] dictionaryWithObjects:&v84 forKeys:&v83 count:1];
                [v77 setObject:v40 forKeyedSubscript:v58];

                id v41 = (id)[v6 objectForKeyedSubscript:@"DebugEnableOverride"];
                id v42 = (id)objc_msgSend( NSString,  "stringWithFormat:",  @"PCON%u,DebugEnableOverride",  v37);
                id v56 = v42;
                id v57 = v41;
                if (v41) {
                  id v43 = v41;
                }
                else {
                  id v43 = (id)MEMORY[0x189604A80];
                }
                [v77 setObject:v43 forKeyedSubscript:v42];
                id v44 = (id)[v6 objectForKeyedSubscript:@"UseHDCPEntitlement"];
                id v45 = (id)objc_msgSend( NSString,  "stringWithFormat:",  @"PCON%u,UseHdcpEntitlement",  v37);
                if (v44) {
                  id v46 = v44;
                }
                else {
                  id v46 = v65;
                }
                [v77 setObject:v46 forKeyedSubscript:v45];
                id v47 = (id)[v6 objectForKeyedSubscript:@"FWFeatureConfig"];
                id v48 = (id)objc_msgSend( NSString,  "stringWithFormat:",  @"PCON%u,FwFeatureConfig",  v37);
                if (v47) {
                  v49 = v47;
                }
                else {
                  v49 = &unk_18A131948;
                }
                [v77 setObject:v49 forKeyedSubscript:v48];

                int v50 = 0;
              }

              else
              {
                -[PS190SoCRestoreInfoHelperOS log:]( v74,  "log:",  @"%s: Unable to locate security mode",  "-[PS190TatsuRequestCreatorOS generateRequestDictionary]");
                int v50 = 1;
              }

              v51 = v75;
              v52 = v71;
              id v24 = v63;
              id v22 = v64;

              id v29 = v65;
            }

            else
            {
              -[PS190SoCRestoreInfoHelperOS log:]( v74,  "log:",  @"%s: Unable to locate real HDCP keys present",  "-[PS190TatsuRequestCreatorOS generateRequestDictionary]");
              int v50 = 1;
              v51 = v75;
              v52 = v71;
            }
          }

          else
          {
            -[PS190SoCRestoreInfoHelperOS log:]( v74,  "log:",  @"%s: Unable to locate debug disable",  "-[PS190TatsuRequestCreatorOS generateRequestDictionary]");
            int v50 = 1;
            v51 = v13;
            v52 = v71;
          }
        }

        else
        {
          -[PS190SoCRestoreInfoHelperOS log:]( v74,  "log:",  @"%s: Unable to locate chip ID",  "-[PS190TatsuRequestCreatorOS generateRequestDictionary]");
          int v50 = 1;
          v51 = v13;
        }
      }

      else
      {
        -[PS190SoCRestoreInfoHelperOS log:]( v74,  "log:",  @"%s: Unable to locate hardware dictionary",  "-[PS190TatsuRequestCreatorOS generateRequestDictionary]");
        int v50 = 1;
      }

      if (v50) {
        goto LABEL_62;
      }
      ++v5;
      uint64_t v4 = MEMORY[0x189604A88];
      if (v72 == v5)
      {
        v3 = obj;
        uint64_t v72 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v79,  v85,  16LL);
        if (v72) {
          goto LABEL_3;
        }
        goto LABEL_58;
      }
    }

    -[PS190SoCRestoreInfoHelperOS log:]( v74,  "log:",  @"%s: Unable to locate tag number in device info",  "-[PS190TatsuRequestCreatorOS generateRequestDictionary]");
LABEL_62:
    LOBYTE(v10) = 0;
LABEL_64:
    requestDictionary = (NSDictionary *)obj;
    goto LABEL_65;
  }

- (NSDictionary)requestDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 56LL, 1);
}

- (void).cxx_destruct
{
}

@end