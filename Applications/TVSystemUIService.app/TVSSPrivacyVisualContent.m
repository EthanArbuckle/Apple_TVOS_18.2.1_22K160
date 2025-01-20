@interface TVSSPrivacyVisualContent
- (BOOL)isEqual:(id)a3;
- (Class)preferredVisualizerViewClass;
- (TVSSPrivacyController)privacyController;
- (TVSSPrivacyVisualContent)initWithPrivacyController:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation TVSSPrivacyVisualContent

- (TVSSPrivacyVisualContent)initWithPrivacyController:(id)a3
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v3 = v8;
  v8 = 0LL;
  v6.receiver = v3;
  v6.super_class = (Class)&OBJC_CLASS___TVSSPrivacyVisualContent;
  v8 = -[TVSSPrivacyVisualContent init](&v6, "init");
  objc_storeStrong((id *)&v8, v8);
  if (v8) {
    objc_storeStrong((id *)&v8->_privacyController, location[0]);
  }
  v5 = v8;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v8, 0LL);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v17 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (v17 == location[0])
  {
    char v18 = 1;
    int v15 = 1;
  }

  else
  {
    id v14 = location[0];
    v13 =  +[BSEqualsBuilder builderWithObject:ofExpectedClass:]( &OBJC_CLASS___BSEqualsBuilder,  "builderWithObject:ofExpectedClass:",  v14,  objc_opt_class(&OBJC_CLASS___TVSSPrivacyVisualContent));
    objc_super v6 = v13;
    privacyController = v17->_privacyController;
    v7 = _NSConcreteStackBlock;
    int v8 = -1073741824;
    int v9 = 0;
    v10 = sub_1001293A4;
    v11 = &unk_1001B60F8;
    id v12 = v14;
    id v3 = -[BSEqualsBuilder appendObject:counterpart:](v6, "appendObject:counterpart:", privacyController, &v7);
    char v18 = -[BSEqualsBuilder isEqual](v13, "isEqual") & 1;
    int v15 = 1;
    objc_storeStrong(&v12, 0LL);
    objc_storeStrong((id *)&v13, 0LL);
    objc_storeStrong(&v14, 0LL);
  }

  objc_storeStrong(location, 0LL);
  return v18 & 1;
}

- (unint64_t)hash
{
  objc_super v6 = self;
  v5[1] = (id)a2;
  v5[0] = +[BSHashBuilder builder](&OBJC_CLASS___BSHashBuilder, "builder");
  id v2 = [v5[0] appendObject:v6->_privacyController];
  id v4 = [v5[0] hash];
  objc_storeStrong(v5, 0LL);
  return (unint64_t)v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return self;
}

- (Class)preferredVisualizerViewClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___TVSSPrivacyVisualContentView);
}

- (TVSSPrivacyController)privacyController
{
  return self->_privacyController;
}

- (void).cxx_destruct
{
}

@end