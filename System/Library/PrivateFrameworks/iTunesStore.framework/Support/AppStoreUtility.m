@interface AppStoreUtility
+ (id)_newManifestWithManifestType:(int64_t)a3;
+ (id)_newRequestWithManifest:(id)a3;
+ (void)_addDownloads:(id)a3 toManifest:(id)a4 forClientID:(id)a5;
+ (void)_checkClaimsForAccountID:(id)a3 claimStyle:(int64_t)a4 clientAuditTokenData:(id)a5 establishActiveAccounts:(BOOL)a6 ignoresPreviousClaimAttempts:(BOOL)a7 completionBlock:(id)a8;
+ (void)_sendSoftwareManifest:(id)a3 withReason:(id)a4;
+ (void)checkClaimsEstablishingActiveAccounts:(BOOL)a3 ignoringPreviousClaimAttempts:(BOOL)a4 completionBlock:(id)a5;
+ (void)checkDownloadQueue;
+ (void)checkFirstPartyClaimsWithAuditTokenData:(id)a3 completionBlock:(id)a4;
+ (void)checkFirstPartyClaimsWithCompletionBlock:(id)a3;
+ (void)claimAppsWithPurchase:(id)a3;
+ (void)hidePendingUpdatesBadge;
+ (void)installManagedAppWithRequest:(id)a3 completionBlock:(id)a4;
+ (void)postBulletinWithTitle:(id)a3 message:(id)a4 destinations:(unint64_t)a5 actionButtonTitle:(id)a6 actionButtonURL:(id)a7 launchURL:(id)a8 completionBlock:(id)a9;
+ (void)reloadUpdatesWithCompletionBlock:(id)a3;
+ (void)repairAppWithRequest:(id)a3 completionBlock:(id)a4;
+ (void)restoreDemotedAppsWithBundleIDs:(id)a3;
+ (void)sendActivitySubscriptionEntitlementsWithDictionary:(id)a3 forAccountID:(id)a4;
+ (void)sendAppStoreSubscriptionEntitlementsWithDictionary:(id)a3 forAccountID:(id)a4;
+ (void)sendNewsSubscriptionEntitlementsWithDictionary:(id)a3 forAccountID:(id)a4;
+ (void)sendSoftwareDownloads:(id)a3 withReason:(id)a4;
+ (void)sendSoftwareDownloads:(id)a3 withReason:(id)a4 forClientID:(id)a5;
+ (void)sendSoftwareDownloads:(id)a3 withReason:(id)a4 forClientID:(id)a5 manifestType:(int64_t)a6;
+ (void)sendSoftwareDownloads:(id)a3 withReason:(id)a4 manifestType:(int64_t)a5;
@end

@implementation AppStoreUtility

+ (void)checkClaimsEstablishingActiveAccounts:(BOOL)a3 ignoringPreviousClaimAttempts:(BOOL)a4 completionBlock:(id)a5
{
}

+ (void)checkDownloadQueue
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v3) {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v4 = [v3 shouldLog];
  else {
    LODWORD(v5) = v4;
  }
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 OSLogObject]);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
    uint64_t v5 = v5;
  }
  else {
    v5 &= 2u;
  }
  if (!(_DWORD)v5) {
    goto LABEL_12;
  }
  int v12 = 138543362;
  id v13 = (id)objc_opt_class(a1);
  id v7 = v13;
  v8 = (void *)_os_log_send_and_compose_impl( v5,  0LL,  0LL,  0LL,  &_mh_execute_header,  v6,  1LL,  "[%{public}@]: Checking the automatic download queue",  &v12,  12);

  if (v8)
  {
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v8,  4LL));
    free(v8);
    SSFileLog(v3, @"%@");
LABEL_12:
  }

  id v9 = objc_msgSend( objc_alloc((Class)ISWeakLinkedClassForString(@"ASDCheckQueueRequestOptions", 29)),  "initWithReason:",  1);
  id v10 = objc_msgSend( objc_alloc((Class)ISWeakLinkedClassForString(@"ASDCheckQueueRequest", 29)),  "initWithOptions:",  v9);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10017776C;
  v11[3] = &unk_1003505C8;
  v11[4] = a1;
  [v10 sendRequestCompletionBlock:v11];
}

+ (void)checkFirstPartyClaimsWithAuditTokenData:(id)a3 completionBlock:(id)a4
{
}

+ (void)checkFirstPartyClaimsWithCompletionBlock:(id)a3
{
}

+ (void)claimAppsWithPurchase:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 gratisIdentifiers]);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v6) {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v7 = [v6 shouldLog];
  else {
    LODWORD(v8) = v7;
  }
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 OSLogObject]);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
    uint64_t v8 = v8;
  }
  else {
    v8 &= 2u;
  }
  if (!(_DWORD)v8) {
    goto LABEL_12;
  }
  id v10 = (void *)objc_opt_class(a1);
  id v11 = v10;
  int v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "componentsJoinedByString:", @", "));
  int v22 = 138543618;
  v23 = v10;
  __int16 v24 = 2114;
  v25 = v12;
  id v13 = (void *)_os_log_send_and_compose_impl( v8,  0LL,  0LL,  0LL,  &_mh_execute_header,  v9,  1LL,  "[%{public}@]: Making claim for bundleIDs: %{public}@",  &v22,  22);

  if (v13)
  {
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v13,  4LL));
    free(v13);
    SSFileLog(v6, @"%@");
LABEL_12:
  }

  id v14 = objc_msgSend( objc_alloc((Class)ISWeakLinkedClassForString(@"ASDClaimApplicationsRequestOptions", 29)),  "initWithBundleIdentifiers:",  v5);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v4 accountIdentifier]);
  [v14 setAccountID:v15];

  v16 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForDownloadProperty:SSDownloadPropertyShouldSuppressErrorDialogs]);
  objc_msgSend(v14, "setSuppressErrorDialogs:", objc_msgSend(v16, "BOOLValue"));

  v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v4 uniqueIdentifier]));
  [v14 setPurchaseID:v17];

  v18 = (void *)objc_claimAutoreleasedReturnValue([v4 requestProperties]);
  v19 = (void *)objc_claimAutoreleasedReturnValue([v18 HTTPHeaders]);
  [v14 setHttpHeaders:v19];

  id v20 = objc_msgSend( objc_alloc((Class)ISWeakLinkedClassForString(@"ASDClaimApplicationsRequest", 29)),  "initWithOptions:",  v14);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100177C54;
  v21[3] = &unk_1003505E8;
  v21[4] = a1;
  [v20 sendRequestWithCompletionBlock:v21];
}

+ (void)hidePendingUpdatesBadge
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v3) {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v4 = [v3 shouldLog];
  else {
    LODWORD(v5) = v4;
  }
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 OSLogObject]);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
    uint64_t v5 = v5;
  }
  else {
    v5 &= 2u;
  }
  if (!(_DWORD)v5) {
    goto LABEL_12;
  }
  int v10 = 138543362;
  id v11 = (id)objc_opt_class(a1);
  id v7 = v11;
  uint64_t v8 = (void *)_os_log_send_and_compose_impl( v5,  0LL,  0LL,  0LL,  &_mh_execute_header,  v6,  1LL,  "[%{public}@]: Hiding pending updates badge",  &v10,  12);

  if (v8)
  {
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v8,  4LL));
    free(v8);
    SSFileLog(v3, @"%@");
LABEL_12:
  }

  id v9 = objc_alloc_init((Class)ISWeakLinkedClassForString(@"ASDSoftwareUpdatesStore", 29LL));
  [v9 hideApplicationBadgeForPendingUpdates];
}

+ (void)installManagedAppWithRequest:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 itemIdentifier]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v8 longLongValue]));

  int v10 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v10) {
    int v10 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v11 = [v10 shouldLog];
  else {
    LODWORD(v12) = v11;
  }
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 OSLogObject]);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO)) {
    uint64_t v12 = v12;
  }
  else {
    v12 &= 2u;
  }
  if (!(_DWORD)v12) {
    goto LABEL_12;
  }
  id v14 = (void *)objc_opt_class(a1);
  id v15 = v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue([v6 externalVersionIdentifier]);
  int v24 = 138543874;
  v25 = v14;
  __int16 v26 = 2112;
  v27 = v9;
  __int16 v28 = 2112;
  v29 = v16;
  v17 = (void *)_os_log_send_and_compose_impl( v12,  0LL,  0LL,  0LL,  &_mh_execute_header,  v13,  1LL,  "[%{public}@]: Sending managed application request for itemID: %@ externalVersionID: %@",  &v24,  32);

  if (v17)
  {
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v17,  4LL));
    free(v17);
    SSFileLog(v10, @"%@");
LABEL_12:
  }

  id v18 = objc_alloc((Class)ISWeakLinkedClassForString(@"ASDManagedApplicationRequestOptions", 29LL));
  v19 = (void *)objc_claimAutoreleasedReturnValue([v6 externalVersionIdentifier]);
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleIdentifier]);
  v21 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleVersion]);
  id v22 = objc_msgSend( v18,  "initWithItemIdentifer:externalVersionIdentifier:bundleIdentifier:bundleVersion:skipDownloads:",  v9,  v19,  v20,  v21,  objc_msgSend(v6, "skipDownloads"));

  id v23 = objc_msgSend( objc_alloc((Class)ISWeakLinkedClassForString(@"ASDManagedApplicationRequest", 29)),  "initWithOptions:",  v22);
  [v23 sendRequestWithCompletionBlock:v7];
}

+ (void)postBulletinWithTitle:(id)a3 message:(id)a4 destinations:(unint64_t)a5 actionButtonTitle:(id)a6 actionButtonURL:(id)a7 launchURL:(id)a8 completionBlock:(id)a9
{
  id v14 = a3;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = a9;
  id v19 = a4;
  id v20 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v20) {
    id v20 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  LODWORD(v21) = [v20 shouldLog];
  id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue([v20 OSLogObject]);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO)) {
    uint64_t v21 = v21;
  }
  else {
    v21 &= 2u;
  }
  if ((_DWORD)v21)
  {
    int v29 = 138543618;
    id v30 = (id)objc_opt_class(a1);
    __int16 v31 = 2112;
    id v32 = v14;
    id v23 = v30;
    int v24 = (void *)_os_log_send_and_compose_impl( v21,  0LL,  0LL,  0LL,  &_mh_execute_header,  v22,  1LL,  "[%{public}@]: Sending post bulletin request with title: %@",  &v29,  22);

    if (v24)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v24,  4LL));
      free(v24);
      SSFileLog(v20, @"%@");
    }
  }

  else
  {
  }

  id v26 = objc_alloc_init((Class)ISWeakLinkedClassForString(@"ASDPostBulletinRequestOptions", 29LL));
  [v26 setTitle:v14];
  [v26 setMessage:v19];

  [v26 setDestinations:a5];
  if (v15) {
    [v26 setActionButtonTitle:v15];
  }
  if (v16) {
    [v26 setActionButtonURL:v16];
  }
  if (v17) {
    [v26 setLaunchURL:v17];
  }
  id v27 = objc_msgSend( objc_alloc((Class)ISWeakLinkedClassForString(@"ASDPostBulletinRequest", 29)),  "initWithOptions:",  v26);
  [v27 startWithCompletionBlock:v18];
}

+ (void)reloadUpdatesWithCompletionBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v5) {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v6 = [v5 shouldLog];
  else {
    LODWORD(v7) = v6;
  }
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 OSLogObject]);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
    uint64_t v7 = v7;
  }
  else {
    v7 &= 2u;
  }
  if (!(_DWORD)v7) {
    goto LABEL_12;
  }
  int v15 = 138543362;
  id v16 = (id)objc_opt_class(a1);
  id v9 = v16;
  int v10 = (void *)_os_log_send_and_compose_impl( v7,  0LL,  0LL,  0LL,  &_mh_execute_header,  v8,  1LL,  "[%{public}@]: Checking for updates",  &v15,  12);

  if (v10)
  {
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v10,  4LL));
    free(v10);
    SSFileLog(v5, @"%@");
LABEL_12:
  }

  id v11 = objc_alloc_init((Class)ISWeakLinkedClassForString(@"ASDSoftwareUpdatesStore", 29LL));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100178724;
  v13[3] = &unk_100350610;
  id v14 = v4;
  id v12 = v4;
  [v11 reloadForSettingsFromServerWithCompletionBlock:v13];
}

+ (void)repairAppWithRequest:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v8) {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v9 = [v8 shouldLog];
  else {
    LODWORD(v10) = v9;
  }
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 OSLogObject]);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO)) {
    uint64_t v10 = v10;
  }
  else {
    v10 &= 2u;
  }
  if (!(_DWORD)v10) {
    goto LABEL_12;
  }
  id v12 = (void *)objc_opt_class(a1);
  id v13 = v12;
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleID]);
  int v15 = (void *)objc_claimAutoreleasedReturnValue([v6 accountDSID]);
  int v23 = 138544130;
  int v24 = v12;
  __int16 v25 = 2112;
  id v26 = v14;
  __int16 v27 = 2112;
  __int16 v28 = v15;
  __int16 v29 = 2048;
  id v30 = [v6 claimStyle];
  id v16 = (void *)_os_log_send_and_compose_impl( v10,  0LL,  0LL,  0LL,  &_mh_execute_header,  v11,  1LL,  "[%{public}@]: Sending application repair request for bundleID: %@ accountDSID: %@ repairType: %ld",  &v23,  42);

  if (v16)
  {
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v16,  4LL));
    free(v16);
    SSFileLog(v8, @"%@");
LABEL_12:
  }

  BOOL v17 = [v6 claimStyle] != 0;
  id v18 = objc_alloc((Class)ISWeakLinkedClassForString(@"ASDRepairApplicationRequestOptions", 29LL));
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleID]);
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v6 accountDSID]);
  id v21 = [v18 initWithBundleID:v19 accountIdentifier:v20 claimStyle:v17];

  id v22 = objc_msgSend( objc_alloc((Class)ISWeakLinkedClassForString(@"ASDRepairApplicationRequest", 29)),  "initWithOptions:",  v21);
  [v22 sendRequestWithCompletionBlock:v7];
}

+ (void)restoreDemotedAppsWithBundleIDs:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v5) {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v6 = [v5 shouldLog];
  else {
    unsigned int v7 = v6;
  }
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 OSLogObject]);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
    uint64_t v9 = v7;
  }
  else {
    uint64_t v9 = v7 & 2;
  }
  if (!(_DWORD)v9) {
    goto LABEL_12;
  }
  uint64_t v10 = (void *)objc_opt_class(a1);
  id v11 = v10;
  id v12 = [v4 count];
  id v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "componentsJoinedByString:", @", "));
  int v18 = 138543874;
  id v19 = v10;
  __int16 v20 = 2048;
  id v21 = v12;
  __int16 v22 = 2112;
  int v23 = v13;
  id v14 = (void *)_os_log_send_and_compose_impl( v9,  0LL,  0LL,  0LL,  &_mh_execute_header,  v8,  1LL,  "[%{public}@]: Sending request to restore %lu demoted applications: %@",  &v18,  32);

  if (v14)
  {
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v14,  4LL));
    free(v14);
    SSFileLog(v5, @"%@");
LABEL_12:
  }

  id v15 = objc_msgSend( objc_alloc((Class)ISWeakLinkedClassForString(@"ASDRestoreDemotedApplicationsRequestOptions", 29)),  "initWithBundleIDs:",  v4);
  id v16 = objc_msgSend( objc_alloc((Class)ISWeakLinkedClassForString(@"ASDRestoreDemotedApplicationsRequest", 29)),  "initWithOptions:",  v15);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100178C34;
  v17[3] = &unk_100350630;
  v17[4] = a1;
  [v16 startWithCompletionBlock:v17];
}

+ (void)sendSoftwareDownloads:(id)a3 withReason:(id)a4
{
}

+ (void)sendSoftwareDownloads:(id)a3 withReason:(id)a4 manifestType:(int64_t)a5
{
}

+ (void)sendSoftwareDownloads:(id)a3 withReason:(id)a4 forClientID:(id)a5
{
}

+ (void)sendSoftwareDownloads:(id)a3 withReason:(id)a4 forClientID:(id)a5 manifestType:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v13) {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v14 = [v13 shouldLog];
  else {
    LODWORD(v15) = v14;
  }
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 OSLogObject]);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v15 = v15;
  }
  else {
    v15 &= 2u;
  }
  if (!(_DWORD)v15) {
    goto LABEL_12;
  }
  BOOL v17 = (void *)objc_opt_class(a1);
  id v18 = v17;
  int v21 = 138543874;
  __int16 v22 = v17;
  __int16 v23 = 2048;
  id v24 = [v10 count];
  __int16 v25 = 2114;
  id v26 = v11;
  id v19 = (void *)_os_log_send_and_compose_impl( v15,  0LL,  0LL,  0LL,  &_mh_execute_header,  v16,  0LL,  "[%{public}@]: Sending %lu downloads from %{public}@",  &v21,  32);

  if (v19)
  {
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v19,  4LL));
    free(v19);
    SSFileLog(v13, @"%@");
LABEL_12:
  }

  id v20 = [a1 _newManifestWithManifestType:a6];
  [a1 _addDownloads:v10 toManifest:v20 forClientID:v12];

  [a1 _sendSoftwareManifest:v20 withReason:v11];
}

+ (void)sendNewsSubscriptionEntitlementsWithDictionary:(id)a3 forAccountID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v8) {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v9 = [v8 shouldLog];
  else {
    LODWORD(v10) = v9;
  }
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 OSLogObject]);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v10 = v10;
  }
  else {
    v10 &= 2u;
  }
  if (!(_DWORD)v10) {
    goto LABEL_12;
  }
  int v16 = 138543362;
  id v17 = (id)objc_opt_class(a1);
  id v12 = v17;
  id v13 = (void *)_os_log_send_and_compose_impl( v10,  0LL,  0LL,  0LL,  &_mh_execute_header,  v11,  0LL,  "[%{public}@]: Sending News subscription entitlements",  &v16,  12);

  if (v13)
  {
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v13,  4LL));
    free(v13);
    SSFileLog(v8, @"%@");
LABEL_12:
  }

  uint64_t v14 = ISWeakLinkedClassForString(@"ASDSubscriptionEntitlements", 29LL);
  uint64_t v15 = (void *)objc_opt_new(v14);
  [v15 setSubscriptionEntitlementsWithDictionary:v7 forAccountID:v6 segment:0];
}

+ (void)sendActivitySubscriptionEntitlementsWithDictionary:(id)a3 forAccountID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v8) {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v9 = [v8 shouldLog];
  else {
    LODWORD(v10) = v9;
  }
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 OSLogObject]);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v10 = v10;
  }
  else {
    v10 &= 2u;
  }
  if (!(_DWORD)v10) {
    goto LABEL_12;
  }
  int v16 = 138543362;
  id v17 = (id)objc_opt_class(a1);
  id v12 = v17;
  id v13 = (void *)_os_log_send_and_compose_impl( v10,  0LL,  0LL,  0LL,  &_mh_execute_header,  v11,  0LL,  "[%{public}@]: Sending Activity subscription entitlements",  &v16,  12);

  if (v13)
  {
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v13,  4LL));
    free(v13);
    SSFileLog(v8, @"%@");
LABEL_12:
  }

  uint64_t v14 = ISWeakLinkedClassForString(@"ASDSubscriptionEntitlements", 29LL);
  uint64_t v15 = (void *)objc_opt_new(v14);
  [v15 setSubscriptionEntitlementsWithDictionary:v7 forAccountID:v6 segment:2];
}

+ (void)sendAppStoreSubscriptionEntitlementsWithDictionary:(id)a3 forAccountID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v8) {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v9 = [v8 shouldLog];
  else {
    LODWORD(v10) = v9;
  }
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 OSLogObject]);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v10 = v10;
  }
  else {
    v10 &= 2u;
  }
  if (!(_DWORD)v10) {
    goto LABEL_12;
  }
  int v16 = 138543362;
  id v17 = (id)objc_opt_class(a1);
  id v12 = v17;
  id v13 = (void *)_os_log_send_and_compose_impl( v10,  0LL,  0LL,  0LL,  &_mh_execute_header,  v11,  0LL,  "[%{public}@]: Sending AppStore subscription entitlements",  &v16,  12);

  if (v13)
  {
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v13,  4LL));
    free(v13);
    SSFileLog(v8, @"%@");
LABEL_12:
  }

  uint64_t v14 = ISWeakLinkedClassForString(@"ASDSubscriptionEntitlements", 29LL);
  uint64_t v15 = (void *)objc_opt_new(v14);
  [v15 setSubscriptionEntitlementsWithDictionary:v7 forAccountID:v6 segment:1];
}

+ (void)_addDownloads:(id)a3 toManifest:(id)a4 forClientID:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](&OBJC_CLASS___SSAccountStore, "defaultStore"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 activeAccount]);

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100179678;
  v15[3] = &unk_100350658;
  id v16 = v8;
  id v17 = v11;
  id v18 = v7;
  id v12 = v7;
  id v13 = v11;
  id v14 = v8;
  [v9 enumerateObjectsUsingBlock:v15];
}

+ (void)_checkClaimsForAccountID:(id)a3 claimStyle:(int64_t)a4 clientAuditTokenData:(id)a5 establishActiveAccounts:(BOOL)a6 ignoresPreviousClaimAttempts:(BOOL)a7 completionBlock:(id)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  id v13 = a3;
  id v14 = a8;
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v15) {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v16 = [v15 shouldLog];
  else {
    LODWORD(v17) = v16;
  }
  id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue([v15 OSLogObject]);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO)) {
    uint64_t v17 = v17;
  }
  else {
    v17 &= 2u;
  }
  if ((_DWORD)v17)
  {
    int v29 = 138543874;
    id v30 = (id)objc_opt_class(a1);
    __int16 v31 = 2112;
    id v32 = v13;
    __int16 v33 = 2048;
    int64_t v34 = a4;
    id v19 = v30;
    id v20 = (void *)_os_log_send_and_compose_impl( v17,  0LL,  0LL,  0LL,  &_mh_execute_header,  v18,  1LL,  "[%{public}@]: Checking claims for accountID: %@ claimStyle: %ld",  &v29,  32);

    if (!v20) {
      goto LABEL_13;
    }
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v20,  4LL));
    free(v20);
    __int16 v25 = v18;
    SSFileLog(v15, @"%@");
  }

LABEL_13:
  id v21 = objc_msgSend( objc_alloc((Class)ISWeakLinkedClassForString(@"ASDClaimApplicationsRequestOptions", 29)),  "initWithClaimStyle:",  a4);
  __int16 v22 = v21;
  if (v13) {
    [v21 setAccountID:v13];
  }
  objc_msgSend(v22, "setEstablishesActiveAccount:", v10, v25);
  [v22 setIgnoresPreviousClaimAttempts:v9];
  id v23 = objc_msgSend( objc_alloc((Class)ISWeakLinkedClassForString(@"ASDClaimApplicationsRequest", 29)),  "initWithOptions:",  v22);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_100179A34;
  v26[3] = &unk_100350680;
  id v27 = v14;
  id v28 = a1;
  id v24 = v14;
  [v23 sendRequestWithCompletionBlock:v26];
}

+ (id)_newManifestWithManifestType:(int64_t)a3
{
  return objc_msgSend( objc_alloc((Class)ISWeakLinkedClassForString(@"ASDJobManifest", 29)),  "initWithManifestType:",  a3);
}

+ (id)_newRequestWithManifest:(id)a3
{
  id v3 = a3;
  id v4 = objc_msgSend( objc_alloc((Class)ISWeakLinkedClassForString(@"ASDInstallManifestRequestOptions", 29)),  "initWithManifest:",  v3);

  id v5 = objc_msgSend( objc_alloc((Class)ISWeakLinkedClassForString(@"ASDInstallManifestRequest", 29)),  "initWithOptions:",  v4);
  return v5;
}

+ (void)_sendSoftwareManifest:(id)a3 withReason:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _newRequestWithManifest:a3];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100179D7C;
  v9[3] = &unk_1003506A8;
  id v10 = v6;
  id v11 = a1;
  id v8 = v6;
  [v7 startWithCompletionBlock:v9];
}

@end