@interface CBDevice
+ (BOOL)supportsSecureCoding;
- ($F6EBB11256A2F6C4B9D2EC026D0EABA8)callMgmtMsg;
- ($F9CA75CC5B4E604BACB273E5A2091FCB)changedTypesInternalPtr;
- ($F9CA75CC5B4E604BACB273E5A2091FCB)discoveryTypesInternalPtr;
- (BOOL)changedTypesContainCBDiscovery:(id)a3;
- (BOOL)changedTypesContainTypes:(id *)a3;
- (BOOL)changedTypesNeedsIdentify;
- (BOOL)decryptNearbyInfoV2PayloadPtr:(const char *)a3 payloadLength:(unint64_t)a4 key:(const char *)a5 keyLength:(unint64_t)a6 decryptedPtr:(void *)a7;
- (BOOL)discoveryTypesContainCBDiscovery:(id)a3;
- (BOOL)discoveryTypesContainType:(int)a3;
- (BOOL)discoveryTypesContainTypes:(id *)a3;
- (BOOL)enableEPAForLEAdvertisement;
- (BOOL)isEquivalentToCBDevice:(id)a3 compareFlags:(unsigned int)a4;
- (CBControllerInfo)controllerInfo;
- (CBDevice)initWithCoder:(id)a3;
- (CBDevice)initWithDictionary:(id)a3 error:(id *)a4;
- (CBDevice)initWithXPCEventRepresentation:(id)a3 error:(id *)a4;
- (CBDevice)initWithXPCObject:(id)a3 error:(id *)a4;
- (NSArray)spatialInteractionIdentifiers;
- (NSArray)tipiDevices;
- (NSData)airdropTempAuthTagData;
- (NSData)airplaySourceAuthTagData;
- (NSData)airplaySourceUWBConfigData;
- (NSData)bleAddressData;
- (NSData)bleAdvertisementData;
- (NSData)bleAppleManufacturerData;
- (NSData)btAddressData;
- (NSData)dockKitAccessoryPayloadData;
- (NSData)fidoPayloadData;
- (NSData)gfpPayloadData;
- (NSData)homeKitV1DeviceIDData;
- (NSData)homeKitV2AccessoryIDData;
- (NSData)homeKitV2AuthTagData;
- (NSData)irkData;
- (NSData)linkKeyData;
- (NSData)ltkData;
- (NSData)mspAddressData;
- (NSData)nearbyActionAuthTag;
- (NSData)nearbyActionExtraData;
- (NSData)nearbyActionNoWakeAuthTagData;
- (NSData)nearbyActionNoWakeConfigData;
- (NSData)nearbyActionTargetAuthTag;
- (NSData)nearbyActionV2TargetData;
- (NSData)nearbyAuthTag;
- (NSData)nearbyInfoAuthTag;
- (NSData)nearbyInfoV2AuthIntegrityTagData;
- (NSData)nearbyInfoV2AuthTagData;
- (NSData)nearbyInfoV2EncryptedData;
- (NSData)nearbyInfoV2TempAuthTagData;
- (NSData)objectDiscoveryNearOwnerID;
- (NSData)objectDiscoveryPublicKeyData;
- (NSData)proximityServiceClassicAddress;
- (NSData)proximityServiceData;
- (NSData)proximityServiceSetupHash;
- (NSData)safetyAlertsAlertData;
- (NSData)safetyAlertsAlertID;
- (NSData)safetyAlertsSegmentAlertData;
- (NSData)safetyAlertsSegmentServiceData;
- (NSData)safetyAlertsSegmentSignature;
- (NSData)safetyAlertsSignature;
- (NSData)spatialInteractionPresenceConfigData;
- (NSData)spatialInteractionTokenData;
- (NSData)spatialInteractionUWBConfigData;
- (NSData)txAddressData;
- (NSData)watchSetupData;
- (NSDictionary)spatialInteractionUserInfo;
- (NSMutableArray)spatialInteractionDeviceTimestampArrayClientIDs;
- (NSMutableDictionary)deviceInfo;
- (NSMutableDictionary)spatialInteractionDeviceTimestampArrayDictionary;
- (NSString)accountID;
- (NSString)btVersion;
- (NSString)caseVersion;
- (NSString)contactID;
- (NSString)findMyCaseIdentifier;
- (NSString)findMyGroupIdentifier;
- (NSString)firmwareVersion;
- (NSString)identifier;
- (NSString)idsDeviceID;
- (NSString)leAdvName;
- (NSString)model;
- (NSString)modelUser;
- (NSString)mspDisplayName;
- (NSString)name;
- (NSString)objectSetupFontCode;
- (NSString)objectSetupMessage;
- (NSString)productName;
- (NSString)remoteHostID;
- (NSString)serialNumber;
- (NSString)serialNumberLeft;
- (NSString)serialNumberRight;
- (NSString)stableIdentifier;
- (OS_xpc_object)xpcEventRepresentation;
- (char)classicRSSI;
- (char)doubleTapActionLeft;
- (char)doubleTapActionRight;
- (char)doubleTapCapability;
- (char)dsActionMeasuredPower;
- (char)hearingAidSupport;
- (char)hearingTestSupport;
- (char)microphoneMode;
- (char)placementMode;
- (char)proximityServiceMeasuredPower;
- (char)rssi;
- (char)smartRoutingMode;
- (double)accessoryStatusOBCTime;
- (double)bleAdvertisementTimestamp;
- (double)nearbyInfoStatusProgress;
- (float)batteryLevelCase;
- (float)batteryLevelLeft;
- (float)batteryLevelMain;
- (float)batteryLevelRight;
- (id)bleAdvertisementTimestampString;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (id)dictionaryRepresentation;
- (id)getSpatialInteractionDeviceTimestampArrayForClientID:(id)a3;
- (int)audioStreamState;
- (int)bleChannel;
- (int)bleRSSI;
- (int)listeningMode;
- (int)primaryPlacement;
- (int)proximityPairingPrimaryPlacement;
- (int)proximityPairingSecondaryPlacement;
- (int)secondaryPlacement;
- (int)spatialAudioMode;
- (unint64_t)bleAdvertisementTimestampMachContinuous;
- (unint64_t)changeFlags;
- (unint64_t)deviceFlags;
- (unint64_t)discoveryFlags;
- (unint64_t)homeKitV2Value;
- (unint64_t)lastSeenTicks;
- (unint64_t)oldDiscoveryFlags;
- (unint64_t)removeInternalFlags:(unsigned int)a3;
- (unint64_t)updateWithCBDevice:(id)a3;
- (unint64_t)updateWithPowerSourceDescription:(id)a3;
- (unsigned)accessoryStatusFlags;
- (unsigned)accessoryStatusLidOpenCount;
- (unsigned)adaptiveVolumeCapability;
- (unsigned)adaptiveVolumeConfig;
- (unsigned)airdropConfigData;
- (unsigned)airdropFlags;
- (unsigned)airdropHash1;
- (unsigned)airdropHash2;
- (unsigned)airdropHash3;
- (unsigned)airdropHash4;
- (unsigned)airdropModel;
- (unsigned)airdropVersion;
- (unsigned)airplaySourceFlags;
- (unsigned)airplayTargetConfigSeed;
- (unsigned)airplayTargetFlags;
- (unsigned)airplayTargetIPv4;
- (unsigned)airplayTargetPort;
- (unsigned)appearanceValue;
- (unsigned)attributeInternalFlags;
- (unsigned)autoAncCapability;
- (unsigned)batteryInfoCase;
- (unsigned)batteryInfoLeft;
- (unsigned)batteryInfoMain;
- (unsigned)batteryInfoRight;
- (unsigned)batteryStateCase;
- (unsigned)batteryStateLeft;
- (unsigned)batteryStateMain;
- (unsigned)batteryStateRight;
- (unsigned)clickHoldModeLeft;
- (unsigned)clickHoldModeRight;
- (unsigned)colorCodeBest;
- (unsigned)colorFlags;
- (unsigned)colorInfo;
- (unsigned)connectedServices;
- (unsigned)conversationDetectCapability;
- (unsigned)conversationDetectConfig;
- (unsigned)crownRotationDirection;
- (unsigned)deviceType;
- (unsigned)dsActionFlags;
- (unsigned)dsActionTieBreaker;
- (unsigned)dsInfoVehicleConfidence;
- (unsigned)dsInfoVehicleState;
- (unsigned)endCallCapability;
- (unsigned)endCallConfig;
- (unsigned)frequencyBand;
- (unsigned)gapaFlags;
- (unsigned)gfpModelID;
- (unsigned)heySiriConfidence;
- (unsigned)heySiriDeviceClass;
- (unsigned)heySiriPerceptualHash;
- (unsigned)heySiriProductType;
- (unsigned)heySiriRandom;
- (unsigned)heySiriSNR;
- (unsigned)homeKitV1Category;
- (unsigned)homeKitV1CompatibleVersion;
- (unsigned)homeKitV1ConfigurationNumber;
- (unsigned)homeKitV1Flags;
- (unsigned)homeKitV1SetupHash;
- (unsigned)homeKitV1StateNumber;
- (unsigned)homeKitV2InstanceID;
- (unsigned)homeKitV2StateNumber;
- (unsigned)internalFlags;
- (unsigned)interval;
- (unsigned)leaVersion;
- (unsigned)listeningModeConfigs;
- (unsigned)mspDeviceClass;
- (unsigned)mspSubScenario;
- (unsigned)muteControlCapability;
- (unsigned)muteControlConfig;
- (unsigned)nearbyActionColorCode;
- (unsigned)nearbyActionDeviceClass;
- (unsigned)nearbyActionFlags;
- (unsigned)nearbyActionNWPrecisionFindingStatus;
- (unsigned)nearbyActionNoWakeType;
- (unsigned)nearbyActionType;
- (unsigned)nearbyActionV2Flags;
- (unsigned)nearbyActionV2Type;
- (unsigned)nearbyActivityLevel;
- (unsigned)nearbyInfoFlags;
- (unsigned)nearbyInfoStatusTime;
- (unsigned)nearbyInfoStatusType;
- (unsigned)nearbyInfoV2DecryptedFlags;
- (unsigned)nearbyInfoV2EncryptedFlags;
- (unsigned)nearbyInfoV2Flags;
- (unsigned)nearbyInfoV2InvitationCounter;
- (unsigned)nearbyInfoV2InvitationRouteType;
- (unsigned)nearbyInfoV2InvitationTypes;
- (unsigned)objectDiscoveryBatteryState;
- (unsigned)objectDiscoveryMode;
- (unsigned)objectDiscoveryProductID;
- (unsigned)objectSetupBatteryPerformance;
- (unsigned)objectSetupBatteryState;
- (unsigned)objectSetupColorCode;
- (unsigned)objectSetupFlags;
- (unsigned)peerStatusFlag;
- (unsigned)primaryBudSide;
- (unsigned)productID;
- (unsigned)proximityPairingOtherBudProductID;
- (unsigned)proximityPairingProductID;
- (unsigned)proximityPairingSubType;
- (unsigned)proximityServiceCategory;
- (unsigned)proximityServiceFlags;
- (unsigned)proximityServicePSM;
- (unsigned)proximityServiceProductID;
- (unsigned)proximityServiceSubType;
- (unsigned)proximityServiceVendorID;
- (unsigned)proximityServiceVersion;
- (unsigned)safetyAlertsAlertIndex;
- (unsigned)safetyAlertsSegmentSegmentNumber;
- (unsigned)safetyAlertsSegmentSegmentsTotal;
- (unsigned)safetyAlertsVersion;
- (unsigned)selectiveSpeechListeningCapability;
- (unsigned)selectiveSpeechListeningConfig;
- (unsigned)spatialInteractionConfigFlags;
- (unsigned)spatialInteractionFlags;
- (unsigned)spatialInteractionPeerID;
- (unsigned)spatialInteractionUWBTokenFlags;
- (unsigned)supportedServices;
- (unsigned)tipiConnectionStatus;
- (unsigned)tipiState;
- (unsigned)transmitPowerOne;
- (unsigned)transmitPowerThree;
- (unsigned)transmitPowerTwo;
- (unsigned)vendorID;
- (unsigned)vendorIDSource;
- (void)_clearUnparsedProperties;
- (void)_parseAirDropPtr:(const char *)a3 end:(const char *)a4;
- (void)_parseAirPlaySourcePtr:(const char *)a3 end:(const char *)a4;
- (void)_parseAirPlayTargetPtr:(const char *)a3 end:(const char *)a4;
- (void)_parseAppleManufacturerPtr:(const char *)a3 end:(const char *)a4;
- (void)_parseDSInfoPtr:(const char *)a3 end:(const char *)a4;
- (void)_parseHeySiriPtr:(const char *)a3 end:(const char *)a4;
- (void)_parseHomeKitV1Ptr:(const char *)a3 end:(const char *)a4;
- (void)_parseHomeKitV2Ptr:(const char *)a3 end:(const char *)a4;
- (void)_parseManufacturerPtr:(const char *)a3 end:(const char *)a4;
- (void)_parseMicrosoftManufacturerPtr:(const char *)a3 end:(const char *)a4;
- (void)_parseMicrosoftSwiftPairPtr:(const char *)a3 end:(const char *)a4;
- (void)_parseNearbyActionNoWakePtr:(const char *)a3 end:(const char *)a4;
- (void)_parseNearbyActionPtr:(const char *)a3 end:(const char *)a4;
- (void)_parseNearbyActionV2Ptr:(const char *)a3 end:(const char *)a4;
- (void)_parseNearbyInfoPtr:(const char *)a3 end:(const char *)a4;
- (void)_parseNearbyInfoV2Ptr:(const char *)a3 end:(const char *)a4;
- (void)_parseObjectDiscoveryPtr:(const char *)a3 end:(const char *)a4;
- (void)_parseProximityPairingAccessoryStatusPtr:(const char *)a3 end:(const char *)a4;
- (void)_parseProximityPairingAirPodsMismatchedPtr:(const char *)a3 end:(const char *)a4;
- (void)_parseProximityPairingFindMyAccessoryStatusPtr:(const char *)a3 end:(const char *)a4;
- (void)_parseProximityPairingObjectSetupPtr:(const char *)a3 end:(const char *)a4;
- (void)_parseProximityPairingObjectSetupPtrV2:(const char *)a3 end:(const char *)a4;
- (void)_parseProximityPairingPtr:(const char *)a3 end:(const char *)a4;
- (void)_parseProximityPairingV2Ptr:(const char *)a3 end:(const char *)a4;
- (void)_parseProximityPairingWxSetupPtr:(const char *)a3 end:(const char *)a4;
- (void)_parseProximityPairingWxStatusPtr:(const char *)a3 end:(const char *)a4;
- (void)_parseProximityServiceData:(id)a3;
- (void)_parseProximityServiceHomeKitSetupPtr:(const char *)a3 end:(const char *)a4;
- (void)_parseProximityServiceWatchSetupPtr:(const char *)a3 end:(const char *)a4;
- (void)_parseSafetyAlertsSegmentServiceData:(id)a3;
- (void)_parseSpatialInteractionPtr:(const char *)a3 end:(const char *)a4;
- (void)_parseStatusOne:(unsigned __int8)a3 deviceFlags:(unint64_t *)a4 primaryPlacement:(int *)a5 secondaryPlacement:(int *)a6;
- (void)_setDeviceInfoKey:(id)a3 value:(id)a4;
- (void)changedTypesRemoveAll;
- (void)decryptApplePayloadWithIdentity:(id)a3 forType:(unsigned __int8)a4 error:(id *)a5;
- (void)decryptNearbyInfoV2PayloadWithIdentity:(id)a3 error:(id *)a4;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCObject:(id)a3;
- (void)resetNearbyInfoV2SensitiveProperties;
- (void)setAccessoryStatusFlags:(unsigned int)a3;
- (void)setAccessoryStatusLidOpenCount:(unsigned __int8)a3;
- (void)setAccessoryStatusOBCTime:(double)a3;
- (void)setAccountID:(id)a3;
- (void)setAdaptiveVolumeCapability:(unsigned __int8)a3;
- (void)setAdaptiveVolumeConfig:(unsigned __int8)a3;
- (void)setAirdropConfigData:(unsigned __int8)a3;
- (void)setAirdropFlags:(unsigned __int8)a3;
- (void)setAirdropHash1:(unsigned __int16)a3;
- (void)setAirdropHash2:(unsigned __int16)a3;
- (void)setAirdropHash3:(unsigned __int16)a3;
- (void)setAirdropHash4:(unsigned __int16)a3;
- (void)setAirdropModel:(unsigned __int8)a3;
- (void)setAirdropTempAuthTagData:(id)a3;
- (void)setAirdropVersion:(unsigned __int8)a3;
- (void)setAirplaySourceAuthTagData:(id)a3;
- (void)setAirplaySourceFlags:(unsigned __int8)a3;
- (void)setAirplaySourceUWBConfigData:(id)a3;
- (void)setAirplayTargetConfigSeed:(unsigned __int8)a3;
- (void)setAirplayTargetFlags:(unsigned __int8)a3;
- (void)setAirplayTargetIPv4:(unsigned int)a3;
- (void)setAirplayTargetPort:(unsigned __int16)a3;
- (void)setAppearanceValue:(unsigned int)a3;
- (void)setAttributeInternalFlags:(unsigned int)a3;
- (void)setAudioStreamState:(int)a3;
- (void)setAutoAncCapability:(unsigned __int8)a3;
- (void)setBatteryInfoCase:(unsigned __int16)a3;
- (void)setBatteryInfoLeft:(unsigned __int16)a3;
- (void)setBatteryInfoMain:(unsigned __int16)a3;
- (void)setBatteryInfoRight:(unsigned __int16)a3;
- (void)setBleAddressData:(id)a3;
- (void)setBleAdvertisementData:(id)a3;
- (void)setBleAdvertisementTimestamp:(double)a3;
- (void)setBleAdvertisementTimestampMachContinuous:(unint64_t)a3;
- (void)setBleAppleManufacturerData:(id)a3;
- (void)setBleChannel:(int)a3;
- (void)setBleRSSI:(int)a3;
- (void)setBtAddressData:(id)a3;
- (void)setBtVersion:(id)a3;
- (void)setCallMgmtMsg:(id)a3;
- (void)setCaseVersion:(id)a3;
- (void)setChangeFlags:(unint64_t)a3;
- (void)setClassicRSSI:(char)a3;
- (void)setClickHoldModeLeft:(unsigned __int8)a3;
- (void)setClickHoldModeRight:(unsigned __int8)a3;
- (void)setColorInfo:(unsigned __int16)a3;
- (void)setConnectedServices:(unsigned int)a3;
- (void)setContactID:(id)a3;
- (void)setControllerInfo:(id)a3;
- (void)setConversationDetectCapability:(unsigned __int8)a3;
- (void)setConversationDetectConfig:(unsigned __int8)a3;
- (void)setCrownRotationDirection:(unsigned __int8)a3;
- (void)setDeviceFlags:(unint64_t)a3;
- (void)setDeviceInfo:(id)a3;
- (void)setDeviceType:(unsigned __int8)a3;
- (void)setDiscoveryFlags:(unint64_t)a3;
- (void)setDockKitAccessoryPayloadData:(id)a3;
- (void)setDoubleTapActionLeft:(char)a3;
- (void)setDoubleTapActionRight:(char)a3;
- (void)setDoubleTapCapability:(char)a3;
- (void)setDsActionFlags:(unsigned __int8)a3;
- (void)setDsActionMeasuredPower:(char)a3;
- (void)setDsActionTieBreaker:(unsigned __int8)a3;
- (void)setDsInfoVehicleConfidence:(unsigned __int8)a3;
- (void)setDsInfoVehicleState:(unsigned __int8)a3;
- (void)setEnableEPAForLEAdvertisement:(BOOL)a3;
- (void)setEndCallCapability:(unsigned __int8)a3;
- (void)setEndCallConfig:(unsigned __int8)a3;
- (void)setFidoPayloadData:(id)a3;
- (void)setFindMyCaseIdentifier:(id)a3;
- (void)setFindMyGroupIdentifier:(id)a3;
- (void)setFirmwareVersion:(id)a3;
- (void)setFrequencyBand:(unsigned __int8)a3;
- (void)setGapaFlags:(unsigned int)a3;
- (void)setGfpModelID:(unsigned int)a3;
- (void)setGfpPayloadData:(id)a3;
- (void)setHearingAidSupport:(char)a3;
- (void)setHearingTestSupport:(char)a3;
- (void)setHeySiriConfidence:(unsigned __int8)a3;
- (void)setHeySiriDeviceClass:(unsigned __int16)a3;
- (void)setHeySiriPerceptualHash:(unsigned __int16)a3;
- (void)setHeySiriProductType:(unsigned __int8)a3;
- (void)setHeySiriRandom:(unsigned __int8)a3;
- (void)setHeySiriSNR:(unsigned __int8)a3;
- (void)setHomeKitV1Category:(unsigned __int16)a3;
- (void)setHomeKitV1CompatibleVersion:(unsigned __int8)a3;
- (void)setHomeKitV1ConfigurationNumber:(unsigned __int8)a3;
- (void)setHomeKitV1DeviceIDData:(id)a3;
- (void)setHomeKitV1Flags:(unsigned __int8)a3;
- (void)setHomeKitV1SetupHash:(unsigned int)a3;
- (void)setHomeKitV1StateNumber:(unsigned __int16)a3;
- (void)setHomeKitV2AccessoryIDData:(id)a3;
- (void)setHomeKitV2AuthTagData:(id)a3;
- (void)setHomeKitV2InstanceID:(unsigned __int16)a3;
- (void)setHomeKitV2StateNumber:(unsigned __int16)a3;
- (void)setHomeKitV2Value:(unint64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setIdsDeviceID:(id)a3;
- (void)setInternalFlags:(unsigned int)a3;
- (void)setInterval:(unsigned __int16)a3;
- (void)setIrkData:(id)a3;
- (void)setLastSeenTicks:(unint64_t)a3;
- (void)setLeAdvName:(id)a3;
- (void)setLeaVersion:(unsigned __int8 *)a3;
- (void)setLinkKeyData:(id)a3;
- (void)setListeningMode:(int)a3;
- (void)setListeningModeConfigs:(unsigned int)a3;
- (void)setLtkData:(id)a3;
- (void)setMicrophoneMode:(char)a3;
- (void)setModel:(id)a3;
- (void)setModelUser:(id)a3;
- (void)setMspAddressData:(id)a3;
- (void)setMspDeviceClass:(unsigned int)a3;
- (void)setMspDisplayName:(id)a3;
- (void)setMspSubScenario:(unsigned __int8)a3;
- (void)setMuteControlCapability:(unsigned __int8)a3;
- (void)setMuteControlConfig:(unsigned __int8)a3;
- (void)setName:(id)a3;
- (void)setNearbyActionAuthTag:(id)a3;
- (void)setNearbyActionColorCode:(unsigned __int8)a3;
- (void)setNearbyActionDeviceClass:(unsigned __int8)a3;
- (void)setNearbyActionExtraData:(id)a3;
- (void)setNearbyActionFlags:(unsigned int)a3;
- (void)setNearbyActionNWPrecisionFindingStatus:(unsigned __int8)a3;
- (void)setNearbyActionNoWakeAuthTagData:(id)a3;
- (void)setNearbyActionNoWakeConfigData:(id)a3;
- (void)setNearbyActionNoWakeType:(unsigned __int8)a3;
- (void)setNearbyActionTargetAuthTag:(id)a3;
- (void)setNearbyActionType:(unsigned __int8)a3;
- (void)setNearbyActionV2Flags:(unsigned int)a3;
- (void)setNearbyActionV2TargetData:(id)a3;
- (void)setNearbyActionV2Type:(unsigned __int8)a3;
- (void)setNearbyAuthTag:(id)a3;
- (void)setNearbyInfoAuthTag:(id)a3;
- (void)setNearbyInfoFlags:(unsigned int)a3;
- (void)setNearbyInfoStatusProgress:(double)a3;
- (void)setNearbyInfoStatusTime:(unsigned __int8)a3;
- (void)setNearbyInfoStatusType:(unsigned __int8)a3;
- (void)setNearbyInfoV2AuthIntegrityTagData:(id)a3;
- (void)setNearbyInfoV2AuthTagData:(id)a3;
- (void)setNearbyInfoV2DecryptedFlags:(unsigned __int8)a3;
- (void)setNearbyInfoV2EncryptedData:(id)a3;
- (void)setNearbyInfoV2EncryptedFlags:(unsigned __int8)a3;
- (void)setNearbyInfoV2Flags:(unsigned __int8)a3;
- (void)setObjectDiscoveryBatteryState:(unsigned __int8)a3;
- (void)setObjectDiscoveryMode:(unsigned __int8)a3;
- (void)setObjectDiscoveryNearOwnerID:(id)a3;
- (void)setObjectDiscoveryProductID:(unsigned int)a3;
- (void)setObjectDiscoveryPublicKeyData:(id)a3;
- (void)setOldDiscoveryFlags:(unint64_t)a3;
- (void)setPeerStatusFlag:(unsigned __int8)a3;
- (void)setPlacementMode:(char)a3;
- (void)setPrimaryBudSide:(unsigned __int8)a3;
- (void)setPrimaryPlacement:(int)a3;
- (void)setProductID:(unsigned int)a3;
- (void)setProductName:(id)a3;
- (void)setProximityPairingOtherBudProductID:(unsigned int)a3;
- (void)setProximityPairingPrimaryPlacement:(int)a3;
- (void)setProximityPairingProductID:(unsigned int)a3;
- (void)setProximityPairingSecondaryPlacement:(int)a3;
- (void)setProximityPairingSubType:(unsigned __int8)a3;
- (void)setProximityServiceCategory:(unsigned __int8)a3;
- (void)setProximityServiceClassicAddress:(id)a3;
- (void)setProximityServiceData:(id)a3;
- (void)setProximityServiceFlags:(unsigned __int8)a3;
- (void)setProximityServiceMeasuredPower:(char)a3;
- (void)setProximityServicePSM:(unsigned __int16)a3;
- (void)setProximityServiceProductID:(unsigned int)a3;
- (void)setProximityServiceSetupHash:(id)a3;
- (void)setProximityServiceSubType:(unsigned __int8)a3;
- (void)setProximityServiceVendorID:(unsigned __int16)a3;
- (void)setProximityServiceVersion:(unsigned __int8)a3;
- (void)setRemoteHostID:(id)a3;
- (void)setSafetyAlertsSegmentAlertData:(id)a3;
- (void)setSafetyAlertsSegmentSegmentNumber:(unsigned __int8)a3;
- (void)setSafetyAlertsSegmentSegmentsTotal:(unsigned __int8)a3;
- (void)setSafetyAlertsSegmentServiceData:(id)a3;
- (void)setSafetyAlertsSegmentSignature:(id)a3;
- (void)setSecondaryPlacement:(int)a3;
- (void)setSelectiveSpeechListeningCapability:(unsigned __int8)a3;
- (void)setSelectiveSpeechListeningConfig:(unsigned __int8)a3;
- (void)setSerialNumber:(id)a3;
- (void)setSerialNumberLeft:(id)a3;
- (void)setSerialNumberRight:(id)a3;
- (void)setSmartRoutingMode:(char)a3;
- (void)setSpatialAudioMode:(int)a3;
- (void)setSpatialInteractionConfigFlags:(unsigned __int8)a3;
- (void)setSpatialInteractionDeviceTimestampArrayClientIDs:(id)a3;
- (void)setSpatialInteractionDeviceTimestampArrayDictionary:(id)a3;
- (void)setSpatialInteractionDeviceTimestampArrayForClientID:(id)a3 clientID:(id)a4;
- (void)setSpatialInteractionFlags:(unsigned __int8)a3;
- (void)setSpatialInteractionIdentifiers:(id)a3;
- (void)setSpatialInteractionPeerID:(unsigned int)a3;
- (void)setSpatialInteractionPresenceConfigData:(id)a3;
- (void)setSpatialInteractionTokenData:(id)a3;
- (void)setSpatialInteractionUWBConfigData:(id)a3;
- (void)setSpatialInteractionUWBTokenFlags:(unsigned int)a3;
- (void)setSpatialInteractionUserInfo:(id)a3;
- (void)setSupportedServices:(unsigned int)a3;
- (void)setTipiConnectionStatus:(unsigned __int8)a3;
- (void)setTipiDevices:(id)a3;
- (void)setTipiState:(unsigned __int8)a3;
- (void)setTransmitPowerOne:(unsigned __int8)a3;
- (void)setTransmitPowerThree:(unsigned __int8)a3;
- (void)setTransmitPowerTwo:(unsigned __int8)a3;
- (void)setTxAddressData:(id)a3;
- (void)setVendorID:(unsigned __int16)a3;
- (void)setVendorIDSource:(unsigned __int8)a3;
- (void)setWatchSetupData:(id)a3;
- (void)updateWithCBDeviceIdentity:(id)a3;
- (void)updateWithRPIdentity:(id)a3;
- (void)updateWithReceivedAuthTag:(id)a3 forType:(unsigned __int8)a4;
- (void)updateWithSafetyAlertsSegments:(id)a3 error:(id *)a4;
@end

@implementation CBDevice

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CBDevice)initWithXPCEventRepresentation:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___CBDevice;
  v13 = -[CBDevice init](&v26, sel_init);
  if (!v13)
  {
    if (a4)
    {
      v22 = "CBDevice super init failed";
LABEL_16:
      CBErrorF(-6756, (uint64_t)v22, v7, v8, v9, v10, v11, v12, v23);
      v20 = 0LL;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }

- (OS_xpc_object)xpcEventRepresentation
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  xpc_object_t v3 = xpc_dictionary_create(0LL, 0LL, 0LL);
  v4 = self->_btAddressData;
  v5 = v4;
  if (v4 && -[NSData length](v4, "length") == 6)
  {
    LOWORD(v10) = 0;
    -[NSData bytes](v5, "bytes", 0LL, 0LL, v10, v11);
    HardwareAddressToCString();
    xpc_dictionary_set_string(v3, "btAddress", (const char *)&v9);
  }

  id v6 = -[NSString UTF8String](self->_identifier, "UTF8String");
  if (v6) {
    xpc_dictionary_set_string(v3, "deviceID", v6);
  }
  unsigned int v7 = -[CBDevice nearbyActionDeviceClass](self, "nearbyActionDeviceClass");
  if (v7) {
    xpc_dictionary_set_int64(v3, "deviceClass", v7);
  }
  return (OS_xpc_object *)v3;
}

- (CBDevice)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v129.receiver = self;
  v129.super_class = (Class)&OBJC_CLASS___CBDevice;
  unsigned int v7 = -[CBDevice init](&v129, sel_init);

  if (!v7)
  {
    if (!a4) {
      goto LABEL_330;
    }
    v125 = "CBDevice super init failed";
LABEL_329:
    CBErrorF(-6756, (uint64_t)v125, v8, v9, v10, v11, v12, v13, v128);
    v123 = 0LL;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_324;
  }

  uint64_t v14 = MEMORY[0x18959FCE0](v6);
  uint64_t v15 = MEMORY[0x1895F9250];
  if (v14 != MEMORY[0x1895F9250])
  {
    if (!a4) {
      goto LABEL_330;
    }
    v125 = "XPC non-dict";
    goto LABEL_329;
  }

  unint64_t v130 = 0LL;
  int v16 = CUXPCDecodeUInt64RangedEx();
  if (v16 == 6)
  {
    v7->_adaptiveVolumeCapability = v130;
  }

  else if (v16 == 5)
  {
    goto LABEL_330;
  }

  unint64_t v130 = 0LL;
  int v17 = CUXPCDecodeSInt64RangedEx();
  if (v17 == 6)
  {
    v7->_audioStreamState = v130;
  }

  else if (v17 == 5)
  {
    goto LABEL_330;
  }

  unint64_t v130 = 0LL;
  int v18 = CUXPCDecodeUInt64RangedEx();
  if (v18 == 6)
  {
    v7->_autoAncCapability = v130;
  }

  else if (v18 == 5)
  {
    goto LABEL_330;
  }

  unint64_t v130 = 0LL;
  int v19 = CUXPCDecodeUInt64RangedEx();
  if (v19 == 6)
  {
    v7->_batteryInfoMain = v130;
  }

  else if (v19 == 5)
  {
    goto LABEL_330;
  }

  unint64_t v130 = 0LL;
  int v20 = CUXPCDecodeUInt64RangedEx();
  if (v20 == 6)
  {
    v7->_batteryInfoLeft = v130;
  }

  else if (v20 == 5)
  {
    goto LABEL_330;
  }

  unint64_t v130 = 0LL;
  int v21 = CUXPCDecodeUInt64RangedEx();
  if (v21 == 6)
  {
    v7->_batteryInfoRight = v130;
  }

  else if (v21 == 5)
  {
    goto LABEL_330;
  }

  unint64_t v130 = 0LL;
  int v22 = CUXPCDecodeUInt64RangedEx();
  if (v22 == 6)
  {
    v7->_batteryInfoCase = v130;
  }

  else if (v22 == 5)
  {
    goto LABEL_330;
  }

  unint64_t v130 = 0LL;
  int v23 = CUXPCDecodeUInt64RangedEx();
  if (v23 == 6)
  {
    v7->_bleAdvertisementTimestampMachContinuous = v130;
  }

  else if (v23 == 5)
  {
    goto LABEL_330;
  }

  unint64_t v130 = 0LL;
  int v24 = CUXPCDecodeSInt64RangedEx();
  if (v24 == 6)
  {
    v7->_bleChannel = v130;
  }

  else if (v24 == 5)
  {
    goto LABEL_330;
  }

  unint64_t v130 = 0LL;
  int v25 = CUXPCDecodeSInt64RangedEx();
  if (v25 == 6)
  {
    v7->_bleRSSI = v130;
  }

  else if (v25 == 5)
  {
    goto LABEL_330;
  }

  unint64_t v130 = 0LL;
  int v26 = CUXPCDecodeUInt64RangedEx();
  if (v26 == 6)
  {
    v7->_changeFlags = v130;
  }

  else if (v26 == 5)
  {
    goto LABEL_330;
  }

  unint64_t v130 = 0LL;
  int v27 = CUXPCDecodeSInt64RangedEx();
  if (v27 == 6)
  {
    v7->_classicRSSI = v130;
  }

  else if (v27 == 5)
  {
    goto LABEL_330;
  }

  unint64_t v130 = 0LL;
  int v28 = CUXPCDecodeUInt64RangedEx();
  if (v28 == 6)
  {
    v7->_colorInfo = v130;
  }

  else if (v28 == 5)
  {
    goto LABEL_330;
  }

  unint64_t v130 = 0LL;
  int v29 = CUXPCDecodeUInt64RangedEx();
  if (v29 == 6)
  {
    v7->_connectedServices = v130;
  }

  else if (v29 == 5)
  {
    goto LABEL_330;
  }

  unint64_t v130 = 0LL;
  int v30 = CUXPCDecodeUInt64RangedEx();
  if (v30 == 6)
  {
    v7->_conversationDetectCapability = v130;
  }

  else if (v30 == 5)
  {
    goto LABEL_330;
  }

  objc_opt_class();
  unint64_t v130 = 0LL;
  int v31 = CUXPCDecodeUInt64RangedEx();
  if (v31 == 6)
  {
    v7->_deviceFlags = v130;
    goto LABEL_60;
  }

  if (v31 == 5)
  {
LABEL_330:
    v123 = 0LL;
    goto LABEL_324;
  }

- (void)encodeWithXPCObject:(id)a3
{
  id v4 = a3;
  accountID = self->_accountID;
  id v6 = v4;
  unsigned int v7 = -[NSString UTF8String](accountID, "UTF8String");
  if (v7) {
    xpc_dictionary_set_string(v6, "acID", v7);
  }

  if (self->_adaptiveVolumeCapability) {
    xpc_dictionary_set_uint64(v6, "avCp", self->_adaptiveVolumeCapability);
  }
  int64_t audioStreamState = self->_audioStreamState;
  if ((_DWORD)audioStreamState) {
    xpc_dictionary_set_int64(v6, "aStS", audioStreamState);
  }
  if (self->_autoAncCapability) {
    xpc_dictionary_set_uint64(v6, "aaCp", self->_autoAncCapability);
  }
  if (self->_batteryInfoMain) {
    xpc_dictionary_set_uint64(v6, "batM", self->_batteryInfoMain);
  }
  if (self->_batteryInfoLeft) {
    xpc_dictionary_set_uint64(v6, "batL", self->_batteryInfoLeft);
  }
  if (self->_batteryInfoRight) {
    xpc_dictionary_set_uint64(v6, "batR", self->_batteryInfoRight);
  }
  if (self->_batteryInfoCase) {
    xpc_dictionary_set_uint64(v6, "batC", self->_batteryInfoCase);
  }
  bleAddressData = self->_bleAddressData;
  if (bleAddressData)
  {
    uint64_t v10 = bleAddressData;
    id v11 = v6;
    uint64_t v12 = -[NSData bytes](v10, "bytes");
    if (v12) {
      uint64_t v13 = (const char *)v12;
    }
    else {
      uint64_t v13 = "";
    }
    size_t v14 = -[NSData length](v10, "length");

    xpc_dictionary_set_data(v11, "blAd", v13, v14);
  }

  double bleAdvertisementTimestamp = self->_bleAdvertisementTimestamp;
  if (bleAdvertisementTimestamp != 0.0) {
    xpc_dictionary_set_double(v6, "blAt", bleAdvertisementTimestamp);
  }
  uint64_t bleAdvertisementTimestampMachContinuous = self->_bleAdvertisementTimestampMachContinuous;
  if (bleAdvertisementTimestampMachContinuous) {
    xpc_dictionary_set_uint64(v6, "blATM", bleAdvertisementTimestampMachContinuous);
  }
  bleAppleManufacturerData = self->_bleAppleManufacturerData;
  if (bleAppleManufacturerData)
  {
    int v18 = bleAppleManufacturerData;
    id v19 = v6;
    uint64_t v20 = -[NSData bytes](v18, "bytes");
    if (v20) {
      int v21 = (const char *)v20;
    }
    else {
      int v21 = "";
    }
    size_t v22 = -[NSData length](v18, "length");

    xpc_dictionary_set_data(v19, "blAM", v21, v22);
  }

  int64_t bleChannel = self->_bleChannel;
  if ((_DWORD)bleChannel) {
    xpc_dictionary_set_int64(v6, "blCh", bleChannel);
  }
  int64_t bleRSSI = self->_bleRSSI;
  if ((_DWORD)bleRSSI) {
    xpc_dictionary_set_int64(v6, "blRS", bleRSSI);
  }
  btAddressData = self->_btAddressData;
  if (btAddressData)
  {
    int v26 = btAddressData;
    id v27 = v6;
    uint64_t v28 = -[NSData bytes](v26, "bytes");
    if (v28) {
      int v29 = (const char *)v28;
    }
    else {
      int v29 = "";
    }
    size_t v30 = -[NSData length](v26, "length");

    xpc_dictionary_set_data(v27, "btAd", v29, v30);
  }

  caseVersion = self->_caseVersion;
  id v32 = v6;
  v33 = -[NSString UTF8String](caseVersion, "UTF8String");
  if (v33) {
    xpc_dictionary_set_string(v32, "cVer", v33);
  }

  uint64_t changeFlags = self->_changeFlags;
  if (changeFlags) {
    xpc_dictionary_set_uint64(v32, "chFl", changeFlags);
  }
  if (*(_DWORD *)self->_changedTypesInternal.bitArray | self->_changedTypesInternal.bitArray[4]) {
    size_t v35 = 5LL;
  }
  else {
    size_t v35 = 1LL;
  }
  xpc_dictionary_set_data(v32, "chTy", &self->_changedTypesInternal, v35);
  if (self->_colorInfo) {
    xpc_dictionary_set_uint64(v32, "clrI", self->_colorInfo);
  }
  if (self->_classicRSSI) {
    xpc_dictionary_set_int64(v32, "clRS", self->_classicRSSI);
  }
  uint64_t connectedServices = self->_connectedServices;
  if ((_DWORD)connectedServices) {
    xpc_dictionary_set_uint64(v32, "CnS", connectedServices);
  }
  contactID = self->_contactID;
  id v38 = v32;
  uint64_t v39 = -[NSString UTF8String](contactID, "UTF8String");
  if (v39) {
    xpc_dictionary_set_string(v38, "cnID", v39);
  }

  CUXPCEncodeObject();
  if (self->_conversationDetectCapability) {
    xpc_dictionary_set_uint64(v38, "cdCp", self->_conversationDetectCapability);
  }
  uint64_t deviceFlags = self->_deviceFlags;
  if (deviceFlags) {
    xpc_dictionary_set_uint64(v38, "dvFl", deviceFlags);
  }
  uint64_t v41 = self->_deviceInfo;
  if (v41)
  {
    uint64_t v42 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    if (v42) {
      xpc_dictionary_set_value(v38, "dvIn", v42);
    }
  }

  if (self->_deviceType) {
    xpc_dictionary_set_uint64(v38, "dvTy", self->_deviceType);
  }
  uint64_t discoveryFlags = self->_discoveryFlags;
  if (discoveryFlags) {
    xpc_dictionary_set_uint64(v38, "dsFl", discoveryFlags);
  }
  if (*(_DWORD *)self->_discoveryTypesInternal.bitArray | self->_discoveryTypesInternal.bitArray[4]) {
    size_t v44 = 5LL;
  }
  else {
    size_t v44 = 1LL;
  }
  xpc_dictionary_set_data(v38, "dsTy", &self->_discoveryTypesInternal, v44);
  if (self->_endCallCapability) {
    xpc_dictionary_set_uint64(v38, "eCCp", self->_endCallCapability);
  }
  firmwareVersion = self->_firmwareVersion;
  id v46 = v38;
  uint64_t v47 = -[NSString UTF8String](firmwareVersion, "UTF8String");
  if (v47) {
    xpc_dictionary_set_string(v46, "frmV", v47);
  }

  identifier = self->_identifier;
  id v49 = v46;
  int v50 = -[NSString UTF8String](identifier, "UTF8String");
  if (v50) {
    xpc_dictionary_set_string(v49, "id", v50);
  }

  idsDeviceID = self->_idsDeviceID;
  id v52 = v49;
  int v53 = -[NSString UTF8String](idsDeviceID, "UTF8String");
  if (v53) {
    xpc_dictionary_set_string(v52, "idsI", v53);
  }

  leAdvName = self->_leAdvName;
  id v55 = v52;
  int v56 = -[NSString UTF8String](leAdvName, "UTF8String");
  if (v56) {
    xpc_dictionary_set_string(v55, "leNm", v56);
  }

  if (self->_microphoneMode) {
    xpc_dictionary_set_int64(v55, "micM", self->_microphoneMode);
  }
  model = self->_model;
  id v58 = v55;
  int v59 = -[NSString UTF8String](model, "UTF8String");
  if (v59) {
    xpc_dictionary_set_string(v58, "md", v59);
  }

  if (self->_muteControlCapability) {
    xpc_dictionary_set_uint64(v58, "mCCp", self->_muteControlCapability);
  }
  name = self->_name;
  id v61 = v58;
  int v62 = -[NSString UTF8String](name, "UTF8String");
  if (v62) {
    xpc_dictionary_set_string(v61, "nm", v62);
  }

  int64_t primaryPlacement = self->_primaryPlacement;
  if ((_DWORD)primaryPlacement) {
    xpc_dictionary_set_int64(v61, "dPrP", primaryPlacement);
  }
  int64_t secondaryPlacement = self->_secondaryPlacement;
  if ((_DWORD)secondaryPlacement) {
    xpc_dictionary_set_int64(v61, "dScP", secondaryPlacement);
  }
  if (self->_placementMode) {
    xpc_dictionary_set_int64(v61, "dPlM", self->_placementMode);
  }
  uint64_t productID = self->_productID;
  if ((_DWORD)productID) {
    xpc_dictionary_set_uint64(v61, "pid", productID);
  }
  productName = self->_productName;
  id v67 = v61;
  int v68 = -[NSString UTF8String](productName, "UTF8String");
  if (v68) {
    xpc_dictionary_set_string(v67, "prN", v68);
  }

  if (self->_selectiveSpeechListeningCapability) {
    xpc_dictionary_set_uint64(v67, "ssCp", self->_selectiveSpeechListeningCapability);
  }
  txAddressData = self->_txAddressData;
  if (txAddressData)
  {
    int v70 = txAddressData;
    id v71 = v67;
    uint64_t v72 = -[NSData bytes](v70, "bytes");
    if (v72) {
      int v73 = (const char *)v72;
    }
    else {
      int v73 = "";
    }
    size_t v74 = -[NSData length](v70, "length");

    xpc_dictionary_set_data(v71, "TxAd", v73, v74);
  }

  if (self->_hearingAidSupport) {
    xpc_dictionary_set_int64(v67, "HaSp", self->_hearingAidSupport);
  }
  if (self->_hearingTestSupport) {
    xpc_dictionary_set_int64(v67, "HtSp", self->_hearingTestSupport);
  }
  serialNumber = self->_serialNumber;
  id v76 = v67;
  int v77 = -[NSString UTF8String](serialNumber, "UTF8String");
  if (v77) {
    xpc_dictionary_set_string(v76, "sn", v77);
  }

  serialNumberLeft = self->_serialNumberLeft;
  id v79 = v76;
  int v80 = -[NSString UTF8String](serialNumberLeft, "UTF8String");
  if (v80) {
    xpc_dictionary_set_string(v79, "snLe", v80);
  }

  serialNumberRight = self->_serialNumberRight;
  xpc_object_t xdict = v79;
  int v82 = -[NSString UTF8String](serialNumberRight, "UTF8String");
  if (v82) {
    xpc_dictionary_set_string(xdict, "snRi", v82);
  }

  if (self->_smartRoutingMode) {
    xpc_dictionary_set_int64(xdict, "srMd", self->_smartRoutingMode);
  }
  uint64_t supportedServices = self->_supportedServices;
  if ((_DWORD)supportedServices) {
    xpc_dictionary_set_uint64(xdict, "supS", supportedServices);
  }
  if (self->_vendorID) {
    xpc_dictionary_set_uint64(xdict, "vid", self->_vendorID);
  }
  if (self->_vendorIDSource) {
    xpc_dictionary_set_uint64(xdict, "vidS", self->_vendorIDSource);
  }
  if (self->_airdropFlags) {
    xpc_dictionary_set_uint64(xdict, "adFl", self->_airdropFlags);
  }
  airdropTempAuthTagData = self->_airdropTempAuthTagData;
  if (airdropTempAuthTagData)
  {
    int v85 = airdropTempAuthTagData;
    id v86 = xdict;
    uint64_t v87 = -[NSData bytes](v85, "bytes");
    if (v87) {
      int v88 = (const char *)v87;
    }
    else {
      int v88 = "";
    }
    size_t v89 = -[NSData length](v85, "length");

    xpc_dictionary_set_data(v86, "adTa", v88, v89);
  }

  if (self->_airdropModel) {
    xpc_dictionary_set_uint64(xdict, "adMl", self->_airdropModel);
  }
  if (self->_airdropVersion) {
    xpc_dictionary_set_uint64(xdict, "adVs", self->_airdropVersion);
  }
  if (self->_airdropHash1) {
    xpc_dictionary_set_uint64(xdict, "adH1", self->_airdropHash1);
  }
  if (self->_airdropHash2) {
    xpc_dictionary_set_uint64(xdict, "adH2", self->_airdropHash2);
  }
  if (self->_airdropHash3) {
    xpc_dictionary_set_uint64(xdict, "adH3", self->_airdropHash3);
  }
  if (self->_airdropHash4) {
    xpc_dictionary_set_uint64(xdict, "adH4", self->_airdropHash4);
  }
  if (self->_airdropConfigData) {
    xpc_dictionary_set_uint64(xdict, "adCd", self->_airdropConfigData);
  }
  airplaySourceAuthTagData = self->_airplaySourceAuthTagData;
  if (airplaySourceAuthTagData)
  {
    int v91 = airplaySourceAuthTagData;
    id v92 = xdict;
    uint64_t v93 = -[NSData bytes](v91, "bytes");
    if (v93) {
      int v94 = (const char *)v93;
    }
    else {
      int v94 = "";
    }
    size_t v95 = -[NSData length](v91, "length");

    xpc_dictionary_set_data(v92, "apAT", v94, v95);
  }

  if (self->_airplaySourceFlags) {
    xpc_dictionary_set_uint64(xdict, "apSF", self->_airplaySourceFlags);
  }
  if (self->_airplayTargetConfigSeed) {
    xpc_dictionary_set_uint64(xdict, "apTC", self->_airplayTargetConfigSeed);
  }
  if (self->_airplayTargetFlags) {
    xpc_dictionary_set_uint64(xdict, "apTF", self->_airplayTargetFlags);
  }
  airplayTargetIPid v4 = self->_airplayTargetIPv4;
  if ((_DWORD)airplayTargetIPv4) {
    xpc_dictionary_set_uint64(xdict, "apTI", airplayTargetIPv4);
  }
  if (self->_homeKitV1Category) {
    xpc_dictionary_set_uint64(xdict, "hkCa", self->_homeKitV1Category);
  }
  if (self->_homeKitV1CompatibleVersion) {
    xpc_dictionary_set_uint64(xdict, "hkCV", self->_homeKitV1CompatibleVersion);
  }
  if (self->_homeKitV1ConfigurationNumber) {
    xpc_dictionary_set_uint64(xdict, "hkCN", self->_homeKitV1ConfigurationNumber);
  }
  homeKitV1DeviceIDData = self->_homeKitV1DeviceIDData;
  if (homeKitV1DeviceIDData)
  {
    int v98 = homeKitV1DeviceIDData;
    id v99 = xdict;
    uint64_t v100 = -[NSData bytes](v98, "bytes");
    if (v100) {
      int v101 = (const char *)v100;
    }
    else {
      int v101 = "";
    }
    size_t v102 = -[NSData length](v98, "length");

    xpc_dictionary_set_data(v99, "hkDI", v101, v102);
  }

  if (self->_homeKitV1Flags) {
    xpc_dictionary_set_uint64(xdict, "hkFl", self->_homeKitV1Flags);
  }
  if (self->_homeKitV1StateNumber) {
    xpc_dictionary_set_uint64(xdict, "hkS1", self->_homeKitV1StateNumber);
  }
  uint64_t homeKitV1SetupHash = self->_homeKitV1SetupHash;
  if ((_DWORD)homeKitV1SetupHash) {
    xpc_dictionary_set_uint64(xdict, "hkSH", homeKitV1SetupHash);
  }
  homeKitV2AccessoryIDData = self->_homeKitV2AccessoryIDData;
  if (homeKitV2AccessoryIDData)
  {
    int v105 = homeKitV2AccessoryIDData;
    id v106 = xdict;
    uint64_t v107 = -[NSData bytes](v105, "bytes");
    if (v107) {
      int v108 = (const char *)v107;
    }
    else {
      int v108 = "";
    }
    size_t v109 = -[NSData length](v105, "length");

    xpc_dictionary_set_data(v106, "hkAI", v108, v109);
  }

  homeKitV2AuthTagData = self->_homeKitV2AuthTagData;
  if (homeKitV2AuthTagData)
  {
    int v111 = homeKitV2AuthTagData;
    id v112 = xdict;
    uint64_t v113 = -[NSData bytes](v111, "bytes");
    if (v113) {
      int v114 = (const char *)v113;
    }
    else {
      int v114 = "";
    }
    size_t v115 = -[NSData length](v111, "length");

    xpc_dictionary_set_data(v112, "hkAT", v114, v115);
  }

  if (self->_homeKitV2InstanceID) {
    xpc_dictionary_set_uint64(xdict, "hkII", self->_homeKitV2InstanceID);
  }
  if (self->_homeKitV2StateNumber) {
    xpc_dictionary_set_uint64(xdict, "hkS2", self->_homeKitV2StateNumber);
  }
  uint64_t homeKitV2Value = self->_homeKitV2Value;
  if (homeKitV2Value) {
    xpc_dictionary_set_uint64(xdict, "hkVa", homeKitV2Value);
  }
  uint64_t nearbyActionFlags = self->_nearbyActionFlags;
  if ((_DWORD)nearbyActionFlags) {
    xpc_dictionary_set_uint64(xdict, "nbAF", nearbyActionFlags);
  }
  if (self->_nearbyActionType) {
    xpc_dictionary_set_uint64(xdict, "nbAc", self->_nearbyActionType);
  }
  nearbyAuthTag = self->_nearbyAuthTag;
  if (nearbyAuthTag)
  {
    int v119 = nearbyAuthTag;
    id v120 = xdict;
    uint64_t v121 = -[NSData bytes](v119, "bytes");
    if (v121) {
      int v122 = (const char *)v121;
    }
    else {
      int v122 = "";
    }
    size_t v123 = -[NSData length](v119, "length");

    xpc_dictionary_set_data(v120, "nbAT", v122, v123);
  }

  uint64_t nearbyInfoFlags = self->_nearbyInfoFlags;
  if ((_DWORD)nearbyInfoFlags) {
    xpc_dictionary_set_uint64(xdict, "nbIF", nearbyInfoFlags);
  }
  if (self->_nearbyInfoV2DecryptedFlags) {
    xpc_dictionary_set_uint64(xdict, "nb2Fe", self->_nearbyInfoV2DecryptedFlags);
  }
  if (self->_nearbyInfoV2Flags) {
    xpc_dictionary_set_uint64(xdict, "nb2F", self->_nearbyInfoV2Flags);
  }
  nearbyInfoV2AuthIntegrityTagData = self->_nearbyInfoV2AuthIntegrityTagData;
  if (nearbyInfoV2AuthIntegrityTagData)
  {
    v126 = nearbyInfoV2AuthIntegrityTagData;
    id v127 = xdict;
    uint64_t v128 = -[NSData bytes](v126, "bytes");
    if (v128) {
      objc_super v129 = (const char *)v128;
    }
    else {
      objc_super v129 = "";
    }
    size_t v130 = -[NSData length](v126, "length");

    xpc_dictionary_set_data(v127, "nb2Ai", v129, v130);
  }

  nearbyInfoV2AuthTagData = self->_nearbyInfoV2AuthTagData;
  if (nearbyInfoV2AuthTagData)
  {
    v132 = nearbyInfoV2AuthTagData;
    id v133 = xdict;
    uint64_t v134 = -[NSData bytes](v132, "bytes");
    if (v134) {
      v135 = (const char *)v134;
    }
    else {
      v135 = "";
    }
    size_t v136 = -[NSData length](v132, "length");

    xpc_dictionary_set_data(v133, "nb2A", v135, v136);
  }

  if (self->_nearbyInfoV2InvitationCounter) {
    xpc_dictionary_set_uint64(xdict, "nb2Ic", self->_nearbyInfoV2InvitationCounter);
  }
  if (self->_nearbyInfoV2InvitationTypes) {
    xpc_dictionary_set_uint64(xdict, "nb2It", self->_nearbyInfoV2InvitationTypes);
  }
  if (self->_nearbyInfoV2InvitationRouteType) {
    xpc_dictionary_set_uint64(xdict, "nb2Ir", self->_nearbyInfoV2InvitationRouteType);
  }
  if (self->_nearbyActionNoWakeType) {
    xpc_dictionary_set_uint64(xdict, "nawT", self->_nearbyActionNoWakeType);
  }
  if (self->_nearbyActionNWPrecisionFindingStatus) {
    xpc_dictionary_set_uint64(xdict, "nawS", self->_nearbyActionNWPrecisionFindingStatus);
  }
  nearbyActionNoWakeAuthTagData = self->_nearbyActionNoWakeAuthTagData;
  if (nearbyActionNoWakeAuthTagData)
  {
    v138 = nearbyActionNoWakeAuthTagData;
    id v139 = xdict;
    uint64_t v140 = -[NSData bytes](v138, "bytes");
    if (v140) {
      v141 = (const char *)v140;
    }
    else {
      v141 = "";
    }
    size_t v142 = -[NSData length](v138, "length");

    xpc_dictionary_set_data(v139, "nawA", v141, v142);
  }

  nearbyActionNoWakeConfigData = self->_nearbyActionNoWakeConfigData;
  if (nearbyActionNoWakeConfigData)
  {
    v144 = nearbyActionNoWakeConfigData;
    id v145 = xdict;
    uint64_t v146 = -[NSData bytes](v144, "bytes");
    if (v146) {
      v147 = (const char *)v146;
    }
    else {
      v147 = "";
    }
    size_t v148 = -[NSData length](v144, "length");

    xpc_dictionary_set_data(v145, "nawC", v147, v148);
  }

  if (self->_objectDiscoveryBatteryState) {
    xpc_dictionary_set_uint64(xdict, "odBS", self->_objectDiscoveryBatteryState);
  }
  if (self->_objectDiscoveryMode) {
    xpc_dictionary_set_uint64(xdict, "odDM", self->_objectDiscoveryMode);
  }
  objectDiscoveryNearOwnerID = self->_objectDiscoveryNearOwnerID;
  if (objectDiscoveryNearOwnerID)
  {
    v150 = objectDiscoveryNearOwnerID;
    id v151 = xdict;
    uint64_t v152 = -[NSData bytes](v150, "bytes");
    if (v152) {
      v153 = (const char *)v152;
    }
    else {
      v153 = "";
    }
    size_t v154 = -[NSData length](v150, "length");

    xpc_dictionary_set_data(v151, "odNO", v153, v154);
  }

  uint64_t objectDiscoveryProductID = self->_objectDiscoveryProductID;
  if ((_DWORD)objectDiscoveryProductID) {
    xpc_dictionary_set_uint64(xdict, "odPI", objectDiscoveryProductID);
  }
  objectDiscoveryPublicKeyData = self->_objectDiscoveryPublicKeyData;
  if (objectDiscoveryPublicKeyData)
  {
    v157 = objectDiscoveryPublicKeyData;
    id v158 = xdict;
    uint64_t v159 = -[NSData bytes](v157, "bytes");
    if (v159) {
      v160 = (const char *)v159;
    }
    else {
      v160 = "";
    }
    size_t v161 = -[NSData length](v157, "length");

    xpc_dictionary_set_data(v158, "odPK", v160, v161);
  }

  uint64_t proximityPairingProductID = self->_proximityPairingProductID;
  if ((_DWORD)proximityPairingProductID) {
    xpc_dictionary_set_uint64(xdict, "ppPI", proximityPairingProductID);
  }
  if (self->_proximityPairingSubType) {
    xpc_dictionary_set_uint64(xdict, "ppST", self->_proximityPairingSubType);
  }
  if (self->_peerStatusFlag) {
    xpc_dictionary_set_uint64(xdict, "prSt", self->_peerStatusFlag);
  }
  if (self->_transmitPowerOne) {
    xpc_dictionary_set_uint64(xdict, "txP1", self->_transmitPowerOne);
  }
  if (self->_transmitPowerTwo) {
    xpc_dictionary_set_uint64(xdict, "txP2", self->_transmitPowerTwo);
  }
  if (self->_transmitPowerThree) {
    xpc_dictionary_set_uint64(xdict, "txP3", self->_transmitPowerThree);
  }
  if (self->_proximityServiceCategory) {
    xpc_dictionary_set_uint64(xdict, "psCa", self->_proximityServiceCategory);
  }
  proximityServiceClassicAddress = self->_proximityServiceClassicAddress;
  if (proximityServiceClassicAddress)
  {
    v164 = proximityServiceClassicAddress;
    id v165 = xdict;
    uint64_t v166 = -[NSData bytes](v164, "bytes");
    if (v166) {
      v167 = (const char *)v166;
    }
    else {
      v167 = "";
    }
    size_t v168 = -[NSData length](v164, "length");

    xpc_dictionary_set_data(v165, "psCA", v167, v168);
  }

  proximityServiceData = self->_proximityServiceData;
  if (proximityServiceData)
  {
    v170 = proximityServiceData;
    id v171 = xdict;
    uint64_t v172 = -[NSData bytes](v170, "bytes");
    if (v172) {
      v173 = (const char *)v172;
    }
    else {
      v173 = "";
    }
    size_t v174 = -[NSData length](v170, "length");

    xpc_dictionary_set_data(v171, "psDa", v173, v174);
  }

  if (self->_proximityServiceFlags) {
    xpc_dictionary_set_uint64(xdict, "psFl", self->_proximityServiceFlags);
  }
  if (self->_proximityServiceMeasuredPower) {
    xpc_dictionary_set_int64(xdict, "psMP", self->_proximityServiceMeasuredPower);
  }
  uint64_t proximityServiceProductID = self->_proximityServiceProductID;
  if ((_DWORD)proximityServiceProductID) {
    xpc_dictionary_set_uint64(xdict, "psPI", proximityServiceProductID);
  }
  if (self->_proximityServicePSM) {
    xpc_dictionary_set_uint64(xdict, "psPS", self->_proximityServicePSM);
  }
  proximityServiceSetupHash = self->_proximityServiceSetupHash;
  if (proximityServiceSetupHash)
  {
    v177 = proximityServiceSetupHash;
    id v178 = xdict;
    uint64_t v179 = -[NSData bytes](v177, "bytes");
    if (v179) {
      v180 = (const char *)v179;
    }
    else {
      v180 = "";
    }
    size_t v181 = -[NSData length](v177, "length");

    xpc_dictionary_set_data(v178, "psSH", v180, v181);
  }

  if (self->_proximityServiceSubType) {
    xpc_dictionary_set_uint64(xdict, "psST", self->_proximityServiceSubType);
  }
  if (self->_proximityServiceVendorID) {
    xpc_dictionary_set_uint64(xdict, "psVI", self->_proximityServiceVendorID);
  }
  if (self->_proximityServiceVersion) {
    xpc_dictionary_set_uint64(xdict, "psVs", self->_proximityServiceVersion);
  }
  safetyAlertsAlertData = self->_safetyAlertsAlertData;
  if (safetyAlertsAlertData)
  {
    v183 = safetyAlertsAlertData;
    id v184 = xdict;
    uint64_t v185 = -[NSData bytes](v183, "bytes");
    if (v185) {
      v186 = (const char *)v185;
    }
    else {
      v186 = "";
    }
    size_t v187 = -[NSData length](v183, "length");

    xpc_dictionary_set_data(v184, "saAd", v186, v187);
  }

  safetyAlertsAlertID = self->_safetyAlertsAlertID;
  if (safetyAlertsAlertID)
  {
    v189 = safetyAlertsAlertID;
    id v190 = xdict;
    uint64_t v191 = -[NSData bytes](v189, "bytes");
    if (v191) {
      v192 = (const char *)v191;
    }
    else {
      v192 = "";
    }
    size_t v193 = -[NSData length](v189, "length");

    xpc_dictionary_set_data(v190, "saAi", v192, v193);
  }

  safetyAlertsSignature = self->_safetyAlertsSignature;
  if (safetyAlertsSignature)
  {
    v195 = safetyAlertsSignature;
    id v196 = xdict;
    uint64_t v197 = -[NSData bytes](v195, "bytes");
    if (v197) {
      v198 = (const char *)v197;
    }
    else {
      v198 = "";
    }
    size_t v199 = -[NSData length](v195, "length");

    xpc_dictionary_set_data(v196, "saSg", v198, v199);
  }

  if (self->_safetyAlertsVersion) {
    xpc_dictionary_set_uint64(xdict, "saVs", self->_safetyAlertsVersion);
  }
  if (self->_spatialInteractionConfigFlags) {
    xpc_dictionary_set_uint64(xdict, "siCl", self->_spatialInteractionConfigFlags);
  }
  if (self->_spatialInteractionFlags) {
    xpc_dictionary_set_uint64(xdict, "siFl", self->_spatialInteractionFlags);
  }
  CUXPCEncodeNSArrayOfNSData();
  uint64_t spatialInteractionPeerID = self->_spatialInteractionPeerID;
  if ((_DWORD)spatialInteractionPeerID) {
    xpc_dictionary_set_uint64(xdict, "siPI", spatialInteractionPeerID);
  }
  spatialInteractionUWBConfigData = self->_spatialInteractionUWBConfigData;
  if (spatialInteractionUWBConfigData)
  {
    v202 = spatialInteractionUWBConfigData;
    id v203 = xdict;
    uint64_t v204 = -[NSData bytes](v202, "bytes");
    if (v204) {
      v205 = (const char *)v204;
    }
    else {
      v205 = "";
    }
    size_t v206 = -[NSData length](v202, "length");

    xpc_dictionary_set_data(v203, "siUC", v205, v206);
  }

  spatialInteractionPresenceConfigData = self->_spatialInteractionPresenceConfigData;
  if (spatialInteractionPresenceConfigData)
  {
    v208 = spatialInteractionPresenceConfigData;
    id v209 = xdict;
    uint64_t v210 = -[NSData bytes](v208, "bytes");
    if (v210) {
      v211 = (const char *)v210;
    }
    else {
      v211 = "";
    }
    size_t v212 = -[NSData length](v208, "length");

    xpc_dictionary_set_data(v209, "siPC", v211, v212);
  }

  if (self->_tipiConnectionStatus) {
    xpc_dictionary_set_uint64(xdict, "tpCS", self->_tipiConnectionStatus);
  }
  CUXPCEncodeNSArrayOfObjects();
  if (self->_tipiState) {
    xpc_dictionary_set_uint64(xdict, "tpSt", self->_tipiState);
  }
}

- (CBDevice)initWithCoder:(id)a3
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v4 = (void *)MEMORY[0x189604010];
  id v5 = a3;
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  [MEMORY[0x189603F18] arrayWithObjects:&v11 count:9];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v6, v11, v12, v13, v14, v15, v16, v17, v18);
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue();

  [v5 decodeObjectOfClasses:v7 forKey:@"devi"];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v9 = -[CBDevice initWithDictionary:error:](self, "initWithDictionary:error:", v8, 0LL);
  return v9;
}

- (CBDevice)initWithDictionary:(id)a3 error:(id *)a4
{
  uint64_t v12 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  if (v12)
  {
    self = -[CBDevice initWithXPCObject:error:](self, "initWithXPCObject:error:", v12, a4);
    uint64_t v13 = self;
  }

  else if (a4)
  {
    CBErrorF(-6700, (uint64_t)"CBDevice convert XPC dict failed", v6, v7, v8, v9, v10, v11, v15);
    uint64_t v13 = 0LL;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v13 = 0LL;
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  -[CBDevice dictionaryRepresentation](self, "dictionaryRepresentation");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4) {
    [v5 encodeObject:v4 forKey:@"devi"];
  }
}

- (id)dictionaryRepresentation
{
  xpc_object_t v3 = xpc_dictionary_create(0LL, 0LL, 0LL);
  -[CBDevice encodeWithXPCObject:](self, "encodeWithXPCObject:", v3);
  id v4 = (void *)CUXPCCreateCFObjectFromXPCObject();
  id v5 = v4;
  if (!v4) {
    id v4 = (void *)MEMORY[0x189604A60];
  }
  id v6 = v4;

  return v6;
}

- (id)description
{
  return -[CBDevice descriptionWithLevel:](self, "descriptionWithLevel:", 50LL);
}

- (id)descriptionWithLevel:(int)a3
{
  uint64_t v681 = 0LL;
  v682 = (id *)&v681;
  uint64_t v683 = 0x3032000000LL;
  v684 = __Block_byref_object_copy__5;
  v685 = __Block_byref_object_dispose__5;
  id v686 = 0LL;
  uint64_t v680 = 0LL;
  identifier = self->_identifier;
  NSAppendPrintF_safe();
  objc_storeStrong(&v686, 0LL);
  id v5 = self->_btAddressData;
  if (v5)
  {
    id v6 = v682;
    id v679 = v682[5];
    CUPrintNSDataAddress();
    identifier = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    objc_storeStrong(v6 + 5, v679);
  }

  uint64_t v7 = self->_txAddressData;
  if (v7)
  {
    uint64_t v8 = v682;
    id v678 = v682[5];
    CUPrintNSDataAddress();
    identifier = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    objc_storeStrong(v8 + 5, v678);
  }

  uint64_t v9 = self->_name;
  uint64_t v10 = v9;
  if (v9)
  {
    uint64_t v11 = v682;
    id v677 = v682[5];
    identifier = v9;
    NSAppendPrintF_safe();
    objc_storeStrong(v11 + 5, v677);
  }

  uint64_t v12 = self->_model;
  uint64_t v13 = v12;
  if (v12)
  {
    uint64_t v14 = v682;
    id v676 = v682[5];
    identifier = v12;
    NSAppendPrintF_safe();
    objc_storeStrong(v14 + 5, v676);
  }

  uint64_t productID = self->_productID;
  if ((_DWORD)productID)
  {
    uint64_t v16 = CBProductIDToString_0(self->_productID);
    uint64_t v17 = v682;
    id v675 = v682[5];
    identifier = (void *)productID;
    v473 = v16;
    NSAppendPrintF_safe();
    objc_storeStrong(v17 + 5, v675);
    uint64_t v18 = CBProductIDToNSLocalizedProductNameString(productID);
    uint64_t v19 = (void *)v18;
    if (v18)
    {
      uint64_t v20 = v682;
      id v674 = v682[5];
      identifier = (void *)v18;
      NSAppendPrintF_safe();
      objc_storeStrong(v20 + 5, v674);
    }
  }

  unsigned int v21 = a3;
  if (a3 <= 0x3Bu)
  {
    vendorID = (void *)self->_vendorID;
    if (self->_vendorID)
    {
      int v23 = v682;
      id v673 = v682[5];
      identifier = vendorID;
      NSAppendPrintF_safe();
      objc_storeStrong(v23 + 5, v673);
    }

    vendorIDSource = (void *)self->_vendorIDSource;
    if (self->_vendorIDSource)
    {
      int v25 = v682;
      id v672 = v682[5];
      identifier = vendorIDSource;
      NSAppendPrintF_safe();
      objc_storeStrong(v25 + 5, v672);
    }

    int v26 = self->_idsDeviceID;
    id v27 = v26;
    if (v26)
    {
      uint64_t v28 = v682;
      id v671 = v682[5];
      identifier = v26;
      NSAppendPrintF_safe();
      objc_storeStrong(v28 + 5, v671);
    }

    int v29 = self->_accountID;
    size_t v30 = v29;
    if (v29)
    {
      int v31 = v682;
      id v670 = v682[5];
      identifier = v29;
      NSAppendPrintF_safe();
      objc_storeStrong(v31 + 5, v670);
    }

    adaptiveVolumeCapability = (void *)self->_adaptiveVolumeCapability;
    if (self->_adaptiveVolumeCapability)
    {
      v33 = v682;
      id v669 = v682[5];
      identifier = adaptiveVolumeCapability;
      NSAppendPrintF_safe();
      objc_storeStrong(v33 + 5, v669);
    }

    unsigned int v34 = -[CBDevice adaptiveVolumeConfig](self, "adaptiveVolumeConfig", identifier, v473);
    if (v34)
    {
      size_t v35 = v682;
      id v668 = v682[5];
      uint64_t v428 = v34;
      NSAppendPrintF_safe();
      objc_storeStrong(v35 + 5, v668);
    }

    uint64_t v36 = self->_contactID;
    uint64_t v37 = v36;
    if (v36)
    {
      id v38 = v682;
      id obj = v682[5];
      uint64_t v428 = (uint64_t)v36;
      NSAppendPrintF_safe();
      objc_storeStrong(v38 + 5, obj);
    }

    uint64_t v39 = -[CBDevice stableIdentifier](self, "stableIdentifier");
    uint64_t v40 = (void *)v39;
    if (v39)
    {
      uint64_t v41 = v682;
      id v666 = v682[5];
      uint64_t v428 = v39;
      NSAppendPrintF_safe();
      objc_storeStrong(v41 + 5, v666);
    }

    if (self->_discoveryFlags)
    {
      uint64_t v42 = v682;
      id v665 = v682[5];
      uint64_t v428 = CUPrintFlags64();
      NSAppendPrintF_safe();
      objc_storeStrong(v42 + 5, v665);
    }

    uint64_t v43 = v682;
    id v664 = v682[5];
    CBDiscoveryTypesAppendString((uint64_t)&v664, (uint64_t)", DsTy", (uint64_t)&self->_discoveryTypesInternal);
    objc_storeStrong(v43 + 5, v664);
    if (self->_deviceFlags)
    {
      size_t v44 = v682;
      id v663 = v682[5];
      uint64_t v428 = CUPrintFlags64();
      NSAppendPrintF_safe();
      objc_storeStrong(v44 + 5, v663);
    }

    unsigned int deviceType = self->_deviceType;
    if (self->_deviceType)
    {
      id v46 = v682;
      id v662 = v682[5];
      uint64_t v428 = (uint64_t)CBDeviceTypeToString(deviceType);
      NSAppendPrintF_safe();
      objc_storeStrong(v46 + 5, v662);
    }

    int v47 = -[CBDevice rssi](self, "rssi", v428);
    if (v47)
    {
      v48 = v682;
      id v661 = v682[5];
      uint64_t v429 = v47;
      NSAppendPrintF_safe();
      objc_storeStrong(v48 + 5, v661);
    }

    if (self->_connectedServices)
    {
      id v49 = v682;
      id v660 = v682[5];
      uint64_t v429 = CUPrintFlags32();
      NSAppendPrintF_safe();
      objc_storeStrong(v49 + 5, v660);
    }

    if (self->_supportedServices)
    {
      int v50 = v682;
      id v659 = v682[5];
      uint64_t v429 = CUPrintFlags32();
      NSAppendPrintF_safe();
      objc_storeStrong(v50 + 5, v659);
    }

    int v51 = -[CBDevice appearanceValue](self, "appearanceValue", v429);
    if (v51)
    {
      id v52 = v682 + 5;
      id v658 = v682[5];
      if (v51 <= 2368)
      {
        switch(v51)
        {
          case 2112:
            int v53 = @"Generic Audio Sink";
            break;
          case 2113:
            int v53 = @"Standalone Speaker";
            break;
          case 2114:
            int v53 = @"Soundbar";
            break;
          case 2115:
            int v53 = @"Bookshelf Speaker";
            break;
          case 2116:
            int v53 = @"Standmounted Speaker";
            break;
          case 2117:
            int v53 = @"Speakerphone";
            break;
          default:
            int v53 = @"Keyboard";
            switch(v51)
            {
              case 961:
                goto LABEL_65;
              case 962:
                int v53 = @"Mouse";
                break;
              case 963:
                int v53 = @"Joystick";
                break;
              case 964:
                int v53 = @"Gamepad";
                break;
              case 969:
                int v53 = @"Touchpad";
                break;
              default:
                goto LABEL_56;
            }

            break;
        }
      }

      else if (v51 > 2370)
      {
        if (v51 == 2371)
        {
          int v53 = @"Headphones";
        }

        else if (v51 == 2625)
        {
          int v53 = @"Hearing Aid";
        }

        else
        {
LABEL_56:
          int v53 = @"?";
        }
      }

      else if (v51 == 2369)
      {
        int v53 = @"Earbud";
      }

      else
      {
        int v53 = @"Headset";
      }

void __33__CBDevice_descriptionWithLevel___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id obj = *(id *)(v4 + 40);
  id v5 = a3;
  [a2 unsignedIntValue];
  CUDescriptionWithLevel();
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  CUPrintNSObjectOneLine();
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSAppendPrintF_safe();
  objc_storeStrong((id *)(v4 + 40), obj);
}

- (float)batteryLevelMain
{
  return (float)(self->_batteryInfoMain & 0x7F) / 100.0;
}

- (unsigned)batteryStateMain
{
  return HIBYTE(self->_batteryInfoMain) & 7;
}

- (float)batteryLevelLeft
{
  return (float)(self->_batteryInfoLeft & 0x7F) / 100.0;
}

- (unsigned)batteryStateLeft
{
  return HIBYTE(self->_batteryInfoLeft) & 7;
}

- (float)batteryLevelRight
{
  return (float)(self->_batteryInfoRight & 0x7F) / 100.0;
}

- (unsigned)batteryStateRight
{
  return HIBYTE(self->_batteryInfoRight) & 7;
}

- (float)batteryLevelCase
{
  return (float)(self->_batteryInfoCase & 0x7F) / 100.0;
}

- (unsigned)batteryStateCase
{
  return HIBYTE(self->_batteryInfoCase) & 7;
}

- ($F9CA75CC5B4E604BACB273E5A2091FCB)changedTypesInternalPtr
{
  return ($F9CA75CC5B4E604BACB273E5A2091FCB *)&self->_changedTypesInternal;
}

- (unsigned)colorCodeBest
{
  switch(self->_productID)
  {
    case 0x200Au:
    case 0x201Fu:
      unsigned __int8 result = self->_colorInfo & 0x1F;
      break;
    case 0x200Bu:
    case 0x2011u:
    case 0x2012u:
      unsigned int colorInfo_low = LOBYTE(self->_colorInfo);
      unsigned int v3 = colorInfo_low >> 4;
      int v4 = colorInfo_low & 0xF;
      if (v4 == 15) {
        LOBYTE(v4) = 0;
      }
      if (v3 == 15) {
        unsigned __int8 result = v4;
      }
      else {
        unsigned __int8 result = v3;
      }
      break;
    default:
      unsigned __int8 result = self->_colorInfo;
      break;
  }

  return result;
}

- (unsigned)colorFlags
{
  return HIBYTE(self->_colorInfo) & 1;
}

- ($F9CA75CC5B4E604BACB273E5A2091FCB)discoveryTypesInternalPtr
{
  return ($F9CA75CC5B4E604BACB273E5A2091FCB *)&self->_discoveryTypesInternal;
}

- (unsigned)adaptiveVolumeConfig
{
  return CFDictionaryGetInt64Ranged();
}

- (void)setAdaptiveVolumeConfig:(unsigned __int8)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", @"aVC", v4);
}

- (unsigned)appearanceValue
{
  return CFDictionaryGetInt64Ranged();
}

- (void)setAppearanceValue:(unsigned int)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", @"a", v4);
}

- (NSString)btVersion
{
  return (NSString *)CFDictionaryGetTypedValue();
}

- (void)setBtVersion:(id)a3
{
}

- (unsigned)clickHoldModeLeft
{
  return CFDictionaryGetInt64Ranged();
}

- (void)setClickHoldModeLeft:(unsigned __int8)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", @"clHL", v4);
}

- (unsigned)clickHoldModeRight
{
  return CFDictionaryGetInt64Ranged();
}

- (void)setClickHoldModeRight:(unsigned __int8)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", @"clHR", v4);
}

- (unsigned)conversationDetectConfig
{
  return CFDictionaryGetInt64Ranged();
}

- (void)setConversationDetectConfig:(unsigned __int8)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", @"cDC", v4);
}

- (unsigned)crownRotationDirection
{
  return CFDictionaryGetInt64Ranged();
}

- (void)setCrownRotationDirection:(unsigned __int8)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", @"crRD", v4);
}

- (unsigned)endCallConfig
{
  return CFDictionaryGetInt64Ranged();
}

- (void)setEndCallConfig:(unsigned __int8)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", @"eCC", v4);
}

- (NSString)findMyCaseIdentifier
{
  return (NSString *)CFDictionaryGetTypedValue();
}

- (void)setFindMyCaseIdentifier:(id)a3
{
}

- (NSString)findMyGroupIdentifier
{
  return (NSString *)CFDictionaryGetTypedValue();
}

- (void)setFindMyGroupIdentifier:(id)a3
{
}

- (unsigned)frequencyBand
{
  return CFDictionaryGetInt64Ranged();
}

- (void)setFrequencyBand:(unsigned __int8)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", @"bndI", v4);
}

- (unsigned)gapaFlags
{
  return CFDictionaryGetInt64Ranged();
}

- (void)setGapaFlags:(unsigned int)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", @"gapa", v4);
}

- (NSData)irkData
{
  return (NSData *)CFDictionaryGetTypedValue();
}

- (void)setIrkData:(id)a3
{
}

- (NSData)linkKeyData
{
  return (NSData *)CFDictionaryGetTypedValue();
}

- (void)setLinkKeyData:(id)a3
{
}

- (int)listeningMode
{
  return CFDictionaryGetInt64Ranged();
}

- (void)setListeningMode:(int)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", @"lsnM", v4);
}

- (unsigned)listeningModeConfigs
{
  return CFDictionaryGetInt64Ranged();
}

- (void)setListeningModeConfigs:(unsigned int)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", @"lsMC", v4);
}

- (NSData)ltkData
{
  return (NSData *)CFDictionaryGetTypedValue();
}

- (void)setLtkData:(id)a3
{
}

- (NSString)modelUser
{
  return (NSString *)CFDictionaryGetTypedValue();
}

- (void)setModelUser:(id)a3
{
}

- (unsigned)muteControlConfig
{
  return CFDictionaryGetInt64Ranged();
}

- (void)setMuteControlConfig:(unsigned __int8)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", @"mCC", v4);
}

- (int)spatialAudioMode
{
  return CFDictionaryGetInt64Ranged();
}

- (void)setSpatialAudioMode:(int)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", @"spAM", v4);
}

- (unsigned)accessoryStatusLidOpenCount
{
  return CFDictionaryGetInt64Ranged();
}

- (void)setAccessoryStatusLidOpenCount:(unsigned __int8)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", @"asLO", v4);
}

- (unsigned)accessoryStatusFlags
{
  return CFDictionaryGetInt64Ranged();
}

- (void)setAccessoryStatusFlags:(unsigned int)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", @"asFl", v4);
}

- (double)accessoryStatusOBCTime
{
  return result;
}

- (void)setAccessoryStatusOBCTime:(double)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", @"asOT", v4);
}

- (NSData)airplaySourceUWBConfigData
{
  return (NSData *)CFDictionaryGetTypedValue();
}

- (void)setAirplaySourceUWBConfigData:(id)a3
{
}

- (unsigned)airplayTargetPort
{
  return CFDictionaryGetInt64Ranged();
}

- (void)setAirplayTargetPort:(unsigned __int16)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", @"apTP", v4);
}

- (NSData)dockKitAccessoryPayloadData
{
  return (NSData *)CFDictionaryGetTypedValue();
}

- (void)setDockKitAccessoryPayloadData:(id)a3
{
}

- (unsigned)dsActionFlags
{
  return CFDictionaryGetInt64Ranged();
}

- (void)setDsActionFlags:(unsigned __int8)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", @"dsAF", v4);
}

- (char)dsActionMeasuredPower
{
  return CFDictionaryGetInt64Ranged();
}

- (void)setDsActionMeasuredPower:(char)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", @"dsAP", v4);
}

- (unsigned)dsActionTieBreaker
{
  return CFDictionaryGetInt64Ranged();
}

- (void)setDsActionTieBreaker:(unsigned __int8)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", @"dsAT", v4);
}

- (unsigned)dsInfoVehicleConfidence
{
  return CFDictionaryGetInt64Ranged();
}

- (void)setDsInfoVehicleConfidence:(unsigned __int8)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", @"b", v4);
}

- (unsigned)dsInfoVehicleState
{
  return CFDictionaryGetInt64Ranged();
}

- (void)setDsInfoVehicleState:(unsigned __int8)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", @"c", v4);
}

- (NSData)fidoPayloadData
{
  return (NSData *)CFDictionaryGetTypedValue();
}

- (void)setFidoPayloadData:(id)a3
{
}

- (unsigned)gfpModelID
{
  return CFDictionaryGetInt64Ranged();
}

- (void)setGfpModelID:(unsigned int)a3
{
  if (a3)
  {
    objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInt:");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", @"e", v4);
  }

  else
  {
    -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", @"e", 0LL);
  }

- (NSData)gfpPayloadData
{
  return (NSData *)CFDictionaryGetTypedValue();
}

- (void)setGfpPayloadData:(id)a3
{
}

- (unsigned)heySiriConfidence
{
  return CFDictionaryGetInt64Ranged();
}

- (void)setHeySiriConfidence:(unsigned __int8)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", @"g", v4);
}

- (unsigned)heySiriDeviceClass
{
  return CFDictionaryGetInt64Ranged();
}

- (void)setHeySiriDeviceClass:(unsigned __int16)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", @"h", v4);
}

- (unsigned)heySiriPerceptualHash
{
  return CFDictionaryGetInt64Ranged();
}

- (void)setHeySiriPerceptualHash:(unsigned __int16)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", @"i", v4);
}

- (unsigned)heySiriProductType
{
  return CFDictionaryGetInt64Ranged();
}

- (void)setHeySiriProductType:(unsigned __int8)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", @"j", v4);
}

- (unsigned)heySiriRandom
{
  return CFDictionaryGetInt64Ranged();
}

- (void)setHeySiriRandom:(unsigned __int8)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", @"k", v4);
}

- (unsigned)heySiriSNR
{
  return CFDictionaryGetInt64Ranged();
}

- (void)setHeySiriSNR:(unsigned __int8)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", @"l", v4);
}

- (NSData)mspAddressData
{
  return (NSData *)CFDictionaryGetTypedValue();
}

- (void)setMspAddressData:(id)a3
{
}

- (unsigned)mspDeviceClass
{
  return CFDictionaryGetInt64Ranged();
}

- (void)setMspDeviceClass:(unsigned int)a3
{
  if (a3)
  {
    objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInt:");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", @"q", v4);
  }

  else
  {
    -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", @"q", 0LL);
  }

- (NSString)mspDisplayName
{
  return (NSString *)CFDictionaryGetTypedValue();
}

- (void)setMspDisplayName:(id)a3
{
}

- (unsigned)mspSubScenario
{
  return CFDictionaryGetInt64Ranged();
}

- (void)setMspSubScenario:(unsigned __int8)a3
{
  if (a3)
  {
    objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedChar:");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", @"s", v4);
  }

  else
  {
    -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", @"s", 0LL);
  }

- (unsigned)nearbyActionColorCode
{
  return CFDictionaryGetInt64Ranged();
}

- (void)setNearbyActionColorCode:(unsigned __int8)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", @"naCC", v4);
}

- (unsigned)nearbyActionDeviceClass
{
  return CFDictionaryGetInt64Ranged();
}

- (void)setNearbyActionDeviceClass:(unsigned __int8)a3
{
  if (a3)
  {
    objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedChar:");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", @"z", v4);
  }

  else
  {
    -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", @"z", 0LL);
  }

- (NSData)nearbyActionExtraData
{
  return (NSData *)CFDictionaryGetTypedValue();
}

- (void)setNearbyActionExtraData:(id)a3
{
}

- (unsigned)nearbyActionV2Flags
{
  return CFDictionaryGetInt64Ranged();
}

- (void)setNearbyActionV2Flags:(unsigned int)a3
{
  if (a3)
  {
    objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInt:");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", @"t", v4);
  }

  else
  {
    -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", @"t", 0LL);
  }

- (NSData)nearbyActionV2TargetData
{
  return (NSData *)CFDictionaryGetCFDataOfLength();
}

- (void)setNearbyActionV2TargetData:(id)a3
{
}

- (unsigned)nearbyActionV2Type
{
  return CFDictionaryGetInt64Ranged();
}

- (void)setNearbyActionV2Type:(unsigned __int8)a3
{
  if (a3)
  {
    objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedChar:");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", @"v", v4);
  }

  else
  {
    -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", @"v", 0LL);
  }

- (double)nearbyInfoStatusProgress
{
  return result;
}

- (void)setNearbyInfoStatusProgress:(double)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", @"w", v4);
}

- (unsigned)nearbyInfoStatusTime
{
  return CFDictionaryGetInt64Ranged();
}

- (void)setNearbyInfoStatusTime:(unsigned __int8)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", @"x", v4);
}

- (unsigned)nearbyInfoStatusType
{
  return CFDictionaryGetInt64Ranged();
}

- (void)setNearbyInfoStatusType:(unsigned __int8)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", @"y", v4);
}

- (unsigned)primaryBudSide
{
  return CFDictionaryGetInt64Ranged();
}

- (void)setPrimaryBudSide:(unsigned __int8)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", @"pBSd", v4);
}

- (int)proximityPairingPrimaryPlacement
{
  return CFDictionaryGetInt64Ranged();
}

- (void)setProximityPairingPrimaryPlacement:(int)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", @"ppPP", v4);
}

- (int)proximityPairingSecondaryPlacement
{
  return CFDictionaryGetInt64Ranged();
}

- (void)setProximityPairingSecondaryPlacement:(int)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", @"ppSP", v4);
}

- (unsigned)selectiveSpeechListeningConfig
{
  return CFDictionaryGetInt64Ranged();
}

- (void)setSelectiveSpeechListeningConfig:(unsigned __int8)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CBDevice _setDeviceInfoKey:value:](self, "_setDeviceInfoKey:value:", @"ssLC", v4);
}

- (NSData)watchSetupData
{
  return (NSData *)CFDictionaryGetTypedValue();
}

- (void)setWatchSetupData:(id)a3
{
}

- (char)rssi
{
  int bleRSSI = self->_bleRSSI;
  if (!bleRSSI) {
    LOBYTE(bleRSSI) = self->_classicRSSI;
  }
  return bleRSSI;
}

- (NSString)stableIdentifier
{
  unsigned int v3 = self->_idsDeviceID;
  if (v3) {
    return v3;
  }
  id v4 = self->_homeKitV2AccessoryIDData;
  if (-[NSData length](v4, "length") == 6)
  {
    CUPrintNSDataAddress();
    id v5 = (void *)objc_claimAutoreleasedReturnValue();

    return (NSString *)v5;
  }

  else
  {
    uint64_t v7 = self->_homeKitV1DeviceIDData;
    if (-[NSData length](v7, "length") == 6)
    {
      CUPrintNSDataAddress();
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v8 = 0LL;
    }

    return (NSString *)v8;
  }

- (id)bleAdvertisementTimestampString
{
  if (qword_18C4B7DD0 != -1) {
    dispatch_once(&qword_18C4B7DD0, &__block_literal_global_7);
  }
  unsigned int v3 = (void *)_MergedGlobals_3;
  [MEMORY[0x189603F50] dateWithTimeIntervalSinceReferenceDate:self->_bleAdvertisementTimestamp];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringFromDate:v4];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __43__CBDevice_bleAdvertisementTimestampString__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x189607848]);
  v1 = (void *)_MergedGlobals_3;
  _MergedGlobals_3 = (uint64_t)v0;

  return [(id)_MergedGlobals_3 setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSS"];
}

- (BOOL)changedTypesContainCBDiscovery:(id)a3
{
  id v4 = a3;
  unint64_t changeFlags = self->_changeFlags;
  if (([v4 discoveryFlags] & changeFlags) != 0)
  {

    return 1;
  }

  else
  {
    BOOL v7 = CBDiscoveryTypesContainTypes( self->_changedTypesInternal.bitArray, (_BYTE *)[v4 discoveryTypesInternalPtr]);

    return v7;
  }

- (BOOL)changedTypesContainTypes:(id *)a3
{
  return CBDiscoveryTypesContainTypes(self->_changedTypesInternal.bitArray, a3);
}

- (BOOL)changedTypesNeedsIdentify
{
  if ((self->_changeFlags & 0x4000080040LL) != 0
    || self->_nearbyInfoV2AuthTagData && (self->_changedTypesInternal.bitArray[0] & 0x10) != 0)
  {
    return 1;
  }

  id v4 = CBDiscoveryTypesNeedsIdentify();
  if (CBDiscoveryTypesContainTypes(self->_changedTypesInternal.bitArray, v4)) {
    return 1;
  }
  -[CBDevice nearbyInfoV2EncryptedData](self, "nearbyInfoV2EncryptedData");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5 != 0LL;
}

- (void)changedTypesRemoveAll
{
  self->_unint64_t changeFlags = 0LL;
  self->_attributeInternalFlags = 0;
  *(_DWORD *)self->_changedTypesInternal.bitArray = 0;
  self->_changedTypesInternal.bitArray[4] = 0;
}

- (void)decryptApplePayloadWithIdentity:(id)a3 forType:(unsigned __int8)a4 error:(id *)a5
{
  if (a4 == 22) {
    -[CBDevice decryptNearbyInfoV2PayloadWithIdentity:error:]( self,  "decryptNearbyInfoV2PayloadWithIdentity:error:",  a3,  a5);
  }
}

- (void)decryptNearbyInfoV2PayloadWithIdentity:(id)a3 error:(id *)a4
{
  uint64_t v65 = *MEMORY[0x1895F89C0];
  id v53 = a3;
  uint64_t v57 = 0LL;
  id v58 = &v57;
  uint64_t v59 = 0x3032000000LL;
  int v60 = __Block_byref_object_copy__5;
  id v61 = __Block_byref_object_dispose__5;
  id v62 = 0LL;
  v56[0] = MEMORY[0x1895F87A8];
  v56[1] = 3221225472LL;
  v56[2] = __57__CBDevice_decryptNearbyInfoV2PayloadWithIdentity_error___block_invoke;
  v56[3] = &unk_189FB1D38;
  v56[5] = &v57;
  v56[6] = a4;
  v56[4] = self;
  id v6 = (void (**)(void))MEMORY[0x18959F890](v56);
  -[CBDevice nearbyInfoV2AuthTagData](self, "nearbyInfoV2AuthTagData");
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v53 deviceIRKData];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = v8;
  if (!self->_nearbyInfoV2EncryptedData && !self->_nearbyInfoV2EncryptedFlags) {
    goto LABEL_37;
  }
  if (!v7)
  {
    uint64_t v45 = CBErrorF(-6705, (uint64_t)"Unable to decrypt AuthTag data is not available", v9, v10, v11, v12, v13, v14, v52);
    id v46 = (void *)v58[5];
    v58[5] = v45;

    goto LABEL_37;
  }

  if (!v8)
  {
    uint64_t v47 = CBErrorF(-6705, (uint64_t)"Unable to decrypt IRK data is not available", v9, v10, v11, v12, v13, v14, v52);
    v48 = (void *)v58[5];
    v58[5] = v47;

    goto LABEL_37;
  }

  memset(v64, 0, 32);
  id v16 = v8;
  [v16 bytes];
  [v16 length];
  id v17 = v7;
  [v17 bytes];
  [v17 length];
  CryptoHKDF();
  unsigned __int8 v55 = 0;
  if (!-[CBDevice decryptNearbyInfoV2PayloadPtr:payloadLength:key:keyLength:decryptedPtr:]( self,  "decryptNearbyInfoV2PayloadPtr:payloadLength:key:keyLength:decryptedPtr:",  &self->_nearbyInfoV2EncryptedFlags,  1LL,  v64,  32LL,  &v55))
  {
    uint64_t v49 = CBErrorF( -6777,  (uint64_t)"Unable to decrypt NearbyInfoV2 sensitive flags",  v18,  v19,  v20,  v21,  v22,  v23,  (uint64_t)v64);
LABEL_42:
    size_t v30 = (NSData *)v58[5];
    v58[5] = v49;
    goto LABEL_36;
  }

  int v24 = v55 & 7;
  v55 &= 7u;
  if (!v24)
  {
    uint64_t v49 = CBErrorF( -6777,  (uint64_t)"Unable to verify NearbyInfoV2 sensitive flags mask",  v18,  v19,  v20,  v21,  v22,  v23,  (uint64_t)v64);
    goto LABEL_42;
  }

  int v25 = -[CBDevice nearbyInfoV2DecryptedFlags](self, "nearbyInfoV2DecryptedFlags", v64);
  int v26 = v55;
  self->_nearbyInfoV2DecryptedFlags = v55;
  if (v26)
  {
    if (v24 == v25)
    {
      if ((v26 & 1) == 0)
      {
LABEL_14:
        if ((v26 & 2) != 0)
        {
          uint64_t v27 = 14LL;
          if ((self->_internalFlags & 0x800) != 0)
          {
            char v28 = 32;
          }

          else
          {
            uint64_t v27 = 15LL;
            char v28 = 64;
          }

          if (v24 != v25)
          {
            uint64_t v29 = 9LL;
            *((_BYTE *)&self->super.isa + v29) |= v28;
          }

          *((_BYTE *)&self->super.isa + v27) |= v28;
        }

        if ((v26 & 4) != 0)
        {
          if (v24 != v25) {
            self->_changedTypesInternal.bitArray[2] |= 0x20u;
          }
          self->_discoveryTypesInternal.bitArray[2] |= 0x20u;
        }

        size_t v30 = self->_nearbyInfoV2EncryptedData;
        if (-[NSData length](v30, "length") != 2) {
          goto LABEL_36;
        }
        memset(v63, 0, sizeof(v63));
        id v31 = v16;
        [v31 bytes];
        [v31 length];
        id v32 = v17;
        [v32 bytes];
        [v32 length];
        CryptoHKDF();
        __int16 v54 = 0;
        size_t v30 = v30;
        if (-[CBDevice decryptNearbyInfoV2PayloadPtr:payloadLength:key:keyLength:decryptedPtr:]( self,  "decryptNearbyInfoV2PayloadPtr:payloadLength:key:keyLength:decryptedPtr:",  -[NSData bytes](v30, "bytes"),  -[NSData length](v30, "length"),  v63,  32LL,  &v54))
        {
          int v39 = v55;
          char v40 = v54;
          char v41 = HIBYTE(v54);
          int v42 = -[CBDevice nearbyInfoV2InvitationCounter](self, "nearbyInfoV2InvitationCounter", v63);
          int v43 = v39 << 31 >> 31;
          unsigned __int8 v44 = v43 & v40;
          if (-[CBDevice nearbyInfoV2InvitationRouteType](self, "nearbyInfoV2InvitationRouteType") == (v43 & v41))
          {
            if (v42 == v44) {
              goto LABEL_36;
            }
          }

          else
          {
            self->_unsigned int nearbyInfoV2InvitationRouteType = v43 & v41;
          }

          self->_changedTypesInternal.bitArray[2] |= 8u;
        }

        else
        {
          uint64_t v50 = CBErrorF( -6777,  (uint64_t)"Unable to decrypt NearbyInfoV2 sensitive data",  v33,  v34,  v35,  v36,  v37,  v38,  (uint64_t)v63);
          int v51 = (void *)v58[5];
          v58[5] = v50;
        }

void __57__CBDevice_decryptNearbyInfoV2PayloadWithIdentity_error___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
  if (v2 && *(void *)(a1 + 48))
  {
    **(void **)(a1 + 48) = v2;
  }

  else
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 688);
    *(void *)(v3 + 688) = 0LL;

    *(_BYTE *)(*(void *)(a1 + 32) + 75LL) = 0;
  }

- (BOOL)decryptNearbyInfoV2PayloadPtr:(const char *)a3 payloadLength:(unint64_t)a4 key:(const char *)a5 keyLength:(unint64_t)a6 decryptedPtr:(void *)a7
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  if (a4 >= 2) {
    size_t v8 = 2LL;
  }
  else {
    size_t v8 = a4;
  }
  __int16 __src = 0;
  __memcpy_chk();
  ccaes_ecb_encrypt_mode();
  uint64_t v9 = ccecb_context_size();
  bzero((char *)v11 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL), (v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = 0LL;
  memset(v11, 0, sizeof(v11));
  memcpy(a7, &__src, v8);
  ccecb_context_size();
  cc_clear();
  return 1;
}

- (BOOL)discoveryTypesContainCBDiscovery:(id)a3
{
  id v4 = a3;
  unint64_t discoveryFlags = self->_discoveryFlags;
  if (([v4 discoveryFlags] & discoveryFlags) != 0)
  {

    return 1;
  }

  else
  {
    BOOL v7 = CBDiscoveryTypesContainTypes( self->_discoveryTypesInternal.bitArray, (_BYTE *)[v4 discoveryTypesInternalPtr]);

    return v7;
  }

- (BOOL)discoveryTypesContainType:(int)a3
{
  else {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)discoveryTypesContainTypes:(id *)a3
{
  return CBDiscoveryTypesContainTypes(self->_discoveryTypesInternal.bitArray, a3);
}

- (BOOL)isEquivalentToCBDevice:(id)a3 compareFlags:(unsigned int)a4
{
  char v4 = a4;
  id v6 = a3;
  BOOL v7 = v6;
  if ((v4 & 1) == 0) {
    goto LABEL_2;
  }
  [v6 bleAdvertisementData];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  bleAdvertisementData = self->_bleAdvertisementData;
  uint64_t v11 = v9;
  uint64_t v12 = bleAdvertisementData;
  if (v11 == v12)
  {
  }

  else
  {
    uint64_t v13 = v12;
    if ((v11 == 0LL) == (v12 != 0LL)) {
      goto LABEL_18;
    }
    int v14 = -[NSData isEqual:](v11, "isEqual:", v12);

    if (!v14) {
      goto LABEL_51;
    }
  }

  [v7 bleAppleManufacturerData];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  bleAppleManufacturerData = self->_bleAppleManufacturerData;
  uint64_t v11 = v15;
  id v17 = bleAppleManufacturerData;
  if (v11 == v17)
  {

    goto LABEL_2;
  }

  uint64_t v13 = v17;
  if ((v11 == 0LL) == (v17 != 0LL))
  {
LABEL_18:

LABEL_51:
    BOOL v8 = 0;
    goto LABEL_52;
  }

  int v18 = -[NSData isEqual:](v11, "isEqual:", v17);

  if (!v18) {
    goto LABEL_51;
  }
LABEL_2:
  if ((v4 & 4) != 0
    && ([v7 bleRSSI] != self->_bleRSSI
     || [v7 bleChannel] != self->_bleChannel
     || self->_classicRSSI != [v7 classicRSSI]))
  {
    goto LABEL_51;
  }

  if ((v4 & 8) != 0)
  {
    [v7 btAddressData];
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v20 = self->_btAddressData;
    uint64_t v21 = v20;
    if (!v19 || !v20 || ([v19 isEqual:v20] & 1) == 0)
    {
      [v7 identifier];
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v23 = self->_identifier;
      int v24 = v23;
      BOOL v25 = 0;
      if (v22 && v23) {
        BOOL v25 = [v22 caseInsensitiveCompare:v23] == 0;
      }
      if (v22)
      {
        if (!v25 && -[NSData length](v21, "length") == 6)
        {
          [v22 UTF8String];
          BOOL v25 = 0;
          if (!TextToHardwareAddress())
          {
            uint64_t v26 = -[NSData bytes](v21, "bytes");
            if (*(_DWORD *)v26) {
              BOOL v27 = 0;
            }
            else {
              BOOL v27 = *(unsigned __int16 *)(v26 + 4) == 0;
            }
            BOOL v25 = v27;
          }
        }
      }

      if (!v25 && v24 && [v19 length] == 6)
      {
        char v28 = v24;
        -[NSString UTF8String](v28, "UTF8String");
        if (TextToHardwareAddress())
        {

LABEL_50:
          goto LABEL_51;
        }

        uint64_t v29 = [v19 bytes];
        if (*(_DWORD *)v29) {
          BOOL v30 = 0;
        }
        else {
          BOOL v30 = *(unsigned __int16 *)(v29 + 4) == 0;
        }
        int v31 = !v30;

        if (v31) {
          goto LABEL_50;
        }
      }

      else
      {

        if (!v25) {
          goto LABEL_50;
        }
      }
    }

    BOOL v8 = 1;
    goto LABEL_52;
  }

  BOOL v8 = 1;
LABEL_52:

  return v8;
}

- (unint64_t)removeInternalFlags:(unsigned int)a3
{
  unsigned int v4 = self->_internalFlags & ~a3;
  self->_internalFlags = v4;
  unint64_t v5 = (unint64_t)((v4 & 0x86) == 0) << 27;
  if (self->_audioStreamState)
  {
    self->_unsigned int audioStreamState = 0;
    v5 |= 0x80000000000uLL;
  }

  if ((v4 & 0x84) == 0 && (self->_discoveryFlags & 0x80) == 0)
  {
    if (self->_batteryInfoMain)
    {
      self->_unsigned int batteryInfoMain = 0;
      v5 |= 0x80000000000uLL;
    }

    if (self->_batteryInfoLeft)
    {
      self->_unsigned int batteryInfoLeft = 0;
      v5 |= 0x80000000000uLL;
    }

    if (self->_batteryInfoRight)
    {
      self->_unsigned int batteryInfoRight = 0;
      v5 |= 0x80000000000uLL;
    }

    if (self->_batteryInfoCase)
    {
      self->_unsigned int batteryInfoCase = 0;
      v5 |= 0x80000000000uLL;
    }
  }

  bleAddressData = self->_bleAddressData;
  if (bleAddressData) {
    BOOL v7 = (v4 & 2) == 0;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7)
  {
    self->_bleAddressData = 0LL;

    v5 |= 0x80000000000uLL;
  }

  bleAdvertisementData = self->_bleAdvertisementData;
  if (bleAdvertisementData && (v4 & 2) == 0)
  {
    self->_bleAdvertisementData = 0LL;

    v5 |= 0x40000000uLL;
  }

  bleAppleManufacturerData = self->_bleAppleManufacturerData;
  if (bleAppleManufacturerData && (v4 & 2) == 0)
  {
    self->_bleAppleManufacturerData = 0LL;

    v5 |= 0x40000000uLL;
  }

  if (self->_bleChannel && (v4 & 2) == 0)
  {
    self->_int64_t bleChannel = 0;
    v5 |= 0x200000000uLL;
  }

  if (self->_bleRSSI && (v4 & 2) == 0)
  {
    self->_int bleRSSI = 0;
    v5 |= 0x200000000uLL;
  }

  if (self->_classicRSSI && (v4 & 0x84) == 0)
  {
    self->_classicRSSI = 0;
    v5 |= 0x200000000uLL;
  }

  if (self->_connectedServices && (v4 & 0x84) == 0)
  {
    self->_uint64_t connectedServices = 0;
    v5 |= 0x80000000000uLL;
  }

  if ((v4 & 0x84) == 0)
  {
    unint64_t deviceFlags = self->_deviceFlags;
    if ((deviceFlags & 0xFFFFF87F00000F80LL) != deviceFlags)
    {
      self->_unint64_t deviceFlags = deviceFlags & 0xFFFFF87F00000F80LL;
      v5 |= 0x80000000000uLL;
    }
  }

  if (self->_deviceType && (v4 & 0x84) == 0)
  {
    self->_unsigned int deviceType = 0;
    v5 |= 0x80000000000uLL;
  }

  unint64_t discoveryFlags = self->_discoveryFlags;
  unint64_t v12 = discoveryFlags & 0xA305593A4EB00000LL;
  if ((v4 & 2) != 0) {
    unint64_t v12 = self->_discoveryFlags;
  }
  if ((v4 & 0x84) == 0) {
    v12 &= 0xFFFFFFFFFF5FFFFFLL;
  }
  if ((v4 & 0x80) == 0) {
    v12 &= ~0x4000000000000uLL;
  }
  unint64_t v13 = v12 ^ discoveryFlags;
  if (v13)
  {
    self->_unint64_t discoveryFlags = v12;
    self->_changeFlags |= v13 | 0x800000000LL;
    v5 |= v13 | 0x800000000LL;
  }

  if ((v4 & 2) == 0)
  {
    int v14 = (char *)CBDiscoveryTypesBLEScan();
    CBDiscoveryTypesRemoveTypesAndReportChanges( (char *)&self->_discoveryTypesInternal,  v14,  self->_changedTypesInternal.bitArray);
  }

  if (self->_doubleTapActionLeft && (v4 & 0x84) == 0)
  {
    self->_uint64_t doubleTapActionLeft = 0;
    v5 |= 0x80000000000uLL;
  }

  if (self->_doubleTapActionRight && (v4 & 0x84) == 0)
  {
    self->_char doubleTapActionRight = 0;
    v5 |= 0x80000000000uLL;
  }

  if (self->_doubleTapCapability && (v4 & 0x84) == 0)
  {
    self->_char doubleTapCapability = 0;
    v5 |= 0x80000000000uLL;
  }

  if (self->_microphoneMode && (v4 & 0x84) == 0)
  {
    self->_uint64_t microphoneMode = 0;
    v5 |= 0x80000000000uLL;
  }

  if (self->_primaryPlacement && (v4 & 0x84) == 0)
  {
    self->_unsigned int primaryPlacement = 0;
    v5 |= 0x80000000000uLL;
  }

  if (self->_secondaryPlacement && (v4 & 0x84) == 0)
  {
    self->_unsigned int secondaryPlacement = 0;
    v5 |= 0x80000000000uLL;
  }

  if (self->_placementMode && (v4 & 0x84) == 0)
  {
    self->_char placementMode = 0;
    v5 |= 0x80000000000uLL;
  }

  if (self->_smartRoutingMode && (v4 & 0x84) == 0)
  {
    self->_uint64_t smartRoutingMode = 0;
    v5 |= 0x80000000000uLL;
  }

  if (self->_supportedServices && (v4 & 0x84) == 0)
  {
    self->_uint64_t supportedServices = 0;
    v5 |= 0x80000000000uLL;
  }

  -[CBDevice _clearUnparsedProperties](self, "_clearUnparsedProperties");
  return v5;
}

- (void)_setDeviceInfoKey:(id)a3 value:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  BOOL v7 = self->_deviceInfo;
  BOOL v8 = v7;
  if (v6 && !v7)
  {
    BOOL v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    objc_storeStrong((id *)&self->_deviceInfo, v8);
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v6, v9);
}

- (unint64_t)updateWithCBDevice:(id)a3
{
  id v4 = a3;
  __int16 v5 = [v4 internalFlags];
  unint64_t changeFlags = self->_changeFlags;
  unint64_t discoveryFlags = self->_discoveryFlags;
  [v4 accountID];
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
  __int16 v349 = v5;
  if (v7)
  {
    BOOL v8 = self->_accountID;
    id v9 = v7;
    uint64_t v10 = v9;
    if (v8 != v9)
    {
      if (v8)
      {
        char v11 = -[NSString isEqual:](v8, "isEqual:", v9);

        if ((v11 & 1) != 0)
        {
          uint64_t v12 = 0LL;
LABEL_10:
          LOBYTE(v5) = v349;
          goto LABEL_11;
        }
      }

      else
      {
      }

      objc_storeStrong((id *)&self->_accountID, v7);
      uint64_t v12 = 0x80000000000LL;
      goto LABEL_10;
    }

    uint64_t v12 = 0LL;
  }

  else
  {
    uint64_t v12 = 0LL;
  }

- (void)updateWithCBDeviceIdentity:(id)a3
{
  id v10 = a3;
  if (self->_accountID)
  {
    if (self->_contactID) {
      goto LABEL_3;
    }
  }

  else
  {
    [v10 accountID];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6) {
      objc_storeStrong((id *)&self->_accountID, v6);
    }

    if (self->_contactID)
    {
LABEL_3:
      unsigned int v4 = [v10 type] - 2;
      if (v4 > 4) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }

  [v10 contactID];
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7) {
    objc_storeStrong((id *)&self->_contactID, v7);
  }

  unsigned int v4 = [v10 type] - 2;
  if (v4 > 4)
  {
LABEL_4:
    if (self->_idsDeviceID) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }

- (unint64_t)updateWithPowerSourceDescription:(id)a3
{
  id v4 = a3;
  CFDictionaryGetDouble();
  double v6 = v5;
  CFDictionaryGetDouble();
  double v8 = 0.0;
  if (v7 > 0.0) {
    double v8 = v6 / v7 * 100.0;
  }
  double v9 = 100.0;
  if (v8 <= 100.0) {
    double v9 = v8;
  }
  if (v9 >= 0.0) {
    double v10 = v9;
  }
  else {
    double v10 = 0.0;
  }
  if (CFDictionaryGetInt64())
  {
    int v11 = 768;
  }

  else
  {
    uint64_t Int64 = CFDictionaryGetInt64();
    if (v10 > 0.0) {
      int v13 = 512;
    }
    else {
      int v13 = 0;
    }
    if (Int64) {
      int v11 = 256;
    }
    else {
      int v11 = v13;
    }
  }

  int v14 = (int)v10;
  int v15 = v11 | v14 & ~(v14 >> 31);
  if (self->_batteryInfoMain == v15)
  {

    return 0LL;
  }

  else
  {
    self->_unsigned int batteryInfoMain = v15;

    return 0x80000000000LL;
  }

- (void)updateWithReceivedAuthTag:(id)a3 forType:(unsigned __int8)a4
{
  int v4 = a4;
  id v13 = a3;
  if (!v13) {
    goto LABEL_7;
  }
  if (v4 != 21) {
    goto LABEL_7;
  }
  -[CBDevice nearbyActionV2TargetData](self, "nearbyActionV2TargetData");
  double v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 length];

  if (!v7) {
    goto LABEL_7;
  }
  -[CBDevice nearbyActionV2TargetData](self, "nearbyActionV2TargetData");
  double v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v9 = v13;
  id v10 = v8;
  if (v10 == v9)
  {

    return;
  }

  int v11 = v10;
  if (!v10)
  {

    goto LABEL_11;
  }

  char v12 = [v9 isEqual:v10];

  if ((v12 & 1) == 0)
  {
LABEL_11:
    -[CBDevice setNearbyActionV2Flags:](self, "setNearbyActionV2Flags:", 0LL);
    -[CBDevice setNearbyActionV2Type:](self, "setNearbyActionV2Type:", 0LL);
    -[CBDevice setNearbyActionV2TargetData:](self, "setNearbyActionV2TargetData:", 0LL);
    self->_discoveryFlags &= 0xFFFFFFFBFFFDFEF7LL;
    self->_changeFlags &= 0xFFFFFFFBFFFDFEF7LL;

    return;
  }

- (void)updateWithRPIdentity:(id)a3
{
  id v10 = a3;
  if (self->_accountID)
  {
    if (self->_contactID) {
      goto LABEL_3;
    }
  }

  else
  {
    [v10 accountID];
    double v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5) {
      objc_storeStrong((id *)&self->_accountID, v5);
    }

    if (self->_contactID)
    {
LABEL_3:
      unsigned int v4 = [v10 type] - 2;
      if (v4 > 7) {
        goto LABEL_13;
      }
      goto LABEL_11;
    }
  }

  [v10 contactID];
  double v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6) {
    objc_storeStrong((id *)&self->_contactID, v6);
  }

  unsigned int v4 = [v10 type] - 2;
  if (v4 <= 7)
  {
LABEL_11:
    if (((0xD5u >> v4) & 1) != 0) {
      self->_deviceFlags |= qword_18702DA40[v4];
    }
  }

- (void)updateWithSafetyAlertsSegments:(id)a3 error:(id *)a4
{
  id v40 = a3;
  id v6 = objc_alloc_init(MEMORY[0x189603FB8]);
  id v7 = objc_alloc_init(MEMORY[0x189603FB8]);
  unsigned int safetyAlertsSegmentSegmentsTotal = self->_safetyAlertsSegmentSegmentsTotal;
  if (!self->_safetyAlertsSegmentSegmentsTotal)
  {
LABEL_7:
    if ((unint64_t)[v6 length] >= 0x1D)
    {
      if (!a4) {
        goto LABEL_10;
      }
      unint64_t v38 = "Invalid alert data length";
    }

    else
    {
      if ([v7 length] == 56)
      {
        objc_storeStrong((id *)&self->_safetyAlertsAlertData, v6);
        objc_storeStrong((id *)&self->_safetyAlertsSignature, v7);
        self->_internalFlags &= ~0x4000u;
        safetyAlertsSegmentAlertData = self->_safetyAlertsSegmentAlertData;
        self->_safetyAlertsSegmentAlertData = 0LL;

        *(_WORD *)&self->_safetyAlertsSegmentSegmentNumber = 0;
        safetyAlertsSegmentServiceData = self->_safetyAlertsSegmentServiceData;
        self->_safetyAlertsSegmentServiceData = 0LL;

        safetyAlertsSegmentSignature = self->_safetyAlertsSegmentSignature;
        self->_safetyAlertsSegmentSignature = 0LL;

        goto LABEL_10;
      }

      if (!a4) {
        goto LABEL_10;
      }
      unint64_t v38 = "Invalid signature length";
    }

    CBErrorF(-6743, (uint64_t)v38, v27, v28, v29, v30, v31, v32, v39);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }

  int safetyAlertsVersion = self->_safetyAlertsVersion;
  unsigned __int8 v10 = 1;
  while (1)
  {
    [MEMORY[0x189607968] numberWithUnsignedChar:v10];
    int v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v40 objectForKeyedSubscript:v11];
    char v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12) {
      break;
    }
    if ([v12 safetyAlertsSegmentSegmentsTotal] != safetyAlertsSegmentSegmentsTotal)
    {
      if (!a4) {
        goto LABEL_19;
      }
      char v36 = "Invalid value";
      int v37 = -6737;
LABEL_17:
      CBErrorF(v37, (uint64_t)v36, v19, v20, v21, v22, v23, v24, v39);
      goto LABEL_18;
    }

    if ([v12 safetyAlertsVersion] != safetyAlertsVersion)
    {
      if (!a4) {
        goto LABEL_19;
      }
      char v36 = "Invalid version";
      int v37 = -6715;
      goto LABEL_17;
    }

    [v12 safetyAlertsSegmentAlertData];
    BOOL v25 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 appendData:v25];

    [v12 safetyAlertsSegmentSignature];
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 appendData:v26];

    if (safetyAlertsSegmentSegmentsTotal < ++v10) {
      goto LABEL_7;
    }
  }

  if (!a4) {
    goto LABEL_19;
  }
  CBErrorF(-6727, (uint64_t)"Segment %d/%d not found", v13, v14, v15, v16, v17, v18, v10);
LABEL_18:
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:

LABEL_10:
}

- (void)_clearUnparsedProperties
{
  unint64_t discoveryFlags = self->_discoveryFlags;
  if ((discoveryFlags & 0x4000000000LL) != 0)
  {
    if ((discoveryFlags & 0x8000000000LL) != 0) {
      goto LABEL_3;
    }
  }

  else
  {
    self->_airplaySourceFlags = 0;
    if ((discoveryFlags & 0x8000000000LL) != 0)
    {
LABEL_3:
      if ((discoveryFlags & 0x8000000000000LL) != 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }

  self->_airplayTargetFlags = 0;
  self->_airplayTargetIPunsigned int v4 = 0;
  if ((discoveryFlags & 0x8000000000000LL) != 0)
  {
LABEL_4:
    if ((discoveryFlags & 0x40000000000000LL) != 0) {
      goto LABEL_5;
    }
    goto LABEL_21;
  }

- (void)_parseManufacturerPtr:(const char *)a3 end:(const char *)a4
{
  if (a4 - a3 >= 2)
  {
    int v6 = *(unsigned __int16 *)a3;
    unsigned int v4 = a3 + 2;
    int v5 = v6;
    if (v6 == 6)
    {
      -[CBDevice _parseMicrosoftManufacturerPtr:end:](self, "_parseMicrosoftManufacturerPtr:end:", v4);
    }

    else if (v5 == 76)
    {
      -[CBDevice _parseAppleManufacturerPtr:end:](self, "_parseAppleManufacturerPtr:end:", v4);
    }
  }

- (void)_parseAppleManufacturerPtr:(const char *)a3 end:(const char *)a4
{
  if (a4 - a3 >= 2)
  {
    int v5 = a3;
    do
    {
      uint64_t v7 = v5[1] & 0x1F;
      if (a4 - (v5 + 2) < v7) {
        break;
      }
      int v8 = *(unsigned __int8 *)v5;
      v5 += v7 + 2;
      switch(v8)
      {
        case 5:
          -[CBDevice _parseAirDropPtr:end:](self, "_parseAirDropPtr:end:");
          break;
        case 6:
          -[CBDevice _parseHomeKitV1Ptr:end:](self, "_parseHomeKitV1Ptr:end:");
          break;
        case 7:
          -[CBDevice _parseProximityPairingPtr:end:](self, "_parseProximityPairingPtr:end:");
          break;
        case 8:
          -[CBDevice _parseHeySiriPtr:end:](self, "_parseHeySiriPtr:end:");
          break;
        case 9:
          -[CBDevice _parseAirPlayTargetPtr:end:](self, "_parseAirPlayTargetPtr:end:");
          break;
        case 10:
          -[CBDevice _parseAirPlaySourcePtr:end:](self, "_parseAirPlaySourcePtr:end:");
          break;
        case 15:
          -[CBDevice _parseNearbyActionPtr:end:](self, "_parseNearbyActionPtr:end:");
          break;
        case 16:
          -[CBDevice _parseNearbyInfoPtr:end:](self, "_parseNearbyInfoPtr:end:");
          break;
        case 17:
          -[CBDevice _parseHomeKitV2Ptr:end:](self, "_parseHomeKitV2Ptr:end:");
          break;
        case 18:
          -[CBDevice _parseObjectDiscoveryPtr:end:](self, "_parseObjectDiscoveryPtr:end:");
          break;
        case 19:
          -[CBDevice _parseSpatialInteractionPtr:end:](self, "_parseSpatialInteractionPtr:end:");
          break;
        case 21:
          -[CBDevice _parseNearbyActionV2Ptr:end:](self, "_parseNearbyActionV2Ptr:end:");
          break;
        case 22:
          -[CBDevice _parseNearbyInfoV2Ptr:end:](self, "_parseNearbyInfoV2Ptr:end:");
          break;
        case 24:
          -[CBDevice _parseDSInfoPtr:end:](self, "_parseDSInfoPtr:end:");
          break;
        case 26:
          -[CBDevice _parseNearbyActionNoWakePtr:end:](self, "_parseNearbyActionNoWakePtr:end:");
          break;
        default:
          break;
      }
    }

    while (a4 - v5 > 1);
  }

- (void)_parseAirPlaySourcePtr:(const char *)a3 end:(const char *)a4
{
  int v5 = a3;
  BOOL v7 = a4 - a3 > 0;
  if (a4 - a3 >= 1)
  {
    int v5 = a3 + 1;
    char v8 = *a3;
LABEL_10:
    self->_airplaySourceFlags = v8;
    uint64_t v9 = 0x4000000000LL;
    if ((v8 & 8) != 0) {
      goto LABEL_4;
    }
    goto LABEL_11;
  }

  char v8 = 0;
  if (self->_airplaySourceFlags) {
    goto LABEL_10;
  }
LABEL_3:
  uint64_t v9 = 0LL;
  if ((v8 & 8) != 0)
  {
LABEL_4:
    id v23 = 0LL;
    BOOL v7 = 0;
    if (a4 - a3 >= 1 && a4 - v5 >= 1)
    {
      BOOL v7 = 1;
      id v23 = (id)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:v5++ length:1];
    }

    if ((v8 & 0x10) == 0) {
      goto LABEL_18;
    }
    goto LABEL_12;
  }

- (void)_parseAirPlayTargetPtr:(const char *)a3 end:(const char *)a4
{
  int64_t v5 = a4 - a3;
  if (a4 - a3 < 1)
  {
    unsigned __int8 v6 = 0;
    if (!self->_airplayTargetFlags)
    {
LABEL_3:
      uint64_t v8 = 0LL;
      BOOL v10 = v5 > 0 && a4 - a3 > 0;
      if (!v10) {
        goto LABEL_10;
      }
LABEL_20:
      int v13 = *(unsigned __int8 *)a3++;
      unsigned __int8 v11 = v13;
      if (v13 == self->_airplayTargetConfigSeed) {
        goto LABEL_22;
      }
      goto LABEL_21;
    }
  }

  else
  {
    int v7 = *(unsigned __int8 *)a3++;
    unsigned __int8 v6 = v7;
    if (v7 == self->_airplayTargetFlags) {
      goto LABEL_3;
    }
  }

  self->_airplayTargetFlags = v6;
  uint64_t v8 = 0x8000000000LL;
  BOOL v10 = v5 > 0 && a4 - a3 > 0;
  if (v10) {
    goto LABEL_20;
  }
LABEL_10:
  unsigned __int8 v11 = 0;
  if (self->_airplayTargetConfigSeed)
  {
LABEL_21:
    self->_airplayTargetConfigSeed = v11;
    uint64_t v8 = 0x8000000000LL;
  }

- (void)_parseDSInfoPtr:(const char *)a3 end:(const char *)a4
{
  if (a4 - a3 < 1)
  {
    unsigned int v5 = 0;
    uint64_t v6 = 0LL;
    if (!-[CBDevice dsInfoVehicleState](self, "dsInfoVehicleState"))
    {
LABEL_3:
      uint64_t v7 = 0LL;
      uint64_t v8 = (v5 >> 2) & 0xF;
      if ((_DWORD)v8 == -[CBDevice dsInfoVehicleConfidence](self, "dsInfoVehicleConfidence")) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
  }

  else
  {
    unsigned int v5 = *(unsigned __int8 *)a3;
    uint64_t v6 = v5 & 3;
    if ((_DWORD)v6 == -[CBDevice dsInfoVehicleState](self, "dsInfoVehicleState")) {
      goto LABEL_3;
    }
  }

  -[CBDevice setDsInfoVehicleState:](self, "setDsInfoVehicleState:", v6);
  uint64_t v7 = 0x800000000000000LL;
  uint64_t v8 = (v5 >> 2) & 0xF;
  if ((_DWORD)v8 != -[CBDevice dsInfoVehicleConfidence](self, "dsInfoVehicleConfidence"))
  {
LABEL_7:
    -[CBDevice setDsInfoVehicleConfidence:](self, "setDsInfoVehicleConfidence:", v8);
    uint64_t v7 = 0x800000000000000LL;
  }

- (void)_parseHeySiriPtr:(const char *)a3 end:(const char *)a4
{
  unsigned int v5 = a3;
  int64_t v7 = a4 - a3;
  if (a4 - a3 < 2)
  {
    uint64_t v8 = 0LL;
    if (-[CBDevice heySiriPerceptualHash](self, "heySiriPerceptualHash"))
    {
LABEL_3:
      -[CBDevice setHeySiriPerceptualHash:](self, "setHeySiriPerceptualHash:", v8);
      uint64_t v9 = 0x400000000000000LL;
      BOOL v11 = v7 > 1 && a4 - v5 > 0;
      if (!v11) {
        goto LABEL_10;
      }
LABEL_20:
      unsigned int v14 = *(unsigned __int8 *)v5++;
      uint64_t v12 = v14;
      if (v14 == -[CBDevice heySiriSNR](self, "heySiriSNR")) {
        goto LABEL_22;
      }
      goto LABEL_21;
    }
  }

  else
  {
    unsigned int v5 = a3 + 2;
    uint64_t v8 = bswap32(*(unsigned __int16 *)a3) >> 16;
    if ((_DWORD)v8 != -[CBDevice heySiriPerceptualHash](self, "heySiriPerceptualHash")) {
      goto LABEL_3;
    }
  }

  uint64_t v9 = 0LL;
  BOOL v11 = v7 > 1 && a4 - v5 > 0;
  if (v11) {
    goto LABEL_20;
  }
LABEL_10:
  uint64_t v12 = 0LL;
  if (-[CBDevice heySiriSNR](self, "heySiriSNR"))
  {
LABEL_21:
    -[CBDevice setHeySiriSNR:](self, "setHeySiriSNR:", v12);
    uint64_t v9 = 0x400000000000000LL;
  }

- (void)_parseHomeKitV1Ptr:(const char *)a3 end:(const char *)a4
{
  unsigned int v5 = a3;
  int64_t v7 = a4 - a3;
  if (a4 - a3 >= 1)
  {
    unsigned int v5 = a3 + 1;
    int homeKitV1Flags = self->_homeKitV1Flags;
    int v9 = homeKitV1Flags & 0xFE | *a3 & 1;
    if (v9 == homeKitV1Flags) {
      goto LABEL_3;
    }
LABEL_12:
    self->_int homeKitV1Flags = v9;
    uint64_t v10 = 0x400000LL;
    BOOL v12 = v7 > 0 && a4 - v5 > 5;
    if (!v12) {
      goto LABEL_10;
    }
    goto LABEL_19;
  }

  int v14 = self->_homeKitV1Flags;
  LOBYTE(v9) = v14 & 0xFE;
  if ((v14 & 0xFE) != v14) {
    goto LABEL_12;
  }
LABEL_3:
  uint64_t v10 = 0LL;
  BOOL v12 = v7 > 0 && a4 - v5 > 5;
  if (!v12)
  {
LABEL_10:
    int v13 = 0LL;
    goto LABEL_20;
  }

- (void)_parseHomeKitV2Ptr:(const char *)a3 end:(const char *)a4
{
  unsigned int v5 = a3;
  int64_t v7 = a4 - a3;
  if (a4 - a3 < 6)
  {
    uint64_t v8 = 0LL;
  }

  else
  {
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:a3 length:6];
    v5 += 6;
  }

  homeKitV2AccessoryIDData = self->_homeKitV2AccessoryIDData;
  uint64_t v32 = v8;
  uint64_t v10 = homeKitV2AccessoryIDData;
  if (v32 == v10)
  {

    uint64_t v13 = 0LL;
    unsigned int v17 = v32;
  }

  else
  {
    if ((v32 == 0LL) != (v10 != 0LL))
    {
      char v11 = -[NSData isEqual:](v32, "isEqual:", v10);

      BOOL v12 = v32;
      if ((v11 & 1) != 0)
      {
        uint64_t v13 = 0LL;
        BOOL v15 = v7 > 5 && a4 - v5 > 1;
        if (!v15) {
          goto LABEL_14;
        }
LABEL_26:
        int v20 = *(unsigned __int16 *)v5;
        v5 += 2;
        unsigned __int16 v16 = v20;
        if (v20 == self->_homeKitV2StateNumber) {
          goto LABEL_28;
        }
        goto LABEL_27;
      }
    }

    else
    {

      BOOL v12 = v32;
    }

    char v18 = v12;
    unsigned int v17 = self->_homeKitV2AccessoryIDData;
    self->_homeKitV2AccessoryIDData = v18;
    uint64_t v13 = 0x1000000LL;
  }

  BOOL v15 = v7 > 5 && a4 - v5 > 1;
  if (v15) {
    goto LABEL_26;
  }
LABEL_14:
  unsigned __int16 v16 = 0;
  if (self->_homeKitV2StateNumber)
  {
LABEL_27:
    self->_homeKitV2StateNumber = v16;
    uint64_t v13 = 0x1000000LL;
  }

- (void)_parseNearbyActionPtr:(const char *)a3 end:(const char *)a4
{
  if (a4 - a3 < 1)
  {
    char v11 = 0LL;
    *(void *)&v49[4] = 0LL;
    uint64_t v50 = 0LL;
    uint64_t v12 = 0LL;
    uint64_t v13 = 0LL;
    unsigned int v7 = 0;
    int v10 = 0;
    id v51 = 0LL;
    id obj = 0LL;
    v49[0] = 1;
    goto LABEL_6;
  }

  uint64_t v6 = a3 + 1;
  unsigned int v7 = *(unsigned __int8 *)a3;
  int64_t v8 = a4 - (a3 + 1);
  BOOL v9 = v8 > 0;
  if (v8 < 1)
  {
    int v10 = 0;
    if ((v7 & 0x80) == 0) {
      goto LABEL_4;
    }
LABEL_41:
    id obj = 0LL;
    BOOL v9 = 0;
    if (v8 >= 1 && a4 - v6 >= 3)
    {
      id obj = (id)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:v6 length:3];
      v6 += 3;
      BOOL v9 = 1;
    }

    goto LABEL_44;
  }

  uint64_t v6 = a3 + 2;
  int v10 = *((unsigned __int8 *)a3 + 1);
  if ((v7 & 0x80) != 0) {
    goto LABEL_41;
  }
LABEL_4:
  id obj = 0LL;
LABEL_44:
  uint64_t v13 = 0LL;
  uint64_t v12 = 0LL;
  switch(v10)
  {
    case 2:
    case 37:
    case 44:
    case 45:
    case 47:
    case 85:
      if (a4 - v6 <= 0) {
        BOOL v9 = 0;
      }
      if (!v9) {
        goto LABEL_81;
      }
      uint64_t v12 = 0LL;
      unsigned int v34 = *(unsigned __int8 *)v6++;
      uint64_t v13 = v34 >> 4;
      BOOL v9 = 1;
      *(_DWORD *)&v49[8] = 0;
      uint64_t v50 = 0LL;
      *(void *)uint64_t v49 = (v7 & 0x200) == 0;
      goto LABEL_84;
    case 3:
    case 4:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
    case 19:
    case 20:
    case 21:
    case 22:
    case 23:
    case 24:
    case 25:
    case 26:
    case 27:
    case 28:
    case 29:
    case 30:
    case 31:
    case 32:
    case 33:
    case 34:
    case 35:
    case 36:
    case 38:
    case 39:
    case 40:
    case 41:
    case 42:
    case 43:
    case 46:
    case 48:
    case 49:
    case 50:
    case 51:
    case 52:
    case 53:
    case 55:
    case 57:
    case 58:
    case 59:
    case 60:
    case 61:
    case 62:
    case 63:
    case 64:
    case 65:
    case 66:
    case 67:
    case 68:
    case 69:
    case 70:
    case 71:
    case 72:
    case 73:
    case 74:
    case 75:
    case 76:
    case 77:
    case 78:
    case 79:
    case 80:
    case 81:
    case 82:
    case 83:
    case 84:
      goto LABEL_83;
    case 5:
      if (!v9) {
        goto LABEL_82;
      }
      uint64_t v42 = [objc_alloc(MEMORY[0x189603F48]) initWithBytes:v6 length:a4 - v6];
      uint64_t v13 = 0LL;
      uint64_t v12 = 0LL;
      BOOL v9 = 1;
      uint64_t v6 = a4;
      *(_DWORD *)&v49[8] = 0;
      uint64_t v50 = (void *)v42;
      *(void *)uint64_t v49 = (v7 & 0x200) == 0;
      goto LABEL_84;
    case 54:
      if (a4 - v6 <= 2) {
        BOOL v9 = 0;
      }
      if (!v9) {
        goto LABEL_81;
      }
      uint64_t v13 = 0LL;
      uint64_t v12 = *(unsigned __int8 *)v6;
      int v43 = *((unsigned __int8 *)v6 + 1);
      int v44 = *((unsigned __int8 *)v6 + 2);
      v6 += 3;
      *(_DWORD *)&v49[4] = v43;
      *(_DWORD *)&v49[8] = v44;
      uint64_t v50 = 0LL;
      v49[0] = (v7 & 0x200) == 0;
      goto LABEL_84;
    case 56:
      if (a4 - v6 <= 0) {
        BOOL v9 = 0;
      }
      if (!v9)
      {
LABEL_81:
        BOOL v9 = 0;
LABEL_82:
        uint64_t v13 = 0LL;
        uint64_t v12 = 0LL;
LABEL_83:
        *(_DWORD *)&v49[4] = 0;
        *(_DWORD *)&v49[8] = 0;
        uint64_t v50 = 0LL;
        v49[0] = (v7 & 0x200) == 0;
LABEL_84:
        id v51 = 0LL;
        char v11 = 0LL;
        if (!v9) {
          goto LABEL_88;
        }
        uint64_t v35 = (const char *)(a4 - v6);
        if (a4 - v6 < 1) {
          goto LABEL_87;
        }
        goto LABEL_86;
      }

      uint64_t v13 = 0LL;
      uint64_t v12 = 0LL;
      int v45 = *(unsigned __int8 *)v6++;
      v7 |= v45 << 8;
      *(_DWORD *)&v49[8] = 0;
      uint64_t v50 = 0LL;
      *(void *)uint64_t v49 = (v7 & 0x200) == 0;
      if ((v7 & 0x200) == 0) {
        goto LABEL_84;
      }
      if (a4 - v6 > 2)
      {
        id v51 = (id)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:v6 length:3];
        v6 += 3;
        uint64_t v35 = (const char *)(a4 - v6);
        if (a4 - v6 < 1) {
          goto LABEL_87;
        }
LABEL_86:
        char v11 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:v6 length:v35];
        goto LABEL_88;
      }

      id v51 = 0LL;
LABEL_87:
      char v11 = 0LL;
LABEL_88:
      uint64_t v14 = 0x80000LL;
      switch(v10)
      {
        case 0:
          goto LABEL_7;
        case 1:
          uint64_t v14 = 524290LL;
          goto LABEL_7;
        case 2:
          uint64_t v14 = 0x4000000000080000LL;
          goto LABEL_7;
        case 5:
          uint64_t v14 = 0x20000000080000LL;
          goto LABEL_7;
        case 8:
          uint64_t v14 = 532480LL;
          goto LABEL_7;
        case 9:
          uint64_t v14 = 524320LL;
          goto LABEL_7;
        case 10:
          uint64_t v14 = 524800LL;
          goto LABEL_7;
        case 11:
          uint64_t v14 = 524304LL;
          goto LABEL_7;
        case 12:
          uint64_t v14 = 524289LL;
          goto LABEL_7;
        case 13:
          uint64_t v14 = 528384LL;
          goto LABEL_7;
        case 25:
          uint64_t v14 = 526336LL;
          goto LABEL_7;
        case 27:
          uint64_t v14 = 525312LL;
          goto LABEL_7;
        case 28:
          uint64_t v14 = 524292LL;
          goto LABEL_7;
        case 34:
          uint64_t v14 = 268959744LL;
          goto LABEL_7;
        case 37:
          uint64_t v14 = 0x800000080000LL;
          goto LABEL_7;
        case 39:
          uint64_t v14 = 0x10000000080000LL;
          goto LABEL_7;
        case 44:
          self->_discoveryTypesInternal.bitArray[0] |= 0x40u;
          int v10 = 44;
          goto LABEL_6;
        case 45:
          self->_discoveryTypesInternal.bitArray[0] |= 8u;
          int v10 = 45;
          goto LABEL_6;
        case 46:
          self->_discoveryTypesInternal.bitArray[0] |= 1u;
          int v10 = 46;
          goto LABEL_6;
        case 47:
          self->_discoveryTypesInternal.bitArray[1] |= 8u;
          int v10 = 47;
          goto LABEL_6;
        case 48:
          self->_discoveryTypesInternal.bitArray[1] |= 0x80u;
          int v10 = 48;
          goto LABEL_6;
        case 54:
          uint64_t v14 = 0x1000000000080000LL;
          goto LABEL_7;
        case 55:
          self->_discoveryTypesInternal.bitArray[0] |= 4u;
          int v10 = 55;
          goto LABEL_6;
        case 56:
          self->_discoveryTypesInternal.bitArray[1] |= 0x40u;
          int v10 = 56;
          goto LABEL_6;
        case 83:
          self->_discoveryTypesInternal.bitArray[2] |= 4u;
          int v10 = 83;
          goto LABEL_6;
        default:
          if (!"AirDrop") {
            goto LABEL_6;
          }
          int v46 = &off_189FB3A20;
          uint64_t v14 = 0x80000LL;
          break;
      }

      while (*((unsigned __int8 *)v46 - 8) != v10)
      {
        uint64_t v47 = *v46;
        v46 += 3;
        if (!v47) {
          goto LABEL_7;
        }
      }

      int v48 = *((_DWORD *)v46 - 4);
LABEL_6:
      uint64_t v14 = 0x80000LL;
LABEL_7:
      if (-[CBDevice nearbyActionColorCode](self, "nearbyActionColorCode"))
      {
        -[CBDevice setNearbyActionColorCode:](self, "setNearbyActionColorCode:", 0LL);
        uint64_t v15 = v14;
      }

      else
      {
        uint64_t v15 = 0LL;
      }

      -[CBDevice nearbyActionExtraData](self, "nearbyActionExtraData");
      unsigned __int16 v16 = (void *)objc_claimAutoreleasedReturnValue();
      id v17 = v11;
      id v18 = v16;
      if (v17 == v18)
      {

        if (v7 != self->_nearbyActionFlags) {
          goto LABEL_21;
        }
LABEL_14:
        if (v10 == self->_nearbyActionType) {
          goto LABEL_15;
        }
LABEL_22:
        self->_unsigned int nearbyActionType = v10;
        uint64_t v15 = v14;
        if ((v7 & 0x80) == 0) {
          goto LABEL_26;
        }
        goto LABEL_23;
      }

      BOOL v19 = v18;
      if ((v17 == 0LL) == (v18 != 0LL))
      {

LABEL_20:
        -[CBDevice setNearbyActionExtraData:](self, "setNearbyActionExtraData:", v17);
        uint64_t v15 = v14;
        if (v7 != self->_nearbyActionFlags) {
          goto LABEL_21;
        }
        goto LABEL_14;
      }

      char v20 = [v17 isEqual:v18];

      if ((v20 & 1) == 0) {
        goto LABEL_20;
      }
      if (v7 == self->_nearbyActionFlags) {
        goto LABEL_14;
      }
LABEL_21:
      self->_uint64_t nearbyActionFlags = v7;
      uint64_t v15 = v14;
      if (v10 != self->_nearbyActionType) {
        goto LABEL_22;
      }
LABEL_15:
      if ((v7 & 0x80) == 0)
      {
LABEL_26:
        int v26 = v51;
        if ((v49[0] & 1) != 0) {
          goto LABEL_27;
        }
LABEL_56:
        nearbyActionTargetAuthTag = self->_nearbyActionTargetAuthTag;
        int v37 = v26;
        unint64_t v38 = nearbyActionTargetAuthTag;
        if (v37 != v38)
        {
          uint64_t v39 = v38;
          if ((v37 == 0LL) != (v38 != 0LL))
          {
            char v40 = -[NSData isEqual:](v37, "isEqual:", v38);

            if ((v40 & 1) != 0)
            {
              int v26 = v51;
              if ((_DWORD)v13 != -[CBDevice nearbyActionDeviceClass](self, "nearbyActionDeviceClass")) {
                goto LABEL_66;
              }
              goto LABEL_28;
            }
          }

          else
          {
          }

          int v26 = v51;
          objc_storeStrong((id *)&self->_nearbyActionTargetAuthTag, v51);
          v15 |= v14;
          if ((_DWORD)v13 != -[CBDevice nearbyActionDeviceClass](self, "nearbyActionDeviceClass")) {
            goto LABEL_66;
          }
          goto LABEL_28;
        }

        if ((_DWORD)v13 != -[CBDevice nearbyActionDeviceClass](self, "nearbyActionDeviceClass")) {
          goto LABEL_66;
        }
LABEL_28:
        if ((_DWORD)v12 == -[CBDevice dsActionFlags](self, "dsActionFlags")) {
          goto LABEL_29;
        }
        goto LABEL_67;
      }

- (void)_parseNearbyActionV2Ptr:(const char *)a3 end:(const char *)a4
{
  if (a4 - a3 < 1)
  {
    uint64_t v5 = 0LL;
    goto LABEL_9;
  }

  uint64_t v5 = *(unsigned __int8 *)a3;
  if ((uint64_t)&a4[~(unint64_t)a3] <= 0)
  {
LABEL_9:
    id v15 = 0LL;
    uint64_t v6 = 0LL;
    uint64_t v8 = 0LL;
    BOOL v7 = (v5 & 1) == 0;
    goto LABEL_10;
  }

  id v15 = 0LL;
  uint64_t v6 = *((unsigned __int8 *)a3 + 1);
  BOOL v7 = (v5 & 1) == 0;
  if ((v5 & 1) != 0 && a4 - (a3 + 2) >= 3) {
    id v15 = (id)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:a3 + 2 length:3];
  }
  uint64_t v8 = 0LL;
  switch((int)v6)
  {
    case '&':
      uint64_t v8 = 0x400000000LL;
      break;
    case ')':
      uint64_t v8 = 0x20000LL;
      break;
    case '2':
      uint64_t v8 = 256LL;
      break;
    case '3':
      uint64_t v8 = 8LL;
      break;
    default:
      break;
  }

- (void)_parseNearbyInfoV2Ptr:(const char *)a3 end:(const char *)a4
{
  if (a4 - a3 >= 1)
  {
    if ((uint64_t)&a4[~(unint64_t)a3] < 1 || a4 - (a3 + 2) < 3)
    {
      uint64_t v9 = 0LL;
    }

    else
    {
      int v7 = *(unsigned __int8 *)a3;
      int v8 = *((unsigned __int8 *)a3 + 1);
      uint64_t v9 = (NSData *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:a3 + 2 length:3];
      if (a4 - (a3 + 5) >= 3)
      {
        id v31 = v9;
        uint64_t v10 = [objc_alloc(MEMORY[0x189603F48]) initWithBytes:a3 + 5 length:3];
        if (!v10)
        {
LABEL_47:
          uint64_t v9 = v31;
          goto LABEL_10;
        }

        id v11 = (void *)v10;
        id v12 = a3 + 8;
        if (a4 - v12 < 2)
        {
          uint64_t v13 = 0LL;
          if ((v7 & 4) == 0) {
            goto LABEL_14;
          }
        }

        else
        {
          uint64_t v13 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:v12 length:2];
          if ((v7 & 4) == 0)
          {
LABEL_14:
            int v14 = -[CBDevice nearbyInfoV2Flags](self, "nearbyInfoV2Flags");
            BOOL v15 = v7 != v14;
            if (v7 == v14)
            {
              if (v8 == -[CBDevice nearbyInfoV2EncryptedFlags](self, "nearbyInfoV2EncryptedFlags")) {
                goto LABEL_21;
              }
            }

            else
            {
              if ((v7 & 4) != (-[CBDevice nearbyInfoV2Flags](self, "nearbyInfoV2Flags") & 4)) {
                self->_changedTypesInternal.bitArray[2] |= 8u;
              }
              self->_nearbyInfoV2Flags = v7;
              if (v8 == -[CBDevice nearbyInfoV2EncryptedFlags](self, "nearbyInfoV2EncryptedFlags"))
              {
LABEL_21:
                -[CBDevice nearbyInfoV2AuthTagData](self, "nearbyInfoV2AuthTagData");
                unsigned __int16 v16 = (void *)objc_claimAutoreleasedReturnValue();
                id v31 = v31;
                id v17 = v16;
                if (v31 == v17)
                {

                  nearbyInfoV2AuthTagData = v31;
                }

                else
                {
                  if ((v31 == 0LL) != (v17 != 0LL))
                  {
                    char v18 = -[NSData isEqual:](v31, "isEqual:", v17);

                    if ((v18 & 1) != 0)
                    {
LABEL_29:
                      -[CBDevice nearbyInfoV2AuthIntegrityTagData](self, "nearbyInfoV2AuthIntegrityTagData");
                      unsigned __int16 v21 = (void *)objc_claimAutoreleasedReturnValue();
                      id v22 = v11;
                      id v23 = v21;
                      if (v22 == v23)
                      {

                        goto LABEL_36;
                      }

                      unint64_t v24 = v23;
                      if (v23)
                      {
                        char v25 = [v22 isEqual:v23];

                        if ((v25 & 1) != 0)
                        {
LABEL_36:
                          -[CBDevice nearbyInfoV2EncryptedData](self, "nearbyInfoV2EncryptedData");
                          int v26 = (void *)objc_claimAutoreleasedReturnValue();
                          id v27 = v13;
                          id v28 = v26;
                          if (v27 == v28)
                          {
                          }

                          else
                          {
                            unsigned __int8 v29 = v28;
                            if ((v27 == 0LL) == (v28 != 0LL))
                            {

LABEL_44:
                              objc_storeStrong((id *)&self->_nearbyInfoV2EncryptedData, v13);
                              self->_discoveryTypesInternal.bitArray[0] |= 0x10u;
LABEL_45:
                              self->_changedTypesInternal.bitArray[0] |= 0x10u;
LABEL_46:

                              goto LABEL_47;
                            }

                            char v30 = [v27 isEqual:v28];

                            if ((v30 & 1) == 0) {
                              goto LABEL_44;
                            }
                          }

                          self->_discoveryTypesInternal.bitArray[0] |= 0x10u;
                          if (!v15) {
                            goto LABEL_46;
                          }
                          goto LABEL_45;
                        }
                      }

                      else
                      {
                      }

                      objc_storeStrong((id *)&self->_nearbyInfoV2AuthIntegrityTagData, v11);
                      BOOL v15 = 1;
                      goto LABEL_36;
                    }
                  }

                  else
                  {
                  }

                  char v20 = v31;
                  nearbyInfoV2AuthTagData = self->_nearbyInfoV2AuthTagData;
                  self->_nearbyInfoV2AuthTagData = v20;
                  BOOL v15 = 1;
                }

                goto LABEL_29;
              }
            }

            self->_nearbyInfoV2EncryptedFlags = v8;
            BOOL v15 = 1;
            goto LABEL_21;
          }
        }

        self->_discoveryTypesInternal.bitArray[2] |= 8u;
        goto LABEL_14;
      }
    }

- (void)_parseNearbyActionNoWakePtr:(const char *)a3 end:(const char *)a4
{
  if (a4 - a3 < 1)
  {
    int v6 = 0;
    goto LABEL_9;
  }

  int v6 = *(unsigned __int8 *)a3;
  if ((v6 & 1) == 0)
  {
LABEL_9:
    int v8 = 0;
    uint64_t v9 = 0LL;
    uint64_t v10 = 0LL;
    goto LABEL_14;
  }

  if (a4 - (a3 + 1) < 1)
  {
    uint64_t v9 = 0LL;
    int v8 = 0;
  }

  else
  {
    int v8 = *((unsigned __int8 *)a3 + 1);
    if (a4 - (a3 + 2) >= 3)
    {
      uint64_t v9 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:a3 + 2 length:3];
      uint64_t v10 = 0LL;
      if ((v8 & 1) != 0)
      {
        id v11 = a3 + 5;
        if (a4 - v11 >= 1) {
          uint64_t v10 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:v11 length:1];
        }
      }

      goto LABEL_13;
    }

    uint64_t v9 = 0LL;
  }

  uint64_t v10 = 0LL;
LABEL_13:
  self->_discoveryTypesInternal.bitArray[1] |= 1u;
LABEL_14:
  self->_discoveryTypesInternal.bitArray[1] |= 2u;
  if (v6 != -[CBDevice nearbyActionNoWakeType](self, "nearbyActionNoWakeType")) {
    self->_nearbyActionNoWakeType = v6;
  }
  if (v8 != -[CBDevice nearbyActionNWPrecisionFindingStatus](self, "nearbyActionNWPrecisionFindingStatus")) {
    self->_nearbyActionNWPrecisionFindingStatus = v8;
  }
  -[CBDevice nearbyActionNoWakeAuthTagData](self, "nearbyActionNoWakeAuthTagData");
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  id v23 = v9;
  id v13 = v12;
  if (v23 != v13)
  {
    if ((v23 == 0LL) != (v13 != 0LL))
    {
      char v14 = [v23 isEqual:v13];

      if ((v14 & 1) != 0)
      {
        if ((v8 & 1) == 0) {
          goto LABEL_35;
        }
        goto LABEL_27;
      }
    }

    else
    {
    }

    BOOL v15 = (NSData *)v23;
    nearbyActionNoWakeAuthTagData = self->_nearbyActionNoWakeAuthTagData;
    self->_nearbyActionNoWakeAuthTagData = v15;

    if ((v8 & 1) == 0) {
      goto LABEL_35;
    }
    goto LABEL_27;
  }

  if ((v8 & 1) == 0) {
    goto LABEL_35;
  }
LABEL_27:
  -[CBDevice nearbyActionNoWakeConfigData](self, "nearbyActionNoWakeConfigData");
  id v17 = (void *)objc_claimAutoreleasedReturnValue();
  nearbyActionNoWakeConfigData = v10;
  BOOL v19 = v17;
  if (nearbyActionNoWakeConfigData == v19)
  {
  }

  else
  {
    char v20 = v19;
    if ((nearbyActionNoWakeConfigData == 0LL) == (v19 != 0LL))
    {
    }

    else
    {
      char v21 = -[NSData isEqual:](nearbyActionNoWakeConfigData, "isEqual:", v19);

      if ((v21 & 1) != 0) {
        goto LABEL_35;
      }
    }

    id v22 = nearbyActionNoWakeConfigData;
    nearbyActionNoWakeConfigData = self->_nearbyActionNoWakeConfigData;
    self->_nearbyActionNoWakeConfigData = v22;
  }

LABEL_35:
}

- (void)_parseNearbyInfoPtr:(const char *)a3 end:(const char *)a4
{
  if (a4 - a3 < 1)
  {
    unsigned int v9 = 0;
    id obj = 0LL;
    int v8 = 0;
    goto LABEL_29;
  }

  unsigned int v7 = *(unsigned __int8 *)a3;
  int v8 = v7 & 0xF;
  unsigned int v9 = (v7 >> 2) & 4 | (v7 >> 6) & 1 | (v7 >> 4) & 2;
  uint64_t v10 = (char *)(a3 + 2);
  unsigned int v11 = *((unsigned __int8 *)a3 + 1);
  if ((v11 & 0x80u) == 0) {
    int v12 = (v7 >> 2) & 4 | (v7 >> 6) & 1 | (v7 >> 4) & 2;
  }
  else {
    int v12 = v9 | 8;
  }
  unsigned int v13 = v11 & 0x20 | (v11 >> 2) & 0x10 | v12 & 0xFFFFFFBF | (((v11 >> 4) & 1) << 6);
  unsigned int v9 = (v11 << 8) & 0x200 | (((v11 & 4) != 0) << 8) | (((v11 >> 3) & 1) << 7) | v13;
  if ((v13 & 0x40) == 0)
  {
    id obj = 0LL;
    if ((v11 & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_13;
  }

  if (a4 - v10 < 3)
  {
LABEL_28:
    id obj = 0LL;
    goto LABEL_29;
  }

  id obj = (id)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:a3 + 2 length:3];
  uint64_t v10 = (char *)(a3 + 5);
  if ((v11 & 1) == 0)
  {
LABEL_8:
    if ((v9 & 0x1000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_17;
  }

- (void)_parseObjectDiscoveryPtr:(const char *)a3 end:(const char *)a4
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  if (a4 - a3 >= 1)
  {
    unsigned int v7 = a3 + 1;
    unint64_t v8 = *(unsigned __int8 *)a3;
    uint64_t v9 = (v8 >> 4) & 3;
    if ((_DWORD)v9 == 3) {
      unsigned int v10 = 0;
    }
    else {
      unsigned int v10 = dword_18702DA80[v9];
    }
    unsigned int v11 = self->_btAddressData;
    if (-[NSData length](v11, "length") != 6) {
      goto LABEL_19;
    }
    if (a4 - v7 < 22)
    {
      uint64_t v17 = -[NSData bytes](v11, "bytes");
      __int16 v18 = *(_WORD *)(v17 + 4);
      int v20 = *(_DWORD *)v17;
      __int16 v21 = v18;
      if (a4 - v7 >= 1) {
        LOBYTE(v20) = v20 & 0x3F | (*v7 << 6);
      }
      char v14 = (NSData *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:&v20 length:6];
      self->_objectDiscoveryBatteryState = v8 >> 6;
      self->_objectDiscoveryMode = 1;
      self->_uint64_t objectDiscoveryProductID = v10;
      if (!v14)
      {
        uint64_t v16 = 0x20000000000LL;
        goto LABEL_18;
      }

      objectDiscoveryNearOwnerID = self->_objectDiscoveryNearOwnerID;
      self->_objectDiscoveryNearOwnerID = v14;
      uint64_t v16 = 0x20000000000LL;
    }

    else
    {
      uint64_t v12 = -[NSData bytes](v11, "bytes");
      __int16 v13 = *(_WORD *)(v12 + 4);
      int v20 = *(_DWORD *)v12;
      __int16 v21 = v13;
      *(_OWORD *)uint64_t v22 = *(_OWORD *)v7;
      *(void *)&v22[14] = *(void *)(v7 + 14);
      if (a4 - (a3 + 23) >= 1) {
        LOBYTE(v20) = v20 & 0x3F | (a3[23] << 6);
      }
      char v14 = (NSData *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:&v20 length:28];
      self->_objectDiscoveryBatteryState = v8 >> 6;
      self->_objectDiscoveryMode = 2;
      self->_uint64_t objectDiscoveryProductID = v10;
      if (!v14)
      {
        uint64_t v16 = 0x40000000000LL;
        goto LABEL_18;
      }

      objectDiscoveryNearOwnerID = self->_objectDiscoveryPublicKeyData;
      self->_objectDiscoveryPublicKeyData = v14;
      uint64_t v16 = 0x40000000000LL;
    }

    double v19 = v14;

LABEL_18:
    self->_discoveryFlags |= v16;
LABEL_19:
  }

- (void)_parseProximityPairingPtr:(const char *)a3 end:(const char *)a4
{
  int64_t v5 = a4 - a3;
  if (a4 - a3 >= 1)
  {
    int v7 = *(unsigned __int8 *)a3++;
    int v6 = v7;
    int proximityPairingSubType = self->_proximityPairingSubType;
    if (v7 == proximityPairingSubType) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  int v6 = 255;
  int proximityPairingSubType = self->_proximityPairingSubType;
  if (proximityPairingSubType != 255) {
LABEL_3:
  }
    self->_int proximityPairingSubType = v6;
LABEL_4:
  BOOL v10 = v5 > 0 && a4 - a3 > 1;
  if (!v10)
  {
    unsigned int v11 = 0;
    unsigned int proximityPairingProductID = self->_proximityPairingProductID;
    if (!proximityPairingProductID) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }

  unsigned int v12 = *(unsigned __int16 *)a3;
  a3 += 2;
  unsigned int v11 = v12;
  unsigned int proximityPairingProductID = self->_proximityPairingProductID;
  if (v12 != proximityPairingProductID) {
LABEL_14:
  }
    self->_unsigned int proximityPairingProductID = v11;
LABEL_15:
  unint64_t discoveryFlags = self->_discoveryFlags;
  if (v10)
  {
    switch(v6)
    {
      case 0:
        -[CBDevice _parseProximityPairingWxSetupPtr:end:](self, "_parseProximityPairingWxSetupPtr:end:", a3);
        break;
      case 1:
        -[CBDevice _parseProximityPairingWxStatusPtr:end:](self, "_parseProximityPairingWxStatusPtr:end:", a3);
        break;
      case 4:
        -[CBDevice _parseProximityPairingAirPodsMismatchedPtr:end:]( self,  "_parseProximityPairingAirPodsMismatchedPtr:end:",  a3);
        break;
      case 5:
        -[CBDevice _parseProximityPairingObjectSetupPtr:end:](self, "_parseProximityPairingObjectSetupPtr:end:", a3);
        break;
      case 6:
        -[CBDevice _parseProximityPairingAccessoryStatusPtr:end:]( self,  "_parseProximityPairingAccessoryStatusPtr:end:",  a3);
        break;
      case 7:
        -[CBDevice _parseProximityPairingV2Ptr:end:](self, "_parseProximityPairingV2Ptr:end:", a3);
        break;
      case 8:
        -[CBDevice _parseProximityPairingFindMyAccessoryStatusPtr:end:]( self,  "_parseProximityPairingFindMyAccessoryStatusPtr:end:",  a3);
        break;
      case 9:
        -[CBDevice _parseProximityPairingObjectSetupPtrV2:end:](self, "_parseProximityPairingObjectSetupPtrV2:end:", a3);
        break;
      default:
        break;
    }
  }

  BOOL v15 = v11 == proximityPairingProductID && v6 == proximityPairingSubType;
  unint64_t v16 = self->_discoveryFlags;
  unint64_t v17 = v16 ^ discoveryFlags;
  uint64_t v18 = v16 & 0x1C080;
  if (v15) {
    uint64_t v19 = 0LL;
  }
  else {
    uint64_t v19 = v16 & 0x1C080;
  }
  unint64_t v20 = self->_changeFlags | v17 | v19;
  self->_unint64_t changeFlags = v20;
}

- (void)_parseProximityPairingWxSetupPtr:(const char *)a3 end:(const char *)a4
{
  int64_t v7 = a4 - a3;
  int64_t v8 = a4 - a3 - 6;
  if (v8 < 1)
  {
    uint64_t v9 = 0LL;
    uint64_t v11 = 6LL;
    uint64_t v10 = v8;
  }

  else
  {
    uint64_t v9 = *((unsigned __int8 *)a3 + 6);
    uint64_t v10 = v7 - 7;
    uint64_t v11 = 7LL;
  }

  BOOL v12 = v8 > 0;
  __int16 v13 = &a3[v11];
  unint64_t deviceFlags = self->_deviceFlags;
  uint64_t v28 = 0LL;
  -[CBDevice _parseStatusOne:deviceFlags:primaryPlacement:secondaryPlacement:]( self,  "_parseStatusOne:deviceFlags:primaryPlacement:secondaryPlacement:",  v9,  &deviceFlags,  (char *)&v28 + 4,  &v28);
  unint64_t v14 = 0LL;
  uint64_t v15 = 3LL;
  if (!v12 || v10 <= 2) {
    uint64_t v15 = 0LL;
  }
  unint64_t v16 = &v13[v15];
  uint64_t v17 = a4 - v16;
  if (v12 && v10 > 2 && v17 >= 1)
  {
    char v18 = *v16++;
    unint64_t v14 = (unint64_t)(v18 & 8) << 33;
    uint64_t v17 = a4 - v16;
  }

  unint64_t deviceFlags = deviceFlags & 0xFFFFFFEFFFFFFFFFLL | v14;
  if (v17 >= 1)
  {
    uint64_t v19 = *(unsigned __int8 *)v16;
    int v20 = -[CBDevice colorInfo](self, "colorInfo");
    BOOL v21 = v20 != v19;
    if (v20 == (_DWORD)v19) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }

  uint64_t v19 = 0LL;
  int v26 = -[CBDevice colorInfo](self, "colorInfo");
  BOOL v21 = v26 != 0;
  if (v26) {
LABEL_11:
  }
    -[CBDevice setColorInfo:](self, "setColorInfo:", v19, deviceFlags);
LABEL_12:
  if (deviceFlags == self->_deviceFlags)
  {
    int v22 = HIDWORD(v28);
    if (v22 == -[CBDevice proximityPairingPrimaryPlacement](self, "proximityPairingPrimaryPlacement")) {
      goto LABEL_14;
    }
  }

  else
  {
    self->_unint64_t deviceFlags = deviceFlags;
    BOOL v21 = 1;
    int v24 = HIDWORD(v28);
    if (v24 == -[CBDevice proximityPairingPrimaryPlacement](self, "proximityPairingPrimaryPlacement"))
    {
LABEL_14:
      int v23 = v28;
      if (v23 == -[CBDevice proximityPairingSecondaryPlacement]( self,  "proximityPairingSecondaryPlacement",  deviceFlags)) {
        goto LABEL_15;
      }
LABEL_19:
      -[CBDevice setProximityPairingSecondaryPlacement:]( self,  "setProximityPairingSecondaryPlacement:",  v28);
      self->_discoveryFlags |= 0x4000uLL;
      goto LABEL_20;
    }
  }

  -[CBDevice setProximityPairingPrimaryPlacement:]( self,  "setProximityPairingPrimaryPlacement:",  HIDWORD(v28),  deviceFlags);
  BOOL v21 = 1;
  int v25 = v28;
  if (v25 != -[CBDevice proximityPairingSecondaryPlacement](self, "proximityPairingSecondaryPlacement")) {
    goto LABEL_19;
  }
LABEL_15:
  self->_discoveryFlags |= 0x4000uLL;
  if (v21) {
LABEL_20:
  }
    self->_changeFlags |= 0x80000004000uLL;
}

- (void)_parseProximityPairingWxStatusPtr:(const char *)a3 end:(const char *)a4
{
  int64_t v5 = a3;
  int64_t v7 = a4 - a3;
  if (a4 - a3 < 1)
  {
    uint64_t v8 = 0LL;
    uint64_t v9 = v7;
  }

  else
  {
    int64_t v5 = a3 + 1;
    uint64_t v8 = *(unsigned __int8 *)a3;
    uint64_t v9 = a4 - v5;
  }

  BOOL v10 = v7 > 0;
  unint64_t deviceFlags = self->_deviceFlags;
  uint64_t v22 = 0LL;
  -[CBDevice _parseStatusOne:deviceFlags:primaryPlacement:secondaryPlacement:]( self,  "_parseStatusOne:deviceFlags:primaryPlacement:secondaryPlacement:",  v8,  &deviceFlags,  (char *)&v22 + 4,  &v22);
  unint64_t v11 = 0LL;
  uint64_t v12 = 2LL;
  if (!v10 || v9 <= 1) {
    uint64_t v12 = 0LL;
  }
  if (v10 && v9 > 1)
  {
    __int16 v13 = &v5[v12];
    if (a4 - v13 >= 1) {
      unint64_t v11 = (unint64_t)(*v13 & 8) << 33;
    }
  }

  unint64_t v14 = deviceFlags & 0xFFFFFFEFFFFFFFFFLL | v11;
  unint64_t deviceFlags = v14;
  unint64_t v15 = self->_deviceFlags;
  BOOL v16 = v14 != v15;
  if (v14 == v15)
  {
    int v17 = HIDWORD(v22);
    if (v17 != -[CBDevice proximityPairingPrimaryPlacement](self, "proximityPairingPrimaryPlacement", deviceFlags)) {
      goto LABEL_16;
    }
  }

  else
  {
    self->_unint64_t deviceFlags = v14;
    int v19 = HIDWORD(v22);
    if (v19 != -[CBDevice proximityPairingPrimaryPlacement](self, "proximityPairingPrimaryPlacement", deviceFlags))
    {
LABEL_16:
      -[CBDevice setProximityPairingPrimaryPlacement:](self, "setProximityPairingPrimaryPlacement:", HIDWORD(v22));
      BOOL v16 = 1;
      int v20 = v22;
      if (v20 != -[CBDevice proximityPairingSecondaryPlacement](self, "proximityPairingSecondaryPlacement")) {
        goto LABEL_17;
      }
      goto LABEL_13;
    }
  }

  int v18 = v22;
  if (v18 != -[CBDevice proximityPairingSecondaryPlacement](self, "proximityPairingSecondaryPlacement"))
  {
LABEL_17:
    -[CBDevice setProximityPairingSecondaryPlacement:]( self,  "setProximityPairingSecondaryPlacement:",  v22);
    self->_discoveryFlags |= 0x8000uLL;
    goto LABEL_18;
  }

- (void)_parseStatusOne:(unsigned __int8)a3 deviceFlags:(unint64_t *)a4 primaryPlacement:(int *)a5 secondaryPlacement:(int *)a6
{
  if (self->_proximityPairingProductID == 8202)
  {
    int v6 = (a3 >> 5) & 3;
    if (v6 == 1) {
      goto LABEL_15;
    }
    goto LABEL_12;
  }

  unint64_t v7 = *a4 & 0xFFFFFFF7FFFFFFFFLL | ((unint64_t)(a3 & 1) << 35);
  *a4 = v7;
  int v8 = (a3 >> 3) & 3;
  if (v8 == 1) {
    goto LABEL_8;
  }
  if (v8 != 3)
  {
    if (v8 != 2)
    {
LABEL_9:
      unint64_t v9 = *a4 & 0xFFFFFFBFFFFFFFFFLL;
      goto LABEL_11;
    }

    int v8 = 3;
LABEL_8:
    *a6 = v8;
    goto LABEL_9;
  }

  unint64_t v9 = v7 | 0x4000000000LL;
LABEL_11:
  *a4 = v9 & 0xFFFFFFF9FFFFFFFFLL | ((((unint64_t)(a3 & 0x20) >> 5) & 1) << 34) | ((((unint64_t)(a3 & 0x40) >> 6) & 1) << 33);
  int v6 = (a3 >> 1) & 3;
  if (v6 == 1) {
    goto LABEL_15;
  }
LABEL_12:
  if (v6 != 3)
  {
    if (v6 != 2)
    {
LABEL_16:
      *a4 = *a4 & 0xFFFFFFDEFFFFFFFFLL | ((((unint64_t)(a3 & 0x80) >> 7) & 1) << 32);
      return;
    }

    int v6 = 3;
LABEL_15:
    *a5 = v6;
    goto LABEL_16;
  }

  *a4 = *a4 & 0xFFFFFFDEFFFFFFFFLL | 0x2000000000LL | ((((unint64_t)(a3 & 0x80) >> 7) & 1) << 32);
}

- (void)_parseProximityPairingAirPodsMismatchedPtr:(const char *)a3 end:(const char *)a4
{
  int64_t v5 = a3;
  int64_t v7 = a4 - a3;
  if (a4 - a3 < 1)
  {
    uint64_t v8 = 0LL;
    unint64_t v9 = (const char *)v7;
  }

  else
  {
    int64_t v5 = a3 + 1;
    uint64_t v8 = *(unsigned __int8 *)a3;
    unint64_t v9 = (const char *)(a4 - v5);
  }

  unint64_t deviceFlags = self->_deviceFlags;
  uint64_t v44 = 0LL;
  -[CBDevice _parseStatusOne:deviceFlags:primaryPlacement:secondaryPlacement:]( self,  "_parseStatusOne:deviceFlags:primaryPlacement:secondaryPlacement:",  v8,  &deviceFlags,  (char *)&v44 + 4,  &v44);
  BOOL v11 = v7 > 0 && (uint64_t)v9 > 0;
  if (!v11)
  {
    char v12 = 0;
    goto LABEL_15;
  }

  char v13 = *v5++;
  char v12 = v13;
  if (v13 != -1)
  {
    if (v12 < 0)
    {
      int v14 = 256;
      goto LABEL_16;
    }

- (void)_parseProximityPairingObjectSetupPtr:(const char *)a3 end:(const char *)a4
{
  if (a4 - a3 < 1)
  {
    int v12 = 0;
    unsigned int v7 = 0;
LABEL_9:
    int v9 = 0;
    int v10 = 0;
LABEL_11:
    int v14 = 0LL;
    goto LABEL_12;
  }

  unsigned int v7 = *(unsigned __int8 *)a3;
  if ((uint64_t)&a4[~(unint64_t)a3] < 1)
  {
    int v12 = 0;
    goto LABEL_9;
  }

  unsigned int v8 = *((unsigned __int8 *)a3 + 1);
  int v9 = (v8 >> 2) & 3;
  int v10 = v8 & 3;
  if (a4 - a3 - 2 < 1)
  {
    int v12 = 0;
    goto LABEL_11;
  }

  BOOL v11 = a3 + 3;
  int v12 = *((unsigned __int8 *)a3 + 2);
  int64_t v13 = a4 - (a3 + 3);
  if ((v7 & 0x10) != 0 && v13 >= 7)
  {
    int v14 = (void *)[objc_alloc(NSString) initWithBytes:a3 + 3 length:7 encoding:4];
    BOOL v11 = a3 + 10;
    int64_t v13 = a4 - (a3 + 10);
  }

  else
  {
    int v14 = 0LL;
    if ((v7 & 0x10) == 0)
    {
      int v15 = 0LL;
      goto LABEL_13;
    }
  }

  if (v13 < 1)
  {
LABEL_12:
    int v15 = 0LL;
    goto LABEL_13;
  }

  else {
    size_t v27 = v13;
  }
  int v15 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithBytes:length:encoding:",  v11,  strnlen(v11, v27),  4);
LABEL_13:
  if (v7 != self->_objectSetupFlags)
  {
    self->_objectSetupFlags = v7;
    uint64_t v16 = 0x10000LL;
    if (v9 == self->_objectSetupBatteryPerformance) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }

  uint64_t v16 = 0LL;
  if (v9 != self->_objectSetupBatteryPerformance)
  {
LABEL_17:
    self->_objectSetupBatteryPerformance = v9;
    uint64_t v16 = 0x10000LL;
  }

- (void)_parseProximityPairingAccessoryStatusPtr:(const char *)a3 end:(const char *)a4
{
  int64_t v5 = a3;
  int64_t v7 = a4 - a3;
  if (a4 - a3 < 1)
  {
    unsigned int v8 = 0;
  }

  else
  {
    int64_t v5 = a3 + 1;
    unsigned int v8 = *(unsigned __int8 *)a3;
  }

  if ((v8 & 7) != -[CBDevice accessoryStatusLidOpenCount](self, "accessoryStatusLidOpenCount"))
  {
    -[CBDevice setAccessoryStatusLidOpenCount:](self, "setAccessoryStatusLidOpenCount:", v8 & 7);
    uint64_t v9 = 0x80000000080LL;
    uint64_t v10 = (v8 >> 3) & 7;
    if (-[CBDevice accessoryStatusFlags](self, "accessoryStatusFlags") == (_DWORD)v10) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }

  uint64_t v9 = 0LL;
  uint64_t v10 = (v8 >> 3) & 7;
  if (-[CBDevice accessoryStatusFlags](self, "accessoryStatusFlags") != (_DWORD)v10)
  {
LABEL_8:
    -[CBDevice setAccessoryStatusFlags:](self, "setAccessoryStatusFlags:", v10);
    uint64_t v9 = 0x80000000080LL;
  }

- (void)_parseProximityPairingV2Ptr:(const char *)a3 end:(const char *)a4
{
  int64_t v5 = a3;
  int64_t v7 = a4 - a3;
  if (a4 - a3 < 1)
  {
    uint64_t v8 = 0LL;
    uint64_t v9 = (const char *)v7;
  }

  else
  {
    int64_t v5 = a3 + 1;
    uint64_t v8 = *(unsigned __int8 *)a3;
    uint64_t v9 = (const char *)(a4 - v5);
  }

  unint64_t deviceFlags = self->_deviceFlags;
  uint64_t v38 = 0LL;
  -[CBDevice _parseStatusOne:deviceFlags:primaryPlacement:secondaryPlacement:]( self,  "_parseStatusOne:deviceFlags:primaryPlacement:secondaryPlacement:",  v8,  &deviceFlags,  (char *)&v38 + 4,  &v38);
  BOOL v11 = v7 > 0 && (uint64_t)v9 > 0;
  if (!v11)
  {
    char v12 = 0;
    goto LABEL_15;
  }

  char v13 = *v5++;
  char v12 = v13;
  if (v13 != -1)
  {
    if (v12 < 0)
    {
      int v14 = 256;
      goto LABEL_16;
    }

- (void)_parseProximityPairingFindMyAccessoryStatusPtr:(const char *)a3 end:(const char *)a4
{
  if (a4 - a3 >= 1)
  {
    char v4 = *a3++;
    int v5 = v4 & 3;
    if (v5 == self->_peerStatusFlag) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  LOBYTE(v5) = 0;
  if (self->_peerStatusFlag)
  {
LABEL_3:
    self->_peerStatusFlag = v5;
    self->_changedTypesInternal.bitArray[1] |= 4u;
  }

- (void)_parseProximityPairingObjectSetupPtrV2:(const char *)a3 end:(const char *)a4
{
  if (a4 - a3 < 1)
  {
    int v12 = 0;
    unsigned int v7 = 0;
LABEL_9:
    int v9 = 0;
    int v10 = 0;
LABEL_11:
    int v14 = 0LL;
    goto LABEL_12;
  }

  unsigned int v7 = *(unsigned __int8 *)a3;
  if ((uint64_t)&a4[~(unint64_t)a3] < 1)
  {
    int v12 = 0;
    goto LABEL_9;
  }

  unsigned int v8 = *((unsigned __int8 *)a3 + 1);
  int v9 = (v8 >> 2) & 3;
  int v10 = v8 & 3;
  if (a4 - a3 - 2 < 1)
  {
    int v12 = 0;
    goto LABEL_11;
  }

  BOOL v11 = a3 + 3;
  int v12 = *((unsigned __int8 *)a3 + 2);
  int64_t v13 = a4 - (a3 + 3);
  if ((v7 & 0x10) != 0 && v13 >= 7)
  {
    int v14 = (void *)[objc_alloc(NSString) initWithBytes:a3 + 3 length:7 encoding:4];
    BOOL v11 = a3 + 10;
    int64_t v13 = a4 - (a3 + 10);
  }

  else
  {
    int v14 = 0LL;
    if ((v7 & 0x10) == 0)
    {
      int v15 = 0LL;
      goto LABEL_13;
    }
  }

  if (v13 < 1)
  {
LABEL_12:
    int v15 = 0LL;
    goto LABEL_13;
  }

  else {
    size_t v27 = v13;
  }
  int v15 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithBytes:length:encoding:",  v11,  strnlen(v11, v27),  4);
LABEL_13:
  if (v7 != self->_objectSetupFlags)
  {
    self->_objectSetupFlags = v7;
    uint64_t v16 = 0x10000LL;
    if (v9 == self->_objectSetupBatteryPerformance) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }

  uint64_t v16 = 0LL;
  if (v9 != self->_objectSetupBatteryPerformance)
  {
LABEL_17:
    self->_objectSetupBatteryPerformance = v9;
    uint64_t v16 = 0x10000LL;
  }

- (void)_parseProximityServiceData:(id)a3
{
  id v4 = a3;
  int v5 = (unsigned __int8 *)[v4 bytes];
  uint64_t v6 = [v4 length];

  if (v6 <= 0)
  {
    self->_unsigned int proximityServiceSubType = 0;
    unint64_t discoveryFlags = self->_discoveryFlags;
    self->_unint64_t discoveryFlags = discoveryFlags | 0x80000000;
  }

  else
  {
    unsigned int v7 = &v5[v6];
    int v10 = *v5;
    int v9 = v5 + 1;
    int v8 = v10;
    self->_unsigned int proximityServiceSubType = v10;
    unint64_t discoveryFlags = self->_discoveryFlags;
    self->_unint64_t discoveryFlags = discoveryFlags | 0x80000000;
    if (v10 == 6)
    {
      -[CBDevice _parseProximityServiceWatchSetupPtr:end:](self, "_parseProximityServiceWatchSetupPtr:end:", v9, v7);
    }

    else if (v8 == 1)
    {
      -[CBDevice _parseProximityServiceHomeKitSetupPtr:end:](self, "_parseProximityServiceHomeKitSetupPtr:end:", v9, v7);
    }
  }

  self->_changeFlags |= self->_discoveryFlags ^ discoveryFlags;
}

- (void)_parseProximityServiceHomeKitSetupPtr:(const char *)a3 end:(const char *)a4
{
  int64_t v5 = a4 - a3;
  if (a4 - a3 < 2)
  {
    unsigned __int16 v7 = 0;
    int v13 = 0;
    int v10 = 0;
    int v8 = 0;
    int v6 = 0;
LABEL_15:
    int v9 = 0;
LABEL_16:
    int v11 = 0;
    int v12 = 0LL;
    goto LABEL_17;
  }

  int v6 = *(unsigned __int16 *)a3;
  if (a4 - a3 - 2 < 2)
  {
    unsigned __int16 v7 = 0;
    goto LABEL_14;
  }

  unsigned __int16 v7 = *((_WORD *)a3 + 1);
  if (v5 - 4 < 1)
  {
LABEL_14:
    int v13 = 0;
    int v10 = 0;
    int v8 = 0;
    goto LABEL_15;
  }

  int v8 = *((unsigned __int8 *)a3 + 4);
  if (v5 - 5 < 2)
  {
    int v13 = 0;
    int v10 = 0;
    goto LABEL_15;
  }

  int v9 = *(unsigned __int16 *)(a3 + 5);
  if (v5 - 7 < 1)
  {
    int v13 = 0;
    int v10 = 0;
    goto LABEL_16;
  }

  int v10 = *((unsigned __int8 *)a3 + 7);
  if (v5 - 8 < 1)
  {
    int v13 = 0;
    goto LABEL_16;
  }

  int v11 = *((unsigned __int8 *)a3 + 8);
  if (v5 - 9 < 1)
  {
    int v13 = 0;
    int v12 = 0LL;
    unsigned int v14 = *((unsigned __int16 *)a3 + 1);
    if (v6 != self->_proximityServiceVendorID) {
      goto LABEL_24;
    }
    goto LABEL_18;
  }

  int v12 = 0LL;
  int v13 = *((unsigned __int8 *)a3 + 9);
  if ((v13 & 2) == 0 || a4 - (a3 + 10) < 4)
  {
LABEL_17:
    unsigned int v14 = v7;
    if (v6 != self->_proximityServiceVendorID) {
      goto LABEL_24;
    }
    goto LABEL_18;
  }

  int v12 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:a3 + 10 length:4];
  unsigned int v14 = v7;
  if (v6 != self->_proximityServiceVendorID)
  {
LABEL_24:
    self->_proximityServiceVendorID = v6;
    uint64_t v15 = 0x100000000LL;
    if (self->_proximityServiceProductID == v14) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }

- (void)_parseProximityServiceWatchSetupPtr:(const char *)a3 end:(const char *)a4
{
  int64_t v5 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:a3 length:a4 - a3];
  -[CBDevice watchSetupData](self, "watchSetupData");
  int v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v9 = v5;
  id v7 = v6;
  if (v9 == v7)
  {
  }

  else
  {
    if ((v9 == 0LL) != (v7 != 0LL))
    {
      char v8 = [v9 isEqual:v7];

      if ((v8 & 1) != 0) {
        goto LABEL_8;
      }
    }

    else
    {
    }

    -[CBDevice setWatchSetupData:](self, "setWatchSetupData:", v9);
    self->_changedTypesInternal.bitArray[2] |= 2u;
  }

- (void)_parseSafetyAlertsSegmentServiceData:(id)a3
{
  id v4 = a3;
  int64_t v5 = (char *)[v4 bytes];
  uint64_t v6 = [v4 length];

  if (v6 >= 1)
  {
    char v7 = *v5;
    if ((*v5 & 0xF) == 1)
    {
      self->_int safetyAlertsVersion = 1;
      if ((unint64_t)v6 >= 2)
      {
        unsigned int v8 = v5[1];
        if ((v8 & 0xF) == 3 && v8 - 64 >= 0xFFFFFFD0)
        {
          self->_unsigned int safetyAlertsSegmentSegmentsTotal = 3;
          self->_safetyAlertsSegmentSegmentNumber = v8 >> 4;
          if ((unint64_t)v6 >= 5)
          {
            [MEMORY[0x189603F48] dataWithBytes:v5 + 2 length:3];
            id v9 = (NSData *)objc_claimAutoreleasedReturnValue();
            safetyAlertsAlertID = self->_safetyAlertsAlertID;
            self->_safetyAlertsAlertID = v9;

            btAddressData = self->_btAddressData;
            if (btAddressData)
            {
              if (-[NSData length](btAddressData, "length") == 6)
              {
                id obj = (id) -[NSData mutableCopy](self->_btAddressData, "mutableCopy");
                int v12 = (_BYTE *)[obj mutableBytes];
                *int v12 = *v12 & 0x3F | v7 & 0xC0;
                int v13 = obj;
                if (self->_safetyAlertsSegmentSegmentNumber == self->_safetyAlertsSegmentSegmentsTotal) {
                  unint64_t v14 = 12LL;
                }
                else {
                  unint64_t v14 = 13LL;
                }
                if (v6 - 5 >= v14)
                {
                  uint64_t v15 = &v5[v6];
                  uint64_t v16 = v5 + 5;
                  [obj appendBytes:v16 length:v14];
                  int v17 = &v16[v14];
                  objc_storeStrong((id *)&self->_safetyAlertsSegmentSignature, obj);
                  if (v15 - v17 >= 1)
                  {
                    [MEMORY[0x189603F48] dataWithBytes:v17 length:((_BYTE)v15 - (_BYTE)v17)];
                    char v18 = (NSData *)objc_claimAutoreleasedReturnValue();
                    safetyAlertsSegmentAlertData = self->_safetyAlertsSegmentAlertData;
                    self->_safetyAlertsSegmentAlertData = v18;
                  }

                  self->_discoveryTypesInternal.bitArray[3] |= 0x40u;
                  int v13 = obj;
                }
              }
            }
          }
        }
      }
    }
  }

- (void)_parseSpatialInteractionPtr:(const char *)a3 end:(const char *)a4
{
  if (a4 - a3 <= 0)
  {
    id v9 = objc_alloc_init(MEMORY[0x189603FA8]);
    int v14 = 0;
    unsigned int v8 = 0;
    int v12 = 0LL;
    uint64_t v15 = 0LL;
    goto LABEL_22;
  }

  char v7 = a3 + 1;
  unsigned int v8 = *(unsigned __int8 *)a3;
  id v9 = objc_alloc_init(MEMORY[0x189603FA8]);
  int v10 = v8 & 3;
  if ((v8 & 3) == 0) {
    goto LABEL_5;
  }
  if (a4 - v7 >= 3)
  {
    int v11 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:v7 length:3];
    char v7 = a3 + 4;
    [v9 addObject:v11];

    if (v10 == 1) {
      goto LABEL_5;
    }
    if (a4 - v7 >= 3)
    {
      uint64_t v16 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:a3 + 4 length:3];
      char v7 = a3 + 7;
      [v9 addObject:v16];

      if (v10 == 2) {
        goto LABEL_5;
      }
      if (a4 - v7 >= 3)
      {
        int v17 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:a3 + 7 length:3];
        char v7 = a3 + 10;
        [v9 addObject:v17];

LABEL_5:
        int v12 = 0LL;
        if ((v8 & 8) != 0)
        {
          int v13 = (v8 >> 6) & 1;
          if ((v8 & 0x80u) == 0) {
            int v13 = 1;
          }
          if (a4 - v7 >= 5 && v13)
          {
            int v12 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:v7 length:5];
            v7 += 5;
          }
        }

        goto LABEL_17;
      }
    }
  }

  int v12 = 0LL;
LABEL_17:
  uint64_t v15 = 0LL;
  int v14 = 0;
  if (a4 - v7 >= 1 && (char)v8 < 0)
  {
    uint64_t v15 = 0LL;
    int v19 = *(unsigned __int8 *)v7;
    char v18 = v7 + 1;
    int v14 = v19;
    if ((v19 & 1) != 0 && a4 - v18 >= 1) {
      uint64_t v15 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:v18 length:1];
    }
  }

- (void)_parseAirDropPtr:(const char *)a3 end:(const char *)a4
{
  int64_t v5 = a4 - a3;
  if (a4 - a3 < 18)
  {
    unsigned int v15 = 0;
    unsigned int v25 = 0;
    int v12 = 0;
    int v10 = 0LL;
    int v9 = 0;
LABEL_12:
    int v11 = 0;
LABEL_13:
    unsigned int v13 = 0;
LABEL_14:
    unsigned int v14 = 0;
    goto LABEL_15;
  }

  unsigned int v8 = a3 + 1;
  int v9 = *(unsigned __int8 *)a3;
  if ((v9 & 0x40) == 0)
  {
    int v10 = 0LL;
    if ((v9 & 0x80) == 0) {
      goto LABEL_4;
    }
    goto LABEL_43;
  }

  if (a4 - v8 < 3)
  {
    unsigned int v15 = 0;
    unsigned int v25 = 0;
    int v12 = 0;
    int v10 = 0LL;
    goto LABEL_12;
  }

  int v10 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:v8 length:3];
  if ((v9 & 0x80) == 0)
  {
LABEL_4:
    int v11 = 0;
    if (v5 - 8 >= 1) {
      goto LABEL_5;
    }
    goto LABEL_45;
  }

- (void)_parseMicrosoftManufacturerPtr:(const char *)a3 end:(const char *)a4
{
  if (a4 - a3 >= 1 && *a3 == 3) {
    -[CBDevice _parseMicrosoftSwiftPairPtr:end:](self, "_parseMicrosoftSwiftPairPtr:end:", a3 + 1);
  }
}

- (void)_parseMicrosoftSwiftPairPtr:(const char *)a3 end:(const char *)a4
{
  int64_t v5 = a3;
  int64_t v7 = a4 - a3;
  if (a4 - a3 >= 1)
  {
    int64_t v5 = a3 + 1;
    uint64_t v8 = *(unsigned __int8 *)a3;
    if ((_DWORD)v8 == -[CBDevice mspSubScenario](self, "mspSubScenario")) {
      goto LABEL_3;
    }
LABEL_27:
    -[CBDevice setMspSubScenario:](self, "setMspSubScenario:", v8);
    uint64_t v9 = 0x80000000000000LL;
    int v10 = (const char *)(a4 - v5);
    if ((_DWORD)v8 != 2) {
      goto LABEL_4;
    }
LABEL_28:
    BOOL v22 = v7 <= 0 || (uint64_t)v10 <= 0;
    int v23 = !v22;
    if (v22) {
      int v24 = (unsigned __int16 *)v5;
    }
    else {
      int v24 = (unsigned __int16 *)(v5 + 1);
    }
    unsigned int v25 = (const char *)(a4 - (const char *)v24);
    if (v23 == 1)
    {
      uint64_t v19 = *v24 | (*((unsigned __int8 *)v24 + 2) << 16);
      int v24 = (unsigned __int16 *)((char *)v24 + 3);
      unsigned int v25 = (const char *)(a4 - (const char *)v24);
    }

    else
    {
      uint64_t v19 = 0LL;
    }

    id v18 = 0LL;
    BOOL v37 = (uint64_t)v25 > 0;
    if ((v23 & v37) != 0) {
      int v20 = (const char *)v24;
    }
    else {
      int v20 = 0LL;
    }
    if ((v23 & v37) != 0) {
      size_t v21 = (size_t)v25;
    }
    else {
      size_t v21 = 0LL;
    }
    goto LABEL_79;
  }

  uint64_t v8 = 0LL;
  if (-[CBDevice mspSubScenario](self, "mspSubScenario")) {
    goto LABEL_27;
  }
LABEL_3:
  uint64_t v9 = 0LL;
  int v10 = (const char *)(a4 - v5);
  if ((_DWORD)v8 == 2) {
    goto LABEL_28;
  }
LABEL_4:
  if ((_DWORD)v8 != 1)
  {
    BOOL v11 = v7 <= 0 || (uint64_t)v10 <= 0;
    int v12 = !v11;
    if (v11) {
      unsigned int v13 = v5;
    }
    else {
      unsigned int v13 = v5 + 1;
    }
    BOOL v14 = a4 - v13 > 0;
    BOOL v15 = (v12 & v14) == 0;
    if ((v12 & v14) != 0) {
      int v16 = v13;
    }
    else {
      int v16 = 0LL;
    }
    if (v15) {
      int v17 = 0LL;
    }
    else {
      int v17 = (const char *)(a4 - v13);
    }
    id v18 = 0LL;
    uint64_t v19 = 0LL;
    if ((_DWORD)v8) {
      int v20 = 0LL;
    }
    else {
      int v20 = v16;
    }
    if ((_DWORD)v8) {
      size_t v21 = 0LL;
    }
    else {
      size_t v21 = (size_t)v17;
    }
    goto LABEL_79;
  }

  BOOL v26 = v7 <= 0 || (uint64_t)v10 <= 0;
  char v27 = !v26;
  if (v26) {
    char v28 = v5;
  }
  else {
    char v28 = v5 + 1;
  }
  unsigned __int8 v29 = v27 & (a4 - v28 > 5);
  uint64_t v30 = 6LL;
  if (!v29) {
    uint64_t v30 = 0LL;
  }
  uint64_t v31 = &v28[v30];
  if (v29) {
    id v18 = (void *)v28;
  }
  else {
    id v18 = 0LL;
  }
  uint64_t v32 = (const char *)(a4 - v31);
  int v33 = v29 & (a4 - v31 > 2);
  if (v33 == 1)
  {
    uint64_t v19 = *(unsigned __int16 *)v31 | (*((unsigned __int8 *)v31 + 2) << 16);
    int v34 = v31 + 3;
    int v35 = (const char *)(a4 - v34);
    BOOL v36 = a4 - v34 > 0;
    if (a4 - v34 <= 0) {
      int v20 = 0LL;
    }
    else {
      int v20 = v34;
    }
    if (v36) {
      size_t v21 = (size_t)v35;
    }
    else {
      size_t v21 = 0LL;
    }
    if (!v18) {
      goto LABEL_79;
    }
LABEL_78:
    id v18 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:v18 length:6];
    goto LABEL_79;
  }

  uint64_t v19 = 0LL;
  BOOL v38 = (uint64_t)v32 > 0;
  if ((v33 & v38) != 0) {
    int v20 = v31;
  }
  else {
    int v20 = 0LL;
  }
  if ((v33 & v38) != 0) {
    size_t v21 = (size_t)v32;
  }
  else {
    size_t v21 = 0LL;
  }
  if (v18) {
    goto LABEL_78;
  }
LABEL_79:
  -[CBDevice mspAddressData](self, "mspAddressData");
  int v39 = (void *)objc_claimAutoreleasedReturnValue();
  id v48 = v18;
  id v40 = v39;
  if (v48 == v40)
  {

    if ((_DWORD)v19 != -[CBDevice mspDeviceClass](self, "mspDeviceClass")) {
      goto LABEL_90;
    }
LABEL_83:
    if (v20) {
      goto LABEL_84;
    }
LABEL_91:
    int v42 = 0LL;
    goto LABEL_92;
  }

  if ((v48 == 0LL) == (v40 != 0LL))
  {

LABEL_89:
    -[CBDevice setMspAddressData:](self, "setMspAddressData:", v48);
    uint64_t v9 = 0x80000000000000LL;
    if ((_DWORD)v19 != -[CBDevice mspDeviceClass](self, "mspDeviceClass")) {
      goto LABEL_90;
    }
    goto LABEL_83;
  }

  char v41 = [v48 isEqual:v40];

  if ((v41 & 1) == 0) {
    goto LABEL_89;
  }
  if ((_DWORD)v19 == -[CBDevice mspDeviceClass](self, "mspDeviceClass")) {
    goto LABEL_83;
  }
LABEL_90:
  -[CBDevice setMspDeviceClass:](self, "setMspDeviceClass:", v19);
  uint64_t v9 = 0x80000000000000LL;
  if (!v20) {
    goto LABEL_91;
  }
LABEL_84:
  int v42 = (void *)strnlen(v20, v21);
  if (v42) {
    int v42 = (void *)[objc_alloc(NSString) initWithBytes:v20 length:v42 encoding:4];
  }
LABEL_92:
  -[CBDevice mspDisplayName](self, "mspDisplayName");
  int v43 = (void *)objc_claimAutoreleasedReturnValue();
  id v44 = v42;
  id v45 = v43;
  if (v44 == v45)
  {
  }

  else
  {
    int v46 = v45;
    if ((v44 == 0LL) != (v45 != 0LL))
    {
      char v47 = [v44 isEqual:v45];

      if ((v47 & 1) != 0) {
        goto LABEL_99;
      }
    }

    else
    {
    }

    -[CBDevice setMspDisplayName:](self, "setMspDisplayName:", v44);
    uint64_t v9 = 0x80000000000000LL;
  }

- (void)resetNearbyInfoV2SensitiveProperties
{
  self->_unsigned int nearbyInfoV2InvitationRouteType = 0;
  *(_DWORD *)&self->_nearbyInfoV2DecryptedFlags = 0;
  unsigned __int8 v2 = self->_discoveryTypesInternal.bitArray[2];
  self->_discoveryTypesInternal.bitArray[1] &= ~0x20u;
  self->_discoveryTypesInternal.bitArray[2] = v2 & 0x97;
  unsigned __int8 v3 = self->_changedTypesInternal.bitArray[2];
  self->_changedTypesInternal.bitArray[1] &= ~0x20u;
  self->_changedTypesInternal.bitArray[2] = v3 & 0x97;
}

- (id)getSpatialInteractionDeviceTimestampArrayForClientID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    spatialInteractionDeviceTimestampArrayDictionary = self->_spatialInteractionDeviceTimestampArrayDictionary;
    if (!spatialInteractionDeviceTimestampArrayDictionary || !self->_spatialInteractionDeviceTimestampArrayClientIDs)
    {
      uint64_t v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
      int64_t v7 = self->_spatialInteractionDeviceTimestampArrayDictionary;
      self->_spatialInteractionDeviceTimestampArrayDictionary = v6;

      uint64_t v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
      spatialInteractionDeviceTimestampArrayClientIDs = self->_spatialInteractionDeviceTimestampArrayClientIDs;
      self->_spatialInteractionDeviceTimestampArrayClientIDs = v8;

      spatialInteractionDeviceTimestampArrayDictionary = self->_spatialInteractionDeviceTimestampArrayDictionary;
    }

    -[NSMutableDictionary objectForKeyedSubscript:]( spatialInteractionDeviceTimestampArrayDictionary,  "objectForKeyedSubscript:",  v4);
    int v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      BOOL v11 = self->_spatialInteractionDeviceTimestampArrayDictionary;
      id v12 = objc_alloc_init(MEMORY[0x189603FA8]);
      -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", v12, v4);

      -[NSMutableArray addObject:](self->_spatialInteractionDeviceTimestampArrayClientIDs, "addObject:", v4);
    }

    -[NSMutableDictionary objectForKeyedSubscript:]( self->_spatialInteractionDeviceTimestampArrayDictionary,  "objectForKeyedSubscript:",  v4);
    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue();

    return v13;
  }

  else
  {

    return 0LL;
  }

- (void)setSpatialInteractionDeviceTimestampArrayForClientID:(id)a3 clientID:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  if (v14 && v6)
  {
    if (!self->_spatialInteractionDeviceTimestampArrayDictionary
      || (int64_t v7 = self->_spatialInteractionDeviceTimestampArrayClientIDs) == 0LL)
    {
      uint64_t v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
      spatialInteractionDeviceTimestampArrayDictionary = self->_spatialInteractionDeviceTimestampArrayDictionary;
      self->_spatialInteractionDeviceTimestampArrayDictionary = v8;

      int v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
      spatialInteractionDeviceTimestampArrayClientIDs = self->_spatialInteractionDeviceTimestampArrayClientIDs;
      self->_spatialInteractionDeviceTimestampArrayClientIDs = v10;

      int64_t v7 = self->_spatialInteractionDeviceTimestampArrayClientIDs;
    }

    if ((unint64_t)-[NSMutableArray count](v7, "count") >= 6)
    {
      id v12 = self->_spatialInteractionDeviceTimestampArrayDictionary;
      -[NSMutableArray objectAtIndexedSubscript:]( self->_spatialInteractionDeviceTimestampArrayClientIDs,  "objectAtIndexedSubscript:",  0LL);
      unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary removeObjectForKey:](v12, "removeObjectForKey:", v13);

      -[NSMutableArray removeObjectAtIndex:]( self->_spatialInteractionDeviceTimestampArrayClientIDs,  "removeObjectAtIndex:",  0LL);
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_spatialInteractionDeviceTimestampArrayDictionary,  "setObject:forKeyedSubscript:",  v14,  v6);
  }
}

- (NSString)accountID
{
  return self->_accountID;
}

- (void)setAccountID:(id)a3
{
}

- (unsigned)adaptiveVolumeCapability
{
  return self->_adaptiveVolumeCapability;
}

- (void)setAdaptiveVolumeCapability:(unsigned __int8)a3
{
  self->_adaptiveVolumeCapability = a3;
}

- (int)audioStreamState
{
  return self->_audioStreamState;
}

- (void)setAudioStreamState:(int)a3
{
  self->_unsigned int audioStreamState = a3;
}

- (unsigned)autoAncCapability
{
  return self->_autoAncCapability;
}

- (void)setAutoAncCapability:(unsigned __int8)a3
{
  self->_autoAncCapability = a3;
}

- (NSData)bleAddressData
{
  return self->_bleAddressData;
}

- (void)setBleAddressData:(id)a3
{
}

- (NSData)bleAdvertisementData
{
  return self->_bleAdvertisementData;
}

- (void)setBleAdvertisementData:(id)a3
{
}

- (NSData)bleAppleManufacturerData
{
  return self->_bleAppleManufacturerData;
}

- (void)setBleAppleManufacturerData:(id)a3
{
}

- (int)bleChannel
{
  return self->_bleChannel;
}

- (void)setBleChannel:(int)a3
{
  self->_int64_t bleChannel = a3;
}

- (int)bleRSSI
{
  return self->_bleRSSI;
}

- (void)setBleRSSI:(int)a3
{
  self->_int bleRSSI = a3;
}

- (double)bleAdvertisementTimestamp
{
  return self->_bleAdvertisementTimestamp;
}

- (void)setBleAdvertisementTimestamp:(double)a3
{
  self->_double bleAdvertisementTimestamp = a3;
}

- (unint64_t)bleAdvertisementTimestampMachContinuous
{
  return self->_bleAdvertisementTimestampMachContinuous;
}

- (void)setBleAdvertisementTimestampMachContinuous:(unint64_t)a3
{
  self->_unint64_t bleAdvertisementTimestampMachContinuous = a3;
}

- (NSData)btAddressData
{
  return self->_btAddressData;
}

- (void)setBtAddressData:(id)a3
{
}

- (NSString)caseVersion
{
  return self->_caseVersion;
}

- (void)setCaseVersion:(id)a3
{
}

- (unint64_t)changeFlags
{
  return self->_changeFlags;
}

- (void)setChangeFlags:(unint64_t)a3
{
  self->_unint64_t changeFlags = a3;
}

- (char)classicRSSI
{
  return self->_classicRSSI;
}

- (void)setClassicRSSI:(char)a3
{
  self->_classicRSSI = a3;
}

- (CBControllerInfo)controllerInfo
{
  return self->_controllerInfo;
}

- (void)setControllerInfo:(id)a3
{
}

- (unsigned)connectedServices
{
  return self->_connectedServices;
}

- (void)setConnectedServices:(unsigned int)a3
{
  self->_uint64_t connectedServices = a3;
}

- (NSString)contactID
{
  return self->_contactID;
}

- (void)setContactID:(id)a3
{
}

- (unsigned)conversationDetectCapability
{
  return self->_conversationDetectCapability;
}

- (void)setConversationDetectCapability:(unsigned __int8)a3
{
  self->_conversationDetectCapability = a3;
}

- (unint64_t)deviceFlags
{
  return self->_deviceFlags;
}

- (void)setDeviceFlags:(unint64_t)a3
{
  self->_unint64_t deviceFlags = a3;
}

- (unsigned)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(unsigned __int8)a3
{
  self->_unsigned int deviceType = a3;
}

- (unint64_t)discoveryFlags
{
  return self->_discoveryFlags;
}

- (void)setDiscoveryFlags:(unint64_t)a3
{
  self->_unint64_t discoveryFlags = a3;
}

- (char)doubleTapActionLeft
{
  return self->_doubleTapActionLeft;
}

- (void)setDoubleTapActionLeft:(char)a3
{
  self->_uint64_t doubleTapActionLeft = a3;
}

- (char)doubleTapActionRight
{
  return self->_doubleTapActionRight;
}

- (void)setDoubleTapActionRight:(char)a3
{
  self->_char doubleTapActionRight = a3;
}

- (char)doubleTapCapability
{
  return self->_doubleTapCapability;
}

- (void)setDoubleTapCapability:(char)a3
{
  self->_char doubleTapCapability = a3;
}

- (unsigned)endCallCapability
{
  return self->_endCallCapability;
}

- (void)setEndCallCapability:(unsigned __int8)a3
{
  self->_endCallCapability = a3;
}

- (NSString)firmwareVersion
{
  return self->_firmwareVersion;
}

- (void)setFirmwareVersion:(id)a3
{
}

- (char)hearingAidSupport
{
  return self->_hearingAidSupport;
}

- (void)setHearingAidSupport:(char)a3
{
  self->_uint64_t hearingAidSupport = a3;
}

- (char)hearingTestSupport
{
  return self->_hearingTestSupport;
}

- (void)setHearingTestSupport:(char)a3
{
  self->_uint64_t hearingTestSupport = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)idsDeviceID
{
  return self->_idsDeviceID;
}

- (void)setIdsDeviceID:(id)a3
{
}

- (unsigned)interval
{
  return self->_interval;
}

- (void)setInterval:(unsigned __int16)a3
{
  self->_interval = a3;
}

- (char)microphoneMode
{
  return self->_microphoneMode;
}

- (void)setMicrophoneMode:(char)a3
{
  self->_uint64_t microphoneMode = a3;
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (unsigned)muteControlCapability
{
  return self->_muteControlCapability;
}

- (void)setMuteControlCapability:(unsigned __int8)a3
{
  self->_int muteControlCapability = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (int)primaryPlacement
{
  return self->_primaryPlacement;
}

- (void)setPrimaryPlacement:(int)a3
{
  self->_unsigned int primaryPlacement = a3;
}

- (int)secondaryPlacement
{
  return self->_secondaryPlacement;
}

- (void)setSecondaryPlacement:(int)a3
{
  self->_unsigned int secondaryPlacement = a3;
}

- (char)placementMode
{
  return self->_placementMode;
}

- (void)setPlacementMode:(char)a3
{
  self->_char placementMode = a3;
}

- (unsigned)productID
{
  return self->_productID;
}

- (void)setProductID:(unsigned int)a3
{
  self->_uint64_t productID = a3;
}

- (NSString)productName
{
  return self->_productName;
}

- (void)setProductName:(id)a3
{
}

- (NSString)remoteHostID
{
  return self->_remoteHostID;
}

- (void)setRemoteHostID:(id)a3
{
}

- (unsigned)selectiveSpeechListeningCapability
{
  return self->_selectiveSpeechListeningCapability;
}

- (void)setSelectiveSpeechListeningCapability:(unsigned __int8)a3
{
  self->_selectiveSpeechListeningCapability = a3;
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
}

- (NSString)serialNumberLeft
{
  return self->_serialNumberLeft;
}

- (void)setSerialNumberLeft:(id)a3
{
}

- (NSString)serialNumberRight
{
  return self->_serialNumberRight;
}

- (void)setSerialNumberRight:(id)a3
{
}

- (char)smartRoutingMode
{
  return self->_smartRoutingMode;
}

- (void)setSmartRoutingMode:(char)a3
{
  self->_uint64_t smartRoutingMode = a3;
}

- (unsigned)tipiConnectionStatus
{
  return self->_tipiConnectionStatus;
}

- (void)setTipiConnectionStatus:(unsigned __int8)a3
{
  self->_unsigned int tipiConnectionStatus = a3;
}

- (NSArray)tipiDevices
{
  return self->_tipiDevices;
}

- (void)setTipiDevices:(id)a3
{
}

- (unsigned)tipiState
{
  return self->_tipiState;
}

- (void)setTipiState:(unsigned __int8)a3
{
  self->_tipiState = a3;
}

- (NSData)txAddressData
{
  return self->_txAddressData;
}

- (void)setTxAddressData:(id)a3
{
}

- (unsigned)vendorID
{
  return self->_vendorID;
}

- (void)setVendorID:(unsigned __int16)a3
{
  self->_vendorID = a3;
}

- (unsigned)vendorIDSource
{
  return self->_vendorIDSource;
}

- (void)setVendorIDSource:(unsigned __int8)a3
{
  self->_int vendorIDSource = a3;
}

- (unsigned)airdropFlags
{
  return self->_airdropFlags;
}

- (void)setAirdropFlags:(unsigned __int8)a3
{
  self->_airdropFlags = a3;
}

- (NSData)airdropTempAuthTagData
{
  return self->_airdropTempAuthTagData;
}

- (void)setAirdropTempAuthTagData:(id)a3
{
}

- (unsigned)airdropModel
{
  return self->_airdropModel;
}

- (void)setAirdropModel:(unsigned __int8)a3
{
  self->_uint64_t airdropModel = a3;
}

- (unsigned)airdropVersion
{
  return self->_airdropVersion;
}

- (void)setAirdropVersion:(unsigned __int8)a3
{
  self->_uint64_t airdropVersion = a3;
}

- (unsigned)airdropHash1
{
  return self->_airdropHash1;
}

- (void)setAirdropHash1:(unsigned __int16)a3
{
  self->_uint64_t airdropHash1 = a3;
}

- (unsigned)airdropHash2
{
  return self->_airdropHash2;
}

- (void)setAirdropHash2:(unsigned __int16)a3
{
  self->_uint64_t airdropHash2 = a3;
}

- (unsigned)airdropHash3
{
  return self->_airdropHash3;
}

- (void)setAirdropHash3:(unsigned __int16)a3
{
  self->_uint64_t airdropHash3 = a3;
}

- (unsigned)airdropHash4
{
  return self->_airdropHash4;
}

- (void)setAirdropHash4:(unsigned __int16)a3
{
  self->_uint64_t airdropHash4 = a3;
}

- (unsigned)airdropConfigData
{
  return self->_airdropConfigData;
}

- (void)setAirdropConfigData:(unsigned __int8)a3
{
  self->_airdropConfigData = a3;
}

- (NSData)airplaySourceAuthTagData
{
  return self->_airplaySourceAuthTagData;
}

- (void)setAirplaySourceAuthTagData:(id)a3
{
}

- (unsigned)airplaySourceFlags
{
  return self->_airplaySourceFlags;
}

- (void)setAirplaySourceFlags:(unsigned __int8)a3
{
  self->_airplaySourceFlags = a3;
}

- (unsigned)airplayTargetConfigSeed
{
  return self->_airplayTargetConfigSeed;
}

- (void)setAirplayTargetConfigSeed:(unsigned __int8)a3
{
  self->_airplayTargetConfigSeed = a3;
}

- (unsigned)airplayTargetFlags
{
  return self->_airplayTargetFlags;
}

- (void)setAirplayTargetFlags:(unsigned __int8)a3
{
  self->_airplayTargetFlags = a3;
}

- (unsigned)airplayTargetIPv4
{
  return self->_airplayTargetIPv4;
}

- (void)setAirplayTargetIPv4:(unsigned int)a3
{
  self->_airplayTargetIPid v4 = a3;
}

- (unsigned)peerStatusFlag
{
  return self->_peerStatusFlag;
}

- (void)setPeerStatusFlag:(unsigned __int8)a3
{
  self->_peerStatusFlag = a3;
}

- (unsigned)transmitPowerOne
{
  return self->_transmitPowerOne;
}

- (void)setTransmitPowerOne:(unsigned __int8)a3
{
  self->_transmitPowerOne = a3;
}

- (unsigned)transmitPowerTwo
{
  return self->_transmitPowerTwo;
}

- (void)setTransmitPowerTwo:(unsigned __int8)a3
{
  self->_transmitPowerTwo = a3;
}

- (unsigned)transmitPowerThree
{
  return self->_transmitPowerThree;
}

- (void)setTransmitPowerThree:(unsigned __int8)a3
{
  self->_transmitPowerThree = a3;
}

- (unsigned)homeKitV1Category
{
  return self->_homeKitV1Category;
}

- (void)setHomeKitV1Category:(unsigned __int16)a3
{
  self->_homeKitV1Category = a3;
}

- (unsigned)homeKitV1CompatibleVersion
{
  return self->_homeKitV1CompatibleVersion;
}

- (void)setHomeKitV1CompatibleVersion:(unsigned __int8)a3
{
  self->_homeKitV1CompatibleVersion = a3;
}

- (unsigned)homeKitV1ConfigurationNumber
{
  return self->_homeKitV1ConfigurationNumber;
}

- (void)setHomeKitV1ConfigurationNumber:(unsigned __int8)a3
{
  self->_homeKitV1ConfigurationNumber = a3;
}

- (NSData)homeKitV1DeviceIDData
{
  return self->_homeKitV1DeviceIDData;
}

- (void)setHomeKitV1DeviceIDData:(id)a3
{
}

- (unsigned)homeKitV1Flags
{
  return self->_homeKitV1Flags;
}

- (void)setHomeKitV1Flags:(unsigned __int8)a3
{
  self->_int homeKitV1Flags = a3;
}

- (unsigned)homeKitV1StateNumber
{
  return self->_homeKitV1StateNumber;
}

- (void)setHomeKitV1StateNumber:(unsigned __int16)a3
{
  self->_homeKitV1StateNumber = a3;
}

- (unsigned)homeKitV1SetupHash
{
  return self->_homeKitV1SetupHash;
}

- (void)setHomeKitV1SetupHash:(unsigned int)a3
{
  self->_unint64_t homeKitV1SetupHash = a3;
}

- (NSData)homeKitV2AccessoryIDData
{
  return self->_homeKitV2AccessoryIDData;
}

- (void)setHomeKitV2AccessoryIDData:(id)a3
{
}

- (NSData)homeKitV2AuthTagData
{
  return self->_homeKitV2AuthTagData;
}

- (void)setHomeKitV2AuthTagData:(id)a3
{
}

- (unsigned)homeKitV2InstanceID
{
  return self->_homeKitV2InstanceID;
}

- (void)setHomeKitV2InstanceID:(unsigned __int16)a3
{
  self->_homeKitV2InstanceID = a3;
}

- (unsigned)homeKitV2StateNumber
{
  return self->_homeKitV2StateNumber;
}

- (void)setHomeKitV2StateNumber:(unsigned __int16)a3
{
  self->_homeKitV2StateNumber = a3;
}

- (unint64_t)homeKitV2Value
{
  return self->_homeKitV2Value;
}

- (void)setHomeKitV2Value:(unint64_t)a3
{
  self->_uint64_t homeKitV2Value = a3;
}

- (unsigned)nearbyActionFlags
{
  return self->_nearbyActionFlags;
}

- (void)setNearbyActionFlags:(unsigned int)a3
{
  self->_uint64_t nearbyActionFlags = a3;
}

- (unsigned)nearbyActionType
{
  return self->_nearbyActionType;
}

- (void)setNearbyActionType:(unsigned __int8)a3
{
  self->_unsigned int nearbyActionType = a3;
}

- (unsigned)nearbyActivityLevel
{
  return self->_nearbyActivityLevel;
}

- (NSData)nearbyAuthTag
{
  return self->_nearbyAuthTag;
}

- (void)setNearbyAuthTag:(id)a3
{
}

- (unsigned)nearbyInfoFlags
{
  return self->_nearbyInfoFlags;
}

- (void)setNearbyInfoFlags:(unsigned int)a3
{
  self->_uint64_t nearbyInfoFlags = a3;
}

- (NSData)nearbyInfoV2AuthIntegrityTagData
{
  return self->_nearbyInfoV2AuthIntegrityTagData;
}

- (void)setNearbyInfoV2AuthIntegrityTagData:(id)a3
{
}

- (NSData)nearbyInfoV2AuthTagData
{
  return self->_nearbyInfoV2AuthTagData;
}

- (void)setNearbyInfoV2AuthTagData:(id)a3
{
}

- (unsigned)nearbyInfoV2DecryptedFlags
{
  return self->_nearbyInfoV2DecryptedFlags;
}

- (void)setNearbyInfoV2DecryptedFlags:(unsigned __int8)a3
{
  self->_nearbyInfoV2DecryptedFlags = a3;
}

- (unsigned)nearbyInfoV2Flags
{
  return self->_nearbyInfoV2Flags;
}

- (void)setNearbyInfoV2Flags:(unsigned __int8)a3
{
  self->_nearbyInfoV2Flags = a3;
}

- (unsigned)nearbyInfoV2InvitationCounter
{
  return self->_nearbyInfoV2InvitationCounter;
}

- (unsigned)nearbyInfoV2InvitationTypes
{
  return self->_nearbyInfoV2InvitationTypes;
}

- (unsigned)nearbyInfoV2InvitationRouteType
{
  return self->_nearbyInfoV2InvitationRouteType;
}

- (NSData)nearbyInfoV2TempAuthTagData
{
  return self->_nearbyInfoV2TempAuthTagData;
}

- (unsigned)objectDiscoveryBatteryState
{
  return self->_objectDiscoveryBatteryState;
}

- (void)setObjectDiscoveryBatteryState:(unsigned __int8)a3
{
  self->_objectDiscoveryBatteryState = a3;
}

- (unsigned)objectDiscoveryMode
{
  return self->_objectDiscoveryMode;
}

- (void)setObjectDiscoveryMode:(unsigned __int8)a3
{
  self->_objectDiscoveryMode = a3;
}

- (NSData)objectDiscoveryNearOwnerID
{
  return self->_objectDiscoveryNearOwnerID;
}

- (void)setObjectDiscoveryNearOwnerID:(id)a3
{
}

- (unsigned)objectDiscoveryProductID
{
  return self->_objectDiscoveryProductID;
}

- (void)setObjectDiscoveryProductID:(unsigned int)a3
{
  self->_uint64_t objectDiscoveryProductID = a3;
}

- (NSData)objectDiscoveryPublicKeyData
{
  return self->_objectDiscoveryPublicKeyData;
}

- (void)setObjectDiscoveryPublicKeyData:(id)a3
{
}

- (unsigned)objectSetupBatteryPerformance
{
  return self->_objectSetupBatteryPerformance;
}

- (unsigned)objectSetupBatteryState
{
  return self->_objectSetupBatteryState;
}

- (unsigned)objectSetupColorCode
{
  return self->_objectSetupColorCode;
}

- (unsigned)objectSetupFlags
{
  return self->_objectSetupFlags;
}

- (NSString)objectSetupFontCode
{
  return self->_objectSetupFontCode;
}

- (NSString)objectSetupMessage
{
  return self->_objectSetupMessage;
}

- (unsigned)proximityPairingProductID
{
  return self->_proximityPairingProductID;
}

- (void)setProximityPairingProductID:(unsigned int)a3
{
  self->_unsigned int proximityPairingProductID = a3;
}

- (unsigned)proximityPairingSubType
{
  return self->_proximityPairingSubType;
}

- (void)setProximityPairingSubType:(unsigned __int8)a3
{
  self->_int proximityPairingSubType = a3;
}

- (unsigned)proximityServiceCategory
{
  return self->_proximityServiceCategory;
}

- (void)setProximityServiceCategory:(unsigned __int8)a3
{
  self->_proximityServiceCategory = a3;
}

- (NSData)proximityServiceClassicAddress
{
  return self->_proximityServiceClassicAddress;
}

- (void)setProximityServiceClassicAddress:(id)a3
{
}

- (NSData)proximityServiceData
{
  return self->_proximityServiceData;
}

- (void)setProximityServiceData:(id)a3
{
}

- (unsigned)proximityServiceFlags
{
  return self->_proximityServiceFlags;
}

- (void)setProximityServiceFlags:(unsigned __int8)a3
{
  self->_proximityServiceFlags = a3;
}

- (char)proximityServiceMeasuredPower
{
  return self->_proximityServiceMeasuredPower;
}

- (void)setProximityServiceMeasuredPower:(char)a3
{
  self->_proximityServiceMeasuredPower = a3;
}

- (unsigned)proximityServiceProductID
{
  return self->_proximityServiceProductID;
}

- (void)setProximityServiceProductID:(unsigned int)a3
{
  self->_uint64_t proximityServiceProductID = a3;
}

- (unsigned)proximityServicePSM
{
  return self->_proximityServicePSM;
}

- (void)setProximityServicePSM:(unsigned __int16)a3
{
  self->_proximityServicePSM = a3;
}

- (NSData)proximityServiceSetupHash
{
  return self->_proximityServiceSetupHash;
}

- (void)setProximityServiceSetupHash:(id)a3
{
}

- (unsigned)proximityServiceSubType
{
  return self->_proximityServiceSubType;
}

- (void)setProximityServiceSubType:(unsigned __int8)a3
{
  self->_unsigned int proximityServiceSubType = a3;
}

- (unsigned)proximityServiceVendorID
{
  return self->_proximityServiceVendorID;
}

- (void)setProximityServiceVendorID:(unsigned __int16)a3
{
  self->_proximityServiceVendorID = a3;
}

- (unsigned)proximityServiceVersion
{
  return self->_proximityServiceVersion;
}

- (void)setProximityServiceVersion:(unsigned __int8)a3
{
  self->_proximityServiceVersion = a3;
}

- (unsigned)spatialInteractionFlags
{
  return self->_spatialInteractionFlags;
}

- (void)setSpatialInteractionFlags:(unsigned __int8)a3
{
  self->_spatialInteractionFlags = a3;
}

- (NSArray)spatialInteractionIdentifiers
{
  return self->_spatialInteractionIdentifiers;
}

- (void)setSpatialInteractionIdentifiers:(id)a3
{
}

- (NSData)spatialInteractionPresenceConfigData
{
  return self->_spatialInteractionPresenceConfigData;
}

- (void)setSpatialInteractionPresenceConfigData:(id)a3
{
}

- (NSData)spatialInteractionTokenData
{
  return self->_spatialInteractionTokenData;
}

- (void)setSpatialInteractionTokenData:(id)a3
{
}

- (NSDictionary)spatialInteractionUserInfo
{
  return self->_spatialInteractionUserInfo;
}

- (void)setSpatialInteractionUserInfo:(id)a3
{
}

- (NSData)spatialInteractionUWBConfigData
{
  return self->_spatialInteractionUWBConfigData;
}

- (void)setSpatialInteractionUWBConfigData:(id)a3
{
}

- (unsigned)spatialInteractionUWBTokenFlags
{
  return self->_spatialInteractionUWBTokenFlags;
}

- (void)setSpatialInteractionUWBTokenFlags:(unsigned int)a3
{
  self->_spatialInteractionUWBTokenFlags = a3;
}

- (NSData)safetyAlertsAlertData
{
  return self->_safetyAlertsAlertData;
}

- (NSData)safetyAlertsAlertID
{
  return self->_safetyAlertsAlertID;
}

- (unsigned)safetyAlertsAlertIndex
{
  return self->_safetyAlertsAlertIndex;
}

- (NSData)safetyAlertsSignature
{
  return self->_safetyAlertsSignature;
}

- (unsigned)safetyAlertsVersion
{
  return self->_safetyAlertsVersion;
}

- (NSData)nearbyActionNoWakeAuthTagData
{
  return self->_nearbyActionNoWakeAuthTagData;
}

- (void)setNearbyActionNoWakeAuthTagData:(id)a3
{
}

- (NSData)nearbyActionNoWakeConfigData
{
  return self->_nearbyActionNoWakeConfigData;
}

- (void)setNearbyActionNoWakeConfigData:(id)a3
{
}

- (unsigned)nearbyActionNoWakeType
{
  return self->_nearbyActionNoWakeType;
}

- (void)setNearbyActionNoWakeType:(unsigned __int8)a3
{
  self->_nearbyActionNoWakeType = a3;
}

- (unsigned)nearbyActionNWPrecisionFindingStatus
{
  return self->_nearbyActionNWPrecisionFindingStatus;
}

- (void)setNearbyActionNWPrecisionFindingStatus:(unsigned __int8)a3
{
  self->_nearbyActionNWPrecisionFindingStatus = a3;
}

- (unsigned)attributeInternalFlags
{
  return self->_attributeInternalFlags;
}

- (void)setAttributeInternalFlags:(unsigned int)a3
{
  self->_attributeInternalFlags = a3;
}

- (unsigned)batteryInfoMain
{
  return self->_batteryInfoMain;
}

- (void)setBatteryInfoMain:(unsigned __int16)a3
{
  self->_unsigned int batteryInfoMain = a3;
}

- (unsigned)batteryInfoLeft
{
  return self->_batteryInfoLeft;
}

- (void)setBatteryInfoLeft:(unsigned __int16)a3
{
  self->_unsigned int batteryInfoLeft = a3;
}

- (unsigned)batteryInfoRight
{
  return self->_batteryInfoRight;
}

- (void)setBatteryInfoRight:(unsigned __int16)a3
{
  self->_unsigned int batteryInfoRight = a3;
}

- (unsigned)batteryInfoCase
{
  return self->_batteryInfoCase;
}

- (void)setBatteryInfoCase:(unsigned __int16)a3
{
  self->_int batteryInfoCase = a3;
}

- ($F6EBB11256A2F6C4B9D2EC026D0EABA8)callMgmtMsg
{
  return ($F6EBB11256A2F6C4B9D2EC026D0EABA8)(*(unsigned int *)&self->_callMgmtMsg.version | ((unint64_t)self->_callMgmtMsg.muteControlConfig << 32));
}

- (void)setCallMgmtMsg:(id)a3
{
  self->_callMgmtMsg = ($9586B29D337632A0E7B5229ABB253883)a3;
}

- (unsigned)colorInfo
{
  return self->_colorInfo;
}

- (void)setColorInfo:(unsigned __int16)a3
{
  self->_colorInfo = a3;
}

- (NSMutableDictionary)deviceInfo
{
  return self->_deviceInfo;
}

- (void)setDeviceInfo:(id)a3
{
}

- (unsigned)internalFlags
{
  return self->_internalFlags;
}

- (void)setInternalFlags:(unsigned int)a3
{
  self->_internalFlags = a3;
}

- (unint64_t)lastSeenTicks
{
  return self->_lastSeenTicks;
}

- (void)setLastSeenTicks:(unint64_t)a3
{
  self->_lastSeenTicks = a3;
}

- (NSString)leAdvName
{
  return self->_leAdvName;
}

- (void)setLeAdvName:(id)a3
{
}

- (unsigned)leaVersion
{
  return self->_leaVersion;
}

- (void)setLeaVersion:(unsigned __int8 *)a3
{
  self->_leaVersion = a3;
}

- (unint64_t)oldDiscoveryFlags
{
  return self->_oldDiscoveryFlags;
}

- (void)setOldDiscoveryFlags:(unint64_t)a3
{
  self->_oldDiscoveryFlags = a3;
}

- (unsigned)supportedServices
{
  return self->_supportedServices;
}

- (void)setSupportedServices:(unsigned int)a3
{
  self->_uint64_t supportedServices = a3;
}

- (BOOL)enableEPAForLEAdvertisement
{
  return self->_enableEPAForLEAdvertisement;
}

- (void)setEnableEPAForLEAdvertisement:(BOOL)a3
{
  self->_enableEPAForLEAdvertisement = a3;
}

- (NSData)nearbyActionAuthTag
{
  return self->_nearbyActionAuthTag;
}

- (void)setNearbyActionAuthTag:(id)a3
{
}

- (NSData)nearbyActionTargetAuthTag
{
  return self->_nearbyActionTargetAuthTag;
}

- (void)setNearbyActionTargetAuthTag:(id)a3
{
}

- (NSData)nearbyInfoAuthTag
{
  return self->_nearbyInfoAuthTag;
}

- (void)setNearbyInfoAuthTag:(id)a3
{
}

- (unsigned)nearbyInfoV2EncryptedFlags
{
  return self->_nearbyInfoV2EncryptedFlags;
}

- (void)setNearbyInfoV2EncryptedFlags:(unsigned __int8)a3
{
  self->_nearbyInfoV2EncryptedFlags = a3;
}

- (NSData)nearbyInfoV2EncryptedData
{
  return self->_nearbyInfoV2EncryptedData;
}

- (void)setNearbyInfoV2EncryptedData:(id)a3
{
}

- (unsigned)proximityPairingOtherBudProductID
{
  return self->_proximityPairingOtherBudProductID;
}

- (void)setProximityPairingOtherBudProductID:(unsigned int)a3
{
  self->_proximityPairingOtherBudProductID = a3;
}

- (NSData)safetyAlertsSegmentAlertData
{
  return self->_safetyAlertsSegmentAlertData;
}

- (void)setSafetyAlertsSegmentAlertData:(id)a3
{
}

- (unsigned)safetyAlertsSegmentSegmentNumber
{
  return self->_safetyAlertsSegmentSegmentNumber;
}

- (void)setSafetyAlertsSegmentSegmentNumber:(unsigned __int8)a3
{
  self->_safetyAlertsSegmentSegmentNumber = a3;
}

- (unsigned)safetyAlertsSegmentSegmentsTotal
{
  return self->_safetyAlertsSegmentSegmentsTotal;
}

- (void)setSafetyAlertsSegmentSegmentsTotal:(unsigned __int8)a3
{
  self->_unsigned int safetyAlertsSegmentSegmentsTotal = a3;
}

- (NSData)safetyAlertsSegmentServiceData
{
  return self->_safetyAlertsSegmentServiceData;
}

- (void)setSafetyAlertsSegmentServiceData:(id)a3
{
}

- (NSData)safetyAlertsSegmentSignature
{
  return self->_safetyAlertsSegmentSignature;
}

- (void)setSafetyAlertsSegmentSignature:(id)a3
{
}

- (unsigned)spatialInteractionConfigFlags
{
  return self->_spatialInteractionConfigFlags;
}

- (void)setSpatialInteractionConfigFlags:(unsigned __int8)a3
{
  self->_spatialInteractionConfigFlags = a3;
}

- (unsigned)spatialInteractionPeerID
{
  return self->_spatialInteractionPeerID;
}

- (void)setSpatialInteractionPeerID:(unsigned int)a3
{
  self->_uint64_t spatialInteractionPeerID = a3;
}

- (NSMutableArray)spatialInteractionDeviceTimestampArrayClientIDs
{
  return self->_spatialInteractionDeviceTimestampArrayClientIDs;
}

- (void)setSpatialInteractionDeviceTimestampArrayClientIDs:(id)a3
{
}

- (NSMutableDictionary)spatialInteractionDeviceTimestampArrayDictionary
{
  return self->_spatialInteractionDeviceTimestampArrayDictionary;
}

- (void)setSpatialInteractionDeviceTimestampArrayDictionary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end