@interface PLReportSearchIndexStatusMaintenanceTask
+ (void)_getCountOfAssetsInSpotlightForPhotoLibrary:(id)a3 completion:(id)a4;
- (BOOL)runTaskWithTransaction:(id)a3;
@end

@implementation PLReportSearchIndexStatusMaintenanceTask

+ (void)_getCountOfAssetsInSpotlightForPhotoLibrary:(id)a3 completion:(id)a4
{
  id v7 = a3;
  v8 = (void (**)(id, uint64_t, uint64_t))a4;
  if (!v8)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v19 handleFailureInMethod:a2, a1, @"PLReportSearchIndexStatusMaintenanceTask.m", 131, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }

  v9 = objc_alloc_init(&OBJC_CLASS___CSSearchQueryContext);
  -[CSSearchQueryContext setBundleIDs:](v9, "setBundleIDs:", &off_100021D20);
  -[CSSearchQueryContext setDisableBlockingOnIndex:](v9, "setDisableBlockingOnIndex:", 1LL);
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ == %@",  MDItemPhotosResultType,  PLSpotlightSearchResultContentTypeAsset));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v7 libraryServicesManager]);
  unsigned int v12 = +[PLSpotlightDonationUtilities shouldUseSpotlightPrivateIndexForLibraryIdentifier:]( PLSpotlightDonationUtilities,  "shouldUseSpotlightPrivateIndexForLibraryIdentifier:",  [v11 wellKnownPhotoLibraryIdentifier]);

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue([v7 pathManager]);
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 spotlightSearchIndexPath]);

    v15 = (CSSearchQuery *)[[CSManagedSearchQuery alloc] initWithPath:v14 queryString:v10 context:v9];
  }

  else
  {
    v15 = -[CSSearchQuery initWithQueryString:queryContext:]( objc_alloc(&OBJC_CLASS___CSSearchQuery),  "initWithQueryString:queryContext:",  v10,  v9);
  }

  uint64_t v28 = 0LL;
  v29 = &v28;
  uint64_t v30 = 0x3032000000LL;
  v31 = sub_10000E44C;
  v32 = sub_10000E45C;
  id v33 = 0LL;
  uint64_t v24 = 0LL;
  v25 = &v24;
  uint64_t v26 = 0x2020000000LL;
  uint64_t v27 = 0LL;
  dispatch_semaphore_t v16 = dispatch_semaphore_create(0LL);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_10000E464;
  v23[3] = &unk_100021020;
  v23[4] = &v24;
  -[CSSearchQuery setFoundItemsHandler:](v15, "setFoundItemsHandler:", v23);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10000E49C;
  v20[3] = &unk_100020FF8;
  v22 = &v28;
  v17 = v16;
  v21 = v17;
  -[CSSearchQuery setCompletionHandler:](v15, "setCompletionHandler:", v20);
  -[CSSearchQuery start](v15, "start");
  dispatch_time_t v18 = dispatch_time(0LL, 60000000000LL);
  dispatch_semaphore_wait(v17, v18);
  v8[2](v8, v25[3], v29[5]);

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);
}

- (BOOL)runTaskWithTransaction:(id)a3
{
  id v51 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PLMaintenanceTask photoLibrary](self, "photoLibrary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 libraryServicesManager]);
  id v6 = [v5 wellKnownPhotoLibraryIdentifier];

  if (v6 != (id)3)
  {
    id v50 = v6;
    uint64_t v7 = ((uint64_t (*)(void))PLSearchBackendIndexStatusMaintenanceTaskGetLog)();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Checking Search Index Status.", buf, 2u);
    }

    id v9 = objc_alloc_init(&OBJC_CLASS___PLCoreAnalyticsEventManager);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v6));
    uint64_t v11 = PLCoreAnalyticsSearchIndexStatusEvent;
    [v9 setPayloadValue:v10 forKey:PLCoreAnalyticsSearchIndexStatusPhotoLibraryWellKnownIdentifierKey onEventWithName:PLCoreAnalyticsSearchIndexStatusEvent];

    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v4 globalValues]);
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 searchIndexSpotlightClientStateMissingCount]);
    id v48 = [v13 unsignedIntegerValue];

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v48));
    [v9 setPayloadValue:v14 forKey:PLCoreAnalyticsSearchIndexStatusClientStateMissingCountKey onEventWithName:v11];

    v15 = (void *)objc_claimAutoreleasedReturnValue([v12 searchIndexSpotlightClientStateMismatchedCount]);
    id v47 = [v15 unsignedIntegerValue];

    dispatch_semaphore_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v47));
    [v9 setPayloadValue:v16 forKey:PLCoreAnalyticsSearchIndexStatusClientStateMismatchedCountKey onEventWithName:v11];

    uint64_t v64 = 0LL;
    v65 = &v64;
    uint64_t v66 = 0x2020000000LL;
    uint64_t v61 = 0LL;
    v62 = &v61;
    uint64_t v63 = 0x2020000000LL;
    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472LL;
    v57[2] = sub_10000EB5C;
    v57[3] = &unk_100020FA8;
    id v17 = v4;
    id v58 = v17;
    v59 = &v64;
    v60 = &v61;
    [v17 performBlockAndWait:v57];
    uint64_t v46 = v62[3] + v65[3];
    dispatch_time_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:"));
    [v9 setPayloadValue:v18 forKey:PLCoreAnalyticsSearchIndexStatusTotalAssetCountKey onEventWithName:v11];

    v19 = +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  PLFeaturesEnabledForCoreAnalyticsReporting());
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    [v9 setPayloadValue:v20 forKey:PLCoreAnalyticsSearchIndexStatusFeaturesEnabledKey onEventWithName:v11];

    char v56 = 0;
    [v12 searchIndexUptimeIsRebuildInProgress:&v56];
    if (v56) {
      double v22 = 0.0;
    }
    else {
      double v22 = v21;
    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v22));
    [v9 setPayloadValue:v23 forKey:PLCoreAnalyticsSearchIndexStatusUptimeSinceLastRebuildKey onEventWithName:v11];

    v25 = (void *)objc_opt_class(self, v24);
    v54[0] = _NSConcreteStackBlock;
    v54[1] = 3221225472LL;
    v54[2] = sub_10000EB7C;
    v54[3] = &unk_100020FD0;
    id v26 = v9;
    id v55 = v26;
    [v25 _getCountOfAssetsInSpotlightForPhotoLibrary:v17 completion:v54];
    v49 = (void *)objc_claimAutoreleasedReturnValue([v12 mediaAnalysisEmbeddingVersion]);
    LODWORD(v25) = [v49 intValue];
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( +[PLMediaAnalysisServiceRequestAdapter currentImageEmbeddingVersion]( &OBJC_CLASS___PLMediaAnalysisServiceRequestAdapter,  "currentImageEmbeddingVersion"));
    LODWORD(v25) = (_DWORD)v25 == [v27 intValue];

    if ((_DWORD)v25)
    {
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v12 searchFeatureReadyDate]);
      v29 = (void *)objc_claimAutoreleasedReturnValue([v12 libraryReadyForAnalysisDate]);
      uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v12 mediaAnalysisEmbeddingVersionBumpDate]);
      v31 = v30;
      if (v28 && v29 && v30)
      {
        [v30 timeIntervalSinceDate:v29];
        if (v32 <= 0.0) {
          id v33 = v29;
        }
        else {
          id v33 = v31;
        }
        id v45 = v33;
        objc_msgSend(v28, "timeIntervalSinceDate:");
        v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
        [v26 setPayloadValue:v34 forKey:PLCoreAnalyticsSearchIndexStatusFeatureReadyTimeKey onEventWithName:v11];

        v35 = (void *)objc_claimAutoreleasedReturnValue([v12 searchFeatureReadyFraction]);
        v36 = v35;
        if (v35)
        {
          [v35 doubleValue];
          v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v37 * 100.0));
          [v26 setPayloadValue:v38 forKey:PLCoreAnalyticsSearchIndexStatusFeatureReadyPercentageKey onEventWithName:v11];
        }
      }
    }

    [v26 publishEventWithName:v11];
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472LL;
    v52[2] = sub_10000EC7C;
    v52[3] = &unk_1000211C8;
    id v39 = v12;
    id v53 = v39;
    uint64_t Log = PLSearchBackendIndexStatusMaintenanceTaskGetLog([v17 performTransactionAndWait:v52]);
    v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue([v17 libraryServicesManager]);
      id v43 = [v42 wellKnownPhotoLibraryIdentifier];
      *(_DWORD *)buf = 134219266;
      id v68 = v48;
      __int16 v69 = 2048;
      id v70 = v47;
      __int16 v71 = 2048;
      uint64_t v72 = v46;
      __int16 v73 = 2048;
      double v74 = v22;
      __int16 v75 = 2048;
      id v76 = v43;
      __int16 v77 = 2112;
      id v78 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "Reporting Spotlight client state status, missing count: %tu, mismatched count: %tu, total asset count: %tu, and index uptime: %f for wellKnownIdentifier %lld, photoLibrary: %@",  buf,  0x3Eu);
    }

    _Block_object_dispose(&v61, 8);
    _Block_object_dispose(&v64, 8);

    id v6 = v50;
  }

  return v6 != (id)3;
}

@end