@interface NSSetChange
+ (id)allocWithZone:(_NSZone *)a3;
- (NSSetChange)initWithType:(unint64_t)a3 object:(id)a4;
- (id)value;
- (unint64_t)changeType;
@end

@implementation NSSetChange

+ (id)allocWithZone:(_NSZone *)a3
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  if (&OBJC_CLASS___NSSetChange == a1) {
    return +[NSSetChange allocWithZone:](&OBJC_CLASS___NSConcreteSetChange, "allocWithZone:", a3);
  }
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___NSSetChange;
  return objc_msgSendSuper2(&v4, sel_allocWithZone_, a3);
}

- (NSSetChange)initWithType:(unint64_t)a3 object:(id)a4
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NSSetChange;
  return -[NSSetChange init](&v5, sel_init, a3, a4);
}

- (unint64_t)changeType
{
  objc_super v4 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (id)value
{
  objc_super v4 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

@end