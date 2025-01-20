@interface HIDAnalyticsEvent
- (BOOL)isLogged;
- (HIDAnalyticsEvent)initWithAttributes:(id)a3 description:(id)a4;
- (NSDictionary)desc;
- (NSString)name;
- (id)description;
- (id)value;
- (void)activate;
- (void)addField:(id)a3;
- (void)addHistogramFieldWithSegments:(id)a3 segments:(_HIDAnalyticsHistogramSegmentConfig *)a4 count:(int64_t)a5;
- (void)cancel;
- (void)setDesc:(id)a3;
- (void)setIntegerValue:(unint64_t)a3 forField:(id)a4;
- (void)setIsLogged:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setStringValue:(id)a3 forField:(id)a4;
- (void)setValue:(id)a3;
@end

@implementation HIDAnalyticsEvent

- (HIDAnalyticsEvent)initWithAttributes:(id)a3 description:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___HIDAnalyticsEvent;
  v8 = -[HIDAnalyticsEvent init](&v11, sel_init);
  if (v8)
  {
    if (initWithAttributes_description__once != -1) {
      dispatch_once(&initWithAttributes_description__once, &__block_literal_global);
    }
    -[HIDAnalyticsEvent setName:](v8, "setName:", v6);
    -[HIDAnalyticsEvent setDesc:](v8, "setDesc:", v7);
    v9 = v8;
  }

  return v8;
}

uint64_t __52__HIDAnalyticsEvent_initWithAttributes_description___block_invoke()
{
  v0 = objc_alloc_init(&OBJC_CLASS___HIDAnalyticsReporter);
  v1 = (void *)__hidAnalyticsReporter;
  __hidAnalyticsReporter = (uint64_t)v0;

  return [(id)__hidAnalyticsReporter start];
}

- (void)activate
{
}

- (void)cancel
{
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
  v4 = -[HIDAnalyticsEvent desc](self, "desc");
  [v3 setObject:v4 forKeyedSubscript:@"EventDescription"];
  v5 = -[HIDAnalyticsEvent value](self, "value");
  [v3 setObject:v5 forKeyedSubscript:@"EventValue"];

  [MEMORY[0x1896078D8] dataWithJSONObject:v3 options:0 error:0];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = (void *)[objc_alloc(NSString) initWithData:v6 encoding:4];

  return v7;
}

- (void)addField:(id)a3
{
  id v7 = a3;
  if (!self->_fields)
  {
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    fields = self->_fields;
    self->_fields = v4;
  }

  id v6 = -[HIDAnalyticsEventField initWithName:](objc_alloc(&OBJC_CLASS___HIDAnalyticsEventField), "initWithName:", v7);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_fields, "setObject:forKeyedSubscript:", v6, v7);
}

- (void)setIntegerValue:(unint64_t)a3 forField:(id)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = v6;
  if (v6)
  {
    v9 = v6;
    [v6 setIntegerValue:a3];
    self->_isUpdated = 1;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v7 = v9;
    if ((isKindOfClass & 1) != 0)
    {
      [(id)__hidAnalyticsReporter dispatchAnalyticsForEvent:self];
      id v7 = v9;
    }
  }
}

- (void)setStringValue:(id)a3 forField:(id)a4
{
  id v8 = a3;
  -[NSMutableDictionary objectForKey:](self->_fields, "objectForKey:", a4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = v6;
  if (v6)
  {
    [v6 setStringValue:v8];
    self->_isUpdated = 1;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      [(id)__hidAnalyticsReporter dispatchAnalyticsForEvent:self];
    }
  }
}

- (id)value
{
  if (!self->_isUpdated) {
    return 0LL;
  }
  id v3 = objc_alloc_init(MEMORY[0x189603FA8]);
  fields = self->_fields;
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __26__HIDAnalyticsEvent_value__block_invoke;
  v9[3] = &unk_18A28F6E8;
  id v10 = v3;
  id v5 = v3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](fields, "enumerateKeysAndObjectsUsingBlock:", v9);
  self->_isUpdated = 0;
  self->_isLogged |= [v5 count] == 0;
  if ([v5 count]) {
    id v6 = v5;
  }
  else {
    id v6 = 0LL;
  }
  id v7 = v6;

  return v7;
}

void __26__HIDAnalyticsEvent_value__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a3;
  id v5 = (objc_class *)MEMORY[0x189603FC8];
  id v6 = a2;
  id v7 = objc_alloc_init(v5);
  [v7 setObject:v6 forKeyedSubscript:@"Name"];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v8 = &unk_18A290858;
  }
  else {
    id v8 = &unk_18A290870;
  }
  [v7 setObject:v8 forKeyedSubscript:@"Type"];
  [v10 value];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setObject:v9 forKeyedSubscript:@"Value"];

  [*(id *)(a1 + 32) addObject:v7];
}

- (void)setValue:(id)a3
{
  id v4 = a3;
  fields = self->_fields;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __30__HIDAnalyticsEvent_setValue___block_invoke;
  v7[3] = &unk_18A28F6E8;
  id v8 = v4;
  id v6 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](fields, "enumerateKeysAndObjectsUsingBlock:", v7);
}

uint64_t __30__HIDAnalyticsEvent_setValue___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setValue:*(void *)(a1 + 32)];
}

- (void)addHistogramFieldWithSegments:(id)a3 segments:(_HIDAnalyticsHistogramSegmentConfig *)a4 count:(int64_t)a5
{
  id v11 = a3;
  if (!self->_fields)
  {
    id v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    fields = self->_fields;
    self->_fields = v8;
  }

  id v10 = -[HIDAnalyticsHistogramEventField initWithAttributes:segments:count:]( objc_alloc(&OBJC_CLASS___HIDAnalyticsHistogramEventField),  "initWithAttributes:segments:count:",  v11,  a4,  a5);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_fields, "setObject:forKeyedSubscript:", v10, v11);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setName:(id)a3
{
}

- (NSDictionary)desc
{
  return (NSDictionary *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setDesc:(id)a3
{
}

- (BOOL)isLogged
{
  return self->_isLogged;
}

- (void)setIsLogged:(BOOL)a3
{
  self->_isLogged = a3;
}

- (void).cxx_destruct
{
}

@end