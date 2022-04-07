program advanced_example
    use, intrinsic :: iso_c_binding, only : c_loc

    use :: derived_class_1_module, only : derived_class_1
    use :: derived_class_2_module, only : derived_class_2
    use :: wrapped_abc_module, only : wrapped_abstract_base_class
    use :: abc_cptr_module, only : abstract_base_class_c_wrapper, print_class_instance

    type(derived_class_1), target :: derived_1
    type(derived_class_2), target :: derived_2
    type(wrapped_abstract_base_class), target :: derived_1_wrapped
    type(wrapped_abstract_base_class), target :: derived_2_wrapped

    type(abstract_base_class_c_wrapper) :: derived_1_c_wrap
    type(abstract_base_class_c_wrapper) :: derived_2_c_wrap

    write(*,*) "Basic PRINT_ME."
    call derived_1%print_me()
    call derived_2%print_me()

    derived_1_wrapped%ptr => derived_1
    derived_2_wrapped%ptr => derived_2

    write(*,*) "Wrapped PRINT_ME."
    call derived_1_wrapped%ptr%print_me()
    call derived_2_wrapped%ptr%print_me()

    derived_1_c_wrap%cptr_to_class = c_loc(derived_1_wrapped)
    derived_2_c_wrap%cptr_to_class = c_loc(derived_2_wrapped)

    write(*,*) "C wrapped PRINT_ME."
    call print_class_instance(derived_1_c_wrap)
    call print_class_instance(derived_2_c_wrap)
end program advanced_example
