@interface ContactResolver
+ (id)keysToFetch;
- (ContactResolver)initWithDataSource:(id)a3 logger:(id)a4;
- (IntentHandlerCoreAnalyticsLogging)coreAnalyticsLogger;
- (TUContactsDataSource)contactsDataSource;
- (id)_contactsMatchingIdentifiers:(id)a3;
- (id)_contactsMatchingNamesForPerson:(id)a3;
- (id)matchingContactsForPerson:(id)a3;
- (void)_sendSiriMatchAnalyticsEventForIdentifiers:(id)a3 contactsMatchingId:(id)a4 contactsMatchingName:(id)a5;
@end

@implementation ContactResolver

- (ContactResolver)initWithDataSource:(id)a3 logger:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___ContactResolver;
  v9 = -[ContactResolver init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contactsDataSource, a3);
    objc_storeStrong((id *)&v10->_coreAnalyticsLogger, a4);
  }

  return v10;
}

+ (id)keysToFetch
{
  if (qword_10003E578 != -1) {
    dispatch_once(&qword_10003E578, &stru_1000345F0);
  }
  return (id)qword_10003E570;
}

- (id)matchingContactsForPerson:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tu_allContactIdentifiers"));
  id v6 = IntentHandlerDefaultLog();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v26 = 134218242;
    id v27 = [v5 count];
    __int16 v28 = 2112;
    id v29 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Person contains %ld contact IDs. Person: %@",  (uint8_t *)&v26,  0x16u);
  }

  id v8 = IntentHandlerDefaultLog();
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v26 = 138412290;
    id v27 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Looking up contact in the contact store matching identifiers: %@",  (uint8_t *)&v26,  0xCu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ContactResolver _contactsMatchingIdentifiers:](self, "_contactsMatchingIdentifiers:", v5));
  id v11 = IntentHandlerDefaultLog();
  objc_super v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = [v10 count];
    int v26 = 134217984;
    id v27 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Found %ld contacts matching siriMatches",  (uint8_t *)&v26,  0xCu);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue( +[StartCallIntentHandlerUtilities sortContacts:withIdentifiers:]( &OBJC_CLASS___StartCallIntentHandlerUtilities,  "sortContacts:withIdentifiers:",  v10,  v5));
  id v15 = [v14 count];
  id v16 = IntentHandlerDefaultLog();
  v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  v18 = v17;
  if (v15)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v26) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Found contacts matching siriMatches",  (uint8_t *)&v26,  2u);
    }

    v19 = &__NSArray0__struct;
    v20 = v14;
  }

  else
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10001FE54(v18);
    }

    id v21 = IntentHandlerDefaultLog();
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v26) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Looking up contact in the contact store by names",  (uint8_t *)&v26,  2u);
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[ContactResolver _contactsMatchingNamesForPerson:](self, "_contactsMatchingNamesForPerson:", v4));
    v19 = v20;
  }

  id v23 = v20;
  -[ContactResolver _sendSiriMatchAnalyticsEventForIdentifiers:contactsMatchingId:contactsMatchingName:]( self,  "_sendSiriMatchAnalyticsEventForIdentifiers:contactsMatchingId:contactsMatchingName:",  v5,  v14,  v19);
  v24 = -[ContactPool initWithContacts:](objc_alloc(&OBJC_CLASS___ContactPool), "initWithContacts:", v23);

  return v24;
}

- (id)_contactsMatchingIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = &__NSArray0__struct;
  if ([v4 count])
  {
    id v6 = IntentHandlerDefaultLog();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    os_signpost_id_t v8 = os_signpost_id_generate(v7);

    id v9 = IntentHandlerDefaultLog();
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    id v11 = v10;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v11,  OS_SIGNPOST_INTERVAL_BEGIN,  v8,  "contactsMatchingIdentifiers",  (const char *)&unk_1000275CF,  buf,  2u);
    }

    objc_super v12 = (void *)objc_claimAutoreleasedReturnValue( +[CNContact predicateForContactsWithIdentifiers:]( &OBJC_CLASS___CNContact,  "predicateForContactsWithIdentifiers:",  v4));
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[ContactResolver contactsDataSource](self, "contactsDataSource"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[ContactResolver keysToFetch](&OBJC_CLASS___ContactResolver, "keysToFetch"));
    id v32 = 0LL;
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 unifiedContactsMatchingPredicate:v12 keysToFetch:v14 error:&v32]);
    id v16 = v32;
    if (v15) {
      v17 = v15;
    }
    else {
      v17 = &__NSArray0__struct;
    }
    id v5 = v17;

    if (v16)
    {
      id v18 = IntentHandlerDefaultLog();
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_10001FE94((uint64_t)v16, v19, v20, v21, v22, v23, v24, v25);
      }
    }

    id v26 = IntentHandlerDefaultLog();
    id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    __int16 v28 = v27;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
    {
      *(_WORD *)v31 = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v28,  OS_SIGNPOST_INTERVAL_END,  v8,  "contactsMatchingIdentifiers",  (const char *)&unk_1000275CF,  v31,  2u);
    }
  }

  id v29 = [v5 copy];

  return v29;
}

- (id)_contactsMatchingNamesForPerson:(id)a3
{
  id v4 = a3;
  id v5 = IntentHandlerDefaultLog();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  os_signpost_id_t v7 = os_signpost_id_generate(v6);

  id v8 = IntentHandlerDefaultLog();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  v10 = v9;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v10,  OS_SIGNPOST_INTERVAL_BEGIN,  v7,  "contactsMatchingName",  (const char *)&unk_1000275CF,  buf,  2u);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 displayName]);
  objc_super v12 = (void *)objc_claimAutoreleasedReturnValue( +[CNContact predicateForContactsMatchingName:options:]( &OBJC_CLASS___CNContact,  "predicateForContactsMatchingName:options:",  v11,  1LL));

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[ContactResolver contactsDataSource](self, "contactsDataSource"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[ContactResolver keysToFetch](&OBJC_CLASS___ContactResolver, "keysToFetch"));
  id v35 = 0LL;
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 unifiedContactsMatchingPredicate:v12 keysToFetch:v14 error:&v35]);
  id v16 = v35;
  v17 = &__NSArray0__struct;
  if (v15) {
    v17 = v15;
  }
  id v18 = v17;

  if (v16)
  {
    id v19 = IntentHandlerDefaultLog();
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_10001FF84((uint64_t)v16, v20, v21, v22, v23, v24, v25, v26);
    }
  }

  id v27 = IntentHandlerDefaultLog();
  __int16 v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
    sub_10001FEFC(v18, v28);
  }

  id v29 = IntentHandlerDefaultLog();
  v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
  v31 = v30;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
  {
    *(_WORD *)v34 = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v31,  OS_SIGNPOST_INTERVAL_END,  v7,  "contactsMatchingName",  (const char *)&unk_1000275CF,  v34,  2u);
  }

  id v32 = [v18 copy];
  return v32;
}

- (void)_sendSiriMatchAnalyticsEventForIdentifiers:(id)a3 contactsMatchingId:(id)a4 contactsMatchingName:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v18 = (id)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [a3 count]));
  id v10 = [v9 count];

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v10));
  id v12 = [v8 count];

  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v12));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[INPreferences sharedPreferences](&OBJC_CLASS___INPreferences, "sharedPreferences"));
  uint64_t v15 = objc_claimAutoreleasedReturnValue([v14 _cachedSiriLanguageCode]);

  if (v15) {
    id v16 = (__CFString *)v15;
  }
  else {
    id v16 = @"N/A";
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ContactResolver coreAnalyticsLogger](self, "coreAnalyticsLogger"));
  [v17 logSiriMatchEvent:v18 matchesByIdCount:v11 matchesByNameCount:v13 siriLocale:v16];
}

- (TUContactsDataSource)contactsDataSource
{
  return self->_contactsDataSource;
}

- (IntentHandlerCoreAnalyticsLogging)coreAnalyticsLogger
{
  return self->_coreAnalyticsLogger;
}

- (void).cxx_destruct
{
}

@end