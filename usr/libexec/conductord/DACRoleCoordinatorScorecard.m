@interface DACRoleCoordinatorScorecard
- (id)description;
@end

@implementation DACRoleCoordinatorScorecard

- (id)description
{
  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  uint64_t v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)v5;
  if (self)
  {
    int64_t version = self->_version;
    leaderDate = self->_leaderDate;
  }

  else
  {
    int64_t version = 0LL;
    leaderDate = 0LL;
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p, v(%ld) lD(%@)>",  v5,  self,  version,  leaderDate));

  return v9;
}

- (void).cxx_destruct
{
}

@end