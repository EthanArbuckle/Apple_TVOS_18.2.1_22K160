@interface NESMPathControllerSSIDWatcher
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation NESMPathControllerSSIDWatcher

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v12 = a5;
  if (self) {
    id Property = objc_getProperty(self, v11, 16LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v14 = Property;
  if (v14 != v10)
  {

    goto LABEL_14;
  }

  unsigned int v15 = [v9 isEqualToString:@"status"];

  if (!v15) {
    goto LABEL_14;
  }
  uint64_t v18 = ne_log_obj(v16, v17);
  v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    if (self) {
      id v33 = objc_getProperty(self, v20, 16LL, 1);
    }
    else {
      id v33 = 0LL;
    }
    id v34 = [v33 status];
    v35 = @"Invalid";
    if (v34 == (id)2) {
      v35 = @"Not Available";
    }
    if (v34 == (id)1) {
      v35 = @"Available";
    }
    *(_DWORD *)v37 = 138412290;
    *(void *)&v37[4] = v35;
    v36 = v35;
    _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "SSID status changed to %@", v37, 0xCu);
  }

  if (self) {
    id v22 = objc_getProperty(self, v21, 16LL, 1);
  }
  else {
    id v22 = 0LL;
  }
  if (objc_msgSend(v22, "status", *(_OWORD *)v37) == (id)1)
  {
    if (self)
    {
      self->_hasBeenAssociated = 1;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_parentSession);
      id v26 = objc_getProperty(self, v25, 24LL, 1);
    }

    else
    {
      id WeakRetained = 0LL;
      id v26 = 0LL;
    }

    sub_10008750C(WeakRetained, v26, 1);
LABEL_13:

    goto LABEL_14;
  }

  if (self) {
    id v27 = objc_getProperty(self, v23, 16LL, 1);
  }
  else {
    id v27 = 0LL;
  }
  if ([v27 status] == (id)2 && self && self->_hasBeenAssociated)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_parentSession);
    id v29 = objc_getProperty(self, v28, 24LL, 1);
    sub_10008750C(WeakRetained, v29, 0);
    sub_10008742C((id *)&self->super.isa, v30);
    if (WeakRetained) {
      id v32 = objc_getProperty(WeakRetained, v31, 400LL, 1);
    }
    else {
      id v32 = 0LL;
    }
    [v32 removeObject:self];
    goto LABEL_13;
  }

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NESMPathControllerSSIDWatcher;
  -[NESMPathControllerSSIDWatcher dealloc](&v3, "dealloc");
}

- (void).cxx_destruct
{
}

@end