@interface PDAuxiliaryPassInformationManager
- (BOOL)_canUpdateMapsDataForMerchant:(id)a3 configurations:(id *)a4;
- (PDAuxiliaryPassInformationManager)initWithDatabaseManager:(id)a3 withMerchantUpdater:(id)a4 userNotificationManager:(id)a5;
- (id)_mapsBrandAndMerchantForMerchant:(id)a3;
- (void)_lookupMapsInformationForItem:(id)a3 completion:(id)a4;
- (void)_markOutstandingUpdatesInvalidForPassUniqueIdentifier:(id)a3;
- (void)_processAuxiliaryPassInformation:(id)a3 pass:(id)a4;
- (void)didInsertOrUpdatePass:(id)a3 oldPass:(id)a4 oldAuxiliaryInformationIdentifiers:(id)a5;
- (void)merchantForPassUniqueIdentifier:(id)a3 withAuxiliaryPassInformationItem:(id)a4 completion:(id)a5;
- (void)passWillBeRemoved:(id)a3;
@end

@implementation PDAuxiliaryPassInformationManager

- (PDAuxiliaryPassInformationManager)initWithDatabaseManager:(id)a3 withMerchantUpdater:(id)a4 userNotificationManager:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___PDAuxiliaryPassInformationManager;
  v12 = -[PDAuxiliaryPassInformationManager init](&v21, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_databaseManager, a3);
    objc_storeStrong((id *)&v13->_merchantUpdater, a4);
    if (PKMultiReservationTTUNotificationEnabled())
    {
      v14 = -[PDAuxiliaryPassInformationNotificationManager initWithUserNotificationManager:]( objc_alloc(&OBJC_CLASS___PDAuxiliaryPassInformationNotificationManager),  "initWithUserNotificationManager:",  v11);
      notificationManager = v13->_notificationManager;
      v13->_notificationManager = v14;
    }

    v13->_lock._os_unfair_lock_opaque = 0;
    v16 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    processingItemUpdatesForPass = v13->_processingItemUpdatesForPass;
    v13->_processingItemUpdatesForPass = v16;

    v18 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    processingItemCompletions = v13->_processingItemCompletions;
    v13->_processingItemCompletions = v18;
  }

  return v13;
}

- (void)didInsertOrUpdatePass:(id)a3 oldPass:(id)a4 oldAuxiliaryInformationIdentifiers:(id)a5
{
  id v7 = a3;
  id v26 = a4;
  id v8 = a5;
  v27 = v7;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 auxiliaryPassInformation]);
  id v10 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v11 = -[NSMutableSet initWithSet:](objc_alloc(&OBJC_CLASS___NSMutableSet), "initWithSet:", v8);
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  id obj = v9;
  id v30 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v30)
  {
    uint64_t v29 = *(void *)v40;
    do
    {
      for (i = 0LL; i != v30; i = (char *)i + 1)
      {
        if (*(void *)v40 != v29) {
          objc_enumerationMutation(obj);
        }
        v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v39 + 1) + 8 * (void)i) items]);
        __int128 v35 = 0u;
        __int128 v36 = 0u;
        __int128 v37 = 0u;
        __int128 v38 = 0u;
        id v14 = [v13 countByEnumeratingWithState:&v35 objects:v43 count:16];
        if (v14)
        {
          id v15 = v14;
          uint64_t v16 = *(void *)v36;
          do
          {
            for (j = 0LL; j != v15; j = (char *)j + 1)
            {
              if (*(void *)v36 != v16) {
                objc_enumerationMutation(v13);
              }
              v18 = *(void **)(*((void *)&v35 + 1) + 8LL * (void)j);
              v19 = (void *)objc_claimAutoreleasedReturnValue([v18 identifier]);
              else {
                -[NSMutableSet addObject:](v10, "addObject:", v18);
              }
            }

            id v15 = [v13 countByEnumeratingWithState:&v35 objects:v43 count:16];
          }

          while (v15);
        }
      }

      id v30 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
    }

    while (v30);
  }

  if (-[NSMutableSet count](v11, "count"))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue([v26 uniqueID]);
    -[PDAuxiliaryPassInformationManager _markOutstandingUpdatesInvalidForPassUniqueIdentifier:]( self,  "_markOutstandingUpdatesInvalidForPassUniqueIdentifier:",  v20);
    databaseManager = self->_databaseManager;
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472LL;
    v31[2] = sub_100082F64;
    v31[3] = &unk_10063E440;
    v32 = v11;
    v33 = self;
    id v34 = v20;
    id v22 = v20;
    -[PDDatabaseManager performTransactionWithBlock:](databaseManager, "performTransactionWithBlock:", v31);
  }

  if (-[NSMutableSet count](v10, "count"))
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue([v27 uniqueID]);
    -[PDAuxiliaryPassInformationManager _markOutstandingUpdatesInvalidForPassUniqueIdentifier:]( self,  "_markOutstandingUpdatesInvalidForPassUniqueIdentifier:",  v23);

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v10, "allObjects"));
    -[PDAuxiliaryPassInformationManager _processAuxiliaryPassInformation:pass:]( self,  "_processAuxiliaryPassInformation:pass:",  v24,  v27);
  }

  if (PKMultiReservationTTUNotificationEnabled()) {
    -[PDAuxiliaryPassInformationNotificationManager didInsertOrUpdatePass:oldPass:]( self->_notificationManager,  "didInsertOrUpdatePass:oldPass:",  v27,  v26);
  }
}

- (void)passWillBeRemoved:(id)a3
{
  databaseManager = self->_databaseManager;
  id v4 = (id)objc_claimAutoreleasedReturnValue([a3 uniqueID]);
  -[PDDatabaseManager deleteAllPassAuxiliaryItemMerchantsForPassUniqueIdentifier:]( databaseManager,  "deleteAllPassAuxiliaryItemMerchantsForPassUniqueIdentifier:",  v4);
}

- (void)_markOutstandingUpdatesInvalidForPassUniqueIdentifier:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_processingItemUpdatesForPass, "objectForKey:", v4));
  v6 = v5;
  if (v5)
  {
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        id v10 = 0LL;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v11 + 1) + 8 * (void)v10) setIsInvalid:1];
          id v10 = (char *)v10 + 1;
        }

        while (v8 != v10);
        id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }

      while (v8);
    }
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_processingItemUpdatesForPass,  "setObject:forKeyedSubscript:",  v6,  v4);
  os_unfair_lock_unlock(&self->_lock);
}

- (void)_processAuxiliaryPassInformation:(id)a3 pass:(id)a4
{
  id v6 = a3;
  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([a4 uniqueID]);
    id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v40 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v48 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    os_unfair_lock_t lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    __int128 v64 = 0u;
    __int128 v65 = 0u;
    __int128 v62 = 0u;
    __int128 v63 = 0u;
    id v38 = v6;
    id obj = v6;
    id v9 = [obj countByEnumeratingWithState:&v62 objects:v69 count:16];
    __int128 v41 = v8;
    v47 = self;
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v63;
      __int128 v39 = v7;
      uint64_t v43 = *(void *)v63;
      do
      {
        __int128 v12 = 0LL;
        id v44 = v10;
        do
        {
          if (*(void *)v63 != v11) {
            objc_enumerationMutation(obj);
          }
          __int128 v13 = *(void **)(*((void *)&v62 + 1) + 8LL * (void)v12);
          __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier", lock));
          if (v14)
          {
            id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 mapsURL]);

            if (v15)
            {
              uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager merchantForPassUniqueIdentifier:auxiliaryPassInformationItemIdentifier:]( self->_databaseManager,  "merchantForPassUniqueIdentifier:auxiliaryPassInformationItemIdentifier:",  v7,  v14));
              if (v16)
              {
                v17 = (NSMutableSet *)objc_claimAutoreleasedReturnValue( -[PDAuxiliaryPassInformationManager _mapsBrandAndMerchantForMerchant:]( self,  "_mapsBrandAndMerchantForMerchant:",  v16));
                -[NSMutableArray addObjectsFromArray:](v8, "addObjectsFromArray:", v17);
              }

              else
              {
                v18 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_processingItemUpdatesForPass,  "objectForKey:",  v7));
                v19 = objc_alloc_init(&OBJC_CLASS___PDAuxiliaryPassInformationManagerItemUpdate);
                -[PDAuxiliaryPassInformationManagerItemUpdate setItem:](v19, "setItem:", v13);
                -[PDAuxiliaryPassInformationManagerItemUpdate setIsInvalid:](v19, "setIsInvalid:", 0LL);
                if (v18)
                {
                  __int128 v42 = v19;
                  __int128 v60 = 0u;
                  __int128 v61 = 0u;
                  __int128 v58 = 0u;
                  __int128 v59 = 0u;
                  v17 = v18;
                  id v20 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v58,  v67,  16LL);
                  if (v20)
                  {
                    id v21 = v20;
                    uint64_t v22 = *(void *)v59;
                    do
                    {
                      for (i = 0LL; i != v21; i = (char *)i + 1)
                      {
                        if (*(void *)v59 != v22) {
                          objc_enumerationMutation(v17);
                        }
                        v24 = *(void **)(*((void *)&v58 + 1) + 8LL * (void)i);
                        v25 = (void *)objc_claimAutoreleasedReturnValue([v24 item]);
                        if ([v13 isEqual:v25])
                        {
                          unsigned __int8 v26 = [v24 isInvalid];

                          if ((v26 & 1) == 0)
                          {

                            self = v47;
                            id v7 = v39;
                            -[NSMutableDictionary setObject:forKeyedSubscript:]( v47->_processingItemUpdatesForPass,  "setObject:forKeyedSubscript:",  v17,  v39);

                            goto LABEL_26;
                          }
                        }

                        else
                        {
                        }
                      }

                      id v21 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v58,  v67,  16LL);
                    }

                    while (v21);
                  }

                  v19 = v42;
                  -[NSMutableSet addObject:](v17, "addObject:", v42);
                  id v7 = v39;
                  self = v47;
                }

                else
                {
                  v27 = objc_alloc(&OBJC_CLASS___NSMutableSet);
                  v68 = v19;
                  v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v68,  1LL));
                  v17 = -[NSMutableSet initWithArray:](v27, "initWithArray:", v28);
                }

                -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_processingItemUpdatesForPass,  "setObject:forKeyedSubscript:",  v17,  v7);
                -[NSMutableArray addObject:](v40, "addObject:", v13);
                -[NSMutableDictionary setObject:forKey:](v48, "setObject:forKey:", v19, v14);

LABEL_26:
                id v8 = v41;
              }

              uint64_t v11 = v43;
              id v10 = v44;
            }
          }

          __int128 v12 = (char *)v12 + 1;
        }

        while (v12 != v10);
        id v10 = [obj countByEnumeratingWithState:&v62 objects:v69 count:16];
      }

      while (v10);
    }

    os_unfair_lock_unlock(lock);
    __int128 v56 = 0u;
    __int128 v57 = 0u;
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    obja = v40;
    id v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obja,  "countByEnumeratingWithState:objects:count:",  &v54,  v66,  16LL);
    if (v29)
    {
      id v30 = v29;
      uint64_t v31 = *(void *)v55;
      do
      {
        for (j = 0LL; j != v30; j = (char *)j + 1)
        {
          if (*(void *)v55 != v31) {
            objc_enumerationMutation(obja);
          }
          v33 = *(void **)(*((void *)&v54 + 1) + 8LL * (void)j);
          id v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "identifier", lock));
          v49[0] = _NSConcreteStackBlock;
          v49[1] = 3221225472LL;
          v49[2] = sub_1000836E0;
          v49[3] = &unk_10063E490;
          v49[4] = v47;
          id v50 = v7;
          v51 = v48;
          v52 = v34;
          v53 = v33;
          -[PDAuxiliaryPassInformationManager _lookupMapsInformationForItem:completion:]( v47,  "_lookupMapsInformationForItem:completion:",  v33,  v49);
        }

        id v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obja,  "countByEnumeratingWithState:objects:count:",  &v54,  v66,  16LL);
      }

      while (v30);
    }

    if (-[NSMutableArray count](v41, "count"))
    {
      merchantUpdater = v47->_merchantUpdater;
      id v36 = -[NSMutableArray copy](v41, "copy");
      -[PDMapsBrandAndMerchantUpdater updateMapsDataForConfigurations:]( merchantUpdater,  "updateMapsDataForConfigurations:",  v36);
    }

    id v6 = v38;
  }
}

- (void)merchantForPassUniqueIdentifier:(id)a3 withAuxiliaryPassInformationItem:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void (**)(void, void))v10;
  if (v10)
  {
    if (v8 && v9)
    {
      __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
      if (!v12) {
        v11[2](v11, 0LL);
      }
      os_unfair_lock_lock(&self->_lock);
      __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_processingItemUpdatesForPass, "objectForKey:", v8));
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472LL;
      v33[2] = sub_100083F04;
      v33[3] = &unk_10063E4B8;
      v33[4] = v12;
      if (objc_msgSend(v13, "pk_hasObjectPassingTest:", v33))
      {
        __int128 v14 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_processingItemCompletions,  "objectForKey:",  v8));
        id v30 = v13;
        if (v14)
        {
          id v15 = v14;
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v14, "objectForKey:", v12));
          if (v16)
          {
            id v17 = objc_retainBlock(v11);
            [v16 addObject:v17];
          }

          else
          {
            v25 = objc_alloc(&OBJC_CLASS___NSMutableArray);
            id v17 = objc_retainBlock(v11);
            unsigned __int8 v26 = -[NSMutableArray initWithObjects:](v25, "initWithObjects:", v17, 0LL);
            -[NSMutableDictionary setObject:forKey:](v15, "setObject:forKey:", v26, v12);
          }
        }

        else
        {
          id v21 = objc_alloc(&OBJC_CLASS___NSMutableDictionary);
          uint64_t v22 = objc_alloc(&OBJC_CLASS___NSMutableArray);
          id v23 = objc_retainBlock(v11);
          v24 = -[NSMutableArray initWithObjects:](v22, "initWithObjects:", v23, 0LL);
          id v15 = -[NSMutableDictionary initWithObjectsAndKeys:](v21, "initWithObjectsAndKeys:", v24, v12, 0LL);

          -[NSMutableDictionary setObject:forKey:](self->_processingItemCompletions, "setObject:forKey:", v15, v8);
        }

        uint64_t Object = PKLogFacilityTypeGetObject(0LL);
        v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
        __int128 v13 = v30;
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          processingItemCompletions = self->_processingItemCompletions;
          *(_DWORD *)buf = 138412802;
          __int128 v35 = v12;
          __int16 v36 = 2112;
          id v37 = v8;
          __int16 v38 = 2112;
          __int128 v39 = processingItemCompletions;
          _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "PDAuxiliaryPassInformationManager: Merchant lookup for %@ in pass %@ in progress, queueing completion %@",  buf,  0x20u);
        }

        os_unfair_lock_unlock(&self->_lock);
      }

      else
      {
        os_unfair_lock_unlock(&self->_lock);
        v18 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager merchantForPassUniqueIdentifier:auxiliaryPassInformationItemIdentifier:]( self->_databaseManager,  "merchantForPassUniqueIdentifier:auxiliaryPassInformationItemIdentifier:",  v8,  v12));
        -[NSMutableDictionary setUseDisplayNameIgnoringBrand:](v18, "setUseDisplayNameIgnoringBrand:", 1LL);
        uint64_t v19 = PKLogFacilityTypeGetObject(0LL);
        id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          __int128 v35 = v12;
          __int16 v36 = 2112;
          id v37 = v8;
          __int16 v38 = 2112;
          __int128 v39 = v18;
          _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "PDAuxiliaryPassInformationManager: Fetched merchant for %@ in pass %@ (merchant lookup not in progress): %@",  buf,  0x20u);
        }

        if (v18)
        {
          ((void (**)(void, NSMutableDictionary *))v11)[2](v11, v18);
        }

        else
        {
          v31[0] = _NSConcreteStackBlock;
          v31[1] = 3221225472LL;
          v31[2] = sub_100083F94;
          v31[3] = &unk_10063E4E0;
          v32 = v11;
          -[PDAuxiliaryPassInformationManager _lookupMapsInformationForItem:completion:]( self,  "_lookupMapsInformationForItem:completion:",  v9,  v31);
        }
      }
    }

    else
    {
      (*((void (**)(id, void))v10 + 2))(v10, 0LL);
    }
  }
}

- (void)_lookupMapsInformationForItem:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [[PKAuxiliaryItemMerchantLookupSource alloc] initWithAuxiliaryItem:v5];
  id v8 = [[PKMerchantLookupRequest alloc] initWithSource:v7];
  uint64_t Object = PKLogFacilityTypeGetObject(0LL);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v5 description]);
    *(_DWORD *)buf = 138412290;
    v18 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "PDAuxiliaryPassInformationManager: Looking up maps data for aux item %@",  buf,  0xCu);
  }

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100084150;
  v14[3] = &unk_10063E508;
  id v15 = v5;
  id v16 = v6;
  id v12 = v6;
  id v13 = v5;
  [v8 startLookupWithCompletion:v14];
}

- (id)_mapsBrandAndMerchantForMerchant:(id)a3
{
  id v8 = 0LL;
  unsigned int v3 = -[PDAuxiliaryPassInformationManager _canUpdateMapsDataForMerchant:configurations:]( self,  "_canUpdateMapsDataForMerchant:configurations:",  a3,  &v8);
  id v4 = v8;
  id v5 = v4;
  id v6 = 0LL;
  if (v3) {
    id v6 = v4;
  }

  return v6;
}

- (BOOL)_canUpdateMapsDataForMerchant:(id)a3 configurations:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 mapsBrand]);
  id v18 = 0LL;
  unsigned __int8 v8 = +[PDMapsBrandAndMerchantUpdater canUpdateMapsBrandForBrand:outConfiguration:]( &OBJC_CLASS___PDMapsBrandAndMerchantUpdater,  "canUpdateMapsBrandForBrand:outConfiguration:",  v7,  &v18);
  id v9 = v18;

  -[NSMutableArray safelyAddObject:](v6, "safelyAddObject:", v9);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 mapsMerchant]);

  id v17 = 0LL;
  unsigned __int8 v11 = +[PDMapsBrandAndMerchantUpdater canUpdateMapsMerchantForMerchant:outConfiguration:]( &OBJC_CLASS___PDMapsBrandAndMerchantUpdater,  "canUpdateMapsMerchantForMerchant:outConfiguration:",  v10,  &v17);
  id v12 = v17;

  -[NSMutableArray safelyAddObject:](v6, "safelyAddObject:", v12);
  char v15 = PKIsPhone(v13, v14);
  if (a4) {
    *a4 = -[NSMutableArray copy](v6, "copy");
  }

  return v15 & (v8 | v11);
}

- (void).cxx_destruct
{
}

@end