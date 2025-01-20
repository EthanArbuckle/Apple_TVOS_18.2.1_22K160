@interface TCCDAccessObject
- (TCCDAccessIndirectObject)indirectObject;
- (TCCDAccessObject)initWithService:(id)a3 indirectObject:(id)a4;
- (TCCDService)serviceObject;
- (id)description;
- (void)setIndirectObject:(id)a3;
- (void)setServiceObject:(id)a3;
@end

@implementation TCCDAccessObject

- (TCCDAccessObject)initWithService:(id)a3 indirectObject:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TCCDAccessObject;
  v8 = -[TCCDAccessObject init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    -[TCCDAccessObject setServiceObject:](v8, "setServiceObject:", v6);
    -[TCCDAccessObject setIndirectObject:](v9, "setIndirectObject:", v7);
  }

  return v9;
}

- (id)description
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDAccessObject serviceObject](self, "serviceObject"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"S:%@", v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDAccessObject indirectObject](self, "indirectObject"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[TCCDAccessIndirectObject unusedIndirectObject]( &OBJC_CLASS___TCCDAccessIndirectObject,  "unusedIndirectObject"));

  if (v6 != v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDAccessObject indirectObject](self, "indirectObject"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 description]);
    -[NSMutableString appendFormat:](v3, "appendFormat:", @", IO:%@", v9);
  }

  id v10 = -[NSMutableString copy](v3, "copy");

  return v10;
}

- (TCCDService)serviceObject
{
  return (TCCDService *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setServiceObject:(id)a3
{
}

- (TCCDAccessIndirectObject)indirectObject
{
  return (TCCDAccessIndirectObject *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setIndirectObject:(id)a3
{
}

- (void).cxx_destruct
{
}

@end