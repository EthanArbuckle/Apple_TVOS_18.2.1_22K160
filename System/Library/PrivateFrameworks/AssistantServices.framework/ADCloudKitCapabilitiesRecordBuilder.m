@interface ADCloudKitCapabilitiesRecordBuilder
- (id)build;
- (void)reset;
- (void)setValue:(id)a3 forColumnName:(id)a4;
@end

@implementation ADCloudKitCapabilitiesRecordBuilder

- (void)reset
{
  dictionary = self->_dictionary;
  self->_dictionary = 0LL;
}

- (void)setValue:(id)a3 forColumnName:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  dictionary = self->_dictionary;
  if (!dictionary)
  {
    v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v9 = self->_dictionary;
    self->_dictionary = v8;

    dictionary = self->_dictionary;
  }

  -[NSMutableDictionary setObject:forKey:](dictionary, "setObject:forKey:", v10, v6);
}

- (id)build
{
  return -[NSMutableDictionary copy](self->_dictionary, "copy");
}

- (void).cxx_destruct
{
}

@end