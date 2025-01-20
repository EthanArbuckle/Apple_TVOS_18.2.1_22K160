@interface FamilyInfoLookupResult
- (id)description;
@end

@implementation FamilyInfoLookupResult

- (id)description
{
  familyMembers = self;
  if (self)
  {
    BOOL cached = self->_cached;
    familyMembers = self->_familyMembers;
  }

  else
  {
    BOOL cached = 0LL;
  }

  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"{ cached: %d familyMembers: %@ }",  cached,  familyMembers);
}

- (void).cxx_destruct
{
}

@end