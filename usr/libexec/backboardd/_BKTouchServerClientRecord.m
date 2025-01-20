@interface _BKTouchServerClientRecord
- (_BKTouchServerClientRecord)init;
@end

@implementation _BKTouchServerClientRecord

- (_BKTouchServerClientRecord)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS____BKTouchServerClientRecord;
  v2 = -[_BKTouchServerClientRecord init](&v8, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    sceneHostSettings = v2->_sceneHostSettings;
    v2->_sceneHostSettings = v3;

    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    hitTestContextCategoryToContextIDs = v2->_hitTestContextCategoryToContextIDs;
    v2->_hitTestContextCategoryToContextIDs = v5;
  }

  return v2;
}

- (void).cxx_destruct
{
}

@end