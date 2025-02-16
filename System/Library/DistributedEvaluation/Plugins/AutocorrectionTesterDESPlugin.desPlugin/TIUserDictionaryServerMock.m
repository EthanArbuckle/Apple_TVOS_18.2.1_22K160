@interface TIUserDictionaryServerMock
- (NSArray)pairs;
- (NSUUID)userDictionaryUUID;
- (TIUserDictionaryServerMock)init;
- (id)addObserver:(id)a3;
- (void)getPhraseShortcutPairs:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setPairs:(id)a3;
@end

@implementation TIUserDictionaryServerMock

- (TIUserDictionaryServerMock)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TIUserDictionaryServerMock;
  v2 = -[TIUserDictionaryServerMock init](&v8, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    observers = v2->_observers;
    v2->_observers = v3;

    v5 = objc_alloc_init(&OBJC_CLASS___NSArray);
    pairs = v2->_pairs;
    v2->_pairs = v5;
  }

  return v2;
}

- (NSUUID)userDictionaryUUID
{
  return +[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID");
}

- (id)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [v4 copy];
  v6 = self;
  objc_sync_enter(v6);
  observers = v6->_observers;
  id v8 = objc_retainBlock(v5);
  -[NSMutableArray addObject:](observers, "addObject:", v8);

  (*((void (**)(id, NSArray *))v5 + 2))(v5, v6->_pairs);
  objc_sync_exit(v6);

  id v9 = objc_retainBlock(v5);
  return v9;
}

- (void)removeObserver:(id)a3
{
  id v7 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  observers = v4->_observers;
  id v6 = objc_retainBlock(v7);
  -[NSMutableArray removeObject:](observers, "removeObject:", v6);

  objc_sync_exit(v4);
}

- (void)getPhraseShortcutPairs:(id)a3
{
}

- (NSArray)pairs
{
  return self->_pairs;
}

- (void)setPairs:(id)a3
{
}

- (void).cxx_destruct
{
}

@end