@interface GIFExportVideoTranscodingTask
- (BOOL)hasProgress;
- (NSProgress)progress;
- (PFExportGIFRequest)exportGIFRequest;
- (double)currentFractionCompleted;
- (void)cancelTranscode;
- (void)performExport;
- (void)setExportGIFRequest:(id)a3;
- (void)setProgress:(id)a3;
@end

@implementation GIFExportVideoTranscodingTask

- (void)performExport
{
  v3 = objc_alloc(&OBJC_CLASS___PFExportGIFRequest);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VideoConversionTask sourceMainResourceURL](self, "sourceMainResourceURL"));
  v5 = -[PFExportGIFRequest initWithVideoURL:](v3, "initWithVideoURL:", v4);

  -[GIFExportVideoTranscodingTask setExportGIFRequest:](self, "setExportGIFRequest:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[VideoConversionTask outputMainResourceURL](self, "outputMainResourceURL"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100015D98;
  v8[3] = &unk_100031088;
  v8[4] = self;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[PFExportGIFRequest runExport:toURL:completion:]( &OBJC_CLASS___PFExportGIFRequest,  "runExport:toURL:completion:",  v5,  v6,  v8));
  -[GIFExportVideoTranscodingTask setProgress:](self, "setProgress:", v7);
}

- (BOOL)hasProgress
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GIFExportVideoTranscodingTask progress](self, "progress"));
  BOOL v3 = v2 != 0LL;

  return v3;
}

- (double)currentFractionCompleted
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[GIFExportVideoTranscodingTask progress](self, "progress"));
  [v3 fractionCompleted];
  double v5 = v4;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[VideoConversionTask identifier](self, "identifier"));
    int v8 = 138543618;
    v9 = v6;
    __int16 v10 = 2048;
    double v11 = v5 * 100.0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "GIF export progress for conversion task %{public}@: %.1f",  (uint8_t *)&v8,  0x16u);
  }

  return v5;
}

- (void)cancelTranscode
{
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[GIFExportVideoTranscodingTask progress](self, "progress"));

  if (!v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v7 handleFailureInMethod:a2 object:self file:@"VideoConversionService.m" lineNumber:1318 description:@"Unexpected missing GIF export progress with job in running state"];
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    double v5 = (void *)objc_claimAutoreleasedReturnValue(-[VideoConversionTask identifier](self, "identifier"));
    int v8 = 138543362;
    v9 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Cancelling GIF export conversion task %{public}@",  (uint8_t *)&v8,  0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GIFExportVideoTranscodingTask progress](self, "progress"));
  [v6 cancel];
}

- (NSProgress)progress
{
  return (NSProgress *)objc_getProperty(self, a2, 152LL, 1);
}

- (void)setProgress:(id)a3
{
}

- (PFExportGIFRequest)exportGIFRequest
{
  return (PFExportGIFRequest *)objc_getProperty(self, a2, 160LL, 1);
}

- (void)setExportGIFRequest:(id)a3
{
}

- (void).cxx_destruct
{
}

@end