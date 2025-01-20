@interface PBPlaybackRateList
- (BOOL)isEqual:(id)a3;
- (NSOrderedSet)values;
- (NSString)description;
- (PBPlaybackRateList)init;
- (PBPlaybackRateList)initWithNumberArray:(id)a3;
- (float)nextPlaybackRateAfter:(float)a3;
- (float)previousPlaybackRateBefore:(float)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)count;
- (unint64_t)hash;
- (void)_enumerateRatesWithOptions:(unint64_t)a3 usingBlock:(id)a4;
@end

@implementation PBPlaybackRateList

- (PBPlaybackRateList)initWithNumberArray:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PBPlaybackRateList;
  v5 = -[PBPlaybackRateList init](&v11, "init");
  if (v5)
  {
    v6 = -[NSMutableOrderedSet initWithCapacity:]( [NSMutableOrderedSet alloc],  "initWithCapacity:",  [v4 count]);
    v7 = v6;
    if (v4)
    {
      -[NSMutableOrderedSet addObjectsFromArray:](v6, "addObjectsFromArray:", v4);
      -[NSMutableOrderedSet sortUsingComparator:](v7, "sortUsingComparator:", &stru_1003D97C0);
    }

    v8 = (NSOrderedSet *)-[NSMutableOrderedSet copy](v7, "copy");
    values = v5->_values;
    v5->_values = v8;
  }

  return v5;
}

- (PBPlaybackRateList)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
  id v4 = -[PBPlaybackRateList initWithNumberArray:](self, "initWithNumberArray:", v3);

  return v4;
}

- (unint64_t)count
{
  return -[NSOrderedSet count](self->_values, "count");
}

- (float)nextPlaybackRateAfter:(float)a3
{
  uint64_t v7 = 0LL;
  v8 = (float *)&v7;
  uint64_t v9 = 0x2020000000LL;
  float v10 = a3;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100157818;
  v5[3] = &unk_1003D97E8;
  float v6 = a3;
  v5[4] = &v7;
  -[PBPlaybackRateList _enumerateRatesWithOptions:usingBlock:](self, "_enumerateRatesWithOptions:usingBlock:", 0LL, v5);
  float v3 = v8[6];
  _Block_object_dispose(&v7, 8);
  return v3;
}

- (float)previousPlaybackRateBefore:(float)a3
{
  uint64_t v7 = 0LL;
  v8 = (float *)&v7;
  uint64_t v9 = 0x2020000000LL;
  float v10 = a3;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1001578EC;
  v5[3] = &unk_1003D97E8;
  float v6 = a3;
  v5[4] = &v7;
  -[PBPlaybackRateList _enumerateRatesWithOptions:usingBlock:](self, "_enumerateRatesWithOptions:usingBlock:", 2LL, v5);
  float v3 = v8[6];
  _Block_object_dispose(&v7, 8);
  return v3;
}

- (void)_enumerateRatesWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  id v6 = a4;
  values = self->_values;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10015799C;
  v9[3] = &unk_1003D9810;
  id v10 = v6;
  id v8 = v6;
  -[NSOrderedSet enumerateObjectsWithOptions:usingBlock:](values, "enumerateObjectsWithOptions:usingBlock:", a3, v9);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return self;
}

- (NSString)description
{
  return (NSString *)(id)objc_claimAutoreleasedReturnValue( -[PBPlaybackRateList descriptionWithMultilinePrefix:]( self,  "descriptionWithMultilinePrefix:",  0LL));
}

- (unint64_t)hash
{
  return (unint64_t)-[NSOrderedSet hash](self->_values, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = +[BSEqualsBuilder builderWithObject:ofExpectedClass:]( &OBJC_CLASS___BSEqualsBuilder,  "builderWithObject:ofExpectedClass:",  v4,  objc_opt_class(&OBJC_CLASS___PBPlaybackRateList));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  values = self->_values;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100157AF4;
  v11[3] = &unk_1003D2130;
  id v12 = v4;
  id v8 = v4;
  id v9 = [v6 appendObject:values counterpart:v11];
  LOBYTE(values) = [v6 isEqual];

  return (char)values;
}

- (id)succinctDescription
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBPlaybackRateList succinctDescriptionBuilder](self, "succinctDescriptionBuilder"));
  float v3 = (void *)objc_claimAutoreleasedReturnValue([v2 build]);

  return v3;
}

- (id)succinctDescriptionBuilder
{
  float v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  id v4 = objc_msgSend(v3, "appendUnsignedInteger:withName:", -[PBPlaybackRateList count](self, "count"), @"count");
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  float v3 = (void *)objc_claimAutoreleasedReturnValue( -[PBPlaybackRateList descriptionBuilderWithMultilinePrefix:]( self,  "descriptionBuilderWithMultilinePrefix:",  a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  [v5 setActiveMultilinePrefix:v4];

  if (-[PBPlaybackRateList count](self, "count"))
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100157CC4;
    v8[3] = &unk_1003D9860;
    v8[4] = self;
    [v5 appendCustomFormatWithName:0 block:v8];
  }

  else
  {
    id v6 =  objc_msgSend( v5,  "appendUnsignedInteger:withName:",  -[PBPlaybackRateList count](self, "count"),  @"count");
  }

  return v5;
}

- (NSOrderedSet)values
{
  return self->_values;
}

- (void).cxx_destruct
{
}

@end