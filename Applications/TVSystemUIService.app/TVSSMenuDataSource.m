@interface TVSSMenuDataSource
- (BOOL)isEqual:(id)a3;
- (NSOrderedSet)items;
- (NSString)debugDescription;
- (NSString)description;
- (TVSSMenuDataSource)init;
- (TVSSMenuDataSource)initWithItems:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
@end

@implementation TVSSMenuDataSource

- (TVSSMenuDataSource)init
{
  v6 = self;
  v4 = +[NSOrderedSet orderedSet](&OBJC_CLASS___NSOrderedSet, "orderedSet");
  v6 = 0LL;
  v6 = -[TVSSMenuDataSource initWithItems:](self, "initWithItems:");
  v5 = v6;

  objc_storeStrong((id *)&v6, 0LL);
  return v5;
}

- (TVSSMenuDataSource)initWithItems:(id)a3
{
  v10 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v3 = v10;
  v10 = 0LL;
  v8.receiver = v3;
  v8.super_class = (Class)&OBJC_CLASS___TVSSMenuDataSource;
  v10 = -[TVSSMenuDataSource init](&v8, "init");
  objc_storeStrong((id *)&v10, v10);
  if (v10)
  {
    v4 = (NSOrderedSet *)[location[0] copy];
    items = v10->_items;
    v10->_items = v4;
  }

  v7 = v10;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v10, 0LL);
  return v7;
}

- (id)succinctDescription
{
  id v3 = -[TVSSMenuDataSource succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  id v4 = [v3 build];

  return v4;
}

- (id)succinctDescriptionBuilder
{
  objc_super v8 = self;
  v7[1] = (id)a2;
  v7[0] = +[BSDescriptionBuilder builderWithObject:](&OBJC_CLASS___BSDescriptionBuilder, "builderWithObject:", self);
  id v3 = v7[0];
  v5 = -[TVSSMenuDataSource items](v8, "items");
  id v4 = -[NSOrderedSet array](v5, "array");
  objc_msgSend(v3, "appendArraySection:withName:skipIfEmpty:objectTransformer:");

  id v6 = v7[0];
  objc_storeStrong(v7, 0LL);
  return v6;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v4 =  -[TVSSMenuDataSource descriptionBuilderWithMultilinePrefix:]( v7,  "descriptionBuilderWithMultilinePrefix:",  location[0]);
  id v5 = [v4 build];

  objc_storeStrong(location, 0LL);
  return v5;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v10 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  objc_super v8 = +[BSDescriptionBuilder builderWithObject:](&OBJC_CLASS___BSDescriptionBuilder, "builderWithObject:", v10);
  -[BSDescriptionBuilder setActiveMultilinePrefix:](v8, "setActiveMultilinePrefix:", location[0]);
  id v4 = v8;
  id v6 = -[TVSSMenuDataSource items](v10, "items");
  id v5 = -[NSOrderedSet array](v6, "array");
  -[BSDescriptionBuilder appendArraySection:withName:skipIfEmpty:](v4, "appendArraySection:withName:skipIfEmpty:");

  v7 = v8;
  objc_storeStrong((id *)&v8, 0LL);
  objc_storeStrong(location, 0LL);
  return v7;
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
    v13 =  +[BSEqualsBuilder builderWithObject:ofExpectedClass:]( &OBJC_CLASS___BSEqualsBuilder,  "builderWithObject:ofExpectedClass:",  v14,  objc_opt_class(&OBJC_CLASS___TVSSMenuDataSource));
    id v5 = v13;
    id v6 = -[TVSSMenuDataSource items](v17, "items");
    v7 = _NSConcreteStackBlock;
    int v8 = -1073741824;
    int v9 = 0;
    v10 = sub_1000F279C;
    v11 = &unk_1001B60F8;
    id v12 = v14;
    id v3 = -[BSEqualsBuilder appendObject:counterpart:](v5, "appendObject:counterpart:", v6, &v7);

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
  int v8 = self;
  v7[1] = (id)a2;
  v7[0] = +[BSHashBuilder builder](&OBJC_CLASS___BSHashBuilder, "builder");
  id v4 = v7[0];
  id v5 = -[TVSSMenuDataSource items](v8, "items");
  id v2 = objc_msgSend(v4, "appendObject:");

  id v6 = [v7[0] hash];
  objc_storeStrong(v7, 0LL);
  return (unint64_t)v6;
}

- (NSString)description
{
  return (NSString *)-[TVSSMenuDataSource succinctDescription](self, "succinctDescription", a2, self);
}

- (NSString)debugDescription
{
  return (NSString *)-[TVSSMenuDataSource descriptionWithMultilinePrefix:]( self,  "descriptionWithMultilinePrefix:",  0LL,  a2,  self);
}

- (NSOrderedSet)items
{
  return self->_items;
}

- (void).cxx_destruct
{
}

@end