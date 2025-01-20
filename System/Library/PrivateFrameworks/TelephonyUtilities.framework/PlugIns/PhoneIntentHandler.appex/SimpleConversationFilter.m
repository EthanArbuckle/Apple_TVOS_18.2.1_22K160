@interface SimpleConversationFilter
+ (id)filterForCallGroup:(id)a3;
+ (id)filterForParticipantCount:(unint64_t)a3;
- (BOOL)matches:(id)a3;
- (SimpleConversationFilter)initWithPredicate:(id)a3;
- (id)predicate;
- (void)setPredicate:(id)a3;
@end

@implementation SimpleConversationFilter

- (SimpleConversationFilter)initWithPredicate:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SimpleConversationFilter;
  v5 = -[SimpleConversationFilter init](&v9, "init");
  if (v5)
  {
    id v6 = objc_retainBlock(v4);
    id predicate = v5->_predicate;
    v5->_id predicate = v6;
  }

  return v5;
}

- (BOOL)matches:(id)a3
{
  id v4 = a3;
  v5 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue(-[SimpleConversationFilter predicate](self, "predicate"));
  char v6 = ((uint64_t (**)(void, id))v5)[2](v5, v4);

  return v6;
}

+ (id)filterForCallGroup:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc(&OBJC_CLASS___SimpleConversationFilter);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100005F60;
  v8[3] = &unk_100034678;
  id v9 = v3;
  id v5 = v3;
  char v6 = -[SimpleConversationFilter initWithPredicate:](v4, "initWithPredicate:", v8);

  return v6;
}

+ (id)filterForParticipantCount:(unint64_t)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100006120;
  v4[3] = &unk_100034698;
  v4[4] = a3;
  return  -[SimpleConversationFilter initWithPredicate:]( objc_alloc(&OBJC_CLASS___SimpleConversationFilter),  "initWithPredicate:",  v4);
}

- (id)predicate
{
  return self->_predicate;
}

- (void)setPredicate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end