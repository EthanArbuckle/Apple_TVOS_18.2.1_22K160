@interface TimeWindow
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation TimeWindow

- (id)copyWithZone:(_NSZone *)a3
{
  id result = -[TimeWindow init](+[TimeWindow allocWithZone:](&OBJC_CLASS___TimeWindow, "allocWithZone:", a3), "init");
  *((void *)result + 1) = *(void *)&self->_endTime;
  *((void *)result + 2) = *(void *)&self->_startTime;
  return result;
}

@end