@interface MLRSchedulingTask
- (MLRSchedulingTask)initWithBundleIdentifier:(id)a3 taskSource:(int64_t)a4;
- (MLRSchedulingTask)initWithBundleIdentifier:(id)a3 taskSource:(int64_t)a4 maxTimeLimit:(double)a5;
- (NSString)bundleIdentifier;
- (double)maxTimeLimit;
- (id)description;
- (int64_t)source;
@end

@implementation MLRSchedulingTask

- (MLRSchedulingTask)initWithBundleIdentifier:(id)a3 taskSource:(int64_t)a4 maxTimeLimit:(double)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___MLRSchedulingTask;
  v10 = -[MLRSchedulingTask init](&v13, "init");
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_bundleIdentifier, a3);
    v11->_source = a4;
    v11->_maxTimeLimit = a5;
  }

  return v11;
}

- (MLRSchedulingTask)initWithBundleIdentifier:(id)a3 taskSource:(int64_t)a4
{
  return -[MLRSchedulingTask initWithBundleIdentifier:taskSource:maxTimeLimit:]( self,  "initWithBundleIdentifier:taskSource:maxTimeLimit:",  a3,  a4,  0.0);
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MLRSchedulingTask bundleIdentifier](self, "bundleIdentifier"));
  int64_t v7 = -[MLRSchedulingTask source](self, "source");
  -[MLRSchedulingTask maxTimeLimit](self, "maxTimeLimit");
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@(%@, %ld, %f)",  v5,  v6,  v7,  v8));

  return v9;
}

- (int64_t)source
{
  return self->_source;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (double)maxTimeLimit
{
  return self->_maxTimeLimit;
}

- (void).cxx_destruct
{
}

@end