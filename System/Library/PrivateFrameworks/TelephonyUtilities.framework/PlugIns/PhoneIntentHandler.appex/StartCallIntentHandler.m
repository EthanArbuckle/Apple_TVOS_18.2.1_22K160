@interface StartCallIntentHandler
- (AppResolving)appResolver;
- (BOOL)anyContactsHaveSameName:(id)a3;
- (BOOL)haveAlreadyConfirmedRecipient:(id)a3;
- (BOOL)intentHasUnresolvedLocalEmergencyContact:(id)a3;
- (BOOL)isChinaSKUDevice;
- (BOOL)isEmergencyCall:(id)a3;
- (BOOL)isEmergencyHandle:(id)a3;
- (BOOL)isFaceTimeInvitationEnabled;
- (BOOL)isFaceTimeNoFanOutEnabled;
- (BOOL)isGFTDisabledForChinaSKU:(id)a3;
- (BOOL)isUnresolvedLocalEmergencyContact:(id)a3;
- (BOOL)requireScoreBasedResolutionForGFT:(unint64_t)a3 numberOfContactsCount:(unint64_t)a4;
- (BOOL)shouldForceAudioOnlyWithIdiom:(int64_t)a3 withDisplayDisabled:(BOOL)a4;
- (BOOL)shouldInferAudioCapabilityForRequestedCallCapability:(int64_t)a3 idiom:(int64_t)a4 isDisplayDisabled:(BOOL)a5;
- (BOOL)shouldRequireInvalidNumberConfirmationForRecipient:(id)a3;
- (BOOL)shouldRequireUnknownRecipientConfirmationForRequestedRecipient:(id)a3 resolvedToRecipient:(id)a4 contact:(id)a5;
- (FaceTimeUtilities)faceTimeUtilities;
- (IntentHandlerCoreAnalyticsLogging)coreAnalyticsLogger;
- (IntentHandlerFeatureFlags)featureFlags;
- (NSCache)identifierToContactCache;
- (NSMutableOrderedSet)contactIdentifiersConfirmed;
- (NSMutableOrderedSet)handlesConfirmed;
- (StartCallIntentHandler)init;
- (StartCallIntentHandler)initWithFeatureFlags:(id)a3;
- (StartCallIntentHandler)initWithFeatureFlags:(id)a3 faceTimeUtilities:(id)a4;
- (StartCallIntentHandlerDataSource)dataSource;
- (id)_applyImpliedFilterToPhoneNumberOnlyMatchesIfApplicableForPersonsByContact:(id)a3 requestedHandleType:(int64_t)a4 preferredCallProvider:(int64_t)a5;
- (id)_inPersonsFromContact:(id)a3 withRequestedType:(int64_t)a4 requestedLabel:(id)a5 isoCountryCodes:(id)a6;
- (id)allCountryCodesRelevantToCall:(id)a3;
- (id)callRecordForRecentCall:(id)a3;
- (id)emergencyTypeToString:(int64_t)a3;
- (id)generateAdditionalMatchingHandles:(id)a3 resolvedContacts:(id)a4 requestedHandleType:(int64_t)a5 requestedHandleLabel:(id)a6;
- (id)getAlternativesForContact:(id)a3 forRequestedHandleType:(int64_t)a4 forCallProvider:(int64_t)a5;
- (id)globalEmergencyNumbers;
- (id)localizedEmergencyString:(id)a3;
- (id)personResolutionResultsForIntent:(id)a3;
- (id)recentCallRecordToRedialForIntent:(id)a3;
- (id)recentCallToRedialForQuery:(id)a3;
- (id)recentCallsWithHandles:(id)a3 telephonyOnly:(BOOL)a4;
- (id)relayCRRRecommendationForPerson:(id)a3 intent:(id)a4;
- (id)resolutionResultForCallCapability:(int64_t)a3 idiom:(int64_t)a4 withDisplayDisabled:(BOOL)a5;
- (id)resolutionResultForEmergency;
- (id)resolutionResultForPersonWithResolvedContactName:(id)a3 resolvedPerson:(id)a4 resolvedContact:(id)a5 contactIdentifiersRequiringConfirmation:(id)a6;
- (id)resolutionResultForPersonWithResolvedHandleValue:(id)a3;
- (id)resolveContactsFromCallGroups:(id)a3;
- (id)resolvePreferredContactFromContacts:(id)a3;
- (id)resolvePreferredHandleFromHandles:(id)a3 contactIdentifiersRequiringConfirmation:(id)a4 telephonyOnly:(BOOL)a5;
- (id)responseForDialRequest:(id)a3 intent:(id)a4;
- (id)responseForJoinRequest:(id)a3 intent:(id)a4 callProvider:(id)a5;
- (int64_t)callCapabilityFromRecentCall:(id)a3;
- (int64_t)inferCallCapabilityForPreferredCallProvider:(int64_t)a3 recentCall:(id)a4 initialCallCapability:(int64_t)a5 idiom:(int64_t)a6 isDisplayDisabled:(BOOL)a7 executionContext:(int64_t)a8;
- (void)confirmStartCall:(id)a3 completion:(id)a4;
- (void)extractHandlesFromIntent:(id)a3 faceTimeMemberHandles:(id)a4 nonFaceTimeMemberHandles:(id)a5;
- (void)handleStartCall:(id)a3 completion:(id)a4;
- (void)parseEmergencyContacts:(id)a3 usingExistingResult:(id)a4;
- (void)resolveCallCapabilityForStartCall:(id)a3 withCompletion:(id)a4;
- (void)resolveCallRecordToCallBackForStartCall:(id)a3 withCompletion:(id)a4;
- (void)resolveContactsForStartCall:(id)a3 withCompletion:(id)a4;
- (void)resolveDestinationTypeForStartCall:(id)a3 withCompletion:(id)a4;
- (void)resolveFaceTimeLinkForStartCall:(id)a3 withCompletion:(id)a4;
- (void)resolvePreferredCallProviderForStartCall:(id)a3 withCompletion:(id)a4;
- (void)setAppResolver:(id)a3;
- (void)setContactIdentifiersConfirmed:(id)a3;
- (void)setCoreAnalyticsLogger:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setFaceTimeUtilities:(id)a3;
- (void)setFeatureFlags:(id)a3;
- (void)setHandlesConfirmed:(id)a3;
- (void)sortFaceTimeHandles:(id)a3 faceTimeHandles:(id)a4 nonFaceTimeHandles:(id)a5;
- (void)updateHandlerStateForContactResolutionResults:(id)a3;
- (void)updateScoreBasedContactResolver:(id)a3 forFavoritesAmongContacts:(id)a4;
- (void)updateScoreBasedContactResolver:(id)a3 forRecentCallsMatchingContacts:(id)a4;
- (void)updateScoreBasedHandleResolver:(id)a3 forFavoritesAmongHandles:(id)a4;
- (void)updateScoreBasedHandleResolver:(id)a3 forRecentCallsMatchingHandles:(id)a4 telephonyOnly:(BOOL)a5;
@end

@implementation StartCallIntentHandler

- (StartCallIntentHandler)init
{
  v3 = objc_alloc_init(&OBJC_CLASS___IntentHandlerFeatureFlags);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[FaceTimeUtilities sharedInstance](&OBJC_CLASS___FaceTimeUtilities, "sharedInstance"));
  v5 = -[StartCallIntentHandler initWithFeatureFlags:faceTimeUtilities:]( self,  "initWithFeatureFlags:faceTimeUtilities:",  v3,  v4);

  return v5;
}

- (StartCallIntentHandler)initWithFeatureFlags:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FaceTimeUtilities sharedInstance](&OBJC_CLASS___FaceTimeUtilities, "sharedInstance"));
  v6 = -[StartCallIntentHandler initWithFeatureFlags:faceTimeUtilities:]( self,  "initWithFeatureFlags:faceTimeUtilities:",  v4,  v5);

  return v6;
}

- (StartCallIntentHandler)initWithFeatureFlags:(id)a3 faceTimeUtilities:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___StartCallIntentHandler;
  v9 = -[StartCallIntentHandler init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_featureFlags, a3);
    objc_storeStrong((id *)&v10->_faceTimeUtilities, a4);
  }

  return v10;
}

- (StartCallIntentHandlerDataSource)dataSource
{
  dataSource = self->_dataSource;
  if (!dataSource)
  {
    id v4 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.TelephonyUtilities.PhoneIntentHandler.%@",  objc_opt_class(self));
    id v5 = objc_claimAutoreleasedReturnValue(v4);
    dispatch_queue_t v6 = dispatch_queue_create((const char *)[v5 UTF8String], 0);

    id v7 = -[StartCallIntentHandlerDataSource initWithDispatchQueue:featureFlags:]( objc_alloc(&OBJC_CLASS___StartCallIntentHandlerDataSource),  "initWithDispatchQueue:featureFlags:",  v6,  self->_featureFlags);
    id v8 = self->_dataSource;
    self->_dataSource = v7;

    dataSource = self->_dataSource;
  }

  return dataSource;
}

- (NSCache)identifierToContactCache
{
  identifierToContactCache = self->_identifierToContactCache;
  if (!identifierToContactCache)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___NSCache);
    id v5 = self->_identifierToContactCache;
    self->_identifierToContactCache = v4;

    identifierToContactCache = self->_identifierToContactCache;
  }

  return identifierToContactCache;
}

- (IntentHandlerCoreAnalyticsLogging)coreAnalyticsLogger
{
  coreAnalyticsLogger = self->_coreAnalyticsLogger;
  if (!coreAnalyticsLogger)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___IntentHandlerCoreAnalyticsLogger);
    id v5 = self->_coreAnalyticsLogger;
    self->_coreAnalyticsLogger = (IntentHandlerCoreAnalyticsLogging *)v4;

    coreAnalyticsLogger = self->_coreAnalyticsLogger;
  }

  return coreAnalyticsLogger;
}

- (AppResolving)appResolver
{
  appResolver = self->_appResolver;
  if (!appResolver)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___AppResolver);
    id v5 = self->_appResolver;
    self->_appResolver = (AppResolving *)v4;

    appResolver = self->_appResolver;
  }

  return appResolver;
}

- (BOOL)isChinaSKUDevice
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
  unsigned __int8 v3 = [v2 isGreenTea];

  return v3;
}

- (BOOL)isFaceTimeNoFanOutEnabled
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler featureFlags](self, "featureFlags"));
  unsigned int v4 = [v3 faceTimeNoFanOutEnabled];

  if (v4)
  {
    id v5 = IntentHandlerDefaultLog();
    dispatch_queue_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Facetime No Fan Out is true", v10, 2u);
    }
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler featureFlags](self, "featureFlags"));
  unsigned __int8 v8 = [v7 faceTimeNoFanOutEnabled];

  return v8;
}

- (BOOL)isFaceTimeInvitationEnabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler featureFlags](self, "featureFlags"));
  unsigned __int8 v3 = [v2 faceTimeInvitationEnabled];

  return v3;
}

- (void)handleStartCall:(id)a3 completion:(id)a4
{
  id v5 = a3;
  dispatch_queue_t v6 = (void (**)(id, id))a4;
  id v7 = IntentHandlerDefaultLog();
  unsigned __int8 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  id v10 = IntentHandlerDefaultLog();
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  objc_super v12 = v11;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    LOWORD(v19) = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v12,  OS_SIGNPOST_INTERVAL_BEGIN,  v9,  "handleStartCall",  " enableTelemetry=YES ",  (uint8_t *)&v19,  2u);
  }

  id v13 = IntentHandlerDefaultLog();
  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412290;
    id v20 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Handling start call intent: %@",  (uint8_t *)&v19,  0xCu);
  }

  v15 = -[INStartCallIntentResponse initWithCode:userActivity:]( objc_alloc(&OBJC_CLASS___INStartCallIntentResponse),  "initWithCode:userActivity:",  2LL,  0LL);
  id v16 = IntentHandlerDefaultLog();
  v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  v18 = v17;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    LOWORD(v19) = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v18,  OS_SIGNPOST_INTERVAL_END,  v9,  "handleStartCall",  (const char *)&unk_1000275CF,  (uint8_t *)&v19,  2u);
  }

  v6[2](v6, v15);
}

- (void)sortFaceTimeHandles:(id)a3 faceTimeHandles:(id)a4 nonFaceTimeHandles:(id)a5
{
  id v8 = a3;
  id v25 = a4;
  id v24 = a5;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id v9 = [v8 countByEnumeratingWithState:&v26 objects:v33 count:16];
  if (v9)
  {
    id v11 = v9;
    uint64_t v12 = *(void *)v27;
    *(void *)&__int128 v10 = 138412290LL;
    __int128 v23 = v10;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void *)(*((void *)&v26 + 1) + 8LL * (void)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler faceTimeUtilities](self, "faceTimeUtilities", v23));
        uint64_t v32 = v14;
        id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v32, 1LL));
        unsigned int v17 = [v15 isFaceTimeable:v16];

        id v18 = IntentHandlerDefaultLog();
        int v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
        BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
        if (v17)
        {
          if (v20)
          {
            *(_DWORD *)buf = v23;
            uint64_t v31 = v14;
            _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "found a FaceTimeable personHandle: %@",  buf,  0xCu);
          }

          v21 = (void *)objc_claimAutoreleasedReturnValue( +[TUHandle normalizedHandleWithDestinationID:]( &OBJC_CLASS___TUHandle,  "normalizedHandleWithDestinationID:",  v14));
          v22 = v25;
        }

        else
        {
          if (v20)
          {
            *(_DWORD *)buf = v23;
            uint64_t v31 = v14;
            _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "found a non-FaceTimeable personHandle: %@",  buf,  0xCu);
          }

          v21 = (void *)objc_claimAutoreleasedReturnValue( +[TUHandle normalizedHandleWithDestinationID:]( &OBJC_CLASS___TUHandle,  "normalizedHandleWithDestinationID:",  v14));
          v22 = v24;
        }

        [v22 addObject:v21];
      }

      id v11 = [v8 countByEnumeratingWithState:&v26 objects:v33 count:16];
    }

    while (v11);
  }
}

- (void)extractHandlesFromIntent:(id)a3 faceTimeMemberHandles:(id)a4 nonFaceTimeMemberHandles:(id)a5
{
  id v7 = a3;
  id v39 = a4;
  id v38 = a5;
  id v8 = IntentHandlerDefaultLog();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v7 contacts]);
    *(_DWORD *)buf = 138412290;
    id v45 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Extracting Handles From Intent: %@", buf, 0xCu);
  }

  v36 = v7;
  v37 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 contacts]);
  id v12 = [v11 countByEnumeratingWithState:&v40 objects:v48 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v41;
    do
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v41 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v40 + 1) + 8LL * (void)i);
        unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue([v16 personHandle]);
        id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 value]);
        id v19 = [v18 length];

        if (v19)
        {
          id v20 = IntentHandlerDefaultLog();
          v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            v22 = (void *)objc_claimAutoreleasedReturnValue([v16 personHandle]);
            id v23 = [v22 faceTimeType];
            *(_DWORD *)buf = 134218242;
            id v45 = v23;
            __int16 v46 = 2112;
            v47 = v16;
            _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "faceTimeType is %ld for %@",  buf,  0x16u);
          }

          id v24 = (void *)objc_claimAutoreleasedReturnValue([v16 personHandle]);
          id v25 = [v24 faceTimeType];

          if (v25 == (id)2)
          {
            __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v16 personHandle]);
            __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v26 value]);
            __int128 v28 = (void *)objc_claimAutoreleasedReturnValue( +[TUHandle normalizedHandleWithDestinationID:]( &OBJC_CLASS___TUHandle,  "normalizedHandleWithDestinationID:",  v27));
            __int128 v29 = v38;
          }

          else
          {
            if (v25 != (id)1)
            {
              if (v25) {
                continue;
              }
              __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v16 personHandle]);
              __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v26 value]);
              -[NSMutableArray addObject:](v37, "addObject:", v27);
              goto LABEL_18;
            }

            __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v16 personHandle]);
            __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v26 value]);
            __int128 v28 = (void *)objc_claimAutoreleasedReturnValue( +[TUHandle normalizedHandleWithDestinationID:]( &OBJC_CLASS___TUHandle,  "normalizedHandleWithDestinationID:",  v27));
            __int128 v29 = v39;
          }

          [v29 addObject:v28];

LABEL_18:
          continue;
        }
      }

      id v13 = [v11 countByEnumeratingWithState:&v40 objects:v48 count:16];
    }

    while (v13);
  }

  if (-[NSMutableArray count](v37, "count"))
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler faceTimeUtilities](self, "faceTimeUtilities"));
    [v30 runIDSQueryForStartCallIntent:v37];

    uint64_t v32 = v38;
    uint64_t v31 = v39;
    -[StartCallIntentHandler sortFaceTimeHandles:faceTimeHandles:nonFaceTimeHandles:]( self,  "sortFaceTimeHandles:faceTimeHandles:nonFaceTimeHandles:",  v37,  v39,  v38);
  }

  else
  {
    id v33 = IntentHandlerDefaultLog();
    v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    uint64_t v32 = v38;
    uint64_t v31 = v39;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "Skipping IDS query lookup as all handles have been resolved.",  buf,  2u);
    }
  }
}

- (id)responseForDialRequest:(id)a3 intent:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = IntentHandlerDefaultLog();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  id v10 = IntentHandlerDefaultLog();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  id v12 = v11;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    LOWORD(v17) = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v12,  OS_SIGNPOST_INTERVAL_BEGIN,  v9,  "responseForDialRequest",  (const char *)&unk_1000275CF,  (uint8_t *)&v17,  2u);
  }

  id v13 = IntentHandlerDefaultLog();
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412290;
    id v18 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Determining response for dial request: %@",  (uint8_t *)&v17,  0xCu);
  }

  if ([v6 preferredCallProvider] == (id)3 && objc_msgSend(v6, "destinationType") != (id)4) {
    [v6 destinationType];
  }
  v15 = -[INStartCallIntentResponse initWithCode:userActivity:]( objc_alloc(&OBJC_CLASS___INStartCallIntentResponse),  "initWithCode:userActivity:",  2LL,  0LL);

  return v15;
}

- (id)responseForJoinRequest:(id)a3 intent:(id)a4 callProvider:(id)a5
{
  id v5 = a3;
  id v6 = IntentHandlerDefaultLog();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  os_signpost_id_t v8 = os_signpost_id_generate(v7);

  id v9 = IntentHandlerDefaultLog();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  id v11 = v10;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(v16) = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v11,  OS_SIGNPOST_INTERVAL_BEGIN,  v8,  "responseForJoinRequest",  (const char *)&unk_1000275CF,  (uint8_t *)&v16,  2u);
  }

  id v12 = IntentHandlerDefaultLog();
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412290;
    id v17 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Determining response for join request: %@",  (uint8_t *)&v16,  0xCu);
  }

  uint64_t v14 = -[INStartCallIntentResponse initWithCode:userActivity:]( objc_alloc(&OBJC_CLASS___INStartCallIntentResponse),  "initWithCode:userActivity:",  2LL,  0LL);
  return v14;
}

- (BOOL)isEmergencyCall:(id)a3
{
  id v4 = a3;
  if ([v4 destinationType] == (id)2) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = -[StartCallIntentHandler intentHasUnresolvedLocalEmergencyContact:]( self,  "intentHasUnresolvedLocalEmergencyContact:",  v4);
  }

  return v5;
}

- (void)confirmStartCall:(id)a3 completion:(id)a4
{
  id v7 = (INStartCallIntentResponse *)a3;
  os_signpost_id_t v8 = (void (**)(id, INStartCallIntentResponse *))a4;
  id v9 = IntentHandlerDefaultLog();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  os_signpost_id_t v11 = os_signpost_id_generate(v10);

  id v12 = IntentHandlerDefaultLog();
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  uint64_t v14 = v13;
  unint64_t v15 = v11 - 1;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v14,  OS_SIGNPOST_INTERVAL_BEGIN,  v11,  "confirmStartCall",  (const char *)&unk_1000275CF,  buf,  2u);
  }

  id v16 = IntentHandlerDefaultLog();
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  id v18 = &off_100026000;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v59 = v7;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Confirm start audio call: %@", buf, 0xCu);
  }

  if (-[INStartCallIntentResponse preferredCallProvider](v7, "preferredCallProvider") != (id)2)
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler dataSource](self, "dataSource"));
    if ([v19 isAirplaneModeEnabled])
    {
      unsigned int v20 = -[StartCallIntentHandler isEmergencyCall:](self, "isEmergencyCall:", v7);
      if (v20)
      {
        id v4 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler dataSource](self, "dataSource"));
        if (([v4 canAttemptEmergencyCallsWithoutCellularConnection] & 1) == 0)
        {

LABEL_37:
          id v48 = IntentHandlerDefaultLog();
          v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG)) {
            sub_1000205C0();
          }

          __int16 v46 = objc_alloc(&OBJC_CLASS___INStartCallIntentResponse);
          uint64_t v47 = 8LL;
          goto LABEL_40;
        }
      }

      v21 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler dataSource](self, "dataSource"));
      unsigned __int8 v22 = [v21 canAttemptTelephonyCallsWithoutCellularConnection];

      if (v20) {
      id v18 = &off_100026000;
      }
      if ((v22 & 1) == 0) {
        goto LABEL_37;
      }
    }

    else
    {
    }
  }

  if (-[StartCallIntentHandler intentHasUnresolvedLocalEmergencyContact:]( self,  "intentHasUnresolvedLocalEmergencyContact:",  v7))
  {
    id v23 = IntentHandlerDefaultLog();
    id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v25 = "Even though destinationType is normal, user specifically asked for a emergency number";
LABEL_33:
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, v25, buf, 2u);
      goto LABEL_34;
    }

    goto LABEL_34;
  }

  if (-[INStartCallIntentResponse destinationType](v7, "destinationType") != (id)4
    && -[INStartCallIntentResponse destinationType](v7, "destinationType") != (id)5
    || (__int128 v26 = (void *)objc_claimAutoreleasedReturnValue(-[INStartCallIntentResponse contacts](v7, "contacts")),
        id v27 = [v26 count],
        v26,
        v27 != (id)1))
  {
    if (-[INStartCallIntentResponse destinationType](v7, "destinationType") != (id)2)
    {
      __int16 v46 = objc_alloc(&OBJC_CLASS___INStartCallIntentResponse);
      uint64_t v47 = 1LL;
LABEL_40:
      v44 = -[INStartCallIntentResponse initWithCode:userActivity:](v46, "initWithCode:userActivity:", v47, 0LL);
      __int128 v42 = v44;
      id v45 = &__kCFBooleanFalse;
      goto LABEL_41;
    }

    id v43 = IntentHandlerDefaultLog();
    id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v25 = "Making an emergency call, sending UserConfirmationRequired with emergency flag = YES";
      goto LABEL_33;
    }

- (void)resolveCallRecordToCallBackForStartCall:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = IntentHandlerDefaultLog();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 138412290;
    id v26 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Resolving callRecordToCallBack for start call: %@",  (uint8_t *)&v25,  0xCu);
  }

  id v10 = IntentHandlerDefaultLog();
  os_signpost_id_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  os_signpost_id_t v12 = os_signpost_id_generate(v11);

  id v13 = IntentHandlerDefaultLog();
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  unint64_t v15 = v14;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    LOWORD(v25) = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v15,  OS_SIGNPOST_INTERVAL_BEGIN,  v12,  "resolveCallRecordToCallBack",  (const char *)&unk_1000275CF,  (uint8_t *)&v25,  2u);
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue([v6 callRecordFilter]);
  if (v16)
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue( -[StartCallIntentHandler recentCallRecordToRedialForIntent:]( self,  "recentCallRecordToRedialForIntent:",  v6));
    if (v17) {
      uint64_t v18 = objc_claimAutoreleasedReturnValue( +[INStartCallCallRecordToCallBackResolutionResult successWithResolvedCallRecord:]( &OBJC_CLASS___INStartCallCallRecordToCallBackResolutionResult,  "successWithResolvedCallRecord:",  v17));
    }
    else {
      uint64_t v18 = objc_claimAutoreleasedReturnValue( +[INStartCallCallRecordToCallBackResolutionResult unsupportedForReason:]( &OBJC_CLASS___INStartCallCallRecordToCallBackResolutionResult,  "unsupportedForReason:",  1LL));
    }
    id v19 = (void *)v18;
  }

  else
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue( +[INStartCallCallRecordToCallBackResolutionResult notRequired]( &OBJC_CLASS___INStartCallCallRecordToCallBackResolutionResult,  "notRequired"));
  }

  id v20 = IntentHandlerDefaultLog();
  v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 138412290;
    id v26 = v19;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Calling completion block with result: %@",  (uint8_t *)&v25,  0xCu);
  }

  id v22 = IntentHandlerDefaultLog();
  id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  id v24 = v23;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    LOWORD(v25) = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v24,  OS_SIGNPOST_INTERVAL_END,  v12,  "resolveCallRecordToCallBack",  (const char *)&unk_1000275CF,  (uint8_t *)&v25,  2u);
  }

  v7[2](v7, v19);
}

- (void)resolveDestinationTypeForStartCall:(id)a3 withCompletion:(id)a4
{
  id v6 = (os_log_s *)a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = IntentHandlerDefaultLog();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  os_signpost_id_t v10 = os_signpost_id_generate(v9);

  id v11 = IntentHandlerDefaultLog();
  os_signpost_id_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  id v13 = v12;
  unint64_t v14 = v10 - 1;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    LOWORD(v39) = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v13,  OS_SIGNPOST_INTERVAL_BEGIN,  v10,  "resolveDestinationType",  (const char *)&unk_1000275CF,  (uint8_t *)&v39,  2u);
  }

  id v15 = IntentHandlerDefaultLog();
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v39 = 138412290;
    __int128 v40 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Resolve destination type for start call: %@",  (uint8_t *)&v39,  0xCu);
  }

  id v17 = &_sSS10FoundationE36_unconditionallyBridgeFromObjectiveCySSSo8NSStringCSgFZ_ptr;
  if (-[os_log_s destinationType](v6, "destinationType")) {
    uint64_t v18 = objc_claimAutoreleasedReturnValue( +[INCallDestinationTypeResolutionResult successWithResolvedCallDestinationType:]( &OBJC_CLASS___INCallDestinationTypeResolutionResult,  "successWithResolvedCallDestinationType:",  -[os_log_s destinationType](v6, "destinationType")));
  }
  else {
    uint64_t v18 = objc_claimAutoreleasedReturnValue( +[INCallDestinationTypeResolutionResult notRequired]( &OBJC_CLASS___INCallDestinationTypeResolutionResult,  "notRequired"));
  }
  id v19 = (os_log_s *)v18;
  id v20 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s contacts](v6, "contacts"));
  if ([v20 count] != (id)1 || -[os_log_s destinationType](v6, "destinationType") == (id)4)
  {
    v21 = 0LL;
LABEL_12:

    goto LABEL_13;
  }

  id v35 = -[os_log_s destinationType](v6, "destinationType");

  if (v35 != (id)5)
  {
    id v20 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s contacts](v6, "contacts"));
    os_signpost_id_t v36 = v10;
    v37 = (void *)objc_claimAutoreleasedReturnValue([v20 firstObject]);
    unsigned int v38 = (void *)objc_claimAutoreleasedReturnValue([v37 personHandle]);
    v21 = (void *)objc_claimAutoreleasedReturnValue([v38 value]);

    os_signpost_id_t v10 = v36;
    id v17 = &_sSS10FoundationE36_unconditionallyBridgeFromObjectiveCySSSo8NSStringCSgFZ_ptr;
    goto LABEL_12;
  }

  v21 = 0LL;
LABEL_13:
  if (![v21 length])
  {
    id v26 = IntentHandlerDefaultLog();
    id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    LOWORD(v39) = 0;
    id v27 = "Could not determine if handle to dial is an emergency handle because handle has not yet been resolved";
    __int128 v28 = v24;
    uint32_t v29 = 2;
LABEL_22:
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, v27, (uint8_t *)&v39, v29);
    goto LABEL_23;
  }

  unsigned int v22 = -[StartCallIntentHandler isEmergencyHandle:](self, "isEmergencyHandle:", v21);
  id v23 = IntentHandlerDefaultLog();
  id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
  if (!v22)
  {
    if (!v25) {
      goto LABEL_23;
    }
    int v39 = 138412290;
    __int128 v40 = (os_log_s *)v21;
    id v27 = "%@ is not an emergency handle. Do not need special resolving.";
    __int128 v28 = v24;
    uint32_t v29 = 12;
    goto LABEL_22;
  }

  if (v25)
  {
    int v39 = 138412290;
    __int128 v40 = (os_log_s *)v21;
    _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "%@ is an emergency handle. Resolving to an emergency call",  (uint8_t *)&v39,  0xCu);
  }

  id v24 = v19;
  id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue([v17[37] successWithResolvedCallDestinationType:2]);
LABEL_23:

  id v30 = IntentHandlerDefaultLog();
  uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    int v39 = 138412290;
    __int128 v40 = v19;
    _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "Calling completion block with result: %@",  (uint8_t *)&v39,  0xCu);
  }

  id v32 = IntentHandlerDefaultLog();
  uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
  v34 = v33;
  if (v14 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
  {
    LOWORD(v39) = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v34,  OS_SIGNPOST_INTERVAL_END,  v10,  "resolveDestinationType",  (const char *)&unk_1000275CF,  (uint8_t *)&v39,  2u);
  }

  v7[2](v7, v19);
}

- (id)resolutionResultForEmergency
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler dataSource](self, "dataSource"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 siriEmergencyServices]);

  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v3 count]));
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v32;
    do
    {
      id v8 = 0LL;
      do
      {
        id v9 = v4;
        if (*(void *)v32 != v7) {
          objc_enumerationMutation(obj);
        }
        os_signpost_id_t v10 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)v8);
        id v11 = objc_alloc(&OBJC_CLASS___INPerson);
        os_signpost_id_t v12 = objc_alloc(&OBJC_CLASS___INPersonHandle);
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 handle]);
        unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 value]);
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v10 label]);
        id v16 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler localizedEmergencyString:](self, "localizedEmergencyString:", v15));
        id v17 = -[INPersonHandle initWithValue:type:label:emergencyType:]( v12,  "initWithValue:type:label:emergencyType:",  v14,  2LL,  v16,  1LL);
        uint64_t v18 = -[INPerson initWithPersonHandle:nameComponents:displayName:image:contactIdentifier:customIdentifier:]( v11,  "initWithPersonHandle:nameComponents:displayName:image:contactIdentifier:customIdentifier:",  v17,  0LL,  0LL,  0LL,  0LL,  0LL);

        id v4 = v9;
        [v9 addObject:v18];

        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [obj countByEnumeratingWithState:&v31 objects:v37 count:16];
    }

    while (v6);
  }

  if ((unint64_t)[v4 count] >= 2)
  {
    id v19 = IntentHandlerDefaultLog();
    id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      os_signpost_id_t v36 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "There are more than one number that could be dialed. Prompting to disambiguate between them using these people: %@",  buf,  0xCu);
    }

    uint64_t v21 = objc_claimAutoreleasedReturnValue( +[INStartCallContactResolutionResult resolutionResultDisambiguationWithItemsToDisambiguate:]( &OBJC_CLASS___INStartCallContactResolutionResult,  "resolutionResultDisambiguationWithItemsToDisambiguate:",  v4));
LABEL_19:
    id v27 = (void *)v21;
    goto LABEL_20;
  }

  id v22 = [v4 count];
  id v23 = IntentHandlerDefaultLog();
  id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
  if (v22 != (id)1)
  {
    if (v25)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "[WARN] User asked to call emergency services. Emergency provider does not have multiple handles, and call can be completed without specifying one. Returning not required.",  buf,  2u);
    }

    uint64_t v21 = objc_claimAutoreleasedReturnValue( +[INStartCallContactResolutionResult notRequired]( &OBJC_CLASS___INStartCallContactResolutionResult,  "notRequired"));
    goto LABEL_19;
  }

  if (v25)
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Only a single emergency number to call. Resolving to that number.",  buf,  2u);
  }

  id v26 = (void *)objc_claimAutoreleasedReturnValue([v4 firstObject]);
  id v27 = (void *)objc_claimAutoreleasedReturnValue( +[INStartCallContactResolutionResult successWithResolvedPerson:]( &OBJC_CLASS___INStartCallContactResolutionResult,  "successWithResolvedPerson:",  v26));

LABEL_20:
  return v27;
}

- (void)resolveContactsForStartCall:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, id))a4;
  id v8 = IntentHandlerDefaultLog();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  os_signpost_id_t v10 = os_signpost_id_generate(v9);

  id v11 = IntentHandlerDefaultLog();
  os_signpost_id_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  id v13 = v12;
  unint64_t v14 = v10 - 1;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v13,  OS_SIGNPOST_INTERVAL_BEGIN,  v10,  "resolveContacts",  " enableTelemetry=YES ",  buf,  2u);
  }

  id v15 = IntentHandlerDefaultLog();
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v116 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Resolving contacts for start call intent: %@",  buf,  0xCu);
  }

  if (!-[StartCallIntentHandler intentHasUnresolvedLocalEmergencyContact:]( self,  "intentHasUnresolvedLocalEmergencyContact:",  v6)) {
    goto LABEL_27;
  }
  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler dataSource](self, "dataSource"));
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 providerManager]);
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 emergencyProvider]);
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 emergencyLabeledHandles]);
  id v21 = [v20 count];

  BOOL v22 = (unint64_t)v21 >= 2;
  unint64_t v14 = v10 - 1;
  if (!v22)
  {
LABEL_27:
    switch((unint64_t)[v6 destinationType])
    {
      case 0uLL:
      case 1uLL:
        id v34 = (id)objc_claimAutoreleasedReturnValue( -[StartCallIntentHandler personResolutionResultsForIntent:]( self,  "personResolutionResultsForIntent:",  v6));
        goto LABEL_71;
      case 2uLL:
        unint64_t v94 = v14;
        id v56 = IntentHandlerDefaultLog();
        v57 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);
        if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v57,  OS_LOG_TYPE_DEFAULT,  "Resolution for emergency destination",  buf,  2u);
        }

        v58 = (void *)objc_claimAutoreleasedReturnValue([v6 contacts]);
        v59 = (void *)objc_claimAutoreleasedReturnValue([v58 firstObject]);
        v60 = (void *)objc_claimAutoreleasedReturnValue([v59 personHandle]);
        v61 = (void *)objc_claimAutoreleasedReturnValue([v60 value]);
        id v62 = [v61 length];

        id v63 = IntentHandlerDefaultLog();
        v64 = (os_log_s *)objc_claimAutoreleasedReturnValue(v63);
        BOOL v65 = os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT);
        if (v62)
        {
          v66 = v7;
          if (v65)
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v64,  OS_LOG_TYPE_DEFAULT,  "Intent's contact has a personHandle.value set on an emergency call. Resolving to that value.",  buf,  2u);
          }

          v67 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
          __int128 v99 = 0u;
          __int128 v100 = 0u;
          __int128 v101 = 0u;
          __int128 v102 = 0u;
          v68 = (void *)objc_claimAutoreleasedReturnValue([v6 contacts]);
          id v69 = [v68 countByEnumeratingWithState:&v99 objects:v111 count:16];
          if (v69)
          {
            id v70 = v69;
            uint64_t v71 = *(void *)v100;
            do
            {
              for (i = 0LL; i != v70; i = (char *)i + 1)
              {
                if (*(void *)v100 != v71) {
                  objc_enumerationMutation(v68);
                }
                v73 = (void *)objc_claimAutoreleasedReturnValue( +[INPersonResolutionResult successWithResolvedPerson:]( &OBJC_CLASS___INPersonResolutionResult,  "successWithResolvedPerson:",  *(void *)(*((void *)&v99 + 1) + 8LL * (void)i)));
                -[NSMutableArray addObject:](v67, "addObject:", v73);
              }

              id v70 = [v68 countByEnumeratingWithState:&v99 objects:v111 count:16];
            }

            while (v70);
          }

          id v34 = -[NSMutableArray copy](v67, "copy");
          uint64_t v7 = v66;
          unint64_t v14 = v94;
        }

        else
        {
          if (v65)
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v64,  OS_LOG_TYPE_DEFAULT,  "Intent's contact has no display name. Looking up the list of emergency handles available on this device",  buf,  2u);
          }

          v83 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler resolutionResultForEmergency](self, "resolutionResultForEmergency"));
          v112 = v83;
          id v34 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v112, 1LL));

          unint64_t v14 = v94;
        }

        goto LABEL_71;
      case 3uLL:
        id v74 = IntentHandlerDefaultLog();
        v75 = (os_log_s *)objc_claimAutoreleasedReturnValue(v74);
        if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v75,  OS_LOG_TYPE_DEFAULT,  "Resolution not required for voicemail destination",  buf,  2u);
        }

        v76 = (void *)objc_claimAutoreleasedReturnValue( +[INStartCallContactResolutionResult notRequired]( &OBJC_CLASS___INStartCallContactResolutionResult,  "notRequired"));
        v113 = v76;
        id v34 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v113, 1LL));

        goto LABEL_71;
      case 4uLL:
      case 5uLL:
        id v40 = IntentHandlerDefaultLog();
        uint64_t v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Resolution for redial", buf, 2u);
        }

        __int128 v42 = (void *)objc_claimAutoreleasedReturnValue( -[StartCallIntentHandler recentCallRecordToRedialForIntent:]( self,  "recentCallRecordToRedialForIntent:",  v6));
        id v43 = v42;
        if (v42)
        {
          v44 = (void *)objc_claimAutoreleasedReturnValue([v42 participants]);
          id v45 = [v44 count];

          if ((unint64_t)v45 >= 2)
          {
            unint64_t v93 = v14;
            v92 = v7;
            id v46 = v6;
            id v47 = IntentHandlerDefaultLog();
            id v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
            if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v116 = v43;
              _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_DEFAULT,  "recentCall for group facetime: %@",  buf,  0xCu);
            }

            v49 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
            __int128 v95 = 0u;
            __int128 v96 = 0u;
            __int128 v97 = 0u;
            __int128 v98 = 0u;
            id v50 = (void *)objc_claimAutoreleasedReturnValue([v43 participants]);
            id v51 = [v50 countByEnumeratingWithState:&v95 objects:v110 count:16];
            if (v51)
            {
              id v52 = v51;
              uint64_t v53 = *(void *)v96;
              do
              {
                for (j = 0LL; j != v52; j = (char *)j + 1)
                {
                  if (*(void *)v96 != v53) {
                    objc_enumerationMutation(v50);
                  }
                  id v55 = (void *)objc_claimAutoreleasedReturnValue( +[INPersonResolutionResult successWithResolvedPerson:]( &OBJC_CLASS___INPersonResolutionResult,  "successWithResolvedPerson:",  *(void *)(*((void *)&v95 + 1) + 8LL * (void)j)));
                  -[NSMutableArray addObject:](v49, "addObject:", v55);
                }

                id v52 = [v50 countByEnumeratingWithState:&v95 objects:v110 count:16];
              }

              while (v52);
            }

            id v34 = -[NSMutableArray copy](v49, "copy");
            id v6 = v46;
            uint64_t v7 = v92;
            unint64_t v14 = v93;
            goto LABEL_70;
          }

          v78 = (void *)objc_claimAutoreleasedReturnValue([v43 participants]);
          id v79 = [v78 count];

          if (v79 == (id)1)
          {
            v49 = (NSMutableArray *)objc_claimAutoreleasedReturnValue([v43 participants]);
            unint64_t v80 = v14;
            v81 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](v49, "firstObject"));
            v82 = (void *)objc_claimAutoreleasedReturnValue( +[INStartCallContactResolutionResult successWithResolvedPerson:]( &OBJC_CLASS___INStartCallContactResolutionResult,  "successWithResolvedPerson:",  v81));
            v109 = v82;
            id v34 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v109, 1LL));

            unint64_t v14 = v80;
LABEL_70:

LABEL_71:
            -[StartCallIntentHandler updateHandlerStateForContactResolutionResults:]( self,  "updateHandlerStateForContactResolutionResults:",  v34);
            id v86 = IntentHandlerDefaultLog();
            v87 = (os_log_s *)objc_claimAutoreleasedReturnValue(v86);
            if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v116 = v34;
              _os_log_impl( (void *)&_mh_execute_header,  v87,  OS_LOG_TYPE_DEFAULT,  "Calling completion block with resolution results: %@",  buf,  0xCu);
            }

            id v88 = IntentHandlerDefaultLog();
            v89 = (os_log_s *)objc_claimAutoreleasedReturnValue(v88);
            v90 = v89;
            if (v14 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v89))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v90,  OS_SIGNPOST_INTERVAL_END,  v10,  "resolveContacts",  (const char *)&unk_1000275CF,  buf,  2u);
            }

            v7[2](v7, v34);
            goto LABEL_77;
          }

          id v84 = IntentHandlerDefaultLog();
          v85 = (os_log_s *)objc_claimAutoreleasedReturnValue(v84);
          if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR)) {
            sub_1000205EC();
          }

          v49 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( +[INStartCallContactResolutionResult unsupportedForReason:]( &OBJC_CLASS___INStartCallContactResolutionResult,  "unsupportedForReason:",  7LL));
          v107 = v49;
          v77 = &v107;
        }

        else
        {
          v49 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( +[INStartCallContactResolutionResult unsupportedForReason:]( &OBJC_CLASS___INStartCallContactResolutionResult,  "unsupportedForReason:",  6LL));
          v108 = v49;
          v77 = &v108;
        }

        id v34 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v77, 1LL));
        goto LABEL_70;
      default:
        id v34 = 0LL;
        goto LABEL_71;
    }
  }

  v91 = v7;
  id v23 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v103 = 0u;
  __int128 v104 = 0u;
  __int128 v105 = 0u;
  __int128 v106 = 0u;
  id v24 = (void *)objc_claimAutoreleasedReturnValue([v6 contacts]);
  id v25 = [v24 countByEnumeratingWithState:&v103 objects:v114 count:16];
  if (v25)
  {
    id v26 = v25;
    uint64_t v27 = *(void *)v104;
    do
    {
      for (k = 0LL; k != v26; k = (char *)k + 1)
      {
        if (*(void *)v104 != v27) {
          objc_enumerationMutation(v24);
        }
        uint32_t v29 = *(void **)(*((void *)&v103 + 1) + 8LL * (void)k);
        if (-[StartCallIntentHandler isUnresolvedLocalEmergencyContact:]( self,  "isUnresolvedLocalEmergencyContact:",  v29))
        {
          uint64_t v30 = objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler resolutionResultForEmergency](self, "resolutionResultForEmergency"));
        }

        else
        {
          id v31 = IntentHandlerDefaultLog();
          __int128 v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v116 = v29;
            _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "[WARN] Intent includes an emergency person and a non-emergency person. Returning success for non-emergency person so emergency person can be properly resolved. Person: %@",  buf,  0xCu);
          }

          uint64_t v30 = objc_claimAutoreleasedReturnValue( +[INStartCallContactResolutionResult successWithResolvedPerson:]( &OBJC_CLASS___INStartCallContactResolutionResult,  "successWithResolvedPerson:",  v29));
        }

        __int128 v33 = (void *)v30;
        -[NSMutableArray addObject:](v23, "addObject:", v30);
      }

      id v26 = [v24 countByEnumeratingWithState:&v103 objects:v114 count:16];
    }

    while (v26);
  }

  id v34 = -[NSMutableArray copy](v23, "copy");
  -[StartCallIntentHandler updateHandlerStateForContactResolutionResults:]( self,  "updateHandlerStateForContactResolutionResults:",  v34);
  id v35 = IntentHandlerDefaultLog();
  os_signpost_id_t v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v116 = v34;
    _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "Detected foreign emergency label, calling completion block early: %@",  buf,  0xCu);
  }

  id v37 = IntentHandlerDefaultLog();
  unsigned int v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
  int v39 = v38;
  uint64_t v7 = v91;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v39,  OS_SIGNPOST_INTERVAL_END,  v10,  "resolveContacts",  (const char *)&unk_1000275CF,  buf,  2u);
  }

  v91[2](v91, v34);
LABEL_77:
}

- (void)resolveCallCapabilityForStartCall:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *))a4;
  id v8 = IntentHandlerDefaultLog();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  os_signpost_id_t v10 = os_signpost_id_generate(v9);

  id v11 = IntentHandlerDefaultLog();
  os_signpost_id_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  id v13 = v12;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    LOWORD(v23) = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v13,  OS_SIGNPOST_INTERVAL_BEGIN,  v10,  "resolveCallCapability",  (const char *)&unk_1000275CF,  (uint8_t *)&v23,  2u);
  }

  id v14 = IntentHandlerDefaultLog();
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 138412290;
    id v24 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Resolving call capability for start call intent: %@",  (uint8_t *)&v23,  0xCu);
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue( -[StartCallIntentHandler recentCallRecordToRedialForIntent:]( self,  "recentCallRecordToRedialForIntent:",  v6));
  id v17 = (void *)objc_claimAutoreleasedReturnValue( -[StartCallIntentHandler resolutionResultForCallCapability:idiom:withDisplayDisabled:]( self,  "resolutionResultForCallCapability:idiom:withDisplayDisabled:",  -[StartCallIntentHandler inferCallCapabilityForPreferredCallProvider:recentCall:initialCallCapability:idiom:isDisplayDisabled:executionContext:]( self,  "inferCallCapabilityForPreferredCallProvider:recentCall:initialCallCapability:idiom:isDisplayDisabl ed:executionContext:",  [v6 preferredCallProvider],  v16,  objc_msgSend(v6, "callCapability"),  objc_msgSend(v6, "_idiom"),  objc_msgSend(v6, "_isPrimaryDisplayDisabled"),  objc_msgSend(v6, "_executionContext")),  objc_msgSend(v6, "_idiom"),  objc_msgSend(v6, "_isPrimaryDisplayDisabled")));
  id v18 = IntentHandlerDefaultLog();
  id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 138412290;
    id v24 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Returning call capability resolution result: %@",  (uint8_t *)&v23,  0xCu);
  }

  id v20 = IntentHandlerDefaultLog();
  id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  BOOL v22 = v21;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    LOWORD(v23) = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v22,  OS_SIGNPOST_INTERVAL_END,  v10,  "resolveCallCapability",  (const char *)&unk_1000275CF,  (uint8_t *)&v23,  2u);
  }

  v7[2](v7, v17);
}

- (int64_t)callCapabilityFromRecentCall:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!v3)
  {
    id v9 = IntentHandlerDefaultLog();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v18 = 0;
      os_signpost_id_t v10 = "[WARN] Unable to infer callCapability from call to redial because the recent call was nil";
      id v11 = (uint8_t *)&v18;
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v10, v11, 2u);
    }

- (BOOL)shouldInferAudioCapabilityForRequestedCallCapability:(int64_t)a3 idiom:(int64_t)a4 isDisplayDisabled:(BOOL)a5
{
  if (a3 == 1
    || (BOOL v6 = -[StartCallIntentHandler shouldForceAudioOnlyWithIdiom:withDisplayDisabled:]( self,  "shouldForceAudioOnlyWithIdiom:withDisplayDisabled:",  a4,  a5)))
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler dataSource](self, "dataSource"));
    unsigned __int8 v8 = [v7 supportsFaceTimeAudioCalls];

    LOBYTE(v6) = v8;
  }

  return v6;
}

- (int64_t)inferCallCapabilityForPreferredCallProvider:(int64_t)a3 recentCall:(id)a4 initialCallCapability:(int64_t)a5 idiom:(int64_t)a6 isDisplayDisabled:(BOOL)a7 executionContext:(int64_t)a8
{
  BOOL v9 = a7;
  id v14 = a4;
  __int16 v15 = v14;
  if (a5 && a8 == 1)
  {
    id v16 = IntentHandlerDefaultLog();
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v39) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Call capability is already set in plugin, no inferring needed",  (uint8_t *)&v39,  2u);
    }

    goto LABEL_46;
  }

  int64_t v18 = a5;
  if (v14) {
    int64_t v18 = (int64_t)[v14 callCapability];
  }
  if (a8 == 1 && v18) {
    goto LABEL_34;
  }
  if (a3 != 2)
  {
    if (a3 == 1)
    {
      id v19 = IntentHandlerDefaultLog();
      id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v39) = 0;
        id v21 = "Inferring audio callCapability because provider is Telephony.";
LABEL_39:
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, v21, (uint8_t *)&v39, 2u);
        goto LABEL_40;
      }

      goto LABEL_40;
    }

- (id)resolutionResultForCallCapability:(int64_t)a3 idiom:(int64_t)a4 withDisplayDisabled:(BOOL)a5
{
  if (a3)
  {
    if (a3 == 2)
    {
      if (!-[StartCallIntentHandler shouldForceAudioOnlyWithIdiom:withDisplayDisabled:]( self,  "shouldForceAudioOnlyWithIdiom:withDisplayDisabled:",  a4,  a5))
      {
        a3 = 2LL;
LABEL_12:
        id v5 = (void *)objc_claimAutoreleasedReturnValue( +[INStartCallCallCapabilityResolutionResult successWithResolvedCallCapability:]( &OBJC_CLASS___INStartCallCallCapabilityResolutionResult,  "successWithResolvedCallCapability:",  a3,  a4,  a5));
        return v5;
      }

      id v6 = IntentHandlerDefaultLog();
      uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_100020618();
      }

      id v5 = (void *)objc_claimAutoreleasedReturnValue( +[INStartCallCallCapabilityResolutionResult unsupportedForReason:]( &OBJC_CLASS___INStartCallCallCapabilityResolutionResult,  "unsupportedForReason:",  1LL));
    }

    else
    {
      if (a3 == 1) {
        goto LABEL_12;
      }
      id v5 = 0LL;
    }
  }

  else
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[INStartCallCallCapabilityResolutionResult notRequired]( &OBJC_CLASS___INStartCallCallCapabilityResolutionResult,  "notRequired",  0LL,  a4,  a5));
  }

  return v5;
}

- (BOOL)shouldForceAudioOnlyWithIdiom:(int64_t)a3 withDisplayDisabled:(BOOL)a4
{
  char v4 = __stack_chk_guard;
  if ((unint64_t)a3 <= 7)
  {
    BOOL v5 = a4;
    if (((1LL << a3) & 0x47) == 0)
    {
      if (((1LL << a3) & 0x38) != 0)
      {
        id v15 = IntentHandlerDefaultLog();
        id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          int v23 = 134217984;
          int64_t v24 = a3;
          id v14 = "deviceIdiom %ld is an audio only device idiom.";
          id v16 = v13;
          uint32_t v17 = 12;
LABEL_15:
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v23, v17);
          goto LABEL_16;
        }

        goto LABEL_16;
      }

      id v20 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler dataSource](self, "dataSource"));
      unsigned __int8 v21 = [v20 hasCamera];

      if ((v21 & 1) == 0)
      {
        id v22 = IntentHandlerDefaultLog();
        id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_16;
        }
        LOWORD(v23) = 0;
        id v14 = "This Mac has no attached camera.";
        goto LABEL_14;
      }
    }

    id v8 = IntentHandlerDefaultLog();
    BOOL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 134217984;
      int64_t v24 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "deviceIdiom %ld supports video calling.",  (uint8_t *)&v23,  0xCu);
    }

    os_signpost_id_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler dataSource](self, "dataSource"));
    unsigned __int8 v11 = [v10 supportsFaceTimeVideoCalls];

    if ((v11 & 1) != 0)
    {
      if (!v5)
      {
        char v4 = 0;
        return v4 & 1;
      }

      id v12 = IntentHandlerDefaultLog();
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_16;
      }
      LOWORD(v23) = 0;
      id v14 = "Devices primary display is disabled, e.g. user is on carDND mode. ";
      goto LABEL_14;
    }

    id v18 = IntentHandlerDefaultLog();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      id v14 = "Call capabilities do not support FaceTime video calls";
LABEL_14:
      id v16 = v13;
      uint32_t v17 = 2;
      goto LABEL_15;
    }

- (BOOL)isGFTDisabledForChinaSKU:(id)a3
{
  id v4 = a3;
  if (-[StartCallIntentHandler isChinaSKUDevice](self, "isChinaSKUDevice")
    && (BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 isGroupCall]),
        unsigned int v6 = [v5 BOOLValue],
        v5,
        v6))
  {
    id v7 = IntentHandlerDefaultLog();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned __int8 v11 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "GroupFaceTime is disabled for China SKU devices",  v11,  2u);
    }

    BOOL v9 = 1;
  }

  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)resolveFaceTimeLinkForStartCall:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = IntentHandlerDefaultLog();
  BOOL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v50 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Resolving faceTimeLink for start call intent: %@",  buf,  0xCu);
  }

  id v10 = IntentHandlerDefaultLog();
  unsigned __int8 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  os_signpost_id_t v12 = os_signpost_id_generate(v11);

  id v13 = IntentHandlerDefaultLog();
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  id v15 = v14;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v15,  OS_SIGNPOST_INTERVAL_BEGIN,  v12,  "resolveFaceTimeLink",  " enableTelemetry=YES ",  buf,  2u);
  }

  id v43 = _NSConcreteStackBlock;
  uint64_t v44 = 3221225472LL;
  id v45 = sub_100010C08;
  id v46 = &unk_100034780;
  os_signpost_id_t v48 = v12;
  id v16 = v7;
  id v47 = v16;
  uint32_t v17 = objc_retainBlock(&v43);
  if (objc_msgSend(v6, "preferredCallProvider", v43, v44, v45, v46) == (id)2)
  {
    if (-[StartCallIntentHandler isFaceTimeInvitationEnabled](self, "isFaceTimeInvitationEnabled"))
    {
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v6 contacts]);
      id v19 = [v18 count];

      if (v19)
      {
        id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
        unsigned __int8 v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
        -[StartCallIntentHandler extractHandlesFromIntent:faceTimeMemberHandles:nonFaceTimeMemberHandles:]( self,  "extractHandlesFromIntent:faceTimeMemberHandles:nonFaceTimeMemberHandles:",  v6,  v20,  v21);
        if ([v21 count])
        {
          id v22 = [v6 _idiom];
          if ([v6 _idiom] != (id)4)
          {
            id v31 = [v6 _idiom];
            if (v22 != (id)3 && v31 != (id)6)
            {
              __int128 v32 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler faceTimeUtilities](self, "faceTimeUtilities"));
              unsigned int v33 = (void *)objc_claimAutoreleasedReturnValue([v32 generateFaceTimeLink:v20]);

              if (v33
                && (id v34 = (void *)objc_claimAutoreleasedReturnValue([v33 URL]),
                    BOOL v35 = (void *)objc_claimAutoreleasedReturnValue([v34 absoluteString]),
                    id v36 = [v35 length],
                    v35,
                    v34,
                    v36))
              {
                id v37 = (void *)objc_claimAutoreleasedReturnValue([v33 URL]);
                unsigned int v38 = (void *)objc_claimAutoreleasedReturnValue([v37 absoluteString]);
                id v28 = (void *)objc_claimAutoreleasedReturnValue( +[INStringResolutionResult successWithResolvedString:]( &OBJC_CLASS___INStringResolutionResult,  "successWithResolvedString:",  v38));
              }

              else
              {
                id v39 = IntentHandlerDefaultLog();
                int64_t v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
                if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "Link generation failed and nil was returned. Setting empty string.",  buf,  2u);
                }

                id v28 = (void *)objc_claimAutoreleasedReturnValue( +[INStringResolutionResult successWithResolvedString:]( &OBJC_CLASS___INStringResolutionResult,  "successWithResolvedString:",  &stru_100034C18));
              }

              id v41 = IntentHandlerDefaultLog();
              __int128 v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
              if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                id v50 = v28;
                _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "Returning FaceTimeLink resolution result: %@",  buf,  0xCu);
              }

              ((void (*)(void ***, void *))v17[2])(v17, v28);
              goto LABEL_22;
            }
          }

          id v23 = IntentHandlerDefaultLog();
          int64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "This is watchOS or tvOS. Sending a placeholder string for returning unsupported dialog",  buf,  2u);
          }

          uint64_t v25 = objc_claimAutoreleasedReturnValue( +[INStringResolutionResult successWithResolvedString:]( &OBJC_CLASS___INStringResolutionResult,  "successWithResolvedString:",  @"NoLinkGenerated"));
        }

        else
        {
          id v29 = IntentHandlerDefaultLog();
          id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "No non-FaceTime handles found. Returning nil.",  buf,  2u);
          }

          uint64_t v25 = objc_claimAutoreleasedReturnValue(+[INStringResolutionResult notRequired](&OBJC_CLASS___INStringResolutionResult, "notRequired"));
        }

        id v28 = (void *)v25;
        ((void (*)(void ***, uint64_t))v17[2])(v17, v25);
LABEL_22:

        goto LABEL_17;
      }
    }
  }

  id v26 = IntentHandlerDefaultLog();
  unsigned int v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Returning empty string as this is a telephony call or featureflag is disabled or destinations was empty",  buf,  2u);
  }

  id v28 = (void *)objc_claimAutoreleasedReturnValue( +[INStringResolutionResult successWithResolvedString:]( &OBJC_CLASS___INStringResolutionResult,  "successWithResolvedString:",  &stru_100034C18));
  ((void (*)(void ***, void *))v17[2])(v17, v28);
LABEL_17:
}

- (void)resolvePreferredCallProviderForStartCall:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = IntentHandlerDefaultLog();
  BOOL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  os_signpost_id_t v10 = os_signpost_id_generate(v9);

  id v11 = IntentHandlerDefaultLog();
  os_signpost_id_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  id v13 = v12;
  unint64_t v14 = v10 - 1;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v13,  OS_SIGNPOST_INTERVAL_BEGIN,  v10,  "resolvePreferredCallProvider",  (const char *)&unk_1000275CF,  buf,  2u);
  }

  id v15 = IntentHandlerDefaultLog();
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  uint32_t v17 = &off_100026000;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v80 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Resolving call provider for start call intent: %@",  buf,  0xCu);
  }

  id v18 = [v6 preferredCallProvider];
  if (v18)
  {
    id v19 = 0LL;
LABEL_8:
    if (v18 == (id)3)
    {
      uint64_t v32 = 3LL;
      goto LABEL_52;
    }

    if (v18 != (id)2)
    {
      if (v18 == (id)1)
      {
        v77 = v19;
        unint64_t v78 = v10 - 1;
        os_signpost_id_t v20 = v10;
        unsigned __int8 v21 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler globalEmergencyNumbers](self, "globalEmergencyNumbers"));
        id v22 = (void *)objc_claimAutoreleasedReturnValue([v6 contacts]);
        id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 firstObject]);
        int64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v23 personHandle]);
        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 value]);
        char v26 = ([v21 containsObject:v25] & 1) != 0
           || [v6 destinationType] == (id)2;

        id v45 = [v6 _idiom];
        id v46 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler dataSource](self, "dataSource"));
        unsigned __int8 v47 = [v46 supportsTelephonyCalls];

        if ((v26 & 1) != 0 || v45 == (id)3)
        {
          os_signpost_id_t v10 = v20;
          id v19 = v77;
          unint64_t v14 = v78;
          uint32_t v17 = &off_100026000;
          if ((v47 & 1) == 0)
          {
            id v50 = IntentHandlerDefaultLog();
            id v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
            if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG)) {
              sub_1000206CC(v45 == (id)3, v26, v51);
            }
          }
        }

        else
        {
          os_signpost_id_t v10 = v20;
          id v19 = v77;
          unint64_t v14 = v78;
          uint32_t v17 = &off_100026000;
          if ((v47 & 1) == 0)
          {
            id v48 = IntentHandlerDefaultLog();
            v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
            if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
              sub_100020754();
            }

            uint64_t v44 = 1LL;
            goto LABEL_47;
          }
        }

        uint64_t v32 = 1LL;
LABEL_52:
        uint64_t v31 = objc_claimAutoreleasedReturnValue( +[INStartCallPreferredCallProviderResolutionResult successWithResolvedPreferredCallProvider:]( &OBJC_CLASS___INStartCallPreferredCallProviderResolutionResult,  "successWithResolvedPreferredCallProvider:",  v32));
        goto LABEL_53;
      }

- (id)recentCallRecordToRedialForIntent:(id)a3
{
  id v4 = a3;
  if ([v4 destinationType] == (id)4 || objc_msgSend(v4, "destinationType") == (id)5)
  {
    id v5 = IntentHandlerDefaultLog();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    os_signpost_id_t v7 = os_signpost_id_generate(v6);

    id v8 = IntentHandlerDefaultLog();
    BOOL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    os_signpost_id_t v10 = v9;
    unint64_t v11 = v7 - 1;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v10,  OS_SIGNPOST_INTERVAL_BEGIN,  v7,  "recentCallToRedial",  (const char *)&unk_1000275CF,  buf,  2u);
    }

    id v12 = IntentHandlerDefaultLog();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_100020964();
    }

    unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v4 callRecordToCallBack]);
    if (v14)
    {
      id v15 = IntentHandlerDefaultLog();
      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        sub_100020938();
      }

      uint32_t v17 = (void *)objc_claimAutoreleasedReturnValue([v4 callRecordToCallBack]);
    }

    else
    {
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v4 callRecordFilter]);

      id v19 = IntentHandlerDefaultLog();
      os_signpost_id_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG);
      if (v18)
      {
        id v43 = self;
        unint64_t v44 = v7 - 1;
        os_signpost_id_t v45 = v7;
        if (v21) {
          sub_10002090C();
        }

        id v22 = objc_alloc(&OBJC_CLASS___RecentCallQuery);
        id v23 = (void *)objc_claimAutoreleasedReturnValue([v4 callRecordFilter]);
        int64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v23 participants]);
        id v25 = [v4 destinationType];
        char v26 = (void *)objc_claimAutoreleasedReturnValue([v4 callRecordFilter]);
        id v27 = [v26 callTypes];
        id v28 = (void *)objc_claimAutoreleasedReturnValue([v4 callRecordFilter]);
        id v29 = [v28 callCapability];
        id v30 = (void *)objc_claimAutoreleasedReturnValue([v4 callRecordFilter]);
        uint64_t v31 = -[RecentCallQuery initWithParticipants:destinationType:callTypes:callCapability:preferredCallProvider:includeThirdPartyCalls:]( v22,  "initWithParticipants:destinationType:callTypes:callCapability:preferredCallProvider:includeThirdPartyCalls:",  v24,  v25,  v27,  v29,  [v30 preferredCallProvider],  1);

        uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler recentCallToRedialForQuery:](v43, "recentCallToRedialForQuery:", v31));
        if (v32) {
          uint32_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler callRecordForRecentCall:](v43, "callRecordForRecentCall:", v32));
        }
        else {
          uint32_t v17 = 0LL;
        }
        unint64_t v11 = v44;
        os_signpost_id_t v7 = v45;
      }

      else
      {
        if (v21) {
          sub_1000208E0();
        }

        uint64_t v47 = 0LL;
        uint64_t BackingType = INCallRecordTypeGetBackingType([v4 recordTypeForRedialing]);
        INCallRecordTypeOptionsAddBackingType(&v47, BackingType);
        id v34 = objc_alloc(&OBJC_CLASS___RecentCallQuery);
        unsigned __int8 v35 = (void *)objc_claimAutoreleasedReturnValue([v4 contacts]);
        id v36 = [v4 destinationType];
        unsigned __int8 v37 = -[RecentCallQuery initWithParticipants:destinationType:callTypes:callCapability:preferredCallProvider:]( v34,  "initWithParticipants:destinationType:callTypes:callCapability:preferredCallProvider:",  v35,  v36,  v47,  [v4 callCapability],  objc_msgSend(v4, "preferredCallProvider"));

        unsigned int v38 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler recentCallToRedialForQuery:](self, "recentCallToRedialForQuery:", v37));
        if (v38) {
          uint32_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler callRecordForRecentCall:](self, "callRecordForRecentCall:", v38));
        }
        else {
          uint32_t v17 = 0LL;
        }
      }
    }

    id v39 = IntentHandlerDefaultLog();
    id v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
    id v41 = v40;
    if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
    {
      *(_WORD *)id v46 = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v41,  OS_SIGNPOST_INTERVAL_END,  v7,  "recentCallToRedial",  (const char *)&unk_1000275CF,  v46,  2u);
    }
  }

  else
  {
    uint32_t v17 = 0LL;
  }

  return v17;
}

- (id)callRecordForRecentCall:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[CallRecordConverter sharedInstance](&OBJC_CLASS___CallRecordConverter, "sharedInstance"));
  id v19 = v4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v19, 1LL));

  os_signpost_id_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler dataSource](self, "dataSource"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 contactsDataSource]);
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler dataSource](self, "dataSource"));
  os_signpost_id_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 providerManager]);
  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler dataSource](self, "dataSource"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 coreTelephonyDataSource]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 allRelevantISOCountryCodes]);
  unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( [v5 callRecordsForRecentCalls:v6 withContactsDataSource:v8 withCallProviderManager:v10 withCurrentISOCountryCodes:v13]);

  if ([v14 count] == (id)1)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectAtIndexedSubscript:0]);
  }

  else
  {
    id v16 = IntentHandlerDefaultLog();
    uint32_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_100020990();
    }

    id v15 = 0LL;
  }

  return v15;
}

- (id)recentCallToRedialForQuery:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler dataSource](self, "dataSource"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 contactsDataSource]);
  os_signpost_id_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler identifierToContactCache](self, "identifierToContactCache"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler dataSource](self, "dataSource"));
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v8 coreTelephonyDataSource]);
  os_signpost_id_t v10 = (void *)objc_claimAutoreleasedReturnValue( [v4 predicateForRecentCallWithContactsDataSource:v6 contactIdentifierCache:v7 coreTelephonyDataSource:v9]);

  id v11 = IntentHandlerDefaultLog();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_100020A1C();
  }

  id v13 = IntentHandlerDefaultLog();
  unint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  os_signpost_id_t v15 = os_signpost_id_generate(v14);

  id v16 = IntentHandlerDefaultLog();
  uint32_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  id v18 = v17;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v18,  OS_SIGNPOST_INTERVAL_BEGIN,  v15,  "callHistoryDBCallToRedial",  (const char *)&unk_1000275CF,  buf,  2u);
  }

  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler dataSource](self, "dataSource"));
  os_signpost_id_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 callHistoryDataSource]);
  BOOL v21 = (void *)objc_claimAutoreleasedReturnValue([v20 callsWithPredicate:v10 limit:1 offset:0 batchSize:1]);
  id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 firstObject]);

  id v23 = IntentHandlerDefaultLog();
  int64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  id v25 = v24;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    *(_WORD *)id v29 = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v25,  OS_SIGNPOST_INTERVAL_END,  v15,  "callHistoryDBCallToRedial",  (const char *)&unk_1000275CF,  v29,  2u);
  }

  id v26 = IntentHandlerDefaultLog();
  id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
    sub_1000209BC();
  }

  return v22;
}

- (id)emergencyTypeToString:(int64_t)a3
{
  else {
    return off_100034918[a3];
  }
}

- (BOOL)intentHasUnresolvedLocalEmergencyContact:(id)a3
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "contacts", 0));
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if (-[StartCallIntentHandler isUnresolvedLocalEmergencyContact:]( self,  "isUnresolvedLocalEmergencyContact:",  *(void *)(*((void *)&v11 + 1) + 8LL * (void)i)))
        {
          BOOL v9 = 1;
          goto LABEL_11;
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  BOOL v9 = 0;
LABEL_11:

  return v9;
}

- (BOOL)isUnresolvedLocalEmergencyContact:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 personHandle]);
  if ([v4 emergencyType] == (id)1)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 personHandle]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 value]);
    BOOL v7 = [v6 length] == 0;
  }

  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)globalEmergencyNumbers
{
  if (qword_10003E598 != -1) {
    dispatch_once(&qword_10003E598, &stru_1000347A0);
  }
  return (id)qword_10003E590;
}

- (id)personResolutionResultsForIntent:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 contacts]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 callGroups]);
  id v7 = [v6 count];

  if (v7)
  {
    uint64_t v8 = objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler resolveContactsFromCallGroups:](self, "resolveContactsFromCallGroups:", v4));

    id v5 = (void *)v8;
  }

  v270 = v5;
  if ([v5 count])
  {
    BOOL v9 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v318 = 0u;
    __int128 v319 = 0u;
    __int128 v320 = 0u;
    __int128 v321 = 0u;
    id v10 = v5;
    id v11 = [v10 countByEnumeratingWithState:&v318 objects:v340 count:16];
    v290 = v4;
    v286 = v10;
    if (!v11) {
      goto LABEL_209;
    }
    id v12 = v11;
    uint64_t v289 = *(void *)v319;
    uint64_t v273 = _INStartCallContactUnsupportedReasonForeignEmergencyDisambiguation;
    v278 = v9;
    v292 = self;
    while (1)
    {
      __int128 v13 = 0LL;
      id v287 = v12;
      do
      {
        if (*(void *)v319 != v289) {
          objc_enumerationMutation(v10);
        }
        __int128 v14 = *(void **)(*((void *)&v318 + 1) + 8LL * (void)v13);
        os_signpost_id_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 personHandle]);
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 value]);

        if ((unint64_t)[v10 count] < 2 || objc_msgSend(v4, "preferredCallProvider") == (id)2)
        {
          uint32_t v17 = (void *)objc_claimAutoreleasedReturnValue([v14 personHandle]);
          id v18 = [v17 emergencyType];

          if (v18 == (id)1)
          {
            id v19 = IntentHandlerDefaultLog();
            os_signpost_id_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              BOOL v21 = (os_log_s *)objc_claimAutoreleasedReturnValue([v14 personHandle]);
              id v22 = (void *)objc_claimAutoreleasedReturnValue([v14 personHandle]);
              id v23 = v14;
              id v24 = v4;
              id v25 = v16;
              id v26 = v13;
              id v27 = v22;
              id v28 = v9;
              id v29 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( -[StartCallIntentHandler emergencyTypeToString:]( self,  "emergencyTypeToString:",  [v22 emergencyType]));
              *(_DWORD *)buf = 138412546;
              v326 = v21;
              __int16 v327 = 2112;
              v328 = v29;
              _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Handle has the LocalEmergency flag. Resolving success. %@ with type: %@",  buf,  0x16u);

              __int128 v13 = v26;
              id v30 = v24;
              __int128 v14 = v23;

              BOOL v9 = v28;
              id v4 = v30;
              id v16 = v25;
              id v10 = v286;
            }

            uint64_t v31 = (ContactResolver *)objc_claimAutoreleasedReturnValue( +[INStartCallContactResolutionResult successWithResolvedPerson:]( &OBJC_CLASS___INStartCallContactResolutionResult,  "successWithResolvedPerson:",  v14));
            -[NSMutableArray addObject:](v9, "addObject:", v31);
            goto LABEL_33;
          }

          v288 = v13;
          if (![v16 length])
          {
            id v51 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler featureFlags](self, "featureFlags"));
            if ([v51 crrFullRecommendation])
            {
              id v52 = (void *)objc_claimAutoreleasedReturnValue([v14 scoredAlternatives]);

              if (v52)
              {
                uint64_t v31 = (ContactResolver *)objc_claimAutoreleasedReturnValue( -[StartCallIntentHandler relayCRRRecommendationForPerson:intent:]( self,  "relayCRRRecommendationForPerson:intent:",  v14,  v4));
                -[NSMutableArray addObject:](v9, "addObject:", v31);
                id v12 = v287;
                goto LABEL_34;
              }
            }

            else
            {
            }

            v285 = v16;
            unsigned int v53 = v9;
            id v54 = objc_alloc(&OBJC_CLASS___ContactResolver);
            id v55 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler dataSource](self, "dataSource"));
            id v56 = (void *)objc_claimAutoreleasedReturnValue([v55 contactsDataSource]);
            id v57 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler coreAnalyticsLogger](self, "coreAnalyticsLogger"));
            uint64_t v31 = -[ContactResolver initWithDataSource:logger:](v54, "initWithDataSource:logger:", v56, v57);

            v58 = (void *)objc_claimAutoreleasedReturnValue(-[ContactResolver matchingContactsForPerson:](v31, "matchingContactsForPerson:", v14));
            if (![v58 count])
            {
              id v107 = IntentHandlerDefaultLog();
              v108 = (os_log_s *)objc_claimAutoreleasedReturnValue(v107);
              id v12 = v287;
              if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v326 = (os_log_s *)v14;
                _os_log_impl( (void *)&_mh_execute_header,  v108,  OS_LOG_TYPE_DEFAULT,  "Found no matching contact from siriMatches or name search, returning unsupported. Person: %@",  buf,  0xCu);
              }

              v109 = (void *)objc_claimAutoreleasedReturnValue( +[INStartCallContactResolutionResult unsupportedForReason:]( &OBJC_CLASS___INStartCallContactResolutionResult,  "unsupportedForReason:",  1LL));
              -[NSMutableArray addObject:](v53, "addObject:", v109);
              __int128 v13 = v288;
              goto LABEL_204;
            }

            id v59 = (void *)objc_claimAutoreleasedReturnValue([v14 personHandle]);
            uint64_t v60 = objc_claimAutoreleasedReturnValue([v59 label]);

            v281 = v14;
            v61 = (void *)objc_claimAutoreleasedReturnValue([v14 personHandle]);
            id v62 = [v61 type];

            uint64_t v293 = (uint64_t)v62;
            if (!v62 && [v4 preferredCallProvider] == (id)1)
            {
              id v63 = IntentHandlerDefaultLog();
              v64 = (os_log_s *)objc_claimAutoreleasedReturnValue(v63);
              if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl( (void *)&_mh_execute_header,  v64,  OS_LOG_TYPE_DEFAULT,  "Requested handle type is unknown, but preferredCallProvider is phone. Inferring handle type of phone number.",  buf,  2u);
              }

              uint64_t v293 = 2LL;
              goto LABEL_47;
            }

            if ([v4 preferredCallProvider] == (id)2)
            {
              id v65 = IntentHandlerDefaultLog();
              v64 = (os_log_s *)objc_claimAutoreleasedReturnValue(v65);
              if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl( (void *)&_mh_execute_header,  v64,  OS_LOG_TYPE_DEFAULT,  "PreferredCallProvider is faceTime. Inferring handle type of unknown to present both phone number and email address.",  buf,  2u);
              }

              uint64_t v293 = 0LL;
LABEL_47:
            }

            v291 = (void *)v60;
            v280 = v31;
            id v66 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
            __int128 v314 = 0u;
            __int128 v315 = 0u;
            __int128 v316 = 0u;
            __int128 v317 = 0u;
            v282 = v58;
            v67 = (void *)objc_claimAutoreleasedReturnValue([v58 allContacts]);
            id v68 = [v67 countByEnumeratingWithState:&v314 objects:v338 count:16];
            if (v68)
            {
              id v69 = v68;
              uint64_t v70 = *(void *)v315;
              do
              {
                for (i = 0LL; i != v69; i = (char *)i + 1)
                {
                  if (*(void *)v315 != v70) {
                    objc_enumerationMutation(v67);
                  }
                  uint64_t v72 = *(void *)(*((void *)&v314 + 1) + 8LL * (void)i);
                  id v73 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler dataSource](v292, "dataSource"));
                  BOOL v74 = (void *)objc_claimAutoreleasedReturnValue([v73 coreTelephonyDataSource]);
                  id v75 = (void *)objc_claimAutoreleasedReturnValue([v74 allRelevantISOCountryCodes]);
                  id v76 = (void *)objc_claimAutoreleasedReturnValue( -[StartCallIntentHandler _inPersonsFromContact:withRequestedType:requestedLabel:isoCountryCodes:]( v292,  "_inPersonsFromContact:withRequestedType:requestedLabel:isoCountryCodes:",  v72,  v293,  v291,  v75));

                  if ([v76 count]) {
                    -[NSMutableDictionary setObject:forKeyedSubscript:](v66, "setObject:forKeyedSubscript:", v76, v72);
                  }
                }

                id v69 = [v67 countByEnumeratingWithState:&v314 objects:v338 count:16];
              }

              while (v69);
            }

            id v77 = -[NSMutableDictionary copy](v66, "copy");
            id v4 = v290;
            unint64_t v78 = (void *)objc_claimAutoreleasedReturnValue( -[StartCallIntentHandler _applyImpliedFilterToPhoneNumberOnlyMatchesIfApplicableForPersonsByContact:requestedHandleType:preferredCallProvider:]( v292,  "_applyImpliedFilterToPhoneNumberOnlyMatchesIfApplicableForPersonsByContact:requestedHandle Type:preferredCallProvider:",  v77,  v293,  [v290 preferredCallProvider]));

            v58 = v282;
            id v79 = -[ContactSlotResolutionHelper initWithUnresolvedPerson:availableContacts:]( objc_alloc(&OBJC_CLASS___ContactSlotResolutionHelper),  "initWithUnresolvedPerson:availableContacts:",  v281,  v282);
            id v80 = objc_alloc_init(&OBJC_CLASS___NSSet);
            v81 = (void *)objc_claimAutoreleasedReturnValue([v281 extractRecommendation]);
            v277 = v81;
            v283 = v80;
            if ([v81 contactsAvailableInPool:v282])
            {
              v82 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler dataSource](v292, "dataSource"));
              unsigned int v83 = [v82 expectUpstreamContactRecommendation];

              if (v83)
              {
                id v84 = IntentHandlerDefaultLog();
                v85 = (os_log_s *)objc_claimAutoreleasedReturnValue(v84);
                __int128 v13 = v288;
                if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl( (void *)&_mh_execute_header,  v85,  OS_LOG_TYPE_DEFAULT,  "Native flow contact resolver enabled.",  buf,  2u);
                }

                uint64_t v31 = v280;
                switch((unint64_t)[v81 type])
                {
                  case 0uLL:
                    id v86 = IntentHandlerDefaultLog();
                    v87 = (os_log_s *)objc_claimAutoreleasedReturnValue(v86);
                    if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      v326 = (os_log_s *)v281;
                      _os_log_impl( (void *)&_mh_execute_header,  v87,  OS_LOG_TYPE_DEFAULT,  "NCR found no matches for person: %@",  buf,  0xCu);
                    }

                    id v88 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( +[INStartCallContactResolutionResult unsupportedForReason:]( &OBJC_CLASS___INStartCallContactResolutionResult,  "unsupportedForReason:",  1LL));
                    -[NSMutableArray addObject:](v278, "addObject:", v88);
                    v89 = 0LL;
                    goto LABEL_201;
                  case 1uLL:
                    v275 = v79;
                    v130 = (void *)objc_claimAutoreleasedReturnValue([v81 contactIdentifiers]);
                    v131 = (void *)objc_claimAutoreleasedReturnValue([v130 firstObject]);
                    v132 = (void *)objc_claimAutoreleasedReturnValue([v282 contactWithId:v131]);
                    v337 = v132;
                    v133 = v81;
                    v89 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v337,  1LL));

                    id v134 = IntentHandlerDefaultLog();
                    v91 = (os_log_s *)objc_claimAutoreleasedReturnValue(v134);
                    if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
                    {
                      v135 = (void *)objc_claimAutoreleasedReturnValue([v133 contactIdentifiers]);
                      v136 = (os_log_s *)objc_claimAutoreleasedReturnValue([v135 firstObject]);
                      *(_DWORD *)buf = 138412290;
                      v326 = v136;
                      _os_log_impl( (void *)&_mh_execute_header,  v91,  OS_LOG_TYPE_DEFAULT,  "Confident match found by NCR, uuid %@",  buf,  0xCu);
                    }

                    id v79 = v275;
                    goto LABEL_123;
                  case 2uLL:
                    v137 = (void *)objc_claimAutoreleasedReturnValue([v81 contactIdentifiers]);
                    v91 = (os_log_s *)objc_claimAutoreleasedReturnValue([v137 firstObject]);

                    v138 = (void *)objc_claimAutoreleasedReturnValue([v282 contactWithId:v91]);
                    v336 = v138;
                    v89 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v336,  1LL));

                    uint64_t v139 = objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v91));
                    id v140 = IntentHandlerDefaultLog();
                    v141 = (os_log_s *)objc_claimAutoreleasedReturnValue(v140);
                    if (os_log_type_enabled(v141, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      v326 = v91;
                      _os_log_impl( (void *)&_mh_execute_header,  v141,  OS_LOG_TYPE_DEFAULT,  "Low-confidence (needsConfirmation) match found by NCR, uuid %@",  buf,  0xCu);
                    }

                    v283 = (void *)v139;
                    id v4 = v290;
                    goto LABEL_123;
                  case 3uLL:
                    v142 = (void *)objc_claimAutoreleasedReturnValue([v81 contactIdentifiers]);
                    v91 = (os_log_s *)objc_claimAutoreleasedReturnValue([v282 contactsWithIds:v142]);

                    if (-[StartCallIntentHandler anyContactsHaveSameName:](v292, "anyContactsHaveSameName:", v91))
                    {
                      id v143 = IntentHandlerDefaultLog();
                      v144 = (os_log_s *)objc_claimAutoreleasedReturnValue(v143);
                      if (os_log_type_enabled(v144, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_WORD *)buf = 0;
                        _os_log_impl( (void *)&_mh_execute_header,  v144,  OS_LOG_TYPE_DEFAULT,  "NCR recommended needsDisambiguation for contacts, but some have the same name. Proceeding to h andle disambiguation.",  buf,  2u);
                      }

                      v91 = v91;
                      v89 = v91;
                    }

                    else
                    {
                      v145 = (void *)objc_claimAutoreleasedReturnValue([v81 contactIdentifiers]);
                      v146 = (void *)objc_claimAutoreleasedReturnValue( -[ContactSlotResolutionHelper buildDisambiguationResultForContacts:]( v79,  "buildDisambiguationResultForContacts:",  v145));

                      -[StartCallIntentHandler parseEmergencyContacts:usingExistingResult:]( v292,  "parseEmergencyContacts:usingExistingResult:",  v286,  v146);
                      v147 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler featureFlags](v292, "featureFlags"));
                      unsigned int v148 = [v147 crrHandleRecommendation];

                      if (v148)
                      {
                        v149 = (void *)objc_claimAutoreleasedReturnValue([v281 siriMatches]);
                        uint64_t v150 = objc_claimAutoreleasedReturnValue( +[INStartCallContactResolutionResult disambiguationWithPeopleToDisambiguate:]( &OBJC_CLASS___INStartCallContactResolutionResult,  "disambiguationWithPeopleToDisambiguate:",  v149));

                        v146 = (void *)v150;
                      }

                      -[NSMutableArray addObject:](v278, "addObject:", v146);
                      id v151 = IntentHandlerDefaultLog();
                      v152 = (os_log_s *)objc_claimAutoreleasedReturnValue(v151);
                      if (os_log_type_enabled(v152, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 138412290;
                        v326 = v91;
                        _os_log_impl( (void *)&_mh_execute_header,  v152,  OS_LOG_TYPE_DEFAULT,  "needsDisambiguation recommended by NCR, uuids %@",  buf,  0xCu);
                      }

                      v89 = 0LL;
                    }

                    goto LABEL_123;
                  default:
                    v89 = 0LL;
                    break;
                }

- (id)relayCRRRecommendationForPerson:(id)a3 intent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = IntentHandlerDefaultLog();
  BOOL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "relaying CRR recommendations", buf, 2u);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 scoredAlternatives]);
  if ([v10 count])
  {
    if ([v10 count] != (id)1)
    {
      id v24 = IntentHandlerDefaultLog();
      id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        id v26 = [v10 count];
        *(_DWORD *)buf = 134217984;
        id v66 = v26;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Found %ld candidates; returning disambiguate",
          buf,
          0xCu);
      }

      v64[0] = _NSConcreteStackBlock;
      v64[1] = 3221225472LL;
      v64[2] = sub_1000149A8;
      v64[3] = &unk_1000347C8;
      v64[4] = self;
      id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "tu_mapObjectsUsingBlock:", v64));
      uint64_t v27 = objc_claimAutoreleasedReturnValue( +[INStartCallContactResolutionResult disambiguationWithPeopleToDisambiguate:]( &OBJC_CLASS___INStartCallContactResolutionResult,  "disambiguationWithPeopleToDisambiguate:",  v12));
      goto LABEL_44;
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndexedSubscript:0]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 person]);

    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndexedSubscript:0]);
    id v14 = [v13 recommendation];

    os_signpost_id_t v15 = (void *)objc_claimAutoreleasedReturnValue([v12 personHandle]);
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 value]);

    if (v16)
    {
      uint32_t v17 = (void *)objc_claimAutoreleasedReturnValue([v12 personHandle]);
      id v18 = [v17 type];

      id v19 = (void *)objc_claimAutoreleasedReturnValue([v12 personHandle]);
      BOOL v20 = [v19 type] == (id)1 && objc_msgSend(v7, "preferredCallProvider") == (id)2;

      if (v18 == (id)2 || v20)
      {
        id v41 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler dataSource](self, "dataSource"));
        id v42 = (void *)objc_claimAutoreleasedReturnValue([v41 coreTelephonyDataSource]);
        id v43 = (void *)objc_claimAutoreleasedReturnValue([v42 allRelevantISOCountryCodes]);
        unint64_t v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "tu_personWithFormattedHandleForISOCountryCodes:", v43));

        id v45 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler dataSource](self, "dataSource"));
        id v46 = (void *)objc_claimAutoreleasedReturnValue([v44 personHandle]);
        uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue([v46 value]);
        LODWORD(v42) = [v45 isMMIOrUSSDNumber:v47];

        if ((_DWORD)v42)
        {
          id v48 = IntentHandlerDefaultLog();
          id v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
          {
            id v50 = (void *)objc_claimAutoreleasedReturnValue([v44 personHandle]);
            id v51 = (void *)objc_claimAutoreleasedReturnValue([v50 value]);
            *(_DWORD *)buf = 138412290;
            id v66 = v51;
            _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_DEFAULT,  "Found 1 candidate with unsupported MMI or USSD handle %@",  buf,  0xCu);
          }

          uint64_t v52 = objc_claimAutoreleasedReturnValue( +[INStartCallContactResolutionResult unsupportedForReason:]( &OBJC_CLASS___INStartCallContactResolutionResult,  "unsupportedForReason:",  5LL));
        }

        else
        {
          id v59 = IntentHandlerDefaultLog();
          uint64_t v60 = (os_log_s *)objc_claimAutoreleasedReturnValue(v59);
          BOOL v61 = os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT);
          if (v14)
          {
            if (v61)
            {
              *(_DWORD *)buf = 138412290;
              id v66 = v44;
              _os_log_impl( (void *)&_mh_execute_header,  v60,  OS_LOG_TYPE_DEFAULT,  "Found 1 low-confidence candidate; returning confirm: %@",
                buf,
                0xCu);
            }

            uint64_t v52 = objc_claimAutoreleasedReturnValue( +[INStartCallContactResolutionResult confirmationRequiredWithPersonToConfirm:]( &OBJC_CLASS___INStartCallContactResolutionResult,  "confirmationRequiredWithPersonToConfirm:",  v44));
          }

          else
          {
            if (v61)
            {
              *(_DWORD *)buf = 138412290;
              id v66 = v44;
              _os_log_impl( (void *)&_mh_execute_header,  v60,  OS_LOG_TYPE_DEFAULT,  "Found 1 high-confidence candidate; returning success: %@",
                buf,
                0xCu);
            }

            uint64_t v52 = objc_claimAutoreleasedReturnValue( +[INStartCallContactResolutionResult successWithResolvedPerson:]( &OBJC_CLASS___INStartCallContactResolutionResult,  "successWithResolvedPerson:",  v44));
          }
        }

        id v23 = (void *)v52;
        id v12 = v44;
        goto LABEL_45;
      }

      id v38 = IntentHandlerDefaultLog();
      id v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
      if (!os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_43;
      }
      *(_DWORD *)buf = 138412290;
      id v66 = v12;
      BOOL v40 = "Found 1 candidate with an invalid handle type; returning unsupported. Person: %@";
      goto LABEL_42;
    }

    id v28 = (void *)objc_claimAutoreleasedReturnValue([v6 personHandle]);

    if (!v28)
    {
      id v62 = IntentHandlerDefaultLog();
      id v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v62);
      if (!os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
LABEL_43:

        uint64_t v27 = objc_claimAutoreleasedReturnValue( +[INStartCallContactResolutionResult unsupportedForReason:]( &OBJC_CLASS___INStartCallContactResolutionResult,  "unsupportedForReason:",  3LL));
LABEL_44:
        id v23 = (void *)v27;
LABEL_45:

        goto LABEL_46;
      }

      *(_DWORD *)buf = 138412290;
      id v66 = v12;
      BOOL v40 = "Found 1 candidate with a no handle; returning unsupported. Person: %@";
LABEL_42:
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, v40, buf, 0xCu);
      goto LABEL_43;
    }

    id v29 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler dataSource](self, "dataSource"));
    id v30 = (void *)objc_claimAutoreleasedReturnValue([v29 contactsDataSource]);
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v12 contactIdentifier]);
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(+[ContactResolver keysToFetch](&OBJC_CLASS___ContactResolver, "keysToFetch"));
    int64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v30 contactForIdentifier:v31 keysToFetch:v32]);

    id v34 = (void *)objc_claimAutoreleasedReturnValue([v6 personHandle]);
    uint64_t v35 = (uint64_t)[v34 type];

    if (v35 || [v7 preferredCallProvider] != (id)1)
    {
      if ([v7 preferredCallProvider] != (id)2)
      {
LABEL_33:
        id v54 = (void *)objc_claimAutoreleasedReturnValue( -[StartCallIntentHandler getAlternativesForContact:forRequestedHandleType:forCallProvider:]( self,  "getAlternativesForContact:forRequestedHandleType:forCallProvider:",  v33,  v35,  [v7 preferredCallProvider]));
        id v55 = [v54 copy];
        id v56 = (void *)objc_claimAutoreleasedReturnValue( +[INPersonDeduplicator dedupeINPersons:]( &OBJC_CLASS___INPersonDeduplicator,  "dedupeINPersons:",  v55));

        id v57 = IntentHandlerDefaultLog();
        v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v58,  OS_LOG_TYPE_DEFAULT,  "Found 1 candidate with no matching handle; offering other handles as alternatives",
            buf,
            2u);
        }

        id v23 = (void *)objc_claimAutoreleasedReturnValue( +[INStartCallContactResolutionResult resolutionResultUnsupportedWithReason:alternativeItems:]( &OBJC_CLASS___INStartCallContactResolutionResult,  "resolutionResultUnsupportedWithReason:alternativeItems:",  3LL,  v56));
        goto LABEL_45;
      }

      id v53 = IntentHandlerDefaultLog();
      unsigned int v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "PreferredCallProvider is faceTime. Inferring handle type of unknown to present both phone number and email address.",  buf,  2u);
      }

      uint64_t v35 = 0LL;
    }

    else
    {
      id v36 = IntentHandlerDefaultLog();
      unsigned int v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        uint64_t v35 = 2LL;
        _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "Requested handle type is unknown, but preferredCallProvider is phone. Inferring handle type of phone number.",  buf,  2u);
      }

      else
      {
        uint64_t v35 = 2LL;
      }
    }

    goto LABEL_33;
  }

  id v21 = IntentHandlerDefaultLog();
  id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v66 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "No candidates from CRR. Returning unsupported. Person: %@",  buf,  0xCu);
  }

  id v23 = (void *)objc_claimAutoreleasedReturnValue( +[INStartCallContactResolutionResult unsupportedForReason:]( &OBJC_CLASS___INStartCallContactResolutionResult,  "unsupportedForReason:",  1LL));
LABEL_46:

  return v23;
}

- (BOOL)requireScoreBasedResolutionForGFT:(unint64_t)a3 numberOfContactsCount:(unint64_t)a4
{
  return a3 > 1 && a4 > 1;
}

- (void)parseEmergencyContacts:(id)a3 usingExistingResult:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 count] == (id)1)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:0]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 displayName]);
    if ([v8 isEqualToString:@"emergency contact"])
    {
      BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:0]);
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 alternatives]);
      id v11 = [v10 count];
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 disambiguationItems]);
      id v13 = [v12 count];

      if (v11 == v13)
      {
        id v14 = IntentHandlerDefaultLog();
        os_signpost_id_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint64_t v27 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Emergency contacts detected. Inserting personHandles.",  v27,  2u);
        }

        id v16 = (void *)objc_claimAutoreleasedReturnValue([v6 disambiguationItems]);
        id v17 = [v16 count];

        if (v17)
        {
          unint64_t v18 = 0LL;
          do
          {
            id v19 = (void *)objc_claimAutoreleasedReturnValue([v6 disambiguationItems]);
            BOOL v20 = (void *)objc_claimAutoreleasedReturnValue([v19 objectAtIndexedSubscript:v18]);

            id v21 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:0]);
            id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 alternatives]);
            id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 objectAtIndexedSubscript:v18]);

            id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 personHandle]);
            [v20 setPersonHandle:v24];

            ++v18;
            id v25 = (void *)objc_claimAutoreleasedReturnValue([v6 disambiguationItems]);
            id v26 = [v25 count];
          }

          while ((unint64_t)v26 > v18);
        }
      }
    }

    else
    {
    }
  }
}

- (id)generateAdditionalMatchingHandles:(id)a3 resolvedContacts:(id)a4 requestedHandleType:(int64_t)a5 requestedHandleLabel:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  unint64_t v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "tu_matchingINPersonHandlesByContactIdentifier"));
  id v49 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  unsigned int v43 = [INPersonHandleLabelMobile isEqualToString:v10];
  id v39 = v10;
  unsigned int v42 = [INPersonHandleLabeliPhone isEqualToString:v10];
  if ((v42 & 1) != 0 || v43)
  {
    id v11 = IntentHandlerDefaultLog();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Either a mobile handle or an iPhone label was requested without any matching handle. Checking if an alternative for mobile or iPhone handles exists.",  buf,  2u);
    }
  }

  __int128 v57 = 0u;
  __int128 v58 = 0u;
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  id obj = v9;
  id v45 = [obj countByEnumeratingWithState:&v55 objects:v61 count:16];
  if (v45)
  {
    uint64_t v41 = *(void *)v56;
    do
    {
      for (i = 0LL; i != v45; i = (char *)i + 1)
      {
        if (*(void *)v56 != v41) {
          objc_enumerationMutation(obj);
        }
        id v50 = *(void **)(*((void *)&v55 + 1) + 8LL * (void)i);
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v50 identifier]);
        os_signpost_id_t v15 = (void *)objc_claimAutoreleasedReturnValue([v44 objectForKeyedSubscript:v14]);

        if (v15)
        {
          id v46 = v15;
          uint64_t v47 = i;
          __int128 v53 = 0u;
          __int128 v54 = 0u;
          __int128 v51 = 0u;
          __int128 v52 = 0u;
          id v16 = v15;
          id v17 = [v16 countByEnumeratingWithState:&v51 objects:v60 count:16];
          if (v17)
          {
            id v18 = v17;
            uint64_t v19 = *(void *)v52;
            do
            {
              for (j = 0LL; j != v18; j = (char *)j + 1)
              {
                if (*(void *)v52 != v19) {
                  objc_enumerationMutation(v16);
                }
                id v21 = *(void **)(*((void *)&v51 + 1) + 8LL * (void)j);
                if (v21)
                {

                  if (v22)
                  {
                    id v23 = (void *)objc_claimAutoreleasedReturnValue([v21 label]);
                    id v24 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler dataSource](self, "dataSource"));
                    id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 coreTelephonyDataSource]);
                    id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 allRelevantISOCountryCodes]);
                    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( -[StartCallIntentHandler _inPersonsFromContact:withRequestedType:requestedLabel:isoCountryCodes:]( self,  "_inPersonsFromContact:withRequestedType:requestedLabel:isoCountryCodes:",  v50,  a5,  v23,  v26));

                    -[NSMutableArray addObjectsFromArray:](v49, "addObjectsFromArray:", v27);
                  }
                }
              }

              id v18 = [v16 countByEnumeratingWithState:&v51 objects:v60 count:16];
            }

            while (v18);
          }

          os_signpost_id_t v15 = v46;
          i = v47;
        }

        if (v42)
        {
          id v28 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler dataSource](self, "dataSource"));
          id v29 = (void *)objc_claimAutoreleasedReturnValue([v28 coreTelephonyDataSource]);
          id v30 = (void *)objc_claimAutoreleasedReturnValue([v29 allRelevantISOCountryCodes]);
          uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue( -[StartCallIntentHandler _inPersonsFromContact:withRequestedType:requestedLabel:isoCountryCodes:]( self,  "_inPersonsFromContact:withRequestedType:requestedLabel:isoCountryCodes:",  v50,  a5,  INPersonHandleLabelMobile,  v30));

          -[NSMutableArray addObjectsFromArray:](v49, "addObjectsFromArray:", v31);
        }

        if (v43)
        {
          uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler dataSource](self, "dataSource"));
          int64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v32 coreTelephonyDataSource]);
          id v34 = (void *)objc_claimAutoreleasedReturnValue([v33 allRelevantISOCountryCodes]);
          uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue( -[StartCallIntentHandler _inPersonsFromContact:withRequestedType:requestedLabel:isoCountryCodes:]( self,  "_inPersonsFromContact:withRequestedType:requestedLabel:isoCountryCodes:",  v50,  a5,  INPersonHandleLabeliPhone,  v34));

          -[NSMutableArray addObjectsFromArray:](v49, "addObjectsFromArray:", v35);
        }
      }

      id v45 = [obj countByEnumeratingWithState:&v55 objects:v61 count:16];
    }

    while (v45);
  }

  id v36 = -[NSMutableArray copy](v49, "copy");
  unsigned int v37 = (void *)objc_claimAutoreleasedReturnValue(+[INPersonDeduplicator dedupeINPersons:](&OBJC_CLASS___INPersonDeduplicator, "dedupeINPersons:", v36));

  return v37;
}

- (id)resolutionResultForPersonWithResolvedHandleValue:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 personHandle]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 value]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler dataSource](self, "dataSource"));
  unsigned int v8 = [v7 isMMIOrUSSDNumber:v6];

  if (v8)
  {
    id v9 = IntentHandlerDefaultLog();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 138412546;
      id v23 = v6;
      __int16 v24 = 2112;
      id v25 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Handle %@ is MMI or USSD which is unsupported. Returning error for person: %@",  (uint8_t *)&v22,  0x16u);
    }

    uint64_t v11 = objc_claimAutoreleasedReturnValue( +[INStartCallContactResolutionResult unsupportedForReason:]( &OBJC_CLASS___INStartCallContactResolutionResult,  "unsupportedForReason:",  5LL));
LABEL_9:
    id v16 = (void *)v11;
    goto LABEL_13;
  }

  unsigned int v12 = -[StartCallIntentHandler shouldRequireInvalidNumberConfirmationForRecipient:]( self,  "shouldRequireInvalidNumberConfirmationForRecipient:",  v4);
  id v13 = IntentHandlerDefaultLog();
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (v15)
    {
      LOWORD(v22) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "The user requested a potentially invalid phone number or email, returning confirmationRequired.",  (uint8_t *)&v22,  2u);
    }

    uint64_t v11 = objc_claimAutoreleasedReturnValue( +[INStartCallContactResolutionResult confirmationRequiredWithPersonToConfirm:forReason:]( &OBJC_CLASS___INStartCallContactResolutionResult,  "confirmationRequiredWithPersonToConfirm:forReason:",  v4,  1LL));
    goto LABEL_9;
  }

  if (v15)
  {
    LOWORD(v22) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "There is a handle on the single contact. Format the person handle and return success with that person.",  (uint8_t *)&v22,  2u);
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler dataSource](self, "dataSource"));
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 coreTelephonyDataSource]);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 allRelevantISOCountryCodes]);
  BOOL v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tu_personWithFormattedHandleForISOCountryCodes:", v19));

  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[INStartCallContactResolutionResult successWithResolvedPerson:]( &OBJC_CLASS___INStartCallContactResolutionResult,  "successWithResolvedPerson:",  v20));
LABEL_13:

  return v16;
}

- (id)resolutionResultForPersonWithResolvedContactName:(id)a3 resolvedPerson:(id)a4 resolvedContact:(id)a5 contactIdentifiersRequiringConfirmation:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (-[StartCallIntentHandler shouldRequireUnknownRecipientConfirmationForRequestedRecipient:resolvedToRecipient:contact:]( self,  "shouldRequireUnknownRecipientConfirmationForRequestedRecipient:resolvedToRecipient:contact:",  a3,  v10,  v11))
  {
    id v13 = IntentHandlerDefaultLog();
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v25 = 138412290;
      id v26 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Returning confirmationRequired with person: %@",  (uint8_t *)&v25,  0xCu);
    }

    id v15 = v10;
    uint64_t v16 = 4LL;
LABEL_9:
    uint64_t v22 = objc_claimAutoreleasedReturnValue( +[INStartCallContactResolutionResult confirmationRequiredWithPersonToConfirm:forReason:]( &OBJC_CLASS___INStartCallContactResolutionResult,  "confirmationRequiredWithPersonToConfirm:forReason:",  v15,  v16));
    goto LABEL_13;
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
  unsigned int v18 = [v12 containsObject:v17];

  id v19 = IntentHandlerDefaultLog();
  BOOL v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
  if (v18)
  {
    if (v21)
    {
      int v25 = 138412290;
      id v26 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Returning confirmationRequired with person (as upstream contact resolver recommended): %@",  (uint8_t *)&v25,  0xCu);
    }

    id v15 = v10;
    uint64_t v16 = 3LL;
    goto LABEL_9;
  }

  if (v21)
  {
    int v25 = 138412290;
    id v26 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Returning success with person: %@",  (uint8_t *)&v25,  0xCu);
  }

  uint64_t v22 = objc_claimAutoreleasedReturnValue( +[INStartCallContactResolutionResult successWithResolvedPerson:]( &OBJC_CLASS___INStartCallContactResolutionResult,  "successWithResolvedPerson:",  v10));
LABEL_13:
  id v23 = (void *)v22;

  return v23;
}

- (id)resolvePreferredHandleFromHandles:(id)a3 contactIdentifiersRequiringConfirmation:(id)a4 telephonyOnly:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler dataSource](self, "dataSource"));
  unsigned int v11 = [v10 useLegacyHandleResolution];

  id v12 = IntentHandlerDefaultLog();
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  id v14 = v13;
  if (v11)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Using legacy handle resolution.", buf, 2u);
    }

    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[INStartCallContactResolutionResult disambiguationWithPeopleToDisambiguate:]( &OBJC_CLASS___INStartCallContactResolutionResult,  "disambiguationWithPeopleToDisambiguate:",  v8));
  }

  else
  {
    os_signpost_id_t v16 = os_signpost_id_generate(v13);

    id v17 = IntentHandlerDefaultLog();
    unsigned int v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    id v19 = v18;
    unint64_t v72 = v16 - 1;
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v19,  OS_SIGNPOST_INTERVAL_BEGIN,  v16,  "scoreBasedHandleResolution",  (const char *)&unk_1000275CF,  buf,  2u);
    }

    os_signpost_id_t spid = v16;

    id v20 = IntentHandlerDefaultLog();
    BOOL v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Beginning score based handle resolution.",  buf,  2u);
    }

    id v76 = v9;

    uint64_t v22 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
    id v23 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    id v73 = v8;
    +[StartCallIntentHandlerUtilities populatePersonsByTUHandleFrom:personsByTUHandle:tuHandleOrderedSet:]( &OBJC_CLASS___StartCallIntentHandlerUtilities,  "populatePersonsByTUHandleFrom:personsByTUHandle:tuHandleOrderedSet:",  v8,  v23,  v22);
    uint64_t v71 = v22;
    uint64_t v24 = objc_claimAutoreleasedReturnValue(-[NSMutableOrderedSet array](v22, "array"));
    int v25 = -[ScoreBasedResolver initWithEntities:]( objc_alloc(&OBJC_CLASS___ScoreBasedResolver),  "initWithEntities:",  v24);
    -[ScoreBasedResolver setConfirmationEnabled:](v25, "setConfirmationEnabled:", 0LL);
    -[ScoreBasedResolver setConfirmationMargin:](v25, "setConfirmationMargin:", 2LL);
    -[ScoreBasedResolver setSuccessfulResolutionMargin:](v25, "setSuccessfulResolutionMargin:", 4LL);
    -[StartCallIntentHandler updateScoreBasedHandleResolver:forRecentCallsMatchingHandles:telephonyOnly:]( self,  "updateScoreBasedHandleResolver:forRecentCallsMatchingHandles:telephonyOnly:",  v25,  v24,  v5);
    BOOL v74 = (void *)v24;
    -[StartCallIntentHandler updateScoreBasedHandleResolver:forFavoritesAmongHandles:]( self,  "updateScoreBasedHandleResolver:forFavoritesAmongHandles:",  v25,  v24);
    id v75 = v25;
    id v26 = (void *)objc_claimAutoreleasedReturnValue(-[ScoreBasedResolver result](v25, "result"));
    id v27 = IntentHandlerDefaultLog();
    id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Completed score based handle resolution.",  buf,  2u);
    }

    __int128 v84 = 0u;
    __int128 v85 = 0u;
    __int128 v82 = 0u;
    __int128 v83 = 0u;
    id v77 = v26;
    id v29 = (void *)objc_claimAutoreleasedReturnValue([v26 resolutionSummary]);
    id v30 = [v29 countByEnumeratingWithState:&v82 objects:v89 count:16];
    if (v30)
    {
      id v31 = v30;
      uint64_t v32 = *(void *)v83;
      do
      {
        for (i = 0LL; i != v31; i = (char *)i + 1)
        {
          if (*(void *)v83 != v32) {
            objc_enumerationMutation(v29);
          }
          id v34 = *(void **)(*((void *)&v82 + 1) + 8LL * (void)i);
          id v35 = IntentHandlerDefaultLog();
          id v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v88 = v34;
            _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
          }
        }

        id v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v82, v89, 16, spid);
      }

      while (v31);
    }

    unsigned int v37 = v77;
    switch((unint64_t)[v77 resolutionResultType])
    {
      case 0uLL:
        id v38 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  @"Unexpected score based handle resolution result type.",  0LL));
        -[NSMutableArray raise](v38, "raise");
        id v15 = 0LL;
        goto LABEL_53;
      case 1uLL:
        unsigned int v42 = (void *)objc_claimAutoreleasedReturnValue([v77 resolvedEntities]);
        id v38 = (NSMutableArray *)objc_claimAutoreleasedReturnValue([v42 firstObject]);

        unsigned int v43 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v23, "objectForKeyedSubscript:", v38));
        if (!v43)
        {
          unint64_t v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  @"Persons matching resolved handle should not be nil.",  0LL));
          [v44 raise];
        }

        if ((unint64_t)objc_msgSend(v43, "count", spid) >= 2)
        {
          id v45 = IntentHandlerDefaultLog();
          id v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v88 = v43;
            _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_DEFAULT,  "[WARN] More than one INPerson matches the same handle (e.g. multiple labels with the same number). As eith er handle will produce the same result, resolving to the first one. %@",  buf,  0xCu);
          }
        }

        uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue([v43 firstObject]);
        id v48 = (void *)objc_claimAutoreleasedReturnValue([v47 contactIdentifier]);
        if ([v9 containsObject:v48]) {
          uint64_t v49 = objc_claimAutoreleasedReturnValue( +[INStartCallContactResolutionResult confirmationRequiredWithPersonToConfirm:forReason:]( &OBJC_CLASS___INStartCallContactResolutionResult,  "confirmationRequiredWithPersonToConfirm:forReason:",  v47,  2LL));
        }
        else {
          uint64_t v49 = objc_claimAutoreleasedReturnValue( +[INStartCallContactResolutionResult successWithResolvedPerson:]( &OBJC_CLASS___INStartCallContactResolutionResult,  "successWithResolvedPerson:",  v47));
        }
        id v15 = (void *)v49;
        BOOL v40 = v71;
        unint64_t v39 = v72;

        id v8 = v73;
        goto LABEL_56;
      case 2uLL:
        id v50 = (void *)objc_claimAutoreleasedReturnValue([v77 resolvedEntities]);
        id v38 = (NSMutableArray *)objc_claimAutoreleasedReturnValue([v50 firstObject]);

        __int128 v51 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v23, "objectForKeyedSubscript:", v38));
        if (!v51)
        {
          __int128 v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  @"Persons matching handle to confirm should not be nil.",  0LL));
          [v52 raise];
        }

        if ((unint64_t)objc_msgSend(v51, "count", spid) >= 2)
        {
          id v53 = IntentHandlerDefaultLog();
          __int128 v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
          if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v88 = v51;
            _os_log_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_DEFAULT,  "[WARN] More than one INPerson matches the same handle (e.g. multiple labels with the same number). As eith er handle will produce the same result, confirming just the first one. %@",  buf,  0xCu);
          }
        }

        __int128 v55 = (void *)objc_claimAutoreleasedReturnValue([v51 firstObject]);
        id v15 = (void *)objc_claimAutoreleasedReturnValue( +[INStartCallContactResolutionResult confirmationRequiredWithPersonToConfirm:forReason:]( &OBJC_CLASS___INStartCallContactResolutionResult,  "confirmationRequiredWithPersonToConfirm:forReason:",  v55,  2LL));

        goto LABEL_53;
      case 3uLL:
        id v38 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
        __int128 v78 = 0u;
        __int128 v79 = 0u;
        __int128 v80 = 0u;
        __int128 v81 = 0u;
        __int128 v56 = (void *)objc_claimAutoreleasedReturnValue([v77 resolvedEntities]);
        id v57 = [v56 countByEnumeratingWithState:&v78 objects:v86 count:16];
        if (v57)
        {
          id v58 = v57;
          uint64_t v59 = *(void *)v79;
          do
          {
            for (j = 0LL; j != v58; j = (char *)j + 1)
            {
              if (*(void *)v79 != v59) {
                objc_enumerationMutation(v56);
              }
              BOOL v61 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v23,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v78 + 1) + 8LL * (void)j),  spid));
              if (!v61)
              {
                id v62 = (void *)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  @"Persons matching handle to disambiguate should not be nil.",  0LL));
                [v62 raise];
              }

              if ((unint64_t)[v61 count] >= 2)
              {
                id v63 = IntentHandlerDefaultLog();
                v64 = (os_log_s *)objc_claimAutoreleasedReturnValue(v63);
                if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  id v88 = v61;
                  _os_log_impl( (void *)&_mh_execute_header,  v64,  OS_LOG_TYPE_DEFAULT,  "[WARN] More than one INPerson matches the same handle (e.g. multiple labels with the same number). I ncluding those multiples in the disambiguation list. %@",  buf,  0xCu);
                }
              }

              -[NSMutableArray addObjectsFromArray:](v38, "addObjectsFromArray:", v61);
            }

            id v58 = [v56 countByEnumeratingWithState:&v78 objects:v86 count:16];
          }

          while (v58);
        }

        id v65 = -[NSMutableArray copy](v38, "copy");
        id v15 = (void *)objc_claimAutoreleasedReturnValue( +[INStartCallContactResolutionResult disambiguationWithPeopleToDisambiguate:]( &OBJC_CLASS___INStartCallContactResolutionResult,  "disambiguationWithPeopleToDisambiguate:",  v65));

        id v9 = v76;
LABEL_53:
        BOOL v40 = v71;
        unint64_t v39 = v72;
LABEL_56:

        uint64_t v41 = v74;
        unsigned int v37 = v77;
        break;
      default:
        id v15 = 0LL;
        unint64_t v39 = v72;
        BOOL v40 = v71;
        uint64_t v41 = v74;
        break;
    }

    id v66 = IntentHandlerDefaultLog();
    v67 = (os_log_s *)objc_claimAutoreleasedReturnValue(v66);
    id v68 = v67;
    if (v39 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v67))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v68,  OS_SIGNPOST_INTERVAL_END,  spid,  "scoreBasedHandleResolution",  (const char *)&unk_1000275CF,  buf,  2u);
    }
  }

  return v15;
}

- (id)allCountryCodesRelevantToCall:(id)a3
{
  id v4 = a3;
  BOOL v5 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 isoCountryCode]);

  if ([v6 length]) {
    -[NSMutableOrderedSet addObject:](v5, "addObject:", v6);
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler dataSource](self, "dataSource"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 coreTelephonyDataSource]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 allRelevantISOCountryCodes]);
  -[NSMutableOrderedSet addObjectsFromArray:](v5, "addObjectsFromArray:", v9);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableOrderedSet array](v5, "array"));
  return v10;
}

- (void)updateScoreBasedHandleResolver:(id)a3 forRecentCallsMatchingHandles:(id)a4 telephonyOnly:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v51 = a4;
  id v8 = IntentHandlerDefaultLog();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  os_signpost_id_t v10 = os_signpost_id_generate(v9);

  id v11 = IntentHandlerDefaultLog();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  id v13 = v12;
  unint64_t v14 = v10 - 1;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v13,  OS_SIGNPOST_INTERVAL_BEGIN,  v10,  "recentCallsMatchingHandles",  (const char *)&unk_1000275CF,  buf,  2u);
  }

  id v15 = IntentHandlerDefaultLog();
  os_signpost_id_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Beginning call recency for handles check.",  buf,  2u);
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue( -[StartCallIntentHandler recentCallsWithHandles:telephonyOnly:]( self,  "recentCallsWithHandles:telephonyOnly:",  v51,  v5));
  if ([v17 count])
  {
    unint64_t v42 = v10 - 1;
    os_signpost_id_t v43 = v10;
    unint64_t v44 = v7;
    id v57 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
    __int128 v71 = 0u;
    __int128 v72 = 0u;
    __int128 v73 = 0u;
    __int128 v74 = 0u;
    uint64_t v41 = v17;
    id obj = v17;
    id v48 = [obj countByEnumeratingWithState:&v71 objects:v84 count:16];
    if (v48)
    {
      uint64_t v46 = *(void *)v72;
      do
      {
        uint64_t v18 = 0LL;
        do
        {
          if (*(void *)v72 != v46) {
            objc_enumerationMutation(obj);
          }
          uint64_t v49 = v18;
          id v19 = *(void **)(*((void *)&v71 + 1) + 8 * v18);
          id v58 = (void *)objc_claimAutoreleasedReturnValue( -[StartCallIntentHandler allCountryCodesRelevantToCall:]( self,  "allCountryCodesRelevantToCall:",  v19,  v41));
          __int128 v67 = 0u;
          __int128 v68 = 0u;
          __int128 v69 = 0u;
          __int128 v70 = 0u;
          __int128 v55 = v19;
          id v50 = (id)objc_claimAutoreleasedReturnValue([v19 remoteParticipantHandles]);
          id v53 = [v50 countByEnumeratingWithState:&v67 objects:v83 count:16];
          if (v53)
          {
            uint64_t v52 = *(void *)v68;
            do
            {
              uint64_t v20 = 0LL;
              do
              {
                if (*(void *)v68 != v52) {
                  objc_enumerationMutation(v50);
                }
                uint64_t v54 = v20;
                BOOL v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v67 + 1) + 8 * v20), "tu_tuHandle"));
                __int128 v63 = 0u;
                __int128 v64 = 0u;
                __int128 v65 = 0u;
                __int128 v66 = 0u;
                id v56 = v51;
                id v22 = [v56 countByEnumeratingWithState:&v63 objects:v82 count:16];
                if (v22)
                {
                  id v23 = v22;
                  uint64_t v24 = *(void *)v64;
                  do
                  {
                    for (i = 0LL; i != v23; i = (char *)i + 1)
                    {
                      if (*(void *)v64 != v24) {
                        objc_enumerationMutation(v56);
                      }
                      id v26 = *(void **)(*((void *)&v63 + 1) + 8LL * (void)i);
                      __int128 v59 = 0u;
                      __int128 v60 = 0u;
                      __int128 v61 = 0u;
                      __int128 v62 = 0u;
                      id v27 = v58;
                      id v28 = [v27 countByEnumeratingWithState:&v59 objects:v81 count:16];
                      if (v28)
                      {
                        id v29 = v28;
                        uint64_t v30 = *(void *)v60;
                        while (2)
                        {
                          for (j = 0LL; j != v29; j = (char *)j + 1)
                          {
                            if (*(void *)v60 != v30) {
                              objc_enumerationMutation(v27);
                            }
                            uint64_t v32 = *(void *)(*((void *)&v59 + 1) + 8LL * (void)j);
                            if ([v26 isCanonicallyEqualToHandle:v21 isoCountryCode:v32])
                            {
                              id v33 = IntentHandlerDefaultLog();
                              id v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
                              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
                              {
                                *(_DWORD *)buf = 138412802;
                                id v76 = v26;
                                __int16 v77 = 2112;
                                __int128 v78 = v55;
                                __int16 v79 = 2112;
                                uint64_t v80 = v32;
                                _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "Handle %@ was a partipant in recent call %@ with country code %@.",  buf,  0x20u);
                              }

                              -[NSMutableOrderedSet addObject:](v57, "addObject:", v26);
                              goto LABEL_34;
                            }
                          }

                          id v29 = [v27 countByEnumeratingWithState:&v59 objects:v81 count:16];
                          if (v29) {
                            continue;
                          }
                          break;
                        }
                      }

- (void)updateScoreBasedHandleResolver:(id)a3 forFavoritesAmongHandles:(id)a4
{
  id v34 = a3;
  id v6 = a4;
  id v7 = IntentHandlerDefaultLog();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  id v10 = IntentHandlerDefaultLog();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  id v12 = v11;
  os_signpost_id_t spid = v9;
  unint64_t v33 = v9 - 1;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v12,  OS_SIGNPOST_INTERVAL_BEGIN,  v9,  "favoritesAmongHandles",  (const char *)&unk_1000275CF,  buf,  2u);
  }

  id v13 = IntentHandlerDefaultLog();
  unint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Beginning favorites for handles check.",  buf,  2u);
  }

  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  id obj = v6;
  id v15 = [obj countByEnumeratingWithState:&v37 objects:v43 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v36 = *(void *)v38;
    do
    {
      for (i = 0LL; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v38 != v36) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void *)(*((void *)&v37 + 1) + 8LL * (void)i);
        id v19 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler dataSource](self, "dataSource", spid));
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 favoritesDataSource]);
        BOOL v21 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler dataSource](self, "dataSource"));
        id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 coreTelephonyDataSource]);
        id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 allRelevantISOCountryCodes]);
        unsigned int v24 = [v20 hasFavoritesEntryForTelephonyCallWithPhoneNumber:v18 isoCountryCodes:v23];

        if (v24)
        {
          [v34 addScore:4 forEntity:v18 reason:@"Favorites entry for telephony call with this handle"];
        }

        else
        {
          id v25 = IntentHandlerDefaultLog();
          id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v42 = v18;
            _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "No favorites entry for handle %@. No score adjustment.",  buf,  0xCu);
          }
        }
      }

      id v16 = [obj countByEnumeratingWithState:&v37 objects:v43 count:16];
    }

    while (v16);
  }

  id v27 = IntentHandlerDefaultLog();
  id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Completed favorites for handles check.",  buf,  2u);
  }

  id v29 = IntentHandlerDefaultLog();
  uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
  id v31 = v30;
  if (v33 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v31,  OS_SIGNPOST_INTERVAL_END,  spid,  "favoritesAmongHandles",  (const char *)&unk_1000275CF,  buf,  2u);
  }
}

- (id)resolvePreferredContactFromContacts:(id)a3
{
  id v4 = a3;
  id v5 = IntentHandlerDefaultLog();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  os_signpost_id_t v7 = os_signpost_id_generate(v6);

  id v8 = IntentHandlerDefaultLog();
  os_signpost_id_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = v9;
  unint64_t v44 = v7 - 1;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v10,  OS_SIGNPOST_INTERVAL_BEGIN,  v7,  "scoreBasedContactResolution",  (const char *)&unk_1000275CF,  buf,  2u);
  }

  os_signpost_id_t spid = v7;

  id v11 = IntentHandlerDefaultLog();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Beginning score based contact resolution.",  buf,  2u);
  }

  id v13 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  unint64_t v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  id v15 = v4;
  id v16 = [v15 countByEnumeratingWithState:&v49 objects:v56 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v50;
    do
    {
      for (i = 0LL; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v50 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void **)(*((void *)&v49 + 1) + 8LL * (void)i);
        BOOL v21 = (void *)objc_claimAutoreleasedReturnValue([v20 identifier]);
        -[NSMutableArray addObject:](v13, "addObject:", v21);
        -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", v20, v21);
      }

      id v17 = [v15 countByEnumeratingWithState:&v49 objects:v56 count:16];
    }

    while (v17);
  }

  id v22 = objc_alloc(&OBJC_CLASS___ScoreBasedResolver);
  id v23 = -[NSMutableArray copy](v13, "copy");
  unsigned int v24 = -[ScoreBasedResolver initWithEntities:](v22, "initWithEntities:", v23);

  -[ScoreBasedResolver setConfirmationEnabled:](v24, "setConfirmationEnabled:", 0LL);
  -[ScoreBasedResolver setConfirmationMargin:](v24, "setConfirmationMargin:", 2LL);
  -[ScoreBasedResolver setSuccessfulResolutionMargin:](v24, "setSuccessfulResolutionMargin:", 4LL);
  -[StartCallIntentHandler updateScoreBasedContactResolver:forRecentCallsMatchingContacts:]( self,  "updateScoreBasedContactResolver:forRecentCallsMatchingContacts:",  v24,  v15);
  os_signpost_id_t v43 = v15;
  -[StartCallIntentHandler updateScoreBasedContactResolver:forFavoritesAmongContacts:]( self,  "updateScoreBasedContactResolver:forFavoritesAmongContacts:",  v24,  v15);
  uint64_t v42 = v24;
  id v25 = (void *)objc_claimAutoreleasedReturnValue(-[ScoreBasedResolver result](v24, "result"));
  id v26 = IntentHandlerDefaultLog();
  id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Completed score based contact resolution.",  buf,  2u);
  }

  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  id v41 = v25;
  id v28 = (void *)objc_claimAutoreleasedReturnValue([v25 resolutionSummary]);
  id v29 = [v28 countByEnumeratingWithState:&v45 objects:v55 count:16];
  if (v29)
  {
    id v30 = v29;
    uint64_t v31 = *(void *)v46;
    do
    {
      for (j = 0LL; j != v30; j = (char *)j + 1)
      {
        if (*(void *)v46 != v31) {
          objc_enumerationMutation(v28);
        }
        uint64_t v33 = *(void *)(*((void *)&v45 + 1) + 8LL * (void)j);
        id v34 = IntentHandlerDefaultLog();
        id v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v54 = v33;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
        }
      }

      id v30 = [v28 countByEnumeratingWithState:&v45 objects:v55 count:16];
    }

    while (v30);
  }

  id v36 = IntentHandlerDefaultLog();
  __int128 v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
  __int128 v38 = v37;
  if (v44 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v38,  OS_SIGNPOST_INTERVAL_END,  spid,  "scoreBasedContactResolution",  (const char *)&unk_1000275CF,  buf,  2u);
  }

  return v41;
}

- (void)updateScoreBasedContactResolver:(id)a3 forRecentCallsMatchingContacts:(id)a4
{
  id v55 = a3;
  id v5 = a4;
  id v6 = IntentHandlerDefaultLog();
  os_signpost_id_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  os_signpost_id_t v8 = os_signpost_id_generate(v7);

  id v9 = IntentHandlerDefaultLog();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  id v11 = v10;
  os_signpost_id_t spid = v8;
  unint64_t v54 = v8 - 1;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v11,  OS_SIGNPOST_INTERVAL_BEGIN,  v8,  "contactCallRecency",  (const char *)&unk_1000275CF,  buf,  2u);
  }

  id v12 = IntentHandlerDefaultLog();
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Beginning call recency for contacts check.",  buf,  2u);
  }

  __int128 v64 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
  __int128 v69 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v101 = 0u;
  __int128 v102 = 0u;
  __int128 v103 = 0u;
  __int128 v104 = 0u;
  id obj = v5;
  id v76 = [obj countByEnumeratingWithState:&v101 objects:v117 count:16];
  if (v76)
  {
    id v74 = *(id *)v102;
    do
    {
      for (i = 0LL; i != v76; i = (char *)i + 1)
      {
        if (*(id *)v102 != v74) {
          objc_enumerationMutation(obj);
        }
        id v15 = *(void **)(*((void *)&v101 + 1) + 8LL * (void)i);
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 allTUHandles]);
        if ([v16 count])
        {
          -[NSMutableOrderedSet addObjectsFromArray:](v64, "addObjectsFromArray:", v16);
          __int128 v99 = 0u;
          __int128 v100 = 0u;
          __int128 v97 = 0u;
          __int128 v98 = 0u;
          id v17 = v16;
          id v18 = [v17 countByEnumeratingWithState:&v97 objects:v116 count:16];
          if (v18)
          {
            id v19 = v18;
            uint64_t v20 = *(void *)v98;
            do
            {
              for (j = 0LL; j != v19; j = (char *)j + 1)
              {
                if (*(void *)v98 != v20) {
                  objc_enumerationMutation(v17);
                }
                uint64_t v22 = *(void *)(*((void *)&v97 + 1) + 8LL * (void)j);
                id v23 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v69,  "objectForKeyedSubscript:",  v22));
                if (!v23)
                {
                  id v23 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
                  -[NSMutableDictionary setObject:forKeyedSubscript:](v69, "setObject:forKeyedSubscript:", v23, v22);
                }

                -[NSMutableArray addObject:](v23, "addObject:", v15);
              }

              id v19 = [v17 countByEnumeratingWithState:&v97 objects:v116 count:16];
            }

            while (v19);
          }
        }
      }

      id v76 = [obj countByEnumeratingWithState:&v101 objects:v117 count:16];
    }

    while (v76);
  }

  unsigned int v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableOrderedSet array](v64, "array"));
  id v25 = (void *)objc_claimAutoreleasedReturnValue( -[StartCallIntentHandler recentCallsWithHandles:telephonyOnly:]( self,  "recentCallsWithHandles:telephonyOnly:",  v24,  0LL));

  if ([v25 count])
  {
    id v26 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
    __int128 v93 = 0u;
    __int128 v94 = 0u;
    __int128 v95 = 0u;
    __int128 v96 = 0u;
    id v56 = v25;
    id v60 = [v56 countByEnumeratingWithState:&v93 objects:v115 count:16];
    if (v60)
    {
      uint64_t v58 = *(void *)v94;
      do
      {
        uint64_t v27 = 0LL;
        do
        {
          if (*(void *)v94 != v58) {
            objc_enumerationMutation(v56);
          }
          uint64_t v61 = v27;
          id v28 = *(void **)(*((void *)&v93 + 1) + 8 * v27);
          __int128 v70 = (void *)objc_claimAutoreleasedReturnValue( -[StartCallIntentHandler allCountryCodesRelevantToCall:]( self,  "allCountryCodesRelevantToCall:",  v28));
          __int128 v89 = 0u;
          __int128 v90 = 0u;
          __int128 v91 = 0u;
          __int128 v92 = 0u;
          id v62 = (id)objc_claimAutoreleasedReturnValue([v28 remoteParticipantHandles]);
          id v65 = [v62 countByEnumeratingWithState:&v89 objects:v114 count:16];
          if (v65)
          {
            uint64_t v63 = *(void *)v90;
            do
            {
              uint64_t v29 = 0LL;
              do
              {
                if (*(void *)v90 != v63) {
                  objc_enumerationMutation(v62);
                }
                uint64_t v66 = v29;
                id v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v89 + 1) + 8 * v29), "tu_tuHandle"));
                __int128 v85 = 0u;
                __int128 v86 = 0u;
                __int128 v87 = 0u;
                __int128 v88 = 0u;
                __int128 v67 = v64;
                id v72 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:]( v67,  "countByEnumeratingWithState:objects:count:",  &v85,  v113,  16LL);
                if (v72)
                {
                  uint64_t v71 = *(void *)v86;
                  __int128 v68 = v30;
                  do
                  {
                    for (k = 0LL; k != v72; k = (char *)k + 1)
                    {
                      if (*(void *)v86 != v71) {
                        objc_enumerationMutation(v67);
                      }
                      uint64_t v32 = *(void **)(*((void *)&v85 + 1) + 8LL * (void)k);
                      __int128 v81 = 0u;
                      __int128 v82 = 0u;
                      __int128 v83 = 0u;
                      __int128 v84 = 0u;
                      id v75 = v70;
                      id v33 = [v75 countByEnumeratingWithState:&v81 objects:v112 count:16];
                      if (v33)
                      {
                        id v34 = v33;
                        uint64_t v35 = *(void *)v82;
                        while (2)
                        {
                          for (m = 0LL; m != v34; m = (char *)m + 1)
                          {
                            if (*(void *)v82 != v35) {
                              objc_enumerationMutation(v75);
                            }
                            uint64_t v37 = *(void *)(*((void *)&v81 + 1) + 8LL * (void)m);
                            if ([v32 isCanonicallyEqualToHandle:v30 isoCountryCode:v37])
                            {
                              __int128 v73 = k;
                              __int128 v38 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v69,  "objectForKeyedSubscript:",  v32));
                              __int128 v77 = 0u;
                              __int128 v78 = 0u;
                              __int128 v79 = 0u;
                              __int128 v80 = 0u;
                              id v39 = [v38 countByEnumeratingWithState:&v77 objects:v111 count:16];
                              if (v39)
                              {
                                id v40 = v39;
                                uint64_t v41 = *(void *)v78;
                                do
                                {
                                  for (n = 0LL; n != v40; n = (char *)n + 1)
                                  {
                                    if (*(void *)v78 != v41) {
                                      objc_enumerationMutation(v38);
                                    }
                                    os_signpost_id_t v43 = *(void **)(*((void *)&v77 + 1) + 8LL * (void)n);
                                    id v44 = IntentHandlerDefaultLog();
                                    __int128 v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
                                    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
                                    {
                                      *(_DWORD *)buf = 138412802;
                                      __int128 v106 = v43;
                                      __int16 v107 = 2112;
                                      v108 = v28;
                                      __int16 v109 = 2112;
                                      uint64_t v110 = v37;
                                      _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEFAULT,  "Contact %@ was a partipant in recent call %@ with isoCountryCode %@.",  buf,  0x20u);
                                    }

                                    __int128 v46 = (void *)objc_claimAutoreleasedReturnValue([v43 identifier]);
                                    -[NSMutableOrderedSet addObject:](v26, "addObject:", v46);
                                  }

                                  id v40 = [v38 countByEnumeratingWithState:&v77 objects:v111 count:16];
                                }

                                while (v40);
                              }

                              id v30 = v68;
                              k = v73;
                              goto LABEL_59;
                            }
                          }

                          id v34 = [v75 countByEnumeratingWithState:&v81 objects:v112 count:16];
                          if (v34) {
                            continue;
                          }
                          break;
                        }
                      }

- (id)recentCallsWithHandles:(id)a3 telephonyOnly:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = IntentHandlerDefaultLog();
  os_signpost_id_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  id v10 = IntentHandlerDefaultLog();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  id v12 = v11;
  unint64_t v76 = v9 - 1;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v12,  OS_SIGNPOST_INTERVAL_BEGIN,  v9,  "recentCallsWithHandles",  (const char *)&unk_1000275CF,  buf,  2u);
  }

  os_signpost_id_t spid = v9;

  id v13 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler dataSource](self, "dataSource"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 coreTelephonyDataSource]);
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 allRelevantISOCountryCodes]);
  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[CallHistoryDataSourcePredicate predicateForCallsWithAnyOfTheseRemoteParticipantHandles:isoCountryCodes:]( &OBJC_CLASS___CallHistoryDataSourcePredicate,  "predicateForCallsWithAnyOfTheseRemoteParticipantHandles:isoCountryCodes:",  v6,  v16));

  -[NSMutableArray addObject:](v13, "addObject:", v17);
  if (v4) {
    uint64_t v18 = objc_claimAutoreleasedReturnValue( +[CallHistoryDataSourcePredicate predicateForTelephonyCalls]( &OBJC_CLASS___CallHistoryDataSourcePredicate,  "predicateForTelephonyCalls"));
  }
  else {
    uint64_t v18 = objc_claimAutoreleasedReturnValue( +[CallHistoryDataSourcePredicate predicateForTelephonyOrFaceTimeCalls]( &OBJC_CLASS___CallHistoryDataSourcePredicate,  "predicateForTelephonyOrFaceTimeCalls"));
  }
  id v19 = (void *)v18;
  -[NSMutableArray addObject:](v13, "addObject:", v18);

  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[CallHistoryDataSourcePredicate predicateForCallsWithDurationLongerThanImmediateHangUp]( &OBJC_CLASS___CallHistoryDataSourcePredicate,  "predicateForCallsWithDurationLongerThanImmediateHangUp"));
  -[NSMutableArray addObject:](v13, "addObject:", v20);

  id v21 = -[NSMutableArray copy](v13, "copy");
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate andPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "andPredicateWithSubpredicates:",  v21));

  id v23 = IntentHandlerDefaultLog();
  unsigned int v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v78 = (uint64_t)v22;
    _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Searching call history for one call matching predicate: %@",  buf,  0xCu);
  }

  id v25 = IntentHandlerDefaultLog();
  id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
  os_signpost_id_t v27 = os_signpost_id_generate(v26);

  id v28 = IntentHandlerDefaultLog();
  uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
  id v30 = v29;
  if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v30,  OS_SIGNPOST_INTERVAL_BEGIN,  v27,  "callHistoryDBFirstRecencyCheck",  (const char *)&unk_1000275CF,  buf,  2u);
  }

  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler dataSource](self, "dataSource"));
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v31 callHistoryDataSource]);
  id v33 = (void *)objc_claimAutoreleasedReturnValue([v32 callsWithPredicate:v22 limit:1 offset:0 batchSize:1]);
  id v34 = (void *)objc_claimAutoreleasedReturnValue([v33 firstObject]);

  id v35 = IntentHandlerDefaultLog();
  id v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
  uint64_t v37 = v36;
  if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v37,  OS_SIGNPOST_INTERVAL_END,  v27,  "callHistoryDBFirstRecencyCheck",  (const char *)&unk_1000275CF,  buf,  2u);
  }

  id v38 = IntentHandlerDefaultLog();
  id v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v78 = (uint64_t)v34;
    _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "Completed initial call history search with result: %@",  buf,  0xCu);
  }

  if (v34)
  {
    id v40 = (void *)objc_claimAutoreleasedReturnValue([v34 date]);
    if (v40)
    {
      uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler dataSource](self, "dataSource"));
      uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue([v41 now]);
      [v40 timeIntervalSinceDate:v42];
      double v44 = v43;
    }

    else
    {
      double v44 = 0.0;
    }

    if (v44 * 4.0 <= -3600.0) {
      double v47 = v44 * 4.0;
    }
    else {
      double v47 = -3600.0;
    }
    id v48 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler dataSource](self, "dataSource"));
    __int128 v49 = (void *)objc_claimAutoreleasedReturnValue([v48 now]);
    id v50 = (void *)objc_claimAutoreleasedReturnValue([v49 dateByAddingTimeInterval:v47]);

    id v51 = IntentHandlerDefaultLog();
    __int128 v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v78 = (uint64_t)v50;
      __int16 v79 = 2048;
      double v80 = v44;
      _os_log_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_DEFAULT,  "Calculated oldest relevant date of %@ based on most recent matching call %.0f seconds ago",  buf,  0x16u);
    }

    id v53 = (void *)objc_claimAutoreleasedReturnValue( +[CallHistoryDataSourcePredicate predicateForCallsAfterDate:beforeDate:]( &OBJC_CLASS___CallHistoryDataSourcePredicate,  "predicateForCallsAfterDate:beforeDate:",  v50,  0LL));
    -[NSMutableArray addObject:](v13, "addObject:", v53);

    id v54 = -[NSMutableArray copy](v13, "copy");
    id v55 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate andPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "andPredicateWithSubpredicates:",  v54));

    id v56 = IntentHandlerDefaultLog();
    id v57 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      uint64_t v78 = 25LL;
      __int16 v79 = 2112;
      double v80 = *(double *)&v55;
      _os_log_impl( (void *)&_mh_execute_header,  v57,  OS_LOG_TYPE_DEFAULT,  "Searching call history for up to %ld calls matching predicate: %@",  buf,  0x16u);
    }

    id v58 = IntentHandlerDefaultLog();
    __int128 v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
    os_signpost_id_t v60 = os_signpost_id_generate(v59);

    id v61 = IntentHandlerDefaultLog();
    id v62 = (os_log_s *)objc_claimAutoreleasedReturnValue(v61);
    uint64_t v63 = v62;
    if (v60 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v62))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v63,  OS_SIGNPOST_INTERVAL_BEGIN,  v60,  "callHistoryDBSecondRecencyCheck",  (const char *)&unk_1000275CF,  buf,  2u);
    }

    __int128 v64 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler dataSource](self, "dataSource"));
    id v65 = (void *)objc_claimAutoreleasedReturnValue([v64 callHistoryDataSource]);
    __int128 v46 = (void *)objc_claimAutoreleasedReturnValue([v65 callsWithPredicate:v55 limit:25 offset:0 batchSize:25]);

    id v66 = IntentHandlerDefaultLog();
    __int128 v67 = (os_log_s *)objc_claimAutoreleasedReturnValue(v66);
    __int128 v68 = v67;
    if (v60 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v67))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v68,  OS_SIGNPOST_INTERVAL_END,  v60,  "callHistoryDBSecondRecencyCheck",  (const char *)&unk_1000275CF,  buf,  2u);
    }

    id v69 = IntentHandlerDefaultLog();
    __int128 v70 = (os_log_s *)objc_claimAutoreleasedReturnValue(v69);
    if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v78 = (uint64_t)v46;
      _os_log_impl( (void *)&_mh_execute_header,  v70,  OS_LOG_TYPE_DEFAULT,  "Completed second call history search with result: %@",  buf,  0xCu);
    }
  }

  else
  {
    id v45 = IntentHandlerDefaultLog();
    id v40 = (void *)objc_claimAutoreleasedReturnValue(v45);
    if (os_log_type_enabled((os_log_t)v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v40,  OS_LOG_TYPE_DEFAULT,  "No matching call history for any of the requested handles. No score adjustment.",  buf,  2u);
    }

    __int128 v46 = &__NSArray0__struct;
  }

  id v71 = IntentHandlerDefaultLog();
  id v72 = (os_log_s *)objc_claimAutoreleasedReturnValue(v71);
  __int128 v73 = v72;
  if (v76 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v72))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v73,  OS_SIGNPOST_INTERVAL_END,  spid,  "recentCallsWithHandles",  (const char *)&unk_1000275CF,  buf,  2u);
  }

  return v46;
}

- (void)updateScoreBasedContactResolver:(id)a3 forFavoritesAmongContacts:(id)a4
{
  id v33 = a3;
  id v6 = a4;
  id v7 = IntentHandlerDefaultLog();
  os_signpost_id_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  id v10 = IntentHandlerDefaultLog();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  id v12 = v11;
  os_signpost_id_t spid = v9;
  unint64_t v32 = v9 - 1;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v12,  OS_SIGNPOST_INTERVAL_BEGIN,  v9,  "favoritesAmongContacts",  (const char *)&unk_1000275CF,  buf,  2u);
  }

  id v13 = IntentHandlerDefaultLog();
  unint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Beginning favorites for contacts check.",  buf,  2u);
  }

  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  id v15 = v6;
  id v16 = [v15 countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v35;
    do
    {
      for (i = 0LL; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v35 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void **)(*((void *)&v34 + 1) + 8LL * (void)i);
        id v21 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler dataSource](self, "dataSource", spid));
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 favoritesDataSource]);
        unsigned int v23 = [v22 hasFavoritesEntryForContact:v20];

        if (v23)
        {
          unsigned int v24 = (os_log_s *)objc_claimAutoreleasedReturnValue([v20 identifier]);
          [v33 addScore:4 forEntity:v24 reason:@"Favorites entry for this contact"];
        }

        else
        {
          id v25 = IntentHandlerDefaultLog();
          unsigned int v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v39 = v20;
            _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "No favorites entry for contact %@. No score adjustment.",  buf,  0xCu);
          }
        }
      }

      id v17 = [v15 countByEnumeratingWithState:&v34 objects:v40 count:16];
    }

    while (v17);
  }

  id v26 = IntentHandlerDefaultLog();
  os_signpost_id_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Completed favorites for contacts check.",  buf,  2u);
  }

  id v28 = IntentHandlerDefaultLog();
  uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
  id v30 = v29;
  if (v32 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v30,  OS_SIGNPOST_INTERVAL_END,  spid,  "favoritesAmongContacts",  (const char *)&unk_1000275CF,  buf,  2u);
  }
}

- (void)updateHandlerStateForContactResolutionResults:(id)a3
{
  id v4 = a3;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        os_signpost_id_t v9 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        if ([v9 resolutionResultCode] == (id)3)
        {
          id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 itemToConfirm]);
          id v11 = v10;
          if (v10)
          {
            id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 personHandle]);
            if (v12)
            {
              id v13 = (void *)objc_claimAutoreleasedReturnValue(+[TUHandle handleWithPerson:](&OBJC_CLASS___TUHandle, "handleWithPerson:", v11));
              if (v13)
              {
                unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler handlesConfirmed](self, "handlesConfirmed"));
                [v14 addObject:v13];
              }
            }

            id v15 = (void *)objc_claimAutoreleasedReturnValue([v11 contactIdentifier]);
            if ([v15 length])
            {
              id v16 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler contactIdentifiersConfirmed](self, "contactIdentifiersConfirmed"));
              [v16 addObject:v15];
            }
          }
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v6);
  }
}

- (id)getAlternativesForContact:(id)a3 forRequestedHandleType:(int64_t)a4 forCallProvider:(int64_t)a5
{
  id v8 = a3;
  os_signpost_id_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler dataSource](self, "dataSource"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 coreTelephonyDataSource]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 allRelevantISOCountryCodes]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue( -[StartCallIntentHandler _inPersonsFromContact:withRequestedType:requestedLabel:isoCountryCodes:]( self,  "_inPersonsFromContact:withRequestedType:requestedLabel:isoCountryCodes:",  v8,  a4,  0LL,  v11));

  id v13 = IntentHandlerDefaultLog();
  unint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 134217984;
    id v25 = [v12 count];
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Found %ld alternatives when dropping label constraint.",  (uint8_t *)&v24,  0xCu);
  }

  if (![v12 count])
  {
    if (a4 == 2 && a5 == 1)
    {
      id v15 = IntentHandlerDefaultLog();
      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v24) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Not dropping handle type constraint because the user requested a telephony call.",  (uint8_t *)&v24,  2u);
      }
    }

    else
    {
      __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler dataSource](self, "dataSource"));
      __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v17 coreTelephonyDataSource]);
      __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v18 allRelevantISOCountryCodes]);
      __int128 v20 = (void *)objc_claimAutoreleasedReturnValue( -[StartCallIntentHandler _inPersonsFromContact:withRequestedType:requestedLabel:isoCountryCodes:]( self,  "_inPersonsFromContact:withRequestedType:requestedLabel:isoCountryCodes:",  v8,  0LL,  0LL,  v19));

      id v21 = IntentHandlerDefaultLog();
      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        id v22 = [v20 count];
        int v24 = 134217984;
        id v25 = v22;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Found %ld alternatives when dropping handle and label constraint.",  (uint8_t *)&v24,  0xCu);
      }

      id v12 = v20;
    }
  }

  return v12;
}

- (BOOL)anyContactsHaveSameName:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = objc_claimAutoreleasedReturnValue( +[CNContactFormatter stringFromContact:style:]( &OBJC_CLASS___CNContactFormatter,  "stringFromContact:style:",  *(void *)(*((void *)&v14 + 1) + 8LL * (void)i),  0LL,  (void)v14));
        id v10 = (void *)v9;
        if (v9) {
          id v11 = (__CFString *)v9;
        }
        else {
          id v11 = &stru_100034C18;
        }
        id v12 = v11;

        if (-[NSMutableSet containsObject:](v4, "containsObject:", v12))
        {

          LOBYTE(v6) = 1;
          goto LABEL_14;
        }

        -[NSMutableSet addObject:](v4, "addObject:", v12);
      }

      id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

- (BOOL)isEmergencyHandle:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler dataSource](self, "dataSource"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 providerManager]);

  id v48 = self;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler dataSource](self, "dataSource"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 senderIdentityClient]);

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 telephonyProvider]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 prioritizedSenderIdentities]);

  __int128 v59 = 0u;
  __int128 v60 = 0u;
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  id v11 = v10;
  id v12 = [v11 countByEnumeratingWithState:&v57 objects:v65 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v58;
    while (2)
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v58 != v14) {
          objc_enumerationMutation(v11);
        }
        __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v57 + 1) + 8 * (void)i) UUID]);
        unsigned int v17 = [v8 isEmergencyNumberForDigits:v4 senderIdentityUUID:v16];

        if (v17)
        {
          id v40 = IntentHandlerDefaultLog();
          uint64_t v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v64 = v4;
            _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "Handle is an emergency number, %@ is in the prioritizedSenderIdentities list",  buf,  0xCu);
          }

          BOOL v39 = 1;
          id v21 = v11;
          goto LABEL_38;
        }
      }

      id v13 = [v11 countByEnumeratingWithState:&v57 objects:v65 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }

  double v47 = v6;

  __int128 v55 = 0u;
  __int128 v56 = 0u;
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler dataSource](v48, "dataSource"));
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v18 providerManager]);
  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v19 emergencyProvider]);
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 emergencyLabeledHandles]);

  id v22 = [v21 countByEnumeratingWithState:&v53 objects:v62 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v54;
    while (2)
    {
      for (j = 0LL; j != v23; j = (char *)j + 1)
      {
        if (*(void *)v54 != v24) {
          objc_enumerationMutation(v21);
        }
        id v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v53 + 1) + 8 * (void)j), "handle", v47));
        os_signpost_id_t v27 = (void *)objc_claimAutoreleasedReturnValue([v26 value]);
        unsigned int v28 = [v4 isEqualToString:v27];

        if (v28)
        {
          id v42 = IntentHandlerDefaultLog();
          double v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
          id v6 = v47;
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v64 = v4;
            _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEFAULT,  "Handle is an emergency number, %@ is in the emergencyLabeledHandles list",  buf,  0xCu);
          }

          BOOL v39 = 1;
          goto LABEL_38;
        }
      }

      id v23 = [v21 countByEnumeratingWithState:&v53 objects:v62 count:16];
      if (v23) {
        continue;
      }
      break;
    }
  }

  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler dataSource](v48, "dataSource"));
  id v30 = (void *)objc_claimAutoreleasedReturnValue([v29 providerManager]);
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v30 emergencyProvider]);
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v31 emergencyHandles]);

  id v32 = [v21 countByEnumeratingWithState:&v49 objects:v61 count:16];
  if (v32)
  {
    id v33 = v32;
    uint64_t v34 = *(void *)v50;
    while (2)
    {
      for (k = 0LL; k != v33; k = (char *)k + 1)
      {
        if (*(void *)v50 != v34) {
          objc_enumerationMutation(v21);
        }
        __int128 v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v49 + 1) + 8 * (void)k), "value", v47));
        unsigned int v37 = [v4 isEqualToString:v36];

        if (v37)
        {
          id v44 = IntentHandlerDefaultLog();
          id v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v64 = v4;
            _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEFAULT,  "Handle is an emergency number, %@ is in the unlabeled emergencyHandles list",  buf,  0xCu);
          }

          BOOL v39 = 1;
          goto LABEL_37;
        }
      }

      id v33 = [v21 countByEnumeratingWithState:&v49 objects:v61 count:16];
      if (v33) {
        continue;
      }
      break;
    }
  }

  id v38 = IntentHandlerDefaultLog();
  id v21 = (void *)objc_claimAutoreleasedReturnValue(v38);
  if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v64 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v21,  OS_LOG_TYPE_DEFAULT,  "Handle is not an emergency number: %@",  buf,  0xCu);
  }

  BOOL v39 = 0;
LABEL_37:
  id v6 = v47;
LABEL_38:

  return v39;
}

- (id)localizedEmergencyString:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(&OBJC_CLASS___INDeferredLocalizedString);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithPath:]( &OBJC_CLASS___NSBundle,  "bundleWithPath:",  @"/Applications/InCallService.app"));
  id v7 = [v5 initWithDeferredFormat:v4 fromTable:@"InCallService" bundle:v6 arguments:0];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler dataSource](self, "dataSource"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 siriLanguageCode]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 localizeForLanguage:v9]);

  return v10;
}

- (id)_applyImpliedFilterToPhoneNumberOnlyMatchesIfApplicableForPersonsByContact:(id)a3 requestedHandleType:(int64_t)a4 preferredCallProvider:(int64_t)a5
{
  id v8 = (NSMutableDictionary *)a3;
  if (a4)
  {
    id v9 = IntentHandlerDefaultLog();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v11 = "Not applying an implicit handle type filter to an intent with an explicit handle type specified";
LABEL_26:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v11, buf, 2u);
      goto LABEL_27;
    }

    goto LABEL_27;
  }

  if (a5)
  {
    id v12 = IntentHandlerDefaultLog();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v11 = "Not applying an implicit handle type filter to an intent with an explicit call provider specified";
      goto LABEL_26;
    }

- (id)_inPersonsFromContact:(id)a3 withRequestedType:(int64_t)a4 requestedLabel:(id)a5 isoCountryCodes:(id)a6
{
  id v41 = a3;
  id v9 = a5;
  id v40 = a6;
  id v10 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v11 = v10;
  if (a4 == 2)
  {
    BOOL v39 = v10;
    int v38 = 0;
  }

  else
  {
    if (a4 == 1)
    {
LABEL_16:
      id v26 = (void *)objc_claimAutoreleasedReturnValue([v41 emailAddresses]);
      __int128 v42 = 0u;
      __int128 v43 = 0u;
      __int128 v44 = 0u;
      __int128 v45 = 0u;
      id v27 = [v26 countByEnumeratingWithState:&v42 objects:v50 count:16];
      if (v27)
      {
        id v28 = v27;
        uint64_t v29 = *(void *)v43;
        do
        {
          for (i = 0LL; i != v28; i = (char *)i + 1)
          {
            if (*(void *)v43 != v29) {
              objc_enumerationMutation(v26);
            }
            uint64_t v31 = *(void **)(*((void *)&v42 + 1) + 8LL * (void)i);
            uint64_t v32 = INPersonHandleLabelForCNLabeledValue(v31);
            id v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
            if (![v9 length] || !objc_msgSend(v9, "caseInsensitiveCompare:", v33))
            {
              uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v31 value]);
              __int128 v35 = (void *)objc_claimAutoreleasedReturnValue( +[StartCallIntentHandlerUtilities inPersonFromContact:handleValue:handleType:handleLabel:]( &OBJC_CLASS___StartCallIntentHandlerUtilities,  "inPersonFromContact:handleValue:handleType:handleLabel:",  v41,  v34,  1LL,  v33));
              -[NSMutableArray addObject:](v11, "addObject:", v35);
            }
          }

          id v28 = [v26 countByEnumeratingWithState:&v42 objects:v50 count:16];
        }

        while (v28);
      }

      goto LABEL_27;
    }

    if (a4) {
      goto LABEL_27;
    }
    BOOL v39 = v10;
    int v38 = 1;
  }

  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v41 phoneNumbers]);
  id v13 = [v12 countByEnumeratingWithState:&v46 objects:v51 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v47;
    do
    {
      for (j = 0LL; j != v14; j = (char *)j + 1)
      {
        if (*(void *)v47 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = *(void **)(*((void *)&v46 + 1) + 8LL * (void)j);
        if (INPersonHandleLabelEqualsCNLabeledValue(v9, v17))
        {
          uint64_t v18 = INPersonHandleLabelForCNLabeledValue(v17);
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
          __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v17 value]);
          id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 stringValue]);
          id v22 = (void *)objc_claimAutoreleasedReturnValue([v40 firstObject]);
          uint64_t v23 = TUFormattedPhoneNumber(v21, v22);
          id v24 = (void *)objc_claimAutoreleasedReturnValue(v23);

          id v25 = (void *)objc_claimAutoreleasedReturnValue( +[StartCallIntentHandlerUtilities inPersonFromContact:handleValue:handleType:handleLabel:]( &OBJC_CLASS___StartCallIntentHandlerUtilities,  "inPersonFromContact:handleValue:handleType:handleLabel:",  v41,  v24,  2LL,  v19));
          -[NSMutableArray addObject:](v39, "addObject:", v25);
        }
      }

      id v14 = [v12 countByEnumeratingWithState:&v46 objects:v51 count:16];
    }

    while (v14);
  }

  id v11 = v39;
  if (v38) {
    goto LABEL_16;
  }
LABEL_27:
  id v36 = -[NSMutableArray copy](v11, "copy");

  return v36;
}

- (BOOL)haveAlreadyConfirmedRecipient:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[TUHandle handleWithPerson:](&OBJC_CLASS___TUHandle, "handleWithPerson:", v4));
  if (v5)
  {
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler handlesConfirmed](self, "handlesConfirmed", 0LL));
    id v7 = [v6 countByEnumeratingWithState:&v24 objects:v30 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v25;
LABEL_4:
      uint64_t v10 = 0LL;
      while (1)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(os_log_s **)(*((void *)&v24 + 1) + 8 * v10);
        if (v8 == (id)++v10)
        {
          id v8 = [v6 countByEnumeratingWithState:&v24 objects:v30 count:16];
          if (v8) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }

      id v22 = IntentHandlerDefaultLog();
      uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_19;
      }
      *(_DWORD *)buf = 138412290;
      uint64_t v29 = v11;
      uint64_t v19 = "Have previously confirmed recipient with handle %@";
      __int128 v20 = v18;
      goto LABEL_18;
    }

- (BOOL)shouldRequireInvalidNumberConfirmationForRecipient:(id)a3
{
  id v4 = a3;
  id v5 = IntentHandlerDefaultLog();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  os_signpost_id_t v7 = os_signpost_id_generate(v6);

  id v8 = IntentHandlerDefaultLog();
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  uint64_t v10 = v9;
  unint64_t v11 = v7 - 1;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v10,  OS_SIGNPOST_INTERVAL_BEGIN,  v7,  "shouldRequireInvalidNumberConfirmation",  (const char *)&unk_1000275CF,  buf,  2u);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[TUHandle handleWithPerson:](&OBJC_CLASS___TUHandle, "handleWithPerson:", v4));
  unsigned int v13 = -[StartCallIntentHandler haveAlreadyConfirmedRecipient:](self, "haveAlreadyConfirmedRecipient:", v4);
  char v14 = v13;
  if (v13)
  {
    id v15 = IntentHandlerDefaultLog();
    unsigned int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Not requiring invalid number confirmation because recipient has already been confirmed.",  buf,  2u);
    }
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue([v4 personHandle]);
  id v18 = [v17 emergencyType];

  if (v18 == (id)2)
  {
    id v19 = IntentHandlerDefaultLog();
    __int128 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Not requiring invalid number confirmation because recipient has a nonlocal emergency handle type and has already been confirmed.",  buf,  2u);
    }

    goto LABEL_38;
  }

  if ((v14 & 1) == 0)
  {
    id v22 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler dataSource](self, "dataSource"));
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 coreTelephonyDataSource]);
    __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v23 allRelevantISOCountryCodes]);

    __int128 v66 = 0u;
    __int128 v67 = 0u;
    __int128 v64 = 0u;
    __int128 v65 = 0u;
    __int128 v20 = v24;
    id v25 = -[os_log_s countByEnumeratingWithState:objects:count:]( v20,  "countByEnumeratingWithState:objects:count:",  &v64,  v74,  16LL);
    if (v25)
    {
      id v26 = v25;
      uint64_t v27 = *(void *)v65;
      while (2)
      {
        for (i = 0LL; i != v26; i = (char *)i + 1)
        {
          if (*(void *)v65 != v27) {
            objc_enumerationMutation(v20);
          }
          uint64_t v29 = *(void **)(*((void *)&v64 + 1) + 8LL * (void)i);
          if ([v12 isValidForISOCountryCode:v29])
          {
            id v54 = IntentHandlerDefaultLog();
            __int128 v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
            if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v71 = (uint64_t)v29;
              _os_log_impl( (void *)&_mh_execute_header,  v55,  OS_LOG_TYPE_DEFAULT,  "Not requiring invalid number confirmation because handle is valid for country code %@",  buf,  0xCu);
            }

            goto LABEL_38;
          }
        }

        id v26 = -[os_log_s countByEnumeratingWithState:objects:count:]( v20,  "countByEnumeratingWithState:objects:count:",  &v64,  v74,  16LL);
        if (v26) {
          continue;
        }
        break;
      }
    }

    id v30 = IntentHandlerDefaultLog();
    uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v71 = (uint64_t)v12;
      __int16 v72 = 2112;
      __int128 v73 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "[WARN] Requested handle %@ is not valid for any of the following country codes: %@",  buf,  0x16u);
    }

    os_signpost_id_t v63 = v7;

    id v32 = IntentHandlerDefaultLog();
    id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "Examining call history to determine if there is existing call history with the invalid number.",  buf,  2u);
    }

    __int128 v68 = v12;
    id v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v68, 1LL));
    id v62 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler dataSource](self, "dataSource"));
    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v62 coreTelephonyDataSource]);
    __int128 v35 = (void *)objc_claimAutoreleasedReturnValue([v34 allRelevantISOCountryCodes]);
    id v36 = (void *)objc_claimAutoreleasedReturnValue( +[CallHistoryDataSourcePredicate predicateForCallsWithAnyOfTheseRemoteParticipantHandles:isoCountryCodes:]( &OBJC_CLASS___CallHistoryDataSourcePredicate,  "predicateForCallsWithAnyOfTheseRemoteParticipantHandles:isoCountryCodes:",  v61,  v35));
    v69[0] = v36;
    __int128 v37 = (void *)objc_claimAutoreleasedReturnValue( +[CallHistoryDataSourcePredicate predicateForCallsWithDurationLongerThanImmediateHangUp]( &OBJC_CLASS___CallHistoryDataSourcePredicate,  "predicateForCallsWithDurationLongerThanImmediateHangUp"));
    v69[1] = v37;
    int v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v69, 2LL));
    __int128 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate andPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "andPredicateWithSubpredicates:",  v38));

    id v39 = IntentHandlerDefaultLog();
    id v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
    os_signpost_id_t v41 = os_signpost_id_generate(v40);

    id v42 = IntentHandlerDefaultLog();
    __int128 v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
    __int128 v44 = v43;
    if (v41 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v43))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v44,  OS_SIGNPOST_INTERVAL_BEGIN,  v41,  "callHistoryDBForInvalidNumber",  (const char *)&unk_1000275CF,  buf,  2u);
    }

    __int128 v45 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler dataSource](self, "dataSource"));
    __int128 v46 = (void *)objc_claimAutoreleasedReturnValue([v45 callHistoryDataSource]);
    uint64_t v47 = (uint64_t)[v46 callCountWithPredicate:v20];

    id v48 = IntentHandlerDefaultLog();
    __int128 v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
    __int128 v50 = v49;
    os_signpost_id_t v7 = v63;
    if (v41 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v49))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v50,  OS_SIGNPOST_INTERVAL_END,  v41,  "callHistoryDBForInvalidNumber",  (const char *)&unk_1000275CF,  buf,  2u);
    }

    id v51 = IntentHandlerDefaultLog();
    __int128 v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
    BOOL v53 = os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT);
    if (v47 < 1)
    {
      if (v53)
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v71 = (uint64_t)v12;
        _os_log_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_DEFAULT,  "Did not find any matching calls with: %@",  buf,  0xCu);
      }

      id v60 = IntentHandlerDefaultLog();
      __int128 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "[WARN] Returning YES for shouldRequireInvalidNumberConfirmationForRecipient.",  buf,  2u);
      }

      BOOL v21 = 1;
      goto LABEL_39;
    }

    if (v53)
    {
      *(_DWORD *)buf = 134218242;
      uint64_t v71 = v47;
      __int16 v72 = 2112;
      __int128 v73 = (os_log_s *)v12;
      _os_log_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_DEFAULT,  "Not requiring invalid number confirmation because there are %ld recents call with %@",  buf,  0x16u);
    }

LABEL_38:
    BOOL v21 = 0;
LABEL_39:

    goto LABEL_40;
  }

  BOOL v21 = 0;
LABEL_40:
  id v56 = IntentHandlerDefaultLog();
  __int128 v57 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);
  __int128 v58 = v57;
  if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v57))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v58,  OS_SIGNPOST_INTERVAL_END,  v7,  "shouldRequireInvalidNumberConfirmation",  (const char *)&unk_1000275CF,  buf,  2u);
  }

  return v21;
}

- (BOOL)shouldRequireUnknownRecipientConfirmationForRequestedRecipient:(id)a3 resolvedToRecipient:(id)a4 contact:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = IntentHandlerDefaultLog();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  os_signpost_id_t v13 = os_signpost_id_generate(v12);

  id v14 = IntentHandlerDefaultLog();
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  unsigned int v16 = v15;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v16,  OS_SIGNPOST_INTERVAL_BEGIN,  v13,  "shouldRequireUnknownRecipientConfirmation",  (const char *)&unk_1000275CF,  buf,  2u);
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue([v8 _userInput]);
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v8 displayName]);
  if (-[StartCallIntentHandler haveAlreadyConfirmedRecipient:](self, "haveAlreadyConfirmedRecipient:", v8))
  {
    id v19 = IntentHandlerDefaultLog();
    __int128 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Not requiring unknown recipient confirmation because recipient has already been confirmed.",  buf,  2u);
    }

    goto LABEL_15;
  }

  BOOL v21 = (void *)objc_claimAutoreleasedReturnValue([v8 relationship]);
  id v22 = [v21 length];

  if (v22)
  {
    id v23 = IntentHandlerDefaultLog();
    __int128 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v8 relationship]);
      *(_DWORD *)buf = 138412290;
      __int128 v97 = v24;
      id v25 = "Not requiring unknown recipient confirmation because requested recipient was a relation: %@";
      id v26 = v20;
      uint32_t v27 = 12;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, v25, buf, v27);
LABEL_14:
    }

- (id)resolveContactsFromCallGroups:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue([v4 contacts]);
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v7 = IntentHandlerDefaultLog();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 callGroups]);
    *(_DWORD *)buf = 138412290;
    id v38 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "group facetime message callGroups for intent: %@",  buf,  0xCu);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 callGroups]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 firstObject]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 groupId]);

  os_signpost_id_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler dataSource](self, "dataSource"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 fetchSPIHandlesForGroupID:v12]);

  if ([v14 count])
  {
    id v30 = v5;
    id v31 = v4;
    id v15 = IntentHandlerDefaultLog();
    unsigned int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v38 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "fetching handles from spiChat: %@",  buf,  0xCu);
    }

    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    id v17 = v14;
    id v18 = [v17 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v33;
      do
      {
        for (i = 0LL; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v33 != v20) {
            objc_enumerationMutation(v17);
          }
          id v22 = *(void **)(*((void *)&v32 + 1) + 8LL * (void)i);
          id v23 = objc_alloc(&OBJC_CLASS___INPersonHandle);
          __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v22 address]);
          id v25 = -[INPersonHandle initWithValue:type:label:emergencyType:]( v23,  "initWithValue:type:label:emergencyType:",  v24,  0LL,  0LL,  2LL);

          id v26 = -[INPerson initWithPersonHandle:nameComponents:displayName:image:contactIdentifier:customIdentifier:]( objc_alloc(&OBJC_CLASS___INPerson),  "initWithPersonHandle:nameComponents:displayName:image:contactIdentifier:customIdentifier:",  v25,  0LL,  0LL,  0LL,  0LL,  0LL);
          -[NSMutableArray addObject:](v6, "addObject:", v26);
        }

        id v19 = [v17 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }

      while (v19);
    }

    id v5 = -[NSMutableArray copy](v6, "copy");
    id v4 = v31;
  }

  id v27 = IntentHandlerDefaultLog();
  id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v38 = v5;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "updated contacts: %@", buf, 0xCu);
  }

  return v5;
}

- (void)setDataSource:(id)a3
{
}

- (void)setCoreAnalyticsLogger:(id)a3
{
}

- (void)setAppResolver:(id)a3
{
}

- (NSMutableOrderedSet)handlesConfirmed
{
  return self->_handlesConfirmed;
}

- (void)setHandlesConfirmed:(id)a3
{
}

- (NSMutableOrderedSet)contactIdentifiersConfirmed
{
  return self->_contactIdentifiersConfirmed;
}

- (void)setContactIdentifiersConfirmed:(id)a3
{
}

- (IntentHandlerFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (void)setFeatureFlags:(id)a3
{
}

- (FaceTimeUtilities)faceTimeUtilities
{
  return self->_faceTimeUtilities;
}

- (void)setFaceTimeUtilities:(id)a3
{
}

- (void).cxx_destruct
{
}

@end