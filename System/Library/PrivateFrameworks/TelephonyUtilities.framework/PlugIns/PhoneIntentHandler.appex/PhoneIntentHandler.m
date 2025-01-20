LABEL_20:
        }

        v13 = [obj countByEnumeratingWithState:&v55 objects:v62 count:16];
      }

      while (v13);
    }

    v24 = (os_log_s *)v44;
    v25 = -[NSMutableArray count](v44, "count");
    if (v25 != [v46 count])
    {
      v26 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      -[NSMutableSet addObjectsFromArray:](v26, "addObjectsFromArray:", v44);
      v49 = 0u;
      v50 = 0u;
      v47 = 0u;
      v48 = 0u;
      v27 = v46;
      v28 = [v27 countByEnumeratingWithState:&v47 objects:v60 count:16];
      if (v28)
      {
        v29 = v28;
        v30 = *(void *)v48;
        do
        {
          for (k = 0LL; k != v29; k = (char *)k + 1)
          {
            if (*(void *)v48 != v30) {
              objc_enumerationMutation(v27);
            }
            v32 = *(void *)(*((void *)&v47 + 1) + 8LL * (void)k);
          }

          v29 = [v27 countByEnumeratingWithState:&v47 objects:v60 count:16];
        }

        while (v29);
      }
    }

    v33 = IntentHandlerDefaultLog();
    v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    v35 = v34;
    if (v41 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v35,  OS_SIGNPOST_INTERVAL_END,  spid,  "sortMatchingContactsWithIdentifiers",  (const char *)&unk_1000275CF,  buf,  2u);
    }

    v36 = -[NSMutableArray copy](v44, "copy");
    v5 = v42;
  }

  else
  {
    v37 = IntentHandlerDefaultLog();
    v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
    v24 = v38;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v24,  OS_SIGNPOST_INTERVAL_END,  v8,  "sortMatchingContactsWithIdentifiers",  (const char *)&unk_1000275CF,  buf,  2u);
    }

    v36 = &__NSArray0__struct;
  }

  return v36;
}

void sub_100004A6C(id a1)
{
  v5[0] = CNContactPhoneNumbersKey;
  v5[1] = CNContactEmailAddressesKey;
  v5[2] = CNContactPhonemeDataKey;
  v1 = (void *)objc_claimAutoreleasedReturnValue( +[NSPersonNameComponents descriptorForUsedKeys]( &OBJC_CLASS___NSPersonNameComponents,  "descriptorForUsedKeys"));
  v5[3] = v1;
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[CNContactFormatter descriptorForRequiredKeysForStyle:]( &OBJC_CLASS___CNContactFormatter,  "descriptorForRequiredKeysForStyle:",  0LL));
  v5[4] = v2;
  v5[5] = CNContactIdentifierKey;
  uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v5, 6LL));
  v4 = (void *)qword_10003E570;
  qword_10003E570 = v3;
}

void sub_1000053CC( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_100005450(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_10003E580;
  qword_10003E580 = (uint64_t)v1;
}

id sub_100005F60(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) groupId]);
  if ([v4 length])
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue([v3 messagesGroupName]);
    if ([v5 length])
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue([v3 messagesGroupName]);
      v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) groupName]);
      id v8 = [v6 isEqualToIgnoringCase:v7];
    }

    else
    {
      id v8 = 0LL;
    }
  }

  else
  {
    id v8 = 0LL;
  }

  id v9 = IntentHandlerDefaultLog();
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = @"NO";
    if ((_DWORD)v8) {
      v11 = @"YES";
    }
    int v13 = 138412290;
    v14 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "SimpleConversationFilter: matchesCallGroup=%@",  (uint8_t *)&v13,  0xCu);
  }

  return v8;
}

BOOL sub_100006120(uint64_t a1, void *a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a2 remoteMembers]);
  id v4 = [v3 count];
  id v5 = *(id *)(a1 + 32);

  id v6 = IntentHandlerDefaultLog();
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = @"NO";
    if (v4 == v5) {
      id v8 = @"YES";
    }
    int v10 = 138412290;
    v11 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "SimpleConversationFilter: matchesParticipantCount=%@",  (uint8_t *)&v10,  0xCu);
  }

  return v4 == v5;
}
}

LABEL_11:
    v22 = (void *)objc_claimAutoreleasedReturnValue([v7 value]);
    v23 = (void *)objc_claimAutoreleasedReturnValue( +[CNPhoneNumber phoneNumberWithStringValue:]( &OBJC_CLASS___CNPhoneNumber,  "phoneNumberWithStringValue:",  v22));
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[CNContact predicateForContactsMatchingPhoneNumber:]( &OBJC_CLASS___CNContact,  "predicateForContactsMatchingPhoneNumber:",  v23));

    goto LABEL_14;
  }

  if (v19 == (id)2) {
    goto LABEL_11;
  }
  if (v19 != (id)3) {
    goto LABEL_23;
  }
LABEL_13:
  v22 = (void *)objc_claimAutoreleasedReturnValue([v7 value]);
  v24 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[CNContact predicateForContactsMatchingEmailAddress:]( &OBJC_CLASS___CNContact,  "predicateForContactsMatchingEmailAddress:",  v22));
LABEL_14:

  if (!v24) {
    goto LABEL_23;
  }
  v69[0] = CNContactPhoneNumbersKey;
  v69[1] = CNContactEmailAddressesKey;
  v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSPersonNameComponents descriptorForUsedKeys]( &OBJC_CLASS___NSPersonNameComponents,  "descriptorForUsedKeys"));
  v69[2] = v27;
  v28 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v69, 3LL));

  v67 = v8;
  v68 = 0LL;
  v66 = (void *)v28;
  v29 = (void *)objc_claimAutoreleasedReturnValue([v8 unifiedContactsMatchingPredicate:v24 keysToFetch:v28 error:&v68]);
  v30 = v68;
  if (v30)
  {
    v31 = IntentHandlerDefaultLog();
    v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      sub_1000200C0((uint64_t)v30, v32, v33, v34, v35, v36, v37, v38);
    }
  }

  if (![v29 count])
  {
    v50 = IntentHandlerDefaultLog();
    v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v41 = "No contacts match handle";
      goto LABEL_28;
    }

    return 0LL;
  }

  if (v3 == 2)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[CallHistoryDataSourcePredicate predicateForFaceTimeCalls]( &OBJC_CLASS___CallHistoryDataSourcePredicate,  "predicateForFaceTimeCalls"));
    return v4;
  }

  if (v3 != 1)
  {
    id v9 = IntentHandlerDefaultLog();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100020510(v7, v10, v11, v12, v13, v14, v15, v16);
    }
    goto LABEL_11;
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[CallHistoryDataSourcePredicate predicateForTelephonyCalls]( &OBJC_CLASS___CallHistoryDataSourcePredicate,  "predicateForTelephonyCalls"));
  return v4;
}

LABEL_29:
    goto LABEL_30;
  }

  if ((unint64_t)[v29 count] >= 2)
  {
    v39 = IntentHandlerDefaultLog();
    v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v41 = "[WARN] Multiple contacts match handle, using the first one arbitrarily";
LABEL_28:
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, v41, buf, 2u);
      goto LABEL_29;
    }

    goto LABEL_29;
  }

LABEL_30:
  spid = v12;
  v51 = (void *)objc_claimAutoreleasedReturnValue([v29 firstObject]);
  v52 = v51;
  v65 = v30;
  if (v51)
  {
    v53 = v9;
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "tu_personHandleMatchingHandle:isoCountryCodes:", v7, v9));
    v55 = (void *)objc_claimAutoreleasedReturnValue( +[NSPersonNameComponents componentsForContact:]( &OBJC_CLASS___NSPersonNameComponents,  "componentsForContact:",  v52));
  }

  else
  {
    v56 = objc_alloc(&OBJC_CLASS___INPersonHandle);
    v53 = v9;
    v54 = (void *)objc_claimAutoreleasedReturnValue( -[INPersonHandle tu_initUnlabledPersonHandleWithTUHandle:isoCountryCodes:]( v56,  "tu_initUnlabledPersonHandleWithTUHandle:isoCountryCodes:",  v7,  v9));

    v55 = 0LL;
  }

  v57 = objc_alloc(&OBJC_CLASS___INPerson);
  v58 = (void *)objc_claimAutoreleasedReturnValue([v52 identifier]);
  LOBYTE(v63) = 0;
  v49 = -[INPerson initWithPersonHandle:nameComponents:displayName:image:contactIdentifier:customIdentifier:isMe:]( v57,  "initWithPersonHandle:nameComponents:displayName:image:contactIdentifier:customIdentifier:isMe:",  v54,  v55,  0LL,  0LL,  v58,  0LL,  v63);

  v59 = IntentHandlerDefaultLog();
  v60 = (os_log_s *)objc_claimAutoreleasedReturnValue(v59);
  v61 = v60;
  if (v16 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v60))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v61,  OS_SIGNPOST_INTERVAL_END,  spid,  "personMatchingHandle",  (const char *)&unk_1000275CF,  buf,  2u);
  }

  id v8 = v67;
  id v9 = v53;
LABEL_37:

  return v49;
}

LABEL_24:
  if (!a7) {
    goto LABEL_39;
  }
  v50 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if ((a7 & 1) != 0)
  {
    v51 = (void *)objc_claimAutoreleasedReturnValue( +[CallHistoryDataSourcePredicate predicateForAudioCalls]( &OBJC_CLASS___CallHistoryDataSourcePredicate,  "predicateForAudioCalls"));
    -[NSMutableArray addObject:](v50, "addObject:", v51);
  }

  if ((a7 & 2) != 0)
  {
    v52 = (void *)objc_claimAutoreleasedReturnValue( +[CallHistoryDataSourcePredicate predicateForVideoCalls]( &OBJC_CLASS___CallHistoryDataSourcePredicate,  "predicateForVideoCalls"));
    -[NSMutableArray addObject:](v50, "addObject:", v52);
  }

  if (a7 >= 4)
  {
    v53 = IntentHandlerDefaultLog();
    v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
      sub_10002024C(a7, v54, v55, v56, v57, v58, v59, v60);
    }
  }

  if (-[NSMutableArray count](v50, "count", v87) == (id)1)
  {
    v61 = objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](v50, "firstObject"));
LABEL_37:
    v62 = (void *)v61;
    -[NSMutableArray addObject:](v16, "addObject:", v61);

    goto LABEL_38;
  }

  if ((unint64_t)-[NSMutableArray count](v50, "count") >= 2)
  {
    v61 = objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate orPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "orPredicateWithSubpredicates:",  v50));
    goto LABEL_37;
  }

LABEL_38:
LABEL_39:
  if (v87 == 2)
  {
    v63 = objc_claimAutoreleasedReturnValue( +[CallHistoryDataSourcePredicate predicateForFaceTimeCalls]( &OBJC_CLASS___CallHistoryDataSourcePredicate,  "predicateForFaceTimeCalls"));
  }

  else
  {
    if (v87 != 1) {
      goto LABEL_44;
    }
    v63 = objc_claimAutoreleasedReturnValue( +[CallHistoryDataSourcePredicate predicateForTelephonyCalls]( &OBJC_CLASS___CallHistoryDataSourcePredicate,  "predicateForTelephonyCalls"));
  }

  v64 = (void *)v63;
  -[NSMutableArray addObject:](v16, "addObject:", v63, v87);

LABEL_44:
  if (v89)
  {
    v65 = (void *)objc_claimAutoreleasedReturnValue( +[CallHistoryDataSourcePredicate predicateForCallsThatAreRead:]( CallHistoryDataSourcePredicate,  "predicateForCallsThatAreRead:",  [v89 BOOLValue] ^ 1));
    -[NSMutableArray addObject:](v16, "addObject:", v65);
  }

  v66 = (void *)objc_claimAutoreleasedReturnValue(-[SearchCallHistoryIntentHandler dataSource](self, "dataSource", v87));
  v67 = [v66 restrictedCallTypes];

  if (v67)
  {
    v68 = (void *)objc_claimAutoreleasedReturnValue( +[CallHistoryDataSourcePredicate predicateFilteringOutCallTypes:]( &OBJC_CLASS___CallHistoryDataSourcePredicate,  "predicateFilteringOutCallTypes:",  v67));
    -[NSMutableArray addObject:](v16, "addObject:", v68);
  }

  if (-[NSMutableArray count](v16, "count") == (id)1)
  {
    v69 = objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](v16, "firstObject"));
LABEL_52:
    v70 = (void *)v69;
    goto LABEL_54;
  }

  if ((unint64_t)-[NSMutableArray count](v16, "count") >= 2)
  {
    v69 = objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate andPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "andPredicateWithSubpredicates:",  v16));
    goto LABEL_52;
  }

  v70 = 0LL;
LABEL_54:
  v71 = IntentHandlerDefaultLog();
  v72 = (os_log_s *)objc_claimAutoreleasedReturnValue(v71);
  if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v94 = v70;
    _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, "Using predicate: %@", buf, 0xCu);
  }

  v73 = (void *)objc_claimAutoreleasedReturnValue(-[SearchCallHistoryIntentHandler dataSource](self, "dataSource"));
  v74 = (void *)objc_claimAutoreleasedReturnValue([v73 callHistoryDataSource]);
  v75 = (void *)objc_claimAutoreleasedReturnValue([v74 coalescedCallsWithPredicate:v70 limit:a9 offset:0 batchSize:a9]);

  v76 = IntentHandlerDefaultLog();
  v77 = (os_log_s *)objc_claimAutoreleasedReturnValue(v76);
  if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v94 = v75;
    _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_DEFAULT, "Call history search results: %@", buf, 0xCu);
  }

  v78 = (void *)objc_claimAutoreleasedReturnValue(+[CallRecordConverter sharedInstance](&OBJC_CLASS___CallRecordConverter, "sharedInstance"));
  v79 = (void *)objc_claimAutoreleasedReturnValue(-[SearchCallHistoryIntentHandler dataSource](self, "dataSource"));
  v80 = (void *)objc_claimAutoreleasedReturnValue([v79 contactsDataSource]);
  v81 = (void *)objc_claimAutoreleasedReturnValue(-[SearchCallHistoryIntentHandler dataSource](self, "dataSource"));
  v82 = (void *)objc_claimAutoreleasedReturnValue([v81 providerManager]);
  v83 = (void *)objc_claimAutoreleasedReturnValue( [v78 callRecordsForRecentCalls:v75 withContactsDataSource:v80 withCallProviderManager:v82]);

  v84 = IntentHandlerDefaultLog();
  v85 = (os_log_s *)objc_claimAutoreleasedReturnValue(v84);
  if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v94 = v83;
    _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_DEFAULT, "callRecords: %@", buf, 0xCu);
  }

  return v83;
}

id sub_10000A7C8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v3[0] = @"siriMatchesCount";
  v3[1] = @"matchesByIdCount";
  __int128 v5 = *(_OWORD *)(a1 + 40);
  v3[2] = @"matchesByNameCount";
  v3[3] = @"siriLocale";
  uint64_t v4 = v1;
  uint64_t v6 = *(void *)(a1 + 56);
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v4,  v3,  4LL));
}

LABEL_26:
    uint64_t v6 = 0LL;
    goto LABEL_3;
  }

LABEL_2:
  -[IntentRouter updateRecentlyUsedHandlersWithHandler:](self, "updateRecentlyUsedHandlersWithHandler:", v6);
LABEL_3:
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IntentHandlerAndIdentifier handler](v6, "handler"));

  return v7;
}

LABEL_14:
  objc_sync_exit(v5);
  if (!v7)
  {
    v15 = IntentHandlerDefaultLog();
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      sub_1000203BC();
    }
LABEL_20:
  }

  return v7;
}

LABEL_15:
  return v8;
}

  return (char)v6;
}

void sub_10000AE04(_Unwind_Exception *a1)
{
}

void sub_10000B008( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10000B028(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  v7 = (void *)objc_claimAutoreleasedReturnValue([a2 handler]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) handler]);

  if (v7 == v8)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = a3;
    *a4 = 1;
  }

void sub_10000B208(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = IntentHandlerDefaultLog();
  __int128 v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10002047C();
    }
  }

  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Registered for drop-in calls", buf, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 16LL));
  id v7 = IntentHandlerDefaultLog();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = v8;
  os_signpost_id_t v10 = *(void *)(a1 + 40);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)v11 = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v9,  OS_SIGNPOST_INTERVAL_END,  v10,  "HangUpIntentHandlerRegisterForProvider",  (const char *)&unk_1000275CF,  v11,  2u);
  }
}

void sub_10000B478( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_10000D0AC( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_10000D1AC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v8 = -[TUHandle initWithType:value:](objc_alloc(&OBJC_CLASS___TUHandle), "initWithType:value:", 2LL, v6);

  id v7 = [[TULabeledHandle alloc] initWithHandle:v8 label:v5 isSuggested:0];
  [*(id *)(a1 + 32) addObject:v7];
}

LABEL_34:
    v44 = -[INStartCallIntentResponse initWithCode:userActivity:]( objc_alloc(&OBJC_CLASS___INStartCallIntentResponse),  "initWithCode:userActivity:",  3LL,  0LL);
    v42 = v44;
    v45 = &__kCFBooleanTrue;
LABEL_41:
    -[INStartCallIntentResponse setShouldDoEmergencyCountdown:](v44, "setShouldDoEmergencyCountdown:", v45);
    goto LABEL_42;
  }

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[INStartCallIntentResponse contacts](v7, "contacts"));
  v29 = (void *)objc_claimAutoreleasedReturnValue([v28 firstObject]);

  v30 = objc_claimAutoreleasedReturnValue([v29 personHandle]);
  if (!v30) {
    goto LABEL_49;
  }
  v31 = (void *)v30;
  v32 = (void *)objc_claimAutoreleasedReturnValue([v29 personHandle]);
  v33 = objc_claimAutoreleasedReturnValue([v32 value]);
  if (!v33)
  {

    goto LABEL_49;
  }

  v34 = (void *)v33;
  v35 = (void *)objc_claimAutoreleasedReturnValue([v29 personHandle]);
  v57 = v29;
  v36 = v11;
  v37 = (void *)objc_claimAutoreleasedReturnValue([v35 value]);
  v38 = -[StartCallIntentHandler isEmergencyHandle:](self, "isEmergencyHandle:", v37);

  v11 = v36;
  v29 = v57;

  v18 = &off_100026000;
  if (!v38)
  {
LABEL_49:
    v55 = IntentHandlerDefaultLog();
    v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v56,  OS_LOG_TYPE_DEFAULT,  "Contact to redial/call back is NOT an emergency number.",  buf,  2u);
    }

    v42 = -[INStartCallIntentResponse initWithCode:userActivity:]( objc_alloc(&OBJC_CLASS___INStartCallIntentResponse),  "initWithCode:userActivity:",  1LL,  0LL);
    -[INStartCallIntentResponse setShouldDoEmergencyCountdown:]( v42,  "setShouldDoEmergencyCountdown:",  &__kCFBooleanFalse);
    goto LABEL_52;
  }

  v39 = IntentHandlerDefaultLog();
  v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "Contact to redial/call back is an emergency number. Requiring intent confirmation.",  buf,  2u);
  }

  if (-[INStartCallIntentResponse destinationType](v7, "destinationType") == (id)4) {
    v41 = 2LL;
  }
  else {
    v41 = 3LL;
  }
  v42 = -[INStartCallIntentResponse initWithCode:userActivity:]( objc_alloc(&OBJC_CLASS___INStartCallIntentResponse),  "initWithCode:userActivity:",  3LL,  0LL);
  -[INStartCallIntentResponse setShouldDoEmergencyCountdown:](v42, "setShouldDoEmergencyCountdown:", &__kCFBooleanFalse);
  -[INStartCallIntentResponse setConfirmationReason:](v42, "setConfirmationReason:", v41);
LABEL_52:

LABEL_42:
  v50 = IntentHandlerDefaultLog();
  v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = *((void *)v18 + 232);
    v59 = v42;
    _os_log_impl( (void *)&_mh_execute_header,  v51,  OS_LOG_TYPE_DEFAULT,  "Calling completion block with response: %@",  buf,  0xCu);
  }

  v52 = IntentHandlerDefaultLog();
  v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
  v54 = v53;
  if (v15 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v53))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v54,  OS_SIGNPOST_INTERVAL_END,  v11,  "confirmStartCall",  (const char *)&unk_1000275CF,  buf,  2u);
  }

  v8[2](v8, v42);
}

    if (a5 || v18 != 2) {
      goto LABEL_43;
    }
    if (!-[StartCallIntentHandler shouldForceAudioOnlyWithIdiom:withDisplayDisabled:]( self,  "shouldForceAudioOnlyWithIdiom:withDisplayDisabled:",  a6,  v9))
    {
      v18 = 2LL;
      goto LABEL_43;
    }

    v36 = IntentHandlerDefaultLog();
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_40;
    }
    LOWORD(v39) = 0;
    v21 = "Changing callCapability from video to audio because the current idiom only supports audio";
    goto LABEL_39;
  }

  if (a8 == 1)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler dataSource](self, "dataSource"));
    v23 = [v22 supportsFaceTimeVideoCalls];

    if (!v23)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler dataSource](self, "dataSource"));
      v33 = [v32 supportsFaceTimeAudioCalls];

      v34 = IntentHandlerDefaultLog();
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
      v35 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
      if (v33)
      {
        if (v35)
        {
          LOWORD(v39) = 0;
          v21 = "Inferring audio callCapability because provider is FaceTime and audio is supported";
          goto LABEL_39;
        }

        goto LABEL_40;
      }

      if (!v35) {
        goto LABEL_33;
      }
      LOWORD(v39) = 0;
      v25 = "[WARN] Unable to infer callCapability. Execution Context is assistantDialog. Provider is Facetime, but neith"
            "er facetime audio nor video calling are supported.";
      goto LABEL_32;
    }

    v24 = IntentHandlerDefaultLog();
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v39) = 0;
      v25 = "Inferring video callCapability because provider is FaceTime and video is supported.";
      v18 = 2LL;
LABEL_32:
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, v25, (uint8_t *)&v39, 2u);
      goto LABEL_33;
    }

    v18 = 2LL;
    goto LABEL_33;
  }

  if (a5 == 2)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler dataSource](self, "dataSource"));
    v27 = [v26 supportsFaceTimeVideoCalls];

    if (v27)
    {
      v28 = IntentHandlerDefaultLog();
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v39) = 0;
        v18 = 2LL;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Inferring video callCapability because provider is FaceTime, requested callCapability was video and video is supported.",  (uint8_t *)&v39,  2u);
      }

      else
      {
        v18 = 2LL;
      }

      goto LABEL_41;
    }
  }

  v29 = -[StartCallIntentHandler shouldInferAudioCapabilityForRequestedCallCapability:idiom:isDisplayDisabled:]( self,  "shouldInferAudioCapabilityForRequestedCallCapability:idiom:isDisplayDisabled:",  a5,  a6,  v9);
  v30 = IntentHandlerDefaultLog();
  v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
  v31 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
  if (!v29)
  {
    if (v31)
    {
      LOWORD(v39) = 0;
      v25 = "[WARN] Unable to infer callCapability. Execution Context is not assistantDialog. Provider is Facetime, but n"
            "either facetime audio nor video calling are supported.";
      goto LABEL_32;
    }

        int v13 = (char *)v13 + 1;
      }

      while (v13 != v12);
      v241 = [v10 countByEnumeratingWithState:&v318 objects:v340 count:16];
      v12 = v241;
      if (!v241)
      {
LABEL_209:

        v242 = (os_log_s *)-[NSMutableArray copy](v9, "copy");
        v243 = (void *)objc_claimAutoreleasedReturnValue([v4 contacts]);
        v244 = [v243 count];

        v245 = v4;
        v246 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
        v298 = 0u;
        v299 = 0u;
        v300 = 0u;
        v301 = 0u;
        v247 = v9;
        v248 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v247,  "countByEnumeratingWithState:objects:count:",  &v298,  v323,  16LL);
        if (!v248) {
          goto LABEL_222;
        }
        v249 = v248;
        v250 = 0;
        v251 = *(void *)v299;
        while (1)
        {
          v252 = 0LL;
          v253 = v250;
          do
          {
            if (*(void *)v299 != v251) {
              objc_enumerationMutation(v247);
            }
            v254 = *(void **)(*((void *)&v298 + 1) + 8LL * (void)v252);
            if ([v254 resolutionResultCode])
            {
              v255 = objc_claimAutoreleasedReturnValue([v286 objectAtIndexedSubscript:(char *)v252 + v253]);
            }

            else
            {
              v255 = objc_claimAutoreleasedReturnValue([v254 resolvedValue]);
            }

            v256 = (void *)v255;
            -[NSMutableArray addObject:](v246, "addObject:", v255);

LABEL_220:
            v252 = (char *)v252 + 1;
          }

          while (v249 != v252);
          v249 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v247,  "countByEnumeratingWithState:objects:count:",  &v298,  v323,  16LL);
          v250 = v253 + (_DWORD)v252;
          if (!v249)
          {
LABEL_222:
            v279 = v247;

            [v245 setValue:v246 forKey:@"contacts"];
            v296 = 0u;
            v297 = 0u;
            v294 = 0u;
            v295 = 0u;
            v257 = (void *)objc_claimAutoreleasedReturnValue([v245 contacts]);
            v258 = [v257 countByEnumeratingWithState:&v294 objects:v322 count:16];
            if (v258)
            {
              v259 = v258;
              v260 = *(void *)v295;
              do
              {
                for (n = 0LL; n != v259; n = (char *)n + 1)
                {
                  if (*(void *)v295 != v260) {
                    objc_enumerationMutation(v257);
                  }
                  v262 = *(os_log_s **)(*((void *)&v294 + 1) + 8LL * (void)n);
                  v263 = IntentHandlerDefaultLog();
                  v264 = (os_log_s *)objc_claimAutoreleasedReturnValue(v263);
                  if (os_log_type_enabled(v264, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    v326 = v262;
                    _os_log_impl( (void *)&_mh_execute_header,  v264,  OS_LOG_TYPE_DEFAULT,  "Updated contact in intent: %@",  buf,  0xCu);
                  }
                }

                v259 = [v257 countByEnumeratingWithState:&v294 objects:v322 count:16];
              }

              while (v259);
            }

            id v4 = v290;
            id v9 = v279;
            goto LABEL_235;
          }
        }
      }
    }
  }

  v265 = IntentHandlerDefaultLog();
  v266 = (os_log_s *)objc_claimAutoreleasedReturnValue(v265);
  if (os_log_type_enabled(v266, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v266,  OS_LOG_TYPE_DEFAULT,  "Resolution needs a value for zero contacts",  buf,  2u);
  }

  id v9 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( +[INStartCallContactResolutionResult needsValue]( &OBJC_CLASS___INStartCallContactResolutionResult,  "needsValue"));
  v341 = v9;
  v242 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v341, 1LL));
LABEL_235:

  v267 = IntentHandlerDefaultLog();
  v268 = (os_log_s *)objc_claimAutoreleasedReturnValue(v267);
  if (os_log_type_enabled(v268, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v326 = v242;
    _os_log_impl((void *)&_mh_execute_header, v268, OS_LOG_TYPE_DEFAULT, "resolutionResults: %@", buf, 0xCu);
  }

  return v242;
}
                    }

                    v23 = [v56 countByEnumeratingWithState:&v63 objects:v82 count:16];
                  }

                  while (v23);
                }

                v20 = v54 + 1;
              }

              while ((id)(v54 + 1) != v53);
              v53 = [v50 countByEnumeratingWithState:&v67 objects:v83 count:16];
            }

            while (v53);
          }

          v18 = v49 + 1;
        }

        while ((id)(v49 + 1) != v48);
        v48 = [obj countByEnumeratingWithState:&v71 objects:v84 count:16];
      }

      while (v48);
    }

    v35 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableOrderedSet array](v57, "array"));
    id v7 = v44;
    [v44 addScore:6 forEntities:v35 reason:@"Call Recency"];

    v14 = v42;
    os_signpost_id_t v10 = v43;
    v17 = v41;
  }

  v36 = IntentHandlerDefaultLog();
  v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "Completed call recency for handles check.",  buf,  2u);
  }

  v38 = IntentHandlerDefaultLog();
  v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
  v40 = v39;
  if (v14 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v39))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v40,  OS_SIGNPOST_INTERVAL_END,  v10,  "recentCallsMatchingHandles",  (const char *)&unk_1000275CF,  buf,  2u);
  }
}

LABEL_13:
    id v8 = 0LL;
    goto LABEL_14;
  }

  id v5 = [v3 mediaType];
  if (!v5)
  {
    v12 = IntentHandlerDefaultLog();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 0;
      os_signpost_id_t v10 = "[WARN] Unable to infer callCapability from call to redial because media type of that call was unknown.";
      v11 = (uint8_t *)&v15;
      goto LABEL_12;
    }

    goto LABEL_13;
  }

  if (v5 == (id)2)
  {
    v14 = IntentHandlerDefaultLog();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      id v8 = 2LL;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Inferring video call capability from call to redial",  v16,  2u);
    }

    else
    {
      id v8 = 2LL;
    }
  }

  else
  {
    if (v5 != (id)1)
    {
      id v8 = 0LL;
      goto LABEL_15;
    }

    id v6 = IntentHandlerDefaultLog();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Inferring audio call capability from call to redial",  buf,  2u);
    }

    id v8 = 1LL;
  }

LABEL_33:
    goto LABEL_34;
  }

  if (v31)
  {
    LOWORD(v39) = 0;
    v21 = "Inferring audio callCapability because provider is FaceTime, request callCapability was audio and audio is supported";
    goto LABEL_39;
  }

LABEL_40:
  v18 = 1LL;
LABEL_41:

LABEL_43:
  v37 = IntentHandlerDefaultLog();
  v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v39 = 134217984;
    v40 = v18;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Returning call Capability %ld",  (uint8_t *)&v39,  0xCu);
  }

  a5 = v18;
LABEL_46:

  return a5;
}

LABEL_16:
    id v4 = 1;
  }

  return v4 & 1;
}

void sub_100010C08(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = IntentHandlerDefaultLog();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = v5;
  os_signpost_id_t v7 = *(void *)(a1 + 40);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)id v8 = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v6,  OS_SIGNPOST_INTERVAL_END,  v7,  "resolveFaceTimeLink",  (const char *)&unk_1000275CF,  v8,  2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

LABEL_18:
      v31 = objc_claimAutoreleasedReturnValue( +[INStartCallPreferredCallProviderResolutionResult notRequired]( &OBJC_CLASS___INStartCallPreferredCallProviderResolutionResult,  "notRequired"));
LABEL_53:
      v30 = (void *)v31;
      goto LABEL_54;
    }

    v33 = -[StartCallIntentHandler inferCallCapabilityForPreferredCallProvider:recentCall:initialCallCapability:idiom:isDisplayDisabled:executionContext:]( self,  "inferCallCapabilityForPreferredCallProvider:recentCall:initialCallCapability:idiom:isDisplayDisabled:executionContext:",  2,  v19,  [v6 callCapability],  objc_msgSend(v6, "_idiom"),  objc_msgSend(v6, "_isPrimaryDisplayDisabled"),  objc_msgSend(v6, "_executionContext"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler faceTimeUtilities](self, "faceTimeUtilities"));
    v35 = [v34 isFaceTimeEnabledInSettings];

    if ((v35 & 1) == 0)
    {
      v42 = IntentHandlerDefaultLog();
      v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
        sub_1000208B4();
      }

      v44 = 6LL;
      goto LABEL_47;
    }

    if (v33 == 2)
    {
      if (-[StartCallIntentHandler shouldForceAudioOnlyWithIdiom:withDisplayDisabled:]( self,  "shouldForceAudioOnlyWithIdiom:withDisplayDisabled:",  [v6 _idiom],  objc_msgSend(v6, "_isPrimaryDisplayDisabled")))
      {
        v52 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler dataSource](self, "dataSource"));
        v53 = [v52 isFaceTimeVideoBlocked];

        if (v53)
        {
          v54 = IntentHandlerDefaultLog();
          v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
LABEL_45:
          }
            sub_100020780();
LABEL_46:

          v44 = 4LL;
LABEL_47:
          v31 = objc_claimAutoreleasedReturnValue( +[INStartCallPreferredCallProviderResolutionResult unsupportedForReason:]( &OBJC_CLASS___INStartCallPreferredCallProviderResolutionResult,  "unsupportedForReason:",  v44));
          goto LABEL_53;
        }

        v69 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler dataSource](self, "dataSource"));
        v70 = [v69 supportsDisplayingFaceTimeVideoCalls];

        if ((v70 & 1) != 0)
        {
          v71 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler dataSource](self, "dataSource"));
          v72 = [v71 isDirectFaceTimeVideoCallingCurrentlyAvailable];

          v73 = IntentHandlerDefaultLog();
          v67 = (os_log_s *)objc_claimAutoreleasedReturnValue(v73);
          v74 = os_log_type_enabled(v67, OS_LOG_TYPE_ERROR);
          if ((v72 & 1) != 0)
          {
            if (v74) {
              sub_100020830();
            }
            goto LABEL_68;
          }

          if (v74) {
            sub_10002085C();
          }
LABEL_79:

          v44 = 5LL;
          goto LABEL_47;
        }

        v76 = IntentHandlerDefaultLog();
        v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v76);
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
          goto LABEL_72;
        }
        goto LABEL_73;
      }

      if (-[StartCallIntentHandler isGFTDisabledForChinaSKU:](self, "isGFTDisabledForChinaSKU:", v6))
      {
        v55 = IntentHandlerDefaultLog();
        v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
          sub_100020888();
        }
        goto LABEL_73;
      }
    }

    else if (v33 == 1)
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler dataSource](self, "dataSource"));
      v37 = [v36 supportsFaceTimeAudioCalls];

      if ((v37 & 1) == 0)
      {
        v38 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler dataSource](self, "dataSource"));
        v39 = [v38 isFaceTimeAudioBlocked];

        if (v39)
        {
          v40 = IntentHandlerDefaultLog();
          v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
            goto LABEL_45;
          }
          goto LABEL_46;
        }

        v62 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler dataSource](self, "dataSource"));
        v63 = [v62 supportsDisplayingFaceTimeAudioCalls];

        if ((v63 & 1) != 0)
        {
          v64 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler dataSource](self, "dataSource"));
          v65 = [v64 isDirectFaceTimeAudioCallingCurrentlyAvailable];

          v66 = IntentHandlerDefaultLog();
          v67 = (os_log_s *)objc_claimAutoreleasedReturnValue(v66);
          v68 = os_log_type_enabled(v67, OS_LOG_TYPE_ERROR);
          if ((v65 & 1) != 0)
          {
            if (v68) {
              sub_1000207AC();
            }
LABEL_68:

LABEL_74:
            v31 = objc_claimAutoreleasedReturnValue( +[INStartCallPreferredCallProviderResolutionResult unsupported]( &OBJC_CLASS___INStartCallPreferredCallProviderResolutionResult,  "unsupported"));
            goto LABEL_53;
          }

          if (v68) {
            sub_1000207D8();
          }
          goto LABEL_79;
        }

        v75 = IntentHandlerDefaultLog();
        v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v75);
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
LABEL_72:
        }
          sub_100020804();
LABEL_73:

        goto LABEL_74;
      }
    }

    v32 = 2LL;
    goto LABEL_52;
  }

  v27 = (void *)objc_claimAutoreleasedReturnValue( -[StartCallIntentHandler recentCallRecordToRedialForIntent:]( self,  "recentCallRecordToRedialForIntent:",  v6));
  v19 = v27;
  if (!v27) {
    goto LABEL_18;
  }
  v18 = [v27 preferredCallProvider];
  if (v18) {
    goto LABEL_8;
  }
  v28 = IntentHandlerDefaultLog();
  v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
    sub_100020644(v19, v29);
  }

  v30 = (void *)objc_claimAutoreleasedReturnValue( +[INStartCallPreferredCallProviderResolutionResult unsupported]( &OBJC_CLASS___INStartCallPreferredCallProviderResolutionResult,  "unsupported"));
  if (!v30) {
    goto LABEL_18;
  }
LABEL_54:
  v57 = IntentHandlerDefaultLog();
  v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = *((void *)v17 + 232);
    v80 = v30;
    _os_log_impl( (void *)&_mh_execute_header,  v58,  OS_LOG_TYPE_DEFAULT,  "Returning call provider resolution result: %@",  buf,  0xCu);
  }

  v59 = IntentHandlerDefaultLog();
  v60 = (os_log_s *)objc_claimAutoreleasedReturnValue(v59);
  v61 = v60;
  if (v14 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v60))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v61,  OS_SIGNPOST_INTERVAL_END,  v10,  "resolvePreferredCallProvider",  (const char *)&unk_1000275CF,  buf,  2u);
  }

  v7[2](v7, v30);
}

void sub_100011DDC(id a1)
{
  uint64_t v1 = (void *)qword_10003E590;
  qword_10003E590 = (uint64_t)&off_100035EB0;
}

LABEL_203:
                v53 = v278;
                os_signpost_id_t v10 = v286;
                v12 = v287;
                v109 = v291;
                self = v292;
LABEL_204:

                id v9 = v53;
                v16 = v285;
                goto LABEL_34;
              }
            }

            if ([v78 count] != (id)1)
            {
              if ([v282 count] == (id)1)
              {
                v89 = (os_log_s *)objc_claimAutoreleasedReturnValue([v282 allContacts]);
                v110 = IntentHandlerDefaultLog();
                v91 = (os_log_s *)objc_claimAutoreleasedReturnValue(v110);
                v31 = v280;
                if (!os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT)) {
                  goto LABEL_123;
                }
                v111 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[os_log_s firstObject](v89, "firstObject"));
                *(_DWORD *)buf = 138412290;
                v326 = v111;
                _os_log_impl( (void *)&_mh_execute_header,  v91,  OS_LOG_TYPE_DEFAULT,  "Only one matching contact (regardless of requested handle): %@",  buf,  0xCu);
              }

              else
              {
                v112 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler dataSource](v292, "dataSource"));
                v113 = [v112 useLegacyContactResolution];

                v31 = v280;
                if (v113)
                {
                  v274 = v79;
                  v114 = IntentHandlerDefaultLog();
                  v115 = (os_log_s *)objc_claimAutoreleasedReturnValue(v114);
                  if (os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl( (void *)&_mh_execute_header,  v115,  OS_LOG_TYPE_DEFAULT,  "Using legacy contact resolution",  buf,  2u);
                  }

                  v88 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
                  v310 = 0u;
                  v311 = 0u;
                  v312 = 0u;
                  v313 = 0u;
                  v116 = (void *)objc_claimAutoreleasedReturnValue([v282 allContacts]);
                  v117 = [v116 countByEnumeratingWithState:&v310 objects:v335 count:16];
                  if (v117)
                  {
                    v118 = v117;
                    v119 = *(void *)v311;
                    do
                    {
                      for (j = 0LL; j != v118; j = (char *)j + 1)
                      {
                        if (*(void *)v311 != v119) {
                          objc_enumerationMutation(v116);
                        }
                        v121 = (void *)objc_claimAutoreleasedReturnValue( +[StartCallIntentHandlerUtilities inPersonFromContact:handleValue:handleType:handleLabel:]( &OBJC_CLASS___StartCallIntentHandlerUtilities,  "inPersonFromContact:handleValue:handleType:handleLabel:",  *(void *)(*((void *)&v310 + 1) + 8LL * (void)j),  0LL,  v293,  v291));
                        -[NSMutableArray addObject:](v88, "addObject:", v121);
                      }

                      v118 = [v116 countByEnumeratingWithState:&v310 objects:v335 count:16];
                    }

                    while (v118);
                  }

                  v122 = IntentHandlerDefaultLog();
                  v123 = (os_log_s *)objc_claimAutoreleasedReturnValue(v122);
                  v58 = v282;
                  if (os_log_type_enabled(v123, OS_LOG_TYPE_DEFAULT))
                  {
                    v124 = (os_log_s *)[v282 count];
                    *(_DWORD *)buf = 134218242;
                    v326 = v124;
                    v327 = 2112;
                    v328 = v88;
                    _os_log_impl( (void *)&_mh_execute_header,  v123,  OS_LOG_TYPE_DEFAULT,  "Resolved to %ld contacts, asking the user to disambiguate among persons: %@",  buf,  0x16u);
                  }

                  v125 = (void *)objc_claimAutoreleasedReturnValue( +[INStartCallContactResolutionResult disambiguationWithPeopleToDisambiguate:]( &OBJC_CLASS___INStartCallContactResolutionResult,  "disambiguationWithPeopleToDisambiguate:",  v88));
                  -[NSMutableArray addObject:](v278, "addObject:", v125);

                  v89 = 0LL;
                  v31 = v280;
                  v79 = v274;
                  goto LABEL_201;
                }

                v126 = (void *)objc_claimAutoreleasedReturnValue([v282 allContacts]);
                v91 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[StartCallIntentHandler resolvePreferredContactFromContacts:]( v292,  "resolvePreferredContactFromContacts:",  v126));

                v127 = -[os_log_s resolutionResultType](v91, "resolutionResultType");
                v128 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[os_log_s resolvedEntities](v91, "resolvedEntities"));
                v111 = v128;
                switch((unint64_t)v127)
                {
                  case 0uLL:
                    v129 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  @"Unexpected score based contact resolution result type.",  0LL));
                    [v129 raise];
                    goto LABEL_120;
                  case 1uLL:
                    v129 = (id)objc_claimAutoreleasedReturnValue(-[os_log_s firstObject](v128, "firstObject"));
                    v271 = v111;
                    v153 = (void *)objc_claimAutoreleasedReturnValue([v282 contactWithId:v129]);
                    v334 = v153;
                    v89 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v334,  1LL));

                    v111 = v271;
                    goto LABEL_121;
                  case 2uLL:
                    v129 = (id)objc_claimAutoreleasedReturnValue(-[os_log_s firstObject](v128, "firstObject"));
                    v154 = objc_claimAutoreleasedReturnValue( -[ContactSlotResolutionHelper buildConfirmationResultForContact:withReason:]( v79,  "buildConfirmationResultForContact:withReason:",  v129,  3LL));
                    goto LABEL_119;
                  case 3uLL:
                    v129 = (id)objc_claimAutoreleasedReturnValue([v282 contactsWithIds:v128]);
                    if (-[StartCallIntentHandler anyContactsHaveSameName:](v292, "anyContactsHaveSameName:", v129))
                    {
                      v155 = IntentHandlerDefaultLog();
                      v156 = (os_log_s *)objc_claimAutoreleasedReturnValue(v155);
                      if (os_log_type_enabled(v156, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_WORD *)buf = 0;
                        _os_log_impl( (void *)&_mh_execute_header,  v156,  OS_LOG_TYPE_DEFAULT,  "ScoreBasedResolutionResult is Disambiguate, but some contacts have the same name. Proceeding t o handle disambiguation.",  buf,  2u);
                      }

                      v129 = v129;
                      v89 = (os_log_s *)v129;
                    }

                    else
                    {
                      v154 = objc_claimAutoreleasedReturnValue( -[ContactSlotResolutionHelper buildDisambiguationResultForContacts:]( v79,  "buildDisambiguationResultForContacts:",  v111));
LABEL_119:
                      v157 = v111;
                      v158 = (void *)v154;
                      -[NSMutableArray addObject:](v278, "addObject:", v154);

                      v111 = v157;
LABEL_120:
                      v89 = 0LL;
                    }

LABEL_121:
                    break;
                  default:
                    v89 = 0LL;
                    break;
                }
              }

              goto LABEL_123;
            }

            v89 = (os_log_s *)objc_claimAutoreleasedReturnValue([v78 allKeys]);
            v90 = IntentHandlerDefaultLog();
            v91 = (os_log_s *)objc_claimAutoreleasedReturnValue(v90);
            if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
            {
              v92 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[os_log_s firstObject](v89, "firstObject"));
              *(_DWORD *)buf = 138412290;
              v326 = v92;
              _os_log_impl( (void *)&_mh_execute_header,  v91,  OS_LOG_TYPE_DEFAULT,  "Only one matching contact for requested handle -- proceeding to handle disambiguation: %@",  buf,  0xCu);
            }

            v31 = v280;
LABEL_123:

            if (!v89 || !-[os_log_s count](v89, "count"))
            {
LABEL_202:
              int v13 = v288;
              goto LABEL_203;
            }

            v159 = v79;
            v88 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
            v306 = 0u;
            v307 = 0u;
            v308 = 0u;
            v309 = 0u;
            v89 = v89;
            v160 = -[os_log_s countByEnumeratingWithState:objects:count:]( v89,  "countByEnumeratingWithState:objects:count:",  &v306,  v333,  16LL);
            if (v160)
            {
              v161 = v160;
              v162 = *(void *)v307;
              do
              {
                for (k = 0LL; k != v161; k = (char *)k + 1)
                {
                  if (*(void *)v307 != v162) {
                    objc_enumerationMutation(v89);
                  }
                  v164 = (void *)objc_claimAutoreleasedReturnValue( [v78 objectForKeyedSubscript:*(void *)(*((void *)&v306 + 1) + 8 * (void)k)]);
                  -[NSMutableArray addObjectsFromArray:](v88, "addObjectsFromArray:", v164);
                }

                v161 = -[os_log_s countByEnumeratingWithState:objects:count:]( v89,  "countByEnumeratingWithState:objects:count:",  &v306,  v333,  16LL);
              }

              while (v161);
            }

            v276 = v159;

            v165 = -[NSMutableArray copy](v88, "copy");
            v166 = (void *)objc_claimAutoreleasedReturnValue( +[INPersonDeduplicator dedupeINPersons:]( &OBJC_CLASS___INPersonDeduplicator,  "dedupeINPersons:",  v165));

            if ([v166 count]
              || (v189 = (void *)objc_claimAutoreleasedReturnValue([v281 personHandle]),
                  v189,
                  !v189))
            {
              v167 = IntentHandlerDefaultLog();
              v168 = (os_log_s *)objc_claimAutoreleasedReturnValue(v167);
              if (os_log_type_enabled(v168, OS_LOG_TYPE_DEFAULT))
              {
                v169 = (os_log_s *)-[os_log_s count](v89, "count");
                v170 = (NSMutableArray *)[v166 count];
                *(_DWORD *)buf = 134218754;
                v326 = v169;
                v327 = 2048;
                v328 = v170;
                v329 = 2112;
                v330 = v89;
                v331 = 2112;
                v332 = v166;
                _os_log_impl( (void *)&_mh_execute_header,  v168,  OS_LOG_TYPE_DEFAULT,  "Resolved to %ld matching contacts with %ld matching handles. Contact: %@ Handles: %@",  buf,  0x2Au);
              }

              v171 = v166;
              v172 = v290;
              v58 = v282;
              v173 = v283;
              v79 = v276;
            }

            else
            {
              v190 = IntentHandlerDefaultLog();
              v191 = (os_log_s *)objc_claimAutoreleasedReturnValue(v190);
              if (os_log_type_enabled(v191, OS_LOG_TYPE_DEFAULT))
              {
                v192 = (os_log_s *)objc_claimAutoreleasedReturnValue([v281 personHandle]);
                *(_DWORD *)buf = 138412290;
                v326 = v192;
                _os_log_impl( (void *)&_mh_execute_header,  v191,  OS_LOG_TYPE_DEFAULT,  "No valid matching handle is found for the resolved contacts and this handle has been requested: %@. wi ll attempt additional matching handles from siri matches.",  buf,  0xCu);
              }

              v171 = (void *)objc_claimAutoreleasedReturnValue( -[StartCallIntentHandler generateAdditionalMatchingHandles:resolvedContacts:requestedHandleType:requestedHandleLabel:]( v292,  "generateAdditionalMatchingHandles:resolvedContacts:requestedHandleType:requestedHandleLabel:",  v281,  v89,  v293,  v291));
              v193 = IntentHandlerDefaultLog();
              v194 = (os_log_s *)objc_claimAutoreleasedReturnValue(v193);
              v79 = v276;
              v173 = v283;
              if (os_log_type_enabled(v194, OS_LOG_TYPE_DEFAULT))
              {
                v195 = v171;
                v196 = (os_log_s *)-[os_log_s count](v89, "count");
                v197 = (NSMutableArray *)[v195 count];
                *(_DWORD *)buf = 134218754;
                v326 = v196;
                v171 = v195;
                v327 = 2048;
                v328 = v197;
                v329 = 2112;
                v330 = v89;
                v331 = 2112;
                v332 = v195;
                _os_log_impl( (void *)&_mh_execute_header,  v194,  OS_LOG_TYPE_DEFAULT,  "Resolved to %ld matching contacts with %ld additional matching handles. Contact: %@ Handles: %@",  buf,  0x2Au);
              }

              v172 = v290;
              v58 = v282;
              if ([v171 count] == (id)1)
              {
                v198 = IntentHandlerDefaultLog();
                v199 = (os_log_s *)objc_claimAutoreleasedReturnValue(v198);
                v31 = v280;
                v272 = v171;
                if (os_log_type_enabled(v199, OS_LOG_TYPE_DEFAULT))
                {
                  v200 = (NSMutableArray *)objc_claimAutoreleasedReturnValue([v171 firstObject]);
                  *(_DWORD *)buf = 138412546;
                  v326 = (os_log_s *)v291;
                  v327 = 2112;
                  v328 = v200;
                  _os_log_impl( (void *)&_mh_execute_header,  v199,  OS_LOG_TYPE_DEFAULT,  "%@ was requested but the contact doesn't an exact match. Using the only alternative instead: %@",  buf,  0x16u);

                  v171 = v272;
                }

                v188 = (NSMutableArray *)objc_claimAutoreleasedReturnValue([v171 firstObject]);
                v201 = (void *)objc_claimAutoreleasedReturnValue( -[StartCallIntentHandler resolutionResultForPersonWithResolvedHandleValue:]( v292,  "resolutionResultForPersonWithResolvedHandleValue:",  v188));
                -[NSMutableArray addObject:](v278, "addObject:", v201);

                goto LABEL_166;
              }
            }

            v272 = v171;
            if (![v171 count])
            {
              v202 = IntentHandlerDefaultLog();
              v203 = (os_log_s *)objc_claimAutoreleasedReturnValue(v202);
              if (os_log_type_enabled(v203, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl( (void *)&_mh_execute_header,  v203,  OS_LOG_TYPE_DEFAULT,  "None of the resolved contacts have a valid matching handle. Offering all handles as alternatives",  buf,  2u);
              }

              v188 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
              v302 = 0u;
              v303 = 0u;
              v304 = 0u;
              v305 = 0u;
              v204 = v89;
              v205 = -[os_log_s countByEnumeratingWithState:objects:count:]( v204,  "countByEnumeratingWithState:objects:count:",  &v302,  v324,  16LL);
              if (v205)
              {
                v206 = v205;
                v207 = *(void *)v303;
                do
                {
                  for (m = 0LL; m != v206; m = (char *)m + 1)
                  {
                    if (*(void *)v303 != v207) {
                      objc_enumerationMutation(v204);
                    }
                    v209 = (void *)objc_claimAutoreleasedReturnValue( -[StartCallIntentHandler getAlternativesForContact:forRequestedHandleType:forCallProvider:]( v292,  "getAlternativesForContact:forRequestedHandleType:forCallProvider:",  *(void *)(*((void *)&v302 + 1) + 8 * (void)m),  v293,  [v290 preferredCallProvider]));
                    -[NSMutableArray addObjectsFromArray:](v188, "addObjectsFromArray:", v209);
                  }

                  v206 = -[os_log_s countByEnumeratingWithState:objects:count:]( v204,  "countByEnumeratingWithState:objects:count:",  &v302,  v324,  16LL);
                }

                while (v206);
              }

              v210 = -[NSMutableArray copy](v188, "copy");
              v211 = (void *)objc_claimAutoreleasedReturnValue( +[INPersonDeduplicator dedupeINPersons:]( &OBJC_CLASS___INPersonDeduplicator,  "dedupeINPersons:",  v210));

              v212 = IntentHandlerDefaultLog();
              v213 = (os_log_s *)objc_claimAutoreleasedReturnValue(v212);
              v172 = v290;
              if (os_log_type_enabled(v213, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl( (void *)&_mh_execute_header,  v213,  OS_LOG_TYPE_DEFAULT,  "Offering all handles as alternatives",  buf,  2u);
              }

              v214 = (void *)objc_claimAutoreleasedReturnValue( +[INStartCallContactResolutionResult resolutionResultUnsupportedWithReason:alternativeItems:]( &OBJC_CLASS___INStartCallContactResolutionResult,  "resolutionResultUnsupportedWithReason:alternativeItems:",  3LL,  v211));
              -[NSMutableArray addObject:](v278, "addObject:", v214);

              v31 = v280;
              v58 = v282;
              v79 = v276;
LABEL_166:
              v215 = v272;
              id v4 = v172;
              goto LABEL_200;
            }

            v283 = v173;
            v174 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler featureFlags](v292, "featureFlags"));
            v175 = [v174 crrHandleRecommendation];

            v31 = v280;
            if (v175)
            {
              v176 = IntentHandlerDefaultLog();
              v177 = (os_log_s *)objc_claimAutoreleasedReturnValue(v176);
              id v4 = v172;
              if (os_log_type_enabled(v177, OS_LOG_TYPE_DEFAULT))
              {
                v178 = (os_log_s *)objc_claimAutoreleasedReturnValue([v281 siriMatches]);
                *(_DWORD *)buf = 138412290;
                v326 = v178;
                _os_log_impl( (void *)&_mh_execute_header,  v177,  OS_LOG_TYPE_DEFAULT,  "Using CRR based recommendation results: %@",  buf,  0xCu);
              }

              v179 = (void *)objc_claimAutoreleasedReturnValue([v281 siriMatches]);
              v180 = [v179 count];

              if (v180)
              {
                v181 = (void *)objc_claimAutoreleasedReturnValue([v281 siriMatches]);
                v182 = [v181 count];

                if (v182 == (id)1)
                {
                  v183 = (void *)objc_claimAutoreleasedReturnValue([v281 siriMatches]);
                  v184 = (os_log_s *)objc_claimAutoreleasedReturnValue([v183 firstObject]);

                  v185 = IntentHandlerDefaultLog();
                  v186 = (os_log_s *)objc_claimAutoreleasedReturnValue(v185);
                  if (os_log_type_enabled(v186, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    v326 = v184;
                    _os_log_impl( (void *)&_mh_execute_header,  v186,  OS_LOG_TYPE_DEFAULT,  "Resolved to one CRR recommended handle: %@",  buf,  0xCu);
                  }

                  v187 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s firstObject](v89, "firstObject"));
                  v188 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( -[StartCallIntentHandler resolutionResultForPersonWithResolvedContactName:resolvedPerson:resolvedContact:contactIdentifiersRequiringConfirmation:]( v292,  "resolutionResultForPersonWithResolvedContactName:resolvedPerson:resolvedC ontact:contactIdentifiersRequiringConfirmation:",  v281,  v184,  v187,  v283));

                  goto LABEL_178;
                }

                v222 = IntentHandlerDefaultLog();
                v223 = (os_log_s *)objc_claimAutoreleasedReturnValue(v222);
                v79 = v276;
                if (os_log_type_enabled(v223, OS_LOG_TYPE_DEFAULT))
                {
                  v224 = (os_log_s *)objc_claimAutoreleasedReturnValue([v281 siriMatches]);
                  *(_DWORD *)buf = 138412290;
                  v326 = v224;
                  _os_log_impl( (void *)&_mh_execute_header,  v223,  OS_LOG_TYPE_DEFAULT,  "Resolved to more than one CRR recommended handle: %@",  buf,  0xCu);
                }

                v184 = (os_log_s *)objc_claimAutoreleasedReturnValue([v281 siriMatches]);
                v188 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( +[INStartCallContactResolutionResult disambiguationWithPeopleToDisambiguate:]( &OBJC_CLASS___INStartCallContactResolutionResult,  "disambiguationWithPeopleToDisambiguate:",  v184));
              }

              else
              {
                v188 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( +[INStartCallContactResolutionResult unsupportedForReason:]( &OBJC_CLASS___INStartCallContactResolutionResult,  "unsupportedForReason:",  1LL));
                v221 = IntentHandlerDefaultLog();
                v184 = (os_log_s *)objc_claimAutoreleasedReturnValue(v221);
                if (os_log_type_enabled(v184, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl( (void *)&_mh_execute_header,  v184,  OS_LOG_TYPE_DEFAULT,  "No resolution result resolved, adding an unsupported result",  buf,  2u);
                }

LABEL_178:
                v79 = v276;
              }

              v215 = v272;

              -[NSMutableArray addObject:](v278, "addObject:", v188);
              v58 = v282;
LABEL_200:

LABEL_201:
              goto LABEL_202;
            }

            v215 = v272;
            id v4 = v172;
            if ([v272 count] == (id)1)
            {
              v188 = (NSMutableArray *)objc_claimAutoreleasedReturnValue([v272 firstObject]);
              v216 = IntentHandlerDefaultLog();
              v217 = (os_log_s *)objc_claimAutoreleasedReturnValue(v216);
              if (os_log_type_enabled(v217, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v326 = (os_log_s *)v188;
                _os_log_impl( (void *)&_mh_execute_header,  v217,  OS_LOG_TYPE_DEFAULT,  "Resolved to one handle: %@",  buf,  0xCu);
              }

              v218 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s firstObject](v89, "firstObject"));
              v219 = (void *)objc_claimAutoreleasedReturnValue( -[StartCallIntentHandler resolutionResultForPersonWithResolvedContactName:resolvedPerson:resolvedContact:contactIdentifiersRequiringConfirmation:]( v292,  "resolutionResultForPersonWithResolvedContactName:resolvedPerson:resolvedContact:contact IdentifiersRequiringConfirmation:",  v281,  v188,  v218,  v283));

              -[NSMutableArray addObject:](v278, "addObject:", v219);
              v58 = v282;
              goto LABEL_171;
            }

            if ([v172 preferredCallProvider] == (id)2 || objc_msgSend(v172, "callCapability") == (id)2)
            {
              if (-[os_log_s count](v89, "count") == (id)1)
              {
                v220 = objc_claimAutoreleasedReturnValue(-[os_log_s firstObject](v89, "firstObject"));
LABEL_187:
                v188 = (NSMutableArray *)v220;
                if (v220)
                {
                  if (-[StartCallIntentHandler requireScoreBasedResolutionForGFT:numberOfContactsCount:]( v292,  "requireScoreBasedResolutionForGFT:numberOfContactsCount:",  [v272 count],  objc_msgSend(v286, "count"))
                    || (v227 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler featureFlags](v292, "featureFlags")),
                        v228 = [v227 faceTimeNoFanOutEnabled],
                        v227,
                        v228))
                  {
                    v229 = IntentHandlerDefaultLog();
                    v230 = (os_log_s *)objc_claimAutoreleasedReturnValue(v229);
                    if (os_log_type_enabled(v230, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      v326 = (os_log_s *)v272;
                      _os_log_impl( (void *)&_mh_execute_header,  v230,  OS_LOG_TYPE_DEFAULT,  "Facetime call contact resolved to multiple handles. Using score based resolution model to resolve handles: %@",  buf,  0xCu);
                    }

                    v231 = (void *)objc_claimAutoreleasedReturnValue( -[StartCallIntentHandler resolvePreferredHandleFromHandles:contactIdentifiersRequiringConfirmation:telephonyOnly:]( v292,  "resolvePreferredHandleFromHandles:contactIdentifiersRequiringConfirmation:telephonyOnly:",  v272,  v283,  0LL));
                    -[NSMutableArray addObject:](v278, "addObject:", v231);

                    v215 = v272;
                    v58 = v282;
                    v79 = v276;
                    goto LABEL_200;
                  }

                  v237 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[StartCallIntentHandlerUtilities inPersonFromContact:handleValue:handleType:handleLabel:]( &OBJC_CLASS___StartCallIntentHandlerUtilities,  "inPersonFromContact:handleValue:handleType:handleLabel:",  v188,  0LL,  v293,  v291));
                  v238 = IntentHandlerDefaultLog();
                  v239 = (os_log_s *)objc_claimAutoreleasedReturnValue(v238);
                  if (os_log_type_enabled(v239, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    v326 = v237;
                    _os_log_impl( (void *)&_mh_execute_header,  v239,  OS_LOG_TYPE_DEFAULT,  "Facetime call resolved to multiple handles for a distinct person, preserving ambiguity. Will ring all handles. Person: %@",  buf,  0xCu);
                  }

                  v240 = (void *)objc_claimAutoreleasedReturnValue( -[StartCallIntentHandler resolutionResultForPersonWithResolvedContactName:resolvedPerson:resolvedContact:contactIdentifiersRequiringConfirmation:]( v292,  "resolutionResultForPersonWithResolvedContactName:resolvedPerson:resolvedContact:con tactIdentifiersRequiringConfirmation:",  v281,  v237,  v188,  v283));
                  -[NSMutableArray addObject:](v278, "addObject:", v240);

                  id v4 = v290;
                  v58 = v282;
                  v79 = v276;
LABEL_171:
                  v215 = v272;
                  goto LABEL_200;
                }
              }

              else if (+[StartCallIntentHandlerUtilities contactsShareHandleValue:]( &OBJC_CLASS___StartCallIntentHandlerUtilities,  "contactsShareHandleValue:",  v89))
              {
                v225 = IntentHandlerDefaultLog();
                v226 = (os_log_s *)objc_claimAutoreleasedReturnValue(v225);
                if (os_log_type_enabled(v226, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v326 = v89;
                  _os_log_impl( (void *)&_mh_execute_header,  v226,  OS_LOG_TYPE_DEFAULT,  "Resolved contacts all share a handle: treating them as the same person. Contacts: %@",  buf,  0xCu);
                }

                v220 = objc_claimAutoreleasedReturnValue( +[StartCallIntentHandlerUtilities contactWithMostHandles:]( &OBJC_CLASS___StartCallIntentHandlerUtilities,  "contactWithMostHandles:",  v89));
                goto LABEL_187;
              }

              v232 = IntentHandlerDefaultLog();
              v233 = (os_log_s *)objc_claimAutoreleasedReturnValue(v232);
              if (os_log_type_enabled(v233, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl( (void *)&_mh_execute_header,  v233,  OS_LOG_TYPE_DEFAULT,  "Facetime call resolved to multiple contacts with the same name, none of which share a handle. Disambig uating between handles.",  buf,  2u);
              }

              v234 = objc_claimAutoreleasedReturnValue( +[INStartCallContactResolutionResult disambiguationWithPeopleToDisambiguate:]( &OBJC_CLASS___INStartCallContactResolutionResult,  "disambiguationWithPeopleToDisambiguate:",  v272));
            }

            else
            {
              v235 = IntentHandlerDefaultLog();
              v236 = (os_log_s *)objc_claimAutoreleasedReturnValue(v235);
              if (os_log_type_enabled(v236, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v326 = (os_log_s *)v272;
                _os_log_impl( (void *)&_mh_execute_header,  v236,  OS_LOG_TYPE_DEFAULT,  "Resolved to multiple handles, using score based resolution model to resolve handles: %@",  buf,  0xCu);
              }

              v234 = objc_claimAutoreleasedReturnValue( -[StartCallIntentHandler resolvePreferredHandleFromHandles:contactIdentifiersRequiringConfirmation:telephonyOnly:]( v292,  "resolvePreferredHandleFromHandles:contactIdentifiersRequiringConfirmation:telephonyOnly:",  v272,  v283,  1LL));
            }

            v188 = (NSMutableArray *)v234;
            -[NSMutableArray addObject:](v278, "addObject:", v234);
            goto LABEL_200;
          }

          v32 = v16;
          v33 = v9;
          v284 = v32;
          v34 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler globalEmergencyNumbers](self, "globalEmergencyNumbers"));
          v35 = (void *)objc_claimAutoreleasedReturnValue([v14 personHandle]);
          v36 = (void *)objc_claimAutoreleasedReturnValue([v35 value]);
          v37 = [v34 containsObject:v36];

          v38 = IntentHandlerDefaultLog();
          v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
          v40 = os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT);
          if (!v37)
          {
            if (v40)
            {
              *(_WORD *)buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "Number is not on the global emergency numbers list",  buf,  2u);
            }

            v31 = (ContactResolver *)objc_claimAutoreleasedReturnValue( -[StartCallIntentHandler resolutionResultForPersonWithResolvedHandleValue:]( self,  "resolutionResultForPersonWithResolvedHandleValue:",  v14));
            id v9 = v33;
            -[NSMutableArray addObject:](v33, "addObject:", v31);
            int v13 = v288;
LABEL_32:
            v16 = v284;
LABEL_33:
            v12 = v287;
            goto LABEL_34;
          }

          if (v40)
          {
            v41 = (os_log_s *)objc_claimAutoreleasedReturnValue([v14 personHandle]);
            v42 = (void *)objc_claimAutoreleasedReturnValue([v14 personHandle]);
            v43 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( -[StartCallIntentHandler emergencyTypeToString:]( self,  "emergencyTypeToString:",  [v42 emergencyType]));
            *(_DWORD *)buf = 138412546;
            v326 = v41;
            v327 = 2112;
            v328 = v43;
            _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "Handle %@ is in the global emergency numbers list. EmergencyType is %@",  buf,  0x16u);
          }

          v44 = (void *)objc_claimAutoreleasedReturnValue([v14 personHandle]);
          v45 = [v44 emergencyType];

          v46 = IntentHandlerDefaultLog();
          v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
          v48 = os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT);
          int v13 = v288;
          if (v45)
          {
            id v9 = v33;
            if (v48)
            {
              *(_DWORD *)buf = 138412290;
              v326 = (os_log_s *)v14;
              _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEFAULT,  "Number is on the global emergency numbers list, but INPersonHandle already has the emergencyType set: %@",  buf,  0xCu);
            }

            v31 = (ContactResolver *)objc_claimAutoreleasedReturnValue( -[StartCallIntentHandler resolutionResultForPersonWithResolvedHandleValue:]( self,  "resolutionResultForPersonWithResolvedHandleValue:",  v14));
            -[NSMutableArray addObject:](v33, "addObject:", v31);
            goto LABEL_32;
          }

          if (v48)
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEFAULT,  "It's unclear if the user literally wanted this number, or if they meant to call emergency services. Disamb iguate between local and nonlocal emergency services.",  buf,  2u);
          }

          v93 = objc_alloc(&OBJC_CLASS___INPersonHandle);
          v94 = (void *)objc_claimAutoreleasedReturnValue([v14 personHandle]);
          v95 = (void *)objc_claimAutoreleasedReturnValue([v94 value]);
          v96 = (void *)objc_claimAutoreleasedReturnValue([v14 personHandle]);
          v97 = [v96 type];
          v98 = (void *)objc_claimAutoreleasedReturnValue([v14 personHandle]);
          v99 = (void *)objc_claimAutoreleasedReturnValue([v98 label]);
          v31 = -[INPersonHandle initWithValue:type:label:emergencyType:]( v93,  "initWithValue:type:label:emergencyType:",  v95,  v97,  v99,  2LL);

          v100 = -[INPerson initWithPersonHandle:nameComponents:displayName:image:contactIdentifier:customIdentifier:]( objc_alloc(&OBJC_CLASS___INPerson),  "initWithPersonHandle:nameComponents:displayName:image:contactIdentifier:customIdentifier:",  v31,  0LL,  0LL,  0LL,  0LL,  0LL);
          v101 = -[INPersonHandle initWithValue:type:label:emergencyType:]( objc_alloc(&OBJC_CLASS___INPersonHandle),  "initWithValue:type:label:emergencyType:",  &stru_100034C18,  2LL,  0LL,  1LL);
          v102 = -[INPerson initWithPersonHandle:nameComponents:displayName:image:contactIdentifier:customIdentifier:]( objc_alloc(&OBJC_CLASS___INPerson),  "initWithPersonHandle:nameComponents:displayName:image:contactIdentifier:customIdentifier:",  v101,  0LL,  0LL,  0LL,  0LL,  0LL);
          v339[0] = v100;
          v339[1] = v102;
          v103 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v339,  2LL));
          v104 = (void *)objc_claimAutoreleasedReturnValue( +[INStartCallContactResolutionResult resolutionResultUnsupportedWithReason:alternativeItems:]( &OBJC_CLASS___INStartCallContactResolutionResult,  "resolutionResultUnsupportedWithReason:alternativeItems:",  v273,  v103));
          -[NSMutableArray addObject:](v278, "addObject:", v104);

          v105 = IntentHandlerDefaultLog();
          v106 = (os_log_s *)objc_claimAutoreleasedReturnValue(v105);
          if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v326 = v103;
            _os_log_impl( (void *)&_mh_execute_header,  v106,  OS_LOG_TYPE_DEFAULT,  "Returning _INStartCallContactUnsupportedReasonForeignEmergencyDisambiguation with alternative items: %@",  buf,  0xCu);
          }

          os_signpost_id_t v10 = v286;
          v12 = v287;
          self = v292;
          int v13 = v288;
          v16 = v284;
          id v4 = v290;
          id v9 = v278;
        }

        else
        {
          v49 = IntentHandlerDefaultLog();
          v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_DEFAULT,  "Attempting to resolve more than one call participant. Returning multiple contacts unsupported for each recipient.",  buf,  2u);
          }

          v31 = (ContactResolver *)objc_claimAutoreleasedReturnValue( +[INStartCallContactResolutionResult unsupportedForReason:]( &OBJC_CLASS___INStartCallContactResolutionResult,  "unsupportedForReason:",  2LL));
          -[NSMutableArray addObject:](v9, "addObject:", v31);
        }

id sub_1000149A8(uint64_t a1, void *a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a2 person]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dataSource]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 coreTelephonyDataSource]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allRelevantISOCountryCodes]);
  os_signpost_id_t v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tu_personWithFormattedHandleForISOCountryCodes:", v6));

  return v7;
}

LABEL_59:
                    }

                    v72 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:]( v67,  "countByEnumeratingWithState:objects:count:",  &v85,  v113,  16LL);
                  }

                  while (v72);
                }

                v29 = v66 + 1;
              }

              while ((id)(v66 + 1) != v65);
              v65 = [v62 countByEnumeratingWithState:&v89 objects:v114 count:16];
            }

            while (v65);
          }

          v27 = v61 + 1;
        }

        while ((id)(v61 + 1) != v60);
        v60 = [v56 countByEnumeratingWithState:&v93 objects:v115 count:16];
      }

      while (v60);
    }

    v47 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableOrderedSet array](v26, "array"));
    [v55 addScore:6 forEntities:v47 reason:@"Call Recency"];
  }

  v48 = IntentHandlerDefaultLog();
  v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_DEFAULT,  "Completed call recency for contacts check.",  buf,  2u);
  }

  v50 = IntentHandlerDefaultLog();
  v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
  v52 = v51;
  if (v54 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v51))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v52,  OS_SIGNPOST_INTERVAL_END,  spid,  "contactCallRecency",  (const char *)&unk_1000275CF,  buf,  2u);
  }
}

LABEL_27:
    v31 = v8;
    goto LABEL_28;
  }

  int v13 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler dataSource](self, "dataSource"));
  v14 = [v13 supportsTelephonyCalls];

  if ((v14 & 1) == 0)
  {
    v29 = IntentHandlerDefaultLog();
    os_signpost_id_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v11 = "Not applying an implicit handle type = phone number filter on a device that doesn't support telephone calls";
      goto LABEL_26;
    }

    goto LABEL_27;
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](v8, "allValues"));
  v16 = [v15 countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (!v16)
  {

    goto LABEL_24;
  }

  v17 = v16;
  v18 = 0LL;
  v19 = *(void *)v36;
  do
  {
    for (i = 0LL; i != v17; i = (char *)i + 1)
    {
      if (*(void *)v36 != v19) {
        objc_enumerationMutation(v15);
      }
      v18 += (unint64_t)[*(id *)(*((void *)&v35 + 1) + 8 * (void)i) count];
    }

    v17 = [v15 countByEnumeratingWithState:&v35 objects:v41 count:16];
  }

  while (v17);

  if (v18 <= 1)
  {
LABEL_24:
    v30 = IntentHandlerDefaultLog();
    os_signpost_id_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v11 = "Not applying an implicit handle type filter because there is already only one matching handle";
      goto LABEL_26;
    }

    goto LABEL_27;
  }

  v21 = IntentHandlerDefaultLog();
  v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Multiple handles match call request. Attempting to filter to just phone numbers to resolve ambiguity.",  buf,  2u);
  }

  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_100018C98;
  v33[3] = &unk_100034830;
  v23 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v34 = v23;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v8, "enumerateKeysAndObjectsUsingBlock:", v33);
  v24 = -[NSMutableDictionary count](v23, "count");
  v25 = IntentHandlerDefaultLog();
  v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
  v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
  if (v24)
  {
    v28 = v23;
    if (v27)
    {
      *(_DWORD *)buf = 138412290;
      v40 = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Filtered the results to only phone numbers. Remaining matches: %@",  buf,  0xCu);
      v28 = v23;
    }
  }

  else
  {
    v28 = v8;
    if (v27)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Filtering results to only phone numbers would have produced no results, not filtering.",  buf,  2u);
      v28 = v8;
    }
  }

  v31 = v28;
LABEL_28:

  return v31;
}

void sub_100018C98(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](&OBJC_CLASS___NSPredicate, "predicateWithBlock:", &stru_100034808));
  os_signpost_id_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 filteredArrayUsingPredicate:v6]);

  if ([v7 count]) {
    [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v8];
  }
}

BOOL sub_100018D38(id a1, INPerson *a2, NSDictionary *a3)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[INPerson personHandle](a2, "personHandle", a3));
  BOOL v4 = [v3 type] == (id)2;

  return v4;
}

LABEL_10:
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue([v4 contactIdentifier]);
  int v13 = [v12 length];

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler contactIdentifiersConfirmed](self, "contactIdentifiersConfirmed"));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v4 contactIdentifier]);
    v16 = [v14 containsObject:v15];

    if (v16)
    {
      v17 = IntentHandlerDefaultLog();
      id v6 = (void *)objc_claimAutoreleasedReturnValue(v17);
      if (!os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT))
      {
LABEL_20:

        v21 = 1;
        goto LABEL_21;
      }

      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 contactIdentifier]);
      *(_DWORD *)buf = 138412290;
      v29 = v18;
      v19 = "Have previously confirmed recipient with contactIdentifier: %@";
      v20 = (os_log_s *)v6;
LABEL_18:
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, v19, buf, 0xCu);
LABEL_19:

      goto LABEL_20;
    }
  }

  v21 = 0;
LABEL_21:

  return v21;
}

LABEL_15:
    v33 = 0;
LABEL_16:

    goto LABEL_17;
  }

  v95 = v10;
  v28 = (void *)objc_claimAutoreleasedReturnValue([v8 personHandle]);
  v29 = (void *)objc_claimAutoreleasedReturnValue([v28 value]);
  v30 = [v29 length];

  if (v30)
  {
    v31 = IntentHandlerDefaultLog();
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    os_signpost_id_t v10 = v95;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue([v8 personHandle]);
      v32 = (void *)objc_claimAutoreleasedReturnValue([v24 value]);
      *(_DWORD *)buf = 138412290;
      v97 = v32;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Not requiring unknown recipient confirmation because requested recipient was a manually dictated handle: %@",  buf,  0xCu);

      goto LABEL_14;
    }

    goto LABEL_15;
  }

  if ([v17 length])
  {
    v41 = (void *)objc_claimAutoreleasedReturnValue([v9 displayName]);
    v42 = [v17 isEqualToIgnoringCase:v41];

    if (v42)
    {
      v43 = IntentHandlerDefaultLog();
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
      os_signpost_id_t v10 = v95;
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_15;
      }
      v24 = (void *)objc_claimAutoreleasedReturnValue([v9 displayName]);
      *(_DWORD *)buf = 138412546;
      v97 = v17;
      v98 = 2112;
      v99 = (os_log_s *)v24;
      v25 = "Not requiring unknown recipient confirmation because userInput %@ matches resolved recipients full displayName: %@";
      v26 = v20;
      v27 = 22;
      goto LABEL_10;
    }
  }

  if ([v18 length])
  {
    v44 = (void *)objc_claimAutoreleasedReturnValue([v9 displayName]);
    v45 = [v18 isEqualToIgnoringCase:v44];

    if (v45)
    {
      v46 = IntentHandlerDefaultLog();
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v47 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 displayName]);
        *(_DWORD *)buf = 138412546;
        v97 = v18;
        v98 = 2112;
        v99 = v47;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Not requiring unknown recipient confirmation because requested displayName %@ matches resolved recipients displayName: %@",  buf,  0x16u);
      }

      v33 = 0;
      os_signpost_id_t v10 = v95;
      goto LABEL_16;
    }
  }

  v48 = (void *)objc_claimAutoreleasedReturnValue([v9 nameComponents]);

  if (v48)
  {
    v49 = (void *)objc_claimAutoreleasedReturnValue([v9 nameComponents]);
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSPersonNameComponentsFormatter localizedStringFromPersonNameComponents:style:options:]( &OBJC_CLASS___NSPersonNameComponentsFormatter,  "localizedStringFromPersonNameComponents:style:options:",  v49,  3LL,  0LL));

    if ([v17 length] && objc_msgSend(v17, "isEqualToIgnoringCase:", v20))
    {
      v50 = IntentHandlerDefaultLog();
      v24 = (void *)objc_claimAutoreleasedReturnValue(v50);
      if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v97 = v17;
        v98 = 2112;
        v99 = v20;
        v51 = "Not requiring unknown recipient confirmation because userInput %@ matches resolved recipients long for"
              "mat name: %@";
LABEL_43:
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v24, OS_LOG_TYPE_DEFAULT, v51, buf, 0x16u);
        goto LABEL_44;
      }

      goto LABEL_44;
    }

    if ([v18 length] && objc_msgSend(v18, "isEqualToIgnoringCase:", v20))
    {
      v52 = IntentHandlerDefaultLog();
      v24 = (void *)objc_claimAutoreleasedReturnValue(v52);
      if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v97 = v18;
        v98 = 2112;
        v99 = v20;
        v51 = "Not requiring unknown recipient confirmation because requested recipient displayName %@ matches resolv"
              "ed recipients long format name: %@";
        goto LABEL_43;
      }

LABEL_44:
      os_signpost_id_t v10 = v95;
      goto LABEL_14;
    }
  }

  v53 = (void *)objc_claimAutoreleasedReturnValue([v9 nameComponents]);

  if (v53)
  {
    v54 = (void *)objc_claimAutoreleasedReturnValue([v9 nameComponents]);
    v55 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSPersonNameComponentsFormatter localizedStringFromPersonNameComponents:style:options:]( &OBJC_CLASS___NSPersonNameComponentsFormatter,  "localizedStringFromPersonNameComponents:style:options:",  v54,  2LL,  0LL));

    if ([v17 length] && objc_msgSend(v17, "isEqualToIgnoringCase:", v55))
    {
      v56 = IntentHandlerDefaultLog();
      v57 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v97 = v17;
        v98 = 2112;
        v99 = v55;
        _os_log_impl( (void *)&_mh_execute_header,  v57,  OS_LOG_TYPE_DEFAULT,  "Not requiring unknown recipient confirmation because userInput %@ matches resolved recipients medium format name: %@",  buf,  0x16u);
      }

      os_signpost_id_t v10 = v95;
    }

    else
    {
      if (![v18 length])
      {
        v33 = 1;
        os_signpost_id_t v10 = v95;
        goto LABEL_60;
      }

      os_signpost_id_t v10 = v95;
      if (![v18 isEqualToIgnoringCase:v55])
      {
        v33 = 1;
        goto LABEL_60;
      }

      v58 = IntentHandlerDefaultLog();
      v57 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v97 = v18;
        v98 = 2112;
        v99 = v55;
        _os_log_impl( (void *)&_mh_execute_header,  v57,  OS_LOG_TYPE_DEFAULT,  "Not requiring unknown recipient confirmation because requested recipient displayName %@ matches resolved r ecipients medium format name: %@",  buf,  0x16u);
      }
    }

    v33 = 0;
LABEL_60:

    goto LABEL_61;
  }

  v33 = 1;
  os_signpost_id_t v10 = v95;
LABEL_61:
  if (v10 && v33)
  {
    v59 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[CNContactFormatter stringFromContact:style:]( &OBJC_CLASS___CNContactFormatter,  "stringFromContact:style:",  v10,  0LL));
    if ([v17 length] && objc_msgSend(v17, "isEqualToIgnoringCase:", v59))
    {
      v60 = IntentHandlerDefaultLog();
      v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v97 = v17;
        v98 = 2112;
        v99 = v59;
        v62 = "Not requiring unknown recipient confirmation because userInput %@ matches resolved contact formatted name: %@";
LABEL_71:
        _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, v62, buf, 0x16u);
      }
    }

    else if ([v18 length] && objc_msgSend(v18, "isEqualToIgnoringCase:", v59))
    {
      v63 = IntentHandlerDefaultLog();
      v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v63);
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v97 = v18;
        v98 = 2112;
        v99 = v59;
        v62 = "Not requiring unknown recipient confirmation because requested recipient displayName %@ matches resolv"
              "ed contact formatted name: %@";
        goto LABEL_71;
      }
    }

    else
    {
      v93 = v59;
      v64 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler dataSource](self, "dataSource"));
      v65 = (void *)objc_claimAutoreleasedReturnValue([v64 favoritesDataSource]);
      v66 = v10;
      v67 = v65;
      v68 = [v65 hasFavoritesEntryForContact:v66];

      if (!v68)
      {
        v33 = 1;
        v59 = v93;
        os_signpost_id_t v10 = v95;
LABEL_79:

        goto LABEL_80;
      }

      v69 = IntentHandlerDefaultLog();
      v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v69);
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        os_signpost_id_t v10 = v95;
        v97 = v95;
        _os_log_impl( (void *)&_mh_execute_header,  v61,  OS_LOG_TYPE_DEFAULT,  "Not requiring unknown recipient confirmation because resolved contact is a favorite. Contact: %@",  buf,  0xCu);
      }

      else
      {
        os_signpost_id_t v10 = v95;
      }

      v59 = v93;
    }

    v33 = 0;
    goto LABEL_79;
  }

LABEL_80:
  if (v10 && v33)
  {
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 allTUHandles]);
    if (!-[os_log_s count](v20, "count"))
    {
      v33 = 1;
      goto LABEL_16;
    }

    v91 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler dataSource](self, "dataSource"));
    v70 = (void *)objc_claimAutoreleasedReturnValue([v91 coreTelephonyDataSource]);
    v71 = (void *)objc_claimAutoreleasedReturnValue([v70 allRelevantISOCountryCodes]);
    v94 = (void *)objc_claimAutoreleasedReturnValue( +[CallHistoryDataSourcePredicate predicateForCallsWithAnyOfTheseRemoteParticipantHandles:isoCountryCodes:]( &OBJC_CLASS___CallHistoryDataSourcePredicate,  "predicateForCallsWithAnyOfTheseRemoteParticipantHandles:isoCountryCodes:",  v20,  v71));

    v72 = IntentHandlerDefaultLog();
    v73 = (os_log_s *)objc_claimAutoreleasedReturnValue(v72);
    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v97 = v94;
      _os_log_impl( (void *)&_mh_execute_header,  v73,  OS_LOG_TYPE_DEFAULT,  "Searching for recent calls using predicate: %@",  buf,  0xCu);
    }

    v74 = IntentHandlerDefaultLog();
    v75 = (os_log_s *)objc_claimAutoreleasedReturnValue(v74);
    v76 = os_signpost_id_generate(v75);

    v77 = IntentHandlerDefaultLog();
    v78 = (os_log_s *)objc_claimAutoreleasedReturnValue(v77);
    v79 = v78;
    v92 = v76 - 1;
    if (v76 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v78))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v79,  OS_SIGNPOST_INTERVAL_BEGIN,  v76,  "callHistoryDBForUnknownRecipient",  (const char *)&unk_1000275CF,  buf,  2u);
    }

    spid = v76;

    v80 = (void *)objc_claimAutoreleasedReturnValue(-[StartCallIntentHandler dataSource](self, "dataSource"));
    v81 = (void *)objc_claimAutoreleasedReturnValue([v80 callHistoryDataSource]);
    v82 = (uint64_t)[v81 callCountWithPredicate:v94];

    v83 = IntentHandlerDefaultLog();
    v84 = (os_log_s *)objc_claimAutoreleasedReturnValue(v83);
    v85 = v84;
    if (v92 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v84))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v85,  OS_SIGNPOST_INTERVAL_END,  spid,  "callHistoryDBForUnknownRecipient",  (const char *)&unk_1000275CF,  buf,  2u);
    }

    v86 = IntentHandlerDefaultLog();
    v87 = (os_log_s *)objc_claimAutoreleasedReturnValue(v86);
    v88 = os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT);
    v33 = v82 < 1;
    if (v82 < 1)
    {
      os_signpost_id_t v10 = v95;
      if (v88)
      {
        *(_DWORD *)buf = 138412290;
        v97 = v20;
        v89 = "Did not find a recent calls with any of the following handles: %@";
        goto LABEL_97;
      }
    }

    else
    {
      os_signpost_id_t v10 = v95;
      if (v88)
      {
        *(_DWORD *)buf = 138412290;
        v97 = v20;
        v89 = "Not requiring unknown recipient confirmation because there is a recent call with one of the following handles: %@";
LABEL_97:
        _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_DEFAULT, v89, buf, 0xCu);
      }
    }

    goto LABEL_16;
  }

LABEL_17:
  v34 = IntentHandlerDefaultLog();
  v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    v36 = @"false";
    if (v33) {
      v36 = @"true";
    }
    *(_DWORD *)buf = 138543362;
    v97 = (void *)v36;
    _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "Returning %{public}@ for shouldRequireUnknownRecipientConfirmationForRequestedRecipient.",  buf,  0xCu);
  }

  v37 = IntentHandlerDefaultLog();
  v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
  v39 = v38;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v39,  OS_SIGNPOST_INTERVAL_END,  v13,  "shouldRequireUnknownRecipientConfirmation",  (const char *)&unk_1000275CF,  buf,  2u);
  }

  return v33;
}

void sub_10001B37C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_10001B394(uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) callCenter]);
  v2 = (void *)objc_claimAutoreleasedReturnValue([v3 callFilterController]);
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 callFilterStatusForDialRequest:*(void *)(a1 + 40)];
}

void sub_10001B508( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_10001B520(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10001B530(uint64_t a1)
{
}

void sub_10001B538(uint64_t a1)
{
  id v6 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) callCenter]);
  v2 = (void *)objc_claimAutoreleasedReturnValue([v6 callFilterController]);
  uint64_t v3 = objc_claimAutoreleasedReturnValue([v2 restrictedContacts:*(void *)(a1 + 40) callProvider:*(void *)(a1 + 48)]);
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8LL);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_10001B71C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10001B73C(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 64) incomingCall]);
  if (v2)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  }

  else
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 64) incomingVideoCall]);
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v3 != 0LL;

    v2 = 0LL;
  }
}

void sub_10001B928( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

id sub_10001B948(uint64_t a1)
{
  id result = [*(id *)(*(void *)(a1 + 32) + 64) hasCurrentCalls];
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = (_BYTE)result;
  return result;
}

void sub_10001BA0C(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 64) videoDeviceController]);
  id v3 = (id)objc_claimAutoreleasedReturnValue([v2 inputDevices]);

  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 count] != 0;
}

void sub_10001C144( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10001C170(uint64_t a1, void *a2)
{
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10001C2A4( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

LABEL_31:
  v35 = -[SiriMatchRecommendation initWithType:contactIdentifiers:]( objc_alloc(&OBJC_CLASS___SiriMatchRecommendation),  "initWithType:contactIdentifiers:",  v24,  v20);
  return v35;
}

void sub_10001D398(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) callCenter]);
  unsigned __int8 v3 = [v2 hasCurrentCalls];

  id v4 = IntentHandlerDefaultLog();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = v5;
  if ((v3 & 1) != 0)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Call exists, proceeding to handle HangUp intent.",  v9,  2u);
    }

    uint64_t v7 = 1LL;
  }

  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100020B34(v6);
    }
    uint64_t v7 = 6LL;
  }

  id v8 = -[INHangUpCallIntentResponse initWithCode:userActivity:]( objc_alloc(&OBJC_CLASS___INHangUpCallIntentResponse),  "initWithCode:userActivity:",  v7,  0LL);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_10001D5B8(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) callCenter]);
  uint64_t v3 = objc_claimAutoreleasedReturnValue([v2 incomingCall]);
  if (v3)
  {
    id v4 = (void *)v3;

LABEL_4:
    id v6 = IntentHandlerDefaultLog();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 138412290;
      v22 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "An incoming call exists: %@",  (uint8_t *)&v21,  0xCu);
    }

    unsigned int v8 = [v4 isEligibleForScreening];
    id v9 = IntentHandlerDefaultLog();
    os_signpost_id_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v11)
      {
        LOWORD(v21) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Sending call to automatic screening",  (uint8_t *)&v21,  2u);
      }

      id v12 = [[TUAnswerRequest alloc] initWithCall:v4];
      [v12 setSendToScreening:1];
      int v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) callCenter]);
      [v13 answerWithRequest:v12];
    }

    else
    {
      if (v11)
      {
        LOWORD(v21) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Declining it and returning success",  (uint8_t *)&v21,  2u);
      }

      id v12 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) callCenter]);
      [v12 disconnectCall:v4 withReason:2];
    }

    v14 = -[INHangUpCallIntentResponse initWithCode:userActivity:]( objc_alloc(&OBJC_CLASS___INHangUpCallIntentResponse),  "initWithCode:userActivity:",  3LL,  0LL);
    -[INHangUpCallIntentResponse setHungUpCallType:](v14, "setHungUpCallType:", 6LL);
    goto LABEL_14;
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) callCenter]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v5 incomingVideoCall]);

  if (v4) {
    goto LABEL_4;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) callCenter]);
  unsigned int v16 = [v15 hasCurrentCalls];

  id v17 = IntentHandlerDefaultLog();
  v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
  if (v16)
  {
    if (v19)
    {
      LOWORD(v21) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "At least one call exists. Hanging up and returning success",  (uint8_t *)&v21,  2u);
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) callCenter]);
    [v20 disconnectCurrentCallAndActivateHeld];

    v14 = -[INHangUpCallIntentResponse initWithCode:userActivity:]( objc_alloc(&OBJC_CLASS___INHangUpCallIntentResponse),  "initWithCode:userActivity:",  3LL,  0LL);
    -[INHangUpCallIntentResponse setHungUpCallType:](v14, "setHungUpCallType:", 7LL);
  }

  else
  {
    if (v19)
    {
      LOWORD(v21) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "No calls exist. Since call was hung up between confirm and handle, return success.",  (uint8_t *)&v21,  2u);
    }

    v14 = -[INHangUpCallIntentResponse initWithCode:userActivity:]( objc_alloc(&OBJC_CLASS___INHangUpCallIntentResponse),  "initWithCode:userActivity:",  3LL,  0LL);
  }

  id v4 = 0LL;
LABEL_14:
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_10001DDA4(uint64_t a1)
{
  id v1 = objc_alloc_init((Class)objc_opt_class(*(void *)(a1 + 32)));
  v2 = (void *)qword_10003E5A0;
  qword_10003E5A0 = (uint64_t)v1;
}

uint64_t sub_10001E008(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10001E3BC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_10001E3D4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10001E3E4(uint64_t a1)
{
}

void sub_10001E3EC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = IntentHandlerDefaultLog();
  unsigned int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v9)
    {
      int v14 = 138412290;
      id v15 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Failed to generate FaceTime link with error %@",  (uint8_t *)&v14,  0xCu);
    }

    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8LL);
    BOOL v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = 0LL;
  }

  else
  {
    if (v9)
    {
      int v14 = 138412290;
      id v15 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Successfully generated FaceTime link: %@",  (uint8_t *)&v14,  0xCu);
    }

    uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8LL);
    id v13 = v5;
    BOOL v11 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v13;
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id IntentHandlerDefaultLog()
{
  if (qword_10003E5B8 != -1) {
    dispatch_once(&qword_10003E5B8, &stru_1000349A8);
  }
  return (id)qword_10003E5B0;
}

void sub_10001E6F0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.calls.intenthandler", "Default");
  v2 = (void *)qword_10003E5B0;
  qword_10003E5B0 = (uint64_t)v1;
}

void sub_10001EDD4(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_10003E5C0;
  qword_10003E5C0 = (uint64_t)v1;
}

LABEL_32:
      }

      id v15 = -[os_log_s countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v61,  v68,  16LL);
      if (!v15)
      {
        BOOL v11 = v52;
        goto LABEL_36;
      }
    }
  }

LABEL_35:
  unsigned int v16 = 0LL;
LABEL_36:

  v35 = [v10 callStatus];
  if ((kCHCallStatusOutgoing & v35) != 0)
  {
    v36 = 1LL;
  }

  else
  {
    v37 = [v10 callStatus];
    if ((kCHCallStatusMissed & v37) != 0)
    {
      v36 = 2LL;
    }

    else
    {
      v38 = [v10 callStatus];
      v36 = 3LL;
      if ((kCHCallStatusIncoming & v38) == 0) {
        v36 = 0LL;
      }
    }
  }

  v59 = (id)v36;
  v50 = (void *)objc_claimAutoreleasedReturnValue([v11 providerForRecentCall:v10]);
  v47 = (void *)objc_claimAutoreleasedReturnValue([v50 bundleIdentifier]);
  v39 = -[CallRecordConverter preferredCallProviderFromRecentCall:](self, "preferredCallProviderFromRecentCall:", v10);
  v57 = -[CallRecordConverter callCapabilityFromRecentCall:](self, "callCapabilityFromRecentCall:", v10);
  v40 = objc_alloc(&OBJC_CLASS___INCallRecord);
  v51 = (void *)objc_claimAutoreleasedReturnValue([v10 uniqueId]);
  v49 = (void *)objc_claimAutoreleasedReturnValue([v10 date]);
  v41 = v10;
  [v10 duration];
  v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v10 read] ^ 1));
  v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v10 numberOfOccurrences]));
  v44 = (void *)objc_claimAutoreleasedReturnValue([v50 identifier]);
  v45 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v41 callerIdIsBlocked]));
  v60 = -[INCallRecord initWithIdentifier:dateCreated:callRecordType:callCapability:callDuration:unseen:preferredCallProvider:participants:numberOfCalls:providerId:providerBundleId:isCallerIdBlocked:]( v40,  "initWithIdentifier:dateCreated:callRecordType:callCapability:callDuration:unseen:preferredCallProvider:partici pants:numberOfCalls:providerId:providerBundleId:isCallerIdBlocked:",  v51,  v49,  v59,  v57,  v48,  v42,  v39,  v56,  v43,  v44,  v47,  v45);

  return v60;
}

void sub_10001F908(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

uint64_t INCallCapability.debugDescription.getter()
{
  uint64_t BackingType = INCallCapabilityGetBackingType();
  if ((_DWORD)BackingType == 2)
  {
    id v1 = @"VIDEO_CALL";
    uint64_t v3 = @"VIDEO_CALL";
  }

  else if ((_DWORD)BackingType == 1)
  {
    id v1 = @"AUDIO_CALL";
    v2 = @"AUDIO_CALL";
  }

  else
  {
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  BackingType));
  }

  id v4 = v1;
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v5;
}

void sub_10001FE54(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "siriMatches contactIDs don't correspond to any contacts in address book.",  v1,  2u);
}

void sub_10001FE94( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001FEFC(void *a1, os_log_s *a2)
{
  int v3 = 134217984;
  id v4 = [a1 count];
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "Found %ld contacts in search by name",  (uint8_t *)&v3,  0xCu);
}

void sub_10001FF84( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001FFEC( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100020050(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "Found ISO Country Code override: %@",  (uint8_t *)&v2,  0xCu);
  sub_100005E04();
}

void sub_1000200C0( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100020124( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100020188(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "App supports INStartCallIntent - prefer this over deprecated calling intents.",  v1,  2u);
}

void sub_1000201C8(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Error when fetching application record for appId: %@, error: %@",  (uint8_t *)&v3,  0x16u);
}

void sub_10002024C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000202B4( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002031C(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Intent Extension initialized", v1, 2u);
}

void sub_10002035C()
{
}

void sub_1000203BC()
{
}

void sub_10002041C()
{
}

void sub_10002047C()
{
}

void sub_1000204DC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100020510( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100020544(void *a1, os_log_s *a2)
{
}

void sub_1000205C0()
{
}

void sub_1000205EC()
{
}

void sub_100020618()
{
  sub_10000D0AC( (void *)&_mh_execute_header,  v0,  v1,  "Facetime Video calling is unavailable, returning call capability unsupported reason video call unsupported.",  v2,  v3,  v4,  v5,  v6);
  sub_10001C290();
}

void sub_100020644(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 providerId]);
  sub_10000B488();
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "The call provider %@ for redial or call back is not supported",  v4,  0xCu);

  sub_10001C2B4();
}

void sub_1000206CC(char a1, char a2, os_log_t log)
{
  v3[0] = 67109376;
  v3[1] = a1 & 1;
  __int16 v4 = 1024;
  int v5 = a2 & 1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "Telephony call was requested from a watch or for an emergency call and telephony is not supported. isWatch: %d, isEmergencyCall: %d",  (uint8_t *)v3,  0xEu);
  sub_100005E04();
}

void sub_100020754()
{
}

void sub_100020780()
{
}

void sub_1000207AC()
{
}

void sub_1000207D8()
{
}

void sub_100020804()
{
}

void sub_100020830()
{
}

void sub_10002085C()
{
}

void sub_100020888()
{
}

void sub_1000208B4()
{
}

void sub_1000208E0()
{
}

void sub_10002090C()
{
}

void sub_100020938()
{
}

void sub_100020964()
{
}

void sub_100020990()
{
}

void sub_1000209BC()
{
}

void sub_100020A1C()
{
}

void sub_100020A7C()
{
  sub_10001C2A4( (void *)&_mh_execute_header,  v0,  v1,  "#StartCallIntentHandler emergencyServicesOverrideEnabled==true and emergencyProvider.emergencyLabeledHandles is empt y. Checking override.",  v2,  v3,  v4,  v5,  v6);
  sub_10001C290();
}

void sub_100020AA8()
{
  sub_10000B478( (void *)&_mh_execute_header,  v0,  v1,  "#StartCallIntentHandler emergencyServicesOverrideEnabled==true and emergencyProvider shared %lu emergencyLabeledHand les. Using those.",  v2,  v3,  v4,  v5,  v6);
  sub_100005E04();
}

void sub_100020B08()
{
}

void sub_100020B34(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "No calls exist. Returning failure.", v1, 2u);
}

void sub_100020B74(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "FT aliases: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100020BE8(uint8_t *a1, void *a2, void *a3, os_log_s *a4)
{
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a2 uniqueId]);
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a4,  OS_LOG_TYPE_DEBUG,  "Converting CHRecentCall %@ to INCallRecord.",  a1,  0xCu);
}

void sub_100020C5C(uint8_t *a1, _BYTE *a2, os_log_s *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_10001F908( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "Converted this CHRecentCall previously, using cached converted INCallRecord.",  a1);
}

void sub_100020C90(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "No serviceProvider found on CHRecentCall - setting preferredCallProvider to unknown.",  v1,  2u);
}

void sub_100020CD0(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  *(_WORD *)uint64_t v3 = 0;
  sub_10001F908( (void *)&_mh_execute_header,  a1,  a3,  "serviceProvider is not FT or telephony - must be a 3P provider.",  v3);
}

void sub_100020D08(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "SiriInference recommended resolution result: %@",  (uint8_t *)&v2,  0xCu);
}

void sub_100020D7C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Unrecognized INScoredPersonRecommendation",  v1,  2u);
}

id objc_msgSend__applyImpliedFilterToPhoneNumberOnlyMatchesIfApplicableForPersonsByContact_requestedHandleType_preferredCallProvider_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_applyImpliedFilterToPhoneNumberOnlyMatchesIfApplicableForPersonsByContact:requestedHandleType:preferredCallProvider:");
}

id objc_msgSend__sendSiriMatchAnalyticsEventForIdentifiers_contactsMatchingId_contactsMatchingName_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sendSiriMatchAnalyticsEventForIdentifiers:contactsMatchingId:contactsMatchingName:");
}

id objc_msgSend_callRecordForRecentCall_withContactsDataSource_withCallProviderManager_withCurrentISOCountryCodes_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "callRecordForRecentCall:withContactsDataSource:withCallProviderManager:withCurrentISOCountryCodes:");
}

id objc_msgSend_callRecordsForRecentCalls_withContactsDataSource_withCallProviderManager_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "callRecordsForRecentCalls:withContactsDataSource:withCallProviderManager:");
}

id objc_msgSend_callRecordsForRecentCalls_withContactsDataSource_withCallProviderManager_withCurrentISOCountryCodes_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "callRecordsForRecentCalls:withContactsDataSource:withCallProviderManager:withCurrentISOCountryCodes:");
}

id objc_msgSend_callRecordsForRecentCallsWithRecordTypeOptions_startDate_endDate_recipient_capabilities_preferredProvider_maximumRecordCount_unseen_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "callRecordsForRecentCallsWithRecordTypeOptions:startDate:endDate:recipient:capabilities:preferredProvider:max imumRecordCount:unseen:");
}

id objc_msgSend_generateAdditionalMatchingHandles_resolvedContacts_requestedHandleType_requestedHandleLabel_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "generateAdditionalMatchingHandles:resolvedContacts:requestedHandleType:requestedHandleLabel:");
}

id objc_msgSend_inferCallCapabilityForPreferredCallProvider_recentCall_initialCallCapability_idiom_isDisplayDisabled_executionContext_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "inferCallCapabilityForPreferredCallProvider:recentCall:initialCallCapability:idiom:isDisplayDisabled:executionContext:");
}

id objc_msgSend_initWithIdentifier_dateCreated_callRecordType_callCapability_callDuration_unseen_preferredCallProvider_participants_numberOfCalls_providerId_providerBundleId_isCallerIdBlocked_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithIdentifier:dateCreated:callRecordType:callCapability:callDuration:unseen:preferredCallProvider:partic ipants:numberOfCalls:providerId:providerBundleId:isCallerIdBlocked:");
}

id objc_msgSend_initWithParticipants_destinationType_callTypes_callCapability_preferredCallProvider_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithParticipants:destinationType:callTypes:callCapability:preferredCallProvider:");
}

id objc_msgSend_initWithParticipants_destinationType_callTypes_callCapability_preferredCallProvider_includeThirdPartyCalls_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithParticipants:destinationType:callTypes:callCapability:preferredCallProvider:includeThirdPartyCalls:");
}

id objc_msgSend_initWithPersonHandle_nameComponents_displayName_image_contactIdentifier_customIdentifier_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPersonHandle:nameComponents:displayName:image:contactIdentifier:customIdentifier:");
}

id objc_msgSend_initWithPersonHandle_nameComponents_displayName_image_contactIdentifier_customIdentifier_isMe_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithPersonHandle:nameComponents:displayName:image:contactIdentifier:customIdentifier:isMe:");
}

id objc_msgSend_participantsPredicatesWithContactsDataSource_contactIdentifierCache_coreTelephonyDataSource_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "participantsPredicatesWithContactsDataSource:contactIdentifierCache:coreTelephonyDataSource:");
}

id objc_msgSend_predicateForCallToCallBackWithAnyOfTheseRemoteParticipantHandles_isoCountryCodes_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicateForCallToCallBackWithAnyOfTheseRemoteParticipantHandles:isoCountryCodes:");
}

id objc_msgSend_predicateForRecentCallWithContactsDataSource_contactIdentifierCache_coreTelephonyDataSource_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "predicateForRecentCallWithContactsDataSource:contactIdentifierCache:coreTelephonyDataSource:");
}

id objc_msgSend_predicateForRemoteParticipantsWithValues_caseInsensitiveValues_normalizedValues_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicateForRemoteParticipantsWithValues:caseInsensitiveValues:normalizedValues:");
}

id objc_msgSend_resolutionResultForPersonWithResolvedContactName_resolvedPerson_resolvedContact_contactIdentifiersRequiringConfirmation_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "resolutionResultForPersonWithResolvedContactName:resolvedPerson:resolvedContact:contactIdentifiersRequiringConfirmation:");
}

id objc_msgSend_resolvePreferredHandleFromHandles_contactIdentifiersRequiringConfirmation_telephonyOnly_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resolvePreferredHandleFromHandles:contactIdentifiersRequiringConfirmation:telephonyOnly:");
}

id objc_msgSend_shouldInferAudioCapabilityForRequestedCallCapability_idiom_isDisplayDisabled_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldInferAudioCapabilityForRequestedCallCapability:idiom:isDisplayDisabled:");
}

id objc_msgSend_shouldRequireUnknownRecipientConfirmationForRequestedRecipient_resolvedToRecipient_contact_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldRequireUnknownRecipientConfirmationForRequestedRecipient:resolvedToRecipient:contact:");
}

id objc_msgSend_tu_contactsMatchingIdentifiers_contactsDataSource_identifierToContactCache_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tu_contactsMatchingIdentifiers:contactsDataSource:identifierToContactCache:");
}

id objc_msgSend_updateScoreBasedHandleResolver_forRecentCallsMatchingHandles_telephonyOnly_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateScoreBasedHandleResolver:forRecentCallsMatchingHandles:telephonyOnly:");
}

id objc_msgSend_videoDeviceController(void *a1, const char *a2, ...)
{
  return [a1 videoDeviceController];
}