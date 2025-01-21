@interface _BKTouchSensitiveButtonEventRecord
- (_BKTouchSensitiveButtonEventRecord)init;
@end

@implementation _BKTouchSensitiveButtonEventRecord

- (_BKTouchSensitiveButtonEventRecord)init
{
  v6.receiver = self;
  v6.super_class = [BKTouchSensitiveButtonEventRecord class];
  _BKTouchSensitiveButtonEventRecord *v2 = [[_BKTouchSensitiveButtonEventRecord alloc] init];
  if (v2)
  {
    NSMutableIndexSet *v3 = [[NSMutableIndexSet alloc] init];
    stagesEntered = v2->_stagesEntered;
    v2->_stagesEntered = v3;
  }

  return v2;
}

- (void).cxx_destruct
{
}

@end