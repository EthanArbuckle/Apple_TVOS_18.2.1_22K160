@interface ACAccount
- (id)in_registrationExpirationDate;
- (void)in_setRegistrationExpirationDate:(id)a3;
@end

@implementation ACAccount

- (id)in_registrationExpirationDate
{
  return -[ACAccount accountPropertyForKey:](self, "accountPropertyForKey:", @"InRegistrationExpirationDate");
}

- (void)in_setRegistrationExpirationDate:(id)a3
{
}

@end