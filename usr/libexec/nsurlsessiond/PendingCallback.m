@interface PendingCallback
+ (BOOL)supportsSecureCoding;
- (BOOL)hasBeenCalled;
- (NSArray)args;
- (PendingCallback)initWithCallbackType:(int)a3 taskIdentifier:(unint64_t)a4 args:(id)a5;
- (PendingCallback)initWithCoder:(id)a3;
- (int)type;
- (unint64_t)taskIdentifier;
- (void)encodeWithCoder:(id)a3;
- (void)setArgs:(id)a3;
- (void)setHasBeenCalled:(BOOL)a3;
- (void)setTaskIdentifier:(unint64_t)a3;
- (void)setType:(int)a3;
@end

@implementation PendingCallback

- (PendingCallback)initWithCallbackType:(int)a3 taskIdentifier:(unint64_t)a4 args:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___PendingCallback;
  v9 = -[PendingCallback init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    -[PendingCallback setType:](v9, "setType:", v6);
    -[PendingCallback setTaskIdentifier:](v10, "setTaskIdentifier:", a4);
    -[PendingCallback setArgs:](v10, "setArgs:", v8);
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", -[PendingCallback type](self, "type"), @"type");
  objc_msgSend( v5,  "encodeInteger:forKey:",  -[PendingCallback taskIdentifier](self, "taskIdentifier"),  @"taskIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PendingCallback args](self, "args"));
  [v5 encodeObject:v4 forKey:@"args"];
}

- (PendingCallback)initWithCoder:(id)a3
{
  id v4 = a3;
  -[PendingCallback setType:](self, "setType:", [v4 decodeIntegerForKey:@"type"]);
  -[PendingCallback setTaskIdentifier:]( self,  "setTaskIdentifier:",  [v4 decodeIntegerForKey:@"taskIdentifier"]);
  id v5 = [v4 decodeObjectOfClass:objc_opt_class(NSArray) forKey:@"args"];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  -[PendingCallback setArgs:](self, "setArgs:", v6);

  return self;
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (unint64_t)taskIdentifier
{
  return self->_taskIdentifier;
}

- (void)setTaskIdentifier:(unint64_t)a3
{
  self->_taskIdentifier = a3;
}

- (NSArray)args
{
  return (NSArray *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setArgs:(id)a3
{
}

- (BOOL)hasBeenCalled
{
  return self->_hasBeenCalled;
}

- (void)setHasBeenCalled:(BOOL)a3
{
  self->_hasBeenCalled = a3;
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end