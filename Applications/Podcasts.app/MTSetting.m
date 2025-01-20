@interface MTSetting
+ (id)appThemeButtonSettingWithTitle:(id)a3 identifier:(id)a4 changeHandler:(id)a5;
+ (id)buttonSettingWithTitle:(id)a3 detailText:(id)a4 identifier:(id)a5 changeHandler:(id)a6;
+ (id)buttonSettingWithTitle:(id)a3 identifier:(id)a4 changeHandler:(id)a5;
+ (id)drilldownSettingWithTitle:(id)a3 valueLabel:(id)a4 identifier:(id)a5 viewControllerGenerator:(id)a6;
+ (id)informativeSettingWithText:(id)a3 identifier:(id)a4;
+ (id)loadingSettingWithIdentifier:(id)a3;
+ (id)optionSettingWithTitle:(id)a3 footerText:(id)a4 initialValue:(unint64_t)a5 optionDescription:(id)a6 identifier:(id)a7 changeHandler:(id)a8;
+ (id)optionSettingWithTitle:(id)a3 headerTitle:(id)a4 footerText:(id)a5 initialValue:(unint64_t)a6 optionDescription:(id)a7 identifier:(id)a8 changeHandler:(id)a9;
+ (id)radioOptionWithTitle:(id)a3 radioGroup:(id)a4 value:(unint64_t)a5 identifier:(id)a6;
+ (id)switchSettingWithTitle:(id)a3 initialValue:(BOOL)a4 identifier:(id)a5 changeHandler:(id)a6;
+ (id)textSettingWithInitialValue:(id)a3 placeholder:(id)a4 identifier:(id)a5 changeHandler:(id)a6;
- (BOOL)enabled;
- (MTSetting)init;
- (MTSettingsGroup)group;
- (NSDictionary)userInfo;
- (NSString)identifier;
- (NSString)title;
- (id)changeHandler;
- (id)generator;
- (id)value;
- (int64_t)type;
- (void)setChangeHandler:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setGenerator:(id)a3;
- (void)setGroup:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setTitle:(id)a3;
- (void)setType:(int64_t)a3;
- (void)setUserInfo:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation MTSetting

+ (id)radioOptionWithTitle:(id)a3 radioGroup:(id)a4 value:(unint64_t)a5 identifier:(id)a6
{
  id v9 = a6;
  id v10 = a4;
  id v11 = a3;
  v12 = objc_alloc_init(&OBJC_CLASS___MTRadioButtonSetting);
  -[MTSetting setType:](v12, "setType:", 7LL);
  -[MTSetting setTitle:](v12, "setTitle:", v11);

  -[MTRadioButtonSetting setRadioGroup:](v12, "setRadioGroup:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a5));
  -[MTSetting setValue:](v12, "setValue:", v13);

  -[MTSetting setIdentifier:](v12, "setIdentifier:", v9);
  [v10 addRadioSetting:v12];

  return v12;
}

+ (id)switchSettingWithTitle:(id)a3 initialValue:(BOOL)a4 identifier:(id)a5 changeHandler:(id)a6
{
  BOOL v7 = a4;
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = objc_alloc_init((Class)a1);
  [v13 setType:0];
  [v13 setTitle:v12];

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v7));
  [v13 setValue:v14];

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1000C96E4;
  v17[3] = &unk_100243E08;
  id v18 = v10;
  id v15 = v10;
  [v13 setChangeHandler:v17];
  [v13 setIdentifier:v11];

  return v13;
}

+ (id)buttonSettingWithTitle:(id)a3 detailText:(id)a4 identifier:(id)a5 changeHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = objc_alloc_init((Class)a1);
  [v14 setType:2];
  [v14 setTitle:v13];

  id v15 = [v12 copy];
  [v14 setValue:v15];

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_1000C981C;
  v18[3] = &unk_100243E08;
  id v19 = v10;
  id v16 = v10;
  [v14 setChangeHandler:v18];
  [v14 setIdentifier:v11];

  return v14;
}

+ (id)buttonSettingWithTitle:(id)a3 identifier:(id)a4 changeHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init((Class)a1);
  [v11 setType:1];
  [v11 setTitle:v10];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1000C98FC;
  v14[3] = &unk_100243E08;
  id v15 = v8;
  id v12 = v8;
  [v11 setChangeHandler:v14];
  [v11 setIdentifier:v9];

  return v11;
}

+ (id)appThemeButtonSettingWithTitle:(id)a3 identifier:(id)a4 changeHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init((Class)a1);
  [v11 setType:3];
  [v11 setTitle:v10];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1000C99DC;
  v14[3] = &unk_100243E08;
  id v15 = v8;
  id v12 = v8;
  [v11 setChangeHandler:v14];
  [v11 setIdentifier:v9];

  return v11;
}

+ (id)textSettingWithInitialValue:(id)a3 placeholder:(id)a4 identifier:(id)a5 changeHandler:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = objc_alloc_init(&OBJC_CLASS___MTTextSetting);
  -[MTSetting setType:](v13, "setType:", 6LL);
  -[MTSetting setValue:](v13, "setValue:", v12);

  -[MTTextSetting setPlaceholder:](v13, "setPlaceholder:", v11);
  -[MTSetting setChangeHandler:](v13, "setChangeHandler:", v9);

  -[MTSetting setIdentifier:](v13, "setIdentifier:", v10);
  return v13;
}

+ (id)drilldownSettingWithTitle:(id)a3 valueLabel:(id)a4 identifier:(id)a5 viewControllerGenerator:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = objc_alloc_init((Class)a1);
  [v14 setType:4];
  [v14 setTitle:v13];

  [v14 setGenerator:v10];
  [v14 setIdentifier:v11];

  [v14 setValue:v12];
  return v14;
}

+ (id)loadingSettingWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  [v5 setType:8];
  [v5 setIdentifier:v4];

  return v5;
}

+ (id)informativeSettingWithText:(id)a3 identifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)a1);
  [v8 setType:9];
  [v8 setIdentifier:v6];

  [v8 setEnabled:0];
  [v8 setValue:v7];

  return v8;
}

+ (id)optionSettingWithTitle:(id)a3 headerTitle:(id)a4 footerText:(id)a5 initialValue:(unint64_t)a6 optionDescription:(id)a7 identifier:(id)a8 changeHandler:(id)a9
{
  id v15 = a9;
  id v16 = a8;
  id v17 = a7;
  id v18 = a5;
  id v19 = a4;
  id v20 = a3;
  v21 = objc_alloc_init(&OBJC_CLASS___MTOptionSetting);
  -[MTSetting setType:](v21, "setType:", 5LL);
  -[MTSetting setTitle:](v21, "setTitle:", v20);

  -[MTOptionSetting setHeaderTitle:](v21, "setHeaderTitle:", v19);
  -[MTOptionSetting setFooterText:](v21, "setFooterText:", v18);

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a6));
  -[MTSetting setValue:](v21, "setValue:", v22);

  -[MTOptionSetting setOptions:](v21, "setOptions:", v17);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_1000C9D88;
  v25[3] = &unk_100243E08;
  id v26 = v15;
  id v23 = v15;
  -[MTSetting setChangeHandler:](v21, "setChangeHandler:", v25);
  -[MTSetting setIdentifier:](v21, "setIdentifier:", v16);

  return v21;
}

+ (id)optionSettingWithTitle:(id)a3 footerText:(id)a4 initialValue:(unint64_t)a5 optionDescription:(id)a6 identifier:(id)a7 changeHandler:(id)a8
{
  return [a1 optionSettingWithTitle:a3 headerTitle:a3 footerText:a4 initialValue:a5 optionDescription:a6 identifier:a7 changeHandler:a8];
}

- (MTSetting)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MTSetting;
  v2 = -[MTSetting init](&v5, "init");
  v3 = v2;
  if (v2) {
    -[MTSetting setEnabled:](v2, "setEnabled:", 1LL);
  }
  return v3;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (id)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (id)changeHandler
{
  return self->_changeHandler;
}

- (void)setChangeHandler:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (id)generator
{
  return self->_generator;
}

- (void)setGenerator:(id)a3
{
}

- (MTSettingsGroup)group
{
  return (MTSettingsGroup *)objc_loadWeakRetained((id *)&self->_group);
}

- (void)setGroup:(id)a3
{
}

- (void).cxx_destruct
{
}

@end