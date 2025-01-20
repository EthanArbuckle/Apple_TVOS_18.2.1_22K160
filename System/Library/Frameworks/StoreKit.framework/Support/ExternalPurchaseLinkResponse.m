@interface ExternalPurchaseLinkResponse
+ (BOOL)supportsSecureCoding;
- (ExternalPurchaseLinkResponse)initWithCoder:(id)a3;
- (ExternalPurchaseLinkResponse)initWithSingle:(id)a3 multi:(id)a4;
- (NSArray)multi;
- (NSURL)single;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ExternalPurchaseLinkResponse

- (ExternalPurchaseLinkResponse)initWithSingle:(id)a3 multi:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = -[ExternalPurchaseLinkResponse init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_single, a3);
    objc_storeStrong((id *)&v10->_multi, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ExternalPurchaseLinkResponse single](self, "single"));
  [v4 encodeObject:v5 forKey:@"single"];

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[ExternalPurchaseLinkResponse multi](self, "multi"));
  [v4 encodeObject:v6 forKey:@"multi"];
}

- (ExternalPurchaseLinkResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class(NSURL) forKey:@"single"];
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSArray);
  id v8 = +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", v7, objc_opt_class(&OBJC_CLASS___NSURL), 0LL);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v9 forKey:@"multi"]);

  v11 = -[ExternalPurchaseLinkResponse initWithSingle:multi:](self, "initWithSingle:multi:", v6, v10);
  return v11;
}

- (NSURL)single
{
  return self->_single;
}

- (NSArray)multi
{
  return self->_multi;
}

- (void).cxx_destruct
{
}

@end