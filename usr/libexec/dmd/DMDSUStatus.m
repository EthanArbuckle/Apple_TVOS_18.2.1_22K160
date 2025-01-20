@interface DMDSUStatus
- (BOOL)isDownloadComplete;
- (BOOL)isDownloading;
- (BOOL)isInstalling;
- (NSString)productBuildVersion;
- (PBSOSUpdateDownload)download;
- (double)downloadPercentComplete;
- (void)setDownload:(id)a3;
@end

@implementation DMDSUStatus

- (BOOL)isInstalling
{
  return 0;
}

- (BOOL)isDownloading
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DMDSUStatus download](self, "download"));
  BOOL v3 = v2 != 0LL;

  return v3;
}

- (BOOL)isDownloadComplete
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDSUStatus download](self, "download"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDSUStatus download](self, "download"));
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 progress]);
    unsigned __int8 v6 = [v5 isDone];
  }

  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (double)downloadPercentComplete
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDSUStatus download](self, "download"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDSUStatus download](self, "download"));
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 progress]);
    [v5 normalizedPercentComplete];
    double v7 = v6;
  }

  else
  {
    double v7 = 0.0;
  }

  return v7;
}

- (NSString)productBuildVersion
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DMDSUStatus download](self, "download"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 descriptor]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 productBuildVersion]);

  return (NSString *)v4;
}

- (PBSOSUpdateDownload)download
{
  return self->_download;
}

- (void)setDownload:(id)a3
{
}

- (void).cxx_destruct
{
}

@end