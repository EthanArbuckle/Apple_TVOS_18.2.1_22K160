@interface _LSRegistrationNotificationJournaller
+ (BOOL)supportsSecureCoding;
- (BOOL)entityExists;
- (BOOL)shouldExpectEntityToExist;
- (_LSRegistrationNotificationJournaller)initWithCoder:(id)a3;
- (_LSRegistrationNotificationJournaller)initWithPrimaryBundleID:(id)a3 placeholder:(BOOL)a4;
- (id)synthesizedPreliminaryJournalledNotifications;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _LSRegistrationNotificationJournaller

- (_LSRegistrationNotificationJournaller)initWithPrimaryBundleID:(id)a3 placeholder:(BOOL)a4
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS____LSRegistrationNotificationJournaller;
  result = -[_LSInstallNotificationJournaller initWithPrimaryBundleID:operation:]( &v6,  sel_initWithPrimaryBundleID_operation_,  a3,  0LL);
  if (result) {
    result->_placeholder = a4;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_LSRegistrationNotificationJournaller)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS____LSRegistrationNotificationJournaller;
  v5 = -[_LSInstallNotificationJournaller initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5) {
    v5->_placeholder = [v4 decodeBoolForKey:@"placeholder"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS____LSRegistrationNotificationJournaller;
  id v4 = a3;
  -[_LSInstallNotificationJournaller encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", self->_placeholder, @"placeholder", v5.receiver, v5.super_class);
}

- (BOOL)shouldExpectEntityToExist
{
  return 1;
}

- (BOOL)entityExists
{
  v2 = self;
  v3 = -[_LSInstallNotificationJournaller primaryBundleID](self, "primaryBundleID");
  LOBYTE(v2) = -[_LSInstallNotificationJournaller isApplicationRegisteredWithbundleID:placeholder:]( v2,  "isApplicationRegisteredWithbundleID:placeholder:",  v3,  v2->_placeholder);

  return (char)v2;
}

- (id)synthesizedPreliminaryJournalledNotifications
{
  return (id)MEMORY[0x189604A58];
}

@end