@interface ADUnavailableAlarmStore
- (id)_createUnavailableError;
- (void)addAlarm:(id)a3 completionHandler:(id)a4;
- (void)deleteAlarmsWithIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)dismissAlarmsWithURLs:(id)a3 completionHandler:(id)a4;
- (void)fetchAlarmsMatchingAnyOfQueries:(id)a3 completionHandler:(id)a4;
- (void)fetchAlarmsMeetingCriteria:(id)a3 searchOptions:(int64_t)a4 completionHandler:(id)a5;
- (void)fetchAlarmsWithIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)updateAlarms:(id)a3 completionHandler:(id)a4;
@end

@implementation ADUnavailableAlarmStore

- (id)_createUnavailableError
{
  return +[NSError _ad_alarmStoreErrorWithCode:](&OBJC_CLASS___NSError, "_ad_alarmStoreErrorWithCode:", 100LL);
}

- (void)addAlarm:(id)a3 completionHandler:(id)a4
{
  if (a4)
  {
    id v6 = a4;
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[ADUnavailableAlarmStore _createUnavailableError](self, "_createUnavailableError"));
    (*((void (**)(id, void, id))a4 + 2))(v6, 0LL, v7);
  }

- (void)deleteAlarmsWithIdentifiers:(id)a3 completionHandler:(id)a4
{
  if (a4)
  {
    id v6 = a4;
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[ADUnavailableAlarmStore _createUnavailableError](self, "_createUnavailableError"));
    (*((void (**)(id, id))a4 + 2))(v6, v7);
  }

- (void)updateAlarms:(id)a3 completionHandler:(id)a4
{
  if (a4)
  {
    id v6 = a4;
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[ADUnavailableAlarmStore _createUnavailableError](self, "_createUnavailableError"));
    (*((void (**)(id, void, id))a4 + 2))(v6, 0LL, v7);
  }

- (void)fetchAlarmsMatchingAnyOfQueries:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[ADUnavailableAlarmStore _createUnavailableError](self, "_createUnavailableError"));
  (*((void (**)(id, void, id))a4 + 2))(v6, 0LL, v7);
}

- (void)fetchAlarmsMeetingCriteria:(id)a3 searchOptions:(int64_t)a4 completionHandler:(id)a5
{
  id v7 = a5;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[ADUnavailableAlarmStore _createUnavailableError](self, "_createUnavailableError"));
  (*((void (**)(id, void, id))a5 + 2))(v7, 0LL, v8);
}

- (void)fetchAlarmsWithIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[ADUnavailableAlarmStore _createUnavailableError](self, "_createUnavailableError"));
  (*((void (**)(id, void, id))a4 + 2))(v6, 0LL, v7);
}

- (void)dismissAlarmsWithURLs:(id)a3 completionHandler:(id)a4
{
  if (a4)
  {
    id v6 = a4;
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[ADUnavailableAlarmStore _createUnavailableError](self, "_createUnavailableError"));
    (*((void (**)(id, id))a4 + 2))(v6, v7);
  }

@end