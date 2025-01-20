@interface RMMediaSessionStatus
- (NSString)shortDescription;
- (RMMediaSessionStatus)initWithInternal:(id *)a3;
@end

@implementation RMMediaSessionStatus

- (RMMediaSessionStatus)initWithInternal:(id *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___RMMediaSessionStatus;
  result = -[RMMediaSessionStatus init](&v5, "init");
  if (result) {
    result->_internal.machAbsTimestamp = a3->var0;
  }
  return result;
}

- (NSString)shortDescription
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"State: %.0f",  *(void *)&self->_internal.machAbsTimestamp);
}

@end