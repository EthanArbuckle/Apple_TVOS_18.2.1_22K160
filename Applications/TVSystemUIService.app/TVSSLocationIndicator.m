@interface TVSSLocationIndicator
- (BOOL)isEqual:(id)a3;
- (NSString)debugDescription;
- (NSString)description;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)initLocationIndicatorWithDisplayLocation:(int64_t)a3;
- (id)stateDumpBuilder;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)displayLocation;
- (unint64_t)hash;
@end

@implementation TVSSLocationIndicator

- (id)initLocationIndicatorWithDisplayLocation:(int64_t)a3
{
  SEL v7 = a2;
  int64_t v6 = a3;
  v8 = 0LL;
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVSSLocationIndicator;
  v8 = -[TVSSLocationIndicator init](&v5, "init");
  objc_storeStrong((id *)&v8, v8);
  if (v8) {
    v8->_displayLocation = v6;
  }
  v4 = v8;
  objc_storeStrong((id *)&v8, 0LL);
  return v4;
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
    v13 =  +[BSEqualsBuilder builderWithObject:ofExpectedClass:]( &OBJC_CLASS___BSEqualsBuilder,  "builderWithObject:ofExpectedClass:",  v14,  objc_opt_class(&OBJC_CLASS___TVSSLocationIndicator));
    int64_t v6 = v13;
    int64_t displayLocation = v17->_displayLocation;
    SEL v7 = _NSConcreteStackBlock;
    int v8 = -1073741824;
    int v9 = 0;
    v10 = sub_100038FE8;
    v11 = &unk_1001B7550;
    id v12 = v14;
    id v3 = -[BSEqualsBuilder appendInteger:counterpart:](v6, "appendInteger:counterpart:", displayLocation, &v7);
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
  int64_t v6 = self;
  v5[1] = (id)a2;
  v5[0] = +[BSHashBuilder builder](&OBJC_CLASS___BSHashBuilder, "builder");
  id v2 = [v5[0] appendInteger:v6->_displayLocation];
  id v4 = [v5[0] hash];
  objc_storeStrong(v5, 0LL);
  return (unint64_t)v4;
}

- (NSString)description
{
  return (NSString *)-[TVSSLocationIndicator succinctDescription](self, "succinctDescription", a2, self);
}

- (NSString)debugDescription
{
  return (NSString *)-[TVSSLocationIndicator descriptionWithMultilinePrefix:]( self,  "descriptionWithMultilinePrefix:",  0LL,  a2,  self);
}

- (id)succinctDescription
{
  id v3 = -[TVSSLocationIndicator succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  id v4 = [v3 build];

  return v4;
}

- (id)succinctDescriptionBuilder
{
  int64_t v6 = self;
  v5[1] = (id)a2;
  v5[0] = +[BSDescriptionBuilder builderWithObject:](&OBJC_CLASS___BSDescriptionBuilder, "builderWithObject:", self);
  id v2 =  objc_msgSend( v5[0],  "appendInteger:withName:",  -[TVSSLocationIndicator displayLocation](v6, "displayLocation"),  @"displayLocation");
  id v4 = v5[0];
  objc_storeStrong(v5, 0LL);
  return v4;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  SEL v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v4 =  -[TVSSLocationIndicator descriptionBuilderWithMultilinePrefix:]( v7,  "descriptionBuilderWithMultilinePrefix:",  location[0]);
  id v5 = [v4 build];

  objc_storeStrong(location, 0LL);
  return v5;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  SEL v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v5 = -[TVSSLocationIndicator succinctDescriptionBuilder](v7, "succinctDescriptionBuilder");
  [v5 setActiveMultilinePrefix:location[0]];
  id v4 = v5;
  objc_storeStrong(&v5, 0LL);
  objc_storeStrong(location, 0LL);
  return v4;
}

- (id)stateDumpBuilder
{
  int v8 = self;
  v7[1] = (id)a2;
  v7[0] = objc_alloc_init(&OBJC_CLASS___TVSStateDumpBuilder);
  id v4 = v7[0];
  id v5 = TVSSPrivacyIndicatorDisplayLocationDescription(-[TVSSLocationIndicator displayLocation](v8, "displayLocation"));
  id v2 = objc_msgSend(v4, "appendString:withKey:");

  id v6 = v7[0];
  objc_storeStrong(v7, 0LL);
  return v6;
}

- (int64_t)displayLocation
{
  return self->_displayLocation;
}

@end