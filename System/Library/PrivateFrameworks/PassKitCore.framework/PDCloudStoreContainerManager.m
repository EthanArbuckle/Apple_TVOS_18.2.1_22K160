@interface PDCloudStoreContainerManager
- (BOOL)cloudStoreZoneExistsForZoneName:(id)a3;
- (BOOL)didFinishInitialSyncForCloudStoreZone:(id)a3;
- (CKContainer)container;
- (PDCloudStoreContainerManager)initWithContainer:(id)a3 validScopes:(id)a4 cacheDataSource:(id)a5 databaseContainerDataSource:(id)a6;
- (id)allPossibleSubscriptionIdentifiersByDatabaseIdentifier;
- (id)allPossibleZoneIDsByDatabaseIdentifier;
- (id)allPossibleZoneIDsInContainerDatabase:(id)a3;
- (id)changeTokenForCloudStoreStore:(id)a3;
- (id)cloudStoreZoneForZoneID:(id)a3 inContainerDatabase:(id)a4;
- (id)cloudStoreZoneForZoneName:(id)a3 inContainerDatabase:(id)a4;
- (id)cloudStoreZonesByDatabaseIdentifierForItem:(id)a3 action:(unint64_t)a4;
- (id)cloudStoreZonesByDatabaseIdentifierForItemType:(unint64_t)a3 action:(unint64_t)a4;
- (id)cloudStoreZonesByDatabaseIdentifierForItemType:(unint64_t)a3 configuration:(id)a4 action:(unint64_t)a5;
- (id)cloudStoreZonesFromZoneNames:(id)a3 inContainerDatabase:(id)a4;
- (id)cloudStoreZonesInContainerDatabase:(id)a3;
- (id)containerName;
- (id)databaseForCloudStoreZone:(id)a3;
- (id)databaseForIdentifier:(id)a3;
- (id)databaseForScope:(int64_t)a3;
- (id)databaseIdentifierForScope:(int64_t)a3;
- (id)description;
- (id)fetchTimestampForCloudStoreStore:(id)a3;
- (id)subscriptionIdentifiersForDatabaseZoneIDs:(id)a3;
- (id)subscriptionsForDatabaseZones:(id)a3;
- (id)subscriptionsThatNeedToBeCreated;
- (id)validDatabaseIdentifiers;
- (id)validDatabases;
- (id)zonesThatNeedToBeCreated;
- (void)clearCacheInContainer;
- (void)clearCacheInContainerForZoneName:(id)a3;
- (void)containerDatabaseIdentifier:(id)a3 didCreateSubscriptions:(id)a4;
- (void)containerDatabaseIdentifier:(id)a3 didCreateZones:(id)a4;
- (void)containerDatabaseIdentifier:(id)a3 didFinishInitialSync:(BOOL)a4 forZoneID:(id)a5;
- (void)containerDatabaseIdentifier:(id)a3 didRemoveSubscriptionIdentifiers:(id)a4;
- (void)containerDatabaseIdentifier:(id)a3 didRemoveZoneIDs:(id)a4;
- (void)containerDatabaseIdentifier:(id)a3 didUpdateChangeToken:(id)a4 fetchTimestamp:(id)a5 forZoneID:(id)a6;
- (void)containerDatabaseIdentifier:(id)a3 didUpdateShare:(id)a4 forZoneID:(id)a5;
- (void)createContainerCacheIfNecessary;
- (void)setContainer:(id)a3;
@end

@implementation PDCloudStoreContainerManager

- (PDCloudStoreContainerManager)initWithContainer:(id)a3 validScopes:(id)a4 cacheDataSource:(id)a5 databaseContainerDataSource:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v46.receiver = self;
  v46.super_class = (Class)&OBJC_CLASS___PDCloudStoreContainerManager;
  v15 = -[PDCloudStoreContainerManager init](&v46, "init");
  v16 = v15;
  if (v15)
  {
    id v43 = v11;
    p_container = (id *)&v15->_container;
    objc_storeStrong((id *)&v15->_container, a3);
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[CKContainer containerIdentifier](v16->_container, "containerIdentifier"));
    v18 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v19 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    if ([v12 containsObject:&off_100690890])
    {
      v20 = objc_alloc(&OBJC_CLASS___PDCloudStoreContainerDatabase);
      v21 = (void *)objc_claimAutoreleasedReturnValue([*p_container privateCloudDatabase]);
      v22 = -[PDCloudStoreContainerDatabase initWithDatabase:containerName:cacheDataSource:databaseContainerDataSource:]( v20,  "initWithDatabase:containerName:cacheDataSource:databaseContainerDataSource:",  v21,  v45,  v13,  v14);

      v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[PDCloudStoreContainerDatabase scope](v22, "scope")));
      -[NSMutableDictionary setObject:forKey:](v18, "setObject:forKey:", v22, v23);

      uint64_t v24 = CKDatabaseScopeString(-[PDCloudStoreContainerDatabase scope](v22, "scope"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      -[NSMutableDictionary setObject:forKey:](v19, "setObject:forKey:", v22, v25);
    }

    if (objc_msgSend(v12, "containsObject:", &off_1006908A8, v43))
    {
      v26 = objc_alloc(&OBJC_CLASS___PDCloudStoreContainerDatabase);
      v27 = (void *)objc_claimAutoreleasedReturnValue([*p_container sharedCloudDatabase]);
      v28 = -[PDCloudStoreContainerDatabase initWithDatabase:containerName:cacheDataSource:databaseContainerDataSource:]( v26,  "initWithDatabase:containerName:cacheDataSource:databaseContainerDataSource:",  v27,  v45,  v13,  v14);

      v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[PDCloudStoreContainerDatabase scope](v28, "scope")));
      -[NSMutableDictionary setObject:forKey:](v18, "setObject:forKey:", v28, v29);

      uint64_t v30 = CKDatabaseScopeString(-[PDCloudStoreContainerDatabase scope](v28, "scope"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
      -[NSMutableDictionary setObject:forKey:](v19, "setObject:forKey:", v28, v31);
    }

    if ([v12 containsObject:&off_1006908C0])
    {
      v32 = objc_alloc(&OBJC_CLASS___PDCloudStoreContainerDatabase);
      v33 = (void *)objc_claimAutoreleasedReturnValue([*p_container publicCloudDatabase]);
      v34 = -[PDCloudStoreContainerDatabase initWithDatabase:containerName:cacheDataSource:databaseContainerDataSource:]( v32,  "initWithDatabase:containerName:cacheDataSource:databaseContainerDataSource:",  v33,  v45,  v13,  v14);

      v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[PDCloudStoreContainerDatabase scope](v34, "scope")));
      -[NSMutableDictionary setObject:forKey:](v18, "setObject:forKey:", v34, v35);

      uint64_t v36 = CKDatabaseScopeString(-[PDCloudStoreContainerDatabase scope](v34, "scope"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
      -[NSMutableDictionary setObject:forKey:](v19, "setObject:forKey:", v34, v37);
    }

    v38 = (NSDictionary *)-[NSMutableDictionary copy](v18, "copy");
    databaseByScope = v16->_databaseByScope;
    v16->_databaseByScope = v38;

    v40 = (NSDictionary *)-[NSMutableDictionary copy](v19, "copy");
    databaseByIdentifier = v16->_databaseByIdentifier;
    v16->_databaseByIdentifier = v40;

    id v11 = v44;
  }

  return v16;
}

- (id)containerName
{
  return -[CKContainer containerIdentifier](self->_container, "containerIdentifier");
}

- (id)databaseForScope:(int64_t)a3
{
  databaseByScope = self->_databaseByScope;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](databaseByScope, "objectForKey:", v4));

  return v5;
}

- (id)databaseIdentifierForScope:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainerManager databaseForScope:](self, "databaseForScope:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);

  return v4;
}

- (id)databaseForIdentifier:(id)a3
{
  return -[NSDictionary objectForKey:](self->_databaseByIdentifier, "objectForKey:", a3);
}

- (id)databaseForCloudStoreZone:(id)a3
{
  return -[PDCloudStoreContainerManager databaseForScope:](self, "databaseForScope:", [a3 scope]);
}

- (id)cloudStoreZonesByDatabaseIdentifierForItem:(id)a3 action:(unint64_t)a4
{
  id v6 = a3;
  v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  databaseByIdentifier = self->_databaseByIdentifier;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1003EB420;
  v13[3] = &unk_10065CF58;
  v15 = v7;
  unint64_t v16 = a4;
  id v14 = v6;
  v9 = v7;
  id v10 = v6;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](databaseByIdentifier, "enumerateKeysAndObjectsUsingBlock:", v13);
  id v11 = -[NSMutableDictionary copy](v9, "copy");

  return v11;
}

- (id)cloudStoreZonesByDatabaseIdentifierForItemType:(unint64_t)a3 action:(unint64_t)a4
{
  v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  databaseByIdentifier = self->_databaseByIdentifier;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1003EB530;
  v12[3] = &unk_10065CF80;
  unint64_t v14 = a3;
  unint64_t v15 = a4;
  id v13 = v7;
  v9 = v7;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](databaseByIdentifier, "enumerateKeysAndObjectsUsingBlock:", v12);
  id v10 = -[NSMutableDictionary copy](v9, "copy");

  return v10;
}

- (id)cloudStoreZonesByDatabaseIdentifierForItemType:(unint64_t)a3 configuration:(id)a4 action:(unint64_t)a5
{
  id v8 = a4;
  v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  databaseByIdentifier = self->_databaseByIdentifier;
  unint64_t v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472LL;
  v17 = sub_1003EB658;
  v18 = &unk_10065CFA8;
  unint64_t v21 = a3;
  unint64_t v22 = a5;
  id v19 = v8;
  v20 = v9;
  id v11 = v9;
  id v12 = v8;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](databaseByIdentifier, "enumerateKeysAndObjectsUsingBlock:", &v15);
  id v13 = -[NSMutableDictionary copy](v11, "copy", v15, v16, v17, v18);

  return v13;
}

- (id)cloudStoreZonesFromZoneNames:(id)a3 inContainerDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      id v13 = 0LL;
      do
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v7,  "zoneForZoneName:",  *(void *)(*((void *)&v19 + 1) + 8 * (void)v13),  (void)v19));
        unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 zoneID]);

        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreContainerManager cloudStoreZoneForZoneID:inContainerDatabase:]( self,  "cloudStoreZoneForZoneID:inContainerDatabase:",  v15,  v7));
        if (v16) {
          -[NSMutableSet addObject:](v8, "addObject:", v16);
        }

        id v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v11);
  }

  id v17 = -[NSMutableSet copy](v8, "copy");
  return v17;
}

- (BOOL)cloudStoreZoneExistsForZoneName:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  char v14 = 0;
  databaseByIdentifier = self->_databaseByIdentifier;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1003EB914;
  v8[3] = &unk_10065CFD0;
  v8[4] = self;
  id v6 = v4;
  id v9 = v6;
  id v10 = &v11;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](databaseByIdentifier, "enumerateKeysAndObjectsUsingBlock:", v8);
  LOBYTE(databaseByIdentifier) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)databaseByIdentifier;
}

- (id)cloudStoreZonesInContainerDatabase:(id)a3
{
  return [a3 cloudStoreZones];
}

- (id)validDatabaseIdentifiers
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary allKeys](self->_databaseByIdentifier, "allKeys"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v2));

  return v3;
}

- (id)validDatabases
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary allValues](self->_databaseByIdentifier, "allValues"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v2));

  return v3;
}

- (id)zonesThatNeedToBeCreated
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  databaseByIdentifier = self->_databaseByIdentifier;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1003EBA94;
  v8[3] = &unk_10065CFF8;
  id v9 = v3;
  v5 = v3;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](databaseByIdentifier, "enumerateKeysAndObjectsUsingBlock:", v8);
  id v6 = -[NSMutableDictionary copy](v5, "copy");

  return v6;
}

- (id)subscriptionsThatNeedToBeCreated
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  databaseByIdentifier = self->_databaseByIdentifier;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1003EBB88;
  v8[3] = &unk_10065CFF8;
  id v9 = v3;
  v5 = v3;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](databaseByIdentifier, "enumerateKeysAndObjectsUsingBlock:", v8);
  id v6 = -[NSMutableDictionary copy](v5, "copy");

  return v6;
}

- (id)allPossibleZoneIDsByDatabaseIdentifier
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  databaseByIdentifier = self->_databaseByIdentifier;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1003EBC7C;
  v8[3] = &unk_10065CFF8;
  id v9 = v3;
  v5 = v3;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](databaseByIdentifier, "enumerateKeysAndObjectsUsingBlock:", v8);
  id v6 = -[NSMutableDictionary copy](v5, "copy");

  return v6;
}

- (id)allPossibleSubscriptionIdentifiersByDatabaseIdentifier
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  databaseByIdentifier = self->_databaseByIdentifier;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1003EBD70;
  v8[3] = &unk_10065CFF8;
  id v9 = v3;
  v5 = v3;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](databaseByIdentifier, "enumerateKeysAndObjectsUsingBlock:", v8);
  id v6 = -[NSMutableDictionary copy](v5, "copy");

  return v6;
}

- (id)subscriptionsForDatabaseZones:(id)a3
{
  id v4 = a3;
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472LL;
  id v10 = sub_1003EBE78;
  uint64_t v11 = &unk_10063F230;
  uint64_t v12 = self;
  uint64_t v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v5 = v13;
  [v4 enumerateKeysAndObjectsUsingBlock:&v8];

  id v6 = -[NSMutableDictionary copy](v5, "copy", v8, v9, v10, v11, v12);
  return v6;
}

- (id)subscriptionIdentifiersForDatabaseZoneIDs:(id)a3
{
  id v4 = a3;
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472LL;
  id v10 = sub_1003EBFB4;
  uint64_t v11 = &unk_10063F230;
  uint64_t v12 = self;
  uint64_t v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v5 = v13;
  [v4 enumerateKeysAndObjectsUsingBlock:&v8];

  id v6 = -[NSMutableDictionary copy](v5, "copy", v8, v9, v10, v11, v12);
  return v6;
}

- (id)cloudStoreZoneForZoneID:(id)a3 inContainerDatabase:(id)a4
{
  return [a4 cloudStoreZoneForZoneID:a3];
}

- (id)cloudStoreZoneForZoneName:(id)a3 inContainerDatabase:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 zoneForZoneName:a3]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 zoneID]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[PDCloudStoreContainerManager cloudStoreZoneForZoneID:inContainerDatabase:]( self,  "cloudStoreZoneForZoneID:inContainerDatabase:",  v8,  v6));

  return v9;
}

- (id)allPossibleZoneIDsInContainerDatabase:(id)a3
{
  return [a3 allPossibleZoneIDs];
}

- (id)changeTokenForCloudStoreStore:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainerManager databaseForCloudStoreZone:](self, "databaseForCloudStoreZone:", v4));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 changeTokenForCloudStoreStore:v4]);
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

- (BOOL)didFinishInitialSyncForCloudStoreZone:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainerManager databaseForCloudStoreZone:](self, "databaseForCloudStoreZone:", v4));
  unsigned __int8 v6 = [v5 didFinishInitialSyncForCloudStoreStore:v4];

  return v6;
}

- (id)fetchTimestampForCloudStoreStore:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainerManager databaseForCloudStoreZone:](self, "databaseForCloudStoreZone:", v4));
    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v5 fetchTimestampForCloudStoreStore:v4]);
  }

  else
  {
    unsigned __int8 v6 = 0LL;
  }

  return v6;
}

- (void)containerDatabaseIdentifier:(id)a3 didCreateSubscriptions:(id)a4
{
  id v6 = a4;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainerManager databaseForIdentifier:](self, "databaseForIdentifier:", a3));
  [v7 didCreateSubscriptions:v6];
}

- (void)containerDatabaseIdentifier:(id)a3 didCreateZones:(id)a4
{
  id v6 = a4;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainerManager databaseForIdentifier:](self, "databaseForIdentifier:", a3));
  [v7 didCreateZones:v6];
}

- (void)containerDatabaseIdentifier:(id)a3 didRemoveZoneIDs:(id)a4
{
  id v6 = a4;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainerManager databaseForIdentifier:](self, "databaseForIdentifier:", a3));
  [v7 didRemoveZoneIDs:v6];
}

- (void)containerDatabaseIdentifier:(id)a3 didRemoveSubscriptionIdentifiers:(id)a4
{
  id v6 = a4;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainerManager databaseForIdentifier:](self, "databaseForIdentifier:", a3));
  [v7 didRemoveSubscriptionIdentifiers:v6];
}

- (void)containerDatabaseIdentifier:(id)a3 didUpdateChangeToken:(id)a4 fetchTimestamp:(id)a5 forZoneID:(id)a6
{
  id v15 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainerManager databaseForIdentifier:](self, "databaseForIdentifier:", a3));
  id v13 = v15;
  char v14 = v12;
  if (!v15)
  {
    [v12 didFinishInitialSync:0 forZoneID:v11];
    id v13 = 0LL;
  }

  [v14 didUpdateChangeToken:v13 fetchTimestamp:v10 forZoneID:v11];
}

- (void)containerDatabaseIdentifier:(id)a3 didFinishInitialSync:(BOOL)a4 forZoneID:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainerManager databaseForIdentifier:](self, "databaseForIdentifier:", a3));
  [v9 didFinishInitialSync:v5 forZoneID:v8];
}

- (void)containerDatabaseIdentifier:(id)a3 didUpdateShare:(id)a4 forZoneID:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = (id)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainerManager databaseForIdentifier:](self, "databaseForIdentifier:", a3));
  [v10 didUpdateShare:v9 forZoneID:v8];
}

- (void)clearCacheInContainer
{
}

- (void)clearCacheInContainerForZoneName:(id)a3
{
  id v4 = a3;
  databaseByIdentifier = self->_databaseByIdentifier;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1003EC57C;
  v7[3] = &unk_10065CFF8;
  id v8 = v4;
  id v6 = v4;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](databaseByIdentifier, "enumerateKeysAndObjectsUsingBlock:", v7);
}

- (void)createContainerCacheIfNecessary
{
}

- (id)description
{
  v3 = +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"<%@: %p; ",
         objc_opt_class(self, a2),
         self);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDCloudStoreContainerManager containerName](self, "containerName"));
  [v4 appendFormat:@"containerName: '%@'; ", v5];

  [v4 appendFormat:@">"];
  return v4;
}

- (CKContainer)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end