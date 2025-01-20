@interface _BKTouchSensitiveButtonEventRecord
- (_BKTouchSensitiveButtonEventRecord)init;
@end

@implementation _BKTouchSensitiveButtonEventRecord

- (_BKTouchSensitiveButtonEventRecord)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS____BKTouchSensitiveButtonEventRecord;
  v2 = -[_BKTouchSensitiveButtonEventRecord init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableIndexSet);
    stagesEntered = v2->_stagesEntered;
    v2->_stagesEntered = v3;
  }

  return v2;
}

- (void).cxx_destruct
{
}

@end