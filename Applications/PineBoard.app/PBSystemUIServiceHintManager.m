@interface PBSystemUIServiceHintManager
+ (id)_userInfoDictKeyForUserID:(id)a3;
- (BOOL)shouldDisplayHintForUserID:(id)a3;
- (PBSystemUIServiceHintManager)init;
- (PBSystemUIServiceHintManager)initWithDefaults:(id)a3;
- (id)_hintInfoDictForUserID:(id)a3;
- (id)_userInfoObjectOfClass:(Class)a3 forKey:(id)a4 userID:(id)a5;
- (unint64_t)_userInfoIntegerForKey:(id)a3 userID:(id)a4;
- (void)_setUserInfoInteger:(unint64_t)a3 forKey:(id)a4 userID:(id)a5;
- (void)_setUserInfoObject:(id)a3 forKey:(id)a4 userID:(id)a5;
- (void)didAccessControlCenterForUserID:(id)a3;
- (void)didShowHintForUserID:(id)a3;
- (void)setHeadBoardActive:(BOOL)a3 forUserID:(id)a4;
@end

@implementation PBSystemUIServiceHintManager

- (PBSystemUIServiceHintManager)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  v4 = -[PBSystemUIServiceHintManager initWithDefaults:](self, "initWithDefaults:", v3);

  return v4;
}

- (PBSystemUIServiceHintManager)initWithDefaults:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___PBSystemUIServiceHintManager;
  v6 = -[PBSystemUIServiceHintManager init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_defaults, a3);
  }

  return v7;
}

- (BOOL)shouldDisplayHintForUserID:(id)a3
{
  if (!-[NSString isEqualToString:](self->_activeHeadBoardUserID, "isEqualToString:", a3)
    || (uint64_t)-[PBSDefaultsTestingProtocol integerForKey:]( self->_defaults,  "integerForKey:",  @"PBSystemUIServiceAccessCount") > 2)
  {
    return 0;
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[PBSDefaultsTestingProtocol objectForKey:]( self->_defaults,  "objectForKey:",  @"PBSystemUIServiceHintLastDisplayDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue( -[PBSDefaultsTestingProtocol objectForKey:]( self->_defaults,  "objectForKey:",  @"PBSystemUIServiceHintDateOfFirstHeadBoardLanding"));
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSDate);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0
    && (v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now")),
        [v8 timeIntervalSinceDate:v5],
        double v10 = v9,
        v8,
        v10 < 172800.0))
  {
    BOOL v4 = 0;
  }

  else
  {
    uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSDate);
    if ((objc_opt_isKindOfClass(v6, v11) & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
      [v12 timeIntervalSinceDate:v6];
      BOOL v4 = v13 <= 1209600.0;
    }

    else
    {
      BOOL v4 = 1;
    }
  }

  return v4;
}

- (void)setHeadBoardActive:(BOOL)a3 forUserID:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  if (v4)
  {
    v8 = (NSString *)[v6 copy];
    activeHeadBoardUserID = self->_activeHeadBoardUserID;
    self->_activeHeadBoardUserID = v8;

    double v10 = (NSString *)objc_claimAutoreleasedReturnValue( -[PBSDefaultsTestingProtocol objectForKey:]( self->_defaults,  "objectForKey:",  @"PBSystemUIServiceHintDateOfFirstHeadBoardLanding"));
    uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSDate);
    if ((objc_opt_isKindOfClass(v10, v11) & 1) == 0)
    {
      defaults = self->_defaults;
      double v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
      -[PBSDefaultsTestingProtocol setObject:forKey:]( defaults,  "setObject:forKey:",  v13,  @"PBSystemUIServiceHintDateOfFirstHeadBoardLanding");
    }

    id v14 = -[PBSystemUIServiceHintManager _userInfoObjectOfClass:forKey:userID:]( self,  "_userInfoObjectOfClass:forKey:userID:",  objc_opt_class(&OBJC_CLASS___NSDate),  @"PBSystemUIServiceHintDateOfFirstHeadBoardLanding",  v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

    if (!v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
      -[PBSystemUIServiceHintManager _setUserInfoObject:forKey:userID:]( self,  "_setUserInfoObject:forKey:userID:",  v16,  @"PBSystemUIServiceHintDateOfFirstHeadBoardLanding",  v7);
    }

    goto LABEL_8;
  }

  if ([v6 isEqualToString:self->_activeHeadBoardUserID])
  {
    double v10 = self->_activeHeadBoardUserID;
    self->_activeHeadBoardUserID = 0LL;
LABEL_8:
  }
}

- (void)didShowHintForUserID:(id)a3
{
  id v4 = a3;
  -[PBSystemUIServiceHintManager _setUserInfoInteger:forKey:userID:]( self,  "_setUserInfoInteger:forKey:userID:",  (char *)-[PBSystemUIServiceHintManager _userInfoIntegerForKey:userID:]( self,  "_userInfoIntegerForKey:userID:",  @"PBSystemUIServiceHintDisplayCount",  v4)
  + 1,
    @"PBSystemUIServiceHintDisplayCount",
    v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  -[PBSystemUIServiceHintManager _setUserInfoObject:forKey:userID:]( self,  "_setUserInfoObject:forKey:userID:",  v5,  @"PBSystemUIServiceHintLastDisplayDate",  v4);

  defaults = self->_defaults;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  -[PBSDefaultsTestingProtocol setObject:forKey:]( defaults,  "setObject:forKey:",  v7,  @"PBSystemUIServiceHintLastDisplayDate");
}

- (void)didAccessControlCenterForUserID:(id)a3
{
  id v4 = a3;
  -[PBSystemUIServiceHintManager _setUserInfoInteger:forKey:userID:]( self,  "_setUserInfoInteger:forKey:userID:",  (char *)-[PBSystemUIServiceHintManager _userInfoIntegerForKey:userID:]( self,  "_userInfoIntegerForKey:userID:",  @"PBSystemUIServiceAccessCount",  v4)
  + 1,
    @"PBSystemUIServiceAccessCount",
    v4);

  -[PBSDefaultsTestingProtocol setInteger:forKey:]( self->_defaults,  "setInteger:forKey:",  (char *)-[PBSDefaultsTestingProtocol integerForKey:]( self->_defaults,  "integerForKey:",  @"PBSystemUIServiceAccessCount")
  + 1,
    @"PBSystemUIServiceAccessCount");
}

- (id)_hintInfoDictForUserID:(id)a3
{
  defaults = self->_defaults;
  id v5 = a3;
  id v6 = [(id)objc_opt_class(self) _userInfoDictKeyForUserID:v5];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBSDefaultsTestingProtocol dictionaryForKey:](defaults, "dictionaryForKey:", v7));
  double v9 = v8;
  if (v8) {
    id v10 = v8;
  }
  else {
    id v10 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](&OBJC_CLASS___NSDictionary, "dictionary"));
  }
  uint64_t v11 = v10;

  return v11;
}

- (unint64_t)_userInfoIntegerForKey:(id)a3 userID:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemUIServiceHintManager _hintInfoDictForUserID:](self, "_hintInfoDictForUserID:", a4));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v6]);

  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0) {
    id v10 = [v8 unsignedIntegerValue];
  }
  else {
    id v10 = 0LL;
  }

  return (unint64_t)v10;
}

- (void)_setUserInfoInteger:(unint64_t)a3 forKey:(id)a4 userID:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemUIServiceHintManager _hintInfoDictForUserID:](self, "_hintInfoDictForUserID:", v8));
  id v11 = [v10 mutableCopy];

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  [v11 setObject:v12 forKeyedSubscript:v9];

  defaults = self->_defaults;
  id v14 = [(id)objc_opt_class(self) _userInfoDictKeyForUserID:v8];
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  -[PBSDefaultsTestingProtocol setObject:forKey:](defaults, "setObject:forKey:", v11, v15);
}

- (id)_userInfoObjectOfClass:(Class)a3 forKey:(id)a4 userID:(id)a5
{
  id v8 = a4;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemUIServiceHintManager _hintInfoDictForUserID:](self, "_hintInfoDictForUserID:", a5));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v8]);

  if ((objc_opt_isKindOfClass(v10, a3) & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0LL;
  }
  id v12 = v11;

  return v12;
}

- (void)_setUserInfoObject:(id)a3 forKey:(id)a4 userID:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemUIServiceHintManager _hintInfoDictForUserID:](self, "_hintInfoDictForUserID:", v8));
  id v12 = [v11 mutableCopy];

  [v12 setObject:v10 forKeyedSubscript:v9];
  defaults = self->_defaults;
  id v14 = [(id)objc_opt_class(self) _userInfoDictKeyForUserID:v8];
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  -[PBSDefaultsTestingProtocol setObject:forKey:](defaults, "setObject:forKey:", v12, v15);
}

+ (id)_userInfoDictKeyForUserID:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue( [@"PBSystemUIServiceHintUserInfoDict" stringByAppendingFormat:@"--%@", a3]);
}

- (void).cxx_destruct
{
}

@end