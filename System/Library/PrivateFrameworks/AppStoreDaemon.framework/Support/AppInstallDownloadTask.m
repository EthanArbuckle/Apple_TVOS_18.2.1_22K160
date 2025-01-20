@interface AppInstallDownloadTask
- (void)main;
@end

@implementation AppInstallDownloadTask

- (void)main
{
  if (self)
  {
    v3 = (char *)sub_1001E2698(self->_install, (uint64_t)@"request_count");
    v20 = 0LL;
    id v21 = 0LL;
    v4 = sub_100209270((uint64_t)self, &v21, &v20);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    id v6 = v21;
    v7 = v20;
    if (v5)
    {
      v19 = v3;
      coordinator = self->_coordinator;
      id v9 = v5;
      id v10 = v6;
      objc_opt_self(&OBJC_CLASS___AppInstallDownloadResponse);
      v11 = (AppInstallInfo *)sub_10020AAD0( (id *)objc_alloc(&OBJC_CLASS___AppInstallDownloadResponse),  coordinator,  0LL,  v10,  v9,  0LL);

      if (LOBYTE(self->super._error))
      {
        id v12 = sub_1001E25D0(self->_install, (uint64_t)@"bytes_total");
        v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        int64_t v14 = -[SQLiteMemoryEntity databaseID](self->_install, "databaseID");
        id v15 = v13;
        if (v11)
        {
          objc_storeStrong((id *)&v11->_assetPromise, v13);
          v11->_coordinatorID = (NSUUID *)v14;
        }
      }

      int64_t v16 = -[SQLiteMemoryEntity databaseID](self->_install, "databaseID");
      if (v11)
      {
        v11->_coordinatorID = (NSUUID *)v16;
        v11->_downloadProgress = (NSProgress *)(v19 + 1);
      }
    }

    else
    {
      v17 = sub_10020A82C( (uint64_t)AppInstallDownloadResponse,  [*(id *)&self->_didLoadAssetSize databaseID],  v7);
      v11 = (AppInstallInfo *)objc_claimAutoreleasedReturnValue(v17);
    }
  }

  else
  {
    v11 = 0LL;
  }

  installInfo = self->_installInfo;
  self->_installInfo = v11;
}

- (void).cxx_destruct
{
}

@end