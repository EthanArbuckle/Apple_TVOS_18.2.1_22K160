@interface PDCloudStoreContainerDatabase
- (BOOL)didFinishInitialSyncForCloudStoreStore:(id)a3;
- (CKDatabase)database;
- (PDCloudStoreContainerDatabase)initWithDatabase:(id)a3 containerName:(id)a4 cacheDataSource:(id)a5 databaseContainerDataSource:(id)a6;
- (id)_cachedZoneSubscriptions;
- (id)_databaseSubscriptionThatNeedsToBeCreated;
- (id)allPossibleSubscriptionIdentifiers;
- (id)allPossibleZoneIDs;
- (id)changeTokenForCloudStoreStore:(id)a3;
- (id)cloudStoreZoneForSubscriptionIdentfiier:(id)a3;
- (id)cloudStoreZoneForZoneID:(id)a3;
- (id)cloudStoreZones;
- (id)cloudStoreZonesForItem:(id)a3 action:(unint64_t)a4;
- (id)cloudStoreZonesForItemType:(unint64_t)a3 action:(unint64_t)a4;
- (id)cloudStoreZonesForItemType:(unint64_t)a3 configuration:(id)a4 action:(unint64_t)a5;
- (id)description;
- (id)fetchTimestampForCloudStoreStore:(id)a3;
- (id)identifier;
- (id)subscriptionIdentifiersForZoneIDs:(id)a3;
- (id)subscriptionsForZones:(id)a3;
- (id)subscriptionsThatNeedsToBeCreated;
- (id)zoneForZoneName:(id)a3;
- (id)zonesThatNeedToBeCreated;
- (int64_t)scope;
- (void)_shouldUpdatedCloudStoreZone:(id)a3 remove:(BOOL)a4;
- (void)_updateCacheCloudStoreZonesByName;
- (void)clearCacheForZoneName:(id)a3;
- (void)clearCacheInDatabase;
- (void)createContainerDatabaseInCacheIfNecessary;
- (void)didCreateSubscriptions:(id)a3;
- (void)didCreateZones:(id)a3;
- (void)didFinishInitialSync:(BOOL)a3 forZoneID:(id)a4;
- (void)didRemoveSubscriptionIdentifiers:(id)a3;
- (void)didRemoveZoneIDs:(id)a3;
- (void)didUpdateChangeToken:(id)a3 fetchTimestamp:(id)a4 forZoneID:(id)a5;
- (void)didUpdateShare:(id)a3 forZoneID:(id)a4;
@end

@implementation PDCloudStoreContainerDatabase

- (PDCloudStoreContainerDatabase)initWithDatabase:(id)a3 containerName:(id)a4 cacheDataSource:(id)a5 databaseContainerDataSource:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___PDCloudStoreContainerDatabase;
  v15 = -[PDCloudStoreContainerDatabase init](&v18, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_database, a3);
    objc_storeStrong((id *)&v16->_containerName, a4);
    objc_storeStrong((id *)&v16->_cacheDataSource, a5);
    objc_storeStrong((id *)&v16->_databaseContainerDataSource, a6);
    -[PDCloudStoreContainerDatabase createContainerDatabaseInCacheIfNecessary]( v16,  "createContainerDatabaseInCacheIfNecessary");
    -[PDCloudStoreContainerDatabase _updateCacheCloudStoreZonesByName](v16, "_updateCacheCloudStoreZonesByName");
  }

  return v16;
}

- (id)zoneForZoneName:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    v4 = -[CKRecordZoneID initWithZoneName:ownerName:]( objc_alloc(&OBJC_CLASS___CKRecordZoneID),  "initWithZoneName:ownerName:",  v3,  CKCurrentUserDefaultName);

    v5 = -[CKRecordZone initWithZoneID:](objc_alloc(&OBJC_CLASS___CKRecordZone), "initWithZoneID:", v4);
  }

  else
  {
    v5 = 0LL;
  }

  return v5;
}

- (id)identifier
{
  return (id)CKDatabaseScopeString(-[PDCloudStoreContainerDatabase scope](self, "scope"));
}

- (int64_t)scope
{
  return (int64_t)-[CKDatabase scope](self->_database, "scope");
}

- (id)zonesThatNeedToBeCreated
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreContainerDatabaseDataSource allPossibleZoneNamesForContainerDatabase:]( self->_databaseContainerDataSource,  "allPossibleZoneNamesForContainerDatabase:",  self));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary allKeys](self->_cloudStoreZonesByName, "allKeys"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v4));

  id v6 = [v3 mutableCopy];
  [v6 minusSet:v5];
  v7 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      id v12 = 0LL;
      do
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreContainerDatabase zoneForZoneName:]( self,  "zoneForZoneName:",  *(void *)(*((void *)&v18 + 1) + 8LL * (void)v12),  (void)v18));
        if (v13) {
          -[NSMutableSet addObject:](v7, "addObject:", v13);
        }

        id v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }

    while (v10);
  }

  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v23 = self;
    __int16 v24 = 2114;
    id v25 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Zones that need to be created for database %@: %{public}@",  buf,  0x16u);
  }

  id v16 = -[NSMutableSet copy](v7, "copy");
  return v16;
}

- (id)subscriptionsThatNeedsToBeCreated
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreContainerDatabaseDataSource allPossibleZoneSubscriptionsForContainerDatabase:]( self->_databaseContainerDataSource,  "allPossibleZoneSubscriptionsForContainerDatabase:",  self));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainerDatabase _cachedZoneSubscriptions](self, "_cachedZoneSubscriptions"));
  id v5 = [v3 mutableCopy];
  [v5 minusSet:v4];
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreContainerDatabase _databaseSubscriptionThatNeedsToBeCreated]( self,  "_databaseSubscriptionThatNeedsToBeCreated"));
  if (v6) {
    [v5 addObject:v6];
  }
  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForKey:@"subscriptionID"]);
    int v12 = 138412546;
    id v13 = self;
    __int16 v14 = 2112;
    v15 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Subscriptions that needs to be created for database %@: %@",  (uint8_t *)&v12,  0x16u);
  }

  id v10 = [v5 copy];
  return v10;
}

- (id)allPossibleZoneIDs
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreContainerDatabaseDataSource allPossibleZoneNamesForContainerDatabase:]( self->_databaseContainerDataSource,  "allPossibleZoneNamesForContainerDatabase:",  self));
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreContainerDatabase zoneForZoneName:]( self,  "zoneForZoneName:",  *(void *)(*((void *)&v15 + 1) + 8LL * (void)v9),  (void)v15));
        uint64_t v11 = v10;
        if (v10)
        {
          int v12 = (void *)objc_claimAutoreleasedReturnValue([v10 zoneID]);
          -[NSMutableSet addObject:](v4, "addObject:", v12);
        }

        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v7);
  }

  id v13 = -[NSMutableSet copy](v4, "copy");
  return v13;
}

- (id)allPossibleSubscriptionIdentifiers
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreContainerDatabaseDataSource allPossibleZoneSubscriptionsForContainerDatabase:]( self->_databaseContainerDataSource,  "allPossibleZoneSubscriptionsForContainerDatabase:",  self));
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * (void)v9), "subscriptionID", (void)v16));
        -[NSMutableSet addObject:](v4, "addObject:", v10);

        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v7);
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreContainerDatabaseDataSource possibleDatabaseSubscriptionForContainerDatabase:]( self->_databaseContainerDataSource,  "possibleDatabaseSubscriptionForContainerDatabase:",  self));
  int v12 = v11;
  if (v11)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 subscriptionID]);
    -[NSMutableSet addObject:](v4, "addObject:", v13);
  }

  id v14 = -[NSMutableSet copy](v4, "copy", (void)v16);

  return v14;
}

- (id)subscriptionsForZones:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreContainerDatabaseDataSource subscriptionForZone:inContainerDatabase:]( self->_databaseContainerDataSource,  "subscriptionForZone:inContainerDatabase:",  *(void *)(*((void *)&v14 + 1) + 8LL * (void)v10),  self,  (void)v14));
        if (v11) {
          -[NSMutableSet addObject:](v5, "addObject:", v11);
        }

        id v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v8);
  }

  id v12 = -[NSMutableSet copy](v5, "copy");
  return v12;
}

- (id)subscriptionIdentifiersForZoneIDs:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v27;
    do
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = -[CKRecordZone initWithZoneID:]( objc_alloc(&OBJC_CLASS___CKRecordZone),  "initWithZoneID:",  *(void *)(*((void *)&v26 + 1) + 8LL * (void)v10));
        -[NSMutableSet addObject:](v5, "addObject:", v11);

        id v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }

    while (v8);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainerDatabase subscriptionsForZones:](self, "subscriptionsForZones:", v5));
  id v13 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v14 = v12;
  id v15 = [v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v23;
    do
    {
      __int128 v18 = 0LL;
      do
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(v14);
        }
        __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * (void)v18), "subscriptionID", (void)v22));
        -[NSMutableSet addObject:](v13, "addObject:", v19);

        __int128 v18 = (char *)v18 + 1;
      }

      while (v16 != v18);
      id v16 = [v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }

    while (v16);
  }

  id v20 = -[NSMutableSet copy](v13, "copy");
  return v20;
}

- (id)cloudStoreZones
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary allValues](self->_cloudStoreZonesByName, "allValues"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v2));

  return v3;
}

- (id)cloudStoreZonesForItem:(id)a3 action:(unint64_t)a4
{
  return -[PDCloudStoreContainerDatabaseDataSource cloudStoreZonesForItem:action:inContainerDatabase:]( self->_databaseContainerDataSource,  "cloudStoreZonesForItem:action:inContainerDatabase:",  a3,  a4,  self);
}

- (id)cloudStoreZonesForItemType:(unint64_t)a3 action:(unint64_t)a4
{
  return -[PDCloudStoreContainerDatabaseDataSource cloudStoreZonesForItemType:configuration:action:inContainerDatabase:]( self->_databaseContainerDataSource,  "cloudStoreZonesForItemType:configuration:action:inContainerDatabase:",  a3,  0LL,  a4,  self);
}

- (id)cloudStoreZonesForItemType:(unint64_t)a3 configuration:(id)a4 action:(unint64_t)a5
{
  return -[PDCloudStoreContainerDatabaseDataSource cloudStoreZonesForItemType:configuration:action:inContainerDatabase:]( self->_databaseContainerDataSource,  "cloudStoreZonesForItemType:configuration:action:inContainerDatabase:",  a3,  a4,  a5,  self);
}

- (id)cloudStoreZoneForZoneID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  id v15 = sub_1003E96E0;
  id v16 = sub_1003E96F0;
  id v17 = 0LL;
  cloudStoreZonesByName = self->_cloudStoreZonesByName;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1003E96F8;
  v9[3] = &unk_10065CF08;
  id v6 = v4;
  id v10 = v6;
  uint64_t v11 = &v12;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](cloudStoreZonesByName, "enumerateKeysAndObjectsUsingBlock:", v9);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)changeTokenForCloudStoreStore:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreDataSource tokenDataForCloudStore:containerDatabase:]( self->_cacheDataSource,  "tokenDataForCloudStore:containerDatabase:",  a3,  self));
  if (v3)
  {
    id v5 = -[NSKeyedUnarchiver initForReadingFromData:error:]( objc_alloc(&OBJC_CLASS___NSKeyedUnarchiver),  "initForReadingFromData:error:",  v3,  0LL);
    if (v5)
    {
      id v6 = -[NSKeyedUnarchiver decodeTopLevelObjectOfClass:forKey:error:]( v5,  "decodeTopLevelObjectOfClass:forKey:error:",  objc_opt_class(&OBJC_CLASS___CKServerChangeToken, v4),  NSKeyedArchiveRootObjectKey,  0LL);
      id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
      -[NSKeyedUnarchiver finishDecoding](v5, "finishDecoding");
    }

    else
    {
      uint64_t Object = PKLogFacilityTypeGetObject(9LL);
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v11 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Could not initialize unarchiver with change token data.",  v11,  2u);
      }

      id v7 = 0LL;
    }
  }

  else
  {
    id v7 = 0LL;
  }

  return v7;
}

- (BOOL)didFinishInitialSyncForCloudStoreStore:(id)a3
{
  return -[PDCloudStoreDataSource didFinishInitialSyncForCloudStore:containerDatabase:]( self->_cacheDataSource,  "didFinishInitialSyncForCloudStore:containerDatabase:",  a3,  self);
}

- (id)fetchTimestampForCloudStoreStore:(id)a3
{
  return -[PDCloudStoreDataSource fetchTimestampForCloudStore:containerDatabase:]( self->_cacheDataSource,  "fetchTimestampForCloudStore:containerDatabase:",  a3,  self);
}

- (id)cloudStoreZoneForSubscriptionIdentfiier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  id v15 = sub_1003E96E0;
  id v16 = sub_1003E96F0;
  id v17 = 0LL;
  cloudStoreZonesByName = self->_cloudStoreZonesByName;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1003E99F0;
  v9[3] = &unk_10065CF08;
  id v6 = v4;
  id v10 = v6;
  uint64_t v11 = &v12;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](cloudStoreZonesByName, "enumerateKeysAndObjectsUsingBlock:", v9);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)didCreateSubscriptions:(id)a3
{
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id v4 = a3;
  id v5 = [v4 countByEnumeratingWithState:&v33 objects:v43 count:16];
  if (!v5) {
    goto LABEL_27;
  }
  id v7 = v5;
  uint64_t v8 = *(void *)v34;
  uint64_t v9 = &_s10Foundation22_convertErrorToNSErrorySo0E0Cs0C0_pF_ptr;
  id v10 = &_s10Foundation22_convertErrorToNSErrorySo0E0Cs0C0_pF_ptr;
  while (2)
  {
    uint64_t v11 = 0LL;
    id v32 = v7;
    do
    {
      if (*(void *)v34 != v8) {
        objc_enumerationMutation(v4);
      }
      uint64_t v12 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)v11);
      uint64_t v13 = objc_opt_class(v9[315], v6);
      if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
      {
        id v15 = (PDCloudStoreContainerDatabase *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreContainerDatabaseDataSource possibleDatabaseSubscriptionForContainerDatabase:]( self->_databaseContainerDataSource,  "possibleDatabaseSubscriptionForContainerDatabase:",  self));
        if (PKEqualObjects(v12, v15))
        {
          -[PDCloudStoreDataSource updateDatabaseSubscription:containerDatabase:]( self->_cacheDataSource,  "updateDatabaseSubscription:containerDatabase:",  v15,  self);
        }

        else
        {
          uint64_t Object = PKLogFacilityTypeGetObject(9LL);
          __int128 v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v38 = v12;
            __int16 v39 = 2112;
            v40 = self;
            _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Error: an unknown suscription was created %@ in database %@",  buf,  0x16u);
          }
        }
      }

      else
      {
        uint64_t v16 = objc_opt_class(v10[338], v14);
        if ((objc_opt_isKindOfClass(v12, v16) & 1) == 0) {
          goto LABEL_21;
        }
        id v17 = (PDCloudStoreContainerDatabase *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreContainerDatabaseDataSource zoneIDForSubscription:inContainerDatabase:]( self->_databaseContainerDataSource,  "zoneIDForSubscription:inContainerDatabase:",  v12,  self));
        if (!v17)
        {
          uint64_t v30 = PKLogFacilityTypeGetObject(9LL);
          v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v38 = v12;
            __int16 v39 = 2112;
            v40 = self;
            _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "No zoneID for subscription %@ in database %@",  buf,  0x16u);
          }

          goto LABEL_27;
        }

        id v15 = v17;
        uint64_t v18 = v8;
        __int128 v19 = v9;
        id v20 = v4;
        __int128 v21 = v10;
        cloudStoreZonesByName = self->_cloudStoreZonesByName;
        __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainerDatabase zoneName](v17, "zoneName"));
        __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](cloudStoreZonesByName, "objectForKey:", v23));

        if (v24)
        {
          __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v12 subscriptionID]);
          [v24 setZoneSubscriptionIdentifier:v25];

          -[PDCloudStoreContainerDatabase _shouldUpdatedCloudStoreZone:remove:]( self,  "_shouldUpdatedCloudStoreZone:remove:",  v24,  0LL);
        }

        else
        {
          uint64_t v28 = PKLogFacilityTypeGetObject(9LL);
          __int128 v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            v38 = v12;
            __int16 v39 = 2112;
            v40 = v15;
            __int16 v41 = 2112;
            v42 = self;
            _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Error: a new subscription %@ was added but there is no cloud store zone defined for zoneID %@ in database %@",  buf,  0x20u);
          }
        }

        id v10 = v21;
        id v4 = v20;
        uint64_t v9 = v19;
        uint64_t v8 = v18;
        id v7 = v32;
      }

LABEL_21:
      uint64_t v11 = (char *)v11 + 1;
    }

    while (v7 != v11);
    id v7 = [v4 countByEnumeratingWithState:&v33 objects:v43 count:16];
    if (v7) {
      continue;
    }
    break;
  }

- (void)didCreateZones:(id)a3
{
  id v4 = a3;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v22;
    *(void *)&__int128 v6 = 138412290LL;
    __int128 v20 = v6;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v4);
        }
        id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * (void)i), "zoneID", v20));
        uint64_t v11 = (NSString *)(id)objc_claimAutoreleasedReturnValue([v10 zoneName]);
        if (v11 == CKRecordZoneDefaultName)
        {

          uint64_t v14 = (PKCloudStoreZone *)CKRecordZoneDefaultName;
          goto LABEL_20;
        }

        uint64_t v12 = v11;
        if (v11) {
          BOOL v13 = CKRecordZoneDefaultName == 0LL;
        }
        else {
          BOOL v13 = 1;
        }
        if (v13)
        {

LABEL_15:
          uint64_t v14 = (PKCloudStoreZone *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreContainerDatabase cloudStoreZoneForZoneID:]( self,  "cloudStoreZoneForZoneID:",  v10));
          if (!v14)
          {
            uint64_t Object = PKLogFacilityTypeGetObject(9LL);
            id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v20;
              __int128 v26 = v10;
              _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "A new zone was added but there is no cloud store zone defined for zoneID %@",  buf,  0xCu);
            }

            uint64_t v14 = -[PKCloudStoreZone initWithZoneID:containerDatabase:]( objc_alloc(&OBJC_CLASS___PKCloudStoreZone),  "initWithZoneID:containerDatabase:",  v10,  self);
          }

          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v10 zoneName]);
          -[PKCloudStoreZone setZoneName:](v14, "setZoneName:", v18);

          __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v10 ownerName]);
          -[PKCloudStoreZone setOwnerName:](v14, "setOwnerName:", v19);

          -[PDCloudStoreContainerDatabase _shouldUpdatedCloudStoreZone:remove:]( self,  "_shouldUpdatedCloudStoreZone:remove:",  v14,  0LL);
LABEL_20:

          goto LABEL_21;
        }

        unsigned __int8 v15 = -[NSString isEqualToString:](v11, "isEqualToString:", CKRecordZoneDefaultName);

        if ((v15 & 1) == 0) {
          goto LABEL_15;
        }
LABEL_21:
      }

      id v7 = [v4 countByEnumeratingWithState:&v21 objects:v27 count:16];
    }

    while (v7);
  }
}

- (void)didRemoveZoneIDs:(id)a3
{
  id v4 = a3;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v17;
    *(void *)&__int128 v6 = 138412290LL;
    __int128 v15 = v6;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreContainerDatabase cloudStoreZoneForZoneID:]( self,  "cloudStoreZoneForZoneID:",  v10,  v15));
        if (!v11)
        {
          uint64_t Object = PKLogFacilityTypeGetObject(9LL);
          BOOL v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v15;
            __int128 v21 = v10;
            _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "A zoneID was removed but there was no cloud store zone defined %@",  buf,  0xCu);
          }
        }

        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v10 zoneName]);
        [v11 setZoneName:v14];

        -[PDCloudStoreContainerDatabase _shouldUpdatedCloudStoreZone:remove:]( self,  "_shouldUpdatedCloudStoreZone:remove:",  v11,  1LL);
      }

      id v7 = [v4 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }

    while (v7);
  }
}

- (void)didRemoveSubscriptionIdentifiers:(id)a3
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v4 = a3;
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
LABEL_3:
    uint64_t v8 = 0LL;
    while (1)
    {
      if (*(void *)v12 != v7) {
        objc_enumerationMutation(v4);
      }
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreContainerDatabase cloudStoreZoneForSubscriptionIdentfiier:]( self,  "cloudStoreZoneForSubscriptionIdentfiier:",  *(void *)(*((void *)&v11 + 1) + 8 * v8),  (void)v11));
      if (!v9) {
        break;
      }
      id v10 = v9;
      [v9 setZoneSubscriptionIdentifier:0];
      -[PDCloudStoreContainerDatabase _shouldUpdatedCloudStoreZone:remove:]( self,  "_shouldUpdatedCloudStoreZone:remove:",  v10,  0LL);

      if (v6 == (id)++v8)
      {
        id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v6) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)didUpdateChangeToken:(id)a3 fetchTimestamp:(id)a4 forZoneID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainerDatabase cloudStoreZoneForZoneID:](self, "cloudStoreZoneForZoneID:", v10));
  if (v11)
  {
    -[PDCloudStoreDataSource updateChangeToken:fetchTimestamp:forCloudStoreZone:inContainerDatabase:]( self->_cacheDataSource,  "updateChangeToken:fetchTimestamp:forCloudStoreZone:inContainerDatabase:",  v8,  v9,  v11,  self);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(9LL);
    __int128 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "A change token and fetch timestamp was updated but there was no cloud store zone defined for %@",  (uint8_t *)&v14,  0xCu);
    }
  }
}

- (void)didFinishInitialSync:(BOOL)a3 forZoneID:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainerDatabase cloudStoreZoneForZoneID:](self, "cloudStoreZoneForZoneID:", v6));
  if (v7)
  {
    -[PDCloudStoreDataSource updateDidFinishInitialSync:forCloudStoreZone:inContainerDatabase:]( self->_cacheDataSource,  "updateDidFinishInitialSync:forCloudStoreZone:inContainerDatabase:",  v4,  v7,  self);
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(9LL);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "A change token and fetch timestamp was updated but there was no cloud store zone defined for %@",  (uint8_t *)&v10,  0xCu);
    }
  }
}

- (void)didUpdateShare:(id)a3 forZoneID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainerDatabase cloudStoreZoneForZoneID:](self, "cloudStoreZoneForZoneID:", v7));
  if (v8)
  {
    id v9 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    id v18 = v6;
    int v10 = (void *)objc_claimAutoreleasedReturnValue([v6 participants]);
    id v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v20;
      do
      {
        for (i = 0LL; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
          if (([v15 isCurrentUser] & 1) == 0)
          {
            __int128 v16 = -[PKCloudStoreZoneShareParticipant initWithParticipant:]( objc_alloc(&OBJC_CLASS___PKCloudStoreZoneShareParticipant),  "initWithParticipant:",  v15);
            -[NSMutableSet addObject:](v9, "addObject:", v16);
          }
        }

        id v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }

      while (v12);
    }

    [v8 setShareParticipants:v9];
    -[PDCloudStoreContainerDatabase _shouldUpdatedCloudStoreZone:remove:]( self,  "_shouldUpdatedCloudStoreZone:remove:",  v8,  0LL);
    id v6 = v18;
  }

  else
  {
    uint64_t Object = PKLogFacilityTypeGetObject(9LL);
    id v9 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v9,  OS_LOG_TYPE_DEFAULT,  "A share was updated but there was no cloud store zone defined for %@",  buf,  0xCu);
    }
  }
}

- (void)clearCacheInDatabase
{
  id v3 = -[NSDictionary copy](self->_cloudStoreZonesByName, "copy");
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreDataSource databaseSubscriptionForContainerDatabase:]( self->_cacheDataSource,  "databaseSubscriptionForContainerDatabase:",  self));
  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Clearing cache for cloud store zones %@",  (uint8_t *)&v7,  0xCu);
  }

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Clearing cache for database subscription %@",  (uint8_t *)&v7,  0xCu);
  }

  -[PDCloudStoreDataSource removeContainerDatabaseForContainerDatabase:]( self->_cacheDataSource,  "removeContainerDatabaseForContainerDatabase:",  self);
  -[PDCloudStoreContainerDatabase _updateCacheCloudStoreZonesByName](self, "_updateCacheCloudStoreZonesByName");
}

- (void)clearCacheForZoneName:(id)a3
{
  cloudStoreZonesByName = self->_cloudStoreZonesByName;
  id v5 = a3;
  id v6 = -[NSDictionary copy](cloudStoreZonesByName, "copy");
  int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v5]);

  if (v7)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(9LL);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = (void *)objc_claimAutoreleasedReturnValue([v7 zoneName]);
      int v11 = 138543618;
      id v12 = v10;
      __int16 v13 = 2112;
      int v14 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Clearing cache for cloud store zone %{public}@ in database %@",  (uint8_t *)&v11,  0x16u);
    }

    -[PDCloudStoreDataSource removeCloudStoreZone:containerDatabase:]( self->_cacheDataSource,  "removeCloudStoreZone:containerDatabase:",  v7,  self);
    -[PDCloudStoreContainerDatabase _updateCacheCloudStoreZonesByName](self, "_updateCacheCloudStoreZonesByName");
  }
}

- (id)_cachedZoneSubscriptions
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  cloudStoreZonesByName = self->_cloudStoreZonesByName;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1003EAA18;
  v8[3] = &unk_10065CF30;
  id v9 = v3;
  id v5 = v3;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](cloudStoreZonesByName, "enumerateKeysAndObjectsUsingBlock:", v8);
  id v6 = -[NSMutableSet copy](v5, "copy");

  return v6;
}

- (id)_databaseSubscriptionThatNeedsToBeCreated
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreDataSource databaseSubscriptionForContainerDatabase:]( self->_cacheDataSource,  "databaseSubscriptionForContainerDatabase:",  self));
  if (v3) {
    BOOL v4 = 0LL;
  }
  else {
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreContainerDatabaseDataSource possibleDatabaseSubscriptionForContainerDatabase:]( self->_databaseContainerDataSource,  "possibleDatabaseSubscriptionForContainerDatabase:",  self));
  }

  return v4;
}

- (void)_shouldUpdatedCloudStoreZone:(id)a3 remove:(BOOL)a4
{
  cacheDataSource = self->_cacheDataSource;
  if (a4) {
    -[PDCloudStoreDataSource removeCloudStoreZone:containerDatabase:]( cacheDataSource,  "removeCloudStoreZone:containerDatabase:",  a3,  self);
  }
  else {
    -[PDCloudStoreDataSource insertOrUpdateCloudStoreZone:containerDatabase:]( cacheDataSource,  "insertOrUpdateCloudStoreZone:containerDatabase:",  a3,  self);
  }
  -[PDCloudStoreContainerDatabase _updateCacheCloudStoreZonesByName](self, "_updateCacheCloudStoreZonesByName");
}

- (void)_updateCacheCloudStoreZonesByName
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreDataSource cloudStoreZonesForContainerDatabase:]( self->_cacheDataSource,  "cloudStoreZonesForContainerDatabase:",  self));
  BOOL v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v21 = self;
  int64_t v5 = -[PDCloudStoreContainerDatabase scope](self, "scope");
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v6 = v3;
  id v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        int v11 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
        if (v5 != 3) {
          goto LABEL_19;
        }
        id v12 = (NSString *)objc_retain((id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v23 + 1)
                                                                                               + 8LL * (void)i), "ownerName")));
        if (v12 == CKCurrentUserDefaultName)
        {
        }

        else
        {
          __int16 v13 = v12;
          if (v12) {
            BOOL v14 = CKCurrentUserDefaultName == 0LL;
          }
          else {
            BOOL v14 = 1;
          }
          if (v14)
          {

LABEL_19:
            id v18 = (void *)objc_claimAutoreleasedReturnValue([v11 zoneName]);
            -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v11, v18);

            continue;
          }

          unsigned int v15 = -[NSString isEqualToString:](v12, "isEqualToString:", CKCurrentUserDefaultName);

          if (!v15) {
            goto LABEL_19;
          }
        }

        uint64_t Object = PKLogFacilityTypeGetObject(9LL);
        __int128 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Error: we detected a default owner name for a shared zone. This zone is in a bad state so we will remove it from the the cache.",  buf,  2u);
        }

        -[PDCloudStoreDataSource removeCloudStoreZone:containerDatabase:]( v21->_cacheDataSource,  "removeCloudStoreZone:containerDatabase:",  v11);
      }

      id v8 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }

    while (v8);
  }

  __int128 v19 = (NSDictionary *)-[NSMutableDictionary copy](v4, "copy");
  cloudStoreZonesByName = v21->_cloudStoreZonesByName;
  v21->_cloudStoreZonesByName = v19;
}

- (void)createContainerDatabaseInCacheIfNecessary
{
  if ((-[PDCloudStoreDataSource containerDatabaseExistsForContainerDatabase:]( self->_cacheDataSource,  "containerDatabaseExistsForContainerDatabase:",  self) & 1) == 0)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(9LL);
    BOOL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138412290;
      id v6 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "A cloud store database did not exist before. Creating it now %@",  (uint8_t *)&v5,  0xCu);
    }

    -[PDCloudStoreDataSource insertContainerDatabaseForContainerDatabase:]( self->_cacheDataSource,  "insertContainerDatabaseForContainerDatabase:",  self);
  }

- (id)description
{
  id v3 = +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"<%@: %p; ",
         objc_opt_class(self, a2),
         self);
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  int v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKDatabase container](self->_database, "container"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 containerIdentifier]);
  [v4 appendFormat:@"containerIdentifier: '%@'; ", v6];

  uint64_t v7 = CKDatabaseScopeString(-[CKDatabase scope](self->_database, "scope"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  [v4 appendFormat:@"scope: '%@'; ", v8];

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary allValues](self->_cloudStoreZonesByName, "allValues"));
  int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 valueForKey:@"zoneName"]);
  [v4 appendFormat:@"cached zones: '%@'; ", v10];

  [v4 appendFormat:@">"];
  return v4;
}

- (CKDatabase)database
{
  return self->_database;
}

- (void).cxx_destruct
{
}

@end