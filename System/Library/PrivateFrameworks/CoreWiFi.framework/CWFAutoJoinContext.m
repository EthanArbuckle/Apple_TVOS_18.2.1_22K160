@interface CWFAutoJoinContext
- (BOOL)BSSChannelsOnly;
- (BOOL)allowDeferredCandidates;
- (BOOL)allowStandalone6GHz;
- (BOOL)alwaysIncludeRemainingNon2GHzChannels;
- (BOOL)cacheOnly;
- (BOOL)didForceAllRemainingChannels;
- (BOOL)include6GHzChannels;
- (BOOL)includeAdjacent5GHzChannel;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAutoJoinContext:(id)a3;
- (BOOL)passiveScan;
- (BOOL)useCacheForPreviouslyScannedChannels;
- (CWFAutoJoinParameters)autoJoinParameters;
- (NSArray)ANQPElementIDList;
- (NSArray)SSIDList;
- (NSArray)recentChannelList;
- (NSArray)remainingChannelList;
- (NSOrderedSet)knownNetworks;
- (double)maxBSSLocationDistance;
- (double)minBSSLocationAccuracy;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)minRSSI;
- (unint64_t)dwellTime;
- (unint64_t)hash;
- (unint64_t)maxANQPCacheAge;
- (unint64_t)maxBSSChannelAge;
- (unint64_t)maxBSSChannelCount;
- (unint64_t)maxHiddenKnownNetworkSSIDAge;
- (unint64_t)maxScanCacheAge;
- (unint64_t)maxScanChannelCount;
- (unint64_t)maxScanCycles;
- (unint64_t)maxScanSSIDCount;
- (void)setANQPElementIDList:(id)a3;
- (void)setAllowDeferredCandidates:(BOOL)a3;
- (void)setAllowStandalone6GHz:(BOOL)a3;
- (void)setAlwaysIncludeRemainingNon2GHzChannels:(BOOL)a3;
- (void)setAutoJoinParameters:(id)a3;
- (void)setBSSChannelsOnly:(BOOL)a3;
- (void)setCacheOnly:(BOOL)a3;
- (void)setDidForceAllRemainingChannels:(BOOL)a3;
- (void)setDwellTime:(unint64_t)a3;
- (void)setInclude6GHzChannels:(BOOL)a3;
- (void)setIncludeAdjacent5GHzChannel:(BOOL)a3;
- (void)setKnownNetworks:(id)a3;
- (void)setMaxANQPCacheAge:(unint64_t)a3;
- (void)setMaxBSSChannelAge:(unint64_t)a3;
- (void)setMaxBSSChannelCount:(unint64_t)a3;
- (void)setMaxBSSLocationDistance:(double)a3;
- (void)setMaxHiddenKnownNetworkSSIDAge:(unint64_t)a3;
- (void)setMaxScanCacheAge:(unint64_t)a3;
- (void)setMaxScanChannelCount:(unint64_t)a3;
- (void)setMaxScanCycles:(unint64_t)a3;
- (void)setMaxScanSSIDCount:(unint64_t)a3;
- (void)setMinBSSLocationAccuracy:(double)a3;
- (void)setMinRSSI:(int64_t)a3;
- (void)setPassiveScan:(BOOL)a3;
- (void)setRecentChannelList:(id)a3;
- (void)setRemainingChannelList:(id)a3;
- (void)setSSIDList:(id)a3;
- (void)setUseCacheForPreviouslyScannedChannels:(BOOL)a3;
@end

@implementation CWFAutoJoinContext

- (BOOL)isEqualToAutoJoinContext:(id)a3
{
  id v4 = a3;
  autoJoinParameters = self->_autoJoinParameters;
  objc_msgSend_autoJoinParameters(v4, v6, v7, v8, v9);
  v14 = (CWFAutoJoinParameters *)objc_claimAutoreleasedReturnValue();
  if (autoJoinParameters != v14)
  {
    if (!self->_autoJoinParameters
      || (objc_msgSend_autoJoinParameters(v4, v10, v11, v12, v13),
          (v271 = (void *)objc_claimAutoreleasedReturnValue()) == 0LL))
    {
      BOOL v23 = 0;
      goto LABEL_101;
    }

    v19 = self->_autoJoinParameters;
    objc_msgSend_autoJoinParameters(v4, v15, v16, v17, v18);
    v270 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_isEqual_(v19, v20, (uint64_t)v270, v21, v22))
    {
      BOOL v23 = 0;
LABEL_100:

      goto LABEL_101;
    }
  }

  knownNetworks = self->_knownNetworks;
  objc_msgSend_knownNetworks(v4, v10, v11, v12, v13);
  v29 = (NSOrderedSet *)objc_claimAutoreleasedReturnValue();
  if (knownNetworks != v29)
  {
    if (!self->_knownNetworks)
    {
      BOOL v23 = 0;
LABEL_84:

      goto LABEL_99;
    }

    uint64_t v30 = objc_msgSend_knownNetworks(v4, v25, v26, v27, v28);
    if (!v30) {
      goto LABEL_97;
    }
    v269 = (void *)v30;
    v35 = self->_knownNetworks;
    uint64_t v36 = objc_msgSend_knownNetworks(v4, v31, v32, v33, v34);
    v37 = v35;
    v38 = (void *)v36;
    if ((objc_msgSend_isEqual_(v37, v39, v36, v40, v41) & 1) == 0)
    {

LABEL_96:
      goto LABEL_97;
    }

    v268 = v38;
  }

  recentChannelList = self->_recentChannelList;
  objc_msgSend_recentChannelList(v4, v25, v26, v27, v28);
  v47 = (NSArray *)objc_claimAutoreleasedReturnValue();
  if (recentChannelList == v47)
  {
LABEL_18:
    remainingChannelList = self->_remainingChannelList;
    objc_msgSend_remainingChannelList(v4, v43, v44, v45, v46);
    v62 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v266 = remainingChannelList;
    if (remainingChannelList != v62)
    {
      if (!self->_remainingChannelList)
      {
        BOOL v23 = 0;
LABEL_80:

        if (recentChannelList != v47)
        {
        }

        goto LABEL_82;
      }

      v267 = v62;
      uint64_t v67 = objc_msgSend_remainingChannelList(v4, v63, v64, v65, v66);
      if (v67)
      {
        v262 = (void *)v67;
        v72 = self->_remainingChannelList;
        objc_msgSend_remainingChannelList(v4, v68, v69, v70, v71);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_isEqual_(v72, v74, (uint64_t)v73, v75, v76))
        {
          v259 = v73;
          goto LABEL_26;
        }
      }

      if (recentChannelList == v47)
      {

        goto LABEL_94;
      }

- (BOOL)isEqual:(id)a3
{
  id v4 = (CWFAutoJoinContext *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char isEqualToAutoJoinContext = 1;
  }

  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char isEqualToAutoJoinContext = objc_msgSend_isEqualToAutoJoinContext_(self, v6, (uint64_t)v5, v7, v8);
  }

  else
  {
    char isEqualToAutoJoinContext = 0;
  }

  return isEqualToAutoJoinContext;
}

- (unint64_t)hash
{
  uint64_t v61 = objc_msgSend_hash(self->_autoJoinParameters, a2, v2, v3, v4);
  uint64_t v60 = objc_msgSend_hash(self->_knownNetworks, v6, v7, v8, v9);
  uint64_t v59 = objc_msgSend_hash(self->_recentChannelList, v10, v11, v12, v13);
  uint64_t v58 = objc_msgSend_hash(self->_remainingChannelList, v14, v15, v16, v17);
  uint64_t v57 = objc_msgSend_hash(self->_SSIDList, v18, v19, v20, v21);
  uint64_t v26 = objc_msgSend_hash(self->_ANQPElementIDList, v22, v23, v24, v25);
  unint64_t maxScanChannelCount = self->_maxScanChannelCount;
  unint64_t maxScanSSIDCount = self->_maxScanSSIDCount;
  BOOL passiveScan = self->_passiveScan;
  BOOL cacheOnly = self->_cacheOnly;
  BOOL useCacheForPreviouslyScannedChannels = self->_useCacheForPreviouslyScannedChannels;
  int8x16_t v56 = *(int8x16_t *)&self->_maxScanCacheAge;
  int8x16_t v55 = *(int8x16_t *)&self->_minRSSI;
  objc_msgSend_numberWithDouble_(MEMORY[0x189607968], v32, v33, v34, v35, self->_minBSSLocationAccuracy);
  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v41 = objc_msgSend_hash(v36, v37, v38, v39, v40);
  objc_msgSend_numberWithDouble_(MEMORY[0x189607968], v42, v43, v44, v45, self->_maxBSSLocationDistance);
  uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v51 = objc_msgSend_hash(v46, v47, v48, v49, v50);
  int8x16_t v52 = veorq_s8(v56, v55);
  unint64_t v53 = *(void *)&veor_s8(*(int8x8_t *)v52.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v52, v52, 8uLL)) ^ passiveScan ^ cacheOnly ^ useCacheForPreviouslyScannedChannels ^ (unint64_t)(self->_BSSChannelsOnly ^ self->_includeAdjacent5GHzChannel ^ self->_allowStandalone6GHz ^ self->_include6GHzChannels) ^ maxScanChannelCount ^ self->_didForceAllRemainingChannels ^ self->_alwaysIncludeRemainingNon2GHzChannels ^ self->_allowDeferredCandidates ^ maxScanSSIDCount ^ self->_maxScanCycles ^ self->_maxBSSChannelCount ^ self->_maxBSSChannelAge ^ self->_maxHiddenKnownNetworkSSIDAge ^ v51 ^ v41 ^ v26 ^ v57 ^ v58 ^ v59 ^ v60 ^ v61;

  return v53;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6 = (void *)objc_msgSend_allocWithZone_(CWFAutoJoinContext, a2, (uint64_t)a3, v3, v4);
  uint64_t v11 = (void *)objc_msgSend_init(v6, v7, v8, v9, v10);
  objc_msgSend_setAutoJoinParameters_(v11, v12, (uint64_t)self->_autoJoinParameters, v13, v14);
  objc_msgSend_setKnownNetworks_(v11, v15, (uint64_t)self->_knownNetworks, v16, v17);
  objc_msgSend_setRecentChannelList_(v11, v18, (uint64_t)self->_recentChannelList, v19, v20);
  objc_msgSend_setRemainingChannelList_(v11, v21, (uint64_t)self->_remainingChannelList, v22, v23);
  objc_msgSend_setSSIDList_(v11, v24, (uint64_t)self->_SSIDList, v25, v26);
  objc_msgSend_setANQPElementIDList_(v11, v27, (uint64_t)self->_ANQPElementIDList, v28, v29);
  objc_msgSend_setMaxScanChannelCount_(v11, v30, self->_maxScanChannelCount, v31, v32);
  objc_msgSend_setMaxScanSSIDCount_(v11, v33, self->_maxScanSSIDCount, v34, v35);
  objc_msgSend_setMaxScanCacheAge_(v11, v36, self->_maxScanCacheAge, v37, v38);
  objc_msgSend_setMaxANQPCacheAge_(v11, v39, self->_maxANQPCacheAge, v40, v41);
  objc_msgSend_setMinRSSI_(v11, v42, self->_minRSSI, v43, v44);
  objc_msgSend_setDwellTime_(v11, v45, self->_dwellTime, v46, v47);
  objc_msgSend_setPassiveScan_(v11, v48, self->_passiveScan, v49, v50);
  objc_msgSend_setCacheOnly_(v11, v51, self->_cacheOnly, v52, v53);
  objc_msgSend_setUseCacheForPreviouslyScannedChannels_(v11, v54, self->_useCacheForPreviouslyScannedChannels, v55, v56);
  objc_msgSend_setMinBSSLocationAccuracy_(v11, v57, v58, v59, v60, self->_minBSSLocationAccuracy);
  objc_msgSend_setMaxBSSLocationDistance_(v11, v61, v62, v63, v64, self->_maxBSSLocationDistance);
  objc_msgSend_setMaxScanCycles_(v11, v65, self->_maxScanCycles, v66, v67);
  objc_msgSend_setBSSChannelsOnly_(v11, v68, self->_BSSChannelsOnly, v69, v70);
  objc_msgSend_setMaxBSSChannelCount_(v11, v71, self->_maxBSSChannelCount, v72, v73);
  objc_msgSend_setMaxBSSChannelAge_(v11, v74, self->_maxBSSChannelAge, v75, v76);
  objc_msgSend_setMaxHiddenKnownNetworkSSIDAge_(v11, v77, self->_maxHiddenKnownNetworkSSIDAge, v78, v79);
  objc_msgSend_setIncludeAdjacent5GHzChannel_(v11, v80, self->_includeAdjacent5GHzChannel, v81, v82);
  objc_msgSend_setAllowStandalone6GHz_(v11, v83, self->_allowStandalone6GHz, v84, v85);
  objc_msgSend_setInclude6GHzChannels_(v11, v86, self->_include6GHzChannels, v87, v88);
  objc_msgSend_setAlwaysIncludeRemainingNon2GHzChannels_( v11,  v89,  self->_alwaysIncludeRemainingNon2GHzChannels,  v90,  v91);
  objc_msgSend_setAllowDeferredCandidates_(v11, v92, self->_allowDeferredCandidates, v93, v94);
  objc_msgSend_setDidForceAllRemainingChannels_(v11, v95, self->_didForceAllRemainingChannels, v96, v97);
  return v11;
}

- (CWFAutoJoinParameters)autoJoinParameters
{
  return self->_autoJoinParameters;
}

- (void)setAutoJoinParameters:(id)a3
{
}

- (NSOrderedSet)knownNetworks
{
  return self->_knownNetworks;
}

- (void)setKnownNetworks:(id)a3
{
}

- (NSArray)recentChannelList
{
  return self->_recentChannelList;
}

- (void)setRecentChannelList:(id)a3
{
}

- (NSArray)remainingChannelList
{
  return self->_remainingChannelList;
}

- (void)setRemainingChannelList:(id)a3
{
}

- (NSArray)SSIDList
{
  return self->_SSIDList;
}

- (void)setSSIDList:(id)a3
{
}

- (NSArray)ANQPElementIDList
{
  return self->_ANQPElementIDList;
}

- (void)setANQPElementIDList:(id)a3
{
}

- (unint64_t)maxScanChannelCount
{
  return self->_maxScanChannelCount;
}

- (void)setMaxScanChannelCount:(unint64_t)a3
{
  self->_unint64_t maxScanChannelCount = a3;
}

- (BOOL)BSSChannelsOnly
{
  return self->_BSSChannelsOnly;
}

- (void)setBSSChannelsOnly:(BOOL)a3
{
  self->_int BSSChannelsOnly = a3;
}

- (unint64_t)maxBSSChannelCount
{
  return self->_maxBSSChannelCount;
}

- (void)setMaxBSSChannelCount:(unint64_t)a3
{
  self->_unint64_t maxBSSChannelCount = a3;
}

- (unint64_t)maxBSSChannelAge
{
  return self->_maxBSSChannelAge;
}

- (void)setMaxBSSChannelAge:(unint64_t)a3
{
  self->_unint64_t maxBSSChannelAge = a3;
}

- (unint64_t)maxScanSSIDCount
{
  return self->_maxScanSSIDCount;
}

- (void)setMaxScanSSIDCount:(unint64_t)a3
{
  self->_unint64_t maxScanSSIDCount = a3;
}

- (unint64_t)maxHiddenKnownNetworkSSIDAge
{
  return self->_maxHiddenKnownNetworkSSIDAge;
}

- (void)setMaxHiddenKnownNetworkSSIDAge:(unint64_t)a3
{
  self->_unint64_t maxHiddenKnownNetworkSSIDAge = a3;
}

- (unint64_t)maxScanCacheAge
{
  return self->_maxScanCacheAge;
}

- (void)setMaxScanCacheAge:(unint64_t)a3
{
  self->_unint64_t maxScanCacheAge = a3;
}

- (unint64_t)maxANQPCacheAge
{
  return self->_maxANQPCacheAge;
}

- (void)setMaxANQPCacheAge:(unint64_t)a3
{
  self->_unint64_t maxANQPCacheAge = a3;
}

- (unint64_t)maxScanCycles
{
  return self->_maxScanCycles;
}

- (void)setMaxScanCycles:(unint64_t)a3
{
  self->_unint64_t maxScanCycles = a3;
}

- (int64_t)minRSSI
{
  return self->_minRSSI;
}

- (void)setMinRSSI:(int64_t)a3
{
  self->_int64_t minRSSI = a3;
}

- (unint64_t)dwellTime
{
  return self->_dwellTime;
}

- (void)setDwellTime:(unint64_t)a3
{
  self->_unint64_t dwellTime = a3;
}

- (BOOL)passiveScan
{
  return self->_passiveScan;
}

- (void)setPassiveScan:(BOOL)a3
{
  self->_BOOL passiveScan = a3;
}

- (BOOL)cacheOnly
{
  return self->_cacheOnly;
}

- (void)setCacheOnly:(BOOL)a3
{
  self->_BOOL cacheOnly = a3;
}

- (BOOL)useCacheForPreviouslyScannedChannels
{
  return self->_useCacheForPreviouslyScannedChannels;
}

- (void)setUseCacheForPreviouslyScannedChannels:(BOOL)a3
{
  self->_BOOL useCacheForPreviouslyScannedChannels = a3;
}

- (double)minBSSLocationAccuracy
{
  return self->_minBSSLocationAccuracy;
}

- (void)setMinBSSLocationAccuracy:(double)a3
{
  self->_minBSSLocationAccuracy = a3;
}

- (double)maxBSSLocationDistance
{
  return self->_maxBSSLocationDistance;
}

- (void)setMaxBSSLocationDistance:(double)a3
{
  self->_maxBSSLocationDistance = a3;
}

- (BOOL)includeAdjacent5GHzChannel
{
  return self->_includeAdjacent5GHzChannel;
}

- (void)setIncludeAdjacent5GHzChannel:(BOOL)a3
{
  self->_int includeAdjacent5GHzChannel = a3;
}

- (BOOL)allowStandalone6GHz
{
  return self->_allowStandalone6GHz;
}

- (void)setAllowStandalone6GHz:(BOOL)a3
{
  self->_int allowStandalone6GHz = a3;
}

- (BOOL)include6GHzChannels
{
  return self->_include6GHzChannels;
}

- (void)setInclude6GHzChannels:(BOOL)a3
{
  self->_int include6GHzChannels = a3;
}

- (BOOL)alwaysIncludeRemainingNon2GHzChannels
{
  return self->_alwaysIncludeRemainingNon2GHzChannels;
}

- (void)setAlwaysIncludeRemainingNon2GHzChannels:(BOOL)a3
{
  self->_int alwaysIncludeRemainingNon2GHzChannels = a3;
}

- (BOOL)allowDeferredCandidates
{
  return self->_allowDeferredCandidates;
}

- (void)setAllowDeferredCandidates:(BOOL)a3
{
  self->_int allowDeferredCandidates = a3;
}

- (BOOL)didForceAllRemainingChannels
{
  return self->_didForceAllRemainingChannels;
}

- (void)setDidForceAllRemainingChannels:(BOOL)a3
{
  self->_int didForceAllRemainingChannels = a3;
}

- (void).cxx_destruct
{
}

@end