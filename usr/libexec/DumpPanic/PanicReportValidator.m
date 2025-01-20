@interface PanicReportValidator
+ (id)ValidatorWithURL:(id)a3;
- (BOOL)validate;
- (BOOL)validate_ext_paniclog:(id)a3 key:(id)a4;
- (BOOL)validate_key_in_log:(id)a3 present:(BOOL)a4;
- (BOOL)validate_keys:(id)a3 expected:(id)a4;
- (BOOL)validate_paniclog:(id)a3;
- (BOOL)validate_prologue:(id)a3;
- (NSURL)sourcePath;
- (id)get_paniclog_json;
- (id)withURL:(id)a3;
- (void)setSourcePath:(id)a3;
@end

@implementation PanicReportValidator

- (id)withURL:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v6 = v4;

    -[PanicReportValidator setSourcePath:](self, "setSourcePath:", v6);
    return self;
  }

  else
  {
    uint64_t v8 = _os_assert_log(0LL, v5);
    id result = (id)_os_crash(v8);
    __break(1u);
  }

  return result;
}

- (BOOL)validate_keys:(id)a3 expected:(id)a4
{
  id v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue([a3 allKeys]);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    while (2)
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8LL * (void)i);
        if (([v6 containsObject:v12] & 1) == 0)
        {
          NSLog(@"missing key: %@", v12);
          BOOL v13 = 0;
          goto LABEL_11;
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  BOOL v13 = 1;
LABEL_11:

  return v13;
}

- (id)get_paniclog_json
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PanicReportValidator sourcePath](self, "sourcePath"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 path]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v3));

  id v5 = (void *)objc_claimAutoreleasedReturnValue([@"\n" dataUsingEncoding:4]);
  unint64_t v6 = (unint64_t)objc_msgSend(v4, "rangeOfData:options:range:", v5, 0, 0, objc_msgSend(v4, "length"));

  id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subdataWithRange:", v6 + 1, (char *)objc_msgSend(v4, "length") + ~v6));
  id v13 = 0LL;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v7,  0LL,  &v13));
  id v9 = v13;
  uint64_t v10 = v9;
  if (v9 || !v8)
  {
    NSLog(@"unable to decode paniclog: %@", v9);
    id v11 = 0LL;
  }

  else
  {
    id v11 = v8;
  }

  return v11;
}

- (BOOL)validate_key_in_log:(id)a3 present:(BOOL)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PanicReportValidator get_paniclog_json](self, "get_paniclog_json"));
  id v8 = v7;
  if (v7)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v6]);
    BOOL v10 = v9 == 0LL;

    BOOL v11 = v10 ^ a4;
  }

  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)validate_ext_paniclog:(id)a3 key:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PanicReportValidator get_paniclog_json](self, "get_paniclog_json"));
  id v9 = v8;
  if (v8)
  {
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v8 valueForKey:@"ExtensiblePaniclog"]);
    BOOL v11 = v10;
    if (v7)
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v10 valueForKey:v7]);
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 valueForKey:v7]);
      id v14 = [v12 count];
      if (v14 == [v13 count])
      {
        if ([v12 count])
        {
          unint64_t v15 = 0LL;
          do
          {
            __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v12 objectAtIndexedSubscript:v15]);
            __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v13 objectAtIndexedSubscript:v15]);
            unsigned __int8 v18 = [v16 isEqualToDictionary:v17];

            if ((v18 & 1) == 0) {
              break;
            }
            ++v15;
          }

          while ((unint64_t)[v12 count] > v15);
        }

        else
        {
          unsigned __int8 v18 = 1;
        }
      }

      else
      {
        NSLog(@"Array count does not match");
        unsigned __int8 v18 = 0;
      }
    }

    else
    {
      unsigned __int8 v18 = [v10 isEqualToDictionary:v6];
    }
  }

  else
  {
    unsigned __int8 v18 = 0;
  }

  return v18;
}

- (BOOL)validate_prologue:(id)a3
{
  return -[PanicReportValidator validate_keys:expected:](self, "validate_keys:expected:", a3, &off_100033A60);
}

- (BOOL)validate_paniclog:(id)a3
{
  return -[PanicReportValidator validate_keys:expected:](self, "validate_keys:expected:", a3, &off_100033A78);
}

- (BOOL)validate
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PanicReportValidator sourcePath](self, "sourcePath"));
  NSLog(@"validating panic report: %@", v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PanicReportValidator sourcePath](self, "sourcePath"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 path]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v5));

  id v7 = (void *)objc_claimAutoreleasedReturnValue([@"\n" dataUsingEncoding:4]);
  unint64_t v8 = (unint64_t)objc_msgSend(v6, "rangeOfData:options:range:", v7, 0, 0, objc_msgSend(v6, "length"));

  id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subdataWithRange:", 0, v8));
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subdataWithRange:", v8 + 1, (char *)objc_msgSend(v6, "length") + ~v8));
  id v19 = 0LL;
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v9,  0LL,  &v19));
  id v12 = v19;
  id v13 = v12;
  if (!v12 && v11)
  {
    id v18 = 0LL;
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v10,  0LL,  &v18));
    id v15 = v18;
    id v13 = v15;
    if (v15 || !v14)
    {
      NSLog(@"unable to decode paniclog: %@", v15);
    }

    else if (-[PanicReportValidator validate_prologue:](self, "validate_prologue:", v11))
    {
      BOOL v16 = -[PanicReportValidator validate_paniclog:](self, "validate_paniclog:", v14);
LABEL_10:

      goto LABEL_11;
    }

    BOOL v16 = 0;
    goto LABEL_10;
  }

  NSLog(@"unable to decode prologue: %@", v12);
  BOOL v16 = 0;
LABEL_11:

  return v16;
}

- (NSURL)sourcePath
{
  return (NSURL *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setSourcePath:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)ValidatorWithURL:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc(&OBJC_CLASS___PanicReportValidator);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PanicReportValidator withURL:](v4, "withURL:", v3));

  return v5;
}

@end