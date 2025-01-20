@interface _NSCloudSharingDescriptor
+ (BOOL)supportsSecureCoding;
- (BOOL)invitationsSentViaThirdPartyService;
- (BOOL)publicShare;
- (NSString)sharedContentType;
- (_NSCloudSharingDescriptor)initWithCoder:(id)a3;
- (id)_variantSubstrings;
- (int64_t)numberOfInvitations;
- (int64_t)operation;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setInvitationsSentViaThirdPartyService:(BOOL)a3;
- (void)setNumberOfInvitations:(int64_t)a3;
- (void)setOperation:(int64_t)a3;
- (void)setPublicShare:(BOOL)a3;
- (void)setSharedContentType:(id)a3;
@end

@implementation _NSCloudSharingDescriptor

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____NSCloudSharingDescriptor;
  -[_NSCloudSharingDescriptor dealloc](&v3, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_NSCloudSharingDescriptor)initWithCoder:(id)a3
{
  self->_operation = [a3 decodeIntegerForKey:@"NSShareOperation"];
  self->_invitationsSentViaThirdPartyService = [a3 decodeBoolForKey:@"NSShareViaThirdParty"];
  self->_publicShare = [a3 decodeBoolForKey:@"NSSharePublic"];
  self->_numberOfInvitations = [a3 decodeIntegerForKey:@"NSShareNumberOfInviations"];
  self->_sharedContentType = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSShareContentType"];
  return self;
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)_variantSubstrings
{
  objc_super v3 = (void *)[MEMORY[0x189603FA8] array];
  uint64_t v4 = v3;
  unint64_t v5 = self->_operation - 1;
  if (v5 < 3)
  {
    v6 = off_189C9A7A8[v5];
LABEL_13:
    [v4 addObject:v6];
    return v4;
  }

  if (self->_publicShare)
  {
    v7 = @"Public";
LABEL_9:
    [v3 addObject:v7];
    goto LABEL_10;
  }

  if (self->_invitationsSentViaThirdPartyService)
  {
    v7 = @"3rdParty";
    goto LABEL_9;
  }

  if (self->_numberOfInvitations >= 2)
  {
    v7 = @"Multiple";
    goto LABEL_9;
  }

- (int64_t)operation
{
  return self->_operation;
}

- (void)setOperation:(int64_t)a3
{
  self->_operation = a3;
}

- (BOOL)invitationsSentViaThirdPartyService
{
  return self->_invitationsSentViaThirdPartyService;
}

- (void)setInvitationsSentViaThirdPartyService:(BOOL)a3
{
  self->_invitationsSentViaThirdPartyService = a3;
}

- (BOOL)publicShare
{
  return self->_publicShare;
}

- (void)setPublicShare:(BOOL)a3
{
  self->_publicShare = a3;
}

- (int64_t)numberOfInvitations
{
  return self->_numberOfInvitations;
}

- (void)setNumberOfInvitations:(int64_t)a3
{
  self->_numberOfInvitations = a3;
}

- (NSString)sharedContentType
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setSharedContentType:(id)a3
{
}

@end