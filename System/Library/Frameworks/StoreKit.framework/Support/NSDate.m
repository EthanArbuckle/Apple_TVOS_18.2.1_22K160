@interface NSDate
- (BOOL)lib_dateHasPassed;
- (BOOL)lib_isBefore:(id)a3;
- (double)lib_timeElapsedUntilNow;
- (id)lib_loggableDate;
- (id)lib_loggableShortDate;
- (id)lib_simpleWeekDate;
- (unint64_t)lib_dispatchTime;
@end

@implementation NSDate

- (unint64_t)lib_dispatchTime
{
  return dispatch_time(0LL, 1000000000 * (uint64_t)v2);
}

- (BOOL)lib_dateHasPassed
{
  return v2 < 0.0;
}

- (BOOL)lib_isBefore:(id)a3
{
  return v3 < 0.0;
}

- (id)lib_loggableDate
{
  if (qword_10032E420 != -1) {
    dispatch_once(&qword_10032E420, &stru_1002E8AD0);
  }
  return _[(id)qword_10032E418 stringFromDate:self];
}

- (id)lib_loggableShortDate
{
  if (qword_10032E430 != -1) {
    dispatch_once(&qword_10032E430, &stru_1002E8AF0);
  }
  return _[(id)qword_10032E428 stringFromDate:self];
}

- (id)lib_simpleWeekDate
{
  if (qword_10032E440 != -1) {
    dispatch_once(&qword_10032E440, &stru_1002E8B10);
  }
  return _[(id)qword_10032E438 stringFromDate:self];
}

- (double)lib_timeElapsedUntilNow
{
  return -v2;
}

@end