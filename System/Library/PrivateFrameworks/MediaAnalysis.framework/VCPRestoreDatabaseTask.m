@interface VCPRestoreDatabaseTask
+ (id)taskWithPhotoLibrary:(id)a3;
- (int)mainInternal;
- (int)restoreDatabaseToFilepath:(id)a3 fromBackupFilepath:(id)a4;
@end

@implementation VCPRestoreDatabaseTask

+ (id)taskWithPhotoLibrary:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)objc_opt_class(a1)) initWithPhotoLibrary:v4];

  return v5;
}

- (int)restoreDatabaseToFilepath:(id)a3 fromBackupFilepath:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_autoreleasePoolPush();
  v138 = v5;
  v139 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSInputStream inputStreamWithFileAtPath:]( &OBJC_CLASS___NSInputStream,  "inputStreamWithFileAtPath:",  v6));
  [v8 open];
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[VCPBackupFileHeader headerForTask:](&OBJC_CLASS___VCPBackupFileHeader, "headerForTask:", 1LL));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[VCPBackupFileHeader headerFromStream:](&OBJC_CLASS___VCPBackupFileHeader, "headerFromStream:", v8));
  v12 = v10;
  v137 = v7;
  if (v10)
  {
    unsigned int v13 = [v10 identifier];
    id v14 = [v9 identifier];
    if (v13 == (_DWORD)v14)
    {
      unsigned int v16 = [v12 version];
      id v17 = [v9 version];
      if (v16 == (_DWORD)v17)
      {
        v133 = (void *)objc_claimAutoreleasedReturnValue( +[VCPDatabaseWriter databaseWithFilepath:]( &OBJC_CLASS___VCPDatabaseWriter,  "databaseWithFilepath:",  v5));
        v132 = (void *)objc_claimAutoreleasedReturnValue(+[VCPDataDecompressor decompressor](&OBJC_CLASS___VCPDataDecompressor, "decompressor"));
        v127 = 0LL;
        uint64_t v136 = 0LL;
        uint64_t v19 = 0LL;
        os_log_type_t type = VCPLogToOSLogType[3];
        os_log_type_t v128 = VCPLogToOSLogType[5];
        while (1)
        {
          if (![v8 hasBytesAvailable])
          {
LABEL_126:
            [v8 close];
            id v114 = [v133 flushWAL];
            if ((_DWORD)v114)
            {
              id v114 = (id)MediaAnalysisLogLevel(v114, v115);
              if ((int)v114 >= 3)
              {
                uint64_t v116 = VCPLogInstance(v114, v115);
                v117 = (os_log_s *)objc_claimAutoreleasedReturnValue(v116);
                if (os_log_type_enabled(v117, type))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl( (void *)&_mh_execute_header,  v117,  type,  "  Failed to flush database WAL; restore may be incomplete",
                    buf,
                    2u);
                }
              }
            }

            uint64_t v118 = MediaAnalysisLogLevel(v114, v115);
            if ((int)v118 >= 5)
            {
              uint64_t v120 = VCPLogInstance(v118, v119);
              v121 = (os_log_s *)objc_claimAutoreleasedReturnValue(v120);
              if (os_log_type_enabled(v121, v128))
              {
                *(_DWORD *)buf = 134218240;
                v142 = v127;
                __int16 v143 = 2048;
                *(void *)v144 = v136;
                _os_log_impl( (void *)&_mh_execute_header,  v121,  v128,  "  Restored %zu/%zu full analysis records",  buf,  0x16u);
              }
            }

- (int)mainInternal
{
  uint64_t v3 = MediaAnalysisLogLevel(self, a2);
  if ((int)v3 >= 5)
  {
    uint64_t v5 = VCPLogInstance(v3, v4);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    os_log_type_t v7 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v6, v7))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "Checking full analysis restore...", buf, 2u);
    }
  }

  uint64_t v8 = VCPTaskIDDescription(1LL);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[VCPTask photoLibrary](self, "photoLibrary"));
  unsigned __int8 v11 = objc_msgSend(v10, "mad_isBackupRestoreEligibleForTask:", 1);

  if ((v11 & 1) != 0)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[VCPTask photoLibrary](self, "photoLibrary"));
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "vcp_mediaAnalysisIntermediateRestoreDirectory"));

    if (!v15)
    {
      uint64_t v41 = MediaAnalysisLogLevel(v16, v17);
      if ((int)v41 < 3)
      {
LABEL_62:

        goto LABEL_63;
      }

      uint64_t v43 = VCPLogInstance(v41, v42);
      uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
      os_log_type_t v44 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v18, v44))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  v44,  "  Unknown intermediate restore directory; skipping restore",
          buf,
          2u);
      }

@end