@interface _TVDAStepDisplayModePair
- (PBSDisplayMode)displayMode;
- (TVDAStep)step;
- (_TVDAStepDisplayModePair)initWithStep:(id)a3;
- (void)setDisplayMode:(id)a3;
- (void)setStep:(id)a3;
@end

@implementation _TVDAStepDisplayModePair

- (_TVDAStepDisplayModePair)initWithStep:(id)a3
{
  v11 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v3 = v11;
  v11 = 0LL;
  v11 = -[_TVDAStepDisplayModePair init](v3, "init");
  objc_storeStrong((id *)&v11, v11);
  if (v11)
  {
    objc_storeStrong((id *)&v11->_step, location[0]);
    v9 = +[PBSDisplayManager sharedInstance](&OBJC_CLASS___PBSDisplayManager, "sharedInstance");
    id v8 = -[PBSDisplayManager currentDisplayMode](v9, "currentDisplayMode");
    v4 = (PBSDisplayMode *)[v8 copy];
    displayMode = v11->_displayMode;
    v11->_displayMode = v4;
  }

  v7 = v11;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v11, 0LL);
  return v7;
}

- (PBSDisplayMode)displayMode
{
  return self->_displayMode;
}

- (void)setDisplayMode:(id)a3
{
}

- (TVDAStep)step
{
  return self->_step;
}

- (void)setStep:(id)a3
{
}

- (void).cxx_destruct
{
}

@end