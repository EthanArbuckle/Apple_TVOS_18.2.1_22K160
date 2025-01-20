@interface CSVSUISceneTransition
+ (id)standardTransitionForAppearingScene:(id)a3 atomic:(BOOL)a4 identifier:(id)a5;
+ (id)standardTransitionForDisappearingScene:(id)a3 atomic:(BOOL)a4 identifier:(id)a5;
+ (id)transitionForAppearingScene:(id)a3 atomic:(BOOL)a4 identifier:(id)a5 handler:(id)a6;
+ (id)transitionForDisappearingScene:(id)a3 appearingScene:(id)a4 atomic:(BOOL)a5 identifier:(id)a6 handler:(id)a7;
+ (id)transitionForDisappearingScene:(id)a3 atomic:(BOOL)a4 identifier:(id)a5 handler:(id)a6;
- (BOOL)isAtomic;
- (CSVSUIScene)appearingScene;
- (CSVSUIScene)disappearingScene;
- (CSVSUISceneTransition)initWithDisappearingScene:(id)a3 appearingScene:(id)a4 handler:(id)a5 identifier:(id)a6 isAtomic:(BOOL)a7;
- (NSString)identifier;
- (id)description;
- (id)handler;
@end

@implementation CSVSUISceneTransition

- (CSVSUISceneTransition)initWithDisappearingScene:(id)a3 appearingScene:(id)a4 handler:(id)a5 identifier:(id)a6 isAtomic:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___CSVSUISceneTransition;
  v17 = -[CSVSUISceneTransition init](&v22, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_disappearingScene, a3);
    objc_storeStrong((id *)&v18->_appearingScene, a4);
    id v19 = [v15 copy];
    id handler = v18->_handler;
    v18->_id handler = v19;

    v18->_isAtomic = a7;
    objc_storeStrong((id *)&v18->_identifier, a6);
  }

  return v18;
}

+ (id)standardTransitionForDisappearingScene:(id)a3 atomic:(BOOL)a4 identifier:(id)a5
{
  BOOL v6 = a4;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000052F4;
  v13[3] = &unk_100024628;
  id v14 = a3;
  id v8 = v14;
  id v9 = a5;
  v10 = objc_retainBlock(v13);
  id v11 = [objc_alloc((Class)a1) initWithDisappearingScene:v8 appearingScene:0 handler:v10 identifier:v9 isAtomic:v6];

  return v11;
}

+ (id)standardTransitionForAppearingScene:(id)a3 atomic:(BOOL)a4 identifier:(id)a5
{
  BOOL v6 = a4;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10000549C;
  v13[3] = &unk_100024628;
  id v14 = a3;
  id v8 = v14;
  id v9 = a5;
  v10 = objc_retainBlock(v13);
  id v11 = [objc_alloc((Class)a1) initWithDisappearingScene:0 appearingScene:v8 handler:v10 identifier:v9 isAtomic:v6];

  return v11;
}

+ (id)transitionForDisappearingScene:(id)a3 atomic:(BOOL)a4 identifier:(id)a5 handler:(id)a6
{
  BOOL v7 = a4;
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = [objc_alloc((Class)a1) initWithDisappearingScene:v12 appearingScene:0 handler:v10 identifier:v11 isAtomic:v7];

  return v13;
}

+ (id)transitionForAppearingScene:(id)a3 atomic:(BOOL)a4 identifier:(id)a5 handler:(id)a6
{
  BOOL v7 = a4;
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = [objc_alloc((Class)a1) initWithDisappearingScene:0 appearingScene:v12 handler:v10 identifier:v11 isAtomic:v7];

  return v13;
}

+ (id)transitionForDisappearingScene:(id)a3 appearingScene:(id)a4 atomic:(BOOL)a5 identifier:(id)a6 handler:(id)a7
{
  BOOL v8 = a5;
  id v12 = a7;
  id v13 = a6;
  id v14 = a4;
  id v15 = a3;
  id v16 = [objc_alloc((Class)a1) initWithDisappearingScene:v15 appearingScene:v14 handler:v12 identifier:v13 isAtomic:v8];

  return v16;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_isAtomic));
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSUIScene identifier](self->_disappearingScene, "identifier"));
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSUIScene identifier](self->_appearingScene, "identifier"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@ %p: isAtomic = %@; disappearingScene = %@; appearingScene = %@; identifier=%@>",
                   v5,
                   self,
                   v6,
                   v7,
                   v8,
                   self->_identifier));

  return v9;
}

- (CSVSUIScene)disappearingScene
{
  return self->_disappearingScene;
}

- (CSVSUIScene)appearingScene
{
  return self->_appearingScene;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (id)handler
{
  return self->_handler;
}

- (BOOL)isAtomic
{
  return self->_isAtomic;
}

- (void).cxx_destruct
{
}

@end