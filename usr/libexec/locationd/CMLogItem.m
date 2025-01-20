@interface CMLogItem
+ (BOOL)supportsSecureCoding;
- (CMLogItem)initWithCoder:(id)a3;
- (CMLogItem)initWithTimestamp:(double)a3;
- (NSTimeInterval)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CMLogItem

- (CMLogItem)initWithTimestamp:(double)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CMLogItem;
  v4 = -[CMLogItem init](&v6, "init");
  if (v4) {
    v4->_internalLogItem = -[CMLogItemInternal initWithTimestamp:]( objc_alloc(&OBJC_CLASS___CMLogItemInternal),  "initWithTimestamp:",  a3);
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMLogItem)initWithCoder:(id)a3
{
  return -[CMLogItem initWithTimestamp:](self, "initWithTimestamp:");
}

- (void)encodeWithCoder:(id)a3
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CMLogItem;
  -[CMLogItem dealloc](&v3, "dealloc");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(id)objc_opt_class(self) allocWithZone:a3];
  -[CMLogItem timestamp](self, "timestamp");
  return objc_msgSend(v4, "initWithTimestamp:");
}

- (NSTimeInterval)timestamp
{
  return *((double *)self->_internalLogItem + 1);
}

@end