@interface AAPIntentsInfoSyncHandler
- (id)_pbLocalizedProjectsForVocabularyInfoDictionary:(id)a3;
- (void)beginSyncWithAnchor:(id)a3 validity:(id)a4 count:(int64_t)a5 forKey:(id)a6 beginInfo:(id)a7;
- (void)dealloc;
- (void)getChangeAfterAnchor:(id)a3 changeInfo:(id)a4;
- (void)syncDidEnd;
@end

@implementation AAPIntentsInfoSyncHandler

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___AAPIntentsInfoSyncHandler;
  -[AAPIntentsInfoSyncHandler dealloc](&v3, "dealloc");
}

- (void)beginSyncWithAnchor:(id)a3 validity:(id)a4 count:(int64_t)a5 forKey:(id)a6 beginInfo:(id)a7
{
  if (self->_extensions) {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"AAPIntentsInfoSyncHandler.m",  59LL,  @"%@ trying to start a sync for a new key before the previous one ends!! %@",  self,  a7);
  }
  v10 = (NSString *)objc_msgSend(objc_msgSend(objc_msgSend(a7, "appMetadata"), "appIdentifyingInfo"), "bundleId");
  self->_appBundleId = v10;
  if (v10)
  {
    self->_extensions = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    id v11 = +[LSApplicationProxy applicationProxyForIdentifier:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:",  self->_appBundleId);
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    id v12 = [v11 plugInKitPlugins];
    id v13 = [v12 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v24;
      uint64_t v16 = INIntentsServiceExtensionPointName;
      do
      {
        for (i = 0LL; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v24 != v15) {
            objc_enumerationMutation(v12);
          }
          v18 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
        }

        id v14 = [v12 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }

      while (v14);
    }

    v19 = +[INAppInfo appInfoWithAppProxy:](&OBJC_CLASS___INAppInfo, "appInfoWithAppProxy:", v11);
    self->_appInfo = v19;
    if (!objc_msgSend(-[INAppInfo supportedIntents](v19, "supportedIntents"), "count"))
    {
      v20 = (os_log_s *)AFSiriLogContextPlugin;
      if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_INFO))
      {
        appBundleId = self->_appBundleId;
        *(_DWORD *)buf = 136315394;
        v28 = "-[AAPIntentsInfoSyncHandler beginSyncWithAnchor:validity:count:forKey:beginInfo:]";
        __int16 v29 = 2112;
        v30 = appBundleId;
        _os_log_impl( &dword_0,  v20,  OS_LOG_TYPE_INFO,  "%s com.apple.siri.applications: The app %@ no longer supports any intents",  buf,  0x16u);
      }

      [a7 resetWithValidity:@"IntentsInfo"];
    }
  }

  else
  {
    v22 = (os_log_s *)AFSiriLogContextPlugin;
    if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_ERROR)) {
      sub_121EC(v22);
    }
  }

- (void)getChangeAfterAnchor:(id)a3 changeInfo:(id)a4
{
  if (objc_msgSend(-[INAppInfo supportedIntents](self->_appInfo, "supportedIntents"), "count"))
  {
    id v7 = -[INAppInfo supportedIntents](self->_appInfo, "supportedIntents");
    if (![v7 count])
    {
      v8 = (os_log_s *)AFSiriLogContextPlugin;
      if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_ERROR)) {
        sub_1226C((uint64_t)self, v8);
      }
    }

    id v9 = -[INAppInfo actionsRestrictedWhileLocked](self->_appInfo, "actionsRestrictedWhileLocked");
    id v10 = -[INAppInfo supportedMediaCategories](self->_appInfo, "supportedMediaCategories");
    id v11 = objc_msgSend(-[NSMutableArray firstObject](self->_extensions, "firstObject"), "containingBundle");
    if (!v11
      || (id v12 = v11, v13 = objc_opt_class(&OBJC_CLASS___LSApplicationProxy), (objc_opt_isKindOfClass(v12, v13) & 1) == 0))
    {
      id v12 = +[LSApplicationProxy applicationProxyForIdentifier:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:",  self->_appBundleId);
    }

    id v51 = a4;
    v52 = v9;
    id v55 = a3;
    v56 = self;
    id v53 = v12;
    v54 = v10;
    if ([v12 bundleURL]) {
      id v14 = +[NSBundle bundleWithURL:](NSBundle, "bundleWithURL:", [v12 bundleURL]);
    }
    else {
      id v14 = 0LL;
    }
    uint64_t v15 = -[NSBundle localizations](v14, "localizations");
    v57 =  -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  -[NSArray count](v15, "count"));
    obj = v15;
    __int128 v75 = 0u;
    __int128 v76 = 0u;
    __int128 v77 = 0u;
    __int128 v78 = 0u;
    id v16 = -[NSArray countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v75,  v83,  16LL);
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v76;
      do
      {
        for (i = 0LL; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v76 != v18) {
            objc_enumerationMutation(obj);
          }
          uint64_t v20 = *(void *)(*((void *)&v75 + 1) + 8LL * (void)i);
          v21 = -[NSBundle URLForResource:withExtension:subdirectory:localization:]( v14,  "URLForResource:withExtension:subdirectory:localization:",  @"AppIntentVocabulary",  @"plist",  0LL,  v20);
          if (v21)
          {
            v22 =  -[NSDictionary initWithContentsOfURL:]( objc_alloc(&OBJC_CLASS___NSDictionary),  "initWithContentsOfURL:",  v21);
            if (v22) {
              -[NSMutableDictionary setObject:forKey:](v57, "setObject:forKey:", v22, v20);
            }
          }
        }

        id v17 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v75,  v83,  16LL);
      }

      while (v17);
    }

    id v23 = objc_alloc_init(&OBJC_CLASS____INPBAppBundleInfo);
    id v24 = objc_alloc_init(&OBJC_CLASS____INPBIntentSupport);
    __int128 v71 = 0u;
    __int128 v72 = 0u;
    __int128 v73 = 0u;
    __int128 v74 = 0u;
    id v25 = [v7 countByEnumeratingWithState:&v71 objects:v82 count:16];
    if (v25)
    {
      id v26 = v25;
      uint64_t v27 = *(void *)v72;
      do
      {
        for (j = 0LL; j != v26; j = (char *)j + 1)
        {
          if (*(void *)v72 != v27) {
            objc_enumerationMutation(v7);
          }
          uint64_t v29 = *(void *)(*((void *)&v71 + 1) + 8LL * (void)j);
          id v30 = objc_alloc_init(&OBJC_CLASS____INPBIntentType);
          [v30 setType:v29];
          [v24 addIntentsSupported:v30];
        }

        id v26 = [v7 countByEnumeratingWithState:&v71 objects:v82 count:16];
      }

      while (v26);
    }

    __int128 v69 = 0u;
    __int128 v70 = 0u;
    __int128 v67 = 0u;
    __int128 v68 = 0u;
    id v31 = [v52 countByEnumeratingWithState:&v67 objects:v81 count:16];
    if (v31)
    {
      id v32 = v31;
      uint64_t v33 = *(void *)v68;
      do
      {
        for (k = 0LL; k != v32; k = (char *)k + 1)
        {
          if (*(void *)v68 != v33) {
            objc_enumerationMutation(v52);
          }
          uint64_t v35 = *(void *)(*((void *)&v67 + 1) + 8LL * (void)k);
          id v36 = objc_alloc_init(&OBJC_CLASS____INPBIntentType);
          [v36 setType:v35];
          [v24 addIntentsRestrictedWhileLocked:v36];
        }

        id v32 = [v52 countByEnumeratingWithState:&v67 objects:v81 count:16];
      }

      while (v32);
    }

    __int128 v65 = 0u;
    __int128 v66 = 0u;
    __int128 v63 = 0u;
    __int128 v64 = 0u;
    id v37 = [v54 countByEnumeratingWithState:&v63 objects:v80 count:16];
    if (v37)
    {
      id v38 = v37;
      uint64_t v39 = *(void *)v64;
      do
      {
        for (m = 0LL; m != v38; m = (char *)m + 1)
        {
          if (*(void *)v64 != v39) {
            objc_enumerationMutation(v54);
          }
          [v24 addSupportedMediaCategories:*(void *)(*((void *)&v63 + 1) + 8 * (void)m)];
        }

        id v38 = [v54 countByEnumeratingWithState:&v63 objects:v80 count:16];
      }

      while (v38);
    }

    [v23 addIntentSupport:v24];
    id v41 = -[AAPIntentsInfoSyncHandler _pbLocalizedProjectsForVocabularyInfoDictionary:]( v56,  "_pbLocalizedProjectsForVocabularyInfoDictionary:",  INVocabulariesByLocaleByAddingInvocationPhrases(v57, v53, obj));
    __int128 v59 = 0u;
    __int128 v60 = 0u;
    __int128 v61 = 0u;
    __int128 v62 = 0u;
    id v42 = [v41 countByEnumeratingWithState:&v59 objects:v79 count:16];
    if (v42)
    {
      id v43 = v42;
      uint64_t v44 = *(void *)v60;
      do
      {
        for (n = 0LL; n != v43; n = (char *)n + 1)
        {
          if (*(void *)v60 != v44) {
            objc_enumerationMutation(v41);
          }
          [v23 addLocalizedProjects:*(void *)(*((void *)&v59 + 1) + 8 * (void)n)];
        }

        id v43 = [v41 countByEnumeratingWithState:&v59 objects:v79 count:16];
      }

      while (v43);
    }

    id v46 = [v23 data];
    CC_SHA1([v46 bytes], (CC_LONG)objc_msgSend(v46, "length"), md);
    v47 = +[NSMutableString stringWithCapacity:](&OBJC_CLASS___NSMutableString, "stringWithCapacity:", 40LL);
    for (uint64_t ii = 0LL; ii != 20; ++ii)
      -[NSMutableString appendFormat:](v47, "appendFormat:", @"%02x", md[ii]);
    if ((-[NSMutableString isEqualToString:](v47, "isEqualToString:", v55) & 1) != 0)
    {
      id v49 = 0LL;
    }

    else
    {
      id v50 = objc_alloc_init(&OBJC_CLASS___SAIntentGroupProtobufMessage);
      [v50 setData:v46];
      [v50 setTypeName:@"sirikit.apps.AppBundleInfo"];
      id v49 = objc_alloc_init(&OBJC_CLASS___SAIntentGroupAceAppIntentPolicyAndVocab);
      [v49 setAceAppBundleInfo:v50];
      objc_msgSend( v49,  "setIdentifier:",  +[NSURL URLWithString:](NSURL, "URLWithString:", v56->_appBundleId));
    }

    [v51 setObject:v49];
    [v51 setPostAnchor:v47];
    [v51 setIsDelete:0];
  }

  else
  {
    [a4 setObject:0];
    [a4 setIsDelete:0];
    [a4 setPostAnchor:0];
  }

- (void)syncDidEnd
{
  self->_extensions = 0LL;

  self->_appBundleId = 0LL;
  self->_appInfo = 0LL;
}

- (id)_pbLocalizedProjectsForVocabularyInfoDictionary:(id)a3
{
  id v53 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [a3 count]);
  __int128 v107 = 0u;
  __int128 v108 = 0u;
  __int128 v109 = 0u;
  __int128 v110 = 0u;
  id obj = [a3 allKeys];
  id v54 = [obj countByEnumeratingWithState:&v107 objects:v118 count:16];
  if (v54)
  {
    uint64_t v51 = *(void *)v108;
    uint64_t v50 = _INIntentTypePhrasesKey;
    uint64_t v62 = _INIntentTypeKey;
    uint64_t v61 = _INIntentVocabularyExamplesKey;
    uint64_t v49 = _INIntentSlotVocabularyPoliciesKey;
    uint64_t v59 = _INIntentSlotVocabularyValuesKey;
    uint64_t v60 = _INIntentSlotNamesKey;
    uint64_t v69 = _INIntentSlotVocabularyRequiresUserIdentificationKey;
    uint64_t v70 = _INIntentSlotVocabularyIdentifierKey;
    uint64_t v68 = _INIntentSlotVocabularySynonymsKey;
    uint64_t v78 = _INIntentSlotVocabularyPhraseKey;
    uint64_t v77 = _INIntentSlotVocabularyPronunciationKey;
    uint64_t v76 = _INIntentSlotVocabularyExamplesKey;
    do
    {
      uint64_t v3 = 0LL;
      do
      {
        if (*(void *)v108 != v51) {
          objc_enumerationMutation(obj);
        }
        uint64_t v57 = v3;
        uint64_t v4 = *(void *)(*((void *)&v107 + 1) + 8 * v3);
        context = objc_autoreleasePoolPush();
        id v5 = [a3 objectForKey:v4];
        id v6 = objc_alloc_init(&OBJC_CLASS____INPBLocalizedProject);
        id v7 = objc_alloc_init(&OBJC_CLASS____INPBLanguageTag);
        [v7 setTag:v4];
        id v55 = v6;
        [v6 setLanguage:v7];
        id v8 = objc_alloc_init(&OBJC_CLASS____INPBIntentVocabulary);
        __int128 v74 = v5;
        id v9 = objc_msgSend( v5,  "aap_arrayValueForKey:expectedContainingObjectsType:",  v50,  objc_opt_class(NSDictionary));
        __int128 v103 = 0u;
        __int128 v104 = 0u;
        __int128 v105 = 0u;
        __int128 v106 = 0u;
        id v10 = [v9 countByEnumeratingWithState:&v103 objects:v117 count:16];
        if (v10)
        {
          id v11 = v10;
          uint64_t v12 = *(void *)v104;
          do
          {
            uint64_t v13 = 0LL;
            do
            {
              if (*(void *)v104 != v12) {
                objc_enumerationMutation(v9);
              }
              id v14 = *(void **)(*((void *)&v103 + 1) + 8LL * (void)v13);
              id v15 = objc_alloc_init(&OBJC_CLASS____INPBIntentTypePhrases);
              id v16 = objc_alloc_init(&OBJC_CLASS____INPBIntentType);
              objc_msgSend(v16, "setType:", objc_msgSend(v14, "aap_stringValueForKey:", v62));
              [v15 setIntentType:v16];
              id v17 = objc_msgSend( v14,  "aap_arrayValueForKey:expectedContainingObjectsType:",  v61,  objc_opt_class(NSString));
              __int128 v99 = 0u;
              __int128 v100 = 0u;
              __int128 v101 = 0u;
              __int128 v102 = 0u;
              id v18 = [v17 countByEnumeratingWithState:&v99 objects:v116 count:16];
              if (v18)
              {
                id v19 = v18;
                uint64_t v20 = *(void *)v100;
                do
                {
                  v21 = 0LL;
                  do
                  {
                    if (*(void *)v100 != v20) {
                      objc_enumerationMutation(v17);
                    }
                    [v15 addIntentVocabularyExamples:*(void *)(*((void *)&v99 + 1) + 8 * (void)v21)];
                    v21 = (char *)v21 + 1;
                  }

                  while (v19 != v21);
                  id v19 = [v17 countByEnumeratingWithState:&v99 objects:v116 count:16];
                }

                while (v19);
              }

              [v8 addIntentTypePhrases:v15];
              uint64_t v13 = (char *)v13 + 1;
            }

            while (v13 != v11);
            id v11 = [v9 countByEnumeratingWithState:&v103 objects:v117 count:16];
          }

          while (v11);
        }

        id v22 = objc_msgSend( v74,  "aap_arrayValueForKey:expectedContainingObjectsType:",  v49,  objc_opt_class(NSDictionary));
        __int128 v95 = 0u;
        __int128 v96 = 0u;
        __int128 v97 = 0u;
        __int128 v98 = 0u;
        id v58 = v22;
        id v65 = [v22 countByEnumeratingWithState:&v95 objects:v115 count:16];
        if (v65)
        {
          uint64_t v63 = *(void *)v96;
          __int128 v64 = v8;
          do
          {
            uint64_t v23 = 0LL;
            do
            {
              if (*(void *)v96 != v63) {
                objc_enumerationMutation(v58);
              }
              uint64_t v66 = v23;
              id v24 = *(void **)(*((void *)&v95 + 1) + 8 * v23);
              id v25 = objc_alloc_init(&OBJC_CLASS____INPBIntentSlotVocabularyPolicy);
              id v26 = objc_msgSend( v24,  "aap_arrayValueForKey:expectedContainingObjectsType:",  v60,  objc_opt_class(NSString));
              __int128 v91 = 0u;
              __int128 v92 = 0u;
              __int128 v93 = 0u;
              __int128 v94 = 0u;
              id v27 = [v26 countByEnumeratingWithState:&v91 objects:v114 count:16];
              if (v27)
              {
                id v28 = v27;
                uint64_t v29 = *(void *)v92;
                do
                {
                  id v30 = 0LL;
                  do
                  {
                    if (*(void *)v92 != v29) {
                      objc_enumerationMutation(v26);
                    }
                    [v25 addIntentSlotNames:*(void *)(*((void *)&v91 + 1) + 8 * (void)v30)];
                    id v30 = (char *)v30 + 1;
                  }

                  while (v28 != v30);
                  id v28 = [v26 countByEnumeratingWithState:&v91 objects:v114 count:16];
                }

                while (v28);
              }

              id v31 = objc_msgSend( v24,  "aap_arrayValueForKey:expectedContainingObjectsType:",  v59,  objc_opt_class(NSDictionary));
              __int128 v87 = 0u;
              __int128 v88 = 0u;
              __int128 v89 = 0u;
              __int128 v90 = 0u;
              id v67 = v31;
              id v73 = [v31 countByEnumeratingWithState:&v87 objects:v113 count:16];
              if (v73)
              {
                uint64_t v71 = *(void *)v88;
                __int128 v72 = v25;
                do
                {
                  uint64_t v32 = 0LL;
                  do
                  {
                    if (*(void *)v88 != v71) {
                      objc_enumerationMutation(v67);
                    }
                    uint64_t v75 = v32;
                    uint64_t v33 = *(void **)(*((void *)&v87 + 1) + 8 * v32);
                    id v34 = objc_alloc_init(&OBJC_CLASS____INPBIntentSlotVocabularyConcept);
                    objc_msgSend(v34, "setIdentifier:", objc_msgSend(v33, "aap_stringValueForKey:", v70));
                    objc_msgSend(v34, "setRequiresUserIdentification:", objc_msgSend(v33, "aap_BOOLValueForKey:", v69));
                    id v35 = objc_msgSend( v33,  "aap_arrayValueForKey:expectedContainingObjectsType:",  v68,  objc_opt_class(NSDictionary));
                    __int128 v83 = 0u;
                    __int128 v84 = 0u;
                    __int128 v85 = 0u;
                    __int128 v86 = 0u;
                    id v36 = [v35 countByEnumeratingWithState:&v83 objects:v112 count:16];
                    if (v36)
                    {
                      id v37 = v36;
                      uint64_t v38 = *(void *)v84;
                      do
                      {
                        uint64_t v39 = 0LL;
                        do
                        {
                          if (*(void *)v84 != v38) {
                            objc_enumerationMutation(v35);
                          }
                          v40 = *(void **)(*((void *)&v83 + 1) + 8LL * (void)v39);
                          id v41 = objc_alloc_init(&OBJC_CLASS____INPBIntentSlotVocabularyValue);
                          objc_msgSend(v41, "setPhrase:", objc_msgSend(v40, "aap_stringValueForKey:", v78));
                          objc_msgSend(v41, "setPronunciation:", objc_msgSend(v40, "aap_stringValueForKey:", v77));
                          id v42 = objc_msgSend( v40,  "aap_arrayValueForKey:expectedContainingObjectsType:",  v76,  objc_opt_class(NSString));
                          __int128 v79 = 0u;
                          __int128 v80 = 0u;
                          __int128 v81 = 0u;
                          __int128 v82 = 0u;
                          id v43 = [v42 countByEnumeratingWithState:&v79 objects:v111 count:16];
                          if (v43)
                          {
                            id v44 = v43;
                            uint64_t v45 = *(void *)v80;
                            do
                            {
                              id v46 = 0LL;
                              do
                              {
                                if (*(void *)v80 != v45) {
                                  objc_enumerationMutation(v42);
                                }
                                [v41 addExamples:*(void *)(*((void *)&v79 + 1) + 8 * (void)v46)];
                                id v46 = (char *)v46 + 1;
                              }

                              while (v44 != v46);
                              id v44 = [v42 countByEnumeratingWithState:&v79 objects:v111 count:16];
                            }

                            while (v44);
                          }

                          [v34 addSynonyms:v41];
                          uint64_t v39 = (char *)v39 + 1;
                        }

                        while (v39 != v37);
                        id v37 = [v35 countByEnumeratingWithState:&v83 objects:v112 count:16];
                      }

                      while (v37);
                    }

                    id v25 = v72;
                    [v72 addIntentSlotVocabularyConcepts:v34];
                    uint64_t v32 = v75 + 1;
                  }

                  while ((id)(v75 + 1) != v73);
                  id v73 = [v67 countByEnumeratingWithState:&v87 objects:v113 count:16];
                }

                while (v73);
              }

              id v8 = v64;
              [v64 addIntentSlotVocabularyPolicies:v25];
              uint64_t v23 = v66 + 1;
            }

            while ((id)(v66 + 1) != v65);
            id v65 = [v58 countByEnumeratingWithState:&v95 objects:v115 count:16];
          }

          while (v65);
        }

        [v55 setIntentVocabulary:v8];
        -[NSMutableArray addObject:](v53, "addObject:", v55);
        objc_autoreleasePoolPop(context);
        uint64_t v3 = v57 + 1;
      }

      while ((id)(v57 + 1) != v54);
      id v54 = [obj countByEnumeratingWithState:&v107 objects:v118 count:16];
    }

    while (v54);
  }

  return v53;
}

@end