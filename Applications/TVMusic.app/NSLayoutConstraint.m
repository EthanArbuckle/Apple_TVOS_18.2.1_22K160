@interface NSLayoutConstraint
- (NSLayoutConstraint)constraintWithPriority:(float)a3;
@end

@implementation NSLayoutConstraint

- (NSLayoutConstraint)constraintWithPriority:(float)a3
{
  v4 = self;
  *(float *)&double v5 = a3;
  -[NSLayoutConstraint setPriority:](v4, "setPriority:", v5);
  return v4;
}

@end