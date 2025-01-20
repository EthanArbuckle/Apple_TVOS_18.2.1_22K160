@interface MSDReportDoneRequest
- (BOOL)isValid;
- (NSError)error;
- (NSString)requestStr;
- (id)getPostData;
- (void)setError:(id)a3;
- (void)setRequestStr:(id)a3;
@end

@implementation MSDReportDoneRequest

- (BOOL)isValid
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MSDReportDoneRequest;
  if (!-[MSDCommandServerRequest isValid](&v6, "isValid")) {
    return 0;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDReportDoneRequest requestStr](self, "requestStr"));
  BOOL v4 = v3 != 0LL;

  return v4;
}

- (id)getPostData
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDReportDoneRequest requestStr](self, "requestStr"));
  -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v4, @"RequestOperation");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCommandServerRequest deviceUDID](self, "deviceUDID"));
  -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v5, @"UniqueDeviceID");

  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDReportDoneRequest error](self, "error"));
  if (v6)
  {
    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDReportDoneRequest error](self, "error"));
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"0x%08llX",  [v8 code]));
    -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v9, @"ErrorCode");

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDReportDoneRequest error](self, "error"));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 domain]);
    -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v11, @"ErrorDomain");

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDReportDoneRequest error](self, "error"));
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 localizedDescription]);
    -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v13, NSLocalizedDescriptionKey);

    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v7, @"Error");
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary convertToNSData](v3, "convertToNSData"));

  return v14;
}

- (NSString)requestStr
{
  return (NSString *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setRequestStr:(id)a3
{
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
}

@end