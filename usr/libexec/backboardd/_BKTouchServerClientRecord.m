@interface _BKTouchServerClientRecord
- (_BKTouchServerClientRecord)init;
@end

@implementation _BKTouchServerClientRecord

- (_BKTouchServerClientRecord)init
{
  v8.receiver = self;
  v8.super_class = [BKTouchServerClientRecord class];
  _BKTouchServerClientRecord *v2 = [[_BKTouchServerClientRecord alloc] init];
  if (v2)
  {
    NSMutableDictionary *v3 = [[NSMutableDictionary alloc] init];
    sceneHostSettings = v2->_sceneHostSettings;
    v2->_sceneHostSettings = v3;

    NSMutableDictionary *v5 = [[NSMutableDictionary alloc] init];
    hitTestContextCategoryToContextIDs = v2->_hitTestContextCategoryToContextIDs;
    v2->_hitTestContextCategoryToContextIDs = v5;
  }

  return v2;
}

- (void).cxx_destruct
{
}

@end