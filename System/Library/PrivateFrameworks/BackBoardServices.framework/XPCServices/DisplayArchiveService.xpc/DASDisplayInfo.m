@interface DASDisplayInfo
- (NSOrderedSet)attachedContexts;
- (NSString)name;
- (NSString)raw;
- (id)_initWithName:(id)a3 attachedContexts:(id)a4 raw:(id)a5;
- (id)description;
@end

@implementation DASDisplayInfo

- (id)_initWithName:(id)a3 attachedContexts:(id)a4 raw:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___DASDisplayInfo;
  v11 = -[DASDisplayInfo init](&v19, "init");
  if (v11)
  {
    v12 = (NSString *)[v8 copy];
    name = v11->_name;
    v11->_name = v12;

    v14 = (NSOrderedSet *)[v9 copy];
    attachedContexts = v11->_attachedContexts;
    v11->_attachedContexts = v14;

    v16 = (NSString *)[v10 copy];
    raw = v11->_raw;
    v11->_raw = v16;
  }

  return v11;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  [v3 appendString:self->_name withName:@"name"];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSOrderedSet array](self->_attachedContexts, "array"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bs_map:", &stru_1000103C8));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "componentsJoinedByString:", @", "));
  [v3 appendString:v6 withName:@"attachedContexts"];

  v7 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);
  return v7;
}

- (NSString)name
{
  return self->_name;
}

- (NSOrderedSet)attachedContexts
{
  return self->_attachedContexts;
}

- (NSString)raw
{
  return self->_raw;
}

- (void).cxx_destruct
{
}

@end