@interface Optional
+ (id)optionalWithNone;
+ (id)optionalWithSome:(id)a3;
- (BOOL)hasValue;
- (id)value;
- (id)valueOr:(id)value;
@end

@implementation Optional

+ (id)optionalWithNone
{
  if (qword_10032E7E8 != -1) {
    dispatch_once(&qword_10032E7E8, &stru_1002E9200);
  }
  return (id)qword_10032E7F0;
}

+ (id)optionalWithSome:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new(&OBJC_CLASS___Optional);
  v4->_hasValue = 1;
  id value = v4->_value;
  v4->_id value = v3;

  return v4;
}

- (id)valueOr:(id)value
{
  if (self->_hasValue) {
    id value = self->_value;
  }
  return value;
}

- (BOOL)hasValue
{
  return self->_hasValue;
}

- (id)value
{
  return objc_getProperty(self, a2, 16LL, 1);
}

- (void).cxx_destruct
{
}

@end