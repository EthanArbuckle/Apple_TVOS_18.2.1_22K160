@interface RequestTask
- (id)initForClient:(id)a3 withOptions:(id)a4;
@end

@implementation RequestTask

- (id)initForClient:(id)a3 withOptions:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___RequestTask;
  v9 = -[Task init](&v12, "init");
  p_isa = (id *)&v9->super.super.super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->super._error, a3);
    objc_storeStrong(p_isa + 7, a4);
  }

  return p_isa;
}

- (void).cxx_destruct
{
}

@end