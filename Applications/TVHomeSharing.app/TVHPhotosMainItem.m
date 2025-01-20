@interface TVHPhotosMainItem
+ (TVHPhotosMainItem)new;
+ (id)_titleForType:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)title;
- (TVHPhotosMainItem)init;
- (TVHPhotosMainItem)initWithType:(unint64_t)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)type;
@end

@implementation TVHPhotosMainItem

+ (TVHPhotosMainItem)new
{
  return 0LL;
}

- (TVHPhotosMainItem)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v4);

  return 0LL;
}

- (TVHPhotosMainItem)initWithType:(unint64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TVHPhotosMainItem;
  v4 = -[TVHPhotosMainItem init](&v10, "init");
  v5 = v4;
  if (v4)
  {
    v4->_type = a3;
    id v6 = [(id)objc_opt_class(v4) _titleForType:a3];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    title = v5->_title;
    v5->_title = (NSString *)v7;
  }

  return v5;
}

- (unint64_t)hash
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BSHashBuilder builder](&OBJC_CLASS___BSHashBuilder, "builder"));
  id v4 = objc_msgSend(v3, "appendUnsignedInteger:", -[TVHPhotosMainItem type](self, "type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPhotosMainItem title](self, "title"));
  id v6 = [v3 appendObject:v5];

  id v7 = [v3 hash];
  return (unint64_t)v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = +[BSEqualsBuilder builderWithObject:ofExpectedClass:]( &OBJC_CLASS___BSEqualsBuilder,  "builderWithObject:ofExpectedClass:",  v4,  objc_opt_class(&OBJC_CLASS___TVHPhotosMainItem));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  unint64_t v7 = -[TVHPhotosMainItem type](self, "type");
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10002026C;
  v19[3] = &unk_1000FD6C0;
  id v8 = v4;
  id v20 = v8;
  id v9 = [v6 appendUnsignedInteger:v7 counterpart:v19];
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPhotosMainItem title](self, "title"));
  v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472LL;
  v16 = sub_100020274;
  v17 = &unk_1000FD6E8;
  id v18 = v8;
  id v11 = v8;
  id v12 = [v6 appendObject:v10 counterpart:&v14];

  LOBYTE(v10) = objc_msgSend(v6, "isEqual", v14, v15, v16, v17);
  return (char)v10;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  id v4 = objc_msgSend(v3, "appendUnsignedInteger:withName:", -[TVHPhotosMainItem type](self, "type"), @"type");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPhotosMainItem title](self, "title"));
  id v6 = [v3 appendObject:v5 withName:@"title"];

  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);
  return v7;
}

+ (id)_titleForType:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      id v4 = v3;
      v5 = @"PHOTOS_TITLE";
      goto LABEL_7;
    case 1uLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      id v4 = v3;
      v5 = @"EVENTS_TITLE";
      goto LABEL_7;
    case 2uLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      id v4 = v3;
      v5 = @"FACES_TITLE";
      goto LABEL_7;
    case 3uLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      id v4 = v3;
      v5 = @"PHOTOS_ALBUMS_TITLE";
LABEL_7:
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedStringForKey:v5 value:0 table:0]);

      break;
    default:
      id v6 = 0LL;
      break;
  }

  return v6;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)title
{
  return self->_title;
}

- (void).cxx_destruct
{
}

@end