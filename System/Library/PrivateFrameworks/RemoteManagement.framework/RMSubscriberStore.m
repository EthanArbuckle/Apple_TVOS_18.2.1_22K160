@interface RMSubscriberStore
+ (id)storeFromManagementSource:(id)a3;
@end

@implementation RMSubscriberStore

+ (id)storeFromManagementSource:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (int)[v3 enrollmentType];
  int64_t v17 = +[RMStoreHelper storeScope](&OBJC_CLASS___RMStoreHelper, "storeScope");
  id v16 = objc_alloc(&OBJC_CLASS___RMSubscriberStore);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 name]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v3 storeDescription]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v3 bootstrapURI]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v3 accountIdentifier]);
  unsigned __int8 v9 = +[RMStoreHelper isInteractiveStoreType:](&OBJC_CLASS___RMStoreHelper, "isInteractiveStoreType:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v3 personaIdentifier]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v3 personaIdentifier]);

  BYTE1(v14) = v10 != 0LL;
  LOBYTE(v14) = v9;
  id v12 = objc_msgSend( v16,  "initWithIdentifier:type:scope:name:description:enrollmentURL:accountIdentifier:defaultToInteractive:dataSepara ted:personaIdentifier:",  v15,  v4,  v17,  v5,  v6,  v7,  v8,  v14,  v11);

  return v12;
}

@end