@interface CPLCloudKitSendFeedbackTask
- (CPLCloudKitSendFeedbackTask)initWithController:(id)a3 messages:(id)a4 completionHandler:(id)a5;
- (NSArray)messages;
- (id)completionHandler;
- (void)runOperations;
@end

@implementation CPLCloudKitSendFeedbackTask

- (CPLCloudKitSendFeedbackTask)initWithController:(id)a3 messages:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___CPLCloudKitSendFeedbackTask;
  v10 = -[CPLCloudKitTransportTask initWithController:](&v16, "initWithController:", a3);
  if (v10)
  {
    v11 = (NSArray *)[v8 copy];
    messages = v10->_messages;
    v10->_messages = v11;

    id v13 = [v9 copy];
    id completionHandler = v10->_completionHandler;
    v10->_id completionHandler = v13;

    -[CPLCloudKitTransportTask setBoostable:](v10, "setBoostable:", 0LL);
  }

  return v10;
}

- (void)runOperations
{
  id v23 = 0LL;
  unsigned __int8 v3 = -[CPLCloudKitTransportTask shouldRunOperationsWithError:](self, "shouldRunOperationsWithError:", &v23);
  id v4 = v23;
  if ((v3 & 1) != 0)
  {
    v5 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSArray count](self->_messages, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransportTask mainScopeIdentifier](self, "mainScopeIdentifier"));
    v17 = v6;
    if ([v6 isEqualToString:CPLPrimaryScopeIdentifier])
    {
      id v7 = 0LL;
    }

    else
    {
      id v7 = objc_alloc_init(&OBJC_CLASS___CPLServerFeedbackKeyAndValue);
      objc_msgSend(v7, "setKey:", @"mainZone", v6);
      [v7 setValue:v6];
    }

    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    id v8 = self->_messages;
    id v9 = -[NSArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v19,  v24,  16LL);
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v20;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * (void)i), "serverMessage", v17));
          v14 = v13;
          if (v7)
          {
            id v15 = [v13 copy];

            [v15 addKeysAndValues:v7];
            v14 = v15;
          }

          -[NSMutableArray addObject:](v5, "addObject:", v14);
        }

        id v10 = -[NSArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v19,  v24,  16LL);
      }

      while (v10);
    }

    objc_super v16 = -[CPLCKFeedbackOperation initWithFeedbackMessages:]( objc_alloc(&OBJC_CLASS___CPLCKFeedbackOperation),  "initWithFeedbackMessages:",  v5);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10003A778;
    v18[3] = &unk_10023E430;
    v18[4] = self;
    -[CPLCKFeedbackOperation setFeedbackCompletionBlock:](v16, "setFeedbackCompletionBlock:", v18);
    -[CPLCloudKitTransportTask launchOperation:type:withContext:]( self,  "launchOperation:type:withContext:",  v16,  1LL,  0LL);
  }

  else
  {
    (*((void (**)(void))self->_completionHandler + 2))();
  }
}

- (NSArray)messages
{
  return self->_messages;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void).cxx_destruct
{
}

@end