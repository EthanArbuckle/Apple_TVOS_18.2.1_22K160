@interface KeyValueObserver
- (KeyValueObserver)init;
- (id)observeObject:(id)a3 keyPath:(id)a4 options:(unint64_t)a5 usingBlock:(id)a6;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeObserver:(id)a3;
@end

@implementation KeyValueObserver

- (KeyValueObserver)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___KeyValueObserver;
  v2 = -[KeyValueObserver init](&v4, "init");
  if (v2)
  {
    v2->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.itunesstored.KeyValueObserver", 0LL);
    v2->_observers = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  }

  return v2;
}

- (void)dealloc
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  observers = self->_observers;
  id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( observers,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(observers);
        }
        objc_msgSend( objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * (void)i), "object"),  "removeObserver:forKeyPath:context:",  self,  objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * (void)i), "keyPath"),  *(void *)(*((void *)&v9 + 1) + 8 * (void)i));
      }

      id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( observers,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
    }

    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___KeyValueObserver;
  -[KeyValueObserver dealloc](&v8, "dealloc");
}

- (id)observeObject:(id)a3 keyPath:(id)a4 options:(unint64_t)a5 usingBlock:(id)a6
{
  __int128 v10 = -[KeyValueObserverItem initWithObject:keyPath:block:]( objc_alloc(&OBJC_CLASS___KeyValueObserverItem),  "initWithObject:keyPath:block:",  a3,  a4,  a6);
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000F31D8;
  v13[3] = &unk_10034AE70;
  v13[4] = self;
  v13[5] = v10;
  dispatch_sync(dispatchQueue, v13);
  [a3 addObserver:self forKeyPath:a4 options:a5 context:v10];
  return v10;
}

- (void)removeObserver:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000F323C;
  v4[3] = &unk_10034AE70;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v8 = (void (**)(id, id))objc_msgSend(a6, "block", a3, a4);
  if (v8)
  {
    __int128 v9 = v8;
    __int128 v10 = self;
    v9[2](v9, a5);
  }

@end