@interface CKKSListenerCollection
- (CKKSListenerCollection)initWithName:(id)a3;
- (NSMapTable)listeners;
- (NSString)name;
- (id)description;
- (void)iterateListeners:(id)a3;
- (void)registerListener:(id)a3;
- (void)setListeners:(id)a3;
- (void)setName:(id)a3;
@end

@implementation CKKSListenerCollection

- (CKKSListenerCollection)initWithName:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___CKKSListenerCollection;
  v6 = -[CKKSListenerCollection init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_name, a3);
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToWeakObjectsMapTable](&OBJC_CLASS___NSMapTable, "strongToWeakObjectsMapTable"));
    listeners = v7->_listeners;
    v7->_listeners = (NSMapTable *)v8;
  }

  return v7;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSListenerCollection listeners](self, "listeners"));
  objc_sync_enter(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSListenerCollection name](self, "name"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSListenerCollection listeners](self, "listeners"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectEnumerator]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allObjects]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<CKKSListenerCollection(%@): %@>",  v4,  v7));

  objc_sync_exit(v3);
  return v8;
}

- (void)registerListener:(id)a3
{
  id v18 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSListenerCollection listeners](self, "listeners"));
  objc_sync_enter(v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSListenerCollection listeners](self, "listeners"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectEnumerator]);

  char v7 = 0;
  for (i = 0LL; ; i = (void *)v9)
  {
    uint64_t v9 = objc_claimAutoreleasedReturnValue([v6 nextObject]);

    if (!v9) {
      break;
    }
    v7 |= v9 == (void)v18;
  }

  if (!((v18 == 0LL) | v7 & 1))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSListenerCollection name](self, "name"));
    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-%@", v10, v18));

    id v12 = v11;
    v13 = (const char *)[v12 UTF8String];
    dispatch_queue_attr_t v14 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v14);
    dispatch_queue_t v16 = dispatch_queue_create(v13, v15);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSListenerCollection listeners](self, "listeners"));
    [v17 setObject:v18 forKey:v16];
  }

  objc_sync_exit(v4);
}

- (void)iterateListeners:(id)a3
{
  id v4 = a3;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[CKKSListenerCollection listeners](self, "listeners"));
  objc_sync_enter(obj);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSListenerCollection listeners](self, "listeners"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 keyEnumerator]);

  for (i = 0LL; ; i = v8)
  {
    uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nextObject", obj));

    if (!v8) {
      break;
    }
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSListenerCollection listeners](self, "listeners"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v8]);

    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v10);
    if (v10)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1000F4994;
      block[3] = &unk_100290F30;
      objc_copyWeak(&v14, &location);
      id v13 = v4;
      dispatch_async(v8, block);

      objc_destroyWeak(&v14);
    }

    objc_destroyWeak(&location);
  }

  objc_sync_exit(obj);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setName:(id)a3
{
}

- (NSMapTable)listeners
{
  return (NSMapTable *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setListeners:(id)a3
{
}

- (void).cxx_destruct
{
}

@end