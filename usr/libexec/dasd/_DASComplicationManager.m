@interface _DASComplicationManager
+ (id)sharedInstance;
- (BOOL)isActiveComplication:(id)a3;
- (BOOL)isAnyActiveComplication:(id)a3;
- (BOOL)isRecentlyAddedComplication:(id)a3;
- (_DASComplicationManager)init;
@end

@implementation _DASComplicationManager

- (_DASComplicationManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____DASComplicationManager;
  return -[_DASComplicationManager init](&v3, "init");
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10004F4F0;
  block[3] = &unk_100114FE0;
  block[4] = a1;
  if (qword_100157A30 != -1) {
    dispatch_once(&qword_100157A30, block);
  }
  return (id)qword_100157A38;
}

- (BOOL)isActiveComplication:(id)a3
{
  return 0;
}

- (BOOL)isAnyActiveComplication:(id)a3
{
  return 0;
}

- (BOOL)isRecentlyAddedComplication:(id)a3
{
  return 0;
}

@end