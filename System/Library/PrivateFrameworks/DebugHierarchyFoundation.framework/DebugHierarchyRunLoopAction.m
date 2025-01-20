@interface DebugHierarchyRunLoopAction
- (void)performInContext:(id)a3;
@end

@implementation DebugHierarchyRunLoopAction

- (void)performInContext:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v4 runUntilDate:v3];
}

@end