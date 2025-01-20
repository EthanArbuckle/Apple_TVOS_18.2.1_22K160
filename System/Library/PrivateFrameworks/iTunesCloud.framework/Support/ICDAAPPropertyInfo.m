@interface ICDAAPPropertyInfo
+ (ICDAAPPropertyInfo)sharedContainerPropertyInfo;
+ (ICDAAPPropertyInfo)sharedItemPropertyInfo;
- (BOOL)hasInfoForProperty:(id)a3;
- (NSMutableDictionary)codeMap;
- (NSMutableDictionary)valueTypeMap;
- (id)_init;
- (int64_t)valueTypeForProperty:(id)a3;
- (unsigned)elementCodeForProperty:(id)a3;
- (void)mapProperty:(id)a3 toCode:(unsigned int)a4 valueType:(int64_t)a5;
- (void)setCodeMap:(id)a3;
- (void)setValueTypeMap:(id)a3;
@end

@implementation ICDAAPPropertyInfo

- (BOOL)hasInfoForProperty:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_codeMap, "objectForKeyedSubscript:", a3));
  BOOL v4 = v3 != 0LL;

  return v4;
}

- (unsigned)elementCodeForProperty:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_codeMap, "objectForKeyedSubscript:", a3));
  unsigned int v4 = [v3 unsignedIntValue];

  return v4;
}

- (int64_t)valueTypeForProperty:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_valueTypeMap, "objectForKeyedSubscript:", a3));
  int64_t v4 = [v3 unsignedIntValue];

  return v4;
}

- (id)_init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___ICDAAPPropertyInfo;
  v2 = -[ICDAAPPropertyInfo init](&v8, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    codeMap = v2->_codeMap;
    v2->_codeMap = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    valueTypeMap = v2->_valueTypeMap;
    v2->_valueTypeMap = (NSMutableDictionary *)v5;
  }

  return v2;
}

- (void)mapProperty:(id)a3 toCode:(unsigned int)a4 valueType:(int64_t)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v6));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_codeMap, "setObject:forKeyedSubscript:", v9, v8);

  id v10 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a5));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_valueTypeMap, "setObject:forKeyedSubscript:", v10, v8);
}

- (NSMutableDictionary)codeMap
{
  return self->_codeMap;
}

- (void)setCodeMap:(id)a3
{
}

- (NSMutableDictionary)valueTypeMap
{
  return self->_valueTypeMap;
}

- (void)setValueTypeMap:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (ICDAAPPropertyInfo)sharedItemPropertyInfo
{
  if (qword_1001DB750 != -1) {
    dispatch_once(&qword_1001DB750, &stru_1001A4B28);
  }
  return (ICDAAPPropertyInfo *)(id)qword_1001DB748;
}

+ (ICDAAPPropertyInfo)sharedContainerPropertyInfo
{
  if (qword_1001DB760 != -1) {
    dispatch_once(&qword_1001DB760, &stru_1001A4B48);
  }
  return (ICDAAPPropertyInfo *)(id)qword_1001DB758;
}

@end