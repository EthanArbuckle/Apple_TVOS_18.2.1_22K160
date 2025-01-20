@interface TaskQueue
- (TaskQueue)init;
@end

@implementation TaskQueue

- (TaskQueue)init
{
  return (TaskQueue *)sub_10020F238((id *)&self->super.isa, @"com.apple.appstored.TaskQueue");
}

- (void).cxx_destruct
{
}

@end