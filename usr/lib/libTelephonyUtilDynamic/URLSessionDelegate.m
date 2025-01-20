@interface URLSessionDelegate
- (id).cxx_construct;
- (shared_ptr<SessionTaskContext>)getContext:(int64_t)a3;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7;
- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7;
- (void)addCallbackHandler:(shared_ptr<ctu:(int64_t)a4 :Http::HttpRequestCallbackHandler>)a3 for:;
- (void)dealloc;
- (void)removeCallbackFor:(int64_t)a3;
@end

@implementation URLSessionDelegate

- (void)addCallbackHandler:(shared_ptr<ctu:(int64_t)a4 :Http::HttpRequestCallbackHandler>)a3 for:
{
  var1 = a3.var1;
  var0 = a3.var0;
  v7 = (std::__shared_weak_count_vtbl *)operator new(0x30uLL);
  v8 = v7;
  v9 = *(void (__cdecl **)(std::__shared_weak_count *__hidden))var0;
  v10 = (std::__shared_weak_count *)*((void *)var0 + 1);
  if (v10)
  {
    p_shared_weak_owners = (unint64_t *)&v10->__shared_weak_owners_;
    do
      unint64_t v12 = __ldxr(p_shared_weak_owners);
    while (__stxr(v12 + 1, p_shared_weak_owners));
    v7->~__shared_weak_count = v9;
    v7->~__shared_weak_count_0 = (void (__cdecl *)(std::__shared_weak_count *__hidden))v10;
    do
      unint64_t v13 = __ldxr(p_shared_weak_owners);
    while (__stxr(v13 + 1, p_shared_weak_owners));
  }

  else
  {
    v7->~__shared_weak_count = v9;
    v7->~__shared_weak_count_0 = 0LL;
  }

  v7->__on_zero_shared_weak = 0LL;
  v7[1].~__shared_weak_count = 0LL;
  v7->__on_zero_shared = (void (__cdecl *)(std::__shared_count *__hidden))objc_opt_new();
  v8->__get_deleter = (const void *(__cdecl *)(const std::__shared_weak_count *__hidden, const std::type_info *))objc_opt_new();
  v14 = (std::__shared_weak_count *)operator new(0x20uLL);
  v14->__shared_owners_ = 0LL;
  p_shared_owners = (unint64_t *)&v14->__shared_owners_;
  v14->__vftable = (std::__shared_weak_count_vtbl *)off_189E97B38;
  v14->__shared_weak_owners_ = 0LL;
  v14[1].__vftable = v8;
  if (v10) {
    std::__shared_weak_count::__release_weak(v10);
  }
  do
    unint64_t v16 = __ldxr(p_shared_owners);
  while (__stxr(v16 + 1, p_shared_owners));
  p_pair1 = &self->fTaskHandlers.__tree_.__pair1_;
  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> *)self->fTaskHandlers.__tree_.__pair1_.__value_.__left_;
  if (left)
  {
    while (1)
    {
      while (1)
      {
        v19 = left;
        unint64_t v20 = (unint64_t)left[4].__value_.__left_;
        left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> *)v19->__value_.__left_;
        p_pair1 = v19;
        if (!v19->__value_.__left_) {
          goto LABEL_19;
        }
      }

      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> *)v19[1].__value_.__left_;
      if (!left)
      {
        p_pair1 = v19 + 1;
        goto LABEL_19;
      }
    }

    v23 = (unint64_t *)&v14->__shared_owners_;
    do
      unint64_t v24 = __ldaxr(v23);
    while (__stlxr(v24 - 1, v23));
    if (!v24)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }

  else
  {
    v19 = &self->fTaskHandlers.__tree_.__pair1_;
LABEL_19:
    v21 = (uint64_t *)operator new(0x38uLL);
    v21[4] = (uint64_t)var1;
    v21[5] = (uint64_t)v8;
    v21[6] = (uint64_t)v14;
    uint64_t *v21 = 0LL;
    v21[1] = 0LL;
    v21[2] = (uint64_t)v19;
    p_pair1->__value_.__left_ = v21;
    v22 = *(void **)self->fTaskHandlers.__tree_.__begin_node_;
    if (v22)
    {
      self->fTaskHandlers.__tree_.__begin_node_ = v22;
      v21 = (uint64_t *)p_pair1->__value_.__left_;
    }

    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>( (uint64_t *)self->fTaskHandlers.__tree_.__pair1_.__value_.__left_,  v21);
    ++self->fTaskHandlers.__tree_.__pair3_.__value_;
  }

  if (v14)
  {
    v25 = (unint64_t *)&v14->__shared_owners_;
    do
      unint64_t v26 = __ldaxr(v25);
    while (__stlxr(v26 - 1, v25));
    if (!v26)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }

- (void)removeCallbackFor:(int64_t)a3
{
  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> *)self->fTaskHandlers.__tree_.__pair1_.__value_.__left_;
  if (!left) {
    return;
  }
  p_pair1 = &self->fTaskHandlers.__tree_.__pair1_;
  v5 = (char *)self->fTaskHandlers.__tree_.__pair1_.__value_.__left_;
  do
  {
    unint64_t v6 = *((void *)v5 + 4);
    BOOL v7 = v6 >= a3;
    if (v6 >= a3) {
      v8 = (char **)v5;
    }
    else {
      v8 = (char **)(v5 + 8);
    }
    if (v7) {
      p_pair1 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> *)v5;
    }
    v5 = *v8;
  }

  while (*v8);
  v9 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> *)p_pair1[1].__value_.__left_;
  if (v9)
  {
    do
    {
      v10 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> **)v9;
      v9 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> *)v9->__value_.__left_;
    }

    while (v9);
  }

  else
  {
    v11 = p_pair1;
    do
    {
      v10 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> **)v11[2].__value_.__left_;
      BOOL v31 = *v10 == v11;
      v11 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> *)v10;
    }

    while (!v31);
  }

  if (self->fTaskHandlers.__tree_.__begin_node_ == p_pair1) {
    self->fTaskHandlers.__tree_.__begin_node_ = v10;
  }
  --self->fTaskHandlers.__tree_.__pair3_.__value_;
  unint64_t v12 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> *)p_pair1->__value_.__left_;
  unint64_t v13 = p_pair1;
  if (p_pair1->__value_.__left_)
  {
    v14 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> *)p_pair1[1].__value_.__left_;
    if (!v14)
    {
      unint64_t v13 = p_pair1;
      goto LABEL_27;
    }

    do
    {
      unint64_t v13 = v14;
      v14 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> *)v14->__value_.__left_;
    }

    while (v14);
  }

  unint64_t v12 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> *)v13[1].__value_.__left_;
  if (v12)
  {
LABEL_27:
    int v15 = 0;
    v12[2].__value_.__left_ = v13[2].__value_.__left_;
    goto LABEL_28;
  }

  int v15 = 1;
LABEL_28:
  unint64_t v16 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> **)v13[2].__value_.__left_;
  v17 = *v16;
  if (*v16 == v13)
  {
    *unint64_t v16 = v12;
    if (v13 == left)
    {
      v17 = 0LL;
      left = v12;
    }

    else
    {
      v17 = v16[1];
    }
  }

  else
  {
    v16[1] = v12;
  }

  int left_low = LOBYTE(v13[3].__value_.__left_);
  if (v13 != p_pair1)
  {
    v19 = p_pair1[2].__value_.__left_;
    v13[2].__value_.__left_ = v19;
    *((void *)v19 + (*(void *)p_pair1[2].__value_.__left_ != (void)p_pair1)) = v13;
    v21 = p_pair1->__value_.__left_;
    unint64_t v20 = p_pair1[1].__value_.__left_;
    v21[2] = v13;
    v13->__value_.__left_ = v21;
    v13[1].__value_.__left_ = v20;
    if (v20) {
      *((void *)v20 + 2) = v13;
    }
    LOBYTE(v13[3].__value_.__left_) = p_pair1[3].__value_.__left_;
    if (left == p_pair1) {
      left = v13;
    }
  }

  if (!left_low || !left) {
    goto LABEL_92;
  }
  if (!v15)
  {
    LOBYTE(v12[3].__value_.__left_) = 1;
    goto LABEL_92;
  }

  while (1)
  {
    v22 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> *)v17[2].__value_.__left_;
    if (v22->__value_.__left_ != v17) {
      break;
    }
    if (!LOBYTE(v17[3].__value_.__left_))
    {
      LOBYTE(v17[3].__value_.__left_) = 1;
      LOBYTE(v22[3].__value_.__left_) = 0;
      v28 = v17[1].__value_.__left_;
      v22->__value_.__left_ = v28;
      if (v28) {
        v28[2] = v22;
      }
      v17[2].__value_.__left_ = v22[2].__value_.__left_;
      *((void *)v22[2].__value_.__left_ + (*(void *)v22[2].__value_.__left_ != (void)v22)) = v17;
      v17[1].__value_.__left_ = v22;
      v22[2].__value_.__left_ = v17;
      if (left == v22) {
        left = v17;
      }
      v17 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> *)v22->__value_.__left_;
    }

    v29 = v17->__value_.__left_;
    if (v17->__value_.__left_ && !v29[24]) {
      goto LABEL_87;
    }
    v30 = (uint64_t *)v17[1].__value_.__left_;
    if (v30 && !*((_BYTE *)v30 + 24))
    {
      if (v29 && !v29[24])
      {
LABEL_87:
        v30 = (uint64_t *)v17;
      }

      else
      {
        *((_BYTE *)v30 + 24) = 1;
        LOBYTE(v17[3].__value_.__left_) = 0;
        uint64_t v36 = *v30;
        v17[1].__value_.__left_ = (void *)*v30;
        if (v36) {
          *(void *)(v36 + 16) = v17;
        }
        v30[2] = (uint64_t)v17[2].__value_.__left_;
        *((void *)v17[2].__value_.__left_ + (*(void *)v17[2].__value_.__left_ != (void)v17)) = v30;
        uint64_t *v30 = (uint64_t)v17;
        v17[2].__value_.__left_ = v30;
        v29 = v17;
      }

      uint64_t v33 = v30[2];
      *((_BYTE *)v30 + 24) = *(_BYTE *)(v33 + 24);
      *(_BYTE *)(v33 + 24) = 1;
      v29[24] = 1;
      v34 = *(uint64_t **)v33;
      uint64_t v37 = *(void *)(*(void *)v33 + 8LL);
      *(void *)uint64_t v33 = v37;
      if (v37) {
        *(void *)(v37 + 16) = v33;
      }
      v34[2] = *(void *)(v33 + 16);
      *(void *)(*(void *)(v33 + 16) + 8LL * (**(void **)(v33 + 16) != v33)) = v34;
      v34[1] = v33;
      goto LABEL_91;
    }

    LOBYTE(v17[3].__value_.__left_) = 0;
    v27 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> *)v17[2].__value_.__left_;
    if (LOBYTE(v27[3].__value_.__left_)) {
      BOOL v31 = v27 == left;
    }
    else {
      BOOL v31 = 1;
    }
    if (v31) {
      goto LABEL_72;
    }
LABEL_69:
    v17 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> *)*((void *)v27[2].__value_.__left_ + (*(void *)v27[2].__value_.__left_ == (void)v27));
  }

  if (!LOBYTE(v17[3].__value_.__left_))
  {
    LOBYTE(v17[3].__value_.__left_) = 1;
    LOBYTE(v22[3].__value_.__left_) = 0;
    v23 = (uint64_t *)v22[1].__value_.__left_;
    uint64_t v24 = *v23;
    v22[1].__value_.__left_ = (void *)*v23;
    if (v24) {
      *(void *)(v24 + 16) = v22;
    }
    v23[2] = (uint64_t)v22[2].__value_.__left_;
    *((void *)v22[2].__value_.__left_ + (*(void *)v22[2].__value_.__left_ != (void)v22)) = v23;
    uint64_t *v23 = (uint64_t)v22;
    v22[2].__value_.__left_ = v23;
    if (left == v17->__value_.__left_) {
      left = v17;
    }
    v17 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> *)*((void *)v17->__value_.__left_ + 1);
  }

  v25.__value_.__left_ = v17->__value_.__left_;
  if (!v17->__value_.__left_ || *((_BYTE *)v25.__value_.__left_ + 24))
  {
    unint64_t v26 = v17[1].__value_.__left_;
    if (v26 && !v26[24]) {
      goto LABEL_78;
    }
    LOBYTE(v17[3].__value_.__left_) = 0;
    v27 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> *)v17[2].__value_.__left_;
    if (v27 == left)
    {
      v27 = left;
LABEL_72:
      LOBYTE(v27[3].__value_.__left_) = 1;
      goto LABEL_92;
    }

    if (!LOBYTE(v27[3].__value_.__left_)) {
      goto LABEL_72;
    }
    goto LABEL_69;
  }

  unint64_t v26 = v17[1].__value_.__left_;
  if (v26 && !v26[24])
  {
LABEL_78:
    v25.__value_.__left_ = v17;
  }

  else
  {
    *((_BYTE *)v25.__value_.__left_ + 24) = 1;
    LOBYTE(v17[3].__value_.__left_) = 0;
    v32 = (void *)*((void *)v25.__value_.__left_ + 1);
    v17->__value_.__left_ = v32;
    if (v32) {
      v32[2] = v17;
    }
    *((__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> *)v25.__value_.__left_
    + 2) = v17[2];
    *((__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> *)v17[2].__value_.__left_
    + (*(void *)v17[2].__value_.__left_ != (void)v17)) = v25;
    *((void *)v25.__value_.__left_ + 1) = v17;
    v17[2].__value_.__left_ = v25.__value_.__left_;
    unint64_t v26 = v17;
  }

  uint64_t v33 = *((void *)v25.__value_.__left_ + 2);
  *((_BYTE *)v25.__value_.__left_ + 24) = *(_BYTE *)(v33 + 24);
  *(_BYTE *)(v33 + 24) = 1;
  v26[24] = 1;
  v34 = *(uint64_t **)(v33 + 8);
  uint64_t v35 = *v34;
  *(void *)(v33 + 8) = *v34;
  if (v35) {
    *(void *)(v35 + 16) = v33;
  }
  v34[2] = *(void *)(v33 + 16);
  *(void *)(*(void *)(v33 + 16) + 8LL * (**(void **)(v33 + 16) != v33)) = v34;
  uint64_t *v34 = v33;
LABEL_91:
  *(void *)(v33 + 16) = v34;
LABEL_92:
  std::shared_ptr<xpc::object>::~shared_ptr[abi:ne180100]((uint64_t)&p_pair1[5]);
  operator delete(p_pair1);
}

- (void)dealloc
{
  p_pair1 = &self->fTaskHandlers.__tree_.__pair1_;
  std::__tree<std::__value_type<unsigned long,std::shared_ptr<SessionTaskContext>>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,std::shared_ptr<SessionTaskContext>>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,std::shared_ptr<SessionTaskContext>>>>::destroy((void *)self->fTaskHandlers.__tree_.__pair1_.__value_.__left_);
  self->fTaskHandlers.__tree_.__begin_node_ = p_pair1;
  self->fTaskHandlers.__tree_.__pair3_.__value_ = 0LL;
  p_pair1->__value_.__left_ = 0LL;
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___URLSessionDelegate;
  -[URLSessionDelegate dealloc](&v4, sel_dealloc);
}

- (shared_ptr<SessionTaskContext>)getContext:(int64_t)a3
{
  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> *)self->fTaskHandlers.__tree_.__pair1_.__value_.__left_;
  p_pair1 = &self->fTaskHandlers.__tree_.__pair1_;
  v5 = left;
  if (!left) {
    goto LABEL_12;
  }
  BOOL v7 = p_pair1;
  do
  {
    unint64_t v8 = (unint64_t)v5[4].__value_.__left_;
    BOOL v9 = v8 >= a3;
    if (v8 >= a3) {
      v10 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> **)v5;
    }
    else {
      v10 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<SessionTaskContext>>, void *>>> **)&v5[1];
    }
    if (v9) {
      BOOL v7 = v5;
    }
    v5 = *v10;
  }

  while (*v10);
  if (v7 != p_pair1 && v7[4].__value_.__left_ <= (void *)a3)
  {
    unint64_t v12 = v7[5].__value_.__left_;
    v11 = (char *)v7[6].__value_.__left_;
    void *v3 = v12;
    v3[1] = v11;
    if (v11)
    {
      unint64_t v13 = (unint64_t *)(v11 + 8);
      do
        unint64_t v14 = __ldxr(v13);
      while (__stxr(v14 + 1, v13));
    }
  }

  else
  {
LABEL_12:
    void *v3 = 0LL;
    v3[1] = 0LL;
  }

  result.var1 = (__shared_weak_count *)a2;
  result.var0 = (SessionTaskContext *)p_pair1;
  return result;
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  unint64_t v14 = (std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL;
  uint64_t v10 = objc_msgSend(a4, "taskIdentifier", a3);
  if (self)
  {
    -[URLSessionDelegate getContext:](self, "getContext:", v10);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (ctu::Http::HttpResponseConcrete *)operator new(0x68uLL);
      ctu::Http::HttpResponseConcrete::HttpResponseConcrete(v11, (NSHTTPURLResponse *)a5);
      *((_WORD *)v11 + 48) = [a4 _TLSNegotiatedCipherSuite];
      std::shared_ptr<ctu::Http::HttpResponse>::reset[abi:ne180100]<ctu::Http::HttpResponseConcrete,void>( (void *)0xAAAAAAAAAAAAAACALL,  (uint64_t)v11);
    }
  }

  else
  {
    unint64_t v14 = 0LL;
  }

  (*((void (**)(id, uint64_t))a6 + 2))(a6, 1LL);
  if (v14)
  {
    p_shared_owners = (unint64_t *)&v14->__shared_owners_;
    do
      unint64_t v13 = __ldaxr(p_shared_owners);
    while (__stlxr(v13 - 1, p_shared_owners));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  v44 = (void *)0xAAAAAAAAAAAAAAAALL;
  unint64_t v45 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v7 = objc_msgSend(a4, "taskIdentifier", a3);
  if (!self)
  {
    v44 = 0LL;
    unint64_t v45 = 0LL;
    goto LABEL_9;
  }

  -[URLSessionDelegate getContext:](self, "getContext:", v7);
  unint64_t v8 = (std::__shared_weak_count *)v44[1];
  if (!v8) {
    goto LABEL_9;
  }
  BOOL v9 = std::__shared_weak_count::lock(v8);
  v43 = v9;
  if (!v9) {
    goto LABEL_9;
  }
  uint64_t v10 = *v44;
  uint64_t v42 = v10;
  if (!v10)
  {
    v17 = v9;
LABEL_43:
    p_shared_owners = (unint64_t *)&v17->__shared_owners_;
    do
      unint64_t v37 = __ldaxr(p_shared_owners);
    while (__stlxr(v37 - 1, p_shared_owners));
    if (!v37)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }

    goto LABEL_9;
  }

  v11 = v44;
  unint64_t v13 = v44 + 4;
  unint64_t v12 = (const void *)v44[4];
  if (v12)
  {
    unint64_t v41 = 0xAAAAAAAAAAAAAAAALL;
  }

  else
  {
    v18 = operator new(0x68uLL);
    *(void *)v18 = off_189E969F8;
    v18[2] = 0;
    *((void *)v18 + 4) = 0LL;
    *((void *)v18 + 3) = 0LL;
    *((void *)v18 + 2) = v18 + 6;
    v18[10] = -1;
    *((_OWORD *)v18 + 3) = 0u;
    *((_OWORD *)v18 + 4) = 0u;
    *((_OWORD *)v18 + 5) = 0u;
    *((_WORD *)v18 + 48) = -1;
    std::shared_ptr<ctu::Http::HttpResponse>::reset[abi:ne180100]<ctu::Http::HttpResponseConcrete,void>( v13,  (uint64_t)v18);
    v11 = v44;
    unint64_t v12 = (const void *)v44[4];
    if (!v12)
    {
LABEL_25:
      v40 = 0LL;
      unint64_t v41 = 0LL;
      goto LABEL_29;
    }
  }

  if (!v19) {
    goto LABEL_25;
  }
  unint64_t v20 = v19;
  unint64_t v21 = v11[5];
  v40 = v19;
  unint64_t v41 = v21;
  if (v21)
  {
    v22 = (unint64_t *)(v21 + 8);
    do
      unint64_t v23 = __ldxr(v22);
    while (__stxr(v23 + 1, v22));
  }

  if (a5)
  {
    uint64_t v24 = (void *)[a5 domain];
    if ([v24 isEqualToString:*MEMORY[0x189607740]]
      && (uint64_t v25 = [a5 code], (unint64_t)(v25 + 1009) <= 9))
    {
      int v26 = *((_DWORD *)&unk_186636128 + v25 + 1009);
    }

    else
    {
      int v26 = 0;
    }

    *((_DWORD *)v20 + 2) = v26;
    v20[6] = (const void *)[a5 code];
    id v46 = a5;
    ctu::cf::CFSharedRef<__CFError>::operator=(v20 + 11, (CFTypeRef *)&v46);
  }

  else
  {
    id v46 = (id)v11[2];
    ctu::cf::CFSharedRef<__CFData const>::operator=(v19 + 10, (CFTypeRef *)&v46);
    *((_DWORD *)v20 + 2) = 1;
  }

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  unint64_t v14 = (std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL;
  uint64_t v7 = objc_msgSend(a4, "taskIdentifier", a3);
  if (self)
  {
    -[URLSessionDelegate getContext:](self, "getContext:", v7);
    if (a5)
    {
      [MEMORY[0xAAAAAAAAAAAAAABA] appendData:a5];
      if (MEMORY[0xAAAAAAAAAAAAAAB2])
      {
        unint64_t v8 = std::__shared_weak_count::lock(MEMORY[0xAAAAAAAAAAAAAAB2]);
        if (v8)
        {
          BOOL v9 = v8;
          if (MEMORY[0xAAAAAAAAAAAAAAAA]) {
            (*(void (**)(void, uint64_t, uint64_t))(*MEMORY[0xAAAAAAAAAAAAAAAA] + 32))( MEMORY[0xAAAAAAAAAAAAAAAA],  objc_msgSend(a5, "length", MEMORY[0xAAAAAAAAAAAAAAAA], v8),  objc_msgSend(MEMORY[0xAAAAAAAAAAAAAABA], "length"));
          }
          p_shared_owners = (unint64_t *)&v9->__shared_owners_;
          do
            unint64_t v11 = __ldaxr(p_shared_owners);
          while (__stlxr(v11 - 1, p_shared_owners));
          if (!v11)
          {
            ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
            std::__shared_weak_count::__release_weak(v9);
          }
        }
      }
    }
  }

  else
  {
    unint64_t v14 = 0LL;
  }

  if (v14)
  {
    unint64_t v12 = (unint64_t *)&v14->__shared_owners_;
    do
      unint64_t v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }

- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7
{
  v18 = (std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL;
  uint64_t v11 = objc_msgSend(a4, "taskIdentifier", a3);
  if (self)
  {
    -[URLSessionDelegate getContext:](self, "getContext:", v11);
    if (MEMORY[0xAAAAAAAAAAAAAAB2])
    {
      unint64_t v12 = std::__shared_weak_count::lock(MEMORY[0xAAAAAAAAAAAAAAB2]);
      if (v12)
      {
        unint64_t v13 = v12;
        if (MEMORY[0xAAAAAAAAAAAAAAAA]) {
          (*(void (**)(void, int64_t, int64_t, int64_t))(*MEMORY[0xAAAAAAAAAAAAAAAA]
        }
                                                                                         + 40LL))( MEMORY[0xAAAAAAAAAAAAAAAA],  a5,  a6,  a7);
        p_shared_owners = (unint64_t *)&v13->__shared_owners_;
        do
          unint64_t v15 = __ldaxr(p_shared_owners);
        while (__stlxr(v15 - 1, p_shared_owners));
        if (!v15)
        {
          ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
          std::__shared_weak_count::__release_weak(v13);
        }
      }
    }
  }

  else
  {
    v18 = 0LL;
  }

  if (v18)
  {
    unint64_t v16 = (unint64_t *)&v18->__shared_owners_;
    do
      unint64_t v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  theDict[1] = *(CFDictionaryRef *)MEMORY[0x1895F89C0];
  v40 = (uint64_t *)0xAAAAAAAAAAAAAAAALL;
  unint64_t v41 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v9 = objc_msgSend(a4, "taskIdentifier", a3);
  if (!self)
  {
    Value = 0LL;
    v40 = 0LL;
    unint64_t v41 = 0LL;
LABEL_29:
    uint64_t v18 = 1LL;
    goto LABEL_30;
  }

  -[URLSessionDelegate getContext:](self, "getContext:", v9);
  uint64_t v10 = (void *)objc_msgSend((id)objc_msgSend(a5, "protectionSpace"), "authenticationMethod");
  if ([v10 isEqualToString:*MEMORY[0x189607728]])
  {
    uint64_t v11 = (std::__shared_weak_count *)v40[1];
    if (v11)
    {
      unint64_t v12 = std::__shared_weak_count::lock(v11);
      v39 = v12;
      if (v12)
      {
        unint64_t v13 = v12;
        uint64_t v14 = *v40;
        uint64_t v38 = v14;
        if (!v14)
        {
          Value = 0LL;
          uint64_t v18 = 1LL;
          goto LABEL_40;
        }

        theDict[0] = (CFDictionaryRef)0xAAAAAAAAAAAAAAAALL;
        (*(void (**)(CFDictionaryRef *__return_ptr))(*(void *)v14 + 48LL))(theDict);
        unint64_t v15 = ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get;
        if (!theDict[0]) {
          unint64_t v15 = 0LL;
        }
        if (v15)
        {
          Value = CFDictionaryGetValue(theDict[0], (const void *)*MEMORY[0x18960BBF8]);
          if (!Value)
          {
LABEL_38:
            uint64_t v18 = 1LL;
            goto LABEL_39;
          }

          CFTypeID TypeID = SecIdentityGetTypeID();
          if (TypeID == CFGetTypeID(Value))
          {
            Value = (const void *)[MEMORY[0x189607A60] credentialWithIdentity:Value certificates:0 persistence:0];
            uint64_t v18 = 0LL;
LABEL_39:
            ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)theDict);
LABEL_40:
            p_shared_owners = (unint64_t *)&v13->__shared_owners_;
            do
              unint64_t v34 = __ldaxr(p_shared_owners);
            while (__stlxr(v34 - 1, p_shared_owners));
            goto LABEL_48;
          }
        }

        Value = 0LL;
        goto LABEL_38;
      }
    }

    goto LABEL_28;
  }

  if (![v10 isEqualToString:*MEMORY[0x189607738]]
    || (v19 = (std::__shared_weak_count *)v40[1]) == 0LL
    || (unint64_t v20 = std::__shared_weak_count::lock(v19), (v39 = v20) == 0LL))
  {
LABEL_28:
    Value = 0LL;
    goto LABEL_29;
  }

  unint64_t v13 = v20;
  uint64_t v21 = *v40;
  uint64_t v38 = v21;
  if (!v21) {
    goto LABEL_45;
  }
  (*(void (**)(CFDictionaryRef *__return_ptr, uint64_t))(*(void *)v21 + 56LL))(theDict, v21);
  if (theDict[0]) {
    v22 = ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::get;
  }
  else {
    v22 = 0LL;
  }
  if (!v22)
  {
    ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::~SharedRef((const void **)theDict);
    goto LABEL_45;
  }

  (*(void (**)(CFArrayRef *__return_ptr, uint64_t))(*(void *)v21 + 56LL))(&theArray, v21);
  CFIndex Count = CFArrayGetCount(theArray);
  ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::~SharedRef((const void **)&theArray);
  ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::~SharedRef((const void **)theDict);
  if (!Count)
  {
LABEL_45:
    Value = 0LL;
    uint64_t v18 = 1LL;
    goto LABEL_46;
  }

  uint64_t v24 = (__SecTrust *)objc_msgSend((id)objc_msgSend(a5, "protectionSpace"), "serverTrust");
  if (((*(uint64_t (**)(uint64_t, __SecTrust *))(*(void *)v21 + 64LL))(v21, v24) & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG))
    {
      LOWORD(theDict[0]) = 0;
      v27 = (os_log_s *)MEMORY[0x1895F8DA0];
      v28 = "DEBUG: Failed to validate certs.";
      uint32_t v29 = 2;
      goto LABEL_54;
    }

    goto LABEL_45;
  }

  (*(void (**)(CFDictionaryRef *__return_ptr, uint64_t))(*(void *)v21 + 56LL))(theDict, v21);
  OSStatus v25 = SecTrustSetAnchorCertificates(v24, theDict[0]);
  ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::~SharedRef((const void **)theDict);
  if (v25) {
    goto LABEL_45;
  }
  LODWORD(theArray) = -1431655766;
  int v26 = MEMORY[0x186E3BE94](v24, &theArray);
  if (v26)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG))
    {
      LODWORD(theDict[0]) = 67109120;
      HIDWORD(theDict[0]) = v26;
      v27 = (os_log_s *)MEMORY[0x1895F8DA0];
      v28 = "Server pinned certs' trust evaluation failed due to STATUS code: %d";
LABEL_27:
      uint32_t v29 = 8;
LABEL_54:
      _os_log_debug_impl(&dword_1865C1000, v27, OS_LOG_TYPE_DEBUG, v28, (uint8_t *)theDict, v29);
      goto LABEL_45;
    }

    goto LABEL_45;
  }

  int v36 = (int)theArray;
  if ((_DWORD)theArray != 4 && (_DWORD)theArray != 1)
  {
    if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG)) {
      goto LABEL_45;
    }
    LODWORD(theDict[0]) = 67109120;
    HIDWORD(theDict[0]) = v36;
    v27 = (os_log_s *)MEMORY[0x1895F8DA0];
    v28 = "DEBUG: Server pinned certs' trust evaluation failed due to RESULT code: %u";
    goto LABEL_27;
  }

  Value = (const void *)objc_msgSend( MEMORY[0x189607A60],  "credentialForTrust:",  objc_msgSend((id)objc_msgSend(a5, "protectionSpace"), "serverTrust"));
  uint64_t v18 = 0LL;
LABEL_46:
  unint64_t v35 = (unint64_t *)&v13->__shared_owners_;
  do
    unint64_t v34 = __ldaxr(v35);
  while (__stlxr(v34 - 1, v35));
LABEL_48:
  if (!v34)
  {
    ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
    std::__shared_weak_count::__release_weak(v13);
  }

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  v19 = (std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL;
  uint64_t v11 = objc_msgSend(a4, "taskIdentifier", a3);
  if (self)
  {
    -[URLSessionDelegate getContext:](self, "getContext:", v11);
    if (MEMORY[0xAAAAAAAAAAAAAAB2] && (unint64_t v12 = std::__shared_weak_count::lock(MEMORY[0xAAAAAAAAAAAAAAB2])) != 0LL)
    {
      unint64_t v13 = v12;
      if (MEMORY[0xAAAAAAAAAAAAAAAA]) {
        uint64_t v14 = (*(uint64_t (**)(void, id, id))(*MEMORY[0xAAAAAAAAAAAAAAAA] + 24LL))( MEMORY[0xAAAAAAAAAAAAAAAA],  a6,  a5);
      }
      else {
        uint64_t v14 = 0LL;
      }
      p_shared_owners = (unint64_t *)&v13->__shared_owners_;
      do
        unint64_t v16 = __ldaxr(p_shared_owners);
      while (__stlxr(v16 - 1, p_shared_owners));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
        std::__shared_weak_count::__release_weak(v13);
      }
    }

    else
    {
      uint64_t v14 = 0LL;
    }
  }

  else
  {
    uint64_t v14 = 0LL;
    v19 = 0LL;
  }

  (*((void (**)(id, uint64_t))a7 + 2))(a7, v14);
  if (v19)
  {
    unint64_t v17 = (unint64_t *)&v19->__shared_owners_;
    do
      unint64_t v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
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