@interface MTIDCommon
+ (id)idOptions;
@end

@implementation MTIDCommon

+ (id)idOptions
{
  if (qword_100028508 != -1) {
    dispatch_once(&qword_100028508, &stru_100020B40);
  }
  return (id)qword_100028500;
}

@end