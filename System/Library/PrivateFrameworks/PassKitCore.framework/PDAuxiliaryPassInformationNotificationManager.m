@interface PDAuxiliaryPassInformationNotificationManager
- (PDAuxiliaryPassInformationNotificationManager)initWithUserNotificationManager:(id)a3;
- (id)_itemIdentifiersPropertyNameAndRoomNumbersForInformation:(id)a3;
- (void)_didInsertOrUpdateHospitalityPass:(id)a3 oldPass:(id)a4;
- (void)didInsertOrUpdatePass:(id)a3 oldPass:(id)a4;
@end

@implementation PDAuxiliaryPassInformationNotificationManager

- (PDAuxiliaryPassInformationNotificationManager)initWithUserNotificationManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___PDAuxiliaryPassInformationNotificationManager;
  v6 = -[PDAuxiliaryPassInformationNotificationManager init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_userNotificationManager, a3);
  }

  return v7;
}

- (void)didInsertOrUpdatePass:(id)a3 oldPass:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if ([v7 isAccessPass] && objc_msgSend(v7, "accessType") == (id)1) {
    -[PDAuxiliaryPassInformationNotificationManager _didInsertOrUpdateHospitalityPass:oldPass:]( self,  "_didInsertOrUpdateHospitalityPass:oldPass:",  v7,  v6);
  }
}

- (void)_didInsertOrUpdateHospitalityPass:(id)a3 oldPass:(id)a4
{
  id v5 = (__CFString *)a3;
  id v6 = (__CFString *)a4;
  uint64_t Object = PKLogFacilityTypeGetObject(36LL);
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138478083;
    v89 = v5;
    __int16 v90 = 2113;
    v91 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "_didInsertOrUpdateHospitalityPass: %{private}@, oldPass: %{private}@",  buf,  0x16u);
  }

  v60 = v5;
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString auxiliaryPassInformation](v5, "auxiliaryPassInformation"));
  v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v81 = 0u;
  __int128 v82 = 0u;
  __int128 v83 = 0u;
  __int128 v84 = 0u;
  v59 = v6;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString auxiliaryPassInformation](v6, "auxiliaryPassInformation"));
  id v12 = [v11 countByEnumeratingWithState:&v81 objects:v87 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v82;
    do
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v82 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v81 + 1) + 8LL * (void)i);
        v17 = (void *)objc_claimAutoreleasedReturnValue([v16 identifier]);
        -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v16, v17);
      }

      id v13 = [v11 countByEnumeratingWithState:&v81 objects:v87 count:16];
    }

    while (v13);
  }

  __int128 v79 = 0u;
  __int128 v80 = 0u;
  __int128 v77 = 0u;
  __int128 v78 = 0u;
  id v18 = v9;
  id v63 = [v18 countByEnumeratingWithState:&v77 objects:v86 count:16];
  if (v63)
  {
    id obj = v18;
    v19 = 0LL;
    LOBYTE(v18) = 0;
    int v69 = 0;
    uint64_t v62 = *(void *)v78;
LABEL_12:
    v20 = 0LL;
    v21 = v19;
    while (1)
    {
      if (*(void *)v78 != v62) {
        objc_enumerationMutation(obj);
      }
      v22 = *(void **)(*((void *)&v77 + 1) + 8LL * (void)v20);
      v23 = (void *)objc_claimAutoreleasedReturnValue([v22 identifier]);
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v10, "objectForKey:", v23));

      v25 = (void *)objc_claimAutoreleasedReturnValue( -[PDAuxiliaryPassInformationNotificationManager _itemIdentifiersPropertyNameAndRoomNumbersForInformation:]( self,  "_itemIdentifiersPropertyNameAndRoomNumbersForInformation:",  v22));
      v26 = (void *)objc_claimAutoreleasedReturnValue( -[PDAuxiliaryPassInformationNotificationManager _itemIdentifiersPropertyNameAndRoomNumbersForInformation:]( self,  "_itemIdentifiersPropertyNameAndRoomNumbersForInformation:",  v24));
      v27 = objc_alloc(&OBJC_CLASS___NSSet);
      v72 = v25;
      v28 = (void *)objc_claimAutoreleasedReturnValue([v25 allKeys]);
      v29 = -[NSSet initWithArray:](v27, "initWithArray:", v28);

      v30 = objc_alloc(&OBJC_CLASS___NSSet);
      v70 = v26;
      v31 = (void *)objc_claimAutoreleasedReturnValue([v26 allKeys]);
      v71 = -[NSSet initWithArray:](v30, "initWithArray:", v31);

      __int128 v75 = 0u;
      __int128 v76 = 0u;
      __int128 v73 = 0u;
      __int128 v74 = 0u;
      v68 = v29;
      id v32 = -[NSSet countByEnumeratingWithState:objects:count:]( v68,  "countByEnumeratingWithState:objects:count:",  &v73,  v85,  16LL);
      if (v32)
      {
        id v33 = v32;
        v65 = v21;
        v66 = v20;
        v67 = v24;
        uint64_t v34 = *(void *)v74;
        while (2)
        {
          for (j = 0LL; j != v33; j = (char *)j + 1)
          {
            if (*(void *)v74 != v34) {
              objc_enumerationMutation(v68);
            }
            uint64_t v36 = *(void *)(*((void *)&v73 + 1) + 8LL * (void)j);
            v37 = (void *)objc_claimAutoreleasedReturnValue([v72 objectForKey:v36]);
            v19 = (void *)objc_claimAutoreleasedReturnValue([v37 objectAtIndexedSubscript:0]);
            if (!-[NSSet containsObject:](v71, "containsObject:", v36))
            {
              int v69 = 1;
LABEL_34:

              goto LABEL_35;
            }

            unsigned int v38 = 1;
            v39 = (void *)objc_claimAutoreleasedReturnValue([v37 objectAtIndexedSubscript:1]);
            v40 = (void *)objc_claimAutoreleasedReturnValue([v70 objectForKey:v36]);
            v41 = (void *)objc_claimAutoreleasedReturnValue([v40 objectAtIndexedSubscript:1]);

            id v42 = v39;
            id v43 = v41;
            v44 = v43;
            if (v42 != v43)
            {
              if (v42) {
                BOOL v45 = v43 == 0LL;
              }
              else {
                BOOL v45 = 1;
              }
              if (v45) {
                unsigned int v38 = 0;
              }
              else {
                unsigned int v38 = [v42 isEqualToString:v43];
              }
            }

            LODWORD(v18) = v38 ^ 1;
            LOBYTE(v18) = 0;
          }

          id v33 = -[NSSet countByEnumeratingWithState:objects:count:]( v68,  "countByEnumeratingWithState:objects:count:",  &v73,  v85,  16LL);
          LOBYTE(v18) = 0;
          if (v33) {
            continue;
          }
          break;
        }

        v19 = v65;
        int v69 = 0;
LABEL_35:
        v20 = v66;
        v24 = v67;
      }

      else
      {
        v19 = v21;
      }

      v20 = (char *)v20 + 1;
      v21 = v19;
      if (v20 == v63)
      {
        id v63 = [obj countByEnumeratingWithState:&v77 objects:v86 count:16];
        if (v63) {
          goto LABEL_12;
        }
        id v18 = obj;
        goto LABEL_51;
      }
    }

    uint64_t v46 = PKLogFacilityTypeGetObject(0LL);
    v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      v48 = @"NO";
      if ((v69 & 1) != 0) {
        v49 = @"YES";
      }
      else {
        v49 = @"NO";
      }
      *(_DWORD *)buf = 138412546;
      v89 = v49;
      __int16 v90 = 2112;
      v91 = v48;
      _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEFAULT,  "hasNewCheckIn: %@, hasChangedCheckIn: %@",  buf,  0x16u);
    }

    id v18 = obj;
    if (v19)
    {
      uint64_t v50 = PKLocalizedPaymentString(@"HOSPITALITY_PASS_UPDATE_TAP_TO_UNLOCK_UNAVAILABLE_TITLE");
      v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
      uint64_t v52 = PKLocalizedPaymentString(@"HOSPITALITY_PASS_UPDATE_TAP_TO_UNLOCK_UNAVAILABLE_FORMAT");
      v53 = (void *)objc_claimAutoreleasedReturnValue(v52);
      uint64_t v54 = PKStringWithValidatedFormat(v53, @"%@");
      v55 = (void *)objc_claimAutoreleasedReturnValue(v54);
      v56 = objc_alloc(&OBJC_CLASS___PDGenericUserNotification);
      v57 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString uniqueID](v60, "uniqueID", v19));
      v58 = -[PDGenericUserNotification initWithTitle:message:forPassUniqueIdentifier:]( v56,  "initWithTitle:message:forPassUniqueIdentifier:",  v51,  v55,  v57);

      id v18 = obj;
      -[PDUserNotificationManager insertUserNotification:]( self->_userNotificationManager,  "insertUserNotification:",  v58);

      goto LABEL_52;
    }
  }

  else
  {
    v19 = 0LL;
LABEL_51:
    v51 = v18;
LABEL_52:
  }
}

- (id)_itemIdentifiersPropertyNameAndRoomNumbersForInformation:(id)a3
{
  id v3 = a3;
  uint64_t v4 = PKArbitrarySupplementaryFieldPrefix;
  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@room",  PKArbitrarySupplementaryFieldPrefix));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@tap_to_unlock_unavailable",  v4));
  v30 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v28 = v3;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue([v3 items]);
  id v32 = [obj countByEnumeratingWithState:&v41 objects:v47 count:16];
  if (v32)
  {
    uint64_t v31 = *(void *)v42;
    do
    {
      uint64_t v6 = 0LL;
      do
      {
        if (*(void *)v42 != v31) {
          objc_enumerationMutation(obj);
        }
        uint64_t v33 = v6;
        id v7 = *(void **)(*((void *)&v41 + 1) + 8 * v6);
        v35 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
        uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v7 title]);
        __int128 v37 = 0u;
        __int128 v38 = 0u;
        __int128 v39 = 0u;
        __int128 v40 = 0u;
        v8 = (void *)objc_claimAutoreleasedReturnValue([v7 fields]);
        id v9 = [v8 countByEnumeratingWithState:&v37 objects:v46 count:16];
        if (v9)
        {
          id v10 = v9;
          int v11 = 0;
          id v12 = 0LL;
          uint64_t v13 = *(void *)v38;
          while (2)
          {
            for (i = 0LL; i != v10; i = (char *)i + 1)
            {
              if (*(void *)v38 != v13) {
                objc_enumerationMutation(v8);
              }
              v15 = *(void **)(*((void *)&v37 + 1) + 8LL * (void)i);
              id v16 = (id)objc_claimAutoreleasedReturnValue([v15 key]);
              v17 = v16;
              if (v16)
              {
                id v18 = [v16 length];

                if (v18)
                {
                  v19 = (void *)objc_claimAutoreleasedReturnValue([v15 value]);
                  if ([v17 hasPrefix:v36])
                  {
                    if (PKIsStringRoomNumber(v19))
                    {
                      id v20 = v19;

                      id v12 = v20;
                    }
                  }

                  else
                  {
                    unsigned int v21 = v17 == v5;
                    if (v17 != v5 && v5 != 0LL) {
                      unsigned int v21 = [v17 isEqualToString:v5];
                    }
                    v11 |= v21;
                  }

                  id v23 = v12;
                  id v12 = v23;
                  if (v23)
                  {
                    BOOL v24 = [v23 length] != 0;

                    if ((v24 & v11 & 1) != 0)
                    {
                      v45[0] = v34;
                      v45[1] = v12;
                      v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v45,  2LL));
                      -[NSMutableDictionary setObject:forKey:](v30, "setObject:forKey:", v25, v35);

                      goto LABEL_30;
                    }
                  }
                }
              }
            }

            id v10 = [v8 countByEnumeratingWithState:&v37 objects:v46 count:16];
            if (v10) {
              continue;
            }
            break;
          }
        }

        else
        {
          id v12 = 0LL;
        }

- (void).cxx_destruct
{
}

@end