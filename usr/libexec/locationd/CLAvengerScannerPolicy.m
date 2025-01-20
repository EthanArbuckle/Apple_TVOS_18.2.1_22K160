@interface CLAvengerScannerPolicy
+ (id)convertCLAvengerScannerPolicyScanTypeToString:(int64_t)a3;
- (BOOL)associatedTo2GHzWiFi;
- (BOOL)bluetoothAudioActive;
- (BOOL)downgradedDuringCoexFriendlyAggressiveDiscoveryScan;
- (BOOL)hasActiveAggressiveScan;
- (BOOL)hasActiveBTFindingScan;
- (BOOL)optedIn;
- (BOOL)wifi2GHzCriticalState;
- (CLAvengerScannerPolicy)initWithDelegate:(id)a3 platformType:(int64_t)a4 supportsPerTypeDuplicateFilter:(BOOL)a5;
- (CLAvengerScannerScanParameters)currentScanParameters;
- (id).cxx_construct;
- (int64_t)currentScanType;
- (int64_t)desiredAggressiveDiscoveryScanParameters:(CLAvengerScannerPolicyContext *)a3;
- (int64_t)desiredBTFindingDiscoveryScanParameters:(CLAvengerScannerPolicyContext *)a3;
- (int64_t)desiredCoexFriendlyAggressiveDiscoveryScanParameters:(CLAvengerScannerPolicyContext *)a3;
- (int64_t)desiredDefaultScanParameters:(CLAvengerScannerPolicyContext *)a3;
- (int64_t)desiredHawkeyeLowEnergyScanParameters:(CLAvengerScannerPolicyContext *)a3;
- (int64_t)desiredWatchAdvertisementBufferScanParameters:(CLAvengerScannerPolicyContext *)a3;
- (int64_t)resolveNewScanTypeWithNewContext:(CLAvengerScannerPolicyContext *)a3;
- (unint64_t)totalAdvertisementBuffersAvailable;
- (void)setAssociatedTo2GHzWiFi:(BOOL)a3;
- (void)setBluetoothAudioActive:(BOOL)a3;
- (void)setOptedIn:(BOOL)a3;
- (void)setTotalAdvertisementBuffersAvailable:(unint64_t)a3;
- (void)setWifi2GHzCriticalState:(BOOL)a3;
- (void)startAggressiveScan;
- (void)startBTFindingScan;
- (void)startCoexFriendlyAggressiveScan;
- (void)startHawkeyeLowEnergyScan;
- (void)startWatchAdvertisementBufferScan;
- (void)stopAggressiveScan;
- (void)stopBTFindingScan;
- (void)stopCoexFriendlyAggressiveScan;
- (void)stopHawkeyeLowEnergyScan;
- (void)stopWatchAdvertisementBufferScan;
- (void)updateContext:(CLAvengerScannerPolicyContext *)a3;
@end

@implementation CLAvengerScannerPolicy

- (CLAvengerScannerPolicy)initWithDelegate:(id)a3 platformType:(int64_t)a4 supportsPerTypeDuplicateFilter:(BOOL)a5
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___CLAvengerScannerPolicy;
  v8 = -[CLAvengerScannerPolicy init](&v15, "init");
  v9 = v8;
  if (v8)
  {
    v8->_delegate = (CLAvengerScannerPolicyDelegate *)a3;
    v8->_currentContext.platformType = a4;
    v8->_currentContext.supportsPerTypeDuplicateFilter = a5;
    __int128 v10 = *(_OWORD *)&v8->_currentContext.watchAdvertisementBufferScanCount;
    v13[1] = *(_OWORD *)&v8->_currentContext.coexFriendlyAggressiveDiscoveryScanCount;
    v13[2] = v10;
    __int128 v11 = *(_OWORD *)&v8->_currentContext.platformType;
    v13[0] = *(_OWORD *)&v8->_currentContext.optedIn;
    v13[3] = v11;
    uint64_t v14 = *(void *)&v8->_currentContext.supportsPerTypeDuplicateFilter;
    v8->_currentScanType = -[CLAvengerScannerPolicy resolveNewScanTypeWithNewContext:]( v8,  "resolveNewScanTypeWithNewContext:",  v13);
  }

  return v9;
}

- (int64_t)desiredDefaultScanParameters:(CLAvengerScannerPolicyContext *)a3
{
  int64_t platformType = a3->platformType;
  if (platformType == 3) {
    return 2LL;
  }
  if (platformType != 1) {
    return 0LL;
  }
  unint64_t totalAdvertisementBuffersAvailable = a3->totalAdvertisementBuffersAvailable;
  if (totalAdvertisementBuffersAvailable >= 2)
  {
    BOOL v5 = !a3->optedIn;
    int64_t v6 = 6LL;
    int64_t v7 = 4LL;
    goto LABEL_8;
  }

  if (totalAdvertisementBuffersAvailable != 1) {
    return 2LL;
  }
  BOOL v5 = !a3->optedIn;
  int64_t v6 = 5LL;
  int64_t v7 = 3LL;
LABEL_8:
  if (v5) {
    return v7;
  }
  else {
    return v6;
  }
}

- (int64_t)desiredAggressiveDiscoveryScanParameters:(CLAvengerScannerPolicyContext *)a3
{
  if (a3->aggressiveDiscoveryScanCount) {
    return 11LL;
  }
  else {
    return 0LL;
  }
}

- (int64_t)desiredCoexFriendlyAggressiveDiscoveryScanParameters:(CLAvengerScannerPolicyContext *)a3
{
  if (!a3->coexFriendlyAggressiveDiscoveryScanCount) {
    return 0LL;
  }
  if ((!a3->associatedTo2GHzWiFi || !a3->wifi2GHzCriticalState)
    && !a3->bluetoothAudioActive
    && !a3->downgradedDuringCoexFriendlyAggressiveDiscoveryScan)
  {
    return 11LL;
  }

  if (!self->_currentContext.downgradedDuringCoexFriendlyAggressiveDiscoveryScan)
  {
    if (qword_1019349B0 != -1) {
      dispatch_once(&qword_1019349B0, &stru_10182EA40);
    }
    v4 = (os_log_s *)qword_1019349B8;
    if (os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_DEFAULT))
    {
      v6[0] = 68289026;
      v6[1] = 0;
      __int16 v7 = 2082;
      v8 = "";
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:CLAvengerScanner: downgrading CoexFriendlyAggressiveDiscovery scan}",  (uint8_t *)v6,  0x12u);
    }
  }

  self->_currentContext.downgradedDuringCoexFriendlyAggressiveDiscoveryScan = 1;
  return 9LL;
}

- (int64_t)desiredBTFindingDiscoveryScanParameters:(CLAvengerScannerPolicyContext *)a3
{
  if (!a3->btFindingDiscoveryScanCount) {
    return 0LL;
  }
  if (!a3->associatedTo2GHzWiFi) {
    return 12LL;
  }
  if (a3->wifi2GHzCriticalState) {
    return 8LL;
  }
  return 10LL;
}

- (int64_t)desiredWatchAdvertisementBufferScanParameters:(CLAvengerScannerPolicyContext *)a3
{
  return a3->watchAdvertisementBufferScanCount && a3->platformType == 2 && a3->totalAdvertisementBuffersAvailable;
}

- (int64_t)desiredHawkeyeLowEnergyScanParameters:(CLAvengerScannerPolicyContext *)a3
{
  if (a3->hawkeyeLowEnergyScanCount) {
    return 7LL;
  }
  else {
    return 0LL;
  }
}

- (int64_t)resolveNewScanTypeWithNewContext:(CLAvengerScannerPolicyContext *)a3
{
  __int128 v5 = *(_OWORD *)&a3->platformType;
  v53[2] = *(_OWORD *)&a3->watchAdvertisementBufferScanCount;
  v53[3] = v5;
  uint64_t v54 = *(void *)&a3->supportsPerTypeDuplicateFilter;
  __int128 v6 = *(_OWORD *)&a3->coexFriendlyAggressiveDiscoveryScanCount;
  v53[0] = *(_OWORD *)&a3->optedIn;
  v53[1] = v6;
  if (-[CLAvengerScannerPolicy desiredDefaultScanParameters:](self, "desiredDefaultScanParameters:", v53) < 1)
  {
    int64_t v9 = 0LL;
  }

  else
  {
    __int128 v7 = *(_OWORD *)&a3->platformType;
    v51[2] = *(_OWORD *)&a3->watchAdvertisementBufferScanCount;
    v51[3] = v7;
    uint64_t v52 = *(void *)&a3->supportsPerTypeDuplicateFilter;
    __int128 v8 = *(_OWORD *)&a3->coexFriendlyAggressiveDiscoveryScanCount;
    v51[0] = *(_OWORD *)&a3->optedIn;
    v51[1] = v8;
    int64_t v9 = -[CLAvengerScannerPolicy desiredDefaultScanParameters:](self, "desiredDefaultScanParameters:", v51);
  }

  __int128 v10 = *(_OWORD *)&a3->platformType;
  v49[2] = *(_OWORD *)&a3->watchAdvertisementBufferScanCount;
  v49[3] = v10;
  uint64_t v50 = *(void *)&a3->supportsPerTypeDuplicateFilter;
  __int128 v11 = *(_OWORD *)&a3->coexFriendlyAggressiveDiscoveryScanCount;
  v49[0] = *(_OWORD *)&a3->optedIn;
  v49[1] = v11;
  if (-[CLAvengerScannerPolicy desiredAggressiveDiscoveryScanParameters:]( self,  "desiredAggressiveDiscoveryScanParameters:",  v49) > v9)
  {
    __int128 v12 = *(_OWORD *)&a3->platformType;
    v47[2] = *(_OWORD *)&a3->watchAdvertisementBufferScanCount;
    v47[3] = v12;
    uint64_t v48 = *(void *)&a3->supportsPerTypeDuplicateFilter;
    __int128 v13 = *(_OWORD *)&a3->coexFriendlyAggressiveDiscoveryScanCount;
    v47[0] = *(_OWORD *)&a3->optedIn;
    v47[1] = v13;
    int64_t v9 = -[CLAvengerScannerPolicy desiredAggressiveDiscoveryScanParameters:]( self,  "desiredAggressiveDiscoveryScanParameters:",  v47);
  }

  __int128 v14 = *(_OWORD *)&a3->platformType;
  v45[2] = *(_OWORD *)&a3->watchAdvertisementBufferScanCount;
  v45[3] = v14;
  uint64_t v46 = *(void *)&a3->supportsPerTypeDuplicateFilter;
  __int128 v15 = *(_OWORD *)&a3->coexFriendlyAggressiveDiscoveryScanCount;
  v45[0] = *(_OWORD *)&a3->optedIn;
  v45[1] = v15;
  if (-[CLAvengerScannerPolicy desiredBTFindingDiscoveryScanParameters:]( self,  "desiredBTFindingDiscoveryScanParameters:",  v45) > v9)
  {
    __int128 v16 = *(_OWORD *)&a3->platformType;
    v43[2] = *(_OWORD *)&a3->watchAdvertisementBufferScanCount;
    v43[3] = v16;
    uint64_t v44 = *(void *)&a3->supportsPerTypeDuplicateFilter;
    __int128 v17 = *(_OWORD *)&a3->coexFriendlyAggressiveDiscoveryScanCount;
    v43[0] = *(_OWORD *)&a3->optedIn;
    v43[1] = v17;
    int64_t v9 = -[CLAvengerScannerPolicy desiredBTFindingDiscoveryScanParameters:]( self,  "desiredBTFindingDiscoveryScanParameters:",  v43);
  }

  __int128 v18 = *(_OWORD *)&a3->platformType;
  v41[2] = *(_OWORD *)&a3->watchAdvertisementBufferScanCount;
  v41[3] = v18;
  uint64_t v42 = *(void *)&a3->supportsPerTypeDuplicateFilter;
  __int128 v19 = *(_OWORD *)&a3->coexFriendlyAggressiveDiscoveryScanCount;
  v41[0] = *(_OWORD *)&a3->optedIn;
  v41[1] = v19;
  if (-[CLAvengerScannerPolicy desiredWatchAdvertisementBufferScanParameters:]( self,  "desiredWatchAdvertisementBufferScanParameters:",  v41) > v9)
  {
    __int128 v20 = *(_OWORD *)&a3->platformType;
    v39[2] = *(_OWORD *)&a3->watchAdvertisementBufferScanCount;
    v39[3] = v20;
    uint64_t v40 = *(void *)&a3->supportsPerTypeDuplicateFilter;
    __int128 v21 = *(_OWORD *)&a3->coexFriendlyAggressiveDiscoveryScanCount;
    v39[0] = *(_OWORD *)&a3->optedIn;
    v39[1] = v21;
    int64_t v9 = -[CLAvengerScannerPolicy desiredWatchAdvertisementBufferScanParameters:]( self,  "desiredWatchAdvertisementBufferScanParameters:",  v39);
  }

  __int128 v22 = *(_OWORD *)&a3->platformType;
  v37[2] = *(_OWORD *)&a3->watchAdvertisementBufferScanCount;
  v37[3] = v22;
  uint64_t v38 = *(void *)&a3->supportsPerTypeDuplicateFilter;
  __int128 v23 = *(_OWORD *)&a3->coexFriendlyAggressiveDiscoveryScanCount;
  v37[0] = *(_OWORD *)&a3->optedIn;
  v37[1] = v23;
  if (-[CLAvengerScannerPolicy desiredHawkeyeLowEnergyScanParameters:]( self,  "desiredHawkeyeLowEnergyScanParameters:",  v37) > v9)
  {
    __int128 v24 = *(_OWORD *)&a3->platformType;
    v35[2] = *(_OWORD *)&a3->watchAdvertisementBufferScanCount;
    v35[3] = v24;
    uint64_t v36 = *(void *)&a3->supportsPerTypeDuplicateFilter;
    __int128 v25 = *(_OWORD *)&a3->coexFriendlyAggressiveDiscoveryScanCount;
    v35[0] = *(_OWORD *)&a3->optedIn;
    v35[1] = v25;
    int64_t v9 = -[CLAvengerScannerPolicy desiredHawkeyeLowEnergyScanParameters:]( self,  "desiredHawkeyeLowEnergyScanParameters:",  v35);
  }

  __int128 v26 = *(_OWORD *)&a3->platformType;
  v33[2] = *(_OWORD *)&a3->watchAdvertisementBufferScanCount;
  v33[3] = v26;
  uint64_t v34 = *(void *)&a3->supportsPerTypeDuplicateFilter;
  __int128 v27 = *(_OWORD *)&a3->coexFriendlyAggressiveDiscoveryScanCount;
  v33[0] = *(_OWORD *)&a3->optedIn;
  v33[1] = v27;
  if (-[CLAvengerScannerPolicy desiredCoexFriendlyAggressiveDiscoveryScanParameters:]( self,  "desiredCoexFriendlyAggressiveDiscoveryScanParameters:",  v33) > v9)
  {
    __int128 v28 = *(_OWORD *)&a3->platformType;
    v31[2] = *(_OWORD *)&a3->watchAdvertisementBufferScanCount;
    v31[3] = v28;
    uint64_t v32 = *(void *)&a3->supportsPerTypeDuplicateFilter;
    __int128 v29 = *(_OWORD *)&a3->coexFriendlyAggressiveDiscoveryScanCount;
    v31[0] = *(_OWORD *)&a3->optedIn;
    v31[1] = v29;
    return -[CLAvengerScannerPolicy desiredCoexFriendlyAggressiveDiscoveryScanParameters:]( self,  "desiredCoexFriendlyAggressiveDiscoveryScanParameters:",  v31);
  }

  return v9;
}

- (void)updateContext:(CLAvengerScannerPolicyContext *)a3
{
  *(_OWORD *)&self->_currentContext.optedIn = *(_OWORD *)&a3->optedIn;
  __int128 v4 = *(_OWORD *)&a3->coexFriendlyAggressiveDiscoveryScanCount;
  __int128 v5 = *(_OWORD *)&a3->watchAdvertisementBufferScanCount;
  __int128 v6 = *(_OWORD *)&a3->platformType;
  *(unint64_t *)((char *)&self->_currentContext.totalAdvertisementBuffersAvailable + 5) = *(unint64_t *)((char *)&a3->totalAdvertisementBuffersAvailable + 5);
  *(_OWORD *)&self->_currentContext.watchAdvertisementBufferScanCount = v5;
  *(_OWORD *)&self->_currentContext.int64_t platformType = v6;
  *(_OWORD *)&self->_currentContext.coexFriendlyAggressiveDiscoveryScanCount = v4;
  __int128 v7 = *(_OWORD *)&a3->platformType;
  v10[2] = *(_OWORD *)&a3->watchAdvertisementBufferScanCount;
  v10[3] = v7;
  uint64_t v11 = *(void *)&a3->supportsPerTypeDuplicateFilter;
  __int128 v8 = *(_OWORD *)&a3->coexFriendlyAggressiveDiscoveryScanCount;
  v10[0] = *(_OWORD *)&a3->optedIn;
  v10[1] = v8;
  int64_t v9 = -[CLAvengerScannerPolicy resolveNewScanTypeWithNewContext:](self, "resolveNewScanTypeWithNewContext:", v10);
  if (v9 != self->_currentScanType)
  {
    self->_currentScanType = v9;
    if ((objc_opt_respondsToSelector(self->_delegate, "scanTypeUpdated:") & 1) != 0) {
      -[CLAvengerScannerPolicyDelegate scanTypeUpdated:](self->_delegate, "scanTypeUpdated:", self->_currentScanType);
    }
  }

- (void)startAggressiveScan
{
  if (self->_currentContext.aggressiveDiscoveryScanCount != -1LL)
  {
    unsigned __int8 v3 = -[CLAvengerScannerPolicy hasActiveAggressiveScan](self, "hasActiveAggressiveScan");
    uint64_t v4 = *(void *)&self->_currentContext.optedIn;
    unint64_t aggressiveDiscoveryScanCount = self->_currentContext.aggressiveDiscoveryScanCount;
    __int128 v6 = *(_OWORD *)&self->_currentContext.watchAdvertisementBufferScanCount;
    __int128 v8 = *(_OWORD *)&self->_currentContext.coexFriendlyAggressiveDiscoveryScanCount;
    __int128 v9 = v6;
    __int128 v10 = *(_OWORD *)&self->_currentContext.platformType;
    uint64_t v11 = *(void *)&self->_currentContext.supportsPerTypeDuplicateFilter;
    v7[0] = v4;
    v7[1] = aggressiveDiscoveryScanCount + 1;
    -[CLAvengerScannerPolicy updateContext:](self, "updateContext:", v7);
    if ((v3 & 1) == 0)
    {
      if (-[CLAvengerScannerPolicy hasActiveAggressiveScan](self, "hasActiveAggressiveScan"))
      {
        if ((objc_opt_respondsToSelector(self->_delegate, "startedAggressiveDiscoveryScan") & 1) != 0) {
          -[CLAvengerScannerPolicyDelegate startedAggressiveDiscoveryScan]( self->_delegate,  "startedAggressiveDiscoveryScan");
        }
      }
    }
  }

- (void)stopAggressiveScan
{
  if (self->_currentContext.aggressiveDiscoveryScanCount)
  {
    unsigned int v3 = -[CLAvengerScannerPolicy hasActiveAggressiveScan](self, "hasActiveAggressiveScan");
    uint64_t v4 = *(void *)&self->_currentContext.optedIn;
    unint64_t aggressiveDiscoveryScanCount = self->_currentContext.aggressiveDiscoveryScanCount;
    __int128 v6 = *(_OWORD *)&self->_currentContext.watchAdvertisementBufferScanCount;
    __int128 v8 = *(_OWORD *)&self->_currentContext.coexFriendlyAggressiveDiscoveryScanCount;
    __int128 v9 = v6;
    __int128 v10 = *(_OWORD *)&self->_currentContext.platformType;
    uint64_t v11 = *(void *)&self->_currentContext.supportsPerTypeDuplicateFilter;
    v7[0] = v4;
    v7[1] = aggressiveDiscoveryScanCount - 1;
    -[CLAvengerScannerPolicy updateContext:](self, "updateContext:", v7);
    if (v3)
    {
      if (!-[CLAvengerScannerPolicy hasActiveAggressiveScan](self, "hasActiveAggressiveScan")
        && (objc_opt_respondsToSelector(self->_delegate, "stoppedAggressiveDiscoveryScan") & 1) != 0)
      {
        -[CLAvengerScannerPolicyDelegate stoppedAggressiveDiscoveryScan]( self->_delegate,  "stoppedAggressiveDiscoveryScan");
      }
    }
  }

- (void)startCoexFriendlyAggressiveScan
{
  if (self->_currentContext.coexFriendlyAggressiveDiscoveryScanCount != -1LL)
  {
    unsigned __int8 v3 = -[CLAvengerScannerPolicy hasActiveAggressiveScan](self, "hasActiveAggressiveScan");
    __int128 v5 = *(_OWORD *)&self->_currentContext.optedIn;
    unint64_t coexFriendlyAggressiveDiscoveryScanCount = self->_currentContext.coexFriendlyAggressiveDiscoveryScanCount;
    __int128 v7 = *(_OWORD *)&self->_currentContext.btFindingDiscoveryScanCount;
    __int128 v8 = *(_OWORD *)&self->_currentContext.hawkeyeLowEnergyScanCount;
    __int128 v9 = *(_OWORD *)&self->_currentContext.totalAdvertisementBuffersAvailable;
    unint64_t v6 = coexFriendlyAggressiveDiscoveryScanCount + 1;
    -[CLAvengerScannerPolicy updateContext:](self, "updateContext:", &v5);
    if ((v3 & 1) == 0)
    {
      if (-[CLAvengerScannerPolicy hasActiveAggressiveScan](self, "hasActiveAggressiveScan"))
      {
        if ((objc_opt_respondsToSelector(self->_delegate, "startedAggressiveDiscoveryScan") & 1) != 0) {
          -[CLAvengerScannerPolicyDelegate startedAggressiveDiscoveryScan]( self->_delegate,  "startedAggressiveDiscoveryScan");
        }
      }
    }
  }

- (void)stopCoexFriendlyAggressiveScan
{
  if (self->_currentContext.coexFriendlyAggressiveDiscoveryScanCount)
  {
    unsigned int v3 = -[CLAvengerScannerPolicy hasActiveAggressiveScan](self, "hasActiveAggressiveScan");
    __int128 v7 = *(_OWORD *)&self->_currentContext.optedIn;
    unint64_t coexFriendlyAggressiveDiscoveryScanCount = self->_currentContext.coexFriendlyAggressiveDiscoveryScanCount;
    __int128 v9 = *(_OWORD *)&self->_currentContext.btFindingDiscoveryScanCount;
    *(_OWORD *)__int128 v10 = *(_OWORD *)&self->_currentContext.hawkeyeLowEnergyScanCount;
    *(_OWORD *)&v10[12] = *(_OWORD *)((char *)&self->_currentContext.platformType + 4);
    BOOL downgradedDuringCoexFriendlyAggressiveDiscoveryScan = self->_currentContext.downgradedDuringCoexFriendlyAggressiveDiscoveryScan;
    __int16 v12 = *(_WORD *)(&self->_currentContext.downgradedDuringCoexFriendlyAggressiveDiscoveryScan + 1);
    char v13 = *(&self->_currentContext.downgradedDuringCoexFriendlyAggressiveDiscoveryScan + 3);
    unint64_t v6 = coexFriendlyAggressiveDiscoveryScanCount - 1;
    if (!v6) {
      BOOL downgradedDuringCoexFriendlyAggressiveDiscoveryScan = 0;
    }
    unint64_t v8 = v6;
    BOOL v11 = downgradedDuringCoexFriendlyAggressiveDiscoveryScan;
    -[CLAvengerScannerPolicy updateContext:](self, "updateContext:", &v7);
    if (v3
      && !-[CLAvengerScannerPolicy hasActiveAggressiveScan](self, "hasActiveAggressiveScan", v7)
      && (objc_opt_respondsToSelector(self->_delegate, "stoppedAggressiveDiscoveryScan") & 1) != 0)
    {
      -[CLAvengerScannerPolicyDelegate stoppedAggressiveDiscoveryScan]( self->_delegate,  "stoppedAggressiveDiscoveryScan");
    }
  }

- (BOOL)hasActiveAggressiveScan
{
  return self->_currentContext.aggressiveDiscoveryScanCount
      || self->_currentContext.coexFriendlyAggressiveDiscoveryScanCount != 0;
}

- (void)startBTFindingScan
{
  unint64_t btFindingDiscoveryScanCount = self->_currentContext.btFindingDiscoveryScanCount;
  if (btFindingDiscoveryScanCount != -1LL)
  {
    __int128 v15 = *(_OWORD *)&self->_currentContext.optedIn;
    unint64_t coexFriendlyAggressiveDiscoveryScanCount = self->_currentContext.coexFriendlyAggressiveDiscoveryScanCount;
    __int128 v4 = *(_OWORD *)&self->_currentContext.platformType;
    __int128 v12 = *(_OWORD *)&self->_currentContext.watchAdvertisementBufferScanCount;
    __int128 v13 = v4;
    uint64_t v14 = *(void *)&self->_currentContext.supportsPerTypeDuplicateFilter;
    unint64_t v5 = btFindingDiscoveryScanCount + 1;
    if (!btFindingDiscoveryScanCount
      && (objc_opt_respondsToSelector(self->_delegate, "startedBTFindingDiscoveryScan") & 1) != 0)
    {
      -[CLAvengerScannerPolicyDelegate startedBTFindingDiscoveryScan](self->_delegate, "startedBTFindingDiscoveryScan");
    }

    __int128 v6 = v15;
    unint64_t v7 = coexFriendlyAggressiveDiscoveryScanCount;
    unint64_t v8 = v5;
    __int128 v9 = v12;
    __int128 v10 = v13;
    uint64_t v11 = v14;
    -[CLAvengerScannerPolicy updateContext:](self, "updateContext:", &v6);
  }

- (void)stopBTFindingScan
{
  unint64_t btFindingDiscoveryScanCount = self->_currentContext.btFindingDiscoveryScanCount;
  if (btFindingDiscoveryScanCount)
  {
    __int128 v7 = *(_OWORD *)&self->_currentContext.optedIn;
    unint64_t coexFriendlyAggressiveDiscoveryScanCount = self->_currentContext.coexFriendlyAggressiveDiscoveryScanCount;
    __int128 v5 = *(_OWORD *)&self->_currentContext.platformType;
    __int128 v10 = *(_OWORD *)&self->_currentContext.watchAdvertisementBufferScanCount;
    __int128 v11 = v5;
    uint64_t v12 = *(void *)&self->_currentContext.supportsPerTypeDuplicateFilter;
    unint64_t v6 = btFindingDiscoveryScanCount - 1;
    unint64_t v8 = coexFriendlyAggressiveDiscoveryScanCount;
    unint64_t v9 = btFindingDiscoveryScanCount - 1;
    -[CLAvengerScannerPolicy updateContext:](self, "updateContext:", &v7);
    if (!v6 && (objc_opt_respondsToSelector(self->_delegate, "stoppedBTFindingDiscoveryScan") & 1) != 0) {
      -[CLAvengerScannerPolicyDelegate stoppedBTFindingDiscoveryScan](self->_delegate, "stoppedBTFindingDiscoveryScan");
    }
  }

- (void)startWatchAdvertisementBufferScan
{
  unint64_t watchAdvertisementBufferScanCount = self->_currentContext.watchAdvertisementBufferScanCount;
  if (watchAdvertisementBufferScanCount != -1LL)
  {
    __int128 v3 = *(_OWORD *)&self->_currentContext.coexFriendlyAggressiveDiscoveryScanCount;
    v4[0] = *(_OWORD *)&self->_currentContext.optedIn;
    v4[1] = v3;
    __int128 v6 = *(_OWORD *)&self->_currentContext.hawkeyeLowEnergyScanCount;
    __int128 v7 = *(_OWORD *)&self->_currentContext.totalAdvertisementBuffersAvailable;
    unint64_t v5 = watchAdvertisementBufferScanCount + 1;
    -[CLAvengerScannerPolicy updateContext:](self, "updateContext:", v4);
  }

- (void)stopWatchAdvertisementBufferScan
{
  unint64_t watchAdvertisementBufferScanCount = self->_currentContext.watchAdvertisementBufferScanCount;
  if (watchAdvertisementBufferScanCount)
  {
    __int128 v3 = *(_OWORD *)&self->_currentContext.coexFriendlyAggressiveDiscoveryScanCount;
    v4[0] = *(_OWORD *)&self->_currentContext.optedIn;
    v4[1] = v3;
    __int128 v6 = *(_OWORD *)&self->_currentContext.hawkeyeLowEnergyScanCount;
    __int128 v7 = *(_OWORD *)&self->_currentContext.totalAdvertisementBuffersAvailable;
    unint64_t v5 = watchAdvertisementBufferScanCount - 1;
    -[CLAvengerScannerPolicy updateContext:](self, "updateContext:", v4);
  }

- (void)startHawkeyeLowEnergyScan
{
  unint64_t hawkeyeLowEnergyScanCount = self->_currentContext.hawkeyeLowEnergyScanCount;
  if (hawkeyeLowEnergyScanCount != -1LL)
  {
    __int128 v4 = *(_OWORD *)&self->_currentContext.coexFriendlyAggressiveDiscoveryScanCount;
    __int128 v13 = *(_OWORD *)&self->_currentContext.optedIn;
    __int128 v14 = v4;
    unint64_t watchAdvertisementBufferScanCount = self->_currentContext.watchAdvertisementBufferScanCount;
    __int128 v11 = *(_OWORD *)&self->_currentContext.platformType;
    uint64_t v12 = *(void *)&self->_currentContext.supportsPerTypeDuplicateFilter;
    unint64_t v5 = hawkeyeLowEnergyScanCount + 1;
    if (!hawkeyeLowEnergyScanCount
      && (objc_opt_respondsToSelector(self->_delegate, "startedHawkeyeLowEnergyScan") & 1) != 0)
    {
      -[CLAvengerScannerPolicyDelegate startedHawkeyeLowEnergyScan](self->_delegate, "startedHawkeyeLowEnergyScan");
    }

    v6[0] = v13;
    v6[1] = v14;
    unint64_t v7 = watchAdvertisementBufferScanCount;
    unint64_t v8 = v5;
    __int128 v9 = v11;
    uint64_t v10 = v12;
    -[CLAvengerScannerPolicy updateContext:](self, "updateContext:", v6);
  }

- (void)stopHawkeyeLowEnergyScan
{
  unint64_t hawkeyeLowEnergyScanCount = self->_currentContext.hawkeyeLowEnergyScanCount;
  if (hawkeyeLowEnergyScanCount)
  {
    __int128 v4 = *(_OWORD *)&self->_currentContext.coexFriendlyAggressiveDiscoveryScanCount;
    v7[0] = *(_OWORD *)&self->_currentContext.optedIn;
    v7[1] = v4;
    unint64_t watchAdvertisementBufferScanCount = self->_currentContext.watchAdvertisementBufferScanCount;
    __int128 v10 = *(_OWORD *)&self->_currentContext.platformType;
    uint64_t v11 = *(void *)&self->_currentContext.supportsPerTypeDuplicateFilter;
    unint64_t v6 = hawkeyeLowEnergyScanCount - 1;
    unint64_t v8 = watchAdvertisementBufferScanCount;
    unint64_t v9 = hawkeyeLowEnergyScanCount - 1;
    -[CLAvengerScannerPolicy updateContext:](self, "updateContext:", v7);
    if (!v6 && (objc_opt_respondsToSelector(self->_delegate, "stoppedHawkeyeLowEnergyScan") & 1) != 0) {
      -[CLAvengerScannerPolicyDelegate stoppedHawkeyeLowEnergyScan](self->_delegate, "stoppedHawkeyeLowEnergyScan");
    }
  }

- (BOOL)hasActiveBTFindingScan
{
  return self->_currentContext.btFindingDiscoveryScanCount != 0;
}

- (BOOL)optedIn
{
  return self->_currentContext.optedIn;
}

- (void)setOptedIn:(BOOL)a3
{
  BOOL v3 = a3;
  __int128 v5 = *(_OWORD *)((char *)&self->_currentContext.coexFriendlyAggressiveDiscoveryScanCount + 1);
  __int128 v6 = *(_OWORD *)((char *)&self->_currentContext.watchAdvertisementBufferScanCount + 1);
  *(_OWORD *)unint64_t v7 = *(_OWORD *)((char *)&self->_currentContext.platformType + 1);
  *(void *)&v7[15] = *(void *)&self->_currentContext.supportsPerTypeDuplicateFilter;
  __int128 v4 = *(_OWORD *)(&self->_currentContext.optedIn + 1);
  -[CLAvengerScannerPolicy updateContext:](self, "updateContext:", &v3);
}

- (BOOL)associatedTo2GHzWiFi
{
  return self->_currentContext.associatedTo2GHzWiFi;
}

- (void)setAssociatedTo2GHzWiFi:(BOOL)a3
{
  __int128 v3 = *(_OWORD *)&self->_currentContext.platformType;
  v5[2] = *(_OWORD *)&self->_currentContext.watchAdvertisementBufferScanCount;
  v5[3] = v3;
  BOOL supportsPerTypeDuplicateFilter = self->_currentContext.supportsPerTypeDuplicateFilter;
  __int128 v4 = *(_OWORD *)&self->_currentContext.coexFriendlyAggressiveDiscoveryScanCount;
  v5[0] = *(_OWORD *)&self->_currentContext.optedIn;
  v5[1] = v4;
  int v8 = *(_DWORD *)&self->_currentContext.wifi2GHzCriticalState;
  __int16 v9 = *((_WORD *)&self->_currentContext.downgradedDuringCoexFriendlyAggressiveDiscoveryScan + 1);
  BOOL v7 = a3;
  -[CLAvengerScannerPolicy updateContext:](self, "updateContext:", v5);
}

- (BOOL)wifi2GHzCriticalState
{
  return self->_currentContext.wifi2GHzCriticalState;
}

- (void)setWifi2GHzCriticalState:(BOOL)a3
{
  __int128 v3 = *(_OWORD *)&self->_currentContext.platformType;
  v5[2] = *(_OWORD *)&self->_currentContext.watchAdvertisementBufferScanCount;
  v5[3] = v3;
  __int16 v6 = *(_WORD *)&self->_currentContext.supportsPerTypeDuplicateFilter;
  __int128 v4 = *(_OWORD *)&self->_currentContext.coexFriendlyAggressiveDiscoveryScanCount;
  v5[0] = *(_OWORD *)&self->_currentContext.optedIn;
  v5[1] = v4;
  BOOL v7 = a3;
  int v8 = *(_DWORD *)&self->_currentContext.bluetoothAudioActive;
  char v9 = *(&self->_currentContext.downgradedDuringCoexFriendlyAggressiveDiscoveryScan + 3);
  -[CLAvengerScannerPolicy updateContext:](self, "updateContext:", v5);
}

- (BOOL)bluetoothAudioActive
{
  return self->_currentContext.bluetoothAudioActive;
}

- (void)setBluetoothAudioActive:(BOOL)a3
{
  __int128 v3 = *(_OWORD *)&self->_currentContext.platformType;
  _OWORD v6[2] = *(_OWORD *)&self->_currentContext.watchAdvertisementBufferScanCount;
  *(_OWORD *)BOOL v7 = v3;
  *(_DWORD *)&v7[15] = *(_DWORD *)((char *)&self->_currentContext.totalAdvertisementBuffersAvailable + 7);
  __int128 v4 = *(_OWORD *)&self->_currentContext.coexFriendlyAggressiveDiscoveryScanCount;
  v6[0] = *(_OWORD *)&self->_currentContext.optedIn;
  v6[1] = v4;
  int v5 = *(_DWORD *)&self->_currentContext.downgradedDuringCoexFriendlyAggressiveDiscoveryScan;
  BOOL v8 = a3;
  int v9 = v5;
  -[CLAvengerScannerPolicy updateContext:](self, "updateContext:", v6);
}

- (BOOL)downgradedDuringCoexFriendlyAggressiveDiscoveryScan
{
  return self->_currentContext.downgradedDuringCoexFriendlyAggressiveDiscoveryScan;
}

- (unint64_t)totalAdvertisementBuffersAvailable
{
  return self->_currentContext.totalAdvertisementBuffersAvailable;
}

- (void)setTotalAdvertisementBuffersAvailable:(unint64_t)a3
{
  __int128 v3 = *(_OWORD *)&self->_currentContext.coexFriendlyAggressiveDiscoveryScanCount;
  v5[0] = *(_OWORD *)&self->_currentContext.optedIn;
  v5[1] = v3;
  v5[2] = *(_OWORD *)&self->_currentContext.watchAdvertisementBufferScanCount;
  uint64_t v4 = *(void *)&self->_currentContext.supportsPerTypeDuplicateFilter;
  int64_t platformType = self->_currentContext.platformType;
  unint64_t v7 = a3;
  uint64_t v8 = v4;
  -[CLAvengerScannerPolicy updateContext:](self, "updateContext:", v5);
}

- (CLAvengerScannerScanParameters)currentScanParameters
{
  switch(self[2].var2)
  {
    case 0LL:
      *(_WORD *)&retstr->var0 = 0;
      *(void *)&__int128 v3 = 0xFFFFLL;
      *((void *)&v3 + 1) = 0xFFFFLL;
      goto LABEL_19;
    case 1LL:
      retstr->var0 = self[2].var0;
      retstr->var1 = 1;
      __int128 v4 = xmmword_1012E4D50;
      goto LABEL_9;
    case 2LL:
      retstr->var0 = self[2].var0;
      retstr->var1 = 1;
      int64x2_t v5 = (int64x2_t)xmmword_1012E4D40;
      goto LABEL_17;
    case 3LL:
      retstr->var0 = self[2].var0;
      retstr->var1 = 1;
      retstr->var2 = 300LL;
      retstr->var3 = 0LL;
      int64_t v6 = 5LL;
      goto LABEL_20;
    case 4LL:
      retstr->var0 = self[2].var0;
      retstr->var1 = 1;
      retstr->var2 = 300LL;
      retstr->var3 = 0LL;
      int64_t v6 = 7LL;
      goto LABEL_20;
    case 5LL:
      retstr->var0 = self[2].var0;
      retstr->var1 = 1;
      *(_OWORD *)&retstr->var2 = xmmword_1012E4D10;
      __int128 v7 = xmmword_1012E4D30;
      goto LABEL_10;
    case 6LL:
      retstr->var0 = self[2].var0;
      retstr->var1 = 1;
      __int128 v4 = xmmword_1012E4D10;
LABEL_9:
      *(_OWORD *)&retstr->var2 = v4;
      __int128 v7 = xmmword_1012E4D20;
LABEL_10:
      *(_OWORD *)&retstr->var4 = v7;
      return self;
    case 7LL:
      retstr->var0 = self[2].var0;
      retstr->var1 = 1;
      unint64_t v8 = 300LL;
      goto LABEL_16;
    case 8LL:
      *(_WORD *)&retstr->var0 = 257;
      __int128 v3 = xmmword_1012E4D00;
      goto LABEL_19;
    case 9LL:
      retstr->var0 = self[2].var0;
      retstr->var1 = 1;
      unint64_t v8 = 90LL;
      goto LABEL_16;
    case 0xALL:
      *(_WORD *)&retstr->var0 = 257;
      __int128 v3 = xmmword_1012E4CF0;
      goto LABEL_19;
    case 0xBLL:
      retstr->var0 = self[2].var0;
      retstr->var1 = 1;
      unint64_t v8 = 30LL;
LABEL_16:
      int64x2_t v5 = vdupq_n_s64(v8);
LABEL_17:
      *(int64x2_t *)&retstr->var2 = v5;
      retstr->var4 = 0LL;
      retstr->var5 = 0LL;
      break;
    case 0xCLL:
      *(_WORD *)&retstr->var0 = 257;
      __int128 v3 = xmmword_1012E4CE0;
LABEL_19:
      *(_OWORD *)&retstr->var2 = v3;
      int64_t v6 = 4LL * (self[1].var5 != 0);
LABEL_20:
      retstr->var4 = 0LL;
      retstr->var5 = v6;
      break;
    default:
      return self;
  }

  return self;
}

+ (id)convertCLAvengerScannerPolicyScanTypeToString:(int64_t)a3
{
  else {
    return *(&off_10182EA60 + a3 - 1);
  }
}

- (int64_t)currentScanType
{
  return self->_currentScanType;
}

- (id).cxx_construct
{
  *((_BYTE *)self + 16) = 0;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 69) = 0u;
  return self;
}

@end