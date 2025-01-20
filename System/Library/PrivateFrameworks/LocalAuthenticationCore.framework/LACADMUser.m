@interface LACADMUser
+ (BOOL)isUserNameUnique:(id)a3 searchParent:(BOOL)a4;
+ (BOOL)shouldDisplayUser:(id)a3;
+ (id)allLocalUsers;
+ (id)currentUser;
+ (id)findUserByID:(unint64_t)a3 searchParent:(BOOL)a4;
+ (id)findUserByName:(id)a3 searchParent:(BOOL)a4;
+ (id)namesFromUsersWithUIDs:(id)a3;
+ (id)namesFromUsersWithUIDs:(id)a3 presentInGroupWithName:(id)a4;
+ (id)rootUser;
- (BOOL)isAdministrator;
- (BOOL)isDirectAdministrator;
- (BOOL)isGuestUser;
- (BOOL)isMemberOfGroupWithName:(id)a3;
- (NSString)fullName;
- (NSString)groupName;
- (NSString)name;
- (int64_t)userID;
@end

@implementation LACADMUser

- (BOOL)isMemberOfGroupWithName:(id)a3
{
  return 0;
}

+ (id)allLocalUsers
{
  return (id)MEMORY[0x189604A58];
}

+ (id)currentUser
{
  return 0LL;
}

+ (id)rootUser
{
  return 0LL;
}

+ (id)findUserByID:(unint64_t)a3 searchParent:(BOOL)a4
{
  return 0LL;
}

+ (id)findUserByName:(id)a3 searchParent:(BOOL)a4
{
  return 0LL;
}

+ (BOOL)isUserNameUnique:(id)a3 searchParent:(BOOL)a4
{
  return 0;
}

+ (BOOL)shouldDisplayUser:(id)a3
{
  return 0;
}

+ (id)namesFromUsersWithUIDs:(id)a3
{
  return (id)MEMORY[0x189604A58];
}

+ (id)namesFromUsersWithUIDs:(id)a3 presentInGroupWithName:(id)a4
{
  return (id)MEMORY[0x189604A58];
}

- (BOOL)isAdministrator
{
  return self->_isAdministrator;
}

- (BOOL)isDirectAdministrator
{
  return self->_isDirectAdministrator;
}

- (BOOL)isGuestUser
{
  return self->_isGuestUser;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)fullName
{
  return self->_fullName;
}

- (int64_t)userID
{
  return self->_userID;
}

- (void).cxx_destruct
{
}

@end