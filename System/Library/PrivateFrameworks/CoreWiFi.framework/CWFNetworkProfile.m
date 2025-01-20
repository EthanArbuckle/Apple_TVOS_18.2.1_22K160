@interface CWFNetworkProfile
+ (BOOL)supportsSecureCoding;
+ (id)supportedOSSpecificKeys;
- (BOOL)_isHomeNetwork;
- (BOOL)_shouldDisplayDeviceNames;
- (BOOL)bypassCaptive;
- (BOOL)isAllowedInLockdownMode;
- (BOOL)isAmbiguousNetworkName;
- (BOOL)isAppBased;
- (BOOL)isAutoJoinDisabled;
- (BOOL)isAutojoinDisabledUntilFirstUserJoin;
- (BOOL)isBlueAtlasNetwork;
- (BOOL)isCaptive;
- (BOOL)isCaptiveStateDetermined;
- (BOOL)isCarPlay;
- (BOOL)isCarPlayNetwork;
- (BOOL)isDNSHeuristicsFilteredNetwork;
- (BOOL)isEAP;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToNetworkProfile:(id)a3;
- (BOOL)isHighPopularity;
- (BOOL)isHighQuality;
- (BOOL)isHotspot;
- (BOOL)isLowPopularity;
- (BOOL)isLowQuality;
- (BOOL)isOWE;
- (BOOL)isOpen;
- (BOOL)isPSK;
- (BOOL)isPasspoint;
- (BOOL)isPasspointHomeOperatorNetwork;
- (BOOL)isPasspointProvisionedNetwork;
- (BOOL)isPasswordSharingDisabled;
- (BOOL)isPasswordSharingSupported;
- (BOOL)isPersonalHotspot;
- (BOOL)isPotentiallyCaptive;
- (BOOL)isPotentiallyMoving;
- (BOOL)isPrivacyProxyEnabled;
- (BOOL)isProfileBased;
- (BOOL)isProminentDisplay;
- (BOOL)isPublicAirPlayNetwork;
- (BOOL)isServiceProviderRoamingEnabled;
- (BOOL)isSessionBased;
- (BOOL)isStandalone6G;
- (BOOL)isSuspicious;
- (BOOL)isSystemMode;
- (BOOL)isTCPGood;
- (BOOL)isTLSCertificateRequired;
- (BOOL)isWAPI;
- (BOOL)isWEP;
- (BOOL)isWPA;
- (BOOL)isWPA2;
- (BOOL)isWPA3;
- (BOOL)privateMACAddressDisabledByEvaluation;
- (BOOL)privateMACAddressEnabledForEvaluation;
- (BOOL)useCachedIdentifier;
- (BOOL)useCachedNetworkName;
- (BOOL)useCachedShortSSID;
- (BOOL)wasCaptive;
- (BOOL)wasMoreRecentlyJoinedByUser;
- (BOOL)wasRecently6GHzOnlyOnAnyDevice;
- (CWFNetworkProfile)init;
- (CWFNetworkProfile)initWithCoder:(id)a3;
- (CWFNetworkProfile)initWithExternalForm:(id)a3;
- (NSArray)NAIRealmNameList;
- (NSArray)TLSTrustedServerNames;
- (NSArray)acceptedEAPTypes;
- (NSArray)cellularNetworkInfo;
- (NSArray)innerAcceptedEAPTypes;
- (NSArray)roamingConsortiumList;
- (NSArray)seamlessSSIDList;
- (NSData)SSID;
- (NSDate)addedAt;
- (NSDate)cachedPrivateMACAddressUpdatedAt;
- (NSDate)captiveWebsheetLoginDate;
- (NSDate)disable6EModeTimestamp;
- (NSDate)lastDiscoveredAt;
- (NSDate)lastJoinedAt;
- (NSDate)lastJoinedBySystemAt;
- (NSDate)lastJoinedByUserAt;
- (NSDate)lastJoinedOnAnyDeviceAt;
- (NSDate)privateMACAddressEvaluatedAt;
- (NSDate)privateMACAddressModeUserSettingUpdatedAt;
- (NSDate)updatedAt;
- (NSDate)was6GHzOnlyAt;
- (NSDate)was6GHzOnlyOnAnyDeviceAt;
- (NSDate)wasHiddenBefore;
- (NSDictionary)DNSHeuristicsFailureStateInfo;
- (NSDictionary)EAPProfile;
- (NSDictionary)OSSpecificAttributes;
- (NSDictionary)captiveProfile;
- (NSDictionary)discoveredDevices;
- (NSDictionary)userPreferredNetworkNames;
- (NSDictionary)userPreferredPasspointDomains;
- (NSMutableDictionary)internal;
- (NSSet)BSSList;
- (NSSet)properties;
- (NSString)NANServiceID;
- (NSString)bundleID;
- (NSString)cachedIdentifier;
- (NSString)cachedNetworkName;
- (NSString)cachedPrivateMACAddress;
- (NSString)carplayUUID;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)displayedOperatorName;
- (NSString)domainName;
- (NSString)networkGroupID;
- (NSString)networkName;
- (NSString)payloadUUID;
- (NSString)privacyProxyBlockedReason;
- (double)networkQualityResponsiveness;
- (id)JSONCompatibleKeyValueMap;
- (id)OSSpecificValueForKey:(id)a3;
- (id)OTASystemInfoBeaconProbeList;
- (id)SIMIdentifiers;
- (id)__basicDescription;
- (id)__coreWiFiSpecificProperties;
- (id)__defaultProperties;
- (id)__descriptionFor6EMode;
- (id)__descriptionForBSSListWithLimit:(unint64_t)a3;
- (id)__descriptionForCaptiveFlags;
- (id)__descriptionForHiddenState;
- (id)__descriptionForLowDataMode;
- (id)__descriptionForMovingAttribute;
- (id)__descriptionForNearbyShareableStatus;
- (id)__descriptionForPrivateMAC;
- (id)__descriptionForPublicAttribute;
- (id)__filteredNetworkProfileWithProperties:(id)a3 includeRequiredProperties:(BOOL)a4 OSSpecificKeys:(id)a5;
- (id)__keyForProperty:(int64_t)a3;
- (id)__requiredProperties;
- (id)_location;
- (id)changedOSSpecificKeysFromNetworkProfile:(id)a3;
- (id)changedPropertiesFromNetworkProfile:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)coreWiFiSpecificAttributes;
- (id)expirationDate;
- (id)externalForm;
- (id)filteredNetworkProfileWithProperties:(id)a3;
- (id)filteredNetworkProfileWithProperties:(id)a3 OSSpecificKeys:(id)a4;
- (id)identifier;
- (id)lastDisconnectTimestamp;
- (id)lastHomeForceFixDate;
- (id)matchingKnownBSS:(id)a3;
- (id)networkDisabledUntilDate;
- (id)networkQualityDate;
- (id)passpointAccountName;
- (id)walletIdentifier;
- (int)lastDisconnectReason;
- (int)transitionDisabledFlags;
- (int64_t)WAPISubtype;
- (int64_t)WEPSubtype;
- (int64_t)__propertyForKey:(id)a3;
- (int64_t)addReason;
- (int64_t)compareSupportedSecurityTypes:(id)a3;
- (int64_t)compareUserPriority:(id)a3;
- (int64_t)disable6EMode;
- (int64_t)hiddenState;
- (int64_t)locationOfInterest;
- (int64_t)lowDataMode;
- (int64_t)movingAttribute;
- (int64_t)nearbyShareableStatus;
- (int64_t)networkOfInterestHomeState;
- (int64_t)networkOfInterestWorkState;
- (int64_t)privateMACAddressEvaluationState;
- (int64_t)privateMACAddressModeConfigurationProfileSetting;
- (int64_t)privateMACAddressModeUserSetting;
- (int64_t)publicAttribute;
- (int64_t)ssidHarvestStatus;
- (unint64_t)cachedShortSSID;
- (unint64_t)effectiveSupportedSecurityTypes;
- (unint64_t)hash;
- (unint64_t)lastJoinedBySystemAtWeek;
- (unint64_t)networkGroupPriority;
- (unint64_t)popularityScore;
- (unint64_t)qualityScore;
- (unint64_t)shortSSID;
- (unint64_t)strongestSupportedSecurityType;
- (unint64_t)supportedSecurityTypes;
- (unint64_t)totalNetworkUsage;
- (unint64_t)was6GHzOnlyAtWeek;
- (unint64_t)weakestSupportedSecurityType;
- (void)encodeWithCoder:(id)a3;
- (void)mergeWithNetworkProfile:(id)a3;
- (void)setAddReason:(int64_t)a3;
- (void)setAddedAt:(id)a3;
- (void)setAutoJoinDisabled:(BOOL)a3;
- (void)setBSSList:(id)a3;
- (void)setBlueAtlasNetwork:(BOOL)a3;
- (void)setBundleID:(id)a3;
- (void)setCachedIdentifier:(id)a3;
- (void)setCachedNetworkName:(id)a3;
- (void)setCachedPrivateMACAddress:(id)a3;
- (void)setCachedPrivateMACAddressUpdatedAt:(id)a3;
- (void)setCachedShortSSID:(unint64_t)a3;
- (void)setCaptiveProfile:(id)a3;
- (void)setCarplayNetwork:(BOOL)a3;
- (void)setCarplayUUID:(id)a3;
- (void)setCellularNetworkInfo:(id)a3;
- (void)setCoreWiFiSpecificAttributes:(id)a3;
- (void)setDNSHeuristicsFailureStateInfo:(id)a3;
- (void)setDNSHeuristicsFilteredNetwork:(BOOL)a3;
- (void)setDisable6EMode:(int64_t)a3;
- (void)setDisable6EModeTimestamp:(id)a3;
- (void)setDisableAutojoinUntilFirstUserJoin:(BOOL)a3;
- (void)setDiscoveredDevices:(id)a3;
- (void)setDisplayedOperatorName:(id)a3;
- (void)setDomainName:(id)a3;
- (void)setEAPProfile:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setHiddenState:(int64_t)a3;
- (void)setHighPopularity:(BOOL)a3;
- (void)setHighQuality:(BOOL)a3;
- (void)setInternal:(id)a3;
- (void)setIsSuspicious:(BOOL)a3;
- (void)setIsTCPGood:(BOOL)a3;
- (void)setLastDisconnectReason:(int)a3;
- (void)setLastDisconnectTimestamp:(id)a3;
- (void)setLastDiscoveredAt:(id)a3;
- (void)setLastHomeForceFixDate:(id)a3;
- (void)setLastJoinedBySystemAt:(id)a3;
- (void)setLastJoinedBySystemAtWeek:(unint64_t)a3;
- (void)setLastJoinedByUserAt:(id)a3;
- (void)setLocationOfInterest:(int64_t)a3;
- (void)setLowDataMode:(int64_t)a3;
- (void)setLowPopularity:(BOOL)a3;
- (void)setLowQuality:(BOOL)a3;
- (void)setMovingAttribute:(int64_t)a3;
- (void)setNAIRealmNameList:(id)a3;
- (void)setNANServiceID:(id)a3;
- (void)setNearbyShareableStatus:(int64_t)a3;
- (void)setNetworkDisabledUntilDate:(id)a3;
- (void)setNetworkGroupID:(id)a3;
- (void)setNetworkGroupPriority:(unint64_t)a3;
- (void)setNetworkOfInterestHomeState:(int64_t)a3;
- (void)setNetworkOfInterestWorkState:(int64_t)a3;
- (void)setNetworkQualityDate:(id)a3;
- (void)setNetworkQualityResponsiveness:(double)a3;
- (void)setOSSpecificAttributes:(id)a3;
- (void)setOSSpecificValue:(id)a3 forKey:(id)a4;
- (void)setOTASystemInfoBeaconProbeList:(id)a3;
- (void)setPasspointAccountName:(id)a3;
- (void)setPasspointHomeOperatorNetwork:(BOOL)a3;
- (void)setPasspointProvisionedNetwork:(BOOL)a3;
- (void)setPasswordSharingDisabled:(BOOL)a3;
- (void)setPayloadUUID:(id)a3;
- (void)setPersonalHotspot:(BOOL)a3;
- (void)setPopularityScore:(unint64_t)a3;
- (void)setPotentiallyCaptive:(BOOL)a3;
- (void)setPotentiallyMoving:(BOOL)a3;
- (void)setPrivacyProxyBlockedReason:(id)a3;
- (void)setPrivacyProxyEnabled:(BOOL)a3;
- (void)setPrivateMACAddressEvaluatedAt:(id)a3;
- (void)setPrivateMACAddressEvaluationState:(int64_t)a3;
- (void)setPrivateMACAddressModeConfigurationProfileSetting:(int64_t)a3;
- (void)setPrivateMACAddressModeUserSetting:(int64_t)a3;
- (void)setPrivateMACAddressModeUserSettingUpdatedAt:(id)a3;
- (void)setProminentDisplay:(BOOL)a3;
- (void)setPublicAirPlayNetwork:(BOOL)a3;
- (void)setPublicAttribute:(int64_t)a3;
- (void)setQualityScore:(unint64_t)a3;
- (void)setRoamingConsortiumList:(id)a3;
- (void)setSIMIdentifiers:(id)a3;
- (void)setSSID:(id)a3;
- (void)setSSIDHarvestStatus:(int64_t)a3;
- (void)setSeamlessSSIDList:(id)a3;
- (void)setServiceProviderRoamingEnabled:(BOOL)a3;
- (void)setSessionBased:(BOOL)a3;
- (void)setStandalone6G:(BOOL)a3;
- (void)setSupportedSecurityTypes:(unint64_t)a3;
- (void)setSystemMode:(BOOL)a3;
- (void)setTotalNetworkUsage:(unint64_t)a3;
- (void)setTransitionDisabledFlags:(int)a3;
- (void)setUpdatedAt:(id)a3;
- (void)setUseCachedIdentifier:(BOOL)a3;
- (void)setUseCachedNetworkName:(BOOL)a3;
- (void)setUseCachedShortSSID:(BOOL)a3;
- (void)setUserPreferredNetworkNames:(id)a3;
- (void)setUserPreferredPasspointDomains:(id)a3;
- (void)setWAPISubtype:(int64_t)a3;
- (void)setWEPSubtype:(int64_t)a3;
- (void)setWalletIdentifier:(id)a3;
- (void)setWas6GHzOnlyAt:(id)a3;
- (void)setWas6GHzOnlyAtWeek:(unint64_t)a3;
- (void)setWasHiddenBefore:(id)a3;
@end

@implementation CWFNetworkProfile

- (id)JSONCompatibleKeyValueMap
{
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend_mutableCopy(v6, v7, v8, v9, v10);

  objc_msgSend_networkName(self, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v11, v17, (uint64_t)v16, (uint64_t)@"networkName", v18);

  sub_1864586CC(v11, 0LL, 1u);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    objc_msgSend_dictionaryWithDictionary_(MEMORY[0x189603F68], v19, (uint64_t)v22, v20, v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v23 = 0LL;
  }

  return v23;
}

- (id)__defaultProperties
{
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  for (uint64_t i = 0LL; i != 93; ++i)
  {
    objc_msgSend_numberWithInteger_(MEMORY[0x189607968], v5, i, v6, v7);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v8, v11, (uint64_t)v10, v12, v13);
  }

  uint64_t v15 = (void *)objc_msgSend_copy(v8, v5, v14, v6, v7);

  return v15;
}

- (id)__requiredProperties
{
  return (id)objc_msgSend_setWithArray_(MEMORY[0x189604010], a2, (uint64_t)&unk_189E8A908, v2, v3);
}

- (id)__filteredNetworkProfileWithProperties:(id)a3 includeRequiredProperties:(BOOL)a4 OSSpecificKeys:(id)a5
{
  BOOL v6 = a4;
  uint64_t v103 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = objc_alloc_init(&OBJC_CLASS___CWFNetworkProfile);
  uint64_t v15 = (void *)objc_msgSend_mutableCopy(self->_internal, v11, v12, v13, v14);
  objc_msgSend_properties(self, v16, v17, v18, v19);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend_mutableCopy(v20, v21, v22, v23, v24);

  if (v6)
  {
    objc_msgSend___requiredProperties(self, v26, v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_minusSet_(v25, v31, (uint64_t)v30, v32, v33);
  }

  if (v8)
  {
    objc_msgSend_minusSet_(v25, v26, (uint64_t)v8, v28, v29);
  }

  else
  {
    objc_msgSend___defaultProperties(self, v26, v27, v28, v29);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_minusSet_(v25, v39, (uint64_t)v38, v40, v41);
  }

  objc_msgSend_allObjects(v25, v34, v35, v36, v37);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObjectsForKeys_(v15, v43, (uint64_t)v42, v44, v45);

  objc_msgSend_setInternal_(v10, v46, (uint64_t)v15, v47, v48);
  int v52 = objc_msgSend_containsObject_(v8, v49, (uint64_t)&unk_189E87EC0, v50, v51);
  if (v9 && v52)
  {
    v94 = v25;
    v95 = v15;
    v96 = v10;
    id v97 = v8;
    objc_msgSend_dictionary(MEMORY[0x189603FC8], v53, v54, v55, v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v98 = 0u;
    __int128 v99 = 0u;
    __int128 v100 = 0u;
    __int128 v101 = 0u;
    objc_msgSend_OSSpecificAttributes(self, v58, v59, v60, v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_allKeys(v62, v63, v64, v65, v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v69 = objc_msgSend_countByEnumeratingWithState_objects_count_(v67, v68, (uint64_t)&v98, (uint64_t)v102, 16);
    if (v69)
    {
      uint64_t v73 = v69;
      uint64_t v74 = *(void *)v99;
      do
      {
        for (uint64_t i = 0LL; i != v73; ++i)
        {
          if (*(void *)v99 != v74) {
            objc_enumerationMutation(v67);
          }
          uint64_t v76 = *(void *)(*((void *)&v98 + 1) + 8 * i);
          if (objc_msgSend_containsObject_(v9, v70, v76, v71, v72))
          {
            objc_msgSend_OSSpecificAttributes(self, v70, v77, v71, v72);
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKeyedSubscript_(v78, v79, v76, v80, v81);
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKeyedSubscript_(v57, v83, (uint64_t)v82, v76, v84);
          }
        }

        uint64_t v73 = objc_msgSend_countByEnumeratingWithState_objects_count_(v67, v70, (uint64_t)&v98, (uint64_t)v102, 16);
      }

      while (v73);
    }

    v89 = (void *)objc_msgSend_copy(v57, v85, v86, v87, v88);
    uint64_t v10 = v96;
    objc_msgSend_setOSSpecificAttributes_(v96, v90, (uint64_t)v89, v91, v92);

    id v8 = v97;
    v25 = v94;
    uint64_t v15 = v95;
  }

  return v10;
}

- (id)filteredNetworkProfileWithProperties:(id)a3
{
  return (id)objc_msgSend___filteredNetworkProfileWithProperties_includeRequiredProperties_OSSpecificKeys_( self,  a2,  (uint64_t)a3,  1,  0);
}

- (id)filteredNetworkProfileWithProperties:(id)a3 OSSpecificKeys:(id)a4
{
  return (id)objc_msgSend___filteredNetworkProfileWithProperties_includeRequiredProperties_OSSpecificKeys_( self,  a2,  (uint64_t)a3,  1,  (uint64_t)a4);
}

- (int64_t)compareSupportedSecurityTypes:(id)a3
{
  id v4 = a3;
  uint64_t v9 = objc_msgSend_weakestSupportedSecurityType(self, v5, v6, v7, v8);
  uint64_t v14 = objc_msgSend_weakestSupportedSecurityType(v4, v10, v11, v12, v13);
  uint64_t v19 = objc_msgSend_strongestSupportedSecurityType(self, v15, v16, v17, v18);
  uint64_t v24 = objc_msgSend_strongestSupportedSecurityType(v4, v20, v21, v22, v23);
  uint64_t v29 = objc_msgSend_WAPISubtype(self, v25, v26, v27, v28);
  uint64_t v34 = objc_msgSend_WAPISubtype(v4, v30, v31, v32, v33);
  uint64_t v39 = objc_msgSend_WEPSubtype(self, v35, v36, v37, v38);
  uint64_t v44 = objc_msgSend_WEPSubtype(v4, v40, v41, v42, v43);

  if (v9 == v14)
  {
    if (v19 == v24) {
      return 0LL;
    }
    uint64_t v46 = v19;
    uint64_t v47 = v39;
    uint64_t v48 = v29;
    uint64_t v49 = v24;
  }

  else
  {
    uint64_t v46 = v9;
    uint64_t v47 = v39;
    uint64_t v48 = v29;
    uint64_t v49 = v14;
  }

  return CWFCompareSecurityType(v46, v47, v48, v49, v44, v34);
}

- (int64_t)compareUserPriority:(id)a3
{
  id v4 = a3;
  objc_msgSend_userPreferredNetworkNames(self, v5, v6, v7, v8);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_userPreferredNetworkNames(v4, v10, v11, v12, v13);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_userPreferredPasspointDomains(self, v15, v16, v17, v18);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_userPreferredPasspointDomains(v4, v20, v21, v22, v23);
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_domainName(self, v25, v26, v27, v28);
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_domainName(v4, v30, v31, v32, v33);
  uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v39 = objc_msgSend_networkName(self, v35, v36, v37, v38);
  uint64_t v44 = objc_msgSend_networkName(v4, v40, v41, v42, v43);

  uint64_t v80 = v24;
  objc_msgSend_objectForKeyedSubscript_(v24, v45, (uint64_t)v29, v46, v47);
  uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v19, v49, (uint64_t)v34, v50, v51);
  int v52 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = (void *)v39;
  v83 = v14;
  objc_msgSend_objectForKeyedSubscript_(v14, v53, v39, v54, v55);
  uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v81 = (void *)v44;
  objc_msgSend_objectForKeyedSubscript_(v9, v57, v44, v58, v59);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = v9;
  if (v56 && v48)
  {
    objc_msgSend_laterDate_(v56, v60, (uint64_t)v48, v61, v62);
    id v64 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    if (v56) {
      v68 = v56;
    }
    else {
      v68 = v48;
    }
    id v64 = v68;
  }

  uint64_t v69 = v64;
  uint64_t v84 = v19;
  if (v63 && v52)
  {
    objc_msgSend_laterDate_(v63, v65, (uint64_t)v52, v66, v67);
    id v70 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    if (v63) {
      uint64_t v74 = v63;
    }
    else {
      uint64_t v74 = v52;
    }
    id v70 = v74;
  }

  v75 = v70;
  if (v69 && v70)
  {
    uint64_t v76 = v80;
    int64_t v77 = objc_msgSend_compare_(v69, v71, (uint64_t)v70, v72, v73);
  }

  else
  {
    uint64_t v76 = v80;
    if (v70) {
      uint64_t v78 = -1LL;
    }
    else {
      uint64_t v78 = 0LL;
    }
    if (v69) {
      int64_t v77 = 1LL;
    }
    else {
      int64_t v77 = v78;
    }
  }

  return v77;
}

- (id)matchingKnownBSS:(id)a3
{
  uint64_t v43 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  objc_msgSend_BSSList(self, v5, v6, v7, v8);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v14 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v38, (uint64_t)v42, 16);
  if (v14)
  {
    uint64_t v15 = *(void *)v39;
    do
    {
      for (uint64_t i = 0LL; i != v14; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v39 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void **)(*((void *)&v38 + 1) + 8LL * (void)i);
        uint64_t v18 = objc_msgSend_BSSID(v17, v10, v11, v12, v13);
        if (v18)
        {
          uint64_t v19 = (void *)v18;
          uint64_t v20 = objc_msgSend_BSSID(v4, v10, v11, v12, v13);
          if (v20)
          {
            v25 = (void *)v20;
            objc_msgSend_BSSID(v17, v21, v22, v23, v24);
            uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_BSSID(v4, v27, v28, v29, v30);
            uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
            int isEqual = objc_msgSend_isEqual_(v26, v32, (uint64_t)v31, v33, v34);

            if (isEqual)
            {
              id v14 = v17;
              goto LABEL_13;
            }
          }

          else
          {
          }
        }
      }

      id v14 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v38, (uint64_t)v42, 16);
    }

    while (v14);
  }

- (CWFNetworkProfile)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CWFNetworkProfile;
  uint64_t v2 = -[CWFNetworkProfile init](&v6, sel_init);
  if (!v2
    || (uint64_t v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]),
        internal = v2->_internal,
        v2->_internal = v3,
        internal,
        !v2->_internal))
  {

    return 0LL;
  }

  return v2;
}

- (id)__keyForProperty:(int64_t)a3
{
  uint64_t v3 = 0LL;
  id v4 = CWFNetworkProfilePropertySSIDKey;
  switch(a3)
  {
    case 1LL:
      goto LABEL_90;
    case 2LL:
      id v4 = CWFNetworkProfilePropertySupportedSecurityTypesKey;
      goto LABEL_90;
    case 3LL:
      id v4 = CWFNetworkProfilePropertyWEPSubtypeKey;
      goto LABEL_90;
    case 4LL:
      id v4 = CWFNetworkProfilePropertyWAPISubtypeKey;
      goto LABEL_90;
    case 5LL:
      id v4 = CWFNetworkProfilePropertyCaptiveProfileKey;
      goto LABEL_90;
    case 6LL:
      id v4 = CWFNetworkProfilePropertyHiddenStateKey;
      goto LABEL_90;
    case 7LL:
      id v4 = CWFNetworkProfilePropertyAutoJoinDisabledKey;
      goto LABEL_90;
    case 8LL:
      id v4 = CWFNetworkProfilePropertyPasswordSharingDisabledKey;
      goto LABEL_90;
    case 9LL:
      id v4 = CWFNetworkProfilePropertyPayloadUUIDKey;
      goto LABEL_90;
    case 10LL:
      id v4 = CWFNetworkProfilePropertyBundleIDKey;
      goto LABEL_90;
    case 11LL:
      id v4 = CWFNetworkProfilePropertyAddReasonKey;
      goto LABEL_90;
    case 12LL:
      id v4 = CWFNetworkProfilePropertyAddedAtKey;
      goto LABEL_90;
    case 13LL:
      id v4 = CWFNetworkProfilePropertyLastJoinedByUserAtKey;
      goto LABEL_90;
    case 14LL:
      id v4 = CWFNetworkProfilePropertyLastJoinedBySystemAtKey;
      goto LABEL_90;
    case 15LL:
      id v4 = CWFNetworkProfilePropertyPersonalHotspotKey;
      goto LABEL_90;
    case 16LL:
      id v4 = CWFNetworkProfilePropertySystemModeKey;
      goto LABEL_90;
    case 18LL:
      id v4 = CWFNetworkProfilePropertyEAPProfileKey;
      goto LABEL_90;
    case 19LL:
      id v4 = CWFNetworkProfilePropertyPasspointDomainNameKey;
      goto LABEL_90;
    case 20LL:
      id v4 = CWFNetworkProfilePropertyPasspointNAIRealmNameListKey;
      goto LABEL_90;
    case 21LL:
      id v4 = CWFNetworkProfilePropertyPasspointRoamingConsortiumListKey;
      goto LABEL_90;
    case 22LL:
      id v4 = CWFNetworkProfilePropertyPasspointCellularNetworkInfoKey;
      goto LABEL_90;
    case 23LL:
      id v4 = CWFNetworkProfilePropertyPasspointServiceProviderRoamingEnabledKey;
      goto LABEL_90;
    case 24LL:
      id v4 = CWFNetworkProfilePropertyPasspointDisplayedOperatorNameKey;
      goto LABEL_90;
    case 25LL:
      id v4 = CWFNetworkProfilePropertyLowDataModeKey;
      goto LABEL_90;
    case 26LL:
      id v4 = CWFNetworkProfilePropertyOSSpecificAttributesKey;
      goto LABEL_90;
    case 27LL:
      id v4 = CWFNetworkProfilePropertyUpdatedAtKey;
      goto LABEL_90;
    case 28LL:
      id v4 = CWFNetworkProfilePropertyCarPlayUUIDKey;
      goto LABEL_90;
    case 29LL:
      id v4 = CWFNetworkProfilePropertyCarPlayNetworkKey;
      goto LABEL_90;
    case 30LL:
      id v4 = CWFNetworkProfilePropertyUserPreferredNetworkNamesKey;
      goto LABEL_90;
    case 31LL:
      id v4 = CWFNetworkProfilePropertyUserPreferredPasspointDomainsKey;
      goto LABEL_90;
    case 32LL:
      id v4 = CWFNetworkProfilePropertyNetworkGroupIDKey;
      goto LABEL_90;
    case 33LL:
      id v4 = CWFNetworkProfilePropertyNetworkGroupPriorityKey;
      goto LABEL_90;
    case 34LL:
      id v4 = CWFNetworkProfilePropertyLastDiscoveredAtKey;
      goto LABEL_90;
    case 35LL:
      id v4 = CWFNetworkProfilePropertyBSSListKey;
      goto LABEL_90;
    case 36LL:
      id v4 = CWFNetworkProfilePropertyPrivacyProxyEnabledKey;
      goto LABEL_90;
    case 37LL:
      id v4 = CWFNetworkProfilePropertyPrivacyProxyBlockedReasonKey;
      goto LABEL_90;
    case 38LL:
      id v4 = CWFNetworkProfilePropertyMovingKey;
      goto LABEL_90;
    case 39LL:
      id v4 = CWFNetworkProfilePropertyPublicKey;
      goto LABEL_90;
    case 40LL:
      id v4 = CWFNetworkProfilePropertyTransitionDisabledFlagsKey;
      goto LABEL_90;
    case 41LL:
      id v4 = CWFNetworkProfilePropertyNearbyShareableStatusKey;
      goto LABEL_90;
    case 42LL:
      id v4 = CWFNetworkProfilePropertyStandalone6GKey;
      goto LABEL_90;
    case 43LL:
      id v4 = CWFNetworkProfilePropertyDisable6EModeKey;
      goto LABEL_90;
    case 44LL:
      id v4 = CWFNetworkProfilePropertyDisable6EModeTimestampKey;
      goto LABEL_90;
    case 45LL:
      id v4 = CWFNetworkProfilePropertyDisableAutojoinUntilFirstUserJoinKey;
      goto LABEL_90;
    case 46LL:
      id v4 = CWFNetworkProfilePropertyNetworkDisabledUntilDateKey;
      goto LABEL_90;
    case 47LL:
      id v4 = CWFNetworkProfilePropertyPasspointHomeOperatorNetworkKey;
      goto LABEL_90;
    case 48LL:
      id v4 = CWFNetworkProfilePropertyPasspointProvisionedNetworkKey;
      goto LABEL_90;
    case 49LL:
      id v4 = CWFNetworkProfilePropertyPasspointAccountNameKey;
      goto LABEL_90;
    case 50LL:
      id v4 = CWFNetworkProfilePropertyHighPopularityKey;
      goto LABEL_90;
    case 51LL:
      id v4 = CWFNetworkProfilePropertyHighQualityKey;
      goto LABEL_90;
    case 52LL:
      id v4 = CWFNetworkProfilePropertyPotentiallyCaptiveKey;
      goto LABEL_90;
    case 53LL:
      id v4 = CWFNetworkProfilePropertyPotentiallyMovingKey;
      goto LABEL_90;
    case 54LL:
      id v4 = CWFNetworkProfilePropertySuspiciousKey;
      goto LABEL_90;
    case 55LL:
      id v4 = CWFNetworkProfilePropertyTCPGoodKey;
      goto LABEL_90;
    case 56LL:
      id v4 = CWFNetworkProfilePropertyLowPopularityKey;
      goto LABEL_90;
    case 57LL:
      id v4 = CWFNetworkProfilePropertyLowQualityKey;
      goto LABEL_90;
    case 58LL:
      id v4 = CWFNetworkProfilePropertyProminentDisplayKey;
      goto LABEL_90;
    case 59LL:
      id v4 = CWFNetworkProfilePropertyPopularityScoreKey;
      goto LABEL_90;
    case 60LL:
      id v4 = CWFNetworkProfilePropertyQualityScoreKey;
      goto LABEL_90;
    case 61LL:
      id v4 = CWFNetworkProfilePropertyTotalNetworkUsageKey;
      goto LABEL_90;
    case 62LL:
      id v4 = CWFNetworkProfilePropertyExpirationDateKey;
      goto LABEL_90;
    case 63LL:
    case 65LL:
      id v4 = CWFNetworkProfilePropertyNetworkOfInterestHomeStateKey;
      goto LABEL_90;
    case 66LL:
      id v4 = CWFNetworkProfilePropertyNetworkOfInterestWorkStateKey;
      goto LABEL_90;
    case 67LL:
      id v4 = CWFNetworkProfilePropertySSIDHarvestStatusKey;
      goto LABEL_90;
    case 68LL:
      id v4 = CWFNetworkProfilePropertyWalletIdentifierKey;
      goto LABEL_90;
    case 69LL:
      id v4 = CWFNetworkProfilePropertyOTASystemInfoBeaconProbeListKey;
      goto LABEL_90;
    case 70LL:
      id v4 = CWFNetworkProfilePropertySIMIdentifiersKey;
      goto LABEL_90;
    case 71LL:
      id v4 = CWFNetworkProfilePropertyNetworkQualityResponsivenessKey;
      goto LABEL_90;
    case 72LL:
      id v4 = CWFNetworkProfilePropertyNetworkQualityDateKey;
      goto LABEL_90;
    case 73LL:
      id v4 = CWFNetworkProfilePropertyLastDisconnectReasonKey;
      goto LABEL_90;
    case 74LL:
      id v4 = CWFNetworkProfilePropertyLastDisconnectTimestampKey;
      goto LABEL_90;
    case 75LL:
      id v4 = CWFNetworkProfilePropertyNANServiceIDKey;
      goto LABEL_90;
    case 76LL:
      id v4 = CWFNetworkProfilePropertyBlueAtlasNetworkKey;
      goto LABEL_90;
    case 77LL:
      id v4 = CWFNetworkProfilePropertyPublicAirPlayNetworkKey;
      goto LABEL_90;
    case 78LL:
      id v4 = CWFNetworkProfilePropertyLastJoinedBySystemAtWeekKey;
      goto LABEL_90;
    case 79LL:
      id v4 = CWFNetworkProfilePropertyWas6GHzOnlyAtKey;
      goto LABEL_90;
    case 80LL:
      id v4 = CWFNetworkProfilePropertyWas6GHzOnlyAtWeekKey;
      goto LABEL_90;
    case 81LL:
      id v4 = CWFNetworkProfilePropertySeamlessSSIDListKey;
      goto LABEL_90;
    case 82LL:
      id v4 = CWFNetworkProfilePropertyDNSHeuristicsFilteredNetworkKey;
      goto LABEL_90;
    case 83LL:
      id v4 = CWFNetworkProfilePropertyDNSHeuristicsFailureStateInfoKey;
      goto LABEL_90;
    case 84LL:
      id v4 = CWFNetworkProfilePropertyCachedPrivateMACAddressKey;
      goto LABEL_90;
    case 85LL:
      id v4 = CWFNetworkProfilePropertyCachedPrivateMACAddressUpdatedAtKey;
      goto LABEL_90;
    case 86LL:
      id v4 = CWFNetworkProfilePropertyPrivateMACAddressModeUserSettingKey;
      goto LABEL_90;
    case 87LL:
      id v4 = CWFNetworkProfilePropertyPrivateMACAddressModeUserSettingUpdatedAtKey;
      goto LABEL_90;
    case 88LL:
      id v4 = CWFNetworkProfilePropertyPrivateMACAddressModeConfigurationProfileSettingKey;
      goto LABEL_90;
    case 89LL:
      id v4 = CWFNetworkProfilePropertyPrivateMACAddressEvaluationStateKey;
      goto LABEL_90;
    case 90LL:
      id v4 = CWFNetworkProfilePropertyPrivateMACAddressEvaluatedAtKey;
      goto LABEL_90;
    case 91LL:
      id v4 = CWFNetworkProfilePropertyWasHiddenBeforeKey;
      goto LABEL_90;
    case 92LL:
      id v4 = CWFNetworkProfilePropertyDiscoveredDevicesKey;
LABEL_90:
      uint64_t v3 = *v4;
      break;
    default:
      return v3;
  }

  return v3;
}

- (int64_t)__propertyForKey:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_isEqualToString_(v3, v4, (uint64_t)@"SSID", v5, v6))
  {
    int64_t v10 = 1LL;
  }

  else if (objc_msgSend_isEqualToString_(v3, v7, (uint64_t)@"SupportedSecurityTypes", v8, v9))
  {
    int64_t v10 = 2LL;
  }

  else if (objc_msgSend_isEqualToString_(v3, v11, (uint64_t)@"WEPSubtype", v12, v13))
  {
    int64_t v10 = 3LL;
  }

  else if (objc_msgSend_isEqualToString_(v3, v14, (uint64_t)@"WAPISubtype", v15, v16))
  {
    int64_t v10 = 4LL;
  }

  else if (objc_msgSend_isEqualToString_(v3, v17, (uint64_t)@"CaptiveProfile", v18, v19))
  {
    int64_t v10 = 5LL;
  }

  else if (objc_msgSend_isEqualToString_(v3, v20, (uint64_t)@"Hidden", v21, v22))
  {
    int64_t v10 = 6LL;
  }

  else if (objc_msgSend_isEqualToString_(v3, v23, (uint64_t)@"AutoJoinDisabled", v24, v25))
  {
    int64_t v10 = 7LL;
  }

  else if (objc_msgSend_isEqualToString_(v3, v26, (uint64_t)@"PasswordSharingDisabled", v27, v28))
  {
    int64_t v10 = 8LL;
  }

  else if (objc_msgSend_isEqualToString_(v3, v29, (uint64_t)@"PayloadUUID", v30, v31))
  {
    int64_t v10 = 9LL;
  }

  else if (objc_msgSend_isEqualToString_(v3, v32, (uint64_t)@"BundleID", v33, v34))
  {
    int64_t v10 = 10LL;
  }

  else if (objc_msgSend_isEqualToString_(v3, v35, (uint64_t)@"AddReason", v36, v37))
  {
    int64_t v10 = 11LL;
  }

  else if (objc_msgSend_isEqualToString_(v3, v38, (uint64_t)@"AddedAt", v39, v40))
  {
    int64_t v10 = 12LL;
  }

  else
  {
    if (objc_msgSend_isEqualToString_(v3, v44, (uint64_t)@"JoinedBySystemAt", v45, v46))
    {
      int64_t v10 = 14LL;
      goto LABEL_29;
    }

    if (objc_msgSend_isEqualToString_(v3, v47, (uint64_t)@"JoinedByUserAt", v48, v49))
    {
LABEL_26:
      int64_t v10 = 13LL;
    }

    else if (objc_msgSend_isEqualToString_(v3, v51, (uint64_t)@"PersonalHotspot", v52, v53))
    {
      int64_t v10 = 15LL;
    }

    else if (objc_msgSend_isEqualToString_(v3, v54, (uint64_t)@"SystemMode", v55, v56))
    {
      int64_t v10 = 16LL;
    }

    else if (objc_msgSend_isEqualToString_(v3, v57, (uint64_t)@"EAPProfile", v58, v59))
    {
      int64_t v10 = 18LL;
    }

    else if (objc_msgSend_isEqualToString_(v3, v60, (uint64_t)@"PasspointDomain", v61, v62))
    {
      int64_t v10 = 19LL;
    }

    else if (objc_msgSend_isEqualToString_(v3, v63, (uint64_t)@"PasspointNAIRealmList", v64, v65))
    {
      int64_t v10 = 20LL;
    }

    else if (objc_msgSend_isEqualToString_(v3, v66, (uint64_t)@"PasspointRCList", v67, v68))
    {
      int64_t v10 = 21LL;
    }

    else if (objc_msgSend_isEqualToString_(v3, v69, (uint64_t)@"PasspointCellularNetworkInfo", v70, v71))
    {
      int64_t v10 = 22LL;
    }

    else if (objc_msgSend_isEqualToString_(v3, v72, (uint64_t)@"PasspointSPRoamingEnabled", v73, v74))
    {
      int64_t v10 = 23LL;
    }

    else if (objc_msgSend_isEqualToString_(v3, v75, (uint64_t)@"PasspointDisplayName", v76, v77))
    {
      int64_t v10 = 24LL;
    }

    else if (objc_msgSend_isEqualToString_(v3, v78, (uint64_t)@"LowDataMode", v79, v80))
    {
      int64_t v10 = 25LL;
    }

    else if (objc_msgSend_isEqualToString_(v3, v81, (uint64_t)@"__OSSpecific__", v82, v83))
    {
      int64_t v10 = 26LL;
    }

    else if (objc_msgSend_isEqualToString_(v3, v84, (uint64_t)@"UpdatedAt", v85, v86))
    {
      int64_t v10 = 27LL;
    }

    else if (objc_msgSend_isEqualToString_(v3, v87, (uint64_t)@"CarPlayUUID", v88, v89))
    {
      int64_t v10 = 28LL;
    }

    else if (objc_msgSend_isEqualToString_(v3, v90, (uint64_t)@"CarPlayNetwork", v91, v92))
    {
      int64_t v10 = 29LL;
    }

    else if (objc_msgSend_isEqualToString_(v3, v93, (uint64_t)@"UserPreferredNetworkNames", v94, v95))
    {
      int64_t v10 = 30LL;
    }

    else if (objc_msgSend_isEqualToString_(v3, v96, (uint64_t)@"UserPreferredPasspointDomains", v97, v98))
    {
      int64_t v10 = 31LL;
    }

    else if (objc_msgSend_isEqualToString_(v3, v99, (uint64_t)@"NetworkGroupID", v100, v101))
    {
      int64_t v10 = 32LL;
    }

    else if (objc_msgSend_isEqualToString_(v3, v102, (uint64_t)@"NetworkGroupPriority", v103, v104))
    {
      int64_t v10 = 33LL;
    }

    else if (objc_msgSend_isEqualToString_(v3, v105, (uint64_t)@"LastDiscoveredAt", v106, v107))
    {
      int64_t v10 = 34LL;
    }

    else if (objc_msgSend_isEqualToString_(v3, v108, (uint64_t)@"BSSList", v109, v110))
    {
      int64_t v10 = 35LL;
    }

    else if (objc_msgSend_isEqualToString_(v3, v111, (uint64_t)@"PrivacyProxyEnabled", v112, v113))
    {
      int64_t v10 = 36LL;
    }

    else if (objc_msgSend_isEqualToString_(v3, v114, (uint64_t)@"PrivacyProxyBlockedReason", v115, v116))
    {
      int64_t v10 = 37LL;
    }

    else if (objc_msgSend_isEqualToString_(v3, v117, (uint64_t)@"Moving", v118, v119))
    {
      int64_t v10 = 38LL;
    }

    else if (objc_msgSend_isEqualToString_(v3, v120, (uint64_t)@"Public", v121, v122))
    {
      int64_t v10 = 39LL;
    }

    else if (objc_msgSend_isEqualToString_(v3, v123, (uint64_t)@"BlueAtlasNetwork", v124, v125))
    {
      int64_t v10 = 76LL;
    }

    else if (objc_msgSend_isEqualToString_(v3, v126, (uint64_t)@"PublicAirPlayNetwork", v127, v128))
    {
      int64_t v10 = 77LL;
    }

    else if (objc_msgSend_isEqualToString_(v3, v129, (uint64_t)@"TransitionDisabledFlags", v130, v131))
    {
      int64_t v10 = 40LL;
    }

    else if (objc_msgSend_isEqualToString_(v3, v132, (uint64_t)@"NearbyShareableStatus", v133, v134))
    {
      int64_t v10 = 41LL;
    }

    else if (objc_msgSend_isEqualToString_(v3, v135, (uint64_t)@"Standalone6G", v136, v137))
    {
      int64_t v10 = 42LL;
    }

    else if (objc_msgSend_isEqualToString_(v3, v138, (uint64_t)@"Disable6EMode", v139, v140))
    {
      int64_t v10 = 43LL;
    }

    else if (objc_msgSend_isEqualToString_(v3, v141, (uint64_t)@"Disable6EModeTimestamp", v142, v143))
    {
      int64_t v10 = 44LL;
    }

    else if (objc_msgSend_isEqualToString_(v3, v144, (uint64_t)@"DisableAutojoinUntilFirstUserJoin", v145, v146))
    {
      int64_t v10 = 45LL;
    }

    else if (objc_msgSend_isEqualToString_(v3, v147, (uint64_t)@"NetworkDisabledUntilDate", v148, v149))
    {
      int64_t v10 = 46LL;
    }

    else if (objc_msgSend_isEqualToString_(v3, v150, (uint64_t)@"PasspointHomeOperatorNetwork", v151, v152))
    {
      int64_t v10 = 47LL;
    }

    else if (objc_msgSend_isEqualToString_(v3, v153, (uint64_t)@"PasspointProvisionedNetwork", v154, v155))
    {
      int64_t v10 = 48LL;
    }

    else if (objc_msgSend_isEqualToString_(v3, v156, (uint64_t)@"PasspointAccountName", v157, v158))
    {
      int64_t v10 = 49LL;
    }

    else if (objc_msgSend_isEqualToString_(v3, v159, (uint64_t)@"HighPopularity", v160, v161))
    {
      int64_t v10 = 50LL;
    }

    else if (objc_msgSend_isEqualToString_(v3, v162, (uint64_t)@"HighQuality", v163, v164))
    {
      int64_t v10 = 51LL;
    }

    else if (objc_msgSend_isEqualToString_(v3, v165, (uint64_t)@"PotentiallyCaptive", v166, v167))
    {
      int64_t v10 = 52LL;
    }

    else if (objc_msgSend_isEqualToString_(v3, v168, (uint64_t)@"PotentiallyMoving", v169, v170))
    {
      int64_t v10 = 53LL;
    }

    else if (objc_msgSend_isEqualToString_(v3, v171, (uint64_t)@"TCPGood", v172, v173))
    {
      int64_t v10 = 55LL;
    }

    else if (objc_msgSend_isEqualToString_(v3, v174, (uint64_t)@"LowPopularity", v175, v176))
    {
      int64_t v10 = 56LL;
    }

    else if (objc_msgSend_isEqualToString_(v3, v177, (uint64_t)@"LowQuality", v178, v179))
    {
      int64_t v10 = 57LL;
    }

    else if (objc_msgSend_isEqualToString_(v3, v180, (uint64_t)@"ProminentDisplay", v181, v182))
    {
      int64_t v10 = 58LL;
    }

    else if (objc_msgSend_isEqualToString_(v3, v183, (uint64_t)@"PopularityScore", v184, v185))
    {
      int64_t v10 = 59LL;
    }

    else if (objc_msgSend_isEqualToString_(v3, v186, (uint64_t)@"QualityScore", v187, v188))
    {
      int64_t v10 = 60LL;
    }

    else if (objc_msgSend_isEqualToString_(v3, v189, (uint64_t)@"TotalNetworkUsage", v190, v191))
    {
      int64_t v10 = 61LL;
    }

    else if (objc_msgSend_isEqualToString_(v3, v192, (uint64_t)@"ExpirationDate", v193, v194))
    {
      int64_t v10 = 62LL;
    }

    else if (objc_msgSend_isEqualToString_(v3, v195, (uint64_t)@"HomeForceFixDate", v196, v197))
    {
      int64_t v10 = 63LL;
    }

    else if (objc_msgSend_isEqualToString_(v3, v198, (uint64_t)@"LocationOfInterestType", v199, v200))
    {
      int64_t v10 = 64LL;
    }

    else if (objc_msgSend_isEqualToString_(v3, v201, (uint64_t)@"NetworkOfInterestHomeState", v202, v203))
    {
      int64_t v10 = 65LL;
    }

    else if (objc_msgSend_isEqualToString_(v3, v204, (uint64_t)@"NetworkOfInterestWorkState", v205, v206))
    {
      int64_t v10 = 66LL;
    }

    else if (objc_msgSend_isEqualToString_(v3, v207, (uint64_t)@"SSIDHarvestStatus", v208, v209))
    {
      int64_t v10 = 67LL;
    }

    else if (objc_msgSend_isEqualToString_(v3, v210, (uint64_t)@"WalletIdentifier", v211, v212))
    {
      int64_t v10 = 68LL;
    }

    else if (objc_msgSend_isEqualToString_(v3, v213, (uint64_t)@"OTASystemInfoBeaconProbeList", v214, v215))
    {
      int64_t v10 = 69LL;
    }

    else if (objc_msgSend_isEqualToString_(v3, v216, (uint64_t)@"SIMIdentifiers", v217, v218))
    {
      int64_t v10 = 70LL;
    }

    else if (objc_msgSend_isEqualToString_(v3, v219, (uint64_t)@"NetworkQualityResponsiveness", v220, v221))
    {
      int64_t v10 = 71LL;
    }

    else if (objc_msgSend_isEqualToString_(v3, v222, (uint64_t)@"NetworkQualityDate", v223, v224))
    {
      int64_t v10 = 72LL;
    }

    else if (objc_msgSend_isEqualToString_(v3, v225, (uint64_t)@"LastDisconnectReason", v226, v227))
    {
      int64_t v10 = 73LL;
    }

    else if (objc_msgSend_isEqualToString_(v3, v228, (uint64_t)@"LastDisconnectTimestamp", v229, v230))
    {
      int64_t v10 = 74LL;
    }

    else if (objc_msgSend_isEqualToString_(v3, v231, (uint64_t)@"NANServiceID", v232, v233))
    {
      int64_t v10 = 75LL;
    }

    else if (objc_msgSend_isEqualToString_(v3, v234, (uint64_t)@"JoinedBySystemAtWeek", v235, v236))
    {
      int64_t v10 = 78LL;
    }

    else if (objc_msgSend_isEqualToString_(v3, v237, (uint64_t)@"Was6GHzOnlyAt", v238, v239))
    {
      int64_t v10 = 79LL;
    }

    else if (objc_msgSend_isEqualToString_(v3, v240, (uint64_t)@"Was6GHzOnlyAtWeek", v241, v242))
    {
      int64_t v10 = 80LL;
    }

    else if (objc_msgSend_isEqualToString_(v3, v243, (uint64_t)@"SeamlessSSIDList", v244, v245))
    {
      int64_t v10 = 81LL;
    }

    else if ((objc_msgSend_isEqualToString_(v3, v246, (uint64_t)@"DNSHeuristicsFilteredNetwork", v247, v248) & 1) != 0 {
           || (objc_msgSend_isEqualToString_(v3, v249, (uint64_t)@"FilteredNetwork", v250, v251) & 1) != 0)
    }
    {
      int64_t v10 = 82LL;
    }

    else if ((objc_msgSend_isEqualToString_(v3, v252, (uint64_t)@"DNSHeuristicsFailureStateInfo", v253, v254) & 1) != 0 {
           || (objc_msgSend_isEqualToString_(v3, v255, (uint64_t)@"DNSFailures", v256, v257) & 1) != 0)
    }
    {
      int64_t v10 = 83LL;
    }

    else if (objc_msgSend_isEqualToString_(v3, v258, (uint64_t)@"CachedPrivateMACAddress", v259, v260))
    {
      int64_t v10 = 84LL;
    }

    else if (objc_msgSend_isEqualToString_(v3, v261, (uint64_t)@"CachedPrivateMACAddressUpdatedAt", v262, v263))
    {
      int64_t v10 = 85LL;
    }

    else if (objc_msgSend_isEqualToString_(v3, v264, (uint64_t)@"PrivateMACAddressModeUserSetting", v265, v266))
    {
      int64_t v10 = 86LL;
    }

    else if (objc_msgSend_isEqualToString_( v3,  v267,  (uint64_t)@"PrivateMACAddressModeUserSettingUpdatedAt",  v268,  v269))
    {
      int64_t v10 = 87LL;
    }

    else if (objc_msgSend_isEqualToString_(v3, v270, (uint64_t)@"PrivateMACAddressEvaluationState", v271, v272))
    {
      int64_t v10 = 89LL;
    }

    else if (objc_msgSend_isEqualToString_( v3,  v273,  (uint64_t)@"PrivateMACAddressModeConfigurationProfileSetting",  v274,  v275))
    {
      int64_t v10 = 88LL;
    }

    else if (objc_msgSend_isEqualToString_(v3, v276, (uint64_t)@"PrivateMACAddressEvaluatedAt", v277, v278))
    {
      int64_t v10 = 90LL;
    }

    else if (objc_msgSend_isEqualToString_(v3, v279, (uint64_t)@"WasHiddenBefore", v280, v281))
    {
      int64_t v10 = 91LL;
    }

    else if (objc_msgSend_isEqualToString_(v3, v282, (uint64_t)@"DiscoveredDevices", v283, v284))
    {
      int64_t v10 = 92LL;
    }

    else
    {
      int64_t v10 = 0LL;
    }
  }

- (CWFNetworkProfile)initWithExternalForm:(id)a3
{
  uint64_t v160 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  uint64_t v13 = (CWFNetworkProfile *)objc_msgSend_init(self, v5, v6, v7, v8);
  if (v13)
  {
    objc_msgSend_dictionary(MEMORY[0x189603FC8], v9, v10, v11, v12);
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v154 = 0u;
    __int128 v155 = 0u;
    __int128 v156 = 0u;
    __int128 v157 = 0u;
    objc_msgSend_allKeys(v4, v15, v16, v17, v18);
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v149 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v19, (uint64_t)&v154, (uint64_t)v159, 16);
    if (!v149) {
      goto LABEL_60;
    }
    uint64_t v148 = *(void *)v155;
    id v145 = v4;
    uint64_t v146 = v13;
    while (1)
    {
      uint64_t v23 = 0LL;
      do
      {
        if (*(void *)v155 != v148) {
          objc_enumerationMutation(obj);
        }
        uint64_t v24 = *(void *)(*((void *)&v154 + 1) + 8 * v23);
        uint64_t v25 = objc_msgSend___propertyForKey_(v13, v20, v24, v21, v22);
        if (v25)
        {
          uint64_t v26 = v25;
          objc_msgSend_numberWithInteger_(MEMORY[0x189607968], v20, v25, v21, v22);
          uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v14, v28, (uint64_t)v27, v29, v30);
          uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v31)
          {
            if (v26 <= 24)
            {
              switch(v26)
              {
                case 2LL:
                  __int128 v41 = (void *)MEMORY[0x189607968];
                  objc_msgSend_objectForKeyedSubscript_(v4, v20, v24, v21, v22);
                  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
                  uint64_t v42 = sub_186452158(v32);
                  objc_msgSend_numberWithUnsignedInteger_(v41, v43, v42, v44, v45);
                  uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_numberWithInteger_(MEMORY[0x189607968], v47, 2, v48, v49);
                  goto LABEL_31;
                case 3LL:
                  uint64_t v58 = (void *)MEMORY[0x189607968];
                  objc_msgSend_objectForKeyedSubscript_(v4, v20, v24, v21, v22);
                  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
                  uint64_t v59 = sub_1864523E4(v32);
                  objc_msgSend_numberWithInteger_(v58, v60, v59, v61, v62);
                  uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_numberWithInteger_(MEMORY[0x189607968], v63, 3, v64, v65);
                  goto LABEL_31;
                case 4LL:
                  uint64_t v66 = (void *)MEMORY[0x189607968];
                  objc_msgSend_objectForKeyedSubscript_(v4, v20, v24, v21, v22);
                  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
                  uint64_t v67 = sub_18645253C(v32);
                  objc_msgSend_numberWithInteger_(v66, v68, v67, v69, v70);
                  uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_numberWithInteger_(MEMORY[0x189607968], v71, 4, v72, v73);
                  goto LABEL_31;
                case 6LL:
                  objc_msgSend_objectForKeyedSubscript_(v4, v20, v24, v21, v22);
                  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
                  else {
                    uint64_t v40 = &unk_189E87ED8;
                  }
                  objc_msgSend_numberWithInteger_(MEMORY[0x189607968], v78, 6, v79, v80);
                  goto LABEL_52;
                case 11LL:
                  uint64_t v81 = (void *)MEMORY[0x189607968];
                  objc_msgSend_objectForKeyedSubscript_(v4, v20, v24, v21, v22);
                  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
                  uint64_t v82 = sub_186452640(v32);
                  objc_msgSend_numberWithInteger_(v81, v83, v82, v84, v85);
                  uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_numberWithInteger_(MEMORY[0x189607968], v86, 11, v87, v88);
                  goto LABEL_31;
                default:
                  goto LABEL_56;
              }
            }

            if (v26 > 38)
            {
              if (v26 != 39)
              {
                if (v26 != 86 && v26 != 88) {
                  goto LABEL_56;
                }
                uint64_t v50 = (void *)MEMORY[0x189607968];
                objc_msgSend_objectForKeyedSubscript_(v4, v20, v24, v21, v22);
                uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
                uint64_t v51 = sub_1864542F8(v32);
                objc_msgSend_numberWithInteger_(v50, v52, v51, v53, v54);
                uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_numberWithInteger_(MEMORY[0x189607968], v55, v26, v56, v57);
LABEL_31:
                uint64_t v89 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_setObject_forKeyedSubscript_(v14, v90, (uint64_t)v46, (uint64_t)v89, v91);

LABEL_53:
                goto LABEL_54;
              }

              objc_msgSend_objectForKeyedSubscript_(v4, v20, v24, v21, v22);
              uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
              else {
                uint64_t v40 = &unk_189E87ED8;
              }
              objc_msgSend_numberWithInteger_(MEMORY[0x189607968], v123, 39, v124, v125);
            }

            else
            {
              if (v26 != 25)
              {
                if (v26 == 35)
                {
                  objc_msgSend_objectForKeyedSubscript_(v4, v20, v24, v21, v22);
                  uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue();
                  __int128 v150 = 0u;
                  __int128 v151 = 0u;
                  __int128 v152 = 0u;
                  __int128 v153 = 0u;
                  uint64_t v93 = objc_msgSend_countByEnumeratingWithState_objects_count_( v46,  v92,  (uint64_t)&v150,  (uint64_t)v158,  16);
                  if (v93)
                  {
                    uint64_t v98 = v93;
                    uint64_t v32 = 0LL;
                    uint64_t v99 = *(void *)v151;
                    do
                    {
                      for (uint64_t i = 0LL; i != v98; ++i)
                      {
                        if (*(void *)v151 != v99) {
                          objc_enumerationMutation(v46);
                        }
                        uint64_t v101 = *(void *)(*((void *)&v150 + 1) + 8 * i);
                        v102 = objc_alloc(&OBJC_CLASS___CWFBSS);
                        uint64_t v110 = (void *)objc_msgSend_initWithExternalForm_(v102, v103, v101, v104, v105);
                        if (v110)
                        {
                          if (!v32)
                          {
                            objc_msgSend_set(MEMORY[0x189603FE0], v106, v107, v108, v109);
                            uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
                          }

                          objc_msgSend_addObject_(v32, v106, (uint64_t)v110, v108, v109);
                        }
                      }

                      uint64_t v98 = objc_msgSend_countByEnumeratingWithState_objects_count_( v46,  v111,  (uint64_t)&v150,  (uint64_t)v158,  16);
                    }

                    while (v98);
                  }

                  else
                  {
                    uint64_t v32 = 0LL;
                  }

                  uint64_t v133 = (void *)objc_msgSend_copy(v32, v94, v95, v96, v97);
                  objc_msgSend_numberWithInteger_(MEMORY[0x189607968], v134, 35, v135, v136);
                  uint64_t v137 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_setObject_forKeyedSubscript_(v14, v138, (uint64_t)v133, (uint64_t)v137, v139);

                  id v4 = v145;
                  uint64_t v13 = v146;
                }

                else
                {
                  if (v26 == 38)
                  {
                    objc_msgSend_objectForKeyedSubscript_(v4, v20, v24, v21, v22);
                    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
                    else {
                      uint64_t v40 = &unk_189E87ED8;
                    }
                    objc_msgSend_numberWithInteger_(MEMORY[0x189607968], v37, 38, v38, v39);
                    goto LABEL_52;
                  }

- (id)externalForm
{
  uint64_t v165 = *MEMORY[0x1895F89C0];
  objc_msgSend_dictionary(MEMORY[0x189603FC8], a2, v2, v3, v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v158 = 0u;
  __int128 v159 = 0u;
  __int128 v160 = 0u;
  __int128 v161 = 0u;
  objc_msgSend_allKeys(self->_internal, v7, v8, v9, v10);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v158, (uint64_t)v164, 16);
  if (v13)
  {
    uint64_t v18 = v13;
    uint64_t v19 = MEMORY[0x189604A80];
    uint64_t v153 = *(void *)v159;
    uint64_t v149 = v11;
    __int128 v150 = v6;
    do
    {
      uint64_t v20 = 0LL;
      do
      {
        if (*(void *)v159 != v153) {
          objc_enumerationMutation(v11);
        }
        uint64_t v21 = *(void **)(*((void *)&v158 + 1) + 8 * v20);
        uint64_t v22 = objc_msgSend_integerValue(v21, v14, v15, v16, v17);
        objc_msgSend___keyForProperty_(self, v23, v22, v24, v25);
        uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v31 = objc_msgSend_integerValue(v21, v27, v28, v29, v30);
        if (v26)
        {
          switch(v31)
          {
            case 2LL:
              objc_msgSend_objectForKeyedSubscript_(self->_internal, v32, (uint64_t)v21, v33, v34);
              uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
              uint64_t v74 = objc_msgSend_unsignedIntegerValue(v35, v70, v71, v72, v73);
              uint64_t v67 = sub_186451FA4(v74, v75, v76, v77, v78);
              goto LABEL_28;
            case 3LL:
              objc_msgSend_objectForKeyedSubscript_(self->_internal, v32, (uint64_t)v21, v33, v34);
              uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
              unint64_t v83 = objc_msgSend_integerValue(v35, v79, v80, v81, v82);
              uint64_t v67 = sub_18645238C(v83, v84, v85, v86, v87);
              goto LABEL_28;
            case 4LL:
              objc_msgSend_objectForKeyedSubscript_(self->_internal, v32, (uint64_t)v21, v33, v34);
              uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
              unint64_t v92 = objc_msgSend_integerValue(v35, v88, v89, v90, v91);
              uint64_t v67 = sub_1864524E4(v92, v93, v94, v95, v96);
              goto LABEL_28;
            case 6LL:
            case 25LL:
            case 38LL:
            case 39LL:
              objc_msgSend_objectForKeyedSubscript_(self->_internal, v32, (uint64_t)v21, v33, v34);
              uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue();
              uint64_t v55 = objc_msgSend_integerValue(v50, v51, v52, v53, v54);

              if (v55)
              {
                if (v55 == 1) {
                  objc_msgSend_setObject_forKeyedSubscript_(v6, v56, MEMORY[0x189604A88], (uint64_t)v26, v57);
                }
                else {
                  objc_msgSend_setObject_forKeyedSubscript_(v6, v56, v19, (uint64_t)v26, v57);
                }
              }

              break;
            case 7LL:
            case 8LL:
            case 15LL:
            case 16LL:
            case 29LL:
            case 42LL:
            case 45LL:
            case 47LL:
            case 48LL:
            case 50LL:
            case 51LL:
            case 52LL:
            case 53LL:
            case 54LL:
            case 55LL:
            case 56LL:
            case 57LL:
            case 58LL:
            case 76LL:
            case 77LL:
            case 82LL:
              objc_msgSend_objectForKeyedSubscript_(self->_internal, v32, (uint64_t)v21, v33, v34);
              uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
              goto LABEL_13;
            case 11LL:
              objc_msgSend_objectForKeyedSubscript_(self->_internal, v32, (uint64_t)v21, v33, v34);
              uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
              unint64_t v101 = objc_msgSend_integerValue(v35, v97, v98, v99, v100);
              uint64_t v67 = sub_1864525E8(v101, v102, v103, v104, v105);
              goto LABEL_28;
            case 20LL:
            case 21LL:
            case 22LL:
            case 26LL:
            case 30LL:
            case 31LL:
            case 69LL:
            case 70LL:
            case 81LL:
            case 83LL:
            case 92LL:
              objc_msgSend_objectForKeyedSubscript_(self->_internal, v32, (uint64_t)v21, v33, v34);
              uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend_count(v35, v46, v47, v48, v49)) {
                goto LABEL_13;
              }
              goto LABEL_14;
            case 23LL:
            case 36LL:
              objc_msgSend_objectForKeyedSubscript_(self->_internal, v32, (uint64_t)v21, v33, v34);
              uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend_BOOLValue(v35, v58, v59, v60, v61)) {
                goto LABEL_14;
              }
              goto LABEL_13;
            case 33LL:
            case 40LL:
            case 41LL:
            case 43LL:
            case 59LL:
            case 60LL:
            case 61LL:
            case 64LL:
            case 65LL:
            case 66LL:
            case 67LL:
            case 73LL:
            case 78LL:
            case 80LL:
            case 89LL:
              objc_msgSend_objectForKeyedSubscript_(self->_internal, v32, (uint64_t)v21, v33, v34);
              uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
              if (!objc_msgSend_unsignedIntegerValue(v35, v42, v43, v44, v45)) {
                goto LABEL_14;
              }
LABEL_13:
              objc_msgSend_setObject_forKeyedSubscript_(v6, v40, (uint64_t)v35, (uint64_t)v26, v41);
              goto LABEL_14;
            case 35LL:
              objc_msgSend_objectForKeyedSubscript_(self->_internal, v32, (uint64_t)v21, v33, v34);
              uint64_t v107 = (void *)objc_claimAutoreleasedReturnValue();
              uint64_t v110 = objc_msgSend_sortDescriptorWithKey_ascending_( MEMORY[0x189607A20],  v108,  (uint64_t)@"BSSID",  0,  v109);
              __int128 v154 = 0u;
              __int128 v155 = 0u;
              __int128 v156 = 0u;
              __int128 v157 = 0u;
              __int128 v151 = (void *)v110;
              uint64_t v162 = v110;
              objc_msgSend_arrayWithObjects_count_(MEMORY[0x189603F18], v111, (uint64_t)&v162, 1, v112);
              uint64_t v113 = (void *)objc_claimAutoreleasedReturnValue();
              __int128 v152 = v107;
              objc_msgSend_sortedArrayUsingDescriptors_(v107, v114, (uint64_t)v113, v115, v116);
              uint64_t v117 = (void *)objc_claimAutoreleasedReturnValue();

              uint64_t v119 = objc_msgSend_countByEnumeratingWithState_objects_count_( v117,  v118,  (uint64_t)&v154,  (uint64_t)v163,  16);
              if (v119)
              {
                uint64_t v124 = v119;
                uint64_t v125 = 0LL;
                uint64_t v126 = *(void *)v155;
                do
                {
                  for (uint64_t i = 0LL; i != v124; ++i)
                  {
                    if (*(void *)v155 != v126) {
                      objc_enumerationMutation(v117);
                    }
                    objc_msgSend_externalForm(*(void **)(*((void *)&v154 + 1) + 8 * i), v120, v121, v122, v123);
                    uint64_t v132 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v132)
                    {
                      if (!v125)
                      {
                        objc_msgSend_array(MEMORY[0x189603FA8], v128, v129, v130, v131);
                        uint64_t v125 = (void *)objc_claimAutoreleasedReturnValue();
                      }

                      objc_msgSend_addObject_(v125, v128, (uint64_t)v132, v130, v131);
                    }
                  }

                  uint64_t v124 = objc_msgSend_countByEnumeratingWithState_objects_count_( v117,  v120,  (uint64_t)&v154,  (uint64_t)v163,  16);
                }

                while (v124);
              }

              else
              {
                uint64_t v125 = 0LL;
              }

              uint64_t v139 = (void *)objc_msgSend_copy(v125, v135, v136, v137, v138);
              uint64_t v6 = v150;
              objc_msgSend_setObject_forKeyedSubscript_(v150, v140, (uint64_t)v139, (uint64_t)v26, v141);

              uint64_t v11 = v149;
              uint64_t v19 = MEMORY[0x189604A80];
              break;
            case 86LL:
            case 88LL:
              objc_msgSend_objectForKeyedSubscript_(self->_internal, v32, (uint64_t)v21, v33, v34);
              uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
              uint64_t v66 = objc_msgSend_integerValue(v35, v62, v63, v64, v65);
              uint64_t v67 = sub_1864542D4(v66);
LABEL_28:
              uint64_t v106 = (void *)v67;
              objc_msgSend_setObject_forKeyedSubscript_(v6, v68, v67, (uint64_t)v26, v69);

              goto LABEL_14;
            default:
              objc_msgSend_objectForKeyedSubscript_(self->_internal, v32, (uint64_t)v21, v33, v34);
              uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKeyedSubscript_(v6, v133, (uint64_t)v35, (uint64_t)v26, v134);
LABEL_14:

              break;
          }
        }

        ++v20;
      }

      while (v20 != v18);
      uint64_t v142 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v158, (uint64_t)v164, 16);
      uint64_t v18 = v142;
    }

    while (v142);
  }

  v147 = (void *)objc_msgSend_copy(v6, v143, v144, v145, v146);
  return v147;
}

- (void)mergeWithNetworkProfile:(id)a3
{
  internal = self->_internal;
  objc_msgSend_internal(a3, a2, (uint64_t)a3, v3, v4);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addEntriesFromDictionary_(internal, v6, (uint64_t)v9, v7, v8);
}

- (NSSet)properties
{
  uint64_t v5 = (void *)MEMORY[0x189604010];
  objc_msgSend_allKeys(self->_internal, a2, v2, v3, v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v5, v7, (uint64_t)v6, v8, v9);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v10;
}

- (id)__coreWiFiSpecificProperties
{
  return &unk_189E8A920;
}

- (id)coreWiFiSpecificAttributes
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(MEMORY[0x189604010], v7, (uint64_t)v6, v8, v9);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_set(MEMORY[0x189604010], v11, v12, v13, v14);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend___filteredNetworkProfileWithProperties_includeRequiredProperties_OSSpecificKeys_( self,  v16,  (uint64_t)v10,  0,  (uint64_t)v15);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_externalForm(v17, v18, v19, v20, v21);
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (void)setCoreWiFiSpecificAttributes:(id)a3
{
  id v4 = a3;
  objc_msgSend___coreWiFiSpecificProperties(self, v5, v6, v7, v8);
  id v34 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = objc_alloc(&OBJC_CLASS___CWFNetworkProfile);
  uint64_t v13 = (void *)objc_msgSend_initWithExternalForm_(v9, v10, (uint64_t)v4, v11, v12);

  objc_msgSend_setWithArray_(MEMORY[0x189604010], v14, (uint64_t)v34, v15, v16);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_set(MEMORY[0x189604010], v18, v19, v20, v21);
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend___filteredNetworkProfileWithProperties_includeRequiredProperties_OSSpecificKeys_( v13,  v23,  (uint64_t)v17,  0,  (uint64_t)v22);
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();

  internal = self->_internal;
  objc_msgSend_internal(v24, v26, v27, v28, v29);
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addEntriesFromDictionary_(internal, v31, (uint64_t)v30, v32, v33);
}

- (id)changedPropertiesFromNetworkProfile:(id)a3
{
  uint64_t v155 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  uint64_t v9 = objc_msgSend_externalForm(self, v5, v6, v7, v8);
  uint64_t v10 = objc_alloc(&OBJC_CLASS___CWFNetworkProfile);
  uint64_t v137 = (void *)v9;
  uint64_t v14 = (void *)objc_msgSend_initWithExternalForm_(v10, v11, v9, v12, v13);
  uint64_t v138 = v4;
  uint64_t v19 = objc_msgSend_externalForm(v4, v15, v16, v17, v18);
  uint64_t v20 = objc_alloc(&OBJC_CLASS___CWFNetworkProfile);
  uint64_t v136 = (void *)v19;
  uint64_t v24 = (void *)objc_msgSend_initWithExternalForm_(v20, v21, v19, v22, v23);
  objc_msgSend_set(MEMORY[0x189603FE0], v25, v26, v27, v28);
  id v144 = (id)objc_claimAutoreleasedReturnValue();
  __int128 v150 = 0u;
  __int128 v151 = 0u;
  __int128 v152 = 0u;
  __int128 v153 = 0u;
  objc_msgSend_internal(v14, v29, v30, v31, v32);
  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allKeys(v33, v34, v35, v36, v37);
  uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();

  id obj = v38;
  uint64_t v148 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v39, (uint64_t)&v150, (uint64_t)v154, 16);
  if (v148)
  {
    uint64_t v147 = *(void *)v151;
    uint64_t v139 = v24;
    uint64_t v140 = v14;
    do
    {
      for (uint64_t i = 0LL; i != v148; ++i)
      {
        if (*(void *)v151 != v147) {
          objc_enumerationMutation(obj);
        }
        uint64_t v45 = *(void *)(*((void *)&v150 + 1) + 8 * i);
        objc_msgSend_internal(v14, v40, v41, v42, v43);
        uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v46, v47, v45, v48, v49);
        uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_internal(v24, v51, v52, v53, v54);
        uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v59 = objc_msgSend_objectForKeyedSubscript_(v55, v56, v45, v57, v58);
        if (v50 == (void *)v59)
        {

          continue;
        }

        uint64_t v64 = (void *)v59;
        uint64_t v149 = v46;
        objc_msgSend_internal(v14, v60, v61, v62, v63);
        uint64_t v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v65, v66, v45, v67, v68);
        uint64_t v73 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v73) {
          goto LABEL_13;
        }
        uint64_t v74 = v24;
        objc_msgSend_internal(v24, v69, v70, v71, v72);
        uint64_t v146 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v78 = objc_msgSend_objectForKeyedSubscript_(v146, v75, v45, v76, v77);
        if (!v78)
        {

LABEL_13:
LABEL_14:
          objc_msgSend_addObject_(v144, v40, v45, v42, v43);
          continue;
        }

        uint64_t v142 = (void *)v78;
        objc_msgSend_internal(v14, v79, v80, v81, v82);
        uint64_t v141 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v141, v83, v45, v84, v85);
        uint64_t v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_internal(v74, v87, v88, v89, v90);
        uint64_t v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v91, v92, v45, v93, v94);
        uint64_t v95 = (void *)objc_claimAutoreleasedReturnValue();
        char isEqual = objc_msgSend_isEqual_(v86, v96, (uint64_t)v95, v97, v98);

        uint64_t v14 = v140;
        uint64_t v24 = v139;
        if ((isEqual & 1) == 0) {
          goto LABEL_14;
        }
      }

      uint64_t v148 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v40, (uint64_t)&v150, (uint64_t)v154, 16);
    }

    while (v148);
  }

  uint64_t v99 = (void *)MEMORY[0x189603FE0];
  objc_msgSend_internal(v24, v100, v101, v102, v103);
  uint64_t v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allKeys(v104, v105, v106, v107, v108);
  uint64_t v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v99, v110, (uint64_t)v109, v111, v112);
  uint64_t v113 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v114 = (void *)MEMORY[0x189603FE0];
  objc_msgSend_internal(v14, v115, v116, v117, v118);
  uint64_t v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allKeys(v119, v120, v121, v122, v123);
  uint64_t v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v114, v125, (uint64_t)v124, v126, v127);
  uint64_t v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_minusSet_(v113, v129, (uint64_t)v128, v130, v131);

  objc_msgSend_unionSet_(v144, v132, (uint64_t)v113, v133, v134);
  return v144;
}

- (id)changedOSSpecificKeysFromNetworkProfile:(id)a3
{
  uint64_t v121 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  objc_msgSend_set(MEMORY[0x189603FE0], v5, v6, v7, v8);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = objc_msgSend_externalForm(self, v10, v11, v12, v13);
  uint64_t v15 = objc_alloc(&OBJC_CLASS___CWFNetworkProfile);
  uint64_t v109 = (void *)v14;
  uint64_t v108 = (void *)objc_msgSend_initWithExternalForm_(v15, v16, v14, v17, v18);
  objc_msgSend_OSSpecificAttributes(v108, v19, v20, v21, v22);
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v110 = v4;
  uint64_t v28 = objc_msgSend_externalForm(v4, v24, v25, v26, v27);
  uint64_t v29 = objc_alloc(&OBJC_CLASS___CWFNetworkProfile);
  uint64_t v107 = (void *)v28;
  uint64_t v106 = (void *)objc_msgSend_initWithExternalForm_(v29, v30, v28, v31, v32);
  objc_msgSend_OSSpecificAttributes(v106, v33, v34, v35, v36);
  uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v116 = 0u;
  __int128 v117 = 0u;
  __int128 v118 = 0u;
  __int128 v119 = 0u;
  objc_msgSend_allKeys(v23, v38, v39, v40, v41);
  uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v115 = objc_msgSend_countByEnumeratingWithState_objects_count_(v42, v43, (uint64_t)&v116, (uint64_t)v120, 16);
  if (v115)
  {
    uint64_t v47 = *(void *)v117;
    uint64_t v111 = v42;
    uint64_t v112 = v37;
    uint64_t v113 = *(void *)v117;
    do
    {
      for (uint64_t i = 0LL; i != v115; ++i)
      {
        if (*(void *)v117 != v47) {
          objc_enumerationMutation(v42);
        }
        uint64_t v49 = *(void *)(*((void *)&v116 + 1) + 8 * i);
        objc_msgSend_objectForKeyedSubscript_(v23, v44, v49, v45, v46);
        uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v54 = objc_msgSend_objectForKeyedSubscript_(v37, v51, v49, v52, v53);
        if (v50 == (void *)v54)
        {

          continue;
        }

        uint64_t v58 = (void *)v54;
        uint64_t v59 = objc_msgSend_objectForKeyedSubscript_(v23, v55, v49, v56, v57);
        if (!v59) {
          goto LABEL_13;
        }
        uint64_t v63 = (void *)v59;
        uint64_t v64 = objc_msgSend_objectForKeyedSubscript_(v37, v60, v49, v61, v62);
        if (!v64)
        {

          uint64_t v47 = v113;
LABEL_13:

LABEL_14:
          objc_msgSend_addObject_(v9, v44, v49, v45, v46);
          continue;
        }

        uint64_t v68 = (void *)v64;
        objc_msgSend_objectForKeyedSubscript_(v23, v65, v49, v66, v67);
        uint64_t v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v37, v70, v49, v71, v72);
        uint64_t v73 = v23;
        uint64_t v74 = v9;
        uint64_t v75 = (void *)objc_claimAutoreleasedReturnValue();
        char isEqual = objc_msgSend_isEqual_(v69, v76, (uint64_t)v75, v77, v78);

        uint64_t v9 = v74;
        uint64_t v23 = v73;
        uint64_t v37 = v112;

        uint64_t v42 = v111;
        uint64_t v47 = v113;
        if ((isEqual & 1) == 0) {
          goto LABEL_14;
        }
      }

      uint64_t v115 = objc_msgSend_countByEnumeratingWithState_objects_count_(v42, v44, (uint64_t)&v116, (uint64_t)v120, 16);
    }

    while (v115);
  }

  uint64_t v79 = (void *)MEMORY[0x189603FE0];
  objc_msgSend_allKeys(v37, v80, v81, v82, v83);
  uint64_t v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v79, v85, (uint64_t)v84, v86, v87);
  uint64_t v88 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v89 = (void *)MEMORY[0x189603FE0];
  objc_msgSend_allKeys(v23, v90, v91, v92, v93);
  uint64_t v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v89, v95, (uint64_t)v94, v96, v97);
  uint64_t v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_minusSet_(v88, v99, (uint64_t)v98, v100, v101);

  objc_msgSend_unionSet_(v9, v102, (uint64_t)v88, v103, v104);
  return v9;
}

- (NSData)SSID
{
  return (NSData *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_189E87E90, v2, v3);
}

- (void)setSSID:(id)a3
{
  *(_WORD *)&self->_useCachedIdentifier = 0;
  self->_useCachedShortSSID = 0;
}

- (unint64_t)shortSSID
{
  if ((objc_msgSend_useCachedShortSSID(self, a2, v2, v3, v4) & 1) == 0)
  {
    objc_msgSend_SSID(self, v6, v7, v8, v9);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13) {
      Apple80211CalculateShortSSIDCopy();
    }
    objc_msgSend_setCachedShortSSID_(self, v10, 0, v11, v12);
    objc_msgSend_setUseCachedShortSSID_(self, v14, 1, v15, v16);
  }

  return objc_msgSend_cachedShortSSID(self, v6, v7, v8, v9);
}

- (int64_t)disable6EMode
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  int64_t v9 = objc_msgSend_integerValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setDisable6EMode:(int64_t)a3
{
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_189E87EF0, v7);
}

- (NSDate)disable6EModeTimestamp
{
  return (NSDate *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_189E87F08, v2, v3);
}

- (void)setDisable6EModeTimestamp:(id)a3
{
}

- (NSString)networkName
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if ((objc_msgSend_useCachedNetworkName(v2, v3, v4, v5, v6) & 1) == 0)
  {
    objc_msgSend_SSID(v2, v7, v8, v9, v10);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    CWFHumanReadableStringFromData(v11);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setCachedNetworkName_(v2, v13, (uint64_t)v12, v14, v15);

    objc_msgSend_setUseCachedNetworkName_(v2, v16, 1, v17, v18);
  }

  objc_msgSend_cachedNetworkName(v2, v7, v8, v9, v10);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return (NSString *)v19;
}

- (BOOL)isAmbiguousNetworkName
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  unsigned __int8 v10 = sub_18645313C(v5, v6, v7, v8, v9);

  return v10;
}

- (unint64_t)supportedSecurityTypes
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v9 = objc_msgSend_unsignedIntegerValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setSupportedSecurityTypes:(unint64_t)a3
{
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_189E87ED8, v7);
}

- (int64_t)WEPSubtype
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  int64_t v9 = objc_msgSend_integerValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setWEPSubtype:(int64_t)a3
{
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_189E88070, v7);
}

- (int64_t)WAPISubtype
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  int64_t v9 = objc_msgSend_integerValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setWAPISubtype:(int64_t)a3
{
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_189E88088, v7);
}

- (BOOL)isOpen
{
  return ((unint64_t)objc_msgSend_supportedSecurityTypes(self, a2, v2, v3, v4) >> 9) & 1;
}

- (BOOL)isOWE
{
  return ((unint64_t)objc_msgSend_supportedSecurityTypes(self, a2, v2, v3, v4) >> 8) & 1;
}

- (BOOL)isWEP
{
  return objc_msgSend_supportedSecurityTypes(self, a2, v2, v3, v4) & 1;
}

- (BOOL)isWAPI
{
  return ((unint64_t)objc_msgSend_supportedSecurityTypes(self, a2, v2, v3, v4) >> 1) & 1;
}

- (BOOL)isWPA
{
  return (objc_msgSend_supportedSecurityTypes(self, a2, v2, v3, v4) & 0xC) != 0;
}

- (BOOL)isWPA2
{
  return (objc_msgSend_supportedSecurityTypes(self, a2, v2, v3, v4) & 0x30) != 0;
}

- (BOOL)isWPA3
{
  return (objc_msgSend_supportedSecurityTypes(self, a2, v2, v3, v4) & 0xC0) != 0;
}

- (BOOL)isPSK
{
  char v6 = objc_msgSend_supportedSecurityTypes(self, a2, v2, v3, v4);
  char v11 = v6;
  if ((v6 & 1) == 0)
  {
    if ((v6 & 2) != 0) {
      return 1;
    }
    return (v11 & 0x14) != 0 || (v11 & 0x40) != 0LL;
  }

  uint64_t v13 = objc_msgSend_WEPSubtype(self, v7, v8, v9, v10);
  BOOL result = 1;
  if ((v11 & 2) == 0 && v13 == 5) {
    return (v11 & 0x14) != 0 || (v11 & 0x40) != 0LL;
  }
  return result;
}

- (BOOL)isEAP
{
  char v6 = objc_msgSend_supportedSecurityTypes(self, a2, v2, v3, v4);
  char v11 = v6;
  if ((v6 & 1) == 0)
  {
    if ((v6 & 8) != 0) {
      return 1;
    }
    return (v11 & 0x20) != 0 || v11 < 0LL;
  }

  uint64_t v13 = objc_msgSend_WEPSubtype(self, v7, v8, v9, v10);
  BOOL result = 1;
  if ((v11 & 8) == 0 && v13 != 5) {
    return (v11 & 0x20) != 0 || v11 < 0LL;
  }
  return result;
}

- (unint64_t)strongestSupportedSecurityType
{
  __int16 v6 = objc_msgSend_supportedSecurityTypes(self, a2, v2, v3, v4);
  uint64_t v11 = objc_msgSend_WAPISubtype(self, v7, v8, v9, v10);
  uint64_t v16 = objc_msgSend_WEPSubtype(self, v12, v13, v14, v15);
  return CWFStrongestSecurityType(v6, v11, v16);
}

- (unint64_t)weakestSupportedSecurityType
{
  __int16 v6 = objc_msgSend_supportedSecurityTypes(self, a2, v2, v3, v4);
  uint64_t v11 = objc_msgSend_WAPISubtype(self, v7, v8, v9, v10);
  uint64_t v16 = objc_msgSend_WEPSubtype(self, v12, v13, v14, v15);
  return CWFWeakestSecurityType(v6, v11, v16);
}

- (unint64_t)effectiveSupportedSecurityTypes
{
  uint64_t v6 = objc_msgSend_supportedSecurityTypes(self, a2, v2, v3, v4);
  if (v6 == 16) {
    uint64_t v11 = 80LL;
  }
  else {
    uint64_t v11 = v6;
  }
  if (v11 == 512) {
    unint64_t v12 = 768LL;
  }
  else {
    unint64_t v12 = v11;
  }
  char v13 = objc_msgSend_transitionDisabledFlags(self, v7, v8, v9, v10);
  if ((v12 & 0x50) != 0 && (v13 & 1) != 0)
  {
    CWFGetOSLog();
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      CWFGetOSLog();
      uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v16 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v17 = MEMORY[0x1895F8DA0];
    }

    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      _os_log_send_and_compose_impl();
    }

    return 64LL;
  }

  return v12;
}

- (BOOL)isAutoJoinDisabled
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setAutoJoinDisabled:(BOOL)a3
{
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_189E880A0, v7);
}

- (int64_t)hiddenState
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  int64_t v9 = objc_msgSend_integerValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setHiddenState:(int64_t)a3
{
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_189E880B8, v7);
}

- (NSDate)wasHiddenBefore
{
  return (NSDate *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_189E880D0, v2, v3);
}

- (void)setWasHiddenBefore:(id)a3
{
}

- (NSDictionary)captiveProfile
{
  return (NSDictionary *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_189E880E8, v2, v3);
}

- (void)setCaptiveProfile:(id)a3
{
}

- (BOOL)isCaptiveStateDetermined
{
  if (!qword_18C4A4290) {
    qword_18C4A4290 = _sl_dlopen();
  }
  if (!qword_18C4A4290) {
    return 0;
  }
  objc_msgSend_captiveProfile(self, a2, v2, v3, v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  sub_186475984((uint64_t)v6, v7, v8, v9, v10);
  objc_msgSend_objectForKeyedSubscript_(v6, v12, v11, v13, v14);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v16 = v15 != 0LL;

  return v16;
}

- (BOOL)isCaptive
{
  if (!qword_18C4A4290) {
    qword_18C4A4290 = _sl_dlopen();
  }
  if (!qword_18C4A4290) {
    return 0;
  }
  objc_msgSend_captiveProfile(self, a2, v2, v3, v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  sub_186475984((uint64_t)v6, v7, v8, v9, v10);
  objc_msgSend_objectForKeyedSubscript_(v6, v12, v11, v13, v14);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  char v20 = objc_msgSend_BOOLValue(v15, v16, v17, v18, v19);

  return v20;
}

- (BOOL)wasCaptive
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  if (!qword_18C4A4290)
  {
    __int128 v32 = xmmword_189E5C1B0;
    uint64_t v33 = 0LL;
    qword_18C4A4290 = _sl_dlopen();
  }

  if (!qword_18C4A4290) {
    return 0;
  }
  uint64_t v6 = objc_msgSend_captiveProfile(self, a2, v2, v3, v4);
  uint64_t v11 = (void *)v6;
  *(void *)&__int128 v32 = 0LL;
  *((void *)&v32 + 1) = &v32;
  uint64_t v33 = 0x2020000000LL;
  unint64_t v12 = (uint64_t *)qword_18C4A4298;
  uint64_t v34 = qword_18C4A4298;
  if (!qword_18C4A4298)
  {
    uint64_t v13 = sub_18647A758(v6, v7, v8, v9, v10);
    unint64_t v12 = (uint64_t *)dlsym(v13, "kCNSNetworkWasCaptiveProperty");
    *(void *)(*((void *)&v32 + 1) + 24LL) = v12;
    qword_18C4A4298 = (uint64_t)v12;
  }

  _Block_object_dispose(&v32, 8);
  if (!v12)
  {
    objc_msgSend_currentHandler(MEMORY[0x1896077D8], v14, v15, v16, v17);
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithUTF8String_( NSString,  v26,  (uint64_t)"CFStringRef getkCNSNetworkWasCaptiveProperty(void)",  v27,  v28);
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v30 = dlerror();
    objc_msgSend_handleFailureInFunction_file_lineNumber_description_( v25,  v31,  (uint64_t)v29,  (uint64_t)@"CWFNetworkProfile.m",  32,  @"%s",  v30);

    __break(1u);
  }

  objc_msgSend_objectForKeyedSubscript_(v11, v14, *v12, v16, v17);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  char v23 = objc_msgSend_BOOLValue(v18, v19, v20, v21, v22);

  return v23;
}

- (BOOL)bypassCaptive
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  if (!qword_18C4A4290)
  {
    __int128 v32 = xmmword_189E5C1B0;
    uint64_t v33 = 0LL;
    qword_18C4A4290 = _sl_dlopen();
  }

  if (!qword_18C4A4290) {
    return 0;
  }
  uint64_t v6 = objc_msgSend_captiveProfile(self, a2, v2, v3, v4);
  uint64_t v11 = (void *)v6;
  *(void *)&__int128 v32 = 0LL;
  *((void *)&v32 + 1) = &v32;
  uint64_t v33 = 0x2020000000LL;
  unint64_t v12 = (uint64_t *)qword_18C4A42A0;
  uint64_t v34 = qword_18C4A42A0;
  if (!qword_18C4A42A0)
  {
    uint64_t v13 = sub_18647A758(v6, v7, v8, v9, v10);
    unint64_t v12 = (uint64_t *)dlsym(v13, "kCNSCaptiveBypassProperty");
    *(void *)(*((void *)&v32 + 1) + 24LL) = v12;
    qword_18C4A42A0 = (uint64_t)v12;
  }

  _Block_object_dispose(&v32, 8);
  if (!v12)
  {
    objc_msgSend_currentHandler(MEMORY[0x1896077D8], v14, v15, v16, v17);
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithUTF8String_( NSString,  v26,  (uint64_t)"CFStringRef getkCNSCaptiveBypassProperty(void)",  v27,  v28);
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v30 = dlerror();
    objc_msgSend_handleFailureInFunction_file_lineNumber_description_( v25,  v31,  (uint64_t)v29,  (uint64_t)@"CWFNetworkProfile.m",  33,  @"%s",  v30);

    __break(1u);
  }

  objc_msgSend_objectForKeyedSubscript_(v11, v14, *v12, v16, v17);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  char v23 = objc_msgSend_BOOLValue(v18, v19, v20, v21, v22);

  return v23;
}

- (NSDate)captiveWebsheetLoginDate
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  if (!qword_18C4A4290)
  {
    __int128 v27 = xmmword_189E5C1B0;
    uint64_t v28 = 0LL;
    qword_18C4A4290 = _sl_dlopen();
  }

  if (qword_18C4A4290)
  {
    uint64_t v6 = objc_msgSend_captiveProfile(self, a2, v2, v3, v4);
    uint64_t v11 = (void *)v6;
    *(void *)&__int128 v27 = 0LL;
    *((void *)&v27 + 1) = &v27;
    uint64_t v28 = 0x2020000000LL;
    unint64_t v12 = (uint64_t *)qword_18C4A42A8;
    uint64_t v29 = qword_18C4A42A8;
    if (!qword_18C4A42A8)
    {
      uint64_t v13 = sub_18647A758(v6, v7, v8, v9, v10);
      unint64_t v12 = (uint64_t *)dlsym(v13, "kCNSCaptiveNetworkWebSheetLoginDateProperty");
      *(void *)(*((void *)&v27 + 1) + 24LL) = v12;
      qword_18C4A42A8 = (uint64_t)v12;
    }

    _Block_object_dispose(&v27, 8);
    if (!v12)
    {
      objc_msgSend_currentHandler(MEMORY[0x1896077D8], v14, v15, v16, v17);
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithUTF8String_( NSString,  v21,  (uint64_t)"CFStringRef getkCNSCaptiveNetworkWebSheetLoginDateProperty(void)",  v22,  v23);
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v25 = dlerror();
      objc_msgSend_handleFailureInFunction_file_lineNumber_description_( v20,  v26,  (uint64_t)v24,  (uint64_t)@"CWFNetworkProfile.m",  34,  @"%s",  v25);

      __break(1u);
    }

    objc_msgSend_objectForKeyedSubscript_(v11, v14, *v12, v16, v17);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v18 = 0LL;
  }

  return (NSDate *)v18;
}

- (BOOL)isPasswordSharingSupported
{
  return (objc_msgSend_isOpen(self, a2, v2, v3, v4) & 1) == 0
      && (objc_msgSend_isWAPI(self, v6, v7, v8, v9) & 1) == 0
      && (objc_msgSend_isWEP(self, v10, v11, v12, v13) & 1) == 0
      && (objc_msgSend_isEAP(self, v14, v15, v16, v17) & 1) == 0
      && (objc_msgSend_isProfileBased(self, v18, v19, v20, v21) & 1) == 0
      && !objc_msgSend_isOWE(self, v22, v23, v24, v25);
}

- (BOOL)isPasswordSharingDisabled
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setPasswordSharingDisabled:(BOOL)a3
{
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_189E88100, v7);
}

- (NSString)payloadUUID
{
  return (NSString *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_189E88118, v2, v3);
}

- (void)setPayloadUUID:(id)a3
{
}

- (BOOL)isProfileBased
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v6 = v5 != 0LL;

  return v6;
}

- (int64_t)addReason
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  int64_t v9 = objc_msgSend_integerValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setAddReason:(int64_t)a3
{
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_189E88130, v7);
}

- (NSDate)addedAt
{
  return (NSDate *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_189E88148, v2, v3);
}

- (void)setAddedAt:(id)a3
{
}

- (NSDate)lastJoinedByUserAt
{
  return (NSDate *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_189E88160, v2, v3);
}

- (void)setLastJoinedByUserAt:(id)a3
{
}

- (NSDate)lastJoinedBySystemAt
{
  return (NSDate *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_189E88178, v2, v3);
}

- (void)setLastJoinedBySystemAt:(id)a3
{
}

- (BOOL)wasMoreRecentlyJoinedByUser
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_timeIntervalSinceReferenceDate(v6, v7, v8, v9, v10);
  double v12 = v11;
  objc_msgSend_lastJoinedBySystemAt(self, v13, v14, v15, v16);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_timeIntervalSinceReferenceDate(v17, v18, v19, v20, v21);
  BOOL v23 = v12 > v22;

  return v23;
}

- (NSDate)lastJoinedAt
{
  double v7 = v6;
  objc_msgSend_lastJoinedBySystemAt(self, v8, v9, v10, v11);
  double v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_timeIntervalSinceReferenceDate(v12, v13, v14, v15, v16);
  if (v21 <= v7) {
    double v22 = v21;
  }
  else {
    double v22 = 0.0;
  }
  objc_msgSend_lastJoinedByUserAt(self, v17, v18, v19, v20);
  BOOL v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_timeIntervalSinceReferenceDate(v23, v24, v25, v26, v27);
  if (v28 > v7) {
    double v28 = 0.0;
  }
  if (v22 <= v28) {
    uint64_t v29 = v23;
  }
  else {
    uint64_t v29 = v12;
  }
  uint64_t v30 = v29;

  return v30;
}

- (NSDate)lastJoinedOnAnyDeviceAt
{
  double v7 = v6;
  objc_msgSend_lastJoinedAt(self, v8, v9, v10, v11);
  double v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_timeIntervalSinceReferenceDate(v12, v13, v14, v15, v16);
  double v18 = v17;
  objc_msgSend_lastDisconnectTimestamp(self, v19, v20, v21, v22);
  BOOL v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_timeIntervalSinceReferenceDate(v23, v24, v25, v26, v27);
  if (v18 <= v7 && v32 <= v7)
  {
    double v34 = v32;
    if (v32 <= v18)
    {
      double v34 = v18;
    }

    else
    {
      id v35 = v23;

      double v12 = v35;
    }
  }

  else
  {
    double v34 = 0.0;
  }

  uint64_t JoinedBySystemAtWeek = objc_msgSend_lastJoinedBySystemAtWeek(self, v28, v29, v30, v31);
  if (v7 >= (double)(unint64_t)(604800 * JoinedBySystemAtWeek))
  {
    double v41 = (double)(unint64_t)(604800 * JoinedBySystemAtWeek);
    objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(MEMORY[0x189603F50], v37, v38, v39, v40, v41);
  }

  else
  {
    double v41 = 0.0;
    objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(MEMORY[0x189603F50], v37, v38, v39, v40, 0.0);
  }
  uint64_t v42 = ;
  uint64_t v43 = (void *)v42;
  if (v34 > 0.0 || v41 > 0.0)
  {
    if (v34 <= v41) {
      uint64_t v45 = (void *)v42;
    }
    else {
      uint64_t v45 = v12;
    }
    id v44 = v45;
  }

  else
  {
    id v44 = 0LL;
  }

  uint64_t v46 = (NSDate *)v44;

  return v46;
}

- (NSString)bundleID
{
  return (NSString *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_189E88190, v2, v3);
}

- (void)setBundleID:(id)a3
{
}

- (BOOL)isAppBased
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v6 = v5 != 0LL;

  return v6;
}

- (BOOL)isPersonalHotspot
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setPersonalHotspot:(BOOL)a3
{
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_189E881A8, v7);
}

- (BOOL)isHotspot
{
  if ((objc_msgSend_isCaptive(self, a2, v2, v3, v4) & 1) != 0
    || (objc_msgSend_isPasspoint(self, v6, v7, v8, v9) & 1) != 0)
  {
    return 1;
  }

  objc_msgSend_acceptedEAPTypes(self, v10, v11, v12, v13);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_containsObject_(v15, v16, (uint64_t)&unk_189E881C0, v17, v18))
  {
    char v14 = 1;
  }

  else
  {
    objc_msgSend_acceptedEAPTypes(self, v19, v20, v21, v22);
    BOOL v23 = (void *)objc_claimAutoreleasedReturnValue();
    char v14 = objc_msgSend_containsObject_(v23, v24, (uint64_t)&unk_189E881D8, v25, v26);
  }

  return v14;
}

- (int)transitionDisabledFlags
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  int v9 = objc_msgSend_unsignedIntValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setTransitionDisabledFlags:(int)a3
{
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_189E881F0, v7);
}

- (BOOL)isStandalone6G
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setStandalone6G:(BOOL)a3
{
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_189E88208, v7);
}

- (BOOL)isSystemMode
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setSystemMode:(BOOL)a3
{
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_189E88220, v7);
}

- (BOOL)isSessionBased
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setSessionBased:(BOOL)a3
{
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_189E88238, v7);
}

- (int64_t)lowDataMode
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  int64_t v9 = objc_msgSend_integerValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setLowDataMode:(int64_t)a3
{
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_189E88250, v7);
}

- (NSDictionary)EAPProfile
{
  return (NSDictionary *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_189E88268, v2, v3);
}

- (void)setEAPProfile:(id)a3
{
}

- (NSArray)acceptedEAPTypes
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v5, v6, (uint64_t)@"AcceptEAPTypes", v7, v8);
  int64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v9;
}

- (NSArray)innerAcceptedEAPTypes
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v5, v6, (uint64_t)@"InnerAcceptEAPTypes", v7, v8);
  int64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v9;
}

- (BOOL)isTLSCertificateRequired
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v5, v6, (uint64_t)@"TLSCertificateIsRequired", v7, v8);
  int64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  char v14 = objc_msgSend_BOOLValue(v9, v10, v11, v12, v13);

  return v14;
}

- (NSArray)TLSTrustedServerNames
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v5, v6, (uint64_t)@"TLSTrustedServerNames", v7, v8);
  int64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v9;
}

- (NSString)domainName
{
  return (NSString *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_189E87EA8, v2, v3);
}

- (void)setDomainName:(id)a3
{
  self->_useCachedIdentifier = 0;
}

- (BOOL)isPasspoint
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v6 = v5 != 0LL;

  return v6;
}

- (NSString)displayedOperatorName
{
  return (NSString *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_189E88280, v2, v3);
}

- (void)setDisplayedOperatorName:(id)a3
{
}

- (NSArray)roamingConsortiumList
{
  return (NSArray *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_189E88298, v2, v3);
}

- (void)setRoamingConsortiumList:(id)a3
{
}

- (NSArray)NAIRealmNameList
{
  return (NSArray *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_189E882B0, v2, v3);
}

- (void)setNAIRealmNameList:(id)a3
{
}

- (NSArray)cellularNetworkInfo
{
  return (NSArray *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_189E882C8, v2, v3);
}

- (void)setCellularNetworkInfo:(id)a3
{
}

- (BOOL)isServiceProviderRoamingEnabled
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  int64_t v9 = v4;
  if (v4) {
    char v10 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);
  }
  else {
    char v10 = 1;
  }

  return v10;
}

- (void)setServiceProviderRoamingEnabled:(BOOL)a3
{
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_189E882E0, v7);
}

+ (id)supportedOSSpecificKeys
{
  if (qword_18C4A4288 != -1) {
    dispatch_once(&qword_18C4A4288, &unk_189E5C190);
  }
  return (id)qword_18C4A4280;
}

- (void)setOSSpecificValue:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v11 = a4;
  if (v11
    && (objc_msgSend_supportedOSSpecificKeys(CWFNetworkProfile, v7, v8, v9, v10),
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(),
        int v16 = objc_msgSend_containsObject_(v12, v13, (uint64_t)v11, v14, v15),
        v12,
        v16))
  {
    objc_msgSend_objectForKeyedSubscript_(self->_internal, v17, (uint64_t)&unk_189E87EC0, v18, v19);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 && !v20)
    {
      objc_msgSend_dictionary(MEMORY[0x189603FC8], v21, v22, v23, v24);
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v26, (uint64_t)v25, (uint64_t)&unk_189E87EC0, v27);
    }

    objc_msgSend_objectForKeyedSubscript_(self->_internal, v21, (uint64_t)&unk_189E87EC0, v23, v24);
    double v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v28, v29, (uint64_t)v6, (uint64_t)v11, v30);
  }

  else
  {
    CWFGetOSLog();
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      CWFGetOSLog();
      double v28 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      double v28 = (void *)MEMORY[0x1895F8DA0];
      id v32 = MEMORY[0x1895F8DA0];
    }

    if (os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_FAULT)) {
      _os_log_send_and_compose_impl();
    }
  }
}

- (id)OSSpecificValueForKey:(id)a3
{
  if (a3)
  {
    internal = self->_internal;
    id v4 = a3;
    objc_msgSend_objectForKeyedSubscript_(internal, v5, (uint64_t)&unk_189E87EC0, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v8, v9, (uint64_t)v4, v10, v11);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v12 = 0LL;
  }

  return v12;
}

- (NSDictionary)OSSpecificAttributes
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = (void *)objc_msgSend_copy(v4, v5, v6, v7, v8);

  return (NSDictionary *)v9;
}

- (void)setOSSpecificAttributes:(id)a3
{
  uint64_t v60 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  uint64_t v9 = v4;
  if (v4)
  {
    uint64_t v45 = self;
    uint64_t v46 = v4;
    __int128 v49 = 0u;
    __int128 v50 = 0u;
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    objc_msgSend_allKeys(v4, v5, v6, v7, v8);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v47, (uint64_t)v59, 16);
    if (v12)
    {
      uint64_t v17 = v12;
      uint64_t v18 = 0LL;
      uint64_t v19 = *(void *)v48;
      uint64_t v20 = (void *)MEMORY[0x1895F8DA0];
      do
      {
        for (uint64_t i = 0LL; i != v17; ++i)
        {
          if (*(void *)v48 != v19) {
            objc_enumerationMutation(v10);
          }
          uint64_t v22 = *(void *)(*((void *)&v47 + 1) + 8 * i);
          objc_msgSend_supportedOSSpecificKeys(CWFNetworkProfile, v13, v14, v15, v16, v43, v44);
          uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
          char v27 = objc_msgSend_containsObject_(v23, v24, v22, v25, v26);

          if ((v27 & 1) == 0)
          {
            if (!v18)
            {
              objc_msgSend_array(MEMORY[0x189603FA8], v13, v14, v15, v16);
              uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
            }

            objc_msgSend_addObject_(v18, v13, v22, v15, v16);
            CWFGetOSLog();
            double v28 = (void *)objc_claimAutoreleasedReturnValue();
            if (v28)
            {
              CWFGetOSLog();
              uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            }

            else
            {
              id v30 = v20;
              uint64_t v29 = (os_log_s *)v20;
            }

            if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
            {
              int v51 = 136446978;
              uint64_t v52 = "-[CWFNetworkProfile setOSSpecificAttributes:]";
              __int16 v53 = 2082;
              uint64_t v54 = "CWFNetworkProfile.m";
              __int16 v55 = 1024;
              int v56 = 2387;
              __int16 v57 = 2112;
              uint64_t v58 = v22;
              LODWORD(v44) = 38;
              uint64_t v43 = &v51;
              _os_log_send_and_compose_impl();
            }
          }
        }

        uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v47, (uint64_t)v59, 16);
      }

      while (v17);
    }

    else
    {
      uint64_t v18 = 0LL;
    }

    if (objc_msgSend_count(v18, v32, v33, v34, v35))
    {
      uint64_t v9 = v46;
      uint64_t v31 = (void *)objc_msgSend_mutableCopy(v46, v36, v37, v38, v39);
      objc_msgSend_removeObjectsForKeys_(v31, v40, (uint64_t)v18, v41, v42);
    }

    else
    {
      uint64_t v31 = 0LL;
      uint64_t v9 = v46;
    }

    self = v45;
  }

  else
  {
    uint64_t v31 = 0LL;
  }

  if (v31) {
    objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v5, (uint64_t)v31, (uint64_t)&unk_189E87EC0, v8, v43, v44);
  }
  else {
    objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v5, (uint64_t)v9, (uint64_t)&unk_189E87EC0, v8, v43, v44);
  }
}

- (id)identifier
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if ((objc_msgSend_useCachedIdentifier(v2, v3, v4, v5, v6) & 1) == 0)
  {
    if (objc_msgSend_isPasspoint(v2, v7, v8, v9, v10))
    {
      objc_msgSend_domainName(v2, v11, v12, v13, v14);
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v18)
      {
LABEL_11:

        objc_msgSend_setUseCachedIdentifier_(v2, v44, 1, v45, v46);
        goto LABEL_12;
      }

      objc_msgSend_stringWithFormat_( NSString,  v15,  (uint64_t)@"wifi.network.passpoint.%@",  v16,  v17,  v18);
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setCachedIdentifier_(v2, v20, (uint64_t)v19, v21, v22);
    }

    else
    {
      objc_msgSend_networkName(v2, v11, v12, v13, v14);
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        objc_msgSend_stringWithFormat_(NSString, v23, (uint64_t)@"wifi.network.ssid.%@", v25, v26, v18);
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setCachedIdentifier_(v2, v27, (uint64_t)v19, v28, v29);
      }

      else
      {
        objc_msgSend_SSID(v2, v23, v24, v25, v26);
        id v30 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v19 = v30;
        if (v30)
        {
          uint64_t v35 = (void *)NSString;
          CWFHexadecimalStringFromData(v30, v31, v32, v33, v34);
          uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_stringWithFormat_(v35, v37, (uint64_t)@"wifi.network.ssid.%@", v38, v39, v36);
          uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setCachedIdentifier_(v2, v41, (uint64_t)v40, v42, v43);
        }

        uint64_t v18 = 0LL;
      }
    }

    goto LABEL_11;
  }

- (NSDate)updatedAt
{
  return (NSDate *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_189E882F8, v2, v3);
}

- (void)setUpdatedAt:(id)a3
{
}

- (NSString)carplayUUID
{
  return (NSString *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_189E88310, v2, v3);
}

- (void)setCarplayUUID:(id)a3
{
}

- (void)setCarplayNetwork:(BOOL)a3
{
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_189E88328, v7);
}

- (BOOL)isCarPlayNetwork
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)isCarPlay
{
  if (objc_msgSend_isCarPlayNetwork(self, a2, v2, v3, v4)) {
    return 1;
  }
  objc_msgSend_carplayUUID(self, v6, v7, v8, v9);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v10 = v11 != 0LL;

  return v10;
}

- (NSDictionary)userPreferredNetworkNames
{
  return (NSDictionary *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_189E88340, v2, v3);
}

- (void)setUserPreferredNetworkNames:(id)a3
{
}

- (NSDictionary)userPreferredPasspointDomains
{
  return (NSDictionary *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_189E88358, v2, v3);
}

- (void)setUserPreferredPasspointDomains:(id)a3
{
}

- (NSString)networkGroupID
{
  return (NSString *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_189E88370, v2, v3);
}

- (void)setNetworkGroupID:(id)a3
{
}

- (unint64_t)networkGroupPriority
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v9 = objc_msgSend_unsignedIntegerValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setNetworkGroupPriority:(unint64_t)a3
{
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_189E88388, v7);
}

- (NSDate)lastDiscoveredAt
{
  return (NSDate *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_189E883A0, v2, v3);
}

- (void)setLastDiscoveredAt:(id)a3
{
}

- (NSSet)BSSList
{
  return (NSSet *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_189E883B8, v2, v3);
}

- (void)setBSSList:(id)a3
{
  v28[1] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if ((unint64_t)objc_msgSend_count(v4, v5, v6, v7, v8) < 0xB)
  {
    objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v9, (uint64_t)v4, (uint64_t)&unk_189E883B8, v10);
  }

  else
  {
    objc_msgSend_sortDescriptorWithKey_ascending_(MEMORY[0x189607A20], v9, (uint64_t)@"lastAssociatedAt", 0, v10);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v11;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x189603F18], v12, (uint64_t)v28, 1, v13);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sortedArrayUsingDescriptors_(v4, v15, (uint64_t)v14, v16, v17);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_subarrayWithRange_(v18, v19, 0, 10, v20);
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_setWithArray_(MEMORY[0x189604010], v22, (uint64_t)v21, v23, v24);
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v26, (uint64_t)v25, (uint64_t)&unk_189E883B8, v27);
  }
}

- (void)setPrivacyProxyEnabled:(BOOL)a3
{
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_189E883D0, v7);
}

- (BOOL)isPrivacyProxyEnabled
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v9 = v4;
  if (v4) {
    char v10 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);
  }
  else {
    char v10 = 1;
  }

  return v10;
}

- (void)setBlueAtlasNetwork:(BOOL)a3
{
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_189E883E8, v7);
}

- (void)setPublicAirPlayNetwork:(BOOL)a3
{
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_189E88400, v7);
}

- (BOOL)isBlueAtlasNetwork
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)isPublicAirPlayNetwork
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setPrivacyProxyBlockedReason:(id)a3
{
}

- (NSString)privacyProxyBlockedReason
{
  return (NSString *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_189E88418, v2, v3);
}

- (int64_t)movingAttribute
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  int64_t v9 = objc_msgSend_integerValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setMovingAttribute:(int64_t)a3
{
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_189E88430, v7);
}

- (int64_t)publicAttribute
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  int64_t v9 = objc_msgSend_integerValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setPublicAttribute:(int64_t)a3
{
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_189E88448, v7);
}

- (int64_t)nearbyShareableStatus
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  int64_t v9 = objc_msgSend_integerValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setNearbyShareableStatus:(int64_t)a3
{
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_189E88460, v7);
}

- (NSString)NANServiceID
{
  return (NSString *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_189E88478, v2, v3);
}

- (void)setNANServiceID:(id)a3
{
}

- (BOOL)isAllowedInLockdownMode
{
  return (objc_msgSend_isOpen(self, a2, v2, v3, v4) & 1) == 0
      && (objc_msgSend_isOWE(self, v6, v7, v8, v9) & 1) == 0
      && (!objc_msgSend_isWEP(self, v10, v11, v12, v13)
       || (objc_msgSend_isPSK(self, v14, v15, v16, v17) & 1) == 0)
      && (!objc_msgSend_isWPA(self, v14, v15, v16, v17)
       || (objc_msgSend_isPSK(self, v18, v19, v20, v21) & 1) == 0)
      && (objc_msgSend_isWAPI(self, v18, v19, v20, v21) & 1) == 0
      && (objc_msgSend_isPasspoint(self, v22, v23, v24, v25) & 1) == 0
      && !objc_msgSend_isCaptive(self, v26, v27, v28, v29);
}

- (BOOL)isAutojoinDisabledUntilFirstUserJoin
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setDisableAutojoinUntilFirstUserJoin:(BOOL)a3
{
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_189E88490, v7);
}

- (id)networkDisabledUntilDate
{
  return (id)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_189E884A8, v2, v3);
}

- (void)setNetworkDisabledUntilDate:(id)a3
{
}

- (BOOL)isPasspointHomeOperatorNetwork
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setPasspointHomeOperatorNetwork:(BOOL)a3
{
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_189E884C0, v7);
}

- (BOOL)isPasspointProvisionedNetwork
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setPasspointProvisionedNetwork:(BOOL)a3
{
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_189E884D8, v7);
}

- (id)passpointAccountName
{
  return (id)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_189E884F0, v2, v3);
}

- (void)setPasspointAccountName:(id)a3
{
}

- (unint64_t)lastJoinedBySystemAtWeek
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v10 = objc_msgSend_unsignedIntegerValue(v5, v6, v7, v8, v9);

  objc_msgSend_lastJoinedBySystemAt(self, v11, v12, v13, v14);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_timeIntervalSinceReferenceDate(v15, v16, v17, v18, v19);
  unint64_t v21 = vcvtmd_u64_f64(v20 / 86400.0 / 7.0);

  if (v10 <= v21) {
    return v21;
  }
  else {
    return v10;
  }
}

- (void)setLastJoinedBySystemAtWeek:(unint64_t)a3
{
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_189E87F50, v7);
}

- (NSDate)was6GHzOnlyAt
{
  return (NSDate *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_189E87F20, v2, v3);
}

- (void)setWas6GHzOnlyAt:(id)a3
{
}

- (unint64_t)was6GHzOnlyAtWeek
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v10 = objc_msgSend_unsignedIntegerValue(v5, v6, v7, v8, v9);

  objc_msgSend_was6GHzOnlyAt(self, v11, v12, v13, v14);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_timeIntervalSinceReferenceDate(v15, v16, v17, v18, v19);
  unint64_t v21 = vcvtmd_u64_f64(v20 / 86400.0 / 7.0);

  if (v10 <= v21) {
    return v21;
  }
  else {
    return v10;
  }
}

- (void)setWas6GHzOnlyAtWeek:(unint64_t)a3
{
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_189E87F38, v7);
}

- (NSDate)was6GHzOnlyOnAnyDeviceAt
{
  double v7 = v6;
  objc_msgSend_was6GHzOnlyAt(self, v8, v9, v10, v11);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_timeIntervalSinceReferenceDate(v12, v13, v14, v15, v16);
  if (v21 <= v7) {
    double v22 = v21;
  }
  else {
    double v22 = 0.0;
  }
  uint64_t v23 = objc_msgSend_was6GHzOnlyAtWeek(self, v17, v18, v19, v20);
  if (v7 >= (double)(unint64_t)(604800 * v23))
  {
    double v28 = (double)(unint64_t)(604800 * v23);
    objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(MEMORY[0x189603F50], v24, v25, v26, v27, v28);
  }

  else
  {
    double v28 = 0.0;
    objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(MEMORY[0x189603F50], v24, v25, v26, v27, 0.0);
  }
  uint64_t v29 = ;
  id v30 = (void *)v29;
  if (v22 > 0.0 || v28 > 0.0)
  {
    if (v22 <= v28) {
      uint64_t v32 = (void *)v29;
    }
    else {
      uint64_t v32 = v12;
    }
    id v31 = v32;
  }

  else
  {
    id v31 = 0LL;
  }

  uint64_t v33 = (NSDate *)v31;

  return v33;
}

- (BOOL)wasRecently6GHzOnlyOnAnyDevice
{
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend_lastJoinedByUserAt(self, v6, v7, v8, v9);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_timeIntervalSinceReferenceDate(v11, v12, v13, v14, v15);
    double v17 = v16;
    objc_msgSend_was6GHzOnlyOnAnyDeviceAt(self, v18, v19, v20, v21);
    double v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_timeIntervalSinceReferenceDate(v22, v23, v24, v25, v26);
    if (v17 >= v31)
    {
      objc_msgSend_lastJoinedByUserAt(self, v27, v28, v29, v30);
      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_timeIntervalSinceReferenceDate(v33, v34, v35, v36, v37);
      double v39 = v38;
      objc_msgSend_was6GHzOnlyOnAnyDeviceAt(self, v40, v41, v42, v43);
      uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_timeIntervalSinceReferenceDate(v44, v45, v46, v47, v48);
      BOOL v32 = v39 - v49 <= 1209600.0;
    }

    else
    {
      BOOL v32 = 1;
    }
  }

  else
  {
    BOOL v32 = 0;
  }

  return v32;
}

- (NSArray)seamlessSSIDList
{
  return (NSArray *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_189E87F68, v2, v3);
}

- (void)setSeamlessSSIDList:(id)a3
{
}

- (BOOL)isDNSHeuristicsFilteredNetwork
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setDNSHeuristicsFilteredNetwork:(BOOL)a3
{
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_189E88508, v7);
}

- (NSDictionary)DNSHeuristicsFailureStateInfo
{
  return (NSDictionary *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_189E88520, v2, v3);
}

- (void)setDNSHeuristicsFailureStateInfo:(id)a3
{
}

- (BOOL)isHighPopularity
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setHighPopularity:(BOOL)a3
{
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_189E88538, v7);
}

- (BOOL)isPotentiallyCaptive
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setPotentiallyCaptive:(BOOL)a3
{
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_189E88550, v7);
}

- (BOOL)isPotentiallyMoving
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setPotentiallyMoving:(BOOL)a3
{
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_189E88568, v7);
}

- (BOOL)isHighQuality
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setHighQuality:(BOOL)a3
{
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_189E88580, v7);
}

- (BOOL)isSuspicious
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setIsSuspicious:(BOOL)a3
{
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_189E88598, v7);
}

- (BOOL)isTCPGood
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setIsTCPGood:(BOOL)a3
{
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_189E885B0, v7);
}

- (BOOL)isLowPopularity
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setLowPopularity:(BOOL)a3
{
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_189E885C8, v7);
}

- (BOOL)isLowQuality
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setLowQuality:(BOOL)a3
{
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_189E885E0, v7);
}

- (BOOL)isProminentDisplay
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setProminentDisplay:(BOOL)a3
{
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_189E885F8, v7);
}

- (unint64_t)popularityScore
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v9 = objc_msgSend_unsignedIntValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setPopularityScore:(unint64_t)a3
{
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_189E88610, v7);
}

- (unint64_t)qualityScore
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v9 = objc_msgSend_unsignedIntValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setQualityScore:(unint64_t)a3
{
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_189E88628, v7);
}

- (unint64_t)totalNetworkUsage
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v9 = objc_msgSend_unsignedLongLongValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setTotalNetworkUsage:(unint64_t)a3
{
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_189E88640, v7);
}

- (id)expirationDate
{
  return (id)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_189E88658, v2, v3);
}

- (void)setExpirationDate:(id)a3
{
}

- (id)lastHomeForceFixDate
{
  return (id)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_189E88670, v2, v3);
}

- (void)setLastHomeForceFixDate:(id)a3
{
}

- (int64_t)locationOfInterest
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  int64_t v9 = objc_msgSend_unsignedIntValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setLocationOfInterest:(int64_t)a3
{
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_189E88688, v7);
}

- (int64_t)networkOfInterestHomeState
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  int64_t v9 = objc_msgSend_unsignedIntValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setNetworkOfInterestHomeState:(int64_t)a3
{
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_189E886A0, v7);
}

- (int64_t)networkOfInterestWorkState
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  int64_t v9 = objc_msgSend_unsignedIntValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setNetworkOfInterestWorkState:(int64_t)a3
{
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_189E886B8, v7);
}

- (int64_t)ssidHarvestStatus
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  int64_t v9 = objc_msgSend_unsignedIntValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setSSIDHarvestStatus:(int64_t)a3
{
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_189E886D0, v7);
}

- (id)walletIdentifier
{
  return (id)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_189E886E8, v2, v3);
}

- (void)setWalletIdentifier:(id)a3
{
}

- (id)OTASystemInfoBeaconProbeList
{
  return (id)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_189E88700, v2, v3);
}

- (void)setOTASystemInfoBeaconProbeList:(id)a3
{
}

- (id)SIMIdentifiers
{
  return (id)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_189E88718, v2, v3);
}

- (void)setSIMIdentifiers:(id)a3
{
}

- (double)networkQualityResponsiveness
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_doubleValue(v4, v5, v6, v7, v8);
  double v10 = v9;

  return v10;
}

- (void)setNetworkQualityResponsiveness:(double)a3
{
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v7, (uint64_t)v9, (uint64_t)&unk_189E88730, v8);
}

- (id)networkQualityDate
{
  return (id)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_189E88748, v2, v3);
}

- (void)setNetworkQualityDate:(id)a3
{
}

- (int)lastDisconnectReason
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  int v9 = objc_msgSend_unsignedIntValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setLastDisconnectReason:(int)a3
{
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_189E87F98, v7);
}

- (id)lastDisconnectTimestamp
{
  return (id)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_189E87F80, v2, v3);
}

- (void)setLastDisconnectTimestamp:(id)a3
{
}

- (NSString)cachedPrivateMACAddress
{
  return (NSString *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_189E87FB0, v2, v3);
}

- (void)setCachedPrivateMACAddress:(id)a3
{
}

- (NSDate)cachedPrivateMACAddressUpdatedAt
{
  return (NSDate *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_189E87FC8, v2, v3);
}

- (void)setCachedPrivateMACAddressUpdatedAt:(id)a3
{
}

- (int64_t)privateMACAddressModeUserSetting
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  int64_t v9 = objc_msgSend_integerValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setPrivateMACAddressModeUserSetting:(int64_t)a3
{
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_189E87FE0, v7);
}

- (NSDate)privateMACAddressModeUserSettingUpdatedAt
{
  return (NSDate *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_189E87FF8, v2, v3);
}

- (void)setPrivateMACAddressModeUserSettingUpdatedAt:(id)a3
{
}

- (int64_t)privateMACAddressModeConfigurationProfileSetting
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  int64_t v9 = objc_msgSend_integerValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setPrivateMACAddressModeConfigurationProfileSetting:(int64_t)a3
{
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_189E88010, v7);
}

- (int64_t)privateMACAddressEvaluationState
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  int64_t v9 = objc_msgSend_integerValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)setPrivateMACAddressEvaluationState:(int64_t)a3
{
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_189E88028, v7);
}

- (BOOL)privateMACAddressEnabledForEvaluation
{
  return !objc_msgSend_privateMACAddressModeUserSetting(self, a2, v2, v3, v4)
      && !objc_msgSend_privateMACAddressModeConfigurationProfileSetting(self, v6, v7, v8, v9)
      && objc_msgSend_privateMACAddressEvaluationState(self, v10, v11, v12, v13) == 1;
}

- (BOOL)privateMACAddressDisabledByEvaluation
{
  return (objc_msgSend_isPersonalHotspot(self, a2, v2, v3, v4) & 1) == 0
      && !objc_msgSend_privateMACAddressModeUserSetting(self, v6, v7, v8, v9)
      && !objc_msgSend_privateMACAddressModeConfigurationProfileSetting(self, v10, v11, v12, v13)
      && (unint64_t)(objc_msgSend_privateMACAddressEvaluationState(self, v14, v15, v16, v17) - 2) < 4;
}

- (NSDate)privateMACAddressEvaluatedAt
{
  return (NSDate *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_189E88040, v2, v3);
}

- (void)setPrivateMACAddressEvaluatedAt:(id)a3
{
}

- (void)setDiscoveredDevices:(id)a3
{
}

- (NSDictionary)discoveredDevices
{
  return (NSDictionary *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_189E88058, v2, v3);
}

- (id)__descriptionForLowDataMode
{
  unint64_t v5 = objc_msgSend_lowDataMode(self, a2, v2, v3, v4);
  if (v5 > 2) {
    return @"?";
  }
  else {
    return off_189E5C1C8[v5];
  }
}

- (id)__descriptionForCaptiveFlags
{
  int v6 = objc_msgSend_bypassCaptive(self, a2, v2, v3, v4);
  if (!objc_msgSend_isCaptiveStateDetermined(self, v7, v8, v9, v10))
  {
    uint64_t v19 = @"?";
    uint64_t v20 = @"? (bypass)";
LABEL_5:
    if (v6) {
      uint64_t v19 = (__CFString *)v20;
    }
    return v19;
  }

  if (objc_msgSend_isCaptive(self, v11, v12, v13, v14))
  {
    uint64_t v19 = @"yes";
    uint64_t v20 = @"yes (bypass)";
    goto LABEL_5;
  }

  int v21 = objc_msgSend_wasCaptive(self, v15, v16, v17, v18);
  uint64_t v19 = @"no";
  if (v6) {
    uint64_t v19 = @"no (bypass)";
  }
  double v22 = @"was (bypass)";
  if (!v6) {
    double v22 = @"was";
  }
  if (v21) {
    uint64_t v19 = (__CFString *)v22;
  }
  return v19;
}

- (id)__descriptionForHiddenState
{
  uint64_t v5 = objc_msgSend_hiddenState(self, a2, v2, v3, v4);
  int v6 = @"?";
  if (v5 == 2) {
    int v6 = @"no";
  }
  if (v5 == 1) {
    return @"yes";
  }
  else {
    return (id)v6;
  }
}

- (id)__descriptionForMovingAttribute
{
  uint64_t v5 = objc_msgSend_movingAttribute(self, a2, v2, v3, v4);
  int v6 = @"?";
  if (v5 == 1) {
    int v6 = @"moving";
  }
  if (v5 == 2) {
    return @"stationary";
  }
  else {
    return (id)v6;
  }
}

- (id)__descriptionForPublicAttribute
{
  uint64_t v5 = objc_msgSend_publicAttribute(self, a2, v2, v3, v4);
  int v6 = @"?";
  if (v5 == 2) {
    int v6 = @"private";
  }
  if (v5 == 1) {
    return @"public";
  }
  else {
    return (id)v6;
  }
}

- (id)__descriptionForNearbyShareableStatus
{
  uint64_t v5 = objc_msgSend_nearbyShareableStatus(self, a2, v2, v3, v4);
  else {
    return off_189E5C1E0[v5 - 1];
  }
}

- (id)__descriptionFor6EMode
{
  unint64_t v5 = objc_msgSend_disable6EMode(self, a2, v2, v3, v4);
  if (v5 < 3) {
    return off_189E5C228[v5];
  }
  objc_msgSend_stringWithFormat_(NSString, v6, (uint64_t)@"? (%ld)", v7, v8, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)__descriptionForBSSListWithLimit:(unint64_t)a3
{
  v68[1] = *MEMORY[0x1895F89C0];
  objc_msgSend_string(MEMORY[0x189607940], a2, a3, v3, v4);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sortDescriptorWithKey_ascending_(MEMORY[0x189607A20], v8, (uint64_t)@"lastAssociatedAt", 0, v9);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_BSSList(self, v11, v12, v13, v14);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  v68[0] = v10;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x189603F18], v16, (uint64_t)v68, 1, v17);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sortedArrayUsingDescriptors_(v15, v19, (uint64_t)v18, v20, v21);
  double v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend_count(v22, v23, v24, v25, v26))
  {
    objc_msgSend_appendString_(v7, v27, (uint64_t)@"bssList=[", v28, v29);
    __int128 v65 = 0u;
    __int128 v66 = 0u;
    __int128 v63 = 0u;
    __int128 v64 = 0u;
    unint64_t v34 = objc_msgSend_count(v22, v30, v31, v32, v33);
    uint64_t v38 = a3;
    if (v34 <= a3) {
      uint64_t v38 = objc_msgSend_count(v22, v35, v36, a3, v37);
    }
    objc_msgSend_subarrayWithRange_(v22, v35, 0, v38, v37);
    double v39 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v39, v40, (uint64_t)&v63, (uint64_t)v67, 16);
    if (v41)
    {
      uint64_t v45 = v41;
      uint64_t v46 = *(void *)v64;
      do
      {
        for (uint64_t i = 0LL; i != v45; ++i)
        {
          if (*(void *)v64 != v46) {
            objc_enumerationMutation(v39);
          }
          objc_msgSend_appendFormat_( v7,  v42,  (uint64_t)@"(%@), ",  v43,  v44,  *(void *)(*((void *)&v63 + 1) + 8 * i));
        }

        uint64_t v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v39, v42, (uint64_t)&v63, (uint64_t)v67, 16);
      }

      while (v45);
    }

    if (objc_msgSend_count(v22, v48, v49, v50, v51) > a3) {
      objc_msgSend_appendString_(v7, v52, (uint64_t)@"..., ", v54, v55);
    }
    uint64_t v56 = objc_msgSend_length(v7, v52, v53, v54, v55);
    objc_msgSend_deleteCharactersInRange_(v7, v57, v56 - 2, 2, v58);
    objc_msgSend_appendString_(v7, v59, (uint64_t)@"], ", v60, v61);
  }

  return v7;
}

- (id)__descriptionForPrivateMAC
{
  int v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_cachedPrivateMACAddress(self, v7, v8, v9, v10);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_redactedForWiFi(v11, v12, v13, v14, v15);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_cachedPrivateMACAddressUpdatedAt(self, v17, v18, v19, v20);
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1864535C8(v21);
  double v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v23, (uint64_t)@"%@ (%@), ", v24, v25, v16, v22);

  if (objc_msgSend_privateMACAddressModeUserSetting(self, v26, v27, v28, v29))
  {
    uint64_t v34 = objc_msgSend_privateMACAddressModeUserSetting(self, v30, v31, v32, v33);
    sub_1864542D4(v34);
    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_privateMACAddressModeUserSettingUpdatedAt(self, v36, v37, v38, v39);
    uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1864535C8(v40);
    uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v6, v42, (uint64_t)@"user=%@ (%@), ", v43, v44, v35, v41);
  }

  if (objc_msgSend_privateMACAddressEvaluationState(self, v30, v31, v32, v33))
  {
    unint64_t v49 = objc_msgSend_privateMACAddressEvaluationState(self, v45, v46, v47, v48);
    sub_186454284(v49, v50, v51, v52, v53);
    uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_privateMACAddressEvaluatedAt(self, v55, v56, v57, v58);
    uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1864535C8(v59);
    uint64_t v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v6, v61, (uint64_t)@"eval=%@ (%@), ", v62, v63, v54, v60);
  }

  if (objc_msgSend_privateMACAddressModeConfigurationProfileSetting(self, v45, v46, v47, v48))
  {
    uint64_t v68 = objc_msgSend_privateMACAddressModeConfigurationProfileSetting(self, v64, v65, v66, v67);
    sub_1864542D4(v68);
    uint64_t v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v6, v70, (uint64_t)@"prof=%@, ", v71, v72, v69);
  }

  if (objc_msgSend_hasSuffix_(v6, v64, (uint64_t)@", ", v66, v67))
  {
    uint64_t v77 = objc_msgSend_length(v6, v73, v74, v75, v76);
    objc_msgSend_deleteCharactersInRange_(v6, v78, v77 - 2, 2, v79);
  }

  return v6;
}

- (id)__basicDescription
{
  int v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_networkName(self, v7, v8, v9, v10);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_redactedForWiFi(v11, v12, v13, v14, v15);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend_hasPrefix_(v16, v17, (uint64_t)@" ", v18, v19) & 1) != 0
    || objc_msgSend_hasSuffix_(v16, v20, (uint64_t)@" ", v21, v22))
  {
    uint64_t v23 = objc_msgSend_stringWithFormat_(NSString, v20, (uint64_t)@"'%@'", v21, v22, v16);

    uint64_t v16 = (void *)v23;
  }

  objc_msgSend_appendFormat_(v6, v20, (uint64_t)@"%@ - ", v21, v22, v16);
  objc_msgSend_SSID(self, v24, v25, v26, v27);
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
  CWFHexadecimalStringFromData(v28, v29, v30, v31, v32);
  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_redactedForWiFi(v33, v34, v35, v36, v37);
  uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v43 = objc_msgSend_shortSSID(self, v39, v40, v41, v42);
  objc_msgSend_appendFormat_(v6, v44, (uint64_t)@"ssid=%@ (%lu), ", v45, v46, v38, v43);

  uint64_t v51 = objc_msgSend_effectiveSupportedSecurityTypes(self, v47, v48, v49, v50);
  uint64_t v56 = (const char *)objc_msgSend_WEPSubtype(self, v52, v53, v54, v55);
  uint64_t v61 = objc_msgSend_WAPISubtype(self, v57, v58, v59, v60);
  sub_186453234(v51, v56, v61, v62, v63);
  __int128 v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v65, (uint64_t)@"security=%@, ", v66, v67, v64);

  objc_msgSend___descriptionForPrivateMAC(self, v68, v69, v70, v71);
  uint64_t v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v73, (uint64_t)@"privateMAC=[%@], ", v74, v75, v72);

  if (objc_msgSend_isPasspoint(self, v76, v77, v78, v79))
  {
    objc_msgSend_domainName(self, v80, v81, v82, v83);
    uint64_t v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_displayedOperatorName(self, v85, v86, v87, v88);
    uint64_t v89 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isServiceProviderRoamingEnabled(self, v90, v91, v92, v93)) {
      objc_msgSend_appendFormat_( v6,  v94,  (uint64_t)@"hs20=[domain=%@, display=%@, sproam=%s], ",  v95,  v96,  v84,  v89,  "yes");
    }
    else {
      objc_msgSend_appendFormat_( v6,  v94,  (uint64_t)@"hs20=[domain=%@, display=%@, sproam=%s], ",  v95,  v96,  v84,  v89,  "no");
    }
  }

  if (objc_msgSend_hiddenState(self, v97, v98, v99, v100) == 1) {
    objc_msgSend_appendString_(v6, v101, (uint64_t)@"hidden=yes, ", v103, v104);
  }
  if ((objc_msgSend_isCaptive(self, v101, v102, v103, v104) & 1) != 0
    || objc_msgSend_wasCaptive(self, v105, v106, v107, v108))
  {
    objc_msgSend___descriptionForCaptiveFlags(self, v105, v106, v107, v108);
    uint64_t v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v6, v110, (uint64_t)@"captive=%@, ", v111, v112, v109);
  }

  if (objc_msgSend_lowDataMode(self, v117, v118, v119, v120) == 1) {
    objc_msgSend_appendString_(v6, v121, (uint64_t)@"lowDataMode=on, ", v123, v124);
  }
  if (objc_msgSend_disable6EMode(self, v125, v126, v127, v128) == 2)
  {
    objc_msgSend_disable6EModeTimestamp(self, v129, v130, v131, v132);
    uint64_t v133 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1864535C8(v133);
    uint64_t v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v6, v135, (uint64_t)@"6g-mode=[off (%@)], ", v136, v137, v134);
  }

  if (objc_msgSend_wasRecently6GHzOnlyOnAnyDevice(self, v129, v130, v131, v132))
  {
    objc_msgSend_was6GHzOnlyAt(self, v138, v139, v140, v141);
    uint64_t v142 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v6, v143, (uint64_t)@"6g-only=[yes, (%@)], ", v144, v145, v142);
  }

  objc_msgSend_lastJoinedAt(self, v138, v139, v140, v141);
  uint64_t v146 = (void *)objc_claimAutoreleasedReturnValue();

  if (v146)
  {
    objc_msgSend_lastJoinedAt(self, v147, v148, v149, v150);
    __int128 v151 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1864535C8(v151);
    __int128 v152 = (void *)objc_claimAutoreleasedReturnValue();
    else {
      objc_msgSend_appendFormat_(v6, v157, (uint64_t)@"assoc=%@ (%s), ", v158, v159, v152, "auto");
    }
  }

  objc_msgSend_lastDisconnectTimestamp(self, v147, v148, v149, v150);
  __int128 v160 = (void *)objc_claimAutoreleasedReturnValue();

  if (v160)
  {
    objc_msgSend_lastDisconnectTimestamp(self, v161, v162, v163, v164);
    uint64_t v165 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1864535C8(v165);
    uint64_t v166 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t DisconnectReason = objc_msgSend_lastDisconnectReason(self, v167, v168, v169, v170);
    objc_msgSend_appendFormat_(v6, v172, (uint64_t)@"disassoc=%@ (%d), ", v173, v174, v166, DisconnectReason);
  }

  objc_msgSend_wasHiddenBefore(self, v175, v176, v177, v178);
  uint64_t v179 = (void *)objc_claimAutoreleasedReturnValue();

  if (v179)
  {
    objc_msgSend_wasHiddenBefore(self, v180, v181, v182, v183);
    uint64_t v184 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1864535C8(v184);
    uint64_t v185 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v6, v186, (uint64_t)@"wasHiddenBefore=%@", v187, v188, v185);
  }

  if (objc_msgSend_hasSuffix_(v6, v180, (uint64_t)@", ", v182, v183))
  {
    uint64_t v193 = objc_msgSend_length(v6, v189, v190, v191, v192);
    objc_msgSend_deleteCharactersInRange_(v6, v194, v193 - 2, 2, v195);
  }

  return v6;
}

- (NSString)description
{
  int v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend___basicDescription(self, v7, v8, v9, v10);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendString_(v6, v12, (uint64_t)v11, v13, v14);

  objc_msgSend_appendString_(v6, v15, (uint64_t)@", ", v16, v17);
  objc_msgSend___descriptionForBSSListWithLimit_(self, v18, 3, v19, v20);
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendString_(v6, v22, (uint64_t)v21, v23, v24);

  if (objc_msgSend_hasSuffix_(v6, v25, (uint64_t)@", ", v26, v27))
  {
    uint64_t v32 = objc_msgSend_length(v6, v28, v29, v30, v31);
    objc_msgSend_deleteCharactersInRange_(v6, v33, v32 - 2, 2, v34);
  }

  return (NSString *)v6;
}

- (NSString)debugDescription
{
  int v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend___basicDescription(self, v7, v8, v9, v10);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendString_(v6, v12, (uint64_t)v11, v13, v14);

  objc_msgSend_appendString_(v6, v15, (uint64_t)@", ", v16, v17);
  if (objc_msgSend_isEAP(self, v18, v19, v20, v21)
    && objc_msgSend_isSystemMode(self, v22, v23, v24, v25))
  {
    objc_msgSend_appendString_(v6, v22, (uint64_t)@"systemMode=yes, ", v24, v25);
  }

  if (objc_msgSend_transitionDisabledFlags(self, v22, v23, v24, v25))
  {
    uint64_t v30 = objc_msgSend_transitionDisabledFlags(self, v26, v27, v28, v29);
    sub_1864533D4(v30, v31, v32, v33, v34);
    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v6, v36, (uint64_t)@"transitionDisabledFlags=%@, ", v37, v38, v35);
  }

  if (objc_msgSend_movingAttribute(self, v26, v27, v28, v29))
  {
    objc_msgSend___descriptionForMovingAttribute(self, v39, v40, v41, v42);
    uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v6, v44, (uint64_t)@"moving=%@, ", v45, v46, v43);
  }

  if (objc_msgSend_publicAttribute(self, v39, v40, v41, v42))
  {
    objc_msgSend___descriptionForPublicAttribute(self, v47, v48, v49, v50);
    uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v6, v52, (uint64_t)@"public=%@, ", v53, v54, v51);
  }

  if (objc_msgSend_nearbyShareableStatus(self, v47, v48, v49, v50))
  {
    objc_msgSend___descriptionForNearbyShareableStatus(self, v55, v56, v57, v58);
    uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v6, v60, (uint64_t)@"nearbyShareStatus=%@, ", v61, v62, v59);
  }

  if ((objc_msgSend_isPrivacyProxyEnabled(self, v55, v56, v57, v58) & 1) == 0) {
    objc_msgSend_appendString_(v6, v63, (uint64_t)@"privacyProxy=no, ", v65, v66);
  }
  objc_msgSend_networkDisabledUntilDate(self, v67, v68, v69, v70);
  uint64_t v71 = (void *)objc_claimAutoreleasedReturnValue();

  if (v71)
  {
    objc_msgSend_networkDisabledUntilDate(self, v72, v73, v74, v75);
    uint64_t v76 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1864535C8(v76);
    uint64_t v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v6, v78, (uint64_t)@"networkDisabledUntilDate=%@, ", v79, v80, v77);
  }

  objc_msgSend_passpointAccountName(self, v85, v86, v87, v88);
  uint64_t v89 = (void *)objc_claimAutoreleasedReturnValue();

  if (v89)
  {
    objc_msgSend_passpointAccountName(self, v90, v91, v92, v93);
    uint64_t v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v6, v95, (uint64_t)@"passpointAccountName=%@, ", v96, v97, v94);
  }

  if (objc_msgSend_popularityScore(self, v130, v131, v132, v133))
  {
    uint64_t v138 = objc_msgSend_popularityScore(self, v134, v135, v136, v137);
    objc_msgSend_appendFormat_(v6, v139, (uint64_t)@"popularityScore=%lu, ", v140, v141, v138);
  }

  if (objc_msgSend_qualityScore(self, v134, v135, v136, v137))
  {
    uint64_t v146 = objc_msgSend_qualityScore(self, v142, v143, v144, v145);
    objc_msgSend_appendFormat_(v6, v147, (uint64_t)@"qualityScore=%lu, ", v148, v149, v146);
  }

  if (objc_msgSend_totalNetworkUsage(self, v142, v143, v144, v145))
  {
    uint64_t v154 = objc_msgSend_totalNetworkUsage(self, v150, v151, v152, v153);
    objc_msgSend_appendFormat_(v6, v155, (uint64_t)@"totalNetworkUsage=%lu, ", v156, v157, v154);
  }

  objc_msgSend_expirationDate(self, v150, v151, v152, v153);
  uint64_t v158 = (void *)objc_claimAutoreleasedReturnValue();

  if (v158)
  {
    objc_msgSend_expirationDate(self, v159, v160, v161, v162);
    uint64_t v163 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1864535C8(v163);
    uint64_t v164 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v6, v165, (uint64_t)@"expirationDate=%@, ", v166, v167, v164);
  }

  objc_msgSend_lastHomeForceFixDate(self, v159, v160, v161, v162);
  uint64_t v168 = (void *)objc_claimAutoreleasedReturnValue();

  if (v168)
  {
    objc_msgSend_lastHomeForceFixDate(self, v169, v170, v171, v172);
    uint64_t v173 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1864535C8(v173);
    uint64_t v174 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v6, v175, (uint64_t)@"lastHomeForceFixDate=%@, ", v176, v177, v174);
  }

  if (objc_msgSend_locationOfInterest(self, v169, v170, v171, v172))
  {
    uint64_t v182 = objc_msgSend_locationOfInterest(self, v178, v179, v180, v181);
    objc_msgSend_appendFormat_(v6, v183, (uint64_t)@"locationOfInterest=%lu, ", v184, v185, v182);
  }

  if (objc_msgSend_networkOfInterestHomeState(self, v178, v179, v180, v181)) {
    objc_msgSend_appendString_(v6, v186, (uint64_t)@"networkOfInterestHomeState=yes, ", v188, v189);
  }
  if (objc_msgSend_networkOfInterestWorkState(self, v186, v187, v188, v189)) {
    objc_msgSend_appendString_(v6, v190, (uint64_t)@"networkOfInterestWorkState=yes, ", v192, v193);
  }
  if (objc_msgSend_ssidHarvestStatus(self, v190, v191, v192, v193))
  {
    uint64_t v198 = objc_msgSend_ssidHarvestStatus(self, v194, v195, v196, v197);
    objc_msgSend_appendFormat_(v6, v199, (uint64_t)@"ssidHarvestStatus=%lu, ", v200, v201, v198);
  }

  objc_msgSend_walletIdentifier(self, v194, v195, v196, v197);
  uint64_t v202 = (void *)objc_claimAutoreleasedReturnValue();

  if (v202)
  {
    objc_msgSend_walletIdentifier(self, v203, v204, v205, v206);
    v207 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v6, v208, (uint64_t)@"walletIdentifier=%@, ", v209, v210, v207);
  }

  objc_msgSend_OTASystemInfoBeaconProbeList(self, v203, v204, v205, v206);
  uint64_t v211 = (void *)objc_claimAutoreleasedReturnValue();

  if (v211)
  {
    objc_msgSend_OTASystemInfoBeaconProbeList(self, v212, v213, v214, v215);
    v216 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v6, v217, (uint64_t)@"OTASystemInfoBeaconProbeList=%@, ", v218, v219, v216);
  }

  objc_msgSend_SIMIdentifiers(self, v212, v213, v214, v215);
  uint64_t v220 = (void *)objc_claimAutoreleasedReturnValue();

  if (v220)
  {
    objc_msgSend_SIMIdentifiers(self, v221, v222, v223, v224);
    v225 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v6, v226, (uint64_t)@"SIMIdentifiers=%@, ", v227, v228, v225);
  }

  objc_msgSend_networkQualityResponsiveness(self, v221, v222, v223, v224);
  if (v233 > 0.0)
  {
    objc_msgSend_networkQualityResponsiveness(self, v229, v230, v231, v232);
    objc_msgSend_appendFormat_(v6, v234, (uint64_t)@"networkQualityResponsiveness=%f, ", v235, v236, v237);
  }

  objc_msgSend_networkQualityDate(self, v229, v230, v231, v232);
  uint64_t v238 = (void *)objc_claimAutoreleasedReturnValue();

  if (v238)
  {
    objc_msgSend_networkQualityDate(self, v239, v240, v241, v242);
    v243 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1864535C8(v243);
    uint64_t v244 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v6, v245, (uint64_t)@"networkQualityDate=%@, ", v246, v247, v244);
  }

  objc_msgSend___descriptionForBSSListWithLimit_(self, v248, -1, v249, v250);
  uint64_t v251 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendString_(v6, v252, (uint64_t)v251, v253, v254);

  if (objc_msgSend_hasSuffix_(v6, v255, (uint64_t)@", ", v256, v257))
  {
    uint64_t v262 = objc_msgSend_length(v6, v258, v259, v260, v261);
    objc_msgSend_deleteCharactersInRange_(v6, v263, v262 - 2, 2, v264);
  }

  id v265 = v6;

  return (NSString *)v265;
}

- (BOOL)isEqualToNetworkProfile:(id)a3
{
  id v5 = a3;
  objc_msgSend_SSID(self, v6, v7, v8, v9);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_SSID(v5, v11, v12, v13, v14);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 != v19)
  {
    objc_msgSend_SSID(self, v15, v16, v17, v18);
    uint64_t v108 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v108)
    {
      char isEqual = 0;
      goto LABEL_32;
    }

    objc_msgSend_SSID(v5, v20, v21, v22, v23);
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v28)
    {
      char isEqual = 0;
LABEL_31:

      goto LABEL_32;
    }

    objc_msgSend_SSID(self, v24, v25, v26, v27);
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_SSID(v5, v30, v31, v32, v33);
    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_isEqual_(v29, v35, (uint64_t)v34, v36, v37))
    {
      char isEqual = 0;
LABEL_30:

      goto LABEL_31;
    }

    uint64_t v105 = v34;
    uint64_t v106 = v29;
    uint64_t v107 = v28;
  }

  objc_msgSend_domainName(self, v15, v16, v17, v18);
  uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_domainName(v5, v39, v40, v41, v42);
  uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue();
  if (v38 != v47)
  {
    uint64_t v48 = objc_msgSend_domainName(self, v43, v44, v45, v46);
    if (v48)
    {
      uint64_t v53 = (void *)v48;
      objc_msgSend_domainName(v5, v49, v50, v51, v52);
      uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue();
      if (v58)
      {
        objc_msgSend_domainName(self, v54, v55, v56, v57);
        uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_domainName(v5, v59, v60, v61, v62);
        uint64_t v63 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_isEqual_(v3, v64, (uint64_t)v63, v65, v66))
        {
          uint64_t v101 = v63;
          uint64_t v102 = v58;
          uint64_t v103 = v53;
          goto LABEL_12;
        }
      }
    }

    char isEqual = 0;
    goto LABEL_29;
  }

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (CWFNetworkProfile *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    char isEqualToNetworkProfile = 1;
  }

  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char isEqualToNetworkProfile = objc_msgSend_isEqualToNetworkProfile_(self, v6, (uint64_t)v5, v7, v8);
  }

  else
  {
    char isEqualToNetworkProfile = 0;
  }

  return isEqualToNetworkProfile;
}

- (unint64_t)hash
{
  int v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = objc_msgSend_hash(v6, v7, v8, v9, v10);
  objc_msgSend_domainName(self, v12, v13, v14, v15);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v21 = objc_msgSend_hash(v16, v17, v18, v19, v20) ^ v11;
  objc_msgSend_internal(self, v22, v23, v24, v25);
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v31 = v21 ^ objc_msgSend_hash(v26, v27, v28, v29, v30);

  return v31;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v6 = (void *)objc_msgSend_allocWithZone_(CWFNetworkProfile, a2, (uint64_t)a3, v3, v4);
  uint64_t v11 = (void *)objc_msgSend_init(v6, v7, v8, v9, v10);
  uint64_t v16 = (void *)objc_msgSend_mutableCopy(self->_internal, v12, v13, v14, v15);
  objc_msgSend_setInternal_(v11, v17, (uint64_t)v16, v18, v19);

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (CWFNetworkProfile)initWithCoder:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___CWFNetworkProfile;
  id v5 = -[CWFNetworkProfile init](&v29, sel_init);
  if (v5)
  {
    int v6 = (void *)MEMORY[0x189604010];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    objc_msgSend_setWithObjects_(v6, v15, v7, v16, v17, v8, v9, v10, v11, v12, v13, v14, 0);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v19, (uint64_t)v18, (uint64_t)@"_internal", v20);
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v26 = objc_msgSend_mutableCopy(v21, v22, v23, v24, v25);
    internal = v5->_internal;
    v5->_internal = (NSMutableDictionary *)v26;
  }

  return v5;
}

- (NSMutableDictionary)internal
{
  return self->_internal;
}

- (void)setInternal:(id)a3
{
}

- (BOOL)useCachedIdentifier
{
  return self->_useCachedIdentifier;
}

- (void)setUseCachedIdentifier:(BOOL)a3
{
  self->_useCachedIdentifier = a3;
}

- (NSString)cachedIdentifier
{
  return self->_cachedIdentifier;
}

- (void)setCachedIdentifier:(id)a3
{
}

- (BOOL)useCachedNetworkName
{
  return self->_useCachedNetworkName;
}

- (void)setUseCachedNetworkName:(BOOL)a3
{
  self->_useCachedNetworkName = a3;
}

- (NSString)cachedNetworkName
{
  return self->_cachedNetworkName;
}

- (void)setCachedNetworkName:(id)a3
{
}

- (BOOL)useCachedShortSSID
{
  return self->_useCachedShortSSID;
}

- (void)setUseCachedShortSSID:(BOOL)a3
{
  self->_useCachedShortSSID = a3;
}

- (unint64_t)cachedShortSSID
{
  return self->_cachedShortSSID;
}

- (void)setCachedShortSSID:(unint64_t)a3
{
  self->_cachedShortSSID = a3;
}

- (void).cxx_destruct
{
}

- (BOOL)_shouldDisplayDeviceNames
{
  return (objc_msgSend_isOpen(self, a2, v2, v3, v4) & 1) == 0
      && objc_msgSend_publicAttribute(self, v6, v7, v8, v9) != 1
      && (objc_msgSend_isPublicAirPlayNetwork(self, v10, v11, v12, v13) & 1) == 0
      && (objc_msgSend_isEAP(self, v14, v15, v16, v17) & 1) == 0
      && objc_msgSend_addReason(self, v18, v19, v20, v21) != 10;
}

- (id)_location
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  objc_msgSend_BSSList(self, a2, v2, v3, v4, 0);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = (void *)objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v17, (uint64_t)v21, 16);
  if (v11)
  {
    uint64_t v12 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0LL; i != v11; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v5);
        }
        uint64_t v14 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        objc_msgSend_location(v14, v7, v8, v9, v10);
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend_location(v14, v7, v8, v9, v10);
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }

      uint64_t v11 = (void *)objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v7, (uint64_t)&v17, (uint64_t)v21, 16);
      if (v11) {
        continue;
      }
      break;
    }
  }

- (BOOL)_isHomeNetwork
{
  if (objc_msgSend_networkOfInterestHomeState(self, a2, v2, v3, v4) == 1) {
    return 1;
  }
  objc_msgSend_OSSpecificAttributes(self, v6, v7, v8, v9);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v11, v12, (uint64_t)@"NetworkOfInterestHomeState", v13, v14);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_integerValue(v15, v16, v17, v18, v19) == 1)
  {
    BOOL v10 = 1;
  }

  else
  {
    objc_msgSend_OSSpecificAttributes(self, v20, v21, v22, v23);
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v24, v25, (uint64_t)@"NetworkAtLocationOfInterestType", v26, v27);
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_integerValue(v28, v29, v30, v31, v32) == 2)
    {
      BOOL v10 = 1;
    }

    else
    {
      objc_msgSend_OSSpecificAttributes(self, v33, v34, v35, v36);
      uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v37, v38, (uint64_t)@"NetworkAtLocationOfInterestType", v39, v40);
      uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v10 = objc_msgSend_integerValue(v41, v42, v43, v44, v45) == 4;
    }
  }

  return v10;
}

@end