@interface HIDAnalyticsHistogramEvent
- (HIDAnalyticsHistogramEvent)initWithAttributes:(id)a3 description:(id)a4;
- (id)value;
- (void)addHistogramFieldWithSegments:(id)a3 segments:(_HIDAnalyticsHistogramSegmentConfig *)a4 count:(int64_t)a5;
- (void)setIntegerValue:(unint64_t)a3;
- (void)setValue:(id)a3;
@end

@implementation HIDAnalyticsHistogramEvent

- (HIDAnalyticsHistogramEvent)initWithAttributes:(id)a3 description:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___HIDAnalyticsHistogramEvent;
  v4 = -[HIDAnalyticsEvent initWithAttributes:description:](&v8, sel_initWithAttributes_description_, a3, a4);
  v5 = v4;
  if (v4) {
    v6 = v4;
  }

  return v5;
}

- (void)setIntegerValue:(unint64_t)a3
{
  self->_isUpdated = 1;
}

- (void)addHistogramFieldWithSegments:(id)a3 segments:(_HIDAnalyticsHistogramSegmentConfig *)a4 count:(int64_t)a5
{
  id v8 = a3;
  v9 = -[HIDAnalyticsHistogramEventField initWithAttributes:segments:count:]( objc_alloc(&OBJC_CLASS___HIDAnalyticsHistogramEventField),  "initWithAttributes:segments:count:",  v8,  a4,  a5);

  field = self->_field;
  self->_field = v9;
}

- (id)value
{
  if (self->_isUpdated)
  {
    id v3 = objc_alloc_init(MEMORY[0x189603FA8]);
    id v4 = objc_alloc_init(MEMORY[0x189603FC8]);
    v5 = -[HIDAnalyticsHistogramEventField fieldName](self->_field, "fieldName");
    [v4 setObject:v5 forKeyedSubscript:@"Name"];

    [v4 setObject:&unk_18A290828 forKeyedSubscript:@"Type"];
    v6 = -[HIDAnalyticsHistogramEventField value](self->_field, "value");
    [v4 setObject:v6 forKeyedSubscript:@"Value"];

    [v3 addObject:v4];
    self->_isUpdated = 0;
    if ([v3 count]) {
      v7 = v3;
    }
    else {
      v7 = 0LL;
    }
    id v8 = v7;
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

- (void)setValue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end