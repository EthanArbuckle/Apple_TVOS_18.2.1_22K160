@interface PHAsset
- (BOOL)mad_isFullAnalysisVersionOutdated:(BOOL)a3;
- (BOOL)vcp_eligibleForFullAnalysis;
- (BOOL)vcp_isAnalysisValid:(id)a3;
@end

@implementation PHAsset

- (BOOL)vcp_eligibleForFullAnalysis
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAsset localIdentifier](self, "localIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAsset vcp_modificationDate](self, "vcp_modificationDate"));

  if (!v4)
  {
    uint64_t v17 = MediaAnalysisLogLevel(v5, v6);
    if ((int)v17 < 5)
    {
      BOOL v11 = 0;
      goto LABEL_12;
    }

    uint64_t v19 = VCPLogInstance(v17, v18);
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    os_log_type_t v20 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v8, v20))
    {
      int v22 = 138412290;
      v23 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  v20,  "  [%@] Missing modification date; ineligible",
        (uint8_t *)&v22,
        0xCu);
    }

    goto LABEL_10;
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHAsset photoLibrary](self, "photoLibrary"));
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:]( &OBJC_CLASS___VCPDatabaseManager,  "sharedDatabaseForPhotoLibrary:",  v7));

  id v9 = -[os_log_s getBlacklistCountForLocalIdentifier:](v8, "getBlacklistCountForLocalIdentifier:", v3);
  BOOL v11 = (int)v9 < MediaAnalysisBlacklistThreshold;
  if ((int)v9 >= MediaAnalysisBlacklistThreshold)
  {
    uint64_t v12 = MediaAnalysisLogLevel(v9, v10);
    if ((int)v12 >= 5)
    {
      uint64_t v14 = VCPLogInstance(v12, v13);
      v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      os_log_type_t v16 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v15, v16))
      {
        int v22 = 138412290;
        v23 = v3;
        _os_log_impl((void *)&_mh_execute_header, v15, v16, "  [%@] Blacklisted; ineligible", (uint8_t *)&v22, 0xCu);
      }
    }

- (BOOL)vcp_isAnalysisValid:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAsset vcp_modificationDate](self, "vcp_modificationDate"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "vcp_dateModified"));
  unsigned __int8 v7 = [v5 isEqualToDate:v6];

  return v7;
}

- (BOOL)mad_isFullAnalysisVersionOutdated:(BOOL)a3
{
  BOOL v3 = a3;
  if ((-[PHAsset vcp_needsFullAnalysisProcessing:](self, "vcp_needsFullAnalysisProcessing:") & 1) == 0)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHAsset photoLibrary](self, "photoLibrary"));
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue( +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:]( &OBJC_CLASS___VCPDatabaseManager,  "sharedDatabaseForPhotoLibrary:",  v6));

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHAsset localIdentifier](self, "localIdentifier"));
    uint64_t v19 = v9;
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v19, 1LL));
    BOOL v11 = [v7 queryHeadersForAssets:v10 analyses:v8] == 0;

    if (!v11) {
      goto LABEL_7;
    }
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHAsset localIdentifier](self, "localIdentifier"));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v12]);

    signed int v14 = objc_msgSend(v13, "vcp_version");
    if (v14 >= MediaAnalysisVersion)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "vcp_dateModified"));
      os_log_type_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHAsset vcp_modificationDate](self, "vcp_modificationDate"));
      unsigned __int8 v17 = [v15 isEqualToDate:v16];

      if ((v17 & 1) != 0)
      {
LABEL_7:
        BOOL v5 = 0;
LABEL_12:

        return v5;
      }
    }

    else
    {
    }

    BOOL v5 = 1;
    goto LABEL_12;
  }

  return 1;
}

@end