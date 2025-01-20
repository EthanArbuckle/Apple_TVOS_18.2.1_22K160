@interface __PBPowerManagerObserverWrapper
+ (id)wrapperWithObserver:(id)a3;
- (PBPowerManagerObserver)observer;
- (void)setObserver:(id)a3;
@end

@implementation __PBPowerManagerObserverWrapper

+ (id)wrapperWithObserver:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new(&OBJC_CLASS_____PBPowerManagerObserverWrapper);
  objc_storeWeak((id *)&v4->_observer, v3);

  return v4;
}

- (PBPowerManagerObserver)observer
{
  return (PBPowerManagerObserver *)objc_loadWeakRetained((id *)&self->_observer);
}

- (void)setObserver:(id)a3
{
}

- (void).cxx_destruct
{
}

@end