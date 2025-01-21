@interface BTAVRCP_VFSFolder
- (BTAVRCP_VFSFolder)initWithName:(id)a3 uid:(unint64_t)a4;
- (MPMediaQuery)builtQuery;
- (MPMediaQuery)query;
- (NSMutableSet)storedPredicates;
- (NSString)name;
- (id)baseQuery;
- (id)recentlyAddedFolderName;
- (id)replyAttributesForUid:(unint64_t)a3 attributeIDs:(id)a4;
- (id)replyFolderWithType:(unsigned __int8)a3 uid:(id)a4 name:(id)a5;
- (id)replyItemAtIndex:(unint64_t)a3 attributeIDs:(id)a4;
- (id)replyItemWithUid:(id)a3 name:(id)a4 attributes:(id)a5;
- (unint64_t)childrenCount;
- (unint64_t)uid;
- (unsigned)createFolderWithUid:(unint64_t)a3 folder:(id *)a4;
- (unsigned)playItemWithUid:(unint64_t)a3;
- (void)setBuiltQuery:(id)a3;
- (void)storePredicate:(id)a3;
- (void)storePredicates:(id)a3;
@end

@implementation BTAVRCP_VFSFolder

- (BTAVRCP_VFSFolder)initWithName:(id)a3 uid:(unint64_t)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___BTAVRCP_VFSFolder;
  v8 = -[BTAVRCP_VFSFolder init](&v13, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_name, a3);
    v9->_uid = a4;
    v10 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    storedPredicates = v9->_storedPredicates;
    v9->_storedPredicates = v10;
  }

  return v9;
}

- (MPMediaQuery)query
{
  v3 = -[BTAVRCP_VFSFolder builtQuery];

  if (!v3)
  {
    v4 = -[BTAVRCP_VFSFolder baseQuery];
    -[BTAVRCP_VFSFolder setBuiltQuery:](self, "setBuiltQuery:", v4);

    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    v5 = -[BTAVRCP_VFSFolder storedPredicates];
    id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        v9 = 0LL;
        do
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8LL * (void)v9);
          v11 = -[BTAVRCP_VFSFolder builtQuery];
          [v11 addFilterPredicate:v10];

          v9 = (char *)v9 + 1;
        }

        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }

      while (v7);
    }

    v12 = (void *)qword_10001F1C0;
    if (os_log_type_enabled((os_log_t)qword_10001F1C0, OS_LOG_TYPE_DEBUG)) {
      sub_10000FFD0(v12, self);
    }
  }

  return [BTAVRCP_VFSFolder builtQuery];
}

- (void)storePredicates:(id)a3
{
  id v5 = a3;
  id v6 = -[BTAVRCP_VFSFolder builtQuery];

  if (v6)
  {
    id v7 = [NSAssertionHandler currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"BTAVRCP_VFSFolder.m" lineNumber:57 description:@"Trying to store a predicate after the query is already built"];
  }

  id v8 = -[BTAVRCP_VFSFolder storedPredicates];
  [v8 unionSet:v5];
}

- (unint64_t)childrenCount
{
  return 0LL;
}

- (unsigned)createFolderWithUid:(unint64_t)a3 folder:(id *)a4
{
  return 0;
}

- (id)replyItemAtIndex:(unint64_t)a3 attributeIDs:(id)a4
{
  return 0LL;
}

- (id)replyAttributesForUid:(unint64_t)a3 attributeIDs:(id)a4
{
  return 0LL;
}

- (unsigned)playItemWithUid:(unint64_t)a3
{
  return 0;
}

- (id)baseQuery
{
  return 0LL;
}

- (void)storePredicate:(id)a3
{
  id v4 = [NSSet setWithObject:a3];
  -[BTAVRCP_VFSFolder storePredicates:](self, "storePredicates:", v4);
}

- (id)replyFolderWithType:(unsigned __int8)a3 uid:(id)a4 name:(id)a5
{
  uint64_t v6 = a3;
  v14[0] = &__kCFBooleanTrue;
  v13[0] = @"kIsFolder";
  v13[1] = @"kFolderType";
  id v7 = (__CFString *)a5;
  id v8 = a4;
  v9 = [NSNumber numberWithUnsignedChar:v6];
  v14[1] = v9;
  v14[2] = v8;
  v13[2] = @"kUid";
  v13[3] = @"kName";
  if (v7) {
    uint64_t v10 = v7;
  }
  else {
    uint64_t v10 = &stru_1000195C0;
  }
  v14[3] = v10;
  v11 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:4];

  return v11;
}

- (id)replyItemWithUid:(id)a3 name:(id)a4 attributes:(id)a5
{
  id v7 = a5;
  v14[0] = @"kIsFolder";
  v14[1] = @"kUid";
  v14[2] = @"kName";
  v15[0] = &__kCFBooleanFalse;
  id v8 = &stru_1000195C0;
  if (a4) {
    id v8 = (const __CFString *)a4;
  }
  v15[1] = a3;
  v15[2] = v8;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v15,  v14,  3LL));

  if (v7)
  {
    id v12 = [v11 mutableCopy];
    [v12 setValue:v7 forKey:@"kAttributes"];

    v11 = v12;
  }

  return v11;
}

- (id)recentlyAddedFolderName
{
  v2 = [NSBundle mobileBluetoothBundle];
  v3 = [v2 localizedStringForKey:@"RECENTLY_ADDED" value:@"Recently Added" table:0];

  return v3;
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)uid
{
  return self->_uid;
}

- (NSMutableSet)storedPredicates
{
  return self->_storedPredicates;
}

- (MPMediaQuery)builtQuery
{
  return self->_builtQuery;
}

- (void)setBuiltQuery:(id)a3
{
}

- (void).cxx_destruct
{
}

@end