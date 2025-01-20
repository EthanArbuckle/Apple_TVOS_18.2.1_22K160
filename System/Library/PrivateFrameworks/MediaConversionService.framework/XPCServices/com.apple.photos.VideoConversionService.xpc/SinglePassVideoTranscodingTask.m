@interface SinglePassVideoTranscodingTask
+ (BOOL)supportsDeduplication;
- (BOOL)hasProgress;
- (PFSinglePassVideoExportItem)singlePassExportItem;
- (double)currentFractionCompleted;
- (void)cancelTranscode;
- (void)performExport;
- (void)setSinglePassExportItem:(id)a3;
@end

@implementation SinglePassVideoTranscodingTask

+ (BOOL)supportsDeduplication
{
  return 0;
}

- (void)performExport
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VideoConversionTask options](self, "options"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"PAMediaConversionServiceOptionTargetFileSizeKey"]);
  id v5 = [v4 unsignedLongLongValue];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[VideoConversionTask sourceMainResourceURL](self, "sourceMainResourceURL"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[VideoConversionTask outputMainResourceURL](self, "outputMainResourceURL"));
  id v54 = 0LL;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[PFVideoExport singlePassExportItemForAssetAtFileURL:destinationURL:targetFileSize:error:]( &OBJC_CLASS___PFVideoExport,  "singlePassExportItemForAssetAtFileURL:destinationURL:targetFileSize:error:",  v6,  v7,  v5,  &v54));
  id v38 = v54;

  if (v8)
  {
    v9 = (void *)objc_opt_class(self);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[VideoConversionTask options](self, "options"));
    v11 = (void *)objc_claimAutoreleasedReturnValue( [v9 metadataItemsByApplyingSignatureMetadataFromOptions:v10 toMetadataItems:&__NSArray0__struct]);

    if ([v11 count]) {
      [v8 setAdditionalMetadata:v11];
    }
    v12 = (void *)objc_opt_class(self);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[VideoConversionTask options](self, "options"));
    [v8 inputAssetDuration];
    double v15 = v14;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[VideoConversionTask identifier](self, "identifier"));
    objc_msgSend( v8,  "setMaximizePowerEfficiency:",  objc_msgSend( v12,  "shouldMaximizeVideoConversionPowerEfficiencyForOptions:inputAssetDuration:taskIdentifier:",  v13,  v16,  v15));

    v17 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
    v18 = (void *)objc_claimAutoreleasedReturnValue([v8 progress]);
    v19 = (void *)objc_claimAutoreleasedReturnValue([v18 cancellationHandler]);

    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472LL;
    v50[2] = sub_100015518;
    v50[3] = &unk_100031010;
    id v20 = v17;
    id v51 = v20;
    v52 = self;
    id v21 = v19;
    id v53 = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue([v8 progress]);
    [v22 setCancellationHandler:v50];

    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472LL;
    v48[2] = sub_1000155F0;
    v48[3] = &unk_100031038;
    v48[4] = self;
    id v23 = v20;
    id v49 = v23;
    v24 = objc_retainBlock(v48);
    uint64_t v44 = 0LL;
    v45 = &v44;
    uint64_t v46 = 0x2020000000LL;
    char v47 = 0;
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472LL;
    v39[2] = sub_100015838;
    v39[3] = &unk_100031060;
    v39[4] = self;
    id v40 = v8;
    v43 = &v44;
    v25 = v24;
    id v42 = v25;
    id v26 = v23;
    id v41 = v26;
    -[VideoTranscodingTask transitionToRunningStateAndConditionallyRunBlock:]( self,  "transitionToRunningStateAndConditionallyRunBlock:",  v39);
    id v27 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[VideoConversionTask identifier](self, "identifier"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[VideoConversionTask sourceMainResourceURL](self, "sourceMainResourceURL"));
      v30 = (void *)objc_claimAutoreleasedReturnValue([v29 path]);
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[VideoConversionTask outputMainResourceURL](self, "outputMainResourceURL"));
      v32 = (void *)objc_claimAutoreleasedReturnValue([v31 path]);
      int v33 = *((unsigned __int8 *)v45 + 24);
      *(_DWORD *)buf = 138544386;
      id v56 = v26;
      __int16 v57 = 2114;
      v58 = v28;
      __int16 v59 = 2112;
      v60 = v30;
      __int16 v61 = 2112;
      v62 = v32;
      __int16 v63 = 1024;
      int v64 = v33;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Single pass video export item %{public}@ for conversion task %{public}@ exporting %@ to %@ didStart: %d",  buf,  0x30u);
    }

    _Block_object_dispose(&v44, 8);
  }

  else
  {
    -[VideoConversionTask setStatus:](self, "setStatus:", 2LL);
    NSErrorUserInfoKey v65 = NSLocalizedDescriptionKey;
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[VideoConversionTask sourceMainResourceURL](self, "sourceMainResourceURL"));
    v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unable to create single pass export item for source %@",  v34));
    v66 = v35;
    v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v66,  &v65,  1LL));
    v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"PAMediaConversionServiceErrorDomain",  3LL,  v36));
    -[VideoConversionTask setError:](self, "setError:", v37);

    -[VideoTranscodingTask callCompletionHandler](self, "callCompletionHandler");
  }
}

- (BOOL)hasProgress
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SinglePassVideoTranscodingTask singlePassExportItem](self, "singlePassExportItem"));
  BOOL v3 = v2 != 0LL;

  return v3;
}

- (double)currentFractionCompleted
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[SinglePassVideoTranscodingTask singlePassExportItem](self, "singlePassExportItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 progress]);

  [v4 fractionCompleted];
  double v6 = v5;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[VideoConversionTask identifier](self, "identifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SinglePassVideoTranscodingTask singlePassExportItem](self, "singlePassExportItem"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
    int v11 = 138544130;
    v12 = v7;
    __int16 v13 = 2114;
    double v14 = v9;
    __int16 v15 = 2048;
    double v16 = v6 * 100.0;
    __int16 v17 = 2048;
    id v18 = [v4 completedUnitCount];
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Single pass export conversion task %{public}@ (export item %{public}@) progress %.1f (%lld bytes)",  (uint8_t *)&v11,  0x2Au);
  }

  return v6;
}

- (void)cancelTranscode
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SinglePassVideoTranscodingTask singlePassExportItem](self, "singlePassExportItem"));

  if (!v4)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v10 handleFailureInMethod:a2 object:self file:@"VideoConversionService.m" lineNumber:1270 description:@"Unexpected missing single pass export session with job in running state"];
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    double v5 = (void *)objc_claimAutoreleasedReturnValue(-[VideoConversionTask identifier](self, "identifier"));
    double v6 = (void *)objc_claimAutoreleasedReturnValue(-[SinglePassVideoTranscodingTask singlePassExportItem](self, "singlePassExportItem"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
    int v11 = 138543618;
    v12 = v5;
    __int16 v13 = 2114;
    double v14 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Cancelling single pass conversion task %{public}@ (export item %{public}@)",  (uint8_t *)&v11,  0x16u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SinglePassVideoTranscodingTask singlePassExportItem](self, "singlePassExportItem"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 progress]);
  [v9 cancel];
}

- (PFSinglePassVideoExportItem)singlePassExportItem
{
  return (PFSinglePassVideoExportItem *)objc_getProperty(self, a2, 152LL, 1);
}

- (void)setSinglePassExportItem:(id)a3
{
}

- (void).cxx_destruct
{
}

@end