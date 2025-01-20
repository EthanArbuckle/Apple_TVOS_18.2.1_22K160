@interface ThreadSafeDictionary
- (ThreadSafeDictionary)init;
@end

@implementation ThreadSafeDictionary

- (ThreadSafeDictionary)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___ThreadSafeDictionary;
  v2 = -[ThreadSafeDictionary init](&v8, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    dictionary = v2->_dictionary;
    v2->_dictionary = v3;

    v5 = objc_alloc_init(&OBJC_CLASS___UnfairLock);
    lock = v2->_lock;
    v2->_lock = v5;
  }

  return v2;
}

- (void).cxx_destruct
{
}

@end