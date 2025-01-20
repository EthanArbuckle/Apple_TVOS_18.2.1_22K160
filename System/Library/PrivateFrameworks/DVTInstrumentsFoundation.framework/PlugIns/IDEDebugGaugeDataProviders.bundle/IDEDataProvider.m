@interface IDEDataProvider
+ (id)sharedDataProvider;
- (id)captureAttributes:(id)a3 forPIDs:(id)a4;
- (id)initialQueryTimeForPidDictionary;
- (id)startSamplingForPIDs:(id)a3;
- (id)stopSamplingForPIDs:(id)a3;
- (id)supportedAttributes;
@end

@implementation IDEDataProvider

+ (id)sharedDataProvider
{
  return 0LL;
}

- (id)supportedAttributes
{
  return +[NSSet set](&OBJC_CLASS___NSSet, "set");
}

- (id)startSamplingForPIDs:(id)a3
{
  return a3;
}

- (id)captureAttributes:(id)a3 forPIDs:(id)a4
{
  return &__NSDictionary0__struct;
}

- (id)stopSamplingForPIDs:(id)a3
{
  return a3;
}

- (id)initialQueryTimeForPidDictionary
{
  initialQueryTimeForPidDictionary = self->_initialQueryTimeForPidDictionary;
  if (!initialQueryTimeForPidDictionary)
  {
    v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    v5 = self->_initialQueryTimeForPidDictionary;
    self->_initialQueryTimeForPidDictionary = v4;

    initialQueryTimeForPidDictionary = self->_initialQueryTimeForPidDictionary;
  }

  return initialQueryTimeForPidDictionary;
}

- (void).cxx_destruct
{
}

@end