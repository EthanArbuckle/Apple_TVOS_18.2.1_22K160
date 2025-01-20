@interface BlockTask
- (BlockTask)initWithBlock:(id)a3;
- (void)main;
@end

@implementation BlockTask

- (BlockTask)initWithBlock:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___BlockTask;
  v5 = -[Task init](&v9, "init");
  if (v5)
  {
    id v6 = [v4 copy];
    v7 = *(void **)&v5->super._success;
    *(void *)&v5->super._success = v6;
  }

  return v5;
}

- (void)main
{
}

- (void).cxx_destruct
{
}

@end