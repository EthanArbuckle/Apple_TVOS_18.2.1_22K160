@interface RecentCallQuery
- (BOOL)includeThirdPartyCalls;
- (NSArray)participants;
- (RecentCallQuery)initWithParticipants:(id)a3 destinationType:(int64_t)a4 callTypes:(unint64_t)a5 callCapability:(int64_t)a6 preferredCallProvider:(int64_t)a7;
- (RecentCallQuery)initWithParticipants:(id)a3 destinationType:(int64_t)a4 callTypes:(unint64_t)a5 callCapability:(int64_t)a6 preferredCallProvider:(int64_t)a7 includeThirdPartyCalls:(BOOL)a8;
- (id)callCapabilityPredicate;
- (id)callRecordTypePredicates;
- (id)participantsPredicatesWithContactsDataSource:(id)a3 contactIdentifierCache:(id)a4 coreTelephonyDataSource:(id)a5;
- (id)predicateForRecentCallWithContactsDataSource:(id)a3 contactIdentifierCache:(id)a4 coreTelephonyDataSource:(id)a5;
- (id)preferredCallProviderPredicate;
- (int64_t)callCapability;
- (int64_t)destinationType;
- (int64_t)preferredCallProvider;
- (unint64_t)callTypes;
- (void)setCallCapability:(int64_t)a3;
- (void)setCallTypes:(unint64_t)a3;
- (void)setDestinationType:(int64_t)a3;
- (void)setIncludeThirdPartyCalls:(BOOL)a3;
- (void)setParticipants:(id)a3;
- (void)setPreferredCallProvider:(int64_t)a3;
@end

@implementation RecentCallQuery

- (RecentCallQuery)initWithParticipants:(id)a3 destinationType:(int64_t)a4 callTypes:(unint64_t)a5 callCapability:(int64_t)a6 preferredCallProvider:(int64_t)a7
{
  return -[RecentCallQuery initWithParticipants:destinationType:callTypes:callCapability:preferredCallProvider:includeThirdPartyCalls:]( self,  "initWithParticipants:destinationType:callTypes:callCapability:preferredCallProvider:includeThirdPartyCalls:",  a3,  a4,  a5,  a6,  a7,  0LL);
}

- (RecentCallQuery)initWithParticipants:(id)a3 destinationType:(int64_t)a4 callTypes:(unint64_t)a5 callCapability:(int64_t)a6 preferredCallProvider:(int64_t)a7 includeThirdPartyCalls:(BOOL)a8
{
  BOOL v8 = a8;
  -[RecentCallQuery setParticipants:](self, "setParticipants:", a3);
  -[RecentCallQuery setDestinationType:](self, "setDestinationType:", a4);
  -[RecentCallQuery setCallTypes:](self, "setCallTypes:", a5);
  -[RecentCallQuery setCallCapability:](self, "setCallCapability:", a6);
  -[RecentCallQuery setPreferredCallProvider:](self, "setPreferredCallProvider:", a7);
  -[RecentCallQuery setIncludeThirdPartyCalls:](self, "setIncludeThirdPartyCalls:", v8);
  return self;
}

- (id)predicateForRecentCallWithContactsDataSource:(id)a3 contactIdentifierCache:(id)a4 coreTelephonyDataSource:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RecentCallQuery callRecordTypePredicates](self, "callRecordTypePredicates"));
  -[NSMutableArray addObjectsFromArray:](v11, "addObjectsFromArray:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RecentCallQuery preferredCallProviderPredicate](self, "preferredCallProviderPredicate"));
  if (v13) {
    -[NSMutableArray addObject:](v11, "addObject:", v13);
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RecentCallQuery callCapabilityPredicate](self, "callCapabilityPredicate"));
  if (v14) {
    -[NSMutableArray addObject:](v11, "addObject:", v14);
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue( -[RecentCallQuery participantsPredicatesWithContactsDataSource:contactIdentifierCache:coreTelephonyDataSource:]( self,  "participantsPredicatesWithContactsDataSource:contactIdentifierCache:coreTelephonyDataSource:",  v8,  v9,  v10));
  -[NSMutableArray addObjectsFromArray:](v11, "addObjectsFromArray:", v15);

  if (-[NSMutableArray count](v11, "count") == (id)1)
  {
    uint64_t v16 = objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](v11, "firstObject"));
  }

  else
  {
    if ((unint64_t)-[NSMutableArray count](v11, "count") < 2)
    {
      v17 = 0LL;
      goto LABEL_11;
    }

    uint64_t v16 = objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate andPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "andPredicateWithSubpredicates:",  v11));
  }

  v17 = (void *)v16;
LABEL_11:

  return v17;
}

- (id)callRecordTypePredicates
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if ((-[RecentCallQuery callTypes](self, "callTypes") & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[CallHistoryDataSourcePredicate predicateForCallsThatWereOriginated:]( &OBJC_CLASS___CallHistoryDataSourcePredicate,  "predicateForCallsThatWereOriginated:",  1LL));
    -[NSMutableArray addObject:](v3, "addObject:", v4);
  }

  if ((-[RecentCallQuery callTypes](self, "callTypes") & 2) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[CallHistoryDataSourcePredicate predicateForMissedCallsSinceDate:]( &OBJC_CLASS___CallHistoryDataSourcePredicate,  "predicateForMissedCallsSinceDate:",  0LL));
    -[NSMutableArray addObject:](v3, "addObject:", v5);
  }

  if ((-[RecentCallQuery callTypes](self, "callTypes") & 4) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[CallHistoryDataSourcePredicate predicateForCallsThatWereOriginated:]( &OBJC_CLASS___CallHistoryDataSourcePredicate,  "predicateForCallsThatWereOriginated:",  0LL));
    -[NSMutableArray addObject:](v3, "addObject:", v6);
  }

  if (!-[RecentCallQuery callTypes](self, "callTypes")
    && (id)-[RecentCallQuery destinationType](self, "destinationType") == (id)4)
  {
    id v7 = IntentHandlerDefaultLog();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Inferring outgoing callStatus requirement from the presence of redial destination type and unspecified recordTypeForRedialing.",  v20,  2u);
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[CallHistoryDataSourcePredicate predicateForCallsThatWereOriginated:]( &OBJC_CLASS___CallHistoryDataSourcePredicate,  "predicateForCallsThatWereOriginated:",  1LL));
    -[NSMutableArray addObject:](v3, "addObject:", v9);
  }

  if ((-[RecentCallQuery callTypes](self, "callTypes") & 0xF8) != 0)
  {
    id v10 = IntentHandlerDefaultLog();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1000204DC(v11, v12, v13, v14, v15, v16, v17, v18);
    }
  }

  return v3;
}

- (id)preferredCallProviderPredicate
{
  int64_t v3 = -[RecentCallQuery preferredCallProvider](self, "preferredCallProvider");
  if (!v3)
  {
    unsigned int v5 = -[RecentCallQuery includeThirdPartyCalls](self, "includeThirdPartyCalls");
    id v6 = IntentHandlerDefaultLog();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (!v5)
    {
      if (v8)
      {
        *(_WORD *)uint64_t v18 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "No preferredCallProvider specified and thirdParty redial is not enabled. Filtering for 1P calls.",  v18,  2u);
      }

      v4 = (void *)objc_claimAutoreleasedReturnValue( +[CallHistoryDataSourcePredicate predicateForTelephonyOrFaceTimeCalls]( &OBJC_CLASS___CallHistoryDataSourcePredicate,  "predicateForTelephonyOrFaceTimeCalls"));
      return v4;
    }

    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "No preferredCallProvider specified and thirdParty redial is enabled, not filtering by provider",  buf,  2u);
    }

- (id)callCapabilityPredicate
{
  int64_t v2 = -[RecentCallQuery callCapability](self, "callCapability");
  if (v2 == 1)
  {
    int64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[CallHistoryDataSourcePredicate predicateForAudioCalls]( &OBJC_CLASS___CallHistoryDataSourcePredicate,  "predicateForAudioCalls"));
  }

  else if (v2 == 2)
  {
    int64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[CallHistoryDataSourcePredicate predicateForVideoCalls]( &OBJC_CLASS___CallHistoryDataSourcePredicate,  "predicateForVideoCalls"));
  }

  else
  {
    int64_t v3 = 0LL;
  }

  return v3;
}

- (id)participantsPredicatesWithContactsDataSource:(id)a3 contactIdentifierCache:(id)a4 coreTelephonyDataSource:(id)a5
{
  id v30 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[RecentCallQuery participants](self, "participants"));
  id v12 = [v11 count];

  if (v12)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[RecentCallQuery participants](self, "participants"));
    uint64_t v14 = objc_claimAutoreleasedReturnValue( +[CallHistoryDataSourcePredicate predicateForCallsWithNumberOfRemoteParticipants:]( CallHistoryDataSourcePredicate,  "predicateForCallsWithNumberOfRemoteParticipants:",  [v13 count]));

    v28 = (void *)v14;
    -[NSMutableArray addObject:](v10, "addObject:", v14);
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue(-[RecentCallQuery participants](self, "participants"));
    id v15 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v33;
      do
      {
        uint64_t v18 = 0LL;
        do
        {
          if (*(void *)v33 != v17) {
            objc_enumerationMutation(obj);
          }
          v19 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v32 + 1) + 8 * (void)v18),  "tu_handlesMatchingPersonWithContactsDataSource:identifierToContactCache:",  v30,  v8));
          unsigned int v20 = -[RecentCallQuery includeThirdPartyCalls](self, "includeThirdPartyCalls");
          id v21 = IntentHandlerDefaultLog();
          v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
          BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
          if (v20)
          {
            if (v23)
            {
              *(_WORD *)buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "ThirdParty redial is enabled, using redial predicate that includes search for non-normalized handle values.",  buf,  2u);
            }

            v24 = (void *)objc_claimAutoreleasedReturnValue([v9 allRelevantISOCountryCodes]);
            uint64_t v25 = objc_claimAutoreleasedReturnValue( +[CallHistoryDataSourcePredicate predicateForCallToCallBackWithAnyOfTheseRemoteParticipantHandles:isoCountryCodes:]( &OBJC_CLASS___CallHistoryDataSourcePredicate,  "predicateForCallToCallBackWithAnyOfTheseRemoteParticipantHandles:isoCountryCodes:",  v19,  v24));
          }

          else
          {
            if (v23)
            {
              *(_WORD *)buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "ThirdParty redial is not enabled, using normal recent call predicate that includes search for non-normal ized handle values.",  buf,  2u);
            }

            v24 = (void *)objc_claimAutoreleasedReturnValue([v9 allRelevantISOCountryCodes]);
            uint64_t v25 = objc_claimAutoreleasedReturnValue( +[CallHistoryDataSourcePredicate predicateForCallsWithAnyOfTheseRemoteParticipantHandles:isoCountryCodes:]( &OBJC_CLASS___CallHistoryDataSourcePredicate,  "predicateForCallsWithAnyOfTheseRemoteParticipantHandles:isoCountryCodes:",  v19,  v24));
          }

          v26 = (void *)v25;

          -[NSMutableArray addObject:](v10, "addObject:", v26);
          uint64_t v18 = (char *)v18 + 1;
        }

        while (v16 != v18);
        id v16 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
      }

      while (v16);
    }
  }

  return v10;
}

- (NSArray)participants
{
  return self->_participants;
}

- (void)setParticipants:(id)a3
{
}

- (int64_t)destinationType
{
  return self->_destinationType;
}

- (void)setDestinationType:(int64_t)a3
{
  self->_destinationType = a3;
}

- (unint64_t)callTypes
{
  return self->_callTypes;
}

- (void)setCallTypes:(unint64_t)a3
{
  self->_callTypes = a3;
}

- (int64_t)callCapability
{
  return self->_callCapability;
}

- (void)setCallCapability:(int64_t)a3
{
  self->_callCapability = a3;
}

- (int64_t)preferredCallProvider
{
  return self->_preferredCallProvider;
}

- (void)setPreferredCallProvider:(int64_t)a3
{
  self->_preferredCallProvider = a3;
}

- (BOOL)includeThirdPartyCalls
{
  return self->_includeThirdPartyCalls;
}

- (void)setIncludeThirdPartyCalls:(BOOL)a3
{
  self->_includeThirdPartyCalls = a3;
}

- (void).cxx_destruct
{
}

@end