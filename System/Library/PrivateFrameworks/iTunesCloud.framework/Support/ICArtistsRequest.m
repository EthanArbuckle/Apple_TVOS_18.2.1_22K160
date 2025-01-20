@interface ICArtistsRequest
- (ICArtistsRequest)initWithDatabaseID:(unsigned int)a3 paginationToken:(id)a4;
- (double)timeoutInterval;
@end

@implementation ICArtistsRequest

- (ICArtistsRequest)initWithDatabaseID:(unsigned int)a3 paginationToken:(id)a4
{
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"databases/%u/groups?groupType=artists",  a4,  *(void *)&a3));
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___ICArtistsRequest;
  v6 = -[ICDRequest initWithAction:](&v8, "initWithAction:", v5);

  if (v6)
  {
    -[ICDRequest setRequestGroupEntityPayloadForTrackSourceMatch:]( v6,  "setRequestGroupEntityPayloadForTrackSourceMatch:",  1LL);
    -[ICDRequest setMethod:](v6, "setMethod:", 1LL);
    -[ICDRequest setRequestPersonalizationStyle:](v6, "setRequestPersonalizationStyle:", 2LL);
  }

  return v6;
}

- (double)timeoutInterval
{
  return 180.0;
}

@end