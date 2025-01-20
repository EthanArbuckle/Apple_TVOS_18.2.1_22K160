@interface HIDAnalyticsEventField
- (HIDAnalyticsEventField)initWithName:(id)a3;
- (NSString)fieldName;
- (id)value;
- (void)setIntegerValue:(unint64_t)a3;
- (void)setStringValue:(id)a3;
@end

@implementation HIDAnalyticsEventField

- (HIDAnalyticsEventField)initWithName:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___HIDAnalyticsEventField;
  v6 = -[HIDAnalyticsEventField init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_fieldName, a3);
    v8 = v7;
  }

  return v7;
}

- (id)value
{
  stringValue = self->stringValue;
  if (stringValue) {
    return stringValue;
  }
  [MEMORY[0x189607968] numberWithUnsignedLongLong:self->integerValue];
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setIntegerValue:(unint64_t)a3
{
  self->integerValue = a3;
}

- (void)setStringValue:(id)a3
{
}

- (NSString)fieldName
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void).cxx_destruct
{
}

@end