@interface ResetReportValidator
+ (id)ValidatorWithURL:(id)a3;
- (BOOL)validate;
- (BOOL)validate_keys:(id)a3 expected:(id)a4;
- (BOOL)validate_prologue:(id)a3;
- (NSURL)sourcePath;
- (id)withURL:(id)a3;
- (void)setSourcePath:(id)a3;
@end

@implementation ResetReportValidator

- (id)withURL:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v6 = v4;

    -[ResetReportValidator setSourcePath:](self, "setSourcePath:", v6);
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

- (BOOL)validate_prologue:(id)a3
{
  return -[ResetReportValidator validate_keys:expected:](self, "validate_keys:expected:", a3, &off_100033A90);
}

- (BOOL)validate
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ResetReportValidator sourcePath](self, "sourcePath"));
  NSLog(@"validating reset report: %@", v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ResetReportValidator sourcePath](self, "sourcePath"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 path]);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v5));

  id v7 = (void *)objc_claimAutoreleasedReturnValue([@"\n" dataUsingEncoding:4]);
  id v8 = objc_msgSend(v6, "rangeOfData:options:range:", v7, 0, 0, objc_msgSend(v6, "length"));

  id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subdataWithRange:", 0, v8));
  id v15 = 0LL;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v9,  0LL,  &v15));
  id v11 = v15;
  uint64_t v12 = v11;
  if (v11 || !v10)
  {
    NSLog(@"unable to decode prologue: %@", v11);
    BOOL v13 = 0;
  }

  else
  {
    BOOL v13 = -[ResetReportValidator validate_prologue:](self, "validate_prologue:", v10);
  }

  return v13;
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
  id v4 = objc_alloc(&OBJC_CLASS___ResetReportValidator);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ResetReportValidator withURL:](v4, "withURL:", v3));

  return v5;
}

@end