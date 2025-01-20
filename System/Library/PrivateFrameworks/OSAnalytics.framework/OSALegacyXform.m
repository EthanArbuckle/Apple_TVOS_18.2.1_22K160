@interface OSALegacyXform
+ (id)rollSchemaForward:(id)a3;
+ (id)transformURL:(id)a3 options:(id)a4;
- (BOOL)prepareTemplate:(id)a3 forLogType:(id)a4 error:(id *)a5;
- (BOOL)transformJSON:(id)a3 header:(id)a4 error:(id *)a5 streamingBlock:(id)a6;
- (BOOL)transformLines:(id)a3 withDefinitions:(id)a4 body:(id)a5 header:(id)a6 error:(id *)a7 streamingBlock:(id)a8;
- (OSALegacyXform)init;
- (id)_getValueForKey:(id)a3 fromBody:(id)a4 orHeader:(id)a5;
- (id)_hexDump:(id)a3 offset:(int)a4 indicator:(BOOL)a5;
- (id)formatArm32ThreadState:(id)a3 index:(int)a4;
- (id)formatArm64ThreadState:(id)a3 index:(int)a4;
- (id)formatCallstacks:(id)a3 withImages:(id)a4 macosStyle:(BOOL)a5;
- (id)formatFrame:(id)a3 withImages:(id)a4 macosStyle:(BOOL)a5;
- (id)formatImages:(id)a3 macosStyle:(BOOL)a4;
- (id)formatInstructionState:(id)a3 index:(int)a4;
- (id)formatLastBranchState:(id)a3 index:(int)a4 withImages:(id)a5;
- (id)formatLastException:(id)a3 withImages:(id)a4;
- (id)formatX86ThreadState:(id)a3 index:(int)a4;
@end

@implementation OSALegacyXform

- (OSALegacyXform)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___OSALegacyXform;
  v2 = -[OSALegacyXform init](&v6, sel_init);
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    templates = v2->_templates;
    v2->_templates = (NSMutableDictionary *)v3;
  }

  return v2;
}

- (BOOL)prepareTemplate:(id)a3 forLogType:(id)a4 error:(id *)a5
{
  id v7 = a4;
  [a3 componentsSeparatedByString:@"\n"];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setValue:forKey:](self->_templates, "setValue:forKey:", v8, v7);

  return 0;
}

- (id)formatFrame:(id)a3 withImages:(id)a4 macosStyle:(BOOL)a5
{
  uint64_t v50 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  [v7 objectForKeyedSubscript:@"imageIndex"];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", (int)objc_msgSend(v9, "intValue"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v11 = 0LL;
  }

  uint64_t v12 = [v11 objectForKeyedSubscript:@"name"];
  if (v12) {
    v13 = (__CFString *)v12;
  }
  else {
    v13 = @"???";
  }
  if ((unint64_t)-[__CFString length](v13, "length") < 0x1F)
  {
    uint64_t v16 = -[__CFString stringByPaddingToLength:withString:startingAtIndex:]( v13,  "stringByPaddingToLength:withString:startingAtIndex:",  30LL,  @" ",  0LL);
  }

  else
  {
    if (a5) {
      goto LABEL_12;
    }
    v14 = (void *)NSString;
    uint64_t v15 = -[__CFString substringFromIndex:](v13, "substringFromIndex:", -[__CFString length](v13, "length") - 27);
    uint64_t v16 = [v14 stringWithFormat:@"...%@", v15];

    v13 = (__CFString *)v15;
  }

  v13 = (__CFString *)v16;
LABEL_12:
  [v11 objectForKeyedSubscript:@"base"];
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v18 = [v17 unsignedLongLongValue];

  [v7 objectForKeyedSubscript:@"imageOffset"];
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v20 = [v19 unsignedLongLongValue];

  uint64_t v21 = v18 + v20;
  if ((unint64_t)[v7 count] < 3)
  {
    if (v18 && v20)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"%p + %llu", v18, v20);
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      if (!v21) {
        uint64_t v21 = v20;
      }
      v23 = @"???";
    }
  }

  else
  {
    uint64_t v46 = [v7 objectForKeyedSubscript:@"symbol"];
    [v7 objectForKeyedSubscript:@"symbolLocation"];
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v11;
    uint64_t v47 = v18 + v20;
    if (v22)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        uint64_t v20 = [v22 unsignedLongLongValue];
      }

      else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v49 = v22;
        _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "*** ignoring non-numeric symbolLocation: '%@'",  buf,  0xCu);
      }
    }

    v45 = v10;
    [v7 objectForKeyedSubscript:@"sourceFile"];
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v25 = [v7 objectForKeyedSubscript:@"sourceLine"];
    v26 = (void *)v25;
    v43 = v22;
    v27 = &stru_189E21910;
    if (v24 && v25)
    {
      [NSString stringWithFormat:@" (%@:%@)", v24, v25];
      v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

    [v7 objectForKeyedSubscript:@"inline"];
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28;
    v30 = (void *)v46;
    if (v46)
    {
      v31 = (void *)NSString;
      int v32 = [v28 BOOLValue];
      v33 = @" [inlined]";
      if (!v32) {
        v33 = &stru_189E21910;
      }
      [v31 stringWithFormat:@"%@ + %llu%@%@", v46, v20, v27, v33];
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      if (v18 && v20)
      {
        v34 = (void *)NSString;
        int v35 = [v28 BOOLValue];
        v36 = @" [inlined]";
        if (!v35) {
          v36 = &stru_189E21910;
        }
        [v34 stringWithFormat:@"%p + %llu%@%@", v47 - v20, v20, v27, v36];
        v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        uint64_t v37 = v47;
        if (!v47) {
          uint64_t v37 = v20;
        }
        uint64_t v47 = v37;
        v23 = @"???";
      }

      [v7 objectForKeyedSubscript:@"region"];
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v38;
      if (v38)
      {
        v40 = v38;

        v13 = v40;
      }

      v30 = 0LL;
    }

    v11 = v44;
    v10 = v45;
    uint64_t v21 = v47;
  }

  [NSString stringWithFormat:@"%@\t%18p %@", v13, v21, v23];
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  return v41;
}

- (id)formatCallstacks:(id)a3 withImages:(id)a4 macosStyle:(BOOL)a5
{
  BOOL v51 = a5;
  uint64_t v62 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v50 = a4;
  [MEMORY[0x189603FA8] array];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  id obj = v7;
  uint64_t v46 = [obj countByEnumeratingWithState:&v56 objects:v61 count:16];
  if (v46)
  {
    uint64_t v45 = *(void *)v57;
    LODWORD(v9) = -1;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v57 != v45) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v56 + 1) + 8 * v10);
        uint64_t v9 = (v9 + 1);
        uint64_t v12 = [v11 objectForKeyedSubscript:@"name"];
        uint64_t v13 = [v11 objectForKeyedSubscript:@"queue"];
        uint64_t v14 = v13;
        uint64_t v49 = v10;
        uint64_t v47 = (void *)v13;
        v48 = (void *)v12;
        if (v51)
        {
          uint64_t v15 = (void *)NSString;
          [v11 objectForKeyedSubscript:@"triggered"];
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = @" Crashed";
          if (!v16) {
            v17 = &stru_189E21910;
          }
          uint64_t v18 = @": ";
          if (!(v12 | v14)) {
            uint64_t v18 = &stru_189E21910;
          }
          if (v12) {
            v19 = (const __CFString *)v12;
          }
          else {
            v19 = &stru_189E21910;
          }
          uint64_t v20 = @" Dispatch queue: ";
          if (v14)
          {
            uint64_t v21 = (const __CFString *)v14;
          }

          else
          {
            uint64_t v20 = &stru_189E21910;
            uint64_t v21 = &stru_189E21910;
          }

          [v15 stringWithFormat:@"Thread %d%@:%@%@%@%@", v9, v17, v18, v19, v20, v21];
        }

        else
        {
          if (v12 | v13)
          {
            if (v12) {
              v22 = (const __CFString *)v12;
            }
            else {
              v22 = &stru_189E21910;
            }
            v23 = @" Dispatch queue: ";
            if (v13)
            {
              v24 = (const __CFString *)v13;
            }

            else
            {
              v23 = &stru_189E21910;
              v24 = &stru_189E21910;
            }

            v40 = v23;
            v41 = v24;
            [NSString stringWithFormat:@"Thread %d name:  %@%@%@", v9, v22];
            uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
            [v8 addObject:v25];
          }

          v26 = (void *)NSString;
          [v11 objectForKeyedSubscript:@"triggered"];
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = @" Crashed";
          if (!v16) {
            v27 = &stru_189E21910;
          }
          [v26 stringWithFormat:@"Thread %d%@:", v9, v27, v40, v41, v42, v43];
        }

        v28 = (void *)objc_claimAutoreleasedReturnValue();
        [v8 addObject:v28];

        [v11 objectForKeyedSubscript:@"frames"];
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        __int128 v52 = 0u;
        __int128 v53 = 0u;
        __int128 v54 = 0u;
        __int128 v55 = 0u;
        uint64_t v30 = [v29 countByEnumeratingWithState:&v52 objects:v60 count:16];
        if (v30)
        {
          uint64_t v31 = v30;
          uint64_t v32 = *(void *)v53;
          uint64_t v33 = 0xFFFFFFFFLL;
          do
          {
            for (uint64_t i = 0LL; i != v31; ++i)
            {
              if (*(void *)v53 != v32) {
                objc_enumerationMutation(v29);
              }
              int v35 = (void *)NSString;
              v36 = -[OSALegacyXform formatFrame:withImages:macosStyle:]( self,  "formatFrame:withImages:macosStyle:",  *(void *)(*((void *)&v52 + 1) + 8 * i),  v50,  v51);
              [v35 stringWithFormat:@"%-3d %@", v33 + i + 1, v36];
              uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
              [v8 addObject:v37];
            }

            uint64_t v31 = [v29 countByEnumeratingWithState:&v52 objects:v60 count:16];
            uint64_t v33 = (v33 + i);
          }

          while (v31);
        }

        [v8 addObject:&stru_189E21910];

        uint64_t v10 = v49 + 1;
      }

      while (v49 + 1 != v46);
      uint64_t v46 = [obj countByEnumeratingWithState:&v56 objects:v61 count:16];
    }

    while (v46);
  }

  [v8 componentsJoinedByString:@"\n"];
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  return v38;
}

- (id)formatImages:(id)a3 macosStyle:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v49 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  v40 = (void *)objc_opt_new();
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  id obj = v5;
  uint64_t v41 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (v41)
  {
    uint64_t v39 = *(void *)v45;
    BOOL v36 = v4;
    do
    {
      for (uint64_t i = 0LL; i != v41; ++i)
      {
        if (*(void *)v45 != v39) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        [v7 objectForKeyedSubscript:@"uuid"];
        id v8 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v9 = v8;
        if (!v4)
        {
          uint64_t v10 = [v8 stringByReplacingOccurrencesOfString:@"-" withString:&stru_189E21910];

          uint64_t v9 = (void *)v10;
        }

        [v7 objectForKeyedSubscript:@"base"];
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v12 = [v11 unsignedLongLongValue];
        [v7 objectForKeyedSubscript:@"size"];
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v14 = v12 + [v13 unsignedLongLongValue] - 1;

        [v7 objectForKeyedSubscript:@"name"];
        uint64_t v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
        uint64_t v16 = [v7 objectForKeyedSubscript:@"arch"];
        [v7 objectForKeyedSubscript:@"path"];
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
        uint64_t v18 = v17;
        uint64_t v42 = (void *)v16;
        uint64_t v43 = v11;
        if (v4)
        {
          [v7 objectForKeyedSubscript:@"CFBundleIdentifier"];
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if ([v19 length])
          {
            uint64_t v20 = v19;

            uint64_t v15 = v20;
          }

          [v7 objectForKeyedSubscript:@"CFBundleShortVersionString"];
          uint64_t v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if (!-[__CFString length](v21, "length"))
          {

            uint64_t v21 = @"*";
          }

          v22 = (void *)NSString;
          if (v15)
          {
            int v23 = 0;
            v24 = v15;
          }

          else if (v18)
          {
            -[__CFString lastPathComponent](v18, "lastPathComponent");
            int v23 = 1;
            int v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v24 = v35;
          }

          else
          {
            int v23 = 0;
            v24 = @"???";
          }

          v28 = @"???";
          if (v18) {
            v28 = v18;
          }
          [v22 stringWithFormat:@"%18p - %18p %@ (%@) <%@> %@", v12, v14, v24, v21, v9, v28];
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          [v40 addObject:v29];

          if (v23) {
          BOOL v4 = v36;
          }
LABEL_33:

          goto LABEL_34;
        }

        uint64_t v25 = (void *)NSString;
        if (v15)
        {
          int v26 = 0;
          v27 = v15;
        }

        else if (v17)
        {
          -[__CFString lastPathComponent](v17, "lastPathComponent");
          v38 = int v26 = 1;
          v27 = (const __CFString *)v38;
        }

        else
        {
          int v26 = 0;
          v27 = @"???";
        }

        uint64_t v30 = @"unknown-arch";
        if (v16) {
          uint64_t v30 = (const __CFString *)v16;
        }
        uint64_t v31 = @"???";
        if (v18) {
          uint64_t v31 = v18;
        }
        [v25 stringWithFormat:@"%18p - %18p %@ %@  <%@> %@", v12, v14, v27, v30, v9, v31];
        uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
        [v40 addObject:v32];

        v19 = (void *)v38;
        if (v26) {
          goto LABEL_33;
        }
LABEL_34:
      }

      uint64_t v41 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
    }

    while (v41);
  }

  [v40 componentsJoinedByString:@"\n"];
  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();

  return v33;
}

- (id)formatArm32ThreadState:(id)a3 index:(int)a4
{
  uint64_t v50 = *(void *)&a4;
  id v4 = a3;
  [v4 objectForKeyedSubscript:@"r"];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = (void *)NSString;
  [v5 objectAtIndexedSubscript:0];
  __int128 v59 = (void *)objc_claimAutoreleasedReturnValue();
  [v59 objectForKeyedSubscript:@"value"];
  __int128 v58 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v45 = [v58 unsignedIntValue];
  [v5 objectAtIndexedSubscript:1];
  __int128 v57 = (void *)objc_claimAutoreleasedReturnValue();
  [v57 objectForKeyedSubscript:@"value"];
  __int128 v56 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v42 = [v56 unsignedIntValue];
  [v5 objectAtIndexedSubscript:2];
  __int128 v55 = (void *)objc_claimAutoreleasedReturnValue();
  [v55 objectForKeyedSubscript:@"value"];
  __int128 v54 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v40 = [v54 unsignedIntValue];
  [v5 objectAtIndexedSubscript:3];
  __int128 v53 = (void *)objc_claimAutoreleasedReturnValue();
  [v53 objectForKeyedSubscript:@"value"];
  __int128 v52 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v38 = [v52 unsignedIntValue];
  [v5 objectAtIndexedSubscript:4];
  BOOL v51 = (void *)objc_claimAutoreleasedReturnValue();
  [v51 objectForKeyedSubscript:@"value"];
  uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v35 = [v49 unsignedIntValue];
  [v5 objectAtIndexedSubscript:5];
  __int128 v47 = (void *)objc_claimAutoreleasedReturnValue();
  [v47 objectForKeyedSubscript:@"value"];
  __int128 v46 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v32 = [v46 unsignedIntValue];
  [v5 objectAtIndexedSubscript:6];
  __int128 v44 = (void *)objc_claimAutoreleasedReturnValue();
  [v44 objectForKeyedSubscript:@"value"];
  uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v30 = [v43 unsignedIntValue];
  [v5 objectAtIndexedSubscript:7];
  uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();
  [v41 objectForKeyedSubscript:@"value"];
  uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v27 = [v39 unsignedIntValue];
  [v5 objectAtIndexedSubscript:8];
  uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
  [v37 objectForKeyedSubscript:@"value"];
  BOOL v36 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v25 = [v36 unsignedIntValue];
  [v5 objectAtIndexedSubscript:9];
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  [v34 objectForKeyedSubscript:@"value"];
  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v22 = [v33 unsignedIntValue];
  [v5 objectAtIndexedSubscript:10];
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
  [v31 objectForKeyedSubscript:@"value"];
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v19 = [v29 unsignedIntValue];
  [v5 objectAtIndexedSubscript:11];
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  [v28 objectForKeyedSubscript:@"value"];
  int v26 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = [v26 unsignedIntValue];
  [v4 objectForKeyedSubscript:@"ip"];
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  [v24 objectForKeyedSubscript:@"value"];
  int v23 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = [v23 unsignedIntValue];
  [v4 objectForKeyedSubscript:@"sp"];
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
  [v21 objectForKeyedSubscript:@"value"];
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v20 unsignedIntValue];
  [v4 objectForKeyedSubscript:@"lr"];
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v18 objectForKeyedSubscript:@"value"];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 unsignedIntValue];
  [v4 objectForKeyedSubscript:@"pc"];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 objectForKeyedSubscript:@"value"];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [v10 unsignedIntValue];
  [v4 objectForKeyedSubscript:@"cpsr"];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

  [v12 objectForKeyedSubscript:@"value"];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend( v48,  "stringWithFormat:",  @"Thread %d crashed with ARM Thread State (32-bit):\n    r0: 0x%08x    r1: 0x%08x      r2: 0x%08x      r3: 0x%08x\n    r4: 0x%08x    r5: 0x%08x      r6: 0x%08x      r7: 0x%08x\n    r8: 0x%08x    r9: 0x%08x     r10: 0x%08x     r11: 0x%08x\n    ip: 0x%08x    sp: 0x%08x      lr: 0x%08x      pc: 0x%08x\n  cpsr: 0x%08x",  v50,  v45,  v42,  v40,  v38,  v35,  v32,  v30,  v27,  v25,  v22,  v19,  v17,  v16,  v6,  v8,  v11,  objc_msgSend(v13, "unsignedIntValue"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)formatArm64ThreadState:(id)a3 index:(int)a4
{
  uint64_t v98 = *(void *)&a4;
  id v4 = a3;
  [v4 objectForKeyedSubscript:@"x"];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = (void *)NSString;
  [v5 objectAtIndexedSubscript:0];
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  [v119 objectForKeyedSubscript:@"value"];
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v93 = [v118 unsignedLongLongValue];
  [v5 objectAtIndexedSubscript:1];
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  [v117 objectForKeyedSubscript:@"value"];
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v91 = [v116 unsignedLongLongValue];
  [v5 objectAtIndexedSubscript:2];
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  [v115 objectForKeyedSubscript:@"value"];
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v88 = [v114 unsignedLongLongValue];
  [v5 objectAtIndexedSubscript:3];
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  [v113 objectForKeyedSubscript:@"value"];
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v86 = [v112 unsignedLongLongValue];
  [v5 objectAtIndexedSubscript:4];
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  [v111 objectForKeyedSubscript:@"value"];
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v83 = [v110 unsignedLongLongValue];
  [v5 objectAtIndexedSubscript:5];
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  [v109 objectForKeyedSubscript:@"value"];
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v81 = [v108 unsignedLongLongValue];
  [v5 objectAtIndexedSubscript:6];
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  [v107 objectForKeyedSubscript:@"value"];
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v79 = [v106 unsignedLongLongValue];
  [v5 objectAtIndexedSubscript:7];
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  [v105 objectForKeyedSubscript:@"value"];
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v76 = [v104 unsignedLongLongValue];
  [v5 objectAtIndexedSubscript:8];
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  [v103 objectForKeyedSubscript:@"value"];
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v73 = [v102 unsignedLongLongValue];
  [v5 objectAtIndexedSubscript:9];
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  [v101 objectForKeyedSubscript:@"value"];
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v71 = [v100 unsignedLongLongValue];
  [v5 objectAtIndexedSubscript:10];
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  [v99 objectForKeyedSubscript:@"value"];
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v69 = [v97 unsignedLongLongValue];
  [v5 objectAtIndexedSubscript:11];
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  [v95 objectForKeyedSubscript:@"value"];
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v66 = [v94 unsignedLongLongValue];
  [v5 objectAtIndexedSubscript:12];
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  [v92 objectForKeyedSubscript:@"value"];
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v63 = [v90 unsignedLongLongValue];
  [v5 objectAtIndexedSubscript:13];
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  [v89 objectForKeyedSubscript:@"value"];
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v61 = [v87 unsignedLongLongValue];
  [v5 objectAtIndexedSubscript:14];
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  [v85 objectForKeyedSubscript:@"value"];
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v59 = [v84 unsignedLongLongValue];
  [v5 objectAtIndexedSubscript:15];
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  [v82 objectForKeyedSubscript:@"value"];
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v56 = [v80 unsignedLongLongValue];
  [v5 objectAtIndexedSubscript:16];
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  [v78 objectForKeyedSubscript:@"value"];
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v53 = [v77 unsignedLongLongValue];
  [v5 objectAtIndexedSubscript:17];
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  [v75 objectForKeyedSubscript:@"value"];
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v51 = [v74 unsignedLongLongValue];
  [v5 objectAtIndexedSubscript:18];
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  [v72 objectForKeyedSubscript:@"value"];
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v49 = [v70 unsignedLongLongValue];
  [v5 objectAtIndexedSubscript:19];
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  [v68 objectForKeyedSubscript:@"value"];
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v46 = [v67 unsignedLongLongValue];
  [v5 objectAtIndexedSubscript:20];
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  [v65 objectForKeyedSubscript:@"value"];
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v44 = [v64 unsignedLongLongValue];
  [v5 objectAtIndexedSubscript:21];
  uint64_t v62 = (void *)objc_claimAutoreleasedReturnValue();
  [v62 objectForKeyedSubscript:@"value"];
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v41 = [v60 unsignedLongLongValue];
  [v5 objectAtIndexedSubscript:22];
  __int128 v58 = (void *)objc_claimAutoreleasedReturnValue();
  [v58 objectForKeyedSubscript:@"value"];
  __int128 v57 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v39 = [v57 unsignedLongLongValue];
  [v5 objectAtIndexedSubscript:23];
  __int128 v55 = (void *)objc_claimAutoreleasedReturnValue();
  [v55 objectForKeyedSubscript:@"value"];
  __int128 v54 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v36 = [v54 unsignedLongLongValue];
  [v5 objectAtIndexedSubscript:24];
  __int128 v52 = (void *)objc_claimAutoreleasedReturnValue();
  [v52 objectForKeyedSubscript:@"value"];
  uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v34 = [v50 unsignedLongLongValue];
  [v5 objectAtIndexedSubscript:25];
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  [v48 objectForKeyedSubscript:@"value"];
  __int128 v47 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v31 = [v47 unsignedLongLongValue];
  [v5 objectAtIndexedSubscript:26];
  uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue();
  [v45 objectForKeyedSubscript:@"value"];
  uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v29 = [v43 unsignedLongLongValue];
  [v5 objectAtIndexedSubscript:27];
  uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();
  [v42 objectForKeyedSubscript:@"value"];
  uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v25 = [v40 unsignedLongLongValue];
  [v5 objectAtIndexedSubscript:28];
  uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
  [v38 objectForKeyedSubscript:@"value"];
  uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v23 = [v37 unsignedLongLongValue];
  [v4 objectForKeyedSubscript:@"fp"];
  uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
  [v35 objectForKeyedSubscript:@"value"];
  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v20 = [v33 unsignedLongLongValue];
  [v4 objectForKeyedSubscript:@"lr"];
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
  [v32 objectForKeyedSubscript:@"value"];
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v19 = [v30 unsignedLongLongValue];
  [v4 objectForKeyedSubscript:@"sp"];
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  [v28 objectForKeyedSubscript:@"value"];
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v18 = [v27 unsignedLongLongValue];
  [v4 objectForKeyedSubscript:@"pc"];
  int v26 = (void *)objc_claimAutoreleasedReturnValue();
  [v26 objectForKeyedSubscript:@"value"];
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = [v24 unsignedLongLongValue];
  [v4 objectForKeyedSubscript:@"cpsr"];
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  [v22 objectForKeyedSubscript:@"value"];
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v21 unsignedIntValue];
  [v4 objectForKeyedSubscript:@"far"];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 objectForKeyedSubscript:@"value"];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 unsignedLongLongValue];
  [v4 objectForKeyedSubscript:@"esr"];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 objectForKeyedSubscript:@"value"];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = [v11 unsignedIntValue];
  [v4 objectForKeyedSubscript:@"esr"];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  [v13 objectForKeyedSubscript:@"description"];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v96 stringWithFormat:@"Thread %d crashed with ARM Thread State (64-bit):\n    x0: 0x%016qx   x1: 0x%016qx   x2: 0x%016qx   x3: 0x%016qx\n    x4: 0x%016qx   x5: 0x%016qx   x6: 0x%016qx   x7: 0x%016qx\n    x8: 0x%016qx   x9: 0x%016qx  x10: 0x%016qx  x11: 0x%016qx\n   x12: 0x%016qx  x13: 0x%016qx  x14: 0x%016qx  x15: 0x%016qx\n   x16: 0x%016qx  x17: 0x%016qx  x18: 0x%016qx  x19: 0x%016qx\n   x20: 0x%016qx  x21: 0x%016qx  x22: 0x%016qx  x23: 0x%016qx\n   x24: 0x%016qx  x25: 0x%016qx  x26: 0x%016qx  x27: 0x%016qx\n   x28: 0x%016qx   fp: 0x%016llx   lr: 0x%016llx\n    sp: 0x%016llx   pc: 0x%016llx cpsr: 0x%08x\n   far: 0x%016llx  esr: 0x%08x %@", v98, v93, v91, v88, v86, v83, v81, v79, v76, v73, v71, v69, v66, v63, v61, v59, v56, v53, v51, v49, v46, v44, v41, v39, v36, v34, v31, v29, v25, v23, v20, v19, v18, v17, v6, v9, v12, v14];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)formatX86ThreadState:(id)a3 index:(int)a4
{
  uint64_t v80 = *(void *)&a4;
  id v4 = a3;
  [v4 objectForKeyedSubscript:@"rosetta"];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v81 = v5;
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = (void *)NSString;
    [v5 objectForKeyedSubscript:@"tmp0"];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 objectForKeyedSubscript:@"value"];
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v82 unsignedLongLongValue];
    [v6 objectForKeyedSubscript:@"tmp1"];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 objectForKeyedSubscript:@"value"];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = [v11 unsignedLongLongValue];
    [v6 objectForKeyedSubscript:@"tmp2"];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 objectForKeyedSubscript:@"value"];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend( v7,  "stringWithFormat:",  @"\n tmp0: 0x%016qx tmp1: 0x%016qx tmp2: 0x%016qx\n",  v9,  v12,  objc_msgSend(v14, "unsignedLongLongValue"));
    v84 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    [v4 objectForKeyedSubscript:@"trap"];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 objectForKeyedSubscript:@"description"];
    uint64_t v16 = (const __CFString *)objc_claimAutoreleasedReturnValue();

    v85 = (void *)NSString;
    [v4 objectForKeyedSubscript:@"cr2"];
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    [v82 objectForKeyedSubscript:@"value"];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v78 = [v10 unsignedLongLongValue];
    [v4 objectForKeyedSubscript:@"cpu"];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 objectForKeyedSubscript:@"value"];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v76 = [v13 intValue];
    [v4 objectForKeyedSubscript:@"err"];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 objectForKeyedSubscript:@"value"];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = [v17 unsignedIntValue];
    v74 = v16;
    if (!v16) {
      uint64_t v16 = &stru_189E21910;
    }
    [v4 objectForKeyedSubscript:@"trap"];
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v19 objectForKeyedSubscript:@"value"];
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v85 stringWithFormat:@"  cr2: 0x%016qx\n  \nLogical CPU:     %d\nError Code:      0x%08x %@\nTrap Number:     %d\n", v78, v76, v18, v16, objc_msgSend(v20, "intValue")];
    v84 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v8 = (void *)v74;
  }

  [v4 objectForKeyedSubscript:@"rip"];
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
  [v21 objectForKeyedSubscript:@"value"];
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v79 = v22;
  if (v22)
  {
    objc_msgSend( NSString,  "stringWithFormat:",  @"0x%016qx",  objc_msgSend(v22, "unsignedLongLongValue"));
    uint64_t v83 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v83 = @"<unavailable>     ";
  }

  v65 = (void *)NSString;
  [v4 objectForKeyedSubscript:@"rax"];
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  [v77 objectForKeyedSubscript:@"value"];
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v62 = [v75 unsignedLongLongValue];
  [v4 objectForKeyedSubscript:@"rbx"];
  uint64_t v73 = (void *)objc_claimAutoreleasedReturnValue();
  [v73 objectForKeyedSubscript:@"value"];
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v59 = [v72 unsignedLongLongValue];
  [v4 objectForKeyedSubscript:@"rcx"];
  uint64_t v71 = (void *)objc_claimAutoreleasedReturnValue();
  [v71 objectForKeyedSubscript:@"value"];
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v57 = [v70 unsignedLongLongValue];
  [v4 objectForKeyedSubscript:@"rdx"];
  uint64_t v69 = (void *)objc_claimAutoreleasedReturnValue();
  [v69 objectForKeyedSubscript:@"value"];
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v54 = [v68 unsignedLongLongValue];
  [v4 objectForKeyedSubscript:@"rdi"];
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  [v67 objectForKeyedSubscript:@"value"];
  uint64_t v66 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v52 = [v66 unsignedLongLongValue];
  [v4 objectForKeyedSubscript:@"rsi"];
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  [v64 objectForKeyedSubscript:@"value"];
  uint64_t v63 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v49 = [v63 unsignedLongLongValue];
  [v4 objectForKeyedSubscript:@"rbp"];
  uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue();
  [v61 objectForKeyedSubscript:@"value"];
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v47 = [v60 unsignedLongLongValue];
  [v4 objectForKeyedSubscript:@"rsp"];
  __int128 v58 = (void *)objc_claimAutoreleasedReturnValue();
  [v58 objectForKeyedSubscript:@"value"];
  uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v45 = [v56 unsignedLongLongValue];
  [v4 objectForKeyedSubscript:@"r8"];
  __int128 v55 = (void *)objc_claimAutoreleasedReturnValue();
  [v55 objectForKeyedSubscript:@"value"];
  uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v42 = [v53 unsignedLongLongValue];
  [v4 objectForKeyedSubscript:@"r9"];
  uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
  [v51 objectForKeyedSubscript:@"value"];
  uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v39 = [v50 unsignedLongLongValue];
  [v4 objectForKeyedSubscript:@"r10"];
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  [v48 objectForKeyedSubscript:@"value"];
  uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v37 = [v46 unsignedLongLongValue];
  [v4 objectForKeyedSubscript:@"r11"];
  uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue();
  [v44 objectForKeyedSubscript:@"value"];
  uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v35 = [v43 unsignedLongLongValue];
  [v4 objectForKeyedSubscript:@"r12"];
  uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();
  [v41 objectForKeyedSubscript:@"value"];
  uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v34 = [v40 unsignedLongLongValue];
  [v4 objectForKeyedSubscript:@"r13"];
  uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
  [v38 objectForKeyedSubscript:@"value"];
  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v23 = [v36 unsignedLongLongValue];
  [v4 objectForKeyedSubscript:@"r14"];
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  [v24 objectForKeyedSubscript:@"value"];
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v26 = [v25 unsignedLongLongValue];
  [v4 objectForKeyedSubscript:@"r15"];
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
  [v27 objectForKeyedSubscript:@"value"];
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v29 = [v28 unsignedLongLongValue];
  [v4 objectForKeyedSubscript:@"rflags"];
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
  [v30 objectForKeyedSubscript:@"value"];
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
  [v65 stringWithFormat:@"Thread %d crashed with X86 Thread State (64-bit):\n  rax: 0x%016qx  rbx: 0x%016qx  rcx: 0x%016qx  rdx: 0x%016qx\n  rdi: 0x%016qx  rsi: 0x%016qx  rbp: 0x%016qx  rsp: 0x%016qx\n   r8: 0x%016qx   r9: 0x%016qx  r10: 0x%016qx  r11: 0x%016qx\n  r12: 0x%016qx  r13: 0x%016qx  r14: 0x%016qx  r15: 0x%016qx\n  rip: %@  rfl: 0x%016qx%@", v80, v62, v59, v57, v54, v52, v49, v47, v45, v42, v39, v37, v35, v34, v23, v26, v29, v83, objc_msgSend(v31, "unsignedLongLongValue"), v84];
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
}

- (id)formatLastException:(id)a3 withImages:(id)a4
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_opt_new();
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id obj = v6;
  uint64_t v9 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    uint64_t v12 = 0xFFFFFFFFLL;
    do
    {
      uint64_t v13 = 0LL;
      do
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = (void *)NSString;
        -[OSALegacyXform formatFrame:withImages:macosStyle:]( self,  "formatFrame:withImages:macosStyle:",  *(void *)(*((void *)&v20 + 1) + 8 * v13),  v7,  0LL);
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
        [v14 stringWithFormat:@"%-3d %@", v12 + v13 + 1, v15];
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
        [v8 addObject:v16];

        ++v13;
      }

      while (v10 != v13);
      uint64_t v10 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
      uint64_t v12 = (v12 + v13);
    }

    while (v10);
  }

  [v8 componentsJoinedByString:@"\n"];
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)formatLastBranchState:(id)a3 index:(int)a4 withImages:(id)a5
{
  uint64_t v7 = *(void *)&a4;
  id v8 = a3;
  id v29 = a5;
  uint64_t v9 = (void *)objc_opt_new();
  unint64_t v10 = 0x189607000uLL;
  objc_msgSend(NSString, "stringWithFormat:", @"Thread %d last branch register state:", v7);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v9;
  [v9 addObject:v11];

  if ([v8 count])
  {
    unint64_t v12 = 0LL;
    uint64_t v26 = v8;
    do
    {
      [v8 objectAtIndexedSubscript:v12];
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 objectAtIndexedSubscript:2];
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v31 = *(void **)(v10 + 2600);
      uint64_t v15 = [v13 objectAtIndexedSubscript:0];
      -[OSALegacyXform formatFrame:withImages:macosStyle:](self, "formatFrame:withImages:macosStyle:");
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 objectAtIndexedSubscript:1];
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[OSALegacyXform formatFrame:withImages:macosStyle:](self, "formatFrame:withImages:macosStyle:", v17, v29, 1LL);
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v19 = [v14 count];
      if (v19)
      {
        __int128 v20 = *(void **)(v10 + 2600);
        objc_msgSend(v14, "componentsJoinedByString:", @", ");
        uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
        [v20 stringWithFormat:@"(%@)", v30];
        id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
        __int128 v21 = v5;
      }

      else
      {
        __int128 v21 = &stru_189E21910;
      }

      __int128 v22 = (void *)v15;
      [v31 stringWithFormat:@"  [%02d] (%@) -> (%@)\t%@", v12, v16, v18, v21];
      __int128 v23 = (void *)objc_claimAutoreleasedReturnValue();
      [v28 addObject:v23];

      if (v19)
      {
      }

      ++v12;
      id v8 = v26;
      unint64_t v10 = 0x189607000LL;
    }

    while ([v26 count] > v12);
  }

  [v28 componentsJoinedByString:@"\n"];
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (id)_hexDump:(id)a3 offset:(int)a4 indicator:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = (void *)objc_opt_new();
  __int128 v23 = 0u;
  memset(v24, 0, 28);
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  *(_DWORD *)__str = 0;
  if ([v7 count])
  {
    unint64_t v9 = 0LL;
    do
    {
      [v7 objectAtIndexedSubscript:v9];
      unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      unsigned int v11 = [v10 intValue];

      unint64_t v12 = v9 & 0xF;
      if ((_DWORD)v12 == 9)
      {
        BYTE9(v22) = 45;
      }

      else if ((v9 & 0xF) == 0)
      {
        strcpy((char *)v24 + 15, "    ");
        *(void *)&__int128 v13 = 0x2020202020202020LL;
        *((void *)&v13 + 1) = 0x2020202020202020LL;
        __int128 v23 = v13;
        v24[0] = v13;
        __int128 v21 = v13;
        __int128 v22 = v13;
      }

      if (v11 > 0x7F) {
        int v14 = __maskrune(v11, 0x40000uLL);
      }
      else {
        int v14 = *(_DWORD *)(MEMORY[0x1895F8770] + 4LL * v11 + 60) & 0x40000;
      }
      if (v14) {
        uint64_t v15 = v11;
      }
      else {
        uint64_t v15 = 46LL;
      }
      snprintf(__str, 4uLL, "%02x%c", v11, v15);
      uint64_t v16 = (3 * v12);
      *(_WORD *)((char *)&v21 + v16 + 2) = *(_WORD *)__str;
      *(_BYTE *)((v12 | (unint64_t)&v21) + 0x33) = __str[2];
      if (a4 == v9)
      {
        uint64_t v17 = (char *)&v21 + v16;
        v17[1] = 91;
        v17[4] = 93;
        if (v5) {
          __sprintf_chk((char *)&v24[1] + 3, 0, 9uLL, "\t<==");
        }
      }

      if ((_DWORD)v12 == 15 || v9 == [v7 count] - 1)
      {
        [NSString stringWithUTF8String:&v21];
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
        [v8 addObject:v18];
      }

      ++v9;
    }

    while ([v7 count] > v9);
  }

  return v8;
}

- (id)formatInstructionState:(id)a3 index:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = (void *)objc_opt_new();
  [v6 objectForKeyedSubscript:@"instructionStream"];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 objectForKeyedSubscript:@"cacheLine"];
  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Thread %d instruction stream:", v4);
    unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 addObject:v10];

    [v8 objectForKeyedSubscript:@"bytes"];
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 objectForKeyedSubscript:@"offset"];
    unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[OSALegacyXform _hexDump:offset:indicator:]( self,  "_hexDump:offset:indicator:",  v11,  [v12 intValue],  1);
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 addObjectsFromArray:v13];

    if (v9)
    {
      [v7 addObject:@"  Cacheline:"];
LABEL_6:
      [v9 objectForKeyedSubscript:@"bytes"];
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 objectForKeyedSubscript:@"offset"];
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[OSALegacyXform _hexDump:offset:indicator:]( self,  "_hexDump:offset:indicator:",  v15,  [v16 intValue],  0);
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 addObjectsFromArray:v17];
    }
  }

  else if (v9)
  {
    objc_msgSend( NSString,  "stringWithFormat:",  @"Thread %d instruction stream (single cacheline):",  v4);
    int v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 addObject:v14];

    goto LABEL_6;
  }

  [v7 componentsJoinedByString:@"\n"];
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)_getValueForKey:(id)a3 fromBody:(id)a4 orHeader:(id)a5
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (![&unk_189E31DF0 containsObject:v8])
  {
    id v11 = v9;
    if ([v8 hasPrefix:@"metadata:"])
    {
      id v16 = v10;

      uint64_t v17 = [v8 stringByReplacingOccurrencesOfString:@"metadata:" withString:&stru_189E21910];

      id v11 = v16;
      id v8 = (id)v17;
    }

    [v8 componentsSeparatedByString:@"."];
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v19 = [v18 count];
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    id v12 = v18;
    uint64_t v20 = [v12 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v31;
      id v28 = v10;
      id v29 = v9;
      while (2)
      {
        uint64_t v23 = 0LL;
        uint64_t v24 = v19 - 1;
        v19 -= v21;
        uint64_t v25 = v11;
        do
        {
          if (*(void *)v31 != v22) {
            objc_enumerationMutation(v12);
          }
          if (v24 == v23) {
            goto LABEL_18;
          }
          [v25 objectForKeyedSubscript:*(void *)(*((void *)&v30 + 1) + 8 * v23)];
          id v11 = (id)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

LABEL_18:
            id v11 = v25;
            id v10 = v28;
            id v9 = v29;
            goto LABEL_19;
          }

          ++v23;
          uint64_t v25 = v11;
        }

        while (v21 != v23);
        uint64_t v21 = [v12 countByEnumeratingWithState:&v30 objects:v34 count:16];
        id v10 = v28;
        id v9 = v29;
        if (v21) {
          continue;
        }
        break;
      }
    }

- (BOOL)transformJSON:(id)a3 header:(id)a4 error:(id *)a5 streamingBlock:(id)a6
{
  v22[3] = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  [v11 objectForKeyedSubscript:@"bug_type"];
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_templates, "objectForKeyedSubscript:", v13);
  int v14 = (void *)objc_claimAutoreleasedReturnValue();
  id v15 = (void *)objc_opt_new();
  if (v14)
  {
    BOOL v16 = -[OSALegacyXform transformLines:withDefinitions:body:header:error:streamingBlock:]( self,  "transformLines:withDefinitions:body:header:error:streamingBlock:",  v14,  v15,  v10,  v11,  a5,  v12);
  }

  else
  {
    if (a5)
    {
      uint64_t v17 = (void *)MEMORY[0x189607870];
      [NSString stringWithFormat:@"'%@' template not found", v13, *MEMORY[0x1896075E0]];
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v18;
      [MEMORY[0x189603F68] dictionaryWithObjects:v22 forKeys:&v21 count:1];
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
      [v17 errorWithDomain:@"OSALegacyXform" code:1 userInfo:v19];
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

    BOOL v16 = 0;
  }

  return v16;
}

- (BOOL)transformLines:(id)a3 withDefinitions:(id)a4 body:(id)a5 header:(id)a6 error:(id *)a7 streamingBlock:(id)a8
{
  uint64_t v88 = *MEMORY[0x1895F89C0];
  id v12 = a3;
  id v53 = a4;
  id v60 = a5;
  id v58 = a6;
  id v52 = a8;
  id v83 = 0LL;
  objc_msgSend( MEMORY[0x189607A00],  "regularExpressionWithPattern:options:error:",  @"\\$\\((([^\\)]+|[^]+)+)\\"),  0,  &v83);
  uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
  id v48 = v83;
  -[OSALegacyXform _getValueForKey:fromBody:orHeader:]( self,  "_getValueForKey:fromBody:orHeader:",  @"osVersion.train",  v60,  v58);
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
  char v49 = [v13 hasPrefix:@"macOS"];

  -[OSALegacyXform _getValueForKey:fromBody:orHeader:]( self,  "_getValueForKey:fromBody:orHeader:",  @"faultingThread",  v60,  0LL);
  uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v81 = 0u;
  __int128 v82 = 0u;
  __int128 v79 = 0u;
  __int128 v80 = 0u;
  id obj = v12;
  uint64_t v56 = [obj countByEnumeratingWithState:&v79 objects:v87 count:16];
  BOOL v46 = v56 == 0;
  if (v56)
  {
    uint64_t v57 = 0LL;
    int v14 = 0LL;
    uint64_t v55 = *(void *)v80;
    while (1)
    {
      for (uint64_t i = 0LL; i != v56; ++i)
      {
        if (*(void *)v80 != v55) {
          objc_enumerationMutation(obj);
        }
        BOOL v16 = *(void **)(*((void *)&v79 + 1) + 8 * i);
        if (v14)
        {
          if (![*(id *)(*((void *)&v79 + 1) + 8 * i) hasPrefix:@"#"]))
          {
            [v57 addObject:v16];
            continue;
          }

          [v53 setObject:v57 forKeyedSubscript:v14];

          uint64_t v57 = 0LL;
        }

        else
        {
          if ([*(id *)(*((void *)&v79 + 1) + 8 * i) hasPrefix:@"#(")]
          {
            [v16 substringFromIndex:2];
            int v14 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v17 = objc_opt_new();

            uint64_t v57 = (void *)v17;
            continue;
          }

          uint64_t v75 = 0LL;
          uint64_t v76 = &v75;
          uint64_t v77 = 0x2020000000LL;
          uint64_t v78 = 0LL;
          uint64_t v18 = objc_msgSend(v16, "rangeOfString:options:", @"\\^\\([^\\)]+\\"), 1040);
          uint64_t v20 = v18;
          if (v18 != 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v21 = v19;
            objc_msgSend(v16, "substringWithRange:", v18 + 2, v19 - 3);
            uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
            [v22 componentsSeparatedByString:@"&"];
            uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();

            v76[3] = v21 + v20;
            __int128 v71 = 0u;
            __int128 v72 = 0u;
            __int128 v73 = 0u;
            __int128 v74 = 0u;
            id v24 = v23;
            uint64_t v25 = [v24 countByEnumeratingWithState:&v71 objects:v86 count:16];
            if (v25)
            {
              uint64_t v26 = *(void *)v72;
              while (2)
              {
                for (uint64_t j = 0LL; j != v25; ++j)
                {
                  if (*(void *)v72 != v26) {
                    objc_enumerationMutation(v24);
                  }
                  id v28 = *(id *)(*((void *)&v71 + 1) + 8 * j);
                  if ([v28 hasPrefix:@"!"])
                  {
                    uint64_t v29 = [v28 substringFromIndex:1];

                    int v30 = 1;
                    id v28 = (id)v29;
                  }

                  else
                  {
                    int v30 = 0;
                  }

                  int v31 = [v28 hasPrefix:@"*"];
                  if (v31)
                  {
                    uint64_t v32 = [v28 substringFromIndex:1];

                    id v28 = (id)v32;
                  }

                  -[OSALegacyXform _getValueForKey:fromBody:orHeader:]( self,  "_getValueForKey:fromBody:orHeader:",  v28,  v60,  v58);
                  __int128 v33 = (void *)objc_claimAutoreleasedReturnValue();
                  int v34 = v33 != 0LL;
                  if (v33) {
                    int v35 = v31;
                  }
                  else {
                    int v35 = 0;
                  }
                  if (v35 == 1)
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
                      int v34 = [v33 count] != 0;
                    }
                    else {
                      int v34 = [v33 BOOLValue];
                    }
                  }

                  BOOL v36 = v30 == v34;

                  if (v36)
                  {
                    uint64_t v41 = v24;
                    goto LABEL_39;
                  }
                }

                uint64_t v25 = [v24 countByEnumeratingWithState:&v71 objects:v86 count:16];
                if (v25) {
                  continue;
                }
                break;
              }
            }
          }

          [v16 substringFromIndex:v76[3]];
          uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
          v76[3] = 0LL;
          uint64_t v38 = [v37 length];
          v61[0] = MEMORY[0x1895F87A8];
          v61[1] = 3221225472LL;
          v61[2] = __82__OSALegacyXform_transformLines_withDefinitions_body_header_error_streamingBlock___block_invoke;
          v61[3] = &unk_189E21220;
          id v39 = v52;
          id v68 = v39;
          id v40 = v37;
          id v62 = v40;
          uint64_t v69 = &v75;
          id v63 = v53;
          v64 = self;
          id v65 = v60;
          id v66 = v58;
          char v70 = v49;
          id v67 = v50;
          objc_msgSend(v51, "enumerateMatchesInString:options:range:usingBlock:", v40, 0, 0, v38, v61);
          [v40 substringFromIndex:v76[3]];
          uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();

          if ([v41 length]) {
            (*((void (**)(id, void *))v52 + 2))(v39, v41);
          }
          (*((void (**)(id, const __CFString *))v52 + 2))(v39, @"\n");

          id v24 = v68;
LABEL_39:

          _Block_object_dispose(&v75, 8);
        }

        int v14 = 0LL;
      }

      uint64_t v56 = [obj countByEnumeratingWithState:&v79 objects:v87 count:16];
      if (!v56)
      {

        BOOL v42 = v14 == 0LL;
        if (a7 && v14)
        {
          uint64_t v43 = (void *)MEMORY[0x189607870];
          uint64_t v84 = *MEMORY[0x1896075E0];
          v85 = @"template has illformed definition";
          [MEMORY[0x189603F68] dictionaryWithObjects:&v85 forKeys:&v84 count:1];
          uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue();
          [v43 errorWithDomain:@"OSALegacyXform" code:2 userInfo:v44];
          *a7 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_47;
        }

        goto LABEL_48;
      }
    }
  }

  int v14 = 0LL;
  uint64_t v57 = 0LL;
  uint64_t v44 = obj;
LABEL_47:

  BOOL v42 = v46;
LABEL_48:

  return v42;
}

void __82__OSALegacyXform_transformLines_withDefinitions_body_header_error_streamingBlock___block_invoke( void *a1,  void *a2)
{
  uint64_t v109 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  uint64_t v4 = [v3 rangeAtIndex:0];
  uint64_t v6 = v5;
  __int128 v72 = v3;
  uint64_t v7 = [v3 rangeAtIndex:1];
  uint64_t v9 = v8;
  uint64_t v10 = a1[10];
  uint64_t v11 = *(void *)(*(void *)(a1[11] + 8LL) + 24LL);
  objc_msgSend((id)a1[4], "substringWithRange:", v11, v4 - v11);
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v12);

  uint64_t v69 = v9;
  uint64_t v70 = v7;
  objc_msgSend((id)a1[4], "substringWithRange:", v7, v9);
  __int128 v71 = (void *)objc_claimAutoreleasedReturnValue();
  [v71 componentsSeparatedByString:@"|"];
  __int128 v97 = 0u;
  __int128 v98 = 0u;
  __int128 v99 = 0u;
  __int128 v100 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = [obj countByEnumeratingWithState:&v97 objects:v108 count:16];
  if (!v13) {
    goto LABEL_79;
  }
  uint64_t v14 = v13;
  uint64_t v15 = *(void *)v98;
  __int128 v81 = a1;
  uint64_t v74 = *(void *)v98;
  while (2)
  {
    uint64_t v16 = 0LL;
    uint64_t v73 = v14;
    do
    {
      if (*(void *)v98 != v15) {
        objc_enumerationMutation(obj);
      }
      uint64_t v17 = *(void **)(*((void *)&v97 + 1) + 8 * v16);
      [v17 componentsSeparatedByString:@"#"];
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v79 = v16;
      if ([v18 count] == 2)
      {
        uint64_t v19 = (void *)a1[5];
        [v18 objectAtIndexedSubscript:0];
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
        [v19 objectForKeyedSubscript:v20];
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v21) {
          goto LABEL_78;
        }
        uint64_t v22 = (void *)a1[6];
        [v18 objectAtIndexedSubscript:1];
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
        [v22 _getValueForKey:v23 fromBody:a1[7] orHeader:a1[8]];
        id v24 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          uint64_t v76 = v24;
          uint64_t v77 = v18;
          __int128 v95 = 0u;
          __int128 v96 = 0u;
          __int128 v93 = 0u;
          __int128 v94 = 0u;
          id v80 = v24;
          uint64_t v25 = [v80 countByEnumeratingWithState:&v93 objects:v107 count:16];
          if (v25)
          {
            uint64_t v26 = v25;
            uint64_t v27 = 0LL;
            uint64_t v28 = *(void *)v94;
            do
            {
              for (uint64_t i = 0LL; i != v26; ++i)
              {
                if (*(void *)v94 != v28) {
                  objc_enumerationMutation(v80);
                }
                uint64_t v30 = *(void *)(*((void *)&v93 + 1) + 8 * i);
                uint64_t v31 = v81[5];
                uint64_t v32 = (void *)v81[6];
                v105[0] = @"<index>";
                [MEMORY[0x189607968] numberWithInt:v27 + i];
                __int128 v33 = (void *)objc_claimAutoreleasedReturnValue();
                v105[1] = @"<item>";
                v106[0] = v33;
                v106[1] = v30;
                [MEMORY[0x189603F68] dictionaryWithObjects:v106 forKeys:v105 count:2];
                int v34 = (void *)objc_claimAutoreleasedReturnValue();
                id v92 = 0LL;
                [v32 transformLines:v21 withDefinitions:v31 body:v34 header:0 error:&v92 streamingBlock:v81[10]];
                id v35 = v92;
              }

              uint64_t v26 = [v80 countByEnumeratingWithState:&v93 objects:v107 count:16];
              uint64_t v27 = (v27 + i);
            }

            while (v26);
          }
        }

        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
LABEL_31:

            uint64_t v6 = [(id)a1[4] length];
            uint64_t v4 = 0LL;
            uint64_t v15 = v74;
            goto LABEL_32;
          }

          uint64_t v76 = v24;
          uint64_t v77 = v18;
          __int128 v90 = 0u;
          __int128 v91 = 0u;
          __int128 v88 = 0u;
          __int128 v89 = 0u;
          id v38 = v24;
          uint64_t v39 = [v38 countByEnumeratingWithState:&v88 objects:v104 count:16];
          if (v39)
          {
            uint64_t v40 = v39;
            uint64_t v41 = *(void *)v89;
            do
            {
              for (uint64_t j = 0LL; j != v40; ++j)
              {
                if (*(void *)v89 != v41) {
                  objc_enumerationMutation(v38);
                }
                uint64_t v44 = v81[5];
                uint64_t v43 = (void *)v81[6];
                v103[0] = *(void *)(*((void *)&v88 + 1) + 8 * j);
                v102[0] = @"<key>";
                v102[1] = @"<value>";
                objc_msgSend(v38, "objectForKeyedSubscript:");
                uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue();
                v103[1] = v45;
                [MEMORY[0x189603F68] dictionaryWithObjects:v103 forKeys:v102 count:2];
                BOOL v46 = (void *)objc_claimAutoreleasedReturnValue();
                id v87 = 0LL;
                [v43 transformLines:v21 withDefinitions:v44 body:v46 header:0 error:&v87 streamingBlock:v81[10]];
                id v47 = v87;
              }

              uint64_t v40 = [v38 countByEnumeratingWithState:&v88 objects:v104 count:16];
            }

            while (v40);
          }
        }

        id v24 = v76;

        uint64_t v18 = v77;
        uint64_t v14 = v73;
        a1 = v81;
        goto LABEL_31;
      }

      if (([v17 hasPrefix:@"\""] & 1) == 0)
      {
        [(id)a1[6] _getValueForKey:v17 fromBody:a1[7] orHeader:a1[8]];
        uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v37) {
          goto LABEL_32;
        }
LABEL_35:
        if ([v17 isEqualToString:@"threads"])
        {
          id v48 = (void *)a1[6];
          [(id)a1[7] objectForKeyedSubscript:@"usedImages"];
          char v49 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v50 = [v48 formatCallstacks:v37 withImages:v49 macosStyle:*((unsigned __int8 *)a1 + 96)];
LABEL_37:
          uint64_t v51 = (void *)v50;

          goto LABEL_52;
        }

        if (![v17 isEqualToString:@"threadState"])
        {
          if ([v17 isEqualToString:@"instructionState"])
          {
            uint64_t v54 = objc_msgSend((id)a1[6], "formatInstructionState:index:", v37, objc_msgSend((id)a1[9], "intValue"));
          }

          else
          {
            if ([v17 isEqualToString:@"lastBranchState"])
            {
              uint64_t v55 = (void *)a1[6];
              uint64_t v56 = [(id)a1[9] intValue];
              [(id)a1[7] objectForKeyedSubscript:@"usedImages"];
              char v49 = (void *)objc_claimAutoreleasedReturnValue();
              uint64_t v50 = [v55 formatLastBranchState:v37 index:v56 withImages:v49];
              goto LABEL_37;
            }

            if ([v17 isEqualToString:@"lastExceptionBacktrace"])
            {
              id v58 = (void *)a1[6];
              [(id)a1[7] objectForKeyedSubscript:@"usedImages"];
              char v49 = (void *)objc_claimAutoreleasedReturnValue();
              uint64_t v50 = [v58 formatLastException:v37 withImages:v49];
              goto LABEL_37;
            }

            if ([v17 hasPrefix:@"usedImages"])
            {
              uint64_t v54 = [(id)a1[6] formatImages:v37 macosStyle:*((unsigned __int8 *)a1 + 96)];
            }

            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                (*(void (**)(void))(a1[10] + 16LL))();
LABEL_77:

LABEL_78:
                goto LABEL_79;
              }

              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                uint64_t v54 = [v37 stringValue];
              }

              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  uint64_t v57 = a1[10];
                  goto LABEL_75;
                }

                if ([v37 count])
                {
                  [v37 firstObject];
                  uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  char isKindOfClass = objc_opt_isKindOfClass();

                  if ((isKindOfClass & 1) != 0)
                  {
                    uint64_t v78 = v18;
                    uint64_t v61 = (void *)objc_opt_new();
                    __int128 v83 = 0u;
                    __int128 v84 = 0u;
                    __int128 v85 = 0u;
                    __int128 v86 = 0u;
                    id v82 = v37;
                    uint64_t v62 = [v82 countByEnumeratingWithState:&v83 objects:v101 count:16];
                    if (v62)
                    {
                      uint64_t v63 = v62;
                      uint64_t v64 = *(void *)v84;
                      do
                      {
                        for (uint64_t k = 0LL; k != v63; ++k)
                        {
                          if (*(void *)v84 != v64) {
                            objc_enumerationMutation(v82);
                          }
                          objc_msgSend( NSString,  "stringWithFormat:",  @"0x%016qx",  objc_msgSend(*(id *)(*((void *)&v83 + 1) + 8 * k), "longLongValue"));
                          id v66 = (void *)objc_claimAutoreleasedReturnValue();
                          [v61 addObject:v66];
                        }

                        uint64_t v63 = [v82 countByEnumeratingWithState:&v83 objects:v101 count:16];
                      }

                      while (v63);
                    }

                    objc_msgSend(v61, "componentsJoinedByString:", @", ");
                    uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();

                    uint64_t v18 = v78;
LABEL_52:
                    uint64_t v57 = a1[10];
                    if (v51)
                    {
                      (*(void (**)(void, void *))(v57 + 16))(a1[10], v51);
LABEL_76:

                      goto LABEL_77;
                    }

+ (id)rollSchemaForward:(id)a3
{
  uint64_t v132 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  objc_msgSend( MEMORY[0x189607A00],  "regularExpressionWithPattern:options:error:",  @"^([A-Z_]+), (\\[0x[0-9a-zA-Z]\\])?(.*)$",  0,  0);
  uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue();
  id v64 = (id)objc_opt_new();
  __int128 v114 = 0u;
  __int128 v115 = 0u;
  __int128 v116 = 0u;
  __int128 v117 = 0u;
  id obj = v3;
  uint64_t v67 = [obj countByEnumeratingWithState:&v114 objects:v131 count:16];
  if (v67)
  {
    uint64_t v65 = *(void *)v115;
    do
    {
      uint64_t v69 = 0LL;
      do
      {
        if (*(void *)v115 != v65) {
          objc_enumerationMutation(obj);
        }
        __int128 v71 = *(void **)(*((void *)&v114 + 1) + 8 * v69);
        objc_msgSend(obj, "objectForKeyedSubscript:");
        uint64_t v70 = (void *)objc_claimAutoreleasedReturnValue();
        if (![v71 isEqualToString:@"asi"])
        {
          if ([v71 isEqualToString:@"termination"])
          {
            id v73 = v70;
            uint64_t v4 = (void *)objc_opt_new();
            [v73 objectForKeyedSubscript:@"namespace"];
            uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
            [v4 setObject:v5 forKeyedSubscript:@"namespace"];

            [v73 objectForKeyedSubscript:@"code"];
            uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
            [v4 setObject:v6 forKeyedSubscript:@"code"];

            [v73 objectForKeyedSubscript:@"flag"];
            uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
            [v4 setObject:v7 forKeyedSubscript:@"flag"];

            [v73 objectForKeyedSubscript:@"signal"];
            uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
            if (v8) {
              [v4 setObject:v8 forKeyedSubscript:@"indicator"];
            }
            [v73 objectForKeyedSubscript:@"description"];
            uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

            if (v9
              || ([v73 objectForKeyedSubscript:@"reason"],
                  (uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue()) != 0LL))
            {
              uint64_t v108 = 0LL;
              uint64_t v109 = &v108;
              uint64_t v110 = 0x3032000000LL;
              v111 = __Block_byref_object_copy__6;
              v112 = __Block_byref_object_dispose__6;
              id v113 = 0LL;
              uint64_t v10 = [v9 length];
              v105[0] = MEMORY[0x1895F87A8];
              v105[1] = 3221225472LL;
              void v105[2] = __36__OSALegacyXform_rollSchemaForward___block_invoke;
              v105[3] = &unk_189E21270;
              v107 = &v108;
              id v11 = v9;
              id v106 = v11;
              objc_msgSend(v61, "enumerateMatchesInString:options:range:usingBlock:", v11, 0, 0, v10, v105);
              if (v109[5]) {
                id v12 = (void *)v109[5];
              }
              else {
                id v12 = v11;
              }
              [v12 componentsSeparatedByString:@"|"];
              uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
              [v13 valueForKey:@"stringByTrimming"];
              uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
              [v4 setObject:v14 forKeyedSubscript:@"reasons"];

              _Block_object_dispose(&v108, 8);
            }

            [v73 objectForKeyedSubscript:@"details"];
            uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v16 = v15;
            if (v15)
            {
              [v15 componentsSeparatedByString:@"|"];
              uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
              [v17 valueForKey:@"stringByTrimming"];
              uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
              [v4 setObject:v18 forKeyedSubscript:@"details"];
            }

            [v64 setObject:v4 forKeyedSubscript:v71];

LABEL_23:
            goto LABEL_24;
          }

          if ([v71 isEqualToString:@"legacyInfo"])
          {
            [v70 objectForKeyedSubscript:@"threadTriggered"];
            id v73 = (id)objc_claimAutoreleasedReturnValue();
            [v73 objectForKeyedSubscript:@"index"];
            uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
            [v64 setObject:v19 forKeyedSubscript:@"faultingThread"];

            [v64 setObject:v70 forKeyedSubscript:v71];
            goto LABEL_23;
          }

          if (![v71 isEqualToString:@"threads"])
          {
            if ([v71 isEqualToString:@"usedImages"])
            {
              id v45 = v70;
              __int128 v84 = (void *)objc_opt_new();
              [obj objectForKeyedSubscript:@"legacyInfo"];
              id v82 = (void *)objc_claimAutoreleasedReturnValue();
              [v82 objectForKeyedSubscript:@"imageExtraInfo"];
              BOOL v46 = (void *)objc_claimAutoreleasedReturnValue();
              __int128 v87 = 0u;
              __int128 v88 = 0u;
              __int128 v85 = 0u;
              __int128 v86 = 0u;
              id v73 = v45;
              uint64_t v47 = [v73 countByEnumeratingWithState:&v85 objects:v118 count:16];
              if (v47)
              {
                int v48 = 0;
                uint64_t v49 = *(void *)v86;
                do
                {
                  uint64_t v50 = 0LL;
                  uint64_t v51 = v48;
                  do
                  {
                    if (*(void *)v86 != v49) {
                      objc_enumerationMutation(v73);
                    }
                    id v52 = *(void **)(*((void *)&v85 + 1) + 8 * v50);
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      [v46 objectAtIndexedSubscript:v51 + v50];
                      uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue();
                      uint64_t v54 = (void *)[v53 mutableCopy];

                      [v52 objectAtIndexedSubscript:0];
                      uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue();
                      [v54 setObject:v55 forKeyedSubscript:@"uuid"];

                      [v52 objectAtIndexedSubscript:1];
                      uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue();
                      [v54 setObject:v56 forKeyedSubscript:@"base"];

                      [v52 objectAtIndexedSubscript:2];
                      uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue();
                      [v54 setObject:v57 forKeyedSubscript:@"source"];

                      [v84 addObject:v54];
                    }

                    ++v50;
                  }

                  while (v47 != v50);
                  uint64_t v47 = [v73 countByEnumeratingWithState:&v85 objects:v118 count:16];
                  int v48 = v51 + v50;
                }

                while (v47);
              }

              [v64 setObject:v84 forKeyedSubscript:v71];
            }

            else
            {
              [&unk_189E31CC8 objectForKeyedSubscript:v71];
              id v73 = (id)objc_claimAutoreleasedReturnValue();
              if (v73) {
                objc_msgSend(v64, "setObject:forKeyedSubscript:", v70);
              }
              else {
                [v64 setObject:v70 forKeyedSubscript:v71];
              }
            }

            goto LABEL_23;
          }

          id v73 = (id)objc_opt_new();
          id v20 = v70;
          __int128 v101 = 0u;
          __int128 v102 = 0u;
          __int128 v103 = 0u;
          __int128 v104 = 0u;
          id v60 = v20;
          uint64_t v63 = [v20 countByEnumeratingWithState:&v101 objects:v128 count:16];
          if (!v63) {
            goto LABEL_74;
          }
          uint64_t v62 = *(void *)v102;
LABEL_29:
          uint64_t v66 = 0LL;
          while (1)
          {
            if (*(void *)v102 != v62) {
              objc_enumerationMutation(v60);
            }
            uint64_t v78 = *(void **)(*((void *)&v101 + 1) + 8 * v66);
            __int128 v81 = (void *)[v78 mutableCopy];
            __int128 v83 = (void *)objc_opt_new();
            [v78 objectForKeyedSubscript:@"frames"];
            id v80 = (id)objc_claimAutoreleasedReturnValue();
            __int128 v99 = 0u;
            __int128 v100 = 0u;
            __int128 v97 = 0u;
            __int128 v98 = 0u;
            uint64_t v21 = [v80 countByEnumeratingWithState:&v97 objects:v127 count:16];
            if (v21)
            {
              uint64_t v22 = *(void *)v98;
              do
              {
                for (uint64_t i = 0LL; i != v21; ++i)
                {
                  if (*(void *)v98 != v22) {
                    objc_enumerationMutation(v80);
                  }
                  id v24 = *(void **)(*((void *)&v97 + 1) + 8 * i);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    id v25 = v24;
                  }

                  else
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v125[0] = @"imageIndex";
                      [v24 objectAtIndexedSubscript:0];
                      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
                      v126[0] = v26;
                      v125[1] = @"imageOffset";
                      [v24 objectAtIndexedSubscript:1];
                      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
                      v126[1] = v27;
                      [MEMORY[0x189603F68] dictionaryWithObjects:v126 forKeys:v125 count:2];
                      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
                      id v25 = (id)[v28 mutableCopy];

                      if ((unint64_t)[v24 count] >= 3)
                      {
                        [v24 objectAtIndexedSubscript:2];
                        uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
                        [v25 addEntriesFromDictionary:v29];
                      }
                    }

                    else
                    {
                      id v25 = 0LL;
                    }
                  }

                  [v83 addObject:v25];
                  [v81 setObject:v83 forKeyedSubscript:@"frames"];
                }

                uint64_t v21 = [v80 countByEnumeratingWithState:&v97 objects:v127 count:16];
              }

              while (v21);
            }

            [v78 objectForKeyedSubscript:@"triggered"];
            uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
            int v31 = [v30 BOOLValue];

            if (v31)
            {
              [obj objectForKeyedSubscript:@"threadState"];
              uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
              if (v32) {
                break;
              }
              [v78 objectForKeyedSubscript:@"threadState"];
              uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
              if (v32) {
                break;
              }
            }

void __36__OSALegacyXform_rollSchemaForward___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 rangeAtIndex:3];
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v3, v4);
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8LL);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }

+ (id)transformURL:(id)a3 options:(id)a4
{
  v122[1] = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)objc_opt_new();
  uint64_t v8 = objc_alloc(&OBJC_CLASS___OSALog);
  [v5 path];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  id v113 = 0LL;
  uint64_t v10 = -[OSALog initWithPath:forRouting:options:error:]( v8,  "initWithPath:forRouting:options:error:",  v9,  &stru_189E21910,  &unk_189E31CF0,  &v113);
  id v11 = v113;

  if (!v10)
  {
    [NSString stringWithFormat:@"Unable to load log '%@'", v5];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 augmentWithPrefix:v12];
    id v24 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_89;
  }

  v105 = v6;
  id v12 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189607898]),  "initWithFileDescriptor:",  fileno(-[OSALog stream](v10, "stream")));
  uint64_t v13 = MEMORY[0x186E33EAC](-[OSALog stream](v10, "stream"));
  -[OSALog metaData](v10, "metaData");
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = [v14 count];

  if (!v15)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = v13;
      _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "ips metadata not detected (%ld bytes before newline), attempting to read entire file as payload",  buf,  0xCu);
    }

    uint64_t v13 = 0LL;
  }

  [v12 seekToFileOffset:v13];
  uint64_t v16 = [v12 availableData];
  id v112 = v11;
  [MEMORY[0x1896078D8] JSONObjectWithData:v16 options:0 error:&v112];
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  id v18 = v112;

  if (v17)
  {
    uint64_t v102 = v16;
    __int128 v103 = v18;
    -[OSALog bugType](v10, "bugType");
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[OSALog metaData](v10, "metaData");
    id v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[OSALog metaData](v10, "metaData");
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v22 = [v21 count];

    if (v22)
    {
      id v23 = v20;
    }

    else
    {
      id v25 = (void *)objc_opt_new();
      uint64_t v26 = [v17 objectForKeyedSubscript:@"bug_type"];

      [v25 setObject:v26 forKeyedSubscript:@"bug_type"];
      [v17 objectForKeyedSubscript:@"isSimulated"];
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
      [v25 setObject:v27 forKeyedSubscript:@"isSimulated"];

      [v17 objectForKeyedSubscript:@"isCorpse"];
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
      [v25 setObject:v28 forKeyedSubscript:@"isCorpse"];

      [v17 objectForKeyedSubscript:@"incident_id"];
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
      [v25 setObject:v29 forKeyedSubscript:@"incident_id"];

      [v17 objectForKeyedSubscript:@"os_version"];
      uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
      [v25 setObject:v30 forKeyedSubscript:@"os_version"];

      [v17 objectForKeyedSubscript:@"platform"];
      int v31 = (void *)objc_claimAutoreleasedReturnValue();
      [v25 setObject:v31 forKeyedSubscript:@"platform"];

      id v23 = v25;
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        int v32 = [v23 count];
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v32;
        _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "synthesizing %d items from payload as metadata",  buf,  8u);
      }

      [v17 objectForKeyedSubscript:@"parsedData"];
      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (v33)
      {
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "this log appears to be from the DA grid, using parsedData section",  buf,  2u);
        }

        id v34 = v33;

        uint64_t v17 = v34;
      }

      uint64_t v19 = (void *)v26;
    }

    if ([&unk_189E31E08 containsObject:v19])
    {
      __int128 v99 = v7;
      [v17 objectForKeyedSubscript:@"version"];
      id v35 = (void *)objc_claimAutoreleasedReturnValue();
      id v100 = v23;
      if ((int)[v35 intValue] >= 2)
      {

        goto LABEL_28;
      }

      [v17 objectForKeyedSubscript:@"variantVersion"];
      id v36 = (void *)objc_claimAutoreleasedReturnValue();
      int v37 = [v36 intValue];

      if (v37 > 1)
      {
        id v23 = v100;
        goto LABEL_28;
      }

      uint64_t v41 = +[OSALegacyXform rollSchemaForward:](&OBJC_CLASS___OSALegacyXform, "rollSchemaForward:", v17);

      uint64_t v17 = (void *)v41;
      id v23 = v100;
      if (v41)
      {
LABEL_28:
        __int128 v98 = objc_alloc_init(&OBJC_CLASS___OSALegacyXform);
        [v23 objectForKeyedSubscript:@"os_version"];
        int v42 = (void *)objc_claimAutoreleasedReturnValue();
        if ([v42 hasPrefix:@"macOS"])
        {
          [v23 objectForKeyedSubscript:@"platform"];
          int v43 = (void *)objc_claimAutoreleasedReturnValue();
          if (v43)
          {
            [v23 objectForKeyedSubscript:@"platform"];
            uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue();
            if ([v44 intValue] == 1)
            {
              BOOL v45 = 1;
            }

            else
            {
              [v23 objectForKeyedSubscript:@"platform"];
              __int128 v96 = (void *)objc_claimAutoreleasedReturnValue();
              if ([v96 intValue] == 6)
              {
                BOOL v45 = 1;
              }

              else
              {
                [v23 objectForKeyedSubscript:@"platform"];
                uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue();
                BOOL v45 = [v47 intValue] == 10;

                id v23 = v100;
              }
            }
          }

          else
          {
            BOOL v45 = 1;
          }
        }

        else
        {
          BOOL v45 = 0;
        }

        [v105 objectForKeyedSubscript:OSATransformOptionMetadata];
        int v48 = (void *)objc_claimAutoreleasedReturnValue();

        unint64_t v49 = 0x189607000LL;
        if (!v48)
        {
          if (v45)
          {
LABEL_55:
            uint64_t v54 = &legacyTemplate_9;
LABEL_56:
            uint64_t v16 = v102;
            uint64_t v40 = v98;
            uint64_t v57 = [*(id *)(v49 + 2600) stringWithUTF8String:*v54];
            uint64_t v7 = v99;
            __int128 v97 = (void *)v57;
            if (!v57)
            {
              uint64_t v71 = [v103 augmentWithPrefix:@"Unable to locate template"];
              id v72 = v103;
              id v24 = (void *)v71;
LABEL_86:

              goto LABEL_87;
            }

            id v111 = v103;
            __int128 v95 = v19;
            -[OSALegacyXform prepareTemplate:forLogType:error:]( v98,  "prepareTemplate:forLogType:error:",  v57,  v19,  &v111);
            id v58 = v111;

            uint64_t v59 = (void *)objc_opt_new();
            id v110 = v58;
            v108[0] = MEMORY[0x1895F87A8];
            v108[1] = 3221225472LL;
            v108[2] = __39__OSALegacyXform_transformURL_options___block_invoke;
            v108[3] = &unk_189E21298;
            id v60 = v59;
            id v109 = v60;
            BOOL v61 = -[OSALegacyXform transformJSON:header:error:streamingBlock:]( v98,  "transformJSON:header:error:streamingBlock:",  v17,  v23,  &v110,  v108);
            id v62 = v110;

            id v104 = v60;
            if (!v61)
            {
              [v62 augmentWithPrefix:@"Unable to transform log"];
              id v24 = (void *)objc_claimAutoreleasedReturnValue();
              goto LABEL_84;
            }

            id v94 = v5;
            id v63 = v60;
            [v105 objectForKeyedSubscript:OSATransformOptionSymbolicate];
            id v64 = (void *)objc_claimAutoreleasedReturnValue();
            int v65 = [v64 BOOLValue];

            if (!v65)
            {
              id v24 = v62;
              id v23 = v100;
LABEL_70:
              [v105 objectForKeyedSubscript:OSATransformOptionFullReport];
              uint64_t v74 = (void *)objc_claimAutoreleasedReturnValue();
              int v75 = [v74 BOOLValue];

              if (v75)
              {
                id v107 = 0LL;
                [NSString stringWithContentsOfURL:v94 encoding:4 error:&v107];
                uint64_t v76 = (__CFString *)objc_claimAutoreleasedReturnValue();
                id v77 = v107;
                if (!v76)
                {
                  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
                    +[OSALegacyXform transformURL:options:].cold.2(v77);
                  }
                  uint64_t v76 = @"Unable to load full report.";
                }

                [NSString stringWithFormat:@"%@%@%@\n%@\n", @"-------------------------------------\nTranslated Report (Full Report Below)\n-------------------------------------\n", v63, @"-----------\nFull Report\n-----------\n", v76];
                __int128 v101 = (void *)objc_claimAutoreleasedReturnValue();
              }

              else
              {
                __int128 v101 = v63;
              }

              [v105 objectForKeyedSubscript:OSATransformOptionPersist];
              uint64_t v78 = (void *)objc_claimAutoreleasedReturnValue();
              id v5 = v94;
              if ([v78 BOOLValue])
              {
                uint64_t v79 = [v101 length];

                if (v79)
                {
                  memcpy(buf, "/tmp/temp.XXXXXX", 0x400uLL);
                  uint64_t v80 = mkstemp((char *)buf);
                  if ((_DWORD)v80 == -1)
                  {
                    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
                      +[OSALegacyXform transformURL:options:].cold.1();
                    }
                    __int128 v88 = (void *)MEMORY[0x189607870];
                    uint64_t v118 = *MEMORY[0x1896075E0];
                    v119 = @"Error creating temporary file for symbolicated log";
                    [MEMORY[0x189603F68] dictionaryWithObjects:&v119 forKeys:&v118 count:1];
                    __int128 v81 = (void *)objc_claimAutoreleasedReturnValue();
                    uint64_t v84 = [v88 errorWithDomain:@"OSALegacyXform" code:8 userInfo:v81];
                  }

                  else
                  {
                    __int128 v81 = (void *)[objc_alloc(MEMORY[0x189607898]) initWithFileDescriptor:v80 closeOnDealloc:1];
                    [v101 dataUsingEncoding:4];
                    id v82 = (void *)objc_claimAutoreleasedReturnValue();
                    id v106 = 0LL;
                    [v81 writeData:v82 error:&v106];
                    id v83 = v106;

                    if (v83)
                    {
                      uint64_t v84 = [v83 augmentWithPrefix:@"failed to persist symbolicated log"];
                      id v24 = v83;
                    }

                    else
                    {
                      __int128 v89 = (void *)MEMORY[0x189604030];
                      [NSString stringWithUTF8String:buf];
                      id v24 = (void *)objc_claimAutoreleasedReturnValue();
                      [v89 fileURLWithPath:v24];
                      __int128 v90 = (void *)objc_claimAutoreleasedReturnValue();
                      [v7 setObject:v90 forKeyedSubscript:OSATransformResultFileURL];

                      uint64_t v84 = 0LL;
                    }
                  }

                  uint64_t v40 = v98;

                  id v24 = (void *)v84;
                  id v62 = v101;
                  goto LABEL_85;
                }
              }

              else
              {
              }

              id v62 = v101;
              [v7 setObject:v101 forKeyedSubscript:OSATransformResultReport];
LABEL_84:
              uint64_t v40 = v98;
LABEL_85:

              uint64_t v16 = v102;
              id v72 = v104;
              uint64_t v19 = v95;
              goto LABEL_86;
            }

            id v93 = v63;
            [v63 dataUsingEncoding:4];
            __int128 v92 = (void *)objc_claimAutoreleasedReturnValue();
            symbolicateSpeedTracer(v92, v105);
            uint64_t v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            __int128 v91 = v66;
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              [v66 objectForKeyedSubscript:OSATransformResultRadars];
              uint64_t v67 = (void *)objc_claimAutoreleasedReturnValue();
              [v99 setObject:v67 forKeyedSubscript:OSATransformResultRadars];

              [v66 objectForKeyedSubscript:OSATransformResultTracerURL];
              id v68 = (void *)objc_claimAutoreleasedReturnValue();
              uint64_t v7 = v99;
              [v99 setObject:v68 forKeyedSubscript:OSATransformResultTracerURL];

              [v66 objectForKeyedSubscript:OSATransformResultError];
              id v24 = (void *)objc_claimAutoreleasedReturnValue();

              [v66 objectForKeyedSubscript:OSATransformResultReport];
              uint64_t v69 = (void *)objc_claimAutoreleasedReturnValue();
              id v70 = v69;
              id v23 = v100;
              if (!v69)
              {
LABEL_69:
                id v63 = v93;

                goto LABEL_70;
              }

              id v70 = v69;
              id v62 = v93;
              id v93 = v70;
            }

            else
            {
              id v73 = (void *)MEMORY[0x189607870];
              uint64_t v121 = *MEMORY[0x1896075E0];
              v122[0] = @"No speedtracer results";
              [MEMORY[0x189603F68] dictionaryWithObjects:v122 forKeys:&v121 count:1];
              id v70 = (id)objc_claimAutoreleasedReturnValue();
              [v73 errorWithDomain:@"OSALegacyTransform" code:1 userInfo:v70];
              id v24 = (void *)objc_claimAutoreleasedReturnValue();
              uint64_t v7 = v99;
              id v23 = v100;
            }

            goto LABEL_69;
          }

uint64_t __39__OSALegacyXform_transformURL_options___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) appendString:a2];
}

- (void).cxx_destruct
{
}

+ (void)transformURL:options:.cold.1()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "Error creating temporary file for symbolicated log",  v0,  2u);
}

+ (void)transformURL:(void *)a1 options:.cold.2(void *a1)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  [a1 localizedDescription];
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  int v2 = 138543362;
  uint64_t v3 = v1;
  _os_log_error_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "Error loading full report: %{public}@",  (uint8_t *)&v2,  0xCu);
}

@end