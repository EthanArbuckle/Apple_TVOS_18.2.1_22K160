@interface BKSystemShellClient
- (NSString)debugDescription;
- (NSString)description;
- (void)appendDescriptionToStream:(id)a3;
@end

@implementation BKSystemShellClient

- (NSString)description
{
  return (NSString *)+[BSDescriptionStream descriptionForRootObject:]( &OBJC_CLASS___BSDescriptionStream,  "descriptionForRootObject:",  self);
}

- (NSString)debugDescription
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BSDescriptionStyle debugStyle](&OBJC_CLASS___BSDescriptionStyle, "debugStyle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionStream descriptionForRootObject:withStyle:]( &OBJC_CLASS___BSDescriptionStream,  "descriptionForRootObject:withStyle:",  self,  v3));

  return (NSString *)v4;
}

- (void)appendDescriptionToStream:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 hasSuccinctStyle];
  char v6 = v5;
  if (v5) {
    v7 = 0LL;
  }
  else {
    v7 = self;
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10004C640;
  v12[3] = &unk_1000B8030;
  id v13 = v4;
  v14 = self;
  id v8 = v13;
  [v13 appendProem:v7 block:v12];
  if ((v6 & 1) == 0)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10004C66C;
    v9[3] = &unk_1000B8030;
    id v10 = v8;
    v11 = self;
    [v10 appendBodySectionWithName:0 block:v9];
  }
}

- (void).cxx_destruct
{
}

@end