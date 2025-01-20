@interface TIContinuousPathWithLayoutName
- (NSString)layout;
- (TIContinuousPathWithLayoutName)initWithLayout:(id)a3;
@end

@implementation TIContinuousPathWithLayoutName

- (TIContinuousPathWithLayoutName)initWithLayout:(id)a3
{
  v4 = (NSString *)a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TIContinuousPathWithLayoutName;
  v5 = -[TIContinuousPath init](&v8, "init");
  layout = v5->_layout;
  v5->_layout = v4;

  return v5;
}

- (NSString)layout
{
  return self->_layout;
}

- (void).cxx_destruct
{
}

@end