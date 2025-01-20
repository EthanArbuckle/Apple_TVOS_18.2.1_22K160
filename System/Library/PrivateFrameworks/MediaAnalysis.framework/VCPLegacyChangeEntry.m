@interface VCPLegacyChangeEntry
- ($A71F62C2B947990EEEAFC21D5CFDCAFE)summaryTimeRange;
- (NSData)computeSyncPayload;
- (PHAsset)asset;
- (float)autoplayScore;
- (int)mediaAnalysisVersion;
- (signed)analysisStage;
- (void)publish;
- (void)setAnalysisStage:(signed __int16)a3;
- (void)setAsset:(id)a3;
- (void)setAutoplayScore:(float)a3;
- (void)setComputeSyncPayload:(id)a3;
- (void)setMediaAnalysisVersion:(int)a3;
- (void)setSummaryTimeRange:(id *)a3;
@end

@implementation VCPLegacyChangeEntry

- (void)publish
{
  uint64_t v3 = MediaAnalysisLogLevel(self, a2);
  if ((int)v3 >= 7)
  {
    uint64_t v5 = VCPLogInstance(v3, v4);
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    os_log_type_t v7 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v6, v7))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHAsset localIdentifier](self->_asset, "localIdentifier"));
      *(_DWORD *)buf = 138412290;
      v27 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "   [%@] Publishing PHAssetPropertySetMediaAnalysis", buf, 0xCu);
    }
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MADStateHandler sharedStateHandler](&OBJC_CLASS___MADStateHandler, "sharedStateHandler"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHAsset localIdentifier](self->_asset, "localIdentifier"));
  [v9 addBreadcrumb:@"[%@] Publishing PHAssetPropertySetMediaAnalysis", v10];

  v11 = (void *)objc_claimAutoreleasedReturnValue( +[PHAssetChangeRequest changeRequestForAsset:]( &OBJC_CLASS___PHAssetChangeRequest,  "changeRequestForAsset:",  self->_asset));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHAsset vcp_modificationDate](self->_asset, "vcp_modificationDate"));
  [v11 setMediaAnalysisTimeStamp:v12];

  [v11 setMediaAnalysisVersion:self->_mediaAnalysisVersion];
  [v11 setMediaAnalysisImageVersion:SLOWORD(self->_mediaAnalysisVersion)];
  __int128 v13 = *(_OWORD *)&self->_summaryTimeRange.start.epoch;
  v25[0] = *(_OWORD *)&self->_summaryTimeRange.start.value;
  v25[1] = v13;
  v25[2] = *(_OWORD *)&self->_summaryTimeRange.duration.timescale;
  [v11 setBestVideoTimeRange:v25];
  *(float *)&double v14 = self->_autoplayScore;
  [v11 setAutoplaySuggestionScore:v14];
  if (-[PHAsset mad_isEligibleForComputeSync](self->_asset, "mad_isEligibleForComputeSync"))
  {
    [v11 setLocalAnalysisStage:self->_analysisStage];
    id v15 = [v11 setComputeSyncMediaAnalysisPayload:self->_computeSyncPayload];
    uint64_t v17 = MediaAnalysisLogLevel(v15, v16);
    if ((int)v17 >= 7)
    {
      uint64_t v19 = VCPLogInstance(v17, v18);
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      os_log_type_t v21 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v20, v21))
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[PHAsset localIdentifier](self->_asset, "localIdentifier"));
        int analysisStage = self->_analysisStage;
        unsigned int v24 = -[NSData length](self->_computeSyncPayload, "length");
        *(_DWORD *)buf = 138412802;
        v27 = v22;
        __int16 v28 = 1024;
        int v29 = analysisStage;
        __int16 v30 = 1024;
        unsigned int v31 = v24;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  v21,  "[%@] publish analysis stage (%d) and compute sync payload (%d bytes)",  buf,  0x18u);
      }
    }
  }
}

- (PHAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
}

- ($A71F62C2B947990EEEAFC21D5CFDCAFE)summaryTimeRange
{
  __int128 v3 = *(_OWORD *)&self[1].var0.var1;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self->var1.var3;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[1].var1.var0;
  return self;
}

- (void)setSummaryTimeRange:(id *)a3
{
  __int128 v3 = *(_OWORD *)&a3->var0.var0;
  __int128 v4 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&self->_summaryTimeRange.duration.timescale = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_summaryTimeRange.start.epoch = v4;
  *(_OWORD *)&self->_summaryTimeRange.start.value = v3;
}

- (float)autoplayScore
{
  return self->_autoplayScore;
}

- (void)setAutoplayScore:(float)a3
{
  self->_autoplayScore = a3;
}

- (int)mediaAnalysisVersion
{
  return self->_mediaAnalysisVersion;
}

- (void)setMediaAnalysisVersion:(int)a3
{
  self->_mediaAnalysisVersion = a3;
}

- (signed)analysisStage
{
  return self->_analysisStage;
}

- (void)setAnalysisStage:(signed __int16)a3
{
  self->_int analysisStage = a3;
}

- (NSData)computeSyncPayload
{
  return self->_computeSyncPayload;
}

- (void)setComputeSyncPayload:(id)a3
{
}

- (void).cxx_destruct
{
}

@end