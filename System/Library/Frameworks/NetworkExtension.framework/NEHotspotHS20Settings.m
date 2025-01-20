@interface NEHotspotHS20Settings
+ (BOOL)supportsSecureCoding;
- (BOOL)isRoamingEnabled;
- (NEHotspotHS20Settings)initWithCoder:(id)a3;
- (NEHotspotHS20Settings)initWithDomainName:(NSString *)domainName roamingEnabled:(BOOL)roamingEnabled;
- (NSArray)MCCAndMNCs;
- (NSArray)naiRealmNames;
- (NSArray)roamingConsortiumOIs;
- (NSString)domainName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setMCCAndMNCs:(NSArray *)MCCAndMNCs;
- (void)setNaiRealmNames:(NSArray *)naiRealmNames;
- (void)setRoamingConsortiumOIs:(NSArray *)roamingConsortiumOIs;
- (void)setRoamingEnabled:(BOOL)roamingEnabled;
@end

@implementation NEHotspotHS20Settings

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x189607940]);
  v4 = -[NEHotspotHS20Settings domainName](self, "domainName");
  [v3 appendPrettyObject:v4 withName:@"Hotspot 2.0 Domain Name" andIndent:0 options:0];

  return v3;
}

- (NEHotspotHS20Settings)initWithDomainName:(NSString *)domainName roamingEnabled:(BOOL)roamingEnabled
{
  v6 = domainName;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___NEHotspotHS20Settings;
  v7 = -[NEHotspotHS20Settings init](&v11, sel_init);
  if (v7)
  {
    uint64_t v8 = -[NSString copy](v6, "copy");
    v9 = v7->_domainName;
    v7->_domainName = (NSString *)v8;

    v7->_roamingEnabled = roamingEnabled;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[NEHotspotHS20Settings allocWithZone:](&OBJC_CLASS___NEHotspotHS20Settings, "allocWithZone:", a3);
  v5 = -[NEHotspotHS20Settings domainName](self, "domainName");
  v6 = -[NEHotspotHS20Settings initWithDomainName:roamingEnabled:]( v4,  "initWithDomainName:roamingEnabled:",  v5,  -[NEHotspotHS20Settings isRoamingEnabled](self, "isRoamingEnabled"));

  -[NEHotspotHS20Settings setRoamingConsortiumOIs:](v6, "setRoamingConsortiumOIs:", self->_roamingConsortiumOIs);
  -[NEHotspotHS20Settings setNaiRealmNames:](v6, "setNaiRealmNames:", self->_naiRealmNames);
  -[NEHotspotHS20Settings setMCCAndMNCs:](v6, "setMCCAndMNCs:", self->_MCCAndMNCs);
  return v6;
}

- (NEHotspotHS20Settings)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = -[NEHotspotHS20Settings init](self, "init");
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DomainName"];
    domainName = v5->_domainName;
    v5->_domainName = (NSString *)v6;

    v5->_roamingEnabled = [v4 decodeBoolForKey:@"IsRoamingEnabled"];
    uint64_t v8 = (void *)MEMORY[0x189604010];
    uint64_t v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"RoamingConsortiumOIs"];
    roamingConsortiumOIs = v5->_roamingConsortiumOIs;
    v5->_roamingConsortiumOIs = (NSArray *)v11;

    v13 = (void *)MEMORY[0x189604010];
    uint64_t v14 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"NAIRealmNames"];
    naiRealmNames = v5->_naiRealmNames;
    v5->_naiRealmNames = (NSArray *)v16;

    v18 = (void *)MEMORY[0x189604010];
    uint64_t v19 = objc_opt_class();
    objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v21 = [v4 decodeObjectOfClasses:v20 forKey:@"MCCAndMNCs"];
    MCCAndMNCs = v5->_MCCAndMNCs;
    v5->_MCCAndMNCs = (NSArray *)v21;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = -[NEHotspotHS20Settings domainName](self, "domainName");
  [v4 encodeObject:v5 forKey:@"DomainName"];

  objc_msgSend( v4,  "encodeBool:forKey:",  -[NEHotspotHS20Settings isRoamingEnabled](self, "isRoamingEnabled"),  @"IsRoamingEnabled");
  -[NEHotspotHS20Settings roamingConsortiumOIs](self, "roamingConsortiumOIs");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v6 forKey:@"RoamingConsortiumOIs"];
  v7 = -[NEHotspotHS20Settings naiRealmNames](self, "naiRealmNames");
  [v4 encodeObject:v7 forKey:@"NAIRealmNames"];

  -[NEHotspotHS20Settings MCCAndMNCs](self, "MCCAndMNCs");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v8 forKey:@"MCCAndMNCs"];
}

- (NSString)domainName
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (BOOL)isRoamingEnabled
{
  return self->_roamingEnabled;
}

- (void)setRoamingEnabled:(BOOL)roamingEnabled
{
  self->_roamingEnabled = roamingEnabled;
}

- (NSArray)roamingConsortiumOIs
{
  return (NSArray *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setRoamingConsortiumOIs:(NSArray *)roamingConsortiumOIs
{
}

- (NSArray)naiRealmNames
{
  return (NSArray *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setNaiRealmNames:(NSArray *)naiRealmNames
{
}

- (NSArray)MCCAndMNCs
{
  return (NSArray *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setMCCAndMNCs:(NSArray *)MCCAndMNCs
{
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end