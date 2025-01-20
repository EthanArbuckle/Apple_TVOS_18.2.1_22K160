@interface CXProviderConfiguration
- (NSArray)emergencyTUHandles;
- (NSArray)emergencyTULabeledHandles;
- (NSOrderedSet)prioritizedTUSenderIdentities;
- (NSSet)supportedTUHandleTypes;
@end

@implementation CXProviderConfiguration

- (NSSet)supportedTUHandleTypes
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CXProviderConfiguration supportedHandleTypes](self, "supportedHandleTypes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithCapacity:]( NSMutableSet,  "setWithCapacity:",  [v3 count]));

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CXProviderConfiguration supportedHandleTypes](self, "supportedHandleTypes", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [*(id *)(*((void *)&v16 + 1) + 8 * (void)i) integerValue];
        if (v10 == (id)2) {
          uint64_t v11 = 2LL;
        }
        else {
          uint64_t v11 = 1LL;
        }
        if (v10 == (id)3) {
          uint64_t v12 = 3LL;
        }
        else {
          uint64_t v12 = v11;
        }
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v12));
        [v4 addObject:v13];
      }

      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v7);
  }

  id v14 = [v4 copy];
  return (NSSet *)v14;
}

- (NSArray)emergencyTUHandles
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CXProviderConfiguration emergencyHandles](self, "emergencyHandles"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v3 count]));

  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CXProviderConfiguration emergencyHandles](self, "emergencyHandles"));
  id v6 = [v5 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v19;
    *(void *)&__int128 v7 = 138412290LL;
    __int128 v17 = v7;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "tuHandle", v17));
        if (v12)
        {
          [v4 addObject:v12];
        }

        else
        {
          id v13 = sub_1001704C4();
          id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v17;
            v23 = v11;
            _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "[WARN] Invalid TUHandle generated from CXLabelHandle %@",  buf,  0xCu);
          }
        }
      }

      id v8 = [v5 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }

    while (v8);
  }

  id v15 = [v4 copy];
  return (NSArray *)v15;
}

- (NSArray)emergencyTULabeledHandles
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CXProviderConfiguration emergencyLabeledHandles](self, "emergencyLabeledHandles"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v3 count]));

  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CXProviderConfiguration emergencyLabeledHandles](self, "emergencyLabeledHandles"));
  id v6 = [v5 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v19;
    *(void *)&__int128 v7 = 138412290LL;
    __int128 v17 = v7;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "tuLabeledHandle", v17));
        if (v12)
        {
          [v4 addObject:v12];
        }

        else
        {
          id v13 = sub_1001704C4();
          id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v17;
            v23 = v11;
            _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "[WARN] Invalid TULabeledHandle generated from CXLabelHandle %@",  buf,  0xCu);
          }
        }
      }

      id v8 = [v5 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }

    while (v8);
  }

  id v15 = [v4 copy];
  return (NSArray *)v15;
}

- (NSOrderedSet)prioritizedTUSenderIdentities
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CXProviderConfiguration prioritizedSenderIdentities](self, "prioritizedSenderIdentities"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableOrderedSet orderedSetWithCapacity:]( NSMutableOrderedSet,  "orderedSetWithCapacity:",  [v3 count]));

  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CXProviderConfiguration prioritizedSenderIdentities](self, "prioritizedSenderIdentities"));
  id v6 = [v5 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v19;
    *(void *)&__int128 v7 = 138412290LL;
    __int128 v17 = v7;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "tuSenderIdentity", v17));
        if (v12)
        {
          [v4 addObject:v12];
        }

        else
        {
          id v13 = sub_1001704C4();
          id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v17;
            v23 = v11;
            _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "[WARN] Invalid TUSenderIdentity generated from CXSenderIdentity %@",  buf,  0xCu);
          }
        }
      }

      id v8 = [v5 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }

    while (v8);
  }

  id v15 = [v4 copy];
  return (NSOrderedSet *)v15;
}

@end