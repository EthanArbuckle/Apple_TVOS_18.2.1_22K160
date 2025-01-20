@interface SATVLogBuilder
- (NSString)context;
- (NSString)name;
- (OS_os_log)logger;
- (SATVLogBuilder)initWithContext:(id)a3 name:(id)a4;
- (id)_dataSetFromArray:(id)a3;
- (id)_templateForDataSetData:(id)a3;
- (id)jsonForArray:(id)a3;
- (id)jsonForDictionary:(id)a3;
- (id)jsonForError:(id)a3;
@end

@implementation SATVLogBuilder

- (SATVLogBuilder)initWithContext:(id)a3 name:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___SATVLogBuilder;
  v9 = -[SATVLogBuilder init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_context, a3);
    objc_storeStrong((id *)&v10->_name, a4);
  }

  return v10;
}

- (OS_os_log)logger
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLogBuilder context](self, "context"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLogBuilder name](self, "name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@.%@", v3, v4));

  id v6 = v5;
  os_log_t v7 = os_log_create("com.apple.TriageKit.pro", (const char *)[v6 UTF8String]);

  return v7;
}

- (id)jsonForDictionary:(id)a3
{
  id v4 = a3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100047EF0;
  v8[3] = &unk_1000CA5C8;
  v9 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v5 = v9;
  [v4 enumerateKeysAndObjectsUsingBlock:v8];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLogBuilder jsonForArray:](self, "jsonForArray:", v5));
  return v6;
}

- (id)jsonForArray:(id)a3
{
  objc_super v12 = @"triagekit";
  v10[0] = @"version";
  v10[1] = @"data_sets";
  v11[0] = @"1.0";
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLogBuilder _dataSetFromArray:](self, "_dataSetFromArray:", a3));
  v9 = v3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
  v11[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v11,  v10,  2LL));
  v13 = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v13,  &v12,  1LL));

  os_log_t v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tk_jsonRepresentation"));
  return v7;
}

- (id)jsonForError:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 domain]);
  v18 = v5;
  v19 = @":red:";
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v19,  &v18,  1LL));
  v20[0] = v6;
  os_log_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%ld",  [v4 code]));
  v16 = v7;
  v17 = @":forbidden:";
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1LL));
  v20[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedDescription]);

  v14 = v9;
  v15 = @":speechbubble:";
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v15,  &v14,  1LL));
  v20[2] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v20, 3LL));

  objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLogBuilder jsonForArray:](self, "jsonForArray:", v11));
  return v12;
}

- (id)_dataSetFromArray:(id)a3
{
  id v3 = a3;
  id v4 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v3 count]);
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue([v10 allKeys]);
        objc_super v12 = (void *)objc_claimAutoreleasedReturnValue([v11 firstObject]);

        v27[1] = @"value";
        v28[0] = v12;
        v27[0] = @"key";
        v13 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v12]);
        v28[1] = v13;
        v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v28,  v27,  2LL));

        -[NSMutableArray addObject:](v4, "addObject:", v14);
      }

      id v7 = [v5 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }

    while (v7);
  }

  v25[0] = @"context";
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLogBuilder context](self, "context"));
  v26[0] = v15;
  v25[1] = @"name";
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLogBuilder name](self, "name"));
  v26[1] = v16;
  v25[2] = @"template";
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLogBuilder _templateForDataSetData:](self, "_templateForDataSetData:", v4));
  v25[3] = @"data";
  v26[2] = v17;
  v26[3] = v4;
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v26,  v25,  4LL));

  return v18;
}

- (id)_templateForDataSetData:(id)a3
{
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v3 = a3;
  id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v13;
    id v7 = @"list";
LABEL_3:
    uint64_t v8 = 0LL;
    while (1)
    {
      if (*(void *)v13 != v6) {
        objc_enumerationMutation(v3);
      }
      v9 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v12 + 1) + 8 * v8),  "objectForKeyedSubscript:",  @"value",  (void)v12));
      unsigned __int8 v10 = [v9 hasPrefix:@":"];

      if ((v10 & 1) != 0) {
        break;
      }
      if (v5 == (id)++v8)
      {
        id v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v5) {
          goto LABEL_3;
        }
        id v7 = @"table";
        break;
      }
    }
  }

  else
  {
    id v7 = @"table";
  }

  return (id)v7;
}

- (NSString)context
{
  return self->_context;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
}

@end