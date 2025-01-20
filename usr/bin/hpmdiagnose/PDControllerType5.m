@interface PDControllerType5
+ (id)createForDecode;
+ (id)createWithDeviceAddress:(unsigned __int8)a3 userClient:(id)a4;
- (NSDictionary)registerConfigs;
- (PDControllerType5)initWithAddress:(unsigned __int8)a3 userClient:(id)a4;
- (id)readFullVersion;
- (id)registerFormatter8ByteVersionWithBuffer:(void *)a3 andLength:(unint64_t)a4;
- (id)registerFormatterADCResultsWithBuffer:(void *)a3 andLength:(unint64_t)a4;
- (id)registerFormatterBootFlagsWithBuffer:(void *)a3 andLength:(unint64_t)a4;
- (id)registerFormatterCFDebugConfigWithBuffer:(void *)a3 andLength:(unint64_t)a4;
- (id)registerFormatterCFSOPUVDMEnumWithBuffer:(void *)a3 andLength:(unint64_t)a4;
- (id)registerFormatterCFVIDConfigWithBuffer:(void *)a3 andLength:(unint64_t)a4;
- (id)registerFormatterCFVIDStatusWithBuffer:(void *)a3 andLength:(unint64_t)a4;
- (id)registerFormatterFWStateConfigWithBuffer:(void *)a3 andLength:(unint64_t)a4;
- (id)registerFormatterGenericWithBuffer:(void *)a3 andLength:(unint64_t)a4 andConfig:(id)a5;
- (id)registerFormatterIOConfig1WithBuffer:(void *)a3 andLength:(unint64_t)a4;
- (id)registerFormatterIOConfig2WithBuffer:(void *)a3 andLength:(unint64_t)a4;
- (id)registerFormatterIntEventWithBuffer:(void *)a3 andLength:(unint64_t)a4;
- (id)registerFormatterIntMaskClearWithBuffer:(void *)a3 andLength:(unint64_t)a4;
- (id)registerFormatterLDCMConfigWithBuffer:(void *)a3 andLength:(unint64_t)a4;
- (id)registerFormatterLDCMStatusWithBuffer:(void *)a3 andLength:(unint64_t)a4;
- (id)registerFormatterMuxStateWithBuffer:(void *)a3 andLength:(unint64_t)a4;
- (id)registerFormatterPD3EMIntMaskWithBuffer:(void *)a3 andLength:(unint64_t)a4;
- (id)registerFormatterPersParamsWithBuffer:(void *)a3 andLength:(unint64_t)a4;
- (id)registerFormatterPowerSwitchStateWithBuffer:(void *)a3 andLength:(unint64_t)a4;
- (id)registerFormatterSecondaryMUXInitWithBuffer:(void *)a3 andLength:(unint64_t)a4;
- (id)registerFormatterSystemConfigWithBuffer:(void *)a3 andLength:(unint64_t)a4;
- (id)registerFormatterTBTRetimerDataWithBuffer:(void *)a3 andLength:(unint64_t)a4;
- (id)registerFormatterTXEPRSourceCapWithBuffer:(void *)a3 andLength:(unint64_t)a4;
- (id)registerFormatterUSBConfigWithBuffer:(void *)a3 andLength:(unint64_t)a4;
- (id)registerFormatterWakeEventMaskWithBuffer:(void *)a3 andLength:(unint64_t)a4;
- (int)printAllDPMrSubcommands;
- (int)printDBStateHistory;
- (int)printTBRrIfIntelRetimerPresent;
- (void)buildRegDecodes;
- (void)setDPMrConfigs;
- (void)setRegisterConfigs:(id)a3;
@end

@implementation PDControllerType5

+ (id)createWithDeviceAddress:(unsigned __int8)a3 userClient:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  id v7 = [objc_alloc((Class)a1) initWithAddress:v4 userClient:v6];

  return v7;
}

+ (id)createForDecode
{
  return 0LL;
}

- (PDControllerType5)initWithAddress:(unsigned __int8)a3 userClient:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PDControllerType5;
  return -[PDControllerType4 initWithAddress:userClient:](&v5, "initWithAddress:userClient:", a3, a4);
}

- (id)registerFormatter8ByteVersionWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v8 = (void *)objc_claimAutoreleasedReturnValue( -[PDController registerFormatterHexDumpWithBuffer:andLength:]( self,  "registerFormatterHexDumpWithBuffer:andLength:",  a3,  a4));
  [v7 addObjectsFromArray:v8];
  if (a4 == 8)
  {
    v9 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%llX.%llX.%llX.%lld.%02lld",  *(void *)a3 >> 20,  (*(void *)a3 >> 8) & 0xFFFLL,  *(void *)a3,  BYTE4(*(void *)a3),  ((unsigned __int16)WORD2(*(void *)a3) >> 8));
  }

  else if (a4 == 4)
  {
    [v7 addObject:@"Warning: Unexpected 4-byte version register"];
    v9 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%X.%X.%X (Unknown Customer Version)",  *(_DWORD *)a3 >> 20,  (*(_DWORD *)a3 >> 8) & 0xFFF,  *(_DWORD *)a3,  v14,  v15);
  }

  else
  {
    v9 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"ERROR: Unexpected length %lld",  a4,  v12,  v13,  v14,  v15);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  [v7 addObject:v10];

  return v7;
}

- (int)printTBRrIfIntelRetimerPresent
{
  unint64_t v7 = 0LL;
  int result = -[PDController registerRead:ofLength:atAddress:andOutReadLength:]( self,  "registerRead:ofLength:atAddress:andOutReadLength:",  v8,  64LL,  42LL,  &v7);
  if (!result)
  {
    int result = -536870160;
    if (v7 >= 8)
    {
      if ((v9 & 0xF) != 0 && (v9 & 0xF) != 14)
      {
        char v6 = 4;
        __int16 v5 = 48;
        return -[PDController printCommand:withWriteData:withWriteLength:]( self,  "printCommand:withWriteData:withWriteLength:",  1413632626LL,  &v5,  3LL);
      }
    }

    else
    {
      return -536870212;
    }
  }

  return result;
}

- (int)printAllDPMrSubcommands
{
  uint64_t v27 = 0LL;
  v3 = (char *)malloc(0x40uLL);
  if (v3)
  {
    uint64_t v4 = v3;
    -[PDController registerRead:ofLength:atAddress:andOutReadLength:]( self,  "registerRead:ofLength:atAddress:andOutReadLength:",  v3,  64LL,  42LL,  &v27);
    int v22 = *(unsigned __int16 *)(v4 + 5);
    free(v4);
  }

  else
  {
    int v22 = 0;
  }

  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[PDControllerType4 dpmrConfigs](self, "dpmrConfigs"));
  id v5 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v24;
    do
    {
      v8 = 0LL;
      do
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v23 + 1) + 8LL * (void)v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType4 dpmrConfigs](self, "dpmrConfigs"));
        v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v9]);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"mask"]);
        unsigned int v13 = [v12 unsignedIntegerValue];

        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType4 dpmrConfigs](self, "dpmrConfigs"));
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:v9]);
        v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"match"]);
        unsigned __int16 v17 = (unsigned __int16)[v16 unsignedIntegerValue];

        if ((v22 & v13) == v17)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType4 dpmrConfigs](self, "dpmrConfigs"));
          v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:v9]);
          -[PDControllerType4 printDPMrSubCommand:withDeviceConfig:]( self,  "printDPMrSubCommand:withDeviceConfig:",  v9,  v19);
        }

        v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }

    while (v6);
  }

  return 0;
}

- (id)registerFormatterGenericWithBuffer:(void *)a3 andLength:(unint64_t)a4 andConfig:(id)a5
{
  id v8 = a5;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v72 = self;
  v10 = (void *)objc_claimAutoreleasedReturnValue( -[PDController registerFormatterHexDumpWithBuffer:andLength:]( self,  "registerFormatterHexDumpWithBuffer:andLength:",  a3,  a4));
  [v9 addObjectsFromArray:v10];
  v11 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"length"]);
  id v12 = [v11 unsignedIntegerValue];

  if ((unint64_t)v12 <= a4)
  {
    unint64_t v75 = a4;
    if ((unint64_t)v12 < a4)
    {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"ERROR: length %lld > %lu, register may not be decoded correctly",  a4,  v12));
      [v9 addObject:v14];
    }

    __int128 v81 = 0u;
    __int128 v82 = 0u;
    __int128 v79 = 0u;
    __int128 v80 = 0u;
    id v71 = v8;
    id obj = (id)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"fields"]);
    id v15 = [obj countByEnumeratingWithState:&v79 objects:v83 count:16];
    if (!v15)
    {
LABEL_66:

      id v8 = v71;
      goto LABEL_67;
    }

    id v16 = v15;
    uint64_t v77 = *(void *)v80;
    unsigned __int16 v17 = @"%02X";
    v73 = v9;
    v74 = (char *)a3;
LABEL_7:
    uint64_t v18 = 0LL;
    while (1)
    {
      if (*(void *)v80 != v77) {
        objc_enumerationMutation(obj);
      }
      v19 = *(void **)(*((void *)&v79 + 1) + 8 * v18);
      uint64_t v20 = objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:@"bit_length"]);
      if (v20)
      {
        v21 = (void *)v20;
        int v22 = v17;
        uint64_t v23 = objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:@"byte_offset"]);
        if (v23)
        {
          __int128 v24 = (void *)v23;
          __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:@"name"]);

          unsigned __int16 v17 = v22;
          if (v25)
          {
            __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:@"bit_length"]);
            id v27 = [v26 unsignedCharValue];

            v28 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:@"byte_offset"]);
            unsigned int v29 = [v28 unsignedCharValue];

            v30 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:@"name"]);
            if (v29 >= v75)
            {
              v32 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Error, byte offset too large (%x)",  v29,  v68,  v69,  v70);
LABEL_22:
              v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
              [v9 addObject:v33];
            }

            else
            {
              if (v27 < 0x21)
              {
                unint64_t v78 = *(void *)&v74[v29];
                v34 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:@"bit_shift"]);

                if (v34)
                {
                  v35 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:@"bit_shift"]);
                  unsigned __int8 v36 = [v35 unsignedIntegerValue];
                  v78 >>= v36;
                }

                v78 &= ~(-1LL << (char)v27);
                v37 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:@"show_only_when_nonzero"]);

                if (!v37
                  || (v38 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:@"show_only_when_nonzero"]),
                      unsigned int v39 = [v38 BOOLValue],
                      unint64_t v40 = v78,
                      v38,
                      !v39)
                  || v40)
                {
                  v41 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:@"values"]);

                  if (v41)
                  {
                    uint64_t v42 = v78;
                    v43 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:@"values"]);
                    uint64_t v44 = objc_claimAutoreleasedReturnValue( -[PDControllerType4 stringForTitle:value:table:]( v72,  "stringForTitle:value:table:",  v30,  v42,  v43));
                  }

                  else
                  {
                    if (v27 > 4)
                    {
                      if (v27 > 8)
                      {
                        if (v27 > 0x10)
                        {
                          if (v27 > 0x18) {
                            v47 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"0x%08llX",  v78);
                          }
                          else {
                            v47 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"0x%06X",  v78);
                          }
                        }

                        else
                        {
                          v47 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"0x%04X",  (unsigned __int16)v78);
                        }
                      }

                      else
                      {
                        v47 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"0x%02X",  v78);
                      }
                    }

                    else
                    {
                      v47 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"0x%X",  v78);
                    }

                    v43 = (void *)objc_claimAutoreleasedReturnValue(v47);
                    uint64_t v44 = objc_claimAutoreleasedReturnValue( -[PDControllerType4 stringForTitle:valueString:]( v72,  "stringForTitle:valueString:",  v30,  v43));
                  }

                  v48 = (void *)v44;

                  v49 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:@"formatter"]);
                  if (v49)
                  {
                    [v73 addObject:v48];
                    v50 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue( [v19 objectForKeyedSubscript:@"formatter"]);
                    uint64_t v51 = ((uint64_t (**)(void, unint64_t *))v50)[2](v50, &v78);
                    v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
                    [v73 addObjectsFromArray:v52];

                    goto LABEL_63;
                  }

                  v53 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:@"unit"]);

                  if (v53)
                  {
                    v54 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:@"signed"]);

                    if (v54)
                    {
                      if ((_DWORD)v27 == 16)
                      {
                        int v55 = (__int16)v78;
LABEL_55:
                        float v61 = (float)v55;
                      }

                      else
                      {
                        if ((_DWORD)v27 == 8)
                        {
                          int v55 = (char)v78;
                          goto LABEL_55;
                        }

                        float v61 = (float)(int)v78;
                      }
                    }

                    else
                    {
                      float v61 = (float)v78;
                    }

                    v62 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:@"unit"]);
                    [v62 floatValue];
                    float v64 = v63;

                    v65 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:@"unit_str"]);
                    if (v65) {
                      v57 = (__CFString *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:@"unit_str"]);
                    }
                    else {
                      v57 = &stru_1000186C8;
                    }

                    uint64_t v60 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ [%0.3f %@]",  v48,  (float)(v64 * v61),  v57));
LABEL_61:

                    v48 = (void *)v60;
                  }

                  else
                  {
                    v56 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:@"formula"]);

                    if (v56)
                    {
                      v57 = (__CFString *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:@"formula"]);
                      uint64_t v58 = ((uint64_t (*)(__CFString *, unint64_t *))v57->data)(v57, &v78);
                      uint64_t v59 = objc_claimAutoreleasedReturnValue(v58);
                      uint64_t v60 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ [%@]",  v48,  v59));

                      v48 = (void *)v59;
                      goto LABEL_61;
                    }
                  }

                  [v73 addObject:v48];
LABEL_63:
                }

                unsigned __int16 v17 = v22;
                uint64_t v9 = v73;
                goto LABEL_19;
              }

              unint64_t v31 = v29 + (((_DWORD)v27 + 7) >> 3);
              if (v31 > v75)
              {
                v32 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Error, byte_offset + byte_length too large (error in field %@, offset=%d, byte_length=%d actual_length=%d)",  v30,  v29,  ((_DWORD)v27 + 7) >> 3,  v27);
                goto LABEL_22;
              }

              v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithUTF8String:]( &OBJC_CLASS___NSMutableString,  "stringWithUTF8String:",  "0x"));
              unsigned int v45 = v31 - 1;
              if (v45 >= v29)
              {
                do
                  [v33 appendFormat:v22, v74[(unsigned __int16)v45--]];
                while (v29 <= (unsigned __int16)v45);
              }

              v46 = (void *)objc_claimAutoreleasedReturnValue( -[PDControllerType4 stringForTitle:valueString:]( v72,  "stringForTitle:valueString:",  v30,  v33));
              [v9 addObject:v46];
            }

            unsigned __int16 v17 = v22;
            goto LABEL_19;
          }
        }

        else
        {
        }
      }

      v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Error, illegal field %@",  v19));
      [v9 addObject:v30];
LABEL_19:

      if ((id)++v18 == v16)
      {
        id v66 = [obj countByEnumeratingWithState:&v79 objects:v83 count:16];
        id v16 = v66;
        if (!v66) {
          goto LABEL_66;
        }
        goto LABEL_7;
      }
    }
  }

  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"ERROR: length %lld < %lu",  a4,  v12));
  [v9 addObject:v13];

LABEL_67:
  return v9;
}

- (id)registerFormatterIntEventWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerConfigs](self, "registerConfigs"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:&off_10001AA18]);

  if (v8)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerConfigs](self, "registerConfigs"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:&off_10001AA18]);
    v11 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue( -[PDControllerType5 registerFormatterGenericWithBuffer:andLength:andConfig:]( self,  "registerFormatterGenericWithBuffer:andLength:andConfig:",  a3,  a4,  v10));
  }

  else
  {
    v11 = &off_10001CAE8;
  }

  return v11;
}

- (id)registerFormatterIntMaskClearWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerConfigs](self, "registerConfigs"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:&off_10001AA30]);

  if (v8)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerConfigs](self, "registerConfigs"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:&off_10001AA30]);
    v11 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue( -[PDControllerType5 registerFormatterGenericWithBuffer:andLength:andConfig:]( self,  "registerFormatterGenericWithBuffer:andLength:andConfig:",  a3,  a4,  v10));
  }

  else
  {
    v11 = &off_10001CB00;
  }

  return v11;
}

- (id)registerFormatterWakeEventMaskWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerConfigs](self, "registerConfigs"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:&off_10001AA48]);

  if (v8)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerConfigs](self, "registerConfigs"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:&off_10001AA48]);
    v11 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue( -[PDControllerType5 registerFormatterGenericWithBuffer:andLength:andConfig:]( self,  "registerFormatterGenericWithBuffer:andLength:andConfig:",  a3,  a4,  v10));
  }

  else
  {
    v11 = &off_10001CB18;
  }

  return v11;
}

- (id)registerFormatterUSBConfigWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerConfigs](self, "registerConfigs"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:&off_10001AA60]);

  if (v8)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerConfigs](self, "registerConfigs"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:&off_10001AA60]);
    v11 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue( -[PDControllerType5 registerFormatterGenericWithBuffer:andLength:andConfig:]( self,  "registerFormatterGenericWithBuffer:andLength:andConfig:",  a3,  a4,  v10));
  }

  else
  {
    v11 = &off_10001CB30;
  }

  return v11;
}

- (id)registerFormatterIOConfig1WithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerConfigs](self, "registerConfigs"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:&off_10001AA78]);

  if (v8)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerConfigs](self, "registerConfigs"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:&off_10001AA78]);
    v11 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue( -[PDControllerType5 registerFormatterGenericWithBuffer:andLength:andConfig:]( self,  "registerFormatterGenericWithBuffer:andLength:andConfig:",  a3,  a4,  v10));
  }

  else
  {
    v11 = &off_10001CB48;
  }

  return v11;
}

- (id)registerFormatterIOConfig2WithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerConfigs](self, "registerConfigs"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:&off_10001AA90]);

  if (v8)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerConfigs](self, "registerConfigs"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:&off_10001AA90]);
    v11 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue( -[PDControllerType5 registerFormatterGenericWithBuffer:andLength:andConfig:]( self,  "registerFormatterGenericWithBuffer:andLength:andConfig:",  a3,  a4,  v10));
  }

  else
  {
    v11 = &off_10001CB60;
  }

  return v11;
}

- (id)registerFormatterPD3EMIntMaskWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerConfigs](self, "registerConfigs"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:&off_10001AAA8]);

  if (v8)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerConfigs](self, "registerConfigs"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:&off_10001AAA8]);
    v11 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue( -[PDControllerType5 registerFormatterGenericWithBuffer:andLength:andConfig:]( self,  "registerFormatterGenericWithBuffer:andLength:andConfig:",  a3,  a4,  v10));
  }

  else
  {
    v11 = &off_10001CB78;
  }

  return v11;
}

- (id)registerFormatterPersParamsWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerConfigs](self, "registerConfigs"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:&off_10001AAC0]);

  if (v8)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerConfigs](self, "registerConfigs"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:&off_10001AAC0]);
    v11 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue( -[PDControllerType5 registerFormatterGenericWithBuffer:andLength:andConfig:]( self,  "registerFormatterGenericWithBuffer:andLength:andConfig:",  a3,  a4,  v10));
  }

  else
  {
    v11 = &off_10001CB90;
  }

  return v11;
}

- (id)registerFormatterBootFlagsWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerConfigs](self, "registerConfigs"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:&off_10001AAD8]);

  if (v8)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerConfigs](self, "registerConfigs"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:&off_10001AAD8]);
    v11 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue( -[PDControllerType5 registerFormatterGenericWithBuffer:andLength:andConfig:]( self,  "registerFormatterGenericWithBuffer:andLength:andConfig:",  a3,  a4,  v10));
  }

  else
  {
    v11 = &off_10001CBA8;
  }

  return v11;
}

- (id)registerFormatterCFVIDStatusWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerConfigs](self, "registerConfigs"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:&off_10001AAF0]);

  if (v8)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerConfigs](self, "registerConfigs"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:&off_10001AAF0]);
    v11 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue( -[PDControllerType5 registerFormatterGenericWithBuffer:andLength:andConfig:]( self,  "registerFormatterGenericWithBuffer:andLength:andConfig:",  a3,  a4,  v10));
  }

  else
  {
    v11 = &off_10001CBC0;
  }

  return v11;
}

- (id)registerFormatterPowerSwitchStateWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[PDController registerFormatterHexDumpWithBuffer:andLength:]( self,  "registerFormatterHexDumpWithBuffer:andLength:",  a3,  a4));
  [v7 addObjectsFromArray:v8];
  if (a4 == 44 || a4 == 20)
  {
    v16.receiver = self;
    v16.super_class = (Class)&OBJC_CLASS___PDControllerType5;
    id v9 = -[PDControllerType5 registerFormatterPowerSwitchStateWithBuffer:andLength:]( &v16,  "registerFormatterPowerSwitchStateWithBuffer:andLength:",  a3,  a4);
    v10 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(v9);
  }

  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerConfigs](self, "registerConfigs"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:&off_10001AB08]);

    if (v12)
    {
      unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerConfigs](self, "registerConfigs"));
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:&off_10001AB08]);
      v10 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue( -[PDControllerType5 registerFormatterGenericWithBuffer:andLength:andConfig:]( self,  "registerFormatterGenericWithBuffer:andLength:andConfig:",  a3,  a4,  v14));
    }

    else
    {
      v10 = &off_10001CBD8;
    }
  }

  return v10;
}

- (id)registerFormatterADCResultsWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerConfigs](self, "registerConfigs"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:&off_10001AB20]);

  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerConfigs](self, "registerConfigs"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:&off_10001AB20]);
    v11 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue( -[PDControllerType5 registerFormatterGenericWithBuffer:andLength:andConfig:]( self,  "registerFormatterGenericWithBuffer:andLength:andConfig:",  a3,  a4,  v10));
  }

  else
  {
    v11 = &off_10001CBF0;
  }

  return v11;
}

- (id)registerFormatterMuxStateWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  if ((a4 & 0xFFFFFFFFFFFFFFFBLL) == 8)
  {
    v14.receiver = self;
    v14.super_class = (Class)&OBJC_CLASS___PDControllerType5;
    id v7 = -[PDControllerType5 registerFormatterMuxStateWithBuffer:andLength:]( &v14,  "registerFormatterMuxStateWithBuffer:andLength:",  a3,  a4);
    return (id)objc_claimAutoreleasedReturnValue(v7);
  }

  else
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerConfigs](self, "registerConfigs"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:&off_10001AB38]);

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerConfigs](self, "registerConfigs"));
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:&off_10001AB38]);
      unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue( -[PDControllerType5 registerFormatterGenericWithBuffer:andLength:andConfig:]( self,  "registerFormatterGenericWithBuffer:andLength:andConfig:",  a3,  a4,  v12));

      return v13;
    }

    else
    {
      return &off_10001CC08;
    }
  }

- (id)registerFormatterLDCMConfigWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerConfigs](self, "registerConfigs"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:&off_10001AB50]);

  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerConfigs](self, "registerConfigs"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:&off_10001AB50]);
    v11 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue( -[PDControllerType5 registerFormatterGenericWithBuffer:andLength:andConfig:]( self,  "registerFormatterGenericWithBuffer:andLength:andConfig:",  a3,  a4,  v10));
  }

  else
  {
    v11 = &off_10001CC20;
  }

  return v11;
}

- (id)registerFormatterLDCMStatusWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerConfigs](self, "registerConfigs"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:&off_10001AB68]);

  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerConfigs](self, "registerConfigs"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:&off_10001AB68]);
    v11 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue( -[PDControllerType5 registerFormatterGenericWithBuffer:andLength:andConfig:]( self,  "registerFormatterGenericWithBuffer:andLength:andConfig:",  a3,  a4,  v10));
  }

  else
  {
    v11 = &off_10001CC38;
  }

  return v11;
}

- (id)registerFormatterFWStateConfigWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerConfigs](self, "registerConfigs"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:&off_10001AB80]);

  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerConfigs](self, "registerConfigs"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:&off_10001AB80]);
    v11 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue( -[PDControllerType5 registerFormatterGenericWithBuffer:andLength:andConfig:]( self,  "registerFormatterGenericWithBuffer:andLength:andConfig:",  a3,  a4,  v10));
  }

  else
  {
    v11 = &off_10001CC50;
  }

  return v11;
}

- (id)registerFormatterSystemConfigWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerConfigs](self, "registerConfigs"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:&off_10001AB98]);

  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerConfigs](self, "registerConfigs"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:&off_10001AB98]);
    v11 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue( -[PDControllerType5 registerFormatterGenericWithBuffer:andLength:andConfig:]( self,  "registerFormatterGenericWithBuffer:andLength:andConfig:",  a3,  a4,  v10));
  }

  else
  {
    v11 = &off_10001CC68;
  }

  return v11;
}

- (id)registerFormatterCFSOPUVDMEnumWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerConfigs](self, "registerConfigs"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:&off_10001ABB0]);

  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerConfigs](self, "registerConfigs"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:&off_10001ABB0]);
    v11 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue( -[PDControllerType5 registerFormatterGenericWithBuffer:andLength:andConfig:]( self,  "registerFormatterGenericWithBuffer:andLength:andConfig:",  a3,  a4,  v10));
  }

  else
  {
    v11 = &off_10001CC80;
  }

  return v11;
}

- (id)registerFormatterTXEPRSourceCapWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerConfigs](self, "registerConfigs"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:&off_10001ABC8]);

  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerConfigs](self, "registerConfigs"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:&off_10001ABC8]);
    v11 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue( -[PDControllerType5 registerFormatterGenericWithBuffer:andLength:andConfig:]( self,  "registerFormatterGenericWithBuffer:andLength:andConfig:",  a3,  a4,  v10));
  }

  else
  {
    v11 = &off_10001CC98;
  }

  return v11;
}

- (id)registerFormatterTBTRetimerDataWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerConfigs](self, "registerConfigs"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:&off_10001ABE0]);

  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType5 registerConfigs](self, "registerConfigs"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:&off_10001ABE0]);
    v11 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue( -[PDControllerType5 registerFormatterGenericWithBuffer:andLength:andConfig:]( self,  "registerFormatterGenericWithBuffer:andLength:andConfig:",  a3,  a4,  v10));
  }

  else
  {
    v11 = &off_10001CCB0;
  }

  return v11;
}

- (id)readFullVersion
{
  unint64_t v11 = 0LL;
  v3 = (uint64_t *)malloc(0x40uLL);
  if (!v3)
  {
LABEL_5:
    id v6 = &stru_1000186C8;
    return v6;
  }

  uint64_t v4 = v3;
  unsigned int v5 = -[PDController registerRead:ofLength:atAddress:andOutReadLength:]( self,  "registerRead:ofLength:atAddress:andOutReadLength:",  v3,  64LL,  15LL,  &v11);
  id v6 = &stru_1000186C8;
  if (!v5 && v11 <= 8)
  {
    uint64_t v7 = *v4;
    char v10 = 0;
    uint64_t v9 = 0LL;
    if (!-[PDController registerRead:ofLength:atAddress:andOutReadLength:]( self,  "registerRead:ofLength:atAddress:andOutReadLength:",  &v10,  1LL,  44LL,  &v9))
    {
      id v6 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%X.%X.%X.%d.%d",  v7 >> 20,  (v7 >> 8) & 0xFFF,  v7,  BYTE4(v7),  BYTE5(v7)));
      return v6;
    }

    goto LABEL_5;
  }

  return v6;
}

- (id)registerFormatterCFVIDConfigWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___PDControllerType5;
  id v5 = -[PDControllerType5 registerFormatterCFVIDConfigWithBuffer:andLength:]( &v18,  "registerFormatterCFVIDConfigWithBuffer:andLength:",  a3,  a4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = [v6 mutableCopy];

  if ([v7 count])
  {
    for (unint64_t i = 0; (unint64_t)[v7 count] > i; ++i)
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndex:i]);
      uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSString);
      if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
      {
        unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndex:i]);
        unsigned int v12 = [v11 containsString:@"DFUfSetDBF"];

        if (v12)
        {
          unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndex:i]);
          unsigned int v14 = [v13 containsString:@"0x1"];

          if (v14) {
            id v15 = @"DFUf entry sets No-VIN flag. (0x1)";
          }
          else {
            id v15 = @"DFUf does not affect No-VIN flag. (0x0)";
          }
          objc_super v16 = (void *)objc_claimAutoreleasedReturnValue( -[PDControllerType4 stringForTitle:valueString:]( self,  "stringForTitle:valueString:",  @"DFUfSetNVF",  v15));
          [v7 replaceObjectAtIndex:i withObject:v16];

          return v7;
        }
      }

      else
      {
      }
    }
  }

  return v7;
}

- (id)registerFormatterCFDebugConfigWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v97 = self;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[PDController registerFormatterHexDumpWithBuffer:andLength:]( self,  "registerFormatterHexDumpWithBuffer:andLength:",  a3,  a4));
  [v7 addObjectsFromArray:v8];
  if (a4 < 0x41)
  {
    if (a4 != 64)
    {
      uint64_t v77 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"ERROR: length %lld < 64",  a4));
      [v7 addObject:v77];

      goto LABEL_35;
    }
  }

  else
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"ERROR: Unexpected length, may not be decoded properly."));
    [v7 addObject:v9];
  }

  v88 = v8;
  v109[0] = &off_10001ABF8;
  v109[1] = &off_10001AC10;
  v110[0] = @"Reboot Ace (equivalent to 'Gaid' 4CC). (0x00)";
  v110[1] = @"RESET_REQ. (0x01)";
  v109[2] = &off_10001AC28;
  v109[3] = &off_10001AC40;
  v110[2] = @"DFU_REQ. (0x02)";
  v110[3] = @"DBG_EN. (0x03)";
  v109[4] = &off_10001AC58;
  v110[4] = @"DFU Ace (0x04)";
  v94 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v110,  v109,  5LL));
  v107[0] = &off_10001AC10;
  v107[1] = &off_10001AC28;
  v108[0] = @"Action. (0x01)";
  v108[1] = @"SWD. (0x02)";
  v107[2] = &off_10001AC40;
  v107[3] = &off_10001AC58;
  v108[2] = @"UART. (0x03)";
  v108[3] = @"DigitalIO. (0x04)";
  v107[4] = &off_10001AC70;
  v107[5] = &off_10001AC88;
  v108[4] = @"DCI-BSSB. (0x05)";
  v108[5] = @"USB. (0x06)";
  v107[6] = &off_10001ACA0;
  v107[7] = &off_10001ACB8;
  v108[6] = @"DCI-DbC. (0x07)";
  v108[7] = @"I2C. (0x08)";
  v107[8] = &off_10001ACD0;
  v107[9] = &off_10001ACE8;
  v108[8] = @"DisplayPort. (0x09)";
  v108[9] = @"AID. (0x0A)";
  v107[10] = &off_10001AD00;
  v107[11] = &off_10001AD18;
  v108[10] = @"AnalogIO. (0x0B)";
  v108[11] = @"2Wire-BSSB. (0x0C)";
  v107[12] = &off_10001AD30;
  v107[13] = &off_10001AD48;
  v108[12] = @"2Wire-MADI. (0x0D)";
  v108[13] = @"KIS (USB). (0x46)";
  v90 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v108,  v107,  14LL));
  v105[0] = &off_10001ABF8;
  v105[1] = &off_10001AC10;
  v106[0] = @"Ace AUX. (0x00)";
  v106[1] = @"Ace USB_RP1. (0x01)";
  v105[2] = &off_10001AC28;
  v105[3] = &off_10001AC40;
  v106[2] = @"Ace USB_RP2. (0x02)";
  v106[3] = @"Ace USB_RP3. (0x03)";
  v105[4] = &off_10001AC58;
  v105[5] = &off_10001AC70;
  v106[4] = @"USB3 Normal Mode. (0x04)";
  v106[5] = @"Ace Internal SWD. (0x05)";
  v106[6] = @"Ace DEBUG0/1 (Analog). (0x06)";
  v106[7] = @"Ace DEBUG2/3 (Analog). (0x07)";
  v106[8] = @"Ace DEBUG4/5 (Analog). (0x08)";
  v106[9] = @"Ace DEBUG6/7 (Analog). (0x09)";
  v106[10] = @"Ace Internal UART. (0x0A)";
  v106[11] = @"Ace I2C1. (0x0B)";
  v105[12] = &off_10001AD18;
  v105[13] = &off_10001AD60;
  v106[12] = @"Ace I2C2/SPMI. (0x0C)";
  v106[13] = @"Debug MUX DCI. (0x12)";
  v105[14] = &off_10001AD78;
  v105[15] = &off_10001AA18;
  v106[14] = @"Debug MUX SWD. (0x13)";
  v106[15] = @"Debug MUX UART/DM2 USB. (0x14)";
  v105[16] = &off_10001AD90;
  v105[17] = &off_10001AA30;
  v106[16] = @"Ace Debug Serial Output. (0x15)";
  v106[17] = @"Ace DEBUG0-3 DCI. (0x16)";
  v105[18] = &off_10001ADA8;
  v105[19] = &off_10001ADC0;
  v106[18] = @"Ace DEBUG4-7 DCI. (0x17)";
  v106[19] = @"Ace DEBUG0/1 (Digital). (0x18)";
  v105[20] = &off_10001ADD8;
  v105[21] = &off_10001ADF0;
  v106[20] = @"Ace DEBUG2/3 (Digital). (0x19)";
  v106[21] = @"Ace DEBUG4/5 (Digital). (0x1A)";
  v105[22] = &off_10001AE08;
  v105[23] = &off_10001AE20;
  v106[22] = @"Ace DEBUG6/7 (Digital). (0x1B)";
  v106[23] = @"Ace DEBUG0/1 (Digital). (0x1C)";
  v105[6] = &off_10001AC88;
  v105[7] = &off_10001ACA0;
  v105[24] = &off_10001AE38;
  v105[25] = &off_10001AE50;
  v105[8] = &off_10001ACB8;
  v105[9] = &off_10001ACD0;
  v106[24] = @"Ace DEBUG2/3 (Digital). (0x1D)";
  v106[25] = @"Ace DEBUG4/5 (Digital). (0x1E)";
  v105[10] = &off_10001ACE8;
  v105[11] = &off_10001AD00;
  v105[26] = &off_10001AE68;
  v106[26] = @"Ace DEBUG6/7 (Digital). (0x1F)";
  v89 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v106,  v105,  27LL));
  v104[0] = @"SMC. (0x01)";
  v104[1] = @"PCH/MCP. (0x02)";
  v103[0] = &off_10001AC10;
  v103[1] = &off_10001AC28;
  v104[2] = @"PDMicro1. (0x03)";
  v104[3] = @"Mojo. (0x04)";
  v103[2] = &off_10001AC40;
  v103[3] = &off_10001AC58;
  v103[4] = &off_10001AC70;
  v103[5] = &off_10001AC88;
  v104[4] = @"PMU. (0x05)";
  v104[5] = @"SoC. (0x06)";
  v103[6] = &off_10001ACA0;
  v103[7] = &off_10001ACB8;
  v104[6] = @"Baseband. (0x07)";
  v104[7] = @"SSD. (0x08)";
  v103[8] = &off_10001ACD0;
  v103[9] = &off_10001ACE8;
  v104[8] = @"PDMicro2. (0x09)";
  v104[9] = @"HID. (0x0A)";
  v103[10] = &off_10001AD00;
  v103[11] = &off_10001AD18;
  v104[10] = @"KIS. (0x0B)";
  v104[11] = @"MCU. (0x0C)";
  v103[12] = &off_10001AD30;
  v103[13] = &off_10001AE80;
  v104[12] = @"Tristar+KIS Magic. (0x0D)";
  v104[13] = @"Fan_01. (0x0E)";
  v103[14] = &off_10001AE98;
  v103[15] = &off_10001AEB0;
  v104[14] = @"Fan_23. (0x0F)";
  v104[15] = @"Camera. (0x10)";
  v103[16] = &off_10001AEC8;
  v104[16] = @"LDCM. (0x11)";
  v91 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v104,  v103,  17LL));
  v102[0] = @"Pairs. (0x01)";
  v102[1] = @"Voltage. (0x02)";
  v101[0] = &off_10001AC10;
  v101[1] = &off_10001AC28;
  v101[2] = &off_10001AC40;
  v101[3] = &off_10001AC58;
  v102[2] = @"Clock/MHz. (0x03)";
  v102[3] = @"Clock/Multiplier. (0x04)";
  v101[4] = &off_10001AC70;
  v101[5] = &off_10001AEE0;
  v102[4] = @"Orientation. (0x05)";
  v102[5] = @"Options/[Signal]. (0x80)";
  v101[6] = &off_10001AEF8;
  v102[6] = @"Options/UART. (0x81)";
  v93 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v102,  v101,  7LL));
  uint64_t v10 = 0LL;
  unsigned __int8 v11 = 1;
  while (2)
  {
    uint64_t v12 = 0LL;
    uint64_t v98 = v11;
    uint64_t v92 = (int)v10;
    else {
      uint64_t v13 = v10;
    }
    v95 = (char *)a3 + (int)v10;
    uint64_t v96 = v13 - (int)v10;
    uint64_t v14 = v10 << 32;
    do
    {
      if (v96 == v12) {
        goto LABEL_33;
      }
      uint64_t v15 = v95[v12];
      if (!v95[v12])
      {
        unint64_t v75 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"0x%X (byte 0x%X)",  0LL,  v12 + v92 + 1));
        v76 = (void *)objc_claimAutoreleasedReturnValue( -[PDControllerType4 stringForTitle:valueString:]( v97,  "stringForTitle:valueString:",  @"Terminator Record",  v75));
        [v7 addObject:v76];

        goto LABEL_32;
      }

      objc_super v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"DC Record #%u Header",  v98));
      unsigned __int16 v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"0x%02X", v15));
      objc_super v18 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType4 stringForTitle:valueString:](v97, "stringForTitle:valueString:", v16, v17));
      [v7 addObject:v18];

      v99[0] = &off_10001ABF8;
      v99[1] = &off_10001AC10;
      v100[0] = @"Record Invalid. (0x0)";
      v100[1] = @"Ace Internal DC Record. (0x1)";
      v99[2] = &off_10001AC28;
      v99[3] = &off_10001AC40;
      v100[2] = @"Action DC Record. (0x02)";
      v100[3] = @"Signal DC Record. (0x03)";
      v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v100,  v99,  4LL));
      unsigned int v20 = v15 >> 6;
      v21 = (void *)objc_claimAutoreleasedReturnValue( -[PDControllerType4 stringForTitle:value:table:]( v97,  "stringForTitle:value:table:",  @"  DCRecordType",  v15 >> 6,  v19));
      [v7 addObject:v21];

      int v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"0x%02X (byte 0x%02X)",  v15 & 0x3F,  (v15 & 0x3F) + 1));
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( -[PDControllerType4 stringForTitle:valueString:]( v97,  "stringForTitle:valueString:",  @"  DCRecordEnd",  v22));
      [v7 addObject:v23];

      ++v12;
      v14 += (uint64_t)&_mh_execute_header;
    }

    while ((v15 & 0x3F) == 0);
    if ((int)v92 - 1 + (int)v12 < 63)
    {
      int v24 = v12 + v92;
      switch(v20)
      {
        case 2u:
          uint64_t v25 = *((unsigned __int8 *)a3 + (v14 >> 32));
          __int128 v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"DC Record #%u Action DC Record",  v98));
          id v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"0x%02X",  v25));
          v28 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType4 stringForTitle:valueString:](v97, "stringForTitle:valueString:", v26, v27));
          [v7 addObject:v28];

          unsigned int v29 = (void *)objc_claimAutoreleasedReturnValue( -[PDControllerType4 stringForTitle:value:table:]( v97,  "stringForTitle:value:table:",  @"  ActionTarget",  v25,  v91));
          [v7 addObject:v29];

          if ((int)v92 - 1 + (int)v12 < 62)
          {
            LODWORD(v30) = 0;
            uint64_t v31 = 1431655766LL * (int)((v15 & 0x3F) - v92 - v12);
            int v32 = (BYTE4(v31) + (v31 < 0));
            uint64_t v10 = v24 + 1;
            while (v32 != (_DWORD)v30)
            {
              unsigned int v33 = *(_DWORD *)((char *)a3 + v10);
              uint64_t v30 = (v30 + 1);
              v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"DC Record #%u Action EDC Record #%d",  v98,  v30));
              v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"0x%06X",  v33 & 0xFFFFFF));
              unsigned __int8 v36 = (void *)objc_claimAutoreleasedReturnValue( -[PDControllerType4 stringForTitle:valueString:]( v97,  "stringForTitle:valueString:",  v34,  v35));
              [v7 addObject:v36];

              v37 = (void *)objc_claimAutoreleasedReturnValue( -[PDControllerType4 stringForTitle:value:table:]( v97,  "stringForTitle:value:table:",  @"  AceAction",  (v33 >> 18) & 0xF,  v94));
              [v7 addObject:v37];

              v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"0x%02X",  BYTE1(v33)));
              unsigned int v39 = (void *)objc_claimAutoreleasedReturnValue( -[PDControllerType4 stringForTitle:valueString:]( v97,  "stringForTitle:valueString:",  @"  ActionValue",  v38));
              [v7 addObject:v39];

              unint64_t v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"0x%02X",  v33));
              v41 = (void *)objc_claimAutoreleasedReturnValue( -[PDControllerType4 stringForTitle:valueString:]( v97,  "stringForTitle:valueString:",  @"  ActionTag",  v40));
              [v7 addObject:v41];

              uint64_t v42 = v10 + 3;
              BOOL v43 = v10 < 61;
              v10 += 3LL;
              if (!v43)
              {
LABEL_29:
                v74 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"ERROR: The record overflows the register buffer. Stop decoding."));
                [v7 addObject:v74];

                uint64_t v10 = v42;
                goto LABEL_30;
              }
            }

            goto LABEL_30;
          }

          break;
        case 3u:
          unint64_t v44 = *(unsigned int *)((char *)a3 + (v14 >> 32));
          unsigned int v45 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"DC Record #%u Signal DC Record",  v98));
          v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"0x%08X",  v44));
          v47 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType4 stringForTitle:valueString:](v97, "stringForTitle:valueString:", v45, v46));
          [v7 addObject:v47];

          v48 = (void *)objc_claimAutoreleasedReturnValue( -[PDControllerType5 decodeSingleBit:title:arg0:arg1:]( v97,  "decodeSingleBit:title:arg0:arg1:",  (v44 >> 31) & 1,  @"  SignalPairs_Single",  @"All specified pairs used. (0x0)",  @"Single pair used. (0x1)"));
          [v7 addObjectsFromArray:v48];

          v49 = (void *)objc_claimAutoreleasedReturnValue( -[PDControllerType5 decodeSingleBit:title:arg0:arg1:]( v97,  "decodeSingleBit:title:arg0:arg1:",  v44 >> 30,  @"  SignalPairs_RX2",  @"Not used. (0x0)",  @"Used. (0x1)"));
          [v7 addObjectsFromArray:v49];

          v50 = (void *)objc_claimAutoreleasedReturnValue( -[PDControllerType5 decodeSingleBit:title:arg0:arg1:]( v97,  "decodeSingleBit:title:arg0:arg1:",  v44 >> 29,  @"  SignalPairs_RX1",  @"Not used. (0x0)",  @"Used. (0x1)"));
          [v7 addObjectsFromArray:v50];

          uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue( -[PDControllerType5 decodeSingleBit:title:arg0:arg1:]( v97,  "decodeSingleBit:title:arg0:arg1:",  v44 >> 28,  @"  SignalPairs_TX2",  @"Not used. (0x0)",  @"Used. (0x1)"));
          [v7 addObjectsFromArray:v51];

          v52 = (void *)objc_claimAutoreleasedReturnValue( -[PDControllerType5 decodeSingleBit:title:arg0:arg1:]( v97,  "decodeSingleBit:title:arg0:arg1:",  v44 >> 27,  @"  SignalPairs_TX1",  @"Not used. (0x0)",  @"Used. (0x1)"));
          [v7 addObjectsFromArray:v52];

          v53 = (void *)objc_claimAutoreleasedReturnValue( -[PDControllerType5 decodeSingleBit:title:arg0:arg1:]( v97,  "decodeSingleBit:title:arg0:arg1:",  v44 >> 26,  @"  SignalPairs_SBU",  @"Not used. (0x0)",  @"Used. (0x1)"));
          [v7 addObjectsFromArray:v53];

          v54 = (void *)objc_claimAutoreleasedReturnValue( -[PDControllerType5 decodeSingleBit:title:arg0:arg1:]( v97,  "decodeSingleBit:title:arg0:arg1:",  v44 >> 25,  @"  SignalPairs_Mission",  @"Not used. (0x0)",  @"Used. (0x1)"));
          [v7 addObjectsFromArray:v54];

          int v55 = (void *)objc_claimAutoreleasedReturnValue( -[PDControllerType5 decodeSingleBit:title:arg0:arg1:]( v97,  "decodeSingleBit:title:arg0:arg1:",  BYTE3(v44),  @"  SignalPairs_Debug",  @"Not used. (0x0)",  @"Used. (0x1)"));
          [v7 addObjectsFromArray:v55];

          v56 = (void *)objc_claimAutoreleasedReturnValue( -[PDControllerType5 decodeSingleBit:title:arg0:arg1:]( v97,  "decodeSingleBit:title:arg0:arg1:",  (v44 >> 23),  @"  InsertTagVoltageVDDIO",  @"Do not insert 0x02 0xVV (Voltage) tag. (0x0)",  @"Insert 0x02 0xVV (Voltage) tag after Pairs tag. (0x1)"));
          [v7 addObjectsFromArray:v56];

          v57 = (void *)objc_claimAutoreleasedReturnValue( -[PDControllerType5 decodeSingleBit:title:arg0:arg1:]( v97,  "decodeSingleBit:title:arg0:arg1:",  (v44 >> 22),  @"  FirstTagBeforePairs",  @"Do not place first EDC Record before Pairs tag. (0x0)",  @"Place first EDC Record before Pairs tag. (0x1)"));
          [v7 addObjectsFromArray:v57];

          uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue( -[PDControllerType5 decodeSingleBit:title:arg0:arg1:]( v97,  "decodeSingleBit:title:arg0:arg1:",  (v44 >> 21),  @"  InsertTagVoltage3.3V",  @"Do not insert 0x02 0x21 (Voltage: 3.3V) tag. (0x0)",  @"Insert 0x02 0x21 (Voltage: 3.3V) tag after Pairs tag. (0x1)"));
          [v7 addObjectsFromArray:v58];

          uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue( -[PDControllerType4 stringForTitle:value:table:]( v97,  "stringForTitle:value:table:",  @"  AceSignal",  WORD1(v44) & 0x1F,  v89));
          [v7 addObject:v59];

          uint64_t v60 = (void *)objc_claimAutoreleasedReturnValue( -[PDControllerType4 stringForTitle:value:table:]( v97,  "stringForTitle:value:table:",  @"  SignalTarget",  BYTE1(v44),  v91));
          [v7 addObject:v60];

          float v61 = (void *)objc_claimAutoreleasedReturnValue( -[PDControllerType4 stringForTitle:value:table:]( v97,  "stringForTitle:value:table:",  @"  Signal",  v44,  v90));
          [v7 addObject:v61];

          if ((int)v92 - 1 + (int)v12 < 59)
          {
            uint64_t v62 = 0LL;
            int v63 = (v15 & 0x3F) - v92 - v12;
            int v64 = v63 - 3;
            LODWORD(v65) = v63 - 2;
            if (v64 >= 0) {
              unint64_t v65 = v64;
            }
            else {
              unint64_t v65 = v65;
            }
            uint64_t v10 = (int)v12 + (int)v92 + 4;
            int v66 = (v65 >> 1);
            while (v66 != (_DWORD)v62)
            {
              uint64_t v67 = *(unsigned __int16 *)((char *)a3 + v10);
              uint64_t v68 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"DC Record #%u Signal EDC Record #%d",  v98,  ++v62));
              uint64_t v69 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"0x%04X",  v67));
              uint64_t v70 = (void *)objc_claimAutoreleasedReturnValue( -[PDControllerType4 stringForTitle:valueString:]( v97,  "stringForTitle:valueString:",  v68,  v69));
              [v7 addObject:v70];

              id v71 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"0x%02X",  v67 >> 8));
              v72 = (void *)objc_claimAutoreleasedReturnValue( -[PDControllerType4 stringForTitle:valueString:]( v97,  "stringForTitle:valueString:",  @"  SignalValue",  v71));
              [v7 addObject:v72];

              v73 = (void *)objc_claimAutoreleasedReturnValue( -[PDControllerType4 stringForTitle:value:table:]( v97,  "stringForTitle:value:table:",  @"  SignalTag",  v67,  v93));
              [v7 addObject:v73];

              uint64_t v42 = v10 + 2;
              BOOL v43 = v10 < 62;
              v10 += 2LL;
              if (!v43) {
                goto LABEL_29;
              }
            }

            goto LABEL_30;
          }

          break;
        case 1u:
          uint64_t v79 = *((unsigned __int8 *)a3 + (v14 >> 32));
          __int128 v80 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"DC Record #%u Internal DC Record",  v98));
          __int128 v81 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"0x%02X",  v79));
          __int128 v82 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType4 stringForTitle:valueString:](v97, "stringForTitle:valueString:", v80, v81));
          [v7 addObject:v82];

          v83 = (void *)objc_claimAutoreleasedReturnValue( -[PDControllerType5 decodeSingleBit:title:arg0:arg1:]( v97,  "decodeSingleBit:title:arg0:arg1:",  v79 >> 7,  @"  OfferRESET",  @"No PortMicro Action entry for reset shall be advertised. (0x0)",  @"PortMicro Action entry for reset shall be advertised. (0x1)"));
          [v7 addObjectsFromArray:v83];

          v84 = (void *)objc_claimAutoreleasedReturnValue( -[PDControllerType5 decodeSingleBit:title:arg0:arg1:]( v97,  "decodeSingleBit:title:arg0:arg1:",  v79 >> 6,  @"  OfferAceDFU",  @"No PortMicro Action entry for DFU shall be advertised. (0x0)",  @"PortMicro DFU entry for reset shall be advertised. (0x1)"));
          [v7 addObjectsFromArray:v84];

          v85 = (void *)objc_claimAutoreleasedReturnValue( -[PDControllerType5 decodeSingleBit:title:arg0:arg1:]( v97,  "decodeSingleBit:title:arg0:arg1:",  v79 >> 3,  @"  OfferI2C2SPMI",  @"No PortMicro I2C/SPMI entry for I2C2 and SPMI shall be advertised. (0x0)",  @"PortMicro I2C or SPMI entry for I2C2 or SPMI shall be advertised. (0x1)"));
          [v7 addObjectsFromArray:v85];

          v86 = (void *)objc_claimAutoreleasedReturnValue( -[PDControllerType5 decodeSingleBit:title:arg0:arg1:]( v97,  "decodeSingleBit:title:arg0:arg1:",  v79 >> 2,  @"  OfferI2C1",  @"No PortMicro I2C entry for I2C1 shall be advertised. (0x0)",  @"PortMicro I2C entry for I2C1 shall be advertised. (0x1)"));
          [v7 addObjectsFromArray:v86];

          v87 = (void *)objc_claimAutoreleasedReturnValue( -[PDControllerType5 decodeSingleBit:title:arg0:arg1:]( v97,  "decodeSingleBit:title:arg0:arg1:",  v79 >> 1,  @"  OfferDebugSerial",  @"No PortMicro UART entry shall be advertised. (0x0)",  @"PortMicro UART entry shall be advertised. (0x1)"));
          [v7 addObjectsFromArray:v87];

          unint64_t v75 = (void *)objc_claimAutoreleasedReturnValue( -[PDControllerType5 decodeSingleBit:title:arg0:arg1:]( v97,  "decodeSingleBit:title:arg0:arg1:",  v79,  @"  OfferSWD",  @"No PortMicro SWD entry shall be advertised. (0x0)",  @"PortMicro SWD entry shall be advertised. (0x1)"));
          [v7 addObjectsFromArray:v75];
          goto LABEL_32;
        default:
          uint64_t v10 = v92 + v12;
LABEL_30:
          unsigned __int8 v11 = v98 + 1;
          continue;
      }
    }

    break;
  }

  unint64_t v75 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"ERROR: The record overflows the register buffer. Stop decoding."));
  [v7 addObject:v75];
LABEL_32:

LABEL_33:
  id v8 = v88;
LABEL_35:

  return v7;
}

- (id)registerFormatterSecondaryMUXInitWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[PDController registerFormatterHexDumpWithBuffer:andLength:]( self,  "registerFormatterHexDumpWithBuffer:andLength:",  a3,  a4));
  [v7 addObjectsFromArray:v8];
  if (a4 < 0x41)
  {
    if (a4 != 64)
    {
      objc_super v16 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"ERROR: length %lld < 64",  a4));
      [v7 addObject:v16];
      goto LABEL_16;
    }
  }

  else
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"ERROR: Unexpected length, may not be decoded properly."));
    [v7 addObject:v9];
  }

  v52 = v8;
  unsigned int v10 = *((unsigned __int8 *)a3 + 1);
  int v55 = v10 & 0x40;
  unsigned int v11 = v10 & 0x20;
  int v12 = (v10 >> 6) & 1;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"if ( I2CDataMux != 01110b)"));
  [v7 addObject:v13];

  unsigned __int8 v14 = 0;
  int v53 = 62 - (v12 + (v11 >> 5));
  unsigned int v54 = v11;
  int v15 = 2;
  objc_super v16 = &stru_1000186C8;
  do
  {
    unsigned __int16 v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"  Initialization Record %d",  v14));
    [v7 addObject:v17];

    uint64_t v18 = v15;
    uint64_t v19 = *((unsigned __int8 *)a3 + v15);
    if (v54)
    {
      unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"0x%04X",  v19 | (*((unsigned __int8 *)a3 + v15 + 1) << 8)));
      unsigned int v21 = 2;
    }

    else
    {
      unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"0x%02X", v19));
      unsigned int v21 = 1;
    }

    uint64_t v22 = v14;

    uint64_t v23 = v18 + v21;
    int v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"    SecondaryMUXInit%dSubaddr",  v22));
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType4 stringForTitle:valueString:](self, "stringForTitle:valueString:", v24, v20));
    [v7 addObject:v25];

    uint64_t v26 = *((unsigned __int8 *)a3 + v23);
    if (v55)
    {
      objc_super v16 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"0x%04X",  v26 | (*((unsigned __int8 *)a3 + (int)v23 + 1) << 8)));
      int v27 = 2;
    }

    else
    {
      objc_super v16 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"0x%02X",  v26));
      int v27 = 1;
    }

    int v15 = v23 + v27;
    v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"    SecondaryMUXInit%dData",  v22));
    unsigned int v29 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType4 stringForTitle:valueString:](self, "stringForTitle:valueString:", v28, v16));
    [v7 addObject:v29];

    unsigned __int8 v14 = v22 + 1;
  }

  while (v15 <= v53);
  unsigned int v30 = *((unsigned __int8 *)a3 + 1);
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue( -[PDControllerType5 decodeSingleBit:title:arg0:arg1:]( self,  "decodeSingleBit:title:arg0:arg1:",  v30 >> 7,  @"  SecondaryMUXInitEveryConnect",  @"Initialization only needs to be performed once. (0x0)",  @"Initialization must be performed every time the MUX is 'activated'. (0x1)"));
  [v7 addObjectsFromArray:v31];

  int v32 = (void *)objc_claimAutoreleasedReturnValue( -[PDControllerType5 decodeSingleBit:title:arg0:arg1:]( self,  "decodeSingleBit:title:arg0:arg1:",  v30 >> 6,  @"  SecondaryMUXData16bit",  @"Data Records are 1 byte each. (0x0)",  @"Data Records are 2 bytes each. (0x1)"));
  [v7 addObjectsFromArray:v32];

  unsigned int v33 = (void *)objc_claimAutoreleasedReturnValue( -[PDControllerType5 decodeSingleBit:title:arg0:arg1:]( self,  "decodeSingleBit:title:arg0:arg1:",  v30 >> 5,  @"  SecondaryMUXSubaddr16bit",  @"Subaddress Records are 1 byte each. (0x0)",  @"Subaddress Records are 2 bytes each. (0x1)"));
  [v7 addObjectsFromArray:v33];

  v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"0x%02X",  v30 & 0x1F));
  v35 = (void *)objc_claimAutoreleasedReturnValue( -[PDControllerType4 stringForTitle:valueString:]( self,  "stringForTitle:valueString:",  @"  SecondaryMUXNumEntries",  v34));
  [v7 addObject:v35];

  unsigned __int8 v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"if ( I2CDataMux == 01110b)"));
  [v7 addObject:v36];

  for (uint64_t i = 63LL; i != 1; --i)
  {
    uint64_t v38 = *((unsigned __int8 *)a3 + i);
    unsigned int v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"  SecondaryMUXInitByte%d",  i - 2));
    unint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"0x%02X", v38));
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType4 stringForTitle:valueString:](self, "stringForTitle:valueString:", v39, v40));
    [v7 addObject:v41];
  }

  unsigned int v42 = *((unsigned __int8 *)a3 + 1);
  BOOL v43 = (void *)objc_claimAutoreleasedReturnValue( -[PDControllerType5 decodeSingleBit:title:arg0:arg1:]( self,  "decodeSingleBit:title:arg0:arg1:",  v42 >> 7,  @"  SecondaryMUXInitEveryConnect",  @"Initialization only needs to be performed once. (0x0)",  @"Initialization must be performed every time the MUX is 'activated'. (0x1)"));
  [v7 addObjectsFromArray:v43];

  unint64_t v44 = (void *)objc_claimAutoreleasedReturnValue( -[PDControllerType5 decodeSingleBit:title:arg0:arg1:]( self,  "decodeSingleBit:title:arg0:arg1:",  v42 >> 6,  @"  SecondaryMUXUseStringTable",  @"SecondaryMUXNumBytes contains the number of SecondaryMUXInitByte bytes. (0x0)",  @"SecondaryMUXNumBytes contains an index to the String Table. (0x1)"));
  [v7 addObjectsFromArray:v44];

  unsigned int v45 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"0x%02X",  v42 & 0x3F));
  v46 = (void *)objc_claimAutoreleasedReturnValue( -[PDControllerType4 stringForTitle:valueString:]( self,  "stringForTitle:valueString:",  @"  SecondaryMUXNumEntries",  v45));
  [v7 addObject:v46];

  uint64_t v47 = *(unsigned __int8 *)a3;
  v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"I2C addr = 0x%02X",  v47 >> 1));
  v49 = (void *)objc_claimAutoreleasedReturnValue( -[PDControllerType4 stringForTitle:valueString:]( self,  "stringForTitle:valueString:",  @"SecondaryMUXAddr",  v48));
  [v7 addObject:v49];

  v50 = (void *)objc_claimAutoreleasedReturnValue( -[PDControllerType5 decodeSingleBit:title:arg0:arg1:]( self,  "decodeSingleBit:title:arg0:arg1:",  v47,  @"SecondaryMUXValid",  @"Register Invalid. (0x0)",  @"Register Valid. (0x1)"));
  [v7 addObjectsFromArray:v50];

  id v8 = v52;
LABEL_16:

  return v7;
}

- (void)buildRegDecodes
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100005C50;
  v6[3] = &unk_1000182C8;
  objc_copyWeak(&v7, &location);
  v3 = objc_retainBlock(v6);
  uint64_t v4 = *(NSDictionary **)((char *)&self->super._dpmrConfigs + 2);
  *(NSDictionary **)((char *)&self->super._dpmrConfigs + 2) = v3;

  id v5 = *(id *)((char *)&self->_policy_handler + 2);
  *(id *)((char *)&self->_policy_handler + 2) = &stru_100018308;

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)setDPMrConfigs
{
  v46.receiver = self;
  v46.super_class = (Class)&OBJC_CLASS___PDControllerType5;
  -[PDControllerType4 setDPMrConfigs](&v46, "setDPMrConfigs");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType4 dpmrConfigs](self, "dpmrConfigs"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v3));

  uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"LRD1"]);
  if (v5)
  {
    id v6 = (void *)v5;
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"LRD1"]);
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"mask"]);
    if (v8)
    {
      uint64_t v9 = (void *)v8;
      unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"LRD1"]);
      unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"match"]);

      if (!v11) {
        goto LABEL_6;
      }
      int v12 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"LRD1"]);
      id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v12));

      [v6 setObject:&off_10001AF10 forKeyedSubscript:@"mask"];
      [v6 setObject:&off_10001AF28 forKeyedSubscript:@"match"];
      id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithDictionary:",  v6));
      [v4 setObject:v7 forKeyedSubscript:@"LRD1"];
    }
  }

- (int)printDBStateHistory
{
  v3 = (unsigned __int8 *)malloc(0x40uLL);
  uint64_t v4 = v3;
  if (v3)
  {
    *((_OWORD *)v3 + 2) = 0u;
    *((_OWORD *)v3 + 3) = 0u;
    *(_OWORD *)v3 = 0u;
    *((_OWORD *)v3 + 1) = 0u;
    __int16 v23 = 0;
    int v21 = 1145197420;
    char v22 = 1;
    LODWORD(v20) = 4194307;
    int v5 = -[PDControllerType2 executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:]( self,  "executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLen gth:returnDataBufferLength:timeoutInSeconds:",  1LL,  &v21,  &v22,  0LL,  v3,  0LL,  v20,  10LL);
  }

  else
  {
    __int16 v23 = 0;
    int v21 = 1145197420;
    char v22 = 1;
    int v5 = -536870211;
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[PDController registerFormatterHexDumpWithBuffer:andLength:]( self,  "registerFormatterHexDumpWithBuffer:andLength:",  v4,  18LL));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndexedSubscript:0]);
  -[PDController printRegisterTitle:andDescription:](self, "printRegisterTitle:andDescription:", @"DBSl(0)", v7);

  if (v5)
  {
    int v8 = 0;
  }

  else
  {
    int v8 = v4[3] | ((v4[4] & 7) << 8);
    uint64_t v9 = 1LL;
    do
    {
      char v22 = (16 * v9) | 1;
      LODWORD(v20) = 4194307;
      int v5 = -[PDControllerType2 executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:]( self,  "executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataL ength:returnDataBufferLength:timeoutInSeconds:",  1LL,  &v21,  &v22,  0LL,  v4,  0LL,  v20,  10LL);
      unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"DBSl(%u)", v9));
      unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue( -[PDController registerFormatterHexDumpWithBuffer:andLength:]( self,  "registerFormatterHexDumpWithBuffer:andLength:",  v4,  64LL));
      int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndexedSubscript:0]);
      -[PDController printRegisterTitle:andDescription:](self, "printRegisterTitle:andDescription:", v10, v12);

      uint64_t v9 = (v9 + 1);
    }

    while (!v5);
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  if (v8)
  {
    int v14 = 0;
    do
    {
      ++v14;
      if (!v5)
      {
        char v22 = 1;
        __int16 v23 = v14 & 0x7FF;
        LODWORD(v20) = 4194307;
        int v5 = -[PDControllerType2 executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:]( self,  "executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDat aLength:returnDataBufferLength:timeoutInSeconds:",  1LL,  &v21,  &v22,  0LL,  v4,  0LL,  v20,  10LL);
        if (!v5)
        {
          int v15 = (void *)objc_claimAutoreleasedReturnValue( -[PDController registerFormatterHexDumpWithBuffer:andLength:]( self,  "registerFormatterHexDumpWithBuffer:andLength:",  v4,  64LL));
          [v13 addObjectsFromArray:v15];

          int v5 = 0;
        }
      }
    }

    while (v8 != v14);
  }

  char v22 = 0;
  if (v5
    || (LODWORD(v20) = 4194307,
        (int v5 = -[PDControllerType2 executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:]( self,  "executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDa taLength:returnDataBufferLength:timeoutInSeconds:",  1LL,  &v21,  &v22,  0LL,  v4,  0LL,  v20,  10LL)) != 0))
  {
    if (v4) {
LABEL_18:
    }
      free(v4);
  }

  else
  {
    if ([v13 count])
    {
      unint64_t v17 = 0LL;
      do
      {
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v13 objectAtIndexedSubscript:v17++]);
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"DBSl[%03X]",  v17));
        -[PDController printRegisterTitle:andDescription:](self, "printRegisterTitle:andDescription:", v19, v18);
      }

      while ((unint64_t)[v13 count] > v17);
    }

    int v5 = 0;
    if (v4) {
      goto LABEL_18;
    }
  }

  return v5;
}

- (NSDictionary)registerConfigs
{
  return *(NSDictionary **)(&self->num_dbsl_blocks + 1);
}

- (void)setRegisterConfigs:(id)a3
{
}

- (void).cxx_destruct
{
}

@end