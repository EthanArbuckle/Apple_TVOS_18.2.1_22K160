@interface _BKHIDKeyboardDevicePropertiesContainer
+ (id)protobufSchema;
- (NSArray)props;
- (void)setProps:(id)a3;
@end

@implementation _BKHIDKeyboardDevicePropertiesContainer

+ (id)protobufSchema
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000F5C8;
  block[3] = &unk_1000B7108;
  block[4] = a1;
  if (qword_1000DBF08 != -1) {
    dispatch_once(&qword_1000DBF08, block);
  }
  return (id)qword_1000DBF00;
}

- (NSArray)props
{
  return self->_props;
}

- (void)setProps:(id)a3
{
}

- (void).cxx_destruct
{
}

@end