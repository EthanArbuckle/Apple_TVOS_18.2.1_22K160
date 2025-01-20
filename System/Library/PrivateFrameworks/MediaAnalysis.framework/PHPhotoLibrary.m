@interface PHPhotoLibrary
- (BOOL)mad_isBackupRestoreEligibleForTask:(unint64_t)a3;
- (BOOL)vcp_openAndWaitWithUpgrade:(BOOL)a3 error:(id *)a4;
- (id)mad_backupFilepathForTask:(unint64_t)a3;
- (id)mad_intermediateEncryptedBackupFilepathForTask:(unint64_t)a3;
- (id)mad_intermediateEncryptedRestoreFilepathForTask:(unint64_t)a3;
- (id)mad_intermediateUnencryptedBackupFilepathForTask:(unint64_t)a3;
- (id)mad_intermediateUnencryptedRestoreFilepathForTask:(unint64_t)a3;
- (id)mad_restoreDirectory;
- (id)mad_restoreStatusFilepath;
- (id)vcp_mediaAnalysisBackupDirectory;
- (id)vcp_mediaAnalysisBackupFilepath;
- (id)vcp_mediaAnalysisIntermediateBackupDirectory;
- (id)vcp_mediaAnalysisIntermediateRestoreDirectory;
- (int)_bumpFaceProcessingVersionIfNeededWithError:(id *)a3;
- (int)_migrateVectorDatabaseIfNeededWithError:(id *)a3;
- (int)_resetChangeTokenAndProcessingStatusForFaceProcessing;
- (int)_resetCurrentFaceProgress;
- (int)_resetEmbeddingClusteringProgress;
- (int)_signalPhotosAvailabilityStateChangeWithError:(id *)a3;
- (int)vcp_bumpFaceProcessingToVersion:(int)a3 withError:(id *)a4;
@end

@implementation PHPhotoLibrary

- (id)vcp_mediaAnalysisBackupDirectory
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHPhotoLibrary vcp_mediaAnalysisDirectory](self, "vcp_mediaAnalysisDirectory"));
  v3 = v2;
  if (v2) {
    v4 = (void *)objc_claimAutoreleasedReturnValue([v2 stringByAppendingPathComponent:@".backup"]);
  }
  else {
    v4 = 0LL;
  }

  return v4;
}

- (id)vcp_mediaAnalysisBackupFilepath
{
  return -[PHPhotoLibrary mad_backupFilepathForTask:](self, "mad_backupFilepathForTask:", 1LL);
}

- (id)mad_backupFilepathForTask:(unint64_t)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHPhotoLibrary vcp_mediaAnalysisBackupDirectory](self, "vcp_mediaAnalysisBackupDirectory"));
  v6 = v4;
  if (v4)
  {
    switch(a3)
    {
      case 1uLL:
        v7 = @"mediaanalysis.aea";
        break;
      case 2uLL:
        v7 = @"sceneanalysis.aea";
        break;
      case 3uLL:
        v7 = @"faceanalysis.aea";
        break;
      case 0xAuLL:
        v7 = @"ocranalysis.aea";
        break;
      default:
        uint64_t v13 = MediaAnalysisLogLevel(v4, v5);
        if ((int)v13 >= 3)
        {
          uint64_t v15 = VCPLogInstance(v13, v14);
          v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
          os_log_type_t v17 = VCPLogToOSLogType[3];
          if (os_log_type_enabled(v16, v17))
          {
            uint64_t v18 = VCPTaskIDDescription(a3);
            v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
            int v22 = 138412290;
            v23 = v19;
            _os_log_impl((void *)&_mh_execute_header, v16, v17, "%@ unavailable for backup", (uint8_t *)&v22, 0xCu);
          }
        }

        goto LABEL_14;
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByAppendingPathComponent:v7]);
  }

  else
  {
    uint64_t v8 = MediaAnalysisLogLevel(0LL, v5);
    if ((int)v8 >= 4)
    {
      uint64_t v10 = VCPLogInstance(v8, v9);
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      os_log_type_t v12 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v11, v12))
      {
        LOWORD(v22) = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, v12, "Unexpected nil backup directory", (uint8_t *)&v22, 2u);
      }
    }

- (id)vcp_mediaAnalysisIntermediateBackupDirectory
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHPhotoLibrary vcp_mediaAnalysisDirectory](self, "vcp_mediaAnalysisDirectory"));
  v3 = v2;
  if (v2) {
    v4 = (void *)objc_claimAutoreleasedReturnValue([v2 stringByAppendingPathComponent:@".intermediate_backup"]);
  }
  else {
    v4 = 0LL;
  }

  return v4;
}

- (id)mad_intermediateUnencryptedBackupFilepathForTask:(unint64_t)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[PHPhotoLibrary vcp_mediaAnalysisIntermediateBackupDirectory]( self,  "vcp_mediaAnalysisIntermediateBackupDirectory"));
  v6 = v4;
  if (v4)
  {
    switch(a3)
    {
      case 1uLL:
        v7 = @"mediaanalysis_unencrypted.backup";
        break;
      case 2uLL:
        v7 = @"sceneanalysis_unencrypted.backup";
        break;
      case 3uLL:
        v7 = @"faceanalysis_unencrypted.backup";
        break;
      case 0xAuLL:
        v7 = @"ocranalysis_unencrypted.backup";
        break;
      default:
        uint64_t v13 = MediaAnalysisLogLevel(v4, v5);
        if ((int)v13 >= 3)
        {
          uint64_t v15 = VCPLogInstance(v13, v14);
          v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
          os_log_type_t v17 = VCPLogToOSLogType[3];
          if (os_log_type_enabled(v16, v17))
          {
            uint64_t v18 = VCPTaskIDDescription(a3);
            v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
            int v22 = 138412290;
            v23 = v19;
            _os_log_impl((void *)&_mh_execute_header, v16, v17, "%@ unavailable for backup", (uint8_t *)&v22, 0xCu);
          }
        }

        goto LABEL_14;
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByAppendingPathComponent:v7]);
  }

  else
  {
    uint64_t v8 = MediaAnalysisLogLevel(0LL, v5);
    if ((int)v8 >= 4)
    {
      uint64_t v10 = VCPLogInstance(v8, v9);
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      os_log_type_t v12 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v11, v12))
      {
        LOWORD(v22) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  v12,  "Unexpected nil intermediate backup directory",  (uint8_t *)&v22,  2u);
      }
    }

- (id)mad_intermediateEncryptedBackupFilepathForTask:(unint64_t)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[PHPhotoLibrary vcp_mediaAnalysisIntermediateBackupDirectory]( self,  "vcp_mediaAnalysisIntermediateBackupDirectory"));
  v6 = v4;
  if (v4)
  {
    switch(a3)
    {
      case 1uLL:
        v7 = @"mediaanalysis.aea";
        break;
      case 2uLL:
        v7 = @"sceneanalysis.aea";
        break;
      case 3uLL:
        v7 = @"faceanalysis.aea";
        break;
      case 0xAuLL:
        v7 = @"ocranalysis.aea";
        break;
      default:
        uint64_t v13 = MediaAnalysisLogLevel(v4, v5);
        if ((int)v13 >= 3)
        {
          uint64_t v15 = VCPLogInstance(v13, v14);
          v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
          os_log_type_t v17 = VCPLogToOSLogType[3];
          if (os_log_type_enabled(v16, v17))
          {
            uint64_t v18 = VCPTaskIDDescription(a3);
            v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
            int v22 = 138412290;
            v23 = v19;
            _os_log_impl((void *)&_mh_execute_header, v16, v17, "%@ unavailable for backup", (uint8_t *)&v22, 0xCu);
          }
        }

        goto LABEL_14;
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByAppendingPathComponent:v7]);
  }

  else
  {
    uint64_t v8 = MediaAnalysisLogLevel(0LL, v5);
    if ((int)v8 >= 4)
    {
      uint64_t v10 = VCPLogInstance(v8, v9);
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      os_log_type_t v12 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v11, v12))
      {
        LOWORD(v22) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  v12,  "Unexpected nil intermediate backup directory",  (uint8_t *)&v22,  2u);
      }
    }

- (id)vcp_mediaAnalysisIntermediateRestoreDirectory
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHPhotoLibrary vcp_mediaAnalysisDirectory](self, "vcp_mediaAnalysisDirectory"));
  v3 = v2;
  if (v2) {
    v4 = (void *)objc_claimAutoreleasedReturnValue([v2 stringByAppendingPathComponent:@".intermediate_restore"]);
  }
  else {
    v4 = 0LL;
  }

  return v4;
}

- (id)mad_intermediateEncryptedRestoreFilepathForTask:(unint64_t)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[PHPhotoLibrary vcp_mediaAnalysisIntermediateRestoreDirectory]( self,  "vcp_mediaAnalysisIntermediateRestoreDirectory"));
  v6 = v4;
  if (v4)
  {
    switch(a3)
    {
      case 1uLL:
        v7 = @"mediaanalysis.aea";
        break;
      case 2uLL:
        v7 = @"sceneanalysis.aea";
        break;
      case 3uLL:
        v7 = @"faceanalysis.aea";
        break;
      case 0xAuLL:
        v7 = @"ocranalysis.aea";
        break;
      default:
        uint64_t v13 = MediaAnalysisLogLevel(v4, v5);
        if ((int)v13 >= 3)
        {
          uint64_t v15 = VCPLogInstance(v13, v14);
          v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
          os_log_type_t v17 = VCPLogToOSLogType[3];
          if (os_log_type_enabled(v16, v17))
          {
            uint64_t v18 = VCPTaskIDDescription(a3);
            v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
            int v22 = 138412290;
            v23 = v19;
            _os_log_impl((void *)&_mh_execute_header, v16, v17, "%@ unavailable for restore", (uint8_t *)&v22, 0xCu);
          }
        }

        goto LABEL_14;
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByAppendingPathComponent:v7]);
  }

  else
  {
    uint64_t v8 = MediaAnalysisLogLevel(0LL, v5);
    if ((int)v8 >= 4)
    {
      uint64_t v10 = VCPLogInstance(v8, v9);
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      os_log_type_t v12 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v11, v12))
      {
        LOWORD(v22) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  v12,  "Unexpected nil intermediate restore directory",  (uint8_t *)&v22,  2u);
      }
    }

- (id)mad_intermediateUnencryptedRestoreFilepathForTask:(unint64_t)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[PHPhotoLibrary vcp_mediaAnalysisIntermediateRestoreDirectory]( self,  "vcp_mediaAnalysisIntermediateRestoreDirectory"));
  v6 = v4;
  if (v4)
  {
    switch(a3)
    {
      case 1uLL:
        v7 = @"mediaanalysis_unencrypted.backup";
        break;
      case 2uLL:
        v7 = @"sceneanalysis_unencrypted.backup";
        break;
      case 3uLL:
        v7 = @"faceanalysis_unencrypted.backup";
        break;
      case 0xAuLL:
        v7 = @"ocranalysis_unencrypted.backup";
        break;
      default:
        uint64_t v13 = MediaAnalysisLogLevel(v4, v5);
        if ((int)v13 >= 3)
        {
          uint64_t v15 = VCPLogInstance(v13, v14);
          v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
          os_log_type_t v17 = VCPLogToOSLogType[3];
          if (os_log_type_enabled(v16, v17))
          {
            uint64_t v18 = VCPTaskIDDescription(a3);
            v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
            int v22 = 138412290;
            v23 = v19;
            _os_log_impl((void *)&_mh_execute_header, v16, v17, "%@ unavailable for restore", (uint8_t *)&v22, 0xCu);
          }
        }

        goto LABEL_14;
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByAppendingPathComponent:v7]);
  }

  else
  {
    uint64_t v8 = MediaAnalysisLogLevel(0LL, v5);
    if ((int)v8 >= 4)
    {
      uint64_t v10 = VCPLogInstance(v8, v9);
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      os_log_type_t v12 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v11, v12))
      {
        LOWORD(v22) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  v12,  "Unexpected nil intermediate restore directory",  (uint8_t *)&v22,  2u);
      }
    }

- (id)mad_restoreDirectory
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHPhotoLibrary vcp_mediaAnalysisDirectory](self, "vcp_mediaAnalysisDirectory"));
  v3 = v2;
  if (v2) {
    v4 = (void *)objc_claimAutoreleasedReturnValue([v2 stringByAppendingPathComponent:@".restore"]);
  }
  else {
    v4 = 0LL;
  }

  return v4;
}

- (id)mad_restoreStatusFilepath
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHPhotoLibrary mad_restoreDirectory](self, "mad_restoreDirectory"));
  v3 = v2;
  if (v2) {
    v4 = (void *)objc_claimAutoreleasedReturnValue([v2 stringByAppendingPathComponent:@"restore_status.plist"]);
  }
  else {
    v4 = 0LL;
  }

  return v4;
}

- (BOOL)mad_isBackupRestoreEligibleForTask:(unint64_t)a3
{
  if (a3 - 1 >= 2)
  {
    if (a3 == 3)
    {
      uint64_t v14 = _os_feature_enabled_impl("MediaAnalysis", "PreventFaceBackupRestore");
      if ((_DWORD)v14)
      {
        uint64_t v16 = MediaAnalysisLogLevel(v14, v15);
        uint64_t v18 = VCPLogInstance(v16, v17);
        uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
        os_log_type_t v19 = VCPLogToOSLogType[6];
        if (!os_log_type_enabled(v8, v19)) {
          goto LABEL_21;
        }
        LOWORD(v32[0]) = 0;
        uint64_t v10 = "Face analysis backup/restore is disabled, not eligible for backup/restore";
LABEL_19:
        v11 = v8;
        os_log_type_t v12 = v19;
        uint32_t v13 = 2;
        goto LABEL_20;
      }
    }

    else if (a3 != 10)
    {
      uint64_t v5 = MediaAnalysisLogLevel(self, a2);
      if ((int)v5 >= 4)
      {
        uint64_t v7 = VCPLogInstance(v5, v6);
        uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
        os_log_type_t v9 = VCPLogToOSLogType[4];
        if (os_log_type_enabled(v8, v9))
        {
          v32[0] = 67109120;
          v32[1] = a3;
          uint64_t v10 = "TaskID %d is not eligible for backup/restore";
          v11 = v8;
          os_log_type_t v12 = v9;
          uint32_t v13 = 8;
LABEL_20:
          _os_log_impl((void *)&_mh_execute_header, v11, v12, v10, (uint8_t *)v32, v13);
        }

- (int)_resetChangeTokenAndProcessingStatusForFaceProcessing
{
  BOOL v3 = +[VCPDatabaseManager existsDatabaseForPhotoLibrary:]( &OBJC_CLASS___VCPDatabaseManager,  "existsDatabaseForPhotoLibrary:",  self);
  BOOL v4 = v3;
  uint64_t v6 = MediaAnalysisLogLevel(v3, v5);
  if (v4)
  {
    if ((int)v6 >= 5)
    {
      uint64_t v8 = VCPLogInstance(v6, v7);
      os_log_type_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      os_log_type_t v10 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v9, v10))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHPhotoLibrary vcp_description](self, "vcp_description"));
        int v27 = 138412290;
        uint64_t v28 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  v10,  "[FaceModelBump][%@] Flushing ChangeToken and ProcessingStatus ... ",  (uint8_t *)&v27,  0xCu);
      }
    }

    os_log_type_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:]( &OBJC_CLASS___VCPDatabaseManager,  "sharedDatabaseForPhotoLibrary:",  self));
    id v13 = [v12 removeAllProcessingStatusForTaskID:3];
    int v15 = (int)v13;
    if ((_DWORD)v13 == -108
      || ((_DWORD)v13 != -36 ? (BOOL v16 = (_DWORD)v13 == -23) : (BOOL v16 = 1),
          v16
       || (id v13 = [v12 removeAllChangeTokensForTaskID:3],
           (int v15 = (int)v13, (_DWORD)v13 == -108)
        || (_DWORD)v13 == -36
        || (_DWORD)v13 == -23
        || (id v13 = [v12 commit], v15 = (int)v13, (_DWORD)v13 == -108)
        || (_DWORD)v13 == -23
        || (_DWORD)v13 == -36)))
    {
      uint64_t v17 = MediaAnalysisLogLevel(v13, v14);
      if ((int)v17 >= 3)
      {
        uint64_t v19 = VCPLogInstance(v17, v18);
        int v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
        os_log_type_t v21 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v20, v21))
        {
          uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[PHPhotoLibrary vcp_description](self, "vcp_description"));
          int v27 = 138412546;
          uint64_t v28 = v22;
          __int16 v29 = 1024;
          int v30 = v15;
          _os_log_impl( (void *)&_mh_execute_header,  v20,  v21,  "[FaceModelBump][%@] Failed to flush (%d)",  (uint8_t *)&v27,  0x12u);
        }
      }

      goto LABEL_20;
    }
  }

  else
  {
    uint64_t v23 = VCPLogInstance(v6, v7);
    os_log_type_t v12 = (void *)objc_claimAutoreleasedReturnValue(v23);
    os_log_type_t v24 = VCPLogToOSLogType[5];
    if (os_log_type_enabled((os_log_t)v12, v24))
    {
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[PHPhotoLibrary vcp_description](self, "vcp_description"));
      int v27 = 138412290;
      uint64_t v28 = v25;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v12,  v24,  "[FaceModelBump][%@] Media analysis database does not exist, skipping ChangeToken and ProcessingStatus reset",  (uint8_t *)&v27,  0xCu);
    }
  }

  int v15 = 0;
LABEL_20:

  return v15;
}

- (int)_resetCurrentFaceProgress
{
  BOOL v3 = +[VCPDatabaseManager existsDatabaseForPhotoLibrary:]( &OBJC_CLASS___VCPDatabaseManager,  "existsDatabaseForPhotoLibrary:",  self);
  BOOL v4 = v3;
  uint64_t v6 = MediaAnalysisLogLevel(v3, v5);
  if (v4)
  {
    if ((int)v6 >= 5)
    {
      uint64_t v8 = VCPLogInstance(v6, v7);
      os_log_type_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      os_log_type_t v10 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v9, v10))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHPhotoLibrary vcp_description](self, "vcp_description"));
        int v47 = 138412290;
        v48 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  v10,  "[FaceModelBump][%@] Reset cached face analysis progress ...",  (uint8_t *)&v47,  0xCu);
      }
    }

    os_log_type_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:]( &OBJC_CLASS___VCPDatabaseManager,  "sharedDatabaseForPhotoLibrary:",  self));
    unsigned int v13 = [v12 cacheCurrentFaceProgress];
    int v14 = v13;
    if (v13 == -108) {
      goto LABEL_12;
    }
    if (v13 == -36 || v13 == -23) {
      goto LABEL_12;
    }
    id v28 = [v12 cacheProcessedAssetCountAfterPromoter:0];
    int v14 = (int)v28;
    if ((_DWORD)v28 == -108 || (_DWORD)v28 == -36 || (_DWORD)v28 == -23) {
      goto LABEL_12;
    }
    uint64_t v30 = MediaAnalysisLogLevel(v28, v29);
    if ((int)v30 >= 5)
    {
      uint64_t v32 = VCPLogInstance(v30, v31);
      v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
      os_log_type_t v34 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v33, v34))
      {
        v35 = (void *)objc_claimAutoreleasedReturnValue(-[PHPhotoLibrary vcp_description](self, "vcp_description"));
        int v47 = 138412290;
        v48 = v35;
        _os_log_impl( (void *)&_mh_execute_header,  v33,  v34,  "[FaceModelBump][%@] Resetting person process change tokens ...",  (uint8_t *)&v47,  0xCu);
      }
    }

    id v36 = [v12 removeAllChangeTokensForTaskID:3];
    int v14 = (int)v36;
    if ((_DWORD)v36 == -108 || (_DWORD)v36 == -36 || (_DWORD)v36 == -23) {
      goto LABEL_12;
    }
    uint64_t v38 = MediaAnalysisLogLevel(v36, v37);
    if ((int)v38 >= 5)
    {
      uint64_t v40 = VCPLogInstance(v38, v39);
      v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
      os_log_type_t v42 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v41, v42))
      {
        v43 = (void *)objc_claimAutoreleasedReturnValue(-[PHPhotoLibrary vcp_description](self, "vcp_description"));
        int v47 = 138412290;
        v48 = v43;
        _os_log_impl( (void *)&_mh_execute_header,  v41,  v42,  "[FaceModelBump][%@] Resetting person process timestamps ...",  (uint8_t *)&v47,  0xCu);
      }
    }

    unsigned int v44 = [v12 removeKey:@"ContactIngestionTimestamp"];
    int v14 = v44;
    if (v44 == -108
      || v44 == -36
      || v44 == -23
      || (unsigned int v45 = [v12 removeKey:@"HomePersonIngestionTimestamp"],
          int v14 = v45,
          v45 == -108)
      || v45 == -36
      || v45 == -23
      || (v46 = [v12 removeKey:@"VUDeepSyncTimestamp"], int v14 = v46, v46 == -108)
      || v46 == -36
      || v46 == -23)
    {
LABEL_12:
      id v16 = [v12 commit];
      uint64_t v18 = MediaAnalysisLogLevel(v16, v17);
      if ((int)v18 >= 3)
      {
        uint64_t v20 = VCPLogInstance(v18, v19);
        os_log_type_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        os_log_type_t v22 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v21, v22))
        {
          uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[PHPhotoLibrary vcp_description](self, "vcp_description"));
          int v47 = 138412546;
          v48 = v23;
          __int16 v49 = 1024;
          int v50 = v14;
          _os_log_impl( (void *)&_mh_execute_header,  v21,  v22,  "[FaceModelBump][%@] Failed to reset (%d)",  (uint8_t *)&v47,  0x12u);
        }
      }

      goto LABEL_20;
    }

    [v12 commit];
  }

  else
  {
    uint64_t v24 = VCPLogInstance(v6, v7);
    os_log_type_t v12 = (void *)objc_claimAutoreleasedReturnValue(v24);
    os_log_type_t v25 = VCPLogToOSLogType[5];
    if (os_log_type_enabled((os_log_t)v12, v25))
    {
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[PHPhotoLibrary vcp_description](self, "vcp_description"));
      int v47 = 138412290;
      v48 = v26;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v12,  v25,  "[FaceModelBump][%@] Media analysis database does not exist, skipping ChangeToken and ProcessingStatus reset",  (uint8_t *)&v47,  0xCu);
    }
  }

  int v14 = 0;
LABEL_20:

  return v14;
}

- (int)vcp_bumpFaceProcessingToVersion:(int)a3 withError:(id *)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[VCPFaceProcessingVersionManager sharedManagerForPhotoLibrary:]( &OBJC_CLASS___VCPFaceProcessingVersionManager,  "sharedManagerForPhotoLibrary:",  self,  a4));
  id v7 = [v6 currentProcessingVersion];
  int v8 = (int)v7;
  uint64_t v10 = MediaAnalysisLogLevel(v7, v9);
  if ((int)v10 >= 5)
  {
    uint64_t v12 = VCPLogInstance(v10, v11);
    unsigned int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    os_log_type_t v14 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v13, v14))
    {
      int v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHPhotoLibrary vcp_description](self, "vcp_description"));
      int v26 = 138412802;
      int v27 = v15;
      __int16 v28 = 1024;
      int v29 = v8;
      __int16 v30 = 1024;
      int v31 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  v14,  "[FaceModelBump][%@] Migrating version from: %d to %d",  (uint8_t *)&v26,  0x18u);
    }
  }

  int v16 = -[PHPhotoLibrary _resetChangeTokenAndProcessingStatusForFaceProcessing]( self,  "_resetChangeTokenAndProcessingStatusForFaceProcessing");
  if (!v16)
  {
    int v16 = [v6 migrateFaceProcessingToVersion:v4];
    if (!v16)
    {
      uint64_t v17 = -[PHPhotoLibrary _resetCurrentFaceProgress](self, "_resetCurrentFaceProgress");
      int v16 = v17;
      if (!(_DWORD)v17)
      {
        uint64_t v19 = MediaAnalysisLogLevel(v17, v18);
        if ((int)v19 >= 5)
        {
          uint64_t v21 = VCPLogInstance(v19, v20);
          os_log_type_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
          os_log_type_t v23 = VCPLogToOSLogType[5];
          if (os_log_type_enabled(v22, v23))
          {
            uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[PHPhotoLibrary vcp_description](self, "vcp_description"));
            int v26 = 138412290;
            int v27 = v24;
            _os_log_impl( (void *)&_mh_execute_header,  v22,  v23,  "[FaceModelBump][%@] Migration finished",  (uint8_t *)&v26,  0xCu);
          }
        }

        int v16 = 0;
      }
    }
  }

  return v16;
}

- (int)_bumpFaceProcessingVersionIfNeededWithError:(id *)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[VCPFaceProcessingVersionManager sharedManagerForPhotoLibrary:]( &OBJC_CLASS___VCPFaceProcessingVersionManager,  "sharedManagerForPhotoLibrary:",  self));
  unsigned int v6 = [v5 currentProcessingVersion];
  id v7 = [v5 defaultProcessingVersion];
  if ((_DWORD)v7 == v6)
  {
    uint64_t v9 = MediaAnalysisLogLevel(v7, v8);
    if ((int)v9 >= 5)
    {
      uint64_t v11 = VCPLogInstance(v9, v10);
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      os_log_type_t v13 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v12, v13))
      {
        os_log_type_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHPhotoLibrary vcp_description](self, "vcp_description"));
        int v17 = 138412802;
        uint64_t v18 = v14;
        __int16 v19 = 1024;
        unsigned int v20 = v6;
        __int16 v21 = 1024;
        unsigned int v22 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  v13,  "[FaceModelBump][%@] Version %d meets requirement %d",  (uint8_t *)&v17,  0x18u);
      }
    }

    int v15 = 0;
  }

  else
  {
    int v15 = -[PHPhotoLibrary vcp_bumpFaceProcessingToVersion:withError:]( self,  "vcp_bumpFaceProcessingToVersion:withError:",  v7,  a3);
  }

  return v15;
}

- (int)_resetEmbeddingClusteringProgress
{
  BOOL v3 = +[VCPDatabaseManager existsDatabaseForPhotoLibrary:]( &OBJC_CLASS___VCPDatabaseManager,  "existsDatabaseForPhotoLibrary:",  self);
  if (v3)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:]( &OBJC_CLASS___VCPDatabaseManager,  "sharedDatabaseForPhotoLibrary:",  self));
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue( +[MADVUWGalleryManager sharedGalleryForPhotoLibrary:]( &OBJC_CLASS___MADVUWGalleryManager,  "sharedGalleryForPhotoLibrary:",  self));
    uint64_t v8 = MediaAnalysisLogLevel(v6, v7);
    if ((int)v8 >= 5)
    {
      uint64_t v10 = VCPLogInstance(v8, v9);
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      os_log_type_t v12 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v11, v12))
      {
        os_log_type_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHPhotoLibrary vcp_description](self, "vcp_description"));
        *(_DWORD *)buf = 138412290;
        v59 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  v12,  "[VSKDBMigration][%@] Reset embedding clustering progress ... ",  buf,  0xCu);
      }
    }

    id v14 = [v5 removeKey:VCPKeyValueMediaAnalysisImagePriority1LastFullModeClusterTimestamp];
    int v16 = (int)v14;
    int v17 = 0LL;
    if ((_DWORD)v14 == -108) {
      goto LABEL_35;
    }
    if ((_DWORD)v14 == -36 || (_DWORD)v14 == -23) {
      goto LABEL_35;
    }
    if (v6)
    {
      uint64_t v19 = VCPSignPostLog(v14);
      unsigned int v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      os_signpost_id_t v21 = os_signpost_id_generate(v20);

      uint64_t v23 = VCPSignPostLog(v22);
      uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      os_log_type_t v25 = v24;
      if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v25,  OS_SIGNPOST_INTERVAL_BEGIN,  v21,  "VUWGallery_resetForType_Scene",  (const char *)&unk_100199097,  buf,  2u);
      }

      id v57 = 0LL;
      unsigned __int8 v26 = [v6 resetForType:0 error:&v57];
      id v27 = v57;
      int v17 = v27;
      if ((v26 & 1) != 0)
      {
        uint64_t v29 = VCPSignPostLog(v27);
        __int16 v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
        int v31 = v30;
        if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v31,  OS_SIGNPOST_INTERVAL_END,  v21,  "VUWGallery_resetForType_Scene",  (const char *)&unk_100199097,  buf,  2u);
        }

        [v5 commit];
        int v16 = 0;
LABEL_39:

LABEL_40:
        return v16;
      }

      uint64_t v43 = MediaAnalysisLogLevel(v27, v28);
      uint64_t v45 = VCPLogInstance(v43, v44);
      uint64_t v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
      os_log_type_t v46 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v40, v46))
      {
        int v47 = (void *)objc_claimAutoreleasedReturnValue(-[PHPhotoLibrary vcp_description](self, "vcp_description"));
        *(_DWORD *)buf = 138412802;
        v59 = v47;
        __int16 v60 = 1024;
        int v61 = 0;
        __int16 v62 = 2112;
        v63 = v17;
        _os_log_impl( (void *)&_mh_execute_header,  v40,  v46,  "[VSKDBMigration][%@] Failed to reset VUWGallery for type %d: %@",  buf,  0x1Cu);
      }
    }

    else
    {
      uint64_t v37 = MediaAnalysisLogLevel(v14, v15);
      if ((int)v37 < 3)
      {
        int v17 = 0LL;
        goto LABEL_34;
      }

      uint64_t v39 = VCPLogInstance(v37, v38);
      uint64_t v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
      os_log_type_t v41 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v40, v41))
      {
        os_log_type_t v42 = (void *)objc_claimAutoreleasedReturnValue(-[PHPhotoLibrary vcp_description](self, "vcp_description"));
        *(_DWORD *)buf = 138412290;
        v59 = v42;
        _os_log_impl( (void *)&_mh_execute_header,  v40,  v41,  "[VSKDBMigration][%@] Failed to obtain VUWGallery",  buf,  0xCu);
      }

      int v17 = 0LL;
    }

LABEL_34:
    int v16 = -18;
LABEL_35:
    id v48 = [v5 commit];
    uint64_t v50 = MediaAnalysisLogLevel(v48, v49);
    if ((int)v50 >= 3)
    {
      uint64_t v52 = VCPLogInstance(v50, v51);
      v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
      os_log_type_t v54 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v53, v54))
      {
        v55 = (void *)objc_claimAutoreleasedReturnValue(-[PHPhotoLibrary vcp_description](self, "vcp_description"));
        *(_DWORD *)buf = 138412546;
        v59 = v55;
        __int16 v60 = 1024;
        int v61 = v16;
        _os_log_impl((void *)&_mh_execute_header, v53, v54, "[VSKDBMigration][%@] Failed to reset (%d)", buf, 0x12u);
      }
    }

    goto LABEL_39;
  }

  uint64_t v32 = MediaAnalysisLogLevel(v3, v4);
  if ((int)v32 >= 5)
  {
    uint64_t v34 = VCPLogInstance(v32, v33);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v34);
    os_log_type_t v35 = VCPLogToOSLogType[5];
    if (os_log_type_enabled((os_log_t)v5, v35))
    {
      id v36 = (void *)objc_claimAutoreleasedReturnValue(-[PHPhotoLibrary vcp_description](self, "vcp_description"));
      *(_DWORD *)buf = 138412290;
      v59 = v36;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v5,  v35,  "[VSKDBMigration][%@] Media analysis database does not exist, skipping embedding clustering progress reset",  buf,  0xCu);
    }

    int v16 = 0;
    goto LABEL_40;
  }

  return 0;
}

- (int)_signalPhotosAvailabilityStateChangeWithError:(id *)a3
{
  uint64_t v5 = VCPSignPostLog(self);
  unsigned int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  os_signpost_id_t v7 = os_signpost_id_generate(v6);

  uint64_t v9 = VCPSignPostLog(v8);
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  uint64_t v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v11,  OS_SIGNPOST_INTERVAL_BEGIN,  v7,  "PhotoLibraryClient_SignalAvailabilityStateChange",  (const char *)&unk_100199097,  buf,  2u);
  }

  os_log_type_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHPhotoLibrary photoLibrary](self, "photoLibrary"));
  os_log_type_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 assetsdClient]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 libraryInternalClient]);
  id v36 = 0LL;
  unsigned __int8 v15 = [v14 signalAvailabilityStateDidChangeWithError:&v36];
  id v16 = v36;

  if ((v15 & 1) != 0)
  {
    uint64_t v19 = VCPSignPostLog(v17);
    unsigned int v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    os_signpost_id_t v21 = v20;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v21,  OS_SIGNPOST_INTERVAL_END,  v7,  "PhotoLibraryClient_SignalAvailabilityStateChange",  (const char *)&unk_100199097,  buf,  2u);
    }

    uint64_t v24 = MediaAnalysisLogLevel(v22, v23);
    if ((int)v24 >= 5)
    {
      uint64_t v26 = VCPLogInstance(v24, v25);
      id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      os_log_type_t v28 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v27, v28))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v27,  v28,  "[VSKDBMigration] Signalled Photos availability state change",  buf,  2u);
      }
    }

    int v29 = 0;
  }

  else
  {
    uint64_t v30 = MediaAnalysisLogLevel(v17, v18);
    if ((int)v30 >= 3)
    {
      uint64_t v32 = VCPLogInstance(v30, v31);
      uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
      os_log_type_t v34 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v33, v34))
      {
        *(_DWORD *)buf = 138412290;
        id v38 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v33,  v34,  "[VSKDBMigration] Failed to signal Photos availability state change: %@",  buf,  0xCu);
      }
    }

    *a3 = [v16 copy];
    int v29 = -18;
  }

  return v29;
}

- (int)_migrateVectorDatabaseIfNeededWithError:(id *)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[MADVectorDatabaseManager sharedDatabaseWithPhotoLibrary:]( &OBJC_CLASS___MADVectorDatabaseManager,  "sharedDatabaseWithPhotoLibrary:",  self));
  if ([v5 hasMigration])
  {
    int v6 = -[PHPhotoLibrary _resetEmbeddingClusteringProgress](self, "_resetEmbeddingClusteringProgress");
    if (!v6) {
      int v6 = -[PHPhotoLibrary _signalPhotosAvailabilityStateChangeWithError:]( self,  "_signalPhotosAvailabilityStateChangeWithError:",  a3);
    }
  }

  else
  {
    int v6 = 0;
  }

  MediaAnalysisDaemonReleaseSharedDataStores(self);

  return v6;
}

- (BOOL)vcp_openAndWaitWithUpgrade:(BOOL)a3 error:(id *)a4
{
  unsigned int v6 = -[PHPhotoLibrary openAndWaitWithUpgrade:error:](self, "openAndWaitWithUpgrade:error:", a3);
  if (v6)
  {
    if (-[PHPhotoLibrary _bumpFaceProcessingVersionIfNeededWithError:]( self,  "_bumpFaceProcessingVersionIfNeededWithError:",  a4))
    {
      LOBYTE(v6) = 0;
    }

    else
    {
      LOBYTE(v6) = -[PHPhotoLibrary _migrateVectorDatabaseIfNeededWithError:]( self,  "_migrateVectorDatabaseIfNeededWithError:",  a4) == 0;
    }
  }

  return v6;
}

@end