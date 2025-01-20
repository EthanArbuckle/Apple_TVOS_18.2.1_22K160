@interface CSAttendingUsecaseFactory
+ (id)attendingUseCaseByAttendingType:(int64_t)a3;
@end

@implementation CSAttendingUsecaseFactory

+ (id)attendingUseCaseByAttendingType:(int64_t)a3
{
  return objc_alloc_init(&OBJC_CLASS___CSAttendingSpeechDetectionController);
}

@end