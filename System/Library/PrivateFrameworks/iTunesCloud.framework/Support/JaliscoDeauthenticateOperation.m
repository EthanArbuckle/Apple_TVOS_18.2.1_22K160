@interface JaliscoDeauthenticateOperation
- (void)main;
@end

@implementation JaliscoDeauthenticateOperation

- (void)main
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICDeviceInfo currentDeviceInfo](&OBJC_CLASS___ICDeviceInfo, "currentDeviceInfo"));
  if ([v3 isWatch]
    && (v4 = (void *)objc_claimAutoreleasedReturnValue( +[ICNanoPairedDeviceStatusMonitor sharedMonitor]( ICNanoPairedDeviceStatusMonitor,  "sharedMonitor")),  unsigned int v5 = [v4 isMediaSyncingSupported],  v4,  v5))
  {
    -[CloudLibraryOperation setStatus:](self, "setStatus:", 1LL);
    v6 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Not running JaliscoDeauthenticateOperation on wOS platform",  buf,  2u);
    }
  }

  else
  {
    v6 = (os_log_s *)[[MSVXPCTransaction alloc] initWithName:@"JaliscoDeauthenticateOperation"];
    -[os_log_s beginTransaction](v6, "beginTransaction");
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation clientIdentity](self, "clientIdentity"));
    [v7 setClientIdentity:v8];

    v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472LL;
    v15 = sub_100021D10;
    v16 = &unk_1001A64D0;
    v17 = self;
    id v18 = (id)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
    id v9 = v18;
    [v9 performDatabaseTransactionWithBlock:&v13];
    -[CloudLibraryOperation setStatus:](self, "setStatus:", 1LL, v13, v14, v15, v16, v17);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
    uint64_t v11 = MSVTCCIdentityForCurrentProcess();
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    [v10 setClientIdentity:v12];

    -[os_log_s endTransaction](v6, "endTransaction");
  }
}

@end