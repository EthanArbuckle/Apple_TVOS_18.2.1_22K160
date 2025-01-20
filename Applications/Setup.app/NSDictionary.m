@interface NSDictionary
- (id)_buddy_arrayForKey:(id)a3;
- (id)_buddy_dictionaryForKey:(id)a3;
- (id)_buddy_stringForKey:(id)a3;
- (id)tk_jsonRepresentation;
@end

@implementation NSDictionary

- (id)_buddy_dictionaryForKey:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self, "objectForKey:", a3));
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSDictionary, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0) {
    id v6 = v3;
  }
  else {
    id v6 = 0LL;
  }

  return v6;
}

- (id)_buddy_arrayForKey:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self, "objectForKey:", a3));
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSArray, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0) {
    id v6 = v3;
  }
  else {
    id v6 = 0LL;
  }

  return v6;
}

- (id)_buddy_stringForKey:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self, "objectForKey:", a3));
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSString, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0) {
    id v6 = v3;
  }
  else {
    id v6 = 0LL;
  }

  return v6;
}

- (id)tk_jsonRepresentation
{
  id v8 = 0LL;
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  self,  0LL,  &v8));
  id v4 = v8;
  if (v4)
  {
    if (qword_100109970 != -1) {
      dispatch_once(&qword_100109970, &stru_1000CA5E8);
    }
    uint64_t v5 = (os_log_s *)qword_100109968;
    if (os_log_type_enabled((os_log_t)qword_100109968, OS_LOG_TYPE_ERROR))
    {
      sub_1000778EC((uint64_t)self, (uint64_t)v4, v5);
      if (v3) {
        goto LABEL_6;
      }
LABEL_8:
      id v6 = 0LL;
      goto LABEL_9;
    }
  }

  if (!v3) {
    goto LABEL_8;
  }
LABEL_6:
  id v6 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v3, 4LL);
LABEL_9:

  return v6;
}

@end