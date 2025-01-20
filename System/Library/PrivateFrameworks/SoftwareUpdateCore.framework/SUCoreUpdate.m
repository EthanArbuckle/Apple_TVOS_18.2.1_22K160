@interface SUCoreUpdate
+ (id)_generateStateTable;
- (NSDictionary)stateTable;
- (NSError)failedAttemptError;
- (NSString)updateName;
- (NSString)updateUUID;
- (OS_dispatch_queue)clientDelegateCallbackQueue;
- (OS_os_transaction)updateTransaction;
- (SUCoreDescriptor)updateDescriptor;
- (SUCoreFSM)updateFSM;
- (SUCoreMSU)msuControl;
- (SUCorePolicy)policy;
- (SUCoreRollback)rollbackControl;
- (SUCoreRollbackDescriptor)rollbackDescriptor;
- (SUCoreUpdate)initWithDelegate:(id)a3 updateDescriptor:(id)a4 updateUUID:(id)a5;
- (SUCoreUpdate)initWithDelegate:(id)a3 updateDescriptor:(id)a4 updateUUID:(id)a5 withCallbackQueue:(id)a6;
- (SUCoreUpdateDownloader)downloadControl;
- (id)copyCurrentState;
- (id)previousRollback;
- (id)rollbackAvailable;
- (id)updateDelegate;
- (int64_t)actionAdvanceBrainLoadSuccess:(id)a3 error:(id *)a4;
- (int64_t)actionAdvanceDownloadPreflighted:(id)a3 error:(id *)a4;
- (int64_t)actionAdvanceSUDownloaded:(id)a3 error:(id *)a4;
- (int64_t)actionAdvanceSuspended:(id)a3 error:(id *)a4;
- (int64_t)actionApplyUpdate:(id)a3 error:(id *)a4;
- (int64_t)actionCancelPrepare:(id)a3 error:(id *)a4;
- (int64_t)actionCheckSpace:(id)a3 error:(id *)a4;
- (int64_t)actionChooseErrorSpaceCheck:(id)a3 error:(id *)a4;
- (int64_t)actionDecideApplyUpdate:(id)a3 error:(id *)a4;
- (int64_t)actionDecideBeginRollback:(id)a3 error:(id *)a4;
- (int64_t)actionDecideCancelBeforeRollback:(id)a3 error:(id *)a4;
- (int64_t)actionDecideDownloadSU:(id)a3 error:(id *)a4;
- (int64_t)actionDecideDownloadSpaceCheck:(id)a3 error:(id *)a4;
- (int64_t)actionDecideLoadBrain:(id)a3 error:(id *)a4;
- (int64_t)actionDecidePreflightDownloadSU:(id)a3 error:(id *)a4;
- (int64_t)actionDecidePrepareUpdate:(id)a3 error:(id *)a4;
- (int64_t)actionDecideResumeUpdate:(id)a3 error:(id *)a4;
- (int64_t)actionDecideRollbackUpdate:(id)a3 error:(id *)a4;
- (int64_t)actionDecideSuspendUpdate:(id)a3 error:(id *)a4;
- (int64_t)actionDownloadSU:(id)a3 error:(id *)a4;
- (int64_t)actionLoadBrain:(id)a3 error:(id *)a4;
- (int64_t)actionLoadBrainRollback:(id)a3 error:(id *)a4;
- (int64_t)actionPreflightDownloadSU:(id)a3 error:(id *)a4;
- (int64_t)actionPrepareUpdate:(id)a3 error:(id *)a4;
- (int64_t)actionRemovePrepared:(id)a3 error:(id *)a4;
- (int64_t)actionRemoveSU:(id)a3 error:(id *)a4;
- (int64_t)actionReportAnomalyAPI:(id)a3 error:(id *)a4;
- (int64_t)actionReportAnomalyAPIEnd:(id)a3 error:(id *)a4;
- (int64_t)actionReportApplied:(id)a3 error:(id *)a4;
- (int64_t)actionReportApplyFailed:(id)a3 error:(id *)a4;
- (int64_t)actionReportApplyProgress:(id)a3 error:(id *)a4;
- (int64_t)actionReportAttemptFailure:(id)a3 error:(id *)a4;
- (int64_t)actionReportBrainLoadProgress:(id)a3 error:(id *)a4;
- (int64_t)actionReportBrainLoadSuccess:(id)a3 error:(id *)a4;
- (int64_t)actionReportCanceled:(id)a3 error:(id *)a4;
- (int64_t)actionReportDownloadPreflighted:(id)a3 error:(id *)a4;
- (int64_t)actionReportDownloadProgress:(id)a3 error:(id *)a4;
- (int64_t)actionReportDownloadStalled:(id)a3 error:(id *)a4;
- (int64_t)actionReportPrepareProgress:(id)a3 error:(id *)a4;
- (int64_t)actionReportPrepared:(id)a3 error:(id *)a4;
- (int64_t)actionReportResumeCurrentFailed:(id)a3 error:(id *)a4;
- (int64_t)actionReportResumeCurrentSuccess:(id)a3 error:(id *)a4;
- (int64_t)actionReportRollbackFailed:(id)a3 error:(id *)a4;
- (int64_t)actionReportRollbackSuccess:(id)a3 error:(id *)a4;
- (int64_t)actionReportSUDownloaded:(id)a3 error:(id *)a4;
- (int64_t)actionResumeCurrentUpdate:(id)a3 error:(id *)a4;
- (int64_t)actionResumeUpdate:(id)a3 error:(id *)a4;
- (int64_t)actionRollbackUpdateApply:(id)a3 error:(id *)a4;
- (int64_t)actionRollbackUpdateDecideApply:(id)a3 error:(id *)a4;
- (int64_t)actionRollbackUpdateDecideResume:(id)a3 error:(id *)a4;
- (int64_t)actionRollbackUpdateDecideSuspend:(id)a3 error:(id *)a4;
- (int64_t)actionRollbackUpdatePrepare:(id)a3 error:(id *)a4;
- (int64_t)actionRollbackUpdateResume:(id)a3 error:(id *)a4;
- (int64_t)actionRollbackUpdateSuspend:(id)a3 error:(id *)a4;
- (int64_t)actionSuspendUpdate:(id)a3 error:(id *)a4;
- (int64_t)actionUnknownAction:(id)a3 error:(id *)a4;
- (int64_t)actionUpdateTarget:(id)a3 error:(id *)a4;
- (int64_t)actionUpdateTargetReconfig:(id)a3 error:(id *)a4;
- (int64_t)performAction:(id)a3 onEvent:(id)a4 inState:(id)a5 withInfo:(id)a6 nextState:(id)a7 error:(id *)a8;
- (int64_t)targetPhase;
- (void)_adjustTarget:(int64_t)a3 withPolicy:(id)a4;
- (void)_applyAttemptFailed:(id)a3;
- (void)_cleanupAfterAttempt;
- (void)_eventAfterReachingPhase:(int64_t)a3;
- (void)_eventAfterReachingRollbackPhase:(int64_t)a3;
- (void)_rollbackAttemptFailed:(id)a3 withError:(id)a4;
- (void)_trackUpdateAnomaly:(id)a3 result:(int64_t)a4 description:(id)a5;
- (void)_trackUpdateError:(id)a3 forReason:(id)a4 error:(id)a5;
- (void)_updateAnomaly:(id)a3;
- (void)_updateApplied;
- (void)_updateApplyProgress:(id)a3;
- (void)_updateAssetDownloadPreflighted;
- (void)_updateAssetDownloadProgress:(id)a3;
- (void)_updateAssetDownloadStalled:(id)a3;
- (void)_updateAssetDownloaded:(id)a3;
- (void)_updateAttemptFailed:(id)a3;
- (void)_updateBrainLoadProgress:(id)a3;
- (void)_updateBrainLoadStalled:(id)a3;
- (void)_updateBrainLoaded:(id)a3;
- (void)_updateCanceled;
- (void)_updateCurrentResumeFailed:(id)a3;
- (void)_updateCurrentResumed;
- (void)_updatePrepareProgress:(id)a3;
- (void)_updatePrepared:(id)a3;
- (void)_updateRolledBack:(id)a3;
- (void)anomaly:(id)a3;
- (void)cancelCurrentUpdate;
- (void)downloadFailed:(id)a3;
- (void)downloadProgress:(id)a3;
- (void)downloadStalled:(id)a3;
- (void)downloaded:(id)a3;
- (void)msuApplied;
- (void)msuApplyFailed:(id)a3;
- (void)msuApplyProgress:(id)a3;
- (void)msuBrainLoadFailed:(id)a3;
- (void)msuBrainLoadProgress:(id)a3;
- (void)msuBrainLoadStalled:(id)a3;
- (void)msuBrainLoaded:(id)a3;
- (void)msuPrepareFailed:(id)a3;
- (void)msuPrepareProgress:(id)a3;
- (void)msuPrepared:(id)a3;
- (void)msuRemoveFailed:(id)a3;
- (void)msuRemoved;
- (void)msuResumeFailed:(id)a3;
- (void)msuResumed;
- (void)msuRollbackApplyFailed:(id)a3;
- (void)msuRollbackApplySuccess;
- (void)msuRollbackFailed:(id)a3;
- (void)msuRollbackPrepareSuccess;
- (void)msuRollbackResumeSuccess;
- (void)msuRollbackSuspendSuccess;
- (void)msuSUDownloadPreflightFailed:(id)a3;
- (void)msuSUDownloadPreflighted;
- (void)msuSuspendFailed:(id)a3;
- (void)msuSuspended;
- (void)resumeCurrentUpdate;
- (void)setDownloadControl:(id)a3;
- (void)setFailedAttemptError:(id)a3;
- (void)setPolicy:(id)a3;
- (void)setTargetPhase:(int64_t)a3;
- (void)setUpdateTransaction:(id)a3;
- (void)targetApplied:(id)a3;
- (void)targetBrainLoaded:(id)a3;
- (void)targetDownloadPreflighted:(id)a3;
- (void)targetDownloaded:(id)a3;
- (void)targetPrepared:(id)a3;
- (void)targetRollback:(id)a3;
- (void)updateRemoveFailed:(id)a3;
- (void)updateRemoved;
@end

@implementation SUCoreUpdate

+ (id)_generateStateTable
{
  v1728[27] = *MEMORY[0x1895F89C0];
  v1727[0] = @"ReadyToBegin";
  v1725[0] = @"TargetBrainLoaded";
  uint64_t v1723 = *MEMORY[0x1896127D0];
  uint64_t v2 = v1723;
  v1724 = @"DecideLoadBrain";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1724 forKeys:&v1723 count:1];
  v513 = (void *)objc_claimAutoreleasedReturnValue();
  v1726[0] = v513;
  v1725[1] = @"TargetDownloadPreflighted";
  uint64_t v1721 = v2;
  v1722 = @"DecideLoadBrain";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1722 forKeys:&v1721 count:1];
  v512 = (void *)objc_claimAutoreleasedReturnValue();
  v1726[1] = v512;
  v1725[2] = @"TargetDownloaded";
  uint64_t v1719 = v2;
  v1720 = @"DecideLoadBrain";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1720 forKeys:&v1719 count:1];
  v511 = (void *)objc_claimAutoreleasedReturnValue();
  v1726[2] = v511;
  v1725[3] = @"TargetPrepared";
  uint64_t v1717 = v2;
  v1718 = @"DecideLoadBrain";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1718 forKeys:&v1717 count:1];
  v510 = (void *)objc_claimAutoreleasedReturnValue();
  v1726[3] = v510;
  v1725[4] = @"TargetApplied";
  uint64_t v1715 = v2;
  v1716 = @"DecideLoadBrain";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1716 forKeys:&v1715 count:1];
  v509 = (void *)objc_claimAutoreleasedReturnValue();
  v1726[4] = v509;
  v1725[5] = @"TargetRollback";
  uint64_t v1713 = v2;
  v1714 = @"DecideBeginRollback";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1714 forKeys:&v1713 count:1];
  v508 = (void *)objc_claimAutoreleasedReturnValue();
  v1726[5] = v508;
  v1725[6] = @"ResumeCurrentUpdate";
  uint64_t v1711 = v2;
  v1712 = @"ReportAnomalyAPIEnd";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1712 forKeys:&v1711 count:1];
  v507 = (void *)objc_claimAutoreleasedReturnValue();
  v1726[6] = v507;
  v1725[7] = @"CancelCurrentUpdate";
  uint64_t v1709 = v2;
  v1710 = @"ReportCanceled";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1710 forKeys:&v1709 count:1];
  v506 = (void *)objc_claimAutoreleasedReturnValue();
  v1726[7] = v506;
  v1725[8] = @"PerformLoadBrain";
  v1707[0] = *MEMORY[0x1896129F8];
  uint64_t v3 = v1707[0];
  v1707[1] = v2;
  v1708[0] = @"LoadingBrain";
  v1708[1] = @"LoadBrain";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1708 forKeys:v1707 count:2];
  v505 = (void *)objc_claimAutoreleasedReturnValue();
  v1726[8] = v505;
  v1725[9] = @"BrainLoadSuccessAtTarget";
  v1705[0] = v3;
  v1705[1] = v2;
  v1706[0] = @"BrainLoaded";
  v1706[1] = @"ReportBrainLoadSuccess";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1706 forKeys:v1705 count:2];
  v504 = (void *)objc_claimAutoreleasedReturnValue();
  v1726[9] = v504;
  v1725[10] = @"PerformPreflightDownloadSU";
  v1703[0] = v3;
  v1703[1] = v2;
  v1704[0] = @"PreflightingDownloadSU";
  v1704[1] = @"PreflightDownloadSU";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1704 forKeys:v1703 count:2];
  v503 = (void *)objc_claimAutoreleasedReturnValue();
  v1726[10] = v503;
  v1725[11] = @"PreflightSuccessAtTarget";
  v1701[0] = v3;
  v1701[1] = v2;
  v1702[0] = @"SUDownloadPreflighted";
  v1702[1] = @"ReportDownloadPreflighted";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1702 forKeys:v1701 count:2];
  v502 = (void *)objc_claimAutoreleasedReturnValue();
  v1726[11] = v502;
  v1725[12] = @"PerformDownloadSpaceCheck";
  v1699[0] = v3;
  v1699[1] = v2;
  v1700[0] = @"CheckingSpaceForInstall";
  v1700[1] = @"CheckSpace";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1700 forKeys:v1699 count:2];
  v501 = (void *)objc_claimAutoreleasedReturnValue();
  v1726[12] = v501;
  v1725[13] = @"PerformDownloadSU";
  v1697[0] = v3;
  v1697[1] = v2;
  v1698[0] = @"DownloadingSU";
  v1698[1] = @"DownloadSU";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1698 forKeys:v1697 count:2];
  v500 = (void *)objc_claimAutoreleasedReturnValue();
  v1726[13] = v500;
  v1725[14] = @"DownloadSuccessAtTarget";
  v1695[0] = v3;
  v1695[1] = v2;
  v1696[0] = @"SUDownloaded";
  v1696[1] = @"ReportSUDownloaded";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1696 forKeys:v1695 count:2];
  v499 = (void *)objc_claimAutoreleasedReturnValue();
  v1726[14] = v499;
  v1725[15] = @"PerformPrepare";
  v1693[0] = v3;
  v1693[1] = v2;
  v1694[0] = @"Preparing";
  v1694[1] = @"PrepareUpdate";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1694 forKeys:v1693 count:2];
  v498 = (void *)objc_claimAutoreleasedReturnValue();
  v1726[15] = v498;
  v1725[16] = @"PerformSuspend";
  v1691[0] = v3;
  v1691[1] = v2;
  v1692[0] = @"Suspending";
  v1692[1] = @"SuspendUpdate";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1692 forKeys:v1691 count:2];
  v497 = (void *)objc_claimAutoreleasedReturnValue();
  v1726[16] = v497;
  v1725[17] = @"SuspendSuccessAtTarget";
  v1689[0] = v3;
  v1689[1] = v2;
  v1690[0] = @"Prepared";
  v1690[1] = @"ReportPrepared";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1690 forKeys:v1689 count:2];
  v496 = (void *)objc_claimAutoreleasedReturnValue();
  v1726[17] = v496;
  v1725[18] = @"PerformResume";
  v1687[0] = v3;
  v1687[1] = v2;
  v1688[0] = @"Resuming";
  v1688[1] = @"ResumeUpdate";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1688 forKeys:v1687 count:2];
  v495 = (void *)objc_claimAutoreleasedReturnValue();
  v1726[18] = v495;
  v1725[19] = @"ResumeSuccessAtTarget";
  v1685[0] = v3;
  v1685[1] = v2;
  v1686[0] = @"Prepared";
  v1686[1] = @"ReportPrepared";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1686 forKeys:v1685 count:2];
  v494 = (void *)objc_claimAutoreleasedReturnValue();
  v1726[19] = v494;
  v1725[20] = @"PerformApply";
  v1683[0] = v3;
  v1683[1] = v2;
  v1684[0] = @"Applying";
  v1684[1] = @"ApplyUpdate";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1684 forKeys:v1683 count:2];
  v493 = (void *)objc_claimAutoreleasedReturnValue();
  v1726[20] = v493;
  v1725[21] = @"ApplySuccess";
  v1681[0] = v3;
  v1681[1] = v2;
  v1682[0] = @"AwaitingReboot";
  v1682[1] = @"ReportApplied";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1682 forKeys:v1681 count:2];
  v492 = (void *)objc_claimAutoreleasedReturnValue();
  v1726[21] = v492;
  v1725[22] = @"RB_BeginRollback";
  v1679[0] = v3;
  v1679[1] = v2;
  v1680[0] = @"RB_ReadyToBegin";
  v1680[1] = @"LoadBrainRollback";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1680 forKeys:v1679 count:2];
  v491 = (void *)objc_claimAutoreleasedReturnValue();
  v1726[22] = v491;
  v1725[23] = @"RB_PerformLoadBrain";
  v1677[0] = v3;
  v1677[1] = v2;
  v1678[0] = @"RB_LoadingBrain";
  v1678[1] = @"LoadBrain";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1678 forKeys:v1677 count:2];
  v490 = (void *)objc_claimAutoreleasedReturnValue();
  v1726[23] = v490;
  v1725[24] = @"RB_PerformRollbackPrepare";
  v1675[0] = v3;
  v1675[1] = v2;
  v1676[0] = @"RB_RollingBackPrepare";
  v1676[1] = @"RollbackUpdatePrepare";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1676 forKeys:v1675 count:2];
  v489 = (void *)objc_claimAutoreleasedReturnValue();
  v1726[24] = v489;
  v1725[25] = @"RB_PerformRollbackSuspend";
  v1673[0] = v3;
  v1673[1] = v2;
  v1674[0] = @"RB_RollingBackSuspend";
  v1674[1] = @"RollbackUpdateSuspend";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1674 forKeys:v1673 count:2];
  v488 = (void *)objc_claimAutoreleasedReturnValue();
  v1726[25] = v488;
  v1725[26] = @"RB_PerformRollbackResume";
  v1671[0] = v3;
  v1671[1] = v2;
  v1672[0] = @"RB_RollingBackResume";
  v1672[1] = @"RollbackUpdateResume";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1672 forKeys:v1671 count:2];
  v487 = (void *)objc_claimAutoreleasedReturnValue();
  v1726[26] = v487;
  v1725[27] = @"RB_PerformRollbackApply";
  v1669[0] = v3;
  v1669[1] = v2;
  v1670[0] = @"RB_RollingBackApply";
  v1670[1] = @"RollbackUpdateApply";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1670 forKeys:v1669 count:2];
  v486 = (void *)objc_claimAutoreleasedReturnValue();
  v1726[27] = v486;
  v1725[28] = @"RB_RollbackAppleSuccess";
  v1667[0] = v3;
  v1667[1] = v2;
  v1668[0] = @"AwaitingReboot";
  v1668[1] = @"ReportRollbackSucceeded";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1668 forKeys:v1667 count:2];
  v485 = (void *)objc_claimAutoreleasedReturnValue();
  v1726[28] = v485;
  [MEMORY[0x189603F68] dictionaryWithObjects:v1726 forKeys:v1725 count:29];
  v484 = (void *)objc_claimAutoreleasedReturnValue();
  v1728[0] = v484;
  v1727[1] = @"LoadingBrain";
  v1665[0] = @"TargetBrainLoaded";
  uint64_t v1663 = v2;
  v1664 = @"UpdateTarget";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1664 forKeys:&v1663 count:1];
  v483 = (void *)objc_claimAutoreleasedReturnValue();
  v1666[0] = v483;
  v1665[1] = @"TargetDownloadPreflighted";
  uint64_t v1661 = v2;
  v1662 = @"UpdateTarget";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1662 forKeys:&v1661 count:1];
  v482 = (void *)objc_claimAutoreleasedReturnValue();
  v1666[1] = v482;
  v1665[2] = @"TargetDownloaded";
  uint64_t v1659 = v2;
  v1660 = @"UpdateTarget";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1660 forKeys:&v1659 count:1];
  v481 = (void *)objc_claimAutoreleasedReturnValue();
  v1666[2] = v481;
  v1665[3] = @"TargetPrepared";
  uint64_t v1657 = v2;
  v1658 = @"UpdateTarget";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1658 forKeys:&v1657 count:1];
  v480 = (void *)objc_claimAutoreleasedReturnValue();
  v1666[3] = v480;
  v1665[4] = @"TargetApplied";
  uint64_t v1655 = v2;
  v1656 = @"UpdateTarget";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1656 forKeys:&v1655 count:1];
  v479 = (void *)objc_claimAutoreleasedReturnValue();
  v1666[4] = v479;
  v1665[5] = @"TargetRollback";
  uint64_t v1653 = v3;
  v1654 = @"RB_LoadingBrain";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1654 forKeys:&v1653 count:1];
  v478 = (void *)objc_claimAutoreleasedReturnValue();
  v1666[5] = v478;
  v1665[6] = @"ResumeCurrentUpdate";
  uint64_t v1651 = v2;
  v1652 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1652 forKeys:&v1651 count:1];
  v477 = (void *)objc_claimAutoreleasedReturnValue();
  v1666[6] = v477;
  v1665[7] = @"CancelCurrentUpdate";
  uint64_t v1649 = v3;
  v1650 = @"Canceling";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1650 forKeys:&v1649 count:1];
  v476 = (void *)objc_claimAutoreleasedReturnValue();
  v1666[7] = v476;
  v1665[8] = @"BrainLoadProgress";
  uint64_t v1647 = v2;
  v1648 = @"ReportBrainLoadProgress";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1648 forKeys:&v1647 count:1];
  v475 = (void *)objc_claimAutoreleasedReturnValue();
  v1666[8] = v475;
  v1665[9] = @"BrainLoadSuccess";
  uint64_t v1645 = v2;
  v1646 = @"AdvanceBrainLoadSuccess";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1646 forKeys:&v1645 count:1];
  v474 = (void *)objc_claimAutoreleasedReturnValue();
  v1666[9] = v474;
  v1665[10] = @"BrainLoadFailed";
  uint64_t v1643 = v2;
  v1644 = @"ChooseErrorSpaceCheck";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1644 forKeys:&v1643 count:1];
  v473 = (void *)objc_claimAutoreleasedReturnValue();
  v1666[10] = v473;
  v1665[11] = @"BrainLoadSuccessAtTarget";
  uint64_t v1641 = v3;
  v1642 = @"BrainLoaded";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1642 forKeys:&v1641 count:1];
  v472 = (void *)objc_claimAutoreleasedReturnValue();
  v1666[11] = v472;
  v1665[12] = @"PerformPreflightDownloadSU";
  v1639[0] = v3;
  v1639[1] = v2;
  v1640[0] = @"PreflightingDownloadSU";
  v1640[1] = @"PreflightDownloadSU";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1640 forKeys:v1639 count:2];
  v471 = (void *)objc_claimAutoreleasedReturnValue();
  v1666[12] = v471;
  v1665[13] = @"PreflightSuccessAtTarget";
  v1637[0] = v3;
  v1637[1] = v2;
  v1638[0] = @"SUDownloadPreflighted";
  v1638[1] = @"ReportDownloadPreflighted";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1638 forKeys:v1637 count:2];
  v470 = (void *)objc_claimAutoreleasedReturnValue();
  v1666[13] = v470;
  v1665[14] = @"PerformDownloadSpaceCheck";
  v1635[0] = v3;
  v1635[1] = v2;
  v1636[0] = @"CheckingSpaceForInstall";
  v1636[1] = @"CheckSpace";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1636 forKeys:v1635 count:2];
  v469 = (void *)objc_claimAutoreleasedReturnValue();
  v1666[14] = v469;
  v1665[15] = @"PerformDownloadSU";
  v1633[0] = v3;
  v1633[1] = v2;
  v1634[0] = @"DownloadingSU";
  v1634[1] = @"DownloadSU";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1634 forKeys:v1633 count:2];
  v468 = (void *)objc_claimAutoreleasedReturnValue();
  v1666[15] = v468;
  v1665[16] = @"DownloadSuccessAtTarget";
  v1631[0] = v3;
  v1631[1] = v2;
  v1632[0] = @"SUDownloaded";
  v1632[1] = @"ReportSUDownloaded";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1632 forKeys:v1631 count:2];
  v467 = (void *)objc_claimAutoreleasedReturnValue();
  v1666[16] = v467;
  v1665[17] = @"PerformPrepare";
  v1629[0] = v3;
  v1629[1] = v2;
  v1630[0] = @"Preparing";
  v1630[1] = @"PrepareUpdate";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1630 forKeys:v1629 count:2];
  v466 = (void *)objc_claimAutoreleasedReturnValue();
  v1666[17] = v466;
  v1665[18] = @"PerformSuspend";
  v1627[0] = v3;
  v1627[1] = v2;
  v1628[0] = @"Suspending";
  v1628[1] = @"SuspendUpdate";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1628 forKeys:v1627 count:2];
  v465 = (void *)objc_claimAutoreleasedReturnValue();
  v1666[18] = v465;
  v1665[19] = @"SuspendSuccessAtTarget";
  v1625[0] = v3;
  v1625[1] = v2;
  v1626[0] = @"Prepared";
  v1626[1] = @"ReportPrepared";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1626 forKeys:v1625 count:2];
  v464 = (void *)objc_claimAutoreleasedReturnValue();
  v1666[19] = v464;
  v1665[20] = @"PerformResume";
  v1623[0] = v3;
  v1623[1] = v2;
  v1624[0] = @"Resuming";
  v1624[1] = @"ResumeUpdate";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1624 forKeys:v1623 count:2];
  v463 = (void *)objc_claimAutoreleasedReturnValue();
  v1666[20] = v463;
  v1665[21] = @"ResumeSuccessAtTarget";
  v1621[0] = v3;
  v1621[1] = v2;
  v1622[0] = @"Prepared";
  v1622[1] = @"ReportPrepared";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1622 forKeys:v1621 count:2];
  v462 = (void *)objc_claimAutoreleasedReturnValue();
  v1666[21] = v462;
  v1665[22] = @"PerformApply";
  v1619[0] = v3;
  v1619[1] = v2;
  v1620[0] = @"Applying";
  v1620[1] = @"ApplyUpdate";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1620 forKeys:v1619 count:2];
  v461 = (void *)objc_claimAutoreleasedReturnValue();
  v1666[22] = v461;
  v1665[23] = @"ApplySuccess";
  v1617[0] = v3;
  v1617[1] = v2;
  v1618[0] = @"AwaitingReboot";
  v1618[1] = @"ReportApplied";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1618 forKeys:v1617 count:2];
  v460 = (void *)objc_claimAutoreleasedReturnValue();
  v1666[23] = v460;
  v1665[24] = @"PerformErrorSpaceCheck";
  v1615[0] = v3;
  v1615[1] = v2;
  v1616[0] = @"CheckingSpaceAfterError";
  v1616[1] = @"CheckSpace";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1616 forKeys:v1615 count:2];
  v459 = (void *)objc_claimAutoreleasedReturnValue();
  v1666[24] = v459;
  v1665[25] = @"SkipErrorSpaceCheck";
  v1613[0] = v3;
  v1613[1] = v2;
  v1614[0] = @"ReadyToBegin";
  v1614[1] = @"ReportAttemptFailure";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1614 forKeys:v1613 count:2];
  v458 = (void *)objc_claimAutoreleasedReturnValue();
  v1666[25] = v458;
  [MEMORY[0x189603F68] dictionaryWithObjects:v1666 forKeys:v1665 count:26];
  v457 = (void *)objc_claimAutoreleasedReturnValue();
  v1728[1] = v457;
  v1727[2] = @"BrainLoaded";
  v1611[0] = @"TargetBrainLoaded";
  uint64_t v1609 = v2;
  v1610 = @"UpdateTarget";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1610 forKeys:&v1609 count:1];
  v456 = (void *)objc_claimAutoreleasedReturnValue();
  v1612[0] = v456;
  v1611[1] = @"TargetDownloadPreflighted";
  uint64_t v1607 = v2;
  v1608 = @"DecidePreflightDownloadSU";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1608 forKeys:&v1607 count:1];
  v455 = (void *)objc_claimAutoreleasedReturnValue();
  v1612[1] = v455;
  v1611[2] = @"TargetDownloaded";
  uint64_t v1605 = v2;
  v1606 = @"DecidePreflightDownloadSU";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1606 forKeys:&v1605 count:1];
  v454 = (void *)objc_claimAutoreleasedReturnValue();
  v1612[2] = v454;
  v1611[3] = @"TargetPrepared";
  uint64_t v1603 = v2;
  v1604 = @"DecidePreflightDownloadSU";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1604 forKeys:&v1603 count:1];
  v453 = (void *)objc_claimAutoreleasedReturnValue();
  v1612[3] = v453;
  v1611[4] = @"TargetApplied";
  uint64_t v1601 = v2;
  v1602 = @"DecidePreflightDownloadSU";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1602 forKeys:&v1601 count:1];
  v452 = (void *)objc_claimAutoreleasedReturnValue();
  v1612[4] = v452;
  v1611[5] = @"TargetRollback";
  v1599[0] = v3;
  v1599[1] = v2;
  v1600[0] = @"RB_BrainLoaded";
  v1600[1] = @"DecideBeginRollback";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1600 forKeys:v1599 count:2];
  v451 = (void *)objc_claimAutoreleasedReturnValue();
  v1612[5] = v451;
  v1611[6] = @"ResumeCurrentUpdate";
  uint64_t v1597 = v2;
  v1598 = @"ReportAnomalyAPIEnd";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1598 forKeys:&v1597 count:1];
  v450 = (void *)objc_claimAutoreleasedReturnValue();
  v1612[6] = v450;
  v1611[7] = @"CancelCurrentUpdate";
  v1595[0] = v3;
  v1595[1] = v2;
  v1596[0] = @"ReadyToBegin";
  v1596[1] = @"ReportCanceled";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1596 forKeys:v1595 count:2];
  v449 = (void *)objc_claimAutoreleasedReturnValue();
  v1612[7] = v449;
  v1611[8] = @"PerformPreflightDownloadSU";
  v1593[0] = v3;
  v1593[1] = v2;
  v1594[0] = @"PreflightingDownloadSU";
  v1594[1] = @"PreflightDownloadSU";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1594 forKeys:v1593 count:2];
  v448 = (void *)objc_claimAutoreleasedReturnValue();
  v1612[8] = v448;
  v1611[9] = @"PreflightSuccessAtTarget";
  v1591[0] = v3;
  v1591[1] = v2;
  v1592[0] = @"SUDownloadPreflighted";
  v1592[1] = @"ReportDownloadPreflighted";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1592 forKeys:v1591 count:2];
  v447 = (void *)objc_claimAutoreleasedReturnValue();
  v1612[9] = v447;
  v1611[10] = @"PerformDownloadSpaceCheck";
  v1589[0] = v3;
  v1589[1] = v2;
  v1590[0] = @"CheckingSpaceForInstall";
  v1590[1] = @"CheckSpace";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1590 forKeys:v1589 count:2];
  v446 = (void *)objc_claimAutoreleasedReturnValue();
  v1612[10] = v446;
  v1611[11] = @"PerformDownloadSU";
  v1587[0] = v3;
  v1587[1] = v2;
  v1588[0] = @"DownloadingSU";
  v1588[1] = @"DownloadSU";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1588 forKeys:v1587 count:2];
  v445 = (void *)objc_claimAutoreleasedReturnValue();
  v1612[11] = v445;
  v1611[12] = @"DownloadSuccessAtTarget";
  v1585[0] = v3;
  v1585[1] = v2;
  v1586[0] = @"SUDownloaded";
  v1586[1] = @"ReportSUDownloaded";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1586 forKeys:v1585 count:2];
  v444 = (void *)objc_claimAutoreleasedReturnValue();
  v1612[12] = v444;
  v1611[13] = @"PerformPrepare";
  v1583[0] = v3;
  v1583[1] = v2;
  v1584[0] = @"Preparing";
  v1584[1] = @"PrepareUpdate";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1584 forKeys:v1583 count:2];
  v443 = (void *)objc_claimAutoreleasedReturnValue();
  v1612[13] = v443;
  v1611[14] = @"PerformSuspend";
  v1581[0] = v3;
  v1581[1] = v2;
  v1582[0] = @"Suspending";
  v1582[1] = @"SuspendUpdate";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1582 forKeys:v1581 count:2];
  v442 = (void *)objc_claimAutoreleasedReturnValue();
  v1612[14] = v442;
  v1611[15] = @"SuspendSuccessAtTarget";
  v1579[0] = v3;
  v1579[1] = v2;
  v1580[0] = @"Prepared";
  v1580[1] = @"ReportPrepared";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1580 forKeys:v1579 count:2];
  v441 = (void *)objc_claimAutoreleasedReturnValue();
  v1612[15] = v441;
  v1611[16] = @"PerformResume";
  v1577[0] = v3;
  v1577[1] = v2;
  v1578[0] = @"Resuming";
  v1578[1] = @"ResumeUpdate";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1578 forKeys:v1577 count:2];
  v440 = (void *)objc_claimAutoreleasedReturnValue();
  v1612[16] = v440;
  v1611[17] = @"ResumeSuccessAtTarget";
  v1575[0] = v3;
  v1575[1] = v2;
  v1576[0] = @"Prepared";
  v1576[1] = @"ReportPrepared";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1576 forKeys:v1575 count:2];
  v439 = (void *)objc_claimAutoreleasedReturnValue();
  v1612[17] = v439;
  v1611[18] = @"PerformApply";
  v1573[0] = v3;
  v1573[1] = v2;
  v1574[0] = @"Applying";
  v1574[1] = @"ApplyUpdate";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1574 forKeys:v1573 count:2];
  v438 = (void *)objc_claimAutoreleasedReturnValue();
  v1612[18] = v438;
  v1611[19] = @"ApplySuccess";
  v1571[0] = v3;
  v1571[1] = v2;
  v1572[0] = @"AwaitingReboot";
  v1572[1] = @"ReportApplied";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1572 forKeys:v1571 count:2];
  v437 = (void *)objc_claimAutoreleasedReturnValue();
  v1612[19] = v437;
  [MEMORY[0x189603F68] dictionaryWithObjects:v1612 forKeys:v1611 count:20];
  v436 = (void *)objc_claimAutoreleasedReturnValue();
  v1728[2] = v436;
  v1727[3] = @"PreflightingDownloadSU";
  v1569[0] = @"TargetBrainLoaded";
  uint64_t v1567 = v2;
  v1568 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1568 forKeys:&v1567 count:1];
  v435 = (void *)objc_claimAutoreleasedReturnValue();
  v1570[0] = v435;
  v1569[1] = @"TargetDownloadPreflighted";
  uint64_t v1565 = v2;
  v1566 = @"UpdateTarget";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1566 forKeys:&v1565 count:1];
  v434 = (void *)objc_claimAutoreleasedReturnValue();
  v1570[1] = v434;
  v1569[2] = @"TargetDownloaded";
  uint64_t v1563 = v2;
  v1564 = @"UpdateTarget";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1564 forKeys:&v1563 count:1];
  v433 = (void *)objc_claimAutoreleasedReturnValue();
  v1570[2] = v433;
  v1569[3] = @"TargetPrepared";
  uint64_t v1561 = v2;
  v1562 = @"UpdateTarget";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1562 forKeys:&v1561 count:1];
  v432 = (void *)objc_claimAutoreleasedReturnValue();
  v1570[3] = v432;
  v1569[4] = @"TargetApplied";
  uint64_t v1559 = v2;
  v1560 = @"UpdateTarget";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1560 forKeys:&v1559 count:1];
  v431 = (void *)objc_claimAutoreleasedReturnValue();
  v1570[4] = v431;
  v1569[5] = @"TargetRollback";
  uint64_t v1557 = v2;
  v1558 = @"DecideCancelBeforeRollback";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1558 forKeys:&v1557 count:1];
  v430 = (void *)objc_claimAutoreleasedReturnValue();
  v1570[5] = v430;
  v1569[6] = @"ResumeCurrentUpdate";
  uint64_t v1555 = v2;
  v1556 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1556 forKeys:&v1555 count:1];
  v429 = (void *)objc_claimAutoreleasedReturnValue();
  v1570[6] = v429;
  v1569[7] = @"CancelCurrentUpdate";
  uint64_t v1553 = v3;
  v1554 = @"Canceling";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1554 forKeys:&v1553 count:1];
  v428 = (void *)objc_claimAutoreleasedReturnValue();
  v1570[7] = v428;
  v1569[8] = @"PreflightSuccess";
  uint64_t v1551 = v2;
  v1552 = @"AdvanceDownloadPreflighted";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1552 forKeys:&v1551 count:1];
  v427 = (void *)objc_claimAutoreleasedReturnValue();
  v1570[8] = v427;
  v1569[9] = @"PreflightFailed";
  uint64_t v1549 = v2;
  v1550 = @"ChooseErrorSpaceCheck";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1550 forKeys:&v1549 count:1];
  v426 = (void *)objc_claimAutoreleasedReturnValue();
  v1570[9] = v426;
  v1569[10] = @"PreflightSuccessAtTarget";
  uint64_t v1547 = v3;
  v1548 = @"SUDownloadPreflighted";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1548 forKeys:&v1547 count:1];
  v425 = (void *)objc_claimAutoreleasedReturnValue();
  v1570[10] = v425;
  v1569[11] = @"PerformDownloadSpaceCheck";
  v1545[0] = v3;
  v1545[1] = v2;
  v1546[0] = @"CheckingSpaceForInstall";
  v1546[1] = @"CheckSpace";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1546 forKeys:v1545 count:2];
  v424 = (void *)objc_claimAutoreleasedReturnValue();
  v1570[11] = v424;
  v1569[12] = @"PerformDownloadSU";
  v1543[0] = v3;
  v1543[1] = v2;
  v1544[0] = @"DownloadingSU";
  v1544[1] = @"DownloadSU";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1544 forKeys:v1543 count:2];
  v423 = (void *)objc_claimAutoreleasedReturnValue();
  v1570[12] = v423;
  v1569[13] = @"DownloadSuccessAtTarget";
  v1541[0] = v3;
  v1541[1] = v2;
  v1542[0] = @"SUDownloaded";
  v1542[1] = @"ReportSUDownloaded";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1542 forKeys:v1541 count:2];
  v422 = (void *)objc_claimAutoreleasedReturnValue();
  v1570[13] = v422;
  v1569[14] = @"PerformPrepare";
  v1539[0] = v3;
  v1539[1] = v2;
  v1540[0] = @"Preparing";
  v1540[1] = @"PrepareUpdate";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1540 forKeys:v1539 count:2];
  v421 = (void *)objc_claimAutoreleasedReturnValue();
  v1570[14] = v421;
  v1569[15] = @"PerformSuspend";
  v1537[0] = v3;
  v1537[1] = v2;
  v1538[0] = @"Suspending";
  v1538[1] = @"SuspendUpdate";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1538 forKeys:v1537 count:2];
  v420 = (void *)objc_claimAutoreleasedReturnValue();
  v1570[15] = v420;
  v1569[16] = @"SuspendSuccessAtTarget";
  v1535[0] = v3;
  v1535[1] = v2;
  v1536[0] = @"Prepared";
  v1536[1] = @"ReportPrepared";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1536 forKeys:v1535 count:2];
  v419 = (void *)objc_claimAutoreleasedReturnValue();
  v1570[16] = v419;
  v1569[17] = @"PerformResume";
  v1533[0] = v3;
  v1533[1] = v2;
  v1534[0] = @"Resuming";
  v1534[1] = @"ResumeUpdate";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1534 forKeys:v1533 count:2];
  v418 = (void *)objc_claimAutoreleasedReturnValue();
  v1570[17] = v418;
  v1569[18] = @"ResumeSuccessAtTarget";
  v1531[0] = v3;
  v1531[1] = v2;
  v1532[0] = @"Prepared";
  v1532[1] = @"ReportPrepared";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1532 forKeys:v1531 count:2];
  v417 = (void *)objc_claimAutoreleasedReturnValue();
  v1570[18] = v417;
  v1569[19] = @"PerformApply";
  v1529[0] = v3;
  v1529[1] = v2;
  v1530[0] = @"Applying";
  v1530[1] = @"ApplyUpdate";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1530 forKeys:v1529 count:2];
  v416 = (void *)objc_claimAutoreleasedReturnValue();
  v1570[19] = v416;
  v1569[20] = @"ApplySuccess";
  v1527[0] = v3;
  v1527[1] = v2;
  v1528[0] = @"AwaitingReboot";
  v1528[1] = @"ReportApplied";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1528 forKeys:v1527 count:2];
  v415 = (void *)objc_claimAutoreleasedReturnValue();
  v1570[20] = v415;
  v1569[21] = @"RB_CancelNonRollbackUpdate";
  uint64_t v1525 = v3;
  v1526 = @"RB_Canceling";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1526 forKeys:&v1525 count:1];
  v414 = (void *)objc_claimAutoreleasedReturnValue();
  v1570[21] = v414;
  v1569[22] = @"RB_BeginRollback";
  v1523[0] = v3;
  v1523[1] = v2;
  v1524[0] = @"RB_ReadyToBegin";
  v1524[1] = @"LoadBrainRollback";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1524 forKeys:v1523 count:2];
  v413 = (void *)objc_claimAutoreleasedReturnValue();
  v1570[22] = v413;
  v1569[23] = @"RB_PerformLoadBrain";
  v1521[0] = v3;
  v1521[1] = v2;
  v1522[0] = @"RB_LoadingBrain";
  v1522[1] = @"LoadBrain";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1522 forKeys:v1521 count:2];
  v412 = (void *)objc_claimAutoreleasedReturnValue();
  v1570[23] = v412;
  v1569[24] = @"RB_PerformRollbackPrepare";
  v1519[0] = v3;
  v1519[1] = v2;
  v1520[0] = @"RB_RollingBackPrepare";
  v1520[1] = @"RollbackUpdatePrepare";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1520 forKeys:v1519 count:2];
  v411 = (void *)objc_claimAutoreleasedReturnValue();
  v1570[24] = v411;
  v1569[25] = @"RB_PerformRollbackSuspend";
  v1517[0] = v3;
  v1517[1] = v2;
  v1518[0] = @"RB_RollingBackSuspend";
  v1518[1] = @"RollbackUpdateSuspend";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1518 forKeys:v1517 count:2];
  v410 = (void *)objc_claimAutoreleasedReturnValue();
  v1570[25] = v410;
  v1569[26] = @"RB_PerformRollbackResume";
  v1515[0] = v3;
  v1515[1] = v2;
  v1516[0] = @"RB_RollingBackResume";
  v1516[1] = @"RollbackUpdateResume";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1516 forKeys:v1515 count:2];
  v409 = (void *)objc_claimAutoreleasedReturnValue();
  v1570[26] = v409;
  v1569[27] = @"RB_PerformRollbackApply";
  v1513[0] = v3;
  v1513[1] = v2;
  v1514[0] = @"RB_RollingBackApply";
  v1514[1] = @"RollbackUpdateApply";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1514 forKeys:v1513 count:2];
  v408 = (void *)objc_claimAutoreleasedReturnValue();
  v1570[27] = v408;
  v1569[28] = @"RB_RollbackAppleSuccess";
  v1511[0] = v3;
  v1511[1] = v2;
  v1512[0] = @"AwaitingReboot";
  v1512[1] = @"ReportRollbackSucceeded";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1512 forKeys:v1511 count:2];
  v407 = (void *)objc_claimAutoreleasedReturnValue();
  v1570[28] = v407;
  v1569[29] = @"PerformErrorSpaceCheck";
  v1509[0] = v3;
  v1509[1] = v2;
  v1510[0] = @"CheckingSpaceAfterError";
  v1510[1] = @"CheckSpace";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1510 forKeys:v1509 count:2];
  v406 = (void *)objc_claimAutoreleasedReturnValue();
  v1570[29] = v406;
  v1569[30] = @"SkipErrorSpaceCheck";
  v1507[0] = v3;
  v1507[1] = v2;
  v1508[0] = @"ReadyToBegin";
  v1508[1] = @"ReportAttemptFailure";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1508 forKeys:v1507 count:2];
  v405 = (void *)objc_claimAutoreleasedReturnValue();
  v1570[30] = v405;
  [MEMORY[0x189603F68] dictionaryWithObjects:v1570 forKeys:v1569 count:31];
  v404 = (void *)objc_claimAutoreleasedReturnValue();
  v1728[3] = v404;
  v1727[4] = @"SUDownloadPreflighted";
  v1505[0] = @"TargetBrainLoaded";
  uint64_t v1503 = v2;
  v1504 = @"ReportAnomalyAPIEnd";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1504 forKeys:&v1503 count:1];
  v403 = (void *)objc_claimAutoreleasedReturnValue();
  v1506[0] = v403;
  v1505[1] = @"TargetDownloadPreflighted";
  uint64_t v1501 = v2;
  v1502 = @"UpdateTarget";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1502 forKeys:&v1501 count:1];
  v402 = (void *)objc_claimAutoreleasedReturnValue();
  v1506[1] = v402;
  v1505[2] = @"TargetDownloaded";
  uint64_t v1499 = v2;
  v1500 = @"DecideDownloadSpaceCheck";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1500 forKeys:&v1499 count:1];
  v401 = (void *)objc_claimAutoreleasedReturnValue();
  v1506[2] = v401;
  v1505[3] = @"TargetPrepared";
  uint64_t v1497 = v2;
  v1498 = @"DecideDownloadSpaceCheck";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1498 forKeys:&v1497 count:1];
  v400 = (void *)objc_claimAutoreleasedReturnValue();
  v1506[3] = v400;
  v1505[4] = @"TargetApplied";
  uint64_t v1495 = v2;
  v1496 = @"DecideDownloadSpaceCheck";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1496 forKeys:&v1495 count:1];
  v399 = (void *)objc_claimAutoreleasedReturnValue();
  v1506[4] = v399;
  v1505[5] = @"TargetRollback";
  v1493[0] = v3;
  v1493[1] = v2;
  v1494[0] = @"RB_ReadyToBegin";
  v1494[1] = @"LoadBrainRollback";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1494 forKeys:v1493 count:2];
  v398 = (void *)objc_claimAutoreleasedReturnValue();
  v1506[5] = v398;
  v1505[6] = @"ResumeCurrentUpdate";
  uint64_t v1491 = v2;
  v1492 = @"ReportAnomalyAPIEnd";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1492 forKeys:&v1491 count:1];
  v397 = (void *)objc_claimAutoreleasedReturnValue();
  v1506[6] = v397;
  v1505[7] = @"CancelCurrentUpdate";
  v1489[0] = v3;
  v1489[1] = v2;
  v1490[0] = @"ReadyToBegin";
  v1490[1] = @"ReportCanceled";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1490 forKeys:v1489 count:2];
  v396 = (void *)objc_claimAutoreleasedReturnValue();
  v1506[7] = v396;
  v1505[8] = @"PerformDownloadSpaceCheck";
  v1487[0] = v3;
  v1487[1] = v2;
  v1488[0] = @"CheckingSpaceForInstall";
  v1488[1] = @"CheckSpace";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1488 forKeys:v1487 count:2];
  v395 = (void *)objc_claimAutoreleasedReturnValue();
  v1506[8] = v395;
  v1505[9] = @"PerformDownloadSU";
  v1485[0] = v3;
  v1485[1] = v2;
  v1486[0] = @"DownloadingSU";
  v1486[1] = @"DownloadSU";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1486 forKeys:v1485 count:2];
  v394 = (void *)objc_claimAutoreleasedReturnValue();
  v1506[9] = v394;
  v1505[10] = @"DownloadSuccessAtTarget";
  v1483[0] = v3;
  v1483[1] = v2;
  v1484[0] = @"SUDownloaded";
  v1484[1] = @"ReportSUDownloaded";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1484 forKeys:v1483 count:2];
  v393 = (void *)objc_claimAutoreleasedReturnValue();
  v1506[10] = v393;
  v1505[11] = @"PerformPrepare";
  v1481[0] = v3;
  v1481[1] = v2;
  v1482[0] = @"Preparing";
  v1482[1] = @"PrepareUpdate";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1482 forKeys:v1481 count:2];
  v392 = (void *)objc_claimAutoreleasedReturnValue();
  v1506[11] = v392;
  v1505[12] = @"PerformSuspend";
  v1479[0] = v3;
  v1479[1] = v2;
  v1480[0] = @"Suspending";
  v1480[1] = @"SuspendUpdate";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1480 forKeys:v1479 count:2];
  v391 = (void *)objc_claimAutoreleasedReturnValue();
  v1506[12] = v391;
  v1505[13] = @"SuspendSuccessAtTarget";
  v1477[0] = v3;
  v1477[1] = v2;
  v1478[0] = @"Prepared";
  v1478[1] = @"ReportPrepared";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1478 forKeys:v1477 count:2];
  v390 = (void *)objc_claimAutoreleasedReturnValue();
  v1506[13] = v390;
  v1505[14] = @"PerformResume";
  v1475[0] = v3;
  v1475[1] = v2;
  v1476[0] = @"Resuming";
  v1476[1] = @"ResumeUpdate";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1476 forKeys:v1475 count:2];
  v389 = (void *)objc_claimAutoreleasedReturnValue();
  v1506[14] = v389;
  v1505[15] = @"ResumeSuccessAtTarget";
  v1473[0] = v3;
  v1473[1] = v2;
  v1474[0] = @"Prepared";
  v1474[1] = @"ReportPrepared";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1474 forKeys:v1473 count:2];
  v388 = (void *)objc_claimAutoreleasedReturnValue();
  v1506[15] = v388;
  v1505[16] = @"PerformApply";
  v1471[0] = v3;
  v1471[1] = v2;
  v1472[0] = @"Applying";
  v1472[1] = @"ApplyUpdate";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1472 forKeys:v1471 count:2];
  v387 = (void *)objc_claimAutoreleasedReturnValue();
  v1506[16] = v387;
  v1505[17] = @"ApplySuccess";
  v1469[0] = v3;
  v1469[1] = v2;
  v1470[0] = @"AwaitingReboot";
  v1470[1] = @"ReportApplied";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1470 forKeys:v1469 count:2];
  v386 = (void *)objc_claimAutoreleasedReturnValue();
  v1506[17] = v386;
  [MEMORY[0x189603F68] dictionaryWithObjects:v1506 forKeys:v1505 count:18];
  v385 = (void *)objc_claimAutoreleasedReturnValue();
  v1728[4] = v385;
  v1727[5] = @"CheckingSpaceForInstall";
  v1467[0] = @"TargetBrainLoaded";
  uint64_t v1465 = v2;
  v1466 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1466 forKeys:&v1465 count:1];
  v384 = (void *)objc_claimAutoreleasedReturnValue();
  v1468[0] = v384;
  v1467[1] = @"TargetDownloadPreflighted";
  uint64_t v1463 = v2;
  v1464 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1464 forKeys:&v1463 count:1];
  v383 = (void *)objc_claimAutoreleasedReturnValue();
  v1468[1] = v383;
  v1467[2] = @"TargetDownloaded";
  uint64_t v1461 = v2;
  v1462 = @"UpdateTarget";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1462 forKeys:&v1461 count:1];
  v382 = (void *)objc_claimAutoreleasedReturnValue();
  v1468[2] = v382;
  v1467[3] = @"TargetPrepared";
  uint64_t v1459 = v2;
  v1460 = @"UpdateTarget";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1460 forKeys:&v1459 count:1];
  v381 = (void *)objc_claimAutoreleasedReturnValue();
  v1468[3] = v381;
  v1467[4] = @"TargetApplied";
  uint64_t v1457 = v2;
  v1458 = @"UpdateTarget";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1458 forKeys:&v1457 count:1];
  v380 = (void *)objc_claimAutoreleasedReturnValue();
  v1468[4] = v380;
  v1467[5] = @"TargetRollback";
  uint64_t v1455 = v2;
  v1456 = @"DecideCancelBeforeRollback";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1456 forKeys:&v1455 count:1];
  v379 = (void *)objc_claimAutoreleasedReturnValue();
  v1468[5] = v379;
  v1467[6] = @"ResumeCurrentUpdate";
  uint64_t v1453 = v2;
  v1454 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1454 forKeys:&v1453 count:1];
  v378 = (void *)objc_claimAutoreleasedReturnValue();
  v1468[6] = v378;
  v1467[7] = @"CancelCurrentUpdate";
  uint64_t v1451 = v3;
  v1452 = @"Canceling";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1452 forKeys:&v1451 count:1];
  v377 = (void *)objc_claimAutoreleasedReturnValue();
  v1468[7] = v377;
  v1467[8] = @"SpaceCheckHaveSpace";
  uint64_t v1449 = v2;
  v1450 = @"DecideDownloadSU";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1450 forKeys:&v1449 count:1];
  v376 = (void *)objc_claimAutoreleasedReturnValue();
  v1468[8] = v376;
  v1467[9] = @"SpaceCheckNoSpace";
  v1447[0] = v3;
  v1447[1] = v2;
  v1448[0] = @"ReadyToBegin";
  v1448[1] = @"ReportAttemptFailure";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1448 forKeys:v1447 count:2];
  v375 = (void *)objc_claimAutoreleasedReturnValue();
  v1468[9] = v375;
  v1467[10] = @"SpaceCheckFailed";
  v1445[0] = v3;
  v1445[1] = v2;
  v1446[0] = @"ReadyToBegin";
  v1446[1] = @"ReportAttemptFailure";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1446 forKeys:v1445 count:2];
  v374 = (void *)objc_claimAutoreleasedReturnValue();
  v1468[10] = v374;
  v1467[11] = @"PerformDownloadSU";
  v1443[0] = v3;
  v1443[1] = v2;
  v1444[0] = @"DownloadingSU";
  v1444[1] = @"DownloadSU";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1444 forKeys:v1443 count:2];
  v373 = (void *)objc_claimAutoreleasedReturnValue();
  v1468[11] = v373;
  v1467[12] = @"DownloadSuccessAtTarget";
  v1441[0] = v3;
  v1441[1] = v2;
  v1442[0] = @"SUDownloaded";
  v1442[1] = @"ReportSUDownloaded";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1442 forKeys:v1441 count:2];
  v372 = (void *)objc_claimAutoreleasedReturnValue();
  v1468[12] = v372;
  v1467[13] = @"PerformPrepare";
  v1439[0] = v3;
  v1439[1] = v2;
  v1440[0] = @"Preparing";
  v1440[1] = @"PrepareUpdate";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1440 forKeys:v1439 count:2];
  v371 = (void *)objc_claimAutoreleasedReturnValue();
  v1468[13] = v371;
  v1467[14] = @"PerformSuspend";
  v1437[0] = v3;
  v1437[1] = v2;
  v1438[0] = @"Suspending";
  v1438[1] = @"SuspendUpdate";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1438 forKeys:v1437 count:2];
  v370 = (void *)objc_claimAutoreleasedReturnValue();
  v1468[14] = v370;
  v1467[15] = @"SuspendSuccessAtTarget";
  v1435[0] = v3;
  v1435[1] = v2;
  v1436[0] = @"Prepared";
  v1436[1] = @"ReportPrepared";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1436 forKeys:v1435 count:2];
  v369 = (void *)objc_claimAutoreleasedReturnValue();
  v1468[15] = v369;
  v1467[16] = @"PerformResume";
  v1433[0] = v3;
  v1433[1] = v2;
  v1434[0] = @"Resuming";
  v1434[1] = @"ResumeUpdate";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1434 forKeys:v1433 count:2];
  v368 = (void *)objc_claimAutoreleasedReturnValue();
  v1468[16] = v368;
  v1467[17] = @"ResumeSuccessAtTarget";
  v1431[0] = v3;
  v1431[1] = v2;
  v1432[0] = @"Prepared";
  v1432[1] = @"ReportPrepared";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1432 forKeys:v1431 count:2];
  v367 = (void *)objc_claimAutoreleasedReturnValue();
  v1468[17] = v367;
  v1467[18] = @"PerformApply";
  v1429[0] = v3;
  v1429[1] = v2;
  v1430[0] = @"Applying";
  v1430[1] = @"ApplyUpdate";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1430 forKeys:v1429 count:2];
  v366 = (void *)objc_claimAutoreleasedReturnValue();
  v1468[18] = v366;
  v1467[19] = @"ApplySuccess";
  v1427[0] = v3;
  v1427[1] = v2;
  v1428[0] = @"AwaitingReboot";
  v1428[1] = @"ReportApplied";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1428 forKeys:v1427 count:2];
  v365 = (void *)objc_claimAutoreleasedReturnValue();
  v1468[19] = v365;
  v1467[20] = @"RB_CancelNonRollbackUpdate";
  uint64_t v1425 = v3;
  v1426 = @"RB_Canceling";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1426 forKeys:&v1425 count:1];
  v364 = (void *)objc_claimAutoreleasedReturnValue();
  v1468[20] = v364;
  v1467[21] = @"RB_BeginRollback";
  v1423[0] = v3;
  v1423[1] = v2;
  v1424[0] = @"RB_ReadyToBegin";
  v1424[1] = @"LoadBrainRollback";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1424 forKeys:v1423 count:2];
  v363 = (void *)objc_claimAutoreleasedReturnValue();
  v1468[21] = v363;
  v1467[22] = @"RB_PerformLoadBrain";
  v1421[0] = v3;
  v1421[1] = v2;
  v1422[0] = @"RB_LoadingBrain";
  v1422[1] = @"LoadBrain";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1422 forKeys:v1421 count:2];
  v362 = (void *)objc_claimAutoreleasedReturnValue();
  v1468[22] = v362;
  v1467[23] = @"RB_PerformRollbackPrepare";
  v1419[0] = v3;
  v1419[1] = v2;
  v1420[0] = @"RB_RollingBackPrepare";
  v1420[1] = @"RollbackUpdatePrepare";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1420 forKeys:v1419 count:2];
  v361 = (void *)objc_claimAutoreleasedReturnValue();
  v1468[23] = v361;
  v1467[24] = @"RB_PerformRollbackSuspend";
  v1417[0] = v3;
  v1417[1] = v2;
  v1418[0] = @"RB_RollingBackSuspend";
  v1418[1] = @"RollbackUpdateSuspend";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1418 forKeys:v1417 count:2];
  v360 = (void *)objc_claimAutoreleasedReturnValue();
  v1468[24] = v360;
  v1467[25] = @"RB_PerformRollbackResume";
  v1415[0] = v3;
  v1415[1] = v2;
  v1416[0] = @"RB_RollingBackResume";
  v1416[1] = @"RollbackUpdateResume";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1416 forKeys:v1415 count:2];
  v359 = (void *)objc_claimAutoreleasedReturnValue();
  v1468[25] = v359;
  v1467[26] = @"RB_PerformRollbackApply";
  v1413[0] = v3;
  v1413[1] = v2;
  v1414[0] = @"RB_RollingBackApply";
  v1414[1] = @"RollbackUpdateApply";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1414 forKeys:v1413 count:2];
  v358 = (void *)objc_claimAutoreleasedReturnValue();
  v1468[26] = v358;
  v1467[27] = @"RB_RollbackAppleSuccess";
  v1411[0] = v3;
  v1411[1] = v2;
  v1412[0] = @"AwaitingReboot";
  v1412[1] = @"ReportRollbackSucceeded";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1412 forKeys:v1411 count:2];
  v357 = (void *)objc_claimAutoreleasedReturnValue();
  v1468[27] = v357;
  [MEMORY[0x189603F68] dictionaryWithObjects:v1468 forKeys:v1467 count:28];
  v356 = (void *)objc_claimAutoreleasedReturnValue();
  v1728[5] = v356;
  v1727[6] = @"DownloadingSU";
  v1409[0] = @"TargetBrainLoaded";
  uint64_t v1407 = v2;
  v1408 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1408 forKeys:&v1407 count:1];
  v355 = (void *)objc_claimAutoreleasedReturnValue();
  v1410[0] = v355;
  v1409[1] = @"TargetDownloadPreflighted";
  uint64_t v1405 = v2;
  v1406 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1406 forKeys:&v1405 count:1];
  v354 = (void *)objc_claimAutoreleasedReturnValue();
  v1410[1] = v354;
  v1409[2] = @"TargetDownloaded";
  uint64_t v1403 = v2;
  v1404 = @"UpdateTargetReconfig";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1404 forKeys:&v1403 count:1];
  v353 = (void *)objc_claimAutoreleasedReturnValue();
  v1410[2] = v353;
  v1409[3] = @"TargetPrepared";
  uint64_t v1401 = v2;
  v1402 = @"UpdateTargetReconfig";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1402 forKeys:&v1401 count:1];
  v352 = (void *)objc_claimAutoreleasedReturnValue();
  v1410[3] = v352;
  v1409[4] = @"TargetApplied";
  uint64_t v1399 = v2;
  v1400 = @"UpdateTargetReconfig";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1400 forKeys:&v1399 count:1];
  v351 = (void *)objc_claimAutoreleasedReturnValue();
  v1410[4] = v351;
  v1409[5] = @"TargetRollback";
  uint64_t v1397 = v2;
  v1398 = @"DecideCancelBeforeRollback";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1398 forKeys:&v1397 count:1];
  v350 = (void *)objc_claimAutoreleasedReturnValue();
  v1410[5] = v350;
  v1409[6] = @"ResumeCurrentUpdate";
  uint64_t v1395 = v2;
  v1396 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1396 forKeys:&v1395 count:1];
  v349 = (void *)objc_claimAutoreleasedReturnValue();
  v1410[6] = v349;
  v1409[7] = @"CancelCurrentUpdate";
  v1393[0] = v3;
  v1393[1] = v2;
  v1394[0] = @"Canceling";
  v1394[1] = @"RemoveSU";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1394 forKeys:v1393 count:2];
  v348 = (void *)objc_claimAutoreleasedReturnValue();
  v1410[7] = v348;
  v1409[8] = @"DownloadProgress";
  uint64_t v1391 = v2;
  v1392 = @"ReportDownloadProgress";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1392 forKeys:&v1391 count:1];
  v347 = (void *)objc_claimAutoreleasedReturnValue();
  v1410[8] = v347;
  v1409[9] = @"DownloadStalled";
  v1389[0] = v3;
  v1389[1] = v2;
  v1390[0] = @"DownloadSUStalled";
  v1390[1] = @"ReportDownloadStalled";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1390 forKeys:v1389 count:2];
  v346 = (void *)objc_claimAutoreleasedReturnValue();
  v1410[9] = v346;
  v1409[10] = @"DownloadSuccess";
  uint64_t v1387 = v2;
  v1388 = @"AdvanceSUDownloaded";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1388 forKeys:&v1387 count:1];
  v345 = (void *)objc_claimAutoreleasedReturnValue();
  v1410[10] = v345;
  v1409[11] = @"DownloadFailed";
  uint64_t v1385 = v2;
  v1386 = @"ChooseErrorSpaceCheck";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1386 forKeys:&v1385 count:1];
  v344 = (void *)objc_claimAutoreleasedReturnValue();
  v1410[11] = v344;
  v1409[12] = @"DownloadSuccessAtTarget";
  uint64_t v1383 = v3;
  v1384 = @"SUDownloaded";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1384 forKeys:&v1383 count:1];
  v343 = (void *)objc_claimAutoreleasedReturnValue();
  v1410[12] = v343;
  v1409[13] = @"PerformPrepare";
  v1381[0] = v3;
  v1381[1] = v2;
  v1382[0] = @"Preparing";
  v1382[1] = @"PrepareUpdate";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1382 forKeys:v1381 count:2];
  v342 = (void *)objc_claimAutoreleasedReturnValue();
  v1410[13] = v342;
  v1409[14] = @"PerformSuspend";
  v1379[0] = v3;
  v1379[1] = v2;
  v1380[0] = @"Suspending";
  v1380[1] = @"SuspendUpdate";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1380 forKeys:v1379 count:2];
  v341 = (void *)objc_claimAutoreleasedReturnValue();
  v1410[14] = v341;
  v1409[15] = @"SuspendSuccessAtTarget";
  v1377[0] = v3;
  v1377[1] = v2;
  v1378[0] = @"Prepared";
  v1378[1] = @"ReportPrepared";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1378 forKeys:v1377 count:2];
  v340 = (void *)objc_claimAutoreleasedReturnValue();
  v1410[15] = v340;
  v1409[16] = @"PerformResume";
  v1375[0] = v3;
  v1375[1] = v2;
  v1376[0] = @"Resuming";
  v1376[1] = @"ResumeUpdate";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1376 forKeys:v1375 count:2];
  v339 = (void *)objc_claimAutoreleasedReturnValue();
  v1410[16] = v339;
  v1409[17] = @"ResumeSuccessAtTarget";
  v1373[0] = v3;
  v1373[1] = v2;
  v1374[0] = @"Prepared";
  v1374[1] = @"ReportPrepared";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1374 forKeys:v1373 count:2];
  v338 = (void *)objc_claimAutoreleasedReturnValue();
  v1410[17] = v338;
  v1409[18] = @"PerformApply";
  v1371[0] = v3;
  v1371[1] = v2;
  v1372[0] = @"Applying";
  v1372[1] = @"ApplyUpdate";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1372 forKeys:v1371 count:2];
  v337 = (void *)objc_claimAutoreleasedReturnValue();
  v1410[18] = v337;
  v1409[19] = @"ApplySuccess";
  v1369[0] = v3;
  v1369[1] = v2;
  v1370[0] = @"AwaitingReboot";
  v1370[1] = @"ReportApplied";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1370 forKeys:v1369 count:2];
  v336 = (void *)objc_claimAutoreleasedReturnValue();
  v1410[19] = v336;
  v1409[20] = @"RB_CancelNonRollbackUpdate";
  v1367[0] = v3;
  v1367[1] = v2;
  v1368[0] = @"RB_Canceling";
  v1368[1] = @"RemoveSU";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1368 forKeys:v1367 count:2];
  v335 = (void *)objc_claimAutoreleasedReturnValue();
  v1410[20] = v335;
  v1409[21] = @"RB_BeginRollback";
  v1365[0] = v3;
  v1365[1] = v2;
  v1366[0] = @"RB_ReadyToBegin";
  v1366[1] = @"LoadBrainRollback";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1366 forKeys:v1365 count:2];
  v334 = (void *)objc_claimAutoreleasedReturnValue();
  v1410[21] = v334;
  v1409[22] = @"RB_PerformLoadBrain";
  v1363[0] = v3;
  v1363[1] = v2;
  v1364[0] = @"RB_LoadingBrain";
  v1364[1] = @"LoadBrain";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1364 forKeys:v1363 count:2];
  v333 = (void *)objc_claimAutoreleasedReturnValue();
  v1410[22] = v333;
  v1409[23] = @"RB_PerformRollbackPrepare";
  v1361[0] = v3;
  v1361[1] = v2;
  v1362[0] = @"RB_RollingBackPrepare";
  v1362[1] = @"RollbackUpdatePrepare";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1362 forKeys:v1361 count:2];
  v332 = (void *)objc_claimAutoreleasedReturnValue();
  v1410[23] = v332;
  v1409[24] = @"RB_PerformRollbackSuspend";
  v1359[0] = v3;
  v1359[1] = v2;
  v1360[0] = @"RB_RollingBackSuspend";
  v1360[1] = @"RollbackUpdateSuspend";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1360 forKeys:v1359 count:2];
  v331 = (void *)objc_claimAutoreleasedReturnValue();
  v1410[24] = v331;
  v1409[25] = @"RB_PerformRollbackResume";
  v1357[0] = v3;
  v1357[1] = v2;
  v1358[0] = @"RB_RollingBackResume";
  v1358[1] = @"RollbackUpdateResume";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1358 forKeys:v1357 count:2];
  v330 = (void *)objc_claimAutoreleasedReturnValue();
  v1410[25] = v330;
  v1409[26] = @"RB_PerformRollbackApply";
  v1355[0] = v3;
  v1355[1] = v2;
  v1356[0] = @"RB_RollingBackApply";
  v1356[1] = @"RollbackUpdateApply";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1356 forKeys:v1355 count:2];
  v329 = (void *)objc_claimAutoreleasedReturnValue();
  v1410[26] = v329;
  v1409[27] = @"RB_RollbackAppleSuccess";
  v1353[0] = v3;
  v1353[1] = v2;
  v1354[0] = @"AwaitingReboot";
  v1354[1] = @"ReportRollbackSucceeded";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1354 forKeys:v1353 count:2];
  v328 = (void *)objc_claimAutoreleasedReturnValue();
  v1410[27] = v328;
  v1409[28] = @"PerformErrorSpaceCheck";
  v1351[0] = v3;
  v1351[1] = v2;
  v1352[0] = @"CheckingSpaceAfterError";
  v1352[1] = @"CheckSpace";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1352 forKeys:v1351 count:2];
  v327 = (void *)objc_claimAutoreleasedReturnValue();
  v1410[28] = v327;
  v1409[29] = @"SkipErrorSpaceCheck";
  v1349[0] = v3;
  v1349[1] = v2;
  v1350[0] = @"ReadyToBegin";
  v1350[1] = @"ReportAttemptFailure";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1350 forKeys:v1349 count:2];
  v326 = (void *)objc_claimAutoreleasedReturnValue();
  v1410[29] = v326;
  [MEMORY[0x189603F68] dictionaryWithObjects:v1410 forKeys:v1409 count:30];
  v325 = (void *)objc_claimAutoreleasedReturnValue();
  v1728[6] = v325;
  v1727[7] = @"DownloadSUStalled";
  v1347[0] = @"TargetBrainLoaded";
  uint64_t v1345 = v2;
  v1346 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1346 forKeys:&v1345 count:1];
  v324 = (void *)objc_claimAutoreleasedReturnValue();
  v1348[0] = v324;
  v1347[1] = @"TargetDownloadPreflighted";
  uint64_t v1343 = v2;
  v1344 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1344 forKeys:&v1343 count:1];
  v323 = (void *)objc_claimAutoreleasedReturnValue();
  v1348[1] = v323;
  v1347[2] = @"TargetDownloaded";
  uint64_t v1341 = v2;
  v1342 = @"UpdateTargetReconfig";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1342 forKeys:&v1341 count:1];
  v322 = (void *)objc_claimAutoreleasedReturnValue();
  v1348[2] = v322;
  v1347[3] = @"TargetPrepared";
  uint64_t v1339 = v2;
  v1340 = @"UpdateTargetReconfig";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1340 forKeys:&v1339 count:1];
  v321 = (void *)objc_claimAutoreleasedReturnValue();
  v1348[3] = v321;
  v1347[4] = @"TargetApplied";
  uint64_t v1337 = v2;
  v1338 = @"UpdateTargetReconfig";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1338 forKeys:&v1337 count:1];
  v320 = (void *)objc_claimAutoreleasedReturnValue();
  v1348[4] = v320;
  v1347[5] = @"TargetRollback";
  uint64_t v1335 = v2;
  v1336 = @"DecideCancelBeforeRollback";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1336 forKeys:&v1335 count:1];
  v319 = (void *)objc_claimAutoreleasedReturnValue();
  v1348[5] = v319;
  v1347[6] = @"ResumeCurrentUpdate";
  uint64_t v1333 = v2;
  v1334 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1334 forKeys:&v1333 count:1];
  v318 = (void *)objc_claimAutoreleasedReturnValue();
  v1348[6] = v318;
  v1347[7] = @"CancelCurrentUpdate";
  v1331[0] = v3;
  v1331[1] = v2;
  v1332[0] = @"Canceling";
  v1332[1] = @"RemoveSU";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1332 forKeys:v1331 count:2];
  v317 = (void *)objc_claimAutoreleasedReturnValue();
  v1348[7] = v317;
  v1347[8] = @"DownloadProgress";
  v1329[0] = v3;
  v1329[1] = v2;
  v1330[0] = @"DownloadingSU";
  v1330[1] = @"ReportDownloadProgress";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1330 forKeys:v1329 count:2];
  v316 = (void *)objc_claimAutoreleasedReturnValue();
  v1348[8] = v316;
  v1347[9] = @"DownloadStalled";
  uint64_t v1327 = v2;
  uint64_t v1328 = *MEMORY[0x1896129D8];
  uint64_t v535 = v1328;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1328 forKeys:&v1327 count:1];
  v315 = (void *)objc_claimAutoreleasedReturnValue();
  v1348[9] = v315;
  v1347[10] = @"DownloadSuccess";
  uint64_t v1325 = v2;
  v1326 = @"AdvanceSUDownloaded";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1326 forKeys:&v1325 count:1];
  v313 = (void *)objc_claimAutoreleasedReturnValue();
  v1348[10] = v313;
  v1347[11] = @"DownloadFailed";
  uint64_t v1323 = v2;
  v1324 = @"ChooseErrorSpaceCheck";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1324 forKeys:&v1323 count:1];
  v312 = (void *)objc_claimAutoreleasedReturnValue();
  v1348[11] = v312;
  v1347[12] = @"DownloadSuccessAtTarget";
  uint64_t v1321 = v3;
  v1322 = @"SUDownloaded";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1322 forKeys:&v1321 count:1];
  v537 = (void *)objc_claimAutoreleasedReturnValue();
  v1348[12] = v537;
  v1347[13] = @"PerformPrepare";
  v1319[0] = v3;
  v1319[1] = v2;
  v1320[0] = @"Preparing";
  v1320[1] = @"PrepareUpdate";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1320 forKeys:v1319 count:2];
  v311 = (void *)objc_claimAutoreleasedReturnValue();
  v1348[13] = v311;
  v1347[14] = @"PerformSuspend";
  v1317[0] = v3;
  v1317[1] = v2;
  v1318[0] = @"Suspending";
  v1318[1] = @"SuspendUpdate";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1318 forKeys:v1317 count:2];
  v310 = (void *)objc_claimAutoreleasedReturnValue();
  v1348[14] = v310;
  v1347[15] = @"SuspendSuccessAtTarget";
  v1315[0] = v3;
  v1315[1] = v2;
  v1316[0] = @"Prepared";
  v1316[1] = @"ReportPrepared";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1316 forKeys:v1315 count:2];
  v309 = (void *)objc_claimAutoreleasedReturnValue();
  v1348[15] = v309;
  v1347[16] = @"PerformResume";
  v1313[0] = v3;
  v1313[1] = v2;
  v1314[0] = @"Resuming";
  v1314[1] = @"ResumeUpdate";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1314 forKeys:v1313 count:2];
  v308 = (void *)objc_claimAutoreleasedReturnValue();
  v1348[16] = v308;
  v1347[17] = @"ResumeSuccessAtTarget";
  v1311[0] = v3;
  v1311[1] = v2;
  v1312[0] = @"Prepared";
  v1312[1] = @"ReportPrepared";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1312 forKeys:v1311 count:2];
  v307 = (void *)objc_claimAutoreleasedReturnValue();
  v1348[17] = v307;
  v1347[18] = @"PerformApply";
  v1309[0] = v3;
  v1309[1] = v2;
  v1310[0] = @"Applying";
  v1310[1] = @"ApplyUpdate";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1310 forKeys:v1309 count:2];
  v306 = (void *)objc_claimAutoreleasedReturnValue();
  v1348[18] = v306;
  v1347[19] = @"ApplySuccess";
  v1307[0] = v3;
  v1307[1] = v2;
  v1308[0] = @"AwaitingReboot";
  v1308[1] = @"ReportApplied";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1308 forKeys:v1307 count:2];
  v305 = (void *)objc_claimAutoreleasedReturnValue();
  v1348[19] = v305;
  v1347[20] = @"RB_CancelNonRollbackUpdate";
  v1305[0] = v3;
  v1305[1] = v2;
  v1306[0] = @"RB_Canceling";
  v1306[1] = @"RemoveSU";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1306 forKeys:v1305 count:2];
  v304 = (void *)objc_claimAutoreleasedReturnValue();
  v1348[20] = v304;
  v1347[21] = @"RB_BeginRollback";
  v1303[0] = v3;
  v1303[1] = v2;
  v1304[0] = @"RB_ReadyToBegin";
  v1304[1] = @"LoadBrainRollback";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1304 forKeys:v1303 count:2];
  v303 = (void *)objc_claimAutoreleasedReturnValue();
  v1348[21] = v303;
  v1347[22] = @"RB_PerformLoadBrain";
  v1301[0] = v3;
  v1301[1] = v2;
  v1302[0] = @"RB_LoadingBrain";
  v1302[1] = @"LoadBrain";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1302 forKeys:v1301 count:2];
  v302 = (void *)objc_claimAutoreleasedReturnValue();
  v1348[22] = v302;
  v1347[23] = @"RB_PerformRollbackPrepare";
  v1299[0] = v3;
  v1299[1] = v2;
  v1300[0] = @"RB_RollingBackPrepare";
  v1300[1] = @"RollbackUpdatePrepare";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1300 forKeys:v1299 count:2];
  v301 = (void *)objc_claimAutoreleasedReturnValue();
  v1348[23] = v301;
  v1347[24] = @"RB_PerformRollbackSuspend";
  v1297[0] = v3;
  v1297[1] = v2;
  v1298[0] = @"RB_RollingBackSuspend";
  v1298[1] = @"RollbackUpdateSuspend";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1298 forKeys:v1297 count:2];
  v300 = (void *)objc_claimAutoreleasedReturnValue();
  v1348[24] = v300;
  v1347[25] = @"RB_PerformRollbackResume";
  v1295[0] = v3;
  v1295[1] = v2;
  v1296[0] = @"RB_RollingBackResume";
  v1296[1] = @"RollbackUpdateResume";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1296 forKeys:v1295 count:2];
  v299 = (void *)objc_claimAutoreleasedReturnValue();
  v1348[25] = v299;
  v1347[26] = @"RB_PerformRollbackApply";
  v1293[0] = v3;
  v1293[1] = v2;
  v1294[0] = @"RB_RollingBackApply";
  v1294[1] = @"RollbackUpdateApply";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1294 forKeys:v1293 count:2];
  v298 = (void *)objc_claimAutoreleasedReturnValue();
  v1348[26] = v298;
  v1347[27] = @"RB_RollbackAppleSuccess";
  v1291[0] = v3;
  v1291[1] = v2;
  v1292[0] = @"AwaitingReboot";
  v1292[1] = @"ReportRollbackSucceeded";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1292 forKeys:v1291 count:2];
  v297 = (void *)objc_claimAutoreleasedReturnValue();
  v1348[27] = v297;
  v1347[28] = @"PerformErrorSpaceCheck";
  v1289[0] = v3;
  v1289[1] = v2;
  v1290[0] = @"CheckingSpaceAfterError";
  v1290[1] = @"CheckSpace";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1290 forKeys:v1289 count:2];
  v296 = (void *)objc_claimAutoreleasedReturnValue();
  v1348[28] = v296;
  v1347[29] = @"SkipErrorSpaceCheck";
  v1287[0] = v3;
  v1287[1] = v2;
  v1288[0] = @"ReadyToBegin";
  v1288[1] = @"ReportAttemptFailure";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1288 forKeys:v1287 count:2];
  v294 = (void *)objc_claimAutoreleasedReturnValue();
  v1348[29] = v294;
  [MEMORY[0x189603F68] dictionaryWithObjects:v1348 forKeys:v1347 count:30];
  v293 = (void *)objc_claimAutoreleasedReturnValue();
  v1728[7] = v293;
  v1727[8] = @"SUDownloaded";
  v1285[0] = @"TargetBrainLoaded";
  uint64_t v1283 = v2;
  v1284 = @"ReportAnomalyAPIEnd";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1284 forKeys:&v1283 count:1];
  v292 = (void *)objc_claimAutoreleasedReturnValue();
  v1286[0] = v292;
  v1285[1] = @"TargetDownloadPreflighted";
  uint64_t v1281 = v2;
  v1282 = @"ReportAnomalyAPIEnd";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1282 forKeys:&v1281 count:1];
  v291 = (void *)objc_claimAutoreleasedReturnValue();
  v1286[1] = v291;
  v1285[2] = @"TargetDownloaded";
  uint64_t v1279 = v2;
  v1280 = @"UpdateTarget";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1280 forKeys:&v1279 count:1];
  v290 = (void *)objc_claimAutoreleasedReturnValue();
  v1286[2] = v290;
  v1285[3] = @"TargetPrepared";
  uint64_t v1277 = v2;
  v1278 = @"DecidePrepareUpdate";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1278 forKeys:&v1277 count:1];
  v289 = (void *)objc_claimAutoreleasedReturnValue();
  v1286[3] = v289;
  v1285[4] = @"TargetApplied";
  uint64_t v1275 = v2;
  v1276 = @"DecidePrepareUpdate";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1276 forKeys:&v1275 count:1];
  v288 = (void *)objc_claimAutoreleasedReturnValue();
  v1286[4] = v288;
  v1285[5] = @"TargetRollback";
  uint64_t v1273 = v2;
  v1274 = @"DecideCancelBeforeRollback";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1274 forKeys:&v1273 count:1];
  v287 = (void *)objc_claimAutoreleasedReturnValue();
  v1286[5] = v287;
  v1285[6] = @"ResumeCurrentUpdate";
  uint64_t v1271 = v2;
  v1272 = @"ReportAnomalyAPIEnd";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1272 forKeys:&v1271 count:1];
  v286 = (void *)objc_claimAutoreleasedReturnValue();
  v1286[6] = v286;
  v1285[7] = @"CancelCurrentUpdate";
  v1269[0] = v3;
  v1269[1] = v2;
  v1270[0] = @"Canceling";
  v1270[1] = @"RemoveSU";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1270 forKeys:v1269 count:2];
  v285 = (void *)objc_claimAutoreleasedReturnValue();
  v1286[7] = v285;
  v1285[8] = @"PerformPrepare";
  v1267[0] = v3;
  v1267[1] = v2;
  v1268[0] = @"Preparing";
  v1268[1] = @"PrepareUpdate";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1268 forKeys:v1267 count:2];
  v284 = (void *)objc_claimAutoreleasedReturnValue();
  v1286[8] = v284;
  v1285[9] = @"PerformSuspend";
  v1265[0] = v3;
  v1265[1] = v2;
  v1266[0] = @"Suspending";
  v1266[1] = @"SuspendUpdate";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1266 forKeys:v1265 count:2];
  v283 = (void *)objc_claimAutoreleasedReturnValue();
  v1286[9] = v283;
  v1285[10] = @"SuspendSuccessAtTarget";
  v1263[0] = v3;
  v1263[1] = v2;
  v1264[0] = @"Prepared";
  v1264[1] = @"ReportPrepared";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1264 forKeys:v1263 count:2];
  v282 = (void *)objc_claimAutoreleasedReturnValue();
  v1286[10] = v282;
  v1285[11] = @"PerformResume";
  v1261[0] = v3;
  v1261[1] = v2;
  v1262[0] = @"Resuming";
  v1262[1] = @"ResumeUpdate";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1262 forKeys:v1261 count:2];
  v281 = (void *)objc_claimAutoreleasedReturnValue();
  v1286[11] = v281;
  v1285[12] = @"ResumeSuccessAtTarget";
  v1259[0] = v3;
  v1259[1] = v2;
  v1260[0] = @"Prepared";
  v1260[1] = @"ReportPrepared";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1260 forKeys:v1259 count:2];
  v280 = (void *)objc_claimAutoreleasedReturnValue();
  v1286[12] = v280;
  v1285[13] = @"PerformApply";
  v1257[0] = v3;
  v1257[1] = v2;
  v1258[0] = @"Applying";
  v1258[1] = @"ApplyUpdate";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1258 forKeys:v1257 count:2];
  v279 = (void *)objc_claimAutoreleasedReturnValue();
  v1286[13] = v279;
  v1285[14] = @"ApplySuccess";
  v1255[0] = v3;
  v1255[1] = v2;
  v1256[0] = @"AwaitingReboot";
  v1256[1] = @"ReportApplied";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1256 forKeys:v1255 count:2];
  v278 = (void *)objc_claimAutoreleasedReturnValue();
  v1286[14] = v278;
  v1285[15] = @"RB_CancelNonRollbackUpdate";
  v1253[0] = v3;
  v1253[1] = v2;
  v1254[0] = @"RB_Canceling";
  v1254[1] = @"RemoveSU";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1254 forKeys:v1253 count:2];
  v277 = (void *)objc_claimAutoreleasedReturnValue();
  v1286[15] = v277;
  v1285[16] = @"RB_BeginRollback";
  v1251[0] = v3;
  v1251[1] = v2;
  v1252[0] = @"RB_ReadyToBegin";
  v1252[1] = @"LoadBrainRollback";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1252 forKeys:v1251 count:2];
  v276 = (void *)objc_claimAutoreleasedReturnValue();
  v1286[16] = v276;
  v1285[17] = @"RB_PerformLoadBrain";
  v1249[0] = v3;
  v1249[1] = v2;
  v1250[0] = @"RB_LoadingBrain";
  v1250[1] = @"LoadBrain";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1250 forKeys:v1249 count:2];
  v275 = (void *)objc_claimAutoreleasedReturnValue();
  v1286[17] = v275;
  v1285[18] = @"RB_PerformRollbackPrepare";
  v1247[0] = v3;
  v1247[1] = v2;
  v1248[0] = @"RB_RollingBackPrepare";
  v1248[1] = @"RollbackUpdatePrepare";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1248 forKeys:v1247 count:2];
  v274 = (void *)objc_claimAutoreleasedReturnValue();
  v1286[18] = v274;
  v1285[19] = @"RB_PerformRollbackSuspend";
  v1245[0] = v3;
  v1245[1] = v2;
  v1246[0] = @"RB_RollingBackSuspend";
  v1246[1] = @"RollbackUpdateSuspend";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1246 forKeys:v1245 count:2];
  v273 = (void *)objc_claimAutoreleasedReturnValue();
  v1286[19] = v273;
  v1285[20] = @"RB_PerformRollbackResume";
  v1243[0] = v3;
  v1243[1] = v2;
  v1244[0] = @"RB_RollingBackResume";
  v1244[1] = @"RollbackUpdateResume";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1244 forKeys:v1243 count:2];
  v272 = (void *)objc_claimAutoreleasedReturnValue();
  v1286[20] = v272;
  v1285[21] = @"RB_PerformRollbackApply";
  v1241[0] = v3;
  v1241[1] = v2;
  v1242[0] = @"RB_RollingBackApply";
  v1242[1] = @"RollbackUpdateApply";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1242 forKeys:v1241 count:2];
  v271 = (void *)objc_claimAutoreleasedReturnValue();
  v1286[21] = v271;
  v1285[22] = @"RB_RollbackAppleSuccess";
  v1239[0] = v3;
  v1239[1] = v2;
  v1240[0] = @"AwaitingReboot";
  v1240[1] = @"ReportRollbackSucceeded";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1240 forKeys:v1239 count:2];
  v270 = (void *)objc_claimAutoreleasedReturnValue();
  v1286[22] = v270;
  [MEMORY[0x189603F68] dictionaryWithObjects:v1286 forKeys:v1285 count:23];
  v269 = (void *)objc_claimAutoreleasedReturnValue();
  v1728[8] = v269;
  v1727[9] = @"Preparing";
  v1237[0] = @"TargetBrainLoaded";
  uint64_t v1235 = v2;
  v1236 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1236 forKeys:&v1235 count:1];
  v268 = (void *)objc_claimAutoreleasedReturnValue();
  v1238[0] = v268;
  v1237[1] = @"TargetDownloadPreflighted";
  uint64_t v1233 = v2;
  v1234 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1234 forKeys:&v1233 count:1];
  v267 = (void *)objc_claimAutoreleasedReturnValue();
  v1238[1] = v267;
  v1237[2] = @"TargetDownloaded";
  uint64_t v1231 = v2;
  v1232 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1232 forKeys:&v1231 count:1];
  v266 = (void *)objc_claimAutoreleasedReturnValue();
  v1238[2] = v266;
  v1237[3] = @"TargetPrepared";
  uint64_t v1229 = v2;
  v1230 = @"UpdateTarget";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1230 forKeys:&v1229 count:1];
  v265 = (void *)objc_claimAutoreleasedReturnValue();
  v1238[3] = v265;
  v1237[4] = @"TargetApplied";
  uint64_t v1227 = v2;
  v1228 = @"UpdateTarget";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1228 forKeys:&v1227 count:1];
  v264 = (void *)objc_claimAutoreleasedReturnValue();
  v1238[4] = v264;
  v1237[5] = @"TargetRollback";
  uint64_t v1225 = v2;
  v1226 = @"DecideCancelBeforeRollback";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1226 forKeys:&v1225 count:1];
  v263 = (void *)objc_claimAutoreleasedReturnValue();
  v1238[5] = v263;
  v1237[6] = @"ResumeCurrentUpdate";
  uint64_t v1223 = v2;
  v1224 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1224 forKeys:&v1223 count:1];
  v262 = (void *)objc_claimAutoreleasedReturnValue();
  v1238[6] = v262;
  v1237[7] = @"CancelCurrentUpdate";
  v1221[0] = v3;
  v1221[1] = v2;
  v1222[0] = @"Canceling";
  v1222[1] = @"CancelPrepare";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1222 forKeys:v1221 count:2];
  v261 = (void *)objc_claimAutoreleasedReturnValue();
  v1238[7] = v261;
  v1237[8] = @"PrepareProgress";
  uint64_t v1219 = v2;
  v1220 = @"ReportPrepareProgress";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1220 forKeys:&v1219 count:1];
  v260 = (void *)objc_claimAutoreleasedReturnValue();
  v1238[8] = v260;
  v1237[9] = @"PrepareSuccess";
  uint64_t v1217 = v2;
  v1218 = @"DecideSuspendUpdate";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1218 forKeys:&v1217 count:1];
  v259 = (void *)objc_claimAutoreleasedReturnValue();
  v1238[9] = v259;
  v1237[10] = @"PrepareFailed";
  v1215[0] = v3;
  v1215[1] = v2;
  v1216[0] = @"RemovingSU";
  v1216[1] = @"RemoveSU";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1216 forKeys:v1215 count:2];
  v258 = (void *)objc_claimAutoreleasedReturnValue();
  v1238[10] = v258;
  v1237[11] = @"PerformSuspend";
  v1213[0] = v3;
  v1213[1] = v2;
  v1214[0] = @"Suspending";
  v1214[1] = @"SuspendUpdate";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1214 forKeys:v1213 count:2];
  v257 = (void *)objc_claimAutoreleasedReturnValue();
  v1238[11] = v257;
  v1237[12] = @"SuspendSuccessAtTarget";
  v1211[0] = v3;
  v1211[1] = v2;
  v1212[0] = @"Prepared";
  v1212[1] = @"ReportPrepared";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1212 forKeys:v1211 count:2];
  v256 = (void *)objc_claimAutoreleasedReturnValue();
  v1238[12] = v256;
  v1237[13] = @"PerformResume";
  v1209[0] = v3;
  v1209[1] = v2;
  v1210[0] = @"Resuming";
  v1210[1] = @"ResumeUpdate";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1210 forKeys:v1209 count:2];
  v255 = (void *)objc_claimAutoreleasedReturnValue();
  v1238[13] = v255;
  v1237[14] = @"ResumeSuccessAtTarget";
  v1207[0] = v3;
  v1207[1] = v2;
  v1208[0] = @"Prepared";
  v1208[1] = @"ReportPrepared";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1208 forKeys:v1207 count:2];
  v254 = (void *)objc_claimAutoreleasedReturnValue();
  v1238[14] = v254;
  v1237[15] = @"PerformApply";
  v1205[0] = v3;
  v1205[1] = v2;
  v1206[0] = @"Applying";
  v1206[1] = @"ApplyUpdate";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1206 forKeys:v1205 count:2];
  v253 = (void *)objc_claimAutoreleasedReturnValue();
  v1238[15] = v253;
  v1237[16] = @"ApplySuccess";
  v1203[0] = v3;
  v1203[1] = v2;
  v1204[0] = @"AwaitingReboot";
  v1204[1] = @"ReportApplied";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1204 forKeys:v1203 count:2];
  v252 = (void *)objc_claimAutoreleasedReturnValue();
  v1238[16] = v252;
  v1237[17] = @"RB_CancelNonRollbackUpdate";
  v1201[0] = v3;
  v1201[1] = v2;
  v1202[0] = @"RB_Canceling";
  v1202[1] = @"CancelPrepare";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1202 forKeys:v1201 count:2];
  v251 = (void *)objc_claimAutoreleasedReturnValue();
  v1238[17] = v251;
  v1237[18] = @"RB_BeginRollback";
  v1199[0] = v3;
  v1199[1] = v2;
  v1200[0] = @"RB_ReadyToBegin";
  v1200[1] = @"LoadBrainRollback";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1200 forKeys:v1199 count:2];
  v250 = (void *)objc_claimAutoreleasedReturnValue();
  v1238[18] = v250;
  v1237[19] = @"RB_PerformLoadBrain";
  v1197[0] = v3;
  v1197[1] = v2;
  v1198[0] = @"RB_LoadingBrain";
  v1198[1] = @"LoadBrain";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1198 forKeys:v1197 count:2];
  v249 = (void *)objc_claimAutoreleasedReturnValue();
  v1238[19] = v249;
  v1237[20] = @"RB_PerformRollbackPrepare";
  v1195[0] = v3;
  v1195[1] = v2;
  v1196[0] = @"RB_RollingBackPrepare";
  v1196[1] = @"RollbackUpdatePrepare";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1196 forKeys:v1195 count:2];
  v248 = (void *)objc_claimAutoreleasedReturnValue();
  v1238[20] = v248;
  v1237[21] = @"RB_PerformRollbackSuspend";
  v1193[0] = v3;
  v1193[1] = v2;
  v1194[0] = @"RB_RollingBackSuspend";
  v1194[1] = @"RollbackUpdateSuspend";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1194 forKeys:v1193 count:2];
  v247 = (void *)objc_claimAutoreleasedReturnValue();
  v1238[21] = v247;
  v1237[22] = @"RB_PerformRollbackResume";
  v1191[0] = v3;
  v1191[1] = v2;
  v1192[0] = @"RB_RollingBackResume";
  v1192[1] = @"RollbackUpdateResume";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1192 forKeys:v1191 count:2];
  v246 = (void *)objc_claimAutoreleasedReturnValue();
  v1238[22] = v246;
  v1237[23] = @"RB_PerformRollbackApply";
  v1189[0] = v3;
  v1189[1] = v2;
  v1190[0] = @"RB_RollingBackApply";
  v1190[1] = @"RollbackUpdateApply";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1190 forKeys:v1189 count:2];
  v245 = (void *)objc_claimAutoreleasedReturnValue();
  v1238[23] = v245;
  v1237[24] = @"RB_RollbackAppleSuccess";
  v1187[0] = v3;
  v1187[1] = v2;
  v1188[0] = @"AwaitingReboot";
  v1188[1] = @"ReportRollbackSucceeded";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1188 forKeys:v1187 count:2];
  v244 = (void *)objc_claimAutoreleasedReturnValue();
  v1238[24] = v244;
  [MEMORY[0x189603F68] dictionaryWithObjects:v1238 forKeys:v1237 count:25];
  v243 = (void *)objc_claimAutoreleasedReturnValue();
  v1728[9] = v243;
  v1727[10] = @"Suspending";
  v1185[0] = @"TargetBrainLoaded";
  uint64_t v1183 = v2;
  v1184 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1184 forKeys:&v1183 count:1];
  v242 = (void *)objc_claimAutoreleasedReturnValue();
  v1186[0] = v242;
  v1185[1] = @"TargetDownloadPreflighted";
  uint64_t v1181 = v2;
  v1182 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1182 forKeys:&v1181 count:1];
  v241 = (void *)objc_claimAutoreleasedReturnValue();
  v1186[1] = v241;
  v1185[2] = @"TargetDownloaded";
  uint64_t v1179 = v2;
  v1180 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1180 forKeys:&v1179 count:1];
  v240 = (void *)objc_claimAutoreleasedReturnValue();
  v1186[2] = v240;
  v1185[3] = @"TargetPrepared";
  uint64_t v1177 = v2;
  v1178 = @"UpdateTarget";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1178 forKeys:&v1177 count:1];
  v239 = (void *)objc_claimAutoreleasedReturnValue();
  v1186[3] = v239;
  v1185[4] = @"TargetApplied";
  uint64_t v1175 = v2;
  v1176 = @"UpdateTarget";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1176 forKeys:&v1175 count:1];
  v238 = (void *)objc_claimAutoreleasedReturnValue();
  v1186[4] = v238;
  v1185[5] = @"TargetRollback";
  uint64_t v1173 = v2;
  v1174 = @"DecideCancelBeforeRollback";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1174 forKeys:&v1173 count:1];
  v237 = (void *)objc_claimAutoreleasedReturnValue();
  v1186[5] = v237;
  v1185[6] = @"ResumeCurrentUpdate";
  uint64_t v1171 = v2;
  v1172 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1172 forKeys:&v1171 count:1];
  v236 = (void *)objc_claimAutoreleasedReturnValue();
  v1186[6] = v236;
  v1185[7] = @"CancelCurrentUpdate";
  uint64_t v1169 = v3;
  v1170 = @"Canceling";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1170 forKeys:&v1169 count:1];
  v235 = (void *)objc_claimAutoreleasedReturnValue();
  v1186[7] = v235;
  v1185[8] = @"SuspendSuccess";
  uint64_t v1167 = v2;
  v1168 = @"AdvanceSuspended";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1168 forKeys:&v1167 count:1];
  v234 = (void *)objc_claimAutoreleasedReturnValue();
  v1186[8] = v234;
  v1185[9] = @"SuspendFailed";
  v1165[0] = v3;
  v1165[1] = v2;
  v1166[0] = @"RemovingSU";
  v1166[1] = @"RemoveSU";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1166 forKeys:v1165 count:2];
  v233 = (void *)objc_claimAutoreleasedReturnValue();
  v1186[9] = v233;
  v1185[10] = @"SuspendSuccessAtTarget";
  v1163[0] = v3;
  v1163[1] = v2;
  v1164[0] = @"Prepared";
  v1164[1] = @"ReportPrepared";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1164 forKeys:v1163 count:2];
  v542 = (void *)objc_claimAutoreleasedReturnValue();
  v1186[10] = v542;
  v1185[11] = @"PerformResume";
  v1161[0] = v3;
  v1161[1] = v2;
  v1162[0] = @"Resuming";
  v1162[1] = @"ResumeUpdate";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1162 forKeys:v1161 count:2];
  v232 = (void *)objc_claimAutoreleasedReturnValue();
  v1186[11] = v232;
  v1185[12] = @"ResumeSuccessAtTarget";
  v1159[0] = v3;
  v1159[1] = v2;
  v1160[0] = @"Prepared";
  v1160[1] = @"ReportPrepared";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1160 forKeys:v1159 count:2];
  v231 = (void *)objc_claimAutoreleasedReturnValue();
  v1186[12] = v231;
  v1185[13] = @"PerformApply";
  v1157[0] = v3;
  v1157[1] = v2;
  v1158[0] = @"Applying";
  v1158[1] = @"ApplyUpdate";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1158 forKeys:v1157 count:2];
  v230 = (void *)objc_claimAutoreleasedReturnValue();
  v1186[13] = v230;
  v1185[14] = @"ApplySuccess";
  v1155[0] = v3;
  v1155[1] = v2;
  v1156[0] = @"AwaitingReboot";
  v1156[1] = @"ReportApplied";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1156 forKeys:v1155 count:2];
  v229 = (void *)objc_claimAutoreleasedReturnValue();
  v1186[14] = v229;
  v1185[15] = @"RB_CancelNonRollbackUpdate";
  uint64_t v1153 = v3;
  v1154 = @"RB_Canceling";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1154 forKeys:&v1153 count:1];
  v228 = (void *)objc_claimAutoreleasedReturnValue();
  v1186[15] = v228;
  v1185[16] = @"RB_BeginRollback";
  v1151[0] = v3;
  v1151[1] = v2;
  v1152[0] = @"RB_ReadyToBegin";
  v1152[1] = @"LoadBrainRollback";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1152 forKeys:v1151 count:2];
  v227 = (void *)objc_claimAutoreleasedReturnValue();
  v1186[16] = v227;
  v1185[17] = @"RB_PerformLoadBrain";
  v1149[0] = v3;
  v1149[1] = v2;
  v1150[0] = @"RB_LoadingBrain";
  v1150[1] = @"LoadBrain";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1150 forKeys:v1149 count:2];
  v226 = (void *)objc_claimAutoreleasedReturnValue();
  v1186[17] = v226;
  v1185[18] = @"RB_PerformRollbackPrepare";
  v1147[0] = v3;
  v1147[1] = v2;
  v1148[0] = @"RB_RollingBackPrepare";
  v1148[1] = @"RollbackUpdatePrepare";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1148 forKeys:v1147 count:2];
  v225 = (void *)objc_claimAutoreleasedReturnValue();
  v1186[18] = v225;
  v1185[19] = @"RB_PerformRollbackSuspend";
  v1145[0] = v3;
  v1145[1] = v2;
  v1146[0] = @"RB_RollingBackSuspend";
  v1146[1] = @"RollbackUpdateSuspend";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1146 forKeys:v1145 count:2];
  v224 = (void *)objc_claimAutoreleasedReturnValue();
  v1186[19] = v224;
  v1185[20] = @"RB_PerformRollbackResume";
  v1143[0] = v3;
  v1143[1] = v2;
  v1144[0] = @"RB_RollingBackResume";
  v1144[1] = @"RollbackUpdateResume";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1144 forKeys:v1143 count:2];
  v223 = (void *)objc_claimAutoreleasedReturnValue();
  v1186[20] = v223;
  v1185[21] = @"RB_PerformRollbackApply";
  v1141[0] = v3;
  v1141[1] = v2;
  v1142[0] = @"RB_RollingBackApply";
  v1142[1] = @"RollbackUpdateApply";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1142 forKeys:v1141 count:2];
  v222 = (void *)objc_claimAutoreleasedReturnValue();
  v1186[21] = v222;
  v1185[22] = @"RB_RollbackAppleSuccess";
  v1139[0] = v3;
  v1139[1] = v2;
  v1140[0] = @"AwaitingReboot";
  v1140[1] = @"ReportRollbackSucceeded";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1140 forKeys:v1139 count:2];
  v221 = (void *)objc_claimAutoreleasedReturnValue();
  v1186[22] = v221;
  [MEMORY[0x189603F68] dictionaryWithObjects:v1186 forKeys:v1185 count:23];
  v220 = (void *)objc_claimAutoreleasedReturnValue();
  v1728[10] = v220;
  v1727[11] = @"Prepared";
  v1137[0] = @"TargetBrainLoaded";
  uint64_t v1135 = v2;
  v1136 = @"ReportAnomalyAPIEnd";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1136 forKeys:&v1135 count:1];
  v219 = (void *)objc_claimAutoreleasedReturnValue();
  v1138[0] = v219;
  v1137[1] = @"TargetDownloadPreflighted";
  uint64_t v1133 = v2;
  v1134 = @"ReportAnomalyAPIEnd";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1134 forKeys:&v1133 count:1];
  v218 = (void *)objc_claimAutoreleasedReturnValue();
  v1138[1] = v218;
  v1137[2] = @"TargetDownloaded";
  uint64_t v1131 = v2;
  v1132 = @"ReportAnomalyAPIEnd";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1132 forKeys:&v1131 count:1];
  v217 = (void *)objc_claimAutoreleasedReturnValue();
  v1138[2] = v217;
  v1137[3] = @"TargetPrepared";
  uint64_t v1129 = v2;
  v1130 = @"UpdateTarget";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1130 forKeys:&v1129 count:1];
  v216 = (void *)objc_claimAutoreleasedReturnValue();
  v1138[3] = v216;
  v1137[4] = @"TargetApplied";
  uint64_t v1127 = v2;
  v1128 = @"DecideResumeUpdate";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1128 forKeys:&v1127 count:1];
  v215 = (void *)objc_claimAutoreleasedReturnValue();
  v1138[4] = v215;
  v1137[5] = @"TargetRollback";
  uint64_t v1125 = v2;
  v1126 = @"DecideCancelBeforeRollback";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1126 forKeys:&v1125 count:1];
  v214 = (void *)objc_claimAutoreleasedReturnValue();
  v1138[5] = v214;
  v1137[6] = @"ResumeCurrentUpdate";
  v1123[0] = v3;
  v1123[1] = v2;
  v1124[0] = @"ResumingCurrent";
  v1124[1] = @"ResumeCurrentUpdate";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1124 forKeys:v1123 count:2];
  v213 = (void *)objc_claimAutoreleasedReturnValue();
  v1138[6] = v213;
  v1137[7] = @"CancelCurrentUpdate";
  v1121[0] = v3;
  v1121[1] = v2;
  v1122[0] = @"Canceling";
  v1122[1] = @"RemovePrepared";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1122 forKeys:v1121 count:2];
  v212 = (void *)objc_claimAutoreleasedReturnValue();
  v1138[7] = v212;
  v1137[8] = @"PerformResume";
  v1119[0] = v3;
  v1119[1] = v2;
  v1120[0] = @"Resuming";
  v1120[1] = @"ResumeUpdate";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1120 forKeys:v1119 count:2];
  v211 = (void *)objc_claimAutoreleasedReturnValue();
  v1138[8] = v211;
  v1137[9] = @"ResumeSuccessAtTarget";
  uint64_t v1117 = v2;
  v1118 = @"ReportPrepared";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1118 forKeys:&v1117 count:1];
  v210 = (void *)objc_claimAutoreleasedReturnValue();
  v1138[9] = v210;
  v1137[10] = @"PerformApply";
  v1115[0] = v3;
  v1115[1] = v2;
  v1116[0] = @"Applying";
  v1116[1] = @"ApplyUpdate";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1116 forKeys:v1115 count:2];
  v209 = (void *)objc_claimAutoreleasedReturnValue();
  v1138[10] = v209;
  v1137[11] = @"ApplySuccess";
  v1113[0] = v3;
  v1113[1] = v2;
  v1114[0] = @"AwaitingReboot";
  v1114[1] = @"ReportApplied";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1114 forKeys:v1113 count:2];
  v208 = (void *)objc_claimAutoreleasedReturnValue();
  v1138[11] = v208;
  v1137[12] = @"RB_CancelNonRollbackUpdate";
  v1111[0] = v3;
  v1111[1] = v2;
  v1112[0] = @"RB_Canceling";
  v1112[1] = @"RemovePrepared";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1112 forKeys:v1111 count:2];
  v207 = (void *)objc_claimAutoreleasedReturnValue();
  v1138[12] = v207;
  v1137[13] = @"RB_BeginRollback";
  v1109[0] = v3;
  v1109[1] = v2;
  v1110[0] = @"RB_ReadyToBegin";
  v1110[1] = @"LoadBrainRollback";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1110 forKeys:v1109 count:2];
  v206 = (void *)objc_claimAutoreleasedReturnValue();
  v1138[13] = v206;
  v1137[14] = @"RB_PerformLoadBrain";
  v1107[0] = v3;
  v1107[1] = v2;
  v1108[0] = @"RB_LoadingBrain";
  v1108[1] = @"LoadBrain";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1108 forKeys:v1107 count:2];
  v205 = (void *)objc_claimAutoreleasedReturnValue();
  v1138[14] = v205;
  v1137[15] = @"RB_PerformRollbackPrepare";
  v1105[0] = v3;
  v1105[1] = v2;
  v1106[0] = @"RB_RollingBackPrepare";
  v1106[1] = @"RollbackUpdatePrepare";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1106 forKeys:v1105 count:2];
  v204 = (void *)objc_claimAutoreleasedReturnValue();
  v1138[15] = v204;
  v1137[16] = @"RB_PerformRollbackSuspend";
  v1103[0] = v3;
  v1103[1] = v2;
  v1104[0] = @"RB_RollingBackSuspend";
  v1104[1] = @"RollbackUpdateSuspend";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1104 forKeys:v1103 count:2];
  v203 = (void *)objc_claimAutoreleasedReturnValue();
  v1138[16] = v203;
  v1137[17] = @"RB_PerformRollbackResume";
  v1101[0] = v3;
  v1101[1] = v2;
  v1102[0] = @"RB_RollingBackResume";
  v1102[1] = @"RollbackUpdateResume";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1102 forKeys:v1101 count:2];
  v202 = (void *)objc_claimAutoreleasedReturnValue();
  v1138[17] = v202;
  v1137[18] = @"RB_PerformRollbackApply";
  v1099[0] = v3;
  v1099[1] = v2;
  v1100[0] = @"RB_RollingBackApply";
  v1100[1] = @"RollbackUpdateApply";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1100 forKeys:v1099 count:2];
  v201 = (void *)objc_claimAutoreleasedReturnValue();
  v1138[18] = v201;
  v1137[19] = @"RB_RollbackAppleSuccess";
  v1097[0] = v3;
  v1097[1] = v2;
  v1098[0] = @"AwaitingReboot";
  v1098[1] = @"ReportRollbackSucceeded";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1098 forKeys:v1097 count:2];
  v200 = (void *)objc_claimAutoreleasedReturnValue();
  v1138[19] = v200;
  [MEMORY[0x189603F68] dictionaryWithObjects:v1138 forKeys:v1137 count:20];
  v199 = (void *)objc_claimAutoreleasedReturnValue();
  v1728[11] = v199;
  v1727[12] = @"ResumingCurrent";
  v1095[0] = @"TargetBrainLoaded";
  uint64_t v1093 = v2;
  v1094 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1094 forKeys:&v1093 count:1];
  v198 = (void *)objc_claimAutoreleasedReturnValue();
  v1096[0] = v198;
  v1095[1] = @"TargetDownloadPreflighted";
  uint64_t v1091 = v2;
  v1092 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1092 forKeys:&v1091 count:1];
  v197 = (void *)objc_claimAutoreleasedReturnValue();
  v1096[1] = v197;
  v1095[2] = @"TargetDownloaded";
  uint64_t v1089 = v2;
  v1090 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1090 forKeys:&v1089 count:1];
  v196 = (void *)objc_claimAutoreleasedReturnValue();
  v1096[2] = v196;
  v1095[3] = @"TargetPrepared";
  uint64_t v1087 = v2;
  v1088 = @"UpdateTarget";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1088 forKeys:&v1087 count:1];
  v195 = (void *)objc_claimAutoreleasedReturnValue();
  v1096[3] = v195;
  v1095[4] = @"TargetApplied";
  v1085[0] = v3;
  v1085[1] = v2;
  v1086[0] = @"Resuming";
  v1086[1] = @"UpdateTarget";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1086 forKeys:v1085 count:2];
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  v1096[4] = v194;
  v1095[5] = @"TargetRollback";
  uint64_t v1083 = v2;
  v1084 = @"DecideCancelBeforeRollback";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1084 forKeys:&v1083 count:1];
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  v1096[5] = v193;
  v1095[6] = @"ResumeCurrentUpdate";
  uint64_t v1081 = v2;
  v1082 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1082 forKeys:&v1081 count:1];
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  v1096[6] = v192;
  v1095[7] = @"CancelCurrentUpdate";
  uint64_t v1079 = v3;
  v1080 = @"Canceling";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1080 forKeys:&v1079 count:1];
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  v1096[7] = v191;
  v1095[8] = @"ResumeSuccess";
  v1077[0] = v3;
  v1077[1] = v2;
  v1078[0] = @"Prepared";
  v1078[1] = @"ReportResumeCurrentSuccess";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1078 forKeys:v1077 count:2];
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  v1096[8] = v190;
  v1095[9] = @"ResumeFailed";
  v1075[0] = v3;
  v1075[1] = v2;
  v1076[0] = @"Prepared";
  v1076[1] = @"ReportResumeCurrentFailed";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1076 forKeys:v1075 count:2];
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  v1096[9] = v189;
  v1095[10] = @"RB_CancelNonRollbackUpdate";
  uint64_t v1073 = v3;
  v1074 = @"RB_Canceling";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1074 forKeys:&v1073 count:1];
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  v1096[10] = v188;
  v1095[11] = @"RB_BeginRollback";
  v1071[0] = v3;
  v1071[1] = v2;
  v1072[0] = @"RB_ReadyToBegin";
  v1072[1] = @"LoadBrainRollback";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1072 forKeys:v1071 count:2];
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  v1096[11] = v187;
  v1095[12] = @"RB_PerformLoadBrain";
  v1069[0] = v3;
  v1069[1] = v2;
  v1070[0] = @"RB_LoadingBrain";
  v1070[1] = @"LoadBrain";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1070 forKeys:v1069 count:2];
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  v1096[12] = v186;
  v1095[13] = @"RB_PerformRollbackPrepare";
  v1067[0] = v3;
  v1067[1] = v2;
  v1068[0] = @"RB_RollingBackPrepare";
  v1068[1] = @"RollbackUpdatePrepare";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1068 forKeys:v1067 count:2];
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  v1096[13] = v185;
  v1095[14] = @"RB_PerformRollbackSuspend";
  v1065[0] = v3;
  v1065[1] = v2;
  v1066[0] = @"RB_RollingBackSuspend";
  v1066[1] = @"RollbackUpdateSuspend";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1066 forKeys:v1065 count:2];
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  v1096[14] = v184;
  v1095[15] = @"RB_PerformRollbackResume";
  v1063[0] = v3;
  v1063[1] = v2;
  v1064[0] = @"RB_RollingBackResume";
  v1064[1] = @"RollbackUpdateResume";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1064 forKeys:v1063 count:2];
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  v1096[15] = v183;
  v1095[16] = @"RB_PerformRollbackApply";
  v1061[0] = v3;
  v1061[1] = v2;
  v1062[0] = @"RB_RollingBackApply";
  v1062[1] = @"RollbackUpdateApply";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1062 forKeys:v1061 count:2];
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  v1096[16] = v182;
  v1095[17] = @"RB_RollbackAppleSuccess";
  v1059[0] = v3;
  v1059[1] = v2;
  v1060[0] = @"AwaitingReboot";
  v1060[1] = @"ReportRollbackSucceeded";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1060 forKeys:v1059 count:2];
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  v1096[17] = v181;
  [MEMORY[0x189603F68] dictionaryWithObjects:v1096 forKeys:v1095 count:18];
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  v1728[12] = v180;
  v1727[13] = @"Resuming";
  v1057[0] = @"TargetBrainLoaded";
  uint64_t v1055 = v2;
  v1056 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1056 forKeys:&v1055 count:1];
  v559 = (void *)objc_claimAutoreleasedReturnValue();
  v1058[0] = v559;
  v1057[1] = @"TargetDownloadPreflighted";
  uint64_t v1053 = v2;
  v1054 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1054 forKeys:&v1053 count:1];
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  v1058[1] = v179;
  v1057[2] = @"TargetDownloaded";
  uint64_t v1051 = v2;
  v1052 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1052 forKeys:&v1051 count:1];
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  v1058[2] = v178;
  v1057[3] = @"TargetPrepared";
  uint64_t v1049 = v2;
  v1050 = @"UpdateTarget";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1050 forKeys:&v1049 count:1];
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  v1058[3] = v177;
  v1057[4] = @"TargetApplied";
  uint64_t v1047 = v2;
  v1048 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1048 forKeys:&v1047 count:1];
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  v1058[4] = v176;
  v1057[5] = @"TargetRollback";
  uint64_t v1045 = v2;
  v1046 = @"DecideCancelBeforeRollback";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1046 forKeys:&v1045 count:1];
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  v1058[5] = v175;
  v1057[6] = @"ResumeCurrentUpdate";
  uint64_t v1043 = v2;
  v1044 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1044 forKeys:&v1043 count:1];
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  v1058[6] = v174;
  v1057[7] = @"CancelCurrentUpdate";
  uint64_t v1041 = v3;
  v1042 = @"Canceling";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1042 forKeys:&v1041 count:1];
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  v1058[7] = v173;
  v1057[8] = @"ResumeSuccess";
  uint64_t v1039 = v2;
  v1040 = @"DecideApplyUpdate";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1040 forKeys:&v1039 count:1];
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  v1058[8] = v172;
  v1057[9] = @"ResumeFailed";
  v1037[0] = v3;
  v1037[1] = v2;
  v1038[0] = @"Prepared";
  v1038[1] = @"ReportApplyFailed";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1038 forKeys:v1037 count:2];
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  v1058[9] = v171;
  v1057[10] = @"ResumeSuccessAtTarget";
  v1035[0] = v3;
  v1035[1] = v2;
  v1036[0] = @"Prepared";
  v1036[1] = @"ReportPrepared";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1036 forKeys:v1035 count:2];
  v558 = (void *)objc_claimAutoreleasedReturnValue();
  v1058[10] = v558;
  v1057[11] = @"PerformApply";
  v1033[0] = v3;
  v1033[1] = v2;
  v1034[0] = @"Applying";
  v1034[1] = @"ApplyUpdate";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1034 forKeys:v1033 count:2];
  v557 = (void *)objc_claimAutoreleasedReturnValue();
  v1058[11] = v557;
  v1057[12] = @"ApplySuccess";
  v1031[0] = v3;
  v1031[1] = v2;
  v1032[0] = @"AwaitingReboot";
  v1032[1] = @"ReportApplied";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1032 forKeys:v1031 count:2];
  v555 = (void *)objc_claimAutoreleasedReturnValue();
  v1058[12] = v555;
  v1057[13] = @"RB_CancelNonRollbackUpdate";
  uint64_t v1029 = v3;
  v1030 = @"RB_Canceling";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1030 forKeys:&v1029 count:1];
  v553 = (void *)objc_claimAutoreleasedReturnValue();
  v1058[13] = v553;
  v1057[14] = @"RB_BeginRollback";
  v1027[0] = v3;
  v1027[1] = v2;
  v1028[0] = @"RB_ReadyToBegin";
  v1028[1] = @"LoadBrainRollback";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1028 forKeys:v1027 count:2];
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  v1058[14] = v170;
  v1057[15] = @"RB_PerformLoadBrain";
  v1025[0] = v3;
  v1025[1] = v2;
  v1026[0] = @"RB_LoadingBrain";
  v1026[1] = @"LoadBrain";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1026 forKeys:v1025 count:2];
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  v1058[15] = v169;
  v1057[16] = @"RB_PerformRollbackPrepare";
  v1023[0] = v3;
  v1023[1] = v2;
  v1024[0] = @"RB_RollingBackPrepare";
  v1024[1] = @"RollbackUpdatePrepare";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1024 forKeys:v1023 count:2];
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  v1058[16] = v168;
  v1057[17] = @"RB_PerformRollbackSuspend";
  v1021[0] = v3;
  v1021[1] = v2;
  v1022[0] = @"RB_RollingBackSuspend";
  v1022[1] = @"RollbackUpdateSuspend";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1022 forKeys:v1021 count:2];
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  v1058[17] = v167;
  v1057[18] = @"RB_PerformRollbackResume";
  v1019[0] = v3;
  v1019[1] = v2;
  v1020[0] = @"RB_RollingBackResume";
  v1020[1] = @"RollbackUpdateResume";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1020 forKeys:v1019 count:2];
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  v1058[18] = v165;
  v1057[19] = @"RB_PerformRollbackApply";
  v1017[0] = v3;
  v1017[1] = v2;
  v1018[0] = @"RB_RollingBackApply";
  v1018[1] = @"RollbackUpdateApply";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1018 forKeys:v1017 count:2];
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  v1058[19] = v164;
  v1057[20] = @"RB_RollbackAppleSuccess";
  v1015[0] = v3;
  v1015[1] = v2;
  v1016[0] = @"AwaitingReboot";
  v1016[1] = @"ReportRollbackSucceeded";
  [MEMORY[0x189603F68] dictionaryWithObjects:v1016 forKeys:v1015 count:2];
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  v1058[20] = v163;
  [MEMORY[0x189603F68] dictionaryWithObjects:v1058 forKeys:v1057 count:21];
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  v1728[13] = v162;
  v1727[14] = @"Applying";
  v1013[0] = @"TargetBrainLoaded";
  uint64_t v1011 = v2;
  v1012 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1012 forKeys:&v1011 count:1];
  v562 = (void *)objc_claimAutoreleasedReturnValue();
  v1014[0] = v562;
  v1013[1] = @"TargetDownloadPreflighted";
  uint64_t v1009 = v2;
  v1010 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1010 forKeys:&v1009 count:1];
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  v1014[1] = v161;
  v1013[2] = @"TargetDownloaded";
  uint64_t v1007 = v2;
  v1008 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1008 forKeys:&v1007 count:1];
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  v1014[2] = v160;
  v1013[3] = @"TargetPrepared";
  uint64_t v1005 = v2;
  v1006 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1006 forKeys:&v1005 count:1];
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  v1014[3] = v159;
  v1013[4] = @"TargetApplied";
  uint64_t v1003 = v2;
  v1004 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1004 forKeys:&v1003 count:1];
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  v1014[4] = v158;
  v1013[5] = @"TargetRollback";
  uint64_t v1001 = v2;
  v1002 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1002 forKeys:&v1001 count:1];
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  v1014[5] = v157;
  v1013[6] = @"ResumeCurrentUpdate";
  uint64_t v999 = v2;
  v1000 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v1000 forKeys:&v999 count:1];
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  v1014[6] = v156;
  v1013[7] = @"CancelCurrentUpdate";
  uint64_t v997 = v2;
  v998 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v998 forKeys:&v997 count:1];
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  v1014[7] = v155;
  v1013[8] = @"ApplyProgress";
  uint64_t v995 = v2;
  v996 = @"ReportApplyProgress";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v996 forKeys:&v995 count:1];
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  v1014[8] = v154;
  v1013[9] = @"ApplySuccess";
  v993[0] = v3;
  v993[1] = v2;
  v994[0] = @"AwaitingReboot";
  v994[1] = @"ReportApplied";
  [MEMORY[0x189603F68] dictionaryWithObjects:v994 forKeys:v993 count:2];
  v560 = (void *)objc_claimAutoreleasedReturnValue();
  v1014[9] = v560;
  v1013[10] = @"ApplyFailed";
  v991[0] = v3;
  v991[1] = v2;
  v992[0] = @"Prepared";
  v992[1] = @"ReportApplyFailed";
  [MEMORY[0x189603F68] dictionaryWithObjects:v992 forKeys:v991 count:2];
  v550 = (void *)objc_claimAutoreleasedReturnValue();
  v1014[10] = v550;
  [MEMORY[0x189603F68] dictionaryWithObjects:v1014 forKeys:v1013 count:11];
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  v1728[14] = v153;
  v1727[15] = @"AwaitingReboot";
  v989[0] = @"TargetBrainLoaded";
  uint64_t v987 = v2;
  v988 = @"ReportAnomalyAPIEnd";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v988 forKeys:&v987 count:1];
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  v990[0] = v152;
  v989[1] = @"TargetDownloadPreflighted";
  uint64_t v985 = v2;
  v986 = @"ReportAnomalyAPIEnd";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v986 forKeys:&v985 count:1];
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  v990[1] = v151;
  v989[2] = @"TargetDownloaded";
  uint64_t v983 = v2;
  v984 = @"ReportAnomalyAPIEnd";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v984 forKeys:&v983 count:1];
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  v990[2] = v150;
  v989[3] = @"TargetPrepared";
  uint64_t v981 = v2;
  v982 = @"ReportAnomalyAPIEnd";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v982 forKeys:&v981 count:1];
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  v990[3] = v149;
  v989[4] = @"TargetApplied";
  uint64_t v979 = v2;
  v980 = @"ReportAnomalyAPIEnd";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v980 forKeys:&v979 count:1];
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  v990[4] = v148;
  v989[5] = @"TargetRollback";
  uint64_t v977 = v2;
  v978 = @"ReportAnomalyAPIEnd";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v978 forKeys:&v977 count:1];
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  v990[5] = v147;
  v989[6] = @"ResumeCurrentUpdate";
  uint64_t v975 = v2;
  v976 = @"ReportAnomalyAPIEnd";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v976 forKeys:&v975 count:1];
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  v990[6] = v146;
  v989[7] = @"CancelCurrentUpdate";
  uint64_t v973 = v2;
  v974 = @"ReportAnomalyAPIEnd";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v974 forKeys:&v973 count:1];
  v531 = (void *)objc_claimAutoreleasedReturnValue();
  v990[7] = v531;
  [MEMORY[0x189603F68] dictionaryWithObjects:v990 forKeys:v989 count:8];
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  v1728[15] = v145;
  v1727[16] = @"RemovingSU";
  v971[0] = @"TargetBrainLoaded";
  uint64_t v969 = v2;
  v970 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v970 forKeys:&v969 count:1];
  v538 = (void *)objc_claimAutoreleasedReturnValue();
  v972[0] = v538;
  v971[1] = @"TargetDownloadPreflighted";
  uint64_t v967 = v2;
  v968 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v968 forKeys:&v967 count:1];
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  v972[1] = v144;
  v971[2] = @"TargetDownloaded";
  uint64_t v965 = v2;
  v966 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v966 forKeys:&v965 count:1];
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  v972[2] = v143;
  v971[3] = @"TargetPrepared";
  uint64_t v963 = v2;
  v964 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v964 forKeys:&v963 count:1];
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  v972[3] = v142;
  v971[4] = @"TargetApplied";
  uint64_t v961 = v2;
  uint64_t v962 = v535;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v962 forKeys:&v961 count:1];
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  v972[4] = v141;
  v971[5] = @"TargetRollback";
  uint64_t v959 = v3;
  v960 = @"RB_Canceling";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v960 forKeys:&v959 count:1];
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  v972[5] = v140;
  v971[6] = @"ResumeCurrentUpdate";
  uint64_t v957 = v2;
  v958 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v958 forKeys:&v957 count:1];
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  v972[6] = v139;
  v971[7] = @"CancelCurrentUpdate";
  uint64_t v955 = v3;
  v956 = @"Canceling";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v956 forKeys:&v955 count:1];
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  v972[7] = v138;
  v971[8] = @"SURemoved";
  uint64_t v953 = v2;
  v954 = @"ChooseErrorSpaceCheck";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v954 forKeys:&v953 count:1];
  v527 = (void *)objc_claimAutoreleasedReturnValue();
  v972[8] = v527;
  v971[9] = @"PerformErrorSpaceCheck";
  v951[0] = v3;
  v951[1] = v2;
  v952[0] = @"CheckingSpaceAfterError";
  v952[1] = @"CheckSpace";
  [MEMORY[0x189603F68] dictionaryWithObjects:v952 forKeys:v951 count:2];
  v534 = (void *)objc_claimAutoreleasedReturnValue();
  v972[9] = v534;
  v971[10] = @"SkipErrorSpaceCheck";
  v949[0] = v3;
  v949[1] = v2;
  v950[0] = @"ReadyToBegin";
  v950[1] = @"ReportAttemptFailure";
  [MEMORY[0x189603F68] dictionaryWithObjects:v950 forKeys:v949 count:2];
  v528 = (void *)objc_claimAutoreleasedReturnValue();
  v972[10] = v528;
  [MEMORY[0x189603F68] dictionaryWithObjects:v972 forKeys:v971 count:11];
  v526 = (void *)objc_claimAutoreleasedReturnValue();
  v1728[16] = v526;
  v1727[17] = @"CheckingSpaceAfterError";
  v947[0] = @"TargetBrainLoaded";
  uint64_t v945 = v2;
  uint64_t v946 = v535;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v946 forKeys:&v945 count:1];
  v529 = (void *)objc_claimAutoreleasedReturnValue();
  v948[0] = v529;
  v947[1] = @"TargetDownloadPreflighted";
  uint64_t v943 = v2;
  uint64_t v944 = v535;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v944 forKeys:&v943 count:1];
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  v948[1] = v137;
  v947[2] = @"TargetDownloaded";
  uint64_t v941 = v2;
  uint64_t v942 = v535;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v942 forKeys:&v941 count:1];
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  v948[2] = v136;
  v947[3] = @"TargetPrepared";
  uint64_t v939 = v2;
  uint64_t v940 = v535;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v940 forKeys:&v939 count:1];
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  v948[3] = v135;
  v947[4] = @"TargetApplied";
  uint64_t v937 = v2;
  uint64_t v938 = v535;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v938 forKeys:&v937 count:1];
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  v948[4] = v134;
  v947[5] = @"TargetRollback";
  uint64_t v935 = v2;
  v936 = @"DecideCancelBeforeRollback";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v936 forKeys:&v935 count:1];
  v547 = (void *)objc_claimAutoreleasedReturnValue();
  v948[5] = v547;
  v947[6] = @"ResumeCurrentUpdate";
  uint64_t v933 = v2;
  v934 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v934 forKeys:&v933 count:1];
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  v948[6] = v133;
  v947[7] = @"CancelCurrentUpdate";
  uint64_t v931 = v3;
  v932 = @"Canceling";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v932 forKeys:&v931 count:1];
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  v948[7] = v132;
  v947[8] = @"SpaceCheckHaveSpace";
  v929[0] = v3;
  v929[1] = v2;
  v930[0] = @"ReadyToBegin";
  v930[1] = @"ReportAttemptFailure";
  [MEMORY[0x189603F68] dictionaryWithObjects:v930 forKeys:v929 count:2];
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  v948[8] = v131;
  v947[9] = @"SpaceCheckNoSpace";
  v927[0] = v3;
  v927[1] = v2;
  v928[0] = @"ReadyToBegin";
  v928[1] = @"ReportAttemptFailure";
  [MEMORY[0x189603F68] dictionaryWithObjects:v928 forKeys:v927 count:2];
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  v948[9] = v130;
  v947[10] = @"SpaceCheckFailed";
  v925[0] = v3;
  v925[1] = v2;
  v926[0] = @"ReadyToBegin";
  v926[1] = @"ReportAttemptFailure";
  [MEMORY[0x189603F68] dictionaryWithObjects:v926 forKeys:v925 count:2];
  v533 = (void *)objc_claimAutoreleasedReturnValue();
  v948[10] = v533;
  v947[11] = @"RB_CancelNonRollbackUpdate";
  uint64_t v923 = v3;
  v924 = @"RB_Canceling";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v924 forKeys:&v923 count:1];
  v549 = (void *)objc_claimAutoreleasedReturnValue();
  v948[11] = v549;
  v947[12] = @"RB_BeginRollback";
  v921[0] = v3;
  v921[1] = v2;
  v922[0] = @"RB_ReadyToBegin";
  v922[1] = @"LoadBrainRollback";
  [MEMORY[0x189603F68] dictionaryWithObjects:v922 forKeys:v921 count:2];
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  v948[12] = v129;
  v947[13] = @"RB_PerformLoadBrain";
  v919[0] = v3;
  v919[1] = v2;
  v920[0] = @"RB_LoadingBrain";
  v920[1] = @"LoadBrain";
  [MEMORY[0x189603F68] dictionaryWithObjects:v920 forKeys:v919 count:2];
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  v948[13] = v128;
  v947[14] = @"RB_PerformRollbackPrepare";
  v917[0] = v3;
  v917[1] = v2;
  v918[0] = @"RB_RollingBackPrepare";
  v918[1] = @"RollbackUpdatePrepare";
  [MEMORY[0x189603F68] dictionaryWithObjects:v918 forKeys:v917 count:2];
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v948[14] = v127;
  v947[15] = @"RB_PerformRollbackSuspend";
  v915[0] = v3;
  v915[1] = v2;
  v916[0] = @"RB_RollingBackSuspend";
  v916[1] = @"RollbackUpdateSuspend";
  [MEMORY[0x189603F68] dictionaryWithObjects:v916 forKeys:v915 count:2];
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  v948[15] = v126;
  v947[16] = @"RB_PerformRollbackResume";
  v913[0] = v3;
  v913[1] = v2;
  v914[0] = @"RB_RollingBackResume";
  v914[1] = @"RollbackUpdateResume";
  [MEMORY[0x189603F68] dictionaryWithObjects:v914 forKeys:v913 count:2];
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  v948[16] = v125;
  v947[17] = @"RB_PerformRollbackApply";
  v911[0] = v3;
  v911[1] = v2;
  v912[0] = @"RB_RollingBackApply";
  v912[1] = @"RollbackUpdateApply";
  [MEMORY[0x189603F68] dictionaryWithObjects:v912 forKeys:v911 count:2];
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v948[17] = v124;
  v947[18] = @"RB_RollbackAppleSuccess";
  v909[0] = v3;
  v909[1] = v2;
  v910[0] = @"AwaitingReboot";
  v910[1] = @"ReportRollbackSucceeded";
  [MEMORY[0x189603F68] dictionaryWithObjects:v910 forKeys:v909 count:2];
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v948[18] = v123;
  [MEMORY[0x189603F68] dictionaryWithObjects:v948 forKeys:v947 count:19];
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  v1728[17] = v122;
  v1727[18] = @"Canceling";
  v907[0] = @"TargetBrainLoaded";
  uint64_t v905 = v2;
  v906 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v906 forKeys:&v905 count:1];
  v554 = (void *)objc_claimAutoreleasedReturnValue();
  v908[0] = v554;
  v907[1] = @"TargetDownloadPreflighted";
  uint64_t v903 = v2;
  v904 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v904 forKeys:&v903 count:1];
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v908[1] = v121;
  v907[2] = @"TargetDownloaded";
  uint64_t v901 = v2;
  v902 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v902 forKeys:&v901 count:1];
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v908[2] = v120;
  v907[3] = @"TargetPrepared";
  uint64_t v899 = v2;
  v900 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v900 forKeys:&v899 count:1];
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v908[3] = v119;
  v907[4] = @"TargetApplied";
  uint64_t v897 = v2;
  v898 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v898 forKeys:&v897 count:1];
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v908[4] = v118;
  v907[5] = @"TargetRollback";
  uint64_t v895 = v3;
  v896 = @"RB_Canceling";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v896 forKeys:&v895 count:1];
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v908[5] = v117;
  v907[6] = @"ResumeCurrentUpdate";
  uint64_t v893 = v2;
  v894 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v894 forKeys:&v893 count:1];
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v908[6] = v116;
  v907[7] = @"CancelCurrentUpdate";
  uint64_t v891 = v2;
  v892 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v892 forKeys:&v891 count:1];
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v908[7] = v115;
  v907[8] = @"BrainLoadProgress";
  uint64_t v889 = v2;
  uint64_t v890 = v535;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v890 forKeys:&v889 count:1];
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v908[8] = v114;
  v907[9] = @"BrainLoadSuccess";
  v887[0] = v3;
  v887[1] = v2;
  v888[0] = @"ReadyToBegin";
  v888[1] = @"ReportCanceled";
  [MEMORY[0x189603F68] dictionaryWithObjects:v888 forKeys:v887 count:2];
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v908[9] = v113;
  v907[10] = @"BrainLoadFailed";
  v885[0] = v3;
  v885[1] = v2;
  v886[0] = @"ReadyToBegin";
  v886[1] = @"ReportCanceled";
  [MEMORY[0x189603F68] dictionaryWithObjects:v886 forKeys:v885 count:2];
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v908[10] = v112;
  v907[11] = @"PreflightSuccess";
  v883[0] = v3;
  v883[1] = v2;
  v884[0] = @"ReadyToBegin";
  v884[1] = @"ReportCanceled";
  [MEMORY[0x189603F68] dictionaryWithObjects:v884 forKeys:v883 count:2];
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v908[11] = v111;
  v907[12] = @"PreflightFailed";
  v881[0] = v3;
  v881[1] = v2;
  v882[0] = @"ReadyToBegin";
  v882[1] = @"ReportCanceled";
  [MEMORY[0x189603F68] dictionaryWithObjects:v882 forKeys:v881 count:2];
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v908[12] = v110;
  v907[13] = @"PrepareProgress";
  uint64_t v879 = v2;
  uint64_t v880 = v535;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v880 forKeys:&v879 count:1];
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v908[13] = v109;
  v907[14] = @"PrepareSuccess";
  uint64_t v877 = v2;
  v878 = @"RemovePrepared";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v878 forKeys:&v877 count:1];
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v908[14] = v108;
  v907[15] = @"PrepareFailed";
  uint64_t v875 = v2;
  v876 = @"RemoveSU";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v876 forKeys:&v875 count:1];
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v908[15] = v107;
  v907[16] = @"SuspendSuccess";
  uint64_t v873 = v2;
  v874 = @"RemovePrepared";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v874 forKeys:&v873 count:1];
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v908[16] = v106;
  v907[17] = @"SuspendFailed";
  uint64_t v871 = v2;
  v872 = @"RemovePrepared";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v872 forKeys:&v871 count:1];
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v908[17] = v105;
  v907[18] = @"ResumeSuccess";
  uint64_t v869 = v2;
  v870 = @"RemovePrepared";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v870 forKeys:&v869 count:1];
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v908[18] = v104;
  v907[19] = @"ResumeFailed";
  uint64_t v867 = v2;
  v868 = @"RemovePrepared";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v868 forKeys:&v867 count:1];
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v908[19] = v103;
  v907[20] = @"PrepareRemoved";
  uint64_t v865 = v2;
  v866 = @"RemoveSU";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v866 forKeys:&v865 count:1];
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v908[20] = v102;
  v907[21] = @"DownloadProgress";
  uint64_t v863 = v2;
  uint64_t v864 = v535;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v864 forKeys:&v863 count:1];
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v908[21] = v101;
  v907[22] = @"DownloadStalled";
  uint64_t v861 = v2;
  uint64_t v862 = v535;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v862 forKeys:&v861 count:1];
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v908[22] = v100;
  v907[23] = @"DownloadSuccess";
  uint64_t v859 = v2;
  uint64_t v860 = v535;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v860 forKeys:&v859 count:1];
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v908[23] = v99;
  v907[24] = @"DownloadFailed";
  uint64_t v857 = v2;
  uint64_t v858 = v535;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v858 forKeys:&v857 count:1];
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v908[24] = v98;
  v907[25] = @"SURemoved";
  v855[0] = v3;
  v855[1] = v2;
  v856[0] = @"ReadyToBegin";
  v856[1] = @"ReportCanceled";
  [MEMORY[0x189603F68] dictionaryWithObjects:v856 forKeys:v855 count:2];
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v908[25] = v97;
  v907[26] = @"SpaceCheckHaveSpace";
  v853[0] = v3;
  v853[1] = v2;
  v854[0] = @"ReadyToBegin";
  v854[1] = @"ReportCanceled";
  [MEMORY[0x189603F68] dictionaryWithObjects:v854 forKeys:v853 count:2];
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v908[26] = v96;
  v907[27] = @"SpaceCheckNoSpace";
  v851[0] = v3;
  v851[1] = v2;
  v852[0] = @"ReadyToBegin";
  v852[1] = @"ReportCanceled";
  [MEMORY[0x189603F68] dictionaryWithObjects:v852 forKeys:v851 count:2];
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v908[27] = v95;
  v907[28] = @"SpaceCheckFailed";
  v849[0] = v3;
  v849[1] = v2;
  v850[0] = @"ReadyToBegin";
  v850[1] = @"ReportCanceled";
  [MEMORY[0x189603F68] dictionaryWithObjects:v850 forKeys:v849 count:2];
  v521 = (void *)objc_claimAutoreleasedReturnValue();
  v908[28] = v521;
  [MEMORY[0x189603F68] dictionaryWithObjects:v908 forKeys:v907 count:29];
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v1728[18] = v94;
  v1727[19] = @"RB_Canceling";
  v847[0] = @"TargetBrainLoaded";
  uint64_t v845 = v2;
  v846 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v846 forKeys:&v845 count:1];
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v848[0] = v93;
  v847[1] = @"TargetDownloadPreflighted";
  uint64_t v843 = v2;
  v844 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v844 forKeys:&v843 count:1];
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v848[1] = v92;
  v847[2] = @"TargetDownloaded";
  uint64_t v841 = v2;
  v842 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v842 forKeys:&v841 count:1];
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v848[2] = v91;
  v847[3] = @"TargetPrepared";
  uint64_t v839 = v2;
  v840 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v840 forKeys:&v839 count:1];
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v848[3] = v90;
  v847[4] = @"TargetApplied";
  uint64_t v837 = v2;
  v838 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v838 forKeys:&v837 count:1];
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v848[4] = v89;
  v847[5] = @"TargetRollback";
  uint64_t v835 = v2;
  v836 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v836 forKeys:&v835 count:1];
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v848[5] = v88;
  v847[6] = @"ResumeCurrentUpdate";
  uint64_t v833 = v2;
  v834 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v834 forKeys:&v833 count:1];
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v848[6] = v87;
  v847[7] = @"CancelCurrentUpdate";
  uint64_t v831 = v2;
  v832 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v832 forKeys:&v831 count:1];
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v848[7] = v86;
  v847[8] = @"BrainLoadProgress";
  uint64_t v829 = v2;
  uint64_t v830 = v535;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v830 forKeys:&v829 count:1];
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v848[8] = v85;
  v847[9] = @"BrainLoadSuccess";
  v827[0] = v3;
  v827[1] = v2;
  v828[0] = @"RB_ReadyToBegin";
  v828[1] = @"LoadBrainRollback";
  [MEMORY[0x189603F68] dictionaryWithObjects:v828 forKeys:v827 count:2];
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v848[9] = v84;
  v847[10] = @"BrainLoadFailed";
  v825[0] = v3;
  v825[1] = v2;
  v826[0] = @"RB_ReadyToBegin";
  v826[1] = @"LoadBrainRollback";
  [MEMORY[0x189603F68] dictionaryWithObjects:v826 forKeys:v825 count:2];
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v848[10] = v83;
  v847[11] = @"PreflightSuccess";
  v823[0] = v3;
  v823[1] = v2;
  v824[0] = @"RB_ReadyToBegin";
  v824[1] = @"LoadBrainRollback";
  [MEMORY[0x189603F68] dictionaryWithObjects:v824 forKeys:v823 count:2];
  v514 = (void *)objc_claimAutoreleasedReturnValue();
  v848[11] = v514;
  v847[12] = @"PreflightFailed";
  v821[0] = v3;
  v821[1] = v2;
  v822[0] = @"RB_ReadyToBegin";
  v822[1] = @"LoadBrainRollback";
  [MEMORY[0x189603F68] dictionaryWithObjects:v822 forKeys:v821 count:2];
  v515 = (void *)objc_claimAutoreleasedReturnValue();
  v848[12] = v515;
  v847[13] = @"PrepareProgress";
  uint64_t v819 = v2;
  uint64_t v820 = v535;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v820 forKeys:&v819 count:1];
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v848[13] = v82;
  v847[14] = @"PrepareSuccess";
  uint64_t v817 = v2;
  v818 = @"RemovePrepared";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v818 forKeys:&v817 count:1];
  v540 = (void *)objc_claimAutoreleasedReturnValue();
  v848[14] = v540;
  v847[15] = @"PrepareFailed";
  uint64_t v815 = v2;
  v816 = @"RemoveSU";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v816 forKeys:&v815 count:1];
  v539 = (void *)objc_claimAutoreleasedReturnValue();
  v848[15] = v539;
  v847[16] = @"SuspendSuccess";
  uint64_t v813 = v2;
  v814 = @"RemovePrepared";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v814 forKeys:&v813 count:1];
  v545 = (void *)objc_claimAutoreleasedReturnValue();
  v848[16] = v545;
  v847[17] = @"SuspendFailed";
  uint64_t v811 = v2;
  v812 = @"RemovePrepared";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v812 forKeys:&v811 count:1];
  v544 = (void *)objc_claimAutoreleasedReturnValue();
  v848[17] = v544;
  v847[18] = @"ResumeSuccess";
  uint64_t v809 = v2;
  v810 = @"RemovePrepared";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v810 forKeys:&v809 count:1];
  v556 = (void *)objc_claimAutoreleasedReturnValue();
  v848[18] = v556;
  v847[19] = @"ResumeFailed";
  uint64_t v807 = v2;
  v808 = @"RemovePrepared";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v808 forKeys:&v807 count:1];
  v548 = (void *)objc_claimAutoreleasedReturnValue();
  v848[19] = v548;
  v847[20] = @"PrepareRemoved";
  uint64_t v805 = v2;
  v806 = @"RemoveSU";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v806 forKeys:&v805 count:1];
  v543 = (void *)objc_claimAutoreleasedReturnValue();
  v848[20] = v543;
  v847[21] = @"DownloadProgress";
  uint64_t v803 = v2;
  uint64_t v804 = v535;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v804 forKeys:&v803 count:1];
  v532 = (void *)objc_claimAutoreleasedReturnValue();
  v848[21] = v532;
  v847[22] = @"DownloadStalled";
  uint64_t v801 = v2;
  uint64_t v802 = v535;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v802 forKeys:&v801 count:1];
  v530 = (void *)objc_claimAutoreleasedReturnValue();
  v848[22] = v530;
  v847[23] = @"DownloadSuccess";
  uint64_t v799 = v2;
  uint64_t v800 = v535;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v800 forKeys:&v799 count:1];
  v519 = (void *)objc_claimAutoreleasedReturnValue();
  v848[23] = v519;
  v847[24] = @"DownloadFailed";
  uint64_t v797 = v2;
  uint64_t v798 = v535;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v798 forKeys:&v797 count:1];
  v536 = (void *)objc_claimAutoreleasedReturnValue();
  v848[24] = v536;
  v847[25] = @"SpaceCheckHaveSpace";
  uint64_t v795 = v2;
  v796 = @"DecideBeginRollback";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v796 forKeys:&v795 count:1];
  v518 = (void *)objc_claimAutoreleasedReturnValue();
  v848[25] = v518;
  v847[26] = @"SpaceCheckNoSpace";
  uint64_t v793 = v2;
  v794 = @"DecideBeginRollback";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v794 forKeys:&v793 count:1];
  v520 = (void *)objc_claimAutoreleasedReturnValue();
  v848[26] = v520;
  v847[27] = @"SpaceCheckFailed";
  uint64_t v791 = v2;
  v792 = @"DecideBeginRollback";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v792 forKeys:&v791 count:1];
  v525 = (void *)objc_claimAutoreleasedReturnValue();
  v848[27] = v525;
  v847[28] = @"SURemoved";
  uint64_t v789 = v2;
  v790 = @"DecideBeginRollback";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v790 forKeys:&v789 count:1];
  v564 = (void *)objc_claimAutoreleasedReturnValue();
  v848[28] = v564;
  v847[29] = @"RB_BeginRollback";
  v787[0] = v3;
  v787[1] = v2;
  v788[0] = @"RB_ReadyToBegin";
  v788[1] = @"LoadBrainRollback";
  [MEMORY[0x189603F68] dictionaryWithObjects:v788 forKeys:v787 count:2];
  v551 = (void *)objc_claimAutoreleasedReturnValue();
  v848[29] = v551;
  v847[30] = @"RB_PerformLoadBrain";
  v785[0] = v3;
  v785[1] = v2;
  v786[0] = @"RB_LoadingBrain";
  v786[1] = @"LoadBrain";
  [MEMORY[0x189603F68] dictionaryWithObjects:v786 forKeys:v785 count:2];
  v517 = (void *)objc_claimAutoreleasedReturnValue();
  v848[30] = v517;
  v847[31] = @"RB_PerformRollbackPrepare";
  v783[0] = v3;
  v783[1] = v2;
  v784[0] = @"RB_RollingBackPrepare";
  v784[1] = @"RollbackUpdatePrepare";
  [MEMORY[0x189603F68] dictionaryWithObjects:v784 forKeys:v783 count:2];
  v516 = (void *)objc_claimAutoreleasedReturnValue();
  v848[31] = v516;
  v847[32] = @"RB_PerformRollbackSuspend";
  v781[0] = v3;
  v781[1] = v2;
  v782[0] = @"RB_RollingBackSuspend";
  v782[1] = @"RollbackUpdateSuspend";
  [MEMORY[0x189603F68] dictionaryWithObjects:v782 forKeys:v781 count:2];
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v848[32] = v81;
  v847[33] = @"RB_PerformRollbackResume";
  v779[0] = v3;
  v779[1] = v2;
  v780[0] = @"RB_RollingBackResume";
  v780[1] = @"RollbackUpdateResume";
  [MEMORY[0x189603F68] dictionaryWithObjects:v780 forKeys:v779 count:2];
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v848[33] = v80;
  v847[34] = @"RB_PerformRollbackApply";
  v777[0] = v3;
  v777[1] = v2;
  v778[0] = @"RB_RollingBackApply";
  v778[1] = @"RollbackUpdateApply";
  [MEMORY[0x189603F68] dictionaryWithObjects:v778 forKeys:v777 count:2];
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v848[34] = v79;
  v847[35] = @"RB_RollbackAppleSuccess";
  v775[0] = v3;
  v775[1] = v2;
  v776[0] = @"AwaitingReboot";
  v776[1] = @"ReportRollbackSucceeded";
  [MEMORY[0x189603F68] dictionaryWithObjects:v776 forKeys:v775 count:2];
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v848[35] = v78;
  [MEMORY[0x189603F68] dictionaryWithObjects:v848 forKeys:v847 count:36];
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v1728[19] = v77;
  v1727[20] = @"RB_ReadyToBegin";
  v773[0] = @"TargetBrainLoaded";
  uint64_t v771 = v2;
  v772 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v772 forKeys:&v771 count:1];
  v561 = (void *)objc_claimAutoreleasedReturnValue();
  v774[0] = v561;
  v773[1] = @"TargetDownloadPreflighted";
  uint64_t v769 = v2;
  v770 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v770 forKeys:&v769 count:1];
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v774[1] = v76;
  v773[2] = @"TargetDownloaded";
  uint64_t v767 = v2;
  v768 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v768 forKeys:&v767 count:1];
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v774[2] = v75;
  v773[3] = @"TargetPrepared";
  uint64_t v765 = v2;
  v766 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v766 forKeys:&v765 count:1];
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v774[3] = v74;
  v773[4] = @"TargetApplied";
  uint64_t v763 = v2;
  v764 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v764 forKeys:&v763 count:1];
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v774[4] = v73;
  v773[5] = @"TargetRollback";
  uint64_t v761 = v2;
  v762 = @"LoadBrainRollback";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v762 forKeys:&v761 count:1];
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v774[5] = v72;
  v773[6] = @"ResumeCurrentUpdate";
  uint64_t v759 = v2;
  v760 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v760 forKeys:&v759 count:1];
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v774[6] = v71;
  v773[7] = @"CancelCurrentUpdate";
  uint64_t v757 = v2;
  v758 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v758 forKeys:&v757 count:1];
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v774[7] = v70;
  v773[8] = @"RB_PerformLoadBrain";
  v755[0] = v3;
  v755[1] = v2;
  v756[0] = @"RB_LoadingBrain";
  v756[1] = @"LoadBrain";
  [MEMORY[0x189603F68] dictionaryWithObjects:v756 forKeys:v755 count:2];
  v563 = (void *)objc_claimAutoreleasedReturnValue();
  v774[8] = v563;
  v773[9] = @"RB_PerformRollbackPrepare";
  v753[0] = v3;
  v753[1] = v2;
  v754[0] = @"RB_RollingBackPrepare";
  v754[1] = @"RollbackUpdatePrepare";
  [MEMORY[0x189603F68] dictionaryWithObjects:v754 forKeys:v753 count:2];
  v552 = (void *)objc_claimAutoreleasedReturnValue();
  v774[9] = v552;
  v773[10] = @"RB_PerformRollbackSuspend";
  v751[0] = v3;
  v751[1] = v2;
  v752[0] = @"RB_RollingBackSuspend";
  v752[1] = @"RollbackUpdateSuspend";
  [MEMORY[0x189603F68] dictionaryWithObjects:v752 forKeys:v751 count:2];
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v774[10] = v69;
  v773[11] = @"RB_PerformRollbackResume";
  v749[0] = v3;
  v749[1] = v2;
  v750[0] = @"RB_RollingBackResume";
  v750[1] = @"RollbackUpdateResume";
  [MEMORY[0x189603F68] dictionaryWithObjects:v750 forKeys:v749 count:2];
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v774[11] = v68;
  v773[12] = @"RB_PerformRollbackApply";
  v747[0] = v3;
  v747[1] = v2;
  v748[0] = @"RB_RollingBackApply";
  v748[1] = @"RollbackUpdateApply";
  [MEMORY[0x189603F68] dictionaryWithObjects:v748 forKeys:v747 count:2];
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v774[12] = v67;
  v773[13] = @"RB_RollbackAppleSuccess";
  v745[0] = v3;
  v745[1] = v2;
  v746[0] = @"AwaitingReboot";
  v746[1] = @"ReportRollbackSucceeded";
  [MEMORY[0x189603F68] dictionaryWithObjects:v746 forKeys:v745 count:2];
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v774[13] = v66;
  [MEMORY[0x189603F68] dictionaryWithObjects:v774 forKeys:v773 count:14];
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v1728[20] = v65;
  v1727[21] = @"RB_LoadingBrain";
  v743[0] = @"TargetBrainLoaded";
  uint64_t v741 = v2;
  v742 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v742 forKeys:&v741 count:1];
  v546 = (void *)objc_claimAutoreleasedReturnValue();
  v744[0] = v546;
  v743[1] = @"TargetDownloadPreflighted";
  uint64_t v739 = v2;
  v740 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v740 forKeys:&v739 count:1];
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v744[1] = v64;
  v743[2] = @"TargetDownloaded";
  uint64_t v737 = v2;
  v738 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v738 forKeys:&v737 count:1];
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v744[2] = v63;
  v743[3] = @"TargetPrepared";
  uint64_t v735 = v2;
  v736 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v736 forKeys:&v735 count:1];
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v744[3] = v62;
  v743[4] = @"TargetApplied";
  uint64_t v733 = v2;
  v734 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v734 forKeys:&v733 count:1];
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v744[4] = v61;
  v743[5] = @"TargetRollback";
  uint64_t v731 = v2;
  v732 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v732 forKeys:&v731 count:1];
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v744[5] = v60;
  v743[6] = @"ResumeCurrentUpdate";
  uint64_t v729 = v2;
  v730 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v730 forKeys:&v729 count:1];
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v744[6] = v59;
  v743[7] = @"CancelCurrentUpdate";
  uint64_t v727 = v3;
  v728 = @"RB_Canceling";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v728 forKeys:&v727 count:1];
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v744[7] = v58;
  v743[8] = @"BrainLoadProgress";
  uint64_t v725 = v2;
  v726 = @"ReportBrainLoadProgress";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v726 forKeys:&v725 count:1];
  v524 = (void *)objc_claimAutoreleasedReturnValue();
  v744[8] = v524;
  v743[9] = @"BrainLoadSuccess";
  v723[0] = v3;
  v723[1] = v2;
  v724[0] = @"RB_BrainLoaded";
  v724[1] = @"DecideRollbackUpdate";
  [MEMORY[0x189603F68] dictionaryWithObjects:v724 forKeys:v723 count:2];
  v523 = (void *)objc_claimAutoreleasedReturnValue();
  v744[9] = v523;
  v743[10] = @"BrainLoadFailed";
  v721[0] = v3;
  v721[1] = v2;
  v722[0] = @"ReadyToBegin";
  v722[1] = @"ReportRollbackFailed";
  [MEMORY[0x189603F68] dictionaryWithObjects:v722 forKeys:v721 count:2];
  v522 = (void *)objc_claimAutoreleasedReturnValue();
  v744[10] = v522;
  [MEMORY[0x189603F68] dictionaryWithObjects:v744 forKeys:v743 count:11];
  v314 = (void *)objc_claimAutoreleasedReturnValue();
  v1728[21] = v314;
  v1727[22] = @"RB_BrainLoaded";
  v719[0] = @"TargetBrainLoaded";
  uint64_t v717 = v2;
  v718 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v718 forKeys:&v717 count:1];
  v295 = (void *)objc_claimAutoreleasedReturnValue();
  v720[0] = v295;
  v719[1] = @"TargetDownloadPreflighted";
  uint64_t v715 = v2;
  v716 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v716 forKeys:&v715 count:1];
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v720[1] = v57;
  v719[2] = @"TargetDownloaded";
  uint64_t v713 = v2;
  v714 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v714 forKeys:&v713 count:1];
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v720[2] = v56;
  v719[3] = @"TargetPrepared";
  uint64_t v711 = v2;
  v712 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v712 forKeys:&v711 count:1];
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v720[3] = v55;
  v719[4] = @"TargetApplied";
  uint64_t v709 = v2;
  v710 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v710 forKeys:&v709 count:1];
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v720[4] = v54;
  v719[5] = @"TargetRollback";
  uint64_t v707 = v2;
  v708 = @"UpdateTarget";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v708 forKeys:&v707 count:1];
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v720[5] = v53;
  v719[6] = @"ResumeCurrentUpdate";
  uint64_t v705 = v2;
  v706 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v706 forKeys:&v705 count:1];
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v720[6] = v52;
  v719[7] = @"CancelCurrentUpdate";
  v703[0] = v3;
  v703[1] = v2;
  v704[0] = @"RB_Canceling";
  v704[1] = @"RemoveSU";
  [MEMORY[0x189603F68] dictionaryWithObjects:v704 forKeys:v703 count:2];
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v720[7] = v51;
  v719[8] = @"RB_PerformRollbackPrepare";
  v701[0] = v3;
  v701[1] = v2;
  v702[0] = @"RB_RollingBackPrepare";
  v702[1] = @"RollbackUpdatePrepare";
  [MEMORY[0x189603F68] dictionaryWithObjects:v702 forKeys:v701 count:2];
  v566 = (void *)objc_claimAutoreleasedReturnValue();
  v720[8] = v566;
  v719[9] = @"RB_PerformRollbackSuspend";
  v699[0] = v3;
  v699[1] = v2;
  v700[0] = @"RB_RollingBackSuspend";
  v700[1] = @"RollbackUpdateSuspend";
  [MEMORY[0x189603F68] dictionaryWithObjects:v700 forKeys:v699 count:2];
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v720[9] = v50;
  v719[10] = @"RB_PerformRollbackResume";
  v697[0] = v3;
  v697[1] = v2;
  v698[0] = @"RB_RollingBackResume";
  v698[1] = @"RollbackUpdateResume";
  [MEMORY[0x189603F68] dictionaryWithObjects:v698 forKeys:v697 count:2];
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v720[10] = v49;
  v719[11] = @"RB_PerformRollbackApply";
  v695[0] = v3;
  v695[1] = v2;
  v696[0] = @"RB_RollingBackApply";
  v696[1] = @"RollbackUpdateApply";
  [MEMORY[0x189603F68] dictionaryWithObjects:v696 forKeys:v695 count:2];
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v720[11] = v48;
  v719[12] = @"RB_RollbackAppleSuccess";
  v693[0] = v3;
  v693[1] = v2;
  v694[0] = @"AwaitingReboot";
  v694[1] = @"ReportRollbackSucceeded";
  [MEMORY[0x189603F68] dictionaryWithObjects:v694 forKeys:v693 count:2];
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v720[12] = v47;
  v719[13] = @"RB_RollbackFailed";
  v691[0] = v3;
  v691[1] = v2;
  v692[0] = @"ReadyToBegin";
  v692[1] = @"ReportRollbackFailed";
  [MEMORY[0x189603F68] dictionaryWithObjects:v692 forKeys:v691 count:2];
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v720[13] = v46;
  [MEMORY[0x189603F68] dictionaryWithObjects:v720 forKeys:v719 count:14];
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v1728[22] = v45;
  v1727[23] = @"RB_RollingBackPrepare";
  v689[0] = @"TargetBrainLoaded";
  uint64_t v687 = v2;
  v688 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v688 forKeys:&v687 count:1];
  v567 = (void *)objc_claimAutoreleasedReturnValue();
  v690[0] = v567;
  v689[1] = @"TargetDownloadPreflighted";
  uint64_t v685 = v2;
  v686 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v686 forKeys:&v685 count:1];
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v690[1] = v44;
  v689[2] = @"TargetDownloaded";
  uint64_t v683 = v2;
  v684 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v684 forKeys:&v683 count:1];
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v690[2] = v43;
  v689[3] = @"TargetPrepared";
  uint64_t v681 = v2;
  v682 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v682 forKeys:&v681 count:1];
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v690[3] = v42;
  v689[4] = @"TargetApplied";
  uint64_t v679 = v2;
  v680 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v680 forKeys:&v679 count:1];
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v690[4] = v41;
  v689[5] = @"TargetRollback";
  uint64_t v677 = v2;
  v678 = @"UpdateTarget";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v678 forKeys:&v677 count:1];
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v690[5] = v40;
  v689[6] = @"ResumeCurrentUpdate";
  uint64_t v675 = v2;
  v676 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v676 forKeys:&v675 count:1];
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v690[6] = v39;
  v689[7] = @"CancelCurrentUpdate";
  v673[0] = v3;
  v673[1] = v2;
  v674[0] = @"RB_Canceling";
  v674[1] = @"RemoveSU";
  [MEMORY[0x189603F68] dictionaryWithObjects:v674 forKeys:v673 count:2];
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v690[7] = v38;
  v689[8] = @"PrepareProgress";
  uint64_t v671 = v2;
  v672 = @"ReportPrepareProgress";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v672 forKeys:&v671 count:1];
  v541 = (void *)objc_claimAutoreleasedReturnValue();
  v690[8] = v541;
  v689[9] = @"RB_RollbackPrepareSuccess";
  uint64_t v669 = v2;
  v670 = @"RollbackUpdateDecideSuspend";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v670 forKeys:&v669 count:1];
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  v690[9] = v166;
  v689[10] = @"RB_PerformRollbackSuspend";
  v667[0] = v3;
  v667[1] = v2;
  v668[0] = @"RB_RollingBackSuspend";
  v668[1] = @"RollbackUpdateSuspend";
  [MEMORY[0x189603F68] dictionaryWithObjects:v668 forKeys:v667 count:2];
  v570 = (void *)objc_claimAutoreleasedReturnValue();
  v690[10] = v570;
  v689[11] = @"RB_PerformRollbackResume";
  v665[0] = v3;
  v665[1] = v2;
  v666[0] = @"RB_RollingBackResume";
  v666[1] = @"RollbackUpdateResume";
  [MEMORY[0x189603F68] dictionaryWithObjects:v666 forKeys:v665 count:2];
  v569 = (void *)objc_claimAutoreleasedReturnValue();
  v690[11] = v569;
  v689[12] = @"RB_PerformRollbackApply";
  v663[0] = v3;
  v663[1] = v2;
  v664[0] = @"RB_RollingBackApply";
  v664[1] = @"RollbackUpdateApply";
  [MEMORY[0x189603F68] dictionaryWithObjects:v664 forKeys:v663 count:2];
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v690[12] = v37;
  v689[13] = @"RB_RollbackAppleSuccess";
  v661[0] = v3;
  v661[1] = v2;
  v662[0] = @"AwaitingReboot";
  v662[1] = @"ReportRollbackSucceeded";
  [MEMORY[0x189603F68] dictionaryWithObjects:v662 forKeys:v661 count:2];
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v690[13] = v36;
  v689[14] = @"RB_RollbackFailed";
  v659[0] = v3;
  v659[1] = v2;
  v660[0] = @"ReadyToBegin";
  v660[1] = @"ReportRollbackFailed";
  [MEMORY[0x189603F68] dictionaryWithObjects:v660 forKeys:v659 count:2];
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v690[14] = v35;
  [MEMORY[0x189603F68] dictionaryWithObjects:v690 forKeys:v689 count:15];
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v1728[23] = v34;
  v1727[24] = @"RB_RollingBackSuspend";
  v657[0] = @"TargetBrainLoaded";
  uint64_t v655 = v2;
  v656 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v656 forKeys:&v655 count:1];
  v565 = (void *)objc_claimAutoreleasedReturnValue();
  v658[0] = v565;
  v657[1] = @"TargetDownloadPreflighted";
  uint64_t v653 = v2;
  v654 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v654 forKeys:&v653 count:1];
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v658[1] = v33;
  v657[2] = @"TargetDownloaded";
  uint64_t v651 = v2;
  v652 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v652 forKeys:&v651 count:1];
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v658[2] = v32;
  v657[3] = @"TargetPrepared";
  uint64_t v649 = v2;
  v650 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v650 forKeys:&v649 count:1];
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v658[3] = v31;
  v657[4] = @"TargetApplied";
  uint64_t v647 = v2;
  v648 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v648 forKeys:&v647 count:1];
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v658[4] = v30;
  v657[5] = @"TargetRollback";
  uint64_t v645 = v2;
  v646 = @"UpdateTarget";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v646 forKeys:&v645 count:1];
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v658[5] = v29;
  v657[6] = @"ResumeCurrentUpdate";
  uint64_t v643 = v2;
  v644 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v644 forKeys:&v643 count:1];
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v658[6] = v28;
  v657[7] = @"CancelCurrentUpdate";
  v641[0] = v3;
  v641[1] = v2;
  v642[0] = @"RB_Canceling";
  v642[1] = @"RemoveSU";
  [MEMORY[0x189603F68] dictionaryWithObjects:v642 forKeys:v641 count:2];
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v658[7] = v27;
  v657[8] = @"RB_RollbackSuspendSuccess";
  uint64_t v639 = v2;
  v640 = @"RollbackUpdateDecideResume";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v640 forKeys:&v639 count:1];
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v658[8] = v26;
  v657[9] = @"RB_PerformRollbackResume";
  v637[0] = v3;
  v637[1] = v2;
  v638[0] = @"RB_RollingBackResume";
  v638[1] = @"RollbackUpdateResume";
  [MEMORY[0x189603F68] dictionaryWithObjects:v638 forKeys:v637 count:2];
  v573 = (void *)objc_claimAutoreleasedReturnValue();
  v658[9] = v573;
  v657[10] = @"RB_PerformRollbackApply";
  v635[0] = v3;
  v635[1] = v2;
  v636[0] = @"RB_RollingBackApply";
  v636[1] = @"RollbackUpdateApply";
  [MEMORY[0x189603F68] dictionaryWithObjects:v636 forKeys:v635 count:2];
  v572 = (void *)objc_claimAutoreleasedReturnValue();
  v658[10] = v572;
  v657[11] = @"RB_RollbackAppleSuccess";
  v633[0] = v3;
  v633[1] = v2;
  v634[0] = @"AwaitingReboot";
  v634[1] = @"ReportRollbackSucceeded";
  [MEMORY[0x189603F68] dictionaryWithObjects:v634 forKeys:v633 count:2];
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v658[11] = v25;
  v657[12] = @"RB_RollbackFailed";
  v631[0] = v3;
  v631[1] = v2;
  v632[0] = @"ReadyToBegin";
  v632[1] = @"ReportRollbackFailed";
  [MEMORY[0x189603F68] dictionaryWithObjects:v632 forKeys:v631 count:2];
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v658[12] = v24;
  [MEMORY[0x189603F68] dictionaryWithObjects:v658 forKeys:v657 count:13];
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v1728[24] = v23;
  v1727[25] = @"RB_RollingBackResume";
  v629[0] = @"TargetBrainLoaded";
  uint64_t v627 = v2;
  v628 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v628 forKeys:&v627 count:1];
  v568 = (void *)objc_claimAutoreleasedReturnValue();
  v630[0] = v568;
  v629[1] = @"TargetDownloadPreflighted";
  uint64_t v625 = v2;
  v626 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v626 forKeys:&v625 count:1];
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v630[1] = v22;
  v629[2] = @"TargetDownloaded";
  uint64_t v623 = v2;
  v624 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v624 forKeys:&v623 count:1];
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v630[2] = v21;
  v629[3] = @"TargetPrepared";
  uint64_t v621 = v2;
  v622 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v622 forKeys:&v621 count:1];
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v630[3] = v20;
  v629[4] = @"TargetApplied";
  uint64_t v619 = v2;
  v620 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v620 forKeys:&v619 count:1];
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v630[4] = v19;
  v629[5] = @"TargetRollback";
  uint64_t v617 = v2;
  v618 = @"UpdateTarget";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v618 forKeys:&v617 count:1];
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v630[5] = v18;
  v629[6] = @"ResumeCurrentUpdate";
  uint64_t v615 = v2;
  v616 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v616 forKeys:&v615 count:1];
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v630[6] = v17;
  v629[7] = @"CancelCurrentUpdate";
  v613[0] = v3;
  v613[1] = v2;
  v614[0] = @"RB_Canceling";
  v614[1] = @"RemoveSU";
  [MEMORY[0x189603F68] dictionaryWithObjects:v614 forKeys:v613 count:2];
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v630[7] = v16;
  v629[8] = @"RB_RollbackResumeSuccess";
  uint64_t v611 = v2;
  v612 = @"RollbackUpdateDecideApply";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v612 forKeys:&v611 count:1];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v630[8] = v15;
  v629[9] = @"RB_PerformRollbackApply";
  v609[0] = v3;
  v609[1] = v2;
  v610[0] = @"RB_RollingBackApply";
  v610[1] = @"RollbackUpdateApply";
  [MEMORY[0x189603F68] dictionaryWithObjects:v610 forKeys:v609 count:2];
  v575 = (void *)objc_claimAutoreleasedReturnValue();
  v630[9] = v575;
  v629[10] = @"RB_RollbackAppleSuccess";
  v607[0] = v3;
  v607[1] = v2;
  v608[0] = @"AwaitingReboot";
  v608[1] = @"ReportRollbackSucceeded";
  [MEMORY[0x189603F68] dictionaryWithObjects:v608 forKeys:v607 count:2];
  v574 = (void *)objc_claimAutoreleasedReturnValue();
  v630[10] = v574;
  v629[11] = @"RB_RollbackFailed";
  v605[0] = v3;
  v605[1] = v2;
  v606[0] = @"ReadyToBegin";
  v606[1] = @"ReportRollbackFailed";
  [MEMORY[0x189603F68] dictionaryWithObjects:v606 forKeys:v605 count:2];
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v630[11] = v14;
  [MEMORY[0x189603F68] dictionaryWithObjects:v630 forKeys:v629 count:12];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v1728[25] = v13;
  v1727[26] = @"RB_RollingBackApply";
  v603[0] = @"TargetBrainLoaded";
  uint64_t v601 = v2;
  v602 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v602 forKeys:&v601 count:1];
  v579 = (void *)objc_claimAutoreleasedReturnValue();
  v604[0] = v579;
  v603[1] = @"TargetDownloadPreflighted";
  uint64_t v599 = v2;
  v600 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v600 forKeys:&v599 count:1];
  v578 = (void *)objc_claimAutoreleasedReturnValue();
  v604[1] = v578;
  v603[2] = @"TargetDownloaded";
  uint64_t v597 = v2;
  v598 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v598 forKeys:&v597 count:1];
  v577 = (void *)objc_claimAutoreleasedReturnValue();
  v604[2] = v577;
  v603[3] = @"TargetPrepared";
  uint64_t v595 = v2;
  v596 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v596 forKeys:&v595 count:1];
  v576 = (void *)objc_claimAutoreleasedReturnValue();
  v604[3] = v576;
  v603[4] = @"TargetApplied";
  uint64_t v593 = v2;
  v594 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v594 forKeys:&v593 count:1];
  v571 = (void *)objc_claimAutoreleasedReturnValue();
  v604[4] = v571;
  v603[5] = @"TargetRollback";
  uint64_t v591 = v2;
  v592 = @"UpdateTarget";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v592 forKeys:&v591 count:1];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v604[5] = v4;
  v603[6] = @"ResumeCurrentUpdate";
  uint64_t v589 = v2;
  v590 = @"ReportAnomalyAPI";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v590 forKeys:&v589 count:1];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v604[6] = v5;
  v603[7] = @"CancelCurrentUpdate";
  v587[0] = v3;
  v587[1] = v2;
  v588[0] = @"RB_Canceling";
  v588[1] = @"RemoveSU";
  [MEMORY[0x189603F68] dictionaryWithObjects:v588 forKeys:v587 count:2];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v604[7] = v6;
  v603[8] = @"RB_RollbackAppleSuccess";
  v585[0] = v3;
  v585[1] = v2;
  v586[0] = @"AwaitingReboot";
  v586[1] = @"ReportRollbackSucceeded";
  [MEMORY[0x189603F68] dictionaryWithObjects:v586 forKeys:v585 count:2];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v604[8] = v7;
  v603[9] = @"RB_RollbackApplyFailed";
  v583[0] = v3;
  v583[1] = v2;
  v584[0] = @"ReadyToBegin";
  v584[1] = @"ReportRollbackFailed";
  [MEMORY[0x189603F68] dictionaryWithObjects:v584 forKeys:v583 count:2];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v604[9] = v8;
  v603[10] = @"RB_RollbackFailed";
  v581[0] = v3;
  v581[1] = v2;
  v582[0] = @"ReadyToBegin";
  v582[1] = @"ReportRollbackFailed";
  [MEMORY[0x189603F68] dictionaryWithObjects:v582 forKeys:v581 count:2];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v604[10] = v9;
  [MEMORY[0x189603F68] dictionaryWithObjects:v604 forKeys:v603 count:11];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v1728[26] = v10;
  [MEMORY[0x189603F68] dictionaryWithObjects:v1728 forKeys:v1727 count:27];
  v580 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)[objc_alloc(MEMORY[0x189603F68]) initWithDictionary:v580 copyItems:1];
  return v11;
}

- (int64_t)performAction:(id)a3 onEvent:(id)a4 inState:(id)a5 withInfo:(id)a6 nextState:(id)a7 error:(id *)a8
{
  id v11 = a3;
  id v12 = a6;
  if ([v11 isEqualToString:*MEMORY[0x1896129D8]])
  {
    int64_t v13 = 0LL;
  }

  else
  {
    if ([v11 isEqualToString:@"DecideLoadBrain"])
    {
      int64_t v14 = -[SUCoreUpdate actionDecideLoadBrain:error:](self, "actionDecideLoadBrain:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"LoadBrain"])
    {
      int64_t v14 = -[SUCoreUpdate actionLoadBrain:error:](self, "actionLoadBrain:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"ReportBrainLoadProgress"])
    {
      int64_t v14 = -[SUCoreUpdate actionReportBrainLoadProgress:error:](self, "actionReportBrainLoadProgress:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"AdvanceBrainLoadSuccess"])
    {
      int64_t v14 = -[SUCoreUpdate actionAdvanceBrainLoadSuccess:error:](self, "actionAdvanceBrainLoadSuccess:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"ReportBrainLoadSuccess"])
    {
      int64_t v14 = -[SUCoreUpdate actionReportBrainLoadSuccess:error:](self, "actionReportBrainLoadSuccess:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"DecidePreflightDownloadSU"])
    {
      int64_t v14 = -[SUCoreUpdate actionDecidePreflightDownloadSU:error:]( self,  "actionDecidePreflightDownloadSU:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"PreflightDownloadSU"])
    {
      int64_t v14 = -[SUCoreUpdate actionPreflightDownloadSU:error:](self, "actionPreflightDownloadSU:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"AdvanceDownloadPreflighted"])
    {
      int64_t v14 = -[SUCoreUpdate actionAdvanceDownloadPreflighted:error:]( self,  "actionAdvanceDownloadPreflighted:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"ReportDownloadPreflighted"])
    {
      int64_t v14 = -[SUCoreUpdate actionReportDownloadPreflighted:error:]( self,  "actionReportDownloadPreflighted:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"DecideDownloadSpaceCheck"])
    {
      int64_t v14 = -[SUCoreUpdate actionDecideDownloadSpaceCheck:error:]( self,  "actionDecideDownloadSpaceCheck:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"ChooseErrorSpaceCheck"])
    {
      int64_t v14 = -[SUCoreUpdate actionChooseErrorSpaceCheck:error:](self, "actionChooseErrorSpaceCheck:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"CheckSpace"])
    {
      int64_t v14 = -[SUCoreUpdate actionCheckSpace:error:](self, "actionCheckSpace:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"DecideDownloadSU"])
    {
      int64_t v14 = -[SUCoreUpdate actionDecideDownloadSU:error:](self, "actionDecideDownloadSU:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"DownloadSU"])
    {
      int64_t v14 = -[SUCoreUpdate actionDownloadSU:error:](self, "actionDownloadSU:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"ReportDownloadProgress"])
    {
      int64_t v14 = -[SUCoreUpdate actionReportDownloadProgress:error:](self, "actionReportDownloadProgress:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"ReportDownloadStalled"])
    {
      int64_t v14 = -[SUCoreUpdate actionReportDownloadStalled:error:](self, "actionReportDownloadStalled:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"AdvanceSUDownloaded"])
    {
      int64_t v14 = -[SUCoreUpdate actionAdvanceSUDownloaded:error:](self, "actionAdvanceSUDownloaded:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"ReportSUDownloaded"])
    {
      int64_t v14 = -[SUCoreUpdate actionReportSUDownloaded:error:](self, "actionReportSUDownloaded:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"DecidePrepareUpdate"])
    {
      int64_t v14 = -[SUCoreUpdate actionDecidePrepareUpdate:error:](self, "actionDecidePrepareUpdate:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"PrepareUpdate"])
    {
      int64_t v14 = -[SUCoreUpdate actionPrepareUpdate:error:](self, "actionPrepareUpdate:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"ReportPrepareProgress"])
    {
      int64_t v14 = -[SUCoreUpdate actionReportPrepareProgress:error:](self, "actionReportPrepareProgress:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"DecideSuspendUpdate"])
    {
      int64_t v14 = -[SUCoreUpdate actionDecideSuspendUpdate:error:](self, "actionDecideSuspendUpdate:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"SuspendUpdate"])
    {
      int64_t v14 = -[SUCoreUpdate actionSuspendUpdate:error:](self, "actionSuspendUpdate:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"AdvanceSuspended"])
    {
      int64_t v14 = -[SUCoreUpdate actionAdvanceSuspended:error:](self, "actionAdvanceSuspended:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"ReportPrepared"])
    {
      int64_t v14 = -[SUCoreUpdate actionReportPrepared:error:](self, "actionReportPrepared:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"ResumeCurrentUpdate"])
    {
      int64_t v14 = -[SUCoreUpdate actionResumeCurrentUpdate:error:](self, "actionResumeCurrentUpdate:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"ReportResumeCurrentSuccess"])
    {
      int64_t v14 = -[SUCoreUpdate actionReportResumeCurrentSuccess:error:]( self,  "actionReportResumeCurrentSuccess:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"ReportResumeCurrentFailed"])
    {
      int64_t v14 = -[SUCoreUpdate actionReportResumeCurrentFailed:error:]( self,  "actionReportResumeCurrentFailed:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"DecideResumeUpdate"])
    {
      int64_t v14 = -[SUCoreUpdate actionDecideResumeUpdate:error:](self, "actionDecideResumeUpdate:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"ResumeUpdate"])
    {
      int64_t v14 = -[SUCoreUpdate actionResumeUpdate:error:](self, "actionResumeUpdate:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"DecideApplyUpdate"])
    {
      int64_t v14 = -[SUCoreUpdate actionDecideApplyUpdate:error:](self, "actionDecideApplyUpdate:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"ReportApplyProgress"])
    {
      int64_t v14 = -[SUCoreUpdate actionReportApplyProgress:error:](self, "actionReportApplyProgress:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"ApplyUpdate"])
    {
      int64_t v14 = -[SUCoreUpdate actionApplyUpdate:error:](self, "actionApplyUpdate:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"ReportApplyFailed"])
    {
      int64_t v14 = -[SUCoreUpdate actionReportApplyFailed:error:](self, "actionReportApplyFailed:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"ReportApplied"])
    {
      int64_t v14 = -[SUCoreUpdate actionReportApplied:error:](self, "actionReportApplied:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"DecideCancelBeforeRollback"])
    {
      int64_t v14 = -[SUCoreUpdate actionDecideCancelBeforeRollback:error:]( self,  "actionDecideCancelBeforeRollback:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"DecideBeginRollback"])
    {
      int64_t v14 = -[SUCoreUpdate actionDecideBeginRollback:error:](self, "actionDecideBeginRollback:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"LoadBrainRollback"])
    {
      int64_t v14 = -[SUCoreUpdate actionLoadBrainRollback:error:](self, "actionLoadBrainRollback:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"DecideRollbackUpdate"])
    {
      int64_t v14 = -[SUCoreUpdate actionDecideRollbackUpdate:error:](self, "actionDecideRollbackUpdate:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"RollbackUpdatePrepare"])
    {
      int64_t v14 = -[SUCoreUpdate actionRollbackUpdatePrepare:error:](self, "actionRollbackUpdatePrepare:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"RollbackUpdateDecideSuspend"])
    {
      int64_t v14 = -[SUCoreUpdate actionRollbackUpdateDecideSuspend:error:]( self,  "actionRollbackUpdateDecideSuspend:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"RollbackUpdateSuspend"])
    {
      int64_t v14 = -[SUCoreUpdate actionRollbackUpdateSuspend:error:](self, "actionRollbackUpdateSuspend:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"RollbackUpdateDecideResume"])
    {
      int64_t v14 = -[SUCoreUpdate actionRollbackUpdateDecideResume:error:]( self,  "actionRollbackUpdateDecideResume:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"RollbackUpdateResume"])
    {
      int64_t v14 = -[SUCoreUpdate actionRollbackUpdateResume:error:](self, "actionRollbackUpdateResume:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"RollbackUpdateDecideApply"])
    {
      int64_t v14 = -[SUCoreUpdate actionRollbackUpdateDecideApply:error:]( self,  "actionRollbackUpdateDecideApply:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"RollbackUpdateApply"])
    {
      int64_t v14 = -[SUCoreUpdate actionRollbackUpdateApply:error:](self, "actionRollbackUpdateApply:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"ReportRollbackFailed"])
    {
      int64_t v14 = -[SUCoreUpdate actionReportRollbackFailed:error:](self, "actionReportRollbackFailed:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"ReportRollbackSucceeded"])
    {
      int64_t v14 = -[SUCoreUpdate actionReportRollbackSuccess:error:](self, "actionReportRollbackSuccess:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"ReportAttemptFailure"])
    {
      int64_t v14 = -[SUCoreUpdate actionReportAttemptFailure:error:](self, "actionReportAttemptFailure:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"RemovePrepared"])
    {
      int64_t v14 = -[SUCoreUpdate actionRemovePrepared:error:](self, "actionRemovePrepared:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"RemoveSU"])
    {
      int64_t v14 = -[SUCoreUpdate actionRemoveSU:error:](self, "actionRemoveSU:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"CancelPrepare"])
    {
      int64_t v14 = -[SUCoreUpdate actionCancelPrepare:error:](self, "actionCancelPrepare:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"ReportCanceled"])
    {
      int64_t v14 = -[SUCoreUpdate actionReportCanceled:error:](self, "actionReportCanceled:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"UpdateTarget"])
    {
      int64_t v14 = -[SUCoreUpdate actionUpdateTarget:error:](self, "actionUpdateTarget:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"UpdateTargetReconfig"])
    {
      int64_t v14 = -[SUCoreUpdate actionUpdateTargetReconfig:error:](self, "actionUpdateTargetReconfig:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"ReportAnomalyAPI"])
    {
      int64_t v14 = -[SUCoreUpdate actionReportAnomalyAPI:error:](self, "actionReportAnomalyAPI:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"ReportAnomalyAPIEnd"])
    {
      int64_t v14 = -[SUCoreUpdate actionReportAnomalyAPIEnd:error:](self, "actionReportAnomalyAPIEnd:error:", v12, a8);
    }

    else
    {
      int64_t v14 = -[SUCoreUpdate actionUnknownAction:error:](self, "actionUnknownAction:error:", v11, a8);
    }

    int64_t v13 = v14;
  }

  return v13;
}

- (int64_t)actionUpdateTarget:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = -[SUCoreUpdate updateFSM](self, "updateFSM");
  [v6 extendedStateQueue];
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  uint64_t v8 = [v5 targetPhase];
  [v5 policy];
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdate _adjustTarget:withPolicy:](self, "_adjustTarget:withPolicy:", v8, v9);
  return 0LL;
}

- (int64_t)actionUpdateTargetReconfig:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = -[SUCoreUpdate updateFSM](self, "updateFSM");
  [v6 extendedStateQueue];
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  uint64_t v8 = [v5 targetPhase];
  [v5 policy];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreUpdate _adjustTarget:withPolicy:](self, "_adjustTarget:withPolicy:", v8, v9);

  [v5 policy];
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[SUCoreUpdate downloadControl](self, "downloadControl");
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 policy];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 alterPolicy:v12];
  }

  return 0LL;
}

- (int64_t)actionDecideLoadBrain:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = -[SUCoreUpdate updateFSM](self, "updateFSM");
  [v6 extendedStateQueue];
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  uint64_t v8 = [v5 targetPhase];
  [v5 policy];
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdate _adjustTarget:withPolicy:](self, "_adjustTarget:withPolicy:", v8, v9);
  -[SUCoreUpdate _eventAfterReachingPhase:](self, "_eventAfterReachingPhase:", 2LL);
  return 0LL;
}

- (int64_t)actionLoadBrain:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = -[SUCoreUpdate updateFSM](self, "updateFSM");
  [v6 extendedStateQueue];
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  uint64_t v8 = [v5 targetPhase];
  [v5 policy];
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdate _adjustTarget:withPolicy:](self, "_adjustTarget:withPolicy:", v8, v9);
  -[SUCoreUpdate setFailedAttemptError:](self, "setFailedAttemptError:", 0LL);
  v10 = -[SUCoreUpdate msuControl](self, "msuControl");
  -[SUCoreUpdate policy](self, "policy");
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 loadBrain:v11];

  return 0LL;
}

- (int64_t)actionDecidePreflightDownloadSU:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = -[SUCoreUpdate updateFSM](self, "updateFSM");
  [v6 extendedStateQueue];
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  uint64_t v8 = [v5 targetPhase];
  [v5 policy];
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdate _adjustTarget:withPolicy:](self, "_adjustTarget:withPolicy:", v8, v9);
  -[SUCoreUpdate _eventAfterReachingPhase:](self, "_eventAfterReachingPhase:", 3LL);
  return 0LL;
}

- (int64_t)actionPreflightDownloadSU:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = -[SUCoreUpdate updateFSM](self, "updateFSM");
  [v6 extendedStateQueue];
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  uint64_t v8 = [v5 targetPhase];
  [v5 policy];
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdate _adjustTarget:withPolicy:](self, "_adjustTarget:withPolicy:", v8, v9);
  v10 = -[SUCoreUpdate msuControl](self, "msuControl");
  -[SUCoreUpdate policy](self, "policy");
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 preflightDownloadSU:v11];

  return 0LL;
}

- (int64_t)actionDecideDownloadSU:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = -[SUCoreUpdate updateFSM](self, "updateFSM");
  [v6 extendedStateQueue];
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  uint64_t v8 = [v5 targetPhase];
  [v5 policy];
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdate _adjustTarget:withPolicy:](self, "_adjustTarget:withPolicy:", v8, v9);
  -[SUCoreUpdate _eventAfterReachingPhase:](self, "_eventAfterReachingPhase:", 5LL);
  return 0LL;
}

- (int64_t)actionDownloadSU:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = -[SUCoreUpdate updateFSM](self, "updateFSM");
  [v6 extendedStateQueue];
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  uint64_t v8 = [v5 targetPhase];
  [v5 policy];
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdate _adjustTarget:withPolicy:](self, "_adjustTarget:withPolicy:", v8, v9);
  v10 = -[SUCoreUpdate updateDescriptor](self, "updateDescriptor");
  if ([v10 descriptorType] == 1) {
    goto LABEL_4;
  }
  -[SUCoreUpdate updateDescriptor](self, "updateDescriptor");
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v11 descriptorType] == 3)
  {

LABEL_4:
    goto LABEL_5;
  }
  v16 = -[SUCoreUpdate updateDescriptor](self, "updateDescriptor");
  uint64_t v17 = [v16 descriptorType];

  if (v17 != 5)
  {
    id v18 = objc_alloc(NSString);
    v19 = -[SUCoreUpdate updateDescriptor](self, "updateDescriptor");
    v20 = +[SUCoreDescriptor nameForDescriptorType:]( SUCoreDescriptor,  "nameForDescriptorType:",  [v19 descriptorType]);
    int64_t v13 = (void *)[v18 initWithFormat:@"Descriptor is not of required type (SUCoreDescriptorTypeAsset, SUCoreDescriptorTypeSFRAsset, or SUCoreDescriptorTypeSplatAsset) for downloading, found %@", v20];

    -[SUCoreUpdate _trackUpdateAnomaly:result:description:]( self,  "_trackUpdateAnomaly:result:description:",  @"DOWNLOAD_SU",  8116LL,  v13);
    goto LABEL_7;
  }

- (int64_t)actionDecidePrepareUpdate:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = -[SUCoreUpdate updateFSM](self, "updateFSM");
  [v6 extendedStateQueue];
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  uint64_t v8 = [v5 targetPhase];
  [v5 policy];
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdate _adjustTarget:withPolicy:](self, "_adjustTarget:withPolicy:", v8, v9);
  -[SUCoreUpdate _eventAfterReachingPhase:](self, "_eventAfterReachingPhase:", 6LL);
  return 0LL;
}

- (int64_t)actionPrepareUpdate:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = -[SUCoreUpdate updateFSM](self, "updateFSM");
  [v6 extendedStateQueue];
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  uint64_t v8 = [v5 targetPhase];
  [v5 policy];
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdate _adjustTarget:withPolicy:](self, "_adjustTarget:withPolicy:", v8, v9);
  v10 = -[SUCoreUpdate msuControl](self, "msuControl");
  -[SUCoreUpdate policy](self, "policy");
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 prepareUpdate:v11];

  return 0LL;
}

- (int64_t)actionDecideSuspendUpdate:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = -[SUCoreUpdate updateFSM](self, "updateFSM");
  [v6 extendedStateQueue];
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  uint64_t v8 = [v5 targetPhase];
  [v5 policy];
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdate _adjustTarget:withPolicy:](self, "_adjustTarget:withPolicy:", v8, v9);
  -[SUCoreUpdate _eventAfterReachingPhase:](self, "_eventAfterReachingPhase:", 7LL);
  return 0LL;
}

- (int64_t)actionSuspendUpdate:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 extendedStateQueue];
  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);
  v7 = -[SUCoreUpdate msuControl](self, "msuControl");
  [v7 suspendUpdate];

  return 0LL;
}

- (int64_t)actionDecideResumeUpdate:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = -[SUCoreUpdate updateFSM](self, "updateFSM");
  [v6 extendedStateQueue];
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  uint64_t v8 = [v5 targetPhase];
  [v5 policy];
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdate _adjustTarget:withPolicy:](self, "_adjustTarget:withPolicy:", v8, v9);
  -[SUCoreUpdate _eventAfterReachingPhase:](self, "_eventAfterReachingPhase:", 8LL);
  return 0LL;
}

- (int64_t)actionResumeUpdate:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = -[SUCoreUpdate updateFSM](self, "updateFSM");
  [v6 extendedStateQueue];
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  uint64_t v8 = [v5 targetPhase];
  [v5 policy];
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdate _adjustTarget:withPolicy:](self, "_adjustTarget:withPolicy:", v8, v9);
  v10 = -[SUCoreUpdate msuControl](self, "msuControl");
  -[SUCoreUpdate policy](self, "policy");
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 resumeUpdate:v11];

  return 0LL;
}

- (int64_t)actionResumeCurrentUpdate:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 extendedStateQueue];
  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);
  v7 = -[SUCoreUpdate msuControl](self, "msuControl");
  -[SUCoreUpdate policy](self, "policy");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 resumeUpdate:v8];

  return 0LL;
}

- (int64_t)actionDecideApplyUpdate:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = -[SUCoreUpdate updateFSM](self, "updateFSM");
  [v6 extendedStateQueue];
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  uint64_t v8 = [v5 targetPhase];
  [v5 policy];
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdate _adjustTarget:withPolicy:](self, "_adjustTarget:withPolicy:", v8, v9);
  -[SUCoreUpdate _eventAfterReachingPhase:](self, "_eventAfterReachingPhase:", 9LL);
  return 0LL;
}

- (int64_t)actionApplyUpdate:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = -[SUCoreUpdate updateFSM](self, "updateFSM");
  [v6 extendedStateQueue];
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  uint64_t v8 = [v5 targetPhase];
  [v5 policy];
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdate _adjustTarget:withPolicy:](self, "_adjustTarget:withPolicy:", v8, v9);
  v10 = -[SUCoreUpdate msuControl](self, "msuControl");
  -[SUCoreUpdate policy](self, "policy");
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 applyUpdate:v11];

  return 0LL;
}

- (int64_t)actionDecideCancelBeforeRollback:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = -[SUCoreUpdate updateFSM](self, "updateFSM");
  [v6 extendedStateQueue];
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  uint64_t v8 = [v5 targetPhase];
  [v5 policy];
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdate _adjustTarget:withPolicy:](self, "_adjustTarget:withPolicy:", v8, v9);
  -[SUCoreUpdate _eventAfterReachingRollbackPhase:](self, "_eventAfterReachingRollbackPhase:", 1LL);
  return 0LL;
}

- (int64_t)actionDecideBeginRollback:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = -[SUCoreUpdate updateFSM](self, "updateFSM");
  [v6 extendedStateQueue];
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  uint64_t v8 = [v5 targetPhase];
  [v5 policy];
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdate _adjustTarget:withPolicy:](self, "_adjustTarget:withPolicy:", v8, v9);
  -[SUCoreUpdate _eventAfterReachingRollbackPhase:](self, "_eventAfterReachingRollbackPhase:", 2LL);
  return 0LL;
}

- (int64_t)actionLoadBrainRollback:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = -[SUCoreUpdate updateFSM](self, "updateFSM");
  [v6 extendedStateQueue];
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  uint64_t v8 = [v5 targetPhase];
  [v5 policy];
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdate _adjustTarget:withPolicy:](self, "_adjustTarget:withPolicy:", v8, v9);
  -[SUCoreUpdate _eventAfterReachingRollbackPhase:](self, "_eventAfterReachingRollbackPhase:", 3LL);
  return 0LL;
}

- (int64_t)actionDecideRollbackUpdate:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = -[SUCoreUpdate updateFSM](self, "updateFSM");
  [v6 extendedStateQueue];
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  uint64_t v8 = [v5 targetPhase];
  [v5 policy];
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdate _adjustTarget:withPolicy:](self, "_adjustTarget:withPolicy:", v8, v9);
  -[SUCoreUpdate _eventAfterReachingRollbackPhase:](self, "_eventAfterReachingRollbackPhase:", 4LL);
  return 0LL;
}

- (int64_t)actionRollbackUpdatePrepare:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = -[SUCoreUpdate updateFSM](self, "updateFSM");
  [v6 extendedStateQueue];
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  uint64_t v8 = [v5 targetPhase];
  [v5 policy];
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdate _adjustTarget:withPolicy:](self, "_adjustTarget:withPolicy:", v8, v9);
  v10 = -[SUCoreUpdate msuControl](self, "msuControl");
  -[SUCoreUpdate policy](self, "policy");
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 rollbackUpdatePrepare:v11];

  return 0LL;
}

- (int64_t)actionRollbackUpdateDecideSuspend:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = -[SUCoreUpdate updateFSM](self, "updateFSM");
  [v6 extendedStateQueue];
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  uint64_t v8 = [v5 targetPhase];
  [v5 policy];
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdate _adjustTarget:withPolicy:](self, "_adjustTarget:withPolicy:", v8, v9);
  -[SUCoreUpdate _eventAfterReachingRollbackPhase:](self, "_eventAfterReachingRollbackPhase:", 5LL);
  return 0LL;
}

- (int64_t)actionRollbackUpdateSuspend:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = -[SUCoreUpdate updateFSM](self, "updateFSM");
  [v6 extendedStateQueue];
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  uint64_t v8 = [v5 targetPhase];
  [v5 policy];
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdate _adjustTarget:withPolicy:](self, "_adjustTarget:withPolicy:", v8, v9);
  v10 = -[SUCoreUpdate msuControl](self, "msuControl");
  -[SUCoreUpdate policy](self, "policy");
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 rollbackUpdateSuspend:v11];

  return 0LL;
}

- (int64_t)actionRollbackUpdateDecideResume:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = -[SUCoreUpdate updateFSM](self, "updateFSM");
  [v6 extendedStateQueue];
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  uint64_t v8 = [v5 targetPhase];
  [v5 policy];
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdate _adjustTarget:withPolicy:](self, "_adjustTarget:withPolicy:", v8, v9);
  -[SUCoreUpdate _eventAfterReachingRollbackPhase:](self, "_eventAfterReachingRollbackPhase:", 6LL);
  return 0LL;
}

- (int64_t)actionRollbackUpdateResume:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = -[SUCoreUpdate updateFSM](self, "updateFSM");
  [v6 extendedStateQueue];
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  uint64_t v8 = [v5 targetPhase];
  [v5 policy];
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdate _adjustTarget:withPolicy:](self, "_adjustTarget:withPolicy:", v8, v9);
  v10 = -[SUCoreUpdate msuControl](self, "msuControl");
  -[SUCoreUpdate policy](self, "policy");
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 rollbackUpdateResume:v11];

  return 0LL;
}

- (int64_t)actionRollbackUpdateDecideApply:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = -[SUCoreUpdate updateFSM](self, "updateFSM");
  [v6 extendedStateQueue];
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  uint64_t v8 = [v5 targetPhase];
  [v5 policy];
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdate _adjustTarget:withPolicy:](self, "_adjustTarget:withPolicy:", v8, v9);
  -[SUCoreUpdate _eventAfterReachingRollbackPhase:](self, "_eventAfterReachingRollbackPhase:", 7LL);
  return 0LL;
}

- (int64_t)actionRollbackUpdateApply:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = -[SUCoreUpdate updateFSM](self, "updateFSM");
  [v6 extendedStateQueue];
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  uint64_t v8 = [v5 targetPhase];
  [v5 policy];
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdate _adjustTarget:withPolicy:](self, "_adjustTarget:withPolicy:", v8, v9);
  v10 = -[SUCoreUpdate msuControl](self, "msuControl");
  -[SUCoreUpdate policy](self, "policy");
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 rollbackUpdateApply:v11];

  return 0LL;
}

- (int64_t)actionDecideDownloadSpaceCheck:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = -[SUCoreUpdate updateFSM](self, "updateFSM");
  [v6 extendedStateQueue];
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  uint64_t v8 = [v5 targetPhase];
  [v5 policy];
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdate _adjustTarget:withPolicy:](self, "_adjustTarget:withPolicy:", v8, v9);
  -[SUCoreUpdate _eventAfterReachingPhase:](self, "_eventAfterReachingPhase:", 4LL);
  return 0LL;
}

- (int64_t)actionChooseErrorSpaceCheck:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = -[SUCoreUpdate updateFSM](self, "updateFSM");
  [v6 extendedStateQueue];
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[SUCoreUpdate policy](self, "policy");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = [v8 checkAvailableSpace];
  v9 = -[SUCoreUpdate updateFSM](self, "updateFSM");
  v10 = v9;
  id v11 = kSU_E_PerformErrorSpaceCheck;
  if (!(_DWORD)v7) {
    id v11 = kSU_E_SkipErrorSpaceCheck;
  }
  [v9 followupEvent:*v11 withInfo:v5];

  return 0LL;
}

- (int64_t)actionCheckSpace:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = -[SUCoreUpdate updateFSM](self, "updateFSM");
  [v6 extendedStateQueue];
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[SUCoreUpdate updateDescriptor](self, "updateDescriptor");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 msuPrepareSize];

  if (v9)
  {
    v10 = -[SUCoreUpdate updateDescriptor](self, "updateDescriptor");
    uint64_t v11 = [v10 totalRequiredFreeSpace];
    -[SUCoreUpdate updateDescriptor](self, "updateDescriptor");
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = v11 - [v12 msuPrepareSize];
  }

  else
  {
    uint64_t v13 = 0LL;
  }

  -[SUCoreUpdate updateDescriptor](self, "updateDescriptor");
  int64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = [v14 totalRequiredFreeSpace];
  v16 = -[SUCoreUpdate policy](self, "policy");
  uint64_t v17 = [v16 cacheDeleteUrgency];
  -[SUCoreUpdate policy](self, "policy");
  id v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v18 updateVolumePath];
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1895F87A8];
  v22[1] = 3221225472LL;
  v22[2] = __39__SUCoreUpdate_actionCheckSpace_error___block_invoke;
  v22[3] = &unk_18A0F10A0;
  v22[4] = self;
  id v23 = v5;
  id v20 = v5;
  +[SUCoreSpace checkAvailableSpace:allowPurgeWithUrgency:purgingFromBase:minimalRequiredFreeSpace:completion:]( &OBJC_CLASS___SUCoreSpace,  "checkAvailableSpace:allowPurgeWithUrgency:purgingFromBase:minimalRequiredFreeSpace:completion:",  v15,  v17,  v19,  v13,  v22);

  return 0LL;
}

void __39__SUCoreUpdate_actionCheckSpace_error___block_invoke( uint64_t a1,  int a2,  uint64_t a3,  uint64_t a4,  void *a5)
{
  id v20 = a5;
  if (v20)
  {
    id v7 = *(id *)(a1 + 40);
    [*(id *)(a1 + 40) error];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      uint64_t v9 = -[SUCoreUpdateParam initWithError:](objc_alloc(&OBJC_CLASS___SUCoreUpdateParam), "initWithError:", v20);

      id v7 = v9;
    }

    v10 = *(void **)(a1 + 32);
    [v7 error];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 _trackUpdateError:@"checkAvailableSpace" forReason:@"unable to check available space" error:v11];

    [*(id *)(a1 + 32) updateFSM];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 postEvent:@"SpaceCheckFailed" withInfo:v7];
  }

  else if (a2)
  {
    [*(id *)(a1 + 32) updateFSM];
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    [v7 postEvent:@"SpaceCheckHaveSpace" withInfo:*(void *)(a1 + 40)];
  }

  else
  {
    id v7 = *(id *)(a1 + 40);
    [*(id *)(a1 + 40) error];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      [MEMORY[0x189612760] sharedCore];
      int64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 buildError:8600 underlying:0 description:@"insufficient space to perform update"];
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = -[SUCoreUpdateParam initWithError:](objc_alloc(&OBJC_CLASS___SUCoreUpdateParam), "initWithError:", v15);
      id v7 = v16;
    }

    uint64_t v17 = *(void **)(a1 + 32);
    [v7 error];
    id v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 _trackUpdateError:@"checkAvailableSpace" forReason:@"insufficient space to perform update" error:v18];

    [*(id *)(a1 + 32) updateFSM];
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v19 postEvent:@"SpaceCheckNoSpace" withInfo:*(void *)(a1 + 40)];
  }
}

- (int64_t)actionRemoveSU:(id)a3 error:(id *)a4
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  -[SUCoreUpdate updateFSM](self, "updateFSM", a3, a4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 extendedStateQueue];
  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[SUCoreUpdate updateDescriptor](self, "updateDescriptor");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v7 descriptorType] == 1) {
    goto LABEL_4;
  }
  -[SUCoreUpdate updateDescriptor](self, "updateDescriptor");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v8 descriptorType] == 3)
  {

LABEL_4:
    goto LABEL_5;
  }
  v16 = -[SUCoreUpdate updateDescriptor](self, "updateDescriptor");
  uint64_t v17 = [v16 descriptorType];

  if (v17 != 5)
  {
    -[SUCoreUpdate updateDescriptor](self, "updateDescriptor");
    id v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v18 descriptorType] == 2)
    {
    }

    else
    {
      v19 = -[SUCoreUpdate updateDescriptor](self, "updateDescriptor");
      uint64_t v20 = [v19 descriptorType];

      if (v20 != 4)
      {
        id v26 = objc_alloc(NSString);
        v27 = -[SUCoreUpdate updateDescriptor](self, "updateDescriptor");
        v28 = +[SUCoreDescriptor nameForDescriptorType:]( SUCoreDescriptor,  "nameForDescriptorType:",  [v27 descriptorType]);
        v29 = (void *)[v26 initWithFormat:@"Unable to determine a known descriptor type for removal, found %@", v28];

        -[SUCoreUpdate _trackUpdateAnomaly:result:description:]( self,  "_trackUpdateAnomaly:result:description:",  @"REMOVE_SU",  8116LL,  v29);
        return 0LL;
      }
    }

    [MEMORY[0x1896127A0] sharedLogger];
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v21 oslog];
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      -[SUCoreUpdate updateDescriptor](self, "updateDescriptor");
      id v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = +[SUCoreDescriptor nameForDescriptorType:]( SUCoreDescriptor,  "nameForDescriptorType:",  [v23 descriptorType]);
      *(_DWORD *)buf = 138543618;
      v31 = self;
      __int16 v32 = 2114;
      v33 = v24;
      _os_log_impl( &dword_187A54000,  v22,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Not removing descriptor of type %{public}@; posting removed event",
        buf,
        0x16u);
    }

    -[SUCoreUpdate updateFSM](self, "updateFSM");
    int64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_alloc_init(&OBJC_CLASS___SUCoreUpdateParam);
    [v14 followupEvent:@"SURemoved" withInfo:v25];

    goto LABEL_9;
  }

- (int64_t)actionCancelPrepare:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 extendedStateQueue];
  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[SUCoreUpdate msuControl](self, "msuControl");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 cancelPrepare];

  return 0LL;
}

- (int64_t)actionRemovePrepared:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 extendedStateQueue];
  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[SUCoreUpdate msuControl](self, "msuControl");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 removePrepared];

  return 0LL;
}

- (int64_t)actionReportBrainLoadProgress:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = -[SUCoreUpdate updateFSM](self, "updateFSM");
  [v6 extendedStateQueue];
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  [v5 downloadProgress];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = [v8 isStalled];

  [v5 downloadProgress];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((_DWORD)v7) {
    -[SUCoreUpdate _updateBrainLoadStalled:](self, "_updateBrainLoadStalled:", v9);
  }
  else {
    -[SUCoreUpdate _updateBrainLoadProgress:](self, "_updateBrainLoadProgress:", v9);
  }

  return 0LL;
}

- (int64_t)actionAdvanceBrainLoadSuccess:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = -[SUCoreUpdate updateFSM](self, "updateFSM");
  [v6 extendedStateQueue];
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  [v5 downloadProgress];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdate _updateBrainLoaded:](self, "_updateBrainLoaded:", v8);
  -[SUCoreUpdate _eventAfterReachingPhase:](self, "_eventAfterReachingPhase:", 3LL);
  return 0LL;
}

- (int64_t)actionReportBrainLoadSuccess:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = -[SUCoreUpdate updateFSM](self, "updateFSM");
  [v6 extendedStateQueue];
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  [v5 downloadProgress];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdate _updateBrainLoaded:](self, "_updateBrainLoaded:", v8);
  return 0LL;
}

- (int64_t)actionAdvanceDownloadPreflighted:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 extendedStateQueue];
  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[SUCoreUpdate _updateAssetDownloadPreflighted](self, "_updateAssetDownloadPreflighted");
  -[SUCoreUpdate _eventAfterReachingPhase:](self, "_eventAfterReachingPhase:", 4LL);
  return 0LL;
}

- (int64_t)actionReportDownloadPreflighted:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 extendedStateQueue];
  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[SUCoreUpdate _updateAssetDownloadPreflighted](self, "_updateAssetDownloadPreflighted");
  return 0LL;
}

- (int64_t)actionReportDownloadProgress:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = -[SUCoreUpdate updateFSM](self, "updateFSM");
  [v6 extendedStateQueue];
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  [v5 downloadProgress];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdate _updateAssetDownloadProgress:](self, "_updateAssetDownloadProgress:", v8);
  return 0LL;
}

- (int64_t)actionReportDownloadStalled:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = -[SUCoreUpdate updateFSM](self, "updateFSM");
  [v6 extendedStateQueue];
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  [v5 downloadProgress];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdate _updateAssetDownloadStalled:](self, "_updateAssetDownloadStalled:", v8);
  return 0LL;
}

- (int64_t)actionAdvanceSUDownloaded:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = -[SUCoreUpdate updateFSM](self, "updateFSM");
  [v6 extendedStateQueue];
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  [v5 downloadProgress];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdate _updateAssetDownloaded:](self, "_updateAssetDownloaded:", v8);
  -[SUCoreUpdate _eventAfterReachingPhase:](self, "_eventAfterReachingPhase:", 6LL);
  return 0LL;
}

- (int64_t)actionReportSUDownloaded:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = -[SUCoreUpdate updateFSM](self, "updateFSM");
  [v6 extendedStateQueue];
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  [v5 downloadProgress];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdate _updateAssetDownloaded:](self, "_updateAssetDownloaded:", v8);
  return 0LL;
}

- (int64_t)actionReportPrepareProgress:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = -[SUCoreUpdate updateFSM](self, "updateFSM");
  [v6 extendedStateQueue];
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  [v5 prepareProgress];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdate _updatePrepareProgress:](self, "_updatePrepareProgress:", v8);
  return 0LL;
}

- (int64_t)actionAdvanceSuspended:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 extendedStateQueue];
  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[SUCoreUpdate _eventAfterReachingPhase:](self, "_eventAfterReachingPhase:", 8LL);
  return 0LL;
}

- (int64_t)actionReportPrepared:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 extendedStateQueue];
  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  id v7 = objc_alloc(MEMORY[0x1896127B8]);
  LODWORD(v8) = 1.0;
  uint64_t v9 = (void *)[v7 initWithPhase:*MEMORY[0x189612A28] isStalled:0 portionComplete:v8 remaining:0.0];
  -[SUCoreUpdate _updatePrepared:](self, "_updatePrepared:", v9);

  return 0LL;
}

- (int64_t)actionReportResumeCurrentSuccess:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 extendedStateQueue];
  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[SUCoreUpdate _updateCurrentResumed](self, "_updateCurrentResumed");
  return 0LL;
}

- (int64_t)actionReportResumeCurrentFailed:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = -[SUCoreUpdate updateFSM](self, "updateFSM");
  [v6 extendedStateQueue];
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  [v5 error];
  double v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdate _updateCurrentResumeFailed:](self, "_updateCurrentResumeFailed:", v8);
  return 0LL;
}

- (int64_t)actionReportApplyProgress:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = -[SUCoreUpdate updateFSM](self, "updateFSM");
  [v6 extendedStateQueue];
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  [v5 applyProgress];
  double v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdate _updateApplyProgress:](self, "_updateApplyProgress:", v8);
  return 0LL;
}

- (int64_t)actionReportApplied:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 extendedStateQueue];
  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[SUCoreUpdate _updateApplied](self, "_updateApplied");
  return 0LL;
}

- (int64_t)actionReportRollbackSuccess:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = -[SUCoreUpdate updateFSM](self, "updateFSM");
  [v6 extendedStateQueue];
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  [v5 rollback];
  double v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdate _updateRolledBack:](self, "_updateRolledBack:", v8);
  return 0LL;
}

- (int64_t)actionReportApplyFailed:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = -[SUCoreUpdate updateFSM](self, "updateFSM");
  [v6 extendedStateQueue];
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  [v5 error];
  double v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdate _applyAttemptFailed:](self, "_applyAttemptFailed:", v8);
  return 0LL;
}

- (int64_t)actionReportAttemptFailure:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = -[SUCoreUpdate updateFSM](self, "updateFSM");
  [v6 extendedStateQueue];
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  [v5 error];
  double v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdate _updateAttemptFailed:](self, "_updateAttemptFailed:", v8);
  -[SUCoreUpdate _cleanupAfterAttempt](self, "_cleanupAfterAttempt");
  return 0LL;
}

- (int64_t)actionReportCanceled:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 extendedStateQueue];
  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[SUCoreUpdate _updateCanceled](self, "_updateCanceled");
  -[SUCoreUpdate _cleanupAfterAttempt](self, "_cleanupAfterAttempt");
  return 0LL;
}

- (int64_t)actionReportRollbackFailed:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = -[SUCoreUpdate updateFSM](self, "updateFSM");
  [v6 extendedStateQueue];
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  [v5 rollback];
  double v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 error];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdate _rollbackAttemptFailed:withError:](self, "_rollbackAttemptFailed:withError:", v8, v9);
  return 0LL;
}

- (int64_t)actionReportAnomalyAPI:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 extendedStateQueue];
  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  [MEMORY[0x189612760] sharedCore];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 buildError:8115 underlying:0 description:@"API call not valid for current state"];
  double v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdate _updateAnomaly:](self, "_updateAnomaly:", v8);
  return 0LL;
}

- (int64_t)actionReportAnomalyAPIEnd:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 extendedStateQueue];
  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  [MEMORY[0x189612760] sharedCore];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 buildError:8115 underlying:0 description:@"API call not valid for current resting state"];
  double v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdate _updateAnomaly:](self, "_updateAnomaly:", v8);
  -[SUCoreUpdate updateTransaction](self, "updateTransaction");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreUpdate setUpdateTransaction:](self, "setUpdateTransaction:", 0LL);
  [MEMORY[0x189612760] endTransaction:v9 withName:@"update.Transaction"];

  return 0LL;
}

- (int64_t)actionUnknownAction:(id)a3 error:(id *)a4
{
  id v5 = (objc_class *)NSString;
  id v6 = a3;
  id v7 = (void *)[[v5 alloc] initWithFormat:@"unknown action(%@)", v6];

  -[SUCoreUpdate updateFSM](self, "updateFSM");
  double v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 diag];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 dumpTracked:v7 dumpingTo:5 usingFilename:0 clearingStatistics:0 clearingHistory:0];

  [MEMORY[0x189612760] sharedCore];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 buildError:8116 underlying:0 description:v7];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdate _updateAnomaly:](self, "_updateAnomaly:", v11);
  return 0LL;
}

- (SUCoreUpdate)initWithDelegate:(id)a3 updateDescriptor:(id)a4 updateUUID:(id)a5
{
  return -[SUCoreUpdate initWithDelegate:updateDescriptor:updateUUID:withCallbackQueue:]( self,  "initWithDelegate:updateDescriptor:updateUUID:withCallbackQueue:",  a3,  a4,  a5,  0LL);
}

- (SUCoreUpdate)initWithDelegate:(id)a3 updateDescriptor:(id)a4 updateUUID:(id)a5 withCallbackQueue:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v76.receiver = self;
  v76.super_class = (Class)&OBJC_CLASS___SUCoreUpdate;
  int64_t v14 = -[SUCoreUpdate init](&v76, sel_init);
  uint64_t v15 = v14;
  if (!v14) {
    goto LABEL_21;
  }
  p_updateDescriptor = &v14->_updateDescriptor;
  objc_storeStrong((id *)&v14->_updateDescriptor, a4);
  objc_storeWeak(&v15->_updateDelegate, v10);
  objc_storeStrong((id *)&v15->_updateUUID, a5);
  [MEMORY[0x189612760] sharedCore];
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v18 = [v17 selectDelegateCallbackQueue:v13];
  clientDelegateCallbackQueue = v15->_clientDelegateCallbackQueue;
  v15->_clientDelegateCallbackQueue = (OS_dispatch_queue *)v18;

  policy = v15->_policy;
  v15->_targetPhase = 1LL;
  v15->_policy = 0LL;

  failedAttemptError = v15->_failedAttemptError;
  v15->_failedAttemptError = 0LL;

  v22 = objc_alloc_init(&OBJC_CLASS___SUCoreRollback);
  rollbackControl = v15->_rollbackControl;
  v15->_rollbackControl = v22;

  uint64_t v24 = -[SUCoreRollback eligibleRollback](v15->_rollbackControl, "eligibleRollback");
  rollbackDescriptor = v15->_rollbackDescriptor;
  v15->_rollbackDescriptor = (SUCoreRollbackDescriptor *)v24;

  [MEMORY[0x189612770] sharedDevice];
  id v26 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v27 = [v26 releaseType];

  if (v27) {
    v28 = (__CFString *)v27;
  }
  else {
    v28 = @"user";
  }
  v29 = v15->_rollbackDescriptor;
  if (!v29 || !-[SUCoreRollbackDescriptor rollbackEligible](v29, "rollbackEligible"))
  {
    if (!*p_updateDescriptor)
    {
      [MEMORY[0x1896127A0] sharedLogger];
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      [v64 oslog];
      v65 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( &dword_187A54000,  v65,  OS_LOG_TYPE_DEFAULT,  "[Update]Initializing SUCoreUpdate without an SUCoreDescriptor nor SUCoreRollbackDescriptor instance. Returning nil SUCoreUpdate",  buf,  2u);
      }

      goto LABEL_25;
    }

- (void)targetBrainLoaded:(id)a3
{
  id v4 = a3;
  [MEMORY[0x189612760] beginTransactionWithName:@"update.Transaction"];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 extendedStateQueue];
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __34__SUCoreUpdate_targetBrainLoaded___block_invoke;
  block[3] = &unk_18A0F03C8;
  block[4] = self;
  id v11 = v5;
  id v12 = v4;
  id v8 = v4;
  id v9 = v5;
  dispatch_async(v7, block);
}

void __34__SUCoreUpdate_targetBrainLoaded___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2) {
    [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 40) withName:@"update.Transaction"];
  }
  else {
    [*(id *)(a1 + 32) setUpdateTransaction:*(void *)(a1 + 40)];
  }
  [*(id *)(a1 + 32) updateFSM];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = -[SUCoreUpdateParam initTargetPhase:withPolicy:]( objc_alloc(&OBJC_CLASS___SUCoreUpdateParam),  "initTargetPhase:withPolicy:",  3LL,  *(void *)(a1 + 48));
  [v4 postEvent:@"TargetBrainLoaded" withInfo:v3];
}

- (void)targetDownloadPreflighted:(id)a3
{
  id v4 = a3;
  [MEMORY[0x189612760] beginTransactionWithName:@"update.Transaction"];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 extendedStateQueue];
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __42__SUCoreUpdate_targetDownloadPreflighted___block_invoke;
  block[3] = &unk_18A0F03C8;
  block[4] = self;
  id v11 = v5;
  id v12 = v4;
  id v8 = v4;
  id v9 = v5;
  dispatch_async(v7, block);
}

void __42__SUCoreUpdate_targetDownloadPreflighted___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2) {
    [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 40) withName:@"update.Transaction"];
  }
  else {
    [*(id *)(a1 + 32) setUpdateTransaction:*(void *)(a1 + 40)];
  }
  [*(id *)(a1 + 32) updateFSM];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = -[SUCoreUpdateParam initTargetPhase:withPolicy:]( objc_alloc(&OBJC_CLASS___SUCoreUpdateParam),  "initTargetPhase:withPolicy:",  4LL,  *(void *)(a1 + 48));
  [v4 postEvent:@"TargetDownloadPreflighted" withInfo:v3];
}

- (void)targetDownloaded:(id)a3
{
  id v4 = a3;
  [MEMORY[0x189612760] beginTransactionWithName:@"update.Transaction"];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 extendedStateQueue];
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __33__SUCoreUpdate_targetDownloaded___block_invoke;
  block[3] = &unk_18A0F03C8;
  block[4] = self;
  id v11 = v5;
  id v12 = v4;
  id v8 = v4;
  id v9 = v5;
  dispatch_async(v7, block);
}

void __33__SUCoreUpdate_targetDownloaded___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2) {
    [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 40) withName:@"update.Transaction"];
  }
  else {
    [*(id *)(a1 + 32) setUpdateTransaction:*(void *)(a1 + 40)];
  }
  [*(id *)(a1 + 32) updateFSM];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = -[SUCoreUpdateParam initTargetPhase:withPolicy:]( objc_alloc(&OBJC_CLASS___SUCoreUpdateParam),  "initTargetPhase:withPolicy:",  6LL,  *(void *)(a1 + 48));
  [v4 postEvent:@"TargetDownloaded" withInfo:v3];
}

- (void)targetPrepared:(id)a3
{
  id v4 = a3;
  [MEMORY[0x189612760] beginTransactionWithName:@"update.Transaction"];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 extendedStateQueue];
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __31__SUCoreUpdate_targetPrepared___block_invoke;
  block[3] = &unk_18A0F03C8;
  block[4] = self;
  id v11 = v5;
  id v12 = v4;
  id v8 = v4;
  id v9 = v5;
  dispatch_async(v7, block);
}

void __31__SUCoreUpdate_targetPrepared___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2) {
    [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 40) withName:@"update.Transaction"];
  }
  else {
    [*(id *)(a1 + 32) setUpdateTransaction:*(void *)(a1 + 40)];
  }
  [*(id *)(a1 + 32) updateFSM];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = -[SUCoreUpdateParam initTargetPhase:withPolicy:]( objc_alloc(&OBJC_CLASS___SUCoreUpdateParam),  "initTargetPhase:withPolicy:",  9LL,  *(void *)(a1 + 48));
  [v4 postEvent:@"TargetPrepared" withInfo:v3];
}

- (void)targetApplied:(id)a3
{
  id v4 = a3;
  [MEMORY[0x189612760] beginTransactionWithName:@"update.Transaction"];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 extendedStateQueue];
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __30__SUCoreUpdate_targetApplied___block_invoke;
  block[3] = &unk_18A0F03C8;
  block[4] = self;
  id v11 = v5;
  id v12 = v4;
  id v8 = v4;
  id v9 = v5;
  dispatch_async(v7, block);
}

void __30__SUCoreUpdate_targetApplied___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2) {
    [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 40) withName:@"update.Transaction"];
  }
  else {
    [*(id *)(a1 + 32) setUpdateTransaction:*(void *)(a1 + 40)];
  }
  [*(id *)(a1 + 32) updateFSM];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = -[SUCoreUpdateParam initTargetPhase:withPolicy:]( objc_alloc(&OBJC_CLASS___SUCoreUpdateParam),  "initTargetPhase:withPolicy:",  10LL,  *(void *)(a1 + 48));
  [v4 postEvent:@"TargetApplied" withInfo:v3];
}

- (void)targetRollback:(id)a3
{
  id v4 = a3;
  [MEMORY[0x189612760] beginTransactionWithName:@"update.Transaction"];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 extendedStateQueue];
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __31__SUCoreUpdate_targetRollback___block_invoke;
  block[3] = &unk_18A0F03C8;
  block[4] = self;
  id v11 = v5;
  id v12 = v4;
  id v8 = v4;
  id v9 = v5;
  dispatch_async(v7, block);
}

void __31__SUCoreUpdate_targetRollback___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2) {
    [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 40) withName:@"update.Transaction"];
  }
  else {
    [*(id *)(a1 + 32) setUpdateTransaction:*(void *)(a1 + 40)];
  }
  [*(id *)(a1 + 32) updateFSM];
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = objc_alloc(&OBJC_CLASS___SUCoreUpdateParam);
  [*(id *)(a1 + 32) rollbackControl];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v5 = -[SUCoreUpdateParam initWithRollback:withPolicy:](v3, "initWithRollback:withPolicy:", v4, *(void *)(a1 + 48));
  [v6 postEvent:@"TargetRollback" withInfo:v5];
}

- (void)resumeCurrentUpdate
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 extendedStateQueue];
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __35__SUCoreUpdate_resumeCurrentUpdate__block_invoke;
  v7[3] = &unk_18A0F0510;
  v7[4] = self;
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, v7);
}

void __35__SUCoreUpdate_resumeCurrentUpdate__block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2) {
    [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 40) withName:@"update.Transaction"];
  }
  else {
    [*(id *)(a1 + 32) setUpdateTransaction:*(void *)(a1 + 40)];
  }
  [*(id *)(a1 + 32) updateFSM];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = -[SUCoreUpdateParam initTargetPhase:withPolicy:]( objc_alloc(&OBJC_CLASS___SUCoreUpdateParam),  "initTargetPhase:withPolicy:",  1LL,  0LL);
  [v4 postEvent:@"ResumeCurrentUpdate" withInfo:v3];
}

- (void)cancelCurrentUpdate
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 extendedStateQueue];
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __35__SUCoreUpdate_cancelCurrentUpdate__block_invoke;
  v7[3] = &unk_18A0F0510;
  v7[4] = self;
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, v7);
}

void __35__SUCoreUpdate_cancelCurrentUpdate__block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2) {
    [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 40) withName:@"update.Transaction"];
  }
  else {
    [*(id *)(a1 + 32) setUpdateTransaction:*(void *)(a1 + 40)];
  }
  [MEMORY[0x189612760] sharedCore];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 buildError:8124 underlying:0 description:@"update attempt was canceled"];
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  [*(id *)(a1 + 32) _trackUpdateError:@"cancelCurrentUpdate" forReason:0 error:v6];
  [*(id *)(a1 + 32) updateFSM];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v5 = -[SUCoreUpdateParam initTargetPhase:withPolicy:]( objc_alloc(&OBJC_CLASS___SUCoreUpdateParam),  "initTargetPhase:withPolicy:",  1LL,  0LL);
  [v4 postEvent:@"CancelCurrentUpdate" withInfo:v5];
}

- (id)copyCurrentState
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  id v3 = (void *)[v2 copyCurrentState];

  return v3;
}

- (id)rollbackAvailable
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 eligibleRollback];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)previousRollback
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 previousRollback];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_updateBrainLoadProgress:(id)a3
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[SUCoreUpdate updateDelegate](self, "updateDelegate");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[SUCoreUpdate clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __41__SUCoreUpdate__updateBrainLoadProgress___block_invoke;
    v10[3] = &unk_18A0F0510;
    v10[4] = self;
    id v11 = v4;
    dispatch_async(v7, v10);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 oslog];
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v13 = self;
      __int16 v14 = 2114;
      id v15 = v4;
      _os_log_impl( &dword_187A54000,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@ delegate does not respond to selector(updateBrainLoadProgress:) so not reporting progress=%{public}@",  buf,  0x16u);
    }
  }
}

void __41__SUCoreUpdate__updateBrainLoadProgress___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 updateBrainLoadProgress:*(void *)(a1 + 40)];
}

- (void)_updateBrainLoadStalled:(id)a3
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[SUCoreUpdate updateDelegate](self, "updateDelegate");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[SUCoreUpdate clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __40__SUCoreUpdate__updateBrainLoadStalled___block_invoke;
    v10[3] = &unk_18A0F0510;
    v10[4] = self;
    id v11 = v4;
    dispatch_async(v7, v10);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 oslog];
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v13 = self;
      __int16 v14 = 2114;
      id v15 = v4;
      _os_log_impl( &dword_187A54000,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@ delegate does not respond to selector(updateBrainLoadStalled:) so not reporting progress=%{public}@",  buf,  0x16u);
    }
  }
}

void __40__SUCoreUpdate__updateBrainLoadStalled___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 updateBrainLoadStalled:*(void *)(a1 + 40)];
}

- (void)_updateBrainLoaded:(id)a3
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (-[SUCoreUpdate targetPhase](self, "targetPhase") > 3)
  {
    id v5 = 0LL;
  }

  else
  {
    -[SUCoreUpdate updateTransaction](self, "updateTransaction");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreUpdate setUpdateTransaction:](self, "setUpdateTransaction:", 0LL);
  }

  -[SUCoreUpdate updateDelegate](self, "updateDelegate");
  char v6 = (void *)objc_claimAutoreleasedReturnValue();
  char v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[SUCoreUpdate clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __35__SUCoreUpdate__updateBrainLoaded___block_invoke;
    block[3] = &unk_18A0F03C8;
    block[4] = self;
    id v12 = v4;
    id v13 = v5;
    dispatch_async(v8, block);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 oslog];
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v15 = self;
      __int16 v16 = 2114;
      id v17 = v4;
      _os_log_impl( &dword_187A54000,  v10,  OS_LOG_TYPE_DEFAULT,  "%{public}@ delegate does not respond to selector(updateBrainLoaded:) so not reporting progress=%{public}@",  buf,  0x16u);
    }

    if (v5) {
      [MEMORY[0x189612760] endTransaction:v5 withName:@"update.Transaction"];
    }
  }
}

void __35__SUCoreUpdate__updateBrainLoaded___block_invoke(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 updateBrainLoaded:*(void *)(a1 + 40)];

  uint64_t v3 = *(void *)(a1 + 48);
  if (v3) {
    [MEMORY[0x189612760] endTransaction:v3 withName:@"update.Transaction"];
  }
}

- (void)_updateAssetDownloadPreflighted
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  if (-[SUCoreUpdate targetPhase](self, "targetPhase") > 4)
  {
    uint64_t v3 = 0LL;
  }

  else
  {
    -[SUCoreUpdate updateTransaction](self, "updateTransaction");
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreUpdate setUpdateTransaction:](self, "setUpdateTransaction:", 0LL);
  }

  -[SUCoreUpdate updateDelegate](self, "updateDelegate");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[SUCoreUpdate clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    char v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 3221225472LL;
    v9[2] = __47__SUCoreUpdate__updateAssetDownloadPreflighted__block_invoke;
    v9[3] = &unk_18A0F0510;
    v9[4] = self;
    id v10 = v3;
    dispatch_async(v6, v9);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    char v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 oslog];
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v12 = self;
      _os_log_impl( &dword_187A54000,  v8,  OS_LOG_TYPE_DEFAULT,  "%{public}@ delegate does not respond to selector(updateAssetDownloadPreflighted) so not reporting",  buf,  0xCu);
    }

    if (v3) {
      [MEMORY[0x189612760] endTransaction:v3 withName:@"update.Transaction"];
    }
  }
}

void __47__SUCoreUpdate__updateAssetDownloadPreflighted__block_invoke(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 updateAssetDownloadPreflighted];

  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    [MEMORY[0x189612760] endTransaction:v3 withName:@"update.Transaction"];
  }
}

- (void)_updateAssetDownloadProgress:(id)a3
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[SUCoreUpdate updateDelegate](self, "updateDelegate");
  char v5 = (void *)objc_claimAutoreleasedReturnValue();
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[SUCoreUpdate clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    char v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __45__SUCoreUpdate__updateAssetDownloadProgress___block_invoke;
    v10[3] = &unk_18A0F0510;
    v10[4] = self;
    id v11 = v4;
    dispatch_async(v7, v10);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 oslog];
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v13 = self;
      __int16 v14 = 2114;
      id v15 = v4;
      _os_log_impl( &dword_187A54000,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@ delegate does not respond to selector(updateAssetDownloadProgress:) so not reporting progress=%{public}@",  buf,  0x16u);
    }
  }
}

void __45__SUCoreUpdate__updateAssetDownloadProgress___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 updateAssetDownloadProgress:*(void *)(a1 + 40)];
}

- (void)_updateAssetDownloadStalled:(id)a3
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[SUCoreUpdate updateDelegate](self, "updateDelegate");
  char v5 = (void *)objc_claimAutoreleasedReturnValue();
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[SUCoreUpdate clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    char v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __44__SUCoreUpdate__updateAssetDownloadStalled___block_invoke;
    v10[3] = &unk_18A0F0510;
    v10[4] = self;
    id v11 = v4;
    dispatch_async(v7, v10);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 oslog];
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v13 = self;
      __int16 v14 = 2114;
      id v15 = v4;
      _os_log_impl( &dword_187A54000,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@ delegate does not respond to selector(updateAssetDownloadStalled:) so not reporting progress=%{public}@",  buf,  0x16u);
    }
  }
}

void __44__SUCoreUpdate__updateAssetDownloadStalled___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 updateAssetDownloadStalled:*(void *)(a1 + 40)];
}

- (void)_updateAssetDownloaded:(id)a3
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (-[SUCoreUpdate targetPhase](self, "targetPhase") > 6)
  {
    char v5 = 0LL;
  }

  else
  {
    -[SUCoreUpdate updateTransaction](self, "updateTransaction");
    char v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreUpdate setUpdateTransaction:](self, "setUpdateTransaction:", 0LL);
  }

  -[SUCoreUpdate updateDelegate](self, "updateDelegate");
  char v6 = (void *)objc_claimAutoreleasedReturnValue();
  char v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[SUCoreUpdate clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __39__SUCoreUpdate__updateAssetDownloaded___block_invoke;
    block[3] = &unk_18A0F03C8;
    block[4] = self;
    id v12 = v4;
    id v13 = v5;
    dispatch_async(v8, block);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 oslog];
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v15 = self;
      __int16 v16 = 2114;
      id v17 = v4;
      _os_log_impl( &dword_187A54000,  v10,  OS_LOG_TYPE_DEFAULT,  "%{public}@ delegate does not respond to selector(updateAssetDownloaded:) so not reporting progress=%{public}@",  buf,  0x16u);
    }

    if (v5) {
      [MEMORY[0x189612760] endTransaction:v5 withName:@"update.Transaction"];
    }
  }
}

void __39__SUCoreUpdate__updateAssetDownloaded___block_invoke(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 updateAssetDownloaded:*(void *)(a1 + 40)];

  uint64_t v3 = *(void *)(a1 + 48);
  if (v3) {
    [MEMORY[0x189612760] endTransaction:v3 withName:@"update.Transaction"];
  }
}

- (void)_updatePrepareProgress:(id)a3
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[SUCoreUpdate updateDelegate](self, "updateDelegate");
  char v5 = (void *)objc_claimAutoreleasedReturnValue();
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[SUCoreUpdate clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    char v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __39__SUCoreUpdate__updatePrepareProgress___block_invoke;
    v10[3] = &unk_18A0F0510;
    v10[4] = self;
    id v11 = v4;
    dispatch_async(v7, v10);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 oslog];
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v13 = self;
      __int16 v14 = 2114;
      id v15 = v4;
      _os_log_impl( &dword_187A54000,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@ delegate does not respond to selector(updatePrepareProgress:) so not reporting progress=%{public}@",  buf,  0x16u);
    }
  }
}

void __39__SUCoreUpdate__updatePrepareProgress___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 updatePrepareProgress:*(void *)(a1 + 40)];
}

- (void)_updatePrepared:(id)a3
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (-[SUCoreUpdate targetPhase](self, "targetPhase") > 7)
  {
    char v5 = 0LL;
  }

  else
  {
    -[SUCoreUpdate updateTransaction](self, "updateTransaction");
    char v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreUpdate setUpdateTransaction:](self, "setUpdateTransaction:", 0LL);
  }

  -[SUCoreUpdate updateDelegate](self, "updateDelegate");
  char v6 = (void *)objc_claimAutoreleasedReturnValue();
  char v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[SUCoreUpdate clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __32__SUCoreUpdate__updatePrepared___block_invoke;
    block[3] = &unk_18A0F03C8;
    block[4] = self;
    id v12 = v4;
    id v13 = v5;
    dispatch_async(v8, block);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 oslog];
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v15 = self;
      __int16 v16 = 2114;
      id v17 = v4;
      _os_log_impl( &dword_187A54000,  v10,  OS_LOG_TYPE_DEFAULT,  "%{public}@ delegate does not respond to selector(updatePrepared:) so not reporting progress=%{public}@",  buf,  0x16u);
    }

    if (v5) {
      [MEMORY[0x189612760] endTransaction:v5 withName:@"update.Transaction"];
    }
  }
}

void __32__SUCoreUpdate__updatePrepared___block_invoke(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 updatePrepared:*(void *)(a1 + 40)];

  uint64_t v3 = *(void *)(a1 + 48);
  if (v3) {
    [MEMORY[0x189612760] endTransaction:v3 withName:@"update.Transaction"];
  }
}

- (void)_updateCurrentResumed
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  -[SUCoreUpdate updateTransaction](self, "updateTransaction");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreUpdate setUpdateTransaction:](self, "setUpdateTransaction:", 0LL);
  -[SUCoreUpdate updateDelegate](self, "updateDelegate");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[SUCoreUpdate clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    char v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 3221225472LL;
    v9[2] = __37__SUCoreUpdate__updateCurrentResumed__block_invoke;
    v9[3] = &unk_18A0F0510;
    v9[4] = self;
    id v10 = v3;
    dispatch_async(v6, v9);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    char v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 oslog];
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v12 = self;
      _os_log_impl( &dword_187A54000,  v8,  OS_LOG_TYPE_DEFAULT,  "%{public}@ delegate does not respond to selector(updateCurrentResumed) so not reporting",  buf,  0xCu);
    }

    if (v3) {
      [MEMORY[0x189612760] endTransaction:v3 withName:@"update.Transaction"];
    }
  }
}

void __37__SUCoreUpdate__updateCurrentResumed__block_invoke(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 updateCurrentResumed];

  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    [MEMORY[0x189612760] endTransaction:v3 withName:@"update.Transaction"];
  }
}

- (void)_updateCurrentResumeFailed:(id)a3
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[SUCoreUpdate updateTransaction](self, "updateTransaction");
  char v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreUpdate setUpdateTransaction:](self, "setUpdateTransaction:", 0LL);
  -[SUCoreUpdate updateDelegate](self, "updateDelegate");
  char v6 = (void *)objc_claimAutoreleasedReturnValue();
  char v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[SUCoreUpdate failedAttemptError](self, "failedAttemptError");
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    if (!v8) {
      id v8 = v4;
    }
    -[SUCoreUpdate clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __43__SUCoreUpdate__updateCurrentResumeFailed___block_invoke;
    block[3] = &unk_18A0F03C8;
    block[4] = self;
    id v14 = v8;
    id v15 = v5;
    id v10 = v8;
    dispatch_async(v9, block);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 oslog];
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v17 = self;
      __int16 v18 = 2114;
      id v19 = v4;
      _os_log_impl( &dword_187A54000,  v12,  OS_LOG_TYPE_DEFAULT,  "%{public}@ delegate does not respond to selector(updateCurrentResumeFailed:) so not reporting error=%{public}@",  buf,  0x16u);
    }

    [MEMORY[0x189612760] endTransaction:v5 withName:@"update.Transaction"];
  }
}

uint64_t __43__SUCoreUpdate__updateCurrentResumeFailed___block_invoke(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 updateCurrentResumeFailed:*(void *)(a1 + 40)];

  return [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 48) withName:@"update.Transaction"];
}

- (void)_updateApplyProgress:(id)a3
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[SUCoreUpdate updateDelegate](self, "updateDelegate");
  char v5 = (void *)objc_claimAutoreleasedReturnValue();
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[SUCoreUpdate clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    char v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __37__SUCoreUpdate__updateApplyProgress___block_invoke;
    v10[3] = &unk_18A0F0510;
    v10[4] = self;
    id v11 = v4;
    dispatch_async(v7, v10);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 oslog];
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v13 = self;
      __int16 v14 = 2114;
      id v15 = v4;
      _os_log_impl( &dword_187A54000,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@ delegate does not respond to selector(updateApplyProgress:) so not reporting progress=%{public}@",  buf,  0x16u);
    }
  }
}

void __37__SUCoreUpdate__updateApplyProgress___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 updateApplyProgress:*(void *)(a1 + 40)];
}

- (void)_updateApplied
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  if (-[SUCoreUpdate targetPhase](self, "targetPhase") > 10)
  {
    uint64_t v3 = 0LL;
  }

  else
  {
    -[SUCoreUpdate updateTransaction](self, "updateTransaction");
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreUpdate setUpdateTransaction:](self, "setUpdateTransaction:", 0LL);
  }

  -[SUCoreUpdate updateDelegate](self, "updateDelegate");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[SUCoreUpdate clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    char v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 3221225472LL;
    v9[2] = __30__SUCoreUpdate__updateApplied__block_invoke;
    v9[3] = &unk_18A0F0510;
    v9[4] = self;
    id v10 = v3;
    dispatch_async(v6, v9);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    char v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 oslog];
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v12 = self;
      _os_log_impl( &dword_187A54000,  v8,  OS_LOG_TYPE_DEFAULT,  "%{public}@ delegate does not respond to selector(updateApplied:) so not reporting",  buf,  0xCu);
    }

    if (v3) {
      [MEMORY[0x189612760] endTransaction:v3 withName:@"update.Transaction"];
    }
  }
}

void __30__SUCoreUpdate__updateApplied__block_invoke(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 updateApplied];

  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    [MEMORY[0x189612760] endTransaction:v3 withName:@"update.Transaction"];
  }
}

- (void)_applyAttemptFailed:(id)a3
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[SUCoreUpdate updateTransaction](self, "updateTransaction");
  char v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreUpdate setUpdateTransaction:](self, "setUpdateTransaction:", 0LL);
  -[SUCoreUpdate updateDelegate](self, "updateDelegate");
  char v6 = (void *)objc_claimAutoreleasedReturnValue();
  char v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[SUCoreUpdate failedAttemptError](self, "failedAttemptError");
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    if (!v8) {
      id v8 = v4;
    }
    -[SUCoreUpdate clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __36__SUCoreUpdate__applyAttemptFailed___block_invoke;
    block[3] = &unk_18A0F03C8;
    block[4] = self;
    id v14 = v8;
    id v15 = v5;
    id v10 = v8;
    dispatch_async(v9, block);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 oslog];
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v17 = self;
      __int16 v18 = 2114;
      id v19 = v4;
      _os_log_impl( &dword_187A54000,  v12,  OS_LOG_TYPE_DEFAULT,  "%{public}@ delegate does not respond to selector(applyAttemptFailed:) so not reporting error=%{public}@",  buf,  0x16u);
    }

    [MEMORY[0x189612760] endTransaction:v5 withName:@"update.Transaction"];
  }
}

uint64_t __36__SUCoreUpdate__applyAttemptFailed___block_invoke(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 applyAttemptFailed:*(void *)(a1 + 40)];

  return [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 48) withName:@"update.Transaction"];
}

- (void)_updateAttemptFailed:(id)a3
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[SUCoreUpdate updateTransaction](self, "updateTransaction");
  char v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreUpdate setUpdateTransaction:](self, "setUpdateTransaction:", 0LL);
  -[SUCoreUpdate updateDelegate](self, "updateDelegate");
  char v6 = (void *)objc_claimAutoreleasedReturnValue();
  char v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[SUCoreUpdate failedAttemptError](self, "failedAttemptError");
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    if (!v8) {
      id v8 = v4;
    }
    -[SUCoreUpdate clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __37__SUCoreUpdate__updateAttemptFailed___block_invoke;
    block[3] = &unk_18A0F03C8;
    block[4] = self;
    id v14 = v8;
    id v15 = v5;
    id v10 = v8;
    dispatch_async(v9, block);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 oslog];
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v17 = self;
      __int16 v18 = 2114;
      id v19 = v4;
      _os_log_impl( &dword_187A54000,  v12,  OS_LOG_TYPE_DEFAULT,  "%{public}@ delegate does not respond to selector(updateAttemptFailed:) so not reporting error=%{public}@",  buf,  0x16u);
    }

    [MEMORY[0x189612760] endTransaction:v5 withName:@"update.Transaction"];
  }
}

uint64_t __37__SUCoreUpdate__updateAttemptFailed___block_invoke(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 updateAttemptFailed:*(void *)(a1 + 40)];

  return [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 48) withName:@"update.Transaction"];
}

- (void)_updateCanceled
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  -[SUCoreUpdate updateTransaction](self, "updateTransaction");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreUpdate setUpdateTransaction:](self, "setUpdateTransaction:", 0LL);
  -[SUCoreUpdate updateDelegate](self, "updateDelegate");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[SUCoreUpdate clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    char v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 3221225472LL;
    v9[2] = __31__SUCoreUpdate__updateCanceled__block_invoke;
    v9[3] = &unk_18A0F0510;
    v9[4] = self;
    id v10 = v3;
    dispatch_async(v6, v9);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    char v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 oslog];
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v12 = self;
      _os_log_impl( &dword_187A54000,  v8,  OS_LOG_TYPE_DEFAULT,  "%{public}@ delegate does not respond to selector(updateCanceled) so not reporting",  buf,  0xCu);
    }

    [MEMORY[0x189612760] endTransaction:v3 withName:@"update.Transaction"];
  }
}

uint64_t __31__SUCoreUpdate__updateCanceled__block_invoke(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 updateCanceled];

  return [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 40) withName:@"update.Transaction"];
}

- (void)_updateAnomaly:(id)a3
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[SUCoreUpdate updateDelegate](self, "updateDelegate");
  char v5 = (void *)objc_claimAutoreleasedReturnValue();
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[SUCoreUpdate clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    char v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __31__SUCoreUpdate__updateAnomaly___block_invoke;
    v10[3] = &unk_18A0F0510;
    v10[4] = self;
    id v11 = v4;
    dispatch_async(v7, v10);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 oslog];
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v13 = self;
      __int16 v14 = 2114;
      id v15 = v4;
      _os_log_impl( &dword_187A54000,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@ delegate does not respond to selector(updateAnomaly:) so not reporting error=%{public}@",  buf,  0x16u);
    }
  }
}

void __31__SUCoreUpdate__updateAnomaly___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 updateAnomaly:*(void *)(a1 + 40)];
}

- (void)_updateRolledBack:(id)a3
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (-[SUCoreUpdate targetPhase](self, "targetPhase") > 11)
  {
    char v5 = 0LL;
  }

  else
  {
    -[SUCoreUpdate updateTransaction](self, "updateTransaction");
    char v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreUpdate setUpdateTransaction:](self, "setUpdateTransaction:", 0LL);
  }

  -[SUCoreUpdate updateDelegate](self, "updateDelegate");
  char v6 = (void *)objc_claimAutoreleasedReturnValue();
  char v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[SUCoreUpdate clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __34__SUCoreUpdate__updateRolledBack___block_invoke;
    block[3] = &unk_18A0F03C8;
    id v12 = v4;
    uint64_t v13 = self;
    id v14 = v5;
    dispatch_async(v8, block);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 oslog];
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v16 = self;
      _os_log_impl( &dword_187A54000,  v10,  OS_LOG_TYPE_DEFAULT,  "%{public}@ delegate does not respond to selector(updateRolledBack:) so not reporting",  buf,  0xCu);
    }

    if (v5) {
      [MEMORY[0x189612760] endTransaction:v5 withName:@"update.Transaction"];
    }
  }
}

void __34__SUCoreUpdate__updateRolledBack___block_invoke(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 updateRolledBack:*(void *)(a1 + 32)];

  uint64_t v3 = *(void *)(a1 + 48);
  if (v3) {
    [MEMORY[0x189612760] endTransaction:v3 withName:@"update.Transaction"];
  }
}

- (void)_rollbackAttemptFailed:(id)a3 withError:(id)a4
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  -[SUCoreUpdate updateTransaction](self, "updateTransaction");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreUpdate setUpdateTransaction:](self, "setUpdateTransaction:", 0LL);
  -[SUCoreUpdate updateDelegate](self, "updateDelegate");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  char v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[SUCoreUpdate failedAttemptError](self, "failedAttemptError");
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    if (!v11) {
      id v11 = v7;
    }
    -[SUCoreUpdate clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1895F87A8];
    v16[1] = 3221225472LL;
    v16[2] = __49__SUCoreUpdate__rollbackAttemptFailed_withError___block_invoke;
    v16[3] = &unk_18A0F10C8;
    v16[4] = self;
    id v17 = v6;
    id v18 = v11;
    id v19 = v8;
    id v13 = v11;
    dispatch_async(v12, v16);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 oslog];
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v21 = self;
      __int16 v22 = 2114;
      id v23 = v7;
      _os_log_impl( &dword_187A54000,  v15,  OS_LOG_TYPE_DEFAULT,  "%{public}@ delegate does not respond to selector(rollbackAttemptFailed:) so not reporting error=%{public}@",  buf,  0x16u);
    }

    [MEMORY[0x189612760] endTransaction:v8 withName:@"update.Transaction"];
  }
}

uint64_t __49__SUCoreUpdate__rollbackAttemptFailed_withError___block_invoke(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 rollbackAttemptFailed:*(void *)(a1 + 40) withError:*(void *)(a1 + 48)];

  return [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 56) withName:@"update.Transaction"];
}

- (void)msuBrainLoadProgress:(id)a3
{
  id v4 = a3;
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  char v5 = -[SUCoreUpdateParam initWithDownloadProgress:]( objc_alloc(&OBJC_CLASS___SUCoreUpdateParam),  "initWithDownloadProgress:",  v4);

  [v6 postEvent:@"BrainLoadProgress" withInfo:v5];
}

- (void)msuBrainLoadStalled:(id)a3
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  [MEMORY[0x1896127A0] sharedLogger];
  char v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 oslog];
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[SUCoreUpdate updateName](self, "updateName");
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    int v8 = 138543618;
    id v9 = v7;
    __int16 v10 = 2114;
    id v11 = v4;
    _os_log_impl( &dword_187A54000,  v6,  OS_LOG_TYPE_DEFAULT,  "[UPDATE(%{public}@)] msuBrainLoadStalled - not being reported to policy layer progress=%{public}@",  (uint8_t *)&v8,  0x16u);
  }
}

- (void)msuBrainLoaded:(id)a3
{
  id v4 = a3;
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  char v5 = -[SUCoreUpdateParam initWithDownloadProgress:]( objc_alloc(&OBJC_CLASS___SUCoreUpdateParam),  "initWithDownloadProgress:",  v4);

  [v6 postEvent:@"BrainLoadSuccess" withInfo:v5];
}

- (void)msuBrainLoadFailed:(id)a3
{
  id v4 = a3;
  -[SUCoreUpdate _trackUpdateError:forReason:error:]( self,  "_trackUpdateError:forReason:error:",  @"msuBrainLoadFailed",  0LL,  v4);
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  char v5 = -[SUCoreUpdateParam initWithError:](objc_alloc(&OBJC_CLASS___SUCoreUpdateParam), "initWithError:", v4);

  [v6 postEvent:@"BrainLoadFailed" withInfo:v5];
}

- (void)msuSUDownloadPreflighted
{
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = objc_alloc_init(&OBJC_CLASS___SUCoreUpdateParam);
  [v3 postEvent:@"PreflightSuccess" withInfo:v2];
}

- (void)msuSUDownloadPreflightFailed:(id)a3
{
  id v4 = a3;
  -[SUCoreUpdate _trackUpdateError:forReason:error:]( self,  "_trackUpdateError:forReason:error:",  @"msuSUDownloadPreflightFailed",  0LL,  v4);
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  char v5 = -[SUCoreUpdateParam initWithError:](objc_alloc(&OBJC_CLASS___SUCoreUpdateParam), "initWithError:", v4);

  [v6 postEvent:@"PreflightFailed" withInfo:v5];
}

- (void)msuPrepareProgress:(id)a3
{
  id v4 = a3;
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  char v5 = -[SUCoreUpdateParam initWithPrepareProgress:]( objc_alloc(&OBJC_CLASS___SUCoreUpdateParam),  "initWithPrepareProgress:",  v4);

  [v6 postEvent:@"PrepareProgress" withInfo:v5];
}

- (void)msuPrepared:(id)a3
{
  id v4 = a3;
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  char v5 = -[SUCoreUpdateParam initWithPrepareProgress:]( objc_alloc(&OBJC_CLASS___SUCoreUpdateParam),  "initWithPrepareProgress:",  v4);

  [v6 postEvent:@"PrepareSuccess" withInfo:v5];
}

- (void)msuPrepareFailed:(id)a3
{
  id v4 = a3;
  -[SUCoreUpdate _trackUpdateError:forReason:error:]( self,  "_trackUpdateError:forReason:error:",  @"msuPrepareFailed",  0LL,  v4);
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  char v5 = -[SUCoreUpdateParam initWithError:](objc_alloc(&OBJC_CLASS___SUCoreUpdateParam), "initWithError:", v4);

  [v6 postEvent:@"PrepareFailed" withInfo:v5];
}

- (void)msuSuspended
{
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = objc_alloc_init(&OBJC_CLASS___SUCoreUpdateParam);
  [v3 postEvent:@"SuspendSuccess" withInfo:v2];
}

- (void)msuSuspendFailed:(id)a3
{
  id v4 = a3;
  -[SUCoreUpdate _trackUpdateError:forReason:error:]( self,  "_trackUpdateError:forReason:error:",  @"msuSuspendFailed",  0LL,  v4);
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  char v5 = -[SUCoreUpdateParam initWithError:](objc_alloc(&OBJC_CLASS___SUCoreUpdateParam), "initWithError:", v4);

  [v6 postEvent:@"SuspendFailed" withInfo:v5];
}

- (void)msuResumed
{
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = objc_alloc_init(&OBJC_CLASS___SUCoreUpdateParam);
  [v3 postEvent:@"ResumeSuccess" withInfo:v2];
}

- (void)msuResumeFailed:(id)a3
{
  id v4 = a3;
  -[SUCoreUpdate _trackUpdateError:forReason:error:]( self,  "_trackUpdateError:forReason:error:",  @"msuResumeFailed",  0LL,  v4);
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  char v5 = -[SUCoreUpdateParam initWithError:](objc_alloc(&OBJC_CLASS___SUCoreUpdateParam), "initWithError:", v4);

  [v6 postEvent:@"ResumeFailed" withInfo:v5];
}

- (void)msuApplyProgress:(id)a3
{
  id v4 = a3;
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  char v5 = -[SUCoreUpdateParam initWithApplyProgress:]( objc_alloc(&OBJC_CLASS___SUCoreUpdateParam),  "initWithApplyProgress:",  v4);

  [v6 postEvent:@"ApplyProgress" withInfo:v5];
}

- (void)msuApplied
{
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = objc_alloc_init(&OBJC_CLASS___SUCoreUpdateParam);
  [v3 postEvent:@"ApplySuccess" withInfo:v2];
}

- (void)msuApplyFailed:(id)a3
{
  id v4 = a3;
  -[SUCoreUpdate _trackUpdateError:forReason:error:]( self,  "_trackUpdateError:forReason:error:",  @"msuApplyFailed",  0LL,  v4);
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  char v5 = -[SUCoreUpdateParam initWithError:](objc_alloc(&OBJC_CLASS___SUCoreUpdateParam), "initWithError:", v4);

  [v6 postEvent:@"ApplyFailed" withInfo:v5];
}

- (void)msuRollbackPrepareSuccess
{
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = objc_alloc(&OBJC_CLASS___SUCoreUpdateParam);
  -[SUCoreUpdate rollbackControl](self, "rollbackControl");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v5 = -[SUCoreUpdateParam initWithRollback:withError:](v3, "initWithRollback:withError:", v4, 0LL);
  [v6 postEvent:@"RB_RollbackPrepareSuccess" withInfo:v5];
}

- (void)msuRollbackSuspendSuccess
{
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = objc_alloc(&OBJC_CLASS___SUCoreUpdateParam);
  -[SUCoreUpdate rollbackControl](self, "rollbackControl");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v5 = -[SUCoreUpdateParam initWithRollback:withError:](v3, "initWithRollback:withError:", v4, 0LL);
  [v6 postEvent:@"RB_RollbackSuspendSuccess" withInfo:v5];
}

- (void)msuRollbackResumeSuccess
{
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = objc_alloc(&OBJC_CLASS___SUCoreUpdateParam);
  -[SUCoreUpdate rollbackControl](self, "rollbackControl");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v5 = -[SUCoreUpdateParam initWithRollback:withError:](v3, "initWithRollback:withError:", v4, 0LL);
  [v6 postEvent:@"RB_RollbackResumeSuccess" withInfo:v5];
}

- (void)msuRollbackApplySuccess
{
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = objc_alloc(&OBJC_CLASS___SUCoreUpdateParam);
  -[SUCoreUpdate rollbackControl](self, "rollbackControl");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v5 = -[SUCoreUpdateParam initWithRollback:withError:](v3, "initWithRollback:withError:", v4, 0LL);
  [v6 postEvent:@"RB_RollbackAppleSuccess" withInfo:v5];
}

- (void)msuRollbackApplyFailed:(id)a3
{
  id v4 = a3;
  -[SUCoreUpdate _trackUpdateError:forReason:error:]( self,  "_trackUpdateError:forReason:error:",  @"msuRollbackApplyFailed",  0LL,  v4);
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  char v5 = -[SUCoreUpdateParam initWithError:](objc_alloc(&OBJC_CLASS___SUCoreUpdateParam), "initWithError:", v4);

  [v6 postEvent:@"RB_RollbackApplyFailed" withInfo:v5];
}

- (void)msuRollbackFailed:(id)a3
{
  id v4 = a3;
  -[SUCoreUpdate _trackUpdateError:forReason:error:]( self,  "_trackUpdateError:forReason:error:",  @"msuRollbackFailed",  0LL,  v4);
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  char v5 = objc_alloc(&OBJC_CLASS___SUCoreUpdateParam);
  -[SUCoreUpdate rollbackControl](self, "rollbackControl");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = -[SUCoreUpdateParam initWithRollback:withError:](v5, "initWithRollback:withError:", v6, v4);

  [v8 postEvent:@"RB_RollbackFailed" withInfo:v7];
}

- (void)msuRemoved
{
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = objc_alloc_init(&OBJC_CLASS___SUCoreUpdateParam);
  [v3 postEvent:@"SURemoved" withInfo:v2];
}

- (void)msuRemoveFailed:(id)a3
{
  id v4 = a3;
  -[SUCoreUpdate _trackUpdateError:forReason:error:]( self,  "_trackUpdateError:forReason:error:",  @"msuRemoveFailed",  0LL,  v4);
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  char v5 = -[SUCoreUpdateParam initWithError:](objc_alloc(&OBJC_CLASS___SUCoreUpdateParam), "initWithError:", v4);

  [v6 postEvent:@"SURemoved" withInfo:v5];
}

- (void)downloadProgress:(id)a3
{
  id v4 = a3;
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  char v5 = -[SUCoreUpdateParam initWithDownloadProgress:]( objc_alloc(&OBJC_CLASS___SUCoreUpdateParam),  "initWithDownloadProgress:",  v4);

  [v6 postEvent:@"DownloadProgress" withInfo:v5];
}

- (void)downloadStalled:(id)a3
{
  id v4 = a3;
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  char v5 = -[SUCoreUpdateParam initWithDownloadProgress:]( objc_alloc(&OBJC_CLASS___SUCoreUpdateParam),  "initWithDownloadProgress:",  v4);

  [v6 postEvent:@"DownloadStalled" withInfo:v5];
}

- (void)downloaded:(id)a3
{
  id v4 = a3;
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  char v5 = -[SUCoreUpdateParam initWithDownloadProgress:]( objc_alloc(&OBJC_CLASS___SUCoreUpdateParam),  "initWithDownloadProgress:",  v4);

  [v6 postEvent:@"DownloadSuccess" withInfo:v5];
}

- (void)downloadFailed:(id)a3
{
  id v4 = a3;
  -[SUCoreUpdate _trackUpdateError:forReason:error:]( self,  "_trackUpdateError:forReason:error:",  @"maDownloadFailed",  0LL,  v4);
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  char v5 = -[SUCoreUpdateParam initWithError:](objc_alloc(&OBJC_CLASS___SUCoreUpdateParam), "initWithError:", v4);

  [v6 postEvent:@"DownloadFailed" withInfo:v5];
}

- (void)updateRemoved
{
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = objc_alloc_init(&OBJC_CLASS___SUCoreUpdateParam);
  [v3 postEvent:@"SURemoved" withInfo:v2];
}

- (void)updateRemoveFailed:(id)a3
{
  id v4 = a3;
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  char v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 diag];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = (void *)[objc_alloc(NSString) initWithFormat:@"%@ remove failed (reported as removed)", self];
  objc_msgSend( v6,  "trackAnomaly:forReason:withResult:withError:",  @"MA-DELEGATE",  v7,  objc_msgSend(v4, "code"),  v4);

  -[SUCoreUpdate _trackUpdateError:forReason:error:]( self,  "_trackUpdateError:forReason:error:",  @"maAssetRemoveFailed",  0LL,  v4);
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = -[SUCoreUpdateParam initWithError:](objc_alloc(&OBJC_CLASS___SUCoreUpdateParam), "initWithError:", v4);

  [v9 postEvent:@"SURemoved" withInfo:v8];
}

- (void)anomaly:(id)a3
{
  id v4 = a3;
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v7 diag];
  char v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = (void *)[objc_alloc(NSString) initWithFormat:@"%@ anomaly", self];
  objc_msgSend( v5,  "trackAnomaly:forReason:withResult:withError:",  @"MA-DELEGATE",  v6,  objc_msgSend(v4, "code"),  v4);
}

- (void)_adjustTarget:(int64_t)a3 withPolicy:(id)a4
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v6 = a4;
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 extendedStateQueue];
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  if (a3)
  {
    if (-[SUCoreUpdate targetPhase](self, "targetPhase") <= a3)
    {
      -[SUCoreUpdate setTargetPhase:](self, "setTargetPhase:", a3);
      if (!v6) {
        goto LABEL_10;
      }
      goto LABEL_7;
    }

    id v9 = objc_alloc(NSString);
    +[SUCoreUpdateParam targetPhaseName:](&OBJC_CLASS___SUCoreUpdateParam, "targetPhaseName:", a3);
    __int16 v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[SUCoreUpdateParam targetPhaseName:]( &OBJC_CLASS___SUCoreUpdateParam,  "targetPhaseName:",  -[SUCoreUpdate targetPhase](self, "targetPhase"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = (void *)[v9 initWithFormat:@"target requested(%@) when targeting(%@) [no change to target]", v10, v11];

    -[SUCoreUpdate _trackUpdateAnomaly:result:description:]( self,  "_trackUpdateAnomaly:result:description:",  @"TARGET",  8116LL,  v12);
  }

  if (!v6) {
    goto LABEL_10;
  }
LABEL_7:
  -[SUCoreUpdate setPolicy:](self, "setPolicy:", v6);
  [MEMORY[0x1896127A0] sharedLogger];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 oslog];
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    -[SUCoreUpdate policy](self, "policy");
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    id v17 = self;
    __int16 v18 = 2112;
    id v19 = v15;
    _os_log_impl(&dword_187A54000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ adjusted policy: %@", buf, 0x16u);
  }

LABEL_10:
}

- (void)_eventAfterReachingPhase:(int64_t)a3
{
  uint64_t v73 = *MEMORY[0x1895F89C0];
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  char v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 extendedStateQueue];
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  switch(a3)
  {
    case 2LL:
      -[SUCoreUpdate policy](self, "policy");
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 loadBrainPolicy];
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      int v9 = [v8 skipPhase];

      if (!v9)
      {
        id v14 = kSU_E_PerformLoadBrain;
        goto LABEL_55;
      }

      [MEMORY[0x1896127A0] sharedLogger];
      __int16 v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 oslog];
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        +[SUCoreUpdateParam targetPhaseName:](&OBJC_CLASS___SUCoreUpdateParam, "targetPhaseName:", 2LL);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[SUCoreUpdateParam targetPhaseName:](&OBJC_CLASS___SUCoreUpdateParam, "targetPhaseName:", 3LL);
        id v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        uint64_t v68 = self;
        __int16 v69 = 2114;
        v70 = v12;
        __int16 v71 = 2114;
        id v72 = v13;
        _os_log_impl( &dword_187A54000,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}@ [REACHED_PHASE:%{public}@=>%{public}@] skipped load of update brain",  buf,  0x20u);
      }

      goto LABEL_6;
    case 3LL:
LABEL_6:
      if (-[SUCoreUpdate targetPhase](self, "targetPhase") >= 4)
      {
        -[SUCoreUpdate policy](self, "policy");
        id v15 = (void *)objc_claimAutoreleasedReturnValue();
        [v15 downloadPreflightPolicy];
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
        int v17 = [v16 skipPhase];

        if (v17)
        {
          [MEMORY[0x1896127A0] sharedLogger];
          __int16 v18 = (void *)objc_claimAutoreleasedReturnValue();
          [v18 oslog];
          id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            +[SUCoreUpdateParam targetPhaseName:](&OBJC_CLASS___SUCoreUpdateParam, "targetPhaseName:", a3);
            uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = +[SUCoreUpdateParam targetPhaseName:](&OBJC_CLASS___SUCoreUpdateParam, "targetPhaseName:", 4LL);
            *(_DWORD *)buf = 138543874;
            uint64_t v68 = self;
            __int16 v69 = 2114;
            v70 = v20;
            __int16 v71 = 2114;
            id v72 = v21;
            _os_log_impl( &dword_187A54000,  v19,  OS_LOG_TYPE_DEFAULT,  "%{public}@ [REACHED_PHASE:%{public}@=>%{public}@] skipped preflight of SU asset download",  buf,  0x20u);
          }

LABEL_12:
          if (-[SUCoreUpdate targetPhase](self, "targetPhase") >= 5)
          {
            -[SUCoreUpdate policy](self, "policy");
            __int16 v22 = (void *)objc_claimAutoreleasedReturnValue();
            char v23 = [v22 checkAvailableSpace];

            if ((v23 & 1) != 0)
            {
              id v14 = kSU_E_PerformDownloadSpaceCheck;
            }

            else
            {
              [MEMORY[0x1896127A0] sharedLogger];
              uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
              [v24 oslog];
              v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();

              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
              {
                +[SUCoreUpdateParam targetPhaseName:](&OBJC_CLASS___SUCoreUpdateParam, "targetPhaseName:", a3);
                id v26 = (void *)objc_claimAutoreleasedReturnValue();
                +[SUCoreUpdateParam targetPhaseName:](&OBJC_CLASS___SUCoreUpdateParam, "targetPhaseName:", 5LL);
                uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                uint64_t v68 = self;
                __int16 v69 = 2114;
                v70 = v26;
                __int16 v71 = 2114;
                id v72 = v27;
                _os_log_impl( &dword_187A54000,  v25,  OS_LOG_TYPE_DEFAULT,  "%{public}@ [REACHED_PHASE:%{public}@=>%{public}@] skipped check of available filesystem space",  buf,  0x20u);
              }

LABEL_21:
              v28 = -[SUCoreUpdate policy](self, "policy");
              [v28 softwareUpdateDownloadPolicy];
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              int v30 = [v29 skipPhase];

              if (v30)
              {
                [MEMORY[0x1896127A0] sharedLogger];
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                [v31 oslog];
                __int16 v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();

                if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                {
                  v33 = +[SUCoreUpdateParam targetPhaseName:](&OBJC_CLASS___SUCoreUpdateParam, "targetPhaseName:", a3);
                  +[SUCoreUpdateParam targetPhaseName:](&OBJC_CLASS___SUCoreUpdateParam, "targetPhaseName:", 6LL);
                  uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543874;
                  uint64_t v68 = self;
                  __int16 v69 = 2114;
                  v70 = v33;
                  __int16 v71 = 2114;
                  id v72 = v34;
                  _os_log_impl( &dword_187A54000,  v32,  OS_LOG_TYPE_DEFAULT,  "%{public}@ [REACHED_PHASE:%{public}@=>%{public}@] skipped download of SU asset",  buf,  0x20u);
                }

LABEL_25:
                if (-[SUCoreUpdate targetPhase](self, "targetPhase") >= 7)
                {
                  -[SUCoreUpdate policy](self, "policy");
                  uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
                  [v35 preparePolicy];
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  int v37 = [v36 skipPhase];

                  if (v37)
                  {
                    [MEMORY[0x1896127A0] sharedLogger];
                    v38 = (void *)objc_claimAutoreleasedReturnValue();
                    [v38 oslog];
                    v39 = (os_log_s *)objc_claimAutoreleasedReturnValue();

                    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
                    {
                      v40 = +[SUCoreUpdateParam targetPhaseName:](&OBJC_CLASS___SUCoreUpdateParam, "targetPhaseName:", a3);
                      v41 = +[SUCoreUpdateParam targetPhaseName:](&OBJC_CLASS___SUCoreUpdateParam, "targetPhaseName:", 7LL);
                      *(_DWORD *)buf = 138543874;
                      uint64_t v68 = self;
                      __int16 v69 = 2114;
                      v70 = v40;
                      __int16 v71 = 2114;
                      id v72 = v41;
                      _os_log_impl( &dword_187A54000,  v39,  OS_LOG_TYPE_DEFAULT,  "%{public}@ [REACHED_PHASE:%{public}@=>%{public}@] skipped prepare of update",  buf,  0x20u);
                    }

LABEL_31:
                    -[SUCoreUpdate policy](self, "policy");
                    id v42 = (void *)objc_claimAutoreleasedReturnValue();
                    [v42 suspendPolicy];
                    v43 = (void *)objc_claimAutoreleasedReturnValue();
                    int v44 = [v43 skipPhase];

                    if (v44)
                    {
                      [MEMORY[0x1896127A0] sharedLogger];
                      v45 = (void *)objc_claimAutoreleasedReturnValue();
                      [v45 oslog];
                      v46 = (os_log_s *)objc_claimAutoreleasedReturnValue();

                      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
                      {
                        v47 = +[SUCoreUpdateParam targetPhaseName:](&OBJC_CLASS___SUCoreUpdateParam, "targetPhaseName:", a3);
                        +[SUCoreUpdateParam targetPhaseName:](&OBJC_CLASS___SUCoreUpdateParam, "targetPhaseName:", 8LL);
                        BOOL v48 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138543874;
                        uint64_t v68 = self;
                        __int16 v69 = 2114;
                        v70 = v47;
                        __int16 v71 = 2114;
                        id v72 = v48;
                        _os_log_impl( &dword_187A54000,  v46,  OS_LOG_TYPE_DEFAULT,  "%{public}@ [REACHED_PHASE:%{public}@=>%{public}@] skipped suspend of prepared update",  buf,  0x20u);
                      }

LABEL_35:
                      if (-[SUCoreUpdate targetPhase](self, "targetPhase") >= 9)
                      {
                        v49 = -[SUCoreUpdate policy](self, "policy");
                        [v49 resumePolicy];
                        uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue();
                        int v51 = [v50 skipPhase];

                        if (v51)
                        {
                          [MEMORY[0x1896127A0] sharedLogger];
                          v52 = (void *)objc_claimAutoreleasedReturnValue();
                          [v52 oslog];
                          v53 = (os_log_s *)objc_claimAutoreleasedReturnValue();

                          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
                          {
                            v54 = +[SUCoreUpdateParam targetPhaseName:]( &OBJC_CLASS___SUCoreUpdateParam,  "targetPhaseName:",  a3);
                            v55 = +[SUCoreUpdateParam targetPhaseName:]( &OBJC_CLASS___SUCoreUpdateParam,  "targetPhaseName:",  9LL);
                            *(_DWORD *)buf = 138543874;
                            uint64_t v68 = self;
                            __int16 v69 = 2114;
                            v70 = v54;
                            __int16 v71 = 2114;
                            id v72 = v55;
                            _os_log_impl( &dword_187A54000,  v53,  OS_LOG_TYPE_DEFAULT,  "%{public}@ [REACHED_PHASE:%{public}@=>%{public}@] skipped resume of suspended update",  buf,  0x20u);
                          }

LABEL_41:
                          if (-[SUCoreUpdate targetPhase](self, "targetPhase") >= 10)
                          {
                            v56 = -[SUCoreUpdate policy](self, "policy");
                            [v56 applyPolicy];
                            v57 = (void *)objc_claimAutoreleasedReturnValue();
                            int v58 = [v57 skipPhase];

                            if (v58)
                            {
                              [MEMORY[0x1896127A0] sharedLogger];
                              v59 = (void *)objc_claimAutoreleasedReturnValue();
                              [v59 oslog];
                              uint64_t v60 = (os_log_s *)objc_claimAutoreleasedReturnValue();

                              if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
                              {
                                v61 = +[SUCoreUpdateParam targetPhaseName:]( &OBJC_CLASS___SUCoreUpdateParam,  "targetPhaseName:",  a3);
                                v62 = +[SUCoreUpdateParam targetPhaseName:]( &OBJC_CLASS___SUCoreUpdateParam,  "targetPhaseName:",  10LL);
                                *(_DWORD *)buf = 138543874;
                                uint64_t v68 = self;
                                __int16 v69 = 2114;
                                v70 = v61;
                                __int16 v71 = 2114;
                                id v72 = v62;
                                _os_log_impl( &dword_187A54000,  v60,  OS_LOG_TYPE_DEFAULT,  "%{public}@ [REACHED_PHASE:%{public}@=>%{public}@] skipped apply of update",  buf,  0x20u);
                              }

LABEL_47:
                              if (-[SUCoreUpdate targetPhase](self, "targetPhase") >= 11)
                              {
                                v63 = (__CFString *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"after reaching applied phase encountered invalid target phase(%ld)",  -[SUCoreUpdate targetPhase](self, "targetPhase"));
                                -[SUCoreUpdate _trackUpdateAnomaly:result:description:]( self,  "_trackUpdateAnomaly:result:description:",  @"[REACHED_PHASE]",  8116LL,  v63);
                                goto LABEL_57;
                              }

                              id v14 = kSU_E_ApplySuccess;
                            }

                            else
                            {
                              id v14 = kSU_E_PerformApply;
                            }
                          }

                          else
                          {
                            id v14 = kSU_E_ResumeSuccessAtTarget;
                          }
                        }

                        else
                        {
                          id v14 = kSU_E_PerformResume;
                        }
                      }

                      else
                      {
                        id v14 = kSU_E_SuspendSuccessAtTarget;
                      }
                    }

                    else
                    {
                      id v14 = kSU_E_PerformSuspend;
                    }
                  }

                  else
                  {
                    id v14 = kSU_E_PerformPrepare;
                  }
                }

                else
                {
                  id v14 = kSU_E_DownloadSuccessAtTarget;
                }
              }

              else
              {
                id v14 = kSU_E_PerformDownloadSU;
              }
            }
          }

          else
          {
            id v14 = kSU_E_PreflightSuccessAtTarget;
          }
        }

        else
        {
          id v14 = kSU_E_PerformPreflightDownloadSU;
        }
      }

      else
      {
        id v14 = kSU_E_BrainLoadSuccessAtTarget;
      }

- (void)_eventAfterReachingRollbackPhase:(int64_t)a3
{
  uint64_t v77 = *MEMORY[0x1895F89C0];
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  char v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 extendedStateQueue];
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  id v7 = kSU_E_RB_BeginRollback;
  switch(a3)
  {
    case 1LL:
      -[SUCoreUpdate policy](self, "policy");
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 rollbackPolicy];
      int v9 = (void *)objc_claimAutoreleasedReturnValue();
      int v10 = [v9 skipCancelPreviousUpdate];

      if (v10)
      {
        [MEMORY[0x1896127A0] sharedLogger];
        id v11 = (void *)objc_claimAutoreleasedReturnValue();
        [v11 oslog];
        uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          +[SUCoreUpdateParam targetRollbackPhaseName:]( &OBJC_CLASS___SUCoreUpdateParam,  "targetRollbackPhaseName:",  1LL);
          id v13 = (void *)objc_claimAutoreleasedReturnValue();
          +[SUCoreUpdateParam targetRollbackPhaseName:]( &OBJC_CLASS___SUCoreUpdateParam,  "targetRollbackPhaseName:",  2LL);
          id v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          id v72 = self;
          __int16 v73 = 2114;
          id v74 = v13;
          __int16 v75 = 2114;
          objc_super v76 = v14;
          _os_log_impl( &dword_187A54000,  v12,  OS_LOG_TYPE_DEFAULT,  "%{public}@ [REACHED_PHASE:%{public}@=>%{public}@] skipped cancel previous update of SU asset download before rollback",  buf,  0x20u);
        }

        id v7 = kSU_E_RB_BeginRollback;
      }

      else
      {
        id v7 = kSU_E_RB_CancelNonRollbackUpdate;
      }

      goto LABEL_47;
    case 2LL:
      goto LABEL_47;
    case 3LL:
      -[SUCoreUpdate policy](self, "policy");
      id v15 = (void *)objc_claimAutoreleasedReturnValue();
      [v15 loadBrainPolicy];
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
      int v17 = [v16 skipPhase];

      if (!v17)
      {
        id v7 = kSU_E_RB_PerformLoadBrain;
        goto LABEL_47;
      }

      [MEMORY[0x1896127A0] sharedLogger];
      __int16 v18 = (void *)objc_claimAutoreleasedReturnValue();
      [v18 oslog];
      id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        +[SUCoreUpdateParam targetRollbackPhaseName:](&OBJC_CLASS___SUCoreUpdateParam, "targetRollbackPhaseName:", 3LL);
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = +[SUCoreUpdateParam targetRollbackPhaseName:](&OBJC_CLASS___SUCoreUpdateParam, "targetRollbackPhaseName:", 4LL);
        *(_DWORD *)buf = 138543874;
        id v72 = self;
        __int16 v73 = 2114;
        id v74 = v20;
        __int16 v75 = 2114;
        objc_super v76 = v21;
        _os_log_impl( &dword_187A54000,  v19,  OS_LOG_TYPE_DEFAULT,  "%{public}@ [REACHED_PHASE:%{public}@=>%{public}@] skipped load of update brain",  buf,  0x20u);
      }

LABEL_10:
      -[SUCoreUpdate policy](self, "policy");
      __int16 v22 = (void *)objc_claimAutoreleasedReturnValue();
      [v22 rollbackPolicy];
      char v23 = (void *)objc_claimAutoreleasedReturnValue();
      char v24 = [v23 performPhase];

      if ((v24 & 1) == 0)
      {
        [MEMORY[0x1896127A0] sharedLogger];
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        [v28 oslog];
        v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();

        if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_44;
        }
LABEL_40:
        v63 = +[SUCoreUpdateParam targetRollbackPhaseName:](&OBJC_CLASS___SUCoreUpdateParam, "targetRollbackPhaseName:", a3);
        v64 = +[SUCoreUpdateParam targetRollbackPhaseName:](&OBJC_CLASS___SUCoreUpdateParam, "targetRollbackPhaseName:", 8LL);
        *(_DWORD *)buf = 138543874;
        id v72 = self;
        __int16 v73 = 2114;
        id v74 = v63;
        __int16 v75 = 2114;
        objc_super v76 = v64;
        v65 = "%{public}@ [REACHED_PHASE:%{public}@=>%{public}@] skipped rollback phase";
LABEL_43:
        _os_log_impl(&dword_187A54000, v29, OS_LOG_TYPE_DEFAULT, v65, buf, 0x20u);

        goto LABEL_44;
      }
      v25 = -[SUCoreUpdate policy](self, "policy");
      [v25 rollbackPolicy];
      id v26 = (void *)objc_claimAutoreleasedReturnValue();
      char v27 = [v26 performRollbackPreparePhase];

      if ((v27 & 1) != 0)
      {
        id v7 = kSU_E_RB_PerformRollbackPrepare;
        goto LABEL_47;
      }

      [MEMORY[0x1896127A0] sharedLogger];
      int v30 = (void *)objc_claimAutoreleasedReturnValue();
      [v30 oslog];
      v31 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        +[SUCoreUpdateParam targetRollbackPhaseName:](&OBJC_CLASS___SUCoreUpdateParam, "targetRollbackPhaseName:", a3);
        __int16 v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = +[SUCoreUpdateParam targetRollbackPhaseName:](&OBJC_CLASS___SUCoreUpdateParam, "targetRollbackPhaseName:", 5LL);
        *(_DWORD *)buf = 138543874;
        id v72 = self;
        __int16 v73 = 2114;
        id v74 = v32;
        __int16 v75 = 2114;
        objc_super v76 = v33;
        _os_log_impl( &dword_187A54000,  v31,  OS_LOG_TYPE_DEFAULT,  "%{public}@ [REACHED_PHASE:%{public}@=>%{public}@] skipped rollback prepare phase",  buf,  0x20u);
      }

LABEL_20:
      -[SUCoreUpdate policy](self, "policy");
      uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
      [v34 rollbackPolicy];
      uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
      char v36 = [v35 performPhase];

      if ((v36 & 1) == 0)
      {
        [MEMORY[0x1896127A0] sharedLogger];
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        [v40 oslog];
        v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();

        if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_44;
        }
        goto LABEL_40;
      }

      -[SUCoreUpdate policy](self, "policy");
      int v37 = (void *)objc_claimAutoreleasedReturnValue();
      [v37 rollbackPolicy];
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      char v39 = [v38 performRollbackSuspendPhase];

      if ((v39 & 1) != 0)
      {
        id v7 = kSU_E_RB_PerformRollbackSuspend;
        goto LABEL_47;
      }

      [MEMORY[0x1896127A0] sharedLogger];
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      [v41 oslog];
      id v42 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        v43 = +[SUCoreUpdateParam targetRollbackPhaseName:](&OBJC_CLASS___SUCoreUpdateParam, "targetRollbackPhaseName:", a3);
        +[SUCoreUpdateParam targetRollbackPhaseName:](&OBJC_CLASS___SUCoreUpdateParam, "targetRollbackPhaseName:", 6LL);
        int v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        id v72 = self;
        __int16 v73 = 2114;
        id v74 = v43;
        __int16 v75 = 2114;
        objc_super v76 = v44;
        _os_log_impl( &dword_187A54000,  v42,  OS_LOG_TYPE_DEFAULT,  "%{public}@ [REACHED_PHASE:%{public}@=>%{public}@] skipped rollback suspend phase",  buf,  0x20u);
      }

LABEL_28:
      v45 = -[SUCoreUpdate policy](self, "policy");
      [v45 rollbackPolicy];
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      char v47 = [v46 performPhase];

      if ((v47 & 1) == 0)
      {
        [MEMORY[0x1896127A0] sharedLogger];
        int v51 = (void *)objc_claimAutoreleasedReturnValue();
        [v51 oslog];
        v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();

        if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_44;
        }
        goto LABEL_40;
      }

      -[SUCoreUpdate policy](self, "policy");
      BOOL v48 = (void *)objc_claimAutoreleasedReturnValue();
      [v48 rollbackPolicy];
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      char v50 = [v49 performRollbackResumePhase];

      if ((v50 & 1) != 0)
      {
        id v7 = kSU_E_RB_PerformRollbackResume;
        goto LABEL_47;
      }

      [MEMORY[0x1896127A0] sharedLogger];
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      [v52 oslog];
      v53 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        v54 = +[SUCoreUpdateParam targetRollbackPhaseName:](&OBJC_CLASS___SUCoreUpdateParam, "targetRollbackPhaseName:", a3);
        v55 = +[SUCoreUpdateParam targetRollbackPhaseName:](&OBJC_CLASS___SUCoreUpdateParam, "targetRollbackPhaseName:", 7LL);
        *(_DWORD *)buf = 138543874;
        id v72 = self;
        __int16 v73 = 2114;
        id v74 = v54;
        __int16 v75 = 2114;
        objc_super v76 = v55;
        _os_log_impl( &dword_187A54000,  v53,  OS_LOG_TYPE_DEFAULT,  "%{public}@ [REACHED_PHASE:%{public}@=>%{public}@] skipped rollback resume phase",  buf,  0x20u);
      }

LABEL_36:
      v56 = -[SUCoreUpdate policy](self, "policy");
      [v56 rollbackPolicy];
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      char v58 = [v57 performPhase];

      if ((v58 & 1) == 0)
      {
        [MEMORY[0x1896127A0] sharedLogger];
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        [v62 oslog];
        v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();

        if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_44;
        }
        goto LABEL_40;
      }
      v59 = -[SUCoreUpdate policy](self, "policy");
      [v59 rollbackPolicy];
      uint64_t v60 = (void *)objc_claimAutoreleasedReturnValue();
      char v61 = [v60 performRollbackApplyPhase];

      if ((v61 & 1) != 0)
      {
        id v7 = kSU_E_RB_PerformRollbackApply;
        goto LABEL_47;
      }

      [MEMORY[0x1896127A0] sharedLogger];
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      [v66 oslog];
      v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v63 = +[SUCoreUpdateParam targetRollbackPhaseName:](&OBJC_CLASS___SUCoreUpdateParam, "targetRollbackPhaseName:", a3);
        v64 = +[SUCoreUpdateParam targetRollbackPhaseName:](&OBJC_CLASS___SUCoreUpdateParam, "targetRollbackPhaseName:", 8LL);
        *(_DWORD *)buf = 138543874;
        id v72 = self;
        __int16 v73 = 2114;
        id v74 = v63;
        __int16 v75 = 2114;
        objc_super v76 = v64;
        v65 = "%{public}@ [REACHED_PHASE:%{public}@=>%{public}@] skipped rollback apply phase";
        goto LABEL_43;
      }

- (void)_trackUpdateAnomaly:(id)a3 result:(int64_t)a4 description:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  -[SUCoreUpdate updateFSM](self, "updateFSM");
  int v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 extendedStateQueue];
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  [MEMORY[0x189612760] sharedCore];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 buildError:a4 underlying:0 description:v8];
  id v17 = (id)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdate updateFSM](self, "updateFSM");
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 diag];
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  id v15 = (void *)[objc_alloc(NSString) initWithFormat:@"[UPDATE] %@", v9];

  uint64_t v16 = (void *)[objc_alloc(NSString) initWithFormat:@"%@ %@", self, v8];
  [v14 trackAnomaly:v15 forReason:v16 withResult:a4 withError:v17];

  -[SUCoreUpdate _updateAnomaly:](self, "_updateAnomaly:", v17);
}

- (void)_trackUpdateError:(id)a3 forReason:(id)a4 error:(id)a5
{
  id v8 = (__CFString *)a3;
  id v9 = a5;
  if (v9)
  {
    int v10 = @"general";
    if (v8) {
      int v10 = v8;
    }
    id v11 = v10;
    id v12 = a4;
    -[SUCoreUpdate failedAttemptError](self, "failedAttemptError");
    id v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      -[SUCoreUpdate setFailedAttemptError:](self, "setFailedAttemptError:", v9);
      [MEMORY[0x1896127A0] sharedLogger];
      id v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 oslog];
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[SUCoreUpdate _trackUpdateError:forReason:error:].cold.1(self, (uint64_t)v11, v15);
      }
    }

    -[SUCoreUpdate updateFSM](self, "updateFSM");
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 diag];
    id v17 = (void *)objc_claimAutoreleasedReturnValue();
    __int16 v18 = (void *)[objc_alloc(NSString) initWithFormat:@"[UPDATE] %@", v11];
    objc_msgSend(v17, "trackError:forReason:withResult:withError:", v18, v12, objc_msgSend(v9, "code"), v9);
  }

  else
  {
    id v19 = (objc_class *)NSString;
    uint64_t v20 = (__CFString *)a4;
    id v21 = objc_alloc(v19);
    __int16 v22 = @"no reason provided";
    if (v20) {
      __int16 v22 = v20;
    }
    id v11 = (__CFString *)[v21 initWithFormat:@"tracking update error when no error provided (%@)", v22];

    -[SUCoreUpdate _trackUpdateAnomaly:result:description:]( self,  "_trackUpdateAnomaly:result:description:",  v8,  8101LL,  v11);
  }
}

- (void)_cleanupAfterAttempt
{
}

- (SUCoreDescriptor)updateDescriptor
{
  return self->_updateDescriptor;
}

- (SUCoreRollbackDescriptor)rollbackDescriptor
{
  return self->_rollbackDescriptor;
}

- (id)updateDelegate
{
  return objc_loadWeakRetained(&self->_updateDelegate);
}

- (OS_dispatch_queue)clientDelegateCallbackQueue
{
  return self->_clientDelegateCallbackQueue;
}

- (NSString)updateUUID
{
  return self->_updateUUID;
}

- (NSString)updateName
{
  return self->_updateName;
}

- (NSDictionary)stateTable
{
  return self->_stateTable;
}

- (SUCoreFSM)updateFSM
{
  return self->_updateFSM;
}

- (int64_t)targetPhase
{
  return self->_targetPhase;
}

- (void)setTargetPhase:(int64_t)a3
{
  self->_targetPhase = a3;
}

- (SUCorePolicy)policy
{
  return self->_policy;
}

- (void)setPolicy:(id)a3
{
}

- (SUCoreUpdateDownloader)downloadControl
{
  return self->_downloadControl;
}

- (void)setDownloadControl:(id)a3
{
}

- (SUCoreMSU)msuControl
{
  return self->_msuControl;
}

- (OS_os_transaction)updateTransaction
{
  return self->_updateTransaction;
}

- (void)setUpdateTransaction:(id)a3
{
}

- (NSError)failedAttemptError
{
  return self->_failedAttemptError;
}

- (void)setFailedAttemptError:(id)a3
{
}

- (SUCoreRollback)rollbackControl
{
  return self->_rollbackControl;
}

- (void).cxx_destruct
{
}

- (void)_trackUpdateError:(void *)a1 forReason:(uint64_t)a2 error:(os_log_s *)a3 .cold.1(void *a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  [a1 failedAttemptError];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  int v7 = 138543874;
  id v8 = a1;
  __int16 v9 = 2114;
  uint64_t v10 = a2;
  __int16 v11 = 2114;
  id v12 = v6;
  _os_log_error_impl( &dword_187A54000,  a3,  OS_LOG_TYPE_ERROR,  "%{public}@ first error for update attempt {%{public}@} error: %{public}@",  (uint8_t *)&v7,  0x20u);
}

@end