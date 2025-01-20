@interface SiriTTSDaemonSession
+ (id)afSharedSession;
@end

@implementation SiriTTSDaemonSession

+ (id)afSharedSession
{
  if (qword_100577FB0 != -1) {
    dispatch_once(&qword_100577FB0, &stru_1004F3BD8);
  }
  return (id)qword_100577FA8;
}

@end