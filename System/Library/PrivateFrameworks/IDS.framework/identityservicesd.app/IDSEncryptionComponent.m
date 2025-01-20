@interface IDSEncryptionComponent
- (BOOL)_shouldAutoBugCaptureForECError:(id)a3;
- (BOOL)_shouldIgnoreAutoBugCaptureForECFailure:(id)a3;
- (BOOL)shouldForwardErrorForEncryptionType:(int64_t)a3 forceECC:(BOOL)a4;
- (IDSEncryptionComponent)initWithEncryptionController:(id)a3 pinnedIdentityController:(id)a4;
- (id)runIndividuallyWithInput:(id)a3;
- (id)serviceController;
- (void)_shouldDisableEchnidaEncryption;
- (void)_shouldDisableEncryption:(id)a3 UserDefaultKey:(id)a4;
- (void)_shouldDisableSecondaryEncryption;
@end

@implementation IDSEncryptionComponent

- (id)serviceController
{
  return +[IDSDServiceController sharedInstance](&OBJC_CLASS___IDSDServiceController, "sharedInstance");
}

- (IDSEncryptionComponent)initWithEncryptionController:(id)a3 pinnedIdentityController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___IDSEncryptionComponent;
  v9 = -[IDSEncryptionComponent init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_encryptionController, a3);
    objc_storeStrong((id *)&v10->_pinnedIdentityController, a4);
  }

  return v10;
}

- (id)runIndividuallyWithInput:(id)a3
{
  id v4 = a3;
  -[IDSEncryptionComponent _shouldDisableSecondaryEncryption](self, "_shouldDisableSecondaryEncryption");
  -[IDSEncryptionComponent _shouldDisableEchnidaEncryption](self, "_shouldDisableEchnidaEncryption");
  v131 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v142 = (void *)objc_claimAutoreleasedReturnValue([v4 dataToEncrypt]);
  v125 = (void *)objc_claimAutoreleasedReturnValue([v4 attributes]);
  unsigned int v5 = [v4 isScheduled];
  uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 service]);
  v124 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v141 = self;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSEncryptionComponent serviceController](self, "serviceController"));
  v140 = (void *)v6;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 serviceWithIdentifier:v6]);

  v119 = v8;
  unsigned int v135 = [v8 requiresPinnedIdentity];
  __int128 v169 = 0u;
  __int128 v170 = 0u;
  __int128 v171 = 0u;
  __int128 v172 = 0u;
  v146 = v4;
  id obj = (id)objc_claimAutoreleasedReturnValue([v4 endpoints]);
  id v134 = [obj countByEnumeratingWithState:&v169 objects:v181 count:16];
  if (!v134) {
    goto LABEL_95;
  }
  uint64_t v132 = v5;
  uint64_t v133 = *(void *)v170;
  uint64_t v121 = IDSSendErrorDomain;
  do
  {
    uint64_t v9 = 0LL;
    do
    {
      if (*(void *)v170 != v133) {
        objc_enumerationMutation(obj);
      }
      v10 = *(void **)(*((void *)&v169 + 1) + 8 * v9);
      if (v135
        && !-[IDSPinnedIdentityController foundPersistedIdentityForEndpoint:forService:]( v141->_pinnedIdentityController,  "foundPersistedIdentityForEndpoint:forService:",  *(void *)(*((void *)&v169 + 1) + 8 * v9),  v140))
      {
        v115 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  v121,  39LL,  0LL);
        v114 = (void *)objc_claimAutoreleasedReturnValue( +[CUTUnsafePromise failedPromiseWithError:]( &OBJC_CLASS___CUTUnsafePromise,  "failedPromiseWithError:",  v115));

        goto LABEL_102;
      }

      uint64_t v144 = v9;
      uint64_t v168 = 2LL;
      v11 = objc_alloc(&OBJC_CLASS___IDSCryptionContext);
      objc_super v12 = (void *)objc_claimAutoreleasedReturnValue([v146 guid]);
      v13 = (void *)objc_claimAutoreleasedReturnValue([v146 fromID]);
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[IDSURI URIWithPrefixedURI:](&OBJC_CLASS___IDSURI, "URIWithPrefixedURI:", v13));
      v15 = (void *)objc_claimAutoreleasedReturnValue( +[IDSPushHandler sharedInstanceWithPortName:]( &OBJC_CLASS___IDSPushHandler,  "sharedInstanceWithPortName:",  @"com.apple.identityservicesd.aps"));
      v16 = (void *)objc_claimAutoreleasedReturnValue([v15 pushToken]);
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPushToken pushTokenWithData:](&OBJC_CLASS___IDSPushToken, "pushTokenWithData:", v16));
      v18 = (void *)objc_claimAutoreleasedReturnValue([v10 URI]);
      v149 = v10;
      v19 = (void *)objc_claimAutoreleasedReturnValue([v10 pushTokenObject]);
      v20 = -[IDSCryptionContext initWithGuid:sendingURI:sendingPushToken:receivingURI:receivingPushToken:service:]( v11,  "initWithGuid:sendingURI:sendingPushToken:receivingURI:receivingPushToken:service:",  v12,  v14,  v17,  v18,  v19,  v140);

      v147 = v20;
      -[IDSCryptionContext setMessageType:](v20, "setMessageType:", v132);
      if (!v142)
      {
        v27 = 0LL;
        id v148 = 0LL;
        id v25 = 0LL;
        v28 = 0LL;
        v29 = v149;
        goto LABEL_84;
      }

      id v21 = [v146 encryptionType];
      if ((unint64_t)v21 < 2)
      {
        encryptionController = v141->_encryptionController;
        id v164 = 0LL;
        id v165 = 0LL;
        v22 = v149;
        v24 = (void *)objc_claimAutoreleasedReturnValue( -[IDSEncryptionController publicKeyEncryptData:encryptionContext:forceSizeOptimizations:resetState:withEncryptedAttributes:toEndpoint:usedEncryptionType:priority:metadata:error:]( encryptionController,  "publicKeyEncryptData:encryptionContext:forceSizeOptimizations:resetState:withEncryptedAttribut es:toEndpoint:usedEncryptionType:priority:metadata:error:",  v142,  v20,  0LL,  0LL,  v125,  v149,  &v168,  300LL,  &v165,  &v164));
        id v148 = v165;
        id v25 = v164;
        goto LABEL_18;
      }

      v22 = v149;
      if (v21 == (id)3)
      {
        v31 = v141->_encryptionController;
        id v166 = 0LL;
        v24 = (void *)objc_claimAutoreleasedReturnValue( -[IDSEncryptionController offGridKeyDistributionEncryptData:encryptionContext:toEndpoint:priority:error:]( v31,  "offGridKeyDistributionEncryptData:encryptionContext:toEndpoint:priority:error:",  v142,  v20,  v149,  300LL,  &v166));
        id v25 = v166;
        id v148 = 0LL;
        uint64_t v26 = 6LL;
        goto LABEL_16;
      }

      if (v21 == (id)2)
      {
        v23 = v141->_encryptionController;
        id v167 = 0LL;
        v24 = (void *)objc_claimAutoreleasedReturnValue( -[IDSEncryptionController legacyPublicKeyEncryptData:withEncryptedAttributes:toEndpoint:priority:error:]( v23,  "legacyPublicKeyEncryptData:withEncryptedAttributes:toEndpoint:priority:error:",  v142,  v125,  v149,  300LL,  &v167));
        id v25 = v167;
        id v148 = 0LL;
        uint64_t v26 = 1LL;
LABEL_16:
        uint64_t v168 = v26;
        goto LABEL_18;
      }

      id v148 = 0LL;
      id v25 = 0LL;
      v24 = 0LL;
LABEL_18:
      if ([v24 length]) {
        BOOL v32 = v25 == 0LL;
      }
      else {
        BOOL v32 = 0;
      }
      uint64_t v33 = v32;
      if (v32
        || !-[IDSEncryptionComponent shouldForwardErrorForEncryptionType:forceECC:]( v141,  "shouldForwardErrorForEncryptionType:forceECC:",  v168,  [v146 encryptionType] == (id)1))
      {
        if (v168 == 4) {
          uint64_t v145 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v33));
        }
        else {
          uint64_t v145 = 0LL;
        }
        v138 = v24;
        if ((v168 & 0xFFFFFFFFFFFFFFFELL) == 4) {
          uint64_t v139 = 0LL;
        }
        else {
          uint64_t v139 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v33));
        }
        int v143 = v33;
        uint64_t v53 = v168;
        if (v168 == 4) {
          v54 = v25;
        }
        else {
          v54 = 0LL;
        }
        id v52 = v54;
        if ((v53 & 0xFFFFFFFFFFFFFFFELL) == 4) {
          v51 = 0LL;
        }
        else {
          v51 = v25;
        }
        id v48 = v51;
      }

      else
      {
        v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog delivery](&OBJC_CLASS___IDSFoundationLog, "delivery"));
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          v35 = (void *)objc_claimAutoreleasedReturnValue([v146 guid]);
          v36 = (void *)objc_claimAutoreleasedReturnValue([v22 pushToken]);
          v37 = (void *)objc_claimAutoreleasedReturnValue([v22 URI]);
          id v38 = v25;
          v39 = (void *)objc_claimAutoreleasedReturnValue([v37 prefixedURI]);
          v40 = v24;
          v41 = (void *)_IDSCopyIDForTokenWithURI(v36, v39);
          uint64_t v42 = v168;
          id v43 = v41;
          uint64_t v44 = IDSEncryptionTypeStringFromEncryptionType(v42);
          v45 = (void *)objc_claimAutoreleasedReturnValue(v44);

          *(_DWORD *)buf = 138413058;
          uint64_t v174 = (uint64_t)v35;
          __int16 v175 = 2112;
          uint64_t v176 = (uint64_t)v41;
          v24 = v40;
          __int16 v177 = 2112;
          uint64_t v178 = (uint64_t)v45;
          __int16 v179 = 2112;
          id v180 = v38;
          _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "GUID %@ Destination %@ Falling back to legacy encryption { encryptionType: %@, error: %@ }",  buf,  0x2Au);

          id v25 = v38;
          v22 = v149;
        }

        v46 = v141->_encryptionController;
        id v163 = 0LL;
        v47 = (void *)objc_claimAutoreleasedReturnValue( -[IDSEncryptionController legacyPublicKeyEncryptData:withEncryptedAttributes:toEndpoint:priority:error:]( v46,  "legacyPublicKeyEncryptData:withEncryptedAttributes:toEndpoint:priority:error:",  v142,  v125,  v22,  300LL,  &v163));
        id v48 = v163;

        uint64_t v168 = 1LL;
        if ([v47 length]) {
          BOOL v49 = v48 == 0LL;
        }
        else {
          BOOL v49 = 0;
        }
        uint64_t v50 = v49;
        uint64_t v145 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL));
        int v143 = v50;
        v138 = v47;
        uint64_t v139 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v50));
        v51 = v25;
        id v52 = v25;
      }

      id v55 = v51;
      v137 = (void *)objc_claimAutoreleasedReturnValue([v148 additionalEncryptionResult]);
      v56 = (void *)objc_claimAutoreleasedReturnValue([v137 objectForKey:&off_100947350]);
      id v57 = v56;
      v58 = v57;
      if (![v57 code])
      {
        v59 = (void *)objc_claimAutoreleasedReturnValue([v57 domain]);
        unsigned int v60 = [v59 isEqualToString:@"com.apple.messageprotection"];

        v58 = v57;
        if (v60)
        {

          v58 = 0LL;
        }
      }

      v136 = v57;
      v61 = (void *)v145;
      if (v56) {
        uint64_t v62 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v58 == 0LL));
      }
      else {
        uint64_t v62 = 0LL;
      }
      v63 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog delivery](&OBJC_CLASS___IDSFoundationLog, "delivery"));
      int v64 = v143;
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        uint64_t v174 = v145;
        __int16 v175 = 2112;
        uint64_t v176 = v139;
        __int16 v177 = 2112;
        uint64_t v178 = v62;
        _os_log_impl( (void *)&_mh_execute_header,  v63,  OS_LOG_TYPE_DEFAULT,  "Outgoing message - processing metrics { ECSuccess: %@, legacySuccess: %@, secondarySuccess: %@ }",  buf,  0x20u);
      }

      if (+[IDSAutoBugCapture isSupported](&OBJC_CLASS___IDSAutoBugCapture, "isSupported"))
      {
        v65 = (void *)objc_claimAutoreleasedReturnValue( +[IDSMessageMetricReporter errorToReportForNGMError:]( &OBJC_CLASS___IDSMessageMetricReporter,  "errorToReportForNGMError:",  v58));
        v129 = (void *)objc_claimAutoreleasedReturnValue( +[IDSMessageMetricReporter errorToReportForNGMError:]( &OBJC_CLASS___IDSMessageMetricReporter,  "errorToReportForNGMError:",  v52));
        v127 = (void *)objc_claimAutoreleasedReturnValue( +[IDSMessageMetricReporter errorToReportForLegacyError:]( &OBJC_CLASS___IDSMessageMetricReporter,  "errorToReportForLegacyError:",  v48));
        if (!v143
          || (v66 = &stru_100912B50,
              -[IDSEncryptionComponent _shouldAutoBugCaptureForECError:](v141, "_shouldAutoBugCaptureForECError:", v52)))
        {
          v122 = v65;
          if (v52 && v48)
          {
            id v67 = v25;
            v68 = (void *)objc_claimAutoreleasedReturnValue([v129 domain]);
            id v69 = v52;
            id v70 = [v129 code];
            v71 = (void *)objc_claimAutoreleasedReturnValue([v127 domain]);
            id v118 = v70;
            id v52 = v69;
            v22 = v149;
            v72 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"EC (%@:%ld) and Legacy (%@:%ld)",  v68,  v118,  v71,  [v127 code]));

            goto LABEL_67;
          }

          id v67 = v25;
          if (v52)
          {
            v68 = (void *)objc_claimAutoreleasedReturnValue([v129 domain]);
            v73 = +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"EC (%@:%ld)",  v68,  [v129 code]);
LABEL_66:
            v72 = (__CFString *)objc_claimAutoreleasedReturnValue(v73);
LABEL_67:
          }

          else
          {
            if (v48)
            {
              v68 = (void *)objc_claimAutoreleasedReturnValue([v127 domain]);
              v73 = +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"Legacy (%@:%ld)",  v68,  [v127 code]);
              goto LABEL_66;
            }

            v72 = &stru_100912B50;
          }

          v158[0] = _NSConcreteStackBlock;
          v158[1] = 3221225472LL;
          v158[2] = sub_10015EA20;
          v158[3] = &unk_1008FBB50;
          v66 = v72;
          v159 = v66;
          id v160 = v52;
          id v161 = v48;
          id v162 = v58;
          +[IDSAutoBugCapture triggerCaptureWithEvent:context:completion:]( &OBJC_CLASS___IDSAutoBugCapture,  "triggerCaptureWithEvent:context:completion:",  100LL,  v66,  v158);

          id v25 = v67;
          int v64 = v143;
          v65 = v122;
        }

        if (v58)
        {
          id v74 = v25;
          v75 = (void *)objc_claimAutoreleasedReturnValue([v65 domain]);
          v76 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"Secondary (%@:%ld)",  v75,  [v65 code]));

          v153[0] = _NSConcreteStackBlock;
          v153[1] = 3221225472LL;
          v153[2] = sub_10015EAEC;
          v153[3] = &unk_1008FBB50;
          v77 = v76;
          int v64 = v143;
          v66 = v77;
          v154 = v77;
          id v155 = v52;
          id v156 = v48;
          id v157 = v58;
          id v25 = v74;
          +[IDSAutoBugCapture triggerCaptureWithEvent:context:completion:]( &OBJC_CLASS___IDSAutoBugCapture,  "triggerCaptureWithEvent:context:completion:",  104LL,  v66,  v153);
        }

        v61 = (void *)v145;
      }

      if ((v64 & 1) != 0)
      {
        v29 = v22;
        v78 = (void *)v62;
        v79 = v52;
        v80 = v48;
        v81 = (void *)v139;
        v82 = v78;
        if (v78 || v61 || !v139)
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue( +[IDSMessageMetricReporter messageMetadataWithEndpoint:secondarySuccess:ECSuccess:legacySuccess:secondaryError:ECError:legacyError:]( &OBJC_CLASS___IDSMessageMetricReporter,  "messageMetadataWithEndpoint:secondarySuccess:ECSuccess:legacySuccess:secondaryError:ECError:legacyError:",  v29,  v78,  v61,  v139,  v58,  v79,  v80));
          goto LABEL_82;
        }

        +[IDSMessageMetricReporter reportEncryptionSideMetricWithEndpoint:secondarySuccess:ECSuccess:legacySuccess:secondaryError:ECError:legacyError:]( &OBJC_CLASS___IDSMessageMetricReporter,  "reportEncryptionSideMetricWithEndpoint:secondarySuccess:ECSuccess:legacySuccess:secondaryError:ECError:legacyError:",  v29,  0LL,  0LL,  v139,  v58,  v79,  v80);
      }

      else
      {
        id v130 = v52;
        v83 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog delivery](&OBJC_CLASS___IDSFoundationLog, "delivery"));
        if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
        {
          v84 = (void *)objc_claimAutoreleasedReturnValue([v146 guid]);
          id v85 = v25;
          v86 = (void *)objc_claimAutoreleasedReturnValue([v149 pushToken]);
          v87 = (void *)objc_claimAutoreleasedReturnValue([v149 URI]);
          v88 = (void *)objc_claimAutoreleasedReturnValue([v87 prefixedURI]);
          v89 = (void *)_IDSCopyIDForTokenWithURI(v86, v88);
          uint64_t v123 = v62;
          uint64_t v90 = v168;
          id v128 = v48;
          id v91 = v89;
          uint64_t v92 = IDSEncryptionTypeStringFromEncryptionType(v90);
          v93 = (void *)objc_claimAutoreleasedReturnValue(v92);

          *(_DWORD *)buf = 138413058;
          uint64_t v174 = (uint64_t)v84;
          __int16 v175 = 2112;
          uint64_t v176 = (uint64_t)v89;
          __int16 v177 = 2112;
          uint64_t v178 = (uint64_t)v93;
          __int16 v179 = 2112;
          id v180 = v85;
          _os_log_impl( (void *)&_mh_execute_header,  v83,  OS_LOG_TYPE_DEFAULT,  "GUID %@ Destination %@ Failed encryption type %@ with error %@",  buf,  0x2Au);

          v61 = (void *)v145;
          int v64 = v143;

          id v25 = v85;
          uint64_t v62 = v123;

          id v48 = v128;
          v22 = v149;
        }

        id v117 = v48;
        v29 = v22;
        v94 = v22;
        uint64_t v95 = v62;
        v80 = v48;
        v81 = (void *)v139;
        v82 = (void *)v62;
        v79 = v130;
        +[IDSMessageMetricReporter reportEncryptionSideMetricWithEndpoint:secondarySuccess:ECSuccess:legacySuccess:secondaryError:ECError:legacyError:]( &OBJC_CLASS___IDSMessageMetricReporter,  "reportEncryptionSideMetricWithEndpoint:secondarySuccess:ECSuccess:legacySuccess:secondaryError:ECError:legacyError:",  v94,  v95,  v61,  v139,  v58,  v130,  v117);
        v96 = objc_alloc(&OBJC_CLASS___NSDictionary);
        v97 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed encrypting message %@",  v25));
        v98 = -[NSDictionary initWithObjectsAndKeys:]( v96,  "initWithObjectsAndKeys:",  v97,  NSLocalizedDescriptionKey,  v146,  @"IDSPipelineParameter",  0LL);

        v99 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  v121,  3LL,  v98);
        uint64_t v120 = objc_claimAutoreleasedReturnValue( +[CUTUnsafePromise failedPromiseWithError:]( &OBJC_CLASS___CUTUnsafePromise,  "failedPromiseWithError:",  v99));

        v61 = (void *)v145;
      }

      v27 = 0LL;
LABEL_82:

      if (!v64)
      {
        int v105 = 0;
        v28 = v138;
        goto LABEL_90;
      }

      v28 = v138;
LABEL_84:
      v100 = objc_alloc(&OBJC_CLASS___IDSEncryptedData);
      v101 = -[IDSEncryptedData initWithData:encryptionType:payloadMetadata:]( v100,  "initWithData:encryptionType:payloadMetadata:",  v28,  v168,  v27);
      -[NSMutableDictionary setObject:forKey:](v131, "setObject:forKey:", v101, v29);
      if (v101)
      {
        v102 = (void *)objc_claimAutoreleasedReturnValue([v29 URI]);
        v103 = (void *)objc_claimAutoreleasedReturnValue([v29 pushTokenObject]);
        v104 = (void *)objc_claimAutoreleasedReturnValue([v102 URIByAddingPushToken:v103]);

        if (v104) {
          -[NSMutableDictionary setObject:forKey:](v124, "setObject:forKey:", v101, v104);
        }
      }

      int v105 = 1;
LABEL_90:

      if (!v105)
      {
        v114 = (void *)v120;
LABEL_102:

        v109 = v124;
        goto LABEL_103;
      }

      uint64_t v9 = v144 + 1;
    }

    while (v134 != (id)(v144 + 1));
    id v106 = [obj countByEnumeratingWithState:&v169 objects:v181 count:16];
    id v134 = v106;
  }

  while (v106);
LABEL_95:

  v107 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog delivery](&OBJC_CLASS___IDSFoundationLog, "delivery"));
  if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
  {
    v108 = (void *)objc_claimAutoreleasedReturnValue([v146 guid]);
    *(_DWORD *)buf = 138412290;
    uint64_t v174 = (uint64_t)v108;
    _os_log_impl((void *)&_mh_execute_header, v107, OS_LOG_TYPE_DEFAULT, "GUID %@ finished encryption", buf, 0xCu);
  }

  v109 = v124;
  if (-[NSMutableDictionary count](v124, "count"))
  {
    v110 = (void *)objc_claimAutoreleasedReturnValue([v146 guid]);
    id v111 = [v110 copy];

    v150[0] = _NSConcreteStackBlock;
    v150[1] = 3221225472LL;
    v150[2] = sub_10015EBB8;
    v150[3] = &unk_1008F5F80;
    id v151 = v111;
    id v152 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary debugDescription](v124, "debugDescription"));
    id v112 = v152;
    id v113 = v111;
    cut_dispatch_log_queue(v150);

    v109 = v124;
  }

  [v146 setEndpointsToEncryptedData:v131];
  v114 = (void *)objc_claimAutoreleasedReturnValue( +[CUTUnsafePromise fulfilledPromiseWithValue:]( &OBJC_CLASS___CUTUnsafePromise,  "fulfilledPromiseWithValue:",  v146));
LABEL_103:

  return v114;
}

- (BOOL)shouldForwardErrorForEncryptionType:(int64_t)a3 forceECC:(BOOL)a4
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 4 && !a4;
}

- (BOOL)_shouldAutoBugCaptureForECError:(id)a3
{
  if (a3) {
    return !-[IDSEncryptionComponent _shouldIgnoreAutoBugCaptureForECFailure:]( self,  "_shouldIgnoreAutoBugCaptureForECFailure:");
  }
  else {
    return 0;
  }
}

- (BOOL)_shouldIgnoreAutoBugCaptureForECFailure:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)_shouldDisableEncryption:(id)a3 UserDefaultKey:(id)a4
{
  id v12 = a4;
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstanceForBagType:](&OBJC_CLASS___IDSServerBag, "sharedInstanceForBagType:", 1LL));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v5]);

  if (v7)
  {
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSNumber, v8);
    if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0)
    {
      id v10 = [v7 BOOLValue];
      v11 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.ids");
      if ((_DWORD)v10 != -[NSUserDefaults BOOLForKey:](v11, "BOOLForKey:", v12)) {
        -[NSUserDefaults setBool:forKey:](v11, "setBool:forKey:", v10, v12);
      }
    }
  }
}

- (void)_shouldDisableSecondaryEncryption
{
}

- (void)_shouldDisableEchnidaEncryption
{
}

- (void).cxx_destruct
{
}

@end