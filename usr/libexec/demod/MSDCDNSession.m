@interface MSDCDNSession
- (BOOL)getIsFileDownload;
- (void)authenticate:(id)a3 forTask:(id)a4 completion:(id)a5;
- (void)collectMetricsData:(id)a3;
- (void)collectTimingDataForTask:(id)a3 withNetworkError:(id)a4;
@end

@implementation MSDCDNSession

- (void)authenticate:(id)a3 forTask:(id)a4 completion:(id)a5
{
  id v12 = a3;
  v6 = (void (**)(id, void, void *))a5;
  v7 = objc_alloc_init(&OBJC_CLASS___MSDSessionFileDownloadTrustEvaluate);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v12 protectionSpace]);
  unsigned int v9 = -[MSDSessionFileDownloadTrustEvaluate trustServer:isRedirect:]( v7,  "trustServer:isRedirect:",  [v8 serverTrust],  0);

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v12 protectionSpace]);
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLCredential credentialForTrust:]( NSURLCredential,  "credentialForTrust:",  [v10 serverTrust]));

    v6[2](v6, 0LL, v11);
  }

  else
  {
    v6[2](v6, 1LL, 0LL);
  }
}

- (BOOL)getIsFileDownload
{
  return 1;
}

- (void)collectTimingDataForTask:(id)a3 withNetworkError:(id)a4
{
  id v16 = a3;
  id v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v16 info]);
  uint64_t v8 = objc_opt_class(0x100121000LL, v7);
  char isKindOfClass = objc_opt_isKindOfClass(v6, v8);

  if ((isKindOfClass & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v16 task]);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 _timingData]);

    id v12 = (void *)objc_claimAutoreleasedReturnValue([v16 info]);
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 serverType]);

    if (v11)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[MSDSessionMetrics sharedInstance](&OBJC_CLASS___MSDSessionMetrics, "sharedInstance"));
      [v14 extractAndUploadTimingData:v11 forServerType:v13];
    }

    if (v5)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue( +[MSDAnalyticsEventHandler sharedInstance]( &OBJC_CLASS___MSDAnalyticsEventHandler,  "sharedInstance"));
      [v15 sendNetworkFailureEvent:v5 forServerType:v13];
    }
  }
}

- (void)collectMetricsData:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[MSDSessionMetrics sharedInstance](&OBJC_CLASS___MSDSessionMetrics, "sharedInstance"));
  [v4 saveTransactionMetric:v3];
}

@end