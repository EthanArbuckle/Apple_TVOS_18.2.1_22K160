@interface CWFScanResult
+ (BOOL)supportsSecureCoding;
+ (id)supportedOSSpecificKeys;
- (BOOL)hasNon6GHzRNRChannel;
- (BOOL)hasTKIPCipher;
- (BOOL)hasWEP104Cipher;
- (BOOL)hasWEP40Cipher;
- (BOOL)isAdditionalStepRequiredForAccess;
- (BOOL)isAllowedInLockdownMode;
- (BOOL)isAmbiguousNetworkName;
- (BOOL)isAppleSWAP;
- (BOOL)isAssociationDisallowed;
- (BOOL)isBackgroundScanResult;
- (BOOL)isEAP;
- (BOOL)isESS;
- (BOOL)isEmergencyServicesReachable;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToScanResult:(id)a3;
- (BOOL)isFILSDiscoveryFrame;
- (BOOL)isHotspot;
- (BOOL)isIBSS;
- (BOOL)isInternetAccessible;
- (BOOL)isMFPCapable;
- (BOOL)isMFPRequired;
- (BOOL)isMetered;
- (BOOL)isOWE;
- (BOOL)isOpen;
- (BOOL)isPSK;
- (BOOL)isPasspoint;
- (BOOL)isPersonalHotspot;
- (BOOL)isUnauthenticatedEmergencyServiceAccessible;
- (BOOL)isUnconfiguredAirPortBaseStation;
- (BOOL)isUnconfiguredDevice;
- (BOOL)isWAPI;
- (BOOL)isWEP;
- (BOOL)isWPA;
- (BOOL)isWPA2;
- (BOOL)isWPA3;
- (BOOL)isWiFi6E;
- (BOOL)providesInternetAccess;
- (BOOL)supports2GHzNetworks;
- (BOOL)supports5GHzNetworks;
- (BOOL)supportsAirPlay;
- (BOOL)supportsAirPlay2;
- (BOOL)supportsAirPrint;
- (BOOL)supportsCarPlay;
- (BOOL)supportsHomeKit;
- (BOOL)supportsHomeKit2;
- (BOOL)supportsMFi;
- (BOOL)supportsMFiHardwareAuth;
- (BOOL)supportsMFiSoftwareCertAuth;
- (BOOL)supportsMFiSoftwareTokenAuth;
- (BOOL)supportsSecureWAC;
- (BOOL)supportsWPS;
- (BOOL)supportsWoW;
- (BOOL)supportsiAPOverWiFi;
- (BOOL)wasConnectedDuringSleep;
- (CWFChannel)channel;
- (CWFNetworkProfile)matchingKnownNetworkProfile;
- (CWFScanResult)initWithCoder:(id)a3;
- (CWFScanResult)initWithScanRecord:(id)a3 includeProperties:(id)a4;
- (CWFScanResult)initWithScanRecord:(id)a3 knownNetworkProfile:(id)a4 includeProperties:(id)a5;
- (CWFScanResult)scanResultWithMatchingKnownNetworkProfile:(id)a3;
- (NSArray)NAIRealmNameList;
- (NSArray)RNRBSSList;
- (NSArray)RNRChannelList;
- (NSArray)RSNAuthSelectors;
- (NSArray)RSNUnicastCiphers;
- (NSArray)WPAAuthSelectors;
- (NSArray)WPAUnicastCiphers;
- (NSArray)cellularNetworkInfo;
- (NSArray)domainNameList;
- (NSArray)networkFlags;
- (NSArray)operatorFriendlyNameList;
- (NSArray)roamingConsortiumList;
- (NSData)SSID;
- (NSData)informationElementData;
- (NSDictionary)ANQPResponse;
- (NSDictionary)OSSpecificAttributes;
- (NSDictionary)scanRecord;
- (NSMutableDictionary)internal;
- (NSSet)properties;
- (NSString)BSSID;
- (NSString)HESSID;
- (NSString)bluetoothMAC;
- (NSString)countryCode;
- (NSString)description;
- (NSString)deviceID;
- (NSString)displayName;
- (NSString)friendlyName;
- (NSString)manufacturerName;
- (NSString)modelName;
- (NSString)networkName;
- (NSString)primaryMAC;
- (NSString)privateMACAddress;
- (id)JSONCompatibleKeyValueMap;
- (id)OSSpecificValueForKey:(id)a3;
- (id)__defaultProperties;
- (id)__descriptionForAirPortBaseStationModel:(int64_t)a3;
- (id)__descriptionForRSNAuthSel:(int)a3;
- (id)__descriptionForRSNCipher:(int)a3;
- (id)__descriptionForRSNIE;
- (id)__descriptionForWPAAuthSel:(int)a3;
- (id)__descriptionForWPACipher:(int)a3;
- (id)__descriptionForWPAIE;
- (id)__internalDictionaryFromScanRecord:(id)a3 knownNetworkProfile:(id)a4 includeProperties:(id)a5;
- (id)__requiredProperties;
- (id)copyWithZone:(_NSZone *)a3;
- (id)filteredScanResultWithProperties:(id)a3;
- (id)networkProfile;
- (int)APMode;
- (int)RSNCapabilities;
- (int)accessNetworkType;
- (int)fastestSupportedPHYMode;
- (int)slowestSupportedPHYMode;
- (int)supportedPHYModes;
- (int64_t)RSSI;
- (int64_t)WAPISubtype;
- (int64_t)airPortBaseStationModel;
- (int64_t)beaconInterval;
- (int64_t)compareLowDataModes:(id)a3;
- (int64_t)compareSupportedPHYModes:(id)a3;
- (int64_t)compareSupportedSecurityTypes:(id)a3;
- (int64_t)noise;
- (int64_t)venueGroup;
- (int64_t)venueType;
- (unint64_t)RSNBroadcastCipher;
- (unint64_t)RSNMulticastCipher;
- (unint64_t)WPAMulticastCipher;
- (unint64_t)age;
- (unint64_t)hash;
- (unint64_t)shortSSID;
- (unint64_t)strongestSupportedSecurityType;
- (unint64_t)supportedSecurityTypes;
- (unint64_t)timestamp;
- (unint64_t)weakestSupportedSecurityType;
- (void)encodeWithCoder:(id)a3;
- (void)setInternal:(id)a3;
- (void)setMatchingKnownNetworkProfile:(id)a3;
- (void)setOSSpecificAttributes:(id)a3;
- (void)setOSSpecificValue:(id)a3 forKey:(id)a4;
@end

@implementation CWFScanResult

- (id)JSONCompatibleKeyValueMap
{
  uint64_t v779 = *MEMORY[0x1895F89C0];
  id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
  v4 = (void *)MEMORY[0x189607968];
  uint64_t v9 = objc_msgSend_age(self, v5, v6, v7, v8);
  objc_msgSend_numberWithUnsignedInteger_(v4, v10, v9, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v14, (uint64_t)v13, (uint64_t)@"cache_age", v15);

  objc_msgSend_channel(self, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_JSONCompatibleKeyValueMap(v20, v21, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v26, (uint64_t)v25, (uint64_t)@"channel", v27);

  v28 = (void *)MEMORY[0x189607968];
  uint64_t v33 = objc_msgSend_RSSI(self, v29, v30, v31, v32);
  objc_msgSend_numberWithInteger_(v28, v34, v33, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v38, (uint64_t)v37, (uint64_t)@"rssi", v39);

  v40 = (void *)MEMORY[0x189607968];
  uint64_t v45 = objc_msgSend_wasConnectedDuringSleep(self, v41, v42, v43, v44);
  objc_msgSend_numberWithBool_(v40, v46, v45, v47, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v50, (uint64_t)v49, (uint64_t)@"wasConnectedDuringSleep", v51);

  v52 = (void *)MEMORY[0x189607968];
  uint64_t v57 = objc_msgSend_noise(self, v53, v54, v55, v56);
  objc_msgSend_numberWithInteger_(v52, v58, v57, v59, v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v62, (uint64_t)v61, (uint64_t)@"noise", v63);

  v64 = (void *)MEMORY[0x189607968];
  uint64_t v69 = objc_msgSend_beaconInterval(self, v65, v66, v67, v68);
  objc_msgSend_numberWithInteger_(v64, v70, v69, v71, v72);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v74, (uint64_t)v73, (uint64_t)@"beacon_interval", v75);

  v76 = (void *)MEMORY[0x189607968];
  uint64_t isUnconfiguredAirPortBaseStation = objc_msgSend_isUnconfiguredAirPortBaseStation(self, v77, v78, v79, v80);
  objc_msgSend_numberWithBool_(v76, v82, isUnconfiguredAirPortBaseStation, v83, v84);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_( v3,  v86,  (uint64_t)v85,  (uint64_t)@"unconfigured_airport_base_station",  v87);

  v88 = (void *)MEMORY[0x189607968];
  uint64_t isPasspoint = objc_msgSend_isPasspoint(self, v89, v90, v91, v92);
  objc_msgSend_numberWithBool_(v88, v94, isPasspoint, v95, v96);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v98, (uint64_t)v97, (uint64_t)@"is_passpoint", v99);

  v100 = (void *)MEMORY[0x189607968];
  uint64_t isPersonalHotspot = objc_msgSend_isPersonalHotspot(self, v101, v102, v103, v104);
  objc_msgSend_numberWithBool_(v100, v106, isPersonalHotspot, v107, v108);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v110, (uint64_t)v109, (uint64_t)@"is_personal_hotspot", v111);

  v112 = (void *)MEMORY[0x189607968];
  uint64_t isAppleSWAP = objc_msgSend_isAppleSWAP(self, v113, v114, v115, v116);
  objc_msgSend_numberWithBool_(v112, v118, isAppleSWAP, v119, v120);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v122, (uint64_t)v121, (uint64_t)@"is_apple_swap", v123);

  v124 = (void *)MEMORY[0x189607968];
  uint64_t isIBSS = objc_msgSend_isIBSS(self, v125, v126, v127, v128);
  objc_msgSend_numberWithBool_(v124, v130, isIBSS, v131, v132);
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v134, (uint64_t)v133, (uint64_t)@"is_ibss", v135);

  v136 = (void *)MEMORY[0x189607968];
  uint64_t isWEP = objc_msgSend_isWEP(self, v137, v138, v139, v140);
  objc_msgSend_numberWithBool_(v136, v142, isWEP, v143, v144);
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v146, (uint64_t)v145, (uint64_t)@"is_wep", v147);

  v148 = (void *)MEMORY[0x189607968];
  uint64_t isWAPI = objc_msgSend_isWAPI(self, v149, v150, v151, v152);
  objc_msgSend_numberWithBool_(v148, v154, isWAPI, v155, v156);
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v158, (uint64_t)v157, (uint64_t)@"is_wapi", v159);

  v160 = (void *)MEMORY[0x189607968];
  uint64_t isWPA = objc_msgSend_isWPA(self, v161, v162, v163, v164);
  objc_msgSend_numberWithBool_(v160, v166, isWPA, v167, v168);
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v170, (uint64_t)v169, (uint64_t)@"is_wpa", v171);

  v172 = (void *)MEMORY[0x189607968];
  uint64_t isWPA2 = objc_msgSend_isWPA2(self, v173, v174, v175, v176);
  objc_msgSend_numberWithBool_(v172, v178, isWPA2, v179, v180);
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v182, (uint64_t)v181, (uint64_t)@"is_wpa2", v183);

  v184 = (void *)MEMORY[0x189607968];
  uint64_t isWPA3 = objc_msgSend_isWPA3(self, v185, v186, v187, v188);
  objc_msgSend_numberWithBool_(v184, v190, isWPA3, v191, v192);
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v194, (uint64_t)v193, (uint64_t)@"is_wpa3", v195);

  v196 = (void *)MEMORY[0x189607968];
  uint64_t isEAP = objc_msgSend_isEAP(self, v197, v198, v199, v200);
  objc_msgSend_numberWithBool_(v196, v202, isEAP, v203, v204);
  v205 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v206, (uint64_t)v205, (uint64_t)@"is_eap", v207);

  v208 = (void *)MEMORY[0x189607968];
  uint64_t isPSK = objc_msgSend_isPSK(self, v209, v210, v211, v212);
  objc_msgSend_numberWithBool_(v208, v214, isPSK, v215, v216);
  v217 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v218, (uint64_t)v217, (uint64_t)@"is_psk", v219);

  uint64_t v224 = objc_msgSend_strongestSupportedSecurityType(self, v220, v221, v222, v223);
  uint64_t v229 = objc_msgSend_WAPISubtype(self, v225, v226, v227, v228);
  sub_186453234(v224, 0LL, v229, v230, v231);
  v232 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_( v3,  v233,  (uint64_t)v232,  (uint64_t)@"strongest_supported_security_type",  v234);

  int v239 = objc_msgSend_supportedPHYModes(self, v235, v236, v237, v238);
  sub_1864534A4(v239, v240, v241, v242, v243);
  v244 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v245, (uint64_t)v244, (uint64_t)@"supported_phy_modes", v246);

  int v251 = objc_msgSend_fastestSupportedPHYMode(self, v247, v248, v249, v250);
  sub_1864534A4(v251, v252, v253, v254, v255);
  v256 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v257, (uint64_t)v256, (uint64_t)@"fastest_supported_phy_mode", v258);

  v259 = (void *)MEMORY[0x189607968];
  uint64_t isInternetAccessible = objc_msgSend_isInternetAccessible(self, v260, v261, v262, v263);
  objc_msgSend_numberWithBool_(v259, v265, isInternetAccessible, v266, v267);
  v268 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v269, (uint64_t)v268, (uint64_t)@"is_internet_accessible", v270);

  v271 = (void *)MEMORY[0x189607968];
  uint64_t isAdditionalStepRequiredForAccess = objc_msgSend_isAdditionalStepRequiredForAccess(self, v272, v273, v274, v275);
  objc_msgSend_numberWithBool_(v271, v277, isAdditionalStepRequiredForAccess, v278, v279);
  v280 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_( v3,  v281,  (uint64_t)v280,  (uint64_t)@"is_additional_step_required_for_access",  v282);

  v283 = (void *)MEMORY[0x189607968];
  uint64_t isEmergencyServicesReachable = objc_msgSend_isEmergencyServicesReachable(self, v284, v285, v286, v287);
  objc_msgSend_numberWithBool_(v283, v289, isEmergencyServicesReachable, v290, v291);
  v292 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_( v3,  v293,  (uint64_t)v292,  (uint64_t)@"is_emergency_services_reachable",  v294);

  v295 = (void *)MEMORY[0x189607968];
  uint64_t isUnauthenticatedEmergencyServiceAccessible = objc_msgSend_isUnauthenticatedEmergencyServiceAccessible( self,  v296,  v297,  v298,  v299);
  objc_msgSend_numberWithBool_(v295, v301, isUnauthenticatedEmergencyServiceAccessible, v302, v303);
  v304 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_( v3,  v305,  (uint64_t)v304,  (uint64_t)@"is_unauthenticated_emergency_services_accessible",  v306);

  v307 = (void *)MEMORY[0x189607968];
  uint64_t isUnconfiguredDevice = objc_msgSend_isUnconfiguredDevice(self, v308, v309, v310, v311);
  objc_msgSend_numberWithBool_(v307, v313, isUnconfiguredDevice, v314, v315);
  v316 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v317, (uint64_t)v316, (uint64_t)@"is_unconfigured_device", v318);

  v319 = (void *)MEMORY[0x189607968];
  uint64_t v324 = objc_msgSend_providesInternetAccess(self, v320, v321, v322, v323);
  objc_msgSend_numberWithBool_(v319, v325, v324, v326, v327);
  v328 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v329, (uint64_t)v328, (uint64_t)@"provides_internet_access", v330);

  v331 = (void *)MEMORY[0x189607968];
  uint64_t v336 = objc_msgSend_venueType(self, v332, v333, v334, v335);
  objc_msgSend_numberWithInteger_(v331, v337, v336, v338, v339);
  v340 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v341, (uint64_t)v340, (uint64_t)@"venue_type", v342);

  v343 = (void *)MEMORY[0x189607968];
  uint64_t v348 = objc_msgSend_venueGroup(self, v344, v345, v346, v347);
  objc_msgSend_numberWithInteger_(v343, v349, v348, v350, v351);
  v352 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v353, (uint64_t)v352, (uint64_t)@"venue_group", v354);

  v355 = (void *)MEMORY[0x189607968];
  uint64_t v360 = objc_msgSend_supportsWPS(self, v356, v357, v358, v359);
  objc_msgSend_numberWithBool_(v355, v361, v360, v362, v363);
  v364 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v365, (uint64_t)v364, (uint64_t)@"supports_wps", v366);

  v367 = (void *)MEMORY[0x189607968];
  uint64_t v372 = objc_msgSend_supportsiAPOverWiFi(self, v368, v369, v370, v371);
  objc_msgSend_numberWithBool_(v367, v373, v372, v374, v375);
  v376 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v377, (uint64_t)v376, (uint64_t)@"supports_iap_over_wifi", v378);

  v379 = (void *)MEMORY[0x189607968];
  uint64_t v384 = objc_msgSend_supports2GHzNetworks(self, v380, v381, v382, v383);
  objc_msgSend_numberWithBool_(v379, v385, v384, v386, v387);
  v388 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v389, (uint64_t)v388, (uint64_t)@"supports_2ghz_networks", v390);

  v391 = (void *)MEMORY[0x189607968];
  uint64_t v396 = objc_msgSend_supports5GHzNetworks(self, v392, v393, v394, v395);
  objc_msgSend_numberWithBool_(v391, v397, v396, v398, v399);
  v400 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v401, (uint64_t)v400, (uint64_t)@"supports_5ghz_networks", v402);

  v403 = (void *)MEMORY[0x189607968];
  uint64_t v408 = objc_msgSend_supportsCarPlay(self, v404, v405, v406, v407);
  objc_msgSend_numberWithBool_(v403, v409, v408, v410, v411);
  v412 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v413, (uint64_t)v412, (uint64_t)@"supports_carplay", v414);

  v415 = (void *)MEMORY[0x189607968];
  uint64_t v420 = objc_msgSend_supportsHomeKit(self, v416, v417, v418, v419);
  objc_msgSend_numberWithBool_(v415, v421, v420, v422, v423);
  v424 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v425, (uint64_t)v424, (uint64_t)@"supports_homekit", v426);

  v427 = (void *)MEMORY[0x189607968];
  uint64_t v432 = objc_msgSend_supportsHomeKit2(self, v428, v429, v430, v431);
  objc_msgSend_numberWithBool_(v427, v433, v432, v434, v435);
  v436 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v437, (uint64_t)v436, (uint64_t)@"supports_homekit2", v438);

  v439 = (void *)MEMORY[0x189607968];
  uint64_t v444 = objc_msgSend_supportsAirPlay(self, v440, v441, v442, v443);
  objc_msgSend_numberWithBool_(v439, v445, v444, v446, v447);
  v448 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v449, (uint64_t)v448, (uint64_t)@"supports_airplay", v450);

  v451 = (void *)MEMORY[0x189607968];
  uint64_t v456 = objc_msgSend_supportsAirPlay2(self, v452, v453, v454, v455);
  objc_msgSend_numberWithBool_(v451, v457, v456, v458, v459);
  v460 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v461, (uint64_t)v460, (uint64_t)@"supports_airplay2", v462);

  v463 = (void *)MEMORY[0x189607968];
  uint64_t v468 = objc_msgSend_supportsAirPrint(self, v464, v465, v466, v467);
  objc_msgSend_numberWithBool_(v463, v469, v468, v470, v471);
  v472 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v473, (uint64_t)v472, (uint64_t)@"supports_airprint", v474);

  v475 = (void *)MEMORY[0x189607968];
  uint64_t v480 = objc_msgSend_supportsMFi(self, v476, v477, v478, v479);
  objc_msgSend_numberWithBool_(v475, v481, v480, v482, v483);
  v484 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v485, (uint64_t)v484, (uint64_t)@"supports_mfi", v486);

  v487 = (void *)MEMORY[0x189607968];
  uint64_t v492 = objc_msgSend_supportsMFi(self, v488, v489, v490, v491);
  objc_msgSend_numberWithBool_(v487, v493, v492, v494, v495);
  v496 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v497, (uint64_t)v496, (uint64_t)@"supports_mfi", v498);

  v499 = (void *)MEMORY[0x189607968];
  uint64_t v504 = objc_msgSend_supportsMFiHardwareAuth(self, v500, v501, v502, v503);
  objc_msgSend_numberWithBool_(v499, v505, v504, v506, v507);
  v508 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v509, (uint64_t)v508, (uint64_t)@"supports_mfi_hardware_auth", v510);

  v511 = (void *)MEMORY[0x189607968];
  uint64_t v516 = objc_msgSend_supportsMFiSoftwareTokenAuth(self, v512, v513, v514, v515);
  objc_msgSend_numberWithBool_(v511, v517, v516, v518, v519);
  v520 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_( v3,  v521,  (uint64_t)v520,  (uint64_t)@"supports_mfi_software_token_auth",  v522);

  v523 = (void *)MEMORY[0x189607968];
  uint64_t v528 = objc_msgSend_supportsMFiSoftwareCertAuth(self, v524, v525, v526, v527);
  objc_msgSend_numberWithBool_(v523, v529, v528, v530, v531);
  v532 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_( v3,  v533,  (uint64_t)v532,  (uint64_t)@"supports_mfi_software_cert_auth",  v534);

  v535 = (void *)MEMORY[0x189607968];
  uint64_t v540 = objc_msgSend_supportsSecureWAC(self, v536, v537, v538, v539);
  objc_msgSend_numberWithBool_(v535, v541, v540, v542, v543);
  v544 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v545, (uint64_t)v544, (uint64_t)@"supports_secure_wac", v546);

  v547 = (void *)MEMORY[0x189607968];
  uint64_t v552 = objc_msgSend_supportsWoW(self, v548, v549, v550, v551);
  objc_msgSend_numberWithBool_(v547, v553, v552, v554, v555);
  v556 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v557, (uint64_t)v556, (uint64_t)@"supports_wow", v558);

  objc_msgSend_countryCode(self, v559, v560, v561, v562);
  v563 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v564, (uint64_t)v563, (uint64_t)@"country_code", v565);

  objc_msgSend_networkName(self, v566, v567, v568, v569);
  v570 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v571, (uint64_t)v570, (uint64_t)@"networkName", v572);

  objc_msgSend_BSSID(self, v573, v574, v575, v576);
  v577 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v578, (uint64_t)v577, (uint64_t)@"bssid", v579);

  objc_msgSend_HESSID(self, v580, v581, v582, v583);
  v584 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v585, (uint64_t)v584, (uint64_t)@"hessid", v586);

  objc_msgSend_friendlyName(self, v587, v588, v589, v590);
  v591 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v592, (uint64_t)v591, (uint64_t)@"friendly_name", v593);

  objc_msgSend_manufacturerName(self, v594, v595, v596, v597);
  v598 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v599, (uint64_t)v598, (uint64_t)@"manufacturer_name", v600);

  objc_msgSend_modelName(self, v601, v602, v603, v604);
  v605 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v606, (uint64_t)v605, (uint64_t)@"model_name", v607);

  objc_msgSend_displayName(self, v608, v609, v610, v611);
  v612 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v613, (uint64_t)v612, (uint64_t)@"display_name", v614);

  objc_msgSend_primaryMAC(self, v615, v616, v617, v618);
  v619 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v620, (uint64_t)v619, (uint64_t)@"primary_mac", v621);

  objc_msgSend_bluetoothMAC(self, v622, v623, v624, v625);
  v626 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v627, (uint64_t)v626, (uint64_t)@"bluetooth_name", v628);

  objc_msgSend_deviceID(self, v629, v630, v631, v632);
  v633 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v634, (uint64_t)v633, (uint64_t)@"device_id", v635);

  objc_msgSend_cellularNetworkInfo(self, v636, v637, v638, v639);
  v640 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v641, (uint64_t)v640, (uint64_t)@"cellular_network_info", v642);

  objc_msgSend_NAIRealmNameList(self, v643, v644, v645, v646);
  v647 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v648, (uint64_t)v647, (uint64_t)@"nai_realm_name_list", v649);

  objc_msgSend_roamingConsortiumList(self, v650, v651, v652, v653);
  v654 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v655, (uint64_t)v654, (uint64_t)@"roaming_consortium_list", v656);

  objc_msgSend_operatorFriendlyNameList(self, v657, v658, v659, v660);
  v661 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_( v3,  v662,  (uint64_t)v661,  (uint64_t)@"operator_friendly_name_list",  v663);

  objc_msgSend_domainNameList(self, v664, v665, v666, v667);
  v668 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v669, (uint64_t)v668, (uint64_t)@"domain_name_list", v670);

  v671 = (void *)MEMORY[0x189607968];
  uint64_t isWiFi6E = objc_msgSend_isWiFi6E(self, v672, v673, v674, v675);
  objc_msgSend_numberWithBool_(v671, v677, isWiFi6E, v678, v679);
  v680 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v681, (uint64_t)v680, (uint64_t)@"is_6e", v682);

  v683 = (void *)MEMORY[0x189607968];
  uint64_t isFILSDiscoveryFrame = objc_msgSend_isFILSDiscoveryFrame(self, v684, v685, v686, v687);
  objc_msgSend_numberWithBool_(v683, v689, isFILSDiscoveryFrame, v690, v691);
  v692 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v693, (uint64_t)v692, (uint64_t)@"is_filsd", v694);

  v695 = (void *)MEMORY[0x189607968];
  uint64_t v700 = objc_msgSend_shortSSID(self, v696, v697, v698, v699);
  objc_msgSend_numberWithUnsignedInteger_(v695, v701, v700, v702, v703);
  v704 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v705, (uint64_t)v704, (uint64_t)@"short_ssid", v706);

  v707 = (void *)MEMORY[0x189607968];
  uint64_t isAssociationDisallowed = objc_msgSend_isAssociationDisallowed(self, v708, v709, v710, v711);
  objc_msgSend_numberWithBool_(v707, v713, isAssociationDisallowed, v714, v715);
  v716 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v717, (uint64_t)v716, (uint64_t)@"is_assoc_disallowed", v718);

  __int128 v775 = 0u;
  __int128 v776 = 0u;
  __int128 v773 = 0u;
  __int128 v774 = 0u;
  objc_msgSend_RNRBSSList(self, v719, v720, v721, v722);
  v723 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v725 = objc_msgSend_countByEnumeratingWithState_objects_count_(v723, v724, (uint64_t)&v773, (uint64_t)v778, 16);
  if (v725)
  {
    uint64_t v730 = v725;
    v731 = 0LL;
    uint64_t v732 = *(void *)v774;
    do
    {
      for (uint64_t i = 0LL; i != v730; ++i)
      {
        if (*(void *)v774 != v732) {
          objc_enumerationMutation(v723);
        }
        v734 = *(void **)(*((void *)&v773 + 1) + 8 * i);
        if (!v731)
        {
          objc_msgSend_array(MEMORY[0x189603FA8], v726, v727, v728, v729);
          v731 = (void *)objc_claimAutoreleasedReturnValue();
        }

        objc_msgSend_JSONCompatibleKeyValueMap(v734, v726, v727, v728, v729);
        v735 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v731, v736, (uint64_t)v735, v737, v738);
      }

      uint64_t v730 = objc_msgSend_countByEnumeratingWithState_objects_count_(v723, v726, (uint64_t)&v773, (uint64_t)v778, 16);
    }

    while (v730);
  }

  else
  {
    v731 = 0LL;
  }

  objc_msgSend_setObject_forKeyedSubscript_(v3, v739, (uint64_t)v731, (uint64_t)@"rnr_bss_list", v740);
  __int128 v771 = 0u;
  __int128 v772 = 0u;
  __int128 v769 = 0u;
  __int128 v770 = 0u;
  objc_msgSend_RNRChannelList(self, v741, v742, v743, v744, 0);
  v745 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v747 = objc_msgSend_countByEnumeratingWithState_objects_count_(v745, v746, (uint64_t)&v769, (uint64_t)v777, 16);
  if (v747)
  {
    uint64_t v752 = v747;
    v753 = 0LL;
    uint64_t v754 = *(void *)v770;
    do
    {
      for (uint64_t j = 0LL; j != v752; ++j)
      {
        if (*(void *)v770 != v754) {
          objc_enumerationMutation(v745);
        }
        v756 = *(void **)(*((void *)&v769 + 1) + 8 * j);
        if (!v753)
        {
          objc_msgSend_array(MEMORY[0x189603FA8], v748, v749, v750, v751);
          v753 = (void *)objc_claimAutoreleasedReturnValue();
        }

        objc_msgSend_JSONCompatibleKeyValueMap(v756, v748, v749, v750, v751);
        v757 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v753, v758, (uint64_t)v757, v759, v760);
      }

      uint64_t v752 = objc_msgSend_countByEnumeratingWithState_objects_count_(v745, v748, (uint64_t)&v769, (uint64_t)v777, 16);
    }

    while (v752);
  }

  else
  {
    v753 = 0LL;
  }

  objc_msgSend_setObject_forKeyedSubscript_(v3, v761, (uint64_t)v753, (uint64_t)@"rnr_channel_list", v762);
  sub_1864586CC(v3, 0LL, 1u);
  v766 = (void *)objc_claimAutoreleasedReturnValue();
  if (v766)
  {
    objc_msgSend_dictionaryWithDictionary_(MEMORY[0x189603F68], v763, (uint64_t)v766, v764, v765);
    v767 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v767 = 0LL;
  }

  return v767;
}

- (id)__defaultProperties
{
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  for (uint64_t i = 0LL; i != 78; ++i)
  {
    objc_msgSend_numberWithInteger_(MEMORY[0x189607968], v5, i, v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v8, v11, (uint64_t)v10, v12, v13);
  }

  uint64_t v15 = (void *)objc_msgSend_copy(v8, v5, v14, v6, v7);

  return v15;
}

- (id)__requiredProperties
{
  return (id)objc_msgSend_setWithArray_(MEMORY[0x189604010], a2, (uint64_t)&unk_189E8AAE8, v2, v3);
}

- (id)__internalDictionaryFromScanRecord:(id)a3 knownNetworkProfile:(id)a4 includeProperties:(id)a5
{
  uint64_t v439 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_msgSend_dictionary(MEMORY[0x189603FC8], v11, v12, v13, v14);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x189603FE0];
  objc_msgSend___requiredProperties(self, v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithSet_(v16, v22, (uint64_t)v21, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend_unionSet_(v25, v26, (uint64_t)v10, v28, v29, v10);
  }

  else
  {
    objc_msgSend___defaultProperties(self, v26, v27, v28, v29, 0);
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_unionSet_(v25, v31, (uint64_t)v30, v32, v33);
  }

  __int128 v436 = 0u;
  __int128 v437 = 0u;
  __int128 v434 = 0u;
  __int128 v435 = 0u;
  id v34 = v25;
  uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v35, (uint64_t)&v434, (uint64_t)v438, 16);
  if (v36)
  {
    uint64_t v41 = v36;
    uint64_t v42 = *(void *)v435;
    while (1)
    {
      uint64_t v43 = 0LL;
      while (2)
      {
        if (*(void *)v435 != v42) {
          objc_enumerationMutation(v34);
        }
        switch(objc_msgSend_integerValue(*(void **)(*((void *)&v434 + 1) + 8 * v43), v37, v38, v39, v40))
        {
          case 1LL:
            objc_msgSend_setObject_forKeyedSubscript_(v15, v37, (uint64_t)v8, (uint64_t)&unk_189E88E20, v40);
            goto LABEL_222;
          case 2LL:
            uint64_t v44 = (void *)MEMORY[0x189607968];
            uint64_t v45 = objc_msgSend_timestamp(v8, v37, v38, v39, v40);
            objc_msgSend_numberWithUnsignedLongLong_(v44, v46, v45, v47, v48);
            uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = &unk_189E89498;
            goto LABEL_207;
          case 3LL:
            else {
              objc_msgSend_SSID(v8, v53, v54, v55, v56);
            }
            uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = &unk_189E88E38;
            goto LABEL_207;
          case 4LL:
            objc_msgSend_BSSID(v8, v37, v38, v39, v40);
            uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = &unk_189E88E08;
            goto LABEL_207;
          case 5LL:
            objc_msgSend_channelInfo(v8, v37, v38, v39, v40);
            uint64_t v248 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKeyedSubscript_(v15, v249, (uint64_t)v248, (uint64_t)&unk_189E88E50, v250);

            objc_msgSend_FILSPrimaryChannelInfo(v8, v37, v38, v39, v40);
            uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v51) {
              goto LABEL_208;
            }
            v52 = &unk_189E88E50;
            goto LABEL_207;
          case 6LL:
            objc_msgSend_countryCode(v8, v37, v38, v39, v40);
            uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = &unk_189E88E68;
            goto LABEL_207;
          case 7LL:
            uint64_t v57 = (void *)MEMORY[0x189607968];
            uint64_t v58 = objc_msgSend_RSSI(v8, v37, v38, v39, v40);
            objc_msgSend_numberWithInteger_(v57, v59, v58, v60, v61);
            uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = &unk_189E88E80;
            goto LABEL_207;
          case 8LL:
            v62 = (void *)MEMORY[0x189607968];
            uint64_t v63 = objc_msgSend_wasConnectedDuringSleep(v8, v37, v38, v39, v40);
            objc_msgSend_numberWithBool_(v62, v64, v63, v65, v66);
            uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = &unk_189E88E98;
            goto LABEL_207;
          case 9LL:
            uint64_t v255 = (void *)MEMORY[0x189607968];
            uint64_t v256 = objc_msgSend_noise(v8, v37, v38, v39, v40);
            objc_msgSend_numberWithInteger_(v255, v257, v256, v258, v259);
            uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = &unk_189E88EB0;
            goto LABEL_207;
          case 10LL:
            int hasFILSDiscoveryInformation = objc_msgSend_hasFILSDiscoveryInformation(v8, v37, v38, v39, v40);
            v265 = (void *)MEMORY[0x189607968];
            if (hasFILSDiscoveryInformation) {
              uint64_t v266 = objc_msgSend_FILSBeaconInterval(v8, v261, v262, v263, v264);
            }
            else {
              uint64_t v266 = objc_msgSend_beaconInterval(v8, v261, v262, v263, v264);
            }
            objc_msgSend_numberWithInteger_(v265, v267, v266, v268, v269);
            uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = &unk_189E88EC8;
            goto LABEL_207;
          case 11LL:
            uint64_t v67 = (void *)MEMORY[0x189607968];
            uint64_t isPasspoint = objc_msgSend_isPasspoint(v8, v37, v38, v39, v40);
            objc_msgSend_numberWithBool_(v67, v69, isPasspoint, v70, v71);
            uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = &unk_189E88F10;
            goto LABEL_207;
          case 12LL:
            uint64_t v72 = (void *)MEMORY[0x189607968];
            uint64_t isPersonalHotspot = objc_msgSend_isPersonalHotspot(v8, v37, v38, v39, v40);
            objc_msgSend_numberWithBool_(v72, v74, isPersonalHotspot, v75, v76);
            uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = &unk_189E88F28;
            goto LABEL_207;
          case 13LL:
            v77 = (void *)MEMORY[0x189607968];
            uint64_t isAppleSWAP = objc_msgSend_isAppleSWAP(v8, v37, v38, v39, v40);
            objc_msgSend_numberWithBool_(v77, v79, isAppleSWAP, v80, v81);
            uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = &unk_189E88F40;
            goto LABEL_207;
          case 14LL:
            if (objc_msgSend_hasFILSDiscoveryInformation(v8, v37, v38, v39, v40))
            {
              if (objc_msgSend_hasFILSCaps(v8, v82, v83, v84, v85))
              {
                else {
                  uint64_t v90 = &unk_189E88F70;
                }
              }

              else
              {
                uint64_t v90 = 0LL;
              }

              v247 = &unk_189E88F88;
LABEL_219:
              objc_msgSend_setObject_forKeyedSubscript_(v15, v86, (uint64_t)v90, (uint64_t)v247, v89);
              goto LABEL_222;
            }

            uint64_t v419 = objc_msgSend_APMode(v8, v82, v83, v84, v85);
            if (!(_DWORD)v419) {
              goto LABEL_222;
            }
            objc_msgSend_numberWithUnsignedInt_(MEMORY[0x189607968], v37, v419, v39, v40);
            uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = &unk_189E88F88;
            goto LABEL_207;
          case 15LL:
            uint64_t v270 = (void *)MEMORY[0x189607968];
            uint64_t isUnconfiguredAirPortBaseStation = objc_msgSend_isUnconfiguredAirPortBaseStation(v8, v37, v38, v39, v40);
            objc_msgSend_numberWithBool_(v270, v272, isUnconfiguredAirPortBaseStation, v273, v274);
            uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = &unk_189E88FD0;
            goto LABEL_207;
          case 16LL:
            uint64_t v275 = (void *)MEMORY[0x189607968];
            uint64_t v276 = objc_msgSend_airPortBaseStationModel(v8, v37, v38, v39, v40);
            objc_msgSend_numberWithInteger_(v275, v277, v276, v278, v279);
            uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = &unk_189E88FE8;
            goto LABEL_207;
          case 17LL:
            objc_msgSend_informationElementData(v8, v37, v38, v39, v40);
            uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = &unk_189E88FA0;
            goto LABEL_207;
          case 18LL:
            if (!objc_msgSend_hasFILSDiscoveryInformation(v8, v37, v38, v39, v40))
            {
              uint64_t v286 = (void *)MEMORY[0x189607968];
              uint64_t v287 = objc_msgSend_supportedPHYModes(v8, v280, v281, v282, v283);
              goto LABEL_181;
            }

            if (objc_msgSend_hasFILSCaps(v8, v280, v281, v282, v283))
            {
              uint64_t v286 = (void *)MEMORY[0x189607968];
              uint64_t v287 = objc_msgSend_FILSSupportedPHYModes(v8, v101, v284, v285, v104);
LABEL_181:
              objc_msgSend_numberWithUnsignedInt_(v286, v288, v287, v289, v290);
              uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = &unk_189E88EF8;
              goto LABEL_207;
            }

            uint64_t v420 = &unk_189E88EF8;
LABEL_221:
            objc_msgSend_setObject_forKeyedSubscript_(v15, v101, 0, (uint64_t)v420, v104);
LABEL_222:
            if (v41 != ++v43) {
              continue;
            }
            uint64_t v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v37, (uint64_t)&v434, (uint64_t)v438, 16);
            if (!v41) {
              goto LABEL_224;
            }
            break;
          case 19LL:
            uint64_t v91 = (void *)MEMORY[0x189607968];
            uint64_t v92 = objc_msgSend_supportedSecurityTypes(v8, v37, v38, v39, v40);
            objc_msgSend_numberWithUnsignedInteger_(v91, v93, v92, v94, v95);
            uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = &unk_189E88EE0;
            goto LABEL_207;
          case 20LL:
            uint64_t v96 = (void *)MEMORY[0x189607968];
            uint64_t v97 = objc_msgSend_WAPISubtype(v8, v37, v38, v39, v40);
            objc_msgSend_numberWithInteger_(v96, v98, v97, v99, v100);
            uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = &unk_189E88FB8;
            goto LABEL_207;
          case 21LL:
            objc_msgSend_WPAUnicastCiphers(v8, v37, v38, v39, v40);
            uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = &unk_189E893A8;
            goto LABEL_207;
          case 22LL:
            if (objc_msgSend_hasWPAIE(v8, v37, v38, v39, v40))
            {
              v105 = (void *)MEMORY[0x189607968];
              uint64_t v106 = objc_msgSend_WPAMulticastCipher(v8, v101, v102, v103, v104);
              objc_msgSend_numberWithUnsignedLongLong_(v105, v107, v106, v108, v109);
              uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = &unk_189E893C0;
              goto LABEL_207;
            }

            uint64_t v420 = &unk_189E893C0;
            goto LABEL_221;
          case 23LL:
            objc_msgSend_WPAAuthSelectors(v8, v37, v38, v39, v40);
            uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = &unk_189E893D8;
            goto LABEL_207;
          case 24LL:
            objc_msgSend_RSNUnicastCiphers(v8, v37, v38, v39, v40);
            uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = &unk_189E893F0;
            goto LABEL_207;
          case 25LL:
            if (objc_msgSend_hasRSNIE(v8, v37, v38, v39, v40))
            {
              v112 = (void *)MEMORY[0x189607968];
              uint64_t v113 = objc_msgSend_RSNMulticastCipher(v8, v101, v110, v111, v104);
              objc_msgSend_numberWithUnsignedLongLong_(v112, v114, v113, v115, v116);
              uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = &unk_189E89408;
              goto LABEL_207;
            }

            uint64_t v420 = &unk_189E89408;
            goto LABEL_221;
          case 26LL:
            if (objc_msgSend_hasRSNIE(v8, v37, v38, v39, v40))
            {
              uint64_t v119 = (void *)MEMORY[0x189607968];
              uint64_t v120 = objc_msgSend_RSNBroadcastCipher(v8, v101, v117, v118, v104);
              objc_msgSend_numberWithUnsignedLongLong_(v119, v121, v120, v122, v123);
              uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = &unk_189E89420;
              goto LABEL_207;
            }

            uint64_t v420 = &unk_189E89420;
            goto LABEL_221;
          case 27LL:
            objc_msgSend_RSNAuthSelectors(v8, v37, v38, v39, v40);
            uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = &unk_189E89438;
            goto LABEL_207;
          case 28LL:
            if (objc_msgSend_hasRSNIE(v8, v37, v38, v39, v40))
            {
              v293 = (void *)MEMORY[0x189607968];
              uint64_t v294 = objc_msgSend_RSNCapabilities(v8, v101, v291, v292, v104);
              objc_msgSend_numberWithUnsignedInt_(v293, v295, v294, v296, v297);
              uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = &unk_189E89450;
              goto LABEL_207;
            }

            uint64_t v420 = &unk_189E89450;
            goto LABEL_221;
          case 31LL:
            if (objc_msgSend_hasFILSDiscoveryInformation(v8, v37, v38, v39, v40))
            {
              if (objc_msgSend_hasFILSAccessNetworkOptions(v8, v124, v125, v126, v127))
              {
                v130 = (void *)MEMORY[0x189607968];
                uint64_t v131 = objc_msgSend_FILSAccessNetworkType(v8, v101, v128, v129, v104);
LABEL_156:
                objc_msgSend_numberWithUnsignedInt_(v130, v132, v131, v133, v134);
                uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
                v52 = &unk_189E89000;
                goto LABEL_207;
              }
            }

            else if (objc_msgSend_hasInterworkingIE(v8, v124, v125, v126, v127))
            {
              v130 = (void *)MEMORY[0x189607968];
              uint64_t v131 = objc_msgSend_accessNetworkType(v8, v101, v421, v422, v104);
              goto LABEL_156;
            }

            uint64_t v420 = &unk_189E89000;
            goto LABEL_221;
          case 32LL:
            if (objc_msgSend_hasFILSDiscoveryInformation(v8, v37, v38, v39, v40))
            {
              if (objc_msgSend_hasFILSAccessNetworkOptions(v8, v135, v136, v137, v138))
              {
                v141 = (void *)MEMORY[0x189607968];
                uint64_t isInternetAccessible = objc_msgSend_FILSIsInternetAccessible(v8, v101, v139, v140, v104);
LABEL_159:
                objc_msgSend_numberWithBool_(v141, v143, isInternetAccessible, v144, v145);
                uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
                v52 = &unk_189E89018;
                goto LABEL_207;
              }
            }

            else if (objc_msgSend_hasInterworkingIE(v8, v135, v136, v137, v138))
            {
              v141 = (void *)MEMORY[0x189607968];
              uint64_t isInternetAccessible = objc_msgSend_isInternetAccessible(v8, v101, v423, v424, v104);
              goto LABEL_159;
            }

            uint64_t v420 = &unk_189E89018;
            goto LABEL_221;
          case 33LL:
            if (objc_msgSend_hasFILSDiscoveryInformation(v8, v37, v38, v39, v40))
            {
              if (objc_msgSend_hasFILSAccessNetworkOptions(v8, v298, v299, v300, v301))
              {
                v304 = (void *)MEMORY[0x189607968];
                uint64_t isAdditionalStepRequiredForAccess = objc_msgSend_FILSIsAdditionalStepRequiredForAccess( v8,  v101,  v302,  v303,  v104);
LABEL_185:
                objc_msgSend_numberWithBool_(v304, v306, isAdditionalStepRequiredForAccess, v307, v308);
                uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
                v52 = &unk_189E89030;
                goto LABEL_207;
              }
            }

            else if (objc_msgSend_hasInterworkingIE(v8, v298, v299, v300, v301))
            {
              v304 = (void *)MEMORY[0x189607968];
              uint64_t isAdditionalStepRequiredForAccess = objc_msgSend_isAdditionalStepRequiredForAccess( v8,  v101,  v427,  v428,  v104);
              goto LABEL_185;
            }

            uint64_t v420 = &unk_189E89030;
            goto LABEL_221;
          case 34LL:
            if (objc_msgSend_hasFILSDiscoveryInformation(v8, v37, v38, v39, v40))
            {
              if (objc_msgSend_hasFILSAccessNetworkOptions(v8, v146, v147, v148, v149))
              {
                uint64_t v152 = (void *)MEMORY[0x189607968];
                uint64_t isEmergencyServicesReachable = objc_msgSend_FILSIsEmergencyServicesReachable(v8, v101, v150, v151, v104);
LABEL_162:
                objc_msgSend_numberWithBool_(v152, v154, isEmergencyServicesReachable, v155, v156);
                uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
                v52 = &unk_189E89048;
                goto LABEL_207;
              }
            }

            else if (objc_msgSend_hasInterworkingIE(v8, v146, v147, v148, v149))
            {
              uint64_t v152 = (void *)MEMORY[0x189607968];
              uint64_t isEmergencyServicesReachable = objc_msgSend_isEmergencyServicesReachable(v8, v101, v425, v426, v104);
              goto LABEL_162;
            }

            uint64_t v420 = &unk_189E89048;
            goto LABEL_221;
          case 35LL:
            if (objc_msgSend_hasFILSDiscoveryInformation(v8, v37, v38, v39, v40))
            {
              if (objc_msgSend_hasFILSAccessNetworkOptions(v8, v309, v310, v311, v312))
              {
                uint64_t v315 = (void *)MEMORY[0x189607968];
                uint64_t isUnauthenticatedEmergencyServiceAccessible = objc_msgSend_FILSIsUnauthenticatedEmergencyServiceAccessible( v8,  v101,  v313,  v314,  v104);
LABEL_188:
                objc_msgSend_numberWithBool_(v315, v317, isUnauthenticatedEmergencyServiceAccessible, v318, v319);
                uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
                v52 = &unk_189E89060;
                goto LABEL_207;
              }
            }

            else if (objc_msgSend_hasInterworkingIE(v8, v309, v310, v311, v312))
            {
              uint64_t v315 = (void *)MEMORY[0x189607968];
              uint64_t isUnauthenticatedEmergencyServiceAccessible = objc_msgSend_isUnauthenticatedEmergencyServiceAccessible( v8,  v101,  v429,  v430,  v104);
              goto LABEL_188;
            }

            uint64_t v420 = &unk_189E89060;
            goto LABEL_221;
          case 36LL:
            if (objc_msgSend_hasInterworkingIE(v8, v37, v38, v39, v40))
            {
              uint64_t v159 = (void *)MEMORY[0x189607968];
              uint64_t v160 = objc_msgSend_venueGroup(v8, v101, v157, v158, v104);
              objc_msgSend_numberWithInteger_(v159, v161, v160, v162, v163);
              uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = &unk_189E89078;
              goto LABEL_207;
            }

            uint64_t v420 = &unk_189E89078;
            goto LABEL_221;
          case 37LL:
            if (objc_msgSend_hasInterworkingIE(v8, v37, v38, v39, v40))
            {
              uint64_t v322 = (void *)MEMORY[0x189607968];
              uint64_t v323 = objc_msgSend_venueType(v8, v101, v320, v321, v104);
              objc_msgSend_numberWithInteger_(v322, v324, v323, v325, v326);
              uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = &unk_189E89090;
              goto LABEL_207;
            }

            uint64_t v420 = &unk_189E89090;
            goto LABEL_221;
          case 38LL:
            if (objc_msgSend_hasInterworkingIE(v8, v37, v38, v39, v40))
            {
              objc_msgSend_HESSID(v8, v101, v327, v328, v104);
              uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = &unk_189E890A8;
              goto LABEL_207;
            }

            uint64_t v420 = &unk_189E890A8;
            goto LABEL_221;
          case 39LL:
            if (objc_msgSend_hasAppleIE(v8, v37, v38, v39, v40))
            {
              v166 = (void *)MEMORY[0x189607968];
              uint64_t isUnconfiguredDevice = objc_msgSend_isUnconfiguredDevice(v8, v101, v164, v165, v104);
              objc_msgSend_numberWithBool_(v166, v168, isUnconfiguredDevice, v169, v170);
              uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = &unk_189E890C0;
              goto LABEL_207;
            }

            uint64_t v420 = &unk_189E890C0;
            goto LABEL_221;
          case 40LL:
            if (objc_msgSend_hasAppleIE(v8, v37, v38, v39, v40))
            {
              v331 = (void *)MEMORY[0x189607968];
              uint64_t v332 = objc_msgSend_providesInternetAccess(v8, v101, v329, v330, v104);
              objc_msgSend_numberWithBool_(v331, v333, v332, v334, v335);
              uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = &unk_189E890D8;
              goto LABEL_207;
            }

            uint64_t v420 = &unk_189E890D8;
            goto LABEL_221;
          case 41LL:
            if (objc_msgSend_hasAppleIE(v8, v37, v38, v39, v40))
            {
              v173 = (void *)MEMORY[0x189607968];
              uint64_t v174 = objc_msgSend_supportsWPS(v8, v101, v171, v172, v104);
              objc_msgSend_numberWithBool_(v173, v175, v174, v176, v177);
              uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = &unk_189E890F0;
              goto LABEL_207;
            }

            uint64_t v420 = &unk_189E890F0;
            goto LABEL_221;
          case 42LL:
            if (objc_msgSend_hasAppleIE(v8, v37, v38, v39, v40))
            {
              uint64_t v180 = (void *)MEMORY[0x189607968];
              uint64_t v181 = objc_msgSend_supportsiAPOverWiFi(v8, v101, v178, v179, v104);
              objc_msgSend_numberWithBool_(v180, v182, v181, v183, v184);
              uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = &unk_189E89108;
              goto LABEL_207;
            }

            uint64_t v420 = &unk_189E89108;
            goto LABEL_221;
          case 43LL:
            if (objc_msgSend_hasAppleIE(v8, v37, v38, v39, v40))
            {
              uint64_t v187 = (void *)MEMORY[0x189607968];
              uint64_t v188 = objc_msgSend_supports2GHzNetworks(v8, v101, v185, v186, v104);
              objc_msgSend_numberWithBool_(v187, v189, v188, v190, v191);
              uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = &unk_189E89120;
              goto LABEL_207;
            }

            uint64_t v420 = &unk_189E89120;
            goto LABEL_221;
          case 44LL:
            if (objc_msgSend_hasAppleIE(v8, v37, v38, v39, v40))
            {
              v194 = (void *)MEMORY[0x189607968];
              uint64_t v195 = objc_msgSend_supports5GHzNetworks(v8, v101, v192, v193, v104);
              objc_msgSend_numberWithBool_(v194, v196, v195, v197, v198);
              uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = &unk_189E89138;
              goto LABEL_207;
            }

            uint64_t v420 = &unk_189E89138;
            goto LABEL_221;
          case 45LL:
            if (objc_msgSend_hasAppleIE(v8, v37, v38, v39, v40))
            {
              uint64_t v338 = (void *)MEMORY[0x189607968];
              uint64_t v339 = objc_msgSend_supportsCarPlay(v8, v101, v336, v337, v104);
              objc_msgSend_numberWithBool_(v338, v340, v339, v341, v342);
              uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = &unk_189E89150;
              goto LABEL_207;
            }

            uint64_t v420 = &unk_189E89150;
            goto LABEL_221;
          case 46LL:
            if (objc_msgSend_hasAppleIE(v8, v37, v38, v39, v40))
            {
              v201 = (void *)MEMORY[0x189607968];
              uint64_t v202 = objc_msgSend_supportsHomeKit(v8, v101, v199, v200, v104);
              objc_msgSend_numberWithBool_(v201, v203, v202, v204, v205);
              uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = &unk_189E89168;
              goto LABEL_207;
            }

            uint64_t v420 = &unk_189E89168;
            goto LABEL_221;
          case 47LL:
            if (objc_msgSend_hasAppleIE(v8, v37, v38, v39, v40))
            {
              v208 = (void *)MEMORY[0x189607968];
              uint64_t v209 = objc_msgSend_supportsHomeKit2(v8, v101, v206, v207, v104);
              objc_msgSend_numberWithBool_(v208, v210, v209, v211, v212);
              uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = &unk_189E89180;
              goto LABEL_207;
            }

            uint64_t v420 = &unk_189E89180;
            goto LABEL_221;
          case 48LL:
            if (objc_msgSend_hasAppleIE(v8, v37, v38, v39, v40))
            {
              uint64_t v345 = (void *)MEMORY[0x189607968];
              uint64_t v346 = objc_msgSend_supportsAirPlay(v8, v101, v343, v344, v104);
              objc_msgSend_numberWithBool_(v345, v347, v346, v348, v349);
              uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = &unk_189E89198;
              goto LABEL_207;
            }

            uint64_t v420 = &unk_189E89198;
            goto LABEL_221;
          case 49LL:
            if (objc_msgSend_hasAppleIE(v8, v37, v38, v39, v40))
            {
              v352 = (void *)MEMORY[0x189607968];
              uint64_t v353 = objc_msgSend_supportsAirPlay2(v8, v101, v350, v351, v104);
              objc_msgSend_numberWithBool_(v352, v354, v353, v355, v356);
              uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = &unk_189E891B0;
              goto LABEL_207;
            }

            uint64_t v420 = &unk_189E891B0;
            goto LABEL_221;
          case 50LL:
            if (objc_msgSend_hasAppleIE(v8, v37, v38, v39, v40))
            {
              uint64_t v359 = (void *)MEMORY[0x189607968];
              uint64_t v360 = objc_msgSend_supportsAirPrint(v8, v101, v357, v358, v104);
              objc_msgSend_numberWithBool_(v359, v361, v360, v362, v363);
              uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = &unk_189E891C8;
              goto LABEL_207;
            }

            uint64_t v420 = &unk_189E891C8;
            goto LABEL_221;
          case 51LL:
            if (objc_msgSend_hasAppleIE(v8, v37, v38, v39, v40))
            {
              uint64_t v366 = (void *)MEMORY[0x189607968];
              uint64_t v367 = objc_msgSend_supportsMFi(v8, v101, v364, v365, v104);
              objc_msgSend_numberWithBool_(v366, v368, v367, v369, v370);
              uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = &unk_189E891E0;
              goto LABEL_207;
            }

            uint64_t v420 = &unk_189E891E0;
            goto LABEL_221;
          case 52LL:
            if (objc_msgSend_hasAppleIE(v8, v37, v38, v39, v40))
            {
              uint64_t v215 = (void *)MEMORY[0x189607968];
              uint64_t v216 = objc_msgSend_supportsMFiHardwareAuth(v8, v101, v213, v214, v104);
              objc_msgSend_numberWithBool_(v215, v217, v216, v218, v219);
              uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = &unk_189E891F8;
              goto LABEL_207;
            }

            uint64_t v420 = &unk_189E891F8;
            goto LABEL_221;
          case 53LL:
            if (objc_msgSend_hasAppleIE(v8, v37, v38, v39, v40))
            {
              uint64_t v222 = (void *)MEMORY[0x189607968];
              uint64_t v223 = objc_msgSend_supportsSoftwareTokenAuth(v8, v101, v220, v221, v104);
              objc_msgSend_numberWithBool_(v222, v224, v223, v225, v226);
              uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = &unk_189E89210;
              goto LABEL_207;
            }

            uint64_t v420 = &unk_189E89210;
            goto LABEL_221;
          case 54LL:
            if (objc_msgSend_hasAppleIE(v8, v37, v38, v39, v40))
            {
              v373 = (void *)MEMORY[0x189607968];
              uint64_t v374 = objc_msgSend_supportsSoftwareCertAuth(v8, v101, v371, v372, v104);
              objc_msgSend_numberWithBool_(v373, v375, v374, v376, v377);
              uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = &unk_189E89228;
              goto LABEL_207;
            }

            uint64_t v420 = &unk_189E89228;
            goto LABEL_221;
          case 55LL:
            if (objc_msgSend_hasAppleIE(v8, v37, v38, v39, v40))
            {
              v380 = (void *)MEMORY[0x189607968];
              uint64_t v381 = objc_msgSend_supportsSecureWAC(v8, v101, v378, v379, v104);
              objc_msgSend_numberWithBool_(v380, v382, v381, v383, v384);
              uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = &unk_189E89240;
              goto LABEL_207;
            }

            uint64_t v420 = &unk_189E89240;
            goto LABEL_221;
          case 56LL:
            if (objc_msgSend_hasAppleIE(v8, v37, v38, v39, v40))
            {
              uint64_t v229 = (void *)MEMORY[0x189607968];
              uint64_t v230 = objc_msgSend_supportsWoW(v8, v101, v227, v228, v104);
              objc_msgSend_numberWithBool_(v229, v231, v230, v232, v233);
              uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = &unk_189E89258;
              goto LABEL_207;
            }

            uint64_t v420 = &unk_189E89258;
            goto LABEL_221;
          case 57LL:
            if (objc_msgSend_hasAppleIE(v8, v37, v38, v39, v40))
            {
              objc_msgSend_friendlyName(v8, v101, v385, v386, v104);
              uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = &unk_189E89270;
              goto LABEL_207;
            }

            uint64_t v420 = &unk_189E89270;
            goto LABEL_221;
          case 58LL:
            if (objc_msgSend_hasAppleIE(v8, v37, v38, v39, v40))
            {
              objc_msgSend_manufacturerName(v8, v101, v387, v388, v104);
              uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = &unk_189E89288;
              goto LABEL_207;
            }

            uint64_t v420 = &unk_189E89288;
            goto LABEL_221;
          case 59LL:
            if (objc_msgSend_hasAppleIE(v8, v37, v38, v39, v40))
            {
              objc_msgSend_modelName(v8, v101, v234, v235, v104);
              uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = &unk_189E892A0;
              goto LABEL_207;
            }

            uint64_t v420 = &unk_189E892A0;
            goto LABEL_221;
          case 60LL:
            if (objc_msgSend_hasAppleIE(v8, v37, v38, v39, v40))
            {
              objc_msgSend_displayName(v8, v101, v389, v390, v104);
              uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = &unk_189E892B8;
              goto LABEL_207;
            }

            uint64_t v420 = &unk_189E892B8;
            goto LABEL_221;
          case 61LL:
            if (objc_msgSend_hasAppleIE(v8, v37, v38, v39, v40))
            {
              objc_msgSend_primaryMAC(v8, v101, v391, v392, v104);
              uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = &unk_189E892D0;
              goto LABEL_207;
            }

            uint64_t v420 = &unk_189E892D0;
            goto LABEL_221;
          case 62LL:
            if (objc_msgSend_hasAppleIE(v8, v37, v38, v39, v40))
            {
              objc_msgSend_bluetoothMAC(v8, v101, v393, v394, v104);
              uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = &unk_189E892E8;
              goto LABEL_207;
            }

            uint64_t v420 = &unk_189E892E8;
            goto LABEL_221;
          case 63LL:
            if ((objc_msgSend_hasAppleIE(v8, v37, v38, v39, v40) & 1) == 0)
            {
              uint64_t v420 = &unk_189E89300;
              goto LABEL_221;
            }

            objc_msgSend_deviceID(v8, v101, v395, v396, v104);
            uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = &unk_189E89300;
LABEL_207:
            objc_msgSend_setObject_forKeyedSubscript_(v15, v49, (uint64_t)v51, (uint64_t)v52, v50);
            goto LABEL_208;
          case 64LL:
            objc_msgSend_ANQPResponse(v8, v37, v38, v39, v40);
            uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = &unk_189E89318;
            goto LABEL_207;
          case 65LL:
            objc_msgSend_ANQPResponse(v8, v37, v38, v39, v40);
            uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
            if (v51)
            {
              objc_msgSend_cellularNetworkInfo(v8, v236, v397, v398, v239);
              v240 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKeyedSubscript_(v15, v399, (uint64_t)v240, (uint64_t)&unk_189E89330, v400);
              goto LABEL_140;
            }

            uint64_t v431 = &unk_189E89330;
            goto LABEL_216;
          case 66LL:
            objc_msgSend_ANQPResponse(v8, v37, v38, v39, v40);
            uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
            if (v51)
            {
              objc_msgSend_NAIRealmNameList(v8, v236, v401, v402, v239);
              v240 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKeyedSubscript_(v15, v403, (uint64_t)v240, (uint64_t)&unk_189E89348, v404);
              goto LABEL_140;
            }

            uint64_t v431 = &unk_189E89348;
            goto LABEL_216;
          case 67LL:
            objc_msgSend_ANQPResponse(v8, v37, v38, v39, v40);
            uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
            if (v51)
            {
              objc_msgSend_roamingConsortiumList(v8, v236, v237, v238, v239);
              v240 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKeyedSubscript_(v15, v241, (uint64_t)v240, (uint64_t)&unk_189E89360, v242);
              goto LABEL_140;
            }

            uint64_t v431 = &unk_189E89360;
            goto LABEL_216;
          case 68LL:
            objc_msgSend_ANQPResponse(v8, v37, v38, v39, v40);
            uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
            if (v51)
            {
              objc_msgSend_operatorFriendlyNameList(v8, v236, v405, v406, v239);
              v240 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKeyedSubscript_(v15, v407, (uint64_t)v240, (uint64_t)&unk_189E89378, v408);
              goto LABEL_140;
            }

            uint64_t v431 = &unk_189E89378;
            goto LABEL_216;
          case 69LL:
            objc_msgSend_ANQPResponse(v8, v37, v38, v39, v40);
            uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
            if (v51)
            {
              objc_msgSend_domainNameList(v8, v236, v243, v244, v239);
              v240 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKeyedSubscript_(v15, v245, (uint64_t)v240, (uint64_t)&unk_189E89390, v246);
LABEL_140:
            }

            else
            {
              uint64_t v431 = &unk_189E89390;
LABEL_216:
              objc_msgSend_setObject_forKeyedSubscript_(v15, v236, 0, (uint64_t)v431, v239);
            }

- (CWFScanResult)initWithScanRecord:(id)a3 knownNetworkProfile:(id)a4 includeProperties:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___CWFScanResult;
  uint64_t v11 = -[CWFScanResult init](&v17, sel_init);
  uint64_t v13 = v11;
  if (!v8
    || !v11
    || (objc_msgSend___internalDictionaryFromScanRecord_knownNetworkProfile_includeProperties_( v11,  v12,  (uint64_t)v8,  (uint64_t)v9,  (uint64_t)v10),  uint64_t v14 = objc_claimAutoreleasedReturnValue(),  internal = v13->_internal,  v13->_internal = (NSMutableDictionary *)v14,  internal,  !v13->_internal))
  {

    uint64_t v13 = 0LL;
  }

  return v13;
}

- (CWFScanResult)initWithScanRecord:(id)a3 includeProperties:(id)a4
{
  return (CWFScanResult *)objc_msgSend_initWithScanRecord_knownNetworkProfile_includeProperties_( self,  a2,  (uint64_t)a3,  0,  (uint64_t)a4);
}

- (CWFScanResult)scanResultWithMatchingKnownNetworkProfile:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(&OBJC_CLASS___CWFScanResult);
  id v10 = (void *)objc_msgSend_mutableCopy(self->_internal, v6, v7, v8, v9);
  objc_msgSend_setObject_forKeyedSubscript_(v10, v11, (uint64_t)v4, (uint64_t)&unk_189E89480, v12);

  objc_msgSend_setInternal_(v5, v13, (uint64_t)v10, v14, v15);
  return v5;
}

- (id)filteredScanResultWithProperties:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(&OBJC_CLASS___CWFScanResult);
  id v10 = (void *)objc_msgSend_mutableCopy(self->_internal, v6, v7, v8, v9);
  objc_msgSend_properties(self, v11, v12, v13, v14);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v20 = (void *)objc_msgSend_mutableCopy(v15, v16, v17, v18, v19);

  objc_msgSend___requiredProperties(self, v21, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_minusSet_(v20, v26, (uint64_t)v25, v27, v28);

  if (v4)
  {
    objc_msgSend_minusSet_(v20, v29, (uint64_t)v4, v31, v32);
  }

  else
  {
    objc_msgSend___defaultProperties(self, v29, v30, v31, v32);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_minusSet_(v20, v38, (uint64_t)v37, v39, v40);
  }

  objc_msgSend_allObjects(v20, v33, v34, v35, v36);
  uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObjectsForKeys_(v10, v42, (uint64_t)v41, v43, v44);

  objc_msgSend_setInternal_(v5, v45, (uint64_t)v10, v46, v47);
  return v5;
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

  if (v9 == v14)
  {
    if (v19 == v24) {
      return 0LL;
    }
    uint64_t v36 = v19;
    uint64_t v37 = v29;
    uint64_t v38 = v24;
  }

  else
  {
    uint64_t v36 = v9;
    uint64_t v37 = v29;
    uint64_t v38 = v14;
  }

  return CWFCompareSecurityType(v36, 0LL, v37, v38, 0LL, v34);
}

- (int64_t)compareSupportedPHYModes:(id)a3
{
  id v4 = a3;
  int v9 = objc_msgSend_fastestSupportedPHYMode(self, v5, v6, v7, v8);
  int v14 = objc_msgSend_slowestSupportedPHYMode(self, v10, v11, v12, v13);
  int v19 = objc_msgSend_fastestSupportedPHYMode(v4, v15, v16, v17, v18);
  int v24 = objc_msgSend_slowestSupportedPHYMode(v4, v20, v21, v22, v23);

  if (v9 == v19)
  {
    if (v14 == v24) {
      return 0LL;
    }
    int v26 = v14;
    int v27 = v24;
  }

  else
  {
    int v26 = v9;
    int v27 = v19;
  }

  return CWFComparePHYMode(v26, v27);
}

- (int64_t)compareLowDataModes:(id)a3
{
  id v4 = a3;
  objc_msgSend_matchingKnownNetworkProfile(self, v5, v6, v7, v8);
  int v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = objc_msgSend_lowDataMode(v9, v10, v11, v12, v13);

  objc_msgSend_matchingKnownNetworkProfile(v4, v15, v16, v17, v18);
  int v19 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v24 = objc_msgSend_lowDataMode(v19, v20, v21, v22, v23);
  int64_t v25 = v24 == 1;
  if (v14 == 1) {
    int64_t v25 = -1LL;
  }
  if (v14 == v24) {
    return 0LL;
  }
  else {
    return v25;
  }
}

- (unint64_t)strongestSupportedSecurityType
{
  __int16 v6 = objc_msgSend_supportedSecurityTypes(self, a2, v2, v3, v4);
  uint64_t v11 = objc_msgSend_WAPISubtype(self, v7, v8, v9, v10);
  return CWFStrongestSecurityType(v6, v11, 0LL);
}

- (unint64_t)weakestSupportedSecurityType
{
  __int16 v6 = objc_msgSend_supportedSecurityTypes(self, a2, v2, v3, v4);
  uint64_t v11 = objc_msgSend_WAPISubtype(self, v7, v8, v9, v10);
  return CWFWeakestSecurityType(v6, v11, 0LL);
}

- (id)networkProfile
{
  __int16 v6 = (CWFNetworkProfile *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    __int16 v6 = objc_alloc_init(&OBJC_CLASS___CWFNetworkProfile);
    objc_msgSend_SSID(self, v7, v8, v9, v10);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setSSID_(v6, v12, (uint64_t)v11, v13, v14);

    uint64_t v19 = objc_msgSend_supportedSecurityTypes(self, v15, v16, v17, v18);
    objc_msgSend_setSupportedSecurityTypes_(v6, v20, v19, v21, v22);
    uint64_t v27 = objc_msgSend_WAPISubtype(self, v23, v24, v25, v26);
    objc_msgSend_setWAPISubtype_(v6, v28, v27, v29, v30);
    uint64_t v35 = objc_msgSend_supportsCarPlay(self, v31, v32, v33, v34);
    objc_msgSend_setCarplayNetwork_(v6, v36, v35, v37, v38);
    uint64_t isPersonalHotspot = objc_msgSend_isPersonalHotspot(self, v39, v40, v41, v42);
    objc_msgSend_setPersonalHotspot_(v6, v44, isPersonalHotspot, v45, v46);
  }

  return v6;
}

- (int64_t)WAPISubtype
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  int64_t v9 = objc_msgSend_integerValue(v4, v5, v6, v7, v8);

  return v9;
}

- (unint64_t)supportedSecurityTypes
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v9 = objc_msgSend_unsignedIntegerValue(v4, v5, v6, v7, v8);

  return v9;
}

- (int)supportedPHYModes
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  int v9 = objc_msgSend_unsignedIntValue(v4, v5, v6, v7, v8);

  return v9;
}

- (int)fastestSupportedPHYMode
{
  __int16 v5 = objc_msgSend_supportedPHYModes(self, a2, v2, v3, v4);
  int v6 = v5 & 4;
  if ((v5 & 8) != 0) {
    int v6 = 8;
  }
  if ((v5 & 2) != 0) {
    int v7 = 2;
  }
  else {
    int v7 = v6;
  }
  if ((v5 & 0x10) != 0) {
    int v8 = 16;
  }
  else {
    int v8 = v7;
  }
  if ((v5 & 0x80) != 0) {
    int v9 = 128;
  }
  else {
    int v9 = v8;
  }
  if ((v5 & 0x100) != 0) {
    return 256;
  }
  else {
    return v9;
  }
}

- (int)slowestSupportedPHYMode
{
  __int16 v5 = objc_msgSend_supportedPHYModes(self, a2, v2, v3, v4);
  int v6 = v5 & 0x100;
  if ((v5 & 0x80) != 0) {
    int v6 = 128;
  }
  if ((v5 & 0x10) != 0) {
    int v7 = 16;
  }
  else {
    int v7 = v6;
  }
  if ((v5 & 2) != 0) {
    int v8 = 2;
  }
  else {
    int v8 = v7;
  }
  if ((v5 & 8) != 0) {
    int v9 = 8;
  }
  else {
    int v9 = v8;
  }
  if ((v5 & 4) != 0) {
    return 4;
  }
  else {
    return v9;
  }
}

- (NSSet)properties
{
  __int16 v5 = (void *)MEMORY[0x189604010];
  objc_msgSend_allKeys(self->_internal, a2, v2, v3, v4);
  int v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v5, v7, (uint64_t)v6, v8, v9);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v10;
}

- (NSArray)networkFlags
{
  return (NSArray *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_189E894B0, v2, v3);
}

- (NSDictionary)scanRecord
{
  return (NSDictionary *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_189E88E20, v2, v3);
}

- (NSData)SSID
{
  return (NSData *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_189E88E38, v2, v3);
}

- (unint64_t)shortSSID
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v9 = objc_msgSend_unsignedIntegerValue(v4, v5, v6, v7, v8);

  return v9;
}

- (NSString)networkName
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  CWFHumanReadableStringFromData(v4);
  __int16 v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (BOOL)isAmbiguousNetworkName
{
  __int16 v5 = (void *)objc_claimAutoreleasedReturnValue();
  unsigned __int8 v10 = sub_18645313C(v5, v6, v7, v8, v9);

  return v10;
}

- (NSString)BSSID
{
  return (NSString *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_189E88E08, v2, v3);
}

- (int64_t)RSSI
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  int64_t v9 = objc_msgSend_integerValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)wasConnectedDuringSleep
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (int64_t)noise
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  int64_t v9 = objc_msgSend_integerValue(v4, v5, v6, v7, v8);

  return v9;
}

- (int)APMode
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  int v9 = objc_msgSend_unsignedIntValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)isESS
{
  return objc_msgSend_APMode(self, a2, v2, v3, v4) == 2;
}

- (BOOL)isIBSS
{
  return objc_msgSend_APMode(self, a2, v2, v3, v4) == 1;
}

- (BOOL)isPersonalHotspot
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)isHotspot
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_isHotspot(v6, v7, v8, v9, v10) & 1) != 0
    || (objc_msgSend_isPasspoint(self, v11, v12, v13, v14) & 1) != 0
    || objc_msgSend_accessNetworkType(self, v15, v16, v17, v18) == 2)
  {

    return 1;
  }

  int v24 = objc_msgSend_accessNetworkType(self, v19, v20, v21, v22);

  return v24 == 3;
}

- (NSString)countryCode
{
  return (NSString *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_189E88E68, v2, v3);
}

- (CWFChannel)channel
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v4, v5, (uint64_t)@"CHANNEL", v6, v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = objc_msgSend_objectForKeyedSubscript_(v4, v9, (uint64_t)@"CHANNEL_FLAGS", v10, v11);
  uint64_t v13 = (void *)v12;
  if (v8) {
    BOOL v14 = v12 == 0;
  }
  else {
    BOOL v14 = 1;
  }
  if (v14)
  {
    uint64_t v15 = 0LL;
  }

  else
  {
    uint64_t v15 = objc_alloc_init(&OBJC_CLASS___CWFChannel);
    uint64_t v20 = objc_msgSend_unsignedIntegerValue(v8, v16, v17, v18, v19);
    objc_msgSend_setChannel_(v15, v21, v20, v22, v23);
    uint64_t v28 = objc_msgSend_intValue(v13, v24, v25, v26, v27);
    objc_msgSend_setFlags_(v15, v29, v28, v30, v31);
  }

  return v15;
}

- (int64_t)beaconInterval
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  int64_t v9 = objc_msgSend_integerValue(v4, v5, v6, v7, v8);

  return v9;
}

- (int64_t)airPortBaseStationModel
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  int64_t v9 = objc_msgSend_integerValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)isUnconfiguredAirPortBaseStation
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)isAppleSWAP
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (NSData)informationElementData
{
  return (NSData *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_189E88FA0, v2, v3);
}

- (unint64_t)age
{
  __uint64_t v3 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  return (v3 - objc_msgSend_timestamp(self, v4, v5, v6, v7)) / 0xF4240;
}

- (unint64_t)timestamp
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v9 = objc_msgSend_unsignedLongLongValue(v4, v5, v6, v7, v8);

  return v9;
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
  return (objc_msgSend_supportedSecurityTypes(self, a2, v2, v3, v4) & 0x57) != 0;
}

- (BOOL)isEAP
{
  return (objc_msgSend_supportedSecurityTypes(self, a2, v2, v3, v4) & 0xA8) != 0;
}

- (BOOL)isPasspoint
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

+ (id)supportedOSSpecificKeys
{
  if (qword_18C4A4328 != -1) {
    dispatch_once(&qword_18C4A4328, &unk_189E5F0F0);
  }
  return (id)qword_18C4A4320;
}

- (void)setOSSpecificAttributes:(id)a3
{
  uint64_t v54 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  if (v8)
  {
    uint64_t v40 = self;
    objc_msgSend_dictionary(MEMORY[0x189603FC8], v4, v5, v6, v7);
    char v9 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    objc_msgSend_allKeys(v8, v10, v11, v12, v13);
    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v41, (uint64_t)v53, 16);
    if (v16)
    {
      uint64_t v21 = v16;
      uint64_t v22 = *(void *)v42;
      do
      {
        for (uint64_t i = 0LL; i != v21; ++i)
        {
          if (*(void *)v42 != v22) {
            objc_enumerationMutation(v14);
          }
          uint64_t v24 = *(void *)(*((void *)&v41 + 1) + 8 * i);
          objc_msgSend_supportedOSSpecificKeys(CWFScanResult, v17, v18, v19, v20, v38, v39);
          uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
          int v29 = objc_msgSend_containsObject_(v25, v26, v24, v27, v28);

          if (v29)
          {
            objc_msgSend_objectForKeyedSubscript_(v8, v30, v24, v31, v32);
            uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKeyedSubscript_(v9, v34, (uint64_t)v33, v24, v35);
          }

          else
          {
            CWFGetOSLog();
            uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
            if (v36)
            {
              CWFGetOSLog();
              uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            }

            else
            {
              uint64_t v33 = (os_log_s *)MEMORY[0x1895F8DA0];
              id v37 = MEMORY[0x1895F8DA0];
            }

            if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
            {
              int v45 = 136446978;
              uint64_t v46 = "-[CWFScanResult setOSSpecificAttributes:]";
              __int16 v47 = 2082;
              uint64_t v48 = "CWFScanResult.m";
              __int16 v49 = 1024;
              int v50 = 1083;
              __int16 v51 = 2112;
              uint64_t v52 = v24;
              LODWORD(v39) = 38;
              uint64_t v38 = &v45;
              _os_log_send_and_compose_impl();
            }
          }
        }

        uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v41, (uint64_t)v53, 16);
      }

      while (v21);
    }

    self = v40;
  }

  else
  {
    char v9 = 0LL;
  }

  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v4, (uint64_t)v9, (uint64_t)&unk_189E89468, v7, v38, v39);
}

- (NSDictionary)OSSpecificAttributes
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v9 = (void *)objc_msgSend_copy(v4, v5, v6, v7, v8);

  return (NSDictionary *)v9;
}

- (void)setOSSpecificValue:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v11 = a4;
  if (v11
    && (objc_msgSend_supportedOSSpecificKeys(CWFScanResult, v7, v8, v9, v10),
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(),
        int v16 = objc_msgSend_containsObject_(v12, v13, (uint64_t)v11, v14, v15),
        v12,
        v16))
  {
    objc_msgSend_objectForKeyedSubscript_(self->_internal, v17, (uint64_t)&unk_189E89468, v18, v19);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 && !v20)
    {
      objc_msgSend_dictionary(MEMORY[0x189603FC8], v21, v22, v23, v24);
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v26, (uint64_t)v25, (uint64_t)&unk_189E89468, v27);
    }

    objc_msgSend_objectForKeyedSubscript_(self->_internal, v21, (uint64_t)&unk_189E89468, v23, v24);
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v28, v29, (uint64_t)v6, (uint64_t)v11, v30);
  }

  else
  {
    CWFGetOSLog();
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      CWFGetOSLog();
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v28 = (void *)MEMORY[0x1895F8DA0];
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
    objc_msgSend_objectForKeyedSubscript_(internal, v5, (uint64_t)&unk_189E89468, v6, v7);
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

- (void)setMatchingKnownNetworkProfile:(id)a3
{
  id v8 = (id)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3, v4);
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_189E89480, v7);
}

- (CWFNetworkProfile)matchingKnownNetworkProfile
{
  return (CWFNetworkProfile *)objc_msgSend_objectForKeyedSubscript_( self->_internal,  a2,  (uint64_t)&unk_189E89480,  v2,  v3);
}

- (BOOL)isMetered
{
  if (objc_msgSend_isPasspoint(self, a2, v2, v3, v4))
  {
    BOOL v14 = objc_msgSend_accessNetworkType(self, v6, v7, v8, v9) == 2;
  }

  else
  {
    objc_msgSend_matchingKnownNetworkProfile(self, v6, v7, v8, v9);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    else {
      BOOL v14 = 0;
    }
  }

  if ((objc_msgSend_isPersonalHotspot(self, v10, v11, v12, v13) & 1) != 0
    || v14
    || (int v28 = objc_msgSend_supportsCarPlay(self, v24, v25, v26, v27)) != 0)
  {
    LOBYTE(v28) = 1;
  }

  return v28;
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
      && (objc_msgSend_hasWEP40Cipher(self, v26, v27, v28, v29) & 1) == 0
      && (objc_msgSend_hasWEP104Cipher(self, v30, v31, v32, v33) & 1) == 0
      && !objc_msgSend_hasTKIPCipher(self, v34, v35, v36, v37);
}

- (NSArray)WPAUnicastCiphers
{
  return (NSArray *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_189E893A8, v2, v3);
}

- (unint64_t)WPAMulticastCipher
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v9 = objc_msgSend_unsignedLongLongValue(v4, v5, v6, v7, v8);

  return v9;
}

- (NSArray)WPAAuthSelectors
{
  return (NSArray *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_189E893D8, v2, v3);
}

- (NSArray)RSNUnicastCiphers
{
  return (NSArray *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_189E893F0, v2, v3);
}

- (unint64_t)RSNMulticastCipher
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v9 = objc_msgSend_unsignedLongLongValue(v4, v5, v6, v7, v8);

  return v9;
}

- (unint64_t)RSNBroadcastCipher
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v9 = objc_msgSend_unsignedLongLongValue(v4, v5, v6, v7, v8);

  return v9;
}

- (NSArray)RSNAuthSelectors
{
  return (NSArray *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_189E89438, v2, v3);
}

- (int)RSNCapabilities
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  int v9 = objc_msgSend_unsignedIntValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)isMFPCapable
{
  return (objc_msgSend_RSNCapabilities(self, a2, v2, v3, v4) >> 7) & 1;
}

- (BOOL)isMFPRequired
{
  return (objc_msgSend_RSNCapabilities(self, a2, v2, v3, v4) >> 6) & 1;
}

- (BOOL)hasWEP40Cipher
{
  uint64_t v48 = *MEMORY[0x1895F89C0];
  if (objc_msgSend_WPAMulticastCipher(self, a2, v2, v3, v4) != 1
    && objc_msgSend_RSNMulticastCipher(self, v6, v7, v8, v9) != 1)
  {
    objc_msgSend_WPAUnicastCiphers(self, v10, v11, v12, v13);
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v42, (uint64_t)v47, 16);
    if (v17)
    {
      uint64_t v22 = v17;
      uint64_t v23 = *(void *)v43;
LABEL_6:
      uint64_t v24 = 0LL;
      while (1)
      {
        if (*(void *)v43 != v23) {
          objc_enumerationMutation(v15);
        }
        if (v22 == ++v24)
        {
          uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v18, (uint64_t)&v42, (uint64_t)v47, 16);
          if (v22) {
            goto LABEL_6;
          }
          goto LABEL_12;
        }
      }
    }

    else
    {
LABEL_12:

      objc_msgSend_RSNUnicastCiphers(self, v25, v26, v27, v28);
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();

      __int128 v40 = 0u;
      __int128 v41 = 0u;
      __int128 v38 = 0u;
      __int128 v39 = 0u;
      id v15 = v29;
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v30, (uint64_t)&v38, (uint64_t)v46, 16);
      if (!v14)
      {
LABEL_22:

        return v14;
      }

      uint64_t v35 = *(void *)v39;
LABEL_14:
      uint64_t v36 = 0LL;
      while (1)
      {
        if (*(void *)v39 != v35) {
          objc_enumerationMutation(v15);
        }
        if (objc_msgSend_intValue( *(void **)(*((void *)&v38 + 1) + 8 * v36),  v31,  v32,  v33,  v34,  (void)v38) == 1) {
          break;
        }
        if (v14 == ++v36)
        {
          uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v31, (uint64_t)&v38, (uint64_t)v46, 16);
          if (v14) {
            goto LABEL_14;
          }
          goto LABEL_22;
        }
      }
    }

    LOBYTE(v14) = 1;
    goto LABEL_22;
  }

  LOBYTE(v14) = 1;
  return v14;
}

- (BOOL)hasWEP104Cipher
{
  uint64_t v48 = *MEMORY[0x1895F89C0];
  if (objc_msgSend_WPAMulticastCipher(self, a2, v2, v3, v4) != 5
    && objc_msgSend_RSNMulticastCipher(self, v6, v7, v8, v9) != 5)
  {
    objc_msgSend_WPAUnicastCiphers(self, v10, v11, v12, v13);
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v42, (uint64_t)v47, 16);
    if (v17)
    {
      uint64_t v22 = v17;
      uint64_t v23 = *(void *)v43;
LABEL_6:
      uint64_t v24 = 0LL;
      while (1)
      {
        if (*(void *)v43 != v23) {
          objc_enumerationMutation(v15);
        }
        if (v22 == ++v24)
        {
          uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v18, (uint64_t)&v42, (uint64_t)v47, 16);
          if (v22) {
            goto LABEL_6;
          }
          goto LABEL_12;
        }
      }
    }

    else
    {
LABEL_12:

      objc_msgSend_RSNUnicastCiphers(self, v25, v26, v27, v28);
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();

      __int128 v40 = 0u;
      __int128 v41 = 0u;
      __int128 v38 = 0u;
      __int128 v39 = 0u;
      id v15 = v29;
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v30, (uint64_t)&v38, (uint64_t)v46, 16);
      if (!v14)
      {
LABEL_22:

        return v14;
      }

      uint64_t v35 = *(void *)v39;
LABEL_14:
      uint64_t v36 = 0LL;
      while (1)
      {
        if (*(void *)v39 != v35) {
          objc_enumerationMutation(v15);
        }
        if (objc_msgSend_intValue( *(void **)(*((void *)&v38 + 1) + 8 * v36),  v31,  v32,  v33,  v34,  (void)v38) == 5) {
          break;
        }
        if (v14 == ++v36)
        {
          uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v31, (uint64_t)&v38, (uint64_t)v46, 16);
          if (v14) {
            goto LABEL_14;
          }
          goto LABEL_22;
        }
      }
    }

    LOBYTE(v14) = 1;
    goto LABEL_22;
  }

  LOBYTE(v14) = 1;
  return v14;
}

- (BOOL)hasTKIPCipher
{
  uint64_t v48 = *MEMORY[0x1895F89C0];
  if (objc_msgSend_WPAMulticastCipher(self, a2, v2, v3, v4) != 2
    && objc_msgSend_RSNMulticastCipher(self, v6, v7, v8, v9) != 2)
  {
    objc_msgSend_WPAUnicastCiphers(self, v10, v11, v12, v13);
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v42, (uint64_t)v47, 16);
    if (v17)
    {
      uint64_t v22 = v17;
      uint64_t v23 = *(void *)v43;
LABEL_6:
      uint64_t v24 = 0LL;
      while (1)
      {
        if (*(void *)v43 != v23) {
          objc_enumerationMutation(v15);
        }
        if (v22 == ++v24)
        {
          uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v18, (uint64_t)&v42, (uint64_t)v47, 16);
          if (v22) {
            goto LABEL_6;
          }
          goto LABEL_12;
        }
      }
    }

    else
    {
LABEL_12:

      objc_msgSend_RSNUnicastCiphers(self, v25, v26, v27, v28);
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();

      __int128 v40 = 0u;
      __int128 v41 = 0u;
      __int128 v38 = 0u;
      __int128 v39 = 0u;
      id v15 = v29;
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v30, (uint64_t)&v38, (uint64_t)v46, 16);
      if (!v14)
      {
LABEL_22:

        return v14;
      }

      uint64_t v35 = *(void *)v39;
LABEL_14:
      uint64_t v36 = 0LL;
      while (1)
      {
        if (*(void *)v39 != v35) {
          objc_enumerationMutation(v15);
        }
        if (objc_msgSend_intValue( *(void **)(*((void *)&v38 + 1) + 8 * v36),  v31,  v32,  v33,  v34,  (void)v38) == 2) {
          break;
        }
        if (v14 == ++v36)
        {
          uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v31, (uint64_t)&v38, (uint64_t)v46, 16);
          if (v14) {
            goto LABEL_14;
          }
          goto LABEL_22;
        }
      }
    }

    LOBYTE(v14) = 1;
    goto LABEL_22;
  }

  LOBYTE(v14) = 1;
  return v14;
}

- (int)accessNetworkType
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  int v9 = objc_msgSend_unsignedIntValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)isInternetAccessible
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)isAdditionalStepRequiredForAccess
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)isEmergencyServicesReachable
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)isUnauthenticatedEmergencyServiceAccessible
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (int64_t)venueGroup
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  int64_t v9 = objc_msgSend_integerValue(v4, v5, v6, v7, v8);

  return v9;
}

- (int64_t)venueType
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  int64_t v9 = objc_msgSend_integerValue(v4, v5, v6, v7, v8);

  return v9;
}

- (NSString)HESSID
{
  return (NSString *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_189E890A8, v2, v3);
}

- (BOOL)isUnconfiguredDevice
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)providesInternetAccess
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)supportsWPS
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)supportsiAPOverWiFi
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)supports2GHzNetworks
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)supports5GHzNetworks
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)supportsMFi
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)supportsMFiHardwareAuth
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)supportsMFiSoftwareTokenAuth
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)supportsMFiSoftwareCertAuth
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)supportsHomeKit
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)supportsHomeKit2
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)supportsAirPrint
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)supportsWoW
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)supportsCarPlay
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)supportsSecureWAC
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)supportsAirPlay
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)supportsAirPlay2
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (NSString)friendlyName
{
  return (NSString *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_189E89270, v2, v3);
}

- (NSString)manufacturerName
{
  return (NSString *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_189E89288, v2, v3);
}

- (NSString)modelName
{
  return (NSString *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_189E892A0, v2, v3);
}

- (NSString)displayName
{
  return (NSString *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_189E892B8, v2, v3);
}

- (NSString)primaryMAC
{
  return (NSString *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_189E892D0, v2, v3);
}

- (NSString)bluetoothMAC
{
  return (NSString *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_189E892E8, v2, v3);
}

- (NSString)deviceID
{
  return (NSString *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_189E89300, v2, v3);
}

- (NSDictionary)ANQPResponse
{
  return (NSDictionary *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_189E89318, v2, v3);
}

- (NSArray)cellularNetworkInfo
{
  return (NSArray *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_189E89330, v2, v3);
}

- (NSArray)NAIRealmNameList
{
  return (NSArray *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_189E89348, v2, v3);
}

- (NSArray)roamingConsortiumList
{
  return (NSArray *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_189E89360, v2, v3);
}

- (NSArray)operatorFriendlyNameList
{
  return (NSArray *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_189E89378, v2, v3);
}

- (NSArray)domainNameList
{
  return (NSArray *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_189E89390, v2, v3);
}

- (NSArray)RNRBSSList
{
  return (NSArray *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_189E894E0, v2, v3);
}

- (BOOL)isWiFi6E
{
  uint64_t v42 = *MEMORY[0x1895F89C0];
  objc_msgSend_channel(self, a2, v2, v3, v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  char v11 = objc_msgSend_is6GHz(v6, v7, v8, v9, v10);

  if ((v11 & 1) != 0)
  {
    LOBYTE(v16) = 1;
  }

  else
  {
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    objc_msgSend_RNRBSSList(self, v12, v13, v14, v15, 0);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v37, (uint64_t)v41, 16);
    if (v16)
    {
      uint64_t v23 = *(void *)v38;
      do
      {
        for (uint64_t i = 0LL; i != v16; ++i)
        {
          if (*(void *)v38 != v23) {
            objc_enumerationMutation(v17);
          }
          uint64_t v25 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          objc_msgSend_channel(v25, v19, v20, v21, v22);
          uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend_is6GHz(v26, v27, v28, v29, v30))
          {
            char isColocatedAP = objc_msgSend_isColocatedAP(v25, v31, v32, v33, v34);

            if ((isColocatedAP & 1) != 0)
            {
              LOBYTE(v16) = 1;
              goto LABEL_14;
            }
          }

          else
          {
          }
        }

        uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v19, (uint64_t)&v37, (uint64_t)v41, 16);
      }

      while (v16);
    }

- (NSArray)RNRChannelList
{
  return (NSArray *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_189E89510, v2, v3);
}

- (BOOL)hasNon6GHzRNRChannel
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  objc_msgSend_RNRChannelList(self, a2, v2, v3, v4, 0);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v22, (uint64_t)v26, 16);
  if (v7)
  {
    uint64_t v12 = v7;
    uint64_t v13 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0LL; i != v12; ++i)
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v5);
        }
        uint64_t v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if ((objc_msgSend_is2GHz(v15, v8, v9, v10, v11) & 1) != 0
          || (objc_msgSend_is5GHz(v15, v16, v17, v18, v19) & 1) != 0)
        {
          BOOL v20 = 1;
          goto LABEL_13;
        }
      }

      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v22, (uint64_t)v26, 16);
      BOOL v20 = 0;
      if (v12) {
        continue;
      }
      break;
    }
  }

  else
  {
    BOOL v20 = 0;
  }

- (BOOL)isAssociationDisallowed
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)isFILSDiscoveryFrame
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  char v9 = objc_msgSend_containsObject_(v5, v6, (uint64_t)&unk_189E88F58, v7, v8);

  return v9;
}

- (BOOL)isBackgroundScanResult
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  char v9 = objc_msgSend_containsObject_(v5, v6, (uint64_t)&unk_189E89540, v7, v8);

  return v9;
}

- (NSString)privateMACAddress
{
  return (NSString *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_189E89528, v2, v3);
}

- (id)__descriptionForWPACipher:(int)a3
{
  if (a3 < 6 && ((0x37u >> a3) & 1) != 0)
  {
    uint64_t v5 = off_189E5F110[a3];
  }

  else
  {
    objc_msgSend_stringWithFormat_(NSString, a2, (uint64_t)@"<%i>", v3, v4, a3);
    uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)__descriptionForWPAAuthSel:(int)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)__descriptionForWPAIE
{
  uint64_t v125 = *MEMORY[0x1895F89C0];
  objc_msgSend_scanRecord(self, a2, v2, v3, v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v6, v7, (uint64_t)@"WPA_IE", v8, v9);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10
    || (objc_msgSend_setWithArray_(MEMORY[0x189604010], v11, (uint64_t)&unk_189E8AB18, v12, v13),
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend_properties(self, v15, v16, v17, v18),
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(),
        int isSubsetOfSet = objc_msgSend_isSubsetOfSet_(v14, v20, (uint64_t)v19, v21, v22),
        v19,
        v14,
        isSubsetOfSet))
  {
    objc_msgSend_objectForKeyedSubscript_(v10, v11, (uint64_t)@"IE_KEY_WPA_MCIPHER", v12, v13);
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v28)
    {
      uint64_t v29 = (void *)MEMORY[0x189607968];
      uint64_t v30 = objc_msgSend_WPAMulticastCipher(self, v24, v25, v26, v27);
      objc_msgSend_numberWithUnsignedLongLong_(v29, v31, v30, v32, v33);
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend_objectForKeyedSubscript_(v10, v24, (uint64_t)@"IE_KEY_WPA_UCIPHERS", v26, v27);
    __int128 v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v38)
    {
      objc_msgSend_WPAUnicastCiphers(self, v34, v35, v36, v37);
      __int128 v38 = (void *)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend_objectForKeyedSubscript_(v10, v34, (uint64_t)@"IE_KEY_WPA_AUTHSELS", v36, v37);
    __int128 v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v43)
    {
      objc_msgSend_WPAAuthSelectors(self, v39, v40, v41, v42);
      __int128 v43 = (void *)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend_string(MEMORY[0x189607940], v39, v40, v41, v42);
    __int128 v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendString_(v44, v45, (uint64_t)@"[", v46, v47);
    uint64_t v114 = v28;
    uint64_t v52 = objc_msgSend_intValue(v28, v48, v49, v50, v51);
    objc_msgSend___descriptionForWPACipher_(self, v53, v52, v54, v55);
    uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v44, v57, (uint64_t)@"mcast=%@, ", v58, v59, v56);

    objc_msgSend_appendString_(v44, v60, (uint64_t)@"ucast={ ", v61, v62);
    __int128 v121 = 0u;
    __int128 v122 = 0u;
    __int128 v119 = 0u;
    __int128 v120 = 0u;
    id v63 = v38;
    uint64_t v65 = objc_msgSend_countByEnumeratingWithState_objects_count_(v63, v64, (uint64_t)&v119, (uint64_t)v124, 16);
    if (v65)
    {
      uint64_t v70 = v65;
      uint64_t v71 = *(void *)v120;
      do
      {
        uint64_t v72 = 0LL;
        do
        {
          if (*(void *)v120 != v71) {
            objc_enumerationMutation(v63);
          }
          uint64_t v73 = objc_msgSend_intValue(*(void **)(*((void *)&v119 + 1) + 8 * v72), v66, v67, v68, v69);
          objc_msgSend___descriptionForWPACipher_(self, v74, v73, v75, v76);
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_appendFormat_(v44, v78, (uint64_t)@"%@ ", v79, v80, v77);

          ++v72;
        }

        while (v70 != v72);
        uint64_t v70 = objc_msgSend_countByEnumeratingWithState_objects_count_(v63, v66, (uint64_t)&v119, (uint64_t)v124, 16);
      }

      while (v70);
    }

    objc_msgSend_appendString_(v44, v81, (uint64_t)@"}, ", v82, v83);
    objc_msgSend_appendString_(v44, v84, (uint64_t)@"auths={ ", v85, v86);
    __int128 v117 = 0u;
    __int128 v118 = 0u;
    __int128 v115 = 0u;
    __int128 v116 = 0u;
    id v87 = v43;
    uint64_t v89 = objc_msgSend_countByEnumeratingWithState_objects_count_(v87, v88, (uint64_t)&v115, (uint64_t)v123, 16);
    if (v89)
    {
      uint64_t v94 = v89;
      uint64_t v95 = *(void *)v116;
      do
      {
        uint64_t v96 = 0LL;
        do
        {
          if (*(void *)v116 != v95) {
            objc_enumerationMutation(v87);
          }
          uint64_t v97 = objc_msgSend_intValue(*(void **)(*((void *)&v115 + 1) + 8 * v96), v90, v91, v92, v93);
          objc_msgSend___descriptionForWPAAuthSel_(self, v98, v97, v99, v100);
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_appendFormat_(v44, v102, (uint64_t)@"%@ ", v103, v104, v101);

          ++v96;
        }

        while (v94 != v96);
        uint64_t v94 = objc_msgSend_countByEnumeratingWithState_objects_count_(v87, v90, (uint64_t)&v115, (uint64_t)v123, 16);
      }

      while (v94);
    }

    objc_msgSend_appendString_(v44, v105, (uint64_t)@"}", v106, v107);
    objc_msgSend_appendString_(v44, v108, (uint64_t)@"]", v109, v110);
    uint64_t v111 = v114;
  }

  else
  {
    id v63 = 0LL;
    id v87 = 0LL;
    uint64_t v111 = 0LL;
    __int128 v44 = 0LL;
  }

  id v112 = v44;

  return v112;
}

- (id)__descriptionForRSNCipher:(int)a3
{
  if (a3 < 0xE && ((0x3B7Fu >> a3) & 1) != 0)
  {
    uint64_t v5 = off_189E5F158[a3];
  }

  else
  {
    objc_msgSend_stringWithFormat_(NSString, a2, (uint64_t)@"<%i>", v3, v4, a3);
    uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)__descriptionForRSNAuthSel:(int)a3
{
  if (a3 < 0x1A && ((0x30033FFu >> a3) & 1) != 0)
  {
    uint64_t v5 = off_189E5F1C8[a3];
  }

  else
  {
    objc_msgSend_stringWithFormat_(NSString, a2, (uint64_t)@"<%i>", v3, v4, a3);
    uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)__descriptionForRSNIE
{
  uint64_t v192 = *MEMORY[0x1895F89C0];
  objc_msgSend_scanRecord(self, a2, v2, v3, v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v6, v7, (uint64_t)@"RSN_IE", v8, v9);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10
    || (objc_msgSend_setWithArray_(MEMORY[0x189604010], v11, (uint64_t)&unk_189E8AB30, v12, v13),
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend_properties(self, v15, v16, v17, v18),
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(),
        int isSubsetOfSet = objc_msgSend_isSubsetOfSet_(v14, v20, (uint64_t)v19, v21, v22),
        v19,
        v14,
        isSubsetOfSet))
  {
    objc_msgSend_objectForKeyedSubscript_(v10, v11, (uint64_t)@"IE_KEY_RSN_MCIPHER", v12, v13);
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v28)
    {
      uint64_t v29 = (void *)MEMORY[0x189607968];
      uint64_t v30 = objc_msgSend_RSNMulticastCipher(self, v24, v25, v26, v27);
      objc_msgSend_numberWithUnsignedLongLong_(v29, v31, v30, v32, v33);
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend_objectForKeyedSubscript_(v10, v24, (uint64_t)@"IE_KEY_RSN_BCIPHER", v26, v27);
    __int128 v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v38)
    {
      __int128 v39 = (void *)MEMORY[0x189607968];
      uint64_t v40 = objc_msgSend_RSNBroadcastCipher(self, v34, v35, v36, v37);
      objc_msgSend_numberWithUnsignedLongLong_(v39, v41, v40, v42, v43);
      __int128 v38 = (void *)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend_objectForKeyedSubscript_(v10, v34, (uint64_t)@"IE_KEY_RSN_UCIPHERS", v36, v37);
    uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v48)
    {
      objc_msgSend_RSNUnicastCiphers(self, v44, v45, v46, v47);
      uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue();
    }

    uint64_t v49 = objc_msgSend_objectForKeyedSubscript_(v10, v44, (uint64_t)@"IE_KEY_RSN_AUTHSELS", v46, v47);
    if (!v49)
    {
      uint64_t v49 = objc_msgSend_RSNAuthSelectors(self, v50, v51, v52, v53);
    }

    uint64_t v178 = (void *)v49;
    objc_msgSend_objectForKeyedSubscript_(v10, v50, (uint64_t)@"IE_KEY_RSN_CAPS", v52, v53);
    uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v54, v55, (uint64_t)@"RSN_CAPABILITIES", v56, v57);
    uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v58)
    {
      id v63 = (void *)MEMORY[0x189607968];
      uint64_t v64 = objc_msgSend_RSNCapabilities(self, v59, v60, v61, v62);
      objc_msgSend_numberWithUnsignedInt_(v63, v65, v64, v66, v67);
      uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend_string(MEMORY[0x189607940], v59, v60, v61, v62);
    uint64_t v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendString_(v68, v69, (uint64_t)@"[", v70, v71);
    uint64_t v180 = v28;
    uint64_t v76 = objc_msgSend_intValue(v28, v72, v73, v74, v75);
    objc_msgSend___descriptionForRSNCipher_(self, v77, v76, v78, v79);
    uint64_t v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v68, v81, (uint64_t)@"mcast=%@, ", v82, v83, v80);

    uint64_t v179 = v38;
    uint64_t v88 = objc_msgSend_intValue(v38, v84, v85, v86, v87);
    objc_msgSend___descriptionForRSNCipher_(self, v89, v88, v90, v91);
    uint64_t v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v68, v93, (uint64_t)@"bip=%@, ", v94, v95, v92);

    objc_msgSend_appendString_(v68, v96, (uint64_t)@"ucast={ ", v97, v98);
    __int128 v188 = 0u;
    __int128 v189 = 0u;
    __int128 v186 = 0u;
    __int128 v187 = 0u;
    id v99 = v48;
    uint64_t v101 = objc_msgSend_countByEnumeratingWithState_objects_count_(v99, v100, (uint64_t)&v186, (uint64_t)v191, 16);
    if (v101)
    {
      uint64_t v106 = v101;
      uint64_t v107 = *(void *)v187;
      do
      {
        uint64_t v108 = 0LL;
        do
        {
          if (*(void *)v187 != v107) {
            objc_enumerationMutation(v99);
          }
          uint64_t v109 = objc_msgSend_intValue(*(void **)(*((void *)&v186 + 1) + 8 * v108), v102, v103, v104, v105);
          objc_msgSend___descriptionForRSNCipher_(self, v110, v109, v111, v112);
          uint64_t v113 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_appendFormat_(v68, v114, (uint64_t)@"%@ ", v115, v116, v113);

          ++v108;
        }

        while (v106 != v108);
        uint64_t v106 = objc_msgSend_countByEnumeratingWithState_objects_count_(v99, v102, (uint64_t)&v186, (uint64_t)v191, 16);
      }

      while (v106);
    }

    uint64_t v181 = v10;

    objc_msgSend_appendString_(v68, v117, (uint64_t)@"}, ", v118, v119);
    objc_msgSend_appendString_(v68, v120, (uint64_t)@"auths={ ", v121, v122);
    __int128 v184 = 0u;
    __int128 v185 = 0u;
    __int128 v182 = 0u;
    __int128 v183 = 0u;
    id v123 = v178;
    uint64_t v125 = objc_msgSend_countByEnumeratingWithState_objects_count_(v123, v124, (uint64_t)&v182, (uint64_t)v190, 16);
    if (v125)
    {
      uint64_t v130 = v125;
      uint64_t v131 = *(void *)v183;
      do
      {
        uint64_t v132 = 0LL;
        do
        {
          if (*(void *)v183 != v131) {
            objc_enumerationMutation(v123);
          }
          uint64_t v133 = objc_msgSend_intValue(*(void **)(*((void *)&v182 + 1) + 8 * v132), v126, v127, v128, v129);
          objc_msgSend___descriptionForRSNAuthSel_(self, v134, v133, v135, v136);
          uint64_t v137 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_appendFormat_(v68, v138, (uint64_t)@"%@ ", v139, v140, v137);

          ++v132;
        }

        while (v130 != v132);
        uint64_t v130 = objc_msgSend_countByEnumeratingWithState_objects_count_(v123, v126, (uint64_t)&v182, (uint64_t)v190, 16);
      }

      while (v130);
    }

    objc_msgSend_appendString_(v68, v141, (uint64_t)@"}, ", v142, v143);
    char v148 = objc_msgSend_unsignedIntValue(v58, v144, v145, v146, v147);
    char v153 = objc_msgSend_unsignedIntValue(v58, v149, v150, v151, v152);
    uint64_t v157 = "capable";
    if ((v148 & 0x80) == 0) {
      uint64_t v157 = "no";
    }
    if ((v153 & 0x40) != 0) {
      uint64_t v157 = "required";
    }
    objc_msgSend_appendFormat_(v68, v154, (uint64_t)@"mfp=%s, ", v155, v156, v157);
    if (v58)
    {
      uint64_t v162 = (void *)NSString;
      int v163 = objc_msgSend_shortValue(v58, v158, v159, v160, v161);
      objc_msgSend_stringWithFormat_(v162, v164, (uint64_t)@"0x%X", v165, v166, v163);
      uint64_t v167 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_appendFormat_(v68, v168, (uint64_t)@"caps=%@", v169, v170, v167);
    }

    else
    {
      objc_msgSend_appendFormat_(v68, v158, (uint64_t)@"caps=%@", v160, v161, @"n/a");
    }

    uint64_t v174 = v180;
    uint64_t v10 = v181;
    uint64_t v175 = v179;
    objc_msgSend_appendString_(v68, v171, (uint64_t)@"]", v172, v173);
  }

  else
  {
    uint64_t v175 = 0LL;
    id v99 = 0LL;
    id v123 = 0LL;
    uint64_t v58 = 0LL;
    uint64_t v174 = 0LL;
    uint64_t v68 = 0LL;
  }

  id v176 = v68;

  return v176;
}

- (id)__descriptionForAirPortBaseStationModel:(int64_t)a3
{
  switch(a3)
  {
    case 'f':
      uint64_t v5 = @"AirPort Express (802.11 b/g)";
      return v5;
    case 'g':
    case 'n':
    case 'o':
    case 'p':
    case 'v':
      goto LABEL_8;
    case 'h':
      return @"AirPort Extreme 802.11n (1st Generation)";
    case 'i':
      return @"AirPort Extreme 802.11n w/ Gigabit Ethernet (2nd Generation)";
    case 'j':
      return @"Time Capsule (1st Generation)";
    case 'k':
      return @"AirPort Express 802.11n (1st Generation)";
    case 'l':
      return @"AirPort Extreme 802.11n w/ Simultaneous Dual-Band (3rd Generation)";
    case 'm':
      return @"Time Capsule w/ Simultaneous Dual-Band (2nd Generation)";
    case 'q':
      return @"Time Capsule w/ Simultaneous Dual-Band (3rd Generation)";
    case 'r':
      return @"AirPort Extreme 802.11n w/ Simultaneous Dual-Band (4th Generation)";
    case 's':
      return @"AirPort Express 802.11n w/ Simultaneous Dual-Band (2nd Generation)";
    case 't':
      return @"Time Capsule w/ Simultaneous Dual-Band (4th Generation)";
    case 'u':
      return @"AirPort Extreme 802.11n w/ Simultaneous Dual-Band (5th Generation)";
    case 'w':
      return @"Time Capsule 802.11ac (5th Generation)";
    case 'x':
      return @"AirPort Extreme 802.11ac (6th Generation)";
    default:
      if (!a3) {
        return 0LL;
      }
      if (a3 == 3) {
        return @"AirPort Extreme (802.11 b/g)";
      }
LABEL_8:
      objc_msgSend_stringWithFormat_(NSString, a2, (uint64_t)@"? (%ld)", v3, v4, a3);
      uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      return v5;
  }

- (NSString)description
{
  uint64_t v463 = *MEMORY[0x1895F89C0];
  objc_msgSend_string(MEMORY[0x189607940], a2, v2, v3, v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_SSID(self, v7, v8, v9, v10);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend_networkName(self, v12, v13, v14, v15);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_redactedForWiFi(v16, v17, v18, v19, v20);
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend_hasPrefix_(v21, v22, (uint64_t)@" ", v23, v24) & 1) != 0
      || objc_msgSend_hasSuffix_(v21, v25, (uint64_t)@" ", v26, v27))
    {
      uint64_t v28 = objc_msgSend_stringWithFormat_(NSString, v25, (uint64_t)@"'%@'", v26, v27, v21);

      uint64_t v21 = (void *)v28;
    }

    objc_msgSend_appendFormat_(v6, v25, (uint64_t)@"%@ - ", v26, v27, v21);
    objc_msgSend_SSID(self, v29, v30, v31, v32);
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
    CWFHexadecimalStringFromData(v33, v34, v35, v36, v37);
    __int128 v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_redactedForWiFi(v38, v39, v40, v41, v42);
    uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v48 = objc_msgSend_shortSSID(self, v44, v45, v46, v47);
    objc_msgSend_appendFormat_(v6, v49, (uint64_t)@"ssid=%@ (%lu), ", v50, v51, v43, v48);
  }

  objc_msgSend_BSSID(self, v12, v13, v14, v15);
  uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue();

  if (v52)
  {
    objc_msgSend_BSSID(self, v53, v54, v55, v56);
    uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_redactedForWiFi(v57, v58, v59, v60, v61);
    uint64_t v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v6, v63, (uint64_t)@"bssid=%@, ", v64, v65, v62);
  }

  if (objc_msgSend_supportedSecurityTypes(self, v53, v54, v55, v56))
  {
    uint64_t v70 = objc_msgSend_supportedSecurityTypes(self, v66, v67, v68, v69);
    uint64_t v75 = objc_msgSend_WAPISubtype(self, v71, v72, v73, v74);
    sub_186453234(v70, 0LL, v75, v76, v77);
    uint64_t v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v6, v79, (uint64_t)@"security=%@, ", v80, v81, v78);
  }

  uint64_t v82 = objc_msgSend___descriptionForRSNIE(self, v66, v67, v68, v69);
  uint64_t v87 = (void *)v82;
  if (v82) {
    objc_msgSend_appendFormat_(v6, v83, (uint64_t)@"rsn=%@, ", v85, v86, v82);
  }
  uint64_t v88 = objc_msgSend___descriptionForWPAIE(self, v83, v84, v85, v86);
  uint64_t v93 = (void *)v88;
  if (v88) {
    objc_msgSend_appendFormat_(v6, v89, (uint64_t)@"wpa=%@, ", v91, v92, v88);
  }
  objc_msgSend_channel(self, v89, v90, v91, v92);
  uint64_t v94 = (void *)objc_claimAutoreleasedReturnValue();

  if (v94)
  {
    objc_msgSend_channel(self, v95, v96, v97, v98);
    id v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v6, v100, (uint64_t)@"channel=%@", v101, v102, v99);

    objc_msgSend_RNRChannelList(self, v103, v104, v105, v106);
    uint64_t v107 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_count(v107, v108, v109, v110, v111))
    {
      objc_msgSend_appendString_(v6, v112, (uint64_t)@" ("), v113, v114;
      __int128 v454 = 0u;
      __int128 v455 = 0u;
      __int128 v452 = 0u;
      __int128 v453 = 0u;
      id v115 = v107;
      uint64_t v117 = objc_msgSend_countByEnumeratingWithState_objects_count_(v115, v116, (uint64_t)&v452, (uint64_t)v462, 16);
      if (v117)
      {
        uint64_t v121 = v117;
        uint64_t v122 = *(void *)v453;
        do
        {
          uint64_t v123 = 0LL;
          do
          {
            if (*(void *)v453 != v122) {
              objc_enumerationMutation(v115);
            }
            objc_msgSend_appendFormat_( v6,  v118,  (uint64_t)@"%@, ",  v119,  v120,  *(void *)(*((void *)&v452 + 1) + 8 * v123++));
          }

          while (v121 != v123);
          uint64_t v121 = objc_msgSend_countByEnumeratingWithState_objects_count_( v115,  v118,  (uint64_t)&v452,  (uint64_t)v462,  16);
        }

        while (v121);
      }

      uint64_t v128 = objc_msgSend_length(v6, v124, v125, v126, v127);
      objc_msgSend_deleteCharactersInRange_(v6, v129, v128 - 2, 2, v130);
      objc_msgSend_appendString_(v6, v131, (uint64_t)@", "), v132, v133);
    }

    else
    {
      objc_msgSend_appendString_(v6, v112, (uint64_t)@", ", v113, v114);
    }
  }

  objc_msgSend_countryCode(self, v95, v96, v97, v98);
  uint64_t v134 = (void *)objc_claimAutoreleasedReturnValue();

  if (v134)
  {
    objc_msgSend_countryCode(self, v135, v136, v137, v138);
    uint64_t v139 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v6, v140, (uint64_t)@"cc=%@, ", v141, v142, v139);
  }

  if (objc_msgSend_supportedPHYModes(self, v135, v136, v137, v138))
  {
    int v147 = objc_msgSend_supportedPHYModes(self, v143, v144, v145, v146);
    sub_1864534A4(v147, v148, v149, v150, v151);
    uint64_t v152 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v6, v153, (uint64_t)@"phy=%@, ", v154, v155, v152);
  }

  if (objc_msgSend_RSSI(self, v143, v144, v145, v146))
  {
    uint64_t v160 = objc_msgSend_RSSI(self, v156, v157, v158, v159);
    objc_msgSend_appendFormat_(v6, v161, (uint64_t)@"rssi=%li, ", v162, v163, v160);
  }

  unsigned int v164 = objc_msgSend_wasConnectedDuringSleep(self, v156, v157, v158, v159);
  objc_msgSend_appendFormat_(v6, v165, (uint64_t)@"wasConnectedDuringSleep=%li, ", v166, v167, v164);
  if (objc_msgSend_beaconInterval(self, v168, v169, v170, v171))
  {
    uint64_t v176 = objc_msgSend_beaconInterval(self, v172, v173, v174, v175);
    objc_msgSend_appendFormat_(v6, v177, (uint64_t)@"bi=%li, ", v178, v179, v176);
  }

  uint64_t v200 = objc_msgSend_airPortBaseStationModel(self, v196, v197, v198, v199);
  if (v200)
  {
    objc_msgSend___descriptionForAirPortBaseStationModel_(self, v201, v200, v203, v204);
    uint64_t v205 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v6, v206, (uint64_t)@"airport=[%@], ", v207, v208, v205);
  }

  objc_msgSend_RNRBSSList(self, v213, v214, v215, v216);
  v217 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v217, v218, v219, v220, v221))
  {
    objc_msgSend_appendString_(v6, v222, (uint64_t)@"rnr=[", v224, v225);
    __int128 v450 = 0u;
    __int128 v451 = 0u;
    __int128 v448 = 0u;
    __int128 v449 = 0u;
    id v226 = v217;
    uint64_t v228 = objc_msgSend_countByEnumeratingWithState_objects_count_(v226, v227, (uint64_t)&v448, (uint64_t)v461, 16);
    if (v228)
    {
      uint64_t v232 = v228;
      uint64_t v233 = *(void *)v449;
      do
      {
        uint64_t v234 = 0LL;
        do
        {
          if (*(void *)v449 != v233) {
            objc_enumerationMutation(v226);
          }
          objc_msgSend_appendFormat_( v6,  v229,  (uint64_t)@"(%@), ",  v230,  v231,  *(void *)(*((void *)&v448 + 1) + 8 * v234++));
        }

        while (v232 != v234);
        uint64_t v232 = objc_msgSend_countByEnumeratingWithState_objects_count_(v226, v229, (uint64_t)&v448, (uint64_t)v461, 16);
      }

      while (v232);
    }

    uint64_t v239 = objc_msgSend_length(v6, v235, v236, v237, v238);
    objc_msgSend_deleteCharactersInRange_(v6, v240, v239 - 2, 2, v241);
    objc_msgSend_appendString_(v6, v242, (uint64_t)@"], ", v243, v244);
  }

  if (objc_msgSend_isPasspoint(self, v245, v246, v247, v248))
  {
    objc_msgSend_domainNameList(self, v249, v250, v251, v252);
    uint64_t v427 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_count(v427, v253, v254, v255, v256))
    {
      objc_msgSend_appendString_(v6, v257, (uint64_t)@"hs20-domains=[", v259, v260);
      __int128 v446 = 0u;
      __int128 v447 = 0u;
      __int128 v444 = 0u;
      __int128 v445 = 0u;
      id v261 = v427;
      uint64_t v263 = objc_msgSend_countByEnumeratingWithState_objects_count_(v261, v262, (uint64_t)&v444, (uint64_t)v460, 16);
      if (v263)
      {
        uint64_t v267 = v263;
        uint64_t v268 = *(void *)v445;
        do
        {
          uint64_t v269 = 0LL;
          do
          {
            if (*(void *)v445 != v268) {
              objc_enumerationMutation(v261);
            }
            objc_msgSend_appendFormat_( v6,  v264,  (uint64_t)@"%@, ",  v265,  v266,  *(void *)(*((void *)&v444 + 1) + 8 * v269++));
          }

          while (v267 != v269);
          uint64_t v267 = objc_msgSend_countByEnumeratingWithState_objects_count_( v261,  v264,  (uint64_t)&v444,  (uint64_t)v460,  16);
        }

        while (v267);
      }

      uint64_t v274 = objc_msgSend_length(v6, v270, v271, v272, v273);
      objc_msgSend_deleteCharactersInRange_(v6, v275, v274 - 2, 2, v276);
      objc_msgSend_appendString_(v6, v277, (uint64_t)@"], ", v278, v279);
    }

    objc_msgSend_NAIRealmNameList(self, v257, v258, v259, v260);
    v280 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v424 = v93;
    if (objc_msgSend_count(v280, v281, v282, v283, v284))
    {
      objc_msgSend_appendString_(v6, v285, (uint64_t)@"hs20-nai=[", v287, v288);
      __int128 v442 = 0u;
      __int128 v443 = 0u;
      __int128 v440 = 0u;
      __int128 v441 = 0u;
      uint64_t v289 = v280;
      id v290 = v280;
      uint64_t v292 = objc_msgSend_countByEnumeratingWithState_objects_count_(v290, v291, (uint64_t)&v440, (uint64_t)v459, 16);
      if (v292)
      {
        uint64_t v296 = v292;
        uint64_t v297 = *(void *)v441;
        do
        {
          uint64_t v298 = 0LL;
          do
          {
            if (*(void *)v441 != v297) {
              objc_enumerationMutation(v290);
            }
            objc_msgSend_appendFormat_( v6,  v293,  (uint64_t)@"%@, ",  v294,  v295,  *(void *)(*((void *)&v440 + 1) + 8 * v298++));
          }

          while (v296 != v298);
          uint64_t v296 = objc_msgSend_countByEnumeratingWithState_objects_count_( v290,  v293,  (uint64_t)&v440,  (uint64_t)v459,  16);
        }

        while (v296);
      }

      uint64_t v303 = objc_msgSend_length(v6, v299, v300, v301, v302);
      objc_msgSend_deleteCharactersInRange_(v6, v304, v303 - 2, 2, v305);
      objc_msgSend_appendString_(v6, v306, (uint64_t)@"], ", v307, v308);
      v280 = v289;
    }

    uint64_t v425 = v87;
    objc_msgSend_roamingConsortiumList(self, v285, v286, v287, v288);
    uint64_t v426 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_count(v426, v309, v310, v311, v312))
    {
      objc_msgSend_appendString_(v6, v313, (uint64_t)@"hs20-rc=[", v315, v316);
      __int128 v438 = 0u;
      __int128 v439 = 0u;
      __int128 v436 = 0u;
      __int128 v437 = 0u;
      id v317 = v426;
      uint64_t v319 = objc_msgSend_countByEnumeratingWithState_objects_count_(v317, v318, (uint64_t)&v436, (uint64_t)v458, 16);
      if (v319)
      {
        uint64_t v323 = v319;
        uint64_t v324 = *(void *)v437;
        do
        {
          uint64_t v325 = 0LL;
          do
          {
            if (*(void *)v437 != v324) {
              objc_enumerationMutation(v317);
            }
            objc_msgSend_appendFormat_( v6,  v320,  (uint64_t)@"%@, ",  v321,  v322,  *(void *)(*((void *)&v436 + 1) + 8 * v325++));
          }

          while (v323 != v325);
          uint64_t v323 = objc_msgSend_countByEnumeratingWithState_objects_count_( v317,  v320,  (uint64_t)&v436,  (uint64_t)v458,  16);
        }

        while (v323);
      }

      uint64_t v330 = objc_msgSend_length(v6, v326, v327, v328, v329);
      objc_msgSend_deleteCharactersInRange_(v6, v331, v330 - 2, 2, v332);
      objc_msgSend_appendString_(v6, v333, (uint64_t)@"], ", v334, v335);
    }

    objc_msgSend_operatorFriendlyNameList(self, v313, v314, v315, v316);
    uint64_t v336 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_count(v336, v337, v338, v339, v340))
    {
      objc_msgSend_appendString_(v6, v341, (uint64_t)@"hs20-friend=[", v343, v344);
      __int128 v434 = 0u;
      __int128 v435 = 0u;
      __int128 v432 = 0u;
      __int128 v433 = 0u;
      id v345 = v336;
      uint64_t v347 = objc_msgSend_countByEnumeratingWithState_objects_count_(v345, v346, (uint64_t)&v432, (uint64_t)v457, 16);
      if (v347)
      {
        uint64_t v351 = v347;
        uint64_t v352 = *(void *)v433;
        do
        {
          uint64_t v353 = 0LL;
          do
          {
            if (*(void *)v433 != v352) {
              objc_enumerationMutation(v345);
            }
            objc_msgSend_appendFormat_( v6,  v348,  (uint64_t)@"%@, ",  v349,  v350,  *(void *)(*((void *)&v432 + 1) + 8 * v353++));
          }

          while (v351 != v353);
          uint64_t v351 = objc_msgSend_countByEnumeratingWithState_objects_count_( v345,  v348,  (uint64_t)&v432,  (uint64_t)v457,  16);
        }

        while (v351);
      }

      uint64_t v358 = objc_msgSend_length(v6, v354, v355, v356, v357);
      objc_msgSend_deleteCharactersInRange_(v6, v359, v358 - 2, 2, v360);
      objc_msgSend_appendString_(v6, v361, (uint64_t)@"], ", v362, v363);
    }

    objc_msgSend_cellularNetworkInfo(self, v341, v342, v343, v344);
    uint64_t v364 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_count(v364, v365, v366, v367, v368))
    {
      uint64_t v423 = v280;
      uint64_t v372 = v217;
      objc_msgSend_appendString_(v6, v369, (uint64_t)@"hs20-cell=[", v370, v371);
      __int128 v430 = 0u;
      __int128 v431 = 0u;
      __int128 v428 = 0u;
      __int128 v429 = 0u;
      id v373 = v364;
      uint64_t v375 = objc_msgSend_countByEnumeratingWithState_objects_count_(v373, v374, (uint64_t)&v428, (uint64_t)v456, 16);
      if (v375)
      {
        uint64_t v379 = v375;
        uint64_t v380 = *(void *)v429;
        do
        {
          uint64_t v381 = 0LL;
          do
          {
            if (*(void *)v429 != v380) {
              objc_enumerationMutation(v373);
            }
            objc_msgSend_appendFormat_( v6,  v376,  (uint64_t)@"%@, ",  v377,  v378,  *(void *)(*((void *)&v428 + 1) + 8 * v381++));
          }

          while (v379 != v381);
          uint64_t v379 = objc_msgSend_countByEnumeratingWithState_objects_count_( v373,  v376,  (uint64_t)&v428,  (uint64_t)v456,  16);
        }

        while (v379);
      }

      uint64_t v386 = objc_msgSend_length(v6, v382, v383, v384, v385);
      objc_msgSend_deleteCharactersInRange_(v6, v387, v386 - 2, 2, v388);
      objc_msgSend_appendString_(v6, v389, (uint64_t)@"], ", v390, v391);
      v217 = v372;
      v280 = v423;
    }

    uint64_t v93 = v424;
    uint64_t v87 = v425;
  }

  uint64_t v392 = objc_msgSend_age(self, v249, v250, v251, v252);
  uint64_t v397 = objc_msgSend_timestamp(self, v393, v394, v395, v396);
  objc_msgSend_appendFormat_(v6, v398, (uint64_t)@"age=%lums (%llu), ", v399, v400, v392, v397);
  objc_msgSend_matchingKnownNetworkProfile(self, v401, v402, v403, v404);
  uint64_t v405 = (void *)objc_claimAutoreleasedReturnValue();

  if (v405)
  {
    objc_msgSend_matchingKnownNetworkProfile(self, v406, v407, v408, v409);
    uint64_t v410 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v6, v411, (uint64_t)@"match=[%@], ", v412, v413, v410);
  }

  if (objc_msgSend_hasSuffix_(v6, v406, (uint64_t)@", ", v408, v409))
  {
    uint64_t v418 = objc_msgSend_length(v6, v414, v415, v416, v417);
    objc_msgSend_deleteCharactersInRange_(v6, v419, v418 - 2, 2, v420);
  }

  id v421 = v6;

  return (NSString *)v421;
}

- (BOOL)isEqualToScanResult:(id)a3
{
  id v4 = a3;
  objc_msgSend_SSID(self, v5, v6, v7, v8);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend_SSID(v4, v9, v10, v11, v12);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_msgSend_SSID(self, v14, v15, v16, v17);
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_SSID(v4, v20, v21, v22, v23);
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_isEqual_(v19, v25, (uint64_t)v24, v26, v27))
      {
        objc_msgSend_BSSID(self, v28, v29, v30, v31);
        uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (v36)
        {
          objc_msgSend_BSSID(v4, v32, v33, v34, v35);
          uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();
          if (v41)
          {
            objc_msgSend_BSSID(self, v37, v38, v39, v40);
            uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_BSSID(v4, v43, v44, v45, v46);
            uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend_isEqual_(v42, v48, (uint64_t)v47, v49, v50)
              && (int isFILSDiscoveryFrame = objc_msgSend_isFILSDiscoveryFrame(self, v51, v52, v53, v54),
                  isFILSDiscoveryFrame == objc_msgSend_isFILSDiscoveryFrame(v4, v55, v56, v57, v58)))
            {
              uint64_t v64 = objc_msgSend_supportedSecurityTypes(self, v59, v60, v61, v62);
              BOOL v63 = v64 == objc_msgSend_supportedSecurityTypes(v4, v65, v66, v67, v68);
            }

            else
            {
              BOOL v63 = 0;
            }
          }

          else
          {
            BOOL v63 = 0;
          }
        }

        else
        {
          BOOL v63 = 0;
        }
      }

      else
      {
        BOOL v63 = 0;
      }
    }

    else
    {
      BOOL v63 = 0;
    }
  }

  else
  {
    BOOL v63 = 0;
  }

  return v63;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CWFScanResult *)a3;
  uint64_t v5 = v4;
  if (v4 == self)
  {
    char isEqualToScanResult = 1;
  }

  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char isEqualToScanResult = objc_msgSend_isEqualToScanResult_(self, v6, (uint64_t)v5, v7, v8);
  }

  else
  {
    char isEqualToScanResult = 0;
  }

  return isEqualToScanResult;
}

- (unint64_t)hash
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = objc_msgSend_hash(v6, v7, v8, v9, v10);
  objc_msgSend_BSSID(self, v12, v13, v14, v15);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v21 = objc_msgSend_hash(v16, v17, v18, v19, v20) ^ v11;
  uint64_t v26 = v21 ^ objc_msgSend_isFILSDiscoveryFrame(self, v22, v23, v24, v25);
  unint64_t v31 = v26 ^ objc_msgSend_supportedSecurityTypes(self, v27, v28, v29, v30);

  return v31;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v6 = (void *)objc_msgSend_allocWithZone_(CWFScanResult, a2, (uint64_t)a3, v3, v4);
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

- (CWFScanResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___CWFScanResult;
  uint64_t v5 = -[CWFScanResult init](&v30, sel_init);
  if (v5)
  {
    uint64_t v29 = (void *)MEMORY[0x189604010];
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    objc_msgSend_setWithObjects_(v29, v15, v6, v16, v17, v7, v8, v9, v10, v11, v12, v13, v14, 0);
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

- (void).cxx_destruct
{
}

@end