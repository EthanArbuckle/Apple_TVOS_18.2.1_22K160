@interface AppInstallPolicy
- (AppInstallPolicy)init;
- (BOOL)isEqual:(id)a3;
@end

@implementation AppInstallPolicy

- (AppInstallPolicy)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v4 = (AppInstallPolicy *)sub_1002E6020(self, v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___AppInstallPolicy, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v7 = (id *)v4;
    v8 = v7;
    if (self)
    {
      if (v7) {
        id v9 = [v7[1] copy];
      }
      else {
        id v9 = 0LL;
      }
      id v10 = -[NSMutableDictionary copy](self->_dictionary, "copy");
      LOBYTE(self) = [v10 isEqualToDictionary:v9];
    }
  }

  else
  {
    LOBYTE(self) = 0;
  }

  return (char)self;
}

- (void).cxx_destruct
{
}

@end