@interface MIClientConnection
- (BOOL)_validateAppWithBundleID:(id)a3 isNotInstalledInDomain:(unint64_t)a4 error:(id *)a5;
- (BOOL)_validateArgsForMethodWithName:(const char *)a3 bundleIdentifier:(id)a4 data:(id)a5 optionalOptions:(id)a6 error:(id *)a7;
- (BOOL)_validateInstallRequestForURL:(id)a3 identity:(id)a4 targetingDomain:(unint64_t)a5 options:(id)a6 withError:(id *)a7;
- (NSString)clientName;
- (NSXPCConnection)xpcConnection;
- (unsigned)percentComplete;
- (void)_callBlockAfterDelegateMessagesSend:(const char *)a3 dispatchBlock:(id)a4;
- (void)_doInstallationForURL:(id)a3 identity:(id)a4 domain:(unint64_t)a5 options:(id)a6 operationType:(unint64_t)a7 completion:(id)a8;
- (void)_finalizeStagedUpdateForUUID:(id)a3 completion:(id)a4;
- (void)_installURL:(id)a3 identity:(id)a4 targetingDomain:(unint64_t)a5 options:(id)a6 operationType:(unint64_t)a7 completion:(id)a8;
- (void)_stageURL:(id)a3 identity:(id)a4 domain:(unint64_t)a5 options:(id)a6 completion:(id)a7;
- (void)_triggerRegistrationForContent:(unint64_t)a3 registrationOptions:(id)a4 writeLock:(BOOL)a5 withCompletion:(id)a6;
- (void)_uninstallIdentities:(id)a3 withOptions:(id)a4 completion:(id)a5;
- (void)acquireReferenceforInstalledAppWithIdentity:(id)a3 inDomain:(unint64_t)a4 matchingInstallSessionID:(id)a5 completion:(id)a6;
- (void)addDataSeparatedAppsWithBundleIDs:(id)a3 toPersona:(id)a4 withCompletion:(id)a5;
- (void)cancelUpdateForStagedUUID:(id)a3 completion:(id)a4;
- (void)checkCapabilities:(id)a3 withOptions:(id)a4 completion:(id)a5;
- (void)clearTestFlags:(unint64_t)a3 withCompletion:(id)a4;
- (void)clearUninstalledIdentifiers:(id)a3 withOptions:(id)a4 completion:(id)a5;
- (void)createSerializedPlaceholderForInstalledAppWithBundeID:(id)a3 personaUniqueString:(id)a4 atResultURL:(id)a5 onDevice:(int)a6 withCompletion:(id)a7;
- (void)dieForTesting;
- (void)endTestModeWithCompletion:(id)a3;
- (void)enumerateInstalledAppsWithOptions:(id)a3 completion:(id)a4;
- (void)fetchDiskUsageForIdentifiers:(id)a3 withOptions:(id)a4 completion:(id)a5;
- (void)fetchInfoForContainerizedAppWithIdentity:(id)a3 inDomain:(unint64_t)a4 options:(id)a5 completion:(id)a6;
- (void)fetchInfoForFrameworkAtURL:(id)a3 options:(id)a4 completion:(id)a5;
- (void)finalizeReference:(id)a3 completion:(id)a4;
- (void)finalizeStagedInstallForUUID:(id)a3 returningResultInfo:(BOOL)a4 completion:(id)a5;
- (void)getAppMetadataForApp:(id)a3 completion:(id)a4;
- (void)getPidForTestingWithCompletion:(id)a3;
- (void)getTestModeWithCompletion:(id)a3;
- (void)installURL:(id)a3 identity:(id)a4 targetingDomain:(unint64_t)a5 options:(id)a6 returningResultInfo:(BOOL)a7 completion:(id)a8;
- (void)invalidateReference:(id)a3 completion:(id)a4;
- (void)linkedBundleIDsForAppIdentity:(id)a3 withCompletion:(id)a4;
- (void)listSafeHarborsOfType:(unint64_t)a3 forPersona:(id)a4 withOptions:(id)a5 completion:(id)a6;
- (void)lookupSystemAppStateWithOptions:(id)a3 completion:(id)a4;
- (void)lookupUninstalledWithOptions:(id)a3 completion:(id)a4;
- (void)raiseExceptionWithCompletion:(id)a3;
- (void)referencesForBundleWithIdentifier:(id)a3 inDomain:(unint64_t)a4 completion:(id)a5;
- (void)registerContentsForDiskImageAtURL:(id)a3 completion:(id)a4;
- (void)registerPlaceholderForReference:(id)a3 completion:(id)a4;
- (void)registerSafeHarborAtPath:(id)a3 forIdentity:(id)a4 ofType:(unint64_t)a5 withOptions:(id)a6 completion:(id)a7;
- (void)releaseTerminationAssertion;
- (void)removeDataSeparatedAppsWithBundleIDs:(id)a3 fromPersona:(id)a4 withCompletion:(id)a5;
- (void)removeSafeHarborForIdentity:(id)a3 ofType:(unint64_t)a4 withOptions:(id)a5 completion:(id)a6;
- (void)revertForIXWithIdentity:(id)a3 withOptions:(id)a4 completion:(id)a5;
- (void)revertIdentity:(id)a3 withOptions:(id)a4 completion:(id)a5;
- (void)sendDelegateMessagesComplete;
- (void)sendProgressWithDictionary:(id)a3;
- (void)sendProgressWithStatus:(id)a3;
- (void)sendProgressWithStatus:(id)a3 percentComplete:(unsigned int)a4;
- (void)setDataSeparatedAppsWithBundleIDs:(id)a3 withPersona:(id)a4 withCompletion:(id)a5;
- (void)setEligibilityTestOverrides:(id)a3 withCompletion:(id)a4;
- (void)setLaunchWarningForApp:(id)a3 withUniqueInstallIdentifier:(id)a4 warningData:(id)a5 completion:(id)a6;
- (void)setSystemAppMigrationComplete:(id)a3;
- (void)setTestFlags:(unint64_t)a3 withCompletion:(id)a4;
- (void)setTestModeWithCompletion:(id)a3;
- (void)setXpcConnection:(id)a3;
- (void)stageInstallURL:(id)a3 identity:(id)a4 targetingDomain:(unint64_t)a5 withOptions:(id)a6 completion:(id)a7;
- (void)systemAppMigratorHasCompleted:(id)a3;
- (void)triggerRegistrationForContainerizedContentForOptions:(id)a3 withCompletion:(id)a4;
- (void)triggerRegistrationForDiskImageContentForOptions:(id)a3 withCompletion:(id)a4;
- (void)uninstallIdentifiers:(id)a3 withOptions:(id)a4 completion:(id)a5;
- (void)uninstallIdentity:(id)a3 withOptions:(id)a4 completion:(id)a5;
- (void)unregisterContentsForDiskImageAtURL:(id)a3 completion:(id)a4;
- (void)updatePlaceholderMetadataForApp:(id)a3 installType:(unint64_t)a4 failureReason:(unint64_t)a5 underlyingError:(id)a6 failureSource:(unint64_t)a7 completion:(id)a8;
- (void)updateSinfForIXWithIdentifier:(id)a3 withOptions:(id)a4 sinfData:(id)a5 completion:(id)a6;
- (void)updateSystemAppStateForIdentifier:(id)a3 appState:(int)a4 completion:(id)a5;
- (void)updateiTunesMetadataForIXWithIdentifier:(id)a3 metadata:(id)a4 completion:(id)a5;
- (void)waitForSystemAppMigratorToComplete:(id)a3;
@end

@implementation MIClientConnection

- (NSString)clientName
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MIClientConnection xpcConnection](self, "xpcConnection"));
  v3 = v2;
  if (v2)
  {
    id v4 = [v2 processIdentifier];
    id v5 = [v3 effectiveUserIdentifier];
    id v6 = [v3 effectiveGroupIdentifier];
    uint64_t v7 = MICopyProcessNameForPid(v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ (pid %d (%u/%u))",  v8,  v4,  v5,  v6));
  }

  else
  {
    v9 = @"Unknown client";
  }

  return (NSString *)v9;
}

- (void)sendProgressWithDictionary:(id)a3
{
  id v7 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MIClientConnection xpcConnection](self, "xpcConnection"));
  id v5 = v4;
  if (v4)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 remoteObjectProxyWithErrorHandler:&stru_100081108]);
    [v6 reportProgress:v7];
  }

  else if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
  {
    MOLogWrite(qword_100095BF8);
  }
}

- (void)sendProgressWithStatus:(id)a3 percentComplete:(unsigned int)a4
{
  uint64_t percentComplete = self->_percentComplete;
  if (percentComplete < a4)
  {
    self->_uint64_t percentComplete = a4;
    uint64_t percentComplete = *(void *)&a4;
  }

  v9[0] = @"Status";
  v9[1] = @"PercentComplete";
  v10[0] = a3;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", percentComplete));
  v10[1] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  2LL));

  -[MIClientConnection sendProgressWithDictionary:](self, "sendProgressWithDictionary:", v8);
}

- (void)sendProgressWithStatus:(id)a3
{
}

- (void)sendDelegateMessagesComplete
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MIClientConnection xpcConnection](self, "xpcConnection"));
  v3 = v2;
  if (v2)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_1000140D0;
    v5[3] = &unk_100081130;
    id v6 = v2;
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v6 remoteObjectProxyWithErrorHandler:v5]);
    [v4 delegateMessageDeliveryCompleteWithError:0];
  }
}

- (void)releaseTerminationAssertion
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MIClientConnection xpcConnection](self, "xpcConnection"));
  v3 = v2;
  if (v2)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_1000141CC;
    v5[3] = &unk_100081130;
    id v6 = v2;
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v6 synchronousRemoteObjectProxyWithErrorHandler:v5]);
    [v4 releaseTerminationAssertion];
  }
}

- (void)_callBlockAfterDelegateMessagesSend:(const char *)a3 dispatchBlock:(id)a4
{
  id v6 = (void (**)(void))a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MIClientConnection xpcConnection](self, "xpcConnection"));
  if (v7)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    void v9[2] = sub_10001430C;
    v9[3] = &unk_100081158;
    id v10 = (id)os_transaction_create(a3);
    v11 = v6;
    id v8 = v10;
    [v7 addBarrierBlock:v9];
  }

  else
  {
    v6[2](v6);
  }
}

- (BOOL)_validateAppWithBundleID:(id)a3 isNotInstalledInDomain:(unint64_t)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[MIAppReferenceManager defaultManager](&OBJC_CLASS___MIAppReferenceManager, "defaultManager"));
  id v9 = [v8 personaUniqueStringsForAppWithBundleID:v7 domain:a4 forUserWithID:sub_10000D79C() error:0];
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  id v11 = [v10 count];
  if (v11)
  {
    v12 = (void *)MIInstallerErrorDomain;
    uint64_t v13 = MIStringForInstallationDomain(a4);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v13);
    id v15 = sub_1000130F4( (uint64_t)"-[MIClientConnection _validateAppWithBundleID:isNotInstalledInDomain:error:]",  302LL,  v12,  189LL,  0LL,  0LL,  @"Found references (%@) for %@ in %@",  v14,  (uint64_t)v10);
    id v16 = (id)objc_claimAutoreleasedReturnValue(v15);

    if (a5)
    {
      id v16 = v16;
      *a5 = v16;
    }
  }

  else
  {
    id v16 = 0LL;
  }

  return v11 == 0LL;
}

- (void)_doInstallationForURL:(id)a3 identity:(id)a4 domain:(unint64_t)a5 options:(id)a6 operationType:(unint64_t)a7 completion:(id)a8
{
  id v42 = a3;
  id v41 = a4;
  id v13 = a6;
  id v39 = a8;
  v40 = (void *)objc_claimAutoreleasedReturnValue([v13 installTypeSummaryString]);
  id v14 = [v13 lsInstallType];
  uint64_t v15 = qword_100095BF8;
  if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v42 path]);
    uint64_t v17 = MIStringForInstallationDomain(a5);
    v37 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[MIClientConnection clientName](self, "clientName"));
    v35 = v40;
    id v36 = v14;
    v34 = v16;
    MOLogWrite(v15);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue( +[MIInstaller installerForURL:identity:domain:options:operationType:forClient:]( &OBJC_CLASS___MIInstaller,  "installerForURL:identity:domain:options:operationType:forClient:",  v42,  v41,  a5,  v13,  0LL,  self,  v34,  v35,  v36,  v37,  v38));
  v19 = v18;
  if (!v18)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue([v42 path]);
    id v26 = sub_1000130F4( (uint64_t)"-[MIClientConnection _doInstallationForURL:identity:domain:options:operationType:completion:]",  326LL,  MIInstallerErrorDomain,  4LL,  0LL,  &off_10008A610,  @"Failed to create installer for %@",  v25,  (uint64_t)v24);
    uint64_t v27 = objc_claimAutoreleasedReturnValue(v26);
LABEL_13:

    v23 = 0LL;
    v22 = 0LL;
    id v21 = (id)v27;
    goto LABEL_14;
  }

  id v48 = 0LL;
  unsigned int v20 = [v18 performInstallationWithError:&v48];
  id v21 = v48;
  if (!v20)
  {
    v23 = 0LL;
    v22 = 0LL;
    goto LABEL_14;
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue([v19 receipt]);
  if (!v22)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue([v42 path]);
    id v29 = sub_1000130F4( (uint64_t)"-[MIClientConnection _doInstallationForURL:identity:domain:options:operationType:completion:]",  336LL,  MIInstallerErrorDomain,  4LL,  0LL,  &off_10008A638,  @"Failed to get receipt after installing %@",  v28,  (uint64_t)v24);
    uint64_t v27 = objc_claimAutoreleasedReturnValue(v29);

    goto LABEL_13;
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue([v19 recordPromise]);
LABEL_14:

  -[MIClientConnection sendDelegateMessagesComplete](self, "sendDelegateMessagesComplete");
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472LL;
  v43[2] = sub_1000148CC;
  v43[3] = &unk_100081180;
  id v30 = v39;
  id v47 = v30;
  id v31 = v22;
  id v44 = v31;
  id v32 = v23;
  id v45 = v32;
  id v33 = v21;
  id v46 = v33;
  -[MIClientConnection _callBlockAfterDelegateMessagesSend:dispatchBlock:]( self,  "_callBlockAfterDelegateMessagesSend:dispatchBlock:",  "com.apple.installd.installation-for-url-complete",  v43);
}

- (void)installURL:(id)a3 identity:(id)a4 targetingDomain:(unint64_t)a5 options:(id)a6 returningResultInfo:(BOOL)a7 completion:(id)a8
{
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10001499C;
  v15[3] = &unk_1000811A8;
  id v16 = a8;
  BOOL v17 = a7;
  id v14 = v16;
  -[MIClientConnection _installURL:identity:targetingDomain:options:operationType:completion:]( self,  "_installURL:identity:targetingDomain:options:operationType:completion:",  a3,  a4,  a5,  a6,  0LL,  v15);
}

- (void)cancelUpdateForStagedUUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  if ((+[ICLFeatureFlags twoStageAppInstallEnabled]( &OBJC_CLASS___ICLFeatureFlags,  "twoStageAppInstallEnabled") & 1) != 0)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[MIJournal sharedInstance](&OBJC_CLASS___MIJournal, "sharedInstance"));
    id v10 = sub_100014CC8(self, @"InstallForInstallCoordination");
    id v11 = (id)objc_claimAutoreleasedReturnValue(v10);
    if (v11)
    {
LABEL_3:

      v12 = 0LL;
LABEL_4:
      v7[2](v7, 0LL, v11);
      goto LABEL_7;
    }

    id v14 = (void *)objc_claimAutoreleasedReturnValue([v9 journalEntryForUniqueIdentifier:v6]);
    id v16 = v14;
    if (!v14)
    {
      id v19 = sub_1000130F4( (uint64_t)"-[MIClientConnection cancelUpdateForStagedUUID:completion:]",  398LL,  MIInstallerErrorDomain,  218LL,  0LL,  0LL,  @"Failed to find matching journal entry for %@",  v15,  (uint64_t)v6);
      id v11 = (id)objc_claimAutoreleasedReturnValue(v19);
      goto LABEL_3;
    }

    BOOL v17 = (void *)objc_claimAutoreleasedReturnValue([v14 identity]);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v17 bundleID]);

    sub_10004D4EC(v12);
    id v20 = 0LL;
    unsigned int v18 = [v9 purgeJournalEntry:v16 withError:&v20];
    id v11 = v20;

    sub_10004D608(v12);
    if (!v18) {
      goto LABEL_4;
    }
    v7[2](v7, 1LL, 0LL);
  }

  else
  {
    id v13 = sub_1000130F4( (uint64_t)"-[MIClientConnection cancelUpdateForStagedUUID:completion:]",  375LL,  MIInstallerErrorDomain,  161LL,  0LL,  0LL,  @"%s is not enabled",  v8,  (uint64_t)"-[MIClientConnection cancelUpdateForStagedUUID:completion:]");
    id v11 = (id)objc_claimAutoreleasedReturnValue(v13);
    v7[2](v7, 0LL, v11);
    v12 = 0LL;
  }

- (void)registerPlaceholderForReference:(id)a3 completion:(id)a4
{
  id v5 = a3;
  v64 = (void (**)(id, void, uint64_t))a4;
  uint64_t v88 = 0LL;
  v89 = &v88;
  uint64_t v90 = 0x3032000000LL;
  v91 = sub_100015924;
  v92 = sub_100015934;
  id v93 = 0LL;
  uint64_t v82 = 0LL;
  v83 = &v82;
  uint64_t v84 = 0x3032000000LL;
  v85 = sub_100015924;
  v86 = sub_100015934;
  id v87 = 0LL;
  v65 = v5;
  v63 = (void *)objc_claimAutoreleasedReturnValue([v5 identity]);
  if ((+[ICLFeatureFlags appReferencesEnabled](&OBJC_CLASS___ICLFeatureFlags, "appReferencesEnabled") & 1) == 0)
  {
    id v36 = sub_1000130F4( (uint64_t)"-[MIClientConnection registerPlaceholderForReference:completion:]",  449LL,  MIInstallerErrorDomain,  161LL,  0LL,  0LL,  @"%s is not enabled",  v6,  (uint64_t)"-[MIClientConnection registerPlaceholderForReference:completion:]");
    uint64_t v37 = objc_claimAutoreleasedReturnValue(v36);
    v38 = (void *)v89[5];
    v89[5] = v37;

    id v22 = 0LL;
    v61 = 0LL;
    v62 = 0LL;
    id v34 = 0LL;
    uint64_t v15 = 0LL;
    id v7 = 0LL;
    id v29 = 0LL;
LABEL_27:
    v64[2](v64, 0LL, v89[5]);
    goto LABEL_28;
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v63 bundleID]);
  sub_10004D4E4(v7);
  id v8 = [v5 domain];
  id v9 = (id *)(v89 + 5);
  id obj = (id)v89[5];
  v62 = (void *)objc_claimAutoreleasedReturnValue( +[MIBundleContainer appBundleContainerForIdentifier:inDomain:withError:]( &OBJC_CLASS___MIBundleContainer,  "appBundleContainerForIdentifier:inDomain:withError:",  v7,  v8,  &obj));
  objc_storeStrong(v9, obj);
  if (!v62)
  {
    id v39 = sub_1000130F4( (uint64_t)"-[MIClientConnection registerPlaceholderForReference:completion:]",  459LL,  MIInstallerErrorDomain,  4LL,  (void *)v89[5],  0LL,  @"Failed to find bundle container when registering placeholder for %@",  v10,  (uint64_t)v5);
    uint64_t v40 = objc_claimAutoreleasedReturnValue(v39);
LABEL_21:
    id v42 = 0LL;
    v61 = 0LL;
    uint64_t v15 = 0LL;
    goto LABEL_22;
  }

  char v80 = 0;
  uint64_t v12 = objc_claimAutoreleasedReturnValue([v62 bundle]);
  if (!v12)
  {
    id v41 = sub_1000130F4( (uint64_t)"-[MIClientConnection registerPlaceholderForReference:completion:]",  466LL,  MIInstallerErrorDomain,  36LL,  0LL,  0LL,  @"Failed to find bundle in bundle container %@",  v11,  (uint64_t)v62);
    uint64_t v40 = objc_claimAutoreleasedReturnValue(v41);
    goto LABEL_21;
  }

  id v13 = (id *)(v89 + 5);
  id v79 = (id)v89[5];
  unsigned int v14 = [v63 resolvePersonaWithError:&v79];
  v61 = (void *)v12;
  objc_storeStrong(v13, v79);
  if (!v14)
  {
    id v42 = 0LL;
    uint64_t v15 = 0LL;
LABEL_25:
    id v29 = 0LL;
LABEL_26:
    id v34 = 0LL;
    id v22 = v42;
    v43 = (void *)objc_claimAutoreleasedReturnValue([v65 identity]);
    id v44 = (void *)objc_claimAutoreleasedReturnValue([v43 bundleID]);
    sub_10004D608(v44);

    goto LABEL_27;
  }

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v63 personaUniqueString]);
  id v16 = (id *)(v89 + 5);
  id v78 = (id)v89[5];
  BOOL v17 = (void *)objc_claimAutoreleasedReturnValue( +[MIDataContainer dataContainerForExecutableBundle:forPersona:createIfNeeded:temporary:created:error:]( &OBJC_CLASS___MIDataContainer,  "dataContainerForExecutableBundle:forPersona:createIfNeeded:temporary:created:error:",  v61,  v15,  1LL,  0LL,  &v80,  &v78));
  objc_storeStrong(v16, v78);

  if (!v17)
  {
    id v45 = sub_1000130F4( (uint64_t)"-[MIClientConnection registerPlaceholderForReference:completion:]",  476LL,  MIInstallerErrorDomain,  4LL,  (void *)v89[5],  0LL,  @"Failed to create data container when registering placeholder for %@",  v18,  (uint64_t)v65);
    uint64_t v40 = objc_claimAutoreleasedReturnValue(v45);
LABEL_32:
    id v42 = 0LL;
LABEL_22:
    id v22 = (id)v89[5];
    v89[5] = v40;
LABEL_23:

    goto LABEL_25;
  }

  id v19 = (id *)(v89 + 5);
  id v77 = (id)v89[5];
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v61 appExtensionBundlesWithError:&v77]);
  objc_storeStrong(v19, v77);
  if (!v20)
  {
    id v52 = sub_1000130F4( (uint64_t)"-[MIClientConnection registerPlaceholderForReference:completion:]",  482LL,  MIInstallerErrorDomain,  4LL,  (void *)v89[5],  0LL,  @"Failed to get app extensions when registering placeholder for %@",  v21,  (uint64_t)v65);
    uint64_t v40 = objc_claimAutoreleasedReturnValue(v52);
    goto LABEL_32;
  }

  __int128 v75 = 0u;
  __int128 v76 = 0u;
  __int128 v73 = 0u;
  __int128 v74 = 0u;
  id v22 = v20;
  id v23 = [v22 countByEnumeratingWithState:&v73 objects:v94 count:16];
  if (v23)
  {
    uint64_t v24 = *(void *)v74;
    while (2)
    {
      for (i = 0LL; i != v23; i = (char *)i + 1)
      {
        if (*(void *)v74 != v24) {
          objc_enumerationMutation(v22);
        }
        id v26 = *(void **)(*((void *)&v73 + 1) + 8LL * (void)i);
        uint64_t v27 = (id *)(v89 + 5);
        id v72 = (id)v89[5];
        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( [v26 dataContainerCreatingIfNeeded:1 forPersona:v15 makeLive:1 created:0 error:&v72]);
        objc_storeStrong(v27, v72);

        if (!v28)
        {
          id v46 = (void *)v89[5];
          id v47 = (void *)objc_claimAutoreleasedReturnValue([v26 identifier]);
          id v49 = sub_1000130F4( (uint64_t)"-[MIClientConnection registerPlaceholderForReference:completion:]",  488LL,  MIInstallerErrorDomain,  4LL,  v46,  0LL,  @"Failed to create data container for app extension %@ when registering placeholder for %@",  v48,  (uint64_t)v47);
          uint64_t v50 = objc_claimAutoreleasedReturnValue(v49);
          v51 = (void *)v89[5];
          v89[5] = v50;

          id v42 = v22;
          goto LABEL_23;
        }
      }

      id v23 = [v22 countByEnumeratingWithState:&v73 objects:v94 count:16];
      if (v23) {
        continue;
      }
      break;
    }
  }

  id v29 = [[MIInstalledInfoGatherer alloc] initWithBundleContainer:v62 forPersona:v15];
  id v30 = (id *)(v89 + 5);
  id v71 = (id)v89[5];
  v59 = (void *)objc_claimAutoreleasedReturnValue([v29 bundleRecordWithError:&v71]);
  objc_storeStrong(v30, v71);
  if (!v59)
  {
    id v42 = v22;
    goto LABEL_26;
  }

  [v59 setIsPlaceholder:1];
  v58 = (void *)objc_claimAutoreleasedReturnValue([v65 identity]);
  id v31 = (void *)objc_claimAutoreleasedReturnValue([v58 bundleID]);
  sub_10004D608(v31);

  id v32 = sub_10000D8B4();
  id v33 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v32);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001593C;
  block[3] = &unk_100080EA8;
  v69 = &v82;
  id v34 = v59;
  id v67 = v34;
  id v35 = v65;
  id v68 = v35;
  v70 = &v88;
  dispatch_sync(v33, block);

  if (!v83[5])
  {
    v60 = (void *)v89[5];
    v53 = (void *)objc_claimAutoreleasedReturnValue([v35 identity]);
    id v55 = sub_1000130F4( (uint64_t)"-[MIClientConnection registerPlaceholderForReference:completion:]",  513LL,  MIInstallerErrorDomain,  4LL,  v60,  0LL,  @"Failed to register installation record for %@",  v54,  (uint64_t)v53);
    uint64_t v56 = objc_claimAutoreleasedReturnValue(v55);
    v57 = (void *)v89[5];
    v89[5] = v56;

    goto LABEL_27;
  }

  v64[2](v64, v83[5], 0LL);
LABEL_28:

  _Block_object_dispose(&v82, 8);
  _Block_object_dispose(&v88, 8);
}

- (BOOL)_validateInstallRequestForURL:(id)a3 identity:(id)a4 targetingDomain:(unint64_t)a5 options:(id)a6 withError:(id *)a7
{
  id v12 = a3;
  id v13 = (MIAppIdentity *)a4;
  id v14 = a6;
  objc_opt_class(&OBJC_CLASS___NSURL);
  id v15 = v12;
  if ((objc_opt_isKindOfClass(v15) & 1) != 0) {
    id v16 = v15;
  }
  else {
    id v16 = 0LL;
  }

  if (!v16)
  {
    id v32 = sub_1000130F4( (uint64_t)"-[MIClientConnection _validateInstallRequestForURL:identity:targetingDomain:options:withError:]",  564LL,  MIInstallerErrorDomain,  25LL,  0LL,  &off_10008A660,  @"URL provided to install was not a URL or was nil",  v17,  v47);
LABEL_16:
    uint64_t v19 = objc_claimAutoreleasedReturnValue(v32);
LABEL_17:
    id v31 = (id)v19;
    goto LABEL_18;
  }

  id v18 = sub_100014CC8(self, @"InstallForInstallCoordination");
  uint64_t v19 = objc_claimAutoreleasedReturnValue(v18);
  if (v19) {
    goto LABEL_17;
  }
  if ([v14 allowLocalProvisioned])
  {
    id v20 = sub_100014CC8(self, @"InstallLocalProvisioned");
    uint64_t v19 = objc_claimAutoreleasedReturnValue(v20);
    if (v19) {
      goto LABEL_17;
    }
  }

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v14 linkedParentBundleID]);

  if (v21 && (sub_100015E74(self) & 1) == 0)
  {
    id v35 = (void *)MIInstallerErrorDomain;
    id v36 = (void *)objc_claimAutoreleasedReturnValue(-[MIClientConnection clientName](self, "clientName"));
    id v38 = sub_1000130F4( (uint64_t)"-[MIClientConnection _validateInstallRequestForURL:identity:targetingDomain:options:withError:]",  585LL,  v35,  2LL,  0LL,  &off_10008A688,  @"Process %@ tried to set an install option %@, but that option may only be passed from callers originating through InstallCoordination SPI.",  v37,  (uint64_t)v36);
    id v31 = (id)objc_claimAutoreleasedReturnValue(v38);

    goto LABEL_18;
  }

  if ((MIIsValidInstallationDomain(a5) & 1) == 0)
  {
    id v32 = sub_1000130F4( (uint64_t)"-[MIClientConnection _validateInstallRequestForURL:identity:targetingDomain:options:withError:]",  599LL,  MIInstallerErrorDomain,  25LL,  0LL,  0LL,  @"Installation domain provided was not valid: %lu",  v22,  a5);
    goto LABEL_16;
  }

  id v23 = (void *)objc_claimAutoreleasedReturnValue([v14 bundleIdentifier]);

  if (!v23)
  {
    id v39 = (void *)MIInstallerErrorDomain;
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v15 path]);
    id v41 = sub_1000130F4( (uint64_t)"-[MIClientConnection _validateInstallRequestForURL:identity:targetingDomain:options:withError:]",  604LL,  v39,  25LL,  0LL,  0LL,  @"Install options did not specify a bundle identifier for the install of %@",  v40,  (uint64_t)v28);
    id v31 = (id)objc_claimAutoreleasedReturnValue(v41);
    goto LABEL_25;
  }

  if (!v13)
  {
    id v42 = objc_alloc(&OBJC_CLASS___MIAppIdentity);
    v43 = (void *)objc_claimAutoreleasedReturnValue([v14 bundleIdentifier]);
    id v13 = -[MIAppIdentity initWithBundleID:](v42, "initWithBundleID:", v43);

LABEL_27:
    if (+[ICLFeatureFlags appReferencesEnabled](&OBJC_CLASS___ICLFeatureFlags, "appReferencesEnabled"))
    {
      if (a5 == 3) {
        uint64_t v44 = 2LL;
      }
      else {
        uint64_t v44 = 3LL;
      }
      id v45 = (void *)objc_claimAutoreleasedReturnValue(-[MIAppIdentity bundleID](v13, "bundleID"));
      id v49 = 0LL;
      unsigned __int8 v46 = -[MIClientConnection _validateAppWithBundleID:isNotInstalledInDomain:error:]( self,  "_validateAppWithBundleID:isNotInstalledInDomain:error:",  v45,  v44,  &v49);
      id v31 = v49;

      if ((v46 & 1) == 0) {
        goto LABEL_18;
      }
    }

    else
    {
      id v31 = 0LL;
    }

    BOOL v33 = 1;
    goto LABEL_21;
  }

  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[MIAppIdentity bundleID](v13, "bundleID"));
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v14 bundleIdentifier]);
  unsigned __int8 v26 = [v24 isEqualToString:v25];

  if ((v26 & 1) != 0) {
    goto LABEL_27;
  }
  uint64_t v27 = (void *)MIInstallerErrorDomain;
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v14 bundleIdentifier]);
  uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue(-[MIAppIdentity bundleID](v13, "bundleID"));
  id v30 = sub_1000130F4( (uint64_t)"-[MIClientConnection _validateInstallRequestForURL:identity:targetingDomain:options:withError:]",  609LL,  v27,  25LL,  0LL,  0LL,  @"Bundle identifier in install options (%@) did not match the one in application identity (%@)",  v29,  (uint64_t)v28);
  id v31 = (id)objc_claimAutoreleasedReturnValue(v30);

LABEL_25:
LABEL_18:
  if (a7)
  {
    id v31 = v31;
    BOOL v33 = 0;
    *a7 = v31;
  }

  else
  {
    BOOL v33 = 0;
  }

- (void)_installURL:(id)a3 identity:(id)a4 targetingDomain:(unint64_t)a5 options:(id)a6 operationType:(unint64_t)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a8;
  id v18 = sub_100016170();
  uint64_t v19 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(v18);
  v35[0] = 0LL;
  unsigned __int8 v20 = -[MIClientConnection _validateInstallRequestForURL:identity:targetingDomain:options:withError:]( self,  "_validateInstallRequestForURL:identity:targetingDomain:options:withError:",  v14,  v15,  a5,  v16,  v35);
  id v21 = v35[0];
  if ((v20 & 1) != 0)
  {
    id v22 = sub_1000161B0((int)[v16 isUserInitiated]);
    id v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    dispatch_semaphore_wait(v19, 0xFFFFFFFFFFFFFFFFLL);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_100016290;
    v27[3] = &unk_1000811D0;
    v27[4] = self;
    id v28 = v14;
    id v29 = v15;
    unint64_t v33 = a5;
    id v30 = v16;
    unint64_t v34 = a7;
    id v32 = v17;
    id v31 = v19;
    MIRunTransactionalTask(v23, "com.apple.installd.install-url", v27);
  }

  else
  {
    -[MIClientConnection sendDelegateMessagesComplete](self, "sendDelegateMessagesComplete");
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_1000162C8;
    v24[3] = &unk_100081158;
    id v26 = v17;
    id v25 = v21;
    -[MIClientConnection _callBlockAfterDelegateMessagesSend:dispatchBlock:]( self,  "_callBlockAfterDelegateMessagesSend:dispatchBlock:",  "com.apple.installd.install-url-error",  v24);

    id v23 = v26;
  }
}

- (void)_stageURL:(id)a3 identity:(id)a4 domain:(unint64_t)a5 options:(id)a6 completion:(id)a7
{
  id v40 = a3;
  id v38 = a4;
  id v11 = a6;
  id v37 = a7;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 installTypeSummaryString]);
  id v13 = [v11 lsInstallType];
  uint64_t v14 = qword_100095BF8;
  if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v40 path]);
    uint64_t v16 = MIStringForInstallationDomain(a5);
    id v35 = (void *)objc_claimAutoreleasedReturnValue(v16);
    id v36 = (void *)objc_claimAutoreleasedReturnValue(-[MIClientConnection clientName](self, "clientName"));
    unint64_t v33 = v12;
    id v34 = v13;
    id v32 = v15;
    MOLogWrite(v14);
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[MIInstaller installerForURL:identity:domain:options:operationType:forClient:]( &OBJC_CLASS___MIInstaller,  "installerForURL:identity:domain:options:operationType:forClient:",  v40,  v38,  a5,  v11,  1LL,  self,  v32,  v33,  v34,  v35,  v36));
  id v18 = v17;
  if (!v17)
  {
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v40 path]);
    id v24 = sub_1000130F4( (uint64_t)"-[MIClientConnection _stageURL:identity:domain:options:completion:]",  730LL,  MIInstallerErrorDomain,  4LL,  0LL,  &off_10008A6B0,  @"Failed to create installer for %@",  v23,  (uint64_t)v22);
    uint64_t v25 = objc_claimAutoreleasedReturnValue(v24);
LABEL_13:

    uint64_t v21 = 0LL;
    id v20 = (id)v25;
    goto LABEL_14;
  }

  id v45 = 0LL;
  unsigned int v19 = [v17 performInstallationWithError:&v45];
  id v20 = v45;
  if (!v19)
  {
    uint64_t v21 = 0LL;
    goto LABEL_14;
  }

  uint64_t v21 = objc_claimAutoreleasedReturnValue([v18 stagedJournalEntryUniqueID]);
  if (!v21)
  {
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v40 path]);
    id v27 = sub_1000130F4( (uint64_t)"-[MIClientConnection _stageURL:identity:domain:options:completion:]",  740LL,  MIInstallerErrorDomain,  4LL,  0LL,  &off_10008A6D8,  @"Failed to get receipt after installing %@",  v26,  (uint64_t)v22);
    uint64_t v25 = objc_claimAutoreleasedReturnValue(v27);

    goto LABEL_13;
  }

- (void)stageInstallURL:(id)a3 identity:(id)a4 targetingDomain:(unint64_t)a5 withOptions:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  id v16 = sub_100016170();
  id v17 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(v16);
  if ((+[ICLFeatureFlags twoStageAppInstallEnabled]( &OBJC_CLASS___ICLFeatureFlags,  "twoStageAppInstallEnabled") & 1) != 0)
  {
    v34[0] = 0LL;
    unsigned __int8 v19 = -[MIClientConnection _validateInstallRequestForURL:identity:targetingDomain:options:withError:]( self,  "_validateInstallRequestForURL:identity:targetingDomain:options:withError:",  v12,  v13,  a5,  v14,  v34);
    id v20 = v34[0];
    if ((v19 & 1) != 0)
    {
      id v21 = sub_1000161B0((int)[v14 isUserInitiated]);
      id v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      dispatch_semaphore_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472LL;
      v27[2] = sub_100016A40;
      v27[3] = &unk_100081220;
      v27[4] = self;
      id v28 = v12;
      id v29 = v13;
      unint64_t v33 = a5;
      id v30 = v14;
      id v32 = v15;
      id v31 = v17;
      MIRunTransactionalTask(v22, "com.apple.installd.staging-url", v27);
    }

    else
    {
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472LL;
      v24[2] = sub_100016A74;
      v24[3] = &unk_100081158;
      id v26 = v15;
      id v25 = v20;
      -[MIClientConnection _callBlockAfterDelegateMessagesSend:dispatchBlock:]( self,  "_callBlockAfterDelegateMessagesSend:dispatchBlock:",  "com.apple.installd.staging-url-error",  v24);

      id v22 = v26;
    }
  }

  else
  {
    id v23 = sub_1000130F4( (uint64_t)"-[MIClientConnection stageInstallURL:identity:targetingDomain:withOptions:completion:]",  766LL,  MIInstallerErrorDomain,  161LL,  0LL,  0LL,  @"%s is not enabled",  v18,  (uint64_t)"-[MIClientConnection stageInstallURL:identity:targetingDomain:withOptions:completion:]");
    id v20 = (id)objc_claimAutoreleasedReturnValue(v23);
    (*((void (**)(id, void, id))v15 + 2))(v15, 0LL, v20);
  }
}

- (void)_finalizeStagedUpdateForUUID:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v41 = a4;
  id v43 = v5;
  id v40 = (void *)objc_claimAutoreleasedReturnValue(+[MIJournal sharedInstance](&OBJC_CLASS___MIJournal, "sharedInstance"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v40 journalEntryForUniqueIdentifier:v5]);
  id v8 = v6;
  if (!v6)
  {
    id v25 = sub_1000130F4( (uint64_t)"-[MIClientConnection _finalizeStagedUpdateForUUID:completion:]",  827LL,  MIInstallerErrorDomain,  218LL,  0LL,  0LL,  @"Failed to find matching journal entry for %@",  v7,  (uint64_t)v5);
    uint64_t v26 = objc_claimAutoreleasedReturnValue(v25);
    uint64_t v24 = 0LL;
    uint64_t v18 = 0LL;
    id v23 = 0LL;
    uint64_t v10 = 0LL;
LABEL_13:
    id v21 = (id)v26;
    goto LABEL_16;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 installOptions]);
  uint64_t v10 = v9;
  uint64_t v11 = qword_100095BF8;
  if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 installTypeSummaryString]);
    id v13 = [v10 lsInstallType];
    uint64_t v14 = MIStringForInstallationDomain([v8 installationDomain]);
    id v38 = (void *)objc_claimAutoreleasedReturnValue(v14);
    id v39 = (void *)objc_claimAutoreleasedReturnValue(-[MIClientConnection clientName](self, "clientName"));
    id v36 = v12;
    id v37 = v13;
    id v35 = v43;
    MOLogWrite(v11);
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identity", v35, v36, v37, v38, v39));
  id v16 = [v8 installationDomain];
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v8 installOptions]);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[MIInstaller installerForURL:identity:domain:options:operationType:forClient:]( &OBJC_CLASS___MIInstaller,  "installerForURL:identity:domain:options:operationType:forClient:",  0LL,  v15,  v16,  v17,  2LL,  self));

  if (!v18)
  {
    id v27 = sub_1000130F4( (uint64_t)"-[MIClientConnection _finalizeStagedUpdateForUUID:completion:]",  836LL,  MIInstallerErrorDomain,  4LL,  0LL,  &off_10008A700,  @"Failed to create installer for installing staged update %@",  v19,  (uint64_t)v43);
    uint64_t v26 = objc_claimAutoreleasedReturnValue(v27);
    uint64_t v24 = 0LL;
    uint64_t v18 = 0LL;
    id v23 = 0LL;
    goto LABEL_13;
  }

  id v49 = 0LL;
  unsigned int v20 = [v18 applyStagedUpdateForUUID:v43 withError:&v49];
  id v21 = v49;
  if (v20)
  {
    id v23 = (void *)objc_claimAutoreleasedReturnValue([v18 receipt]);
    if (v23)
    {
      uint64_t v24 = objc_claimAutoreleasedReturnValue([v18 recordPromise]);
    }

    else
    {
      id v28 = sub_1000130F4( (uint64_t)"-[MIClientConnection _finalizeStagedUpdateForUUID:completion:]",  846LL,  MIInstallerErrorDomain,  4LL,  0LL,  &off_10008A728,  @"Failed to get receipt after installing staged update %@",  v22,  (uint64_t)v43);
      uint64_t v29 = objc_claimAutoreleasedReturnValue(v28);

      uint64_t v24 = 0LL;
      id v23 = 0LL;
      id v21 = (id)v29;
    }
  }

  else
  {
    uint64_t v24 = 0LL;
    id v23 = 0LL;
  }

- (void)finalizeStagedInstallForUUID:(id)a3 returningResultInfo:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ((+[ICLFeatureFlags twoStageAppInstallEnabled]( &OBJC_CLASS___ICLFeatureFlags,  "twoStageAppInstallEnabled") & 1) != 0)
  {
    id v11 = sub_100016170();
    id v12 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(v11);
    id v13 = sub_100014CC8(self, @"InstallForInstallCoordination");
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    if (v14)
    {
      -[MIClientConnection sendDelegateMessagesComplete](self, "sendDelegateMessagesComplete");
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = sub_10001739C;
      v18[3] = &unk_100081158;
      id v20 = v9;
      id v19 = v14;
      -[MIClientConnection _callBlockAfterDelegateMessagesSend:dispatchBlock:]( self,  "_callBlockAfterDelegateMessagesSend:dispatchBlock:",  "com.apple.installd.installation-for-staged-update",  v18);

      id v15 = v20;
    }

    else
    {
      id v17 = sub_1000161B0(0);
      id v15 = (void *)objc_claimAutoreleasedReturnValue(v17);
      dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472LL;
      v21[2] = sub_1000172F0;
      v21[3] = &unk_100081248;
      v21[4] = self;
      id v22 = v8;
      id v24 = v9;
      BOOL v25 = a4;
      id v23 = v12;
      MIRunTransactionalTask(v15, "com.apple.installd.installation-for-staged-update", v21);
    }
  }

  else
  {
    id v16 = sub_1000130F4( (uint64_t)"-[MIClientConnection finalizeStagedInstallForUUID:returningResultInfo:completion:]",  875LL,  MIInstallerErrorDomain,  161LL,  0LL,  0LL,  @"%s is not enabled",  v10,  (uint64_t)"-[MIClientConnection finalizeStagedInstallForUUID:returningResultInfo:completion:]");
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v16);
    (*((void (**)(id, void, void, void, void *))v9 + 2))(v9, 0LL, 0LL, 0LL, v14);
  }
}

- (void)revertIdentity:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  void v9[2] = sub_100017448;
  v9[3] = &unk_100081270;
  id v10 = a5;
  id v8 = v10;
  -[MIClientConnection revertForIXWithIdentity:withOptions:completion:]( self,  "revertForIXWithIdentity:withOptions:completion:",  a3,  a4,  v9);
}

- (void)revertForIXWithIdentity:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v36 = (void *)objc_claimAutoreleasedReturnValue([v8 bundleID]);
  id v11 = sub_100014CC8(self, @"RevertForInstallCoordination");
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  if (v12)
  {
    id v13 = 0LL;
    uint64_t v14 = 0LL;
    id v15 = 0LL;
    goto LABEL_22;
  }

  if (v9)
  {
    objc_opt_class(&OBJC_CLASS___NSDictionary);
    id v16 = v9;
    id v17 = (objc_opt_isKindOfClass(v16) & 1) != 0 ? v16 : 0LL;

    if (!v17)
    {
      uint64_t v14 = 0LL;
      id v28 = sub_1000130F4( (uint64_t)"-[MIClientConnection revertForIXWithIdentity:withOptions:completion:]",  960LL,  MIInstallerErrorDomain,  25LL,  0LL,  &off_10008A750,  @"Options provided was not a dictionary",  v18,  v33);
      uint64_t v27 = objc_claimAutoreleasedReturnValue(v28);
      goto LABEL_21;
    }
  }

  objc_opt_class(&OBJC_CLASS___NSString);
  id v19 = v36;
  if ((objc_opt_isKindOfClass(v19) & 1) != 0) {
    id v20 = v19;
  }
  else {
    id v20 = 0LL;
  }

  if (!v20)
  {
    uint64_t v14 = 0LL;
    id v26 = sub_1000130F4( (uint64_t)"-[MIClientConnection revertForIXWithIdentity:withOptions:completion:]",  965LL,  MIInstallerErrorDomain,  25LL,  0LL,  0LL,  @"Identifier provided to revert was not a string or was nil",  v21,  v33);
    uint64_t v27 = objc_claimAutoreleasedReturnValue(v26);
LABEL_21:
    id v12 = (void *)v27;
    id v13 = 0LL;
    id v15 = 0LL;
    goto LABEL_22;
  }

  uint64_t v22 = qword_100095BF8;
  if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5)
  {
    id v34 = (void *)objc_claimAutoreleasedReturnValue(-[MIClientConnection clientName](self, "clientName"));
    id v35 = v9;
    uint64_t v33 = (uint64_t)v19;
    MOLogWrite(v22);
  }

  id v23 = (void *)objc_claimAutoreleasedReturnValue( +[MIReverter reverterForAppIdentity:withOptions:forClient:]( &OBJC_CLASS___MIReverter,  "reverterForAppIdentity:withOptions:forClient:",  v8,  v9,  self,  v33,  v34,  v35));
  id v42 = 0LL;
  unsigned int v24 = [v23 performRevertWithError:&v42];
  id v25 = v42;
  if (v24)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v23 receipt]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v23 recordPromise]);
  }

  else
  {
    id v13 = 0LL;
    id v15 = 0LL;
  }

  id v12 = v25;
  uint64_t v14 = v23;
LABEL_22:

  -[MIClientConnection sendDelegateMessagesComplete](self, "sendDelegateMessagesComplete");
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472LL;
  v37[2] = sub_1000178B0;
  v37[3] = &unk_100081180;
  id v29 = v10;
  id v41 = v29;
  id v30 = v15;
  id v38 = v30;
  id v31 = v13;
  id v39 = v31;
  id v32 = v12;
  id v40 = v32;
  -[MIClientConnection _callBlockAfterDelegateMessagesSend:dispatchBlock:]( self,  "_callBlockAfterDelegateMessagesSend:dispatchBlock:",  "com.apple.installd.revert-complete",  v37);
}

- (void)uninstallIdentifiers:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v11 = v7;
  id v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      id v15 = 0LL;
      do
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = -[MIAppIdentity initWithBundleID:persona:]( objc_alloc(&OBJC_CLASS___MIAppIdentity),  "initWithBundleID:persona:",  *(void *)(*((void *)&v19 + 1) + 8LL * (void)v15),  @"PersonalPersonaPlaceholderString");
        -[NSMutableArray addObject:](v10, "addObject:", v16);

        id v15 = (char *)v15 + 1;
      }

      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v13);
  }

  id v17 = -[NSMutableArray copy](v10, "copy");
  -[MIClientConnection _uninstallIdentities:withOptions:completion:]( self,  "_uninstallIdentities:withOptions:completion:",  v17,  v8,  v9);
}

- (void)_uninstallIdentities:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sub_100014CC8(self, @"UninstallForInstallCoordination");
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  if (!v12)
  {
    objc_opt_class(&OBJC_CLASS___NSArray);
    id v15 = v8;
    if ((objc_opt_isKindOfClass(v15) & 1) != 0)
    {
      if (v15)
      {
        objc_opt_class(&OBJC_CLASS___MIAppIdentity);
        int v17 = sub_100013434(v15);

        if (v17)
        {
          if (!v9
            || ((objc_opt_class(&OBJC_CLASS___NSDictionary),
                 id v18 = v9,
                 (objc_opt_isKindOfClass(v18) & 1) == 0)
              ? (id v19 = 0LL)
              : (id v19 = v18),
                v18,
                v19,
                v19))
          {
            id v28 = [v15 count];
            uint64_t v29 = qword_100095BF8;
            if (v28 == (id)1)
            {
              id v30 = (void *)objc_claimAutoreleasedReturnValue(-[MIClientConnection clientName](self, "clientName"));
              id v39 = (void *)objc_claimAutoreleasedReturnValue([v15 objectAtIndexedSubscript:0]);
              id v40 = v9;
              uint64_t v38 = (uint64_t)v30;
              MOLogWrite(v29);
            }

            else
            {
              id v30 = (void *)objc_claimAutoreleasedReturnValue(-[MIClientConnection clientName](self, "clientName"));
              id v39 = v15;
              id v40 = v9;
              uint64_t v38 = (uint64_t)v30;
              MOLogWrite(v29);
            }

LABEL_25:
            id v31 = (void *)objc_claimAutoreleasedReturnValue( +[MIUninstaller uninstallerForIdentities:withOptions:forClient:]( &OBJC_CLASS___MIUninstaller,  "uninstallerForIdentities:withOptions:forClient:",  v15,  v9,  self,  v38,  v39,  v40));
            id v13 = v31;
            if (v31)
            {
              id v45 = 0LL;
              unsigned int v33 = [v31 performUninstallationWithError:&v45];
              id v34 = v45;
              if (v33)
              {
                uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 receipt]);
                if (!v14)
                {
                  id v37 = sub_1000130F4( (uint64_t)"-[MIClientConnection _uninstallIdentities:withOptions:completion:]",  1051LL,  MIInstallerErrorDomain,  4LL,  0LL,  &off_10008A7F0,  @"Failed to get receipt after uninstalling %@",  v35,  (uint64_t)v15);
                  id v12 = (void *)objc_claimAutoreleasedReturnValue(v37);

                  goto LABEL_3;
                }

                if (qword_100095BF8 && *(int *)(qword_100095BF8 + 44) >= 7)
                {
                  MOLogWrite(qword_100095BF8);
                  id v12 = v34;
                  goto LABEL_14;
                }
              }

              else
              {
                uint64_t v14 = 0LL;
              }

              id v12 = v34;
              goto LABEL_14;
            }

            id v36 = sub_1000130F4( (uint64_t)"-[MIClientConnection _uninstallIdentities:withOptions:completion:]",  1041LL,  MIInstallerErrorDomain,  4LL,  0LL,  &off_10008A7C8,  @"Failed to create uninstaller for %@",  v32,  (uint64_t)v15);
            uint64_t v24 = objc_claimAutoreleasedReturnValue(v36);
LABEL_13:
            id v12 = (void *)v24;
            id v13 = 0LL;
            uint64_t v14 = 0LL;
            goto LABEL_14;
          }

          __int128 v20 = @"Options provided was not a dictionary";
          uint64_t v21 = 1029LL;
          __int128 v22 = &off_10008A7A0;
LABEL_12:
          id v23 = sub_1000130F4( (uint64_t)"-[MIClientConnection _uninstallIdentities:withOptions:completion:]",  v21,  MIInstallerErrorDomain,  25LL,  0LL,  v22,  v20,  v16,  v38);
          uint64_t v24 = objc_claimAutoreleasedReturnValue(v23);
          goto LABEL_13;
        }
      }
    }

    else
    {
    }

    __int128 v20 = @"Identifers provided was not an array of strings";
    uint64_t v21 = 1024LL;
    __int128 v22 = &off_10008A778;
    goto LABEL_12;
  }

  id v13 = 0LL;
LABEL_3:
  uint64_t v14 = 0LL;
LABEL_14:

  -[MIClientConnection sendDelegateMessagesComplete](self, "sendDelegateMessagesComplete");
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472LL;
  v41[2] = sub_100017FC8;
  v41[3] = &unk_1000811F8;
  id v25 = v10;
  id v44 = v25;
  id v26 = v14;
  id v42 = v26;
  id v27 = v12;
  id v43 = v27;
  -[MIClientConnection _callBlockAfterDelegateMessagesSend:dispatchBlock:]( self,  "_callBlockAfterDelegateMessagesSend:dispatchBlock:",  "com.apple.installd.uninstall-identifiers-complete",  v41);
}

- (void)uninstallIdentity:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v15 = a3;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v15, 1LL));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000180E4;
  v13[3] = &unk_100081298;
  id v14 = v8;
  id v12 = v8;
  -[MIClientConnection _uninstallIdentities:withOptions:completion:]( self,  "_uninstallIdentities:withOptions:completion:",  v11,  v9,  v13);
}

- (void)lookupUninstalledWithOptions:(id)a3 completion:(id)a4
{
  id v19 = a3;
  uint64_t v6 = (void (**)(id, void *, void *))a4;
  id v7 = sub_100014CC8(self, @"LookupUninstalled");
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if (v8) {
    goto LABEL_18;
  }
  if (v19)
  {
    objc_opt_class(&OBJC_CLASS___NSDictionary);
    id v9 = v19;
    id v10 = (objc_opt_isKindOfClass(v9) & 1) != 0 ? v9 : 0LL;

    if (!v10)
    {
      id v16 = sub_1000130F4( (uint64_t)"-[MIClientConnection lookupUninstalledWithOptions:completion:]",  1094LL,  MIInstallerErrorDomain,  25LL,  0LL,  0LL,  @"Options provided was not a dictionary",  v11,  (uint64_t)v17);
      uint64_t v15 = objc_claimAutoreleasedReturnValue(v16);
LABEL_17:
      id v8 = (void *)v15;
LABEL_18:
      id v14 = 0LL;
      goto LABEL_19;
    }
  }

  uint64_t v12 = qword_100095BF8;
  if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5)
  {
    int v17 = (void *)objc_claimAutoreleasedReturnValue(-[MIClientConnection clientName](self, "clientName"));
    id v18 = v19;
    MOLogWrite(v12);
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[MIUninstalledAppList sharedList](&OBJC_CLASS___MIUninstalledAppList, "sharedList", v17, v18));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 uninstalledDictionary]);

  if (!v14)
  {
    uint64_t v15 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  MIInstallerErrorDomain,  1LL,  &off_10008A818));
    goto LABEL_17;
  }

  id v8 = 0LL;
LABEL_19:
  v6[2](v6, v14, v8);
}

- (void)clearUninstalledIdentifiers:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  id v25 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void *))a5;
  id v10 = sub_100014CC8(self, @"ClearUninstalled");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  if (v11) {
    goto LABEL_18;
  }
  if (v8)
  {
    objc_opt_class(&OBJC_CLASS___NSDictionary);
    id v12 = v8;
    id v13 = (objc_opt_isKindOfClass(v12) & 1) != 0 ? v12 : 0LL;

    if (!v13)
    {
      id v19 = @"Options provided was not a dictionary";
      uint64_t v20 = 1131LL;
      goto LABEL_17;
    }
  }

  objc_opt_class(&OBJC_CLASS___NSArray);
  id v15 = v25;
  if ((objc_opt_isKindOfClass(v15) & 1) == 0)
  {

LABEL_15:
    id v19 = @"Identifers provided was not an array of strings";
    uint64_t v20 = 1136LL;
LABEL_17:
    id v21 = sub_1000130F4( (uint64_t)"-[MIClientConnection clearUninstalledIdentifiers:withOptions:completion:]",  v20,  MIInstallerErrorDomain,  25LL,  0LL,  0LL,  v19,  v14,  (uint64_t)v22);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v21);
    goto LABEL_18;
  }

  if (!v15) {
    goto LABEL_15;
  }
  objc_opt_class(&OBJC_CLASS___NSString);
  char v16 = sub_100013434(v15);

  if ((v16 & 1) == 0) {
    goto LABEL_15;
  }
  uint64_t v17 = qword_100095BF8;
  if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5)
  {
    id v23 = v8;
    id v24 = v15;
    __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(-[MIClientConnection clientName](self, "clientName"));
    MOLogWrite(v17);
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue(+[MIUninstalledAppList sharedList](&OBJC_CLASS___MIUninstalledAppList, "sharedList", v22, v23, v24));
  [v18 removeIdentifiers:v15];

  uint64_t v11 = 0LL;
LABEL_18:
  v9[2](v9, v11);
}

- (void)lookupSystemAppStateWithOptions:(id)a3 completion:(id)a4
{
  id v21 = a3;
  uint64_t v6 = (void (**)(id, void *, void *))a4;
  id v7 = sub_100014CC8(self, @"LookupSystemAppState");
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if (v8) {
    goto LABEL_18;
  }
  if (v21)
  {
    objc_opt_class(&OBJC_CLASS___NSDictionary);
    id v9 = v21;
    id v10 = (objc_opt_isKindOfClass(v9) & 1) != 0 ? v9 : 0LL;

    if (!v10)
    {
      id v18 = sub_1000130F4( (uint64_t)"-[MIClientConnection lookupSystemAppStateWithOptions:completion:]",  1171LL,  MIInstallerErrorDomain,  25LL,  0LL,  0LL,  @"Options provided was not a dictionary",  v11,  (uint64_t)v19);
      uint64_t v17 = objc_claimAutoreleasedReturnValue(v18);
LABEL_17:
      id v8 = (void *)v17;
LABEL_18:
      char v16 = 0LL;
      goto LABEL_19;
    }
  }

  uint64_t v12 = qword_100095BF8;
  if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5)
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[MIClientConnection clientName](self, "clientName"));
    id v20 = v21;
    MOLogWrite(v12);
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[MISystemAppState sharedList](&OBJC_CLASS___MISystemAppState, "sharedList", v19, v20));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:@"RestoreBackupAppState"]);
  id v15 = objc_msgSend(v13, "systemAppStateDictionaryRestoringBackedUpState:", sub_1000133E0(v14, 0));
  char v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

  if (!v16)
  {
    uint64_t v17 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  MIInstallerErrorDomain,  1LL,  &off_10008A840));
    goto LABEL_17;
  }

  id v8 = 0LL;
LABEL_19:
  v6[2](v6, v16, v8);
}

- (void)updateSystemAppStateForIdentifier:(id)a3 appState:(int)a4 completion:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = (void (**)(id, void *))a5;
  id v10 = sub_100014CC8(self, @"UpdateSystemAppState");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  if (!v11)
  {
    objc_opt_class(&OBJC_CLASS___NSString);
    id v12 = v8;
    if ((objc_opt_isKindOfClass(v12) & 1) != 0) {
      id v13 = v12;
    }
    else {
      id v13 = 0LL;
    }

    if (!v13)
    {
      id v17 = sub_1000130F4( (uint64_t)"-[MIClientConnection updateSystemAppStateForIdentifier:appState:completion:]",  1209LL,  MIInstallerErrorDomain,  25LL,  0LL,  0LL,  @"bundleID parameter was not a string",  v14,  v22);
      uint64_t v16 = objc_claimAutoreleasedReturnValue(v17);
      goto LABEL_9;
    }

    if (v6 >= 7)
    {
      id v15 = sub_1000130F4( (uint64_t)"-[MIClientConnection updateSystemAppStateForIdentifier:appState:completion:]",  1214LL,  MIInstallerErrorDomain,  25LL,  0LL,  0LL,  @"Unknown value for appState key : %lu",  v14,  v6);
      uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
LABEL_9:
      uint64_t v11 = (void *)v16;
      goto LABEL_10;
    }

    uint64_t v18 = qword_100095BF8;
    if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5)
    {
      id v23 = (void *)objc_claimAutoreleasedReturnValue(-[MIClientConnection clientName](self, "clientName"));
      MOLogWrite(v18);
    }

    if ((_DWORD)v6)
    {
      id v19 = (void *)objc_claimAutoreleasedReturnValue(+[MISystemAppState sharedList](&OBJC_CLASS___MISystemAppState, "sharedList"));
      [v19 addIdentifier:v12 withState:v6];
    }

    else
    {
      id v20 = (void *)objc_claimAutoreleasedReturnValue(+[MISystemAppState sharedList](&OBJC_CLASS___MISystemAppState, "sharedList"));
      id v24 = v12;
      id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v24, 1LL));
      [v20 removeIdentifiers:v21];
    }

    uint64_t v11 = 0LL;
  }

- (void)registerContentsForDiskImageAtURL:(id)a3 completion:(id)a4
{
  id v17 = a3;
  uint64_t v6 = (void (**)(id, void *))a4;
  if ((sub_100015E74(self) & 1) != 0)
  {
    objc_opt_class(&OBJC_CLASS___NSURL);
    id v7 = v17;
    if ((objc_opt_isKindOfClass(v7) & 1) != 0) {
      id v8 = v7;
    }
    else {
      id v8 = 0LL;
    }

    if (v8)
    {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[MIDiskImageManager sharedInstance](&OBJC_CLASS___MIDiskImageManager, "sharedInstance"));
      [v14 registerContentsAtMountPoint:v7 completion:v6];

      id v12 = 0LL;
    }

    else
    {
      id v15 = sub_1000130F4( (uint64_t)"-[MIClientConnection registerContentsForDiskImageAtURL:completion:]",  1254LL,  MIInstallerErrorDomain,  25LL,  0LL,  0LL,  @"Disk image path for registering contents was not a URL.",  v13,  v16);
      id v12 = (void *)objc_claimAutoreleasedReturnValue(v15);
      v6[2](v6, v12);
    }
  }

  else
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MIClientConnection clientName](self, "clientName"));
    id v11 = sub_1000130F4( (uint64_t)"-[MIClientConnection registerContentsForDiskImageAtURL:completion:]",  1248LL,  MIInstallerErrorDomain,  2LL,  0LL,  &off_10008A868,  @"Process %@ tried to register disk image, but disk registration can only be done by InstallCoordination.",  v10,  (uint64_t)v9);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

    v6[2](v6, v12);
  }
}

- (void)unregisterContentsForDiskImageAtURL:(id)a3 completion:(id)a4
{
  id v17 = a3;
  uint64_t v6 = (void (**)(id, void *))a4;
  if ((sub_100015E74(self) & 1) != 0)
  {
    objc_opt_class(&OBJC_CLASS___NSURL);
    id v7 = v17;
    if ((objc_opt_isKindOfClass(v7) & 1) != 0) {
      id v8 = v7;
    }
    else {
      id v8 = 0LL;
    }

    if (v8)
    {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[MIDiskImageManager sharedInstance](&OBJC_CLASS___MIDiskImageManager, "sharedInstance"));
      [v14 unregisterContentsAtMountPoint:v7 completion:v6];

      id v12 = 0LL;
    }

    else
    {
      id v15 = sub_1000130F4( (uint64_t)"-[MIClientConnection unregisterContentsForDiskImageAtURL:completion:]",  1285LL,  MIInstallerErrorDomain,  25LL,  0LL,  0LL,  @"Disk image path for unregistering content was not a URL.",  v13,  v16);
      id v12 = (void *)objc_claimAutoreleasedReturnValue(v15);
      v6[2](v6, v12);
    }
  }

  else
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MIClientConnection clientName](self, "clientName"));
    id v11 = sub_1000130F4( (uint64_t)"-[MIClientConnection unregisterContentsForDiskImageAtURL:completion:]",  1279LL,  MIInstallerErrorDomain,  2LL,  0LL,  &off_10008A890,  @"Process %@ tried to unregister disk image, but disk registration can only be done by InstallCoordination.",  v10,  (uint64_t)v9);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

    v6[2](v6, v12);
  }
}

- (void)enumerateInstalledAppsWithOptions:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (qword_100095B00 != -1) {
    dispatch_once(&qword_100095B00, &stru_100081378);
  }
  id v8 = (dispatch_queue_s *)qword_100095B08;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000191DC;
  block[3] = &unk_100081038;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)fetchInfoForFrameworkAtURL:(id)a3 options:(id)a4 completion:(id)a5
{
  id v41 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, id, id))a5;
  id v39 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v40 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  id v10 = sub_100014CC8(self, @"CopyFrameworkInfoForLaunchServices");
  id v11 = (id)objc_claimAutoreleasedReturnValue(v10);
  if (v11)
  {
    id v12 = 0LL;
    id v13 = 0LL;
LABEL_3:
    uint64_t v14 = 0LL;
    goto LABEL_26;
  }

  objc_opt_class(&OBJC_CLASS___NSURL);
  id v15 = v41;
  if ((objc_opt_isKindOfClass(v15) & 1) != 0) {
    id v16 = v15;
  }
  else {
    id v16 = 0LL;
  }

  if (!v16)
  {
    id v20 = @"frameworkBundleURL parameter was not a valid URL";
    uint64_t v21 = 1413LL;
LABEL_23:
    uint64_t v14 = 0LL;
    id v34 = sub_1000130F4( (uint64_t)"-[MIClientConnection fetchInfoForFrameworkAtURL:options:completion:]",  v21,  MIInstallerErrorDomain,  25LL,  0LL,  0LL,  v20,  v17,  v35);
    id v11 = (id)objc_claimAutoreleasedReturnValue(v34);
    id v12 = 0LL;
    id v13 = 0LL;
    goto LABEL_26;
  }

  if (v8)
  {
    objc_opt_class(&OBJC_CLASS___NSDictionary);
    id v18 = v8;
    id v19 = (objc_opt_isKindOfClass(v18) & 1) != 0 ? v18 : 0LL;

    if (!v19)
    {
      id v20 = @"options parameter was not a dictionary";
      uint64_t v21 = 1418LL;
      goto LABEL_23;
    }
  }

  uint64_t v22 = qword_100095BF8;
  if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5)
  {
    id v23 = (void *)objc_claimAutoreleasedReturnValue([v15 path]);
    id v36 = (void *)objc_claimAutoreleasedReturnValue(-[MIClientConnection clientName](self, "clientName"));
    id v37 = v8;
    uint64_t v35 = (uint64_t)v23;
    MOLogWrite(v22);
  }

  id v47 = 0LL;
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[MIExecutableBundle bundleForURL:error:]( &OBJC_CLASS___MIExecutableBundle,  "bundleForURL:error:",  v15,  &v47,  v35,  v36,  v37));
  id v24 = v47;
  id v25 = v24;
  if (!v13)
  {
    id v12 = 0LL;
    uint64_t v14 = 0LL;
    id v11 = v24;
    goto LABEL_26;
  }

  id v26 = (void *)objc_claimAutoreleasedReturnValue(+[MIGlobalConfiguration sharedInstance](&OBJC_CLASS___MIGlobalConfiguration, "sharedInstance"));
  id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 primaryPersonaString]);
  id v46 = v25;
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[MILaunchServicesDatabaseGatherer entryForBundle:inContainer:forPersona:withError:]( &OBJC_CLASS___MILaunchServicesDatabaseGatherer,  "entryForBundle:inContainer:forPersona:withError:",  v13,  0LL,  v27,  &v46));
  id v11 = v46;

  if (!v12) {
    goto LABEL_3;
  }
  id v28 = (void *)objc_claimAutoreleasedReturnValue([v13 identifier]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v40, "setObject:forKeyedSubscript:", v12, v28);

  -[NSMutableArray addObject:](v39, "addObject:", v12);
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472LL;
  v43[2] = sub_100019C90;
  v43[3] = &unk_1000812C0;
  id v44 = v40;
  uint64_t v29 = v39;
  id v45 = v29;
  id v30 = objc_retainBlock(v43);
  id v31 = (void *)objc_claimAutoreleasedReturnValue(+[MIGlobalConfiguration sharedInstance](&OBJC_CLASS___MIGlobalConfiguration, "sharedInstance"));
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v31 primaryPersonaString]);
  id v42 = v11;
  unsigned __int8 v33 = +[MILaunchServicesDatabaseGatherer enumerateAppExtensionsInBundle:forPersona:updatingAppExtensionParentID:ensureAppExtensionsAreExecutable:installProfiles:error:enumerator:]( &OBJC_CLASS___MILaunchServicesDatabaseGatherer,  "enumerateAppExtensionsInBundle:forPersona:updatingAppExtensionParentID:ensureAppExtensionsAre Executable:installProfiles:error:enumerator:",  v13,  v32,  0LL,  0LL,  0LL,  &v42,  v30);
  id v38 = v42;

  if ((v33 & 1) != 0) {
    uint64_t v14 = v29;
  }
  else {
    uint64_t v14 = 0LL;
  }
  id v11 = v38;
LABEL_26:
  v9[2](v9, v14, v11);
}

- (void)fetchInfoForContainerizedAppWithIdentity:(id)a3 inDomain:(unint64_t)a4 options:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = (void (**)(id, void *, void *))a6;
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 bundleID]);
  id v14 = sub_100014CC8(self, @"CopyContainerizedAppInfoForLaunchServices");
  id v16 = (void *)objc_claimAutoreleasedReturnValue(v14);
  if (!v16)
  {
    if (v10)
    {
      if ((MIIsValidInstallationDomain(a4) & 1) == 0)
      {
        uint64_t v17 = 0LL;
        id v25 = sub_1000130F4( (uint64_t)"-[MIClientConnection fetchInfoForContainerizedAppWithIdentity:inDomain:options:completion:]",  1488LL,  MIInstallerErrorDomain,  25LL,  0LL,  0LL,  @"domain %lu isn't valid",  v18,  a4);
        uint64_t v24 = objc_claimAutoreleasedReturnValue(v25);
        goto LABEL_11;
      }

      if (!v11
        || ((objc_opt_class(&OBJC_CLASS___NSDictionary), id v19 = v11, (objc_opt_isKindOfClass(v19) & 1) == 0)
          ? (id v20 = 0LL)
          : (id v20 = v19),
            v19,
            v20,
            v20))
      {
        uint64_t v26 = qword_100095BF8;
        if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5)
        {
          id v37 = (void *)objc_claimAutoreleasedReturnValue(-[MIClientConnection clientName](self, "clientName"));
          MOLogWrite(v26);
        }

        sub_10004D4EC(v13);
        id v41 = 0LL;
        id v27 = (void *)objc_claimAutoreleasedReturnValue( +[MIBundleContainer appBundleContainerForIdentifier:inDomain:withError:]( &OBJC_CLASS___MIBundleContainer,  "appBundleContainerForIdentifier:inDomain:withError:",  v13,  a4,  &v41));
        id v28 = v41;
        if (!v27)
        {
          uint64_t v33 = 0LL;
          id v30 = 0LL;
LABEL_27:

          id v16 = v28;
          sub_10004D608(v13);
          uint64_t v17 = (void *)v33;
          goto LABEL_28;
        }

        id v30 = (void *)objc_claimAutoreleasedReturnValue([v27 bundle]);
        if (v30)
        {
          id v40 = v28;
          unsigned int v31 = [v10 resolvePersonaWithError:&v40];
          id v32 = v40;

          if (!v31)
          {
            uint64_t v33 = 0LL;
            goto LABEL_26;
          }

          uint64_t v38 = objc_claimAutoreleasedReturnValue([v10 personaUniqueString]);
          id v39 = v32;
          uint64_t v33 = objc_claimAutoreleasedReturnValue( +[MILaunchServicesDatabaseGatherer fetchInfoForBundle:forPersona:inContainer:withError:]( &OBJC_CLASS___MILaunchServicesDatabaseGatherer,  "fetchInfoForBundle:forPersona:inContainer:withError:",  v30,  v38,  v27,  &v39));
          id v34 = v39;

          id v32 = v34;
          id v28 = (id)v38;
        }

        else
        {
          id v35 = sub_1000130F4( (uint64_t)"-[MIClientConnection fetchInfoForContainerizedAppWithIdentity:inDomain:options:completion:]",  1510LL,  MIInstallerErrorDomain,  36LL,  0LL,  0LL,  @"Failed to find bundle in bundle container %@ for %@",  v29,  (uint64_t)v27);
          id v32 = (id)objc_claimAutoreleasedReturnValue(v35);
          uint64_t v33 = 0LL;
          id v30 = 0LL;
        }

LABEL_26:
        id v28 = v32;
        goto LABEL_27;
      }

      uint64_t v21 = @"options parameter was not a dictionary";
      uint64_t v22 = 1493LL;
    }

    else
    {
      uint64_t v21 = @"identity parameter was nil";
      uint64_t v22 = 1483LL;
    }

    uint64_t v17 = 0LL;
    id v23 = sub_1000130F4( (uint64_t)"-[MIClientConnection fetchInfoForContainerizedAppWithIdentity:inDomain:options:completion:]",  v22,  MIInstallerErrorDomain,  25LL,  0LL,  0LL,  v21,  v15,  v36);
    uint64_t v24 = objc_claimAutoreleasedReturnValue(v23);
LABEL_11:
    id v16 = (void *)v24;
    goto LABEL_28;
  }

  uint64_t v17 = 0LL;
LABEL_28:
  v12[2](v12, v17, v16);
}

- (BOOL)_validateArgsForMethodWithName:(const char *)a3 bundleIdentifier:(id)a4 data:(id)a5 optionalOptions:(id)a6 error:(id *)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_opt_class(&OBJC_CLASS___NSString);
  id v14 = v11;
  if ((objc_opt_isKindOfClass(v14) & 1) != 0) {
    id v15 = v14;
  }
  else {
    id v15 = 0LL;
  }

  if (v15)
  {
    objc_opt_class(&OBJC_CLASS___NSData);
    id v17 = v12;
    if ((objc_opt_isKindOfClass(v17) & 1) != 0) {
      id v18 = v17;
    }
    else {
      id v18 = 0LL;
    }

    if (v18)
    {
      if (!v13
        || ((objc_opt_class(&OBJC_CLASS___NSDictionary), id v21 = v13, (objc_opt_isKindOfClass(v21) & 1) == 0)
          ? (id v22 = 0LL)
          : (id v22 = v21),
            v21,
            v22,
            v22))
      {
        id v24 = 0LL;
        goto LABEL_21;
      }

      id v19 = sub_1000130F4( (uint64_t)"-[MIClientConnection _validateArgsForMethodWithName:bundleIdentifier:data:optionalOptions:error:]",  1552LL,  MIInstallerErrorDomain,  25LL,  0LL,  0LL,  @"Parameter validation failed for: %s, options parameter was not a dictionary",  v23,  (uint64_t)a3);
    }

    else
    {
      id v19 = sub_1000130F4( (uint64_t)"-[MIClientConnection _validateArgsForMethodWithName:bundleIdentifier:data:optionalOptions:error:]",  1547LL,  MIInstallerErrorDomain,  25LL,  0LL,  0LL,  @"Parameter validation failed for: %s, data parameter was not a data object",  v20,  (uint64_t)a3);
    }
  }

  else
  {
    id v19 = sub_1000130F4( (uint64_t)"-[MIClientConnection _validateArgsForMethodWithName:bundleIdentifier:data:optionalOptions:error:]",  1542LL,  MIInstallerErrorDomain,  25LL,  0LL,  0LL,  @"Parameter validation failed for: %s, bundleIdentifier parameter was not a string",  v16,  (uint64_t)a3);
  }

  id v24 = (id)objc_claimAutoreleasedReturnValue(v19);
  if (a7 && v24)
  {
    id v24 = v24;
    *a7 = v24;
  }

- (void)updateSinfForIXWithIdentifier:(id)a3 withOptions:(id)a4 sinfData:(id)a5 completion:(id)a6
{
  id v61 = a3;
  id v60 = a4;
  id v59 = a5;
  id v10 = (void (**)(id, id, void))a6;
  uint64_t v80 = 0LL;
  v81 = (id *)&v80;
  uint64_t v82 = 0x3032000000LL;
  v83 = sub_100015924;
  uint64_t v84 = sub_100015934;
  id v85 = 0LL;
  uint64_t v76 = 0LL;
  id v77 = &v76;
  uint64_t v78 = 0x2020000000LL;
  char v79 = 0;
  id v11 = sub_100014CC8(self, @"UpdateSinfForInstallCoordination");
  uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
  id v13 = v81[5];
  v81[5] = (id)v12;

  id v14 = v81 + 5;
  if (v81[5]
    || (id v75 = 0LL,
        unsigned int v15 = -[MIClientConnection _validateArgsForMethodWithName:bundleIdentifier:data:optionalOptions:error:]( self,  "_validateArgsForMethodWithName:bundleIdentifier:data:optionalOptions:error:",  "-[MIClientConnection updateSinfForIXWithIdentifier:withOptions:sinfData:completion:]",  v61,  v59,  v60,  &v75),  objc_storeStrong(v14, v75),  !v15))
  {
    id v18 = 0LL;
    id v21 = 0LL;
    id v22 = 0LL;
    uint64_t v29 = 0LL;
    id v24 = 0LL;
    id v37 = 0LL;
    goto LABEL_27;
  }

  uint64_t v16 = qword_100095BF8;
  if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5)
  {
    id v55 = v61;
    id v57 = v60;
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[MIClientConnection clientName](self, "clientName"));
    MOLogWrite(v16);
  }

  sub_10004D4EC(v61);
  id v17 = v81;
  id obj = v81[5];
  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[MIBundleContainer appBundleContainerWithIdentifier:createIfNeeded:created:error:]( &OBJC_CLASS___MIBundleContainer,  "appBundleContainerWithIdentifier:createIfNeeded:created:error:",  v61,  0LL,  0LL,  &obj));
  objc_storeStrong(v17 + 5, obj);
  if (!v18)
  {
    if (qword_100095BF8 && *(int *)(qword_100095BF8 + 44) < 3)
    {
      id v21 = 0LL;
      id v22 = 0LL;
      uint64_t v29 = 0LL;
      id v24 = 0LL;
    }

    else
    {
      id v21 = 0LL;
      id v22 = 0LL;
      MOLogWrite(qword_100095BF8);
      uint64_t v29 = 0LL;
      id v24 = 0LL;
    }

    goto LABEL_56;
  }

  id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 bundle]);
  id v21 = v19;
  if (!v19)
  {
    id v40 = sub_1000130F4( (uint64_t)"-[MIClientConnection updateSinfForIXWithIdentifier:withOptions:sinfData:completion:]",  1762LL,  MIInstallerErrorDomain,  36LL,  0LL,  0LL,  @"Failed to get app bundle in bundle container for %@",  v20,  (uint64_t)v61);
    uint64_t v41 = objc_claimAutoreleasedReturnValue(v40);
    id v21 = 0LL;
    id v22 = 0LL;
    uint64_t v29 = 0LL;
    id v24 = 0LL;
    id v39 = v81[5];
    v81[5] = (id)v41;
LABEL_55:

    goto LABEL_56;
  }

  id v22 = (void *)objc_claimAutoreleasedReturnValue([v19 rootSinfURL]);
  uint64_t v23 = v81;
  id v73 = v81[5];
  id v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfURL:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfURL:options:error:",  v22,  2LL,  &v73));
  objc_storeStrong(v23 + 5, v73);
  if (v24) {
    goto LABEL_9;
  }
  id v42 = (void *)objc_claimAutoreleasedReturnValue([v81[5] domain]);
  if (([v42 isEqualToString:NSCocoaErrorDomain] & 1) == 0)
  {

LABEL_38:
    id v44 = v81[5];
    id v39 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "path", v53, v55, v57));
    id v46 = sub_1000130F4( (uint64_t)"-[MIClientConnection updateSinfForIXWithIdentifier:withOptions:sinfData:completion:]",  1770LL,  MIInstallerErrorDomain,  4LL,  v44,  0LL,  @"Failed to read SINF from %@",  v45,  (uint64_t)v39);
    uint64_t v47 = objc_claimAutoreleasedReturnValue(v46);
    id v48 = v81[5];
    v81[5] = (id)v47;

    uint64_t v29 = 0LL;
    id v24 = 0LL;
    goto LABEL_55;
  }

  id v43 = [v81[5] code];

  if (v43 != (id)260) {
    goto LABEL_38;
  }
LABEL_9:
  unsigned int v72 = 0;
  BOOL v25 = v81;
  id v71 = v81[5];
  unsigned __int8 v26 = objc_msgSend(v21, "getSinfDataType:withError:", &v72, &v71, v53, v55, v57);
  objc_storeStrong(v25 + 5, v71);
  if ((v26 & 1) == 0)
  {
    uint64_t v29 = 0LL;
LABEL_56:
    id v37 = 0LL;
    sub_10004D608(v61);
    goto LABEL_27;
  }

  id v27 = (void *)objc_claimAutoreleasedReturnValue([v60 objectForKeyedSubscript:@"ApplicationSINFDataType"]);
  objc_opt_class(&OBJC_CLASS___NSNumber);
  id v28 = sub_100015E2C(v27);
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(v28);

  if (v29 && (id v30 = [v29 unsignedIntValue], (_DWORD)v30 != v72))
  {
    uint64_t v50 = v81;
    id v70 = v81[5];
    unsigned __int8 v51 = [v21 setSinfDataType:v30 withError:&v70];
    objc_storeStrong(v50 + 5, v70);
    if ((v51 & 1) == 0)
    {
      goto LABEL_56;
    }

    int v58 = 1;
  }

  else
  {
    int v58 = 0;
  }

  unsigned int v31 = v81;
  id v69 = v81[5];
  id v32 = (void *)objc_claimAutoreleasedReturnValue([v21 updateAndValidateSinf:v59 error:&v69]);
  objc_storeStrong(v31 + 5, v69);
  if (!v32)
  {
    if (v58)
    {
      id v68 = 0LL;
      unsigned __int8 v49 = [v21 setSinfDataType:v72 withError:&v68];
      id v39 = v68;
    }

    else
    {
      id v39 = 0LL;
    }

    goto LABEL_55;
  }

  id v33 = v81[5];
  v81[5] = 0LL;

  if (qword_100095BF8 && *(int *)(qword_100095BF8 + 44) >= 7)
  {
    unint64_t v54 = (unint64_t)v32;
    MOLogWrite(qword_100095BF8);
  }

  sub_10004D608(v61);
  id v34 = sub_10000D8B4();
  id v35 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v34);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001ADFC;
  block[3] = &unk_100080EA8;
  v66 = &v76;
  id v36 = v61;
  id v64 = v36;
  id v37 = v32;
  id v65 = v37;
  id v67 = &v80;
  dispatch_sync(v35, block);

  if (!*((_BYTE *)v77 + 24))
  {
    if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
    {
      unint64_t v54 = (unint64_t)v36;
      id v56 = v81[5];
      MOLogWrite(qword_100095BF8);
    }

    sub_10004D4EC(v36);
    if (v58)
    {
      id v62 = 0LL;
      unsigned __int8 v38 = [v21 setSinfDataType:v72 withError:&v62];
      id v39 = v62;
      if ((v38 & 1) == 0 && (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3))
      {
        unint64_t v54 = v72;
        id v56 = v39;
        MOLogWrite(qword_100095BF8);
      }
    }

    else
    {
      id v39 = 0LL;
    }

    id v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "bundle", v54, v56));
    [v52 bestEffortRollbackSinfData:v24];

    goto LABEL_55;
  }

- (void)updateiTunesMetadataForIXWithIdentifier:(id)a3 metadata:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v46 = a4;
  id v9 = (void (**)(id, void))a5;
  uint64_t v59 = 0LL;
  id v60 = (id *)&v59;
  uint64_t v61 = 0x3032000000LL;
  id v62 = sub_100015924;
  v63 = sub_100015934;
  id v64 = 0LL;
  uint64_t v55 = 0LL;
  id v56 = &v55;
  uint64_t v57 = 0x2020000000LL;
  char v58 = 0;
  id v10 = sub_100014CC8(self, @"UpdateiTunesMetadataForInstallCoordination");
  uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);
  id v12 = v60[5];
  v60[5] = (id)v11;

  if (v60[5]) {
    goto LABEL_22;
  }
  objc_opt_class(&OBJC_CLASS___NSString);
  id v13 = v8;
  if ((objc_opt_isKindOfClass(v13) & 1) != 0) {
    id v14 = v13;
  }
  else {
    id v14 = 0LL;
  }

  if (!v14)
  {
    id v30 = sub_1000130F4( (uint64_t)"-[MIClientConnection updateiTunesMetadataForIXWithIdentifier:metadata:completion:]",  1869LL,  MIInstallerErrorDomain,  25LL,  0LL,  0LL,  @"Parameter validation failed: bundleIdentifier parameter was not a string",  v15,  (uint64_t)v42);
    uint64_t v31 = objc_claimAutoreleasedReturnValue(v30);
LABEL_21:
    id v33 = v60[5];
    v60[5] = (id)v31;

LABEL_22:
    uint64_t v29 = 0LL;
    id v19 = 0LL;
    uint64_t v20 = 0LL;
    goto LABEL_23;
  }

  objc_opt_class(&OBJC_CLASS___MIStoreMetadata);
  if ((objc_opt_isKindOfClass(v46) & 1) == 0)
  {
    id v32 = sub_1000130F4( (uint64_t)"-[MIClientConnection updateiTunesMetadataForIXWithIdentifier:metadata:completion:]",  1874LL,  MIInstallerErrorDomain,  25LL,  0LL,  0LL,  @"Parameter validation failed: metadata parameter was not MIStoreMetadata instance",  v16,  (uint64_t)v42);
    uint64_t v31 = objc_claimAutoreleasedReturnValue(v32);
    goto LABEL_21;
  }

  uint64_t v17 = qword_100095BF8;
  if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5)
  {
    id v42 = (void *)objc_claimAutoreleasedReturnValue(-[MIClientConnection clientName](self, "clientName"));
    id v44 = v13;
    MOLogWrite(v17);
  }

  sub_10004D4EC(v13);
  id v18 = v60;
  id obj = v60[5];
  id v19 = (void *)objc_claimAutoreleasedReturnValue( +[MIBundleContainer appBundleContainerWithIdentifier:createIfNeeded:created:error:]( &OBJC_CLASS___MIBundleContainer,  "appBundleContainerWithIdentifier:createIfNeeded:created:error:",  v13,  0LL,  0LL,  &obj));
  objc_storeStrong(v18 + 5, obj);
  if (!v19)
  {
    if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
    {
      uint64_t v29 = 0LL;
      MOLogWrite(qword_100095BF8);
      uint64_t v20 = 0LL;
      id v19 = 0LL;
LABEL_35:
      sub_10004D608(v8);
      goto LABEL_23;
    }

    uint64_t v20 = 0LL;
    id v19 = 0LL;
LABEL_34:
    uint64_t v29 = 0LL;
    goto LABEL_35;
  }

  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 iTunesMetadataURL]);
  id v21 = v60;
  id v53 = v60[5];
  uint64_t v22 = objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfURL:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfURL:options:error:",  v20,  2LL,  &v53));
  objc_storeStrong(v21 + 5, v53);
  if (v22) {
    goto LABEL_12;
  }
  id v34 = (void *)objc_claimAutoreleasedReturnValue([v60[5] domain]);
  if (([v34 isEqualToString:NSCocoaErrorDomain] & 1) == 0)
  {

LABEL_33:
    id v36 = v60[5];
    id v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "path", v42, v44));
    id v39 = sub_1000130F4( (uint64_t)"-[MIClientConnection updateiTunesMetadataForIXWithIdentifier:metadata:completion:]",  1893LL,  MIInstallerErrorDomain,  4LL,  v36,  0LL,  @"Failed to read iTunesMetadata from %@",  v38,  (uint64_t)v37);
    uint64_t v40 = objc_claimAutoreleasedReturnValue(v39);
    id v41 = v60[5];
    v60[5] = (id)v40;

    goto LABEL_34;
  }

  id v35 = [v60[5] code];

  if (v35 != (id)260) {
    goto LABEL_33;
  }
LABEL_12:
  uint64_t v23 = v60;
  id v52 = v60[5];
  unsigned int v24 = objc_msgSend(v19, "writeiTunesMetadata:error:", v46, &v52, v42, v44);
  objc_storeStrong(v23 + 5, v52);
  *((_BYTE *)v56 + 24) = v24;
  if (!v24)
  {
    uint64_t v29 = (void *)v22;
    goto LABEL_35;
  }

  id v25 = v60[5];
  v60[5] = 0LL;

  sub_10004D608(v13);
  id v26 = sub_10000D8B4();
  id v27 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v26);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001B614;
  block[3] = &unk_100080EA8;
  uint64_t v50 = &v55;
  id v28 = v13;
  id v48 = v28;
  id v49 = v46;
  unsigned __int8 v51 = &v59;
  dispatch_sync(v27, block);

  if (!*((_BYTE *)v56 + 24))
  {
    if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
    {
      id v43 = v28;
      uint64_t v45 = (uint64_t)v60[5];
      MOLogWrite(qword_100095BF8);
    }

    objc_msgSend(v19, "bestEffortRollbackiTunesMetadata:error:", v22, 0, v43, v45);
  }

  uint64_t v29 = (void *)v22;
LABEL_23:
  ((void (**)(id, id))v9)[2](v9, v60[5]);

  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(&v59, 8);
}

- (void)fetchDiskUsageForIdentifiers:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *, id))a5;
  id v11 = sub_100014CC8(self, @"CopyDiskUsageForLaunchServices");
  id v12 = (id)objc_claimAutoreleasedReturnValue(v11);
  if (v12) {
    goto LABEL_11;
  }
  objc_opt_class(&OBJC_CLASS___NSArray);
  id v13 = v8;
  if ((objc_opt_isKindOfClass(v13) & 1) == 0)
  {

LABEL_9:
    id v18 = @"Identifers provided was not an array of strings";
    uint64_t v19 = 1952LL;
LABEL_10:
    id v20 = sub_1000130F4( (uint64_t)"-[MIClientConnection fetchDiskUsageForIdentifiers:withOptions:completion:]",  v19,  MIInstallerErrorDomain,  25LL,  0LL,  0LL,  v18,  v14,  v24);
    id v12 = (id)objc_claimAutoreleasedReturnValue(v20);
LABEL_11:
    id v21 = 0LL;
    goto LABEL_12;
  }

  if (!v13) {
    goto LABEL_9;
  }
  objc_opt_class(&OBJC_CLASS___NSString);
  int v15 = sub_100013434(v13);

  if (!v15) {
    goto LABEL_9;
  }
  if (v9)
  {
    objc_opt_class(&OBJC_CLASS___NSDictionary);
    id v16 = v9;
    id v17 = (objc_opt_isKindOfClass(v16) & 1) != 0 ? v16 : 0LL;

    if (!v17)
    {
      id v18 = @"Options provided was not a dictionary";
      uint64_t v19 = 1957LL;
      goto LABEL_10;
    }
  }

  uint64_t v22 = qword_100095BF8;
  if (qword_100095BF8 && *(int *)(qword_100095BF8 + 44) >= 7)
  {
    id v25 = (void *)objc_claimAutoreleasedReturnValue(-[MIClientConnection clientName](self, "clientName"));
    MOLogWrite(v22);
  }

  uint64_t v23 = -[MIDiskUsageGatherer initWithIdentifiers:options:]( objc_alloc(&OBJC_CLASS___MIDiskUsageGatherer),  "initWithIdentifiers:options:",  v13,  v9);
  id v26 = 0LL;
  id v21 = (void *)objc_claimAutoreleasedReturnValue(-[MIDiskUsageGatherer gatherUsageInfoWithError:](v23, "gatherUsageInfoWithError:", &v26));
  id v12 = v26;

LABEL_12:
  v10[2](v10, v21, v12);
}

- (void)registerSafeHarborAtPath:(id)a3 forIdentity:(id)a4 ofType:(unint64_t)a5 withOptions:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  int v15 = (void (**)(id, id))a7;
  id v16 = sub_100014CC8(self, @"RegisterSafeHarbor");
  id v17 = (id)objc_claimAutoreleasedReturnValue(v16);
  if (!v17)
  {
    objc_opt_class(&OBJC_CLASS___NSString);
    id v18 = v12;
    if ((objc_opt_isKindOfClass(v18) & 1) != 0) {
      id v19 = v18;
    }
    else {
      id v19 = 0LL;
    }

    if (!v19)
    {
      id v28 = sub_1000130F4( (uint64_t)"-[MIClientConnection registerSafeHarborAtPath:forIdentity:ofType:withOptions:completion:]",  1991LL,  MIInstallerErrorDomain,  25LL,  0LL,  0LL,  @"Path parameter was not a string",  v20,  (uint64_t)v39);
      id v17 = (id)objc_claimAutoreleasedReturnValue(v28);
      goto LABEL_2;
    }

    id v47 = 0LL;
    unsigned int v21 = +[MIAppIdentity validateAppIdentity:withError:]( &OBJC_CLASS___MIAppIdentity,  "validateAppIdentity:withError:",  v13,  &v47);
    id v22 = v47;
    id v17 = v22;
    if (v21)
    {
      id v46 = v22;
      unsigned int v23 = [v13 resolvePersonaWithError:&v46];
      id v24 = v46;

      if (!v23)
      {
        id v17 = v24;
        goto LABEL_2;
      }

      if (a5 - 15 <= 0xFFFFFFFFFFFFFFF1LL)
      {
        id v26 = sub_1000130F4( (uint64_t)"-[MIClientConnection registerSafeHarborAtPath:forIdentity:ofType:withOptions:completion:]",  2004LL,  MIInstallerErrorDomain,  25LL,  0LL,  0LL,  @"Container type parameter did not correspond to a defined container content class.",  v25,  (uint64_t)v39);
        uint64_t v27 = objc_claimAutoreleasedReturnValue(v26);
LABEL_11:
        id v17 = (id)v27;

        goto LABEL_2;
      }

      if (v14)
      {
        objc_opt_class(&OBJC_CLASS___NSDictionary);
        id v29 = sub_100015E2C(v14);
        id v30 = (void *)objc_claimAutoreleasedReturnValue(v29);

        if (!v30)
        {
          id v38 = sub_1000130F4( (uint64_t)"-[MIClientConnection registerSafeHarborAtPath:forIdentity:ofType:withOptions:completion:]",  2009LL,  MIInstallerErrorDomain,  25LL,  0LL,  0LL,  @"Options parameter was not a dictionary",  v31,  (uint64_t)v39);
          uint64_t v27 = objc_claimAutoreleasedReturnValue(v38);
          goto LABEL_11;
        }
      }

      uint64_t v32 = qword_100095BF8;
      if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5)
      {
        unint64_t v42 = a5;
        id v43 = v14;
        id v40 = v18;
        id v41 = v13;
        id v39 = (void *)objc_claimAutoreleasedReturnValue(-[MIClientConnection clientName](self, "clientName"));
        MOLogWrite(v32);
      }

      id v33 = (void *)objc_claimAutoreleasedReturnValue( +[MISafeHarborManager defaultManager]( &OBJC_CLASS___MISafeHarborManager,  "defaultManager",  v39,  v40,  v41,  v42,  v43));
      id v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v18));
      id v35 = (void *)objc_claimAutoreleasedReturnValue([v13 bundleID]);
      id v36 = (void *)objc_claimAutoreleasedReturnValue([v13 personaUniqueString]);
      id v45 = v24;
      unsigned __int8 v44 = [v33 registerSafeHarborAtURL:v34 withOptions:v14 forIdentifier:v35 forPersona:v36 ofType:a5 error:&v45];
      id v37 = v33;
      id v17 = v45;
    }
  }

- (void)removeSafeHarborForIdentity:(id)a3 ofType:(unint64_t)a4 withOptions:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = (void (**)(id, id))a6;
  id v13 = sub_100014CC8(self, @"RemoveSafeHarbor");
  id v14 = (id)objc_claimAutoreleasedReturnValue(v13);
  if (!v14)
  {
    id v37 = 0LL;
    unsigned int v15 = +[MIAppIdentity validateAppIdentity:withError:]( &OBJC_CLASS___MIAppIdentity,  "validateAppIdentity:withError:",  v10,  &v37);
    id v16 = v37;
    id v14 = v16;
    if (v15)
    {
      id v36 = v16;
      unsigned int v17 = [v10 resolvePersonaWithError:&v36];
      id v18 = v36;

      if (!v17)
      {
        id v14 = v18;
        goto LABEL_20;
      }

      if (a4 - 15 <= 0xFFFFFFFFFFFFFFF1LL)
      {
        id v20 = sub_1000130F4( (uint64_t)"-[MIClientConnection removeSafeHarborForIdentity:ofType:withOptions:completion:]",  2054LL,  MIInstallerErrorDomain,  25LL,  0LL,  0LL,  @"Container type parameter did not correspond to a defined container content class.",  v19,  (uint64_t)v31);
        uint64_t v21 = objc_claimAutoreleasedReturnValue(v20);
LABEL_6:
        id v14 = (id)v21;

        goto LABEL_20;
      }

      if (v11)
      {
        objc_opt_class(&OBJC_CLASS___NSDictionary);
        id v22 = v11;
        id v23 = (objc_opt_isKindOfClass(v22) & 1) != 0 ? v22 : 0LL;

        if (!v23)
        {
          id v30 = sub_1000130F4( (uint64_t)"-[MIClientConnection removeSafeHarborForIdentity:ofType:withOptions:completion:]",  2059LL,  MIInstallerErrorDomain,  25LL,  0LL,  0LL,  @"Options parameter was not a dictionary",  v24,  (uint64_t)v31);
          uint64_t v21 = objc_claimAutoreleasedReturnValue(v30);
          goto LABEL_6;
        }
      }

      uint64_t v25 = qword_100095BF8;
      if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5)
      {
        unint64_t v33 = a4;
        id v34 = v11;
        uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[MIClientConnection clientName](self, "clientName"));
        id v32 = v10;
        MOLogWrite(v25);
      }

      id v26 = (void *)objc_claimAutoreleasedReturnValue( +[MISafeHarborManager defaultManager]( &OBJC_CLASS___MISafeHarborManager,  "defaultManager",  v31,  v32,  v33,  v34));
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v10 bundleID]);
      id v28 = (void *)objc_claimAutoreleasedReturnValue([v10 personaUniqueString]);
      id v35 = v18;
      unsigned __int8 v29 = [v26 removeSafeHarborWithIdentifier:v27 forPersona:v28 ofType:a4 options:v11 error:&v35];
      id v14 = v35;
    }
  }

- (void)listSafeHarborsOfType:(unint64_t)a3 forPersona:(id)a4 withOptions:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = (void (**)(id, void *, void *))a6;
  id v13 = sub_100014CC8(self, @"CopySafeHarbors");
  unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(v13);
  if (v15) {
    goto LABEL_2;
  }
  if (v11)
  {
    objc_opt_class(&OBJC_CLASS___NSDictionary);
    id v17 = v11;
    id v18 = (objc_opt_isKindOfClass(v17) & 1) != 0 ? v17 : 0LL;

    if (!v18)
    {
      uint64_t v19 = @"Options parameter was not a dictionary";
      uint64_t v20 = 2097LL;
      goto LABEL_16;
    }
  }

  if (a3 - 15 <= 0xFFFFFFFFFFFFFFF1LL)
  {
    uint64_t v19 = @"Container type parameter did not correspond to a defined container content class.";
    uint64_t v20 = 2102LL;
LABEL_16:
    id v16 = 0LL;
    id v25 = sub_1000130F4( (uint64_t)"-[MIClientConnection listSafeHarborsOfType:forPersona:withOptions:completion:]",  v20,  MIInstallerErrorDomain,  25LL,  0LL,  0LL,  v19,  v14,  (uint64_t)v26);
    unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(v25);
    goto LABEL_17;
  }

  uint64_t v21 = qword_100095BF8;
  if (qword_100095BF8 && *(int *)(qword_100095BF8 + 44) >= 7)
  {
    unint64_t v27 = a3;
    id v28 = v11;
    id v26 = (void *)objc_claimAutoreleasedReturnValue(-[MIClientConnection clientName](self, "clientName"));
    MOLogWrite(v21);
  }

  id v22 = (void *)objc_claimAutoreleasedReturnValue( +[MISafeHarborManager defaultManager]( &OBJC_CLASS___MISafeHarborManager,  "defaultManager",  v26,  v27,  v28));
  id v29 = 0LL;
  uint64_t v23 = objc_claimAutoreleasedReturnValue([v22 safeHarborListForType:a3 forPersona:v10 withError:&v29]);
  id v24 = v29;

  if (v23)
  {
    unsigned int v15 = v24;
    id v16 = (void *)v23;
    goto LABEL_17;
  }

  unsigned int v15 = v24;
LABEL_2:
  id v16 = 0LL;
LABEL_17:
  v12[2](v12, v16, v15);
}

- (void)checkCapabilities:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, id, void *))a5;
  if (v8)
  {
    objc_opt_class(&OBJC_CLASS___NSDictionary);
    id v10 = v8;
    id v11 = (objc_opt_isKindOfClass(v10) & 1) != 0 ? v10 : 0LL;

    if (!v11)
    {
      id v19 = sub_1000130F4( (uint64_t)"-[MIClientConnection checkCapabilities:withOptions:completion:]",  2141LL,  MIInstallerErrorDomain,  25LL,  0LL,  0LL,  @"Options parameter was not a dictionary",  v12,  v20);
      id v16 = (void *)objc_claimAutoreleasedReturnValue(v19);
      goto LABEL_19;
    }
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[MICapabilitiesManager defaultManager](&OBJC_CLASS___MICapabilitiesManager, "defaultManager"));
  id v21 = 0LL;
  uint64_t v14 = objc_claimAutoreleasedReturnValue([v13 checkCapabilities:v7 withOptions:v8 error:&v21]);
  id v15 = v21;

  if (v14)
  {
    id v16 = v15;
LABEL_8:
    id v11 = (id)v14;
    goto LABEL_19;
  }

  if (v15)
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v15 domain]);
    if ([v17 isEqualToString:MIInstallerErrorDomain])
    {
      BOOL v18 = [v15 code] == (id)66;

      if (v18)
      {
        v22[0] = @"CapabilitiesMatch";
        v22[1] = @"MismatchedCapabilities";
        v23[0] = &__kCFBooleanFalse;
        v23[1] = &off_10008A8B8;
        uint64_t v14 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v23,  v22,  2LL));

        id v16 = 0LL;
        goto LABEL_8;
      }
    }

    else
    {
    }
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  MIInstallerErrorDomain,  1LL,  &off_10008A8E0));

  id v11 = 0LL;
LABEL_19:
  v9[2](v9, v11, v16);
}

- (void)updatePlaceholderMetadataForApp:(id)a3 installType:(unint64_t)a4 failureReason:(unint64_t)a5 underlyingError:(id)a6 failureSource:(unint64_t)a7 completion:(id)a8
{
  id v13 = a3;
  id v48 = a6;
  uint64_t v14 = (void (**)(id, void))a8;
  uint64_t v64 = 0LL;
  id v65 = (id *)&v64;
  uint64_t v66 = 0x3032000000LL;
  id v67 = sub_100015924;
  id v68 = sub_100015934;
  id v69 = 0LL;
  uint64_t v60 = 0LL;
  uint64_t v61 = &v60;
  uint64_t v62 = 0x2020000000LL;
  char v63 = 0;
  id v15 = sub_100014CC8(self, @"UpdatePlaceholderMetadata");
  uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
  id v17 = v65[5];
  v65[5] = (id)v16;

  if (v65[5]) {
    goto LABEL_2;
  }
  objc_opt_class(&OBJC_CLASS___NSString);
  id v24 = v13;
  if ((objc_opt_isKindOfClass(v24) & 1) != 0) {
    id v25 = v24;
  }
  else {
    id v25 = 0LL;
  }

  if (!v25)
  {
    id v38 = sub_1000130F4( (uint64_t)"-[MIClientConnection updatePlaceholderMetadataForApp:installType:failureReason:underlyingError:fail ureSource:completion:]",  2189LL,  MIInstallerErrorDomain,  25LL,  0LL,  0LL,  @"bundleID parameter was not a string",  v26,  (uint64_t)v41);
    uint64_t v39 = objc_claimAutoreleasedReturnValue(v38);
    id v40 = v65[5];
    v65[5] = (id)v39;

LABEL_2:
    BOOL v18 = 0LL;
    id v19 = 0LL;
    uint64_t v20 = 0LL;
LABEL_3:
    int v21 = 0;
    goto LABEL_4;
  }

  uint64_t v27 = qword_100095BF8;
  if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5)
  {
    id v45 = v48;
    unint64_t v46 = a7;
    unint64_t v43 = a4;
    unint64_t v44 = a5;
    id v41 = (void *)objc_claimAutoreleasedReturnValue(-[MIClientConnection clientName](self, "clientName"));
    id v42 = v24;
    MOLogWrite(v27);
  }

  sub_10004D4EC(v24);
  id v28 = v65;
  id obj = v65[5];
  int v21 = 1;
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[MIBundleContainer appBundleContainerWithIdentifier:createIfNeeded:created:error:]( &OBJC_CLASS___MIBundleContainer,  "appBundleContainerWithIdentifier:createIfNeeded:created:error:",  v24,  0LL,  0LL,  &obj));
  objc_storeStrong(v28 + 5, obj);
  if (!v20)
  {
    BOOL v18 = 0LL;
    goto LABEL_32;
  }

  id v29 = v65;
  id v58 = v65[5];
  BOOL v18 = (void *)objc_claimAutoreleasedReturnValue([v20 bundleMetadataWithError:&v58]);
  objc_storeStrong(v29 + 5, v58);
  if (!v18)
  {
LABEL_32:
    id v19 = 0LL;
    goto LABEL_4;
  }

  id v19 = [v18 copy];
  [v19 setPlaceholderFailureReason:a5];
  [v19 setPlaceholderFailureUnderlyingError:v48];
  [v19 setPlaceholderFailureUnderlyingErrorSource:a7];
  if (a4) {
    [v19 setInstallType:a4];
  }
  id v30 = v65;
  id v57 = v65[5];
  unsigned int v31 = objc_msgSend(v20, "saveBundleMetadata:withError:", v19, &v57, v41, v42, v43, v44, v45, v46);
  objc_storeStrong(v30 + 5, v57);
  if (v31)
  {
    sub_10004D608(v24);
    id v32 = (void *)objc_opt_new(&OBJC_CLASS___LSOperationRequestContext);
    unint64_t v33 = +[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", sub_10000D79C());
    id v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
    [v32 setTargetUserID:v34];

    id v35 = sub_10000D8B4();
    id v36 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v35);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10001CE78;
    block[3] = &unk_1000812E8;
    id v53 = &v60;
    id v51 = v24;
    id v52 = v32;
    unint64_t v55 = a4;
    unint64_t v56 = a5;
    unint64_t v54 = &v64;
    id v37 = v32;
    dispatch_sync(v36, block);

    int v21 = 0;
    MOLogWrite(qword_100095BF8);
  }

- (void)getAppMetadataForApp:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id, void *))a4;
  id v8 = sub_100014CC8(self, @"GetAppMetadata");
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  if (v9)
  {
    id v10 = 0LL;
  }

  else
  {
    objc_opt_class(&OBJC_CLASS___NSString);
    id v11 = v6;
    if ((objc_opt_isKindOfClass(v11) & 1) != 0) {
      id v10 = v11;
    }
    else {
      id v10 = 0LL;
    }

    if (v10)
    {
      uint64_t v13 = qword_100095BF8;
      if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5)
      {
        int v21 = (void *)objc_claimAutoreleasedReturnValue(-[MIClientConnection clientName](self, "clientName"));
        MOLogWrite(v13);
      }

      sub_10004D4E4(v11);
      id v23 = 0LL;
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[MIBundleContainer appBundleContainerWithIdentifier:createIfNeeded:created:error:]( &OBJC_CLASS___MIBundleContainer,  "appBundleContainerWithIdentifier:createIfNeeded:created:error:",  v11,  0LL,  0LL,  &v23));
      id v15 = v23;
      uint64_t v16 = v15;
      if (v14)
      {
        id v22 = v15;
        uint64_t v17 = objc_claimAutoreleasedReturnValue([v14 bundleMetadataWithError:&v22]);
        id v18 = v22;

        uint64_t v16 = v18;
      }

      else
      {
        uint64_t v17 = 0LL;
      }

      id v9 = v16;
      sub_10004D608(v6);
      id v10 = (id)v17;
    }

    else
    {
      id v19 = sub_1000130F4( (uint64_t)"-[MIClientConnection getAppMetadataForApp:completion:]",  2283LL,  MIInstallerErrorDomain,  25LL,  0LL,  0LL,  @"bundleID parameter was not a string",  v12,  v20);
      id v9 = (void *)objc_claimAutoreleasedReturnValue(v19);
    }
  }

  v7[2](v7, v10, v9);
}

- (void)setSystemAppMigrationComplete:(id)a3
{
  id v9 = (void (**)(id, void *))a3;
  id v4 = sub_100014CC8(self, @"SetSystemAppMigrationComplete");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (!v5)
  {
    uint64_t v6 = qword_100095BF8;
    if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIClientConnection clientName](self, "clientName"));
      MOLogWrite(v6);
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[MISystemAppMigrationState defaultManager]( &OBJC_CLASS___MISystemAppMigrationState,  "defaultManager",  v8));
    [v7 setSystemAppMigrationComplete:1];

    id v5 = 0LL;
  }

  v9[2](v9, v5);
}

- (void)waitForSystemAppMigratorToComplete:(id)a3
{
  exc_buf = (void (**)(id, void *))a3;
  id v4 = sub_100014CC8(self, @"WaitForSystemAppMigrationToComplete");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (v5)
  {
    exc_buf[2](exc_buf, v5);
  }

  else
  {
    uint64_t v6 = qword_100095BF8;
    if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIClientConnection clientName](self, "clientName"));
      MOLogWrite(v6);
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[MISystemAppMigrationState defaultManager]( &OBJC_CLASS___MISystemAppMigrationState,  "defaultManager",  v8));
    [v7 waitForSystemAppMigrationToComplete:exc_buf];

    id v5 = 0LL;
  }
}

- (void)systemAppMigratorHasCompleted:(id)a3
{
  id v10 = (void (**)(id, id, void *))a3;
  id v4 = sub_100014CC8(self, @"GetSystemAppMigrationStatus");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (v5)
  {
    id v6 = 0LL;
  }

  else
  {
    uint64_t v7 = qword_100095BF8;
    if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MIClientConnection clientName](self, "clientName"));
      MOLogWrite(v7);
    }

    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[MISystemAppMigrationState defaultManager]( &OBJC_CLASS___MISystemAppMigrationState,  "defaultManager",  v9));
    id v6 = [v8 systemAppMigrationComplete];

    id v5 = 0LL;
  }

  v10[2](v10, v6, v5);
}

- (void)finalizeReference:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, uint64_t, void))a4;
  uint64_t v60 = 0LL;
  uint64_t v61 = (id *)&v60;
  uint64_t v62 = 0x3032000000LL;
  char v63 = sub_100015924;
  uint64_t v64 = sub_100015934;
  id v65 = 0LL;
  uint64_t v54 = 0LL;
  unint64_t v55 = &v54;
  uint64_t v56 = 0x3032000000LL;
  id v57 = sub_100015924;
  id v58 = sub_100015934;
  id v59 = 0LL;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 identity]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 bundleID]);
  id v10 = sub_100014CC8(self, @"InstallForInstallCoordination");
  uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);
  id v12 = v61[5];
  v61[5] = (id)v11;

  if (v61[5]) {
    goto LABEL_2;
  }
  if ((+[ICLFeatureFlags appReferencesEnabled](&OBJC_CLASS___ICLFeatureFlags, "appReferencesEnabled") & 1) == 0)
  {
    id v31 = sub_1000130F4( (uint64_t)"-[MIClientConnection finalizeReference:completion:]",  2554LL,  MIInstallerErrorDomain,  161LL,  0LL,  0LL,  @"%s is not enabled",  v16,  (uint64_t)"-[MIClientConnection finalizeReference:completion:]");
    uint64_t v32 = objc_claimAutoreleasedReturnValue(v31);
    uint64_t v13 = 0LL;
    uint64_t v14 = 0LL;
    id v15 = 0LL;
    id v30 = v61[5];
    v61[5] = (id)v32;
LABEL_16:

    goto LABEL_21;
  }

  uint64_t v17 = v61;
  id obj = v61[5];
  unsigned int v18 = +[MIAppReference validateAppReference:withError:]( &OBJC_CLASS___MIAppReference,  "validateAppReference:withError:",  v6,  &obj);
  objc_storeStrong(v17 + 5, obj);
  if (!v18)
  {
LABEL_2:
    uint64_t v13 = 0LL;
    uint64_t v14 = 0LL;
    id v15 = 0LL;
    goto LABEL_21;
  }

  sub_10004D4E4(v9);
  id v19 = [v6 domain];
  uint64_t v20 = v61;
  id v52 = v61[5];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[MIBundleContainer appBundleContainerForIdentifier:inDomain:withError:]( &OBJC_CLASS___MIBundleContainer,  "appBundleContainerForIdentifier:inDomain:withError:",  v9,  v19,  &v52));
  objc_storeStrong(v20 + 5, v52);
  if (!v14) {
    goto LABEL_18;
  }
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v14 bundle]);
  if (!v13)
  {
    id v33 = sub_1000130F4( (uint64_t)"-[MIClientConnection finalizeReference:completion:]",  2572LL,  MIInstallerErrorDomain,  36LL,  0LL,  0LL,  @"Failed to find bundle in bundle container %@ for %@",  v21,  (uint64_t)v14);
    uint64_t v34 = objc_claimAutoreleasedReturnValue(v33);
    id v35 = v61[5];
    v61[5] = (id)v34;

LABEL_18:
    uint64_t v13 = 0LL;
    goto LABEL_19;
  }

  id v22 = v61;
  id v51 = v61[5];
  unsigned int v23 = [v8 resolvePersonaWithError:&v51];
  objc_storeStrong(v22 + 5, v51);
  if (!v23)
  {
LABEL_19:
    id v28 = 0LL;
    id v25 = 0LL;
    goto LABEL_20;
  }

  location = (id *)objc_claimAutoreleasedReturnValue([v8 personaUniqueString]);
  id v24 = v61;
  id v50 = v61[5];
  id v25 = (void *)objc_claimAutoreleasedReturnValue( +[MILaunchServicesDatabaseGatherer fetchInfoForBundle:forPersona:inContainer:withError:]( &OBJC_CLASS___MILaunchServicesDatabaseGatherer,  "fetchInfoForBundle:forPersona:inContainer:withError:",  v13,  location,  v14,  &v50));
  objc_storeStrong(v24 + 5, v50);

  if (v25)
  {
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(+[MIAppReferenceManager defaultManager](&OBJC_CLASS___MIAppReferenceManager, "defaultManager"));
    locationa = v61 + 5;
    id v48 = v61[5];
    id v49 = 0LL;
    unsigned int v37 = [v26 finalizeTemporaryReference:v6 resultingPersonaUniqueStrings:&v49 error:&v48];
    uint64_t v27 = v26;
    id v28 = v49;
    objc_storeStrong(locationa, v48);

    if (v37)
    {
      sub_10004D608(v9);
      id v29 = sub_10000D8B4();
      locationb = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v29);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10001DDA0;
      block[3] = &unk_100081310;
      unint64_t v46 = &v54;
      id v15 = v25;
      id v42 = v15;
      id v43 = v9;
      id v30 = v28;
      id v44 = v30;
      id v45 = v6;
      id v47 = &v60;
      dispatch_sync(locationb, block);

      goto LABEL_16;
    }
  }

  else
  {
    id v28 = 0LL;
  }

- (void)acquireReferenceforInstalledAppWithIdentity:(id)a3 inDomain:(unint64_t)a4 matchingInstallSessionID:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v56 = a5;
  uint64_t v11 = (void (**)(id, void, id))a6;
  id v12 = sub_100014CC8(self, @"InstallForInstallCoordination");
  id v13 = (id)objc_claimAutoreleasedReturnValue(v12);
  if (v13)
  {
    uint64_t v14 = 0LL;
    id v15 = 0LL;
    uint64_t v16 = 0LL;
LABEL_31:
    v11[2](v11, 0LL, v13);
    id v44 = 0LL;
    goto LABEL_32;
  }

  if ((+[ICLFeatureFlags appReferencesEnabled](&OBJC_CLASS___ICLFeatureFlags, "appReferencesEnabled") & 1) == 0)
  {
    id v43 = sub_1000130F4( (uint64_t)"-[MIClientConnection acquireReferenceforInstalledAppWithIdentity:inDomain:matchingInstallSessionID:completion:]",  2643LL,  MIInstallerErrorDomain,  161LL,  0LL,  0LL,  @"%s is not enabled",  v17,  (uint64_t)"-[MIClientConnection acquireReferenceforInstalledAppWithIdentity:inDomain:matchingInstallSessionID:completion:]");
    id v13 = (id)objc_claimAutoreleasedReturnValue(v43);
    uint64_t v14 = 0LL;
    id v15 = 0LL;
    uint64_t v16 = 0LL;
    goto LABEL_31;
  }

  id v61 = 0LL;
  unsigned int v18 = +[MIAppIdentity validateAppIdentity:withError:]( &OBJC_CLASS___MIAppIdentity,  "validateAppIdentity:withError:",  v10,  &v61);
  id v19 = v61;
  uint64_t v20 = v19;
  if (!v18)
  {
    uint64_t v14 = 0LL;
    id v15 = 0LL;
    uint64_t v16 = 0LL;
    id v13 = v19;
    goto LABEL_31;
  }

  uint64_t v21 = (const void *)objc_claimAutoreleasedReturnValue([v10 bundleID]);
  sub_10004D4E4(v21);
  id v60 = v20;
  unsigned int v22 = [v10 resolvePersonaWithError:&v60];
  unint64_t v55 = (void *)v21;
  id v13 = v60;

  if (!v22)
  {
    id v44 = 0LL;
    uint64_t v16 = 0LL;
    id v15 = 0LL;
    uint64_t v14 = 0LL;
    goto LABEL_27;
  }

  uint64_t v23 = objc_claimAutoreleasedReturnValue([v10 bundleID]);
  if (a4 == 3) {
    uint64_t v24 = 2LL;
  }
  else {
    uint64_t v24 = 3LL;
  }
  id v59 = v13;
  unsigned __int8 v25 = -[MIClientConnection _validateAppWithBundleID:isNotInstalledInDomain:error:]( self,  "_validateAppWithBundleID:isNotInstalledInDomain:error:",  v23,  v24,  &v59);
  uint64_t v26 = (void *)v23;
  id v27 = v59;

  if ((v25 & 1) == 0)
  {
    id v44 = 0LL;
    uint64_t v16 = 0LL;
    id v15 = 0LL;
    uint64_t v14 = 0LL;
    id v13 = v27;
    goto LABEL_27;
  }

  if (a4 == 1) {
    unint64_t v28 = 2LL;
  }
  else {
    unint64_t v28 = a4;
  }
  v58[1] = v27;
  unint64_t v53 = v28;
  id v29 = (void *)objc_claimAutoreleasedReturnValue( +[MIBundleContainer appBundleContainerForIdentifier:inDomain:withError:]( &OBJC_CLASS___MIBundleContainer,  "appBundleContainerForIdentifier:inDomain:withError:",  v21));
  id v30 = v27;

  if (v29)
  {
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v29 bundle]);
    v58[0] = v30;
    id v33 = (void *)objc_claimAutoreleasedReturnValue([v32 installationIdentitySettingIfNotSet:0 withError:v58]);
    uint64_t v54 = v29;
    id v34 = v58[0];

    if (v33)
    {
      id v51 = v34;
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v33 installSessionID]);
      uint64_t v36 = v33;
      if (([v14 isEqualToData:v56] & 1) == 0)
      {
        id v50 = sub_1000130F4( (uint64_t)"-[MIClientConnection acquireReferenceforInstalledAppWithIdentity:inDomain:matchingInstallSessio nID:completion:]",  2686LL,  MIInstallerErrorDomain,  184LL,  0LL,  0LL,  @"Installation session IDs did not match for %@",  v35,  (uint64_t)v10);
        id v40 = (id)objc_claimAutoreleasedReturnValue(v50);
        id v45 = 0LL;
        id v30 = v51;
        goto LABEL_25;
      }

      id v52 = (void *)objc_claimAutoreleasedReturnValue(+[MIAppReferenceManager defaultManager](&OBJC_CLASS___MIAppReferenceManager, "defaultManager"));
      unsigned int v37 = (void *)objc_claimAutoreleasedReturnValue(-[MIClientConnection xpcConnection](self, "xpcConnection"));
      id v57 = v34;
      uint64_t v38 = objc_claimAutoreleasedReturnValue( objc_msgSend( v52,  "addTemporaryReferenceForIdentity:inDomain:forUserWithID:error:",  v10,  v53,  objc_msgSend(v37, "effectiveUserIdentifier"),  &v57));
      uint64_t v39 = v37;
      id v40 = v57;

      id v41 = v39;
      uint64_t v42 = v38;
    }

    else
    {
      id v41 = v34;
      id v52 = (void *)objc_claimAutoreleasedReturnValue([v29 bundle]);
      uint64_t v42 = 0LL;
      id v49 = sub_1000130F4( (uint64_t)"-[MIClientConnection acquireReferenceforInstalledAppWithIdentity:inDomain:matchingInstallSessionID:completion:]",  2680LL,  MIInstallerErrorDomain,  4LL,  v34,  0LL,  @"Failed to fetch installation identity for %@",  v48,  (uint64_t)v52);
      id v40 = (id)objc_claimAutoreleasedReturnValue(v49);
      uint64_t v36 = 0LL;
      uint64_t v14 = 0LL;
    }

    id v30 = v52;
    id v45 = (void *)v42;
LABEL_25:
    id v47 = v54;
    goto LABEL_26;
  }

  id v45 = 0LL;
  id v46 = sub_1000130F4( (uint64_t)"-[MIClientConnection acquireReferenceforInstalledAppWithIdentity:inDomain:matchingInstallSessionID:completion:]",  2673LL,  MIInstallerErrorDomain,  26LL,  v30,  0LL,  @"Could not find installed app with identity %@ in domain %lu",  v31,  (uint64_t)v10);
  id v40 = (id)objc_claimAutoreleasedReturnValue(v46);
  id v47 = 0LL;
  uint64_t v36 = 0LL;
  uint64_t v14 = 0LL;
LABEL_26:

  id v13 = v40;
  id v44 = v45;
  uint64_t v16 = v47;
  id v15 = v36;
LABEL_27:
  if (v55)
  {
    sub_10004D608(v55);
  }

  if (!v44) {
    goto LABEL_31;
  }
  ((void (**)(id, void *, id))v11)[2](v11, v44, 0LL);
LABEL_32:
}

- (void)invalidateReference:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, uint64_t))a4;
  id v8 = sub_100014CC8(self, @"InstallForInstallCoordination");
  uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);
  if (v9) {
    goto LABEL_6;
  }
  if ((+[ICLFeatureFlags appReferencesEnabled](&OBJC_CLASS___ICLFeatureFlags, "appReferencesEnabled") & 1) == 0)
  {
    id v16 = sub_1000130F4( (uint64_t)"-[MIClientConnection invalidateReference:completion:]",  2726LL,  MIInstallerErrorDomain,  161LL,  0LL,  0LL,  @"%s is not enabled",  v10,  (uint64_t)"-[MIClientConnection invalidateReference:completion:]");
    uint64_t v9 = objc_claimAutoreleasedReturnValue(v16);
LABEL_6:
    id v15 = (void *)v9;
    v7[2](v7, v9);
    goto LABEL_7;
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 identity]);
  unsigned int v18 = v11;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v18, 1LL));
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[MIUninstaller uninstallerForIdentities:withOptions:forClient:]( &OBJC_CLASS___MIUninstaller,  "uninstallerForIdentities:withOptions:forClient:",  v12,  0LL,  self));

  id v17 = 0LL;
  LODWORD(v12) = [v13 performUninstallationByRevokingTemporaryReference:v6 error:&v17];
  id v14 = v17;
  id v15 = v14;
  if ((_DWORD)v12)
  {

    id v15 = 0LL;
  }

  else if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
  {
    MOLogWrite(qword_100095BF8);
  }

  v7[2](v7, (uint64_t)v15);

LABEL_7:
}

- (void)referencesForBundleWithIdentifier:(id)a3 inDomain:(unint64_t)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = (void (**)(id, void, id))a5;
  if ((+[ICLFeatureFlags appReferencesEnabled](&OBJC_CLASS___ICLFeatureFlags, "appReferencesEnabled") & 1) == 0)
  {
    id v13 = sub_1000130F4( (uint64_t)"-[MIClientConnection referencesForBundleWithIdentifier:inDomain:completion:]",  2747LL,  MIInstallerErrorDomain,  161LL,  0LL,  0LL,  @"%s is not enabled",  v9,  (uint64_t)"-[MIClientConnection referencesForBundleWithIdentifier:inDomain:completion:]");
    id v12 = (id)objc_claimAutoreleasedReturnValue(v13);
    goto LABEL_5;
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[MIAppReferenceManager defaultManager](&OBJC_CLASS___MIAppReferenceManager, "defaultManager"));
  id v14 = 0LL;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 referencesForIdentifier:v7 inDomain:a4 error:&v14]);
  id v12 = v14;

  if (!v11)
  {
LABEL_5:
    v8[2](v8, 0LL, v12);
    goto LABEL_6;
  }

  ((void (**)(id, void *, id))v8)[2](v8, v11, 0LL);

LABEL_6:
}

- (void)setDataSeparatedAppsWithBundleIDs:(id)a3 withPersona:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v33 = a4;
  id v30 = v8;
  uint64_t v31 = (void (**)(id, id))a5;
  unint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v8 allObjects]);
  id v27 = (void *)objc_claimAutoreleasedReturnValue(+[MIUserManagement sharedInstance](&OBJC_CLASS___MIUserManagement, "sharedInstance"));
  id v29 = (void *)objc_claimAutoreleasedReturnValue([v27 primaryPersonaUniqueString]);
  if ((sub_100015E74(self) & 1) == 0)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MIClientConnection clientName](self, "clientName"));
    id v12 = sub_1000130F4( (uint64_t)"-[MIClientConnection setDataSeparatedAppsWithBundleIDs:withPersona:withCompletion:]",  2783LL,  MIInstallerErrorDomain,  2LL,  0LL,  &off_10008A908,  @"Process %@ tried to set persona %@ for data separated apps %@, can only be done by InstallCoordination.",  v11,  (uint64_t)v10);
    uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);

    id v9 = (id)v13;
    goto LABEL_5;
  }

  if ([v29 isEqualToString:v33])
  {
    id v9 = 0LL;
LABEL_5:

    goto LABEL_21;
  }

  sub_10004D4EC(v28);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v8 allObjects]);
  id v39 = 0LL;
  unsigned int v15 = [v27 setBundleIdentifiers:v14 forPersonaUniqueString:v33 error:&v39];
  id v9 = v39;

  if (v15)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[MILaunchServicesOperationManager instanceForCurrentUser]( &OBJC_CLASS___MILaunchServicesOperationManager,  "instanceForCurrentUser"));
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    id obj = v30;
    id v17 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v36;
      do
      {
        for (i = 0LL; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v36 != v18) {
            objc_enumerationMutation(obj);
          }
          uint64_t v20 = *(void *)(*((void *)&v35 + 1) + 8LL * (void)i);
          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v33, v24, v25, v26));
          id v34 = v9;
          unsigned __int8 v22 = [v16 setPersonaUniqueStrings:v21 forAppBundleID:v20 inDomain:2 error:&v34];
          id v23 = v34;

          id v9 = v23;
          if ((v22 & 1) == 0)
          {
            if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
            {
              id v25 = v33;
              id v26 = v23;
              uint64_t v24 = v20;
              MOLogWrite(qword_100095BF8);
            }

            id v9 = 0LL;
          }
        }

        id v17 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
      }

      while (v17);
    }
  }

  sub_10004D608(v28);
LABEL_21:
  v31[2](v31, v9);
}

- (void)addDataSeparatedAppsWithBundleIDs:(id)a3 toPersona:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v38 = a4;
  __int128 v36 = (void (**)(id, id))a5;
  id v34 = v8;
  __int128 v35 = (void *)objc_claimAutoreleasedReturnValue([v8 allObjects]);
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(+[MIUserManagement sharedInstance](&OBJC_CLASS___MIUserManagement, "sharedInstance"));
  id v33 = (void *)objc_claimAutoreleasedReturnValue([v32 primaryPersonaUniqueString]);
  if ((sub_100015E74(self) & 1) != 0)
  {
    if ([v33 isEqualToString:v38])
    {
      id v9 = 0LL;
      uint64_t v10 = 0LL;
      char v11 = 0;
      id v12 = 0LL;
    }

    else
    {
      sub_10004D4EC(v35);
      id v45 = 0LL;
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v32 bundleIDsAssociatedWithPersonaUniqueString:v38 error:&v45]);
      id v12 = v45;
      id v31 = [v17 mutableCopy];

      if (v31)
      {
        [v31 unionSet:v34];
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v31 allObjects]);
        id v44 = v12;
        unsigned int v19 = [v32 setBundleIdentifiers:v18 forPersonaUniqueString:v38 error:&v44];
        id v20 = v44;

        if (v19)
        {
          id v9 = (void *)objc_claimAutoreleasedReturnValue( +[MILaunchServicesOperationManager instanceForCurrentUser]( &OBJC_CLASS___MILaunchServicesOperationManager,  "instanceForCurrentUser"));
          __int128 v42 = 0u;
          __int128 v43 = 0u;
          __int128 v40 = 0u;
          __int128 v41 = 0u;
          id obj = v34;
          id v21 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
          if (v21)
          {
            uint64_t v22 = *(void *)v41;
            do
            {
              for (i = 0LL; i != v21; i = (char *)i + 1)
              {
                if (*(void *)v41 != v22) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v24 = *(void *)(*((void *)&v40 + 1) + 8LL * (void)i);
                id v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v38, v28, v29, v30));
                id v39 = v20;
                unsigned __int8 v26 = [v9 setPersonaUniqueStrings:v25 forAppBundleID:v24 inDomain:2 error:&v39];
                id v27 = v39;

                id v20 = v27;
                if ((v26 & 1) == 0)
                {
                  if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
                  {
                    id v29 = v38;
                    id v30 = v27;
                    uint64_t v28 = v24;
                    MOLogWrite(qword_100095BF8);
                  }

                  id v20 = 0LL;
                }
              }

              id v21 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
            }

            while (v21);
          }
        }

        else
        {
          id v9 = 0LL;
        }

        char v11 = 1;
        id v12 = v20;
        uint64_t v10 = v31;
      }

      else
      {
        id v9 = 0LL;
        uint64_t v10 = 0LL;
        char v11 = 1;
      }
    }
  }

  else
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[MIClientConnection clientName](self, "clientName"));
    id v15 = sub_1000130F4( (uint64_t)"-[MIClientConnection addDataSeparatedAppsWithBundleIDs:toPersona:withCompletion:]",  2841LL,  MIInstallerErrorDomain,  2LL,  0LL,  &off_10008A930,  @"Process %@ tried to set persona %@ for data separated apps %@, can only be done by InstallCoordination.",  v14,  (uint64_t)v13);
    uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);

    id v9 = 0LL;
    uint64_t v10 = 0LL;
    char v11 = 0;
    id v12 = (id)v16;
  }

  if ((v11 & 1) != 0) {
    sub_10004D608(v35);
  }
  v36[2](v36, v12);
}

- (void)removeDataSeparatedAppsWithBundleIDs:(id)a3 fromPersona:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v36 = a4;
  __int128 v35 = (void (**)(id, id))a5;
  id v33 = v8;
  id v34 = (void *)objc_claimAutoreleasedReturnValue([v8 allObjects]);
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(+[MIUserManagement sharedInstance](&OBJC_CLASS___MIUserManagement, "sharedInstance"));
  id v38 = (void *)objc_claimAutoreleasedReturnValue([v32 primaryPersonaUniqueString]);
  if ((sub_100015E74(self) & 1) != 0)
  {
    if ([v38 isEqualToString:v36])
    {
      id v9 = 0LL;
      uint64_t v10 = 0LL;
      char v11 = 0;
      id v12 = 0LL;
    }

    else
    {
      sub_10004D4EC(v34);
      id v45 = 0LL;
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v32 bundleIDsAssociatedWithPersonaUniqueString:v36 error:&v45]);
      id v12 = v45;
      id v31 = [v17 mutableCopy];

      if (v31)
      {
        [v31 minusSet:v8];
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v31 allObjects]);
        id v44 = v12;
        unsigned int v19 = [v32 setBundleIdentifiers:v18 forPersonaUniqueString:v36 error:&v44];
        id v20 = v44;

        if (v19)
        {
          id v9 = (void *)objc_claimAutoreleasedReturnValue( +[MILaunchServicesOperationManager instanceForCurrentUser]( &OBJC_CLASS___MILaunchServicesOperationManager,  "instanceForCurrentUser"));
          __int128 v42 = 0u;
          __int128 v43 = 0u;
          __int128 v40 = 0u;
          __int128 v41 = 0u;
          id obj = v8;
          id v21 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
          if (v21)
          {
            uint64_t v22 = *(void *)v41;
            do
            {
              for (i = 0LL; i != v21; i = (char *)i + 1)
              {
                if (*(void *)v41 != v22) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v24 = *(void *)(*((void *)&v40 + 1) + 8LL * (void)i);
                id v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v38, v28, v29, v30));
                id v39 = v20;
                unsigned __int8 v26 = [v9 setPersonaUniqueStrings:v25 forAppBundleID:v24 inDomain:2 error:&v39];
                id v27 = v39;

                id v20 = v27;
                if ((v26 & 1) == 0)
                {
                  if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
                  {
                    id v29 = v36;
                    id v30 = v27;
                    uint64_t v28 = v24;
                    MOLogWrite(qword_100095BF8);
                  }

                  id v20 = 0LL;
                }
              }

              id v21 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
            }

            while (v21);
          }
        }

        else
        {
          id v9 = 0LL;
        }

        char v11 = 1;
        id v12 = v20;
        uint64_t v10 = v31;
      }

      else
      {
        id v9 = 0LL;
        uint64_t v10 = 0LL;
        char v11 = 1;
      }
    }
  }

  else
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[MIClientConnection clientName](self, "clientName"));
    id v15 = sub_1000130F4( (uint64_t)"-[MIClientConnection removeDataSeparatedAppsWithBundleIDs:fromPersona:withCompletion:]",  2905LL,  MIInstallerErrorDomain,  2LL,  0LL,  &off_10008A958,  @"Process %@ tried to set persona %@ for data separated apps %@, can only be done by InstallCoordination.",  v14,  (uint64_t)v13);
    uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);

    id v9 = 0LL;
    uint64_t v10 = 0LL;
    char v11 = 0;
    id v12 = (id)v16;
  }

  if ((v11 & 1) != 0) {
    sub_10004D608(v34);
  }
  v35[2](v35, v12);
}

- (void)linkedBundleIDsForAppIdentity:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, id))a4;
  if ((sub_100015E74(self) & 1) != 0)
  {
    id v9 = (const void *)objc_claimAutoreleasedReturnValue([v6 bundleID]);
    sub_10004D4EC(v9);
    id v22 = 0LL;
    unsigned int v10 = [v6 resolvePersonaWithError:&v22];
    id v11 = v22;
    if (v10)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue( +[MIContainerLinkManager sharedInstanceForDomain:]( &OBJC_CLASS___MIContainerLinkManager,  "sharedInstanceForDomain:",  2LL));
      id v21 = v11;
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 childrenForParentBundleID:v9 error:&v21]);
      id v14 = v21;

      if (v13)
      {
        id v11 = v14;
      }

      else
      {
        id v18 = sub_1000130F4( (uint64_t)"-[MIClientConnection linkedBundleIDsForAppIdentity:withCompletion:]",  2979LL,  MIInstallerErrorDomain,  4LL,  v14,  0LL,  @"Failed to query linked children for %@",  v15,  (uint64_t)v6);
        uint64_t v19 = objc_claimAutoreleasedReturnValue(v18);

        uint64_t v13 = 0LL;
        id v11 = (id)v19;
      }
    }

    else
    {
      uint64_t v13 = 0LL;
    }

    uint64_t v16 = (void *)v9;
    sub_10004D608(v9);
  }

  else
  {
    uint64_t v16 = 0LL;
    id v17 = sub_1000130F4( (uint64_t)"-[MIClientConnection linkedBundleIDsForAppIdentity:withCompletion:]",  2965LL,  MIInstallerErrorDomain,  2LL,  0LL,  &off_10008A980,  &stru_100082BD0,  v8,  v20);
    id v11 = (id)objc_claimAutoreleasedReturnValue(v17);
    uint64_t v13 = 0LL;
  }

  v7[2](v7, v13, v11);
}

- (void)getPidForTestingWithCompletion:(id)a3
{
  id v5 = a3;
  uint64_t v4 = getpid();
  (*((void (**)(id, uint64_t))a3 + 2))(v5, v4);
}

- (void)dieForTesting
{
  id v3 = sub_100014CC8(self, @"UnitTestRunner");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (!v4)
  {
    uint64_t v5 = qword_100095BF8;
    if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MIClientConnection clientName](self, "clientName"));
      MOLogWrite(v5);
    }

    exit(1);
  }
}

- (void)raiseExceptionWithCompletion:(id)a3
{
  uint64_t v8 = (void (**)(id, uint64_t))a3;
  id v4 = sub_100014CC8(self, @"UnitTestRunner");
  uint64_t v5 = objc_claimAutoreleasedReturnValue(v4);
  if (v5)
  {
    id v6 = (void *)v5;
    v8[2](v8, v5);
  }

  else
  {
    id v7 = objc_alloc(&OBJC_CLASS___NSException);
    objc_exception_throw( -[NSException initWithName:reason:userInfo:]( v7, "initWithName:reason:userInfo:", NSGenericException, MITestExceptionReasonString, 0LL));
    __break(1u);
  }

- (void)setTestModeWithCompletion:(id)a3
{
  id v4 = (void (**)(id, id))a3;
  id v5 = sub_100014CC8(self, @"UnitTestRunner");
  id v6 = (id)objc_claimAutoreleasedReturnValue(v5);
  if (!v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[MITestManager sharedInstance](&OBJC_CLASS___MITestManager, "sharedInstance"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIClientConnection xpcConnection](self, "xpcConnection"));
    id v10 = 0LL;
    unsigned int v9 = objc_msgSend( v7,  "setIsRunningInTestModeForProcessWithPID:withError:",  objc_msgSend(v8, "processIdentifier"),  &v10);
    id v6 = v10;

    if (v9)
    {

      id v6 = 0LL;
    }
  }

  v4[2](v4, v6);
}

- (void)endTestModeWithCompletion:(id)a3
{
  id v4 = (void (**)(id, id))a3;
  id v5 = sub_100014CC8(self, @"UnitTestRunner");
  id v6 = (id)objc_claimAutoreleasedReturnValue(v5);
  if (!v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[MITestManager sharedInstance](&OBJC_CLASS___MITestManager, "sharedInstance"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIClientConnection xpcConnection](self, "xpcConnection"));
    id v10 = 0LL;
    unsigned int v9 = objc_msgSend( v7,  "clearIsRunningInTestModeForProcessWithPID:withError:",  objc_msgSend(v8, "processIdentifier"),  &v10);
    id v6 = v10;

    if (v9)
    {

      id v6 = 0LL;
    }
  }

  v4[2](v4, v6);
}

- (void)getTestModeWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void, id))a3;
  unsigned __int8 v10 = 0;
  id v5 = sub_100014CC8(self, @"UnitTestRunner");
  id v6 = (id)objc_claimAutoreleasedReturnValue(v5);
  if (!v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[MITestManager sharedInstance](&OBJC_CLASS___MITestManager, "sharedInstance"));
    id v9 = 0LL;
    unsigned int v8 = [v7 isRunningInTestMode:&v10 outError:&v9];
    id v6 = v9;

    if (v8)
    {

      id v6 = 0LL;
    }
  }

  v4[2](v4, v10, v6);
}

- (void)setTestFlags:(unint64_t)a3 withCompletion:(id)a4
{
  id v6 = (void (**)(id, id))a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[MITestManager sharedInstance](&OBJC_CLASS___MITestManager, "sharedInstance"));
  id v8 = sub_100014CC8(self, @"UnitTestRunner");
  id v9 = (id)objc_claimAutoreleasedReturnValue(v8);
  if (!v9)
  {
    char v15 = 0;
    id v14 = 0LL;
    unsigned int v10 = [v7 isRunningInTestMode:&v15 outError:&v14];
    id v9 = v14;
    if (v10)
    {
      if (v15)
      {
        [v7 setTestFlags:a3];
      }

      else
      {
        id v12 = sub_1000130F4( (uint64_t)"-[MIClientConnection setTestFlags:withCompletion:]",  3099LL,  MIInstallerErrorDomain,  4LL,  0LL,  0LL,  @"Can't set test flags because installd is not in test mode.",  v11,  (uint64_t)v14);
        uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);

        id v9 = (id)v13;
      }
    }
  }

  v6[2](v6, v9);
}

- (void)clearTestFlags:(unint64_t)a3 withCompletion:(id)a4
{
  id v6 = (void (**)(id, id))a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[MITestManager sharedInstance](&OBJC_CLASS___MITestManager, "sharedInstance"));
  id v8 = sub_100014CC8(self, @"UnitTestRunner");
  id v9 = (id)objc_claimAutoreleasedReturnValue(v8);
  if (!v9)
  {
    char v15 = 0;
    id v14 = 0LL;
    unsigned int v10 = [v7 isRunningInTestMode:&v15 outError:&v14];
    id v9 = v14;
    if (v10)
    {
      if (v15)
      {
        [v7 clearTestFlags:a3];
      }

      else
      {
        id v12 = sub_1000130F4( (uint64_t)"-[MIClientConnection clearTestFlags:withCompletion:]",  3128LL,  MIInstallerErrorDomain,  4LL,  0LL,  0LL,  @"Can't clear test flags because installd is not in test mode.",  v11,  (uint64_t)v14);
        uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);

        id v9 = (id)v13;
      }
    }
  }

  v6[2](v6, v9);
}

- (void)setEligibilityTestOverrides:(id)a3 withCompletion:(id)a4
{
  id v15 = a3;
  id v6 = (void (**)(id, void *))a4;
  id v7 = sub_100014CC8(self, @"UnitTestRunner");
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if (!v8)
  {
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSNumber);
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((sub_100013684(v15, v9, v10) & 1) != 0)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(+[MIEligibilityManager sharedInstance](&OBJC_CLASS___MIEligibilityManager, "sharedInstance"));
      [v12 setTestOverrides:v15];

      id v8 = 0LL;
    }

    else
    {
      id v13 = sub_1000130F4( (uint64_t)"-[MIClientConnection setEligibilityTestOverrides:withCompletion:]",  3150LL,  MIInstallerErrorDomain,  25LL,  0LL,  0LL,  @"Supplied dictionary had non-number keys or values.",  v11,  v14);
      id v8 = (void *)objc_claimAutoreleasedReturnValue(v13);
    }
  }

  v6[2](v6, v8);
}

- (void)_triggerRegistrationForContent:(unint64_t)a3 registrationOptions:(id)a4 writeLock:(BOOL)a5 withCompletion:(id)a6
{
  BOOL v7 = a5;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void))a6;
  uint64_t v32 = 0LL;
  id v33 = &v32;
  uint64_t v34 = 0x3032000000LL;
  __int128 v35 = sub_100015924;
  id v36 = sub_100015934;
  id v37 = 0LL;
  id v11 = [v9 targetUID];
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[MITestManager sharedInstance](&OBJC_CLASS___MITestManager, "sharedInstance"));
  char v31 = 0;
  unsigned int v13 = [v12 isRunningInTestMode:&v31 outError:0];
  if (v31) {
    unsigned int v14 = v13;
  }
  else {
    unsigned int v14 = 0;
  }
  if (v14 == 1)
  {
    if ([v12 testFlagsAreSet:2])
    {
      id v16 = sub_1000130F4( (uint64_t)"-[MIClientConnection _triggerRegistrationForContent:registrationOptions:writeLock:withCompletion:]",  3178LL,  MIInstallerErrorDomain,  4LL,  0LL,  0LL,  @"Triggering registration with test mode enabled",  v15,  v27);
      uint64_t v17 = objc_claimAutoreleasedReturnValue(v16);
      id v18 = (void *)v33[5];
      v33[5] = v17;

LABEL_18:
      v10[2](v10, v33[5]);
      goto LABEL_19;
    }

    if ([v12 testFlagsAreSet:16])
    {
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 testFileSentinelForSyncURL]);

      id v21 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager"));
      [v21 removeItemAtURL:v20 error:0];
    }
  }

  if (v7) {
    sub_10004DBC0();
  }
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_1000204A0;
  v29[3] = &unk_100081338;
  int v30 = (int)v11;
  v29[4] = &v32;
  id v22 = -[MIReferenceAwareLSDatabaseGatherer initWithOptions:forTargetUID:enumerator:]( objc_alloc(&OBJC_CLASS___MIReferenceAwareLSDatabaseGatherer),  "initWithOptions:forTargetUID:enumerator:",  a3,  v11,  v29);
  id v23 = (id *)(v33 + 5);
  id obj = (id)v33[5];
  unsigned int v24 = -[MIReferenceAwareLSDatabaseGatherer performGatherWithError:](v22, "performGatherWithError:", &obj);
  objc_storeStrong(v23, obj);

  if (v7) {
    sub_10004DBC8(v25, v26);
  }
  if (!v24) {
    goto LABEL_18;
  }
  v10[2](v10, 0LL);
LABEL_19:
  _Block_object_dispose(&v32, 8);
}

- (void)triggerRegistrationForContainerizedContentForOptions:(id)a3 withCompletion:(id)a4
{
}

- (void)triggerRegistrationForDiskImageContentForOptions:(id)a3 withCompletion:(id)a4
{
}

- (void)createSerializedPlaceholderForInstalledAppWithBundeID:(id)a3 personaUniqueString:(id)a4 atResultURL:(id)a5 onDevice:(int)a6 withCompletion:(id)a7
{
  uint64_t v8 = *(void *)&a6;
  id v12 = a3;
  id v32 = a4;
  id v13 = a5;
  unsigned int v14 = (void (**)(id, id))a7;
  id v15 = sub_100014CC8(self, @"CreateSerializedPlaceholder");
  id v16 = (id)objc_claimAutoreleasedReturnValue(v15);
  if (v16)
  {
    uint64_t v17 = 0LL;
LABEL_22:
    v14[2](v14, v16);
    goto LABEL_23;
  }

  objc_opt_class(&OBJC_CLASS___NSString);
  id v18 = v12;
  if ((objc_opt_isKindOfClass(v18) & 1) != 0) {
    id v19 = v18;
  }
  else {
    id v19 = 0LL;
  }

  if (!v19)
  {
    id v23 = @"Bundle ID parameter was not a string or was set to nil";
    uint64_t v24 = 3263LL;
LABEL_15:
    uint64_t v17 = 0LL;
    id v25 = sub_1000130F4( (uint64_t)"-[MIClientConnection createSerializedPlaceholderForInstalledAppWithBundeID:personaUniqueString:atRe sultURL:onDevice:withCompletion:]",  v24,  MIInstallerErrorDomain,  25LL,  0LL,  0LL,  v23,  v20,  v30);
    id v16 = (id)objc_claimAutoreleasedReturnValue(v25);
    goto LABEL_22;
  }

  objc_opt_class(&OBJC_CLASS___NSURL);
  id v21 = v13;
  if ((objc_opt_isKindOfClass(v21) & 1) != 0) {
    id v22 = v21;
  }
  else {
    id v22 = 0LL;
  }

  if (!v22)
  {
    id v23 = @"Resultant IPA URL parameter was not a URL or was set to nil";
    uint64_t v24 = 3268LL;
    goto LABEL_15;
  }

  if (v32)
  {
    uint64_t v17 = 0LL;
  }

  else
  {
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(+[MIGlobalConfiguration sharedInstance](&OBJC_CLASS___MIGlobalConfiguration, "sharedInstance"));
    uint64_t v31 = objc_claimAutoreleasedReturnValue([v26 primaryPersonaString]);

    uint64_t v17 = (void *)v31;
  }

  sub_10004D4E4(v18);
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[MIClientConnection xpcConnection](self, "xpcConnection"));
  uint64_t v28 = v27;
  if (v27) {
    [v27 auditToken];
  }
  else {
    memset(v34, 0, sizeof(v34));
  }
  id v33 = 0LL;
  unsigned __int8 v29 = +[MIPlaceholderSerializer serializedPlaceholderForInstalledAppWithBundeID:personaUniqueString:atResultURL:onDevice:onBehalfOf:withError:]( &OBJC_CLASS___MIPlaceholderSerializer,  "serializedPlaceholderForInstalledAppWithBundeID:personaUniqueString:atResultURL:onDevice:onBehalfOf:withError:",  v18,  v17,  v21,  v8,  v34,  &v33);
  id v16 = v33;

  sub_10004D608(v12);
  if ((v29 & 1) == 0) {
    goto LABEL_22;
  }
  v14[2](v14, 0LL);
LABEL_23:
}

- (void)setLaunchWarningForApp:(id)a3 withUniqueInstallIdentifier:(id)a4 warningData:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void))a6;
  id v14 = sub_100014CC8(self, @"SetLaunchWarning");
  id v16 = (id)objc_claimAutoreleasedReturnValue(v14);
  if (v16)
  {
    char v17 = 0;
    id v18 = 0LL;
    unsigned int v19 = 0;
    goto LABEL_9;
  }

  if (!v10 || (objc_opt_class(&OBJC_CLASS___MIAppIdentity), (objc_opt_isKindOfClass(v10) & 1) == 0))
  {
    char v17 = 0;
    id v22 = sub_1000130F4( (uint64_t)"-[MIClientConnection setLaunchWarningForApp:withUniqueInstallIdentifier:warningData:completion:]",  3325LL,  MIInstallerErrorDomain,  25LL,  0LL,  0LL,  @"App identity was nil or the wrong type for request to set launch warning",  v15,  v39);
    id v16 = (id)objc_claimAutoreleasedReturnValue(v22);
    id v18 = 0LL;
LABEL_8:
    unsigned int v19 = 0;
    goto LABEL_9;
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue([v10 bundleID]);
  objc_opt_class(&OBJC_CLASS___NSData);
  id v20 = v11;
  if ((objc_opt_isKindOfClass(v20) & 1) != 0) {
    id v21 = v20;
  }
  else {
    id v21 = 0LL;
  }

  if (!v21)
  {
    uint64_t v26 = @"Unique install identifier was nil or the wrong type for request to set launch warning for %@";
    uint64_t v27 = 3332LL;
LABEL_34:
    char v17 = 0;
    id v35 = sub_1000130F4( (uint64_t)"-[MIClientConnection setLaunchWarningForApp:withUniqueInstallIdentifier:warningData:completion:]",  v27,  MIInstallerErrorDomain,  25LL,  0LL,  0LL,  v26,  v23,  (uint64_t)v10);
    id v16 = (id)objc_claimAutoreleasedReturnValue(v35);
    goto LABEL_8;
  }

  if (!v12)
  {
    uint64_t v28 = qword_100095BF8;
    goto LABEL_27;
  }

  objc_opt_class(&OBJC_CLASS___NSData);
  id v24 = v12;
  if ((objc_opt_isKindOfClass(v24) & 1) != 0) {
    id v25 = v24;
  }
  else {
    id v25 = 0LL;
  }

  if (!v25)
  {
    uint64_t v26 = @"Warning data was of the wrong type for request to set launch warning for %@";
    uint64_t v27 = 3337LL;
    goto LABEL_34;
  }

  uint64_t v28 = qword_100095BF8;
  if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) > 4) {
LABEL_26:
  }
    MOLogWrite(v28);
LABEL_27:
  sub_10004D4EC(v18);
  id v46 = 0LL;
  char v17 = 1;
  __int128 v43 = (void *)objc_claimAutoreleasedReturnValue( +[MIBundleContainer appBundleContainerWithIdentifier:createIfNeeded:created:error:]( &OBJC_CLASS___MIBundleContainer,  "appBundleContainerWithIdentifier:createIfNeeded:created:error:",  v18,  0LL,  0LL,  &v46));
  id v29 = v46;
  if (v43)
  {
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v43 bundle]);
    __int128 v42 = v30;
    if (v30)
    {
      id v45 = v29;
      __int128 v41 = (void *)objc_claimAutoreleasedReturnValue([v30 installationIdentitySettingIfNotSet:0 withError:&v45]);
      id v32 = v45;

      if (v41)
      {
        __int128 v40 = (void *)objc_claimAutoreleasedReturnValue([v41 uniqueInstallID]);
        if ([v20 isEqualToData:v40])
        {
          id v44 = v32;
          unsigned int v19 = [v42 setLaunchWarningData:v12 withError:&v44];
          id v16 = v44;
        }

        else
        {
          id v38 = sub_1000130F4( (uint64_t)"-[MIClientConnection setLaunchWarningForApp:withUniqueInstallIdentifier:warningData:completion:]",  3371LL,  MIInstallerErrorDomain,  200LL,  0LL,  0LL,  @"Installed app with identity %@ does not have supplied unique install identifier %@ (found %@)",  v34,  (uint64_t)v10);
          id v16 = (id)objc_claimAutoreleasedReturnValue(v38);
          unsigned int v19 = 0;
        }

        id v32 = v41;
      }

      else
      {
        id v37 = sub_1000130F4( (uint64_t)"-[MIClientConnection setLaunchWarningForApp:withUniqueInstallIdentifier:warningData:completion:]",  3364LL,  MIInstallerErrorDomain,  200LL,  v32,  0LL,  @"Failed to get installation identity for %@",  v33,  (uint64_t)v10);
        id v16 = (id)objc_claimAutoreleasedReturnValue(v37);
        unsigned int v19 = 0;
      }

      id v29 = v42;
    }

    else
    {
      id v36 = sub_1000130F4( (uint64_t)"-[MIClientConnection setLaunchWarningForApp:withUniqueInstallIdentifier:warningData:completion:]",  3357LL,  MIInstallerErrorDomain,  4LL,  0LL,  0LL,  @"Failed to locate app bundle in container for %@",  v31,  (uint64_t)v10);
      id v16 = (id)objc_claimAutoreleasedReturnValue(v36);
      unsigned int v19 = 0;
    }
  }

  else
  {
    unsigned int v19 = 0;
    id v16 = v29;
  }

- (NSXPCConnection)xpcConnection
{
  return (NSXPCConnection *)objc_loadWeakRetained((id *)&self->_xpcConnection);
}

- (void)setXpcConnection:(id)a3
{
}

- (unsigned)percentComplete
{
  return self->_percentComplete;
}

- (void).cxx_destruct
{
}

@end