@interface SATVExpressTapToSetupStepConfiguration
- (NSArray)expressTapToSetupItemProviderClasses;
- (NSString)description;
- (SATVExpressTapToSetupStepConfiguration)initWithItemProviderClasses:(id)a3;
@end

@implementation SATVExpressTapToSetupStepConfiguration

- (SATVExpressTapToSetupStepConfiguration)initWithItemProviderClasses:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SATVExpressTapToSetupStepConfiguration;
  v5 = -[SATVExpressTapToSetupStepConfiguration init](&v9, "init");
  if (v5)
  {
    v6 = (NSArray *)[v4 copy];
    expressTapToSetupItemProviderClasses = v5->_expressTapToSetupItemProviderClasses;
    v5->_expressTapToSetupItemProviderClasses = v6;
  }

  return v5;
}

- (NSString)description
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  expressTapToSetupItemProviderClasses = self->_expressTapToSetupItemProviderClasses;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10007406C;
  v10[3] = &unk_1000CADD0;
  v10[4] = self;
  v10[5] = a2;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray bs_map:](expressTapToSetupItemProviderClasses, "bs_map:", v10));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 componentsJoinedByString:@","]);
  [v4 appendString:v7 withName:@"expressTapToSetupItemProviderClasses"];
  v8 = (void *)objc_claimAutoreleasedReturnValue([v4 build]);

  return (NSString *)v8;
}

- (NSArray)expressTapToSetupItemProviderClasses
{
  return self->_expressTapToSetupItemProviderClasses;
}

- (void).cxx_destruct
{
}

@end