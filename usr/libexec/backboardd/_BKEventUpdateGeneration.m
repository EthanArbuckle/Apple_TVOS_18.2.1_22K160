@interface _BKEventUpdateGeneration
- (NSString)description;
- (_BKEventUpdateGeneration)init;
- (void)appendDescriptionToStream:(id)a3;
@end

@implementation _BKEventUpdateGeneration

- (_BKEventUpdateGeneration)init
{
  v6.receiver = self;
  v6.super_class = [BKEventUpdateGeneration class];
  _BKEventUpdateGeneration *v2 = [[_BKEventUpdateGeneration alloc] init];
  if (v2)
  {
    NSMutableArray *v3 = [[NSMutableArray alloc] init];
    clients = v2->_clients;
    v2->_clients = v3;
  }

  return v2;
}

- (NSString)description
{
  return [BSDescriptionStream descriptionForRootObject:self];
}

- (void)appendDescriptionToStream:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10001CA5C;
  v6[3] = &unk_1000B8030;
  v6[4] = a3;
  v6[5] = self;
  [a3 appendProem:0 block:v6];
  id v5 = [a3 appendObject:self->_clients withName:@"clients"];
}

- (void).cxx_destruct
{
}

@end