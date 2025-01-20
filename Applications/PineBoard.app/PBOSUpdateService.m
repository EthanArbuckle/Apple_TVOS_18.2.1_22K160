@interface PBOSUpdateService
+ (void)_obliterateDataPreservingPaths:(id)a3 clearAccounts:(BOOL)a4 withCompletion:(id)a5;
- (PBOSUpdateService)init;
- (PBOSUpdateService)initWithRemoteConnection:(id)a3;
- (PBSystemServiceConnection)remoteConnection;
- (void)areAutomaticUpdatesEnabled:(id)a3;
- (void)cancelDownload:(id)a3;
- (void)cancelUpdate;
- (void)checkForUpdate;
- (void)checkForUpdateViaMDM;
- (void)checkForUpdatesWithOptions:(id)a3 response:(id)a4;
- (void)currentDownload:(id)a3;
- (void)didFinishApplyWithData:(id)a3;
- (void)didFinishCheckWithData:(id)a3;
- (void)didFinishDownloadWithData:(id)a3;
- (void)didStartApplyWithData:(id)a3;
- (void)didStartCheckWithData:(id)a3;
- (void)didStartDownloadWithData:(id)a3;
- (void)didStartRedownloadWithData:(id)a3;
- (void)didUpdateApplyProgressWithData:(id)a3;
- (void)didUpdateDownloadProgressWithData:(id)a3;
- (void)installUpdate:(id)a3 withOptions:(id)a4 withResult:(id)a5;
- (void)isCheckingForUpdates:(id)a3;
- (void)isDownloading:(id)a3;
- (void)isUpdate:(id)a3 readyForInstallation:(id)a4;
- (void)isUpdateRunningWithCompletion:(id)a3;
- (void)obliterateDataPreservingPaths:(id)a3 withCompletion:(id)a4;
- (void)purgeAssetsWithCompletion:(id)a3;
- (void)purgeDownload:(id)a3;
- (void)purgeableAssetSpaceWithCompletion:(id)a3;
- (void)restore;
- (void)setAssetDownloadIsDiscretionary:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setManagerClientDelegate:(id)a3;
- (void)startDownload:(id)a3;
@end

@implementation PBOSUpdateService

+ (void)_obliterateDataPreservingPaths:(id)a3 clearAccounts:(BOOL)a4 withCompletion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = sub_1000836CC();
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v24 = [v7 count];
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "OBLIT: Clearing obliterate flag, starting operation (preserving %lu paths).",  buf,  0xCu);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences sharedPineBoardServicesPreferences]( &OBJC_CLASS___TVSPreferences,  "sharedPineBoardServicesPreferences"));
  objc_msgSend(v11, "setPbs_shouldObliterateOnLaunch:", 0);

  +[TVSPreferences synchronizeAllDomains](&OBJC_CLASS___TVSPreferences, "synchronizeAllDomains");
  id v12 = sub_1000836CC();
  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences sharedPineBoardServicesPreferences]( &OBJC_CLASS___TVSPreferences,  "sharedPineBoardServicesPreferences"));
    unsigned int v15 = objc_msgSend(v14, "pbs_shouldObliterateOnLaunch");
    *(_DWORD *)buf = 67109120;
    LODWORD(v24) = v15;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "OBLIT: Checking obliterate flag: %d", buf, 8u);
  }

  +[PBSILOnTimeAccumulator persistSILOnTimeImmediately]( &OBJC_CLASS___PBSILOnTimeAccumulator,  "persistSILOnTimeImmediately");
  if (qword_100470B20 != -1) {
    dispatch_once(&qword_100470B20, &stru_1003D6C88);
  }
  v16 = (dispatch_queue_s *)qword_100470B18;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F3EB4;
  block[3] = &unk_1003CFF58;
  BOOL v22 = a4;
  id v20 = v7;
  id v21 = v8;
  id v17 = v8;
  id v18 = v7;
  dispatch_async(v16, block);
}

- (PBOSUpdateService)init
{
  return 0LL;
}

- (PBOSUpdateService)initWithRemoteConnection:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PBOSUpdateService;
  v5 = -[PBOSUpdateService init](&v8, "init");
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_remoteConnection, v4);
  }

  return v6;
}

- (void)setDelegate:(id)a3
{
}

- (void)setManagerClientDelegate:(id)a3
{
}

- (void)checkForUpdate
{
}

- (void)checkForUpdateViaMDM
{
}

- (void)checkForUpdatesWithOptions:(id)a3 response:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1000F44A8;
    v7[3] = &unk_1003D0070;
    id v8 = v5;
    id v9 = v6;
    dispatch_async(&_dispatch_main_q, v7);
  }
}

- (void)isCheckingForUpdates:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000F4560;
    block[3] = &unk_1003D0110;
    id v6 = v3;
    dispatch_async(&_dispatch_main_q, block);
  }
}

- (void)startDownload:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000F4618;
    block[3] = &unk_1003D0110;
    id v6 = v3;
    dispatch_async(&_dispatch_main_q, block);
  }
}

- (void)cancelDownload:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000F46D0;
    block[3] = &unk_1003D0110;
    id v6 = v3;
    dispatch_async(&_dispatch_main_q, block);
  }
}

- (void)purgeDownload:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000F4788;
    block[3] = &unk_1003D0110;
    id v6 = v3;
    dispatch_async(&_dispatch_main_q, block);
  }
}

- (void)currentDownload:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000F4840;
    block[3] = &unk_1003D0110;
    id v6 = v3;
    dispatch_async(&_dispatch_main_q, block);
  }
}

- (void)setAssetDownloadIsDiscretionary:(BOOL)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F48D4;
  block[3] = &unk_1003D3530;
  BOOL v4 = a3;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)isDownloading:(id)a3
{
  id v3 = a3;
  BOOL v4 = v3;
  if (v3)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000F498C;
    block[3] = &unk_1003D0110;
    id v6 = v3;
    dispatch_async(&_dispatch_main_q, block);
  }
}

- (void)isUpdate:(id)a3 readyForInstallation:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1000F4A4C;
    v7[3] = &unk_1003D0070;
    id v8 = v5;
    id v9 = v6;
    dispatch_async(&_dispatch_main_q, v7);
  }
}

- (void)installUpdate:(id)a3 withOptions:(id)a4 withResult:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000F4B4C;
    block[3] = &unk_1003D2F08;
    id v11 = v7;
    id v12 = v8;
    id v13 = v9;
    dispatch_async(&_dispatch_main_q, block);
  }
}

- (void)restore
{
}

- (void)isUpdateRunningWithCompletion:(id)a3
{
  id v3 = a3;
  BOOL v4 = v3;
  if (v3)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000F4C60;
    block[3] = &unk_1003D0110;
    id v6 = v3;
    dispatch_async(&_dispatch_main_q, block);
  }
}

- (void)cancelUpdate
{
}

- (void)purgeableAssetSpaceWithCompletion:(id)a3
{
  id v3 = a3;
  BOOL v4 = v3;
  if (v3)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000F4D70;
    block[3] = &unk_1003D0110;
    id v6 = v3;
    dispatch_async(&_dispatch_main_q, block);
  }
}

- (void)purgeAssetsWithCompletion:(id)a3
{
  id v3 = a3;
  BOOL v4 = v3;
  if (v3)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000F4E28;
    block[3] = &unk_1003D0110;
    id v6 = v3;
    dispatch_async(&_dispatch_main_q, block);
  }
}

- (void)obliterateDataPreservingPaths:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(id)objc_opt_class(self) _obliterateDataPreservingPaths:v7 clearAccounts:1 withCompletion:v6];
}

- (void)areAutomaticUpdatesEnabled:(id)a3
{
  if (a3) {
    (*((void (**)(id, uint64_t, void))a3 + 2))(a3, 1LL, 0LL);
  }
}

- (void)didStartCheckWithData:(id)a3
{
  id v4 = a3;
  delegate = self->_delegate;
  if (delegate) {
    -[PBSOSUpdateServiceDelegate osUpdateServiceDidStartCheckWithData:]( delegate,  "osUpdateServiceDidStartCheckWithData:",  v4);
  }
  managerClientDelegate = self->_managerClientDelegate;
  if (managerClientDelegate) {
    -[PBSOSUpdateManagerClient osUpdateServiceDidStartCheckWithData:]( managerClientDelegate,  "osUpdateServiceDidStartCheckWithData:",  v4);
  }
}

- (void)didFinishCheckWithData:(id)a3
{
  id v4 = a3;
  delegate = self->_delegate;
  if (delegate) {
    -[PBSOSUpdateServiceDelegate osUpdateServiceDidFinishCheckWithData:]( delegate,  "osUpdateServiceDidFinishCheckWithData:",  v4);
  }
  managerClientDelegate = self->_managerClientDelegate;
  if (managerClientDelegate) {
    -[PBSOSUpdateManagerClient osUpdateServiceDidFinishCheckWithData:]( managerClientDelegate,  "osUpdateServiceDidFinishCheckWithData:",  v4);
  }
}

- (void)didStartDownloadWithData:(id)a3
{
  id v4 = a3;
  delegate = self->_delegate;
  if (delegate) {
    -[PBSOSUpdateServiceDelegate osUpdateServiceDidStartDownloadWithData:]( delegate,  "osUpdateServiceDidStartDownloadWithData:",  v4);
  }
  managerClientDelegate = self->_managerClientDelegate;
  if (managerClientDelegate) {
    -[PBSOSUpdateManagerClient osUpdateServiceDidStartDownloadWithData:]( managerClientDelegate,  "osUpdateServiceDidStartDownloadWithData:",  v4);
  }
}

- (void)didUpdateDownloadProgressWithData:(id)a3
{
  id v4 = a3;
  delegate = self->_delegate;
  if (delegate) {
    -[PBSOSUpdateServiceDelegate osUpdateServiceDidUpdateDownloadProgressWithData:]( delegate,  "osUpdateServiceDidUpdateDownloadProgressWithData:",  v4);
  }
  managerClientDelegate = self->_managerClientDelegate;
  if (managerClientDelegate) {
    -[PBSOSUpdateManagerClient osUpdateServiceDidUpdateDownloadProgressWithData:]( managerClientDelegate,  "osUpdateServiceDidUpdateDownloadProgressWithData:",  v4);
  }
}

- (void)didFinishDownloadWithData:(id)a3
{
  id v4 = a3;
  delegate = self->_delegate;
  if (delegate) {
    -[PBSOSUpdateServiceDelegate osUpdateServiceDidFinishDownloadWithData:]( delegate,  "osUpdateServiceDidFinishDownloadWithData:",  v4);
  }
  managerClientDelegate = self->_managerClientDelegate;
  if (managerClientDelegate) {
    -[PBSOSUpdateManagerClient osUpdateServiceDidFinishDownloadWithData:]( managerClientDelegate,  "osUpdateServiceDidFinishDownloadWithData:",  v4);
  }
}

- (void)didStartRedownloadWithData:(id)a3
{
  id v4 = a3;
  delegate = self->_delegate;
  if (delegate) {
    -[PBSOSUpdateServiceDelegate osUpdateServiceDidStartRedownloadWithData:]( delegate,  "osUpdateServiceDidStartRedownloadWithData:",  v4);
  }
  managerClientDelegate = self->_managerClientDelegate;
  if (managerClientDelegate) {
    -[PBSOSUpdateManagerClient osUpdateServiceDidStartRedownloadWithData:]( managerClientDelegate,  "osUpdateServiceDidStartRedownloadWithData:",  v4);
  }
}

- (void)didStartApplyWithData:(id)a3
{
  id v4 = a3;
  delegate = self->_delegate;
  if (delegate) {
    -[PBSOSUpdateServiceDelegate osUpdateServiceDidStartApplyWithData:]( delegate,  "osUpdateServiceDidStartApplyWithData:",  v4);
  }
  managerClientDelegate = self->_managerClientDelegate;
  if (managerClientDelegate) {
    -[PBSOSUpdateManagerClient osUpdateServiceDidStartApplyWithData:]( managerClientDelegate,  "osUpdateServiceDidStartApplyWithData:",  v4);
  }
}

- (void)didUpdateApplyProgressWithData:(id)a3
{
  id v4 = a3;
  delegate = self->_delegate;
  if (delegate) {
    -[PBSOSUpdateServiceDelegate osUpdateServiceDidUpdateApplyProgressWithData:]( delegate,  "osUpdateServiceDidUpdateApplyProgressWithData:",  v4);
  }
  managerClientDelegate = self->_managerClientDelegate;
  if (managerClientDelegate) {
    -[PBSOSUpdateManagerClient osUpdateServiceDidUpdateApplyProgressWithData:]( managerClientDelegate,  "osUpdateServiceDidUpdateApplyProgressWithData:",  v4);
  }
}

- (void)didFinishApplyWithData:(id)a3
{
  id v4 = a3;
  delegate = self->_delegate;
  if (delegate) {
    -[PBSOSUpdateServiceDelegate osUpdateServiceDidFinishApplyWithData:]( delegate,  "osUpdateServiceDidFinishApplyWithData:",  v4);
  }
  managerClientDelegate = self->_managerClientDelegate;
  if (managerClientDelegate) {
    -[PBSOSUpdateManagerClient osUpdateServiceDidFinishApplyWithData:]( managerClientDelegate,  "osUpdateServiceDidFinishApplyWithData:",  v4);
  }
}

- (PBSystemServiceConnection)remoteConnection
{
  return (PBSystemServiceConnection *)objc_loadWeakRetained((id *)&self->_remoteConnection);
}

- (void).cxx_destruct
{
}

@end