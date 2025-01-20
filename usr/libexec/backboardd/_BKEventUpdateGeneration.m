@interface _BKEventUpdateGeneration
- (NSString)description;
- (_BKEventUpdateGeneration)init;
- (void)appendDescriptionToStream:(id)a3;
@end

@implementation _BKEventUpdateGeneration

- (_BKEventUpdateGeneration)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS____BKEventUpdateGeneration;
  v2 = -[_BKEventUpdateGeneration init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    clients = v2->_clients;
    v2->_clients = v3;
  }

  return v2;
}

- (NSString)description
{
  return (NSString *)+[BSDescriptionStream descriptionForRootObject:]( &OBJC_CLASS___BSDescriptionStream,  "descriptionForRootObject:",  self);
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