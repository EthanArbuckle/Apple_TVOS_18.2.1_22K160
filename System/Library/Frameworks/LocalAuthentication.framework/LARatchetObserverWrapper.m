@interface LARatchetObserverWrapper
- (BOOL)isEqual:(id)a3;
- (LARatchetObserver)observer;
- (LARatchetObserverWrapper)initWithObserver:(id)a3;
- (unint64_t)hash;
- (void)ratchetStateDidChange:(id)a3;
- (void)setObserver:(id)a3;
@end

@implementation LARatchetObserverWrapper

- (LARatchetObserverWrapper)initWithObserver:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___LARatchetObserverWrapper;
  v5 = -[LARatchetObserverWrapper init](&v8, sel_init);
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_observer, v4);
  }

  return v6;
}

- (void)ratchetStateDidChange:(id)a3
{
  id v4 = a3;
  v6 = -[LARatchetState initWithState:](objc_alloc(&OBJC_CLASS___LARatchetState), "initWithState:", v4);

  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  [WeakRetained ratchetStateDidChange:v6];
}

- (unint64_t)hash
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  unint64_t v3 = [WeakRetained hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v5 = v4;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
    [v5 observer];
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    char v8 = [WeakRetained isEqual:v7];
  }

  else
  {
    char v8 = 0;
  }

  return v8;
}

- (LARatchetObserver)observer
{
  return (LARatchetObserver *)objc_loadWeakRetained((id *)&self->_observer);
}

- (void)setObserver:(id)a3
{
}

- (void).cxx_destruct
{
}

@end