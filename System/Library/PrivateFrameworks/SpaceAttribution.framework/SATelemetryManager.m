@interface SATelemetryManager
+ (BOOL)shouldSendTelemetry:(BOOL)a3;
+ (id)SATelAppInfoTranslationTable;
+ (id)SATelTimeInfoTranslationTable;
+ (id)SATelTotalsDirStatsInfoTranslationTable;
+ (id)SATelTotalsInfoTranslationTable;
+ (id)getLastSentTelemetryDate:(BOOL)a3;
+ (id)getiCloudPlanSizeGB;
+ (id)newWithSAFOptions:(unint64_t)a3;
+ (void)clearLastTelemetryData:(id)a3;
+ (void)disableAppsFiltering;
+ (void)getLastTelemetryData:(id)a3;
+ (void)setAppsFilteringToDefault;
+ (void)updateLastSentTelemetryDate:(BOOL)a3;
- (NSMutableDictionary)appsInfo;
- (NSMutableDictionary)firstPartyfilteredInfo;
- (NSMutableDictionary)thirdPartyfilteredInfo;
- (NSMutableDictionary)timeInfo;
- (NSMutableDictionary)times;
- (NSMutableDictionary)totalsDstatsInfo;
- (NSMutableDictionary)totalsInfo;
- (NSNumber)icloudPlan;
- (NSString)runSignature;
- (SATelemetryManager)initWithSAFOptions:(unint64_t)a3;
- (double)stopTimeForTimeInfoEntry:(int64_t)a3;
- (id)createAppColumn:(id)a3;
- (id)dictionaryDescription;
- (id)fillFilteredInfoDict:(id)a3 withNumberOfApps:(unint64_t)a4 withAppInfoArr:(id)a5 withFilterCriteria:(int64_t)a6 withMetricType:(id)a7;
- (id)getFirstPartyAppsInfoKeys;
- (id)getTelAppInfoTranslation:(int64_t)a3;
- (id)getTelTimeInfoTranslation:(int64_t)a3;
- (id)getTelTotalsDirStatsInfoTranslation:(int64_t)a3;
- (id)getTelTotalsInfoTranslation:(int64_t)a3;
- (id)getThirdPartyAppsInfoKeys;
- (id)getTimeInfoTranslatedDictionary;
- (id)getTotalsDirstatInfoTranslatedDictionary;
- (id)getTotalsInfoTranslatedDictionary;
- (id)getVendorValueforBundleSet:(id)a3;
- (id)hasResultsError;
- (id)setAppInfoDictWithFirstPartyAppsKeys:(id)a3 WithThirdPartyAppKeys:(id)a4;
- (id)sortAppsInfo:(id)a3 by:(int64_t)a4 withOption:(int64_t)a5;
- (unint64_t)SAFOptions;
- (unint64_t)appsNumber;
- (unint64_t)getValueForAppInfoEntry:(int64_t)a3 forBundleSet:(id)a4;
- (unint64_t)getValueForDirStatsTotalsInfoEntry:(int64_t)a3;
- (unint64_t)getValueForTimeInfoEntry:(int64_t)a3;
- (unint64_t)getValueForTotalsInfoEntry:(int64_t)a3;
- (void)addValue:(unint64_t)a3 forAppInfoEntry:(int64_t)a4 forBundleSet:(id)a5;
- (void)addValue:(unint64_t)a3 forDirStatsTotalsInfoEntry:(int64_t)a4;
- (void)addValue:(unint64_t)a3 forTimeInfoEntry:(int64_t)a4;
- (void)addValue:(unint64_t)a3 forTotalsInfoEntry:(int64_t)a4;
- (void)removeAppsWithMultipleVendors;
- (void)saveTelemetryDataToDisk:(id)a3 thirdPartyAppKeys:(id)a4;
- (void)sendTelemetry:(BOOL)a3;
- (void)setAppsInfo:(id)a3;
- (void)setAppsNumber:(unint64_t)a3;
- (void)setFirstPartyfilteredInfo:(id)a3;
- (void)setIcloudPlan:(id)a3;
- (void)setRunSignature:(id)a3;
- (void)setSAFOptions:(unint64_t)a3;
- (void)setSystemDataSize:(unint64_t)a3;
- (void)setThirdPartyfilteredInfo:(id)a3;
- (void)setTimeInfo:(id)a3;
- (void)setTimes:(id)a3;
- (void)setTotalsDstatsInfo:(id)a3;
- (void)setTotalsInfo:(id)a3;
- (void)setValue:(unint64_t)a3 forAppInfoEntry:(int64_t)a4 forBundleSet:(id)a5;
- (void)setValue:(unint64_t)a3 forDirStatsTotalsInfoEntry:(int64_t)a4;
- (void)setValue:(unint64_t)a3 forTimeInfoEntry:(int64_t)a4;
- (void)setValue:(unint64_t)a3 forTotalsInfoEntry:(int64_t)a4;
- (void)startTimeForTimeInfoEntry:(int64_t)a3;
- (void)subtractValue:(unint64_t)a3 forAppInfoEntry:(int64_t)a4 forBundleSet:(id)a5;
- (void)subtractValue:(unint64_t)a3 forTotalsInfoEntry:(int64_t)a4;
- (void)updateAppSet:(id)a3 appCacheSize:(unint64_t)a4 CDPluginSize:(unint64_t)a5;
- (void)updateAppSet:(id)a3 attributionSize:(unint64_t)a4 attributionCloneSize:(unint64_t)a5 attributionTagCount:(unint64_t)a6;
- (void)updateAppSet:(id)a3 usedDirStat:(BOOL)a4 fixedSize:(unint64_t)a5 dataSize:(unint64_t)a6 cloneSize:(unint64_t)a7 purgeableSize:(unint64_t)a8;
- (void)updateAppSet:(id)a3 withPurgeableTagSize:(unint64_t)a4;
- (void)updateAppSet:(id)a3 withSUPurgeableSize:(unint64_t)a4;
- (void)updateCloneInfoWithAppSet:(id)a3 withItemSize:(id)a4;
- (void)updateDirStatInfo:(BOOL)a3 usedDirsStat:(BOOL)a4 failedDirStat:(BOOL)a5 skippedDirStat:(BOOL)a6;
- (void)updateSAFOptionWithPathsList:(id)a3;
- (void)updateTotalsInfo:(unint64_t)a3 totalPurgeable:(unint64_t)a4;
@end

@implementation SATelemetryManager

+ (id)getiCloudPlanSizeGB
{
  return 0LL;
}

- (SATelemetryManager)initWithSAFOptions:(unint64_t)a3
{
  v41.receiver = self;
  v41.super_class = (Class)&OBJC_CLASS___SATelemetryManager;
  v4 = -[SATelemetryManager init](&v41, "init");
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 UUIDString]);
    runSignature = v4->_runSignature;
    v4->_runSignature = (NSString *)v6;

    v4->_appsNumber = 0LL;
    v4->_SAFOptions = a3;
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[SATelemetryManager getiCloudPlanSizeGB](&OBJC_CLASS___SATelemetryManager, "getiCloudPlanSizeGB"));
    icloudPlan = v4->_icloudPlan;
    v4->_icloudPlan = (NSNumber *)v8;

    v10 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    appsInfo = v4->_appsInfo;
    v4->_appsInfo = v10;

    v12 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    totalsInfo = v4->_totalsInfo;
    v4->_totalsInfo = v12;

    v14 = v4->_totalsInfo;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SATelemetryManager getTelTotalsInfoTranslation:](v4, "getTelTotalsInfoTranslation:", 0LL));
    -[NSMutableDictionary setValue:forKey:](v14, "setValue:forKey:", @"totals-info", v15);

    v16 = v4->_totalsInfo;
    v17 = v4->_runSignature;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[SATelemetryManager getTelTotalsInfoTranslation:](v4, "getTelTotalsInfoTranslation:", 1LL));
    -[NSMutableDictionary setValue:forKey:](v16, "setValue:forKey:", v17, v18);

    v19 = v4->_totalsInfo;
    v20 = v4->_icloudPlan;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[SATelemetryManager getTelTotalsInfoTranslation:](v4, "getTelTotalsInfoTranslation:", 2LL));
    -[NSMutableDictionary setValue:forKey:](v19, "setValue:forKey:", v20, v21);

    v22 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    totalsDstatsInfo = v4->_totalsDstatsInfo;
    v4->_totalsDstatsInfo = v22;

    v24 = v4->_totalsDstatsInfo;
    v25 = (void *)objc_claimAutoreleasedReturnValue( -[SATelemetryManager getTelTotalsDirStatsInfoTranslation:]( v4,  "getTelTotalsDirStatsInfoTranslation:",  0LL));
    -[NSMutableDictionary setValue:forKey:](v24, "setValue:forKey:", @"totals-dstats-info", v25);

    v26 = v4->_totalsDstatsInfo;
    v27 = v4->_runSignature;
    v28 = (void *)objc_claimAutoreleasedReturnValue( -[SATelemetryManager getTelTotalsDirStatsInfoTranslation:]( v4,  "getTelTotalsDirStatsInfoTranslation:",  1LL));
    -[NSMutableDictionary setValue:forKey:](v26, "setValue:forKey:", v27, v28);

    v29 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    timeInfo = v4->_timeInfo;
    v4->_timeInfo = v29;

    v31 = v4->_timeInfo;
    v32 = v4->_runSignature;
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[SATelemetryManager getTelTimeInfoTranslation:](v4, "getTelTimeInfoTranslation:", 1LL));
    -[NSMutableDictionary setValue:forKey:](v31, "setValue:forKey:", v32, v33);

    v34 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    firstPartyfilteredInfo = v4->_firstPartyfilteredInfo;
    v4->_firstPartyfilteredInfo = v34;

    v36 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    thirdPartyfilteredInfo = v4->_thirdPartyfilteredInfo;
    v4->_thirdPartyfilteredInfo = v36;

    v38 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    times = v4->_times;
    v4->_times = v38;
  }

  return v4;
}

+ (id)newWithSAFOptions:(unint64_t)a3
{
  return -[SATelemetryManager initWithSAFOptions:]( objc_alloc(&OBJC_CLASS___SATelemetryManager),  "initWithSAFOptions:",  a3);
}

- (id)createAppColumn:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[SAUtilities createCommaSeparatedString:]( &OBJC_CLASS___SAUtilities,  "createCommaSeparatedString:",  v4));
  id v6 = [v4 count];
  v7 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  if (v6 == (id)1)
  {
    uint64_t v8 = 2LL;
  }

  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v4 anyObject]);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SATelemetryManager getTelAppInfoTranslation:](self, "getTelAppInfoTranslation:", 2LL));
    -[NSMutableDictionary setValue:forKey:](v7, "setValue:forKey:", v9, v10);

    uint64_t v8 = 25LL;
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SATelemetryManager getTelAppInfoTranslation:](self, "getTelAppInfoTranslation:", v8));
  -[NSMutableDictionary setValue:forKey:](v7, "setValue:forKey:", v5, v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SATelemetryManager getTelAppInfoTranslation:](self, "getTelAppInfoTranslation:", 0LL));
  -[NSMutableDictionary setValue:forKey:](v7, "setValue:forKey:", @"app-info", v12);

  runSignature = self->_runSignature;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SATelemetryManager getTelAppInfoTranslation:](self, "getTelAppInfoTranslation:", 1LL));
  -[NSMutableDictionary setValue:forKey:](v7, "setValue:forKey:", runSignature, v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v6));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SATelemetryManager getTelAppInfoTranslation:](self, "getTelAppInfoTranslation:", 7LL));
  -[NSMutableDictionary setValue:forKey:](v7, "setValue:forKey:", v15, v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[SATelemetryManager appsNumber](self, "appsNumber")));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[SATelemetryManager getTelAppInfoTranslation:](self, "getTelAppInfoTranslation:", 6LL));
  -[NSMutableDictionary setValue:forKey:](v7, "setValue:forKey:", v17, v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[SATelemetryManager SAFOptions](self, "SAFOptions")));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[SATelemetryManager getTelAppInfoTranslation:](self, "getTelAppInfoTranslation:", 5LL));
  -[NSMutableDictionary setValue:forKey:](v7, "setValue:forKey:", v19, v20);

  icloudPlan = self->_icloudPlan;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[SATelemetryManager getTelAppInfoTranslation:](self, "getTelAppInfoTranslation:", 4LL));
  -[NSMutableDictionary setValue:forKey:](v7, "setValue:forKey:", icloudPlan, v22);

  v23 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  id v24 = v4;
  id v25 = [v24 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v25)
  {
    id v26 = v25;
    uint64_t v27 = *(void *)v36;
    do
    {
      v28 = 0LL;
      do
      {
        if (*(void *)v36 != v27) {
          objc_enumerationMutation(v24);
        }
        v29 = (void *)objc_claimAutoreleasedReturnValue( +[SAQuery guesstimateBundleId:]( &OBJC_CLASS___SAQuery,  "guesstimateBundleId:",  *(void *)(*((void *)&v35 + 1) + 8LL * (void)v28),  (void)v35));
        -[NSMutableSet addObject:](v23, "addObject:", v29);

        v28 = (char *)v28 + 1;
      }

      while (v26 != v28);
      id v26 = [v24 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }

    while (v26);
  }

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v23, "allObjects"));
  v31 = (void *)objc_claimAutoreleasedReturnValue([v30 sortedArrayUsingSelector:"localizedCaseInsensitiveCompare:"]);

  v32 = (void *)objc_claimAutoreleasedReturnValue([v31 componentsJoinedByString:@","]);
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[SATelemetryManager getTelAppInfoTranslation:](self, "getTelAppInfoTranslation:", 3LL));
  -[NSMutableDictionary setValue:forKey:](v7, "setValue:forKey:", v32, v33);

  -[NSMutableDictionary setValue:forKey:](self->_appsInfo, "setValue:forKey:", v7, v5);
  -[SATelemetryManager setAppsNumber:]( self,  "setAppsNumber:",  (char *)-[SATelemetryManager appsNumber](self, "appsNumber") + 1);

  return v7;
}

- (void)setValue:(unint64_t)a3 forAppInfoEntry:(int64_t)a4 forBundleSet:(id)a5
{
  id v14 = a5;
  uint64_t v8 = objc_autoreleasePoolPush();
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[SAUtilities createCommaSeparatedString:]( &OBJC_CLASS___SAUtilities,  "createCommaSeparatedString:",  v14));
  v10 = self->_appsInfo;
  objc_sync_enter(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_appsInfo, "objectForKey:", v9));
  if (!v11) {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SATelemetryManager createAppColumn:](self, "createAppColumn:", v14));
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SATelemetryManager getTelAppInfoTranslation:](self, "getTelAppInfoTranslation:", a4));
  [v11 setValue:v12 forKey:v13];

  objc_sync_exit(v10);
  objc_autoreleasePoolPop(v8);
}

- (unint64_t)getValueForAppInfoEntry:(int64_t)a3 forBundleSet:(id)a4
{
  id v6 = a4;
  v7 = self->_appsInfo;
  objc_sync_enter(v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[SAUtilities createCommaSeparatedString:]( &OBJC_CLASS___SAUtilities,  "createCommaSeparatedString:",  v6));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_appsInfo, "objectForKey:", v8));
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SATelemetryManager getTelAppInfoTranslation:](self, "getTelAppInfoTranslation:", a3));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v10]);

    if (v11) {
      id v12 = [v11 longLongValue];
    }
    else {
      id v12 = 0LL;
    }
  }

  else
  {
    id v12 = 0LL;
  }

  objc_sync_exit(v7);
  return (unint64_t)v12;
}

- (id)getVendorValueforBundleSet:(id)a3
{
  id v4 = a3;
  v5 = self->_appsInfo;
  objc_sync_enter(v5);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SAUtilities createCommaSeparatedString:]( &OBJC_CLASS___SAUtilities,  "createCommaSeparatedString:",  v4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_appsInfo, "objectForKey:", v6));
  if (v7)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SATelemetryManager getTelAppInfoTranslation:](self, "getTelAppInfoTranslation:", 3LL));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v8]);
  }

  else
  {
    v9 = 0LL;
  }

  objc_sync_exit(v5);
  return v9;
}

- (void)addValue:(unint64_t)a3 forAppInfoEntry:(int64_t)a4 forBundleSet:(id)a5
{
  id v9 = a5;
  uint64_t v8 = self->_appsInfo;
  objc_sync_enter(v8);
  -[SATelemetryManager setValue:forAppInfoEntry:forBundleSet:]( self,  "setValue:forAppInfoEntry:forBundleSet:",  (char *)-[SATelemetryManager getValueForAppInfoEntry:forBundleSet:]( self,  "getValueForAppInfoEntry:forBundleSet:",  a4,  v9)
  + a3,
    a4,
    v9);
  objc_sync_exit(v8);
}

- (void)subtractValue:(unint64_t)a3 forAppInfoEntry:(int64_t)a4 forBundleSet:(id)a5
{
  id v8 = a5;
  id v9 = self->_appsInfo;
  objc_sync_enter(v9);
  unint64_t v10 = -[SATelemetryManager getValueForAppInfoEntry:forBundleSet:]( self,  "getValueForAppInfoEntry:forBundleSet:",  a4,  v8);
  if (v10 >= a3)
  {
    -[SATelemetryManager setValue:forAppInfoEntry:forBundleSet:]( self,  "setValue:forAppInfoEntry:forBundleSet:",  v10 - a3,  a4,  v8);
  }

  else
  {
    uint64_t v11 = SALog(v10);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10003438C(v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }

  objc_sync_exit(v9);
}

- (void)updateCloneInfoWithAppSet:(id)a3 withItemSize:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[SATelemetryManager addValue:forAppInfoEntry:forBundleSet:]( self,  "addValue:forAppInfoEntry:forBundleSet:",  [v6 dataSize],  22,  v7);
  -[SATelemetryManager addValue:forAppInfoEntry:forBundleSet:]( self,  "addValue:forAppInfoEntry:forBundleSet:",  [v6 dataSize],  16,  v7);
  -[SATelemetryManager addValue:forAppInfoEntry:forBundleSet:]( self,  "addValue:forAppInfoEntry:forBundleSet:",  [v6 cloneSize],  24,  v7);
  -[SATelemetryManager addValue:forAppInfoEntry:forBundleSet:]( self,  "addValue:forAppInfoEntry:forBundleSet:",  [v6 cloneSize],  17,  v7);
  -[SATelemetryManager addValue:forAppInfoEntry:forBundleSet:]( self,  "addValue:forAppInfoEntry:forBundleSet:",  [v6 purgeableSize],  23,  v7);
  -[SATelemetryManager addValue:forAppInfoEntry:forBundleSet:]( self,  "addValue:forAppInfoEntry:forBundleSet:",  [v6 purgeableSize],  18,  v7);

  id v8 = [v6 cloneSize];
  -[SATelemetryManager addValue:forTotalsInfoEntry:](self, "addValue:forTotalsInfoEntry:", v8, 20LL);
}

- (void)updateAppSet:(id)a3 usedDirStat:(BOOL)a4 fixedSize:(unint64_t)a5 dataSize:(unint64_t)a6 cloneSize:(unint64_t)a7 purgeableSize:(unint64_t)a8
{
  BOOL v12 = a4;
  id v14 = a3;
  if (v12)
  {
    -[SATelemetryManager addValue:forAppInfoEntry:forBundleSet:]( self,  "addValue:forAppInfoEntry:forBundleSet:",  a6,  8LL,  v14);
    -[SATelemetryManager addValue:forTotalsInfoEntry:](self, "addValue:forTotalsInfoEntry:", a6, 6LL);
    -[SATelemetryManager addValue:forAppInfoEntry:forBundleSet:]( self,  "addValue:forAppInfoEntry:forBundleSet:",  a8,  9LL,  v14);
    -[SATelemetryManager addValue:forTotalsInfoEntry:](self, "addValue:forTotalsInfoEntry:", a8, 7LL);
    -[SATelemetryManager addValue:forAppInfoEntry:forBundleSet:]( self,  "addValue:forAppInfoEntry:forBundleSet:",  a7,  10LL,  v14);
    -[SATelemetryManager addValue:forTotalsInfoEntry:](self, "addValue:forTotalsInfoEntry:", a7, 8LL);
    -[SATelemetryManager addValue:forAppInfoEntry:forBundleSet:]( self,  "addValue:forAppInfoEntry:forBundleSet:",  1LL,  11LL,  v14);
  }

  -[SATelemetryManager addValue:forAppInfoEntry:forBundleSet:]( self,  "addValue:forAppInfoEntry:forBundleSet:",  a5,  21LL,  v14);
  -[SATelemetryManager addValue:forAppInfoEntry:forBundleSet:]( self,  "addValue:forAppInfoEntry:forBundleSet:",  a6,  22LL,  v14);
  -[SATelemetryManager addValue:forAppInfoEntry:forBundleSet:]( self,  "addValue:forAppInfoEntry:forBundleSet:",  a7,  24LL,  v14);
  -[SATelemetryManager addValue:forTotalsInfoEntry:](self, "addValue:forTotalsInfoEntry:", a7, 20LL);
  -[SATelemetryManager addValue:forAppInfoEntry:forBundleSet:]( self,  "addValue:forAppInfoEntry:forBundleSet:",  a8,  23LL,  v14);
}

- (void)updateAppSet:(id)a3 attributionSize:(unint64_t)a4 attributionCloneSize:(unint64_t)a5 attributionTagCount:(unint64_t)a6
{
  id v10 = a3;
  -[SATelemetryManager addValue:forAppInfoEntry:forBundleSet:]( self,  "addValue:forAppInfoEntry:forBundleSet:",  a4,  22LL,  v10);
  -[SATelemetryManager addValue:forAppInfoEntry:forBundleSet:]( self,  "addValue:forAppInfoEntry:forBundleSet:",  a4,  12LL,  v10);
  -[SATelemetryManager addValue:forTotalsInfoEntry:](self, "addValue:forTotalsInfoEntry:", a4, 10LL);
  -[SATelemetryManager addValue:forAppInfoEntry:forBundleSet:]( self,  "addValue:forAppInfoEntry:forBundleSet:",  a5,  14LL,  v10);
  -[SATelemetryManager addValue:forTotalsInfoEntry:](self, "addValue:forTotalsInfoEntry:", a5, 13LL);
  -[SATelemetryManager addValue:forAppInfoEntry:forBundleSet:]( self,  "addValue:forAppInfoEntry:forBundleSet:",  a6,  15LL,  v10);

  -[SATelemetryManager addValue:forTotalsInfoEntry:](self, "addValue:forTotalsInfoEntry:", a6, 14LL);
}

- (void)updateAppSet:(id)a3 withPurgeableTagSize:(unint64_t)a4
{
  id v6 = a3;
  unint64_t v7 = -[SATelemetryManager getValueForAppInfoEntry:forBundleSet:]( self,  "getValueForAppInfoEntry:forBundleSet:",  5LL,  v6);
  -[SATelemetryManager addValue:forAppInfoEntry:forBundleSet:]( self,  "addValue:forAppInfoEntry:forBundleSet:",  a4,  23LL,  v6);
  -[SATelemetryManager subtractValue:forAppInfoEntry:forBundleSet:]( self,  "subtractValue:forAppInfoEntry:forBundleSet:",  a4,  22LL,  v6);
  -[SATelemetryManager addValue:forAppInfoEntry:forBundleSet:]( self,  "addValue:forAppInfoEntry:forBundleSet:",  a4,  13LL,  v6);
  -[SATelemetryManager subtractValue:forAppInfoEntry:forBundleSet:]( self,  "subtractValue:forAppInfoEntry:forBundleSet:",  a4,  12LL,  v6);

  -[SATelemetryManager subtractValue:forTotalsInfoEntry:](self, "subtractValue:forTotalsInfoEntry:", a4, 10LL);
  -[SATelemetryManager addValue:forTotalsInfoEntry:](self, "addValue:forTotalsInfoEntry:", a4, 19LL);
  if (v7 == 1) {
    uint64_t v8 = 11LL;
  }
  else {
    uint64_t v8 = 12LL;
  }
  -[SATelemetryManager addValue:forTotalsInfoEntry:](self, "addValue:forTotalsInfoEntry:", a4, v8);
}

- (void)updateAppSet:(id)a3 appCacheSize:(unint64_t)a4 CDPluginSize:(unint64_t)a5
{
  unint64_t v8 = a5 + a4;
  id v9 = a3;
  -[SATelemetryManager addValue:forAppInfoEntry:forBundleSet:]( self,  "addValue:forAppInfoEntry:forBundleSet:",  v8,  23LL,  v9);
  -[SATelemetryManager addValue:forAppInfoEntry:forBundleSet:]( self,  "addValue:forAppInfoEntry:forBundleSet:",  a4,  19LL,  v9);
  -[SATelemetryManager addValue:forTotalsInfoEntry:](self, "addValue:forTotalsInfoEntry:", a4, 15LL);
  -[SATelemetryManager addValue:forAppInfoEntry:forBundleSet:]( self,  "addValue:forAppInfoEntry:forBundleSet:",  a5,  20LL,  v9);

  -[SATelemetryManager addValue:forTotalsInfoEntry:](self, "addValue:forTotalsInfoEntry:", a5, 16LL);
}

- (void)updateAppSet:(id)a3 withSUPurgeableSize:(unint64_t)a4
{
  id v6 = a3;
  -[SATelemetryManager addValue:forAppInfoEntry:forBundleSet:]( self,  "addValue:forAppInfoEntry:forBundleSet:",  a4,  22LL,  v6);
  -[SATelemetryManager subtractValue:forAppInfoEntry:forBundleSet:]( self,  "subtractValue:forAppInfoEntry:forBundleSet:",  a4,  23LL,  v6);
}

- (void)setSystemDataSize:(unint64_t)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", @"com.apple.fakeapp.SystemData"));
  -[SATelemetryManager setValue:forAppInfoEntry:forBundleSet:]( self,  "setValue:forAppInfoEntry:forBundleSet:",  a3,  22LL,  v5);

  -[SATelemetryManager setValue:forTotalsInfoEntry:](self, "setValue:forTotalsInfoEntry:", a3, 18LL);
}

- (void)updateSAFOptionWithPathsList:(id)a3
{
  id v4 = a3;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  uint64_t v27 = self;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_appsInfo, "allKeys"));
  id v5 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v38;
    unint64_t v8 = &APFSOverProvModel_ptr;
    uint64_t v28 = *(void *)v38;
    do
    {
      id v9 = 0LL;
      id v29 = v6;
      do
      {
        if (*(void *)v38 != v7) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v37 + 1) + 8LL * (void)v9);
        uint64_t v11 = objc_autoreleasePoolPush();
        if (([v10 isEqual:@"com.apple.fakeapp.SystemData"] & 1) == 0
          && ([v10 isEqual:@"com.apple.fakeapp.System"] & 1) == 0
          && ([v10 isEqual:@"com.apple.fakeapp.SoftwareUpdate"] & 1) == 0)
        {
          v30 = v9;
          v31 = v11;
          BOOL v12 = v8[41];
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v10 componentsSeparatedByString:@","]);
          id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 setWithArray:v13]);

          uint64_t v15 = v10;
          if ((unint64_t)[v14 count] >= 2
            && [v14 containsObject:@"com.apple.Bridge"])
          {
            [v14 removeObject:@"com.apple.Bridge"];
          }

          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v8[41] setWithSet:v14]);
          __int128 v33 = 0u;
          __int128 v34 = 0u;
          __int128 v35 = 0u;
          __int128 v36 = 0u;
          id v17 = v14;
          id v18 = [v17 countByEnumeratingWithState:&v33 objects:v41 count:16];
          if (v18)
          {
            id v19 = v18;
            uint64_t v20 = *(void *)v34;
            do
            {
              v21 = 0LL;
              do
              {
                if (*(void *)v34 != v20) {
                  objc_enumerationMutation(v17);
                }
                uint64_t v22 = *(void *)(*((void *)&v33 + 1) + 8LL * (void)v21);
                v23 = (void *)objc_claimAutoreleasedReturnValue([v4 appPathList]);
                id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKeyedSubscript:v22]);

                v21 = (char *)v21 + 1;
              }

              while (v19 != v21);
              id v19 = [v17 countByEnumeratingWithState:&v33 objects:v41 count:16];
            }

            while (v19);
          }

          if (![v16 count])
          {
            id v25 = (void *)objc_claimAutoreleasedReturnValue([v15 componentsSeparatedByString:@","]);
            id v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v25));
            -[SATelemetryManager setValue:forAppInfoEntry:forBundleSet:]( v27,  "setValue:forAppInfoEntry:forBundleSet:",  2LL,  5LL,  v26);
          }

          uint64_t v7 = v28;
          id v6 = v29;
          unint64_t v8 = &APFSOverProvModel_ptr;
          id v9 = v30;
          uint64_t v11 = v31;
        }

        objc_autoreleasePoolPop(v11);
        id v9 = (char *)v9 + 1;
      }

      while (v9 != v6);
      id v6 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
    }

    while (v6);
  }
}

- (void)setValue:(unint64_t)a3 forTotalsInfoEntry:(int64_t)a4
{
  id obj = self->_totalsInfo;
  objc_sync_enter(obj);
  totalsInfo = self->_totalsInfo;
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SATelemetryManager getTelTotalsInfoTranslation:](self, "getTelTotalsInfoTranslation:", a4));
  -[NSMutableDictionary setValue:forKey:](totalsInfo, "setValue:forKey:", v8, v9);

  objc_sync_exit(obj);
}

- (unint64_t)getValueForTotalsInfoEntry:(int64_t)a3
{
  id v5 = self->_totalsInfo;
  objc_sync_enter(v5);
  totalsInfo = self->_totalsInfo;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SATelemetryManager getTelTotalsInfoTranslation:](self, "getTelTotalsInfoTranslation:", a3));
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](totalsInfo, "objectForKey:", v7));

  if (v8) {
    id v9 = [v8 longLongValue];
  }
  else {
    id v9 = 0LL;
  }

  objc_sync_exit(v5);
  return (unint64_t)v9;
}

- (void)addValue:(unint64_t)a3 forTotalsInfoEntry:(int64_t)a4
{
  id obj = self->_totalsInfo;
  objc_sync_enter(obj);
  -[SATelemetryManager setValue:forTotalsInfoEntry:]( self,  "setValue:forTotalsInfoEntry:",  (char *)-[SATelemetryManager getValueForTotalsInfoEntry:](self, "getValueForTotalsInfoEntry:", a4) + a3,  a4);
  objc_sync_exit(obj);
}

- (void)subtractValue:(unint64_t)a3 forTotalsInfoEntry:(int64_t)a4
{
  uint64_t v7 = self->_totalsInfo;
  objc_sync_enter(v7);
  unint64_t v8 = -[SATelemetryManager getValueForTotalsInfoEntry:](self, "getValueForTotalsInfoEntry:", a4);
  if (v8 >= a3)
  {
    -[SATelemetryManager setValue:forTotalsInfoEntry:](self, "setValue:forTotalsInfoEntry:", v8 - a3, a4);
  }

  else
  {
    uint64_t v9 = SALog(v8);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000343FC(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }

  objc_sync_exit(v7);
}

- (void)updateTotalsInfo:(unint64_t)a3 totalPurgeable:(unint64_t)a4
{
}

- (void)setValue:(unint64_t)a3 forDirStatsTotalsInfoEntry:(int64_t)a4
{
  id obj = self->_totalsDstatsInfo;
  objc_sync_enter(obj);
  totalsDstatsInfo = self->_totalsDstatsInfo;
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[SATelemetryManager getTelTotalsDirStatsInfoTranslation:]( self,  "getTelTotalsDirStatsInfoTranslation:",  a4));
  -[NSMutableDictionary setValue:forKey:](totalsDstatsInfo, "setValue:forKey:", v8, v9);

  objc_sync_exit(obj);
}

- (unint64_t)getValueForDirStatsTotalsInfoEntry:(int64_t)a3
{
  id v5 = self->_totalsDstatsInfo;
  objc_sync_enter(v5);
  totalsDstatsInfo = self->_totalsDstatsInfo;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[SATelemetryManager getTelTotalsDirStatsInfoTranslation:]( self,  "getTelTotalsDirStatsInfoTranslation:",  a3));
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](totalsDstatsInfo, "objectForKey:", v7));

  if (v8) {
    id v9 = [v8 longLongValue];
  }
  else {
    id v9 = 0LL;
  }

  objc_sync_exit(v5);
  return (unint64_t)v9;
}

- (void)addValue:(unint64_t)a3 forDirStatsTotalsInfoEntry:(int64_t)a4
{
  id obj = self->_totalsDstatsInfo;
  objc_sync_enter(obj);
  -[SATelemetryManager setValue:forDirStatsTotalsInfoEntry:]( self,  "setValue:forDirStatsTotalsInfoEntry:",  (char *)-[SATelemetryManager getValueForDirStatsTotalsInfoEntry:](self, "getValueForDirStatsTotalsInfoEntry:", a4)
  + a3,
    a4);
  objc_sync_exit(obj);
}

- (void)updateDirStatInfo:(BOOL)a3 usedDirsStat:(BOOL)a4 failedDirStat:(BOOL)a5 skippedDirStat:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  BOOL v9 = a3;
  -[SATelemetryManager addValue:forDirStatsTotalsInfoEntry:](self, "addValue:forDirStatsTotalsInfoEntry:", 1LL, 2LL);
  if (v9)
  {
    -[SATelemetryManager addValue:forTotalsInfoEntry:](self, "addValue:forTotalsInfoEntry:", 1LL, 9LL);
    -[SATelemetryManager addValue:forDirStatsTotalsInfoEntry:](self, "addValue:forDirStatsTotalsInfoEntry:", 1LL, 3LL);
    if (!v8)
    {
LABEL_3:
      if (!v7) {
        goto LABEL_4;
      }
      goto LABEL_8;
    }
  }

  else if (!v8)
  {
    goto LABEL_3;
  }

  -[SATelemetryManager addValue:forDirStatsTotalsInfoEntry:](self, "addValue:forDirStatsTotalsInfoEntry:", 1LL, 4LL);
  if (!v7)
  {
LABEL_4:
    if (!v6) {
      return;
    }
    goto LABEL_5;
  }

- (void)setValue:(unint64_t)a3 forTimeInfoEntry:(int64_t)a4
{
  id obj = self->_timeInfo;
  objc_sync_enter(obj);
  timeInfo = self->_timeInfo;
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[SATelemetryManager getTelTimeInfoTranslation:](self, "getTelTimeInfoTranslation:", a4));
  -[NSMutableDictionary setValue:forKey:](timeInfo, "setValue:forKey:", v8, v9);

  objc_sync_exit(obj);
}

- (unint64_t)getValueForTimeInfoEntry:(int64_t)a3
{
  id v5 = self->_timeInfo;
  objc_sync_enter(v5);
  timeInfo = self->_timeInfo;
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[SATelemetryManager getTelTimeInfoTranslation:](self, "getTelTimeInfoTranslation:", a3));
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](timeInfo, "valueForKey:", v7));

  if (v8) {
    id v9 = [v8 longLongValue];
  }
  else {
    id v9 = 0LL;
  }

  objc_sync_exit(v5);
  return (unint64_t)v9;
}

- (void)addValue:(unint64_t)a3 forTimeInfoEntry:(int64_t)a4
{
  id obj = self->_timeInfo;
  objc_sync_enter(obj);
  -[SATelemetryManager setValue:forTimeInfoEntry:]( self,  "setValue:forTimeInfoEntry:",  (char *)-[SATelemetryManager getValueForTimeInfoEntry:](self, "getValueForTimeInfoEntry:", a4) + a3,  a4);
  objc_sync_exit(obj);
}

- (void)startTimeForTimeInfoEntry:(int64_t)a3
{
  id v5 = self->_timeInfo;
  objc_sync_enter(v5);
  times = self->_times;
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](times, "objectForKey:", v7));

  if (v8)
  {
    uint64_t v10 = SALog(v9);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10003446C();
    }
  }

  else
  {
    uint64_t v12 = self->_times;
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
    -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v11, v13);
  }

  objc_sync_exit(v5);
}

- (double)stopTimeForTimeInfoEntry:(int64_t)a3
{
  id v5 = self->_timeInfo;
  objc_sync_enter(v5);
  times = self->_times;
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](times, "objectForKey:", v7));

  if (v8)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v10 timeIntervalSinceDate:v8];
    double v12 = v11;

    -[SATelemetryManager addValue:forTimeInfoEntry:]( self,  "addValue:forTimeInfoEntry:",  (unint64_t)(v12 * 1000.0),  a3);
  }

  else
  {
    uint64_t v13 = SALog(v9);
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1000344D8();
    }

    double v12 = 0.0;
  }

  objc_sync_exit(v5);
  return v12;
}

- (id)dictionaryDescription
{
  appsInfo = self->_appsInfo;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATelemetryManager getTotalsInfoTranslatedDictionary](self, "getTotalsInfoTranslatedDictionary"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[SATelemetryManager getTotalsDirstatInfoTranslatedDictionary]( self,  "getTotalsDirstatInfoTranslatedDictionary"));
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[SATelemetryManager getTimeInfoTranslatedDictionary](self, "getTimeInfoTranslatedDictionary"));
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithObjectsAndKeys:",  appsInfo,  @"AppsInfo",  v4,  @"TotalsInfo",  v5,  @"TotalDirstatsInfo",  v6,  @"TimeInfo",  self->_thirdPartyfilteredInfo,  @"ThirdPartyFilteredInfo",  0LL));

  return v7;
}

- (id)sortAppsInfo:(id)a3 by:(int64_t)a4 withOption:(int64_t)a5
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10002B634;
  v6[3] = &unk_10004D418;
  v6[4] = self;
  v6[5] = a4;
  return (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "sortedArrayUsingComparator:", v6, a4, a5));
}

- (id)getFirstPartyAppsInfoKeys
{
  v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id obj = self->_appsInfo;
  id v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(obj);
        }
        BOOL v8 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v8));
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[SATelemetryManager getVendorValueforBundleSet:](self, "getVendorValueforBundleSet:", v9));

        if (([v10 isEqualToString:@"Apple"] & 1) != 0
          || ([v8 isEqualToString:@"com.apple.fakeapp.SystemData"] & 1) != 0
          || ([v8 isEqualToString:@"com.apple.fakeapp.SoftwareUpdate"] & 1) != 0
          || ([v8 isEqualToString:@"com.apple.fakeapp.System"] & 1) != 0
          || [v8 isEqualToString:@"com.apple.fakeapp.SyncedContent"])
        {
          -[NSMutableArray addObject:](v3, "addObject:", v8);
        }
      }

      id v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    }

    while (v5);
  }

  return v3;
}

- (id)getThirdPartyAppsInfoKeys
{
  __int128 v16 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  uint64_t v17 = self;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  v3 = self->_appsInfo;
  id v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v18,  v22,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = @"com.apple.fakeapp.System";
    uint64_t v7 = *(void *)v19;
    BOOL v8 = @"com.apple.fakeapp.SyncedContent";
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v10 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        if ((objc_msgSend(v10, "isEqualToString:", @"com.apple.fakeapp.SystemData", v16) & 1) == 0
          && ([v10 isEqualToString:@"com.apple.fakeapp.SoftwareUpdate"] & 1) == 0
          && ([v10 isEqualToString:v6] & 1) == 0
          && ([v10 isEqualToString:v8] & 1) == 0)
        {
          double v11 = v6;
          double v12 = v8;
          __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v10));
          __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[SATelemetryManager getVendorValueforBundleSet:](v17, "getVendorValueforBundleSet:", v13));

          BOOL v8 = v12;
          uint64_t v6 = v11;
        }
      }

      id v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v18,  v22,  16LL);
    }

    while (v5);
  }

  return v16;
}

- (id)fillFilteredInfoDict:(id)a3 withNumberOfApps:(unint64_t)a4 withAppInfoArr:(id)a5 withFilterCriteria:(int64_t)a6 withMetricType:(id)a7
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a7;
  if ((unint64_t)[v12 count] <= a4)
  {
    id v40 = v12;
  }

  else
  {
    int64_t v42 = a6;
    id v43 = v13;
    v44 = v12;
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    __int128 v56 = 0u;
    __int128 v57 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "subarrayWithRange:", a4, (char *)objc_msgSend(v12, "count") - a4));
    id v48 = [obj countByEnumeratingWithState:&v54 objects:v59 count:16];
    if (v48)
    {
      uint64_t v46 = *(void *)v55;
      do
      {
        uint64_t v14 = 0LL;
        do
        {
          if (*(void *)v55 != v46) {
            objc_enumerationMutation(obj);
          }
          uint64_t v49 = v14;
          __int128 v15 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary valueForKey:]( self->_appsInfo,  "valueForKey:",  *(void *)(*((void *)&v54 + 1) + 8 * v14)));
          __int128 v50 = 0u;
          __int128 v51 = 0u;
          __int128 v52 = 0u;
          __int128 v53 = 0u;
          id v16 = [v15 countByEnumeratingWithState:&v50 objects:v58 count:16];
          if (v16)
          {
            id v17 = v16;
            uint64_t v18 = *(void *)v51;
            do
            {
              for (i = 0LL; i != v17; i = (char *)i + 1)
              {
                if (*(void *)v51 != v18) {
                  objc_enumerationMutation(v15);
                }
                uint64_t v20 = *(void *)(*((void *)&v50 + 1) + 8LL * (void)i);
                __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v15 valueForKey:v20]);
                uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSNumber);
                char isKindOfClass = objc_opt_isKindOfClass(v21, v22);

                if ((isKindOfClass & 1) != 0)
                {
                  id v24 = (void *)objc_claimAutoreleasedReturnValue([v15 valueForKey:v20]);
                  id v25 = (char *)[v24 longLongValue];
                  uint64_t v26 = objc_claimAutoreleasedReturnValue([v11 valueForKey:v20]);
                  uint64_t v27 = (void *)v26;
                  if (v26) {
                    uint64_t v26 = (uint64_t)[(id)v26 longLongValue];
                  }
                  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  &v25[v26]));
                  [v11 setValue:v28 forKey:v20];
                }
              }

              id v17 = [v15 countByEnumeratingWithState:&v50 objects:v58 count:16];
            }

            while (v17);
          }

          uint64_t v14 = v49 + 1;
        }

        while ((id)(v49 + 1) != v48);
        id v48 = [obj countByEnumeratingWithState:&v54 objects:v59 count:16];
      }

      while (v48);
    }

    id v29 = (void *)objc_claimAutoreleasedReturnValue(-[SATelemetryManager getTelAppInfoTranslation:](self, "getTelAppInfoTranslation:", 0LL));
    id v13 = v43;
    [v11 setValue:v43 forKey:v29];

    runSignature = self->_runSignature;
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[SATelemetryManager getTelAppInfoTranslation:](self, "getTelAppInfoTranslation:", 1LL));
    [v11 setValue:runSignature forKey:v31];

    icloudPlan = self->_icloudPlan;
    __int128 v33 = (void *)objc_claimAutoreleasedReturnValue(-[SATelemetryManager getTelAppInfoTranslation:](self, "getTelAppInfoTranslation:", 4LL));
    [v11 setValue:icloudPlan forKey:v33];

    __int128 v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_SAFOptions));
    __int128 v35 = (void *)objc_claimAutoreleasedReturnValue(-[SATelemetryManager getTelAppInfoTranslation:](self, "getTelAppInfoTranslation:", 5LL));
    [v11 setValue:v34 forKey:v35];

    __int128 v36 = (void *)objc_claimAutoreleasedReturnValue(-[SATelemetryManager getTelAppInfoTranslation:](self, "getTelAppInfoTranslation:", v42));
    __int128 v37 = (void *)objc_claimAutoreleasedReturnValue(-[SATelemetryManager getTelAppInfoTranslation:](self, "getTelAppInfoTranslation:", 2LL));
    [v11 setValue:v36 forKey:v37];

    __int128 v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [obj count]));
    __int128 v39 = (void *)objc_claimAutoreleasedReturnValue(-[SATelemetryManager getTelAppInfoTranslation:](self, "getTelAppInfoTranslation:", 6LL));
    [v11 setValue:v38 forKey:v39];

    id v12 = v44;
    id v40 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "subarrayWithRange:", 0, a4));
  }

  return v40;
}

- (id)setAppInfoDictWithFirstPartyAppsKeys:(id)a3 WithThirdPartyAppKeys:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  id obj = v6;
  id v9 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v9)
  {
    id v10 = v9;
    id v26 = v7;
    uint64_t v11 = 0LL;
    uint64_t v12 = *(void *)v33;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v33 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v32 + 1) + 8LL * (void)i);
        __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v14, v26));
        -[SATelemetryManager setValue:forAppInfoEntry:forBundleSet:]( self,  "setValue:forAppInfoEntry:forBundleSet:",  (char *)i + v11,  6LL,  v15);

        id v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_appsInfo, "objectForKey:", v14));
        -[NSMutableArray addObject:](v8, "addObject:", v16);
      }

      id v10 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
      v11 += (uint64_t)i;
    }

    while (v10);
    id v7 = v26;
  }

  else
  {
    uint64_t v11 = 0LL;
  }

  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id v17 = v7;
  id v18 = [v17 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v29;
    do
    {
      for (j = 0LL; j != v19; j = (char *)j + 1)
      {
        if (*(void *)v29 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void *)(*((void *)&v28 + 1) + 8LL * (void)j);
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v22));
        -[SATelemetryManager setValue:forAppInfoEntry:forBundleSet:]( self,  "setValue:forAppInfoEntry:forBundleSet:",  (char *)j + v11,  6LL,  v23);

        id v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_appsInfo, "objectForKey:", v22));
        -[NSMutableArray addObject:](v8, "addObject:", v24);
      }

      id v19 = [v17 countByEnumeratingWithState:&v28 objects:v36 count:16];
      v11 += (uint64_t)j;
    }

    while (v19);
  }

  return v8;
}

- (void)removeAppsWithMultipleVendors
{
  id v3 = -[NSMutableDictionary copy](self->_appsInfo, "copy");
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10002C1A8;
  v4[3] = &unk_10004D440;
  v4[4] = self;
  [v3 enumerateKeysAndObjectsUsingBlock:v4];
}

- (void)sendTelemetry:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATelemetryManager hasResultsError](self, "hasResultsError"));
  if (+[SATapToRadar forceTTR](&OBJC_CLASS___SATapToRadar, "forceTTR") || v5) {
    +[SATapToRadar sendTapToRadarNotificationWithDescription:highPriorityProblem:]( &OBJC_CLASS___SATapToRadar,  "sendTapToRadarNotificationWithDescription:highPriorityProblem:",  v5,  0LL);
  }
  timeInfo = self->_timeInfo;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SATelemetryManager getTelTimeInfoTranslation:](self, "getTelTimeInfoTranslation:", 0LL));
  if (v3) {
    BOOL v8 = @"daily-activity-time-info";
  }
  else {
    BOOL v8 = @"user-time-info";
  }
  -[NSMutableDictionary setValue:forKey:](timeInfo, "setValue:forKey:", v8, v7);

  -[SATelemetryManager removeAppsWithMultipleVendors](self, "removeAppsWithMultipleVendors");
  -[SATelemetryManager setValue:forTotalsInfoEntry:]( self,  "setValue:forTotalsInfoEntry:",  -[SATelemetryManager appsNumber](self, "appsNumber"),  4LL);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[SASupport getEnterpriseVolumesPaths](&OBJC_CLASS___SASupport, "getEnterpriseVolumesPaths"));
  -[SATelemetryManager setValue:forTotalsInfoEntry:]( self,  "setValue:forTotalsInfoEntry:",  [v9 count],  5);

  -[SATelemetryManager setValue:forTimeInfoEntry:]( self,  "setValue:forTimeInfoEntry:",  -[SATelemetryManager appsNumber](self, "appsNumber"),  2LL);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SATelemetryManager getFirstPartyAppsInfoKeys](self, "getFirstPartyAppsInfoKeys"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SATelemetryManager sortAppsInfo:by:withOption:](self, "sortAppsInfo:by:withOption:", v10, 22LL, 1LL));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v11));

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[SATelemetryManager getThirdPartyAppsInfoKeys](self, "getThirdPartyAppsInfoKeys"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[SATelemetryManager sortAppsInfo:by:withOption:](self, "sortAppsInfo:by:withOption:", v13, 22LL, 1LL));
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v14));

  if ((byte_10005AB30 & 1) == 0)
  {
    uint64_t v16 = objc_claimAutoreleasedReturnValue( -[SATelemetryManager fillFilteredInfoDict:withNumberOfApps:withAppInfoArr:withFilterCriteria:withMetricType:]( self,  "fillFilteredInfoDict:withNumberOfApps:withAppInfoArr:withFilterCriteria:withMetricType:",  self->_thirdPartyfilteredInfo,  10LL,  v15,  22LL,  @"filtered-third-party-apps-info"));

    uint64_t v17 = objc_claimAutoreleasedReturnValue( -[SATelemetryManager fillFilteredInfoDict:withNumberOfApps:withAppInfoArr:withFilterCriteria:withMetricType:]( self,  "fillFilteredInfoDict:withNumberOfApps:withAppInfoArr:withFilterCriteria:withMetricType:",  self->_firstPartyfilteredInfo,  285LL,  v12,  22LL,  @"filtered-first-party-apps-info"));
    __int128 v15 = (void *)v16;
    uint64_t v12 = (void *)v17;
  }

  -[SATelemetryManager saveTelemetryDataToDisk:thirdPartyAppKeys:]( self,  "saveTelemetryDataToDisk:thirdPartyAppKeys:",  v12,  v15);
  BOOL v18 = +[SATelemetryManager shouldSendTelemetry:](&OBJC_CLASS___SATelemetryManager, "shouldSendTelemetry:", v3);
  if (v18 || (BOOL v18 = +[SAVolumeScanner shouldForceTelemetry](&OBJC_CLASS___SAVolumeScanner, "shouldForceTelemetry")))
  {
    uint64_t v19 = SALog(v18);
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Sending telemetry", buf, 2u);
    }

    v71[0] = _NSConcreteStackBlock;
    v71[1] = 3221225472LL;
    v71[2] = sub_10002CA48;
    v71[3] = &unk_10004D0F0;
    v71[4] = self;
    uint64_t v21 = AnalyticsSendEventLazy(@"com.apple.massStorage.spaceAttribution.info", v71);
    if ((v21 & 1) == 0)
    {
      uint64_t v22 = SALog(v21);
      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        sub_1000345F4();
      }
    }

    v70[0] = _NSConcreteStackBlock;
    v70[1] = 3221225472LL;
    v70[2] = sub_10002CA50;
    v70[3] = &unk_10004D0F0;
    v70[4] = self;
    uint64_t v24 = AnalyticsSendEventLazy(@"com.apple.massStorage.spaceAttribution.info", v70);
    if ((v24 & 1) == 0)
    {
      uint64_t v25 = SALog(v24);
      id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        sub_1000345C8();
      }
    }

    v69[0] = _NSConcreteStackBlock;
    v69[1] = 3221225472LL;
    v69[2] = sub_10002CA58;
    v69[3] = &unk_10004D0F0;
    v69[4] = self;
    uint64_t v27 = AnalyticsSendEventLazy(@"com.apple.massStorage.spaceAttribution.info", v69);
    if ((v27 & 1) == 0)
    {
      uint64_t v28 = SALog(v27);
      __int128 v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        sub_10003459C();
      }
    }

    v68[0] = _NSConcreteStackBlock;
    v68[1] = 3221225472LL;
    v68[2] = sub_10002CA60;
    v68[3] = &unk_10004D0F0;
    v68[4] = self;
    uint64_t v30 = AnalyticsSendEventLazy(@"com.apple.massStorage.spaceAttribution.info", v68);
    if ((v30 & 1) == 0)
    {
      uint64_t v31 = SALog(v30);
      __int128 v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        sub_100034570();
      }
    }

    BOOL v55 = v3;
    v67[0] = _NSConcreteStackBlock;
    v67[1] = 3221225472LL;
    v67[2] = sub_10002CA68;
    v67[3] = &unk_10004D0F0;
    v67[4] = self;
    uint64_t v33 = AnalyticsSendEventLazy(@"com.apple.massStorage.spaceAttribution.info", v67);
    if ((v33 & 1) == 0)
    {
      uint64_t v34 = SALog(v33);
      __int128 v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        sub_100034544();
      }
    }

    __int128 v56 = v5;
    __int128 v63 = 0u;
    __int128 v64 = 0u;
    __int128 v65 = 0u;
    __int128 v66 = 0u;
    __int128 v54 = v15;
    id v36 = v15;
    id v37 = [v36 countByEnumeratingWithState:&v63 objects:v75 count:16];
    if (v37)
    {
      id v38 = v37;
      uint64_t v39 = *(void *)v64;
      do
      {
        id v40 = 0LL;
        do
        {
          if (*(void *)v64 != v39) {
            objc_enumerationMutation(v36);
          }
          uint64_t v41 = *(void *)(*((void *)&v63 + 1) + 8LL * (void)v40);
          v62[0] = _NSConcreteStackBlock;
          v62[1] = 3221225472LL;
          v62[2] = sub_10002CA70;
          v62[3] = &unk_10004D468;
          v62[4] = self;
          v62[5] = v41;
          uint64_t v42 = AnalyticsSendEventLazy(@"com.apple.massStorage.spaceAttribution.info", v62);
          if ((v42 & 1) == 0)
          {
            uint64_t v43 = SALog(v42);
            v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
            if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v74 = v41;
              _os_log_error_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_ERROR,  "FAILED to log %@ appInfo using AnalyticsSendEventLazy\n",  buf,  0xCu);
            }
          }

          id v40 = (char *)v40 + 1;
        }

        while (v38 != v40);
        id v38 = [v36 countByEnumeratingWithState:&v63 objects:v75 count:16];
      }

      while (v38);
    }

    __int128 v60 = 0u;
    __int128 v61 = 0u;
    __int128 v58 = 0u;
    __int128 v59 = 0u;
    id v45 = v12;
    id v46 = [v45 countByEnumeratingWithState:&v58 objects:v72 count:16];
    if (v46)
    {
      id v47 = v46;
      uint64_t v48 = *(void *)v59;
      do
      {
        uint64_t v49 = 0LL;
        do
        {
          if (*(void *)v59 != v48) {
            objc_enumerationMutation(v45);
          }
          uint64_t v50 = *(void *)(*((void *)&v58 + 1) + 8LL * (void)v49);
          v57[0] = _NSConcreteStackBlock;
          v57[1] = 3221225472LL;
          v57[2] = sub_10002CAB4;
          v57[3] = &unk_10004D468;
          v57[4] = self;
          v57[5] = v50;
          uint64_t v51 = AnalyticsSendEventLazy(@"com.apple.massStorage.spaceAttribution.info", v57);
          if ((v51 & 1) == 0)
          {
            uint64_t v52 = SALog(v51);
            __int128 v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
            if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v74 = v50;
              _os_log_error_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_ERROR,  "FAILED to log %@ appInfo using AnalyticsSendEventLazy\n",  buf,  0xCu);
            }
          }

          uint64_t v49 = (char *)v49 + 1;
        }

        while (v47 != v49);
        id v47 = [v45 countByEnumeratingWithState:&v58 objects:v72 count:16];
      }

      while (v47);
    }

    +[SATelemetryManager updateLastSentTelemetryDate:]( &OBJC_CLASS___SATelemetryManager,  "updateLastSentTelemetryDate:",  v55);
    id v5 = v56;
    __int128 v15 = v54;
  }
}

+ (id)SATelAppInfoTranslationTable
{
  if (qword_10005AB40 != -1) {
    dispatch_once(&qword_10005AB40, &stru_10004D488);
  }
  return (id)qword_10005AB38;
}

+ (id)SATelTotalsInfoTranslationTable
{
  if (qword_10005AB50 != -1) {
    dispatch_once(&qword_10005AB50, &stru_10004D4A8);
  }
  return (id)qword_10005AB48;
}

+ (id)SATelTotalsDirStatsInfoTranslationTable
{
  if (qword_10005AB60 != -1) {
    dispatch_once(&qword_10005AB60, &stru_10004D4C8);
  }
  return (id)qword_10005AB58;
}

+ (id)SATelTimeInfoTranslationTable
{
  if (qword_10005AB70 != -1) {
    dispatch_once(&qword_10005AB70, &stru_10004D4E8);
  }
  return (id)qword_10005AB68;
}

- (id)getTelAppInfoTranslation:(int64_t)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SATelemetryManager SATelAppInfoTranslationTable]( &OBJC_CLASS___SATelemetryManager,  "SATelAppInfoTranslationTable"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v5]);

  return v6;
}

- (id)getTelTotalsInfoTranslation:(int64_t)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SATelemetryManager SATelTotalsInfoTranslationTable]( &OBJC_CLASS___SATelemetryManager,  "SATelTotalsInfoTranslationTable"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v5]);

  return v6;
}

- (id)getTelTotalsDirStatsInfoTranslation:(int64_t)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SATelemetryManager SATelTotalsDirStatsInfoTranslationTable]( &OBJC_CLASS___SATelemetryManager,  "SATelTotalsDirStatsInfoTranslationTable"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v5]);

  return v6;
}

- (id)getTelTimeInfoTranslation:(int64_t)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SATelemetryManager SATelTimeInfoTranslationTable]( &OBJC_CLASS___SATelemetryManager,  "SATelTimeInfoTranslationTable"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v5]);

  return v6;
}

- (id)hasResultsError
{
  unint64_t v3 = -[SATelemetryManager getValueForTotalsInfoEntry:](self, "getValueForTotalsInfoEntry:", 18LL);
  if (v3 <= 0x640000000LL)
  {
    if (v3 == 0x40000000)
    {
      uint64_t v6 = SALog(0x40000000LL);
      id obj = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR)) {
        sub_10003468C(obj, v7, v8, v9, v10, v11, v12, v13);
      }
      id v4 = @"SystemData size is negative";
    }

    else
    {
      __int128 v35 = 0u;
      __int128 v36 = 0u;
      __int128 v33 = 0u;
      __int128 v34 = 0u;
      id obj = self->_appsInfo;
      id v28 = -[os_log_s countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v33,  v38,  16LL);
      if (v28)
      {
        uint64_t v27 = *(void *)v34;
        do
        {
          uint64_t v14 = 0LL;
          do
          {
            if (*(void *)v34 != v27) {
              objc_enumerationMutation(obj);
            }
            __int128 v15 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_appsInfo,  "objectForKey:",  *(void *)(*((void *)&v33 + 1) + 8LL * (void)v14)));
            __int128 v29 = 0u;
            __int128 v30 = 0u;
            __int128 v31 = 0u;
            __int128 v32 = 0u;
            id v16 = [v15 countByEnumeratingWithState:&v29 objects:v37 count:16];
            if (v16)
            {
              id v17 = v16;
              uint64_t v18 = *(void *)v30;
              do
              {
                uint64_t v19 = 0LL;
                do
                {
                  if (*(void *)v30 != v18) {
                    objc_enumerationMutation(v15);
                  }
                  uint64_t v20 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)v19);
                  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( -[SATelemetryManager getTelAppInfoTranslation:]( self,  "getTelAppInfoTranslation:",  8LL));
                  unsigned __int8 v22 = [v20 isEqualToString:v21];

                  if ((v22 & 1) == 0)
                  {
                    v23 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKey:v20]);
                    uint64_t v24 = objc_opt_class(&OBJC_CLASS___NSNumber);
                    if ((objc_opt_isKindOfClass(v23, v24) & 1) != 0) {
                      [v23 longLongValue];
                    }
                  }

                  uint64_t v19 = (char *)v19 + 1;
                }

                while (v17 != v19);
                id v17 = [v15 countByEnumeratingWithState:&v29 objects:v37 count:16];
              }

              while (v17);
            }

            uint64_t v14 = (char *)v14 + 1;
          }

          while (v14 != v28);
          id v28 = -[os_log_s countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v33,  v38,  16LL);
        }

        while (v28);
      }

      id v4 = 0LL;
    }
  }

  else
  {
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SystemData size: %llu > %llu",  v3,  0x640000000LL));
    uint64_t v5 = SALog(v4);
    id obj = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR)) {
      sub_100034620();
    }
  }

  return v4;
}

+ (void)updateLastSentTelemetryDate:(BOOL)a3
{
  unint64_t v3 = @"lastUserSentTelemetryDate";
  if (a3) {
    unint64_t v3 = @"lastDailyActivitySentTelemetryDate";
  }
  id v4 = v3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  +[SARunTimeDataManager setRunTimeDataObject:forKey:]( &OBJC_CLASS___SARunTimeDataManager,  "setRunTimeDataObject:forKey:",  v5,  v4);
}

+ (id)getLastSentTelemetryDate:(BOOL)a3
{
  if (a3) {
    unint64_t v3 = @"lastDailyActivitySentTelemetryDate";
  }
  else {
    unint64_t v3 = @"lastUserSentTelemetryDate";
  }
  return +[SARunTimeDataManager runTimeDataObjectForKey:]( &OBJC_CLASS___SARunTimeDataManager,  "runTimeDataObjectForKey:",  v3);
}

+ (BOOL)shouldSendTelemetry:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SATelemetryManager getLastSentTelemetryDate:]( &OBJC_CLASS___SATelemetryManager,  "getLastSentTelemetryDate:"));
  if (v4)
  {
    if (v3) {
      double v5 = 86400.0;
    }
    else {
      double v5 = 604800.0;
    }
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v6 timeIntervalSinceDate:v4];
    BOOL v8 = v7 >= v5;
  }

  else
  {
    +[SATelemetryManager updateLastSentTelemetryDate:]( &OBJC_CLASS___SATelemetryManager,  "updateLastSentTelemetryDate:",  v3);
    BOOL v8 = 0;
  }

  return v8;
}

- (void)saveTelemetryDataToDisk:(id)a3 thirdPartyAppKeys:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v32 = 0LL;
  unsigned __int8 v9 = [v8 createDirectoryAtPath:@"/var/db/spaceattribution" withIntermediateDirectories:1 attributes:0 error:&v32];
  id v10 = v32;
  uint64_t v11 = v10;
  if ((v9 & 1) != 0)
  {
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[SATelemetryManager setAppInfoDictWithFirstPartyAppsKeys:WithThirdPartyAppKeys:]( self,  "setAppInfoDictWithFirstPartyAppsKeys:WithThirdPartyAppKeys:",  v6,  v7));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[SATelemetryManager dictionaryDescription](self, "dictionaryDescription"));
    [v13 setObject:v12 forKey:@"AppsInfo"];
    id v31 = v11;
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v13,  1LL,  &v31));
    id v15 = v31;

    if (v15)
    {
      uint64_t v17 = SALog(v16);
      uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_10003477C();
      }
    }

    else
    {
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@",  @"/var/db/spaceattribution",  @"SpaceAttributionTelemetryData.json"));
      id v30 = 0LL;
      [v14 writeToFile:v27 options:1 error:&v30];
      id v15 = v30;

      if (!v15)
      {
LABEL_11:

        uint64_t v11 = v15;
        goto LABEL_12;
      }

      uint64_t v29 = SALog(v28);
      uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_100034710();
      }
    }

    goto LABEL_11;
  }

  uint64_t v19 = SALog(v10);
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    sub_1000347E8(v12, v20, v21, v22, v23, v24, v25, v26);
  }
LABEL_12:
}

+ (void)getLastTelemetryData:(id)a3
{
  BOOL v3 = (void (**)(id, void, id))a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@",  @"/var/db/spaceattribution",  @"SpaceAttributionTelemetryData.json"));
  id v16 = 0LL;
  double v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfFile:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfFile:options:error:",  v4,  0LL,  &v16));
  id v6 = v16;

  if (v6) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = v5 == 0LL;
  }
  if (v8)
  {
    uint64_t v9 = SALog(v7);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10003486C();
    }

    v3[2](v3, 0LL, v6);
  }

  else
  {
    id v15 = 0LL;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v5,  0LL,  &v15));
    id v12 = v15;
    id v6 = v12;
    if (v12)
    {
      uint64_t v13 = SALog(v12);
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1000348D8();
      }
    }

    ((void (**)(id, void *, id))v3)[2](v3, v11, v6);
  }
}

- (id)getTimeInfoTranslatedDictionary
{
  if (qword_10005AB80 != -1) {
    dispatch_once(&qword_10005AB80, &stru_10004D508);
  }
  BOOL v3 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v4 = self->_timeInfo;
  id v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8LL * (void)i);
        id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_timeInfo, "objectForKey:", v9, (void)v13));
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_10005AB78 objectForKey:v9]);
        -[NSMutableDictionary setValue:forKey:](v3, "setValue:forKey:", v10, v11);
      }

      id v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    }

    while (v6);
  }

  return v3;
}

- (id)getTotalsDirstatInfoTranslatedDictionary
{
  if (qword_10005AB90 != -1) {
    dispatch_once(&qword_10005AB90, &stru_10004D528);
  }
  BOOL v3 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v4 = self->_totalsDstatsInfo;
  id v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8LL * (void)i);
        id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_totalsDstatsInfo, "objectForKey:", v9, (void)v13));
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_10005AB88 objectForKey:v9]);
        -[NSMutableDictionary setValue:forKey:](v3, "setValue:forKey:", v10, v11);
      }

      id v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    }

    while (v6);
  }

  return v3;
}

- (id)getTotalsInfoTranslatedDictionary
{
  if (qword_10005ABA0 != -1) {
    dispatch_once(&qword_10005ABA0, &stru_10004D548);
  }
  BOOL v3 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v4 = self->_totalsInfo;
  id v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8LL * (void)i);
        id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_totalsInfo, "objectForKey:", v9, (void)v13));
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_10005AB98 objectForKey:v9]);
        -[NSMutableDictionary setValue:forKey:](v3, "setValue:forKey:", v10, v11);
      }

      id v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    }

    while (v6);
  }

  return v3;
}

+ (void)clearLastTelemetryData:(id)a3
{
  BOOL v3 = (void (**)(id, id))a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@",  @"/var/db/spaceattribution",  @"SpaceAttributionTelemetryData.json"));
  id v7 = 0LL;
  [v4 removeItemAtPath:v5 error:&v7];
  id v6 = v7;

  v3[2](v3, v6);
}

+ (void)disableAppsFiltering
{
  byte_10005AB30 = 1;
}

+ (void)setAppsFilteringToDefault
{
  byte_10005AB30 = 0;
}

- (NSMutableDictionary)appsInfo
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setAppsInfo:(id)a3
{
}

- (NSMutableDictionary)totalsInfo
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setTotalsInfo:(id)a3
{
}

- (NSMutableDictionary)totalsDstatsInfo
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setTotalsDstatsInfo:(id)a3
{
}

- (NSMutableDictionary)timeInfo
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setTimeInfo:(id)a3
{
}

- (NSMutableDictionary)firstPartyfilteredInfo
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setFirstPartyfilteredInfo:(id)a3
{
}

- (NSMutableDictionary)thirdPartyfilteredInfo
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setThirdPartyfilteredInfo:(id)a3
{
}

- (NSNumber)icloudPlan
{
  return (NSNumber *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setIcloudPlan:(id)a3
{
}

- (unint64_t)appsNumber
{
  return self->_appsNumber;
}

- (void)setAppsNumber:(unint64_t)a3
{
  self->_appsNumber = a3;
}

- (NSMutableDictionary)times
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setTimes:(id)a3
{
}

- (NSString)runSignature
{
  return (NSString *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setRunSignature:(id)a3
{
}

- (unint64_t)SAFOptions
{
  return self->_SAFOptions;
}

- (void)setSAFOptions:(unint64_t)a3
{
  self->_SAFOptions = a3;
}

- (void).cxx_destruct
{
}

@end