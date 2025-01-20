@interface BKEventSenderUsagePairDictionary
- (id)description;
@end

@implementation BKEventSenderUsagePairDictionary

- (id)description
{
  v2 = self;
  if (self)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
    usagePairsPerSenderID = v2->_usagePairsPerSenderID;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1000090F0;
    v7[3] = &unk_1000B5728;
    id v5 = v3;
    id v8 = v5;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( usagePairsPerSenderID,  "enumerateKeysAndObjectsUsingBlock:",  v7);

    v2 = (BKEventSenderUsagePairDictionary *)objc_claimAutoreleasedReturnValue([v5 build]);
  }

  return v2;
}

- (void).cxx_destruct
{
}

@end