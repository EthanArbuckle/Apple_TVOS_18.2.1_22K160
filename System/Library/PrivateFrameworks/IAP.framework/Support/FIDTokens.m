@interface FIDTokens
- (BOOL)isValid;
- (FIDTokens)initWithData:(id)a3;
- (NSData)buffer;
- (NSMutableDictionary)tokens;
- (id)responsePayload;
- (unsigned)numFIDTokenValues;
- (void)parse;
- (void)setBuffer:(id)a3;
- (void)setIsValid:(BOOL)a3;
- (void)setTokens:(id)a3;
@end

@implementation FIDTokens

- (FIDTokens)initWithData:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___FIDTokens;
  v6 = -[FIDTokens init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    v6->_isValid = 0;
    objc_storeStrong((id *)&v6->_buffer, a3);
    v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    tokens = v7->_tokens;
    v7->_tokens = v8;

    -[FIDTokens parse](v7, "parse");
  }

  return v7;
}

- (void)parse
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FIDTokens buffer](self, "buffer"));
  id v4 = [v3 length];

  if ((unint64_t)v4 >= 2)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[FIDTokens buffer](self, "buffer"));
    id v6 = [v5 length];
    size_t v7 = 506LL;

    if ((unint64_t)v6 < 0x1FA)
    {
      id v8 = objc_claimAutoreleasedReturnValue(-[FIDTokens buffer](self, "buffer"));
      v90 = (unsigned __int8 *)[v8 bytes];

      unsigned int v9 = -[FIDTokens numFIDTokenValues](self, "numFIDTokenValues");
      if (!v9)
      {
LABEL_40:
        -[FIDTokens setIsValid:](self, "setIsValid:", 1LL);
        return;
      }

      uint64_t v10 = v9;
      LODWORD(v11) = 1;
      uint64_t v86 = 506LL;
      while (1)
      {
        uint64_t v88 = v10;
        v89 = &v84;
        uint64_t v12 = ((_DWORD)v7 + 15) & 0x1FFF0;
        v13 = (char *)&v84 - v12;
        if ((_DWORD)v7) {
          memset((char *)&v84 - v12, 170, v7);
        }
        v87 = v13;
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[FIDTokens buffer](self, "buffer"));
        id v15 = [v14 length];

        uint64_t v16 = v90[(unsigned __int16)v11];
        int v17 = v90[(unsigned __int16)(v11 + 1)];
        int v18 = v90[(unsigned __int16)(v11 + 2)];
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[FIDTokens buffer](self, "buffer"));
        id v20 = [v19 length];
        uint64_t v21 = v16 + (unsigned __int16)(v11 + 3);

        if (v17) {
          goto LABEL_40;
        }
        int v22 = v11;
        int v23 = (unsigned __int16)(v11 + 3);
        switch(v18)
        {
          case 0:
            size_t v24 = v90[(unsigned __int16)(v11 + 3)];
            int v25 = v11 + 4;
            v26 = (void *)objc_claimAutoreleasedReturnValue(-[FIDTokens buffer](self, "buffer"));
            id v27 = [v26 length];

            v28 = v87;
            memcpy(v87, &v90[(unsigned __int16)(v11 + 4)], v24);
            v29 = (void *)objc_claimAutoreleasedReturnValue(-[FIDTokens tokens](self, "tokens"));
            v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v28, v24));
            v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s",  "accessoryLingoes"));
            [v29 setObject:v30 forKey:v31];

            int v32 = v25 + v24;
            unint64_t v11 = (unint64_t)v90;
            _DWORD *v28 = *(_DWORD *)&v90[(unsigned __int16)v32];
            v33 = (void *)objc_claimAutoreleasedReturnValue(-[FIDTokens tokens](self, "tokens"));
            v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v28, 4LL));
            v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s",  "deviceOptions"));
            [v33 setObject:v34 forKey:v35];

            _DWORD *v28 = *(_DWORD *)(v11 + (unsigned __int16)(v32 + 4));
            v36 = (void *)objc_claimAutoreleasedReturnValue(-[FIDTokens tokens](self, "tokens"));
            v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v28, 4LL));
            v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s",  "deviceID"));
            [v36 setObject:v37 forKey:v38];

            LODWORD(v11) = v32 + 8;
            goto LABEL_28;
          case 1:
            v39 = (void *)objc_claimAutoreleasedReturnValue(-[FIDTokens buffer](self, "buffer"));
            id v40 = [v39 length];
            unint64_t v11 = (v23 + 8);

            v41 = v87;
            void *v87 = *(void *)&v90[v23];
            v42 = (void *)objc_claimAutoreleasedReturnValue(-[FIDTokens tokens](self, "tokens"));
            v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s",  "accessoryCaps"));
            v44 = (NSMutableArray *)objc_claimAutoreleasedReturnValue([v42 objectForKey:v43]);

            if (!v44) {
              v44 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
            }
            v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v41, 8LL));
            -[NSMutableArray addObject:](v44, "addObject:", v45);

            v46 = (void *)objc_claimAutoreleasedReturnValue(-[FIDTokens tokens](self, "tokens"));
            v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s",  "accessoryCaps"));
            [v46 setObject:v44 forKey:v47];

            goto LABEL_28;
          case 2:
            v48 = (void *)objc_claimAutoreleasedReturnValue(-[FIDTokens buffer](self, "buffer"));
            id v49 = [v48 length];

            int v50 = v11 + 4;
            int v51 = v90[(unsigned __int16)(v11 + 3)];
            uint64_t v52 = v16 - 3;
            v53 = v87;
            memcpy(v87, &v90[(unsigned __int16)(v11 + 4)], v16 - 3);
            id v85 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v53));
            v54 = (void *)objc_claimAutoreleasedReturnValue(-[FIDTokens tokens](self, "tokens"));
            v55 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s",  "accessoryInfo"));
            v56 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([v54 objectForKey:v55]);

            if (!v56)
            {
              v56 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
              v57 = (void *)objc_claimAutoreleasedReturnValue(-[FIDTokens tokens](self, "tokens"));
              v58 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s",  "accessoryInfo"));
              [v57 setObject:v56 forKey:v58];
            }

            int v59 = v51 - 1;
            size_t v7 = v86;
            switch(v59)
            {
              case 0:
                v60 = "accessoryInfoName";
                goto LABEL_34;
              case 3:
                v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v53, v52));
                v82 = "accessoryInfoFirmwareVersion";
                goto LABEL_36;
              case 4:
                v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v53, v52));
                v82 = "accessoryInfoHardwareVersion";
                goto LABEL_36;
              case 5:
                v60 = "accessoryInfoManufacturer";
                goto LABEL_34;
              case 6:
                v60 = "accessoryInfoModelNumber";
                goto LABEL_34;
              case 8:
                v60 = "accessoryInfoMaximumIncomingPayloadSize";
LABEL_34:
                v81 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s",  v60));
                -[NSMutableDictionary setObject:forKey:](v56, "setObject:forKey:", v85, v81);
                goto LABEL_37;
              case 10:
                v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v53, v52));
                v82 = "accessoryInfoTypes";
LABEL_36:
                v83 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s",  v82));
                -[NSMutableDictionary setObject:forKey:](v56, "setObject:forKey:", v81, v83);

LABEL_37:
                break;
              default:
                break;
            }

            LODWORD(v11) = v50 + v52;

            goto LABEL_39;
          case 3:
            v61 = (void *)objc_claimAutoreleasedReturnValue(-[FIDTokens buffer](self, "buffer"));
            id v62 = [v61 length];

            int v63 = v90[(unsigned __int16)(v11 + 3)];
            uint64_t v64 = v90[(unsigned __int16)(v11 + 4)];
            int v65 = v90[(unsigned __int16)(v22 + 5)];
            v66 = (void *)objc_claimAutoreleasedReturnValue(-[FIDTokens tokens](self, "tokens"));
            v67 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s",  "iPodPreferences"));
            v68 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([v66 objectForKey:v67]);

            if (!v68)
            {
              v68 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
              v69 = (void *)objc_claimAutoreleasedReturnValue(-[FIDTokens tokens](self, "tokens"));
              v70 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s",  "iPodPreferences"));
              [v69 setObject:v68 forKey:v70];
            }

            v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%u", v64));
            v72 = v71;
            if (v63 != 14)
            {

              return;
            }

            int v73 = v22 + 6;
            v74 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s",  "iPodPreferenceClassUltraHighPower"));
            BOOL v75 = v65 != 0;
            v76 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
            v77 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s",  "iPodPreferenceClass"));
            -[NSMutableDictionary setObject:forKey:](v76, "setObject:forKey:", v74, v77);

            v78 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s",  "iPodPreferenceClassSetting"));
            -[NSMutableDictionary setObject:forKey:](v76, "setObject:forKey:", v72, v78);

            v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v75));
            unint64_t v11 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s",  "iPodPreferenceClassRestoreOnExit"));
            -[NSMutableDictionary setObject:forKey:](v76, "setObject:forKey:", v79, v11);

            LODWORD(v11) = v73;
            v80 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s",  "iPodPreference"));
            -[NSMutableDictionary setObject:forKey:](v68, "setObject:forKey:", v76, v80);

LABEL_28:
            size_t v7 = v86;
LABEL_39:
            uint64_t v10 = v88 - 1;
            if (v88 == 1) {
              goto LABEL_40;
            }
            break;
          default:
            goto LABEL_40;
        }
      }
    }
  }

- (id)responsePayload
{
  if (!-[FIDTokens isValid](self, "isValid")) {
    return 0LL;
  }
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
  unsigned __int8 v35 = -[FIDTokens numFIDTokenValues](self, "numFIDTokenValues");
  -[NSMutableData appendBytes:length:](v3, "appendBytes:length:", &v35, 1LL);
  -[NSMutableData appendBytes:length:](v3, "appendBytes:length:", "\x03", 1LL);
  -[NSMutableData appendBytes:length:](v3, "appendBytes:length:", &unk_1000162A6, 1LL);
  -[NSMutableData appendBytes:length:](v3, "appendBytes:length:", &unk_1000162A6, 1LL);
  -[NSMutableData appendBytes:length:](v3, "appendBytes:length:", &unk_1000162A6, 1LL);
  -[NSMutableData appendBytes:length:](v3, "appendBytes:length:", "\x03", 1LL);
  -[NSMutableData appendBytes:length:](v3, "appendBytes:length:", &unk_1000162A6, 1LL);
  -[NSMutableData appendBytes:length:](v3, "appendBytes:length:", "\x01", 1LL);
  -[NSMutableData appendBytes:length:](v3, "appendBytes:length:", &unk_1000162A6, 1LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[FIDTokens tokens](self, "tokens"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s",  "accessoryInfo"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:v5]);

  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v32;
    id obj = v7;
    while (2)
    {
      unint64_t v11 = 0LL;
      do
      {
        if (*(void *)v32 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)v11);
        -[NSMutableData appendBytes:length:](v3, "appendBytes:length:", "\x04", 1LL);
        -[NSMutableData appendBytes:length:](v3, "appendBytes:length:", &unk_1000162A6, 1LL);
        -[NSMutableData appendBytes:length:](v3, "appendBytes:length:", "\x02", 1LL);
        -[NSMutableData appendBytes:length:](v3, "appendBytes:length:", &unk_1000162A6, 1LL);
        v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s",  "accessoryInfoFirmwareVersion"));
        unsigned __int8 v14 = [v12 isEqualToString:v13];

        id v15 = &unk_100016110;
        if ((v14 & 1) == 0)
        {
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s",  "accessoryInfoHardwareVersion"));
          unsigned __int8 v17 = [v12 isEqualToString:v16];

          id v15 = &unk_100016111;
          if ((v17 & 1) == 0)
          {
            int v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s",  "accessoryInfoManufacturer"));
            unsigned __int8 v19 = [v12 isEqualToString:v18];

            id v15 = &unk_100016112;
            if ((v19 & 1) == 0)
            {
              id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s",  "accessoryInfoMaximumIncomingPayloadSize"));
              unsigned __int8 v21 = [v12 isEqualToString:v20];

              id v15 = &unk_100016114;
              if ((v21 & 1) == 0)
              {
                int v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s",  "accessoryInfoModelNumber"));
                unsigned __int8 v23 = [v12 isEqualToString:v22];

                id v15 = &unk_100016113;
                if ((v23 & 1) == 0)
                {
                  size_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s",  "accessoryInfoName"));
                  unsigned __int8 v25 = [v12 isEqualToString:v24];

                  id v15 = &unk_10001610F;
                  if ((v25 & 1) == 0)
                  {
                    v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s",  "accessoryInfoTypes"));
                    unsigned int v27 = [v12 isEqualToString:v26];

                    id v15 = &unk_100016115;
                    if (!v27)
                    {
                      id v7 = obj;

                      goto LABEL_19;
                    }
                  }
                }
              }
            }
          }
        }

        -[NSMutableData appendBytes:length:](v3, "appendBytes:length:", v15, 1LL);
        unint64_t v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v7 = obj;
      id v9 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  -[NSMutableData appendBytes:length:](v3, "appendBytes:length:", "\x04", 1LL);
  -[NSMutableData appendBytes:length:](v3, "appendBytes:length:", &unk_1000162A6, 1LL);
  -[NSMutableData appendBytes:length:](v3, "appendBytes:length:", "\x03", 1LL);
  -[NSMutableData appendBytes:length:](v3, "appendBytes:length:", &unk_1000162A6, 1LL);
  -[NSMutableData appendBytes:length:](v3, "appendBytes:length:", &unk_100016116, 1LL);
LABEL_19:
  v29 = v3;

  return v29;
}

- (unsigned)numFIDTokenValues
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FIDTokens buffer](self, "buffer"));
  id v4 = [v3 length];

  id v6 = objc_claimAutoreleasedReturnValue(-[FIDTokens buffer](self, "buffer"));
  unsigned __int8 v5 = *(_BYTE *)[v6 bytes];

  return v5;
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (void)setIsValid:(BOOL)a3
{
  self->_isValid = a3;
}

- (NSData)buffer
{
  return (NSData *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setBuffer:(id)a3
{
}

- (NSMutableDictionary)tokens
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setTokens:(id)a3
{
}

- (void).cxx_destruct
{
}

@end