@interface KTIDSReporting
- (IDSEventReportingManager)manager;
- (KTIDSReporting)init;
- (void)reportResultWithSuccess:(id)a3 startFrom:(double)a4 completionHandler:(id)a5;
- (void)setManager:(id)a3;
@end

@implementation KTIDSReporting

- (KTIDSReporting)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___KTIDSReporting;
  v2 = -[KTIDSReporting init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___IDSEventReportingManager);
    -[KTIDSReporting setManager:](v2, "setManager:", v3);

    v4 = v2;
  }

  return v2;
}

- (void)reportResultWithSuccess:(id)a3 startFrom:(double)a4 completionHandler:(id)a5
{
  id v8 = a5;
  v20[0] = a3;
  v19[0] = @"status";
  v19[1] = @"startFrom";
  id v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", (uint64_t)a4));
  v19[2] = @"interval";
  v20[1] = v10;
  v20[2] = &off_100299AB0;
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v20,  v19,  3LL));

  id v12 = objc_alloc(&OBJC_CLASS___IDSReportClientEvent);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 30LL));
  id v14 = [v12 initWithReport:v11 reportType:@"kt-reliability" timeout:v13];

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[KTIDSReporting manager](self, "manager"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10000C734;
  v17[3] = &unk_100276DF8;
  id v18 = v8;
  id v16 = v8;
  [v15 reportClientEvent:v14 withCompletion:v17];
}

- (IDSEventReportingManager)manager
{
  return (IDSEventReportingManager *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end