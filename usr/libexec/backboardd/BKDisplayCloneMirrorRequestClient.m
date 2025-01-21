@interface BKDisplayCloneMirrorRequestClient
- (NSString)description;
- (void)appendDescriptionToFormatter:(id)a3;
@end

@implementation BKDisplayCloneMirrorRequestClient

- (NSString)description
{
  return [BSDescriptionStream descriptionForRootObject:self];
}

- (void)appendDescriptionToFormatter:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10002831C;
  v4[3] = &unk_1000B8030;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  [v3 appendProem:0 block:v4];
}

- (void).cxx_destruct
{
}

@end