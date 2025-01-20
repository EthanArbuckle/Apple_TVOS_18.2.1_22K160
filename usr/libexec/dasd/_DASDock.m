@interface _DASDock
+ (id)dockManager;
- (_DASDock)init;
@end

@implementation _DASDock

+ (id)dockManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100071048;
  block[3] = &unk_100114FE0;
  block[4] = a1;
  if (qword_100157C00 != -1) {
    dispatch_once(&qword_100157C00, block);
  }
  return (id)qword_100157C08;
}

- (_DASDock)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____DASDock;
  return -[_DASDock init](&v3, "init");
}

@end