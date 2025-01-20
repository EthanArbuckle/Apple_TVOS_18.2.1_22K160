@interface VCPFailedAssetAnalysisTask
+ (id)taskWithPhotoLibrary:(id)a3 options:(id)a4;
- (int)mainInternal;
@end

@implementation VCPFailedAssetAnalysisTask

+ (id)taskWithPhotoLibrary:(id)a3 options:(id)a4
{
  id v5 = a3;
  id v6 = [objc_alloc((Class)objc_opt_class(a1)) initWithPhotoLibrary:v5];

  return v6;
}

- (int)mainInternal
{
  uint64_t v3 = VCPSignPostLog(self);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  os_signpost_id_t spid = os_signpost_id_generate(v4);

  uint64_t v6 = VCPSignPostLog(v5);
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v8,  OS_SIGNPOST_INTERVAL_BEGIN,  spid,  "VCPFailedAssetAnalysisTask",  (const char *)&unk_100199097,  buf,  2u);
  }

  uint64_t v11 = MediaAnalysisLogLevel(v9, v10);
  if ((int)v11 >= 6)
  {
    uint64_t v13 = VCPLogInstance(v11, v12);
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    os_log_type_t v15 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v14, v15))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "Checking for failed assets...", buf, 2u);
    }
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[VCPTask photoLibrary](self, "photoLibrary"));
  unsigned int v17 = [v16 isCloudPhotoLibraryEnabled];

  if (!v17) {
    goto LABEL_15;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[VCPInternetReachability sharedInstance](&OBJC_CLASS___VCPInternetReachability, "sharedInstance"));
  unsigned int v131 = [v18 hasWifiOrEthernetConnection];

  if (!v131)
  {
    uint64_t v23 = MediaAnalysisLogLevel(v19, v20);
    if ((int)v23 >= 6)
    {
      uint64_t v25 = VCPLogInstance(v23, v24);
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      os_log_type_t v26 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v21, v26))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  v26,  "Wifi/Ethernet connection unavailable; disabling streaming analysis",
          buf,
          2u);
      }

      goto LABEL_14;
    }

@end