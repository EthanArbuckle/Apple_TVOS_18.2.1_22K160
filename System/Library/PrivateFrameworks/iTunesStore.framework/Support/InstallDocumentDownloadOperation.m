@interface InstallDocumentDownloadOperation
- (BOOL)_moveSharedAssetFromPath:(id)a3 toPath:(id)a4 error:(id *)a5;
- (id)_sharedAssetStagingPath:(id)a3;
- (id)_sharedContainerPath;
- (id)_sharedContainerPath:(id)a3;
- (void)run;
@end

@implementation InstallDocumentDownloadOperation

- (void)run
{
  v3 = objc_alloc_init(&OBJC_CLASS___FinishDownloadResponse);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FinishDownloadStepOperation download](self, "download"));
  -[FinishDownloadResponse setDownloadIdentifier:](v3, "setDownloadIdentifier:", [v4 databaseID]);
  v135 = -[DownloadHandle initWithTransactionIdentifier:downloadIdentifier:]( [DownloadHandle alloc],  "initWithTransactionIdentifier:downloadIdentifier:",  [v4 transactionID],  objc_msgSend(v4, "databaseID"));
  -[FinishDownloadResponse setDownloadHandle:](v3, "setDownloadHandle:");
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 mediaAsset]);
  -[FinishDownloadResponse setMediaAssetIdentifier:](v3, "setMediaAssetIdentifier:", [v5 databaseID]);
  uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 destinationURLString]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 destinationFileName]);
  uint64_t v8 = objc_claimAutoreleasedReturnValue([v4 downloadKind]);
  v9 = (void *)v8;
  if (!v6 || SSDownloadKindIsThirdPartyKind(v8))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v4 title]);
    if ([v10 length])
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue([v7 pathExtension]);
      uint64_t v12 = objc_claimAutoreleasedReturnValue([v10 stringByAppendingPathExtension:v11]);

      v7 = (void *)v12;
    }
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[ApplicationWorkspace defaultWorkspace](&OBJC_CLASS___ApplicationWorkspace, "defaultWorkspace"));
  unsigned int v14 = [v13 isMultiUser];

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForProperty:@"client_id"]);
    if ([v4 isSharedDownload]
      && ([v15 isEqualToString:@"com.apple.ondemandd"] & 1) != 0)
    {
      v16 = &OBJC_IVAR___InstallDocumentDownloadOperation__isSharedODRDownload;
    }

    else
    {
      if (![v4 isSharedDownload]
        || ([v15 isEqualToString:@"mdmd"] & 1) == 0
        && ![v15 isEqualToString:@"dmd"])
      {
        goto LABEL_15;
      }

      v16 = &OBJC_IVAR___InstallDocumentDownloadOperation__isSharedMDMDownload;
    }

    self->super.ISOperation_opaque[*v16] = 1;
LABEL_15:
  }

  v138 = v9;
  unsigned int v17 = [v9 isEqualToString:SSDownloadKindOSUpdate];
  v18 = &OBJC_IVAR___CacheDeleteCoordinator__lastUpdate;
  v139 = v5;
  v134 = (void *)v6;
  v137 = v7;
  if (v17)
  {
    v19 = objc_alloc(&OBJC_CLASS___NSArray);
    v20 = -[NSArray initWithObjects:]( v19,  "initWithObjects:",  CPSharedResourcesDirectory(v19),  @"Library",  @"Updates",  0LL);
    uint64_t v21 = objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](&OBJC_CLASS___NSString, "pathWithComponents:", v20));
    goto LABEL_23;
  }

  if (v6 && (SSDownloadKindIsThirdPartyKind(v138) & 1) == 0)
  {
    v91 = -[NSURL initWithString:](objc_alloc(&OBJC_CLASS___NSURL), "initWithString:", v6);
    v92 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL path](v91, "path"));
    uint64_t v145 = objc_claimAutoreleasedReturnValue([v92 stringByDeletingLastPathComponent]);
    v93 = (void *)objc_claimAutoreleasedReturnValue(-[InstallDocumentDownloadOperation _sharedContainerPath](self, "_sharedContainerPath"));
    v94 = v93;
    if (self->_isSharedODRDownload || self->_isSharedMDMDownload)
    {
      id v95 = [v93 length];
      v96 = v91;
      v97 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL path](v91, "path"));
      id v98 = [v97 length];

      if (v95 >= v98) {
        v136 = 0LL;
      }
      else {
        v136 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "substringFromIndex:", objc_msgSend(v94, "length")));
      }
      v5 = v139;
      v91 = v96;
      v18 = &OBJC_IVAR___CacheDeleteCoordinator__lastUpdate;
    }

    else
    {
      v136 = 0LL;
    }

    if (!self->_isSharedODRDownload && !self->_isSharedMDMDownload) {
      goto LABEL_184;
    }
    v141 = v94;
    v143 = v91;
    v129 = v3;
    v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "substringToIndex:", objc_msgSend(v94, "length")));
    v104 = (void *)objc_claimAutoreleasedReturnValue(-[InstallDocumentDownloadOperation _sharedContainerPath](self, "_sharedContainerPath"));
    unsigned __int8 v105 = [v103 isEqualToString:v104];

    uint64_t v106 = objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    v107 = (void *)v106;
    if ((v105 & 1) == 0)
    {
      if (!v106) {
        v107 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
      }
      unsigned int v112 = [v107 shouldLog];
      v113 = (os_log_s *)objc_claimAutoreleasedReturnValue([v107 OSLogObject]);
      if (os_log_type_enabled(v113, OS_LOG_TYPE_INFO)) {
        uint64_t v114 = v112;
      }
      else {
        uint64_t v114 = v112 & 2;
      }
      if ((_DWORD)v114)
      {
        id v115 = (id)objc_opt_class(self);
        id v116 = (id)objc_claimAutoreleasedReturnValue(-[InstallDocumentDownloadOperation _sharedContainerPath](self, "_sharedContainerPath"));
        int v157 = 138412802;
        id v158 = v115;
        __int16 v159 = 2112;
        id v160 = v103;
        __int16 v161 = 2112;
        id v162 = v116;
        v117 = (void *)_os_log_send_and_compose_impl( v114,  0LL,  0LL,  0LL,  &_mh_execute_header,  v113,  1LL,  "%@: Warning: Reverting to default behavior due to the shared documentsPath: %@ not matching the shared container path: %@",  &v157,  32);

        v7 = v137;
        if (v117)
        {
          v118 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v117,  4LL));
          free(v117);
          v121 = v118;
          SSFileLog(v107, @"%@");
        }
      }

      else
      {
      }

      self->_isSharedODRDownload = 0;
      self->_isSharedMDMDownload = 0;
      v5 = v139;
      goto LABEL_183;
    }

    if (!v106) {
      v107 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    LODWORD(v108) = [v107 shouldLog];
    v109 = (os_log_s *)objc_claimAutoreleasedReturnValue([v107 OSLogObject]);
    if (os_log_type_enabled(v109, OS_LOG_TYPE_INFO)) {
      uint64_t v108 = v108;
    }
    else {
      v108 &= 2u;
    }
    if ((_DWORD)v108)
    {
      id v110 = (id)objc_opt_class(self);
      int v157 = 138412802;
      id v158 = v110;
      __int16 v159 = 2112;
      id v160 = v103;
      __int16 v161 = 2112;
      id v162 = v136;
      v111 = (void *)_os_log_send_and_compose_impl( v108,  0LL,  0LL,  0LL,  &_mh_execute_header,  v109,  1LL,  "%@: Using document path: %@ with container relative path: %@",  &v157,  32);

      v7 = v137;
      if (!v111)
      {
LABEL_164:

LABEL_183:
        v91 = v143;

        v3 = v129;
        v94 = v141;
LABEL_184:

        v22 = (void *)v145;
        goto LABEL_25;
      }

      v109 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v111,  4LL));
      free(v111);
      v121 = v109;
      SSFileLog(v107, @"%@");
    }

    goto LABEL_164;
  }

  v20 = (NSArray *)objc_claimAutoreleasedReturnValue([v4 documentTargetIdentifier]);
  if (!v20)
  {
    v20 = (NSArray *)objc_claimAutoreleasedReturnValue([v4 clientIdentifier]);
    if (!v20)
    {
      v22 = 0LL;
      goto LABEL_24;
    }
  }

  uint64_t v21 = objc_claimAutoreleasedReturnValue( -[FinishDownloadStepOperation documentsDirectoryPathWithClientIdentifier:downloadKind:]( self,  "documentsDirectoryPathWithClientIdentifier:downloadKind:",  v20,  v138));
LABEL_23:
  v22 = (void *)v21;

LABEL_24:
  v136 = 0LL;
LABEL_25:
  v144 = v22;
  v146 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "stringByAppendingPathComponent:", v7, v121));
  uint64_t v23 = v18[763];
  if (self->super.ISOperation_opaque[v23] || self->_isSharedMDMDownload) {
    uint64_t v24 = objc_claimAutoreleasedReturnValue(-[InstallDocumentDownloadOperation _sharedAssetStagingPath:](self, "_sharedAssetStagingPath:", v7));
  }
  else {
    uint64_t v24 = 0LL;
  }
  v142 = (void *)v24;
  v25 = objc_alloc_init(&OBJC_CLASS___NSFileManager);
  v26 = (void *)objc_claimAutoreleasedReturnValue([v5 localPath]);
  uint64_t v27 = objc_claimAutoreleasedReturnValue([v5 sourceURLString]);
  v140 = v25;
  v133 = (void *)v27;
  if (!-[NSFileManager fileExistsAtPath:](v25, "fileExistsAtPath:", v26) && v27)
  {
    v28 = -[NSURL initWithString:](objc_alloc(&OBJC_CLASS___NSURL), "initWithString:", v27);
    if (!-[NSURL isFileURL](v28, "isFileURL"))
    {
LABEL_44:

      goto LABEL_45;
    }

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL path](v28, "path"));
    id v156 = v26;
    -[FinishDownloadStepOperation moveFile:toPath:installBehavior:error:]( self,  "moveFile:toPath:installBehavior:error:",  v29,  &v156,  0LL,  0LL);
    id v131 = v156;

    v30 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v30) {
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v31 = [v30 shouldLog];
    else {
      unsigned int v32 = v31;
    }
    v33 = (os_log_s *)objc_claimAutoreleasedReturnValue([v30 OSLogObject]);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO)) {
      uint64_t v34 = v32;
    }
    else {
      uint64_t v34 = v32 & 2;
    }
    if ((_DWORD)v34)
    {
      v35 = v3;
      id v36 = (id)objc_opt_class(self);
      id v37 = (id)objc_claimAutoreleasedReturnValue(-[NSURL path](v28, "path"));
      int v157 = 138412802;
      id v158 = v36;
      __int16 v159 = 2112;
      id v160 = v37;
      __int16 v161 = 2112;
      id v162 = v131;
      LODWORD(v125) = 32;
      v38 = (void *)_os_log_send_and_compose_impl( v34,  0LL,  0LL,  0LL,  &_mh_execute_header,  v33,  1LL,  "%@: Moved file URL: %@ to downloads directory: %@",  &v157,  v125);

      v3 = v35;
      if (!v38)
      {
LABEL_43:

        v26 = v131;
        v5 = v139;
        goto LABEL_44;
      }

      v33 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v38,  4LL));
      free(v38);
      v122 = v33;
      SSFileLog(v30, @"%@");
    }

    goto LABEL_43;
  }

- (BOOL)_moveSharedAssetFromPath:(id)a3 toPath:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (self->_isSharedMDMDownload)
  {
    v10 = @"systemgroup.com.apple.media.books.managed";
    v11 = @"mdmd";
    goto LABEL_18;
  }

  if (self->_isSharedODRDownload)
  {
    v10 = @"systemgroup.com.apple.ondemandresources";
    v11 = @"com.apple.ondemandd";
    goto LABEL_18;
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v12) {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v13 = [v12 shouldLog];
  else {
    LODWORD(v14) = v13;
  }
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 OSLogObject]);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO)) {
    uint64_t v14 = v14;
  }
  else {
    v14 &= 2u;
  }
  if (!(_DWORD)v14) {
    goto LABEL_16;
  }
  int v43 = 138412290;
  id v44 = (id)objc_opt_class(self);
  id v16 = v44;
  unsigned int v17 = (void *)_os_log_send_and_compose_impl( v14,  0LL,  0LL,  0LL,  &_mh_execute_header,  v15,  1LL,  "%@: Failed to stage for asset could not determine client.",  &v43,  12);

  if (v17)
  {
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v17,  4LL));
    free(v17);
    id v40 = v15;
    SSFileLog(v12, @"%@");
LABEL_16:
  }

  v11 = 0LL;
  v10 = 0LL;
LABEL_18:
  uint64_t v42 = 1LL;
  id v18 = -[__CFString UTF8String](v10, "UTF8String", v40);
  id v19 = v8;
  id v20 = [v19 UTF8String];
  id v21 = v9;
  v22 = (__CFString *)container_stage_shared_system_content(v18, v20, [v21 UTF8String], &v42);
  uint64_t v23 = objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  uint64_t v24 = (void *)v23;
  if (!v22)
  {
    if (!v23) {
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v33 = [v24 shouldLog];
    else {
      LODWORD(v34) = v33;
    }
    v35 = (os_log_s *)objc_claimAutoreleasedReturnValue([v24 OSLogObject]);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO)) {
      uint64_t v34 = v34;
    }
    else {
      v34 &= 2u;
    }
    if ((_DWORD)v34)
    {
      id v36 = (void *)objc_opt_class(self);
      int v43 = 138412802;
      id v44 = v36;
      __int16 v45 = 2112;
      id v46 = v11;
      __int16 v47 = 2048;
      uint64_t v48 = v42;
      id v37 = v36;
      LODWORD(v41) = 32;
      v38 = (void *)_os_log_send_and_compose_impl( v34,  0LL,  0LL,  0LL,  &_mh_execute_header,  v35,  1LL,  "%@: Failed to stage for client: %@ path: %llu",  &v43,  v41);

      if (!v38) {
        goto LABEL_46;
      }
      v35 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v38,  4LL));
      free(v38);
      SSFileLog(v24, @"%@");
    }

LABEL_46:
    uint64_t v39 = SSError(SSErrorDomain, 146LL, 0LL, 0LL);
    unsigned int v31 = (void *)objc_claimAutoreleasedReturnValue(v39);
    if (!a5) {
      goto LABEL_33;
    }
    goto LABEL_32;
  }

  if (!v23) {
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v25 = [v24 shouldLog];
  else {
    LODWORD(v26) = v25;
  }
  uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue([v24 OSLogObject]);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO)) {
    uint64_t v26 = v26;
  }
  else {
    v26 &= 2u;
  }
  if ((_DWORD)v26)
  {
    v28 = (void *)objc_opt_class(self);
    int v43 = 138412802;
    id v44 = v28;
    __int16 v45 = 2080;
    id v46 = v22;
    __int16 v47 = 2112;
    uint64_t v48 = (uint64_t)v11;
    id v29 = v28;
    LODWORD(v41) = 32;
    v30 = (void *)_os_log_send_and_compose_impl( v26,  0LL,  0LL,  0LL,  &_mh_execute_header,  v27,  1LL,  "%@: Successfully staged path: %s for client: %@",  &v43,  v41);

    if (!v30) {
      goto LABEL_31;
    }
    uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v30,  4LL));
    free(v30);
    SSFileLog(v24, @"%@");
  }

LABEL_31:
  free(v22);
  unsigned int v31 = 0LL;
  if (a5) {
LABEL_32:
  }
    *a5 = v31;
LABEL_33:

  return v22 != 0LL;
}

- (id)_sharedAssetStagingPath:(id)a3
{
  id v4 = a3;
  if (![v4 length])
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v6) {
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v16 = [v6 shouldLog];
    else {
      LODWORD(v17) = v16;
    }
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 OSLogObject]);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO)) {
      uint64_t v17 = v17;
    }
    else {
      v17 &= 2u;
    }
    if ((_DWORD)v17)
    {
      int v22 = 138412546;
      id v23 = (id)objc_opt_class(self);
      __int16 v24 = 2112;
      id v25 = v4;
      id v19 = v23;
      id v20 = (void *)_os_log_send_and_compose_impl( v17,  0LL,  0LL,  0LL,  &_mh_execute_header,  v18,  1LL,  "[%@] Error: Unable to get staging path for relative path: %@",  &v22,  22);

      if (!v20)
      {
LABEL_27:
        id v9 = 0LL;
        goto LABEL_28;
      }

      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v20,  4LL));
      free(v20);
      SSFileLog(v6, @"%@");
    }

    goto LABEL_27;
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[InstallDocumentDownloadOperation _sharedContainerPath](self, "_sharedContainerPath"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 pathComponents]);

  v26[0] = @"Caches";
  v26[1] = @"Staging";
  v26[2] = v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v26, 3LL));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 arrayByAddingObjectsFromArray:v7]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](&OBJC_CLASS___NSString, "pathWithComponents:", v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v10) {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v11 = [v10 shouldLog];
  else {
    LODWORD(v12) = v11;
  }
  unsigned int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 OSLogObject]);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO)) {
    uint64_t v12 = v12;
  }
  else {
    v12 &= 2u;
  }
  if (!(_DWORD)v12) {
    goto LABEL_13;
  }
  int v22 = 138412546;
  id v23 = (id)objc_opt_class(self);
  __int16 v24 = 2112;
  id v25 = v9;
  id v14 = v23;
  v15 = (void *)_os_log_send_and_compose_impl( v12,  0LL,  0LL,  0LL,  &_mh_execute_header,  v13,  1LL,  "[%@] Staging path set to: %@",  &v22,  22);

  if (v15)
  {
    unsigned int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v15,  4LL));
    free(v15);
    SSFileLog(v10, @"%@");
LABEL_13:
  }

LABEL_28:
  return v9;
}

- (id)_sharedContainerPath
{
  if (self->_isSharedMDMDownload)
  {
    v2 = @"systemgroup.com.apple.media.books.managed";
  }

  else
  {
    if (!self->_isSharedODRDownload) {
      return 0LL;
    }
    v2 = @"systemgroup.com.apple.ondemandresources";
  }

  return (id)objc_claimAutoreleasedReturnValue( -[InstallDocumentDownloadOperation _sharedContainerPath:]( self,  "_sharedContainerPath:",  v2));
}

- (id)_sharedContainerPath:(id)a3
{
  return 0LL;
}

@end