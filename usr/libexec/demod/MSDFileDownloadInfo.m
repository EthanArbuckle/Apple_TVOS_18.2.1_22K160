@interface MSDFileDownloadInfo
- (BOOL)entitlementCheckForFile:(id)a3;
- (BOOL)hashCheckForFile:(id)a3;
- (BOOL)skipHashCheck;
- (MSDDemoManifestCheck)checker;
- (MSDFileDownloadInfo)init;
- (NSString)file;
- (NSString)fileHash;
- (void)setChecker:(id)a3;
- (void)setFile:(id)a3;
- (void)setFileHash:(id)a3;
- (void)setSkipHashCheck:(BOOL)a3;
@end

@implementation MSDFileDownloadInfo

- (MSDFileDownloadInfo)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MSDFileDownloadInfo;
  v2 = -[MSDFileDownloadInfo init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    -[MSDFileDownloadInfo setFile:](v2, "setFile:", 0LL);
    -[MSDFileDownloadInfo setFileHash:](v3, "setFileHash:", 0LL);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDemoManifestCheck sharedInstance](&OBJC_CLASS___MSDDemoManifestCheck, "sharedInstance"));
    -[MSDFileDownloadInfo setChecker:](v3, "setChecker:", v4);

    -[MSDFileDownloadInfo setSkipHashCheck:](v3, "setSkipHashCheck:", 0LL);
    v5 = v3;
  }

  return v3;
}

- (BOOL)entitlementCheckForFile:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[MSDFileDownloadInfo checker](self, "checker"));
  if (!v5
    || (v6 = (void *)v5,
        objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFileDownloadInfo file](self, "file")),
        v7,
        v6,
        !v7))
  {
    id v12 = sub_10003A95C();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_10009ABA8((uint64_t)v4, v13);
    }
    BOOL v11 = 1;
    goto LABEL_11;
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFileDownloadInfo checker](self, "checker"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFileDownloadInfo file](self, "file"));
  unsigned __int8 v10 = [v8 checkFileForEntitlements:v4 forCorrespondingManifestEntry:v9];

  if ((v10 & 1) == 0)
  {
    id v14 = sub_10003A95C();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10009AC1C((uint64_t)v4, v13, v15);
    }
    BOOL v11 = 0;
LABEL_11:

    goto LABEL_12;
  }

  BOOL v11 = 1;
LABEL_12:

  return v11;
}

- (BOOL)hashCheckForFile:(id)a3
{
  id v4 = a3;
  if (-[MSDFileDownloadInfo skipHashCheck](self, "skipHashCheck"))
  {
    id v13 = sub_10003A95C();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138543362;
      id v15 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Skipping file hash check for: %{public}@",  (uint8_t *)&v14,  0xCu);
    }

    unsigned __int8 v8 = 1;
  }

  else
  {
    if (!v4)
    {
      unsigned __int8 v8 = 1;
      goto LABEL_9;
    }

    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDFileMetadata fileHashWithPath:](&OBJC_CLASS___MSDFileMetadata, "fileHashWithPath:", v4));
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 hexStringRepresentation]);

    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFileDownloadInfo fileHash](self, "fileHash"));
    unsigned __int8 v8 = [v7 isEqualToString:v6];

    if ((v8 & 1) == 0)
    {
      id v9 = sub_10003A95C();
      unsigned __int8 v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFileDownloadInfo fileHash](self, "fileHash"));
        int v14 = 138543874;
        id v15 = v4;
        __int16 v16 = 2114;
        v17 = v6;
        __int16 v18 = 2114;
        v19 = v12;
        _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "The file (%{public}@) is corrupted - File hash:  %{public}@ - Expected:  %{public}@",  (uint8_t *)&v14,  0x20u);
      }
    }
  }

LABEL_9:
  return v8;
}

- (NSString)fileHash
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setFileHash:(id)a3
{
}

- (NSString)file
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setFile:(id)a3
{
}

- (MSDDemoManifestCheck)checker
{
  return (MSDDemoManifestCheck *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setChecker:(id)a3
{
}

- (BOOL)skipHashCheck
{
  return self->_skipHashCheck;
}

- (void)setSkipHashCheck:(BOOL)a3
{
  self->_skipHashCheck = a3;
}

- (void).cxx_destruct
{
}

@end