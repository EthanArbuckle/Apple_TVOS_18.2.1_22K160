@interface NSObject
+ (id)lib_copyPropertyGetterNames;
- (NSDictionary)tcr_dictionary;
- (id)_tcr_associatedReader;
- (void)_tcr_associateWithReader:(id)a3;
@end

@implementation NSObject

- (NSDictionary)tcr_dictionary
{
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(self, v3) & 1) != 0) {
    v4 = self;
  }
  else {
    v4 = 0LL;
  }
  return (NSDictionary *)v4;
}

+ (id)lib_copyPropertyGetterNames
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  unsigned int outCount = 0;
  v4 = (objc_class *)objc_opt_class(a1);
  v5 = class_copyPropertyList(v4, &outCount);
  if (v5 && outCount)
  {
    for (unint64_t i = 0LL; i < outCount; ++i)
    {
      v7 = property_copyAttributeValue(v5[i], "G");
      if (v7)
      {
        v8 = v7;
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v7));
        [v3 addObject:v9];

        free(v8);
      }

      v10 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", property_getName(v5[i]));
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      [v3 addObject:v11];
    }
  }

  free(v5);
  id v12 = [v3 copy];

  return v12;
}

- (void)_tcr_associateWithReader:(id)a3
{
}

- (id)_tcr_associatedReader
{
  return +[TypeCheckedAbstractReader _associatedReaderForObject:]( &OBJC_CLASS___TypeCheckedAbstractReader,  "_associatedReaderForObject:",  self);
}

@end