@interface AsyncOperation
- (BOOL)isAsynchronous;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (_TtC7sportsd14AsyncOperation)init;
- (void)start;
@end

@implementation AsyncOperation

- (_TtC7sportsd14AsyncOperation)init
{
  return (_TtC7sportsd14AsyncOperation *)sub_1000424BC();
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (BOOL)isExecuting
{
  v2 = self;
  char v3 = sub_1000425F4();

  return v3 & 1;
}

- (BOOL)isFinished
{
  v2 = self;
  sub_100042688();
  char v4 = v3;

  return v4 & 1;
}

- (void)start
{
  v2 = self;
  sub_100042784();
}

@end