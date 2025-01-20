@interface TIMailDataSource
+ (id)searchCriterionForSenderAddresses:(id)a3;
- (BOOL)isValid;
- (BOOL)search:(id)a3 didFindResults:(id)a4;
- (MSSearch)search;
- (NSArray)outgoingMessages;
- (NSCondition)cond;
- (TIMailDataSource)init;
- (TIMailDataSource)strongSelf;
- (id)nextOutgoingMessageBatch;
- (void)dealloc;
- (void)initializeSearchIfNecessary;
- (void)search:(id)a3 didFinishWithError:(id)a4;
- (void)searchAccounts:(id)a3;
- (void)searchMailWithSenderAddresses:(id)a3;
- (void)setOutgoingMessages:(id)a3;
- (void)setSearch:(id)a3;
- (void)setStrongSelf:(id)a3;
- (void)setValid:(BOOL)a3;
@end

@implementation TIMailDataSource

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TIMailDataSource;
  -[TIMailDataSource dealloc](&v3, "dealloc");
}

- (TIMailDataSource)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TIMailDataSource;
  v2 = -[TIMailDataSource init](&v6, "init");
  if (v2)
  {
    objc_super v3 = objc_alloc_init(&OBJC_CLASS___NSCondition);
    cond = v2->_cond;
    v2->_cond = v3;

    v2->_valid = 1;
  }

  return v2;
}

- (void)initializeSearchIfNecessary
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[TIMailDataSource cond](self, "cond"));
  [v3 lock];

  if (-[TIMailDataSource isValid](self, "isValid"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TIMailDataSource search](self, "search"));

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TIMailDataSource cond](self, "cond"));
    [v5 unlock];

    if (!v4)
    {
      uint64_t v9 = MSAccountResultsKeyFromEmailAddresses;
      objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472LL;
      v8[2] = sub_1000070DC;
      v8[3] = &unk_100014970;
      v8[4] = self;
      +[MSAccounts accountValuesForKeys:completionBlock:]( &OBJC_CLASS___MSAccounts,  "accountValuesForKeys:completionBlock:",  v6,  v8);
    }
  }

  else
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[TIMailDataSource cond](self, "cond"));
    [v7 unlock];
  }

- (void)searchAccounts:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    uint64_t v10 = MSAccountResultsKeyFromEmailAddresses;
    do
    {
      v11 = 0LL;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v12 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v13 + 1) + 8 * (void)v11),  "objectForKey:",  v10,  (void)v13));
        if ([v12 count]) {
          -[NSMutableArray addObjectsFromArray:](v5, "addObjectsFromArray:", v12);
        }

        v11 = (char *)v11 + 1;
      }

      while (v8 != v11);
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v8);
  }

  -[TIMailDataSource searchMailWithSenderAddresses:](self, "searchMailWithSenderAddresses:", v5);
}

+ (id)searchCriterionForSenderAddresses:(id)a3
{
  id v3 = a3;
  id v4 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v3 count]);
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v26;
    uint64_t v9 = MSCriterionTypeSender;
    uint64_t v10 = MSCriterionQualifierContains;
    do
    {
      v11 = 0LL;
      do
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v12 = *(void *)(*((void *)&v25 + 1) + 8LL * (void)v11);
        id v13 = objc_alloc(&OBJC_CLASS___MSCriterion);
        id v14 = objc_msgSend(v13, "initWithType:qualifier:expression:", v9, v10, v12, (void)v25);
        -[NSMutableArray addObject:](v4, "addObject:", v14);

        v11 = (char *)v11 + 1;
      }

      while (v7 != v11);
      id v7 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }

    while (v7);
  }

  id v15 = [[MSCriterion alloc] initWithCriteria:v4 allRequired:0];
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v18 = (void *)objc_claimAutoreleasedReturnValue([v16 dateByAddingUnit:8 value:-9 toDate:v17 options:0]);

  id v19 = objc_alloc(&OBJC_CLASS___MSCriterion);
  id v20 = [v19 initWithType:MSCriterionTypeReceivedDate qualifier:MSCriterionQualifierGreaterThan expression:v18];
  id v21 = objc_alloc(&OBJC_CLASS___MSCriterion);
  v29[0] = v15;
  v29[1] = v20;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v29, 2LL));
  id v23 = [v21 initWithCriteria:v22 allRequired:1];

  return v23;
}

- (void)searchMailWithSenderAddresses:(id)a3
{
  uint64_t v10 = MSResultsKeyOutgoing;
  uint64_t v11 = MSResultsKeyDateSent;
  uint64_t v12 = MSResultsKeyRecipientTo;
  uint64_t v13 = MSResultsKeyRecipientCc;
  uint64_t v14 = _MSResultsKeyPredictiveModelSummary;
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v10, 5LL));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[TIMailDataSource searchCriterionForSenderAddresses:]( &OBJC_CLASS___TIMailDataSource,  "searchCriterionForSenderAddresses:",  v4,  v10,  v11,  v12,  v13,  v14));

  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[MSSearch findMessageData:matchingCriterion:options:delegate:]( &OBJC_CLASS___MSSearch,  "findMessageData:matchingCriterion:options:delegate:",  v5,  v6,  0LL,  self));
  -[TIMailDataSource setStrongSelf:](self, "setStrongSelf:", self);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[TIMailDataSource cond](self, "cond"));
  [v8 lock];

  -[TIMailDataSource setSearch:](self, "setSearch:", v7);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[TIMailDataSource cond](self, "cond"));
  [v9 unlock];
}

- (id)nextOutgoingMessageBatch
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TIMailDataSource cond](self, "cond"));
  [v3 lock];
  while (1)
  {

    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TIMailDataSource outgoingMessages](self, "outgoingMessages"));
    if (v4) {
      break;
    }
    if (!-[TIMailDataSource isValid](self, "isValid")) {
      goto LABEL_6;
    }
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TIMailDataSource cond](self, "cond"));
    [v3 wait];
  }

LABEL_6:
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TIMailDataSource outgoingMessages](self, "outgoingMessages"));
  id v6 = [v5 copy];

  -[TIMailDataSource setOutgoingMessages:](self, "setOutgoingMessages:", 0LL);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TIMailDataSource cond](self, "cond"));
  [v7 unlock];

  return v6;
}

- (BOOL)search:(id)a3 didFindResults:(id)a4
{
  id v4 = a4;
  id v5 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v4 count]);
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v26;
    uint64_t v10 = MSResultsKeyOutgoing;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)i);
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:v10]);
        unsigned int v14 = [v13 BOOLValue];

        if (v14)
        {
          id v15 = objc_alloc_init(&OBJC_CLASS___TIMailOutgoingMessage);
          -[TIMailOutgoingMessage setSearchResult:](v15, "setSearchResult:", v12);
          -[NSMutableArray addObject:](v5, "addObject:", v15);
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }

    while (v8);
  }

  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[TIMailDataSource cond](self, "cond"));
  [v16 lock];

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[TIMailDataSource outgoingMessages](self, "outgoingMessages"));
  uint64_t v18 = objc_claimAutoreleasedReturnValue([v17 arrayByAddingObjectsFromArray:v5]);
  id v19 = (void *)v18;
  if (v18) {
    uint64_t v20 = v18;
  }
  else {
    uint64_t v20 = (uint64_t)v5;
  }
  -[TIMailDataSource setOutgoingMessages:](self, "setOutgoingMessages:", v20);

  id v21 = (void *)objc_claimAutoreleasedReturnValue(-[TIMailDataSource cond](self, "cond"));
  [v21 broadcast];

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[TIMailDataSource cond](self, "cond"));
  [v22 unlock];

  return 1;
}

- (void)search:(id)a3 didFinishWithError:(id)a4
{
  id v13 = a3;
  if (a4)
  {
    id v6 = a4;
    id v7 = (objc_class *)objc_opt_class(self);
    id v8 = NSStringFromClass(v7);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    NSLog(@"%@: Mail search failed with error: %@", v9, v6);
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[TIMailDataSource cond](self, "cond"));
  [v10 lock];

  -[TIMailDataSource setValid:](self, "setValid:", 0LL);
  [v13 cancel];
  [v13 setDelegate:0];
  -[TIMailDataSource setStrongSelf:](self, "setStrongSelf:", 0LL);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[TIMailDataSource cond](self, "cond"));
  [v11 broadcast];

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[TIMailDataSource cond](self, "cond"));
  [v12 unlock];
}

- (MSSearch)search
{
  return self->_search;
}

- (void)setSearch:(id)a3
{
}

- (TIMailDataSource)strongSelf
{
  return self->_strongSelf;
}

- (void)setStrongSelf:(id)a3
{
}

- (NSCondition)cond
{
  return self->_cond;
}

- (BOOL)isValid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (NSArray)outgoingMessages
{
  return self->_outgoingMessages;
}

- (void)setOutgoingMessages:(id)a3
{
}

- (void).cxx_destruct
{
}

@end