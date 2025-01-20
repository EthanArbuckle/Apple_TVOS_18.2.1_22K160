@interface _DASChargeRateReader
- (_CDContext)context;
- (_DASChargeRateReader)init;
- (id)currentValue;
- (id)lastModifiedDate;
- (void)setContext:(id)a3;
@end

@implementation _DASChargeRateReader

- (_DASChargeRateReader)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS____DASChargeRateReader;
  v2 = -[_DASChargeRateReader init](&v6, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[_CDClientContext userContext](&OBJC_CLASS____CDClientContext, "userContext"));
    context = v2->_context;
    v2->_context = (_CDContext *)v3;
  }

  return v2;
}

- (id)currentValue
{
  context = self->_context;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForBatteryLevel](&OBJC_CLASS____CDContextQueries, "keyPathForBatteryLevel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_CDContext objectForKeyedSubscript:](context, "objectForKeyedSubscript:", v3));

  return v4;
}

- (id)lastModifiedDate
{
  return 0LL;
}

- (_CDContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
}

@end