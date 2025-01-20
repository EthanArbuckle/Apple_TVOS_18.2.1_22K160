@interface StatisticsParser
- (BOOL)feedJSONLine:(id)a3 error:(id *)a4;
- (NSArray)topEmitters;
- (NSArray)totalBytes;
- (NSDictionary)quarantinedClients;
- (NSDictionary)snapshotClients;
- (StatisticsParser)initWithUnixTimeBoundFrom:(int64_t)a3 to:(int64_t)a4;
- (int)validLineCount;
- (int64_t)newestEntryUnixTime;
- (int64_t)oldestEntryUnixTime;
- (void)_handleEmitter:(id)a3 inBook:(unsigned __int8)a4;
- (void)_handleQuarantineRecord:(id)a3;
- (void)_handleSnapshotRecord:(id)a3;
- (void)_handleStatisticsRecord:(id)a3;
@end

@implementation StatisticsParser

- (StatisticsParser)initWithUnixTimeBoundFrom:(int64_t)a3 to:(int64_t)a4
{
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___StatisticsParser;
  v6 = -[StatisticsParser init](&v24, "init");
  v7 = v6;
  if (v6)
  {
    v6->_lowerBound = a3;
    v6->_upperBound = a4;
    v8 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    snapshotClients = v7->_snapshotClients;
    v7->_snapshotClients = v8;

    v10 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    v25[0] = v10;
    v11 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    v25[1] = v11;
    v12 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    v25[2] = v12;
    v13 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    v25[3] = v13;
    v14 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    v25[4] = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v25, 5LL));
    v16 = (NSMutableArray *)[v15 mutableCopy];
    topEmitters = v7->_topEmitters;
    v7->_topEmitters = v16;

    v18 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    quarantinedClients = v7->_quarantinedClients;
    v7->_quarantinedClients = v18;

    v20 = (NSMutableArray *)[&off_100008AD0 mutableCopy];
    totalBytes = v7->_totalBytes;
    v7->_totalBytes = v20;

    v7->_validLineCount = 0;
    v7->_oldestEntryUnixTime = 0LL;
    v7->_newestEntryUnixTime = 0LL;
    v22 = v7;
  }

  return v7;
}

- (BOOL)feedJSONLine:(id)a3 error:(id *)a4
{
  v6 = (void *)objc_claimAutoreleasedReturnValue([a3 dataUsingEncoding:4]);
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v6,  0LL,  a4));
  v8 = v7;
  if (v7)
  {
    id v9 = sub_1000036FC(v7, (uint64_t)@"unixTime");
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = v10;
    if (!v10
      || (signed int v12 = [v10 intValue], self->_lowerBound > v12)
      || self->_upperBound <= v12)
    {
LABEL_20:

      goto LABEL_21;
    }

    int validLineCount = self->_validLineCount;
    if (validLineCount)
    {
      if (self->_oldestEntryUnixTime > v12) {
        self->_oldestEntryUnixTime = v12;
      }
      p_newestEntryUnixTime = &self->_newestEntryUnixTime;
      if (self->_newestEntryUnixTime >= v12) {
        goto LABEL_12;
      }
    }

    else
    {
      self->_newestEntryUnixTime = v12;
      p_newestEntryUnixTime = &self->_oldestEntryUnixTime;
    }

    int64_t *p_newestEntryUnixTime = v12;
LABEL_12:
    self->_int validLineCount = validLineCount + 1;
    id v15 = sub_100003690(v8, (uint64_t)@"record");
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = v16;
    if (v16)
    {
      if ([v16 isEqualToString:@"logd snapshot"])
      {
        -[StatisticsParser _handleSnapshotRecord:](self, "_handleSnapshotRecord:", v8);
      }

      else if ([v17 isEqualToString:@"logd statistics"])
      {
        -[StatisticsParser _handleStatisticsRecord:](self, "_handleStatisticsRecord:", v8);
      }

      else if ([v17 isEqualToString:@"logd quarantine"])
      {
        -[StatisticsParser _handleQuarantineRecord:](self, "_handleQuarantineRecord:", v8);
      }
    }

    goto LABEL_20;
  }

- (void)_handleSnapshotRecord:(id)a3
{
  id v4 = sub_100003690(a3, (uint64_t)@"client");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (v5)
  {
    v10 = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_snapshotClients,  "objectForKeyedSubscript:",  v5));

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_snapshotClients,  "objectForKeyedSubscript:",  v10));
      uint64_t v8 = [v7 intValue] + 1;
    }

    else
    {
      uint64_t v8 = 1LL;
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v8));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_snapshotClients, "setObject:forKeyedSubscript:", v9, v10);

    v5 = v10;
  }
}

- (void)_handleStatisticsRecord:(id)a3
{
  id v4 = a3;
  id v5 = sub_100003690(v4, (uint64_t)@"type");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (v6 && [v6 isEqualToString:@"File Rotate"])
  {
    id v8 = sub_100003690(v4, (uint64_t)@"file");
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = v9;
    if (!v9)
    {
LABEL_29:

      goto LABEL_30;
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue([v9 pathComponents]);
    signed int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndexedSubscript:0]);

    id v13 = v12;
    v14 = (const char *)[v13 UTF8String];
    if (!strcmp(v14, "Persist"))
    {
      uint64_t v15 = 0LL;
    }

    else if (!strcmp(v14, "Special"))
    {
      uint64_t v15 = 1LL;
    }

    else if (!strcmp(v14, "Signpost"))
    {
      uint64_t v15 = 2LL;
    }

    else
    {
      if (strcmp(v14, "HighVolume"))
      {
LABEL_28:

        goto LABEL_29;
      }

      uint64_t v15 = 3LL;
    }

    id v16 = sub_1000036FC(v4, (uint64_t)@"totalBytes");
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    if (v17)
    {
      v35 = v17;
      id v36 = v13;
      v18 = (char *)[v17 unsignedLongLongValue];
      v19 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableArray objectAtIndexedSubscript:]( self->_totalBytes,  "objectAtIndexedSubscript:",  v15));
      v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  &v18[(void)[v19 unsignedLongLongValue]]));
      -[NSMutableArray setObject:atIndexedSubscript:]( self->_totalBytes,  "setObject:atIndexedSubscript:",  v20,  v15);

      v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_totalBytes, "objectAtIndexedSubscript:", 4LL));
      v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  &v18[(void)[v21 unsignedLongLongValue]]));
      -[NSMutableArray setObject:atIndexedSubscript:](self->_totalBytes, "setObject:atIndexedSubscript:", v22, 4LL);

      v23 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"processList"]);
      if (v23
        && (objc_opt_class(&OBJC_CLASS___NSArray),
            id v24 = sub_100003768(v23),
            v25 = (void *)objc_claimAutoreleasedReturnValue(v24),
            v25,
            v25))
      {
        v34 = v10;
        __int128 v40 = 0u;
        __int128 v41 = 0u;
        __int128 v38 = 0u;
        __int128 v39 = 0u;
        id v26 = v23;
        id v27 = [v26 countByEnumeratingWithState:&v38 objects:v37 count:16];
        if (v27)
        {
          id v28 = v27;
          uint64_t v29 = *(void *)v39;
          do
          {
            for (i = 0LL; i != v28; i = (char *)i + 1)
            {
              if (*(void *)v39 != v29) {
                objc_enumerationMutation(v26);
              }
              v31 = *(void **)(*((void *)&v38 + 1) + 8LL * (void)i);
              objc_opt_class(&OBJC_CLASS___NSDictionary);
              id v32 = sub_100003768(v31);
              v33 = (void *)objc_claimAutoreleasedReturnValue(v32);

              if (v33) {
                -[StatisticsParser _handleEmitter:inBook:](self, "_handleEmitter:inBook:", v31, v15);
              }
            }

            id v28 = [v26 countByEnumeratingWithState:&v38 objects:v37 count:16];
          }

          while (v28);
        }

        v10 = v34;
      }

      else
      {
      }

      v17 = v35;
      id v13 = v36;
    }

    goto LABEL_28;
  }

- (void)_handleEmitter:(id)a3 inBook:(unsigned __int8)a4
{
  unsigned int v4 = a4;
  id v27 = a3;
  id v6 = sub_100003690(v27, (uint64_t)@"process");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = v7;
  if (v7)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 lastPathComponent]);
    id v10 = sub_1000036FC(v27, (uint64_t)@"sizeBytes");
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    signed int v12 = v11;
    if (v11)
    {
      id v13 = (char *)[v11 unsignedLongValue];
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_topEmitters, "objectAtIndexedSubscript:", v4));
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:v9]);

      id v16 = v13;
      if (v15)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_topEmitters, "objectAtIndexedSubscript:", v4));
        v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:v9]);
        id v16 = &v13[(void)[v18 unsignedLongLongValue]];
      }

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_topEmitters, "objectAtIndexedSubscript:", 4LL));
      v20 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:v9]);

      if (v20)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableArray objectAtIndexedSubscript:]( self->_topEmitters,  "objectAtIndexedSubscript:",  4LL));
        v22 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:v9]);
        id v13 = &v13[(void)[v22 unsignedLongLongValue]];
      }

      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLong:", v16));
      id v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_topEmitters, "objectAtIndexedSubscript:", v4));
      [v24 setObject:v23 forKeyedSubscript:v9];

      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLong:", v13));
      id v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_topEmitters, "objectAtIndexedSubscript:", 4LL));
      [v26 setObject:v25 forKeyedSubscript:v9];
    }
  }
}

- (void)_handleQuarantineRecord:(id)a3
{
  id v4 = a3;
  id v5 = sub_100003690(v4, (uint64_t)@"client");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (v6)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 lastPathComponent]);
    id v9 = sub_100003690(v4, (uint64_t)@"file");
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    if (v10)
    {
      id v11 = sub_1000036FC(v4, (uint64_t)@"timeCovered");
      signed int v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      if (v12)
      {
        id v13 = sub_1000036FC(v4, (uint64_t)@"sizeBytes");
        v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        if (v14)
        {
          id v15 = sub_1000036FC(v4, (uint64_t)@"totalBytes");
          id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
          if (v16)
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_quarantinedClients,  "objectForKeyedSubscript:",  v8));

            if (v17)
            {
              v22 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_quarantinedClients,  "objectForKeyedSubscript:",  v8));
              v18 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:@"quarantineCount"]);
              uint64_t v19 = [v18 intValue] + 1;
            }

            else
            {
              uint64_t v19 = 1LL;
            }

            v23[0] = @"quarantineCount";
            v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v19));
            v24[0] = v20;
            v24[1] = v10;
            v23[1] = @"fileName";
            v23[2] = @"bytes";
            v24[2] = v14;
            v24[3] = v16;
            v23[3] = @"totalBytes";
            v23[4] = @"timeCovered";
            v24[4] = v12;
            v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v24,  v23,  5LL));
            -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_quarantinedClients,  "setObject:forKeyedSubscript:",  v21,  v8);
          }
        }
      }
    }
  }
}

- (int)validLineCount
{
  return self->_validLineCount;
}

- (int64_t)oldestEntryUnixTime
{
  return self->_oldestEntryUnixTime;
}

- (int64_t)newestEntryUnixTime
{
  return self->_newestEntryUnixTime;
}

- (NSArray)totalBytes
{
  return &self->_totalBytes->super;
}

- (NSDictionary)snapshotClients
{
  return &self->_snapshotClients->super;
}

- (NSArray)topEmitters
{
  return &self->_topEmitters->super;
}

- (NSDictionary)quarantinedClients
{
  return &self->_quarantinedClients->super;
}

- (void).cxx_destruct
{
}

@end