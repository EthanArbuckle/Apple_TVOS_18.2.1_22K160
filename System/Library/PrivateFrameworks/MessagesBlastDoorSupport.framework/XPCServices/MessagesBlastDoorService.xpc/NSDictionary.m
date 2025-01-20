@interface NSDictionary
- (id)_arrayForKey:(id)a3;
- (id)_dataForKey:(id)a3;
- (id)_dictionaryForKey:(id)a3;
- (id)_numberForKey:(id)a3;
- (id)_stringForKey:(id)a3;
@end

@implementation NSDictionary

- (id)_dictionaryForKey:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self, "objectForKey:", a3));
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0) {
    id v5 = v3;
  }
  else {
    id v5 = 0LL;
  }

  return v5;
}

- (id)_arrayForKey:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self, "objectForKey:", a3));
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSArray);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0) {
    id v5 = v3;
  }
  else {
    id v5 = 0LL;
  }

  return v5;
}

- (id)_numberForKey:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self, "objectForKey:", a3));
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0) {
    id v5 = v3;
  }
  else {
    id v5 = 0LL;
  }

  return v5;
}

- (id)_stringForKey:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self, "objectForKey:", a3));
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0) {
    id v5 = v3;
  }
  else {
    id v5 = 0LL;
  }

  return v5;
}

- (id)_dataForKey:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self, "objectForKey:", a3));
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSData);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0) {
    id v5 = v3;
  }
  else {
    id v5 = 0LL;
  }

  return v5;
}

@end