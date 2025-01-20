@interface NSJoin
+ (id)joinWithSourceAttributeName:(uint64_t)a3 destinationAttributeName:;
- (BOOL)isEqual:(id)a3;
- (NSJoin)initWithCoder:(id)a3;
- (NSJoin)initWithSourceAttributeName:(id)a3 destinationAttributeName:(id)a4;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSJoin

+ (id)joinWithSourceAttributeName:(uint64_t)a3 destinationAttributeName:
{
  return (id)[objc_alloc((Class)objc_opt_self()) initWithSourceAttributeName:a2 destinationAttributeName:a3];
}

- (NSJoin)initWithSourceAttributeName:(id)a3 destinationAttributeName:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NSJoin;
  v6 = -[NSJoin init](&v8, sel_init);
  if (v6)
  {
    v6->_sourceAttributeName = (NSString *)[a3 copy];
    v6->_destinationAttributeName = (NSString *)[a4 copy];
  }

  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSJoin;
  -[NSJoin dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  if (!a3) {
    return 0;
  }
  uint64_t v5 = objc_opt_class();
  if (v5 != objc_opt_class()) {
    return 0;
  }
  if (self)
  {
    if (!-[NSString isEqualToString:](self->_sourceAttributeName, "isEqualToString:", *((void *)a3 + 1))) {
      return 0;
    }
    destinationAttributeName = self->_destinationAttributeName;
  }

  else
  {
    char v8 = [0 isEqualToString:*((void *)a3 + 1)];
    destinationAttributeName = 0LL;
    if ((v8 & 1) == 0) {
      return 0;
    }
  }

  return -[NSString isEqualToString:](destinationAttributeName, "isEqualToString:", *((void *)a3 + 2));
}

- (unint64_t)hash
{
  if (self)
  {
    uint64_t v3 = -[NSString hash](self->_sourceAttributeName, "hash");
    destinationAttributeName = self->_destinationAttributeName;
  }

  else
  {
    uint64_t v3 = [0 hash];
    destinationAttributeName = 0LL;
  }

  return -[NSString hash](destinationAttributeName, "hash") ^ v3;
}

- (NSJoin)initWithCoder:(id)a3
{
  return -[NSJoin initWithSourceAttributeName:destinationAttributeName:]( self,  "initWithSourceAttributeName:destinationAttributeName:",  [a3 decodeObjectForKey:@"NSSourceAttributeName"],  objc_msgSend(a3, "decodeObjectForKey:", @"NSDestinationAttributeName"));
}

- (void)encodeWithCoder:(id)a3
{
  if (self)
  {
    [a3 encodeObject:self->_sourceAttributeName forKey:@"NSSourceAttributeName"];
    destinationAttributeName = self->_destinationAttributeName;
  }

  else
  {
    [a3 encodeObject:0 forKey:@"NSSourceAttributeName"];
    destinationAttributeName = 0LL;
  }

  [a3 encodeObject:destinationAttributeName forKey:@"NSDestinationAttributeName"];
}

@end