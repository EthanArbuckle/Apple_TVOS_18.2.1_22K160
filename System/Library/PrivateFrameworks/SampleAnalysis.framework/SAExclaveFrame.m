@interface SAExclaveFrame
- (BOOL)isExclave;
- (_BYTE)initWithExclave:(_BYTE *)a1;
- (id)exclave;
- (id)initCopyingFrame:(id)a3 withParent:(id)a4;
- (void)reset;
@end

@implementation SAExclaveFrame

- (_BYTE)initWithExclave:(_BYTE *)a1
{
  id v3 = a2;
  if (a1)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_CLASS___SAExclaveFrame;
    id v4 = objc_msgSendSuper2(&v6, sel_init);
    a1 = v4;
    if (v4)
    {
      objc_storeWeak((id *)v4 + 6, v3);
      a1[8] |= 4u;
    }
  }

  return a1;
}

- (BOOL)isExclave
{
  return 1;
}

- (id)exclave
{
  return objc_loadWeakRetained((id *)&self->_exclave);
}

- (id)initCopyingFrame:(id)a3 withParent:(id)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___SAExclaveFrame;
  v7 = -[SAFrame initCopyingFrame:withParent:](&v10, sel_initCopyingFrame_withParent_, v6, a4);
  if (v7)
  {
    [v6 exclave];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak(v7 + 6, v8);
  }

  return v7;
}

- (void)reset
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SAExclaveFrame;
  -[SAFrame reset](&v3, sel_reset);
  objc_storeWeak((id *)&self->_exclave, 0LL);
}

- (void).cxx_destruct
{
}

@end