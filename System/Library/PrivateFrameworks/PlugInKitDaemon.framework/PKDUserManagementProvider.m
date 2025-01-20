@interface PKDUserManagementProvider
- (BOOL)isMultiUser;
- (id)listAllPersonaAttributesWithError:(id *)a3;
- (unint64_t)personaGenerationIdentifierWithError:(id *)a3;
@end

@implementation PKDUserManagementProvider

- (BOOL)isMultiUser
{
  return 0;
}

- (id)listAllPersonaAttributesWithError:(id *)a3
{
  return 0LL;
}

- (unint64_t)personaGenerationIdentifierWithError:(id *)a3
{
  return 0LL;
}

@end