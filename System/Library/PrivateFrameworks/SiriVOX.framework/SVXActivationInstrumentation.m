@interface SVXActivationInstrumentation
- (NSUUID)turnIdentifier;
- (SVXActivationInstrumentation)initWithTurnIdentifier:(id)a3 buttonTimestamp:(unint64_t)a4;
- (unint64_t)buttonDownTimestamp;
@end

@implementation SVXActivationInstrumentation

- (SVXActivationInstrumentation)initWithTurnIdentifier:(id)a3 buttonTimestamp:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___SVXActivationInstrumentation;
  v8 = -[SVXActivationInstrumentation init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_turnIdentifier, a3);
    v9->_buttonDownTimestamp = a4;
  }

  return v9;
}

- (NSUUID)turnIdentifier
{
  return self->_turnIdentifier;
}

- (unint64_t)buttonDownTimestamp
{
  return self->_buttonDownTimestamp;
}

- (void).cxx_destruct
{
}

@end