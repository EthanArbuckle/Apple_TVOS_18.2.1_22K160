@interface __NSCFCalendar
+ (BOOL)supportsSecureCoding;
- (Class)classForCoder;
- (__NSCFCalendar)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation __NSCFCalendar

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (__NSCFCalendar)initWithCoder:(id)a3
{
  return (__NSCFCalendar *)[objc_alloc(MEMORY[0x189603F38]) initWithCoder:a3];
}

@end