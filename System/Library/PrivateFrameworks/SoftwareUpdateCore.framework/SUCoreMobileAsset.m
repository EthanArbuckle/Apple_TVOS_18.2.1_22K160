@interface SUCoreMobileAsset
+ (BOOL)downloadConfig:(id)a3 isEqualToConfig:(id)a4;
+ (id)_reloadDescriptor:(id)a3 allowingDifferences:(id)a4 forceReload:(BOOL)a5 skipMSU:(BOOL)a6 defaultValues:(id)a7 pSUReloadError:(id *)a8 pDocReloadError:(id *)a9;
+ (id)downloadConfigCopy:(id)a3;
+ (id)downloadConfigSummary:(id)a3;
+ (id)downloadOptionsDescription:(id)a3;
+ (void)_callReloadCompletion:(id)a3 withDescriptor:(id)a4 suError:(id)a5 docError:(id)a6;
+ (void)mapMobileAssetErrorIndications;
+ (void)reloadDescriptor:(id)a3 allowingDifferences:(id)a4 forceReload:(BOOL)a5 completion:(id)a6;
+ (void)reloadDescriptor:(id)a3 allowingDifferences:(id)a4 forceReload:(BOOL)a5 defaultValues:(id)a6 completion:(id)a7;
+ (void)reloadDescriptor:(id)a3 allowingDifferences:(id)a4 forceReload:(BOOL)a5 skipMSU:(BOOL)a6 defaultValues:(id)a7 completion:(id)a8;
+ (void)reloadDescriptor:(id)a3 completion:(id)a4;
- (BOOL)assetDownloaded;
- (BOOL)assetRemoved;
- (BOOL)checkedDownloadState;
- (BOOL)downloadingAsset;
- (BOOL)removingAsset;
- (MAAsset)asset;
- (MADownloadConfig)currentDownloadConfig;
- (MADownloadConfig)desiredDownloadConfig;
- (MADownloadConfig)requestedDownloadConfig;
- (MADownloadOptions)downloadOptions;
- (NSString)documentationStashBuild;
- (NSString)operationName;
- (NSString)updateUUID;
- (OS_dispatch_queue)clientCompletionQueue;
- (OS_dispatch_queue)clientDelegateCallbackQueue;
- (OS_dispatch_queue)maControlQueue;
- (OS_os_transaction)alterDownloadTransaction;
- (OS_os_transaction)downloadAssetTransaction;
- (OS_os_transaction)removeAssetTransaction;
- (SUCoreMobileAsset)initWithDelegate:(id)a3 forAsset:(id)a4 updateUUID:(id)a5;
- (SUCoreMobileAsset)initWithDelegate:(id)a3 forAsset:(id)a4 updateUUID:(id)a5 withCallbackQueue:(id)a6 withCompletionQueue:(id)a7;
- (id)_updateAssetTypeName;
- (id)alterDownloadCompletion;
- (id)description;
- (id)downloadCompletion;
- (id)maDelegate;
- (id)removeCompletion;
- (void)_cancelDownloadAndPurge;
- (void)_downloadAssetWithOptions:(id)a3 completion:(id)a4;
- (void)_downloadAssetWithOptions:(id)a3 stashingDocumentationForBuild:(id)a4 completion:(id)a5;
- (void)_issueAlterDownloadCompletion:(int64_t)a3 forReason:(id)a4;
- (void)_registerProgressAndStartDownload;
- (void)_reportAnomaly:(id)a3;
- (void)_reportAnomaly:(id)a3 issuingCompletion:(id)a4;
- (void)_reportAssetRemoveFailed:(id)a3;
- (void)_reportAssetRemoved;
- (void)_reportDownloadFailed:(id)a3;
- (void)_reportDownloadProgress:(id)a3;
- (void)_reportDownloaded:(id)a3;
- (void)_requestChangeConfigDownload:(id)a3;
- (void)_trackMAAnomaly:(id)a3 result:(int64_t)a4 description:(id)a5;
- (void)_trackMobileAssetBegin:(id)a3;
- (void)_trackMobileAssetBegin:(id)a3 withIdentifier:(id)a4;
- (void)_trackMobileAssetEnd:(id)a3 withIdentifier:(id)a4 withResult:(int64_t)a5 withError:(id)a6;
- (void)_trackMobileAssetEnd:(id)a3 withResult:(int64_t)a4 withError:(id)a5;
- (void)alterDownloadOptions:(id)a3;
- (void)alterDownloadOptions:(id)a3 completion:(id)a4;
- (void)downloadConfigStatus:(id)a3;
- (void)downloadDocumentationAssetWithPolicy:(id)a3 withUUID:(id)a4;
- (void)downloadDocumentationAssetWithPolicy:(id)a3 withUUID:(id)a4 completion:(id)a5;
- (void)downloadDocumentationAssetWithPolicy:(id)a3 withUUID:(id)a4 stashingDocumentationForBuild:(id)a5 completion:(id)a6;
- (void)downloadSoftwareUpdateAssetWithPolicy:(id)a3 withUUID:(id)a4;
- (void)downloadSoftwareUpdateAssetWithPolicy:(id)a3 withUUID:(id)a4 completion:(id)a5;
- (void)removeAsset;
- (void)removeAsset:(id)a3;
- (void)setAlterDownloadCompletion:(id)a3;
- (void)setAlterDownloadTransaction:(id)a3;
- (void)setAsset:(id)a3;
- (void)setAssetDownloaded:(BOOL)a3;
- (void)setAssetRemoved:(BOOL)a3;
- (void)setCheckedDownloadState:(BOOL)a3;
- (void)setCurrentDownloadConfig:(id)a3;
- (void)setDesiredDownloadConfig:(id)a3;
- (void)setDocumentationStashBuild:(id)a3;
- (void)setDownloadAssetTransaction:(id)a3;
- (void)setDownloadCompletion:(id)a3;
- (void)setDownloadOptions:(id)a3;
- (void)setDownloadingAsset:(BOOL)a3;
- (void)setOperationName:(id)a3;
- (void)setRemoveAssetTransaction:(id)a3;
- (void)setRemoveCompletion:(id)a3;
- (void)setRemovingAsset:(BOOL)a3;
- (void)setRequestedDownloadConfig:(id)a3;
- (void)setUpdateUUID:(id)a3;
@end

@implementation SUCoreMobileAsset

- (SUCoreMobileAsset)initWithDelegate:(id)a3 forAsset:(id)a4 updateUUID:(id)a5
{
  return -[SUCoreMobileAsset initWithDelegate:forAsset:updateUUID:withCallbackQueue:withCompletionQueue:]( self,  "initWithDelegate:forAsset:updateUUID:withCallbackQueue:withCompletionQueue:",  a3,  a4,  a5,  0LL,  0LL);
}

- (SUCoreMobileAsset)initWithDelegate:(id)a3 forAsset:(id)a4 updateUUID:(id)a5 withCallbackQueue:(id)a6 withCompletionQueue:(id)a7
{
  uint64_t v82 = *MEMORY[0x1895F89C0];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v79.receiver = self;
  v79.super_class = (Class)&OBJC_CLASS___SUCoreMobileAsset;
  v17 = -[SUCoreMobileAsset init](&v79, sel_init);
  v18 = v17;
  if (!v17)
  {
LABEL_36:
    v71 = v18;
    goto LABEL_37;
  }

  objc_storeWeak(&v17->_maDelegate, v12);
  objc_storeStrong((id *)&v18->_asset, a4);
  objc_storeStrong((id *)&v18->_updateUUID, a5);
  documentationStashBuild = v18->_documentationStashBuild;
  v18->_documentationStashBuild = 0LL;

  downloadOptions = v18->_downloadOptions;
  v18->_downloadOptions = 0LL;

  currentDownloadConfig = v18->_currentDownloadConfig;
  v18->_currentDownloadConfig = 0LL;

  requestedDownloadConfig = v18->_requestedDownloadConfig;
  v18->_requestedDownloadConfig = 0LL;

  desiredDownloadConfig = v18->_desiredDownloadConfig;
  v18->_desiredDownloadConfig = 0LL;

  v18->_assetRemoved = 0;
  *(_DWORD *)&v18->_downloadingAsset = 0;
  operationName = v18->_operationName;
  v18->_operationName = 0LL;

  id downloadCompletion = v18->_downloadCompletion;
  v18->_id downloadCompletion = 0LL;

  id alterDownloadCompletion = v18->_alterDownloadCompletion;
  v18->_id alterDownloadCompletion = 0LL;

  id removeCompletion = v18->_removeCompletion;
  v18->_id removeCompletion = 0LL;

  [MEMORY[0x189612760] sharedCore];
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  [v28 commonDomain];
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  id v30 = [objc_alloc(NSString) initWithFormat:@"%@.%@", v29, @"ma.control"];
  v31 = (const char *)[v30 UTF8String];
  dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v32 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v33 = dispatch_queue_create(v31, v32);
  maControlQueue = v18->_maControlQueue;
  v18->_maControlQueue = (OS_dispatch_queue *)v33;

  if (v18->_maControlQueue)
  {
    [MEMORY[0x1896127A0] sharedLogger];
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    [v35 oslog];
    v36 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    BOOL v37 = os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);
    if (v12)
    {
      if (v37)
      {
        v38 = -[SUCoreMobileAsset maDelegate](v18, "maDelegate");
        char v39 = objc_opt_respondsToSelector();
        v40 = @"NO";
        if ((v39 & 1) != 0) {
          v40 = @"YES";
        }
        *(_DWORD *)buf = 138543362;
        v81 = v40;
        _os_log_impl( &dword_187A54000,  v36,  OS_LOG_TYPE_DEFAULT,  "[MA] operating with delegate: respondsToSelector(maDownloadProgress:) %{public}@",  buf,  0xCu);
      }

      [MEMORY[0x1896127A0] sharedLogger];
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      [v41 oslog];
      v42 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        v43 = -[SUCoreMobileAsset maDelegate](v18, "maDelegate");
        char v44 = objc_opt_respondsToSelector();
        v45 = @"NO";
        if ((v44 & 1) != 0) {
          v45 = @"YES";
        }
        *(_DWORD *)buf = 138543362;
        v81 = v45;
        _os_log_impl( &dword_187A54000,  v42,  OS_LOG_TYPE_DEFAULT,  "[MA] operating with delegate: respondsToSelector(maDownloadStalled:) %{public}@",  buf,  0xCu);
      }

      [MEMORY[0x1896127A0] sharedLogger];
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      [v46 oslog];
      v47 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        v48 = -[SUCoreMobileAsset maDelegate](v18, "maDelegate");
        char v49 = objc_opt_respondsToSelector();
        v50 = @"NO";
        if ((v49 & 1) != 0) {
          v50 = @"YES";
        }
        *(_DWORD *)buf = 138543362;
        v81 = v50;
        _os_log_impl( &dword_187A54000,  v47,  OS_LOG_TYPE_DEFAULT,  "[MA] operating with delegate: respondsToSelector(maDownloaded:) %{public}@",  buf,  0xCu);
      }

      [MEMORY[0x1896127A0] sharedLogger];
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      [v51 oslog];
      v52 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        v53 = -[SUCoreMobileAsset maDelegate](v18, "maDelegate");
        char v54 = objc_opt_respondsToSelector();
        v55 = @"NO";
        if ((v54 & 1) != 0) {
          v55 = @"YES";
        }
        *(_DWORD *)buf = 138543362;
        v81 = v55;
        _os_log_impl( &dword_187A54000,  v52,  OS_LOG_TYPE_DEFAULT,  "[MA] operating with delegate: respondsToSelector(maDownloadFailed:) %{public}@",  buf,  0xCu);
      }

      [MEMORY[0x1896127A0] sharedLogger];
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      [v56 oslog];
      v57 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        v58 = -[SUCoreMobileAsset maDelegate](v18, "maDelegate");
        char v59 = objc_opt_respondsToSelector();
        v60 = @"NO";
        if ((v59 & 1) != 0) {
          v60 = @"YES";
        }
        *(_DWORD *)buf = 138543362;
        v81 = v60;
        _os_log_impl( &dword_187A54000,  v57,  OS_LOG_TYPE_DEFAULT,  "[MA] operating with delegate: respondsToSelector(maAssetRemoved) %{public}@",  buf,  0xCu);
      }

      [MEMORY[0x1896127A0] sharedLogger];
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      [v61 oslog];
      v62 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        v63 = -[SUCoreMobileAsset maDelegate](v18, "maDelegate");
        char v64 = objc_opt_respondsToSelector();
        v65 = @"NO";
        if ((v64 & 1) != 0) {
          v65 = @"YES";
        }
        *(_DWORD *)buf = 138543362;
        v81 = v65;
        _os_log_impl( &dword_187A54000,  v62,  OS_LOG_TYPE_DEFAULT,  "[MA] operating with delegate: respondsToSelector(maAssetRemoveFailed:) %{public}@",  buf,  0xCu);
      }

      [MEMORY[0x1896127A0] sharedLogger];
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      [v66 oslog];
      v36 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        v67 = -[SUCoreMobileAsset maDelegate](v18, "maDelegate");
        char v68 = objc_opt_respondsToSelector();
        v69 = @"NO";
        if ((v68 & 1) != 0) {
          v69 = @"YES";
        }
        *(_DWORD *)buf = 138543362;
        v81 = v69;
        _os_log_impl( &dword_187A54000,  v36,  OS_LOG_TYPE_DEFAULT,  "[MA] operating with delegate: respondsToSelector(maAnomaly:) %{public}@",  buf,  0xCu);
      }
    }

    else if (v37)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_187A54000, v36, OS_LOG_TYPE_DEFAULT, "[MA] operating without delegate", buf, 2u);
    }

    [MEMORY[0x189612760] sharedCore];
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v73 = [v72 selectDelegateCallbackQueue:v15];
    clientDelegateCallbackQueue = v18->_clientDelegateCallbackQueue;
    v18->_clientDelegateCallbackQueue = (OS_dispatch_queue *)v73;

    [MEMORY[0x189612760] sharedCore];
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v76 = [v75 selectCompletionQueue:v16];
    clientCompletionQueue = v18->_clientCompletionQueue;
    v18->_clientCompletionQueue = (OS_dispatch_queue *)v76;

    +[SUCoreMobileAsset mapMobileAssetErrorIndications]( &OBJC_CLASS___SUCoreMobileAsset,  "mapMobileAssetErrorIndications");
    goto LABEL_36;
  }

  [MEMORY[0x189612778] sharedDiag];
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  [v70 trackError:@"[MA]" forReason:@"unable to create MA control dispatch queue" withResult:8100 withError:0];

  v71 = 0LL;
LABEL_37:

  return v71;
}

+ (void)mapMobileAssetErrorIndications
{
  if (mapMobileAssetErrorIndications_mobileAssetErrorInfoOnce != -1) {
    dispatch_once(&mapMobileAssetErrorIndications_mobileAssetErrorInfoOnce, &__block_literal_global_8);
  }
}

void __51__SUCoreMobileAsset_mapMobileAssetErrorIndications__block_invoke()
{
  v8[6] = *MEMORY[0x1895F89C0];
  v7[0] = @"checkSpaceNeeded";
  [MEMORY[0x189607968] numberWithUnsignedLongLong:4];
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v0;
  v7[1] = @"checkNetwork";
  [MEMORY[0x189607968] numberWithUnsignedLongLong:1];
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v1;
  v7[2] = @"checkTimeoutConditions";
  [MEMORY[0x189607968] numberWithUnsignedLongLong:1];
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v2;
  v7[3] = @"pallasNoPMVMatchFound";
  [MEMORY[0x189607968] numberWithUnsignedLongLong:32];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[3] = v3;
  v7[4] = @"pallasNoBuildVersionMatchFound";
  [MEMORY[0x189607968] numberWithUnsignedLongLong:64];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[4] = v4;
  v7[5] = @"timeoutWithDetail";
  [MEMORY[0x189607968] numberWithUnsignedLongLong:128];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[5] = v5;
  [MEMORY[0x189603F68] dictionaryWithObjects:v8 forKeys:v7 count:6];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x189612780] associateLayer:411 withDomain:@"com.apple.MobileAssetError.Download" keyMatchTrueMap:v6];
  [MEMORY[0x189612780] associateLayer:412 withDomain:@"com.apple.MobileAssetError.Query" keyMatchTrueMap:v6];
  [MEMORY[0x189612780] associateLayer:413 withDomain:@"com.apple.MobileAssetError.Purge" keyMatchTrueMap:v6];
  [MEMORY[0x189612780] associateLayer:414 withDomain:@"com.apple.MobileAssetError.Xpc" keyMatchTrueMap:v6];
  [MEMORY[0x189612780] associateLayer:411 withDomain:@"com.apple.MobileAssetError.Download" indicating:32 ifKeyTrue:@"pallasNoPMVMatchFound"];
  [MEMORY[0x189612780] associateLayer:411 withDomain:@"com.apple.MobileAssetError.Download" indicating:128 ifKeyTrue:@"timeoutWithDetail"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:1 codeName:@"MADownloadXpcError"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:2 codeName:@"MADownloadConnectionInterrupted"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:3 codeName:@"MADownloadFailed"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:4 codeName:@"MADownloadStagingFailed"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:5 codeName:@"MADownloadMetaDataProcessFailed"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:6 codeName:@"MADownloadUnzipFailed"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:7 codeName:@"MADownloadMoveFailed"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:8 codeName:@"MADownloadInstallFailed"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:9 codeName:@"MADownloadDaemonExit"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:10 codeName:@"MADownloadAssetAlreadyInstalled"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:11 codeName:@"MADownloadInvalidSZExtractor"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:12 codeName:@"MADownloadNotEntitled"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:13 codeName:@"MADownloadDaemonNotReady"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:14 codeName:@"MADownloadNoChange"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:15 codeName:@"MADownloadNotApplicableForRequireByOs"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:16 codeName:@"MADownloadNoExtractorFailure"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:17 codeName:@"MADownloadTransformFailure"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:18 codeName:@"MADownloadNoMatchFound" indicating:32];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:19 codeName:@"MADownloadNilAssetType"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:20 codeName:@"MADownloadNilAssetId"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:21 codeName:@"MADownloadStreamingZipNotSupported"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:22 codeName:@"MADownloadBadOptions"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:23 codeName:@"MADownloadAssetBadMetaData"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:24 codeName:@"MADownloadUnableToCreateMessage"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:25 codeName:@"MADownloadFailedNoStandardUrl"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:26 codeName:@"MADownloadFailedNoFallBackUrl"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:27 codeName:@"MADownloadFailedNoPallasUrl"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:28 codeName:@"MADownloadLostTask"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:29 codeName:@"MADownloadNotApplicableForInstalledWithOs"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:30 codeName:@"MADownloadNoValidSession"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:31 codeName:@"MADownloadResponseDeferred"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:32 codeName:@"MADownloadIncomplete"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:33 codeName:@"MADownloadNoStagingDir"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:34 codeName:@"MADownloadsNotAllowed"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:35 codeName:@"MADownloadUnknownResult"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:36 codeName:@"MADownloadAssetNoLongerInCatalog"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:37 codeName:@"MADownloadNoSpaceLeft"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:38 codeName:@"MADownloadCouldNotReplace"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:39 codeName:@"MADownloadMalformedAssetType"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:40 codeName:@"MADownloadServerBadRequest"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:41 codeName:@"MADownloadServerAuthFailure"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:42 codeName:@"MADownloadServerError"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:43 codeName:@"MADownloadNotFoundOrDenied"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:44 codeName:@"MADownloadNotFound"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:45 codeName:@"MADownloadServerInternalError"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:46 codeName:@"MADownloadMalformedAssetData"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:47 codeName:@"MADownloadNetworkingError"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:48 codeName:@"MADownloadCancelled"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:49 codeName:@"MADownloadBadUrl"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:50 codeName:@"MADownloadBadServerResponse"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:51 codeName:@"MADownloadTimedOut"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:52 codeName:@"MADownloadTimedOutRequest"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:53 codeName:@"MADownloadTimedOutResource"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:54 codeName:@"MADownloadTimedOutWatchdog"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:55 codeName:@"MADownloadTimedOutStart"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:56 codeName:@"MADownloadTimedOutConnection"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:80 codeName:@"MADownloadTimedOutNoContent"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:81 codeName:@"MADownloadTimedOutBecameStalled"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:82 codeName:@"MADownloadTimedOutSlowDownload"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:83 codeName:@"MADownloadTimedOutFrequentStalls"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:57 codeName:@"MADownloadCannotLoadFromNetwork"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:58 codeName:@"MADownloadUnsupportedURL"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:59 codeName:@"MADownloadCannotFindHost"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:60 codeName:@"MADownloadCannotConnectToHost"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:61 codeName:@"MADownloadNetworkConnectionLost"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:62 codeName:@"MADownloadDNSLookupFailed"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:63 codeName:@"MADownloadHTTPTooManyRedirects"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:64 codeName:@"MADownloadResourceUnavailable"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:65 codeName:@"MADownloadNotConnectedToInternet"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:66 codeName:@"MADownloadRedirectToNonExistentLocation"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:67 codeName:@"MADownloadInternationalRoamingOff"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:68 codeName:@"MADownloadCallIsActive"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:69 codeName:@"MADownloadDataNotAllowed"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:70 codeName:@"MADownloadSecureConnectionFailed"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:71 codeName:@"MADownloadInvalidReceipts"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:72 codeName:@"MADownloadFailedNoFallbackAllowed"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:73 codeName:@"MADownloadLiveServerDisabledNoFallback"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:74 codeName:@"MADownloadMalformedPurpose"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Query" withCode:1 codeName:@"MAQueryXpcError"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Query" withCode:2 codeName:@"MAQueryCatalogNotDownloaded"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Query" withCode:3 codeName:@"MAQueryFailed"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Query" withCode:4 codeName:@"MAQueryDaemonExit"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Query" withCode:5 codeName:@"MAQueryNotEntitled"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Query" withCode:6 codeName:@"MAQueryCannotCreateMessage"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Query" withCode:7 codeName:@"MAQueryNilAssetType"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Query" withCode:8 codeName:@"MAQueryParamsEncodeFailure"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Query" withCode:9 codeName:@"MAQueryBeforeFirstUnlock"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Query" withCode:10 codeName:@"MAQueryCouldNotEncodeResults"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Query" withCode:11 codeName:@"MAQueryXpcLengthError"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Query" withCode:12 codeName:@"MAQueryUnknownResult"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Query" withCode:13 codeName:@"MAQueryTooManyResults"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Query" withCode:14 codeName:@"MAQueryHasAllowedDifferences"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Purge" withCode:1 codeName:@"MAPurgeXpcError"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Purge" withCode:2 codeName:@"MAPurgeConnectionInterrupted"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Purge" withCode:3 codeName:@"MAPurgeAssetDidntExist"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Purge" withCode:4 codeName:@"MAPurgeAssetCouldntPurge"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Purge" withCode:5 codeName:@"MAPurgeFailed"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Purge" withCode:6 codeName:@"MAPurgeNotEntitled"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Purge" withCode:7 codeName:@"MAPurgeNotApplicableForRequireByOs"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Purge" withCode:8 codeName:@"MAPurgeCouldNotCancelAllDownloads"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Purge" withCode:9 codeName:@"MAPurgeCannotCreateMessage"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Purge" withCode:10 codeName:@"MAPurgeEncodingFailure"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Purge" withCode:11 codeName:@"MAPurgeFailedBeforeFirstUnlock"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Xpc" withCode:1 codeName:@"MAXpcErrorParamMissing"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Xpc" withCode:2 codeName:@"MAXpcErrorLengthZero"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Xpc" withCode:3 codeName:@"MAXpcErrorLengthMissing"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Xpc" withCode:4 codeName:@"MAXpcErrorLengthMismatch"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Xpc" withCode:5 codeName:@"MAXpcErrorDataMismatch"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Xpc" withCode:6 codeName:@"MAXpcErrorEmptyData"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Xpc" withCode:7 codeName:@"MAXpcErrorConnectionTerminated"];
}

- (void)downloadSoftwareUpdateAssetWithPolicy:(id)a3 withUUID:(id)a4
{
}

- (void)downloadSoftwareUpdateAssetWithPolicy:(id)a3 withUUID:(id)a4 completion:(id)a5
{
  id v8 = a5;
  [a3 constructMASoftwareUpdateAssetDownloadOptionsWithUUID:a4];
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  -[SUCoreMobileAsset _downloadAssetWithOptions:completion:](self, "_downloadAssetWithOptions:completion:", v9, v8);
}

- (void)downloadDocumentationAssetWithPolicy:(id)a3 withUUID:(id)a4
{
}

- (void)downloadDocumentationAssetWithPolicy:(id)a3 withUUID:(id)a4 completion:(id)a5
{
}

- (void)downloadDocumentationAssetWithPolicy:(id)a3 withUUID:(id)a4 stashingDocumentationForBuild:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  [a3 constructMADocumentationAssetDownloadOptionsWithUUID:a4];
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  -[SUCoreMobileAsset _downloadAssetWithOptions:stashingDocumentationForBuild:completion:]( self,  "_downloadAssetWithOptions:stashingDocumentationForBuild:completion:",  v12,  v11,  v10);
}

- (void)alterDownloadOptions:(id)a3
{
}

- (void)alterDownloadOptions:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [MEMORY[0x189612760] beginTransactionWithName:@"ma.AlterDownloadOptions"];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMobileAsset maControlQueue](self, "maControlQueue");
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __53__SUCoreMobileAsset_alterDownloadOptions_completion___block_invoke;
  v13[3] = &unk_18A0F0350;
  v13[4] = self;
  id v14 = v8;
  id v15 = v6;
  id v16 = v7;
  id v10 = v6;
  id v11 = v8;
  id v12 = v7;
  dispatch_async(v9, v13);
}

void __53__SUCoreMobileAsset_alterDownloadOptions_completion___block_invoke(uint64_t a1)
{
  uint64_t v60 = *MEMORY[0x1895F89C0];
  v2 = (id *)(a1 + 32);
  [*(id *)(a1 + 32) alterDownloadCompletion];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    [MEMORY[0x1896127A0] sharedLogger];
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 oslog];
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __53__SUCoreMobileAsset_alterDownloadOptions_completion___block_invoke_cold_3();
    }

    if (*(void *)(a1 + 56))
    {
      [*(id *)(a1 + 32) clientCompletionQueue];
      id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __53__SUCoreMobileAsset_alterDownloadOptions_completion___block_invoke_691;
      block[3] = &unk_18A0F03F0;
      v53 = @"alter download config when already altering with completion - cannot accept additional alteration request";
      id v55 = *(id *)(a1 + 56);
      id v54 = *(id *)(a1 + 40);
      dispatch_async(v6, block);

      id v7 = (__CFString *)v53;
LABEL_18:

      return;
    }

    goto LABEL_19;
  }

  if ([*v2 removingAsset])
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 oslog];
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __53__SUCoreMobileAsset_alterDownloadOptions_completion___block_invoke_cold_1();
    }

    if (*(void *)(a1 + 56))
    {
      [*(id *)(a1 + 32) clientCompletionQueue];
      id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
      v48[0] = MEMORY[0x1895F87A8];
      v48[1] = 3221225472LL;
      v48[2] = __53__SUCoreMobileAsset_alterDownloadOptions_completion___block_invoke_694;
      v48[3] = &unk_18A0F03F0;
      char v49 = @"alter download config when removing asset - alteration of configuration ignored";
      id v51 = *(id *)(a1 + 56);
      id v50 = *(id *)(a1 + 40);
      dispatch_async(v10, v48);

      id v7 = (__CFString *)v49;
      goto LABEL_18;
    }

    goto LABEL_19;
  }

  if (![*v2 downloadingAsset])
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 oslog];
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __53__SUCoreMobileAsset_alterDownloadOptions_completion___block_invoke_cold_2();
    }

    if (*(void *)(a1 + 56))
    {
      [*(id *)(a1 + 32) clientCompletionQueue];
      id v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
      v44[0] = MEMORY[0x1895F87A8];
      v44[1] = 3221225472LL;
      v44[2] = __53__SUCoreMobileAsset_alterDownloadOptions_completion___block_invoke_699;
      v44[3] = &unk_18A0F03F0;
      v45 = @"alter download config when not downloading - alteration of configuration ignored";
      id v47 = *(id *)(a1 + 56);
      id v46 = *(id *)(a1 + 40);
      dispatch_async(v13, v44);

      id v7 = (__CFString *)v45;
      goto LABEL_18;
    }

void __53__SUCoreMobileAsset_alterDownloadOptions_completion___block_invoke_691(void *a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 buildError:8703 underlying:0 description:a1[4]];
  id v3 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(a1[6] + 16LL))();
  [MEMORY[0x189612760] endTransaction:a1[5] withName:@"ma.AlterDownloadOptions"];
}

void __53__SUCoreMobileAsset_alterDownloadOptions_completion___block_invoke_694(void *a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 buildError:8703 underlying:0 description:a1[4]];
  id v3 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(a1[6] + 16LL))();
  [MEMORY[0x189612760] endTransaction:a1[5] withName:@"ma.AlterDownloadOptions"];
}

void __53__SUCoreMobileAsset_alterDownloadOptions_completion___block_invoke_699(void *a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 buildError:8703 underlying:0 description:a1[4]];
  id v3 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(a1[6] + 16LL))();
  [MEMORY[0x189612760] endTransaction:a1[5] withName:@"ma.AlterDownloadOptions"];
}

- (void)downloadConfigStatus:(id)a3
{
  id v4 = a3;
  [MEMORY[0x189612760] beginTransactionWithName:@"ma.DownloadConfigStatus.Completion"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMobileAsset maControlQueue](self, "maControlQueue");
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __42__SUCoreMobileAsset_downloadConfigStatus___block_invoke;
  block[3] = &unk_18A0F03F0;
  id v10 = v5;
  id v11 = v4;
  void block[4] = self;
  id v7 = v5;
  id v8 = v4;
  dispatch_async(v6, block);
}

void __42__SUCoreMobileAsset_downloadConfigStatus___block_invoke(id *a1)
{
  if ([a1[4] downloadingAsset] && (objc_msgSend(a1[4], "removingAsset") & 1) == 0)
  {
    [a1[4] currentDownloadConfig];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[SUCoreMobileAsset downloadConfigCopy:](&OBJC_CLASS___SUCoreMobileAsset, "downloadConfigCopy:", v6);
    id v3 = (void *)objc_claimAutoreleasedReturnValue();

    [a1[4] requestedDownloadConfig];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[SUCoreMobileAsset downloadConfigCopy:](&OBJC_CLASS___SUCoreMobileAsset, "downloadConfigCopy:", v7);
    id v4 = (void *)objc_claimAutoreleasedReturnValue();

    [a1[4] desiredDownloadConfig];
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = +[SUCoreMobileAsset downloadConfigCopy:](&OBJC_CLASS___SUCoreMobileAsset, "downloadConfigCopy:", v2);
  }

  else
  {
    [a1[4] currentDownloadConfig];
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    +[SUCoreMobileAsset downloadConfigCopy:](&OBJC_CLASS___SUCoreMobileAsset, "downloadConfigCopy:", v2);
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    id v4 = 0LL;
    v5 = 0LL;
  }

  id v8 = a1[4];
  if (a1[6])
  {
    [v8 clientCompletionQueue];
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __42__SUCoreMobileAsset_downloadConfigStatus___block_invoke_2;
    v10[3] = &unk_18A0F0418;
    id v16 = a1[6];
    id v11 = v3;
    id v12 = v4;
    id v13 = v5;
    id v14 = 0LL;
    id v15 = a1[5];
    dispatch_async(v9, v10);
  }

  else
  {
    [v8 _trackMAAnomaly:@"CONFIG" result:8101 description:@"download config status requested with no completion provided"];
    [MEMORY[0x189612760] endTransaction:a1[5] withName:@"ma.DownloadConfigStatus.Completion"];
  }
}

uint64_t __42__SUCoreMobileAsset_downloadConfigStatus___block_invoke_2(uint64_t a1)
{
  return [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 64) withName:@"ma.DownloadConfigStatus.Completion"];
}

- (void)removeAsset
{
}

- (void)removeAsset:(id)a3
{
  id v4 = a3;
  [MEMORY[0x189612760] beginTransactionWithName:@"ma.RemoveAsset"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMobileAsset maControlQueue](self, "maControlQueue");
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __33__SUCoreMobileAsset_removeAsset___block_invoke;
  block[3] = &unk_18A0F03F0;
  id v10 = v5;
  id v11 = v4;
  void block[4] = self;
  id v7 = v5;
  id v8 = v4;
  dispatch_async(v6, block);
}

uint64_t __33__SUCoreMobileAsset_removeAsset___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) removingAsset])
  {
    v2 = *(void **)(a1 + 32);
    [MEMORY[0x189612760] sharedCore];
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 buildError:8115 underlying:0 description:@"remove requested when already removing"];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 _reportAnomaly:v4 issuingCompletion:*(void *)(a1 + 48)];

    return [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 40) withName:@"ma.RemoveAsset"];
  }

  else
  {
    [*(id *)(a1 + 32) setRemoveAssetTransaction:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) setRemoveCompletion:*(void *)(a1 + 48)];
    [*(id *)(a1 + 32) setRemovingAsset:1];
    [*(id *)(a1 + 32) setAssetDownloaded:0];
    [*(id *)(a1 + 32) setAssetRemoved:0];
    id v6 = objc_alloc(NSString);
    [*(id *)(a1 + 32) _updateAssetTypeName];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) updateUUID];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    id v9 = (void *)[v6 initWithFormat:@"[MA-REMOVE:%@(%@)]", v7, v8];
    [*(id *)(a1 + 32) setOperationName:v9];

    return [*(id *)(a1 + 32) _cancelDownloadAndPurge];
  }

- (void)_downloadAssetWithOptions:(id)a3 completion:(id)a4
{
}

- (void)_downloadAssetWithOptions:(id)a3 stashingDocumentationForBuild:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [MEMORY[0x189612760] beginTransactionWithName:@"ma.DownloadAsset"];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMobileAsset maControlQueue](self, "maControlQueue");
  id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __88__SUCoreMobileAsset__downloadAssetWithOptions_stashingDocumentationForBuild_completion___block_invoke;
  block[3] = &unk_18A0F0378;
  id v20 = v9;
  id v21 = v10;
  void block[4] = self;
  id v18 = v11;
  id v19 = v8;
  id v13 = v9;
  id v14 = v8;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(v12, block);
}

void __88__SUCoreMobileAsset__downloadAssetWithOptions_stashingDocumentationForBuild_completion___block_invoke( uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  if (([*(id *)(a1 + 32) downloadingAsset] & 1) != 0
    || [*(id *)(a1 + 32) removingAsset])
  {
    id v2 = objc_alloc(NSString);
    else {
      id v3 = @"NO";
    }
    else {
      id v4 = @"NO";
    }
    id v36 = (id)[v2 initWithFormat:@"download requested when busy performing other MA operation (downloading=%@, removing=%@)", v3, v4];
    v5 = *(void **)(a1 + 32);
    [MEMORY[0x189612760] sharedCore];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 buildError:8115 underlying:0 description:v36];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 _reportAnomaly:v7 issuingCompletion:*(void *)(a1 + 64)];

    [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 40) withName:@"ma.DownloadAsset"];
    return;
  }

  if ([*(id *)(a1 + 32) assetDownloaded])
  {
    id v8 = *(void **)(a1 + 32);
    [MEMORY[0x189612760] sharedCore];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 buildError:8115 underlying:0 description:@"download requested when asset was already downloaded"];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 _reportAnomaly:v10 issuingCompletion:*(void *)(a1 + 64)];

    [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 40) withName:@"ma.DownloadAsset"];
    return;
  }

  [*(id *)(a1 + 32) setDownloadAssetTransaction:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) currentDownloadConfig];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11
    || ([*(id *)(a1 + 32) requestedDownloadConfig],
        (id v11 = (void *)objc_claimAutoreleasedReturnValue()) != 0LL))
  {

LABEL_15:
    id v12 = objc_alloc(NSString);
    [*(id *)(a1 + 32) currentDownloadConfig];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      [*(id *)(a1 + 32) currentDownloadConfig];
      id v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      id v14 = @"NONE";
    }

    [*(id *)(a1 + 32) requestedDownloadConfig];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      [*(id *)(a1 + 32) requestedDownloadConfig];
      id v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      id v16 = @"NONE";
    }

    [*(id *)(a1 + 32) desiredDownloadConfig];
    BOOL v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      [*(id *)(a1 + 32) desiredDownloadConfig];
      id v18 = (void *)objc_claimAutoreleasedReturnValue();
      id v19 = (void *)[v12 initWithFormat:@"starting to download asset with stale download config, current=%@, requested=%@, desired=%@", v14, v16, v18];
    }

    else
    {
      id v19 = (void *)[v12 initWithFormat:@"starting to download asset with stale download config, current=%@, requested=%@, desired=%@", v14, v16, @"NONE"];
    }

    if (v15) {
    if (v13)
    }

    id v20 = *(void **)(a1 + 32);
    [MEMORY[0x189612760] sharedCore];
    id v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v21 buildError:8111 underlying:0 description:v19];
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    [v20 _reportAnomaly:v22 issuingCompletion:0];

    [*(id *)(a1 + 32) setCurrentDownloadConfig:0];
    [*(id *)(a1 + 32) setRequestedDownloadConfig:0];
    [*(id *)(a1 + 32) setDesiredDownloadConfig:0];

    goto LABEL_29;
  }

  [*(id *)(a1 + 32) desiredDownloadConfig];
  id v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35) {
    goto LABEL_15;
  }
LABEL_29:
  [*(id *)(a1 + 32) setDownloadOptions:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) setDocumentationStashBuild:*(void *)(a1 + 56)];
  [MEMORY[0x1896127A0] sharedLogger];
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  [v23 oslog];
  uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v25 = *(void *)(a1 + 56);
    *(_DWORD *)buf = 138412290;
    uint64_t v38 = v25;
    _os_log_impl(&dword_187A54000, v24, OS_LOG_TYPE_DEFAULT, "Setting stashDocumentationBuild=%@", buf, 0xCu);
  }

  id v26 = objc_alloc_init(MEMORY[0x189611108]);
  [*(id *)(a1 + 32) setCurrentDownloadConfig:v26];

  [*(id *)(a1 + 32) downloadOptions];
  BOOL v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    [*(id *)(a1 + 32) downloadOptions];
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v29 = [v28 discretionary];
    [*(id *)(a1 + 32) currentDownloadConfig];
    id v30 = (void *)objc_claimAutoreleasedReturnValue();
    [v30 setDiscretionary:v29];
  }

  [*(id *)(a1 + 32) setDownloadCompletion:*(void *)(a1 + 64)];
  id v31 = objc_alloc(NSString);
  [*(id *)(a1 + 32) _updateAssetTypeName];
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) updateUUID];
  dispatch_queue_t v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)[v31 initWithFormat:@"[MA-DOWNLOAD:%@(%@)]", v32, v33];
  [*(id *)(a1 + 32) setOperationName:v34];

  [*(id *)(a1 + 32) setDownloadingAsset:1];
  [*(id *)(a1 + 32) setAssetDownloaded:0];
  [*(id *)(a1 + 32) setAssetRemoved:0];
  [*(id *)(a1 + 32) _registerProgressAndStartDownload];
}

- (void)_registerProgressAndStartDownload
{
}

void __54__SUCoreMobileAsset__registerProgressAndStartDownload__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) maControlQueue];
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __54__SUCoreMobileAsset__registerProgressAndStartDownload__block_invoke_2;
  v6[3] = &unk_18A0F0510;
  v6[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);
}

void __54__SUCoreMobileAsset__registerProgressAndStartDownload__block_invoke_2(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  if (([*(id *)(a1 + 32) removingAsset] & 1) != 0
    || [*(id *)(a1 + 32) assetRemoved])
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v2 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 oslog];
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = *(void **)(a1 + 32);
      else {
        id v5 = @"NO";
      }
      int v6 = [*(id *)(a1 + 32) assetRemoved];
      *(_DWORD *)buf = 138543874;
      if (v6) {
        id v7 = @"YES";
      }
      else {
        id v7 = @"NO";
      }
      v22 = v4;
      __int16 v23 = 2114;
      uint64_t v24 = v5;
      __int16 v25 = 2114;
      id v26 = v7;
      _os_log_impl( &dword_187A54000,  v3,  OS_LOG_TYPE_DEFAULT,  "%{public}@ download progress when removing(%{public}@), removed(%{public}@) - progress report ignored",  buf,  0x20u);
    }
  }

  else if ([*(id *)(a1 + 32) downloadingAsset])
  {
    float v8 = 0.0;
    if ([*(id *)(a1 + 40) totalWritten] >= 1 && objc_msgSend(*(id *)(a1 + 40), "totalExpected"))
    {
      float v9 = (float)[*(id *)(a1 + 40) totalWritten];
      float v8 = v9 / (float)[*(id *)(a1 + 40) totalExpected];
    }

    id v10 = objc_alloc(MEMORY[0x1896127B8]);
    uint64_t v11 = *MEMORY[0x189612A18];
    uint64_t v12 = [*(id *)(a1 + 40) isStalled];
    uint64_t v13 = [*(id *)(a1 + 40) totalWritten];
    uint64_t v14 = [*(id *)(a1 + 40) totalExpected];
    [*(id *)(a1 + 40) expectedTimeRemaining];
    double v16 = v15;
    [*(id *)(a1 + 40) taskDescription];
    BOOL v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&double v18 = v8;
    id v20 = (id)[v10 initWithPhase:v11 isStalled:v12 portionComplete:v13 totalWrittenBytes:v14 totalExpectedBytes:v17 remaining:v18 taskDescription:v16];

    id v19 = *(void **)(a1 + 32);
    if (v20) {
      objc_msgSend(v19, "_reportDownloadProgress:");
    }
    else {
      [v19 _trackMAAnomaly:@"PROGRESS" result:8100 description:@"unable to create progress report"];
    }
  }

  else
  {
    [*(id *)(a1 + 32) _trackMAAnomaly:@"PROGRESS" result:8115 description:@"progress indication when not downloading (and not removing)"];
  }

void __54__SUCoreMobileAsset__registerProgressAndStartDownload__block_invoke_734( uint64_t a1,  uint64_t a2,  void *a3)
{
  id v5 = a3;
  [*(id *)(a1 + 32) _trackMobileAssetEnd:@"startDownload" withResult:a2 withError:v5];
  [*(id *)(a1 + 32) maControlQueue];
  int v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __54__SUCoreMobileAsset__registerProgressAndStartDownload__block_invoke_2_735;
  block[3] = &unk_18A0F1570;
  uint64_t v7 = *(void *)(a1 + 32);
  id v10 = v5;
  uint64_t v11 = a2;
  void block[4] = v7;
  id v8 = v5;
  dispatch_async(v6, block);
}

void __54__SUCoreMobileAsset__registerProgressAndStartDownload__block_invoke_2_735(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) downloadingAsset];
  id v3 = *(void **)(a1 + 32);
  if (v2)
  {
    [v3 setDownloadingAsset:0];
    uint64_t v4 = *(void *)(a1 + 48);
    if (v4 == 10 || v4 == 0)
    {
      int v6 = *(void **)(a1 + 32);
      id v7 = objc_alloc(MEMORY[0x1896127B8]);
      LODWORD(v8) = 1.0;
      float v9 = (void *)[v7 initWithPhase:*MEMORY[0x189612A18] isStalled:0 portionComplete:-1 totalWrittenBytes:-1 totalExpectedBytes:v8 remaining:0.0];
      [v6 _reportDownloaded:v9];

      if (([*(id *)(a1 + 32) removingAsset] & 1) == 0) {
        [*(id *)(a1 + 32) setAssetDownloaded:1];
      }
    }

    else
    {
      [MEMORY[0x189612760] sharedCore];
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 buildError:8700 underlying:*(void *)(a1 + 40) description:@"failed to download asset"];
      id v11 = (id)objc_claimAutoreleasedReturnValue();

      [*(id *)(a1 + 32) _reportDownloadFailed:v11];
    }
  }

  else
  {
    [v3 _trackMAAnomaly:@"DOWNLOAD" result:8115 description:@"download finished when not downloading"];
  }

- (void)_requestChangeConfigDownload:(id)a3
{
  id v4 = a3;
  -[SUCoreMobileAsset maControlQueue](self, "maControlQueue");
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreMobileAsset asset](self, "asset");
  int v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SUCoreMobileAsset setRequestedDownloadConfig:](self, "setRequestedDownloadConfig:", v4);
    id v7 = objc_alloc(NSString);
    -[SUCoreMobileAsset operationName](self, "operationName");
    double v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[SUCoreMobileAsset downloadConfigSummary:](&OBJC_CLASS___SUCoreMobileAsset, "downloadConfigSummary:", v4);
    float v9 = (void *)objc_claimAutoreleasedReturnValue();
    id v10 = (void *)[v7 initWithFormat:@"%@ [requesting (%@)]", v8, v9];

    -[SUCoreMobileAsset _trackMobileAssetBegin:withIdentifier:]( self,  "_trackMobileAssetBegin:withIdentifier:",  @"configDownload",  v10);
    -[SUCoreMobileAsset asset](self, "asset");
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1895F87A8];
    v21[1] = 3221225472LL;
    v21[2] = __50__SUCoreMobileAsset__requestChangeConfigDownload___block_invoke;
    v21[3] = &unk_18A0F1610;
    v21[4] = self;
    id v22 = v10;
    id v12 = v10;
    objc_msgSend(v11, "SUCoreBorder_configDownload:completion:", v4, v21);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 oslog];
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[SUCoreMobileAsset _requestChangeConfigDownload:].cold.1((uint64_t)self, v14, v15, v16, v17, v18, v19, v20);
    }

    -[SUCoreMobileAsset setRequestedDownloadConfig:](self, "setRequestedDownloadConfig:", 0LL);
    -[SUCoreMobileAsset setDesiredDownloadConfig:](self, "setDesiredDownloadConfig:", 0LL);
    id v12 = (id)[objc_alloc(NSString) initWithFormat:@"alter download config failed - unable to change download config (self.asset is not present)"];
    -[SUCoreMobileAsset _issueAlterDownloadCompletion:forReason:]( self,  "_issueAlterDownloadCompletion:forReason:",  8703LL,  v12);
  }
}

void __50__SUCoreMobileAsset__requestChangeConfigDownload___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __50__SUCoreMobileAsset__requestChangeConfigDownload___block_invoke_2;
  v5[3] = &unk_18A0F15E8;
  v5[4] = *(void *)(a1 + 32);
  v5[5] = a2;
  dispatch_async(v4, v5);
}

void __50__SUCoreMobileAsset__requestChangeConfigDownload___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2 == 2)
  {
    [*(id *)(a1 + 32) alterDownloadCompletion];
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
    }

    else if (([*(id *)(a1 + 32) checkedDownloadState] & 1) == 0)
    {
      [*(id *)(a1 + 32) setCheckedDownloadState:1];
      [MEMORY[0x189612760] sharedCore];
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v12 waitedOperationQueue];
      uint64_t v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __50__SUCoreMobileAsset__requestChangeConfigDownload___block_invoke_3;
      block[3] = &unk_18A0EF970;
      void block[4] = *(void *)(a1 + 32);
      dispatch_async(v13, block);

      return;
    }

    uint64_t v2 = *(void *)(a1 + 40);
  }

  id v4 = *(void **)(a1 + 32);
  if (v2)
  {
    [v4 setRequestedDownloadConfig:0];
    [*(id *)(a1 + 32) setDesiredDownloadConfig:0];
    id v5 = *(void **)(a1 + 32);
    id v14 = (id)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"alter download config failed with result:%ld (MAOperationResult)",  *(void *)(a1 + 40));
    [v5 _issueAlterDownloadCompletion:8703 forReason:v14];
LABEL_8:

    return;
  }

  [v4 requestedDownloadConfig];
  int v6 = (void *)objc_claimAutoreleasedReturnValue();

  id v7 = *(void **)(a1 + 32);
  if (v6)
  {
    [v7 requestedDownloadConfig];
    double v8 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) setCurrentDownloadConfig:v8];

    [*(id *)(a1 + 32) setRequestedDownloadConfig:0];
    [*(id *)(a1 + 32) desiredDownloadConfig];
    float v9 = (void *)objc_claimAutoreleasedReturnValue();

    id v10 = *(void **)(a1 + 32);
    if (v9)
    {
      [v10 desiredDownloadConfig];
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      [*(id *)(a1 + 32) setDesiredDownloadConfig:0];
      [*(id *)(a1 + 32) _requestChangeConfigDownload:v14];
      goto LABEL_8;
    }

    id v11 = @"successful config and no later desired config";
  }

  else
  {
    [v7 _trackMAAnomaly:@"CONFIG" result:8101 description:@"successful config change when no change requested"];
    [*(id *)(a1 + 32) setDesiredDownloadConfig:0];
    id v10 = *(void **)(a1 + 32);
    id v11 = @"successful config change when no requested config";
  }

  [v10 _issueAlterDownloadCompletion:0 forReason:v11];
}

void __50__SUCoreMobileAsset__requestChangeConfigDownload___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  unsigned int v3 = objc_msgSend(v2, "SUCoreBorder_refreshState");

  [*(id *)(a1 + 32) _trackMobileAssetEnd:@"refreshState" withResult:v3 withError:0];
  [*(id *)(a1 + 32) maControlQueue];
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __50__SUCoreMobileAsset__requestChangeConfigDownload___block_invoke_4;
  v5[3] = &unk_18A0F15C0;
  char v6 = v3;
  v5[4] = *(void *)(a1 + 32);
  dispatch_async(v4, v5);
}

void __50__SUCoreMobileAsset__requestChangeConfigDownload___block_invoke_4(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 40);
  unsigned int v3 = *(void **)(a1 + 32);
  if (!v2)
  {
    [v3 setRequestedDownloadConfig:0];
    [*(id *)(a1 + 32) setDesiredDownloadConfig:0];
    float v9 = *(void **)(a1 + 32);
    id v10 = @"alter download config failed to config and failed to refresh state";
    uint64_t v11 = 8115LL;
    goto LABEL_6;
  }

  [v3 desiredDownloadConfig];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    [*(id *)(a1 + 32) currentDownloadConfig];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) desiredDownloadConfig];
    char v6 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v7 = +[SUCoreMobileAsset downloadConfig:isEqualToConfig:]( &OBJC_CLASS___SUCoreMobileAsset,  "downloadConfig:isEqualToConfig:",  v5,  v6);

    double v8 = *(void **)(a1 + 32);
    if (v7)
    {
      [v8 setRequestedDownloadConfig:0];
      [*(id *)(a1 + 32) setDesiredDownloadConfig:0];
      float v9 = *(void **)(a1 + 32);
      id v10 = @"successfully refreshed state when desired config matches current config";
      uint64_t v11 = 0LL;
LABEL_6:
      [v9 _issueAlterDownloadCompletion:v11 forReason:v10];
      return;
    }

    [v8 desiredDownloadConfig];
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) setDesiredDownloadConfig:0];
  }

  else
  {
    [*(id *)(a1 + 32) requestedDownloadConfig];
    id v12 = (id)objc_claimAutoreleasedReturnValue();
  }

  [*(id *)(a1 + 32) setRequestedDownloadConfig:0];
  [*(id *)(a1 + 32) _requestChangeConfigDownload:v12];
}

- (void)_issueAlterDownloadCompletion:(int64_t)a3 forReason:(id)a4
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  id v6 = a4;
  -[SUCoreMobileAsset maControlQueue](self, "maControlQueue");
  BOOL v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  [MEMORY[0x1896127A0] sharedLogger];
  double v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 oslog];
  float v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (a3)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SUCoreMobileAsset _issueAlterDownloadCompletion:forReason:].cold.1();
    }

    [MEMORY[0x189612760] sharedCore];
    float v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    -[os_log_s buildError:underlying:description:](v9, "buildError:underlying:description:", a3, 0LL, v6);
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[SUCoreMobileAsset currentDownloadConfig](self, "currentDownloadConfig");
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[SUCoreMobileAsset downloadConfigSummary:](&OBJC_CLASS___SUCoreMobileAsset, "downloadConfigSummary:", v11);
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      uint64_t v24 = self;
      __int16 v25 = 2114;
      id v26 = v12;
      __int16 v27 = 2114;
      id v28 = v6;
      _os_log_impl( &dword_187A54000,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@ successfully altered download config (%{public}@) | %{public}@",  buf,  0x20u);
    }

    id v10 = 0LL;
  }

  -[SUCoreMobileAsset alterDownloadCompletion](self, "alterDownloadCompletion");
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[SUCoreMobileAsset alterDownloadCompletion](self, "alterDownloadCompletion");
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreMobileAsset alterDownloadTransaction](self, "alterDownloadTransaction");
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreMobileAsset setAlterDownloadCompletion:](self, "setAlterDownloadCompletion:", 0LL);
    -[SUCoreMobileAsset setAlterDownloadTransaction:](self, "setAlterDownloadTransaction:", 0LL);
    -[SUCoreMobileAsset clientCompletionQueue](self, "clientCompletionQueue");
    uint64_t v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __61__SUCoreMobileAsset__issueAlterDownloadCompletion_forReason___block_invoke;
    block[3] = &unk_18A0EF8F8;
    id v22 = v14;
    id v20 = v10;
    id v21 = v15;
    id v17 = v15;
    id v18 = v14;
    dispatch_async(v16, block);
  }
}

uint64_t __61__SUCoreMobileAsset__issueAlterDownloadCompletion_forReason___block_invoke(uint64_t a1)
{
  return [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 40) withName:@"ma.AlterDownloadOptions"];
}

- (void)_cancelDownloadAndPurge
{
  unsigned int v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SUCoreMobileAsset asset](self, "asset");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SUCoreMobileAsset _trackMobileAssetBegin:](self, "_trackMobileAssetBegin:", @"cancelDownload");
    -[SUCoreMobileAsset asset](self, "asset");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 3221225472LL;
    v8[2] = __44__SUCoreMobileAsset__cancelDownloadAndPurge__block_invoke;
    v8[3] = &unk_18A0F02D8;
    v8[4] = self;
    objc_msgSend(v5, "SUCoreBorder_cancelDownload:", v8);
  }

  else
  {
    [MEMORY[0x189612760] sharedCore];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 buildError:8701 underlying:0 description:@"failed to purge asset (self.asset is not present)"];
    id v7 = (id)objc_claimAutoreleasedReturnValue();

    -[SUCoreMobileAsset _reportAssetRemoveFailed:](self, "_reportAssetRemoveFailed:", v7);
  }

void __44__SUCoreMobileAsset__cancelDownloadAndPurge__block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __44__SUCoreMobileAsset__cancelDownloadAndPurge__block_invoke_2;
  v4[3] = &unk_18A0F1598;
  v4[4] = *(void *)(a1 + 32);
  objc_msgSend(v3, "SUCoreBorder_purgeWithError:", v4);
}

void __44__SUCoreMobileAsset__cancelDownloadAndPurge__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  [*(id *)(a1 + 32) _trackMobileAssetEnd:@"purgeWithError" withResult:a2 withError:v5];
  [*(id *)(a1 + 32) maControlQueue];
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __44__SUCoreMobileAsset__cancelDownloadAndPurge__block_invoke_3;
  block[3] = &unk_18A0F1570;
  uint64_t v7 = *(void *)(a1 + 32);
  id v10 = v5;
  uint64_t v11 = a2;
  void block[4] = v7;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __44__SUCoreMobileAsset__cancelDownloadAndPurge__block_invoke_3(uint64_t a1)
{
  if (![*(id *)(a1 + 32) removingAsset]) {
    return [*(id *)(a1 + 32) _trackMAAnomaly:@"CANCEL" result:8115 description:@"purge finished when not removing"];
  }
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2 == 3 || v2 == 0)
  {
    [*(id *)(a1 + 32) _reportAssetRemoved];
  }

  else
  {
    [MEMORY[0x189612760] sharedCore];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 buildError:8701 underlying:*(void *)(a1 + 40) description:@"failed to purge asset"];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();

    [*(id *)(a1 + 32) _reportAssetRemoveFailed:v6];
  }

  [*(id *)(a1 + 32) setAssetRemoved:1];
  return [*(id *)(a1 + 32) setRemovingAsset:0];
}

- (void)_reportDownloadProgress:(id)a3
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[SUCoreMobileAsset maControlQueue](self, "maControlQueue");
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (!-[SUCoreMobileAsset removingAsset](self, "removingAsset")
    && !-[SUCoreMobileAsset assetRemoved](self, "assetRemoved"))
  {
    int v6 = [v4 isStalled];
    -[SUCoreMobileAsset maDelegate](self, "maDelegate");
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      char v8 = objc_opt_respondsToSelector();

      if ((v8 & 1) != 0)
      {
        -[SUCoreMobileAsset clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
        float v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1895F87A8];
        block[1] = 3221225472LL;
        block[2] = __45__SUCoreMobileAsset__reportDownloadProgress___block_invoke;
        block[3] = &unk_18A0F0510;
        void block[4] = self;
        id v19 = v4;
        dispatch_async(v9, block);

        id v10 = v19;
LABEL_8:

        goto LABEL_12;
      }
    }

    else
    {
      int v11 = objc_opt_respondsToSelector();

      if ((v11 & 1) != 0)
      {
        -[SUCoreMobileAsset clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
        id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
        v16[0] = MEMORY[0x1895F87A8];
        v16[1] = 3221225472LL;
        v16[2] = __45__SUCoreMobileAsset__reportDownloadProgress___block_invoke_2;
        v16[3] = &unk_18A0F0510;
        v16[4] = self;
        id v17 = v4;
        dispatch_async(v12, v16);

        id v10 = v17;
        goto LABEL_8;
      }
    }

    [MEMORY[0x1896127A0] sharedLogger];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 oslog];
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      [v4 summary];
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      id v21 = self;
      __int16 v22 = 2114;
      __int16 v23 = v15;
      _os_log_impl( &dword_187A54000,  v14,  OS_LOG_TYPE_DEFAULT,  "%{public}@ download progress (not reported): progress=%{public}@",  buf,  0x16u);
    }
  }

void __45__SUCoreMobileAsset__reportDownloadProgress___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 maDownloadStalled:*(void *)(a1 + 40)];
}

void __45__SUCoreMobileAsset__reportDownloadProgress___block_invoke_2(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 maDownloadProgress:*(void *)(a1 + 40)];
}

- (void)_reportDownloaded:(id)a3
{
  uint64_t v50 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[SUCoreMobileAsset maControlQueue](self, "maControlQueue");
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  [MEMORY[0x1896127A0] sharedLogger];
  int v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 oslog];
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[SUCoreMobileAsset documentationStashBuild](self, "documentationStashBuild");
    char v8 = (SUCoreMobileAsset *)objc_claimAutoreleasedReturnValue();
    +[SUCoreDocumentationDataManager sharedManager](&OBJC_CLASS___SUCoreDocumentationDataManager, "sharedManager");
    float v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    id v47 = v8;
    __int16 v48 = 2112;
    id v49 = v9;
    _os_log_impl( &dword_187A54000,  v7,  OS_LOG_TYPE_DEFAULT,  "Report downloaded, found stashDocumentationBuild=%@ sharedmanager:%@",  buf,  0x16u);
  }

  -[SUCoreMobileAsset documentationStashBuild](self, "documentationStashBuild");
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    [MEMORY[0x1896127A0] sharedLogger];
    int v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 oslog];
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      -[SUCoreMobileAsset documentationStashBuild](self, "documentationStashBuild");
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      id v47 = self;
      __int16 v48 = 2114;
      id v49 = v13;
      _os_log_impl( &dword_187A54000,  v12,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Stashing documentation asset for build: %{public}@",  buf,  0x16u);
    }

    +[SUCoreDocumentationDataManager sharedManager](&OBJC_CLASS___SUCoreDocumentationDataManager, "sharedManager");
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreMobileAsset asset](self, "asset");
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreMobileAsset documentationStashBuild](self, "documentationStashBuild");
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    id v45 = 0LL;
    char v17 = [v14 stashDocumentationAssetData:v15 forBuildVersion:v16 error:&v45];
    id v18 = v45;

    if ((v17 & 1) == 0)
    {
      [MEMORY[0x1896127A0] sharedLogger];
      id v19 = (void *)objc_claimAutoreleasedReturnValue();
      [v19 oslog];
      id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[SUCoreMobileAsset _reportDownloaded:].cold.1();
      }
    }

    -[SUCoreMobileAsset setDocumentationStashBuild:](self, "setDocumentationStashBuild:", 0LL);
  }

  if (-[SUCoreMobileAsset removingAsset](self, "removingAsset")
    || -[SUCoreMobileAsset assetRemoved](self, "assetRemoved")
    || (-[SUCoreMobileAsset maDelegate](self, "maDelegate"),
        id v21 = (void *)objc_claimAutoreleasedReturnValue(),
        char v22 = objc_opt_respondsToSelector(),
        v21,
        (v22 & 1) == 0))
  {
    char v26 = 0;
  }

  else
  {
    [MEMORY[0x189612760] beginTransactionWithName:@"ma.DownloadAsset.Delegate"];
    __int16 v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreMobileAsset clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    uint64_t v24 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __39__SUCoreMobileAsset__reportDownloaded___block_invoke;
    block[3] = &unk_18A0F03C8;
    void block[4] = self;
    id v43 = v4;
    id v44 = v23;
    id v25 = v23;
    dispatch_async(v24, block);

    char v26 = 1;
  }

  -[SUCoreMobileAsset downloadCompletion](self, "downloadCompletion");
  __int16 v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    -[SUCoreMobileAsset downloadCompletion](self, "downloadCompletion");
    id v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreMobileAsset setDownloadCompletion:](self, "setDownloadCompletion:", 0LL);
    [MEMORY[0x189612760] beginTransactionWithName:@"ma.DownloadAsset.Completion"];
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreMobileAsset clientCompletionQueue](self, "clientCompletionQueue");
    id v30 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    uint64_t v36 = MEMORY[0x1895F87A8];
    uint64_t v37 = 3221225472LL;
    uint64_t v38 = __39__SUCoreMobileAsset__reportDownloaded___block_invoke_2;
    uint64_t v39 = &unk_18A0EFB00;
    id v40 = v29;
    id v41 = v28;
    id v31 = v29;
    v32 = v28;
    dispatch_async(v30, &v36);

LABEL_18:
    goto LABEL_19;
  }

  if ((v26 & 1) != 0) {
    goto LABEL_20;
  }
  [MEMORY[0x1896127A0] sharedLogger];
  id v35 = (void *)objc_claimAutoreleasedReturnValue();
  [v35 oslog];
  v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    [v4 summary];
    id v31 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    id v47 = self;
    __int16 v48 = 2114;
    id v49 = v31;
    _os_log_impl( &dword_187A54000,  v32,  OS_LOG_TYPE_DEFAULT,  "%{public}@ downloaded (not reported): progress=%{public}@",  buf,  0x16u);
    goto LABEL_18;
  }

uint64_t __39__SUCoreMobileAsset__reportDownloaded___block_invoke(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 maDownloaded:*(void *)(a1 + 40)];

  return [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 48) withName:@"ma.DownloadAsset.Delegate"];
}

uint64_t __39__SUCoreMobileAsset__reportDownloaded___block_invoke_2(uint64_t a1)
{
  return [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 32) withName:@"ma.DownloadAsset.Completion"];
}

- (void)_reportDownloadFailed:(id)a3
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[SUCoreMobileAsset maControlQueue](self, "maControlQueue");
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  [MEMORY[0x1896127A0] sharedLogger];
  int v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 oslog];
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[SUCoreMobileAsset documentationStashBuild](self, "documentationStashBuild");
    char v8 = (SUCoreMobileAsset *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    id v35 = v8;
    _os_log_impl( &dword_187A54000,  v7,  OS_LOG_TYPE_DEFAULT,  "Report download failed, found stashDocumentationBuild=%@",  buf,  0xCu);
  }

  if (-[SUCoreMobileAsset removingAsset](self, "removingAsset")
    || -[SUCoreMobileAsset assetRemoved](self, "assetRemoved")
    || (-[SUCoreMobileAsset maDelegate](self, "maDelegate"),
        float v9 = (void *)objc_claimAutoreleasedReturnValue(),
        char v10 = objc_opt_respondsToSelector(),
        v9,
        (v10 & 1) == 0))
  {
    char v14 = 0;
  }

  else
  {
    [MEMORY[0x189612760] beginTransactionWithName:@"ma.DownloadAsset.Delegate"];
    int v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreMobileAsset clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __43__SUCoreMobileAsset__reportDownloadFailed___block_invoke;
    block[3] = &unk_18A0F03C8;
    void block[4] = self;
    id v32 = v4;
    id v33 = v11;
    id v13 = v11;
    dispatch_async(v12, block);

    char v14 = 1;
  }

  -[SUCoreMobileAsset downloadCompletion](self, "downloadCompletion");
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[SUCoreMobileAsset downloadCompletion](self, "downloadCompletion");
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreMobileAsset setDownloadCompletion:](self, "setDownloadCompletion:", 0LL);
    [MEMORY[0x189612760] beginTransactionWithName:@"ma.DownloadAsset.Completion"];
    char v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreMobileAsset clientCompletionQueue](self, "clientCompletionQueue");
    id v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    uint64_t v24 = MEMORY[0x1895F87A8];
    uint64_t v25 = 3221225472LL;
    char v26 = __43__SUCoreMobileAsset__reportDownloadFailed___block_invoke_2;
    __int16 v27 = &unk_18A0EF8F8;
    id v30 = v16;
    id v28 = v4;
    id v29 = v17;
    id v19 = v17;
    id v20 = v16;
    dispatch_async(v18, &v24);
  }

  else
  {
    if ((v14 & 1) != 0) {
      goto LABEL_11;
    }
    [MEMORY[0x1896127A0] sharedLogger];
    __int16 v23 = (void *)objc_claimAutoreleasedReturnValue();
    [v23 oslog];
    id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v35 = self;
      __int16 v36 = 2114;
      id v37 = v4;
      _os_log_impl( &dword_187A54000,  v20,  OS_LOG_TYPE_DEFAULT,  "%{public}@ download failed (not reported): error=%{public}@",  buf,  0x16u);
    }
  }

LABEL_11:
  -[SUCoreMobileAsset setDocumentationStashBuild:](self, "setDocumentationStashBuild:", 0LL, v24, v25, v26, v27);
  id v21 = (void *)MEMORY[0x189612760];
  -[SUCoreMobileAsset downloadAssetTransaction](self, "downloadAssetTransaction");
  char v22 = (void *)objc_claimAutoreleasedReturnValue();
  [v21 endTransaction:v22 withName:@"ma.DownloadAsset"];

  -[SUCoreMobileAsset setDownloadAssetTransaction:](self, "setDownloadAssetTransaction:", 0LL);
}

uint64_t __43__SUCoreMobileAsset__reportDownloadFailed___block_invoke(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 maDownloadFailed:*(void *)(a1 + 40)];

  return [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 48) withName:@"ma.DownloadAsset.Delegate"];
}

uint64_t __43__SUCoreMobileAsset__reportDownloadFailed___block_invoke_2(uint64_t a1)
{
  return [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 40) withName:@"ma.DownloadAsset.Completion"];
}

- (void)_reportAssetRemoved
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  -[SUCoreMobileAsset maControlQueue](self, "maControlQueue");
  unsigned int v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SUCoreMobileAsset maDelegate](self, "maDelegate");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v5 = objc_opt_respondsToSelector();

  uint64_t v6 = MEMORY[0x1895F87A8];
  if ((v5 & 1) != 0)
  {
    [MEMORY[0x189612760] beginTransactionWithName:@"ma.RemoveAsset.Delegate"];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreMobileAsset clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    char v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = v6;
    block[1] = 3221225472LL;
    block[2] = __40__SUCoreMobileAsset__reportAssetRemoved__block_invoke;
    block[3] = &unk_18A0F0510;
    void block[4] = self;
    id v26 = v7;
    id v9 = v7;
    dispatch_async(v8, block);
  }

  -[SUCoreMobileAsset removeCompletion](self, "removeCompletion");
  char v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[SUCoreMobileAsset removeCompletion](self, "removeCompletion");
    int v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreMobileAsset setRemoveCompletion:](self, "setRemoveCompletion:", 0LL);
    [MEMORY[0x189612760] beginTransactionWithName:@"ma.RemoveAsset.Completion"];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreMobileAsset clientCompletionQueue](self, "clientCompletionQueue");
    id v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    uint64_t v19 = v6;
    uint64_t v20 = 3221225472LL;
    id v21 = __40__SUCoreMobileAsset__reportAssetRemoved__block_invoke_2;
    char v22 = &unk_18A0EFB00;
    id v23 = v12;
    id v24 = v11;
    id v14 = v12;
    uint64_t v15 = v11;
    dispatch_async(v13, &v19);
  }

  else
  {
    if ((v5 & 1) != 0) {
      goto LABEL_6;
    }
    [MEMORY[0x1896127A0] sharedLogger];
    id v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 oslog];
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v28 = self;
      _os_log_impl(&dword_187A54000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ asset removed (not reported)", buf, 0xCu);
    }
  }

LABEL_6:
  uint64_t v16 = (void *)MEMORY[0x189612760];
  -[SUCoreMobileAsset removeAssetTransaction](self, "removeAssetTransaction", v19, v20, v21, v22);
  char v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 endTransaction:v17 withName:@"ma.RemoveAsset"];

  -[SUCoreMobileAsset setRemoveAssetTransaction:](self, "setRemoveAssetTransaction:", 0LL);
}

uint64_t __40__SUCoreMobileAsset__reportAssetRemoved__block_invoke(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 maAssetRemoved];

  return [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 40) withName:@"ma.RemoveAsset.Delegate"];
}

uint64_t __40__SUCoreMobileAsset__reportAssetRemoved__block_invoke_2(uint64_t a1)
{
  return [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 32) withName:@"ma.RemoveAsset.Completion"];
}

- (void)_reportAssetRemoveFailed:(id)a3
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[SUCoreMobileAsset maControlQueue](self, "maControlQueue");
  char v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreMobileAsset maDelegate](self, "maDelegate");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  char v7 = objc_opt_respondsToSelector();

  uint64_t v8 = MEMORY[0x1895F87A8];
  if ((v7 & 1) != 0)
  {
    [MEMORY[0x189612760] beginTransactionWithName:@"ma.RemoveAsset.Delegate"];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreMobileAsset clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    char v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = v8;
    block[1] = 3221225472LL;
    block[2] = __46__SUCoreMobileAsset__reportAssetRemoveFailed___block_invoke;
    block[3] = &unk_18A0F03C8;
    void block[4] = self;
    id v29 = v4;
    id v30 = v9;
    id v11 = v9;
    dispatch_async(v10, block);
  }

  -[SUCoreMobileAsset removeCompletion](self, "removeCompletion");
  id v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[SUCoreMobileAsset removeCompletion](self, "removeCompletion");
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreMobileAsset setRemoveCompletion:](self, "setRemoveCompletion:", 0LL);
    [MEMORY[0x189612760] beginTransactionWithName:@"ma.RemoveAsset.Completion"];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreMobileAsset clientCompletionQueue](self, "clientCompletionQueue");
    uint64_t v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    uint64_t v21 = v8;
    uint64_t v22 = 3221225472LL;
    id v23 = __46__SUCoreMobileAsset__reportAssetRemoveFailed___block_invoke_2;
    id v24 = &unk_18A0EF8F8;
    id v27 = v13;
    id v25 = v4;
    id v26 = v14;
    id v16 = v14;
    char v17 = v13;
    dispatch_async(v15, &v21);
  }

  else
  {
    if ((v7 & 1) != 0) {
      goto LABEL_6;
    }
    [MEMORY[0x1896127A0] sharedLogger];
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v20 oslog];
    char v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v32 = self;
      __int16 v33 = 2114;
      id v34 = v4;
      _os_log_impl( &dword_187A54000,  v17,  OS_LOG_TYPE_DEFAULT,  "%{public}@ asset remove failed (not reported): error=%{public}@",  buf,  0x16u);
    }
  }

LABEL_6:
  id v18 = (void *)MEMORY[0x189612760];
  -[SUCoreMobileAsset removeAssetTransaction](self, "removeAssetTransaction", v21, v22, v23, v24);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v18 endTransaction:v19 withName:@"ma.RemoveAsset"];

  -[SUCoreMobileAsset setRemoveAssetTransaction:](self, "setRemoveAssetTransaction:", 0LL);
}

uint64_t __46__SUCoreMobileAsset__reportAssetRemoveFailed___block_invoke(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 maAssetRemoveFailed:*(void *)(a1 + 40)];

  return [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 48) withName:@"ma.RemoveAsset.Delegate"];
}

uint64_t __46__SUCoreMobileAsset__reportAssetRemoveFailed___block_invoke_2(uint64_t a1)
{
  return [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 40) withName:@"ma.RemoveAsset.Completion"];
}

- (void)_reportAnomaly:(id)a3
{
}

- (void)_reportAnomaly:(id)a3 issuingCompletion:(id)a4
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  -[SUCoreMobileAsset maControlQueue](self, "maControlQueue");
  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[SUCoreMobileAsset maDelegate](self, "maDelegate");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  char v10 = objc_opt_respondsToSelector();

  uint64_t v11 = MEMORY[0x1895F87A8];
  if ((v10 & 1) != 0)
  {
    -[SUCoreMobileAsset clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = v11;
    block[1] = 3221225472LL;
    block[2] = __54__SUCoreMobileAsset__reportAnomaly_issuingCompletion___block_invoke;
    block[3] = &unk_18A0F0510;
    void block[4] = self;
    id v20 = v6;
    dispatch_async(v12, block);

    if (!v7) {
      goto LABEL_7;
    }
  }

  else if (!v7)
  {
    [MEMORY[0x1896127A0] sharedLogger];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 oslog];
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v22 = self;
      __int16 v23 = 2114;
      id v24 = v6;
      _os_log_impl( &dword_187A54000,  v14,  OS_LOG_TYPE_DEFAULT,  "%{public}@ anomaly (not reported): error=%{public}@",  buf,  0x16u);
    }

    goto LABEL_6;
  }

  -[SUCoreMobileAsset clientCompletionQueue](self, "clientCompletionQueue");
  id v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v16[0] = v11;
  v16[1] = 3221225472LL;
  v16[2] = __54__SUCoreMobileAsset__reportAnomaly_issuingCompletion___block_invoke_2;
  v16[3] = &unk_18A0EFB00;
  id v18 = (os_log_s *)v7;
  id v17 = v6;
  dispatch_async(v13, v16);

  id v14 = v18;
LABEL_6:

LABEL_7:
}

void __54__SUCoreMobileAsset__reportAnomaly_issuingCompletion___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 maAnomaly:*(void *)(a1 + 40)];
}

uint64_t __54__SUCoreMobileAsset__reportAnomaly_issuingCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

- (void)_trackMobileAssetBegin:(id)a3
{
  id v4 = a3;
  -[SUCoreMobileAsset operationName](self, "operationName");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SUCoreMobileAsset _trackMobileAssetBegin:withIdentifier:](self, "_trackMobileAssetBegin:withIdentifier:", v4, v5);
}

- (void)_trackMobileAssetBegin:(id)a3 withIdentifier:(id)a4
{
  id v5 = (void *)MEMORY[0x189612778];
  id v6 = a4;
  id v7 = a3;
  [v5 sharedDiag];
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v8 trackBegin:v7 atLevel:1 forModule:@"ma" withIdentifier:v6];
}

- (void)_trackMobileAssetEnd:(id)a3 withResult:(int64_t)a4 withError:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  -[SUCoreMobileAsset operationName](self, "operationName");
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  -[SUCoreMobileAsset _trackMobileAssetEnd:withIdentifier:withResult:withError:]( self,  "_trackMobileAssetEnd:withIdentifier:withResult:withError:",  v9,  v10,  a4,  v8);
}

- (void)_trackMobileAssetEnd:(id)a3 withIdentifier:(id)a4 withResult:(int64_t)a5 withError:(id)a6
{
  id v9 = (void *)MEMORY[0x189612778];
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  [v9 sharedDiag];
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  [v13 trackEnd:v12 atLevel:1 forModule:@"ma" withIdentifier:v11 withResult:a5 withError:v10];
}

- (void)_trackMAAnomaly:(id)a3 result:(int64_t)a4 description:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  -[SUCoreMobileAsset maControlQueue](self, "maControlQueue");
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  [MEMORY[0x189612760] sharedCore];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 buildError:a4 underlying:0 description:v8];
  id v15 = (id)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x189612778] sharedDiag];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  id v13 = (void *)[objc_alloc(NSString) initWithFormat:@"[MA] %@", v9];

  id v14 = (void *)[objc_alloc(NSString) initWithFormat:@"%@ %@", self, v8];
  [v12 trackAnomaly:v13 forReason:v14 withResult:a4 withError:v15];

  -[SUCoreMobileAsset _reportAnomaly:](self, "_reportAnomaly:", v15);
}

- (id)_updateAssetTypeName
{
  unsigned int v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SUCoreMobileAsset asset](self, "asset");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 assetType];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 componentsSeparatedByString:@"."];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ([v6 count])
  {
    [v6 lastObject];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    -[SUCoreMobileAsset asset](self, "asset");
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 assetType];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)description
{
  id v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v2) {
    id v2 = @"[MA(initialized)]";
  }
  return v2;
}

+ (id)downloadOptionsDescription:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v4 = v3;
  }
  else {
    id v4 = 0LL;
  }
  id v26 = objc_alloc(NSString);
  else {
    id v5 = @"NO";
  }
  uint64_t v25 = v5;
  uint64_t v24 = [v3 timeoutIntervalForResource];
  else {
    id v6 = @"NO";
  }
  __int16 v23 = v6;
  else {
    id v7 = @"NO";
  }
  uint64_t v22 = v7;
  else {
    id v8 = @"NO";
  }
  uint64_t v21 = v8;
  else {
    id v9 = @"NO";
  }
  id v20 = v9;
  else {
    id v10 = @"NO";
  }
  [v3 sessionId];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    [v3 sessionId];
    id v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v12 = @"NONE";
  }

  else {
    id v13 = @"NO";
  }
  if (v4)
  {
    [v4 liveAssetAudienceUUID];
    id v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    [v4 purpose];
    id v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v14 = @"NONE";
    id v15 = @"NONE";
  }

  [v3 additionalServerParams];
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    [v3 additionalServerParams];
    id v17 = (void *)objc_claimAutoreleasedReturnValue();
    id v18 = (void *)[v26 initWithFormat:@"\n[>>>\n       allowsCellularAccess: %@\n timeoutIntervalForResource: %ld\n              discretionary: %@\n      allowsExpensiveAccess: %@\n     requiresPowerPluggedIn: %@\n     canUseLocalCacheServer: %@\n           prefersInfraWiFi: %@\n                  sessionId: %@\n      liveServerCatalogOnly: %@\n      liveAssetAudienceUUID: %@\n                    purpose: %@\n     additionalServerParams: %@\n<<<]", v25, v24, v23, v22, v21, v20, v10, v12, v13, v14, v15, v17];
  }

  else
  {
    id v18 = (void *)[v26 initWithFormat:@"\n[>>>\n       allowsCellularAccess: %@\n timeoutIntervalForResource: %ld\n              discretionary: %@\n      allowsExpensiveAccess: %@\n     requiresPowerPluggedIn: %@\n     canUseLocalCacheServer: %@\n           prefersInfraWiFi: %@\n                  sessionId: %@\n      liveServerCatalogOnly: %@\n      liveAssetAudienceUUID: %@\n                    purpose: %@\n     additionalServerParams: %@\n<<<]", v25, v24, v23, v22, v21, v20, v10, v12, v13, v14, v15, @"NONE"];
  }

  if (v4)
  {
  }

  if (v11) {

  }
  return v18;
}

+ (id)downloadConfigSummary:(id)a3
{
  else {
    return @"foreground(non-discretionary)";
  }
}

+ (BOOL)downloadConfig:(id)a3 isEqualToConfig:(id)a4
{
  id v5 = a4;
  LOBYTE(a3) = [a3 discretionary];
  char v6 = [v5 discretionary];

  return a3 ^ v6 ^ 1;
}

+ (id)downloadConfigCopy:(id)a3
{
  if (a3)
  {
    id v3 = (objc_class *)MEMORY[0x189611108];
    id v4 = a3;
    id v5 = objc_alloc_init(v3);
    uint64_t v6 = [v4 discretionary];

    [v5 setDiscretionary:v6];
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

+ (void)reloadDescriptor:(id)a3 completion:(id)a4
{
  id v5 = (void *)MEMORY[0x1896110E8];
  id v6 = a4;
  id v7 = a3;
  [v5 requireSameAssetTypeAndAssetId];
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  +[SUCoreMobileAsset reloadDescriptor:allowingDifferences:forceReload:completion:]( &OBJC_CLASS___SUCoreMobileAsset,  "reloadDescriptor:allowingDifferences:forceReload:completion:",  v7,  v8,  0LL,  v6);
}

+ (void)reloadDescriptor:(id)a3 allowingDifferences:(id)a4 forceReload:(BOOL)a5 completion:(id)a6
{
}

+ (void)reloadDescriptor:(id)a3 allowingDifferences:(id)a4 forceReload:(BOOL)a5 defaultValues:(id)a6 completion:(id)a7
{
}

+ (void)reloadDescriptor:(id)a3 allowingDifferences:(id)a4 forceReload:(BOOL)a5 skipMSU:(BOOL)a6 defaultValues:(id)a7 completion:(id)a8
{
  LODWORD(v10) = a6;
  LODWORD(v11) = a5;
  uint64_t v54 = *MEMORY[0x1895F89C0];
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  id v16 = a8;
  [MEMORY[0x1896127A0] sharedLogger];
  id v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v17 oslog];
  id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    [v13 summary];
    id v29 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 summary];
    id v28 = (void *)objc_claimAutoreleasedReturnValue();
    id v32 = v14;
    if ((_DWORD)v11) {
      uint64_t v19 = @"YES";
    }
    else {
      uint64_t v19 = @"NO";
    }
    char v30 = (char)v11;
    char v31 = (char)v10;
    if ((_DWORD)v10) {
      id v10 = @"YES";
    }
    else {
      id v10 = @"NO";
    }
    if (v16) {
      id v11 = @"YES";
    }
    else {
      id v11 = @"NO";
    }
    id v20 = v16;
    else {
      uint64_t v21 = @"NO";
    }
    *(_DWORD *)buf = 138544898;
    else {
      uint64_t v22 = @"NO";
    }
    id v41 = v29;
    __int16 v42 = 2114;
    id v43 = v28;
    __int16 v44 = 2114;
    id v45 = v19;
    id v14 = v32;
    __int16 v46 = 2114;
    id v47 = v10;
    __int16 v48 = 2114;
    id v49 = v11;
    LOBYTE(v11) = v30;
    LOBYTE(v10) = v31;
    __int16 v50 = 2114;
    id v51 = v21;
    id v16 = v20;
    __int16 v52 = 2114;
    v53 = v22;
    _os_log_impl( &dword_187A54000,  v18,  OS_LOG_TYPE_DEFAULT,  "[ReloadDescriptor] Reload descriptor method called, descriptor:%{public}@ allowingDifferences:%{public}@ forceRelo ad:%{public}@ skipMSU:%{public}@ completion:%{public}@ requiresSoftwareUpdateAssetReload:%{public}@ requiresDocume ntationReload:%{public}@",  buf,  0x48u);
  }

  [MEMORY[0x189612760] sharedCore];
  __int16 v23 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v24 = v23;
  if (v13)
  {
    [v23 waitedOperationQueue];
    uint64_t v25 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __103__SUCoreMobileAsset_reloadDescriptor_allowingDifferences_forceReload_skipMSU_defaultValues_completion___block_invoke;
    block[3] = &unk_18A0F1638;
    id v34 = v13;
    id v35 = v14;
    char v38 = (char)v11;
    char v39 = (char)v10;
    id v36 = v15;
    id v37 = v16;
    dispatch_async(v25, block);

    id v26 = v34;
  }

  else
  {
    [v23 buildError:8116 underlying:0 description:@"No descriptor was provided for descriptor reload"];
    id v26 = (void *)objc_claimAutoreleasedReturnValue();

    [MEMORY[0x189612778] sharedDiag];
    id v27 = (void *)objc_claimAutoreleasedReturnValue();
    [v27 trackAnomaly:@"ReloadDescriptor" forReason:@"No descriptor was provided for descriptor reload" withResult:8116 withError:v26];

    +[SUCoreMobileAsset _callReloadCompletion:withDescriptor:suError:docError:]( &OBJC_CLASS___SUCoreMobileAsset,  "_callReloadCompletion:withDescriptor:suError:docError:",  v16,  0LL,  v26,  v26);
  }
}

void __103__SUCoreMobileAsset_reloadDescriptor_allowingDifferences_forceReload_skipMSU_defaultValues_completion___block_invoke( uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 64);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 65);
  uint64_t v6 = *(void *)(a1 + 48);
  id v21 = 0LL;
  id v22 = 0LL;
  +[SUCoreMobileAsset _reloadDescriptor:allowingDifferences:forceReload:skipMSU:defaultValues:pSUReloadError:pDocReloadError:]( &OBJC_CLASS___SUCoreMobileAsset,  "_reloadDescriptor:allowingDifferences:forceReload:skipMSU:defaultValues:pSUReloadError:pDocReloadError:",  v2,  v3,  v4,  v5,  v6,  &v22,  &v21);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = v22;
  id v9 = v21;
  [*(id *)(a1 + 32) associatedSplatDescriptor];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 && !v8 && !v9)
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 oslog];
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_187A54000,  v12,  OS_LOG_TYPE_DEFAULT,  "[ReloadDescriptor] Reload the associated splat descriptor",  buf,  2u);
    }

    [*(id *)(a1 + 32) associatedSplatDescriptor];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = *(void *)(a1 + 40);
    uint64_t v15 = *(unsigned __int8 *)(a1 + 64);
    uint64_t v16 = *(unsigned __int8 *)(a1 + 65);
    id v18 = 0LL;
    id v19 = 0LL;
    +[SUCoreMobileAsset _reloadDescriptor:allowingDifferences:forceReload:skipMSU:defaultValues:pSUReloadError:pDocReloadError:]( &OBJC_CLASS___SUCoreMobileAsset,  "_reloadDescriptor:allowingDifferences:forceReload:skipMSU:defaultValues:pSUReloadError:pDocReloadError:",  v13,  v14,  v15,  v16,  0LL,  &v19,  &v18);
    id v17 = (void *)objc_claimAutoreleasedReturnValue();
    id v8 = v19;
    id v9 = v18;

    if (!v8) {
      [v7 setAssociatedSplatDescriptor:v17];
    }
  }

  +[SUCoreMobileAsset _callReloadCompletion:withDescriptor:suError:docError:]( &OBJC_CLASS___SUCoreMobileAsset,  "_callReloadCompletion:withDescriptor:suError:docError:",  *(void *)(a1 + 56),  v7,  v8,  v9);
}

+ (id)_reloadDescriptor:(id)a3 allowingDifferences:(id)a4 forceReload:(BOOL)a5 skipMSU:(BOOL)a6 defaultValues:(id)a7 pSUReloadError:(id *)a8 pDocReloadError:(id *)a9
{
  BOOL v10 = a6;
  uint64_t v68 = *MEMORY[0x1895F89C0];
  id v13 = a3;
  id v14 = a4;
  id v59 = a7;
  uint64_t v15 = (SUCoreDescriptor *)v13;
  uint64_t v16 = v15;
  unint64_t v17 = 0x189612000uLL;
  if (a5 || -[SUCoreDescriptor requiresSoftwareUpdateAssetReload](v15, "requiresSoftwareUpdateAssetReload"))
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 oslog];
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      -[SUCoreDescriptor softwareUpdateAssetAbsoluteID](v16, "softwareUpdateAssetAbsoluteID");
      id v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor softwareUpdateAssetPurpose](v16, "softwareUpdateAssetPurpose");
      id v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      id v63 = v14;
      __int16 v64 = 2114;
      v65 = v20;
      __int16 v66 = 2114;
      v67 = v21;
      _os_log_impl( &dword_187A54000,  v19,  OS_LOG_TYPE_DEFAULT,  "[ReloadDescriptor] Attempting to reload software update asset, allowing differences:%{public}@ absoluteAssetID:% {public}@ purpose:%{public}@",  buf,  0x20u);
    }

    id v22 = (void *)MEMORY[0x1896110E0];
    -[SUCoreDescriptor softwareUpdateAssetAbsoluteID](v16, "softwareUpdateAssetAbsoluteID");
    __int16 v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDescriptor softwareUpdateAssetPurpose](v16, "softwareUpdateAssetPurpose");
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
    id v61 = 0LL;
    objc_msgSend( v22,  "SUCoreBorder_loadSync:allowingDifferences:withPurpose:error:simulateForDescriptor:simulateForType:",  v23,  v14,  v24,  &v61,  v16,  1);
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
    id v26 = v61;

    if (v26 || !v25)
    {
      [MEMORY[0x189612760] sharedCore];
      char v31 = (void *)objc_claimAutoreleasedReturnValue();
      id v29 = v31;
      if (v26)
      {
        id v32 = @"Failed to reload software update asset for descriptor with MobileAsset error";
        uint64_t v33 = 8704LL;
        id v34 = v26;
      }

      else
      {
        id v32 = @"Failed to reload software update asset for descriptor as asset was not found (no MobileAsset error)";
        uint64_t v33 = 8705LL;
        id v34 = 0LL;
      }

      [v31 buildError:v33 underlying:v34 description:v32];
      id v35 = (void *)objc_claimAutoreleasedReturnValue();
      id v36 = v16;
    }

    else
    {
      [MEMORY[0x1896127A0] sharedLogger];
      id v27 = (void *)objc_claimAutoreleasedReturnValue();
      [v27 oslog];
      id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( &dword_187A54000,  v28,  OS_LOG_TYPE_DEFAULT,  "[ReloadDescriptor] Software update asset reload completed successfully",  buf,  2u);
      }

      if (v10)
      {
        objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedLongLong:",  -[SUCoreDescriptor msuPrepareSize](v16, "msuPrepareSize"));
        id v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedLongLong:",  -[SUCoreDescriptor installationSize](v16, "installationSize"));
        char v30 = (void *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        id v29 = 0LL;
        char v30 = 0LL;
      }

      id v37 = objc_alloc(&OBJC_CLASS___SUCoreDescriptor);
      -[SUCoreDescriptor releaseDate](v16, "releaseDate");
      char v38 = (void *)objc_claimAutoreleasedReturnValue();
      id v36 = -[SUCoreDescriptor initWithSUAsset:releaseDate:prepareSize:applySize:defaultValues:]( v37,  "initWithSUAsset:releaseDate:prepareSize:applySize:defaultValues:",  v25,  v38,  v29,  v30,  v59);

      -[SUCoreDescriptor transferNonAssetPropertiesFromDescriptor:]( v36,  "transferNonAssetPropertiesFromDescriptor:",  v16);
      id v35 = 0LL;
      unint64_t v17 = 0x189612000LL;
    }

    if (a5) {
      goto LABEL_20;
    }
  }

  else
  {
    id v35 = 0LL;
    id v36 = v16;
  }

  if (!-[SUCoreDescriptor requiresDocumentationReload](v16, "requiresDocumentationReload"))
  {
    id v51 = 0LL;
    goto LABEL_33;
  }

+ (void)_callReloadCompletion:(id)a3 withDescriptor:(id)a4 suError:(id)a5 docError:(id)a6
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  [MEMORY[0x1896127A0] sharedLogger];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 oslog];
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v24 = v10;
    __int16 v25 = 2114;
    id v26 = v11;
    __int16 v27 = 2114;
    id v28 = v12;
    _os_log_impl( &dword_187A54000,  v14,  OS_LOG_TYPE_DEFAULT,  "[ReloadDescriptor] Dispatching onto shared completion queue and calling provided reload completion with descriptor :%{public}@ suError:%{public}@ docError:%{public}@",  buf,  0x20u);
  }

  if (v9)
  {
    [MEMORY[0x189612760] sharedCore];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 completionQueue];
    uint64_t v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = __75__SUCoreMobileAsset__callReloadCompletion_withDescriptor_suError_docError___block_invoke;
    v18[3] = &unk_18A0EFAD8;
    id v22 = v9;
    id v19 = v10;
    id v20 = v11;
    id v21 = v12;
    dispatch_async(v16, v18);

    unint64_t v17 = v22;
  }

  else
  {
    [MEMORY[0x189612778] sharedDiag];
    unint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 trackAnomaly:@"ReloadDescriptor" forReason:@"No completion was provided for descriptor reload" withResult:8116 withError:0];
  }
}

uint64_t __75__SUCoreMobileAsset__callReloadCompletion_withDescriptor_suError_docError___block_invoke( void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[7] + 16LL))(a1[7], a1[4], a1[5], a1[6]);
}

- (id)maDelegate
{
  return objc_loadWeakRetained(&self->_maDelegate);
}

- (NSString)updateUUID
{
  return self->_updateUUID;
}

- (void)setUpdateUUID:(id)a3
{
}

- (MAAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
}

- (NSString)documentationStashBuild
{
  return self->_documentationStashBuild;
}

- (void)setDocumentationStashBuild:(id)a3
{
}

- (MADownloadOptions)downloadOptions
{
  return self->_downloadOptions;
}

- (void)setDownloadOptions:(id)a3
{
}

- (MADownloadConfig)currentDownloadConfig
{
  return self->_currentDownloadConfig;
}

- (void)setCurrentDownloadConfig:(id)a3
{
}

- (MADownloadConfig)requestedDownloadConfig
{
  return self->_requestedDownloadConfig;
}

- (void)setRequestedDownloadConfig:(id)a3
{
}

- (MADownloadConfig)desiredDownloadConfig
{
  return self->_desiredDownloadConfig;
}

- (void)setDesiredDownloadConfig:(id)a3
{
}

- (OS_dispatch_queue)clientDelegateCallbackQueue
{
  return self->_clientDelegateCallbackQueue;
}

- (OS_dispatch_queue)clientCompletionQueue
{
  return self->_clientCompletionQueue;
}

- (OS_dispatch_queue)maControlQueue
{
  return self->_maControlQueue;
}

- (BOOL)downloadingAsset
{
  return self->_downloadingAsset;
}

- (void)setDownloadingAsset:(BOOL)a3
{
  self->_downloadingAsset = a3;
}

- (BOOL)checkedDownloadState
{
  return self->_checkedDownloadState;
}

- (void)setCheckedDownloadState:(BOOL)a3
{
  self->_checkedDownloadState = a3;
}

- (BOOL)assetDownloaded
{
  return self->_assetDownloaded;
}

- (void)setAssetDownloaded:(BOOL)a3
{
  self->_assetDownloaded = a3;
}

- (BOOL)removingAsset
{
  return self->_removingAsset;
}

- (void)setRemovingAsset:(BOOL)a3
{
  self->_removingAsset = a3;
}

- (NSString)operationName
{
  return self->_operationName;
}

- (void)setOperationName:(id)a3
{
}

- (BOOL)assetRemoved
{
  return self->_assetRemoved;
}

- (void)setAssetRemoved:(BOOL)a3
{
  self->_assetRemoved = a3;
}

- (id)downloadCompletion
{
  return self->_downloadCompletion;
}

- (void)setDownloadCompletion:(id)a3
{
}

- (id)alterDownloadCompletion
{
  return self->_alterDownloadCompletion;
}

- (void)setAlterDownloadCompletion:(id)a3
{
}

- (id)removeCompletion
{
  return self->_removeCompletion;
}

- (void)setRemoveCompletion:(id)a3
{
}

- (OS_os_transaction)downloadAssetTransaction
{
  return self->_downloadAssetTransaction;
}

- (void)setDownloadAssetTransaction:(id)a3
{
}

- (OS_os_transaction)alterDownloadTransaction
{
  return self->_alterDownloadTransaction;
}

- (void)setAlterDownloadTransaction:(id)a3
{
}

- (OS_os_transaction)removeAssetTransaction
{
  return self->_removeAssetTransaction;
}

- (void)setRemoveAssetTransaction:(id)a3
{
}

- (void).cxx_destruct
{
}

void __53__SUCoreMobileAsset_alterDownloadOptions_completion___block_invoke_cold_1()
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_2_2();
  uint64_t v3 = @"alter download config when removing asset - alteration of configuration ignored";
  OUTLINED_FUNCTION_0_5(&dword_187A54000, v0, v1, "%{public}@ %{public}@", v2);
  OUTLINED_FUNCTION_2_0();
}

void __53__SUCoreMobileAsset_alterDownloadOptions_completion___block_invoke_cold_2()
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_2_2();
  uint64_t v3 = @"alter download config when not downloading - alteration of configuration ignored";
  OUTLINED_FUNCTION_0_5(&dword_187A54000, v0, v1, "%{public}@ %{public}@", v2);
  OUTLINED_FUNCTION_2_0();
}

void __53__SUCoreMobileAsset_alterDownloadOptions_completion___block_invoke_cold_3()
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_2_2();
  uint64_t v3 = @"alter download config when already altering with completion - cannot accept additional alteration request";
  OUTLINED_FUNCTION_0_5(&dword_187A54000, v0, v1, "%{public}@ %{public}@", v2);
  OUTLINED_FUNCTION_2_0();
}

- (void)_requestChangeConfigDownload:(uint64_t)a3 .cold.1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)_issueAlterDownloadCompletion:forReason:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_5(&dword_187A54000, v0, (uint64_t)v0, "%{public}@ %{public}@", v1);
  OUTLINED_FUNCTION_2_0();
}

- (void)_reportDownloaded:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_5( &dword_187A54000,  v0,  (uint64_t)v0,  "%{public}@ Failed to stash documentation asset data: %{public}@",  v1);
  OUTLINED_FUNCTION_2_0();
}

@end