@interface TVSSCyclingVisualContent
- (BOOL)isEqual:(id)a3;
- (Class)preferredVisualizerViewClass;
- (NSOrderedSet)menuItems;
- (NSString)debugDescription;
- (NSString)description;
- (TVSSCyclingVisualContent)initWithMenuItems:(id)a3;
- (TVSSCyclingVisualContent)initWithMenuItems:(id)a3 displayTime:(double)a4;
- (double)displayTime;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
@end

@implementation TVSSCyclingVisualContent

- (TVSSCyclingVisualContent)initWithMenuItems:(id)a3
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v3 = v7;
  v7 = 0LL;
  v7 = -[TVSSCyclingVisualContent initWithMenuItems:displayTime:]( v3,  "initWithMenuItems:displayTime:",  location[0],  5.0);
  v5 = v7;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v7, 0LL);
  return v5;
}

- (TVSSCyclingVisualContent)initWithMenuItems:(id)a3 displayTime:(double)a4
{
  v13 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  double v11 = a4;
  v4 = v13;
  v13 = 0LL;
  v10.receiver = v4;
  v10.super_class = (Class)&OBJC_CLASS___TVSSCyclingVisualContent;
  v13 = -[TVSSCyclingVisualContent init](&v10, "init");
  objc_storeStrong((id *)&v13, v13);
  if (v13)
  {
    v5 = (NSOrderedSet *)[location[0] copy];
    menuItems = v13->_menuItems;
    v13->_menuItems = v5;

    v13->_displayTime = v11;
  }

  v8 = v13;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v13, 0LL);
  return v8;
}

- (Class)preferredVisualizerViewClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___TVSSCyclingVisualContentView);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return self;
}

- (id)succinctDescription
{
  id v3 = -[TVSSCyclingVisualContent succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  id v4 = [v3 build];

  return v4;
}

- (id)succinctDescriptionBuilder
{
  v9 = self;
  v8[1] = (id)a2;
  v8[0] = +[BSDescriptionBuilder builderWithObject:](&OBJC_CLASS___BSDescriptionBuilder, "builderWithObject:", self);
  id v4 = v8[0];
  v6 = -[TVSSCyclingVisualContent menuItems](v9, "menuItems");
  v5 = -[NSOrderedSet array](v6, "array");
  objc_msgSend(v4, "appendArraySection:withName:skipIfEmpty:objectTransformer:");

  id v2 = [v8[0] appendTimeInterval:@"displayTime" withName:1 decomposeUnits:v9->_displayTime];
  id v7 = v8[0];
  objc_storeStrong(v8, 0LL);
  return v7;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v4 =  -[TVSSCyclingVisualContent descriptionBuilderWithMultilinePrefix:]( v7,  "descriptionBuilderWithMultilinePrefix:",  location[0]);
  id v5 = [v4 build];

  objc_storeStrong(location, 0LL);
  return v5;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  double v11 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v9 = +[BSDescriptionBuilder builderWithObject:](&OBJC_CLASS___BSDescriptionBuilder, "builderWithObject:", v11);
  -[BSDescriptionBuilder setActiveMultilinePrefix:](v9, "setActiveMultilinePrefix:", location[0]);
  id v5 = v9;
  id v7 = -[TVSSCyclingVisualContent menuItems](v11, "menuItems");
  v6 = -[NSOrderedSet array](v7, "array");
  -[BSDescriptionBuilder appendArraySection:withName:skipIfEmpty:](v5, "appendArraySection:withName:skipIfEmpty:");

  id v3 =  -[BSDescriptionBuilder appendTimeInterval:withName:decomposeUnits:]( v9,  "appendTimeInterval:withName:decomposeUnits:",  @"displayTime",  1LL,  v11->_displayTime);
  v8 = v9;
  objc_storeStrong((id *)&v9, 0LL);
  objc_storeStrong(location, 0LL);
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v26 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (v26 == location[0])
  {
    char v27 = 1;
    int v24 = 1;
  }

  else
  {
    id v23 = location[0];
    v22 =  +[BSEqualsBuilder builderWithObject:ofExpectedClass:]( &OBJC_CLASS___BSEqualsBuilder,  "builderWithObject:ofExpectedClass:",  v23,  objc_opt_class(&OBJC_CLASS___TVSSCyclingVisualContent));
    id v7 = v22;
    menuItems = v26->_menuItems;
    v16 = _NSConcreteStackBlock;
    int v17 = -1073741824;
    int v18 = 0;
    v19 = sub_100090CB0;
    v20 = &unk_1001B60F8;
    id v21 = v23;
    id v3 = -[BSEqualsBuilder appendObject:counterpart:](v7, "appendObject:counterpart:", menuItems, &v16);
    v9 = v22;
    double displayTime = v26->_displayTime;
    objc_super v10 = _NSConcreteStackBlock;
    int v11 = -1073741824;
    int v12 = 0;
    v13 = sub_100090CE0;
    v14 = &unk_1001B94E8;
    id v15 = v23;
    id v4 = -[BSEqualsBuilder appendCGFloat:counterpart:](v9, "appendCGFloat:counterpart:", &v10, displayTime);
    char v27 = -[BSEqualsBuilder isEqual](v22, "isEqual") & 1;
    int v24 = 1;
    objc_storeStrong(&v15, 0LL);
    objc_storeStrong(&v21, 0LL);
    objc_storeStrong((id *)&v22, 0LL);
    objc_storeStrong(&v23, 0LL);
  }

  objc_storeStrong(location, 0LL);
  return v27 & 1;
}

- (unint64_t)hash
{
  id v7 = self;
  v6[1] = (id)a2;
  v6[0] = +[BSHashBuilder builder](&OBJC_CLASS___BSHashBuilder, "builder");
  id v2 = [v6[0] appendObject:v7->_menuItems];
  id v3 = [v6[0] appendCGFloat:v7->_displayTime];
  id v5 = [v6[0] hash];
  objc_storeStrong(v6, 0LL);
  return (unint64_t)v5;
}

- (NSString)description
{
  return (NSString *)-[TVSSCyclingVisualContent succinctDescription](self, "succinctDescription", a2, self);
}

- (NSString)debugDescription
{
  return (NSString *)-[TVSSCyclingVisualContent descriptionWithMultilinePrefix:]( self,  "descriptionWithMultilinePrefix:",  0LL,  a2,  self);
}

- (NSOrderedSet)menuItems
{
  return self->_menuItems;
}

- (double)displayTime
{
  return self->_displayTime;
}

- (void).cxx_destruct
{
}

@end