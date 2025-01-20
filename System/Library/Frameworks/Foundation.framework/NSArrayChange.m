@interface NSArrayChange
+ (id)allocWithZone:(_NSZone *)a3;
- (NSArrayChange)initWithType:(unint64_t)a3 sourceIndex:(unint64_t)a4 destinationIndex:(unint64_t)a5 value:(id)a6;
- (id)value;
- (unint64_t)changeType;
- (unint64_t)destinationIndex;
- (unint64_t)sourceIndex;
@end

@implementation NSArrayChange

+ (id)allocWithZone:(_NSZone *)a3
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  if (&OBJC_CLASS___NSArrayChange == a1) {
    return +[NSArrayChange allocWithZone:](&OBJC_CLASS___NSConcreteArrayChange, "allocWithZone:", a3);
  }
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___NSArrayChange;
  return objc_msgSendSuper2(&v4, sel_allocWithZone_, a3);
}

- (NSArrayChange)initWithType:(unint64_t)a3 sourceIndex:(unint64_t)a4 destinationIndex:(unint64_t)a5 value:(id)a6
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NSArrayChange;
  return -[NSArrayChange init](&v7, sel_init, a3, a4, a5, a6);
}

- (unint64_t)changeType
{
  objc_super v4 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (unint64_t)sourceIndex
{
  objc_super v4 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (unint64_t)destinationIndex
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