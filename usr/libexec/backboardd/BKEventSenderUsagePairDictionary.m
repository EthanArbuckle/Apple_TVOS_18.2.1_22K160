@interface BKEventSenderUsagePairDictionary
- (id)description;
@end

@implementation BKEventSenderUsagePairDictionary

- (id)description
{
  v2 = self;
  if (self)
  {
    BSDescriptionBuilder *v3 = [BSDescriptionBuilder builderWithObject:self];
    usagePairsPerSenderID = v2->_usagePairsPerSenderID;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1000090F0;
    v7[3] = &unk_1000B5728;
    id v5 = v3;
    id v8 = v5;
    [usagePairsPerSenderID enumerateKeysAndObjectsUsingBlock:v7];

    v2 = [v5 build];
  }

  return v2;
}

- (void).cxx_destruct
{
}

@end