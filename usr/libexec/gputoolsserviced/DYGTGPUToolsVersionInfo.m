@interface DYGTGPUToolsVersionInfo
+ (BOOL)supportsSecureCoding;
- (DYGTGPUToolsVersionInfo)initWithCoder:(id)a3;
- (NSDictionary)infoPlist;
- (NSDictionary)versionPlist;
- (id)copyWithZone:(_NSZone *)a3;
- (unsigned)interposeVersionGL;
- (unsigned)interposeVersionMetal;
- (void)encodeWithCoder:(id)a3;
- (void)setInfoPlist:(id)a3;
- (void)setInterposeVersionGL:(unsigned int)a3;
- (void)setInterposeVersionMetal:(unsigned int)a3;
- (void)setVersionPlist:(id)a3;
@end

@implementation DYGTGPUToolsVersionInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  id v6 = -[NSDictionary copyWithZone:](self->_infoPlist, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = -[NSDictionary copyWithZone:](self->_versionPlist, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  *((_DWORD *)v5 + 2) = self->_interposeVersionGL;
  *((_DWORD *)v5 + 3) = self->_interposeVersionMetal;
  return v5;
}

- (DYGTGPUToolsVersionInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___DYGTGPUToolsVersionInfo;
  v5 = -[DYGTGPUToolsVersionInfo init](&v15, "init");
  if (v5)
  {
    v16[0] = objc_opt_class(&OBJC_CLASS___NSString);
    v16[1] = objc_opt_class(&OBJC_CLASS___NSDictionary);
    v16[2] = objc_opt_class(&OBJC_CLASS___NSMutableArray);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v16, 3LL));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v6));
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v7 forKey:@"infoPlist"]);
    infoPlist = v5->_infoPlist;
    v5->_infoPlist = (NSDictionary *)v8;

    uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSString);
    id v11 = [v4 decodeDictionaryWithKeysOfClass:v10 objectsOfClass:objc_opt_class(NSString) forKey:@"versionPlist"];
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    versionPlist = v5->_versionPlist;
    v5->_versionPlist = (NSDictionary *)v12;

    v5->_interposeVersionGL = [v4 decodeInt32ForKey:@"interposeVersion"];
    v5->_interposeVersionMetal = [v4 decodeInt32ForKey:@"interposeVersionMetal"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  infoPlist = self->_infoPlist;
  id v5 = a3;
  [v5 encodeObject:infoPlist forKey:@"infoPlist"];
  [v5 encodeObject:self->_versionPlist forKey:@"versionPlist"];
  [v5 encodeInt32:self->_interposeVersionGL forKey:@"interposeVersion"];
  [v5 encodeInt32:self->_interposeVersionMetal forKey:@"interposeVersionMetal"];
}

- (NSDictionary)infoPlist
{
  return self->_infoPlist;
}

- (void)setInfoPlist:(id)a3
{
}

- (NSDictionary)versionPlist
{
  return self->_versionPlist;
}

- (void)setVersionPlist:(id)a3
{
}

- (unsigned)interposeVersionGL
{
  return self->_interposeVersionGL;
}

- (void)setInterposeVersionGL:(unsigned int)a3
{
  self->_interposeVersionGL = a3;
}

- (unsigned)interposeVersionMetal
{
  return self->_interposeVersionMetal;
}

- (void)setInterposeVersionMetal:(unsigned int)a3
{
  self->_interposeVersionMetal = a3;
}

- (void).cxx_destruct
{
}

@end