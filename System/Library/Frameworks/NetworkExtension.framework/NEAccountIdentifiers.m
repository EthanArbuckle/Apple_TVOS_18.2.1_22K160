@interface NEAccountIdentifiers
- (NSArray)calendarAccountIdentifiers;
- (NSArray)contactsAccountIdentifiers;
- (NSArray)mailAccountIdentifiers;
- (void)setCalendarAccountIdentifiers:(id)a3;
- (void)setContactsAccountIdentifiers:(id)a3;
- (void)setMailAccountIdentifiers:(id)a3;
@end

@implementation NEAccountIdentifiers

- (NSArray)mailAccountIdentifiers
{
  return (NSArray *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setMailAccountIdentifiers:(id)a3
{
}

- (NSArray)calendarAccountIdentifiers
{
  return (NSArray *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setCalendarAccountIdentifiers:(id)a3
{
}

- (NSArray)contactsAccountIdentifiers
{
  return (NSArray *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setContactsAccountIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end