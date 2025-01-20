@interface ADManagedStorageConnection
- (id)_defaultStoreSpecificKeyForName:(id)a3 key:(id)a4;
- (id)_defaultStoreSpecificKeyPrefixForName:(id)a3;
- (id)_storeWithName:(id)a3;
- (void)fetchManagedStoreObjectForKey:(id)a3 reply:(id)a4;
- (void)getKnowledgeStoreDataForKey:(id)a3 inStoreWithName:(id)a4 completion:(id)a5;
- (void)resetKnowledgeStoreWithName:(id)a3 completion:(id)a4;
- (void)setKnowledgeStoreData:(id)a3 forKey:(id)a4 inStoreWithName:(id)a5 completion:(id)a6;
- (void)setManagedStoreObject:(id)a3 forKey:(id)a4;
@end

@implementation ADManagedStorageConnection

- (void)setManagedStoreObject:(id)a3 forKey:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v7 setManagedStoreObject:v6 forKey:v5];
}

- (void)fetchManagedStoreObjectForKey:(id)a3 reply:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v7 fetchManagedStoreObjectForKey:v6 completion:v5];
}

- (id)_storeWithName:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_storeMap, "objectForKey:", v4));
    if (!v5)
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue( +[CKKnowledgeStore defaultSynchedKnowledgeStore]( &OBJC_CLASS___CKKnowledgeStore,  "defaultSynchedKnowledgeStore"));
      if (v5)
      {
        storeMap = self->_storeMap;
        if (!storeMap)
        {
          id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
          v8 = self->_storeMap;
          self->_storeMap = v7;

          storeMap = self->_storeMap;
        }

        -[NSMutableDictionary setObject:forKey:](storeMap, "setObject:forKey:", v5, v4);
      }
    }
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

- (id)_defaultStoreSpecificKeyPrefixForName:(id)a3
{
  if (a3) {
    v3 = (__CFString *)a3;
  }
  else {
    v3 = @"_NULL_STORE";
  }
  return -[__CFString stringByAppendingString:](v3, "stringByAppendingString:", @" - ");
}

- (id)_defaultStoreSpecificKeyForName:(id)a3 key:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[ADManagedStorageConnection _defaultStoreSpecificKeyPrefixForName:]( self,  "_defaultStoreSpecificKeyPrefixForName:",  a3));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 stringByAppendingString:v6]);

  return v8;
}

- (void)setKnowledgeStoreData:(id)a3 forKey:(id)a4 inStoreWithName:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = sub_10022FB98();
  v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v14);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10022FF44;
  block[3] = &unk_1004FCBB0;
  id v24 = v10;
  id v25 = v13;
  id v21 = v12;
  id v22 = v11;
  v23 = self;
  id v16 = v10;
  id v17 = v11;
  id v18 = v12;
  id v19 = v13;
  dispatch_async(v15, block);
}

- (void)getKnowledgeStoreDataForKey:(id)a3 inStoreWithName:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sub_10022FB98();
  id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v11);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10022FE20;
  v16[3] = &unk_1004FDA30;
  id v17 = v8;
  id v18 = self;
  id v19 = v9;
  id v20 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  dispatch_async(v12, v16);
}

- (void)resetKnowledgeStoreWithName:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_10022FB98();
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10022FBD8;
  block[3] = &unk_1004FD9E0;
  id v14 = self;
  id v15 = v7;
  id v13 = v6;
  id v10 = v6;
  id v11 = v7;
  dispatch_async(v9, block);
}

- (void).cxx_destruct
{
}

@end