uint64_t auck_start()
{
  else {
    return 0LL;
  }
}

uint64_t auck_stop()
{
  else {
    return 0LL;
  }
}

uint64_t _start()
{
  if (_realmain) {
    return _realmain();
  }
  else {
    return 0LL;
  }
}

const char *OSKextGetCurrentIdentifier(void)
{
  return aComAppleSecuri;
}

const char *OSKextGetCurrentVersionString(void)
{
  return (const char *)&unk_8050;
}

OSKextLoadTag OSKextGetCurrentLoadTag(void)
{
  return dword_800C;
}

uint64_t _stop()
{
  if (_antimain) {
    return _antimain();
  }
  else {
    return 0LL;
  }
}

uint64_t auck_entitlements_retain(uint64_t a1)
{
  if (a1) {
    (*(void (**)(uint64_t))(*(void *)a1 + 32LL))(a1);
  }
  return a1;
}

uint64_t auck_entitlements_release(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result) {
    uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)result + 40LL))(result);
  }
  *a1 = 0LL;
  return result;
}

uint64_t auck_entitlements_serialize(const OSMetaClassBase *a1, void *a2, size_t *a3)
{
  v5 = OSMetaClassBase::safeMetaCast(a1, OSDictionary::metaClass);
  if (v5 && (v6 = v5, ((unsigned int (*)(OSMetaClassBase *))v5->__vftable[1].release_0)(v5)))
  {
    v7 = OSSerialize::binaryWithCapacity(0x80u, 0LL, 0LL);
    if (((unsigned int (*)(OSMetaClassBase *, OSSerialize *))v6->serialize)(v6, v7))
    {
      unsigned int v8 = ((uint64_t (*)(OSSerialize *))v7->getLength)(v7);
      size_t v9 = *a3;
      if (*a3 > v8) {
        size_t v9 = ((unsigned int (*)(OSSerialize *))v7->getLength)(v7);
      }
      v10 = (const void *)((uint64_t (*)(OSSerialize *))v7->text)(v7);
      memmove(a2, v10, v9);
      *a3 = ((unsigned int (*)(OSSerialize *))v7->getLength)(v7);
      goto LABEL_9;
    }

    if (v7) {
LABEL_9:
    }
      ((void (*)(OSSerialize *))v7->release_0)(v7);
  }

  else
  {
    *a3 = 0LL;
  }

  return 0LL;
}

BOOL auck_proc_has_entitlement(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = proc_task();
  return IOTaskHasEntitlement(v3, a2) != 0;
}

uint64_t auck_cred_label_system_init(int a1)
{
  __system_0 = a1;
  return 0LL;
}

os_ref_atomic_t *auck_cred_label_create()
{
  v0 = (os_ref_atomic_t *)IOMallocTypeImpl(&auck_cred_label_create_kalloc_type_view_44);
  v1 = v0;
  if (v0) {
    os_ref_init_count_external(v0, 0LL, 1u);
  }
  return v1;
}

os_ref_atomic_t *auck_cred_label_retain(os_ref_atomic_t *a1)
{
  if (a1) {
    os_ref_retain_external(a1, 0LL);
  }
  return a1;
}

uint64_t auck_cred_label_release(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result)
  {
    uint64_t result = os_ref_release_barrier_external((os_ref_atomic_t *)result, 0LL);
    if (!(_DWORD)result)
    {
      uint64_t result = auck_identity_release((uint64_t *)(*a1 + 8));
      if (*a1)
      {
        *a1 = 0LL;
        uint64_t result = IOFreeTypeImpl(&auck_cred_label_release_kalloc_type_view_68);
      }
    }
  }

  *a1 = 0LL;
  return result;
}

uint64_t auck_cred_label_update_cred(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = auck_cred_label_copy_from_label(a2);
  v5 = v3;
  if (v3) {
    auck_cred_label_associate_cred(v3, a1);
  }
  return auck_cred_label_release((uint64_t *)&v5);
}

os_ref_atomic_t *auck_cred_label_copy_from_label(uint64_t a1)
{
  if (!a1) {
    return 0LL;
  }
  v1 = (os_ref_atomic_t *)mac_label_get(a1, __system_0);
  v2 = v1;
  if (v1) {
    os_ref_retain_external(v1, 0LL);
  }
  return v2;
}

uint64_t auck_cred_label_associate_cred(os_ref_atomic_t *a1, uint64_t a2)
{
  uint64_t v7 = mac_label_get(*(void *)(a2 + 120), __system_0);
  uint64_t v4 = *(void *)(a2 + 120);
  uint64_t v5 = __system_0;
  if (a1) {
    os_ref_retain_external(a1, 0LL);
  }
  mac_label_set(v4, v5, a1);
  return auck_cred_label_release(&v7);
}

os_ref_atomic_t *auck_cred_label_copy_from_cred(os_ref_atomic_t *result)
{
  if (result) {
    return auck_cred_label_copy_from_label(*((void *)result + 15));
  }
  return result;
}

os_ref_atomic_t *auck_cred_label_copy_from_proc(proc *a1)
{
  uint64_t v5 = 0LL;
  v6 = (kauth_cred_t *)&v5;
  uint64_t v7 = 0x2000000000LL;
  kauth_cred_t v8 = 0LL;
  kauth_cred_t v8 = kauth_cred_proc_ref(a1);
  v1 = v6;
  kauth_cred_t v2 = v6[3];
  if (v2)
  {
    uint64_t v3 = auck_cred_label_copy_from_label((uint64_t)v2->cr_label);
    v1 = v6;
  }

  else
  {
    uint64_t v3 = 0LL;
  }

  kauth_cred_unref(v1 + 3);
  _Block_object_dispose(&v5, 8);
  return v3;
}

void auck_cred_label_associate_proc(os_ref_atomic_t *a1, proc_t procp)
{
  uint64_t v3 = 0LL;
  uint64_t v4 = (kauth_cred_t *)&v3;
  uint64_t v5 = 0x2000000000LL;
  kauth_cred_t v6 = 0LL;
  kauth_cred_t v6 = kauth_cred_proc_ref(procp);
  auck_cred_label_associate_cred(a1, (uint64_t)v4[3]);
  kauth_cred_unref(v4 + 3);
  _Block_object_dispose(&v3, 8);
}

uint64_t auck_cred_label_destroy_label(uint64_t a1)
{
  uint64_t v2 = mac_label_get(a1, __system_0);
  return auck_cred_label_release(&v2);
}

os_ref_atomic_t *auck_cred_label_copy_identity(uint64_t a1)
{
  return auck_identity_retain(*(os_ref_atomic_t **)(a1 + 8));
}

os_ref_atomic_t *auck_cred_label_set_identity(uint64_t a1, os_ref_atomic_t *a2)
{
  uint64_t result = auck_identity_retain(a2);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t auck_policy_syscall(proc *a1, int a2, user_addr_t uaddr)
{
  switch(a2)
  {
    case 0:
      uint64_t v5 = kauth_cred_get();
      user_addr_t v53 = 0LL;
      __int128 kaddr = 0u;
      *(_OWORD *)udaddr = 0u;
      uint64_t v6 = copyin(uaddr, &kaddr, 0x20uLL);
      if (!(_DWORD)v6)
      {
        size_t v7 = udaddr[0];
        user_addr_t v8 = udaddr[0] - 2552;
        if (udaddr[0] < 0x9F8 || udaddr[1] == 0)
        {
          uint64_t v6 = 22LL;
        }

        else
        {
          v32 = _copy_proc_for_pid_pidversion(kaddr, SDWORD2(kaddr));
          if (v32)
          {
            v33 = v32;
            v44 = 0LL;
            v45 = (uint64_t *)&v44;
            uint64_t v46 = 0x2000000000LL;
            kauth_cred_t v47 = 0LL;
            kauth_cred_t v47 = kauth_cred_proc_ref(v33);
            uid_t v34 = kauth_cred_getuid((kauth_cred_t)v45[3]);
            uid_t v35 = kauth_cred_getuid(v5);
            kauth_cred_unref((kauth_cred_t *)v45 + 3);
            _Block_object_dispose(&v44, 8);
            if (v35 != v34)
            {
              uint64_t v6 = 1LL;
            }

            else
            {
LABEL_54:
              v36 = auck_cred_label_copy_from_proc(v33);
              v44 = v36;
              if (v36) {
                uint64_t v37 = (uint64_t)auck_cred_label_copy_identity((uint64_t)v36);
              }
              else {
                uint64_t v37 = auck_identity_create_from_proc(v33);
              }
              uint64_t v40 = v37;
              auck_cred_label_release((uint64_t *)&v44);
              user_addr_t v53 = v40;
              if (v40 && (v41 = (size_t *)IOMallocData(v7)) != 0LL)
              {
                v42 = v41;
                v41[318] = v8;
                uint64_t v6 = auck_identity_serialize(v40, v41);
                if (!(_DWORD)v6) {
                  uint64_t v6 = copyout(v42, udaddr[1], v7);
                }
                IOFreeData(v42, v7);
              }

              else
              {
                uint64_t v6 = 12LL;
              }
            }

            proc_rele(v33);
          }

          else
          {
            uint64_t v6 = 3LL;
          }
        }
      }

      auck_identity_release((uint64_t *)&v53);
      return v6;
    case 1:
      v44 = 0LL;
      user_addr_t v53 = 0LL;
      __int128 kaddr = 0u;
      *(_OWORD *)udaddr = 0u;
      uint64_t v6 = copyin(uaddr, &kaddr, 0x20uLL);
      if (!(_DWORD)v6)
      {
        v10 = _copy_proc_for_pid_pidversion(kaddr, SDWORD2(kaddr));
        if (v10)
        {
          v11 = v10;
          v12 = _copy_proc_for_pid_pidversion(udaddr[0], udaddr[1]);
          if (v12)
          {
            v13 = v12;
            if (v11 != v12 || v11 == a1) {
              v15 = "com.apple.private.user-consent.override-root-identity";
            }
            else {
              v15 = "com.apple.private.user-consent.claim-root-identity-for-other";
            }
            if (v11 == a1 && v11 == v12) {
              v16 = "com.apple.private.user-consent.claim-root-identity-for-self";
            }
            else {
              v16 = v15;
            }
            if (auck_proc_has_entitlement((uint64_t)a1, (uint64_t)v16))
            {
              v17 = auck_cred_label_create();
              v44 = v17;
              if (v17
                && (v18 = v17,
                    v19 = (os_ref_atomic_t *)auck_identity_create_from_proc(v13),
                    (user_addr_t v53 = (user_addr_t)v19) != 0))
              {
                auck_cred_label_set_identity((uint64_t)v18, v19);
                auck_cred_label_associate_proc(v18, v11);
                uint64_t v6 = 0LL;
              }

              else
              {
                uint64_t v6 = 12LL;
              }
            }

            else
            {
              uint64_t v6 = 1LL;
            }

            proc_rele(v13);
          }

          else
          {
            uint64_t v6 = 3LL;
          }

          proc_rele(v11);
        }

        else
        {
          uint64_t v6 = 3LL;
        }
      }

      auck_identity_release((uint64_t *)&v53);
      v31 = (uint64_t *)&v44;
      goto LABEL_71;
    case 2:
      v52 = 0LL;
      user_addr_t v53 = 0LL;
      v50 = 0LL;
      v51 = 0LL;
      *(void *)&__int128 kaddr = 0LL;
      *((void *)&kaddr + 1) = &kaddr;
      udaddr[0] = 0x2000000000LL;
      udaddr[1] = 0LL;
      v44 = 0LL;
      v45 = (uint64_t *)&v44;
      uint64_t v46 = 0x2000000000LL;
      kauth_cred_t v47 = 0LL;
      if (!auck_proc_has_entitlement((uint64_t)a1, (uint64_t)"com.apple.private.user-consent.identity-set-hosted")
        && !auck_proc_has_entitlement((uint64_t)a1, (uint64_t)"com.apple.private.responsibility.set-hosted-path")
        && !auck_proc_has_entitlement((uint64_t)a1, (uint64_t)"com.apple.private.responsibility.set-hosted-properties"))
      {
        goto LABEL_47;
      }

      v20 = auck_cred_label_copy_from_proc(a1);
      v52 = v20;
      if (!v20) {
        goto LABEL_46;
      }
      uint64_t v21 = (uint64_t)v20;
      v22 = auck_cred_label_copy_identity((uint64_t)v20);
      v51 = v22;
      if (!v22) {
        goto LABEL_46;
      }
      uint64_t v23 = (uint64_t)v22;
      if (auck_identity_get_hosted_path(v23)) {
        goto LABEL_45;
      }
      uint64_t v6 = copyin(uaddr, &v53, 8uLL);
      if ((_DWORD)v6) {
        goto LABEL_48;
      }
      if (!v53) {
        goto LABEL_37;
      }
      v24 = (void *)IOMallocData(1024LL);
      *(void *)(*((void *)&kaddr + 1) + 24LL) = v24;
      if (!v24) {
        goto LABEL_83;
      }
      uint64_t v6 = copyinstr(v53, v24, 0x400uLL, (size_t *)v45 + 3);
      if ((_DWORD)v6) {
        goto LABEL_48;
      }
LABEL_37:
      v25 = auck_identity_clone(v23);
      v50 = v25;
      if (!v25) {
        goto LABEL_83;
      }
      v26 = v25;
      auck_identity_set_hosted_path((uint64_t)v25, *(void *)(*((void *)&kaddr + 1) + 24LL));
      goto LABEL_66;
    case 3:
      v52 = 0LL;
      user_addr_t v53 = 0LL;
      v50 = 0LL;
      v51 = 0LL;
      *(void *)&__int128 kaddr = 0LL;
      *((void *)&kaddr + 1) = &kaddr;
      udaddr[0] = 0x2000000000LL;
      udaddr[1] = 0LL;
      v44 = 0LL;
      v45 = (uint64_t *)&v44;
      uint64_t v46 = 0x2000000000LL;
      kauth_cred_t v47 = 0LL;
      if (!auck_proc_has_entitlement((uint64_t)a1, (uint64_t)"com.apple.private.user-consent.identity-set-hosted")
        && !auck_proc_has_entitlement((uint64_t)a1, (uint64_t)"com.apple.private.responsibility.set-hosted-properties"))
      {
LABEL_47:
        uint64_t v6 = 1LL;
        goto LABEL_48;
      }

      v27 = auck_cred_label_copy_from_proc(a1);
      v52 = v27;
      if (!v27
        || (uint64_t v21 = (uint64_t)v27, v28 = auck_cred_label_copy_identity((uint64_t)v27), (v51 = v28) == 0LL)
        || (uint64_t v29 = (uint64_t)v28, !auck_identity_proc_claims_root((uint64_t)v28, a1)))
      {
LABEL_46:
        uint64_t v6 = 22LL;
        goto LABEL_48;
      }

      if (auck_identity_get_hosted_team_id(v29))
      {
LABEL_45:
        uint64_t v6 = 37LL;
        goto LABEL_48;
      }

      uint64_t v6 = copyin(uaddr, &v53, 8uLL);
      if ((_DWORD)v6) {
        goto LABEL_48;
      }
      if (!v53) {
        goto LABEL_64;
      }
      v38 = (void *)IOMallocData(1024LL);
      *(void *)(*((void *)&kaddr + 1) + 24LL) = v38;
      if (!v38) {
        goto LABEL_83;
      }
      uint64_t v6 = copyinstr(v53, v38, 0x400uLL, (size_t *)v45 + 3);
      if (!(_DWORD)v6)
      {
LABEL_64:
        v39 = auck_identity_clone(v29);
        v50 = v39;
        if (v39)
        {
          v26 = v39;
          auck_identity_set_hosted_team_id((uint64_t)v39, *(void *)(*((void *)&kaddr + 1) + 24LL));
LABEL_66:
          auck_cred_label_set_identity(v21, v26);
          uint64_t v6 = 0LL;
        }

        else
        {
LABEL_83:
          uint64_t v6 = 12LL;
        }
      }

LABEL_48:
      uint64_t v30 = *(void *)(*((void *)&kaddr + 1) + 24LL);
      if (v30) {
        IOFreeData(v30, v45[3]);
      }
      _Block_object_dispose(&v44, 8);
      _Block_object_dispose(&kaddr, 8);
      auck_identity_release((uint64_t *)&v50);
      auck_identity_release((uint64_t *)&v51);
      v31 = (uint64_t *)&v52;
LABEL_71:
      auck_cred_label_release(v31);
      return v6;
    default:
      return 45LL;
  }
}

proc *_copy_proc_for_pid_pidversion(int a1, int a2)
{
  proc_t v3 = proc_find(a1);
  uint64_t v4 = v3;
  if (v3 && proc_pidversion(v3) != a2)
  {
    proc_rele(v4);
    return 0LL;
  }

  return v4;
}

uint64_t auck_identity_create_from_proc(proc *a1)
{
  uint64_t v2 = proc_getexecutableoffset();
  uint64_t result = proc_getexecutablevnode(a1);
  if (result)
  {
    uint64_t v4 = (vnode *)result;
    uint64_t v5 = auck_identity_create_from_running_executable(a1, result, v2, 0LL);
    vnode_put(v4);
    return (uint64_t)v5;
  }

  return result;
}

os_ref_atomic_t *auck_identity_create_from_running_executable(proc *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v27 = 0LL;
  v28 = &v27;
  uint64_t v29 = 0x2000000000LL;
  uint64_t v30 = 0LL;
  int v26 = 0;
  user_addr_t v8 = (os_ref_atomic_t *)IOMallocTypeImpl(&auck_identity_create_from_running_executable_kalloc_type_view_137);
  size_t v9 = v8;
  if (!v8) {
    goto LABEL_20;
  }
  os_ref_init_count_external(v8, 0LL, 1u);
  kauth_cred_t v10 = kauth_cred_proc_ref(a1);
  v28[3] = (uint64_t)v10;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 1107296256LL;
  uint64_t v23 = __auck_identity_create_from_running_executable_block_invoke;
  v24 = &__block_descriptor_tmp_3;
  v25 = &v27;
  *((void *)v9 + 5) = proc_uniqueid(a1);
  uint64_t v11 = v28[3];
  v9[2] = **(_DWORD **)(v11 + 128);
  v9[3] = *(_DWORD *)(v11 + 24);
  v9[4] = *(_DWORD *)(v11 + 40);
  v9[5] = *(_DWORD *)(v11 + 28);
  v9[6] = *(_DWORD *)(v11 + 104);
  v9[7] = proc_pid(a1);
  v9[8] = *(_DWORD *)(*(void *)(v11 + 128) + 36LL);
  v9[9] = proc_pidversion(a1);
  uid_t v12 = kauth_cred_getuid((kauth_cred_t)v28[3]);
  if (v12)
  {
    v13 = (ucred *)v28[3];
    int _resultp = 0;
    unsigned __int8 v14 = atomic_load(_kauth_resolver_is_available_use_resolver);
    if ((v14 & 1) != 0) {
      goto LABEL_4;
    }
    if (!kauth_cred_ismember_gid(v13, 0x3Du, &_resultp) && _resultp)
    {
      atomic_store(1u, _kauth_resolver_is_available_use_resolver);
LABEL_4:
      int v15 = 3;
      while (1)
      {
        int v16 = kauth_cred_uid2guid(v12, (guid_t *)v9 + 3);
        if (v16 != 35) {
          break;
        }
        if (!--v15) {
          goto LABEL_9;
        }
      }

      if (!v16) {
        goto LABEL_11;
      }
LABEL_9:
      _os_log_internal( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failed to resolve guid for uid %u: %d",  v12,  v16);
    }
  }

  v9[14] = -1431651397;
  *((void *)v9 + 6) = 0xCCCCDDDDEEEEFFFFLL;
  v9[15] = bswap32(v12);
LABEL_11:
  v9[632] = proc_platform(a1);
  v9[633] = proc_sdk(a1);
  *((void *)v9 + 318) = a3;
  uint64_t blob = csvnode_get_blob(a2, a3);
  if (blob)
  {
    uint64_t v18 = blob;
    uint64_t teamid = csblob_get_teamid();
    if (teamid) {
      __strncpy_chk(v9 + 272, teamid, 64LL, 64LL);
    }
    uint64_t identity = csblob_get_identity(v18);
    if (identity) {
      __strncpy_chk(v9 + 288, identity, 128LL, 128LL);
    }
    v9[634] = csblob_get_flags(v18);
    *((_BYTE *)v9 + 2540) = csblob_get_platform_binary(v18) != 0;
    *((void *)v9 + 320) = auck_entitlements_copy_from_csblob(v18);
  }

  int v26 = 1024;
  vn_getpath_fsenter(a2, v9 + 16, &v26);
  if (a4)
  {
    int v26 = 1024;
    vn_getpath_fsenter(a4, v9 + 320, &v26);
  }

  v23((uint64_t)v22);
LABEL_20:
  _Block_object_dispose(&v27, 8);
  return v9;
}

void __auck_identity_create_from_running_executable_block_invoke(uint64_t a1)
{
}

void __copy_helper_block_8_32r(uint64_t a1, uint64_t a2)
{
}

void __destroy_helper_block_8_32r(uint64_t a1)
{
}

os_ref_atomic_t *auck_identity_retain(os_ref_atomic_t *a1)
{
  if (a1) {
    os_ref_retain_external(a1, 0LL);
  }
  return a1;
}

uint64_t auck_identity_release(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result)
  {
    uint64_t result = os_ref_release_barrier_external((os_ref_atomic_t *)result, 0LL);
    if (!(_DWORD)result)
    {
      uint64_t result = auck_entitlements_release((uint64_t *)(*a1 + 2560));
      if (*a1)
      {
        *a1 = 0LL;
        uint64_t result = IOFreeTypeImpl(&auck_identity_release_kalloc_type_view_221);
      }
    }
  }

  *a1 = 0LL;
  return result;
}

os_ref_atomic_t *auck_identity_clone(uint64_t a1)
{
  uint64_t v2 = (os_ref_atomic_t *)IOMallocTypeImpl(&auck_identity_clone_kalloc_type_view_231);
  proc_t v3 = v2;
  if (v2)
  {
    os_ref_init_count_external(v2, 0LL, 1u);
    memmove(v3 + 2, (const void *)(a1 + 8), 0x9F8uLL);
    *((void *)v3 + 320) = auck_entitlements_retain(*(void *)(a1 + 2560));
  }

  return v3;
}

uint64_t auck_identity_get_pid(uint64_t a1)
{
  return *(unsigned int *)(a1 + 28);
}

BOOL auck_identity_proc_claims_root(uint64_t a1, proc_t a2)
{
  int v4 = *(_DWORD *)(a1 + 28);
  if (v4 != proc_pid(a2)) {
    return 0LL;
  }
  uint64_t v5 = *(void *)(a1 + 40);
  return v5 == proc_uniqueid(a2);
}

uint64_t auck_identity_get_hosted_path(uint64_t a1)
{
  uint64_t v1 = a1 + 1280;
  else {
    return 0LL;
  }
}

void auck_identity_set_hosted_path(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = (void *)(a1 + 1280);
  if (a2) {
    __strncpy_chk(v2, a2, 1024LL, 1024LL);
  }
  else {
    bzero(v2, 0x400uLL);
  }
}

uint64_t auck_identity_get_hosted_team_id(uint64_t a1)
{
  uint64_t v1 = a1 + 2304;
  else {
    return 0LL;
  }
}

double auck_identity_set_hosted_team_id(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = (_OWORD *)(a1 + 2304);
  if (a2)
  {
    __strncpy_chk(v2, a2, 64LL, 64LL);
  }

  else
  {
    double result = 0.0;
    v2[2] = 0u;
    v2[3] = 0u;
    _OWORD *v2 = 0u;
    v2[1] = 0u;
  }

  return result;
}

uint64_t auck_identity_serialize(uint64_t a1, size_t *__dst)
{
  size_t v4 = __dst[318];
  memmove(__dst, (const void *)(a1 + 8), 0x9F8uLL);
  __dst[318] = v4;
  return auck_entitlements_serialize(*(const OSMetaClassBase **)(a1 + 2560), __dst + 319, __dst + 318);
}

uint64_t auck_mac_policy_init()
{
  unk_8110 = 0u;
  unk_8100 = 0u;
  xmmword_80F0 = 0u;
  unk_8130 = 0LL;
  unk_8140 = 0LL;
  unk_8138 = 0LL;
  unk_8160 = 0u;
  unk_8170 = 0u;
  bzero(&unk_8190, 0x300uLL);
  xmmword_84A0 = 0u;
  unk_84B0 = 0u;
  bzero(&unk_84C8, 0x6A0uLL);
  unk_8120 = _hook_cred_check_label_update_execve;
  unk_8128 = _hook_cred_check_label_update;
  unk_8148 = _hook_cred_label_associate;
  unk_8150 = 0LL;
  unk_8158 = _hook_cred_label_destroy;
  unk_8180 = _hook_cred_label_update_execve;
  unk_8188 = _hook_cred_label_update;
  qword_8490 = (uint64_t)_hook_policy_initbsd;
  qword_8498 = (uint64_t)auck_policy_syscall;
  qword_84C0 = (uint64_t)_hook_proc_notify_exec_complete;
  qword_8B68 = (uint64_t)"AppleUserConsent";
  qword_8B70 = (uint64_t)"AppleUserConsent Policy";
  qword_8B78 = 0LL;
  dword_8B80 = 0;
  qword_8B88 = (uint64_t)&xmmword_80F0;
  dword_8B90 = 0;
  qword_8B98 = (uint64_t)&dword_8BB8;
  dword_8BA0 = 0;
  qword_8BB0 = 0LL;
  qword_8BA8 = 0LL;
  int v0 = mac_policy_register(&qword_8B68, &dword_80EC, 0LL);
  if (v0) {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "mac_policy_register failed: %d", v0);
  }
  else {
    __policy = 1;
  }
  uint64_t v1 = auck_cred_label_system_init(dword_8BB8);
  uint64_t v2 = v1;
  if ((_DWORD)v1) {
    _os_log_internal( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "auck_cred_label_system_init failed: %d",  v1);
  }
  return v2;
}

BOOL _hook_cred_check_label_update_execve( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return a9 != 0;
}

uint64_t _hook_cred_check_label_update(os_ref_atomic_t *a1, uint64_t a2)
{
  proc_t v3 = auck_cred_label_copy_from_cred(a1);
  size_t v9 = v3;
  size_t v4 = auck_cred_label_copy_from_label(a2);
  user_addr_t v8 = v4;
  if (v4) {
    BOOL v5 = v3 == v4;
  }
  else {
    BOOL v5 = 1;
  }
  uint64_t v6 = !v5;
  auck_cred_label_release((uint64_t *)&v8);
  auck_cred_label_release((uint64_t *)&v9);
  return v6;
}

uint64_t _hook_cred_label_associate(os_ref_atomic_t *a1, uint64_t a2)
{
  proc_t v3 = auck_cred_label_copy_from_cred(a1);
  BOOL v5 = v3;
  if (v3) {
    auck_cred_label_associate_cred(v3, a2);
  }
  return auck_cred_label_release((uint64_t *)&v5);
}

uint64_t _hook_cred_label_update_execve( uint64_t a1, uint64_t a2, proc *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, unint64_t a12)
{
  if (!a11) {
    return 0LL;
  }
  if (a12 >= 0xC && *(_DWORD *)a11 == 1 && *(_DWORD *)(a11 + 4) == 12)
  {
    if ((*(_BYTE *)(a11 + 8) & 1) != 0)
    {
      v20 = 0LL;
      unsigned __int8 v14 = auck_identity_create_from_running_executable(a3, a4, a5, a6);
      uint64_t v21 = v14;
      if (v14)
      {
        int v15 = v14;
        int v16 = auck_cred_label_create();
        v20 = v16;
        if (v16)
        {
          v17 = v16;
          auck_cred_label_set_identity((uint64_t)v16, v15);
          auck_cred_label_associate_cred(v17, a2);
          uint64_t pid = auck_identity_get_pid((uint64_t)v15);
          proc_set_responsible_pid(a3, pid);
        }
      }

      auck_cred_label_release((uint64_t *)&v20);
      auck_identity_release((uint64_t *)&v21);
    }

    return 0LL;
  }

  return 22LL;
}

uint64_t _hook_cred_label_update(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return auck_cred_label_update_cred(a1, a2);
  }
  return a1;
}

void _hook_policy_initbsd()
{
}

uint64_t _hook_proc_notify_exec_complete(proc *a1)
{
  if (auck_proc_has_entitlement((uint64_t)a1, (uint64_t)"com.apple.private.user-consent.claim-root-identity-at-launch")
    || (uint64_t result = auck_proc_has_entitlement( (uint64_t)a1,  (uint64_t)"com.apple.private.responsibility.set-to-self.at-launch"),  (_DWORD)result))
  {
    kauth_cred_t v10 = 0LL;
    uint64_t v3 = auck_identity_create_from_proc(a1);
    uint64_t v11 = v3;
    if (v3)
    {
      size_t v4 = (os_ref_atomic_t *)v3;
      BOOL v5 = auck_cred_label_create();
      kauth_cred_t v10 = v5;
      if (v5)
      {
        uint64_t v6 = v5;
        auck_cred_label_set_identity((uint64_t)v5, v4);
        auck_cred_label_associate_proc(v6, a1);
        uint64_t pid = auck_identity_get_pid((uint64_t)v4);
        proc_set_responsible_pid(a1, pid);
      }

      else
      {
        int v9 = proc_pid(a1);
        _os_log_internal( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Failed to create cred label for proc %d",  v9);
      }
    }

    else
    {
      int v8 = proc_pid(a1);
      _os_log_internal( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Failed to create identity for proc %d",  v8);
    }

    auck_cred_label_release((uint64_t *)&v10);
    return auck_identity_release(&v11);
  }

  return result;
}

uint64_t auck_mac_policy_deinit()
{
  uint64_t result = mac_policy_unregister(dword_80EC);
  if (!(_DWORD)result)
  {
    __policy = 0;
    dword_80EC = 0;
  }

  return result;
}