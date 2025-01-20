@interface NPTWiFiDiagnosticsExtension
- (NPTPerformanceTest)pass;
- (NSMutableDictionary)results;
- (NSString)finalPath;
- (id)attachmentList;
- (id)attachmentsForParameters:(id)a3;
- (void)saveResults;
- (void)setFinalPath:(id)a3;
- (void)setPass:(id)a3;
- (void)setResults:(id)a3;
@end

@implementation NPTWiFiDiagnosticsExtension

- (id)attachmentList
{
  return &__NSArray0__struct;
}

- (id)attachmentsForParameters:(id)a3
{
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NPTWiFiDiagnosticsExtension setResults:](self, "setResults:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NPTPerformanceTestConfiguration defaultConfigurationWiFi]( &OBJC_CLASS___NPTPerformanceTestConfiguration,  "defaultConfigurationWiFi"));
  [v5 setTestDuration:5];
  [v5 setUseSecureConnection:1];
  [v5 setClientName:@"NPTKit_WiFi_Diagnostics_Extension"];
  [v5 setConcurrentStreams:4];
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0LL);
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NPTPerformanceTest performanceTestWithConfiguration:]( &OBJC_CLASS___NPTPerformanceTest,  "performanceTestWithConfiguration:",  v5));
  -[NPTWiFiDiagnosticsExtension setPass:](self, "setPass:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NPTWiFiDiagnosticsExtension pass](self, "pass"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 metadata]);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NPTWiFiDiagnosticsExtension results](self, "results"));
  [v10 setObject:v9 forKeyedSubscript:@"metadata"];

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NPTWiFiDiagnosticsExtension pass](self, "pass"));
  v20 = _NSConcreteStackBlock;
  uint64_t v21 = 3221225472LL;
  v22 = sub_1000032E0;
  v23 = &unk_100004120;
  v24 = self;
  dispatch_semaphore_t v25 = v6;
  v12 = v6;
  [v11 startDownloadWithCompletion:&v20];

  dispatch_time_t v13 = dispatch_time(0LL, 25000000000LL);
  dispatch_semaphore_wait(v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NPTWiFiDiagnosticsExtension finalPath](self, "finalPath", v20, v21, v22, v23, v24));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v14));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 path]);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[DEAttachmentItem attachmentWithPath:](&OBJC_CLASS___DEAttachmentItem, "attachmentWithPath:", v16));
  v26 = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v26, 1LL));

  return v18;
}

- (void)saveResults
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v14 = (id)objc_claimAutoreleasedReturnValue([v3 temporaryDirectory]);

  v4 = (void *)objc_claimAutoreleasedReturnValue([v14 path]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByAppendingPathComponent:@"performanceTestWiFi.json"]);
  -[NPTWiFiDiagnosticsExtension setFinalPath:](self, "setFinalPath:", v5);

  dispatch_semaphore_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NPTWiFiDiagnosticsExtension finalPath](self, "finalPath"));
  [v6 removeItemAtPath:v7 error:0];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NPTWiFiDiagnosticsExtension results](self, "results"));
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v8,  3LL,  0LL));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NPTWiFiDiagnosticsExtension finalPath](self, "finalPath"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v11));
  dispatch_time_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 path]);
  [v10 createFileAtPath:v13 contents:v9 attributes:0];
}

- (NPTPerformanceTest)pass
{
  return (NPTPerformanceTest *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setPass:(id)a3
{
}

- (NSString)finalPath
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setFinalPath:(id)a3
{
}

- (NSMutableDictionary)results
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setResults:(id)a3
{
}

- (void).cxx_destruct
{
}

@end