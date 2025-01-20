@interface MRFloatingTimeInfo
+ ($C3997F145DA9CFB88D7C332041F986CA)poolInfo;
- (id)description;
@end

@implementation MRFloatingTimeInfo

+ ($C3997F145DA9CFB88D7C332041F986CA)poolInfo
{
  return ($C3997F145DA9CFB88D7C332041F986CA *)&unk_2B0628;
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"TimeInfo: %f %f",  *(void *)&self->startTime,  *(void *)&self->endTime);
}

@end