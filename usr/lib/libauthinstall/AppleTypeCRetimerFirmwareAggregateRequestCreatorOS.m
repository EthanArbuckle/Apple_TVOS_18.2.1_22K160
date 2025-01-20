@interface AppleTypeCRetimerFirmwareAggregateRequestCreatorOS
- (AppleTypeCRetimerFirmwareAggregateRequestCreatorOS)initWithOptions:(id)a3 logFunction:(void *)a4 logContext:(void *)a5;
- (BOOL)generateRequestDictionary;
- (BOOL)parseOptions:(id)a3;
- (NSDictionary)requestDictionary;
- (id)generateHashForData:(id)a3;
@end

@implementation AppleTypeCRetimerFirmwareAggregateRequestCreatorOS

- (AppleTypeCRetimerFirmwareAggregateRequestCreatorOS)initWithOptions:(id)a3 logFunction:(void *)a4 logContext:(void *)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___AppleTypeCRetimerFirmwareAggregateRequestCreatorOS;
  v9 = -[AppleTypeCRetimerRestoreInfoHelperOS initWithOptions:logFunction:logContext:]( &v13,  sel_initWithOptions_logFunction_logContext_,  v8,  a4,  a5);
  v10 = v9;
  if (!v9
    || -[AppleTypeCRetimerFirmwareAggregateRequestCreatorOS parseOptions:](v9, "parseOptions:", v8)
    && -[AppleTypeCRetimerFirmwareAggregateRequestCreatorOS generateRequestDictionary](v10, "generateRequestDictionary"))
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
  id v4 = a3;
  id v5 = (id)[v4 objectForKeyedSubscript:@"FirmwareData"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = -[FTABFileOS initWithData:](objc_alloc(&OBJC_CLASS___FTABFileOS), "initWithData:", v5);
    v7 = v6;
    if (v6)
    {
      id v8 = -[FTABFileOS subfileWithTag:](v6, "subfileWithTag:", @"rrko");
      if (v8)
      {
        v9 = v8;
        v10 = (NSData *)(id)[v8 data];
        rrkoData = self->_rrkoData;
        self->_rrkoData = v10;

        id v12 = -[FTABFileOS subfileWithTag:](v7, "subfileWithTag:", @"rkos");
        if (v12)
        {
          objc_super v13 = v12;
          v14 = (NSData *)(id)[v12 data];
          rkosData = self->_rkosData;
          self->_rkosData = v14;

          id v16 = -[FTABFileOS subfileWithTag:](v7, "subfileWithTag:", @"cphy");
          v17 = v16;
          if (v16)
          {
            v18 = (NSData *)(id)[v16 data];
            cphyData = self->_cphyData;
            self->_cphyData = v18;
          }

          else
          {
            -[AppleTypeCRetimerRestoreInfoHelperOS log:](self, "log:", @"No cphy data found");
          }

          goto LABEL_32;
        }

        -[AppleTypeCRetimerRestoreInfoHelperOS log:](self, "log:", @"Failed to locate rkos file in ftab");

        goto LABEL_31;
      }

      v40 = @"Failed to locate rrko file in ftab";
    }

    else
    {
      v21 = -[UARPSuperBinaryOS initWithData:delegate:delegateQueue:]( objc_alloc(&OBJC_CLASS___UARPSuperBinaryOS),  "initWithData:delegate:delegateQueue:",  v5,  0LL,  0LL);
      if (v21)
      {
        v22 = v21;
        v23 = -[UARPAssetTagOS initWithString:]( objc_alloc(&OBJC_CLASS___UARPAssetTagOS),  "initWithString:",  @"RRKO");
        id v24 = -[UARPSuperBinaryOS payloadWith4ccTag:](v22, "payloadWith4ccTag:", v23);
        v25 = v24;
        if (v24)
        {
          v26 = (NSData *)(id)[v24 payloadData];
          v27 = self->_rrkoData;
          self->_rrkoData = v26;

          v28 = -[UARPAssetTagOS initWithString:]( objc_alloc(&OBJC_CLASS___UARPAssetTagOS),  "initWithString:",  @"FIRM");
          id v29 = -[UARPSuperBinaryOS payloadWith4ccTag:](v22, "payloadWith4ccTag:", v28);
          if (v29)
          {
            v51 = v28;
            v30 = objc_alloc(&OBJC_CLASS___FTABFileOS);
            id v31 = (id)[v29 payloadData];
            v32 = -[FTABFileOS initWithData:](v30, "initWithData:", v31);

            if (v32)
            {
              id v33 = -[FTABFileOS subfileWithTag:](v32, "subfileWithTag:", @"rkos");
              if (v33)
              {
                id v50 = v33;
                v34 = (NSData *)(id)[v33 data];
                v35 = self->_rkosData;
                self->_rkosData = v34;

                id v36 = -[FTABFileOS subfileWithTag:](v32, "subfileWithTag:", @"cphy");
                v37 = v36;
                if (v36)
                {
                  v38 = (NSData *)(id)[v36 data];
                  v39 = self->_cphyData;
                  self->_cphyData = v38;
                }

                else
                {
                  -[AppleTypeCRetimerRestoreInfoHelperOS log:](self, "log:", @"No cphy data found");
                }

                int v41 = 0;
                v42 = v50;
              }

              else
              {
                -[AppleTypeCRetimerRestoreInfoHelperOS log:]( self,  "log:",  @"Failed to locate rkos file in super binary ftab");
                v42 = 0LL;
                int v41 = 1;
              }
            }

            else
            {
              -[AppleTypeCRetimerRestoreInfoHelperOS log:](self, "log:", @"Failed to parse FTAB in super binary");
              int v41 = 1;
            }

            v28 = v51;
          }

          else
          {
            -[AppleTypeCRetimerRestoreInfoHelperOS log:](self, "log:", @"Failed to locate FTAB in super binary");
            int v41 = 1;
          }
        }

        else
        {
          -[AppleTypeCRetimerRestoreInfoHelperOS log:]( self,  "log:",  @"Failed to locate rrko file in super binary");
          int v41 = 1;
        }

        if (!v41)
        {
LABEL_32:
          id v43 = (id)[v4 objectForKeyedSubscript:@"DeviceInfo"];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v44 = (NSArray *)(id)[v43 objectForKeyedSubscript:@"InfoArray"];
            deviceInfoArray = self->_deviceInfoArray;
            self->_deviceInfoArray = v44;

            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v46 = (NSDictionary *)(id)[v43 objectForKeyedSubscript:@"APInfo"];
              apParameters = self->_apParameters;
              self->_apParameters = v46;

              BOOL v20 = 1;
LABEL_38:

              goto LABEL_39;
            }

            v48 = @"Failed to locate device info array";
          }

          else
          {
            v48 = @"Failed to locate device info";
          }

          -[AppleTypeCRetimerRestoreInfoHelperOS log:](self, "log:", v48);
          BOOL v20 = 0;
          goto LABEL_38;
        }

- (id)generateHashForData:(id)a3
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  CC_SHA384_Init(&c);
  id v4 = v3;
  id v5 = (const void *)[v4 bytes];
  CC_LONG v6 = [v4 length];

  CC_SHA384_Update(&c, v5, v6);
  CC_SHA384_Final(md, &c);
  return (id)[MEMORY[0x189603F48] dataWithBytes:md length:48];
}

- (BOOL)generateRequestDictionary
{
  v2 = self;
  uint64_t v118 = *MEMORY[0x1895F89C0];
  id v3 =  -[AppleTypeCRetimerFirmwareAggregateRequestCreatorOS generateHashForData:]( self,  "generateHashForData:",  self->_rkosData);
  id v4 =  -[AppleTypeCRetimerFirmwareAggregateRequestCreatorOS generateHashForData:]( v2,  "generateHashForData:",  v2->_rrkoData);
  if (v2->_cphyData) {
    id v5 = -[AppleTypeCRetimerFirmwareAggregateRequestCreatorOS generateHashForData:](v2, "generateHashForData:");
  }
  else {
    id v5 = 0LL;
  }
  id v6 = (id)[MEMORY[0x189603FC8] dictionary];
  __int128 v101 = 0u;
  __int128 v102 = 0u;
  __int128 v103 = 0u;
  __int128 v104 = 0u;
  obj = v2->_deviceInfoArray;
  uint64_t v96 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v101,  v117,  16LL);
  if (v96)
  {
    uint64_t v97 = *(void *)v102;
    v98 = v6;
    id v85 = v4;
    id v86 = v3;
    id v84 = v5;
    v95 = v2;
LABEL_6:
    uint64_t v7 = 0LL;
    while (1)
    {
      if (*(void *)v102 != v97) {
        objc_enumerationMutation(obj);
      }
      id v8 = *(void **)(*((void *)&v101 + 1) + 8 * v7);
      id v9 = (id)[v8 objectForKeyedSubscript:@"TagNumber"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        break;
      }
      uint64_t v10 = [v9 unsignedCharValue];
      id v11 = (id)[v8 objectForKeyedSubscript:@"HardwareID"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        -[AppleTypeCRetimerRestoreInfoHelperOS log:](v95, "log:", @"Unable to locate hardware ID data");

        goto LABEL_93;
      }

      id v99 = v9;
      id v100 = (id)objc_msgSend( NSString,  "stringWithValidatedFormat:validFormatSpecifiers:error:",  @"@Timer%u,Ticket",  @"%u",  0,  v10);
      objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x189604A88]);
      id v12 = v6;
      id v13 = (id)[v11 objectForKeyedSubscript:@"BoardID"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        id v93 = (id)objc_msgSend( NSString,  "stringWithValidatedFormat:validFormatSpecifiers:error:",  @"Timer,BoardID,%u",  @"%u",  0,  v10);
        id v94 = v13;
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v13);
        id v14 = (id)[v11 objectForKeyedSubscript:@"ChipID"];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          id v15 = (id)objc_msgSend( NSString,  "stringWithValidatedFormat:validFormatSpecifiers:error:",  @"Timer,ChipID,%u",  @"%u",  0,  v10);
          [v12 setObject:v14 forKeyedSubscript:v15];
          id v16 = (id)[v11 objectForKeyedSubscript:@"ECID"];
          objc_opt_class();
          id v90 = v16;
          id v91 = v15;
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            id v88 = v14;
            id v87 = (id)objc_msgSend( NSString,  "stringWithValidatedFormat:validFormatSpecifiers:error:",  @"Timer,ECID,%u",  @"%u",  0,  v10);
            objc_msgSend(v12, "setObject:forKeyedSubscript:", v16);
            id v17 = (id)[v11 objectForKeyedSubscript:@"Nonce"];
            objc_opt_class();
            id v89 = v17;
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              id v82 = (id)objc_msgSend( NSString,  "stringWithValidatedFormat:validFormatSpecifiers:error:",  @"Timer,Nonce,%u",  @"%u",  0,  v10);
              objc_msgSend(v12, "setObject:forKeyedSubscript:", v17);
              id v18 = (id)[v11 objectForKeyedSubscript:@"ProductionStatus"];
              objc_opt_class();
              id v83 = v18;
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                id v19 = (id)objc_msgSend( NSString,  "stringWithValidatedFormat:validFormatSpecifiers:error:",  @"Timer,ProductionMode,%u",  @"%u",  0,  v10);
                else {
                  uint64_t v20 = MEMORY[0x189604A80];
                }
                id v81 = v19;
                [v12 setObject:v20 forKeyedSubscript:v19];
                id v21 = (id)[v11 objectForKeyedSubscript:@"SecurityDomain"];
                objc_opt_class();
                id v14 = v88;
                id v80 = v21;
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  id v79 = (id)objc_msgSend( NSString,  "stringWithValidatedFormat:validFormatSpecifiers:error:",  @"Timer,SecurityDomain,%u",  @"%u",  0,  v10);
                  objc_msgSend(v12, "setObject:forKeyedSubscript:", v21);
                  id v22 = (id)[v11 objectForKeyedSubscript:@"SecurityMode"];
                  objc_opt_class();
                  id v78 = v22;
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    id v23 = (id)objc_msgSend( NSString,  "stringWithValidatedFormat:validFormatSpecifiers:error:",  @"Timer,SecurityMode,%u",  @"%u",  0,  v10);
                    else {
                      uint64_t v24 = MEMORY[0x189604A80];
                    }
                    [v12 setObject:v24 forKeyedSubscript:v23];
                    v25 = v22;
                    id v26 = (id)[v11 objectForKeyedSubscript:@"Demote"];
                    if (v26 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                    {
                      v2 = v95;
                      -[AppleTypeCRetimerRestoreInfoHelperOS log:]( v95,  "log:",  @"Invalid demote setting for tag %u",  v10);
                      int v35 = 1;
                      id v29 = v99;
                      id v36 = v100;
                    }

                    else
                    {
                      id v27 = (id)[v8 objectForKeyedSubscript:@"Trusted"];
                      objc_opt_class();
                      char isKindOfClass = objc_opt_isKindOfClass();
                      id v77 = (id)MEMORY[0x189604A88];
                      id v29 = v99;
                      if ((isKindOfClass & 1) != 0) {
                        id v77 = v27;
                      }
                      id v73 = v27;
                      id v74 = v23;
                      id v76 = (id)objc_msgSend( NSString,  "stringWithValidatedFormat:validFormatSpecifiers:error:",  @"Timer,RTKitOS,%u",  @"%u",  0,  v10);
                      id v30 = v26;
                      if ([v26 BOOLValue]
                        && [v83 unsignedCharValue])
                      {
                        v113[0] = @"Digest";
                        v113[1] = @"EPRO";
                        v114[0] = v86;
                        v114[1] = MEMORY[0x189604A80];
                        v113[2] = @"DPRO";
                        v113[3] = @"ESEC";
                        v114[2] = MEMORY[0x189604A88];
                        v114[3] = MEMORY[0x189604A88];
                        v113[4] = @"Trusted";
                        v114[4] = MEMORY[0x189604A80];
                        id v31 = (void *)MEMORY[0x189603F68];
                        v32 = v114;
                        id v33 = v113;
                        uint64_t v34 = 5LL;
                      }

                      else
                      {
                        v116[0] = v86;
                        v115[0] = @"Digest";
                        v115[1] = @"EPRO";
                        int v39 = [v83 unsignedCharValue];
                        uint64_t v40 = MEMORY[0x189604A88];
                        uint64_t v41 = MEMORY[0x189604A80];
                        if (v39) {
                          uint64_t v42 = MEMORY[0x189604A88];
                        }
                        else {
                          uint64_t v42 = MEMORY[0x189604A80];
                        }
                        v116[1] = v42;
                        v115[2] = @"ESEC";
                        else {
                          uint64_t v43 = v41;
                        }
                        v116[2] = v43;
                        v115[3] = @"Trusted";
                        else {
                          uint64_t v44 = v41;
                        }
                        id v26 = v30;
                        v116[3] = v44;
                        id v31 = (void *)MEMORY[0x189603F68];
                        v32 = v116;
                        id v33 = v115;
                        uint64_t v34 = 4LL;
                      }

                      id v45 = (id)[v31 dictionaryWithObjects:v32 forKeys:v33 count:v34];
                      [v98 setObject:v45 forKeyedSubscript:v76];

                      id v75 = (id)objc_msgSend( NSString,  "stringWithValidatedFormat:validFormatSpecifiers:error:",  @"Timer,RestoreRTKitOS,%u",  @"%u",  0,  v10);
                      if ([v26 BOOLValue]
                        && [v83 unsignedCharValue])
                      {
                        v109[0] = @"Digest";
                        v109[1] = @"EPRO";
                        v110[0] = v85;
                        v110[1] = MEMORY[0x189604A80];
                        v109[2] = @"DPRO";
                        v109[3] = @"ESEC";
                        v110[2] = MEMORY[0x189604A88];
                        v110[3] = MEMORY[0x189604A88];
                        v109[4] = @"Trusted";
                        v110[4] = MEMORY[0x189604A80];
                        v46 = (void *)MEMORY[0x189603F68];
                        v47 = v110;
                        v48 = v109;
                        uint64_t v49 = 5LL;
                      }

                      else
                      {
                        v112[0] = v85;
                        v111[0] = @"Digest";
                        v111[1] = @"EPRO";
                        int v50 = [v83 unsignedCharValue];
                        uint64_t v51 = MEMORY[0x189604A88];
                        uint64_t v52 = MEMORY[0x189604A80];
                        if (v50) {
                          uint64_t v53 = MEMORY[0x189604A88];
                        }
                        else {
                          uint64_t v53 = MEMORY[0x189604A80];
                        }
                        v112[1] = v53;
                        v111[2] = @"ESEC";
                        else {
                          uint64_t v54 = v52;
                        }
                        v112[2] = v54;
                        v111[3] = @"Trusted";
                        else {
                          uint64_t v55 = v52;
                        }
                        id v26 = v30;
                        v112[3] = v55;
                        v46 = (void *)MEMORY[0x189603F68];
                        v47 = v112;
                        v48 = v111;
                        uint64_t v49 = 4LL;
                      }

                      id v56 = (id)[v46 dictionaryWithObjects:v47 forKeys:v48 count:v49];
                      id v23 = v74;
                      [v98 setObject:v56 forKeyedSubscript:v75];

                      if (v95->_cphyData)
                      {
                        id v57 = (id)objc_msgSend( NSString,  "stringWithFormat:",  @"Timer,AppleTypeCPhyFirmware,%u",  v10);
                        if ([v26 BOOLValue]
                          && [v83 unsignedCharValue])
                        {
                          v105[0] = @"Digest";
                          v105[1] = @"EPRO";
                          v106[0] = v84;
                          v106[1] = MEMORY[0x189604A80];
                          v105[2] = @"DPRO";
                          v105[3] = @"ESEC";
                          v106[2] = MEMORY[0x189604A88];
                          v106[3] = MEMORY[0x189604A88];
                          v105[4] = @"Trusted";
                          v106[4] = MEMORY[0x189604A80];
                          v58 = (void *)MEMORY[0x189603F68];
                          v59 = v106;
                          v60 = v105;
                          uint64_t v61 = 5LL;
                        }

                        else
                        {
                          v108[0] = v84;
                          v107[0] = @"Digest";
                          v107[1] = @"EPRO";
                          int v62 = [v83 unsignedCharValue];
                          uint64_t v63 = MEMORY[0x189604A88];
                          uint64_t v64 = MEMORY[0x189604A80];
                          if (v62) {
                            uint64_t v65 = MEMORY[0x189604A88];
                          }
                          else {
                            uint64_t v65 = MEMORY[0x189604A80];
                          }
                          v108[1] = v65;
                          v107[2] = @"ESEC";
                          else {
                            uint64_t v66 = v64;
                          }
                          v108[2] = v66;
                          v107[3] = @"Trusted";
                          else {
                            uint64_t v67 = v64;
                          }
                          id v26 = v30;
                          id v23 = v74;
                          v108[3] = v67;
                          v58 = (void *)MEMORY[0x189603F68];
                          v59 = v108;
                          v60 = v107;
                          uint64_t v61 = 4LL;
                        }

                        id v68 = (id)[v58 dictionaryWithObjects:v59 forKeys:v60 count:v61];
                        [v98 setObject:v68 forKeyedSubscript:v57];
                      }

                      int v35 = 0;
                      v2 = v95;
                      id v36 = v100;
                    }
                  }

                  else
                  {
                    v2 = v95;
                    -[AppleTypeCRetimerRestoreInfoHelperOS log:]( v95,  "log:",  @"Unable to locate security mode for tag %u",  v10);
                    int v35 = 1;
                    id v29 = v99;
                    id v36 = v100;
                  }

                  id v13 = v94;
                  v37 = v93;
                  v38 = v87;
                }

                else
                {
                  v2 = v95;
                  -[AppleTypeCRetimerRestoreInfoHelperOS log:]( v95,  "log:",  @"Unable to locate security domain for tag %u",  v10);
                  int v35 = 1;
                  id v29 = v99;
                  id v36 = v100;
                  v37 = v93;
                  id v13 = v94;
                  v38 = v87;
                }
              }

              else
              {
                v2 = v95;
                -[AppleTypeCRetimerRestoreInfoHelperOS log:]( v95,  "log:",  @"Unable to locate production status for tag %u",  v10);
                int v35 = 1;
                id v29 = v99;
                id v36 = v100;
                v37 = v93;
                id v13 = v94;
                v38 = v87;
                id v14 = v88;
              }
            }

            else
            {
              v2 = v95;
              -[AppleTypeCRetimerRestoreInfoHelperOS log:](v95, "log:", @"Unable to locate nonce for tag %u", v10);
              int v35 = 1;
              id v29 = v99;
              id v36 = v100;
              v37 = v93;
              id v13 = v94;
              v38 = v87;
              id v14 = v88;
            }
          }

          else
          {
            v2 = v95;
            -[AppleTypeCRetimerRestoreInfoHelperOS log:](v95, "log:", @"Unable to locate ECID for tag %u", v10);
            int v35 = 1;
            id v29 = v99;
            id v36 = v100;
            v37 = v93;
            id v13 = v94;
          }
        }

        else
        {
          v2 = v95;
          -[AppleTypeCRetimerRestoreInfoHelperOS log:](v95, "log:", @"Unable to locate board ID for tag %u", v10);
          int v35 = 1;
          id v29 = v99;
          id v36 = v100;
          v37 = v93;
        }
      }

      else
      {
        v2 = v95;
        -[AppleTypeCRetimerRestoreInfoHelperOS log:](v95, "log:", @"Unable to locate board ID for tag %u", v10);
        int v35 = 1;
        id v29 = v99;
        id v36 = v100;
      }

      if (v35) {
        goto LABEL_94;
      }
      ++v7;
      id v6 = v98;
      if (v96 == v7)
      {
        id v4 = v85;
        id v3 = v86;
        id v5 = v84;
        uint64_t v96 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v101,  v117,  16LL);
        if (v96) {
          goto LABEL_6;
        }
        goto LABEL_88;
      }
    }

    -[AppleTypeCRetimerRestoreInfoHelperOS log:](v2, "log:", @"Unable to locate tag number in device info");
LABEL_93:

LABEL_94:
    BOOL v71 = 0;
    id v4 = v85;
    id v3 = v86;
    id v5 = v84;
    id v6 = v98;
    goto LABEL_95;
  }

- (NSDictionary)requestDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 72LL, 1);
}

- (void).cxx_destruct
{
}

@end