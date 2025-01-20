@interface MADAutoSetSchedulerTriggered
+ (BOOL)supportsSecureCoding;
- (MADAutoSetPolicy)schedulerPolicy;
- (MADAutoSetSchedulerTriggered)initWithCoder:(id)a3;
- (NSString)assetSetIdentifier;
- (NSString)clientDomainName;
- (id)copy;
- (id)initForClientDomainName:(id)a3 forAssetSetIdentifier:(id)a4 withSchedulerPolicy:(id)a5;
- (id)summary;
- (void)encodeWithCoder:(id)a3;
- (void)setSchedulerPolicy:(id)a3;
@end

@implementation MADAutoSetSchedulerTriggered

- (id)initForClientDomainName:(id)a3 forAssetSetIdentifier:(id)a4 withSchedulerPolicy:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___MADAutoSetSchedulerTriggered;
  v12 = -[MADAutoSetSchedulerTriggered init](&v15, "init");
  p_isa = (id *)&v12->super.isa;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_clientDomainName, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 3, a5);
  }

  return p_isa;
}

- (MADAutoSetSchedulerTriggered)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___MADAutoSetSchedulerTriggered;
  v5 = -[MADAutoSetSchedulerTriggered init](&v16, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"clientDomainName"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    clientDomainName = v5->_clientDomainName;
    v5->_clientDomainName = (NSString *)v7;

    id v9 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"asetSetIdentifier"];
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    assetSetIdentifier = v5->_assetSetIdentifier;
    v5->_assetSetIdentifier = (NSString *)v10;

    id v12 = [v4 decodeObjectOfClass:objc_opt_class(MANAutoAssetSetPolicy) forKey:@"schedulerPolicy"];
    uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
    schedulerPolicy = v5->_schedulerPolicy;
    v5->_schedulerPolicy = (MADAutoSetPolicy *)v13;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetSchedulerTriggered clientDomainName](self, "clientDomainName"));
  [v4 encodeObject:v5 forKey:@"clientDomainName"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetSchedulerTriggered assetSetIdentifier](self, "assetSetIdentifier"));
  [v4 encodeObject:v6 forKey:@"asetSetIdentifier"];

  id v7 = (id)objc_claimAutoreleasedReturnValue(-[MADAutoSetSchedulerTriggered schedulerPolicy](self, "schedulerPolicy"));
  [v4 encodeObject:v7 forKey:@"schedulerPolicy"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copy
{
  v3 = objc_alloc(&OBJC_CLASS___MADAutoSetSchedulerTriggered);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetSchedulerTriggered clientDomainName](self, "clientDomainName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetSchedulerTriggered assetSetIdentifier](self, "assetSetIdentifier"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetSchedulerTriggered schedulerPolicy](self, "schedulerPolicy"));
  id v7 = [v6 copy];
  id v8 = -[MADAutoSetSchedulerTriggered initForClientDomainName:forAssetSetIdentifier:withSchedulerPolicy:]( v3,  "initForClientDomainName:forAssetSetIdentifier:withSchedulerPolicy:",  v4,  v5,  v7);

  return v8;
}

- (id)summary
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetSchedulerTriggered clientDomainName](self, "clientDomainName"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetSchedulerTriggered assetSetIdentifier](self, "assetSetIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetSchedulerTriggered schedulerPolicy](self, "schedulerPolicy"));
  id v6 = @"Y";
  if (!v5) {
    id v6 = @"N";
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[clientDomain:%@|setIdentifier:%@|schedulerPolicy:%@",  v3,  v4,  v6));

  return v7;
}

- (NSString)clientDomainName
{
  return self->_clientDomainName;
}

- (NSString)assetSetIdentifier
{
  return self->_assetSetIdentifier;
}

- (MADAutoSetPolicy)schedulerPolicy
{
  return self->_schedulerPolicy;
}

- (void)setSchedulerPolicy:(id)a3
{
}

- (void).cxx_destruct
{
}

@end