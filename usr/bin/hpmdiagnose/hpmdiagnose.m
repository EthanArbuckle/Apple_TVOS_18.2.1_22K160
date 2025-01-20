id sub_100001C44(int a1, char *const *a2, void *a3)
{
  id v5;
  int v6;
  int v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  id v15;
  unsigned int v16;
  void *v17;
  unsigned int v18;
  unsigned int v19;
  id v20;
  id v21;
  const char *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  void *m;
  void *v29;
  void *v30;
  unsigned int v31;
  unsigned int v32;
  unsigned int v33;
  unsigned int v34;
  id v35;
  id v36;
  const char *v37;
  id v38;
  id v39;
  id v40;
  uint64_t v41;
  void *n;
  void *v43;
  void *v44;
  unsigned int v45;
  unsigned int v46;
  unsigned int v47;
  void *v48;
  uint64_t v49;
  int *v50;
  int v51;
  id v52;
  id v53;
  id v54;
  uint64_t v55;
  void *j;
  void *v57;
  id v58;
  id v59;
  uint64_t v60;
  void *k;
  void *v62;
  id v63;
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _BYTE v86[128];
  _BYTE v87[128];
  int v88[16];
  _BYTE v89[128];
  _BYTE v90[128];
  _BYTE v91[128];
  v5 = a3;
  v6 = 0;
  while (2)
  {
    v88[0] = 0;
    v7 = getopt_long(a1, a2, "VUPS", (const option *)&off_100021750, v88);
    switch(v7)
    {
      case 'P':
        v6 = 3;
        continue;
      case 'Q':
      case 'R':
      case 'T':
        goto LABEL_74;
      case 'S':
        v6 = 4;
        continue;
      case 'U':
        v6 = 2;
        continue;
      case 'V':
        v6 = 1;
        continue;
      default:
        if (!v7) {
          continue;
        }
        if (v7 != -1) {
LABEL_74:
        }
          exit(1);
        switch(v6)
        {
          case 1:
            v84 = 0u;
            v85 = 0u;
            v82 = 0u;
            v83 = 0u;
            v65 = v5;
            v8 = v5;
            v9 = [v8 countByEnumeratingWithState:&v82 objects:v91 count:16];
            if (v9)
            {
              v10 = v9;
              v11 = *(void *)v83;
              do
              {
                for (i = 0LL; i != v10; i = (char *)i + 1)
                {
                  if (*(void *)v83 != v11) {
                    objc_enumerationMutation(v8);
                  }
                  v13 = *(void **)(*((void *)&v82 + 1) + 8LL * (void)i);
                  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 userClient]);
                  v15 = [v14 routeString];

                  if (!v15)
                  {
                    v16 = [v13 address];
                    v17 = (void *)objc_claimAutoreleasedReturnValue([v13 userClient]);
                    v18 = [v17 routerID];
                    v19 = [v13 address];
                    v20 = objc_claimAutoreleasedReturnValue([v13 readFullVersionWithConfig]);
                    v21 = [v20 UTF8String];
                    v22 = "R/D %d/0x%x = %s\n";
                    if (v16 < 0xA) {
                      v22 = "R/D %d/%d = %s\n";
                    }
                    printf(v22, v18, v19, v21);
                  }
                }

                v10 = [v8 countByEnumeratingWithState:&v82 objects:v91 count:16];
              }

              while (v10);
            }

            goto LABEL_52;
          case 2:
            v80 = 0u;
            v81 = 0u;
            v78 = 0u;
            v79 = 0u;
            v65 = v5;
            v24 = v5;
            v25 = [v24 countByEnumeratingWithState:&v78 objects:v90 count:16];
            if (!v25) {
              goto LABEL_37;
            }
            v26 = v25;
            v27 = *(void *)v79;
            break;
          case 3:
            v72 = 0u;
            v73 = 0u;
            v70 = 0u;
            v71 = 0u;
            v52 = v5;
            v53 = [v52 countByEnumeratingWithState:&v70 objects:v87 count:16];
            if (!v53) {
              goto LABEL_71;
            }
            v54 = v53;
            v55 = *(void *)v71;
            do
            {
              for (j = 0LL; j != v54; j = (char *)j + 1)
              {
                if (*(void *)v71 != v55) {
                  objc_enumerationMutation(v52);
                }
                v57 = *(void **)(*((void *)&v70 + 1) + 8LL * (void)j);
                putchar(10);
                v23 = [v57 printAll];
                if (!(_DWORD)v23) {
                  v23 = [v57 printStateHistory];
                }
              }

              v54 = [v52 countByEnumeratingWithState:&v70 objects:v87 count:16];
            }

            while (v54);
            goto LABEL_72;
          case 4:
            v68 = 0u;
            v69 = 0u;
            v66 = 0u;
            v67 = 0u;
            v52 = v5;
            v58 = [v52 countByEnumeratingWithState:&v66 objects:v86 count:16];
            if (v58)
            {
              v59 = v58;
              v60 = *(void *)v67;
              do
              {
                for (k = 0LL; k != v59; k = (char *)k + 1)
                {
                  if (*(void *)v67 != v60) {
                    objc_enumerationMutation(v52);
                  }
                  v62 = *(void **)(*((void *)&v66 + 1) + 8LL * (void)k);
                  putchar(10);
                  v63 = [v62 printAll];
                }

                v23 = v63;
                v59 = [v52 countByEnumeratingWithState:&v66 objects:v86 count:16];
              }

              while (v59);
            }

            else
            {
LABEL_71:
              v23 = 0LL;
            }

LABEL_72:
            goto LABEL_73;
          default:
            v23 = 0LL;
            goto LABEL_73;
        }

        break;
    }

    break;
  }

  do
  {
    for (m = 0LL; m != v26; m = (char *)m + 1)
    {
      if (*(void *)v79 != v27) {
        objc_enumerationMutation(v24);
      }
      v29 = *(void **)(*((void *)&v78 + 1) + 8LL * (void)m);
      v30 = (void *)objc_claimAutoreleasedReturnValue([v29 userClient]);
      if (![v30 routeString])
      {
        v31 = [v29 isSPIMaster];

        if (!v31) {
          continue;
        }
        v32 = [v29 address];
        v30 = (void *)objc_claimAutoreleasedReturnValue([v29 userClient]);
        v33 = [v30 routerID];
        v34 = [v29 address];
        v35 = objc_claimAutoreleasedReturnValue([v29 readFullVersionWithConfig]);
        v36 = [v35 UTF8String];
        v37 = "R/D %d/0x%x = %s\n";
        if (v32 < 0xA) {
          v37 = "R/D %d/%d = %s\n";
        }
        printf(v37, v33, v34, v36);
      }
    }

    v26 = [v24 countByEnumeratingWithState:&v78 objects:v90 count:16];
  }

  while (v26);
LABEL_37:

  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  v38 = v24;
  v39 = [v38 countByEnumeratingWithState:&v74 objects:v89 count:16];
  if (v39)
  {
    v40 = v39;
    v41 = *(void *)v75;
    do
    {
      for (n = 0LL; n != v40; n = (char *)n + 1)
      {
        if (*(void *)v75 != v41) {
          objc_enumerationMutation(v38);
        }
        v43 = *(void **)(*((void *)&v74 + 1) + 8LL * (void)n);
        v44 = (void *)objc_claimAutoreleasedReturnValue([v43 userClient]);
        if ([v44 routeString])
        {
        }

        else
        {
          v45 = [v43 isSPIMaster];

          if (v45)
          {
            v46 = [v43 readUUIDIntoBuffer:v88 ofLength:64];
            if (v46)
            {
              v47 = v46;
              v48 = (void *)objc_claimAutoreleasedReturnValue([v43 userClient]);
              printf("UUID%d=", [v48 routerID]);

              v49 = v47;
              v50 = v88;
              do
              {
                v51 = *(unsigned __int8 *)v50;
                v50 = (int *)((char *)v50 + 1);
                printf("%02x", v51);
                --v49;
              }

              while (v49);
              putchar(32);
            }
          }
        }
      }

      v40 = [v38 countByEnumeratingWithState:&v74 objects:v89 count:16];
    }

    while (v40);
  }

  putchar(10);
LABEL_52:
  v23 = 0LL;
  v5 = v65;
LABEL_73:

  return v23;
}

uint64_t start(int a1, char *const *a2)
{
  v4 = objc_autoreleasePoolPush();
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[PDController knownPDControllers:](&OBJC_CLASS___PDController, "knownPDControllers:", -1LL));
  if ([v5 count])
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:0]);
    [v6 address];
  }

  if (a1 < 2)
  {
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    id v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        v11 = 0LL;
        do
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)v11);
          putchar(10);
          [v12 printAll];
          v11 = (char *)v11 + 1;
        }

        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }

      while (v9);
    }
  }

  else
  {
    sub_100001C44(a1, a2, v5);
  }

  objc_autoreleasePoolPop(v4);
  return 0LL;
}
}

id sub_100005C50(uint64_t a1, unsigned __int16 *a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained decodeGeneralPolicyConfigWithData:*a2]);

  return v4;
}

NSString *__cdecl sub_100005C90(id a1, NSArray *a2)
{
  v2 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](v2, "objectAtIndexedSubscript:", 0LL));
  unsigned int v4 = [v3 unsignedShortValue];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](v2, "objectAtIndexedSubscript:", 1LL));
  LODWORD(v2) = [v5 unsignedCharValue];

  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%0.3f %@",  (float)((float)((float)v4 * (float)v2) * 1500.0) / 1000.0 / 4095.0,  @"V");
}

LABEL_6:
  v13 = objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"DPM1"]);
  if (!v13) {
    goto LABEL_11;
  }
  __int128 v14 = (void *)v13;
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"DPM1"]);
  __int128 v16 = objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"mask"]);
  if (v16)
  {
    __int128 v17 = (void *)v16;
    v18 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"DPM1"]);
    v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:@"match"]);

    if (!v19) {
      goto LABEL_11;
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"DPM1"]);
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v20));

    [v14 setObject:&off_10001AE98 forKeyedSubscript:@"mask"];
    [v14 setObject:&off_10001AC28 forKeyedSubscript:@"match"];
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithDictionary:",  v14));
    [v4 setObject:v15 forKeyedSubscript:@"DPM1"];
  }

LABEL_11:
  v21 = objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"DPM2"]);
  if (!v21) {
    goto LABEL_16;
  }
  v22 = (void *)v21;
  v23 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"DPM2"]);
  v24 = objc_claimAutoreleasedReturnValue([v23 objectForKeyedSubscript:@"mask"]);
  if (v24)
  {
    v25 = (void *)v24;
    v26 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"DPM2"]);
    v27 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:@"match"]);

    if (!v27) {
      goto LABEL_16;
    }
    v28 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"DPM2"]);
    v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v28));

    [v22 setObject:&off_10001AE98 forKeyedSubscript:@"mask"];
    [v22 setObject:&off_10001AC58 forKeyedSubscript:@"match"];
    v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithDictionary:",  v22));
    [v4 setObject:v23 forKeyedSubscript:@"DPM2"];
  }

LABEL_16:
  v29 = objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"eUSBA"]);
  if (!v29) {
    goto LABEL_21;
  }
  v30 = (void *)v29;
  v31 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"eUSBA"]);
  v32 = objc_claimAutoreleasedReturnValue([v31 objectForKeyedSubscript:@"mask"]);
  if (v32)
  {
    v33 = (void *)v32;
    v34 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"eUSBA"]);
    v35 = (void *)objc_claimAutoreleasedReturnValue([v34 objectForKeyedSubscript:@"match"]);

    if (!v35) {
      goto LABEL_21;
    }
    v36 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"eUSBA"]);
    v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v36));

    [v30 setObject:&off_10001AF40 forKeyedSubscript:@"mask"];
    [v30 setObject:&off_10001AF40 forKeyedSubscript:@"match"];
    v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithDictionary:",  v30));
    [v4 setObject:v31 forKeyedSubscript:@"eUSBA"];
  }

LABEL_21:
  v37 = objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"USB4B"]);
  if (v37)
  {
    v38 = (void *)v37;
    v39 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"USB4B"]);
    v40 = objc_claimAutoreleasedReturnValue([v39 objectForKeyedSubscript:@"mask"]);
    if (!v40)
    {
LABEL_25:

      goto LABEL_26;
    }

    v41 = (void *)v40;
    v42 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"USB4B"]);
    v43 = (void *)objc_claimAutoreleasedReturnValue([v42 objectForKeyedSubscript:@"match"]);

    if (v43)
    {
      v44 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"USB4B"]);
      v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v44));

      [v38 setObject:&off_10001AE98 forKeyedSubscript:@"mask"];
      [v38 setObject:&off_10001AE80 forKeyedSubscript:@"match"];
      v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithDictionary:",  v38));
      [v4 setObject:v39 forKeyedSubscript:@"USB4B"];
      goto LABEL_25;
    }
  }

LABEL_26:
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](&OBJC_CLASS___NSDictionary, "dictionaryWithDictionary:", v4));
  -[PDControllerType4 setDpmrConfigs:](self, "setDpmrConfigs:", v45);
}

LABEL_10:
  return v11;
}

LABEL_19:
    objc_autoreleasePoolPop(v9);
    free(v6);
    if (v8) {
      free(v8);
    }
  }

  else
  {
    id v7 = -536870211;
    objc_autoreleasePoolPop(objc_autoreleasePoolPush());
  }

  return v7;
}

LABEL_3:
  if (v6 | v5) {
    unsigned int v4 = result == 0;
  }
  else {
    unsigned int v4 = 0;
  }
  if (v4)
  {
    putchar(10);
    return -[PDControllerType1 printROMInfo](self, "printROMInfo");
  }

  return result;
}

LABEL_34:
  v21 = v13;
LABEL_35:
  if (!v15) {
    return v13;
  }
  if (v21) {
    return v21;
  }
  v27 = 95158276;
  v22 = -[PDControllerType3 sendVDM:ofLength:](self, "sendVDM:ofLength:", &v27, 1LL);
  if (v22) {
    return v22;
  }
  while (1)
  {
    do
    {
      v26 = 7LL;
      result = -[PDControllerType3 getVDM:ofLength:](self, "getVDM:ofLength:", &v27, &v26);
    }

    while (!result && !v26);
    if (result) {
      return result;
    }
    if (v27 >> 15 == 2904)
    {
      v24 = (v27 >> 4) & 3;
      result = 0;
      if (v24 == 1) {
        return result;
      }
      v21 = 0;
      if (v24 == 2) {
        return -536870212;
      }
      goto LABEL_35;
    }
  }

LABEL_33:
  v24 = v11;
LABEL_34:
  if (!v13) {
    return v11;
  }
  if (v24) {
    return v24;
  }
  v31 = 95158276;
  v25 = -[PDControllerType3 sendVDM:ofLength:](self, "sendVDM:ofLength:", &v31, 1LL);
  if (v25) {
    return v25;
  }
  while (1)
  {
    do
    {
      v30 = 7LL;
      result = -[PDControllerType3 getVDM:ofLength:](self, "getVDM:ofLength:", &v31, &v30);
    }

    while (!result && !v30);
    if (result) {
      return result;
    }
    if (v31 >> 15 == 2904)
    {
      v27 = (v31 >> 4) & 3;
      result = 0;
      if (v27 == 1) {
        return result;
      }
      v24 = 0;
      if (v27 == 2) {
        return -536870212;
      }
      goto LABEL_34;
    }
  }

LABEL_12:
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
  v11 = v10;
  if (!v6) {
    [v10 appendFormat:@"%X.%X.%X.%d", v7 >> 20, (v7 >> 8) & 0xFFF, v7, v9];
  }
  return v11;
}

id objc_msgSend_IECSAtomicCommand_cmdBuffer_dataBuffer_extDataBuffer_returnDataBuffer_returnExtDataBuffer_inputDataLength_returnDataBufferLength_timeoutInSeconds_forDevice_flags_( void *a1, const char *a2, ...)
{
  return [a1 IECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:ret urnDataBufferLength:timeoutInSeconds:forDevice:flags:];
}

id objc_msgSend_dpmrSubCommandFormatterHexDumpWithBuffer_length_inputBuffer_andInputLength_( void *a1, const char *a2, ...)
{
  return [a1 dpmrSubCommandFormatterHexDumpWithBuffer:length:inputBuffer:andInputLength:];
}

id objc_msgSend_executeIECSAtomicCommand_cmdBuffer_dataBuffer_extDataBuffer_returnDataBuffer_returnExtDataBuffer_inputDataLength_returnDataBufferLength_timeoutInSeconds_( void *a1, const char *a2, ...)
{
  return [a1 executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLen gth:returnDataBufferLength:timeoutInSeconds:];
}

id objc_msgSend_iecsReadCommandForDevice_withAddress_buffer_length_flags_andOutReadLength_( void *a1, const char *a2, ...)
{
  return [a1 iecsReadCommandForDevice:withAddress:buffer:length:flags:andOutReadLength:];
}

id objc_msgSend_printDPMrSubCommand_withDeviceConfig_writeBuffer_writeLength_readBuffer_readLength_( void *a1, const char *a2, ...)
{
  return [a1 printDPMrSubCommand:withDeviceConfig:writeBuffer:writeLength:readBuffer:readLength:];
}

id objc_msgSend_receiveVDMAttentionForDevice_buffer_length_flags_outSOP_outSequence_outLength_( void *a1, const char *a2, ...)
{
  return [a1 receiveVDMAttentionForDevice:buffer:length:flags:outSOP:outSequence:outLength:];
}

id objc_msgSend_writeIECSRegister_ofLength_atRegister_(void *a1, const char *a2, ...)
{
  return [a1 writeIECSRegister:ofLength:atRegister:];
}