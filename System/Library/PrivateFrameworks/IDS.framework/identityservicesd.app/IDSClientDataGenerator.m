@interface IDSClientDataGenerator
+ (BOOL)_isKTAsyncEnrollmentDisabledViaServerBag;
+ (BOOL)_isKTAsyncEnrollmentDisabledViaUserDefaults;
+ (BOOL)_shouldAddECKeysForServiceType:(id)a3;
+ (id)_createClientDatasForServiceTypes:(id)a3 withAppleIDRegistrationsForServiceTypes:(id)a4 ktRegDataByServiceType:(id)a5 publicIdentityData:(id)a6 publicIdentityError:(id)a7 keyStore:(id)a8 isPresenceCapable:(BOOL)a9 isStewieCapable:(BOOL)a10;
+ (id)clientDatasForRegistrations:(id)a3 keyStore:(id)a4 keyTransparencyVerifier:(id)a5;
+ (id)serviceTypesFromRegistrations:(id)a3;
+ (id)serviceTypesFromRegistrations:(id)a3 withRegistrationType:(int)a4;
+ (void)_fetchKTDataSignatureForServiceTypes:(id)a3 publicIdentityData:(id)a4 keyStore:(id)a5 withCompletion:(id)a6;
+ (void)_fetchPresenceCapabilityForServiceTypes:(id)a3 withCompletion:(id)a4;
+ (void)_fetchStewieCapabilityForServiceTypes:(id)a3 withCompletion:(id)a4;
@end

@implementation IDSClientDataGenerator

+ (id)serviceTypesFromRegistrations:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "serviceType", (void)v13));
        -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v10, v11);
      }

      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v7);
  }

  return v4;
}

+ (id)serviceTypesFromRegistrations:(id)a3 withRegistrationType:(int)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        if (objc_msgSend(v12, "registrationType", (void)v15) == a4)
        {
          __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 serviceType]);
          -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", v12, v13);
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v9);
  }

  return v6;
}

+ (id)clientDatasForRegistrations:(id)a3 keyStore:(id)a4 keyTransparencyVerifier:(id)a5
{
  id v125 = a3;
  id v128 = a4;
  id v124 = a5;
  id v127 = objc_alloc_init(&OBJC_CLASS___CUTUnsafePromiseSeal);
  v145[0] = 0LL;
  v145[1] = v145;
  v145[2] = 0x3032000000LL;
  v145[3] = sub_1000E3970;
  v145[4] = sub_1000E3980;
  v146 = (NSMutableDictionary *)0xAAAAAAAAAAAAAAAALL;
  v146 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v143[0] = 0LL;
  v143[1] = v143;
  v143[2] = 0x3032000000LL;
  v143[3] = sub_1000E3970;
  v143[4] = sub_1000E3980;
  v144 = (NSMutableDictionary *)0xAAAAAAAAAAAAAAAALL;
  v144 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v142 = 0LL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v128 publicMessageProtectionIdentityDataToRegisterWithError:&v142]);
  id v126 = v142;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 publicLegacyIdentityData]);
  LODWORD(a5) = v8 == 0LL;

  if (!(_DWORD)a5)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v128 errorContainerToReport]);
    uint64_t v10 = objc_alloc(&OBJC_CLASS___IDSNGMKeyLoadingMetric);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v7 publicNGMIdentityData]);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v7 publicNGMPrekeyData]);
    v123 = -[IDSNGMKeyLoadingMetric initWithErrorContainer:missingIdentity:missingPrekey:]( v10,  "initWithErrorContainer:missingIdentity:missingPrekey:",  v9,  v11 == 0LL,  v12 == 0LL);

    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(+[IDSRTCLogger loggerWithCategory:](&OBJC_CLASS___IDSRTCLogger, "loggerWithCategory:", 4000LL));
    [v13 logMetric:v123];

    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v7 publicNGMIdentityData]);
    if (v14)
    {
      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v7 publicNGMPrekeyData]);
      BOOL v16 = v15 == 0LL;

      if (!v16) {
        goto LABEL_62;
      }
    }

    __int128 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      v105 = (void *)objc_claimAutoreleasedReturnValue([v7 publicNGMIdentityData]);
      if (v105) {
        v106 = @"YES";
      }
      else {
        v106 = @"NO";
      }
      v119 = v106;
      v107 = (void *)objc_claimAutoreleasedReturnValue([v7 publicNGMPrekeyData]);
      if (v107) {
        v108 = @"YES";
      }
      else {
        v108 = @"NO";
      }
      v118 = v108;
      else {
        v109 = @"NO";
      }
      v117 = v109;
      else {
        v110 = @"NO";
      }
      v116 = v110;
      else {
        v120 = (void *)objc_claimAutoreleasedReturnValue([v9 registeredKeychainError]);
      }
      else {
        uint64_t v111 = objc_claimAutoreleasedReturnValue([v9 registeredKeychainError]);
      }
      v112 = (void *)v111;
      v113 = (void *)objc_claimAutoreleasedReturnValue([v9 generationError]);
      v114 = (void *)objc_claimAutoreleasedReturnValue([v9 rollingError]);
      v115 = (void *)objc_claimAutoreleasedReturnValue([v9 identityToRegisterError]);
      *(_DWORD *)buf = 138414338;
      v148 = v119;
      __int16 v149 = 2112;
      v150 = v118;
      __int16 v151 = 2112;
      v152 = v117;
      __int16 v153 = 2112;
      v154 = v116;
      __int16 v155 = 2112;
      v156 = v120;
      __int16 v157 = 2112;
      v158 = v112;
      __int16 v159 = 2112;
      v160 = v113;
      __int16 v161 = 2112;
      v162 = v114;
      __int16 v163 = 2112;
      v164 = v115;
      _os_log_fault_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_FAULT,  "Registering without an NGM key { hasIdentityData: %@, hasPrekeyData: %@, hasRegIdentity: %@, hasUnregIdentity: % @, keychainError: %@, serializationError: %@, generationError: %@, rollingError: %@, dataToRegisterError: %@ }",  buf,  0x5Cu);
    }

    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v7 publicNGMIdentityData]);
    if (v18) {
      v19 = @"YES";
    }
    else {
      v19 = @"NO";
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue([v7 publicNGMPrekeyData]);
    if (v20) {
      v21 = @"YES";
    }
    else {
      v21 = @"NO";
    }
    unsigned int v22 = [v9 hasRegisteredContainer];
    unsigned int v23 = [v9 hasUnregisteredContainer];
    if (v22) {
      v24 = @"YES";
    }
    else {
      v24 = @"NO";
    }
    if (v23) {
      v25 = @"YES";
    }
    else {
      v25 = @"NO";
    }
    v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"EC Key Loading Failure (iden:%@, pre:%@, reg:%@, unreg:%@)",  v19,  v21,  v24,  v25));

    v27 = (void *)objc_claimAutoreleasedReturnValue([v9 registeredKeychainError]);
    if (v27)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue([v9 shouldHaveRegisteredIdentity]);
      if (v28)
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue([v9 shouldHaveRegisteredIdentity]);
        unsigned int v30 = [v29 BOOLValue];

        if (!v30) {
          goto LABEL_32;
        }
      }

      else
      {
      }

      v34 = (void *)objc_claimAutoreleasedReturnValue([v9 registeredKeychainError]);
      v35 = (void *)objc_claimAutoreleasedReturnValue([v34 domain]);

      v36 = (void *)objc_claimAutoreleasedReturnValue([v9 registeredKeychainError]);
      v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v36 code]));

      v38 = (void *)objc_claimAutoreleasedReturnValue([v9 registeredKeychainError]);
      v39 = (void *)objc_claimAutoreleasedReturnValue([v38 userInfo]);

      v40 = (void *)objc_claimAutoreleasedReturnValue([v39 objectForKey:@"IDSKeychainWrapperErrorOSStatus"]);
      unsigned int v41 = [v35 isEqualToString:@"IDSKeychainWrapperErrorDomain"];
      if (v40) {
        unsigned int v42 = v41;
      }
      else {
        unsigned int v42 = 0;
      }
      if (v42 == 1)
      {
        id v43 = v40;

        v37 = v43;
      }

      v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @" (regKeychain %@:%ld)",  v35,  [v37 integerValue]));
      uint64_t v45 = objc_claimAutoreleasedReturnValue([v26 stringByAppendingString:v44]);

      v26 = (void *)v45;
    }

+ (id)_createClientDatasForServiceTypes:(id)a3 withAppleIDRegistrationsForServiceTypes:(id)a4 ktRegDataByServiceType:(id)a5 publicIdentityData:(id)a6 publicIdentityError:(id)a7 keyStore:(id)a8 isPresenceCapable:(BOOL)a9 isStewieCapable:(BOOL)a10
{
  id v15 = a3;
  id v220 = a4;
  id v233 = a5;
  id v16 = a6;
  id v141 = a7;
  id v232 = a8;
  v231 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v238 = 0u;
  __int128 v239 = 0u;
  __int128 v240 = 0u;
  __int128 v241 = 0u;
  id obj = v15;
  id v234 = [obj countByEnumeratingWithState:&v238 objects:v250 count:16];
  if (v234)
  {
    uint64_t v230 = *(void *)v239;
    key = (void *)_IDSIdentityClientDataMessageProtectionIdentityKey;
    v222 = (void *)_IDSIdentityClientDataMessageProtectionVersionNumberKey;
    v229 = (void *)IDSRegistrationPropertyShowPeerErrors;
    v219 = (void *)IDSRegistrationPropertyIsC2KEquipment;
    __int16 v149 = (void *)IDSGameCenterContactsAssociationID;
    v148 = (void *)IDSGameCenterContactsSharingState;
    v146 = (void *)IDSGameCenterContactsLastUpdatedDate;
    v162 = (void *)IDSGameCenterSupportsFriendingViaPush;
    v180 = (void *)IDSGameCenterSupportsMessageTransportV2;
    v164 = (void *)_IDSIdentityClientDataMessageProtectionNGMVersionNumberKey;
    v165 = (void *)_IDSIdentityClientDataMessageProtectionNGMDevicePrekeyDataKey;
    v184 = (void *)IDSRegistrationPropertyKeyTransparencyVersion;
    v147 = (void *)IDSRegistrationPropertyKeyTransparencyDeviceKeySignature;
    v160 = (void *)IDSRegistrationPropertySupportsCo;
    __int16 v161 = (void *)IDSRegistrationPropertySupportsModernGFT;
    v145 = (void *)IDSRegistrationPropertyIsGreenTea;
    __int16 v159 = (void *)IDSRegistrationPropertySupportsGondola;
    v144 = (void *)IDSRegistrationPropertyDoesNotSupportGFTCalls;
    v158 = (void *)IDSRegistrationPropertySupportsSelfOneToOneInvites;
    v143 = (void *)IDSRegistrationPropertySupportsHiResVideoMessaging;
    __int16 v157 = (void *)IDSRegistrationPropertySupportsAVLess;
    v178 = (void *)IDSRegistrationPropertySupportsAnimojiV2;
    v179 = (void *)IDSRegistrationPropertySupportsHEIFEncoding;
    v183 = (void *)IDSRegistrationPropertySupportsHDRVideo;
    v221 = (void *)IDSRegistrationPropertyPrefersSDRVideo;
    v185 = (void *)IDSRegistrationPropertySupportsUWB;
    v218 = (void *)IDSRegistrationPropertySupportsActivitySharing;
    v174 = (void *)IDSRegistrationPropertySupportsScreenTimeV2;
    *(void *)&__int128 v17 = 138412546LL;
    __int128 v140 = v17;
    v173 = (void *)IDSRegistrationPropertySupportsMapsRoutingPathLeg;
    v172 = (void *)IDSRegistrationPropertySupportsBeaconSharingV2;
    v171 = (void *)IDSRegistrationPropertySupportsBeneficiaryInvites;
    v170 = (void *)IDSRegistrationPropertySupportsMapsWaypointRouteSharing;
    v226 = (void *)IDSRegistrationPropertySupportsCrossPlatformSharing;
    v225 = (void *)IDSRegistrationPropertySupportsRecurringPaymentBubbles;
    v156 = (void *)IDSRegistrationPropertySupportsSharedExperiencePresence;
    v169 = (void *)IDSRegistrationPropertySupportsIncomingFindMyV1;
    __int16 v155 = (void *)IDSRegistrationPropertySupportsFMDV2;
    __int16 v163 = (void *)IDSRegistrationPropertySupportsFMFenceV1;
    v168 = (void *)IDSRegistrationPropertySupportsSecureLocationsV1;
    v154 = (void *)IDSRegistrationPropertySupportsKeySharing;
    __int16 v153 = (void *)IDSRegistrationPropertySupportsHarmony;
    v152 = (void *)IDSRegistrationPropertySupportsManateeForAppleCash;
    __int16 v151 = (void *)IDSRegistrationPropertySupportsRegionForAppleCash;
    v150 = (void *)IDSRegistrationPropertySupportsHomeKitResident;
    v182 = (void *)IDSRegistrationPropertySupportsZelkova;
    v227 = (void *)IDSRegistrationPropertySupportsFindMyPluginMessages;
    v217 = (void *)IDSRegistrationPropertySupportsInlineAttachments;
    v216 = (void *)IDSRegistrationPropertySupportsKeepReceipts;
    v215 = (void *)IDSRegistrationPropertySupportsLocationSharing;
    v214 = (void *)IDSRegistrationPropertySupportsMediaV2;
    v213 = (void *)IDSRegistrationPropertySupportsStickersV1;
    v212 = (void *)IDSRegistrationPropertySupportsChatAppsV1;
    v211 = (void *)IDSRegistrationPropertySupportsBubbleEditingV1;
    v210 = (void *)IDSRegistrationPropertySupportsAcknowledgementsV1;
    v209 = (void *)IDSRegistrationPropertySupportsInvisibleInkV1;
    v208 = (void *)IDSRegistrationPropertySupportsFullScreenMomentsV1;
    v207 = (void *)IDSRegistrationPropertySupportsFullScreenMomentsV2;
    v206 = (void *)IDSRegistrationPropertySupportsFullScreenMomentsV3;
    v205 = (void *)IDSRegistrationPropertySupportsImpactEffectsV1;
    v204 = (void *)IDSRegistrationPropertySupportsUpdateAttachmentsV1;
    v203 = (void *)IDSRegistrationPropertySupportsAutoloopVideoV1;
    v202 = (void *)IDSRegistrationPropertySupportsPhotosExtensionV1;
    v201 = (void *)IDSRegistrationPropertySupportsPhotosExtensionV2;
    v200 = (void *)IDSRegistrationPropertySupportsAudioMessagingV2;
    v199 = (void *)IDSRegistrationPropertySupportsCertifiedDeliveryV1;
    v198 = (void *)IDSRegistrationPropertySupportsOriginalTimestampOrderingV1;
    v197 = (void *)IDSRegistrationPropertyOptionallyReceiveTypingIndicator;
    v196 = (void *)IDSRegistrationPropertyNicknamesVersion;
    v177 = (void *)IDSRegistrationPropertyECVersion;
    v195 = (void *)IDSRegistrationPropertySupportsProtobufPayloadDataV2;
    v194 = (void *)IDSRegistrationPropertySupportsSyndicationActionsV1;
    v193 = (void *)IDSRegistrationPropertySupportsDeliveredQuietlyAndNotifyRecipient;
    v192 = (void *)IDSRegistrationPropertySupportsRetractAndEditMessages;
    v191 = (void *)IDSRegistrationPropertySupportsEmojiStickers;
    v190 = (void *)IDSRegistrationPropertySupportsStickerEditing;
    v189 = (void *)IDSRegistrationPropertySupportsHybridGroupsV1;
    v176 = (void *)IDSRegistrationPropertySupportsGroupPhotoRefreshVersion;
    v181 = (void *)IDSRegistrationPropertySupportsSOSAlerting;
    v188 = (void *)IDSRegistrationPropertySupportsEmojiTapbacks;
    v167 = (void *)IDSRegistrationPropertySupportsStickMojiBacks;
    v166 = (void *)IDSRegistrationPropertySupportsEmojiImages;
    v187 = (void *)IDSRegistrationPropertySupportsHighQualityPhotoFileSizes;
    v175 = (void *)IDSRegistrationPropertySenderKeyMessageVersion;
    v186 = (void *)IDSRegistrationPropertySupportsSenderKey;
    v228 = (void *)IDSRegistrationPropertySupportsLiveDelivery;
    __int128 v18 = &IMInsertBoolsToXPCDictionary_ptr;
    v224 = v16;
    do
    {
      v19 = 0LL;
      do
      {
        if (*(void *)v239 != v230) {
          objc_enumerationMutation(obj);
        }
        v20 = *(void **)(*((void *)&v238 + 1) + 8LL * (void)v19);
        v21 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        unsigned int v22 = (os_log_s *)objc_claimAutoreleasedReturnValue([v18[440] registration]);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
          sub_10069A96C(v248, v16, &v249, v22);
        }

        unsigned int v23 = (void *)objc_claimAutoreleasedReturnValue([v16 publicLegacyIdentityData]);
        if (v23) {
          CFDictionarySetValue((CFMutableDictionaryRef)v21, key, v23);
        }

        uint64_t v24 = _IDSIdentityVersionNumber();
        v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
        if (v25) {
          CFDictionarySetValue((CFMutableDictionaryRef)v21, v222, v25);
        }

        CFDictionarySetValue((CFMutableDictionaryRef)v21, v229, &__kCFBooleanTrue);
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
        unsigned int v27 = [v26 isC2KEquipment];

        if (v27) {
          CFDictionarySetValue((CFMutableDictionaryRef)v21, v219, &__kCFBooleanTrue);
        }
        if (IDSIsGameCenterRegistrationServiceType(v20))
        {
          v28 = (void *)objc_claimAutoreleasedReturnValue([v220 objectForKey:v20]);
          if (v28)
          {
            v29 = (void *)objc_claimAutoreleasedReturnValue(+[FTPasswordManager sharedInstance](&OBJC_CLASS___FTPasswordManager, "sharedInstance"));
            unsigned int v30 = (void *)objc_claimAutoreleasedReturnValue([v28 userID]);
            v31 = (void *)objc_claimAutoreleasedReturnValue([v29 gameCenterPropertiesFromAccountWithUsername:v30]);

            v32 = (os_log_s *)objc_claimAutoreleasedReturnValue([v18[440] registration]);
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v243 = v31;
              _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Game center contacts client data: %@",  buf,  0xCu);
            }

            if (v31)
            {
              v33 = (void *)objc_claimAutoreleasedReturnValue([v31 contactsAssociationID]);
              if (v33) {
                CFDictionarySetValue((CFMutableDictionaryRef)v21, v149, v33);
              }

              v34 = (void *)objc_claimAutoreleasedReturnValue([v31 contactsSharingState]);
              if (v34) {
                CFDictionarySetValue((CFMutableDictionaryRef)v21, v148, v34);
              }

              v35 = (void *)objc_claimAutoreleasedReturnValue([v31 contactsLastUpdatedDate]);
              if (v35)
              {
                v36 = (void *)objc_claimAutoreleasedReturnValue([v31 contactsLastUpdatedDate]);
                [v36 timeIntervalSince1970];
                v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));

                if (v37) {
                  CFDictionarySetValue((CFMutableDictionaryRef)v21, v146, v37);
                }
              }
            }

            v38 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance", v140));
            v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v38 supportsFriendingViaPush]));

            if (v39) {
              CFDictionarySetValue((CFMutableDictionaryRef)v21, v162, v39);
            }

            CFDictionarySetValue((CFMutableDictionaryRef)v21, v180, &__kCFBooleanTrue);
          }

          else
          {
            v31 = (void *)objc_claimAutoreleasedReturnValue([v18[440] registration]);
            if (os_log_type_enabled((os_log_t)v31, OS_LOG_TYPE_DEFAULT))
            {
              v40 = (void *)objc_claimAutoreleasedReturnValue([obj objectForKey:v20]);
              *(_DWORD *)buf = 138412290;
              id v243 = v40;
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v31,  OS_LOG_TYPE_DEFAULT,  "Game center registration %@ found. Skipping",  buf,  0xCu);
            }
          }
        }

        uint64_t v41 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "publicNGMIdentityData", v140));
        if (v41
          && (unsigned int v42 = (void *)v41,
              id v43 = (void *)objc_claimAutoreleasedReturnValue([v16 publicNGMPrekeyData]),
              v43,
              v42,
              v43))
        {
          v44 = (void *)objc_claimAutoreleasedReturnValue([v16 publicNGMPrekeyData]);
          if (v44) {
            CFDictionarySetValue((CFMutableDictionaryRef)v21, v165, v44);
          }

          uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue([v16 NGMVersion]);
          v46 = &OBJC_METACLASS___IDSAttachmentEncryptionParameter;
          if (v45) {
            CFDictionarySetValue((CFMutableDictionaryRef)v21, v164, v45);
          }
        }

        else
        {
          uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue([v18[440] registration]);
          if (os_log_type_enabled((os_log_t)v45, OS_LOG_TYPE_FAULT))
          {
            id v131 = (void *)objc_claimAutoreleasedReturnValue([v16 publicNGMIdentityData]);
            if (v131) {
              id v132 = @"YES";
            }
            else {
              id v132 = @"NO";
            }
            id v133 = (void *)objc_claimAutoreleasedReturnValue([v224 publicNGMPrekeyData]);
            *(_DWORD *)buf = 138544131;
            if (v133) {
              id v134 = @"YES";
            }
            else {
              id v134 = @"NO";
            }
            id v243 = v141;
            __int16 v244 = 2113;
            *(void *)v245 = v132;
            id v16 = v224;
            *(_WORD *)&v245[8] = 2113;
            *(void *)&v245[10] = v134;
            __int16 v246 = 2113;
            v247 = v224;
            _os_log_fault_impl( (void *)&_mh_execute_header,  (os_log_t)v45,  OS_LOG_TYPE_FAULT,  "Missing ngm public identity data from -[<IDSClientDataRegistrationKeyManager> publicMessageProtectionIdent ityDataToRegisterWithError:] -- {error: %{public}@, publicNGMIdentityData: %{private}@, publicNGMPrekeyDat a: %{private}@, publicIdentityData: %{private}@ }",  buf,  0x2Au);
          }

          v46 = &OBJC_METACLASS___IDSAttachmentEncryptionParameter;
        }

        v47 = (void *)objc_claimAutoreleasedReturnValue([v232 keyTransparencyVersionNumberToRegisterForServiceType:v20]);
        if ([v47 unsignedIntValue])
        {
          id v48 = v47;
          if (v48) {
            CFDictionarySetValue((CFMutableDictionaryRef)v21, v184, v48);
          }
        }

        v237 = v47;
        unsigned int v49 = (void *)objc_claimAutoreleasedReturnValue([obj objectForKeyedSubscript:v20]);
        v50 = (void *)objc_claimAutoreleasedReturnValue([&v46[34] sharedInstance]);
        v236 = v49;
        v51 = (void *)objc_claimAutoreleasedReturnValue([v49 serviceIdentifier]);
        v52 = (void *)objc_claimAutoreleasedReturnValue([v50 serviceWithIdentifier:v51]);

        if ([v52 adHocServiceType])
        {
          v53 = (void *)objc_claimAutoreleasedReturnValue([&v46[34] sharedInstance]);
          uint64_t v54 = objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "primaryServiceForAdhocServiceType:", objc_msgSend(v52, "adHocServiceType")));

          v52 = (void *)v54;
        }

        v55 = (void *)objc_claimAutoreleasedReturnValue([v233 objectForKeyedSubscript:v20]);
        v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
        v57 = v56;
        if (!v55)
        {
          if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
          {
            unsigned int v64 = [v52 ktRegistrationDataIndex];
            *(_DWORD *)buf = v140;
            id v243 = v20;
            __int16 v244 = 1024;
            *(_DWORD *)v245 = v64;
            v65 = v57;
            unsigned int v66 = "No KT Registration Data found for key index. { serviceType: %@, ktKeyIndex: %u }";
            uint32_t v67 = 18;
            goto LABEL_150;
          }

+ (BOOL)_shouldAddECKeysForServiceType:(id)a3
{
  return 1;
}

+ (BOOL)_isKTAsyncEnrollmentDisabledViaUserDefaults
{
  unsigned int v2 = +[IMUserDefaults isKTAsyncEnrollmentDisabled](&OBJC_CLASS___IMUserDefaults, "isKTAsyncEnrollmentDisabled");
  if (v2) {
    LOBYTE(v2) = CUTIsInternalInstall();
  }
  return v2;
}

+ (BOOL)_isKTAsyncEnrollmentDisabledViaServerBag
{
  unsigned int v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstanceForBagType:](&OBJC_CLASS___IDSServerBag, "sharedInstanceForBagType:", 0LL));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"kt-async-enrollment-disabled"]);

  if (v3 && (uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber, v4), (objc_opt_isKindOfClass(v3, v5) & 1) != 0)) {
    unsigned __int8 v6 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

+ (void)_fetchStewieCapabilityForServiceTypes:(id)a3 withCompletion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v8)
  {
    int v9 = 0;
    uint64_t v10 = *(void *)v33;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v33 != v10) {
          objc_enumerationMutation(v7);
        }
        v9 |= IDSIsiMessageRegistrationServiceType(*(void *)(*((void *)&v32 + 1) + 8LL * (void)i));
      }

      id v8 = [v7 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }

    while (v8);

    if ((v9 & 1) != 0)
    {
      *(void *)buf = 0LL;
      v29 = buf;
      uint64_t v30 = 0x2020000000LL;
      char v31 = 0;
      uint64_t v14 = im_primary_queue(v12, v13);
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472LL;
      v25[2] = sub_1000E5B40;
      v25[3] = &unk_1008F9E88;
      id v15 = (id)objc_claimAutoreleasedReturnValue(v14);
      id v26 = v15;
      unsigned int v27 = buf;
      id v16 = objc_retainBlock(v25);
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472LL;
      v21[2] = sub_1000E5D4C;
      v21[3] = &unk_1008F9ED8;
      id v17 = v15;
      id v22 = v17;
      id v23 = v6;
      uint64_t v24 = buf;
      __int128 v18 = objc_retainBlock(v21);
      dispatch_time_t v19 = dispatch_time(0LL, 10000000000LL);
      im_dispatch_async_with_timeout(v19, v16, v18, &stru_1008F9EF8);

      _Block_object_dispose(buf, 8);
      goto LABEL_14;
    }
  }

  else
  {
  }

  v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Not checking stewie capability because we're not registering madrid",  buf,  2u);
  }

  (*((void (**)(id, void))v6 + 2))(v6, 0LL);
LABEL_14:
}

+ (void)_fetchPresenceCapabilityForServiceTypes:(id)a3 withCompletion:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void))a4;
  uint64_t v7 = IMWeakLinkClass(@"SKPresence", @"StatusKit");
  if (!v7)
  {
    id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "StatusKit framework not available on this platform",  buf,  2u);
    }

    goto LABEL_17;
  }

  uint64_t v8 = v7;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id v9 = v5;
  id v10 = [v9 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (!v10)
  {

LABEL_15:
    id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Not checking presence capability because we're not registering multiplex",  buf,  2u);
    }

+ (void)_fetchKTDataSignatureForServiceTypes:(id)a3 publicIdentityData:(id)a4 keyStore:(id)a5 withCompletion:(id)a6
{
}

@end