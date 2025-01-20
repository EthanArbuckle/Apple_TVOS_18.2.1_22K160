@interface ESContextualData
- (BOOL)containsEntity;
- (ESContextualData)initWithConfiguration:(id)a3 taskName:(id)a4 applicationName:(id)a5;
- (NSString)applicationName;
- (NSString)taskName;
- (_EARContextualData)contextualData;
- (id)metrics;
@end

@implementation ESContextualData

- (ESContextualData)initWithConfiguration:(id)a3 taskName:(id)a4 applicationName:(id)a5
{
  return 0LL;
}

- (id)metrics
{
  return objc_alloc_init(&OBJC_CLASS___NSDictionary);
}

- (BOOL)containsEntity
{
  return 0;
}

- (_EARContextualData)contextualData
{
  return self->_contextualData;
}

- (NSString)applicationName
{
  return self->_applicationName;
}

- (NSString)taskName
{
  return self->_taskName;
}

- (void).cxx_destruct
{
}

@end