@interface TPDictionaryMatchingRule
+ (id)andMatch:(id)a3;
+ (id)falseMatch;
+ (id)fieldExists:(id)a3;
+ (id)fieldMatch:(id)a3 fieldRegex:(id)a4;
+ (id)notMatch:(id)a3;
+ (id)orMatch:(id)a3;
+ (id)trueMatch;
@end

@implementation TPDictionaryMatchingRule

+ (id)fieldExists:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___TPPBDictionaryMatchingRule);
  -[TPPBDictionaryMatchingRule setType:](v4, "setType:", 5LL);
  v5 = objc_alloc_init(&OBJC_CLASS___TPPBDictionaryMatchingRuleFieldExists);
  -[TPPBDictionaryMatchingRule setExists:](v4, "setExists:", v5);
  v6 = -[TPPBDictionaryMatchingRule exists](v4, "exists");
  [v6 setFieldName:v3];

  return v4;
}

+ (id)fieldMatch:(id)a3 fieldRegex:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(&OBJC_CLASS___TPPBDictionaryMatchingRule);
  -[TPPBDictionaryMatchingRule setType:](v7, "setType:", 4LL);
  v8 = objc_alloc_init(&OBJC_CLASS___TPPBDictionaryMatchingRuleFieldRegexMatch);
  -[TPPBDictionaryMatchingRule setMatch:](v7, "setMatch:", v8);
  v9 = -[TPPBDictionaryMatchingRule match](v7, "match");
  [v9 setFieldName:v6];
  v10 = -[TPPBDictionaryMatchingRule match](v7, "match");
  [v10 setRegex:v5];

  return v7;
}

+ (id)notMatch:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___TPPBDictionaryMatchingRule);
  -[TPPBDictionaryMatchingRule setType:](v4, "setType:", 3LL);
  -[TPPBDictionaryMatchingRule setNot:](v4, "setNot:", v3);

  return v4;
}

+ (id)andMatch:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___TPPBDictionaryMatchingRule);
  -[TPPBDictionaryMatchingRule setType:](v4, "setType:", 1LL);
  id v5 = (void *)[v3 mutableCopy];

  -[TPPBDictionaryMatchingRule setAnds:](v4, "setAnds:", v5);
  return v4;
}

+ (id)orMatch:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___TPPBDictionaryMatchingRule);
  -[TPPBDictionaryMatchingRule setType:](v4, "setType:", 2LL);
  id v5 = (void *)[v3 mutableCopy];

  -[TPPBDictionaryMatchingRule setOrs:](v4, "setOrs:", v5);
  return v4;
}

+ (id)trueMatch
{
  v2 = objc_alloc_init(&OBJC_CLASS___TPPBDictionaryMatchingRule);
  -[TPPBDictionaryMatchingRule setType:](v2, "setType:", 6LL);
  return v2;
}

+ (id)falseMatch
{
  v2 = objc_alloc_init(&OBJC_CLASS___TPPBDictionaryMatchingRule);
  -[TPPBDictionaryMatchingRule setType:](v2, "setType:", 7LL);
  return v2;
}

@end