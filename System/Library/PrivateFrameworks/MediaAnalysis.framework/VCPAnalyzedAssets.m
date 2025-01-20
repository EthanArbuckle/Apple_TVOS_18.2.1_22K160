@interface VCPAnalyzedAssets
+ (id)assetsFromPhotoLibrary:(id)a3;
+ (id)assetsWithoutFingerprintsFromPhotoLibrary:(id)a3;
- (VCPAnalyzedAssets)initWithPhotoLibrary:(id)a3 andCondition:(id)a4;
- (int)next:(id *)a3;
- (unint64_t)count;
- (void)dealloc;
@end

@implementation VCPAnalyzedAssets

- (VCPAnalyzedAssets)initWithPhotoLibrary:(id)a3 andCondition:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v79.receiver = self;
  v79.super_class = (Class)&OBJC_CLASS___VCPAnalyzedAssets;
  v8 = -[VCPAnalyzedAssets init](&v79, "init");
  v9 = v8;
  if (!v8)
  {
    v26 = 0LL;
    goto LABEL_23;
  }

  v8->_database = 0LL;
  p_database = &v8->_database;
  v8->_statement = 0LL;
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithString:]( &OBJC_CLASS___NSMutableString,  "stringWithString:",  @"SELECT count(*) FROM Assets"));
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithString:]( &OBJC_CLASS___NSMutableString,  "stringWithString:",  @"SELECT localIdentifier, version, dateModified, dateAnalyzed, analysisTypes, flags, statsFlags, masterFingerprint, adjustedFingerprint FROM Assets"));
  if (v7)
  {
    [v11 appendFormat:@" WHERE %@", v7];
    [v12 appendFormat:@" WHERE %@", v7];
  }

  pStmt = 0LL;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "vcp_mediaAnalysisDatabaseFilepath"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned __int8 v15 = [v14 fileExistsAtPath:v13];

  if ((v15 & 1) == 0)
  {
    uint64_t v27 = MediaAnalysisLogLevel(v16, v17);
    if ((int)v27 >= 3)
    {
      uint64_t v29 = VCPLogInstance(v27, v28);
      v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      os_log_type_t v31 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v30, v31))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v30, v31, "[VCPAnalyzedAssets] Database file does not exist", buf, 2u);
      }
    }

    int v20 = -23;
    goto LABEL_16;
  }

  uint64_t v18 = sqlite3_open((const char *)[v13 UTF8String], &v9->_database);
  int v20 = v18;
  if ((_DWORD)v18)
  {
    uint64_t v21 = MediaAnalysisLogLevel(v18, v19);
    if ((int)v21 >= 3)
    {
      uint64_t v23 = VCPLogInstance(v21, v22);
      v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      os_log_type_t v25 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v24, v25))
      {
        *(_DWORD *)buf = 67109120;
        int v81 = v20;
        _os_log_impl((void *)&_mh_execute_header, v24, v25, "[VCPAnalyzedAssets] Failed to open database: %d", buf, 8u);
      }
    }

    goto LABEL_16;
  }

  uint64_t v41 = sqlite3_exec(*p_database, "BEGIN TRANSACTION;", 0LL, 0LL, 0LL);
  int v43 = v41;
  if (!(_DWORD)v41)
  {
    uint64_t v49 = sqlite3_prepare_v2( *p_database, (const char *)[v11 UTF8String], -1, &pStmt, 0);
    int v20 = v49;
    if ((_DWORD)v49)
    {
      uint64_t v51 = MediaAnalysisLogLevel(v49, v50);
      uint64_t v53 = VCPLogInstance(v51, v52);
      v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
      os_log_type_t v55 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v54, v55))
      {
        *(_DWORD *)buf = 67109120;
        int v81 = v20;
        _os_log_impl( (void *)&_mh_execute_header,  v54,  v55,  "[VCPAnalyzedAssets] Failed to prepare asset count query statement: %d",  buf,  8u);
      }
    }

    else
    {
      uint64_t v56 = sqlite3_prepare_v2( *p_database, (const char *)[v12 UTF8String], -1, &v9->_statement, 0);
      int v20 = v56;
      if (!(_DWORD)v56)
      {
        uint64_t v62 = sqlite3_exec(*p_database, "END TRANSACTION;", 0LL, 0LL, 0LL);
        int v64 = v62;
        if (!(_DWORD)v62)
        {
          uint64_t v70 = sqlite3_step(pStmt);
          int v72 = v70;
          if ((_DWORD)v70 == 100)
          {
            int v20 = 0;
            v9->_count = sqlite3_column_int(pStmt, 0);
          }

          else
          {
            uint64_t v73 = MediaAnalysisLogLevel(v70, v71);
            if ((int)v73 >= 3)
            {
              uint64_t v75 = VCPLogInstance(v73, v74);
              v76 = (os_log_s *)objc_claimAutoreleasedReturnValue(v75);
              os_log_type_t v77 = VCPLogToOSLogType[3];
              if (os_log_type_enabled(v76, v77))
              {
                *(_DWORD *)buf = 67109120;
                int v81 = v72;
                _os_log_impl( (void *)&_mh_execute_header,  v76,  v77,  "[VCPAnalyzedAssets] Failed to query asset count: %d",  buf,  8u);
              }
            }

            int v20 = -18;
          }

          goto LABEL_16;
        }

        uint64_t v65 = MediaAnalysisLogLevel(v62, v63);
        if ((int)v65 >= 3)
        {
          uint64_t v67 = VCPLogInstance(v65, v66);
          v68 = (os_log_s *)objc_claimAutoreleasedReturnValue(v67);
          os_log_type_t v69 = VCPLogToOSLogType[3];
          if (os_log_type_enabled(v68, v69))
          {
            *(_DWORD *)buf = 67109120;
            int v81 = v64;
            _os_log_impl( (void *)&_mh_execute_header,  v68,  v69,  "[VCPAnalyzedAssets] Failed to end transaction: %d",  buf,  8u);
          }
        }

        goto LABEL_29;
      }

      uint64_t v58 = MediaAnalysisLogLevel(v56, v57);
      uint64_t v60 = VCPLogInstance(v58, v59);
      v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
      os_log_type_t v61 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v54, v61))
      {
        *(_DWORD *)buf = 67109120;
        int v81 = v20;
        _os_log_impl( (void *)&_mh_execute_header,  v54,  v61,  "[VCPAnalyzedAssets] Failed to prepare asset properties query statement: %d",  buf,  8u);
      }
    }

    goto LABEL_16;
  }

  uint64_t v44 = MediaAnalysisLogLevel(v41, v42);
  if ((int)v44 >= 3)
  {
    uint64_t v46 = VCPLogInstance(v44, v45);
    v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
    os_log_type_t v48 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v47, v48))
    {
      *(_DWORD *)buf = 67109120;
      int v81 = v43;
      _os_log_impl( (void *)&_mh_execute_header,  v47,  v48,  "[VCPAnalyzedAssets] Failed to begin transaction: %d",  buf,  8u);
    }
  }

+ (id)assetsFromPhotoLibrary:(id)a3
{
  id v3 = a3;
  v4 = -[VCPAnalyzedAssets initWithPhotoLibrary:andCondition:]( objc_alloc(&OBJC_CLASS___VCPAnalyzedAssets),  "initWithPhotoLibrary:andCondition:",  v3,  0LL);

  return v4;
}

+ (id)assetsWithoutFingerprintsFromPhotoLibrary:(id)a3
{
  id v3 = a3;
  v4 = -[VCPAnalyzedAssets initWithPhotoLibrary:andCondition:]( objc_alloc(&OBJC_CLASS___VCPAnalyzedAssets),  "initWithPhotoLibrary:andCondition:",  v3,  @"masterFingerprint is NULL");

  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___VCPAnalyzedAssets;
  -[VCPAnalyzedAssets dealloc](&v3, "dealloc");
}

- (int)next:(id *)a3
{
  uint64_t v5 = sqlite3_step(self->_statement);
  if ((_DWORD)v5 == 100)
  {
    statement = self->_statement;
    if (sqlite3_column_type(statement, 0) == 5)
    {
      uint64_t v8 = 0LL;
    }

    else
    {
      uint64_t v16 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  sqlite3_column_text(statement, 0));
      uint64_t v8 = objc_claimAutoreleasedReturnValue(v16);
    }

    v34 = (void *)v8;
    uint64_t v17 = sqlite3_column_int(self->_statement, 1);
    uint64_t v18 = self->_statement;
    if (sqlite3_column_type(v18, 2) == 5)
    {
      uint64_t v33 = 0LL;
    }

    else
    {
      uint64_t v19 = +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  sqlite3_column_double(v18, 2));
      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(v19);
    }

    int v20 = self->_statement;
    if (sqlite3_column_type(v20, 3) == 5)
    {
      uint64_t v21 = v17;
      uint64_t v22 = 0LL;
    }

    else
    {
      uint64_t v23 = +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  sqlite3_column_double(v20, 3));
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(v23);
      uint64_t v21 = v17;
    }

    sqlite3_int64 v24 = sqlite3_column_int64(self->_statement, 4);
    int v25 = sqlite3_column_int(self->_statement, 5);
    sqlite3_int64 v26 = sqlite3_column_int64(self->_statement, 6);
    uint64_t v27 = self->_statement;
    if (sqlite3_column_type(v27, 7) == 5)
    {
      uint64_t v28 = 0LL;
    }

    else
    {
      uint64_t v29 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  sqlite3_column_text(v27, 7));
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(v29);
    }

    v30 = self->_statement;
    if (sqlite3_column_type(v30, 8) == 5)
    {
      os_log_type_t v31 = 0LL;
    }

    else
    {
      uint64_t v32 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  sqlite3_column_text(v30, 8));
      os_log_type_t v31 = (void *)objc_claimAutoreleasedReturnValue(v32);
    }

    *a3 = (id)objc_claimAutoreleasedReturnValue( +[VCPAnalyzedAsset assetWithLocalIdentifier:version:dateModified:dateAnalyzed:types:flags:statsFlags:masterFingerprint:adjustedFingerprint:]( &OBJC_CLASS___VCPAnalyzedAsset,  "assetWithLocalIdentifier:version:dateModified:dateAnalyzed:types:flags:statsFlags:mas terFingerprint:adjustedFingerprint:",  v34,  v21,  v33,  v22,  v24,  v25,  v26,  v28,  v31));

    return 0;
  }

  int v9 = v5;
  *a3 = 0LL;
  if ((_DWORD)v5 == 101) {
    return 0;
  }
  uint64_t v10 = MediaAnalysisLogLevel(v5, v6);
  if ((int)v10 >= 3)
  {
    uint64_t v12 = VCPLogInstance(v10, v11);
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    os_log_type_t v14 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v13, v14))
    {
      *(_DWORD *)buf = 67109120;
      int v36 = v9;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "[VCPAnalyzedAssets] Failed to query next asset: %d", buf, 8u);
    }
  }

  return -19;
}

- (unint64_t)count
{
  return self->_count;
}

@end