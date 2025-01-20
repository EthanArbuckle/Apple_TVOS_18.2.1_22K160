@interface TVMusicKeyboardController
+ (TVMusicKeyboardController)sharedInstance;
- (UITextField)textField;
- (id)completionBlock;
- (void)presentKeyboardWithHeaderText:(id)a3 initialText:(id)a4 completion:(id)a5;
- (void)setCompletionBlock:(id)a3;
- (void)setTextField:(id)a3;
- (void)textFieldDidEndEditing:(id)a3 reason:(int64_t)a4;
@end

@implementation TVMusicKeyboardController

+ (TVMusicKeyboardController)sharedInstance
{
  if (qword_1002BE778 != -1) {
    dispatch_once(&qword_1002BE778, &stru_100269368);
  }
  return (TVMusicKeyboardController *)(id)qword_1002BE770;
}

- (void)presentKeyboardWithHeaderText:(id)a3 initialText:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  if (self->_textField)
  {
    (*((void (**)(id, void))a5 + 2))(a5, 0LL);
  }

  else
  {
    -[TVMusicKeyboardController setCompletionBlock:](self, "setCompletionBlock:", a5);
    if (+[TVMusicApplication usingMusicUI](&OBJC_CLASS___TVMusicApplication, "usingMusicUI"))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicUIMainViewController shared]( &OBJC_CLASS____TtC7TVMusic27TVMusicUIMainViewController,  "shared"));
      v11 = (void *)objc_claimAutoreleasedReturnValue([v10 view]);
    }

    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[TVMusicAppDelegate theApp](&OBJC_CLASS___TVMusicAppDelegate, "theApp"));
      v12 = (void *)objc_claimAutoreleasedReturnValue([v10 navigationController]);
      v13 = (void *)objc_claimAutoreleasedReturnValue([v12 topViewController]);
      v11 = (void *)objc_claimAutoreleasedReturnValue([v13 view]);
    }

    v14 = objc_alloc_init(&OBJC_CLASS___UITextField);
    textField = self->_textField;
    self->_textField = v14;

    -[UITextField setText:](self->_textField, "setText:", v9);
    -[UITextField setHidden:](self->_textField, "setHidden:", 1LL);
    -[UITextField setDelegate:](self->_textField, "setDelegate:", self);
    [v11 addSubview:self->_textField];
    if (v8)
    {
      v16 = objc_alloc_init(&OBJC_CLASS___UILabel);
      -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v16,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
      -[UILabel setTextAlignment:](v16, "setTextAlignment:", 1LL);
      v17 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleTitle3));
      -[UILabel setFont:](v16, "setFont:", v17);

      -[UILabel setText:](v16, "setText:", v8);
      v18 = objc_alloc_init(&OBJC_CLASS___UIView);
      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0LL);
      -[UIView addSubview:](v18, "addSubview:", v16);
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v16, "topAnchor"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v18, "topAnchor"));
      v29 = (void *)objc_claimAutoreleasedReturnValue([v31 constraintEqualToAnchor:v30]);
      v33[0] = v29;
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerXAnchor](v16, "centerXAnchor"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](v18, "centerXAnchor"));
      v26 = (void *)objc_claimAutoreleasedReturnValue([v28 constraintEqualToAnchor:v27]);
      v33[1] = v26;
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](v18, "widthAnchor"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel widthAnchor](v16, "widthAnchor"));
      v20 = (void *)objc_claimAutoreleasedReturnValue([v25 constraintEqualToAnchor:v19]);
      v33[2] = v20;
      id v32 = v9;
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](v18, "heightAnchor"));
      v22 = (void *)objc_claimAutoreleasedReturnValue([v21 constraintEqualToConstant:200.0]);
      v33[3] = v22;
      id v23 = v8;
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v33, 4LL));
      +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v24);

      id v8 = v23;
      id v9 = v32;

      -[UITextField setInputAccessoryView:](self->_textField, "setInputAccessoryView:", v18);
    }

    -[UITextField becomeFirstResponder](self->_textField, "becomeFirstResponder");
  }
}

- (void)textFieldDidEndEditing:(id)a3 reason:(int64_t)a4
{
  if (a4) {
    id v7 = 0LL;
  }
  else {
    id v7 = (id)objc_claimAutoreleasedReturnValue([a3 text]);
  }
  v5 = (void (**)(void, void))objc_claimAutoreleasedReturnValue(-[TVMusicKeyboardController completionBlock](self, "completionBlock", a3));
  ((void (**)(void, id))v5)[2](v5, v7);

  -[UITextField removeFromSuperview](self->_textField, "removeFromSuperview");
  -[UITextField setDelegate:](self->_textField, "setDelegate:", 0LL);
  textField = self->_textField;
  self->_textField = 0LL;

  -[TVMusicKeyboardController setCompletionBlock:](self, "setCompletionBlock:", 0LL);
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (UITextField)textField
{
  return self->_textField;
}

- (void)setTextField:(id)a3
{
}

- (void).cxx_destruct
{
}

@end