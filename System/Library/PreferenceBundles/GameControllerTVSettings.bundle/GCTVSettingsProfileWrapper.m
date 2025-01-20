@interface GCTVSettingsProfileWrapper
- (BOOL)isEqual:(id)a3;
- (GCSProfile)profile;
- (GCTVSettingsProfileWrapper)initWithProfile:(id)a3;
- (unint64_t)hash;
- (void)setProfile:(id)a3;
@end

@implementation GCTVSettingsProfileWrapper

- (GCTVSettingsProfileWrapper)initWithProfile:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___GCTVSettingsProfileWrapper;
  v6 = -[GCTVSettingsProfileWrapper init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_profile, a3);
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (GCTVSettingsProfileWrapper *)a3;
  if (v4 == self)
  {
    unsigned __int8 v9 = 1;
  }

  else
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___GCTVSettingsProfileWrapper);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[GCSProfile uuid](self->_profile, "uuid"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsProfileWrapper profile](v4, "profile"));
      v8 = (void *)objc_claimAutoreleasedReturnValue([v7 uuid]);
      unsigned __int8 v9 = [v6 isEqual:v8];
    }

    else
    {
      unsigned __int8 v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GCSProfile uuid](self->_profile, "uuid"));
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (GCSProfile)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
}

- (void).cxx_destruct
{
}

@end