@interface ContextObject
- (ContextObject)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
@end

@implementation ContextObject

- (ContextObject)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___ContextObject;
  v2 = -[ContextObject init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    dictionary = v2->_dictionary;
    v2->_dictionary = v3;

    v2->_lock._os_unfair_lock_opaque = 0;
  }

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_lock);
  id v6 = -[NSMutableDictionary mutableCopyWithZone:](self->_dictionary, "mutableCopyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  os_unfair_lock_unlock(&self->_lock);
  return v5;
}

- (id)description
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary description](self->_dictionary, "description"));
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void).cxx_destruct
{
}

@end