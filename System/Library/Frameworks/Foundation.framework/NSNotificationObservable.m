@interface NSNotificationObservable
+ (id)observableWithName:(id)a3 object:(id)a4;
- (NSNotificationObservable)initWithName:(id)a3 object:(id)a4;
@end

@implementation NSNotificationObservable

+ (id)observableWithName:(id)a3 object:(id)a4
{
  return (id)[objc_alloc((Class)a1) initWithName:a3 object:a4];
}

- (NSNotificationObservable)initWithName:(id)a3 object:(id)a4
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NSNotificationObservable;
  v6 = -[NSNotificationObservable init](&v8, sel_init);
  if (v6) {
    -[NSNotificationCenter addObserver:selector:name:object:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "addObserver:selector:name:object:",  v6,  sel_receiveObservedValue_,  a3,  a4);
  }
  return v6;
}

@end