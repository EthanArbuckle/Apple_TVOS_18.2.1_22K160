@interface DSSnapshotRequest
- (BOOL)__collectSpaceAttributionSnapshot:(id *)a3;
- (BOOL)__createPreSnapshotVolumeManagerUsingProvider:(id)a3 error:(id *)a4;
- (BOOL)__createSnapshotFileManagerUsingProvider:(id)a3 error:(id *)a4;
- (BOOL)_setupManagersAndProgress:(id)a3 volumeManagerProvider:(id)a4 error:(id *)a5;
- (DSSnapshotFileManager)snapshotFileManager;
- (DSSnapshotRequest)initWithOptions:(id)a3;
- (DSSnapshotRequestTelemetryReporter)_telemetryReporter;
- (DSVolumeManager)_volumeManager;
- (NSDate)__endDate;
- (NSDate)__requestDate;
- (NSDate)beginDate;
- (NSDictionary)options;
- (NSMutableArray)__powerAssertionIDs;
- (NSProgress)__archivingProgress;
- (NSProgress)__atcProgress;
- (NSProgress)__cacheDeleteProgress;
- (NSProgress)__miscProgress;
- (NSProgress)__spaceAttributionProgress;
- (NSProgress)progress;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)formatVersion;
- (id)__createVolumeManagerUsingProvider:(id)a3 error:(id *)a4;
- (id)__doDataCollection:(id *)a3;
- (id)__fetchMetadata;
- (id)__stockSnapshotFileManagerProvider;
- (id)__stockVolumeManagerProvider;
- (id)executeWithError:(id *)a3;
- (void)__createPowerAssertions;
- (void)__incrementProgress:(id)a3 byPercent:(float)a4;
- (void)__initializeProgress;
- (void)__releasePowerAssertions;
- (void)set__archivingProgress:(id)a3;
- (void)set__atcProgress:(id)a3;
- (void)set__cacheDeleteProgress:(id)a3;
- (void)set__miscProgress:(id)a3;
- (void)set__spaceAttributionProgress:(id)a3;
@end

@implementation DSSnapshotRequest

- (id)__stockSnapshotFileManagerProvider
{
  if (qword_100066720 != -1) {
    dispatch_once(&qword_100066720, &stru_1000607F8);
  }
  return objc_retainBlock((id)qword_100066718);
}

- (id)__stockVolumeManagerProvider
{
  if (qword_100066730 != -1) {
    dispatch_once(&qword_100066730, &stru_100060858);
  }
  return objc_retainBlock((id)qword_100066728);
}

- (id)__fetchMetadata
{
  id v2 = shared_filesystem_metadata_snapshot_service_log_handle();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Fetching metadata", buf, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest snapshotFileManager](self, "snapshotFileManager"));
  BOOL v5 = fprintf((FILE *)[v4 sharedLogFile], "%s\t%s\n", "Version:", "1008") == -1;

  if (v5)
  {
    __error();
    if ((byte_100066738 & 1) == 0)
    {
      byte_100066738 = 1;
      id v6 = shared_filesystem_metadata_snapshot_service_log_handle();
      v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        sub_10002B480();
      }
    }
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest snapshotFileManager](self, "snapshotFileManager"));
  BOOL v9 = fprintf( (FILE *)[v8 sharedLogFile],  "%s\t%s\n",  "Snapshot Version:",  (const char *)objc_msgSend(@"2.7", "UTF8String")) == -1;

  if (v9)
  {
    __error();
    if ((byte_100066739 & 1) == 0)
    {
      byte_100066739 = 1;
      id v10 = shared_filesystem_metadata_snapshot_service_log_handle();
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
        sub_10002B480();
      }
    }
  }

  id v168 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  10LL));
  [v168 setObject:@"1008" forKeyedSubscript:@"DiskSpaceDiagnosticsVersion"];
  [v168 setObject:@"2.7" forKeyedSubscript:@"SnapshotVersion"];
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest options](self, "options"));
  v13 = (void *)objc_claimAutoreleasedReturnValue( [v12 objectForKeyedSubscript:@"FilesystemMetadatSnapshotOptionShouldHashVolumeListings"]);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v13 BOOLValue]));
  [v168 setObject:v14 forKeyedSubscript:@"HasHashedFSListings"];

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest beginDate](self, "beginDate"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone systemTimeZone](&OBJC_CLASS___NSTimeZone, "systemTimeZone"));
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSISO8601DateFormatter stringFromDate:timeZone:formatOptions:]( &OBJC_CLASS___NSISO8601DateFormatter,  "stringFromDate:timeZone:formatOptions:",  v15,  v16,  3955LL));
  [v168 setObject:v17 forKeyedSubscript:@"TimestampBegin"];

  id v18 = shared_filesystem_metadata_snapshot_service_log_handle();
  v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Fetching device info", buf, 2u);
  }

  v167 = (void *)MGCopyAnswer(@"ProductType", 0LL);
  v166 = (void *)MGCopyAnswer(@"marketing-name", 0LL);
  v165 = (void *)MGCopyAnswer(@"ProductName", 0LL);
  v164 = (void *)MGCopyAnswer(@"ProductVersion", 0LL);
  v163 = (void *)MGCopyAnswer(@"ProductVersionExtra", 0LL);
  v162 = (void *)MGCopyAnswer(@"SupplementalBuildVersion", 0LL);
  v161 = (void *)MGCopyAnswer(@"InternalBuild", 0LL);
  [v168 setObject:v167 forKeyedSubscript:@"HardwareModel"];
  [v168 setObject:v166 forKeyedSubscript:@"MarketingName"];
  v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@ %@ (%@)",  v165,  v164,  v163,  v162));
  [v168 setObject:v20 forKeyedSubscript:@"OSVersion"];

  [v168 setObject:v161 forKeyedSubscript:@"InternalBuild"];
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest __miscProgress](self, "__miscProgress"));
  LODWORD(v22) = 10.0;
  -[DSSnapshotRequest __incrementProgress:byPercent:](self, "__incrementProgress:byPercent:", v21, v22);

  id v23 = shared_filesystem_metadata_snapshot_service_log_handle();
  v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Fetching indirection table stats", buf, 2u);
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  CFDictionaryRef v26 = indirectionTableStatistics();
  v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  [v168 addEntriesFromDictionary:v27];

  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  [v28 timeIntervalSinceDate:v25];
  double v30 = v29;
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest snapshotFileManager](self, "snapshotFileManager"));
  BOOL v32 = fprintf( (FILE *)[v31 sharedLogFile],  "%s duration: %.0f seconds\n",  "[Metadata] Indirection table stats",  v30) == -1;

  if (v32)
  {
    __error();
    if ((byte_10006673A & 1) == 0)
    {
      byte_10006673A = 1;
      id v33 = shared_filesystem_metadata_snapshot_service_log_handle();
      v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT)) {
        sub_10002B480();
      }
    }
  }

  id v35 = shared_filesystem_metadata_snapshot_service_log_handle();
  v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "[Metadata] Indirection table stats";
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = v30;
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%s duration: %.0f seconds", buf, 0x16u);
  }

  -[DSSnapshotRequestTelemetryReporter setSnapshotMetadataIndirectionTableStatsDurationSec:]( self->__telemetryReporter,  "setSnapshotMetadataIndirectionTableStatsDurationSec:",  v30);
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest __miscProgress](self, "__miscProgress"));
  LODWORD(v38) = 10.0;
  -[DSSnapshotRequest __incrementProgress:byPercent:](self, "__incrementProgress:byPercent:", v37, v38);

  id v39 = shared_filesystem_metadata_snapshot_service_log_handle();
  v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Fetching apfs volume info", buf, 2u);
  }

  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest snapshotFileManager](self, "snapshotFileManager"));
  id v43 = apfsVolumeInfo((FILE *)[v42 sharedLogFile]);
  v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
  [v168 addEntriesFromDictionary:v44];

  v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  [v45 timeIntervalSinceDate:v41];
  double v47 = v46;
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest snapshotFileManager](self, "snapshotFileManager"));
  BOOL v49 = fprintf( (FILE *)[v48 sharedLogFile],  "%s duration: %.0f seconds\n",  "[Metadata] APFS volume info",  v47) == -1;

  if (v49)
  {
    __error();
    if ((byte_10006673B & 1) == 0)
    {
      byte_10006673B = 1;
      id v50 = shared_filesystem_metadata_snapshot_service_log_handle();
      v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
      if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT)) {
        sub_10002B480();
      }
    }
  }

  id v52 = shared_filesystem_metadata_snapshot_service_log_handle();
  v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "[Metadata] APFS volume info";
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = v47;
    _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "%s duration: %.0f seconds", buf, 0x16u);
  }

  -[DSSnapshotRequestTelemetryReporter setSnapshotMetadataAPFSVolumeInfoDurationSec:]( self->__telemetryReporter,  "setSnapshotMetadataAPFSVolumeInfoDurationSec:",  v47);
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest __miscProgress](self, "__miscProgress"));
  LODWORD(v55) = 10.0;
  -[DSSnapshotRequest __incrementProgress:byPercent:](self, "__incrementProgress:byPercent:", v54, v55);

  id v56 = shared_filesystem_metadata_snapshot_service_log_handle();
  v57 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);
  if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "Fetching snapshot info", buf, 2u);
  }

  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000LL;
  v190 = 0LL;
  v58 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest _volumeManager](self, "_volumeManager"));
  v60 = (void *)objc_claimAutoreleasedReturnValue([v59 volumesForSnapshotting]);
  v175[0] = _NSConcreteStackBlock;
  v175[1] = 3221225472LL;
  v175[2] = sub_10000966C;
  v175[3] = &unk_1000608C0;
  v61 = v58;
  v176 = v61;
  v177 = self;
  v178 = buf;
  [v60 enumerateObjectsUsingBlock:v175];

  -[DSSnapshotRequestTelemetryReporter setSnapshotMetadataAPFSSnapshotInfoDurationSec:]( self->__telemetryReporter,  "setSnapshotMetadataAPFSSnapshotInfoDurationSec:",  *(double *)(*(void *)&buf[8] + 24LL));
  v187 = @"FSSnapshots";
  v188 = v61;
  v62 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v188,  &v187,  1LL));
  [v168 addEntriesFromDictionary:v62];

  _Block_object_dispose(buf, 8);
  id v63 = shared_filesystem_metadata_snapshot_service_log_handle();
  v64 = (os_log_s *)objc_claimAutoreleasedReturnValue(v63);
  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "Fetching volume info", buf, 2u);
  }

  v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest _volumeManager](self, "_volumeManager"));
  v67 = (void *)objc_claimAutoreleasedReturnValue([v66 allVolumesInfoDict]);
  [v168 addEntriesFromDictionary:v67];

  v68 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest __stockVolumeManagerProvider](self, "__stockVolumeManagerProvider"));
  v69 = (void *)objc_claimAutoreleasedReturnValue( -[DSSnapshotRequest __createVolumeManagerUsingProvider:error:]( self,  "__createVolumeManagerUsingProvider:error:",  v68,  0LL));

  v70 = (void *)objc_claimAutoreleasedReturnValue([v69 allVolumesInfoDict]);
  v185 = @"VolumesPostSnapshot";
  v71 = (void *)objc_claimAutoreleasedReturnValue([v70 objectForKeyedSubscript:@"Volumes"]);
  v186 = v71;
  v72 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v186,  &v185,  1LL));

  [v168 addEntriesFromDictionary:v72];
  v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  [v73 timeIntervalSinceDate:v65];
  double v75 = v74;
  v76 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest snapshotFileManager](self, "snapshotFileManager"));
  BOOL v77 = fprintf( (FILE *)[v76 sharedLogFile],  "%s duration: %.0f seconds\n",  "[Metadata] Volume info",  v75) == -1;

  if (v77)
  {
    __error();
    if ((byte_10006673D & 1) == 0)
    {
      byte_10006673D = 1;
      id v78 = shared_filesystem_metadata_snapshot_service_log_handle();
      v79 = (os_log_s *)objc_claimAutoreleasedReturnValue(v78);
      if (os_log_type_enabled(v79, OS_LOG_TYPE_FAULT)) {
        sub_10002B480();
      }
    }
  }

  id v80 = shared_filesystem_metadata_snapshot_service_log_handle();
  v81 = (os_log_s *)objc_claimAutoreleasedReturnValue(v80);
  if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "[Metadata] Volume info";
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = v75;
    _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_DEFAULT, "%s duration: %.0f seconds", buf, 0x16u);
  }

  -[DSSnapshotRequestTelemetryReporter setSnapshotMetadataVolumeInfoDurationSec:]( self->__telemetryReporter,  "setSnapshotMetadataVolumeInfoDurationSec:",  v75);
  v82 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest __miscProgress](self, "__miscProgress"));
  LODWORD(v83) = 10.0;
  -[DSSnapshotRequest __incrementProgress:byPercent:](self, "__incrementProgress:byPercent:", v82, v83);

  id v84 = shared_filesystem_metadata_snapshot_service_log_handle();
  v85 = (os_log_s *)objc_claimAutoreleasedReturnValue(v84);
  if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_DEFAULT, "Fetching unlinked-open-files", buf, 2u);
  }

  v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  v87 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest snapshotFileManager](self, "snapshotFileManager"));
  id v88 = unlinkedOpenFiles((FILE *)[v87 sharedLogFile]);
  v89 = (void *)objc_claimAutoreleasedReturnValue(v88);
  [v168 addEntriesFromDictionary:v89];

  v90 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  [v90 timeIntervalSinceDate:v86];
  double v92 = v91;
  v93 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest snapshotFileManager](self, "snapshotFileManager"));
  BOOL v94 = fprintf( (FILE *)[v93 sharedLogFile],  "%s duration: %.0f seconds\n",  "[Metadata] Unlinked open files",  v92) == -1;

  if (v94)
  {
    __error();
    if ((byte_10006673E & 1) == 0)
    {
      byte_10006673E = 1;
      id v95 = shared_filesystem_metadata_snapshot_service_log_handle();
      v96 = (os_log_s *)objc_claimAutoreleasedReturnValue(v95);
      if (os_log_type_enabled(v96, OS_LOG_TYPE_FAULT)) {
        sub_10002B480();
      }
    }
  }

  id v97 = shared_filesystem_metadata_snapshot_service_log_handle();
  v98 = (os_log_s *)objc_claimAutoreleasedReturnValue(v97);
  if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "[Metadata] Unlinked open files";
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = v92;
    _os_log_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_DEFAULT, "%s duration: %.0f seconds", buf, 0x16u);
  }

  -[DSSnapshotRequestTelemetryReporter setSnapshotMetadataUnlinkedOpenFilesDurationSec:]( self->__telemetryReporter,  "setSnapshotMetadataUnlinkedOpenFilesDurationSec:",  v92);
  v99 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest __miscProgress](self, "__miscProgress"));
  LODWORD(v100) = 10.0;
  -[DSSnapshotRequest __incrementProgress:byPercent:](self, "__incrementProgress:byPercent:", v99, v100);

  id v101 = shared_filesystem_metadata_snapshot_service_log_handle();
  v102 = (os_log_s *)objc_claimAutoreleasedReturnValue(v101);
  if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v102, OS_LOG_TYPE_DEFAULT, "Fetching CacheDelete info", buf, 2u);
  }

  v160 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  v103 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v173 = 0u;
  __int128 v174 = 0u;
  __int128 v171 = 0u;
  __int128 v172 = 0u;
  v104 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest _volumeManager](self, "_volumeManager"));
  id obj = (id)objc_claimAutoreleasedReturnValue([v104 volumesForSnapshotting]);

  id v105 = [obj countByEnumeratingWithState:&v171 objects:v184 count:16];
  if (v105)
  {
    uint64_t v106 = *(void *)v172;
    do
    {
      v107 = 0LL;
      do
      {
        if (*(void *)v172 != v106) {
          objc_enumerationMutation(obj);
        }
        v108 = *(void **)(*((void *)&v171 + 1) + 8LL * (void)v107);
        v109 = objc_autoreleasePoolPush();
        id v110 = shared_filesystem_metadata_snapshot_service_log_handle();
        v111 = (os_log_s *)objc_claimAutoreleasedReturnValue(v110);
        if (os_log_type_enabled(v111, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          *(void *)&buf[4] = v108;
          _os_log_impl( (void *)&_mh_execute_header,  v111,  OS_LOG_TYPE_INFO,  "Fetching CacheDelete info for %{public}@",  buf,  0xCu);
        }

        v112 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
        v113 = (void *)objc_claimAutoreleasedReturnValue([v108 mountPoint]);
        id v114 = cacheDeleteInfo(v113);
        v115 = (void *)objc_claimAutoreleasedReturnValue(v114);
        [v103 addObject:v115];

        v116 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest __cacheDeleteProgress](self, "__cacheDeleteProgress"));
        v117 = (void *)objc_claimAutoreleasedReturnValue([v108 progress]);
        objc_msgSend( v116,  "setCompletedUnitCount:",  (uint64_t)((double)(uint64_t)objc_msgSend(v116, "completedUnitCount")
                  + (double)(uint64_t)[v117 totalUnitCount] * 0.1));

        v118 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
        [v118 timeIntervalSinceDate:v112];
        double v120 = v119;
        v121 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest snapshotFileManager](self, "snapshotFileManager"));
        LODWORD(v115) = fprintf( (FILE *)[v121 sharedLogFile],  "%s duration: %.0f seconds\n",  "[Metadata] CacheDeleteInfo for volume",  v120) == -1;

        if ((_DWORD)v115)
        {
          v122 = __error();
          if ((byte_10006673F & 1) == 0)
          {
            int v123 = *v122;
            byte_10006673F = 1;
            id v124 = shared_filesystem_metadata_snapshot_service_log_handle();
            v125 = (os_log_s *)objc_claimAutoreleasedReturnValue(v124);
            if (os_log_type_enabled(v125, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)&buf[4] = v123;
              _os_log_fault_impl( (void *)&_mh_execute_header,  v125,  OS_LOG_TYPE_FAULT,  "Failed to write to file: %{darwin.errno}d",  buf,  8u);
            }
          }
        }

        id v126 = shared_filesystem_metadata_snapshot_service_log_handle();
        v127 = (os_log_s *)objc_claimAutoreleasedReturnValue(v126);
        if (os_log_type_enabled(v127, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          *(void *)&buf[4] = "[Metadata] CacheDeleteInfo for volume";
          *(_WORD *)&buf[12] = 2048;
          *(double *)&buf[14] = v120;
          _os_log_impl((void *)&_mh_execute_header, v127, OS_LOG_TYPE_DEFAULT, "%s duration: %.0f seconds", buf, 0x16u);
        }

        id v128 = shared_filesystem_metadata_snapshot_service_log_handle();
        v129 = (os_log_s *)objc_claimAutoreleasedReturnValue(v128);
        if (os_log_type_enabled(v129, OS_LOG_TYPE_DEBUG)) {
          sub_10002B938((uint64_t)v183, (uint64_t)self);
        }

        objc_autoreleasePoolPop(v109);
        v107 = (char *)v107 + 1;
      }

      while (v105 != v107);
      id v105 = [obj countByEnumeratingWithState:&v171 objects:v184 count:16];
    }

    while (v105);
  }

  v130 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  [v130 timeIntervalSinceDate:v160];
  double v132 = v131;
  v133 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest snapshotFileManager](self, "snapshotFileManager"));
  BOOL v134 = fprintf( (FILE *)[v133 sharedLogFile],  "%s duration: %.0f seconds\n",  "[Metadata] CacheDeleteInfo",  v132) == -1;

  if (v134)
  {
    __error();
    if ((byte_100066740 & 1) == 0)
    {
      byte_100066740 = 1;
      id v135 = shared_filesystem_metadata_snapshot_service_log_handle();
      v136 = (os_log_s *)objc_claimAutoreleasedReturnValue(v135);
      if (os_log_type_enabled(v136, OS_LOG_TYPE_FAULT)) {
        sub_10002B480();
      }
    }
  }

  id v137 = shared_filesystem_metadata_snapshot_service_log_handle();
  v138 = (os_log_s *)objc_claimAutoreleasedReturnValue(v137);
  if (os_log_type_enabled(v138, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "[Metadata] CacheDeleteInfo";
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = v132;
    _os_log_impl((void *)&_mh_execute_header, v138, OS_LOG_TYPE_DEFAULT, "%s duration: %.0f seconds", buf, 0x16u);
  }

  -[DSSnapshotRequestTelemetryReporter setSnapshotMetadataCacheDeleteDurationSec:]( self->__telemetryReporter,  "setSnapshotMetadataCacheDeleteDurationSec:",  v132);
  [v168 setObject:v103 forKeyedSubscript:@"CacheDeletePerVolumeInfo"];

  v139 = objc_autoreleasePoolPush();
  id v140 = shared_filesystem_metadata_snapshot_service_log_handle();
  v141 = (os_log_s *)objc_claimAutoreleasedReturnValue(v140);
  if (os_log_type_enabled(v141, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v141, OS_LOG_TYPE_DEFAULT, "Fetching ATC assetMetrics", buf, 2u);
  }

  v142 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  uint64_t v179 = 0LL;
  v180 = &v179;
  uint64_t v181 = 0x2050000000LL;
  v143 = (void *)qword_100066750;
  uint64_t v182 = qword_100066750;
  if (!qword_100066750)
  {
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472LL;
    *(void *)&buf[16] = sub_10000CD34;
    v190 = &unk_100060910;
    v191 = &v179;
    sub_10000CD34((uint64_t)buf);
    v143 = (void *)v180[3];
  }

  v144 = v143;
  _Block_object_dispose(&v179, 8);
  id v145 = objc_alloc_init(v144);
  v146 = (void *)objc_claimAutoreleasedReturnValue([v145 getAssetMetrics]);
  [v168 setObject:v146 forKeyedSubscript:@"AssetMetrics"];

  v147 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  [v147 timeIntervalSinceDate:v142];
  double v149 = v148;
  v150 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest snapshotFileManager](self, "snapshotFileManager"));
  BOOL v151 = fprintf( (FILE *)[v150 sharedLogFile],  "%s duration: %.0f seconds\n",  "[Metadata] ATC AssetMetrics",  v149) == -1;

  if (v151)
  {
    __error();
    if ((byte_100066741 & 1) == 0)
    {
      byte_100066741 = 1;
      id v152 = shared_filesystem_metadata_snapshot_service_log_handle();
      v153 = (os_log_s *)objc_claimAutoreleasedReturnValue(v152);
      if (os_log_type_enabled(v153, OS_LOG_TYPE_FAULT)) {
        sub_10002B480();
      }
    }
  }

  id v154 = shared_filesystem_metadata_snapshot_service_log_handle();
  v155 = (os_log_s *)objc_claimAutoreleasedReturnValue(v154);
  if (os_log_type_enabled(v155, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "[Metadata] ATC AssetMetrics";
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = v149;
    _os_log_impl((void *)&_mh_execute_header, v155, OS_LOG_TYPE_DEFAULT, "%s duration: %.0f seconds", buf, 0x16u);
  }

  -[DSSnapshotRequestTelemetryReporter setSnapshotMetadataATCDurationSec:]( self->__telemetryReporter,  "setSnapshotMetadataATCDurationSec:",  v149);
  v156 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest __atcProgress](self, "__atcProgress"));
  LODWORD(v157) = 10.0;
  -[DSSnapshotRequest __incrementProgress:byPercent:](self, "__incrementProgress:byPercent:", v156, v157);

  objc_autoreleasePoolPop(v139);
  id v158 = v168;

  return v158;
}

- (BOOL)__collectSpaceAttributionSnapshot:(id *)a3
{
  uint64_t v74 = 0LL;
  double v75 = &v74;
  uint64_t v76 = 0x3032000000LL;
  BOOL v77 = sub_10000A1A8;
  id v78 = sub_10000A1B8;
  id v79 = 0LL;
  uint64_t v68 = 0LL;
  v69 = &v68;
  uint64_t v70 = 0x3032000000LL;
  v71 = sub_10000A1A8;
  v72 = sub_10000A1B8;
  id v73 = 0LL;
  v67[0] = _NSConcreteStackBlock;
  v67[1] = 3221225472LL;
  v67[2] = sub_10000A1C0;
  v67[3] = &unk_1000608E8;
  v67[4] = &v74;
  v67[5] = &v68;
  +[SAReporter reportSnapshot:](&OBJC_CLASS___SAReporter, "reportSnapshot:", v67);
  if (!v75[5] && v69[5])
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest snapshotFileManager](self, "snapshotFileManager"));
    v21 = (id *)(v75 + 5);
    id obj = (id)v75[5];
    double v22 = (void *)objc_claimAutoreleasedReturnValue([v20 fileURLForFileNamed:@"SpaceAttributionSnapshot.plist" error:&obj]);
    objc_storeStrong(v21, obj);

    if (v22)
    {
      id v23 = (void *)v69[5];
      v24 = (id *)(v75 + 5);
      id v65 = (id)v75[5];
      unsigned __int8 v25 = [v23 writeToURL:v22 error:&v65];
      objc_storeStrong(v24, v65);
      if ((v25 & 1) != 0)
      {
        id v26 = shared_filesystem_metadata_snapshot_service_log_handle();
        v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Successfully collected SpaceAttribution snapshot",  buf,  2u);
        }

        BOOL v19 = 1;
        goto LABEL_52;
      }

      id v43 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest snapshotFileManager](self, "snapshotFileManager"));
      v44 = (FILE *)[v43 sharedLogFile];
      id v45 = objc_claimAutoreleasedReturnValue([(id) v75[5] localizedDescription]);
      double v46 = (const char *)[v45 UTF8String];
      id v47 = objc_claimAutoreleasedReturnValue([(id) v69[5] description]);
      LODWORD(v44) = fprintf( v44,  "Error: Failed to write SpaceAttribution snapshot to file: %s\n%s\n",  v46,  (const char *)[v47 UTF8String]) == -1;

      if ((_DWORD)v44)
      {
        __error();
        if ((byte_100066746 & 1) == 0)
        {
          byte_100066746 = 1;
          id v48 = shared_filesystem_metadata_snapshot_service_log_handle();
          BOOL v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
          if (os_log_type_enabled(v49, OS_LOG_TYPE_FAULT)) {
            sub_10002B480();
          }
        }
      }

      id v50 = shared_filesystem_metadata_snapshot_service_log_handle();
      v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        id v61 = objc_claimAutoreleasedReturnValue([(id) v75[5] localizedDescription]);
        id v62 = [v61 UTF8String];
        id v63 = objc_claimAutoreleasedReturnValue([(id) v69[5] description]);
        id v64 = [v63 UTF8String];
        *(_DWORD *)buf = 136315394;
        id v81 = v62;
        __int16 v82 = 2080;
        id v83 = v64;
        _os_log_error_impl( (void *)&_mh_execute_header,  v51,  OS_LOG_TYPE_ERROR,  "Error: Failed to write SpaceAttribution snapshot to file: %s\n%s",  buf,  0x16u);
      }

      if (a3)
      {
        id v42 = (id) v75[5];
        goto LABEL_50;
      }
    }

    else
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest snapshotFileManager](self, "snapshotFileManager"));
      double v29 = (FILE *)[v28 sharedLogFile];
      id v30 = objc_claimAutoreleasedReturnValue([(id) v75[5] localizedDescription]);
      LODWORD(v29) = fprintf( v29,  "Error: Failed to get file URL for writing SpaceAttribution snapshot: %s\n",  (const char *)[v30 UTF8String]) == -1;

      if ((_DWORD)v29)
      {
        __error();
        if ((byte_100066744 & 1) == 0)
        {
          byte_100066744 = 1;
          id v31 = shared_filesystem_metadata_snapshot_service_log_handle();
          BOOL v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
          if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT)) {
            sub_10002B480();
          }
        }
      }

      id v33 = shared_filesystem_metadata_snapshot_service_log_handle();
      v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        id v57 = objc_claimAutoreleasedReturnValue([(id) v75[5] localizedDescription]);
        id v58 = [v57 UTF8String];
        *(_DWORD *)buf = 136315138;
        id v81 = v58;
        _os_log_error_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_ERROR,  "Error: Failed to get file URL for writing SpaceAttribution snapshot: %s",  buf,  0xCu);
      }

      id v35 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest snapshotFileManager](self, "snapshotFileManager"));
      v36 = (FILE *)[v35 sharedLogFile];
      id v37 = objc_claimAutoreleasedReturnValue([(id) v69[5] description]);
      LODWORD(v36) = fprintf(v36, "SpaceAttribution snapshot: %s\n", (const char *)[v37 UTF8String]) == -1;

      if ((_DWORD)v36)
      {
        __error();
        if ((byte_100066745 & 1) == 0)
        {
          byte_100066745 = 1;
          id v38 = shared_filesystem_metadata_snapshot_service_log_handle();
          id v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
          if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT)) {
            sub_10002B480();
          }
        }
      }

      id v40 = shared_filesystem_metadata_snapshot_service_log_handle();
      v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        id v59 = objc_claimAutoreleasedReturnValue([(id) v69[5] description]);
        id v60 = [v59 UTF8String];
        *(_DWORD *)buf = 136315138;
        id v81 = v60;
        _os_log_error_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_ERROR,  "SpaceAttribution snapshot: %s",  buf,  0xCu);
      }

      if (a3)
      {
        id v42 = (id) v75[5];
LABEL_50:
        BOOL v19 = 0;
        *a3 = v42;
LABEL_52:

        goto LABEL_53;
      }
    }

    BOOL v19 = 0;
    goto LABEL_52;
  }

  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest snapshotFileManager](self, "snapshotFileManager"));
  id v6 = (FILE *)[v5 sharedLogFile];
  id v7 = objc_claimAutoreleasedReturnValue([(id) v75[5] localizedDescription]);
  LODWORD(v6) = fprintf( v6,  "Error: Failed to collect SpaceAttribution snapshot: %s\n",  (const char *)[v7 UTF8String]) == -1;

  if ((_DWORD)v6)
  {
    __error();
    if ((byte_100066742 & 1) == 0)
    {
      byte_100066742 = 1;
      id v8 = shared_filesystem_metadata_snapshot_service_log_handle();
      BOOL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        sub_10002B480();
      }
    }
  }

  id v10 = shared_filesystem_metadata_snapshot_service_log_handle();
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    id v53 = objc_claimAutoreleasedReturnValue([(id) v75[5] localizedDescription]);
    id v54 = [v53 UTF8String];
    *(_DWORD *)buf = 136315138;
    id v81 = v54;
    _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "Error: Failed to collect SpaceAttribution snapshot: %s",  buf,  0xCu);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest snapshotFileManager](self, "snapshotFileManager"));
  v13 = (FILE *)[v12 sharedLogFile];
  id v14 = objc_claimAutoreleasedReturnValue([(id) v69[5] description]);
  LODWORD(v13) = fprintf(v13, "SpaceAttribution snapshot: %s\n", (const char *)[v14 UTF8String]) == -1;

  if ((_DWORD)v13)
  {
    __error();
    if ((byte_100066743 & 1) == 0)
    {
      byte_100066743 = 1;
      id v15 = shared_filesystem_metadata_snapshot_service_log_handle();
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
        sub_10002B480();
      }
    }
  }

  id v17 = shared_filesystem_metadata_snapshot_service_log_handle();
  id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    id v55 = objc_claimAutoreleasedReturnValue([(id) v69[5] description]);
    id v56 = [v55 UTF8String];
    *(_DWORD *)buf = 136315138;
    id v81 = v56;
    _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "SpaceAttribution snapshot: %s", buf, 0xCu);
  }

  BOOL v19 = 0;
  if (a3) {
    *a3 = (id) v75[5];
  }
LABEL_53:
  _Block_object_dispose(&v68, 8);

  _Block_object_dispose(&v74, 8);
  return v19;
}

- (void)__incrementProgress:(id)a3 byPercent:(float)a4
{
  id v6 = a3;
  [v6 fractionCompleted];
  if (v7 < 1.0) {
    objc_msgSend( v6,  "setCompletedUnitCount:",  (char *)objc_msgSend(v6, "completedUnitCount")
  }
    + (uint64_t)((double)(uint64_t)[v6 totalUnitCount] * 0.01 * a4));
  id v8 = shared_filesystem_metadata_snapshot_service_log_handle();
  BOOL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_10002B990(self);
  }
}

- (void)__initializeProgress
{
  id v2 = objc_autoreleasePoolPush();
  id v3 = shared_filesystem_metadata_snapshot_service_log_handle();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Setting up NSProgress", buf, 2u);
  }

  id v5 = shared_filesystem_metadata_snapshot_service_log_handle();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Calculating total units for each volume", buf, 2u);
  }

  __int128 v77 = 0u;
  __int128 v78 = 0u;
  __int128 v75 = 0u;
  __int128 v76 = 0u;
  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest _volumeManager](self, "_volumeManager"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 volumesForSnapshotting]);

  id obj = v8;
  id v9 = [v8 countByEnumeratingWithState:&v75 objects:v80 count:16];
  if (v9)
  {
    v72 = v2;
    uint64_t v10 = 0LL;
    uint64_t v11 = 0LL;
    uint64_t v12 = *(void *)v76;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v76 != v12) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v75 + 1) + 8LL * (void)i);
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 progress]);
        v11 += (uint64_t)[v15 totalUnitCount];

        v16 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest progress](self, "progress"));
        id v17 = (void *)objc_claimAutoreleasedReturnValue([v14 progress]);
        objc_msgSend( v16,  "setTotalUnitCount:",  (char *)objc_msgSend(v17, "totalUnitCount") + (void)objc_msgSend(v16, "totalUnitCount"));

        id v18 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest progress](self, "progress"));
        BOOL v19 = (void *)objc_claimAutoreleasedReturnValue([v14 progress]);
        v20 = (void *)objc_claimAutoreleasedReturnValue([v14 progress]);
        objc_msgSend(v18, "addChild:withPendingUnitCount:", v19, objc_msgSend(v20, "totalUnitCount"));

        v21 = (void *)objc_claimAutoreleasedReturnValue([v14 progress]);
        uint64_t v10 = (uint64_t)((double)v10 + (double)(uint64_t)[v21 totalUnitCount] * 0.1);
      }

      id v9 = [obj countByEnumeratingWithState:&v75 objects:v80 count:16];
    }

    while (v9);
    id v9 = (id)(uint64_t)((double)v11 * 0.1);
    id v2 = v72;
  }

  else
  {
    uint64_t v10 = 0LL;
  }

  double v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSProgress progressWithTotalUnitCount:](&OBJC_CLASS___NSProgress, "progressWithTotalUnitCount:", v9));
  -[DSSnapshotRequest set__atcProgress:](self, "set__atcProgress:", v22);

  id v23 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest progress](self, "progress"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest __atcProgress](self, "__atcProgress"));
  objc_msgSend( v23,  "setTotalUnitCount:",  (char *)objc_msgSend(v24, "totalUnitCount") + (void)objc_msgSend(v23, "totalUnitCount"));

  unsigned __int8 v25 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest progress](self, "progress"));
  id v26 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest __atcProgress](self, "__atcProgress"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest __atcProgress](self, "__atcProgress"));
  objc_msgSend(v25, "addChild:withPendingUnitCount:", v26, objc_msgSend(v27, "totalUnitCount"));

  id v28 = shared_filesystem_metadata_snapshot_service_log_handle();
  double v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
    sub_10002BBE8(self);
  }

  id v30 = shared_filesystem_metadata_snapshot_service_log_handle();
  id v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
    sub_10002B990(self);
  }

  BOOL v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSProgress progressWithTotalUnitCount:]( &OBJC_CLASS___NSProgress,  "progressWithTotalUnitCount:",  v10));
  -[DSSnapshotRequest set__cacheDeleteProgress:](self, "set__cacheDeleteProgress:", v32);

  id v33 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest progress](self, "progress"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest __cacheDeleteProgress](self, "__cacheDeleteProgress"));
  objc_msgSend( v33,  "setTotalUnitCount:",  (char *)objc_msgSend(v34, "totalUnitCount") + (void)objc_msgSend(v33, "totalUnitCount"));

  id v35 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest progress](self, "progress"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest __cacheDeleteProgress](self, "__cacheDeleteProgress"));
  id v37 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest __cacheDeleteProgress](self, "__cacheDeleteProgress"));
  objc_msgSend(v35, "addChild:withPendingUnitCount:", v36, objc_msgSend(v37, "totalUnitCount"));

  id v38 = shared_filesystem_metadata_snapshot_service_log_handle();
  id v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
    sub_10002BB70(self);
  }

  id v40 = shared_filesystem_metadata_snapshot_service_log_handle();
  v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG)) {
    sub_10002B990(self);
  }

  id v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSProgress progressWithTotalUnitCount:](&OBJC_CLASS___NSProgress, "progressWithTotalUnitCount:", v9));
  -[DSSnapshotRequest set__archivingProgress:](self, "set__archivingProgress:", v42);

  id v43 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest progress](self, "progress"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest __archivingProgress](self, "__archivingProgress"));
  objc_msgSend( v43,  "setTotalUnitCount:",  (char *)objc_msgSend(v44, "totalUnitCount") + (void)objc_msgSend(v43, "totalUnitCount"));

  id v45 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest progress](self, "progress"));
  double v46 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest __archivingProgress](self, "__archivingProgress"));
  id v47 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest __archivingProgress](self, "__archivingProgress"));
  objc_msgSend(v45, "addChild:withPendingUnitCount:", v46, objc_msgSend(v47, "totalUnitCount"));

  id v48 = shared_filesystem_metadata_snapshot_service_log_handle();
  BOOL v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG)) {
    sub_10002BAF8(self);
  }

  id v50 = shared_filesystem_metadata_snapshot_service_log_handle();
  v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG)) {
    sub_10002B990(self);
  }

  id v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSProgress progressWithTotalUnitCount:](&OBJC_CLASS___NSProgress, "progressWithTotalUnitCount:", v9));
  -[DSSnapshotRequest set__spaceAttributionProgress:](self, "set__spaceAttributionProgress:", v52);

  id v53 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest progress](self, "progress"));
  id v54 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest __spaceAttributionProgress](self, "__spaceAttributionProgress"));
  objc_msgSend( v53,  "setTotalUnitCount:",  (char *)objc_msgSend(v54, "totalUnitCount") + (void)objc_msgSend(v53, "totalUnitCount"));

  id v55 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest progress](self, "progress"));
  id v56 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest __spaceAttributionProgress](self, "__spaceAttributionProgress"));
  id v57 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest __spaceAttributionProgress](self, "__spaceAttributionProgress"));
  objc_msgSend(v55, "addChild:withPendingUnitCount:", v56, objc_msgSend(v57, "totalUnitCount"));

  id v58 = shared_filesystem_metadata_snapshot_service_log_handle();
  id v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG)) {
    sub_10002BA80(self);
  }

  id v60 = shared_filesystem_metadata_snapshot_service_log_handle();
  id v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
  if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG)) {
    sub_10002B990(self);
  }

  id v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSProgress progressWithTotalUnitCount:](&OBJC_CLASS___NSProgress, "progressWithTotalUnitCount:", v9));
  -[DSSnapshotRequest set__miscProgress:](self, "set__miscProgress:", v62);

  id v63 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest progress](self, "progress"));
  id v64 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest __miscProgress](self, "__miscProgress"));
  objc_msgSend( v63,  "setTotalUnitCount:",  (char *)objc_msgSend(v64, "totalUnitCount") + (void)objc_msgSend(v63, "totalUnitCount"));

  id v65 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest progress](self, "progress"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest __miscProgress](self, "__miscProgress"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest __miscProgress](self, "__miscProgress"));
  objc_msgSend(v65, "addChild:withPendingUnitCount:", v66, objc_msgSend(v67, "totalUnitCount"));

  id v68 = shared_filesystem_metadata_snapshot_service_log_handle();
  v69 = (os_log_s *)objc_claimAutoreleasedReturnValue(v68);
  if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG)) {
    sub_10002BA08(self);
  }

  id v70 = shared_filesystem_metadata_snapshot_service_log_handle();
  v71 = (os_log_s *)objc_claimAutoreleasedReturnValue(v70);
  if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG)) {
    sub_10002B990(self);
  }

  objc_autoreleasePoolPop(v2);
}

- (BOOL)__createSnapshotFileManagerUsingProvider:(id)a3 error:(id *)a4
{
  id v6 = (uint64_t (**)(id, DSSnapshotRequest *))a3;
  id v7 = shared_filesystem_metadata_snapshot_service_log_handle();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v37 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Creating snapshot file manager for %@",  buf,  0xCu);
  }

  if (a4) {
    *a4 = 0LL;
  }
  if (self->_snapshotFileManager) {
    sub_10002BCD4();
  }
  if (!v6)
  {
    id v20 = shared_filesystem_metadata_snapshot_service_log_handle();
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_10002BC60(v21, v22, v23, v24, v25, v26, v27, v28);
    }

    NSErrorUserInfoKey v34 = NSLocalizedDescriptionKey;
    id v35 = @"Snapshot file manager provider cannot be nil";
    double v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v35,  &v34,  1LL));
    id v14 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.FilesystemMetadataSnapshot",  65540LL,  v29));

    if (!a4) {
      goto LABEL_16;
    }
    goto LABEL_14;
  }

  uint64_t v9 = v6[2](v6, self);
  uint64_t v10 = (DSSnapshotFileManager *)objc_claimAutoreleasedReturnValue(v9);
  snapshotFileManager = self->_snapshotFileManager;
  self->_snapshotFileManager = v10;

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest snapshotFileManager](self, "snapshotFileManager"));
  id v33 = 0LL;
  unsigned int v13 = [v12 createWorkingDirectoryAndSharedFilesWithError:&v33];
  id v14 = v33;

  if (!v13 || v14)
  {
    if (!a4)
    {
LABEL_16:
      BOOL v19 = 0;
      goto LABEL_17;
    }

- (id)__createVolumeManagerUsingProvider:(id)a3 error:(id *)a4
{
  id v6 = (uint64_t (**)(id, DSSnapshotRequest *))a3;
  id v7 = shared_filesystem_metadata_snapshot_service_log_handle();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Creating volume manager", buf, 2u);
  }

  if (a4) {
    *a4 = 0LL;
  }
  if (v6)
  {
    uint64_t v9 = v6[2](v6, self);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    id v28 = 0LL;
    unsigned int v11 = [v10 discoverVolumesWithError:&v28];
    id v12 = v28;
    id v13 = v12;
    if (!v11 || v12)
    {
      if (!a4) {
        goto LABEL_18;
      }
    }

    else
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v10 volumesForSnapshotting]);
      id v15 = [v14 count];

      if (v15)
      {
        id v16 = v10;
        id v13 = 0LL;
LABEL_19:

        goto LABEL_20;
      }

      id v13 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.FilesystemMetadataSnapshot",  65542LL,  0LL));
      if (!a4)
      {
LABEL_18:
        id v16 = 0LL;
        goto LABEL_19;
      }
    }

    id v13 = v13;
    id v16 = 0LL;
    *a4 = v13;
    goto LABEL_19;
  }

  id v17 = shared_filesystem_metadata_snapshot_service_log_handle();
  id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    sub_10002BCFC(v18, v19, v20, v21, v22, v23, v24, v25);
  }

  NSErrorUserInfoKey v30 = NSLocalizedDescriptionKey;
  id v31 = @"Volume manager provider cannot be nil";
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v31,  &v30,  1LL));
  id v13 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.FilesystemMetadataSnapshot",  65540LL,  v26));

  if (a4)
  {
    id v13 = v13;
    id v16 = 0LL;
    *a4 = v13;
  }

  else
  {
    id v16 = 0LL;
  }

- (BOOL)__createPreSnapshotVolumeManagerUsingProvider:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = shared_filesystem_metadata_snapshot_service_log_handle();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Creating pre-snapshot volume manager for %@",  (uint8_t *)&v13,  0xCu);
  }

  if (objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest _volumeManager](self, "_volumeManager"))) {
    sub_10002BD70();
  }
  uint64_t v9 = (DSVolumeManager *)objc_claimAutoreleasedReturnValue( -[DSSnapshotRequest __createVolumeManagerUsingProvider:error:]( self,  "__createVolumeManagerUsingProvider:error:",  v6,  a4));
  volumeManager = self->__volumeManager;
  self->__volumeManager = v9;

  BOOL v11 = self->__volumeManager != 0LL;
  return v11;
}

- (id)__doDataCollection:(id *)a3
{
  id v5 = shared_filesystem_metadata_snapshot_service_log_handle();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v155 = (const char *)self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Collecting data and metadata %@", buf, 0xCu);
  }

  if (a3) {
    *a3 = 0LL;
  }
  v125 = a3;
  __int128 v145 = 0u;
  __int128 v146 = 0u;
  __int128 v143 = 0u;
  __int128 v144 = 0u;
  v129 = self;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest _volumeManager](self, "_volumeManager"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 volumesForSnapshotting]);

  id obj = v8;
  id v128 = [v8 countByEnumeratingWithState:&v143 objects:v158 count:16];
  char v9 = 0;
  uint64_t v10 = 0LL;
  id v11 = 0LL;
  if (v128)
  {
    uint64_t v127 = *(void *)v144;
    do
    {
      id v12 = 0LL;
      int v13 = v11;
      do
      {
        if (*(void *)v144 != v127) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v143 + 1) + 8LL * (void)v12);
        context = objc_autoreleasePoolPush();
        id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
        v147[0] = 0LL;
        id v142 = v13;
        unsigned __int8 v16 = [v14 listContentsWithEntryCount:v147 andError:&v142];
        id v11 = v142;

        uint64_t v17 = v147[0];
        id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
        [v18 timeIntervalSinceDate:v15];
        double v20 = v19;
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest snapshotFileManager](v129, "snapshotFileManager"));
        int v22 = fprintf((FILE *)[v21 sharedLogFile], "%s duration: %.0f seconds\n", "Volume listing", v20);

        if (v22 == -1)
        {
          uint64_t v23 = __error();
          if ((byte_100066748 & 1) == 0)
          {
            int v24 = *v23;
            byte_100066748 = 1;
            id v25 = shared_filesystem_metadata_snapshot_service_log_handle();
            uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
            if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 67109120;
              LODWORD(v155) = v24;
              _os_log_fault_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_FAULT,  "Failed to write to file: %{darwin.errno}d",  buf,  8u);
            }
          }
        }

        id v27 = shared_filesystem_metadata_snapshot_service_log_handle();
        id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v155 = "Volume listing";
          __int16 v156 = 2048;
          double v157 = v20;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%s duration: %.0f seconds", buf, 0x16u);
        }

        id v29 = shared_filesystem_metadata_snapshot_service_log_handle();
        NSErrorUserInfoKey v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
          sub_10002B938((uint64_t)v153, (uint64_t)v129);
        }
        v9 |= v16;
        v10 += v17;

        objc_autoreleasePoolPop(context);
        id v12 = (char *)v12 + 1;
        int v13 = v11;
      }

      while (v128 != v12);
      id v128 = [obj countByEnumeratingWithState:&v143 objects:v158 count:16];
    }

    while (v128);
  }

  -[DSSnapshotRequestTelemetryReporter setSnapshotFSListingsEntryCount:]( v129->__telemetryReporter,  "setSnapshotFSListingsEntryCount:",  v10);
  id v31 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest _volumeManager](v129, "_volumeManager"));
  BOOL v32 = (void *)objc_claimAutoreleasedReturnValue([v31 volumesForSnapshotting]);
  -[DSSnapshotRequestTelemetryReporter setSnapshotVolumeCount:]( v129->__telemetryReporter,  "setSnapshotVolumeCount:",  [v32 count]);

  if ((v9 & 1) == 0)
  {
    id v33 = v125;
    if (!v11) {
      id v11 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.FilesystemMetadataSnapshot",  65537LL,  0LL));
    }
    if ((v9 & 1) == 0)
    {
      id v83 = 0LL;
      if (v11) {
        goto LABEL_58;
      }
LABEL_63:
      __int128 v137 = 0u;
      __int128 v138 = 0u;
      __int128 v135 = 0u;
      __int128 v136 = 0u;
      v99 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest _volumeManager](v129, "_volumeManager"));
      double v100 = (void *)objc_claimAutoreleasedReturnValue([v99 volumesForSnapshotting]);

      id v101 = [v100 countByEnumeratingWithState:&v135 objects:v152 count:16];
      if (v101)
      {
        id v102 = v101;
        uint64_t v103 = *(void *)v136;
        do
        {
          for (i = 0LL; i != v102; i = (char *)i + 1)
          {
            if (*(void *)v136 != v103) {
              objc_enumerationMutation(v100);
            }
            id v105 = *(void **)(*((void *)&v135 + 1) + 8LL * (void)i);
            uint64_t v106 = (void *)objc_claimAutoreleasedReturnValue([v105 progress]);
            id v107 = [v106 totalUnitCount];
            v108 = (void *)objc_claimAutoreleasedReturnValue([v105 progress]);
            [v108 setCompletedUnitCount:v107];

            id v109 = shared_filesystem_metadata_snapshot_service_log_handle();
            id v110 = (os_log_s *)objc_claimAutoreleasedReturnValue(v109);
            if (os_log_type_enabled(v110, OS_LOG_TYPE_DEBUG)) {
              sub_10002B938((uint64_t)buf, (uint64_t)v129);
            }
          }

          id v102 = [v100 countByEnumeratingWithState:&v135 objects:v152 count:16];
        }

        while (v102);
      }

      atcProgress = v129->___atcProgress;
      __int128 v150 = *(_OWORD *)&v129->___cacheDeleteProgress;
      miscProgress = v129->___miscProgress;
      double v149 = atcProgress;
      BOOL v151 = miscProgress;
      __int128 v131 = 0u;
      __int128 v132 = 0u;
      __int128 v133 = 0u;
      __int128 v134 = 0u;
      id v113 = (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v149,  4LL));
      id v114 = [v113 countByEnumeratingWithState:&v131 objects:v148 count:16];
      if (v114)
      {
        id v115 = v114;
        uint64_t v116 = *(void *)v132;
        do
        {
          for (j = 0LL; j != v115; j = (char *)j + 1)
          {
            if (*(void *)v132 != v116) {
              objc_enumerationMutation(v113);
            }
            objc_msgSend( *(id *)(*((void *)&v131 + 1) + 8 * (void)j),  "setCompletedUnitCount:",  objc_msgSend(*(id *)(*((void *)&v131 + 1) + 8 * (void)j), "totalUnitCount"));
            id v118 = shared_filesystem_metadata_snapshot_service_log_handle();
            double v119 = (os_log_s *)objc_claimAutoreleasedReturnValue(v118);
            if (os_log_type_enabled(v119, OS_LOG_TYPE_DEBUG)) {
              sub_10002B938((uint64_t)v147, (uint64_t)v129);
            }
          }

          id v115 = [v113 countByEnumeratingWithState:&v131 objects:v148 count:16];
        }

        while (v115);
      }

      double v120 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest progress](v129, "progress"));
      id v121 = [v120 totalUnitCount];
      v122 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest progress](v129, "progress"));
      [v122 setCompletedUnitCount:v121];

      id v123 = shared_filesystem_metadata_snapshot_service_log_handle();
      id v124 = (os_log_s *)objc_claimAutoreleasedReturnValue(v123);
      if (os_log_type_enabled(v124, OS_LOG_TYPE_DEBUG)) {
        sub_10002B990(v129);
      }

      id v33 = v125;
      if (v125) {
        goto LABEL_59;
      }
      goto LABEL_60;
    }
  }

  NSErrorUserInfoKey v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  id v141 = v11;
  -[DSSnapshotRequest __collectSpaceAttributionSnapshot:](v129, "__collectSpaceAttributionSnapshot:", &v141);
  id v35 = v141;

  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  [v36 timeIntervalSinceDate:v34];
  double v38 = v37;
  id v39 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest snapshotFileManager](v129, "snapshotFileManager"));
  int v40 = fprintf( (FILE *)[v39 sharedLogFile],  "%s duration: %.0f seconds\n",  "SpaceAttribution snapshot",  v38);

  if (v40 == -1)
  {
    __error();
    if ((byte_100066749 & 1) == 0)
    {
      byte_100066749 = 1;
      id v41 = shared_filesystem_metadata_snapshot_service_log_handle();
      id v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT)) {
        sub_10002B480();
      }
    }
  }

  id v43 = shared_filesystem_metadata_snapshot_service_log_handle();
  v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v155 = "SpaceAttribution snapshot";
    __int16 v156 = 2048;
    double v157 = v38;
    _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "%s duration: %.0f seconds", buf, 0x16u);
  }

  id v45 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest __spaceAttributionProgress](v129, "__spaceAttributionProgress"));
  id v46 = [v45 totalUnitCount];
  id v47 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest __spaceAttributionProgress](v129, "__spaceAttributionProgress"));
  [v47 setCompletedUnitCount:v46];

  id v48 = shared_filesystem_metadata_snapshot_service_log_handle();
  BOOL v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG)) {
    sub_10002B990(v129);
  }

  id v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest __fetchMetadata](v129, "__fetchMetadata"));
  id v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  [v52 timeIntervalSinceDate:v50];
  double v54 = v53;
  id v55 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest snapshotFileManager](v129, "snapshotFileManager"));
  int v56 = fprintf((FILE *)[v55 sharedLogFile], "%s duration: %.0f seconds\n", "Metadata", v54);

  if (v56 == -1)
  {
    __error();
    if ((byte_10006674A & 1) == 0)
    {
      byte_10006674A = 1;
      id v57 = shared_filesystem_metadata_snapshot_service_log_handle();
      id v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
      if (os_log_type_enabled(v58, OS_LOG_TYPE_FAULT)) {
        sub_10002B480();
      }
    }
  }

  id v59 = shared_filesystem_metadata_snapshot_service_log_handle();
  id v60 = (os_log_s *)objc_claimAutoreleasedReturnValue(v59);
  if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v155 = "Metadata";
    __int16 v156 = 2048;
    double v157 = v54;
    _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "%s duration: %.0f seconds", buf, 0x16u);
  }

  id v61 = objc_alloc_init(&OBJC_CLASS___NSDate);
  endDate = v129->___endDate;
  v129->___endDate = v61;

  id v63 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest __endDate](v129, "__endDate"));
  id v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone systemTimeZone](&OBJC_CLASS___NSTimeZone, "systemTimeZone"));
  id v65 = (void *)objc_claimAutoreleasedReturnValue( +[NSISO8601DateFormatter stringFromDate:timeZone:formatOptions:]( &OBJC_CLASS___NSISO8601DateFormatter,  "stringFromDate:timeZone:formatOptions:",  v63,  v64,  3955LL));
  [v51 setObject:v65 forKeyedSubscript:@"TimestampEnd"];

  v66 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest snapshotFileManager](v129, "snapshotFileManager"));
  v67 = (FILE *)[v66 sharedLogFile];
  id v68 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest __endDate](v129, "__endDate"));
  id v69 = objc_claimAutoreleasedReturnValue([v68 description]);
  LODWORD(v67) = fprintf(v67, "Finished snapshotting at %s\n", (const char *)[v69 UTF8String]);

  if ((_DWORD)v67 == -1)
  {
    __error();
    if ((byte_10006674B & 1) == 0)
    {
      byte_10006674B = 1;
      id v70 = shared_filesystem_metadata_snapshot_service_log_handle();
      v71 = (os_log_s *)objc_claimAutoreleasedReturnValue(v70);
      if (os_log_type_enabled(v71, OS_LOG_TYPE_FAULT)) {
        sub_10002B480();
      }
    }
  }

  id v72 = shared_filesystem_metadata_snapshot_service_log_handle();
  id v73 = (os_log_s *)objc_claimAutoreleasedReturnValue(v72);
  if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v74 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest __endDate](v129, "__endDate"));
    id v75 = objc_claimAutoreleasedReturnValue([v74 description]);
    __int128 v76 = (const char *)[v75 UTF8String];
    *(_DWORD *)buf = 136315138;
    v155 = v76;
    _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEFAULT, "Finished snapshotting at %s", buf, 0xCu);
  }

  __int128 v77 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest snapshotFileManager](v129, "snapshotFileManager"));
  id v140 = v35;
  [v77 writeFileForMetadata:v51 error:&v140];
  id v78 = v140;

  id v79 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest __miscProgress](v129, "__miscProgress"));
  LODWORD(v80) = 10.0;
  -[DSSnapshotRequest __incrementProgress:byPercent:](v129, "__incrementProgress:byPercent:", v79, v80);

  id v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  __int16 v82 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest snapshotFileManager](v129, "snapshotFileManager"));
  id v139 = v78;
  id v83 = (void *)objc_claimAutoreleasedReturnValue([v82 archiveWithError:&v139]);
  id v11 = v139;

  id v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  [v84 timeIntervalSinceDate:v81];
  double v86 = v85;
  v87 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest snapshotFileManager](v129, "snapshotFileManager"));
  int v88 = fprintf((FILE *)[v87 sharedLogFile], "%s duration: %.0f seconds\n", "Archiving", v86);

  if (v88 == -1)
  {
    __error();
    if ((byte_10006674C & 1) == 0)
    {
      byte_10006674C = 1;
      id v89 = shared_filesystem_metadata_snapshot_service_log_handle();
      v90 = (os_log_s *)objc_claimAutoreleasedReturnValue(v89);
      if (os_log_type_enabled(v90, OS_LOG_TYPE_FAULT)) {
        sub_10002B480();
      }
    }
  }

  id v91 = shared_filesystem_metadata_snapshot_service_log_handle();
  double v92 = (os_log_s *)objc_claimAutoreleasedReturnValue(v91);
  if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v155 = "Archiving";
    __int16 v156 = 2048;
    double v157 = v86;
    _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_DEFAULT, "%s duration: %.0f seconds", buf, 0x16u);
  }

  v93 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest __archivingProgress](v129, "__archivingProgress"));
  id v94 = [v93 totalUnitCount];
  id v95 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest __archivingProgress](v129, "__archivingProgress"));
  [v95 setCompletedUnitCount:v94];

  id v96 = shared_filesystem_metadata_snapshot_service_log_handle();
  id v97 = (os_log_s *)objc_claimAutoreleasedReturnValue(v96);
  if (os_log_type_enabled(v97, OS_LOG_TYPE_DEBUG)) {
    sub_10002B990(v129);
  }

  id v33 = v125;
  if (!v11) {
    goto LABEL_63;
  }
LABEL_58:
  if (v33) {
LABEL_59:
  }
    *id v33 = v11;
LABEL_60:

  return v83;
}

- (void)__releasePowerAssertions
{
  id v3 = shared_filesystem_metadata_snapshot_service_log_handle();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Releasing power assertions", buf, 2u);
  }

  if (!self->___powerAssertionIDs) {
    sub_10002BD98();
  }
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest __powerAssertionIDs](self, "__powerAssertionIDs"));
  id v6 = [v5 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (!v6)
  {
LABEL_26:

    return;
  }

  id v7 = v6;
  char v8 = 0;
  uint64_t v9 = *(void *)v26;
  do
  {
    for (i = 0LL; i != v7; i = (char *)i + 1)
    {
      if (*(void *)v26 != v9) {
        objc_enumerationMutation(v5);
      }
      IOPMAssertionID v11 = [*(id *)(*((void *)&v25 + 1) + 8 * (void)i) unsignedIntValue];
      id v12 = shared_filesystem_metadata_snapshot_service_log_handle();
      int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        IOPMAssertionID v30 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Checking status of power assertion 0x%x",  buf,  8u);
      }

      CFDictionaryRef v14 = IOPMAssertionCopyProperties(v11);
      id v15 = shared_filesystem_metadata_snapshot_service_log_handle();
      unsigned __int8 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      uint64_t v17 = v16;
      if (!v14)
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          IOPMAssertionID v30 = v11;
          _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "Querying properties for power assertion 0x%x returned NULL - assertion must have timed out",  buf,  8u);
        }

        char v8 = 1;
        goto LABEL_20;
      }

      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        IOPMAssertionID v30 = v11;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Releasing power assertion 0x%x", buf, 8u);
      }

      IOReturn v18 = IOPMAssertionRelease(v11);
      if (v18)
      {
        IOReturn v19 = v18;
        id v20 = shared_filesystem_metadata_snapshot_service_log_handle();
        uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109376;
          IOPMAssertionID v30 = v11;
          __int16 v31 = 1024;
          IOReturn v32 = v19;
          _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Failed to release power assertion 0x%x: %d",  buf,  0xEu);
        }

- (void)__createPowerAssertions
{
  id v3 = shared_filesystem_metadata_snapshot_service_log_handle();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Creating power assertions", buf, 2u);
  }

  if (self->___powerAssertionIDs) {
    sub_10002BF38();
  }
  id v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  powerAssertionIDs = self->___powerAssertionIDs;
  self->___powerAssertionIDs = v5;

  id v7 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ collects diagnostics for filesystem utilization triage and may take time in the order of hours. To allow continued data collection while the user is away requires preventing the system from sleeping.",  @"com.apple.FilesystemMetadataSnapshotService");
  IOPMAssertionID AssertionID = 0;
  IOReturn v8 = IOPMAssertionCreateWithDescription( @"PreventUserIdleSystemSleep",  (CFStringRef)+[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.preventUserIdleSystemSleep",  @"com.apple.FilesystemMetadataSnapshotService"),  v7,  v7,  0LL,  1800.0,  @"TimeoutActionRelease",  &AssertionID);
  id v9 = shared_filesystem_metadata_snapshot_service_log_handle();
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  IOPMAssertionID v11 = v10;
  if (v8)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10002BED8();
    }
  }

  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      uint64_t v22 = 0x409C200000000000LL;
      __int16 v23 = 1024;
      IOPMAssertionID v24 = AssertionID;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Created power assertion to prevent system sleep (with a %0.2f sec timeout): 0x%x.",  buf,  0x12u);
    }

    IOPMAssertionID v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest __powerAssertionIDs](self, "__powerAssertionIDs"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", AssertionID));
    -[os_log_s addObject:](v11, "addObject:", v12);
  }

  int v13 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ collects diagnostics for filesystem utilization triage and may take time in the order of hours. To allow continued data collection while the user is away requires preventing disks from idling.",  @"com.apple.FilesystemMetadataSnapshotService");
  CFDictionaryRef v14 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.preventDiskIdle",  @"com.apple.FilesystemMetadataSnapshotService");
  IOPMAssertionID AssertionID = 0;
  IOReturn v15 = IOPMAssertionCreateWithDescription( @"PreventDiskIdle",  v14,  v13,  v13,  0LL,  1800.0,  @"TimeoutActionRelease",  &AssertionID);
  id v16 = shared_filesystem_metadata_snapshot_service_log_handle();
  uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  IOReturn v18 = v17;
  if (v15)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10002BE78();
    }
  }

  else
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      uint64_t v22 = 0x409C200000000000LL;
      __int16 v23 = 1024;
      IOPMAssertionID v24 = AssertionID;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Created power assertion to prevent disk idling (with a %0.2f sec timeout): 0x%x.",  buf,  0x12u);
    }

    IOReturn v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest __powerAssertionIDs](self, "__powerAssertionIDs"));
    IOReturn v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", AssertionID));
    -[os_log_s addObject:](v18, "addObject:", v19);
  }
}

- (BOOL)_setupManagersAndProgress:(id)a3 volumeManagerProvider:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = objc_alloc_init(&OBJC_CLASS___NSDate);
  beginDate = self->_beginDate;
  self->_beginDate = v10;

  id v12 = shared_filesystem_metadata_snapshot_service_log_handle();
  int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    CFDictionaryRef v14 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest beginDate](self, "beginDate"));
    int v20 = 138412290;
    uint64_t v21 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Begin date: %@", (uint8_t *)&v20, 0xCu);
  }

  unsigned int v15 = -[DSSnapshotRequest __createSnapshotFileManagerUsingProvider:error:]( self,  "__createSnapshotFileManagerUsingProvider:error:",  v9,  a5);
  if (v15
    && -[DSSnapshotRequest __createPreSnapshotVolumeManagerUsingProvider:error:]( self,  "__createPreSnapshotVolumeManagerUsingProvider:error:",  v8,  a5))
  {
    -[DSSnapshotRequest __initializeProgress](self, "__initializeProgress");
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest __miscProgress](self, "__miscProgress"));
    LODWORD(v17) = 10.0;
    -[DSSnapshotRequest __incrementProgress:byPercent:](self, "__incrementProgress:byPercent:", v16, v17);

    BOOL v18 = 1;
  }

  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

- (NSString)formatVersion
{
  return (NSString *)@"2.7";
}

- (id)executeWithError:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  id v6 = (DSSnapshotRequestTelemetryReporter *)objc_claimAutoreleasedReturnValue( +[DSSnapshotRequestTelemetryReporter telemetryReporterForSnapshotRequest:]( &OBJC_CLASS___DSSnapshotRequestTelemetryReporter,  "telemetryReporterForSnapshotRequest:",  self));
  telemetryReporter = self->__telemetryReporter;
  self->__telemetryReporter = v6;

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest __stockSnapshotFileManagerProvider](self, "__stockSnapshotFileManagerProvider"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest __stockVolumeManagerProvider](self, "__stockVolumeManagerProvider"));
  unsigned int v10 = -[DSSnapshotRequest _setupManagersAndProgress:volumeManagerProvider:error:]( self,  "_setupManagersAndProgress:volumeManagerProvider:error:",  v8,  v9,  a3);

  if (v10)
  {
    -[DSSnapshotRequest __createPowerAssertions](self, "__createPowerAssertions");
    IOPMAssertionID v11 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest __doDataCollection:](self, "__doDataCollection:", a3));
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest snapshotFileManager](self, "snapshotFileManager"));
    id v30 = 0LL;
    unsigned __int8 v13 = [v12 cleanupWithError:&v30];
    id v14 = v30;

    if (a3 && (v13 & 1) == 0 && !*a3) {
      *a3 = v14;
    }
    -[DSSnapshotRequest __releasePowerAssertions](self, "__releasePowerAssertions");
    unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    [v15 timeIntervalSinceDate:v5];
    double v17 = v16;
    BOOL v18 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest snapshotFileManager](self, "snapshotFileManager"));
    int v19 = fprintf((FILE *)[v18 sharedLogFile], "%s duration: %.0f seconds\n", "Snapshot request", v17);

    if (v19 == -1)
    {
      __error();
      if ((byte_10006674D & 1) == 0)
      {
        byte_10006674D = 1;
        id v20 = shared_filesystem_metadata_snapshot_service_log_handle();
        uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
          sub_10002B480();
        }
      }
    }

    id v22 = shared_filesystem_metadata_snapshot_service_log_handle();
    __int16 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      IOReturn v32 = "Snapshot request";
      __int16 v33 = 2048;
      double v34 = v17;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%s duration: %.0f seconds", buf, 0x16u);
    }

    -[DSSnapshotRequestTelemetryReporter setSnapshotDateEnd:](self->__telemetryReporter, "setSnapshotDateEnd:", v15);
    if (*a3) {
      -[DSSnapshotRequestTelemetryReporter setSnapshotExitCode:]( self->__telemetryReporter,  "setSnapshotExitCode:",  [*a3 code]);
    }
    if (v11)
    {
      IOPMAssertionID v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      id v29 = 0LL;
      __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v24 attributesOfItemAtPath:v11 error:&v29]);
      id v26 = v29;

      __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKeyedSubscript:NSFileSize]);
      -[DSSnapshotRequestTelemetryReporter setSnapshotArchiveSizeBytes:]( self->__telemetryReporter,  "setSnapshotArchiveSizeBytes:",  [v27 unsignedLongLongValue]);
    }

    -[DSSnapshotRequestTelemetryReporter submit](self->__telemetryReporter, "submit");
  }

  else
  {
    IOPMAssertionID v11 = 0LL;
  }

  return v11;
}

- (NSString)debugDescription
{
  id v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p> %@ (Options: %@)",  v5,  self,  self->___requestDate,  self->_options));

  return (NSString *)v6;
}

- (NSString)description
{
  id v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@> %@ (Options: %@)",  v5,  self->___requestDate,  self->_options));

  return (NSString *)v6;
}

- (DSSnapshotRequest)initWithOptions:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___DSSnapshotRequest;
  id v6 = -[DSSnapshotRequest init](&v14, "init");
  if (v6)
  {
    id v7 = shared_filesystem_metadata_snapshot_service_log_handle();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Snapshot request with options: %@", buf, 0xCu);
    }

    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    requestDate = v6->___requestDate;
    v6->___requestDate = (NSDate *)v9;

    objc_storeStrong((id *)&v6->_options, a3);
    uint64_t v11 = objc_claimAutoreleasedReturnValue(+[NSProgress progressWithTotalUnitCount:](&OBJC_CLASS___NSProgress, "progressWithTotalUnitCount:", 0LL));
    progress = v6->_progress;
    v6->_progress = (NSProgress *)v11;

    -[NSProgress setCancellable:](v6->_progress, "setCancellable:", 0LL);
    -[NSProgress setPausable:](v6->_progress, "setPausable:", 0LL);
  }

  return v6;
}

- (NSDictionary)options
{
  return (NSDictionary *)objc_getProperty(self, a2, 8LL, 1);
}

- (NSProgress)progress
{
  return (NSProgress *)objc_getProperty(self, a2, 16LL, 1);
}

- (NSDate)beginDate
{
  return (NSDate *)objc_getProperty(self, a2, 24LL, 1);
}

- (DSSnapshotFileManager)snapshotFileManager
{
  return (DSSnapshotFileManager *)objc_getProperty(self, a2, 32LL, 1);
}

- (NSDate)__requestDate
{
  return (NSDate *)objc_getProperty(self, a2, 40LL, 1);
}

- (NSDate)__endDate
{
  return (NSDate *)objc_getProperty(self, a2, 48LL, 1);
}

- (NSMutableArray)__powerAssertionIDs
{
  return (NSMutableArray *)objc_getProperty(self, a2, 56LL, 1);
}

- (NSProgress)__atcProgress
{
  return (NSProgress *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)set__atcProgress:(id)a3
{
}

- (NSProgress)__cacheDeleteProgress
{
  return (NSProgress *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)set__cacheDeleteProgress:(id)a3
{
}

- (NSProgress)__archivingProgress
{
  return (NSProgress *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)set__archivingProgress:(id)a3
{
}

- (NSProgress)__spaceAttributionProgress
{
  return (NSProgress *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)set__spaceAttributionProgress:(id)a3
{
}

- (NSProgress)__miscProgress
{
  return (NSProgress *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)set__miscProgress:(id)a3
{
}

- (DSVolumeManager)_volumeManager
{
  return (DSVolumeManager *)objc_getProperty(self, a2, 104LL, 1);
}

- (DSSnapshotRequestTelemetryReporter)_telemetryReporter
{
  return (DSSnapshotRequestTelemetryReporter *)objc_getProperty(self, a2, 112LL, 1);
}

- (void).cxx_destruct
{
}

@end