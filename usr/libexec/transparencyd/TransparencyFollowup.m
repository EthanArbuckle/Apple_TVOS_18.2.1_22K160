@interface TransparencyFollowup
+ (BOOL)isFollowupEnabled;
+ (id)instance;
- (BOOL)clearAllFollowups:(id *)a3;
- (BOOL)clearFollowupsByType:(id)a3 type:(unint64_t)a4 error:(id *)a5;
- (BOOL)postFollowup:(id)a3 type:(unint64_t)a4 eventId:(id)a5 errorCode:(int64_t)a6 optInState:(id)a7 infoLink:(id)a8 additionalInfo:(id)a9 error:(id *)a10;
- (TransparencyFollowup)initWithAnalytics:(id)a3;
- (id)getPendingFollowups;
- (id)ktFollowupStatus;
@end

@implementation TransparencyFollowup

+ (BOOL)isFollowupEnabled
{
  return 0;
}

+ (id)instance
{
  return 0LL;
}

- (TransparencyFollowup)initWithAnalytics:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TransparencyFollowup;
  return -[TransparencyFollowup init](&v4, "init", a3);
}

- (BOOL)postFollowup:(id)a3 type:(unint64_t)a4 eventId:(id)a5 errorCode:(int64_t)a6 optInState:(id)a7 infoLink:(id)a8 additionalInfo:(id)a9 error:(id *)a10
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  id v18 = a9;
  if (qword_1002E6430 != -1) {
    dispatch_once(&qword_1002E6430, &stru_100277A38);
  }
  v19 = (os_log_s *)qword_1002E6438;
  if (os_log_type_enabled((os_log_t)qword_1002E6438, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 134218242;
    unint64_t v22 = a4;
    __int16 v23 = 2112;
    id v24 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Received a postFollowup call of type: %lu eventId: %@",  (uint8_t *)&v21,  0x16u);
  }

  return 1;
}

- (BOOL)clearAllFollowups:(id *)a3
{
  return 1;
}

- (BOOL)clearFollowupsByType:(id)a3 type:(unint64_t)a4 error:(id *)a5
{
  return 1;
}

- (id)getPendingFollowups
{
  return &__NSArray0__struct;
}

- (id)ktFollowupStatus
{
  return &__NSDictionary0__struct;
}

@end