@interface SHLCloudSubscriptionTransformer
- (CKModifySubscriptionsOperation)modifySubscriptionsOperation;
- (SHLCloudSubscriptionTransformer)initWithConfiguration:(id)a3;
- (SHLSyncSessionConfiguration)configuration;
- (id)cloudBackedOperationForZones:(id)a3 container:(id)a4;
- (id)newSubscriptionForZoneID:(id)a3;
- (void)setModifySubscriptionsOperation:(id)a3;
@end

@implementation SHLCloudSubscriptionTransformer

- (SHLCloudSubscriptionTransformer)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___SHLCloudSubscriptionTransformer;
  v6 = -[SHLCloudSubscriptionTransformer init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    v8 = objc_alloc_init(&OBJC_CLASS___CKModifySubscriptionsOperation);
    modifySubscriptionsOperation = v7->_modifySubscriptionsOperation;
    v7->_modifySubscriptionsOperation = v8;
  }

  return v7;
}

- (id)cloudBackedOperationForZones:(id)a3 container:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_alloc(&OBJC_CLASS___SHLCloudLibraryCache);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudSubscriptionTransformer configuration](self, "configuration"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 callingProcessIdentifier]);
  v51 = v7;
  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue([v7 container]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 containerIdentifier]);
  v57 = self;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudSubscriptionTransformer configuration](self, "configuration"));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 sessionIdentifier]);
  v55 = -[SHLCloudLibraryCache initWithCallingProcessIdentifier:containerIdentifier:transactionIdentifier:]( v8,  "initWithCallingProcessIdentifier:containerIdentifier:transactionIdentifier:",  v10,  v12,  v14);

  v53 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v6 count]));
  v15 = v6;
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v6 count]));
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  id obj = v15;
  id v17 = [obj countByEnumeratingWithState:&v61 objects:v65 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v62;
    do
    {
      for (i = 0LL; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v62 != v19) {
          objc_enumerationMutation(obj);
        }
        v21 = *(void **)(*((void *)&v61 + 1) + 8LL * (void)i);
        v22 = (void *)objc_claimAutoreleasedReturnValue([v21 zone]);
        v23 = (void *)objc_claimAutoreleasedReturnValue([v22 zoneID]);
        id v24 = -[SHLCloudSubscriptionTransformer newSubscriptionForZoneID:](v57, "newSubscriptionForZoneID:", v23);

        v25 = -[SHLCloudBackedSubscription initWithSubscription:]( objc_alloc(&OBJC_CLASS___SHLCloudBackedSubscription),  "initWithSubscription:",  v24);
        v26 = (void *)objc_claimAutoreleasedReturnValue([v21 zone]);
        v27 = (void *)objc_claimAutoreleasedReturnValue([v26 zoneID]);
        v28 = (void *)objc_claimAutoreleasedReturnValue([v27 zoneName]);
        -[SHLCloudLibraryCache storeSubscription:forZoneIdentifier:error:]( v55,  "storeSubscription:forZoneIdentifier:error:",  v25,  v28,  0LL);

        v29 = (void *)objc_claimAutoreleasedReturnValue([v21 zone]);
        v30 = (void *)objc_claimAutoreleasedReturnValue([v29 zoneID]);
        v31 = (void *)objc_claimAutoreleasedReturnValue([v24 subscriptionID]);
        [v53 setObject:v30 forKey:v31];

        v32 = (void *)objc_claimAutoreleasedReturnValue([v24 subscriptionID]);
        [v16 setObject:v24 forKey:v32];
      }

      id v18 = [obj countByEnumeratingWithState:&v61 objects:v65 count:16];
    }

    while (v18);
  }

  v33 = (void *)objc_claimAutoreleasedReturnValue([v51 container]);
  v34 = (void *)objc_claimAutoreleasedReturnValue([v33 privateCloudDatabase]);
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudSubscriptionTransformer modifySubscriptionsOperation](v57, "modifySubscriptionsOperation"));
  [v35 setDatabase:v34];

  v36 = (void *)objc_claimAutoreleasedReturnValue([v16 allValues]);
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudSubscriptionTransformer modifySubscriptionsOperation](v57, "modifySubscriptionsOperation"));
  [v37 setSubscriptionsToSave:v36];

  v58[0] = _NSConcreteStackBlock;
  v58[1] = 3221225472LL;
  v58[2] = sub_10002CBB8;
  v58[3] = &unk_10006D988;
  id v59 = v53;
  v60 = v55;
  v56 = v55;
  id v54 = v53;
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudSubscriptionTransformer modifySubscriptionsOperation](v57, "modifySubscriptionsOperation"));
  [v38 setModifySubscriptionsCompletionBlock:v58];

  v39 = objc_alloc_init(&OBJC_CLASS___CKOperationGroup);
  -[CKOperationGroup setExpectedSendSize:](v39, "setExpectedSendSize:", 1LL);
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudSubscriptionTransformer modifySubscriptionsOperation](v57, "modifySubscriptionsOperation"));
  v41 = (void *)objc_claimAutoreleasedReturnValue([v40 subscriptionsToSave]);
  v42 = (char *)[v41 count];
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudSubscriptionTransformer modifySubscriptionsOperation](v57, "modifySubscriptionsOperation"));
  v44 = (void *)objc_claimAutoreleasedReturnValue([v43 subscriptionIDsToDelete]);
  -[CKOperationGroup setQuantity:](v39, "setQuantity:", &v42[(void)[v44 count]]);

  v45 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@",  @"ModifySubscriptions"));
  -[CKOperationGroup setName:](v39, "setName:", v45);

  v46 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudSubscriptionTransformer modifySubscriptionsOperation](v57, "modifySubscriptionsOperation"));
  [v46 setGroup:v39];

  v47 = objc_alloc(&OBJC_CLASS___SHLCloudBackedOperation);
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudSubscriptionTransformer modifySubscriptionsOperation](v57, "modifySubscriptionsOperation"));
  v49 = -[SHLCloudBackedOperation initWithOperation:](v47, "initWithOperation:", v48);

  return v49;
}

- (id)newSubscriptionForZoneID:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc(&OBJC_CLASS___CKRecordZoneSubscription);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 zoneName]);
  id v6 = -[CKRecordZoneSubscription initWithZoneID:subscriptionID:](v4, "initWithZoneID:subscriptionID:", v3, v5);

  id v7 = objc_alloc_init(&OBJC_CLASS___CKNotificationInfo);
  -[CKNotificationInfo setShouldSendContentAvailable:](v7, "setShouldSendContentAvailable:", 1LL);
  -[CKRecordZoneSubscription setNotificationInfo:](v6, "setNotificationInfo:", v7);

  return v6;
}

- (SHLSyncSessionConfiguration)configuration
{
  return self->_configuration;
}

- (CKModifySubscriptionsOperation)modifySubscriptionsOperation
{
  return self->_modifySubscriptionsOperation;
}

- (void)setModifySubscriptionsOperation:(id)a3
{
}

- (void).cxx_destruct
{
}

@end