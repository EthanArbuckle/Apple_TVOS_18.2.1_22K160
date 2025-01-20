@interface FFDefaultParseErrorReporter
- (void)reportError:(id)a3;
@end

@implementation FFDefaultParseErrorReporter

- (void)reportError:(id)a3
{
  id v15 = a3;
  [v15 objectForKeyedSubscript:FFParseErrorContextFilenameKey];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)NSString;
    [v15 objectForKeyedSubscript:FFParseErrorContextFilenameKey];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 stringWithFormat:@" in file %@:", v5];
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v6 = &stru_189E9B708;
  }

  [v15 objectForKeyedSubscript:FFParseErrorContextKeyKey];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)NSString;
    [v15 objectForKeyedSubscript:FFParseErrorContextKeyKey];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 stringWithFormat:@" while reading key %@:", v9];
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v10 = &stru_189E9B708;
  }

  v11 = (void *)NSString;
  [v15 objectForKeyedSubscript:FFParseErrorContextSeverityKey];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 objectForKeyedSubscript:FFParseErrorMessageKey];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 stringWithFormat:@"%@:%@%@ %@", v12, v6, v10, v13];
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  NSLog(@"%@", v14);
}

@end