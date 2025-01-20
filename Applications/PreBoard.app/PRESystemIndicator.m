@interface PRESystemIndicator
+ (id)sharedInstance;
- (PRESystemIndicator)init;
- (SSIndicatorLight)sil;
- (void)flashMorseCodePattern:(id)a3;
- (void)off;
- (void)on;
- (void)setSil:(id)a3;
@end

@implementation PRESystemIndicator

+ (id)sharedInstance
{
  if (qword_100011FF8 != -1) {
    dispatch_once(&qword_100011FF8, &stru_10000C548);
  }
  return (id)qword_100011FF0;
}

- (PRESystemIndicator)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PRESystemIndicator;
  v2 = -[PRESystemIndicator init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___SSIndicatorLight);
    sil = v2->_sil;
    v2->_sil = v3;
  }

  return v2;
}

- (void)flashMorseCodePattern:(id)a3
{
}

- (void)on
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[PRESystemIndicator sil](self, "sil"));
  [v2 setState:2 completion:&stru_10000C568];
}

- (void)off
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[PRESystemIndicator sil](self, "sil"));
  [v2 setState:1 completion:&stru_10000C588];
}

- (SSIndicatorLight)sil
{
  return self->_sil;
}

- (void)setSil:(id)a3
{
}

- (void).cxx_destruct
{
}

@end