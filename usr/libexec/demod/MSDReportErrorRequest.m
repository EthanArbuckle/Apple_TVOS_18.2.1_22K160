@interface MSDReportErrorRequest
- (BOOL)isValid;
- (NSError)error;
- (id)getPostData;
- (void)setError:(id)a3;
@end

@implementation MSDReportErrorRequest

- (BOOL)isValid
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MSDReportErrorRequest;
  if (!-[MSDCommandServerRequest isValid](&v6, "isValid")) {
    return 0;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDReportErrorRequest error](self, "error"));
  BOOL v4 = v3 != 0LL;

  return v4;
}

- (id)getPostData
{
  v13[0] = @"ErrorCode";
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDReportErrorRequest error](self, "error"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 code]));
  v14[0] = v4;
  v13[1] = @"ErrorDomain";
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDReportErrorRequest error](self, "error"));
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 domain]);
  v14[1] = v6;
  v13[2] = NSLocalizedDescriptionKey;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDReportErrorRequest error](self, "error"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 localizedDescription]);
  v14[2] = v8;
  v13[3] = @"UniqueDeviceID";
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCommandServerRequest deviceUDID](self, "deviceUDID"));
  v14[3] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v14,  v13,  4LL));

  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 convertToNSData]);
  return v11;
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
}

@end