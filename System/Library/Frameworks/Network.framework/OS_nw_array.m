@interface OS_nw_array
- (id)description;
- (id)redactedDescription;
- (void)dealloc;
@end

@implementation OS_nw_array

- (void)dealloc
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  if (!atomic_load((unsigned __int8 *)&self[5]))
  {
    isa = self[2].super.super.isa;
    if (isa)
    {
      Class v6 = self[3].super.super.isa;
      Class v7 = self[2].super.super.isa;
      if (v6 != isa)
      {
        Class v8 = self[3].super.super.isa;
        do
        {
          Class v10 = v8[-1].isa;
          --v8;
          Class v9 = v10;
          if (v10) {
            os_release(v9);
          }
          v6[-1].isa = 0LL;
          Class v6 = v8;
        }

        while (v8 != isa);
        Class v7 = self[2].super.super.isa;
      }

      self[3].super.super.isa = isa;
      operator delete(v7);
    }

    goto LABEL_12;
  }

  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  os_log_type_enabled((os_log_t)gLogObj, OS_LOG_TYPE_ERROR);
  int v14 = 136446210;
  v15 = "nw_array_dispose";
  int v12 = 12;
  v11 = &v14;
  v4 = (void *)_os_log_send_and_compose_impl();
  if (!__nwlog_abort((uint64_t)v4))
  {
    free(v4);
LABEL_12:
    v13.receiver = self;
    v13.super_class = (Class)&OBJC_CLASS___OS_nw_array;
    -[OS_nw_array dealloc](&v13, sel_dealloc, v11, v12);
    return;
  }

  __break(1u);
}

- (id)redactedDescription
{
  if (nwlog_get_sensitive_redacted::onceToken != -1) {
    dispatch_once(&nwlog_get_sensitive_redacted::onceToken, &__block_literal_global_59);
  }
  if (nwlog_get_sensitive_redacted::sensitiveRedacted)
  {
    if (self && (int64_t v3 = (char *)self[3].super.super.isa - (char *)self[2].super.super.isa, (unint64_t)v3 >= 8))
    {
      uint64_t v5 = v3 >> 3;
      Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL);
      nw_array_get_object_at_index((uint64_t)self, 0LL);
      Class v6 = (void *)objc_claimAutoreleasedReturnValue();
      Class v7 = @"<redacted>";
      if (v5 == 1)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          [v6 redactedDescription];
          Class v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }

        CFStringAppendFormat(Mutable, 0LL, @"[%zu - %@]", 0LL, v7);
      }

      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          [v6 redactedDescription];
          Class v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }

        CFStringAppendFormat(Mutable, 0LL, @"[%zu - %@", 0LL, v7);

        uint64_t v8 = 0LL;
        do
        {
          nw_array_get_object_at_index((uint64_t)self, v8 + 1);
          Class v9 = (void *)objc_claimAutoreleasedReturnValue();
          Class v10 = @"<redacted>";
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            [v9 redactedDescription];
            Class v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }

          if (v5 - 2 == v8) {
            CFStringAppendFormat(Mutable, 0LL, @", %zu - %@]", v8 + 1, v10);
          }
          else {
            CFStringAppendFormat(Mutable, 0LL, @", %zu - %@", v8 + 1, v10);
          }

          ++v8;
        }

        while (v5 - 1 != v8);
      }
    }

    else
    {
      Mutable = @"[]";
    }
  }

  else
  {
    -[OS_nw_array description](self, "description");
    Mutable = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return Mutable;
}

- (id)description
{
  if (self && (int64_t v3 = (char *)self[3].super.super.isa - (char *)self[2].super.super.isa, (unint64_t)v3 >= 8))
  {
    uint64_t v6 = v3 >> 3;
    Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL);
    uint64_t v7 = nw_array_get_object_at_index((uint64_t)self, 0LL);
    uint64_t v8 = (void *)v7;
    unint64_t v9 = v6 - 1;
    if (v6 == 1)
    {
      CFStringAppendFormat(Mutable, 0LL, @"[%zu - %@]", 0LL, v7);
    }

    else
    {
      CFStringAppendFormat(Mutable, 0LL, @"[%zu - %@", 0LL, v7);

      uint64_t v10 = 0LL;
      do
      {
        if (v6 - 2 == v10)
        {
          nw_array_get_object_at_index((uint64_t)self, v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          CFStringAppendFormat(Mutable, 0LL, @", %zu - %@]", v9, v11);
        }

        else
        {
          nw_array_get_object_at_index((uint64_t)self, v10 + 1);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          CFStringAppendFormat(Mutable, 0LL, @", %zu - %@", v10 + 1, v11);
        }

        ++v10;
      }

      while (v9 != v10);
    }
  }

  else
  {
    Mutable = @"[]";
  }

  return Mutable;
}

@end