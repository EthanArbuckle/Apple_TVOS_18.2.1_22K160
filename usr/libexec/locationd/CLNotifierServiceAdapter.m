@interface CLNotifierServiceAdapter
- (CLNotifierBase)notifier;
- (CLNotifierServiceAdapter)init;
- (NSString)debugDescription;
- (id).cxx_construct;
- (int)notifierClientNumForCoparty:(id)a3;
- (void)forget:(id)a3;
- (void)invalidate;
- (void)register:(id)a3 forNotification:(int)a4 registrationInfo:(id)a5;
- (void)setAdaptedNotifier:(CLNotifierBase *)a3;
- (void)unregister:(id)a3 forNotification:(int)a4;
@end

@implementation CLNotifierServiceAdapter

- (CLNotifierServiceAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLNotifierServiceAdapter;
  return -[CLNotifierServiceAdapter initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLNotifierServiceProtocol,  &OBJC_PROTOCOL___CLNotifierServiceClientProtocol);
}

- (void)setAdaptedNotifier:(CLNotifierBase *)a3
{
  if (self->_notifier) {
    sub_10127D22C();
  }
  if (a3)
  {
    self->_notifier = a3;
  }

- (void)invalidate
{
  self->_notifier = 0LL;
}

- (void)register:(id)a3 forNotification:(int)a4 registrationInfo:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  objc_msgSend(objc_msgSend(-[CLNotifierServiceAdapter universe](self, "universe"), "silo"), "assertInside");
  (*((void (**)(CLNotifierBase *, void, uint64_t, id))self->_notifier->var0 + 5))( self->_notifier,  -[CLNotifierServiceAdapter notifierClientNumForCoparty:](self, "notifierClientNumForCoparty:", a3),  v6,  a5);
}

- (void)unregister:(id)a3 forNotification:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  objc_msgSend(objc_msgSend(-[CLNotifierServiceAdapter universe](self, "universe"), "silo"), "assertInside");
  (*((void (**)(CLNotifierBase *, void, uint64_t))self->_notifier->var0 + 7))( self->_notifier,  -[CLNotifierServiceAdapter notifierClientNumForCoparty:](self, "notifierClientNumForCoparty:", a3),  v4);
}

- (void)forget:(id)a3
{
  left = (char *)self->_clients.__tree_.__pair1_.__value_.__left_;
  if (left)
  {
    p_pair1 = &self->_clients.__tree_.__pair1_;
    do
    {
      unint64_t v7 = *((void *)left + 4);
      BOOL v8 = v7 >= (unint64_t)a3;
      else {
        v9 = (char **)(left + 8);
      }
      if (v8) {
        p_pair1 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, int>, void *>>> *)left;
      }
      left = *v9;
    }

    while (*v9);
    if (p_pair1 != &self->_clients.__tree_.__pair1_ && p_pair1[4].__value_.__left_ <= a3)
    {
      (*((void (**)(CLNotifierBase *, void))self->_notifier->var0 + 4))( self->_notifier,  LODWORD(p_pair1[5].__value_.__left_));
      sub_1000087E8((uint64_t **)&self->_clients, (uint64_t *)p_pair1);
      operator delete(p_pair1);
    }
  }

- (int)notifierClientNumForCoparty:(id)a3
{
  notifier = self->_notifier;
  if (!notifier) {
    sub_10127D398();
  }
  p_clients = &self->_clients;
  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, int>, void *>>> *)p_clients->__tree_.__pair1_.__value_.__left_;
  if (!left) {
    goto LABEL_13;
  }
  p_pair1 = &p_clients->__tree_.__pair1_;
  do
  {
    unint64_t v9 = (unint64_t)left[4].__value_.__left_;
    BOOL v10 = v9 >= (unint64_t)a3;
    else {
      v11 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, int>, void *>>> **)&left[1];
    }
    if (v10) {
      p_pair1 = left;
    }
    left = *v11;
  }

  while (*v11);
  if (p_pair1 != &p_clients->__tree_.__pair1_ && p_pair1[4].__value_.__left_ <= a3) {
    return (int)p_pair1[5].__value_.__left_;
  }
LABEL_13:
  int v12 = (*((uint64_t (**)(CLNotifierBase *, id))notifier->var0 + 3))(notifier, a3);
  id v14 = a3;
  v15 = &v14;
  *((_DWORD *)sub_100FBE544((uint64_t **)p_clients, (unint64_t *)&v14, (uint64_t)&unk_1012CF090, &v15) + 10) = v12;
  return v12;
}

- (NSString)debugDescription
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___CLNotifierServiceAdapter;
  objc_super v3 = +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"%@\nClientIntegerMap: (\n"),  -[CLNotifierServiceAdapter debugDescription](&v10, "debugDescription");
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, int>, void *>>> *)self->_clients.__tree_.__begin_node_;
  if (begin_node != &self->_clients.__tree_.__pair1_)
  {
    char v5 = 0;
    do
    {
      if ((v5 & 1) != 0) {
        -[NSMutableString appendString:](v3, "appendString:", @",\n");
      }
      -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"%p = %d",  begin_node[4].__value_.__left_,  LODWORD(begin_node[5].__value_.__left_));
      left = (CLNotifierServiceAdapter *)begin_node[1].__value_.__left_;
      if (left)
      {
        do
        {
          unint64_t v7 = left;
          left = *(CLNotifierServiceAdapter **)left->CLIntersiloService_opaque;
        }

        while (left);
      }

      else
      {
        do
        {
          unint64_t v7 = (CLNotifierServiceAdapter *)begin_node[2].__value_.__left_;
          BOOL v8 = *(void *)v7->CLIntersiloService_opaque == (void)begin_node;
          begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, int>, void *>>> *)v7;
        }

        while (!v8);
      }

      char v5 = 1;
      begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, int>, void *>>> *)v7;
    }

    while (v7 != (CLNotifierServiceAdapter *)&self->_clients.__tree_.__pair1_);
  }

  -[NSMutableString appendString:](v3, "appendString:", @"\n\n"));
  return &v3->super;
}

- (CLNotifierBase)notifier
{
  return self->_notifier;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 3) = 0LL;
  *((void *)self + 2) = 0LL;
  *((void *)self + 1) = (char *)self + 16;
  return self;
}

@end