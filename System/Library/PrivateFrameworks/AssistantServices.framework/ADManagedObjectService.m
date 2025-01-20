@interface ADManagedObjectService
- (ADManagedObjectService)initWithDomainName:(id)a3;
- (id)domains;
@end

@implementation ADManagedObjectService

- (ADManagedObjectService)initWithDomainName:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___ADManagedObjectService;
  v5 = -[ADManagedObjectService init](&v11, "init");
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    domainName = v5->_domainName;
    v5->_domainName = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue([@"com.apple.siri.ManagedObjectService." stringByAppendingString:v4]);
    -[ADService setIdentifier:](v5, "setIdentifier:", v8);

    v9 = -[NSSet initWithObjects:](objc_alloc(&OBJC_CLASS___NSSet), "initWithObjects:", v5->_domainName, 0LL);
    -[ADService setManagedStorageDomains:](v5, "setManagedStorageDomains:", v9);
  }

  return v5;
}

- (id)domains
{
  domainName = self->_domainName;
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &domainName,  1LL));
}

- (void).cxx_destruct
{
}

@end