@interface UASharedPasteboardDataRequester
- (SFActivityScanner)scanner;
- (SFPeerDevice)peer;
- (void)requestRemotePasteboardInfo:(id)a3;
- (void)requestStreamEndpointData:(id)a3;
- (void)requestStreamEndpointDataV2:(id)a3;
- (void)setPeer:(id)a3;
- (void)setScanner:(id)a3;
@end

@implementation UASharedPasteboardDataRequester

- (void)requestStreamEndpointData:(id)a3
{
  id v4 = a3;
  strcpy(v28, "pbpaste!");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v28, 8LL));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UAUserActivityDefaults sharedDefaults](&OBJC_CLASS___UAUserActivityDefaults, "sharedDefaults"));
  [v6 pasteboardPasteRequestTimeout];
  double v8 = v7;

  os_log_t v9 = sub_100039584(@"pasteboard-server");
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardDataRequester peer](self, "peer"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v8));
    *(_DWORD *)buf = 138412546;
    v25 = v11;
    __int16 v26 = 2114;
    v27 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[DATA REQUESTER] Requesting payload from: %@, with timeout: %{public}@",  buf,  0x16u);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UAUserActivityDefaults sharedDefaults](&OBJC_CLASS___UAUserActivityDefaults, "sharedDefaults"));
  [v13 payloadFetchResponseDelay];
  double v15 = v14;

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", v15));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardDataRequester scanner](self, "scanner"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardDataRequester peer](self, "peer"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_10003F464;
  v21[3] = &unk_1000BDC00;
  id v22 = v16;
  id v23 = v4;
  id v19 = v4;
  id v20 = v16;
  [v17 activityPayloadFromDevice:v18 forAdvertisementPayload:v5 command:@"pbpaste" timeout:(uint64_t)v8 withCompletionHandler:v21];
}

- (void)requestStreamEndpointDataV2:(id)a3
{
  id v4 = a3;
  strcpy(v28, "pbpaste!");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v28, 8LL));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UAUserActivityDefaults sharedDefaults](&OBJC_CLASS___UAUserActivityDefaults, "sharedDefaults"));
  [v6 pasteboardPasteRequestTimeout];
  double v8 = v7;

  os_log_t v9 = sub_100039584(@"pasteboard-server");
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardDataRequester peer](self, "peer"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v8));
    *(_DWORD *)buf = 138412546;
    v25 = v11;
    __int16 v26 = 2114;
    v27 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[DATA REQUESTER] Requesting payload from: %@, with timeout: %{public}@, version: 2",  buf,  0x16u);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UAUserActivityDefaults sharedDefaults](&OBJC_CLASS___UAUserActivityDefaults, "sharedDefaults"));
  [v13 payloadFetchResponseDelay];
  double v15 = v14;

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", v15));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardDataRequester scanner](self, "scanner"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardDataRequester peer](self, "peer"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_10003F80C;
  v21[3] = &unk_1000BDC00;
  id v22 = v16;
  id v23 = v4;
  id v19 = v4;
  id v20 = v16;
  [v17 activityPayloadFromDevice:v18 forAdvertisementPayload:v5 command:@"pbpaste2" timeout:(uint64_t)v8 withCompletionHandler:v21];
}

- (void)requestRemotePasteboardInfo:(id)a3
{
  id v4 = a3;
  strcpy(v28, "pbtypes!");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v28, 8LL));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UAUserActivityDefaults sharedDefaults](&OBJC_CLASS___UAUserActivityDefaults, "sharedDefaults"));
  [v6 pasteboardTypeRequestTimeout];
  double v8 = v7;

  os_log_t v9 = sub_100039584(@"pasteboard-server");
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardDataRequester peer](self, "peer"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v8));
    *(_DWORD *)buf = 138412546;
    v25 = v11;
    __int16 v26 = 2114;
    v27 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[DATA REQUESTER] Requesting pbinfo from: %@, with timeout: %{public}@",  buf,  0x16u);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UAUserActivityDefaults sharedDefaults](&OBJC_CLASS___UAUserActivityDefaults, "sharedDefaults"));
  [v13 payloadFetchResponseDelay];
  double v15 = v14;

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", v15));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardDataRequester scanner](self, "scanner"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UASharedPasteboardDataRequester peer](self, "peer"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_10003FBB4;
  v21[3] = &unk_1000BDC00;
  id v22 = v16;
  id v23 = v4;
  id v19 = v4;
  id v20 = v16;
  [v17 activityPayloadFromDevice:v18 forAdvertisementPayload:v5 command:@"pbtypes" timeout:(uint64_t)v8 withCompletionHandler:v21];
}

- (SFPeerDevice)peer
{
  return (SFPeerDevice *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setPeer:(id)a3
{
}

- (SFActivityScanner)scanner
{
  return (SFActivityScanner *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setScanner:(id)a3
{
}

- (void).cxx_destruct
{
}

@end